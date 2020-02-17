package sitterboard;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/fileDown")
public class SitterBoardFileDownLoaderServlet extends HttpServlet {

	ServletConfig mConfig = null;
	static final int BUFFER_SIZE = 8192;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("file doget");
		String filename = req.getParameter("filename");
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		String type = req.getParameter("type");
		String ofilename = req.getParameter("ofilename");
		
		System.out.println("filename:" + filename);
		
		if(type.equals("download")) {
			BufferedOutputStream out = new BufferedOutputStream(resp.getOutputStream());
			String filepath = "";
			
			// tomcat(Server)
			filepath = mConfig.getServletContext().getRealPath("/upload");
			
			// 폴더 (Client)
//			filepath = "d:\\tmp";
			//filepath = filepath + "\\" + filename + ".temp";
			filepath = filepath + "\\" + filename;
			System.out.println("다운로드: " + filepath);
			
			File f = new File(filepath); // 파일이 생성되는 부분은 아님
			// 이 파일이 있는지 먼저 봐야함.
			
			if(f.exists()&& f.canRead()) {
				//System.out.println("파일이 맞습니다.");
				resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofilename + "\";");
				resp.setHeader("Content-Transfer-Encoding", "binary;");
				resp.setHeader("Content-Length", "" + f.length()); // 파일의 길이값
				resp.setHeader("Pragma", "no-cache;");  // 캐시를 저장을 하겠냐 말겠냐
				resp.setHeader("Expires", "-1;");	// 기한
				
				//파일을 생성, 거기에 기입
				BufferedInputStream fileInput = new BufferedInputStream(new FileInputStream(f));
				byte buffer[] = new byte[BUFFER_SIZE]; // 저장소 크기
				
				int read = 0;
				while( (read = fileInput.read(buffer) ) != -1) {
					out.write(buffer, 0, read);
				}
				fileInput.close();
				out.flush();
				
				//resp.setHeader("Content-Disposition","attachment; filename=" + originalFileName + ";");
			}
		}
		
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		mConfig = config;
	}
	
	
	
	
}
