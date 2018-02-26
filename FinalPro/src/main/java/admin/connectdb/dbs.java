package admin.connectdb;

import client.controller.servletCreateProduct;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.mongodb.*;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.model.FindOneAndUpdateOptions;
import com.mongodb.client.model.ReturnDocument;
import com.mongodb.client.model.UpdateOptions;
import static com.mongodb.client.model.Updates.*;
import com.mongodb.util.JSON;
import java.sql.DatabaseMetaData;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.bson.BsonDateTime;
import org.bson.BsonDouble;
import org.bson.BsonInt32;
import org.bson.BsonString;
import org.bson.Document;
import org.bson.types.ObjectId;

public class dbs {

    MongoClientURI connectionString = new MongoClientURI("mongodb://localhost:27017/finaldb");
    MongoClient mongoClient = new MongoClient(connectionString);
    MongoDatabase database = mongoClient.getDatabase("finaldb");
    public MongoCollection getcoladmin = database.getCollection("coladmin");
    public MongoCollection getcolclient = database.getCollection("colclient");
    public MongoCollection getcolproduct = database.getCollection("colproduct");

    public static void main(String[] args) {

//        BasicDBObject bdboid = new BasicDBObject().append("_id", new ObjectId("5a74930e3567020e4ef5d165"));
//
//        BasicDBObject bObject = new BasicDBObject();
//        bObject.append("$set", new BasicDBObject()
//                .append("username", new BsonString("tyytytyt"))
//                .append("password", new BsonString("ioqieqe")));
//
//        Document findOneAndUpdate = (Document) new dbs().getcoladmin.findOneAndUpdate(bdboid, bObject, new FindOneAndUpdateOptions().returnDocument(ReturnDocument.AFTER));
//        System.out.println(findOneAndUpdate.toJson() + "-----");
//        new dbs().getcolclient.updateOne(eq("email.name", "htcvtc59@gmail.com"),
//                 combine(set("email.status", 1)), new UpdateOptions().upsert(true)
//                .bypassDocumentValidation(true));
//        MongoCursor<Document> iterator = new dbs().getcolclient
//                .find(and(eq("username", "anh"), eq("password", "123")))
//                .iterator();
//        
//        System.out.println(iterator.hasNext());
//        MongoCursor<Document> cursor = new dbs().getcolclient.find().iterator();
//        while (cursor.hasNext()) {
//            Document document = cursor.next();
//
//            String id = new Gson().fromJson(document.getObjectId("_id").toString(),
//                    JsonElement.class).getAsString();
//            Integer status = document.getInteger("status");
//            String name = document.getString("name");
//            String username = document.getString("username");
//            String address = document.getString("address");
//            
//            Document phone = (Document) document.get("phone");
//            Document email = (Document) document.get("email");
//            
//            
//
//            System.out.println(status + name + username + address + phone.getString("name") + email.getString("name"));
//
//        }
        SimpleDateFormat sdFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss a", Locale.getDefault());
        Date date = new Date();

        MongoCursor<Document> cursor = new dbs().getcolproduct
                .find(and(gt("timebegin", new BsonDateTime(date.getTime())), eq("status", new BsonInt32(1)))).iterator();

        System.out.println(JSON.serialize(new dbs().getcolproduct
                .find(and(gt("timebegin", new BsonDateTime(date.getTime())), eq("status", new BsonInt32(1))))));
        String result = "";
        while (cursor.hasNext()) {
            result += cursor.next().toJson();
        }
        System.out.println(result);
    }

}
