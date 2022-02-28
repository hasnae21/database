/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  2/28/2022 4:04:22 PM                     */
/*==============================================================*/


drop table if exists Client;

drop table if exists Commande;

drop table if exists Detail_Commande;

drop table if exists Produit;

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   code_client          int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse_client       varchar(254),
   numero_de_telephone  bigint,
   email                varchar(254),
   mot_de_passe         varchar(254),
   primary key (code_client)
);

/*==============================================================*/
/* Table : Commande                                             */
/*==============================================================*/
create table Commande
(
   Numero_de_commande   int not null,
   code_client          int not null,
   Date_de_commande     datetime,
   Adresse_de_livraison varchar(254),
   primary key (Numero_de_commande)
);

/*==============================================================*/
/* Table : Detail_Commande                                      */
/*==============================================================*/
create table Detail_Commande
(
   code_produit         int not null,
   Numero_de_commande   int not null,
   Quantite_Commandee   int,
   primary key (code_produit, Numero_de_commande)
);

/*==============================================================*/
/* Table : Produit                                              */
/*==============================================================*/
create table Produit
(
   code_produit         int not null,
   libelle              bigint,
   description          varchar(254),
   prix_unitaire        int,
   quantite_en_stock    int,
   primary key (code_produit)
);

alter table Commande add constraint FK_Association_3 foreign key (code_client)
      references Client (code_client) on delete restrict on update restrict;

alter table Detail_Commande add constraint FK_Appartient_a foreign key (code_produit)
      references Produit (code_produit) on delete restrict on update restrict;

alter table Detail_Commande add constraint FK_Contient foreign key (Numero_de_commande)
      references Commande (Numero_de_commande) on delete restrict on update restrict;

