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
-- Mỗi bảng có thể lưu trữ các giá trị với nhiều kiểu khác nhau và nó phát triển khi cần với các mục nhập mới
a = {}                  --> Tạo bảng
for i=1,1000 do         --> Tạo 1000 mục nhập mới
    a[i] = i * 2
end
print(a[9])             --> 18
a["x"] = 10
print(a["x"])           --> 10
print(a["y"])           --> nil
-- Các trường trong Table sẽ trả về nil nếu chúng không được khởi tạo
-- Có thể gán nil cho một trường trong Table để xóa nó
print("------------------------------")
-- Có thể viết gọn lại như sau
a.x = 10
print(a.x)              --> same as a["x"] = 10
print(a.x)              --> same as print(a["x"]) -> 10
print("------------------------------")
-- Rất dễ nhầm lẫn a.x với a[x]
-- a.x đại diện cho a["x"] - là một bảng được lập chỉ mục bởi CHUỖI "x"
-- a[x] là một bảng được lập chỉ mục theo giá trị của BIẾN x
a = {}
x = "y"
a[x] = 10
print(a[x])             --> 10
print(a.x)              --> nil - x trong trường hợp này là biến. Kết quả trả về là 10 khi x là một chuỗi a["x"] được gán bằng 10
print(a["x"])           --> nil - x trong trường hợp này là một biến
print(a["y"])           --> 10
print("------------------------------")

--------------------------------------------Relational Operators----------------------------------------------
-- Toán tử so sánh: ~= là phủ định của ==
-- Ngoài ra, Lua so sánh các chuỗi theo thứ tự bảng chữ cái
-- Không thể so sánh hai kiểu khác nhau
--------------------------------------------Logical Operators----------------------------------------------
--------------------------------------------Numberic For----------------------------------------------
local found = nil
for i=1,10 do
    print(i)
    if a[i] == 5 then
        found = i
        break
    end
end
print(found)
print("------------------------------")
--------------------------------------------Generic For----------------------------------------------
-- Print all values of array 'a'
-- for i,v in ipairs(a) do
--     print(v)
-- end
-- Print all keys of table 't'
-- for k in pairs(t) do
--     print(k)
-- end
-- --------------------------------
days = {"Sunday", "Monday", "Tuesday", "Wednesday",
            "Thursday", "Friday", "Saturday"}

for k in pairs(days) do
    print(k)
end

print("------------------------------")
-- Bảng đảo ngược(thủ công)
-- revDays = {["Sunday"] = 1, ["Monday"] = 2,
--     ["Tuesday"] = 3, ["Wednesday"] = 4,
--     ["Thursday"] = 5, ["Friday"] = 6,
--     ["Saturday"] = 7}
-- x = "Tuesday"
-- print(revDays[x])
-- Bảng đảo ngược(sử dụng for)
revDays = {}
for i,v in ipairs(days) do
    revDays[v] = i
    print(revDays[v])
    print(v)
end

print("------------------------------")
--------------------------------------------FUNCTION----------------------------------------------
function maximum (a)
    local mi = 1          -- maximum index
    local m = a[mi]       -- maximum value
    for i,val in ipairs(a) do
        if val > m then
            mi = i
            m = val
        end
    end
    return m, mi
end
  
print(maximum({8,10,23,12,5}))     --> 23(Giá trị phần tử)   3(thứ tự phần tử)
print("------------------------------")

-- a = {p = print}
-- a.p("Hello World")  -- Hello World
-- print = math.sin
-- a.p(print(1))       -- 0.841470
-- sin = a.p
-- sin(10, 20)         -- 10   20

print("------------------------------")

-- network = {
--     {name = "grauna",  IP = "210.26.30.34"},
--     {name = "arraial", IP = "210.26.30.23"},
--     {name = "lua",     IP = "210.26.23.12"},
--     {name = "derain",  IP = "210.26.23.20"},
-- }

-- table.sort(network, function (a,b)  -- Sắp xếp theo trường name theo thứ tự bảng chữ cái ngược lại
--     return (a.name > b.name)
-- end)

print("------------------------------")

-- function eraseTerminal ()
--     io.write("\27[2J")
-- end
-- -- writes an `*' at column `x' , row `y'
-- function mark (x,y)
--     io.write(string.format("\27[%d;%dH*", y, x))
-- end
-- -- Terminal size
-- TermSize = {w = 80, h = 24}

