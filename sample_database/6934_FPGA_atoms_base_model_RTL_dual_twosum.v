// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

////////////////////////////////////////////
// 双二位加法器
///////////////////////////////////////////

module sumfour(
    input           clk,
    input           rst,
    output  [3:0]   o_cnt_1,
    output  [3:0]   o_cnt_2
);

reg [3:0]   cnt_1;
reg [3:0]   cnt_2;


// 验证 cnt_1 和 cnt_2 两个信号是并行执行 always 块的内容
always@(posedge clk or negedge rst) begin
    if(!rst) begin
        cnt_1 <= 0;
    end
    else begin
        cnt_1 <= cnt_1 + 1'b1;
    end
end

always@(posedge clk or negedge rst) begin
    if(!rst) begin
        cnt_2 <= 0;
    end
    else begin
        cnt_2 <= cnt_2 + 1'b1;
    end
end

assign o_cnt_1 = cnt_1;
assign o_cnt_2 = cnt_2;

endmodule