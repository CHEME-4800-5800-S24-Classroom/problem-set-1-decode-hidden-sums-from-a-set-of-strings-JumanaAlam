"""
    MyPuzzleRecordModel

TODO: Add documentation
"""
# TODO: Finish the MyPuzzleRecordModel type
mutable struct MyPuzzleRecordModel
    
    record::String
    characters::Array{Char,1}
    len::Int64

# create the constructor
MyPuzzleRecordModel() = new()
end