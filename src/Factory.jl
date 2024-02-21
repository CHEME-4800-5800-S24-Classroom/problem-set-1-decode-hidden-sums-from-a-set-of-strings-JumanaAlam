
# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE =================================================================================== #
# TODO: Make a build method to construct MyPuzzleRecordModel types
# ===== PUBLIC METHODS ABOVE HERE =================================================================================== #
function _build(record::String)::MyPuzzleRecordModel

    #empty model
    model = MyPuzzleRecordModel()

    #add data to the model
    model.record = record;
    model.characters = collect(record);
    model.len = length(record);

    #return the model
    return model;
end