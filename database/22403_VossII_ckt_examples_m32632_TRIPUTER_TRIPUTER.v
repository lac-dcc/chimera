// This program was cloned from: https://github.com/TeamVoss/VossII
// License: Apache License 2.0

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	Version:	0.1
//	Date:		2 December 2018
//
//	Modules contained in this file:
//	1. DRAM_MOD			DRAM Model
//	2. MAINDEC			Main Decoder
//	3. UART				Universal Asynchronous Receiver & Transmitter
//	4. SRAM				External SRAM Interface
//	5. TRIPUTER			Top level of FPGA
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	1. DRAM_MOD			DRAM Model
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DRAM_MOD ( MCLK, RST_N, IC_ACC, IDRAM_ADR, DC_ACC, DC_WR, DRAM_ADR, DRAM_DI,
				  IC_MDONE, DC_MDONE, ENWR, IC_INHIBIT, DC_INHIBIT, MEM_Q );

	input			MCLK;
	input			RST_N;
	input			IC_ACC;
	input	[28:0]	IDRAM_ADR;
	input			DC_ACC;	
	input			DC_WR;
	input	[28:0]	DRAM_ADR;
	input	[35:0]	DRAM_DI;

	output	reg		IC_MDONE;	
	output	reg		DC_MDONE;	
	output			ENWR;
	output	reg		IC_INHIBIT;
	output	reg  	DC_INHIBIT;

	output	reg	[127:0]	MEM_Q;