-- -- plot a function
-- -- (assume that domain and image are in the range [-1,1])
-- function plot (f)
--     eraseTerminal()
--     for i=1,TermSize.w do
--         local x = (i/TermSize.w)*2 - 1
--         local y = (f(x) + 1)/2 * TermSize.h
--         mark(i, y)
--     end
--     io.read()  -- wait before spoiling the screen
-- end

-- plot(function (x)
--     return math.sin(x*2*math.pi)
-- end)


print("--------------Closures----------------")

-- names = {"Peter", "Paul", "Mary"}
-- grades = {Mary = 10, Paul = 7, Peter = 8}

-- table.sort(names, function (n1, n2)
--     return grades[n1] > grades[n2]    -- compare the grades
-- end)

-- function sortbygrade (names, grades)
--     table.sort(names, function (n1, n2)
--         return grades[n1] > grades[n2]    -- compare the grades
--     end)
-- end

--------------------------------------------
function newCounter ()
    local i = 0
    return function ()   -- anonymous function
        i = i + 1
        return i
    end
end

c1 = newCounter()
print(c1())  --> 1
print(c1())  --> 2
-- Tạo một biến mới để gọi newCounter() lại nó sẽ tạo ra một biến cục bộ mới i => sẽ nhận được một new closure trả về kết quả khác.
-- Vì vậy c1 và c2 là hai closure khác nhau trên cùng một hàm
c2 = newCounter ()
print (c1 ()) --> 3 
print (c2 ()) --> 1
print (c2 ()) --> 2

print("--------------Proper Tail Calls----------------")

-- function room1 ()
--     print("Now is R1")
--     local move = io.read()
--     if move == "south" then 
--         print("R1 -> R3")
--         return room3()
--     elseif move == "east" then 
--         print("R1 -> R2")
--         return room2()
--     else print("invalid move")
--          return room1()   -- stay in the same room
--     end
-- end
  
-- function room2 ()
--     print("Now is R2")
--     local move = io.read()
--     if move == "south" then
--         print("R2 -> R4")
--         return room4()
--     elseif move == "west" then 
--         print("R2 -> R1")
--         return room1()
--     else print("invalid move")
--             return room2()
--     end
-- end

-- function room3 ()
--     print("Now is R3")
--     local move = io.read()
--     if move == "north" then
--         print("R3 -> R1")
--         return room1()
--     elseif move == "east" then
--         print("R3 -> R4")
--         return room4()
--     else print("invalid move")
--             return room3()
--     end
-- end

-- function room4 ()
--     print("Now is R4")
--     print("congratulations!")
-- end

-- room1()
--------------------------------------------Iterators and Closures----------------------------------------------
print("--------------Iterators and Closures----------------")
-- function allwords()
--     local line = io.read()          -- current line
--     local pos = 1                   -- current position in line
--     return function ()              -- iterator function
--         while line do               -- repeat while there are lines
--             local s, e = string.find( line, "%w+", pos)
--             if s then               -- found a word?
--                 pos = e + 1         -- next position is after this word
--                 return string.sub( line, s, e)      -- return the word 
--             else
--                 line = io.read()    -- word not found; try next line
--                 pos = 1             -- restart from first position
--             end
--         end
--         return nil
--     end
-- end

-- for word in allwords() do
--     print(word)
-- end

print("--------------Stateless Iterators----------------")
-- a = {"one", "two", "three"}
-- for i, v in ipairs(a) do        -- i: number, v: string
--     print(i, v)
-- end

-- print("------------------");
-- function iter (a, i) 
--     i = i + 1 
--     local v = a [i] 
--     if v then 
--         return i, v 
--     end 
-- end 

-- function ipairs (a) 
--     return iter, a, 0 
-- end
--------------------------------------------Mức độ ưu tiên của các toán tử----------------------------------------------
--            ^
--            not  - (unary)
--            *   /
--            +   -
--            ..
--            <   >   <=  >=  ~=  ==
--            and
--            or

