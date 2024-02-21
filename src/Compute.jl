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