# 1.
# Определяем структуру Vector2D, представляющую двумерный вектор
struct Vector2D{T<:Real}
    x::T
    y::T
end

# Определяем структуру Segment2D, представляющую отрезок на плоскости
struct Segment2D{T<:Real}
    start::Vector2D{T}
    stop::Vector2D{T}
end



# 2. Лежат ли две точки по одну сторону от прямой
function same_side_of_line(p1::Vector2D, p2::Vector2D, line::Segment2D)
    parallel_vector = line.stop - line.start                                 # Вычисляем вектор, параллельный прямой
    perpendicular_vector = Vector2D(parallel_vector.y, -parallel_vector.x)   # Вычисляем перпендикулярный вектор
    line_vector1 = p1 - line.start               # Вычисляем векторы, соединяющие точки p1 и p2 началом прямой
    line_vector2 = p2 - line.start
    dot1 = dot(line_vector1, perpendicular_vector)           # Вычисляем скалярное произведение этих векторов с перпдикулярным вектором
    dot2 = dot(line_vector2, perpendicular_vector)
     # Если произведение положительное, то точки лежат по одну сторону от прямой, и функция возвращает true, в противном случае - false
    return dot1 * dot2 > 0
end

x1=0.0
y1=10.0
x2=10.0
y2=0.0
z1=0.0
z2=0.0
t1=10.0
t2=10.0
v1=Vector2D(x1,y1)
v2=Vector2D(x2,y2)
l1=Vector2D(z1,z2)
l2=Vector2D(t1,t2)
s=Segment2D(l1,l2)
println(s)
println(same_side_of_line(v1,v2,s))

# 3. Лежат ли две точки по одну сторону от заданной кривой(F(x,y)=0)
function same_side_of_curve(p1::Vector2D, p2::Vector2D, F::Function)
    F(p1.x, p1.y) * F(p2.x, p2.y) > 0
end

# 4. Точка пересечения двух отрезков
function intersect_segments(s1::Segment2D, s2::Segment2D)
    x1, y1 = s1.start.x, s1.start.y
    x2, y2 = s1.stop.x, s1.stop.y
    x3, y3 = s2.start.x, s2.start.y
    x4, y4 = s2.stop.x, s2.stop.y
    A1 = (y2 - y1) / (x2 - x1)
    A2 = (y4 - y3) / (x4 - x3)
    b1 = y1 - A1*x1
    b2 = y3 - A3*x3

    if A1 == A2
        return false
    else
        x_intersect = (b1 - b2) / (A2 - A1)
        if x_intersect < max(min(x1, x2), min(x3, x4)) || x_intersect > min(max(x1, x2), (x3, x4))
            return false
        else
            return true
        end
    end
end

# 5. Проверка, лежит ли точка внутри прямоугольника
function point_inside_polygon(p::Vector2D, poly::Array{Vector2D{T}, 1}) where T<:Real
    winding_number = 0
    num_vertices = length(poly)
    for i in 1:num_vertices
        edge_start = poly[i]
        edge_end = poly[mod(i, num_vertices) + 1]
        if edge_start.y != edge_end.y && min(edge_start.y, edge_end.y) < p.y <= max(edge_start.y, edge_end.y)
            x_intersection = edge_start.x + (p.y - edge_start.y) * (edge_end.x - edge_start.x) / (edge_end.y - edge_start.y)
            if p.x < x_intersection
                if edge_start.y < edge_end.y
                    winding_number += 1
                else
                    winding_number -= 1
                end
            end
        end
    end
    return winding_number != 0
end
