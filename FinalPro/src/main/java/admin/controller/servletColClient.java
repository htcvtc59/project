/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.controller;

import admin.connectdb.dbs;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoCursor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.BsonInt32;
import org.bson.BsonString;
import org.bson.Document;
import org.bson.types.ObjectId;

/**
 *
 * @author osx
 */
@WebServlet(name = "servletColClient", urlPatterns = {"/admin/colclient"})
public class servletColClient extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String col = request.getParameter("col");
        if (col.equals("data")) {

            MongoCursor<Document> cursor = new dbs().getcolclient.find().iterator();

            request.setAttribute("datacol", cursor);

            RequestDispatcher rd = request.getRequestDispatcher("colclient.jsp");
            rd.forward(request, response);

        }

        if (col.equals("delete")) {
            String id = request.getParameter("id");
            if (id != null) {
                new dbs().getcolclient.deleteOne(new Document("_id", new ObjectId(id)));
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String col = request.getParameter("col");
        if (col.equals("status")) {
            String id = request.getParameter("id");
            String status = request.getParameter("status");
            
            BasicDBObject doc = new BasicDBObject();
                doc.append("$set", 
                        new BasicDBObject("status", new BsonInt32(Integer.valueOf(status))));

                new dbs().getcolclient.updateOne(new BasicDBObject()
                        .append("_id", new ObjectId(id)), doc);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
