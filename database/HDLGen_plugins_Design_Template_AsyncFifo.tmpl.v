//##############################################################################################################
//##############################################################################################################
//##############################################################################################################
//###                         Copyright 2022~2023 Wilson Chen                                                ###
//###            Licensed under the Apache License, Version 2.0 (the "License");                             ###
//###            You may not use this file except in compliance with the License.                            ###
//###            You may obtain a copy of the License at                                                     ###
//###                    http://www.apache.org/licenses/LICENSE-2.0                                          ###
//###            Unless required by applicable law or agreed to in writing, software                         ###
//###            distributed under the License is distributed on an "AS IS" BASIS,                           ###
//###            WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                    ###
//###            See the License for the specific language governing permissions and                         ###
//###            limitations under the License.                                                              ###
//##############################################################################################################
//##############################################################################################################
//##############################################################################################################

//================================================================================================
//======= this is internal design for Async Fifo ===============
//================================================================================================
//// default module name is : async_fifo

module <:$mod_name:> 
(
        // FIFO参数定义
         parameter   data_width = <:$dwd:>,// FIFO宽度
         parameter   data_depth = <:$depth:>,// FIFO深度
         parameter   address_width = <:$awd:>, // 地址宽度，对于深度为2^n的FIFO，需要的读/写指针位宽为(n+1)位，多的一位作为折返标志位
         input                           rst_wr,
         input                           wr_clk,
	 input                           wr_en,
         input      [data_width-1:0]     wr_din, 
         input                           rst_rd,
         input                           rd_clk,
         input                           rd_en,
         output reg [data_width-1:0]     rd_dout,
         output                          empty,
         output                          full
);
 
 
reg    [address_width:0]    wr_addr_p;//写地址指针
reg    [address_width:0]    rd_addr_p;//读地址指针
 
wire   [address_width-1:0]  wr_addr;//写RAM 地址
wire   [address_width-1:0]  rd_addr;//读RAM 地址
 
wire   [address_width:0]    wr_addr_gray;//写地址指针对应的格雷码
reg    [address_width:0]    wr_addr_gray_d1;
reg    [address_width:0]    wr_addr_gray_d2;//写地址指针同步到读时钟域对应的格雷码
 
wire   [address_width:0]    rd_addr_gray;//读地址指针对应的格雷码
reg    [address_width:0]    rd_addr_gray_d1;
reg    [address_width:0]    rd_addr_gray_d2;//读地址指针同步到写时钟域对应的格雷码";

<:
   if ($noram == 1) {
	    $OUT .= "                 reg    [data_width-1:0] FIFO_DFF_ARRAY [data_depth-1:0];// DFF Array用于存放FIFO数据";
	}
:>

// 写指针变化
always@(posedge write_clk or negedge rst_n)begin
    if(!rst_n)
        wr_addr_p <='h0;
    else if(write_en && (~full))// 写使能且非满
        wr_addr_p <= wr_addr_p + 1;
    else 
        wr_addr_p <= wr_addr_p;
end
 
assign wr_addr = wr_addr_p[address_width-1:0];// 读写RAM地址等于读写指针的低address_width位
 
// 写入
always@(posedge write_clk) begin
	if(write_en && (~full))// 写使能且非满
        FIFO_RAM[wr_addr] <= data_in;
    else
        FIFO_RAM[wr_addr] <= FIFO_RAM[wr_addr]; 
end
 
 
// 读指针变化      
always@(posedge read_clk or negedge rst_n)begin
    if(!rst_n)
        rd_addr_p <='h0;
    else if(read_en && (~empty))// 读使能且非空
        rd_addr_p <= rd_addr_p + 1;
    else 
        rd_addr_p <= rd_addr_p;
end
 
assign rd_addr = rd_addr_p[address_width-1:0];// 读写RAM地址等于读写指针的低address_width位

<: 
	if ($noram == 1) {
	$OUT .= "
// 读出
always@(posedge read_clk)begin
	if(read_en && (~empty))// 读使能且非空
        data_out <= FIFO_DFF_ARRAY[rd_addr];
    else
        data_out <='h0;
end
";

	} else {
		$OUT .= "
	// You need to replace your sram for you project a/o foundary
	mem_foundary_wrap mem_inst (
	   .wclk(wr_clk),
	   .rclk(rd_clk),
	   .wen(wr_en),
	   .ren(rd_en),
	   .waddr(wr_ptr),
	   .raddr(rd_ptr),
	   .din(wr_din),
	   .dout(rd_dout)
	);
	";
	}
:>
 
// 读写地址指针转换为格雷码
assign wr_addr_gray = (wr_addr_p >> 1) ^ wr_addr_p;
assign rd_addr_gray = (rd_addr_p >> 1) ^ rd_addr_p;
 
//格雷码同步化，读指针->写时钟域
always@(posedge write_clk)begin// 打两拍
    rd_addr_gray_d1 <= rd_addr_gray;
    rd_addr_gray_d2 <= rd_addr_gray_d1;
end
 
// 写指针->读时钟域
always@(posedge read_clk )begin// 打两拍
    wr_addr_gray_d1 <= wr_addr_gray;
    wr_addr_gray_d2 <= wr_addr_gray_d1;
end
 
//空满标志判断
assign full = (wr_addr_gray == {~(rd_addr_gray_d2[address_width:address_width-1]),rd_addr_gray_d2[address_width-2:0]}) ;//高两位不同，其余各位相同
assign empty = (rd_addr_gray == wr_addr_gray_d2 );// 读写时钟域每一位都相同
 
endmodule

