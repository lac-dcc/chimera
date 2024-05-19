// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

`include "defs.v"

`ifndef SYNCSTACK
module toyblockram (input         clk,
                    
                    input [31:0]  addr_a,
                    output [31:0] data_a,
                    input [31:0]  datain_a,
                    input         wr_a,
                    
                    input [31:0]  addr_b,
                    output [31:0] data_b
                    );

   parameter RAM_DEPTH = `RAM_DEPTH;

   reg [31:0] mem [0:RAM_DEPTH-1];
   assign data_a = wr_a?datain_a:mem[addr_a];
   assign data_b = mem[addr_b];

   // Expect 2-port (1rw+1ro) to be inferred
   always @(posedge clk)
     begin
        if (wr_a) begin
           mem[addr_a] <= datain_a;
           `ifdef DEBUG
           $display("STACK: [%x] <- %x",addr_a, datain_a);
           `endif
        end
     end

endmodule // toyblockram

`endif //  `ifdef SIMULATION

`ifdef SYNCSTACK
module toyblockram (input         clk,
                    
                    input [31:0]      addr_a,
                    output reg [31:0] data_a,
                    input [31:0]      datain_a,
                    input             wr_a,
                    
                    input [31:0]      addr_b,
                    output reg [31:0] data_b
                    );

   parameter RAM_DEPTH = `RAM_DEPTH;

   (* RAM_STYLE="BLOCK" *)
   reg [31:0] mem [0:RAM_DEPTH-1];
 
   // Expect 2-port (1rw+1ro) to be inferred
   always @(posedge clk)
     begin
        if (wr_a) begin
           mem[addr_a] <= datain_a;
           data_a <= datain_a;
        end else data_a <= mem[addr_a];
        data_b <= mem[addr_b];
     end

endmodule // toyblockram

`endif //  `ifdef FPGA




module hlsblockram (input         clk,
                    
                    input [BITWIDTH-1:0]      readaddr1,
                    output reg [BITWIDTH-1:0] readout1,
                    input [BITWIDTH-1:0]      writeaddr1,
                    input [BITWIDTH-1:0]      writein1,
                    input                     we
                    );
   

   parameter SIZE = 32;
   parameter BITWIDTH = 32;
   
   
   reg [BITWIDTH-1:0] mem [0:SIZE-1];
 
   // Expect 2-port (1ro+1wo) to be inferred
   always @(posedge clk)
     begin
        if (we) begin
           mem[writeaddr1] = writein1;
        end
        readout1 <= mem[readaddr1];
     end

endmodule // toyblockram
