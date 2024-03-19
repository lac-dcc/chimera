`timescale 1ns/1ns

/*
MIPI CSI RX to Parallel Bridge (c) by Gaurav Singh www.CircuitValley.com

MIPI CSI RX to Parallel Bridge is licensed under a
Creative Commons Attribution 3.0 Unported License.

You should have received a copy of the license along with this
work.  If not, see <http://creativecommons.org/licenses/by/3.0/>.
*/

/*
Takes 4x10bit pixel from RAW10 depacker module @mipi byte clock output 4x24bit RGB for each pixel , output is delayed by 2 lines 
Implement Basic Debayer filter, As debayer need pixel infrom neighboring pixel which may be on next or previous display line,
so input data is written onto RAM, only 4 lines are stored in RAM at one time and only three of the readable at any give time , RAM to which data is written to can not be read. 
as we have enough info in RAM,4 10bit pixel will be coverted to 4x24bit RGB output
First line is expected to RGRG , second line GBGB
*/

module debayer_filter(clk_i,
					  reset_i,
					  line_valid_i,
					  data_i,
					  data_valid_i,
					  output_valid_o,
					  output_o
					  );
					  
localparam PIXEL_WIDTH = 16; //bits per color
localparam INPUT_WIDTH = 64;	//4 x 16bit pixels from raw depacker module 
localparam OUTPUT_WIDTH = 192;  //4 x 48bit RGB output 

input clk_i;
input reset_i;
input line_valid_i;
input data_valid_i;
input [(INPUT_WIDTH -1):0] data_i;
output reg output_valid_o;
output reg [(OUTPUT_WIDTH-1):0]output_o;




reg [1:0]line_counter; //counts lines of the frame , needed determine if have enough data ins line rams to start outputting RGB data
reg data_valid_reg;

reg [(PIXEL_WIDTH - 1):0]R1[3:0];
reg [(PIXEL_WIDTH - 1):0]R2[3:0];
reg [(PIXEL_WIDTH - 1):0]R3[3:0];
reg [(PIXEL_WIDTH - 1):0]R4[3:0];

reg [(PIXEL_WIDTH - 1):0]B1[3:0];
reg [(PIXEL_WIDTH - 1):0]B2[3:0];
reg [(PIXEL_WIDTH - 1):0]B3[3:0];
reg [(PIXEL_WIDTH - 1):0]B4[3:0];

reg [(PIXEL_WIDTH - 1):0]G1[3:0];
reg [(PIXEL_WIDTH - 1):0]G2[3:0];
reg [(PIXEL_WIDTH - 1):0]G3[3:0];
reg [(PIXEL_WIDTH - 1):0]G4[3:0];


reg [(PIXEL_WIDTH - 1):0]R1_even[3:0];
reg [(PIXEL_WIDTH - 1):0]R2_even[3:0];
reg [(PIXEL_WIDTH - 1):0]R3_even[3:0];
reg [(PIXEL_WIDTH - 1):0]R4_even[3:0];

reg [(PIXEL_WIDTH - 1):0]B1_even[3:0];
reg [(PIXEL_WIDTH - 1):0]B2_even[3:0];
reg [(PIXEL_WIDTH - 1):0]B3_even[3:0];
reg [(PIXEL_WIDTH - 1):0]B4_even[3:0];

reg [(PIXEL_WIDTH - 1):0]G1_even[3:0];
reg [(PIXEL_WIDTH - 1):0]G2_even[3:0];
reg [(PIXEL_WIDTH - 1):0]G3_even[3:0];
reg [(PIXEL_WIDTH - 1):0]G4_even[3:0];




reg [(PIXEL_WIDTH - 1):0]R1_odd[3:0];
reg [(PIXEL_WIDTH - 1):0]R2_odd[3:0];
reg [(PIXEL_WIDTH - 1):0]R3_odd[3:0];
reg [(PIXEL_WIDTH - 1):0]R4_odd[3:0];

reg [(PIXEL_WIDTH - 1):0]B1_odd[3:0];
reg [(PIXEL_WIDTH - 1):0]B2_odd[3:0];
reg [(PIXEL_WIDTH - 1):0]B3_odd[3:0];
reg [(PIXEL_WIDTH - 1):0]B4_odd[3:0];

reg [(PIXEL_WIDTH - 1):0]G1_odd[3:0];
reg [(PIXEL_WIDTH - 1):0]G2_odd[3:0];
reg [(PIXEL_WIDTH - 1):0]G3_odd[3:0];
reg [(PIXEL_WIDTH - 1):0]G4_odd[3:0];




reg [1:0]read_ram_index_even; 	//which line RAM is being focused to read for even lines,  (not which address is being read from line RAM)
reg [1:0]read_ram_index_odd; 	//which line RAM is being focused to read for odd lines,  (not which address is being read from line RAM)
reg [1:0]read_ram_index_even_plus_1; 
reg [1:0]read_ram_index_odd_plus_1; 
reg [1:0]read_ram_index_even_minus_1; 
reg [1:0]read_ram_index_odd_minus_1; 


reg [3:0]write_ram_select;	//which line RAM is begin written
reg [10:0]line_address; 		//which address is being read and written 
reg [(INPUT_WIDTH-1):0]last_ram_outputs[3:0]; //one clock cycle delayed output of line RAMs
reg [(INPUT_WIDTH-1):0]last_ram_outputs_stage2[3:0]; //two clock cycle delayed output of RAMs 

reg [1:0]not_used2b;


wire [(INPUT_WIDTH-1):0]RAM_out[3:0];
reg [(INPUT_WIDTH-1):0]RAM_out_reg[3:0];
wire ram_write_enable;
wire ram_clk;

assign ram_clk = !clk_i; 
assign ram_write_enable = data_valid_i;

reg [2:0]i;
//line rams, total 4,
//The way debayer is implemented in this code. Depending on pixel, we need minimum 2 lines and  maximum 3 lines in the ram, To be able to have access to neighboring pixels from previous and next line
//There are many ways to implemented debayer, this code implement simplest possible bare minimum.
// IMX219 Camera only output BGGR as defined by the IMX219 Driver in linux repo MEDIA_BUS_FMT_SBGGR10_1X10,  Camera datasheet incrorrectly defines output as RGGB and GBRG. Data sheet is incorrect in this case.
// Bayer filter type does not affet test pattern. 

line_ram_dp line0(.wr_clk_i(ram_clk), 		//data and address latch in on rising edge 
				  .rd_clk_i(ram_clk), 
				  .rst_i(reset_i), 
				  .wr_clk_en_i(ram_write_enable),					//TODO : Fix This 
				  .rd_en_i(1'b1), 
				  .rd_clk_en_i(1'b1), 
				  .wr_en_i(write_ram_select[0]  ), 
				  .wr_data_i(data_i), 
				  .wr_addr_i(line_address), 
				  .rd_addr_i(line_address), 
				  .rd_data_o(RAM_out[0])) ;

line_ram_dp line1(.wr_clk_i(ram_clk), 
				  .rd_clk_i(ram_clk), 
				  .rst_i(reset_i), 
				  .wr_clk_en_i(ram_write_enable),
				  .rd_en_i(1'b1), 
				  .rd_clk_en_i(1'b1), 
				  .wr_en_i(write_ram_select[1]), 
				  .wr_data_i(data_i), 
				  .wr_addr_i(line_address), 
				  .rd_addr_i(line_address), 
				  .rd_data_o(RAM_out[1])) ;

line_ram_dp line2(.wr_clk_i(ram_clk), 
				  .rd_clk_i(ram_clk), 
				  .rst_i(reset_i), 
				  .wr_clk_en_i(ram_write_enable),
				  .rd_en_i(1'b1), 
				  .rd_clk_en_i(1'b1), 
				  .wr_en_i(write_ram_select[2]), 
				  .wr_data_i(data_i), 
				  .wr_addr_i(line_address), 
				  .rd_addr_i(line_address), 
				  .rd_data_o(RAM_out[2])) ;

line_ram_dp line3(.wr_clk_i(ram_clk), 	
				  .rd_clk_i(ram_clk), 
				  .rst_i(reset_i), 
				  .wr_clk_en_i(ram_write_enable),
				  .rd_en_i(1'b1), 
				  .rd_clk_en_i(1'b1), 
				  .wr_en_i(write_ram_select[3]), 
				  .wr_data_i(data_i), 
				  .wr_addr_i(line_address), 
				  .rd_addr_i(line_address), 
				  .rd_data_o(RAM_out[3])) ;



always @(posedge clk_i)	 //address should increment at falling edge of ram_clk. It is inverted from clk_i
begin
	if (!line_valid_i )
	begin
		line_address <= 10'h0;
	end
	else
	begin
		if (data_valid_i)
		begin
			line_address <= line_address + 1'b1;
		end
	end
end


always @(posedge reset_i or posedge line_valid_i)
begin
	if (reset_i)
	begin
		write_ram_select <= 4'b1000;
		line_counter <= 2'b0;
		read_ram_index_odd <= 2'b01;
		read_ram_index_even <= 2'b01;
		read_ram_index_odd_plus_1 <= 2'd2;
		read_ram_index_odd_minus_1 <= 2'd0;
		read_ram_index_even_plus_1 <= 2'd2;
		read_ram_index_even_minus_1 <= 2'd0;
	end
	else
	begin
		write_ram_select <= {write_ram_select[2:0], write_ram_select[3]};

			
		read_ram_index_odd <= read_ram_index_odd + 1'b1;
		read_ram_index_even <= read_ram_index_even + 1'b1;
		read_ram_index_odd_plus_1 <= read_ram_index_odd_plus_1 + 1'b1;
		read_ram_index_odd_minus_1 <= read_ram_index_odd_minus_1 + 1'b1;
		read_ram_index_even_plus_1 <= read_ram_index_even_plus_1 + 1'b1;
		read_ram_index_even_minus_1 <= read_ram_index_even_minus_1 + 1'b1;
		
		if (line_counter < 2'd3)
		begin
			line_counter <= line_counter + 1'b1;
		end
	end
end

always @(posedge ram_clk)
begin
	
		RAM_out_reg[0] <= RAM_out[0];
		RAM_out_reg[1] <= RAM_out[1];
		RAM_out_reg[2] <= RAM_out[2];
		RAM_out_reg[3] <= RAM_out[3]; 
		
		last_ram_outputs[0] <= RAM_out_reg[0];
		last_ram_outputs[1] <= RAM_out_reg[1];
		last_ram_outputs[2] <= RAM_out_reg[2];
		last_ram_outputs[3] <= RAM_out_reg[3];
		
		last_ram_outputs_stage2[0] <= last_ram_outputs[0];
		last_ram_outputs_stage2[1] <= last_ram_outputs[1];
		last_ram_outputs_stage2[2] <= last_ram_outputs[2];
		last_ram_outputs_stage2[3] <= last_ram_outputs[3];			
end

always @(negedge clk_i)
begin
	if (reset_i)
	begin
		output_valid_o <= 1'b0;
		data_valid_reg <= 1'b0;
	end
	else
	begin
		if(line_counter > 9'd2)
		begin
			data_valid_reg <= data_valid_i; 
			output_valid_o <= data_valid_reg;
		end


	end
end



always @(negedge clk_i)
begin
	
				B1_even[0] =  last_ram_outputs[ read_ram_index_even_plus_1 ][63:48]; 
				B2_even[0] =  last_ram_outputs[ read_ram_index_even_plus_1 ][63:48];
				B3_even[0] =  last_ram_outputs[ read_ram_index_even_minus_1 ][63:48]; 
				B4_even[0] =  last_ram_outputs[ read_ram_index_even_minus_1 ][63:48];
									
				G1_even[0] = 		last_ram_outputs[ read_ram_index_even ][63:48];	
				G2_even[0] = 		last_ram_outputs[ read_ram_index_even ][63:48];
				G3_even[0] = 		last_ram_outputs[ read_ram_index_even ][63:48];
				G4_even[0] = 		last_ram_outputs[ read_ram_index_even ][63:48];
				
				R1_even[0] = 		last_ram_outputs[ read_ram_index_even ][47:32]; 
				R2_even[0] =  last_ram_outputs_stage2[ read_ram_index_even ][15:0 ];
				R3_even[0] = 		last_ram_outputs[ read_ram_index_even ][47:32]; 
				R4_even[0] =  last_ram_outputs_stage2[ read_ram_index_even ][15:0 ];

				B1_even[1] = last_ram_outputs[ read_ram_index_even_minus_1 ][63:48]; 
				B2_even[1] = last_ram_outputs[ read_ram_index_even_plus_1 ][63:48];
				B3_even[1] = last_ram_outputs[ read_ram_index_even_minus_1 ][31:16];
				B4_even[1] = last_ram_outputs[ read_ram_index_even_plus_1 ][31:16];
				
				G1_even[1] = last_ram_outputs[ read_ram_index_even		][63:48];	
				G2_even[1] = last_ram_outputs[ read_ram_index_even_minus_1][47:32];	
				G3_even[1] = last_ram_outputs[ read_ram_index_even_plus_1 ][47:32];	
				G4_even[1] = last_ram_outputs[ read_ram_index_even		][31:16];	
				
				R1_even[1] = last_ram_outputs[ read_ram_index_even 		][47:32]; 
				R2_even[1] = last_ram_outputs[ read_ram_index_even 		][47:32]; 
				R3_even[1] = last_ram_outputs[ read_ram_index_even 		][47:32]; 
				R4_even[1] = last_ram_outputs[ read_ram_index_even 		][47:32]; 

				B1_even[2] = last_ram_outputs[ read_ram_index_even_minus_1 ][31:16]; 
				B2_even[2] = last_ram_outputs[ read_ram_index_even_plus_1 ][31:16];
				B3_even[2] = last_ram_outputs[ read_ram_index_even_minus_1 ][31:16]; 
				B4_even[2] = last_ram_outputs[ read_ram_index_even_plus_1 ][31:16];

				G1_even[2] = last_ram_outputs[ read_ram_index_even		][31:16];
				G2_even[2] = last_ram_outputs[ read_ram_index_even		][31:16];
				G3_even[2] = last_ram_outputs[ read_ram_index_even		][31:16];
				G4_even[2] = last_ram_outputs[ read_ram_index_even		][31:16];
				
				R1_even[2] = last_ram_outputs[ read_ram_index_even 		][ 15:0 ];
				R2_even[2] = last_ram_outputs[ read_ram_index_even 		][47:32];
				R3_even[2] = last_ram_outputs[ read_ram_index_even 		][ 15:0 ];
				R4_even[2] = last_ram_outputs[ read_ram_index_even 		][47:32];
				
				B1_even[3] = 		 RAM_out_reg[ read_ram_index_even_minus_1 ][63:48];	
				B2_even[3] = last_ram_outputs[ read_ram_index_even_minus_1 ][31:16];
				B3_even[3] = 		 RAM_out_reg[ read_ram_index_even_plus_1 ][63:48];
				B4_even[3] = last_ram_outputs[ read_ram_index_even_plus_1	][31:16];
				
				
				G1_even[3] = last_ram_outputs[ read_ram_index_even		][31:16];  	
				G2_even[3] = last_ram_outputs[ read_ram_index_even_minus_1][ 15:0 ];	
				G3_even[3] = last_ram_outputs[ read_ram_index_even_plus_1 ][ 15:0 ];	
				G4_even[3] = 		 RAM_out_reg[ read_ram_index_even 		][63:48];
				
				R1_even[3] = last_ram_outputs[ read_ram_index_even		][ 15:0 ];
				R2_even[3] = last_ram_outputs[ read_ram_index_even		][ 15:0 ];
				R3_even[3] = last_ram_outputs[ read_ram_index_even		][ 15:0 ];
				R4_even[3] = last_ram_outputs[ read_ram_index_even		][ 15:0 ];




				B1_odd[0] = 		last_ram_outputs[ read_ram_index_odd 		][63:48];
				B2_odd[0] = 		last_ram_outputs[ read_ram_index_odd 		][63:48];
				B3_odd[0] = 		last_ram_outputs[ read_ram_index_odd 		][63:48];
				B4_odd[0] = 		last_ram_outputs[ read_ram_index_odd 		][63:48];

				G1_odd[0] = 		last_ram_outputs[ read_ram_index_odd_minus_1	][63:48];	
				G2_odd[0] = 		last_ram_outputs[ read_ram_index_odd_plus_1 ][63:48];
				G3_odd[0] = 		last_ram_outputs[ read_ram_index_odd    		][47:32];
				G4_odd[0] =  last_ram_outputs_stage2[ read_ram_index_odd 		][15:0 ];
								
				R1_odd[0] =  last_ram_outputs_stage2[ read_ram_index_odd_minus_1 ][ 15:0 ];
				R2_odd[0] = 		last_ram_outputs[ read_ram_index_odd_minus_1 ][47:32];
				R3_odd[0] =  last_ram_outputs_stage2[ read_ram_index_odd_plus_1 ][ 15:0 ];
				R4_odd[0] = 		last_ram_outputs[ read_ram_index_odd_plus_1][47:32];

				
				B1_odd[1] = last_ram_outputs[ read_ram_index_odd 		][63:48]; 
				B2_odd[1] = last_ram_outputs[ read_ram_index_odd 		][31:16];
				B3_odd[1] = last_ram_outputs[ read_ram_index_odd 		][63:48]; 
				B4_odd[1] = last_ram_outputs[ read_ram_index_odd 		][31:16];
				
				G1_odd[1] = last_ram_outputs[ read_ram_index_odd 		][47:32];
				G2_odd[1] = last_ram_outputs[ read_ram_index_odd 		][47:32];	
				G3_odd[1] = last_ram_outputs[ read_ram_index_odd 		][47:32];
				G4_odd[1] = last_ram_outputs[ read_ram_index_odd 		][47:32];
				
				R1_odd[1] = last_ram_outputs[ read_ram_index_odd_minus_1 ][47:32]; 
				R2_odd[1] = last_ram_outputs[ read_ram_index_odd_plus_1][47:32]; 
				R3_odd[1] = last_ram_outputs[ read_ram_index_odd_minus_1][47:32]; 
				R4_odd[1] = last_ram_outputs[ read_ram_index_odd_plus_1][47:32]; 

				B1_odd[2] = last_ram_outputs[ read_ram_index_odd 		][31:16]; 
				B2_odd[2] = last_ram_outputs[ read_ram_index_odd 		][31:16];
				B3_odd[2] = last_ram_outputs[ read_ram_index_odd 		][31:16];
				B4_odd[2] = last_ram_outputs[ read_ram_index_odd 		][31:16];
				
				G1_odd[2] = last_ram_outputs[ read_ram_index_odd_minus_1][31:16];
				G2_odd[2] = last_ram_outputs[ read_ram_index_odd_plus_1 ][31:16];
				G3_odd[2] = last_ram_outputs[ read_ram_index_odd 		][47:32];
				G4_odd[2] = last_ram_outputs[ read_ram_index_odd 		][ 15:0];
				
				R1_odd[2] = last_ram_outputs[ read_ram_index_odd_minus_1 ][ 15:0];
				R2_odd[2] = last_ram_outputs[ read_ram_index_odd_minus_1][47:32];
				R3_odd[2] = last_ram_outputs[ read_ram_index_odd_plus_1 ][ 15:0];
				R4_odd[2] = last_ram_outputs[ read_ram_index_odd_plus_1 ][47:32];

				B1_odd[3] = 		 RAM_out_reg[ read_ram_index_odd 		][63:48];
				B2_odd[3] = last_ram_outputs[ read_ram_index_odd 		][31:16];
				B3_odd[3] = 		 RAM_out_reg[ read_ram_index_odd 		][63:48];
				B4_odd[3] = last_ram_outputs[ read_ram_index_odd 		][31:16];
				
				G1_odd[3] = last_ram_outputs[ read_ram_index_odd 		][ 15:0 ]; 
				G2_odd[3] = last_ram_outputs[ read_ram_index_odd 		][ 15:0 ];	
				G3_odd[3] = last_ram_outputs[ read_ram_index_odd 		][ 15:0 ];	
				G4_odd[3] = 		 RAM_out_reg[ read_ram_index_odd 		][ 15:0 ];
				
				R1_odd[3] = last_ram_outputs[ read_ram_index_odd_minus_1 ][ 15:0 ];
				R2_odd[3] = last_ram_outputs[ read_ram_index_odd_plus_1 ][ 15:0 ];
				R3_odd[3] = last_ram_outputs[ read_ram_index_odd_minus_1 ][ 15:0 ]; 
				R4_odd[3] = last_ram_outputs[ read_ram_index_odd_plus_1 ][ 15:0 ]; 
				
				
		if (!line_counter[0])	//even
			begin
				for (i=3'b0; i < 4 ;i = i + 1)
				begin
					R1[i] <= R1_even[i];
					G1[i] <= G1_even[i];
					B1[i] <= B1_even[i];
					R2[i] <= R2_even[i];
					G2[i] <= G2_even[i];
					B2[i] <= B2_even[i];
					R3[i] <= R3_even[i];
					G3[i] <= G3_even[i];
					B3[i] <= B3_even[i];				
					R4[i] <= R4_even[i];
					G4[i] <= G4_even[i];
					B4[i] <= B4_even[i];
					
				end
			end 	//end even rows
			else
			begin	//odd rows  //First line 
				
			for (i=3'b0; i < 4 ;i = i + 1)
				begin
					R1[i] <= R1_odd[i];
					G1[i] <= G1_odd[i];
					B1[i] <= B1_odd[i];
					R2[i] <= R2_odd[i];
					G2[i] <= G2_odd[i];
					B2[i] <= B2_odd[i];
					R3[i] <= R3_odd[i];
					G3[i] <= G3_odd[i];
					B3[i] <= B3_odd[i];				
					R4[i] <= R4_odd[i];
					G4[i] <= G4_odd[i];
					B4[i] <= B4_odd[i];
					
				end

			end //end odd rows
			

			{not_used2b,output_o[191:176]} <= {{2'd0, R1[0]} + R2[0] + R3[0] + R4[0]} >> 2; //R
			{not_used2b,output_o[175:160]} <= {{2'd0, G1[0]} + G2[0] + G3[0] + G4[0]} >> 2; //G
			{not_used2b,output_o[159:144]}  <= {{2'd0, B1[0]} + B2[0] + B3[0] + B4[0]} >> 2; //B

			{not_used2b,output_o[143:128]} <= {{2'd0, R1[1]} + R2[1] + R3[1] + R4[1]} >> 2; //R
			{not_used2b,output_o[127:112]} <= {{2'd0, G1[1]} + G2[1] + G3[1] + G4[1]} >> 2; //G
			{not_used2b,output_o[111:96]} <= {{2'd0, B1[1]} + B2[1] + B3[1] + B4[1]} >> 2; //B

			{not_used2b,output_o[95:80]} <= {{2'd0, R1[2]} + R2[2] + R3[2] + R4[2]} >> 2; //R
			{not_used2b,output_o[79:64]} <= {{2'd0, G1[2]} + G2[2] + G3[2] + G4[2]} >> 2; //G
			{not_used2b,output_o[63:48]} <= {{2'd0, B1[2]} + B2[2] + B3[2] + B4[2]} >> 2; //B

			{not_used2b,output_o[47:32]} <= {{2'd0, R1[3]} + R2[3] + R3[3] + R4[3]} >> 2; //R
			{not_used2b,output_o[31:16]} <= {{2'd0, G1[3]} + G2[3] + G3[3] + G4[3]} >> 2; //G
			{not_used2b,output_o[15:0]}   <= {{2'd0, B1[3]} + B2[3] + B3[3] + B4[3]} >> 2; //B	


end
endmodule