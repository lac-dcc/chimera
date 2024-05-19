// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Author : Ahmad Hegazy <https://github.com/ahegazy>
*	Date: October 2018
*   Formal : May 2020
*
* Description: ShiftRows step in AES encryption/Decryption.
* Language: Verilog
*
*/
module shiftRows (
  input enable,clk,reset,
  input  wire  [0:127] Data,
	output reg  [0:127] Shifted_Data,
	output reg done );
	

/* Separate comb from seq*/

	wire  [0:127] Shifted_Data_comb;
    
	/* in the DATA .. the arranging is columns filled 1st  ._. */
    /* column 0 no change */
    assign Shifted_Data_comb[0+:8] = Data[0+:8];
    assign Shifted_Data_comb[32+:8] = Data[32+:8];
    assign Shifted_Data_comb[64+:8] = Data[64+:8];
    assign Shifted_Data_comb[96+:8] = Data[96+:8];

    /*2nd column , column 1 , 1 shift down */
    assign Shifted_Data_comb [8+:8] = Data[40+:8];
    assign Shifted_Data_comb [40+:8] = Data[72+:8];
    assign Shifted_Data_comb [72+:8] = Data[104+:8];
    assign Shifted_Data_comb [104+:8] = Data[8+:8];

    /*3rd column , column 2 , 2 shifts down */
    assign Shifted_Data_comb [16+:8] = Data[80+:8];
    assign Shifted_Data_comb [48+:8] = Data[112+:8];
    assign Shifted_Data_comb [80+:8] = Data[16+:8];
    assign Shifted_Data_comb [112+:8] = Data[48+:8];


    /*4th column , column 3 , 3 shifts down */
    assign Shifted_Data_comb [24+:8] = Data[120+:8];
    assign Shifted_Data_comb [56+:8] = Data[24+:8];
    assign Shifted_Data_comb [88+:8] = Data[56+:8];
    assign Shifted_Data_comb [120+:8] = Data[88+:8];

    /*
     //	row 0 no change 
    assign Shifted_Data_comb[0+:32] = Data[0+:32];
     //	2nd row , row 1 , 1 shift left 
    assign Shifted_Data_comb [32+:24] = Data[40+:24];
    assign Shifted_Data_comb [56+:8] = Data[32+:8];
     //3rd row , row 2 , 2 shifts left 
    assign Shifted_Data_comb [64+:16] = Data[80+:16];
    assign Shifted_Data_comb [80+:16] = Data[64+:16];
     //4th row , row 3 , 3 shifts left 
    assign Shifted_Data_comb [96+:8] = Data[120+:8];
    assign Shifted_Data_comb [104+:24] = Data[96+:24];
*/

initial done <= 0;
initial Shifted_Data <= 128'b0;
always @(posedge clk)
  begin
    if (reset)
		begin
	       Shifted_Data <= 128'b0;
		    done <= 0;
		end
  else if (enable) begin

	    Shifted_Data <= Shifted_Data_comb;
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
    // the design starts at reset Data so if no f_past_valid it should be on reset
    // if the past cycle had reset then it should be in reset Data
    always @(posedge clk)
        if(!f_past_valid || $past(reset))
        begin
            assert(Shifted_Data == 128'd0);
            assert(done == 1'b0);
        end


    // sync enable

    // if enable is valid 
    // assume stable input Data == $past(Data) 
    always @(posedge clk)
        if(enable || $past(enable))
            assume($stable(Data));


    /* calculate shifted data for formal */
    function [127:0] shiftRows(input [127:0] Datai);
        reg [7:0] data [0:3] [0:3];
        reg [7:0] shifted_data[0:3] [0:3];
        reg [127:0] shift_fn_out;
        integer i,j,ij;
        
        // 1D to 2D 
        for ( i=0; i<=3; i=i+1)
            for ( j=0; j<=3; j=j+1)
            begin 
                ij =15-((4*i)+j);
                data[j][i]=Datai[ij*8  +:  8];
            end	
                
        // row 0 stay as it is 
        for ( j=0; j<=3; j=j+1)
            shifted_data[0][j] = data[0][j];
        
        // row 1 shifted 1
        shifted_data[1][0] = data[1][1];
        shifted_data[1][1] = data[1][2];
        shifted_data[1][2] = data[1][3];
        shifted_data[1][3] = data[1][0];
        
        // row 2 shifted 2
        shifted_data[2][0] = data[2][2];
        shifted_data[2][1] = data[2][3];
        shifted_data[2][2] = data[2][0];
        shifted_data[2][3] = data[2][1];
        
    //row 3 shifted 3
        shifted_data[3][0] = data[3][3];
        shifted_data[3][1] = data[3][0];
        shifted_data[3][2] = data[3][1];
        shifted_data[3][3] = data[3][2];
     
        // 2D to 1D 
        for ( i=0; i<=3; i=i+1)
            for ( j=0; j<=3; j=j+1)
            begin 
                ij =15-((4*i)+j);
                shift_fn_out[ij*8  +:  8]=shifted_data[j][i];
            end

//return value 
            shiftRows = shift_fn_out;
    endfunction

    reg [127:0] f_shifted_Data;

    always @(*)
        f_shifted_Data = shiftRows(Data);

    always @(posedge clk)
        if(done)
            assert(Shifted_Data == f_shifted_Data);

`endif

endmodule

