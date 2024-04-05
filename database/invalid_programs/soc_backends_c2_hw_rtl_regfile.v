`timescale 1 ns / 1 ps

`include "defines.v"

`ifndef ICE
 `define REGFILE_REGISTERED_OUT 1
`endif

module regfile
             #(parameter [0:0] MICROOPS_ENABLED = 1)
              (input clk,
               input             rst,

               input [31:0]      PC,

               input [4:0]       addr1,
               input [4:0]       addr2,

               input [4:0]       addrw,

`ifdef  REGFILE_REGISTERED_OUT
               output reg [31:0] out1,
               output reg [31:0] out2,
`else
               output [31:0]     out1,
               output [31:0]     out2,
`endif

               input [4:0]       dbgreg,
               input             dbgreg_en,

               input [31:0]      wdata,
               input             we,
               input [31:0]      clkcounter);

   reg [31:0]                   mem [0:31];

   wire [31:0]                  out1_next;
   wire [31:0]                  out2_next;

// PC+1 if microops enabled, otherwise PC+2

   wire [31:0]                   delta1;
   wire [31:0]                   delta2;
   

   assign delta1 = MICROOPS_ENABLED?1:2;
`ifdef REGFILE_REGISTERED_OUT
   assign delta2 = 0;
`else
   assign delta2 = -1;
`endif
   
   assign out1_next = addr1==0?0:
                      (addr1==1?1:
                       (addr1==31?(PC+(delta1+delta2)):
                        (addrw==addr1?wdata:mem[addr1])));
   assign out2_next = addr2==0?0:
                      (addr2==1?1:
                       (addr2==31?(PC+(delta1+delta2)):
                        (addrw==addr2?wdata:mem[addr2])));

`ifndef  REGFILE_REGISTERED_OUT
   assign out1 = out1_next;
   assign out2 = out2_next;
`endif
   
   always @(posedge clk)
      begin
        if (we) begin
           mem[addrw] <= wdata;
        end
`ifdef  REGFILE_REGISTERED_OUT
         out1 <= out1_next;
         out2 <= out2_next;
`endif
         if (dbgreg_en)
           $write("[R%0d=%0d]", dbgreg, mem[dbgreg]);
      end
   
endmodule
