////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	altbusmaster.v
//
// Project:	CMod S6 System on a Chip, ZipCPU demonstration project
//
// Purpose:	Because the S6 is *so* small logic-wise, the logic of setting up
//		a project/design was separated from the logic of the design
//	itself.  Hence, this is the "setup" design.  It allows us to test various
//	components from the command line interface, as well as erasing and 
//	programming the flash in order to set up the actual device interface.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015-2017, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory, run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`include "builddate.v"
//
// `define	IMPLEMENT_ONCHIP_RAM
`define	FLASH_ACCESS
`define	DBG_SCOPE	// About 204 LUTs, at 2^6 addresses
// `define	COMPRESSED_SCOPE
`define	WBUBUS
// `define	LOWLOGIC_FLASH
module	altbusmaster(i_clk, i_rst,
		// DEPP I/O Control
		i_depp_astb_n, i_depp_dstb_n, i_depp_write_n,
			i_depp_data, o_depp_data, o_depp_wait,
		// External UART interface
		i_rx_stb, i_rx_data, o_tx_stb, o_tx_data, i_tx_busy,
			o_uart_rts_n,
		// The SPI Flash lines
		o_qspi_cs_n, o_qspi_sck, o_qspi_dat, i_qspi_dat, o_qspi_mod,
		// The board I/O
		i_btn, o_led, o_pwm, o_pwm_aux,
		// Keypad connections
		i_kp_row, o_kp_col,
		// UART control
		o_uart_setup,
		// GPIO lines
		i_gpio, o_gpio);
	parameter	BUS_ADDRESS_WIDTH=23;
	localparam	BAW=BUS_ADDRESS_WIDTH; // 24bits->2,258,23b->2181
	// 2^14 bytes requires a LGMEMSZ of 14, and 12 address bits ranging from
	// 0 to 11.  As with many other devices, the wb_cyc line is more for
	// form than anything else--it is ignored by the memory itself.
	localparam	LGMEMSZ=14;	// Takes 8 BLKRAM16 elements for LGMEMSZ=14
	// As with the memory size, the flash size is also measured in log_2 of
	// the number of bytes.
	localparam	LGFLASHSZ = 24;
	input			i_clk, i_rst;
	// The bus commander, via an external DEPP port
	input			i_depp_astb_n, i_depp_dstb_n, i_depp_write_n;
	input	wire	[7:0]	i_depp_data;
	output	wire	[7:0]	o_depp_data;
	output	wire		o_depp_wait;
	// Serial inputs
	input			i_rx_stb;
	input		[7:0]	i_rx_data;
	output	reg		o_tx_stb;
	output	reg	[7:0]	o_tx_data;
	input			i_tx_busy;
	output	wire		o_uart_rts_n;
	// SPI flash control
	output	wire		o_qspi_cs_n;
`ifdef	LOWLOGIC_FLASH
	output	wire	[1:0]	o_qspi_sck;
`else	// LOWLOGIC_FLASH
	output	wire		o_qspi_sck;
