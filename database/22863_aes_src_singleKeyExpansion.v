// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*   Author: Ahmad Hegazy <https://github.com/ahegazy>
*	Date: September 2018
*   Formal verification: May 2020 
*
* Description: Expand only a single key in AES encryption/Decryption.
* Language: Verilog
*
*/
module singleKeyExpansion( 
  input  [127:0] keyInput ,
	input clk,
	input enable,
	input reset,
	input [3:0] keyNum,
  output  reg [127:0] keyOutput
  );
    wire [31:0] stp1 ;
  wire [31:0] stp2 ;
  wire [31:0]Rcon ;
    

 	 rcon uut1 (.r(keyNum),.rcon(Rcon));
   subByte uut2 (.state(stp1) , .state_out(stp2));
	 
    assign stp1 = { keyInput[23:0] , keyInput[31:24] }; 
	
    initial keyOutput = 0;
    always @(posedge clk) 
     begin
        if ( reset == 1 )
        begin 
        keyOutput = 0;
            /* donothing */
        end 
        else 
        begin 
            if(enable)
                begin 
                    keyOutput[127:96] = keyInput[127:96] ^ stp2 ^ Rcon; 	
                    keyOutput[95:64] = keyInput[95:64] ^ keyOutput[127:96];
                    keyOutput[63:32] = keyInput[63:32] ^ keyOutput[95:64];
                    keyOutput[31:0] = keyInput[31:0] ^ keyOutput[63:32];
                end
        end 
    end

/* 
// This requires two cycles for the output to be settled 

    wire [127:0] keyOutComb;
    assign keyOutComb[127:96] = keyInput[127:96] ^ stp2 ^ Rcon; 	
    assign keyOutComb[95:64] = keyInput[95:64] ^ keyOutput[127:96];
    assign keyOutComb[63:32] = keyInput[63:32] ^ keyOutput[95:64];
    assign keyOutComb[31:0] = keyInput[31:0] ^ keyOutput[63:32];

    initial keyOutput = 0;
    
    always @(posedge clk) 
     begin
        if ( reset == 1 )
        begin 
        keyOutput= 0;
            // donothing 
        end 
        else 
            if(enable)
                keyOutput <= keyOutComb;
    end
*/

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
            assert(keyOutput == 128'd0);


    // sync enable

    // if enable is valid 
    // assume stable input key == $past(key) and state == $past(state) 
    always @(posedge clk)
        if(enable || $past(enable))
            assume($stable(keyInput));
    always @(posedge clk)
        if(enable || $past(enable))
            assume($stable(keyNum));


`endif

endmodule

