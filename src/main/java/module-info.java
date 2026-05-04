module com.mealmatch.mealmatch {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires mysql.connector.j;
    opens com.mealmatch.mealmatch to javafx.fxml;
    exports com.mealmatch.mealmatch;
    exports com.mealmatch.mealmatch.controller;
    exports com.mealmatch.mealmatch.model;
    opens com.mealmatch.mealmatch.controller to javafx.fxml;
}