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
import com.mongodb.util.JSON;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
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

@WebServlet(name = "servletDoneProduct", urlPatterns = {"/servletDoneProduct"})
public class servletDoneProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String done = request.getParameter("done");

        if (done != null && done.equals("donedata")) {

            String result = JSON.serialize(new dbs().getcolproduct.aggregate(
                    Arrays.asList(
                            Aggregates.lookup("colbid", "winner.idwinbid", "_id", "colbid"),
                            skip(0), limit(3),
                            Aggregates.match(Filters.eq("status", 3))
                    )
            ));
//            String result = JSON.serialize(new dbs().getcolproduct
//                    .find(eq("status", new BsonInt32(3))).skip(0).limit(3));
//                       Aggregates.match(Filters.eq("_id",new BsonObjectId(new ObjectId(iddone))))

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(result);

        }

        String pageac = request.getParameter("pageac");
        String pageskip = request.getParameter("pageskip");

        if (pageac != null && pageac.equals("pagination") && pageskip != null) {
            int skip = Integer.parseInt(pageskip);

            String result = JSON.serialize(new dbs().getcolproduct.aggregate(
                    Arrays.asList(
                            Aggregates.lookup("colbid", "winner.idwinbid", "_id", "colbid"),
                            skip(skip), limit(3),
                            Aggregates.match(Filters.eq("status", 3))
                    )
            ));

//            String result = JSON.serialize(new dbs().getcolproduct
//                    .find(eq("status", new BsonInt32(3))).skip(skip).limit(3));
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(result);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String donedata = request.getParameter("donedata");
        String id = request.getParameter("id");

        if (donedata != null && donedata.equals("donedataclickmodal") && id != null) {

            String result = JSON.serialize(new dbs().getcolproduct.aggregate(
                    Arrays.asList(
                            Aggregates.lookup("colbid", "winner.idwinbid", "_id", "colbid"),
                            Aggregates.match(Filters.eq("status", 3)),
                            Aggregates.match(Filters.eq("_id", new BsonObjectId(new ObjectId(id))))
                    )
            ));

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(result);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
