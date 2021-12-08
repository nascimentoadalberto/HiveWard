// var mysql = require('mysql');
var sql = require('mssql');

var connection = ({
    user: "adm",
    password: "#Gfgrupo8",
    database: "projeto-HiveWard",
    server: "projeto-hiveward.database.windows.net",
    port: 1433,
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 30000
    },
    options: {
        encrypt: true, // for azure
    }
});


function executar(instrucao) {

    sql.connect(connection, function (err) {

        if (err){
            console.log(err)
        } ;

        // create Request object
        var request = new sql.Request();

        // query to the database and get the records
        request.query(instrucao, function (err, recordset) {

            if (err) console.log(err)

            // send records as a response
            // return recordset
            console.log("Medida inserida");
        })
    })
}

module.exports = executar;

