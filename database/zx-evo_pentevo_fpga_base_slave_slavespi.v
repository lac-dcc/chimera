// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014,2019
//
// fpga SPI slave device -- AVR controlled.

/*
    This file is part of ZX-Evo Base Configuration firmware.

    ZX-Evo Base Configuration firmware is free software:
    you can redistribute it and/or modify it under the terms of
    the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ZX-Evo Base Configuration firmware is distributed in the hope that
    it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ZX-Evo Base Configuration firmware.
    If not, see <http://www.gnu.org/licenses/>.
*/

`include "tune.v"

module slavespi(

	input  wire fclk,
	input  wire rst_n,

	input  wire spics_n, // avr SPI iface
	output wire spidi,   //
	input  wire spido,   //
	input  wire spick,   //

	input  wire [ 7:0] status_in, // status bits to be shown to avr


	output wire [39:0] kbd_out,
	output wire        kbd_stb,

	output wire [ 7:0] mus_out,
	output wire        mus_xstb,
	output wire        mus_ystb,
	output wire        mus_btnstb,
	output wire        kj_stb,


	input  wire [ 7:0] gluclock_addr,
	input  wire [ 7:0] comport_addr,

	input  wire [ 7:0] wait_write,
	output wire [ 7:0] wait_read,
	input  wire        wait_rnw,

	output wire        wait_end,

	output wire [ 7:0] config0, // config bits for overall system
//	output wire [ 7:0] config1, //

	output wire        genrst, // positive pulse, causes Z80 reset

	output wire        sd_lock_out, // SDcard control iface
	input  wire        sd_lock_in,  //
	output wire        sd_cs_n,     //
	output wire        sd_start,    //
	output wire [ 7:0] sd_datain,   //
	input  wire [ 7:0] sd_dataout   //
);

`ifdef SIMULATE
	initial
	begin
		force wait_read = 8'h00;
	end
`endif


	// re-synchronize SPI
	//
	reg [2:0] spics_n_sync;
	reg [1:0] spido_sync;
	reg [2:0] spick_sync;
	//
	always @(posedge fclk)
	begin
		spics_n_sync[2:0] <= { spics_n_sync[1:0], spics_n };
		spido_sync  [1:0] <= { spido_sync    [0], spido   };
		spick_sync  [2:0] <= { spick_sync  [1:0], spick   };
	end
	//
	wire scs_n = spics_n_sync[1]; // scs_n - synchronized CS_N
	wire sdo   = spido_sync[1];
	wire sck   = spick_sync[1];
	//
	wire scs_n_01 = (~spics_n_sync[2]) &   spics_n_sync[1] ;
	wire scs_n_10 =   spics_n_sync[2]  & (~spics_n_sync[1]);
	//
	wire sck_01 = (~spick_sync[2]) &   spick_sync[1] ;
	wire sck_10 =   spick_sync[2]  & (~spick_sync[1]);


	reg [7:0] regnum; // register number holder

	reg [7:0] shift_out;

	reg [7:0] data_in;



	// register selectors
	wire sel_kbdreg, sel_kbdstb, sel_musxcr, sel_musycr, sel_musbtn, sel_kj,
	     sel_rstreg, sel_waitreg, sel_gluadr, sel_comadr, sel_cfg0, sel_cfg1,
	     sel_sddata, sel_sdctrl;

	// keyboard register
	reg [39:0] kbd_reg;


	// common single-byte shift-in register
	reg [7:0] common_reg;


	// wait data out register
	reg [7:0] wait_reg;

	//
	reg [7:0] cfg0_reg_out;
//	reg [7:0] cfg1_reg_out;


	// SDcard access registers
	reg [7:0] sddata; // output to SDcard
	reg [1:0] sdctrl; // SDcard control (CS_n and lock)


`ifdef SIMULATE
	initial
	begin
		cfg0_reg_out[7:0] = 8'd0;
	end
