package serviceManager;

import com.sun.deploy.net.HttpResponse;

import javax.servlet.http.HttpServletRequest;

public interface ServiceInterface {
	ServiceForward execute(HttpServletRequest request, HttpResponse response) throws Exception;
}
