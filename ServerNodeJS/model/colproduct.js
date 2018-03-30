
var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var marketSchema = new Schema({
    nameproduct: { type: String },
    idcategory: { type: String },
    clientid: { type: Schema.Types.ObjectId },
    createddate: { type: Date, default: Date.now },
    timebegin: { type: Date, default: Date.now },
    timeend: { type: Date, default: Date.now },
    pricemin: { type: Schema.Types.Number },
    stepprice: { type: Number },
    quantity: { type: Number },
    image: { type: String },
    slide: { type: String },
    description: { type: String },
    winner: {
        idwinner: { type: Schema.Types.ObjectId },
        idwinbid: { type: Schema.Types.ObjectId },
        pay: { type: Number, default: 0 }
    },
    status: { type: Schema.Types.Number }
});

marketSchema.set('versionKey', false);
marketSchema.set('toJSON', { virtuals: true });

module.exports = mongoose.model('colproduct', marketSchema, 'colproduct');

