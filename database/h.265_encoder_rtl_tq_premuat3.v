module     premuat3(
        inverse,
     i_transize,
		   i_0 ,
	i_1 ,
	i_2 ,
	i_3 ,
	i_4 ,
	i_5 ,
	i_6 ,
	i_7 ,
	i_8 ,
	i_9 ,
	i_10,
	i_11,
	i_12,
	i_13,
	i_14,
	i_15,
	i_16,
	i_17,
	i_18,
	i_19,
	i_20,
	i_21,
	i_22,
	i_23,
	i_24,
	i_25,
	i_26,
	i_27,
	i_28,
	i_29,
	i_30,
	i_31,
	
	o_0 ,
	o_1 ,
    o_2 ,
    o_3 ,
    o_4 ,
    o_5 ,
    o_6 ,
    o_7 ,
    o_8 ,
    o_9 ,
    o_10,
    o_11,
    o_12,
    o_13,
    o_14,
    o_15,
    o_16,
    o_17,
    o_18,
    o_19,
    o_20,
    o_21,
    o_22,
    o_23,
    o_24,
    o_25,
    o_26,
    o_27,
    o_28,
    o_29,
    o_30,
    o_31
);

// ****************************************************************
//
//	INPUT / OUTPUT DECLARATION
//
// **************************************************************** 

input                                   inverse;
input              [1:0]             i_transize;
input   signed     [27:0]                  i_0 ;
input   signed     [27:0]                  i_1 ;
input   signed     [27:0]                  i_2 ;
input   signed     [27:0]                  i_3 ;
input   signed     [27:0]                  i_4 ;
input   signed     [27:0]                  i_5 ;
input   signed     [27:0]                  i_6 ;
input   signed     [27:0]                  i_7 ;
input   signed     [27:0]                  i_8 ;
input   signed     [27:0]                  i_9 ;
input   signed     [27:0]                  i_10;
input   signed     [27:0]                  i_11;
input   signed     [27:0]                  i_12;
input   signed     [27:0]                  i_13;
input   signed     [27:0]                  i_14;
input   signed     [27:0]                  i_15;
input   signed     [27:0]                  i_16;
input   signed     [27:0]                  i_17;
input   signed     [27:0]                  i_18;
input   signed     [27:0]                  i_19;
input   signed     [27:0]                  i_20;
input   signed     [27:0]                  i_21;
input   signed     [27:0]                  i_22;
input   signed     [27:0]                  i_23;
input   signed     [27:0]                  i_24;
input   signed     [27:0]                  i_25;
input   signed     [27:0]                  i_26;
input   signed     [27:0]                  i_27;
input   signed     [27:0]                  i_28;
input   signed     [27:0]                  i_29;
input   signed     [27:0]                  i_30;
input   signed     [27:0]                  i_31;

output  signed     [27:0]                 o_0 ;
output  signed     [27:0]                 o_1 ;
output  signed     [27:0]                 o_2 ;
output  signed     [27:0]                 o_3 ;
output  signed     [27:0]                 o_4 ;
output  signed     [27:0]                 o_5 ;
output  signed     [27:0]                 o_6 ;
output  signed     [27:0]                 o_7 ;
output  signed     [27:0]                 o_8 ;
output  signed     [27:0]                 o_9 ;
output  signed     [27:0]                 o_10;
output  signed     [27:0]                 o_11;
output  signed     [27:0]                 o_12;
output  signed     [27:0]                 o_13;
output  signed     [27:0]                 o_14;
output  signed     [27:0]                 o_15;
output  signed     [27:0]                 o_16;
output  signed     [27:0]                 o_17;
output  signed     [27:0]                 o_18;
output  signed     [27:0]                 o_19;
output  signed     [27:0]                 o_20;
output  signed     [27:0]                 o_21;
output  signed     [27:0]                 o_22;
output  signed     [27:0]                 o_23;
output  signed     [27:0]                 o_24;
output  signed     [27:0]                 o_25;
output  signed     [27:0]                 o_26;
output  signed     [27:0]                 o_27;
output  signed     [27:0]                 o_28;
output  signed     [27:0]                 o_29;
output  signed     [27:0]                 o_30;
output  signed     [27:0]                 o_31;

// ****************************************************************
//
//	WIRE DECLARATION
//
// ****************************************************************

wire                                  enable_80;
wire                                  enable_81;
wire                                  enable_82;
wire                                  enable_160;
wire                                  enable_161;
wire                                  enable_320;

