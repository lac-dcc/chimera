// This program was cloned from: https://github.com/yukinagata3184/de0_blinkL
// License: MIT License

// Top module of de0_blinkL.
// author:yukinagata3184

module de0_blinkL(
    input CLK, RST,
    output GPIO0_D,
    output [6:0] nSEG0, nSEG1, nSEG2, nSEG3
);

wire gen1hz;
cnt1sec cnt1sec(.CLK(CLK), .RST(RST), .gen1hz(gen1hz));

wire state_l;
stateL stateL(.CLK(CLK), .RST(RST), .transition(gen1hz), .state_l(state_l));

gpio_ctrl gpio_ctrl(.state(state_l), .GPIO0_D(GPIO0_D));

seg7decL seg7decL_0(.en(state_l), .nSEG(nSEG0));
seg7decL seg7decL_1(.en(state_l), .nSEG(nSEG1));
seg7decL seg7decL_2(.en(state_l), .nSEG(nSEG2));
seg7decL seg7decL_3(.en(state_l), .nSEG(nSEG3));

endmodule