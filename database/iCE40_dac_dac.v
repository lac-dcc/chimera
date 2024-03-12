//`timescale 100 ps / 10 ps

//This is a Delta-Sigma Digital to Analog Converter
// adapted from Xilinx App Note XAPP154 (September 23, 1999)
// http://www.xilinx.com/support/documentation/application_notes/xapp154.pdf
module dac(
    input CLK_i,
    input RSTn_i,
    output DACout, // This is the average output that feeds low pass filter
    input [MSBI:0] DACin  // DAC input (excess 2**MSBI)
);

parameter MSBI = 7;  // Most significant Bit of DAC input

reg DACout; // for optimum performance, ensure that this ff is in IOB
reg [MSBI+2:0] DeltaAdder; // Output of Delta adder
reg [MSBI+2:0] SigmaAdder; // Output of Sigma adder
reg [MSBI+2:0] SigmaLatch; // Latches output of Sigma adder
reg [MSBI+2:0] DeltaB;     // B input of Delta adder


always @(SigmaLatch)
    DeltaB <= {SigmaLatch[MSBI+2], SigmaLatch[MSBI+2]} << (MSBI+1);

always @(DACin or DeltaB)
    DeltaAdder <= DACin + DeltaB;

always @(DeltaAdder or SigmaLatch)
    SigmaAdder <= DeltaAdder + SigmaLatch;

always @(posedge CLK_i or negedge RSTn_i)
begin
     if(~RSTn_i)
     begin
           SigmaLatch <= 1'b1 << (MSBI+1);
           DACout <= 1'b0;
     end
     else
     begin
        SigmaLatch <= SigmaAdder;
        DACout <= SigmaLatch[MSBI+2];
    end
end

endmodule   // dac
