#1. Является ли заданное число простым 
function isprime(n::IntType) where IntType <: Integer
     for d in 2:IntType(ceil(sqrt(n)))
         if n % d == 0
             return false
         end
     end
     return true
end

println(isprime(13))
println(isprime(2))
println(isprime(10))

#2. "решето" Эратосфена
function eratosphenes_sieve(n::Integer)
    prime_indexes = ones(Bool, n)
    prime_indexes[begin] = false
    i = 2
    prime_indexes[i^2:i:n] .= false # - четные вычеркнуты
    i=3
    #ИНВАРИАНТ: i - простое нечетное
    while i <= n
        prime_indexes[i^2:2i:n] .= false
        # т.к. i^2 - нечетное, то шаг тут можно взять равным 2i, т.к. нечетное+нечетное=четное, а все четные уже вычеркнуты
        i+=1
        while i <= n && prime_indexes[i] == false
            i+=1
        end
    # i - очередное простое (первое не вычеркунутое)
    end
    return findall(prime_indexes)
end

println(eratosphenes_sieve(13))
println(eratosphenes_sieve(7))


#3. Разложение на простые множители
function degree(n, p) # кратность делителя `p` числа `n`
    k=0
    n, r = divrem(n,p)
    while n > 0 && r == 0
        k += 1
        n, r = divrem(n,p)
    end
    return k
end

function factorize(n::IntType) where IntType <: Integer
    list = NamedTuple{(:div, :deg), Tuple{IntType, IntType}}[]
    for p in eratosphenes_sieve(Int(ceil(n/2)))
        k = degree(n, p) # кратность делителя
        if k > 0
            push!(list, (div=p, deg=k))
        end
    end
    return list
end

#работает с непростыми числами
println(factorize(20))
println(factorize(36))

#4. Среднее квадратичное отклонение 
function meanstd(A)
    T = eltype(A)
    n = 0; s1 = zero(T); s2 = zero(T)
    for a in A
        n += 1; s1 .+= a; s2 += a*a
    end
    mean = s1 ./ n
    return mean, sqrt(s2/n - mean*mean)
end

A = Int8[11.0 10.0 12.0 8.0 9.0]
println(meanstd(A))
