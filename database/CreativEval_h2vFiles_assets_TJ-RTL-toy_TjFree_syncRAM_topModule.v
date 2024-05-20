// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top( dataIn,

                dataOut,

                Addr,

                CS,

                WE,

                RD,

                Clk

              );



// parameters for the width

parameter ADR   = 8;

parameter DAT   = 8;

parameter DPTH  = 8;


//ports

input   [DAT-1:0]  dataIn;

output reg [DAT-1:0]  dataOut;

input   [ADR-1:0]  Addr;

input CS,

      WE,

      RD,

      Clk;



//internal variables


reg [DAT-1:0] SRAM [DPTH-1:0];


always @ (posedge Clk)

begin

 if (CS == 1'b1) begin

  if (WE == 1'b1 && RD == 1'b0) begin

   SRAM [Addr] = dataIn;

  end

  else if (RD == 1'b1 && WE == 1'b0) begin

   dataOut = SRAM [Addr];

  end

  else;

 end

 else;

end

endmodule
