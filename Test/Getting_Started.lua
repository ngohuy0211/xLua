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
print(twice(n))


