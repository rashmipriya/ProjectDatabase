package cs505.databases;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


public class Project {

	public Connection getConnection(){
		String 	connectionUrl = "jdbc:mysql://localhost:3306/";
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionUrl, "root", "root");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return connection;
	}
	
	public void closeConnection(Connection connection)
	{
		try {
			connection.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
   public void create(Personnel personnel){
    	String sql = "INSERT INTO `chinese_wall`.`personnel_members` (`personnel_id`, `personnel_name`, `personnel_designation`,`date_of_birth`,`social_security_number`,`phone_number`,`address`,`city`,`country`) VALUES (?,?,?,?,?,?,?,?,?)";
    	Connection connection = getConnection();
    	try {
    		PreparedStatement statement = connection.prepareStatement(sql);
    		statement.setInt(1, personnel.getId());
    		statement.setString(2, personnel.getName());
    		statement.setString(3, personnel.getDesignation());
    		statement.setString(4, personnel.getDateofbirth());
    		statement.setInt(5, personnel.getSsn());
    		statement.setInt(6, personnel.getPhonenumber());
    		statement.setString(7, personnel.getAddress());
    		statement.setString(8, personnel.getCity());
    		statement.setString(9, personnel.getCountry());
    		statement.execute();
    		}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	finally {
    		closeConnection(connection);
    	}
    } 
    
    public String validation(Cases cases) throws SQLException{
    	//List<RestrictedCompanies> restrictedcompanies = new ArrayList<RestrictedCompanies>();
    	String message ="";
    	String personnelname ="";
    	String opponentorganization="";
    	String representedcompany="";
    	int count =0, personnelid;
    	String sql1 = "select * from chinese_wall.legal_cases";
    	Connection connection = getConnection();
    	String sql2 = "INSERT INTO `chinese_wall`.`legal_cases` (`personnel_id`, `personnel_name`, `case_start_date`, `case_end_date`, `represented_organization`, `opponent_organization`) VALUES (?,?,?,?,?,?)";
    		try {
    					
        		PreparedStatement statement2 = connection.prepareStatement(sql2);
        		statement2.setInt(1, cases.getPersonnel_id());
        		System.out.println(cases.getPersonnel_id());
        		statement2.setString(2, cases.getPersonnel_name());
        		System.out.println(cases.getPersonnel_name());
        		statement2.setString(3, cases.getCase_start_date());
        		System.out.println(cases.getCase_start_date());
        		statement2.setString(4, cases.getCase_end_date());
        		statement2.setString(5, cases.getRepresented_organization());
        		System.out.println(cases.getRepresented_organization());
        		statement2.setString(6, cases.getOpponent_organization());
        		System.out.println(cases.getOpponent_organization());
        		
        	    PreparedStatement statement1 = connection.prepareStatement(sql1);
        		ResultSet results =statement1.executeQuery();
        		while(results.next()){
        			personnelid = results.getInt("personnel_id");
        			System.out.println(personnelid);
        			personnelname = results.getString("personnel_name");
        	 		System.out.println(personnelname);
        	 		representedcompany = results.getString("represented_organization");
        	 		System.out.println(representedcompany);
        	 		opponentorganization = results.getString("opponent_organization");
        	 		System.out.println(opponentorganization);
        			if (cases.getPersonnel_name().equals(personnelname) && cases.getOpponent_organization().equals(representedcompany)) {
        				count ++ ;
        				
        			}
        			//RestrictedCompanies restriction= new RestrictedCompanies (personnelname, forbiddencompany);
        			//restrictedcompanies.add(restriction);
        		}
        		if(count == 0){
        		statement2.execute();
     			message = "Lawyer has been successfuly assigned the case";
        		}
        		else{
        			System.out.println(count);
        			message = "This Lawyer cannot be assigned to the case";
        		}
    		  }
    	   catch(Exception e){
    		   e.printStackTrace();
    	   }
    		
    		finally {
    		closeConnection(connection);
    	}
    	return message;
   }
    
    public List<Personnel> selectfrompersonnel(){
    	List<Personnel> personnels = new ArrayList<Personnel>();
    	String sql = "select * from chinese_wall.personnel_members";
    	Connection connection = getConnection();
    	try {
    		PreparedStatement statement = connection.prepareStatement(sql);
    		ResultSet results =statement.executeQuery();
    		while(results.next()){
    			int id = results.getInt("personnel_id");
    			String name = results.getString("personnel_name");
    			String designation = results.getString("personnel_designation");
    			String dateofbirth = results.getString("date_of_birth");
    			int ssn = results.getInt("social_security_number");
    			int phonenumber = results.getInt("phone_number");
    		    String address = results.getString("address");
    		    String city = results.getString("city");
    		    String country = results.getString("country");
    			Personnel personnel = new Personnel (id, name, designation, dateofbirth, ssn,phonenumber, address, city, country);
    			personnels.add(personnel);
    		}
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	finally {
    		closeConnection(connection);
    	}
    	return personnels;
    }
    

    public String retrieve(int id, int case_id)
    {
    	//String sql = "select related_document from document_mapping where case_id = 'case_id' AND (select organization_name from document_mapping where case_id = ?) NOT IN (select opponent_organization from legal_cases where personnel_id = ? AND case_end_date is NULL);";
    	Connection connection = getConnection();
    	try {
    		String message;
    		PreparedStatement checkCase = connection.prepareStatement("SELECT case_id from chinese_wall.document_mapping WHERE case_id='"+case_id+"'");
    		ResultSet rs3= checkCase.executeQuery();
    		PreparedStatement checkPerson = connection.prepareStatement("SELECT personnel_id from chinese_wall.legal_cases WHERE personnel_id='"+id+"'");
    		ResultSet rs4= checkPerson.executeQuery();
    		
            if(rs3.next()==false && rs4.next()==false)
            {
            	return message=("Invalid both Person ID and Case ID!");
            
            }
    		else
    		{ 
    			checkCase.close();
        		checkPerson.close();
    		PreparedStatement checkCaseId = connection.prepareStatement("SELECT case_id from chinese_wall.document_mapping WHERE case_id='"+case_id+"'");
    		ResultSet rs1= checkCaseId.executeQuery();
    		if(rs1.next()==false)
    		{
    			return message= ("Invalid Case ID!");
    		}
    		checkCaseId.close();
    		
    		PreparedStatement checkPersonId = connection.prepareStatement("SELECT personnel_id from chinese_wall.legal_cases WHERE personnel_id='"+id+"'");
    		ResultSet rs2= checkPersonId.executeQuery();
    		if(rs2.next()==false)
    		{
    			return message= ("Invalid Person ID!");
    		}
    		checkPersonId.close();
    		}
            
    		PreparedStatement statement = connection.prepareStatement("SELECT related_document from chinese_wall.document_mapping WHERE case_id = '"+case_id+"' AND (SELECT organization_name from chinese_wall.document_mapping where case_id = '"+case_id+"') NOT IN (SELECT opponent_organization from chinese_wall.legal_cases where personnel_id = '"+id+"' AND case_end_date IS NULL)");
    		//statement.setInt(1, case_id);
    		//statement.setInt(2, case_id);
    		//statement.setInt(3, id);
    		ResultSet rs= statement.executeQuery();
    		
    		
    		if(rs.next())
    		{
    		message=rs.getString("related_document");
    		return message;
    	    }
    		
    		else{ 
    			this.alertIPO(id,case_id);
                return message= ("You are not allowed to access this document!");
               
    			}
    	   
    }
    	
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	finally {
    		closeConnection(connection);
    	}
    return "Default";
    } 
    
    public void alertIPO(int id,int case_id)
    {
    	Connection connection = getConnection();
    	try
    	{
		PreparedStatement statement = connection.prepareStatement("INSERT INTO `chinese_wall`.`alerts` (`personnel_id`,`case_id`)VALUES ('"+id+"','"+case_id+"')");
		statement.executeUpdate();
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	finally {
    		closeConnection(connection);
    	}


    }
    
    public String contacts(int requestID, int id)
    {
    	Connection connection = getConnection();
    	try
    	{
    		String message="";
    		PreparedStatement checkPersonId = connection.prepareStatement("SELECT personnel_id from chinese_wall.personnel_members WHERE personnel_id='"+requestID+"'");
    		ResultSet rs2= checkPersonId.executeQuery();
    		if(rs2.next()==false)
    		{
    			return message= ("Invalid Person ID!");
    		}
    		checkPersonId.close();
    		
		PreparedStatement statement = connection.prepareStatement("SELECT phone_number from chinese_wall.personnel_members WHERE personnel_id='"+requestID+"' AND (SELECT represented_organization from chinese_wall.legal_cases where personnel_id='"+requestID+"' AND case_end_date IS NULL AND represented_organization NOT IN (SELECT opponent_organization from chinese_wall.legal_cases where personnel_id='"+id+"')) IS NOT NULL");
				
				//("SELECT phone_number from chinese_wall.personnel_members WHERE personnel_id='"+requestID+"' AND ((SELECT opponent_organization from chinese_wall.legal_cases where personnel_id='"+id+"' AND case_end_date is NULL) NOT IN (SELECT organization_represented from chinese_wall.legal_cases where personnel_id='"+requestID+"'))");
		ResultSet rs= statement.executeQuery();
		if(rs.next())
		{
		message=rs.getString("phone_number");
		return ("Here is the phone number:"+message);
	    }
		
		else{ 
		     this.alertIPOContacts(requestID, id);
            return message= ("You are not allowed to contact this person!");
           
			}
	   
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	finally {
    		closeConnection(connection);
    	}
    	return "Default";
    }
     
    public void alertIPOContacts(int requestID,int id)
    {
    	Connection connection = getConnection();
    	try
    	{
		PreparedStatement statement = connection.prepareStatement("INSERT INTO `chinese_wall`.`alerts_contacts` (`requested_id`,`person_id`)VALUES ('"+requestID+"','"+id+"')");
		statement.executeUpdate();
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	finally {
    		closeConnection(connection);
    	}


    }
    
    public static void main(String[] args) {

		Project project = new Project();
		Connection connection= project.getConnection();
		System.out.println(connection);
		//project.closeConnection(connection);

	}

}