`endif


	// register number
	//
	always @(posedge fclk)
	begin
		if( scs_n_01 )
		begin
			regnum <= 8'd0;
		end
		else if( scs_n && sck_01 )
		begin
			regnum[7:0] <= { sdo, regnum[7:1] };
		end
	end


	// send data to avr
	//
	always @*
	case(1'b1)
		sel_waitreg: data_in = wait_write;
		sel_gluadr:  data_in = gluclock_addr;
		sel_comadr:  data_in = comport_addr;
		sel_sddata:  data_in = sd_dataout;
		sel_sdctrl:  data_in = { sd_lock_in, 7'bXXX_XXXX };
		default:     data_in = 8'bXXXX_XXXX;
	endcase
	//
	always @(posedge fclk)
	begin
		if( scs_n_01 || scs_n_10 ) // both edges
		begin
			shift_out <= scs_n ? status_in : data_in;
		end
		else if( sck_01 )
		begin
			shift_out[7:0] <= { 1'b0, shift_out[7:1] };
		end
	end
	//
	assign spidi = shift_out[0];


	// reg number decoding
	//
	assign sel_kbdreg = ( (regnum[7:4]==4'h1) && !regnum[0] ); // $10
	assign sel_kbdstb = ( (regnum[7:4]==4'h1) &&  regnum[0] ); // $11
	//
	assign sel_musxcr = ( (regnum[7:4]==4'h2) && !regnum[1] && !regnum[0] ); // $20
	assign sel_musycr = ( (regnum[7:4]==4'h2) && !regnum[1] &&  regnum[0] ); // $21
	assign sel_musbtn = ( (regnum[7:4]==4'h2) &&  regnum[1] && !regnum[0] ); // $22
	assign sel_kj     = ( (regnum[7:4]==4'h2) &&  regnum[1] &&  regnum[0] ); // $23
	//
	assign sel_rstreg = ( (regnum[7:4]==4'h3) ) ; // $30
	//
	assign sel_waitreg = ( (regnum[7:4]==4'h4) && (regnum[1:0]==2'b00) ); // $40
	assign sel_gluadr  = ( (regnum[7:4]==4'h4) && (regnum[1:0]==2'b01) ); // $41
	assign sel_comadr  = ( (regnum[7:4]==4'h4) && (regnum[1:0]==2'b10) ); // $42
	//
//	assign sel_cfg0 = (regnum[7:4]==4'h5 && regnum[0]==1'b0); // $50
//	assign sel_cfg1 = (regnum[7:4]==4'h5 && regnum[0]==1'b1); // $51
	assign sel_cfg0 = (regnum[7:4]==4'h5); // $50
	//
	assign sel_sddata = ( (regnum[7:4]==4'h6) && !regnum[0] ); // $60
	assign sel_sdctrl = ( (regnum[7:4]==4'h6) &&  regnum[0] ); // $61


	// registers data-in
	//
	always @(posedge fclk)
	begin
		// kbd data shift-in
		if( !scs_n && sel_kbdreg && sck_01 )
			kbd_reg[39:0] <= { sdo, kbd_reg[39:1] };

		// mouse data shift-in
		if( !scs_n && (sel_musxcr || sel_musycr || sel_musbtn || sel_kj) && sck_01 )
			common_reg[7:0] <= { sdo, common_reg[7:1] };

		// wait read data shift-in
		if( !scs_n && sel_waitreg && sck_01 )
			wait_reg[7:0] <= { sdo, wait_reg[7:1] };

		// config shift-in
//		if( !scs_n && (sel_cfg0 || sel_cfg1) && sck_01 )
		if( !scs_n && sel_cfg0 && sck_01 )
			common_reg[7:0] <= { sdo, common_reg[7:1] };

		// config output
		if( scs_n_01 && sel_cfg0 )
			cfg0_reg_out <= common_reg;
//		if( scs_n_01 && sel_cfg1 )
//			cfg1_reg_out <= common_reg;

		// SD data shift-in
		if( !scs_n && sel_sddata && sck_01 )
			common_reg[7:0] <= { sdo, common_reg[7:1] };

		// SD control shift-in
		if( !scs_n && sel_sdctrl && sck_01 )
			common_reg[7:0] <= { sdo, common_reg[7:1] };
	end
	//
	// SD control output
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
		sdctrl <= 2'b01;
	else // posedge clk
	begin
		if( scs_n_01 && sel_sdctrl )
			sdctrl <= { common_reg[7], common_reg[0] };
	end


	// output data
	assign kbd_out = kbd_reg;
	assign kbd_stb = sel_kbdstb && scs_n_01;

	assign mus_out    = common_reg;
	assign mus_xstb   = sel_musxcr && scs_n_01;
	assign mus_ystb   = sel_musycr && scs_n_01;
	assign mus_btnstb = sel_musbtn && scs_n_01;
	assign kj_stb     = sel_kj     && scs_n_01;

	assign genrst = sel_rstreg && scs_n_01;

	assign wait_read = wait_reg;
	assign wait_end = sel_waitreg && scs_n_01;

	assign config0 = cfg0_reg_out;
//	assign config1 = cfg1_reg_out;



	// SD control output
	assign sd_lock_out = sdctrl[1];
	assign sd_cs_n     = sdctrl[0];

	// SD data output
	assign sd_datain = common_reg;
	// SD start strobe
	assign sd_start = sel_sddata && scs_n_01;


endmodule

