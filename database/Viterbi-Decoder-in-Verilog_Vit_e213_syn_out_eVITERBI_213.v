// Synopsys FPGA Express automatically generated file
// This file will be overwritten by each chip export
// Author: joshea
// Program: FPGA Compiler II
// Version: 3.3.1.4719

module FDCE ( Q , D , C , CLR , CE );

    output Q ;
    input D ;
    input C ;
    input CLR ;
    input CE ;
    
    wire synch_enable ;
    wire next_state ;
    wire net0 ;
    wire net1 ;
    
    reg Q ;
    
    always@( posedge C or posedge CLR )
    begin
        if ( CLR ) Q <= 1'b0;
        else Q <= ( next_state );
    end
    assign net0 = ( Q & ~CE );
    assign net1 = ( D & CE );
    assign next_state = ~( ~net0 & ~net1 );
    assign synch_enable = ( 1'b1 );

endmodule
module g_lut(I , O);
// synopsys template
parameter N = 4;
parameter INIT1 = 16'h0000;
parameter INIT2 = 16'h0000;

input [N-1 : 0] I;
output O;
reg O;

reg [N-1 : 0] POS , INDEX , VAL;
reg [63 : 0] INIT;

always @(I)
begin
    POS = 0;
    VAL = 1;
    for(INDEX = 0; INDEX < N; INDEX = INDEX + 1)
    begin
        if(I[INDEX])
            POS = POS + VAL;
        VAL = VAL * 2;
    end
    INIT = { INIT2 , INIT1 };
    O = INIT[POS];
end
endmodule

module eBMU_213 ( HD1 , HD2 , HD3 , HD4 , HD5 , HD6 , HD7 , HD8 , HD9 , 
    HD10 , HD11 , HD12 , HD13 , HD14 , HD15 , HD16 , Rx , le , clock , 
    reset );

    output [1:0] HD1 ;
    output [1:0] HD2 ;
    output [1:0] HD3 ;
    output [1:0] HD4 ;
    output [1:0] HD5 ;
    output [1:0] HD6 ;
    output [1:0] HD7 ;
    output [1:0] HD8 ;
    output [1:0] HD9 ;
    output [1:0] HD10 ;
    output [1:0] HD11 ;
    output [1:0] HD12 ;
    output [1:0] HD13 ;
    output [1:0] HD14 ;
    output [1:0] HD15 ;
    output [1:0] HD16 ;
    input [1:0] Rx ;
    input le ;
    input clock ;
    input reset ;
    
    wire N33 ;
    wire N38 ;
    wire N128 ;
    wire N129 ;
    wire N132 ;
    wire N133 ;
    
    FDCE  \HD16_reg<0> ( .CLR ( reset ) , .D ( N38 ) , .CE ( le ) , .C ( 
        clock ) , .Q ( HD16 [0] ) );
    FDCE  \HD16_reg<1> ( .CLR ( reset ) , .C ( clock ) , .D ( N129 ) , 
        .CE ( le ) , .Q ( HD16 [1] ) );
    FDCE  \HD15_reg<0> ( .CE ( le ) , .CLR ( reset ) , .C ( clock ) , .Q ( 
        HD15 [0] ) , .D ( N38 ) );
    FDCE  \HD15_reg<1> ( .CLR ( reset ) , .D ( N128 ) , .Q ( HD15 [1] ) 
        , .CE ( le ) , .C ( clock ) );
    FDCE  \HD14_reg<0> ( .CE ( le ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        N33 ) , .Q ( HD14 [0] ) );
    FDCE  \HD14_reg<1> ( .CE ( le ) , .C ( clock ) , .Q ( HD14 [1] ) , 
        .CLR ( reset ) , .D ( N133 ) );
    FDCE  \HD13_reg<0> ( .CE ( le ) , .CLR ( reset ) , .D ( N33 ) , .C ( 
        clock ) , .Q ( HD13 [0] ) );
    FDCE  \HD13_reg<1> ( .CE ( le ) , .Q ( HD13 [1] ) , .CLR ( reset ) 
        , .C ( clock ) , .D ( N132 ) );
    FDCE  \HD12_reg<0> ( .CE ( le ) , .C ( clock ) , .D ( N38 ) , .CLR ( 
        reset ) , .Q ( HD12 [0] ) );
    FDCE  \HD12_reg<1> ( .CE ( le ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        N128 ) , .Q ( HD12 [1] ) );
    FDCE  \HD11_reg<0> ( .CE ( le ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        N38 ) , .Q ( HD11 [0] ) );
    FDCE  \HD11_reg<1> ( .CLR ( reset ) , .D ( N129 ) , .Q ( HD11 [1] ) 
        , .CE ( le ) , .C ( clock ) );
    FDCE  \HD10_reg<0> ( .CLR ( reset ) , .D ( N33 ) , .CE ( le ) , .C ( 
        clock ) , .Q ( HD10 [0] ) );
    FDCE  \HD10_reg<1> ( .CLR ( reset ) , .C ( clock ) , .CE ( le ) , .D ( 
        N132 ) , .Q ( HD10 [1] ) );
    FDCE  \HD9_reg<0> ( .CE ( le ) , .C ( clock ) , .D ( N33 ) , .CLR ( 
        reset ) , .Q ( HD9 [0] ) );
    FDCE  \HD9_reg<1> ( .D ( N133 ) , .CE ( le ) , .CLR ( reset ) , .C ( 
        clock ) , .Q ( HD9 [1] ) );
    FDCE  \HD8_reg<0> ( .CLR ( reset ) , .C ( clock ) , .Q ( HD8 [0] ) 
        , .CE ( le ) , .D ( N38 ) );
    FDCE  \HD8_reg<1> ( .CE ( le ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        N128 ) , .Q ( HD8 [1] ) );
    FDCE  \HD7_reg<0> ( .CE ( le ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        N38 ) , .Q ( HD7 [0] ) );
    FDCE  \HD7_reg<1> ( .CLR ( reset ) , .C ( clock ) , .D ( N129 ) , .CE ( 
        le ) , .Q ( HD7 [1] ) );
    FDCE  \HD6_reg<0> ( .CLR ( reset ) , .C ( clock ) , .CE ( le ) , .D ( 
        N33 ) , .Q ( HD6 [0] ) );
    FDCE  \HD6_reg<1> ( .CE ( le ) , .Q ( HD6 [1] ) , .CLR ( reset ) , 
        .C ( clock ) , .D ( N132 ) );
    FDCE  \HD5_reg<0> ( .CE ( le ) , .CLR ( reset ) , .D ( N33 ) , .C ( 
        clock ) , .Q ( HD5 [0] ) );
    FDCE  \HD5_reg<1> ( .C ( clock ) , .Q ( HD5 [1] ) , .CE ( le ) , .CLR ( 
        reset ) , .D ( N133 ) );
    FDCE  \HD4_reg<0> ( .CE ( le ) , .D ( N38 ) , .CLR ( reset ) , .C ( 
        clock ) , .Q ( HD4 [0] ) );
    FDCE  \HD4_reg<1> ( .CE ( le ) , .CLR ( reset ) , .D ( N129 ) , .C ( 
        clock ) , .Q ( HD4 [1] ) );
    FDCE  \HD3_reg<0> ( .C ( clock ) , .Q ( HD3 [0] ) , .CE ( le ) , .CLR ( 
        reset ) , .D ( N38 ) );
    FDCE  \HD3_reg<1> ( .CE ( le ) , .CLR ( reset ) , .D ( N128 ) , .C ( 
        clock ) , .Q ( HD3 [1] ) );
    FDCE  \HD2_reg<0> ( .C ( clock ) , .Q ( HD2 [0] ) , .CE ( le ) , .CLR ( 
        reset ) , .D ( N33 ) );
    FDCE  \HD2_reg<1> ( .CLR ( reset ) , .CE ( le ) , .C ( clock ) , .D ( 
        N133 ) , .Q ( HD2 [1] ) );
    FDCE  \HD1_reg<0> ( .CE ( le ) , .CLR ( reset ) , .D ( N33 ) , .C ( 
        clock ) , .Q ( HD1 [0] ) );
    FDCE  \HD1_reg<1> ( .C ( clock ) , .D ( N132 ) , .CE ( le ) , .CLR ( 
        reset ) , .Q ( HD1 [1] ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C369 ( .I ({ Rx [1] , Rx [0] }) , .O ( N33 ) 
    );
    g_lut # ( 2 , 4'h4, 0'h0 ) C370 ( .I ({ Rx [1] , Rx [0] }) , .O ( N128 ) 
    );
    g_lut # ( 2 , 4'h2, 0'h0 ) C371 ( .I ({ Rx [1] , Rx [0] }) , .O ( N129 ) 
    );
    g_lut # ( 2 , 4'h9, 0'h0 ) C372 ( .I ({ Rx [1] , Rx [0] }) , .O ( N38 ) 
    );
    g_lut # ( 2 , 4'h8, 0'h0 ) C373 ( .I ({ Rx [1] , Rx [0] }) , .O ( N132 ) 
    );
    g_lut # ( 2 , 4'h1, 0'h0 ) C374 ( .I ({ Rx [1] , Rx [0] }) , .O ( N133 ) 
    );

endmodule

