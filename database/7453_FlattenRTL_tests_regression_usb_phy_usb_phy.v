// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module usb_phy(
	input		clk,
	input		rst,
	input		phy_tx_mode,
	output		usb_rst,
	output		txdp,
	output		txdn,
	output 		txoe,
	input		rxd,
	input		rxdp,
	input	    rxdn,
	input	[7:0]	DataOut_i,
	input		TxValid_i,
	output		TxReady_o,
	output	[7:0]	DataIn_o,
	output		RxValid_o,
	output		RxActive_o,
	output		RxError_o,
	output	[1:0]	LineState_o
);



///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

reg	[4:0]	rst_cnt;
reg		usb_rst;
wire		fs_ce;
wire		rst;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

///////////////////////////////////////////////////////////////////
//
// TX Phy
//

usb_tx_phy i_tx_phy(
	.clk(		clk		),
	.rst(		rst		),
	.fs_ce(		fs_ce		),
	.phy_mode(	phy_tx_mode	),

	// Transciever Interface
	.txdp(		txdp		),
	.txdn(		txdn		),
	.txoe(		txoe		),

	// UTMI Interface
	.DataOut_i(	DataOut_i	),
	.TxValid_i(	TxValid_i	),
	.TxReady_o(	TxReady_o	)
	);

///////////////////////////////////////////////////////////////////
//
// RX Phy and DPLL
//

usb_rx_phy i_rx_phy(
	.clk(		clk		),
	.rst(		rst		),
	.fs_ce(		fs_ce		),

	// Transciever Interface
	.rxd(		rxd		),
	.rxdp(		rxdp		),
	.rxdn(		rxdn		),

	// UTMI Interface
	.DataIn_o(	DataIn_o	),
	.RxValid_o(	RxValid_o	),
	.RxActive_o(	RxActive_o	),
	.RxError_o(	RxError_o	),
	.RxEn_i(	txoe		),
	.LineState(	LineState_o	)
	);

///////////////////////////////////////////////////////////////////
//
// Generate an USB Reset is we see SE0 for at least 2.5uS
//

