// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense


`include "alink_define.v"
module rxc(
input                    clk            ,
input                    rst            ,

input                    reg_flush      ,
input  [31:0]            reg_mask       ,
input  [31:0]            reg_busy       ,
input                    rx_almost_full , 

input                    tx_phy_start   ,
input  [31:0]            tx_phy_sel     ,

input                    task_id_vld    ,
input  [31:0]            rx_phy_sel     ,
input  [31:0]            task_id_h      ,
input  [31:0]            task_id_l      ,
input  [`PHY_NUM*32-1:0] timer_cnt      ,

output reg               rx_vld         ,
output reg [31:0]        rx_dat         ,

input  [`PHY_NUM-1:0]            RX_P           ,
input  [`PHY_NUM-1:0]            RX_N            
);
/*
>INPUT<
                       __
tx_phy_start     _____|  |_____________________________________
                 _____ __ _____________________________________
tx_phy_sel       _____|0 |_________________dont care___________
                                                          __
tx_phy_done      ________________________________________|  |__
                                   __
task_id_vld      _________________|  |_________________________
                 _________________ __ _________________________
[rx_phy_sel      _________________|0_|_________________________
task_id_h
task_id_l]

>OUTPUT<
          _____________________________________________
rx_vld __|                                             |______________

       __ _____________________________________________ ______________
rx_dat __|RXID    |TaskID_H|TaskID_L|TIME    |NONCE    |______________

*/
wire [31:0] rx_start ;
wire [31:0] rx_last  ;
wire [31:0] rx_vldx   ;
wire [`PHY_NUM*32-1:0] rx_datx   ;
reg [31:0] rx_sel ;

genvar i ;
generate
for(i=0;i<`PHY_NUM;i=i+1) begin : G
	rx_phy #(.MY_RXID(i)) rx_phy(
	/*input         */ .clk            (clk                        ) ,
	/*input         */ .rst            (rst                        ) ,
                                                                       
	/*input         */ .reg_flush      (reg_flush                  ) ,
	/*input         */ .reg_busy       (reg_busy[i]                ) ,
                                                           
	/*input         */ .task_id_vld    (task_id_vld&&rx_phy_sel[i] ) ,
	/*input  [31:0] */ .task_id_h      (task_id_h                  ) ,
	/*input  [31:0] */ .task_id_l      (task_id_l                  ) ,
	/*input  [31:0] */ .timer_cnt      (timer_cnt[32*i+32-1:32*i]  ) ,
                                                           
	/*output        */ .rx_start       (rx_start[i]                ) ,
	/*output        */ .rx_last        (rx_last[i]                 ) ,
	/*output        */ .rx_vld         (rx_vldx[i]                 ) ,
	/*output [31:0] */ .rx_dat         (rx_datx[32*i+32-1:32*i]    ) ,
                                                           
	/*input         */ .RX_P           (RX_P[i]                    ) ,
	/*input         */ .RX_N           (RX_N[i]                    )  
	);
end
endgenerate

//--------------------------------------------
// RX.Select
//--------------------------------------------
always @ ( posedge clk ) begin
	if( rst || reg_flush ) rx_sel <= 32'b0 ;
	else if( |(rx_sel&rx_last) ) rx_sel <= 32'b0 ;//clear sel
	else if( ~rx_almost_full && rx_start[0 ] ) rx_sel <= 32'b1<<0  ;
	else if( ~rx_almost_full && rx_start[1 ] ) rx_sel <= 32'b1<<1  ;
	else if( ~rx_almost_full && rx_start[2 ] ) rx_sel <= 32'b1<<2  ;
	else if( ~rx_almost_full && rx_start[3 ] ) rx_sel <= 32'b1<<3  ;
	else if( ~rx_almost_full && rx_start[4 ] ) rx_sel <= 32'b1<<4  ;
