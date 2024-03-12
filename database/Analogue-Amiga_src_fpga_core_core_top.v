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
output  wire     [23:0]  video_rgb,
output  wire            video_rgb_clock,
output  wire            video_rgb_clock_90,
output  wire         	video_de,
output  wire         	video_skip,
output  wire         	video_vs,
output  wire         	video_hs,
    
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
//   [31:28] type
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

wire    [31:0]  cont1_key_s;
wire    [31:0]  cont2_key_s;
wire    [31:0]  cont1_joy_s;
wire    [31:0]  cont2_joy_s;
wire    [31:0]  cont3_joy_s;
wire    [31:0]  cont4_joy_s;

synch_3 #(.WIDTH(32)) controller_key1_sync(cont1_key, cont1_key_s, clk_sys);
synch_3 #(.WIDTH(32)) controller_key2_sync(cont2_key, cont2_key_s, clk_sys);
synch_3 #(.WIDTH(32)) controller_joy1_sync(cont1_joy, cont1_joy_s, clk_sys);
synch_3 #(.WIDTH(32)) controller_joy2_sync(cont2_joy, cont2_joy_s, clk_sys);
synch_3 #(.WIDTH(32)) controller_joy3_sync(cont3_joy, cont3_joy_s, clk_sys);
synch_3 #(.WIDTH(32)) controller_joy4_sync(cont4_joy, cont4_joy_s, clk_sys);

// not using the IR port, so turn off both the LED, and
// disable the receive circuit to save power
assign port_ir_tx = 0;
assign port_ir_rx_disable = 1;

// bridge endianness
assign bridge_endian_little = 0;

// cart is unused, so set all level translators accordingly
// directions are 0:IN, 1:OUT
assign cart_tran_bank3 = 8'hzz;            // these pins are not used, make them inputs
 assign cart_tran_bank3_dir = 1'b0;
 
 assign cart_tran_bank2 = 8'hzz;            // these pins are not used, make them inputs
 assign cart_tran_bank2_dir = 1'b0;
 assign cart_tran_bank1 = 8'hzz;            // these pins are not used, make them inputs
 assign cart_tran_bank1_dir = 1'b0;
 
 assign cart_tran_bank0 = {1'b0, TXDATA, LED, 1'b0};    // LED and TXD hook up here
 assign cart_tran_bank0_dir = 1'b1;
 
 assign cart_tran_pin30 = 1'bz;            // this pin is not used, make it an input
 assign cart_tran_pin30_dir = 1'b0;
 assign cart_pin30_pwroff_reset = 1'b1;    
 
 assign cart_tran_pin31 = 1'bz;            // this pin is an input
 assign cart_tran_pin31_dir = 1'b0;        // input
 // UART
 wire TXDATA;                        // your UART transmit data hooks up here
 wire RXDATA = cart_tran_pin31;        // your UART RX data shows up here
 
 // button/LED
 wire LED;                    // LED hooks up here.  HIGH = light up, LOW = off
 wire BUTTON = cart_tran_bank3[0];    // button data comes out here.  LOW = pressed, HIGH = unpressed

// link port is unused, set to input only to be safe
// each bit may be bidirectional in some applications
//assign port_tran_so = 1'bz;
assign port_tran_so_dir = 1'b1;     // SO is output only
//assign port_tran_si = 1'bz;
assign port_tran_si_dir = 1'b0;     // SI is input only
//assign port_tran_sck = 1'bz;
assign port_tran_sck_dir = 1'b0;    // clock direction can change
//assign port_tran_sd = 1'bz;
assign port_tran_sd_dir = 1'b0;     // SD is input and not used

