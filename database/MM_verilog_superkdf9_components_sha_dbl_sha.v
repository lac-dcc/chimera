// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

module dbl_sha(
input         clk       ,
input         rst       ,

input         reg_dbl   ,
input         done      ,
input [255:0] hash      ,

output        dbl_vld   ,
output[31:0]  dbl_din    
);

/*
         _________________________
start __|                         |___
      ____ _                    __ ___
cnt   _0__|_1-------------------31|_0_

*/

reg start ;
reg [3:0] cnt ;//0~31
reg [255:0] hash_r ;

always @ ( posedge clk or posedge rst ) begin
	if( rst )
		start <= 1'b0 ;
	else if( reg_dbl )
		start <= 1'b1 ;
	else if( cnt == 15 )
		start <= 1'b0 ;
end

always @ ( posedge clk or posedge rst ) begin
	if( rst )
		cnt <= 'b0 ;
	else if( start )
		cnt <= cnt + 'b1 ;
end

always @ ( posedge clk ) begin
	if( done )
		hash_r <= hash ;
	else if( start && cnt != 7 )
		hash_r <= hash_r << 32 ;
	else if( start )//cnt == 15
		hash_r <= 256'h80000000_00000000_00000000_00000000_00000000_00000000_00000000_00000100 ;
end

assign dbl_vld = start ;
assign dbl_din = hash_r[255:255-31] ;

endmodule
