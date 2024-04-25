const std = @import("std");

// structure
pub const User = struct {
    power: u64,
    age: u32 = 16, // default value
    name: []const u8,

    pub const SUPER_POWER = 9000;
    // struct with methods
    pub fn diagnose(user: User) void {
        if (user.power >= SUPER_POWER) {
            std.debug.print("it's over {d}!!!!\n", .{SUPER_POWER});
        }
    }
};
pub const MAX_POWER = 100_100;
