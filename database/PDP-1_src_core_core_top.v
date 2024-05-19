// This program was cloned from: https://github.com/spacemen3/PDP-1
// License: MIT License

/*The PDP-1 Core running Spacewar! on the Analogue Pocket via openFPGA
Uses the original tape program file of Spacewar! v3.1 1962
Supports Sleep/Wake and Memories (beta)
All colors are assigned via an updatable LUT
Main sense switches are set via an updatable config file */

`default_nettype none

module core_top (

//
// physical connections
//

///////////////////////////////////////////////////
// clock inputs 74.25mhz. not phase aligned, so treat these domains as asynchronous

input 	wire 				clk_74a, // mainclk1
input 	wire 				clk_74b, // mainclk1 

///////////////////////////////////////////////////
// cartridge interface
// switches between 3.3v and 5v mechanically
// output enable for multibit translators controlled by pic32
input wire					reset_internal_n,
// GBA AD[15:8]
inout		wire	[7:0]		cart_tran_bank2,
output	wire				cart_tran_bank2_dir,

// GBA AD[7:0]
inout		wire	[7:0]		cart_tran_bank3,
output	wire				cart_tran_bank3_dir,

// GBA A[23:16]
inout		wire	[7:0]		cart_tran_bank1,
output	wire				cart_tran_bank1_dir,

// GBA [7] PHI#
// GBA [6] WR#
// GBA [5] RD#
// GBA [4] CS1#/CS#
//     [3:0] unwired
inout		wire	[7:4]		cart_tran_bank0,
output	wire				cart_tran_bank0_dir,

// GBA CS2#/RES#
inout		wire				cart_tran_pin30,
output	wire				cart_tran_pin30_dir,
// when GBC cart is inserted, this signal when low or weak will pull GBC /RES low with a special circuit
// the goal is that when unconfigured, the FPGA weak pullups won't interfere.
// thus, if GBC cart is inserted, FPGA must drive this high in order to let the level translators
// and general IO drive this pin.
output	wire				cart_pin30_pwroff_reset,

// GBA IRQ/DRQ
inout		wire				cart_tran_pin31,
output	wire				cart_tran_pin31_dir,

// infrared
input		wire				port_ir_rx,
output	wire				port_ir_tx,
output	wire				port_ir_rx_disable, 

// GBA link port
inout		wire				port_tran_si,
output	wire				port_tran_si_dir,
inout		wire				port_tran_so,
output	wire				port_tran_so_dir,
inout		wire				port_tran_sck,
output	wire				port_tran_sck_dir,
inout		wire				port_tran_sd,
output	wire				port_tran_sd_dir,
 
///////////////////////////////////////////////////
// cellular psram 0 and 1, two chips (64mbit x2 dual die per chip)

output	wire	[21:16]	cram0_a,
inout		wire	[15:0]	cram0_dq,
input		wire				cram0_wait,
output	wire				cram0_clk,
output	wire				cram0_adv_n,
output	wire				cram0_cre,
output	wire				cram0_ce0_n,
output	wire				cram0_ce1_n,
output	wire				cram0_oe_n,
output	wire				cram0_we_n,
output	wire				cram0_ub_n,
output	wire				cram0_lb_n,

output	wire	[21:16]	cram1_a,
inout		wire	[15:0]	cram1_dq,
input		wire				cram1_wait,
output	wire				cram1_clk,
output	wire				cram1_adv_n,
output	wire				cram1_cre,
output	wire				cram1_ce0_n,
output	wire				cram1_ce1_n,
output	wire				cram1_oe_n,
output	wire				cram1_we_n,
output	wire				cram1_ub_n,
output	wire				cram1_lb_n,

///////////////////////////////////////////////////
// sdram, 512mbit 16bit

output	wire	[12:0]	dram_a,
output	wire	[1:0]		dram_ba,
inout		wire	[15:0]	dram_dq,
output	wire	[1:0]		dram_dqm,
output	wire				dram_clk,
output	wire				dram_cke,
output	wire				dram_ras_n,
output	wire				dram_cas_n,
output	wire				dram_we_n,

///////////////////////////////////////////////////
// sram, 1mbit 16bit

output	wire	[16:0]	sram_a,
inout		wire	[15:0]	sram_dq,
output	wire				sram_oe_n,
output	wire				sram_we_n,
output	wire				sram_ub_n,
output	wire				sram_lb_n,

///////////////////////////////////////////////////
// vblank driven by dock for sync in a certain mode

input	wire					vblank,

///////////////////////////////////////////////////
// i/o to 6515D breakout usb uart

output	wire				dbg_tx,
input	wire					dbg_rx,

///////////////////////////////////////////////////
// i/o pads near jtag connector user can solder to

output	wire				user1,
input	wire					user2,

///////////////////////////////////////////////////
// RFU internal i2c bus 

inout	wire					aux_sda,
output	wire				aux_scl,

///////////////////////////////////////////////////
// RFU, do not use
output	wire				vpll_feed,


//
// logical connections
//

///////////////////////////////////////////////////
// video, audio output to scaler
output	reg	[23:0]	video_rgb,
output	wire				video_rgb_clock,
output	wire				video_rgb_clock_90,
output	reg				video_de,
output	reg				video_skip,
output	reg				video_vs,
output	reg				video_hs,
	
output	wire				audio_mclk,
input	wire					audio_adc,
output	wire				audio_dac,
output	wire				audio_lrck,

///////////////////////////////////////////////////
// bridge bus connection
// synchronous to clk_74a
output	wire				bridge_endian_little,
input		wire	[31:0]	bridge_addr,
input		wire				bridge_rd,
output	reg	[31:0]	bridge_rd_data,
input		wire				bridge_wr,
input		wire	[31:0]	bridge_wr_data,

///////////////////////////////////////////////////
// controller data
// 
// key bitmap:
//   [0]	dpad_up
//   [1]	dpad_down
//   [2]	dpad_left
//   [3]	dpad_right
//   [4]	face_a
//   [5]	face_b
//   [6]	face_x
//   [7]	face_y
//   [8]	trig_l1
//   [9]	trig_r1
//   [10]	trig_l2
//   [11]	trig_r2
//   [12]	trig_l3
//   [13]	trig_r3
//   [14]	face_select
//   [15]	face_start
// joy values - unsigned
//   [ 7: 0] lstick_x
//   [15: 8] lstick_y
//   [23:16] rstick_x
//   [31:24] rstick_y
// trigger values - unsigned
//   [ 7: 0] ltrig
//   [15: 8] rtrig
//
input	wire	[15:0]		cont1_key,
input	wire	[15:0]		cont2_key,
input	wire	[15:0]		cont3_key,
input	wire	[15:0]		cont4_key,
input	wire	[31:0]		cont1_joy,
input	wire	[31:0]		cont2_joy,
input	wire	[31:0]		cont3_joy,
input	wire	[31:0]		cont4_joy,
input	wire	[15:0]		cont1_trig,
input	wire	[15:0]		cont2_trig,
input	wire	[15:0]		cont3_trig,
input	wire	[15:0]		cont4_trig,
input	wire	[15:0]		cont1_legacy
	
);

parameter stave_state_seed 	= 32'h00500002; // this is the size of the save state for the Pic32 to know the size
parameter stave_state_crc		= 32'h12345678; // CRC for the save state - Not used at this moment


reg [10:0] x_count_fast;
reg [10:0] y_count_fast;

wire [15:0]	cont2_key_internal;

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
assign cart_tran_pin30 = 1'b0;		// reset or cs2, we let the hw control it by itself
assign cart_tran_pin30_dir = 1'bz;
assign cart_pin30_pwroff_reset = 1'b0;	// hardware can control this
assign cart_tran_pin31 = 1'bz;		// input
assign cart_tran_pin31_dir = 1'b0;	// input

assign port_tran_sd = 1'bz;
assign port_tran_sd_dir = 1'b0;		// SD is input and not used


	wire 				locked_1, locked_2;
//
// host/target command handler
//
	wire				reset_n;				// driven by host commands, can be used as core-wide reset
	wire	[31:0]	cmd_bridge_rd_data;
	wire	[31:0]	example_device_data;
	
	// for bridge write data, we just broadcast it to all bus devices
// for bridge read data, we have to mux it
// add your own devices here

wire [17:0]	pdp_ram_read;

reg [31:0] bridge_rd_data_buf;
reg [31:0]	bridge_addr_buf;


always @(posedge clk_74a) begin

	if (bridge_rd) bridge_addr_buf <= bridge_addr;
end

reg [17:0]	MEM_BUFF_IN;
reg [11:0]  MEM_ADDR_IN;
reg [17:0]  IR_IN;  
wire [17:0]  IR_OUT;  
reg [7:0]   IOSTA_IN;
wire [7:0] IOSTA_OUT;

reg [31:0]  	fuctions_bridge_rd_data;



reg [17:0]  	AC_OUT_REG;
reg [17:0]  	IO_OUT_REG;
reg [11:0]		PC_OUT_REG;
reg [17:0]  	data_out_REG;
reg [11:0]  	AB_OUT_REG;
reg [17:0]  	IR_OUT_REG;
reg [ 7:0]  	IOSTA_OUT_REG;

always @* begin

	casex(bridge_addr_buf)


	32'h2FFFFFF8: begin
		bridge_rd_data_buf <= stave_state_seed;
	end
	32'h2FFFFFFC: begin
		bridge_rd_data_buf <= stave_state_crc;
	end
	32'h30000xxx,
	32'h30001xxx,
	32'h30002xxx,
	32'h30003xxx: begin
		bridge_rd_data_buf <= pdp_ram_read;
	end
	32'h30004000: begin
		bridge_rd_data_buf <= {14'h0, AC_OUT_REG};
	end
	32'h30004004: begin
		bridge_rd_data_buf <= {14'h0, IO_OUT_REG};
	end
	32'h30004008: begin
		bridge_rd_data_buf <= {17'h0, PC_OUT_REG};
	end
	32'h3000400c: begin
		bridge_rd_data_buf <= { data_out_REG};
	end
	32'h30004010: begin
		bridge_rd_data_buf <= { AB_OUT_REG};
	end
	32'h30004014: begin
		bridge_rd_data_buf <= { IR_OUT_REG};
	end
	32'h30004018: begin
		bridge_rd_data_buf <= { IOSTA_OUT_REG};
	end
	default : begin
		// example
		bridge_rd_data_buf <= example_device_data;
	end
	endcase
end



always @(*) begin
	casex(bridge_addr)
	32'hF8xxxxxx: begin
		bridge_rd_data <= cmd_bridge_rd_data;
	end
	32'h4000xxxx: begin
		bridge_rd_data <= fuctions_bridge_rd_data;
	end

	default : begin
		bridge_rd_data <= bridge_rd_data_buf;
	end
	endcase
end
	
// bridge host commands
// synchronous to clk_74a
	wire			status_boot_done = locked_1 && locked_2;	
	wire			status_setup_done = locked_1 && locked_2; // rising edge triggers a target command
	wire			status_running = reset_n; // we are running as soon as reset_n goes high

	wire			dataslot_requestread;
	wire	[15:0]	dataslot_requestread_id;
	wire			dataslot_requestread_ack = 1'b1;
	wire			dataslot_requestread_ok = 1'b1;

	wire			dataslot_requestwrite;
	wire	[15:0]	dataslot_requestwrite_id;
	wire			dataslot_requestwrite_ack = 1'b1;
	wire			dataslot_requestwrite_ok = 1'b1;

	wire			dataslot_allcomplete;

	wire			savestate_supported;
	wire	[31:0]	savestate_addr;
	wire	[31:0]	savestate_size;
	wire	[31:0]	savestate_maxloadsize;

	wire			savestate_start;
	reg			savestate_start_ack;
	reg			savestate_start_busy;
	reg			savestate_start_ok;
	reg			savestate_start_err;

	wire			savestate_load;
	reg			savestate_load_ack;
	reg			savestate_load_busy;
	reg			savestate_load_ok;
	reg			savestate_load_err;

// bridge target commands
// synchronous to clk_74a

reg 				mag_ships = 1'b0;		// scaled up ships
reg [2:0] 		trail_len = 3'h0;		// trails long
reg 				blur_on = 1'b0;		// blur off
reg [5:0]   	sense_switches = 6'h00;

always @(posedge clk_74a or negedge reset_internal_n) begin
	if (~reset_internal_n) begin
		mag_ships 		<= 1'b1;		// scaled up ships
		trail_len 		<= 3'h0;		// trails long
		blur_on 			<= 1'b0;		// blur off
		sense_switches <= 6'h00;
	end
	else if (bridge_wr && bridge_addr[31:16] == 16'h4000) begin
		case (bridge_addr[7:0])
			8'h00	: mag_ships 		<= bridge_wr_data[0];
			8'h04	: trail_len 		<= bridge_wr_data[2:0];
			8'h08	: blur_on 			<= bridge_wr_data[0];
			8'h0C	: sense_switches 	<= bridge_wr_data[5:0];
		endcase
	end
end

always @(posedge clk_74a) begin
	if (bridge_rd) begin
		case (bridge_addr[15:0])
			16'h00	: fuctions_bridge_rd_data <= mag_ships;
			16'h04	: fuctions_bridge_rd_data <= trail_len;
			16'h08	: fuctions_bridge_rd_data <= blur_on;
			16'h0C	: fuctions_bridge_rd_data <= sense_switches;
		endcase
	end
end

// bridge data slot access

	wire	[9:0]	datatable_addr;
	wire			datatable_wren;
	wire	[31:0]	datatable_data;
	wire	[31:0]	datatable_q;
	reg				frame_odd = 0;

core_bridge_cmd icb (

	.clk								( clk_74a ),
	.reset_n							( reset_n ),

	.bridge_addr					( bridge_addr ),
	.bridge_wr						( bridge_wr ),
	.bridge_wr_data				( bridge_wr_data ),
	.bridge_rd						( bridge_rd ),
	.bridge_rd_data				( cmd_bridge_rd_data ),
	
	.status_boot_done				( status_boot_done ),
	.status_setup_done			( status_setup_done ),
	.status_running				( status_running ),

	.dataslot_requestread		( dataslot_requestread ),
	.dataslot_requestread_id	( dataslot_requestread_id ),
	.dataslot_requestread_ack	( dataslot_requestread_ack ),
	.dataslot_requestread_ok	( dataslot_requestread_ok ),

	.dataslot_requestwrite		( dataslot_requestwrite ),
	.dataslot_requestwrite_id	( dataslot_requestwrite_id ),
	.dataslot_requestwrite_ack	( dataslot_requestwrite_ack ),
	.dataslot_requestwrite_ok	( dataslot_requestwrite_ok ),

	.dataslot_allcomplete		( dataslot_allcomplete ),

	.savestate_supported			( 1'b1 ),						// we allow savestates
	.savestate_addr				( 32'h2FFFFFF8 ),				// we have the first 2 words results as the Magic seed and CRC then the state
	.savestate_size				( 32'h5000 ),					// We have 2 words for CRC,magic, then 4k words for ram, 4words for PC,AC and IO, one extra too
	.savestate_maxloadsize		( 32'h5000 ),

	.savestate_start				( savestate_start ),
	.savestate_start_ack			( savestate_start_ack ),
	.savestate_start_busy		( savestate_start_busy ),
	.savestate_start_ok			( savestate_start_ok ),
	.savestate_start_err			( savestate_start_err ),

	.savestate_load				( savestate_load ),
	.savestate_load_ack			( savestate_load_ack ),
	.savestate_load_busy			( savestate_load_busy ),
	.savestate_load_ok			( savestate_load_ok ),
	.savestate_load_err			( savestate_load_err ),

	.datatable_addr				( datatable_addr ),
	.datatable_wren				( datatable_wren ),
	.datatable_data				( datatable_data ),
	.datatable_q					( datatable_q ),

);


wire [10:0]  	console_switches;
wire 			 	internal_vga_clock;
wire 			 	outclk_1;
wire 			 	CLK_50M;
wire 				CLK_5M;
wire 			 	locked;

wire [15:0] 	pixel_out;
wire 				cpu_vga_run;

wire [7:0] 		bg_red_out, bg_green_out, bg_blue_out;

reg  [10:0]   	horizontal_counter, vertical_counter;
wire [7:0]   	r_crt, g_crt, b_crt;
wire [11:0]  	PC_OUT;
wire 				run_core;
wire [2:0]   	pixel_brightness_wire;
wire [2:0]   	pixel_brightness_cpu;
wire [17:0]  	data_out;
wire [11:0]  	AB_OUT;
wire [17:0]  	IO_OUT;
wire [17:0]  	DI_OUT;
wire [31:0]  	BUS_OUT;
wire [17:0]  	AC_OUT;


wire 				cpu_write;
wire [ 9:0]  	pixel_x_addr_wire;
wire [ 9:0]  	pixel_y_addr_wire;
wire [ 9:0]  	pixel_x_addr_cpu;
wire [ 9:0]  	pixel_y_addr_cpu;
wire [ 6:0]  	char_output_w;
wire [ 6:0]  	kbd_char_out;
wire [17:0]  	test_word;
wire [17:0]  	test_address;
wire         	char_strobe_w, halt_w, key_was_processed_w;              /* Strobe / ACK signalling of pressed keys */
wire        	kbd_read_strobe; 
wire  			console_switch_strobe;                  /* These signal when a key was pressed */
wire  [5:0] 	selected_ptr_x;                                          /* Cursor coordinates for toggling console test switches */
wire  [4:0] 	selected_ptr_y;                                    /* Addresses for writing to memory and start jump location after loading a program in RIM mode or RESET */
wire [11:0] 	start_address;
wire 				write_enable;
wire        	pixel_shift_wire;
wire        	pixel_shift_cpu;
wire [10:0] 	ps2_key;
wire  [1:0] 	current_output_device;
wire [7:0]  	joystick_emu;                                            /* Output from keyboard module to feed in as spacewar controls */
wire        	ram_write_enable;                                        /* When set, writes to main RAM memory */
wire [17:0] 	io_word, io_word_fast;                                   /* io_word used to provide spacewar gamepad controls */
	

   wire 	[11:0]  	tape_address;
   wire	[17:0]  	tape_data;
   wire				tape_write;
	wire				data_wait;
	wire				next_tape_char;
	wire 				rim_mode;


	// Video PLL
	pll pll_main (
		.refclk   			(clk_74a),   				// refclk.clk
		.rst      			(1'b0),      				// reset.reset
		.outclk_0 			(video_rgb_clock), 		// (42.2mhz) video clock
		.outclk_1 			(video_rgb_clock_90), 	// (42.2mhz) video clock 90 degrees offset
		.locked   			(locked_1)    			// locked.export
	);
	
	// CPU PLL
	PLL_Core PLL_Core (
		.refclk   			(clk_74a),   	// refclk.clk
		.rst      			(1'b0),      	// reset.reset
		.outclk_0 			(CLK_50M), 	// System Clock
		.locked   			(locked_2)    // locked.export
	);

// 	Controller Process

assign io_word_fast = { cont2_key[2] || cont2_key[7],
                   cont2_key[3] || cont2_key[7],
                   cont2_key[5], 
                   cont2_key[4],
						 {10{1'b0}},
					    cont1_key[2] || cont1_key[7],
                   cont1_key[3] || cont1_key[7],
                   cont1_key[5], 
                   cont1_key[4]		  
						 };

// Sync of the 72mhz to 50mhz for the controllers
						 
synch_3 #(.WIDTH (18)) synch_controler  (
   .i		(io_word_fast),   // input signal
   .o		(io_word),     	// synchronized output
   .clk	(CLK_50M)   		// clock to synchronize on
);



// Type 30 CRT

pdp1_vga_crt type30_crt(
	.clk								(video_rgb_clock), 	// video clock (42.4MHz)
	.CLK_50M							(CLK_50M),				// CPU clock (50MHz)
   .horizontal_counter			(x_count),
   .vertical_counter				(y_count),  
	.frame_odd						(frame_odd),
   .red_out							(r_crt),
   .green_out						(g_crt), 
   .blue_out						(b_crt),
	.cpu_stall						(cpu_stall),
	.cpu_vga_run					(cpu_vga_run),
			
	.variable_brightness			(1'b0),					 
   .pixel_available				(pixel_shift_cpu && frame_output),
   .pixel_x_i						(pixel_x_addr_cpu),
   .pixel_y_i						(pixel_y_addr_cpu),
   .pixel_brightness				(pixel_brightness_cpu),
	.pixel_type						(pixel_type),
			
	.mag_ships						(mag_ships),			// 1 = render ships in full resolution (no jaggies) 0 = scaled
	.trail_len						((trail_len)),			// trail lengths.  0 = longest, 7 = shortest
	.blur_on							(blur_on),				// 1 = turn blurring on, 0 = turn it off
			
	.clk_74a							(clk_74a),
	.bridge_addr					(bridge_addr),
	.bridge_wr						(bridge_wr),
	.bridge_wr_data				(bridge_wr_data)
	
);

// Tape Drive for the Pocket

tape_rim_drive tape_rim_drive(
	.clk								(clk_74a),
	.sys_clk							(CLK_50M),
	.reset_n							(reset_n),
	.reset_internal_n				(reset_internal_n),
	.bridge_addr					(bridge_addr),
	.bridge_wr						(bridge_wr),
	.bridge_wr_data				(bridge_wr_data),
	.next_tape_char				(next_tape_char),
	.tape_address					(tape_address),
	.tape_data						(tape_data),
	.tape_write						(tape_write),
	.data_wait						(data_wait),
	.rim_mode						(rim_mode),
	.run_core						(run_core),
	.start_address					(start_address));


// The main memory core and save/load states

parameter		idle								= 4'd0,	// I wait
					save_state_ack					= 4'd1,	// Lets ack the process
					save_state_wait				= 4'd2, 	// now we wait for the PC counter to be stalled
					save_state_process 			= 4'd3,	// Copy that ram baby!!!
					save_state_completed			= 4'd4,	// Im done!!!
					load_state_ack					= 4'd5,	// Lets ack the process
					load_state_process			= 4'd6,	// we reset the CPU and place the address of 11'h468 on the start address
					load_state_process_write	= 4'd7,	// we write the blob to ram
					load_state_recover			= 4'd8;	// then we make the process start upagain from the known PC address - Dont you want to recover from drinking too?

reg [3:0]	save_state_system;
reg [12:0]	blob_state_address, core_state_address;
reg			state_blob_ram_write, state_core_ram_write;

reg [17:0] 	AC_IN;                       /* Accumulator */
reg [17:0] 	IO_IN;                       /* Input Output register */
reg [11:0] 	PC_IN;                       /* Program counter */  
reg 			load_state;						/* Load regs from state */

wire 			cpu_stall_rise;
reg			load_reset_l; 		// this is a loadstate reset for the whole core.

wire 			frame_odd_sync;

synch_3 #(.WIDTH (1)) cpu_stall_sync  (
   .i		(cpu_stall),   // input signal
   .rise	(cpu_stall_rise),     	// synchronized output
   .clk	(clk_74a)   		// clock to synchronize on
);

synch_3 #(.WIDTH (1)) frame_change_sync  (
   .i		(frame_odd),   // input signal
   .rise	(frame_odd_sync),     	// synchronized output
   .clk	(clk_74a)   		// clock to synchronize on
);


reg [10:0]	cnt;
reg 			frame_odd_sync_passed;
reg 			loaded_a_state;


//reg [17:0]	MEM_BUFF_IN;
//reg [11:0]  MEM_ADDR_IN;
//reg [17:0]  IR_IN;  
//reg [8:0]   IOSTA_IN;
					
always @(posedge clk_74a or negedge reset_internal_n) begin
	if (~reset_internal_n) begin
		savestate_start_ack	<= 1'b0;
		savestate_start_busy	<= 1'b0;
		savestate_start_ok	<= 1'b0;
		savestate_start_err	<= 1'b0;
		savestate_load_ack	<= 1'b0;
		savestate_load_busy	<= 1'b0;
		savestate_load_ok		<= 1'b0;
		savestate_load_err	<= 1'b0;
		save_state_system		<= 'b0;
		blob_state_address	<= 'b0;
		core_state_address	<= 'b0;
		state_core_ram_write	<= 'b0;
		state_blob_ram_write <= 'b0;
		load_reset_l			<= 1'b0;
		AC_IN						<= 'b0;     
		IO_IN						<= 'b0;     
		PC_IN						<= 'b0;     
		load_state				<= 'b0;
		cnt						<= 'd0;
		frame_odd_sync_passed	<= 1'b0;
		MEM_BUFF_IN					<= 'd0;
		MEM_ADDR_IN					<= 'd0;
		IR_IN							<= 'd0;  
		IOSTA_IN						<= 'd0;
		loaded_a_state				<= 1'b0;
		AC_OUT_REG					<= 'd0;
		IO_OUT_REG					<= 'd0;
		PC_OUT_REG					<= 'd0;
		data_out_REG 				<= 'd0;
		AB_OUT_REG					<= 'd0;
		IR_OUT_REG					<= 'd0;
		IOSTA_OUT_REG 				<= 'd0;
	end
	else begin
		state_core_ram_write <= 1'b0;
		state_blob_ram_write <= 1'b0;
		savestate_load_ack	<= 1'b0;
		savestate_start_ack 	<= 1'b0;
		load_reset_l			<= 1'b1;
		savestate_load_busy	<= 1'b0;    
		load_state				<= 'b0;
		
		if (bridge_wr) begin
			case (bridge_addr)  
				32'h30004000: begin
					AC_IN <= bridge_wr_data;
				end
				32'h30004004: begin
					IO_IN <= bridge_wr_data;
				end
				32'h30004008: begin
					PC_IN <= bridge_wr_data;
				end
				32'h3000400C: begin
					MEM_BUFF_IN <= bridge_wr_data;
				end
				32'h30004010: begin
					MEM_ADDR_IN <= bridge_wr_data;
				end
				32'h30004014: begin
					IR_IN <= bridge_wr_data;
				end
				32'h30004018: begin
					IOSTA_IN <= bridge_wr_data;
				end
			endcase
		end 
		
		
		case (save_state_system)
			idle : begin
				if (savestate_start) save_state_system <= save_state_ack;
				if (savestate_load) save_state_system <= load_state_ack;
				blob_state_address 		<= 'd0;
				core_state_address 		<= 'd0;
				cnt						<= 'd0;
			end
			save_state_ack : begin
				save_state_system <= save_state_wait;
				savestate_start_ack 		<= 1'b1;
				savestate_start_ok		<= 1'b0;
				savestate_load_ok			<= 1'b0;
				core_state_address 		<= 'd0;
				blob_state_address 		<= 'd0;
				frame_odd_sync_passed	<= 1'b0;
			end
			save_state_wait : begin
				savestate_start_busy 	<= 1'b1;
				if (cpu_stall_rise) begin
					save_state_system 	<= save_state_process;
					core_state_address 	<= core_state_address + 1;
					blob_state_address	<= 'd0;
					state_blob_ram_write <= 1'b1;
					AC_OUT_REG	<= AC_OUT;
					IO_OUT_REG	<= IO_OUT;
					PC_OUT_REG	<= PC_OUT;
					data_out_REG <= data_out;
					AB_OUT_REG	<= AB_OUT;
					IR_OUT_REG	<= IR_OUT;
					IOSTA_OUT_REG <= IOSTA_OUT;
					
				end
				if (frame_odd_sync) frame_odd_sync_passed <= 1'b1;
				if (frame_odd_sync && frame_odd_sync_passed)		save_state_system 		<= idle;
			end
			save_state_process : begin
				if (core_state_address > 13'hfff) begin
					save_state_system 	<= save_state_completed;
					savestate_start_busy		<= 1'b0;
				end
				else begin
					core_state_address 	<= core_state_address + 1;
					blob_state_address 	<= blob_state_address + 1;
					state_blob_ram_write <= 1'b1;
					savestate_start_busy	<= 1'b1;
				end
			end
			save_state_completed : begin
				save_state_system 		<= idle;
				savestate_start_ok 		<= 1'b1;
			end
			
			load_state_ack : begin
				savestate_load_ack 		<= 1'b1;
				save_state_system 		<= load_state_process;
//				load_reset_l				<= 1'b0;
				savestate_start_ok		<= 1'b0;
				savestate_load_ok			<= 1'b0;
				core_state_address 		<= 'd0;
				blob_state_address 		<= 'd0;
				frame_odd_sync_passed	<= 1'b0;
				loaded_a_state				<= 1'b0;
			end
			load_state_process : begin
				savestate_load_ack 		<= 1'b0;
				savestate_load_busy		<= 1'b1;
				if (frame_odd_sync) frame_odd_sync_passed <= 1'b1;
				if (frame_odd_sync && frame_odd_sync_passed)		save_state_system 		<= idle;
				if (cpu_stall_rise) begin
					save_state_system 		<= load_state_process_write;
					blob_state_address 		<= blob_state_address + 1;
					core_state_address		<= 'd0;
					state_core_ram_write 	<= 1'b1;
				end
				
			end
			load_state_process_write : begin
				if (core_state_address > 13'hfff) begin
					save_state_system 		<= load_state_recover;
					savestate_load_busy		<= 1'b0;
				end
				else begin
					core_state_address 	<= core_state_address + 1;
					blob_state_address 	<= blob_state_address + 1;
					if (core_state_address <= 13'd4095) state_core_ram_write <= 1'b1;
					savestate_load_busy	<= 1'b1;
				end
			end
			load_state_recover : begin
					savestate_load_ok			<= 1'b1;
					save_state_system 		<= idle;
					load_state					<= 1'b1;
					loaded_a_state				<= 1'b1;
			end
		endcase
	end
end
								
					
wire [11:0]	cpu_ram_address 		= rim_mode ? tape_address 	: AB_OUT;
wire [17:0]	cpu_ram_data_input 	= rim_mode ? tape_data 		: data_out;
wire 			cpu_ram_write_enable = rim_mode ? tape_write 	: cpu_write;

wire pdp_ram_state_write = bridge_wr && (bridge_addr[31:14] == 18'b0011_0000_0000_0000_00);

wire [17:0] core_blob_data, blob_core_data;

BRAM_DUAL_PORT_CLOCK state_blob_ram(
   .address_a						(pdp_ram_state_write ? bridge_addr[13:2] : bridge_addr_buf[13:2]), 
   .clock_a							(clk_74a), 
   .data_a							(bridge_wr_data[17:0]),
   .wren_a							(pdp_ram_state_write), 
   .q_a								(pdp_ram_read),
	
	.address_b						(blob_state_address[11:0]), 
   .clock_b							(clk_74a), 
   .data_b							(core_blob_data),
   .wren_b							(state_blob_ram_write),
	.q_b								(blob_core_data),
);

	
BRAM_DUAL_PORT_CLOCK ram_memory(
   .address_a						(core_state_address[11:0]), 
   .clock_a							(clk_74a), 
   .data_a							(blob_core_data),
   .wren_a							(state_core_ram_write), 
   .q_a								(core_blob_data),
	
	.address_b						(cpu_ram_address), 
   .clock_b							(CLK_50M), 
   .data_b							(cpu_ram_data_input),
   .wren_b							(cpu_ram_write_enable),
	.q_b								(DI_OUT),
);

// PDP_CPU

//wire reset_cpu = |{run_core, ~load_reset_l};

cpu pdp1_cpu(
   .clk								(CLK_50M), 
   .rst								(run_core), 
   .MEM_ADDR						(AB_OUT), 
   .DI								(DI_OUT), 
   .MEM_BUFF						(data_out), 
   .WRITE_ENABLE					(cpu_write),
	   	
	.PC_IN							(PC_IN),
   .AC_IN							(AC_IN),
   .IO_IN							(IO_IN), 
	.MEM_ADDR_IN					(MEM_ADDR_IN),
	.MEM_BUFF_IN					(MEM_BUFF_IN),
	.IOSTA_IN						(IOSTA_IN),
	.IR_IN							(IR_IN),
	.load_state						(load_state),
	
   .PC								(PC_OUT),
   .AC								(AC_OUT),
   .IO								(IO_OUT),
	.IOSTA							(IOSTA_OUT),
	.IR								(IR_OUT),
   .BUS_out							(BUS_OUT),
                      
   .pixel_x_out					(pixel_x_addr_cpu),
   .pixel_y_out					(pixel_y_addr_cpu),
   .pixel_shift_out				(pixel_shift_cpu),
   .pixel_brightness				(pixel_brightness_cpu),
             
   .gamepad_in						(io_word),
          
   .start_address					(start_address),
             
   .typewriter_char_out			(char_output_w),
   .typewriter_strobe_out		(char_strobe_w),
             
   .typewriter_char_in			(kbd_char_out),
   .typewriter_strobe_in		(kbd_read_strobe),
   .typewriter_strobe_ack		(key_was_processed_w),
             
   .send_next_tape_char			(next_tape_char),
   .is_char_available			(data_wait),
   .tape_rcv_word					(tape_data),
             
   .sense_switches				(sense_switches),
   .test_word						(test_word),
   .test_address					(test_address),
             
   .cpu_running					(~cpu_stall),
          
   .console_switches				(console_switches),
         
   .crt_wait						(1'b1),
   .hw_mul_enabled				(1'b0)            
);       

reg cpu_stall;
reg cpu_vga_run_1,cpu_vga_run_2, cpu_vga_run_3;

reg [1:0] 	cpu_state = 0;
reg [20:0] 	cpu_counter;

parameter 		CPU_run			= 'd0,
					CPU_stall_count= 'd1,
					CPU_stall		= 'd2,
					CPU_boot			= 'd3;

					
					
reg [1:0] pixel_type;					
					
always @(posedge CLK_50M) begin
	
	case(PC_OUT)
	12'h800 : pixel_type <= 2'h1;		// needle start
	12'h940 : pixel_type <= 2'h0;		// needle end
	12'h960 : pixel_type <= 2'h2;		// wedge start
	12'ha90 : pixel_type <= 2'h0;		// wedge end
	12'h200 : pixel_type <= 2'h3;		// b-hole start
	12'h246 : pixel_type <= 2'h0;		// b-hole end
	endcase
	cpu_vga_run_1 <= cpu_vga_run;
	cpu_vga_run_2 <= cpu_vga_run_1;
	cpu_vga_run_3 <= cpu_vga_run_2;
	case (cpu_state)
		CPU_run : begin
			if (PC_OUT == 12'h429) begin
				cpu_stall <= 1'b1;
				cpu_state <= CPU_stall_count;
				cpu_counter <= 'b0;
			end
		end
		CPU_stall_count : begin
			cpu_stall <= 1'b1;
			cpu_counter <= cpu_counter + 1;
			if (cpu_counter == 30) cpu_state <= CPU_stall;
		end
		CPU_stall : begin
			cpu_stall <= 1'b1;
			if (cpu_vga_run_1) begin
				cpu_stall <= 1'b0;
				cpu_state <= CPU_boot;
				cpu_counter <= 'b0;
			end
		end
		CPU_boot : begin
			cpu_stall <= 1'b0;
			cpu_counter <= cpu_counter + 1;
			if (cpu_counter == 70) cpu_state <= CPU_run;
		end
	endcase
end
	
reg [23:0] VGA_high_speed;
wire [25:0] VGA_24_C;
reg VGA_HS, VGA_VS, VGA_DE;
reg  switches = 0;
reg frame = 0;
reg [1:0] VGA_status_slow;

/* Video generation */

/*******************************************************************************
			768*720 output
********************************************************************************/

	localparam	VID_H_BPORCH = 12'd14; 			
	localparam	VID_H_ACTIVE = 12'd768;
	localparam	VID_H_TOTAL  = 12'd1060;		 
	localparam	VID_V_BPORCH = 12'd17;			
	localparam	VID_V_ACTIVE = 12'd720;
	localparam	VID_V_TOTAL  = 12'd800;
	
	reg	[11:0] x_count;
	reg	[11:0] y_count;
	
	wire 	[7:0]  red_out, green_out, blue_out;
	
	reg	[8:0]  framecounter;
	reg			 frame_output;
	
always @(posedge video_rgb_clock) begin
	if (!reset_n) framecounter <= 'd0;
	video_de 		<= 0;		// Blank signal High on active signal
	video_skip 		<= 0;		// skip  signal High on active signal
	video_vs 		<= 0;		// Vert  signal High on active signal
	video_hs 		<= 0;		// Horz  signal High on active signal
	// x and y counters
	x_count <= x_count + 1'b1;
	if(x_count == VID_H_TOTAL-1) begin
		x_count <= 0;
		
		y_count <= y_count + 1'b1;
		if(y_count == VID_V_TOTAL) begin
			y_count <= 0;
			
			
		end
	end
	
	// generate sync 
	if(x_count == 0 && y_count == 0) begin
		// sync signal in back porch
		// new frame
		video_vs <= 1;
		frame_odd <= !frame_odd;
		if (framecounter != 'd10 &&  frame_odd) framecounter <= framecounter + 1;
	end
	if (framecounter == 'd10) frame_output <= 1'b1;
	else  frame_output <= 1'b0;
	// we want HS to occur a bit after VS, not on the same cycle
	if(x_count == 3) begin
		// sync signal in back porch
		// new line
		video_hs <= 1;
	end
	
	// inactive screen areas are black
	video_rgb <= 24'h0;
	
	if(x_count >= VID_H_BPORCH && x_count < VID_H_ACTIVE + VID_H_BPORCH) begin

		if((y_count >= VID_V_BPORCH) && (y_count < (VID_V_ACTIVE + VID_V_BPORCH))) begin
			// data enable. this is the active region of the line
			video_rgb <= {r_crt, g_crt, b_crt};
			video_de <= 1;
		end 
	end
end



endmodule