package admin.controller;

import admin.connectdb.dbs;
import com.mongodb.client.MongoCursor;
import org.bson.Document;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "servletColadmin", urlPatterns = {"/admin/col_admin.jsp"})
public class servletColadmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String col = request.getParameter("col");

        if (col.equals("update")) {

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String col = request.getParameter("col");
        if (col.equals("data")) {

            MongoCursor<Document> cursor = dbs.getcoladmin().find().iterator();

            request.setAttribute("datacol", cursor);

            request.getRequestDispatcher("col_admin.jsp").forward(request, response);


        }


    }
}
