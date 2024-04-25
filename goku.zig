// functions that start with "@" are
// builtin functions
// They are provided by compiler, not by the std lib
const std = @import("std");
const user = @import("model/user.zig");
const User = user.User;
const MAX_POWER = user.MAX_POWER;

// if main is not marked as 'pub'
// you get "error: 'main' is not marked 'pub'"
pub fn main() !void {
    // All struct fields have to be set
    // age is not set here because there is a default value
    const local_user = User{
        .power = 9001,
        .name = "Goku",
    };
    std.debug.print("{s}'s power is {d} at the age of {d}\n", .{ local_user.name, local_user.power, local_user.age });
    std.debug.print("Max power is {d}\n", .{MAX_POWER});

    // call diagnosis on user
    local_user.diagnose();

    // same as
    User.diagnose(local_user);
}
