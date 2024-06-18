// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module seg_led_decoder(
    input        [3:0]  data_disp,
    output  reg  [7:0]  seg_led
);

always@(data_disp)begin
    case(data_disp)
        4'h0 : seg_led = 8'h3f;
        4'h1 : seg_led = 8'h06;
        4'h2 : seg_led = 8'h5b;
        4'h3 : seg_led = 8'h4f;
        4'h4 : seg_led = 8'h66;
        4'h5 : seg_led = 8'h6d;
        4'h6 : seg_led = 8'h7d;
        4'h7 : seg_led = 8'h07;
        4'h8 : seg_led = 8'h7f;
        4'h9 : seg_led = 8'h6f;
        4'ha : seg_led = 8'h77;
        4'hb : seg_led = 8'h7c;
        4'hc : seg_led = 8'h39;
        4'hd : seg_led = 8'h5e;
        4'he : seg_led = 8'h79;
        4'hf : seg_led = 8'h71;
        default :seg_led = 8'h00;
    endcase
end

endmodule 