module eACS_213_0 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
    , HD_inb , ae , clock , reset );

    output [3:0] acs_ppm_out ;
    output acs_Bx_out ;
    input [3:0] acs_ppm_ina ;
    input [1:0] HD_ina ;
    input [3:0] acs_ppm_inb ;
    input [1:0] HD_inb ;
    input ae ;
    input clock ;
    input reset ;
    
    wire \suma<3> ;
    wire \suma<2> ;
    wire \suma<1> ;
    wire \suma<0> ;
    wire \sumb<3> ;
    wire \sumb<2> ;
    wire \sumb<1> ;
    wire \sumb<0> ;
    wire \C5/N6 ;
    wire \C5/N12 ;
    wire \C5/N18 ;
    wire \C5/N24 ;
    wire \C6/N6 ;
    wire \C6/N12 ;
    wire \C6/N18 ;
    wire \C6/N24 ;
    wire syn260 ;
    wire cell15 ;
    wire \C18/C2 ;
    wire syn1114 ;
    wire syn221 ;
    wire cell4 ;
    wire \C4/C0/C2 ;
    wire syn1096 ;
    wire syn169 ;
    wire syn160 ;
    wire syn161 ;
    
    FDCE  \sumb_reg<0> ( .CLR ( reset ) , .CE ( ae ) , .C ( clock ) , .D ( 
        \C6/N6 ) , .Q ( \sumb<0> ) );
    FDCE  \sumb_reg<1> ( .CE ( ae ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \C6/N12 ) , .Q ( \sumb<1> ) );
    FDCE  \sumb_reg<2> ( .CE ( ae ) , .C ( clock ) , .Q ( \sumb<2> ) , 
        .CLR ( reset ) , .D ( \C6/N18 ) );
    FDCE  \sumb_reg<3> ( .CE ( ae ) , .C ( clock ) , .Q ( \sumb<3> ) , 
        .CLR ( reset ) , .D ( \C6/N24 ) );
    FDCE  \suma_reg<0> ( .CLR ( reset ) , .D ( \C5/N6 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \suma<0> ) );
    FDCE  \suma_reg<1> ( .CE ( ae ) , .D ( \C5/N12 ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \suma<1> ) );
    FDCE  \suma_reg<2> ( .CE ( ae ) , .C ( clock ) , .D ( \C5/N18 ) , .CLR ( 
        reset ) , .Q ( \suma<2> ) );
    FDCE  \suma_reg<3> ( .CE ( ae ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \C5/N24 ) , .Q ( \suma<3> ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C74 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn260 }) , .O ( \C5/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C75 ( .I ({ acs_ppm_ina [2] , syn260 }) , 
    .O ( \C5/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C76 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( syn260 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C77 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( \C5/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C78 ( .I ({ acs_ppm_ina [0] , HD_ina [0] }) , 
    .O ( \C18/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C79 ( .I ({ acs_ppm_ina [0] , HD_ina [0] , 
    cell15 }) , .O ( \C5/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C80 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn1114 }) , .O ( cell15 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C81 ( .I ({ ae , acs_ppm_ina [0] , acs_ppm_ina [1] }) , 
    .O ( syn1114 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C82 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn221 }) , .O ( \C6/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C83 ( .I ({ acs_ppm_inb [2] , syn221 }) , 
    .O ( \C6/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C84 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( syn221 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C85 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( \C6/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C86 ( .I ({ acs_ppm_inb [0] , HD_inb [0] }) , 
    .O ( \C4/C0/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C87 ( .I ({ acs_ppm_inb [0] , HD_inb [0] , 
    cell4 }) , .O ( \C6/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C88 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn1096 }) , .O ( cell4 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C89 ( .I ({ ae , acs_ppm_inb [0] , acs_ppm_inb [1] }) , 
    .O ( syn1096 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C90 ( .I ({ \sumb<0> , \suma<0> , acs_Bx_out }) , 
    .O ( acs_ppm_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C91 ( .I ({ \sumb<1> , \suma<1> , acs_Bx_out }) , 
    .O ( acs_ppm_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C92 ( .I ({ \sumb<2> , \suma<2> , acs_Bx_out }) , 
    .O ( acs_ppm_out [2] ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C93 ( .I ({ \suma<3> , \sumb<3> , acs_Bx_out }) , 
    .O ( acs_ppm_out [3] ) );
    g_lut # ( 4 , 16'h80c8, 0'h0 ) C94 ( .I ({ \suma<3> , \sumb<3> , ae , 
    syn169 }) , .O ( acs_Bx_out ) );
    g_lut # ( 4 , 16'hef0e, 0'h0 ) C95 ( .I ({ \sumb<2> , \suma<2> , syn160 , 
    syn161 }) , .O ( syn169 ) );
    g_lut # ( 3 , 8'h0d, 0'h0 ) C96 ( .I ({ \suma<1> , \sumb<0> , \suma<0> }) , 
    .O ( syn161 ) );
    g_lut # ( 4 , 16'hdf00, 0'h0 ) C97 ( .I ({ \sumb<1> , \suma<1> , \sumb<0> , 
    \suma<0> }) , .O ( syn160 ) );

endmodule

module eACS_213_1 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
    , HD_inb , ae , clock , reset );

    output [3:0] acs_ppm_out ;
    output acs_Bx_out ;
    input [3:0] acs_ppm_ina ;
    input [1:0] HD_ina ;
    input [3:0] acs_ppm_inb ;
    input [1:0] HD_inb ;
    input ae ;
    input clock ;
    input reset ;
    
    wire \suma<3> ;
    wire \suma<2> ;
    wire \suma<1> ;
    wire \suma<0> ;
    wire \sumb<3> ;
    wire \sumb<2> ;
    wire \sumb<1> ;
    wire \sumb<0> ;
    wire \C5/N6 ;
    wire \C5/N12 ;
    wire \C5/N18 ;
    wire \C5/N24 ;
    wire \C6/N6 ;
    wire \C6/N12 ;
    wire \C6/N18 ;
    wire \C6/N24 ;
    wire syn260 ;
    wire cell15 ;
    wire \C18/C2 ;
    wire syn1114 ;
    wire syn221 ;
    wire cell4 ;
    wire \C4/C0/C2 ;
    wire syn1096 ;
    wire syn169 ;
    wire syn160 ;
    wire syn161 ;
    
    FDCE  \sumb_reg<0> ( .CE ( ae ) , .C ( clock ) , .Q ( \sumb<0> ) , 
        .CLR ( reset ) , .D ( \C6/N6 ) );
    FDCE  \sumb_reg<1> ( .CE ( ae ) , .D ( \C6/N12 ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \sumb<1> ) );
    FDCE  \sumb_reg<2> ( .CE ( ae ) , .C ( clock ) , .D ( \C6/N18 ) , .CLR ( 
        reset ) , .Q ( \sumb<2> ) );
    FDCE  \sumb_reg<3> ( .CE ( ae ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \C6/N24 ) , .Q ( \sumb<3> ) );
    FDCE  \suma_reg<0> ( .CLR ( reset ) , .D ( \C5/N6 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \suma<0> ) );
    FDCE  \suma_reg<1> ( .CLR ( reset ) , .D ( \C5/N12 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \suma<1> ) );
    FDCE  \suma_reg<2> ( .CE ( ae ) , .CLR ( reset ) , .D ( \C5/N18 ) , 
        .C ( clock ) , .Q ( \suma<2> ) );
    FDCE  \suma_reg<3> ( .CE ( ae ) , .D ( \C5/N24 ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \suma<3> ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C74 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn260 }) , .O ( \C5/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C75 ( .I ({ acs_ppm_ina [2] , syn260 }) , 
    .O ( \C5/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C76 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( syn260 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C77 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( \C5/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C78 ( .I ({ acs_ppm_ina [0] , HD_ina [0] }) , 
    .O ( \C18/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C79 ( .I ({ acs_ppm_ina [0] , HD_ina [0] , 
    cell15 }) , .O ( \C5/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C80 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn1114 }) , .O ( cell15 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C81 ( .I ({ ae , acs_ppm_ina [0] , acs_ppm_ina [1] }) , 
    .O ( syn1114 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C82 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn221 }) , .O ( \C6/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C83 ( .I ({ acs_ppm_inb [2] , syn221 }) , 
    .O ( \C6/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C84 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( syn221 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C85 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( \C6/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C86 ( .I ({ acs_ppm_inb [0] , HD_inb [0] }) , 
    .O ( \C4/C0/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C87 ( .I ({ acs_ppm_inb [0] , HD_inb [0] , 
    cell4 }) , .O ( \C6/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C88 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn1096 }) , .O ( cell4 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C89 ( .I ({ ae , acs_ppm_inb [0] , acs_ppm_inb [1] }) , 
    .O ( syn1096 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C90 ( .I ({ \sumb<0> , \suma<0> , acs_Bx_out }) , 
    .O ( acs_ppm_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C91 ( .I ({ \sumb<1> , \suma<1> , acs_Bx_out }) , 
    .O ( acs_ppm_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C92 ( .I ({ \sumb<2> , \suma<2> , acs_Bx_out }) , 
    .O ( acs_ppm_out [2] ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C93 ( .I ({ \suma<3> , \sumb<3> , acs_Bx_out }) , 
    .O ( acs_ppm_out [3] ) );
    g_lut # ( 4 , 16'h80c8, 0'h0 ) C94 ( .I ({ \suma<3> , \sumb<3> , ae , 
    syn169 }) , .O ( acs_Bx_out ) );
    g_lut # ( 4 , 16'hef0e, 0'h0 ) C95 ( .I ({ \sumb<2> , \suma<2> , syn160 , 
    syn161 }) , .O ( syn169 ) );
    g_lut # ( 3 , 8'h0d, 0'h0 ) C96 ( .I ({ \suma<1> , \sumb<0> , \suma<0> }) , 
    .O ( syn161 ) );
    g_lut # ( 4 , 16'hdf00, 0'h0 ) C97 ( .I ({ \sumb<1> , \suma<1> , \sumb<0> , 
    \suma<0> }) , .O ( syn160 ) );

endmodule

module eACS_213_2 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
    , HD_inb , ae , clock , reset );

    output [3:0] acs_ppm_out ;
    output acs_Bx_out ;
    input [3:0] acs_ppm_ina ;
    input [1:0] HD_ina ;
    input [3:0] acs_ppm_inb ;
    input [1:0] HD_inb ;
    input ae ;
    input clock ;
    input reset ;
    
    wire \suma<3> ;
    wire \suma<2> ;
    wire \suma<1> ;
    wire \suma<0> ;
    wire \sumb<3> ;
    wire \sumb<2> ;
    wire \sumb<1> ;
    wire \sumb<0> ;
    wire \C5/N6 ;
    wire \C5/N12 ;
    wire \C5/N18 ;
    wire \C5/N24 ;
    wire \C6/N6 ;
    wire \C6/N12 ;
    wire \C6/N18 ;
    wire \C6/N24 ;
    wire syn260 ;
    wire cell15 ;
    wire \C18/C2 ;
    wire syn1114 ;
    wire syn221 ;
    wire cell4 ;
    wire \C4/C0/C2 ;
    wire syn1096 ;
    wire syn169 ;
    wire syn160 ;
    wire syn161 ;
    
    FDCE  \sumb_reg<0> ( .CE ( ae ) , .C ( clock ) , .D ( \C6/N6 ) , .CLR ( 
        reset ) , .Q ( \sumb<0> ) );
    FDCE  \sumb_reg<1> ( .CE ( ae ) , .C ( clock ) , .Q ( \sumb<1> ) , 
        .CLR ( reset ) , .D ( \C6/N12 ) );
    FDCE  \sumb_reg<2> ( .CE ( ae ) , .C ( clock ) , .Q ( \sumb<2> ) , 
        .CLR ( reset ) , .D ( \C6/N18 ) );
    FDCE  \sumb_reg<3> ( .C ( clock ) , .Q ( \sumb<3> ) , .CE ( ae ) , 
        .CLR ( reset ) , .D ( \C6/N24 ) );
    FDCE  \suma_reg<0> ( .CLR ( reset ) , .C ( clock ) , .D ( \C5/N6 ) 
        , .CE ( ae ) , .Q ( \suma<0> ) );
    FDCE  \suma_reg<1> ( .CE ( ae ) , .C ( clock ) , .D ( \C5/N12 ) , .CLR ( 
        reset ) , .Q ( \suma<1> ) );
    FDCE  \suma_reg<2> ( .CE ( ae ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \C5/N18 ) , .Q ( \suma<2> ) );
    FDCE  \suma_reg<3> ( .CE ( ae ) , .C ( clock ) , .Q ( \suma<3> ) , 
        .CLR ( reset ) , .D ( \C5/N24 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C74 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn260 }) , .O ( \C5/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C75 ( .I ({ acs_ppm_ina [2] , syn260 }) , 
    .O ( \C5/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C76 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( syn260 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C77 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( \C5/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C78 ( .I ({ acs_ppm_ina [0] , HD_ina [0] }) , 
    .O ( \C18/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C79 ( .I ({ acs_ppm_ina [0] , HD_ina [0] , 
    cell15 }) , .O ( \C5/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C80 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn1114 }) , .O ( cell15 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C81 ( .I ({ ae , acs_ppm_ina [0] , acs_ppm_ina [1] }) , 
    .O ( syn1114 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C82 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn221 }) , .O ( \C6/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C83 ( .I ({ acs_ppm_inb [2] , syn221 }) , 
    .O ( \C6/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C84 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( syn221 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C85 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( \C6/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C86 ( .I ({ acs_ppm_inb [0] , HD_inb [0] }) , 
    .O ( \C4/C0/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C87 ( .I ({ acs_ppm_inb [0] , HD_inb [0] , 
    cell4 }) , .O ( \C6/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C88 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn1096 }) , .O ( cell4 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C89 ( .I ({ ae , acs_ppm_inb [0] , acs_ppm_inb [1] }) , 
    .O ( syn1096 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C90 ( .I ({ \sumb<0> , \suma<0> , acs_Bx_out }) , 
    .O ( acs_ppm_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C91 ( .I ({ \sumb<1> , \suma<1> , acs_Bx_out }) , 
    .O ( acs_ppm_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C92 ( .I ({ \sumb<2> , \suma<2> , acs_Bx_out }) , 
    .O ( acs_ppm_out [2] ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C93 ( .I ({ \suma<3> , \sumb<3> , acs_Bx_out }) , 
    .O ( acs_ppm_out [3] ) );
    g_lut # ( 4 , 16'h80c8, 0'h0 ) C94 ( .I ({ \suma<3> , \sumb<3> , ae , 
    syn169 }) , .O ( acs_Bx_out ) );
    g_lut # ( 4 , 16'hef0e, 0'h0 ) C95 ( .I ({ \sumb<2> , \suma<2> , syn160 , 
    syn161 }) , .O ( syn169 ) );
    g_lut # ( 3 , 8'h0d, 0'h0 ) C96 ( .I ({ \suma<1> , \sumb<0> , \suma<0> }) , 
    .O ( syn161 ) );
    g_lut # ( 4 , 16'hdf00, 0'h0 ) C97 ( .I ({ \sumb<1> , \suma<1> , \sumb<0> , 
    \suma<0> }) , .O ( syn160 ) );

endmodule

module eACS_213_3 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
    , HD_inb , ae , clock , reset );

    output [3:0] acs_ppm_out ;
    output acs_Bx_out ;
    input [3:0] acs_ppm_ina ;
    input [1:0] HD_ina ;
    input [3:0] acs_ppm_inb ;
    input [1:0] HD_inb ;
    input ae ;
    input clock ;
    input reset ;
    
    wire \suma<3> ;
    wire \suma<2> ;
    wire \suma<1> ;
    wire \suma<0> ;
    wire \sumb<3> ;
    wire \sumb<2> ;
    wire \sumb<1> ;
    wire \sumb<0> ;
    wire \C5/N6 ;
    wire \C5/N12 ;
    wire \C5/N18 ;
    wire \C5/N24 ;
    wire \C6/N6 ;
    wire \C6/N12 ;
    wire \C6/N18 ;
    wire \C6/N24 ;
    wire syn260 ;
    wire cell15 ;
    wire \C18/C2 ;
    wire syn1114 ;
    wire syn221 ;
    wire cell4 ;
    wire \C4/C0/C2 ;
    wire syn1096 ;
    wire syn169 ;
    wire syn160 ;
    wire syn161 ;
    
    FDCE  \sumb_reg<0> ( .CE ( ae ) , .C ( clock ) , .Q ( \sumb<0> ) , 
        .CLR ( reset ) , .D ( \C6/N6 ) );
    FDCE  \sumb_reg<1> ( .CE ( ae ) , .CLR ( reset ) , .D ( \C6/N12 ) , 
        .C ( clock ) , .Q ( \sumb<1> ) );
    FDCE  \sumb_reg<2> ( .CE ( ae ) , .D ( \C6/N18 ) , .Q ( \sumb<2> ) 
        , .CLR ( reset ) , .C ( clock ) );
    FDCE  \sumb_reg<3> ( .CLR ( reset ) , .Q ( \sumb<3> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C6/N24 ) );
    FDCE  \suma_reg<0> ( .CLR ( reset ) , .D ( \C5/N6 ) , .Q ( \suma<0> ) 
        , .CE ( ae ) , .C ( clock ) );
    FDCE  \suma_reg<1> ( .CLR ( reset ) , .D ( \C5/N12 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \suma<1> ) );
    FDCE  \suma_reg<2> ( .CE ( ae ) , .Q ( \suma<2> ) , .CLR ( reset ) 
        , .C ( clock ) , .D ( \C5/N18 ) );
    FDCE  \suma_reg<3> ( .CLR ( reset ) , .Q ( \suma<3> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C5/N24 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C74 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn260 }) , .O ( \C5/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C75 ( .I ({ acs_ppm_ina [2] , syn260 }) , 
    .O ( \C5/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C76 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( syn260 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C77 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( \C5/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C78 ( .I ({ acs_ppm_ina [0] , HD_ina [0] }) , 
    .O ( \C18/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C79 ( .I ({ acs_ppm_ina [0] , HD_ina [0] , 
    cell15 }) , .O ( \C5/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C80 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn1114 }) , .O ( cell15 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C81 ( .I ({ ae , acs_ppm_ina [0] , acs_ppm_ina [1] }) , 
    .O ( syn1114 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C82 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn221 }) , .O ( \C6/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C83 ( .I ({ acs_ppm_inb [2] , syn221 }) , 
    .O ( \C6/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C84 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( syn221 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C85 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( \C6/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C86 ( .I ({ acs_ppm_inb [0] , HD_inb [0] }) , 
    .O ( \C4/C0/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C87 ( .I ({ acs_ppm_inb [0] , HD_inb [0] , 
    cell4 }) , .O ( \C6/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C88 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn1096 }) , .O ( cell4 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C89 ( .I ({ ae , acs_ppm_inb [0] , acs_ppm_inb [1] }) , 
    .O ( syn1096 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C90 ( .I ({ \sumb<0> , \suma<0> , acs_Bx_out }) , 
    .O ( acs_ppm_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C91 ( .I ({ \sumb<1> , \suma<1> , acs_Bx_out }) , 
    .O ( acs_ppm_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C92 ( .I ({ \sumb<2> , \suma<2> , acs_Bx_out }) , 
    .O ( acs_ppm_out [2] ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C93 ( .I ({ \suma<3> , \sumb<3> , acs_Bx_out }) , 
    .O ( acs_ppm_out [3] ) );
    g_lut # ( 4 , 16'h80c8, 0'h0 ) C94 ( .I ({ \suma<3> , \sumb<3> , ae , 
    syn169 }) , .O ( acs_Bx_out ) );
    g_lut # ( 4 , 16'hef0e, 0'h0 ) C95 ( .I ({ \sumb<2> , \suma<2> , syn160 , 
    syn161 }) , .O ( syn169 ) );
    g_lut # ( 3 , 8'h0d, 0'h0 ) C96 ( .I ({ \suma<1> , \sumb<0> , \suma<0> }) , 
    .O ( syn161 ) );
    g_lut # ( 4 , 16'hdf00, 0'h0 ) C97 ( .I ({ \sumb<1> , \suma<1> , \sumb<0> , 
    \suma<0> }) , .O ( syn160 ) );

endmodule

module eACS_213_4 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
    , HD_inb , ae , clock , reset );

    output [3:0] acs_ppm_out ;
    output acs_Bx_out ;
    input [3:0] acs_ppm_ina ;
    input [1:0] HD_ina ;
    input [3:0] acs_ppm_inb ;
    input [1:0] HD_inb ;
    input ae ;
    input clock ;
    input reset ;
    
    wire \suma<3> ;
    wire \suma<2> ;
    wire \suma<1> ;
    wire \suma<0> ;
    wire \sumb<3> ;
    wire \sumb<2> ;
    wire \sumb<1> ;
    wire \sumb<0> ;
    wire \C5/N6 ;
    wire \C5/N12 ;
    wire \C5/N18 ;
    wire \C5/N24 ;
    wire \C6/N6 ;
    wire \C6/N12 ;
    wire \C6/N18 ;
    wire \C6/N24 ;
    wire syn260 ;
    wire cell15 ;
    wire \C18/C2 ;
    wire syn1114 ;
    wire syn221 ;
    wire cell4 ;
    wire \C4/C0/C2 ;
    wire syn1096 ;
    wire syn169 ;
    wire syn160 ;
    wire syn161 ;
    
    FDCE  \sumb_reg<0> ( .CLR ( reset ) , .C ( clock ) , .D ( \C6/N6 ) 
        , .CE ( ae ) , .Q ( \sumb<0> ) );
    FDCE  \sumb_reg<1> ( .CLR ( reset ) , .D ( \C6/N12 ) , .Q ( \sumb<1> ) 
        , .CE ( ae ) , .C ( clock ) );
    FDCE  \sumb_reg<2> ( .CLR ( reset ) , .C ( clock ) , .CE ( ae ) , .D ( 
        \C6/N18 ) , .Q ( \sumb<2> ) );
    FDCE  \sumb_reg<3> ( .CE ( ae ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \C6/N24 ) , .Q ( \sumb<3> ) );
    FDCE  \suma_reg<0> ( .C ( clock ) , .D ( \C5/N6 ) , .CE ( ae ) , .CLR ( 
        reset ) , .Q ( \suma<0> ) );
    FDCE  \suma_reg<1> ( .CE ( ae ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \C5/N12 ) , .Q ( \suma<1> ) );
    FDCE  \suma_reg<2> ( .CE ( ae ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \C5/N18 ) , .Q ( \suma<2> ) );
    FDCE  \suma_reg<3> ( .CLR ( reset ) , .Q ( \suma<3> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C5/N24 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C74 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn260 }) , .O ( \C5/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C75 ( .I ({ acs_ppm_ina [2] , syn260 }) , 
    .O ( \C5/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C76 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( syn260 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C77 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( \C5/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C78 ( .I ({ acs_ppm_ina [0] , HD_ina [0] }) , 
    .O ( \C18/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C79 ( .I ({ acs_ppm_ina [0] , HD_ina [0] , 
    cell15 }) , .O ( \C5/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C80 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn1114 }) , .O ( cell15 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C81 ( .I ({ ae , acs_ppm_ina [0] , acs_ppm_ina [1] }) , 
    .O ( syn1114 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C82 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn221 }) , .O ( \C6/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C83 ( .I ({ acs_ppm_inb [2] , syn221 }) , 
    .O ( \C6/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C84 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( syn221 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C85 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( \C6/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C86 ( .I ({ acs_ppm_inb [0] , HD_inb [0] }) , 
    .O ( \C4/C0/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C87 ( .I ({ acs_ppm_inb [0] , HD_inb [0] , 
    cell4 }) , .O ( \C6/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C88 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn1096 }) , .O ( cell4 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C89 ( .I ({ ae , acs_ppm_inb [0] , acs_ppm_inb [1] }) , 
    .O ( syn1096 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C90 ( .I ({ \sumb<0> , \suma<0> , acs_Bx_out }) , 
    .O ( acs_ppm_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C91 ( .I ({ \sumb<1> , \suma<1> , acs_Bx_out }) , 
    .O ( acs_ppm_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C92 ( .I ({ \sumb<2> , \suma<2> , acs_Bx_out }) , 
    .O ( acs_ppm_out [2] ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C93 ( .I ({ \suma<3> , \sumb<3> , acs_Bx_out }) , 
    .O ( acs_ppm_out [3] ) );
    g_lut # ( 4 , 16'h80c8, 0'h0 ) C94 ( .I ({ \suma<3> , \sumb<3> , ae , 
    syn169 }) , .O ( acs_Bx_out ) );
    g_lut # ( 4 , 16'hef0e, 0'h0 ) C95 ( .I ({ \sumb<2> , \suma<2> , syn160 , 
    syn161 }) , .O ( syn169 ) );
    g_lut # ( 3 , 8'h0d, 0'h0 ) C96 ( .I ({ \suma<1> , \sumb<0> , \suma<0> }) , 
    .O ( syn161 ) );
    g_lut # ( 4 , 16'hdf00, 0'h0 ) C97 ( .I ({ \sumb<1> , \suma<1> , \sumb<0> , 
    \suma<0> }) , .O ( syn160 ) );

endmodule

module eACS_213_5 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
    , HD_inb , ae , clock , reset );

    output [3:0] acs_ppm_out ;
    output acs_Bx_out ;
    input [3:0] acs_ppm_ina ;
    input [1:0] HD_ina ;
    input [3:0] acs_ppm_inb ;
    input [1:0] HD_inb ;
    input ae ;
    input clock ;
    input reset ;
    
    wire \suma<3> ;
    wire \suma<2> ;
    wire \suma<1> ;
    wire \suma<0> ;
    wire \sumb<3> ;
    wire \sumb<2> ;
    wire \sumb<1> ;
    wire \sumb<0> ;
    wire \C5/N6 ;
    wire \C5/N12 ;
    wire \C5/N18 ;
    wire \C5/N24 ;
    wire \C6/N6 ;
    wire \C6/N12 ;
    wire \C6/N18 ;
    wire \C6/N24 ;
    wire syn260 ;
    wire cell15 ;
    wire \C18/C2 ;
    wire syn1114 ;
    wire syn221 ;
    wire cell4 ;
    wire \C4/C0/C2 ;
    wire syn1096 ;
    wire syn169 ;
    wire syn160 ;
    wire syn161 ;
    
    FDCE  \sumb_reg<0> ( .CLR ( reset ) , .C ( clock ) , .Q ( \sumb<0> ) 
        , .CE ( ae ) , .D ( \C6/N6 ) );
    FDCE  \sumb_reg<1> ( .CLR ( reset ) , .Q ( \sumb<1> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C6/N12 ) );
    FDCE  \sumb_reg<2> ( .CE ( ae ) , .C ( clock ) , .Q ( \sumb<2> ) , 
        .CLR ( reset ) , .D ( \C6/N18 ) );
    FDCE  \sumb_reg<3> ( .C ( clock ) , .D ( \C6/N24 ) , .CE ( ae ) , .CLR ( 
        reset ) , .Q ( \sumb<3> ) );
    FDCE  \suma_reg<0> ( .CE ( ae ) , .D ( \C5/N6 ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \suma<0> ) );
    FDCE  \suma_reg<1> ( .CE ( ae ) , .CLR ( reset ) , .D ( \C5/N12 ) , 
        .C ( clock ) , .Q ( \suma<1> ) );
    FDCE  \suma_reg<2> ( .CE ( ae ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \C5/N18 ) , .Q ( \suma<2> ) );
    FDCE  \suma_reg<3> ( .CE ( ae ) , .CLR ( reset ) , .C ( clock ) , .Q ( 
        \suma<3> ) , .D ( \C5/N24 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C74 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn260 }) , .O ( \C5/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C75 ( .I ({ acs_ppm_ina [2] , syn260 }) , 
    .O ( \C5/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C76 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( syn260 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C77 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( \C5/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C78 ( .I ({ acs_ppm_ina [0] , HD_ina [0] }) , 
    .O ( \C18/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C79 ( .I ({ acs_ppm_ina [0] , HD_ina [0] , 
    cell15 }) , .O ( \C5/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C80 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn1114 }) , .O ( cell15 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C81 ( .I ({ ae , acs_ppm_ina [0] , acs_ppm_ina [1] }) , 
    .O ( syn1114 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C82 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn221 }) , .O ( \C6/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C83 ( .I ({ acs_ppm_inb [2] , syn221 }) , 
    .O ( \C6/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C84 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( syn221 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C85 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( \C6/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C86 ( .I ({ acs_ppm_inb [0] , HD_inb [0] }) , 
    .O ( \C4/C0/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C87 ( .I ({ acs_ppm_inb [0] , HD_inb [0] , 
    cell4 }) , .O ( \C6/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C88 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn1096 }) , .O ( cell4 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C89 ( .I ({ ae , acs_ppm_inb [0] , acs_ppm_inb [1] }) , 
    .O ( syn1096 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C90 ( .I ({ \sumb<0> , \suma<0> , acs_Bx_out }) , 
    .O ( acs_ppm_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C91 ( .I ({ \sumb<1> , \suma<1> , acs_Bx_out }) , 
    .O ( acs_ppm_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C92 ( .I ({ \sumb<2> , \suma<2> , acs_Bx_out }) , 
    .O ( acs_ppm_out [2] ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C93 ( .I ({ \suma<3> , \sumb<3> , acs_Bx_out }) , 
    .O ( acs_ppm_out [3] ) );
    g_lut # ( 4 , 16'h80c8, 0'h0 ) C94 ( .I ({ \suma<3> , \sumb<3> , ae , 
    syn169 }) , .O ( acs_Bx_out ) );
    g_lut # ( 4 , 16'hef0e, 0'h0 ) C95 ( .I ({ \sumb<2> , \suma<2> , syn160 , 
    syn161 }) , .O ( syn169 ) );
    g_lut # ( 3 , 8'h0d, 0'h0 ) C96 ( .I ({ \suma<1> , \sumb<0> , \suma<0> }) , 
    .O ( syn161 ) );
    g_lut # ( 4 , 16'hdf00, 0'h0 ) C97 ( .I ({ \sumb<1> , \suma<1> , \sumb<0> , 
    \suma<0> }) , .O ( syn160 ) );

endmodule

module eACS_213_6 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
    , HD_inb , ae , clock , reset );

    output [3:0] acs_ppm_out ;
    output acs_Bx_out ;
    input [3:0] acs_ppm_ina ;
    input [1:0] HD_ina ;
    input [3:0] acs_ppm_inb ;
    input [1:0] HD_inb ;
    input ae ;
    input clock ;
    input reset ;
    
    wire \suma<3> ;
    wire \suma<2> ;
    wire \suma<1> ;
    wire \suma<0> ;
    wire \sumb<3> ;
    wire \sumb<2> ;
    wire \sumb<1> ;
    wire \sumb<0> ;
    wire \C5/N6 ;
    wire \C5/N12 ;
    wire \C5/N18 ;
    wire \C5/N24 ;
    wire \C6/N6 ;
    wire \C6/N12 ;
    wire \C6/N18 ;
    wire \C6/N24 ;
    wire syn260 ;
    wire cell15 ;
    wire \C18/C2 ;
    wire syn1114 ;
    wire syn221 ;
    wire cell4 ;
    wire \C4/C0/C2 ;
    wire syn1096 ;
    wire syn169 ;
    wire syn160 ;
    wire syn161 ;
    
    FDCE  \sumb_reg<0> ( .CLR ( reset ) , .Q ( \sumb<0> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C6/N6 ) );
    FDCE  \sumb_reg<1> ( .CE ( ae ) , .C ( clock ) , .D ( \C6/N12 ) , .Q ( 
        \sumb<1> ) , .CLR ( reset ) );
    FDCE  \sumb_reg<2> ( .CE ( ae ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \C6/N18 ) , .Q ( \sumb<2> ) );
    FDCE  \sumb_reg<3> ( .CE ( ae ) , .CLR ( reset ) , .D ( \C6/N24 ) , 
        .C ( clock ) , .Q ( \sumb<3> ) );
    FDCE  \suma_reg<0> ( .CE ( ae ) , .D ( \C5/N6 ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \suma<0> ) );
    FDCE  \suma_reg<1> ( .CLR ( reset ) , .C ( clock ) , .CE ( ae ) , .D ( 
        \C5/N12 ) , .Q ( \suma<1> ) );
    FDCE  \suma_reg<2> ( .CE ( ae ) , .D ( \C5/N18 ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \suma<2> ) );
    FDCE  \suma_reg<3> ( .CLR ( reset ) , .D ( \C5/N24 ) , .Q ( \suma<3> ) 
        , .CE ( ae ) , .C ( clock ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C74 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn260 }) , .O ( \C5/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C75 ( .I ({ acs_ppm_ina [2] , syn260 }) , 
    .O ( \C5/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C76 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( syn260 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C77 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C18/C2 }) , .O ( \C5/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C78 ( .I ({ acs_ppm_ina [0] , HD_ina [0] }) , 
    .O ( \C18/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C79 ( .I ({ acs_ppm_ina [0] , HD_ina [0] , 
    cell15 }) , .O ( \C5/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C80 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn1114 }) , .O ( cell15 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C81 ( .I ({ ae , acs_ppm_ina [0] , acs_ppm_ina [1] }) , 
    .O ( syn1114 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C82 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn221 }) , .O ( \C6/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C83 ( .I ({ acs_ppm_inb [2] , syn221 }) , 
    .O ( \C6/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C84 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( syn221 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C85 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C4/C0/C2 }) , .O ( \C6/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C86 ( .I ({ acs_ppm_inb [0] , HD_inb [0] }) , 
    .O ( \C4/C0/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C87 ( .I ({ acs_ppm_inb [0] , HD_inb [0] , 
    cell4 }) , .O ( \C6/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C88 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn1096 }) , .O ( cell4 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C89 ( .I ({ ae , acs_ppm_inb [0] , acs_ppm_inb [1] }) , 
    .O ( syn1096 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C90 ( .I ({ \sumb<0> , \suma<0> , acs_Bx_out }) , 
    .O ( acs_ppm_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C91 ( .I ({ \sumb<1> , \suma<1> , acs_Bx_out }) , 
    .O ( acs_ppm_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C92 ( .I ({ \sumb<2> , \suma<2> , acs_Bx_out }) , 
    .O ( acs_ppm_out [2] ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C93 ( .I ({ \suma<3> , \sumb<3> , acs_Bx_out }) , 
    .O ( acs_ppm_out [3] ) );
    g_lut # ( 4 , 16'h80c8, 0'h0 ) C94 ( .I ({ \suma<3> , \sumb<3> , ae , 
    syn169 }) , .O ( acs_Bx_out ) );
    g_lut # ( 4 , 16'hef0e, 0'h0 ) C95 ( .I ({ \sumb<2> , \suma<2> , syn160 , 
    syn161 }) , .O ( syn169 ) );
    g_lut # ( 3 , 8'h0d, 0'h0 ) C96 ( .I ({ \suma<1> , \sumb<0> , \suma<0> }) , 
    .O ( syn161 ) );
    g_lut # ( 4 , 16'hdf00, 0'h0 ) C97 ( .I ({ \sumb<1> , \suma<1> , \sumb<0> , 
    \suma<0> }) , .O ( syn160 ) );

endmodule

module eACS_213 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
    , HD_inb , ae , clock , reset );

    output [3:0] acs_ppm_out ;
    output acs_Bx_out ;
    input [3:0] acs_ppm_ina ;
    input [1:0] HD_ina ;
    input [3:0] acs_ppm_inb ;
    input [1:0] HD_inb ;
    input ae ;
    input clock ;
    input reset ;
    
    wire \suma<3> ;
    wire \suma<2> ;
    wire \suma<1> ;
    wire \suma<0> ;
    wire \sumb<3> ;
    wire \sumb<2> ;
    wire \sumb<1> ;
    wire \sumb<0> ;
    wire \C66/N6 ;
    wire \C66/N12 ;
    wire \C66/N18 ;
    wire \C66/N24 ;
    wire \C67/N6 ;
    wire \C67/N12 ;
    wire \C67/N18 ;
    wire \C67/N24 ;
    wire syn260 ;
    wire cell15 ;
    wire \C63/C0/C2 ;
    wire syn1114 ;
    wire syn221 ;
    wire cell4 ;
    wire \C65/C0/C2 ;
    wire syn1096 ;
    wire syn169 ;
    wire syn160 ;
    wire syn161 ;
    
    FDCE  \sumb_reg<0> ( .CE ( ae ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \C67/N6 ) , .Q ( \sumb<0> ) );
    FDCE  \sumb_reg<1> ( .D ( \C67/N12 ) , .CE ( ae ) , .CLR ( reset ) 
        , .C ( clock ) , .Q ( \sumb<1> ) );
    FDCE  \sumb_reg<2> ( .C ( clock ) , .CE ( ae ) , .CLR ( reset ) , .D ( 
        \C67/N18 ) , .Q ( \sumb<2> ) );
    FDCE  \sumb_reg<3> ( .CLR ( reset ) , .D ( \C67/N24 ) , .Q ( \sumb<3> ) 
        , .CE ( ae ) , .C ( clock ) );
    FDCE  \suma_reg<0> ( .CE ( ae ) , .CLR ( reset ) , .D ( \C66/N6 ) , 
        .C ( clock ) , .Q ( \suma<0> ) );
    FDCE  \suma_reg<1> ( .C ( clock ) , .Q ( \suma<1> ) , .CE ( ae ) , 
        .CLR ( reset ) , .D ( \C66/N12 ) );
    FDCE  \suma_reg<2> ( .CLR ( reset ) , .C ( clock ) , .Q ( \suma<2> ) 
        , .CE ( ae ) , .D ( \C66/N18 ) );
    FDCE  \suma_reg<3> ( .CE ( ae ) , .CLR ( reset ) , .D ( \C66/N24 ) 
        , .C ( clock ) , .Q ( \suma<3> ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C126 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn260 }) , .O ( \C66/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C127 ( .I ({ acs_ppm_ina [2] , syn260 }) , 
    .O ( \C66/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C128 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C63/C0/C2 }) , .O ( syn260 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C129 ( .I ({ acs_ppm_ina [1] , HD_ina [1] , 
    cell15 , \C63/C0/C2 }) , .O ( \C66/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C130 ( .I ({ acs_ppm_ina [0] , HD_ina [0] }) , 
    .O ( \C63/C0/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C131 ( .I ({ acs_ppm_ina [0] , HD_ina [0] , 
    cell15 }) , .O ( \C66/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C132 ( .I ({ acs_ppm_ina [3] , acs_ppm_ina [2] , 
    syn1114 }) , .O ( cell15 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C133 ( .I ({ ae , acs_ppm_ina [0] , acs_ppm_ina [1] }) , 
    .O ( syn1114 ) );
    g_lut # ( 3 , 8'h78, 0'h0 ) C134 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn221 }) , .O ( \C67/N24 ) );
    g_lut # ( 2 , 4'h6, 0'h0 ) C135 ( .I ({ acs_ppm_inb [2] , syn221 }) , 
    .O ( \C67/N18 ) );
    g_lut # ( 4 , 16'hc880, 0'h0 ) C136 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C65/C0/C2 }) , .O ( syn221 ) );
    g_lut # ( 4 , 16'hb75a, 0'h0 ) C137 ( .I ({ acs_ppm_inb [1] , HD_inb [1] , 
    cell4 , \C65/C0/C2 }) , .O ( \C67/N12 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C138 ( .I ({ acs_ppm_inb [0] , HD_inb [0] }) , 
    .O ( \C65/C0/C2 ) );
    g_lut # ( 3 , 8'h7c, 0'h0 ) C139 ( .I ({ acs_ppm_inb [0] , HD_inb [0] , 
    cell4 }) , .O ( \C67/N6 ) );
    g_lut # ( 3 , 8'hbf, 0'h0 ) C140 ( .I ({ acs_ppm_inb [3] , acs_ppm_inb [2] , 
    syn1096 }) , .O ( cell4 ) );
    g_lut # ( 3 , 8'h7f, 0'h0 ) C141 ( .I ({ ae , acs_ppm_inb [0] , acs_ppm_inb [1] }) , 
    .O ( syn1096 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C142 ( .I ({ \sumb<0> , \suma<0> , acs_Bx_out }) , 
    .O ( acs_ppm_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C143 ( .I ({ \sumb<1> , \suma<1> , acs_Bx_out }) , 
    .O ( acs_ppm_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C144 ( .I ({ \sumb<2> , \suma<2> , acs_Bx_out }) , 
    .O ( acs_ppm_out [2] ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C145 ( .I ({ \suma<3> , \sumb<3> , acs_Bx_out }) , 
    .O ( acs_ppm_out [3] ) );
    g_lut # ( 4 , 16'h80c8, 0'h0 ) C146 ( .I ({ \suma<3> , \sumb<3> , ae , 
    syn169 }) , .O ( acs_Bx_out ) );
    g_lut # ( 4 , 16'hef0e, 0'h0 ) C147 ( .I ({ \sumb<2> , \suma<2> , syn160 , 
    syn161 }) , .O ( syn169 ) );
    g_lut # ( 3 , 8'h0d, 0'h0 ) C148 ( .I ({ \suma<1> , \sumb<0> , \suma<0> }) , 
    .O ( syn161 ) );
    g_lut # ( 4 , 16'hdf00, 0'h0 ) C149 ( .I ({ \sumb<1> , \suma<1> , \sumb<0> , 
    \suma<0> }) , .O ( syn160 ) );

endmodule

module eACSU_213 ( acs0_ppm_out , acs1_ppm_out , acs2_ppm_out , acs3_ppm_out 
    , acs4_ppm_out , acs5_ppm_out , acs6_ppm_out , acs7_ppm_out , acs0_Bx_out 
    , acs1_Bx_out , acs2_Bx_out , acs3_Bx_out , acs4_Bx_out , acs5_Bx_out 
    , acs6_Bx_out , acs7_Bx_out , acs0_ppm_ina , acs0_ppm_inb , HD0_ina 
    , HD0_inb , acs1_ppm_ina , acs1_ppm_inb , HD1_ina , HD1_inb , acs2_ppm_ina 
    , acs2_ppm_inb , HD2_ina , HD2_inb , acs3_ppm_ina , acs3_ppm_inb , 
    HD3_ina , HD3_inb , acs4_ppm_ina , acs4_ppm_inb , HD4_ina , HD4_inb 
    , acs5_ppm_ina , acs5_ppm_inb , HD5_ina , HD5_inb , acs6_ppm_ina , 
    acs6_ppm_inb , HD6_ina , HD6_inb , acs7_ppm_ina , acs7_ppm_inb , HD7_ina 
    , HD7_inb , ae , clock , reset );

    output [3:0] acs0_ppm_out ;
    output [3:0] acs1_ppm_out ;
    output [3:0] acs2_ppm_out ;
    output [3:0] acs3_ppm_out ;
    output [3:0] acs4_ppm_out ;
    output [3:0] acs5_ppm_out ;
    output [3:0] acs6_ppm_out ;
    output [3:0] acs7_ppm_out ;
    output acs0_Bx_out ;
    output acs1_Bx_out ;
    output acs2_Bx_out ;
    output acs3_Bx_out ;
    output acs4_Bx_out ;
    output acs5_Bx_out ;
    output acs6_Bx_out ;
    output acs7_Bx_out ;
    input [3:0] acs0_ppm_ina ;
    input [3:0] acs0_ppm_inb ;
    input [1:0] HD0_ina ;
    input [1:0] HD0_inb ;
    input [3:0] acs1_ppm_ina ;
    input [3:0] acs1_ppm_inb ;
    input [1:0] HD1_ina ;
    input [1:0] HD1_inb ;
    input [3:0] acs2_ppm_ina ;
    input [3:0] acs2_ppm_inb ;
    input [1:0] HD2_ina ;
    input [1:0] HD2_inb ;
    input [3:0] acs3_ppm_ina ;
    input [3:0] acs3_ppm_inb ;
    input [1:0] HD3_ina ;
    input [1:0] HD3_inb ;
    input [3:0] acs4_ppm_ina ;
    input [3:0] acs4_ppm_inb ;
    input [1:0] HD4_ina ;
    input [1:0] HD4_inb ;
    input [3:0] acs5_ppm_ina ;
    input [3:0] acs5_ppm_inb ;
    input [1:0] HD5_ina ;
    input [1:0] HD5_inb ;
    input [3:0] acs6_ppm_ina ;
    input [3:0] acs6_ppm_inb ;
    input [1:0] HD6_ina ;
    input [1:0] HD6_inb ;
    input [3:0] acs7_ppm_ina ;
    input [3:0] acs7_ppm_inb ;
    input [1:0] HD7_ina ;
    input [1:0] HD7_inb ;
    input ae ;
    input clock ;
    input reset ;
    
    eACS_213_0  ACS0 ( .ae ( ae ) , .acs_ppm_inb ({ acs0_ppm_inb [3] , 
        acs0_ppm_inb [2] , acs0_ppm_inb [1] , acs0_ppm_inb [0] }) , .reset ( 
        reset ) , .clock ( clock ) , .acs_ppm_ina ({ acs0_ppm_ina [3] , 
        acs0_ppm_ina [2] , acs0_ppm_ina [1] , acs0_ppm_ina [0] }) , .acs_Bx_out ( 
        acs0_Bx_out ) , .HD_ina ({ HD0_ina [1] , HD0_ina [0] }) , .acs_ppm_out ({ 
        acs0_ppm_out [3] , acs0_ppm_out [2] , acs0_ppm_out [1] , acs0_ppm_out [0] 
        }) , .HD_inb ({ HD0_inb [1] , HD0_inb [0] }) );
    eACS_213_1  ACS1 ( .acs_ppm_out ({ acs1_ppm_out [3] , acs1_ppm_out [2] 
        , acs1_ppm_out [1] , acs1_ppm_out [0] }) , .acs_ppm_ina ({ acs1_ppm_ina [3] 
        , acs1_ppm_ina [2] , acs1_ppm_ina [1] , acs1_ppm_ina [0] }) , .acs_ppm_inb ({ 
        acs1_ppm_inb [3] , acs1_ppm_inb [2] , acs1_ppm_inb [1] , acs1_ppm_inb [0] 
        }) , .HD_inb ({ HD1_inb [1] , HD1_inb [0] }) , .HD_ina ({ HD1_ina [1] 
        , HD1_ina [0] }) , .reset ( reset ) , .clock ( clock ) , .ae ( 
        ae ) , .acs_Bx_out ( acs1_Bx_out ) );
    eACS_213_2  ACS6 ( .acs_ppm_ina ({ acs6_ppm_ina [3] , acs6_ppm_ina [2] 
        , acs6_ppm_ina [1] , acs6_ppm_ina [0] }) , .acs_ppm_inb ({ acs6_ppm_inb [3] 
        , acs6_ppm_inb [2] , acs6_ppm_inb [1] , acs6_ppm_inb [0] }) , .clock ( 
        clock ) , .ae ( ae ) , .acs_ppm_out ({ acs6_ppm_out [3] , acs6_ppm_out [2] 
        , acs6_ppm_out [1] , acs6_ppm_out [0] }) , .HD_inb ({ HD6_inb [1] 
        , HD6_inb [0] }) , .acs_Bx_out ( acs6_Bx_out ) , .HD_ina ({ HD6_ina [1] 
        , HD6_ina [0] }) , .reset ( reset ) );
    eACS_213_3  ACS2 ( .acs_ppm_out ({ acs2_ppm_out [3] , acs2_ppm_out [2] 
        , acs2_ppm_out [1] , acs2_ppm_out [0] }) , .clock ( clock ) , .acs_ppm_ina ({ 
        acs2_ppm_ina [3] , acs2_ppm_ina [2] , acs2_ppm_ina [1] , acs2_ppm_ina [0] 
        }) , .HD_ina ({ HD2_ina [1] , HD2_ina [0] }) , .acs_Bx_out ( acs2_Bx_out 
        ) , .reset ( reset ) , .ae ( ae ) , .HD_inb ({ HD2_inb [1] , HD2_inb [0] 
        }) , .acs_ppm_inb ({ acs2_ppm_inb [3] , acs2_ppm_inb [2] , acs2_ppm_inb [1] 
        , acs2_ppm_inb [0] }) );
    eACS_213_4  ACS5 ( .acs_ppm_ina ({ acs5_ppm_ina [3] , acs5_ppm_ina [2] 
        , acs5_ppm_ina [1] , acs5_ppm_ina [0] }) , .acs_ppm_out ({ acs5_ppm_out [3] 
        , acs5_ppm_out [2] , acs5_ppm_out [1] , acs5_ppm_out [0] }) , .HD_inb ({ 
        HD5_inb [1] , HD5_inb [0] }) , .clock ( clock ) , .acs_ppm_inb ({ 
        acs5_ppm_inb [3] , acs5_ppm_inb [2] , acs5_ppm_inb [1] , acs5_ppm_inb [0] 
        }) , .HD_ina ({ HD5_ina [1] , HD5_ina [0] }) , .acs_Bx_out ( acs5_Bx_out 
        ) , .reset ( reset ) , .ae ( ae ) );
    eACS_213_5  ACS7 ( .acs_ppm_out ({ acs7_ppm_out [3] , acs7_ppm_out [2] 
        , acs7_ppm_out [1] , acs7_ppm_out [0] }) , .HD_inb ({ HD7_inb [1] 
        , HD7_inb [0] }) , .clock ( clock ) , .reset ( reset ) , .acs_ppm_ina ({ 
        acs7_ppm_ina [3] , acs7_ppm_ina [2] , acs7_ppm_ina [1] , acs7_ppm_ina [0] 
        }) , .HD_ina ({ HD7_ina [1] , HD7_ina [0] }) , .acs_ppm_inb ({ 
        acs7_ppm_inb [3] , acs7_ppm_inb [2] , acs7_ppm_inb [1] , acs7_ppm_inb [0] 
        }) , .ae ( ae ) , .acs_Bx_out ( acs7_Bx_out ) );
    eACS_213_6  ACS3 ( .clock ( clock ) , .acs_Bx_out ( acs3_Bx_out ) , 
        .acs_ppm_ina ({ acs3_ppm_ina [3] , acs3_ppm_ina [2] , acs3_ppm_ina [1] 
        , acs3_ppm_ina [0] }) , .HD_inb ({ HD3_inb [1] , HD3_inb [0] }) 
        , .acs_ppm_out ({ acs3_ppm_out [3] , acs3_ppm_out [2] , acs3_ppm_out [1] 
        , acs3_ppm_out [0] }) , .HD_ina ({ HD3_ina [1] , HD3_ina [0] }) 
        , .acs_ppm_inb ({ acs3_ppm_inb [3] , acs3_ppm_inb [2] , acs3_ppm_inb [1] 
        , acs3_ppm_inb [0] }) , .reset ( reset ) , .ae ( ae ) );
    eACS_213  ACS4 ( .HD_ina ({ HD4_ina [1] , HD4_ina [0] }) , .acs_Bx_out ( 
        acs4_Bx_out ) , .acs_ppm_out ({ acs4_ppm_out [3] , acs4_ppm_out [2] 
        , acs4_ppm_out [1] , acs4_ppm_out [0] }) , .clock ( clock ) , .ae ( 
        ae ) , .acs_ppm_ina ({ acs4_ppm_ina [3] , acs4_ppm_ina [2] , acs4_ppm_ina [1] 
        , acs4_ppm_ina [0] }) , .reset ( reset ) , .acs_ppm_inb ({ acs4_ppm_inb [3] 
        , acs4_ppm_inb [2] , acs4_ppm_inb [1] , acs4_ppm_inb [0] }) , .HD_inb ({ 
        HD4_inb [1] , HD4_inb [0] }) );

endmodule

module eTBDECISION_213 ( best_state , in0 , in1 , in2 , in3 , in4 , in5 
    , in6 , in7 );

    output [2:0] best_state ;
    input [3:0] in0 ;
    input [3:0] in1 ;
    input [3:0] in2 ;
    input [3:0] in3 ;
    input [3:0] in4 ;
    input [3:0] in5 ;
    input [3:0] in6 ;
    input [3:0] in7 ;
    
    wire syn7625 ;
    wire syn7626 ;
    wire syn7713 ;
    wire syn7714 ;
    wire \S_34/cell0 ;
    wire \S_48/cell0 ;
    wire syn434 ;
    wire syn2994 ;
    wire syn7693 ;
    wire syn7694 ;
    wire syn5340 ;
    wire syn5342 ;
    wire syn4128 ;
    wire syn5326 ;
    wire syn7632 ;
    wire syn7633 ;
    wire syn7711 ;
    wire syn7685 ;
    wire syn7687 ;
    wire syn7671 ;
    wire syn7672 ;
    wire syn739 ;
    wire syn4133 ;
    wire syn6320 ;
    wire syn6373 ;
    wire syn6463 ;
    wire syn7709 ;
    wire syn4126 ;
    wire syn5335 ;
    wire syn7348 ;
    wire syn4130 ;
    wire syn5339 ;
    wire syn1631 ;
    wire syn3970 ;
    wire syn6473 ;
    wire syn7702 ;
    wire syn551 ;
    wire syn3972 ;
    wire syn413 ;
    wire syn552 ;
    wire syn410 ;
    wire syn428 ;
    wire syn6312 ;
    wire syn6315 ;
    wire syn362 ;
    wire syn408 ;
    wire syn563 ;
    wire syn594 ;
    wire syn3904 ;
    wire syn6331 ;
    wire syn6343 ;
    wire syn6282 ;
    wire syn6294 ;
    wire syn6392 ;
    wire syn407 ;
    wire syn543 ;
    wire syn404 ;
    wire syn503 ;
    wire syn506 ;
    wire syn771 ;
    wire syn3903 ;
    wire syn509 ;
    wire syn3900 ;
    wire syn510 ;
    wire syn511 ;
    wire syn455 ;
    wire syn6351 ;
    wire syn521 ;
    wire syn2480 ;
    wire syn462 ;
    wire syn774 ;
    wire syn507 ;
    wire syn4626 ;
    wire syn504 ;
    wire syn505 ;
    wire syn476 ;
    wire syn501 ;
    wire syn448 ;
    wire syn5398 ;
    wire syn422 ;
    wire syn5397 ;
    wire syn416 ;
    wire syn759 ;
    wire syn355 ;
    wire syn376 ;
    wire syn1626 ;
    wire syn402 ;
    wire syn348 ;
    
    g_lut # ( 4 , 16'heee0, 0'h0 ) C124 ( .I ({ syn7625 , syn7626 , syn7713 , 
    syn7714 }) , .O ( best_state [0] ) );
    g_lut # ( 4 , 16'ha200, 0'h0 ) C125 ( .I ({ \S_34/cell0 , \S_48/cell0 , 
    syn434 , syn2994 }) , .O ( syn7714 ) );
    g_lut # ( 2 , 4'he, 0'h0 ) C126 ( .I ({ syn7693 , syn7694 }) , .O ( 
    \S_48/cell0 ) );
    g_lut # ( 4 , 16'hedb7, 0'h0 ) C127 ( .I ({ in6 [1] , in6 [0] , syn5340 , 
    syn5342 }) , .O ( syn7694 ) );
    g_lut # ( 4 , 16'hb3a0, 0'h0 ) C128 ( .I ({ in6 [3] , in6 [2] , syn4128 , 
    syn5326 }) , .O ( syn7693 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C129 ( .I ({ syn2994 , syn7632 , syn7633 , 
    syn7711 }) , .O ( syn7713 ) );
    g_lut # ( 4 , 16'ha888, 0'h0 ) C130 ( .I ({ \S_34/cell0 , syn434 , 
    syn7685 , syn7687 }) , .O ( best_state [1] ) );
    g_lut # ( 2 , 4'he, 0'h0 ) C131 ( .I ({ syn7671 , syn7672 }) , .O ( 
    \S_34/cell0 ) );
    g_lut # ( 4 , 16'hedb7, 0'h0 ) C132 ( .I ({ in4 [1] , in4 [0] , syn5340 , 
    syn5342 }) , .O ( syn7672 ) );
    g_lut # ( 4 , 16'hb3ec, 0'h0 ) C133 ( .I ({ in4 [3] , in4 [2] , syn4128 , 
    syn5326 }) , .O ( syn7671 ) );
    g_lut # ( 2 , 4'h2, 0'h0 ) C134 ( .I ({ syn7685 , syn7687 }) , .O ( 
    best_state [2] ) );
    g_lut # ( 4 , 16'h7770, 0'h0 ) C135 ( .I ({ syn7625 , syn7626 , syn7632 , 
    syn7633 }) , .O ( syn7687 ) );
    g_lut # ( 4 , 16'h1248, 0'h0 ) C136 ( .I ({ in1 [1] , in1 [0] , syn5340 , 
    syn5342 }) , .O ( syn7633 ) );
    g_lut # ( 4 , 16'h4c5f, 0'h0 ) C137 ( .I ({ in1 [3] , in1 [2] , syn4128 , 
    syn5326 }) , .O ( syn7632 ) );
    g_lut # ( 4 , 16'hebd7, 0'h0 ) C138 ( .I ({ in0 [0] , in0 [1] , syn5340 , 
    syn5342 }) , .O ( syn7626 ) );
    g_lut # ( 4 , 16'hb3a0, 0'h0 ) C139 ( .I ({ in0 [3] , in0 [2] , syn4128 , 
    syn5326 }) , .O ( syn7625 ) );
    g_lut # ( 4 , 16'h8ace, 0'h0 ) C140 ( .I ({ syn739 , syn4133 , syn6320 , 
    syn6373 }) , .O ( syn5326 ) );
    g_lut # ( 2 , 4'hb, 0'h0 ) C141 ( .I ({ syn2994 , syn7711 }) , .O ( 
    syn7685 ) );
    g_lut # ( 4 , 16'h0880, 0'h0 ) C142 ( .I ({ in3 [0] , syn5342 , syn6463 , 
    syn7709 }) , .O ( syn7711 ) );
    g_lut # ( 4 , 16'h2aaa, 0'h0 ) C143 ( .I ({ in3 [2] , syn4126 , syn5335 , 
    syn7348 }) , .O ( syn7709 ) );
    g_lut # ( 2 , 4'hb, 0'h0 ) C144 ( .I ({ in3 [3] , syn4128 }) , .O ( 
    syn7348 ) );
    g_lut # ( 3 , 8'hef, 0'h0 ) C145 ( .I ({ in3 [1] , syn4130 , syn5339 }) , 
    .O ( syn6463 ) );
    g_lut # ( 3 , 8'hc4, 0'h0 ) C146 ( .I ({ syn739 , syn1631 , syn4133 }) , 
    .O ( syn5339 ) );
    g_lut # ( 3 , 8'h02, 0'h0 ) C147 ( .I ({ syn739 , syn3970 , syn4133 }) , 
    .O ( syn4130 ) );
    g_lut # ( 4 , 16'hefee, 0'h0 ) C148 ( .I ({ in2 [3] , syn4128 , syn6473 , 
    syn7702 }) , .O ( syn2994 ) );
    g_lut # ( 4 , 16'hedb7, 0'h0 ) C149 ( .I ({ in2 [1] , in2 [0] , syn5340 , 
    syn5342 }) , .O ( syn7702 ) );
    g_lut # ( 4 , 16'hfd08, 0'h0 ) C150 ( .I ({ syn551 , syn739 , syn3972 , 
    syn4133 }) , .O ( syn5342 ) );
    g_lut # ( 3 , 8'ha8, 0'h0 ) C151 ( .I ({ syn413 , syn434 , syn552 }) , 
    .O ( syn3972 ) );
    g_lut # ( 4 , 16'hff17, 0'h0 ) C152 ( .I ({ syn410 , syn428 , syn6312 , 
    syn6315 }) , .O ( syn552 ) );
    g_lut # ( 3 , 8'h8a, 0'h0 ) C153 ( .I ({ in6 [0] , syn362 , syn408 }) , 
    .O ( syn410 ) );
    g_lut # ( 4 , 16'h0f8d, 0'h0 ) C154 ( .I ({ syn739 , syn1631 , syn3970 , 
    syn4133 }) , .O ( syn5340 ) );
    g_lut # ( 3 , 8'h80, 0'h0 ) C155 ( .I ({ in2 [2] , syn4126 , syn5335 }) , 
    .O ( syn6473 ) );
    g_lut # ( 3 , 8'hae, 0'h0 ) C156 ( .I ({ syn739 , syn4133 , syn6373 }) , 
    .O ( syn5335 ) );
    g_lut # ( 2 , 4'hb, 0'h0 ) C157 ( .I ({ syn4133 , syn6320 }) , .O ( 
    syn4126 ) );
    g_lut # ( 4 , 16'hfdf4, 0'h0 ) C158 ( .I ({ syn563 , syn594 , syn6320 , 
    syn6373 }) , .O ( syn4133 ) );
    g_lut # ( 3 , 8'hc5, 0'h0 ) C159 ( .I ({ syn3904 , syn6331 , syn6343 }) , 
    .O ( syn6373 ) );
    g_lut # ( 3 , 8'hac, 0'h0 ) C160 ( .I ({ syn434 , syn6282 , syn6294 }) , 
    .O ( syn6320 ) );
    g_lut # ( 3 , 8'h51, 0'h0 ) C161 ( .I ({ syn6312 , syn6315 , syn6392 }) , 
    .O ( syn594 ) );
    g_lut # ( 3 , 8'h8e, 0'h0 ) C162 ( .I ({ syn551 , syn1631 , syn3970 }) , 
    .O ( syn563 ) );
    g_lut # ( 3 , 8'ha8, 0'h0 ) C163 ( .I ({ syn407 , syn434 , syn543 }) , 
    .O ( syn3970 ) );
    g_lut # ( 4 , 16'hff17, 0'h0 ) C164 ( .I ({ syn404 , syn428 , syn6312 , 
    syn6315 }) , .O ( syn543 ) );
    g_lut # ( 4 , 16'h1f0e, 0'h0 ) C165 ( .I ({ syn503 , syn506 , syn771 , 
    syn3903 }) , .O ( syn1631 ) );
    g_lut # ( 3 , 8'hc4, 0'h0 ) C166 ( .I ({ syn509 , syn3900 , syn3904 }) , 
    .O ( syn551 ) );
    g_lut # ( 4 , 16'hfeee, 0'h0 ) C167 ( .I ({ syn510 , syn511 , syn771 , 
    syn3903 }) , .O ( syn3900 ) );
    g_lut # ( 4 , 16'hbf3b, 0'h0 ) C168 ( .I ({ in2 [3] , in3 [3] , in2 [0] , 
    syn455 }) , .O ( syn511 ) );
    g_lut # ( 4 , 16'h73f7, 0'h0 ) C169 ( .I ({ in2 [3] , in3 [3] , in3 [0] , 
    syn455 }) , .O ( syn510 ) );
    g_lut # ( 4 , 16'h030a, 0'h0 ) C170 ( .I ({ syn434 , syn739 , syn6312 , 
    syn6315 }) , .O ( syn4128 ) );
    g_lut # ( 4 , 16'h0a88, 0'h0 ) C171 ( .I ({ syn434 , syn6312 , syn6315 , 
    syn6392 }) , .O ( syn739 ) );
    g_lut # ( 4 , 16'habbb, 0'h0 ) C172 ( .I ({ in2 [3] , in3 [3] , syn3904 , 
    syn6351 }) , .O ( syn6392 ) );
    g_lut # ( 2 , 4'he, 0'h0 ) C173 ( .I ({ syn771 , syn3903 }) , .O ( 
    syn3904 ) );
    g_lut # ( 4 , 16'he080, 0'h0 ) C174 ( .I ({ syn521 , syn2480 , syn6331 , 
    syn6343 }) , .O ( syn3903 ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C175 ( .I ({ in3 [2] , in2 [2] , syn462 }) , 
    .O ( syn6343 ) );
    g_lut # ( 3 , 8'h1b, 0'h0 ) C176 ( .I ({ in1 [2] , in0 [2] , syn774 }) , 
    .O ( syn6331 ) );
    g_lut # ( 4 , 16'hfbea, 0'h0 ) C177 ( .I ({ in2 [3] , in3 [3] , syn462 , 
    syn6351 }) , .O ( syn2480 ) );
    g_lut # ( 3 , 8'he8, 0'h0 ) C178 ( .I ({ syn503 , syn506 , syn509 }) , 
    .O ( syn521 ) );
    g_lut # ( 3 , 8'h8c, 0'h0 ) C179 ( .I ({ in0 [0] , syn507 , syn774 }) , 
    .O ( syn509 ) );
    g_lut # ( 3 , 8'h8e, 0'h0 ) C180 ( .I ({ in1 [3] , in0 [3] , syn4626 }) , 
    .O ( syn774 ) );
    g_lut # ( 4 , 16'h7f37, 0'h0 ) C181 ( .I ({ in1 [3] , in0 [3] , in1 [0] , 
    syn4626 }) , .O ( syn507 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C182 ( .I ({ syn504 , syn505 }) , .O ( syn506 ) 
    );
    g_lut # ( 4 , 16'hb3fb, 0'h0 ) C183 ( .I ({ in1 [3] , in0 [3] , in0 [1] , 
    syn4626 }) , .O ( syn505 ) );
    g_lut # ( 4 , 16'h7f37, 0'h0 ) C184 ( .I ({ in1 [3] , in0 [3] , in1 [1] , 
    syn4626 }) , .O ( syn504 ) );
    g_lut # ( 3 , 8'h8e, 0'h0 ) C185 ( .I ({ in1 [2] , in0 [2] , syn476 }) , 
    .O ( syn4626 ) );
    g_lut # ( 3 , 8'h4d, 0'h0 ) C186 ( .I ({ in1 [1] , in0 [1] , in1 [0] }) , 
    .O ( syn476 ) );
    g_lut # ( 3 , 8'hba, 0'h0 ) C187 ( .I ({ in2 [1] , syn462 , syn501 }) , 
    .O ( syn503 ) );
    g_lut # ( 4 , 16'h8c08, 0'h0 ) C188 ( .I ({ in2 [3] , in3 [3] , in3 [1] , 
    syn455 }) , .O ( syn501 ) );
    g_lut # ( 4 , 16'ha280, 0'h0 ) C189 ( .I ({ in2 [3] , in3 [3] , syn462 , 
    syn6351 }) , .O ( syn771 ) );
    g_lut # ( 2 , 4'h7, 0'h0 ) C190 ( .I ({ in1 [3] , in0 [3] }) , .O ( 
    syn6351 ) );
    g_lut # ( 3 , 8'hb2, 0'h0 ) C191 ( .I ({ in2 [3] , in3 [3] , syn455 }) , 
    .O ( syn462 ) );
    g_lut # ( 3 , 8'h8e, 0'h0 ) C192 ( .I ({ in3 [2] , in2 [2] , syn448 }) , 
    .O ( syn455 ) );
    g_lut # ( 3 , 8'h8e, 0'h0 ) C193 ( .I ({ in3 [1] , in2 [1] , in2 [0] }) , 
    .O ( syn448 ) );
    g_lut # ( 3 , 8'he8, 0'h0 ) C194 ( .I ({ syn428 , syn6312 , syn6315 }) , 
    .O ( syn434 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C195 ( .I ({ in4 [3] , in5 [3] , syn5398 }) , 
    .O ( syn6315 ) );
    g_lut # ( 2 , 4'h7, 0'h0 ) C196 ( .I ({ in6 [3] , in7 [3] }) , .O ( 
    syn6312 ) );
    g_lut # ( 3 , 8'hb2, 0'h0 ) C197 ( .I ({ syn422 , syn6282 , syn6294 }) , 
    .O ( syn428 ) );
    g_lut # ( 3 , 8'h1b, 0'h0 ) C198 ( .I ({ in7 [2] , in6 [2] , syn362 }) , 
    .O ( syn6294 ) );
    g_lut # ( 3 , 8'h1b, 0'h0 ) C199 ( .I ({ in5 [2] , in4 [2] , syn5398 }) , 
    .O ( syn6282 ) );
    g_lut # ( 3 , 8'ha2, 0'h0 ) C200 ( .I ({ in4 [3] , in5 [3] , syn5397 }) , 
    .O ( syn5398 ) );
    g_lut # ( 3 , 8'hb2, 0'h0 ) C201 ( .I ({ syn404 , syn407 , syn416 }) , 
    .O ( syn422 ) );
    g_lut # ( 4 , 16'h4044, 0'h0 ) C202 ( .I ({ in6 [0] , syn362 , syn408 , 
    syn413 }) , .O ( syn416 ) );
    g_lut # ( 4 , 16'h0d2f, 0'h0 ) C203 ( .I ({ in5 [0] , in4 [0] , syn759 , 
    syn5397 }) , .O ( syn413 ) );
    g_lut # ( 4 , 16'h73f7, 0'h0 ) C204 ( .I ({ in6 [3] , in7 [3] , in7 [0] , 
    syn355 }) , .O ( syn408 ) );
    g_lut # ( 4 , 16'h0d2f, 0'h0 ) C205 ( .I ({ in5 [1] , in4 [1] , syn759 , 
    syn5397 }) , .O ( syn407 ) );
    g_lut # ( 4 , 16'heafe, 0'h0 ) C206 ( .I ({ in5 [2] , in4 [2] , syn376 , 
    syn1626 }) , .O ( syn5397 ) );
    g_lut # ( 2 , 4'h4, 0'h0 ) C207 ( .I ({ in4 [3] , in5 [3] }) , .O ( 
    syn1626 ) );
    g_lut # ( 3 , 8'h8e, 0'h0 ) C208 ( .I ({ in5 [1] , in4 [1] , in4 [0] }) , 
    .O ( syn376 ) );
    g_lut # ( 2 , 4'h2, 0'h0 ) C209 ( .I ({ in4 [3] , in5 [3] }) , .O ( 
    syn759 ) );
    g_lut # ( 3 , 8'h8a, 0'h0 ) C210 ( .I ({ in6 [1] , syn362 , syn402 }) , 
    .O ( syn404 ) );
    g_lut # ( 4 , 16'h73f7, 0'h0 ) C211 ( .I ({ in6 [3] , in7 [3] , in7 [1] , 
    syn355 }) , .O ( syn402 ) );
    g_lut # ( 3 , 8'hb2, 0'h0 ) C212 ( .I ({ in6 [3] , in7 [3] , syn355 }) , 
    .O ( syn362 ) );
    g_lut # ( 3 , 8'h8e, 0'h0 ) C213 ( .I ({ in7 [2] , in6 [2] , syn348 }) , 
    .O ( syn355 ) );
    g_lut # ( 3 , 8'h8e, 0'h0 ) C214 ( .I ({ in7 [1] , in6 [1] , in6 [0] }) , 
    .O ( syn348 ) );

