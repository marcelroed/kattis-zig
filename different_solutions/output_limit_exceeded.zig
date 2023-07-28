const std = @import("std");

pub fn main() !void {
    const writer = std.io.getStdOut().writer();
    while (true) {
        try writer.print(" " ** 100_000, .{});
    }
}
