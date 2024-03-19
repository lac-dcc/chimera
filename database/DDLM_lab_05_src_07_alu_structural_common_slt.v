module slt
#( 
    parameter WIDTH = 8
)
(
    input  [WIDTH - 1:0] x,y,
    output [WIDTH - 1:0] z
);
    assign z = (x < y) ? 1 : 0;
endmodule