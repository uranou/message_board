<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${message != null}">
                <h2>id : ${message.id} のメッセージ編集ページ</h2>

                <form method="POST"
                    action="${pageContext.request.contextPath}/update">
                    <c:import url="_form.jsp" />
                </form>
                <h2>id : ${message.id} のメッセージ詳細ページ</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>タイトル</th>
                            <td><c:out value="${message.title}" /></td>
                        </tr>
                        <tr>
                            <th>メッセージ</th>
                            <td><c:out value="${message.content}" /></td>
                        </tr>
                        <tr>
                            <th>作成日時</th>
                            <td><fmt:formatDate value="${message.created_at}"
                                    pattern="YYYY-MM-DD HH:MM:SS" /></td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td><fmt:formatDate value="${message.updated_at}"
                                    pattern="yyyy-mm-dd hh:mm:ss" /></td>
                        </tr>
                    </tbody>
                </table>

                <p>
                    <a href="${pageContext.request.contextPath}/index">一覧に戻る</a>
                </p>
                <p>
                    <a href="#" onclick="confirmDestroy();">このメッセージを削除する</a>
                </p>
                <form method="POST"
                    action="${pageContext.request.contextPath}/destroy">
                    <input type="hidden" name="_token" value="${_token}" />
                </form>
                <script>
                    function confirmDestroy() {
                        if (confirm("本当に削除してよろしいですか？")) {
                            document.forms[1].submit();
                        }
                    }
                </script>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>