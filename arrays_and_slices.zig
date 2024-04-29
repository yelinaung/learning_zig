const print = @import("std").debug.print;

fn arrays() void {
    // fixed sized with a length known at compile time
    const a = [5]i32{ 1, 2, 3, 4, 5 };
    print("{any}\n", .{a});

    // .{...} syntax works here too
    const b: [5]i32 = .{ 1, 2, 3, 4, 5 };
    print("{any}\n", .{b});

    // use _ to let the compiler infer the length
    const c = [_]i32{ 1, 2, 3, 4, 5 };
    print("{any}\n", .{c});

    print("Type of a - {}\n", .{@TypeOf(a)});
    print("Len of a - {d}\n", .{a.len});

    // this is a pointer to an array of integers
    // with a length of 3
    const x = a[1..4];
    print("Type of x - {}\n", .{@TypeOf(x)});
    print("------------------------\n", .{});
}

fn slices() void {
    const a = [_]i32{ 1, 2, 3, 4, 5 };
    print("Type of a {any}\n", .{@TypeOf(a)});
    var end: usize = 2;
    end += 1;

    // b is a proper slice
    // length of the slice isn't part of the type
    // because the length is a runtime property,
    // and types are always fully known at compile time
    //
    // without end += 1 increment
    // this become a compile-time known length
    const b = a[1..end];
    print("{any}\n", .{b});
    print("Length of b {any}\n", .{b.len});
    print("Type of b {any}\n", .{@TypeOf(b)});
    print("------------------------\n", .{});
}

fn something() void {
    var a = [_]i32{ 1, 2, 3, 4, 5, 6 };
    var end: usize = 4;
    end += 1;
    const b = a[1..end];
    print("{any}\n", .{@TypeOf(b)});

    // this won't work because
    // unless we change a to 'var'
    // A slice's type is always derived from
    // what it is slicing.
    // it is a slice of a [5]const i32 and so b must be of type []const i32
    b[2] = 5;
    print("b = {any}\n", .{b});

    print("------------------------\n", .{});
}

fn something2() void {
    var a = [_]i32{ 1, 2, 3, 4, 5, 6 };
    print("type of a : {any}\n", .{@TypeOf(a)});
    var end: usize = 3;
    end += 1;

    // this won't work
    // const b = a[1..end];

    // this works
    var b = a[1..end];
    print("b {any}\n", .{b});
    print("type of b {any}\n", .{@TypeOf(b)});

    b = b[1..];
    print("b {any}\n", .{b});
}

pub fn main() !void {
    arrays();
    slices();
    something();
    something2();
}
