print(type("Hello World"))  --> string
print(type(10.4 * 3))       --> number
print(type(print))          --> function
print(type(type))           --> function
print(type(true))           --> boolean
print(type(nil))            --> nil
print(type(type(X)))        --> string vì kết quả của type luôn luôn là một chuỗi
print("------------------------------------")

------------------------------------------------------------------------------------------------
print(type(a))              --> nil vì biến a chưa được khởi tạo và không có giá trị
a = 10;
print(type(a))              --> number vì biến a đã được khỏi tạo và gán giá trị bằng 10
print("------------------------------------")
------------------------------------------------------------------------------------------------
a = print
a(type(a))                  --> function vì biến a được khỏi tạo và gán giá trị là "print", print chính là một function
------------------------------------------------NIL------------------------------------------------
--> nil: đây là kiểu có một giá trị duy nhất, nó có thuộc tính chính đó là khác với tất cả các giá trị khác.
    -- Lua sử dụng nil như một loại không giá trị để biểu thị sự vắng mặt của các giá trị hữu ích
------------------------------------------------------------------------------------------------
--> Lua không có kiểu số nguyên(int)
--> Trong Lua, bất kì một gía trị nào cũng có thể đại diện cho một điều kiện.
    -- Lua coi cả chuỗi rỗng và chuỗi không rỗng đều đúng trong các trường hợp xử lý điều kiện
------------------------------------------------STRING------------------------------------------------
--> String: Không thể thay đổi một ký tự trong một chuỗi. Phải tạo một chuỗi mới với các sửa đổi mong muốn
print("----------------STRING--------------------")
a = "one string"
b = string.gsub( a, "one", "another" )
print(a)
print(b)
print("------------------------------------")
print("one line \nnext line \n\"in quotes\", 'in quotes'")
print("------------------------------------")
    --Lua sẽ tự động chuyển đổi giữa số và chuối tại thời điểm chạy. Bất kì thao tác số nào được áp dụng cho một chuỗi,
    --lua sẽ cố gắng chuyển đổi chuỗi thành một số
print("10" + 1)             --> 11
print("10 + 1")             --> 10 + 1
print("-5.3e-10" * "2")     --> number: -1.06e-009
--print("Hello" + 1)        --> Error
print(10 .. 20)             --> là toán tử nối chuối trong Lua và kết quả là: 1020 - string
print("------------------------------------")
--> hàm tonumber sẽ chuyển đổi một chuỗi về một số một cách rõ ràng, hàm này sẽ trả về kiểu "nill" nếu chuỗi đó không biểu thị một số thích hợp

-- print("Enter a string you want to convert to number type: ")
-- line = io.read()            --> read a line
-- n = tonumber(line)          --> convert to number
-- if n == nil then
--     error(line .. " is not a valid number")
-- else
--     print(n * 2)
-- end

--> Chuyển đổi một số về một chuỗi có hai cách: <sử dụng hàm tostring> hoặc <nối số đố với một chuỗi trống>
print(tostring(10))         --> string
print(10 .. "")             --> string
-------------------------------------------------TABLES-----------------------------------------------
-- Kiểu Table để thực hiện các mảng kết hợp
-- Mảng kết hợp là một mảng được lập kết hợp được cả số và chuỗi hoặc bất kì giá trị nào khác của ngôn ngữ Lua, ngoại trừ kiểu "nil"
-- Kiểu table không có kích thước cố định => thêm phần tử tùy thích vào bảng k giới hạn
-- Lua cũng có thể sử dụng các table để biểu diễn các package. io.read có nghĩa là đọc mục nhập từ package
-- Các table trong Lua là các đối tượng (object) chứ không phải biến hay giá trị
-- Tạo bảng bằng biểu thức hàm tạo: constructor expressionfile:
print("------------------TABLE-------------------")
a = {}                  --> Tạo bảng
k = "x"
a[k] = 10
a[20] = "great"
print(a["x"])           --> 10
k = 20
print(a[k])             --> "great"
a["x"] = a["x"] + 1
print(a["x"])           --> 11
-- Một bảng là luôn luôn ẩn danh(anonynomous). Không có mối quan hệ nào giữa một biến chứa một bảng và chính bảng đó
print("------------------------------")
a = {}
a["x"] = 10;
b = a                   --> b tham chiếu tới cùng một bảng với a
print(b["x"])           --> 10
b["x"] = 20
print(a["x"])           --> 20
print(b["x"])           --> 20
a = nil                 --> Chỉ còn b tham chiếu tới Table
b = nil                 --> Không còn bất kì biến nào tham chiếu tới Table
print("------------------------------")