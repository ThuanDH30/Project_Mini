    /*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
     */
    package Model.Entity;

    import java.io.Serializable;

    /**
     *
     * @author ADMIN
     */
    public class Customer implements Serializable {
        private int idCustomer;
        private String nameCustomer;
        private String passWordCustomer;
        private String emailCustomer;
        private String numPhoneCustomer;
        private int ageCustomer;
        private String addressCustomer;
        private String cccdCustomer;
        private int role_ID;

public Customer() {
        }

        public Customer(int idCustomer, String nameCustomer,String emailCustomer, String passWordCustomer, String numPhoneCustomer, int ageCustomer, String addressCustomer, String cccdCustomer,int role_ID) {
            this.idCustomer = idCustomer;
            this.nameCustomer = nameCustomer;
            this.passWordCustomer = passWordCustomer;
            this.emailCustomer = emailCustomer;
            this.numPhoneCustomer = numPhoneCustomer;
            this.ageCustomer = ageCustomer;
            this.addressCustomer = addressCustomer;
            this.cccdCustomer = cccdCustomer;
            this.role_ID=role_ID;
        }

        public int getRole_ID() {
            return role_ID;
        }

        public void setRole_ID(int role_ID) {
            this.role_ID = role_ID;
        }

        
        public int getIdCustomer() {
            return idCustomer;
        }

        public void setIdCustomer(int idCustomer) {
            this.idCustomer = idCustomer;
        }

        public String getNameCustomer() {
            return nameCustomer;
        }

        public void setNameCustomer(String nameCustomer) {
            this.nameCustomer = nameCustomer;
        }

        public String getPassWordCustomer() {
            return passWordCustomer;
        }

        public void setPassWordCustomer(String passWordCustomer) {
            this.passWordCustomer = passWordCustomer;
        }

        public String getEmailCustomer() {
            return emailCustomer;
        }

        public void setEmailCustomer(String emailCustomer) {
            this.emailCustomer = emailCustomer;
        }

        public String getNumPhoneCustomer() {
            return numPhoneCustomer;
        }

        public void setNumPhoneCustomer(String numPhoneCustomer) {
            this.numPhoneCustomer = numPhoneCustomer;
        }

        public int getAgeCustomer() {
            return ageCustomer;
        }

        public void setAgeCustomer(int ageCustomer) {
            this.ageCustomer = ageCustomer;
        }

        public String getAddressCustomer() {
            return addressCustomer;
        }

        public void setAddressCustomer(String addressCustomer) {
            this.addressCustomer = addressCustomer;
        }

        public String getCccdCustomer() {
            return cccdCustomer;
        }

        public void setCccdCustomer(String cccdCustomer) {
            this.cccdCustomer = cccdCustomer;
        }


    }
