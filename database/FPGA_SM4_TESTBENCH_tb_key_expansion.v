`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/09 21:36:10
// Design Name: 
// Module Name: tb_key_expansion
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_key_expansion(

    );
    
reg   clk                   ;
reg   reset_n               ;
reg   sm4_enable_in         ;
reg   encdec_sel_in         ;
reg   enable_key_exp_in     ;
reg   user_key_valid_in     ;
reg   [127: 0] user_key_in  ;

wire  key_exp_finished_out  ;
wire  [31 : 0] rk00_out     ;
wire  [31 : 0] rk01_out     ;
wire  [31 : 0] rk02_out     ;
wire  [31 : 0] rk03_out     ;
wire  [31 : 0] rk04_out     ;
wire  [31 : 0] rk05_out     ;
wire  [31 : 0] rk06_out     ;
wire  [31 : 0] rk07_out     ;
wire  [31 : 0] rk08_out     ;
wire  [31 : 0] rk09_out     ;
wire  [31 : 0] rk10_out     ;
wire  [31 : 0] rk11_out     ;
wire  [31 : 0] rk12_out     ;
wire  [31 : 0] rk13_out     ;
wire  [31 : 0] rk14_out     ;
wire  [31 : 0] rk15_out     ;
wire  [31 : 0] rk16_out     ;
wire  [31 : 0] rk17_out     ;
wire  [31 : 0] rk18_out     ;
wire  [31 : 0] rk19_out     ;
wire  [31 : 0] rk20_out     ;
wire  [31 : 0] rk21_out     ;
wire  [31 : 0] rk22_out     ;
wire  [31 : 0] rk23_out     ;
wire  [31 : 0] rk24_out     ;
wire  [31 : 0] rk25_out     ;
wire  [31 : 0] rk26_out     ;
wire  [31 : 0] rk27_out     ;
wire  [31 : 0] rk28_out     ;
wire  [31 : 0] rk29_out     ;
wire  [31 : 0] rk30_out     ;
wire  [31 : 0] rk31_out     ;   

always #3 clk = ~clk;

initial
    begin
        clk                 = 1'b0 ;
        reset_n             = 1'b0 ;
        sm4_enable_in		= 1'b0 ;
        enable_key_exp_in   = 1'b0 ; 
        encdec_sel_in       = 1'b0;
        user_key_in         = 128'h0 ;
        user_key_valid_in   = 1'b0 ;
        #100;
        @(posedge clk) reset_n             = 1'b1 ;
        @(posedge clk) sm4_enable_in       = 1'b1 ;
        #100;
        @(posedge clk) #1 enable_key_exp_in   = 1'b1 ;
        #222;
        @(posedge clk)
        begin
            user_key_valid_in = 1'b1;
            user_key_in       = 128'h0123456789abcdeffedcba9876543210;
        end
        @(posedge clk)
                begin
                    user_key_valid_in = 1'b0;
                    user_key_in       = 128'h0;
                end

        wait(key_exp_finished_out);
        #200;
        reset_n             = 1'b0 ;
        sm4_enable_in		= 1'b0 ;
        enable_key_exp_in   = 1'b0 ; 
        encdec_sel_in       = 1'b1;
        user_key_in         = 128'h0 ;
        user_key_valid_in   = 1'b0 ;
        #100;
        @(posedge clk) reset_n             = 1'b1 ;
        @(posedge clk) sm4_enable_in       = 1'b1 ;
        #100;
        @(posedge clk) #1 enable_key_exp_in   = 1'b1 ;
        #222;
        @(posedge clk)
        begin
            user_key_valid_in = 1'b1;
            user_key_in       = 128'h0123456789abcdeffedcba9876543210;
        end
        @(posedge clk)
                begin
                    user_key_valid_in = 1'b0;
                    user_key_in       = 128'h0;
                end

        wait(key_exp_finished_out);
        #200;
        
        $finish;
    end
        


key_expansion uut
	(
        .clk				    (clk				    ),
        .reset_n			    (reset_n			    ),
        .sm4_enable_in		    (sm4_enable_in		    ),
        .encdec_sel_in		    (encdec_sel_in		    ),
        .enable_key_exp_in	    (enable_key_exp_in	    ),
        .user_key_in		    (user_key_in		    ),
        .user_key_valid_in	    (user_key_valid_in	    ),
        .key_exp_finished_out   (key_exp_finished_out   ),
        .rk00_out			    (rk00_out			    ),
        .rk01_out			    (rk01_out			    ),
        .rk02_out			    (rk02_out			    ),
        .rk03_out			    (rk03_out			    ),
        .rk04_out			    (rk04_out			    ),
        .rk05_out			    (rk05_out			    ),
        .rk06_out			    (rk06_out			    ),
        .rk07_out			    (rk07_out			    ),
        .rk08_out			    (rk08_out			    ),
        .rk09_out			    (rk09_out			    ),
        .rk10_out			    (rk10_out			    ),
        .rk11_out			    (rk11_out			    ),
        .rk12_out			    (rk12_out			    ),
        .rk13_out			    (rk13_out			    ),
        .rk14_out			    (rk14_out			    ),
        .rk15_out			    (rk15_out			    ),
        .rk16_out			    (rk16_out			    ),
        .rk17_out			    (rk17_out			    ),
        .rk18_out			    (rk18_out			    ),
        .rk19_out			    (rk19_out			    ),
        .rk20_out			    (rk20_out			    ),
        .rk21_out			    (rk21_out			    ),
        .rk22_out			    (rk22_out			    ),
        .rk23_out			    (rk23_out			    ),
        .rk24_out			    (rk24_out			    ),
        .rk25_out			    (rk25_out			    ),
        .rk26_out			    (rk26_out			    ),
        .rk27_out			    (rk27_out			    ),
        .rk28_out			    (rk28_out			    ),
        .rk29_out			    (rk29_out			    ),
        .rk30_out			    (rk30_out			    ),
        .rk31_out			    (rk31_out			    )
    );	
endmodule
