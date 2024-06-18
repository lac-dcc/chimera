// This program was cloned from: https://github.com/yukinagata3184/de0_blinkL
// License: MIT License

// Check behavior that gpio ctrl.
// author:yukinagata3184

module gpio_ctrl_tb;

reg state;
wire GPIO0_D;

gpio_ctrl gpio_ctrl(.state(state), .GPIO0_D(GPIO0_D));

initial begin
     state = 1'b0;
#100 state = 1'b1;
#100 $stop;
end

endmodule