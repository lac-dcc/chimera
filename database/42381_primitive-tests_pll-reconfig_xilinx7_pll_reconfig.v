// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License


module xilinx7_pll_reconfig (
   input  wire rst,

   // CLKOUT0
   input wire [5:0] CLKOUT0_HIGH_TIME,
   input wire [5:0] CLKOUT0_LOW_TIME,
   input wire [2:0] CLKOUT0_PHASE_MUX,
   input wire       CLKOUT0_EDGE,
   input wire       CLKOUT0_NO_COUNT,
   input wire [5:0] CLKOUT0_DELAY_TIME,

   // CLKOUT1
   input wire [5:0] CLKOUT1_HIGH_TIME,
   input wire [5:0] CLKOUT1_LOW_TIME,
   input wire [2:0] CLKOUT1_PHASE_MUX,
   input wire       CLKOUT1_EDGE,
   input wire       CLKOUT1_NO_COUNT,
   input wire [5:0] CLKOUT1_DELAY_TIME,

   // CLKOUT2
   input wire [5:0] CLKOUT2_HIGH_TIME,
   input wire [5:0] CLKOUT2_LOW_TIME,
   input wire [2:0] CLKOUT2_PHASE_MUX,
   input wire       CLKOUT2_EDGE,
   input wire       CLKOUT2_NO_COUNT,
   input wire [5:0] CLKOUT2_DELAY_TIME,

   // CLKOUT3
   input wire [5:0] CLKOUT3_HIGH_TIME,
   input wire [5:0] CLKOUT3_LOW_TIME,
   input wire [2:0] CLKOUT3_PHASE_MUX,
   input wire       CLKOUT3_EDGE,
   input wire       CLKOUT3_NO_COUNT,
   input wire [5:0] CLKOUT3_DELAY_TIME,

   // CLKOUT4
   input wire [5:0] CLKOUT4_HIGH_TIME,
   input wire [5:0] CLKOUT4_LOW_TIME,
   input wire [2:0] CLKOUT4_PHASE_MUX,
   input wire       CLKOUT4_EDGE,
   input wire       CLKOUT4_NO_COUNT,
   input wire [5:0] CLKOUT4_DELAY_TIME,

   // CLKOUT5
   input wire [5:0] CLKOUT5_HIGH_TIME,
   input wire [5:0] CLKOUT5_LOW_TIME,
   input wire [2:0] CLKOUT5_PHASE_MUX,
   input wire       CLKOUT5_EDGE,
   input wire       CLKOUT5_NO_COUNT,
   input wire [5:0] CLKOUT5_DELAY_TIME,

   // CLKFBOUT
   input wire [5:0] CLKFBOUT_HIGH_TIME,
   input wire [5:0] CLKFBOUT_LOW_TIME,
   input wire [2:0] CLKFBOUT_PHASE_MUX,
   input wire       CLKFBOUT_EDGE,
   input wire       CLKFBOUT_NO_COUNT,
   input wire [5:0] CLKFBOUT_DELAY_TIME,

   // DIVCLK
   input wire [5:0] DIVCLK_HIGH_TIME,
   input wire [5:0] DIVCLK_LOW_TIME,
   input wire       DIVCLK_EDGE,
   input wire       DIVCLK_NO_COUNT,

   // Reconfiguration BUS
   input  wire        dclk,
   output reg  [15:0] din,
   output reg  [6:0]  daddr,
   input  wire [15:0] dout,
   output reg         den,
   output reg         dwe,
   output reg         rst_pll,
   input  wire        drdy,
   input  wire        locked,

   // activation
   output reg  ready,
   input  wire start_reconfig,
   output reg  reconfig_done
);
   
   // State machine which communicates with the pllE reconfiguration bus

   localparam RESTART      = 4'h0;
   localparam WAIT_LOCK    = 4'h1;
   localparam WAIT_START   = 4'h2;
   localparam ADDRESS      = 4'h3;
   localparam WAIT_A_DRDY  = 4'h4;
   localparam BITMASK      = 4'h5;
   localparam BITSET       = 4'h6;
   localparam WRITE        = 4'h7;
   localparam WAIT_DRDY    = 4'h8;

   // configuration step order
   localparam POWER_REG_STEP     = 5'd0;
   localparam CLKOUT0_REG1_STEP  = 5'd1;
   localparam CLKOUT0_REG2_STEP  = 5'd2;
   localparam CLKOUT1_REG1_STEP  = 5'd3;
   localparam CLKOUT1_REG2_STEP  = 5'd4;
   localparam CLKOUT2_REG1_STEP  = 5'd5;
   localparam CLKOUT2_REG2_STEP  = 5'd6;
   localparam CLKOUT3_REG1_STEP  = 5'd7;
   localparam CLKOUT3_REG2_STEP  = 5'd8;
   localparam CLKOUT4_REG1_STEP  = 5'd9;
   localparam CLKOUT4_REG2_STEP  = 5'd10;
   localparam CLKOUT5_REG1_STEP  = 5'd11;
   localparam CLKOUT5_REG2_STEP  = 5'd12;
   localparam DIVCLK_REG_STEP    = 5'd13;
   localparam CLKFBOUT_REG1_STEP = 5'd14;
   localparam CLKFBOUT_REG2_STEP = 5'd15;
   localparam LOCK_REG1_STEP     = 5'd16;
   localparam LOCK_REG2_STEP     = 5'd17;
   localparam LOCK_REG3_STEP     = 5'd18;
   localparam FILT_REG1_STEP     = 5'd19;
   localparam FILT_REG2_STEP     = 5'd20;
   localparam CONFIG_STEPS       = 5'd21;

   // register addresses
   localparam CLKOUT5_REG1  = 7'h06;
   localparam CLKOUT5_REG2  = 7'h07;
   localparam CLKOUT0_REG1  = 7'h08;
   localparam CLKOUT0_REG2  = 7'h09;
   localparam CLKOUT1_REG1  = 7'h0A;
   localparam CLKOUT1_REG2  = 7'h0B;
   localparam CLKOUT2_REG1  = 7'h0C;
   localparam CLKOUT2_REG2  = 7'h0D;
   localparam CLKOUT3_REG1  = 7'h0E;
   localparam CLKOUT3_REG2  = 7'h0F;
   localparam CLKOUT4_REG1  = 7'h10;
   localparam CLKOUT4_REG2  = 7'h11;
   localparam CLKFBOUT_REG1 = 7'h14;
   localparam CLKFBOUT_REG2 = 7'h15;
   localparam DIVCLK_REG    = 7'h16;
   localparam LOCK_REG1     = 7'h18;
   localparam LOCK_REG2     = 7'h19;
   localparam LOCK_REG3     = 7'h1A;
   localparam POWER_REG     = 7'h28;
   localparam FILT_REG1     = 7'h4E;
   localparam FILT_REG2     = 7'h4F;

   reg [3:0] current_state = RESTART;
   reg [3:0] next_state    = RESTART;


   reg [5:0]  next_rom_addr;
   reg [6:0]  next_daddr;
   reg        next_dwe;
   reg        next_den;
   reg        next_rst_pll;
   reg [15:0] next_din;

   // number of configuration steps
   reg  [4:0]  config_step          = 0;
   reg  [4:0]  next_config_step     = 0;
   reg  [4:0]  remaining_steps      = CONFIG_STEPS;
   reg  [4:0]  next_remaining_steps = CONFIG_STEPS;
   reg  [15:0] reg_data = 0;

   wire [7:0]  divclk;

   reg  [22:0] mask;
   reg  [39:0] lock;
   reg  [9:0]  filter;

   assign divclk = DIVCLK_NO_COUNT ? 0 : DIVCLK_LOW_TIME + DIVCLK_HIGH_TIME - 1;

   always @(posedge dclk) begin
      // This is the table for bandwidth "OPTIMIZED", see xap888
      case (divclk)
         8'd0:  filter <= 10'b0011_0111_00; // 1
         8'd1:  filter <= 10'b0011_0111_00; // 2
         8'd2:  filter <= 10'b0101_1111_00; // 3
         8'd3:  filter <= 10'b0111_1111_00; // 4
         8'd4:  filter <= 10'b0111_1011_00; // ....
         8'd5:  filter <= 10'b1101_0111_00;
         8'd6:  filter <= 10'b1110_1011_00;
         8'd7:  filter <= 10'b1110_1101_00;
         8'd8:  filter <= 10'b1111_1101_00;
         8'd9:  filter <= 10'b1111_0111_00;
         8'd10: filter <= 10'b1111_1011_00;
         8'd11: filter <= 10'b1111_1101_00;
         8'd12: filter <= 10'b1111_0011_00;
         8'd13: filter <= 10'b1110_0101_00;
         8'd14: filter <= 10'b1111_0101_00;
         8'd15: filter <= 10'b1111_0101_00;
         8'd16: filter <= 10'b1111_0101_00;
         8'd17: filter <= 10'b1111_0101_00;
         8'd18: filter <= 10'b0111_0110_00;
         8'd19: filter <= 10'b0111_0110_00;
         8'd20: filter <= 10'b0111_0110_00;
         8'd21: filter <= 10'b0111_0110_00;
         8'd22: filter <= 10'b0101_1100_00;
         8'd23: filter <= 10'b0101_1100_00;
         8'd24: filter <= 10'b0101_1100_00;
         8'd25: filter <= 10'b1100_0001_00;
         8'd26: filter <= 10'b1100_0001_00;
         8'd27: filter <= 10'b1100_0001_00;
         8'd28: filter <= 10'b1100_0001_00;
         8'd29: filter <= 10'b1100_0001_00;
         8'd30: filter <= 10'b1100_0001_00;
         8'd31: filter <= 10'b1100_0001_00;
         8'd32: filter <= 10'b1100_0001_00;
         8'd33: filter <= 10'b0100_0010_00;
         8'd34: filter <= 10'b0100_0010_00;
         8'd35: filter <= 10'b0100_0010_00;
         8'd36: filter <= 10'b0010_1000_00;
         8'd37: filter <= 10'b0010_1000_00;
         8'd38: filter <= 10'b0010_1000_00;
         8'd39: filter <= 10'b0011_0100_00;
         8'd40: filter <= 10'b0010_1000_00;
         8'd41: filter <= 10'b0010_1000_00;
         8'd42: filter <= 10'b0010_1000_00;
         8'd43: filter <= 10'b0010_1000_00;
         8'd44: filter <= 10'b0010_1000_00;
         8'd45: filter <= 10'b0010_1000_00;
         8'd46: filter <= 10'b0010_1000_00;
         8'd47: filter <= 10'b0010_1000_00;
         8'd48: filter <= 10'b0010_1000_00;
         8'd49: filter <= 10'b0010_1000_00;
         8'd50: filter <= 10'b0010_1000_00;
         8'd51: filter <= 10'b0010_1000_00;
         8'd52: filter <= 10'b0010_1000_00;
         8'd53: filter <= 10'b0100_1100_00;
         8'd54: filter <= 10'b0100_1100_00;
         8'd55: filter <= 10'b0100_1100_00;
         8'd56: filter <= 10'b0100_1100_00;
         8'd57: filter <= 10'b0100_1100_00;
         8'd58: filter <= 10'b0100_1100_00;
         8'd59: filter <= 10'b0100_1100_00; // ....
         8'd60: filter <= 10'b0010_0100_00; // 61
         8'd61: filter <= 10'b0010_0100_00; // 62
         8'd62: filter <= 10'b0010_0100_00; // 63
         8'd63: filter <= 10'b0010_0100_00;  // 64
         // use the zero case here
         default: filter <= 10'b0010_1111_00;
      endcase
      case (divclk)
         8'd0:  lock <= 40'b00110_00110_1111101000_1111101001_0000000001;
         8'd1:  lock <= 40'b00110_00110_1111101000_1111101001_0000000001;
         8'd2:  lock <= 40'b01000_01000_1111101000_1111101001_0000000001;
         8'd3:  lock <= 40'b01011_01011_1111101000_1111101001_0000000001;
         8'd4:  lock <= 40'b01110_01110_1111101000_1111101001_0000000001;
         8'd5:  lock <= 40'b10001_10001_1111101000_1111101001_0000000001;
         8'd6:  lock <= 40'b10011_10011_1111101000_1111101001_0000000001;
         8'd7:  lock <= 40'b10110_10110_1111101000_1111101001_0000000001;
         8'd8:  lock <= 40'b11001_11001_1111101000_1111101001_0000000001;
         8'd9:  lock <= 40'b11100_11100_1111101000_1111101001_0000000001;
         8'd10: lock <= 40'b11111_11111_1110000100_1111101001_0000000001;
         8'd11: lock <= 40'b11111_11111_1100111001_1111101001_0000000001;
         8'd12: lock <= 40'b11111_11111_1011101110_1111101001_0000000001;
         8'd13: lock <= 40'b11111_11111_1010111100_1111101001_0000000001;
         8'd14: lock <= 40'b11111_11111_1010001010_1111101001_0000000001;
         8'd15: lock <= 40'b11111_11111_1001110001_1111101001_0000000001;
         8'd16: lock <= 40'b11111_11111_1000111111_1111101001_0000000001;
         8'd17: lock <= 40'b11111_11111_1000100110_1111101001_0000000001;
         8'd18: lock <= 40'b11111_11111_1000001101_1111101001_0000000001;
         8'd19: lock <= 40'b11111_11111_0111110100_1111101001_0000000001;
         8'd20: lock <= 40'b11111_11111_0111011011_1111101001_0000000001;
         8'd21: lock <= 40'b11111_11111_0111000010_1111101001_0000000001;
         8'd22: lock <= 40'b11111_11111_0110101001_1111101001_0000000001;
         8'd23: lock <= 40'b11111_11111_0110010000_1111101001_0000000001;
         8'd24: lock <= 40'b11111_11111_0110010000_1111101001_0000000001;
         8'd25: lock <= 40'b11111_11111_0101110111_1111101001_0000000001;
         8'd26: lock <= 40'b11111_11111_0101011110_1111101001_0000000001;
         8'd27: lock <= 40'b11111_11111_0101011110_1111101001_0000000001;
         8'd28: lock <= 40'b11111_11111_0101000101_1111101001_0000000001;
         8'd29: lock <= 40'b11111_11111_0101000101_1111101001_0000000001;
         8'd30: lock <= 40'b11111_11111_0100101100_1111101001_0000000001;
         8'd31: lock <= 40'b11111_11111_0100101100_1111101001_0000000001;
         8'd32: lock <= 40'b11111_11111_0100101100_1111101001_0000000001;
         8'd33: lock <= 40'b11111_11111_0100010011_1111101001_0000000001;
         8'd34: lock <= 40'b11111_11111_0100010011_1111101001_0000000001;
         8'd35: lock <= 40'b11111_11111_0100010011_1111101001_0000000001;
         8'd36: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd37: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd38: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd39: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd40: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd41: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd42: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd43: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd44: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd45: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd46: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd47: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd48: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd49: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd50: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd51: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd52: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd53: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd54: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd55: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd56: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd57: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd58: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd59: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd60: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd61: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd62: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         8'd63: lock <= 40'b11111_11111_0011111010_1111101001_0000000001;
         // use the 0 case here
         default: lock <= 40'b00110_00110_1111101000_1111101001_0000000001;
      endcase
   end

   // This block assigns the next register value from the state machine below
   always @(posedge dclk) begin
      daddr       <= next_daddr;
      dwe         <= next_dwe;
      den         <= next_den;
      rst_pll    <= next_rst_pll;
      din         <= next_din;
      config_step     <= next_config_step;
      remaining_steps <= next_remaining_steps;
   end

   // next state with synchroneous reset
   always @(posedge dclk) begin
      if(rst) begin
         current_state <= RESTART;
      end else begin
         current_state <= next_state;
      end
   end

   always @* begin
      next_dwe              = 1'b0;
      next_den              = 1'b0;
      next_rst_pll          = rst_pll;
      next_din              = din;
      next_config_step      = config_step;
      next_remaining_steps  = remaining_steps;
      reconfig_done         = 1'b0;

      case (config_step)
         POWER_REG_STEP:      mask = 16'h0000;
         CLKOUT0_REG1_STEP:   mask = 16'h1000; // CLKOUT0 [15:0]
         CLKOUT0_REG2_STEP:   mask = 16'hFC00; // CLKOUT0 [31:16]
         CLKOUT1_REG1_STEP:   mask = 16'h1000; // CLKOUT1 [15:0]
         CLKOUT1_REG2_STEP:   mask = 16'hFC00; // CLKOUT1 [31:16]
         CLKOUT2_REG1_STEP:   mask = 16'h1000; // CLKOUT2 [15:0]
         CLKOUT2_REG2_STEP:   mask = 16'hFC00; // CLKOUT2 [31:16]
         CLKOUT3_REG1_STEP:   mask = 16'h1000; // CLKOUT3 [15:0]
         CLKOUT3_REG2_STEP:   mask = 16'hFC00; // CLKOUT3 [31:16]
         CLKOUT4_REG1_STEP:   mask = 16'h1000; // CLKOUT4 [15:0]
         CLKOUT4_REG2_STEP:   mask = 16'hFC00; // CLKOUT4 [31:16]
         CLKOUT5_REG1_STEP:   mask = 16'h1000; // CLKOUT5 [15:0]
         CLKOUT5_REG2_STEP:   mask = 16'hFC00; // CLKOUT5 [31:16]
         DIVCLK_REG_STEP:     mask = 16'hC000;
         CLKFBOUT_REG1_STEP:  mask = 16'h1000; // CLKFBOUT [15:0]
         CLKFBOUT_REG2_STEP:  mask = 16'hFC00; // CLKFBOUT [31:16]
         LOCK_REG1_STEP:      mask = 16'hFC00; // { LOCK[29:20] }
         LOCK_REG2_STEP:      mask = 16'h8000; // { LOCK[34:30], LOCK[9:0] }
         LOCK_REG3_STEP:      mask = 16'h8000; // { LOCK[39:35], LOCK[19:10] }
         FILT_REG1_STEP:      mask = 16'h66FF; // { FILT[9],   2'h0,
                                                //   FILT[8:7], 2'h0, 
                                                //   FILT[6],   8'h00 }
         FILT_REG2_STEP:      mask = 16'h666F; // { FILT[5], 2'h0, 
                                               //   FILT[4:3], 2'h0,
                                               //   FILT[2:1], 2'h0,
                                               //   FILT[0], 4'h0 }

         default:             mask = 16'h0000;
      endcase
      case (config_step)
         POWER_REG_STEP     : reg_data = 16'hffff;
         // Reg1
         CLKOUT0_REG1_STEP  : reg_data = { CLKOUT0_PHASE_MUX,  1'b0, CLKOUT0_HIGH_TIME,  CLKOUT0_LOW_TIME };
         CLKOUT1_REG1_STEP  : reg_data = { CLKOUT1_PHASE_MUX,  1'b0, CLKOUT1_HIGH_TIME,  CLKOUT1_LOW_TIME };
         CLKOUT2_REG1_STEP  : reg_data = { CLKOUT2_PHASE_MUX,  1'b0, CLKOUT2_HIGH_TIME,  CLKOUT2_LOW_TIME };
         CLKOUT3_REG1_STEP  : reg_data = { CLKOUT3_PHASE_MUX,  1'b0, CLKOUT3_HIGH_TIME,  CLKOUT3_LOW_TIME };
         CLKOUT4_REG1_STEP  : reg_data = { CLKOUT4_PHASE_MUX,  1'b0, CLKOUT4_HIGH_TIME,  CLKOUT4_LOW_TIME };
         CLKOUT5_REG1_STEP  : reg_data = { CLKOUT5_PHASE_MUX,  1'b0, CLKOUT5_HIGH_TIME,  CLKOUT5_LOW_TIME };
         CLKFBOUT_REG1_STEP : reg_data = { CLKFBOUT_PHASE_MUX, 1'b0, CLKFBOUT_HIGH_TIME, CLKFBOUT_LOW_TIME };
         // Reg2
         CLKOUT0_REG2_STEP   : reg_data = { 6'b000000, 2'b00, CLKOUT0_EDGE,   CLKOUT0_NO_COUNT,   CLKOUT0_DELAY_TIME  };
         CLKOUT1_REG2_STEP   : reg_data = { 6'b000000, 2'b00, CLKOUT1_EDGE,   CLKOUT1_NO_COUNT,   CLKOUT1_DELAY_TIME  };
         CLKOUT2_REG2_STEP   : reg_data = { 6'b000000, 2'b00, CLKOUT2_EDGE,   CLKOUT2_NO_COUNT,   CLKOUT2_DELAY_TIME  };
         CLKOUT3_REG2_STEP   : reg_data = { 6'b000000, 2'b00, CLKOUT3_EDGE,   CLKOUT3_NO_COUNT,   CLKOUT3_DELAY_TIME  };
         CLKOUT4_REG2_STEP   : reg_data = { 6'b000000, 2'b00, CLKOUT4_EDGE,   CLKOUT4_NO_COUNT,   CLKOUT4_DELAY_TIME  };
         CLKOUT5_REG2_STEP   : reg_data = { 6'b000000, 2'b00, CLKOUT5_EDGE,   CLKOUT5_NO_COUNT,   CLKOUT5_DELAY_TIME  };
         CLKFBOUT_REG2_STEP  : reg_data = { 6'b000000, 2'b00, CLKFBOUT_EDGE,  CLKFBOUT_NO_COUNT,  CLKFBOUT_DELAY_TIME  };
         // DIVCLK/LOCK/FILT
         DIVCLK_REG_STEP    : reg_data = { 2'b00, DIVCLK_EDGE, DIVCLK_NO_COUNT, DIVCLK_HIGH_TIME, DIVCLK_LOW_TIME };
         LOCK_REG1_STEP     : reg_data = { 6'b000000, lock[29:20] };
         LOCK_REG2_STEP     : reg_data = { 1'b0, lock[34:30], lock[9:0]   };
         LOCK_REG3_STEP     : reg_data = { 1'b0, lock[39:35], lock[19:10] };
         FILT_REG1_STEP     : reg_data = { filter[9], 2'b00, filter[8:7], 2'b00, filter[6], 8'h00 };
         FILT_REG2_STEP     : reg_data = { filter[5], 2'b00, filter[4:3], 2'b00, filter[2:1], 2'b00, filter[0], 4'h0 };
         default            : reg_data = 16'd0;
      endcase
      case (config_step)
         POWER_REG_STEP:      next_daddr = POWER_REG;
         CLKOUT0_REG1_STEP:   next_daddr = CLKOUT0_REG1;
         CLKOUT0_REG2_STEP:   next_daddr = CLKOUT0_REG2;
         CLKOUT1_REG1_STEP:   next_daddr = CLKOUT1_REG1;
         CLKOUT1_REG2_STEP:   next_daddr = CLKOUT1_REG2;
         CLKOUT2_REG1_STEP:   next_daddr = CLKOUT2_REG1;
         CLKOUT2_REG2_STEP:   next_daddr = CLKOUT2_REG2;
         CLKOUT3_REG1_STEP:   next_daddr = CLKOUT3_REG1;
         CLKOUT3_REG2_STEP:   next_daddr = CLKOUT3_REG2;
         CLKOUT4_REG1_STEP:   next_daddr = CLKOUT4_REG1;
         CLKOUT4_REG2_STEP:   next_daddr = CLKOUT4_REG2;
         CLKOUT5_REG1_STEP:   next_daddr = CLKOUT5_REG1;
         CLKOUT5_REG2_STEP:   next_daddr = CLKOUT5_REG2;
         DIVCLK_REG_STEP:     next_daddr = DIVCLK_REG;
         CLKFBOUT_REG1_STEP:  next_daddr = CLKFBOUT_REG1;
         CLKFBOUT_REG2_STEP:  next_daddr = CLKFBOUT_REG2;
         LOCK_REG1_STEP:      next_daddr = LOCK_REG1;
         LOCK_REG2_STEP:      next_daddr = LOCK_REG2;
         LOCK_REG3_STEP:      next_daddr = LOCK_REG3;
         FILT_REG1_STEP:      next_daddr = FILT_REG1;
         FILT_REG2_STEP:      next_daddr = FILT_REG2;
         default:             next_daddr = 7'd0;
      endcase

      ready = current_state == WAIT_START;

      case (current_state)
         RESTART: begin
            next_din          = 16'h0000;
            next_config_step  = 6'h00;
            next_rst_pll      = 1'b1;
            next_state        = WAIT_LOCK;
         end

         // Waits for the pll to get locked - once it does asserts SRDY
         WAIT_LOCK: begin
            // start up the pll
            next_rst_pll = 1'b0;
            next_remaining_steps = CONFIG_STEPS;
            next_config_step = 8'h00;

            if(locked) begin
               next_state  = WAIT_START;
            end else begin
               next_state  = WAIT_LOCK;
            end
         end

         WAIT_START: begin
            next_config_step = 8'h00;
            if (start_reconfig) begin
               next_config_step = 8'h00;
               next_state = ADDRESS;
            end else begin
               next_state = WAIT_START;
            end
         end

         // Set the address on the pll and assert DEN to read the value
         ADDRESS: begin
            // Reset the DCM through the reconfiguration
            next_rst_pll  = 1'b1;
            // read enable
            next_den       = 1'b1;
            // Wait for the data to be ready
            next_state     = WAIT_A_DRDY;
         end

         // Wait for DRDY to assert after addressing the pll
         WAIT_A_DRDY: begin
            if (drdy) begin
               // Data is ready, next: apply bitmask
               next_state = BITMASK;
            end else begin
               next_state = WAIT_A_DRDY;
            end
         end

         // Zero out the bits that are not set in the mask stored in rom
         BITMASK: begin
            // Mask the data read
            next_din    = mask & dout;
            next_state  = BITSET;
         end

         BITSET: begin
            // Set the bits that need to be assigned
            next_din          = reg_data | din;
            next_state        = WRITE;
         end

         WRITE: begin
            // write register data
            next_dwe          = 1'b1;
            next_den          = 1'b1;

            next_config_step      = config_step + 1'b1;
            next_remaining_steps  = remaining_steps - 1'b1;
            next_state            = WAIT_DRDY;
         end

         WAIT_DRDY: begin
            if(drdy) begin
               // Write is complete
               if(remaining_steps > 0) begin
                  // If there are more registers to write keep going
                  next_state  = ADDRESS;
               end else begin
                  // There are no more registers to write so wait for the pll
                  // to lock
                  next_state  = WAIT_LOCK;
                  reconfig_done = 1'b1;
               end
            end else begin
               // Keep waiting for write to complete
               next_state     = WAIT_DRDY;
            end
         end

         // If in an unknown state reset the machine
         default: begin
            next_state = RESTART;
         end
      endcase
   end
endmodule