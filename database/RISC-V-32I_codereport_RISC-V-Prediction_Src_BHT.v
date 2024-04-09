
module BHT #( //Branch History Table，采用直接映射
	parameter  TABLE_ADDR_LEN = 12//决定了Table有多大，此处应该与BTB中的BUFFER_ADDR_LEN一致
)(
	input  clk, rst,
	input [31:0] rd_PC,					//输入PC
	output reg rd_predicted_taken,		//对外输出的信号, 表示预测rd_PC跳转
	input wr_req,						//写请求信号
	input [31:0] wr_PC,					//要更新的分支PC
	input [31:0] wr_taken				//要更新的分支PC实际是否跳转
);

localparam TABLE_SIZE = 1 << TABLE_ADDR_LEN;		//计算buffer的大小

reg [1 : 0] Table [0 : TABLE_SIZE - 1];//TABLE_SIZE个分支PC的状态

wire [TABLE_ADDR_LEN - 1 : 0] rd_table_addr;
wire [TABLE_ADDR_LEN - 1 : 0] wr_table_addr;


assign rd_table_addr = rd_PC[TABLE_ADDR_LEN + 1 : 2]; //取PC低为表地址，跳过末2位
assign wr_table_addr = wr_PC[TABLE_ADDR_LEN + 1 : 2]; //取PC低为表地址，跳过末2位 

always @ (*) begin //状态0/1预测不跳转，2/3预测跳转
	rd_predicted_taken = Table[rd_table_addr] >= 2'b10;
end

always @ (posedge clk or posedge rst) begin//写入buffer
	if(rst) begin
		for(integer i = 0; i < TABLE_SIZE; i = i + 1) begin
			Table[i] = 2'b00;
		end
		rd_predicted_taken = 2'b00;
	end else begin
		if(wr_req) begin//更新PC对应表项的状态，如果实际taken:0->1->2->3->...->3，如果实际not taken: 3->2->1->0->...->0
			if(wr_taken) begin
				if(Table[wr_table_addr] != 2'b11) 
					Table[wr_table_addr] <= Table[wr_table_addr] + 2'b01;
				else
					Table[wr_table_addr] <= Table[wr_table_addr];
			end else begin
				if(Table[wr_table_addr] != 2'b00) 
					Table[wr_table_addr] <= Table[wr_table_addr] - 2'b01;
				else
					Table[wr_table_addr] <= Table[wr_table_addr];
			end
		end
	end
end

endmodule





