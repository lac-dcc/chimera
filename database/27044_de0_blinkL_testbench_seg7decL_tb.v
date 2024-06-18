// This program was cloned from: https://github.com/yukinagata3184/de0_blinkL
// License: MIT License

// testbench for 7 segment decoder blink L
// author:yukinagata3184

module seg7decL_tb;
reg en;
wire [6:0] nSEG;

seg7decL seg7decL(.en(en), .nSEG(nSEG));

initial begin
     en = 1'h0;
#100 en = 1'b1;
#100 en = 1'bx;
#100 $stop;
end

endmodule