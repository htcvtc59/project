/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.captcha;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "servletSigninRegister", urlPatterns = {"/signin","/register"})
public class servletSigninRegister extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action.equals("register")) {
            HttpSession session = request.getSession();
            session.removeAttribute("usernameclient");
            request.getRequestDispatcher("index.jsp").forward(request, response);
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

        if (action == null) {
            response.sendRedirect("signin.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
