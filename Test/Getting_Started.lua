function fact(n)
    if n == 0 then
        return 1
    else
        return n * fact(n - 1)
    end
end
print("Enter a number: ")
a = io.read("*number")
print(fact(a))

dofile("Chunk.lua")  -- Doc file lua
n = norm(3.4, 1.0)
print(twice(n)) -- học kiểu này làm j cho nó lâu, vào đọc code a giang 1 buổi là làm đc mà, ez lắm


