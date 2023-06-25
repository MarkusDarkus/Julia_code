#1. Написать обобщенную функцию, реализующую алгоритм быстрого возведения в степень
#Алгоритм быстрого возведения в степень
function mypow(a, n)
    k=n
    p=a
    t=1
    while k>0
        if iseven(k)
            k /= 2 
            p *= p
        else
            k -= 1 
            t *= p 
        end
    end
    return t
end

println(mypow(2,10))
println(mypow(15,3))

#2. #n-й член Фибоначчи по формуле Бине
function fibonacci(n)
    root_5 = 5 ^ 0.5
    phi = ((1 + root_5) / 2)

    a = (mypow(phi,n) - (mypow((-phi), -n)) ) / root_5

    return round(a)
end

println(fibonacci(8))


#4. Написать функцию, реализующую приближенное решение уравнения вида $f(x)=0$ методом деления отрезка пополам

function bisection_method(f, a, b, tol)
    # f - функция, решение уравнения f(x) = 0
    # a, b - начальные границы отрезка
    # tol - точность (абсолютное значение)
    while abs(b-a) > tol
        c = (a+b)/2
        if f(c) == 0
            return c
        elseif f(c)*f(a) < 0
            b = c
        else
            a = c
        end
    end
    return (a+b)/2
end



#5. Найти приближенное решение уравнения   $\cos x = x$ методом деления отрезка пополам.
f(x) = cos(x)-x
a, b, tol = 0, 5, 1e-6
root = bisection_method(f, a, b, tol)
println(root)

#6. Написать обобщенную функцию, реализующую метод Ньютона приьлиженного решения уравнения вида $f(x)=0$ 

function newton(f::Function, r::Function, x0::Real, n::Int=10000, ϵ::Real=1e-6)
    x = x0
    for i in 1:n
        dx = -f(x) / r(x)
        x += dx
        if abs(dx) < ϵ
            return x
        end
    end
    @warn("Требуемая точность не достигнута")
end

#7. Методом Ньютона найти приближеннное решение уравнения $\cos x = x$.
f1(x) = cos(x)-x
r1(x) = -sin(x)-1
x0 = 1
println(newton(f1,r1,x0))

#8. Методом Ньютона найти приближеннное значение какого-либо вещественного корня многочлена, заданного своими коэффициенами.
f2(x) = - x^3 + 5x^2 + 10x - 14
r2(x) = -3x^2 + 10x + 10
x0 = 3
println(newton(f2,r2,x0))
