// functions that start with "@" are
// builtin functions
// They are provided by compiler, not by the std lib
const std = @import("std");
const User = @import("model/user.zig").User;
// if main is not marked as 'pub'
// you get "error: 'main' is not marked 'pub'"
pub fn main() !void {
    const user = User{
        .power = 9001,
        .name = "Goku",
    };
    std.debug.print("{s}'s power is {d}\n", .{ user.name, user.power });
}
