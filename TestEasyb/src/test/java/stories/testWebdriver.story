import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

WebDriver driver = null;
before "start selenium", {
 given "selenium is up and running", {
   driver = new FirefoxDriver();
 }
}
scenario "test open baidu url", {
	
	 given "open baidu", {
	  driver.get("http://www.baidu.com");
	  Thread.sleep(1000);
	 }
}
	
after "stop selenium" , {
	 then "close all windows", {
	  driver.quit();
}
}