(* techmap_celltype = "_74xx_counter8 _74xx_counter16 _74xx_counter32" *)
module _80_74AC161_counter (rst, clk, preset, counter);
parameter _TECHMAP_CELLTYPE_ = "";
parameter WIDTH = (_TECHMAP_CELLTYPE_ == "_74xx_counter8") ? 8 : (_TECHMAP_CELLTYPE_ == "_74xx_counter16" ? 16 : 32) ;

input rst;
input clk;
input [WIDTH-1:0] preset;
output reg [WIDTH-1:0] counter;

wire [WIDTH:0] C;
assign C[0] = 1'b1;

genvar i;
generate for (i = 0; i < WIDTH; i = i + 4) begin:slice
    \74AC161_1x1COUNT4 counter_i(
        .A(preset[i+3:i]),
        .Q(counter[i+3:i]),
        .CLK(clk),
        .ENT(C[i]),
        .RCO(C[i+4]),
        .LOAD(rst)
    );
end
endgenerate

endmodule
