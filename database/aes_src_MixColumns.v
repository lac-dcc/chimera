// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*   Author: Ahmad Hegazy <https://github.com/ahegazy>
*	Date: October 2018
*   Formal verification: May 2020
*
* Description: Mix columns step in AES encryption/Decryption.
* Language: Verilog
*
*/

module mixColumns(
	input wire [127:0] state,
	input  clk,enable, reset,
	output reg  [127:0]state_out,
	output reg done);

function [7:0] MultiplyByTwo;
	input [7:0] x;
	begin 
			/* multiplication by 2 is shifting on bit to the left, and if the original 8 bits had a 1 @ MSB, xor the result with 0001 1011*/
			if(x[7] == 1) MultiplyByTwo = ((x << 1) ^ 8'h1b);
			else MultiplyByTwo = x << 1; 
	end 	
endfunction

function [7:0] MultiplyByThree;
	input [7:0] x;
	begin 
			/* multiplication by 3 ,= 01 ^ 10 = (NUM * 01) XOR (NUM * 10) = (NUM) XOR (NUM Muliplication by 2) */
			MultiplyByThree = MultiplyByTwo(x) ^ x;
	end 
endfunction
 
//integer i; 

// separate combinational from sequential logic 

wire [127:0] state_out_comb;
genvar i;

generate
for(i=0;i<=3;i=i+1) begin
 /* 
 * Mix columns is a matrices muliplication: polynomial matrix state matrix .
 * for example 
 *	2	3	1 1     63 09 cd ba
 *	1	2	3 1     53 60 70 ca
 *	1	1	2 3     e0 e1 b7 d0
 * 	3	1	1 2     8c 04 51 e7
 * But the state bits as input comes serially in a reg [127:0] : 63 53 e0 8c 09 60 e1 04 cd 70 b7 51 ba ca d0 e7  
 * so instead of multiplying row * column we multiply row * row  and putting the bits in the output state in a column per iteration
 * 
 */
 
    assign state_out_comb[i*32+:8]  = MultiplyByTwo(state[(i*32)+:8])^(state[(i*32 + 8)+:8])^(state[(i*32 + 16)+:8])^MultiplyByThree(state[(i*32 + 24)+:8]);
    assign state_out_comb[(i*32 + 8)+:8] = MultiplyByThree(state[(i*32)+:8])^MultiplyByTwo(state[(i*32 + 8)+:8])^(state[(i*32 + 16)+:8])^(state[(i*32 + 24)+:8]);
    assign state_out_comb[(i*32 + 16)+:8] = (state[(i*32)+:8])^MultiplyByThree(state[(i*32 + 8)+:8])^MultiplyByTwo(state[(i*32 + 16)+:8])^(state[(i*32 + 24)+:8]);
    assign state_out_comb[(i*32 + 24)+:8]  = (state[(i*32)+:8])^(state[(i*32 + 8)+:8])^MultiplyByThree(state[(i*32 + 16)+:8])^MultiplyByTwo(state[(i*32 + 24)+:8]);
end
endgenerate

initial done <= 0;
initial state_out <= 0;

always@(posedge clk) 
begin
	if (reset)
	begin
		state_out<=128'd0;
		done <= 0;
	end 
	else if (enable)
	begin 
        state_out <= state_out_comb;
        done <= 1;
	end else done <= 0;
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
    // assume stable input key == $past(key)
    always @(posedge clk)
        if(enable || $past(enable))
            assume($stable(state));
        
    

    /* Calculating mix columns f_state_out using matrix multiplication */
    
    reg [127:0] f_state_out; //formal calculated state output


    task finite_multiplication;
        input [7:0] A ;
        input [7:0] B ;
        output[14:0] AB ;
        reg [14:0] temp [7:0] ;
        integer i;
    begin 
        for(i=0; i<=7; i=i+1)
        begin
            if (A[i]==1)
            temp[i]=B*(2**i);
            else 
            temp[i]=8'd0;
        end

        AB=temp[0]^temp[1]^temp[2]^temp[3]^temp[4]^temp[5]^temp[6]^temp[7];
    end
    endtask


    task Mod;
        input  [14:0]x;
        output [7:0] y;

        reg    [8:0] con;
        reg    [14:0] z;
        integer i;
     
    begin
        con = 9'd283;
        z = x;
        for (i=14; i>=8; i =i-1)
            if (z > 8'd255)
            begin
                if(z[i] == 1)
                    z[i -: 9] = z[i -: 9] ^ con[8:0];
                    //$display("z = %b",z[14:0]);
                 end
            else begin
                y =z;
            end
            y = z;
        end

    endtask


    function [127:0] mix_columns (input [127:0] state);
        integer i,j,ij,k;
        reg [7:0] state_2d [0:3] [0:3];
        reg [7:0] mix_out_2d [0:3] [0:3];
        reg [14:0] tmp_mult,tmp_mod;
        reg [127:0] state_out;

    	reg [7:0] polymat [0:3] [0:3];
		
        polymat[0][0]=8'd2;
        polymat[0][1]=8'd3;
        polymat[0][2]=8'd1;
        polymat[0][3]=8'd1;
        polymat[1][0]=8'd1;
        polymat[1][1]=8'd2;
        polymat[1][2]=8'd3;
        polymat[1][3]=8'd1;
        polymat[2][0]=8'd1;
        polymat[2][1]=8'd1;
        polymat[2][2]=8'd2;
        polymat[2][3]=8'd3;
        polymat[3][0]=8'd3;
        polymat[3][1]=8'd1;
        polymat[3][2]=8'd1;
        polymat[3][3]=8'd2;
        
        tmp_mod = 15'h0;
        
        for ( i=0; i<=3; i=i+1)
            for ( j=0; j<=3; j=j+1)
                begin
                ij=15-(i*4+j);
                state_2d[j][i]=state[ij*8  +: 8];
            end	

        for (i=0;i<=3;i++)
            for(j=0;j<=3;j++)
            begin 
                    tmp_mod=15'd0;
                    /* scalar multiplication of two matrices */
                    for (k=0;k<=3;k++)
                    begin 
                            finite_multiplication(state_2d[k][j],polymat[i][k],tmp_mult);
                            tmp_mod = tmp_mod ^ tmp_mult;
                            Mod(tmp_mod,mix_out_2d[i][j]);
                    end
                        //	$display("ij:%d,%d ,state: %x ",i,j,mix_out_2d[i][j]);
            end

            //2D to 1D

        for ( i=0; i<=3; i=i+1) 
            for ( j=0; j<=3; j=j+1)
                begin
                    ij=15-(i*4+j);
                    state_out[ij*8  +:  8]=mix_out_2d[j][i];
                    end	
        
        mix_columns = state_out;
endfunction

    always @(*)
        f_state_out = mix_columns(state);
    

    /* assert both are equal */
    always @(posedge clk)
        if(done)
            assert(state_out == f_state_out);

`endif

endmodule
