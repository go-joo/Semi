/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.36
 * Generated at: 2021-04-15 06:59:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.pro;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class insert_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<h2>[상품등록]</h2>\r\n");
      out.write("<style>\r\n");
      out.write("table{border: 1px solid #E8E1D5;}\r\n");
      out.write(" tr{border: 1px solid #E8E1D5;}\r\n");
      out.write(" td{border: 1px solid #E8E1D5;}\r\n");
      out.write("</style>\r\n");
      out.write("<form name=\"frm\" enctype=\"multipart/form-data\">\r\n");
      out.write("   <table>\r\n");
      out.write("      <tr>\r\n");
      out.write("         <td width=100 class=\"title\">상품코드</td>\r\n");
      out.write("         <td width=100><input type=\"text\" name=\"prod_id\" size=3 value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${prod_id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"/></td>\r\n");
      out.write("      \r\n");
      out.write("         <td width=100 class=\"title\">판매가격</td>\r\n");
      out.write("         <td width=150><input type=\"text\" name=\"price\" size=10 value=\"0\"/>원</td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("         <td width=100 class=\"title\" >업체코드</td>\r\n");
      out.write("         <td width=100 colspan=\"3\" >\r\n");
      out.write("         <input type=\"text\" name=\"mall_id\" size=3 value=\"G101\"/>\r\n");
      out.write("         </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("         <td class=\"title\">상품이름</td>\r\n");
      out.write("         <td colspan=\"5\">\r\n");
      out.write("         <input type=\"text\" name=\"prod_name\" size=105/>\r\n");
      out.write("         </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("         <td class=\"title\">상품이미지</td>\r\n");
      out.write("         <td colspan=\"5\">\r\n");
      out.write("         <input type=\"file\" name=\"image\" size=100 style=\"display:none;\" accept=\"image/*\"/>\r\n");
      out.write("         <img src=\"http://placehold.it/150x120\" width=150 id=\"image\"/>\r\n");
      out.write("         </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("         <td class=\"title\">상품설명</td>\r\n");
      out.write("         <td  colspan=\"5\">\r\n");
      out.write("         <textarea rows=\"10\" cols=\"93\" name=\"detail\"></textarea>\r\n");
      out.write("         </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("   </table>\r\n");
      out.write("   <div style=\"width:900px;margin-top:10px;text-align:center;margin-left:43px;\">\r\n");
      out.write("   <input type=\"submit\" value=\"상품등록\"/>\r\n");
      out.write("   <input type=\"reset\" value=\"등록취소\"/>\r\n");
      out.write("   </div>\r\n");
      out.write("</form>\r\n");
      out.write("<script>\r\n");
      out.write("   $(\"#image\").on(\"click\",function(){\r\n");
      out.write("      $(frm.image).click();\r\n");
      out.write("   });\r\n");
      out.write("   \r\n");
      out.write("   //상품등록하기\r\n");
      out.write("   $(frm).on(\"submit\", function(e){\r\n");
      out.write("\t   e.preventDefault();\r\n");
      out.write("\t   if(!confirm(\"상품을 등록합니다\")) return;\r\n");
      out.write("\t   frm.action=\"/pro/insert\";\r\n");
      out.write("\t   frm.method=\"post\"\r\n");
      out.write("\t   frm.submit();\r\n");
      out.write("   })\r\n");
      out.write("   //이미지미리보기\r\n");
      out.write("   $(frm.image).on(\"change\",function(){\r\n");
      out.write("      var reader=new FileReader();\r\n");
      out.write("      reader.onload=function(e){\r\n");
      out.write("         $(\"#image\").attr(\"src\",e.target.result);\r\n");
      out.write("      }\r\n");
      out.write("      reader.readAsDataURL(this.files[0]);\r\n");
      out.write("   });\r\n");
      out.write("</script>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
