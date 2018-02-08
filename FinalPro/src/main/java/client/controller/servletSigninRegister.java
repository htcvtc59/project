/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import admin.connectdb.dbs;
import client.captcha.VerifyRecaptcha;
import client.mail.Mailer;
import static client.tools.GoogleAuthenticatorDemo.getGoogleAuthenticatorBarCode;
import static client.tools.GoogleAuthenticatorDemo.getRandomSecretKey;
import static client.tools.GoogleAuthenticatorDemo.getTOTPCode;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.mongodb.BasicDBObject;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.BsonDouble;
import org.bson.BsonInt32;
import org.bson.BsonString;
import org.bson.Document;

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

        if (action.equals("validateemail") && request.getParameter("jwt") != null
                && request.getParameter("email") != null) {

            try {
                DecodedJWT jwt = JWT.decode(request.getParameter("jwt"));

                //update confirm email oke
                BasicDBObject doc = new BasicDBObject();
                doc.append("$set", new BasicDBObject()
                        .append("email", new BasicDBObject("status", new BsonInt32(1))));

                new dbs().getcolclient.updateOne(new BasicDBObject()
                        .append("email", new BasicDBObject("name", request.getParameter("email"))), doc);

                request.getRequestDispatcher("accountalidateoke.jsp").forward(request, response);

            } catch (JWTDecodeException exception) {
                //Invalid token
                request.getRequestDispatcher("accountalidatefail.jsp").forward(request, response);

            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

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
                    HttpSession session = request.getSession();
                    String firstname = (String) session.getAttribute("firstname");
                    String lastname = (String) session.getAttribute("lastname");
                    String username = (String) session.getAttribute("username");
                    String email = (String) session.getAttribute("email");
                    String password = (String) session.getAttribute("password");
                    String password_confirm = (String) session.getAttribute("password_confirm");
                    String phone = (String) session.getAttribute("phone");
                    String address = (String) session.getAttribute("address");

//                  Insert data to db
                    
                    Document doc = new Document("name", new BsonString(firstname + " " + lastname))
                            .append("username", new BsonString(username))
                            .append("password", new BsonString(password))
                            .append("phone",
                                    new Document("name", new BsonString(phone))
                                            .append("status", new BsonInt32(0)))
                            .append("email",
                                    new Document("name", new BsonString(email))
                                            .append("status", new BsonInt32(0)))
                            .append("address", new BsonString(address))
                            .append("option",
                                    new Document("idaccount", new BsonString(""))
                                            .append("idcard", new BsonString(""))
                                            .append("money", new BsonDouble(0.0)))
                            .append("status", new BsonInt32(1));
                    new dbs().getcolclient.insertOne(doc);
                    System.out.println(doc.toJson());

//                  Send Mail validation
                    ServletContext servletContext = this.getServletContext();
                    String emailuser = servletContext.getInitParameter("emailuser");
                    String emailpass = servletContext.getInitParameter("emailpass");

                    String urljwtemail = "http://localhost:8080/register?action=validateemail&email=" + email + "&jwt=";

                    try {
                        Algorithm algorithm = Algorithm.HMAC256(email);
                        urljwtemail += JWT.create()
                                .withIssuer("auth0")
                                .sign(algorithm);

                    } catch (UnsupportedEncodingException exception) {
                        //UTF-8 encoding not supported
                    } catch (JWTCreationException exception) {
                        //Invalid Signing configuration / Couldn't convert Claims.
                    }

                    System.out.println(urljwtemail + "tokencode");
                    String content = Mailer.HtmlContent(urljwtemail, email);

                    Mailer.send(emailuser, emailpass, email, "Confirm Email Auction", "Auction", content);

                    session.removeAttribute("firstname");
                    session.removeAttribute("lastname");
                    session.removeAttribute("username");
                    session.removeAttribute("email");
                    session.removeAttribute("password");
                    session.removeAttribute("password_confirm");
                    session.removeAttribute("phone");
                    session.removeAttribute("address");

                    request.getRequestDispatcher("accountalidatesuccess.jsp").forward(request, response);

                } else {
                    HttpSession session = request.getSession();
                    String email = (String) session.getAttribute("email");
                    String barCode = getGoogleAuthenticatorBarCode(secretKey, email, "Company");
                    request.setAttribute("barCode", barCode);
                    request.getRequestDispatcher("accountalidatevqr.jsp").forward(request, response);
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