// +++++++++++++++++++ Memories ++++++++++++++++++++

    parameter addr_msb = 16;    // total memory is 128 kB

    reg      [7:0]  EDRAM_F [0:2**(addr_msb-3)-1];  // Byte-wide RAM blocks
    reg      [7:0]  EDRAM_E [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_D [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_C [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_B [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_A [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_9 [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_8 [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_7 [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_6 [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_5 [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_4 [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_3 [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_2 [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_1 [0:2**(addr_msb-3)-1];
    reg      [7:0]  EDRAM_0 [0:2**(addr_msb-3)-1];

    wire    [15:0]  wrbyte;
    wire [addr_msb:4]   addr;
    wire            dc_active;

// +++++++++++++++++++++++++  Datapath  +++++++++++++++++++

    assign dc_active = DC_WR | (DC_ACC & ~DC_MDONE);

    assign addr = dc_active ? DRAM_ADR[addr_msb:4] : IDRAM_ADR[addr_msb:4];

    always @(posedge MCLK)
        begin
            MEM_Q[127:120] <= EDRAM_F[addr];    // READ on rising edge
            MEM_Q[119:112] <= EDRAM_E[addr];
            MEM_Q[111:104] <= EDRAM_D[addr];
            MEM_Q[103:96]  <= EDRAM_C[addr];
            MEM_Q[95:88]   <= EDRAM_B[addr];
            MEM_Q[87:80]   <= EDRAM_A[addr];
            MEM_Q[79:72]   <= EDRAM_9[addr];
            MEM_Q[71:64]   <= EDRAM_8[addr];
            MEM_Q[63:56]   <= EDRAM_7[addr];
            MEM_Q[55:48]   <= EDRAM_6[addr];
            MEM_Q[47:40]   <= EDRAM_5[addr];
            MEM_Q[39:32]   <= EDRAM_4[addr];
            MEM_Q[31:24]   <= EDRAM_3[addr];
            MEM_Q[23:16]   <= EDRAM_2[addr];
            MEM_Q[15:8]    <= EDRAM_1[addr];
            MEM_Q[7:0]     <= EDRAM_0[addr];
        end

    assign wrbyte[0]  = DC_WR & DRAM_DI[32] & (DRAM_ADR[3:2] == 2'b00);
    assign wrbyte[1]  = DC_WR & DRAM_DI[33] & (DRAM_ADR[3:2] == 2'b00);
    assign wrbyte[2]  = DC_WR & DRAM_DI[34] & (DRAM_ADR[3:2] == 2'b00);
    assign wrbyte[3]  = DC_WR & DRAM_DI[35] & (DRAM_ADR[3:2] == 2'b00);
    assign wrbyte[4]  = DC_WR & DRAM_DI[32] & (DRAM_ADR[3:2] == 2'b01);
    assign wrbyte[5]  = DC_WR & DRAM_DI[33] & (DRAM_ADR[3:2] == 2'b01);
    assign wrbyte[6]  = DC_WR & DRAM_DI[34] & (DRAM_ADR[3:2] == 2'b01);
    assign wrbyte[7]  = DC_WR & DRAM_DI[35] & (DRAM_ADR[3:2] == 2'b01);
    assign wrbyte[8]  = DC_WR & DRAM_DI[32] & (DRAM_ADR[3:2] == 2'b10);
    assign wrbyte[9]  = DC_WR & DRAM_DI[33] & (DRAM_ADR[3:2] == 2'b10);
    assign wrbyte[10] = DC_WR & DRAM_DI[34] & (DRAM_ADR[3:2] == 2'b10);
    assign wrbyte[11] = DC_WR & DRAM_DI[35] & (DRAM_ADR[3:2] == 2'b10);
    assign wrbyte[12] = DC_WR & DRAM_DI[32] & (DRAM_ADR[3:2] == 2'b11);
    assign wrbyte[13] = DC_WR & DRAM_DI[33] & (DRAM_ADR[3:2] == 2'b11);
    assign wrbyte[14] = DC_WR & DRAM_DI[34] & (DRAM_ADR[3:2] == 2'b11);
    assign wrbyte[15] = DC_WR & DRAM_DI[35] & (DRAM_ADR[3:2] == 2'b11);

    always @(posedge MCLK)
        begin
            if (wrbyte[15]) EDRAM_F[addr] <= DRAM_DI[31:24];    // WRITE on rising edge
            if (wrbyte[14]) EDRAM_E[addr] <= DRAM_DI[23:16];
            if (wrbyte[13]) EDRAM_D[addr] <= DRAM_DI[15:8];
            if (wrbyte[12]) EDRAM_C[addr] <= DRAM_DI[7:0];
            if (wrbyte[11]) EDRAM_B[addr] <= DRAM_DI[31:24];    // WRITE on rising edge
            if (wrbyte[10]) EDRAM_A[addr] <= DRAM_DI[23:16];
            if (wrbyte[9])  EDRAM_9[addr] <= DRAM_DI[15:8];
            if (wrbyte[8])  EDRAM_8[addr] <= DRAM_DI[7:0];
            if (wrbyte[7])  EDRAM_7[addr] <= DRAM_DI[31:24];    // WRITE on rising edge
            if (wrbyte[6])  EDRAM_6[addr] <= DRAM_DI[23:16];
            if (wrbyte[5])  EDRAM_5[addr] <= DRAM_DI[15:8];
            if (wrbyte[4])  EDRAM_4[addr] <= DRAM_DI[7:0];
            if (wrbyte[3])  EDRAM_3[addr] <= DRAM_DI[31:24];    // WRITE on rising edge
            if (wrbyte[2])  EDRAM_2[addr] <= DRAM_DI[23:16];
            if (wrbyte[1])  EDRAM_1[addr] <= DRAM_DI[15:8];
            if (wrbyte[0])  EDRAM_0[addr] <= DRAM_DI[7:0];
        end

// +++++++++++++++++++++++++  Controllogic  +++++++++++++++++++

	// each access takes one clock cycle inside the DRAM model. Due to the timing requirement of xx_MDONE the read
	// access is pipelined: it will take two clock cycles to serve a cache read request
	
	always @(posedge MCLK) DC_MDONE <= DC_ACC & ~DC_MDONE & ~DC_WR;
	
	always @(posedge MCLK) IC_MDONE <= IC_ACC & ~IC_MDONE & ~dc_active;
	
	always @(posedge MCLK) DC_INHIBIT <= ~DRAM_ADR[1];	// ~USE_CA => INHIBIT
	
	always @(posedge MCLK) IC_INHIBIT <= ~IDRAM_ADR[1];	// ~USE_CA => INHIBIT

	assign ENWR = 1'b1;	// always active
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	2. MAINDEC			Main Decoder
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module MAINDEC
	(BCLK, RST_N, WRITE, READ, STATUS, SRAM_RDY, ADDR, BOOT_Q, SRAM_Q, UART_Q, BE, IO_DI,
	 UART_RD, UART_WR, CESRAM, NMI_N, DRD, READY, BRESET, ENDRAM, LEDR, LEDG, HEXL, HEXM, SSW );
	
	input 			BCLK;
	input			RST_N;
	input 			WRITE;
	input 			READ;
	input	 [3:0]	STATUS;
	input			SRAM_RDY;
	input	[31:2]	ADDR;
	input   [31:0]	BOOT_Q;
	input   [31:0]	SRAM_Q;
	input	 [3:0]	BE;
	input	[31:0]	IO_DI;
	
	output			UART_RD;
	output	 [1:0]	UART_WR;
	
	input   [31:0]	UART_Q;	
	output			CESRAM;
	
	output	reg		NMI_N;
	
	output  [31:0]	DRD;
	output	reg		READY;
	output	reg		BRESET;
	output	reg		ENDRAM;	
	
	input	 [9:0]	SSW;
	
	output	reg	 [6:0]	HEXL,HEXM;
	output	reg	 [9:0]	LEDR;
	output	reg	 [7:0]	LEDG;
	
	reg	    [31:0]	DRD;
	reg				rd_rdy;
	reg		 [3:0]	init_cou;
	reg		[25:0]	counter;
	reg		 [9:0]	ssw_reg;
	reg				nmie;

	wire			wr_leds,wr_coun;
	wire			access;
	
	assign access  = WRITE | READ;
	
	assign UART_WR = (WRITE & (ADDR[31:20] == 12'h202)) ? BE[1:0] : 2'd0;
	assign UART_RD = READ   & (ADDR[31:20] == 12'h202) & BE[0];	// Read Data Reg. -> Int to 0
	assign CESRAM  = access & (ADDR[31:20] == 12'h201);
	assign wr_coun = WRITE  & (ADDR[31:20] == 12'h205) & ADDR[2];
	
	assign wr_leds = WRITE  & (ADDR[31:20] == 12'h204);

	always @(posedge BCLK) if (wr_leds &&  ADDR[2] && BE[1]) HEXM <= IO_DI[14:8];
	always @(posedge BCLK) if (wr_leds &&  ADDR[2] && BE[0]) HEXL <= IO_DI[6:0];
	always @(posedge BCLK) if (wr_leds && !ADDR[2] && BE[2]) LEDG <= IO_DI[23:16];
	always @(posedge BCLK) if (wr_leds && !ADDR[2] && BE[1]) LEDR[9:8] <= IO_DI[9:8];
	always @(posedge BCLK) if (wr_leds && !ADDR[2] && BE[0]) LEDR[7:0] <= IO_DI[7:0];

	always @(posedge BCLK) ssw_reg <= SSW;
	
	always @(posedge BCLK) rd_rdy <= READ & ((ADDR[31:20] == 12'h200) | (ADDR[31:29] == 3'd0)) & ~rd_rdy;	
	
	always @(access or ADDR or WRITE or rd_rdy or SRAM_RDY)
	  casex({access,ADDR[31:20]})
		13'b1_000x_xxxx_xxxx : READY = rd_rdy;	// if DRAM not activ
		13'b1_0010_xxxx_0000 : READY = rd_rdy;	// Boot-ROM
		13'b1_0010_xxxx_0001 : READY = SRAM_RDY;
		default				 : READY = access;	// else only one clock !!!
	  endcase
	  
	always @(ADDR or BOOT_Q or SRAM_Q or UART_Q or ssw_reg or counter or nmie)
	  casex({ADDR[31:20]})
		12'h201 : DRD = SRAM_Q;	
		12'h202 : DRD = UART_Q;
		12'h203 : DRD = {22'd0,ssw_reg[9:0]};
		12'h205 : DRD = {(ADDR[2] ? nmie : 1'd0),5'd0,counter};
		default : DRD = BOOT_Q;	// Boot-ROM
	  endcase
	
	// Program access in higher ROM area switches DRAM on
	always @(posedge BCLK) ENDRAM <= (((ADDR[31:28] == 4'h2) & (STATUS == 4'h8) & READ) | ENDRAM) & BRESET;

	// ++++++++++++++++++++++++++ NMI Counter ++++++++++++++++++++++++++
	
	always @(posedge BCLK)
		if (!BRESET) counter <= 26'd0;
		  else counter <= (counter == 26'h2FA_F07F) ? 26'd0 : counter + 26'd1;	// 50.000.000 = 2FA_F080
		  
	always @(posedge BCLK) NMI_N <= ~((counter[25:4] == 22'h2FA_F07) & nmie);	// once per second

	always @(posedge BCLK or negedge BRESET)	// NMI Enable
		if (!BRESET) nmie <= 1'b0;
		  else if (wr_coun) nmie <= IO_DI[31];	// is SET able
		  
	// ++++++++++++++++++++++++++ RESET Signal ++++++++++++++++++++++++++
	
	always @(posedge BCLK or negedge RST_N)
		if (!RST_N) init_cou <= 4'h0;
		  else init_cou <= init_cou + 4'h1;
		  
	always @(posedge BCLK or negedge RST_N)
		if (!RST_N) BRESET <= 1'b0;
		  else
			if (init_cou == 4'hF) BRESET <= 1'b1;

endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	3. UART				Universal Asynchronous Receiver & Transmitter
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module UART(BCLK, BRESET, UART_RD, UART_WR, DIN, UA_RX, UA_TX, UART_Q, UA_INT);

	input			BCLK;
	input			BRESET;
	input			UART_RD;
	input	 [1:0]	UART_WR;
	input	[15:0]	DIN;
 
	output			UA_TX;
	input			UA_RX;
 
	output	[31:0]	UART_Q;
	output			UA_INT;
 
	reg		 [1:0]	iena;	// Interrupt enable
	
	parameter baudrate = 10'd867;	// 57600 Baud : 868 clocks of 20ns
	
	// +++++++++++++++++++++++++++++++ Transmitter +++++++++++++++++++++++++++++++++
 
	reg		 [8:0]	shifter_tx;
	reg		 [3:0]	txbits;
	reg		 [9:0]	txtimer;
	reg				tx_int;
	reg				trold;
	
	wire			tx_load,tx_run,tx_shift;
 
	assign tx_load = UART_WR[0] & ~tx_run; // no Write during transmisson
 
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) shifter_tx <= 9'h1FF;
			else
				if (tx_load) shifter_tx <= {DIN[7:0],1'b0};
					else
						if (tx_shift) shifter_tx <= {1'b1,shifter_tx[8:1]}; // LSB first to send
    
	assign UA_TX = shifter_tx[0];
 
	// ---1__2_one_3_two_4_three_5_four_6_five_7_six_8_seven_9_eight_10---11
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) txbits <= 4'd0;
			else
				if (tx_load) txbits <= 4'd1;
					else
						if (tx_shift) txbits <= (txbits == 4'd10) ? 4'd0 : txbits + 4'd1;
      
	assign tx_run = |txbits;
	always @(posedge BCLK) trold <= tx_run;
 
	always @(posedge BCLK) txtimer <= (~tx_run | tx_shift) ? 10'd0 : txtimer + 10'd1;
 
	assign tx_shift = (txtimer == baudrate);

	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) tx_int <= 1'b0;
			else	
				if (tx_load) tx_int <= 1'b0;
					else
						if (UART_WR[1]) tx_int <= DIN[13];
							else
								if (!tx_run && trold) tx_int <= 1'b1;

	// +++++++++++++++++++++++++++++++ Receiver +++++++++++++++++++++++++++++++++
 
	reg		 [2:0]	inshift;
	reg		 [3:0]	rxbits;
	reg		 [8:0]	shifter_rx;
	reg		 [9:0]	rxtimer;
	reg		 [7:0]	rxhold;
	reg				inbit,oldin;
	reg				rx_int;
	reg				rx_end;
 
	wire			rx_go,rx_shift,rx_run;
 
	always @(posedge BCLK) inshift <= {inshift[1:0],UA_RX};
	
	always @(posedge BCLK) inbit <= (inshift == 3'b111) ? 1'b1 : (inshift == 3'd0) ? 1'b0 : inbit;

	always @(posedge BCLK) oldin <= inbit;
 
	assign rx_go = ~inbit & oldin & (rxbits == 4'd0);

	// --1_2__3one_4two_5three_6four_7five_8six_9seven_10eight_-11--
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) rxbits <= 4'd0;
			else
				if (rx_go) rxbits <= 4'd1;
					else
						if (rx_shift) rxbits <= (((rxbits == 4'd1) & inbit) | (rxbits == 4'd10)) ? 4'd0 : rxbits + 4'd1;
      
	always @(posedge BCLK) if (rx_shift) shifter_rx <= {inbit,shifter_rx[8:1]};
  
	always @(posedge BCLK) rxtimer <= (~rx_run | rx_shift) ? 10'd0 : rxtimer + 10'd1;
 
	assign rx_shift = (rxtimer == ((rxbits == 4'd1) ? {1'b0,baudrate[9:1]} : baudrate));
	assign rx_run = |rxbits;
 
	always @(posedge BCLK) rx_end <= rx_shift & (rxbits == 4'd10) & inbit; // Stopbit must be "1"
 
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) rx_int <= 1'b0;
			else	
				if (UART_RD) rx_int <= 1'b0;
					else
						if (UART_WR[1]) rx_int <= DIN[10];
							else
								if (rx_end) rx_int <= 1'b1;
    
	always @(posedge BCLK) if (rx_end) rxhold <= shifter_rx[7:0]; // hold received data
      
	assign UART_Q = {18'd0,tx_int,iena[1],tx_run,rx_int,iena[0],rx_run,rxhold};
 
	// +++++++++++++++++++++++++++++++ Interrupt +++++++++++++++++++++++++++++++++
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) iena <= 2'd0;
			else
				if (UART_WR[1]) iena <= {DIN[12],DIN[9]};

	assign UA_INT = (tx_int & iena[1]) | (rx_int & iena[0]);
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	4. SRAM				External SRAM Interface
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module SRAM (BCLK, BRESET, CESRAM, WRITE, AA, BE, DIN, READY, SRAM_Q, SRCO, SRAA, SRDB);

	input			BCLK;
	input			BRESET;
	input			CESRAM;
	input			WRITE;
	input	[18:1]	AA;
	input	 [3:0]	BE;
	input	[31:0]	DIN;
 
	output			READY;
	output	[31:0]	SRAM_Q;

	output	reg	 [4:0]	SRCO;
	output	reg	[17:0]	SRAA; // Word Address
	inout		[15:0]	SRDB;
 
	reg		[15:0]	do_reg;
	reg		 [2:0]	state;
	reg		[17:0]	save_aa;
	reg		 [1:0]	top_be,save_be,muxbe;
	reg		[15:0]	top_do,save_do,muxdo;
	reg		[15:0]	di_reg,pipe_reg;
	reg		[15:0]	oe_reg;
 
	wire			twoa;
	wire	[17:0]	muxadr;
	
	genvar			i;
  
	assign twoa = (BE[3] | BE[2]) & (BE[1] | BE[0]); // two Accesses
 
	always @(posedge BCLK or negedge BRESET)
	  if (!BRESET) state <= 3'd0;
		else
		  casex ({CESRAM,WRITE,twoa,state})
			6'b0x_x_000 : state <= 3'b000; // nothing to do
			6'b10_1_000 : state <= 3'b001;
			6'b10_0_000 : state <= 3'b010;
			6'b11_1_000 : state <= 3'b100;
			6'b11_0_000 : state <= 3'b110;
			// Read
			6'bxx_x_001 : state <= 3'b010;
			6'bxx_x_010 : state <= 3'b011;
			6'bxx_x_011 : state <= 3'b000; // Send READY
			// Write
			6'bxx_x_100 : state <= 3'b101;
			6'bxx_x_101 : state <= 3'b110;
			6'bxx_x_110 : state <= 3'b000; // State 7 at WRITE overlaps with State 0
			default		: state <= 3'b000;
		  endcase

	always @(posedge BCLK) save_aa <= muxadr;
  
	assign muxadr[17:1] = (CESRAM & (state == 3'd0)) ? AA[18:2] : save_aa[17:1];
	assign muxadr[0]   = (CESRAM & (state == 3'd0)) ? AA[1] : ( ((state == 3'd1) | (state == 3'd5)) ? 1'b1 : save_aa[0] );

	always @(posedge BCLK) SRAA <= muxadr;
 
	always @(posedge BCLK) if (!state[2]) top_be = ~BE[3:2];
	always @(posedge BCLK) save_be <= muxbe;
 
	always @(*)
	  casex ({CESRAM,state})
		4'b0_000 : muxbe = 2'b11;
		4'b1_000 : muxbe = AA[1] ? ~BE[3:2] : ~BE[1:0]; // READ has valid BE's
		4'bx_001 : muxbe = ~BE[3:2]; // READ is still active
		4'bx_101 : muxbe = top_be;
		4'bx_010 : muxbe = 2'b11; // State = 2 is End for READ !
		default  : muxbe = save_be;
	  endcase
  
	always @(posedge BCLK) SRCO[1:0] <= muxbe;
 
	always @(posedge BCLK) if (!state[2]) top_do <= DIN[31:16];
	always @(posedge BCLK) save_do <= muxdo;

	always @(*)
	  casex ({CESRAM,state})
		4'b1_000 : muxdo = AA[1] ? DIN[31:16] : DIN[15:0]; // READ has valid BE's
		4'bx_101 : muxdo = top_do;
		default  : muxdo = save_do;
	  endcase

	always @(posedge BCLK) do_reg <= muxdo;

	// Control Signals
	always @(posedge BCLK) SRCO[4] <= ~((CESRAM & (state == 3'd0)) | (state == 3'd1) | (state == 3'd4) | (state == 3'd5) | (state == 3'd6)); // CE
	always @(posedge BCLK) SRCO[3] <= ~((CESRAM & ~WRITE & (state == 3'd0)) | (state == 3'd1)); // OE
	always @(negedge BCLK) SRCO[2] <= ~((state == 3'd4) | (state == 3'd6)); // WE
 
	always @(posedge BCLK) oe_reg <= {16{(CESRAM & WRITE & (state == 3'd0)) | (state == 3'd4) | (state == 3'd5) | (state == 3'd6)}};
 
	generate
		for (i=0;i<=15;i=i+1)
			begin: oectrl
				assign SRDB[i] = oe_reg[i] ? do_reg[i] : 1'bz;
			end
	endgenerate
	
	always @(posedge BCLK) di_reg <= SRDB; // Fast Input Register
	always @(posedge BCLK) pipe_reg <= di_reg;
 
	assign SRAM_Q = {di_reg,(twoa ? pipe_reg : di_reg)};
	assign READY  = CESRAM & (WRITE ? (state == 3'd0) : (state == 3'd3));
 
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	5. TRIPUTER			Top level of FPGA
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module TRIPUTER( RCLK, RST_N, SSW, UA_TX, UA_RX, SRCO, SRAA, SRDB, HEXM, HEXL, LEDR, LEDG, AUD_XCK, HDMI_CLK );

	input			RCLK;
	input 			RST_N;

	input 	 [9:0]	SSW;

	input			UA_RX;
	output			UA_TX;

	output	 [4:0]	SRCO;
	output	[17:0]	SRAA;
	inout	[15:0]	SRDB;

	output	 [6:0]	HEXM,HEXL;
	output	 [9:0]	LEDR;
	output	 [7:0]	LEDG;
	
	output			AUD_XCK,HDMI_CLK;	// only driving 0

	reg		[31:0]	BOOT_ROM [0:511];	// 2 kByte
	reg		[31:0]	BOOT_Q;

	wire	[31:0]	AA;
	wire			NMI_N;
	wire			BCLK;
	wire			DC_ACC;	
	wire			DC_WR;
	wire			DC_MDONE;
	wire	[31:0]	DIN;
	wire	[28:0]	DRAM_ADR;
	wire	[35:0]	DRAM_DI;
	wire   [127:0]	DRAM_Q;
	wire	[31:0]	DRD;
	wire			DC_INHIBIT;
	wire			IC_ACC;
	wire			IC_MDONE;
	wire	[28:0]	IDRAM_ADR;
	wire			IC_INHIBIT;
	wire			READ;
	wire			READY;
	wire	 [3:0]	STATUS;
	wire			ENDRAM;
	wire			ENWR;
	wire			WRITE;
	wire	 [3:0]	BE;
	wire			CESRAM;
	wire	[31:0]	SRAM_Q;
	wire			SRAM_RDY;
	wire			BRESET;
	wire			INT_N;
	wire			UART_RD;
	wire	 [1:0]	UART_WR;
	wire	[31:0]	UART_Q;

	assign BCLK = RCLK;
	assign AUD_XCK = 1'b0;
	assign HDMI_CLK = 1'b0;

M32632	CPU(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.DRAMSZ(3'b010),
	.NMI_N(NMI_N),
	.INT_N(~INT_N),
	.IC_MDONE(IC_MDONE),
	.IC_INHIBIT(IC_INHIBIT),
	.DRAM_Q(DRAM_Q),
	.ENWR(ENWR),
	.DC_MDONE(DC_MDONE),
	.DC_INHIBIT(DC_INHIBIT),
	.ENDRAM(ENDRAM),
	.COP_DONE(1'b0),
	.COP_IN(64'd0),
	.HOLD(1'b1),
	.DMA_CHK(1'b0),
	.DMA_AA(25'd0),
	.IO_READY(READY),
	.IO_Q(DRD),
// Outputs:
	.STATUS(STATUS),
	.ILO(),
	.STATSIGS(),
	.IC_ACC(IC_ACC),
	.IDRAM_ADR(IDRAM_ADR),
	.DC_WR(DC_WR),
	.DC_ACC(DC_ACC),
	.DRAM_ADR(DRAM_ADR),
	.DRAM_DI(DRAM_DI),
	.COP_GO(),
	.COP_OP(),
	.COP_OUT(),
	.HLDA(),
	.IO_RD(READ),
	.IO_WR(WRITE),
	.IO_A(AA),
	.IO_BE(BE),
	.IO_DI(DIN) );

DRAM_MOD	DRAM(
	.MCLK(BCLK),
	.RST_N(BRESET),
	.IC_ACC(IC_ACC),
	.IDRAM_ADR(IDRAM_ADR),
	.DC_WR(DC_WR),
	.DC_ACC(DC_ACC),
	.DRAM_ADR(DRAM_ADR),
	.DRAM_DI(DRAM_DI),
	.IC_MDONE(IC_MDONE),
	.IC_INHIBIT(IC_INHIBIT),
	.MEM_Q(DRAM_Q),
	.ENWR(ENWR),
	.DC_MDONE(DC_MDONE),
	.DC_INHIBIT(DC_INHIBIT) );


MAINDEC	 MDEC(
	.BCLK(BCLK),
	.WRITE(WRITE),
	.READ(READ),
	.ADDR(AA[31:2]),
	.STATUS(STATUS),
	.IO_DI(DIN),
	.SRAM_RDY(SRAM_RDY),
	.SRAM_Q(SRAM_Q),
	.BOOT_Q(BOOT_Q),
	.UART_Q(UART_Q),
	.BE(BE),
	.RST_N(RST_N),
	.SSW(SSW),
	.READY(READY),
	.DRD(DRD),
	.ENDRAM(ENDRAM),
	.BRESET(BRESET),
	.LEDR(LEDR),
	.LEDG(LEDG),
	.HEXM(HEXM),
	.HEXL(HEXL),
	.NMI_N(NMI_N),
	.UART_RD(UART_RD),
	.UART_WR(UART_WR),
	.CESRAM(CESRAM)	);

UART	SERIF(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.UART_RD(UART_RD),
	.UART_WR(UART_WR),
	.DIN(DIN[15:0]),
	.UART_Q(UART_Q),
	.UA_INT(INT_N),
	.UA_RX(UA_RX),
	.UA_TX(UA_TX) );

SRAM	SRAMIF(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.CESRAM(CESRAM),
	.WRITE(WRITE),
	.AA(AA[18:1]),
	.DIN(DIN),
	.BE(BE),
	.SRAM_Q(SRAM_Q),
	.READY(SRAM_RDY),
	.SRCO(SRCO),
	.SRAA(SRAA),
	.SRDB(SRDB) );
	
initial
	begin
		$readmemh("boot_rom.txt", BOOT_ROM);
	end
	
	always @(posedge BCLK) BOOT_Q <= BOOT_ROM[AA[10:2]];	

endmodule
