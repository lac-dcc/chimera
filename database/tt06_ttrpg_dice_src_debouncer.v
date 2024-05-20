// This program was cloned from: https://github.com/sanojn/tt06_ttrpg_dice
// License: Apache License 2.0

module debouncer (
    input wire clk,
    input rst_n,
    input wire tick,
    input wire button,
    output wire debounced
);
    // Synchronize and debounce input signals
    // Clock cycle is several ms, so single flop is sufficient for metastability avoidance
    reg button_d;
    reg [1:0] state;
    parameter Idle     = 2'b00;
    parameter Glitch   = 2'b01;
    parameter Pressed  = 2'b11;
    parameter Released = 2'b10;
    always @(posedge clk) begin
      button_d <= button;
      if (!rst_n) state <= 2'b00;
      else
        case (state)
            Idle: if (tick & button_d) state <= 2'b01;  
                 
            Glitch: if (!button_d) state <= 2'b00;
                    else if (tick) state <= 2'b11;
                  
            Pressed: if (!button_d) state <= 2'b10;
                   
            Released: if (tick) state <= 2'b00;
        endcase
    end
    assign debounced = (state == 2'b11);
endmodule
