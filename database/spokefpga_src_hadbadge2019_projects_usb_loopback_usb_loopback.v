// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

/*
    Hackaday Superconference 2019 Badge

	Basic usb_loopback

    When running you ought to be able to connect to the usb serial port.  Characters are echo'ed back
*/

`include "../../pipe/rtl/pipe_defs.v"

module usb_loopback (
		input clk,
		input [7:0] btn,
`ifdef BADGE_V3
		output [10:0] ledc,
		output [2:0] leda,
		inout [29:0] genio,
`else
		output [8:0] led,
		inout [27:0] genio,
`endif
		output uart_tx,
		input uart_rx,
`ifdef BADGE_V3
		output irda_tx,
		input irda_rx,
		output irda_sd,
`endif
		output pwmout,
		output [17:0] lcd_db,
		output lcd_rd,
		output lcd_wr,
		output lcd_rs,
		output lcd_cs,
		input lcd_id,
		output lcd_rst,
		input lcd_fmark,
		output lcd_blen,
		output psrama_nce,
		output psrama_sclk,
		inout [3:0] psrama_sio,
		output psramb_nce,
		output psramb_sclk,
		inout [3:0] psramb_sio,
		output flash_cs,
		inout flash_miso,
		inout flash_mosi,
		inout flash_wp,
		inout flash_hold,
		output fsel_d,
		output fsel_c,
		output programn,

		output [3:0] gpdi_dp, gpdi_dn,
		inout usb_dp,
		inout usb_dm,
		output usb_pu,
		input usb_vdet,

		inout [5:0] sao1,
		inout [5:0] sao2,
		inout [7:0] pmod,

		output adcrefout,
		input adcref4
	);


	//
	// Clocks
	//

	// This is so Diamond can run something.  It is insufficently accurate to run USB
	/*
		wire clkint;
		OSCG #(
			.DIV( 2 ) //155MHz approx
		) oscint (
			.OSC(clkint)
		);
	*/

    wire clock_48mhz;
    clock_pll c_pll (.CLKI( clk ), .CLKOP( clock_48mhz ));

	//
	// RESET
	//

    reg [5:0] reset_counter = 0;
    wire reset = ~reset_counter[5];
    always @(posedge clock_48mhz)
        reset_counter <= reset_counter + reset;


	//
	// Config
	//

	reg fpga_reload=0;
	assign programn = ~fpga_reload;
	always @( posedge clock_48mhz )
		if ( ~btn[4] )
			fpga_reload <= 1;

	//
	// LED
	//

	reg [28:0] led_counter = 0;
	always @( posedge clock_48mhz ) begin
		if ( reset ) begin
		end else begin
			led_counter <= led_counter + 1'H1;
		end
	end

	`ifdef BADGE_V3
		assign ledc[ 8 ] = led_counter[ 25:19 ] == 0;
		assign leda = 1;
	`else
		assign led[ 8 ] = led_counter[ 25:19 ] == 0;
	`endif

	//
	// USB CDC ACM
	//

    // uart pipeline in and out
    localparam PipeSpec = `PS_d8s;
    wire [`P_m( PipeSpec ):0 ] pipe;

    // usb uart - this instanciates the entire USB device.
    usb_uart #( .PipeSpec( PipeSpec ) ) uart (
        .clk_48mhz  (clock_48mhz),
        .reset      (reset),

        // pins
        .pin_usb_p( usb_dp ),
        .pin_usb_n( usb_dm ),

        // uart pipeline, in and out
        .pipe_in( pipe ),
        .pipe_out( pipe )

        //.debug( debug )
    );

    // USB Host Detect Pull Up
    assign usb_pu = 1'b1;

endmodule