wire  signed        [27:0]                 in_0;  
wire  signed        [27:0]                 in_1; 
wire  signed        [27:0]                 in_2; 
wire  signed        [27:0]                 in_3; 
wire  signed        [27:0]                 in_4; 
wire  signed        [27:0]                 in_5; 
wire  signed        [27:0]                 in_6; 
wire  signed        [27:0]                 in_7; 
wire  signed        [27:0]                 in_8; 
wire  signed        [27:0]                 in_9; 
wire  signed        [27:0]                 in_10; 
wire  signed        [27:0]                 in_11; 
wire  signed        [27:0]                 in_12; 
wire  signed        [27:0]                 in_13; 
wire  signed        [27:0]                 in_14; 
wire  signed        [27:0]                 in_15; 
wire  signed        [27:0]                 in_16; 
wire  signed        [27:0]                 in_17; 
wire  signed        [27:0]                 in_18; 
wire  signed        [27:0]                 in_19; 
wire  signed        [27:0]                 in_20; 
wire  signed        [27:0]                 in_21; 
wire  signed        [27:0]                 in_22; 
wire  signed        [27:0]                 in_23; 
wire  signed        [27:0]                 in_24; 
wire  signed        [27:0]                 in_25; 
wire  signed        [27:0]                 in_26; 
wire  signed        [27:0]                 in_27; 
wire  signed        [27:0]                 in_28; 
wire  signed        [27:0]                 in_29; 
wire  signed        [27:0]                 in_30; 
wire  signed        [27:0]                 in_31; 

wire  signed        [27:0]                  o8_0;
wire  signed        [27:0]                  o8_1;
wire  signed        [27:0]                  o8_2;
wire  signed        [27:0]                  o8_3;
wire  signed        [27:0]                  o8_4;
wire  signed        [27:0]                  o8_5;
wire  signed        [27:0]                  o8_6;
wire  signed        [27:0]                  o8_7;
wire  signed        [27:0]                  o8_8;
wire  signed        [27:0]                  o8_9;
wire  signed        [27:0]                  o8_10;
wire  signed        [27:0]                  o8_11;
wire  signed        [27:0]                  o8_12;
wire  signed        [27:0]                  o8_13;
wire  signed        [27:0]                  o8_14;
wire  signed        [27:0]                  o8_15;
wire  signed        [27:0]                  o8_16;
wire  signed        [27:0]                  o8_17;
wire  signed        [27:0]                  o8_18;
wire  signed        [27:0]                  o8_19;
wire  signed        [27:0]                  o8_20;
wire  signed        [27:0]                  o8_21;
wire  signed        [27:0]                  o8_22;
wire  signed        [27:0]                  o8_23;
wire  signed        [27:0]                  o8_24;
wire  signed        [27:0]                  o8_25;
wire  signed        [27:0]                  o8_26;
wire  signed        [27:0]                  o8_27;
wire  signed        [27:0]                  o8_28;
wire  signed        [27:0]                  o8_29;
wire  signed        [27:0]                  o8_30;
wire  signed        [27:0]                  o8_31;

wire  signed        [27:0]                  o16_0;
wire  signed        [27:0]                  o16_1;
wire  signed        [27:0]                  o16_2;
wire  signed        [27:0]                  o16_3;
wire  signed        [27:0]                  o16_4;
wire  signed        [27:0]                  o16_5;
wire  signed        [27:0]                  o16_6;
wire  signed        [27:0]                  o16_7;
wire  signed        [27:0]                  o16_8;
wire  signed        [27:0]                  o16_9;
wire  signed        [27:0]                  o16_10;
wire  signed        [27:0]                  o16_11;
wire  signed        [27:0]                  o16_12;
wire  signed        [27:0]                  o16_13;
wire  signed        [27:0]                  o16_14;
wire  signed        [27:0]                  o16_15;
wire  signed        [27:0]                  o16_16;
wire  signed        [27:0]                  o16_17;
wire  signed        [27:0]                  o16_18;
wire  signed        [27:0]                  o16_19;
wire  signed        [27:0]                  o16_20;
wire  signed        [27:0]                  o16_21;
wire  signed        [27:0]                  o16_22;
wire  signed        [27:0]                  o16_23;
wire  signed        [27:0]                  o16_24;
wire  signed        [27:0]                  o16_25;
wire  signed        [27:0]                  o16_26;
wire  signed        [27:0]                  o16_27;
wire  signed        [27:0]                  o16_28;
wire  signed        [27:0]                  o16_29;
wire  signed        [27:0]                  o16_30;
wire  signed        [27:0]                  o16_31;


// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign enable_80=(i_transize[1]||i_transize[0]);
assign enable_81=((~i_transize[1])&i_transize[0]);
assign enable_82=(enable_81||enable_161);
assign enable_160=i_transize[1];
assign enable_161=((~i_transize[0])&i_transize[1]);
assign enable_320=(i_transize[1]&i_transize[0]);