`endif	// LOWLOGIC_FLASH
	output	wire	[3:0]	o_qspi_dat;
	input		[3:0]	i_qspi_dat;
	output	wire	[1:0]	o_qspi_mod;
	// Board I/O
	input		[1:0]	i_btn;
	output	wire	[3:0]	o_led;
	output	wire		o_pwm;
	output	wire	[1:0]	o_pwm_aux;
	// Keypad
	input		[3:0]	i_kp_row;
	output	wire	[3:0]	o_kp_col;
	// UART control
	output	wire	[30:0]	o_uart_setup;
	// GPIO liines
	input		[15:0]	i_gpio;
	output	wire	[15:0]	o_gpio;


	//
	//
	// Master wishbone wires
	//
	//
	wire		wb_cyc, wb_stb, wb_we, wb_stall, wb_ack, wb_err;
	wire	[31:0]	wb_data, wb_idata, w_wbu_addr;
	wire	[(BAW-1):0]	wb_addr;

	// Wires going to devices
	// And then headed back home
	wire	w_interrupt;
`ifdef	WBUBUS
	//
	//
	// The BUS master (source): The WB to UART conversion bus
	//
	//
	wire		dep_rx_stb, dep_tx_stb, dep_tx_busy;
	wire	[7:0]	dep_rx_data, dep_tx_data;
	deppbyte	deppdrive(i_clk,
		i_depp_astb_n, i_depp_dstb_n, i_depp_write_n,
			i_depp_data, o_depp_data, o_depp_wait,
		dep_rx_stb, dep_rx_data,
		dep_tx_stb, dep_tx_data, dep_tx_busy);

	wire	bus_dbg;
	wbubus #(22) busbdriver(i_clk,
			// i_rx_stb, i_rx_data,		// UART control
			dep_rx_stb, dep_rx_data,	// DEPP control
			// The wishbone interface
			wb_cyc, wb_stb, wb_we, w_wbu_addr, wb_data,
				wb_ack, wb_stall, wb_err, wb_idata,
			w_interrupt,
			// Provide feedback to the DEPP interface
			dep_tx_stb, dep_tx_data, dep_tx_busy,
			bus_dbg);
//			// Provide feedback to the UART
//			o_tx_stb, o_tx_data, i_tx_busy
	// assign	o_uart_rts = (~rx_rdy);

	wire	[30:0]	bus_debug;
	assign	bus_debug = {
			wb_cyc, wb_stb, wb_ack, wb_stall,
			wb_addr[7:0],
			dep_rx_stb, (~dep_tx_busy)&&(dep_tx_stb), dep_tx_stb,
			dep_rx_data, dep_tx_data };
