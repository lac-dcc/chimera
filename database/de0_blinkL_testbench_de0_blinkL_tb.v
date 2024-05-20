// This program was cloned from: https://github.com/yukinagata3184/de0_blinkL
// License: MIT License

// testbench for de0_blinkL.
// integration test for de0_blinkL.
// author:yukinagata3184

module de0_blinkL_tb;

parameter CYCLE = 100;
parameter HALF_CYCLE = 50;
parameter DELAY = 10;

reg CLK, RST;
wire GPIO0_D;
wire [6:0] nSEG0, nSEG1, nSEG2, nSEG3;

de0_blinkL de0_blinkL(.CLK(CLK), .RST(RST), .GPIO0_D(GPIO0_D),
                      .nSEG0(nSEG0), .nSEG1(nSEG1), .nSEG2(nSEG2), .nSEG3(nSEG3));

always begin
            CLK = 1'b1;
#HALF_CYCLE CLK = 1'b0;
#HALF_CYCLE;
end

initial begin
    // Asynchronous reset
           RST = 1'b0;
    #DELAY RST = 1'b1; // prevent racing
    #CYCLE RST = 1'b0;
    repeat(3) begin
        #(2*CYCLE);
            force de0_blinkL.cnt1sec.cnt50mhz = 26'd49_999_998;
            release de0_blinkL.cnt1sec.cnt50mhz;
    end
    #CYCLE $stop;
end

endmodule