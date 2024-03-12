

module mfp_register_r
#(
    parameter WIDTH = 32,
    parameter RESET = { WIDTH { 1'b0 } }
)
(
    input                        clk,
    input                        rst,
    input      [ WIDTH - 1 : 0 ] d,
    input                        wr,
    output reg [ WIDTH - 1 : 0 ] q
);
    always @ (posedge clk or negedge rst)
        if(~rst)
            q <= RESET;
        else
            if(wr) q <= d;
endmodule
