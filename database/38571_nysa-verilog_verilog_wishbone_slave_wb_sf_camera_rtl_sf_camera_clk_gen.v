// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module sf_camera_clk_gen (
input                 clk,
input                 rst,
output                locked,
output                phy_out_clk
);

//Local parameters
//Registers/Wires
wire                  clkfbout_buf;
wire                  clkfb;
wire                  clkout;
wire                  phy_bufout;
//Submodules
DCM_SP #(
  .CLKDV_DIVIDE         (2.500),
  .CLKFX_DIVIDE         (5),
  .CLKFX_MULTIPLY       (2),
  .CLKIN_DIVIDE_BY_2    ("FALSE"),
  .CLKIN_PERIOD         (20.0),
  .CLKOUT_PHASE_SHIFT   ("NONE"),
  .CLK_FEEDBACK         ("1X"),
  //.DESKEW_ASJUST        ("SYSTEM_SYNCHRONOUS"),
  .PHASE_SHIFT          (0),
  .STARTUP_WAIT         ("FALSE")
) dcm (
  //Input Clocks
  .CLKIN                (clk),  //Already went through a global clock buffer
  .CLKFB                (clkfbout_buf),

  //Output Clocks
  .CLK0                 (clkfb),
  .CLK90                (),
  .CLK180               (),
  .CLK270               (),
  .CLK2X                (),
  .CLK2X180             (),
  .CLKFX                (clkout),
  .CLKFX180             (),
  .CLKDV                (),

  //Ports for dynamic phase shifting
  .PSCLK                (1'b0),
  .PSEN                 (1'b0),
  .PSINCDEC             (1'b0),
  .PSDONE               (),

  //Status
  .LOCKED               (locked),
  .STATUS               (),

  .RST                  (rst),

  .DSSEN                (1'b0)
);


BUFG bufg_camera_clk (
  .I(clkout),
  .O(phy_bufout)
);

BUFG  pll_fb (
  .I (clkfb),
  .O (clkfbout_buf)
);

ODDR2 #(
  .DDR_ALIGNMENT        ("NONE"),     //Sets output alignment to NON
  .INIT                 (1'b0),       //Sets the inital state to 0
  .SRTYPE               ("SYNC")      //Specified "SYNC" or "ASYNC" reset
) pad_buf (

  .Q                    (phy_out_clk),
  .C0                   (phy_bufout),
  .C1                   (~phy_bufout),
  .CE                   (1'b1),
  .D0                   (1'b1),
  .D1                   (1'b0),
  .R                    (1'b0),
  .S                    (1'b0)
);


//Asynchronous Logic
//Synchronous Logic

endmodule
