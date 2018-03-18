/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.controller;

import admin.connectdb.dbs;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Sorts;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.BsonInt32;
import org.bson.BsonNumber;
import org.bson.Document;
import org.bson.types.ObjectId;

/**
 *
 * @author osx
 */
@WebServlet(name = "servletColProduct", urlPatterns = {"/admin/colproduct"})
public class servletColProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String col = request.getParameter("col");
        if (col.equals("data")) {

            MongoCursor<Document> cursor = new dbs().getcolproduct.find()
                    .sort(Sorts.descending("createddate")).iterator();

            request.setAttribute("datacol", cursor);

            RequestDispatcher rd = request.getRequestDispatcher("colproduct.jsp");
            rd.forward(request, response);

        }

        if (col.equals("delete")) {
            String id = request.getParameter("id");
            if (id != null) {
                new dbs().getcolproduct.deleteOne(new Document("_id", new ObjectId(id)));
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String col = request.getParameter("col");
        String status = request.getParameter("status");
        String id = request.getParameter("id");
        if (col.equals("status") && status != null && id != null) {
            System.out.println(status+"\n"+id);
            BasicDBObject bsid = new BasicDBObject("_id", new ObjectId(id));
            BasicDBObject bsdata = new BasicDBObject();
                bsdata.append("$set", 
                        new BasicDBObject("status", new BsonInt32(Integer.valueOf(status))));
            new dbs().getcolproduct.updateOne(bsid, bsdata);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
