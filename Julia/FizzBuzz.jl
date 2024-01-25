function FizzBuzz()
    for i in 1:30
        if i%3==0 && i%5==0
            println("FizzBuzz");
        elseif i%3==0 && i%5!=0
            println("Buzz");
        elseif i%3!=0 && i%5==0
            println("Fizz");
        else
            println(i);
        end
    end
end