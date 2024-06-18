// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2022-11-16 by mza
// based on mza-test063.alphav2.pynqz2.v
// last updated 2024-04-25 by mza

`ifndef ALPHA_LIB
`define ALPHA_LIB

/* address mapping and bit mapping cribbed from alpha-digital/source/ALP_Digital_I2C.vhd
 50	constant I2C_Trigger : integer := 0; --ICT
106		i2c_reg.I2C_trig <=i2c_data_out_trig(I2C_Trigger);
 51	constant SRC : integer := 1;
111		I2CupAddr  <= i2c_data_out(SRC)(7 downto 3);
112		LVDSB_pwr  <= i2c_data_out(SRC)(2);
113		LVDSA_pwr  <= i2c_data_out(SRC)(1);
114		i2c_reg.SRCsel <= i2c_data_out(SRC)(0);
115		i2c_reg.SamplingParam.ASICID <= I2CupAddr & I2C_Addr;
 52	constant RST : integer := 2;
119		i2c_address(RST) <= make_addr( I2C_Addr , RST);·
120		TMReg_Reset <= i2c_data_out_trig(RST);
 53	constant SAT : integer := 3;
124		i2c_address(SAT) <=  make_addr( I2C_Addr , SAT);
125		i2c_reg.SamplingParam.SamplesAfterTrig <= i2c_data_out(SAT);
 54	constant LBW : integer := 4;
127		i2c_address(LBW) <=  make_addr( I2C_Addr , LBW);
128		i2c_reg.SamplingParam.LookbackWindow <= i2c_data_out(LBW);
 55	constant nSP : integer := 5;
131		i2c_address(nSP) <=  make_addr( I2C_Addr , nSP);
132		i2c_reg.SamplingParam.numberOfSamples <= i2c_data_out(nSP);
 56	constant OSs : integer := 6;
137		i2c_address(OSs) <= make_addr( I2C_Addr , OSs) ;
138		i2c_data_in(OSs) <= OpStatus;
 57	constant ALP : integer := 7;
140		i2c_address(ALP) <=  make_addr( I2C_Addr , ALP) ;
141		i2c_data_in(ALP) <= x"A1";
 58	constant Trigger_select_c : integer := 8;
145		i2c_reg.Trigger_select <= i2c_data_out(Trigger_select_c)(i2c_reg.Trigger_select'range);
 59	constant Token_edge_dection_c : integer := 9;
148		i2c_reg.Token_edge_dection   <= i2c_data_out(Token_edge_dection_c)(i2c_reg.Token_edge_dection'range);
 60	--constant oBL : integer := 10; // does not respond to address 10
 61	constant PCLK_period : integer := 11;
151		pclk_timing_signal   <= i2c_data_out(PCLK_period);
 62	constant DBL : integer := 12;
 63	constant DBM : integer := 13;
156		I2C_DataBus <= i2c_data_out(DBM)(3 downto 0) & i2c_data_out(DBL);
 64	constant pclk : integer := 14; -- Select PCLK
159		I2C_PCLK <= (others =>'0');
160		if i2c_data_out_trig(pclk) ='1' then
161		I2C_PCLK <= i2c_data_out(pclk)(I2C_PCLK'range);
162		pclk_counter <= pclk_timing_signal;
163		end if;
165		if unsigned(pclk_counter) >0 then·
166			pclk_counter <= std_logic_vector( unsigned(pclk_counter) - 1);
167			I2C_PCLK <= i2c_data_out(pclk)(I2C_PCLK'range);
169		end if;
 65	--constant PCK : integer := 15; // does not respond to address 15
*/

