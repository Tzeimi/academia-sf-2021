public class Estudiante {
    
     public string Nombre{get;set;}
	 public string Apellido{get;set;}
     public string Nota{get;set;}
     public string idAlumno{get;set;}
    
    public void asistirClase(){
        this.Nota = String.valueOf(Math.random()*100);
    }
    
    
}