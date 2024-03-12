//***********************************************************
//频、相可调，任意波形信号发生器系统设计
//实现频率、相位可调，正弦波，方波，锯齿波，三角波信号发生

module sin_dds(clk,rst_n,fword,pword,data_out,data_change);
`define OUT_WIDTH 8
`define ADDR_WIDTH 10

input clk;      //定义系统时钟
input rst_n;    //复位信号
input [`ADDR_WIDTH-1:0]fword;           //定义频率控制�
input [`ADDR_WIDTH-1:0]pword;           //定义相位控制�
 
output [`OUT_WIDTH-1:0] data_out;      //输出波形数据
output data_change;          //波形数据发生改变标志�

//------------------------------相位累加器部�-----------------------------
reg [`ADDR_WIDTH-1:0] fre_add;
always @ (posedge clk or negedge rst_n) begin 
   if(!rst_n) fre_add <= `ADDR_WIDTH'd0;
	else fre_add <= fre_add + fword;//相位累加
end
				  
reg [`ADDR_WIDTH-1:0] rom_addr;
always @ (posedge clk or negedge rst_n) begin 
    if(!rst_n)
    	rom_addr <= `ADDR_WIDTH'd0;
	else 
		rom_addr <= fre_add+pword;//波形地址
end 

//----------------------数据变化标志位产生模�----------------------
reg [`ADDR_WIDTH-1:0]register1;
reg [`ADDR_WIDTH-1:0]register2;
always @ (posedge clk or negedge rst_n) begin 
   if(!rst_n) begin
		 register1 <= `ADDR_WIDTH'd0;
		 register2 <= `ADDR_WIDTH'd0;
		 end
	 else begin 
	    register1 <= rom_addr;
		register2 <= register1;
	 end
end
assign  data_change = (register1 == register2)? 1'd0:1'd1;  
//两次数据比较值不同，说明数据发生改变

//-----------------------------ROM模块例化------------------------------------
rom	rom_inst1 (
	.addra ( rom_addr ),
	.clka ( clk ),
	.douta ( data_out )
	);

endmodule 