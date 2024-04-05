// Configuration register
wire	 [1023:0]	LOCKINconfig;
wire	 [1023:0]	PHASEDETconfig;

assign LOCKINconfig   = configuration[5119:4096];
assign PHASEDETconfig = configuration[6143:5120];

// LOCK IN
wire   [255:0]	LOCKINconfig_IIR0;
wire   [255:0]	LOCKINconfig_IIR1;

assign LOCKINconfig_IIR0 = LOCKINconfig[399:144];
assign LOCKINconfig_IIR1 = LOCKINconfig[719:464];

reg  signed [SIGNAL_SIZE-1:0]	LOCKINin;	// input to LI_IIR0
wire signed	[15:0]				LOCKIN0;		// output from LI_IIR0, input to LockIn_inst
wire signed	[31:0]				LOCKIN1;		// output from LockIn_inst, input to LI_IIR1
wire signed [SIGNAL_SIZE-1:0]	LOCKINout;	// output from LI_IIR1

wire signed [23:0]				LOCKINlo;	// lock in local oscillator

always @(posedge clk1) begin
	case (LOCKINconfig[128])
		1'b0:	   LOCKINin <= ADCout[0];
		1'b1:	   LOCKINin <= ADCout[1];
		default:	LOCKINin <= 24'b0;
	endcase
end

IIRfilter2ndOrderSlow #(
	.SIGNAL_IN_SIZE(SIGNAL_SIZE),
	.SIGNAL_OUT_SIZE(16)
)
LI_IIR0(
	.clk_in(clk1),
	.rst_in(rst),
	.on_in(LOCKINconfig_IIR0[0]),
	.a1_in(LOCKINconfig_IIR0[50:16]),
	.a2_in(LOCKINconfig_IIR0[98:64]),
	.b0_in(LOCKINconfig_IIR0[146:112]),
	.b1_in(LOCKINconfig_IIR0[194:160]),
	.b2_in(LOCKINconfig_IIR0[242:208]),
	.signal_in(LOCKINin),
	.signal_out(LOCKIN0)
);

LockIn LockIn_inst(
	.clk_in(clk1),
	.rst_in(rst),
	.pinc_in(LOCKINconfig[423:400]),
	.poff_in(LOCKINconfig[455:432]),
	.signal_in(LOCKIN0),
	.signal_out(LOCKIN1),
	.LO_out(LOCKINlo)
);

IIRfilter2ndOrderSlow #(
	.SIGNAL_IN_SIZE(32),
	.SIGNAL_OUT_SIZE(SIGNAL_SIZE)
)
LI_IIR1(
	.clk_in(clk1),
	.rst_in(rst),
	.on_in(LOCKINconfig_IIR1[0]),
	.a1_in(LOCKINconfig_IIR1[50:16]),
	.a2_in(LOCKINconfig_IIR1[98:64]),
	.b0_in(LOCKINconfig_IIR1[146:112]),
	.b1_in(LOCKINconfig_IIR1[194:160]),
	.b2_in(LOCKINconfig_IIR1[242:208]),
	.signal_in(LOCKIN1),
	.signal_out(LOCKINout)
);

// PHASE DETECTOR
wire   [159:0]	PHASEDETconfig_IIR0;
assign PHASEDETconfig_IIR0 = PHASEDETconfig[335:176];

reg  signed [15:0]				PHASEDETin;
wire signed [31:0]				PHASEDETraw;
wire signed [SIGNAL_SIZE-1:0]	PHASEDETout;

// wire [63:0] PHASEDETdebug_out;

always @(posedge clk1) begin
	case (PHASEDETconfig[128])
		1'b0:	   PHASEDETin <= (ADCout[0] >>> (SIGNAL_SIZE - 16));
		1'b1:	   PHASEDETin <= (ADCout[1] >>> (SIGNAL_SIZE - 16));
		default:	PHASEDETin <= 32'b0;
	endcase
end

PhaseDetector #(
	.PHASE_OUT_SIZE(32)
)
PhaseDetector_inst(
	.clk_in(clk1),
	.rst_in(rst),
	.ext_clk_10MHz_in(ext_clk_10MHz),
	.use_ext_clk_in(PHASEDETconfig[129]),
	.pinc_in(PHASEDETconfig[175:144]),
	.on_in(PHASEDETconfig_IIR0[0]),
	.a1_in(PHASEDETconfig_IIR0[50:16]),
	.b0_in(PHASEDETconfig_IIR0[98:64]),
	.signal_in(PHASEDETin),
	.I_out(),
	.Q_out(),
//	.debug_in(PHASEDETconfig[399:336]),
//	.debug_out(PHASEDETdebug_out),
	.phase_out(PHASEDETraw)
);

