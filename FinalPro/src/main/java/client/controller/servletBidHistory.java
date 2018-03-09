/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import admin.connectdb.dbs;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mongodb.client.MongoCursor;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import com.mongodb.client.model.Sorts;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.BsonInt32;
import org.bson.BsonObjectId;
import org.bson.Document;
import org.bson.types.ObjectId;

/**
 *
 * @author osx
 */
@WebServlet(name = "servletBidHistory", urlPatterns = {"/servletBidHistory"})
public class servletBidHistory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action != null && action.equals("bid")) {
            HttpSession session = request.getSession();
            String objclient = (String) session.getAttribute("objclient");
            JsonObject object = new Gson().fromJson(objclient, JsonObject.class);
            JsonObject jobjid = object.get("_id").getAsJsonObject();
            String clientid = jobjid.get("$oid").getAsString();
            if (clientid != null) {

                MongoCursor<Document> cursor = new dbs().getcolbid
                        .find(and(eq("idclient", new BsonObjectId(new ObjectId(clientid))),
                                eq("status", new BsonInt32(1))))
                        .sort(Sorts.descending("createddate")).iterator();

                request.setAttribute("bidhis", cursor);

                RequestDispatcher rd = request.getRequestDispatcher("bidhistory.jsp");
                rd.forward(request, response);

            } else {
                response.sendRedirect("signin.jsp");
            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