always @(posedge clk or negedge rst)
	if(!rst)			rst_cnt <= 5'h0;
	else
	if(LineState_o != 2'h0)		rst_cnt <= 5'h0;
	else	
	if(!usb_rst && fs_ce)		rst_cnt <= rst_cnt + 5'h1;

always @(posedge clk or negedge rst)
	if(!rst)	usb_rst <= 1'b0;
	else usb_rst <= (rst_cnt == 5'h1f);

endmodule

module usb_rx_phy(	
	input		clk,
	input		rst,
	output	reg	fs_ce,
	input		rxd,
	input		rxdp,
	input	    rxdn,
	output	[7:0]	DataIn_o,
	output		RxValid_o,
	output		RxActive_o,
	output		RxError_o,
	input		RxEn_i,
	output 	[1:0]	LineState
);



///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

reg		rxd_s0;
reg 	rxd_s1;
reg		rxd_s;
reg		rxdp_s0;
reg     rxdp_s1;
reg     rxdp_s;
reg		rxdp_s_r;
reg		rxdn_s0;
reg     rxdn_s1;
reg     rxdn_s;
reg		rxdn_s_r;
reg		synced_d;
wire	k;
wire	j;
wire    se0;
reg		rxd_r;
reg		rx_en;
reg		rx_active;
reg	[2:0]	bit_cnt;
reg		rx_valid1;
reg     rx_valid;
reg		shift_en;
reg		sd_r;
reg		sd_nrzi;
reg	[7:0]	hold_reg;
wire		drop_bit;	// Indicates a stuffed bit
reg	[2:0]	one_cnt;
reg	[1:0]	dpll_state; 
reg	[1:0]   dpll_next_state;
reg		fs_ce_d;
wire		change;
wire		lock_en;
reg	[2:0]	fs_state;
reg [2:0]   fs_next_state;
reg		rx_valid_r;
reg		sync_err_d;
reg     sync_err;
reg		bit_stuff_err;
reg		se0_r;
reg     byte_err;
reg		se0_s;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

assign RxActive_o = rx_active;
assign RxValid_o = rx_valid;
assign RxError_o = sync_err | bit_stuff_err | byte_err;
assign DataIn_o = hold_reg;
assign LineState = {rxdn_s1, rxdp_s1};

always @(posedge clk)	rx_en <= RxEn_i;
always @(posedge clk)	sync_err <= !rx_active & sync_err_d;

///////////////////////////////////////////////////////////////////
//
// Synchronize Inputs
//

// First synchronize to the local system clock to
// avoid metastability outside the sync block (*_s0).
// Then make sure we see the signal for at least two
// clock cycles stable to avoid glitches and noise

always @(posedge clk)	rxd_s0  <= rxd;
always @(posedge clk)	rxd_s1  <= rxd_s0;
always @(posedge clk)							// Avoid detecting Line Glitches and noise
	if(rxd_s0 && rxd_s1)	rxd_s <= 1'b1;
	else
	if(!rxd_s0 && !rxd_s1)	rxd_s <= 1'b0;

always @(posedge clk)	rxdp_s0  <= rxdp;
always @(posedge clk)	rxdp_s1  <= rxdp_s0;
always @(posedge clk)	rxdp_s_r <= rxdp_s0 & rxdp_s1;
always @(posedge clk)	rxdp_s   <= (rxdp_s0 & rxdp_s1) | rxdp_s_r;	// Avoid detecting Line Glitches and noise

always @(posedge clk)	rxdn_s0  <= rxdn;
always @(posedge clk)	rxdn_s1  <= rxdn_s0;
always @(posedge clk)	rxdn_s_r <= rxdn_s0 & rxdn_s1;
always @(posedge clk)	rxdn_s   <= (rxdn_s0 & rxdn_s1) | rxdn_s_r;	// Avoid detecting Line Glitches and noise

assign k = !rxdp_s &  rxdn_s;
assign j =  rxdp_s & !rxdn_s;
assign se0 = !rxdp_s & !rxdn_s;

always @(posedge clk)	if(fs_ce)	se0_s <= se0;

///////////////////////////////////////////////////////////////////
//
// DPLL
//

// This design uses a clock enable to do 12Mhz timing and not a
// real 12Mhz clock. Everything always runs at 48Mhz. We want to
// make sure however, that the clock enable is always exactly in
// the middle between two virtual 12Mhz rising edges.
// We monitor rxdp and rxdn for any changes and do the appropiate
// adjustments.
// In addition to the locking done in the dpll FSM, we adjust the
// final latch enable to compensate for various sync registers ...

// Allow lockinf only when we are receiving
assign	lock_en = rx_en;

always @(posedge clk)	rxd_r <= rxd_s;

// Edge detector
assign change = rxd_r != rxd_s;

always @(posedge clk or negedge rst)
	if(!rst)	dpll_state <= 2'h1;
	else		dpll_state <= dpll_next_state;

always @(dpll_state or lock_en or change)
   begin
	fs_ce_d = 1'b0;
	case(dpll_state)	// synopsys full_case parallel_case
	   2'h0:
		if(lock_en && change)	dpll_next_state = 2'h0;
		else			dpll_next_state = 2'h1;
	   2'h1:begin
		fs_ce_d = 1'b1;
		if(lock_en && change)	dpll_next_state = 2'h3;
		else			dpll_next_state = 2'h2;
		end
	   2'h2:
		if(lock_en && change)	dpll_next_state = 2'h0;
		else			dpll_next_state = 2'h3;
	   2'h3:
		if(lock_en && change)	dpll_next_state = 2'h0;
		else			dpll_next_state = 2'h0;
	endcase
   end

// Compensate for sync registers at the input - allign full speed
// clock enable to be in the middle between two bit changes ...
reg	fs_ce_r1, fs_ce_r2;

always @(posedge clk)	fs_ce_r1 <= fs_ce_d;
always @(posedge clk)	fs_ce_r2 <= fs_ce_r1;
always @(posedge clk)	fs_ce <= fs_ce_r2;


///////////////////////////////////////////////////////////////////
//
// Find Sync Pattern FSM
//

parameter	FS_IDLE	= 3'h0,
		K1	= 3'h1,
		J1	= 3'h2,
		K2	= 3'h3,
		J2	= 3'h4,
		K3	= 3'h5,
		J3	= 3'h6,
		K4	= 3'h7;

always @(posedge clk or negedge rst)
	if(!rst)	fs_state <= FS_IDLE;
	else		fs_state <= fs_next_state;

always @(fs_state or fs_ce or k or j or rx_en or rx_active or se0 or se0_s)
   begin
	synced_d = 1'b0;
	sync_err_d = 1'b0;
	fs_next_state = fs_state;
	if(fs_ce && !rx_active && !se0 && !se0_s)
	   case(fs_state)	// synopsys full_case parallel_case
		FS_IDLE:
		     begin
			if(k && rx_en)	fs_next_state = K1;
		     end
		K1:
		     begin
			if(j && rx_en)	fs_next_state = J1;
			else
			   begin
					sync_err_d = 1'b1;
					fs_next_state = FS_IDLE;
			   end
		     end
		J1:
		     begin
			if(k && rx_en)	fs_next_state = K2;
			else
			   begin
					sync_err_d = 1'b1;
					fs_next_state = FS_IDLE;
			   end
		     end
		K2:
		     begin
			if(j && rx_en)	fs_next_state = J2;
			else
			   begin
					sync_err_d = 1'b1;
					fs_next_state = FS_IDLE;
			   end
		     end
		J2:
		     begin
			if(k && rx_en)	fs_next_state = K3;
			else
			   begin
					sync_err_d = 1'b1;
					fs_next_state = FS_IDLE;
			   end
		     end
		K3:
		     begin
			if(j && rx_en)	fs_next_state = J3;
			else
			if(k && rx_en)
			   begin
					fs_next_state = FS_IDLE;	// Allow missing first K-J
					synced_d = 1'b1;
			   end
			else
			   begin
					sync_err_d = 1'b1;
					fs_next_state = FS_IDLE;
			   end
		     end
		J3:
		     begin
			if(k && rx_en)	fs_next_state = K4;
			else
			   begin
					sync_err_d = 1'b1;
					fs_next_state = FS_IDLE;
			   end
		     end
		K4:
		     begin
			if(k)	synced_d = 1'b1;
			fs_next_state = FS_IDLE;
		     end
	   endcase
   end

///////////////////////////////////////////////////////////////////
//
// Generate RxActive
//

always @(posedge clk or negedge rst)

	if(!rst)		rx_active <= 1'b0;
	else
	if(synced_d && rx_en)	rx_active <= 1'b1;
	else
	if(se0 && rx_valid_r)	rx_active <= 1'b0;

always @(posedge clk)
	if(rx_valid)	rx_valid_r <= 1'b1;
	else
	if(fs_ce)	rx_valid_r <= 1'b0;

///////////////////////////////////////////////////////////////////
//
// NRZI Decoder
//

always @(posedge clk)
	if(fs_ce)	sd_r <= rxd_s;

always @(posedge clk or negedge rst)
	if(!rst)		sd_nrzi <= 1'b0;
	else
	if(!rx_active)		sd_nrzi <= 1'b1;
	else
	if(rx_active && fs_ce)	sd_nrzi <= !(rxd_s ^ sd_r);

///////////////////////////////////////////////////////////////////
//
// Bit Stuff Detect
//

always @(posedge clk or negedge rst)

	if(!rst)	one_cnt <= 3'h0;
	else
	if(!shift_en)	one_cnt <= 3'h0;
	else
	if(fs_ce)
	   begin
		if(!sd_nrzi || drop_bit)	one_cnt <= 3'h0;
		else				one_cnt <= one_cnt + 3'h1;
	   end

assign drop_bit = (one_cnt==3'h6);

always @(posedge clk)	bit_stuff_err <= drop_bit & sd_nrzi & fs_ce & !se0 & rx_active; // Bit Stuff Error

///////////////////////////////////////////////////////////////////
//
// Serial => Parallel converter
//

always @(posedge clk)
	if(fs_ce)	shift_en <= synced_d | rx_active;

always @(posedge clk)
	if(fs_ce && shift_en && !drop_bit)
		hold_reg <= {sd_nrzi, hold_reg[7:1]};

///////////////////////////////////////////////////////////////////
//
// Generate RxValid
//

always @(posedge clk or negedge rst)
	if(!rst)		bit_cnt <= 3'b0;
	else
	if(!shift_en)		bit_cnt <= 3'h0;
	else
	if(fs_ce && !drop_bit)	bit_cnt <= bit_cnt + 3'h1;

always @(posedge clk or negedge rst)
	if(!rst)					rx_valid1 <= 1'b0;
	else
	if(fs_ce && !drop_bit && (bit_cnt==3'h7))	rx_valid1 <= 1'b1;
	else
	if(rx_valid1 && fs_ce && !drop_bit)		rx_valid1 <= 1'b0;

always @(posedge clk)	rx_valid <= !drop_bit & rx_valid1 & fs_ce;

always @(posedge clk)	se0_r <= se0;

always @(posedge clk)	byte_err <= se0 & !se0_r & (|bit_cnt[2:1]) & rx_active;

endmodule

module usb_tx_phy(
		input		clk,
		input		rst,
		input		fs_ce,
		input		phy_mode,
		output	reg	txdp,
		output	reg	txdn,
		output	reg	 txoe,
		input	[7:0]	DataOut_i,
		input		TxValid_i,
		output	reg	TxReady_o
);



///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

parameter	IDLE	= 3'd0,
		SOP	= 3'h1,
		DATA	= 3'h2,
		EOP1	= 3'h3,
		EOP2	= 3'h4,
		WAIT	= 3'h5;

reg	[2:0]	state;
reg [2:0]   next_state;
reg		tx_ready_d;
reg		ld_sop_d;
reg		ld_data_d;
reg		ld_eop_d;
reg		tx_ip;
reg		tx_ip_sync;
reg	[2:0]	bit_cnt;
reg	[7:0]	hold_reg;
reg	[7:0]	hold_reg_d;

reg		sd_raw_o;
wire		hold;
reg		data_done;
reg		sft_done;
reg		sft_done_r;
wire		sft_done_e;
reg		ld_data;
wire		eop_done;
reg	[2:0]	one_cnt;
wire		stuff;
reg		sd_bs_o;
reg		sd_nrzi_o;
reg		append_eop;
reg		append_eop_sync1;
reg		append_eop_sync2;
reg		append_eop_sync3;
reg		append_eop_sync4;
reg		txoe_r1;
reg     txoe_r2;


///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

always @(posedge clk or negedge rst)
	if(!rst)	TxReady_o <= 1'b0;
	else		TxReady_o <= tx_ready_d & TxValid_i;

always @(posedge clk) ld_data <= ld_data_d;

///////////////////////////////////////////////////////////////////
//
// Transmit in progress indicator
//

always @(posedge clk or negedge rst)
	if(!rst)	tx_ip <= 1'b0;
	else
	if(ld_sop_d)	tx_ip <= 1'b1;
	else
	if(eop_done)	tx_ip <= 1'b0;

always @(posedge clk or negedge rst)
	if(!rst)		tx_ip_sync <= 1'b0;
	else
	if(fs_ce)		tx_ip_sync <= tx_ip;

// data_done helps us to catch cases where TxValid drops due to
// packet end and then gets re-asserted as a new packet starts.
// We might not see this because we are still transmitting.
// data_done should solve those cases ...
always @(posedge clk or negedge rst)
	if(!rst)			data_done <= 1'b0;
	else
	if(TxValid_i && ! tx_ip)	data_done <= 1'b1;
	else
	if(!TxValid_i)			data_done <= 1'b0;

///////////////////////////////////////////////////////////////////
//
// Shift Register
//

always @(posedge clk or negedge rst)
	if(!rst)		bit_cnt <= 3'h0;
	else
	if(!tx_ip_sync)		bit_cnt <= 3'h0;
	else
	if(fs_ce && !hold)	bit_cnt <= bit_cnt + 3'h1;

assign hold = stuff;

always @(posedge clk)
	if(!tx_ip_sync)		sd_raw_o <= 1'b0;
	else
	case(bit_cnt)	// synopsys full_case parallel_case
	   3'h0: sd_raw_o <= hold_reg_d[0];
	   3'h1: sd_raw_o <= hold_reg_d[1];
	   3'h2: sd_raw_o <= hold_reg_d[2];
	   3'h3: sd_raw_o <= hold_reg_d[3];
	   3'h4: sd_raw_o <= hold_reg_d[4];
	   3'h5: sd_raw_o <= hold_reg_d[5];
	   3'h6: sd_raw_o <= hold_reg_d[6];
	   3'h7: sd_raw_o <= hold_reg_d[7];
	endcase

always @(posedge clk)
	sft_done <= !hold & (bit_cnt == 3'h7);

always @(posedge clk)
	sft_done_r <= sft_done;

assign sft_done_e = sft_done & !sft_done_r;

// Out Data Hold Register
always @(posedge clk)
	if(ld_sop_d)	hold_reg <= 8'h80;
	else
	if(ld_data)	hold_reg <= DataOut_i;

always @(posedge clk) hold_reg_d <= hold_reg;

///////////////////////////////////////////////////////////////////
//
// Bit Stuffer
//

always @(posedge clk or negedge rst)
	if(!rst)	one_cnt <= 3'h0;
	else
	if(!tx_ip_sync)	one_cnt <= 3'h0;
	else
	if(fs_ce)
	   begin
		if(!sd_raw_o || stuff)	one_cnt <= 3'h0;
		else			one_cnt <= one_cnt + 3'h1;
	   end

assign stuff = (one_cnt==3'h6);

always @(posedge clk or negedge rst)
	if(!rst)	sd_bs_o <= 1'h0;
	else
	if(fs_ce)	sd_bs_o <= !tx_ip_sync ? 1'b0 : (stuff ? 1'b0 : sd_raw_o);

///////////////////////////////////////////////////////////////////
//
// NRZI Encoder
//

always @(posedge clk or negedge rst)
	if(!rst)			sd_nrzi_o <= 1'b1;
	else
	if(!tx_ip_sync || !txoe_r1)	sd_nrzi_o <= 1'b1;
	else
	if(fs_ce)			sd_nrzi_o <= sd_bs_o ? sd_nrzi_o : ~sd_nrzi_o;

///////////////////////////////////////////////////////////////////
//
// EOP append logic
//

always @(posedge clk or negedge rst)
	if(!rst)		append_eop <= 1'b0;
	else
	if(ld_eop_d)		append_eop <= 1'b1;
	else
	if(append_eop_sync2)	append_eop <= 1'b0;


always @(posedge clk or negedge rst)
	if(!rst)	append_eop_sync1 <= 1'b0;
	else
	if(fs_ce)	append_eop_sync1 <= append_eop;


always @(posedge clk or negedge rst)
	if(!rst)	append_eop_sync2 <= 1'b0;
	else
	if(fs_ce)	append_eop_sync2 <= append_eop_sync1;

always @(posedge clk or negedge rst)
	if(!rst)	append_eop_sync3 <= 1'b0;
	else
	if(fs_ce)	append_eop_sync3 <= append_eop_sync2 |
			(append_eop_sync3 & !append_eop_sync4);	// Make sure always 2 bit wide


always @(posedge clk or negedge rst)
	if(!rst)	append_eop_sync4 <= 1'b0;
	else
	if(fs_ce)	append_eop_sync4 <= append_eop_sync3;

assign eop_done = append_eop_sync3;

///////////////////////////////////////////////////////////////////
//
// Output Enable Logic
//


always @(posedge clk or negedge rst)
	if(!rst)	txoe_r1 <= 1'b0;
	else
	if(fs_ce)	txoe_r1 <= tx_ip_sync;


always @(posedge clk or negedge rst)
	if(!rst)	txoe_r2 <= 1'b0;
	else
	if(fs_ce)	txoe_r2 <= txoe_r1;


always @(posedge clk or negedge rst)
	if(!rst)	txoe <= 1'b1;
	else
	if(fs_ce)	txoe <= !(txoe_r1 | txoe_r2);

///////////////////////////////////////////////////////////////////
//
// Output Registers
//

always @(posedge clk or negedge rst)
	if(!rst)	txdp <= 1'b1;
	else
	if(fs_ce)	txdp <= phy_mode ?
					(!append_eop_sync3 &  sd_nrzi_o) :
					sd_nrzi_o;


always @(posedge clk or negedge rst)
	if(!rst)	txdn <= 1'b0;
	else
	if(fs_ce)	txdn <= phy_mode ?
					(!append_eop_sync3 & ~sd_nrzi_o) :
					append_eop_sync3;

///////////////////////////////////////////////////////////////////
//
// Tx Statemashine
//


always @(posedge clk or negedge rst)
	if(!rst)	state <= IDLE;
	else		state <= next_state;

always @(state or TxValid_i or data_done or sft_done_e or eop_done or fs_ce)
   begin
	next_state = state;
	tx_ready_d = 1'b0;

	ld_sop_d = 1'b0;
	ld_data_d = 1'b0;
	ld_eop_d = 1'b0;

	case(state)	// synopsys full_case parallel_case
	   IDLE:
			if(TxValid_i)
			   begin
				ld_sop_d = 1'b1;
				next_state = SOP;
			   end
	   SOP:
			if(sft_done_e)
			   begin
				tx_ready_d = 1'b1;
				ld_data_d = 1'b1;
				next_state = DATA;
			   end
	   DATA:
		   begin
			if(!data_done && sft_done_e)
			   begin
				ld_eop_d = 1'b1;
				next_state = EOP1;
			   end
			
			if(data_done && sft_done_e)
			   begin
				tx_ready_d = 1'b1;
				ld_data_d = 1'b1;
			   end
		   end
	   EOP1:
			if(eop_done)		next_state = EOP2;
	   EOP2:
			if(!eop_done && fs_ce)	next_state = WAIT;
	   WAIT:
			if(fs_ce)		next_state = IDLE;
	endcase
   end

endmodule

