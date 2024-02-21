# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

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

function _decode_part_2(model::MyPuzzleRecordModel)::Int64
    record = model.record;
    number_library = Dict("one" => 1, "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9, "zero" => 0)

    #we are replacing numbers written in words with a numerical value. If we have a number in a word form, we add a new start and end character to it and replace the word with the new word, e.g. "eight" becomes "eeightt")
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
# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

TODO: Add documentation
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

TODO: Add documentation
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