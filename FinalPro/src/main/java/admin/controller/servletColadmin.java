package admin.controller;

import admin.connectdb.dbs;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoCursor;
import org.bson.Document;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

@WebServlet(name = "servletColadmin", urlPatterns = {"/admin/coladmin"})
public class servletColadmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String col = request.getParameter("col");

        if (col.equals("update")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String id = request.getParameter("id");
            if (id != null && username != null && password != null) {
                Document doc = new Document("username", username)
                        .append("password", password);

                BasicDBObject query = new BasicDBObject();
                query.append("_id", new ObjectId(id));
                Bson newDocument = new Document("$set", doc);
                new dbs().getcoladmin.findOneAndReplace(query, newDocument);

//                System.out.println(id + username + password + "-----");
//
//                dbs.getcoladmin().updateOne(new Document("_id", new ObjectId(id)),
//                         doc);

            }

        }

        if (col.equals("add")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username != null && password != null) {
                Document doc = new Document("username", username)
                        .append("password", password);
                new dbs().getcoladmin.insertOne(doc);
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().print(doc.toJson());

            }

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String col = request.getParameter("col");
        if (col.equals("data")) {

            MongoCursor<Document> cursor = new dbs().getcoladmin.find().iterator();

            request.setAttribute("datacol", cursor);

            RequestDispatcher rd = request.getRequestDispatcher("coladmin.jsp");
            rd.forward(request, response);

        }

        if (col.equals("delete")) {
            String id = request.getParameter("id");
            if (id != null) {
                new dbs().getcoladmin.deleteOne(new Document("_id", new ObjectId(id)));
            }
        }

    }
}
