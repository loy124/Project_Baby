package sitterboard;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.BabyMemberDto;

@WebServlet("/sitterWrite")
public class SitterBoardWriteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
		// this.processUploadFile(fileItem, dir);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String type = req.getParameter("type");
		System.out.println("type: " + type);
		String id = "";
		String title = "";
		String content = "";
		String fname = ""; // 시스템 네임

		String filename = ""; // 원래 네임

		if (type.equals("write")) {
			// int sizeLimit = 5* 1024 * 1024;
			// 이게 톰캣에 배포이려나..
			String savePath = getServletContext().getRealPath("upload");
			System.out.println("업로드 폴더: " + savePath);
			String yourTempDir = savePath;
			int yourMaxRequestSize = 100 * 1024 * 1024; // 우리가 올릴때 최대 사이즈 1 Mbyte로 잡음
			int yourMaxMemorySize = 100 * 1024; // 1 Kbyte

			boolean isMultipart = ServletFileUpload.isMultipartContent(req);

			if (isMultipart == true) {
				// FileItem 생성
				DiskFileItemFactory factory = new DiskFileItemFactory(); // fileitem생성
				factory.setSizeThreshold(yourMaxMemorySize); // 메모리사이즈 설정
				factory.setRepository(new File(yourTempDir)); // 파일을 생성해주고 (저장소에 집어넣겟다)

				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setSizeMax(yourMaxRequestSize); // 전송할 크기 , 순간전송크기 (1mbyte씩 넘겨주겠단 소리)

				// list 저장 -> id , title, content , file
				List<FileItem> items = null;
				try {
					items = upload.parseRequest(req);
				} catch (FileUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 전송한 데이터를 다 뽑아서 리스트에 넣는다
				Iterator<FileItem> it = items.iterator();

				// 구분
				while (it.hasNext()) {
					FileItem item = it.next();

					if (item.isFormField()) { // id, title, content
						if (item.getFieldName().equals("id")) {
							id = item.getString("utf-8");
							System.out.println("writeId: " + id);
						} else if (item.getFieldName().equals("title")) {
							title = item.getString("utf-8");
						} else if (item.getFieldName().equals("content")) {
							content = item.getString("utf-8");
						}
					} else { // fileload 로 넘겨줬으니 이게 넘어옴.
						if (item.getFieldName().equals("fileload")) {
							// fupload 디렉토리에 item을 만들어서 넣어라
							fname = (new Date().getTime()) + "";

							filename = processUploadFile(item, savePath, fname);

						}
					}

				}
			} else {
				System.out.println("mutipart가 아님");
			}

			SitterBoardDao dao = SitterBoardDao.getInstance();
			boolean isS = dao.writeSitterBoard(new SitterBoardDto(id, title, content, fname, filename));
			dao.insertComment(id);
			System.out.println("isS" + isS);
			resp.sendRedirect("process.jsp?type=write&isS=" + isS);
		}

		// forward("sitterWrite.jsp", req, resp);

		if (type.equals("moveSitterBoardList")) {
			resp.sendRedirect("sitterBoard.jsp");
		}

	}

	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}

	// upload 함수
	// insert, delete, select, update
	// update가 가장 어려움 왜냐면 -> 제목, 파일 등 뭘 바꿀지 모르기 떄문에
	public String processUploadFile(FileItem fileItem, String dir, String fname) throws IOException {
		String filename = fileItem.getName(); // 경로 (서버(톰캣)경로, 클라이언트경로)+ file명으로 들어옴
		long sizeInBytes = fileItem.getSize();

		// 파일이 정상일때
		if (sizeInBytes > 0) { // d:\\tmp\\adc.txt d:/tmp/adc.txt
			int idx = filename.lastIndexOf("\\"); // 뒤에부터 쭉 찾아가는데 거기에 대한 위치값을 찾아줌
			if (idx == -1) {
				// 못찾았단 얘기 ("\\") 즉 d:/tmp/adc.txt 이렇게 되어있단 얘기
				idx = filename.lastIndexOf("/");
			}
			// 파일명하고 확장자만 갖고오면 됨
			filename = filename.substring(idx + 1); // 시작하는 부분의 플러스 일 을 하고 싹다 갖고와라
													// ex: \\adc.txt 에서 abc.txt만 갖고오는것
			// 우리가 정해놓은 다이렉토리 , 파일명

			// File uploadFile = new File(dir, fname + ".temp");

			File uploadFile = new File(dir, fname);
			try {
				fileItem.write(uploadFile);
			} catch (Exception e) {
			}
		}
		return filename; // 확인용
	}

}