`ifdef PHY_10
	else if( ~rx_almost_full && rx_start[5 ] ) rx_sel <= 32'b1<<5  ;
	else if( ~rx_almost_full && rx_start[6 ] ) rx_sel <= 32'b1<<6  ;
	else if( ~rx_almost_full && rx_start[7 ] ) rx_sel <= 32'b1<<7  ;
	else if( ~rx_almost_full && rx_start[8 ] ) rx_sel <= 32'b1<<8  ;
	else if( ~rx_almost_full && rx_start[9 ] ) rx_sel <= 32'b1<<9  ;
	else if( ~rx_almost_full && rx_start[10] ) rx_sel <= 32'b1<<10 ;
	else if( ~rx_almost_full && rx_start[11] ) rx_sel <= 32'b1<<11 ;
	else if( ~rx_almost_full && rx_start[12] ) rx_sel <= 32'b1<<12 ;
	else if( ~rx_almost_full && rx_start[13] ) rx_sel <= 32'b1<<13 ;
	else if( ~rx_almost_full && rx_start[14] ) rx_sel <= 32'b1<<14 ;
	else if( ~rx_almost_full && rx_start[15] ) rx_sel <= 32'b1<<15 ;
	else if( ~rx_almost_full && rx_start[16] ) rx_sel <= 32'b1<<16 ;
	else if( ~rx_almost_full && rx_start[17] ) rx_sel <= 32'b1<<17 ;
	else if( ~rx_almost_full && rx_start[18] ) rx_sel <= 32'b1<<18 ;
	else if( ~rx_almost_full && rx_start[19] ) rx_sel <= 32'b1<<19 ;
	else if( ~rx_almost_full && rx_start[20] ) rx_sel <= 32'b1<<20 ;
	else if( ~rx_almost_full && rx_start[21] ) rx_sel <= 32'b1<<21 ;
	else if( ~rx_almost_full && rx_start[22] ) rx_sel <= 32'b1<<22 ;
	else if( ~rx_almost_full && rx_start[23] ) rx_sel <= 32'b1<<23 ;
	else if( ~rx_almost_full && rx_start[24] ) rx_sel <= 32'b1<<24 ;
	else if( ~rx_almost_full && rx_start[25] ) rx_sel <= 32'b1<<25 ;
	else if( ~rx_almost_full && rx_start[26] ) rx_sel <= 32'b1<<26 ;
	else if( ~rx_almost_full && rx_start[27] ) rx_sel <= 32'b1<<27 ;
	else if( ~rx_almost_full && rx_start[28] ) rx_sel <= 32'b1<<28 ;
	else if( ~rx_almost_full && rx_start[29] ) rx_sel <= 32'b1<<29 ;
	else if( ~rx_almost_full && rx_start[30] ) rx_sel <= 32'b1<<30 ;
	else if( ~rx_almost_full && rx_start[31] ) rx_sel <= 32'b1<<31 ;
`endif
end

//--------------------------------------------
// RX.MUX
//--------------------------------------------
always @ ( posedge clk ) begin
	if( rst )
		rx_vld <= 1'b0 ;
	else
		rx_vld <= |rx_sel ;

	rx_dat <=  ({32{rx_sel[0 ]}} & rx_datx[32*1 -1:32*0 ]) 
                 | ({32{rx_sel[1 ]}} & rx_datx[32*2 -1:32*1 ]) 
                 | ({32{rx_sel[2 ]}} & rx_datx[32*3 -1:32*2 ]) 
                 | ({32{rx_sel[3 ]}} & rx_datx[32*4 -1:32*3 ]) 
                 | ({32{rx_sel[4 ]}} & rx_datx[32*5 -1:32*4 ]) 
`ifdef PHY_10 
                 | ({32{rx_sel[5 ]}} & rx_datx[32*6 -1:32*5 ]) 
                 | ({32{rx_sel[6 ]}} & rx_datx[32*7 -1:32*6 ]) 
                 | ({32{rx_sel[7 ]}} & rx_datx[32*8 -1:32*7 ]) 
                 | ({32{rx_sel[8 ]}} & rx_datx[32*9 -1:32*8 ]) 
                 | ({32{rx_sel[9 ]}} & rx_datx[32*10-1:32*9 ]) 
                 | ({32{rx_sel[10]}} & rx_datx[32*11-1:32*10]) 
                 | ({32{rx_sel[11]}} & rx_datx[32*12-1:32*11]) 
                 | ({32{rx_sel[12]}} & rx_datx[32*13-1:32*12]) 
                 | ({32{rx_sel[13]}} & rx_datx[32*14-1:32*13]) 
                 | ({32{rx_sel[14]}} & rx_datx[32*15-1:32*14]) 
                 | ({32{rx_sel[15]}} & rx_datx[32*16-1:32*15]) 
                 | ({32{rx_sel[16]}} & rx_datx[32*17-1:32*16]) 
                 | ({32{rx_sel[17]}} & rx_datx[32*18-1:32*17]) 
                 | ({32{rx_sel[18]}} & rx_datx[32*19-1:32*18]) 
                 | ({32{rx_sel[19]}} & rx_datx[32*20-1:32*19]) 
                 | ({32{rx_sel[20]}} & rx_datx[32*21-1:32*20]) 
                 | ({32{rx_sel[21]}} & rx_datx[32*22-1:32*21]) 
                 | ({32{rx_sel[22]}} & rx_datx[32*23-1:32*22]) 
                 | ({32{rx_sel[23]}} & rx_datx[32*24-1:32*23])
                 | ({32{rx_sel[24]}} & rx_datx[32*25-1:32*24]) 
                 | ({32{rx_sel[25]}} & rx_datx[32*26-1:32*25]) 
                 | ({32{rx_sel[26]}} & rx_datx[32*27-1:32*26]) 
                 | ({32{rx_sel[27]}} & rx_datx[32*28-1:32*27]) 
                 | ({32{rx_sel[28]}} & rx_datx[32*29-1:32*28]) 
                 | ({32{rx_sel[29]}} & rx_datx[32*30-1:32*29]) 
                 | ({32{rx_sel[30]}} & rx_datx[32*31-1:32*30]) 
                 | ({32{rx_sel[31]}} & rx_datx[32*32-1:32*31]) 
`endif
		;

end

endmodule
