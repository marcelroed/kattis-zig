const std = @import("std");

pub fn main() !void {
    var buf_in = std.io.bufferedReader(std.io.getStdIn().reader());
    var buf_out = std.io.bufferedWriter(std.io.getStdOut().writer());

    var input_buffer: [128]u8 = undefined;
    while (buf_in.reader().readUntilDelimiter(&input_buffer, '\n')) |line| {
        var split = std.mem.splitScalar(u8, line, ' ');
        const a = try std.fmt.parseInt(i64, split.next().?, 10);
        const b = try std.fmt.parseInt(i64, split.next().?, 10);

        const result = try std.math.absInt(a - b);
        try buf_out.writer().print("{}\n", .{result});
    } else |_| {}
    try buf_out.flush();
}
