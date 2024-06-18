// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

`timescale 1 ns / 1 ps

module iob_ram_tdp
  #(
    parameter HEXFILE = "none",
    parameter DATA_W = 0,
    parameter ADDR_W = 0
    )
   (
    // Port A
    input                     clkA,
    input [(DATA_W-1):0]      dinA,
    input [(ADDR_W-1):0]      addrA,
    input                     enA,
    input                     weA,
    output reg [(DATA_W-1):0] doutA,

    // Port B
    input                     clkB,
    input [(DATA_W-1):0]      dinB,
    input [(ADDR_W-1):0]      addrB,
    input                     enB,
    input                     weB,
    output reg [(DATA_W-1):0] doutB
    );

   //this allows ISE 14.7 to work; do not remove
   localparam mem_init_file_int = HEXFILE;

   // Declare the RAM
   reg [DATA_W-1:0]           ram[2**ADDR_W-1:0];

   // Initialize the RAM
   initial
     if(mem_init_file_int != "none")
       $readmemh(mem_init_file_int, ram, 0, 2**ADDR_W - 1);

   //read port
   always @ (posedge clkA) begin// Port A
      if (enA)
        if (weA)
	        ram[addrA] <= dinA;
      `ifdef IS_CYCLONEV
        else
      `endif
      doutA <= ram[addrA];
    end

   //write port
   always @ (posedge clkB) begin // Port B
      if (enB)
        if (weB)
	        ram[addrB] <= dinB;
      `ifdef IS_CYCLONEV
        else
      `endif
	    doutB <= ram[addrB];
    end
 endmodule
