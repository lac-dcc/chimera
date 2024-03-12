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
         output reg [data_width-1:0]     rd_dout
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
   if ($test == 1) {
	   $OUT .= " // test line ";
	}
:>



//=======================================================================================================================
// Please add your implement logic below ,
// Please add any cfg parameter in _Cfg.json, and used in code as a variabe of  {$var}
//=======================================================================================================================



endmodule