`include "i2c.v"

module alpha_control #(
	parameter SIMULATION = 0
) (
	input clock, reset,
	input initiate_trigger, initiate_legacy_serial_sequence, initiate_dreset_sequence, initiate_i2c_transfer,
	input sda_in,
	input [11:0] CMPbias, ISEL, SBbias, DBbias,
	input [4:0] I2CupAddr,
	input LVDSA_pwr, LVDSB_pwr, SRCsel, TMReg_Reset,
	input [7:0] samples_after_trigger, lookback_windows, number_of_samples,
	output reg sync, dreset, tok_a_in, sin, pclk, sclk, trig_top,
	output scl, sda_out, sda_dir
);
	reg [31:0] counter1 = 0;
	reg [31:0] counter2 = 0;
	reg [31:0] counter3 = 0;
	reg mode3 = 0;
	reg mode2 = 0;
	reg mode1 = 0;
	localparam TIMING_CONSTANT = SIMULATION ? 1 : 100; // 20=bad; 70=bad; 100=good; 150=bad; 200=worse
	always @(posedge clock) begin
		if (reset) begin
			counter3 <= 0;
			sync <= 0;
			dreset <= 0;
			mode3 <= 0;
		end else begin
			counter3 <= counter3 + 1'b1;
			if (mode3==1'b1) begin
				if (1*TIMING_CONSTANT==counter3) begin
					dreset <= 1'b1;
				end else if (2*TIMING_CONSTANT==counter3) begin
					dreset <= 0;
				end else if (3*TIMING_CONSTANT==counter3) begin
					sync <= 1'b1;
				end else if (4*TIMING_CONSTANT==counter3) begin
					sync <= 0;
				end else if (5*TIMING_CONSTANT==counter3) begin
					mode3 <= 1'b0;
				end else begin
				end
			end
			if (initiate_dreset_sequence) begin
				counter3 <= 0;
				sync <= 0;
				dreset <= 0;
				mode3 <= 1'b1;
			end
		end
	end
	localparam ADC_CONVERSION_TIME = SIMULATION ? 400 : 2*4096;
	always @(posedge clock) begin
		if (reset) begin
			counter1 <= 0;
			tok_a_in <= 0;
			trig_top <= 0;
			mode1 <= 0;
		end else begin
			counter1 <= counter1 + 1'b1;
			if (mode1==1'b1) begin
				if (1*TIMING_CONSTANT==counter1) begin
					trig_top <= 1'b1;
				end else if (2*TIMING_CONSTANT==counter1) begin
					trig_top <= 0;
				end else if (3*TIMING_CONSTANT+ADC_CONVERSION_TIME==counter1) begin
					tok_a_in <= 1'b1;
				end else if (4*TIMING_CONSTANT+ADC_CONVERSION_TIME==counter1) begin
					tok_a_in <= 0;
				end else if (5*TIMING_CONSTANT+ADC_CONVERSION_TIME==counter1) begin
					mode1 <= 1'b0;
				end else begin
				end
			end
			if (initiate_trigger) begin
				counter1 <= 0;
				tok_a_in <= 0;
				trig_top <= 0;
				mode1 <= 1'b1;
			end
		end
	end
	localparam LEGACY_SERIAL_CONSTANT = SIMULATION ? 1 : 50;
	wire [1:0] CMPbias_address = 2'b00;
	wire [1:0] ISEL_address    = 2'b01;
	wire [1:0] SBbias_address  = 2'b10;
	wire [1:0] DBbias_address  = 2'b11;
	wire [15:0] data_word [3:0];
	assign data_word[0] = { 2'b00, CMPbias_address, CMPbias };
	assign data_word[1] = { 2'b00, ISEL_address,    ISEL };
	assign data_word[2] = { 2'b00, SBbias_address,  SBbias };
	assign data_word[3] = { 2'b00, DBbias_address,  DBbias };
	reg [3:0] bit_counter = 0;
	reg [1:0] word_counter = 0;
	always @(posedge clock) begin
		if (reset) begin
			counter2 <= 0;
			sin <= 0;
			sclk <= 0;
			pclk <= 0;
			bit_counter <= 15;
			word_counter <= 0;
			mode2 <= 0;
		end else begin
			counter2 <= counter2 + 1'b1;
			if (mode2==1'b1) begin
				if          (1*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (2*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (3*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (4*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (5*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (6*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (7*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (8*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (9*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (10*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (11*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (12*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (13*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (14*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (15*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (16*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (17*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (18*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (19*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (20*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (21*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (22*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (23*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (24*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (25*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (26*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (27*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (28*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (29*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (30*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (31*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (32*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (33*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (34*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (35*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (36*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (37*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (38*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (39*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (40*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (41*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (42*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (43*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (44*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (45*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
					bit_counter <= bit_counter - 1'b1;
				end else if (46*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= data_word[word_counter][bit_counter];
				end else if (47*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b1;
				end else if (48*LEGACY_SERIAL_CONSTANT==counter2) begin
					sclk <= 1'b0;
				end else if (49*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= 1'b0;
				end else if (50*LEGACY_SERIAL_CONSTANT==counter2) begin
					pclk <= 1'b1;
				end else if (63*LEGACY_SERIAL_CONSTANT==counter2) begin
					pclk <= 1'b0;
				end else if (64*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= 1'b1;
				end else if (65*LEGACY_SERIAL_CONSTANT==counter2) begin
					pclk <= 1'b1;
				end else if (78*LEGACY_SERIAL_CONSTANT==counter2) begin
					pclk <= 1'b0;
				end else if (79*LEGACY_SERIAL_CONSTANT==counter2) begin
					sin <= 1'b0;
				end else if (81*LEGACY_SERIAL_CONSTANT==counter2) begin
					if (word_counter==2'b11) begin
						mode2 <= 1'b0;
					end else begin
						counter2 <= 0;
						sin <= 0;
						sclk <= 0;
						pclk <= 0;
						bit_counter <= 15;
						word_counter <= word_counter + 1'b1;
					end
				end else begin
					// no operation
				end
			end
			if (initiate_legacy_serial_sequence) begin
				counter2 <= 0;
				sin <= 0;
				sclk <= 0;
				pclk <= 0;
				bit_counter <= 15;
				word_counter <= 0;
				mode2 <= 1'b1;
			end
		end
	end
	// ----------------------------------------------------------------------
	wire [2:0] i2c_address_pins = 3'b000; // hard-coded on alpha-eval-toupee revC and revD
	reg [3:0] i2c_register = 0;
	wire [6:0] address = { i2c_address_pins, i2c_register };
	wire [7:0] i2c_value [15:0];
	//wire [6:0] address = 7'h70; // i2c multiplexer for testing
	//wire [6:0] address = 7'h39; // i2c spectral analyzer for testing
	// ----------------------------------------------------------------------
	// 00 I2C_trigger
	//assign i2c_value[0] = 0; // I2C trigger
	// ----------------------------------------------------------------------
	// 01 SRC register:
	//wire [4:0] I2CupAddr = 5'h17;
	//wire LVDSB_pwr = 0;
	//wire LVDSA_pwr = 0;
	//wire SRCsel = 0; // set this to zero or the data will come from data_b (you probably don't want that)
	//wire [7:0] ASICID = { I2CupAddr, i2c_address_pins };
	assign i2c_value[1] = { I2CupAddr, LVDSB_pwr, LVDSA_pwr, SRCsel }; // SRC
	// ----------------------------------------------------------------------
	// 02 RST: TMReg_Reset
	assign i2c_value[2] = TMReg_Reset; // any write to this address switches DAC control temporarily back to I2C and clears the DAC registers no matter the setting of the LS_I2C pin, so don't write anything to this address
	// ----------------------------------------------------------------------
	// 03 SAT: samples after trigger
	//wire [7:0] samples_after_trigger = 8'h10;
	assign i2c_value[3] = samples_after_trigger; // SAT
	// ----------------------------------------------------------------------
	// 04 LBW: lookback windows
	//wire [7:0] lookback_windows = 8'h20;
	assign i2c_value[4] = lookback_windows; // LBW
	// ----------------------------------------------------------------------
	// 05 nSP: number of samples
	//wire [7:0] number_of_samples = 8'h00; // 0 here means 256
	assign i2c_value[5] = number_of_samples; // nSP
	// ----------------------------------------------------------------------
	// 06 OSs: status?
	// ----------------------------------------------------------------------
	// 07 ALP: asic version?
	// ----------------------------------------------------------------------
	// 08 trigger_select_c:
	// ----------------------------------------------------------------------
	// 09 token_edge_detection_c:
	// ----------------------------------------------------------------------
	// 10 oBL: not implemented
	// ----------------------------------------------------------------------
	// 11 PCLK_period: for writing to DAC registers
	// ----------------------------------------------------------------------
	// 12 DBL: least significant nybbles
	// ----------------------------------------------------------------------
	// 13 DBM: most significant nybble
	// ----------------------------------------------------------------------
	// 14 pclk: 4 bits corresponding to the 4 DACs
	// ----------------------------------------------------------------------
	// 15 pck: not implemented
	// ----------------------------------------------------------------------
	wire [15:0] i2c_address_register_enables = 16'b_0000_0000_0011_1010; // nSP, LBW, SAT, SRC
	//wire [15:0] i2c_address_register_enables = 16'b_1111_1111_1111_1111; // for testing
	reg i2c_working_on_some_transfers = 0;
	reg i2c_transitioning_to_the_next_transfer = 0;
	reg i2c_inner_start_transfer = 0;
	wire i2c_transfer_complete;
	always @(posedge clock) begin
		i2c_inner_start_transfer <= 0;
		if (reset) begin
			i2c_register <= 0;
			i2c_working_on_some_transfers <= 0;
			i2c_transitioning_to_the_next_transfer <= 0;
		end else begin
			if (i2c_working_on_some_transfers) begin
				if (i2c_transfer_complete && ~i2c_inner_start_transfer) begin
					if (i2c_transitioning_to_the_next_transfer) begin
						if (i2c_register==15) begin
							i2c_working_on_some_transfers <= 0;
						end else begin
							i2c_register <= i2c_register + 1'b1;
						end
						i2c_transitioning_to_the_next_transfer <= 0;
					end else begin
						if (i2c_address_register_enables[i2c_register]) begin
							i2c_inner_start_transfer <= 1;
						end
						i2c_transitioning_to_the_next_transfer <= 1;
					end
				end
			end
			if (initiate_i2c_transfer) begin
				i2c_register <= 0;
				i2c_working_on_some_transfers <= 1;
				i2c_transitioning_to_the_next_transfer <= 0;
			end
		end
	end
	// ----------------------------------------------------------------------
	if (0) begin // just to see responses from each i2c address
		if (SIMULATION) begin
			i2c_poll_address_for_nack #(.CLOCK_DIVIDE_RATIO(4))
				i2c_poller (.clock(clock), .address(address), .scl(scl), .sda_out(sda_out), .sda_dir(sda_dir),
				.busy(), .nack(), .error(), .sda_in(sda_in),
				.start_transfer(i2c_inner_start_transfer), .transfer_complete(i2c_transfer_complete));
		end else begin
			i2c_poll_address_for_nack #(.CLOCK_FREQUENCY_IN_HZ(100000000), .DESIRED_I2C_FREQUENCY_IN_HZ(100000))
				i2c_poller (.clock(clock), .address(address), .scl(scl), .sda_out(sda_out), .sda_dir(sda_dir),
				.busy(), .nack(), .error(), .sda_in(sda_in),
				.start_transfer(i2c_inner_start_transfer), .transfer_complete(i2c_transfer_complete));
		end
	end else begin
		if (SIMULATION) begin
			i2c_write_value_to_address #(.CLOCK_DIVIDE_RATIO(4))
				thing (.clock(clock), .address(address), .value(i2c_value[i2c_register]),
				.scl(scl), .sda_out(sda_out), .sda_dir(sda_dir), .busy(), .nack(), .error(),
				.sda_in(sda_in), .start_transfer(i2c_inner_start_transfer), .transfer_complete(i2c_transfer_complete));
		end else begin
			i2c_write_value_to_address #(.CLOCK_FREQUENCY_IN_HZ(100000000), .DESIRED_I2C_FREQUENCY_IN_HZ(100000))
				thing (.clock(clock), .address(address), .value(i2c_value[i2c_register]),
				.scl(scl), .sda_out(sda_out), .sda_dir(sda_dir), .busy(), .nack(), .error(),
				.sda_in(sda_in), .start_transfer(i2c_inner_start_transfer), .transfer_complete(i2c_transfer_complete));
		end
	end
endmodule

module alpha_control_tb;
	localparam half_clock_period = 4;
	localparam clock_period = 2*half_clock_period;
	reg clock = 0;
	reg reset = 1;
	reg initiate_trigger = 0;
	reg initiate_legacy_serial_sequence = 0;
	reg initiate_dreset_sequence = 0;
	reg initiate_i2c_transfer = 0;
	wire sync, dreset, tok_a_in;
	wire scl, sda_out, sda_dir, sin, pclk, sclk, trig_top;
	reg sda_in = 0;
	initial begin
		reset <= 1; #101; reset <= 0;
		#100;
		initiate_dreset_sequence <= 1; #clock_period; initiate_dreset_sequence <= 0; #600;
		initiate_legacy_serial_sequence <= 1; #clock_period; initiate_legacy_serial_sequence <= 0; #4000;
		initiate_i2c_transfer <= 1; #clock_period; initiate_i2c_transfer <= 0; #34000;
		initiate_trigger <= 1; #clock_period; initiate_trigger <= 0; #4000;
		#400;
		$finish;
	end
	always begin
		clock <= ~clock;
		#half_clock_period;
	end
	alpha_control #(.SIMULATION(1)) alpha_control (.clock(clock), .reset(reset), .initiate_trigger(initiate_trigger), .initiate_legacy_serial_sequence(initiate_legacy_serial_sequence), .initiate_dreset_sequence(initiate_dreset_sequence), .initiate_i2c_transfer(initiate_i2c_transfer), .sync(sync), .dreset(dreset), .tok_a_in(tok_a_in), .scl(scl), .sda_in(sda_in), .sda_out(sda_out), .sda_dir(sda_dir), .sin(sin), .pclk(pclk), .sclk(sclk), .trig_top(trig_top));
endmodule

// this module is ALWAYS hunting for the pattern a1fa...
module alpha_readout (
	input clock, reset, data_a,
	output [3:0] nybble,
	output reg header = 0,
	output reg meat = 0,
	output reg footer = 0,
	output reg [31:0] alfa_counter = 0,
	output reg [31:0] omga_counter = 0,
	output strobe,
	output msn,
	output [1:0] nybble_counter,
	output reg [15:0] data_word = 0
);
	localparam DATA_WIDTH = 16;
	localparam METASTABILITY_BUFFER_SIZE = 3;
	localparam EXTRA_WIDTH = 4;
	localparam SR_HIGH_BIT = DATA_WIDTH + METASTABILITY_BUFFER_SIZE + EXTRA_WIDTH;
	localparam SR_PICKOFF = SR_HIGH_BIT - 4;
	reg [SR_HIGH_BIT:0] data_sr = 0;
	reg [3:0] data_bit_counter = 0;
	reg [12:0] data_word_counter = 0;
	localparam DATA_WORD_COUNTER_MAX = 16+16*256+16+100;
	wire [15:0] ALFA = 16'ha1fa;
	wire [15:0] OMGA = 16'h0e6a;
	reg strobe_valid = 0;
	always @(posedge clock) begin
		if (reset) begin
			data_bit_counter <= 15;
			data_word_counter <= 0;
			data_word <= 0;
			header <= 0;
			meat <= 0;
			footer <= 0;
			data_sr <= 0;
			strobe_valid <= 0;
			alfa_counter <= 0;
			omga_counter <= 0;
		end else begin
			data_sr <= { data_sr[SR_HIGH_BIT-1:0], data_a };
			data_bit_counter <= data_bit_counter - 1'b1;
			if (data_word_counter<DATA_WORD_COUNTER_MAX) begin
				if (data_bit_counter==0) begin
					data_word <= data_sr[SR_PICKOFF-1-:16];
					data_word_counter <= data_word_counter + 1'b1;
					header <= 0;
					footer <= 0;
				end
			end else begin
				header <= 0;
				meat <= 0;
				footer <= 0;
				data_bit_counter <= 0; // 2 least significant bits must not be 2'b01 (see assignment for strobe, below)
			end
			if (data_sr[SR_PICKOFF-1-:16]==ALFA) begin // WARNING: this might accidentally re-bitslip align on data 0x1fa from channel 0xa (might need a deeper pipeline and to check that the very next word is 16'hb... or something)
				strobe_valid <= 1;
				data_bit_counter <= 15;
				data_word_counter <= 0;
				header <= 1'b1;
				meat <= 1'b1;
				data_word <= data_sr[SR_PICKOFF-1-:16];
				alfa_counter <= alfa_counter + 1'b1;
			end else if (data_sr[SR_PICKOFF-1-:16]==OMGA) begin // WARNING: this might accidentally re-bitslip align on data 0x0e6a from channel 0x0
				header <= 0;
				meat <= 0;
				footer <= 1'b1;
//				data_bit_counter <= 0; // 2 least significant bits must not be 2'b01 (see assignment for strobe, below)
				data_word_counter <= DATA_WORD_COUNTER_MAX - 1;
				omga_counter <= omga_counter + 1'b1;
			end
		end
	end
	assign msn = nybble_counter == 2'b11 ? 1'b1 : 1'b0;
	wire potential_strobe = data_bit_counter[1:0] == 2'b01 ? 1'b1 : 1'b0;
	assign strobe = potential_strobe & strobe_valid;
	assign nybble_counter = data_bit_counter[3:2];
	wire [3:0] nyb [3:0];
	assign nyb[0] = data_word[3:0];
	assign nyb[1] = data_word[7:4];
	assign nyb[2] = data_word[11:8];
	assign nyb[3] = data_word[15:12];
	assign nybble = nyb[nybble_counter];
endmodule

module alpha_readout_tb;
	localparam half_clock_period = 16;
	localparam clock_period = 2*half_clock_period;
	reg clock = 0;
	reg reset = 1;
	reg dat_a_t2f = 0;
	wire header;
	wire [3:0] nybble;
	wire [1:0] nybble_counter;
	wire [15:0] data_word;
	wire msn; // most significant nybble
	initial begin
		reset <= 1;
		#100;
		reset <= 0;
		#100;
		// blah
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period;
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 1; #clock_period;
		dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 0; #clock_period;
		dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 0; #clock_period;
		// 0xa
		dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 0; #clock_period;
		// 0x1
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period;
		// 0xf
		dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 1; #clock_period;
		// 0xa
		dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 0; #clock_period;
		// blah
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period;
		// blah
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period;
		// blah
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period;
		// blah
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period;
		// 0x3
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 1; #clock_period;
		// 0x4
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period;
		// 0x5
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period;
		// 0x6
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 1; #clock_period; dat_a_t2f <= 0; #clock_period;
		// blah
		dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period; dat_a_t2f <= 0; #clock_period;
		#100;
		$finish;
	end
	alpha_readout alpha_readout (.clock(clock), .reset(reset), .data_a(dat_a_t2f), .header(header), .msn(msn), .nybble(nybble), .nybble_counter(nybble_counter), .data_word(data_word));
	always begin
		clock <= ~clock;
		#half_clock_period;
	end
endmodule

`endif

