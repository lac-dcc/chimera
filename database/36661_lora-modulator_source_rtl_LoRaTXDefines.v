// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

//Scale defines
    `define SCALE_HQ                        34'd4194304
    `define SCALE_1Q                        34'd8388608
    `define SCALE_2Q                        34'd16777216
    `define SCALE_3Q                        34'd25165824
    `define SCALE_4Q                        34'd33554432
    `define SCALE_2X                        34'd67108864 
    `define BW_SCALE_SR_MIN                 34'd262144
    `define BW2_SCALE_SR2_MIN               34'd2048
    
    `define Sine_SR_Bits                    11  //for SR=2048

//constant 5 is based on minBW relative to SR. This is for minBW=125k, SR=4M
    `define minBW_SR_Ratio_Power            4'd7

//`define FC_SR			                34'd166723584
//`define SCALE_SCALE_POWER_FACTOR        25

//define bandwidth
`define BW_500			          		20'd500_000
`define BW_250			          		20'd250_000
`define BW_125			           		20'd125_000
`define BW_62_5		          			20'd62_500
`define BW_31_25		          		20'd31_250

//define bandwidth slection
`define BW_SELECT_500		            3'd0
`define BW_SELECT_250		            3'd1
`define BW_SELECT_125		            3'd2
`define BW_SELECT_62_5		            3'd3
`define BW_SELECT_31_25		            3'd4

//define spreading factor
`define SF_12			            	8'd12
`define SF_11			            	8'd11
`define SF_10			            	8'd10
`define SF_9			            	8'd9
`define SF_8			            	8'd8
`define SF_7			            	8'd7
`define SF_6			            	8'd6

//define spreading factor selection
`define SF_SELECT_12			        3'd0
`define SF_SELECT_11			        3'd1
`define SF_SELECT_10			        3'd2
`define SF_SELECT_9			            3'd3
`define SF_SELECT_8			            3'd4
`define SF_SELECT_7			            3'd5
`define SF_SELECT_6			            3'd6


//chirp size
`define CHIRP_SIZE_SF12			    	14'd4096
`define CHIRP_SIZE_SF11			    	14'd2048
`define CHIRP_SIZE_SF10			    	14'd1024
`define CHIRP_SIZE_SF9			    	14'd512
`define CHIRP_SIZE_SF8			    	14'd256
`define CHIRP_SIZE_SF7			    	14'd128


// Chirp symbol offset
`define OFFSET_SF12        				14'd2049
`define OFFSET_SF11        				14'd1025
`define OFFSET_SF10        				14'd513
`define OFFSET_SF9        				14'd257
`define OFFSET_SF8        				14'd129
`define OFFSET_SF7        				14'd65

//Precision for all registers
`define PRECISION						    34
//Initial symbol precision
`define SYMBOL_PRECISION					12
//data precision
`define DATA_PRECISION						14
  
//Lora packet information
`define SYNC_SIZE				2
`define DOWNCHIRP_SIZE		3
`define MAX_PAYLOAD_SIZE	20


//define different sizes
`define CHIRP_TYPE_SIZE    2
`define STATE_SIZE			5
`define FC_SIZE				24
`define BW_SIZE				20
`define BW_SELECT_SIZE		3
`define SR_SIZE				26
`define SF_SIZE				8
`define SF_SELECT_SIZE		3
`define SIZE_8				8
`define SIZE_4              4
`define WAIT_SIZE				26
`define FC_SHIFT_SIZE		13

//Define different chirp type
`define TYPE_UPCHIRP		2'd0
`define TYPE_DOWNCHIRP   	2'd1
`define TYPE_Q_DOWNCHIRP 	2'd2

 