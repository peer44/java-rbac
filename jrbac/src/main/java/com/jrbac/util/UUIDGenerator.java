package com.jrbac.util;

import java.util.UUID;

/**
 * UUID生成器
 * 
 * @author 程高伟
 *
 * @date 2016年6月15日 上午10:02:04
 */
public class UUIDGenerator {

	/**
	 * 得到一个UUID
	 * 
	 * @return
	 */
	public static String getUUID() {
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		// 去掉"-"符号
		String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23)
				+ str.substring(24);
		return temp;
	}

	/**
	 * 获得指定数量的UUID
	 * 
	 * @param number
	 * @return
	 */
	public static String[] getUUID(int number) {
		if (number < 1) {
			return null;
		}
		String[] ss = new String[number];
		for (int i = 0; i < number; i++) {
			ss[i] = getUUID();
		}
		return ss;
	}
}
