module     premuat(
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
input              [1:0]               i_transize;
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

output   signed     [27:0]                 o_0 ;
output   signed     [27:0]                 o_1 ;
output   signed     [27:0]                 o_2 ;
output   signed     [27:0]                 o_3 ;
output   signed     [27:0]                 o_4 ;
output   signed     [27:0]                 o_5 ;
output   signed     [27:0]                 o_6 ;
output   signed     [27:0]                 o_7 ;
output   signed     [27:0]                 o_8 ;
output   signed     [27:0]                 o_9 ;
output   signed     [27:0]                 o_10;
output   signed     [27:0]                 o_11;
output   signed     [27:0]                 o_12;
output   signed     [27:0]                 o_13;
output   signed     [27:0]                 o_14;
output   signed     [27:0]                 o_15;
output   signed     [27:0]                 o_16;
output   signed     [27:0]                 o_17;
output   signed     [27:0]                 o_18;
output   signed     [27:0]                 o_19;
output   signed     [27:0]                 o_20;
output   signed     [27:0]                 o_21;
output   signed     [27:0]                 o_22;
output   signed     [27:0]                 o_23;
output   signed     [27:0]                 o_24;
output   signed     [27:0]                 o_25;
output   signed     [27:0]                 o_26;
output   signed     [27:0]                 o_27;
output   signed     [27:0]                 o_28;
output   signed     [27:0]                 o_29;
output   signed     [27:0]                 o_30;
output   signed     [27:0]                 o_31;

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

wire  signed        [27:0]                ip80_0;
wire  signed        [27:0]                ip80_1;
wire  signed        [27:0]                ip80_2;
wire  signed        [27:0]                ip80_3;
wire  signed        [27:0]                ip80_4;
wire  signed        [27:0]                ip80_5;
wire  signed        [27:0]                ip80_6;
wire  signed        [27:0]                ip80_7;

wire  signed        [27:0]                ip81_0;
wire  signed        [27:0]                ip81_1;
wire  signed        [27:0]                ip81_2;
wire  signed        [27:0]                ip81_3;
wire  signed        [27:0]                ip81_4;
wire  signed        [27:0]                ip81_5;
wire  signed        [27:0]                ip81_6;
wire  signed        [27:0]                ip81_7;

wire  signed        [27:0]                ip82_0;
wire  signed        [27:0]                ip82_1;
wire  signed        [27:0]                ip82_2;
wire  signed        [27:0]                ip82_3;
wire  signed        [27:0]                ip82_4;
wire  signed        [27:0]                ip82_5;
wire  signed        [27:0]                ip82_6;
wire  signed        [27:0]                ip82_7;

wire  signed        [27:0]                ip83_0;
wire  signed        [27:0]                ip83_1;
wire  signed        [27:0]                ip83_2;
wire  signed        [27:0]                ip83_3;
wire  signed        [27:0]                ip83_4;
wire  signed        [27:0]                ip83_5;
wire  signed        [27:0]                ip83_6;
wire  signed        [27:0]                ip83_7;

wire  signed        [27:0]                ip160_0 ;
wire  signed        [27:0]                ip160_1 ;
wire  signed        [27:0]                ip160_2 ;
wire  signed        [27:0]                ip160_3 ;
wire  signed        [27:0]                ip160_4 ;
wire  signed        [27:0]                ip160_5 ;
wire  signed        [27:0]                ip160_6 ;
wire  signed        [27:0]                ip160_7 ;
wire  signed        [27:0]                ip160_8 ;
wire  signed        [27:0]                ip160_9 ;
wire  signed        [27:0]                ip160_10;
wire  signed        [27:0]                ip160_11;
wire  signed        [27:0]                ip160_12;
wire  signed        [27:0]                ip160_13;
wire  signed        [27:0]                ip160_14;
wire  signed        [27:0]                ip160_15;

wire  signed        [27:0]                ip161_0 ;
wire  signed        [27:0]                ip161_1 ;
wire  signed        [27:0]                ip161_2 ;
wire  signed        [27:0]                ip161_3 ;
wire  signed        [27:0]                ip161_4 ;
wire  signed        [27:0]                ip161_5 ;
wire  signed        [27:0]                ip161_6 ;
wire  signed        [27:0]                ip161_7 ;
wire  signed        [27:0]                ip161_8 ;
wire  signed        [27:0]                ip161_9 ;
wire  signed        [27:0]                ip161_10;
wire  signed        [27:0]                ip161_11;
wire  signed        [27:0]                ip161_12;
wire  signed        [27:0]                ip161_13;
wire  signed        [27:0]                ip161_14;
wire  signed        [27:0]                ip161_15;

wire  signed        [27:0]                ip320_0 ;
wire  signed        [27:0]                ip320_1 ;
wire  signed        [27:0]                ip320_2 ;
wire  signed        [27:0]                ip320_3 ;
wire  signed        [27:0]                ip320_4 ;
wire  signed        [27:0]                ip320_5 ;
wire  signed        [27:0]                ip320_6 ;
wire  signed        [27:0]                ip320_7 ;
wire  signed        [27:0]                ip320_8 ;
wire  signed        [27:0]                ip320_9 ;
wire  signed        [27:0]                ip320_10;
wire  signed        [27:0]                ip320_11;
wire  signed        [27:0]                ip320_12;
wire  signed        [27:0]                ip320_13;
wire  signed        [27:0]                ip320_14;
wire  signed        [27:0]                ip320_15;
wire  signed        [27:0]                ip320_16;
wire  signed        [27:0]                ip320_17;
wire  signed        [27:0]                ip320_18;
wire  signed        [27:0]                ip320_19;
wire  signed        [27:0]                ip320_20;
wire  signed        [27:0]                ip320_21;
wire  signed        [27:0]                ip320_22;
wire  signed        [27:0]                ip320_23;
wire  signed        [27:0]                ip320_24;
wire  signed        [27:0]                ip320_25;
wire  signed        [27:0]                ip320_26;
wire  signed        [27:0]                ip320_27;
wire  signed        [27:0]                ip320_28;
wire  signed        [27:0]                ip320_29;
wire  signed        [27:0]                ip320_30;
wire  signed        [27:0]                ip320_31;

wire  signed        [27:0]                  op80_0;
wire  signed        [27:0]                  op80_1;
wire  signed        [27:0]                  op80_2;
wire  signed        [27:0]                  op80_3;
wire  signed        [27:0]                  op80_4;
wire  signed        [27:0]                  op80_5;
wire  signed        [27:0]                  op80_6;
wire  signed        [27:0]                  op80_7;

wire  signed        [27:0]                  op81_0;
wire  signed        [27:0]                  op81_1;
wire  signed        [27:0]                  op81_2;
wire  signed        [27:0]                  op81_3;
wire  signed        [27:0]                  op81_4;
wire  signed        [27:0]                  op81_5;
wire  signed        [27:0]                  op81_6;
wire  signed        [27:0]                  op81_7;

wire  signed        [27:0]                  op82_0;
wire  signed        [27:0]                  op82_1;
wire  signed        [27:0]                  op82_2;
wire  signed        [27:0]                  op82_3;
wire  signed        [27:0]                  op82_4;
wire  signed        [27:0]                  op82_5;
wire  signed        [27:0]                  op82_6;
wire  signed        [27:0]                  op82_7;

wire  signed        [27:0]                  op83_0;
wire  signed        [27:0]                  op83_1;
wire  signed        [27:0]                  op83_2;
wire  signed        [27:0]                  op83_3;
wire  signed        [27:0]                  op83_4;
wire  signed        [27:0]                  op83_5;
wire  signed        [27:0]                  op83_6;
wire  signed        [27:0]                  op83_7;

wire  signed        [27:0]                op160_0 ;
wire  signed        [27:0]                op160_1 ;
wire  signed        [27:0]                op160_2 ;
wire  signed        [27:0]                op160_3 ;
wire  signed        [27:0]                op160_4 ;
wire  signed        [27:0]                op160_5 ;
wire  signed        [27:0]                op160_6 ;
wire  signed        [27:0]                op160_7 ;
wire  signed        [27:0]                op160_8 ;
wire  signed        [27:0]                op160_9 ;
wire  signed        [27:0]                op160_10;
wire  signed        [27:0]                op160_11;
wire  signed        [27:0]                op160_12;
wire  signed        [27:0]                op160_13;
wire  signed        [27:0]                op160_14;
wire  signed        [27:0]                op160_15;

wire  signed        [27:0]                op161_0 ;
wire  signed        [27:0]                op161_1 ;
wire  signed        [27:0]                op161_2 ;
wire  signed        [27:0]                op161_3 ;
wire  signed        [27:0]                op161_4 ;
wire  signed        [27:0]                op161_5 ;
wire  signed        [27:0]                op161_6 ;
wire  signed        [27:0]                op161_7 ;
wire  signed        [27:0]                op161_8 ;
wire  signed        [27:0]                op161_9 ;
wire  signed        [27:0]                op161_10;
wire  signed        [27:0]                op161_11;
wire  signed        [27:0]                op161_12;
wire  signed        [27:0]                op161_13;
wire  signed        [27:0]                op161_14;
wire  signed        [27:0]                op161_15;

wire  signed        [27:0]                op320_0 ;
wire  signed        [27:0]                op320_1 ;
wire  signed        [27:0]                op320_2 ;
wire  signed        [27:0]                op320_3 ;
wire  signed        [27:0]                op320_4 ;
wire  signed        [27:0]                op320_5 ;
wire  signed        [27:0]                op320_6 ;
wire  signed        [27:0]                op320_7 ;
wire  signed        [27:0]                op320_8 ;
wire  signed        [27:0]                op320_9 ;
wire  signed        [27:0]                op320_10;
wire  signed        [27:0]                op320_11;
wire  signed        [27:0]                op320_12;
wire  signed        [27:0]                op320_13;
wire  signed        [27:0]                op320_14;
wire  signed        [27:0]                op320_15;
wire  signed        [27:0]                op320_16;
wire  signed        [27:0]                op320_17;
wire  signed        [27:0]                op320_18;
wire  signed        [27:0]                op320_19;
wire  signed        [27:0]                op320_20;
wire  signed        [27:0]                op320_21;
wire  signed        [27:0]                op320_22;
wire  signed        [27:0]                op320_23;
wire  signed        [27:0]                op320_24;
wire  signed        [27:0]                op320_25;
wire  signed        [27:0]                op320_26;
wire  signed        [27:0]                op320_27;
wire  signed        [27:0]                op320_28;
wire  signed        [27:0]                op320_29;
wire  signed        [27:0]                op320_30;
wire  signed        [27:0]                op320_31;

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

assign  ip320_0 =inverse?i_0 :op160_0 ;
assign  ip320_1 =inverse?i_1 :op160_1 ;
assign  ip320_2 =inverse?i_2 :op160_2 ;
assign  ip320_3 =inverse?i_3 :op160_3 ;
assign  ip320_4 =inverse?i_4 :op160_4 ;
assign  ip320_5 =inverse?i_5 :op160_5 ;
assign  ip320_6 =inverse?i_6 :op160_6 ;
assign  ip320_7 =inverse?i_7 :op160_7 ;
assign  ip320_8 =inverse?i_8 :op160_8 ;
assign  ip320_9 =inverse?i_9 :op160_9 ;
assign  ip320_10=inverse?i_10:op160_10;
assign  ip320_11=inverse?i_11:op160_11;
assign  ip320_12=inverse?i_12:op160_12;
assign  ip320_13=inverse?i_13:op160_13;
assign  ip320_14=inverse?i_14:op160_14;
assign  ip320_15=inverse?i_15:op160_15;
assign  ip320_16=inverse?i_16:op161_0 ;
assign  ip320_17=inverse?i_17:op161_1 ;
assign  ip320_18=inverse?i_18:op161_2 ;
assign  ip320_19=inverse?i_19:op161_3 ;
assign  ip320_20=inverse?i_20:op161_4 ;
assign  ip320_21=inverse?i_21:op161_5 ;
assign  ip320_22=inverse?i_22:op161_6 ;
assign  ip320_23=inverse?i_23:op161_7 ;
assign  ip320_24=inverse?i_24:op161_8 ;
assign  ip320_25=inverse?i_25:op161_9 ;
assign  ip320_26=inverse?i_26:op161_10;
assign  ip320_27=inverse?i_27:op161_11;
assign  ip320_28=inverse?i_28:op161_12;
assign  ip320_29=inverse?i_29:op161_13;
assign  ip320_30=inverse?i_30:op161_14;
assign  ip320_31=inverse?i_31:op161_15;

assign  ip160_0 =inverse?op320_0 :op80_0;
assign  ip160_1 =inverse?op320_1 :op80_1;
assign  ip160_2 =inverse?op320_2 :op80_2;
assign  ip160_3 =inverse?op320_3 :op80_3;
assign  ip160_4 =inverse?op320_4 :op80_4;
assign  ip160_5 =inverse?op320_5 :op80_5;
assign  ip160_6 =inverse?op320_6 :op80_6;
assign  ip160_7 =inverse?op320_7 :op80_7;
assign  ip160_8 =inverse?op320_8 :op81_0;
assign  ip160_9 =inverse?op320_9 :op81_1;
assign  ip160_10=inverse?op320_10:op81_2;
assign  ip160_11=inverse?op320_11:op81_3;
assign  ip160_12=inverse?op320_12:op81_4;
assign  ip160_13=inverse?op320_13:op81_5;
assign  ip160_14=inverse?op320_14:op81_6;
assign  ip160_15=inverse?op320_15:op81_7;
assign  ip161_0 =inverse?op320_16:op82_0;
assign  ip161_1 =inverse?op320_17:op82_1;
assign  ip161_2 =inverse?op320_18:op82_2;
assign  ip161_3 =inverse?op320_19:op82_3;
assign  ip161_4 =inverse?op320_20:op82_4;
assign  ip161_5 =inverse?op320_21:op82_5;
assign  ip161_6 =inverse?op320_22:op82_6;
assign  ip161_7 =inverse?op320_23:op82_7;
assign  ip161_8 =inverse?op320_24:op83_0;
assign  ip161_9 =inverse?op320_25:op83_1;
assign  ip161_10=inverse?op320_26:op83_2;
assign  ip161_11=inverse?op320_27:op83_3;
assign  ip161_12=inverse?op320_28:op83_4;
assign  ip161_13=inverse?op320_29:op83_5;
assign  ip161_14=inverse?op320_30:op83_6;
assign  ip161_15=inverse?op320_31:op83_7;

assign  ip80_0=inverse?op160_0 :i_0 ;
assign  ip80_1=inverse?op160_1 :i_1 ;
assign  ip80_2=inverse?op160_2 :i_2 ;
assign  ip80_3=inverse?op160_3 :i_3 ;
assign  ip80_4=inverse?op160_4 :i_4 ;
assign  ip80_5=inverse?op160_5 :i_5 ;
assign  ip80_6=inverse?op160_6 :i_6 ;
assign  ip80_7=inverse?op160_7 :i_7 ;
assign  ip81_0=inverse?op160_8 :i_8 ;
assign  ip81_1=inverse?op160_9 :i_9 ;
assign  ip81_2=inverse?op160_10:i_10;
assign  ip81_3=inverse?op160_11:i_11;
assign  ip81_4=inverse?op160_12:i_12;
assign  ip81_5=inverse?op160_13:i_13;
assign  ip81_6=inverse?op160_14:i_14;
assign  ip81_7=inverse?op160_15:i_15;
assign  ip82_0=inverse?op161_0 :i_16;
assign  ip82_1=inverse?op161_1 :i_17;
assign  ip82_2=inverse?op161_2 :i_18;
assign  ip82_3=inverse?op161_3 :i_19;
assign  ip82_4=inverse?op161_4 :i_20;
assign  ip82_5=inverse?op161_5 :i_21;
assign  ip82_6=inverse?op161_6 :i_22;
assign  ip82_7=inverse?op161_7 :i_23;
assign  ip83_0=inverse?op161_8 :i_24;
assign  ip83_1=inverse?op161_9 :i_25;
assign  ip83_2=inverse?op161_10:i_26;
assign  ip83_3=inverse?op161_11:i_27;
assign  ip83_4=inverse?op161_12:i_28;
assign  ip83_5=inverse?op161_13:i_29;
assign  ip83_6=inverse?op161_14:i_30;
assign  ip83_7=inverse?op161_15:i_31;

assign  o_0 =inverse?op80_0:op320_0 ;
assign  o_1 =inverse?op80_1:op320_1 ;
assign  o_2 =inverse?op80_2:op320_2 ;
assign  o_3 =inverse?op80_3:op320_3 ;
assign  o_4 =inverse?op80_4:op320_4 ;
assign  o_5 =inverse?op80_5:op320_5 ;
assign  o_6 =inverse?op80_6:op320_6 ;
assign  o_7 =inverse?op80_7:op320_7 ;
assign  o_8 =inverse?op81_0:op320_8 ;
assign  o_9 =inverse?op81_1:op320_9 ;
assign  o_10=inverse?op81_2:op320_10;
assign  o_11=inverse?op81_3:op320_11;
assign  o_12=inverse?op81_4:op320_12;
assign  o_13=inverse?op81_5:op320_13;
assign  o_14=inverse?op81_6:op320_14;
assign  o_15=inverse?op81_7:op320_15;
assign  o_16=inverse?op82_0:op320_16;
assign  o_17=inverse?op82_1:op320_17;
assign  o_18=inverse?op82_2:op320_18;
assign  o_19=inverse?op82_3:op320_19;
assign  o_20=inverse?op82_4:op320_20;
assign  o_21=inverse?op82_5:op320_21;
assign  o_22=inverse?op82_6:op320_22;
assign  o_23=inverse?op82_7:op320_23;
assign  o_24=inverse?op83_0:op320_24;
assign  o_25=inverse?op83_1:op320_25;
assign  o_26=inverse?op83_2:op320_26;
assign  o_27=inverse?op83_3:op320_27;
assign  o_28=inverse?op83_4:op320_28;
assign  o_29=inverse?op83_5:op320_29;
assign  o_30=inverse?op83_6:op320_30;
assign  o_31=inverse?op83_7:op320_31;


// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

premuat_8            p80( 
						    enable_80,
						    inverse,
						     ip80_0,
                 ip80_1,
							   ip80_2,
							   ip80_3,
							   ip80_4,
							   ip80_5,
							   ip80_6,
							   ip80_7,
							   
							   op80_0,
                 op80_1,
							   op80_2,
							   op80_3,
							   op80_4,
							   op80_5,
							   op80_6,
							   op80_7
);
							   
premuat_8           p81( 
              enable_81,
                inverse,
						     ip81_0,
                 ip81_1,
							   ip81_2,
							   ip81_3,
							   ip81_4,
							   ip81_5,
							   ip81_6,
							   ip81_7,
							   
							   op81_0,
                 op81_1,
							   op81_2,
							   op81_3,
							   op81_4,
							   op81_5,
							   op81_6,
							   op81_7
);                   
            
premuat_8          p82( 
              enable_82,
                inverse,
						     ip82_0,
                 ip82_1,
							   ip82_2,
							   ip82_3,
							   ip82_4,
							   ip82_5,
							   ip82_6,
							   ip82_7,
							   
							   op82_0,
                 op82_1,
							   op82_2,
							   op82_3,
							   op82_4,
							   op82_5,
							   op82_6,
							   op82_7
);                

premuat_8           p83( 
              enable_81,
                inverse,
						     ip83_0,
                 ip83_1,
							   ip83_2,
							   ip83_3,
							   ip83_4,
							   ip83_5,
							   ip83_6,
							   ip83_7,
							   
							   op83_0,
                 op83_1,
							   op83_2,
							   op83_3,
							   op83_4,
							   op83_5,
							   op83_6,
							   op83_7
);                

premuat_16         p160( 
						 enable_160,
						    inverse,
						    ip160_0,
                ip160_1,
							  ip160_2,
							  ip160_3,
							  ip160_4,
							  ip160_5,
							  ip160_6,
							  ip160_7,
							  ip160_8 ,
                ip160_9 ,
							  ip160_10,
							  ip160_11,
							  ip160_12,
							  ip160_13,
							  ip160_14,
							  ip160_15,
							   
							  op160_0,
                op160_1,
							  op160_2,
							  op160_3,
							  op160_4,
							  op160_5,
							  op160_6,
							  op160_7,
							  op160_8,
                op160_9,
							  op160_10,
							  op160_11,
							  op160_12,
							  op160_13,
							  op160_14,
							  op160_15
);

premuat_16          p161( 
						  enable_161,
						     inverse,
						     ip161_0,
                 ip161_1,
							   ip161_2,
							   ip161_3,
							   ip161_4,
							   ip161_5,
							   ip161_6,
							   ip161_7,
							   ip161_8 ,
                 ip161_9 ,
							   ip161_10,
							   ip161_11,
							   ip161_12,
							   ip161_13,
							   ip161_14,
							   ip161_15,
							   
						     op161_0,
                 op161_1,
							   op161_2,
							   op161_3,
							   op161_4,
							   op161_5,
							   op161_6,
							   op161_7,
							   op161_8 ,
                 op161_9 ,
							   op161_10,
							   op161_11,
							   op161_12,
							   op161_13,
							   op161_14,
							   op161_15
);

premuat_32         p320(
              enable_320,
                 inverse,
							  ip320_0 ,
								ip320_1 ,
								ip320_2 ,
								ip320_3 ,
								ip320_4 ,
								ip320_5 ,
								ip320_6 ,
								ip320_7 ,
							  ip320_8 ,
								ip320_9 ,
								ip320_10,
								ip320_11,
								ip320_12,
								ip320_13,
								ip320_14,
								ip320_15,
								ip320_16,
								ip320_17,
								ip320_18,
								ip320_19,
								ip320_20,
								ip320_21,
								ip320_22,
								ip320_23,
							  ip320_24,
								ip320_25,
								ip320_26,
								ip320_27,
								ip320_28,
								ip320_29,
								ip320_30,
								ip320_31,
								
								op320_0 ,
								op320_1 ,
								op320_2 ,
								op320_3 ,
								op320_4 ,
								op320_5 ,
								op320_6 ,
								op320_7 ,
							  op320_8 ,
								op320_9 ,
								op320_10,
								op320_11,
								op320_12,
								op320_13,
								op320_14,
								op320_15,
								op320_16,
								op320_17,
								op320_18,
								op320_19,
								op320_20,
								op320_21,
								op320_22,
								op320_23,
							  op320_24,
								op320_25,
								op320_26,
								op320_27,
								op320_28,
								op320_29,
								op320_30,
								op320_31
);

endmodule








