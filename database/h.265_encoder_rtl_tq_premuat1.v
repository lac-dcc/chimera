module     premuat1(
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
input   signed     [15:0]                  i_0 ;
input   signed     [15:0]                  i_1 ;
input   signed     [15:0]                  i_2 ;
input   signed     [15:0]                  i_3 ;
input   signed     [15:0]                  i_4 ;
input   signed     [15:0]                  i_5 ;
input   signed     [15:0]                  i_6 ;
input   signed     [15:0]                  i_7 ;
input   signed     [15:0]                  i_8 ;
input   signed     [15:0]                  i_9 ;
input   signed     [15:0]                  i_10;
input   signed     [15:0]                  i_11;
input   signed     [15:0]                  i_12;
input   signed     [15:0]                  i_13;
input   signed     [15:0]                  i_14;
input   signed     [15:0]                  i_15;
input   signed     [15:0]                  i_16;
input   signed     [15:0]                  i_17;
input   signed     [15:0]                  i_18;
input   signed     [15:0]                  i_19;
input   signed     [15:0]                  i_20;
input   signed     [15:0]                  i_21;
input   signed     [15:0]                  i_22;
input   signed     [15:0]                  i_23;
input   signed     [15:0]                  i_24;
input   signed     [15:0]                  i_25;
input   signed     [15:0]                  i_26;
input   signed     [15:0]                  i_27;
input   signed     [15:0]                  i_28;
input   signed     [15:0]                  i_29;
input   signed     [15:0]                  i_30;
input   signed     [15:0]                  i_31;

output  signed     [15:0]                 o_0 ;
output  signed     [15:0]                 o_1 ;
output  signed     [15:0]                 o_2 ;
output  signed     [15:0]                 o_3 ;
output  signed     [15:0]                 o_4 ;
output  signed     [15:0]                 o_5 ;
output  signed     [15:0]                 o_6 ;
output  signed     [15:0]                 o_7 ;
output  signed     [15:0]                 o_8 ;
output  signed     [15:0]                 o_9 ;
output  signed     [15:0]                 o_10;
output  signed     [15:0]                 o_11;
output  signed     [15:0]                 o_12;
output  signed     [15:0]                 o_13;
output  signed     [15:0]                 o_14;
output  signed     [15:0]                 o_15;
output  signed     [15:0]                 o_16;
output  signed     [15:0]                 o_17;
output  signed     [15:0]                 o_18;
output  signed     [15:0]                 o_19;
output  signed     [15:0]                 o_20;
output  signed     [15:0]                 o_21;
output  signed     [15:0]                 o_22;
output  signed     [15:0]                 o_23;
output  signed     [15:0]                 o_24;
output  signed     [15:0]                 o_25;
output  signed     [15:0]                 o_26;
output  signed     [15:0]                 o_27;
output  signed     [15:0]                 o_28;
output  signed     [15:0]                 o_29;
output  signed     [15:0]                 o_30;
output  signed     [15:0]                 o_31;

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

wire  signed        [15:0]                 in_0;  
wire  signed        [15:0]                 in_1; 
wire  signed        [15:0]                 in_2; 
wire  signed        [15:0]                 in_3; 
wire  signed        [15:0]                 in_4; 
wire  signed        [15:0]                 in_5; 
wire  signed        [15:0]                 in_6; 
wire  signed        [15:0]                 in_7; 
wire  signed        [15:0]                 in_8; 
wire  signed        [15:0]                 in_9; 
wire  signed        [15:0]                 in_10; 
wire  signed        [15:0]                 in_11; 
wire  signed        [15:0]                 in_12; 
wire  signed        [15:0]                 in_13; 
wire  signed        [15:0]                 in_14; 
wire  signed        [15:0]                 in_15; 
wire  signed        [15:0]                 in_16; 
wire  signed        [15:0]                 in_17; 
wire  signed        [15:0]                 in_18; 
wire  signed        [15:0]                 in_19; 
wire  signed        [15:0]                 in_20; 
wire  signed        [15:0]                 in_21; 
wire  signed        [15:0]                 in_22; 
wire  signed        [15:0]                 in_23; 
wire  signed        [15:0]                 in_24; 
wire  signed        [15:0]                 in_25; 
wire  signed        [15:0]                 in_26; 
wire  signed        [15:0]                 in_27; 
wire  signed        [15:0]                 in_28; 
wire  signed        [15:0]                 in_29; 
wire  signed        [15:0]                 in_30; 
wire  signed        [15:0]                 in_31; 

wire  signed        [15:0]                 o32_0;
wire  signed        [15:0]                 o32_1;
wire  signed        [15:0]                 o32_2;
wire  signed        [15:0]                 o32_3;
wire  signed        [15:0]                 o32_4;
wire  signed        [15:0]                 o32_5;
wire  signed        [15:0]                 o32_6;
wire  signed        [15:0]                 o32_7;
wire  signed        [15:0]                 o32_8;
wire  signed        [15:0]                 o32_9;
wire  signed        [15:0]                 o32_10;
wire  signed        [15:0]                 o32_11;
wire  signed        [15:0]                 o32_12;
wire  signed        [15:0]                 o32_13;
wire  signed        [15:0]                 o32_14;
wire  signed        [15:0]                 o32_15;
wire  signed        [15:0]                 o32_16;
wire  signed        [15:0]                 o32_17;
wire  signed        [15:0]                 o32_18;
wire  signed        [15:0]                 o32_19;
wire  signed        [15:0]                 o32_20;
wire  signed        [15:0]                 o32_21;
wire  signed        [15:0]                 o32_22;
wire  signed        [15:0]                 o32_23;
wire  signed        [15:0]                 o32_24;
wire  signed        [15:0]                 o32_25;
wire  signed        [15:0]                 o32_26;
wire  signed        [15:0]                 o32_27;
wire  signed        [15:0]                 o32_28;
wire  signed        [15:0]                 o32_29;
wire  signed        [15:0]                 o32_30;
wire  signed        [15:0]                 o32_31;

wire  signed        [15:0]                  o16_0;
wire  signed        [15:0]                  o16_1;
wire  signed        [15:0]                  o16_2;
wire  signed        [15:0]                  o16_3;
wire  signed        [15:0]                  o16_4;
wire  signed        [15:0]                  o16_5;
wire  signed        [15:0]                  o16_6;
wire  signed        [15:0]                  o16_7;
wire  signed        [15:0]                  o16_8;
wire  signed        [15:0]                  o16_9;
wire  signed        [15:0]                  o16_10;
wire  signed        [15:0]                  o16_11;
wire  signed        [15:0]                  o16_12;
wire  signed        [15:0]                  o16_13;
wire  signed        [15:0]                  o16_14;
wire  signed        [15:0]                  o16_15;
wire  signed        [15:0]                  o16_16;
wire  signed        [15:0]                  o16_17;
wire  signed        [15:0]                  o16_18;
wire  signed        [15:0]                  o16_19;
wire  signed        [15:0]                  o16_20;
wire  signed        [15:0]                  o16_21;
wire  signed        [15:0]                  o16_22;
wire  signed        [15:0]                  o16_23;
wire  signed        [15:0]                  o16_24;
wire  signed        [15:0]                  o16_25;
wire  signed        [15:0]                  o16_26;
wire  signed        [15:0]                  o16_27;
wire  signed        [15:0]                  o16_28;
wire  signed        [15:0]                  o16_29;
wire  signed        [15:0]                  o16_30;
wire  signed        [15:0]                  o16_31;


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

assign in_0=inverse?i_0:'b0;
assign in_1=inverse?i_1:'b0;
assign in_2=inverse?i_2:'b0;
assign in_3=inverse?i_3:'b0;
assign in_4=inverse?i_4:'b0;
assign in_5=inverse?i_5:'b0;
assign in_6=inverse?i_6:'b0;
assign in_7=inverse?i_7:'b0;
assign in_8=inverse?i_8:'b0;
assign in_9=inverse?i_9:'b0;
assign in_10=inverse?i_10:'b0;
assign in_11=inverse?i_11:'b0;
assign in_12=inverse?i_12:'b0;
assign in_13=inverse?i_13:'b0;
assign in_14=inverse?i_14:'b0;
assign in_15=inverse?i_15:'b0;
assign in_16=inverse?i_16:'b0;
assign in_17=inverse?i_17:'b0;
assign in_18=inverse?i_18:'b0;
assign in_19=inverse?i_19:'b0;
assign in_20=inverse?i_20:'b0;
assign in_21=inverse?i_21:'b0;
assign in_22=inverse?i_22:'b0;
assign in_23=inverse?i_23:'b0;
assign in_24=inverse?i_24:'b0;
assign in_25=inverse?i_25:'b0;
assign in_26=inverse?i_26:'b0;
assign in_27=inverse?i_27:'b0;
assign in_28=inverse?i_28:'b0;
assign in_29=inverse?i_29:'b0;
assign in_30=inverse?i_30:'b0;
assign in_31=inverse?i_31:'b0;

// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

premuat1_8            p1_80( 
						    enable_80,
						    inverse,
						     o16_0,
                             o16_1,
							 o16_2,
							 o16_3,
							 o16_4,
							 o16_5,
							 o16_6,
							 o16_7,
							   
							   o_0,
                               o_1,
							   o_2,
							   o_3,
							   o_4,
							   o_5,
							   o_6,
							   o_7
);
							   
premuat1_8           p1_81( 
                         enable_81,
                           inverse,
						     o16_8 ,
                             o16_9 ,
							 o16_10,
							 o16_11,
							 o16_12,
							 o16_13,
							 o16_14,
							 o16_15,
							   
							  o_8 ,
                              o_9 ,
							  o_10,
							  o_11,
							  o_12,
							  o_13,
							  o_14,
							  o_15
);                   
            
premuat1_8          p1_82( 
                        enable_82,
                          inverse,
						   o16_16,
                           o16_17,
						   o16_18,
						   o16_19,
						   o16_20,
						   o16_21,
						   o16_22,
						   o16_23,
							   
						     o_16,
                             o_17,
						     o_18,
						     o_19,
						     o_20,
						     o_21,
						     o_22,
						     o_23
);                

premuat1_8           p1_83( 
                        enable_81,
                          inverse,
						   o16_24,
                           o16_25,
						   o16_26,
						   o16_27,
						   o16_28,
						   o16_29,
						   o16_30,
						   o16_31,
							   
						     o_24,
                             o_25,
						     o_26,
						     o_27,
						     o_28,
						     o_29,
						     o_30,
						     o_31
);                

premuat1_16         p1_160( 
						 enable_160,
						    inverse,
						    o32_0,
                            o32_1,
							o32_2,
							o32_3,
							o32_4,
							o32_5,
							o32_6,
							o32_7,
							o32_8,
                            o32_9 ,
							o32_10,
							o32_11,
							o32_12,
							o32_13,
							o32_14,
							o32_15,
							   
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

premuat1_16          p1_161( 
						  enable_161,
						     inverse,
						     o32_16,
                             o32_17,
							 o32_18,
							 o32_19,
							 o32_20,
							 o32_21,
							 o32_22,
							 o32_23,
							 o32_24,
                             o32_25,
							 o32_26,
							 o32_27,
							 o32_28,
							 o32_29,
							 o32_30,
							 o32_31,
							   
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

premuat1_32         p1_320(
                       enable_320,
                          inverse,
						    in_0 ,
							in_1 ,
							in_2 ,
							in_3 ,
							in_4 ,
							in_5 ,
							in_6 ,
							in_7 ,
							in_8 ,
							in_9 ,
							in_10,
							in_11,
							in_12,
							in_13,
							in_14,
							in_15,
							in_16,
							in_17,
							in_18,
							in_19,
							in_20,
							in_21,
							in_22,
							in_23,
							in_24,
							in_25,
							in_26,
							in_27,
							in_28,
							in_29,
							in_30,
							in_31,
								
							o32_0 ,
							o32_1 ,
							o32_2 ,
							o32_3 ,
							o32_4 ,
							o32_5 ,
							o32_6 ,
							o32_7 ,
							o32_8 ,
							o32_9 ,
							o32_10,
							o32_11,
							o32_12,
							o32_13,
							o32_14,
							o32_15,
							o32_16,
							o32_17,
							o32_18,
							o32_19,
							o32_20,
							o32_21,
							o32_22,
							o32_23,
							o32_24,
							o32_25,
							o32_26,
							o32_27,
							o32_28,
							o32_29,
							o32_30,
							o32_31
);

endmodule