`else
	//
	//
	// Another BUS master (source): A conversion from DEPP to busmaster
	//
	//
	wbdeppsimple	deppdrive(i_clk,
		i_depp_astb_n, i_depp_dstb_n, i_depp_write_n,
			i_depp_data, o_depp_data, o_depp_wait,
		wb_cyc, wb_stb, wb_we, w_wbu_addr, wb_data,
			wb_ack, wb_stall, wb_err, wb_idata,
			w_interrupt);
`endif

	assign	wb_addr = w_wbu_addr[(BAW-1):0];


	// Signals to build/detect bus errors
	wire	none_sel, many_sel;

	wire	io_sel, flash_sel, flctl_sel, scop_sel, mem_sel;
	wire	flash_ack, scop_ack, mem_ack, many_ack;
	wire	io_stall, flash_stall, scop_stall, mem_stall;
	reg	io_ack;

	wire	[31:0]	flash_data, scop_data, mem_data, pwm_data,
			spio_data, gpio_data, uart_data;
	reg	[31:0]	io_data;
	reg	[(BAW-1):0]	bus_err_addr;
	//
	// wb_ack
	//
	// The returning wishbone ack is equal to the OR of every component that
	// might possibly produce an acknowledgement, gated by the CYC line.  To
	// add new components, OR their acknowledgements in here.
	//
	// Note the reference to none_sel.  If nothing is selected, the result
	// is an error.  Here, we do nothing more than insure that the erroneous
	// request produces an ACK ... if it was ever made, rather than stalling
	// the bus.
	//


	assign	wb_ack = (wb_cyc)&&((io_ack)||(scop_ack)
				||(mem_ack)||(flash_ack)||((none_sel)&&(1'b1)));

	//
	// wb_stall
	//
	// The returning wishbone stall line really depends upon what device
	// is requested.  Thus, if a particular device is selected, we return
	// the stall line for that device.
	//
	// To add a new device, simply and that devices select and stall lines
	// together, and OR the result with the massive OR logic below.
	//
	assign	wb_stall = ((io_sel)&&(io_stall))
			||((scop_sel)&&(scop_stall))
			||((mem_sel)&&(mem_stall))
			||((flash_sel||flctl_sel)&&(flash_stall));
			// (none_sel)&&(1'b0)

	//
	// wb_idata
	//
	// This is the data returned on the bus.  Here, we select between a
	// series of bus sources to select what data to return.  The basic
	// logic is simply this: the data we return is the data for which the
	// ACK line is high.
	//
	// The last item on the list is chosen by default if no other ACK's are
	// true.  Although we might choose to return zeros in that case, by
	// returning something we can skimp a touch on the logic.
	//
	// To add another device, add another ack check, and another closing
	// parenthesis.
	//
	assign	wb_idata =  (io_ack|scop_ack)?((io_ack )? io_data  : scop_data)
			: ((mem_ack)?(mem_data)
			: flash_data);

	//
	// wb_err
	//
	// This is the bus error signal.  It should never be true, but practice
	// teaches us otherwise.  Here, we allow for three basic errors:
	//
	// 1. STB is true, but no devices are selected
	//
	//	This is the null pointer reference bug.  If you try to access
	//	something on the bus, at an address with no mapping, the bus
	//	should produce an error--such as if you try to access something
	//	at zero.
	//
	// 2. STB is true, and more than one device is selected
	//
	//	(This can be turned off, if you design this file well.  For
	//	this line to be true means you have a design flaw.)
	//
	// 3. If more than one ACK is every true at any given time.
	//
	//	This is a bug of bus usage, combined with a subtle flaw in the
	//	WB pipeline definition.  You can issue bus requests, one per
	//	clock, and if you cross device boundaries with your requests,
	//	you may have things come back out of order (not detected here)
	//	or colliding on return (detected here).  The solution to this
	//	problem is to make certain that any burst request does not cross
	//	device boundaries.  This is a requirement of whoever (or
	//	whatever) drives the bus.
	//
	assign	wb_err = ((wb_stb)&&(none_sel || many_sel)) || many_ack;

	// Addresses ...
	//
	// dev_sel
	//
	// The device select lines
	//
	//


	//
	// The skipaddr bitfield below is our cheaters way of handling
	// device selection.  We grab particular wires from the bus to do
	// this, and ignore all others.  While this may lead to some
	// surprising results for the CPU when it tries to access an
	// inappropriate address, it also minimizes our logic while also
	// placing every address at the right address.  The only problem is
	// ... devices will also be at some unexpected addresses, but ... this
	// is still within our spec.
	//
	wire	[3:0]	skipaddr;
	assign	skipaddr = {
			wb_addr[(LGFLASHSZ-2)],	// Flash
			wb_addr[(LGMEMSZ-2)],	// RAM
			wb_addr[ 9],		// SCOPE
			wb_addr[ 8] };		// I/O
	//
	// This might not be the most efficient way in hardware, but it will
	// work for our purposes here.  There are two phantom bits for each
	// of these ... bits that tell the CPU which byte within the word, and
	// another phantom bit because we allocated a minimum of two words to
	// every device.
	//
	wire	idle_n;
`ifdef	ZERO_ON_IDLE
	assign idle_n = wb_stb;
`else
	assign idle_n = 1'b1;
`endif

// `define ZERO_ON_IDLE
`ifdef	ZERO_ON_IDLE
	assign	idle_n = (wb_cyc)&&(wb_stb);
`else
	assign	idle_n = 1'b1;
`endif
	assign	io_sel   = ((idle_n)&&(skipaddr[3:0]==4'b00_01));
`ifdef	LOWLOGIC_FLASH
	assign	scop_sel = ((idle_n)&&(skipaddr[3:1]==3'b00_1)); // = 4'h2
	assign	flctl_sel= 1'b0; // The lowlogic flash has no control registers
`else	// LOWLOGIC_FLASH
	assign	scop_sel = ((idle_n)&&(skipaddr[3:0]==4'b00_10)); // = 4'h2
	assign	flctl_sel= ((wb_cyc)&&(skipaddr[3:0]==4'b00_11));
`endif	// LOWLOGIC_FLASH
	assign	mem_sel  = ((idle_n)&&(skipaddr[3:2]==2'b01));
	assign	flash_sel= ((idle_n)&&(skipaddr[3]));

	//
	// none_sel
	//
	// This wire is true if wb_stb is true and no device is selected.  This
	// is an error condition, but here we present the logic to test for it.
	//
	//
	// If you add another device, add another OR into the select lines
	// associated with this term.
	//
	assign	none_sel =((wb_stb)&&(skipaddr==4'h0));

	//
	// many_sel
	//
	// This should *never* be true .... unless you mess up your address
	// decoding logic.  Since I've done that before, I test/check for it
	// here.
	//
	// To add a new device here, simply add it to the list.  Make certain
	// that the width of the add, however, is greater than the number
	// of devices below.  Hence, for 3 devices, you will need an add
	// at least 3 bits in width, for 7 devices you will need at least 4
	// bits, etc.
	//
	// Because this add uses the {} operator, the individual components to
	// it are by default unsigned ... just as we would like.
	//
	// There's probably another easier/better/faster/cheaper way to do this,
	// but I haven't found any such that are also easier to adjust with
	// new devices.  I'm open to options.
	//
	assign	many_sel = 1'b0;

	//
	// many_ack
	//
	// Normally this would capture the error when multiple things creates acks
	// at the same time.  The S6 is small, though, and doesn't have the logic
	// we need to do this right.  Hence we just declare (and hope) that this
	// will never be true and work with that.
	//
	assign	many_ack = 1'b0;

	wire		flash_interrupt, scop_interrupt, tmra_int, tmrb_int,
			gpio_int, pwm_int, keypad_int,button_int;


	//
	// bus_err_addr
	//
	// We'd like to know, after the fact, what (if any) address caused a
	// bus error.  So ... if we get a bus error, let's record the address
	// on the bus for later analysis.
	//
	initial	bus_err_addr = 0;
	always @(posedge i_clk)
		if (wb_err)
			bus_err_addr <= wb_addr;
	//
	// Interrupt processing
	//
	// The interrupt controller will be used to tell us if any interrupts
	// take place.  
	//
	// To add more interrupts, you can just add more wires to this int_vector
	// for the new interrupts.
	// 
	reg		rx_rdy;
	wire	[11:0]	int_vector;
	assign	int_vector = { 
				flash_interrupt, gpio_int, pwm_int, keypad_int,
				(!o_tx_stb), rx_rdy,
				tmrb_int, tmra_int,
				1'b0, scop_interrupt,
				wb_err, button_int };

	wire	[31:0]	pic_data;
	icontrol #(12)	pic(i_clk, 1'b0, (wb_stb)&&(io_sel)
					&&(wb_addr[3:0]==4'h0)&&(wb_we),
			wb_data, pic_data, int_vector, w_interrupt);

	wire	[31:0]	timer_data, timer_b;
	wire		zta_ack, zta_stall, ztb_ack, ztb_stall;
	ziptimer	#(32,31,1)
		thetimer(i_clk, 1'b0, 1'b1, wb_cyc,
				(wb_stb)&&(io_sel)&&(wb_addr[3:0]==4'h2),
				wb_we, wb_data, zta_ack, zta_stall, timer_data,
				tmra_int);
	ziptimer	#(32,31,0)
		zipt_b(i_clk, 1'b0, 1'b1, wb_cyc,
				(wb_stb)&&(io_sel)&&(wb_addr[3:0]==4'h3),
				wb_we, wb_data, ztb_ack, ztb_stall, timer_b,
				tmrb_int);

	always @(posedge i_clk)
		case(wb_addr[3:0])
			4'h0: io_data <= pic_data;
			4'h1: io_data <= { {(30-BAW){1'b0}}, bus_err_addr, 2'b00 };
			4'h2: io_data <= timer_data;
			4'h3: io_data <= timer_b;
			4'h4: io_data <= pwm_data;
			4'h5: io_data <= spio_data;
			4'h6: io_data <= gpio_data;
			4'h7: io_data <= uart_data;
			default: io_data <= `DATESTAMP;
			// 4'h8: io_data <= `DATESTAMP;
		endcase
	always @(posedge i_clk)
		io_ack <= (wb_stb)&&(io_sel);
	assign	io_stall = 1'b0;

	wire	pwm_ack, pwm_stall;
	wbpwmaudio	#(14'd10000,2,0,14)
		theaudio(i_clk, wb_cyc,
				((wb_stb)&&(io_sel)&&(wb_addr[3:0]==4'h4)),
					wb_we, 1'b0, wb_data,
				pwm_ack, pwm_stall, pwm_data, o_pwm,
					o_pwm_aux, //={pwm_shutdown_n,pwm_gain}
					pwm_int);

	//
	// Special Purpose I/O: Keypad, button, LED status and control
	//
	wire	[3:0]	w_led;
	spio	thespio(i_clk, wb_cyc,(wb_stb)&&(io_sel)&&(wb_addr[3:0]==4'h5),
				wb_we, wb_data, spio_data,
			o_kp_col, i_kp_row, i_btn, w_led,
			keypad_int, button_int);
	assign	o_led = { w_led[3]|w_interrupt,w_led[2],w_led[1:0] };

	//
	// General purpose (sort of) I/O:  (Bottom two bits robbed in each
	// direction for an I2C link at the toplevel.v design)
	//
	wbgpio	#(16,16,16'hffff) thegpio(i_clk, wb_cyc,
			(wb_stb)&&(io_sel)&&(wb_addr[3:0]==4'h6), wb_we,
			wb_data, gpio_data, i_gpio, o_gpio, gpio_int);

	//
	//
	//	Rudimentary serial port control
	//
	reg	[7:0]	r_rx_data;
	// Baud rate is set by clock rate / baud rate.
	// Thus, 80MHz / 115200MBau
	//	= 694.4, or about 0x2b6. 
	// although the CPU might struggle to keep up at this speed without a
	// hardware buffer.
	//
	// We'll add the flag for two stop bits.
	// assign	o_uart_setup = 30'h080002b6; // 115200 MBaud @ an 80MHz clock
	assign	o_uart_setup = 31'h4000208d; // 9600 MBaud, 8N1

	initial	o_tx_stb = 1'b0;
	initial	o_tx_data = 8'h00;
	always @(posedge i_clk)
		if ((wb_stb)&&(io_sel)&&(wb_addr[3:0]==4'h7)&&(wb_we))
		begin
			o_tx_data <= wb_data[7:0];
			o_tx_stb <= 1'b1;
		end
		else if ((o_tx_stb)&&(~i_tx_busy))
			o_tx_stb <= 1'b0;
	initial	rx_rdy = 1'b0;
	always @(posedge i_clk)
		if (i_rx_stb)
			r_rx_data <= i_rx_data;
	always @(posedge i_clk)
	begin
		if((wb_stb)&&(io_sel)&&(wb_addr[3:0]==4'h7)&&(~wb_we))
			rx_rdy <= i_rx_stb;
		else if (i_rx_stb)
			rx_rdy <= (rx_rdy | i_rx_stb);
	end
	assign	o_uart_rts_n = (rx_rdy);
	assign	uart_data = { 23'h0, ~rx_rdy, r_rx_data };
	//
	// uart_ack gets returned as part of io_ack, since that happens when
	// io_sel and wb_stb are defined
	//
	// always @(posedge i_clk)
		// uart_ack<= ((wb_stb)&&(io_sel)&&(wb_addr[3:0]==4'h7));



	//
	//	FLASH MEMORY CONFIGURATION ACCESS
	//
`ifdef	FLASH_ACCESS
`ifdef	LOWLOGIC_FLASH
	wire	w_flash_ack;
	qflashxpress	flashmem(i_clk,
		wb_cyc,(wb_stb)&&(flash_sel),
			wb_addr[(LGFLASHSZ-3):0],
		w_flash_ack, flash_stall, flash_data,
		o_qspi_sck, o_qspi_cs_n, o_qspi_mod, o_qspi_dat, i_qspi_dat);

	assign	flash_interrupt = 1'b0;
	reg	r_flash_ack;
	initial	r_flash_ack = 1'b0;
	always @(posedge i_clk)
		r_flash_ack <= (wb_stb)&&(flctl_sel);
	assign	flash_ack = (w_flash_ack)||(r_flash_ack);
`else	// LOWLOGIC_FLASH
	wbqspiflashp #(LGFLASHSZ)	// Use the writable interface
		flashmem(i_clk,
		  wb_cyc,(wb_stb)&&(flash_sel),(wb_stb)&&(flctl_sel),wb_we,
			wb_addr[(LGFLASHSZ-3):0], wb_data,
		flash_ack, flash_stall, flash_data,
		o_qspi_sck, o_qspi_cs_n, o_qspi_mod, o_qspi_dat, i_qspi_dat,
		flash_interrupt);
`endif	// LOWLOGIC_FLASH
`else	// FLASH_ACCESS
	reg	r_flash_ack;
	initial	r_flash_ack = 1'b0;
	always @(posedge i_clk)
		r_flash_ack <= (wb_stb)&&((flash_sel)||(flctl_sel));

	assign	flash_ack = r_flash_ack;
	assign	flash_stall = 1'b0;
	assign	flash_data = 32'h0000;
	assign	flash_interrupt = 1'b0;

	assign	o_qspi_sck   = 1'b1;
	assign	o_qspi_cs_n  = 1'b1;
	assign	o_qspi_mod   = 2'b01;
	assign	o_qspi_dat   = 4'b1111;
`endif	// FLASH_ACCESS

	//
	//	ON-CHIP RAM MEMORY ACCESS
	//
`ifdef	IMPLEMENT_ONCHIP_RAM
	memdev	#(.LGMEMSZ(LGMEMSZ))
		ram(i_clk, wb_cyc, (wb_stb)&&(mem_sel), wb_we,
			wb_addr[(LGMEMSZ-3):0], wb_data, wb_sel,
			mem_ack, mem_stall, mem_data);
`else
	assign	mem_data = 32'h00;
	assign	mem_stall = 1'b0;
	reg	r_mem_ack;
	always @(posedge i_clk)
		r_mem_ack <= (wb_stb)&&(mem_sel);
	assign	mem_ack = r_mem_ack;
`endif

	//
	//
	//	WISHBONE SCOPE
	//
	//
	//
	//
`ifdef	DBG_SCOPE
	wire	scop_trigger;
	// assign scop_trigger = (flash_sel)&&(wb_stb); // bus_dbg;
	assign scop_trigger = (wb_stb)&&(wb_we)&&(flctl_sel);
	wire	[31:0]	flash_debug;
	wire	[1:0]	sck;
`ifdef	LOWLOGIC_FLASH
	assign	sck = o_qspi_sck;
`else	// LOWLOGIC_FLASH
	assign	sck = { o_qspi_sck, o_qspi_sck };
`endif	// LOWLOGIC_FLASH
	assign	flash_debug = {
			wb_cyc, wb_stb,
				flash_sel, flctl_sel, flash_ack, flash_stall,
				o_qspi_cs_n, sck, o_qspi_mod, 1'b0,
			o_qspi_dat, i_qspi_dat, flash_data[11:0]
		};
`ifdef	COMPRESSED_SCOPE
	wbscopc	#(5'ha)
`else
	wbscope	#(5'ha)
`endif
	thescope(i_clk, 1'b1, scop_trigger, flash_debug,
		// Wishbone interface
		i_clk, wb_cyc, (wb_stb)&&(scop_sel),
				wb_we, wb_addr[0], wb_data,
			scop_ack, scop_stall, scop_data,
		scop_interrupt);
`else
	reg	r_scop_ack;
	always @(posedge i_clk)
		r_scop_ack <= (wb_stb)&&(scop_sel);
	assign	scop_ack = r_scop_ack;
	assign	scop_data = 32'h000;
	assign	scop_stall= 1'b0;
`endif

endmodule

