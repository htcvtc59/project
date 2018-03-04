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
import com.mongodb.client.model.UpdateOptions;
import static com.mongodb.client.model.Updates.combine;
import static com.mongodb.client.model.Updates.set;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "servletAccountKit", urlPatterns = {"/accountkit"})
public class servletAccountKit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = request.getParameter("status");
        String code = request.getParameter("code");
        String state = request.getParameter("state");

        HttpSession session = request.getSession();
        String objclient = (String) session.getAttribute("objclient");
        JsonObject object = new Gson().fromJson(objclient, JsonObject.class);
        JsonObject jobjphone = object.get("phone").getAsJsonObject();
        String phonename = jobjphone.get("name").getAsString();
        JsonObject jobjid = object.get("_id").getAsJsonObject();
        String clientid = jobjid.get("$oid").getAsString();
        System.out.println(phonename + "\n" + clientid + "\n" + object);

        System.out.println(status + "\n" + code + "\n" + state);
        if (status.equals("PARTIALLY_AUTHENTICATED") && state.equals("452266c718a9e6219c861efea01f5fe6")
                && objclient != null) {

            new dbs().getcolclient.updateOne(eq("_id", new ObjectId(clientid)),
                    combine(set("phone.status", 1)), new UpdateOptions().upsert(true)
                    .bypassDocumentValidation(true));

            MongoCursor<Document> cursor = new dbs().getcolclient
                    .find(and(eq("_id", new ObjectId(clientid)), eq("status", 1)))
                    .iterator();
            if (cursor.hasNext()) {
                session.removeAttribute("objclient");
                session.setAttribute("objclient", cursor.next().toJson());
            }
            response.sendRedirect("http://localhost:8084/accountdetail.jsp");

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
