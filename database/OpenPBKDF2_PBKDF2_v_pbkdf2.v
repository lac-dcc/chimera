// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

/**
* PBKDF2 key generatoring algorithm 
**/

module pbkdf2(
     input logic clk_i
    ,input logic rst_i

    ,input logic [31:0] iters_i
    ,input logic [511:0] pass_i
    ,input logic [511:0] salt_i
    ,input logic [5:0] salt_len_i

    ,output logic in_ready
    ,input logic in_valid
    ,input logic out_ready
    ,output logic out_valid

    ,output logic [255:0] hash_o
  );
    
    logic first_run, incr_count, rst_count;

    logic prf_v_o, prf_r_i, prf_v_i, prf_r_o;
    logic [1:0] ns, ps;
    logic [5:0] hash_len, salt_len, msg_len_i;
    logic [31:0] count, count_plus_one, iters;
    logic [255:0] prf_o, prf_reg;
    logic [511:0] pass, salt, msg_i;


    assign count_plus_one = count + 1;
    assign first_run = count == 0;

    assign hash_len = 6'b100000;  // 32 byte hash (256bit)

    // on the first iterations, salt and salt length
    assign msg_i = first_run ? salt : {prf_reg, 256'b0};
    assign msg_len_i = first_run ? salt_len : hash_len;


    // instantiate HMAC as the Pseudo Random Function (PRF)
    hmac_sha256 prf (.clk_i,
		     .rst_i,
		     .key_i(pass),
		     .msg_i,
	 	     .msg_len_i,
		     .prf_o,
		     .v_i(prf_v_i),
		     .r_i(prf_r_i),
		     .v_o(prf_v_o),
		     .r_o(prf_r_o));

    always @(*) begin
	ns = ps; in_ready = 0; out_valid = 0; prf_v_i = 0; prf_r_i = 0; incr_count = 0; rst_count = 0;
	case(ps)
	    0: begin  // Read Input
		if (in_valid) ns = 1; 
	    end
	    1: begin  // Load into HMAC
		if (prf_r_o) ns = 2;
		in_ready = 1;
		prf_v_i = prf_r_o;
	    end
	    2: begin  // Wait for HMAC
		if (prf_v_o) begin
		    prf_r_i = 1;
		    if (count_plus_one == iters) ns = 3;  // hash finished
		    else begin 
			incr_count = 1;  // iterate
			ns = 1;
		    end
		end
		
	    end
	    3: begin  // Output Result
		if (out_ready) begin ns = 0; rst_count = 1; end
		out_valid = 1;
	    end
	endcase
    end

    always @(posedge clk_i) begin
	if (rst_i) begin
	    ps <= 0;
	    count <= 0;
	    iters <= 0;
	    hash_o <= 0;
	end else
	    ps <= ns;
	    if (incr_count) count <= count_plus_one;
	    else if (rst_count) count <= 0;
	    prf_reg <= prf_o;

	    if (in_valid) begin  // load values
		iters <= iters_i; 
		pass <= pass_i; 
		salt <= salt_i ;
		salt_len <= salt_len_i ;
	    end

	    if (prf_v_o) begin
		hash_o <= first_run ? prf_o : prf_o ^ hash_o;  // update output reg
		prf_reg <= prf_o;  // update HMAC input
	end
    end

endmodule

