#1
function taylor_sum_exp(x::Real, n::Int)
  result = 0
  k = 1
  s = 1
  result = 1
  for i in 1:n
    s *= x
    k *= i
    result += s / k
  end
  return result
end

x = 1
n = 10
println(taylor_sum_exp(x, n))


#2
function my_exp(x::Float64)
  y = ceil(x)
  x -= y
  r = 1
  res = 1
  for i in 1:y
    r *= ℯ 
  end
  s = x
  i = 2
  while (abs(s) > eps(Float64))
    res += s
    s *= x/i
    i += 1
  end
  return res*r
end
println(my_exp(2.5))

#3
function row_echelon(A)
    m, n = size(A)
    lead = 1
    for r in 1:m
        if lead > n
            break
        end
        i = r
        while A[i, lead] == 0
            i += 1
            if i > m
                i = r
                lead += 1
                if lead > n
                    break
                end
            end
        end
        if lead > n
            break
        end
        if i != r
            A[i, :], A[r, :] = A[r, :], A[i, :]
        end
        pivot = A[r, lead]
        A[r, :] /= pivot
        for i in 1:m
            if i != r
                factor = A[i, lead]
                A[i, :] -= factor * A[r, :]
            end
        end
        lead += 1
    end
    return A
end


#8 ранг
function rank(A)
    B = row_echelon(A)
    r, c = size(B)
    rank = 0
    for i in 1:r
        if any(B[i, :] .!= 0)
            rank += 1
        end
    end
    return rank
end
#9 определитель
function det(A)
    B = row_echelon(A)
    d = 1
    for i in 1:size(B, 1)
        d *= B[i, i]
    end
    return d
end
A = [1 2 3; 4 5 6;7 8 9]

println(row_echelon(A))
println(rank(A))
println(det(A))

#4
function linsolve(A::AbstractMatrix,b::AbstractVector)
    x=similar(b)
    for k in reverse(eachindex) # lastindex(x):-1:firstindex(x)
        x[k]=(b[k]-sum((@view A[k,k+1:lastindex(A,2)]).*(@view x[k+1:lastindex(x)])))
    end
    return x
end
