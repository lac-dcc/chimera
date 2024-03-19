module top
(
    input clk_25mhz,
    input [6:0] btn,
    output [7:0] led,
    output [27:0] gp, gn,
    output wifi_gpio0
);
    //  0: PMOD straight male header to flat cable
    // 90: PMOD 90-deg female header
    parameter PMOD_J1 = 0;
    parameter PMOD_J2 = 90;

    // prevent ESP32 firmware from taking control of the board
    // (we don't want it write its "passthru" bitstream)
    assign wifi_gpio0 = 1'b1;
    
    wire pixclk;
    assign pixclk = clk_25mhz;

    wire [2:0] RGB0, RGB1;

    wire [7:0] ADDRX;
    wire [4:0] ADDRY;
    wire BLANK, LATCH;
    ledscan
    ledscan_inst
    (
        .clk(pixclk),
        .r0(sprite_rgb0[23:16]),
        .g0(sprite_rgb0[15:8]),
        .b0(sprite_rgb0[7:0]),
        .r1(sprite_rgb1[23:16]),
        .g1(sprite_rgb1[15:8]),
        .b1(sprite_rgb1[7:0]),
        .rgb0(RGB0),
        .rgb1(RGB1),
        .addrx(ADDRX),
        .addry(ADDRY),
        .latch(LATCH),
        .blank(BLANK)
    );

    wire [23:0] sprite_rgb0,sprite_rgb1;

    sprite_rom sprite(
        .clk(pixclk),
        .addry(ADDRY),
        .addrx(ADDRX[6:0]),
        .data0(sprite_rgb0),
        .data1(sprite_rgb1));

    reg [22:0] blinky;
    always @(posedge pixclk)
    begin
      blinky <= blinky + 1;
    end
    assign led[7] = blinky[22];

    // output pins mapping to ULX3S board    
    wire [27:0] ogp, ogn;
    assign ogp[14] = ADDRY[4];
    assign ogn[14] = ADDRY[3];
    assign ogp[15] = pixclk; // SCLK display clock
    assign ogn[15] = ADDRY[2];
    assign ogp[16] = LATCH;
    assign ogn[16] = ADDRY[1];
    assign ogp[17] = BLANK;
    assign ogn[17] = ADDRY[0];
    assign ogp[21] = 1'b0; // X1
    assign ogn[21] = 1'b0; // X0
    assign ogp[22] = RGB1[2]; // B1
    assign ogn[22] = RGB0[2]; // B0
    assign ogp[23] = RGB1[1]; // G1
    assign ogn[23] = RGB0[1]; // G0
    assign ogp[24] = RGB1[0]; // R1
    assign ogn[24] = RGB0[0]; // R0

    generate
      if(PMOD_J1 == 90)
      // if ULX3S has 90-deg female header (holes):
      // PMOD is connected directly to header (align 3.3V/GND)
      // directly connect P and N
      begin : J1_90deg
        // J1 connector
        assign gp[3:0] = ogp[17:14];
        assign gn[3:0] = ogn[17:14];
        assign gp[10:7] = ogp[24:21];
        assign gn[10:7] = ogn[24:21];
      end
    endgenerate

    generate
      if(PMOD_J1 == 0)
      // if ULX3S has straight male header (pins):
      // PMOD is connected with flat cable (align 3.3V/GND)
      // swap P and N
      begin : J1_flat_cable
        // J1 connector
        assign gp[3:0] = ogn[17:14];
        assign gn[3:0] = ogp[17:14];
        assign gp[10:7] = ogn[24:21];
        assign gn[10:7] = ogp[24:21];
      end
    endgenerate

    generate
      if(PMOD_J2 == 90)
      // if ULX3S has 90-deg female header (holes):
      // PMOD is connected directly to header (align 3.3V/GND)
      // directly connect P and N
      begin : J2_90deg
        // J2 connector
        assign gp[17:14] = ogp[17:14];
        assign gn[17:14] = ogn[17:14];
        assign gp[24:21] = ogp[24:21];
        assign gn[24:21] = ogn[24:21];
      end
    endgenerate

    generate
      if(PMOD_J2 == 0)
      // if ULX3S has straight male header (pins):
      // PMOD is connected with flat cable (align 3.3V/GND)
      // swap P and N
      begin : J2_flat_cable
        // J2 connector
        assign gp[17:14] = ogn[17:14];
        assign gn[17:14] = ogp[17:14];
        assign gp[24:21] = ogn[24:21];
        assign gn[24:21] = ogp[24:21];
      end
    endgenerate
    
endmodule
