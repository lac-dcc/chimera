// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

/////////////////////////////////////////////////
// 实现的功能是将输入值转递给触发器1，而后 q 接触发器2，
// 主要是为了写验证平台代码
/////////////////////////////////////////////////

module dtrig(
    input          clk,
    input          rst,
    input  [3:0]   d,
    output [3:0]   q
);

reg [3:0]   cnt_1;
reg [3:0]   cnt_2;

always@(posedge clk or negedge rst)
begin
    if(!rst) begin
        cnt_1 <= 0;
    end
    else begin
        cnt_1 <= d;
    end
end

always@(posedge clk or negedge rst)
begin
    if(!rst) begin
        cnt_2 <= 0;
    end
    else begin
        cnt_2 <= cnt_1;
    end
end

assign q = cnt_2;

endmodule