package com.codelensnew.utils;

import java.sql.*;

/**
 * JdbcHelper - Class tiện ích hỗ trợ thao tác với MySQL Bao gồm: mở kết
 * nối, execute query, execute update, gọi stored procedure
 */
public class JdbcHelper {

	// ===== Cấu hình kết nối =====
	private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String DBURL = 
    "jdbc:sqlserver://localhost:1433;"
  + "databaseName=code_lens_new;"
  + "encrypt=false;"
  + "trustServerCertificate=true;"
  + "useUnicode=true;"
  + "characterEncoding=UTF-8;";

	private static final String USERNAME = "sa";
	private static final String PASSWORD = "your_database_password_here";

	// ===== Load driver khi class được nạp =====
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Không tìm thấy driver SQL Server!", e);
		}
	}

	/**
	 * Mở kết nối tới database
	 * 
	 * @return Connection đối tượng connection
	 * @throws SQLException nếu lỗi khi kết nối
	 */
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(DBURL, USERNAME, PASSWORD);
	}

	/**
	 * Thực thi câu lệnh INSERT, UPDATE, DELETE
	 * 
	 * @param sql    câu lệnh SQL
	 * @param values tham số động trong câu lệnh
	 * @return số dòng bị ảnh hưởng
	 * @throws SQLException
	 */
	public static int executeUpdate(String sql, Object... values) throws SQLException {
		try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			setParameters(stmt, values);
			return stmt.executeUpdate();
		}
	}

	/**
	 * Thực thi câu lệnh SELECT
	 * 
	 * @param sql    câu lệnh SQL
	 * @param values tham số động
	 * @return ResultSet kết quả truy vấn
	 * @throws SQLException
	 */
	public static ResultSet executeQuery(String sql, Object... values) throws SQLException {
		Connection conn = getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		setParameters(stmt, values);
		return stmt.executeQuery(); // Lưu ý: caller cần đóng ResultSet + Connection
	}

	/**
	 * Thực thi stored procedure có trả về ResultSet
	 * 
	 * @param sql    câu lệnh gọi procedure (ví dụ "{Call sp_name(?,?)}")
	 * @param values tham số
	 * @return ResultSet kết quả
	 * @throws SQLException
	 */
	public static ResultSet executeCallQuery(String sql, Object... values) throws SQLException {
		Connection conn = getConnection();
		CallableStatement stmt = conn.prepareCall(sql);
		setParameters(stmt, values);
		return stmt.executeQuery(); // Caller cần đóng ResultSet + CallableStatement + Connection
	}

	/**
	 * Thiết lập tham số cho PreparedStatement / CallableStatement
	 * 
	 * @param stmt   PreparedStatement hoặc CallableStatement
	 * @param values mảng giá trị
	 * @throws SQLException
	 */
	private static void setParameters(PreparedStatement stmt, Object... values) throws SQLException {
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				stmt.setObject(i + 1, values[i]);
			}
		}
	}

}
