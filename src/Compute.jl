# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
"""

_decode_part_1(model::MyPuzzleRecordModel)::Int64

takes in charcaters from MyPuzzleRecordModel and filters them for numbers. If they are numeric, it pushes them into
value - an empty array. Assigns the value with the line number from MyPuzzleRecordModel.

"""

function _decode_part_1(model::MyPuzzleRecordModel)::Int64
    
    #for each line get the characters
    characters = model.characters;
    digits = filter(isnumeric, characters);
    value = Array{Char,1}();

    push!(value,digits[1]);
    push!(value,digits[end]);

    #join the characters
    return value |> join |> x -> parse(Int64,x);
end

"""

_decode_part_2(model::MyPuzzleRecordModel)::Int64

We are replacing numbers written in words with a numerical value by looking thme in a number library that we create.
If we have a number in a word form, we add a new start and end character to it and replace the word with the new word, e.g. "eight" becomes "eeightt")
Then the word is converted to a number by looking it up in the number library so "eeightt" becomes "e8t"
The model and characters then get updated.

"""

function _decode_part_2(model::MyPuzzleRecordModel)::Int64
    record = model.record;

    #create library of numbers in word form
    number_library = Dict("one" => 1, "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9, "zero" => 0)

    #We are replacing numbers written in words with a numerical value. 
    #If we have a number in a word form, we add a new start and end character to it and replace the word with the new word, e.g. "eight" becomes "eeightt")
    #Then the word is converted to a number by looking it up in the number library so "eeightt" becomes "e8t"
    for (word, number) in number_library
        if occursin(word, record)
            #replace number word with a numerical value
            first_char = word[1] |> string;
            last_char = word[end] |> string;
            replacement_word = "$(first_char)$(word)$(last_char)";
            record = replace(record, word => replacement_word) |> record -> replace(record, word => number);
        end
    end
#update the model
model.record = record;
model.characters = collect(record);

#use _decode_part_1 to parse our value
return _decode_part_1(model);
end
# ===== PRIVATE METHODS ABOVE HERE ==================================================================================== #
# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

    Takes `models::Dict{Int64, MyPuzzleRecordModel}` as input and returns a [Tuple] with two elements:

   - The `first` element should be the overall `hidden sum` computed by processing `all` the encoded text in a file. 
     The `hidden sum` is  of the type `Int64`.
   - The `second` element should be a dictionary of type `Dict{Int64, Int64}` with the following structure: 
     The `key` should be the line number (starting from index 1), and the `value` should be the `two-digit integer` computed from the `first digit` and the `last digit` of the encoded line of text.
"""
function decode_part_1(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}

    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
    
    for (key, value) ∈ models
        
        #decode the value
        codes[key]=_decode_part_1(value);

       # total the values
        total += codes[key];
    end
    #return the total -
    return (total, codes);
end

"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

    Takes `models::Dict{Int64, MyPuzzleRecordModel}` as input and returns a [Tuple] with two elements:

    - The `first` element should be the overall `hidden sum` computed by processing `all` the encoded text in a file. 
      The `hidden sum` is  of the type `Int64`.
    - The `second` element should be a dictionary of type `Dict{Int64, Int64}` with the following structure: 
      The `key` should be the line number (starting from index 1), and the `value` should be the `two-digit integer` computed from the `first digit` and the `last digit` of the encoded line of text.
"""
function decode_part_2(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
     
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
     
    # TODO: Add the logic for part 2 here

     for (key, value) ∈ models
        
        #decode the value
        codes[key]=_decode_part_2(value);

       # total the values
        total += codes[key];
    end
    #return the total -
    return (total, codes);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #