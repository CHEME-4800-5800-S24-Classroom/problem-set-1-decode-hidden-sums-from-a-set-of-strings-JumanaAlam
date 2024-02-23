
# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    puzzleparse(filename::String) -> Dict{Int64, MyPuzzleRecordModel}

    parses through a file and builds it into a disctionary containing an integar and the information the file.
"""
function puzzleparse(filename::String)::Dict{Int64, MyPuzzleRecordModel}
    
    # initialize -
    records = Dict{Int64, MyPuzzleRecordModel}()
    linecounter = 1;
    
    # main -
    open(filename, "r") do io
        for line ∈ eachline(io)

            #process the data
            records[linecounter] = _build(line);
            
            #update linecounter
            linecounter += 1;

        end
    end

    # return the header and the records - uhuiyiuy
    return records;
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #