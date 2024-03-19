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

module bBMU_213 ( HD1 , HD2 , HD3 , HD4 , HD5 , HD6 , HD7 , HD8 , HD9 , 
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
    
    FDCE  \HD16_reg<0> ( .CE ( le ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        N38 ) , .Q ( HD16 [0] ) );
    FDCE  \HD16_reg<1> ( .CLR ( reset ) , .C ( clock ) , .Q ( HD16 [1] ) 
        , .CE ( le ) , .D ( N129 ) );
    FDCE  \HD15_reg<0> ( .CE ( le ) , .C ( clock ) , .Q ( HD15 [0] ) , 
        .CLR ( reset ) , .D ( N38 ) );
    FDCE  \HD15_reg<1> ( .CE ( le ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        N128 ) , .Q ( HD15 [1] ) );
    FDCE  \HD14_reg<0> ( .CLR ( reset ) , .D ( N33 ) , .Q ( HD14 [0] ) 
        , .CE ( le ) , .C ( clock ) );
    FDCE  \HD14_reg<1> ( .CLR ( reset ) , .D ( N133 ) , .CE ( le ) , .C ( 
        clock ) , .Q ( HD14 [1] ) );
    FDCE  \HD13_reg<0> ( .D ( N33 ) , .Q ( HD13 [0] ) , .CE ( le ) , .CLR ( 
        reset ) , .C ( clock ) );
    FDCE  \HD13_reg<1> ( .CLR ( reset ) , .C ( clock ) , .Q ( HD13 [1] ) 
        , .CE ( le ) , .D ( N132 ) );
    FDCE  \HD12_reg<0> ( .C ( clock ) , .Q ( HD12 [0] ) , .CE ( le ) , 
        .CLR ( reset ) , .D ( N38 ) );
    FDCE  \HD12_reg<1> ( .CLR ( reset ) , .D ( N128 ) , .Q ( HD12 [1] ) 
        , .CE ( le ) , .C ( clock ) );
    FDCE  \HD11_reg<0> ( .D ( N38 ) , .Q ( HD11 [0] ) , .CE ( le ) , .CLR ( 
        reset ) , .C ( clock ) );
    FDCE  \HD11_reg<1> ( .CE ( le ) , .D ( N129 ) , .Q ( HD11 [1] ) , .CLR ( 
        reset ) , .C ( clock ) );
    FDCE  \HD10_reg<0> ( .CE ( le ) , .CLR ( reset ) , .D ( N33 ) , .Q ( 
        HD10 [0] ) , .C ( clock ) );
    FDCE  \HD10_reg<1> ( .CE ( le ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        N132 ) , .Q ( HD10 [1] ) );
    FDCE  \HD9_reg<0> ( .CE ( le ) , .CLR ( reset ) , .D ( N33 ) , .C ( 
        clock ) , .Q ( HD9 [0] ) );
    FDCE  \HD9_reg<1> ( .CLR ( reset ) , .D ( N133 ) , .Q ( HD9 [1] ) , 
        .CE ( le ) , .C ( clock ) );
    FDCE  \HD8_reg<0> ( .Q ( HD8 [0] ) , .CE ( le ) , .CLR ( reset ) , 
        .C ( clock ) , .D ( N38 ) );
    FDCE  \HD8_reg<1> ( .CLR ( reset ) , .C ( clock ) , .CE ( le ) , .D ( 
        N128 ) , .Q ( HD8 [1] ) );
    FDCE  \HD7_reg<0> ( .CLR ( reset ) , .C ( clock ) , .Q ( HD7 [0] ) 
        , .CE ( le ) , .D ( N38 ) );
    FDCE  \HD7_reg<1> ( .CE ( le ) , .C ( clock ) , .D ( N129 ) , .CLR ( 
        reset ) , .Q ( HD7 [1] ) );
    FDCE  \HD6_reg<0> ( .CE ( le ) , .D ( N33 ) , .Q ( HD6 [0] ) , .CLR ( 
        reset ) , .C ( clock ) );
    FDCE  \HD6_reg<1> ( .CE ( le ) , .C ( clock ) , .D ( N132 ) , .Q ( 
        HD6 [1] ) , .CLR ( reset ) );
    FDCE  \HD5_reg<0> ( .D ( N33 ) , .CE ( le ) , .CLR ( reset ) , .C ( 
        clock ) , .Q ( HD5 [0] ) );
    FDCE  \HD5_reg<1> ( .CE ( le ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        N133 ) , .Q ( HD5 [1] ) );
    FDCE  \HD4_reg<0> ( .CLR ( reset ) , .D ( N38 ) , .CE ( le ) , .C ( 
        clock ) , .Q ( HD4 [0] ) );
    FDCE  \HD4_reg<1> ( .CLR ( reset ) , .CE ( le ) , .C ( clock ) , .D ( 
        N129 ) , .Q ( HD4 [1] ) );
    FDCE  \HD3_reg<0> ( .CE ( le ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        N38 ) , .Q ( HD3 [0] ) );
    FDCE  \HD3_reg<1> ( .CLR ( reset ) , .C ( clock ) , .Q ( HD3 [1] ) 
        , .CE ( le ) , .D ( N128 ) );
    FDCE  \HD2_reg<0> ( .CE ( le ) , .CLR ( reset ) , .D ( N33 ) , .C ( 
        clock ) , .Q ( HD2 [0] ) );
    FDCE  \HD2_reg<1> ( .CE ( le ) , .D ( N133 ) , .CLR ( reset ) , .C ( 
        clock ) , .Q ( HD2 [1] ) );
    FDCE  \HD1_reg<0> ( .C ( clock ) , .CE ( le ) , .CLR ( reset ) , .D ( 
        N33 ) , .Q ( HD1 [0] ) );
    FDCE  \HD1_reg<1> ( .CE ( le ) , .Q ( HD1 [1] ) , .CLR ( reset ) , 
        .C ( clock ) , .D ( N132 ) );
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

module bACS_213_0 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
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
    
    FDCE  \sumb_reg<0> ( .CE ( ae ) , .CLR ( reset ) , .D ( \C6/N6 ) , 
        .C ( clock ) , .Q ( \sumb<0> ) );
    FDCE  \sumb_reg<1> ( .CLR ( reset ) , .Q ( \sumb<1> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C6/N12 ) );
    FDCE  \sumb_reg<2> ( .CLR ( reset ) , .D ( \C6/N18 ) , .Q ( \sumb<2> ) 
        , .CE ( ae ) , .C ( clock ) );
    FDCE  \sumb_reg<3> ( .CLR ( reset ) , .Q ( \sumb<3> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C6/N24 ) );
    FDCE  \suma_reg<0> ( .CE ( ae ) , .C ( clock ) , .Q ( \suma<0> ) , 
        .CLR ( reset ) , .D ( \C5/N6 ) );
    FDCE  \suma_reg<1> ( .C ( clock ) , .Q ( \suma<1> ) , .CE ( ae ) , 
        .CLR ( reset ) , .D ( \C5/N12 ) );
    FDCE  \suma_reg<2> ( .CLR ( reset ) , .C ( clock ) , .Q ( \suma<2> ) 
        , .CE ( ae ) , .D ( \C5/N18 ) );
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

module bACS_213_1 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
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
    
    FDCE  \sumb_reg<0> ( .CLR ( reset ) , .D ( \C6/N6 ) , .Q ( \sumb<0> ) 
        , .CE ( ae ) , .C ( clock ) );
    FDCE  \sumb_reg<1> ( .C ( clock ) , .Q ( \sumb<1> ) , .CE ( ae ) , 
        .CLR ( reset ) , .D ( \C6/N12 ) );
    FDCE  \sumb_reg<2> ( .CLR ( reset ) , .C ( clock ) , .Q ( \sumb<2> ) 
        , .CE ( ae ) , .D ( \C6/N18 ) );
    FDCE  \sumb_reg<3> ( .CLR ( reset ) , .D ( \C6/N24 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \sumb<3> ) );
    FDCE  \suma_reg<0> ( .CE ( ae ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \C5/N6 ) , .Q ( \suma<0> ) );
    FDCE  \suma_reg<1> ( .CE ( ae ) , .C ( clock ) , .Q ( \suma<1> ) , 
        .CLR ( reset ) , .D ( \C5/N12 ) );
    FDCE  \suma_reg<2> ( .CE ( ae ) , .C ( clock ) , .Q ( \suma<2> ) , 
        .CLR ( reset ) , .D ( \C5/N18 ) );
    FDCE  \suma_reg<3> ( .C ( clock ) , .Q ( \suma<3> ) , .CE ( ae ) , 
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

module bACS_213_2 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
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
    FDCE  \sumb_reg<1> ( .CLR ( reset ) , .D ( \C6/N12 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \sumb<1> ) );
    FDCE  \sumb_reg<2> ( .CLR ( reset ) , .D ( \C6/N18 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \sumb<2> ) );
    FDCE  \sumb_reg<3> ( .CE ( ae ) , .CLR ( reset ) , .D ( \C6/N24 ) , 
        .C ( clock ) , .Q ( \sumb<3> ) );
    FDCE  \suma_reg<0> ( .CE ( ae ) , .CLR ( reset ) , .C ( clock ) , .Q ( 
        \suma<0> ) , .D ( \C5/N6 ) );
    FDCE  \suma_reg<1> ( .CLR ( reset ) , .Q ( \suma<1> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C5/N12 ) );
    FDCE  \suma_reg<2> ( .CLR ( reset ) , .D ( \C5/N18 ) , .Q ( \suma<2> ) 
        , .CE ( ae ) , .C ( clock ) );
    FDCE  \suma_reg<3> ( .CLR ( reset ) , .D ( \C5/N24 ) , .CE ( ae ) , 
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

module bACS_213_3 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
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
    
    FDCE  \sumb_reg<0> ( .CLR ( reset ) , .D ( \C6/N6 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \sumb<0> ) );
    FDCE  \sumb_reg<1> ( .CLR ( reset ) , .Q ( \sumb<1> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C6/N12 ) );
    FDCE  \sumb_reg<2> ( .CLR ( reset ) , .D ( \C6/N18 ) , .Q ( \sumb<2> ) 
        , .CE ( ae ) , .C ( clock ) );
    FDCE  \sumb_reg<3> ( .CLR ( reset ) , .D ( \C6/N24 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \sumb<3> ) );
    FDCE  \suma_reg<0> ( .CE ( ae ) , .C ( clock ) , .Q ( \suma<0> ) , 
        .CLR ( reset ) , .D ( \C5/N6 ) );
    FDCE  \suma_reg<1> ( .C ( clock ) , .Q ( \suma<1> ) , .CE ( ae ) , 
        .CLR ( reset ) , .D ( \C5/N12 ) );
    FDCE  \suma_reg<2> ( .CLR ( reset ) , .C ( clock ) , .Q ( \suma<2> ) 
        , .CE ( ae ) , .D ( \C5/N18 ) );
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

module bACS_213_4 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
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
    
    FDCE  \sumb_reg<0> ( .CLR ( reset ) , .D ( \C6/N6 ) , .Q ( \sumb<0> ) 
        , .CE ( ae ) , .C ( clock ) );
    FDCE  \sumb_reg<1> ( .CLR ( reset ) , .D ( \C6/N12 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \sumb<1> ) );
    FDCE  \sumb_reg<2> ( .CLR ( reset ) , .D ( \C6/N18 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \sumb<2> ) );
    FDCE  \sumb_reg<3> ( .CE ( ae ) , .D ( \C6/N24 ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \sumb<3> ) );
    FDCE  \suma_reg<0> ( .CLR ( reset ) , .Q ( \suma<0> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C5/N6 ) );
    FDCE  \suma_reg<1> ( .CE ( ae ) , .D ( \C5/N12 ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \suma<1> ) );
    FDCE  \suma_reg<2> ( .CLR ( reset ) , .D ( \C5/N18 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \suma<2> ) );
    FDCE  \suma_reg<3> ( .CE ( ae ) , .CLR ( reset ) , .C ( clock ) , .D ( 
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

module bACS_213_5 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
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
    
    FDCE  \sumb_reg<0> ( .D ( \C6/N6 ) , .CE ( ae ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \sumb<0> ) );
    FDCE  \sumb_reg<1> ( .CE ( ae ) , .CLR ( reset ) , .C ( clock ) , .Q ( 
        \sumb<1> ) , .D ( \C6/N12 ) );
    FDCE  \sumb_reg<2> ( .CLR ( reset ) , .CE ( ae ) , .C ( clock ) , .D ( 
        \C6/N18 ) , .Q ( \sumb<2> ) );
    FDCE  \sumb_reg<3> ( .CLR ( reset ) , .D ( \C6/N24 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \sumb<3> ) );
    FDCE  \suma_reg<0> ( .CLR ( reset ) , .C ( clock ) , .D ( \C5/N6 ) 
        , .CE ( ae ) , .Q ( \suma<0> ) );
    FDCE  \suma_reg<1> ( .CLR ( reset ) , .C ( clock ) , .D ( \C5/N12 ) 
        , .CE ( ae ) , .Q ( \suma<1> ) );
    FDCE  \suma_reg<2> ( .C ( clock ) , .D ( \C5/N18 ) , .CE ( ae ) , .CLR ( 
        reset ) , .Q ( \suma<2> ) );
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

module bACS_213_6 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
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
    
    FDCE  \sumb_reg<0> ( .CLR ( reset ) , .D ( \C6/N6 ) , .CE ( ae ) , 
        .C ( clock ) , .Q ( \sumb<0> ) );
    FDCE  \sumb_reg<1> ( .CE ( ae ) , .CLR ( reset ) , .Q ( \sumb<1> ) 
        , .C ( clock ) , .D ( \C6/N12 ) );
    FDCE  \sumb_reg<2> ( .CE ( ae ) , .C ( clock ) , .Q ( \sumb<2> ) , 
        .CLR ( reset ) , .D ( \C6/N18 ) );
    FDCE  \sumb_reg<3> ( .CLR ( reset ) , .Q ( \sumb<3> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C6/N24 ) );
    FDCE  \suma_reg<0> ( .CE ( ae ) , .C ( clock ) , .D ( \C5/N6 ) , .CLR ( 
        reset ) , .Q ( \suma<0> ) );
    FDCE  \suma_reg<1> ( .CE ( ae ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \C5/N12 ) , .Q ( \suma<1> ) );
    FDCE  \suma_reg<2> ( .CE ( ae ) , .CLR ( reset ) , .Q ( \suma<2> ) 
        , .C ( clock ) , .D ( \C5/N18 ) );
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

module bACS_213 ( acs_ppm_out , acs_Bx_out , acs_ppm_ina , HD_ina , acs_ppm_inb 
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
    
    FDCE  \sumb_reg<0> ( .CLR ( reset ) , .Q ( \sumb<0> ) , .CE ( ae ) 
        , .C ( clock ) , .D ( \C67/N6 ) );
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

module bACSU_213 ( acs0_ppm_out , acs1_ppm_out , acs2_ppm_out , acs3_ppm_out 
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
    
    bACS_213_0  ACS0 ( .ae ( ae ) , .acs_ppm_inb ({ acs0_ppm_inb [3] , 
        acs0_ppm_inb [2] , acs0_ppm_inb [1] , acs0_ppm_inb [0] }) , .acs_ppm_ina ({ 
        acs0_ppm_ina [3] , acs0_ppm_ina [2] , acs0_ppm_ina [1] , acs0_ppm_ina [0] 
        }) , .clock ( clock ) , .reset ( reset ) , .acs_Bx_out ( acs0_Bx_out 
        ) , .HD_ina ({ HD0_ina [1] , HD0_ina [0] }) , .acs_ppm_out ({ acs0_ppm_out [3] 
        , acs0_ppm_out [2] , acs0_ppm_out [1] , acs0_ppm_out [0] }) , .HD_inb ({ 
        HD0_inb [1] , HD0_inb [0] }) );
    bACS_213_1  ACS1 ( .acs_ppm_out ({ acs1_ppm_out [3] , acs1_ppm_out [2] 
        , acs1_ppm_out [1] , acs1_ppm_out [0] }) , .acs_ppm_ina ({ acs1_ppm_ina [3] 
        , acs1_ppm_ina [2] , acs1_ppm_ina [1] , acs1_ppm_ina [0] }) , .acs_ppm_inb ({ 
        acs1_ppm_inb [3] , acs1_ppm_inb [2] , acs1_ppm_inb [1] , acs1_ppm_inb [0] 
        }) , .HD_inb ({ HD1_inb [1] , HD1_inb [0] }) , .HD_ina ({ HD1_ina [1] 
        , HD1_ina [0] }) , .reset ( reset ) , .clock ( clock ) , .acs_Bx_out ( 
        acs1_Bx_out ) , .ae ( ae ) );
    bACS_213_2  ACS6 ( .acs_ppm_ina ({ acs6_ppm_ina [3] , acs6_ppm_ina [2] 
        , acs6_ppm_ina [1] , acs6_ppm_ina [0] }) , .acs_ppm_inb ({ acs6_ppm_inb [3] 
        , acs6_ppm_inb [2] , acs6_ppm_inb [1] , acs6_ppm_inb [0] }) , .clock ( 
        clock ) , .ae ( ae ) , .acs_ppm_out ({ acs6_ppm_out [3] , acs6_ppm_out [2] 
        , acs6_ppm_out [1] , acs6_ppm_out [0] }) , .HD_inb ({ HD6_inb [1] 
        , HD6_inb [0] }) , .acs_Bx_out ( acs6_Bx_out ) , .reset ( reset 
        ) , .HD_ina ({ HD6_ina [1] , HD6_ina [0] }) );
    bACS_213_3  ACS2 ( .acs_ppm_out ({ acs2_ppm_out [3] , acs2_ppm_out [2] 
        , acs2_ppm_out [1] , acs2_ppm_out [0] }) , .clock ( clock ) , .acs_ppm_ina ({ 
        acs2_ppm_ina [3] , acs2_ppm_ina [2] , acs2_ppm_ina [1] , acs2_ppm_ina [0] 
        }) , .HD_ina ({ HD2_ina [1] , HD2_ina [0] }) , .reset ( reset ) 
        , .acs_Bx_out ( acs2_Bx_out ) , .ae ( ae ) , .HD_inb ({ HD2_inb [1] 
        , HD2_inb [0] }) , .acs_ppm_inb ({ acs2_ppm_inb [3] , acs2_ppm_inb [2] 
        , acs2_ppm_inb [1] , acs2_ppm_inb [0] }) );
    bACS_213_4  ACS5 ( .acs_ppm_out ({ acs5_ppm_out [3] , acs5_ppm_out [2] 
        , acs5_ppm_out [1] , acs5_ppm_out [0] }) , .acs_ppm_ina ({ acs5_ppm_ina [3] 
        , acs5_ppm_ina [2] , acs5_ppm_ina [1] , acs5_ppm_ina [0] }) , .HD_inb ({ 
        HD5_inb [1] , HD5_inb [0] }) , .acs_ppm_inb ({ acs5_ppm_inb [3] 
        , acs5_ppm_inb [2] , acs5_ppm_inb [1] , acs5_ppm_inb [0] }) , .clock ( 
        clock ) , .HD_ina ({ HD5_ina [1] , HD5_ina [0] }) , .acs_Bx_out ( 
        acs5_Bx_out ) , .reset ( reset ) , .ae ( ae ) );
    bACS_213_5  ACS7 ( .acs_ppm_out ({ acs7_ppm_out [3] , acs7_ppm_out [2] 
        , acs7_ppm_out [1] , acs7_ppm_out [0] }) , .HD_inb ({ HD7_inb [1] 
        , HD7_inb [0] }) , .clock ( clock ) , .acs_ppm_ina ({ acs7_ppm_ina [3] 
        , acs7_ppm_ina [2] , acs7_ppm_ina [1] , acs7_ppm_ina [0] }) , .HD_ina ({ 
        HD7_ina [1] , HD7_ina [0] }) , .reset ( reset ) , .acs_Bx_out ( 
        acs7_Bx_out ) , .ae ( ae ) , .acs_ppm_inb ({ acs7_ppm_inb [3] , 
        acs7_ppm_inb [2] , acs7_ppm_inb [1] , acs7_ppm_inb [0] }) );
    bACS_213_6  ACS3 ( .clock ( clock ) , .acs_Bx_out ( acs3_Bx_out ) , 
        .acs_ppm_ina ({ acs3_ppm_ina [3] , acs3_ppm_ina [2] , acs3_ppm_ina [1] 
        , acs3_ppm_ina [0] }) , .HD_inb ({ HD3_inb [1] , HD3_inb [0] }) 
        , .HD_ina ({ HD3_ina [1] , HD3_ina [0] }) , .acs_ppm_out ({ acs3_ppm_out [3] 
        , acs3_ppm_out [2] , acs3_ppm_out [1] , acs3_ppm_out [0] }) , .acs_ppm_inb ({ 
        acs3_ppm_inb [3] , acs3_ppm_inb [2] , acs3_ppm_inb [1] , acs3_ppm_inb [0] 
        }) , .reset ( reset ) , .ae ( ae ) );
    bACS_213  ACS4 ( .HD_ina ({ HD4_ina [1] , HD4_ina [0] }) , .acs_Bx_out ( 
        acs4_Bx_out ) , .acs_ppm_out ({ acs4_ppm_out [3] , acs4_ppm_out [2] 
        , acs4_ppm_out [1] , acs4_ppm_out [0] }) , .HD_inb ({ HD4_inb [1] 
        , HD4_inb [0] }) , .reset ( reset ) , .ae ( ae ) , .acs_ppm_ina ({ 
        acs4_ppm_ina [3] , acs4_ppm_ina [2] , acs4_ppm_ina [1] , acs4_ppm_ina [0] 
        }) , .acs_ppm_inb ({ acs4_ppm_inb [3] , acs4_ppm_inb [2] , acs4_ppm_inb [1] 
        , acs4_ppm_inb [0] }) , .clock ( clock ) );

endmodule

module bTBDECISION_213 ( best_state , in0 , in1 , in2 , in3 , in4 , in5 
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

module bSYNCERR_213 ( error , stage , we , metric , reset , clock );

    output error ;
    input [3:0] stage ;
    input we ;
    input [2:0] metric ;
    input reset ;
    input clock ;
    
    wire N48 ;
    
    FDC  error_reg ( .D ( N48 ) , .CLR ( reset ) , .C ( clock ) , .Q ( 
        error ) );
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

module bCONTROL_213 ( Dx , oe , le , ae , sync_error , A0_out , A1_out 
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
    wire \trace_ptr<0> ;
    wire \tb_reg<0> ;
    wire \NEXT_STATE<2> ;
    wire \NEXT_STATE<4> ;
    wire \tb_reg<1> ;
    wire \tb_reg<2> ;
    wire \trace_ptr<2> ;
    wire \trace_ptr<3> ;
    wire \NEXT_STATE<3> ;
    wire \NEXT_STATE<0> ;
    wire \NEXT_STATE<1> ;
    wire \write_ptr<3> ;
    wire \P2<14> ;
    wire \P2<13> ;
    wire \P2<12> ;
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
    wire \P6<14> ;
    wire \P6<13> ;
    wire \P6<12> ;
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
    wire \trace_ptr<1> ;
    wire \NEXT_STATE<6> ;
    wire \write_ptr<2> ;
    wire te ;
    wire n488 ;
    wire \NEXT_STATE<5> ;
    wire \P4<14> ;
    wire \P4<13> ;
    wire \P4<12> ;
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
    wire \write_ptr<0> ;
    wire we ;
    wire \P0<14> ;
    wire \P0<13> ;
    wire \P0<12> ;
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
    wire \P1<14> ;
    wire \P1<13> ;
    wire \P1<12> ;
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
    wire \A2_Q788<3> ;
    wire \A2<2> ;
    wire \A2<1> ;
    wire \A2<0> ;
    wire \P5<14> ;
    wire \P5<13> ;
    wire \P5<12> ;
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
    wire \A0_Q770<3> ;
    wire \A0<2> ;
    wire \A0<1> ;
    wire \A0<0> ;
    wire \A6_Q824<3> ;
    wire \A6<2> ;
    wire \A6<1> ;
    wire \A6<0> ;
    wire \A1_Q779<3> ;
    wire \A1<2> ;
    wire \A1<1> ;
    wire \A1<0> ;
    wire \P3<14> ;
    wire \P3<13> ;
    wire \P3<12> ;
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
    wire \A5_Q815<3> ;
    wire \A5<2> ;
    wire \A5<1> ;
    wire \A5<0> ;
    wire \A3_Q797<3> ;
    wire \A3<2> ;
    wire \A3<1> ;
    wire \A3<0> ;
    wire \A7_Q833<3> ;
    wire \A7<2> ;
    wire \A7<1> ;
    wire \A7<0> ;
    wire \A4_Q806<3> ;
    wire \A4<2> ;
    wire \A4<1> ;
    wire \A4<0> ;
    wire \P7<14> ;
    wire \P7<13> ;
    wire \P7<12> ;
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
    wire \symbol_count<0> ;
    wire \symbol_count<1> ;
    wire \symbol_count<2> ;
    wire \symbol_count<3> ;
    wire \symbol_count<4> ;
    wire \symbol_count<5> ;
    wire \symbol_count<6> ;
    wire \symbol_count<7> ;
    wire \symbol_count<8> ;
    wire \C12/N6 ;
    wire \C12/N12 ;
    wire \C12/N18 ;
    wire \C43/N12 ;
    wire \C44/N5 ;
    wire \C46/N5 ;
    wire \C48/N17 ;
    wire \C48/N29 ;
    wire \C48/N59 ;
    wire \C48/N69 ;
    wire \C48/N77 ;
    wire \C49/N9 ;
    wire \C50/N3 ;
    wire \C50/N12 ;
    wire \C50/N17 ;
    wire \C50/N22 ;
    wire \C51/N9 ;
    wire N1467 ;
    wire N1468 ;
    wire N1469 ;
    wire N1470 ;
    wire N1471 ;
    wire N1472 ;
    wire N1473 ;
    wire N1474 ;
    wire N1475 ;
    wire \C1155/N0 ;
    wire \C1155/N3 ;
    wire \C1155/N6 ;
    wire \C1155/N9 ;
    wire \C1155/N12 ;
    wire \C1155/N15 ;
    wire \C1155/N18 ;
    wire \C1155/N21 ;
    wire \C1155/N24 ;
    wire \C1175/N5 ;
    wire \C1175/N12 ;
    wire \C1175/N17 ;
    wire \C1175/N22 ;
    wire \C1155/C3/N0 ;
    wire N1960 ;
    wire N1961 ;
    wire N1962 ;
    wire N1963 ;
    wire N1964 ;
    wire N1965 ;
    wire N1966 ;
    wire N1967 ;
    wire N1968 ;
    wire \C1169/C3/C5 ;
    wire syn1524 ;
    wire syn6099 ;
    wire syn6100 ;
    wire syn5927 ;
    wire syn5982 ;
    wire syn4881 ;
    wire syn4883 ;
    wire syn1732 ;
    wire syn4882 ;
    wire syn6672 ;
    wire syn6675 ;
    wire syn1222 ;
    wire syn1731 ;
    wire syn4765 ;
    wire \C1160/C3/C5 ;
    wire syn6651 ;
    wire syn6652 ;
    wire syn1248 ;
    wire syn1249 ;
    wire syn1217 ;
    wire syn6659 ;
    wire syn6660 ;
    wire syn1767 ;
    wire syn4880 ;
    wire syn6706 ;
    wire syn6709 ;
    wire syn1766 ;
    wire syn4767 ;
    wire syn6685 ;
    wire syn6686 ;
    wire syn6693 ;
    wire syn6694 ;
    wire syn4877 ;
    wire syn4879 ;
    wire syn1805 ;
    wire syn4878 ;
    wire syn6742 ;
    wire syn6745 ;
    wire syn1804 ;
    wire syn4769 ;
    wire syn6721 ;
    wire syn6722 ;
    wire syn6729 ;
    wire syn6730 ;
    wire syn1840 ;
    wire syn4876 ;
    wire syn6776 ;
    wire syn6779 ;
    wire syn1839 ;
    wire syn4771 ;
    wire syn6755 ;
    wire syn6756 ;
    wire syn6763 ;
    wire syn6764 ;
    wire syn6040 ;
    wire syn6095 ;
    wire syn4889 ;
    wire syn4891 ;
    wire syn1582 ;
    wire syn4890 ;
    wire syn6530 ;
    wire syn6533 ;
    wire syn1581 ;
    wire syn4757 ;
    wire syn6505 ;
    wire syn6506 ;
    wire syn6514 ;
    wire syn6515 ;
    wire syn1617 ;
    wire syn4888 ;
    wire syn6564 ;
    wire syn6567 ;
    wire syn1616 ;
    wire syn4759 ;
    wire syn6543 ;
    wire syn6544 ;
    wire syn6551 ;
    wire syn6552 ;
    wire syn4885 ;
    wire syn4887 ;
    wire syn1656 ;
    wire syn4886 ;
    wire syn6600 ;
    wire syn6603 ;
    wire syn1655 ;
    wire syn4761 ;
    wire syn6579 ;
    wire syn6580 ;
    wire syn6587 ;
    wire syn6588 ;
    wire syn1691 ;
    wire syn4884 ;
    wire syn6634 ;
    wire syn6637 ;
    wire syn1690 ;
    wire syn4763 ;
    wire syn6613 ;
    wire syn6614 ;
    wire syn6621 ;
    wire syn6622 ;
    wire syn6484 ;
    wire syn1503 ;
    wire syn1494 ;
    wire syn1219 ;
    wire syn1250 ;
    wire syn1447 ;
    wire syn6450 ;
    wire syn1459 ;
    wire C703 ;
    wire syn1432 ;
    wire syn6435 ;
    wire syn1446 ;
    wire syn1223 ;
    wire \SE_1stage<3> ;
    wire \SE_1stage<2> ;
    wire \SE_1stage<1> ;
    wire \SE_1stage<0> ;
    wire SE_1we ;
    wire \SE_1metric<2> ;
    wire \SE_1metric<1> ;
    wire \SE_1metric<0> ;
    
    bTBDECISION_213  TB_1 ( .in3 ({ A3_out [3] , A3_out [2] , A3_out [1] 
        , A3_out [0] }) , .in5 ({ A5_out [3] , A5_out [2] , A5_out [1] 
        , A5_out [0] }) , .in6 ({ A6_out [3] , A6_out [2] , A6_out [1] 
        , A6_out [0] }) , .in1 ({ A1_out [3] , A1_out [2] , A1_out [1] 
        , A1_out [0] }) , .in7 ({ A7_out [3] , A7_out [2] , A7_out [1] 
        , A7_out [0] }) , .in2 ({ A2_out [3] , A2_out [2] , A2_out [1] 
        , A2_out [0] }) , .in0 ({ A0_out [3] , A0_out [2] , A0_out [1] 
        , A0_out [0] }) , .in4 ({ A4_out [3] , A4_out [2] , A4_out [1] 
        , A4_out [0] }) , .best_state ({ \min_state<2> , \min_state<1> 
        , \min_state<0> }) );
    bSYNCERR_213  SE_1 ( .reset ( reset ) , .clock ( clock ) , .error ( 
        sync_error ) );
    XORCY  \C1155/C3/C0 ( .CI ( \C1155/N0 ) , .O ( N1467 ) , .LI ( \symbol_count<0> ) 
        );
    MUXCY_L  \C1155/C3/C1 ( .DI ( \C1155/C3/N0 ) , .CI ( \C1155/N0 ) , 
        .S ( \symbol_count<0> ) , .LO ( \C1155/N3 ) );
    XORCY  \C1155/C4/C0 ( .CI ( \C1155/N3 ) , .O ( N1468 ) , .LI ( \symbol_count<1> ) 
        );
    MUXCY_L  \C1155/C4/C1 ( .DI ( \C1155/C3/N0 ) , .CI ( \C1155/N3 ) , 
        .S ( \symbol_count<1> ) , .LO ( \C1155/N6 ) );
    XORCY  \C1155/C5/C0 ( .CI ( \C1155/N6 ) , .LI ( \symbol_count<2> ) 
        , .O ( N1469 ) );
    MUXCY_L  \C1155/C5/C1 ( .DI ( \C1155/C3/N0 ) , .CI ( \C1155/N6 ) , 
        .S ( \symbol_count<2> ) , .LO ( \C1155/N9 ) );
    XORCY  \C1155/C6/C0 ( .LI ( \symbol_count<3> ) , .CI ( \C1155/N9 ) 
        , .O ( N1470 ) );
    MUXCY_L  \C1155/C6/C1 ( .DI ( \C1155/C3/N0 ) , .LO ( \C1155/N12 ) , 
        .CI ( \C1155/N9 ) , .S ( \symbol_count<3> ) );
    XORCY  \C1155/C7/C0 ( .LI ( \symbol_count<4> ) , .CI ( \C1155/N12 ) 
        , .O ( N1471 ) );
    MUXCY_L  \C1155/C7/C1 ( .DI ( \C1155/C3/N0 ) , .LO ( \C1155/N15 ) , 
        .CI ( \C1155/N12 ) , .S ( \symbol_count<4> ) );
    XORCY  \C1155/C8/C0 ( .LI ( \symbol_count<5> ) , .CI ( \C1155/N15 ) 
        , .O ( N1472 ) );
    MUXCY_L  \C1155/C8/C1 ( .DI ( \C1155/C3/N0 ) , .LO ( \C1155/N18 ) , 
        .CI ( \C1155/N15 ) , .S ( \symbol_count<5> ) );
    XORCY  \C1155/C9/C0 ( .LI ( \symbol_count<6> ) , .CI ( \C1155/N18 ) 
        , .O ( N1473 ) );
    MUXCY_L  \C1155/C9/C1 ( .CI ( \C1155/N18 ) , .S ( \symbol_count<6> ) 
        , .LO ( \C1155/N21 ) , .DI ( \C1155/C3/N0 ) );
    XORCY  \C1155/C10/C0 ( .LI ( \symbol_count<7> ) , .CI ( \C1155/N21 ) 
        , .O ( N1474 ) );
    MUXCY_L  \C1155/C10/C1 ( .CI ( \C1155/N21 ) , .S ( \symbol_count<7> ) 
        , .LO ( \C1155/N24 ) , .DI ( \C1155/C3/N0 ) );
    XORCY  \C1155/C11/C0 ( .LI ( \symbol_count<8> ) , .CI ( \C1155/N24 ) 
        , .O ( N1475 ) );
    FDCE  we_reg ( .CE ( \C43/N12 ) , .C ( clock ) , .Q ( we ) , .CLR ( 
        reset ) , .D ( \NEXT_STATE<3> ) );
    FDPE  \NEXT_STATE_reg<0> ( .D ( \C48/N17 ) , .Q ( \NEXT_STATE<0> ) 
        , .CE ( \C49/N9 ) , .PRE ( reset ) , .C ( clock ) );
    FDCE  \NEXT_STATE_reg<4> ( .CE ( \C49/N9 ) , .CLR ( reset ) , .D ( 
        \C48/N59 ) , .C ( clock ) , .Q ( \NEXT_STATE<4> ) );
    FDCE  \NEXT_STATE_reg<6> ( .CE ( \C49/N9 ) , .CLR ( reset ) , .C ( 
        clock ) , .D ( \C48/N77 ) , .Q ( \NEXT_STATE<6> ) );
    FDCE  \NEXT_STATE_reg<2> ( .CE ( \C49/N9 ) , .Q ( \NEXT_STATE<2> ) 
        , .CLR ( reset ) , .C ( clock ) , .D ( \NEXT_STATE<1> ) );
    FDCE  le_reg ( .D ( \NEXT_STATE<1> ) , .Q ( le ) , .CE ( \C43/N12 ) 
        , .CLR ( reset ) , .C ( clock ) );
    FDCE  te_reg ( .CE ( \C43/N12 ) , .CLR ( reset ) , .C ( clock ) , .Q ( 
        te ) , .D ( \C44/N5 ) );
    FDCE  \NEXT_STATE_reg<3> ( .CLR ( reset ) , .CE ( \C49/N9 ) , .C ( 
        clock ) , .D ( \NEXT_STATE<2> ) , .Q ( \NEXT_STATE<3> ) );
    FDCE  \NEXT_STATE_reg<5> ( .CE ( \C49/N9 ) , .CLR ( reset ) , .D ( 
        \C48/N69 ) , .C ( clock ) , .Q ( \NEXT_STATE<5> ) );
    FDCE  \NEXT_STATE_reg<1> ( .CE ( \C49/N9 ) , .D ( \C48/N29 ) , .CLR ( 
        reset ) , .C ( clock ) , .Q ( \NEXT_STATE<1> ) );
    FDCE  ae_reg ( .CE ( \C43/N12 ) , .CLR ( reset ) , .D ( \NEXT_STATE<2> ) 
        , .C ( clock ) , .Q ( ae ) );
    FDCE  oe_reg ( .CLR ( reset ) , .D ( \C46/N5 ) , .CE ( \C43/N12 ) , 
        .C ( clock ) , .Q ( oe ) );
    FDCE  \symbol_count_reg<0> ( .CLR ( reset ) , .Q ( \symbol_count<0> ) 
        , .CE ( \C46/N5 ) , .C ( clock ) , .D ( N1467 ) );
    FDCE  \symbol_count_reg<1> ( .CLR ( reset ) , .D ( N1468 ) , .CE ( 
        \C46/N5 ) , .C ( clock ) , .Q ( \symbol_count<1> ) );
    FDCE  \symbol_count_reg<2> ( .C ( clock ) , .Q ( \symbol_count<2> ) 
        , .CE ( \C46/N5 ) , .CLR ( reset ) , .D ( N1469 ) );
    FDCE  \symbol_count_reg<3> ( .CE ( \C46/N5 ) , .D ( N1470 ) , .Q ( 
        \symbol_count<3> ) , .CLR ( reset ) , .C ( clock ) );
    FDCE  \symbol_count_reg<4> ( .CE ( \C46/N5 ) , .CLR ( reset ) , .Q ( 
        \symbol_count<4> ) , .C ( clock ) , .D ( N1471 ) );
    FDCE  \symbol_count_reg<5> ( .CE ( \C46/N5 ) , .D ( N1472 ) , .CLR ( 
        reset ) , .C ( clock ) , .Q ( \symbol_count<5> ) );
    FDCE  \symbol_count_reg<6> ( .C ( clock ) , .CE ( \C46/N5 ) , .CLR ( 
        reset ) , .D ( N1473 ) , .Q ( \symbol_count<6> ) );
    FDCE  \symbol_count_reg<7> ( .CLR ( reset ) , .C ( clock ) , .D ( N1474 ) 
        , .Q ( \symbol_count<7> ) , .CE ( \C46/N5 ) );
    FDCE  \symbol_count_reg<8> ( .C ( clock ) , .Q ( \symbol_count<8> ) 
        , .CE ( \C46/N5 ) , .CLR ( reset ) , .D ( N1475 ) );
    FDCE  \trace_ptr_reg<0> ( .CE ( \C48/N69 ) , .CLR ( reset ) , .D ( 
        \C1175/N5 ) , .C ( clock ) , .Q ( \trace_ptr<0> ) );
    FDCE  \trace_ptr_reg<1> ( .CE ( \C48/N69 ) , .C ( clock ) , .CLR ( 
        reset ) , .D ( \C1175/N12 ) , .Q ( \trace_ptr<1> ) );
    FDCE  \trace_ptr_reg<2> ( .C ( clock ) , .Q ( \trace_ptr<2> ) , .CE ( 
        \C48/N69 ) , .CLR ( reset ) , .D ( \C1175/N17 ) );
    FDCE  \trace_ptr_reg<3> ( .CE ( \C48/N69 ) , .CLR ( reset ) , .D ( 
        \C1175/N22 ) , .C ( clock ) , .Q ( \trace_ptr<3> ) );
    FDCE  \write_ptr_reg<0> ( .C ( clock ) , .Q ( \write_ptr<0> ) , .CE ( 
        \C51/N9 ) , .CLR ( reset ) , .D ( \C50/N3 ) );
    FDCE  \write_ptr_reg<1> ( .CE ( \C51/N9 ) , .CLR ( reset ) , .D ( \C50/N12 ) 
        , .C ( clock ) , .Q ( \write_ptr<1> ) );
    FDCE  \write_ptr_reg<2> ( .C ( clock ) , .Q ( \write_ptr<2> ) , .CE ( 
        \C51/N9 ) , .CLR ( reset ) , .D ( \C50/N17 ) );
    FDCE  \write_ptr_reg<3> ( .CLR ( reset ) , .C ( clock ) , .Q ( \write_ptr<3> ) 
        , .CE ( \C51/N9 ) , .D ( \C50/N22 ) );
    FDCE  \tb_reg_reg<0> ( .CE ( N1968 ) , .CLR ( reset ) , .D ( \C12/N18 ) 
        , .C ( clock ) , .Q ( \tb_reg<0> ) );
    FDCE  \tb_reg_reg<1> ( .C ( clock ) , .Q ( \tb_reg<1> ) , .CE ( N1968 ) 
        , .CLR ( reset ) , .D ( \C12/N12 ) );
    FDCE  \tb_reg_reg<2> ( .CLR ( reset ) , .C ( clock ) , .D ( \C12/N6 ) 
        , .Q ( \tb_reg<2> ) , .CE ( N1968 ) );
    FDPE  \A7_reg<0> ( .CE ( we ) , .PRE ( reset ) , .C ( clock ) , .D ( 
        A7_in [0] ) , .Q ( \A7<0> ) );
    FDPE  \A7_reg<1> ( .PRE ( reset ) , .C ( clock ) , .CE ( we ) , .D ( 
        A7_in [1] ) , .Q ( \A7<1> ) );
    FDPE  \A7_reg<2> ( .C ( clock ) , .D ( A7_in [2] ) , .CE ( we ) , .PRE ( 
        reset ) , .Q ( \A7<2> ) );
    FDPE  \A7_reg<3> ( .C ( clock ) , .D ( A7_in [3] ) , .Q ( \A7_Q833<3> ) 
        , .CE ( we ) , .PRE ( reset ) );
    FDPE  \A6_reg<0> ( .PRE ( reset ) , .D ( A6_in [0] ) , .CE ( we ) , 
        .C ( clock ) , .Q ( \A6<0> ) );
    FDPE  \A6_reg<1> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A6<1> ) , 
        .CE ( we ) , .D ( A6_in [1] ) );
    FDPE  \A6_reg<2> ( .CE ( we ) , .C ( clock ) , .Q ( \A6<2> ) , .PRE ( 
        reset ) , .D ( A6_in [2] ) );
    FDPE  \A6_reg<3> ( .CE ( we ) , .C ( clock ) , .PRE ( reset ) , .D ( 
        A6_in [3] ) , .Q ( \A6_Q824<3> ) );
    FDPE  \A5_reg<0> ( .PRE ( reset ) , .Q ( \A5<0> ) , .CE ( we ) , .C ( 
        clock ) , .D ( A5_in [0] ) );
    FDPE  \A5_reg<1> ( .C ( clock ) , .CE ( we ) , .PRE ( reset ) , .D ( 
        A5_in [1] ) , .Q ( \A5<1> ) );
    FDPE  \A5_reg<2> ( .D ( A5_in [2] ) , .Q ( \A5<2> ) , .CE ( we ) , 
        .PRE ( reset ) , .C ( clock ) );
    FDPE  \A5_reg<3> ( .CE ( we ) , .C ( clock ) , .Q ( \A5_Q815<3> ) , 
        .PRE ( reset ) , .D ( A5_in [3] ) );
    FDPE  \A4_reg<0> ( .CE ( we ) , .D ( A4_in [0] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A4<0> ) );
    FDPE  \A4_reg<1> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A4<1> ) , 
        .CE ( we ) , .D ( A4_in [1] ) );
    FDPE  \A4_reg<2> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A4<2> ) , 
        .CE ( we ) , .D ( A4_in [2] ) );
    FDPE  \A4_reg<3> ( .CE ( we ) , .D ( A4_in [3] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A4_Q806<3> ) );
    FDPE  \A3_reg<0> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A3<0> ) , 
        .CE ( we ) , .D ( A3_in [0] ) );
    FDPE  \A3_reg<1> ( .CE ( we ) , .D ( A3_in [1] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A3<1> ) );
    FDPE  \A3_reg<2> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A3<2> ) , 
        .CE ( we ) , .D ( A3_in [2] ) );
    FDPE  \A3_reg<3> ( .D ( A3_in [3] ) , .CE ( we ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A3_Q797<3> ) );
    FDPE  \A2_reg<0> ( .CE ( we ) , .D ( A2_in [0] ) , .PRE ( reset ) , 
        .C ( clock ) , .Q ( \A2<0> ) );
    FDPE  \A2_reg<1> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A2<1> ) , 
        .CE ( we ) , .D ( A2_in [1] ) );
    FDPE  \A2_reg<2> ( .CE ( we ) , .Q ( \A2<2> ) , .PRE ( reset ) , .C ( 
        clock ) , .D ( A2_in [2] ) );
    FDPE  \A2_reg<3> ( .PRE ( reset ) , .C ( clock ) , .Q ( \A2_Q788<3> ) 
        , .CE ( we ) , .D ( A2_in [3] ) );
    FDPE  \A1_reg<0> ( .C ( clock ) , .Q ( \A1<0> ) , .CE ( we ) , .PRE ( 
        reset ) , .D ( A1_in [0] ) );
    FDPE  \A1_reg<1> ( .CE ( we ) , .C ( clock ) , .Q ( \A1<1> ) , .PRE ( 
        reset ) , .D ( A1_in [1] ) );
    FDPE  \A1_reg<2> ( .PRE ( reset ) , .D ( A1_in [2] ) , .Q ( \A1<2> ) 
        , .CE ( we ) , .C ( clock ) );
    FDPE  \A1_reg<3> ( .Q ( \A1_Q779<3> ) , .CE ( we ) , .PRE ( reset ) 
        , .C ( clock ) , .D ( A1_in [3] ) );
    FDCE  \A0_reg<0> ( .CE ( we ) , .C ( clock ) , .Q ( \A0<0> ) , .CLR ( 
        reset ) , .D ( A0_in [0] ) );
    FDCE  \A0_reg<1> ( .Q ( \A0<1> ) , .CE ( we ) , .CLR ( reset ) , .C ( 
        clock ) , .D ( A0_in [1] ) );
    FDCE  \A0_reg<2> ( .CE ( we ) , .C ( clock ) , .Q ( \A0<2> ) , .CLR ( 
        reset ) , .D ( A0_in [2] ) );
    FDCE  \A0_reg<3> ( .CE ( we ) , .CLR ( reset ) , .C ( clock ) , .Q ( 
        \A0_Q770<3> ) , .D ( A0_in [3] ) );
    FDCE  \P7_reg<0> ( .CLR ( reset ) , .C ( clock ) , .CE ( n488 ) , .D ( 
        \P7<1> ) , .Q ( \P7<0> ) );
    FDCE  \P7_reg<1> ( .CE ( n488 ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \P7<2> ) , .Q ( \P7<1> ) );
    FDCE  \P7_reg<2> ( .CE ( n488 ) , .C ( clock ) , .Q ( \P7<2> ) , .CLR ( 
        reset ) , .D ( \P7<3> ) );
    FDCE  \P7_reg<3> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P7<4> ) , 
        .C ( clock ) , .Q ( \P7<3> ) );
    FDCE  \P7_reg<4> ( .C ( clock ) , .Q ( \P7<4> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P7<5> ) );
    FDCE  \P7_reg<5> ( .CLR ( reset ) , .C ( clock ) , .Q ( \P7<5> ) , 
        .CE ( n488 ) , .D ( \P7<6> ) );
    FDCE  \P7_reg<6> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P7<7> ) , 
        .C ( clock ) , .Q ( \P7<6> ) );
    FDCE  \P7_reg<7> ( .C ( clock ) , .Q ( \P7<7> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P7<8> ) );
    FDCE  \P7_reg<8> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P7<9> ) , 
        .C ( clock ) , .Q ( \P7<8> ) );
    FDCE  \P7_reg<9> ( .C ( clock ) , .Q ( \P7<9> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P7<10> ) );
    FDCE  \P7_reg<10> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P7<11> ) 
        , .C ( clock ) , .Q ( \P7<10> ) );
    FDCE  \P7_reg<11> ( .CE ( n488 ) , .D ( \P7<12> ) , .CLR ( reset ) 
        , .C ( clock ) , .Q ( \P7<11> ) );
    FDCE  \P7_reg<12> ( .C ( clock ) , .Q ( \P7<12> ) , .CE ( n488 ) , 
        .CLR ( reset ) , .D ( \P7<13> ) );
    FDCE  \P7_reg<13> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P7<14> ) 
        , .C ( clock ) , .Q ( \P7<13> ) );
    FDCE  \P7_reg<14> ( .C ( clock ) , .D ( N1965 ) , .CE ( n488 ) , .CLR ( 
        reset ) , .Q ( \P7<14> ) );
    FDCE  \P6_reg<0> ( .CE ( n488 ) , .CLR ( reset ) , .C ( clock ) , .Q ( 
        \P6<0> ) , .D ( \P6<1> ) );
    FDCE  \P6_reg<1> ( .Q ( \P6<1> ) , .CE ( n488 ) , .CLR ( reset ) , 
        .C ( clock ) , .D ( \P6<2> ) );
    FDCE  \P6_reg<2> ( .CLR ( reset ) , .C ( clock ) , .D ( \P6<3> ) , 
        .Q ( \P6<2> ) , .CE ( n488 ) );
    FDCE  \P6_reg<3> ( .CE ( n488 ) , .D ( \P6<4> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P6<3> ) );
    FDCE  \P6_reg<4> ( .D ( \P6<5> ) , .Q ( \P6<4> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .C ( clock ) );
    FDCE  \P6_reg<5> ( .CE ( n488 ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \P6<6> ) , .Q ( \P6<5> ) );
    FDCE  \P6_reg<6> ( .CE ( n488 ) , .C ( clock ) , .D ( \P6<7> ) , .CLR ( 
        reset ) , .Q ( \P6<6> ) );
    FDCE  \P6_reg<7> ( .CLR ( reset ) , .D ( \P6<8> ) , .CE ( n488 ) , 
        .C ( clock ) , .Q ( \P6<7> ) );
    FDCE  \P6_reg<8> ( .C ( clock ) , .Q ( \P6<8> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P6<9> ) );
    FDCE  \P6_reg<9> ( .CLR ( reset ) , .Q ( \P6<9> ) , .CE ( n488 ) , 
        .C ( clock ) , .D ( \P6<10> ) );
    FDCE  \P6_reg<10> ( .CLR ( reset ) , .Q ( \P6<10> ) , .CE ( n488 ) 
        , .C ( clock ) , .D ( \P6<11> ) );
    FDCE  \P6_reg<11> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P6<12> ) 
        , .C ( clock ) , .Q ( \P6<11> ) );
    FDCE  \P6_reg<12> ( .C ( clock ) , .Q ( \P6<12> ) , .CE ( n488 ) , 
        .CLR ( reset ) , .D ( \P6<13> ) );
    FDCE  \P6_reg<13> ( .CLR ( reset ) , .C ( clock ) , .Q ( \P6<13> ) 
        , .CE ( n488 ) , .D ( \P6<14> ) );
    FDCE  \P6_reg<14> ( .CE ( n488 ) , .CLR ( reset ) , .D ( N1962 ) , 
        .C ( clock ) , .Q ( \P6<14> ) );
    FDCE  \P5_reg<0> ( .C ( clock ) , .Q ( \P5<0> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P5<1> ) );
    FDCE  \P5_reg<1> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P5<2> ) , 
        .C ( clock ) , .Q ( \P5<1> ) );
    FDCE  \P5_reg<2> ( .C ( clock ) , .Q ( \P5<2> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P5<3> ) );
    FDCE  \P5_reg<3> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P5<4> ) , 
        .C ( clock ) , .Q ( \P5<3> ) );
    FDCE  \P5_reg<4> ( .CE ( n488 ) , .D ( \P5<5> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P5<4> ) );
    FDCE  \P5_reg<5> ( .C ( clock ) , .Q ( \P5<5> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P5<6> ) );
    FDCE  \P5_reg<6> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P5<7> ) , 
        .C ( clock ) , .Q ( \P5<6> ) );
    FDCE  \P5_reg<7> ( .CE ( n488 ) , .D ( \P5<8> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P5<7> ) );
    FDCE  \P5_reg<8> ( .CLR ( reset ) , .D ( \P5<9> ) , .Q ( \P5<8> ) , 
        .CE ( n488 ) , .C ( clock ) );
    FDCE  \P5_reg<9> ( .CE ( n488 ) , .C ( clock ) , .Q ( \P5<9> ) , .CLR ( 
        reset ) , .D ( \P5<10> ) );
    FDCE  \P5_reg<10> ( .CE ( n488 ) , .CLR ( reset ) , .C ( clock ) , 
        .D ( \P5<11> ) , .Q ( \P5<10> ) );
    FDCE  \P5_reg<11> ( .CLR ( reset ) , .D ( \P5<12> ) , .CE ( n488 ) 
        , .C ( clock ) , .Q ( \P5<11> ) );
    FDCE  \P5_reg<12> ( .CE ( n488 ) , .C ( clock ) , .Q ( \P5<12> ) , 
        .CLR ( reset ) , .D ( \P5<13> ) );
    FDCE  \P5_reg<13> ( .CE ( n488 ) , .CLR ( reset ) , .C ( clock ) , 
        .D ( \P5<14> ) , .Q ( \P5<13> ) );
    FDCE  \P5_reg<14> ( .CE ( n488 ) , .CLR ( reset ) , .Q ( \P5<14> ) 
        , .C ( clock ) , .D ( N1964 ) );
    FDCE  \P4_reg<0> ( .CE ( n488 ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \P4<1> ) , .Q ( \P4<0> ) );
    FDCE  \P4_reg<1> ( .CE ( n488 ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \P4<2> ) , .Q ( \P4<1> ) );
    FDCE  \P4_reg<2> ( .CE ( n488 ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \P4<3> ) , .Q ( \P4<2> ) );
    FDCE  \P4_reg<3> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P4<4> ) , 
        .Q ( \P4<3> ) , .C ( clock ) );
    FDCE  \P4_reg<4> ( .C ( clock ) , .Q ( \P4<4> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P4<5> ) );
    FDCE  \P4_reg<5> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P4<6> ) , 
        .C ( clock ) , .Q ( \P4<5> ) );
    FDCE  \P4_reg<6> ( .CE ( n488 ) , .C ( clock ) , .Q ( \P4<6> ) , .CLR ( 
        reset ) , .D ( \P4<7> ) );
    FDCE  \P4_reg<7> ( .C ( clock ) , .Q ( \P4<7> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P4<8> ) );
    FDCE  \P4_reg<8> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P4<9> ) , 
        .C ( clock ) , .Q ( \P4<8> ) );
    FDCE  \P4_reg<9> ( .C ( clock ) , .Q ( \P4<9> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P4<10> ) );
    FDCE  \P4_reg<10> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P4<11> ) 
        , .C ( clock ) , .Q ( \P4<10> ) );
    FDCE  \P4_reg<11> ( .C ( clock ) , .Q ( \P4<11> ) , .CE ( n488 ) , 
        .CLR ( reset ) , .D ( \P4<12> ) );
    FDCE  \P4_reg<12> ( .CLR ( reset ) , .Q ( \P4<12> ) , .CE ( n488 ) 
        , .C ( clock ) , .D ( \P4<13> ) );
    FDCE  \P4_reg<13> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P4<14> ) 
        , .C ( clock ) , .Q ( \P4<13> ) );
    FDCE  \P4_reg<14> ( .C ( clock ) , .Q ( \P4<14> ) , .CE ( n488 ) , 
        .CLR ( reset ) , .D ( N1967 ) );
    FDCE  \P3_reg<0> ( .CE ( n488 ) , .C ( clock ) , .Q ( \P3<0> ) , .CLR ( 
        reset ) , .D ( \P3<1> ) );
    FDCE  \P3_reg<1> ( .C ( clock ) , .Q ( \P3<1> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P3<2> ) );
    FDCE  \P3_reg<2> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P3<3> ) , 
        .C ( clock ) , .Q ( \P3<2> ) );
    FDCE  \P3_reg<3> ( .CE ( n488 ) , .D ( \P3<4> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P3<3> ) );
    FDCE  \P3_reg<4> ( .C ( clock ) , .Q ( \P3<4> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P3<5> ) );
    FDCE  \P3_reg<5> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P3<6> ) , 
        .C ( clock ) , .Q ( \P3<5> ) );
    FDCE  \P3_reg<6> ( .C ( clock ) , .Q ( \P3<6> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P3<7> ) );
    FDCE  \P3_reg<7> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P3<8> ) , 
        .C ( clock ) , .Q ( \P3<7> ) );
    FDCE  \P3_reg<8> ( .C ( clock ) , .Q ( \P3<8> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P3<9> ) );
    FDCE  \P3_reg<9> ( .CLR ( reset ) , .C ( clock ) , .Q ( \P3<9> ) , 
        .CE ( n488 ) , .D ( \P3<10> ) );
    FDCE  \P3_reg<10> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P3<11> ) 
        , .C ( clock ) , .Q ( \P3<10> ) );
    FDCE  \P3_reg<11> ( .C ( clock ) , .Q ( \P3<11> ) , .CE ( n488 ) , 
        .CLR ( reset ) , .D ( \P3<12> ) );
    FDCE  \P3_reg<12> ( .CE ( n488 ) , .C ( clock ) , .Q ( \P3<12> ) , 
        .CLR ( reset ) , .D ( \P3<13> ) );
    FDCE  \P3_reg<13> ( .C ( clock ) , .Q ( \P3<13> ) , .CE ( n488 ) , 
        .CLR ( reset ) , .D ( \P3<14> ) );
    FDCE  \P3_reg<14> ( .CE ( n488 ) , .CLR ( reset ) , .D ( N1966 ) , 
        .C ( clock ) , .Q ( \P3<14> ) );
    FDCE  \P2_reg<0> ( .CE ( n488 ) , .D ( \P2<1> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P2<0> ) );
    FDCE  \P2_reg<1> ( .C ( clock ) , .Q ( \P2<1> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P2<2> ) );
    FDCE  \P2_reg<2> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P2<3> ) , 
        .C ( clock ) , .Q ( \P2<2> ) );
    FDCE  \P2_reg<3> ( .C ( clock ) , .Q ( \P2<3> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P2<4> ) );
    FDCE  \P2_reg<4> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P2<5> ) , 
        .C ( clock ) , .Q ( \P2<4> ) );
    FDCE  \P2_reg<5> ( .C ( clock ) , .Q ( \P2<5> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P2<6> ) );
    FDCE  \P2_reg<6> ( .C ( clock ) , .Q ( \P2<6> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P2<7> ) );
    FDCE  \P2_reg<7> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P2<8> ) , 
        .C ( clock ) , .Q ( \P2<7> ) );
    FDCE  \P2_reg<8> ( .C ( clock ) , .Q ( \P2<8> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P2<9> ) );
    FDCE  \P2_reg<9> ( .C ( clock ) , .D ( \P2<10> ) , .Q ( \P2<9> ) , 
        .CE ( n488 ) , .CLR ( reset ) );
    FDCE  \P2_reg<10> ( .CLR ( reset ) , .Q ( \P2<10> ) , .CE ( n488 ) 
        , .C ( clock ) , .D ( \P2<11> ) );
    FDCE  \P2_reg<11> ( .CE ( n488 ) , .C ( clock ) , .Q ( \P2<11> ) , 
        .CLR ( reset ) , .D ( \P2<12> ) );
    FDCE  \P2_reg<12> ( .C ( clock ) , .CE ( n488 ) , .CLR ( reset ) , 
        .D ( \P2<13> ) , .Q ( \P2<12> ) );
    FDCE  \P2_reg<13> ( .CE ( n488 ) , .C ( clock ) , .Q ( \P2<13> ) , 
        .CLR ( reset ) , .D ( \P2<14> ) );
    FDCE  \P2_reg<14> ( .CE ( n488 ) , .D ( N1963 ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P2<14> ) );
    FDCE  \P1_reg<0> ( .CE ( n488 ) , .C ( clock ) , .D ( \P1<1> ) , .CLR ( 
        reset ) , .Q ( \P1<0> ) );
    FDCE  \P1_reg<1> ( .CE ( n488 ) , .D ( \P1<2> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P1<1> ) );
    FDCE  \P1_reg<2> ( .CE ( n488 ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \P1<3> ) , .Q ( \P1<2> ) );
    FDCE  \P1_reg<3> ( .CE ( n488 ) , .CLR ( reset ) , .C ( clock ) , .D ( 
        \P1<4> ) , .Q ( \P1<3> ) );
    FDCE  \P1_reg<4> ( .CE ( n488 ) , .C ( clock ) , .D ( \P1<5> ) , .CLR ( 
        reset ) , .Q ( \P1<4> ) );
    FDCE  \P1_reg<5> ( .CE ( n488 ) , .C ( clock ) , .Q ( \P1<5> ) , .CLR ( 
        reset ) , .D ( \P1<6> ) );
    FDCE  \P1_reg<6> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P1<7> ) , 
        .C ( clock ) , .Q ( \P1<6> ) );
    FDCE  \P1_reg<7> ( .C ( clock ) , .Q ( \P1<7> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P1<8> ) );
    FDCE  \P1_reg<8> ( .CLR ( reset ) , .C ( clock ) , .Q ( \P1<8> ) , 
        .CE ( n488 ) , .D ( \P1<9> ) );
    FDCE  \P1_reg<9> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P1<10> ) , 
        .C ( clock ) , .Q ( \P1<9> ) );
    FDCE  \P1_reg<10> ( .C ( clock ) , .Q ( \P1<10> ) , .CE ( n488 ) , 
        .CLR ( reset ) , .D ( \P1<11> ) );
    FDCE  \P1_reg<11> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P1<12> ) 
        , .C ( clock ) , .Q ( \P1<11> ) );
    FDCE  \P1_reg<12> ( .C ( clock ) , .Q ( \P1<12> ) , .CE ( n488 ) , 
        .CLR ( reset ) , .D ( \P1<13> ) );
    FDCE  \P1_reg<13> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P1<14> ) 
        , .C ( clock ) , .Q ( \P1<13> ) );
    FDCE  \P1_reg<14> ( .CE ( n488 ) , .D ( N1961 ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P1<14> ) );
    FDCE  \P0_reg<0> ( .C ( clock ) , .Q ( \P0<0> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P0<1> ) );
    FDCE  \P0_reg<1> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P0<2> ) , 
        .C ( clock ) , .Q ( \P0<1> ) );
    FDCE  \P0_reg<2> ( .CE ( n488 ) , .C ( clock ) , .CLR ( reset ) , .D ( 
        \P0<3> ) , .Q ( \P0<2> ) );
    FDCE  \P0_reg<3> ( .C ( clock ) , .Q ( \P0<3> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P0<4> ) );
    FDCE  \P0_reg<4> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P0<5> ) , 
        .C ( clock ) , .Q ( \P0<4> ) );
    FDCE  \P0_reg<5> ( .CE ( n488 ) , .D ( \P0<6> ) , .CLR ( reset ) , 
        .C ( clock ) , .Q ( \P0<5> ) );
    FDCE  \P0_reg<6> ( .C ( clock ) , .Q ( \P0<6> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P0<7> ) );
    FDCE  \P0_reg<7> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P0<8> ) , 
        .C ( clock ) , .Q ( \P0<7> ) );
    FDCE  \P0_reg<8> ( .C ( clock ) , .Q ( \P0<8> ) , .CE ( n488 ) , .CLR ( 
        reset ) , .D ( \P0<9> ) );
    FDCE  \P0_reg<9> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P0<10> ) , 
        .C ( clock ) , .Q ( \P0<9> ) );
    FDCE  \P0_reg<10> ( .CE ( n488 ) , .C ( clock ) , .Q ( \P0<10> ) , 
        .CLR ( reset ) , .D ( \P0<11> ) );
    FDCE  \P0_reg<11> ( .C ( clock ) , .Q ( \P0<11> ) , .CE ( n488 ) , 
        .CLR ( reset ) , .D ( \P0<12> ) );
    FDCE  \P0_reg<12> ( .CE ( n488 ) , .CLR ( reset ) , .D ( \P0<13> ) 
        , .C ( clock ) , .Q ( \P0<12> ) );
    FDCE  \P0_reg<13> ( .CE ( n488 ) , .D ( \P0<14> ) , .CLR ( reset ) 
        , .C ( clock ) , .Q ( \P0<13> ) );
    FDCE  \P0_reg<14> ( .C ( clock ) , .CE ( n488 ) , .CLR ( reset ) , 
        .D ( N1960 ) , .Q ( \P0<14> ) );
    BUFE  C1669 ( .E ( oe ) , .I ( \tb_reg<0> ) , .O ( Dx ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1681 ( .I ({ P0_in }) , .O ( N1960 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1682 ( .I ({ P1_in }) , .O ( N1961 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1683 ( .I ({ P2_in }) , .O ( N1963 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1684 ( .I ({ P3_in }) , .O ( N1966 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1685 ( .I ({ P4_in }) , .O ( N1967 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1686 ( .I ({ P5_in }) , .O ( N1964 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1687 ( .I ({ P6_in }) , .O ( N1962 ) );
    g_lut # ( 1 , 2'h1, 0'h0 ) C1688 ( .I ({ P7_in }) , .O ( N1965 ) );
    g_lut # ( 2 , 4'h4, 0'h0 ) C1689 ( .I ({ we , \C1169/C3/C5 }) , .O ( 
    n488 ) );
    g_lut # ( 4 , 16'hfe0e, 0'h0 ) C1690 ( .I ({ \min_state<2> , syn1524 , 
    syn6099 , syn6100 }) , .O ( \C12/N6 ) );
    g_lut # ( 4 , 16'h00ac, 0'h0 ) C1691 ( .I ({ \tb_reg<1> , \tb_reg<2> , 
    syn5927 , syn5982 }) , .O ( syn6100 ) );
    g_lut # ( 3 , 8'hca, 0'h0 ) C1692 ( .I ({ \tb_reg<0> , syn4881 , syn4883 }) , 
    .O ( syn5982 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1693 ( .I ({ syn1732 , syn4882 , syn6672 , 
    syn6675 }) , .O ( syn4883 ) );
    g_lut # ( 4 , 16'hfeee, 0'h0 ) C1694 ( .I ({ \P4<14> , syn1222 , syn1731 , 
    syn4765 }) , .O ( syn6675 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1695 ( .I ({ \trace_ptr<0> , \P4<1> , 
    \P4<0> , \C1160/C3/C5 }) , .O ( syn4765 ) );
    g_lut # ( 4 , 16'h00e0, 0'h0 ) C1696 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6651 , syn6652 }) , .O ( syn1731 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1697 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P4<13> , \P4<12> }) , .O ( syn6652 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1698 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P4<5> , \P4<4> }) , .O ( syn6651 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1699 ( .I ({ \P4<9> , \P4<8> , syn1248 , 
    syn1249 }) , .O ( syn6672 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1700 ( .I ({ \trace_ptr<0> , \P4<7> , 
    \P4<6> , syn1217 }) , .O ( syn4882 ) );
    g_lut # ( 4 , 16'h0e00, 0'h0 ) C1701 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6659 , syn6660 }) , .O ( syn1732 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1702 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P4<11> , \P4<10> }) , .O ( syn6660 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1703 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P4<3> , \P4<2> }) , .O ( syn6659 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1704 ( .I ({ syn1767 , syn4880 , syn6706 , 
    syn6709 }) , .O ( syn4881 ) );
    g_lut # ( 4 , 16'hfeee, 0'h0 ) C1705 ( .I ({ \P5<14> , syn1222 , syn1766 , 
    syn4767 }) , .O ( syn6709 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1706 ( .I ({ \trace_ptr<0> , \P5<1> , 
    \P5<0> , \C1160/C3/C5 }) , .O ( syn4767 ) );
    g_lut # ( 4 , 16'h00e0, 0'h0 ) C1707 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6685 , syn6686 }) , .O ( syn1766 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1708 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P5<13> , \P5<12> }) , .O ( syn6686 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1709 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P5<5> , \P5<4> }) , .O ( syn6685 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1710 ( .I ({ \P5<9> , \P5<8> , syn1248 , 
    syn1249 }) , .O ( syn6706 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1711 ( .I ({ \trace_ptr<0> , \P5<7> , 
    \P5<6> , syn1217 }) , .O ( syn4880 ) );
    g_lut # ( 4 , 16'h0e00, 0'h0 ) C1712 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6693 , syn6694 }) , .O ( syn1767 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1713 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P5<11> , \P5<10> }) , .O ( syn6694 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1714 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P5<3> , \P5<2> }) , .O ( syn6693 ) );
    g_lut # ( 3 , 8'hca, 0'h0 ) C1715 ( .I ({ \tb_reg<0> , syn4877 , syn4879 }) , 
    .O ( syn5927 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1716 ( .I ({ syn1805 , syn4878 , syn6742 , 
    syn6745 }) , .O ( syn4879 ) );
    g_lut # ( 4 , 16'hfeee, 0'h0 ) C1717 ( .I ({ \P0<14> , syn1222 , syn1804 , 
    syn4769 }) , .O ( syn6745 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1718 ( .I ({ \trace_ptr<0> , \P0<1> , 
    \P0<0> , \C1160/C3/C5 }) , .O ( syn4769 ) );
    g_lut # ( 4 , 16'h00e0, 0'h0 ) C1719 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6721 , syn6722 }) , .O ( syn1804 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1720 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P0<13> , \P0<12> }) , .O ( syn6722 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1721 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P0<5> , \P0<4> }) , .O ( syn6721 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1722 ( .I ({ \P0<9> , \P0<8> , syn1248 , 
    syn1249 }) , .O ( syn6742 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1723 ( .I ({ \trace_ptr<0> , \P0<7> , 
    \P0<6> , syn1217 }) , .O ( syn4878 ) );
    g_lut # ( 4 , 16'h0e00, 0'h0 ) C1724 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6729 , syn6730 }) , .O ( syn1805 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1725 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P0<11> , \P0<10> }) , .O ( syn6730 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1726 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P0<3> , \P0<2> }) , .O ( syn6729 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1727 ( .I ({ syn1840 , syn4876 , syn6776 , 
    syn6779 }) , .O ( syn4877 ) );
    g_lut # ( 4 , 16'hfeee, 0'h0 ) C1728 ( .I ({ \P1<14> , syn1222 , syn1839 , 
    syn4771 }) , .O ( syn6779 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1729 ( .I ({ \trace_ptr<0> , \P1<1> , 
    \P1<0> , \C1160/C3/C5 }) , .O ( syn4771 ) );
    g_lut # ( 4 , 16'h00e0, 0'h0 ) C1730 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6755 , syn6756 }) , .O ( syn1839 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1731 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P1<13> , \P1<12> }) , .O ( syn6756 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1732 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P1<5> , \P1<4> }) , .O ( syn6755 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1733 ( .I ({ \P1<9> , \P1<8> , syn1248 , 
    syn1249 }) , .O ( syn6776 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1734 ( .I ({ \trace_ptr<0> , \P1<7> , 
    \P1<6> , syn1217 }) , .O ( syn4876 ) );
    g_lut # ( 4 , 16'h0e00, 0'h0 ) C1735 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6763 , syn6764 }) , .O ( syn1840 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1736 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P1<11> , \P1<10> }) , .O ( syn6764 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1737 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P1<3> , \P1<2> }) , .O ( syn6763 ) );
    g_lut # ( 4 , 16'hac00, 0'h0 ) C1738 ( .I ({ \tb_reg<1> , \tb_reg<2> , 
    syn6040 , syn6095 }) , .O ( syn6099 ) );
    g_lut # ( 3 , 8'hca, 0'h0 ) C1739 ( .I ({ \tb_reg<0> , syn4889 , syn4891 }) , 
    .O ( syn6095 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1740 ( .I ({ syn1582 , syn4890 , syn6530 , 
    syn6533 }) , .O ( syn4891 ) );
    g_lut # ( 4 , 16'hfeee, 0'h0 ) C1741 ( .I ({ \P6<14> , syn1222 , syn1581 , 
    syn4757 }) , .O ( syn6533 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1742 ( .I ({ \trace_ptr<0> , \P6<1> , 
    \P6<0> , \C1160/C3/C5 }) , .O ( syn4757 ) );
    g_lut # ( 4 , 16'h00e0, 0'h0 ) C1743 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6505 , syn6506 }) , .O ( syn1581 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1744 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P6<13> , \P6<12> }) , .O ( syn6506 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1745 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P6<5> , \P6<4> }) , .O ( syn6505 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1746 ( .I ({ \P6<9> , \P6<8> , syn1248 , 
    syn1249 }) , .O ( syn6530 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1747 ( .I ({ \trace_ptr<0> , \P6<7> , 
    \P6<6> , syn1217 }) , .O ( syn4890 ) );
    g_lut # ( 4 , 16'h0e00, 0'h0 ) C1748 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6514 , syn6515 }) , .O ( syn1582 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1749 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P6<11> , \P6<10> }) , .O ( syn6515 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1750 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P6<3> , \P6<2> }) , .O ( syn6514 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1751 ( .I ({ syn1617 , syn4888 , syn6564 , 
    syn6567 }) , .O ( syn4889 ) );
    g_lut # ( 4 , 16'hfeee, 0'h0 ) C1752 ( .I ({ \P7<14> , syn1222 , syn1616 , 
    syn4759 }) , .O ( syn6567 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1753 ( .I ({ \trace_ptr<0> , \P7<1> , 
    \P7<0> , \C1160/C3/C5 }) , .O ( syn4759 ) );
    g_lut # ( 4 , 16'h00e0, 0'h0 ) C1754 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6543 , syn6544 }) , .O ( syn1616 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1755 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P7<13> , \P7<12> }) , .O ( syn6544 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1756 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P7<5> , \P7<4> }) , .O ( syn6543 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1757 ( .I ({ \P7<9> , \P7<8> , syn1248 , 
    syn1249 }) , .O ( syn6564 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1758 ( .I ({ \trace_ptr<0> , \P7<7> , 
    \P7<6> , syn1217 }) , .O ( syn4888 ) );
    g_lut # ( 4 , 16'h0e00, 0'h0 ) C1759 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6551 , syn6552 }) , .O ( syn1617 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1760 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P7<11> , \P7<10> }) , .O ( syn6552 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1761 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P7<3> , \P7<2> }) , .O ( syn6551 ) );
    g_lut # ( 3 , 8'hca, 0'h0 ) C1762 ( .I ({ \tb_reg<0> , syn4885 , syn4887 }) , 
    .O ( syn6040 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1763 ( .I ({ syn1656 , syn4886 , syn6600 , 
    syn6603 }) , .O ( syn4887 ) );
    g_lut # ( 4 , 16'hfeee, 0'h0 ) C1764 ( .I ({ \P2<14> , syn1222 , syn1655 , 
    syn4761 }) , .O ( syn6603 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1765 ( .I ({ \trace_ptr<0> , \P2<1> , 
    \P2<0> , \C1160/C3/C5 }) , .O ( syn4761 ) );
    g_lut # ( 4 , 16'h00e0, 0'h0 ) C1766 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6579 , syn6580 }) , .O ( syn1655 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1767 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P2<13> , \P2<12> }) , .O ( syn6580 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1768 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P2<5> , \P2<4> }) , .O ( syn6579 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1769 ( .I ({ \P2<9> , \P2<8> , syn1248 , 
    syn1249 }) , .O ( syn6600 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1770 ( .I ({ \trace_ptr<0> , \P2<7> , 
    \P2<6> , syn1217 }) , .O ( syn4886 ) );
    g_lut # ( 4 , 16'h0e00, 0'h0 ) C1771 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6587 , syn6588 }) , .O ( syn1656 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1772 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P2<11> , \P2<10> }) , .O ( syn6588 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1773 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P2<3> , \P2<2> }) , .O ( syn6587 ) );
    g_lut # ( 4 , 16'hfffe, 0'h0 ) C1774 ( .I ({ syn1691 , syn4884 , syn6634 , 
    syn6637 }) , .O ( syn4885 ) );
    g_lut # ( 4 , 16'hfeee, 0'h0 ) C1775 ( .I ({ \P3<14> , syn1222 , syn1690 , 
    syn4763 }) , .O ( syn6637 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1776 ( .I ({ \trace_ptr<0> , \P3<1> , 
    \P3<0> , \C1160/C3/C5 }) , .O ( syn4763 ) );
    g_lut # ( 4 , 16'h00e0, 0'h0 ) C1777 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6613 , syn6614 }) , .O ( syn1690 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1778 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P3<13> , \P3<12> }) , .O ( syn6614 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1779 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P3<5> , \P3<4> }) , .O ( syn6613 ) );
    g_lut # ( 4 , 16'h4000, 0'h0 ) C1780 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    \trace_ptr<3> , \trace_ptr<0> }) , .O ( syn1222 ) );
    g_lut # ( 4 , 16'heac0, 0'h0 ) C1781 ( .I ({ \P3<9> , \P3<8> , syn1248 , 
    syn1249 }) , .O ( syn6634 ) );
    g_lut # ( 4 , 16'h0008, 0'h0 ) C1782 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    \trace_ptr<3> , \trace_ptr<0> }) , .O ( syn1249 ) );
    g_lut # ( 4 , 16'h0004, 0'h0 ) C1783 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    \trace_ptr<3> , \trace_ptr<0> }) , .O ( syn1248 ) );
    g_lut # ( 4 , 16'ha088, 0'h0 ) C1784 ( .I ({ \trace_ptr<0> , \P3<7> , 
    \P3<6> , syn1217 }) , .O ( syn4884 ) );
    g_lut # ( 3 , 8'h40, 0'h0 ) C1785 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    \trace_ptr<3> }) , .O ( syn1217 ) );
    g_lut # ( 4 , 16'h0e00, 0'h0 ) C1786 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    syn6621 , syn6622 }) , .O ( syn1691 ) );
    g_lut # ( 4 , 16'hca00, 0'h0 ) C1787 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P3<11> , \P3<10> }) , .O ( syn6622 ) );
    g_lut # ( 4 , 16'h00ca, 0'h0 ) C1788 ( .I ({ \trace_ptr<3> , \trace_ptr<0> , 
    \P3<3> , \P3<2> }) , .O ( syn6621 ) );
    g_lut # ( 3 , 8'he4, 0'h0 ) C1789 ( .I ({ \min_state<1> , \tb_reg<2> , 
    syn1524 }) , .O ( \C12/N12 ) );
    g_lut # ( 2 , 4'he, 0'h0 ) C1790 ( .I ({ te , syn1524 }) , .O ( N1968 ) 
    );
    g_lut # ( 3 , 8'he4, 0'h0 ) C1791 ( .I ({ \min_state<0> , \tb_reg<1> , 
    syn1524 }) , .O ( \C12/N18 ) );
    g_lut # ( 4 , 16'h0200, 0'h0 ) C1792 ( .I ({ \NEXT_STATE<3> , \NEXT_STATE<0> , 
    \NEXT_STATE<1> , syn6484 }) , .O ( syn1524 ) );
    g_lut # ( 4 , 16'h0001, 0'h0 ) C1793 ( .I ({ \NEXT_STATE<5> , \NEXT_STATE<6> , 
    \NEXT_STATE<2> , \NEXT_STATE<4> }) , .O ( syn6484 ) );
    g_lut # ( 4 , 16'hdefc, 0'h0 ) C1794 ( .I ({ \write_ptr<2> , \write_ptr<3> , 
    \NEXT_STATE<4> , syn1503 }) , .O ( \C50/N22 ) );
    g_lut # ( 3 , 8'hde, 0'h0 ) C1795 ( .I ({ \write_ptr<2> , \NEXT_STATE<4> , 
    syn1503 }) , .O ( \C50/N17 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C1796 ( .I ({ \write_ptr<0> , \write_ptr<1> }) , 
    .O ( syn1503 ) );
    g_lut # ( 3 , 8'hbe, 0'h0 ) C1797 ( .I ({ \write_ptr<0> , \write_ptr<1> , 
    \NEXT_STATE<4> }) , .O ( \C50/N12 ) );
    g_lut # ( 2 , 4'he, 0'h0 ) C1798 ( .I ({ \NEXT_STATE<4> , syn1494 }) , 
    .O ( \C51/N9 ) );
    g_lut # ( 2 , 4'h1, 0'h0 ) C1799 ( .I ({ \write_ptr<0> , \NEXT_STATE<4> }) , 
    .O ( \C50/N3 ) );
    g_lut # ( 4 , 16'hd2ff, 0'h0 ) C1800 ( .I ({ \NEXT_STATE<5> , \trace_ptr<3> , 
    \trace_ptr<0> , syn1219 }) , .O ( \C1175/N22 ) );
    g_lut # ( 2 , 4'h1, 0'h0 ) C1801 ( .I ({ \trace_ptr<1> , \trace_ptr<2> }) , 
    .O ( syn1219 ) );
    g_lut # ( 4 , 16'hc9ff, 0'h0 ) C1802 ( .I ({ \NEXT_STATE<5> , \trace_ptr<1> , 
    \trace_ptr<2> , \trace_ptr<0> }) , .O ( \C1175/N17 ) );
    g_lut # ( 3 , 8'h9f, 0'h0 ) C1803 ( .I ({ \NEXT_STATE<5> , \trace_ptr<1> , 
    \trace_ptr<0> }) , .O ( \C1175/N12 ) );
    g_lut # ( 2 , 4'h4, 0'h0 ) C1804 ( .I ({ \NEXT_STATE<5> , \trace_ptr<0> }) , 
    .O ( \C1175/N5 ) );
    g_lut # ( 3 , 8'hd0, 0'h0 ) C1805 ( .I ({ \NEXT_STATE<6> , syn1250 , 
    syn1447 }) , .O ( \C46/N5 ) );
    g_lut # ( 3 , 8'hba, 0'h0 ) C1806 ( .I ({ \NEXT_STATE<6> , syn1447 , 
    syn6450 }) , .O ( \C48/N29 ) );
    g_lut # ( 4 , 16'hd5c0, 0'h0 ) C1807 ( .I ({ \NEXT_STATE<3> , seq_ready , 
    \NEXT_STATE<0> , syn1459 }) , .O ( syn6450 ) );
    g_lut # ( 3 , 8'hdc, 0'h0 ) C1808 ( .I ({ \NEXT_STATE<5> , \NEXT_STATE<4> , 
    \C1160/C3/C5 }) , .O ( \C48/N69 ) );
    g_lut # ( 2 , 4'h4, 0'h0 ) C1809 ( .I ({ \NEXT_STATE<5> , \C1160/C3/C5 }) , 
    .O ( \C44/N5 ) );
    g_lut # ( 2 , 4'h8, 0'h0 ) C1810 ( .I ({ \NEXT_STATE<5> , \C1160/C3/C5 }) , 
    .O ( \C48/N77 ) );
    g_lut # ( 4 , 16'heaaa, 0'h0 ) C1811 ( .I ({ \NEXT_STATE<6> , syn1250 , 
    syn1447 , syn1459 }) , .O ( \C48/N59 ) );
    g_lut # ( 2 , 4'he, 0'h0 ) C1812 ( .I ({ C703 , syn1432 }) , .O ( \C49/N9 ) 
    );
    g_lut # ( 4 , 16'h88f8, 0'h0 ) C1813 ( .I ({ seq_ready , \NEXT_STATE<0> , 
    syn1447 , syn6435 }) , .O ( \C48/N17 ) );
    g_lut # ( 2 , 4'h4, 0'h0 ) C1814 ( .I ({ \NEXT_STATE<6> , syn1250 }) , 
    .O ( syn6435 ) );
    g_lut # ( 4 , 16'ha222, 0'h0 ) C1815 ( .I ({ \symbol_count<0> , \symbol_count<1> , 
    syn1250 , syn1446 }) , .O ( syn1447 ) );
    g_lut # ( 2 , 4'hd, 0'h0 ) C1816 ( .I ({ \symbol_count<4> , syn1223 }) , 
    .O ( syn1446 ) );
    g_lut # ( 3 , 8'h02, 0'h0 ) C1817 ( .I ({ \symbol_count<2> , \symbol_count<3> , 
    syn1223 }) , .O ( syn1250 ) );
    g_lut # ( 4 , 16'h0001, 0'h0 ) C1818 ( .I ({ \symbol_count<5> , \symbol_count<6> , 
    \symbol_count<7> , \symbol_count<8> }) , .O ( syn1223 ) );
    g_lut # ( 4 , 16'hfeae, 0'h0 ) C1819 ( .I ({ seq_ready , \NEXT_STATE<0> , 
    C703 , syn1432 }) , .O ( \C43/N12 ) );
    g_lut # ( 4 , 16'hfbaa, 0'h0 ) C1820 ( .I ({ \NEXT_STATE<5> , \trace_ptr<0> , 
    \C1160/C3/C5 , syn1494 }) , .O ( syn1432 ) );
    g_lut # ( 3 , 8'h4c, 0'h0 ) C1821 ( .I ({ \write_ptr<0> , \NEXT_STATE<3> , 
    syn1459 }) , .O ( syn1494 ) );
    g_lut # ( 4 , 16'h8000, 0'h0 ) C1822 ( .I ({ \write_ptr<1> , \write_ptr<2> , 
    \write_ptr<3> , \NEXT_STATE<3> }) , .O ( syn1459 ) );
    g_lut # ( 3 , 8'h01, 0'h0 ) C1823 ( .I ({ \trace_ptr<1> , \trace_ptr<2> , 
    \trace_ptr<3> }) , .O ( \C1160/C3/C5 ) );
    g_lut # ( 2 , 4'h1, 0'h0 ) C1824 ( .I ({ \NEXT_STATE<3> , \NEXT_STATE<5> }) , 
    .O ( C703 ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1828 ( .I ({ A7_in [0] , \A7<0> , \C1169/C3/C5 }) , 
    .O ( A7_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1829 ( .I ({ A7_in [1] , \A7<1> , \C1169/C3/C5 }) , 
    .O ( A7_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1830 ( .I ({ A7_in [2] , \A7<2> , \C1169/C3/C5 }) , 
    .O ( A7_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1831 ( .I ({ A7_in [3] , \A7_Q833<3> , 
    \C1169/C3/C5 }) , .O ( A7_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1832 ( .I ({ A6_in [0] , \A6<0> , \C1169/C3/C5 }) , 
    .O ( A6_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1833 ( .I ({ A6_in [1] , \A6<1> , \C1169/C3/C5 }) , 
    .O ( A6_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1834 ( .I ({ A6_in [2] , \A6<2> , \C1169/C3/C5 }) , 
    .O ( A6_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1835 ( .I ({ A6_in [3] , \A6_Q824<3> , 
    \C1169/C3/C5 }) , .O ( A6_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1836 ( .I ({ A5_in [0] , \A5<0> , \C1169/C3/C5 }) , 
    .O ( A5_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1837 ( .I ({ A5_in [1] , \A5<1> , \C1169/C3/C5 }) , 
    .O ( A5_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1838 ( .I ({ A5_in [2] , \A5<2> , \C1169/C3/C5 }) , 
    .O ( A5_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1839 ( .I ({ A5_in [3] , \A5_Q815<3> , 
    \C1169/C3/C5 }) , .O ( A5_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1840 ( .I ({ A4_in [0] , \A4<0> , \C1169/C3/C5 }) , 
    .O ( A4_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1841 ( .I ({ A4_in [1] , \A4<1> , \C1169/C3/C5 }) , 
    .O ( A4_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1842 ( .I ({ A4_in [2] , \A4<2> , \C1169/C3/C5 }) , 
    .O ( A4_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1843 ( .I ({ A4_in [3] , \A4_Q806<3> , 
    \C1169/C3/C5 }) , .O ( A4_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1844 ( .I ({ A3_in [0] , \A3<0> , \C1169/C3/C5 }) , 
    .O ( A3_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1845 ( .I ({ A3_in [1] , \A3<1> , \C1169/C3/C5 }) , 
    .O ( A3_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1846 ( .I ({ A3_in [2] , \A3<2> , \C1169/C3/C5 }) , 
    .O ( A3_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1847 ( .I ({ A3_in [3] , \A3_Q797<3> , 
    \C1169/C3/C5 }) , .O ( A3_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1848 ( .I ({ A2_in [0] , \A2<0> , \C1169/C3/C5 }) , 
    .O ( A2_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1849 ( .I ({ A2_in [1] , \A2<1> , \C1169/C3/C5 }) , 
    .O ( A2_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1850 ( .I ({ A2_in [2] , \A2<2> , \C1169/C3/C5 }) , 
    .O ( A2_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1851 ( .I ({ A2_in [3] , \A2_Q788<3> , 
    \C1169/C3/C5 }) , .O ( A2_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1852 ( .I ({ A1_in [0] , \A1<0> , \C1169/C3/C5 }) , 
    .O ( A1_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1853 ( .I ({ A1_in [1] , \A1<1> , \C1169/C3/C5 }) , 
    .O ( A1_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1854 ( .I ({ A1_in [2] , \A1<2> , \C1169/C3/C5 }) , 
    .O ( A1_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1855 ( .I ({ A1_in [3] , \A1_Q779<3> , 
    \C1169/C3/C5 }) , .O ( A1_out [3] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1856 ( .I ({ A0_in [0] , \A0<0> , \C1169/C3/C5 }) , 
    .O ( A0_out [0] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1857 ( .I ({ A0_in [1] , \A0<1> , \C1169/C3/C5 }) , 
    .O ( A0_out [1] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1858 ( .I ({ A0_in [2] , \A0<2> , \C1169/C3/C5 }) , 
    .O ( A0_out [2] ) );
    g_lut # ( 3 , 8'hd8, 0'h0 ) C1859 ( .I ({ A0_in [3] , \A0_Q770<3> , 
    \C1169/C3/C5 }) , .O ( A0_out [3] ) );
    g_lut # ( 4 , 16'h0001, 0'h0 ) C1860 ( .I ({ \write_ptr<0> , \write_ptr<1> , 
    \write_ptr<2> , \write_ptr<3> }) , .O ( \C1169/C3/C5 ) );
    VCC  C1862 ( .P ( \C1155/N0 ) );
    GND  C1863 ( .G ( \C1155/C3/N0 ) );

endmodule

module bVITERBI_213 ( Dx , oe , sync_error , Rx , seq_ready , clock , reset 
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
    
    bBMU_213  U1 ( .HD10 ({ \HD10<1> , \HD10<0> }) , .HD9 ({ \HD9<1> , 
        \HD9<0> }) , .HD13 ({ \HD13<1> , \HD13<0> }) , .clock ( clock ) 
        , .HD12 ({ \HD12<1> , \HD12<0> }) , .HD2 ({ \HD2<1> , \HD2<0> }) 
        , .HD5 ({ \HD5<1> , \HD5<0> }) , .HD4 ({ \HD4<1> , \HD4<0> }) , 
        .HD16 ({ \HD16<1> , \HD16<0> }) , .HD11 ({ \HD11<1> , \HD11<0> 
        }) , .HD8 ({ \HD8<1> , \HD8<0> }) , .reset ( reset ) , .HD6 ({ 
        \HD6<1> , \HD6<0> }) , .le ( le ) , .Rx ({ Rx [1] , Rx [0] }) , 
        .HD7 ({ \HD7<1> , \HD7<0> }) , .HD1 ({ \HD1<1> , \HD1<0> }) , .HD14 ({ 
        \HD14<1> , \HD14<0> }) , .HD15 ({ \HD15<1> , \HD15<0> }) , .HD3 ({ 
        \HD3<1> , \HD3<0> }) );
    bACSU_213  U2 ( .HD0_ina ({ \HD1<1> , \HD1<0> }) , .HD5_inb ({ \HD14<1> 
        , \HD14<0> }) , .acs4_ppm_ina ({ \A2_out<3> , \A2_out<2> , \A2_out<1> 
        , \A2_out<0> }) , .acs3_ppm_inb ({ \A5_out<3> , \A5_out<2> , \A5_out<1> 
        , \A5_out<0> }) , .ae ( ae ) , .acs1_ppm_ina ({ \A0_out<3> , \A0_out<2> 
        , \A0_out<1> , \A0_out<0> }) , .acs0_ppm_out ({ \acs0_ppm_out<3> 
        , \acs0_ppm_out<2> , \acs0_ppm_out<1> , \acs0_ppm_out<0> }) , .acs5_ppm_ina ({ 
        \A2_out<3> , \A2_out<2> , \A2_out<1> , \A2_out<0> }) , .acs5_ppm_inb ({ 
        \A6_out<3> , \A6_out<2> , \A6_out<1> , \A6_out<0> }) , .acs1_ppm_inb ({ 
        \A4_out<3> , \A4_out<2> , \A4_out<1> , \A4_out<0> }) , .acs6_ppm_ina ({ 
        \A3_out<3> , \A3_out<2> , \A3_out<1> , \A3_out<0> }) , .acs3_ppm_out ({ 
        \acs3_ppm_out<3> , \acs3_ppm_out<2> , \acs3_ppm_out<1> , \acs3_ppm_out<0> 
        }) , .acs0_ppm_inb ({ \A4_out<3> , \A4_out<2> , \A4_out<1> , \A4_out<0> 
        }) , .HD2_inb ({ \HD11<1> , \HD11<0> }) , .acs7_ppm_ina ({ \A3_out<3> 
        , \A3_out<2> , \A3_out<1> , \A3_out<0> }) , .acs0_ppm_ina ({ \A0_out<3> 
        , \A0_out<2> , \A0_out<1> , \A0_out<0> }) , .acs5_Bx_out ( \acs5_Bx_out<0> 
        ) , .acs4_ppm_out ({ \acs4_ppm_out<3> , \acs4_ppm_out<2> , \acs4_ppm_out<1> 
        , \acs4_ppm_out<0> }) , .HD7_ina ({ \HD8<1> , \HD8<0> }) , .acs2_ppm_inb ({ 
        \A5_out<3> , \A5_out<2> , \A5_out<1> , \A5_out<0> }) , .acs2_Bx_out ( 
        \acs2_Bx_out<0> ) , .acs7_ppm_out ({ \acs7_ppm_out<3> , \acs7_ppm_out<2> 
        , \acs7_ppm_out<1> , \acs7_ppm_out<0> }) , .HD7_inb ({ \HD16<1> 
        , \HD16<0> }) , .acs2_ppm_ina ({ \A1_out<3> , \A1_out<2> , \A1_out<1> 
        , \A1_out<0> }) , .acs5_ppm_out ({ \acs5_ppm_out<3> , \acs5_ppm_out<2> 
        , \acs5_ppm_out<1> , \acs5_ppm_out<0> }) , .acs3_ppm_ina ({ \A1_out<3> 
        , \A1_out<2> , \A1_out<1> , \A1_out<0> }) , .acs1_Bx_out ( \acs1_Bx_out<0> 
        ) , .acs3_Bx_out ( \acs3_Bx_out<0> ) , .acs7_ppm_inb ({ \A7_out<3> 
        , \A7_out<2> , \A7_out<1> , \A7_out<0> }) , .acs7_Bx_out ( \acs7_Bx_out<0> 
        ) , .acs6_Bx_out ( \acs6_Bx_out<0> ) , .HD6_inb ({ \HD15<1> , \HD15<0> 
        }) , .acs6_ppm_out ({ \acs6_ppm_out<3> , \acs6_ppm_out<2> , \acs6_ppm_out<1> 
        , \acs6_ppm_out<0> }) , .HD2_ina ({ \HD3<1> , \HD3<0> }) , .HD6_ina ({ 
        \HD7<1> , \HD7<0> }) , .acs0_Bx_out ( \acs0_Bx_out<0> ) , .HD1_inb ({ 
        \HD10<1> , \HD10<0> }) , .acs4_Bx_out ( \acs4_Bx_out<0> ) , .HD4_ina ({ 
        \HD5<1> , \HD5<0> }) , .clock ( clock ) , .acs2_ppm_out ({ \acs2_ppm_out<3> 
        , \acs2_ppm_out<2> , \acs2_ppm_out<1> , \acs2_ppm_out<0> }) , .HD3_inb ({ 
        \HD12<1> , \HD12<0> }) , .acs6_ppm_inb ({ \A7_out<3> , \A7_out<2> 
        , \A7_out<1> , \A7_out<0> }) , .HD3_ina ({ \HD4<1> , \HD4<0> }) 
        , .HD0_inb ({ \HD9<1> , \HD9<0> }) , .acs1_ppm_out ({ \acs1_ppm_out<3> 
        , \acs1_ppm_out<2> , \acs1_ppm_out<1> , \acs1_ppm_out<0> }) , .reset ( 
        reset ) , .HD4_inb ({ \HD13<1> , \HD13<0> }) , .acs4_ppm_inb ({ 
        \A6_out<3> , \A6_out<2> , \A6_out<1> , \A6_out<0> }) , .HD5_ina ({ 
        \HD6<1> , \HD6<0> }) , .HD1_ina ({ \HD2<1> , \HD2<0> }) );
    bCONTROL_213  U3 ( .P3_in ( \acs3_Bx_out<0> ) , .A6_out ({ \A6_out<3> 
        , \A6_out<2> , \A6_out<1> , \A6_out<0> }) , .seq_ready ( seq_ready 
        ) , .A4_out ({ \A4_out<3> , \A4_out<2> , \A4_out<1> , \A4_out<0> 
        }) , .A7_in ({ \acs7_ppm_out<3> , \acs7_ppm_out<2> , \acs7_ppm_out<1> 
        , \acs7_ppm_out<0> }) , .A1_out ({ \A1_out<3> , \A1_out<2> , \A1_out<1> 
        , \A1_out<0> }) , .P5_in ( \acs5_Bx_out<0> ) , .A2_in ({ \acs2_ppm_out<3> 
        , \acs2_ppm_out<2> , \acs2_ppm_out<1> , \acs2_ppm_out<0> }) , .P0_in ( 
        \acs0_Bx_out<0> ) , .A1_in ({ \acs1_ppm_out<3> , \acs1_ppm_out<2> 
        , \acs1_ppm_out<1> , \acs1_ppm_out<0> }) , .Dx ( Dx ) , .A4_in ({ 
        \acs4_ppm_out<3> , \acs4_ppm_out<2> , \acs4_ppm_out<1> , \acs4_ppm_out<0> 
        }) , .ae ( ae ) , .A7_out ({ \A7_out<3> , \A7_out<2> , \A7_out<1> 
        , \A7_out<0> }) , .A5_in ({ \acs5_ppm_out<3> , \acs5_ppm_out<2> 
        , \acs5_ppm_out<1> , \acs5_ppm_out<0> }) , .P2_in ( \acs2_Bx_out<0> 
        ) , .P6_in ( \acs6_Bx_out<0> ) , .P1_in ( \acs1_Bx_out<0> ) , .sync_error ( 
        sync_error ) , .A0_in ({ \acs0_ppm_out<3> , \acs0_ppm_out<2> , 
        \acs0_ppm_out<1> , \acs0_ppm_out<0> }) , .P4_in ( \acs4_Bx_out<0> 
        ) , .clock ( clock ) , .A5_out ({ \A5_out<3> , \A5_out<2> , \A5_out<1> 
        , \A5_out<0> }) , .A3_out ({ \A3_out<3> , \A3_out<2> , \A3_out<1> 
        , \A3_out<0> }) , .le ( le ) , .A3_in ({ \acs3_ppm_out<3> , \acs3_ppm_out<2> 
        , \acs3_ppm_out<1> , \acs3_ppm_out<0> }) , .oe ( oe ) , .A2_out ({ 
        \A2_out<3> , \A2_out<2> , \A2_out<1> , \A2_out<0> }) , .A6_in ({ 
        \acs6_ppm_out<3> , \acs6_ppm_out<2> , \acs6_ppm_out<1> , \acs6_ppm_out<0> 
        }) , .reset ( reset ) , .P7_in ( \acs7_Bx_out<0> ) , .A0_out ({ 
        \A0_out<3> , \A0_out<2> , \A0_out<1> , \A0_out<0> }) );

endmodule
