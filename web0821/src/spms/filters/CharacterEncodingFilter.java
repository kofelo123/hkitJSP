package spms.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {
	FilterConfig config;
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		request.setCharacterEncoding(config.getInitParameter("encoding"));
		
		chain.doFilter(request, response);//chain이 다음걸 가르킴
		
		
		System.out.println("");
		
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		this.config = fConfig;
	}
	

}
