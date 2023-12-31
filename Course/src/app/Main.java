package app;

import app.ui.Controller;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;

import java.io.File;
import java.util.Optional;

public class Main extends Application {

    public static Parent root;
    public static String rootDir = new File("").getAbsolutePath();

    @Override
    public void start(Stage primaryStage) throws Exception {
        root = FXMLLoader.load(getClass().getResource("ui/sample.fxml"));
        primaryStage.setTitle("File encryption");
        primaryStage.getIcons().add(new Image("app\\assets\\images\\mainLock.png"));
        primaryStage.setScene(new Scene(root, 430, 225));
        primaryStage.setResizable(false);
        primaryStage.setMaximized(false);

        primaryStage.setOnCloseRequest(event -> {
            Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
            alert.setTitle("Exit");
            alert.setHeaderText(null);
            alert.setContentText("Do you want to exit?");

            ImageView image = new ImageView("app\\assets\\images\\warning.png");
            image.setFitWidth(32);
            image.setFitHeight(32);
            alert.setGraphic(image);

            Optional<ButtonType> result = alert.showAndWait();
            if (result.isPresent() && result.get() == ButtonType.CANCEL) {
                event.consume();
            } else {
                Controller.buffFile = null;
            }
        });

        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
