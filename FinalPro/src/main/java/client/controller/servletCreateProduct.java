/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import admin.connectdb.dbs;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.bson.BSON;
import org.bson.BsonDateTime;
import org.bson.BsonDouble;
import org.bson.BsonInt32;
import org.bson.BsonNumber;
import org.bson.BsonObjectId;
import org.bson.Document;
import org.bson.types.ObjectId;

/**
 *
 * @author osx
 */
@WebServlet(name = "servletCreateProduct", urlPatterns = {"/createproduct"})
public class servletCreateProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String col = request.getParameter("col");
        if (col.equals("add")) {
            String proname = request.getParameter("proname");
            String prostep = request.getParameter("prostep");
            String proprice = request.getParameter("proprice");
            String proquantity = request.getParameter("proquantity");
            String proimgurl = request.getParameter("proimgurl");
            String protimestart = request.getParameter("protimestart");
            String protimeend = request.getParameter("protimeend");
            String proimgmoreurl = request.getParameter("proimgmoreurl");
            String prodetail = request.getParameter("prodetail");

            if (proname != null && prostep != null && proprice != null && proquantity != null && proimgurl != null
                    && protimestart != null && protimeend != null && proimgmoreurl != null && prodetail != null) {

                HttpSession session = request.getSession();
                String objclient = (String) session.getAttribute("objclient");
                JsonObject object = new Gson().fromJson(objclient, JsonObject.class);
                JsonObject jobjid = object.get("_id").getAsJsonObject();
                String clientid = jobjid.get("$oid").getAsString();

                SimpleDateFormat sdFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss a", Locale.getDefault());

                try {
                    System.out.println(sdFormat.parse(protimestart));
                    Document d = new Document("nameproduct", proname).append("idcategory", "")
                            .append("clientid", new BsonObjectId(new ObjectId(clientid)))
                            .append("createddate", new BsonDateTime(new Date().getTime()))
                            .append("timebegin", new BsonDateTime(sdFormat.parse(protimestart).getTime()))
                            .append("timeend", new BsonDateTime(sdFormat.parse(protimeend).getTime()))
                            .append("pricemin", new BsonDouble(Double.parseDouble(proprice)))
                            .append("stepprice", new BsonDouble(Double.parseDouble(prostep)))
                            .append("quantity", new BsonInt32(Integer.parseInt(proquantity))).append("image", proimgurl)
                            .append("slide", proimgmoreurl).append("description", prodetail)
                            .append("status", new BsonInt32(0));

                    new dbs().getcolproduct.insertOne(d);

                } catch (ParseException ex) {
                    Logger.getLogger(servletCreateProduct.class.getName()).log(Level.SEVERE, null, ex);
                }

                Document doc = new Document("success", "success");
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().print(doc.toJson());

            } else {
                response.sendRedirect("signin.jsp");
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
