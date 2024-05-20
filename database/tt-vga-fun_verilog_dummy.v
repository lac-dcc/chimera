// This program was cloned from: https://github.com/algofoogle/tt-vga-fun
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps

module dummy(
    input wire a1,
    input wire a0,
    input wire [1:0] a,
    output wire [1:0] b
);

    // wire [1:0] a = {a1,a0};

    initial $display("\n\n");

    always @(a) begin
        $display("Time: %0t - 'a' changed to: %b",$realtime,a);
    end

    always @({a1,a0}) begin
        $display("                                      Time: %0t - 'a1/a0' changed to: %b",$realtime,{a1,a0});
    end

    assign b = a; //{a1,a0};

endmodule




// `default_nettype none

// module dummy(
//     input wire a1,
//     input wire a0,
//     output wire [1:0] b
// );
//     wire [1:0] a = {a1,a0};
//     always @(posedge a[0]) $display(a);
//     assign b = a;
// endmodule


// module dummy(
//     input wire [1:0] a,
//     output wire [1:0] b
// );
//     always @(posedge a[0]) $display(a);
//     assign b = a;
// endmodule
