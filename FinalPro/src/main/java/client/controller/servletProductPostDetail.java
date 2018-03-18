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
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Sorts.ascending;
import static com.mongodb.client.model.Sorts.orderBy;
import com.mongodb.util.JSON;
import java.io.IOException;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.BsonObjectId;
import org.bson.Document;
import org.bson.types.ObjectId;

/**
 *
 * @author osx
 */
@WebServlet(name = "servletProductPostDetail", urlPatterns = {"/servletProductPostDetail"})
public class servletProductPostDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String post = request.getParameter("post");
        HttpSession session = request.getSession();
        String objclient = (String) session.getAttribute("objclient");
        JsonObject object = new Gson().fromJson(objclient, JsonObject.class);

        JsonObject jobjid = object.get("_id").getAsJsonObject();
        String clientid = jobjid.get("$oid").getAsString();

        if (post.equals("postdetail") && post != null && clientid != null) {

            String result = JSON.serialize(new dbs().getcolproduct.aggregate(
                    Arrays.asList(
                            Aggregates.lookup("colclient", "clientid", "_id", "colclient"),
                            Aggregates.sort(orderBy(ascending("winner.idwinbid"))),
                            Aggregates.match(Filters.eq("clientid",
                                    new BsonObjectId(new ObjectId(clientid)))),
                            Aggregates.match(Filters.eq("status", 3))
                    )
            ));

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(result);

        }
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String repost = request.getParameter("repost");
        String id = request.getParameter("id");

        if (repost.equals("repost") && repost != null && id != null) {

            MongoCursor<Document> doc = new dbs().getcolproduct
                    .find(and(eq("_id", new ObjectId(id)),
                            eq("status", 3))).iterator();
            System.out.println(repost+id);

            request.setAttribute("dtpostd", doc);
            RequestDispatcher rd = request.getRequestDispatcher("createproduct.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
