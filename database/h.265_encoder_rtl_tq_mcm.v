module    mcm(
       clk,rst,
       i_valid,
       inverse,
    i_transize,
	  tq_sel_i,
  
           i_0,
           i_1,
           i_2,
           i_3,
           i_4,
           i_5,
           i_6,
           i_7,
           i_8,
           i_9,
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
         
        o_valid,
            o_0,
            o_1,
            o_2,
            o_3,
            o_4,
            o_5,
            o_6,
            o_7,
            o_8,
            o_9,
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
  
// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************  
  input                    clk;
  input                    rst;
  input                i_valid;
  input                inverse;
  input     [1:0]   i_transize;
  input     [1:0]     tq_sel_i;
  
  input signed   [18:0]    i_0;
  input signed   [18:0]    i_1;
  input signed   [18:0]    i_2;
  input signed   [18:0]    i_3;
  input signed   [18:0]    i_4;
  input signed   [18:0]    i_5;
  input signed   [18:0]    i_6;
  input signed   [18:0]    i_7;
  input signed   [18:0]    i_8;
  input signed   [18:0]    i_9;
  input signed   [18:0]    i_10;
  input signed   [18:0]    i_11;
  input signed   [18:0]    i_12;
  input signed   [18:0]    i_13;
  input signed   [18:0]    i_14;
  input signed   [18:0]    i_15;
  input signed   [18:0]    i_16;
  input signed   [18:0]    i_17;
  input signed   [18:0]    i_18;
  input signed   [18:0]    i_19;
  input signed   [18:0]    i_20;
  input signed   [18:0]    i_21;
  input signed   [18:0]    i_22;
  input signed   [18:0]    i_23;
  input signed   [18:0]    i_24;
  input signed   [18:0]    i_25;
  input signed   [18:0]    i_26;
  input signed   [18:0]    i_27;
  input signed   [18:0]    i_28;
  input signed   [18:0]    i_29;
  input signed   [18:0]    i_30;
  input signed   [18:0]    i_31;
 output  reg                  o_valid;
 output  reg   signed  [27:0]     o_0; 
 output  reg   signed  [27:0]     o_1; 
 output  reg   signed  [27:0]     o_2;
 output  reg   signed  [27:0]     o_3; 
 output  reg   signed  [27:0]     o_4;
 output  reg   signed  [27:0]     o_5;
 output  reg   signed  [27:0]     o_6;
 output  reg   signed  [27:0]     o_7;
 output  reg   signed  [27:0]     o_8;
 output  reg   signed  [27:0]     o_9; 
 output  reg   signed  [27:0]     o_10;
 output  reg   signed  [27:0]     o_11;
 output  reg   signed  [27:0]     o_12;
 output  reg   signed  [27:0]     o_13; 
 output  reg   signed  [27:0]     o_14;
 output  reg   signed  [27:0]     o_15; 
 output  reg   signed  [27:0]     o_16;
 output  reg   signed  [27:0]     o_17;
 output  reg   signed  [27:0]     o_18;
 output  reg   signed  [27:0]     o_19;
 output  reg   signed  [27:0]     o_20;
 output  reg   signed  [27:0]     o_21;
 output  reg   signed  [27:0]     o_22;
 output  reg   signed  [27:0]     o_23;
 output  reg   signed  [27:0]     o_24;
 output  reg   signed  [27:0]     o_25;
 output  reg   signed  [27:0]     o_26;
 output  reg   signed  [27:0]     o_27;
 output  reg   signed  [27:0]     o_28; 
 output  reg   signed  [27:0]     o_29; 
 output  reg   signed  [27:0]     o_30;
 output  reg   signed  [27:0]     o_31; 

// ****************************************************************
//
//	WIRE DECLARATION
//
// ****************************************************************
 
 wire    signed   [18:0]      in_0;
 wire    signed   [18:0]      in_1;
 wire    signed   [18:0]      in_2;
 wire    signed   [18:0]      in_3;
 wire    signed   [18:0]      in_4;
 wire    signed   [18:0]      in_5;
 wire    signed   [18:0]      in_6;
 wire    signed   [18:0]      in_7;
 wire    signed   [18:0]      in_8;
 wire    signed   [18:0]      in_9;
 wire    signed   [18:0]      in_10;
 wire    signed   [18:0]      in_11;
 wire    signed   [18:0]      in_12;
 wire    signed   [18:0]      in_13;
 wire    signed   [18:0]      in_14;
 wire    signed   [18:0]      in_15;
 wire    signed   [18:0]      in_16;
 wire    signed   [18:0]      in_17;
 wire    signed   [18:0]      in_18;
 wire    signed   [18:0]      in_19;
 wire    signed   [18:0]      in_20;
 wire    signed   [18:0]      in_21;
 wire    signed   [18:0]      in_22;
 wire    signed   [18:0]      in_23;
 wire    signed   [18:0]      in_24;
 wire    signed   [18:0]      in_25;
 wire    signed   [18:0]      in_26;
 wire    signed   [18:0]      in_27;
 wire    signed   [18:0]      in_28;
 wire    signed   [18:0]      in_29;
 wire    signed   [18:0]      in_30;
 wire    signed   [18:0]      in_31;
 
 wire    signed  [27:0]     oms00_0;
 wire    signed  [27:0]     oms00_1;
 wire    signed  [27:0]     oms00_2;
 wire    signed  [27:0]     oms00_3;
 wire    signed  [27:0]     oms01_0;
 wire    signed  [27:0]     oms01_1;
 wire    signed  [27:0]     oms01_2;
 wire    signed  [27:0]     oms01_3;
 wire    signed  [27:0]     oms02_0;
 wire    signed  [27:0]     oms02_1;
 wire    signed  [27:0]     oms02_2;
 wire    signed  [27:0]     oms02_3;
 wire    signed  [27:0]     oms03_0;
 wire    signed  [27:0]     oms03_1;
 wire    signed  [27:0]     oms03_2;
 wire    signed  [27:0]     oms03_3;
 
 
 wire    signed  [27:0]      om00_0;
 wire    signed  [27:0]      om00_1;
 wire    signed  [27:0]      om00_2;
 wire    signed  [27:0]      om00_3;
 wire    signed  [27:0]      om01_0;
 wire    signed  [27:0]      om01_1;
 wire    signed  [27:0]      om01_2;
 wire    signed  [27:0]      om01_3;
 wire    signed  [27:0]      om02_0;
 wire    signed  [27:0]      om02_1;
 wire    signed  [27:0]      om02_2;
 wire    signed  [27:0]      om02_3;
 wire    signed  [27:0]      om03_0;
 wire    signed  [27:0]      om03_1;
 wire    signed  [27:0]      om03_2;
 wire    signed  [27:0]      om03_3;
 
 wire    signed  [27:0]      om40_0;
 wire    signed  [27:0]      om40_1;
 wire    signed  [27:0]      om40_2;
 wire    signed  [27:0]      om40_3;
 wire    signed  [27:0]      om41_0;
 wire    signed  [27:0]      om41_1;
 wire    signed  [27:0]      om41_2;
 wire    signed  [27:0]      om41_3;
 wire    signed  [27:0]      om42_0;
 wire    signed  [27:0]      om42_1;
 wire    signed  [27:0]      om42_2;
 wire    signed  [27:0]      om42_3;
 wire    signed  [27:0]      om43_0;
 wire    signed  [27:0]      om43_1;
 wire    signed  [27:0]      om43_2;
 wire    signed  [27:0]      om43_3;
 
 wire    signed  [27:0]      om80_0;
 wire    signed  [27:0]      om80_1;
 wire    signed  [27:0]      om80_2;
 wire    signed  [27:0]      om80_3;
 wire    signed  [27:0]      om80_4;
 wire    signed  [27:0]      om80_5;
 wire    signed  [27:0]      om80_6;
 wire    signed  [27:0]      om80_7;
 wire    signed  [27:0]      om81_0;
 wire    signed  [27:0]      om81_1;
 wire    signed  [27:0]      om81_2;
 wire    signed  [27:0]      om81_3;
 wire    signed  [27:0]      om81_4;
 wire    signed  [27:0]      om81_5;
 wire    signed  [27:0]      om81_6;
 wire    signed  [27:0]      om81_7;
 
 wire    signed  [27:0]    om160_0 ;
 wire    signed  [27:0]    om160_1 ;
 wire    signed  [27:0]    om160_2 ;
 wire    signed  [27:0]    om160_3 ;
 wire    signed  [27:0]    om160_4 ;
 wire    signed  [27:0]    om160_5 ;
 wire    signed  [27:0]    om160_6 ;
 wire    signed  [27:0]    om160_7 ;
 wire    signed  [27:0]    om160_8 ;
 wire    signed  [27:0]    om160_9 ;
 wire    signed  [27:0]    om160_10;
 wire    signed  [27:0]    om160_11;
 wire    signed  [27:0]    om160_12;
 wire    signed  [27:0]    om160_13;
 wire    signed  [27:0]    om160_14;
 wire    signed  [27:0]    om160_15;
 
 
// *********************************************
//
//	REG DECLARATION
//
// **********************************************

 reg                      i_valid_1;
 
 reg    signed  [18:0]      ims00_0;
 reg    signed  [18:0]      ims00_1;
 reg    signed  [18:0]      ims00_2;
 reg    signed  [18:0]      ims00_3;
 reg    signed  [18:0]      ims01_0;
 reg    signed  [18:0]      ims01_1;
 reg    signed  [18:0]      ims01_2;
 reg    signed  [18:0]      ims01_3;
 reg    signed  [18:0]      ims02_0;
 reg    signed  [18:0]      ims02_1;
 reg    signed  [18:0]      ims02_2;
 reg    signed  [18:0]      ims02_3;
 reg    signed  [18:0]      ims03_0;
 reg    signed  [18:0]      ims03_1;
 reg    signed  [18:0]      ims03_2;
 reg    signed  [18:0]      ims03_3;
 
 reg    signed  [18:0]      im00_0;
 reg    signed  [18:0]      im00_1;
 reg    signed  [18:0]      im00_2;
 reg    signed  [18:0]      im00_3;
 reg    signed  [18:0]      im01_0;
 reg    signed  [18:0]      im01_1;
 reg    signed  [18:0]      im01_2;
 reg    signed  [18:0]      im01_3;
 reg    signed  [18:0]      im02_0;
 reg    signed  [18:0]      im02_1;
 reg    signed  [18:0]      im02_2;
 reg    signed  [18:0]      im02_3;
 reg    signed  [18:0]      im03_0;
 reg    signed  [18:0]      im03_1;
 reg    signed  [18:0]      im03_2;
 reg    signed  [18:0]      im03_3;
 
 reg    signed  [18:0]      im40_0;
 reg    signed  [18:0]      im40_1;
 reg    signed  [18:0]      im40_2;
 reg    signed  [18:0]      im40_3;
 reg    signed  [18:0]      im41_0;
 reg    signed  [18:0]      im41_1;
 reg    signed  [18:0]      im41_2;
 reg    signed  [18:0]      im41_3;
 reg    signed  [18:0]      im42_0;
 reg    signed  [18:0]      im42_1;
 reg    signed  [18:0]      im42_2;
 reg    signed  [18:0]      im42_3;
 reg    signed  [18:0]      im43_0;
 reg    signed  [18:0]      im43_1;
 reg    signed  [18:0]      im43_2;
 reg    signed  [18:0]      im43_3;
 
 reg    signed  [17:0]      im80_0;
 reg    signed  [17:0]      im80_1;
 reg    signed  [17:0]      im80_2;
 reg    signed  [17:0]      im80_3;
 reg    signed  [17:0]      im80_4;
 reg    signed  [17:0]      im80_5;
 reg    signed  [17:0]      im80_6;
 reg    signed  [17:0]      im80_7;
 reg    signed  [17:0]      im81_0;
 reg    signed  [17:0]      im81_1;
 reg    signed  [17:0]      im81_2;
 reg    signed  [17:0]      im81_3;
 reg    signed  [17:0]      im81_4;
 reg    signed  [17:0]      im81_5;
 reg    signed  [17:0]      im81_6;
 reg    signed  [17:0]      im81_7;
 
 reg    signed  [16:0]    im160_0 ;
 reg    signed  [16:0]    im160_1 ;
 reg    signed  [16:0]    im160_2 ;
 reg    signed  [16:0]    im160_3 ;
 reg    signed  [16:0]    im160_4 ;
 reg    signed  [16:0]    im160_5 ;
 reg    signed  [16:0]    im160_6 ;
 reg    signed  [16:0]    im160_7 ;
 reg    signed  [16:0]    im160_8 ;
 reg    signed  [16:0]    im160_9 ;
 reg    signed  [16:0]    im160_10;
 reg    signed  [16:0]    im160_11;
 reg    signed  [16:0]    im160_12;
 reg    signed  [16:0]    im160_13;
 reg    signed  [16:0]    im160_14;
 reg    signed  [16:0]    im160_15;


// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign in_0=i_valid?i_0:'b0;
assign in_1=i_valid?i_1:'b0;
assign in_2=i_valid?i_2:'b0;
assign in_3=i_valid?i_3:'b0;
assign in_4=i_valid?i_4:'b0;
assign in_5=i_valid?i_5:'b0;
assign in_6=i_valid?i_6:'b0;
assign in_7=i_valid?i_7:'b0;
assign in_8=i_valid?i_8:'b0;
assign in_9=i_valid?i_9:'b0;
assign in_10=i_valid?i_10:'b0;
assign in_11=i_valid?i_11:'b0;
assign in_12=i_valid?i_12:'b0;
assign in_13=i_valid?i_13:'b0;
assign in_14=i_valid?i_14:'b0;
assign in_15=i_valid?i_15:'b0;
assign in_16=i_valid?i_16:'b0;
assign in_17=i_valid?i_17:'b0;
assign in_18=i_valid?i_18:'b0;
assign in_19=i_valid?i_19:'b0;
assign in_20=i_valid?i_20:'b0;
assign in_21=i_valid?i_21:'b0;
assign in_22=i_valid?i_22:'b0;
assign in_23=i_valid?i_23:'b0;
assign in_24=i_valid?i_24:'b0;
assign in_25=i_valid?i_25:'b0;
assign in_26=i_valid?i_26:'b0;
assign in_27=i_valid?i_27:'b0;
assign in_28=i_valid?i_28:'b0;
assign in_29=i_valid?i_29:'b0;
assign in_30=i_valid?i_30:'b0;
assign in_31=i_valid?i_31:'b0;

always@(*)
case(i_transize)
  2'b00: if(!tq_sel_i[1])
      begin
	   im00_0='b0;im00_1='b0;im00_2='b0;im00_3='b0;
	   im01_0='b0;im01_1='b0;im01_2='b0;im01_3='b0;
	   im02_0='b0;im02_1='b0;im02_2='b0;im02_3='b0;
	   im03_0='b0;im03_1='b0;im03_2='b0;im03_3='b0;
	   
	   im40_0='b0;im40_1='b0;im40_2='b0;im40_3='b0;
	   im41_0='b0;im41_1='b0;im41_2='b0;im41_3='b0;
	   im42_0='b0;im42_1='b0;im42_2='b0;im42_3='b0;
	   im43_0='b0;im43_1='b0;im43_2='b0;im43_3='b0;
	   
	   im80_0='b0;im80_1='b0;im80_2='b0;im80_3='b0;
	   im80_4='b0;im80_5='b0;im80_6='b0;im80_7='b0;
	   im81_0='b0;im81_1='b0;im81_2='b0;im81_3='b0;
	   im81_4='b0;im81_5='b0;im81_6='b0;im81_7='b0;
	   
	   im160_0 ='b0;im160_1 ='b0;im160_2 ='b0;im160_3 ='b0;
	   im160_4 ='b0;im160_5 ='b0;im160_6 ='b0;im160_7 ='b0;
	   im160_8 ='b0;im160_9 ='b0;im160_10='b0;im160_11='b0;
	   im160_12='b0;im160_13='b0;im160_14='b0;im160_15='b0;
	   
	   
       ims00_0=in_0 ;
	   ims00_1=in_1 ;
	   ims00_2=in_2 ;
	   ims00_3=in_3 ;
	   ims01_0=in_8 ;
	   ims01_1=in_9 ;
	   ims01_2=in_10;
	   ims01_3=in_11;
	   ims02_0=in_16;
	   ims02_1=in_17;
	   ims02_2=in_18;
	   ims02_3=in_19;
       ims03_0=in_24;
	   ims03_1=in_25;
	   ims03_2=in_26;
	   ims03_3=in_27;
	  
 	   o_0 =oms00_0;
	   o_1 =oms00_1;
	   o_2 =oms00_2;
	   o_3 =oms00_3;
	   o_4=28'b0;
	   o_5=28'b0;
	   o_6=28'b0;
	   o_7=28'b0;
	   o_8  =oms01_0;
	   o_9  =oms01_1;
	   o_10 =oms01_2;
	   o_11 =oms01_3;
	   o_12=28'b0;
	   o_13=28'b0;
	   o_14=28'b0;
	   o_15=28'b0;
	   o_16=oms02_0;
	   o_17=oms02_1;
	   o_18=oms02_2;
	   o_19=oms02_3;
	   o_20=28'b0;
	   o_21=28'b0;
	   o_22=28'b0;
	   o_23=28'b0;
	   o_24=oms03_0;
	   o_25=oms03_1;
	   o_26=oms03_2;
	   o_27=oms03_3;
	   o_28=28'b0;
	   o_29=28'b0;
	   o_30=28'b0;
	   o_31=28'b0;
      end
 else  begin
       ims00_0='b0;ims00_1='b0;ims00_2='b0;ims00_3='b0;
	   ims01_0='b0;ims01_1='b0;ims01_2='b0;ims01_3='b0;
	   ims02_0='b0;ims02_1='b0;ims02_2='b0;ims02_3='b0;
	   ims03_0='b0;ims03_1='b0;ims03_2='b0;ims03_3='b0;
	   
	   im40_0='b0;im40_1='b0;im40_2='b0;im40_3='b0;
	   im41_0='b0;im41_1='b0;im41_2='b0;im41_3='b0;
	   im42_0='b0;im42_1='b0;im42_2='b0;im42_3='b0;
	   im43_0='b0;im43_1='b0;im43_2='b0;im43_3='b0;
	   
	   im80_0='b0;im80_1='b0;im80_2='b0;im80_3='b0;
	   im80_4='b0;im80_5='b0;im80_6='b0;im80_7='b0;
	   im81_0='b0;im81_1='b0;im81_2='b0;im81_3='b0;
	   im81_4='b0;im81_5='b0;im81_6='b0;im81_7='b0;
	   
	   im160_0 ='b0;im160_1 ='b0;im160_2 ='b0;im160_3 ='b0;
	   im160_4 ='b0;im160_5 ='b0;im160_6 ='b0;im160_7 ='b0;
	   im160_8 ='b0;im160_9 ='b0;im160_10='b0;im160_11='b0;
	   im160_12='b0;im160_13='b0;im160_14='b0;im160_15='b0;
	   
	   
       im00_0=in_0 ;
	   im00_1=in_1 ;
	   im00_2=in_2 ;
	   im00_3=in_3 ;
	   im01_0=in_8 ;
	   im01_1=in_9 ;
	   im01_2=in_10;
	   im01_3=in_11;
	   im02_0=in_16;
	   im02_1=in_17;
	   im02_2=in_18;
	   im02_3=in_19;
       im03_0=in_24;
	   im03_1=in_25;
	   im03_2=in_26;
	   im03_3=in_27;
	  
 	   o_0 =om00_0;
	   o_1 =om00_1;
	   o_2 =om00_2;
	   o_3 =om00_3;
	   o_4=28'b0;
	   o_5=28'b0;
	   o_6=28'b0;
	   o_7=28'b0;
	   o_8  =om01_0;
	   o_9  =om01_1;
	   o_10 =om01_2;
	   o_11 =om01_3;
	   o_12=28'b0;
	   o_13=28'b0;
	   o_14=28'b0;
	   o_15=28'b0;
	   o_16=om02_0;
	   o_17=om02_1;
	   o_18=om02_2;
	   o_19=om02_3;
	   o_20=28'b0;
	   o_21=28'b0;
	   o_22=28'b0;
	   o_23=28'b0;
	   o_24=om03_0;
	   o_25=om03_1;
	   o_26=om03_2;
	   o_27=om03_3;
	   o_28=28'b0;
	   o_29=28'b0;
	   o_30=28'b0;
	   o_31=28'b0;
      end
 
2'b01:begin
      im00_0=in_0;
	  im00_1=in_1;
	  im00_2=in_2;
	  im00_3=in_3;
	  im40_0=in_4;
	  im40_1=in_5;
	  im40_2=in_6;
	  im40_3=in_7;
	  
      im01_0=in_8 ;
	  im01_1=in_9 ;
	  im01_2=in_10;
	  im01_3=in_11;
	  im41_0=in_12;
	  im41_1=in_13;
	  im41_2=in_14;
	  im41_3=in_15;
	  
      im02_0=in_16;
	  im02_1=in_17;
	  im02_2=in_18;
	  im02_3=in_19;
	  im42_0=in_20;
	  im42_1=in_21;
	  im42_2=in_22;
	  im42_3=in_23;
	  
      im03_0=in_24;
	  im03_1=in_25;
	  im03_2=in_26;
	  im03_3=in_27;
	  im43_0=in_28;
	  im43_1=in_29;
	  im43_2=in_30;
	  im43_3=in_31;	  
	  
	   ims00_0='b0;ims00_1='b0;ims00_2='b0;ims00_3='b0;
	   ims01_0='b0;ims01_1='b0;ims01_2='b0;ims01_3='b0;
	   ims02_0='b0;ims02_1='b0;ims02_2='b0;ims02_3='b0;
	   ims03_0='b0;ims03_1='b0;ims03_2='b0;ims03_3='b0;
	   
	   im80_0='b0;im80_1='b0;im80_2='b0;im80_3='b0;
	   im80_4='b0;im80_5='b0;im80_6='b0;im80_7='b0;
	   im81_0='b0;im81_1='b0;im81_2='b0;im81_3='b0;
	   im81_4='b0;im81_5='b0;im81_6='b0;im81_7='b0;
	   
	   im160_0 ='b0;im160_1 ='b0;im160_2 ='b0;im160_3 ='b0;
	   im160_4 ='b0;im160_5 ='b0;im160_6 ='b0;im160_7 ='b0;
	   im160_8 ='b0;im160_9 ='b0;im160_10='b0;im160_11='b0;
	   im160_12='b0;im160_13='b0;im160_14='b0;im160_15='b0;
	  
	  o_0=om00_0;
	  o_1=om00_1;
	  o_2=om00_2;
	  o_3=om00_3;
	  o_4=om40_0;
	  o_5=om40_1;
	  o_6=om40_2;
	  o_7=om40_3;
	  
	  o_8 =om01_0;
	  o_9 =om01_1;
	  o_10=om01_2;
	  o_11=om01_3;
	  o_12=om41_0;
	  o_13=om41_1;
	  o_14=om41_2;
	  o_15=om41_3;
	  
	  o_16=om02_0;
	  o_17=om02_1;
	  o_18=om02_2;
	  o_19=om02_3;
	  o_20=om42_0;
	  o_21=om42_1;
	  o_22=om42_2;
	  o_23=om42_3;
	  
	  o_24=om03_0;
	  o_25=om03_1;
	  o_26=om03_2;
	  o_27=om03_3;
	  o_28=om43_0;
	  o_29=om43_1;
	  o_30=om43_2;
	  o_31=om43_3;
	end
	
 2'b10:begin
 
       ims00_0='b0;ims00_1='b0;ims00_2='b0;ims00_3='b0;
	   ims01_0='b0;ims01_1='b0;ims01_2='b0;ims01_3='b0;
	   ims02_0='b0;ims02_1='b0;ims02_2='b0;ims02_3='b0;
	   ims03_0='b0;ims03_1='b0;ims03_2='b0;ims03_3='b0; 
	   
       im02_0='b0;im02_1='b0;im02_2='b0;im02_3='b0;
	   im03_0='b0;im03_1='b0;im03_2='b0;im03_3='b0;
	   im42_0='b0;im42_1='b0;im42_2='b0;im42_3='b0;
	   im43_0='b0;im43_1='b0;im43_2='b0;im43_3='b0;
	   im160_0 ='b0;im160_1 ='b0;im160_2 ='b0;im160_3 ='b0;
	   im160_4 ='b0;im160_5 ='b0;im160_6 ='b0;im160_7 ='b0;
	   im160_8 ='b0;im160_9 ='b0;im160_10='b0;im160_11='b0;
	   im160_12='b0;im160_13='b0;im160_14='b0;im160_15='b0;
	   
 
       im00_0=in_0 ;
	   im00_1=in_1 ;
	   im00_2=in_2 ;
	   im00_3=in_3 ;
	   im40_0=in_4 ;
	   im40_1=in_5 ;
	   im40_2=in_6 ;
	   im40_3=in_7 ;
	   im80_0=in_8 ;
	   im80_1=in_9 ;
	   im80_2=in_10;
	   im80_3=in_11;
	   im80_4=in_12;
	   im80_5=in_13;
	   im80_6=in_14;
	   im80_7=in_15;
       im01_0=in_16;
	   im01_1=in_17;
	   im01_2=in_18;
	   im01_3=in_19;
	   im41_0=in_20;
	   im41_1=in_21;
	   im41_2=in_22;
	   im41_3=in_23;
	   im81_0=in_24;
	   im81_1=in_25;
	   im81_2=in_26;
	   im81_3=in_27;
	   im81_4=in_28;
	   im81_5=in_29;
	   im81_6=in_30;
	   im81_7=in_31;	   
	   
	   o_0 =om00_0;
	   o_1 =om00_1;
	   o_2 =om00_2;
	   o_3 =om00_3;
	   o_4 =om40_0;
	   o_5 =om40_1;
	   o_6 =om40_2;
	   o_7 =om40_3;
	   o_8 =om80_0;
	   o_9 =om80_1;
	   o_10=om80_2;
	   o_11=om80_3;
	   o_12=om80_4;
	   o_13=om80_5;
	   o_14=om80_6;
	   o_15=om80_7;
	   o_16=om01_0;
	   o_17=om01_1;
	   o_18=om01_2;
	   o_19=om01_3;
	   o_20=om41_0;
	   o_21=om41_1;
	   o_22=om41_2;
	   o_23=om41_3;
	   o_24=om81_0;
	   o_25=om81_1;
	   o_26=om81_2;
	   o_27=om81_3;
	   o_28=om81_4;
	   o_29=om81_5;
	   o_30=om81_6;
	   o_31=om81_7;
	   end
2'b11:begin
       ims00_0='b0;ims00_1='b0;ims00_2='b0;ims00_3='b0;
	   ims01_0='b0;ims01_1='b0;ims01_2='b0;ims01_3='b0;
	   ims02_0='b0;ims02_1='b0;ims02_2='b0;ims02_3='b0;
	   ims03_0='b0;ims03_1='b0;ims03_2='b0;ims03_3='b0;
	   
       im01_0='b0;im01_1='b0;im01_2='b0;im01_3='b0;
	   im02_0='b0;im02_1='b0;im02_2='b0;im02_3='b0;
	   im03_0='b0;im03_1='b0;im03_2='b0;im03_3='b0;
	   
	   im41_0='b0;im41_1='b0;im41_2='b0;im41_3='b0;
	   im42_0='b0;im42_1='b0;im42_2='b0;im42_3='b0;
	   im43_0='b0;im43_1='b0;im43_2='b0;im43_3='b0;
	   
	   im81_0='b0;im81_1='b0;im81_2='b0;im81_3='b0;
	   im81_4='b0;im81_5='b0;im81_6='b0;im81_7='b0;
	   

      im00_0=in_0 ;
	  im00_1=in_1 ;
	  im00_2=in_2 ;
	  im00_3=in_3 ;
	  im40_0=in_4 ;
	  im40_1=in_5 ;
	  im40_2=in_6 ;
	  im40_3=in_7 ;
	  im80_0=in_8 ;
	  im80_1=in_9 ;
	  im80_2=in_10;
	  im80_3=in_11;
	  im80_4=in_12;
	  im80_5=in_13;
	  im80_6=in_14;
	  im80_7=in_15;
	  im160_0=in_16;
	  im160_1=in_17;
	  im160_2=in_18;
	  im160_3=in_19;
	  im160_4=in_20;
	  im160_5=in_21;
	  im160_6=in_22;
	  im160_7=in_23;
	  im160_8=in_24;
	  im160_9=in_25;
	  im160_10=in_26;
	  im160_11=in_27;
	  im160_12=in_28;
	  im160_13=in_29;
	  im160_14=in_30;
	  im160_15=in_31;
	  
	  o_0 =om00_0;
	  o_1 =om00_1;
	  o_2 =om00_2;
	  o_3 =om00_3;
	  o_4 =om40_0;
	  o_5 =om40_1;
	  o_6 =om40_2;
	  o_7 =om40_3;
	  o_8 =om80_0;
	  o_9 =om80_1;
	  o_10=om80_2;
	  o_11=om80_3;
	  o_12=om80_4;
	  o_13=om80_5;
	  o_14=om80_6;
	  o_15=om80_7;
	  o_16=om160_0 ;
	  o_17=om160_1 ;
	  o_18=om160_2 ;
	  o_19=om160_3 ;
	  o_20=om160_4 ;
	  o_21=om160_5 ;
	  o_22=om160_6 ;
	  o_23=om160_7 ;
	  o_24=om160_8 ;
	  o_25=om160_9 ;
	  o_26=om160_10;
	  o_27=om160_11;
	  o_28=om160_12;
	  o_29=om160_13;
	  o_30=om160_14;
	  o_31=om160_15;
	end
endcase 

// ********************************************
//                                             
//    Sequence Logic                      
//                                             
// ********************************************

always@(posedge clk or negedge rst)
if(!rst)
  i_valid_1<=1'b0;
else
  i_valid_1<=i_valid;

always@(posedge clk or negedge rst)
if(!rst)
  o_valid<=1'b0;
else
  o_valid<=i_valid_1;


// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

dst                dst_0(
                    .clk(clk),
                    .rst(rst),  
                  .inverse(inverse),	  
                  .i_0(ims00_0),
                  .i_1(ims00_1),
                  .i_2(ims00_2),
                  .i_3(ims00_3),
         
                  .o_0(oms00_0),
                  .o_1(oms00_1),
                  .o_2(oms00_2),
                  .o_3(oms00_3)
  );
  
 dst                dst_1(
                    .clk(clk),
                    .rst(rst),  
                  .inverse(inverse),
                  .i_0(ims01_0),
                  .i_1(ims01_1),
                  .i_2(ims01_2),
                  .i_3(ims01_3),
                           
                  .o_0(oms01_0),
                  .o_1(oms01_1),
                  .o_2(oms01_2),
                  .o_3(oms01_3)
  );
  
dst                dst_2(
                   .clk(clk),
                   .rst(rst),  
                 .inverse(inverse),  
                 .i_0(ims02_0),
                 .i_1(ims02_1),
                 .i_2(ims02_2),
                 .i_3(ims02_3),
                          
                 .o_0(oms02_0),
                 .o_1(oms02_1),
                 .o_2(oms02_2),
                 .o_3(oms02_3)
 );
  
dst                dst_3(
                   .clk(clk),
                   .rst(rst),  
                 .inverse(inverse),
                 .i_0(ims03_0),
                 .i_1(ims03_1),
                 .i_2(ims03_2),
                 .i_3(ims03_3),
                         
                 .o_0(oms03_0),
                 .o_1(oms03_1),
                 .o_2(oms03_2),
                 .o_3(oms03_3)
  );
  
mcm_0              m0_0(
                     .clk(clk),
                     .rst(rst),  
                 .inverse(inverse),	  
                 .i_0(im00_0),
                 .i_1(im00_1),
                 .i_2(im00_2),
                 .i_3(im00_3),
                 
                 .o_0(om00_0),
                 .o_1(om00_1),
                 .o_2(om00_2),
                 .o_3(om00_3)
  );         

mcm_0              m0_1(
                    .clk(clk),
                    .rst(rst),  
                .inverse(inverse),	 
                .i_0(im01_0),
                .i_1(im01_1),
                .i_2(im01_2),
                .i_3(im01_3),
                        
                .o_0(om01_0),
                .o_1(om01_1),
                .o_2(om01_2),
                .o_3(om01_3)
  );
  
mcm_0              m0_2(
                    .clk(clk),
                    .rst(rst),  
                .inverse(inverse),	   
                .i_0(im02_0),
                .i_1(im02_1),
                .i_2(im02_2),
                .i_3(im02_3),
                        
                .o_0(om02_0),
                .o_1(om02_1),
                .o_2(om02_2),
                .o_3(om02_3)
  );  
  
mcm_0              m0_3(
                    .clk(clk),
                    .rst(rst),    
                .inverse(inverse),	 	  
                .i_0(im03_0),
                .i_1(im03_1),
                .i_2(im03_2),
                .i_3(im03_3),
                        
                .o_0(om03_0),
                .o_1(om03_1),
                .o_2(om03_2),
                .o_3(om03_3)
  );  
    
mcm_4              m4_0(
                    .clk(clk),
                    .rst(rst),  
                .inverse(inverse),
				        
                    .i_0(im40_0),
                    .i_1(im40_1),
                    .i_2(im40_2),
                    .i_3(im40_3),
            
                    .m1_0(om40_0),
                    .m1_1(om40_1),
                    .m1_2(om40_2),
                    .m1_3(om40_3)
  );  

mcm_4              m4_1(
                      .clk(clk),
                      .rst(rst),  
                  .inverse(inverse),
                         
                       .i_0(im41_0),
                       .i_1(im41_1),
                       .i_2(im41_2),
                       .i_3(im41_3),
                               
                      .m1_0(om41_0),
                      .m1_1(om41_1),
                      .m1_2(om41_2),
                      .m1_3(om41_3)
  );

mcm_4              m4_2(
                       .clk(clk),
                      .rst(rst),  
                  .inverse(inverse),
                         
                       .i_0(im42_0),
                       .i_1(im42_1),
                       .i_2(im42_2),
                       .i_3(im42_3),
                               
                      .m1_0(om42_0),
                      .m1_1(om42_1),
                      .m1_2(om42_2),
                      .m1_3(om42_3)
  );

mcm_4              m4_3(
                      .clk(clk),
                      .rst(rst),  
                  .inverse(inverse),
                         
                       .i_0(im43_0),
                       .i_1(im43_1),
                       .i_2(im43_2),
                       .i_3(im43_3),
                               
                      .m1_0(om43_0),
                      .m1_1(om43_1),
                      .m1_2(om43_2),
                      .m1_3(om43_3)
  );

  
mcm_8              m8_0(
                      .clk(clk),
                      .rst(rst),  
                  .inverse(inverse),	  
                      .i_0(im80_0),
                      .i_1(im80_1),
                      .i_2(im80_2),
                      .i_3(im80_3),
				      .i_4(im80_4),
				      .i_5(im80_5),
				      .i_6(im80_6),
                      .i_7(im80_7),
				         
                     .m2_0(om80_0),
                     .m2_1(om80_1),
                     .m2_2(om80_2),
                     .m2_3(om80_3),
                     .m2_4(om80_4),
                     .m2_5(om80_5),
                     .m2_6(om80_6),
                     .m2_7(om80_7)

  );  

mcm_8              m8_1(
                    .clk(clk),
                    .rst(rst),  
                .inverse(inverse),
                    .i_0(im81_0),
                    .i_1(im81_1),
                    .i_2(im81_2),
                    .i_3(im81_3),
				    .i_4(im81_4),
				    .i_5(im81_5),
				    .i_6(im81_6),
                    .i_7(im81_7),
				           
                   .m2_0(om81_0),
                   .m2_1(om81_1),
                   .m2_2(om81_2),
                   .m2_3(om81_3),
                   .m2_4(om81_4),
                   .m2_5(om81_5),
                   .m2_6(om81_6),
                   .m2_7(om81_7)
  );  

mcm_16            m16_0(
                 .clk(clk),
                 .rst(rst),  
            .inverse(inverse),	  
                    
			    .i_0(im160_0),
                .i_1(im160_1),
                .i_2(im160_2),
                .i_3(im160_3),
			    .i_4(im160_4),
			    .i_5(im160_5),
			    .i_6(im160_6),
                .i_7(im160_7),
			    .i_8(im160_8),
                .i_9(im160_9),
                .i_10(im160_10),
                .i_11(im160_11),
			    .i_12(im160_12),
			    .i_13(im160_13),
			    .i_14(im160_14),
                .i_15(im160_15),
			       
                .m3_0(om160_0),
                .m3_1(om160_1),
                .m3_2(om160_2),
                .m3_3(om160_3),
			    .m3_4(om160_4),
			    .m3_5(om160_5),
			    .m3_6(om160_6),
                .m3_7(om160_7),
			    .m3_8(om160_8),
                .m3_9(om160_9),
               .m3_10(om160_10),
               .m3_11(om160_11),
			   .m3_12(om160_12),
			   .m3_13(om160_13),
			   .m3_14(om160_14),
               .m3_15(om160_15)

  );  


endmodule