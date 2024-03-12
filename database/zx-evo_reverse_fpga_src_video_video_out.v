
// This module generates video for DAC


module video_out (

// clocks
	input wire clk, f0, c3,

// video controls
    input wire vga_on,
    input wire tv_blank,
    input wire vga_blank,
    input wire vga_line,
    input wire frame,
	input wire [1:0] plex_sel_in,

// mode controls
	input wire tv_hires,
	input wire vga_hires,
	input wire [3:0] palsel,

// Z80 pins
	input  wire [14:0] cram_data_in,
	input  wire [7:0] cram_addr_in,
	input  wire cram_we,

// video data
	input wire [7:0] vplex_in,
	input wire [7:0] vgaplex,
	output wire [1:0] vred,
    output wire [1:0] vgrn,
    output wire [1:0] vblu,
	
    input wire [2:0] tst
);


// TV/VGA mux
	reg [7:0] vplex;
	always @(posedge clk) if (c3)
		vplex <= vplex_in;

	wire [7:0] plex = vga_on ? vgaplex : vplex;
	wire plex_sel = vga_on ? plex_sel_in[0] : plex_sel_in[1];
	wire [7:0] vdata = hires ? {palsel, plex_sel ? plex[3:0] : plex[7:4]} : plex;
    wire blank = vga_on ? vga_blank : tv_blank;
    wire hires = vga_on ? vga_hires : tv_hires;

	// wire [14:0] vpix = blank1 ? 15'b0 : vpixel;
	wire [14:0] vpix = blank1 ? 15'b0 : (vpixel ^ {tst[1], tst[1], 3'b0, tst[2], tst[2], 3'b0, tst[0], tst[0], 3'b0});
	// wire [14:0] vpix = blank1 ? 15'b0 : (vpixel & 15'b111001110011100);		// test for 373 colors
	// wire [14:0] vpix = blank1 ? 15'b0 : (vpixel & 15'b110001100011000);		// test for 64 colors

    reg blank1;         // GOVNOKOD!!!!!!!!!!!!!!!!!!!!!
    always @(posedge clk)
    begin
        blank1 <= blank;
    end

// color components extraction
	wire [1:0] cred = vpix[14:13];
	wire [2:0] ired = vpix[12:10];
	wire [1:0] cgrn = vpix[ 9: 8];
	wire [2:0] igrn = vpix[ 7: 5];
	wire [1:0] cblu = vpix[ 4: 3];
	wire [2:0] iblu = vpix[ 2: 0];


`ifndef FLICKER

// prepare and clocking two phases of output
	reg [1:0] red0;
	reg [1:0] grn0;
	reg [1:0] blu0;
	reg [1:0] red1;
	reg [1:0] grn1;
	reg [1:0] blu1;

	always @(posedge clk)
	begin
		red0 <= (!pwm[ired][{phase, 1'b0}] | &cred) ? cred : (cred + 2'b1);
		grn0 <= (!pwm[igrn][{phase, 1'b0}] | &cgrn) ? cgrn : (cgrn + 2'b1);
		blu0 <= (!pwm[iblu][{phase, 1'b0}] | &cblu) ? cblu : (cblu + 2'b1);
		red1 <= (!pwm[ired][{phase, 1'b1}] | &cred) ? cred : (cred + 2'b1);
		grn1 <= (!pwm[igrn][{phase, 1'b1}] | &cgrn) ? cgrn : (cgrn + 2'b1);
		blu1 <= (!pwm[iblu][{phase, 1'b1}] | &cblu) ? cblu : (cblu + 2'b1);
	end


// output muxing for 56MHz PWM resolution
	assign vred = clk ? red1 : red0;
	assign vgrn = clk ? grn1 : grn0;
	assign vblu = clk ? blu1 : blu0;
	// assign vred = cred;	// test NO PWM
	// assign vgrn = cgrn;	// test NO PWM
	// assign vblu = cblu;	// test NO PWM

`else

// frame flicker (373 colors)

	reg [1:0] red;
	reg [1:0] grn;
	reg [1:0] blu;

	always @(posedge clk)
	begin
        red <= (!ired[2] | vga_line | &cred) ? cred : (cred + 2'b1);
        grn <= (!igrn[2] | vga_line | &cgrn) ? cgrn : (cgrn + 2'b1);
        blu <= (!iblu[2] | vga_line | &cblu) ? cblu : (cblu + 2'b1);
    end

	assign vred = red;
	assign vgrn = grn;
	assign vblu = blu;

`endif


// PWM phase
	reg [1:0] ph;
	always @(posedge clk)
		ph <= ph + 2'b1;

	wire [1:0] phase = {vga_on ? vga_line : ph[1], ph[0]};


// PWM
	wire [7:0] pwm[0:7];
	assign pwm[0] = 8'b00000000;
	assign pwm[1] = 8'b00000001;
	assign pwm[2] = 8'b01000001;
	assign pwm[3] = 8'b01000101;
	assign pwm[4] = 8'b10100101;
	assign pwm[5] = 8'b10100111;
	assign pwm[6] = 8'b11010111;
	assign pwm[7] = 8'b11011111;


// CRAM
    wire [14:0] vpixel;

	video_cram video_cram(
		.clock	    (clk),
		.wraddress	(cram_addr_in),
		.data		(cram_data_in),
		.wren		(cram_we),
	    .rdaddress	(vdata),
	    .q			(vpixel)
);


endmodule
