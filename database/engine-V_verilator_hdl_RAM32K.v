/*
 * Copyright 2018 MicroFPGA UG
 * Apache 2.0 License
 */

module RAM32K (
	clk,
	addr,
	din,
	dout,
	we
);

input           clk;        
input           we;        
input [14:0]    addr;
input  [7:0]    din;
output [7:0]    dout;


//wire    [13:0]  spram_addr;      
//wire    [15:0]  spram_wr_data;      
//wire    [15:0]  spram_rd_data;      
//wire    [3:0]  spram_mask;      

//assign spram_wr_data[15:8] = din;
//assign spram_wr_data [7:0] = din;
// use word address
//assign spram_addr = addr[14:1];
// assign write masks
//assign spram_mask[0] = ~addr[0];
//assign spram_mask[1] = ~addr[0];
//assign spram_mask[2] =  addr[0];
//assign spram_mask[3] =  addr[0];

// latch lower address
//reg    addr0_s;      
//always @ (posedge clk) begin
//	addr0_s <= addr[0];
//end
// return correct byte depending on latched address !
//assign dout = addr0_s ? spram_rd_data[15:8] : spram_rd_data[7:0];	

// iceCube2..
/*
SB_SPRAM256KA  inst_SPRAM256KA(
     .ADDRESS                 (spram_addr                   ),
     .DATAIN                  (spram_wr_data                ),
     .MASKWREN                (spram_mask                   ),
     .WREN                    (we                           ),
     .CHIPSELECT              (1'b1                         ),
     .CLOCK                   (clk                          ),
     .STANDBY                 (1'b0                         ),
     .SLEEP                   (1'b0                         ),
     .POWEROFF                (1'b1                         ),
     .DATAOUT                 (spram_rd_data                )
); 
*/

// Radiant..
/*
SP256K  inst_SPRAM256KA(
     .AD             (spram_addr                   ),
     .DI             (spram_wr_data                ),
     .MASKWE         (spram_mask                   ),
     .WE             (we                           ),
     .CS             (1'b1                         ),
     .CK             (clk                          ),
     .STDBY          (1'b0                         ),
     .SLEEP          (1'b0                         ),
     .PWROFF_N       (1'b1                         ),
     .DO             (spram_rd_data                )
); 
*/

/*
 * Generic and simulator friendly memory
 */    

	reg [7:0] memory [0:32*1024-1];
	reg [7:0] memory_r;
	initial $readmemh("riscv.mem", memory);

	assign dout =  memory_r;
    
	always @(posedge clk) begin
		if (we) memory[addr] <= din;
		memory_r <= memory[addr];
	end

	always @(posedge clk) begin
		if (we) begin
			if (addr < 40) begin
//				$write("\n\rWR: %04X %02X  ", addr, din);
			end
		end
	end



endmodule