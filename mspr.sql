CREATE TABLE client(
   client_id INT,
   nom_client VARCHAR(100),
   adresse_client VARCHAR(255),
   PRIMARY KEY(client_id)
);

CREATE TABLE facture(
   facture_id VARCHAR(10),
   date_facture DATE,
   client_id INT,
   PRIMARY KEY(facture_id),
   FOREIGN KEY(client_id) REFERENCES client(client_id)
);

CREATE TABLE produit(
   produit_id VARCHAR(10),
   nom_produit VARCHAR(100),
   categorie VARCHAR(100),
   prix_unitaire DECIMAL(10,2),
   PRIMARY KEY(produit_id)
);

CREATE TABLE devis(
   devis_id VARCHAR(10),
   date_devis DATE,
   client_id INT,
   PRIMARY KEY(devis_id),
   FOREIGN KEY(client_id) REFERENCES client(client_id)
);

CREATE TABLE ligne_facture(
   facture_id VARCHAR(10),
   produit_id VARCHAR(10),
   quantite INT,
   prix_unitaire DECIMAL(10,2),
   PRIMARY KEY(facture_id, produit_id),
   FOREIGN KEY(facture_id) REFERENCES facture(facture_id),
   FOREIGN KEY(produit_id) REFERENCES produit(produit_id)
);

CREATE TABLE ligne_devis(
   devis_id VARCHAR(10),
   produit_id VARCHAR(10),
   quantite INT,
   prix_unitaire DECIMAL(10,2),
   PRIMARY KEY(devis_id, produit_id),
   FOREIGN KEY(devis_id) REFERENCES devis(devis_id),
   FOREIGN KEY(produit_id) REFERENCES produit(produit_id)
);


SELECT DISTINCT
    produit_id,
    nom_produit,
    categorie,
    prix_unitaire AS prix_catalogue
FROM Produits p
INNER JOIN LignesFacture lf ON lf.produit_id = p.produit_id
INNER JOIN Factures f ON f.facture_id = lf.facture_id
WHERE f.client_id = 102;
 
 
SELECT DISTINCT
    produit_id,
    nom_produit,
    categorie,
    prix_unitaire AS prix_catalogue
FROM Produits p
INNER JOIN LignesDevis ld ON ld.produit_id = p.produit_id
INNER JOIN Devis d ON d.devis_id = ld.devis_id
WHERE d.client_id = 102 ;
