
# ===== PRIVATE METHODS BELOW HERE =================================================================================== #

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
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #
# ===== PUBLIC METHODS BELOW HERE =================================================================================== #

# ===== PUBLIC METHODS ABOVE HERE =================================================================================== #