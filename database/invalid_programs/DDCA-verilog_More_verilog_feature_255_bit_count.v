// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

module top_module( 
    input [254:0] in,
    output [7:0] out );

always @(*) begin
    // 记住在out 
    // 一开始就要赋值 
    // 不然无法计算后续的结果 
    // 不会自动初始化为0
    out = 0;
    for(int i = 0 ; i < 255 ; i++)
    begin
        out = out + (in[i] == 1'b1 ? 1 : 0);
    end
end

endmodule
