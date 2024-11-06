// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
* Author: Ahmad Hegazy <https://github.com/ahegazy>
* Date: September 2018
* Modified : October 2018
* Formal verification : May 2020
*
* Description: AddRoundKey step in AES encryption/Decryption.
* Language: Verilog
*
*/

module addRoundKey(
	input wire [127:0] key ,
	input wire [127:0] state,
	input  clk,enable, reset,
	output reg  [127:0]state_out,
	output reg done);

//	integer i;

    // separating the combinational from the sequential 
    wire [127:0] state_out_comb; 
    genvar ii;
    for (ii=0 ;ii<=15; ii=ii+1)
        assign state_out_comb[ii*8 +: 8] = key[ii*8  +:  8] ^ state[ii*8  +:  8];

    initial state_out <= 0;
    initial done <= 0;

    always@(posedge clk)
    begin
        if (reset) begin
            state_out<=128'd0;
            done <= 0;
        end 
        else if (enable) begin 
            //	for ( i=0; i<=15; i=i+1)
            //		state_out[i*8  +:  8] <= key[i*8  +:  8] ^ state[i*8  +:  8];
            state_out <= state_out_comb;
            done <= 1;
        end 
        else done <= 0;
    end



`ifdef FORMAL

    reg f_past_valid; // to know if the $past value is valid to process
    initial f_past_valid = 0;

    initial assume(reset);


    always @(posedge clk)
        f_past_valid = 1;

    // sync reset
    // the design starts at reset state so if no f_past_valid it should be on reset
    // if the past cycle had reset then it should be in reset state
    always @(posedge clk)
        if(!f_past_valid || $past(reset))
        begin
            assert(state_out == 128'd0);
            assert(done == 1'b0);
        end


    // sync enable

    // if enable is valid 
    // assume stable input key == $past(key) and state == $past(state) 
    always @(posedge clk)
        if(enable || $past(enable))
            assume($stable(state));
    always @(posedge clk)
        if(enable || $past(enable))
            assume($stable(key));
        
    always @(posedge clk)
        if(done)
            assert(state_out == key^state);

`endif
endmodule

