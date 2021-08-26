public class Estudiante {
    public Estudiante(String N,String A, String Id){ 
        this.Nombre =N;
        this.Apellido=A;
        this.IdAlumno = Id;
    }
    
    public string Nombre{get;set;}
    public string Apellido{get;set;}
    public string Nota{get;set;}
    public string idAlumno{get;set;}
    
    public void asistirClase(){
        this.Nota = String.valueOf(Math.random()*100);
    }
    
    
    
}