assign in_0=inverse?'b0:i_0;
assign in_1=inverse?'b0:i_1;
assign in_2=inverse?'b0:i_2;
assign in_3=inverse?'b0:i_3;
assign in_4=inverse?'b0:i_4;
assign in_5=inverse?'b0:i_5;
assign in_6=inverse?'b0:i_6;
assign in_7=inverse?'b0:i_7;
assign in_8=inverse?'b0:i_8;
assign in_9=inverse?'b0:i_9;
assign in_10=inverse?'b0:i_10;
assign in_11=inverse?'b0:i_11;
assign in_12=inverse?'b0:i_12;
assign in_13=inverse?'b0:i_13;
assign in_14=inverse?'b0:i_14;
assign in_15=inverse?'b0:i_15;
assign in_16=inverse?'b0:i_16;
assign in_17=inverse?'b0:i_17;
assign in_18=inverse?'b0:i_18;
assign in_19=inverse?'b0:i_19;
assign in_20=inverse?'b0:i_20;
assign in_21=inverse?'b0:i_21;
assign in_22=inverse?'b0:i_22;
assign in_23=inverse?'b0:i_23;
assign in_24=inverse?'b0:i_24;
assign in_25=inverse?'b0:i_25;
assign in_26=inverse?'b0:i_26;
assign in_27=inverse?'b0:i_27;
assign in_28=inverse?'b0:i_28;
assign in_29=inverse?'b0:i_29;
assign in_30=inverse?'b0:i_30;
assign in_31=inverse?'b0:i_31;

// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

premuat3_8            p3_80( 
						    enable_80,
						    inverse,
						   in_0,
               in_1,
							 in_2,
							 in_3,
							 in_4,
							 in_5,
							 in_6,
							 in_7,
							   
							 o8_0,
               o8_1,
							 o8_2,
							 o8_3,
							 o8_4,
							 o8_5,
							 o8_6,
							 o8_7
);
							   
premuat3_8           p3_81( 
                         enable_81,
                           inverse,
						     in_8 ,
                             in_9 ,
							 in_10,
							 in_11,
							 in_12,
							 in_13,
							 in_14,
							 in_15,
							   
							 o8_8 ,
                             o8_9 ,
							 o8_10,
							 o8_11,
							 o8_12,
							 o8_13,
							 o8_14,
							 o8_15
);                   
            
premuat3_8          p3_82( 
                        enable_82,
                          inverse,
						   in_16,
                           in_17,
						   in_18,
						   in_19,
						   in_20,
						   in_21,
						   in_22,
						   in_23,
							   
						   o8_16,
                           o8_17,
						   o8_18,
						   o8_19,
						   o8_20,
						   o8_21,
						   o8_22,
						   o8_23
);                

premuat3_8           p3_83( 
                        enable_81,
                          inverse,
						   in_24,
                           in_25,
						   in_26,
						   in_27,
						   in_28,
						   in_29,
						   in_30,
						   in_31,
							   
						   o8_24,
                           o8_25,
						   o8_26,
						   o8_27,
						   o8_28,
						   o8_29,
						   o8_30,
						   o8_31
);                

premuat3_16         p3_160( 
						 enable_160,
						    inverse,
						    o8_0,
                            o8_1,
							o8_2,
							o8_3,
							o8_4,
							o8_5,
							o8_6,
							o8_7,
							o8_8,
                            o8_9 ,
							o8_10,
							o8_11,
							o8_12,
							o8_13,
							o8_14,
							o8_15,
							   
							o16_0,
                            o16_1,
							o16_2,
							o16_3,
							o16_4,
							o16_5,
							o16_6,
							o16_7,
							o16_8,
                            o16_9,
							o16_10,
							o16_11,
							o16_12,
							o16_13,
							o16_14,
							o16_15
);

premuat3_16          p3_161( 
						  enable_161,
						     inverse,
						     o8_16,
                             o8_17,
							 o8_18,
							 o8_19,
							 o8_20,
							 o8_21,
							 o8_22,
							 o8_23,
							 o8_24,
                             o8_25,
							 o8_26,
							 o8_27,
							 o8_28,
							 o8_29,
							 o8_30,
							 o8_31,
							   
						     o16_16,
                             o16_17,
							 o16_18,
							 o16_19,
							 o16_20,
							 o16_21,
							 o16_22,
							 o16_23,
							 o16_24,
                             o16_25,
							 o16_26,
							 o16_27,
							 o16_28,
							 o16_29,
							 o16_30,
							 o16_31
);

premuat3_32         p3_320(
            enable_320,
               inverse,
						    o16_0 ,
							o16_1 ,
							o16_2 ,
							o16_3 ,
							o16_4 ,
							o16_5 ,
							o16_6 ,
							o16_7 ,
							o16_8 ,
							o16_9 ,
							o16_10,
							o16_11,
							o16_12,
							o16_13,
							o16_14,
							o16_15,
							o16_16,
							o16_17,
							o16_18,
							o16_19,
							o16_20,
							o16_21,
							o16_22,
							o16_23,
							o16_24,
							o16_25,
							o16_26,
							o16_27,
							o16_28,
							o16_29,
							o16_30,
							o16_31,
								
							  o_0 ,
							  o_1 ,
							  o_2 ,
							  o_3 ,
							  o_4 ,
							  o_5 ,
							  o_6 ,
							  o_7 ,
							  o_8 ,
							  o_9 ,
							  o_10,
							  o_11,
							  o_12,
							  o_13,
							  o_14,
							  o_15,
							  o_16,
							  o_17,
							  o_18,
							  o_19,
							  o_20,
							  o_21,
							  o_22,
							  o_23,
							  o_24,
							  o_25,
							  o_26,
							  o_27,
							  o_28,
							  o_29,
							  o_30,
							  o_31
);

endmodule