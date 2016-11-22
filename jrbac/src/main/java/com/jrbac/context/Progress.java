package com.jrbac.context;

/**
 * 进度条
 * 
 * @author 程高伟
 * @date 2016年11月16日 下午2:47:17
 */
public class Progress {
	private long bytesRead;
	private long contentLength;
	private long items;

	public long getBytesRead() {
		return bytesRead;
	}

	public void setBytesRead(long bytesRead) {
		this.bytesRead = bytesRead;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public long getItems() {
		return items;
	}

	public void setItems(long items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "Progress [bytesRead=" + bytesRead + ", contentLength=" + contentLength + ", items=" + items + "]";
	}

}