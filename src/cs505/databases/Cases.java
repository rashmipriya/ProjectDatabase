package cs505.databases;

public class Cases {
	private int case_id;
	private int personnel_id;
	private String personnel_name;
	private String case_start_date;
	private String case_end_date;
	private String represented_organization;
	private String opponent_organization;
	public int getCase_id() {
		return case_id;
	}
	public void setCase_id(int case_id) {
		this.case_id = case_id;
	}
	public int getPersonnel_id() {
		return personnel_id;
	}
	public void setPersonnel_id(int personnel_id) {
		this.personnel_id = personnel_id;
	}
	public String getPersonnel_name() {
		return personnel_name;
	}
	public void setPersonnel_name(String personnel_name) {
		this.personnel_name = personnel_name;
	}
	public String getCase_start_date() {
		return case_start_date;
	}
	public void setCase_start_date(String case_start_date) {
		this.case_start_date = case_start_date;
	}
	public String getCase_end_date() {
		return case_end_date;
	}
	public void setCase_end_date(String case_end_date) {
		this.case_end_date = case_end_date;
	}
	public String getRepresented_organization() {
		return represented_organization;
	}
	public void setRepresented_organization(String represented_organization) {
		this.represented_organization = represented_organization;
	}
	public String getOpponent_organization() {
		return opponent_organization;
	}
	public void setOpponent_organization(String opponent_organization) {
		this.opponent_organization = opponent_organization;
	}
	public Cases(int case_id, int personnel_id, String personnel_name, String case_start_date, String case_end_date,
			String represented_organization, String opponent_organization) {
		super();
		this.case_id = case_id;
		this.personnel_id = personnel_id;
		this.personnel_name = personnel_name;
		this.case_start_date = case_start_date;
		this.case_end_date = case_end_date;
		this.represented_organization = represented_organization;
		this.opponent_organization = opponent_organization;
	}
	public Cases() {
		super();
	}
	public Cases(String personnel_name, String case_start_date, String represented_organization,
			String opponent_organization) {
		super();
		this.personnel_name = personnel_name;
		this.case_start_date = case_start_date;
		this.represented_organization = represented_organization;
		this.opponent_organization = opponent_organization;
	}
	public Cases(int personnel_id, String personnel_name, String case_start_date, String represented_organization,
			String opponent_organization) {
		super();
		this.personnel_id = personnel_id;
		this.personnel_name = personnel_name;
		this.case_start_date = case_start_date;
		this.represented_organization = represented_organization;
		this.opponent_organization = opponent_organization;
	}
	public Cases(int personnel_id, String personnel_name, String case_start_date, String case_end_date,
			String represented_organization, String opponent_organization) {
		super();
		this.personnel_id = personnel_id;
		this.personnel_name = personnel_name;
		this.case_start_date = case_start_date;
		this.case_end_date = null;
		this.represented_organization = represented_organization;
		this.opponent_organization = opponent_organization;
	}
	

}
