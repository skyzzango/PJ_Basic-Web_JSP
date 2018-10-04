package type02.board;

public class BoardDto {
	private int idx;
	private String title;
	private String writer;
	private String reg_date;
	private int count;
	private String content;
	private int price;
	private String cover;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	@Override
	public String toString() {
		return "BoardDto{" +
				"idx=" + idx +
				", title='" + title + '\'' +
				", writer='" + writer + '\'' +
				", reg_date='" + reg_date + '\'' +
				", count=" + count +
				", content='" + content + '\'' +
				", price=" + price +
				", cover='" + cover + '\'' +
				'}';
	}
}
