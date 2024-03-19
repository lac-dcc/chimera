module bitwise_and
#( 
    parameter WIDTH = 8
)
(
    input  [WIDTH - 1:0] x,y,
    output [WIDTH - 1:0] z
);
    assign z = x & y;
endmodule