endmodule

module FDC ( Q , D , C , CLR );

    output Q ;
    input D ;
    input C ;
    input CLR ;
    
    wire synch_enable ;
    
    reg Q ;
    
    always@( posedge C or posedge CLR )
    begin
        if ( CLR ) Q <= 1'b0;
        else Q <= ( D );
    end
    assign synch_enable = ( 1'b1 );

endmodule
module GND ( G );

    output G ;
    
    assign G = ~( 1'b1 );

endmodule

module eSYNCERR_213 ( error , stage , we , metric , reset , clock );

    output error ;
    input [3:0] stage ;
    input we ;
    input [2:0] metric ;
    input reset ;
    input clock ;
    
    wire N48 ;
    
    FDC  error_reg ( .CLR ( reset ) , .Q ( error ) , .C ( clock ) , .D ( 
        N48 ) );
    GND  C35 ( .G ( N48 ) );

endmodule

module XORCY ( O , LI , CI );

    output O ;
    input LI ;
    input CI ;
    
    assign O = ( LI ^ CI );

endmodule

module MUXCY_L ( LO , S , DI , CI );

    output LO ;
    input S ;
    input DI ;
    input CI ;
    
    wire net1 ;
    wire net2 ;
    
    assign net1 = ( ~S & DI );
    assign net2 = ( S & CI );
    assign LO = ~( ~net1 & ~net2 );

endmodule

module FDPE ( Q , D , C , PRE , CE );

    output Q ;
    input D ;
    input C ;
    input PRE ;
    input CE ;
    
    wire synch_enable ;
    wire next_state ;
    wire net0 ;
    wire net1 ;
    
    reg Q ;
    
    always@( posedge C or posedge PRE )
    begin
        if ( PRE ) Q <= 1'b1;
        else Q <= ( next_state );
    end
    assign net0 = ( Q & ~CE );
    assign net1 = ( D & CE );
    assign next_state = ~( ~net0 & ~net1 );
    assign synch_enable = ( 1'b1 );

endmodule
module BUFE ( O , I , E );

    output O ;
    input I ;
    input E ;
    
    reg O ;
    
    always@( I or E )
    begin
        if ( E ) O = ( I );
        else O = 1'bz;
    end

endmodule

module VCC ( P );

    output P ;
    
    assign P = ( 1'b1 );

endmodule

module eCONTROL_213 ( Dx , oe , le , ae , sync_error , A0_out , A1_out 
    , A2_out , A3_out , A4_out , A5_out , A6_out , A7_out , A0_in , A1_in 
    , A2_in , A3_in , A4_in , A5_in , A6_in , A7_in , P0_in , P1_in , P2_in 
    , P3_in , P4_in , P5_in , P6_in , P7_in , seq_ready , reset , clock 
    );

    output Dx ;
    output oe ;
    output le ;
    output ae ;
    output sync_error ;
    output [3:0] A0_out ;
    output [3:0] A1_out ;
    output [3:0] A2_out ;
    output [3:0] A3_out ;
    output [3:0] A4_out ;
    output [3:0] A5_out ;
    output [3:0] A6_out ;
    output [3:0] A7_out ;
    input [3:0] A0_in ;
    input [3:0] A1_in ;
    input [3:0] A2_in ;
    input [3:0] A3_in ;
    input [3:0] A4_in ;
    input [3:0] A5_in ;
    input [3:0] A6_in ;
    input [3:0] A7_in ;
    input P0_in ;
    input P1_in ;
    input P2_in ;
    input P3_in ;
    input P4_in ;
    input P5_in ;
    input P6_in ;
    input P7_in ;
    input seq_ready ;
    input reset ;
    input clock ;
    
    wire \min_state<2> ;
    wire \min_state<1> ;
    wire \min_state<0> ;
    wire \NEXT_STATE<3> ;
    wire \symbol_count<4> ;
    wire \symbol_count<1> ;
    wire \NEXT_STATE<6> ;
    wire \write_ptr<2> ;
    wire \tb_reg<0> ;
    wire \NEXT_STATE<4> ;
    wire \NEXT_STATE<0> ;
    wire \trace_ptr<0> ;
    wire \NEXT_STATE<5> ;
    wire \write_ptr<0> ;
    wire \trace_ptr<2> ;
    wire \NEXT_STATE<1> ;
    wire \trace_ptr<3> ;
    wire \P2<11> ;
    wire \P2<10> ;
    wire \P2<9> ;
    wire \P2<8> ;
    wire \P2<7> ;
    wire \P2<6> ;
    wire \P2<5> ;
    wire \P2<4> ;
    wire \P2<3> ;
    wire \P2<2> ;
    wire \P2<1> ;
    wire \P2<0> ;
    wire \P6<11> ;
    wire \P6<10> ;
    wire \P6<9> ;
    wire \P6<8> ;
    wire \P6<7> ;
    wire \P6<6> ;
    wire \P6<5> ;
    wire \P6<4> ;
    wire \P6<3> ;
    wire \P6<2> ;
    wire \P6<1> ;
    wire \P6<0> ;
    wire \tb_reg<2> ;
    wire \tb_reg<1> ;
    wire \trace_ptr<1> ;
    wire te ;
    wire \write_ptr<3> ;
    wire \P4<11> ;
    wire \P4<10> ;
    wire \P4<9> ;
    wire \P4<8> ;
    wire \P4<7> ;
    wire \P4<6> ;
    wire \P4<5> ;
    wire \P4<4> ;
    wire \P4<3> ;
    wire \P4<2> ;
    wire \P4<1> ;
    wire \P4<0> ;
    wire \write_ptr<1> ;
    wire we ;
    wire \symbol_count<8> ;
    wire \symbol_count<7> ;
    wire \symbol_count<6> ;
    wire \symbol_count<5> ;
    wire \symbol_count<3> ;
    wire \symbol_count<2> ;
    wire \symbol_count<0> ;
    wire \NEXT_STATE<2> ;
    wire \P0<11> ;
    wire \P0<10> ;
    wire \P0<9> ;
    wire \P0<8> ;
    wire \P0<7> ;
    wire \P0<6> ;
    wire \P0<5> ;
    wire \P0<4> ;
    wire \P0<3> ;
    wire \P0<2> ;
    wire \P0<1> ;
    wire \P0<0> ;
    wire \P1<11> ;
    wire \P1<10> ;
    wire \P1<9> ;
    wire \P1<8> ;
    wire \P1<7> ;
    wire \P1<6> ;
    wire \P1<5> ;
    wire \P1<4> ;
    wire \P1<3> ;
    wire \P1<2> ;
    wire \P1<1> ;
    wire \P1<0> ;
    wire \A2_Q987<3> ;
    wire \A2<2> ;
    wire \A2<1> ;
    wire \A2<0> ;
    wire \P5<11> ;
    wire \P5<10> ;
    wire \P5<9> ;
    wire \P5<8> ;
    wire \P5<7> ;
    wire \P5<6> ;
    wire \P5<5> ;
    wire \P5<4> ;
    wire \P5<3> ;
    wire \P5<2> ;
    wire \P5<1> ;
    wire \P5<0> ;
    wire \A0_Q969<3> ;
    wire \A0<2> ;
    wire \A0<1> ;
    wire \A0<0> ;
    wire \A6_Q1023<3> ;
    wire \A6<2> ;
    wire \A6<1> ;
    wire \A6<0> ;
    wire \A1_Q978<3> ;
    wire \A1<2> ;
    wire \A1<1> ;
    wire \A1<0> ;
    wire \P3<11> ;
    wire \P3<10> ;
    wire \P3<9> ;
    wire \P3<8> ;
    wire \P3<7> ;
    wire \P3<6> ;
    wire \P3<5> ;
    wire \P3<4> ;
    wire \P3<3> ;
    wire \P3<2> ;
    wire \P3<1> ;
    wire \P3<0> ;
    wire n687 ;
    wire \A5_Q1014<3> ;
    wire \A5<2> ;
    wire \A5<1> ;
    wire \A5<0> ;
    wire \A3_Q996<3> ;
    wire \A3<2> ;
    wire \A3<1> ;
    wire \A3<0> ;
    wire \A7_Q1032<3> ;
    wire \A7<2> ;
    wire \A7<1> ;
    wire \A7<0> ;
    wire \A4_Q1005<3> ;
    wire \A4<2> ;
    wire \A4<1> ;
    wire \A4<0> ;
    wire \P7<11> ;
    wire \P7<10> ;
    wire \P7<9> ;
    wire \P7<8> ;
    wire \P7<7> ;
    wire \P7<6> ;
    wire \P7<5> ;
    wire \P7<4> ;
    wire \P7<3> ;
    wire \P7<2> ;
    wire \P7<1> ;
    wire \P7<0> ;
    wire \C12/N6 ;
    wire \C12/N12 ;
    wire \C12/N18 ;
    wire \C44/N12 ;
    wire \C45/N5 ;
    wire \C47/N5 ;
    wire \C49/N17 ;
    wire \C49/N29 ;
    wire \C49/N59 ;
    wire \C49/N69 ;
    wire \C49/N77 ;
    wire \C50/N9 ;
    wire \C51/N6 ;
    wire \C51/N11 ;
    wire \C51/N14 ;
    wire \C51/N22 ;
    wire \C52/N9 ;
    wire N1455 ;
    wire N1456 ;
    wire N1457 ;
    wire N1458 ;
    wire N1459 ;
    wire N1460 ;
    wire N1461 ;
    wire N1462 ;
    wire N1463 ;
    wire \C1149/N0 ;
    wire \C1149/N3 ;
    wire \C1149/N6 ;
    wire \C1149/N9 ;
    wire \C1149/N12 ;
    wire \C1149/N15 ;
    wire \C1149/N18 ;
    wire \C1149/N21 ;
    wire \C1149/N24 ;
    wire \C1175/N6 ;
    wire \C1175/N11 ;
    wire \C1175/N16 ;
    wire \C1175/N22 ;
    wire \C1149/C3/N0 ;
    wire N1977 ;
    wire N1978 ;
    wire N1979 ;
    wire N1980 ;
    wire N1981 ;
    wire N1982 ;
    wire N1983 ;
    wire N1984 ;
    wire N1985 ;
    wire syn1455 ;
    wire syn5794 ;
    wire syn5795 ;
    wire syn5646 ;
    wire syn5693 ;
    wire syn1617 ;
    wire syn1642 ;
    wire syn6398 ;
    wire syn6399 ;
    wire syn6403 ;
    wire syn6394 ;
    wire syn6395 ;
    wire syn6396 ;
    wire syn6397 ;
    wire syn1146 ;
    wire syn1147 ;
    wire syn1148 ;
    wire syn1149 ;
    wire syn1130 ;
    wire syn1133 ;
    wire syn1134 ;
    wire syn1150 ;
    wire syn1142 ;
    wire syn1143 ;
    wire syn1144 ;
    wire syn1145 ;
    wire syn6422 ;
    wire syn6423 ;
    wire syn6427 ;
    wire syn6418 ;
    wire syn6419 ;
    wire syn6420 ;
    wire syn6421 ;
    wire syn1670 ;
    wire syn1695 ;
    wire syn6448 ;
    wire syn6449 ;
    wire syn6453 ;
    wire syn6444 ;
    wire syn6445 ;
    wire syn6446 ;
    wire syn6447 ;
    wire syn6472 ;
    wire syn6473 ;
    wire syn6477 ;
    wire syn6468 ;
    wire syn6469 ;
    wire syn6470 ;
    wire syn6471 ;
    wire syn5743 ;
    wire syn5790 ;
    wire syn1507 ;
    wire syn1532 ;
    wire syn6296 ;
    wire syn6297 ;
    wire syn6301 ;
    wire syn6292 ;
    wire syn6293 ;
    wire syn6294 ;
    wire syn6295 ;
    wire syn6320 ;
    wire syn6321 ;
    wire syn6325 ;
    wire syn6316 ;
    wire syn6317 ;
    wire syn6318 ;
    wire syn6319 ;
    wire syn1561 ;
    wire syn1586 ;
    wire syn6346 ;
    wire syn6347 ;
    wire syn6351 ;
    wire syn6342 ;
    wire syn6343 ;
    wire syn6344 ;
    wire syn6345 ;
    wire syn6370 ;
    wire syn6371 ;
    wire syn6375 ;
    wire syn6366 ;
    wire syn6367 ;
    wire syn6368 ;
    wire syn6369 ;
    wire syn6252 ;
    wire syn6154 ;
    wire syn1359 ;
    wire syn4836 ;
    wire syn1126 ;
    wire \C1153/C8/C5 ;
    wire syn1385 ;
    wire syn6213 ;
    wire syn1352 ;
    wire syn6191 ;
    wire C694 ;
    wire syn1375 ;
    wire syn1151 ;
    wire syn1373 ;
    wire \C1154/C8/C4 ;
    wire \C1165/C3/C5 ;
    wire \SE_1stage<3> ;
    wire \SE_1stage<2> ;
    wire \SE_1stage<1> ;
    wire \SE_1stage<0> ;
    wire SE_1we ;
    wire \SE_1metric<2> ;
    wire \SE_1metric<1> ;
    wire \SE_1metric<0> ;
    
    eTBDECISION_213  TB_1 ( .best_state ({ \min_state<2> , \min_state<1> 
        , \min_state<0> }) , .in4 ({ A4_out [3] , A4_out [2] , A4_out [1] 
        , A4_out [0] }) , .in0 ({ A0_out [3] , A0_out [2] , A0_out [1] 
        , A0_out [0] }) , .in2 ({ A2_out [3] , A2_out [2] , A2_out [1] 
        , A2_out [0] }) , .in7 ({ A7_out [3] , A7_out [2] , A7_out [1] 
        , A7_out [0] }) , .in1 ({ A1_out [3] , A1_out [2] , A1_out [1] 
        , A1_out [0] }) , .in6 ({ A6_out [3] , A6_out [2] , A6_out [1] 
        , A6_out [0] }) , .in5 ({ A5_out [3] , A5_out [2] , A5_out [1] 
        , A5_out [0] }) , .in3 ({ A3_out [3] , A3_out [2] , A3_out [1] 
        , A3_out [0] }) );
    eSYNCERR_213  SE_1 ( .error ( sync_error ) , .clock ( clock ) , .reset ( 
        reset ) );
    XORCY  \C1149/C3/C0 ( .LI ( \symbol_count<0> ) , .CI ( \C1149/N0 ) 
        , .O ( N1455 ) );
    MUXCY_L  \C1149/C3/C1 ( .CI ( \C1149/N0 ) , .S ( \symbol_count<0> ) 
        , .LO ( \C1149/N3 ) , .DI ( \C1149/C3/N0 ) );
    XORCY  \C1149/C4/C0 ( .LI ( \symbol_count<1> ) , .CI ( \C1149/N3 ) 
        , .O ( N1456 ) );
    MUXCY_L  \C1149/C4/C1 ( .CI ( \C1149/N3 ) , .S ( \symbol_count<1> ) 
        , .LO ( \C1149/N6 ) , .DI ( \C1149/C3/N0 ) );
    XORCY  \C1149/C5/C0 ( .LI ( \symbol_count<2> ) , .O ( N1457 ) , .CI ( 
        \C1149/N6 ) );
    MUXCY_L  \C1149/C5/C1 ( .CI ( \C1149/N6 ) , .S ( \symbol_count<2> ) 
        , .LO ( \C1149/N9 ) , .DI ( \C1149/C3/N0 ) );
    XORCY  \C1149/C6/C0 ( .CI ( \C1149/N9 ) , .O ( N1458 ) , .LI ( \symbol_count<3> ) 
        );
    MUXCY_L  \C1149/C6/C1 ( .CI ( \C1149/N9 ) , .S ( \symbol_count<3> ) 
        , .DI ( \C1149/C3/N0 ) , .LO ( \C1149/N12 ) );
    XORCY  \C1149/C7/C0 ( .CI ( \C1149/N12 ) , .O ( N1459 ) , .LI ( \symbol_count<4> ) 
        );
    MUXCY_L  \C1149/C7/C1 ( .CI ( \C1149/N12 ) , .S ( \symbol_count<4> ) 
        , .DI ( \C1149/C3/N0 ) , .LO ( \C1149/N15 ) );
    XORCY  \C1149/C8/C0 ( .CI ( \C1149/N15 ) , .O ( N1460 ) , .LI ( \symbol_count<5> ) 
        );
    MUXCY_L  \C1149/C8/C1 ( .S ( \symbol_count<5> ) , .CI ( \C1149/N15 ) 
        , .DI ( \C1149/C3/N0 ) , .LO ( \C1149/N18 ) );
    XORCY  \C1149/C9/C0 ( .CI ( \C1149/N18 ) , .O ( N1461 ) , .LI ( \symbol_count<6> ) 
        );
    MUXCY_L  \C1149/C9/C1 ( .DI ( \C1149/C3/N0 ) , .CI ( \C1149/N18 ) , 
        .S ( \symbol_count<6> ) , .LO ( \C1149/N21 ) );
    XORCY  \C1149/C10/C0 ( .LI ( \symbol_count<7> ) , .CI ( \C1149/N21 ) 
        , .O ( N1462 ) );
    MUXCY_L  \C1149/C10/C1 ( .DI ( \C1149/C3/N0 ) , .CI ( \C1149/N21 ) 
        , .S ( \symbol_count<7> ) , .LO ( \C1149/N24 ) );
    XORCY  \C1149/C11/C0 ( .LI ( \symbol_count<8> ) , .CI ( \C1149/N24 ) 
        , .O ( N1463 ) );
    FDCE  we_reg ( .CE ( \C44/N12 ) , .CLR ( reset ) , .C ( clock ) , .Q ( 
        we ) , .D ( \NEXT_STATE<3> ) );
    FDPE  \NEXT_STATE_reg<0> ( .PRE ( reset ) , .C ( clock ) , .D ( \C49/N17 ) 
        , .Q ( \NEXT_STATE<0> ) , .CE ( \C50/N9 ) );
    FDCE  \NEXT_STATE_reg<4> ( .CE ( \C50/N9 ) , .D ( \C49/N59 ) , .CLR ( 
        reset ) , .C ( clock ) , .Q ( \NEXT_STATE<4> ) );
    FDCE  \NEXT_STATE_reg<6> ( .C ( clock ) , .Q ( \NEXT_STATE<6> ) , .CE ( 
        \C50/N9 ) , .CLR ( reset ) , .D ( \C49/N77 ) );
    FDCE  \NEXT_STATE_reg<2> ( .CE ( \C50/N9 ) , .CLR ( reset ) , .D ( 
        \NEXT_STATE<1> ) , .C ( clock ) , .Q ( \NEXT_STATE<2> ) );
    FDCE  le_reg ( .CE ( \C44/N12 ) , .D ( \NEXT_STATE<1> ) , .CLR ( reset ) 
        , .C ( clock ) , .Q ( le ) );
    FDCE  te_reg ( .C ( clock ) , .Q ( te ) , .CE ( \C44/N12 ) , .CLR ( 
        reset ) , .D ( \C45/N5 ) );
    FDCE  \NEXT_STATE_reg<3> ( .CE ( \C50/N9 ) , .CLR ( reset ) , .D ( 
        \NEXT_STATE<2> ) , .C ( clock ) , .Q ( \NEXT_STATE<3> ) );
    FDCE  \NEXT_STATE_reg<5> ( .C ( clock ) , .Q ( \NEXT_STATE<5> ) , .CE ( 
        \C50/N9 ) , .CLR ( reset ) , .D ( \C49/N69 ) );
    FDCE  \NEXT_STATE_reg<1> ( .CE ( \C50/N9 ) , .CLR ( reset ) , .D ( 
        \C49/N29 ) , .C ( clock ) , .Q ( \NEXT_STATE<1> ) );
    FDCE  ae_reg ( .CE ( \C44/N12 ) , .C ( clock ) , .Q ( ae ) , .CLR ( 
        reset ) , .D ( \NEXT_STATE<2> ) );
    FDCE  oe_reg ( .C ( clock ) , .Q ( oe ) , .CE ( \C44/N12 ) , .CLR ( 
        reset ) , .D ( \C47/N5 ) );
    FDCE  \symbol_count_reg<0> ( .CE ( \C47/N5 ) , .CLR ( reset ) , .D ( 
        N1455 ) , .C ( clock ) , .Q ( \symbol_count<0> ) );
    FDCE  \symbol_count_reg<1> ( .C ( clock ) , .Q ( \symbol_count<1> ) 
        , .CE ( \C47/N5 ) , .CLR ( reset ) , .D ( N1456 ) );
    FDCE  \symbol_count_reg<2> ( .CE ( \C47/N5 ) , .CLR ( reset ) , .D ( 
        N1457 ) , .C ( clock ) , .Q ( \symbol_count<2> ) );
    FDCE  \symbol_count_reg<3> ( .C ( clock ) , .Q ( \symbol_count<3> ) 
        , .CE ( \C47/N5 ) , .CLR ( reset ) , .D ( N1458 ) );
    FDCE  \symbol_count_reg<4> ( .CLR ( reset ) , .Q ( \symbol_count<4> ) 
        , .CE ( \C47/N5 ) , .C ( clock ) , .D ( N1459 ) );
    FDCE  \symbol_count_reg<5> ( .CE ( \C47/N5 ) , .CLR ( reset ) , .D ( 
        N1460 ) , .C ( clock ) , .Q ( \symbol_count<5> ) );
    FDCE  \symbol_count_reg<6> ( .C ( clock ) , .Q ( \symbol_count<6> ) 
        , .CE ( \C47/N5 ) , .CLR ( reset ) , .D ( N1461 ) );
    FDCE  \symbol_count_reg<7> ( .Q ( \symbol_count<7> ) , .CE ( \C47/N5 ) 
        , .CLR ( reset ) , .C ( clock ) , .D ( N1462 ) );
    FDCE  \symbol_count_reg<8> ( .CE ( \C47/N5 ) , .CLR ( reset ) , .C ( 
        clock ) , .D ( N1463 ) , .Q ( \symbol_count<8> ) );
    FDCE  \trace_ptr_reg<0> ( .CE ( \C49/N69 ) , .CLR ( reset ) , .D ( 
        \C1175/N6 ) , .C ( clock ) , .Q ( \trace_ptr<0> ) );
    FDCE  \trace_ptr_reg<1> ( .CE ( \C49/N69 ) , .C ( clock ) , .D ( \C1175/N11 ) 
        , .CLR ( reset ) , .Q ( \trace_ptr<1> ) );
    FDCE  \trace_ptr_reg<2> ( .CLR ( reset ) , .D ( \C1175/N16 ) , .CE ( 
        \C49/N69 ) , .C ( clock ) , .Q ( \trace_ptr<2> ) );
    FDCE  \trace_ptr_reg<3> ( .C ( clock ) , .Q ( \trace_ptr<3> ) , .CE ( 
        \C49/N69 ) , .CLR ( reset ) , .D ( \C1175/N22 ) );
    FDCE  \write_ptr_reg<0> ( .CLR ( reset ) , .Q ( \write_ptr<0> ) , .CE ( 
        \C52/N9 ) , .C ( clock ) , .D ( \C51/N6 ) );
    FDCE  \write_ptr_reg<1> ( .CLR ( reset ) , .D ( \C51/N11 ) , .CE ( 
        \C52/N9 ) , .C ( clock ) , .Q ( \write_ptr<1> ) );
    FDCE  \write_ptr_reg<2> ( .C ( clock ) , .Q ( \write_ptr<2> ) , .CE ( 
        \C52/N9 ) , .CLR ( reset ) , .D ( \C51/N14 ) );
    FDCE  \write_ptr_reg<3> ( .CLR ( reset ) , .Q ( \write_ptr<3> ) , .CE ( 
        \C52/N9 ) , .C ( clock ) , .D ( \C51/N22 ) );
    FDCE  \tb_reg_reg<0> ( .CE ( N1985 ) , .CLR ( reset ) , .C ( clock ) 
        , .D ( \C12/N18 ) , .Q ( \tb_reg<0> ) );
    FDCE  \tb_reg_reg<1> ( .CE ( N1985 ) , .CLR ( reset ) , .C ( clock ) 
        , .D ( \C12/N12 ) , .Q ( \tb_reg<1> ) );
    FDCE  \tb_reg_reg<2> ( .C ( clock ) , .Q ( \tb_reg<2> ) , .CE ( N1985 ) 
        , .CLR ( reset ) , .D ( \C12/N6 ) );
    FDPE  \A7_reg<0> ( .CE ( we ) , .PRE ( reset ) , .D ( A7_in [0] ) , 
        .C ( clock ) , .Q ( \A7<0> ) );
    FDPE  \A7_reg<1> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A7<1> ) , 
        .CE ( we ) , .D ( A7_in [1] ) );
    FDPE  \A7_reg<2> ( .C ( clock ) , .Q ( \A7<2> ) , .CE ( we ) , .PRE ( 
        reset ) , .D ( A7_in [2] ) );
    FDPE  \A7_reg<3> ( .CE ( we ) , .D ( A7_in [3] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A7_Q1032<3> ) );
    FDPE  \A6_reg<0> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A6<0> ) , 
        .CE ( we ) , .D ( A6_in [0] ) );
    FDPE  \A6_reg<1> ( .CE ( we ) , .D ( A6_in [1] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A6<1> ) );
    FDPE  \A6_reg<2> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A6<2> ) , 
        .CE ( we ) , .D ( A6_in [2] ) );
    FDPE  \A6_reg<3> ( .CE ( we ) , .D ( A6_in [3] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A6_Q1023<3> ) );
    FDPE  \A5_reg<0> ( .CE ( we ) , .D ( A5_in [0] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A5<0> ) );
    FDPE  \A5_reg<1> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A5<1> ) , 
        .CE ( we ) , .D ( A5_in [1] ) );
    FDPE  \A5_reg<2> ( .CE ( we ) , .D ( A5_in [2] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A5<2> ) );
    FDPE  \A5_reg<3> ( .D ( A5_in [3] ) , .CE ( we ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A5_Q1014<3> ) );
    FDPE  \A4_reg<0> ( .CE ( we ) , .PRE ( reset ) , .C ( clock ) , .Q ( 
        \A4<0> ) , .D ( A4_in [0] ) );
    FDPE  \A4_reg<1> ( .CE ( we ) , .C ( clock ) , .D ( A4_in [1] ) , .PRE ( 
        reset ) , .Q ( \A4<1> ) );
    FDPE  \A4_reg<2> ( .PRE ( reset ) , .CE ( we ) , .C ( clock ) , .D ( 
        A4_in [2] ) , .Q ( \A4<2> ) );
    FDPE  \A4_reg<3> ( .CE ( we ) , .D ( A4_in [3] ) , .Q ( \A4_Q1005<3> ) 
        , .PRE ( reset ) , .C ( clock ) );
    FDPE  \A3_reg<0> ( .CE ( we ) , .PRE ( reset ) , .D ( A3_in [0] ) , 
        .Q ( \A3<0> ) , .C ( clock ) );
    FDPE  \A3_reg<1> ( .PRE ( reset ) , .D ( A3_in [1] ) , .CE ( we ) , 
        .C ( clock ) , .Q ( \A3<1> ) );
    FDPE  \A3_reg<2> ( .CE ( we ) , .D ( A3_in [2] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A3<2> ) );
    FDPE  \A3_reg<3> ( .CE ( we ) , .D ( A3_in [3] ) , .Q ( \A3_Q996<3> ) 
        , .PRE ( reset ) , .C ( clock ) );
    FDPE  \A2_reg<0> ( .C ( clock ) , .CE ( we ) , .PRE ( reset ) , .D ( 
        A2_in [0] ) , .Q ( \A2<0> ) );
    FDPE  \A2_reg<1> ( .CE ( we ) , .PRE ( reset ) , .D ( A2_in [1] ) , 
        .Q ( \A2<1> ) , .C ( clock ) );
    FDPE  \A2_reg<2> ( .CE ( we ) , .PRE ( reset ) , .D ( A2_in [2] ) , 
        .C ( clock ) , .Q ( \A2<2> ) );
    FDPE  \A2_reg<3> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A2_Q987<3> ) 
        , .CE ( we ) , .D ( A2_in [3] ) );
    FDPE  \A1_reg<0> ( .CE ( we ) , .D ( A1_in [0] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A1<0> ) );
    FDPE  \A1_reg<1> ( .CE ( we ) , .PRE ( reset ) , .D ( A1_in [1] ) , 
        .C ( clock ) , .Q ( \A1<1> ) );
    FDPE  \A1_reg<2> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A1<2> ) , 
        .CE ( we ) , .D ( A1_in [2] ) );
    FDPE  \A1_reg<3> ( .CE ( we ) , .D ( A1_in [3] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A1_Q978<3> ) );
    FDCE  \A0_reg<0> ( .CLR ( reset ) , .C ( clock ) , .Q ( \A0<0> ) , 
        .CE ( we ) , .D ( A0_in [0] ) );
    FDCE  \A0_reg<1> ( .CE ( we ) , .CLR ( reset ) , .D ( A0_in [1] ) , 
        .C ( clock ) , .Q ( \A0<1> ) );
    FDCE  \A0_reg<2> ( .C ( clock ) , .Q ( \A0<2> ) , .CE ( we ) , .CLR ( 
        reset ) , .D ( A0_in [2] ) );
    FDCE  \A0_reg<3> ( .CLR ( reset ) , .C ( clock ) , .Q ( \A0_Q969<3> ) 
        , .CE ( we ) , .D ( A0_in [3] ) );
    FDCE  \P7_reg<0> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P7<1> ) , 
        .C ( clock ) , .Q ( \P7<0> ) );
    FDCE  \P7_reg<1> ( .C ( clock ) , .Q ( \P7<1> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P7<2> ) );
    FDCE  \P7_reg<2> ( .CE ( n687 ) , .D ( \P7<3> ) , .Q ( \P7<2> ) , .CLR ( 
        reset ) , .C ( clock ) );
    FDCE  \P7_reg<3> ( .CE ( n687 ) , .D ( \P7<4> ) , .Q ( \P7<3> ) , .CLR ( 
        reset ) , .C ( clock ) );
    FDCE  \P7_reg<4> ( .CE ( n687 ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \P7<5> ) , .Q ( \P7<4> ) );
    FDCE  \P7_reg<5> ( .C ( clock ) , .D ( \P7<6> ) , .Q ( \P7<5> ) , .CE ( 
        n687 ) , .CLR ( reset ) );
    FDCE  \P7_reg<6> ( .CE ( n687 ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \P7<7> ) , .Q ( \P7<6> ) );
    FDCE  \P7_reg<7> ( .C ( clock ) , .D ( \P7<8> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .Q ( \P7<7> ) );
    FDCE  \P7_reg<8> ( .CLR ( reset ) , .C ( clock ) , .D ( \P7<9> ) , 
        .CE ( n687 ) , .Q ( \P7<8> ) );
    FDCE  \P7_reg<9> ( .C ( clock ) , .D ( \P7<10> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .Q ( \P7<9> ) );
    FDCE  \P7_reg<10> ( .CE ( n687 ) , .Q ( \P7<10> ) , .CLR ( reset ) 
        , .C ( clock ) , .D ( \P7<11> ) );
    FDCE  \P7_reg<11> ( .CLR ( reset ) , .C ( clock ) , .D ( N1982 ) , 
        .Q ( \P7<11> ) , .CE ( n687 ) );
    FDCE  \P6_reg<0> ( .CE ( n687 ) , .D ( \P6<1> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P6<0> ) );
    FDCE  \P6_reg<1> ( .CE ( n687 ) , .D ( \P6<2> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P6<1> ) );
    FDCE  \P6_reg<2> ( .C ( clock ) , .Q ( \P6<2> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P6<3> ) );
    FDCE  \P6_reg<3> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P6<4> ) , 
        .C ( clock ) , .Q ( \P6<3> ) );
    FDCE  \P6_reg<4> ( .CE ( n687 ) , .C ( clock ) , .D ( \P6<5> ) , .CLR ( 
        reset ) , .Q ( \P6<4> ) );
    FDCE  \P6_reg<5> ( .C ( clock ) , .Q ( \P6<5> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P6<6> ) );
    FDCE  \P6_reg<6> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P6<7> ) , 
        .C ( clock ) , .Q ( \P6<6> ) );
    FDCE  \P6_reg<7> ( .C ( clock ) , .Q ( \P6<7> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P6<8> ) );
    FDCE  \P6_reg<8> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P6<9> ) , 
        .C ( clock ) , .Q ( \P6<8> ) );
    FDCE  \P6_reg<9> ( .C ( clock ) , .Q ( \P6<9> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P6<10> ) );
    FDCE  \P6_reg<10> ( .CLR ( reset ) , .C ( clock ) , .Q ( \P6<10> ) 
        , .CE ( n687 ) , .D ( \P6<11> ) );
    FDCE  \P6_reg<11> ( .CE ( n687 ) , .CLR ( reset ) , .D ( N1979 ) , 
        .C ( clock ) , .Q ( \P6<11> ) );
    FDCE  \P5_reg<0> ( .C ( clock ) , .Q ( \P5<0> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P5<1> ) );
    FDCE  \P5_reg<1> ( .CLR ( reset ) , .D ( \P5<2> ) , .Q ( \P5<1> ) , 
        .CE ( n687 ) , .C ( clock ) );
    FDCE  \P5_reg<2> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P5<3> ) , 
        .C ( clock ) , .Q ( \P5<2> ) );
    FDCE  \P5_reg<3> ( .C ( clock ) , .Q ( \P5<3> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P5<4> ) );
    FDCE  \P5_reg<4> ( .CLR ( reset ) , .C ( clock ) , .Q ( \P5<4> ) , 
        .CE ( n687 ) , .D ( \P5<5> ) );
    FDCE  \P5_reg<5> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P5<6> ) , 
        .C ( clock ) , .Q ( \P5<5> ) );
    FDCE  \P5_reg<6> ( .C ( clock ) , .Q ( \P5<6> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P5<7> ) );
    FDCE  \P5_reg<7> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P5<8> ) , 
        .C ( clock ) , .Q ( \P5<7> ) );
    FDCE  \P5_reg<8> ( .C ( clock ) , .Q ( \P5<8> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P5<9> ) );
    FDCE  \P5_reg<9> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P5<10> ) , 
        .C ( clock ) , .Q ( \P5<9> ) );
    FDCE  \P5_reg<10> ( .CE ( n687 ) , .D ( \P5<11> ) , .CLR ( reset ) 
        , .C ( clock ) , .Q ( \P5<10> ) );
    FDCE  \P5_reg<11> ( .C ( clock ) , .Q ( \P5<11> ) , .CE ( n687 ) , 
        .CLR ( reset ) , .D ( N1981 ) );
    FDCE  \P4_reg<0> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P4<1> ) , 
        .C ( clock ) , .Q ( \P4<0> ) );
    FDCE  \P4_reg<1> ( .CE ( n687 ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \P4<2> ) , .Q ( \P4<1> ) );
    FDCE  \P4_reg<2> ( .C ( clock ) , .Q ( \P4<2> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P4<3> ) );
    FDCE  \P4_reg<3> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P4<4> ) , 
        .C ( clock ) , .Q ( \P4<3> ) );
    FDCE  \P4_reg<4> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P4<5> ) , 
        .C ( clock ) , .Q ( \P4<4> ) );
    FDCE  \P4_reg<5> ( .C ( clock ) , .Q ( \P4<5> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P4<6> ) );
    FDCE  \P4_reg<6> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P4<7> ) , 
        .C ( clock ) , .Q ( \P4<6> ) );
    FDCE  \P4_reg<7> ( .C ( clock ) , .Q ( \P4<7> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P4<8> ) );
    FDCE  \P4_reg<8> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P4<9> ) , 
        .C ( clock ) , .Q ( \P4<8> ) );
    FDCE  \P4_reg<9> ( .CE ( n687 ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \P4<10> ) , .Q ( \P4<9> ) );
    FDCE  \P4_reg<10> ( .C ( clock ) , .Q ( \P4<10> ) , .CE ( n687 ) , 
        .CLR ( reset ) , .D ( \P4<11> ) );
    FDCE  \P4_reg<11> ( .CE ( n687 ) , .CLR ( reset ) , .D ( N1984 ) , 
        .C ( clock ) , .Q ( \P4<11> ) );
    FDCE  \P3_reg<0> ( .CLR ( reset ) , .C ( clock ) , .Q ( \P3<0> ) , 
        .CE ( n687 ) , .D ( \P3<1> ) );
    FDCE  \P3_reg<1> ( .CLR ( reset ) , .D ( \P3<2> ) , .Q ( \P3<1> ) , 
        .CE ( n687 ) , .C ( clock ) );
    FDCE  \P3_reg<2> ( .CLR ( reset ) , .C ( clock ) , .Q ( \P3<2> ) , 
        .CE ( n687 ) , .D ( \P3<3> ) );
    FDCE  \P3_reg<3> ( .CLR ( reset ) , .C ( clock ) , .D ( \P3<4> ) , 
        .Q ( \P3<3> ) , .CE ( n687 ) );
    FDCE  \P3_reg<4> ( .C ( clock ) , .D ( \P3<5> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .Q ( \P3<4> ) );
    FDCE  \P3_reg<5> ( .CE ( n687 ) , .CLR ( reset ) , .Q ( \P3<5> ) , 
        .C ( clock ) , .D ( \P3<6> ) );
    FDCE  \P3_reg<6> ( .CE ( n687 ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \P3<7> ) , .Q ( \P3<6> ) );
    FDCE  \P3_reg<7> ( .Q ( \P3<7> ) , .CE ( n687 ) , .CLR ( reset ) , 
        .C ( clock ) , .D ( \P3<8> ) );
    FDCE  \P3_reg<8> ( .CLR ( reset ) , .C ( clock ) , .D ( \P3<9> ) , 
        .Q ( \P3<8> ) , .CE ( n687 ) );
    FDCE  \P3_reg<9> ( .CE ( n687 ) , .C ( clock ) , .D ( \P3<10> ) , .CLR ( 
        reset ) , .Q ( \P3<9> ) );
    FDCE  \P3_reg<10> ( .CLR ( reset ) , .C ( clock ) , .CE ( n687 ) , 
        .D ( \P3<11> ) , .Q ( \P3<10> ) );
    FDCE  \P3_reg<11> ( .CE ( n687 ) , .C ( clock ) , .D ( N1983 ) , .CLR ( 
        reset ) , .Q ( \P3<11> ) );
    FDCE  \P2_reg<0> ( .CE ( n687 ) , .C ( clock ) , .Q ( \P2<0> ) , .CLR ( 
        reset ) , .D ( \P2<1> ) );
    FDCE  \P2_reg<1> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P2<2> ) , 
        .C ( clock ) , .Q ( \P2<1> ) );
    FDCE  \P2_reg<2> ( .C ( clock ) , .Q ( \P2<2> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P2<3> ) );
    FDCE  \P2_reg<3> ( .CLR ( reset ) , .C ( clock ) , .Q ( \P2<3> ) , 
        .CE ( n687 ) , .D ( \P2<4> ) );
    FDCE  \P2_reg<4> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P2<5> ) , 
        .C ( clock ) , .Q ( \P2<4> ) );
    FDCE  \P2_reg<5> ( .C ( clock ) , .Q ( \P2<5> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P2<6> ) );
    FDCE  \P2_reg<6> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P2<7> ) , 
        .C ( clock ) , .Q ( \P2<6> ) );
    FDCE  \P2_reg<7> ( .C ( clock ) , .Q ( \P2<7> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P2<8> ) );
    FDCE  \P2_reg<8> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P2<9> ) , 
        .C ( clock ) , .Q ( \P2<8> ) );
    FDCE  \P2_reg<9> ( .CE ( n687 ) , .D ( \P2<10> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P2<9> ) );
    FDCE  \P2_reg<10> ( .C ( clock ) , .Q ( \P2<10> ) , .CE ( n687 ) , 
        .CLR ( reset ) , .D ( \P2<11> ) );
    FDCE  \P2_reg<11> ( .CE ( n687 ) , .CLR ( reset ) , .D ( N1980 ) , 
        .C ( clock ) , .Q ( \P2<11> ) );
    FDCE  \P1_reg<0> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P1<1> ) , 
        .C ( clock ) , .Q ( \P1<0> ) );
    FDCE  \P1_reg<1> ( .C ( clock ) , .Q ( \P1<1> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P1<2> ) );
    FDCE  \P1_reg<2> ( .CLR ( reset ) , .D ( \P1<3> ) , .CE ( n687 ) , 
        .C ( clock ) , .Q ( \P1<2> ) );
    FDCE  \P1_reg<3> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P1<4> ) , 
        .C ( clock ) , .Q ( \P1<3> ) );
    FDCE  \P1_reg<4> ( .C ( clock ) , .Q ( \P1<4> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P1<5> ) );
    FDCE  \P1_reg<5> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P1<6> ) , 
        .C ( clock ) , .Q ( \P1<5> ) );
    FDCE  \P1_reg<6> ( .C ( clock ) , .Q ( \P1<6> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P1<7> ) );
    FDCE  \P1_reg<7> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P1<8> ) , 
        .C ( clock ) , .Q ( \P1<7> ) );
    FDCE  \P1_reg<8> ( .CE ( n687 ) , .C ( clock ) , .D ( \P1<9> ) , .CLR ( 
        reset ) , .Q ( \P1<8> ) );
    FDCE  \P1_reg<9> ( .C ( clock ) , .Q ( \P1<9> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P1<10> ) );
    FDCE  \P1_reg<10> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P1<11> ) 
        , .C ( clock ) , .Q ( \P1<10> ) );
    FDCE  \P1_reg<11> ( .CE ( n687 ) , .C ( clock ) , .CLR ( reset ) , 
        .D ( N1978 ) , .Q ( \P1<11> ) );
    FDCE  \P0_reg<0> ( .C ( clock ) , .Q ( \P0<0> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P0<1> ) );
    FDCE  \P0_reg<1> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P0<2> ) , 
        .C ( clock ) , .Q ( \P0<1> ) );
    FDCE  \P0_reg<2> ( .CE ( n687 ) , .D ( \P0<3> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P0<2> ) );
    FDCE  \P0_reg<3> ( .C ( clock ) , .Q ( \P0<3> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P0<4> ) );
    FDCE  \P0_reg<4> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P0<5> ) , 
        .C ( clock ) , .Q ( \P0<4> ) );
    FDCE  \P0_reg<5> ( .C ( clock ) , .Q ( \P0<5> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P0<6> ) );
    FDCE  \P0_reg<6> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P0<7> ) , 
        .C ( clock ) , .Q ( \P0<6> ) );
    FDCE  \P0_reg<7> ( .C ( clock ) , .Q ( \P0<7> ) , .CE ( n687 ) , .CLR ( 
        reset ) , .D ( \P0<8> ) );
    FDCE  \P0_reg<8> ( .CLR ( reset ) , .C ( clock ) , .Q ( \P0<8> ) , 
        .CE ( n687 ) , .D ( \P0<9> ) );
    FDCE  \P0_reg<9> ( .CE ( n687 ) , .CLR ( reset ) , .D ( \P0<10> ) , 
        .C ( clock ) , .Q ( \P0<9> ) );
    FDCE  \P0_reg<10> ( .C ( clock ) , .Q ( \P0<10> ) , .CE ( n687 ) , 
        .CLR ( reset ) , .D ( \P0<11> ) );
    FDCE  \P0_reg<11> ( .CE ( n687 ) , .CLR ( reset ) , .D ( N1977 ) , 
        .Q ( \P0<11> ) , .C ( clock ) );
    BUFE  C1632 ( .O ( Dx ) , .E ( oe ) , .I ( \tb_reg<2> ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1644 ( .I ({ P0_in }) , .O ( N1977 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1645 ( .I ({ P1_in }) , .O ( N1978 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1646 ( .I ({ P2_in }) , .O ( N1980 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1647 ( .I ({ P3_in }) , .O ( N1983 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1648 ( .I ({ P4_in }) , .O ( N1984 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1649 ( .I ({ P5_in }) , .O ( N1981 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1650 ( .I ({ P6_in }) , .O ( N1979 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1651 ( .I ({ P7_in }) , .O ( N1982 ) );
    g_lut # ( 3 , 8'ha8, 0'h0 ) C1652 ( .I ({ \write_ptr<2> , \write_ptr<3> , 
    we }) , .O ( n687 ) );
    g_lut # ( 4 , 16'hfe0e, 0'h0 ) C1653 ( .I ({ \min_state<2> , syn1455 , 
    syn5794 , syn5795 }) , .O ( \C12/N6 ) );
    g_lut # ( 4 , 16'h00ac, 0'h0 ) C1654 ( .I ({ \tb_reg<1> , \tb_reg<2> , 
    syn5646 , syn5693 }) , .O ( syn5795 ) );
    g_lut # ( 3 , 8'hac, 0'h0 ) C1655 ( .I ({ \tb_reg<0> , syn1617 , syn1642 }) , 
    .O ( syn5693 ) );
    g_lut # ( 3 , 8'hfe, 0'h0 ) C1656 ( .I ({ syn6398 , syn6399 , syn6403 }) , 
    .O ( syn1642 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1657 ( .I ({ syn6394 , syn6395 , syn6396 , 
    syn6397 }) , .O ( syn6403 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1658 ( .I ({ \P5<5> , \P5<4> , syn1146 , 
    syn1147 }) , .O ( syn6397 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1659 ( .I ({ \P5<6> , \P5<2> , syn1148 , 
    syn1149 }) , .O ( syn6396 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1660 ( .I ({ \P5<10> , \P5<1> , syn1130 , 
    syn1133 }) , .O ( syn6395 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1661 ( .I ({ \P5<7> , \P5<3> , syn1134 , 
    syn1150 }) , .O ( syn6394 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1662 ( .I ({ \P5<8> , \P5<0> , syn1142 , 
    syn1143 }) , .O ( syn6399 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1663 ( .I ({ \P5<11> , \P5<9> , syn1144 , 
    syn1145 }) , .O ( syn6398 ) );
    g_lut # ( 3 , 8'hfe, 0'h0 ) C1664 ( .I ({ syn6422 , syn6423 , syn6427 }) , 
    .O ( syn1617 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1665 ( .I ({ syn6418 , syn6419 , syn6420 , 
    syn6421 }) , .O ( syn6427 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1666 ( .I ({ \P4<5> , \P4<4> , syn1146 , 
    syn1147 }) , .O ( syn6421 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1667 ( .I ({ \P4<6> , \P4<2> , syn1148 , 
    syn1149 }) , .O ( syn6420 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1668 ( .I ({ \P4<10> , \P4<1> , syn1130 , 
    syn1133 }) , .O ( syn6419 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1669 ( .I ({ \P4<7> , \P4<3> , syn1134 , 
    syn1150 }) , .O ( syn6418 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1670 ( .I ({ \P4<8> , \P4<0> , syn1142 , 
    syn1143 }) , .O ( syn6423 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1671 ( .I ({ \P4<11> , \P4<9> , syn1144 , 
    syn1145 }) , .O ( syn6422 ) );
    g_lut # ( 3 , 8'hac, 0'h0 ) C1672 ( .I ({ \tb_reg<0> , syn1670 , syn1695 }) , 
    .O ( syn5646 ) );
    g_lut # ( 3 , 8'hfe, 0'h0 ) C1673 ( .I ({ syn6448 , syn6449 , syn6453 }) , 
    .O ( syn1695 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1674 ( .I ({ syn6444 , syn6445 , syn6446 , 
    syn6447 }) , .O ( syn6453 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1675 ( .I ({ \P1<5> , \P1<4> , syn1146 , 
    syn1147 }) , .O ( syn6447 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1676 ( .I ({ \P1<6> , \P1<2> , syn1148 , 
    syn1149 }) , .O ( syn6446 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1677 ( .I ({ \P1<10> , \P1<1> , syn1130 , 
    syn1133 }) , .O ( syn6445 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1678 ( .I ({ \P1<7> , \P1<3> , syn1134 , 
    syn1150 }) , .O ( syn6444 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1679 ( .I ({ \P1<8> , \P1<0> , syn1142 , 
    syn1143 }) , .O ( syn6449 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1680 ( .I ({ \P1<11> , \P1<9> , syn1144 , 
    syn1145 }) , .O ( syn6448 ) );
    g_lut # ( 3 , 8'hfe, 0'h0 ) C1681 ( .I ({ syn6472 , syn6473 , syn6477 }) , 
    .O ( syn1670 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1682 ( .I ({ syn6468 , syn6469 , syn6470 , 
    syn6471 }) , .O ( syn6477 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1683 ( .I ({ \P0<5> , \P0<4> , syn1146 , 
    syn1147 }) , .O ( syn6471 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1684 ( .I ({ \P0<6> , \P0<2> , syn1148 , 
    syn1149 }) , .O ( syn6470 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1685 ( .I ({ \P0<10> , \P0<1> , syn1130 , 
    syn1133 }) , .O ( syn6469 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1686 ( .I ({ \P0<7> , \P0<3> , syn1134 , 
    syn1150 }) , .O ( syn6468 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1687 ( .I ({ \P0<8> , \P0<0> , syn1142 , 
    syn1143 }) , .O ( syn6473 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1688 ( .I ({ \P0<11> , \P0<9> , syn1144 , 
    syn1145 }) , .O ( syn6472 ) );
    g_lut # ( 4 , 16'hac00, 0'h0 ) C1689 ( .I ({ \tb_reg<1> , \tb_reg<2> , 
    syn5743 , syn5790 }) , .O ( syn5794 ) );
    g_lut # ( 3 , 8'hac, 0'h0 ) C1690 ( .I ({ \tb_reg<0> , syn1507 , syn1532 }) , 
    .O ( syn5790 ) );
    g_lut # ( 3 , 8'hfe, 0'h0 ) C1691 ( .I ({ syn6296 , syn6297 , syn6301 }) , 
    .O ( syn1532 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1692 ( .I ({ syn6292 , syn6293 , syn6294 , 
    syn6295 }) , .O ( syn6301 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1693 ( .I ({ \P7<5> , \P7<4> , syn1146 , 
    syn1147 }) , .O ( syn6295 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1694 ( .I ({ \P7<6> , \P7<2> , syn1148 , 
    syn1149 }) , .O ( syn6294 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1695 ( .I ({ \P7<10> , \P7<1> , syn1130 , 
    syn1133 }) , .O ( syn6293 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1696 ( .I ({ \P7<7> , \P7<3> , syn1134 , 
    syn1150 }) , .O ( syn6292 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1697 ( .I ({ \P7<8> , \P7<0> , syn1142 , 
    syn1143 }) , .O ( syn6297 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1698 ( .I ({ \P7<11> , \P7<9> , syn1144 , 
    syn1145 }) , .O ( syn6296 ) );
    g_lut # ( 3 , 8'hfe, 0'h0 ) C1699 ( .I ({ syn6320 , syn6321 , syn6325 }) , 
    .O ( syn1507 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1700 ( .I ({ syn6316 , syn6317 , syn6318 , 
    syn6319 }) , .O ( syn6325 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1701 ( .I ({ \P6<5> , \P6<4> , syn1146 , 
    syn1147 }) , .O ( syn6319 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1702 ( .I ({ \P6<6> , \P6<2> , syn1148 , 
    syn1149 }) , .O ( syn6318 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1703 ( .I ({ \P6<10> , \P6<1> , syn1130 , 
    syn1133 }) , .O ( syn6317 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1704 ( .I ({ \P6<7> , \P6<3> , syn1134 , 
    syn1150 }) , .O ( syn6316 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1705 ( .I ({ \P6<8> , \P6<0> , syn1142 , 
    syn1143 }) , .O ( syn6321 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1706 ( .I ({ \P6<11> , \P6<9> , syn1144 , 
    syn1145 }) , .O ( syn6320 ) );
    g_lut # ( 3 , 8'hac, 0'h0 ) C1707 ( .I ({ \tb_reg<0> , syn1561 , syn1586 }) , 
    .O ( syn5743 ) );
    g_lut # ( 3 , 8'hfe, 0'h0 ) C1708 ( .I ({ syn6346 , syn6347 , syn6351 }) , 
    .O ( syn1586 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1709 ( .I ({ syn6342 , syn6343 , syn6344 , 
    syn6345 }) , .O ( syn6351 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1710 ( .I ({ \P3<5> , \P3<4> , syn1146 , 
    syn1147 }) , .O ( syn6345 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1711 ( .I ({ \P3<6> , \P3<2> , syn1148 , 
    syn1149 }) , .O ( syn6344 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1712 ( .I ({ \P3<10> , \P3<1> , syn1130 , 
    syn1133 }) , .O ( syn6343 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1713 ( .I ({ \P3<7> , \P3<3> , syn1134 , 
    syn1150 }) , .O ( syn6342 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1714 ( .I ({ \P3<8> , \P3<0> , syn1142 , 
    syn1143 }) , .O ( syn6347 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1715 ( .I ({ \P3<11> , \P3<9> , syn1144 , 
    syn1145 }) , .O ( syn6346 ) );
    g_lut # ( 3 , 8'hfe, 0'h0 ) C1716 ( .I ({ syn6370 , syn6371 , syn6375 }) , 
    .O ( syn1561 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1717 ( .I ({ syn6366 , syn6367 , syn6368 , 
    syn6369 }) , .O ( syn6375 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1718 ( .I ({ \P2<5> , \P2<4> , syn1146 , 
    syn1147 }) , .O ( syn6369 ) );
    g_lut # ( 4 , 16'h0002, 0'h0 ) C1719 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1147 ) );
    g_lut # ( 4 , 16'h0008, 0'h0 ) C1720 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1146 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1721 ( .I ({ \P2<6> , \P2<2> , syn1148 , 
    syn1149 }) , .O ( syn6368 ) );
    g_lut # ( 4 , 16'h0010, 0'h0 ) C1722 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1149 ) );
    g_lut # ( 4 , 16'h0020, 0'h0 ) C1723 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1148 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1724 ( .I ({ \P2<10> , \P2<1> , syn1130 , 
    syn1133 }) , .O ( syn6367 ) );
    g_lut # ( 4 , 16'h0004, 0'h0 ) C1725 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1133 ) );
    g_lut # ( 4 , 16'h1000, 0'h0 ) C1726 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1130 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1727 ( .I ({ \P2<7> , \P2<3> , syn1134 , 
    syn1150 }) , .O ( syn6366 ) );
    g_lut # ( 4 , 16'h0080, 0'h0 ) C1728 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1134 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1729 ( .I ({ \P2<8> , \P2<0> , syn1142 , 
    syn1143 }) , .O ( syn6371 ) );
    g_lut # ( 4 , 16'h0100, 0'h0 ) C1730 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1143 ) );
    g_lut # ( 4 , 16'h0001, 0'h0 ) C1731 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1142 ) );
    g_lut # ( 4 , 16'heca0, 0'h0 ) C1732 ( .I ({ \P2<11> , \P2<9> , syn1144 , 
    syn1145 }) , .O ( syn6370 ) );
    g_lut # ( 4 , 16'h0400, 0'h0 ) C1733 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1145 ) );
    g_lut # ( 4 , 16'h4000, 0'h0 ) C1734 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1144 ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C1735 ( .I ({ \min_state<1> , \tb_reg<2> , 
    syn1455 }) , .O ( \C12/N12 ) );
    g_lut # ( 2 , 4'he, 0'h0 ) C1736 ( .I ({ te , syn1455 }) , .O ( N1985 ) 
    );
    g_lut # ( 3 , 8'he4, 0'h0 ) C1737 ( .I ({ \min_state<0> , \tb_reg<1> , 
    syn1455 }) , .O ( \C12/N18 ) );
    g_lut # ( 4 , 16'h0200, 0'h0 ) C1738 ( .I ({ \NEXT_STATE<3> , \NEXT_STATE<0> , 
    \NEXT_STATE<1> , syn6252 }) , .O ( syn1455 ) );
    g_lut # ( 4 , 16'h0001, 0'h0 ) C1739 ( .I ({ \NEXT_STATE<5> , \NEXT_STATE<6> , 
    \NEXT_STATE<2> , \NEXT_STATE<4> }) , .O ( syn6252 ) );
    g_lut # ( 4 , 16'hdefc, 0'h0 ) C1740 ( .I ({ \write_ptr<2> , \write_ptr<3> , 
    \NEXT_STATE<4> , syn6154 }) , .O ( \C51/N22 ) );
    g_lut # ( 4 , 16'h1444, 0'h0 ) C1741 ( .I ({ \write_ptr<0> , \write_ptr<1> , 
    \write_ptr<2> , \NEXT_STATE<4> }) , .O ( \C51/N14 ) );
    g_lut # ( 3 , 8'hbe, 0'h0 ) C1742 ( .I ({ \write_ptr<0> , \write_ptr<1> , 
    \NEXT_STATE<4> }) , .O ( \C51/N11 ) );
    g_lut # ( 4 , 16'hfef0, 0'h0 ) C1743 ( .I ({ \NEXT_STATE<3> , \NEXT_STATE<4> , 
    syn1359 , syn4836 }) , .O ( \C52/N9 ) );
    g_lut # ( 2 , 4'hb, 0'h0 ) C1744 ( .I ({ \write_ptr<0> , \NEXT_STATE<4> }) , 
    .O ( \C51/N6 ) );
    g_lut # ( 3 , 8'h6f, 0'h0 ) C1745 ( .I ({ \NEXT_STATE<5> , \trace_ptr<3> , 
    syn1126 }) , .O ( \C1175/N22 ) );
    g_lut # ( 3 , 8'h01, 0'h0 ) C1746 ( .I ({ \trace_ptr<1> , \trace_ptr<0> , 
    \trace_ptr<2> }) , .O ( syn1126 ) );
    g_lut # ( 4 , 16'ha900, 0'h0 ) C1747 ( .I ({ \NEXT_STATE<5> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( \C1175/N16 ) );
    g_lut # ( 3 , 8'h9f, 0'h0 ) C1748 ( .I ({ \NEXT_STATE<5> , \trace_ptr<1> , 
    \trace_ptr<0> }) , .O ( \C1175/N11 ) );
    g_lut # ( 2 , 4'h7, 0'h0 ) C1749 ( .I ({ \NEXT_STATE<5> , \trace_ptr<0> }) , 
    .O ( \C1175/N6 ) );
    g_lut # ( 3 , 8'he0, 0'h0 ) C1750 ( .I ({ \NEXT_STATE<6> , \C1153/C8/C5 , 
    syn1385 }) , .O ( \C47/N5 ) );
    g_lut # ( 3 , 8'hea, 0'h0 ) C1751 ( .I ({ \NEXT_STATE<3> , syn4836 , 
    syn6213 }) , .O ( \C49/N29 ) );
    g_lut # ( 4 , 16'hf888, 0'h0 ) C1752 ( .I ({ seq_ready , \NEXT_STATE<0> , 
    \NEXT_STATE<6> , \C1153/C8/C5 }) , .O ( syn6213 ) );
    g_lut # ( 2 , 4'he, 0'h0 ) C1753 ( .I ({ \NEXT_STATE<4> , \C45/N5 }) , 
    .O ( \C49/N69 ) );
    g_lut # ( 3 , 8'he0, 0'h0 ) C1754 ( .I ({ \NEXT_STATE<5> , \trace_ptr<3> , 
    \trace_ptr<2> }) , .O ( \C45/N5 ) );
    g_lut # ( 2 , 4'h4, 0'h0 ) C1755 ( .I ({ \NEXT_STATE<5> , syn1352 }) , 
    .O ( \C49/N77 ) );
    g_lut # ( 4 , 16'hb3a0, 0'h0 ) C1756 ( .I ({ \NEXT_STATE<3> , syn1385 , 
    syn4836 , syn6191 }) , .O ( \C49/N59 ) );
    g_lut # ( 4 , 16'h1555, 0'h0 ) C1757 ( .I ({ \NEXT_STATE<5> , \trace_ptr<1> , 
    \trace_ptr<0> , syn1352 }) , .O ( syn4836 ) );
    g_lut # ( 2 , 4'he, 0'h0 ) C1758 ( .I ({ C694 , syn1375 }) , .O ( \C50/N9 ) 
    );
    g_lut # ( 4 , 16'h22f2, 0'h0 ) C1759 ( .I ({ seq_ready , \NEXT_STATE<0> , 
    syn1385 , syn6191 }) , .O ( \C49/N17 ) );
    g_lut # ( 2 , 4'h4, 0'h0 ) C1760 ( .I ({ \NEXT_STATE<6> , \C1153/C8/C5 }) , 
    .O ( syn6191 ) );
    g_lut # ( 2 , 4'h2, 0'h0 ) C1761 ( .I ({ \symbol_count<4> , syn1151 }) , 
    .O ( \C1153/C8/C5 ) );
    g_lut # ( 3 , 8'h02, 0'h0 ) C1762 ( .I ({ \symbol_count<2> , \symbol_count<3> , 
    syn1151 }) , .O ( syn1385 ) );
    g_lut # ( 4 , 16'h0001, 0'h0 ) C1763 ( .I ({ \symbol_count<5> , \symbol_count<6> , 
    \symbol_count<7> , \symbol_count<8> }) , .O ( syn1151 ) );
    g_lut # ( 4 , 16'hfeae, 0'h0 ) C1764 ( .I ({ seq_ready , \NEXT_STATE<0> , 
    C694 , syn1375 }) , .O ( \C44/N12 ) );
    g_lut # ( 4 , 16'hefaa, 0'h0 ) C1765 ( .I ({ \NEXT_STATE<3> , syn1352 , 
    syn1359 , syn1373 }) , .O ( syn1375 ) );
    g_lut # ( 3 , 8'he0, 0'h0 ) C1766 ( .I ({ \NEXT_STATE<5> , syn1150 , 
    syn1352 }) , .O ( syn1373 ) );
    g_lut # ( 4 , 16'h0040, 0'h0 ) C1767 ( .I ({ \trace_ptr<3> , \trace_ptr<1> , 
    \trace_ptr<0> , \trace_ptr<2> }) , .O ( syn1150 ) );
    g_lut # ( 4 , 16'h2000, 0'h0 ) C1768 ( .I ({ \write_ptr<0> , \write_ptr<1> , 
    \write_ptr<2> , \write_ptr<3> }) , .O ( syn1359 ) );
    g_lut # ( 4 , 16'heae0, 0'h0 ) C1769 ( .I ({ \write_ptr<3> , \NEXT_STATE<5> , 
    \trace_ptr<3> , \C1154/C8/C4 }) , .O ( syn1352 ) );
    g_lut # ( 4 , 16'hcfca, 0'h0 ) C1770 ( .I ({ \write_ptr<2> , \NEXT_STATE<5> , 
    \trace_ptr<2> , syn6154 }) , .O ( \C1154/C8/C4 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C1771 ( .I ({ \write_ptr<0> , \write_ptr<1> }) , 
    .O ( syn6154 ) );
    g_lut # ( 2 , 4'h1, 0'h0 ) C1772 ( .I ({ \NEXT_STATE<3> , \NEXT_STATE<5> }) , 
    .O ( C694 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1776 ( .I ({ A7_in [0] , \A7<0> , \C1165/C3/C5 }) , 
    .O ( A7_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1777 ( .I ({ A7_in [1] , \A7<1> , \C1165/C3/C5 }) , 
    .O ( A7_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1778 ( .I ({ A7_in [2] , \A7<2> , \C1165/C3/C5 }) , 
    .O ( A7_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1779 ( .I ({ A7_in [3] , \A7_Q1032<3> , 
    \C1165/C3/C5 }) , .O ( A7_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1780 ( .I ({ A6_in [0] , \A6<0> , \C1165/C3/C5 }) , 
    .O ( A6_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1781 ( .I ({ A6_in [1] , \A6<1> , \C1165/C3/C5 }) , 
    .O ( A6_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1782 ( .I ({ A6_in [2] , \A6<2> , \C1165/C3/C5 }) , 
    .O ( A6_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1783 ( .I ({ A6_in [3] , \A6_Q1023<3> , 
    \C1165/C3/C5 }) , .O ( A6_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1784 ( .I ({ A5_in [0] , \A5<0> , \C1165/C3/C5 }) , 
    .O ( A5_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1785 ( .I ({ A5_in [1] , \A5<1> , \C1165/C3/C5 }) , 
    .O ( A5_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1786 ( .I ({ A5_in [2] , \A5<2> , \C1165/C3/C5 }) , 
    .O ( A5_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1787 ( .I ({ A5_in [3] , \A5_Q1014<3> , 
    \C1165/C3/C5 }) , .O ( A5_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1788 ( .I ({ A4_in [0] , \A4<0> , \C1165/C3/C5 }) , 
    .O ( A4_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1789 ( .I ({ A4_in [1] , \A4<1> , \C1165/C3/C5 }) , 
    .O ( A4_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1790 ( .I ({ A4_in [2] , \A4<2> , \C1165/C3/C5 }) , 
    .O ( A4_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1791 ( .I ({ A4_in [3] , \A4_Q1005<3> , 
    \C1165/C3/C5 }) , .O ( A4_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1792 ( .I ({ A3_in [0] , \A3<0> , \C1165/C3/C5 }) , 
    .O ( A3_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1793 ( .I ({ A3_in [1] , \A3<1> , \C1165/C3/C5 }) , 
    .O ( A3_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1794 ( .I ({ A3_in [2] , \A3<2> , \C1165/C3/C5 }) , 
    .O ( A3_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1795 ( .I ({ A3_in [3] , \A3_Q996<3> , 
    \C1165/C3/C5 }) , .O ( A3_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1796 ( .I ({ A2_in [0] , \A2<0> , \C1165/C3/C5 }) , 
    .O ( A2_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1797 ( .I ({ A2_in [1] , \A2<1> , \C1165/C3/C5 }) , 
    .O ( A2_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1798 ( .I ({ A2_in [2] , \A2<2> , \C1165/C3/C5 }) , 
    .O ( A2_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1799 ( .I ({ A2_in [3] , \A2_Q987<3> , 
    \C1165/C3/C5 }) , .O ( A2_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1800 ( .I ({ A1_in [0] , \A1<0> , \C1165/C3/C5 }) , 
    .O ( A1_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1801 ( .I ({ A1_in [1] , \A1<1> , \C1165/C3/C5 }) , 
    .O ( A1_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1802 ( .I ({ A1_in [2] , \A1<2> , \C1165/C3/C5 }) , 
    .O ( A1_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1803 ( .I ({ A1_in [3] , \A1_Q978<3> , 
    \C1165/C3/C5 }) , .O ( A1_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1804 ( .I ({ A0_in [0] , \A0<0> , \C1165/C3/C5 }) , 
    .O ( A0_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1805 ( .I ({ A0_in [1] , \A0<1> , \C1165/C3/C5 }) , 
    .O ( A0_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1806 ( .I ({ A0_in [2] , \A0<2> , \C1165/C3/C5 }) , 
    .O ( A0_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1807 ( .I ({ A0_in [3] , \A0_Q969<3> , 
    \C1165/C3/C5 }) , .O ( A0_out [3] ) );
    g_lut # ( 4 , 16'h0001, 0'h0 ) C1808 ( .I ({ \write_ptr<0> , \write_ptr<1> , 
    \write_ptr<2> , \write_ptr<3> }) , .O ( \C1165/C3/C5 ) );
    VCC  C1810 ( .P ( \C1149/N0 ) );
    GND  C1811 ( .G ( \C1149/C3/N0 ) );

endmodule

module eVITERBI_213 ( Dx , oe , sync_error , Rx , seq_ready , clock , reset 
    );

    output Dx ;
    output oe ;
    output sync_error ;
    input [1:0] Rx ;
    input seq_ready ;
    input clock ;
    input reset ;
    
    wire \HD1<1> ;
    wire \HD1<0> ;
    wire \HD2<1> ;
    wire \HD2<0> ;
    wire \HD3<1> ;
    wire \HD3<0> ;
    wire \HD4<1> ;
    wire \HD4<0> ;
    wire \HD5<1> ;
    wire \HD5<0> ;
    wire \HD6<1> ;
    wire \HD6<0> ;
    wire \HD7<1> ;
    wire \HD7<0> ;
    wire \HD8<1> ;
    wire \HD8<0> ;
    wire \HD9<1> ;
    wire \HD9<0> ;
    wire \HD10<1> ;
    wire \HD10<0> ;
    wire \HD11<1> ;
    wire \HD11<0> ;
    wire \HD12<1> ;
    wire \HD12<0> ;
    wire \HD13<1> ;
    wire \HD13<0> ;
    wire \HD14<1> ;
    wire \HD14<0> ;
    wire \HD15<1> ;
    wire \HD15<0> ;
    wire \HD16<1> ;
    wire \HD16<0> ;
    wire le ;
    wire \acs0_ppm_out<3> ;
    wire \acs0_ppm_out<2> ;
    wire \acs0_ppm_out<1> ;
    wire \acs0_ppm_out<0> ;
    wire \acs1_ppm_out<3> ;
    wire \acs1_ppm_out<2> ;
    wire \acs1_ppm_out<1> ;
    wire \acs1_ppm_out<0> ;
    wire \acs2_ppm_out<3> ;
    wire \acs2_ppm_out<2> ;
    wire \acs2_ppm_out<1> ;
    wire \acs2_ppm_out<0> ;
    wire \acs3_ppm_out<3> ;
    wire \acs3_ppm_out<2> ;
    wire \acs3_ppm_out<1> ;
    wire \acs3_ppm_out<0> ;
    wire \acs4_ppm_out<3> ;
    wire \acs4_ppm_out<2> ;
    wire \acs4_ppm_out<1> ;
    wire \acs4_ppm_out<0> ;
    wire \acs5_ppm_out<3> ;
    wire \acs5_ppm_out<2> ;
    wire \acs5_ppm_out<1> ;
    wire \acs5_ppm_out<0> ;
    wire \acs6_ppm_out<3> ;
    wire \acs6_ppm_out<2> ;
    wire \acs6_ppm_out<1> ;
    wire \acs6_ppm_out<0> ;
    wire \acs7_ppm_out<3> ;
    wire \acs7_ppm_out<2> ;
    wire \acs7_ppm_out<1> ;
    wire \acs7_ppm_out<0> ;
    wire \acs0_Bx_out<0> ;
    wire \acs1_Bx_out<0> ;
    wire \acs2_Bx_out<0> ;
    wire \acs3_Bx_out<0> ;
    wire \acs4_Bx_out<0> ;
    wire \acs5_Bx_out<0> ;
    wire \acs6_Bx_out<0> ;
    wire \acs7_Bx_out<0> ;
    wire \A0_out<3> ;
    wire \A0_out<2> ;
    wire \A0_out<1> ;
    wire \A0_out<0> ;
    wire \A4_out<3> ;
    wire \A4_out<2> ;
    wire \A4_out<1> ;
    wire \A4_out<0> ;
    wire \A1_out<3> ;
    wire \A1_out<2> ;
    wire \A1_out<1> ;
    wire \A1_out<0> ;
    wire \A5_out<3> ;
    wire \A5_out<2> ;
    wire \A5_out<1> ;
    wire \A5_out<0> ;
    wire \A2_out<3> ;
    wire \A2_out<2> ;
    wire \A2_out<1> ;
    wire \A2_out<0> ;
    wire \A6_out<3> ;
    wire \A6_out<2> ;
    wire \A6_out<1> ;
    wire \A6_out<0> ;
    wire \A3_out<3> ;
    wire \A3_out<2> ;
    wire \A3_out<1> ;
    wire \A3_out<0> ;
    wire \A7_out<3> ;
    wire \A7_out<2> ;
    wire \A7_out<1> ;
    wire \A7_out<0> ;
    wire ae ;
    
    eBMU_213  U1 ( .HD9 ({ \HD9<1> , \HD9<0> }) , .HD10 ({ \HD10<1> , \HD10<0> 
        }) , .HD13 ({ \HD13<1> , \HD13<0> }) , .clock ( clock ) , .HD2 ({ 
        \HD2<1> , \HD2<0> }) , .HD12 ({ \HD12<1> , \HD12<0> }) , .HD5 ({ 
        \HD5<1> , \HD5<0> }) , .HD4 ({ \HD4<1> , \HD4<0> }) , .HD16 ({ 
        \HD16<1> , \HD16<0> }) , .HD11 ({ \HD11<1> , \HD11<0> }) , .reset ( 
        reset ) , .HD6 ({ \HD6<1> , \HD6<0> }) , .HD8 ({ \HD8<1> , \HD8<0> 
        }) , .le ( le ) , .HD7 ({ \HD7<1> , \HD7<0> }) , .HD1 ({ \HD1<1> 
        , \HD1<0> }) , .Rx ({ Rx [1] , Rx [0] }) , .HD3 ({ \HD3<1> , \HD3<0> 
        }) , .HD15 ({ \HD15<1> , \HD15<0> }) , .HD14 ({ \HD14<1> , \HD14<0> 
        }) );
    eACSU_213  U2 ( .HD0_inb ({ \HD9<1> , \HD9<0> }) , .acs1_ppm_out ({ 
        \acs1_ppm_out<3> , \acs1_ppm_out<2> , \acs1_ppm_out<1> , \acs1_ppm_out<0> 
        }) , .HD1_ina ({ \HD2<1> , \HD2<0> }) , .HD7_inb ({ \HD16<1> , 
        \HD16<0> }) , .acs4_ppm_inb ({ \A6_out<3> , \A6_out<2> , \A6_out<1> 
        , \A6_out<0> }) , .HD4_ina ({ \HD5<1> , \HD5<0> }) , .HD7_ina ({ 
        \HD8<1> , \HD8<0> }) , .acs2_ppm_out ({ \acs2_ppm_out<3> , \acs2_ppm_out<2> 
        , \acs2_ppm_out<1> , \acs2_ppm_out<0> }) , .HD3_inb ({ \HD12<1> 
        , \HD12<0> }) , .HD3_ina ({ \HD4<1> , \HD4<0> }) , .acs7_ppm_ina ({ 
        \A3_out<3> , \A3_out<2> , \A3_out<1> , \A3_out<0> }) , .HD2_ina ({ 
        \HD3<1> , \HD3<0> }) , .acs6_ppm_ina ({ \A3_out<3> , \A3_out<2> 
        , \A3_out<1> , \A3_out<0> }) , .acs6_ppm_out ({ \acs6_ppm_out<3> 
        , \acs6_ppm_out<2> , \acs6_ppm_out<1> , \acs6_ppm_out<0> }) , .acs5_ppm_inb ({ 
        \A6_out<3> , \A6_out<2> , \A6_out<1> , \A6_out<0> }) , .acs0_Bx_out ( 
        \acs0_Bx_out<0> ) , .HD1_inb ({ \HD10<1> , \HD10<0> }) , .acs5_ppm_ina ({ 
        \A2_out<3> , \A2_out<2> , \A2_out<1> , \A2_out<0> }) , .acs4_Bx_out ( 
        \acs4_Bx_out<0> ) , .acs3_Bx_out ( \acs3_Bx_out<0> ) , .ae ( ae 
        ) , .acs1_Bx_out ( \acs1_Bx_out<0> ) , .acs6_Bx_out ( \acs6_Bx_out<0> 
        ) , .acs7_Bx_out ( \acs7_Bx_out<0> ) , .HD5_inb ({ \HD14<1> , \HD14<0> 
        }) , .reset ( reset ) , .acs2_Bx_out ( \acs2_Bx_out<0> ) , .HD5_ina ({ 
        \HD6<1> , \HD6<0> }) , .HD4_inb ({ \HD13<1> , \HD13<0> }) , .acs2_ppm_ina ({ 
        \A1_out<3> , \A1_out<2> , \A1_out<1> , \A1_out<0> }) , .acs7_ppm_out ({ 
        \acs7_ppm_out<3> , \acs7_ppm_out<2> , \acs7_ppm_out<1> , \acs7_ppm_out<0> 
        }) , .acs5_ppm_out ({ \acs5_ppm_out<3> , \acs5_ppm_out<2> , \acs5_ppm_out<1> 
        , \acs5_ppm_out<0> }) , .acs3_ppm_ina ({ \A1_out<3> , \A1_out<2> 
        , \A1_out<1> , \A1_out<0> }) , .acs4_ppm_out ({ \acs4_ppm_out<3> 
        , \acs4_ppm_out<2> , \acs4_ppm_out<1> , \acs4_ppm_out<0> }) , .acs5_Bx_out ( 
        \acs5_Bx_out<0> ) , .acs6_ppm_inb ({ \A7_out<3> , \A7_out<2> , 
        \A7_out<1> , \A7_out<0> }) , .acs0_ppm_ina ({ \A0_out<3> , \A0_out<2> 
        , \A0_out<1> , \A0_out<0> }) , .HD2_inb ({ \HD11<1> , \HD11<0> 
        }) , .clock ( clock ) , .acs2_ppm_inb ({ \A5_out<3> , \A5_out<2> 
        , \A5_out<1> , \A5_out<0> }) , .acs1_ppm_inb ({ \A4_out<3> , \A4_out<2> 
        , \A4_out<1> , \A4_out<0> }) , .HD6_ina ({ \HD7<1> , \HD7<0> }) 
        , .acs0_ppm_inb ({ \A4_out<3> , \A4_out<2> , \A4_out<1> , \A4_out<0> 
        }) , .acs3_ppm_out ({ \acs3_ppm_out<3> , \acs3_ppm_out<2> , \acs3_ppm_out<1> 
        , \acs3_ppm_out<0> }) , .HD0_ina ({ \HD1<1> , \HD1<0> }) , .HD6_inb ({ 
        \HD15<1> , \HD15<0> }) , .acs4_ppm_ina ({ \A2_out<3> , \A2_out<2> 
        , \A2_out<1> , \A2_out<0> }) , .acs3_ppm_inb ({ \A5_out<3> , \A5_out<2> 
        , \A5_out<1> , \A5_out<0> }) , .acs1_ppm_ina ({ \A0_out<3> , \A0_out<2> 
        , \A0_out<1> , \A0_out<0> }) , .acs0_ppm_out ({ \acs0_ppm_out<3> 
        , \acs0_ppm_out<2> , \acs0_ppm_out<1> , \acs0_ppm_out<0> }) , .acs7_ppm_inb ({ 
        \A7_out<3> , \A7_out<2> , \A7_out<1> , \A7_out<0> }) );
    eCONTROL_213  U3 ( .P7_in ( \acs7_Bx_out<0> ) , .A0_out ({ \A0_out<3> 
        , \A0_out<2> , \A0_out<1> , \A0_out<0> }) , .reset ( reset ) , 
        .oe ( oe ) , .A6_in ({ \acs6_ppm_out<3> , \acs6_ppm_out<2> , \acs6_ppm_out<1> 
        , \acs6_ppm_out<0> }) , .A2_out ({ \A2_out<3> , \A2_out<2> , \A2_out<1> 
        , \A2_out<0> }) , .A3_in ({ \acs3_ppm_out<3> , \acs3_ppm_out<2> 
        , \acs3_ppm_out<1> , \acs3_ppm_out<0> }) , .le ( le ) , .A3_out ({ 
        \A3_out<3> , \A3_out<2> , \A3_out<1> , \A3_out<0> }) , .P4_in ( 
        \acs4_Bx_out<0> ) , .clock ( clock ) , .A5_out ({ \A5_out<3> , 
        \A5_out<2> , \A5_out<1> , \A5_out<0> }) , .sync_error ( sync_error 
        ) , .P1_in ( \acs1_Bx_out<0> ) , .A0_in ({ \acs0_ppm_out<3> , \acs0_ppm_out<2> 
        , \acs0_ppm_out<1> , \acs0_ppm_out<0> }) , .P6_in ( \acs6_Bx_out<0> 
        ) , .ae ( ae ) , .Dx ( Dx ) , .A5_in ({ \acs5_ppm_out<3> , \acs5_ppm_out<2> 
        , \acs5_ppm_out<1> , \acs5_ppm_out<0> }) , .A7_out ({ \A7_out<3> 
        , \A7_out<2> , \A7_out<1> , \A7_out<0> }) , .A4_in ({ \acs4_ppm_out<3> 
        , \acs4_ppm_out<2> , \acs4_ppm_out<1> , \acs4_ppm_out<0> }) , .P2_in ( 
        \acs2_Bx_out<0> ) , .P0_in ( \acs0_Bx_out<0> ) , .A1_in ({ \acs1_ppm_out<3> 
        , \acs1_ppm_out<2> , \acs1_ppm_out<1> , \acs1_ppm_out<0> }) , .P5_in ( 
        \acs5_Bx_out<0> ) , .A1_out ({ \A1_out<3> , \A1_out<2> , \A1_out<1> 
        , \A1_out<0> }) , .A2_in ({ \acs2_ppm_out<3> , \acs2_ppm_out<2> 
        , \acs2_ppm_out<1> , \acs2_ppm_out<0> }) , .A7_in ({ \acs7_ppm_out<3> 
        , \acs7_ppm_out<2> , \acs7_ppm_out<1> , \acs7_ppm_out<0> }) , .A4_out ({ 
        \A4_out<3> , \A4_out<2> , \A4_out<1> , \A4_out<0> }) , .A6_out ({ 
        \A6_out<3> , \A6_out<2> , \A6_out<1> , \A6_out<0> }) , .P3_in ( 
        \acs3_Bx_out<0> ) , .seq_ready ( seq_ready ) );

endmodule
