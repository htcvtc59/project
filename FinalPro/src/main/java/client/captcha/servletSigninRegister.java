/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.captcha;

import client.mail.Mailer;
import static client.tools.GoogleAuthenticatorDemo.createQRCode;
import static client.tools.GoogleAuthenticatorDemo.getGoogleAuthenticatorBarCode;
import static client.tools.GoogleAuthenticatorDemo.getRandomSecretKey;
import static client.tools.GoogleAuthenticatorDemo.getTOTPCode;
import com.google.zxing.WriterException;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "servletSigninRegister", urlPatterns = {"/signin", "/register"})
public class servletSigninRegister extends HttpServlet {

    String secretKey = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action.equals("logout")) {
            HttpSession session = request.getSession();
            session.removeAttribute("usernameclient");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

        if (action.equals("validateemail")) {
            System.out.println("validateemail");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        System.out.println(action);

        if (action.equals("signin")) {

            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

            String user = request.getParameter("username");
            String pass = request.getParameter("password");

            boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);

            if (verify && user != null && pass != null) {

                if (user.equals("admin") && pass.equals("admin")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("usernameclient", user);

                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("signin.jsp");
                }
            } else {
                response.sendRedirect("signin.jsp");
            }

        }

        if (action.equals("register")) {
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String password_confirm = request.getParameter("password_confirm");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            if (firstname != null && lastname != null && username != null && email != null
                    && password != null && password_confirm != null && phone != null && address != null) {

                // required for generating the PNG file on a server with no graphics hardware
                System.setProperty("java.awt.headless", "true");

                secretKey = getRandomSecretKey();
                String barCode = getGoogleAuthenticatorBarCode(secretKey, email, "Company");
                String tmpDir = System.getProperty("java.io.tmpdir");
                if (!tmpDir.endsWith(File.separator)) {
                    tmpDir += File.separator;
                }
//                String qrCodePath = tmpDir + "2fa-qr-code.png";
//                String qrCodePath = "/Users/apple/NetBeansProjects/FinalPro/src/main/webapp/" + "2fa-qr-code.png";
//                createQRCode(barCode, qrCodePath, 400, 400);
//                request.setAttribute("nameqr", "2fa-qr-code.png");

                HttpSession session = request.getSession();
                session.setAttribute("firstname", firstname);
                session.setAttribute("lastname", lastname);
                session.setAttribute("username", username);
                session.setAttribute("email", email);
                session.setAttribute("password", password);
                session.setAttribute("password_confirm", password_confirm);
                session.setAttribute("phone", phone);
                session.setAttribute("address", address);
                session.setMaxInactiveInterval(300);

                request.setAttribute("barCode", barCode);
                request.getRequestDispatcher("accountalidatevqr.jsp").forward(request, response);

                System.out.println("\nConfigure the Google Authenticator App by scanning the following QR code image:\n");
//                System.out.println(qrCodePath + "\n");
                System.out.println("or by manually entering the secret key:\n");
                System.out.println(secretKey + "\n");
                System.out.println("Then verify that the 6 digit codes generated by Google Authenticator\n"
                        + "are synchronized with the following (ctrl-c to exit at any time):\n");

            }

        }

        if (action.equals("validate")) {
            String code = request.getParameter("code");
            if (code != null) {
                String codes = getTOTPCode(secretKey);
                if (code.equals(codes)) {
                    System.out.println(code + "true");
                    HttpSession session = request.getSession();
                    String firstname = (String) session.getAttribute("firstname");
                    String lastname = (String) session.getAttribute("lastname");
                    String username = (String) session.getAttribute("username");
                    String email = (String) session.getAttribute("email");
                    String password = (String) session.getAttribute("password");
                    String password_confirm = (String) session.getAttribute("password_confirm");
                    String phone = (String) session.getAttribute("phone");
                    String address = (String) session.getAttribute("address");

                    System.out.println(firstname + lastname + email + username + password);

                    ServletContext servletContext = this.getServletContext();
                    String emailuser = servletContext.getInitParameter("emailuser");
                    String emailpass = servletContext.getInitParameter("emailpass");
                    
                    String urljwtemail = "";
                    String content = Mailer.HtmlContent(urljwtemail, email);

                    Mailer.send(emailuser, emailpass, "htcvtc59@gmail.com", "Confirm Email Auction", "Auction", content);
                    response.sendRedirect("accountalidatesuccess.jsp");

                    session.removeAttribute("firstname");
                    session.removeAttribute("lastname");
                    session.removeAttribute("username");
                    session.removeAttribute("email");
                    session.removeAttribute("password");
                    session.removeAttribute("password_confirm");
                    session.removeAttribute("phone");
                    session.removeAttribute("address");

                }
            }

        }

        if (action == null) {
            response.sendRedirect("signin.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
