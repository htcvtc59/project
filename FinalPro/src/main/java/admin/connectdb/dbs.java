package admin.connectdb;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.mongodb.*;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.FindOneAndUpdateOptions;
import com.mongodb.client.model.ReturnDocument;
import com.mongodb.client.model.UpdateOptions;
import java.sql.DatabaseMetaData;
import org.bson.BsonString;
import org.bson.Document;
import org.bson.types.ObjectId;

public class dbs {

    MongoClientURI connectionString = new MongoClientURI("mongodb://localhost:27017/finaldb");
    MongoClient mongoClient = new MongoClient(connectionString);
    MongoDatabase database = mongoClient.getDatabase("finaldb");
    public MongoCollection getcoladmin = database.getCollection("coladmin");

    public static void main(String[] args) {
        
        BasicDBObject bdboid = new BasicDBObject().append("_id", new ObjectId("5a74930e3567020e4ef5d165"));

        BasicDBObject bObject = new BasicDBObject();
        bObject.append("$set", new BasicDBObject()
                .append("username", new BsonString("tyytytyt"))
         .append("password", new BsonString("ioqieqe")));
        
        
        Document findOneAndUpdate = (Document) new dbs().getcoladmin.findOneAndUpdate(bdboid, bObject,new FindOneAndUpdateOptions().returnDocument(ReturnDocument.AFTER));
        System.out.println(findOneAndUpdate.toJson()+"-----");
    }

}
