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

    // functions within a struct don't have to call follow
    // this pattern
    pub fn init(name: []const u8, power: u64) User {
        return User{
            .name = name,
            .power = power,
        };
    }
};
pub const MAX_POWER = 100_100;