// tie off the rest of the pins we are not using
assign cram0_a = 'h0;
assign cram0_dq = {16{1'bZ}};
assign cram0_clk = 0;
assign cram0_adv_n = 1;
assign cram0_cre = 0;
assign cram0_ce0_n = 1;
assign cram0_ce1_n = 1;
assign cram0_oe_n = 1;
assign cram0_we_n = 1;
assign cram0_ub_n = 1;
assign cram0_lb_n = 1;

assign cram1_a = 'h0;
assign cram1_dq = {16{1'bZ}};
assign cram1_clk = 0;
assign cram1_adv_n = 1;
assign cram1_cre = 0;
assign cram1_ce0_n = 1;
assign cram1_ce1_n = 1;
assign cram1_oe_n = 1;
assign cram1_we_n = 1;
assign cram1_ub_n = 1;
assign cram1_lb_n = 1;

assign sram_a = 'h0;
assign sram_dq = {16{1'bZ}};
assign sram_oe_n  = 1;
assign sram_we_n  = 1;
assign sram_ub_n  = 1;
assign sram_lb_n  = 1;

assign dbg_tx = 1'bZ;
assign user1 = 1'bZ;
assign aux_scl = 1'bZ;
assign vpll_feed = 1'bZ;

wire [31:0] fpga_bridge_rd_data;
wire [31:0] mpu_reg_bridge_rd_data; 
wire [31:0] mpu_ram_bridge_rd_data;
wire [31:0] vga_bridge_rd_data;

wire clk_mpu;


// for bridge write data, we just broadcast it to all bus devices
// for bridge read data, we have to mux it
// add your own devices here
always @(*) begin
    casex(bridge_addr)
	 32'h9Xxxxxxx: begin
        bridge_rd_data <= fpga_bridge_rd_data;
    end
	 32'hA00000xx: begin
        bridge_rd_data <= vga_bridge_rd_data;
    end
	 32'hf00000xx: begin
        bridge_rd_data <= mpu_reg_bridge_rd_data;
    end
    32'hF8xxxxxx: begin
        bridge_rd_data <= cmd_bridge_rd_data;
    end
	 default : begin
		bridge_rd_data <= mpu_ram_bridge_rd_data;
	 end
    endcase
end

//
// host/target command handler
//
    wire            reset_n;                // driven by host commands, can be used as core-wide reset
    wire    [31:0]  cmd_bridge_rd_data;
    
// bridge host commands
// synchronous to clk_74a
	 wire					pll_core_locked;
    wire            status_boot_done = pll_core_locked; 
    wire            status_setup_done = pll_core_locked; // rising edge triggers a target command
    wire            status_running = reset_n; // we are running as soon as reset_n goes high

    wire            dataslot_requestread;
    wire    [15:0]  dataslot_requestread_id;
    wire            dataslot_requestread_ack = 1;
    wire            dataslot_requestread_ok = 1;

    wire            dataslot_requestwrite;
    wire    [15:0]  dataslot_requestwrite_id;
    wire    [31:0]  dataslot_requestwrite_size;
    wire            dataslot_requestwrite_ack = 1;
    wire            dataslot_requestwrite_ok = 1;

    wire            dataslot_update;
    wire    [15:0]  dataslot_update_id;
    wire    [31:0]  dataslot_update_size;
    wire    [15:0]  dataslot_update_size_lba48;
    
    wire            dataslot_allcomplete;

    wire     [31:0] rtc_epoch_seconds;
    wire     [31:0] rtc_date_bcd;
    wire     [31:0] rtc_time_bcd;
    wire            rtc_valid;

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
    
    wire            osnotify_inmenu;

// bridge target commands
// synchronous to clk_74a

    wire             target_dataslot_read;       
    wire             target_dataslot_write;
	 wire 				target_dataslot_enableLBA48;


    wire            target_dataslot_ack;        
    wire            target_dataslot_done;
    wire    [2:0]   target_dataslot_err;

    wire     [15:0]  target_dataslot_id;
	 wire 	 [15:0]	target_dataslot_slotoffsetLBA48;
    wire     [31:0]  target_dataslot_slotoffset;
    wire     [31:0]  target_dataslot_bridgeaddr;
    wire     [31:0]  target_dataslot_length;
    
// bridge data slot access
// synchronous to clk_74a

    wire    [9:0]   datatable_addr;
    wire            datatable_wren;
    wire            datatable_rden;
    wire    [31:0]  datatable_data;
    wire    [31:0]  datatable_q;

core_bridge_cmd icb (

    .clk                    ( clk_74a ),
    .reset_n                ( reset_n ),
	 .clk_sys					 ( clk_mpu ),

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
    .dataslot_requestwrite_size ( dataslot_requestwrite_size ),
    .dataslot_requestwrite_ack  ( dataslot_requestwrite_ack ),
    .dataslot_requestwrite_ok   ( dataslot_requestwrite_ok ),

    .dataslot_update            ( dataslot_update ),
    .dataslot_update_id         ( dataslot_update_id ),
    .dataslot_update_size       ( dataslot_update_size ),
    .dataslot_update_size_lba48 ( dataslot_update_size_lba48 ),
    
    .dataslot_allcomplete   ( dataslot_allcomplete ),

    .rtc_epoch_seconds      ( rtc_epoch_seconds ),
    .rtc_date_bcd           ( rtc_date_bcd ),
    .rtc_time_bcd           ( rtc_time_bcd ),
    .rtc_valid              ( rtc_valid ),
    
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

    .osnotify_inmenu        ( osnotify_inmenu ),
    
    .target_dataslot_read       ( target_dataslot_read ),
    .target_dataslot_write      ( target_dataslot_write ),

    .target_dataslot_ack        ( target_dataslot_ack ),
    .target_dataslot_done       ( target_dataslot_done ),
    .target_dataslot_err        ( target_dataslot_err ),

    .target_dataslot_id         ( target_dataslot_id ),
    .target_dataslot_slotoffset ( target_dataslot_slotoffset ),
    .target_dataslot_slotoffsetLBA48 ( target_dataslot_slotoffsetLBA48 ),
		.target_dataslot_enableLBA48	(target_dataslot_enableLBA48),
    .target_dataslot_bridgeaddr ( target_dataslot_bridgeaddr ),
    .target_dataslot_length     ( target_dataslot_length ),

    .datatable_addr         ( datatable_addr ),
    .datatable_wren         ( datatable_wren ),
    .datatable_rden         ( datatable_rden ),
    .datatable_data         ( datatable_data ),
    .datatable_q            ( datatable_q )

);



////////////////////////////////////////////////////////////////////////////////////////

    
    reg [9:0]   work_x;
    reg [9:0]   work_y;
    reg [9:0]   target_x;
    reg [9:0]   target_y;
    reg         fifo_cleared;
    reg         reset_n_last;
    reg [3:0]   bootup_clearing;
    

	 
	 //// amiga clocks ////
	wire       	clk7_en;
	wire       	clk7n_en;
	wire 			clk7n_en90;
	wire       	c1;
	wire       	c3;
	wire       	cck;
	wire [9:0] 	eclk;
	 
	wire 			clk_sys;
	wire        cpu_rst;
	 
	wire  [2:0] chip_ipl;
	wire        chip_dtack;
	wire        chip_as;
	wire        chip_uds;
	wire        chip_lds;
	wire        chip_rw;
	wire [15:0] chip_dout;
	wire [15:0] chip_din;
	wire [23:1] chip_addr;
	
	wire  [1:0] cpucfg;
	wire  [2:0] cachecfg;
	wire  [6:0] memcfg;
	wire        bootrom;   
	wire [15:0] ram_data;      // sram data bus
	wire [15:0] ramdata_in;    // sram data bus in
	wire [47:0] chip48;        // big chip read
	wire [22:1] ram_address;   // sram address bus
	wire        _ram_bhe;      // sram upper byte select
	wire        _ram_ble;      // sram lower byte select
	wire        _ram_we;       // sram write enable
	wire        _ram_oe;       // sram output enable
	
	reg 			reset_d;
	
	
	wire        ide_fast;
	wire [15:0] ide_din;
	wire [15:0] ide_dout;
	wire  [4:0] ide_addr;
	wire        ide_rd;
	wire        ide_wr;
	wire  [5:0] ide_req;
	wire        ide_f_irq;
	wire  [5:0] ide_c_req;
	wire [15:0] ide_c_readdata;
	wire        ide_ena;

	wire [15:0] fastchip_dout;
wire        fastchip_sel;
wire        fastchip_lds;
wire        fastchip_uds;
wire        fastchip_rnw;
wire        fastchip_selack;
wire        fastchip_ready;
wire        fastchip_lw;

//wire        ide_fast;
wire        ide_f_led;
//wire        ide_f_irq;
wire  [5:0] ide_f_req;
wire [15:0] ide_f_readdata;
	wire [15:0] JOY0  =  CORE_OUTPUT[4] ? 'b0 : {cont1_key_s[14], cont1_key_s[9], cont1_key_s[8], cont1_key_s[7], cont1_key_s[6], 
								 cont1_key_s[5],  cont1_key_s[4], cont1_key_s[0], cont1_key_s[1], cont1_key_s[2], cont1_key_s[3]};
	// joystick 2 [fire4,fire3,fire2,fire,up,down,left,right] (default joystick port)
	wire [15:0] JOY1 = 	CORE_OUTPUT[5] ? 'b0 : {cont2_key_s[14], cont2_key_s[9], cont2_key_s[8], cont2_key_s[7], cont2_key_s[6], 
								 cont2_key_s[5],  cont2_key_s[4], cont2_key_s[0], cont2_key_s[1], cont2_key_s[2], cont2_key_s[3]};
	wire [15:0] JOY2;// = {16{joystick_enable[2]}} & {cont1_key[7], cont1_key[6], cont1_key[4], cont1_key[5], cont1_key[0], cont1_key[1], cont1_key[2], cont1_key[3]};
	wire [15:0] JOY3;// = {16{joystick_enable[3]}} & {cont1_key[7], cont1_key[6], cont1_key[4], cont1_key[5], cont1_key[0], cont1_key[1], cont1_key[2], cont1_key[3]};
	wire [15:0] JOYA0;
	wire [15:0] JOYA1;
	wire   [7:0] kbd_mouse_data;
	wire         kbd_mouse_level;
	wire   [1:0] kbd_mouse_type;
	wire  [2:0] mouse_buttons;
	wire [63:0] RTC;

	wire        io_strobe;
	wire        io_wait;
	wire        io_fpga;
	wire 			io_osd;
	wire        io_uio;
	wire [15:0] io_din, io_dout;
	wire [15:0] fpga_dout;
	wire        cpu_nrst_out;
	wire [31:0] cpu_nmi_addr;
	
	wire 			clk_114;
	
	wire [28:1] ram_addr;
	wire [15:0] ram_dout1;
wire        ram_ready1;
wire        ram_sel;
wire        ram_lds;
wire        ram_uds;
wire [15:0] ram_din;
wire [15:0] ram_dout  = ram_dout1;//zram_sel ? ram_dout2  : ram_dout1;
wire        ram_ready = ram_ready1; //zram_sel ? ram_ready2 : ram_ready1;
wire 			sel_zram;
wire        ramshared;
	
pll pll
(
	.refclk(clk_74a),
	.outclk_0(clk_114),
	.outclk_1(clk_sys),
	.outclk_2(video_rgb_clock),
	.outclk_3(video_rgb_clock_90),
//	.outclk_4(clk_mpu),
	.locked(pll_core_locked)
);

assign clk_mpu = clk_74a;

amiga_clk amiga_clk
(
	.clk_28   ( clk_sys    ), // input  clock c1 ( 28.687500MHz)
	.clk7_en  ( clk7_en    ), // output clock 7 enable (on 28MHz clock domain)
	.clk7n_en ( clk7n_en   ), // 7MHz negedge output clock enable (on 28MHz clock domain)
	.c1       ( c1         ), // clk28m clock domain signal synchronous with clk signal
	.c3       ( c3         ), // clk28m clock domain signal synchronous with clk signal delayed by 90 degrees
	.cck      ( cck        ), // colour clock output (3.54 MHz)
	.eclk     ( eclk       ), // 0.709379 MHz clock enable output (clk domain pulse)
	.reset_n  ( pll_core_locked    )
);

	reg [7:0] reset_s;
	reg rs;

    wire    [7:0]   mouse_buttons_s;
//    wire    [7:0]   cont3_joy_s;
//	 wire    [7:0]   mouse_buttons;
synch_3 #(.WIDTH(8)) s25(mouse_buttons, mouse_buttons_s, clk_sys);




always @(posedge clk_sys) begin

	if(~pll_core_locked) begin
		reset_s <= 'd1;
	end
	else begin
		reset_s <= reset_s << 1;
		rs <= reset_s[7];
		reset_d <= rs;
	end
end



sdram_ctrl ram1
(
	.sysclk       (clk_114         ),
	.reset_n      (~reset_d        ),
	.c_7m         (c1              ),
	.cache_inhibit	(1'b0),
	.cache_rst    (cpu_rst         ),
	.cpu_cache_ctrl(cpu_cacr       ),

	.sd_data      (dram_dq         ),
	.sd_addr      (dram_a          ),
	.sd_dqm       (dram_dqm),
	.sd_ba        (dram_ba         ),
	.sd_we        (dram_we_n       ),
	.sd_ras       (dram_ras_n      ),
	.sd_cas       (dram_cas_n      ),
	.sd_cke       (dram_cke        ),
	.sd_clk       (dram_clk        ),

	.cpuWR        (ram_din         ),
	.cpuAddr      ({sel_zram, ram_addr[24:1]}),
	.cpuU         (ram_uds         ),
	.cpuL         (ram_lds         ),
	.cpustate     (cpu_state       ),
	.cpuCS        (ram_cs			 ),
	.cpuRD        (ram_dout1       ),
	.ramready     (ram_ready1      ),

	.chipWR       (ram_data        ),
	.chipAddr     (ram_address     ),
	.chipU        (_ram_bhe        ),
	.chipL        (_ram_ble        ),
	.chipRW       (_ram_we         ),
	.chipDMA      (_ram_oe         ),
	.chipRD       (ramdata_in      ),
	.chip48       (chip48          )
);


fastchip fastchip
(
	.clk          (clk_114           ),
	.cyc          (cyc               ),
	.clk_sys      (clk_sys           ),

	.reset        (~cpu_rst | ~cpu_nrst_out ),
	.sel          (fastchip_sel      ),
	.sel_ack      (fastchip_selack   ),
	.ready        (fastchip_ready    ),

	.addr         ({chip_addr,1'b0}  ),
	.din          (chip_din          ),
	.dout         (fastchip_dout     ),
	.lds          (~fastchip_lds     ),
	.uds          (~fastchip_uds     ),
	.rnw          (fastchip_rnw      ),
	.longword     (fastchip_lw       ),

	//RTG framebuffer control
//	.rtg_ena      (FB_EN             ),
//	.rtg_hsize    (FB_WIDTH          ),
//	.rtg_vsize    (FB_HEIGHT         ),
//	.rtg_format   (FB_FORMAT         ),
//	.rtg_base     (FB_BASE           ),
//	.rtg_stride   (FB_STRIDE         ),
//	.rtg_pal_clk  (FB_PAL_CLK        ),
//	.rtg_pal_dw   (FB_PAL_DOUT       ),
//	.rtg_pal_dr   (FB_PAL_DIN        ),
//	.rtg_pal_a    (FB_PAL_ADDR       ),
//	.rtg_pal_wr   (FB_PAL_WR         ),

	.ide_ena      (ide_ena & ide_fast),
	.ide_irq      (ide_f_irq         ),
	.ide_req      (ide_f_req         ),
	.ide_address  (ide_addr          ),
	.ide_write    (ide_wr            ),
	.ide_writedata(ide_dout          ),
	.ide_read     (ide_rd            ),
	.ide_readdata (ide_f_readdata    ),
	.ide_led      (ide_f_led         )
);

wire reset_mpu_l;
wire [31:0] CORE_OUTPUT;
wire [31:0] CORE_INPUT = {32'h0};
wire light_enable = CORE_OUTPUT[0];

substitute_mcu_apf_mister substitute_mcu_apf_mister(
		// Controls for the MPU
		.clk_mpu								( clk_mpu ), 							// Clock of the MPU itself
		.clk_sys								( clk_sys ),
		.clk_74a								( clk_74a ),							// Clock of the APF Bus
		.reset_n								( reset_n ),							// Reset from the APF System
		.reset_out							( reset_mpu_l ),						// Able to restart the core from the MPU if required
		
		// APF Bus controll
		.bridge_addr            		( bridge_addr ),
		.bridge_rd              		( bridge_rd ),
		.mpu_reg_bridge_rd_data       ( mpu_reg_bridge_rd_data ),		// Used for interactions
		.mpu_ram_bridge_rd_data       ( mpu_ram_bridge_rd_data ),		// Used for ram up/download
		.bridge_wr              		( bridge_wr ),
		.bridge_wr_data         		( bridge_wr_data ),
	  
	   // Debugging to the Cart	
		.rxd									( RXDATA ),
		.txd									( TXDATA ),
		
		// APF Controller access if required
		
		.cont1_key          				( cont1_key ),
		.cont2_key          				( cont2_key ),
		.cont3_key          				( cont3_key ),
		.cont4_key          				( cont4_key ),
		.cont1_joy          				( cont1_joy ),
		.cont2_joy          				( cont2_joy ),
		.cont3_joy          				( cont3_joy ),
		.cont4_joy          				( cont4_joy ),
		.cont1_trig         				( cont1_trig ),
		.cont2_trig         				( cont2_trig ),
		.cont3_trig         				( cont3_trig ),
		.cont4_trig         				( cont4_trig ),
		
		// MPU Controlls to the APF
		
		.dataslot_update            	( dataslot_update ),
		.dataslot_update_id         	( dataslot_update_id ),
		.dataslot_update_size       	( dataslot_update_size ),
		.dataslot_update_size_lba48   ( dataslot_update_size_lba48 ),
		.target_dataslot_enableLBA48	(target_dataslot_enableLBA48),
	  
		.target_dataslot_read       	( target_dataslot_read ),
		.target_dataslot_write      	( target_dataslot_write ),

		.target_dataslot_ack        	( target_dataslot_ack ),
		.target_dataslot_done       	( target_dataslot_done ),
		.target_dataslot_err        	( target_dataslot_err ),

		.target_dataslot_id         	( target_dataslot_id ),
		.target_dataslot_slotoffset 	( target_dataslot_slotoffset ),
      .target_dataslot_slotoffsetLBA48 ( target_dataslot_slotoffsetLBA48 ),
		.target_dataslot_bridgeaddr 	( target_dataslot_bridgeaddr ),
		.target_dataslot_length     	( target_dataslot_length ),

		.datatable_addr         		( datatable_addr ),
		.datatable_wren         		( datatable_wren ),
		.datatable_rden         		( datatable_rden ),
		.datatable_data         		( datatable_data ),
		.datatable_q            		( datatable_q ),
		.CORE_OUTPUT						( CORE_OUTPUT ),
		.CORE_INPUT							( CORE_INPUT ),
		
		// Core interactions
		.IO_UIO       						( io_uio ),
		.IO_FPGA      						( io_fpga ),
		.IO_OSD								( io_osd ),
		.IO_STROBE    						( io_strobe ),
		.IO_WAIT      						( io_wait ),
		.IO_DIN       						( io_dout ),
		.IO_DOUT      						( io_din ),
		.IO_WIDE								( 1'b1 )
	 
	 );

wire        vs;
wire        hs;
wire  [1:0] ar;
wire [7:0] red, green, blue, r,g,b;
wire lace, field1;
wire hblank_i, vblank_i, vbl, fx;
wire  [1:0] res;

wire  [1:0] 	cpu_state;
wire  [3:0] 	cpu_cacr;
wire  [14:0] 	ldata, rdata;
wire 				ce_pix;

wire 	pwr_led;

wire [9:0]  ldata_okk;     // left DAC data  (PWM vol version)
wire [9:0]  rdata_okk;     // right DAC data (PWM vol version)
wire ide_c_led;
minimig minimig
(
	.reset_n		  				(reset_n),
	.clk_74a		  				(clk_74a			  ),
	.reset_mpu_l				(reset_mpu_l),
	//m68k pins
	.cpu_address  				(chip_addr        ), // M68K address bus
	.cpu_data     				(chip_dout        ), // M68K data bus
	.cpudata_in   				(chip_din         ), // M68K data in
	._cpu_ipl     				(chip_ipl         ), // M68K interrupt request
	._cpu_as      				(chip_as          ), // M68K address strobe
	._cpu_uds     				(chip_uds         ), // M68K upper data strobe
	._cpu_lds     				(chip_lds         ), // M68K lower data strobe
	.cpu_r_w      				(chip_rw          ), // M68K read / write
	._cpu_dtack   				(chip_dtack       ), // M68K data acknowledge
	._cpu_reset   				(cpu_rst          ), // M68K reset
	._cpu_reset_in				(cpu_nrst_out     ), // M68K reset out
	.nmi_addr     				(cpu_nmi_addr    ), // M68K NMI address

	//sram pins
	.ram_data     				(ram_data         ), // SRAM data bus
	.ramdata_in   				(ramdata_in       ), // SRAM data bus in
	.ram_address  				(ram_address      ), // SRAM address bus
	._ram_bhe     				(_ram_bhe         ), // SRAM upper byte select
	._ram_ble     				(_ram_ble         ), // SRAM lower byte select
	._ram_we      				(_ram_we          ), // SRAM write enable
	._ram_oe      				(_ram_oe          ), // SRAM output enable
	.chip48       				(chip48           ), // big chipram read

	//system  pins
	.rst_ext      				(reset_d          ), // reset from ctrl block
	.rst_out      				(                 ), // minimig reset status
	.clk          				(clk_sys          ), // output clock c1 ( 28.687500MHz)
	.clk7_en      				(clk7_en          ), // 7MHz clock enable
	.clk7n_en     				(clk7n_en         ), // 7MHz negedge clock enable
	.c1           				(c1               ), // clk28m clock domain signal synchronous with clk signal
	.c3           				(c3               ), // clk28m clock domain signal synchronous with clk signal delayed by 90 degrees
	.cck          				(cck              ), // colour clock output (3.54 MHz)
	.eclk         				(eclk             ), // 0.709379 MHz clock enable output (clk domain pulse)

	//I/O
	._joy1        				(~JOY0            ), // joystick 1 [fire4,fire3,fire2,fire,up,down,left,right] (default mouse port)
	._joy2        				(~JOY1            ), // joystick 2 [fire4,fire3,fire2,fire,up,down,left,right] (default joystick port)
	._joy3        				(~JOY2            ), // joystick 1 [fire4,fire3,fire2,fire,up,down,left,right]
	._joy4        				(~JOY3            ), // joystick 2 [fire4,fire3,fire2,fire,up,down,left,right]
	.joya1        				(cont1_joy_s[15:0]  ),
	.joya2        				(cont2_joy_s[15:0]  ),
	.mouse_btn    				(mouse_buttons ), // mouse buttons
	.kbd_mouse_data 			(kbd_mouse_data ), // mouse direction data, keycodes
	.kbd_mouse_type 			(kbd_mouse_type ), // type of data
	.kms_level    				(kbd_mouse_level  ),
	.pwr_led      				(pwr_led          ), // power led
	.fdd_led      				(LED         ),
	.hdd_led      				(ide_c_led        ),
	.rtc          				(RTC              ),

	//host controller interface (SPI)
	.IO_UIO       				(io_uio           ),
	.IO_FPGA      				(io_fpga          ),
	.IO_STROBE    				(io_strobe        ),
	.IO_WAIT      				(io_wait          ),
	.IO_DIN       				(io_din           ),
	.IO_DOUT      				(fpga_dout        ),
	.bridge_addr            ( bridge_addr ),
	.bridge_rd              ( bridge_rd ),
	.bridge_rd_data         ( fpga_bridge_rd_data ),
	.bridge_wr              ( bridge_wr ),
	.bridge_wr_data         ( bridge_wr_data ),
	//video
	._hsync       				(hs               ), // horizontal sync
	._vsync       				(vs               ), // vertical sync
	.field1       				(field1           ),
	.lace         				(lace             ),
	.red          				(r                ), // red
	.green        				(g                ), // green
	.blue         				(b                ), // blue
	.hblank       				(hblank_i           ),
	.vblank       				(vblank_i            ),
	.ar           				(ar               ),
	.scanline     				(fx               ),
	.ce_pix     				(ce_pix           ),
	.res          				(res              ),

	//audio
	.ldata        				(ldata            ), // left DAC data
	.rdata        				(rdata            ), // right DAC data
	.ldata_okk    				(ldata_okk        ), // 9bit
	.rdata_okk    				(rdata_okk        ), // 9bit
//
//	.aud_mix      				(AUDIO_MIX        ),

	//user i/o
	.cpucfg       				(cpucfg           ), // CPU config
	.cachecfg     				(cachecfg         ), // Cache config
	.memcfg       				(memcfg           ), // memory config
	.bootrom      				(bootrom          ), // bootrom mode. Needed here to tell tg68k to also mirror the 256k Kickstart 
	
	.rxd							(port_tran_si),         // rs232 receive
	.txd							(port_tran_so),         // rs232 send
	.cts							(),         // rs232 clear to send
	.rts							(),         // rs232 request to send
	.dtr							(),         // rs232 Data Terminal Ready
	.dsr							(),         // rs232 Data Set Ready

	.ide_fast     				(ide_fast         ),
	.ide_ext_irq  				(ide_f_irq        ),
	.ide_ena      				(ide_ena          ),
	.ide_req      				(ide_c_req        ),
	.ide_address  				(ide_addr         ),
	.ide_write    				(ide_wr           ),
	.ide_writedata				(ide_dout         ),
	.ide_read     				(ide_rd           ),
	.ide_readdata 				(ide_c_readdata   )
);




hps_ext hps_ext(
.clk_sys				(clk_sys),
.io_uio       		(io_uio),
.io_fpga      		(io_fpga),
.io_strobe    		(io_strobe),
.io_din       		(io_din),
.fpga_dout     	(fpga_dout),
.io_dout      		(io_dout),

.kbd_mouse_level	(kbd_mouse_level),
.kbd_mouse_type	(kbd_mouse_type),
.kbd_mouse_data	(kbd_mouse_data),
.mouse_buttons    (mouse_buttons ), // mouse buttons
.ide_dout			(ide_dout),
.ide_addr			(ide_addr),
.ide_rd				(ide_rd),
.ide_wr				(ide_wr),
.ide_req				(ide_fast ? ide_f_req : ide_c_req),  
.ide_din				(ide_fast ? ide_f_readdata : ide_c_readdata)
);

wire cpu_type = cpucfg[1];
reg  cpu_ph1;
reg  cpu_ph2;
reg  cyc;
reg ram_cs;

always @(posedge clk_114) begin
	reg [3:0] div;
	reg       c1d;

	div <= div + 1'd1;
	 
	c1d <= c1;
	if (~c1d & c1) div <= 3;
	
	if (~cpu_rst) begin
		cyc <= 0;
		cpu_ph1 <= 0;
		cpu_ph2 <= 0;
	end
	else begin
		cyc <= !div[1:0];
		if (div[1] & ~div[0]) begin
			cpu_ph1 <= 0;
			cpu_ph2 <= 0;
			case (div[3:2])
				0: cpu_ph2 <= 1;
				2: cpu_ph1 <= 1;
			endcase
		end
	end

	ram_cs <= ~(ram_ready & cyc & cpu_type) & ram_sel;
end

cpu_wrapper cpu_wrapper
(
	.reset        (cpu_rst         ),
	.reset_out    (cpu_nrst_out    ),

	.clk          (clk_sys         ),
	.ph1          (cpu_ph1         ),
	.ph2          (cpu_ph2         ),

	.chip_addr    (chip_addr       ),
	.chip_dout    (chip_dout       ),
	.chip_din     (chip_din        ),
	.chip_as      (chip_as         ),
	.chip_uds     (chip_uds        ),
	.chip_lds     (chip_lds        ),
	.chip_rw      (chip_rw         ),
	.chip_dtack   (chip_dtack      ),
	.chip_ipl     (chip_ipl        ),

	.fastchip_dout   (fastchip_dout   ),
	.fastchip_sel    (fastchip_sel    ),
	.fastchip_lds    (fastchip_lds    ),
	.fastchip_uds    (fastchip_uds    ),
	.fastchip_rnw    (fastchip_rnw    ),
	.fastchip_selack (fastchip_selack ),
	.fastchip_ready  (fastchip_ready  ),
	.fastchip_lw     (fastchip_lw     ),

	.cpucfg       (cpucfg          ),
	.cachecfg     (cachecfg        ),
	.fastramcfg   (memcfg[6:4]     ),
	.bootrom      (bootrom         ),

	.ramsel       (ram_sel         ),
	.ramaddr      (ram_addr        ),
	.ramlds       (ram_lds         ),
	.ramuds       (ram_uds         ),
	.ramdout      (ram_dout        ),
	.ramdin       (ram_din         ),
	.ramready     (ram_ready       ),
	.ramshared    (ramshared       ),
	.sel_zram	  (sel_zram			 ),

	//custom CPU signals
	.cpustate     (cpu_state       ),
	.cacr         (cpu_cacr        ),
	.nmi_addr     (cpu_nmi_addr    )
);



	wire [23:0] 	video_rgb_reg;
	wire 				video_hs_i_reg;
	wire 				video_vs_i_reg;
	wire 				video_de_reg;
	wire 				hs_buf = hs;
	wire 				vs_buf = vs;
	wire 				hblank_i_buf = hblank_i;
	wire 				vblank_i_buf = vblank_i;
	wire [7:0]		r_buf = r; 
	wire [7:0]		g_buf = g;
	wire [7:0]		b_buf = b;	

Analogue_video_encoder Analogue_video_encoder(
	.clk_74a							( clk_74a					),
	.bridge_wr						( bridge_wr					),
	.bridge_rd						( bridge_rd					),
	.bridge_addr					( bridge_addr				),
	.bridge_wr_data				( bridge_wr_data			),
	.vga_bridge_rd_data			( vga_bridge_rd_data		),
	.video_rgb_clock				( video_rgb_clock			),
	.hs								( hs_buf						),
	.vs								( vs_buf						),
	.hblank_i						( hblank_i_buf				),
	.vblank_i						( vblank_i_buf				),
	.field1							( field1						),
	.lace								( lace						), 
	.res								( res							),
	.r									( r_buf						), 
	.g									( g_buf						), 
	.b									( b_buf						),	
	.clk7n_en						( clk7n_en					),
	.clk7_en							( clk7_en					),
	.ce_pix							( ce_pix						),	
	.LED								( LED							),
	.light_enable					( light_enable				),
	.ide_c_led						( ide_c_led					), 
	.ide_f_led						( ide_f_led					),
	.video_rgb_reg					( video_rgb_reg			),
	.video_hs_i_reg				( video_hs_i_reg			),
	.video_vs_i_reg				( video_vs_i_reg			),
	.video_de_reg					( video_de_reg			),
	.video_skip						( video_skip				)
);

osd osd
(
	.clk_sys		(clk_sys),

	.io_osd		(io_osd),
	.io_strobe	(io_strobe),
	.io_din		(io_din),
	.clk_video	(video_rgb_clock),
	.din			(video_rgb_reg),
	.hs_in		(video_hs_i_reg),
	.vs_in		(video_vs_i_reg),
	.de_in		(video_de_reg),
	.ce_pix_wire(ce_pix),

	.dout			(video_rgb),
	.hs_out		(video_hs),
	.vs_out		(video_vs),
	.de_out		(video_de)
);

wire flt_en    = CORE_OUTPUT[1] && pwr_led;
wire aud_1200  = CORE_OUTPUT[2];
wire paula_pwm = CORE_OUTPUT[3];

wire [15:0] paula_smp_l = (paula_pwm ? {ldata_okk[8:0], 7'b0} : {ldata[14:0], 1'b0});
wire [15:0] paula_smp_r = (paula_pwm ? {rdata_okk[8:0], 7'b0} : {rdata[14:0], 1'b0});

// LPF 4400Hz, 1st order, 6db/oct
wire [15:0] lpf4400_l, lpf4400_r;
IIR_filter #(0) lpf4400
(
	.clk(clk_sys),
	.reset(~cpu_rst | ~cpu_nrst_out ),

	.ce(clk7_en | clk7n_en),
	.sample_ce(1),

	.cx (40'd4304835800),
	.cx0(1),
	.cy0(-2088941),
	
	.input_l(paula_smp_l),
	.input_r(paula_smp_r),
	.output_l(lpf4400_l),
	.output_r(lpf4400_r)
);

wire [15:0] audm_l = aud_1200 ? paula_smp_l : lpf4400_l;
wire [15:0] audm_r = aud_1200 ? paula_smp_r : lpf4400_r;

// LPF 3000Hz 1st + 3400Hz 1st
wire [15:0] lpf3275_l, lpf3275_r;
IIR_filter #(0) lpf3275
(
	.clk(clk_sys),
	.reset(~cpu_rst | ~cpu_nrst_out ),

	.ce(clk7_en | clk7n_en),
	.sample_ce(1),

	.cx (40'd8536629),
	.cx0(2),
	.cx1(1),
	.cy0(-4182432),
	.cy1(2085297),

	.input_l(audm_l),
	.input_r(audm_r),
	.output_l(lpf3275_l),
	.output_r(lpf3275_r)
);

reg [15:0] aud_l, aud_r;
always @(posedge clk_sys) begin
	reg [15:0] old_l0, old_l1, old_r0, old_r1;

	old_l0 <= flt_en ? lpf3275_l : audm_l;
	old_l1 <= old_l0;
	if(old_l0 == old_l1) aud_l <= old_l1;

	old_r0 <= flt_en ? lpf3275_r : audm_r;
	old_r1 <= old_r0;
	if(old_r0 == old_r1) aud_r <= old_r1;
end

reg [15:0] out_l, out_r;
always @(posedge clk_sys) begin
	reg [16:0] tmp_l, tmp_r;

	tmp_l <= {aud_l[15],aud_l};
	tmp_r <= {aud_r[15],aud_r};

	// clamp the output
	out_l <= (^tmp_l[16:15]) ? {tmp_l[16], {15{tmp_l[15]}}} : tmp_l[15:0];
	out_r <= (^tmp_r[16:15]) ? {tmp_r[16], {15{tmp_r[15]}}} : tmp_r[15:0];
end

wire [15:0] out_l_wire;
wire [15:0] out_r_wire;

audio_final_filter audio_final_filter (
	.audio_clk		(clk_sys),
	.reset_l			(cpu_rst),
	.audio_signed	(1),
	.left_input		(out_l),
	.right_input	(out_r),
	.mixing			(CORE_OUTPUT[7:6]),
	.left_output	(out_l_wire),
	.right_output	(out_r_wire)
);

i2s i2s (
.clk_74a			(clk_74a),
.left_audio		(out_l_wire),
.right_audio	(out_r_wire),

.audio_mclk		(audio_mclk),
.audio_dac		(audio_dac),
.audio_lrck		(audio_lrck)

);
    
endmodule
