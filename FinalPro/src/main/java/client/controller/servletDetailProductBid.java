/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import admin.connectdb.dbs;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Aggregates;
import static com.mongodb.client.model.Aggregates.limit;
import static com.mongodb.client.model.Aggregates.skip;
import com.mongodb.client.model.Filters;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Filters.gt;
import static com.mongodb.client.model.Filters.lte;
import com.mongodb.client.model.Sorts;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.BsonDateTime;
import org.bson.BsonInt32;
import org.bson.BsonObjectId;
import org.bson.Document;
import org.bson.types.ObjectId;

/**
 *
 * @author osx
 */
@WebServlet(name = "servletDetailProductBid", urlPatterns = {"/servletDetailProductBid"})
public class servletDetailProductBid extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idprodetailbid = request.getParameter("detailbid");
        System.out.println(idprodetailbid);

        if (idprodetailbid.length() > 0 && idprodetailbid != null) {
            System.out.println("sssss");

            MongoCursor<Document> probid = new dbs().getcolbid
                    .find(and(eq("idproduct", new BsonObjectId(new ObjectId(idprodetailbid))),
                            eq("status", new BsonInt32(1))))
                    .sort(Sorts.descending("startprice")).iterator();
            System.out.println(probid);

            MongoCursor<Document> prodoing = new dbs().getcolproduct
                    .find(and(lte("timebegin", new BsonDateTime(new Date().getTime())),
                            gt("timeend", new BsonDateTime(new Date().getTime())),
                            eq("status", new BsonInt32(1)),
                            eq("_id", new BsonObjectId(new ObjectId(idprodetailbid))))).iterator();
            System.out.println(prodoing);

           MongoCursor<Document> prodone =
                    new dbs().getcolproduct.aggregate(
                    Arrays.asList(
                            Aggregates.lookup("colbid", "winner.idwinbid", "_id", "colbid"),
                            Aggregates.match(Filters.eq("_id",
                                new BsonObjectId(new ObjectId(idprodetailbid)))),
                            Aggregates.match(Filters.eq("status", 3))
                    )
            ).iterator();

            System.out.println(prodone);

            if (prodoing.hasNext()) {
                Document doc = prodoing.next();
                request.setAttribute("datadetaildoing", doc);
                request.setAttribute("probid", probid);
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
