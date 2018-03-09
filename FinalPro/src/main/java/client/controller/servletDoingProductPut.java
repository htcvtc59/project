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
import static com.mongodb.client.model.Filters.gt;
import com.mongodb.client.model.Sorts;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.BsonDateTime;
import org.bson.BsonDouble;
import org.bson.BsonInt32;
import org.bson.BsonObjectId;
import org.bson.Document;
import org.bson.types.ObjectId;

@WebServlet(name = "servletDoingProductPut", urlPatterns = {"/servletDoingProductPut"})
public class servletDoingProductPut extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String doing = request.getParameter("do");
        String doingvalue = request.getParameter("value");
        String idproduct = request.getParameter("idproduct");
        String timebegin = request.getParameter("timebegin");
        String timeend = request.getParameter("timeend");
        String stepprice = request.getParameter("stepprice");

        HttpSession session = request.getSession();
        String objclient = (String) session.getAttribute("objclient");

        MongoCursor<Document> protimeout = new dbs().getcolproduct
                .find(and(eq("_id", new BsonObjectId(new ObjectId(idproduct))),
                        eq("status", new BsonInt32(3)))).iterator();
        if (protimeout.hasNext()) {
            
        }else{
            if (objclient.length() > 0 && objclient != null) {
                JsonObject object = new Gson().fromJson(objclient, JsonObject.class);
                String jobjname = object.get("name").getAsString();
                JsonObject jobjid = object.get("_id").getAsJsonObject();
                String clientid = jobjid.get("$oid").getAsString();

                SimpleDateFormat sdFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss a", Locale.getDefault());

                MongoCursor<Document> bidlasttime = new dbs().getcolbid
                        .find(and(eq("idproduct", new BsonObjectId(new ObjectId(idproduct))),
                                eq("idclient", new BsonObjectId(new ObjectId(clientid)))))
                        .sort(Sorts.descending("createddate"))
                        .limit(1)
                        .iterator();

                if (bidlasttime.hasNext()) {
                    Document doc = bidlasttime.next();
                    Date createddate = doc.getDate("createddate");
                    Date diff = new Date(new Date().getTime() - createddate.getTime());
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(diff);
                    int hours = calendar.get(Calendar.HOUR_OF_DAY);
                    int minutes = calendar.get(Calendar.MINUTE);
                    int seconds = calendar.get(Calendar.SECOND);
                    if (minutes < 2) {
                        Document d = new Document("status", "timeout");
                        response.setContentType("application/json;charset=UTF-8");
                        response.getWriter().print(d.toJson());
                    }
                    if (doing != null && doing.equals("doingdataaution")
                            && doingvalue != null && clientid != null && idproduct != null && minutes > 2) {

                        try {
                            Document d = new Document("idproduct", new BsonObjectId(new ObjectId(idproduct)))
                                    .append("idclient", new BsonObjectId(new ObjectId(clientid)))
                                    .append("nameclient", jobjname)
                                    .append("startdate", new BsonDateTime(sdFormat.parse(timebegin).getTime()))
                                    .append("enddate", new BsonDateTime(sdFormat.parse(timeend).getTime()))
                                    .append("startprice", new BsonDouble(Double.parseDouble(doingvalue)))
                                    .append("step", new BsonDouble(Double.parseDouble(stepprice)))
                                    .append("createddate", new BsonDateTime(new Date().getTime()))
                                    .append("status", new BsonInt32(1));
                            new dbs().getcolbid.insertOne(d);
                            response.setContentType("application/json;charset=UTF-8");
                            response.getWriter().print(d.toJson());
                        } catch (ParseException ex) {
                            Logger.getLogger(servletDoingProduct.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                } else {
                    if (doing != null && doing.equals("doingdataaution")
                            && doingvalue != null && clientid != null && idproduct != null) {
                        try {
                            Document d = new Document("idproduct", new BsonObjectId(new ObjectId(idproduct)))
                                    .append("idclient", new BsonObjectId(new ObjectId(clientid)))
                                    .append("nameclient", jobjname)
                                    .append("startdate", new BsonDateTime(sdFormat.parse(timebegin).getTime()))
                                    .append("enddate", new BsonDateTime(sdFormat.parse(timeend).getTime()))
                                    .append("startprice", new BsonDouble(Double.parseDouble(doingvalue)))
                                    .append("step", new BsonDouble(Double.parseDouble(stepprice)))
                                    .append("createddate", new BsonDateTime(new Date().getTime()))
                                    .append("status", new BsonInt32(1));
                            new dbs().getcolbid.insertOne(d);
                            response.setContentType("application/json;charset=UTF-8");
                            response.getWriter().print(d.toJson());
                        } catch (ParseException ex) {
                            Logger.getLogger(servletDoingProduct.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }

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
