// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module mem_coder_decoder 
#(
	parameter 	 RES_MULTIPLIER=8,
				 BANKS_NUMBER=10,
				 RESOLUTION_H=80,
				 RESOLUTION_V=60,
				 DATA_WIDTH = 6,
				 RAM_INITIAL_VALUE=6'b111111
)
(input clk,
 input reset,
 input [9:0] hpos ,
 input [9:0] vpos ,
 input [9:0] paintpos_h ,
 input [9:0] paintpos_v ,
 input [DATA_WIDTH-1:0] datafrommem,
 input rin,
 input we,
		 
 output rout,
 output [DATA_WIDTH-1:0] datatomem,
 output [10:0] addr
);

reg [3:0] bankselect=0;
reg [6:0] regselect=0; 
reg [2:0] dataselect_r=0;
reg [2:0] dataselect_w=0;
reg [5:0] databuf=RAM_INITIAL_VALUE;
reg webuf;
reg [7:0]bankchange=0;

//Read from memory
always@ (posedge clk) begin
if(reset) begin 
databuf=RAM_INITIAL_VALUE;
bankselect=0;
regselect=0;
dataselect_r=0;
dataselect_w=0;
webuf=0;
bankchange=0;
end
else begin
	if(~we) begin
		bankselect<=vpos/(DATA_WIDTH*RES_MULTIPLIER);

		regselect<=hpos/RES_MULTIPLIER;

		if (vpos!=0) dataselect_r <=vpos%DATA_WIDTH;
		else dataselect_r <=0;
		
		end
	else if(we) begin
		webuf<=we;
		//Write to memory
		bankselect<=paintpos_v/(DATA_WIDTH*RES_MULTIPLIER);

		regselect<=paintpos_h/RES_MULTIPLIER;
		
		if (paintpos_v!=0) dataselect_w <=(paintpos_v/RES_MULTIPLIER)%DATA_WIDTH;
		else dataselect_w <=3'd6;
		
		
		bankchange <= bankselect;
		
		if(bankchange!=bankselect)databuf<=RAM_INITIAL_VALUE;
		else begin
			if(webuf) begin
				case (dataselect_w) 
					0:databuf[0]<= rin;
					3'd1:databuf [1]<= rin;
					3'd2:databuf [2]<= rin;
					3'd3:databuf [3]<= rin;
					3'd4:databuf [4]<= rin;
					3'd5: databuf [5]<= rin;
					default databuf<= RAM_INITIAL_VALUE;
				endcase
			end
			else databuf<= RAM_INITIAL_VALUE;
		end

	end
end
end




//addr to memory
assign addr = {bankchange,regselect};

//Read from memory
//data from memory, then rout to vga
assign rout = datafrommem[dataselect_r];

//Write to memory
//rin from brush, then data to memory
assign datatomem = databuf;

endmodule