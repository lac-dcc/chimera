
module BTB #( //Branch Target Buffer，采用直接映射
	parameter  BUFFER_ADDR_LEN = 12//决定了Buffer有多大
)(
	input  clk, rst,

	input [31:0] rd_PC,					//输入PC
	output reg rd_predicted,				//对外输出的信号, 表示rd_PC是跳转指令，此时rd_predicted_PC是有效数据
	output reg [31:0] rd_predicted_PC,	//从buffer中得到的预测PC
	input wr_req,						//写请求信号
	input [31:0] wr_PC,					//要写入的分支PC
	input [31:0] wr_predicted_PC,		//要写入的预测PC
	input wr_predicted_state_bit		//要写入的预测状态位
);

localparam TAG_ADDR_LEN = 32 - BUFFER_ADDR_LEN - 2;	//计算tag的数据位宽
localparam BUFFER_SIZE = 1 << BUFFER_ADDR_LEN;		//计算buffer的大小

reg [TAG_ADDR_LEN - 1 : 0] PCTag			[0 : BUFFER_SIZE - 1];//BUFFER_SIZE个分支PC的TAG
reg [              31 : 0] PredictPC		[0 : BUFFER_SIZE - 1];//BUFFER_SIZE个预测PC
reg                        PredictStateBit	[0 : BUFFER_SIZE - 1];//BUFFER_SIZE个预测状态位

wire [BUFFER_ADDR_LEN - 1 : 0] rd_buffer_addr;//将输入地址拆分成3个部分
wire [   TAG_ADDR_LEN - 1 : 0] rd_tag_addr;
wire [              2 - 1 : 0] rd_word_addr; //PC是4的倍数，末2位总为0

wire [BUFFER_ADDR_LEN - 1 : 0] wr_buffer_addr;//将输入地址拆分成3个部分
wire [   TAG_ADDR_LEN - 1 : 0] wr_tag_addr;
wire [              2 - 1 : 0] wr_word_addr; //PC是4的倍数，末2位总为0

assign {rd_tag_addr, rd_buffer_addr, rd_word_addr} = rd_PC; //拆分 32bit rd_PC
assign {wr_tag_addr, wr_buffer_addr, wr_word_addr} = wr_PC; //拆分 32bit wr_PC

always @ (*) begin //判断输入的 PC 是否在 buffer 中命中
	if(PCTag[rd_buffer_addr] == rd_tag_addr && PredictStateBit[rd_buffer_addr])//如果tag与输入地址中的tag部分相等且buffer的该项有效，则命中
		rd_predicted = 1'b1;
	else
		rd_predicted = 1'b0;
	rd_predicted_PC = PredictPC[rd_buffer_addr];
end

always @ (posedge clk or posedge rst) begin//写入buffer
	if(rst) begin
		for(integer i = 0; i < BUFFER_SIZE; i = i + 1) begin
			PCTag[i] = 0;
			PredictPC[i] = 0;
			PredictStateBit[i] = 1'b0;
		end
		rd_predicted = 1'b0;
		rd_predicted_PC = 0;
	end else begin
		if(wr_req) begin
			PCTag[wr_buffer_addr] <= wr_tag_addr;
			PredictPC[wr_buffer_addr] <= wr_predicted_PC;
			PredictStateBit[wr_buffer_addr] <= wr_predicted_state_bit;
		end
	end
end

endmodule





