const connexion=require("./connexion")

const addcooperative=(values, cb)=>{
    const requette="INSERT INTO cooperatives(nom,adresse, telephone,email, infos_contacts) VALUES($1,$2,$3,$4,$5) RETURNING *"

    connexion.query(requette, values)
    .then(res=>{
        getcooperatives((data)=>{
            cb({
                type:"valide",
                data:data
            })
        })
    })
    .catch(er=>{
        err_unicite(er,"Cette coopérative existe deja!", cb)
    })
}

const getAll=(el,cb)=>{
    connexion.query(`SELECT * FROM ${el}`)
    .then(res=>{
        cb(res.rows)
    })
    .catch(er=>{
        console.error(er.stack)
    })
}

const addadmin=(values, cb)=>{
    console.log(values)
    //Ajouter l'administrateur un compte utilisateur
    const requette="INSERT INTO compteutilisateur(login,password) VALUES($1,$2) RETURNING *"
    connexion.query(requette, values.slice(0,2))
    .then(res=>{
        //Ajouter l'administrateur un profil
        const user=res.rows[0]
        console.log(user)
        connexion.query("INSERT INTO compteutilisateur_has_profilutilisateur(compteutilisateur_id,profilutilisateur_id) VALUES($1,$2)", [user.id,2])
        connexion.query("INSERT INTO admin(cooperatives_id, compteutilisateur) VALUES($1,$2)", [values[2],user.id])
        getAll("admin",(data)=>{
            cb({
                type:"valide",
                data:data
            })
        })
    })
    .catch(er=>{
        err_unicite(er, "Ce Username existe deja, veuillez changer votre Username", cb)
    })
}

const getAdmins=(cb)=>{
    connexion.query(`SELECT cooperatives.nom AS coop, compteutilisateur.login AS login FROM (admin INNER JOIN cooperatives ON admin.cooperatives_id=cooperatives.id) INNER JOIN compteutilisateur ON admin.compteutilisateur=compteutilisateur.id`)
    .then(res=>{
        cb(res.rows)
    })
    .catch(er=>{
        console.error(er.stack)
    })
}

const err_unicite=(er, message, cb)=>{
    if(er.code==23505){
        cb({
            type:"erreur",
            data:message
        })
    }else{
        console.error(er.stack)
    }
}

module.exports={
    getAll,
    addcooperative,
    addadmin,
    getAdmins
}