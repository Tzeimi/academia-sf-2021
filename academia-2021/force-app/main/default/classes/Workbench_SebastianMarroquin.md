# Workbench data insert 
#### Developed by: Sebastián Marroquín 

-----------------------------


Type of request : ``` POST ```

URL : ```/services/apexrest/AccountInsert```

This is an example of how to insert data into the [Workbench](https://workbench.developerforce.com/restExplorer.php) in Salesforce
```
{
    "CreateAccount": {
        "Nombre":"Nombre Aleatorio",
        "Direccion":"Calle Plan Arriaga",
        "Telefono":"1234569821",
        "NombreOportunidad" : "BL-12098",
        "Status" : "Prospecting",
        "FechaSorteo" :  "2021-08-31"
    }
}
```