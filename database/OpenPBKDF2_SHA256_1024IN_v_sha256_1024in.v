// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

/**
* SHA256 Encryption wrapper
* input the password or the previously 
**/

module sha256_1024in (
     input logic clk_i
    ,input logic rst_i 
        
    ,input logic [1023:0] in 
    ,input logic in_valid
    ,output logic in_ready
    
    ,output logic [255:0] out
    ,input logic out_ready
    ,output logic out_valid
  );
  
    logic new_hash, in_v, in_r, out_v, out_r;
    logic [1:0] ps, ns;
    logic [511:0] in_reg;

    sha256 hasher (.clk_i,
		   .rst_i, 
		   .new_hash, 
		   .in_valid(in_v),
		   .in(ps == 0 ? in[1023:512] : in_reg),
   		   .in_ready(in_r), 
		   .out_valid(out_v), 
		   .out,
		   .out_ready(out_r));

    always @(*) begin
    ns = ps; in_ready = 0; out_valid = 0; in_v = 0; out_r = 0; new_hash = 0;
    case (ps)
	0: begin  // Load First Chunk Into SHA256
	    if (in_r & in_valid) ns = 1;
	    in_v = in_valid;
	    in_ready = 1;
	    new_hash = 1;
	    out_r = 1;
	end
	1: begin  // Load Second Chunk Into SHA256
	    if (out_v) begin out_r = 1; ns = 2; end
	end
	2: begin  // Output Result
	    if (out_ready) begin ns = 0; out_r = 1; end
	    in_v = 1;
	    out_valid = out_v;
	end
	default: begin end
    endcase
    end

    always @(posedge clk_i) begin

        if (rst_i) begin
            ps <= 0;
	    in_reg <= 0;
        end else begin
            ps <= ns;
            if (in_r & in_valid) in_reg <= in[511:0];
        end
    end
endmodule

