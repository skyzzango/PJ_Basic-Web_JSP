package type03.dao;

public class MemberDao {

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return LazyHolder.INSTANCE;
	}

	private static class LazyHolder {
		private static final MemberDao INSTANCE = new MemberDao();
	}


}
