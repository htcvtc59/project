/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import admin.connectdb.dbs;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Filters.gt;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;
import static com.mongodb.client.model.Filters.lte;
import com.mongodb.client.model.Sorts;
import java.util.Date;
import org.bson.BsonDateTime;
import org.bson.BsonInt32;
import org.bson.BsonObjectId;
import org.bson.types.ObjectId;

/**
 *
 * @author osx
 */
@WebServlet(name = "servletDetailProduct", urlPatterns = {"/servletDetailProduct"})
public class servletDetailProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idpro = request.getParameter("detail");
        System.out.println(idpro);
        String idprodetailbid = request.getParameter("detailbid");
        
        if (idprodetailbid.length() > 0 && idprodetailbid != null) {
            
            
        
        
        }
        
        if (idpro.length() > 0 && idpro != null) {
            MongoCursor<Document> probid = new dbs().getcolbid
                    .find(and(eq("idproduct", new BsonObjectId(new ObjectId(idpro))),
                            eq("status", new BsonInt32(1))))
                    .sort(Sorts.descending("startprice")).iterator();

            MongoCursor<Document> prodoing = new dbs().getcolproduct
                    .find(and(lte("timebegin", new BsonDateTime(new Date().getTime())),
                            gt("timeend", new BsonDateTime(new Date().getTime())),
                            eq("status", new BsonInt32(1)),
                            eq("_id", new BsonObjectId(new ObjectId(idpro))))).iterator();

            MongoCursor<Document> prodone = new dbs().getcolproduct
                    .find(and(eq("status", new BsonInt32(3))
                            ,eq("_id", new BsonObjectId(new ObjectId(idpro))))).iterator();

            if (prodoing.hasNext()) {
                Document doc = prodoing.next();
                request.setAttribute("datadetaildoing", doc);
                RequestDispatcher rd = request.getRequestDispatcher("products_detail_bid.jsp");
                rd.forward(request, response);
            }

            if (prodone.hasNext()) {
                Document doc = prodone.next();
                request.setAttribute("datadetaildone", doc);
                RequestDispatcher rd = request.getRequestDispatcher("products_detail_bid.jsp");
                rd.forward(request, response);

            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
