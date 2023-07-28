const std = @import("std");

pub fn main() !void {
    unreachable; // As long as compiled in ReleaseSafe mode (zig run -O ReleaseSafe filename.zig), this causes a runtime error instead of undefined behavior.
}