assign PHASEDETout = PHASEDETraw; // truncate the extra bits

// Transfer function measurement DDS
wire signed [15:0] TRANSFERsin, TRANSFERcos;
wire signed [23:0] TRANSFERmod[0:2];

TransferFunction TransferFunction_inst(
	.clk_in(clk1),
	.rst_in(rst),
	.cmd_trig_in(cmd_trig),
	.cmd_addr_in(cmd_addr),
	.cmd_data1_in(cmd_data1in),
	.cmd_data2_in(cmd_data2in),
	.sin_out(TRANSFERsin),
	.cos_out(TRANSFERcos),
	.mod0_out(TRANSFERmod[0]),
	.mod1_out(TRANSFERmod[1]),
	.mod2_out(TRANSFERmod[2])
);

// DACs
wire   [255:0]	DACconfig_IIR0[0:2];
wire   [159:0]	DACconfig_IIR1[0:2];
wire   [159:0]	DACconfig_IIR2[0:2];
wire   [159:0]	DACconfig_IIR3[0:2];

wire signed [SIGNAL_SIZE+1:0]	SWEEPout[0:2];
reg  signed	[SIGNAL_SIZE-1:0]	LOOPFILTERin[0:2];	// input to chain of IIR filters
wire signed	[SIGNAL_SIZE+1:0]	LOOPFILTER0[0:2];		// output from IIR0, input to IIR1
wire signed	[SIGNAL_SIZE+1:0]	LOOPFILTER1[0:2];		// output from IIR1, input to IIR2
wire signed	[SIGNAL_SIZE+1:0]	LOOPFILTER2[0:2];		// output from IIR2, input to IIR3
wire signed	[SIGNAL_SIZE+1:0]	LOOPFILTER3[0:2];		// output from IIR3
reg  signed	[SIGNAL_SIZE+1:0]	LOOPFILTERout[0:2];	// output from chain of IIR filters
reg									LOOPFILTERholdin[0:2];
wire									LOOPFILTERhold[0:2];
reg  signed	[15:0]				RELOCKin[0:2];
wire signed [SIGNAL_SIZE+1:0]	RELOCKout[0:2];
wire 									RELOCKhold[0:2];
wire 									RELOCKclear[0:2];
reg  signed [SIGNAL_SIZE+3:0]	MODsum[0:2];
wire signed [SIGNAL_SIZE+3:0]	LIMITin[0:2];
wire			[1:0]					LIMITrailed[0:2];
wire 									LIMITclear[0:2];

// reregister these (not time critical) signals to prevent them from constraining logic placement
reg [2:0] DIN_f_hold[0:2];
reg [2:0] DIN_f_relock[0:2];

