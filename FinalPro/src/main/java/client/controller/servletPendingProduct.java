/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import admin.connectdb.dbs;
import com.mongodb.client.MongoCursor;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Filters.gt;
import com.mongodb.util.JSON;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.BsonDateTime;
import org.bson.BsonInt32;
import org.bson.Document;

/**
 *
 * @author osx
 */
@WebServlet(name = "servletPendingProduct", urlPatterns = {"/penProductData"})
public class servletPendingProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pen = request.getParameter("pen");
        if (pen != null && pen.equals("pendingdata")) {
            System.out.println(pen);

            String result = JSON.serialize(new dbs().getcolproduct
                    .find(and(gt("timebegin", new BsonDateTime(new Date().getTime())),
                            eq("status", new BsonInt32(1)))).skip(0).limit(3));

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(result);
        }
        
          String pageac = request.getParameter("pageac");
        String pageskip = request.getParameter("pageskip");

        if (pageac != null && pageac.equals("pagination") && pageskip != null ) {
            int skip = Integer.parseInt(pageskip);
            
            String result = JSON.serialize(new dbs().getcolproduct
                    .find(and(gt("timebegin", new BsonDateTime(new Date().getTime())),
                            eq("status", new BsonInt32(1)))).skip(skip).limit(3));


            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(result);
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
