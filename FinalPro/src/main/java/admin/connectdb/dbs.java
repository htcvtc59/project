package admin.connectdb;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.mongodb.*;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.model.FindOneAndUpdateOptions;
import com.mongodb.client.model.ReturnDocument;
import com.mongodb.client.model.UpdateOptions;
import static com.mongodb.client.model.Updates.*;
import java.sql.DatabaseMetaData;
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

        MongoCursor<Document> iterator = new dbs().getcolclient
                .find(and(eq("username", "anh"), eq("password", "13")))
                .iterator();
        
        System.out.println(iterator.hasNext());

               

    }

}
