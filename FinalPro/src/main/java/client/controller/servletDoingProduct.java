package client.controller;

import admin.connectdb.dbs;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mongodb.client.MongoCursor;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.model.Sorts;
import com.mongodb.util.JSON;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

@WebServlet(name = "servletDoingProduct", urlPatterns = {"/doingProductData"})
public class servletDoingProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String doing = request.getParameter("do");
        if (doing != null && doing.equals("doingdata")) {

            String result = JSON.serialize(new dbs().getcolproduct
                    .find(and(lte("timebegin", new BsonDateTime(new Date().getTime())),
                            gt("timeend", new BsonDateTime(new Date().getTime())),
                            eq("status", new BsonInt32(1)))));

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(result);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String doing = request.getParameter("do");
        String doingid = request.getParameter("id");

        if (doing != null && doing.equals("doingdatamodal") && doingid != null) {

            String result = "";
            MongoCursor<Document> cursor = new dbs().getcolproduct
                    .find(eq("_id", new ObjectId(doingid))).iterator();
            while (cursor.hasNext()) {
                result += cursor.next().toJson();
            }

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(result);
        }

        String doinglist = request.getParameter("dolist");
        String doingidlist = request.getParameter("idlist");

        if (doinglist != null && doinglist.equals("doingdatalist") && doingidlist != null) {

            String result = JSON.serialize(new dbs().getcolbid
                    .find(and(eq("idproduct", new BsonObjectId(new ObjectId(doingidlist))),
                            eq("status", new BsonInt32(1))))
                    .sort(Sorts.descending("startprice")));

            System.out.println(result);

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(result);
        }

        

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
