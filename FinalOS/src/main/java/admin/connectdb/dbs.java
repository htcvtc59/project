package admin.connectdb;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.mongodb.*;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

public class dbs {

    public dbs(){

    }

    public static MongoClient getMongoClient() {
        MongoClientURI connectionString = new MongoClientURI("mongodb://localhost:27017/finaldb");
        return new MongoClient(connectionString);
    }

    public static MongoDatabase getMongoDatabase() {
        return getMongoClient().getDatabase("finaldb");
    }

    public static MongoCollection getcoladmin(){
        return getMongoDatabase().getCollection("coladmin");
    }


    public static void main(String[] args) {


        MongoCursor<Document> iterator = dbs.getcoladmin().find().iterator();


        try {
            while (iterator.hasNext()) {
                Document next = iterator.next();
                System.out.println(next.toJson());

                JsonElement id = new Gson().fromJson(next.getObjectId("_id").toString(), JsonElement.class);

                System.out.println( id.getAsString());
            }
        } finally {
            iterator.close();
        }


    }


}
