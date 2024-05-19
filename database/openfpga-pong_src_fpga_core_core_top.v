// This program was cloned from: https://github.com/agg23/openfpga-pong
// License: MIT License

//
// User core top-level
//
// Instantiated by the real top-level: apf_top
//

`default_nettype none

module core_top (

    //
    // physical connections
    //

    ///////////////////////////////////////////////////
    // clock inputs 74.25mhz. not phase aligned, so treat these domains as asynchronous

    input   wire            clk_74a, // mainclk1
    input   wire            clk_74b, // mainclk1

    ///////////////////////////////////////////////////
    // cartridge interface
    // switches between 3.3v and 5v mechanically
    // output enable for multibit translators controlled by pic32

    // GBA AD[15:8]
    inout   wire    [7:0]   cart_tran_bank2,
    output  wire            cart_tran_bank2_dir,

    // GBA AD[7:0]
    inout   wire    [7:0]   cart_tran_bank3,
    output  wire            cart_tran_bank3_dir,

    // GBA A[23:16]
    inout   wire    [7:0]   cart_tran_bank1,
    output  wire            cart_tran_bank1_dir,

    // GBA [7] PHI#
    // GBA [6] WR#
    // GBA [5] RD#
    // GBA [4] CS1#/CS#
    //     [3:0] unwired
    inout   wire    [7:4]   cart_tran_bank0,
    output  wire            cart_tran_bank0_dir,

    // GBA CS2#/RES#
    inout   wire            cart_tran_pin30,
    output  wire            cart_tran_pin30_dir,
    // when GBC cart is inserted, this signal when low or weak will pull GBC /RES low with a special circuit
    // the goal is that when unconfigured, the FPGA weak pullups won't interfere.
    // thus, if GBC cart is inserted, FPGA must drive this high in order to let the level translators
    // and general IO drive this pin.
    output  wire            cart_pin30_pwroff_reset,

    // GBA IRQ/DRQ
    inout   wire            cart_tran_pin31,
    output  wire            cart_tran_pin31_dir,

    // infrared
    input   wire            port_ir_rx,
    output  wire            port_ir_tx,
    output  wire            port_ir_rx_disable,

    // GBA link port
    inout   wire            port_tran_si,
    output  wire            port_tran_si_dir,
    inout   wire            port_tran_so,
    output  wire            port_tran_so_dir,
    inout   wire            port_tran_sck,
    output  wire            port_tran_sck_dir,
    inout   wire            port_tran_sd,
    output  wire            port_tran_sd_dir,

    ///////////////////////////////////////////////////
    // cellular psram 0 and 1, two chips (64mbit x2 dual die per chip)

    output  wire    [21:16] cram0_a,
    inout   wire    [15:0]  cram0_dq,
    input   wire            cram0_wait,
    output  wire            cram0_clk,
    output  wire            cram0_adv_n,
    output  wire            cram0_cre,
    output  wire            cram0_ce0_n,
    output  wire            cram0_ce1_n,
    output  wire            cram0_oe_n,
    output  wire            cram0_we_n,
    output  wire            cram0_ub_n,
    output  wire            cram0_lb_n,

    output  wire    [21:16] cram1_a,
    inout   wire    [15:0]  cram1_dq,
    input   wire            cram1_wait,
    output  wire            cram1_clk,
    output  wire            cram1_adv_n,
    output  wire            cram1_cre,
    output  wire            cram1_ce0_n,
    output  wire            cram1_ce1_n,
    output  wire            cram1_oe_n,
    output  wire            cram1_we_n,
    output  wire            cram1_ub_n,
    output  wire            cram1_lb_n,

    ///////////////////////////////////////////////////
    // sdram, 512mbit 16bit

    output  wire    [12:0]  dram_a,
    output  wire    [1:0]   dram_ba,
    inout   wire    [15:0]  dram_dq,
    output  wire    [1:0]   dram_dqm,
    output  wire            dram_clk,
    output  wire            dram_cke,
    output  wire            dram_ras_n,
    output  wire            dram_cas_n,
    output  wire            dram_we_n,

    ///////////////////////////////////////////////////
    // sram, 1mbit 16bit

    output  wire    [16:0]  sram_a,
    inout   wire    [15:0]  sram_dq,
    output  wire            sram_oe_n,
    output  wire            sram_we_n,
    output  wire            sram_ub_n,
    output  wire            sram_lb_n,

    ///////////////////////////////////////////////////
    // vblank driven by dock for sync in a certain mode

    input   wire            vblank,

    ///////////////////////////////////////////////////
    // i/o to 6515D breakout usb uart

    output  wire            dbg_tx,
    input   wire            dbg_rx,

    ///////////////////////////////////////////////////
    // i/o pads near jtag connector user can solder to

    output  wire            user1,
    input   wire            user2,

    ///////////////////////////////////////////////////
    // RFU internal i2c bus

    inout   wire            aux_sda,
    output  wire            aux_scl,

    ///////////////////////////////////////////////////
    // RFU, do not use
    output  wire            vpll_feed,


    //
    // logical connections
    //

    ///////////////////////////////////////////////////
    // video, audio output to scaler
    output  wire    [23:0]  video_rgb,
    output  wire            video_rgb_clock,
    output  wire            video_rgb_clock_90,
    output  wire            video_de,
    output  wire            video_skip,
    output  wire            video_vs,
    output  wire            video_hs,

    output  wire            audio_mclk,
    input   wire            audio_adc,
    output  wire            audio_dac,
    output  wire            audio_lrck,

    ///////////////////////////////////////////////////
    // bridge bus connection
    // synchronous to clk_74a
    output  wire            bridge_endian_little,
    input   wire    [31:0]  bridge_addr,
    input   wire            bridge_rd,
    output  reg     [31:0]  bridge_rd_data,
    input   wire            bridge_wr,
    input   wire    [31:0]  bridge_wr_data,

    ///////////////////////////////////////////////////
    // controller data
    //
    // key bitmap:
    //   [0]    dpad_up
    //   [1]    dpad_down
    //   [2]    dpad_left
    //   [3]    dpad_right
    //   [4]    face_a
    //   [5]    face_b
    //   [6]    face_x
    //   [7]    face_y
    //   [8]    trig_l1
    //   [9]    trig_r1
    //   [10]   trig_l2
    //   [11]   trig_r2
    //   [12]   trig_l3
    //   [13]   trig_r3
    //   [14]   face_select
    //   [15]   face_start
    // joy values - unsigned
    //   [ 7: 0] lstick_x
    //   [15: 8] lstick_y
    //   [23:16] rstick_x
    //   [31:24] rstick_y
    // trigger values - unsigned
    //   [ 7: 0] ltrig
    //   [15: 8] rtrig
    //
    input   wire    [31:0]  cont1_key,
    input   wire    [31:0]  cont2_key,
    input   wire    [31:0]  cont3_key,
    input   wire    [31:0]  cont4_key,
    input   wire    [31:0]  cont1_joy,
    input   wire    [31:0]  cont2_joy,
    input   wire    [31:0]  cont3_joy,
    input   wire    [31:0]  cont4_joy,
    input   wire    [15:0]  cont1_trig,
    input   wire    [15:0]  cont2_trig,
    input   wire    [15:0]  cont3_trig,
    input   wire    [15:0]  cont4_trig

  );

  // not using the IR port, so turn off both the LED, and
  // disable the receive circuit to save power
  assign port_ir_tx = 0;
  assign port_ir_rx_disable = 1;

  // bridge endianness
  assign bridge_endian_little = 0;

  // cart is unused, so set all level translators accordingly
  // directions are 0:IN, 1:OUT
  assign cart_tran_bank3 = 8'hzz;
  assign cart_tran_bank3_dir = 1'b0;
  assign cart_tran_bank2 = 8'hzz;
  assign cart_tran_bank2_dir = 1'b0;
  assign cart_tran_bank1 = 8'hzz;
  assign cart_tran_bank1_dir = 1'b0;
  assign cart_tran_bank0 = 4'hf;
  assign cart_tran_bank0_dir = 1'b1;
  assign cart_tran_pin30 = 1'b0;      // reset or cs2, we let the hw control it by itself
  assign cart_tran_pin30_dir = 1'bz;
  assign cart_pin30_pwroff_reset = 1'b0;  // hardware can control this
  assign cart_tran_pin31 = 1'bz;      // input
  assign cart_tran_pin31_dir = 1'b0;  // input

  // link port is input only
  assign port_tran_so = 1'bz;
  assign port_tran_so_dir = 1'b0;     // SO is output only
  assign port_tran_si = 1'bz;
  assign port_tran_si_dir = 1'b0;     // SI is input only
  assign port_tran_sck = 1'bz;
  assign port_tran_sck_dir = 1'b0;    // clock direction can change
  assign port_tran_sd = 1'bz;
  assign port_tran_sd_dir = 1'b0;     // SD is input and not used


  // for bridge write data, we just broadcast it to all bus devices
  // for bridge read data, we have to mux it
  // add your own devices here
  always @(*)
  begin
    casex(bridge_addr)
      32'hF8xxxxxx:
      begin
        bridge_rd_data <= cmd_bridge_rd_data;
      end
    endcase
  end

  always @(posedge clk_74a)
  begin
    if(bridge_wr)
    begin
      casex(bridge_addr)
        32'h00000000:
        begin
          score_stop_at_15 <= bridge_wr_data[0:0];
        end
        32'h0000000C:
        begin
          prevent_coin_reset <= bridge_wr_data[0:0];
        end
        32'h00000014:
        begin
          double_paddle_height <= bridge_wr_data[0:0];
        end
        32'h00000018:
        begin
          training_mode <= bridge_wr_data[0:0];
        end
      endcase
    end
  end


  //
  // host/target command handler
  //
  wire            reset_n;                // driven by host commands, can be used as core-wide reset
  wire    [31:0]  cmd_bridge_rd_data;

  // bridge host commands
  // synchronous to clk_74a
  wire            status_boot_done = pll_core_locked;
  wire            status_setup_done = pll_core_locked; // rising edge triggers a target command
  wire            status_running = reset_n; // we are running as soon as reset_n goes high

  wire            dataslot_requestread;
  wire    [15:0]  dataslot_requestread_id;
  wire            dataslot_requestread_ack = 1;
  wire            dataslot_requestread_ok = 1;

  wire            dataslot_requestwrite;
  wire    [15:0]  dataslot_requestwrite_id;
  wire            dataslot_requestwrite_ack = 1;
  wire            dataslot_requestwrite_ok = 1;

  wire            dataslot_allcomplete;

  wire            savestate_supported;
  wire    [31:0]  savestate_addr;
  wire    [31:0]  savestate_size;
  wire    [31:0]  savestate_maxloadsize;

  wire            savestate_start;
  wire            savestate_start_ack;
  wire            savestate_start_busy;
  wire            savestate_start_ok;
  wire            savestate_start_err;

  wire            savestate_load;
  wire            savestate_load_ack;
  wire            savestate_load_busy;
  wire            savestate_load_ok;
  wire            savestate_load_err;

  // bridge target commands
  // synchronous to clk_74a


  // bridge data slot access

  wire    [9:0]   datatable_addr;
  wire            datatable_wren;
  wire    [31:0]  datatable_data;
  wire    [31:0]  datatable_q;

  core_bridge_cmd icb (

                    .clk                ( clk_74a ),
                    .reset_n            ( reset_n ),

                    .bridge_endian_little   ( bridge_endian_little ),
                    .bridge_addr            ( bridge_addr ),
                    .bridge_rd              ( bridge_rd ),
                    .bridge_rd_data         ( cmd_bridge_rd_data ),
                    .bridge_wr              ( bridge_wr ),
                    .bridge_wr_data         ( bridge_wr_data ),

                    .status_boot_done       ( status_boot_done ),
                    .status_setup_done      ( status_setup_done ),
                    .status_running         ( status_running ),

                    .dataslot_requestread       ( dataslot_requestread ),
                    .dataslot_requestread_id    ( dataslot_requestread_id ),
                    .dataslot_requestread_ack   ( dataslot_requestread_ack ),
                    .dataslot_requestread_ok    ( dataslot_requestread_ok ),

                    .dataslot_requestwrite      ( dataslot_requestwrite ),
                    .dataslot_requestwrite_id   ( dataslot_requestwrite_id ),
                    .dataslot_requestwrite_ack  ( dataslot_requestwrite_ack ),
                    .dataslot_requestwrite_ok   ( dataslot_requestwrite_ok ),

                    .dataslot_allcomplete   ( dataslot_allcomplete ),

                    .savestate_supported    ( savestate_supported ),
                    .savestate_addr         ( savestate_addr ),
                    .savestate_size         ( savestate_size ),
                    .savestate_maxloadsize  ( savestate_maxloadsize ),

                    .savestate_start        ( savestate_start ),
                    .savestate_start_ack    ( savestate_start_ack ),
                    .savestate_start_busy   ( savestate_start_busy ),
                    .savestate_start_ok     ( savestate_start_ok ),
                    .savestate_start_err    ( savestate_start_err ),

                    .savestate_load         ( savestate_load ),
                    .savestate_load_ack     ( savestate_load_ack ),
                    .savestate_load_busy    ( savestate_load_busy ),
                    .savestate_load_ok      ( savestate_load_ok ),
                    .savestate_load_err     ( savestate_load_err ),

                    .datatable_addr         ( datatable_addr ),
                    .datatable_wren         ( datatable_wren ),
                    .datatable_data         ( datatable_data ),
                    .datatable_q            ( datatable_q ),

                  );

  wire [31:0] cont1_key_s;
  wire [31:0] cont2_key_s;

  synch_2 #(
    .WIDTH(32)
  ) cont_1_s (
    cont1_key,
    cont1_key_s,
    clk_core_7159
  );

  synch_2 #(
    .WIDTH(32)
  ) cont_2_s (
    cont2_key,
    cont2_key_s,
    clk_core_7159
  );

  reg prev_button_15 = 0;
  reg coin_insert = 0;

  reg score_stop_at_15 = 0;
  reg double_paddle_height = 0;
  reg training_mode = 0;

  wire disable_p2_on_pad_1 = cont1_key_s[31:29] > 0 ? 1 : 0;
  reg prevent_coin_reset = 1;

  wire video_de_pong;
  wire video_vs_pong;
  wire video_hs_pong;
  wire [23:0] video_rgb_pong;

  wire sound;

  wire p2_up;
  wire p2_down;
  wire p2_fine_control;

  assign p2_up = disable_p2_on_pad_1 ? cont2_key_s[0] : cont1_key_s[6] || cont2_key_s[0];
  assign p2_down = disable_p2_on_pad_1 ? cont2_key_s[1] : cont1_key_s[5] || cont2_key_s[1];
  assign p2_fine_control = disable_p2_on_pad_1 ? cont2_key_s[8] : cont1_key_s[9] || cont2_key_s[8];

  pong pong (
         .clk_7_159 ( clk_core_7159 ),
         .clk_sync ( clk_sync_28_636 ),

         .p1_up ( cont1_key_s[0] ),
         .p1_down ( cont1_key_s[1] ),
         .p1_fine_control ( cont1_key_s[8] ),

         .p2_up ( p2_up ),
         .p2_down ( p2_down ),
         .p2_fine_control ( p2_fine_control ),

         .coin_insert ( coin_insert ),
         .score_stop_at_15 ( score_stop_at_15 ),
         .prevent_coin_reset ( prevent_coin_reset ),
         .double_paddle_height ( double_paddle_height ),
         .training_mode ( training_mode ),

         .video_de ( video_de_pong ),
         .video_vs ( video_vs_pong ),
         .video_hs ( video_hs_pong ),

         .video_rgb ( video_rgb_pong ),

         .sound ( sound )
       );

  // Prevent holding of coin insert
  always @(posedge clk_core_7159)
  begin
    coin_insert <= 0;
    if (!prev_button_15 && cont1_key_s[15])
      coin_insert <= 1;
    prev_button_15 = cont1_key_s[15];
  end

  assign video_rgb_clock = clk_core_7159;
  assign video_rgb_clock_90 = clk_core_7159_90deg;

  //
  // Video cleanup
  // APF scaler requires HSync and VSync to last for a single clock, and video_rgb to be 0 when video_de is low
  //
  reg video_de_reg;
  reg video_hs_reg;
  reg video_vs_reg;
  reg [23:0] video_rgb_reg;

  assign video_de = video_de_reg;
  assign video_hs = video_hs_reg;
  assign video_vs = video_vs_reg;
  assign video_rgb = video_rgb_reg;

  reg hs_prev;
  reg vs_prev;

  always @(posedge clk_core_7159)
  begin
    video_de_reg <= 0;
    video_rgb_reg <= 24'h0;

    if (video_de_pong)
    begin
      video_de_reg <= 1;

      video_rgb_reg <= video_rgb_pong;
    end

    // Set HSync and VSync to be high for a single cycle on the rising edge of the HSync and VSync coming out of Pong
    video_hs_reg <= ~hs_prev && video_hs_pong;
    video_vs_reg <= ~vs_prev && video_vs_pong;
    hs_prev <= video_hs_pong;
    vs_prev <= video_vs_pong;
  end


  //
  // audio i2s square wave generator
  //

  assign audio_mclk = audgen_mclk;
  assign audio_dac = audgen_dac;
  assign audio_lrck = audgen_lrck;

  reg				audgen_nextsamp;

  // generate MCLK = 12.288mhz with fractional accumulator
  reg         [21:0]  audgen_accum;
  reg                 audgen_mclk;
  parameter   [20:0]  CYCLE_48KHZ = 21'd122880 * 2;
  always @(posedge clk_74a)
  begin
    audgen_accum <= audgen_accum + CYCLE_48KHZ;
    if(audgen_accum >= 21'd742500)
    begin
      audgen_mclk <= ~audgen_mclk;
      audgen_accum <= audgen_accum - 21'd742500 + CYCLE_48KHZ;
    end
  end

  // generate SCLK = 3.072mhz by dividing MCLK by 4
  reg [1:0]   aud_mclk_divider;
  wire        audgen_sclk = aud_mclk_divider[1] /* synthesis keep*/;
  always @(posedge audgen_mclk)
  begin
    aud_mclk_divider <= aud_mclk_divider + 1'b1;
  end

  // shift out audio data as I2S
  // 32 total bits per channel, but only 16 active bits at the start and then 16 dummy bits
  //
  // synchronize audio samples coming from the core
  wire	[31:0]	audgen_sampdata_s;
  synch_3 #(.WIDTH(32)) s5(sound ? 32'h70007000 : 32'b0, audgen_sampdata_s, audgen_sclk);
  reg		[31:0]	audgen_sampshift;
  reg		[4:0]	audgen_lrck_cnt;
  reg				audgen_lrck;
  reg				audgen_dac;
  always @(negedge audgen_sclk)
  begin
    // output the next bit
    audgen_dac <= audgen_sampshift[31];

    // 48khz * 64
    audgen_lrck_cnt <= audgen_lrck_cnt + 1'b1;
    if(audgen_lrck_cnt == 31)
    begin
      // switch channels
      audgen_lrck <= ~audgen_lrck;

      // Reload sample shifter
      if(~audgen_lrck)
      begin
        audgen_sampshift <= audgen_sampdata_s;
      end
    end
    else if(audgen_lrck_cnt < 16)
    begin
      // only shift for 16 clocks per channel
      audgen_sampshift <= {audgen_sampshift[30:0], 1'b0};
    end
  end

  ///////////////////////////////////////////////


  wire    clk_core_7159;
  wire    clk_core_7159_90deg;
  wire    clk_sync_28_636;

  wire    pll_core_locked;

  mf_pllbase mp1 (
               .refclk         ( clk_74a ),
               .rst            ( 0 ),

               .outclk_0       ( clk_core_7159 ),
               .outclk_1       ( clk_core_7159_90deg ),
               .outclk_2       ( clk_sync_28_636 ),

               .locked         ( pll_core_locked )
             );



endmodule
