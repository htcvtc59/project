package admin.connectdb;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.mongodb.*;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.Aggregates;
import com.mongodb.util.JSON;
import org.bson.BsonObjectId;
import org.bson.Document;
import org.bson.types.ObjectId;
import static com.mongodb.client.model.Aggregates.*;
import com.mongodb.client.model.BsonField;
import com.mongodb.client.model.Filters;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import com.mongodb.client.model.Sorts;
import static com.mongodb.client.model.Sorts.ascending;
import static com.mongodb.client.model.Sorts.descending;
import static com.mongodb.client.model.Sorts.orderBy;
import java.util.Arrays;
import java.util.Iterator;
import org.bson.BsonInt32;

public class dbs {

    MongoClientURI connectionString = new MongoClientURI("mongodb://localhost:27017/finaldb");
    MongoClient mongoClient = new MongoClient(connectionString);
    MongoDatabase database = mongoClient.getDatabase("finaldb");
    public MongoCollection getcoladmin = database.getCollection("coladmin");
    public MongoCollection getcolclient = database.getCollection("colclient");
    public MongoCollection getcolproduct = database.getCollection("colproduct");
    public MongoCollection getcolbid = database.getCollection("colbid");

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
//        SimpleDateFormat sdFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss a", Locale.getDefault());
//        Date date = new Date();
//
//        MongoCursor<Document> cursor = new dbs().getcolproduct
//                .find(and(gt("timebegin", new BsonDateTime(date.getTime())), eq("status", new BsonInt32(1)))).iterator();
//
//        System.out.println(JSON.serialize(new dbs().getcolproduct
//                .find(and(gt("timebegin", new BsonDateTime(date.getTime())), eq("status", new BsonInt32(1))))));
//        String result = "";
//        while (cursor.hasNext()) {
//            result += cursor.next().toJson();
//        }
//        System.out.println(result);
        System.out.println(JSON.serialize(new dbs().getcolproduct.aggregate(
                Arrays.asList(
                        Aggregates.lookup("colclient", "clientid", "_id", "colclient"),
                        skip(0), limit(3),
                        Aggregates.match(Filters.eq("status", 3))
                )
        )));

        MongoCursor<Document> doc = new dbs().getcolproduct.aggregate(
                Arrays.asList(
                        Aggregates.lookup("colclient", "clientid", "_id", "colclient"),
                        Aggregates.match(Filters.eq("_id",
                                new BsonObjectId(new ObjectId("5aa724713b3b674150b16f2e"))))
                )
        ).iterator();

        while (doc.hasNext()) {
            Document d = doc.next();

            JsonArray colclientArr = new Gson().fromJson(d.toJson(), JsonObject.class).getAsJsonArray("colclient");
            Iterator<JsonElement> clientarr = colclientArr.iterator();
            while (clientarr.hasNext()) {
                JsonElement ele = clientarr.next();
                JsonObject clientobj = ele.getAsJsonObject();
                
                String sellname = clientobj.get("name").getAsString();
                
                String sellphone = clientobj.get("phone").getAsJsonObject().get("name").getAsString();
                

                String sellemail = clientobj.get("email").getAsJsonObject().get("name").getAsString();

                String selladdress = clientobj.get("address").getAsString();

            }
            
           MongoCursor<Document> doc1 =  new dbs().getcolproduct.aggregate(
                Arrays.asList(
                        Aggregates.lookup("colclient", "clientid", "_id", "colclient"),
                         Aggregates.sort(orderBy(ascending("winner.idwinbid"))),
                          Aggregates.match(Filters.eq("clientid",
                                new BsonObjectId(new ObjectId("5aa5867d3b3b672754d4eabd"))))
                )
        ).iterator();
           while(doc1.hasNext()){
               Document dc = doc1.next();
               System.out.println(dc.toJson());
           }
        }
        
         MongoCursor<Document> prodone =
                    new dbs().getcolproduct.aggregate(
                    Arrays.asList(
                            Aggregates.lookup("colbid", "winner.idwinbid", "_id", "colbid"),
                            Aggregates.match(Filters.eq("_id",
                                new BsonObjectId(new ObjectId("5aa725573b3b674150b16f31")))),
                            Aggregates.match(Filters.eq("status", 3))
                    )
            ).iterator();
         
         while(prodone.hasNext()){
             Document d = prodone.next();
             
             
            JsonObject rootibj = new Gson().fromJson(d.toJson().toString(),
                    JsonElement.class).getAsJsonObject();
            
            JsonArray colbid = rootibj.get("colbid").getAsJsonArray();
            JsonObject colbidroot = colbid.get(0).getAsJsonObject();
            String nameclient = colbidroot.get("nameclient").getAsString();
            String startprice = colbidroot.get("startprice").getAsString();
            
             System.out.println(nameclient+startprice);
            
            
            
         }
    }

}
