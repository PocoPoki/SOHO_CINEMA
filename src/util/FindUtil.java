package util;

public class FindUtil {
	public static String getNewPwd() throws Exception{
		char[] charSet = {'0','1','2','3','4','5','6','7','8','9',
				'A','B','C','D','E','F','G','H','I','J','K','L','M','N'
				,'O','P','Q','R','S','T','U','W','X','Y','Z'
		};
		StringBuffer newKey = new StringBuffer();
		for(int i=0;i<5;i++) {
			int idx = (int)(charSet.length * Math.random());
			newKey.append(charSet[idx]);
		}
		return newKey.toString();
	}
}
