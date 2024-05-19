// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense


`include "alink_define.v"
module rx_phy(
input         clk            ,
input         rst            ,

input         reg_flush      ,
input         reg_busy       ,

input         task_id_vld    ,
input  [31:0] task_id_h      ,
input  [31:0] task_id_l      ,
input  [31:0] timer_cnt      ,

output        rx_start       ,
output        rx_last        ,
output        rx_vld         ,
output [31:0] rx_dat         ,

input         RX_P           ,
input         RX_N            
);
parameter MY_RXID = 32'd0 ;
/*
>INPUT<
                                   __
task_id_vld      _________________|  |_________________________
                 _________________ __ _________________________
[task_id_h       _________________|0_|_________________________
task_id_l]

>OUTPUT<
             __
rx_start  __|  |____________________________________________________________
                                                           __
rx_last   ________________________________________________|  |______________
                _____________________________________________
rx_vld    _____|                                             |______________

          _____ _____________________________________________ ______________
rx_dat    _____|RXID    |TaskID_H|TaskID_L|TIME    |NONCE    |______________
                (word0)  (word1)  (word2)  (word3)  (word4)
*/

//-------------------------------------------------
// Receive 1/0/start/stop
//-------------------------------------------------
reg [3:0] report_p_d ;
reg [3:0] report_n_d ;

always@(posedge clk or posedge rst )begin
	if( reg_flush || rst || ~reg_busy) begin
		report_p_d <= 4'hf ; 
		report_n_d <= 4'hf ; 
	end else begin
		report_p_d <= #1 {report_p_d[2:0], RX_P};
		report_n_d <= #1 {report_n_d[2:0], RX_N};
	end
end
wire rx_0 = ((~report_n_d[3]) && (&report_n_d[2:1])) && ~(|report_p_d[3:1]);
wire rx_1 = ((~report_p_d[3]) && (&report_p_d[2:1])) && ~(|report_n_d[3:1]);
wire rx_stop  = (report_p_d[3]^report_n_d[3]) && (report_p_d[2]^report_n_d[2]) && (report_p_d[1]&report_n_d[1]) ;
/*
wire rx_stop  = (&report_p_d[3:1] && ~report_n_d[3] && &report_n_d[2:1]) || 
                (&report_n_d[3:1] && ~report_p_d[3] && &report_p_d[2:1]) || 
                (~report_p_d[3] && &report_p_d[2:1] && ~report_n_d[3] && &report_n_d[2:1]) ; 
*/

reg [31:0] nonce_buf;
always@(posedge clk)begin
	if(rx_0)
		nonce_buf <= #1 {1'b0, nonce_buf[31:1]};
	else if(rx_1)
		nonce_buf <= #1 {1'b1, nonce_buf[31:1]};
end

//-------------------------------------------------
// Receive TaskID&Timer
//-------------------------------------------------
reg [31:0] task_id_h_r ;
reg [31:0] task_id_l_r ;
always @ ( posedge clk ) begin
	if( ~rx_vld && task_id_vld ) begin
			task_id_h_r  <= task_id_h ;
			task_id_l_r  <= task_id_l ;
	end
end
//-------------------------------------------------
// Push Out
//-------------------------------------------------
reg [2:0] push_cnt ;
always @ ( posedge clk ) begin
	if( rst )
		push_cnt <= 3'b0 ;
	else if( reg_busy && rx_stop && ~rx_vld)
		push_cnt <= 3'b1 ;
	else if( |push_cnt && push_cnt < `RX_DATA_LEN )
		push_cnt <= push_cnt + 3'b1 ;
	else
		push_cnt <= 3'b0 ;
end

assign rx_vld = |push_cnt ;
assign rx_dat = push_cnt == 1 ? MY_RXID :
		push_cnt == 2 ? task_id_h_r :
		push_cnt == 3 ? task_id_l_r :
		push_cnt == 4 ? timer_cnt   : nonce_buf ;
assign rx_start = reg_busy && rx_stop && ~rx_vld ;
assign rx_last  = push_cnt == `RX_DATA_LEN ;
endmodule
