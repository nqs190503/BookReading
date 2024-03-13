/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.Book;
import Model.Category;
import Model.Chapter;
import Model.Comment;
import Model.Tag;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author ADMIN
 */
public class Book_DAO {

    private Connection con;
    private String status = "ok";
    PreparedStatement ps;
    ResultSet rs;

    public Book_DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public int getRateTime(int bookid) {
        int x = 0;
        String sql = "select count(point) from Rate where bookID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return x;
    }

    public int getAverageRate(int bookid) {
        int x = 0;
        String sql = "select AVG(point) from Rate where bookID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return x;
    }

    public List<Category> loadAllCategory() {
        List<Category> category = new ArrayList<Category>();
        String sql = "select * from Category";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                category.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            status = "error at load Category";
        }
        return category;
    }

    public Category getdescate(String cid) {
//        List<Category> category = new ArrayList<Category>();
        String sql = "select * from Category where CateID=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
            }
        } catch (Exception e) {
            status = "error at load Category";
        }
        return null;
    }

    public List<Book> loadAllBookByView() {
        List<Book> book = new ArrayList<Book>();
        String sql = "select top 10 * from Book\n"
                + " order by [Views] desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                book.add(new Book(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }

        return book;
    }

    public List<Book> loadAllBookByDate() {
        List<Book> book = new ArrayList<Book>();
        String sql = "select top 10 * from Book\n"
                + " order by publishDate desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                book.add(new Book(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }

        return book;
    }

    public List<Book> getbookbycateid(String cid) {
        List<Book> book = new ArrayList<Book>();

        String sql = "select *\n"
                + "from Book b join Category_in_book cib on b.bookID = cib.BookID\n"
                + "			join Category c on c.CateID = cib.CateID\n"
                + "where c.CateID= ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book.add(new Book(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
            status = "Error at read product" + e.getMessage();
        }
        return book;
    }

    public List<Book> getbookbytagid(String cid) {
        List<Book> book = new ArrayList<Book>();

        String sql = "select *\n"
                + "from Book b join Tag_in_book cib on b.bookID = cib.BookID\n"
                + "			join Tag c on c.TagID = cib.TagID\n"
                + "where c.TagID= ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book.add(new Book(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
            status = "Error at read product" + e.getMessage();
        }
        return book;
    }

    public Book getBookDetailById(int bookid) {
        Book b = null;
        String sql = "select * from Book where bookID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9));
            }

        } catch (Exception e) {
            String status = "error at load Book";
        }
        return b;
    }

    public List<Tag> getBookTagById(int bookid) {
        List<Tag> cate = new ArrayList<Tag>();
        String sql = "select c.*\n"
                + "from Book b join Tag_in_book cib on b.bookID = cib.BookID\n"
                + "			join Tag c on c.TagID = cib.TagID\n"
                + "where b.bookID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                cate.add(new Tag(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return cate;
    }

    public List<Category> getBookCateById(int bookid) {
        List<Category> cate = new ArrayList<Category>();
        String sql = "select c.*\n"
                + "from Book b join Category_in_book cib on b.bookID = cib.BookID\n"
                + "			join Category c on c.CateID = cib.CateID\n"
                + "where b.bookID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                cate.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return cate;
    }

    public List<Chapter> getChapterByBookId(int bookid) {
        List<Chapter> chap = new ArrayList<Chapter>();
        String sql = "select * from Chapter where BookID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                chap.add(new Chapter(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
            status = "error at load Chapter";
        }
        return chap;
    }

    public List<Book> getBookByChapter(String greater, String smaller) {
        List<Book> book = new ArrayList<Book>();
        String sql = "select b.bookID,b.creator,b.authorName,b.title,b.[views],b.detail,b.img,b.publishDate,b.[status],count(b.bookID) as 'number of chapter'\n"
                + "from Chapter c join Book b on c.BookID = b.bookID\n"
                + "group by b.bookID,b.creator,b.authorName,b.title,b.[views],b.detail,b.img,b.publishDate,b.[status]\n"
                + "having (count(b.bookID) >? and count(b.bookID) <?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, greater);
            ps.setString(2, smaller);
            rs = ps.executeQuery();
            while (rs.next()) {
                book.add(new Book(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }

        return book;
    }

    public List<Book> getBookByAuthor(String author) {
        List<Book> book = new ArrayList<Book>();
        String sql = "select * from Book\n"
                + "where [authorName] COLLATE Latin1_General_CI_AI = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, author);
            rs = ps.executeQuery();
            while (rs.next()) {
                book.add(new Book(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return book;
    }

    public List<Book> getBookByUserID(String userID) {
        List<Book> book = new ArrayList<Book>();
        String sql = "select * from [Book] b join [User] u on\n"
                + "b.userID = u.userID\n"
                + "where u.userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                book.add(new Book(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return book;
    }

    public Chapter getNormalChapterDetail(int bookid, int chapterid) {
        Chapter c = null;
        String sql = "select c.* from Book b join Chapter c on b.bookID = c.BookID\n"
                + "where c.bookID = ? and c.ChapterID=? and c.[Status] = 'Normal'";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            ps.setInt(2, chapterid);
            rs = ps.executeQuery();
            while (rs.next()) {
                c = new Chapter(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }
        return c;
    }

    public Chapter vipAccount(int bookid, int chapterid) {
        Chapter c = null;
        String sql = "select c.* from Book b join Chapter c on b.bookID = c.BookID\n"
                + "where c.bookID = ? and c.ChapterID=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            ps.setInt(2, chapterid);
            rs = ps.executeQuery();
            while (rs.next()) {
                c = new Chapter(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }
        return c;
    }

    public List<Book> Searchbytitle(String txt) {

        List<Book> book = new ArrayList<>();
        String sql = "SELECT *FROM Book Where title COLLATE Latin1_General_CI_AI LIKE ?";

        try {
            System.out.println("search" + txt);

            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txt + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                book.add(new Book(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
            System.out.println("bug" + e);
        }
        return book;
    }

    public List<Book> ListBookByCreator(int creator) {

        List<Book> book = new ArrayList<>();
        String sql = "select*from Book\n"
                + "where userID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, creator);
            rs = ps.executeQuery();
            while (rs.next()) {
                book.add(new Book(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
            System.out.println("bug" + e);
        }
        return book;
    }

    public void deleteBook(String bookID) {
        String query = "DELETE FROM Category_in_book WHERE BookID = ?;\n"
                + "DELETE FROM Book WHERE BookID = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, bookID);
            ps.setString(2, bookID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Chapter getPayedVipChapter(int userId, int chapterId) {
        Chapter c = null;
        String sql = "select c.* from PayChapter p join Chapter c on c.ChapterID = p.chapterId where p.userId = ? and c.ChapterID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, chapterId);
            rs = ps.executeQuery();
            while (rs.next()) {
                c = new Chapter(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }
        return c;
    }

    public void AddBook(String title, String authorname, String publishDate, String img, String detail,
            String status, String creator, List<String> cateIDs) {
        String sql = "INSERT INTO Book VALUES (?, ?, ?, ?, ?, ?, ?,?)";
        try {
            // Tạo PreparedStatement cho câu lệnh INSERT INTO cho bảng Book
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, creator);
            ps.setString(2, authorname);
            ps.setString(3, title);
            ps.setString(4, "0");
            ps.setString(5, detail);
            ps.setString(6, img);
            ps.setString(7, publishDate);
            ps.setString(8, status);
            // Thực hiện câu lệnh INSERT INTO cho bảng Book
            ps.executeUpdate();

            // Lấy ra BookID vừa được sinh tự động
            ResultSet rs = ps.getGeneratedKeys();
            int bookID = -1;
            if (rs.next()) {
                bookID = rs.getInt(1);
            }

            // Nếu BookID hợp lệ, tiến hành chèn các giá trị CateID vào bảng Category_in_book
            if (bookID != -1) {
                sql = "INSERT INTO Category_in_book (BookID, CateID) VALUES (?, ?)";
                // Tạo PreparedStatement cho câu lệnh INSERT INTO cho bảng Category_in_book
                ps = con.prepareStatement(sql);
                // Chèn từng cặp (BookID, CateID) vào bảng Category_in_book
                for (String cateID : cateIDs) {
                    ps.setInt(1, bookID);
                    ps.setString(2, cateID);
                    // Thực hiện câu lệnh INSERT INTO cho bảng Category_in_book
                    ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void UpdateBook(String title, String authorname, String publishDate, String img, String detail,
            String status, int bookID, List<String> cateIDs) {
        String sql = "UPDATE [Book] SET title = ?, authorName = ?, publishDate = ?, "
                + "img = ?, detail = ?, [status] = ? where [bookID] = ?";
        try {
            // Tạo PreparedStatement cho câu lệnh UPDATE cho bảng Book
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, title);
            ps.setString(2, authorname);
            ps.setString(3, publishDate);
            ps.setString(4, img);
            ps.setString(5, detail);
            ps.setString(6, status);
            ps.setInt(7, bookID);
            ps.executeUpdate();

            sql = "DELETE FROM Category_in_book WHERE BookID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookID); // Thay bookID bằng ID của sách cần cập nhật
            ps.executeUpdate();

            // Tiến hành chèn lại danh sách category mới vào bảng Category_in_book
            sql = "INSERT INTO Category_in_book (BookID, CateID) VALUES (?, ?)";
            ps = con.prepareStatement(sql);
            // Chèn từng cặp (BookID, CateID) vào bảng Category_in_book
            for (String cateID : cateIDs) {
                ps.setInt(1, bookID); // Thay bookID bằng ID của sách cần cập nhật
                ps.setString(2, cateID);
                // Thực hiện câu lệnh INSERT INTO cho bảng Category_in_book
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Chapter Getnumbernewchap(int bookid) {
        Chapter b = null;
        String sql = "select top 1* from Chapter\n"
                + "where BookID = ?\n"
                + "Order BY NumberChapter Desc";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                b = new Chapter(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }

        } catch (Exception e) {
            String status = "error at load Chapter";
        }
        return b;
    }

//    public List<Chapter> checknumberchap(int bookid) {
//        String sql = "select * from Chapter where BookID = ?";
//        List<Chapter> b = new ArrayList<>();
//        try {
//            ps = con.prepareStatement(sql);
//            ps.setInt(1, bookid);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                b.add(new Chapter(rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getInt(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6)));
//            }
//
//        } catch (Exception e) {
//            String status = "error at load Chapter";
//        }
//        return b;
//    }
    public void Addchapter(int bookid, int NumberChapter, String ChapterName, String Contents) {
        String sql = "INSERT INTO Chapter VALUES(?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            ps.setInt(2, NumberChapter);
            ps.setString(3, ChapterName);
            String content_1 = Contents.substring(0, Contents.length() / 2);
            String content_2 = Contents.substring(Contents.length() / 2 + 1, Contents.length() - 1);
            ps.setString(4, content_1);
            ps.setString(5, content_2);
            ps.setString(6, "Normal");
            ps.executeUpdate();

        } catch (Exception e) {
            String status = "error at load Chapter";
        }
    }

    public boolean checknumberchap(int NumberChapter, int bookid) {
        Chapter c = null;
        String sql = "select * from Chapter where NumberChapter = ? and BookID=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, NumberChapter);
            ps.setInt(2, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                c = new Chapter(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }

        } catch (Exception e) {
            String status = "error at load Chapter";
        }
        if (c != null) {
            return true;
        }
        return false;
    }

    public boolean checkeditnumberchap(int NumberChapter, int bookid) {
        Chapter c = null;
        String sql = "select * from Chapter where NumberChapter = ? and BookID=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, NumberChapter);
            ps.setInt(2, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                c = new Chapter(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }

        } catch (Exception e) {
            String status = "error at load Chapter";
        }
        if (c != null) {
            return true;
        }
        return false;
    }

    public int countWords(String input) {
        if (input == null) {
            return -1;
        }
        char SPACE = ' ';
        char TAB = '\t';
        char BREAK_LINE = '\n';
        int count = 0;
        int size = input.length();
        boolean notCounted = true;
        for (int i = 0; i < size; i++) {
            if (input.charAt(i) != SPACE && input.charAt(i) != TAB
                    && input.charAt(i) != BREAK_LINE) {
                if (notCounted) {
                    count++;
                    notCounted = false;
                }
            } else {
                notCounted = true;
            }
        }
        return count;
    }

    public HashMap<Integer, Integer> getCharacterCount(int bookID) {
        HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
        List<Chapter> chapter = Listchapter(bookID);
        for (Chapter c : chapter) {
            map.put(c.getChapterid(), countWords(c.getContent_1() + c.getContent_2()));
        }

        return map;
    }

    public List<Chapter> Listchapter(int bookid) {
        List<Chapter> Chapter = new ArrayList<>();
        String sql = "select * from Chapter where BookID=? Order BY NumberChapter asc";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Chapter.add(new Chapter(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println("bug" + e);
        }
        return Chapter;
    }

    public Chapter getchapterbynumber(int ChapterID) {
        Chapter c = null;
        String sql = "select * from Chapter where ChapterID=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, ChapterID);
            rs = ps.executeQuery();
            while (rs.next()) {
                c = new Chapter(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
            System.out.println("bug" + e);
        }
        return c;
    }

    public void editchapter(int ChapterID, int bookid, int numberchapter, String chaptername, String content) {
        String sql = "update Chapter\n"
                + "set [BookID] = ?,\n"
                + "[NumberChapter] = ?,\n"
                + "ChapterName = ?,\n"
                + "Contents_1 = ?,\n"
                + "Contents_2 = ?\n"
                + "where ChapterID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            ps.setInt(2, numberchapter);
            ps.setString(3, chaptername);
            String content_1 = content.substring(0, content.length() / 2);
            String content_2 = content.substring(content.length() / 2 + 1, content.length() - 1);
            ps.setString(4, content_1);
            ps.setString(5, content_2);
            ps.setInt(6, ChapterID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deletechapter(int ChapterID) {
        String query = "DELETE FROM Chapter WHERE ChapterID = ?;\n"
                + "DELETE FROM Reading WHERE chapterid = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, ChapterID);
            ps.setInt(2, ChapterID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void AddView(int bookID) {
        String sql = "update Book set [views] = ? where bookID = ?";
        int view = getBookDetailById(bookID).getViews() + 1;

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, view);
            ps.setInt(2, bookID);

            ps.execute();
        } catch (Exception e) {
            status = "error at add view";
        }
    }

    public List<Comment> getCommentByBookId(int bookid) {
        List<Comment> comment = new ArrayList<Comment>();
        String sql = "select c.*,u.avatar, u.userName from Comment c\n"
                + "join [User] u\n"
                + "on u.userID = c.userID\n"
                + "where bookID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                String avatar = "";
                if (rs.getString(8) == null) {
                    avatar = "https://th.bing.com/th/id/R.b2b34517339101a111716be1c203f354?rik=e5WHTShSpipi3Q&pid=ImgRaw&r=0";
                } else {
                    avatar = "./images/" + rs.getString(8);
                }

                comment.add(new Comment(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        avatar,
                        rs.getString(9)
                )
                );

            }
        } catch (Exception e) {
            status = "error at load ";
        }
        return comment;
    }

    public void deleteComment(String cmtID) {
        String sql = "delete from Comment\n"
                + "where cmtID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cmtID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Ngoai le duoc xu ly" + e.getMessage());
        }
    }

    public void addComment(int bookid, int userid, String cmt) {
        String query = "INSERT  into Comment ([bookID], [userID], [cmt],[like], [reply], [publishDate]) \n"
                + "\n"
                + "VALUES ( ?, ?, ?, NULL, NULL,(GETDATE()))";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, bookid);
            ps.setInt(2, userid);
            ps.setString(3, cmt);

            ps.executeUpdate();
        } catch (Exception e) {

        }

    }

    public void EditComment(String cmt, String cmtID) {
        String sql = "Update Comment \n"
                + "set [cmt] = ?\n"
                + "where [cmtID] = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cmt);
            ps.setString(2, cmtID);
            ps.executeUpdate();
            System.out.println("Update thanh cong");
        } catch (Exception e) {
            System.out.println("Ngoai le duoc xu ly" + e.getMessage());
        }
    }

    public static void main(String[] args) {
        Book_DAO dao = new Book_DAO();
        List<String> list = new Vector<String>();
        list.add("1");
        list.add("2");
       dao.AddBook("asd", "asd", "10/03/2024", "koco", "asdasdasd", "Full", "3", list);
        System.out.println(dao.status);
    }
}
