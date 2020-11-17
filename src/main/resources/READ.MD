ES. esercizio riscatto - prendere visione delle tabelle di dominio in data.sql e degli oggetti per 
request and response nel pakage entity

  
DB 

  

Utente: 

codice_utente nome_utente 

  

Fenomeno: 

num_polizza codice_utente cod_fenomeno data_operazione 

  

Posizione: 

num_polizza stato_polizza 

  

Polizza: 

num_polizza numero_quote codice_quota codice_utente data_variazione 

  

Quote: 

codice_quota valore 

  

Pagamenti: 

num_polizza valore codice_utente data_variazione 

  

  

Funzionamento Tabelle: 

  

Utente: 

tabella chiave valore, in valore che arriva in input viene transcodificato tramite questa tabella, in tutte le altre tabelle è salvato il codice utente  

  

Fenomeno:  

tabelle che tiene traccia di quali fenomeni sono avvenuti su una polizza e l'utente che ha effettuato l'operazione, nel caso in cui sia effettuato un RP inserire come codice 1 altrimenti in caso 

di RT inserire 2 

  

Posizione: 

Indica in che stato si trova una polizza, una polizza può trovarsi in uno stato A attiva (una polizza che ha ancora dei soldi riscattabili) C chiusa (una polizza che ha più dei soldi riscattabili) 

  

Polizza: 

contine un numero di polizza univoco, un numero di quote, un codice di quota ,un codice utente, e la data in cui è stata fatta l'ultima operazione su quella polizza 

  

Quote:  

indica per ogni codice di quota il suo valore corrispondente  

  

Pagamenti: 

tabella per il tracciamento dell’ operazione, contiene un numero di polizza il valore dell'operazione di riscatto su quella polizza e la data in cui è avvenuto 

  

  

es. input 

  

{ 

nome_utente: mario, 

tipo_riscatto: "RT" o "RP"  (riscatto tottale o parziale) 

importo: valorizzato solo nel caso di RP 

numero_polizza: 123 

} 

  

es. out 

{ 

importo Riscatato: 10€ 

} 

  

  

Consegna: 

  

Creare un servizio esposto che permetta di fare un riscatto totale RT (liquido il valore il valore totale della polizza) oppure parziale RP (inserisco un importo e liquido solo quello). 

  

Casi per cui lanciare ecezione e messaggio parlante: 

-in caso di RP se l'importo fosse superiore al valore massimo di polizza lanciare il messaggio "Valore superiore al valore di polizza", in questo caso mi aspetto che a db non 

vi sia alcuna modifica dei dati precedenti la chiamata. 

  

-operazione su polizza il cui stato sia C "Riscatto non possibile, polizza chiusa", in questo caso mi aspetto che a db non 

vi sia alcuna modifica dei dati precedenti la chiamata. 

  

flow: 

  

-ricevuto l'input valuto se è possibile fare un RP o RT 

  

-recupero utente  

-inserisco fenomeno 

-calcolo totale valore della polizza (numero quote * valore) 

-aggiorno la tabella di polizza (inserire il nuovo numero di quote fino al terzo decimale arrotondato per eccesso ,  codice_utente, data_variazione ) 

-inserisco i dati nella tabella pagamenti 

-aggiorno posizione 

-ritorno il valore 

 

 

  

  

 

 