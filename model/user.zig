// structure
pub const User = struct {
    power: u64,
    age: u32 = 16, // default value
    name: []const u8,
};

pub const MAX_POWER = 100_100;
