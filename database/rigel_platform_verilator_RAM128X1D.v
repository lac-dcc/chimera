// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

module RAM128X1D(WCLK,D,WE,SPO,DPO,A,DPRA);
   input      WCLK; //write clock
   input      D; // write data input
   input      WE; // write enable
   output     SPO; // R/W port addressed by A
   output     DPO; // R port addressed by DPRA
   input [6:0] A; // R/W port address
   input [6:0] DPRA; // R port address
   parameter INIT = 128'd0;

   reg [127:0] ram = INIT;

   assign DPO = ram[DPRA];
   assign SPO=D;

   always @(posedge WCLK) begin
      if(WE) begin
         ram[A] <= D;
      end
   end



endmodule
