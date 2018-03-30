
var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var marketSchema = new Schema({
    name: { type: String },
    username: { type: String },
    password: { type: String },
    phone: {
        name: { type: String },
        status: { type: Number }
    },
    email: {
        name: { type: String },
        status: { type: Number }
    },
    address: { type: String },
    option: { 
        idaccount:{ type:String},
        idcard:{ type:String},
        money:{ type:Number},
    },
    status: { type: Schema.Types.Number }
});

marketSchema.set('versionKey', false);
marketSchema.set('toJSON', { virtuals: true });

module.exports = mongoose.model('colclient', marketSchema, 'colclient');

