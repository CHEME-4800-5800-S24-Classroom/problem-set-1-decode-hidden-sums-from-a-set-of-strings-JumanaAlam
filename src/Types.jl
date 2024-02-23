"""
    MyPuzzleRecordModel

    is a mutable structure that will take in a record as a string, characters as an array, and len ans an integar.
    It will create an empty constructor using these variables.
    
"""
# TODO: Finish the MyPuzzleRecordModel type
mutable struct MyPuzzleRecordModel
    
    record::String
    characters::Array{Char,1}
    len::Int64

# create the constructor
MyPuzzleRecordModel() = new()
end