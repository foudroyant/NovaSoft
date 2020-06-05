const { Client } = require('pg')

const client = new Client({
    user: 'stephane',
    host: 'localhost',
    database: 'novasoft',
    password: 'stephane',
    port: 5432,
  })
  client.connect()


module.exports.seConnecter= function seConnecter(values, cb){
  let query={
    text:'SELECT * FROM compteutilisateur WHERE login=$1 AND password=$2',
    values:values
  }
  
    client.query(query)
    .then(res=>{
      cb(res.rows[0])
    })
    .catch(e=>{
      console.log(e.stack)
    })
}

module.exports.getProfils=(id, cb)=>{
  client.query(`SELECT profil FROM profilutilisateur INNER JOIN compteutilisateur_has_profilutilisateur ON profilutilisateur.id=compteutilisateur_has_profilutilisateur.profilutilisateur_id WHERE compteutilisateur_id=${id}`)
    .then(res=>{
      cb(res.rows)
    })
    .catch(e=>{
      console.log(e.stack)
    })
}