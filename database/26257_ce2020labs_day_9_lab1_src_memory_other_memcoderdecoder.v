// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module other_memcoderdecoder 
#(
	parameter 
				 RESOLUTION_H=0,
				 RESOLUTION_V=0,
				 RAM_RESOLUTION_H=0, // number of RAM regs in a row
				 //every RAM-bit's state defines RES_MULTIPLIER real pixels on screen
				 DATA_WIDTH = 0,
				 //every register in RAM carries DATA_WIDTH RAM-bits in it
				 RAM_INITIAL_VALUE=0,
				 X_WIDTH=0,
				 Y_WIDTH=0,
				 ADDR_WIDTH=0
)
(input clk,
 input reset,
 input [X_WIDTH-1:0] hpos ,
 input [Y_WIDTH-1:0] vpos ,
 input [X_WIDTH-1:0] paintpos_h ,
 input [Y_WIDTH-1:0] paintpos_v ,
 input [DATA_WIDTH-1:0] datafrommem,
 input rin,
 input we,
 input memenable,
		 
 output [2:0]rout,
 output [DATA_WIDTH-1:0] datatomem,
 output [ADDR_WIDTH-1:0] addr // addr width is ln(RAMLENGTH)/ln(2)
);
	localparam RES_MULTIPLIER=RESOLUTION_H/RAM_RESOLUTION_H,
				  DATASELECT_WIDTH= $clog2 (DATA_WIDTH);

reg [ADDR_WIDTH-1:0] addrreg,addregcheck; //addreg=ln(RAMDEPTH)/ln(2)
//one register for calculating RAM reg number and another reg for detecting register change
reg [DATASELECT_WIDTH-1:0] dataselect_r = 0;	 // reg for extraction of needed bit out of 6-bit word during the read
reg [DATASELECT_WIDTH-1:0] dataselect_w = 0;	 // reg for injecting needed bit in RAM word during the write
reg [DATA_WIDTH-1:0] databuf = RAM_INITIAL_VALUE; //reg for preparing RAM word for write
reg webuf=0; //reg for holding write enable value


always@ (posedge clk) begin
if(reset) begin 
databuf=RAM_INITIAL_VALUE;
dataselect_r=0;
dataselect_w=0;
webuf=0;
addrreg=0;
end
else if(memenable) begin
	webuf<=we;
	//Read from memory
	if(~webuf) begin
		if((hpos>RESOLUTION_H)||(vpos>RESOLUTION_V)) begin 
		//Ensure that memory requests are in proper limits
		
		addrreg <= 0;
		
		dataselect_r <= 'd6;
		
		end else begin
		
		addrreg <= (hpos/RES_MULTIPLIER)+80*(vpos/(RES_MULTIPLIER*DATA_WIDTH));

		dataselect_r <= vpos%DATA_WIDTH;
		 
		end
	//Write to memory
	end else if(webuf) begin
		if((paintpos_h>RESOLUTION_H)||(paintpos_v>RESOLUTION_V)) begin
		
		addrreg <= 0;
		
		dataselect_r <= 'd6;
		
		end else begin
		
		//Write to memory
		addrreg <= (paintpos_h/RES_MULTIPLIER)+80*(paintpos_v/(RES_MULTIPLIER*DATA_WIDTH));
		
		dataselect_w <= (paintpos_v/RES_MULTIPLIER)%DATA_WIDTH;
		
		if(addregcheck == addrreg) begin //If we write to the same RAM register...
				case (dataselect_w) //...then write in the same databuf(if the databuf value is in range)...
					0: databuf[0]<= rin;
						
						
					3'd1:databuf[1]<= rin;
					3'd2:databuf[2]<= rin;
					3'd3:databuf[3]<= rin;
					3'd4:databuf[4]<= rin;
					3'd5:databuf[5]<= rin;
					default begin 
					databuf<= RAM_INITIAL_VALUE;
					end
				endcase
		end else begin 
					databuf<= RAM_INITIAL_VALUE; //...otherwise refresh databuf
					end
		end

	end
end
end

//	!!!	I dont know why, but if
//"addrreg <= (paintpos_h/RES_MULTIPLIER)+80*(paintpos_v/(RES_MULTIPLIER*DATA_WIDTH));"

//				and

//"addregcheck <= addrreg;" are in the same "always" block, "addregcheck" doesnt work.

always@* begin 
if(reset) begin 
addregcheck=0;
end
else begin
addregcheck <= addrreg;
end
end


//addr to memory
assign addr = addregcheck;

//Read from memory
//Recieve data from memory, then extract rout to vga
assign rout = datafrommem[dataselect_r];

//Write to memory
//Recieve rin from brush, put it in databuf and transfer data to memory
assign datatomem = databuf;


endmodule