// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// Edge synchronizer:
//     - When parameter LOWHIGH = 1, will output 1 for one clock cycle whenever the input makes a low-to-high transition
//     - When parameter LOWHIGH = 0, will output 1 for one clock cycle whenever the input makes a high-to-low transition
//

module edge_sync
#(parameter LOWHIGH = 1)
(
    input clk,
    input in,
    output out
);

reg r1, r2, r3;

always @(posedge clk)
begin
    r1 <= in;
    r2 <= r1;
    r3 <= r2;
end

generate
    if(LOWHIGH == 1)
        assign out = ~r3 & r2;
    else if (LOWHIGH == 0)
        assign out = r3 & ~r2;
endgenerate

endmodule
