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
import com.mongodb.util.JSON;
import java.util.Arrays;
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

        if (idpro.length() > 0 && idpro != null) {
            
            

            MongoCursor<Document> doc = new dbs().getcolproduct.aggregate(
                    Arrays.asList(
                            Aggregates.lookup("colclient", "clientid", "_id", "colclient"),
                            Aggregates.match(Filters.eq("_id", 
                                    new BsonObjectId(new ObjectId(idpro))))
                     ) 
            ).iterator();
            
//                    new dbs().getcolproduct
//                    .find(eq("_id", new BsonObjectId(new ObjectId(idpro)))).iterator();

            request.setAttribute("datadetail", doc);
            RequestDispatcher rd = request.getRequestDispatcher("products_detail.jsp");
            rd.forward(request, response);

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
