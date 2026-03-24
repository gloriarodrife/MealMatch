module com.mealmatch.mealmatch {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.mealmatch.mealmatch to javafx.fxml;
    exports com.mealmatch.mealmatch;
}