-- Ví dụ:
--              a+i < b/2+1          <-->       (a+i) < ((b/2)+1)
--              5+x^2*8              <-->       5+((x^2)*8)
--              a < y and y <= z     <-->       (a < y) and (y <= z)
--              -x^2                 <-->       -(x^2)
--              x^y^z                <-->       x^(y^z)

--------------------------------------------Table Constructorrs----------------------------------------------
-- Phần tử đầu tiên luôn luôn là 1, không phải là 0
-- Tất cả các bảng được tạo bằng nhau
-- Các hàm tạo chỉ ảnh hưởng đến quá trình khởi tạo của chúng.

--------------------------------------------Cấu trúc dữ liệu----------------------------------------------
-- Table trong Lua không phải là một cấu trúc dữ liệu mà là CÁC cấu trúc dữ liệu
-- Tất cả các cấu trúc như array, list, queues,... đều được thể hiện thông qua Table trong Lua.
print("--------------Array----------------")
a = {}
for i = 1, 1000 do
    a[i] = 0       -- Bất kì một thao tác nào cố tình truy cập vào các số ngoài phạm vi 1 - 1000 sẽ trả về nil thay vì 0
end

print("--------------Matrices and Multi-Dimensional Arrays----------------")

-- mt = {}          -- create the matrix
-- for i=1,N do
--     for j=1,M do
--         mt[i*M + j] = 0
--     end
-- end
print("--------------Linked Lists----------------")

list = nil
list = {next = list, value = v}         -- chèn giá trị v vào đầu phần tử đầu danh sách

local l = list
while l do
    print(l.value)
    l = l.next    
end
print("-------------------------------")
--------------------------------------------Lập trình hướng đối tượng----------------------------------------------
-- self trong Lua == this
-- Với việc sử dụng tham số self, chúng ta thể sử dụng cùng 1 phương thức cho nhiều đối tượng
-- Sử dụng toán tử : để ẩn tham số self
Account = {balance = 0}

function Account:withdraw (v)
    self.balance = self.balance - v
end
-- method call as 
-- a:withdraw(100.00)

print("---------------Classes----------------")
-- Sắp xếp để các đối tượng mới kế thừa các hoạt động của chúng từ một lớp cha, sử dụng __index method
function Account:new (o)
    o = o or {}   -- create object if user does not provide one
    setmetatable(o, self)
    self.__index = self                 -- sử dụng __index
    return o
end

-- Khi gọi Account:new -> self chính là Account vì vậy có thể sử dụng Account trực tiếp thay vì self
print("---------------Inheritance----------------")
-- Lớp cơ sở (Lớp cha)
Account = {balance = 0}

function Account:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Account:deposit (v)                -- gửi tiền
    self.balance = self.balance + v
end

function Account:withdraw (v)               -- rút tiền
    if v > self.balance then error"insufficient funds" end
    self.balance = self.balance - v
end

-- Tạo một lớp con cho phép lấy tiền ra nhiều hơn số dư
SpecialAccount = Account:new()              -- Kế thừa tất cả các hoạt động của nó từ lớp cha
s = SpecialAccount:new{limit = 1000.00}

-- Kế thừa new từ Account. Khi new thực thi, tham số self sẽ tham chiếu đến SpecialAccount => giá trị của s sẽ là SpecialAccount, giá trị của nó tại __index cũng là SpecialAccount
-- Vì vậy s sẽ kế thừa từ SpecialAccount khi kế thừa từ Account
-- Khi sử dụng:
s:deposit(100.00)
-- Lua sẽ không thể tìm thấy trường "deposit" trong s, vì vậy nó sẽ tìm đến SpecialAccount -> cũng k thể tìm thấy trường deposit => tiếp tục tìm đến Account và ở đây nó tìm thấy
-- SpecialAccount có thể định nghĩa lại bất kì phương thức nào được kế thừa từ lớp cha của nó. Tất cả những gì chúng ta phải làm là viết phương thưc mới

function SpecialAccount:withdraw (v)        -- rút tiền
    if v - self.balance >= self:getLimit() then
        error"insufficient funds"
    end
    self.balance = self.balance - v
end
  
function SpecialAccount:getLimit ()
    return self.limit or 0
end

-- bây giờ khi gọi s:withdraw(200.00), Lua sẽ không truy cập vào Account vì nó đã tìm thấy phương thức mới là withdraw ở SpecialAccount