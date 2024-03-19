

module scramtest ();

	localparam [31:0] test_data = 32'hCAFE_babe;

	reg [31:0] input_s = test_data;
	reg [31:0] output_s;

	// serial form
	wire sdi;
	wire scram;
	wire sdo;

	reg [2:0] scram_state = 3'b0;
	reg [2:0] descram_state;	// uninitialised 3'x

	assign sdi = input_s[31];
	assign scram = sdi   ^ scram_state[1]   ^ scram_state[0];
	assign sdo   = scram ^ descram_state[1] ^ descram_state[0];

	// parallel form
	reg [31:0] input_p = test_data;
	// Sn  = Dn + Sn-2 + Sn-3    recurrance
	// S4  = D4 + S2   + S1   =  D4 + S2 + S1 
	// S5  = D5 + S3   + S2   =  D5 + S3 + S2
	// S6  = D6 + S4   + S3   =  D6 + (D4 + S2 + S1) + S3
	// S7  = D7 + S5   + S4   =  D7 + (D5 + S3 + S2) + (D4 + S2 + S1)
	
	wire [3:0] pdi = input_p[28 +: 4];
	wire [3:0] pscram;
	wire [3:0] pdo;

	reg [3:0] pscram_st = 4'b0;
	reg [3:0] pdescram_st;	// uninitialised 3'x

	assign pscram[3] = pdi[3] ^ pscram_st[2] ^ pscram_st[1];   // 1st bit TX depends only on historical stored
	assign pscram[2] = pdi[2] ^ pscram_st[3] ^ pscram_st[2];
	assign pscram[1] = pdi[1] ^ (pdi[3] ^ pscram_st[2] ^ pscram_st[1]) ^ pscram_st[3];
	assign pscram[0] = pdi[0] ^ (pdi[2] ^ pscram_st[3] ^ pscram_st[2]) ^ (pdi[3] ^ pscram_st[2] ^ pscram_st[1]);

	assign pdo[3] = pscram[3] ^ pdescram_st[2] ^ pdescram_st[1]; // 1st bit RX
	assign pdo[2] = pscram[2] ^ pdescram_st[3] ^ pdescram_st[2];
	assign pdo[1] = pscram[1] ^ pscram[3]    ^ pdescram_st[3];
	assign pdo[0] = pscram[0] ^ pscram[2]    ^ pscram[3];

	initial begin
		$display("sdi  2  1  0  scram  2  1  0   out");

		repeat (33) begin
			#1;

			$display("%01d    %01d  %01d  %01d    %01d    %01d  %01d  %01d    %01d %20h %20h", 
				sdi, scram_state[2], scram_state[1], scram_state[0],
				scram, descram_state[2], descram_state[1], descram_state[0], sdo, input_s, output_s);

			input_s <= { input_s[30:0], 1'b0 };
			scram_state <= { scram, scram_state[2], scram_state[1] };
			descram_state <= { scram, descram_state[2], descram_state[1] };
			output_s <= { output_s, sdo};

		end
		
		output_s <= 32'bx;
		$display("");
		$display("pdi   2  1  0  scram  2  1  0  pdo");

		repeat (10) begin
			#1;			
			$display("%04b  %01d  %01d  %01d  %04b   %01d  %01d  %01d  %04b %32b %32b %08h %08h", 
				pdi, pscram_st[2], pscram_st[1], pscram_st[0],
				pscram, pdescram_st[2], pdescram_st[1], pdescram_st[0], pdo, input_p, output_s, input_p, output_s);

			input_p <= { input_p[27:0], 4'b0 };
			pscram_st <= { pscram[0], pscram[1], pscram[2], pscram[3] };
			pdescram_st <= { pscram[0], pscram[1], pscram[2], pscram[3] };
			output_s <= { output_s, pdo};

		end


	end


endmodule