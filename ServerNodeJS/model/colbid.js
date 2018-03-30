
var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var marketSchema = new Schema({
    idproduct: { type: Schema.Types.ObjectId },
    idclient: { type: Schema.Types.ObjectId },
    nameclient: { type: String },
    startdate: { type: Date, default: Date.now },
    enddate: { type: Date, default: Date.now },
    startprice: { type: Schema.Types.Number },
    step: { type: Number },
    createddate: { type: Date, default: Date.now },
    status: { type: Schema.Types.Number }
});

marketSchema.set('versionKey', false);
marketSchema.set('toJSON', { virtuals: true });

module.exports = mongoose.model('colbid', marketSchema, 'colbid');

