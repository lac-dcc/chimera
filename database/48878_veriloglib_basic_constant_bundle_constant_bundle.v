// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module constant_bundle
#(
    parameter WIDTH = 8,
    parameter VALUE = "ZERO"
)
(
    output [WIDTH-1:0] oput
);

generate
    if(VALUE == "ZERO")
        assign oput = {WIDTH{1'b0}};
    else if (VALUE == "ONE")
        assign oput = {WIDTH{1'b1}};
    else if (VALUE == "Z")
        assign oput = {WIDTH{1'bZ}};
    else if (VALUE == "X")
        assign oput = {WIDTH{1'bX}};
endgenerate

endmodule