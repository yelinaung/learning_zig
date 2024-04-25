const std = @import("std");

// main is the entry point to the program
pub fn main() void {
    const sum = add(8999, 23);
    std.debug.print("8999 + 23 = {d}\n", .{sum});
}

// function parameters are constants
fn add(a: i64, b: i64) i64 {
    return a + b;
}
