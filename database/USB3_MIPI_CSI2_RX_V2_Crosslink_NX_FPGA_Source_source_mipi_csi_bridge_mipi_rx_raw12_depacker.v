`timescale 1ns/1ns

/*
MIPI CSI RX to Parallel Bridge (c) by Gaurav Singh www.CircuitValley.com

MIPI CSI RX to Parallel Bridge is licensed under a
Creative Commons Attribution 3.0 Unported License.

You should have received a copy of the license along with this
work.  If not, see <http://creativecommons.org/licenses/by/3.0/>.
*/

/*
Receives 4 lane raw mipi bytes from packet decoder, rearrange bytes to output 4 pixel 12bit each 
output is one clock cycle delayed, because the way , MIPI RAW12 is packed 
output come in group of 2x48bit chunk on each clock cycle, output_valid_o remains active only while 8 pixel chunk is outputted 
*/

module mipi_rx_raw10_depacker(	clk_i,
								data_valid_i,
								data_i,
								output_valid_o,
								output_o);

localparam [2:0]TRANSFERS_PERPACK = 3'h2; // RAW 12 is packed <Sample0[10:4]> <Sample1[10:4]> <Sample1[3:0], Sample0[3:0]><Sample2[10:4]> <Sample3[10:4]> <Sample3[3:0],Sample2[3:0]>
input clk_i;
input data_valid_i;
input [31:0]data_i;
output reg output_valid_o;
output reg [47:0]output_o; 

reg [7:0]offset;
reg [2:0]byte_count;
reg [31:0]last_data_i;

wire [63:0]word;
assign word = {data_i,last_data_i}; //would need last bytes as well as current data to get full 4 pixel

always @(posedge clk_i)
begin
	
	if (data_valid_i)
	begin
		last_data_i <= data_i;
		//RAW 12 , Byte1 -> Byte2 -> Byte3 -> Byte4 -> [ LSbB4[1:0] LSbB3[1:0] LSbB2[1:0] LSbB1[1:0] ]
		output_o[47:36] <= 	{word [(offset + 7) -:8], 	word [(offset + 23) -:4]}; 		//lane 1
		output_o[35:24] <= 	{word [(offset + 15) -:8], 	word [(offset + 19) -:4]};		
		output_o[23:12] <= 	{word [(offset + 31) -:8], 	word [(offset + 51) -:4]};
		output_o[11:0] 	<= 	{word [(offset + 39) -:8], 	word [(offset  + 47) -:4]};		//lane 4
		
		if (byte_count < (TRANSFERS_PERPACK))
		begin
			byte_count <= byte_count + 1'd1;
			if (byte_count )
			begin
				offset <= ((offset + 8'd16) & 8'h1F);
				output_valid_o <= 1'h1;
			end
		end
		else
		begin
			
			offset <= 8'h0;
			byte_count <= 4'b1;		//this byte is the first byte
			output_valid_o <= 1'h0;
		end
	end
	else
	begin
		output_o <= 40'h0;
		last_data_i <= 1'h0;
		offset <= 8'h0;
		byte_count <= 3'b0;
		output_valid_o <= 1'h0;
	end
end

endmodule