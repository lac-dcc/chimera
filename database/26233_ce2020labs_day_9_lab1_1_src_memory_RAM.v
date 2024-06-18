// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module single_port_ram
#( parameter  RAMLENGTH=800, //RAMLENGTH*DATAWIDTH = 4800 = 80x60 RAM RESOLUTION
				  DATA_WIDTH=6,
				  ADDR_WIDTH=10
 )
(
	input [DATA_WIDTH-1:0]data,		//RAM words' write input			
	input [ADDR_WIDTH-1:0] addr,				 //ln(RAMLENGTH)/ln(2)
	input we, clk, memenable,
	input [ADDR_WIDTH-1:0] resetcnt,
	output reg [DATA_WIDTH-1:0]q	//RAM words' read input
);

	(* ramstyle = "M9K" *) reg  [DATA_WIDTH-1:0]ramblock[RAMLENGTH-1:0] ;
	//(* ramstyle = "M9K" *) - synthesis attribute for making ramblocks of Altera M9K memory blocks
	// !!! Not sure in its usefullness
	
	// Variable to hold the registered read address, write data, and we
	//reg [ADDR_WIDTH-1:0] addr_reg;
	//reg [DATA_WIDTH-1:0] data_reg;
	//reg we_reg;

    wire [ADDR_WIDTH-1:0] addr_x;
    wire [DATA_WIDTH-1:0] data_x;
    wire                  we_x;

    assign addr_x = (memenable) ? addr : resetcnt;
    assign data_x = (memenable) ? data : '1;
    assign we_x   = (memenable) ? we   : 1;
	 
	always @ (posedge clk)begin
	//addr_reg <= addr_x;
	//we_reg<=we_x;
	//data_reg <= data_x;
	if (we_x) ramblock[addr_x]<=data_x;
	else q <= ramblock[addr_x];
	end
	
	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	//assign q = ramblock[addr_reg];
	
endmodule