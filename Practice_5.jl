# 1. Сортировка массива в порядке возрастания или убывания
function sort_in_place(a, reverse)
    n = size(a, 1)
    if reverse
        for i in 1:n
            for j in i:n
                if a[i] > a[j]
                    temp = a[i]
                    a[i] = a[j]
                    a[j] = temp
                end
            end
        end
    else
        for i in 1:n
            for j in i:n
                if a[i] < a[j]
                    temp = a[i]
                    a[i] = a[j]
                    a[j] = temp
                end
            end
        end
    end
end


array = rand(5000)
@time sort_in_place(array,true) 

# 3. Сортировка Шелла
function shell_sort(array)
    n = size(array, 1)
   
    gap = div(n, 2)
    while (gap > 0) 
        for i in gap+1:n
            temp = array[i]
            j = i
            while (j > gap && array[j-gap] > temp )
                array[j] = array[j-gap]
                j -= gap
            end
            array[j] = temp
        end
        gap = div(gap, 2)
    end
end

array = rand(5000)
@time shell_sort(array) 

# 4. Сортировка слиянием
function merge(array, left, mid, right)
    subArrayOne = mid - left + 1;
    subArrayTwo = right - mid;

    leftArray = Array{Float64}(undef, subArrayOne)
    rightArray = Array{Float64}(undef, subArrayTwo)

    for i in 1:subArrayOne
        leftArray[i] = array[left + i-1]
    end

    for i in 1:subArrayTwo
        rightArray[i] = array[mid + i]
    end

    indexOfSubArrOne = 1
    indexOfSubArrTwo = 1
    indexOfMergeArray = left

    while (indexOfSubArrOne <= subArrayOne && indexOfSubArrTwo <= subArrayTwo)
        if (leftArray[indexOfSubArrOne] <= rightArray[indexOfSubArrTwo])
            array[indexOfMergeArray] = leftArray[indexOfSubArrOne]
            indexOfSubArrOne = indexOfSubArrOne + 1
        else
            array[indexOfMergeArray] = rightArray[indexOfSubArrTwo]
            indexOfSubArrTwo = indexOfSubArrTwo + 1
        end
        indexOfMergeArray += 1
    end

    while (indexOfSubArrOne <= subArrayOne) 
        array[indexOfMergeArray] = leftArray[indexOfSubArrOne];
        indexOfMergeArray +=1;
        indexOfSubArrOne +=1;
    end
    while (indexOfSubArrTwo <= subArrayTwo) 
        array[indexOfMergeArray] = rightArray[indexOfSubArrTwo];
        indexOfMergeArray+=1;
        indexOfSubArrTwo+=1;
    end

end

# Объединение массивов
function merge_sort(array, first, last)
    if (first >= last)
        return
    end
    mid = first + div((last-first),2)
    merge_sort(array, first, mid);    
    merge_sort(array, mid+1, last);
    merge(array, first, mid, last); 
end

array = rand(10000)
n = size(array, 1)
@time merge_sort(array, 1, n)

#5. Быстрая сортировка
function quick_sort(array, low, high)
if (low < high)
    pivot = partition(array, low, high)

    quick_sort(array, low, pivot-1)
    quick_sort(array, pivot+1, high)
end
end

# Обмен элементами массива
function swap(arr, i, j)
temp = arr[i]
arr[i] = arr[j]
arr[j] = temp
end

# Разбиение массива на две части
function partition(array, low, high)
pivot = array[high]

i = low-1
for j in low:high-1
    if (array[j] <= pivot)
        i +=1
        swap(array, i, j)
    end
end
swap(array, i+1, high)
return i+1
end


array = [1,3,4,2,1,6,3,3,8,2,24,56,8,345,78,23,9,343,9,7,2,4,6,1,3,2,7,8,1,2,0,4,11,2]

n = size(array, 1)
quick_sort(array, 1, n)
println(array)

#7
println("В случае отсортированного массива длины n ---> О(n)")
