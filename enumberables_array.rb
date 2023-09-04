require 'byebug'

class Array
    def my_each(&block)
        count = 0
        while count < self.length
            block.call(self[count])
            count += 1
        end
        self
    end

    def my_select(&block)
        selected = []
        self.my_each do |num|
            if block.call(num)
                selected << num
            end
        end
        selected
    end

    def my_reject(&block)
        new_arr = []
        self.my_each do |num|
            if !block.call(num)
                new_arr << num
            end
        end
        new_arr
    end

    def my_any(&block)
        self.each do |num|
            if block.call(num)
                return true
            end
        end
    end

    def my_all?(&block)
        count = 0
        self.each do |num|
            if block.call(num)
                count += 1
            end
        end
        if count == self.length
            return true
        else
            return false
        end
    end
    def my_flatten
        result = []

        self.each do |ele|
            if !ele.is_a?(Array)
                result << ele
            else
                result += ele.my_flatten
            end
        end
        result
    end

    def my_zip(*arg)
        final_arr = []
        i = 0
        while final_arr.length < self.length
            new_arr = []
            new_arr << self[i]
            
            arg.each do |arr|
                new_arr << arr[i]
            end
            final_arr << new_arr
            i += 1  
        end
        final_arr
    end

    # def my_rotate(num = 1)
    #     ans = []

    #     if num > 0
    #         (self[num...-num] << self[num]).to_a
    #     else
    #         (self.reverse[num...-num] << self[num]).to_a.reverse
    #     end
    # end

    def my_join(sep = "")
        new_str = ""
        self.each do |ele|
            new_str += ele + sep
        end
        new_str
    end

    def my_reverse
        new_arr = []
        i = -1
        self.length.times { |n| new_arr << self[i - n] }
        new_arr
    end

end

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]