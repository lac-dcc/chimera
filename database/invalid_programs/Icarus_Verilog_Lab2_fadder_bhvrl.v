`ifndef FADDER_BHVRL
`define FADDER_BHVRL
module fadder_bhvrl(
    output [3:0] sum,
    output cout,
    output ovrflow,
    input m,
    input [3:0] a,
    input [3:0] b
);

    always @( a or b or m) begin

        if(m == 0) begin

            

        end
        else begin
        end

    end

endmodule