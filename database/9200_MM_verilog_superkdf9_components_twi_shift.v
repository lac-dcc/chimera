// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

/*
00: Set master reset
01: Shift register
10: Storage register
11: Output Enable
*/
module shift(
input        clk      ,
input        rst      ,
input        vld      ,
input  [1:0] cmd      ,
input        cmd_oen  ,
input  [7:0] din      ,
output       done     ,

output       sft_shcp ,
output       sft_ds   ,
output       sft_stcp ,
output       sft_mr_n ,
output       sft_oe_n 
);

reg sft_mr_n ;
reg sft_oe_n ;
always @ ( posedge clk or posedge rst ) begin
	if( rst )
		sft_mr_n <= 1'b1 ;
	else if( vld && cmd == 2'b00 )
		sft_mr_n <= 1'b0 ;
	else
		sft_mr_n <= 1'b1 ;
end

always @ ( posedge clk or posedge rst ) begin
	if( rst )
		sft_oe_n <= 1'b1 ;
	else if( vld && cmd == 2'b11 )
		sft_oe_n <= cmd_oen ;
end

//--------------------------------------------------
// shcp counter
//--------------------------------------------------
reg [5:0] shcp_cnt ;
always @ ( posedge clk ) begin
	if( rst )
		shcp_cnt <= 0 ;
	else if( vld && cmd == 2'b01 )
		shcp_cnt <= 1 ;
	else if( |shcp_cnt )
		shcp_cnt <= shcp_cnt + 1 ;
end

assign sft_shcp = shcp_cnt[2] ;

reg [7:0] data ;
always @ ( posedge clk ) begin
	if( vld && cmd == 2'b01 )
		data <= din ;
	else if( &shcp_cnt[2:0] )
		data <= data >> 1 ;
end

assign sft_ds = (vld&&cmd==2'b01) ? din[0] : data[0] ;


//--------------------------------------------------
// sft_stcp
//--------------------------------------------------
reg [5:0] stcp_cnt ;
always @ ( posedge clk ) begin
	if( rst )
		stcp_cnt <= 0 ;
	else if( vld && cmd == 2'b10 )
		stcp_cnt <= 1 ;
	else if( |stcp_cnt )
		stcp_cnt <= stcp_cnt + 1 ;
end
assign sft_stcp = stcp_cnt[2] ;

//--------------------------------------------------
// done
//--------------------------------------------------
assign done = (stcp_cnt == 63) || (shcp_cnt == 63) ;

endmodule
