/************************************************************************************************
*  Name         :mul2.v
*  Description  :
*  Origin       :200321
*  Author       :helrori2011@gmail.com
************************************************************************************************/
module mul2
(
   input    wire                     clk         ,        
   input    wire                     rst_n       ,
   input    wire  signed   [12-1 :0] din         ,
   input    wire  signed   [12-1 :0] ain         ,
   input    wire  signed   [12-1 :0] bin         ,
   output   wire  signed   [16-1 :0] aout        ,
   output   wire  signed   [16-1 :0] bout        
);

reg signed[24-1:0]aout_b;
reg signed[24-1:0]bout_b;
localparam BOUT = 24;
localparam COUT = 16;
// 四舍五入
wire    carry_bit0   =  aout_b[BOUT-1] ? ( aout_b[BOUT-(COUT-1)-1-1] & ( |aout_b[BOUT-(COUT-1)-1-1-1:0] ) ) : aout_b[BOUT-(COUT-1)-1-1] ;
assign  aout         = {aout_b[BOUT-1], aout_b[BOUT-1:BOUT-(COUT-1)-1]} + carry_bit0 ;
wire    carry_bit1   =  bout_b[BOUT-1] ? ( bout_b[BOUT-(COUT-1)-1-1] & ( |bout_b[BOUT-(COUT-1)-1-1-1:0] ) ) : bout_b[BOUT-(COUT-1)-1-1] ;
assign  bout         = {bout_b[BOUT-1], bout_b[BOUT-1:BOUT-(COUT-1)-1]} + carry_bit1 ;

always@(posedge clk or negedge rst_n)begin
    if ( !rst_n ) begin
        aout_b  <=  'd0;
        aout_b  <=  'd0;
    end else begin
        aout_b  <=  ain * din;
        bout_b  <=  bin * din;
    end
end
endmodule
