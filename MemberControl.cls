public class MemberControl {
    
    
    public static void Control(String isim, String Soyisim){
        List<Member__c> NewList =[SELECT Id, Name__c, Surname__c FROM Member__c];
        
         integer member =0;
        for(Member__c w : NewList){
      
            if(w.Name__c.equalsIgnoreCase(isim) && w.Surname__c.equalsIgnoreCase(Soyisim)){
                member ++;
            }
        }
            if(member==1){
                
           System.debug(isim + ' ' + Soyisim + '  isimli kisi kayitlidir');
                
            }else{
                System.debug(isim + ' ' + Soyisim + '  isimli kisi kayitli degildir');
            }
                
        }
    

    
    public static List<Book_Tracking__c>control(string kimlik){
        
       List<Book_Tracking__c> books =[SELECT Id,Book_Name__c, Name, Author__c,Member__c   
                                   
                                 		    FROM Book_Tracking__c WHERE Member__c=:kimlik] ;
        List<String>newList= new List<String>();
        for(Book_Tracking__c w :books){
            if(w.Member__c.equals(kimlik)){
            newList.add(w.Book_Name__c);
            }
            	
        }
        system.debug(newList);
       return books ; 
        
        }
     public static void errorFindUpdate(String oldName , String newName){
        
          List<Member__c> NewList =[SELECT Id, Name__c FROM Member__c];
        for(Member__c w : NewList){
      
         if(w.Name__c.equalsIgnoreCase(oldName) ){
                w.Name__c= newName;
                    System.debug(newName);
                }
                update NewList ;
                
            }
                
    }
   
    
		
         }