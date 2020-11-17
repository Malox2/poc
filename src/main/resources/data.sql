DROP TABLE IF EXISTS utente;
DROP TABLE IF EXISTS fenomeno;
DROP TABLE IF EXISTS fenomeno;
DROP TABLE IF EXISTS polizza;
DROP TABLE IF EXISTS quote;
DROP TABLE IF EXISTS pagamenti;

create table utente(
codice_utente nchar(10),
nome_utente nchar(20),
PRIMARY KEY (codice_utente)

);

create table fenomeno(
num_polizza nchar(5),
codice_utente nchar(10),
cod_fenomeno int,
data_operazione DATE,
PRIMARY KEY (num_polizza,data_operazione)
);

create table fenomeno(
num_polizza nchar(5),
stato_polizza nchar(1)
);

create table polizza(
num_polizza nchar(5),
numero_quote NUMERIC(10,2),
codice_quota int,
codice_utentenchar(10),
data_variazione DATE
);

create table quote(
codice_quota int,
valore int
);

create table pagamenti(
num_polizza nchar(5),
valore int,
codice_utente nchar(10),
data_variazione DATE
);