genvar dac_index;
generate for (dac_index = 0; dac_index < 3; dac_index = dac_index + 1) begin: dacs
	assign DACconfig_IIR0[dac_index] = DACconfig[dac_index][559:304];
	assign DACconfig_IIR1[dac_index] = DACconfig[dac_index][719:560];
	assign DACconfig_IIR2[dac_index] = DACconfig[dac_index][879:720];
	assign DACconfig_IIR3[dac_index] = DACconfig[dac_index][1039:880];
	
	always @(posedge clk1) DIN_f_hold[dac_index] <= DIN_f;
	always @(posedge clk1) DIN_f_relock[dac_index] <= DIN_f;
	
	Sweep #(
		.SIGNAL_OUT_SIZE(SIGNAL_SIZE)
	)
	SWEEP0(
		.clk_in(clk1),
		.on_in(DACconfig[dac_index][1040]),
		.minval_in(DACconfig[dac_index][1071:1056]),
		.maxval_in(DACconfig[dac_index][1087:1072]),
		.stepsize_in(DACconfig[dac_index][1119:1088]),
		.signal_out(SWEEPout[dac_index])
	);

	always @(posedge clk1) begin
		case (DACconfig[dac_index][180:177])
			{3'h0, 1'b0}:	LOOPFILTERin[dac_index] <=   ADCout[0] - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16));
			{3'h0, 1'b1}:	LOOPFILTERin[dac_index] <= -(ADCout[0] - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16)));
			{3'h1, 1'b0}:	LOOPFILTERin[dac_index] <=   ADCout[1] - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16));
			{3'h1, 1'b1}:	LOOPFILTERin[dac_index] <= -(ADCout[1] - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16)));
			{3'h2, 1'b0}:	LOOPFILTERin[dac_index] <=   ADCdiff - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16));
			{3'h2, 1'b1}:	LOOPFILTERin[dac_index] <= -(ADCdiff - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16)));
			{3'h3, 1'b0}:	LOOPFILTERin[dac_index] <=   LOCKINout - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16));
			{3'h3, 1'b1}:	LOOPFILTERin[dac_index] <= -(LOCKINout - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16)));
			{3'h4, 1'b0}:	LOOPFILTERin[dac_index] <=   PHASEDETout - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16));
			{3'h4, 1'b1}:	LOOPFILTERin[dac_index] <= -(PHASEDETout - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16)));
			{3'h5, 1'b0}:	LOOPFILTERin[dac_index] <=   DACin[0]  - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16));
			{3'h5, 1'b1}:	LOOPFILTERin[dac_index] <= -(DACin[0]  - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16)));
			{3'h6, 1'b0}:	LOOPFILTERin[dac_index] <=   DACin[1]  - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16));
			{3'h6, 1'b1}:	LOOPFILTERin[dac_index] <= -(DACin[1]  - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16)));
			{3'h7, 1'b0}:	LOOPFILTERin[dac_index] <=   DACin[2]  - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16));
			{3'h7, 1'b1}:	LOOPFILTERin[dac_index] <= -(DACin[2]  - ($signed(DACconfig[dac_index][207:192]) <<< (SIGNAL_SIZE - 16)));
			default:			LOOPFILTERin[dac_index] <= 16'b0 <<< (SIGNAL_SIZE - 16);
		endcase
	end

	always @(posedge clk1) begin
		case (DACconfig[dac_index][212:208])
			{4'h0, 1'b1}:	LOOPFILTERholdin[dac_index] <= RELOCKhold[0];
			{4'h1, 1'b1}:	LOOPFILTERholdin[dac_index] <= RELOCKhold[1];
			{4'h2, 1'b1}:	LOOPFILTERholdin[dac_index] <= RELOCKhold[2];
			{4'h3, 1'b1}:	LOOPFILTERholdin[dac_index] <= DIN_f_hold[dac_index][0];
			{4'h4, 1'b1}:	LOOPFILTERholdin[dac_index] <= DIN_f_hold[dac_index][1];
			{4'h5, 1'b1}:	LOOPFILTERholdin[dac_index] <= DIN_f_hold[dac_index][2];
			{4'h6, 1'b1}:	LOOPFILTERholdin[dac_index] <= !(DIN_f_hold[dac_index][0]);
			{4'h7, 1'b1}:	LOOPFILTERholdin[dac_index] <= !(DIN_f_hold[dac_index][1]);
			{4'h8, 1'b1}:	LOOPFILTERholdin[dac_index] <= !(DIN_f_hold[dac_index][2]);
			default:			LOOPFILTERholdin[dac_index] <= 1'b0;
		endcase
	end
	
	DigitalDelay DELAY0(
		.clk_in(clk1),
		.rst_in(rst),
		.falling_delay_in(DACconfig[dac_index][1231:1200]),
		.rising_delay_in(DACconfig[dac_index][1263:1232]),
		.signal_in(LOOPFILTERholdin[dac_index]),
		.signal_out(LOOPFILTERhold[dac_index])
	);

	IIRfilter2ndOrderSlowAntiWindup #(
		.SIGNAL_IN_SIZE(SIGNAL_SIZE),
		.SIGNAL_OUT_SIZE(SIGNAL_SIZE)
	)
	IIR0(
		.clk_in(clk1),
		.rst_in(rst),
		.on_in(DACconfig[dac_index][176] && DACconfig_IIR0[dac_index][0] && (!RELOCKclear[dac_index]) && (!LIMITclear[dac_index])),
		.a1_in(DACconfig_IIR0[dac_index][50:16]),
		.a2_in(DACconfig_IIR0[dac_index][98:64]),
		.b0_in(DACconfig_IIR0[dac_index][146:112]),
		.b1_in(DACconfig_IIR0[dac_index][194:160]),
		.b2_in(DACconfig_IIR0[dac_index][242:208]),
		.railed_in(LIMITrailed[dac_index]),
		.hold_in(LOOPFILTERhold[dac_index] || RELOCKhold[dac_index]),
		.signal_in(LOOPFILTERin[dac_index]),
		.signal_out(LOOPFILTER0[dac_index])
	);

	IIRfilter1stOrderAntiWindup #(
		.SIGNAL_IN_SIZE(SIGNAL_SIZE),
		.SIGNAL_OUT_SIZE(SIGNAL_SIZE)
	)
	IIR1(
		.clk_in(clk1),
		.on_in(DACconfig[dac_index][176] && DACconfig_IIR1[dac_index][0] && (!RELOCKclear[dac_index]) && (!LIMITclear[dac_index])),
		.a1_in(DACconfig_IIR1[dac_index][50:16]),
		.b0_in(DACconfig_IIR1[dac_index][98:64]),
		.b1_in(DACconfig_IIR1[dac_index][146:112]),
		.railed_in(LIMITrailed[dac_index]),
		.hold_in(LOOPFILTERhold[dac_index] || RELOCKhold[dac_index]),
		.signal_in(LOOPFILTER0[dac_index]),
		.signal_out(LOOPFILTER1[dac_index])
	);
	
	if (dac_index < 2) begin
		IIRfilter1stOrderAntiWindup #(
			.SIGNAL_IN_SIZE(SIGNAL_SIZE),
			.SIGNAL_OUT_SIZE(SIGNAL_SIZE)
		)
		IIR2(
			.clk_in(clk1),
			.on_in(DACconfig[dac_index][176] && DACconfig_IIR2[dac_index][0] && (!RELOCKclear[dac_index]) && (!LIMITclear[dac_index])),
			.a1_in(DACconfig_IIR2[dac_index][50:16]),
			.b0_in(DACconfig_IIR2[dac_index][98:64]),
			.b1_in(DACconfig_IIR2[dac_index][146:112]),
			.railed_in(LIMITrailed[dac_index]),
			.hold_in(LOOPFILTERhold[dac_index] || RELOCKhold[dac_index]),
			.signal_in(LOOPFILTER1[dac_index]),
			.signal_out(LOOPFILTER2[dac_index])
		);
		
		IIRfilter1stOrderAntiWindup #(
			.SIGNAL_IN_SIZE(SIGNAL_SIZE),
			.SIGNAL_OUT_SIZE(SIGNAL_SIZE)
		)
		IIR3(
			.clk_in(clk1),
			.on_in(DACconfig[dac_index][176] && DACconfig_IIR3[dac_index][0] && (!RELOCKclear[dac_index]) && (!LIMITclear[dac_index])),
			.a1_in(DACconfig_IIR3[dac_index][50:16]),
			.b0_in(DACconfig_IIR3[dac_index][98:64]),
			.b1_in(DACconfig_IIR3[dac_index][146:112]),
			.railed_in(LIMITrailed[dac_index]),
			.hold_in(LOOPFILTERhold[dac_index] || RELOCKhold[dac_index]),
			.signal_in(LOOPFILTER2[dac_index]),
			.signal_out(LOOPFILTER3[dac_index])
		);
		
		always @(posedge clk1) begin
			case ({DACconfig_IIR2[dac_index][0], DACconfig_IIR3[dac_index][0]})
				2'b11:	LOOPFILTERout[dac_index] <= LOOPFILTER3[dac_index];
				2'b10:	LOOPFILTERout[dac_index] <= LOOPFILTER2[dac_index];
				default:	LOOPFILTERout[dac_index] <= LOOPFILTER1[dac_index];
			endcase
		end
	end else begin
		always @(posedge clk1) begin
			LOOPFILTERout[dac_index] <= LOOPFILTER1[dac_index];
		end
	end

	always @(posedge clk1) begin
		case (DACconfig[dac_index][228:225])
			{4'h0}:	RELOCKin[dac_index] <=  ADCout[0][SIGNAL_SIZE-1:SIGNAL_SIZE-16];
			{4'h1}:	RELOCKin[dac_index] <=  ADCout[1][SIGNAL_SIZE-1:SIGNAL_SIZE-16];
			{4'h2}:	RELOCKin[dac_index] <=  ADCdiff[SIGNAL_SIZE-1:SIGNAL_SIZE-16];
			{4'h3}:	RELOCKin[dac_index] <=  LOCKINout[SIGNAL_SIZE-1:SIGNAL_SIZE-16];
			{4'h4}:	RELOCKin[dac_index] <=  PHASEDETout[SIGNAL_SIZE-1:SIGNAL_SIZE-16];
			{4'h5}:	RELOCKin[dac_index] <=  DACin[0][SIGNAL_SIZE-1:SIGNAL_SIZE-16];
			{4'h6}:	RELOCKin[dac_index] <=  DACin[1][SIGNAL_SIZE-1:SIGNAL_SIZE-16];
			{4'h7}:	RELOCKin[dac_index] <=  DACin[2][SIGNAL_SIZE-1:SIGNAL_SIZE-16];
			{4'h8}:	RELOCKin[dac_index] <=  {1'b0, DIN_f_relock[dac_index][0], 14'b0};
			{4'h9}:	RELOCKin[dac_index] <=  {1'b0, DIN_f_relock[dac_index][1], 14'b0};
			{4'hA}:	RELOCKin[dac_index] <=  {1'b0, DIN_f_relock[dac_index][2], 14'b0};
			default:	RELOCKin[dac_index] <= 16'b0;
		endcase
	end

	Relock #(
		.SIGNAL_OUT_SIZE(SIGNAL_SIZE)
	)
	RELOCK0(
		.clk_in(clk1),
		.on_in(DACconfig[dac_index][176] && DACconfig[dac_index][224]),
		.minval_in(DACconfig[dac_index][255:240]),
		.maxval_in(DACconfig[dac_index][271:256]),
		.stepsize_in(DACconfig[dac_index][303:272]),
		.signal_in(RELOCKin[dac_index]),
		.railed_in(LIMITrailed[dac_index]),
		.hold_in(LOOPFILTERhold[dac_index]),
		.hold_out(RELOCKhold[dac_index]),
		.clear_out(RELOCKclear[dac_index]),
		.signal_out(RELOCKout[dac_index])
	);
	
	always @(posedge clk1) DOUT_f[dac_index] = RELOCKhold[dac_index];
	// always @(posedge clk1) DOUT_f[dac_index] = LOOPFILTERhold[dac_index]; // for testing DigitalDelay module
	
	always @(posedge clk1) begin
		MODsum[dac_index] <= SWEEPout[dac_index] + TRANSFERmod[dac_index] + (LOCKINlo >>> DACconfig[dac_index][1156:1152]);
	end
	assign LIMITin[dac_index] = LOOPFILTERout[dac_index] + RELOCKout[dac_index] + MODsum[dac_index];

	Limit #(
		.SIGNAL_IN_SIZE(SIGNAL_SIZE),
		.SIGNAL_OUT_SIZE(SIGNAL_SIZE)
	)
	LIMIT0(
		.clk_in(clk1),
		.minval_in(DACconfig[dac_index][159:144]),
		.maxval_in(DACconfig[dac_index][175:160]),
		.center_when_railed_in(DACconfig[dac_index][1168]),
		.signal_in(LIMITin[dac_index]),
		.railed_out(LIMITrailed[dac_index]),
		.clear_out(LIMITclear[dac_index]),
		.signal_out(DACin[dac_index])
	);
	
	always @(posedge clk1) LED_G_f[dac_index] <= DACconfig[dac_index][176] ? ((RELOCKhold[dac_index] || LIMITrailed[dac_index][0] || LIMITrailed[dac_index][1]) ? LED2red[0] : LED2green[0]) : LED2off[0];
	always @(posedge clk1) LED_R_f[dac_index] <= DACconfig[dac_index][176] ? ((RELOCKhold[dac_index] || LIMITrailed[dac_index][0] || LIMITrailed[dac_index][1]) ? LED2red[1] : LED2green[1]) : LED2off[1];
end
endgenerate

parameter LED2off    = 2'b00;
parameter LED2red    = 2'b10;
parameter LED2green  = 2'b01;
parameter LED2orange = 2'b11;
