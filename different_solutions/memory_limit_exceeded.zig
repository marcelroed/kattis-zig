const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var allocator = gpa.allocator();
    while (true) {
        _ = try allocator.create([100_000]u64);
    }
}
