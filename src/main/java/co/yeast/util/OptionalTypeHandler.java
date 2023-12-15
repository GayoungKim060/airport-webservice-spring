package co.yeast.util;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.*;
import java.util.Optional;

// mybatis 매핑시 optional 타입을 jdbcType로 처리 하기 위한 함수
// Generic <T>은 뭐지?
public class OptionalTypeHandler extends BaseTypeHandler<Optional<String>> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, Optional<String> parameter, JdbcType jdbcType) throws SQLException {
        // Optional 값이 존재하면 setting 해주고, 아니면 null값으로 셋팅해줘야 함.
        if (parameter.isPresent()){
            ps.setString(i, parameter.get());
        }else{
            ps.setNull(i, Types.VARCHAR);
        }
    }

    @Override
    public Optional<String> getNullableResult(ResultSet rs, String columnName) throws SQLException {
        return Optional.ofNullable(rs.getString(columnName));
    }

    @Override
    public Optional<String> getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return Optional.ofNullable(rs.getString(columnIndex));
    }

    @Override
    public Optional<String> getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return Optional.ofNullable(cs.getString(columnIndex));
    }
}
