function Euclidean(a::Integer, b::Integer)::Integer
    while(a!=b)
        if(a>b)
            a = a - b
        else
            b = b - a
        end
    end
    return a
end

function AdvEuclidean(a::T, b::T) where T 
    u, v = one(T), zero(T)
        u_, v_ = v, u
    while !iszero(b) 
            r, k = rem(a,b), div(a,b) 
            a, b = b, r 
        u, u_ = u_, u-k*u_ 
        v, v_ = v_, v-k*v_
    end
    if (a<0)
        a, u, v = -a, -u, -v
    end
    return a, u, v 
end

#a*u + b*v = d

function invmod(a::Integer,m::Integer)
    if(Euclidean(a,m) != 1)
        print("no solutions")
    else
        return AdvEuclidean(a,m)[2]
    end

end

function diaphant_solve(a::Integer,b::Integer,c::Integer)
    if(c % Euclidean(a,b) != 0)
        return nothing
    end
    num::Int = 0
    qwe::Bool = true
    while(!isinteger((c-b*num)/a))
        if(qwe)
            num = num * -1
            qwe = false
        else
            qwe = true
            num = num * -1
            num = num + 1
        end
    end
    return (c-b*num)/a, num
end

struct Residue{T,M}
    a::T
    Residue{T,M}(a) where{T,M} = new(mod(a, M))
end

function ModulesAreEqual(num1::Residue, num2::Residue)::Bool
    return (findparam(num1) == findparam(num2))
end

findparam(obj::Residue{T,M}) where {T,M} = M

function +(x::Residue, y::Residue)::Residue
    if(ModulesAreEqual(a,b))
        return mod((x.a + y.a),findparam(x))
    else
        print("Moudles are bot equal error")
    end
end

function -(a::Residue, b::Residue)::Residue
    if(ModulesAreEqual(a,b))
        return mod((a.a - b.a),findparam(x))
    else
        print("Moudles are bot equal error")
    end
end

function -(a::Residue)::Residue
    return mod(a.a*-1,findparam(x))
end

function *(a::Residue, b::Residue)::Residue
    if(ModulesAreEqual(a,b))
        return mod((a.a * b.a),findparam(x))
    else
        print("Moudles are bot equal error")
    end
end

function ^(a::Residue, b::Residue)::Residue
    if(ModulesAreEqual(a,b))
        return mod((a.a^b.a),findparam(x))
    else
        print("Moudles are bot equal error")
    end
end

function inverse(num::Residue)
    return invmod(num.a, findparam(num))
end

function display(num::Residue)
    print(num.a)
end

struct Polynom{T}
    coefficient::Array{T}
end
