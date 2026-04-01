module com.mealmatch.mealmatch {
    requires javafx.controls;
    requires javafx.fxml;
    opens com.mealmatch.mealmatch to javafx.fxml;
    exports com.mealmatch.mealmatch;
    exports com.mealmatch.mealmatch.controller;
    opens com.mealmatch.mealmatch.controller to javafx.fxml;
}