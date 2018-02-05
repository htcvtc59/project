/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.controller;

import admin.connectdb.dbs;
import com.mongodb.Function;
import com.mongodb.client.MongoCursor;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.Document;

@WebServlet(name = "servletLoginLogout", urlPatterns = {"/admin/loginadmin", "/admin/logoutadmin"})
public class servletLoginLogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("username");
        request.getRequestDispatcher("login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && password != null) {
            Document doc = new Document("username", username)
                    .append("password", password);
            MongoCursor cursor = new dbs().getcoladmin.find(doc).iterator();
            if (cursor.hasNext()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
