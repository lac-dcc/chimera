// This program was cloned from: https://github.com/sanojn/tt06_ttrpg_dice
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Jonas Nilsson
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_sanojn_ttrpg_dice (
    input  wire [7:0] ui_in,    // buttons
    output wire [7:0] uo_out,   // 7segment signals
    input  wire [7:0] uio_in,   // [7:5] configures IO polarity
    output wire [7:0] uio_out,  // [1:0] 7segment common drives
    output wire [7:0] uio_oe,   // IOs: Enable path
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock, 32768 Hz
    input  wire       rst_n     // reset_n - low to reset
);

    // Synchronize reset input to avoid metastability
    // Use rst_sync as internal asynchronous reset
    reg rst_sync1, rst_sync;
    always @(negedge clk)
      {rst_sync, rst_sync1} <= {rst_sync1, rst_n};
    
    // Prescaler provides a one clock-cycle pulse at 32 Hz
    reg [9:0] prescaler;
    always @(posedge clk)
        if (!rst_sync) prescaler <= 10'd0;
        else prescaler <= prescaler + 1'd1;
    (* keep *) wire tick;
    assign tick = prescaler == 10'd0;

    wire [7:0] button;
    // Buttons are active high or low depending on uio_in[5]
    assign button = ( uio_in[5] ? ui_in : ~ui_in );

    wire btn4, btn6, btn8, btn10, btn12, btn20, btn100;
    debouncer Btn4_deb  (.clk(clk), .rst_n(rst_sync), .tick(tick), .button(button[0]), .debounced(btn4));
    debouncer Btn6_deb  (.clk(clk), .rst_n(rst_sync), .tick(tick), .button(button[1]), .debounced(btn6));
    debouncer Btn7_deb  (.clk(clk), .rst_n(rst_sync), .tick(tick), .button(button[2]), .debounced(btn8));
    debouncer Btn10_deb (.clk(clk), .rst_n(rst_sync), .tick(tick), .button(button[3]), .debounced(btn10));
    debouncer Btn12_deb (.clk(clk), .rst_n(rst_sync), .tick(tick), .button(button[4]), .debounced(btn12));
    debouncer Btn20_deb (.clk(clk), .rst_n(rst_sync), .tick(tick), .button(button[5]), .debounced(btn20));
    debouncer Btn100_deb(.clk(clk), .rst_n(rst_sync), .tick(tick), .button(button[6]), .debounced(btn100));
    
    wire anybtn;
    assign anybtn = btn4 | btn6 | btn8 | btn10 | btn12 | btn20 | btn100;
    
    (* keep *) reg [3:0] digit1, digit10;
    always @(posedge clk)
        if (rst_sync==0) begin
          digit10 <= 4'd0; digit1 <= 4'd1;
        end
        else if (anybtn) begin
            if (digit10 == 4'd0 && digit1 == 4'd1 && !btn100) begin
                if      (btn4)   begin digit10 <= 4'd0; digit1 <= 4'd4; end
                else if (btn6)   begin digit10 <= 4'd0; digit1 <= 4'd6; end
                else if (btn8)   begin digit10 <= 4'd0; digit1 <= 4'd8; end
                else if (btn10)  begin digit10 <= 4'd1; digit1 <= 4'd0; end
                else if (btn12)  begin digit10 <= 4'd1; digit1 <= 4'd2; end
                else if (btn20)  begin digit10 <= 4'd2; digit1 <= 4'd0; end
            end
            else begin
                // decrement
                if (digit1 != 0) digit1 <= digit1 - 4'd1;
                else begin
                    digit1 <= 4'd9;
                    if (digit10 == 0) digit10 <= 4'd9; else digit10 <= digit10 - 4'd1;
                end
            end
        end

    // Turn off digit outputs after ~8 seconds
    wire showDigitTimeout;
    reg [7:0] timeoutCounter;
    always @(posedge clk) begin
        if (rst_sync==0) begin
          timeoutCounter <= 8'd0;
        end
        else if (anybtn)
            timeoutCounter <= 8'd255;
        else if (timeoutCounter != 8'd0 & tick) begin
            timeoutCounter <= timeoutCounter - 8'd1;
        end
    end
    assign showDigitTimeout = timeoutCounter != 8'd0;
    
    // Multiplex digits and encode for seven segment
    wire showDigit1, showDigit10;

    // Show digit1 when clock is high and all buttons are released
    assign showDigit1  =  clk & ~anybtn & showDigitTimeout;
    // Show when clock is low, also blank zeroes
    assign showDigit10 = ~clk & ~anybtn & digit10!=4'b0 & showDigitTimeout;
    
    wire [3:0] displaydigit;
    wire [7:0] displaysegments;
    wire [7:0] blankedsegments;
    assign displaydigit = (clk? digit1 : digit10); // display muxing uses the 32kHz clk
    seg7_digitsonly outputdecoder(displaydigit, displaysegments[6:0]);
    assign displaysegments[7] = 1'b0;
    // Also blank the segment outputs to support displays without common anode/cathode control
    assign blankedsegments = ( showDigit1 || showDigit10 ? displaysegments : 8'b0 );
    
    // Now prepare the actual outputs, using uio_in[7:6] to
    // control inversion for common anode or cathode displays
    // uio_in[7] sets the active level of the 'common' signals
    // uio_in[6] sets the active level for the segment signals
    // uio_in[7:6] = 01 is appropriate for a common cathode display
    // uio_in[7:6] = 10 is appropriate for a common anode display
    // uio_in[7:6] = 00 is apropriate for a common anode display with an inverting driver for the 'common' signal
    assign uo_out = ( uio_in[6] ? blankedsegments : ~blankedsegments );
    assign uio_out[3] =  ( uio_in[7] ? showDigit1  : ~showDigit1  );   // Digit1 common
    assign uio_out[4] =  ( uio_in[7] ? showDigit10 : ~showDigit10 );   // Digit10 common


    ///////////////////////////////////////////////////////////////////
    // Second half of project: simple I2C slave experiment
    // Change clock speed to 25-50 MHz
    ///////////////////////////////////////////////////////////////////
    wire rw;
    wire [7:0] addr;
    wire wen;
    wire [7:0] wdata;
    wire rdata_used;
    reg [7:0] rdata;
    i2c_slave i2c // Slave address 0x70 (0xE0 and 0xE1)
    (
      .clk(clk),
      .rst_n(rst_n),
      .sda_o(uio_out[1]),
      .sda_oe(uio_oe[1]),
      .sda_i(uio_in[1]),
      .scl(uio_in[2]),

      // application interface
      .rw(rw),
      .addr(addr),
      .wen(wen),
      .wdata(wdata),
      .rdata_used(rdata_used),
      .rdata(rdata)
    );

    /////////////////////////////////////////////////////////////////////////////////////////////
    // A few small I2C peripherals
    
  // 8-byte Memory
    reg [7:0] mem [7:0];
    always @(posedge clk)
      if (!addr[3] && wen)
        mem[addr[2:0]] <= wdata;

    // I2C Peripheral GPIO pin uio[0]
    reg [7:0] IOctrl;
    reg [7:0] pwm;
    reg io_oe;
    always @(posedge clk)
      if (!rst_n) begin
        io_oe  <= 1'b0;
        IOctrl <= 8'b0;
      end else begin
        if (addr[3:0]==4'b1000 && wen)
          IOctrl <= wdata;
        if (addr[3:0]==4'b1001 && wen)
          io_oe <= wdata[0];
      end
    assign uio_oe[0] = io_oe;
    
    // simple PWM generator for the IO pin
    // IOctrl <= 128 will output a PWM signal based on IOctrl[6:0] / 128
    // IOctrl >= 128 will output 1
    always @(posedge clk) begin
      if (!rst_n) pwm <= 8'b0;
      else begin
        pwm <= {1'b0,pwm[6:0]} + IOctrl[6:0];
          if (IOctrl[7]) pwm[7] <= 1'b1;
      end
    end
    assign uio_out[0] = pwm[7];

    // I2C reads
    always @(*) begin
      if (!addr[3]) rdata = mem[addr[2:0]];
      else if (addr[3:0]==4'b1000)   rdata = IOctrl;
        else if (addr[3:0]==4'b1001) rdata = { 7'b0 , uio_oe[0] };
      else if (addr[3:0]==4'b1010) rdata = uio_in;
      else                          rdata = ui_in;
    end

      
  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out[7:5] = 3'b0;
  assign uio_out[2]   = 1'b0;
  assign uio_oe[7:3]  = 5'b00011;
  assign uio_oe[2]  = 1'b0;

endmodule
