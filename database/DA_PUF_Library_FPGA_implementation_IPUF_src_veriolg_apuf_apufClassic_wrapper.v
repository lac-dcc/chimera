
/************************************************************** 
   A 64bit interposed XAPUF design with picoblaze micro controller 
   used for data communication between FPGA and PC.
  
   Author: Durga Prasad Sahoo, BOSCH India
   Last Update: 4/11/2017   
***************************************************************/

module iXOR_APUF_64_DOLUT_wrapper(clk,rx,tx);

	localparam CLOCK_FRE = 100000000;  		// Frequency in Hz
	localparam BAUD_RATE = 19200;      		// Baud rate for RS232 communication   
   
	localparam N1 = 64;     // Challenge length
	localparam N2 = N1+1;
	localparam K1 = 1;
	localparam K2 = 1;     	// No. of APUF
	localparam POS = 31;  // Feedback position, the middle position is 31
	
	(* CLOCK_SIGNAL = "yes" *)
	input  clk;
	input  rx;
	output tx;

	wire tigSig_t, tigSig_b;
	wire respReady, respReady_t;
	wire [K1+K2-1:0] respBitA;
	wire respBit;
	reg [N1-1:0] challenge;
	
	///////////////////////////////////////////////////////////////////////
   //   PUF INSTANTIATION
	///////////////////////////////////////////////////////////////////////

	// iXOR APUF
	(*KEEP_HIERARCHY = "TRUE"*)
	ixor_apuf #(.N1(N1), .N2(N2), .K1(K1), .K2(K2), .POS(POS)) iXAPUF(
	.clk(clk),
	.tigSig_t(tigSig_t),
	.tigSig_b(tigSig_b),
	.c(challenge),
	.respReady_t(respReady_t),
	.respReady(respReady),
	.respBitA(respBitA),
	.respBit(respBit)
	);
	
	
	/////////////////////////////////////////////////////////////////////////////
	// CHALLENGE PREPARATION
	/////////////////////////////////////////////////////////////////////////////
	
	wire [63:0] dataIn_64;
	wire [7:0] chal_1,chal_2,chal_3,chal_4,chal_5,chal_6,chal_7,chal_8,chal_9;
	wire chalEn;

	assign dataIn_64 = {chal_2,chal_3,chal_4,chal_5,chal_6,chal_7,chal_8,chal_9};

	wire wrEn;
	wire [1:0] inId;             // Change this accordingly
	assign inId = chal_1; 

	// Receive challenges
	always@(posedge clk) begin
	  if(~chalEn) begin
		 challenge <= 0;
	  end else begin
			if (wrEn) begin
				 case(inId)
					  //3: challenge[63:0] <= dataIn_64;
						  
					  //2: challenge[127:64] <= dataIn_64;
						  
					  //1: challenge[63:0] <= dataIn_64;
								
					  0: challenge[63:0] <= dataIn_64;

				 endcase
			  end else begin
					challenge <= challenge;
			  end // else wrEn
	  end // else chalEn
	end // always
   
	 
	///////////////////////////////////////////////////////////////////////
   //   PICBLAZE MICRO-CONTROLLER (8-Bit)
	///////////////////////////////////////////////////////////////////////
	
	(* KEEP_HIERARCHY = "TRUE" *)
	puf_controller #(.CLOCK_FRE(CLOCK_FRE), .BAUD_RATE(BAUD_RATE)) PUF_CU (
        .clk(clk),
        .response_ready(respReady),
        .RESP_1_PORT(respBit),
        .RESP_2_PORT(respBitA[1:0]),
        .RESP_3_PORT(),
        .RESP_4_PORT(),
        .RESP_5_PORT(),
        .RESP_6_PORT(),
        .RESP_7_PORT(),
        .RESP_8_PORT(),
        .RESP_9_PORT(),
        .RESP_10_PORT(),
        .RESP_11_PORT(),
        .RESP_12_PORT(),
        .RESP_13_PORT(),
        .RESP_14_PORT(),
        .RESP_15_PORT(),
        .RESP_16_PORT(respReady_t),
        .rx(rx),
        .tx(tx),
        .CHAl_1_PORT(chal_1),
        .CHAl_2_PORT(chal_2),
        .CHAl_3_PORT(chal_3),
        .CHAl_4_PORT(chal_4),
        .CHAl_5_PORT(chal_5),
        .CHAl_6_PORT(chal_6),
        .CHAl_7_PORT(chal_7),
        .CHAl_8_PORT(chal_8),
        .CHAl_9_PORT(chal_9),
        .CHAl_10_PORT(tigSig_t),
        .CHAl_11_PORT(tigSig_b),
        .CHAl_12_PORT(),
        .CHAl_13_PORT(),
        .CHAl_14_PORT(),
        .CHAl_15_PORT(), // First byte in matlab program
        .CHAl_16_PORT(wrEn),
        .CHAL_EN_PORT(chalEn),
        .PUF_START_PORT()			
	);

endmodule

// END
