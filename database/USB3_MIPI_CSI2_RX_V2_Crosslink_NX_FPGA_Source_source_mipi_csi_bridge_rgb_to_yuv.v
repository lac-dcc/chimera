`timescale 1ns/1ns

/*
MIPI CSI RX to Parallel Bridge (c) by Gaurav Singh www.CircuitValley.com

MIPI CSI RX to Parallel Bridge is licensed under a
Creative Commons Attribution 3.0 Unported License.

You should have received a copy of the license along with this
work.  If not, see <http://creativecommons.org/licenses/by/3.0/>.
*/

/*
received 4 pixel 120bit RGB from the Debayer filter output 64bit 4pixel yuv422 
Calculation is done based on integer YUV formula from the YUV wiki page 
*/

module rgb_to_yuv(clk_i, //data changes on rising edge , latched in on falling edge
				  reset_i,
				  rgb_i,
				  rgb_valid_i,
				  yuv_o,
				  yuv_valid_o);
				  
localparam PIXEL_DEPTH = 5'd16; //10bit per color				  
localparam PIXEL_PER_CLK = 4'd4;  //4pixels per clock cycle comes , should be even
input clk_i;
input reset_i;
input [((PIXEL_DEPTH * PIXEL_PER_CLK * 3) - 1'd1):0]rgb_i;
input rgb_valid_i;

output reg [((PIXEL_PER_CLK * 2 * 8) - 1'd1):0]yuv_o;
output reg yuv_valid_o;

reg [7:0]Y[3:0]; // result 
reg [7:0]U[3:0];
reg [7:0]V[3:0];


//from YUV wiki page full swing
// Y = ((77 R + 150G + 29B + 128) >>10)
// U = ((-43R - 84G + 127B + 128) >>10) + 128
// V = ((127R -106G -21B +128) >>10) + 128

reg [23:0]Y0_R;
reg [23:0]Y0_G;
reg [23:0]Y0_B;
reg [23:0]Y1_R;
reg [23:0]Y1_G;
reg [23:0]Y1_B;
reg [23:0]Y2_R;
reg [23:0]Y2_G;
reg [23:0]Y2_B;
reg [23:0]Y3_R;
reg [23:0]Y3_G;
reg [23:0]Y3_B;

reg [23:0]U0_R;
reg [23:0]U0_G;
reg [23:0]U0_B;
reg [23:0]U2_R;
reg [23:0]U2_G;
reg [23:0]U2_B;

reg [23:0]V0_R;
reg [23:0]V0_G;
reg [23:0]V0_B;
reg [23:0]V2_R;
reg [23:0]V2_G;
reg [23:0]V2_B;

reg [23:0]Y0_ADD;
reg [23:0]Y1_ADD;
reg [23:0]Y2_ADD;
reg [23:0]Y3_ADD;

reg [23:0]U0_ADD;
reg [23:0]U2_ADD;

reg [23:0]V0_ADD;
reg [23:0]V2_ADD;

reg [23:0]Y0_ADD_STAGE2;
reg [23:0]Y0_ADD_STAGE3;
reg [23:0]Y0_ADD_STAGE4;

reg [23:0]Y1_ADD_STAGE2;
reg [23:0]Y1_ADD_STAGE3;
reg [23:0]Y1_ADD_STAGE4;

reg [23:0]Y2_ADD_STAGE2;
reg [23:0]Y2_ADD_STAGE3;
reg [23:0]Y2_ADD_STAGE4;

reg [23:0]Y3_ADD_STAGE2;
reg [23:0]Y3_ADD_STAGE3;
reg [23:0]Y3_ADD_STAGE4;


reg [23:0]U0_ADD_STAGE2;
reg [23:0]U0_ADD_STAGE3;
reg [23:0]U0_ADD_STAGE4;

reg [23:0]V0_ADD_STAGE2;
reg [23:0]V0_ADD_STAGE3;
reg [23:0]V0_ADD_STAGE4;


reg [23:0]U2_ADD_STAGE2;
reg [23:0]U2_ADD_STAGE3;
reg [23:0]U2_ADD_STAGE4;

reg [23:0]V2_ADD_STAGE2;
reg [23:0]V2_ADD_STAGE3;
reg [23:0]V2_ADD_STAGE4;


reg [23:0]not_used24; //to suppress warning from the tool 
always @(negedge  clk_i)
begin
	yuv_valid_o <= rgb_valid_i; 
	
	Y0_R <= ( 77 * rgb_i[176 +: 16]);
	Y0_G <= (150 * rgb_i[160 +: 16]);
	Y0_B <= ( 29 * rgb_i[144  +: 16]);
	
	U0_R <= (127 * rgb_i[144 +: 16]);
	U0_G <= (43  * rgb_i[176 +: 16]);
	U0_B <= ( 84 * rgb_i[160 +: 16]);
	
	V0_R <= (127 * rgb_i[176 +: 16]);
	V0_G <= (106 * rgb_i[160 +: 16]);
	V0_B <= ( 21 * rgb_i[144  +: 16]);
	
	Y0_ADD <= Y0_R + Y0_G;
	
	U0_ADD <= U0_R - U0_G;
	
	V0_ADD <= V0_R - V0_G;
	
	Y0_ADD_STAGE2 <=  Y0_ADD + Y0_B;
	Y0_ADD_STAGE3 <= (Y0_ADD_STAGE2 + 18'd128) >> 16;
	Y0_ADD_STAGE4 <=  Y0_ADD_STAGE3;
	
	U0_ADD_STAGE2 <=  U0_ADD - U0_B;
	U0_ADD_STAGE3 <= (U0_ADD_STAGE2 + + 18'd128) >> 16;
	U0_ADD_STAGE4 <=  U0_ADD_STAGE3 + 32'd128;
	
	V0_ADD_STAGE2 <=  V0_ADD - V0_B;
	V0_ADD_STAGE3 <= (V0_ADD_STAGE2 + 18'd128) >> 16;
	V0_ADD_STAGE4 <=  V0_ADD_STAGE3 + 32'd128;
	
	{not_used24,Y[0]} = Y0_ADD_STAGE4;
	{not_used24,U[0]} = U0_ADD_STAGE4;
	{not_used24,V[0]} = V0_ADD_STAGE4;
	
	Y1_R <= ( 77 * rgb_i[128  +: 16]);
	Y1_G <= (150 * rgb_i[112  +: 16]);
	Y1_B <= (29 * rgb_i[96  +: 16]);
	
	Y1_ADD <= Y1_R +  Y1_G;
	Y1_ADD_STAGE2 <=  Y1_ADD + Y1_B;
	Y1_ADD_STAGE3 <= (Y1_ADD_STAGE2 + 18'd128) >> 16;
	Y1_ADD_STAGE4 <=  Y1_ADD_STAGE3;
	
	{not_used24,Y[1]} = Y1_ADD_STAGE4;
	//U[1] and V[1]  not need to yuv422 sub sampling
	
	Y2_R <= ( 77 * rgb_i[128 +: 16]);				//TODO May be incorrect index , because same as Y1_R
	Y2_G <= (150 * rgb_i[64  +: 16]);
	Y2_B <= ( 29 * rgb_i[48 +: 16]);
	
	U2_R <= (127 * rgb_i[48  +: 16]);
	U2_G <= ( 43 * rgb_i[128 +: 16]);
	U2_B <= (84 * rgb_i[64 +: 16]);
	
	V2_R <=  (127 * rgb_i[128 +: 16]);
	V2_G <=  (106 * rgb_i[64  +: 16]);
	V2_B <=  (21 * rgb_i[48 +: 16]);
	
	Y2_ADD <= Y2_R + Y2_G;
	
	U2_ADD <= U2_R - U2_G;
	
	V2_ADD <= V2_R - V2_G;
	
	Y2_ADD_STAGE2 <= Y2_ADD + Y2_B;
	Y2_ADD_STAGE3 <= (Y2_ADD_STAGE2 + 18'd128) >> 16;
	Y2_ADD_STAGE4 <= Y2_ADD_STAGE3;
	
	
	U2_ADD_STAGE2 <= U2_ADD - U2_B;
	U2_ADD_STAGE3 <= (U2_ADD_STAGE2 + + 18'd128) >> 16;
	U2_ADD_STAGE4 <= U2_ADD_STAGE3 + 32'd128;
	
	V2_ADD_STAGE2 <=  V2_ADD - V2_B;
	V2_ADD_STAGE3 <= (V2_ADD_STAGE2 + 18'd128) >> 16;
	V2_ADD_STAGE4 <=  V2_ADD_STAGE3 + 32'd128;
	
	{not_used24,Y[2]} = Y2_ADD_STAGE4;
	{not_used24,U[2]} = U2_ADD_STAGE4;
	{not_used24,V[2]} = V2_ADD_STAGE4;
	
	Y3_R <= ( 77 * rgb_i[32 +: 16]);
	Y3_G <= (150 * rgb_i[16 +: 16]);
	Y3_B <= (29 * rgb_i[0 +: 16]);
	
	Y3_ADD <= Y3_R + Y3_G;
	Y3_ADD_STAGE2 <= Y3_ADD + Y3_B;
	Y3_ADD_STAGE3 <= (Y3_ADD_STAGE2 + 18'd128) >> 16;
	Y3_ADD_STAGE4 <= Y3_ADD_STAGE3;
	
	{not_used24,Y[3]} =  Y3_ADD_STAGE4;
	//U[3] and V[3]  not need to yuv422 sub sampling

	yuv_o = { Y[0], U[0], Y[1], V[0],		Y[2], U[2], Y[3], V[2]};
	
end

endmodule