// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module b19 (
  input clock,
  input reset,
  input bs,
  input na,
  input hold,
  input [10:0] in1,
  input [10:0] in2,
  input [19:0] in3,
  output reg  [29:0] ris) ; 
   reg sel1 ;  
   reg sel2 ;  
   wire [19:0] do1 ;  
   wire [19:0] do2 ;  
   integer di1 ;  
   integer di2 ;  
   wire [2:0] ax1 ;  
   wire [2:0] ax2 ;  
  
wire  P1_clock;
wire  P1_reset;
wire  P1_hold;
wire  P1_na;
wire  P1_bs;
wire  P1_sel;
reg [19:0] P1_dout;
wire [31:0] P1_din;
reg [2:0] P1_aux;
wire  P2_clock;
wire  P2_reset;
wire  P2_hold;
wire  P2_na;
wire  P2_bs;
wire  P2_sel;
reg [19:0] P2_dout;
wire [31:0] P2_din;
reg [2:0] P2_aux;
 
   integer P1_di1 ; 
   integer P1_di2 ; 
   wire[31:0] P1_do1 ; 
   wire[31:0] P1_do2 ; 
   integer P1_td1 ; 
   integer P1_td2 ; 
   integer P1_di3 ; 
   integer P1_di4 ; 
   wire[31:0] P1_do3 ; 
   wire[31:0] P1_do4 ; 
   reg[29:0] P1_tad1 ; 
   reg[29:0] P1_tad2 ; 
   wire[29:0] P1_ad11 ; 
   wire[29:0] P1_ad12 ; 
   wire[29:0] P1_ad21 ; 
   wire[29:0] P1_ad22 ; 
   wire[19:0] P1_ad31 ; 
   wire[19:0] P1_ad41 ; 
   reg[19:0] P1_tad3 ; 
   reg[19:0] P1_tad4 ; 
   wire P1_wr1 ; 
   wire P1_wr2 ; 
   wire P1_wr3 ; 
   wire P1_wr4 ; 
   wire P1_dc1 ; 
   wire P1_dc2 ; 
   wire P1_mio1 ; 
   wire P1_mio2 ; 
   wire P1_as11 ; 
   wire P1_as12 ; 
   wire P1_as21 ; 
   wire P1_as22 ; 
   reg P1_r11 ; 
   reg P1_r12 ; 
   reg P1_r21 ; 
   reg P1_r22 ; 
   wire P1_rd3 ; 
   wire P1_rd4 ; 
  
wire  P1_P1_clock;
wire  P1_P1_reset;
wire [31:0] P1_P1_datai;
integer P1_P1_datao;
wire  P1_P1_hold;
wire  P1_P1_na;
wire  P1_P1_bs16;
reg [29:0] P1_P1_address1;
reg [29:0] P1_P1_address2;
reg  P1_P1_wr;
reg  P1_P1_dc;
reg  P1_P1_mio;
reg  P1_P1_ast1;
reg  P1_P1_ast2;
wire  P1_P1_ready1;
wire  P1_P1_ready2;
wire  P1_P2_clock;
wire  P1_P2_reset;
wire [31:0] P1_P2_datai;
integer P1_P2_datao;
wire  P1_P2_hold;
wire  P1_P2_na;
wire  P1_P2_bs16;
reg [29:0] P1_P2_address1;
reg [29:0] P1_P2_address2;
reg  P1_P2_wr;
reg  P1_P2_dc;
reg  P1_P2_mio;
reg  P1_P2_ast1;
reg  P1_P2_ast2;
wire  P1_P2_ready1;
wire  P1_P2_ready2;
wire  P2_P1_clock;
wire  P2_P1_reset;
wire [31:0] P2_P1_datai;
integer P2_P1_datao;
wire  P2_P1_hold;
wire  P2_P1_na;
wire  P2_P1_bs16;
reg [29:0] P2_P1_address1;
reg [29:0] P2_P1_address2;
reg  P2_P1_wr;
reg  P2_P1_dc;
reg  P2_P1_mio;
reg  P2_P1_ast1;
reg  P2_P1_ast2;
wire  P2_P1_ready1;
wire  P2_P1_ready2;
wire  P2_P2_clock;
wire  P2_P2_reset;
wire [31:0] P2_P2_datai;
integer P2_P2_datao;
wire  P2_P2_hold;
wire  P2_P2_na;
wire  P2_P2_bs16;
reg [29:0] P2_P2_address1;
reg [29:0] P2_P2_address2;
reg  P2_P2_wr;
reg  P2_P2_dc;
reg  P2_P2_mio;
reg  P2_P2_ast1;
reg  P2_P2_ast2;
wire  P2_P2_ready1;
wire  P2_P2_ready2;
 
   integer P1_P1_buf1 ; 
   integer P1_P1_buf2 ; 
   wire[3:0] P1_P1_be1 ; 
   wire[3:0] P1_P1_be2 ; 
   wire[3:0] P1_P1_be3 ; 
   wire[29:0] P1_P1_addr1 ; 
   wire[29:0] P1_P1_addr2 ; 
   wire[29:0] P1_P1_addr3 ; 
   wire P1_P1_wr1 ; 
   wire P1_P1_wr2 ; 
   wire P1_P1_wr3 ; 
   wire P1_P1_dc1 ; 
   wire P1_P1_dc2 ; 
   wire P1_P1_dc3 ; 
   wire P1_P1_mio1 ; 
   wire P1_P1_mio2 ; 
   wire P1_P1_mio3 ; 
   wire P1_P1_ads1 ; 
   wire P1_P1_ads2 ; 
   wire P1_P1_ads3 ; 
   integer P1_P1_di1 ; 
   integer P1_P1_di2 ; 
   integer P1_P1_di3 ; 
   wire[31:0] P1_P1_do1 ; 
   wire[31:0] P1_P1_do2 ; 
   wire[31:0] P1_P1_do3 ; 
   reg P1_P1_rdy1 ; 
   reg P1_P1_rdy2 ; 
   reg P1_P1_rdy3 ; 
   reg P1_P1_ready11 ; 
   reg P1_P1_ready12 ; 
   reg P1_P1_ready21 ; 
   reg P1_P1_ready22 ; 
  always @(  posedge   P1_P1_clock or posedge  P1_P1_reset )
       if ( P1_P1_reset ==1'b1)
          begin 
             P1_P1_buf1  <=0;
             P1_P1_ready11  <=1'b0;
             P1_P1_ready12  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P1_addr1 >2**29& P1_P1_ads1 ==1'b0& P1_P1_mio1 ==1'b1& P1_P1_dc1 ==1'b0& P1_P1_wr1 ==1'b1& P1_P1_be1 ==4'b0000)
               begin 
                  P1_P1_buf1  <= P1_P1_do1 ;
                  P1_P1_ready11  <=1'b0;
                  P1_P1_ready12  <=1'b1;
               end 
             else 
               if ( P1_P1_addr2 >2**29& P1_P1_ads2 ==1'b0& P1_P1_mio2 ==1'b1& P1_P1_dc2 ==1'b0& P1_P1_wr2 ==1'b1& P1_P1_be2 ==4'b0000)
                  begin 
                     P1_P1_buf1  <= P1_P1_do2 ;
                     P1_P1_ready11  <=1'b1;
                     P1_P1_ready12  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P1_ready11  <=1'b1;
                     P1_P1_ready12  <=1'b1;
                  end 
          end
  
  always @(  posedge   P1_P1_clock or posedge  P1_P1_reset )
       if ( P1_P1_reset ==1'b1)
          begin 
             P1_P1_buf2  <=0;
             P1_P1_ready21  <=1'b0;
             P1_P1_ready22  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P1_addr2 <2**29& P1_P1_ads2 ==1'b0& P1_P1_mio2 ==1'b1& P1_P1_dc2 ==1'b0& P1_P1_wr2 ==1'b1& P1_P1_be2 ==4'b0000)
               begin 
                  P1_P1_buf2  <= P1_P1_do2 ;
                  P1_P1_ready21  <=1'b0;
                  P1_P1_ready22  <=1'b1;
               end 
             else 
               if ( P1_P1_ads3 ==1'b0& P1_P1_mio3 ==1'b1& P1_P1_dc3 ==1'b0& P1_P1_wr3 ==1'b0& P1_P1_be3 ==4'b0000)
                  begin 
                     P1_P1_ready21  <=1'b1;
                     P1_P1_ready22  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P1_ready21  <=1'b1;
                     P1_P1_ready22  <=1'b1;
                  end 
          end
  
  always @(    P1_P1_addr1    or  P1_P1_buf1  or  P1_P1_datai  )
       if ( P1_P1_addr1 >2**29)
           P1_P1_di1  <= P1_P1_buf1 ;
        else 
           P1_P1_di1  <= P1_P1_datai ;
 
  always @(    P1_P1_addr2    or  P1_P1_buf1  or  P1_P1_buf2  )
       if ( P1_P1_addr2 >2**29)
           P1_P1_di2  <= P1_P1_buf1 ;
        else 
           P1_P1_di2  <= P1_P1_buf2 ;
 
  always @(      P1_P1_addr2      or  P1_P1_addr3  or  P1_P1_do1  or  P1_P1_do2  or  P1_P1_do3  )
       if (( P1_P1_do1 <2**30)&( P1_P1_do2 <2**30)&( P1_P1_do3 <2**30))
           P1_P1_address2  <= P1_P1_addr3 ;
        else 
           P1_P1_address2  <= P1_P1_addr2 ;
 
  always @(               P1_P1_buf2               or  P1_P1_do3  or  P1_P1_addr1  or  P1_P1_wr3  or  P1_P1_dc3  or  P1_P1_mio3  or  P1_P1_ads1  or  P1_P1_ads3  or  P1_P1_ready1  or  P1_P1_ready2  or  P1_P1_ready11  or  P1_P1_ready12  or  P1_P1_ready21  or  P1_P1_ready22  )
       begin 
          P1_P1_di3  <= P1_P1_buf2 ;
          P1_P1_datao  <= P1_P1_do3 ;
          P1_P1_address1  <= P1_P1_addr1 ;
          P1_P1_wr  <= P1_P1_wr3 ;
          P1_P1_dc  <= P1_P1_dc3 ;
          P1_P1_mio  <= P1_P1_mio3 ;
          P1_P1_ast1  <= P1_P1_ads1 ;
          P1_P1_ast2  <= P1_P1_ads3 ;
          P1_P1_rdy1  <= P1_P1_ready11 & P1_P1_ready1 ;
          P1_P1_rdy2  <= P1_P1_ready12 & P1_P1_ready21 ;
          P1_P1_rdy3  <= P1_P1_ready22 & P1_P1_ready2 ;
       end
  
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
reg  P1_P1_P1_W_R_n;
reg  P1_P1_P1_D_C_n;
reg  P1_P1_P1_M_IO_n;
reg  P1_P1_P1_ADS_n;
wire [31:0] P1_P1_P1_Datai;
integer P1_P1_P1_Datao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
reg [3:0] P1_P1_P2_BE_n;
reg [29:0] P1_P1_P2_Address;
reg  P1_P1_P2_W_R_n;
reg  P1_P1_P2_D_C_n;
reg  P1_P1_P2_M_IO_n;
reg  P1_P1_P2_ADS_n;
wire [31:0] P1_P1_P2_Datai;
integer P1_P1_P2_Datao;
wire  P1_P1_P2_CLOCK;
wire  P1_P1_P2_NA_n;
wire  P1_P1_P2_BS16_n;
wire  P1_P1_P2_READY_n;
wire  P1_P1_P2_HOLD;
wire  P1_P1_P2_RESET;
reg [3:0] P1_P1_P3_BE_n;
reg [29:0] P1_P1_P3_Address;
reg  P1_P1_P3_W_R_n;
reg  P1_P1_P3_D_C_n;
reg  P1_P1_P3_M_IO_n;
reg  P1_P1_P3_ADS_n;
wire [31:0] P1_P1_P3_Datai;
integer P1_P1_P3_Datao;
wire  P1_P1_P3_CLOCK;
wire  P1_P1_P3_NA_n;
wire  P1_P1_P3_BS16_n;
wire  P1_P1_P3_READY_n;
wire  P1_P1_P3_HOLD;
wire  P1_P1_P3_RESET;
reg [3:0] P1_P2_P1_BE_n;
reg [29:0] P1_P2_P1_Address;
reg  P1_P2_P1_W_R_n;
reg  P1_P2_P1_D_C_n;
reg  P1_P2_P1_M_IO_n;
reg  P1_P2_P1_ADS_n;
wire [31:0] P1_P2_P1_Datai;
integer P1_P2_P1_Datao;
wire  P1_P2_P1_CLOCK;
wire  P1_P2_P1_NA_n;
wire  P1_P2_P1_BS16_n;
wire  P1_P2_P1_READY_n;
wire  P1_P2_P1_HOLD;
wire  P1_P2_P1_RESET;
reg [3:0] P1_P2_P2_BE_n;
reg [29:0] P1_P2_P2_Address;
reg  P1_P2_P2_W_R_n;
reg  P1_P2_P2_D_C_n;
reg  P1_P2_P2_M_IO_n;
reg  P1_P2_P2_ADS_n;
wire [31:0] P1_P2_P2_Datai;
integer P1_P2_P2_Datao;
wire  P1_P2_P2_CLOCK;
wire  P1_P2_P2_NA_n;
wire  P1_P2_P2_BS16_n;
wire  P1_P2_P2_READY_n;
wire  P1_P2_P2_HOLD;
wire  P1_P2_P2_RESET;
reg [3:0] P1_P2_P3_BE_n;
reg [29:0] P1_P2_P3_Address;
reg  P1_P2_P3_W_R_n;
reg  P1_P2_P3_D_C_n;
reg  P1_P2_P3_M_IO_n;
reg  P1_P2_P3_ADS_n;
wire [31:0] P1_P2_P3_Datai;
integer P1_P2_P3_Datao;
wire  P1_P2_P3_CLOCK;
wire  P1_P2_P3_NA_n;
wire  P1_P2_P3_BS16_n;
wire  P1_P2_P3_READY_n;
wire  P1_P2_P3_HOLD;
wire  P1_P2_P3_RESET;
reg [3:0] P2_P1_P1_BE_n;
reg [29:0] P2_P1_P1_Address;
reg  P2_P1_P1_W_R_n;
reg  P2_P1_P1_D_C_n;
reg  P2_P1_P1_M_IO_n;
reg  P2_P1_P1_ADS_n;
wire [31:0] P2_P1_P1_Datai;
integer P2_P1_P1_Datao;
wire  P2_P1_P1_CLOCK;
wire  P2_P1_P1_NA_n;
wire  P2_P1_P1_BS16_n;
wire  P2_P1_P1_READY_n;
wire  P2_P1_P1_HOLD;
wire  P2_P1_P1_RESET;
reg [3:0] P2_P1_P2_BE_n;
reg [29:0] P2_P1_P2_Address;
reg  P2_P1_P2_W_R_n;
reg  P2_P1_P2_D_C_n;
reg  P2_P1_P2_M_IO_n;
reg  P2_P1_P2_ADS_n;
wire [31:0] P2_P1_P2_Datai;
integer P2_P1_P2_Datao;
wire  P2_P1_P2_CLOCK;
wire  P2_P1_P2_NA_n;
wire  P2_P1_P2_BS16_n;
wire  P2_P1_P2_READY_n;
wire  P2_P1_P2_HOLD;
wire  P2_P1_P2_RESET;
reg [3:0] P2_P1_P3_BE_n;
reg [29:0] P2_P1_P3_Address;
reg  P2_P1_P3_W_R_n;
reg  P2_P1_P3_D_C_n;
reg  P2_P1_P3_M_IO_n;
reg  P2_P1_P3_ADS_n;
wire [31:0] P2_P1_P3_Datai;
integer P2_P1_P3_Datao;
wire  P2_P1_P3_CLOCK;
wire  P2_P1_P3_NA_n;
wire  P2_P1_P3_BS16_n;
wire  P2_P1_P3_READY_n;
wire  P2_P1_P3_HOLD;
wire  P2_P1_P3_RESET;
reg [3:0] P2_P2_P1_BE_n;
reg [29:0] P2_P2_P1_Address;
reg  P2_P2_P1_W_R_n;
reg  P2_P2_P1_D_C_n;
reg  P2_P2_P1_M_IO_n;
reg  P2_P2_P1_ADS_n;
wire [31:0] P2_P2_P1_Datai;
integer P2_P2_P1_Datao;
wire  P2_P2_P1_CLOCK;
wire  P2_P2_P1_NA_n;
wire  P2_P2_P1_BS16_n;
wire  P2_P2_P1_READY_n;
wire  P2_P2_P1_HOLD;
wire  P2_P2_P1_RESET;
reg [3:0] P2_P2_P2_BE_n;
reg [29:0] P2_P2_P2_Address;
reg  P2_P2_P2_W_R_n;
reg  P2_P2_P2_D_C_n;
reg  P2_P2_P2_M_IO_n;
reg  P2_P2_P2_ADS_n;
wire [31:0] P2_P2_P2_Datai;
integer P2_P2_P2_Datao;
wire  P2_P2_P2_CLOCK;
wire  P2_P2_P2_NA_n;
wire  P2_P2_P2_BS16_n;
wire  P2_P2_P2_READY_n;
wire  P2_P2_P2_HOLD;
wire  P2_P2_P2_RESET;
reg [3:0] P2_P2_P3_BE_n;
reg [29:0] P2_P2_P3_Address;
reg  P2_P2_P3_W_R_n;
reg  P2_P2_P3_D_C_n;
reg  P2_P2_P3_M_IO_n;
reg  P2_P2_P3_ADS_n;
wire [31:0] P2_P2_P3_Datai;
integer P2_P2_P3_Datao;
wire  P2_P2_P3_CLOCK;
wire  P2_P2_P3_NA_n;
wire  P2_P2_P3_BS16_n;
wire  P2_P2_P3_READY_n;
wire  P2_P2_P3_HOLD;
wire  P2_P2_P3_RESET;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
   reg[7:0] P1_P1_P1_InstQueue [15:0]; 
   reg[4:0] P1_P1_P1_InstQueueRd_Addr ; 
   reg[4:0] P1_P1_P1_InstQueueWr_Addr ; 
 parameter P1_P1_P1_InstQueueLimit =15; 
   integer P1_P1_P1_InstAddrPointer ; 
   integer P1_P1_P1_PhyAddrPointer ; 
   reg P1_P1_P1_Extended ; 
   reg P1_P1_P1_More ; 
   reg P1_P1_P1_Flush ; 
   reg[15:0] P1_P1_P1_lWord ; 
   reg[14:0] P1_P1_P1_uWord ; 
   integer P1_P1_P1_fWord ; 
   reg[3:0] P1_P1_P1_State2 ; 
 parameter P1_P1_P1_Si =0; 
 parameter P1_P1_P1_S1 =1; 
 parameter P1_P1_P1_S2 =2; 
 parameter P1_P1_P1_S3 =3; 
 parameter P1_P1_P1_S4 =4; 
 parameter P1_P1_P1_S5 =5; 
 parameter P1_P1_P1_S6 =6; 
 parameter P1_P1_P1_S7 =7; 
 parameter P1_P1_P1_S8 =8; 
 parameter P1_P1_P1_S9 =9; 
  always @(  posedge   P1_P1_P1_CLOCK or posedge  P1_P1_P1_RESET )
       begin 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P1_P1_P1_CLOCK or posedge  P1_P1_P1_RESET )
       begin 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=8'b0000_0000;
               P1_P1_P1_InstQueue  [1]=8'b0000_0000;
               P1_P1_P1_InstQueue  [2]=8'b0000_0000;
               P1_P1_P1_InstQueue  [3]=8'b0000_0000;
               P1_P1_P1_InstQueue  [4]=8'b0000_0000;
               P1_P1_P1_InstQueue  [5]=8'b0000_0000;
               P1_P1_P1_InstQueue  [6]=8'b0000_0000;
               P1_P1_P1_InstQueue  [7]=8'b0000_0000;
               P1_P1_P1_InstQueue  [8]=8'b0000_0000;
               P1_P1_P1_InstQueue  [9]=8'b0000_0000;
               P1_P1_P1_InstQueue  [10]=8'b0000_0000;
               P1_P1_P1_InstQueue  [11]=8'b0000_0000;
               P1_P1_P1_InstQueue  [12]=8'b0000_0000;
               P1_P1_P1_InstQueue  [13]=8'b0000_0000;
               P1_P1_P1_InstQueue  [14]=8'b0000_0000;
               P1_P1_P1_InstQueue  [15]=8'b0000_0000;
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P1_P1_P1_CLOCK or posedge  P1_P1_P1_RESET )
       begin 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
 
   reg P1_P1_P2_StateNA ; 
   reg P1_P1_P2_StateBS16 ; 
   reg P1_P1_P2_RequestPending ; 
 parameter P1_P1_P2_Pending =1'b1; 
 parameter P1_P1_P2_NotPending =1'b0; 
   reg P1_P1_P2_NonAligned ; 
   reg P1_P1_P2_ReadRequest ; 
   reg P1_P1_P2_MemoryFetch ; 
   reg P1_P1_P2_CodeFetch ; 
   reg[3:0] P1_P1_P2_ByteEnable ; 
   integer P1_P1_P2_DataWidth ; 
 parameter P1_P1_P2_WidthByte =0; 
 parameter P1_P1_P2_WidthWord =1; 
 parameter P1_P1_P2_WidthDword =2; 
   reg[2:0] P1_P1_P2_State ; 
 parameter P1_P1_P2_StateInit =0; 
 parameter P1_P1_P2_StateTi =1; 
 parameter P1_P1_P2_StateT1 =2; 
 parameter P1_P1_P2_StateT2 =3; 
 parameter P1_P1_P2_StateT1P =4; 
 parameter P1_P1_P2_StateTh =5; 
 parameter P1_P1_P2_StateT2P =6; 
 parameter P1_P1_P2_StateT2I =7; 
   integer P1_P1_P2_EAX ; 
   integer P1_P1_P2_EBX ; 
   integer P1_P1_P2_rEIP ; 
 parameter P1_P1_P2_REP =8'hF3; 
 parameter P1_P1_P2_REPNE =8'hF2; 
 parameter P1_P1_P2_LOCK =8'hF0; 
 parameter P1_P1_P2_CSsop =8'h2E; 
 parameter P1_P1_P2_SSsop =8'h36; 
 parameter P1_P1_P2_DSsop =8'h3E; 
 parameter P1_P1_P2_ESsop =8'h26; 
 parameter P1_P1_P2_FSsop =8'h64; 
 parameter P1_P1_P2_GSsop =8'h65; 
 parameter P1_P1_P2_OPsop =8'h66; 
 parameter P1_P1_P2_ADsop =8'h67; 
 parameter P1_P1_P2_MOV_al_b =8'hB0; 
 parameter P1_P1_P2_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P2_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P2_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P2_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P2_IN_al =8'hE4; 
 parameter P1_P1_P2_OUT_al =8'hE6; 
 parameter P1_P1_P2_ADD_al_b =8'h04; 
 parameter P1_P1_P2_ADD_ax_w =8'h05; 
 parameter P1_P1_P2_ROL_eax_b =8'hD1; 
 parameter P1_P1_P2_ROL_al_1 =8'hD0; 
 parameter P1_P1_P2_ROL_al_n =8'hC0; 
 parameter P1_P1_P2_INC_eax =8'h40; 
 parameter P1_P1_P2_INC_ebx =8'h43; 
 parameter P1_P1_P2_JMP_rel_short =8'hEB; 
 parameter P1_P1_P2_JMP_rel_near =8'hE9; 
 parameter P1_P1_P2_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P2_HLT =8'hF4; 
 parameter P1_P1_P2_WAITx =8'h9B; 
 parameter P1_P1_P2_NOP =8'h90; 
   reg[7:0] P1_P1_P2_InstQueue [15:0]; 
   reg[4:0] P1_P1_P2_InstQueueRd_Addr ; 
   reg[4:0] P1_P1_P2_InstQueueWr_Addr ; 
 parameter P1_P1_P2_InstQueueLimit =15; 
   integer P1_P1_P2_InstAddrPointer ; 
   integer P1_P1_P2_PhyAddrPointer ; 
   reg P1_P1_P2_Extended ; 
   reg P1_P1_P2_More ; 
   reg P1_P1_P2_Flush ; 
   reg[15:0] P1_P1_P2_lWord ; 
   reg[14:0] P1_P1_P2_uWord ; 
   integer P1_P1_P2_fWord ; 
   reg[3:0] P1_P1_P2_State2 ; 
 parameter P1_P1_P2_Si =0; 
 parameter P1_P1_P2_S1 =1; 
 parameter P1_P1_P2_S2 =2; 
 parameter P1_P1_P2_S3 =3; 
 parameter P1_P1_P2_S4 =4; 
 parameter P1_P1_P2_S5 =5; 
 parameter P1_P1_P2_S6 =6; 
 parameter P1_P1_P2_S7 =7; 
 parameter P1_P1_P2_S8 =8; 
 parameter P1_P1_P2_S9 =9; 
  always @(  posedge   P1_P1_P2_CLOCK or posedge  P1_P1_P2_RESET )
       begin 
         if ( P1_P1_P2_RESET ==1'b1)
            begin 
               P1_P1_P2_BE_n  <=4'b0000;
               P1_P1_P2_Address  <=0;
               P1_P1_P2_W_R_n  <=1'b0;
               P1_P1_P2_D_C_n  <=1'b0;
               P1_P1_P2_M_IO_n  <=1'b0;
               P1_P1_P2_ADS_n  <=1'b0;
               P1_P1_P2_State  <= P1_P1_P2_StateInit ;
               P1_P1_P2_StateNA  <=1'b0;
               P1_P1_P2_StateBS16  <=1'b0;
               P1_P1_P2_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P2_State )
              P1_P1_P2_StateInit  :
                begin 
                   P1_P1_P2_D_C_n  <=1'b1;
                   P1_P1_P2_ADS_n  <=1'b1;
                   P1_P1_P2_State  <= P1_P1_P2_StateTi ;
                   P1_P1_P2_StateNA  <=1'b1;
                   P1_P1_P2_StateBS16  <=1'b1;
                   P1_P1_P2_DataWidth  <=2;
                   P1_P1_P2_State  <= P1_P1_P2_StateTi ;
                end 
              P1_P1_P2_StateTi  :
                if ( P1_P1_P2_RequestPending == P1_P1_P2_Pending )
                    P1_P1_P2_State  <= P1_P1_P2_StateT1 ;
                 else 
                   if ( P1_P1_P2_HOLD ==1'b1)
                       P1_P1_P2_State  <= P1_P1_P2_StateTh ;
                    else 
                       P1_P1_P2_State  <= P1_P1_P2_StateTi ;
              P1_P1_P2_StateT1  :
                begin 
                   P1_P1_P2_Address  <= P1_P1_P2_rEIP /4%2**30;
                   P1_P1_P2_BE_n  <= P1_P1_P2_ByteEnable ;
                   P1_P1_P2_M_IO_n  <= P1_P1_P2_MemoryFetch ;
                  if ( P1_P1_P2_ReadRequest == P1_P1_P2_Pending )
                      P1_P1_P2_W_R_n  <=1'b0;
                   else 
                      P1_P1_P2_W_R_n  <=1'b1;
                  if ( P1_P1_P2_CodeFetch == P1_P1_P2_Pending )
                      P1_P1_P2_D_C_n  <=1'b0;
                   else 
                      P1_P1_P2_D_C_n  <=1'b1;
                   P1_P1_P2_ADS_n  <=1'b0;
                   P1_P1_P2_State  <= P1_P1_P2_StateT2 ;
                end 
              P1_P1_P2_StateT2  :
                begin 
                  if ( P1_P1_P2_READY_n ==1'b0& P1_P1_P2_HOLD ==1'b0& P1_P1_P2_RequestPending == P1_P1_P2_Pending )
                      P1_P1_P2_State  <= P1_P1_P2_StateT1 ;
                   else 
                     if ( P1_P1_P2_READY_n ==1'b1& P1_P1_P2_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P2_RequestPending == P1_P1_P2_Pending | P1_P1_P2_HOLD ==1'b1)&( P1_P1_P2_READY_n ==1'b1& P1_P1_P2_NA_n ==1'b0))
                            P1_P1_P2_State  <= P1_P1_P2_StateT2I ;
                         else 
                           if ( P1_P1_P2_RequestPending == P1_P1_P2_Pending & P1_P1_P2_HOLD ==1'b0& P1_P1_P2_READY_n ==1'b1& P1_P1_P2_NA_n ==1'b0)
                               P1_P1_P2_State  <= P1_P1_P2_StateT2P ;
                            else 
                              if ( P1_P1_P2_RequestPending == P1_P1_P2_NotPending & P1_P1_P2_HOLD ==1'b0& P1_P1_P2_READY_n ==1'b0)
                                  P1_P1_P2_State  <= P1_P1_P2_StateTi ;
                               else 
                                 if ( P1_P1_P2_HOLD ==1'b1& P1_P1_P2_READY_n ==1'b1)
                                     P1_P1_P2_State  <= P1_P1_P2_StateTh ;
                                  else 
                                     P1_P1_P2_State  <= P1_P1_P2_StateT2 ;
                   P1_P1_P2_StateBS16  <= P1_P1_P2_BS16_n ;
                  if ( P1_P1_P2_BS16_n ==1'b0)
                      P1_P1_P2_DataWidth  <= P1_P1_P2_WidthWord ;
                   else 
                      P1_P1_P2_DataWidth  <= P1_P1_P2_WidthDword ;
                   P1_P1_P2_StateNA  <= P1_P1_P2_NA_n ;
                   P1_P1_P2_ADS_n  <=1'b1;
                end 
              P1_P1_P2_StateT1P  :
                begin 
                  if ( P1_P1_P2_NA_n ==1'b0& P1_P1_P2_HOLD ==1'b0& P1_P1_P2_RequestPending == P1_P1_P2_Pending )
                      P1_P1_P2_State  <= P1_P1_P2_StateT2P ;
                   else 
                     if ( P1_P1_P2_NA_n ==1'b0&( P1_P1_P2_HOLD ==1'b1| P1_P1_P2_RequestPending == P1_P1_P2_NotPending ))
                         P1_P1_P2_State  <= P1_P1_P2_StateT2I ;
                      else 
                        if ( P1_P1_P2_NA_n ==1'b1)
                            P1_P1_P2_State  <= P1_P1_P2_StateT2 ;
                         else 
                            P1_P1_P2_State  <= P1_P1_P2_StateT1P ;
                   P1_P1_P2_StateBS16  <= P1_P1_P2_BS16_n ;
                  if ( P1_P1_P2_BS16_n ==1'b0)
                      P1_P1_P2_DataWidth  <= P1_P1_P2_WidthWord ;
                   else 
                      P1_P1_P2_DataWidth  <= P1_P1_P2_WidthDword ;
                   P1_P1_P2_StateNA  <= P1_P1_P2_NA_n ;
                   P1_P1_P2_ADS_n  <=1'b1;
                end 
              P1_P1_P2_StateTh  :
                if ( P1_P1_P2_HOLD ==1'b0& P1_P1_P2_RequestPending == P1_P1_P2_Pending )
                    P1_P1_P2_State  <= P1_P1_P2_StateT1 ;
                 else 
                   if ( P1_P1_P2_HOLD ==1'b0& P1_P1_P2_RequestPending == P1_P1_P2_NotPending )
                       P1_P1_P2_State  <= P1_P1_P2_StateTi ;
                    else 
                       P1_P1_P2_State  <= P1_P1_P2_StateTh ;
              P1_P1_P2_StateT2P  :
                begin 
                   P1_P1_P2_Address  <= P1_P1_P2_rEIP /2%2**30;
                   P1_P1_P2_BE_n  <= P1_P1_P2_ByteEnable ;
                   P1_P1_P2_M_IO_n  <= P1_P1_P2_MemoryFetch ;
                  if ( P1_P1_P2_ReadRequest == P1_P1_P2_Pending )
                      P1_P1_P2_W_R_n  <=1'b0;
                   else 
                      P1_P1_P2_W_R_n  <=1'b1;
                  if ( P1_P1_P2_CodeFetch == P1_P1_P2_Pending )
                      P1_P1_P2_D_C_n  <=1'b0;
                   else 
                      P1_P1_P2_D_C_n  <=1'b1;
                   P1_P1_P2_ADS_n  <=1'b0;
                  if ( P1_P1_P2_READY_n ==1'b0)
                      P1_P1_P2_State  <= P1_P1_P2_StateT1P ;
                   else 
                      P1_P1_P2_State  <= P1_P1_P2_StateT2P ;
                end 
              P1_P1_P2_StateT2I  :
                if ( P1_P1_P2_READY_n ==1'b1& P1_P1_P2_RequestPending == P1_P1_P2_Pending & P1_P1_P2_HOLD ==1'b0)
                    P1_P1_P2_State  <= P1_P1_P2_StateT2P ;
                 else 
                   if ( P1_P1_P2_READY_n ==1'b0& P1_P1_P2_HOLD ==1'b1)
                       P1_P1_P2_State  <= P1_P1_P2_StateTh ;
                    else 
                      if ( P1_P1_P2_READY_n ==1'b0& P1_P1_P2_HOLD ==1'b0& P1_P1_P2_RequestPending == P1_P1_P2_Pending )
                          P1_P1_P2_State  <= P1_P1_P2_StateT1 ;
                       else 
                         if ( P1_P1_P2_READY_n ==1'b0& P1_P1_P2_HOLD ==1'b0& P1_P1_P2_RequestPending == P1_P1_P2_NotPending )
                             P1_P1_P2_State  <= P1_P1_P2_StateTi ;
                          else 
                             P1_P1_P2_State  <= P1_P1_P2_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P1_P1_P2_CLOCK or posedge  P1_P1_P2_RESET )
       begin 
         if ( P1_P1_P2_RESET ==1'b1)
            begin 
               P1_P1_P2_State2  = P1_P1_P2_Si ;
               P1_P1_P2_InstQueue  [0]=8'b0000_0000;
               P1_P1_P2_InstQueue  [1]=8'b0000_0000;
               P1_P1_P2_InstQueue  [2]=8'b0000_0000;
               P1_P1_P2_InstQueue  [3]=8'b0000_0000;
               P1_P1_P2_InstQueue  [4]=8'b0000_0000;
               P1_P1_P2_InstQueue  [5]=8'b0000_0000;
               P1_P1_P2_InstQueue  [6]=8'b0000_0000;
               P1_P1_P2_InstQueue  [7]=8'b0000_0000;
               P1_P1_P2_InstQueue  [8]=8'b0000_0000;
               P1_P1_P2_InstQueue  [9]=8'b0000_0000;
               P1_P1_P2_InstQueue  [10]=8'b0000_0000;
               P1_P1_P2_InstQueue  [11]=8'b0000_0000;
               P1_P1_P2_InstQueue  [12]=8'b0000_0000;
               P1_P1_P2_InstQueue  [13]=8'b0000_0000;
               P1_P1_P2_InstQueue  [14]=8'b0000_0000;
               P1_P1_P2_InstQueue  [15]=8'b0000_0000;
               P1_P1_P2_InstQueueRd_Addr  =0;
               P1_P1_P2_InstQueueWr_Addr  =0;
               P1_P1_P2_InstAddrPointer  =0;
               P1_P1_P2_PhyAddrPointer  =0;
               P1_P1_P2_Extended  =1'b0;
               P1_P1_P2_More  =1'b0;
               P1_P1_P2_Flush  =1'b0;
               P1_P1_P2_lWord  =0;
               P1_P1_P2_uWord  =0;
               P1_P1_P2_fWord  =0;
               P1_P1_P2_CodeFetch  <=1'b0;
               P1_P1_P2_Datao  <=0;
               P1_P1_P2_EAX  <=0;
               P1_P1_P2_EBX  <=0;
               P1_P1_P2_rEIP  <=0;
               P1_P1_P2_ReadRequest  <=1'b0;
               P1_P1_P2_MemoryFetch  <=1'b0;
               P1_P1_P2_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P2_State2 )
              P1_P1_P2_Si  :
                begin 
                   P1_P1_P2_PhyAddrPointer  = P1_P1_P2_rEIP ;
                   P1_P1_P2_InstAddrPointer  = P1_P1_P2_PhyAddrPointer ;
                   P1_P1_P2_State2  = P1_P1_P2_S1 ;
                   P1_P1_P2_rEIP  <=20'hFFFF0;
                   P1_P1_P2_ReadRequest  <=1'b1;
                   P1_P1_P2_MemoryFetch  <=1'b1;
                   P1_P1_P2_RequestPending  <=1'b1;
                end 
              P1_P1_P2_S1  :
                begin 
                   P1_P1_P2_RequestPending  <= P1_P1_P2_Pending ;
                   P1_P1_P2_ReadRequest  <= P1_P1_P2_Pending ;
                   P1_P1_P2_MemoryFetch  <= P1_P1_P2_Pending ;
                   P1_P1_P2_CodeFetch  <= P1_P1_P2_Pending ;
                  if ( P1_P1_P2_READY_n ==1'b0)
                      P1_P1_P2_State2  = P1_P1_P2_S2 ;
                   else 
                      P1_P1_P2_State2  = P1_P1_P2_S1 ;
                end 
              P1_P1_P2_S2  :
                begin 
                   P1_P1_P2_RequestPending  <= P1_P1_P2_NotPending ;
                   P1_P1_P2_InstQueue  [ P1_P1_P2_InstQueueWr_Addr ]= P1_P1_P2_Datai %(2**8);
                   P1_P1_P2_InstQueueWr_Addr  =( P1_P1_P2_InstQueueWr_Addr +1)%16;
                   P1_P1_P2_InstQueue  [ P1_P1_P2_InstQueueWr_Addr ]= P1_P1_P2_Datai %2**8;
                   P1_P1_P2_InstQueueWr_Addr  =( P1_P1_P2_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P2_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P2_InstQueue  [ P1_P1_P2_InstQueueWr_Addr ]=( P1_P1_P2_Datai /(2**16))%(2**8);
                        P1_P1_P2_InstQueueWr_Addr  =( P1_P1_P2_InstQueueWr_Addr +1)%16;
                        P1_P1_P2_InstQueue  [ P1_P1_P2_InstQueueWr_Addr ]=( P1_P1_P2_Datai /(2**24))%(2**8);
                        P1_P1_P2_InstQueueWr_Addr  =( P1_P1_P2_InstQueueWr_Addr +1)%16;
                        P1_P1_P2_PhyAddrPointer  = P1_P1_P2_PhyAddrPointer +4;
                        P1_P1_P2_State2  = P1_P1_P2_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P2_PhyAddrPointer  = P1_P1_P2_PhyAddrPointer +2;
                       if ( P1_P1_P2_PhyAddrPointer <0)
                           P1_P1_P2_rEIP  <=- P1_P1_P2_PhyAddrPointer ;
                        else 
                           P1_P1_P2_rEIP  <= P1_P1_P2_PhyAddrPointer ;
                        P1_P1_P2_State2  = P1_P1_P2_S3 ;
                     end 
                end 
              P1_P1_P2_S3  :
                begin 
                   P1_P1_P2_RequestPending  <= P1_P1_P2_Pending ;
                  if ( P1_P1_P2_READY_n ==1'b0)
                      P1_P1_P2_State2  = P1_P1_P2_S4 ;
                   else 
                      P1_P1_P2_State2  = P1_P1_P2_S3 ;
                end 
              P1_P1_P2_S4  :
                begin 
                   P1_P1_P2_RequestPending  <= P1_P1_P2_NotPending ;
                   P1_P1_P2_InstQueue  [ P1_P1_P2_InstQueueWr_Addr ]= P1_P1_P2_Datai %(2**8);
                   P1_P1_P2_InstQueueWr_Addr  =( P1_P1_P2_InstQueueWr_Addr +1)%16;
                   P1_P1_P2_InstQueue  [ P1_P1_P2_InstQueueWr_Addr ]= P1_P1_P2_Datai %(2**8);
                   P1_P1_P2_InstQueueWr_Addr  =( P1_P1_P2_InstQueueWr_Addr +1)%16;
                   P1_P1_P2_PhyAddrPointer  = P1_P1_P2_PhyAddrPointer +2;
                   P1_P1_P2_State2  = P1_P1_P2_S5 ;
                end 
              P1_P1_P2_S5  :
                begin 
                  case ( P1_P1_P2_InstQueue [ P1_P1_P2_InstQueueRd_Addr ])
                    P1_P1_P2_NOP  :
                      begin 
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +1;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +1)%16;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                    P1_P1_P2_OPsop  :
                      begin 
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +1;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +1)%16;
                         P1_P1_P2_Extended  =1'b1;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                    P1_P1_P2_JMP_rel_short  :
                      if (( P1_P1_P2_InstQueueWr_Addr - P1_P1_P2_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P2_PhyAddrPointer  = P1_P1_P2_InstAddrPointer +1-(8'hFF- P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P2_InstAddrPointer  = P1_P1_P2_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P2_PhyAddrPointer  = P1_P1_P2_InstAddrPointer +2+ P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +1)%16];
                                 P1_P1_P2_InstAddrPointer  = P1_P1_P2_PhyAddrPointer ;
                              end 
                            P1_P1_P2_Flush  =1'b1;
                            P1_P1_P2_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P2_Flush  =1'b0;
                            P1_P1_P2_More  =1'b1;
                         end 
                    P1_P1_P2_JMP_rel_near  :
                      if (( P1_P1_P2_InstQueueWr_Addr - P1_P1_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P2_PhyAddrPointer  = P1_P1_P2_InstAddrPointer +5+ P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +1)%16];
                            P1_P1_P2_InstAddrPointer  = P1_P1_P2_PhyAddrPointer ;
                            P1_P1_P2_Flush  =1'b1;
                            P1_P1_P2_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P2_Flush  =1'b0;
                            P1_P1_P2_More  =1'b1;
                         end 
                    P1_P1_P2_JMP_intseg_immed  :
                      begin 
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +1;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +1)%16;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                    P1_P1_P2_MOV_al_b  :
                      begin 
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +1;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +1)%16;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                    P1_P1_P2_MOV_eax_dw  :
                      if (( P1_P1_P2_InstQueueWr_Addr - P1_P1_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P2_EAX  <= P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +1)%16];
                            P1_P1_P2_More  =1'b0;
                            P1_P1_P2_Flush  =1'b0;
                            P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +5;
                            P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P2_Flush  =1'b0;
                            P1_P1_P2_More  =1'b1;
                         end 
                    P1_P1_P2_MOV_ebx_dw  :
                      if (( P1_P1_P2_InstQueueWr_Addr - P1_P1_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P2_EBX  <= P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P2_InstQueue [( P1_P1_P2_InstQueueRd_Addr +1)%1];
                            P1_P1_P2_More  =1'b0;
                            P1_P1_P2_Flush  =1'b0;
                            P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +5;
                            P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P2_Flush  =1'b0;
                            P1_P1_P2_More  =1'b1;
                         end 
                    P1_P1_P2_MOV_eax_ebx  :
                      if (( P1_P1_P2_InstQueueWr_Addr - P1_P1_P2_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P2_EBX <0)
                               P1_P1_P2_rEIP  <=- P1_P1_P2_EBX ;
                            else 
                               P1_P1_P2_rEIP  <= P1_P1_P2_EBX ;
                            P1_P1_P2_RequestPending  <= P1_P1_P2_Pending ;
                            P1_P1_P2_ReadRequest  <= P1_P1_P2_Pending ;
                            P1_P1_P2_MemoryFetch  <= P1_P1_P2_Pending ;
                            P1_P1_P2_CodeFetch  <= P1_P1_P2_NotPending ;
                           if ( P1_P1_P2_READY_n ==1'b0)
                              begin 
                                 P1_P1_P2_RequestPending  <= P1_P1_P2_NotPending ;
                                 P1_P1_P2_uWord  = P1_P1_P2_Datai %(2**15);
                                if ( P1_P1_P2_StateBS16 ==1'b1)
                                    P1_P1_P2_lWord  = P1_P1_P2_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P2_rEIP  <= P1_P1_P2_rEIP +2;
                                      P1_P1_P2_RequestPending  <= P1_P1_P2_Pending ;
                                     if ( P1_P1_P2_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P2_RequestPending  <= P1_P1_P2_NotPending ;
                                           P1_P1_P2_lWord  = P1_P1_P2_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P2_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P2_EAX  <= P1_P1_P2_uWord *(2**16)+ P1_P1_P2_lWord ;
                                      P1_P1_P2_More  =1'b0;
                                      P1_P1_P2_Flush  =1'b0;
                                      P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +2;
                                      P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P2_Flush  =1'b0;
                            P1_P1_P2_More  =1'b1;
                         end 
                    P1_P1_P2_MOV_ebx_eax  :
                      if (( P1_P1_P2_InstQueueWr_Addr - P1_P1_P2_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P2_EBX <0)
                               P1_P1_P2_rEIP  <= P1_P1_P2_EBX ;
                            else 
                               P1_P1_P2_rEIP  <= P1_P1_P2_EBX ;
                            P1_P1_P2_lWord  = P1_P1_P2_EAX %(2**16);
                            P1_P1_P2_uWord  =( P1_P1_P2_EAX /(2**16))%(2**15);
                            P1_P1_P2_RequestPending  <= P1_P1_P2_Pending ;
                            P1_P1_P2_ReadRequest  <= P1_P1_P2_NotPending ;
                            P1_P1_P2_MemoryFetch  <= P1_P1_P2_Pending ;
                            P1_P1_P2_CodeFetch  <= P1_P1_P2_NotPending ;
                           if ( P1_P1_P2_State == P1_P1_P2_StateT1 | P1_P1_P2_State == P1_P1_P2_StateT1P )
                              begin 
                                 P1_P1_P2_Datao  <=( P1_P1_P2_uWord *(2**16)+ P1_P1_P2_lWord );
                                if ( P1_P1_P2_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P2_RequestPending  <= P1_P1_P2_NotPending ;
                                     if ( P1_P1_P2_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P2_rEIP  <= P1_P1_P2_rEIP +2;
                                           P1_P1_P2_RequestPending  <= P1_P1_P2_Pending ;
                                           P1_P1_P2_ReadRequest  <= P1_P1_P2_NotPending ;
                                           P1_P1_P2_MemoryFetch  <= P1_P1_P2_Pending ;
                                           P1_P1_P2_CodeFetch  <= P1_P1_P2_NotPending ;
                                           P1_P1_P2_State2  = P1_P1_P2_S6 ;
                                        end 
                                      P1_P1_P2_More  =1'b0;
                                      P1_P1_P2_Flush  =1'b0;
                                      P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +2;
                                      P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P2_Flush  =1'b0;
                            P1_P1_P2_More  =1'b1;
                         end 
                    P1_P1_P2_IN_al  :
                      if (( P1_P1_P2_InstQueueWr_Addr - P1_P1_P2_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P2_rEIP  <= P1_P1_P2_InstQueueRd_Addr +1;
                            P1_P1_P2_RequestPending  <= P1_P1_P2_Pending ;
                            P1_P1_P2_ReadRequest  <= P1_P1_P2_Pending ;
                            P1_P1_P2_MemoryFetch  <= P1_P1_P2_NotPending ;
                            P1_P1_P2_CodeFetch  <= P1_P1_P2_NotPending ;
                           if ( P1_P1_P2_READY_n ==1'b0)
                              begin 
                                 P1_P1_P2_RequestPending  <= P1_P1_P2_NotPending ;
                                 P1_P1_P2_EAX  <= P1_P1_P2_Datai ;
                                 P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +2;
                                 P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +2);
                                 P1_P1_P2_Flush  =1'b0;
                                 P1_P1_P2_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P2_Flush  =1'b0;
                            P1_P1_P2_More  =1'b1;
                         end 
                    P1_P1_P2_OUT_al  :
                      if (( P1_P1_P2_InstQueueWr_Addr - P1_P1_P2_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P2_rEIP  <= P1_P1_P2_InstQueueRd_Addr +1;
                            P1_P1_P2_RequestPending  <= P1_P1_P2_Pending ;
                            P1_P1_P2_ReadRequest  <= P1_P1_P2_NotPending ;
                            P1_P1_P2_MemoryFetch  <= P1_P1_P2_NotPending ;
                            P1_P1_P2_CodeFetch  <= P1_P1_P2_NotPending ;
                           if ( P1_P1_P2_State == P1_P1_P2_StateT1 | P1_P1_P2_State == P1_P1_P2_StateT1P )
                              begin 
                                 P1_P1_P2_fWord  = P1_P1_P2_EAX %(2**16);
                                 P1_P1_P2_Datao  <= P1_P1_P2_fWord ;
                                if ( P1_P1_P2_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P2_RequestPending  <= P1_P1_P2_NotPending ;
                                      P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +2;
                                      P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +2)%16;
                                      P1_P1_P2_Flush  =1'b0;
                                      P1_P1_P2_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P2_Flush  =1'b0;
                            P1_P1_P2_More  =1'b1;
                         end 
                    P1_P1_P2_ADD_al_b  :
                      begin 
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +1;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +1)%16;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                    P1_P1_P2_ADD_ax_w  :
                      begin 
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +1;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +1)%16;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                    P1_P1_P2_ROL_al_1  :
                      begin 
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +2;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +2)%16;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                    P1_P1_P2_ROL_al_n  :
                      begin 
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +2;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +2)%16;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                    P1_P1_P2_INC_eax  :
                      begin 
                         P1_P1_P2_EAX  <= P1_P1_P2_EAX +1;
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +1;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +1)%16;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                    P1_P1_P2_INC_ebx  :
                      begin 
                         P1_P1_P2_EBX  <= P1_P1_P2_EBX +1;
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +1;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +1)%16;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P2_InstAddrPointer  = P1_P1_P2_InstAddrPointer +1;
                         P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +1)%16;
                         P1_P1_P2_Flush  =1'b0;
                         P1_P1_P2_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P2_InstQueueRd_Addr < P1_P1_P2_InstQueueWr_Addr ))|((( P1_P1_P2_InstQueueLimit - P1_P1_P2_InstQueueRd_Addr )<4)| P1_P1_P2_Flush | P1_P1_P2_More ))
                      P1_P1_P2_State2  = P1_P1_P2_S7 ;
                end 
              P1_P1_P2_S6  :
                begin 
                   P1_P1_P2_Datao  <=( P1_P1_P2_uWord *(2**16)+ P1_P1_P2_lWord );
                  if ( P1_P1_P2_READY_n ==1'b0)
                     begin 
                        P1_P1_P2_RequestPending  <= P1_P1_P2_NotPending ;
                        P1_P1_P2_State2  = P1_P1_P2_S5 ;
                     end 
                end 
              P1_P1_P2_S7  :
                begin 
                  if ( P1_P1_P2_Flush )
                     begin 
                        P1_P1_P2_InstQueueRd_Addr  =1;
                        P1_P1_P2_InstQueueWr_Addr  =1;
                       if ( P1_P1_P2_InstAddrPointer <0)
                           P1_P1_P2_fWord  =- P1_P1_P2_InstAddrPointer ;
                        else 
                           P1_P1_P2_fWord  = P1_P1_P2_InstAddrPointer ;
                       if ( P1_P1_P2_fWord %2==1)
                           P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr + P1_P1_P2_fWord %4)%16;
                     end 
                  if (( P1_P1_P2_InstQueueLimit - P1_P1_P2_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P2_State2  = P1_P1_P2_S8 ;
                        P1_P1_P2_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P2_State2  = P1_P1_P2_S9 ;
                end 
              P1_P1_P2_S8  :
                if ( P1_P1_P2_InstQueueRd_Addr <= P1_P1_P2_InstQueueLimit )
                   begin 
                      P1_P1_P2_InstQueue  [ P1_P1_P2_InstQueueWr_Addr ]= P1_P1_P2_InstQueue [ P1_P1_P2_InstQueueRd_Addr ];
                      P1_P1_P2_InstQueueRd_Addr  =( P1_P1_P2_InstQueueRd_Addr +1)%16;
                      P1_P1_P2_InstQueueWr_Addr  =( P1_P1_P2_InstQueueWr_Addr +1)%16;
                      P1_P1_P2_State2  = P1_P1_P2_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P2_InstQueueRd_Addr  =0;
                      P1_P1_P2_State2  = P1_P1_P2_S9 ;
                   end 
              P1_P1_P2_S9  :
                begin 
                   P1_P1_P2_rEIP  <= P1_P1_P2_PhyAddrPointer ;
                   P1_P1_P2_State2  = P1_P1_P2_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P1_P1_P2_CLOCK or posedge  P1_P1_P2_RESET )
       begin 
         if ( P1_P1_P2_RESET ==1'b1)
            begin 
               P1_P1_P2_ByteEnable  <=4'b0000;
               P1_P1_P2_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P2_DataWidth )
              P1_P1_P2_WidthByte  :
                case ( P1_P1_P2_rEIP %4)
                 0 :
                     P1_P1_P2_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P2_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P2_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P2_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P2_WidthWord  :
                case ( P1_P1_P2_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P2_ByteEnable  <=4'b1100;
                       P1_P1_P2_NonAligned  <= P1_P1_P2_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P2_ByteEnable  <=4'b1001;
                       P1_P1_P2_NonAligned  <= P1_P1_P2_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P2_ByteEnable  <=4'b0011;
                       P1_P1_P2_NonAligned  <= P1_P1_P2_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P2_ByteEnable  <=4'b0111;
                       P1_P1_P2_NonAligned  <= P1_P1_P2_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P2_WidthDword  :
                case ( P1_P1_P2_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P2_ByteEnable  <=4'b0000;
                       P1_P1_P2_NonAligned  <= P1_P1_P2_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P2_ByteEnable  <=4'b0001;
                       P1_P1_P2_NonAligned  <= P1_P1_P2_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P2_NonAligned  <= P1_P1_P2_Pending ;
                       P1_P1_P2_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P2_NonAligned  <= P1_P1_P2_Pending ;
                       P1_P1_P2_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
 
   reg P1_P1_P3_StateNA ; 
   reg P1_P1_P3_StateBS16 ; 
   reg P1_P1_P3_RequestPending ; 
 parameter P1_P1_P3_Pending =1'b1; 
 parameter P1_P1_P3_NotPending =1'b0; 
   reg P1_P1_P3_NonAligned ; 
   reg P1_P1_P3_ReadRequest ; 
   reg P1_P1_P3_MemoryFetch ; 
   reg P1_P1_P3_CodeFetch ; 
   reg[3:0] P1_P1_P3_ByteEnable ; 
   integer P1_P1_P3_DataWidth ; 
 parameter P1_P1_P3_WidthByte =0; 
 parameter P1_P1_P3_WidthWord =1; 
 parameter P1_P1_P3_WidthDword =2; 
   reg[2:0] P1_P1_P3_State ; 
 parameter P1_P1_P3_StateInit =0; 
 parameter P1_P1_P3_StateTi =1; 
 parameter P1_P1_P3_StateT1 =2; 
 parameter P1_P1_P3_StateT2 =3; 
 parameter P1_P1_P3_StateT1P =4; 
 parameter P1_P1_P3_StateTh =5; 
 parameter P1_P1_P3_StateT2P =6; 
 parameter P1_P1_P3_StateT2I =7; 
   integer P1_P1_P3_EAX ; 
   integer P1_P1_P3_EBX ; 
   integer P1_P1_P3_rEIP ; 
 parameter P1_P1_P3_REP =8'hF3; 
 parameter P1_P1_P3_REPNE =8'hF2; 
 parameter P1_P1_P3_LOCK =8'hF0; 
 parameter P1_P1_P3_CSsop =8'h2E; 
 parameter P1_P1_P3_SSsop =8'h36; 
 parameter P1_P1_P3_DSsop =8'h3E; 
 parameter P1_P1_P3_ESsop =8'h26; 
 parameter P1_P1_P3_FSsop =8'h64; 
 parameter P1_P1_P3_GSsop =8'h65; 
 parameter P1_P1_P3_OPsop =8'h66; 
 parameter P1_P1_P3_ADsop =8'h67; 
 parameter P1_P1_P3_MOV_al_b =8'hB0; 
 parameter P1_P1_P3_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P3_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P3_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P3_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P3_IN_al =8'hE4; 
 parameter P1_P1_P3_OUT_al =8'hE6; 
 parameter P1_P1_P3_ADD_al_b =8'h04; 
 parameter P1_P1_P3_ADD_ax_w =8'h05; 
 parameter P1_P1_P3_ROL_eax_b =8'hD1; 
 parameter P1_P1_P3_ROL_al_1 =8'hD0; 
 parameter P1_P1_P3_ROL_al_n =8'hC0; 
 parameter P1_P1_P3_INC_eax =8'h40; 
 parameter P1_P1_P3_INC_ebx =8'h43; 
 parameter P1_P1_P3_JMP_rel_short =8'hEB; 
 parameter P1_P1_P3_JMP_rel_near =8'hE9; 
 parameter P1_P1_P3_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P3_HLT =8'hF4; 
 parameter P1_P1_P3_WAITx =8'h9B; 
 parameter P1_P1_P3_NOP =8'h90; 
   reg[7:0] P1_P1_P3_InstQueue [15:0]; 
   reg[4:0] P1_P1_P3_InstQueueRd_Addr ; 
   reg[4:0] P1_P1_P3_InstQueueWr_Addr ; 
 parameter P1_P1_P3_InstQueueLimit =15; 
   integer P1_P1_P3_InstAddrPointer ; 
   integer P1_P1_P3_PhyAddrPointer ; 
   reg P1_P1_P3_Extended ; 
   reg P1_P1_P3_More ; 
   reg P1_P1_P3_Flush ; 
   reg[15:0] P1_P1_P3_lWord ; 
   reg[14:0] P1_P1_P3_uWord ; 
   integer P1_P1_P3_fWord ; 
   reg[3:0] P1_P1_P3_State2 ; 
 parameter P1_P1_P3_Si =0; 
 parameter P1_P1_P3_S1 =1; 
 parameter P1_P1_P3_S2 =2; 
 parameter P1_P1_P3_S3 =3; 
 parameter P1_P1_P3_S4 =4; 
 parameter P1_P1_P3_S5 =5; 
 parameter P1_P1_P3_S6 =6; 
 parameter P1_P1_P3_S7 =7; 
 parameter P1_P1_P3_S8 =8; 
 parameter P1_P1_P3_S9 =9; 
  always @(  posedge   P1_P1_P3_CLOCK or posedge  P1_P1_P3_RESET )
       begin 
         if ( P1_P1_P3_RESET ==1'b1)
            begin 
               P1_P1_P3_BE_n  <=4'b0000;
               P1_P1_P3_Address  <=0;
               P1_P1_P3_W_R_n  <=1'b0;
               P1_P1_P3_D_C_n  <=1'b0;
               P1_P1_P3_M_IO_n  <=1'b0;
               P1_P1_P3_ADS_n  <=1'b0;
               P1_P1_P3_State  <= P1_P1_P3_StateInit ;
               P1_P1_P3_StateNA  <=1'b0;
               P1_P1_P3_StateBS16  <=1'b0;
               P1_P1_P3_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P3_State )
              P1_P1_P3_StateInit  :
                begin 
                   P1_P1_P3_D_C_n  <=1'b1;
                   P1_P1_P3_ADS_n  <=1'b1;
                   P1_P1_P3_State  <= P1_P1_P3_StateTi ;
                   P1_P1_P3_StateNA  <=1'b1;
                   P1_P1_P3_StateBS16  <=1'b1;
                   P1_P1_P3_DataWidth  <=2;
                   P1_P1_P3_State  <= P1_P1_P3_StateTi ;
                end 
              P1_P1_P3_StateTi  :
                if ( P1_P1_P3_RequestPending == P1_P1_P3_Pending )
                    P1_P1_P3_State  <= P1_P1_P3_StateT1 ;
                 else 
                   if ( P1_P1_P3_HOLD ==1'b1)
                       P1_P1_P3_State  <= P1_P1_P3_StateTh ;
                    else 
                       P1_P1_P3_State  <= P1_P1_P3_StateTi ;
              P1_P1_P3_StateT1  :
                begin 
                   P1_P1_P3_Address  <= P1_P1_P3_rEIP /4%2**30;
                   P1_P1_P3_BE_n  <= P1_P1_P3_ByteEnable ;
                   P1_P1_P3_M_IO_n  <= P1_P1_P3_MemoryFetch ;
                  if ( P1_P1_P3_ReadRequest == P1_P1_P3_Pending )
                      P1_P1_P3_W_R_n  <=1'b0;
                   else 
                      P1_P1_P3_W_R_n  <=1'b1;
                  if ( P1_P1_P3_CodeFetch == P1_P1_P3_Pending )
                      P1_P1_P3_D_C_n  <=1'b0;
                   else 
                      P1_P1_P3_D_C_n  <=1'b1;
                   P1_P1_P3_ADS_n  <=1'b0;
                   P1_P1_P3_State  <= P1_P1_P3_StateT2 ;
                end 
              P1_P1_P3_StateT2  :
                begin 
                  if ( P1_P1_P3_READY_n ==1'b0& P1_P1_P3_HOLD ==1'b0& P1_P1_P3_RequestPending == P1_P1_P3_Pending )
                      P1_P1_P3_State  <= P1_P1_P3_StateT1 ;
                   else 
                     if ( P1_P1_P3_READY_n ==1'b1& P1_P1_P3_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P3_RequestPending == P1_P1_P3_Pending | P1_P1_P3_HOLD ==1'b1)&( P1_P1_P3_READY_n ==1'b1& P1_P1_P3_NA_n ==1'b0))
                            P1_P1_P3_State  <= P1_P1_P3_StateT2I ;
                         else 
                           if ( P1_P1_P3_RequestPending == P1_P1_P3_Pending & P1_P1_P3_HOLD ==1'b0& P1_P1_P3_READY_n ==1'b1& P1_P1_P3_NA_n ==1'b0)
                               P1_P1_P3_State  <= P1_P1_P3_StateT2P ;
                            else 
                              if ( P1_P1_P3_RequestPending == P1_P1_P3_NotPending & P1_P1_P3_HOLD ==1'b0& P1_P1_P3_READY_n ==1'b0)
                                  P1_P1_P3_State  <= P1_P1_P3_StateTi ;
                               else 
                                 if ( P1_P1_P3_HOLD ==1'b1& P1_P1_P3_READY_n ==1'b1)
                                     P1_P1_P3_State  <= P1_P1_P3_StateTh ;
                                  else 
                                     P1_P1_P3_State  <= P1_P1_P3_StateT2 ;
                   P1_P1_P3_StateBS16  <= P1_P1_P3_BS16_n ;
                  if ( P1_P1_P3_BS16_n ==1'b0)
                      P1_P1_P3_DataWidth  <= P1_P1_P3_WidthWord ;
                   else 
                      P1_P1_P3_DataWidth  <= P1_P1_P3_WidthDword ;
                   P1_P1_P3_StateNA  <= P1_P1_P3_NA_n ;
                   P1_P1_P3_ADS_n  <=1'b1;
                end 
              P1_P1_P3_StateT1P  :
                begin 
                  if ( P1_P1_P3_NA_n ==1'b0& P1_P1_P3_HOLD ==1'b0& P1_P1_P3_RequestPending == P1_P1_P3_Pending )
                      P1_P1_P3_State  <= P1_P1_P3_StateT2P ;
                   else 
                     if ( P1_P1_P3_NA_n ==1'b0&( P1_P1_P3_HOLD ==1'b1| P1_P1_P3_RequestPending == P1_P1_P3_NotPending ))
                         P1_P1_P3_State  <= P1_P1_P3_StateT2I ;
                      else 
                        if ( P1_P1_P3_NA_n ==1'b1)
                            P1_P1_P3_State  <= P1_P1_P3_StateT2 ;
                         else 
                            P1_P1_P3_State  <= P1_P1_P3_StateT1P ;
                   P1_P1_P3_StateBS16  <= P1_P1_P3_BS16_n ;
                  if ( P1_P1_P3_BS16_n ==1'b0)
                      P1_P1_P3_DataWidth  <= P1_P1_P3_WidthWord ;
                   else 
                      P1_P1_P3_DataWidth  <= P1_P1_P3_WidthDword ;
                   P1_P1_P3_StateNA  <= P1_P1_P3_NA_n ;
                   P1_P1_P3_ADS_n  <=1'b1;
                end 
              P1_P1_P3_StateTh  :
                if ( P1_P1_P3_HOLD ==1'b0& P1_P1_P3_RequestPending == P1_P1_P3_Pending )
                    P1_P1_P3_State  <= P1_P1_P3_StateT1 ;
                 else 
                   if ( P1_P1_P3_HOLD ==1'b0& P1_P1_P3_RequestPending == P1_P1_P3_NotPending )
                       P1_P1_P3_State  <= P1_P1_P3_StateTi ;
                    else 
                       P1_P1_P3_State  <= P1_P1_P3_StateTh ;
              P1_P1_P3_StateT2P  :
                begin 
                   P1_P1_P3_Address  <= P1_P1_P3_rEIP /2%2**30;
                   P1_P1_P3_BE_n  <= P1_P1_P3_ByteEnable ;
                   P1_P1_P3_M_IO_n  <= P1_P1_P3_MemoryFetch ;
                  if ( P1_P1_P3_ReadRequest == P1_P1_P3_Pending )
                      P1_P1_P3_W_R_n  <=1'b0;
                   else 
                      P1_P1_P3_W_R_n  <=1'b1;
                  if ( P1_P1_P3_CodeFetch == P1_P1_P3_Pending )
                      P1_P1_P3_D_C_n  <=1'b0;
                   else 
                      P1_P1_P3_D_C_n  <=1'b1;
                   P1_P1_P3_ADS_n  <=1'b0;
                  if ( P1_P1_P3_READY_n ==1'b0)
                      P1_P1_P3_State  <= P1_P1_P3_StateT1P ;
                   else 
                      P1_P1_P3_State  <= P1_P1_P3_StateT2P ;
                end 
              P1_P1_P3_StateT2I  :
                if ( P1_P1_P3_READY_n ==1'b1& P1_P1_P3_RequestPending == P1_P1_P3_Pending & P1_P1_P3_HOLD ==1'b0)
                    P1_P1_P3_State  <= P1_P1_P3_StateT2P ;
                 else 
                   if ( P1_P1_P3_READY_n ==1'b0& P1_P1_P3_HOLD ==1'b1)
                       P1_P1_P3_State  <= P1_P1_P3_StateTh ;
                    else 
                      if ( P1_P1_P3_READY_n ==1'b0& P1_P1_P3_HOLD ==1'b0& P1_P1_P3_RequestPending == P1_P1_P3_Pending )
                          P1_P1_P3_State  <= P1_P1_P3_StateT1 ;
                       else 
                         if ( P1_P1_P3_READY_n ==1'b0& P1_P1_P3_HOLD ==1'b0& P1_P1_P3_RequestPending == P1_P1_P3_NotPending )
                             P1_P1_P3_State  <= P1_P1_P3_StateTi ;
                          else 
                             P1_P1_P3_State  <= P1_P1_P3_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P1_P1_P3_CLOCK or posedge  P1_P1_P3_RESET )
       begin 
         if ( P1_P1_P3_RESET ==1'b1)
            begin 
               P1_P1_P3_State2  = P1_P1_P3_Si ;
               P1_P1_P3_InstQueue  [0]=8'b0000_0000;
               P1_P1_P3_InstQueue  [1]=8'b0000_0000;
               P1_P1_P3_InstQueue  [2]=8'b0000_0000;
               P1_P1_P3_InstQueue  [3]=8'b0000_0000;
               P1_P1_P3_InstQueue  [4]=8'b0000_0000;
               P1_P1_P3_InstQueue  [5]=8'b0000_0000;
               P1_P1_P3_InstQueue  [6]=8'b0000_0000;
               P1_P1_P3_InstQueue  [7]=8'b0000_0000;
               P1_P1_P3_InstQueue  [8]=8'b0000_0000;
               P1_P1_P3_InstQueue  [9]=8'b0000_0000;
               P1_P1_P3_InstQueue  [10]=8'b0000_0000;
               P1_P1_P3_InstQueue  [11]=8'b0000_0000;
               P1_P1_P3_InstQueue  [12]=8'b0000_0000;
               P1_P1_P3_InstQueue  [13]=8'b0000_0000;
               P1_P1_P3_InstQueue  [14]=8'b0000_0000;
               P1_P1_P3_InstQueue  [15]=8'b0000_0000;
               P1_P1_P3_InstQueueRd_Addr  =0;
               P1_P1_P3_InstQueueWr_Addr  =0;
               P1_P1_P3_InstAddrPointer  =0;
               P1_P1_P3_PhyAddrPointer  =0;
               P1_P1_P3_Extended  =1'b0;
               P1_P1_P3_More  =1'b0;
               P1_P1_P3_Flush  =1'b0;
               P1_P1_P3_lWord  =0;
               P1_P1_P3_uWord  =0;
               P1_P1_P3_fWord  =0;
               P1_P1_P3_CodeFetch  <=1'b0;
               P1_P1_P3_Datao  <=0;
               P1_P1_P3_EAX  <=0;
               P1_P1_P3_EBX  <=0;
               P1_P1_P3_rEIP  <=0;
               P1_P1_P3_ReadRequest  <=1'b0;
               P1_P1_P3_MemoryFetch  <=1'b0;
               P1_P1_P3_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P3_State2 )
              P1_P1_P3_Si  :
                begin 
                   P1_P1_P3_PhyAddrPointer  = P1_P1_P3_rEIP ;
                   P1_P1_P3_InstAddrPointer  = P1_P1_P3_PhyAddrPointer ;
                   P1_P1_P3_State2  = P1_P1_P3_S1 ;
                   P1_P1_P3_rEIP  <=20'hFFFF0;
                   P1_P1_P3_ReadRequest  <=1'b1;
                   P1_P1_P3_MemoryFetch  <=1'b1;
                   P1_P1_P3_RequestPending  <=1'b1;
                end 
              P1_P1_P3_S1  :
                begin 
                   P1_P1_P3_RequestPending  <= P1_P1_P3_Pending ;
                   P1_P1_P3_ReadRequest  <= P1_P1_P3_Pending ;
                   P1_P1_P3_MemoryFetch  <= P1_P1_P3_Pending ;
                   P1_P1_P3_CodeFetch  <= P1_P1_P3_Pending ;
                  if ( P1_P1_P3_READY_n ==1'b0)
                      P1_P1_P3_State2  = P1_P1_P3_S2 ;
                   else 
                      P1_P1_P3_State2  = P1_P1_P3_S1 ;
                end 
              P1_P1_P3_S2  :
                begin 
                   P1_P1_P3_RequestPending  <= P1_P1_P3_NotPending ;
                   P1_P1_P3_InstQueue  [ P1_P1_P3_InstQueueWr_Addr ]= P1_P1_P3_Datai %(2**8);
                   P1_P1_P3_InstQueueWr_Addr  =( P1_P1_P3_InstQueueWr_Addr +1)%16;
                   P1_P1_P3_InstQueue  [ P1_P1_P3_InstQueueWr_Addr ]= P1_P1_P3_Datai %2**8;
                   P1_P1_P3_InstQueueWr_Addr  =( P1_P1_P3_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P3_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P3_InstQueue  [ P1_P1_P3_InstQueueWr_Addr ]=( P1_P1_P3_Datai /(2**16))%(2**8);
                        P1_P1_P3_InstQueueWr_Addr  =( P1_P1_P3_InstQueueWr_Addr +1)%16;
                        P1_P1_P3_InstQueue  [ P1_P1_P3_InstQueueWr_Addr ]=( P1_P1_P3_Datai /(2**24))%(2**8);
                        P1_P1_P3_InstQueueWr_Addr  =( P1_P1_P3_InstQueueWr_Addr +1)%16;
                        P1_P1_P3_PhyAddrPointer  = P1_P1_P3_PhyAddrPointer +4;
                        P1_P1_P3_State2  = P1_P1_P3_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P3_PhyAddrPointer  = P1_P1_P3_PhyAddrPointer +2;
                       if ( P1_P1_P3_PhyAddrPointer <0)
                           P1_P1_P3_rEIP  <=- P1_P1_P3_PhyAddrPointer ;
                        else 
                           P1_P1_P3_rEIP  <= P1_P1_P3_PhyAddrPointer ;
                        P1_P1_P3_State2  = P1_P1_P3_S3 ;
                     end 
                end 
              P1_P1_P3_S3  :
                begin 
                   P1_P1_P3_RequestPending  <= P1_P1_P3_Pending ;
                  if ( P1_P1_P3_READY_n ==1'b0)
                      P1_P1_P3_State2  = P1_P1_P3_S4 ;
                   else 
                      P1_P1_P3_State2  = P1_P1_P3_S3 ;
                end 
              P1_P1_P3_S4  :
                begin 
                   P1_P1_P3_RequestPending  <= P1_P1_P3_NotPending ;
                   P1_P1_P3_InstQueue  [ P1_P1_P3_InstQueueWr_Addr ]= P1_P1_P3_Datai %(2**8);
                   P1_P1_P3_InstQueueWr_Addr  =( P1_P1_P3_InstQueueWr_Addr +1)%16;
                   P1_P1_P3_InstQueue  [ P1_P1_P3_InstQueueWr_Addr ]= P1_P1_P3_Datai %(2**8);
                   P1_P1_P3_InstQueueWr_Addr  =( P1_P1_P3_InstQueueWr_Addr +1)%16;
                   P1_P1_P3_PhyAddrPointer  = P1_P1_P3_PhyAddrPointer +2;
                   P1_P1_P3_State2  = P1_P1_P3_S5 ;
                end 
              P1_P1_P3_S5  :
                begin 
                  case ( P1_P1_P3_InstQueue [ P1_P1_P3_InstQueueRd_Addr ])
                    P1_P1_P3_NOP  :
                      begin 
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +1;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +1)%16;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                    P1_P1_P3_OPsop  :
                      begin 
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +1;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +1)%16;
                         P1_P1_P3_Extended  =1'b1;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                    P1_P1_P3_JMP_rel_short  :
                      if (( P1_P1_P3_InstQueueWr_Addr - P1_P1_P3_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P3_PhyAddrPointer  = P1_P1_P3_InstAddrPointer +1-(8'hFF- P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P3_InstAddrPointer  = P1_P1_P3_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P3_PhyAddrPointer  = P1_P1_P3_InstAddrPointer +2+ P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +1)%16];
                                 P1_P1_P3_InstAddrPointer  = P1_P1_P3_PhyAddrPointer ;
                              end 
                            P1_P1_P3_Flush  =1'b1;
                            P1_P1_P3_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P3_Flush  =1'b0;
                            P1_P1_P3_More  =1'b1;
                         end 
                    P1_P1_P3_JMP_rel_near  :
                      if (( P1_P1_P3_InstQueueWr_Addr - P1_P1_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P3_PhyAddrPointer  = P1_P1_P3_InstAddrPointer +5+ P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +1)%16];
                            P1_P1_P3_InstAddrPointer  = P1_P1_P3_PhyAddrPointer ;
                            P1_P1_P3_Flush  =1'b1;
                            P1_P1_P3_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P3_Flush  =1'b0;
                            P1_P1_P3_More  =1'b1;
                         end 
                    P1_P1_P3_JMP_intseg_immed  :
                      begin 
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +1;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +1)%16;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                    P1_P1_P3_MOV_al_b  :
                      begin 
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +1;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +1)%16;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                    P1_P1_P3_MOV_eax_dw  :
                      if (( P1_P1_P3_InstQueueWr_Addr - P1_P1_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P3_EAX  <= P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +1)%16];
                            P1_P1_P3_More  =1'b0;
                            P1_P1_P3_Flush  =1'b0;
                            P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +5;
                            P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P3_Flush  =1'b0;
                            P1_P1_P3_More  =1'b1;
                         end 
                    P1_P1_P3_MOV_ebx_dw  :
                      if (( P1_P1_P3_InstQueueWr_Addr - P1_P1_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P3_EBX  <= P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P3_InstQueue [( P1_P1_P3_InstQueueRd_Addr +1)%1];
                            P1_P1_P3_More  =1'b0;
                            P1_P1_P3_Flush  =1'b0;
                            P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +5;
                            P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P3_Flush  =1'b0;
                            P1_P1_P3_More  =1'b1;
                         end 
                    P1_P1_P3_MOV_eax_ebx  :
                      if (( P1_P1_P3_InstQueueWr_Addr - P1_P1_P3_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P3_EBX <0)
                               P1_P1_P3_rEIP  <=- P1_P1_P3_EBX ;
                            else 
                               P1_P1_P3_rEIP  <= P1_P1_P3_EBX ;
                            P1_P1_P3_RequestPending  <= P1_P1_P3_Pending ;
                            P1_P1_P3_ReadRequest  <= P1_P1_P3_Pending ;
                            P1_P1_P3_MemoryFetch  <= P1_P1_P3_Pending ;
                            P1_P1_P3_CodeFetch  <= P1_P1_P3_NotPending ;
                           if ( P1_P1_P3_READY_n ==1'b0)
                              begin 
                                 P1_P1_P3_RequestPending  <= P1_P1_P3_NotPending ;
                                 P1_P1_P3_uWord  = P1_P1_P3_Datai %(2**15);
                                if ( P1_P1_P3_StateBS16 ==1'b1)
                                    P1_P1_P3_lWord  = P1_P1_P3_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P3_rEIP  <= P1_P1_P3_rEIP +2;
                                      P1_P1_P3_RequestPending  <= P1_P1_P3_Pending ;
                                     if ( P1_P1_P3_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P3_RequestPending  <= P1_P1_P3_NotPending ;
                                           P1_P1_P3_lWord  = P1_P1_P3_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P3_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P3_EAX  <= P1_P1_P3_uWord *(2**16)+ P1_P1_P3_lWord ;
                                      P1_P1_P3_More  =1'b0;
                                      P1_P1_P3_Flush  =1'b0;
                                      P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +2;
                                      P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P3_Flush  =1'b0;
                            P1_P1_P3_More  =1'b1;
                         end 
                    P1_P1_P3_MOV_ebx_eax  :
                      if (( P1_P1_P3_InstQueueWr_Addr - P1_P1_P3_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P3_EBX <0)
                               P1_P1_P3_rEIP  <= P1_P1_P3_EBX ;
                            else 
                               P1_P1_P3_rEIP  <= P1_P1_P3_EBX ;
                            P1_P1_P3_lWord  = P1_P1_P3_EAX %(2**16);
                            P1_P1_P3_uWord  =( P1_P1_P3_EAX /(2**16))%(2**15);
                            P1_P1_P3_RequestPending  <= P1_P1_P3_Pending ;
                            P1_P1_P3_ReadRequest  <= P1_P1_P3_NotPending ;
                            P1_P1_P3_MemoryFetch  <= P1_P1_P3_Pending ;
                            P1_P1_P3_CodeFetch  <= P1_P1_P3_NotPending ;
                           if ( P1_P1_P3_State == P1_P1_P3_StateT1 | P1_P1_P3_State == P1_P1_P3_StateT1P )
                              begin 
                                 P1_P1_P3_Datao  <=( P1_P1_P3_uWord *(2**16)+ P1_P1_P3_lWord );
                                if ( P1_P1_P3_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P3_RequestPending  <= P1_P1_P3_NotPending ;
                                     if ( P1_P1_P3_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P3_rEIP  <= P1_P1_P3_rEIP +2;
                                           P1_P1_P3_RequestPending  <= P1_P1_P3_Pending ;
                                           P1_P1_P3_ReadRequest  <= P1_P1_P3_NotPending ;
                                           P1_P1_P3_MemoryFetch  <= P1_P1_P3_Pending ;
                                           P1_P1_P3_CodeFetch  <= P1_P1_P3_NotPending ;
                                           P1_P1_P3_State2  = P1_P1_P3_S6 ;
                                        end 
                                      P1_P1_P3_More  =1'b0;
                                      P1_P1_P3_Flush  =1'b0;
                                      P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +2;
                                      P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P3_Flush  =1'b0;
                            P1_P1_P3_More  =1'b1;
                         end 
                    P1_P1_P3_IN_al  :
                      if (( P1_P1_P3_InstQueueWr_Addr - P1_P1_P3_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P3_rEIP  <= P1_P1_P3_InstQueueRd_Addr +1;
                            P1_P1_P3_RequestPending  <= P1_P1_P3_Pending ;
                            P1_P1_P3_ReadRequest  <= P1_P1_P3_Pending ;
                            P1_P1_P3_MemoryFetch  <= P1_P1_P3_NotPending ;
                            P1_P1_P3_CodeFetch  <= P1_P1_P3_NotPending ;
                           if ( P1_P1_P3_READY_n ==1'b0)
                              begin 
                                 P1_P1_P3_RequestPending  <= P1_P1_P3_NotPending ;
                                 P1_P1_P3_EAX  <= P1_P1_P3_Datai ;
                                 P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +2;
                                 P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +2);
                                 P1_P1_P3_Flush  =1'b0;
                                 P1_P1_P3_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P3_Flush  =1'b0;
                            P1_P1_P3_More  =1'b1;
                         end 
                    P1_P1_P3_OUT_al  :
                      if (( P1_P1_P3_InstQueueWr_Addr - P1_P1_P3_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P3_rEIP  <= P1_P1_P3_InstQueueRd_Addr +1;
                            P1_P1_P3_RequestPending  <= P1_P1_P3_Pending ;
                            P1_P1_P3_ReadRequest  <= P1_P1_P3_NotPending ;
                            P1_P1_P3_MemoryFetch  <= P1_P1_P3_NotPending ;
                            P1_P1_P3_CodeFetch  <= P1_P1_P3_NotPending ;
                           if ( P1_P1_P3_State == P1_P1_P3_StateT1 | P1_P1_P3_State == P1_P1_P3_StateT1P )
                              begin 
                                 P1_P1_P3_fWord  = P1_P1_P3_EAX %(2**16);
                                 P1_P1_P3_Datao  <= P1_P1_P3_fWord ;
                                if ( P1_P1_P3_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P3_RequestPending  <= P1_P1_P3_NotPending ;
                                      P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +2;
                                      P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +2)%16;
                                      P1_P1_P3_Flush  =1'b0;
                                      P1_P1_P3_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P3_Flush  =1'b0;
                            P1_P1_P3_More  =1'b1;
                         end 
                    P1_P1_P3_ADD_al_b  :
                      begin 
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +1;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +1)%16;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                    P1_P1_P3_ADD_ax_w  :
                      begin 
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +1;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +1)%16;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                    P1_P1_P3_ROL_al_1  :
                      begin 
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +2;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +2)%16;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                    P1_P1_P3_ROL_al_n  :
                      begin 
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +2;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +2)%16;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                    P1_P1_P3_INC_eax  :
                      begin 
                         P1_P1_P3_EAX  <= P1_P1_P3_EAX +1;
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +1;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +1)%16;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                    P1_P1_P3_INC_ebx  :
                      begin 
                         P1_P1_P3_EBX  <= P1_P1_P3_EBX +1;
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +1;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +1)%16;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P3_InstAddrPointer  = P1_P1_P3_InstAddrPointer +1;
                         P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +1)%16;
                         P1_P1_P3_Flush  =1'b0;
                         P1_P1_P3_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P3_InstQueueRd_Addr < P1_P1_P3_InstQueueWr_Addr ))|((( P1_P1_P3_InstQueueLimit - P1_P1_P3_InstQueueRd_Addr )<4)| P1_P1_P3_Flush | P1_P1_P3_More ))
                      P1_P1_P3_State2  = P1_P1_P3_S7 ;
                end 
              P1_P1_P3_S6  :
                begin 
                   P1_P1_P3_Datao  <=( P1_P1_P3_uWord *(2**16)+ P1_P1_P3_lWord );
                  if ( P1_P1_P3_READY_n ==1'b0)
                     begin 
                        P1_P1_P3_RequestPending  <= P1_P1_P3_NotPending ;
                        P1_P1_P3_State2  = P1_P1_P3_S5 ;
                     end 
                end 
              P1_P1_P3_S7  :
                begin 
                  if ( P1_P1_P3_Flush )
                     begin 
                        P1_P1_P3_InstQueueRd_Addr  =1;
                        P1_P1_P3_InstQueueWr_Addr  =1;
                       if ( P1_P1_P3_InstAddrPointer <0)
                           P1_P1_P3_fWord  =- P1_P1_P3_InstAddrPointer ;
                        else 
                           P1_P1_P3_fWord  = P1_P1_P3_InstAddrPointer ;
                       if ( P1_P1_P3_fWord %2==1)
                           P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr + P1_P1_P3_fWord %4)%16;
                     end 
                  if (( P1_P1_P3_InstQueueLimit - P1_P1_P3_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P3_State2  = P1_P1_P3_S8 ;
                        P1_P1_P3_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P3_State2  = P1_P1_P3_S9 ;
                end 
              P1_P1_P3_S8  :
                if ( P1_P1_P3_InstQueueRd_Addr <= P1_P1_P3_InstQueueLimit )
                   begin 
                      P1_P1_P3_InstQueue  [ P1_P1_P3_InstQueueWr_Addr ]= P1_P1_P3_InstQueue [ P1_P1_P3_InstQueueRd_Addr ];
                      P1_P1_P3_InstQueueRd_Addr  =( P1_P1_P3_InstQueueRd_Addr +1)%16;
                      P1_P1_P3_InstQueueWr_Addr  =( P1_P1_P3_InstQueueWr_Addr +1)%16;
                      P1_P1_P3_State2  = P1_P1_P3_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P3_InstQueueRd_Addr  =0;
                      P1_P1_P3_State2  = P1_P1_P3_S9 ;
                   end 
              P1_P1_P3_S9  :
                begin 
                   P1_P1_P3_rEIP  <= P1_P1_P3_PhyAddrPointer ;
                   P1_P1_P3_State2  = P1_P1_P3_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P1_P1_P3_CLOCK or posedge  P1_P1_P3_RESET )
       begin 
         if ( P1_P1_P3_RESET ==1'b1)
            begin 
               P1_P1_P3_ByteEnable  <=4'b0000;
               P1_P1_P3_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P3_DataWidth )
              P1_P1_P3_WidthByte  :
                case ( P1_P1_P3_rEIP %4)
                 0 :
                     P1_P1_P3_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P3_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P3_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P3_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P3_WidthWord  :
                case ( P1_P1_P3_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P3_ByteEnable  <=4'b1100;
                       P1_P1_P3_NonAligned  <= P1_P1_P3_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P3_ByteEnable  <=4'b1001;
                       P1_P1_P3_NonAligned  <= P1_P1_P3_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P3_ByteEnable  <=4'b0011;
                       P1_P1_P3_NonAligned  <= P1_P1_P3_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P3_ByteEnable  <=4'b0111;
                       P1_P1_P3_NonAligned  <= P1_P1_P3_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P3_WidthDword  :
                case ( P1_P1_P3_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P3_ByteEnable  <=4'b0000;
                       P1_P1_P3_NonAligned  <= P1_P1_P3_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P3_ByteEnable  <=4'b0001;
                       P1_P1_P3_NonAligned  <= P1_P1_P3_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P3_NonAligned  <= P1_P1_P3_Pending ;
                       P1_P1_P3_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P3_NonAligned  <= P1_P1_P3_Pending ;
                       P1_P1_P3_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 

 
  
 
   integer P1_P2_buf1 ; 
   integer P1_P2_buf2 ; 
   wire[3:0] P1_P2_be1 ; 
   wire[3:0] P1_P2_be2 ; 
   wire[3:0] P1_P2_be3 ; 
   wire[29:0] P1_P2_addr1 ; 
   wire[29:0] P1_P2_addr2 ; 
   wire[29:0] P1_P2_addr3 ; 
   wire P1_P2_wr1 ; 
   wire P1_P2_wr2 ; 
   wire P1_P2_wr3 ; 
   wire P1_P2_dc1 ; 
   wire P1_P2_dc2 ; 
   wire P1_P2_dc3 ; 
   wire P1_P2_mio1 ; 
   wire P1_P2_mio2 ; 
   wire P1_P2_mio3 ; 
   wire P1_P2_ads1 ; 
   wire P1_P2_ads2 ; 
   wire P1_P2_ads3 ; 
   integer P1_P2_di1 ; 
   integer P1_P2_di2 ; 
   integer P1_P2_di3 ; 
   wire[31:0] P1_P2_do1 ; 
   wire[31:0] P1_P2_do2 ; 
   wire[31:0] P1_P2_do3 ; 
   reg P1_P2_rdy1 ; 
   reg P1_P2_rdy2 ; 
   reg P1_P2_rdy3 ; 
   reg P1_P2_ready11 ; 
   reg P1_P2_ready12 ; 
   reg P1_P2_ready21 ; 
   reg P1_P2_ready22 ; 
  always @(  posedge   P1_P2_clock or posedge  P1_P2_reset )
       if ( P1_P2_reset ==1'b1)
          begin 
             P1_P2_buf1  <=0;
             P1_P2_ready11  <=1'b0;
             P1_P2_ready12  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P2_addr1 >2**29& P1_P2_ads1 ==1'b0& P1_P2_mio1 ==1'b1& P1_P2_dc1 ==1'b0& P1_P2_wr1 ==1'b1& P1_P2_be1 ==4'b0000)
               begin 
                  P1_P2_buf1  <= P1_P2_do1 ;
                  P1_P2_ready11  <=1'b0;
                  P1_P2_ready12  <=1'b1;
               end 
             else 
               if ( P1_P2_addr2 >2**29& P1_P2_ads2 ==1'b0& P1_P2_mio2 ==1'b1& P1_P2_dc2 ==1'b0& P1_P2_wr2 ==1'b1& P1_P2_be2 ==4'b0000)
                  begin 
                     P1_P2_buf1  <= P1_P2_do2 ;
                     P1_P2_ready11  <=1'b1;
                     P1_P2_ready12  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P2_ready11  <=1'b1;
                     P1_P2_ready12  <=1'b1;
                  end 
          end
  
  always @(  posedge   P1_P2_clock or posedge  P1_P2_reset )
       if ( P1_P2_reset ==1'b1)
          begin 
             P1_P2_buf2  <=0;
             P1_P2_ready21  <=1'b0;
             P1_P2_ready22  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P2_addr2 <2**29& P1_P2_ads2 ==1'b0& P1_P2_mio2 ==1'b1& P1_P2_dc2 ==1'b0& P1_P2_wr2 ==1'b1& P1_P2_be2 ==4'b0000)
               begin 
                  P1_P2_buf2  <= P1_P2_do2 ;
                  P1_P2_ready21  <=1'b0;
                  P1_P2_ready22  <=1'b1;
               end 
             else 
               if ( P1_P2_ads3 ==1'b0& P1_P2_mio3 ==1'b1& P1_P2_dc3 ==1'b0& P1_P2_wr3 ==1'b0& P1_P2_be3 ==4'b0000)
                  begin 
                     P1_P2_ready21  <=1'b1;
                     P1_P2_ready22  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P2_ready21  <=1'b1;
                     P1_P2_ready22  <=1'b1;
                  end 
          end
  
  always @(    P1_P2_addr1    or  P1_P2_buf1  or  P1_P2_datai  )
       if ( P1_P2_addr1 >2**29)
           P1_P2_di1  <= P1_P2_buf1 ;
        else 
           P1_P2_di1  <= P1_P2_datai ;
 
  always @(    P1_P2_addr2    or  P1_P2_buf1  or  P1_P2_buf2  )
       if ( P1_P2_addr2 >2**29)
           P1_P2_di2  <= P1_P2_buf1 ;
        else 
           P1_P2_di2  <= P1_P2_buf2 ;
 
  always @(      P1_P2_addr2      or  P1_P2_addr3  or  P1_P2_do1  or  P1_P2_do2  or  P1_P2_do3  )
       if (( P1_P2_do1 <2**30)&( P1_P2_do2 <2**30)&( P1_P2_do3 <2**30))
           P1_P2_address2  <= P1_P2_addr3 ;
        else 
           P1_P2_address2  <= P1_P2_addr2 ;
 
  always @(               P1_P2_buf2               or  P1_P2_do3  or  P1_P2_addr1  or  P1_P2_wr3  or  P1_P2_dc3  or  P1_P2_mio3  or  P1_P2_ads1  or  P1_P2_ads3  or  P1_P2_ready1  or  P1_P2_ready2  or  P1_P2_ready11  or  P1_P2_ready12  or  P1_P2_ready21  or  P1_P2_ready22  )
       begin 
          P1_P2_di3  <= P1_P2_buf2 ;
          P1_P2_datao  <= P1_P2_do3 ;
          P1_P2_address1  <= P1_P2_addr1 ;
          P1_P2_wr  <= P1_P2_wr3 ;
          P1_P2_dc  <= P1_P2_dc3 ;
          P1_P2_mio  <= P1_P2_mio3 ;
          P1_P2_ast1  <= P1_P2_ads1 ;
          P1_P2_ast2  <= P1_P2_ads3 ;
          P1_P2_rdy1  <= P1_P2_ready11 & P1_P2_ready1 ;
          P1_P2_rdy2  <= P1_P2_ready12 & P1_P2_ready21 ;
          P1_P2_rdy3  <= P1_P2_ready22 & P1_P2_ready2 ;
       end
  
  
 
   reg P1_P2_P1_StateNA ; 
   reg P1_P2_P1_StateBS16 ; 
   reg P1_P2_P1_RequestPending ; 
 parameter P1_P2_P1_Pending =1'b1; 
 parameter P1_P2_P1_NotPending =1'b0; 
   reg P1_P2_P1_NonAligned ; 
   reg P1_P2_P1_ReadRequest ; 
   reg P1_P2_P1_MemoryFetch ; 
   reg P1_P2_P1_CodeFetch ; 
   reg[3:0] P1_P2_P1_ByteEnable ; 
   integer P1_P2_P1_DataWidth ; 
 parameter P1_P2_P1_WidthByte =0; 
 parameter P1_P2_P1_WidthWord =1; 
 parameter P1_P2_P1_WidthDword =2; 
   reg[2:0] P1_P2_P1_State ; 
 parameter P1_P2_P1_StateInit =0; 
 parameter P1_P2_P1_StateTi =1; 
 parameter P1_P2_P1_StateT1 =2; 
 parameter P1_P2_P1_StateT2 =3; 
 parameter P1_P2_P1_StateT1P =4; 
 parameter P1_P2_P1_StateTh =5; 
 parameter P1_P2_P1_StateT2P =6; 
 parameter P1_P2_P1_StateT2I =7; 
   integer P1_P2_P1_EAX ; 
   integer P1_P2_P1_EBX ; 
   integer P1_P2_P1_rEIP ; 
 parameter P1_P2_P1_REP =8'hF3; 
 parameter P1_P2_P1_REPNE =8'hF2; 
 parameter P1_P2_P1_LOCK =8'hF0; 
 parameter P1_P2_P1_CSsop =8'h2E; 
 parameter P1_P2_P1_SSsop =8'h36; 
 parameter P1_P2_P1_DSsop =8'h3E; 
 parameter P1_P2_P1_ESsop =8'h26; 
 parameter P1_P2_P1_FSsop =8'h64; 
 parameter P1_P2_P1_GSsop =8'h65; 
 parameter P1_P2_P1_OPsop =8'h66; 
 parameter P1_P2_P1_ADsop =8'h67; 
 parameter P1_P2_P1_MOV_al_b =8'hB0; 
 parameter P1_P2_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P2_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P2_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P2_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P2_P1_IN_al =8'hE4; 
 parameter P1_P2_P1_OUT_al =8'hE6; 
 parameter P1_P2_P1_ADD_al_b =8'h04; 
 parameter P1_P2_P1_ADD_ax_w =8'h05; 
 parameter P1_P2_P1_ROL_eax_b =8'hD1; 
 parameter P1_P2_P1_ROL_al_1 =8'hD0; 
 parameter P1_P2_P1_ROL_al_n =8'hC0; 
 parameter P1_P2_P1_INC_eax =8'h40; 
 parameter P1_P2_P1_INC_ebx =8'h43; 
 parameter P1_P2_P1_JMP_rel_short =8'hEB; 
 parameter P1_P2_P1_JMP_rel_near =8'hE9; 
 parameter P1_P2_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P2_P1_HLT =8'hF4; 
 parameter P1_P2_P1_WAITx =8'h9B; 
 parameter P1_P2_P1_NOP =8'h90; 
   reg[7:0] P1_P2_P1_InstQueue [15:0]; 
   reg[4:0] P1_P2_P1_InstQueueRd_Addr ; 
   reg[4:0] P1_P2_P1_InstQueueWr_Addr ; 
 parameter P1_P2_P1_InstQueueLimit =15; 
   integer P1_P2_P1_InstAddrPointer ; 
   integer P1_P2_P1_PhyAddrPointer ; 
   reg P1_P2_P1_Extended ; 
   reg P1_P2_P1_More ; 
   reg P1_P2_P1_Flush ; 
   reg[15:0] P1_P2_P1_lWord ; 
   reg[14:0] P1_P2_P1_uWord ; 
   integer P1_P2_P1_fWord ; 
   reg[3:0] P1_P2_P1_State2 ; 
 parameter P1_P2_P1_Si =0; 
 parameter P1_P2_P1_S1 =1; 
 parameter P1_P2_P1_S2 =2; 
 parameter P1_P2_P1_S3 =3; 
 parameter P1_P2_P1_S4 =4; 
 parameter P1_P2_P1_S5 =5; 
 parameter P1_P2_P1_S6 =6; 
 parameter P1_P2_P1_S7 =7; 
 parameter P1_P2_P1_S8 =8; 
 parameter P1_P2_P1_S9 =9; 
  always @(  posedge   P1_P2_P1_CLOCK or posedge  P1_P2_P1_RESET )
       begin 
         if ( P1_P2_P1_RESET ==1'b1)
            begin 
               P1_P2_P1_BE_n  <=4'b0000;
               P1_P2_P1_Address  <=0;
               P1_P2_P1_W_R_n  <=1'b0;
               P1_P2_P1_D_C_n  <=1'b0;
               P1_P2_P1_M_IO_n  <=1'b0;
               P1_P2_P1_ADS_n  <=1'b0;
               P1_P2_P1_State  <= P1_P2_P1_StateInit ;
               P1_P2_P1_StateNA  <=1'b0;
               P1_P2_P1_StateBS16  <=1'b0;
               P1_P2_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P2_P1_State )
              P1_P2_P1_StateInit  :
                begin 
                   P1_P2_P1_D_C_n  <=1'b1;
                   P1_P2_P1_ADS_n  <=1'b1;
                   P1_P2_P1_State  <= P1_P2_P1_StateTi ;
                   P1_P2_P1_StateNA  <=1'b1;
                   P1_P2_P1_StateBS16  <=1'b1;
                   P1_P2_P1_DataWidth  <=2;
                   P1_P2_P1_State  <= P1_P2_P1_StateTi ;
                end 
              P1_P2_P1_StateTi  :
                if ( P1_P2_P1_RequestPending == P1_P2_P1_Pending )
                    P1_P2_P1_State  <= P1_P2_P1_StateT1 ;
                 else 
                   if ( P1_P2_P1_HOLD ==1'b1)
                       P1_P2_P1_State  <= P1_P2_P1_StateTh ;
                    else 
                       P1_P2_P1_State  <= P1_P2_P1_StateTi ;
              P1_P2_P1_StateT1  :
                begin 
                   P1_P2_P1_Address  <= P1_P2_P1_rEIP /4%2**30;
                   P1_P2_P1_BE_n  <= P1_P2_P1_ByteEnable ;
                   P1_P2_P1_M_IO_n  <= P1_P2_P1_MemoryFetch ;
                  if ( P1_P2_P1_ReadRequest == P1_P2_P1_Pending )
                      P1_P2_P1_W_R_n  <=1'b0;
                   else 
                      P1_P2_P1_W_R_n  <=1'b1;
                  if ( P1_P2_P1_CodeFetch == P1_P2_P1_Pending )
                      P1_P2_P1_D_C_n  <=1'b0;
                   else 
                      P1_P2_P1_D_C_n  <=1'b1;
                   P1_P2_P1_ADS_n  <=1'b0;
                   P1_P2_P1_State  <= P1_P2_P1_StateT2 ;
                end 
              P1_P2_P1_StateT2  :
                begin 
                  if ( P1_P2_P1_READY_n ==1'b0& P1_P2_P1_HOLD ==1'b0& P1_P2_P1_RequestPending == P1_P2_P1_Pending )
                      P1_P2_P1_State  <= P1_P2_P1_StateT1 ;
                   else 
                     if ( P1_P2_P1_READY_n ==1'b1& P1_P2_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P2_P1_RequestPending == P1_P2_P1_Pending | P1_P2_P1_HOLD ==1'b1)&( P1_P2_P1_READY_n ==1'b1& P1_P2_P1_NA_n ==1'b0))
                            P1_P2_P1_State  <= P1_P2_P1_StateT2I ;
                         else 
                           if ( P1_P2_P1_RequestPending == P1_P2_P1_Pending & P1_P2_P1_HOLD ==1'b0& P1_P2_P1_READY_n ==1'b1& P1_P2_P1_NA_n ==1'b0)
                               P1_P2_P1_State  <= P1_P2_P1_StateT2P ;
                            else 
                              if ( P1_P2_P1_RequestPending == P1_P2_P1_NotPending & P1_P2_P1_HOLD ==1'b0& P1_P2_P1_READY_n ==1'b0)
                                  P1_P2_P1_State  <= P1_P2_P1_StateTi ;
                               else 
                                 if ( P1_P2_P1_HOLD ==1'b1& P1_P2_P1_READY_n ==1'b1)
                                     P1_P2_P1_State  <= P1_P2_P1_StateTh ;
                                  else 
                                     P1_P2_P1_State  <= P1_P2_P1_StateT2 ;
                   P1_P2_P1_StateBS16  <= P1_P2_P1_BS16_n ;
                  if ( P1_P2_P1_BS16_n ==1'b0)
                      P1_P2_P1_DataWidth  <= P1_P2_P1_WidthWord ;
                   else 
                      P1_P2_P1_DataWidth  <= P1_P2_P1_WidthDword ;
                   P1_P2_P1_StateNA  <= P1_P2_P1_NA_n ;
                   P1_P2_P1_ADS_n  <=1'b1;
                end 
              P1_P2_P1_StateT1P  :
                begin 
                  if ( P1_P2_P1_NA_n ==1'b0& P1_P2_P1_HOLD ==1'b0& P1_P2_P1_RequestPending == P1_P2_P1_Pending )
                      P1_P2_P1_State  <= P1_P2_P1_StateT2P ;
                   else 
                     if ( P1_P2_P1_NA_n ==1'b0&( P1_P2_P1_HOLD ==1'b1| P1_P2_P1_RequestPending == P1_P2_P1_NotPending ))
                         P1_P2_P1_State  <= P1_P2_P1_StateT2I ;
                      else 
                        if ( P1_P2_P1_NA_n ==1'b1)
                            P1_P2_P1_State  <= P1_P2_P1_StateT2 ;
                         else 
                            P1_P2_P1_State  <= P1_P2_P1_StateT1P ;
                   P1_P2_P1_StateBS16  <= P1_P2_P1_BS16_n ;
                  if ( P1_P2_P1_BS16_n ==1'b0)
                      P1_P2_P1_DataWidth  <= P1_P2_P1_WidthWord ;
                   else 
                      P1_P2_P1_DataWidth  <= P1_P2_P1_WidthDword ;
                   P1_P2_P1_StateNA  <= P1_P2_P1_NA_n ;
                   P1_P2_P1_ADS_n  <=1'b1;
                end 
              P1_P2_P1_StateTh  :
                if ( P1_P2_P1_HOLD ==1'b0& P1_P2_P1_RequestPending == P1_P2_P1_Pending )
                    P1_P2_P1_State  <= P1_P2_P1_StateT1 ;
                 else 
                   if ( P1_P2_P1_HOLD ==1'b0& P1_P2_P1_RequestPending == P1_P2_P1_NotPending )
                       P1_P2_P1_State  <= P1_P2_P1_StateTi ;
                    else 
                       P1_P2_P1_State  <= P1_P2_P1_StateTh ;
              P1_P2_P1_StateT2P  :
                begin 
                   P1_P2_P1_Address  <= P1_P2_P1_rEIP /2%2**30;
                   P1_P2_P1_BE_n  <= P1_P2_P1_ByteEnable ;
                   P1_P2_P1_M_IO_n  <= P1_P2_P1_MemoryFetch ;
                  if ( P1_P2_P1_ReadRequest == P1_P2_P1_Pending )
                      P1_P2_P1_W_R_n  <=1'b0;
                   else 
                      P1_P2_P1_W_R_n  <=1'b1;
                  if ( P1_P2_P1_CodeFetch == P1_P2_P1_Pending )
                      P1_P2_P1_D_C_n  <=1'b0;
                   else 
                      P1_P2_P1_D_C_n  <=1'b1;
                   P1_P2_P1_ADS_n  <=1'b0;
                  if ( P1_P2_P1_READY_n ==1'b0)
                      P1_P2_P1_State  <= P1_P2_P1_StateT1P ;
                   else 
                      P1_P2_P1_State  <= P1_P2_P1_StateT2P ;
                end 
              P1_P2_P1_StateT2I  :
                if ( P1_P2_P1_READY_n ==1'b1& P1_P2_P1_RequestPending == P1_P2_P1_Pending & P1_P2_P1_HOLD ==1'b0)
                    P1_P2_P1_State  <= P1_P2_P1_StateT2P ;
                 else 
                   if ( P1_P2_P1_READY_n ==1'b0& P1_P2_P1_HOLD ==1'b1)
                       P1_P2_P1_State  <= P1_P2_P1_StateTh ;
                    else 
                      if ( P1_P2_P1_READY_n ==1'b0& P1_P2_P1_HOLD ==1'b0& P1_P2_P1_RequestPending == P1_P2_P1_Pending )
                          P1_P2_P1_State  <= P1_P2_P1_StateT1 ;
                       else 
                         if ( P1_P2_P1_READY_n ==1'b0& P1_P2_P1_HOLD ==1'b0& P1_P2_P1_RequestPending == P1_P2_P1_NotPending )
                             P1_P2_P1_State  <= P1_P2_P1_StateTi ;
                          else 
                             P1_P2_P1_State  <= P1_P2_P1_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P1_P2_P1_CLOCK or posedge  P1_P2_P1_RESET )
       begin 
         if ( P1_P2_P1_RESET ==1'b1)
            begin 
               P1_P2_P1_State2  = P1_P2_P1_Si ;
               P1_P2_P1_InstQueue  [0]=8'b0000_0000;
               P1_P2_P1_InstQueue  [1]=8'b0000_0000;
               P1_P2_P1_InstQueue  [2]=8'b0000_0000;
               P1_P2_P1_InstQueue  [3]=8'b0000_0000;
               P1_P2_P1_InstQueue  [4]=8'b0000_0000;
               P1_P2_P1_InstQueue  [5]=8'b0000_0000;
               P1_P2_P1_InstQueue  [6]=8'b0000_0000;
               P1_P2_P1_InstQueue  [7]=8'b0000_0000;
               P1_P2_P1_InstQueue  [8]=8'b0000_0000;
               P1_P2_P1_InstQueue  [9]=8'b0000_0000;
               P1_P2_P1_InstQueue  [10]=8'b0000_0000;
               P1_P2_P1_InstQueue  [11]=8'b0000_0000;
               P1_P2_P1_InstQueue  [12]=8'b0000_0000;
               P1_P2_P1_InstQueue  [13]=8'b0000_0000;
               P1_P2_P1_InstQueue  [14]=8'b0000_0000;
               P1_P2_P1_InstQueue  [15]=8'b0000_0000;
               P1_P2_P1_InstQueueRd_Addr  =0;
               P1_P2_P1_InstQueueWr_Addr  =0;
               P1_P2_P1_InstAddrPointer  =0;
               P1_P2_P1_PhyAddrPointer  =0;
               P1_P2_P1_Extended  =1'b0;
               P1_P2_P1_More  =1'b0;
               P1_P2_P1_Flush  =1'b0;
               P1_P2_P1_lWord  =0;
               P1_P2_P1_uWord  =0;
               P1_P2_P1_fWord  =0;
               P1_P2_P1_CodeFetch  <=1'b0;
               P1_P2_P1_Datao  <=0;
               P1_P2_P1_EAX  <=0;
               P1_P2_P1_EBX  <=0;
               P1_P2_P1_rEIP  <=0;
               P1_P2_P1_ReadRequest  <=1'b0;
               P1_P2_P1_MemoryFetch  <=1'b0;
               P1_P2_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P2_P1_State2 )
              P1_P2_P1_Si  :
                begin 
                   P1_P2_P1_PhyAddrPointer  = P1_P2_P1_rEIP ;
                   P1_P2_P1_InstAddrPointer  = P1_P2_P1_PhyAddrPointer ;
                   P1_P2_P1_State2  = P1_P2_P1_S1 ;
                   P1_P2_P1_rEIP  <=20'hFFFF0;
                   P1_P2_P1_ReadRequest  <=1'b1;
                   P1_P2_P1_MemoryFetch  <=1'b1;
                   P1_P2_P1_RequestPending  <=1'b1;
                end 
              P1_P2_P1_S1  :
                begin 
                   P1_P2_P1_RequestPending  <= P1_P2_P1_Pending ;
                   P1_P2_P1_ReadRequest  <= P1_P2_P1_Pending ;
                   P1_P2_P1_MemoryFetch  <= P1_P2_P1_Pending ;
                   P1_P2_P1_CodeFetch  <= P1_P2_P1_Pending ;
                  if ( P1_P2_P1_READY_n ==1'b0)
                      P1_P2_P1_State2  = P1_P2_P1_S2 ;
                   else 
                      P1_P2_P1_State2  = P1_P2_P1_S1 ;
                end 
              P1_P2_P1_S2  :
                begin 
                   P1_P2_P1_RequestPending  <= P1_P2_P1_NotPending ;
                   P1_P2_P1_InstQueue  [ P1_P2_P1_InstQueueWr_Addr ]= P1_P2_P1_Datai %(2**8);
                   P1_P2_P1_InstQueueWr_Addr  =( P1_P2_P1_InstQueueWr_Addr +1)%16;
                   P1_P2_P1_InstQueue  [ P1_P2_P1_InstQueueWr_Addr ]= P1_P2_P1_Datai %2**8;
                   P1_P2_P1_InstQueueWr_Addr  =( P1_P2_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P2_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P2_P1_InstQueue  [ P1_P2_P1_InstQueueWr_Addr ]=( P1_P2_P1_Datai /(2**16))%(2**8);
                        P1_P2_P1_InstQueueWr_Addr  =( P1_P2_P1_InstQueueWr_Addr +1)%16;
                        P1_P2_P1_InstQueue  [ P1_P2_P1_InstQueueWr_Addr ]=( P1_P2_P1_Datai /(2**24))%(2**8);
                        P1_P2_P1_InstQueueWr_Addr  =( P1_P2_P1_InstQueueWr_Addr +1)%16;
                        P1_P2_P1_PhyAddrPointer  = P1_P2_P1_PhyAddrPointer +4;
                        P1_P2_P1_State2  = P1_P2_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P2_P1_PhyAddrPointer  = P1_P2_P1_PhyAddrPointer +2;
                       if ( P1_P2_P1_PhyAddrPointer <0)
                           P1_P2_P1_rEIP  <=- P1_P2_P1_PhyAddrPointer ;
                        else 
                           P1_P2_P1_rEIP  <= P1_P2_P1_PhyAddrPointer ;
                        P1_P2_P1_State2  = P1_P2_P1_S3 ;
                     end 
                end 
              P1_P2_P1_S3  :
                begin 
                   P1_P2_P1_RequestPending  <= P1_P2_P1_Pending ;
                  if ( P1_P2_P1_READY_n ==1'b0)
                      P1_P2_P1_State2  = P1_P2_P1_S4 ;
                   else 
                      P1_P2_P1_State2  = P1_P2_P1_S3 ;
                end 
              P1_P2_P1_S4  :
                begin 
                   P1_P2_P1_RequestPending  <= P1_P2_P1_NotPending ;
                   P1_P2_P1_InstQueue  [ P1_P2_P1_InstQueueWr_Addr ]= P1_P2_P1_Datai %(2**8);
                   P1_P2_P1_InstQueueWr_Addr  =( P1_P2_P1_InstQueueWr_Addr +1)%16;
                   P1_P2_P1_InstQueue  [ P1_P2_P1_InstQueueWr_Addr ]= P1_P2_P1_Datai %(2**8);
                   P1_P2_P1_InstQueueWr_Addr  =( P1_P2_P1_InstQueueWr_Addr +1)%16;
                   P1_P2_P1_PhyAddrPointer  = P1_P2_P1_PhyAddrPointer +2;
                   P1_P2_P1_State2  = P1_P2_P1_S5 ;
                end 
              P1_P2_P1_S5  :
                begin 
                  case ( P1_P2_P1_InstQueue [ P1_P2_P1_InstQueueRd_Addr ])
                    P1_P2_P1_NOP  :
                      begin 
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +1;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +1)%16;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                    P1_P2_P1_OPsop  :
                      begin 
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +1;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +1)%16;
                         P1_P2_P1_Extended  =1'b1;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                    P1_P2_P1_JMP_rel_short  :
                      if (( P1_P2_P1_InstQueueWr_Addr - P1_P2_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P2_P1_PhyAddrPointer  = P1_P2_P1_InstAddrPointer +1-(8'hFF- P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P2_P1_InstAddrPointer  = P1_P2_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P2_P1_PhyAddrPointer  = P1_P2_P1_InstAddrPointer +2+ P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +1)%16];
                                 P1_P2_P1_InstAddrPointer  = P1_P2_P1_PhyAddrPointer ;
                              end 
                            P1_P2_P1_Flush  =1'b1;
                            P1_P2_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P2_P1_Flush  =1'b0;
                            P1_P2_P1_More  =1'b1;
                         end 
                    P1_P2_P1_JMP_rel_near  :
                      if (( P1_P2_P1_InstQueueWr_Addr - P1_P2_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P2_P1_PhyAddrPointer  = P1_P2_P1_InstAddrPointer +5+ P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +1)%16];
                            P1_P2_P1_InstAddrPointer  = P1_P2_P1_PhyAddrPointer ;
                            P1_P2_P1_Flush  =1'b1;
                            P1_P2_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P2_P1_Flush  =1'b0;
                            P1_P2_P1_More  =1'b1;
                         end 
                    P1_P2_P1_JMP_intseg_immed  :
                      begin 
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +1;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +1)%16;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                    P1_P2_P1_MOV_al_b  :
                      begin 
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +1;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +1)%16;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                    P1_P2_P1_MOV_eax_dw  :
                      if (( P1_P2_P1_InstQueueWr_Addr - P1_P2_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P2_P1_EAX  <= P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +1)%16];
                            P1_P2_P1_More  =1'b0;
                            P1_P2_P1_Flush  =1'b0;
                            P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +5;
                            P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P2_P1_Flush  =1'b0;
                            P1_P2_P1_More  =1'b1;
                         end 
                    P1_P2_P1_MOV_ebx_dw  :
                      if (( P1_P2_P1_InstQueueWr_Addr - P1_P2_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P2_P1_EBX  <= P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P2_P1_InstQueue [( P1_P2_P1_InstQueueRd_Addr +1)%1];
                            P1_P2_P1_More  =1'b0;
                            P1_P2_P1_Flush  =1'b0;
                            P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +5;
                            P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P2_P1_Flush  =1'b0;
                            P1_P2_P1_More  =1'b1;
                         end 
                    P1_P2_P1_MOV_eax_ebx  :
                      if (( P1_P2_P1_InstQueueWr_Addr - P1_P2_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P2_P1_EBX <0)
                               P1_P2_P1_rEIP  <=- P1_P2_P1_EBX ;
                            else 
                               P1_P2_P1_rEIP  <= P1_P2_P1_EBX ;
                            P1_P2_P1_RequestPending  <= P1_P2_P1_Pending ;
                            P1_P2_P1_ReadRequest  <= P1_P2_P1_Pending ;
                            P1_P2_P1_MemoryFetch  <= P1_P2_P1_Pending ;
                            P1_P2_P1_CodeFetch  <= P1_P2_P1_NotPending ;
                           if ( P1_P2_P1_READY_n ==1'b0)
                              begin 
                                 P1_P2_P1_RequestPending  <= P1_P2_P1_NotPending ;
                                 P1_P2_P1_uWord  = P1_P2_P1_Datai %(2**15);
                                if ( P1_P2_P1_StateBS16 ==1'b1)
                                    P1_P2_P1_lWord  = P1_P2_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P2_P1_rEIP  <= P1_P2_P1_rEIP +2;
                                      P1_P2_P1_RequestPending  <= P1_P2_P1_Pending ;
                                     if ( P1_P2_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P2_P1_RequestPending  <= P1_P2_P1_NotPending ;
                                           P1_P2_P1_lWord  = P1_P2_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P2_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P2_P1_EAX  <= P1_P2_P1_uWord *(2**16)+ P1_P2_P1_lWord ;
                                      P1_P2_P1_More  =1'b0;
                                      P1_P2_P1_Flush  =1'b0;
                                      P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +2;
                                      P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P1_Flush  =1'b0;
                            P1_P2_P1_More  =1'b1;
                         end 
                    P1_P2_P1_MOV_ebx_eax  :
                      if (( P1_P2_P1_InstQueueWr_Addr - P1_P2_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P2_P1_EBX <0)
                               P1_P2_P1_rEIP  <= P1_P2_P1_EBX ;
                            else 
                               P1_P2_P1_rEIP  <= P1_P2_P1_EBX ;
                            P1_P2_P1_lWord  = P1_P2_P1_EAX %(2**16);
                            P1_P2_P1_uWord  =( P1_P2_P1_EAX /(2**16))%(2**15);
                            P1_P2_P1_RequestPending  <= P1_P2_P1_Pending ;
                            P1_P2_P1_ReadRequest  <= P1_P2_P1_NotPending ;
                            P1_P2_P1_MemoryFetch  <= P1_P2_P1_Pending ;
                            P1_P2_P1_CodeFetch  <= P1_P2_P1_NotPending ;
                           if ( P1_P2_P1_State == P1_P2_P1_StateT1 | P1_P2_P1_State == P1_P2_P1_StateT1P )
                              begin 
                                 P1_P2_P1_Datao  <=( P1_P2_P1_uWord *(2**16)+ P1_P2_P1_lWord );
                                if ( P1_P2_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P2_P1_RequestPending  <= P1_P2_P1_NotPending ;
                                     if ( P1_P2_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P2_P1_rEIP  <= P1_P2_P1_rEIP +2;
                                           P1_P2_P1_RequestPending  <= P1_P2_P1_Pending ;
                                           P1_P2_P1_ReadRequest  <= P1_P2_P1_NotPending ;
                                           P1_P2_P1_MemoryFetch  <= P1_P2_P1_Pending ;
                                           P1_P2_P1_CodeFetch  <= P1_P2_P1_NotPending ;
                                           P1_P2_P1_State2  = P1_P2_P1_S6 ;
                                        end 
                                      P1_P2_P1_More  =1'b0;
                                      P1_P2_P1_Flush  =1'b0;
                                      P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +2;
                                      P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P1_Flush  =1'b0;
                            P1_P2_P1_More  =1'b1;
                         end 
                    P1_P2_P1_IN_al  :
                      if (( P1_P2_P1_InstQueueWr_Addr - P1_P2_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P2_P1_rEIP  <= P1_P2_P1_InstQueueRd_Addr +1;
                            P1_P2_P1_RequestPending  <= P1_P2_P1_Pending ;
                            P1_P2_P1_ReadRequest  <= P1_P2_P1_Pending ;
                            P1_P2_P1_MemoryFetch  <= P1_P2_P1_NotPending ;
                            P1_P2_P1_CodeFetch  <= P1_P2_P1_NotPending ;
                           if ( P1_P2_P1_READY_n ==1'b0)
                              begin 
                                 P1_P2_P1_RequestPending  <= P1_P2_P1_NotPending ;
                                 P1_P2_P1_EAX  <= P1_P2_P1_Datai ;
                                 P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +2;
                                 P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +2);
                                 P1_P2_P1_Flush  =1'b0;
                                 P1_P2_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P1_Flush  =1'b0;
                            P1_P2_P1_More  =1'b1;
                         end 
                    P1_P2_P1_OUT_al  :
                      if (( P1_P2_P1_InstQueueWr_Addr - P1_P2_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P2_P1_rEIP  <= P1_P2_P1_InstQueueRd_Addr +1;
                            P1_P2_P1_RequestPending  <= P1_P2_P1_Pending ;
                            P1_P2_P1_ReadRequest  <= P1_P2_P1_NotPending ;
                            P1_P2_P1_MemoryFetch  <= P1_P2_P1_NotPending ;
                            P1_P2_P1_CodeFetch  <= P1_P2_P1_NotPending ;
                           if ( P1_P2_P1_State == P1_P2_P1_StateT1 | P1_P2_P1_State == P1_P2_P1_StateT1P )
                              begin 
                                 P1_P2_P1_fWord  = P1_P2_P1_EAX %(2**16);
                                 P1_P2_P1_Datao  <= P1_P2_P1_fWord ;
                                if ( P1_P2_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P2_P1_RequestPending  <= P1_P2_P1_NotPending ;
                                      P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +2;
                                      P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +2)%16;
                                      P1_P2_P1_Flush  =1'b0;
                                      P1_P2_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P1_Flush  =1'b0;
                            P1_P2_P1_More  =1'b1;
                         end 
                    P1_P2_P1_ADD_al_b  :
                      begin 
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +1;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +1)%16;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                    P1_P2_P1_ADD_ax_w  :
                      begin 
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +1;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +1)%16;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                    P1_P2_P1_ROL_al_1  :
                      begin 
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +2;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +2)%16;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                    P1_P2_P1_ROL_al_n  :
                      begin 
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +2;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +2)%16;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                    P1_P2_P1_INC_eax  :
                      begin 
                         P1_P2_P1_EAX  <= P1_P2_P1_EAX +1;
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +1;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +1)%16;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                    P1_P2_P1_INC_ebx  :
                      begin 
                         P1_P2_P1_EBX  <= P1_P2_P1_EBX +1;
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +1;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +1)%16;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P2_P1_InstAddrPointer  = P1_P2_P1_InstAddrPointer +1;
                         P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +1)%16;
                         P1_P2_P1_Flush  =1'b0;
                         P1_P2_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P2_P1_InstQueueRd_Addr < P1_P2_P1_InstQueueWr_Addr ))|((( P1_P2_P1_InstQueueLimit - P1_P2_P1_InstQueueRd_Addr )<4)| P1_P2_P1_Flush | P1_P2_P1_More ))
                      P1_P2_P1_State2  = P1_P2_P1_S7 ;
                end 
              P1_P2_P1_S6  :
                begin 
                   P1_P2_P1_Datao  <=( P1_P2_P1_uWord *(2**16)+ P1_P2_P1_lWord );
                  if ( P1_P2_P1_READY_n ==1'b0)
                     begin 
                        P1_P2_P1_RequestPending  <= P1_P2_P1_NotPending ;
                        P1_P2_P1_State2  = P1_P2_P1_S5 ;
                     end 
                end 
              P1_P2_P1_S7  :
                begin 
                  if ( P1_P2_P1_Flush )
                     begin 
                        P1_P2_P1_InstQueueRd_Addr  =1;
                        P1_P2_P1_InstQueueWr_Addr  =1;
                       if ( P1_P2_P1_InstAddrPointer <0)
                           P1_P2_P1_fWord  =- P1_P2_P1_InstAddrPointer ;
                        else 
                           P1_P2_P1_fWord  = P1_P2_P1_InstAddrPointer ;
                       if ( P1_P2_P1_fWord %2==1)
                           P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr + P1_P2_P1_fWord %4)%16;
                     end 
                  if (( P1_P2_P1_InstQueueLimit - P1_P2_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P2_P1_State2  = P1_P2_P1_S8 ;
                        P1_P2_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P2_P1_State2  = P1_P2_P1_S9 ;
                end 
              P1_P2_P1_S8  :
                if ( P1_P2_P1_InstQueueRd_Addr <= P1_P2_P1_InstQueueLimit )
                   begin 
                      P1_P2_P1_InstQueue  [ P1_P2_P1_InstQueueWr_Addr ]= P1_P2_P1_InstQueue [ P1_P2_P1_InstQueueRd_Addr ];
                      P1_P2_P1_InstQueueRd_Addr  =( P1_P2_P1_InstQueueRd_Addr +1)%16;
                      P1_P2_P1_InstQueueWr_Addr  =( P1_P2_P1_InstQueueWr_Addr +1)%16;
                      P1_P2_P1_State2  = P1_P2_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P2_P1_InstQueueRd_Addr  =0;
                      P1_P2_P1_State2  = P1_P2_P1_S9 ;
                   end 
              P1_P2_P1_S9  :
                begin 
                   P1_P2_P1_rEIP  <= P1_P2_P1_PhyAddrPointer ;
                   P1_P2_P1_State2  = P1_P2_P1_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P1_P2_P1_CLOCK or posedge  P1_P2_P1_RESET )
       begin 
         if ( P1_P2_P1_RESET ==1'b1)
            begin 
               P1_P2_P1_ByteEnable  <=4'b0000;
               P1_P2_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P2_P1_DataWidth )
              P1_P2_P1_WidthByte  :
                case ( P1_P2_P1_rEIP %4)
                 0 :
                     P1_P2_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P2_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P2_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P2_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P2_P1_WidthWord  :
                case ( P1_P2_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P2_P1_ByteEnable  <=4'b1100;
                       P1_P2_P1_NonAligned  <= P1_P2_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P2_P1_ByteEnable  <=4'b1001;
                       P1_P2_P1_NonAligned  <= P1_P2_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P2_P1_ByteEnable  <=4'b0011;
                       P1_P2_P1_NonAligned  <= P1_P2_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P2_P1_ByteEnable  <=4'b0111;
                       P1_P2_P1_NonAligned  <= P1_P2_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P2_P1_WidthDword  :
                case ( P1_P2_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P2_P1_ByteEnable  <=4'b0000;
                       P1_P2_P1_NonAligned  <= P1_P2_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P2_P1_ByteEnable  <=4'b0001;
                       P1_P2_P1_NonAligned  <= P1_P2_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P2_P1_NonAligned  <= P1_P2_P1_Pending ;
                       P1_P2_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P2_P1_NonAligned  <= P1_P2_P1_Pending ;
                       P1_P2_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
 
   reg P1_P2_P2_StateNA ; 
   reg P1_P2_P2_StateBS16 ; 
   reg P1_P2_P2_RequestPending ; 
 parameter P1_P2_P2_Pending =1'b1; 
 parameter P1_P2_P2_NotPending =1'b0; 
   reg P1_P2_P2_NonAligned ; 
   reg P1_P2_P2_ReadRequest ; 
   reg P1_P2_P2_MemoryFetch ; 
   reg P1_P2_P2_CodeFetch ; 
   reg[3:0] P1_P2_P2_ByteEnable ; 
   integer P1_P2_P2_DataWidth ; 
 parameter P1_P2_P2_WidthByte =0; 
 parameter P1_P2_P2_WidthWord =1; 
 parameter P1_P2_P2_WidthDword =2; 
   reg[2:0] P1_P2_P2_State ; 
 parameter P1_P2_P2_StateInit =0; 
 parameter P1_P2_P2_StateTi =1; 
 parameter P1_P2_P2_StateT1 =2; 
 parameter P1_P2_P2_StateT2 =3; 
 parameter P1_P2_P2_StateT1P =4; 
 parameter P1_P2_P2_StateTh =5; 
 parameter P1_P2_P2_StateT2P =6; 
 parameter P1_P2_P2_StateT2I =7; 
   integer P1_P2_P2_EAX ; 
   integer P1_P2_P2_EBX ; 
   integer P1_P2_P2_rEIP ; 
 parameter P1_P2_P2_REP =8'hF3; 
 parameter P1_P2_P2_REPNE =8'hF2; 
 parameter P1_P2_P2_LOCK =8'hF0; 
 parameter P1_P2_P2_CSsop =8'h2E; 
 parameter P1_P2_P2_SSsop =8'h36; 
 parameter P1_P2_P2_DSsop =8'h3E; 
 parameter P1_P2_P2_ESsop =8'h26; 
 parameter P1_P2_P2_FSsop =8'h64; 
 parameter P1_P2_P2_GSsop =8'h65; 
 parameter P1_P2_P2_OPsop =8'h66; 
 parameter P1_P2_P2_ADsop =8'h67; 
 parameter P1_P2_P2_MOV_al_b =8'hB0; 
 parameter P1_P2_P2_MOV_eax_dw =8'hB8; 
 parameter P1_P2_P2_MOV_ebx_dw =8'hBB; 
 parameter P1_P2_P2_MOV_ebx_eax =8'h89; 
 parameter P1_P2_P2_MOV_eax_ebx =8'h8B; 
 parameter P1_P2_P2_IN_al =8'hE4; 
 parameter P1_P2_P2_OUT_al =8'hE6; 
 parameter P1_P2_P2_ADD_al_b =8'h04; 
 parameter P1_P2_P2_ADD_ax_w =8'h05; 
 parameter P1_P2_P2_ROL_eax_b =8'hD1; 
 parameter P1_P2_P2_ROL_al_1 =8'hD0; 
 parameter P1_P2_P2_ROL_al_n =8'hC0; 
 parameter P1_P2_P2_INC_eax =8'h40; 
 parameter P1_P2_P2_INC_ebx =8'h43; 
 parameter P1_P2_P2_JMP_rel_short =8'hEB; 
 parameter P1_P2_P2_JMP_rel_near =8'hE9; 
 parameter P1_P2_P2_JMP_intseg_immed =8'hEA; 
 parameter P1_P2_P2_HLT =8'hF4; 
 parameter P1_P2_P2_WAITx =8'h9B; 
 parameter P1_P2_P2_NOP =8'h90; 
   reg[7:0] P1_P2_P2_InstQueue [15:0]; 
   reg[4:0] P1_P2_P2_InstQueueRd_Addr ; 
   reg[4:0] P1_P2_P2_InstQueueWr_Addr ; 
 parameter P1_P2_P2_InstQueueLimit =15; 
   integer P1_P2_P2_InstAddrPointer ; 
   integer P1_P2_P2_PhyAddrPointer ; 
   reg P1_P2_P2_Extended ; 
   reg P1_P2_P2_More ; 
   reg P1_P2_P2_Flush ; 
   reg[15:0] P1_P2_P2_lWord ; 
   reg[14:0] P1_P2_P2_uWord ; 
   integer P1_P2_P2_fWord ; 
   reg[3:0] P1_P2_P2_State2 ; 
 parameter P1_P2_P2_Si =0; 
 parameter P1_P2_P2_S1 =1; 
 parameter P1_P2_P2_S2 =2; 
 parameter P1_P2_P2_S3 =3; 
 parameter P1_P2_P2_S4 =4; 
 parameter P1_P2_P2_S5 =5; 
 parameter P1_P2_P2_S6 =6; 
 parameter P1_P2_P2_S7 =7; 
 parameter P1_P2_P2_S8 =8; 
 parameter P1_P2_P2_S9 =9; 
  always @(  posedge   P1_P2_P2_CLOCK or posedge  P1_P2_P2_RESET )
       begin 
         if ( P1_P2_P2_RESET ==1'b1)
            begin 
               P1_P2_P2_BE_n  <=4'b0000;
               P1_P2_P2_Address  <=0;
               P1_P2_P2_W_R_n  <=1'b0;
               P1_P2_P2_D_C_n  <=1'b0;
               P1_P2_P2_M_IO_n  <=1'b0;
               P1_P2_P2_ADS_n  <=1'b0;
               P1_P2_P2_State  <= P1_P2_P2_StateInit ;
               P1_P2_P2_StateNA  <=1'b0;
               P1_P2_P2_StateBS16  <=1'b0;
               P1_P2_P2_DataWidth  <=0;
            end 
          else 
            case ( P1_P2_P2_State )
              P1_P2_P2_StateInit  :
                begin 
                   P1_P2_P2_D_C_n  <=1'b1;
                   P1_P2_P2_ADS_n  <=1'b1;
                   P1_P2_P2_State  <= P1_P2_P2_StateTi ;
                   P1_P2_P2_StateNA  <=1'b1;
                   P1_P2_P2_StateBS16  <=1'b1;
                   P1_P2_P2_DataWidth  <=2;
                   P1_P2_P2_State  <= P1_P2_P2_StateTi ;
                end 
              P1_P2_P2_StateTi  :
                if ( P1_P2_P2_RequestPending == P1_P2_P2_Pending )
                    P1_P2_P2_State  <= P1_P2_P2_StateT1 ;
                 else 
                   if ( P1_P2_P2_HOLD ==1'b1)
                       P1_P2_P2_State  <= P1_P2_P2_StateTh ;
                    else 
                       P1_P2_P2_State  <= P1_P2_P2_StateTi ;
              P1_P2_P2_StateT1  :
                begin 
                   P1_P2_P2_Address  <= P1_P2_P2_rEIP /4%2**30;
                   P1_P2_P2_BE_n  <= P1_P2_P2_ByteEnable ;
                   P1_P2_P2_M_IO_n  <= P1_P2_P2_MemoryFetch ;
                  if ( P1_P2_P2_ReadRequest == P1_P2_P2_Pending )
                      P1_P2_P2_W_R_n  <=1'b0;
                   else 
                      P1_P2_P2_W_R_n  <=1'b1;
                  if ( P1_P2_P2_CodeFetch == P1_P2_P2_Pending )
                      P1_P2_P2_D_C_n  <=1'b0;
                   else 
                      P1_P2_P2_D_C_n  <=1'b1;
                   P1_P2_P2_ADS_n  <=1'b0;
                   P1_P2_P2_State  <= P1_P2_P2_StateT2 ;
                end 
              P1_P2_P2_StateT2  :
                begin 
                  if ( P1_P2_P2_READY_n ==1'b0& P1_P2_P2_HOLD ==1'b0& P1_P2_P2_RequestPending == P1_P2_P2_Pending )
                      P1_P2_P2_State  <= P1_P2_P2_StateT1 ;
                   else 
                     if ( P1_P2_P2_READY_n ==1'b1& P1_P2_P2_NA_n ==1'b1);
                      else 
                        if (( P1_P2_P2_RequestPending == P1_P2_P2_Pending | P1_P2_P2_HOLD ==1'b1)&( P1_P2_P2_READY_n ==1'b1& P1_P2_P2_NA_n ==1'b0))
                            P1_P2_P2_State  <= P1_P2_P2_StateT2I ;
                         else 
                           if ( P1_P2_P2_RequestPending == P1_P2_P2_Pending & P1_P2_P2_HOLD ==1'b0& P1_P2_P2_READY_n ==1'b1& P1_P2_P2_NA_n ==1'b0)
                               P1_P2_P2_State  <= P1_P2_P2_StateT2P ;
                            else 
                              if ( P1_P2_P2_RequestPending == P1_P2_P2_NotPending & P1_P2_P2_HOLD ==1'b0& P1_P2_P2_READY_n ==1'b0)
                                  P1_P2_P2_State  <= P1_P2_P2_StateTi ;
                               else 
                                 if ( P1_P2_P2_HOLD ==1'b1& P1_P2_P2_READY_n ==1'b1)
                                     P1_P2_P2_State  <= P1_P2_P2_StateTh ;
                                  else 
                                     P1_P2_P2_State  <= P1_P2_P2_StateT2 ;
                   P1_P2_P2_StateBS16  <= P1_P2_P2_BS16_n ;
                  if ( P1_P2_P2_BS16_n ==1'b0)
                      P1_P2_P2_DataWidth  <= P1_P2_P2_WidthWord ;
                   else 
                      P1_P2_P2_DataWidth  <= P1_P2_P2_WidthDword ;
                   P1_P2_P2_StateNA  <= P1_P2_P2_NA_n ;
                   P1_P2_P2_ADS_n  <=1'b1;
                end 
              P1_P2_P2_StateT1P  :
                begin 
                  if ( P1_P2_P2_NA_n ==1'b0& P1_P2_P2_HOLD ==1'b0& P1_P2_P2_RequestPending == P1_P2_P2_Pending )
                      P1_P2_P2_State  <= P1_P2_P2_StateT2P ;
                   else 
                     if ( P1_P2_P2_NA_n ==1'b0&( P1_P2_P2_HOLD ==1'b1| P1_P2_P2_RequestPending == P1_P2_P2_NotPending ))
                         P1_P2_P2_State  <= P1_P2_P2_StateT2I ;
                      else 
                        if ( P1_P2_P2_NA_n ==1'b1)
                            P1_P2_P2_State  <= P1_P2_P2_StateT2 ;
                         else 
                            P1_P2_P2_State  <= P1_P2_P2_StateT1P ;
                   P1_P2_P2_StateBS16  <= P1_P2_P2_BS16_n ;
                  if ( P1_P2_P2_BS16_n ==1'b0)
                      P1_P2_P2_DataWidth  <= P1_P2_P2_WidthWord ;
                   else 
                      P1_P2_P2_DataWidth  <= P1_P2_P2_WidthDword ;
                   P1_P2_P2_StateNA  <= P1_P2_P2_NA_n ;
                   P1_P2_P2_ADS_n  <=1'b1;
                end 
              P1_P2_P2_StateTh  :
                if ( P1_P2_P2_HOLD ==1'b0& P1_P2_P2_RequestPending == P1_P2_P2_Pending )
                    P1_P2_P2_State  <= P1_P2_P2_StateT1 ;
                 else 
                   if ( P1_P2_P2_HOLD ==1'b0& P1_P2_P2_RequestPending == P1_P2_P2_NotPending )
                       P1_P2_P2_State  <= P1_P2_P2_StateTi ;
                    else 
                       P1_P2_P2_State  <= P1_P2_P2_StateTh ;
              P1_P2_P2_StateT2P  :
                begin 
                   P1_P2_P2_Address  <= P1_P2_P2_rEIP /2%2**30;
                   P1_P2_P2_BE_n  <= P1_P2_P2_ByteEnable ;
                   P1_P2_P2_M_IO_n  <= P1_P2_P2_MemoryFetch ;
                  if ( P1_P2_P2_ReadRequest == P1_P2_P2_Pending )
                      P1_P2_P2_W_R_n  <=1'b0;
                   else 
                      P1_P2_P2_W_R_n  <=1'b1;
                  if ( P1_P2_P2_CodeFetch == P1_P2_P2_Pending )
                      P1_P2_P2_D_C_n  <=1'b0;
                   else 
                      P1_P2_P2_D_C_n  <=1'b1;
                   P1_P2_P2_ADS_n  <=1'b0;
                  if ( P1_P2_P2_READY_n ==1'b0)
                      P1_P2_P2_State  <= P1_P2_P2_StateT1P ;
                   else 
                      P1_P2_P2_State  <= P1_P2_P2_StateT2P ;
                end 
              P1_P2_P2_StateT2I  :
                if ( P1_P2_P2_READY_n ==1'b1& P1_P2_P2_RequestPending == P1_P2_P2_Pending & P1_P2_P2_HOLD ==1'b0)
                    P1_P2_P2_State  <= P1_P2_P2_StateT2P ;
                 else 
                   if ( P1_P2_P2_READY_n ==1'b0& P1_P2_P2_HOLD ==1'b1)
                       P1_P2_P2_State  <= P1_P2_P2_StateTh ;
                    else 
                      if ( P1_P2_P2_READY_n ==1'b0& P1_P2_P2_HOLD ==1'b0& P1_P2_P2_RequestPending == P1_P2_P2_Pending )
                          P1_P2_P2_State  <= P1_P2_P2_StateT1 ;
                       else 
                         if ( P1_P2_P2_READY_n ==1'b0& P1_P2_P2_HOLD ==1'b0& P1_P2_P2_RequestPending == P1_P2_P2_NotPending )
                             P1_P2_P2_State  <= P1_P2_P2_StateTi ;
                          else 
                             P1_P2_P2_State  <= P1_P2_P2_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P1_P2_P2_CLOCK or posedge  P1_P2_P2_RESET )
       begin 
         if ( P1_P2_P2_RESET ==1'b1)
            begin 
               P1_P2_P2_State2  = P1_P2_P2_Si ;
               P1_P2_P2_InstQueue  [0]=8'b0000_0000;
               P1_P2_P2_InstQueue  [1]=8'b0000_0000;
               P1_P2_P2_InstQueue  [2]=8'b0000_0000;
               P1_P2_P2_InstQueue  [3]=8'b0000_0000;
               P1_P2_P2_InstQueue  [4]=8'b0000_0000;
               P1_P2_P2_InstQueue  [5]=8'b0000_0000;
               P1_P2_P2_InstQueue  [6]=8'b0000_0000;
               P1_P2_P2_InstQueue  [7]=8'b0000_0000;
               P1_P2_P2_InstQueue  [8]=8'b0000_0000;
               P1_P2_P2_InstQueue  [9]=8'b0000_0000;
               P1_P2_P2_InstQueue  [10]=8'b0000_0000;
               P1_P2_P2_InstQueue  [11]=8'b0000_0000;
               P1_P2_P2_InstQueue  [12]=8'b0000_0000;
               P1_P2_P2_InstQueue  [13]=8'b0000_0000;
               P1_P2_P2_InstQueue  [14]=8'b0000_0000;
               P1_P2_P2_InstQueue  [15]=8'b0000_0000;
               P1_P2_P2_InstQueueRd_Addr  =0;
               P1_P2_P2_InstQueueWr_Addr  =0;
               P1_P2_P2_InstAddrPointer  =0;
               P1_P2_P2_PhyAddrPointer  =0;
               P1_P2_P2_Extended  =1'b0;
               P1_P2_P2_More  =1'b0;
               P1_P2_P2_Flush  =1'b0;
               P1_P2_P2_lWord  =0;
               P1_P2_P2_uWord  =0;
               P1_P2_P2_fWord  =0;
               P1_P2_P2_CodeFetch  <=1'b0;
               P1_P2_P2_Datao  <=0;
               P1_P2_P2_EAX  <=0;
               P1_P2_P2_EBX  <=0;
               P1_P2_P2_rEIP  <=0;
               P1_P2_P2_ReadRequest  <=1'b0;
               P1_P2_P2_MemoryFetch  <=1'b0;
               P1_P2_P2_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P2_P2_State2 )
              P1_P2_P2_Si  :
                begin 
                   P1_P2_P2_PhyAddrPointer  = P1_P2_P2_rEIP ;
                   P1_P2_P2_InstAddrPointer  = P1_P2_P2_PhyAddrPointer ;
                   P1_P2_P2_State2  = P1_P2_P2_S1 ;
                   P1_P2_P2_rEIP  <=20'hFFFF0;
                   P1_P2_P2_ReadRequest  <=1'b1;
                   P1_P2_P2_MemoryFetch  <=1'b1;
                   P1_P2_P2_RequestPending  <=1'b1;
                end 
              P1_P2_P2_S1  :
                begin 
                   P1_P2_P2_RequestPending  <= P1_P2_P2_Pending ;
                   P1_P2_P2_ReadRequest  <= P1_P2_P2_Pending ;
                   P1_P2_P2_MemoryFetch  <= P1_P2_P2_Pending ;
                   P1_P2_P2_CodeFetch  <= P1_P2_P2_Pending ;
                  if ( P1_P2_P2_READY_n ==1'b0)
                      P1_P2_P2_State2  = P1_P2_P2_S2 ;
                   else 
                      P1_P2_P2_State2  = P1_P2_P2_S1 ;
                end 
              P1_P2_P2_S2  :
                begin 
                   P1_P2_P2_RequestPending  <= P1_P2_P2_NotPending ;
                   P1_P2_P2_InstQueue  [ P1_P2_P2_InstQueueWr_Addr ]= P1_P2_P2_Datai %(2**8);
                   P1_P2_P2_InstQueueWr_Addr  =( P1_P2_P2_InstQueueWr_Addr +1)%16;
                   P1_P2_P2_InstQueue  [ P1_P2_P2_InstQueueWr_Addr ]= P1_P2_P2_Datai %2**8;
                   P1_P2_P2_InstQueueWr_Addr  =( P1_P2_P2_InstQueueWr_Addr +1)%16;
                  if ( P1_P2_P2_StateBS16 ==1'b1)
                     begin 
                        P1_P2_P2_InstQueue  [ P1_P2_P2_InstQueueWr_Addr ]=( P1_P2_P2_Datai /(2**16))%(2**8);
                        P1_P2_P2_InstQueueWr_Addr  =( P1_P2_P2_InstQueueWr_Addr +1)%16;
                        P1_P2_P2_InstQueue  [ P1_P2_P2_InstQueueWr_Addr ]=( P1_P2_P2_Datai /(2**24))%(2**8);
                        P1_P2_P2_InstQueueWr_Addr  =( P1_P2_P2_InstQueueWr_Addr +1)%16;
                        P1_P2_P2_PhyAddrPointer  = P1_P2_P2_PhyAddrPointer +4;
                        P1_P2_P2_State2  = P1_P2_P2_S5 ;
                     end 
                   else 
                     begin 
                        P1_P2_P2_PhyAddrPointer  = P1_P2_P2_PhyAddrPointer +2;
                       if ( P1_P2_P2_PhyAddrPointer <0)
                           P1_P2_P2_rEIP  <=- P1_P2_P2_PhyAddrPointer ;
                        else 
                           P1_P2_P2_rEIP  <= P1_P2_P2_PhyAddrPointer ;
                        P1_P2_P2_State2  = P1_P2_P2_S3 ;
                     end 
                end 
              P1_P2_P2_S3  :
                begin 
                   P1_P2_P2_RequestPending  <= P1_P2_P2_Pending ;
                  if ( P1_P2_P2_READY_n ==1'b0)
                      P1_P2_P2_State2  = P1_P2_P2_S4 ;
                   else 
                      P1_P2_P2_State2  = P1_P2_P2_S3 ;
                end 
              P1_P2_P2_S4  :
                begin 
                   P1_P2_P2_RequestPending  <= P1_P2_P2_NotPending ;
                   P1_P2_P2_InstQueue  [ P1_P2_P2_InstQueueWr_Addr ]= P1_P2_P2_Datai %(2**8);
                   P1_P2_P2_InstQueueWr_Addr  =( P1_P2_P2_InstQueueWr_Addr +1)%16;
                   P1_P2_P2_InstQueue  [ P1_P2_P2_InstQueueWr_Addr ]= P1_P2_P2_Datai %(2**8);
                   P1_P2_P2_InstQueueWr_Addr  =( P1_P2_P2_InstQueueWr_Addr +1)%16;
                   P1_P2_P2_PhyAddrPointer  = P1_P2_P2_PhyAddrPointer +2;
                   P1_P2_P2_State2  = P1_P2_P2_S5 ;
                end 
              P1_P2_P2_S5  :
                begin 
                  case ( P1_P2_P2_InstQueue [ P1_P2_P2_InstQueueRd_Addr ])
                    P1_P2_P2_NOP  :
                      begin 
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +1;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +1)%16;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                    P1_P2_P2_OPsop  :
                      begin 
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +1;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +1)%16;
                         P1_P2_P2_Extended  =1'b1;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                    P1_P2_P2_JMP_rel_short  :
                      if (( P1_P2_P2_InstQueueWr_Addr - P1_P2_P2_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P2_P2_PhyAddrPointer  = P1_P2_P2_InstAddrPointer +1-(8'hFF- P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +1)%16]);
                                 P1_P2_P2_InstAddrPointer  = P1_P2_P2_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P2_P2_PhyAddrPointer  = P1_P2_P2_InstAddrPointer +2+ P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +1)%16];
                                 P1_P2_P2_InstAddrPointer  = P1_P2_P2_PhyAddrPointer ;
                              end 
                            P1_P2_P2_Flush  =1'b1;
                            P1_P2_P2_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P2_P2_Flush  =1'b0;
                            P1_P2_P2_More  =1'b1;
                         end 
                    P1_P2_P2_JMP_rel_near  :
                      if (( P1_P2_P2_InstQueueWr_Addr - P1_P2_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P2_P2_PhyAddrPointer  = P1_P2_P2_InstAddrPointer +5+ P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +1)%16];
                            P1_P2_P2_InstAddrPointer  = P1_P2_P2_PhyAddrPointer ;
                            P1_P2_P2_Flush  =1'b1;
                            P1_P2_P2_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P2_P2_Flush  =1'b0;
                            P1_P2_P2_More  =1'b1;
                         end 
                    P1_P2_P2_JMP_intseg_immed  :
                      begin 
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +1;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +1)%16;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                    P1_P2_P2_MOV_al_b  :
                      begin 
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +1;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +1)%16;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                    P1_P2_P2_MOV_eax_dw  :
                      if (( P1_P2_P2_InstQueueWr_Addr - P1_P2_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P2_P2_EAX  <= P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +1)%16];
                            P1_P2_P2_More  =1'b0;
                            P1_P2_P2_Flush  =1'b0;
                            P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +5;
                            P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P2_P2_Flush  =1'b0;
                            P1_P2_P2_More  =1'b1;
                         end 
                    P1_P2_P2_MOV_ebx_dw  :
                      if (( P1_P2_P2_InstQueueWr_Addr - P1_P2_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P2_P2_EBX  <= P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P2_P2_InstQueue [( P1_P2_P2_InstQueueRd_Addr +1)%1];
                            P1_P2_P2_More  =1'b0;
                            P1_P2_P2_Flush  =1'b0;
                            P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +5;
                            P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P2_P2_Flush  =1'b0;
                            P1_P2_P2_More  =1'b1;
                         end 
                    P1_P2_P2_MOV_eax_ebx  :
                      if (( P1_P2_P2_InstQueueWr_Addr - P1_P2_P2_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P2_P2_EBX <0)
                               P1_P2_P2_rEIP  <=- P1_P2_P2_EBX ;
                            else 
                               P1_P2_P2_rEIP  <= P1_P2_P2_EBX ;
                            P1_P2_P2_RequestPending  <= P1_P2_P2_Pending ;
                            P1_P2_P2_ReadRequest  <= P1_P2_P2_Pending ;
                            P1_P2_P2_MemoryFetch  <= P1_P2_P2_Pending ;
                            P1_P2_P2_CodeFetch  <= P1_P2_P2_NotPending ;
                           if ( P1_P2_P2_READY_n ==1'b0)
                              begin 
                                 P1_P2_P2_RequestPending  <= P1_P2_P2_NotPending ;
                                 P1_P2_P2_uWord  = P1_P2_P2_Datai %(2**15);
                                if ( P1_P2_P2_StateBS16 ==1'b1)
                                    P1_P2_P2_lWord  = P1_P2_P2_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P2_P2_rEIP  <= P1_P2_P2_rEIP +2;
                                      P1_P2_P2_RequestPending  <= P1_P2_P2_Pending ;
                                     if ( P1_P2_P2_READY_n ==1'b0)
                                        begin 
                                           P1_P2_P2_RequestPending  <= P1_P2_P2_NotPending ;
                                           P1_P2_P2_lWord  = P1_P2_P2_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P2_P2_READY_n ==1'b0)
                                   begin 
                                      P1_P2_P2_EAX  <= P1_P2_P2_uWord *(2**16)+ P1_P2_P2_lWord ;
                                      P1_P2_P2_More  =1'b0;
                                      P1_P2_P2_Flush  =1'b0;
                                      P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +2;
                                      P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P2_Flush  =1'b0;
                            P1_P2_P2_More  =1'b1;
                         end 
                    P1_P2_P2_MOV_ebx_eax  :
                      if (( P1_P2_P2_InstQueueWr_Addr - P1_P2_P2_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P2_P2_EBX <0)
                               P1_P2_P2_rEIP  <= P1_P2_P2_EBX ;
                            else 
                               P1_P2_P2_rEIP  <= P1_P2_P2_EBX ;
                            P1_P2_P2_lWord  = P1_P2_P2_EAX %(2**16);
                            P1_P2_P2_uWord  =( P1_P2_P2_EAX /(2**16))%(2**15);
                            P1_P2_P2_RequestPending  <= P1_P2_P2_Pending ;
                            P1_P2_P2_ReadRequest  <= P1_P2_P2_NotPending ;
                            P1_P2_P2_MemoryFetch  <= P1_P2_P2_Pending ;
                            P1_P2_P2_CodeFetch  <= P1_P2_P2_NotPending ;
                           if ( P1_P2_P2_State == P1_P2_P2_StateT1 | P1_P2_P2_State == P1_P2_P2_StateT1P )
                              begin 
                                 P1_P2_P2_Datao  <=( P1_P2_P2_uWord *(2**16)+ P1_P2_P2_lWord );
                                if ( P1_P2_P2_READY_n ==1'b0)
                                   begin 
                                      P1_P2_P2_RequestPending  <= P1_P2_P2_NotPending ;
                                     if ( P1_P2_P2_StateBS16 ==1'b0)
                                        begin 
                                           P1_P2_P2_rEIP  <= P1_P2_P2_rEIP +2;
                                           P1_P2_P2_RequestPending  <= P1_P2_P2_Pending ;
                                           P1_P2_P2_ReadRequest  <= P1_P2_P2_NotPending ;
                                           P1_P2_P2_MemoryFetch  <= P1_P2_P2_Pending ;
                                           P1_P2_P2_CodeFetch  <= P1_P2_P2_NotPending ;
                                           P1_P2_P2_State2  = P1_P2_P2_S6 ;
                                        end 
                                      P1_P2_P2_More  =1'b0;
                                      P1_P2_P2_Flush  =1'b0;
                                      P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +2;
                                      P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P2_Flush  =1'b0;
                            P1_P2_P2_More  =1'b1;
                         end 
                    P1_P2_P2_IN_al  :
                      if (( P1_P2_P2_InstQueueWr_Addr - P1_P2_P2_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P2_P2_rEIP  <= P1_P2_P2_InstQueueRd_Addr +1;
                            P1_P2_P2_RequestPending  <= P1_P2_P2_Pending ;
                            P1_P2_P2_ReadRequest  <= P1_P2_P2_Pending ;
                            P1_P2_P2_MemoryFetch  <= P1_P2_P2_NotPending ;
                            P1_P2_P2_CodeFetch  <= P1_P2_P2_NotPending ;
                           if ( P1_P2_P2_READY_n ==1'b0)
                              begin 
                                 P1_P2_P2_RequestPending  <= P1_P2_P2_NotPending ;
                                 P1_P2_P2_EAX  <= P1_P2_P2_Datai ;
                                 P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +2;
                                 P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +2);
                                 P1_P2_P2_Flush  =1'b0;
                                 P1_P2_P2_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P2_Flush  =1'b0;
                            P1_P2_P2_More  =1'b1;
                         end 
                    P1_P2_P2_OUT_al  :
                      if (( P1_P2_P2_InstQueueWr_Addr - P1_P2_P2_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P2_P2_rEIP  <= P1_P2_P2_InstQueueRd_Addr +1;
                            P1_P2_P2_RequestPending  <= P1_P2_P2_Pending ;
                            P1_P2_P2_ReadRequest  <= P1_P2_P2_NotPending ;
                            P1_P2_P2_MemoryFetch  <= P1_P2_P2_NotPending ;
                            P1_P2_P2_CodeFetch  <= P1_P2_P2_NotPending ;
                           if ( P1_P2_P2_State == P1_P2_P2_StateT1 | P1_P2_P2_State == P1_P2_P2_StateT1P )
                              begin 
                                 P1_P2_P2_fWord  = P1_P2_P2_EAX %(2**16);
                                 P1_P2_P2_Datao  <= P1_P2_P2_fWord ;
                                if ( P1_P2_P2_READY_n ==1'b0)
                                   begin 
                                      P1_P2_P2_RequestPending  <= P1_P2_P2_NotPending ;
                                      P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +2;
                                      P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +2)%16;
                                      P1_P2_P2_Flush  =1'b0;
                                      P1_P2_P2_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P2_Flush  =1'b0;
                            P1_P2_P2_More  =1'b1;
                         end 
                    P1_P2_P2_ADD_al_b  :
                      begin 
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +1;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +1)%16;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                    P1_P2_P2_ADD_ax_w  :
                      begin 
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +1;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +1)%16;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                    P1_P2_P2_ROL_al_1  :
                      begin 
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +2;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +2)%16;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                    P1_P2_P2_ROL_al_n  :
                      begin 
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +2;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +2)%16;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                    P1_P2_P2_INC_eax  :
                      begin 
                         P1_P2_P2_EAX  <= P1_P2_P2_EAX +1;
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +1;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +1)%16;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                    P1_P2_P2_INC_ebx  :
                      begin 
                         P1_P2_P2_EBX  <= P1_P2_P2_EBX +1;
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +1;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +1)%16;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P2_P2_InstAddrPointer  = P1_P2_P2_InstAddrPointer +1;
                         P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +1)%16;
                         P1_P2_P2_Flush  =1'b0;
                         P1_P2_P2_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P2_P2_InstQueueRd_Addr < P1_P2_P2_InstQueueWr_Addr ))|((( P1_P2_P2_InstQueueLimit - P1_P2_P2_InstQueueRd_Addr )<4)| P1_P2_P2_Flush | P1_P2_P2_More ))
                      P1_P2_P2_State2  = P1_P2_P2_S7 ;
                end 
              P1_P2_P2_S6  :
                begin 
                   P1_P2_P2_Datao  <=( P1_P2_P2_uWord *(2**16)+ P1_P2_P2_lWord );
                  if ( P1_P2_P2_READY_n ==1'b0)
                     begin 
                        P1_P2_P2_RequestPending  <= P1_P2_P2_NotPending ;
                        P1_P2_P2_State2  = P1_P2_P2_S5 ;
                     end 
                end 
              P1_P2_P2_S7  :
                begin 
                  if ( P1_P2_P2_Flush )
                     begin 
                        P1_P2_P2_InstQueueRd_Addr  =1;
                        P1_P2_P2_InstQueueWr_Addr  =1;
                       if ( P1_P2_P2_InstAddrPointer <0)
                           P1_P2_P2_fWord  =- P1_P2_P2_InstAddrPointer ;
                        else 
                           P1_P2_P2_fWord  = P1_P2_P2_InstAddrPointer ;
                       if ( P1_P2_P2_fWord %2==1)
                           P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr + P1_P2_P2_fWord %4)%16;
                     end 
                  if (( P1_P2_P2_InstQueueLimit - P1_P2_P2_InstQueueRd_Addr )<3)
                     begin 
                        P1_P2_P2_State2  = P1_P2_P2_S8 ;
                        P1_P2_P2_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P2_P2_State2  = P1_P2_P2_S9 ;
                end 
              P1_P2_P2_S8  :
                if ( P1_P2_P2_InstQueueRd_Addr <= P1_P2_P2_InstQueueLimit )
                   begin 
                      P1_P2_P2_InstQueue  [ P1_P2_P2_InstQueueWr_Addr ]= P1_P2_P2_InstQueue [ P1_P2_P2_InstQueueRd_Addr ];
                      P1_P2_P2_InstQueueRd_Addr  =( P1_P2_P2_InstQueueRd_Addr +1)%16;
                      P1_P2_P2_InstQueueWr_Addr  =( P1_P2_P2_InstQueueWr_Addr +1)%16;
                      P1_P2_P2_State2  = P1_P2_P2_S8 ;
                   end 
                 else 
                   begin 
                      P1_P2_P2_InstQueueRd_Addr  =0;
                      P1_P2_P2_State2  = P1_P2_P2_S9 ;
                   end 
              P1_P2_P2_S9  :
                begin 
                   P1_P2_P2_rEIP  <= P1_P2_P2_PhyAddrPointer ;
                   P1_P2_P2_State2  = P1_P2_P2_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P1_P2_P2_CLOCK or posedge  P1_P2_P2_RESET )
       begin 
         if ( P1_P2_P2_RESET ==1'b1)
            begin 
               P1_P2_P2_ByteEnable  <=4'b0000;
               P1_P2_P2_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P2_P2_DataWidth )
              P1_P2_P2_WidthByte  :
                case ( P1_P2_P2_rEIP %4)
                 0 :
                     P1_P2_P2_ByteEnable  <=4'b1110;
                 1 :
                     P1_P2_P2_ByteEnable  <=4'b1101;
                 2 :
                     P1_P2_P2_ByteEnable  <=4'b1011;
                 3 :
                     P1_P2_P2_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P2_P2_WidthWord  :
                case ( P1_P2_P2_rEIP %4)
                 0 :
                    begin 
                       P1_P2_P2_ByteEnable  <=4'b1100;
                       P1_P2_P2_NonAligned  <= P1_P2_P2_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P2_P2_ByteEnable  <=4'b1001;
                       P1_P2_P2_NonAligned  <= P1_P2_P2_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P2_P2_ByteEnable  <=4'b0011;
                       P1_P2_P2_NonAligned  <= P1_P2_P2_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P2_P2_ByteEnable  <=4'b0111;
                       P1_P2_P2_NonAligned  <= P1_P2_P2_Pending ;
                    end 
                 default :;
                endcase 
              P1_P2_P2_WidthDword  :
                case ( P1_P2_P2_rEIP %4)
                 0 :
                    begin 
                       P1_P2_P2_ByteEnable  <=4'b0000;
                       P1_P2_P2_NonAligned  <= P1_P2_P2_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P2_P2_ByteEnable  <=4'b0001;
                       P1_P2_P2_NonAligned  <= P1_P2_P2_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P2_P2_NonAligned  <= P1_P2_P2_Pending ;
                       P1_P2_P2_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P2_P2_NonAligned  <= P1_P2_P2_Pending ;
                       P1_P2_P2_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
 
   reg P1_P2_P3_StateNA ; 
   reg P1_P2_P3_StateBS16 ; 
   reg P1_P2_P3_RequestPending ; 
 parameter P1_P2_P3_Pending =1'b1; 
 parameter P1_P2_P3_NotPending =1'b0; 
   reg P1_P2_P3_NonAligned ; 
   reg P1_P2_P3_ReadRequest ; 
   reg P1_P2_P3_MemoryFetch ; 
   reg P1_P2_P3_CodeFetch ; 
   reg[3:0] P1_P2_P3_ByteEnable ; 
   integer P1_P2_P3_DataWidth ; 
 parameter P1_P2_P3_WidthByte =0; 
 parameter P1_P2_P3_WidthWord =1; 
 parameter P1_P2_P3_WidthDword =2; 
   reg[2:0] P1_P2_P3_State ; 
 parameter P1_P2_P3_StateInit =0; 
 parameter P1_P2_P3_StateTi =1; 
 parameter P1_P2_P3_StateT1 =2; 
 parameter P1_P2_P3_StateT2 =3; 
 parameter P1_P2_P3_StateT1P =4; 
 parameter P1_P2_P3_StateTh =5; 
 parameter P1_P2_P3_StateT2P =6; 
 parameter P1_P2_P3_StateT2I =7; 
   integer P1_P2_P3_EAX ; 
   integer P1_P2_P3_EBX ; 
   integer P1_P2_P3_rEIP ; 
 parameter P1_P2_P3_REP =8'hF3; 
 parameter P1_P2_P3_REPNE =8'hF2; 
 parameter P1_P2_P3_LOCK =8'hF0; 
 parameter P1_P2_P3_CSsop =8'h2E; 
 parameter P1_P2_P3_SSsop =8'h36; 
 parameter P1_P2_P3_DSsop =8'h3E; 
 parameter P1_P2_P3_ESsop =8'h26; 
 parameter P1_P2_P3_FSsop =8'h64; 
 parameter P1_P2_P3_GSsop =8'h65; 
 parameter P1_P2_P3_OPsop =8'h66; 
 parameter P1_P2_P3_ADsop =8'h67; 
 parameter P1_P2_P3_MOV_al_b =8'hB0; 
 parameter P1_P2_P3_MOV_eax_dw =8'hB8; 
 parameter P1_P2_P3_MOV_ebx_dw =8'hBB; 
 parameter P1_P2_P3_MOV_ebx_eax =8'h89; 
 parameter P1_P2_P3_MOV_eax_ebx =8'h8B; 
 parameter P1_P2_P3_IN_al =8'hE4; 
 parameter P1_P2_P3_OUT_al =8'hE6; 
 parameter P1_P2_P3_ADD_al_b =8'h04; 
 parameter P1_P2_P3_ADD_ax_w =8'h05; 
 parameter P1_P2_P3_ROL_eax_b =8'hD1; 
 parameter P1_P2_P3_ROL_al_1 =8'hD0; 
 parameter P1_P2_P3_ROL_al_n =8'hC0; 
 parameter P1_P2_P3_INC_eax =8'h40; 
 parameter P1_P2_P3_INC_ebx =8'h43; 
 parameter P1_P2_P3_JMP_rel_short =8'hEB; 
 parameter P1_P2_P3_JMP_rel_near =8'hE9; 
 parameter P1_P2_P3_JMP_intseg_immed =8'hEA; 
 parameter P1_P2_P3_HLT =8'hF4; 
 parameter P1_P2_P3_WAITx =8'h9B; 
 parameter P1_P2_P3_NOP =8'h90; 
   reg[7:0] P1_P2_P3_InstQueue [15:0]; 
   reg[4:0] P1_P2_P3_InstQueueRd_Addr ; 
   reg[4:0] P1_P2_P3_InstQueueWr_Addr ; 
 parameter P1_P2_P3_InstQueueLimit =15; 
   integer P1_P2_P3_InstAddrPointer ; 
   integer P1_P2_P3_PhyAddrPointer ; 
   reg P1_P2_P3_Extended ; 
   reg P1_P2_P3_More ; 
   reg P1_P2_P3_Flush ; 
   reg[15:0] P1_P2_P3_lWord ; 
   reg[14:0] P1_P2_P3_uWord ; 
   integer P1_P2_P3_fWord ; 
   reg[3:0] P1_P2_P3_State2 ; 
 parameter P1_P2_P3_Si =0; 
 parameter P1_P2_P3_S1 =1; 
 parameter P1_P2_P3_S2 =2; 
 parameter P1_P2_P3_S3 =3; 
 parameter P1_P2_P3_S4 =4; 
 parameter P1_P2_P3_S5 =5; 
 parameter P1_P2_P3_S6 =6; 
 parameter P1_P2_P3_S7 =7; 
 parameter P1_P2_P3_S8 =8; 
 parameter P1_P2_P3_S9 =9; 
  always @(  posedge   P1_P2_P3_CLOCK or posedge  P1_P2_P3_RESET )
       begin 
         if ( P1_P2_P3_RESET ==1'b1)
            begin 
               P1_P2_P3_BE_n  <=4'b0000;
               P1_P2_P3_Address  <=0;
               P1_P2_P3_W_R_n  <=1'b0;
               P1_P2_P3_D_C_n  <=1'b0;
               P1_P2_P3_M_IO_n  <=1'b0;
               P1_P2_P3_ADS_n  <=1'b0;
               P1_P2_P3_State  <= P1_P2_P3_StateInit ;
               P1_P2_P3_StateNA  <=1'b0;
               P1_P2_P3_StateBS16  <=1'b0;
               P1_P2_P3_DataWidth  <=0;
            end 
          else 
            case ( P1_P2_P3_State )
              P1_P2_P3_StateInit  :
                begin 
                   P1_P2_P3_D_C_n  <=1'b1;
                   P1_P2_P3_ADS_n  <=1'b1;
                   P1_P2_P3_State  <= P1_P2_P3_StateTi ;
                   P1_P2_P3_StateNA  <=1'b1;
                   P1_P2_P3_StateBS16  <=1'b1;
                   P1_P2_P3_DataWidth  <=2;
                   P1_P2_P3_State  <= P1_P2_P3_StateTi ;
                end 
              P1_P2_P3_StateTi  :
                if ( P1_P2_P3_RequestPending == P1_P2_P3_Pending )
                    P1_P2_P3_State  <= P1_P2_P3_StateT1 ;
                 else 
                   if ( P1_P2_P3_HOLD ==1'b1)
                       P1_P2_P3_State  <= P1_P2_P3_StateTh ;
                    else 
                       P1_P2_P3_State  <= P1_P2_P3_StateTi ;
              P1_P2_P3_StateT1  :
                begin 
                   P1_P2_P3_Address  <= P1_P2_P3_rEIP /4%2**30;
                   P1_P2_P3_BE_n  <= P1_P2_P3_ByteEnable ;
                   P1_P2_P3_M_IO_n  <= P1_P2_P3_MemoryFetch ;
                  if ( P1_P2_P3_ReadRequest == P1_P2_P3_Pending )
                      P1_P2_P3_W_R_n  <=1'b0;
                   else 
                      P1_P2_P3_W_R_n  <=1'b1;
                  if ( P1_P2_P3_CodeFetch == P1_P2_P3_Pending )
                      P1_P2_P3_D_C_n  <=1'b0;
                   else 
                      P1_P2_P3_D_C_n  <=1'b1;
                   P1_P2_P3_ADS_n  <=1'b0;
                   P1_P2_P3_State  <= P1_P2_P3_StateT2 ;
                end 
              P1_P2_P3_StateT2  :
                begin 
                  if ( P1_P2_P3_READY_n ==1'b0& P1_P2_P3_HOLD ==1'b0& P1_P2_P3_RequestPending == P1_P2_P3_Pending )
                      P1_P2_P3_State  <= P1_P2_P3_StateT1 ;
                   else 
                     if ( P1_P2_P3_READY_n ==1'b1& P1_P2_P3_NA_n ==1'b1);
                      else 
                        if (( P1_P2_P3_RequestPending == P1_P2_P3_Pending | P1_P2_P3_HOLD ==1'b1)&( P1_P2_P3_READY_n ==1'b1& P1_P2_P3_NA_n ==1'b0))
                            P1_P2_P3_State  <= P1_P2_P3_StateT2I ;
                         else 
                           if ( P1_P2_P3_RequestPending == P1_P2_P3_Pending & P1_P2_P3_HOLD ==1'b0& P1_P2_P3_READY_n ==1'b1& P1_P2_P3_NA_n ==1'b0)
                               P1_P2_P3_State  <= P1_P2_P3_StateT2P ;
                            else 
                              if ( P1_P2_P3_RequestPending == P1_P2_P3_NotPending & P1_P2_P3_HOLD ==1'b0& P1_P2_P3_READY_n ==1'b0)
                                  P1_P2_P3_State  <= P1_P2_P3_StateTi ;
                               else 
                                 if ( P1_P2_P3_HOLD ==1'b1& P1_P2_P3_READY_n ==1'b1)
                                     P1_P2_P3_State  <= P1_P2_P3_StateTh ;
                                  else 
                                     P1_P2_P3_State  <= P1_P2_P3_StateT2 ;
                   P1_P2_P3_StateBS16  <= P1_P2_P3_BS16_n ;
                  if ( P1_P2_P3_BS16_n ==1'b0)
                      P1_P2_P3_DataWidth  <= P1_P2_P3_WidthWord ;
                   else 
                      P1_P2_P3_DataWidth  <= P1_P2_P3_WidthDword ;
                   P1_P2_P3_StateNA  <= P1_P2_P3_NA_n ;
                   P1_P2_P3_ADS_n  <=1'b1;
                end 
              P1_P2_P3_StateT1P  :
                begin 
                  if ( P1_P2_P3_NA_n ==1'b0& P1_P2_P3_HOLD ==1'b0& P1_P2_P3_RequestPending == P1_P2_P3_Pending )
                      P1_P2_P3_State  <= P1_P2_P3_StateT2P ;
                   else 
                     if ( P1_P2_P3_NA_n ==1'b0&( P1_P2_P3_HOLD ==1'b1| P1_P2_P3_RequestPending == P1_P2_P3_NotPending ))
                         P1_P2_P3_State  <= P1_P2_P3_StateT2I ;
                      else 
                        if ( P1_P2_P3_NA_n ==1'b1)
                            P1_P2_P3_State  <= P1_P2_P3_StateT2 ;
                         else 
                            P1_P2_P3_State  <= P1_P2_P3_StateT1P ;
                   P1_P2_P3_StateBS16  <= P1_P2_P3_BS16_n ;
                  if ( P1_P2_P3_BS16_n ==1'b0)
                      P1_P2_P3_DataWidth  <= P1_P2_P3_WidthWord ;
                   else 
                      P1_P2_P3_DataWidth  <= P1_P2_P3_WidthDword ;
                   P1_P2_P3_StateNA  <= P1_P2_P3_NA_n ;
                   P1_P2_P3_ADS_n  <=1'b1;
                end 
              P1_P2_P3_StateTh  :
                if ( P1_P2_P3_HOLD ==1'b0& P1_P2_P3_RequestPending == P1_P2_P3_Pending )
                    P1_P2_P3_State  <= P1_P2_P3_StateT1 ;
                 else 
                   if ( P1_P2_P3_HOLD ==1'b0& P1_P2_P3_RequestPending == P1_P2_P3_NotPending )
                       P1_P2_P3_State  <= P1_P2_P3_StateTi ;
                    else 
                       P1_P2_P3_State  <= P1_P2_P3_StateTh ;
              P1_P2_P3_StateT2P  :
                begin 
                   P1_P2_P3_Address  <= P1_P2_P3_rEIP /2%2**30;
                   P1_P2_P3_BE_n  <= P1_P2_P3_ByteEnable ;
                   P1_P2_P3_M_IO_n  <= P1_P2_P3_MemoryFetch ;
                  if ( P1_P2_P3_ReadRequest == P1_P2_P3_Pending )
                      P1_P2_P3_W_R_n  <=1'b0;
                   else 
                      P1_P2_P3_W_R_n  <=1'b1;
                  if ( P1_P2_P3_CodeFetch == P1_P2_P3_Pending )
                      P1_P2_P3_D_C_n  <=1'b0;
                   else 
                      P1_P2_P3_D_C_n  <=1'b1;
                   P1_P2_P3_ADS_n  <=1'b0;
                  if ( P1_P2_P3_READY_n ==1'b0)
                      P1_P2_P3_State  <= P1_P2_P3_StateT1P ;
                   else 
                      P1_P2_P3_State  <= P1_P2_P3_StateT2P ;
                end 
              P1_P2_P3_StateT2I  :
                if ( P1_P2_P3_READY_n ==1'b1& P1_P2_P3_RequestPending == P1_P2_P3_Pending & P1_P2_P3_HOLD ==1'b0)
                    P1_P2_P3_State  <= P1_P2_P3_StateT2P ;
                 else 
                   if ( P1_P2_P3_READY_n ==1'b0& P1_P2_P3_HOLD ==1'b1)
                       P1_P2_P3_State  <= P1_P2_P3_StateTh ;
                    else 
                      if ( P1_P2_P3_READY_n ==1'b0& P1_P2_P3_HOLD ==1'b0& P1_P2_P3_RequestPending == P1_P2_P3_Pending )
                          P1_P2_P3_State  <= P1_P2_P3_StateT1 ;
                       else 
                         if ( P1_P2_P3_READY_n ==1'b0& P1_P2_P3_HOLD ==1'b0& P1_P2_P3_RequestPending == P1_P2_P3_NotPending )
                             P1_P2_P3_State  <= P1_P2_P3_StateTi ;
                          else 
                             P1_P2_P3_State  <= P1_P2_P3_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P1_P2_P3_CLOCK or posedge  P1_P2_P3_RESET )
       begin 
         if ( P1_P2_P3_RESET ==1'b1)
            begin 
               P1_P2_P3_State2  = P1_P2_P3_Si ;
               P1_P2_P3_InstQueue  [0]=8'b0000_0000;
               P1_P2_P3_InstQueue  [1]=8'b0000_0000;
               P1_P2_P3_InstQueue  [2]=8'b0000_0000;
               P1_P2_P3_InstQueue  [3]=8'b0000_0000;
               P1_P2_P3_InstQueue  [4]=8'b0000_0000;
               P1_P2_P3_InstQueue  [5]=8'b0000_0000;
               P1_P2_P3_InstQueue  [6]=8'b0000_0000;
               P1_P2_P3_InstQueue  [7]=8'b0000_0000;
               P1_P2_P3_InstQueue  [8]=8'b0000_0000;
               P1_P2_P3_InstQueue  [9]=8'b0000_0000;
               P1_P2_P3_InstQueue  [10]=8'b0000_0000;
               P1_P2_P3_InstQueue  [11]=8'b0000_0000;
               P1_P2_P3_InstQueue  [12]=8'b0000_0000;
               P1_P2_P3_InstQueue  [13]=8'b0000_0000;
               P1_P2_P3_InstQueue  [14]=8'b0000_0000;
               P1_P2_P3_InstQueue  [15]=8'b0000_0000;
               P1_P2_P3_InstQueueRd_Addr  =0;
               P1_P2_P3_InstQueueWr_Addr  =0;
               P1_P2_P3_InstAddrPointer  =0;
               P1_P2_P3_PhyAddrPointer  =0;
               P1_P2_P3_Extended  =1'b0;
               P1_P2_P3_More  =1'b0;
               P1_P2_P3_Flush  =1'b0;
               P1_P2_P3_lWord  =0;
               P1_P2_P3_uWord  =0;
               P1_P2_P3_fWord  =0;
               P1_P2_P3_CodeFetch  <=1'b0;
               P1_P2_P3_Datao  <=0;
               P1_P2_P3_EAX  <=0;
               P1_P2_P3_EBX  <=0;
               P1_P2_P3_rEIP  <=0;
               P1_P2_P3_ReadRequest  <=1'b0;
               P1_P2_P3_MemoryFetch  <=1'b0;
               P1_P2_P3_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P2_P3_State2 )
              P1_P2_P3_Si  :
                begin 
                   P1_P2_P3_PhyAddrPointer  = P1_P2_P3_rEIP ;
                   P1_P2_P3_InstAddrPointer  = P1_P2_P3_PhyAddrPointer ;
                   P1_P2_P3_State2  = P1_P2_P3_S1 ;
                   P1_P2_P3_rEIP  <=20'hFFFF0;
                   P1_P2_P3_ReadRequest  <=1'b1;
                   P1_P2_P3_MemoryFetch  <=1'b1;
                   P1_P2_P3_RequestPending  <=1'b1;
                end 
              P1_P2_P3_S1  :
                begin 
                   P1_P2_P3_RequestPending  <= P1_P2_P3_Pending ;
                   P1_P2_P3_ReadRequest  <= P1_P2_P3_Pending ;
                   P1_P2_P3_MemoryFetch  <= P1_P2_P3_Pending ;
                   P1_P2_P3_CodeFetch  <= P1_P2_P3_Pending ;
                  if ( P1_P2_P3_READY_n ==1'b0)
                      P1_P2_P3_State2  = P1_P2_P3_S2 ;
                   else 
                      P1_P2_P3_State2  = P1_P2_P3_S1 ;
                end 
              P1_P2_P3_S2  :
                begin 
                   P1_P2_P3_RequestPending  <= P1_P2_P3_NotPending ;
                   P1_P2_P3_InstQueue  [ P1_P2_P3_InstQueueWr_Addr ]= P1_P2_P3_Datai %(2**8);
                   P1_P2_P3_InstQueueWr_Addr  =( P1_P2_P3_InstQueueWr_Addr +1)%16;
                   P1_P2_P3_InstQueue  [ P1_P2_P3_InstQueueWr_Addr ]= P1_P2_P3_Datai %2**8;
                   P1_P2_P3_InstQueueWr_Addr  =( P1_P2_P3_InstQueueWr_Addr +1)%16;
                  if ( P1_P2_P3_StateBS16 ==1'b1)
                     begin 
                        P1_P2_P3_InstQueue  [ P1_P2_P3_InstQueueWr_Addr ]=( P1_P2_P3_Datai /(2**16))%(2**8);
                        P1_P2_P3_InstQueueWr_Addr  =( P1_P2_P3_InstQueueWr_Addr +1)%16;
                        P1_P2_P3_InstQueue  [ P1_P2_P3_InstQueueWr_Addr ]=( P1_P2_P3_Datai /(2**24))%(2**8);
                        P1_P2_P3_InstQueueWr_Addr  =( P1_P2_P3_InstQueueWr_Addr +1)%16;
                        P1_P2_P3_PhyAddrPointer  = P1_P2_P3_PhyAddrPointer +4;
                        P1_P2_P3_State2  = P1_P2_P3_S5 ;
                     end 
                   else 
                     begin 
                        P1_P2_P3_PhyAddrPointer  = P1_P2_P3_PhyAddrPointer +2;
                       if ( P1_P2_P3_PhyAddrPointer <0)
                           P1_P2_P3_rEIP  <=- P1_P2_P3_PhyAddrPointer ;
                        else 
                           P1_P2_P3_rEIP  <= P1_P2_P3_PhyAddrPointer ;
                        P1_P2_P3_State2  = P1_P2_P3_S3 ;
                     end 
                end 
              P1_P2_P3_S3  :
                begin 
                   P1_P2_P3_RequestPending  <= P1_P2_P3_Pending ;
                  if ( P1_P2_P3_READY_n ==1'b0)
                      P1_P2_P3_State2  = P1_P2_P3_S4 ;
                   else 
                      P1_P2_P3_State2  = P1_P2_P3_S3 ;
                end 
              P1_P2_P3_S4  :
                begin 
                   P1_P2_P3_RequestPending  <= P1_P2_P3_NotPending ;
                   P1_P2_P3_InstQueue  [ P1_P2_P3_InstQueueWr_Addr ]= P1_P2_P3_Datai %(2**8);
                   P1_P2_P3_InstQueueWr_Addr  =( P1_P2_P3_InstQueueWr_Addr +1)%16;
                   P1_P2_P3_InstQueue  [ P1_P2_P3_InstQueueWr_Addr ]= P1_P2_P3_Datai %(2**8);
                   P1_P2_P3_InstQueueWr_Addr  =( P1_P2_P3_InstQueueWr_Addr +1)%16;
                   P1_P2_P3_PhyAddrPointer  = P1_P2_P3_PhyAddrPointer +2;
                   P1_P2_P3_State2  = P1_P2_P3_S5 ;
                end 
              P1_P2_P3_S5  :
                begin 
                  case ( P1_P2_P3_InstQueue [ P1_P2_P3_InstQueueRd_Addr ])
                    P1_P2_P3_NOP  :
                      begin 
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +1;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +1)%16;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                    P1_P2_P3_OPsop  :
                      begin 
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +1;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +1)%16;
                         P1_P2_P3_Extended  =1'b1;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                    P1_P2_P3_JMP_rel_short  :
                      if (( P1_P2_P3_InstQueueWr_Addr - P1_P2_P3_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P2_P3_PhyAddrPointer  = P1_P2_P3_InstAddrPointer +1-(8'hFF- P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +1)%16]);
                                 P1_P2_P3_InstAddrPointer  = P1_P2_P3_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P2_P3_PhyAddrPointer  = P1_P2_P3_InstAddrPointer +2+ P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +1)%16];
                                 P1_P2_P3_InstAddrPointer  = P1_P2_P3_PhyAddrPointer ;
                              end 
                            P1_P2_P3_Flush  =1'b1;
                            P1_P2_P3_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P2_P3_Flush  =1'b0;
                            P1_P2_P3_More  =1'b1;
                         end 
                    P1_P2_P3_JMP_rel_near  :
                      if (( P1_P2_P3_InstQueueWr_Addr - P1_P2_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P2_P3_PhyAddrPointer  = P1_P2_P3_InstAddrPointer +5+ P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +1)%16];
                            P1_P2_P3_InstAddrPointer  = P1_P2_P3_PhyAddrPointer ;
                            P1_P2_P3_Flush  =1'b1;
                            P1_P2_P3_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P2_P3_Flush  =1'b0;
                            P1_P2_P3_More  =1'b1;
                         end 
                    P1_P2_P3_JMP_intseg_immed  :
                      begin 
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +1;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +1)%16;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                    P1_P2_P3_MOV_al_b  :
                      begin 
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +1;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +1)%16;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                    P1_P2_P3_MOV_eax_dw  :
                      if (( P1_P2_P3_InstQueueWr_Addr - P1_P2_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P2_P3_EAX  <= P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +1)%16];
                            P1_P2_P3_More  =1'b0;
                            P1_P2_P3_Flush  =1'b0;
                            P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +5;
                            P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P2_P3_Flush  =1'b0;
                            P1_P2_P3_More  =1'b1;
                         end 
                    P1_P2_P3_MOV_ebx_dw  :
                      if (( P1_P2_P3_InstQueueWr_Addr - P1_P2_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P2_P3_EBX  <= P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P2_P3_InstQueue [( P1_P2_P3_InstQueueRd_Addr +1)%1];
                            P1_P2_P3_More  =1'b0;
                            P1_P2_P3_Flush  =1'b0;
                            P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +5;
                            P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P2_P3_Flush  =1'b0;
                            P1_P2_P3_More  =1'b1;
                         end 
                    P1_P2_P3_MOV_eax_ebx  :
                      if (( P1_P2_P3_InstQueueWr_Addr - P1_P2_P3_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P2_P3_EBX <0)
                               P1_P2_P3_rEIP  <=- P1_P2_P3_EBX ;
                            else 
                               P1_P2_P3_rEIP  <= P1_P2_P3_EBX ;
                            P1_P2_P3_RequestPending  <= P1_P2_P3_Pending ;
                            P1_P2_P3_ReadRequest  <= P1_P2_P3_Pending ;
                            P1_P2_P3_MemoryFetch  <= P1_P2_P3_Pending ;
                            P1_P2_P3_CodeFetch  <= P1_P2_P3_NotPending ;
                           if ( P1_P2_P3_READY_n ==1'b0)
                              begin 
                                 P1_P2_P3_RequestPending  <= P1_P2_P3_NotPending ;
                                 P1_P2_P3_uWord  = P1_P2_P3_Datai %(2**15);
                                if ( P1_P2_P3_StateBS16 ==1'b1)
                                    P1_P2_P3_lWord  = P1_P2_P3_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P2_P3_rEIP  <= P1_P2_P3_rEIP +2;
                                      P1_P2_P3_RequestPending  <= P1_P2_P3_Pending ;
                                     if ( P1_P2_P3_READY_n ==1'b0)
                                        begin 
                                           P1_P2_P3_RequestPending  <= P1_P2_P3_NotPending ;
                                           P1_P2_P3_lWord  = P1_P2_P3_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P2_P3_READY_n ==1'b0)
                                   begin 
                                      P1_P2_P3_EAX  <= P1_P2_P3_uWord *(2**16)+ P1_P2_P3_lWord ;
                                      P1_P2_P3_More  =1'b0;
                                      P1_P2_P3_Flush  =1'b0;
                                      P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +2;
                                      P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P3_Flush  =1'b0;
                            P1_P2_P3_More  =1'b1;
                         end 
                    P1_P2_P3_MOV_ebx_eax  :
                      if (( P1_P2_P3_InstQueueWr_Addr - P1_P2_P3_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P2_P3_EBX <0)
                               P1_P2_P3_rEIP  <= P1_P2_P3_EBX ;
                            else 
                               P1_P2_P3_rEIP  <= P1_P2_P3_EBX ;
                            P1_P2_P3_lWord  = P1_P2_P3_EAX %(2**16);
                            P1_P2_P3_uWord  =( P1_P2_P3_EAX /(2**16))%(2**15);
                            P1_P2_P3_RequestPending  <= P1_P2_P3_Pending ;
                            P1_P2_P3_ReadRequest  <= P1_P2_P3_NotPending ;
                            P1_P2_P3_MemoryFetch  <= P1_P2_P3_Pending ;
                            P1_P2_P3_CodeFetch  <= P1_P2_P3_NotPending ;
                           if ( P1_P2_P3_State == P1_P2_P3_StateT1 | P1_P2_P3_State == P1_P2_P3_StateT1P )
                              begin 
                                 P1_P2_P3_Datao  <=( P1_P2_P3_uWord *(2**16)+ P1_P2_P3_lWord );
                                if ( P1_P2_P3_READY_n ==1'b0)
                                   begin 
                                      P1_P2_P3_RequestPending  <= P1_P2_P3_NotPending ;
                                     if ( P1_P2_P3_StateBS16 ==1'b0)
                                        begin 
                                           P1_P2_P3_rEIP  <= P1_P2_P3_rEIP +2;
                                           P1_P2_P3_RequestPending  <= P1_P2_P3_Pending ;
                                           P1_P2_P3_ReadRequest  <= P1_P2_P3_NotPending ;
                                           P1_P2_P3_MemoryFetch  <= P1_P2_P3_Pending ;
                                           P1_P2_P3_CodeFetch  <= P1_P2_P3_NotPending ;
                                           P1_P2_P3_State2  = P1_P2_P3_S6 ;
                                        end 
                                      P1_P2_P3_More  =1'b0;
                                      P1_P2_P3_Flush  =1'b0;
                                      P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +2;
                                      P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P3_Flush  =1'b0;
                            P1_P2_P3_More  =1'b1;
                         end 
                    P1_P2_P3_IN_al  :
                      if (( P1_P2_P3_InstQueueWr_Addr - P1_P2_P3_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P2_P3_rEIP  <= P1_P2_P3_InstQueueRd_Addr +1;
                            P1_P2_P3_RequestPending  <= P1_P2_P3_Pending ;
                            P1_P2_P3_ReadRequest  <= P1_P2_P3_Pending ;
                            P1_P2_P3_MemoryFetch  <= P1_P2_P3_NotPending ;
                            P1_P2_P3_CodeFetch  <= P1_P2_P3_NotPending ;
                           if ( P1_P2_P3_READY_n ==1'b0)
                              begin 
                                 P1_P2_P3_RequestPending  <= P1_P2_P3_NotPending ;
                                 P1_P2_P3_EAX  <= P1_P2_P3_Datai ;
                                 P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +2;
                                 P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +2);
                                 P1_P2_P3_Flush  =1'b0;
                                 P1_P2_P3_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P3_Flush  =1'b0;
                            P1_P2_P3_More  =1'b1;
                         end 
                    P1_P2_P3_OUT_al  :
                      if (( P1_P2_P3_InstQueueWr_Addr - P1_P2_P3_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P2_P3_rEIP  <= P1_P2_P3_InstQueueRd_Addr +1;
                            P1_P2_P3_RequestPending  <= P1_P2_P3_Pending ;
                            P1_P2_P3_ReadRequest  <= P1_P2_P3_NotPending ;
                            P1_P2_P3_MemoryFetch  <= P1_P2_P3_NotPending ;
                            P1_P2_P3_CodeFetch  <= P1_P2_P3_NotPending ;
                           if ( P1_P2_P3_State == P1_P2_P3_StateT1 | P1_P2_P3_State == P1_P2_P3_StateT1P )
                              begin 
                                 P1_P2_P3_fWord  = P1_P2_P3_EAX %(2**16);
                                 P1_P2_P3_Datao  <= P1_P2_P3_fWord ;
                                if ( P1_P2_P3_READY_n ==1'b0)
                                   begin 
                                      P1_P2_P3_RequestPending  <= P1_P2_P3_NotPending ;
                                      P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +2;
                                      P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +2)%16;
                                      P1_P2_P3_Flush  =1'b0;
                                      P1_P2_P3_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P2_P3_Flush  =1'b0;
                            P1_P2_P3_More  =1'b1;
                         end 
                    P1_P2_P3_ADD_al_b  :
                      begin 
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +1;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +1)%16;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                    P1_P2_P3_ADD_ax_w  :
                      begin 
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +1;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +1)%16;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                    P1_P2_P3_ROL_al_1  :
                      begin 
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +2;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +2)%16;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                    P1_P2_P3_ROL_al_n  :
                      begin 
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +2;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +2)%16;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                    P1_P2_P3_INC_eax  :
                      begin 
                         P1_P2_P3_EAX  <= P1_P2_P3_EAX +1;
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +1;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +1)%16;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                    P1_P2_P3_INC_ebx  :
                      begin 
                         P1_P2_P3_EBX  <= P1_P2_P3_EBX +1;
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +1;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +1)%16;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P2_P3_InstAddrPointer  = P1_P2_P3_InstAddrPointer +1;
                         P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +1)%16;
                         P1_P2_P3_Flush  =1'b0;
                         P1_P2_P3_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P2_P3_InstQueueRd_Addr < P1_P2_P3_InstQueueWr_Addr ))|((( P1_P2_P3_InstQueueLimit - P1_P2_P3_InstQueueRd_Addr )<4)| P1_P2_P3_Flush | P1_P2_P3_More ))
                      P1_P2_P3_State2  = P1_P2_P3_S7 ;
                end 
              P1_P2_P3_S6  :
                begin 
                   P1_P2_P3_Datao  <=( P1_P2_P3_uWord *(2**16)+ P1_P2_P3_lWord );
                  if ( P1_P2_P3_READY_n ==1'b0)
                     begin 
                        P1_P2_P3_RequestPending  <= P1_P2_P3_NotPending ;
                        P1_P2_P3_State2  = P1_P2_P3_S5 ;
                     end 
                end 
              P1_P2_P3_S7  :
                begin 
                  if ( P1_P2_P3_Flush )
                     begin 
                        P1_P2_P3_InstQueueRd_Addr  =1;
                        P1_P2_P3_InstQueueWr_Addr  =1;
                       if ( P1_P2_P3_InstAddrPointer <0)
                           P1_P2_P3_fWord  =- P1_P2_P3_InstAddrPointer ;
                        else 
                           P1_P2_P3_fWord  = P1_P2_P3_InstAddrPointer ;
                       if ( P1_P2_P3_fWord %2==1)
                           P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr + P1_P2_P3_fWord %4)%16;
                     end 
                  if (( P1_P2_P3_InstQueueLimit - P1_P2_P3_InstQueueRd_Addr )<3)
                     begin 
                        P1_P2_P3_State2  = P1_P2_P3_S8 ;
                        P1_P2_P3_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P2_P3_State2  = P1_P2_P3_S9 ;
                end 
              P1_P2_P3_S8  :
                if ( P1_P2_P3_InstQueueRd_Addr <= P1_P2_P3_InstQueueLimit )
                   begin 
                      P1_P2_P3_InstQueue  [ P1_P2_P3_InstQueueWr_Addr ]= P1_P2_P3_InstQueue [ P1_P2_P3_InstQueueRd_Addr ];
                      P1_P2_P3_InstQueueRd_Addr  =( P1_P2_P3_InstQueueRd_Addr +1)%16;
                      P1_P2_P3_InstQueueWr_Addr  =( P1_P2_P3_InstQueueWr_Addr +1)%16;
                      P1_P2_P3_State2  = P1_P2_P3_S8 ;
                   end 
                 else 
                   begin 
                      P1_P2_P3_InstQueueRd_Addr  =0;
                      P1_P2_P3_State2  = P1_P2_P3_S9 ;
                   end 
              P1_P2_P3_S9  :
                begin 
                   P1_P2_P3_rEIP  <= P1_P2_P3_PhyAddrPointer ;
                   P1_P2_P3_State2  = P1_P2_P3_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P1_P2_P3_CLOCK or posedge  P1_P2_P3_RESET )
       begin 
         if ( P1_P2_P3_RESET ==1'b1)
            begin 
               P1_P2_P3_ByteEnable  <=4'b0000;
               P1_P2_P3_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P2_P3_DataWidth )
              P1_P2_P3_WidthByte  :
                case ( P1_P2_P3_rEIP %4)
                 0 :
                     P1_P2_P3_ByteEnable  <=4'b1110;
                 1 :
                     P1_P2_P3_ByteEnable  <=4'b1101;
                 2 :
                     P1_P2_P3_ByteEnable  <=4'b1011;
                 3 :
                     P1_P2_P3_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P2_P3_WidthWord  :
                case ( P1_P2_P3_rEIP %4)
                 0 :
                    begin 
                       P1_P2_P3_ByteEnable  <=4'b1100;
                       P1_P2_P3_NonAligned  <= P1_P2_P3_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P2_P3_ByteEnable  <=4'b1001;
                       P1_P2_P3_NonAligned  <= P1_P2_P3_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P2_P3_ByteEnable  <=4'b0011;
                       P1_P2_P3_NonAligned  <= P1_P2_P3_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P2_P3_ByteEnable  <=4'b0111;
                       P1_P2_P3_NonAligned  <= P1_P2_P3_Pending ;
                    end 
                 default :;
                endcase 
              P1_P2_P3_WidthDword  :
                case ( P1_P2_P3_rEIP %4)
                 0 :
                    begin 
                       P1_P2_P3_ByteEnable  <=4'b0000;
                       P1_P2_P3_NonAligned  <= P1_P2_P3_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P2_P3_ByteEnable  <=4'b0001;
                       P1_P2_P3_NonAligned  <= P1_P2_P3_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P2_P3_NonAligned  <= P1_P2_P3_Pending ;
                       P1_P2_P3_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P2_P3_NonAligned  <= P1_P2_P3_Pending ;
                       P1_P2_P3_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 

 
  
wire  P1_P3_clock;
wire  P1_P3_reset;
reg [19:0] P1_P3_addr;
wire [31:0] P1_P3_datai;
integer P1_P3_datao;
reg  P1_P3_rd;
reg  P1_P3_wr;
wire  P1_P4_clock;
wire  P1_P4_reset;
reg [19:0] P1_P4_addr;
wire [31:0] P1_P4_datai;
integer P1_P4_datao;
reg  P1_P4_rd;
reg  P1_P4_wr;
wire  P2_P3_clock;
wire  P2_P3_reset;
reg [19:0] P2_P3_addr;
wire [31:0] P2_P3_datai;
integer P2_P3_datao;
reg  P2_P3_rd;
reg  P2_P3_wr;
wire  P2_P4_clock;
wire  P2_P4_reset;
reg [19:0] P2_P4_addr;
wire [31:0] P2_P4_datai;
integer P2_P4_datao;
reg  P2_P4_rd;
reg  P2_P4_wr;
 
   integer P1_P3_reg0 ; 
   integer P1_P3_reg1 ; 
   integer P1_P3_reg2 ; 
   integer P1_P3_reg3 ; 
   reg P1_P3_B ; 
   reg[19:0] P1_P3_MAR ; 
   integer P1_P3_MBR ; 
   reg[1:0] P1_P3_mf ; 
   reg[2:0] P1_P3_df ; 
   reg[0:0] P1_P3_cf ; 
   reg[3:0] P1_P3_ff ; 
   reg[19:0] P1_P3_tail ; 
   integer P1_P3_IR ; 
   reg[0:0] P1_P3_state ; 
   integer P1_P3_r ; 
   integer P1_P3_m ; 
   integer P1_P3_t ; 
   integer P1_P3_d ; 
   integer P1_P3_temp ; 
   reg[1:0] P1_P3_s ; 
 parameter P1_P3_FETCH =0; 
 parameter P1_P3_EXEC =1; 
  always @(  posedge   P1_P3_clock or posedge  P1_P3_reset )
       begin 
         if ( P1_P3_reset ==1'b1)
            begin 
               P1_P3_MAR  =0;
               P1_P3_MBR  =0;
               P1_P3_IR  =0;
               P1_P3_d  =0;
               P1_P3_r  =0;
               P1_P3_m  =0;
               P1_P3_s  =0;
               P1_P3_temp  =0;
               P1_P3_mf  =0;
               P1_P3_df  =0;
               P1_P3_ff  =0;
               P1_P3_cf  =0;
               P1_P3_tail  =0;
               P1_P3_B  =1'b0;
               P1_P3_reg0  =0;
               P1_P3_reg1  =0;
               P1_P3_reg2  =0;
               P1_P3_reg3  =0;
               P1_P3_addr  <=0;
               P1_P3_rd  <=1'b0;
               P1_P3_wr  <=1'b0;
               P1_P3_datao  <=0;
               P1_P3_state  = P1_P3_FETCH ;
            end 
          else 
            begin 
               P1_P3_rd  <=1'b0;
               P1_P3_wr  <=1'b0;
              case ( P1_P3_state )
                P1_P3_FETCH  :
                  begin 
                     P1_P3_MAR  = P1_P3_reg3 %2**20;
                     P1_P3_addr  <= P1_P3_MAR ;
                     P1_P3_rd  <=1'b1;
                     P1_P3_MBR  = P1_P3_datai ;
                     P1_P3_IR  = P1_P3_MBR ;
                     P1_P3_state  = P1_P3_EXEC ;
                  end 
                P1_P3_EXEC  :
                  begin 
                    if ( P1_P3_IR <0)
                        P1_P3_IR  =- P1_P3_IR ;
                     P1_P3_mf  =( P1_P3_IR /2**27)%4;
                     P1_P3_df  =( P1_P3_IR /2**24)%2**3;
                     P1_P3_ff  =( P1_P3_IR /2**19)%2**4;
                     P1_P3_cf  =( P1_P3_IR /2**23)%2;
                     P1_P3_tail  = P1_P3_IR %2**20;
                     P1_P3_reg3  =(( P1_P3_reg3 %2**29)+8);
                     P1_P3_s  =( P1_P3_IR /2**29)%4;
                    case ( P1_P3_s )
                     0 :
                         P1_P3_r  = P1_P3_reg0 ;
                     1 :
                         P1_P3_r  = P1_P3_reg1 ;
                     2 :
                         P1_P3_r  = P1_P3_reg2 ;
                     3 :
                         P1_P3_r  = P1_P3_reg3 ;
                    endcase 
                    case ( P1_P3_cf )
                     1 :
                        begin 
                          case ( P1_P3_mf )
                           0 :
                               P1_P3_m  = P1_P3_tail ;
                           1 :
                              begin 
                                 P1_P3_m  = P1_P3_datai ;
                                 P1_P3_addr  <= P1_P3_tail ;
                                 P1_P3_rd  <=1'b1;
                              end 
                           2 :
                              begin 
                                 P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                 P1_P3_rd  <=1'b1;
                                 P1_P3_m  = P1_P3_datai ;
                              end 
                           3 :
                              begin 
                                 P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                 P1_P3_rd  <=1'b1;
                                 P1_P3_m  = P1_P3_datai ;
                              end 
                          endcase 
                          case ( P1_P3_ff )
                           0 :
                              if ( P1_P3_r < P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           1 :
                              if (~( P1_P3_r < P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           2 :
                              if ( P1_P3_r == P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           3 :
                              if (~( P1_P3_r == P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           4 :
                              if (~( P1_P3_r > P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           5 :
                              if ( P1_P3_r > P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           6 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if ( P1_P3_r < P1_P3_m )
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           7 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if (~( P1_P3_r < P1_P3_m ))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           8 :
                              if (( P1_P3_r < P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           9 :
                              if ((~( P1_P3_r < P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           10 :
                              if (( P1_P3_r == P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           11 :
                              if ((~( P1_P3_r == P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           12 :
                              if ((~( P1_P3_r > P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           13 :
                              if (( P1_P3_r > P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           14 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if (( P1_P3_r < P1_P3_m )|( P1_P3_B ==1'b1))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           15 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if ((~( P1_P3_r < P1_P3_m ))|( P1_P3_B ==1'b1))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~( P1_P3_df ==7))
                           begin 
                             if ( P1_P3_df ==5)
                                begin 
                                  if ((~( P1_P3_B ))==1'b1)
                                      P1_P3_d  =3;
                                end 
                              else 
                                if ( P1_P3_df ==4)
                                   begin 
                                     if ( P1_P3_B ==1'b1)
                                         P1_P3_d  =3;
                                   end 
                                 else 
                                   if ( P1_P3_df ==3)
                                       P1_P3_d  =3;
                                    else 
                                      if ( P1_P3_df ==2)
                                          P1_P3_d  =2;
                                       else 
                                         if ( P1_P3_df ==1)
                                             P1_P3_d  =1;
                                          else 
                                            if ( P1_P3_df ==0)
                                                P1_P3_d  =0;
                             case ( P1_P3_ff )
                              0 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                    P1_P3_t  =0;
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_t - P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_t - P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_t - P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_t - P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                    P1_P3_reg2  = P1_P3_reg3 ;
                                    P1_P3_reg3  = P1_P3_m ;
                                 end 
                              2 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_t  = P1_P3_r /2;
                                    1 :
                                       begin 
                                          P1_P3_t  = P1_P3_r /2;
                                         if ( P1_P3_B ==1'b1)
                                             P1_P3_t  = P1_P3_t %2**29;
                                       end 
                                    2 :
                                        P1_P3_t  =( P1_P3_r %2**29)*2;
                                    3 :
                                       begin 
                                          P1_P3_t  =( P1_P3_r %2**29)*2;
                                         if ( P1_P3_t >2**30-1)
                                             P1_P3_B  =1'b1;
                                          else 
                                             P1_P3_B  =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_t ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_t ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_t ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_t ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if ( P1_P3_df ==7)
                              begin 
                                case ( P1_P3_mf )
                                 0 :
                                     P1_P3_m  = P1_P3_tail ;
                                 1 :
                                     P1_P3_m  = P1_P3_tail ;
                                 2 :
                                     P1_P3_m  =( P1_P3_reg1 %2**20)+( P1_P3_tail %2**20);
                                 3 :
                                     P1_P3_m  =( P1_P3_reg2 %2**20)+( P1_P3_tail %2**20);
                                endcase 
                                 P1_P3_addr  <= P1_P3_m %2*20;
                                 P1_P3_wr  <=1'b1;
                                 P1_P3_datao  <= P1_P3_r ;
                              end 
                    endcase 
                     P1_P3_state  = P1_P3_FETCH ;
                  end 
              endcase 
            end 
       end
 
 
  
 
   integer P1_P4_reg0 ; 
   integer P1_P4_reg1 ; 
   integer P1_P4_reg2 ; 
   integer P1_P4_reg3 ; 
   reg P1_P4_B ; 
   reg[19:0] P1_P4_MAR ; 
   integer P1_P4_MBR ; 
   reg[1:0] P1_P4_mf ; 
   reg[2:0] P1_P4_df ; 
   reg[0:0] P1_P4_cf ; 
   reg[3:0] P1_P4_ff ; 
   reg[19:0] P1_P4_tail ; 
   integer P1_P4_IR ; 
   reg[0:0] P1_P4_state ; 
   integer P1_P4_r ; 
   integer P1_P4_m ; 
   integer P1_P4_t ; 
   integer P1_P4_d ; 
   integer P1_P4_temp ; 
   reg[1:0] P1_P4_s ; 
 parameter P1_P4_FETCH =0; 
 parameter P1_P4_EXEC =1; 
  always @(  posedge   P1_P4_clock or posedge  P1_P4_reset )
       begin 
         if ( P1_P4_reset ==1'b1)
            begin 
               P1_P4_MAR  =0;
               P1_P4_MBR  =0;
               P1_P4_IR  =0;
               P1_P4_d  =0;
               P1_P4_r  =0;
               P1_P4_m  =0;
               P1_P4_s  =0;
               P1_P4_temp  =0;
               P1_P4_mf  =0;
               P1_P4_df  =0;
               P1_P4_ff  =0;
               P1_P4_cf  =0;
               P1_P4_tail  =0;
               P1_P4_B  =1'b0;
               P1_P4_reg0  =0;
               P1_P4_reg1  =0;
               P1_P4_reg2  =0;
               P1_P4_reg3  =0;
               P1_P4_addr  <=0;
               P1_P4_rd  <=1'b0;
               P1_P4_wr  <=1'b0;
               P1_P4_datao  <=0;
               P1_P4_state  = P1_P4_FETCH ;
            end 
          else 
            begin 
               P1_P4_rd  <=1'b0;
               P1_P4_wr  <=1'b0;
              case ( P1_P4_state )
                P1_P4_FETCH  :
                  begin 
                     P1_P4_MAR  = P1_P4_reg3 %2**20;
                     P1_P4_addr  <= P1_P4_MAR ;
                     P1_P4_rd  <=1'b1;
                     P1_P4_MBR  = P1_P4_datai ;
                     P1_P4_IR  = P1_P4_MBR ;
                     P1_P4_state  = P1_P4_EXEC ;
                  end 
                P1_P4_EXEC  :
                  begin 
                    if ( P1_P4_IR <0)
                        P1_P4_IR  =- P1_P4_IR ;
                     P1_P4_mf  =( P1_P4_IR /2**27)%4;
                     P1_P4_df  =( P1_P4_IR /2**24)%2**3;
                     P1_P4_ff  =( P1_P4_IR /2**19)%2**4;
                     P1_P4_cf  =( P1_P4_IR /2**23)%2;
                     P1_P4_tail  = P1_P4_IR %2**20;
                     P1_P4_reg3  =(( P1_P4_reg3 %2**29)+8);
                     P1_P4_s  =( P1_P4_IR /2**29)%4;
                    case ( P1_P4_s )
                     0 :
                         P1_P4_r  = P1_P4_reg0 ;
                     1 :
                         P1_P4_r  = P1_P4_reg1 ;
                     2 :
                         P1_P4_r  = P1_P4_reg2 ;
                     3 :
                         P1_P4_r  = P1_P4_reg3 ;
                    endcase 
                    case ( P1_P4_cf )
                     1 :
                        begin 
                          case ( P1_P4_mf )
                           0 :
                               P1_P4_m  = P1_P4_tail ;
                           1 :
                              begin 
                                 P1_P4_m  = P1_P4_datai ;
                                 P1_P4_addr  <= P1_P4_tail ;
                                 P1_P4_rd  <=1'b1;
                              end 
                           2 :
                              begin 
                                 P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                 P1_P4_rd  <=1'b1;
                                 P1_P4_m  = P1_P4_datai ;
                              end 
                           3 :
                              begin 
                                 P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                 P1_P4_rd  <=1'b1;
                                 P1_P4_m  = P1_P4_datai ;
                              end 
                          endcase 
                          case ( P1_P4_ff )
                           0 :
                              if ( P1_P4_r < P1_P4_m )
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           1 :
                              if (~( P1_P4_r < P1_P4_m ))
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           2 :
                              if ( P1_P4_r == P1_P4_m )
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           3 :
                              if (~( P1_P4_r == P1_P4_m ))
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           4 :
                              if (~( P1_P4_r > P1_P4_m ))
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           5 :
                              if ( P1_P4_r > P1_P4_m )
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           6 :
                              begin 
                                if ( P1_P4_r >2**30-1)
                                    P1_P4_r  = P1_P4_r -2**30;
                                if ( P1_P4_r < P1_P4_m )
                                    P1_P4_B  =1'b1;
                                 else 
                                    P1_P4_B  =1'b0;
                              end 
                           7 :
                              begin 
                                if ( P1_P4_r >2**30-1)
                                    P1_P4_r  = P1_P4_r -2**30;
                                if (~( P1_P4_r < P1_P4_m ))
                                    P1_P4_B  =1'b1;
                                 else 
                                    P1_P4_B  =1'b0;
                              end 
                           8 :
                              if (( P1_P4_r < P1_P4_m )|( P1_P4_B ==1'b1))
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           9 :
                              if ((~( P1_P4_r < P1_P4_m ))|( P1_P4_B ==1'b1))
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           10 :
                              if (( P1_P4_r == P1_P4_m )|( P1_P4_B ==1'b1))
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           11 :
                              if ((~( P1_P4_r == P1_P4_m ))|( P1_P4_B ==1'b1))
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           12 :
                              if ((~( P1_P4_r > P1_P4_m ))|( P1_P4_B ==1'b1))
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           13 :
                              if (( P1_P4_r > P1_P4_m )|( P1_P4_B ==1'b1))
                                  P1_P4_B  =1'b1;
                               else 
                                  P1_P4_B  =1'b0;
                           14 :
                              begin 
                                if ( P1_P4_r >2**30-1)
                                    P1_P4_r  = P1_P4_r -2**30;
                                if (( P1_P4_r < P1_P4_m )|( P1_P4_B ==1'b1))
                                    P1_P4_B  =1'b1;
                                 else 
                                    P1_P4_B  =1'b0;
                              end 
                           15 :
                              begin 
                                if ( P1_P4_r >2**30-1)
                                    P1_P4_r  = P1_P4_r -2**30;
                                if ((~( P1_P4_r < P1_P4_m ))|( P1_P4_B ==1'b1))
                                    P1_P4_B  =1'b1;
                                 else 
                                    P1_P4_B  =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~( P1_P4_df ==7))
                           begin 
                             if ( P1_P4_df ==5)
                                begin 
                                  if ((~( P1_P4_B ))==1'b1)
                                      P1_P4_d  =3;
                                end 
                              else 
                                if ( P1_P4_df ==4)
                                   begin 
                                     if ( P1_P4_B ==1'b1)
                                         P1_P4_d  =3;
                                   end 
                                 else 
                                   if ( P1_P4_df ==3)
                                       P1_P4_d  =3;
                                    else 
                                      if ( P1_P4_df ==2)
                                          P1_P4_d  =2;
                                       else 
                                         if ( P1_P4_df ==1)
                                             P1_P4_d  =1;
                                          else 
                                            if ( P1_P4_df ==0)
                                                P1_P4_d  =0;
                             case ( P1_P4_ff )
                              0 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                    P1_P4_t  =0;
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  = P1_P4_t - P1_P4_m ;
                                    1 :
                                        P1_P4_reg1  = P1_P4_t - P1_P4_m ;
                                    2 :
                                        P1_P4_reg2  = P1_P4_t - P1_P4_m ;
                                    3 :
                                        P1_P4_reg3  = P1_P4_t - P1_P4_m ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                    P1_P4_reg2  = P1_P4_reg3 ;
                                    P1_P4_reg3  = P1_P4_m ;
                                 end 
                              2 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  = P1_P4_m ;
                                    1 :
                                        P1_P4_reg1  = P1_P4_m ;
                                    2 :
                                        P1_P4_reg2  = P1_P4_m ;
                                    3 :
                                        P1_P4_reg3  = P1_P4_m ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  = P1_P4_m ;
                                    1 :
                                        P1_P4_reg1  = P1_P4_m ;
                                    2 :
                                        P1_P4_reg2  = P1_P4_m ;
                                    3 :
                                        P1_P4_reg3  = P1_P4_m ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  =( P1_P4_r + P1_P4_m )%2**30;
                                    1 :
                                        P1_P4_reg1  =( P1_P4_r + P1_P4_m )%2**30;
                                    2 :
                                        P1_P4_reg2  =( P1_P4_r + P1_P4_m )%2**30;
                                    3 :
                                        P1_P4_reg3  =( P1_P4_r + P1_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  =( P1_P4_r + P1_P4_m )%2**30;
                                    1 :
                                        P1_P4_reg1  =( P1_P4_r + P1_P4_m )%2**30;
                                    2 :
                                        P1_P4_reg2  =( P1_P4_r + P1_P4_m )%2**30;
                                    3 :
                                        P1_P4_reg3  =( P1_P4_r + P1_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  =( P1_P4_r - P1_P4_m )%2**30;
                                    1 :
                                        P1_P4_reg1  =( P1_P4_r - P1_P4_m )%2**30;
                                    2 :
                                        P1_P4_reg2  =( P1_P4_r - P1_P4_m )%2**30;
                                    3 :
                                        P1_P4_reg3  =( P1_P4_r - P1_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  =( P1_P4_r - P1_P4_m )%2**30;
                                    1 :
                                        P1_P4_reg1  =( P1_P4_r - P1_P4_m )%2**30;
                                    2 :
                                        P1_P4_reg2  =( P1_P4_r - P1_P4_m )%2**30;
                                    3 :
                                        P1_P4_reg3  =( P1_P4_r - P1_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  =( P1_P4_r + P1_P4_m )%2**30;
                                    1 :
                                        P1_P4_reg1  =( P1_P4_r + P1_P4_m )%2**30;
                                    2 :
                                        P1_P4_reg2  =( P1_P4_r + P1_P4_m )%2**30;
                                    3 :
                                        P1_P4_reg3  =( P1_P4_r + P1_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  =( P1_P4_r - P1_P4_m )%2**30;
                                    1 :
                                        P1_P4_reg1  =( P1_P4_r - P1_P4_m )%2**30;
                                    2 :
                                        P1_P4_reg2  =( P1_P4_r - P1_P4_m )%2**30;
                                    3 :
                                        P1_P4_reg3  =( P1_P4_r - P1_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  =( P1_P4_r + P1_P4_m )%2**30;
                                    1 :
                                        P1_P4_reg1  =( P1_P4_r + P1_P4_m )%2**30;
                                    2 :
                                        P1_P4_reg2  =( P1_P4_r + P1_P4_m )%2**30;
                                    3 :
                                        P1_P4_reg3  =( P1_P4_r + P1_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_m  = P1_P4_tail ;
                                    1 :
                                       begin 
                                          P1_P4_m  = P1_P4_datai ;
                                          P1_P4_addr  <= P1_P4_tail ;
                                          P1_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg1 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P4_addr  <=( P1_P4_tail + P1_P4_reg2 )%2**20;
                                          P1_P4_rd  <=1'b1;
                                          P1_P4_m  = P1_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  =( P1_P4_r - P1_P4_m )%2**30;
                                    1 :
                                        P1_P4_reg1  =( P1_P4_r - P1_P4_m )%2**30;
                                    2 :
                                        P1_P4_reg2  =( P1_P4_r - P1_P4_m )%2**30;
                                    3 :
                                        P1_P4_reg3  =( P1_P4_r - P1_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case ( P1_P4_mf )
                                    0 :
                                        P1_P4_t  = P1_P4_r /2;
                                    1 :
                                       begin 
                                          P1_P4_t  = P1_P4_r /2;
                                         if ( P1_P4_B ==1'b1)
                                             P1_P4_t  = P1_P4_t %2**29;
                                       end 
                                    2 :
                                        P1_P4_t  =( P1_P4_r %2**29)*2;
                                    3 :
                                       begin 
                                          P1_P4_t  =( P1_P4_r %2**29)*2;
                                         if ( P1_P4_t >2**30-1)
                                             P1_P4_B  =1'b1;
                                          else 
                                             P1_P4_B  =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case ( P1_P4_d )
                                    0 :
                                        P1_P4_reg0  = P1_P4_t ;
                                    1 :
                                        P1_P4_reg1  = P1_P4_t ;
                                    2 :
                                        P1_P4_reg2  = P1_P4_t ;
                                    3 :
                                        P1_P4_reg3  = P1_P4_t ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if ( P1_P4_df ==7)
                              begin 
                                case ( P1_P4_mf )
                                 0 :
                                     P1_P4_m  = P1_P4_tail ;
                                 1 :
                                     P1_P4_m  = P1_P4_tail ;
                                 2 :
                                     P1_P4_m  =( P1_P4_reg1 %2**20)+( P1_P4_tail %2**20);
                                 3 :
                                     P1_P4_m  =( P1_P4_reg2 %2**20)+( P1_P4_tail %2**20);
                                endcase 
                                 P1_P4_addr  <= P1_P4_m %2*20;
                                 P1_P4_wr  <=1'b1;
                                 P1_P4_datao  <= P1_P4_r ;
                              end 
                    endcase 
                     P1_P4_state  = P1_P4_FETCH ;
                  end 
              endcase 
            end 
       end
 
 
  always @(                                 P1_do1                                 or  P1_rd3  or  P1_wr1  or  P1_mio1  or  P1_dc1  or  P1_as12  or  P1_do2  or  P1_rd4  or  P1_wr2  or  P1_mio2  or  P1_dc2  or  P1_as22  or  P1_as21  or  P1_as11  or  P1_wr3  or  P1_ad31  or  P1_tad2  or  P1_wr4  or  P1_ad41  or  P1_tad1  or  P1_do3  or  P1_do4  or  P1_ad11  or  P1_ad12  or  P1_ad21  or  P1_ad22  or  P1_tad3  or  P1_tad4  or  P1_sel  or  P1_din  or  P1_td1  or  P1_td2  )
       begin 
          P1_di3  <= P1_do1 %2**20;
          P1_r12  <=(~( P1_rd3 & P1_wr1 & P1_mio1 & P1_dc1 &(~ P1_as12 )));
          P1_di4  <= P1_do2 ;
          P1_r22  <=(~( P1_rd4 & P1_wr2 & P1_mio2 & P1_dc2 &(~ P1_as22 )));
          P1_r11  <= P1_as21 ;
          P1_r21  <= P1_as11 ;
         if ( P1_wr3 ==1'b1)
             P1_tad3  <= P1_ad31 ;
          else 
             P1_tad3  <= P1_tad2 %2**20;
         if ( P1_wr4 ==1'b1)
             P1_tad4  <= P1_ad41 ;
          else 
             P1_tad4  <= P1_tad1 %2**20;
         if ( P1_do3 >2**28)
             P1_tad1  <= P1_ad11 ;
          else 
             P1_tad1  <= P1_ad12 ;
         if ( P1_do4 >2**29)
             P1_tad2  <= P1_ad21 ;
          else 
             P1_tad2  <= P1_ad22 ;
          P1_dout  <=( P1_tad3 * P1_tad4 )%2**19;
         if ( P1_sel ==1'b0)
            begin 
               P1_td1  <=0;
               P1_td2  <= P1_din ;
            end 
          else 
            begin 
               P1_td1  <= P1_din ;
               P1_td2  <=0;
            end 
          P1_di1  <= P1_do4 * P1_td1 ;
          P1_di2  <= P1_do3 * P1_td2 ;
          P1_aux  <=( P1_tad1 * P1_tad2 )%2**3;
       end
 
 
  
 
   integer P2_di1 ; 
   integer P2_di2 ; 
   wire[31:0] P2_do1 ; 
   wire[31:0] P2_do2 ; 
   integer P2_td1 ; 
   integer P2_td2 ; 
   integer P2_di3 ; 
   integer P2_di4 ; 
   wire[31:0] P2_do3 ; 
   wire[31:0] P2_do4 ; 
   reg[29:0] P2_tad1 ; 
   reg[29:0] P2_tad2 ; 
   wire[29:0] P2_ad11 ; 
   wire[29:0] P2_ad12 ; 
   wire[29:0] P2_ad21 ; 
   wire[29:0] P2_ad22 ; 
   wire[19:0] P2_ad31 ; 
   wire[19:0] P2_ad41 ; 
   reg[19:0] P2_tad3 ; 
   reg[19:0] P2_tad4 ; 
   wire P2_wr1 ; 
   wire P2_wr2 ; 
   wire P2_wr3 ; 
   wire P2_wr4 ; 
   wire P2_dc1 ; 
   wire P2_dc2 ; 
   wire P2_mio1 ; 
   wire P2_mio2 ; 
   wire P2_as11 ; 
   wire P2_as12 ; 
   wire P2_as21 ; 
   wire P2_as22 ; 
   reg P2_r11 ; 
   reg P2_r12 ; 
   reg P2_r21 ; 
   reg P2_r22 ; 
   wire P2_rd3 ; 
   wire P2_rd4 ; 
  
 
   integer P2_P1_buf1 ; 
   integer P2_P1_buf2 ; 
   wire[3:0] P2_P1_be1 ; 
   wire[3:0] P2_P1_be2 ; 
   wire[3:0] P2_P1_be3 ; 
   wire[29:0] P2_P1_addr1 ; 
   wire[29:0] P2_P1_addr2 ; 
   wire[29:0] P2_P1_addr3 ; 
   wire P2_P1_wr1 ; 
   wire P2_P1_wr2 ; 
   wire P2_P1_wr3 ; 
   wire P2_P1_dc1 ; 
   wire P2_P1_dc2 ; 
   wire P2_P1_dc3 ; 
   wire P2_P1_mio1 ; 
   wire P2_P1_mio2 ; 
   wire P2_P1_mio3 ; 
   wire P2_P1_ads1 ; 
   wire P2_P1_ads2 ; 
   wire P2_P1_ads3 ; 
   integer P2_P1_di1 ; 
   integer P2_P1_di2 ; 
   integer P2_P1_di3 ; 
   wire[31:0] P2_P1_do1 ; 
   wire[31:0] P2_P1_do2 ; 
   wire[31:0] P2_P1_do3 ; 
   reg P2_P1_rdy1 ; 
   reg P2_P1_rdy2 ; 
   reg P2_P1_rdy3 ; 
   reg P2_P1_ready11 ; 
   reg P2_P1_ready12 ; 
   reg P2_P1_ready21 ; 
   reg P2_P1_ready22 ; 
  always @(  posedge   P2_P1_clock or posedge  P2_P1_reset )
       if ( P2_P1_reset ==1'b1)
          begin 
             P2_P1_buf1  <=0;
             P2_P1_ready11  <=1'b0;
             P2_P1_ready12  <=1'b0;
          end 
        else 
          begin 
            if ( P2_P1_addr1 >2**29& P2_P1_ads1 ==1'b0& P2_P1_mio1 ==1'b1& P2_P1_dc1 ==1'b0& P2_P1_wr1 ==1'b1& P2_P1_be1 ==4'b0000)
               begin 
                  P2_P1_buf1  <= P2_P1_do1 ;
                  P2_P1_ready11  <=1'b0;
                  P2_P1_ready12  <=1'b1;
               end 
             else 
               if ( P2_P1_addr2 >2**29& P2_P1_ads2 ==1'b0& P2_P1_mio2 ==1'b1& P2_P1_dc2 ==1'b0& P2_P1_wr2 ==1'b1& P2_P1_be2 ==4'b0000)
                  begin 
                     P2_P1_buf1  <= P2_P1_do2 ;
                     P2_P1_ready11  <=1'b1;
                     P2_P1_ready12  <=1'b0;
                  end 
                else 
                  begin 
                     P2_P1_ready11  <=1'b1;
                     P2_P1_ready12  <=1'b1;
                  end 
          end
  
  always @(  posedge   P2_P1_clock or posedge  P2_P1_reset )
       if ( P2_P1_reset ==1'b1)
          begin 
             P2_P1_buf2  <=0;
             P2_P1_ready21  <=1'b0;
             P2_P1_ready22  <=1'b0;
          end 
        else 
          begin 
            if ( P2_P1_addr2 <2**29& P2_P1_ads2 ==1'b0& P2_P1_mio2 ==1'b1& P2_P1_dc2 ==1'b0& P2_P1_wr2 ==1'b1& P2_P1_be2 ==4'b0000)
               begin 
                  P2_P1_buf2  <= P2_P1_do2 ;
                  P2_P1_ready21  <=1'b0;
                  P2_P1_ready22  <=1'b1;
               end 
             else 
               if ( P2_P1_ads3 ==1'b0& P2_P1_mio3 ==1'b1& P2_P1_dc3 ==1'b0& P2_P1_wr3 ==1'b0& P2_P1_be3 ==4'b0000)
                  begin 
                     P2_P1_ready21  <=1'b1;
                     P2_P1_ready22  <=1'b0;
                  end 
                else 
                  begin 
                     P2_P1_ready21  <=1'b1;
                     P2_P1_ready22  <=1'b1;
                  end 
          end
  
  always @(    P2_P1_addr1    or  P2_P1_buf1  or  P2_P1_datai  )
       if ( P2_P1_addr1 >2**29)
           P2_P1_di1  <= P2_P1_buf1 ;
        else 
           P2_P1_di1  <= P2_P1_datai ;
 
  always @(    P2_P1_addr2    or  P2_P1_buf1  or  P2_P1_buf2  )
       if ( P2_P1_addr2 >2**29)
           P2_P1_di2  <= P2_P1_buf1 ;
        else 
           P2_P1_di2  <= P2_P1_buf2 ;
 
  always @(      P2_P1_addr2      or  P2_P1_addr3  or  P2_P1_do1  or  P2_P1_do2  or  P2_P1_do3  )
       if (( P2_P1_do1 <2**30)&( P2_P1_do2 <2**30)&( P2_P1_do3 <2**30))
           P2_P1_address2  <= P2_P1_addr3 ;
        else 
           P2_P1_address2  <= P2_P1_addr2 ;
 
  always @(               P2_P1_buf2               or  P2_P1_do3  or  P2_P1_addr1  or  P2_P1_wr3  or  P2_P1_dc3  or  P2_P1_mio3  or  P2_P1_ads1  or  P2_P1_ads3  or  P2_P1_ready1  or  P2_P1_ready2  or  P2_P1_ready11  or  P2_P1_ready12  or  P2_P1_ready21  or  P2_P1_ready22  )
       begin 
          P2_P1_di3  <= P2_P1_buf2 ;
          P2_P1_datao  <= P2_P1_do3 ;
          P2_P1_address1  <= P2_P1_addr1 ;
          P2_P1_wr  <= P2_P1_wr3 ;
          P2_P1_dc  <= P2_P1_dc3 ;
          P2_P1_mio  <= P2_P1_mio3 ;
          P2_P1_ast1  <= P2_P1_ads1 ;
          P2_P1_ast2  <= P2_P1_ads3 ;
          P2_P1_rdy1  <= P2_P1_ready11 & P2_P1_ready1 ;
          P2_P1_rdy2  <= P2_P1_ready12 & P2_P1_ready21 ;
          P2_P1_rdy3  <= P2_P1_ready22 & P2_P1_ready2 ;
       end
  
  
 
   reg P2_P1_P1_StateNA ; 
   reg P2_P1_P1_StateBS16 ; 
   reg P2_P1_P1_RequestPending ; 
 parameter P2_P1_P1_Pending =1'b1; 
 parameter P2_P1_P1_NotPending =1'b0; 
   reg P2_P1_P1_NonAligned ; 
   reg P2_P1_P1_ReadRequest ; 
   reg P2_P1_P1_MemoryFetch ; 
   reg P2_P1_P1_CodeFetch ; 
   reg[3:0] P2_P1_P1_ByteEnable ; 
   integer P2_P1_P1_DataWidth ; 
 parameter P2_P1_P1_WidthByte =0; 
 parameter P2_P1_P1_WidthWord =1; 
 parameter P2_P1_P1_WidthDword =2; 
   reg[2:0] P2_P1_P1_State ; 
 parameter P2_P1_P1_StateInit =0; 
 parameter P2_P1_P1_StateTi =1; 
 parameter P2_P1_P1_StateT1 =2; 
 parameter P2_P1_P1_StateT2 =3; 
 parameter P2_P1_P1_StateT1P =4; 
 parameter P2_P1_P1_StateTh =5; 
 parameter P2_P1_P1_StateT2P =6; 
 parameter P2_P1_P1_StateT2I =7; 
   integer P2_P1_P1_EAX ; 
   integer P2_P1_P1_EBX ; 
   integer P2_P1_P1_rEIP ; 
 parameter P2_P1_P1_REP =8'hF3; 
 parameter P2_P1_P1_REPNE =8'hF2; 
 parameter P2_P1_P1_LOCK =8'hF0; 
 parameter P2_P1_P1_CSsop =8'h2E; 
 parameter P2_P1_P1_SSsop =8'h36; 
 parameter P2_P1_P1_DSsop =8'h3E; 
 parameter P2_P1_P1_ESsop =8'h26; 
 parameter P2_P1_P1_FSsop =8'h64; 
 parameter P2_P1_P1_GSsop =8'h65; 
 parameter P2_P1_P1_OPsop =8'h66; 
 parameter P2_P1_P1_ADsop =8'h67; 
 parameter P2_P1_P1_MOV_al_b =8'hB0; 
 parameter P2_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P2_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P2_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P2_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P2_P1_P1_IN_al =8'hE4; 
 parameter P2_P1_P1_OUT_al =8'hE6; 
 parameter P2_P1_P1_ADD_al_b =8'h04; 
 parameter P2_P1_P1_ADD_ax_w =8'h05; 
 parameter P2_P1_P1_ROL_eax_b =8'hD1; 
 parameter P2_P1_P1_ROL_al_1 =8'hD0; 
 parameter P2_P1_P1_ROL_al_n =8'hC0; 
 parameter P2_P1_P1_INC_eax =8'h40; 
 parameter P2_P1_P1_INC_ebx =8'h43; 
 parameter P2_P1_P1_JMP_rel_short =8'hEB; 
 parameter P2_P1_P1_JMP_rel_near =8'hE9; 
 parameter P2_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P2_P1_P1_HLT =8'hF4; 
 parameter P2_P1_P1_WAITx =8'h9B; 
 parameter P2_P1_P1_NOP =8'h90; 
   reg[7:0] P2_P1_P1_InstQueue [15:0]; 
   reg[4:0] P2_P1_P1_InstQueueRd_Addr ; 
   reg[4:0] P2_P1_P1_InstQueueWr_Addr ; 
 parameter P2_P1_P1_InstQueueLimit =15; 
   integer P2_P1_P1_InstAddrPointer ; 
   integer P2_P1_P1_PhyAddrPointer ; 
   reg P2_P1_P1_Extended ; 
   reg P2_P1_P1_More ; 
   reg P2_P1_P1_Flush ; 
   reg[15:0] P2_P1_P1_lWord ; 
   reg[14:0] P2_P1_P1_uWord ; 
   integer P2_P1_P1_fWord ; 
   reg[3:0] P2_P1_P1_State2 ; 
 parameter P2_P1_P1_Si =0; 
 parameter P2_P1_P1_S1 =1; 
 parameter P2_P1_P1_S2 =2; 
 parameter P2_P1_P1_S3 =3; 
 parameter P2_P1_P1_S4 =4; 
 parameter P2_P1_P1_S5 =5; 
 parameter P2_P1_P1_S6 =6; 
 parameter P2_P1_P1_S7 =7; 
 parameter P2_P1_P1_S8 =8; 
 parameter P2_P1_P1_S9 =9; 
  always @(  posedge   P2_P1_P1_CLOCK or posedge  P2_P1_P1_RESET )
       begin 
         if ( P2_P1_P1_RESET ==1'b1)
            begin 
               P2_P1_P1_BE_n  <=4'b0000;
               P2_P1_P1_Address  <=0;
               P2_P1_P1_W_R_n  <=1'b0;
               P2_P1_P1_D_C_n  <=1'b0;
               P2_P1_P1_M_IO_n  <=1'b0;
               P2_P1_P1_ADS_n  <=1'b0;
               P2_P1_P1_State  <= P2_P1_P1_StateInit ;
               P2_P1_P1_StateNA  <=1'b0;
               P2_P1_P1_StateBS16  <=1'b0;
               P2_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P2_P1_P1_State )
              P2_P1_P1_StateInit  :
                begin 
                   P2_P1_P1_D_C_n  <=1'b1;
                   P2_P1_P1_ADS_n  <=1'b1;
                   P2_P1_P1_State  <= P2_P1_P1_StateTi ;
                   P2_P1_P1_StateNA  <=1'b1;
                   P2_P1_P1_StateBS16  <=1'b1;
                   P2_P1_P1_DataWidth  <=2;
                   P2_P1_P1_State  <= P2_P1_P1_StateTi ;
                end 
              P2_P1_P1_StateTi  :
                if ( P2_P1_P1_RequestPending == P2_P1_P1_Pending )
                    P2_P1_P1_State  <= P2_P1_P1_StateT1 ;
                 else 
                   if ( P2_P1_P1_HOLD ==1'b1)
                       P2_P1_P1_State  <= P2_P1_P1_StateTh ;
                    else 
                       P2_P1_P1_State  <= P2_P1_P1_StateTi ;
              P2_P1_P1_StateT1  :
                begin 
                   P2_P1_P1_Address  <= P2_P1_P1_rEIP /4%2**30;
                   P2_P1_P1_BE_n  <= P2_P1_P1_ByteEnable ;
                   P2_P1_P1_M_IO_n  <= P2_P1_P1_MemoryFetch ;
                  if ( P2_P1_P1_ReadRequest == P2_P1_P1_Pending )
                      P2_P1_P1_W_R_n  <=1'b0;
                   else 
                      P2_P1_P1_W_R_n  <=1'b1;
                  if ( P2_P1_P1_CodeFetch == P2_P1_P1_Pending )
                      P2_P1_P1_D_C_n  <=1'b0;
                   else 
                      P2_P1_P1_D_C_n  <=1'b1;
                   P2_P1_P1_ADS_n  <=1'b0;
                   P2_P1_P1_State  <= P2_P1_P1_StateT2 ;
                end 
              P2_P1_P1_StateT2  :
                begin 
                  if ( P2_P1_P1_READY_n ==1'b0& P2_P1_P1_HOLD ==1'b0& P2_P1_P1_RequestPending == P2_P1_P1_Pending )
                      P2_P1_P1_State  <= P2_P1_P1_StateT1 ;
                   else 
                     if ( P2_P1_P1_READY_n ==1'b1& P2_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P2_P1_P1_RequestPending == P2_P1_P1_Pending | P2_P1_P1_HOLD ==1'b1)&( P2_P1_P1_READY_n ==1'b1& P2_P1_P1_NA_n ==1'b0))
                            P2_P1_P1_State  <= P2_P1_P1_StateT2I ;
                         else 
                           if ( P2_P1_P1_RequestPending == P2_P1_P1_Pending & P2_P1_P1_HOLD ==1'b0& P2_P1_P1_READY_n ==1'b1& P2_P1_P1_NA_n ==1'b0)
                               P2_P1_P1_State  <= P2_P1_P1_StateT2P ;
                            else 
                              if ( P2_P1_P1_RequestPending == P2_P1_P1_NotPending & P2_P1_P1_HOLD ==1'b0& P2_P1_P1_READY_n ==1'b0)
                                  P2_P1_P1_State  <= P2_P1_P1_StateTi ;
                               else 
                                 if ( P2_P1_P1_HOLD ==1'b1& P2_P1_P1_READY_n ==1'b1)
                                     P2_P1_P1_State  <= P2_P1_P1_StateTh ;
                                  else 
                                     P2_P1_P1_State  <= P2_P1_P1_StateT2 ;
                   P2_P1_P1_StateBS16  <= P2_P1_P1_BS16_n ;
                  if ( P2_P1_P1_BS16_n ==1'b0)
                      P2_P1_P1_DataWidth  <= P2_P1_P1_WidthWord ;
                   else 
                      P2_P1_P1_DataWidth  <= P2_P1_P1_WidthDword ;
                   P2_P1_P1_StateNA  <= P2_P1_P1_NA_n ;
                   P2_P1_P1_ADS_n  <=1'b1;
                end 
              P2_P1_P1_StateT1P  :
                begin 
                  if ( P2_P1_P1_NA_n ==1'b0& P2_P1_P1_HOLD ==1'b0& P2_P1_P1_RequestPending == P2_P1_P1_Pending )
                      P2_P1_P1_State  <= P2_P1_P1_StateT2P ;
                   else 
                     if ( P2_P1_P1_NA_n ==1'b0&( P2_P1_P1_HOLD ==1'b1| P2_P1_P1_RequestPending == P2_P1_P1_NotPending ))
                         P2_P1_P1_State  <= P2_P1_P1_StateT2I ;
                      else 
                        if ( P2_P1_P1_NA_n ==1'b1)
                            P2_P1_P1_State  <= P2_P1_P1_StateT2 ;
                         else 
                            P2_P1_P1_State  <= P2_P1_P1_StateT1P ;
                   P2_P1_P1_StateBS16  <= P2_P1_P1_BS16_n ;
                  if ( P2_P1_P1_BS16_n ==1'b0)
                      P2_P1_P1_DataWidth  <= P2_P1_P1_WidthWord ;
                   else 
                      P2_P1_P1_DataWidth  <= P2_P1_P1_WidthDword ;
                   P2_P1_P1_StateNA  <= P2_P1_P1_NA_n ;
                   P2_P1_P1_ADS_n  <=1'b1;
                end 
              P2_P1_P1_StateTh  :
                if ( P2_P1_P1_HOLD ==1'b0& P2_P1_P1_RequestPending == P2_P1_P1_Pending )
                    P2_P1_P1_State  <= P2_P1_P1_StateT1 ;
                 else 
                   if ( P2_P1_P1_HOLD ==1'b0& P2_P1_P1_RequestPending == P2_P1_P1_NotPending )
                       P2_P1_P1_State  <= P2_P1_P1_StateTi ;
                    else 
                       P2_P1_P1_State  <= P2_P1_P1_StateTh ;
              P2_P1_P1_StateT2P  :
                begin 
                   P2_P1_P1_Address  <= P2_P1_P1_rEIP /2%2**30;
                   P2_P1_P1_BE_n  <= P2_P1_P1_ByteEnable ;
                   P2_P1_P1_M_IO_n  <= P2_P1_P1_MemoryFetch ;
                  if ( P2_P1_P1_ReadRequest == P2_P1_P1_Pending )
                      P2_P1_P1_W_R_n  <=1'b0;
                   else 
                      P2_P1_P1_W_R_n  <=1'b1;
                  if ( P2_P1_P1_CodeFetch == P2_P1_P1_Pending )
                      P2_P1_P1_D_C_n  <=1'b0;
                   else 
                      P2_P1_P1_D_C_n  <=1'b1;
                   P2_P1_P1_ADS_n  <=1'b0;
                  if ( P2_P1_P1_READY_n ==1'b0)
                      P2_P1_P1_State  <= P2_P1_P1_StateT1P ;
                   else 
                      P2_P1_P1_State  <= P2_P1_P1_StateT2P ;
                end 
              P2_P1_P1_StateT2I  :
                if ( P2_P1_P1_READY_n ==1'b1& P2_P1_P1_RequestPending == P2_P1_P1_Pending & P2_P1_P1_HOLD ==1'b0)
                    P2_P1_P1_State  <= P2_P1_P1_StateT2P ;
                 else 
                   if ( P2_P1_P1_READY_n ==1'b0& P2_P1_P1_HOLD ==1'b1)
                       P2_P1_P1_State  <= P2_P1_P1_StateTh ;
                    else 
                      if ( P2_P1_P1_READY_n ==1'b0& P2_P1_P1_HOLD ==1'b0& P2_P1_P1_RequestPending == P2_P1_P1_Pending )
                          P2_P1_P1_State  <= P2_P1_P1_StateT1 ;
                       else 
                         if ( P2_P1_P1_READY_n ==1'b0& P2_P1_P1_HOLD ==1'b0& P2_P1_P1_RequestPending == P2_P1_P1_NotPending )
                             P2_P1_P1_State  <= P2_P1_P1_StateTi ;
                          else 
                             P2_P1_P1_State  <= P2_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P2_P1_P1_CLOCK or posedge  P2_P1_P1_RESET )
       begin 
         if ( P2_P1_P1_RESET ==1'b1)
            begin 
               P2_P1_P1_State2  = P2_P1_P1_Si ;
               P2_P1_P1_InstQueue  [0]=8'b0000_0000;
               P2_P1_P1_InstQueue  [1]=8'b0000_0000;
               P2_P1_P1_InstQueue  [2]=8'b0000_0000;
               P2_P1_P1_InstQueue  [3]=8'b0000_0000;
               P2_P1_P1_InstQueue  [4]=8'b0000_0000;
               P2_P1_P1_InstQueue  [5]=8'b0000_0000;
               P2_P1_P1_InstQueue  [6]=8'b0000_0000;
               P2_P1_P1_InstQueue  [7]=8'b0000_0000;
               P2_P1_P1_InstQueue  [8]=8'b0000_0000;
               P2_P1_P1_InstQueue  [9]=8'b0000_0000;
               P2_P1_P1_InstQueue  [10]=8'b0000_0000;
               P2_P1_P1_InstQueue  [11]=8'b0000_0000;
               P2_P1_P1_InstQueue  [12]=8'b0000_0000;
               P2_P1_P1_InstQueue  [13]=8'b0000_0000;
               P2_P1_P1_InstQueue  [14]=8'b0000_0000;
               P2_P1_P1_InstQueue  [15]=8'b0000_0000;
               P2_P1_P1_InstQueueRd_Addr  =0;
               P2_P1_P1_InstQueueWr_Addr  =0;
               P2_P1_P1_InstAddrPointer  =0;
               P2_P1_P1_PhyAddrPointer  =0;
               P2_P1_P1_Extended  =1'b0;
               P2_P1_P1_More  =1'b0;
               P2_P1_P1_Flush  =1'b0;
               P2_P1_P1_lWord  =0;
               P2_P1_P1_uWord  =0;
               P2_P1_P1_fWord  =0;
               P2_P1_P1_CodeFetch  <=1'b0;
               P2_P1_P1_Datao  <=0;
               P2_P1_P1_EAX  <=0;
               P2_P1_P1_EBX  <=0;
               P2_P1_P1_rEIP  <=0;
               P2_P1_P1_ReadRequest  <=1'b0;
               P2_P1_P1_MemoryFetch  <=1'b0;
               P2_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P2_P1_P1_State2 )
              P2_P1_P1_Si  :
                begin 
                   P2_P1_P1_PhyAddrPointer  = P2_P1_P1_rEIP ;
                   P2_P1_P1_InstAddrPointer  = P2_P1_P1_PhyAddrPointer ;
                   P2_P1_P1_State2  = P2_P1_P1_S1 ;
                   P2_P1_P1_rEIP  <=20'hFFFF0;
                   P2_P1_P1_ReadRequest  <=1'b1;
                   P2_P1_P1_MemoryFetch  <=1'b1;
                   P2_P1_P1_RequestPending  <=1'b1;
                end 
              P2_P1_P1_S1  :
                begin 
                   P2_P1_P1_RequestPending  <= P2_P1_P1_Pending ;
                   P2_P1_P1_ReadRequest  <= P2_P1_P1_Pending ;
                   P2_P1_P1_MemoryFetch  <= P2_P1_P1_Pending ;
                   P2_P1_P1_CodeFetch  <= P2_P1_P1_Pending ;
                  if ( P2_P1_P1_READY_n ==1'b0)
                      P2_P1_P1_State2  = P2_P1_P1_S2 ;
                   else 
                      P2_P1_P1_State2  = P2_P1_P1_S1 ;
                end 
              P2_P1_P1_S2  :
                begin 
                   P2_P1_P1_RequestPending  <= P2_P1_P1_NotPending ;
                   P2_P1_P1_InstQueue  [ P2_P1_P1_InstQueueWr_Addr ]= P2_P1_P1_Datai %(2**8);
                   P2_P1_P1_InstQueueWr_Addr  =( P2_P1_P1_InstQueueWr_Addr +1)%16;
                   P2_P1_P1_InstQueue  [ P2_P1_P1_InstQueueWr_Addr ]= P2_P1_P1_Datai %2**8;
                   P2_P1_P1_InstQueueWr_Addr  =( P2_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P2_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P2_P1_P1_InstQueue  [ P2_P1_P1_InstQueueWr_Addr ]=( P2_P1_P1_Datai /(2**16))%(2**8);
                        P2_P1_P1_InstQueueWr_Addr  =( P2_P1_P1_InstQueueWr_Addr +1)%16;
                        P2_P1_P1_InstQueue  [ P2_P1_P1_InstQueueWr_Addr ]=( P2_P1_P1_Datai /(2**24))%(2**8);
                        P2_P1_P1_InstQueueWr_Addr  =( P2_P1_P1_InstQueueWr_Addr +1)%16;
                        P2_P1_P1_PhyAddrPointer  = P2_P1_P1_PhyAddrPointer +4;
                        P2_P1_P1_State2  = P2_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P2_P1_P1_PhyAddrPointer  = P2_P1_P1_PhyAddrPointer +2;
                       if ( P2_P1_P1_PhyAddrPointer <0)
                           P2_P1_P1_rEIP  <=- P2_P1_P1_PhyAddrPointer ;
                        else 
                           P2_P1_P1_rEIP  <= P2_P1_P1_PhyAddrPointer ;
                        P2_P1_P1_State2  = P2_P1_P1_S3 ;
                     end 
                end 
              P2_P1_P1_S3  :
                begin 
                   P2_P1_P1_RequestPending  <= P2_P1_P1_Pending ;
                  if ( P2_P1_P1_READY_n ==1'b0)
                      P2_P1_P1_State2  = P2_P1_P1_S4 ;
                   else 
                      P2_P1_P1_State2  = P2_P1_P1_S3 ;
                end 
              P2_P1_P1_S4  :
                begin 
                   P2_P1_P1_RequestPending  <= P2_P1_P1_NotPending ;
                   P2_P1_P1_InstQueue  [ P2_P1_P1_InstQueueWr_Addr ]= P2_P1_P1_Datai %(2**8);
                   P2_P1_P1_InstQueueWr_Addr  =( P2_P1_P1_InstQueueWr_Addr +1)%16;
                   P2_P1_P1_InstQueue  [ P2_P1_P1_InstQueueWr_Addr ]= P2_P1_P1_Datai %(2**8);
                   P2_P1_P1_InstQueueWr_Addr  =( P2_P1_P1_InstQueueWr_Addr +1)%16;
                   P2_P1_P1_PhyAddrPointer  = P2_P1_P1_PhyAddrPointer +2;
                   P2_P1_P1_State2  = P2_P1_P1_S5 ;
                end 
              P2_P1_P1_S5  :
                begin 
                  case ( P2_P1_P1_InstQueue [ P2_P1_P1_InstQueueRd_Addr ])
                    P2_P1_P1_NOP  :
                      begin 
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +1;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +1)%16;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                    P2_P1_P1_OPsop  :
                      begin 
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +1;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +1)%16;
                         P2_P1_P1_Extended  =1'b1;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                    P2_P1_P1_JMP_rel_short  :
                      if (( P2_P1_P1_InstQueueWr_Addr - P2_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P2_P1_P1_PhyAddrPointer  = P2_P1_P1_InstAddrPointer +1-(8'hFF- P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P2_P1_P1_InstAddrPointer  = P2_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P2_P1_P1_PhyAddrPointer  = P2_P1_P1_InstAddrPointer +2+ P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +1)%16];
                                 P2_P1_P1_InstAddrPointer  = P2_P1_P1_PhyAddrPointer ;
                              end 
                            P2_P1_P1_Flush  =1'b1;
                            P2_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P1_P1_Flush  =1'b0;
                            P2_P1_P1_More  =1'b1;
                         end 
                    P2_P1_P1_JMP_rel_near  :
                      if (( P2_P1_P1_InstQueueWr_Addr - P2_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P1_P1_PhyAddrPointer  = P2_P1_P1_InstAddrPointer +5+ P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +1)%16];
                            P2_P1_P1_InstAddrPointer  = P2_P1_P1_PhyAddrPointer ;
                            P2_P1_P1_Flush  =1'b1;
                            P2_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P1_P1_Flush  =1'b0;
                            P2_P1_P1_More  =1'b1;
                         end 
                    P2_P1_P1_JMP_intseg_immed  :
                      begin 
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +1;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +1)%16;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                    P2_P1_P1_MOV_al_b  :
                      begin 
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +1;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +1)%16;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                    P2_P1_P1_MOV_eax_dw  :
                      if (( P2_P1_P1_InstQueueWr_Addr - P2_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P1_P1_EAX  <= P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +1)%16];
                            P2_P1_P1_More  =1'b0;
                            P2_P1_P1_Flush  =1'b0;
                            P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +5;
                            P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P1_P1_Flush  =1'b0;
                            P2_P1_P1_More  =1'b1;
                         end 
                    P2_P1_P1_MOV_ebx_dw  :
                      if (( P2_P1_P1_InstQueueWr_Addr - P2_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P1_P1_EBX  <= P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P1_P1_InstQueue [( P2_P1_P1_InstQueueRd_Addr +1)%1];
                            P2_P1_P1_More  =1'b0;
                            P2_P1_P1_Flush  =1'b0;
                            P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +5;
                            P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P1_P1_Flush  =1'b0;
                            P2_P1_P1_More  =1'b1;
                         end 
                    P2_P1_P1_MOV_eax_ebx  :
                      if (( P2_P1_P1_InstQueueWr_Addr - P2_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P1_P1_EBX <0)
                               P2_P1_P1_rEIP  <=- P2_P1_P1_EBX ;
                            else 
                               P2_P1_P1_rEIP  <= P2_P1_P1_EBX ;
                            P2_P1_P1_RequestPending  <= P2_P1_P1_Pending ;
                            P2_P1_P1_ReadRequest  <= P2_P1_P1_Pending ;
                            P2_P1_P1_MemoryFetch  <= P2_P1_P1_Pending ;
                            P2_P1_P1_CodeFetch  <= P2_P1_P1_NotPending ;
                           if ( P2_P1_P1_READY_n ==1'b0)
                              begin 
                                 P2_P1_P1_RequestPending  <= P2_P1_P1_NotPending ;
                                 P2_P1_P1_uWord  = P2_P1_P1_Datai %(2**15);
                                if ( P2_P1_P1_StateBS16 ==1'b1)
                                    P2_P1_P1_lWord  = P2_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P2_P1_P1_rEIP  <= P2_P1_P1_rEIP +2;
                                      P2_P1_P1_RequestPending  <= P2_P1_P1_Pending ;
                                     if ( P2_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P2_P1_P1_RequestPending  <= P2_P1_P1_NotPending ;
                                           P2_P1_P1_lWord  = P2_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P2_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P2_P1_P1_EAX  <= P2_P1_P1_uWord *(2**16)+ P2_P1_P1_lWord ;
                                      P2_P1_P1_More  =1'b0;
                                      P2_P1_P1_Flush  =1'b0;
                                      P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +2;
                                      P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P1_Flush  =1'b0;
                            P2_P1_P1_More  =1'b1;
                         end 
                    P2_P1_P1_MOV_ebx_eax  :
                      if (( P2_P1_P1_InstQueueWr_Addr - P2_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P1_P1_EBX <0)
                               P2_P1_P1_rEIP  <= P2_P1_P1_EBX ;
                            else 
                               P2_P1_P1_rEIP  <= P2_P1_P1_EBX ;
                            P2_P1_P1_lWord  = P2_P1_P1_EAX %(2**16);
                            P2_P1_P1_uWord  =( P2_P1_P1_EAX /(2**16))%(2**15);
                            P2_P1_P1_RequestPending  <= P2_P1_P1_Pending ;
                            P2_P1_P1_ReadRequest  <= P2_P1_P1_NotPending ;
                            P2_P1_P1_MemoryFetch  <= P2_P1_P1_Pending ;
                            P2_P1_P1_CodeFetch  <= P2_P1_P1_NotPending ;
                           if ( P2_P1_P1_State == P2_P1_P1_StateT1 | P2_P1_P1_State == P2_P1_P1_StateT1P )
                              begin 
                                 P2_P1_P1_Datao  <=( P2_P1_P1_uWord *(2**16)+ P2_P1_P1_lWord );
                                if ( P2_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P2_P1_P1_RequestPending  <= P2_P1_P1_NotPending ;
                                     if ( P2_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P2_P1_P1_rEIP  <= P2_P1_P1_rEIP +2;
                                           P2_P1_P1_RequestPending  <= P2_P1_P1_Pending ;
                                           P2_P1_P1_ReadRequest  <= P2_P1_P1_NotPending ;
                                           P2_P1_P1_MemoryFetch  <= P2_P1_P1_Pending ;
                                           P2_P1_P1_CodeFetch  <= P2_P1_P1_NotPending ;
                                           P2_P1_P1_State2  = P2_P1_P1_S6 ;
                                        end 
                                      P2_P1_P1_More  =1'b0;
                                      P2_P1_P1_Flush  =1'b0;
                                      P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +2;
                                      P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P1_Flush  =1'b0;
                            P2_P1_P1_More  =1'b1;
                         end 
                    P2_P1_P1_IN_al  :
                      if (( P2_P1_P1_InstQueueWr_Addr - P2_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P1_P1_rEIP  <= P2_P1_P1_InstQueueRd_Addr +1;
                            P2_P1_P1_RequestPending  <= P2_P1_P1_Pending ;
                            P2_P1_P1_ReadRequest  <= P2_P1_P1_Pending ;
                            P2_P1_P1_MemoryFetch  <= P2_P1_P1_NotPending ;
                            P2_P1_P1_CodeFetch  <= P2_P1_P1_NotPending ;
                           if ( P2_P1_P1_READY_n ==1'b0)
                              begin 
                                 P2_P1_P1_RequestPending  <= P2_P1_P1_NotPending ;
                                 P2_P1_P1_EAX  <= P2_P1_P1_Datai ;
                                 P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +2;
                                 P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +2);
                                 P2_P1_P1_Flush  =1'b0;
                                 P2_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P1_Flush  =1'b0;
                            P2_P1_P1_More  =1'b1;
                         end 
                    P2_P1_P1_OUT_al  :
                      if (( P2_P1_P1_InstQueueWr_Addr - P2_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P1_P1_rEIP  <= P2_P1_P1_InstQueueRd_Addr +1;
                            P2_P1_P1_RequestPending  <= P2_P1_P1_Pending ;
                            P2_P1_P1_ReadRequest  <= P2_P1_P1_NotPending ;
                            P2_P1_P1_MemoryFetch  <= P2_P1_P1_NotPending ;
                            P2_P1_P1_CodeFetch  <= P2_P1_P1_NotPending ;
                           if ( P2_P1_P1_State == P2_P1_P1_StateT1 | P2_P1_P1_State == P2_P1_P1_StateT1P )
                              begin 
                                 P2_P1_P1_fWord  = P2_P1_P1_EAX %(2**16);
                                 P2_P1_P1_Datao  <= P2_P1_P1_fWord ;
                                if ( P2_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P2_P1_P1_RequestPending  <= P2_P1_P1_NotPending ;
                                      P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +2;
                                      P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +2)%16;
                                      P2_P1_P1_Flush  =1'b0;
                                      P2_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P1_Flush  =1'b0;
                            P2_P1_P1_More  =1'b1;
                         end 
                    P2_P1_P1_ADD_al_b  :
                      begin 
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +1;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +1)%16;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                    P2_P1_P1_ADD_ax_w  :
                      begin 
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +1;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +1)%16;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                    P2_P1_P1_ROL_al_1  :
                      begin 
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +2;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +2)%16;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                    P2_P1_P1_ROL_al_n  :
                      begin 
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +2;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +2)%16;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                    P2_P1_P1_INC_eax  :
                      begin 
                         P2_P1_P1_EAX  <= P2_P1_P1_EAX +1;
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +1;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +1)%16;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                    P2_P1_P1_INC_ebx  :
                      begin 
                         P2_P1_P1_EBX  <= P2_P1_P1_EBX +1;
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +1;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +1)%16;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P2_P1_P1_InstAddrPointer  = P2_P1_P1_InstAddrPointer +1;
                         P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +1)%16;
                         P2_P1_P1_Flush  =1'b0;
                         P2_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P2_P1_P1_InstQueueRd_Addr < P2_P1_P1_InstQueueWr_Addr ))|((( P2_P1_P1_InstQueueLimit - P2_P1_P1_InstQueueRd_Addr )<4)| P2_P1_P1_Flush | P2_P1_P1_More ))
                      P2_P1_P1_State2  = P2_P1_P1_S7 ;
                end 
              P2_P1_P1_S6  :
                begin 
                   P2_P1_P1_Datao  <=( P2_P1_P1_uWord *(2**16)+ P2_P1_P1_lWord );
                  if ( P2_P1_P1_READY_n ==1'b0)
                     begin 
                        P2_P1_P1_RequestPending  <= P2_P1_P1_NotPending ;
                        P2_P1_P1_State2  = P2_P1_P1_S5 ;
                     end 
                end 
              P2_P1_P1_S7  :
                begin 
                  if ( P2_P1_P1_Flush )
                     begin 
                        P2_P1_P1_InstQueueRd_Addr  =1;
                        P2_P1_P1_InstQueueWr_Addr  =1;
                       if ( P2_P1_P1_InstAddrPointer <0)
                           P2_P1_P1_fWord  =- P2_P1_P1_InstAddrPointer ;
                        else 
                           P2_P1_P1_fWord  = P2_P1_P1_InstAddrPointer ;
                       if ( P2_P1_P1_fWord %2==1)
                           P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr + P2_P1_P1_fWord %4)%16;
                     end 
                  if (( P2_P1_P1_InstQueueLimit - P2_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P2_P1_P1_State2  = P2_P1_P1_S8 ;
                        P2_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P2_P1_P1_State2  = P2_P1_P1_S9 ;
                end 
              P2_P1_P1_S8  :
                if ( P2_P1_P1_InstQueueRd_Addr <= P2_P1_P1_InstQueueLimit )
                   begin 
                      P2_P1_P1_InstQueue  [ P2_P1_P1_InstQueueWr_Addr ]= P2_P1_P1_InstQueue [ P2_P1_P1_InstQueueRd_Addr ];
                      P2_P1_P1_InstQueueRd_Addr  =( P2_P1_P1_InstQueueRd_Addr +1)%16;
                      P2_P1_P1_InstQueueWr_Addr  =( P2_P1_P1_InstQueueWr_Addr +1)%16;
                      P2_P1_P1_State2  = P2_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P2_P1_P1_InstQueueRd_Addr  =0;
                      P2_P1_P1_State2  = P2_P1_P1_S9 ;
                   end 
              P2_P1_P1_S9  :
                begin 
                   P2_P1_P1_rEIP  <= P2_P1_P1_PhyAddrPointer ;
                   P2_P1_P1_State2  = P2_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P2_P1_P1_CLOCK or posedge  P2_P1_P1_RESET )
       begin 
         if ( P2_P1_P1_RESET ==1'b1)
            begin 
               P2_P1_P1_ByteEnable  <=4'b0000;
               P2_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P2_P1_P1_DataWidth )
              P2_P1_P1_WidthByte  :
                case ( P2_P1_P1_rEIP %4)
                 0 :
                     P2_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P2_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P2_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P2_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P2_P1_P1_WidthWord  :
                case ( P2_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P2_P1_P1_ByteEnable  <=4'b1100;
                       P2_P1_P1_NonAligned  <= P2_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P1_P1_ByteEnable  <=4'b1001;
                       P2_P1_P1_NonAligned  <= P2_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P2_P1_P1_ByteEnable  <=4'b0011;
                       P2_P1_P1_NonAligned  <= P2_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P2_P1_P1_ByteEnable  <=4'b0111;
                       P2_P1_P1_NonAligned  <= P2_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P2_P1_P1_WidthDword  :
                case ( P2_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P2_P1_P1_ByteEnable  <=4'b0000;
                       P2_P1_P1_NonAligned  <= P2_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P1_P1_ByteEnable  <=4'b0001;
                       P2_P1_P1_NonAligned  <= P2_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P2_P1_P1_NonAligned  <= P2_P1_P1_Pending ;
                       P2_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P2_P1_P1_NonAligned  <= P2_P1_P1_Pending ;
                       P2_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
 
   reg P2_P1_P2_StateNA ; 
   reg P2_P1_P2_StateBS16 ; 
   reg P2_P1_P2_RequestPending ; 
 parameter P2_P1_P2_Pending =1'b1; 
 parameter P2_P1_P2_NotPending =1'b0; 
   reg P2_P1_P2_NonAligned ; 
   reg P2_P1_P2_ReadRequest ; 
   reg P2_P1_P2_MemoryFetch ; 
   reg P2_P1_P2_CodeFetch ; 
   reg[3:0] P2_P1_P2_ByteEnable ; 
   integer P2_P1_P2_DataWidth ; 
 parameter P2_P1_P2_WidthByte =0; 
 parameter P2_P1_P2_WidthWord =1; 
 parameter P2_P1_P2_WidthDword =2; 
   reg[2:0] P2_P1_P2_State ; 
 parameter P2_P1_P2_StateInit =0; 
 parameter P2_P1_P2_StateTi =1; 
 parameter P2_P1_P2_StateT1 =2; 
 parameter P2_P1_P2_StateT2 =3; 
 parameter P2_P1_P2_StateT1P =4; 
 parameter P2_P1_P2_StateTh =5; 
 parameter P2_P1_P2_StateT2P =6; 
 parameter P2_P1_P2_StateT2I =7; 
   integer P2_P1_P2_EAX ; 
   integer P2_P1_P2_EBX ; 
   integer P2_P1_P2_rEIP ; 
 parameter P2_P1_P2_REP =8'hF3; 
 parameter P2_P1_P2_REPNE =8'hF2; 
 parameter P2_P1_P2_LOCK =8'hF0; 
 parameter P2_P1_P2_CSsop =8'h2E; 
 parameter P2_P1_P2_SSsop =8'h36; 
 parameter P2_P1_P2_DSsop =8'h3E; 
 parameter P2_P1_P2_ESsop =8'h26; 
 parameter P2_P1_P2_FSsop =8'h64; 
 parameter P2_P1_P2_GSsop =8'h65; 
 parameter P2_P1_P2_OPsop =8'h66; 
 parameter P2_P1_P2_ADsop =8'h67; 
 parameter P2_P1_P2_MOV_al_b =8'hB0; 
 parameter P2_P1_P2_MOV_eax_dw =8'hB8; 
 parameter P2_P1_P2_MOV_ebx_dw =8'hBB; 
 parameter P2_P1_P2_MOV_ebx_eax =8'h89; 
 parameter P2_P1_P2_MOV_eax_ebx =8'h8B; 
 parameter P2_P1_P2_IN_al =8'hE4; 
 parameter P2_P1_P2_OUT_al =8'hE6; 
 parameter P2_P1_P2_ADD_al_b =8'h04; 
 parameter P2_P1_P2_ADD_ax_w =8'h05; 
 parameter P2_P1_P2_ROL_eax_b =8'hD1; 
 parameter P2_P1_P2_ROL_al_1 =8'hD0; 
 parameter P2_P1_P2_ROL_al_n =8'hC0; 
 parameter P2_P1_P2_INC_eax =8'h40; 
 parameter P2_P1_P2_INC_ebx =8'h43; 
 parameter P2_P1_P2_JMP_rel_short =8'hEB; 
 parameter P2_P1_P2_JMP_rel_near =8'hE9; 
 parameter P2_P1_P2_JMP_intseg_immed =8'hEA; 
 parameter P2_P1_P2_HLT =8'hF4; 
 parameter P2_P1_P2_WAITx =8'h9B; 
 parameter P2_P1_P2_NOP =8'h90; 
   reg[7:0] P2_P1_P2_InstQueue [15:0]; 
   reg[4:0] P2_P1_P2_InstQueueRd_Addr ; 
   reg[4:0] P2_P1_P2_InstQueueWr_Addr ; 
 parameter P2_P1_P2_InstQueueLimit =15; 
   integer P2_P1_P2_InstAddrPointer ; 
   integer P2_P1_P2_PhyAddrPointer ; 
   reg P2_P1_P2_Extended ; 
   reg P2_P1_P2_More ; 
   reg P2_P1_P2_Flush ; 
   reg[15:0] P2_P1_P2_lWord ; 
   reg[14:0] P2_P1_P2_uWord ; 
   integer P2_P1_P2_fWord ; 
   reg[3:0] P2_P1_P2_State2 ; 
 parameter P2_P1_P2_Si =0; 
 parameter P2_P1_P2_S1 =1; 
 parameter P2_P1_P2_S2 =2; 
 parameter P2_P1_P2_S3 =3; 
 parameter P2_P1_P2_S4 =4; 
 parameter P2_P1_P2_S5 =5; 
 parameter P2_P1_P2_S6 =6; 
 parameter P2_P1_P2_S7 =7; 
 parameter P2_P1_P2_S8 =8; 
 parameter P2_P1_P2_S9 =9; 
  always @(  posedge   P2_P1_P2_CLOCK or posedge  P2_P1_P2_RESET )
       begin 
         if ( P2_P1_P2_RESET ==1'b1)
            begin 
               P2_P1_P2_BE_n  <=4'b0000;
               P2_P1_P2_Address  <=0;
               P2_P1_P2_W_R_n  <=1'b0;
               P2_P1_P2_D_C_n  <=1'b0;
               P2_P1_P2_M_IO_n  <=1'b0;
               P2_P1_P2_ADS_n  <=1'b0;
               P2_P1_P2_State  <= P2_P1_P2_StateInit ;
               P2_P1_P2_StateNA  <=1'b0;
               P2_P1_P2_StateBS16  <=1'b0;
               P2_P1_P2_DataWidth  <=0;
            end 
          else 
            case ( P2_P1_P2_State )
              P2_P1_P2_StateInit  :
                begin 
                   P2_P1_P2_D_C_n  <=1'b1;
                   P2_P1_P2_ADS_n  <=1'b1;
                   P2_P1_P2_State  <= P2_P1_P2_StateTi ;
                   P2_P1_P2_StateNA  <=1'b1;
                   P2_P1_P2_StateBS16  <=1'b1;
                   P2_P1_P2_DataWidth  <=2;
                   P2_P1_P2_State  <= P2_P1_P2_StateTi ;
                end 
              P2_P1_P2_StateTi  :
                if ( P2_P1_P2_RequestPending == P2_P1_P2_Pending )
                    P2_P1_P2_State  <= P2_P1_P2_StateT1 ;
                 else 
                   if ( P2_P1_P2_HOLD ==1'b1)
                       P2_P1_P2_State  <= P2_P1_P2_StateTh ;
                    else 
                       P2_P1_P2_State  <= P2_P1_P2_StateTi ;
              P2_P1_P2_StateT1  :
                begin 
                   P2_P1_P2_Address  <= P2_P1_P2_rEIP /4%2**30;
                   P2_P1_P2_BE_n  <= P2_P1_P2_ByteEnable ;
                   P2_P1_P2_M_IO_n  <= P2_P1_P2_MemoryFetch ;
                  if ( P2_P1_P2_ReadRequest == P2_P1_P2_Pending )
                      P2_P1_P2_W_R_n  <=1'b0;
                   else 
                      P2_P1_P2_W_R_n  <=1'b1;
                  if ( P2_P1_P2_CodeFetch == P2_P1_P2_Pending )
                      P2_P1_P2_D_C_n  <=1'b0;
                   else 
                      P2_P1_P2_D_C_n  <=1'b1;
                   P2_P1_P2_ADS_n  <=1'b0;
                   P2_P1_P2_State  <= P2_P1_P2_StateT2 ;
                end 
              P2_P1_P2_StateT2  :
                begin 
                  if ( P2_P1_P2_READY_n ==1'b0& P2_P1_P2_HOLD ==1'b0& P2_P1_P2_RequestPending == P2_P1_P2_Pending )
                      P2_P1_P2_State  <= P2_P1_P2_StateT1 ;
                   else 
                     if ( P2_P1_P2_READY_n ==1'b1& P2_P1_P2_NA_n ==1'b1);
                      else 
                        if (( P2_P1_P2_RequestPending == P2_P1_P2_Pending | P2_P1_P2_HOLD ==1'b1)&( P2_P1_P2_READY_n ==1'b1& P2_P1_P2_NA_n ==1'b0))
                            P2_P1_P2_State  <= P2_P1_P2_StateT2I ;
                         else 
                           if ( P2_P1_P2_RequestPending == P2_P1_P2_Pending & P2_P1_P2_HOLD ==1'b0& P2_P1_P2_READY_n ==1'b1& P2_P1_P2_NA_n ==1'b0)
                               P2_P1_P2_State  <= P2_P1_P2_StateT2P ;
                            else 
                              if ( P2_P1_P2_RequestPending == P2_P1_P2_NotPending & P2_P1_P2_HOLD ==1'b0& P2_P1_P2_READY_n ==1'b0)
                                  P2_P1_P2_State  <= P2_P1_P2_StateTi ;
                               else 
                                 if ( P2_P1_P2_HOLD ==1'b1& P2_P1_P2_READY_n ==1'b1)
                                     P2_P1_P2_State  <= P2_P1_P2_StateTh ;
                                  else 
                                     P2_P1_P2_State  <= P2_P1_P2_StateT2 ;
                   P2_P1_P2_StateBS16  <= P2_P1_P2_BS16_n ;
                  if ( P2_P1_P2_BS16_n ==1'b0)
                      P2_P1_P2_DataWidth  <= P2_P1_P2_WidthWord ;
                   else 
                      P2_P1_P2_DataWidth  <= P2_P1_P2_WidthDword ;
                   P2_P1_P2_StateNA  <= P2_P1_P2_NA_n ;
                   P2_P1_P2_ADS_n  <=1'b1;
                end 
              P2_P1_P2_StateT1P  :
                begin 
                  if ( P2_P1_P2_NA_n ==1'b0& P2_P1_P2_HOLD ==1'b0& P2_P1_P2_RequestPending == P2_P1_P2_Pending )
                      P2_P1_P2_State  <= P2_P1_P2_StateT2P ;
                   else 
                     if ( P2_P1_P2_NA_n ==1'b0&( P2_P1_P2_HOLD ==1'b1| P2_P1_P2_RequestPending == P2_P1_P2_NotPending ))
                         P2_P1_P2_State  <= P2_P1_P2_StateT2I ;
                      else 
                        if ( P2_P1_P2_NA_n ==1'b1)
                            P2_P1_P2_State  <= P2_P1_P2_StateT2 ;
                         else 
                            P2_P1_P2_State  <= P2_P1_P2_StateT1P ;
                   P2_P1_P2_StateBS16  <= P2_P1_P2_BS16_n ;
                  if ( P2_P1_P2_BS16_n ==1'b0)
                      P2_P1_P2_DataWidth  <= P2_P1_P2_WidthWord ;
                   else 
                      P2_P1_P2_DataWidth  <= P2_P1_P2_WidthDword ;
                   P2_P1_P2_StateNA  <= P2_P1_P2_NA_n ;
                   P2_P1_P2_ADS_n  <=1'b1;
                end 
              P2_P1_P2_StateTh  :
                if ( P2_P1_P2_HOLD ==1'b0& P2_P1_P2_RequestPending == P2_P1_P2_Pending )
                    P2_P1_P2_State  <= P2_P1_P2_StateT1 ;
                 else 
                   if ( P2_P1_P2_HOLD ==1'b0& P2_P1_P2_RequestPending == P2_P1_P2_NotPending )
                       P2_P1_P2_State  <= P2_P1_P2_StateTi ;
                    else 
                       P2_P1_P2_State  <= P2_P1_P2_StateTh ;
              P2_P1_P2_StateT2P  :
                begin 
                   P2_P1_P2_Address  <= P2_P1_P2_rEIP /2%2**30;
                   P2_P1_P2_BE_n  <= P2_P1_P2_ByteEnable ;
                   P2_P1_P2_M_IO_n  <= P2_P1_P2_MemoryFetch ;
                  if ( P2_P1_P2_ReadRequest == P2_P1_P2_Pending )
                      P2_P1_P2_W_R_n  <=1'b0;
                   else 
                      P2_P1_P2_W_R_n  <=1'b1;
                  if ( P2_P1_P2_CodeFetch == P2_P1_P2_Pending )
                      P2_P1_P2_D_C_n  <=1'b0;
                   else 
                      P2_P1_P2_D_C_n  <=1'b1;
                   P2_P1_P2_ADS_n  <=1'b0;
                  if ( P2_P1_P2_READY_n ==1'b0)
                      P2_P1_P2_State  <= P2_P1_P2_StateT1P ;
                   else 
                      P2_P1_P2_State  <= P2_P1_P2_StateT2P ;
                end 
              P2_P1_P2_StateT2I  :
                if ( P2_P1_P2_READY_n ==1'b1& P2_P1_P2_RequestPending == P2_P1_P2_Pending & P2_P1_P2_HOLD ==1'b0)
                    P2_P1_P2_State  <= P2_P1_P2_StateT2P ;
                 else 
                   if ( P2_P1_P2_READY_n ==1'b0& P2_P1_P2_HOLD ==1'b1)
                       P2_P1_P2_State  <= P2_P1_P2_StateTh ;
                    else 
                      if ( P2_P1_P2_READY_n ==1'b0& P2_P1_P2_HOLD ==1'b0& P2_P1_P2_RequestPending == P2_P1_P2_Pending )
                          P2_P1_P2_State  <= P2_P1_P2_StateT1 ;
                       else 
                         if ( P2_P1_P2_READY_n ==1'b0& P2_P1_P2_HOLD ==1'b0& P2_P1_P2_RequestPending == P2_P1_P2_NotPending )
                             P2_P1_P2_State  <= P2_P1_P2_StateTi ;
                          else 
                             P2_P1_P2_State  <= P2_P1_P2_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P2_P1_P2_CLOCK or posedge  P2_P1_P2_RESET )
       begin 
         if ( P2_P1_P2_RESET ==1'b1)
            begin 
               P2_P1_P2_State2  = P2_P1_P2_Si ;
               P2_P1_P2_InstQueue  [0]=8'b0000_0000;
               P2_P1_P2_InstQueue  [1]=8'b0000_0000;
               P2_P1_P2_InstQueue  [2]=8'b0000_0000;
               P2_P1_P2_InstQueue  [3]=8'b0000_0000;
               P2_P1_P2_InstQueue  [4]=8'b0000_0000;
               P2_P1_P2_InstQueue  [5]=8'b0000_0000;
               P2_P1_P2_InstQueue  [6]=8'b0000_0000;
               P2_P1_P2_InstQueue  [7]=8'b0000_0000;
               P2_P1_P2_InstQueue  [8]=8'b0000_0000;
               P2_P1_P2_InstQueue  [9]=8'b0000_0000;
               P2_P1_P2_InstQueue  [10]=8'b0000_0000;
               P2_P1_P2_InstQueue  [11]=8'b0000_0000;
               P2_P1_P2_InstQueue  [12]=8'b0000_0000;
               P2_P1_P2_InstQueue  [13]=8'b0000_0000;
               P2_P1_P2_InstQueue  [14]=8'b0000_0000;
               P2_P1_P2_InstQueue  [15]=8'b0000_0000;
               P2_P1_P2_InstQueueRd_Addr  =0;
               P2_P1_P2_InstQueueWr_Addr  =0;
               P2_P1_P2_InstAddrPointer  =0;
               P2_P1_P2_PhyAddrPointer  =0;
               P2_P1_P2_Extended  =1'b0;
               P2_P1_P2_More  =1'b0;
               P2_P1_P2_Flush  =1'b0;
               P2_P1_P2_lWord  =0;
               P2_P1_P2_uWord  =0;
               P2_P1_P2_fWord  =0;
               P2_P1_P2_CodeFetch  <=1'b0;
               P2_P1_P2_Datao  <=0;
               P2_P1_P2_EAX  <=0;
               P2_P1_P2_EBX  <=0;
               P2_P1_P2_rEIP  <=0;
               P2_P1_P2_ReadRequest  <=1'b0;
               P2_P1_P2_MemoryFetch  <=1'b0;
               P2_P1_P2_RequestPending  <=1'b0;
            end 
          else 
            case ( P2_P1_P2_State2 )
              P2_P1_P2_Si  :
                begin 
                   P2_P1_P2_PhyAddrPointer  = P2_P1_P2_rEIP ;
                   P2_P1_P2_InstAddrPointer  = P2_P1_P2_PhyAddrPointer ;
                   P2_P1_P2_State2  = P2_P1_P2_S1 ;
                   P2_P1_P2_rEIP  <=20'hFFFF0;
                   P2_P1_P2_ReadRequest  <=1'b1;
                   P2_P1_P2_MemoryFetch  <=1'b1;
                   P2_P1_P2_RequestPending  <=1'b1;
                end 
              P2_P1_P2_S1  :
                begin 
                   P2_P1_P2_RequestPending  <= P2_P1_P2_Pending ;
                   P2_P1_P2_ReadRequest  <= P2_P1_P2_Pending ;
                   P2_P1_P2_MemoryFetch  <= P2_P1_P2_Pending ;
                   P2_P1_P2_CodeFetch  <= P2_P1_P2_Pending ;
                  if ( P2_P1_P2_READY_n ==1'b0)
                      P2_P1_P2_State2  = P2_P1_P2_S2 ;
                   else 
                      P2_P1_P2_State2  = P2_P1_P2_S1 ;
                end 
              P2_P1_P2_S2  :
                begin 
                   P2_P1_P2_RequestPending  <= P2_P1_P2_NotPending ;
                   P2_P1_P2_InstQueue  [ P2_P1_P2_InstQueueWr_Addr ]= P2_P1_P2_Datai %(2**8);
                   P2_P1_P2_InstQueueWr_Addr  =( P2_P1_P2_InstQueueWr_Addr +1)%16;
                   P2_P1_P2_InstQueue  [ P2_P1_P2_InstQueueWr_Addr ]= P2_P1_P2_Datai %2**8;
                   P2_P1_P2_InstQueueWr_Addr  =( P2_P1_P2_InstQueueWr_Addr +1)%16;
                  if ( P2_P1_P2_StateBS16 ==1'b1)
                     begin 
                        P2_P1_P2_InstQueue  [ P2_P1_P2_InstQueueWr_Addr ]=( P2_P1_P2_Datai /(2**16))%(2**8);
                        P2_P1_P2_InstQueueWr_Addr  =( P2_P1_P2_InstQueueWr_Addr +1)%16;
                        P2_P1_P2_InstQueue  [ P2_P1_P2_InstQueueWr_Addr ]=( P2_P1_P2_Datai /(2**24))%(2**8);
                        P2_P1_P2_InstQueueWr_Addr  =( P2_P1_P2_InstQueueWr_Addr +1)%16;
                        P2_P1_P2_PhyAddrPointer  = P2_P1_P2_PhyAddrPointer +4;
                        P2_P1_P2_State2  = P2_P1_P2_S5 ;
                     end 
                   else 
                     begin 
                        P2_P1_P2_PhyAddrPointer  = P2_P1_P2_PhyAddrPointer +2;
                       if ( P2_P1_P2_PhyAddrPointer <0)
                           P2_P1_P2_rEIP  <=- P2_P1_P2_PhyAddrPointer ;
                        else 
                           P2_P1_P2_rEIP  <= P2_P1_P2_PhyAddrPointer ;
                        P2_P1_P2_State2  = P2_P1_P2_S3 ;
                     end 
                end 
              P2_P1_P2_S3  :
                begin 
                   P2_P1_P2_RequestPending  <= P2_P1_P2_Pending ;
                  if ( P2_P1_P2_READY_n ==1'b0)
                      P2_P1_P2_State2  = P2_P1_P2_S4 ;
                   else 
                      P2_P1_P2_State2  = P2_P1_P2_S3 ;
                end 
              P2_P1_P2_S4  :
                begin 
                   P2_P1_P2_RequestPending  <= P2_P1_P2_NotPending ;
                   P2_P1_P2_InstQueue  [ P2_P1_P2_InstQueueWr_Addr ]= P2_P1_P2_Datai %(2**8);
                   P2_P1_P2_InstQueueWr_Addr  =( P2_P1_P2_InstQueueWr_Addr +1)%16;
                   P2_P1_P2_InstQueue  [ P2_P1_P2_InstQueueWr_Addr ]= P2_P1_P2_Datai %(2**8);
                   P2_P1_P2_InstQueueWr_Addr  =( P2_P1_P2_InstQueueWr_Addr +1)%16;
                   P2_P1_P2_PhyAddrPointer  = P2_P1_P2_PhyAddrPointer +2;
                   P2_P1_P2_State2  = P2_P1_P2_S5 ;
                end 
              P2_P1_P2_S5  :
                begin 
                  case ( P2_P1_P2_InstQueue [ P2_P1_P2_InstQueueRd_Addr ])
                    P2_P1_P2_NOP  :
                      begin 
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +1;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +1)%16;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                    P2_P1_P2_OPsop  :
                      begin 
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +1;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +1)%16;
                         P2_P1_P2_Extended  =1'b1;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                    P2_P1_P2_JMP_rel_short  :
                      if (( P2_P1_P2_InstQueueWr_Addr - P2_P1_P2_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P2_P1_P2_PhyAddrPointer  = P2_P1_P2_InstAddrPointer +1-(8'hFF- P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +1)%16]);
                                 P2_P1_P2_InstAddrPointer  = P2_P1_P2_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P2_P1_P2_PhyAddrPointer  = P2_P1_P2_InstAddrPointer +2+ P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +1)%16];
                                 P2_P1_P2_InstAddrPointer  = P2_P1_P2_PhyAddrPointer ;
                              end 
                            P2_P1_P2_Flush  =1'b1;
                            P2_P1_P2_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P1_P2_Flush  =1'b0;
                            P2_P1_P2_More  =1'b1;
                         end 
                    P2_P1_P2_JMP_rel_near  :
                      if (( P2_P1_P2_InstQueueWr_Addr - P2_P1_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P1_P2_PhyAddrPointer  = P2_P1_P2_InstAddrPointer +5+ P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +1)%16];
                            P2_P1_P2_InstAddrPointer  = P2_P1_P2_PhyAddrPointer ;
                            P2_P1_P2_Flush  =1'b1;
                            P2_P1_P2_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P1_P2_Flush  =1'b0;
                            P2_P1_P2_More  =1'b1;
                         end 
                    P2_P1_P2_JMP_intseg_immed  :
                      begin 
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +1;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +1)%16;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                    P2_P1_P2_MOV_al_b  :
                      begin 
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +1;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +1)%16;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                    P2_P1_P2_MOV_eax_dw  :
                      if (( P2_P1_P2_InstQueueWr_Addr - P2_P1_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P1_P2_EAX  <= P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +1)%16];
                            P2_P1_P2_More  =1'b0;
                            P2_P1_P2_Flush  =1'b0;
                            P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +5;
                            P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P1_P2_Flush  =1'b0;
                            P2_P1_P2_More  =1'b1;
                         end 
                    P2_P1_P2_MOV_ebx_dw  :
                      if (( P2_P1_P2_InstQueueWr_Addr - P2_P1_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P1_P2_EBX  <= P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P1_P2_InstQueue [( P2_P1_P2_InstQueueRd_Addr +1)%1];
                            P2_P1_P2_More  =1'b0;
                            P2_P1_P2_Flush  =1'b0;
                            P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +5;
                            P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P1_P2_Flush  =1'b0;
                            P2_P1_P2_More  =1'b1;
                         end 
                    P2_P1_P2_MOV_eax_ebx  :
                      if (( P2_P1_P2_InstQueueWr_Addr - P2_P1_P2_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P1_P2_EBX <0)
                               P2_P1_P2_rEIP  <=- P2_P1_P2_EBX ;
                            else 
                               P2_P1_P2_rEIP  <= P2_P1_P2_EBX ;
                            P2_P1_P2_RequestPending  <= P2_P1_P2_Pending ;
                            P2_P1_P2_ReadRequest  <= P2_P1_P2_Pending ;
                            P2_P1_P2_MemoryFetch  <= P2_P1_P2_Pending ;
                            P2_P1_P2_CodeFetch  <= P2_P1_P2_NotPending ;
                           if ( P2_P1_P2_READY_n ==1'b0)
                              begin 
                                 P2_P1_P2_RequestPending  <= P2_P1_P2_NotPending ;
                                 P2_P1_P2_uWord  = P2_P1_P2_Datai %(2**15);
                                if ( P2_P1_P2_StateBS16 ==1'b1)
                                    P2_P1_P2_lWord  = P2_P1_P2_Datai %(2**16);
                                 else 
                                   begin 
                                      P2_P1_P2_rEIP  <= P2_P1_P2_rEIP +2;
                                      P2_P1_P2_RequestPending  <= P2_P1_P2_Pending ;
                                     if ( P2_P1_P2_READY_n ==1'b0)
                                        begin 
                                           P2_P1_P2_RequestPending  <= P2_P1_P2_NotPending ;
                                           P2_P1_P2_lWord  = P2_P1_P2_Datai %(2**16);
                                        end 
                                   end 
                                if ( P2_P1_P2_READY_n ==1'b0)
                                   begin 
                                      P2_P1_P2_EAX  <= P2_P1_P2_uWord *(2**16)+ P2_P1_P2_lWord ;
                                      P2_P1_P2_More  =1'b0;
                                      P2_P1_P2_Flush  =1'b0;
                                      P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +2;
                                      P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P2_Flush  =1'b0;
                            P2_P1_P2_More  =1'b1;
                         end 
                    P2_P1_P2_MOV_ebx_eax  :
                      if (( P2_P1_P2_InstQueueWr_Addr - P2_P1_P2_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P1_P2_EBX <0)
                               P2_P1_P2_rEIP  <= P2_P1_P2_EBX ;
                            else 
                               P2_P1_P2_rEIP  <= P2_P1_P2_EBX ;
                            P2_P1_P2_lWord  = P2_P1_P2_EAX %(2**16);
                            P2_P1_P2_uWord  =( P2_P1_P2_EAX /(2**16))%(2**15);
                            P2_P1_P2_RequestPending  <= P2_P1_P2_Pending ;
                            P2_P1_P2_ReadRequest  <= P2_P1_P2_NotPending ;
                            P2_P1_P2_MemoryFetch  <= P2_P1_P2_Pending ;
                            P2_P1_P2_CodeFetch  <= P2_P1_P2_NotPending ;
                           if ( P2_P1_P2_State == P2_P1_P2_StateT1 | P2_P1_P2_State == P2_P1_P2_StateT1P )
                              begin 
                                 P2_P1_P2_Datao  <=( P2_P1_P2_uWord *(2**16)+ P2_P1_P2_lWord );
                                if ( P2_P1_P2_READY_n ==1'b0)
                                   begin 
                                      P2_P1_P2_RequestPending  <= P2_P1_P2_NotPending ;
                                     if ( P2_P1_P2_StateBS16 ==1'b0)
                                        begin 
                                           P2_P1_P2_rEIP  <= P2_P1_P2_rEIP +2;
                                           P2_P1_P2_RequestPending  <= P2_P1_P2_Pending ;
                                           P2_P1_P2_ReadRequest  <= P2_P1_P2_NotPending ;
                                           P2_P1_P2_MemoryFetch  <= P2_P1_P2_Pending ;
                                           P2_P1_P2_CodeFetch  <= P2_P1_P2_NotPending ;
                                           P2_P1_P2_State2  = P2_P1_P2_S6 ;
                                        end 
                                      P2_P1_P2_More  =1'b0;
                                      P2_P1_P2_Flush  =1'b0;
                                      P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +2;
                                      P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P2_Flush  =1'b0;
                            P2_P1_P2_More  =1'b1;
                         end 
                    P2_P1_P2_IN_al  :
                      if (( P2_P1_P2_InstQueueWr_Addr - P2_P1_P2_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P1_P2_rEIP  <= P2_P1_P2_InstQueueRd_Addr +1;
                            P2_P1_P2_RequestPending  <= P2_P1_P2_Pending ;
                            P2_P1_P2_ReadRequest  <= P2_P1_P2_Pending ;
                            P2_P1_P2_MemoryFetch  <= P2_P1_P2_NotPending ;
                            P2_P1_P2_CodeFetch  <= P2_P1_P2_NotPending ;
                           if ( P2_P1_P2_READY_n ==1'b0)
                              begin 
                                 P2_P1_P2_RequestPending  <= P2_P1_P2_NotPending ;
                                 P2_P1_P2_EAX  <= P2_P1_P2_Datai ;
                                 P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +2;
                                 P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +2);
                                 P2_P1_P2_Flush  =1'b0;
                                 P2_P1_P2_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P2_Flush  =1'b0;
                            P2_P1_P2_More  =1'b1;
                         end 
                    P2_P1_P2_OUT_al  :
                      if (( P2_P1_P2_InstQueueWr_Addr - P2_P1_P2_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P1_P2_rEIP  <= P2_P1_P2_InstQueueRd_Addr +1;
                            P2_P1_P2_RequestPending  <= P2_P1_P2_Pending ;
                            P2_P1_P2_ReadRequest  <= P2_P1_P2_NotPending ;
                            P2_P1_P2_MemoryFetch  <= P2_P1_P2_NotPending ;
                            P2_P1_P2_CodeFetch  <= P2_P1_P2_NotPending ;
                           if ( P2_P1_P2_State == P2_P1_P2_StateT1 | P2_P1_P2_State == P2_P1_P2_StateT1P )
                              begin 
                                 P2_P1_P2_fWord  = P2_P1_P2_EAX %(2**16);
                                 P2_P1_P2_Datao  <= P2_P1_P2_fWord ;
                                if ( P2_P1_P2_READY_n ==1'b0)
                                   begin 
                                      P2_P1_P2_RequestPending  <= P2_P1_P2_NotPending ;
                                      P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +2;
                                      P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +2)%16;
                                      P2_P1_P2_Flush  =1'b0;
                                      P2_P1_P2_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P2_Flush  =1'b0;
                            P2_P1_P2_More  =1'b1;
                         end 
                    P2_P1_P2_ADD_al_b  :
                      begin 
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +1;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +1)%16;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                    P2_P1_P2_ADD_ax_w  :
                      begin 
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +1;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +1)%16;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                    P2_P1_P2_ROL_al_1  :
                      begin 
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +2;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +2)%16;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                    P2_P1_P2_ROL_al_n  :
                      begin 
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +2;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +2)%16;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                    P2_P1_P2_INC_eax  :
                      begin 
                         P2_P1_P2_EAX  <= P2_P1_P2_EAX +1;
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +1;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +1)%16;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                    P2_P1_P2_INC_ebx  :
                      begin 
                         P2_P1_P2_EBX  <= P2_P1_P2_EBX +1;
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +1;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +1)%16;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                   default :
                      begin 
                         P2_P1_P2_InstAddrPointer  = P2_P1_P2_InstAddrPointer +1;
                         P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +1)%16;
                         P2_P1_P2_Flush  =1'b0;
                         P2_P1_P2_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P2_P1_P2_InstQueueRd_Addr < P2_P1_P2_InstQueueWr_Addr ))|((( P2_P1_P2_InstQueueLimit - P2_P1_P2_InstQueueRd_Addr )<4)| P2_P1_P2_Flush | P2_P1_P2_More ))
                      P2_P1_P2_State2  = P2_P1_P2_S7 ;
                end 
              P2_P1_P2_S6  :
                begin 
                   P2_P1_P2_Datao  <=( P2_P1_P2_uWord *(2**16)+ P2_P1_P2_lWord );
                  if ( P2_P1_P2_READY_n ==1'b0)
                     begin 
                        P2_P1_P2_RequestPending  <= P2_P1_P2_NotPending ;
                        P2_P1_P2_State2  = P2_P1_P2_S5 ;
                     end 
                end 
              P2_P1_P2_S7  :
                begin 
                  if ( P2_P1_P2_Flush )
                     begin 
                        P2_P1_P2_InstQueueRd_Addr  =1;
                        P2_P1_P2_InstQueueWr_Addr  =1;
                       if ( P2_P1_P2_InstAddrPointer <0)
                           P2_P1_P2_fWord  =- P2_P1_P2_InstAddrPointer ;
                        else 
                           P2_P1_P2_fWord  = P2_P1_P2_InstAddrPointer ;
                       if ( P2_P1_P2_fWord %2==1)
                           P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr + P2_P1_P2_fWord %4)%16;
                     end 
                  if (( P2_P1_P2_InstQueueLimit - P2_P1_P2_InstQueueRd_Addr )<3)
                     begin 
                        P2_P1_P2_State2  = P2_P1_P2_S8 ;
                        P2_P1_P2_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P2_P1_P2_State2  = P2_P1_P2_S9 ;
                end 
              P2_P1_P2_S8  :
                if ( P2_P1_P2_InstQueueRd_Addr <= P2_P1_P2_InstQueueLimit )
                   begin 
                      P2_P1_P2_InstQueue  [ P2_P1_P2_InstQueueWr_Addr ]= P2_P1_P2_InstQueue [ P2_P1_P2_InstQueueRd_Addr ];
                      P2_P1_P2_InstQueueRd_Addr  =( P2_P1_P2_InstQueueRd_Addr +1)%16;
                      P2_P1_P2_InstQueueWr_Addr  =( P2_P1_P2_InstQueueWr_Addr +1)%16;
                      P2_P1_P2_State2  = P2_P1_P2_S8 ;
                   end 
                 else 
                   begin 
                      P2_P1_P2_InstQueueRd_Addr  =0;
                      P2_P1_P2_State2  = P2_P1_P2_S9 ;
                   end 
              P2_P1_P2_S9  :
                begin 
                   P2_P1_P2_rEIP  <= P2_P1_P2_PhyAddrPointer ;
                   P2_P1_P2_State2  = P2_P1_P2_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P2_P1_P2_CLOCK or posedge  P2_P1_P2_RESET )
       begin 
         if ( P2_P1_P2_RESET ==1'b1)
            begin 
               P2_P1_P2_ByteEnable  <=4'b0000;
               P2_P1_P2_NonAligned  <=1'b0;
            end 
          else 
            case ( P2_P1_P2_DataWidth )
              P2_P1_P2_WidthByte  :
                case ( P2_P1_P2_rEIP %4)
                 0 :
                     P2_P1_P2_ByteEnable  <=4'b1110;
                 1 :
                     P2_P1_P2_ByteEnable  <=4'b1101;
                 2 :
                     P2_P1_P2_ByteEnable  <=4'b1011;
                 3 :
                     P2_P1_P2_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P2_P1_P2_WidthWord  :
                case ( P2_P1_P2_rEIP %4)
                 0 :
                    begin 
                       P2_P1_P2_ByteEnable  <=4'b1100;
                       P2_P1_P2_NonAligned  <= P2_P1_P2_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P1_P2_ByteEnable  <=4'b1001;
                       P2_P1_P2_NonAligned  <= P2_P1_P2_NotPending ;
                    end 
                 2 :
                    begin 
                       P2_P1_P2_ByteEnable  <=4'b0011;
                       P2_P1_P2_NonAligned  <= P2_P1_P2_NotPending ;
                    end 
                 3 :
                    begin 
                       P2_P1_P2_ByteEnable  <=4'b0111;
                       P2_P1_P2_NonAligned  <= P2_P1_P2_Pending ;
                    end 
                 default :;
                endcase 
              P2_P1_P2_WidthDword  :
                case ( P2_P1_P2_rEIP %4)
                 0 :
                    begin 
                       P2_P1_P2_ByteEnable  <=4'b0000;
                       P2_P1_P2_NonAligned  <= P2_P1_P2_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P1_P2_ByteEnable  <=4'b0001;
                       P2_P1_P2_NonAligned  <= P2_P1_P2_Pending ;
                    end 
                 2 :
                    begin 
                       P2_P1_P2_NonAligned  <= P2_P1_P2_Pending ;
                       P2_P1_P2_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P2_P1_P2_NonAligned  <= P2_P1_P2_Pending ;
                       P2_P1_P2_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
 
   reg P2_P1_P3_StateNA ; 
   reg P2_P1_P3_StateBS16 ; 
   reg P2_P1_P3_RequestPending ; 
 parameter P2_P1_P3_Pending =1'b1; 
 parameter P2_P1_P3_NotPending =1'b0; 
   reg P2_P1_P3_NonAligned ; 
   reg P2_P1_P3_ReadRequest ; 
   reg P2_P1_P3_MemoryFetch ; 
   reg P2_P1_P3_CodeFetch ; 
   reg[3:0] P2_P1_P3_ByteEnable ; 
   integer P2_P1_P3_DataWidth ; 
 parameter P2_P1_P3_WidthByte =0; 
 parameter P2_P1_P3_WidthWord =1; 
 parameter P2_P1_P3_WidthDword =2; 
   reg[2:0] P2_P1_P3_State ; 
 parameter P2_P1_P3_StateInit =0; 
 parameter P2_P1_P3_StateTi =1; 
 parameter P2_P1_P3_StateT1 =2; 
 parameter P2_P1_P3_StateT2 =3; 
 parameter P2_P1_P3_StateT1P =4; 
 parameter P2_P1_P3_StateTh =5; 
 parameter P2_P1_P3_StateT2P =6; 
 parameter P2_P1_P3_StateT2I =7; 
   integer P2_P1_P3_EAX ; 
   integer P2_P1_P3_EBX ; 
   integer P2_P1_P3_rEIP ; 
 parameter P2_P1_P3_REP =8'hF3; 
 parameter P2_P1_P3_REPNE =8'hF2; 
 parameter P2_P1_P3_LOCK =8'hF0; 
 parameter P2_P1_P3_CSsop =8'h2E; 
 parameter P2_P1_P3_SSsop =8'h36; 
 parameter P2_P1_P3_DSsop =8'h3E; 
 parameter P2_P1_P3_ESsop =8'h26; 
 parameter P2_P1_P3_FSsop =8'h64; 
 parameter P2_P1_P3_GSsop =8'h65; 
 parameter P2_P1_P3_OPsop =8'h66; 
 parameter P2_P1_P3_ADsop =8'h67; 
 parameter P2_P1_P3_MOV_al_b =8'hB0; 
 parameter P2_P1_P3_MOV_eax_dw =8'hB8; 
 parameter P2_P1_P3_MOV_ebx_dw =8'hBB; 
 parameter P2_P1_P3_MOV_ebx_eax =8'h89; 
 parameter P2_P1_P3_MOV_eax_ebx =8'h8B; 
 parameter P2_P1_P3_IN_al =8'hE4; 
 parameter P2_P1_P3_OUT_al =8'hE6; 
 parameter P2_P1_P3_ADD_al_b =8'h04; 
 parameter P2_P1_P3_ADD_ax_w =8'h05; 
 parameter P2_P1_P3_ROL_eax_b =8'hD1; 
 parameter P2_P1_P3_ROL_al_1 =8'hD0; 
 parameter P2_P1_P3_ROL_al_n =8'hC0; 
 parameter P2_P1_P3_INC_eax =8'h40; 
 parameter P2_P1_P3_INC_ebx =8'h43; 
 parameter P2_P1_P3_JMP_rel_short =8'hEB; 
 parameter P2_P1_P3_JMP_rel_near =8'hE9; 
 parameter P2_P1_P3_JMP_intseg_immed =8'hEA; 
 parameter P2_P1_P3_HLT =8'hF4; 
 parameter P2_P1_P3_WAITx =8'h9B; 
 parameter P2_P1_P3_NOP =8'h90; 
   reg[7:0] P2_P1_P3_InstQueue [15:0]; 
   reg[4:0] P2_P1_P3_InstQueueRd_Addr ; 
   reg[4:0] P2_P1_P3_InstQueueWr_Addr ; 
 parameter P2_P1_P3_InstQueueLimit =15; 
   integer P2_P1_P3_InstAddrPointer ; 
   integer P2_P1_P3_PhyAddrPointer ; 
   reg P2_P1_P3_Extended ; 
   reg P2_P1_P3_More ; 
   reg P2_P1_P3_Flush ; 
   reg[15:0] P2_P1_P3_lWord ; 
   reg[14:0] P2_P1_P3_uWord ; 
   integer P2_P1_P3_fWord ; 
   reg[3:0] P2_P1_P3_State2 ; 
 parameter P2_P1_P3_Si =0; 
 parameter P2_P1_P3_S1 =1; 
 parameter P2_P1_P3_S2 =2; 
 parameter P2_P1_P3_S3 =3; 
 parameter P2_P1_P3_S4 =4; 
 parameter P2_P1_P3_S5 =5; 
 parameter P2_P1_P3_S6 =6; 
 parameter P2_P1_P3_S7 =7; 
 parameter P2_P1_P3_S8 =8; 
 parameter P2_P1_P3_S9 =9; 
  always @(  posedge   P2_P1_P3_CLOCK or posedge  P2_P1_P3_RESET )
       begin 
         if ( P2_P1_P3_RESET ==1'b1)
            begin 
               P2_P1_P3_BE_n  <=4'b0000;
               P2_P1_P3_Address  <=0;
               P2_P1_P3_W_R_n  <=1'b0;
               P2_P1_P3_D_C_n  <=1'b0;
               P2_P1_P3_M_IO_n  <=1'b0;
               P2_P1_P3_ADS_n  <=1'b0;
               P2_P1_P3_State  <= P2_P1_P3_StateInit ;
               P2_P1_P3_StateNA  <=1'b0;
               P2_P1_P3_StateBS16  <=1'b0;
               P2_P1_P3_DataWidth  <=0;
            end 
          else 
            case ( P2_P1_P3_State )
              P2_P1_P3_StateInit  :
                begin 
                   P2_P1_P3_D_C_n  <=1'b1;
                   P2_P1_P3_ADS_n  <=1'b1;
                   P2_P1_P3_State  <= P2_P1_P3_StateTi ;
                   P2_P1_P3_StateNA  <=1'b1;
                   P2_P1_P3_StateBS16  <=1'b1;
                   P2_P1_P3_DataWidth  <=2;
                   P2_P1_P3_State  <= P2_P1_P3_StateTi ;
                end 
              P2_P1_P3_StateTi  :
                if ( P2_P1_P3_RequestPending == P2_P1_P3_Pending )
                    P2_P1_P3_State  <= P2_P1_P3_StateT1 ;
                 else 
                   if ( P2_P1_P3_HOLD ==1'b1)
                       P2_P1_P3_State  <= P2_P1_P3_StateTh ;
                    else 
                       P2_P1_P3_State  <= P2_P1_P3_StateTi ;
              P2_P1_P3_StateT1  :
                begin 
                   P2_P1_P3_Address  <= P2_P1_P3_rEIP /4%2**30;
                   P2_P1_P3_BE_n  <= P2_P1_P3_ByteEnable ;
                   P2_P1_P3_M_IO_n  <= P2_P1_P3_MemoryFetch ;
                  if ( P2_P1_P3_ReadRequest == P2_P1_P3_Pending )
                      P2_P1_P3_W_R_n  <=1'b0;
                   else 
                      P2_P1_P3_W_R_n  <=1'b1;
                  if ( P2_P1_P3_CodeFetch == P2_P1_P3_Pending )
                      P2_P1_P3_D_C_n  <=1'b0;
                   else 
                      P2_P1_P3_D_C_n  <=1'b1;
                   P2_P1_P3_ADS_n  <=1'b0;
                   P2_P1_P3_State  <= P2_P1_P3_StateT2 ;
                end 
              P2_P1_P3_StateT2  :
                begin 
                  if ( P2_P1_P3_READY_n ==1'b0& P2_P1_P3_HOLD ==1'b0& P2_P1_P3_RequestPending == P2_P1_P3_Pending )
                      P2_P1_P3_State  <= P2_P1_P3_StateT1 ;
                   else 
                     if ( P2_P1_P3_READY_n ==1'b1& P2_P1_P3_NA_n ==1'b1);
                      else 
                        if (( P2_P1_P3_RequestPending == P2_P1_P3_Pending | P2_P1_P3_HOLD ==1'b1)&( P2_P1_P3_READY_n ==1'b1& P2_P1_P3_NA_n ==1'b0))
                            P2_P1_P3_State  <= P2_P1_P3_StateT2I ;
                         else 
                           if ( P2_P1_P3_RequestPending == P2_P1_P3_Pending & P2_P1_P3_HOLD ==1'b0& P2_P1_P3_READY_n ==1'b1& P2_P1_P3_NA_n ==1'b0)
                               P2_P1_P3_State  <= P2_P1_P3_StateT2P ;
                            else 
                              if ( P2_P1_P3_RequestPending == P2_P1_P3_NotPending & P2_P1_P3_HOLD ==1'b0& P2_P1_P3_READY_n ==1'b0)
                                  P2_P1_P3_State  <= P2_P1_P3_StateTi ;
                               else 
                                 if ( P2_P1_P3_HOLD ==1'b1& P2_P1_P3_READY_n ==1'b1)
                                     P2_P1_P3_State  <= P2_P1_P3_StateTh ;
                                  else 
                                     P2_P1_P3_State  <= P2_P1_P3_StateT2 ;
                   P2_P1_P3_StateBS16  <= P2_P1_P3_BS16_n ;
                  if ( P2_P1_P3_BS16_n ==1'b0)
                      P2_P1_P3_DataWidth  <= P2_P1_P3_WidthWord ;
                   else 
                      P2_P1_P3_DataWidth  <= P2_P1_P3_WidthDword ;
                   P2_P1_P3_StateNA  <= P2_P1_P3_NA_n ;
                   P2_P1_P3_ADS_n  <=1'b1;
                end 
              P2_P1_P3_StateT1P  :
                begin 
                  if ( P2_P1_P3_NA_n ==1'b0& P2_P1_P3_HOLD ==1'b0& P2_P1_P3_RequestPending == P2_P1_P3_Pending )
                      P2_P1_P3_State  <= P2_P1_P3_StateT2P ;
                   else 
                     if ( P2_P1_P3_NA_n ==1'b0&( P2_P1_P3_HOLD ==1'b1| P2_P1_P3_RequestPending == P2_P1_P3_NotPending ))
                         P2_P1_P3_State  <= P2_P1_P3_StateT2I ;
                      else 
                        if ( P2_P1_P3_NA_n ==1'b1)
                            P2_P1_P3_State  <= P2_P1_P3_StateT2 ;
                         else 
                            P2_P1_P3_State  <= P2_P1_P3_StateT1P ;
                   P2_P1_P3_StateBS16  <= P2_P1_P3_BS16_n ;
                  if ( P2_P1_P3_BS16_n ==1'b0)
                      P2_P1_P3_DataWidth  <= P2_P1_P3_WidthWord ;
                   else 
                      P2_P1_P3_DataWidth  <= P2_P1_P3_WidthDword ;
                   P2_P1_P3_StateNA  <= P2_P1_P3_NA_n ;
                   P2_P1_P3_ADS_n  <=1'b1;
                end 
              P2_P1_P3_StateTh  :
                if ( P2_P1_P3_HOLD ==1'b0& P2_P1_P3_RequestPending == P2_P1_P3_Pending )
                    P2_P1_P3_State  <= P2_P1_P3_StateT1 ;
                 else 
                   if ( P2_P1_P3_HOLD ==1'b0& P2_P1_P3_RequestPending == P2_P1_P3_NotPending )
                       P2_P1_P3_State  <= P2_P1_P3_StateTi ;
                    else 
                       P2_P1_P3_State  <= P2_P1_P3_StateTh ;
              P2_P1_P3_StateT2P  :
                begin 
                   P2_P1_P3_Address  <= P2_P1_P3_rEIP /2%2**30;
                   P2_P1_P3_BE_n  <= P2_P1_P3_ByteEnable ;
                   P2_P1_P3_M_IO_n  <= P2_P1_P3_MemoryFetch ;
                  if ( P2_P1_P3_ReadRequest == P2_P1_P3_Pending )
                      P2_P1_P3_W_R_n  <=1'b0;
                   else 
                      P2_P1_P3_W_R_n  <=1'b1;
                  if ( P2_P1_P3_CodeFetch == P2_P1_P3_Pending )
                      P2_P1_P3_D_C_n  <=1'b0;
                   else 
                      P2_P1_P3_D_C_n  <=1'b1;
                   P2_P1_P3_ADS_n  <=1'b0;
                  if ( P2_P1_P3_READY_n ==1'b0)
                      P2_P1_P3_State  <= P2_P1_P3_StateT1P ;
                   else 
                      P2_P1_P3_State  <= P2_P1_P3_StateT2P ;
                end 
              P2_P1_P3_StateT2I  :
                if ( P2_P1_P3_READY_n ==1'b1& P2_P1_P3_RequestPending == P2_P1_P3_Pending & P2_P1_P3_HOLD ==1'b0)
                    P2_P1_P3_State  <= P2_P1_P3_StateT2P ;
                 else 
                   if ( P2_P1_P3_READY_n ==1'b0& P2_P1_P3_HOLD ==1'b1)
                       P2_P1_P3_State  <= P2_P1_P3_StateTh ;
                    else 
                      if ( P2_P1_P3_READY_n ==1'b0& P2_P1_P3_HOLD ==1'b0& P2_P1_P3_RequestPending == P2_P1_P3_Pending )
                          P2_P1_P3_State  <= P2_P1_P3_StateT1 ;
                       else 
                         if ( P2_P1_P3_READY_n ==1'b0& P2_P1_P3_HOLD ==1'b0& P2_P1_P3_RequestPending == P2_P1_P3_NotPending )
                             P2_P1_P3_State  <= P2_P1_P3_StateTi ;
                          else 
                             P2_P1_P3_State  <= P2_P1_P3_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P2_P1_P3_CLOCK or posedge  P2_P1_P3_RESET )
       begin 
         if ( P2_P1_P3_RESET ==1'b1)
            begin 
               P2_P1_P3_State2  = P2_P1_P3_Si ;
               P2_P1_P3_InstQueue  [0]=8'b0000_0000;
               P2_P1_P3_InstQueue  [1]=8'b0000_0000;
               P2_P1_P3_InstQueue  [2]=8'b0000_0000;
               P2_P1_P3_InstQueue  [3]=8'b0000_0000;
               P2_P1_P3_InstQueue  [4]=8'b0000_0000;
               P2_P1_P3_InstQueue  [5]=8'b0000_0000;
               P2_P1_P3_InstQueue  [6]=8'b0000_0000;
               P2_P1_P3_InstQueue  [7]=8'b0000_0000;
               P2_P1_P3_InstQueue  [8]=8'b0000_0000;
               P2_P1_P3_InstQueue  [9]=8'b0000_0000;
               P2_P1_P3_InstQueue  [10]=8'b0000_0000;
               P2_P1_P3_InstQueue  [11]=8'b0000_0000;
               P2_P1_P3_InstQueue  [12]=8'b0000_0000;
               P2_P1_P3_InstQueue  [13]=8'b0000_0000;
               P2_P1_P3_InstQueue  [14]=8'b0000_0000;
               P2_P1_P3_InstQueue  [15]=8'b0000_0000;
               P2_P1_P3_InstQueueRd_Addr  =0;
               P2_P1_P3_InstQueueWr_Addr  =0;
               P2_P1_P3_InstAddrPointer  =0;
               P2_P1_P3_PhyAddrPointer  =0;
               P2_P1_P3_Extended  =1'b0;
               P2_P1_P3_More  =1'b0;
               P2_P1_P3_Flush  =1'b0;
               P2_P1_P3_lWord  =0;
               P2_P1_P3_uWord  =0;
               P2_P1_P3_fWord  =0;
               P2_P1_P3_CodeFetch  <=1'b0;
               P2_P1_P3_Datao  <=0;
               P2_P1_P3_EAX  <=0;
               P2_P1_P3_EBX  <=0;
               P2_P1_P3_rEIP  <=0;
               P2_P1_P3_ReadRequest  <=1'b0;
               P2_P1_P3_MemoryFetch  <=1'b0;
               P2_P1_P3_RequestPending  <=1'b0;
            end 
          else 
            case ( P2_P1_P3_State2 )
              P2_P1_P3_Si  :
                begin 
                   P2_P1_P3_PhyAddrPointer  = P2_P1_P3_rEIP ;
                   P2_P1_P3_InstAddrPointer  = P2_P1_P3_PhyAddrPointer ;
                   P2_P1_P3_State2  = P2_P1_P3_S1 ;
                   P2_P1_P3_rEIP  <=20'hFFFF0;
                   P2_P1_P3_ReadRequest  <=1'b1;
                   P2_P1_P3_MemoryFetch  <=1'b1;
                   P2_P1_P3_RequestPending  <=1'b1;
                end 
              P2_P1_P3_S1  :
                begin 
                   P2_P1_P3_RequestPending  <= P2_P1_P3_Pending ;
                   P2_P1_P3_ReadRequest  <= P2_P1_P3_Pending ;
                   P2_P1_P3_MemoryFetch  <= P2_P1_P3_Pending ;
                   P2_P1_P3_CodeFetch  <= P2_P1_P3_Pending ;
                  if ( P2_P1_P3_READY_n ==1'b0)
                      P2_P1_P3_State2  = P2_P1_P3_S2 ;
                   else 
                      P2_P1_P3_State2  = P2_P1_P3_S1 ;
                end 
              P2_P1_P3_S2  :
                begin 
                   P2_P1_P3_RequestPending  <= P2_P1_P3_NotPending ;
                   P2_P1_P3_InstQueue  [ P2_P1_P3_InstQueueWr_Addr ]= P2_P1_P3_Datai %(2**8);
                   P2_P1_P3_InstQueueWr_Addr  =( P2_P1_P3_InstQueueWr_Addr +1)%16;
                   P2_P1_P3_InstQueue  [ P2_P1_P3_InstQueueWr_Addr ]= P2_P1_P3_Datai %2**8;
                   P2_P1_P3_InstQueueWr_Addr  =( P2_P1_P3_InstQueueWr_Addr +1)%16;
                  if ( P2_P1_P3_StateBS16 ==1'b1)
                     begin 
                        P2_P1_P3_InstQueue  [ P2_P1_P3_InstQueueWr_Addr ]=( P2_P1_P3_Datai /(2**16))%(2**8);
                        P2_P1_P3_InstQueueWr_Addr  =( P2_P1_P3_InstQueueWr_Addr +1)%16;
                        P2_P1_P3_InstQueue  [ P2_P1_P3_InstQueueWr_Addr ]=( P2_P1_P3_Datai /(2**24))%(2**8);
                        P2_P1_P3_InstQueueWr_Addr  =( P2_P1_P3_InstQueueWr_Addr +1)%16;
                        P2_P1_P3_PhyAddrPointer  = P2_P1_P3_PhyAddrPointer +4;
                        P2_P1_P3_State2  = P2_P1_P3_S5 ;
                     end 
                   else 
                     begin 
                        P2_P1_P3_PhyAddrPointer  = P2_P1_P3_PhyAddrPointer +2;
                       if ( P2_P1_P3_PhyAddrPointer <0)
                           P2_P1_P3_rEIP  <=- P2_P1_P3_PhyAddrPointer ;
                        else 
                           P2_P1_P3_rEIP  <= P2_P1_P3_PhyAddrPointer ;
                        P2_P1_P3_State2  = P2_P1_P3_S3 ;
                     end 
                end 
              P2_P1_P3_S3  :
                begin 
                   P2_P1_P3_RequestPending  <= P2_P1_P3_Pending ;
                  if ( P2_P1_P3_READY_n ==1'b0)
                      P2_P1_P3_State2  = P2_P1_P3_S4 ;
                   else 
                      P2_P1_P3_State2  = P2_P1_P3_S3 ;
                end 
              P2_P1_P3_S4  :
                begin 
                   P2_P1_P3_RequestPending  <= P2_P1_P3_NotPending ;
                   P2_P1_P3_InstQueue  [ P2_P1_P3_InstQueueWr_Addr ]= P2_P1_P3_Datai %(2**8);
                   P2_P1_P3_InstQueueWr_Addr  =( P2_P1_P3_InstQueueWr_Addr +1)%16;
                   P2_P1_P3_InstQueue  [ P2_P1_P3_InstQueueWr_Addr ]= P2_P1_P3_Datai %(2**8);
                   P2_P1_P3_InstQueueWr_Addr  =( P2_P1_P3_InstQueueWr_Addr +1)%16;
                   P2_P1_P3_PhyAddrPointer  = P2_P1_P3_PhyAddrPointer +2;
                   P2_P1_P3_State2  = P2_P1_P3_S5 ;
                end 
              P2_P1_P3_S5  :
                begin 
                  case ( P2_P1_P3_InstQueue [ P2_P1_P3_InstQueueRd_Addr ])
                    P2_P1_P3_NOP  :
                      begin 
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +1;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +1)%16;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                    P2_P1_P3_OPsop  :
                      begin 
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +1;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +1)%16;
                         P2_P1_P3_Extended  =1'b1;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                    P2_P1_P3_JMP_rel_short  :
                      if (( P2_P1_P3_InstQueueWr_Addr - P2_P1_P3_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P2_P1_P3_PhyAddrPointer  = P2_P1_P3_InstAddrPointer +1-(8'hFF- P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +1)%16]);
                                 P2_P1_P3_InstAddrPointer  = P2_P1_P3_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P2_P1_P3_PhyAddrPointer  = P2_P1_P3_InstAddrPointer +2+ P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +1)%16];
                                 P2_P1_P3_InstAddrPointer  = P2_P1_P3_PhyAddrPointer ;
                              end 
                            P2_P1_P3_Flush  =1'b1;
                            P2_P1_P3_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P1_P3_Flush  =1'b0;
                            P2_P1_P3_More  =1'b1;
                         end 
                    P2_P1_P3_JMP_rel_near  :
                      if (( P2_P1_P3_InstQueueWr_Addr - P2_P1_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P1_P3_PhyAddrPointer  = P2_P1_P3_InstAddrPointer +5+ P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +1)%16];
                            P2_P1_P3_InstAddrPointer  = P2_P1_P3_PhyAddrPointer ;
                            P2_P1_P3_Flush  =1'b1;
                            P2_P1_P3_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P1_P3_Flush  =1'b0;
                            P2_P1_P3_More  =1'b1;
                         end 
                    P2_P1_P3_JMP_intseg_immed  :
                      begin 
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +1;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +1)%16;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                    P2_P1_P3_MOV_al_b  :
                      begin 
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +1;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +1)%16;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                    P2_P1_P3_MOV_eax_dw  :
                      if (( P2_P1_P3_InstQueueWr_Addr - P2_P1_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P1_P3_EAX  <= P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +1)%16];
                            P2_P1_P3_More  =1'b0;
                            P2_P1_P3_Flush  =1'b0;
                            P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +5;
                            P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P1_P3_Flush  =1'b0;
                            P2_P1_P3_More  =1'b1;
                         end 
                    P2_P1_P3_MOV_ebx_dw  :
                      if (( P2_P1_P3_InstQueueWr_Addr - P2_P1_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P1_P3_EBX  <= P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P1_P3_InstQueue [( P2_P1_P3_InstQueueRd_Addr +1)%1];
                            P2_P1_P3_More  =1'b0;
                            P2_P1_P3_Flush  =1'b0;
                            P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +5;
                            P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P1_P3_Flush  =1'b0;
                            P2_P1_P3_More  =1'b1;
                         end 
                    P2_P1_P3_MOV_eax_ebx  :
                      if (( P2_P1_P3_InstQueueWr_Addr - P2_P1_P3_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P1_P3_EBX <0)
                               P2_P1_P3_rEIP  <=- P2_P1_P3_EBX ;
                            else 
                               P2_P1_P3_rEIP  <= P2_P1_P3_EBX ;
                            P2_P1_P3_RequestPending  <= P2_P1_P3_Pending ;
                            P2_P1_P3_ReadRequest  <= P2_P1_P3_Pending ;
                            P2_P1_P3_MemoryFetch  <= P2_P1_P3_Pending ;
                            P2_P1_P3_CodeFetch  <= P2_P1_P3_NotPending ;
                           if ( P2_P1_P3_READY_n ==1'b0)
                              begin 
                                 P2_P1_P3_RequestPending  <= P2_P1_P3_NotPending ;
                                 P2_P1_P3_uWord  = P2_P1_P3_Datai %(2**15);
                                if ( P2_P1_P3_StateBS16 ==1'b1)
                                    P2_P1_P3_lWord  = P2_P1_P3_Datai %(2**16);
                                 else 
                                   begin 
                                      P2_P1_P3_rEIP  <= P2_P1_P3_rEIP +2;
                                      P2_P1_P3_RequestPending  <= P2_P1_P3_Pending ;
                                     if ( P2_P1_P3_READY_n ==1'b0)
                                        begin 
                                           P2_P1_P3_RequestPending  <= P2_P1_P3_NotPending ;
                                           P2_P1_P3_lWord  = P2_P1_P3_Datai %(2**16);
                                        end 
                                   end 
                                if ( P2_P1_P3_READY_n ==1'b0)
                                   begin 
                                      P2_P1_P3_EAX  <= P2_P1_P3_uWord *(2**16)+ P2_P1_P3_lWord ;
                                      P2_P1_P3_More  =1'b0;
                                      P2_P1_P3_Flush  =1'b0;
                                      P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +2;
                                      P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P3_Flush  =1'b0;
                            P2_P1_P3_More  =1'b1;
                         end 
                    P2_P1_P3_MOV_ebx_eax  :
                      if (( P2_P1_P3_InstQueueWr_Addr - P2_P1_P3_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P1_P3_EBX <0)
                               P2_P1_P3_rEIP  <= P2_P1_P3_EBX ;
                            else 
                               P2_P1_P3_rEIP  <= P2_P1_P3_EBX ;
                            P2_P1_P3_lWord  = P2_P1_P3_EAX %(2**16);
                            P2_P1_P3_uWord  =( P2_P1_P3_EAX /(2**16))%(2**15);
                            P2_P1_P3_RequestPending  <= P2_P1_P3_Pending ;
                            P2_P1_P3_ReadRequest  <= P2_P1_P3_NotPending ;
                            P2_P1_P3_MemoryFetch  <= P2_P1_P3_Pending ;
                            P2_P1_P3_CodeFetch  <= P2_P1_P3_NotPending ;
                           if ( P2_P1_P3_State == P2_P1_P3_StateT1 | P2_P1_P3_State == P2_P1_P3_StateT1P )
                              begin 
                                 P2_P1_P3_Datao  <=( P2_P1_P3_uWord *(2**16)+ P2_P1_P3_lWord );
                                if ( P2_P1_P3_READY_n ==1'b0)
                                   begin 
                                      P2_P1_P3_RequestPending  <= P2_P1_P3_NotPending ;
                                     if ( P2_P1_P3_StateBS16 ==1'b0)
                                        begin 
                                           P2_P1_P3_rEIP  <= P2_P1_P3_rEIP +2;
                                           P2_P1_P3_RequestPending  <= P2_P1_P3_Pending ;
                                           P2_P1_P3_ReadRequest  <= P2_P1_P3_NotPending ;
                                           P2_P1_P3_MemoryFetch  <= P2_P1_P3_Pending ;
                                           P2_P1_P3_CodeFetch  <= P2_P1_P3_NotPending ;
                                           P2_P1_P3_State2  = P2_P1_P3_S6 ;
                                        end 
                                      P2_P1_P3_More  =1'b0;
                                      P2_P1_P3_Flush  =1'b0;
                                      P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +2;
                                      P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P3_Flush  =1'b0;
                            P2_P1_P3_More  =1'b1;
                         end 
                    P2_P1_P3_IN_al  :
                      if (( P2_P1_P3_InstQueueWr_Addr - P2_P1_P3_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P1_P3_rEIP  <= P2_P1_P3_InstQueueRd_Addr +1;
                            P2_P1_P3_RequestPending  <= P2_P1_P3_Pending ;
                            P2_P1_P3_ReadRequest  <= P2_P1_P3_Pending ;
                            P2_P1_P3_MemoryFetch  <= P2_P1_P3_NotPending ;
                            P2_P1_P3_CodeFetch  <= P2_P1_P3_NotPending ;
                           if ( P2_P1_P3_READY_n ==1'b0)
                              begin 
                                 P2_P1_P3_RequestPending  <= P2_P1_P3_NotPending ;
                                 P2_P1_P3_EAX  <= P2_P1_P3_Datai ;
                                 P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +2;
                                 P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +2);
                                 P2_P1_P3_Flush  =1'b0;
                                 P2_P1_P3_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P3_Flush  =1'b0;
                            P2_P1_P3_More  =1'b1;
                         end 
                    P2_P1_P3_OUT_al  :
                      if (( P2_P1_P3_InstQueueWr_Addr - P2_P1_P3_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P1_P3_rEIP  <= P2_P1_P3_InstQueueRd_Addr +1;
                            P2_P1_P3_RequestPending  <= P2_P1_P3_Pending ;
                            P2_P1_P3_ReadRequest  <= P2_P1_P3_NotPending ;
                            P2_P1_P3_MemoryFetch  <= P2_P1_P3_NotPending ;
                            P2_P1_P3_CodeFetch  <= P2_P1_P3_NotPending ;
                           if ( P2_P1_P3_State == P2_P1_P3_StateT1 | P2_P1_P3_State == P2_P1_P3_StateT1P )
                              begin 
                                 P2_P1_P3_fWord  = P2_P1_P3_EAX %(2**16);
                                 P2_P1_P3_Datao  <= P2_P1_P3_fWord ;
                                if ( P2_P1_P3_READY_n ==1'b0)
                                   begin 
                                      P2_P1_P3_RequestPending  <= P2_P1_P3_NotPending ;
                                      P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +2;
                                      P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +2)%16;
                                      P2_P1_P3_Flush  =1'b0;
                                      P2_P1_P3_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P1_P3_Flush  =1'b0;
                            P2_P1_P3_More  =1'b1;
                         end 
                    P2_P1_P3_ADD_al_b  :
                      begin 
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +1;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +1)%16;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                    P2_P1_P3_ADD_ax_w  :
                      begin 
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +1;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +1)%16;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                    P2_P1_P3_ROL_al_1  :
                      begin 
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +2;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +2)%16;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                    P2_P1_P3_ROL_al_n  :
                      begin 
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +2;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +2)%16;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                    P2_P1_P3_INC_eax  :
                      begin 
                         P2_P1_P3_EAX  <= P2_P1_P3_EAX +1;
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +1;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +1)%16;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                    P2_P1_P3_INC_ebx  :
                      begin 
                         P2_P1_P3_EBX  <= P2_P1_P3_EBX +1;
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +1;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +1)%16;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                   default :
                      begin 
                         P2_P1_P3_InstAddrPointer  = P2_P1_P3_InstAddrPointer +1;
                         P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +1)%16;
                         P2_P1_P3_Flush  =1'b0;
                         P2_P1_P3_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P2_P1_P3_InstQueueRd_Addr < P2_P1_P3_InstQueueWr_Addr ))|((( P2_P1_P3_InstQueueLimit - P2_P1_P3_InstQueueRd_Addr )<4)| P2_P1_P3_Flush | P2_P1_P3_More ))
                      P2_P1_P3_State2  = P2_P1_P3_S7 ;
                end 
              P2_P1_P3_S6  :
                begin 
                   P2_P1_P3_Datao  <=( P2_P1_P3_uWord *(2**16)+ P2_P1_P3_lWord );
                  if ( P2_P1_P3_READY_n ==1'b0)
                     begin 
                        P2_P1_P3_RequestPending  <= P2_P1_P3_NotPending ;
                        P2_P1_P3_State2  = P2_P1_P3_S5 ;
                     end 
                end 
              P2_P1_P3_S7  :
                begin 
                  if ( P2_P1_P3_Flush )
                     begin 
                        P2_P1_P3_InstQueueRd_Addr  =1;
                        P2_P1_P3_InstQueueWr_Addr  =1;
                       if ( P2_P1_P3_InstAddrPointer <0)
                           P2_P1_P3_fWord  =- P2_P1_P3_InstAddrPointer ;
                        else 
                           P2_P1_P3_fWord  = P2_P1_P3_InstAddrPointer ;
                       if ( P2_P1_P3_fWord %2==1)
                           P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr + P2_P1_P3_fWord %4)%16;
                     end 
                  if (( P2_P1_P3_InstQueueLimit - P2_P1_P3_InstQueueRd_Addr )<3)
                     begin 
                        P2_P1_P3_State2  = P2_P1_P3_S8 ;
                        P2_P1_P3_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P2_P1_P3_State2  = P2_P1_P3_S9 ;
                end 
              P2_P1_P3_S8  :
                if ( P2_P1_P3_InstQueueRd_Addr <= P2_P1_P3_InstQueueLimit )
                   begin 
                      P2_P1_P3_InstQueue  [ P2_P1_P3_InstQueueWr_Addr ]= P2_P1_P3_InstQueue [ P2_P1_P3_InstQueueRd_Addr ];
                      P2_P1_P3_InstQueueRd_Addr  =( P2_P1_P3_InstQueueRd_Addr +1)%16;
                      P2_P1_P3_InstQueueWr_Addr  =( P2_P1_P3_InstQueueWr_Addr +1)%16;
                      P2_P1_P3_State2  = P2_P1_P3_S8 ;
                   end 
                 else 
                   begin 
                      P2_P1_P3_InstQueueRd_Addr  =0;
                      P2_P1_P3_State2  = P2_P1_P3_S9 ;
                   end 
              P2_P1_P3_S9  :
                begin 
                   P2_P1_P3_rEIP  <= P2_P1_P3_PhyAddrPointer ;
                   P2_P1_P3_State2  = P2_P1_P3_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P2_P1_P3_CLOCK or posedge  P2_P1_P3_RESET )
       begin 
         if ( P2_P1_P3_RESET ==1'b1)
            begin 
               P2_P1_P3_ByteEnable  <=4'b0000;
               P2_P1_P3_NonAligned  <=1'b0;
            end 
          else 
            case ( P2_P1_P3_DataWidth )
              P2_P1_P3_WidthByte  :
                case ( P2_P1_P3_rEIP %4)
                 0 :
                     P2_P1_P3_ByteEnable  <=4'b1110;
                 1 :
                     P2_P1_P3_ByteEnable  <=4'b1101;
                 2 :
                     P2_P1_P3_ByteEnable  <=4'b1011;
                 3 :
                     P2_P1_P3_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P2_P1_P3_WidthWord  :
                case ( P2_P1_P3_rEIP %4)
                 0 :
                    begin 
                       P2_P1_P3_ByteEnable  <=4'b1100;
                       P2_P1_P3_NonAligned  <= P2_P1_P3_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P1_P3_ByteEnable  <=4'b1001;
                       P2_P1_P3_NonAligned  <= P2_P1_P3_NotPending ;
                    end 
                 2 :
                    begin 
                       P2_P1_P3_ByteEnable  <=4'b0011;
                       P2_P1_P3_NonAligned  <= P2_P1_P3_NotPending ;
                    end 
                 3 :
                    begin 
                       P2_P1_P3_ByteEnable  <=4'b0111;
                       P2_P1_P3_NonAligned  <= P2_P1_P3_Pending ;
                    end 
                 default :;
                endcase 
              P2_P1_P3_WidthDword  :
                case ( P2_P1_P3_rEIP %4)
                 0 :
                    begin 
                       P2_P1_P3_ByteEnable  <=4'b0000;
                       P2_P1_P3_NonAligned  <= P2_P1_P3_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P1_P3_ByteEnable  <=4'b0001;
                       P2_P1_P3_NonAligned  <= P2_P1_P3_Pending ;
                    end 
                 2 :
                    begin 
                       P2_P1_P3_NonAligned  <= P2_P1_P3_Pending ;
                       P2_P1_P3_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P2_P1_P3_NonAligned  <= P2_P1_P3_Pending ;
                       P2_P1_P3_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 

 
  
 
   integer P2_P2_buf1 ; 
   integer P2_P2_buf2 ; 
   wire[3:0] P2_P2_be1 ; 
   wire[3:0] P2_P2_be2 ; 
   wire[3:0] P2_P2_be3 ; 
   wire[29:0] P2_P2_addr1 ; 
   wire[29:0] P2_P2_addr2 ; 
   wire[29:0] P2_P2_addr3 ; 
   wire P2_P2_wr1 ; 
   wire P2_P2_wr2 ; 
   wire P2_P2_wr3 ; 
   wire P2_P2_dc1 ; 
   wire P2_P2_dc2 ; 
   wire P2_P2_dc3 ; 
   wire P2_P2_mio1 ; 
   wire P2_P2_mio2 ; 
   wire P2_P2_mio3 ; 
   wire P2_P2_ads1 ; 
   wire P2_P2_ads2 ; 
   wire P2_P2_ads3 ; 
   integer P2_P2_di1 ; 
   integer P2_P2_di2 ; 
   integer P2_P2_di3 ; 
   wire[31:0] P2_P2_do1 ; 
   wire[31:0] P2_P2_do2 ; 
   wire[31:0] P2_P2_do3 ; 
   reg P2_P2_rdy1 ; 
   reg P2_P2_rdy2 ; 
   reg P2_P2_rdy3 ; 
   reg P2_P2_ready11 ; 
   reg P2_P2_ready12 ; 
   reg P2_P2_ready21 ; 
   reg P2_P2_ready22 ; 
  always @(  posedge   P2_P2_clock or posedge  P2_P2_reset )
       if ( P2_P2_reset ==1'b1)
          begin 
             P2_P2_buf1  <=0;
             P2_P2_ready11  <=1'b0;
             P2_P2_ready12  <=1'b0;
          end 
        else 
          begin 
            if ( P2_P2_addr1 >2**29& P2_P2_ads1 ==1'b0& P2_P2_mio1 ==1'b1& P2_P2_dc1 ==1'b0& P2_P2_wr1 ==1'b1& P2_P2_be1 ==4'b0000)
               begin 
                  P2_P2_buf1  <= P2_P2_do1 ;
                  P2_P2_ready11  <=1'b0;
                  P2_P2_ready12  <=1'b1;
               end 
             else 
               if ( P2_P2_addr2 >2**29& P2_P2_ads2 ==1'b0& P2_P2_mio2 ==1'b1& P2_P2_dc2 ==1'b0& P2_P2_wr2 ==1'b1& P2_P2_be2 ==4'b0000)
                  begin 
                     P2_P2_buf1  <= P2_P2_do2 ;
                     P2_P2_ready11  <=1'b1;
                     P2_P2_ready12  <=1'b0;
                  end 
                else 
                  begin 
                     P2_P2_ready11  <=1'b1;
                     P2_P2_ready12  <=1'b1;
                  end 
          end
  
  always @(  posedge   P2_P2_clock or posedge  P2_P2_reset )
       if ( P2_P2_reset ==1'b1)
          begin 
             P2_P2_buf2  <=0;
             P2_P2_ready21  <=1'b0;
             P2_P2_ready22  <=1'b0;
          end 
        else 
          begin 
            if ( P2_P2_addr2 <2**29& P2_P2_ads2 ==1'b0& P2_P2_mio2 ==1'b1& P2_P2_dc2 ==1'b0& P2_P2_wr2 ==1'b1& P2_P2_be2 ==4'b0000)
               begin 
                  P2_P2_buf2  <= P2_P2_do2 ;
                  P2_P2_ready21  <=1'b0;
                  P2_P2_ready22  <=1'b1;
               end 
             else 
               if ( P2_P2_ads3 ==1'b0& P2_P2_mio3 ==1'b1& P2_P2_dc3 ==1'b0& P2_P2_wr3 ==1'b0& P2_P2_be3 ==4'b0000)
                  begin 
                     P2_P2_ready21  <=1'b1;
                     P2_P2_ready22  <=1'b0;
                  end 
                else 
                  begin 
                     P2_P2_ready21  <=1'b1;
                     P2_P2_ready22  <=1'b1;
                  end 
          end
  
  always @(    P2_P2_addr1    or  P2_P2_buf1  or  P2_P2_datai  )
       if ( P2_P2_addr1 >2**29)
           P2_P2_di1  <= P2_P2_buf1 ;
        else 
           P2_P2_di1  <= P2_P2_datai ;
 
  always @(    P2_P2_addr2    or  P2_P2_buf1  or  P2_P2_buf2  )
       if ( P2_P2_addr2 >2**29)
           P2_P2_di2  <= P2_P2_buf1 ;
        else 
           P2_P2_di2  <= P2_P2_buf2 ;
 
  always @(      P2_P2_addr2      or  P2_P2_addr3  or  P2_P2_do1  or  P2_P2_do2  or  P2_P2_do3  )
       if (( P2_P2_do1 <2**30)&( P2_P2_do2 <2**30)&( P2_P2_do3 <2**30))
           P2_P2_address2  <= P2_P2_addr3 ;
        else 
           P2_P2_address2  <= P2_P2_addr2 ;
 
  always @(               P2_P2_buf2               or  P2_P2_do3  or  P2_P2_addr1  or  P2_P2_wr3  or  P2_P2_dc3  or  P2_P2_mio3  or  P2_P2_ads1  or  P2_P2_ads3  or  P2_P2_ready1  or  P2_P2_ready2  or  P2_P2_ready11  or  P2_P2_ready12  or  P2_P2_ready21  or  P2_P2_ready22  )
       begin 
          P2_P2_di3  <= P2_P2_buf2 ;
          P2_P2_datao  <= P2_P2_do3 ;
          P2_P2_address1  <= P2_P2_addr1 ;
          P2_P2_wr  <= P2_P2_wr3 ;
          P2_P2_dc  <= P2_P2_dc3 ;
          P2_P2_mio  <= P2_P2_mio3 ;
          P2_P2_ast1  <= P2_P2_ads1 ;
          P2_P2_ast2  <= P2_P2_ads3 ;
          P2_P2_rdy1  <= P2_P2_ready11 & P2_P2_ready1 ;
          P2_P2_rdy2  <= P2_P2_ready12 & P2_P2_ready21 ;
          P2_P2_rdy3  <= P2_P2_ready22 & P2_P2_ready2 ;
       end
  
  
 
   reg P2_P2_P1_StateNA ; 
   reg P2_P2_P1_StateBS16 ; 
   reg P2_P2_P1_RequestPending ; 
 parameter P2_P2_P1_Pending =1'b1; 
 parameter P2_P2_P1_NotPending =1'b0; 
   reg P2_P2_P1_NonAligned ; 
   reg P2_P2_P1_ReadRequest ; 
   reg P2_P2_P1_MemoryFetch ; 
   reg P2_P2_P1_CodeFetch ; 
   reg[3:0] P2_P2_P1_ByteEnable ; 
   integer P2_P2_P1_DataWidth ; 
 parameter P2_P2_P1_WidthByte =0; 
 parameter P2_P2_P1_WidthWord =1; 
 parameter P2_P2_P1_WidthDword =2; 
   reg[2:0] P2_P2_P1_State ; 
 parameter P2_P2_P1_StateInit =0; 
 parameter P2_P2_P1_StateTi =1; 
 parameter P2_P2_P1_StateT1 =2; 
 parameter P2_P2_P1_StateT2 =3; 
 parameter P2_P2_P1_StateT1P =4; 
 parameter P2_P2_P1_StateTh =5; 
 parameter P2_P2_P1_StateT2P =6; 
 parameter P2_P2_P1_StateT2I =7; 
   integer P2_P2_P1_EAX ; 
   integer P2_P2_P1_EBX ; 
   integer P2_P2_P1_rEIP ; 
 parameter P2_P2_P1_REP =8'hF3; 
 parameter P2_P2_P1_REPNE =8'hF2; 
 parameter P2_P2_P1_LOCK =8'hF0; 
 parameter P2_P2_P1_CSsop =8'h2E; 
 parameter P2_P2_P1_SSsop =8'h36; 
 parameter P2_P2_P1_DSsop =8'h3E; 
 parameter P2_P2_P1_ESsop =8'h26; 
 parameter P2_P2_P1_FSsop =8'h64; 
 parameter P2_P2_P1_GSsop =8'h65; 
 parameter P2_P2_P1_OPsop =8'h66; 
 parameter P2_P2_P1_ADsop =8'h67; 
 parameter P2_P2_P1_MOV_al_b =8'hB0; 
 parameter P2_P2_P1_MOV_eax_dw =8'hB8; 
 parameter P2_P2_P1_MOV_ebx_dw =8'hBB; 
 parameter P2_P2_P1_MOV_ebx_eax =8'h89; 
 parameter P2_P2_P1_MOV_eax_ebx =8'h8B; 
 parameter P2_P2_P1_IN_al =8'hE4; 
 parameter P2_P2_P1_OUT_al =8'hE6; 
 parameter P2_P2_P1_ADD_al_b =8'h04; 
 parameter P2_P2_P1_ADD_ax_w =8'h05; 
 parameter P2_P2_P1_ROL_eax_b =8'hD1; 
 parameter P2_P2_P1_ROL_al_1 =8'hD0; 
 parameter P2_P2_P1_ROL_al_n =8'hC0; 
 parameter P2_P2_P1_INC_eax =8'h40; 
 parameter P2_P2_P1_INC_ebx =8'h43; 
 parameter P2_P2_P1_JMP_rel_short =8'hEB; 
 parameter P2_P2_P1_JMP_rel_near =8'hE9; 
 parameter P2_P2_P1_JMP_intseg_immed =8'hEA; 
 parameter P2_P2_P1_HLT =8'hF4; 
 parameter P2_P2_P1_WAITx =8'h9B; 
 parameter P2_P2_P1_NOP =8'h90; 
   reg[7:0] P2_P2_P1_InstQueue [15:0]; 
   reg[4:0] P2_P2_P1_InstQueueRd_Addr ; 
   reg[4:0] P2_P2_P1_InstQueueWr_Addr ; 
 parameter P2_P2_P1_InstQueueLimit =15; 
   integer P2_P2_P1_InstAddrPointer ; 
   integer P2_P2_P1_PhyAddrPointer ; 
   reg P2_P2_P1_Extended ; 
   reg P2_P2_P1_More ; 
   reg P2_P2_P1_Flush ; 
   reg[15:0] P2_P2_P1_lWord ; 
   reg[14:0] P2_P2_P1_uWord ; 
   integer P2_P2_P1_fWord ; 
   reg[3:0] P2_P2_P1_State2 ; 
 parameter P2_P2_P1_Si =0; 
 parameter P2_P2_P1_S1 =1; 
 parameter P2_P2_P1_S2 =2; 
 parameter P2_P2_P1_S3 =3; 
 parameter P2_P2_P1_S4 =4; 
 parameter P2_P2_P1_S5 =5; 
 parameter P2_P2_P1_S6 =6; 
 parameter P2_P2_P1_S7 =7; 
 parameter P2_P2_P1_S8 =8; 
 parameter P2_P2_P1_S9 =9; 
  always @(  posedge   P2_P2_P1_CLOCK or posedge  P2_P2_P1_RESET )
       begin 
         if ( P2_P2_P1_RESET ==1'b1)
            begin 
               P2_P2_P1_BE_n  <=4'b0000;
               P2_P2_P1_Address  <=0;
               P2_P2_P1_W_R_n  <=1'b0;
               P2_P2_P1_D_C_n  <=1'b0;
               P2_P2_P1_M_IO_n  <=1'b0;
               P2_P2_P1_ADS_n  <=1'b0;
               P2_P2_P1_State  <= P2_P2_P1_StateInit ;
               P2_P2_P1_StateNA  <=1'b0;
               P2_P2_P1_StateBS16  <=1'b0;
               P2_P2_P1_DataWidth  <=0;
            end 
          else 
            case ( P2_P2_P1_State )
              P2_P2_P1_StateInit  :
                begin 
                   P2_P2_P1_D_C_n  <=1'b1;
                   P2_P2_P1_ADS_n  <=1'b1;
                   P2_P2_P1_State  <= P2_P2_P1_StateTi ;
                   P2_P2_P1_StateNA  <=1'b1;
                   P2_P2_P1_StateBS16  <=1'b1;
                   P2_P2_P1_DataWidth  <=2;
                   P2_P2_P1_State  <= P2_P2_P1_StateTi ;
                end 
              P2_P2_P1_StateTi  :
                if ( P2_P2_P1_RequestPending == P2_P2_P1_Pending )
                    P2_P2_P1_State  <= P2_P2_P1_StateT1 ;
                 else 
                   if ( P2_P2_P1_HOLD ==1'b1)
                       P2_P2_P1_State  <= P2_P2_P1_StateTh ;
                    else 
                       P2_P2_P1_State  <= P2_P2_P1_StateTi ;
              P2_P2_P1_StateT1  :
                begin 
                   P2_P2_P1_Address  <= P2_P2_P1_rEIP /4%2**30;
                   P2_P2_P1_BE_n  <= P2_P2_P1_ByteEnable ;
                   P2_P2_P1_M_IO_n  <= P2_P2_P1_MemoryFetch ;
                  if ( P2_P2_P1_ReadRequest == P2_P2_P1_Pending )
                      P2_P2_P1_W_R_n  <=1'b0;
                   else 
                      P2_P2_P1_W_R_n  <=1'b1;
                  if ( P2_P2_P1_CodeFetch == P2_P2_P1_Pending )
                      P2_P2_P1_D_C_n  <=1'b0;
                   else 
                      P2_P2_P1_D_C_n  <=1'b1;
                   P2_P2_P1_ADS_n  <=1'b0;
                   P2_P2_P1_State  <= P2_P2_P1_StateT2 ;
                end 
              P2_P2_P1_StateT2  :
                begin 
                  if ( P2_P2_P1_READY_n ==1'b0& P2_P2_P1_HOLD ==1'b0& P2_P2_P1_RequestPending == P2_P2_P1_Pending )
                      P2_P2_P1_State  <= P2_P2_P1_StateT1 ;
                   else 
                     if ( P2_P2_P1_READY_n ==1'b1& P2_P2_P1_NA_n ==1'b1);
                      else 
                        if (( P2_P2_P1_RequestPending == P2_P2_P1_Pending | P2_P2_P1_HOLD ==1'b1)&( P2_P2_P1_READY_n ==1'b1& P2_P2_P1_NA_n ==1'b0))
                            P2_P2_P1_State  <= P2_P2_P1_StateT2I ;
                         else 
                           if ( P2_P2_P1_RequestPending == P2_P2_P1_Pending & P2_P2_P1_HOLD ==1'b0& P2_P2_P1_READY_n ==1'b1& P2_P2_P1_NA_n ==1'b0)
                               P2_P2_P1_State  <= P2_P2_P1_StateT2P ;
                            else 
                              if ( P2_P2_P1_RequestPending == P2_P2_P1_NotPending & P2_P2_P1_HOLD ==1'b0& P2_P2_P1_READY_n ==1'b0)
                                  P2_P2_P1_State  <= P2_P2_P1_StateTi ;
                               else 
                                 if ( P2_P2_P1_HOLD ==1'b1& P2_P2_P1_READY_n ==1'b1)
                                     P2_P2_P1_State  <= P2_P2_P1_StateTh ;
                                  else 
                                     P2_P2_P1_State  <= P2_P2_P1_StateT2 ;
                   P2_P2_P1_StateBS16  <= P2_P2_P1_BS16_n ;
                  if ( P2_P2_P1_BS16_n ==1'b0)
                      P2_P2_P1_DataWidth  <= P2_P2_P1_WidthWord ;
                   else 
                      P2_P2_P1_DataWidth  <= P2_P2_P1_WidthDword ;
                   P2_P2_P1_StateNA  <= P2_P2_P1_NA_n ;
                   P2_P2_P1_ADS_n  <=1'b1;
                end 
              P2_P2_P1_StateT1P  :
                begin 
                  if ( P2_P2_P1_NA_n ==1'b0& P2_P2_P1_HOLD ==1'b0& P2_P2_P1_RequestPending == P2_P2_P1_Pending )
                      P2_P2_P1_State  <= P2_P2_P1_StateT2P ;
                   else 
                     if ( P2_P2_P1_NA_n ==1'b0&( P2_P2_P1_HOLD ==1'b1| P2_P2_P1_RequestPending == P2_P2_P1_NotPending ))
                         P2_P2_P1_State  <= P2_P2_P1_StateT2I ;
                      else 
                        if ( P2_P2_P1_NA_n ==1'b1)
                            P2_P2_P1_State  <= P2_P2_P1_StateT2 ;
                         else 
                            P2_P2_P1_State  <= P2_P2_P1_StateT1P ;
                   P2_P2_P1_StateBS16  <= P2_P2_P1_BS16_n ;
                  if ( P2_P2_P1_BS16_n ==1'b0)
                      P2_P2_P1_DataWidth  <= P2_P2_P1_WidthWord ;
                   else 
                      P2_P2_P1_DataWidth  <= P2_P2_P1_WidthDword ;
                   P2_P2_P1_StateNA  <= P2_P2_P1_NA_n ;
                   P2_P2_P1_ADS_n  <=1'b1;
                end 
              P2_P2_P1_StateTh  :
                if ( P2_P2_P1_HOLD ==1'b0& P2_P2_P1_RequestPending == P2_P2_P1_Pending )
                    P2_P2_P1_State  <= P2_P2_P1_StateT1 ;
                 else 
                   if ( P2_P2_P1_HOLD ==1'b0& P2_P2_P1_RequestPending == P2_P2_P1_NotPending )
                       P2_P2_P1_State  <= P2_P2_P1_StateTi ;
                    else 
                       P2_P2_P1_State  <= P2_P2_P1_StateTh ;
              P2_P2_P1_StateT2P  :
                begin 
                   P2_P2_P1_Address  <= P2_P2_P1_rEIP /2%2**30;
                   P2_P2_P1_BE_n  <= P2_P2_P1_ByteEnable ;
                   P2_P2_P1_M_IO_n  <= P2_P2_P1_MemoryFetch ;
                  if ( P2_P2_P1_ReadRequest == P2_P2_P1_Pending )
                      P2_P2_P1_W_R_n  <=1'b0;
                   else 
                      P2_P2_P1_W_R_n  <=1'b1;
                  if ( P2_P2_P1_CodeFetch == P2_P2_P1_Pending )
                      P2_P2_P1_D_C_n  <=1'b0;
                   else 
                      P2_P2_P1_D_C_n  <=1'b1;
                   P2_P2_P1_ADS_n  <=1'b0;
                  if ( P2_P2_P1_READY_n ==1'b0)
                      P2_P2_P1_State  <= P2_P2_P1_StateT1P ;
                   else 
                      P2_P2_P1_State  <= P2_P2_P1_StateT2P ;
                end 
              P2_P2_P1_StateT2I  :
                if ( P2_P2_P1_READY_n ==1'b1& P2_P2_P1_RequestPending == P2_P2_P1_Pending & P2_P2_P1_HOLD ==1'b0)
                    P2_P2_P1_State  <= P2_P2_P1_StateT2P ;
                 else 
                   if ( P2_P2_P1_READY_n ==1'b0& P2_P2_P1_HOLD ==1'b1)
                       P2_P2_P1_State  <= P2_P2_P1_StateTh ;
                    else 
                      if ( P2_P2_P1_READY_n ==1'b0& P2_P2_P1_HOLD ==1'b0& P2_P2_P1_RequestPending == P2_P2_P1_Pending )
                          P2_P2_P1_State  <= P2_P2_P1_StateT1 ;
                       else 
                         if ( P2_P2_P1_READY_n ==1'b0& P2_P2_P1_HOLD ==1'b0& P2_P2_P1_RequestPending == P2_P2_P1_NotPending )
                             P2_P2_P1_State  <= P2_P2_P1_StateTi ;
                          else 
                             P2_P2_P1_State  <= P2_P2_P1_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P2_P2_P1_CLOCK or posedge  P2_P2_P1_RESET )
       begin 
         if ( P2_P2_P1_RESET ==1'b1)
            begin 
               P2_P2_P1_State2  = P2_P2_P1_Si ;
               P2_P2_P1_InstQueue  [0]=8'b0000_0000;
               P2_P2_P1_InstQueue  [1]=8'b0000_0000;
               P2_P2_P1_InstQueue  [2]=8'b0000_0000;
               P2_P2_P1_InstQueue  [3]=8'b0000_0000;
               P2_P2_P1_InstQueue  [4]=8'b0000_0000;
               P2_P2_P1_InstQueue  [5]=8'b0000_0000;
               P2_P2_P1_InstQueue  [6]=8'b0000_0000;
               P2_P2_P1_InstQueue  [7]=8'b0000_0000;
               P2_P2_P1_InstQueue  [8]=8'b0000_0000;
               P2_P2_P1_InstQueue  [9]=8'b0000_0000;
               P2_P2_P1_InstQueue  [10]=8'b0000_0000;
               P2_P2_P1_InstQueue  [11]=8'b0000_0000;
               P2_P2_P1_InstQueue  [12]=8'b0000_0000;
               P2_P2_P1_InstQueue  [13]=8'b0000_0000;
               P2_P2_P1_InstQueue  [14]=8'b0000_0000;
               P2_P2_P1_InstQueue  [15]=8'b0000_0000;
               P2_P2_P1_InstQueueRd_Addr  =0;
               P2_P2_P1_InstQueueWr_Addr  =0;
               P2_P2_P1_InstAddrPointer  =0;
               P2_P2_P1_PhyAddrPointer  =0;
               P2_P2_P1_Extended  =1'b0;
               P2_P2_P1_More  =1'b0;
               P2_P2_P1_Flush  =1'b0;
               P2_P2_P1_lWord  =0;
               P2_P2_P1_uWord  =0;
               P2_P2_P1_fWord  =0;
               P2_P2_P1_CodeFetch  <=1'b0;
               P2_P2_P1_Datao  <=0;
               P2_P2_P1_EAX  <=0;
               P2_P2_P1_EBX  <=0;
               P2_P2_P1_rEIP  <=0;
               P2_P2_P1_ReadRequest  <=1'b0;
               P2_P2_P1_MemoryFetch  <=1'b0;
               P2_P2_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P2_P2_P1_State2 )
              P2_P2_P1_Si  :
                begin 
                   P2_P2_P1_PhyAddrPointer  = P2_P2_P1_rEIP ;
                   P2_P2_P1_InstAddrPointer  = P2_P2_P1_PhyAddrPointer ;
                   P2_P2_P1_State2  = P2_P2_P1_S1 ;
                   P2_P2_P1_rEIP  <=20'hFFFF0;
                   P2_P2_P1_ReadRequest  <=1'b1;
                   P2_P2_P1_MemoryFetch  <=1'b1;
                   P2_P2_P1_RequestPending  <=1'b1;
                end 
              P2_P2_P1_S1  :
                begin 
                   P2_P2_P1_RequestPending  <= P2_P2_P1_Pending ;
                   P2_P2_P1_ReadRequest  <= P2_P2_P1_Pending ;
                   P2_P2_P1_MemoryFetch  <= P2_P2_P1_Pending ;
                   P2_P2_P1_CodeFetch  <= P2_P2_P1_Pending ;
                  if ( P2_P2_P1_READY_n ==1'b0)
                      P2_P2_P1_State2  = P2_P2_P1_S2 ;
                   else 
                      P2_P2_P1_State2  = P2_P2_P1_S1 ;
                end 
              P2_P2_P1_S2  :
                begin 
                   P2_P2_P1_RequestPending  <= P2_P2_P1_NotPending ;
                   P2_P2_P1_InstQueue  [ P2_P2_P1_InstQueueWr_Addr ]= P2_P2_P1_Datai %(2**8);
                   P2_P2_P1_InstQueueWr_Addr  =( P2_P2_P1_InstQueueWr_Addr +1)%16;
                   P2_P2_P1_InstQueue  [ P2_P2_P1_InstQueueWr_Addr ]= P2_P2_P1_Datai %2**8;
                   P2_P2_P1_InstQueueWr_Addr  =( P2_P2_P1_InstQueueWr_Addr +1)%16;
                  if ( P2_P2_P1_StateBS16 ==1'b1)
                     begin 
                        P2_P2_P1_InstQueue  [ P2_P2_P1_InstQueueWr_Addr ]=( P2_P2_P1_Datai /(2**16))%(2**8);
                        P2_P2_P1_InstQueueWr_Addr  =( P2_P2_P1_InstQueueWr_Addr +1)%16;
                        P2_P2_P1_InstQueue  [ P2_P2_P1_InstQueueWr_Addr ]=( P2_P2_P1_Datai /(2**24))%(2**8);
                        P2_P2_P1_InstQueueWr_Addr  =( P2_P2_P1_InstQueueWr_Addr +1)%16;
                        P2_P2_P1_PhyAddrPointer  = P2_P2_P1_PhyAddrPointer +4;
                        P2_P2_P1_State2  = P2_P2_P1_S5 ;
                     end 
                   else 
                     begin 
                        P2_P2_P1_PhyAddrPointer  = P2_P2_P1_PhyAddrPointer +2;
                       if ( P2_P2_P1_PhyAddrPointer <0)
                           P2_P2_P1_rEIP  <=- P2_P2_P1_PhyAddrPointer ;
                        else 
                           P2_P2_P1_rEIP  <= P2_P2_P1_PhyAddrPointer ;
                        P2_P2_P1_State2  = P2_P2_P1_S3 ;
                     end 
                end 
              P2_P2_P1_S3  :
                begin 
                   P2_P2_P1_RequestPending  <= P2_P2_P1_Pending ;
                  if ( P2_P2_P1_READY_n ==1'b0)
                      P2_P2_P1_State2  = P2_P2_P1_S4 ;
                   else 
                      P2_P2_P1_State2  = P2_P2_P1_S3 ;
                end 
              P2_P2_P1_S4  :
                begin 
                   P2_P2_P1_RequestPending  <= P2_P2_P1_NotPending ;
                   P2_P2_P1_InstQueue  [ P2_P2_P1_InstQueueWr_Addr ]= P2_P2_P1_Datai %(2**8);
                   P2_P2_P1_InstQueueWr_Addr  =( P2_P2_P1_InstQueueWr_Addr +1)%16;
                   P2_P2_P1_InstQueue  [ P2_P2_P1_InstQueueWr_Addr ]= P2_P2_P1_Datai %(2**8);
                   P2_P2_P1_InstQueueWr_Addr  =( P2_P2_P1_InstQueueWr_Addr +1)%16;
                   P2_P2_P1_PhyAddrPointer  = P2_P2_P1_PhyAddrPointer +2;
                   P2_P2_P1_State2  = P2_P2_P1_S5 ;
                end 
              P2_P2_P1_S5  :
                begin 
                  case ( P2_P2_P1_InstQueue [ P2_P2_P1_InstQueueRd_Addr ])
                    P2_P2_P1_NOP  :
                      begin 
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +1;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +1)%16;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                    P2_P2_P1_OPsop  :
                      begin 
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +1;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +1)%16;
                         P2_P2_P1_Extended  =1'b1;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                    P2_P2_P1_JMP_rel_short  :
                      if (( P2_P2_P1_InstQueueWr_Addr - P2_P2_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P2_P2_P1_PhyAddrPointer  = P2_P2_P1_InstAddrPointer +1-(8'hFF- P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +1)%16]);
                                 P2_P2_P1_InstAddrPointer  = P2_P2_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P2_P2_P1_PhyAddrPointer  = P2_P2_P1_InstAddrPointer +2+ P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +1)%16];
                                 P2_P2_P1_InstAddrPointer  = P2_P2_P1_PhyAddrPointer ;
                              end 
                            P2_P2_P1_Flush  =1'b1;
                            P2_P2_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P2_P1_Flush  =1'b0;
                            P2_P2_P1_More  =1'b1;
                         end 
                    P2_P2_P1_JMP_rel_near  :
                      if (( P2_P2_P1_InstQueueWr_Addr - P2_P2_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P2_P1_PhyAddrPointer  = P2_P2_P1_InstAddrPointer +5+ P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +1)%16];
                            P2_P2_P1_InstAddrPointer  = P2_P2_P1_PhyAddrPointer ;
                            P2_P2_P1_Flush  =1'b1;
                            P2_P2_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P2_P1_Flush  =1'b0;
                            P2_P2_P1_More  =1'b1;
                         end 
                    P2_P2_P1_JMP_intseg_immed  :
                      begin 
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +1;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +1)%16;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                    P2_P2_P1_MOV_al_b  :
                      begin 
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +1;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +1)%16;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                    P2_P2_P1_MOV_eax_dw  :
                      if (( P2_P2_P1_InstQueueWr_Addr - P2_P2_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P2_P1_EAX  <= P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +1)%16];
                            P2_P2_P1_More  =1'b0;
                            P2_P2_P1_Flush  =1'b0;
                            P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +5;
                            P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P2_P1_Flush  =1'b0;
                            P2_P2_P1_More  =1'b1;
                         end 
                    P2_P2_P1_MOV_ebx_dw  :
                      if (( P2_P2_P1_InstQueueWr_Addr - P2_P2_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P2_P1_EBX  <= P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P2_P1_InstQueue [( P2_P2_P1_InstQueueRd_Addr +1)%1];
                            P2_P2_P1_More  =1'b0;
                            P2_P2_P1_Flush  =1'b0;
                            P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +5;
                            P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P2_P1_Flush  =1'b0;
                            P2_P2_P1_More  =1'b1;
                         end 
                    P2_P2_P1_MOV_eax_ebx  :
                      if (( P2_P2_P1_InstQueueWr_Addr - P2_P2_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P2_P1_EBX <0)
                               P2_P2_P1_rEIP  <=- P2_P2_P1_EBX ;
                            else 
                               P2_P2_P1_rEIP  <= P2_P2_P1_EBX ;
                            P2_P2_P1_RequestPending  <= P2_P2_P1_Pending ;
                            P2_P2_P1_ReadRequest  <= P2_P2_P1_Pending ;
                            P2_P2_P1_MemoryFetch  <= P2_P2_P1_Pending ;
                            P2_P2_P1_CodeFetch  <= P2_P2_P1_NotPending ;
                           if ( P2_P2_P1_READY_n ==1'b0)
                              begin 
                                 P2_P2_P1_RequestPending  <= P2_P2_P1_NotPending ;
                                 P2_P2_P1_uWord  = P2_P2_P1_Datai %(2**15);
                                if ( P2_P2_P1_StateBS16 ==1'b1)
                                    P2_P2_P1_lWord  = P2_P2_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P2_P2_P1_rEIP  <= P2_P2_P1_rEIP +2;
                                      P2_P2_P1_RequestPending  <= P2_P2_P1_Pending ;
                                     if ( P2_P2_P1_READY_n ==1'b0)
                                        begin 
                                           P2_P2_P1_RequestPending  <= P2_P2_P1_NotPending ;
                                           P2_P2_P1_lWord  = P2_P2_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P2_P2_P1_READY_n ==1'b0)
                                   begin 
                                      P2_P2_P1_EAX  <= P2_P2_P1_uWord *(2**16)+ P2_P2_P1_lWord ;
                                      P2_P2_P1_More  =1'b0;
                                      P2_P2_P1_Flush  =1'b0;
                                      P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +2;
                                      P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P1_Flush  =1'b0;
                            P2_P2_P1_More  =1'b1;
                         end 
                    P2_P2_P1_MOV_ebx_eax  :
                      if (( P2_P2_P1_InstQueueWr_Addr - P2_P2_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P2_P1_EBX <0)
                               P2_P2_P1_rEIP  <= P2_P2_P1_EBX ;
                            else 
                               P2_P2_P1_rEIP  <= P2_P2_P1_EBX ;
                            P2_P2_P1_lWord  = P2_P2_P1_EAX %(2**16);
                            P2_P2_P1_uWord  =( P2_P2_P1_EAX /(2**16))%(2**15);
                            P2_P2_P1_RequestPending  <= P2_P2_P1_Pending ;
                            P2_P2_P1_ReadRequest  <= P2_P2_P1_NotPending ;
                            P2_P2_P1_MemoryFetch  <= P2_P2_P1_Pending ;
                            P2_P2_P1_CodeFetch  <= P2_P2_P1_NotPending ;
                           if ( P2_P2_P1_State == P2_P2_P1_StateT1 | P2_P2_P1_State == P2_P2_P1_StateT1P )
                              begin 
                                 P2_P2_P1_Datao  <=( P2_P2_P1_uWord *(2**16)+ P2_P2_P1_lWord );
                                if ( P2_P2_P1_READY_n ==1'b0)
                                   begin 
                                      P2_P2_P1_RequestPending  <= P2_P2_P1_NotPending ;
                                     if ( P2_P2_P1_StateBS16 ==1'b0)
                                        begin 
                                           P2_P2_P1_rEIP  <= P2_P2_P1_rEIP +2;
                                           P2_P2_P1_RequestPending  <= P2_P2_P1_Pending ;
                                           P2_P2_P1_ReadRequest  <= P2_P2_P1_NotPending ;
                                           P2_P2_P1_MemoryFetch  <= P2_P2_P1_Pending ;
                                           P2_P2_P1_CodeFetch  <= P2_P2_P1_NotPending ;
                                           P2_P2_P1_State2  = P2_P2_P1_S6 ;
                                        end 
                                      P2_P2_P1_More  =1'b0;
                                      P2_P2_P1_Flush  =1'b0;
                                      P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +2;
                                      P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P1_Flush  =1'b0;
                            P2_P2_P1_More  =1'b1;
                         end 
                    P2_P2_P1_IN_al  :
                      if (( P2_P2_P1_InstQueueWr_Addr - P2_P2_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P2_P1_rEIP  <= P2_P2_P1_InstQueueRd_Addr +1;
                            P2_P2_P1_RequestPending  <= P2_P2_P1_Pending ;
                            P2_P2_P1_ReadRequest  <= P2_P2_P1_Pending ;
                            P2_P2_P1_MemoryFetch  <= P2_P2_P1_NotPending ;
                            P2_P2_P1_CodeFetch  <= P2_P2_P1_NotPending ;
                           if ( P2_P2_P1_READY_n ==1'b0)
                              begin 
                                 P2_P2_P1_RequestPending  <= P2_P2_P1_NotPending ;
                                 P2_P2_P1_EAX  <= P2_P2_P1_Datai ;
                                 P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +2;
                                 P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +2);
                                 P2_P2_P1_Flush  =1'b0;
                                 P2_P2_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P1_Flush  =1'b0;
                            P2_P2_P1_More  =1'b1;
                         end 
                    P2_P2_P1_OUT_al  :
                      if (( P2_P2_P1_InstQueueWr_Addr - P2_P2_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P2_P1_rEIP  <= P2_P2_P1_InstQueueRd_Addr +1;
                            P2_P2_P1_RequestPending  <= P2_P2_P1_Pending ;
                            P2_P2_P1_ReadRequest  <= P2_P2_P1_NotPending ;
                            P2_P2_P1_MemoryFetch  <= P2_P2_P1_NotPending ;
                            P2_P2_P1_CodeFetch  <= P2_P2_P1_NotPending ;
                           if ( P2_P2_P1_State == P2_P2_P1_StateT1 | P2_P2_P1_State == P2_P2_P1_StateT1P )
                              begin 
                                 P2_P2_P1_fWord  = P2_P2_P1_EAX %(2**16);
                                 P2_P2_P1_Datao  <= P2_P2_P1_fWord ;
                                if ( P2_P2_P1_READY_n ==1'b0)
                                   begin 
                                      P2_P2_P1_RequestPending  <= P2_P2_P1_NotPending ;
                                      P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +2;
                                      P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +2)%16;
                                      P2_P2_P1_Flush  =1'b0;
                                      P2_P2_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P1_Flush  =1'b0;
                            P2_P2_P1_More  =1'b1;
                         end 
                    P2_P2_P1_ADD_al_b  :
                      begin 
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +1;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +1)%16;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                    P2_P2_P1_ADD_ax_w  :
                      begin 
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +1;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +1)%16;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                    P2_P2_P1_ROL_al_1  :
                      begin 
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +2;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +2)%16;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                    P2_P2_P1_ROL_al_n  :
                      begin 
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +2;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +2)%16;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                    P2_P2_P1_INC_eax  :
                      begin 
                         P2_P2_P1_EAX  <= P2_P2_P1_EAX +1;
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +1;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +1)%16;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                    P2_P2_P1_INC_ebx  :
                      begin 
                         P2_P2_P1_EBX  <= P2_P2_P1_EBX +1;
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +1;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +1)%16;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P2_P2_P1_InstAddrPointer  = P2_P2_P1_InstAddrPointer +1;
                         P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +1)%16;
                         P2_P2_P1_Flush  =1'b0;
                         P2_P2_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P2_P2_P1_InstQueueRd_Addr < P2_P2_P1_InstQueueWr_Addr ))|((( P2_P2_P1_InstQueueLimit - P2_P2_P1_InstQueueRd_Addr )<4)| P2_P2_P1_Flush | P2_P2_P1_More ))
                      P2_P2_P1_State2  = P2_P2_P1_S7 ;
                end 
              P2_P2_P1_S6  :
                begin 
                   P2_P2_P1_Datao  <=( P2_P2_P1_uWord *(2**16)+ P2_P2_P1_lWord );
                  if ( P2_P2_P1_READY_n ==1'b0)
                     begin 
                        P2_P2_P1_RequestPending  <= P2_P2_P1_NotPending ;
                        P2_P2_P1_State2  = P2_P2_P1_S5 ;
                     end 
                end 
              P2_P2_P1_S7  :
                begin 
                  if ( P2_P2_P1_Flush )
                     begin 
                        P2_P2_P1_InstQueueRd_Addr  =1;
                        P2_P2_P1_InstQueueWr_Addr  =1;
                       if ( P2_P2_P1_InstAddrPointer <0)
                           P2_P2_P1_fWord  =- P2_P2_P1_InstAddrPointer ;
                        else 
                           P2_P2_P1_fWord  = P2_P2_P1_InstAddrPointer ;
                       if ( P2_P2_P1_fWord %2==1)
                           P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr + P2_P2_P1_fWord %4)%16;
                     end 
                  if (( P2_P2_P1_InstQueueLimit - P2_P2_P1_InstQueueRd_Addr )<3)
                     begin 
                        P2_P2_P1_State2  = P2_P2_P1_S8 ;
                        P2_P2_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P2_P2_P1_State2  = P2_P2_P1_S9 ;
                end 
              P2_P2_P1_S8  :
                if ( P2_P2_P1_InstQueueRd_Addr <= P2_P2_P1_InstQueueLimit )
                   begin 
                      P2_P2_P1_InstQueue  [ P2_P2_P1_InstQueueWr_Addr ]= P2_P2_P1_InstQueue [ P2_P2_P1_InstQueueRd_Addr ];
                      P2_P2_P1_InstQueueRd_Addr  =( P2_P2_P1_InstQueueRd_Addr +1)%16;
                      P2_P2_P1_InstQueueWr_Addr  =( P2_P2_P1_InstQueueWr_Addr +1)%16;
                      P2_P2_P1_State2  = P2_P2_P1_S8 ;
                   end 
                 else 
                   begin 
                      P2_P2_P1_InstQueueRd_Addr  =0;
                      P2_P2_P1_State2  = P2_P2_P1_S9 ;
                   end 
              P2_P2_P1_S9  :
                begin 
                   P2_P2_P1_rEIP  <= P2_P2_P1_PhyAddrPointer ;
                   P2_P2_P1_State2  = P2_P2_P1_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P2_P2_P1_CLOCK or posedge  P2_P2_P1_RESET )
       begin 
         if ( P2_P2_P1_RESET ==1'b1)
            begin 
               P2_P2_P1_ByteEnable  <=4'b0000;
               P2_P2_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P2_P2_P1_DataWidth )
              P2_P2_P1_WidthByte  :
                case ( P2_P2_P1_rEIP %4)
                 0 :
                     P2_P2_P1_ByteEnable  <=4'b1110;
                 1 :
                     P2_P2_P1_ByteEnable  <=4'b1101;
                 2 :
                     P2_P2_P1_ByteEnable  <=4'b1011;
                 3 :
                     P2_P2_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P2_P2_P1_WidthWord  :
                case ( P2_P2_P1_rEIP %4)
                 0 :
                    begin 
                       P2_P2_P1_ByteEnable  <=4'b1100;
                       P2_P2_P1_NonAligned  <= P2_P2_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P2_P1_ByteEnable  <=4'b1001;
                       P2_P2_P1_NonAligned  <= P2_P2_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P2_P2_P1_ByteEnable  <=4'b0011;
                       P2_P2_P1_NonAligned  <= P2_P2_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P2_P2_P1_ByteEnable  <=4'b0111;
                       P2_P2_P1_NonAligned  <= P2_P2_P1_Pending ;
                    end 
                 default :;
                endcase 
              P2_P2_P1_WidthDword  :
                case ( P2_P2_P1_rEIP %4)
                 0 :
                    begin 
                       P2_P2_P1_ByteEnable  <=4'b0000;
                       P2_P2_P1_NonAligned  <= P2_P2_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P2_P1_ByteEnable  <=4'b0001;
                       P2_P2_P1_NonAligned  <= P2_P2_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P2_P2_P1_NonAligned  <= P2_P2_P1_Pending ;
                       P2_P2_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P2_P2_P1_NonAligned  <= P2_P2_P1_Pending ;
                       P2_P2_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
 
   reg P2_P2_P2_StateNA ; 
   reg P2_P2_P2_StateBS16 ; 
   reg P2_P2_P2_RequestPending ; 
 parameter P2_P2_P2_Pending =1'b1; 
 parameter P2_P2_P2_NotPending =1'b0; 
   reg P2_P2_P2_NonAligned ; 
   reg P2_P2_P2_ReadRequest ; 
   reg P2_P2_P2_MemoryFetch ; 
   reg P2_P2_P2_CodeFetch ; 
   reg[3:0] P2_P2_P2_ByteEnable ; 
   integer P2_P2_P2_DataWidth ; 
 parameter P2_P2_P2_WidthByte =0; 
 parameter P2_P2_P2_WidthWord =1; 
 parameter P2_P2_P2_WidthDword =2; 
   reg[2:0] P2_P2_P2_State ; 
 parameter P2_P2_P2_StateInit =0; 
 parameter P2_P2_P2_StateTi =1; 
 parameter P2_P2_P2_StateT1 =2; 
 parameter P2_P2_P2_StateT2 =3; 
 parameter P2_P2_P2_StateT1P =4; 
 parameter P2_P2_P2_StateTh =5; 
 parameter P2_P2_P2_StateT2P =6; 
 parameter P2_P2_P2_StateT2I =7; 
   integer P2_P2_P2_EAX ; 
   integer P2_P2_P2_EBX ; 
   integer P2_P2_P2_rEIP ; 
 parameter P2_P2_P2_REP =8'hF3; 
 parameter P2_P2_P2_REPNE =8'hF2; 
 parameter P2_P2_P2_LOCK =8'hF0; 
 parameter P2_P2_P2_CSsop =8'h2E; 
 parameter P2_P2_P2_SSsop =8'h36; 
 parameter P2_P2_P2_DSsop =8'h3E; 
 parameter P2_P2_P2_ESsop =8'h26; 
 parameter P2_P2_P2_FSsop =8'h64; 
 parameter P2_P2_P2_GSsop =8'h65; 
 parameter P2_P2_P2_OPsop =8'h66; 
 parameter P2_P2_P2_ADsop =8'h67; 
 parameter P2_P2_P2_MOV_al_b =8'hB0; 
 parameter P2_P2_P2_MOV_eax_dw =8'hB8; 
 parameter P2_P2_P2_MOV_ebx_dw =8'hBB; 
 parameter P2_P2_P2_MOV_ebx_eax =8'h89; 
 parameter P2_P2_P2_MOV_eax_ebx =8'h8B; 
 parameter P2_P2_P2_IN_al =8'hE4; 
 parameter P2_P2_P2_OUT_al =8'hE6; 
 parameter P2_P2_P2_ADD_al_b =8'h04; 
 parameter P2_P2_P2_ADD_ax_w =8'h05; 
 parameter P2_P2_P2_ROL_eax_b =8'hD1; 
 parameter P2_P2_P2_ROL_al_1 =8'hD0; 
 parameter P2_P2_P2_ROL_al_n =8'hC0; 
 parameter P2_P2_P2_INC_eax =8'h40; 
 parameter P2_P2_P2_INC_ebx =8'h43; 
 parameter P2_P2_P2_JMP_rel_short =8'hEB; 
 parameter P2_P2_P2_JMP_rel_near =8'hE9; 
 parameter P2_P2_P2_JMP_intseg_immed =8'hEA; 
 parameter P2_P2_P2_HLT =8'hF4; 
 parameter P2_P2_P2_WAITx =8'h9B; 
 parameter P2_P2_P2_NOP =8'h90; 
   reg[7:0] P2_P2_P2_InstQueue [15:0]; 
   reg[4:0] P2_P2_P2_InstQueueRd_Addr ; 
   reg[4:0] P2_P2_P2_InstQueueWr_Addr ; 
 parameter P2_P2_P2_InstQueueLimit =15; 
   integer P2_P2_P2_InstAddrPointer ; 
   integer P2_P2_P2_PhyAddrPointer ; 
   reg P2_P2_P2_Extended ; 
   reg P2_P2_P2_More ; 
   reg P2_P2_P2_Flush ; 
   reg[15:0] P2_P2_P2_lWord ; 
   reg[14:0] P2_P2_P2_uWord ; 
   integer P2_P2_P2_fWord ; 
   reg[3:0] P2_P2_P2_State2 ; 
 parameter P2_P2_P2_Si =0; 
 parameter P2_P2_P2_S1 =1; 
 parameter P2_P2_P2_S2 =2; 
 parameter P2_P2_P2_S3 =3; 
 parameter P2_P2_P2_S4 =4; 
 parameter P2_P2_P2_S5 =5; 
 parameter P2_P2_P2_S6 =6; 
 parameter P2_P2_P2_S7 =7; 
 parameter P2_P2_P2_S8 =8; 
 parameter P2_P2_P2_S9 =9; 
  always @(  posedge   P2_P2_P2_CLOCK or posedge  P2_P2_P2_RESET )
       begin 
         if ( P2_P2_P2_RESET ==1'b1)
            begin 
               P2_P2_P2_BE_n  <=4'b0000;
               P2_P2_P2_Address  <=0;
               P2_P2_P2_W_R_n  <=1'b0;
               P2_P2_P2_D_C_n  <=1'b0;
               P2_P2_P2_M_IO_n  <=1'b0;
               P2_P2_P2_ADS_n  <=1'b0;
               P2_P2_P2_State  <= P2_P2_P2_StateInit ;
               P2_P2_P2_StateNA  <=1'b0;
               P2_P2_P2_StateBS16  <=1'b0;
               P2_P2_P2_DataWidth  <=0;
            end 
          else 
            case ( P2_P2_P2_State )
              P2_P2_P2_StateInit  :
                begin 
                   P2_P2_P2_D_C_n  <=1'b1;
                   P2_P2_P2_ADS_n  <=1'b1;
                   P2_P2_P2_State  <= P2_P2_P2_StateTi ;
                   P2_P2_P2_StateNA  <=1'b1;
                   P2_P2_P2_StateBS16  <=1'b1;
                   P2_P2_P2_DataWidth  <=2;
                   P2_P2_P2_State  <= P2_P2_P2_StateTi ;
                end 
              P2_P2_P2_StateTi  :
                if ( P2_P2_P2_RequestPending == P2_P2_P2_Pending )
                    P2_P2_P2_State  <= P2_P2_P2_StateT1 ;
                 else 
                   if ( P2_P2_P2_HOLD ==1'b1)
                       P2_P2_P2_State  <= P2_P2_P2_StateTh ;
                    else 
                       P2_P2_P2_State  <= P2_P2_P2_StateTi ;
              P2_P2_P2_StateT1  :
                begin 
                   P2_P2_P2_Address  <= P2_P2_P2_rEIP /4%2**30;
                   P2_P2_P2_BE_n  <= P2_P2_P2_ByteEnable ;
                   P2_P2_P2_M_IO_n  <= P2_P2_P2_MemoryFetch ;
                  if ( P2_P2_P2_ReadRequest == P2_P2_P2_Pending )
                      P2_P2_P2_W_R_n  <=1'b0;
                   else 
                      P2_P2_P2_W_R_n  <=1'b1;
                  if ( P2_P2_P2_CodeFetch == P2_P2_P2_Pending )
                      P2_P2_P2_D_C_n  <=1'b0;
                   else 
                      P2_P2_P2_D_C_n  <=1'b1;
                   P2_P2_P2_ADS_n  <=1'b0;
                   P2_P2_P2_State  <= P2_P2_P2_StateT2 ;
                end 
              P2_P2_P2_StateT2  :
                begin 
                  if ( P2_P2_P2_READY_n ==1'b0& P2_P2_P2_HOLD ==1'b0& P2_P2_P2_RequestPending == P2_P2_P2_Pending )
                      P2_P2_P2_State  <= P2_P2_P2_StateT1 ;
                   else 
                     if ( P2_P2_P2_READY_n ==1'b1& P2_P2_P2_NA_n ==1'b1);
                      else 
                        if (( P2_P2_P2_RequestPending == P2_P2_P2_Pending | P2_P2_P2_HOLD ==1'b1)&( P2_P2_P2_READY_n ==1'b1& P2_P2_P2_NA_n ==1'b0))
                            P2_P2_P2_State  <= P2_P2_P2_StateT2I ;
                         else 
                           if ( P2_P2_P2_RequestPending == P2_P2_P2_Pending & P2_P2_P2_HOLD ==1'b0& P2_P2_P2_READY_n ==1'b1& P2_P2_P2_NA_n ==1'b0)
                               P2_P2_P2_State  <= P2_P2_P2_StateT2P ;
                            else 
                              if ( P2_P2_P2_RequestPending == P2_P2_P2_NotPending & P2_P2_P2_HOLD ==1'b0& P2_P2_P2_READY_n ==1'b0)
                                  P2_P2_P2_State  <= P2_P2_P2_StateTi ;
                               else 
                                 if ( P2_P2_P2_HOLD ==1'b1& P2_P2_P2_READY_n ==1'b1)
                                     P2_P2_P2_State  <= P2_P2_P2_StateTh ;
                                  else 
                                     P2_P2_P2_State  <= P2_P2_P2_StateT2 ;
                   P2_P2_P2_StateBS16  <= P2_P2_P2_BS16_n ;
                  if ( P2_P2_P2_BS16_n ==1'b0)
                      P2_P2_P2_DataWidth  <= P2_P2_P2_WidthWord ;
                   else 
                      P2_P2_P2_DataWidth  <= P2_P2_P2_WidthDword ;
                   P2_P2_P2_StateNA  <= P2_P2_P2_NA_n ;
                   P2_P2_P2_ADS_n  <=1'b1;
                end 
              P2_P2_P2_StateT1P  :
                begin 
                  if ( P2_P2_P2_NA_n ==1'b0& P2_P2_P2_HOLD ==1'b0& P2_P2_P2_RequestPending == P2_P2_P2_Pending )
                      P2_P2_P2_State  <= P2_P2_P2_StateT2P ;
                   else 
                     if ( P2_P2_P2_NA_n ==1'b0&( P2_P2_P2_HOLD ==1'b1| P2_P2_P2_RequestPending == P2_P2_P2_NotPending ))
                         P2_P2_P2_State  <= P2_P2_P2_StateT2I ;
                      else 
                        if ( P2_P2_P2_NA_n ==1'b1)
                            P2_P2_P2_State  <= P2_P2_P2_StateT2 ;
                         else 
                            P2_P2_P2_State  <= P2_P2_P2_StateT1P ;
                   P2_P2_P2_StateBS16  <= P2_P2_P2_BS16_n ;
                  if ( P2_P2_P2_BS16_n ==1'b0)
                      P2_P2_P2_DataWidth  <= P2_P2_P2_WidthWord ;
                   else 
                      P2_P2_P2_DataWidth  <= P2_P2_P2_WidthDword ;
                   P2_P2_P2_StateNA  <= P2_P2_P2_NA_n ;
                   P2_P2_P2_ADS_n  <=1'b1;
                end 
              P2_P2_P2_StateTh  :
                if ( P2_P2_P2_HOLD ==1'b0& P2_P2_P2_RequestPending == P2_P2_P2_Pending )
                    P2_P2_P2_State  <= P2_P2_P2_StateT1 ;
                 else 
                   if ( P2_P2_P2_HOLD ==1'b0& P2_P2_P2_RequestPending == P2_P2_P2_NotPending )
                       P2_P2_P2_State  <= P2_P2_P2_StateTi ;
                    else 
                       P2_P2_P2_State  <= P2_P2_P2_StateTh ;
              P2_P2_P2_StateT2P  :
                begin 
                   P2_P2_P2_Address  <= P2_P2_P2_rEIP /2%2**30;
                   P2_P2_P2_BE_n  <= P2_P2_P2_ByteEnable ;
                   P2_P2_P2_M_IO_n  <= P2_P2_P2_MemoryFetch ;
                  if ( P2_P2_P2_ReadRequest == P2_P2_P2_Pending )
                      P2_P2_P2_W_R_n  <=1'b0;
                   else 
                      P2_P2_P2_W_R_n  <=1'b1;
                  if ( P2_P2_P2_CodeFetch == P2_P2_P2_Pending )
                      P2_P2_P2_D_C_n  <=1'b0;
                   else 
                      P2_P2_P2_D_C_n  <=1'b1;
                   P2_P2_P2_ADS_n  <=1'b0;
                  if ( P2_P2_P2_READY_n ==1'b0)
                      P2_P2_P2_State  <= P2_P2_P2_StateT1P ;
                   else 
                      P2_P2_P2_State  <= P2_P2_P2_StateT2P ;
                end 
              P2_P2_P2_StateT2I  :
                if ( P2_P2_P2_READY_n ==1'b1& P2_P2_P2_RequestPending == P2_P2_P2_Pending & P2_P2_P2_HOLD ==1'b0)
                    P2_P2_P2_State  <= P2_P2_P2_StateT2P ;
                 else 
                   if ( P2_P2_P2_READY_n ==1'b0& P2_P2_P2_HOLD ==1'b1)
                       P2_P2_P2_State  <= P2_P2_P2_StateTh ;
                    else 
                      if ( P2_P2_P2_READY_n ==1'b0& P2_P2_P2_HOLD ==1'b0& P2_P2_P2_RequestPending == P2_P2_P2_Pending )
                          P2_P2_P2_State  <= P2_P2_P2_StateT1 ;
                       else 
                         if ( P2_P2_P2_READY_n ==1'b0& P2_P2_P2_HOLD ==1'b0& P2_P2_P2_RequestPending == P2_P2_P2_NotPending )
                             P2_P2_P2_State  <= P2_P2_P2_StateTi ;
                          else 
                             P2_P2_P2_State  <= P2_P2_P2_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P2_P2_P2_CLOCK or posedge  P2_P2_P2_RESET )
       begin 
         if ( P2_P2_P2_RESET ==1'b1)
            begin 
               P2_P2_P2_State2  = P2_P2_P2_Si ;
               P2_P2_P2_InstQueue  [0]=8'b0000_0000;
               P2_P2_P2_InstQueue  [1]=8'b0000_0000;
               P2_P2_P2_InstQueue  [2]=8'b0000_0000;
               P2_P2_P2_InstQueue  [3]=8'b0000_0000;
               P2_P2_P2_InstQueue  [4]=8'b0000_0000;
               P2_P2_P2_InstQueue  [5]=8'b0000_0000;
               P2_P2_P2_InstQueue  [6]=8'b0000_0000;
               P2_P2_P2_InstQueue  [7]=8'b0000_0000;
               P2_P2_P2_InstQueue  [8]=8'b0000_0000;
               P2_P2_P2_InstQueue  [9]=8'b0000_0000;
               P2_P2_P2_InstQueue  [10]=8'b0000_0000;
               P2_P2_P2_InstQueue  [11]=8'b0000_0000;
               P2_P2_P2_InstQueue  [12]=8'b0000_0000;
               P2_P2_P2_InstQueue  [13]=8'b0000_0000;
               P2_P2_P2_InstQueue  [14]=8'b0000_0000;
               P2_P2_P2_InstQueue  [15]=8'b0000_0000;
               P2_P2_P2_InstQueueRd_Addr  =0;
               P2_P2_P2_InstQueueWr_Addr  =0;
               P2_P2_P2_InstAddrPointer  =0;
               P2_P2_P2_PhyAddrPointer  =0;
               P2_P2_P2_Extended  =1'b0;
               P2_P2_P2_More  =1'b0;
               P2_P2_P2_Flush  =1'b0;
               P2_P2_P2_lWord  =0;
               P2_P2_P2_uWord  =0;
               P2_P2_P2_fWord  =0;
               P2_P2_P2_CodeFetch  <=1'b0;
               P2_P2_P2_Datao  <=0;
               P2_P2_P2_EAX  <=0;
               P2_P2_P2_EBX  <=0;
               P2_P2_P2_rEIP  <=0;
               P2_P2_P2_ReadRequest  <=1'b0;
               P2_P2_P2_MemoryFetch  <=1'b0;
               P2_P2_P2_RequestPending  <=1'b0;
            end 
          else 
            case ( P2_P2_P2_State2 )
              P2_P2_P2_Si  :
                begin 
                   P2_P2_P2_PhyAddrPointer  = P2_P2_P2_rEIP ;
                   P2_P2_P2_InstAddrPointer  = P2_P2_P2_PhyAddrPointer ;
                   P2_P2_P2_State2  = P2_P2_P2_S1 ;
                   P2_P2_P2_rEIP  <=20'hFFFF0;
                   P2_P2_P2_ReadRequest  <=1'b1;
                   P2_P2_P2_MemoryFetch  <=1'b1;
                   P2_P2_P2_RequestPending  <=1'b1;
                end 
              P2_P2_P2_S1  :
                begin 
                   P2_P2_P2_RequestPending  <= P2_P2_P2_Pending ;
                   P2_P2_P2_ReadRequest  <= P2_P2_P2_Pending ;
                   P2_P2_P2_MemoryFetch  <= P2_P2_P2_Pending ;
                   P2_P2_P2_CodeFetch  <= P2_P2_P2_Pending ;
                  if ( P2_P2_P2_READY_n ==1'b0)
                      P2_P2_P2_State2  = P2_P2_P2_S2 ;
                   else 
                      P2_P2_P2_State2  = P2_P2_P2_S1 ;
                end 
              P2_P2_P2_S2  :
                begin 
                   P2_P2_P2_RequestPending  <= P2_P2_P2_NotPending ;
                   P2_P2_P2_InstQueue  [ P2_P2_P2_InstQueueWr_Addr ]= P2_P2_P2_Datai %(2**8);
                   P2_P2_P2_InstQueueWr_Addr  =( P2_P2_P2_InstQueueWr_Addr +1)%16;
                   P2_P2_P2_InstQueue  [ P2_P2_P2_InstQueueWr_Addr ]= P2_P2_P2_Datai %2**8;
                   P2_P2_P2_InstQueueWr_Addr  =( P2_P2_P2_InstQueueWr_Addr +1)%16;
                  if ( P2_P2_P2_StateBS16 ==1'b1)
                     begin 
                        P2_P2_P2_InstQueue  [ P2_P2_P2_InstQueueWr_Addr ]=( P2_P2_P2_Datai /(2**16))%(2**8);
                        P2_P2_P2_InstQueueWr_Addr  =( P2_P2_P2_InstQueueWr_Addr +1)%16;
                        P2_P2_P2_InstQueue  [ P2_P2_P2_InstQueueWr_Addr ]=( P2_P2_P2_Datai /(2**24))%(2**8);
                        P2_P2_P2_InstQueueWr_Addr  =( P2_P2_P2_InstQueueWr_Addr +1)%16;
                        P2_P2_P2_PhyAddrPointer  = P2_P2_P2_PhyAddrPointer +4;
                        P2_P2_P2_State2  = P2_P2_P2_S5 ;
                     end 
                   else 
                     begin 
                        P2_P2_P2_PhyAddrPointer  = P2_P2_P2_PhyAddrPointer +2;
                       if ( P2_P2_P2_PhyAddrPointer <0)
                           P2_P2_P2_rEIP  <=- P2_P2_P2_PhyAddrPointer ;
                        else 
                           P2_P2_P2_rEIP  <= P2_P2_P2_PhyAddrPointer ;
                        P2_P2_P2_State2  = P2_P2_P2_S3 ;
                     end 
                end 
              P2_P2_P2_S3  :
                begin 
                   P2_P2_P2_RequestPending  <= P2_P2_P2_Pending ;
                  if ( P2_P2_P2_READY_n ==1'b0)
                      P2_P2_P2_State2  = P2_P2_P2_S4 ;
                   else 
                      P2_P2_P2_State2  = P2_P2_P2_S3 ;
                end 
              P2_P2_P2_S4  :
                begin 
                   P2_P2_P2_RequestPending  <= P2_P2_P2_NotPending ;
                   P2_P2_P2_InstQueue  [ P2_P2_P2_InstQueueWr_Addr ]= P2_P2_P2_Datai %(2**8);
                   P2_P2_P2_InstQueueWr_Addr  =( P2_P2_P2_InstQueueWr_Addr +1)%16;
                   P2_P2_P2_InstQueue  [ P2_P2_P2_InstQueueWr_Addr ]= P2_P2_P2_Datai %(2**8);
                   P2_P2_P2_InstQueueWr_Addr  =( P2_P2_P2_InstQueueWr_Addr +1)%16;
                   P2_P2_P2_PhyAddrPointer  = P2_P2_P2_PhyAddrPointer +2;
                   P2_P2_P2_State2  = P2_P2_P2_S5 ;
                end 
              P2_P2_P2_S5  :
                begin 
                  case ( P2_P2_P2_InstQueue [ P2_P2_P2_InstQueueRd_Addr ])
                    P2_P2_P2_NOP  :
                      begin 
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +1;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +1)%16;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                    P2_P2_P2_OPsop  :
                      begin 
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +1;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +1)%16;
                         P2_P2_P2_Extended  =1'b1;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                    P2_P2_P2_JMP_rel_short  :
                      if (( P2_P2_P2_InstQueueWr_Addr - P2_P2_P2_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P2_P2_P2_PhyAddrPointer  = P2_P2_P2_InstAddrPointer +1-(8'hFF- P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +1)%16]);
                                 P2_P2_P2_InstAddrPointer  = P2_P2_P2_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P2_P2_P2_PhyAddrPointer  = P2_P2_P2_InstAddrPointer +2+ P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +1)%16];
                                 P2_P2_P2_InstAddrPointer  = P2_P2_P2_PhyAddrPointer ;
                              end 
                            P2_P2_P2_Flush  =1'b1;
                            P2_P2_P2_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P2_P2_Flush  =1'b0;
                            P2_P2_P2_More  =1'b1;
                         end 
                    P2_P2_P2_JMP_rel_near  :
                      if (( P2_P2_P2_InstQueueWr_Addr - P2_P2_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P2_P2_PhyAddrPointer  = P2_P2_P2_InstAddrPointer +5+ P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +1)%16];
                            P2_P2_P2_InstAddrPointer  = P2_P2_P2_PhyAddrPointer ;
                            P2_P2_P2_Flush  =1'b1;
                            P2_P2_P2_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P2_P2_Flush  =1'b0;
                            P2_P2_P2_More  =1'b1;
                         end 
                    P2_P2_P2_JMP_intseg_immed  :
                      begin 
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +1;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +1)%16;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                    P2_P2_P2_MOV_al_b  :
                      begin 
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +1;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +1)%16;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                    P2_P2_P2_MOV_eax_dw  :
                      if (( P2_P2_P2_InstQueueWr_Addr - P2_P2_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P2_P2_EAX  <= P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +1)%16];
                            P2_P2_P2_More  =1'b0;
                            P2_P2_P2_Flush  =1'b0;
                            P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +5;
                            P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P2_P2_Flush  =1'b0;
                            P2_P2_P2_More  =1'b1;
                         end 
                    P2_P2_P2_MOV_ebx_dw  :
                      if (( P2_P2_P2_InstQueueWr_Addr - P2_P2_P2_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P2_P2_EBX  <= P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P2_P2_InstQueue [( P2_P2_P2_InstQueueRd_Addr +1)%1];
                            P2_P2_P2_More  =1'b0;
                            P2_P2_P2_Flush  =1'b0;
                            P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +5;
                            P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P2_P2_Flush  =1'b0;
                            P2_P2_P2_More  =1'b1;
                         end 
                    P2_P2_P2_MOV_eax_ebx  :
                      if (( P2_P2_P2_InstQueueWr_Addr - P2_P2_P2_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P2_P2_EBX <0)
                               P2_P2_P2_rEIP  <=- P2_P2_P2_EBX ;
                            else 
                               P2_P2_P2_rEIP  <= P2_P2_P2_EBX ;
                            P2_P2_P2_RequestPending  <= P2_P2_P2_Pending ;
                            P2_P2_P2_ReadRequest  <= P2_P2_P2_Pending ;
                            P2_P2_P2_MemoryFetch  <= P2_P2_P2_Pending ;
                            P2_P2_P2_CodeFetch  <= P2_P2_P2_NotPending ;
                           if ( P2_P2_P2_READY_n ==1'b0)
                              begin 
                                 P2_P2_P2_RequestPending  <= P2_P2_P2_NotPending ;
                                 P2_P2_P2_uWord  = P2_P2_P2_Datai %(2**15);
                                if ( P2_P2_P2_StateBS16 ==1'b1)
                                    P2_P2_P2_lWord  = P2_P2_P2_Datai %(2**16);
                                 else 
                                   begin 
                                      P2_P2_P2_rEIP  <= P2_P2_P2_rEIP +2;
                                      P2_P2_P2_RequestPending  <= P2_P2_P2_Pending ;
                                     if ( P2_P2_P2_READY_n ==1'b0)
                                        begin 
                                           P2_P2_P2_RequestPending  <= P2_P2_P2_NotPending ;
                                           P2_P2_P2_lWord  = P2_P2_P2_Datai %(2**16);
                                        end 
                                   end 
                                if ( P2_P2_P2_READY_n ==1'b0)
                                   begin 
                                      P2_P2_P2_EAX  <= P2_P2_P2_uWord *(2**16)+ P2_P2_P2_lWord ;
                                      P2_P2_P2_More  =1'b0;
                                      P2_P2_P2_Flush  =1'b0;
                                      P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +2;
                                      P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P2_Flush  =1'b0;
                            P2_P2_P2_More  =1'b1;
                         end 
                    P2_P2_P2_MOV_ebx_eax  :
                      if (( P2_P2_P2_InstQueueWr_Addr - P2_P2_P2_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P2_P2_EBX <0)
                               P2_P2_P2_rEIP  <= P2_P2_P2_EBX ;
                            else 
                               P2_P2_P2_rEIP  <= P2_P2_P2_EBX ;
                            P2_P2_P2_lWord  = P2_P2_P2_EAX %(2**16);
                            P2_P2_P2_uWord  =( P2_P2_P2_EAX /(2**16))%(2**15);
                            P2_P2_P2_RequestPending  <= P2_P2_P2_Pending ;
                            P2_P2_P2_ReadRequest  <= P2_P2_P2_NotPending ;
                            P2_P2_P2_MemoryFetch  <= P2_P2_P2_Pending ;
                            P2_P2_P2_CodeFetch  <= P2_P2_P2_NotPending ;
                           if ( P2_P2_P2_State == P2_P2_P2_StateT1 | P2_P2_P2_State == P2_P2_P2_StateT1P )
                              begin 
                                 P2_P2_P2_Datao  <=( P2_P2_P2_uWord *(2**16)+ P2_P2_P2_lWord );
                                if ( P2_P2_P2_READY_n ==1'b0)
                                   begin 
                                      P2_P2_P2_RequestPending  <= P2_P2_P2_NotPending ;
                                     if ( P2_P2_P2_StateBS16 ==1'b0)
                                        begin 
                                           P2_P2_P2_rEIP  <= P2_P2_P2_rEIP +2;
                                           P2_P2_P2_RequestPending  <= P2_P2_P2_Pending ;
                                           P2_P2_P2_ReadRequest  <= P2_P2_P2_NotPending ;
                                           P2_P2_P2_MemoryFetch  <= P2_P2_P2_Pending ;
                                           P2_P2_P2_CodeFetch  <= P2_P2_P2_NotPending ;
                                           P2_P2_P2_State2  = P2_P2_P2_S6 ;
                                        end 
                                      P2_P2_P2_More  =1'b0;
                                      P2_P2_P2_Flush  =1'b0;
                                      P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +2;
                                      P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P2_Flush  =1'b0;
                            P2_P2_P2_More  =1'b1;
                         end 
                    P2_P2_P2_IN_al  :
                      if (( P2_P2_P2_InstQueueWr_Addr - P2_P2_P2_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P2_P2_rEIP  <= P2_P2_P2_InstQueueRd_Addr +1;
                            P2_P2_P2_RequestPending  <= P2_P2_P2_Pending ;
                            P2_P2_P2_ReadRequest  <= P2_P2_P2_Pending ;
                            P2_P2_P2_MemoryFetch  <= P2_P2_P2_NotPending ;
                            P2_P2_P2_CodeFetch  <= P2_P2_P2_NotPending ;
                           if ( P2_P2_P2_READY_n ==1'b0)
                              begin 
                                 P2_P2_P2_RequestPending  <= P2_P2_P2_NotPending ;
                                 P2_P2_P2_EAX  <= P2_P2_P2_Datai ;
                                 P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +2;
                                 P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +2);
                                 P2_P2_P2_Flush  =1'b0;
                                 P2_P2_P2_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P2_Flush  =1'b0;
                            P2_P2_P2_More  =1'b1;
                         end 
                    P2_P2_P2_OUT_al  :
                      if (( P2_P2_P2_InstQueueWr_Addr - P2_P2_P2_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P2_P2_rEIP  <= P2_P2_P2_InstQueueRd_Addr +1;
                            P2_P2_P2_RequestPending  <= P2_P2_P2_Pending ;
                            P2_P2_P2_ReadRequest  <= P2_P2_P2_NotPending ;
                            P2_P2_P2_MemoryFetch  <= P2_P2_P2_NotPending ;
                            P2_P2_P2_CodeFetch  <= P2_P2_P2_NotPending ;
                           if ( P2_P2_P2_State == P2_P2_P2_StateT1 | P2_P2_P2_State == P2_P2_P2_StateT1P )
                              begin 
                                 P2_P2_P2_fWord  = P2_P2_P2_EAX %(2**16);
                                 P2_P2_P2_Datao  <= P2_P2_P2_fWord ;
                                if ( P2_P2_P2_READY_n ==1'b0)
                                   begin 
                                      P2_P2_P2_RequestPending  <= P2_P2_P2_NotPending ;
                                      P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +2;
                                      P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +2)%16;
                                      P2_P2_P2_Flush  =1'b0;
                                      P2_P2_P2_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P2_Flush  =1'b0;
                            P2_P2_P2_More  =1'b1;
                         end 
                    P2_P2_P2_ADD_al_b  :
                      begin 
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +1;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +1)%16;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                    P2_P2_P2_ADD_ax_w  :
                      begin 
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +1;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +1)%16;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                    P2_P2_P2_ROL_al_1  :
                      begin 
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +2;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +2)%16;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                    P2_P2_P2_ROL_al_n  :
                      begin 
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +2;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +2)%16;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                    P2_P2_P2_INC_eax  :
                      begin 
                         P2_P2_P2_EAX  <= P2_P2_P2_EAX +1;
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +1;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +1)%16;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                    P2_P2_P2_INC_ebx  :
                      begin 
                         P2_P2_P2_EBX  <= P2_P2_P2_EBX +1;
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +1;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +1)%16;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                   default :
                      begin 
                         P2_P2_P2_InstAddrPointer  = P2_P2_P2_InstAddrPointer +1;
                         P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +1)%16;
                         P2_P2_P2_Flush  =1'b0;
                         P2_P2_P2_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P2_P2_P2_InstQueueRd_Addr < P2_P2_P2_InstQueueWr_Addr ))|((( P2_P2_P2_InstQueueLimit - P2_P2_P2_InstQueueRd_Addr )<4)| P2_P2_P2_Flush | P2_P2_P2_More ))
                      P2_P2_P2_State2  = P2_P2_P2_S7 ;
                end 
              P2_P2_P2_S6  :
                begin 
                   P2_P2_P2_Datao  <=( P2_P2_P2_uWord *(2**16)+ P2_P2_P2_lWord );
                  if ( P2_P2_P2_READY_n ==1'b0)
                     begin 
                        P2_P2_P2_RequestPending  <= P2_P2_P2_NotPending ;
                        P2_P2_P2_State2  = P2_P2_P2_S5 ;
                     end 
                end 
              P2_P2_P2_S7  :
                begin 
                  if ( P2_P2_P2_Flush )
                     begin 
                        P2_P2_P2_InstQueueRd_Addr  =1;
                        P2_P2_P2_InstQueueWr_Addr  =1;
                       if ( P2_P2_P2_InstAddrPointer <0)
                           P2_P2_P2_fWord  =- P2_P2_P2_InstAddrPointer ;
                        else 
                           P2_P2_P2_fWord  = P2_P2_P2_InstAddrPointer ;
                       if ( P2_P2_P2_fWord %2==1)
                           P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr + P2_P2_P2_fWord %4)%16;
                     end 
                  if (( P2_P2_P2_InstQueueLimit - P2_P2_P2_InstQueueRd_Addr )<3)
                     begin 
                        P2_P2_P2_State2  = P2_P2_P2_S8 ;
                        P2_P2_P2_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P2_P2_P2_State2  = P2_P2_P2_S9 ;
                end 
              P2_P2_P2_S8  :
                if ( P2_P2_P2_InstQueueRd_Addr <= P2_P2_P2_InstQueueLimit )
                   begin 
                      P2_P2_P2_InstQueue  [ P2_P2_P2_InstQueueWr_Addr ]= P2_P2_P2_InstQueue [ P2_P2_P2_InstQueueRd_Addr ];
                      P2_P2_P2_InstQueueRd_Addr  =( P2_P2_P2_InstQueueRd_Addr +1)%16;
                      P2_P2_P2_InstQueueWr_Addr  =( P2_P2_P2_InstQueueWr_Addr +1)%16;
                      P2_P2_P2_State2  = P2_P2_P2_S8 ;
                   end 
                 else 
                   begin 
                      P2_P2_P2_InstQueueRd_Addr  =0;
                      P2_P2_P2_State2  = P2_P2_P2_S9 ;
                   end 
              P2_P2_P2_S9  :
                begin 
                   P2_P2_P2_rEIP  <= P2_P2_P2_PhyAddrPointer ;
                   P2_P2_P2_State2  = P2_P2_P2_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P2_P2_P2_CLOCK or posedge  P2_P2_P2_RESET )
       begin 
         if ( P2_P2_P2_RESET ==1'b1)
            begin 
               P2_P2_P2_ByteEnable  <=4'b0000;
               P2_P2_P2_NonAligned  <=1'b0;
            end 
          else 
            case ( P2_P2_P2_DataWidth )
              P2_P2_P2_WidthByte  :
                case ( P2_P2_P2_rEIP %4)
                 0 :
                     P2_P2_P2_ByteEnable  <=4'b1110;
                 1 :
                     P2_P2_P2_ByteEnable  <=4'b1101;
                 2 :
                     P2_P2_P2_ByteEnable  <=4'b1011;
                 3 :
                     P2_P2_P2_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P2_P2_P2_WidthWord  :
                case ( P2_P2_P2_rEIP %4)
                 0 :
                    begin 
                       P2_P2_P2_ByteEnable  <=4'b1100;
                       P2_P2_P2_NonAligned  <= P2_P2_P2_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P2_P2_ByteEnable  <=4'b1001;
                       P2_P2_P2_NonAligned  <= P2_P2_P2_NotPending ;
                    end 
                 2 :
                    begin 
                       P2_P2_P2_ByteEnable  <=4'b0011;
                       P2_P2_P2_NonAligned  <= P2_P2_P2_NotPending ;
                    end 
                 3 :
                    begin 
                       P2_P2_P2_ByteEnable  <=4'b0111;
                       P2_P2_P2_NonAligned  <= P2_P2_P2_Pending ;
                    end 
                 default :;
                endcase 
              P2_P2_P2_WidthDword  :
                case ( P2_P2_P2_rEIP %4)
                 0 :
                    begin 
                       P2_P2_P2_ByteEnable  <=4'b0000;
                       P2_P2_P2_NonAligned  <= P2_P2_P2_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P2_P2_ByteEnable  <=4'b0001;
                       P2_P2_P2_NonAligned  <= P2_P2_P2_Pending ;
                    end 
                 2 :
                    begin 
                       P2_P2_P2_NonAligned  <= P2_P2_P2_Pending ;
                       P2_P2_P2_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P2_P2_P2_NonAligned  <= P2_P2_P2_Pending ;
                       P2_P2_P2_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
 
   reg P2_P2_P3_StateNA ; 
   reg P2_P2_P3_StateBS16 ; 
   reg P2_P2_P3_RequestPending ; 
 parameter P2_P2_P3_Pending =1'b1; 
 parameter P2_P2_P3_NotPending =1'b0; 
   reg P2_P2_P3_NonAligned ; 
   reg P2_P2_P3_ReadRequest ; 
   reg P2_P2_P3_MemoryFetch ; 
   reg P2_P2_P3_CodeFetch ; 
   reg[3:0] P2_P2_P3_ByteEnable ; 
   integer P2_P2_P3_DataWidth ; 
 parameter P2_P2_P3_WidthByte =0; 
 parameter P2_P2_P3_WidthWord =1; 
 parameter P2_P2_P3_WidthDword =2; 
   reg[2:0] P2_P2_P3_State ; 
 parameter P2_P2_P3_StateInit =0; 
 parameter P2_P2_P3_StateTi =1; 
 parameter P2_P2_P3_StateT1 =2; 
 parameter P2_P2_P3_StateT2 =3; 
 parameter P2_P2_P3_StateT1P =4; 
 parameter P2_P2_P3_StateTh =5; 
 parameter P2_P2_P3_StateT2P =6; 
 parameter P2_P2_P3_StateT2I =7; 
   integer P2_P2_P3_EAX ; 
   integer P2_P2_P3_EBX ; 
   integer P2_P2_P3_rEIP ; 
 parameter P2_P2_P3_REP =8'hF3; 
 parameter P2_P2_P3_REPNE =8'hF2; 
 parameter P2_P2_P3_LOCK =8'hF0; 
 parameter P2_P2_P3_CSsop =8'h2E; 
 parameter P2_P2_P3_SSsop =8'h36; 
 parameter P2_P2_P3_DSsop =8'h3E; 
 parameter P2_P2_P3_ESsop =8'h26; 
 parameter P2_P2_P3_FSsop =8'h64; 
 parameter P2_P2_P3_GSsop =8'h65; 
 parameter P2_P2_P3_OPsop =8'h66; 
 parameter P2_P2_P3_ADsop =8'h67; 
 parameter P2_P2_P3_MOV_al_b =8'hB0; 
 parameter P2_P2_P3_MOV_eax_dw =8'hB8; 
 parameter P2_P2_P3_MOV_ebx_dw =8'hBB; 
 parameter P2_P2_P3_MOV_ebx_eax =8'h89; 
 parameter P2_P2_P3_MOV_eax_ebx =8'h8B; 
 parameter P2_P2_P3_IN_al =8'hE4; 
 parameter P2_P2_P3_OUT_al =8'hE6; 
 parameter P2_P2_P3_ADD_al_b =8'h04; 
 parameter P2_P2_P3_ADD_ax_w =8'h05; 
 parameter P2_P2_P3_ROL_eax_b =8'hD1; 
 parameter P2_P2_P3_ROL_al_1 =8'hD0; 
 parameter P2_P2_P3_ROL_al_n =8'hC0; 
 parameter P2_P2_P3_INC_eax =8'h40; 
 parameter P2_P2_P3_INC_ebx =8'h43; 
 parameter P2_P2_P3_JMP_rel_short =8'hEB; 
 parameter P2_P2_P3_JMP_rel_near =8'hE9; 
 parameter P2_P2_P3_JMP_intseg_immed =8'hEA; 
 parameter P2_P2_P3_HLT =8'hF4; 
 parameter P2_P2_P3_WAITx =8'h9B; 
 parameter P2_P2_P3_NOP =8'h90; 
   reg[7:0] P2_P2_P3_InstQueue [15:0]; 
   reg[4:0] P2_P2_P3_InstQueueRd_Addr ; 
   reg[4:0] P2_P2_P3_InstQueueWr_Addr ; 
 parameter P2_P2_P3_InstQueueLimit =15; 
   integer P2_P2_P3_InstAddrPointer ; 
   integer P2_P2_P3_PhyAddrPointer ; 
   reg P2_P2_P3_Extended ; 
   reg P2_P2_P3_More ; 
   reg P2_P2_P3_Flush ; 
   reg[15:0] P2_P2_P3_lWord ; 
   reg[14:0] P2_P2_P3_uWord ; 
   integer P2_P2_P3_fWord ; 
   reg[3:0] P2_P2_P3_State2 ; 
 parameter P2_P2_P3_Si =0; 
 parameter P2_P2_P3_S1 =1; 
 parameter P2_P2_P3_S2 =2; 
 parameter P2_P2_P3_S3 =3; 
 parameter P2_P2_P3_S4 =4; 
 parameter P2_P2_P3_S5 =5; 
 parameter P2_P2_P3_S6 =6; 
 parameter P2_P2_P3_S7 =7; 
 parameter P2_P2_P3_S8 =8; 
 parameter P2_P2_P3_S9 =9; 
  always @(  posedge   P2_P2_P3_CLOCK or posedge  P2_P2_P3_RESET )
       begin 
         if ( P2_P2_P3_RESET ==1'b1)
            begin 
               P2_P2_P3_BE_n  <=4'b0000;
               P2_P2_P3_Address  <=0;
               P2_P2_P3_W_R_n  <=1'b0;
               P2_P2_P3_D_C_n  <=1'b0;
               P2_P2_P3_M_IO_n  <=1'b0;
               P2_P2_P3_ADS_n  <=1'b0;
               P2_P2_P3_State  <= P2_P2_P3_StateInit ;
               P2_P2_P3_StateNA  <=1'b0;
               P2_P2_P3_StateBS16  <=1'b0;
               P2_P2_P3_DataWidth  <=0;
            end 
          else 
            case ( P2_P2_P3_State )
              P2_P2_P3_StateInit  :
                begin 
                   P2_P2_P3_D_C_n  <=1'b1;
                   P2_P2_P3_ADS_n  <=1'b1;
                   P2_P2_P3_State  <= P2_P2_P3_StateTi ;
                   P2_P2_P3_StateNA  <=1'b1;
                   P2_P2_P3_StateBS16  <=1'b1;
                   P2_P2_P3_DataWidth  <=2;
                   P2_P2_P3_State  <= P2_P2_P3_StateTi ;
                end 
              P2_P2_P3_StateTi  :
                if ( P2_P2_P3_RequestPending == P2_P2_P3_Pending )
                    P2_P2_P3_State  <= P2_P2_P3_StateT1 ;
                 else 
                   if ( P2_P2_P3_HOLD ==1'b1)
                       P2_P2_P3_State  <= P2_P2_P3_StateTh ;
                    else 
                       P2_P2_P3_State  <= P2_P2_P3_StateTi ;
              P2_P2_P3_StateT1  :
                begin 
                   P2_P2_P3_Address  <= P2_P2_P3_rEIP /4%2**30;
                   P2_P2_P3_BE_n  <= P2_P2_P3_ByteEnable ;
                   P2_P2_P3_M_IO_n  <= P2_P2_P3_MemoryFetch ;
                  if ( P2_P2_P3_ReadRequest == P2_P2_P3_Pending )
                      P2_P2_P3_W_R_n  <=1'b0;
                   else 
                      P2_P2_P3_W_R_n  <=1'b1;
                  if ( P2_P2_P3_CodeFetch == P2_P2_P3_Pending )
                      P2_P2_P3_D_C_n  <=1'b0;
                   else 
                      P2_P2_P3_D_C_n  <=1'b1;
                   P2_P2_P3_ADS_n  <=1'b0;
                   P2_P2_P3_State  <= P2_P2_P3_StateT2 ;
                end 
              P2_P2_P3_StateT2  :
                begin 
                  if ( P2_P2_P3_READY_n ==1'b0& P2_P2_P3_HOLD ==1'b0& P2_P2_P3_RequestPending == P2_P2_P3_Pending )
                      P2_P2_P3_State  <= P2_P2_P3_StateT1 ;
                   else 
                     if ( P2_P2_P3_READY_n ==1'b1& P2_P2_P3_NA_n ==1'b1);
                      else 
                        if (( P2_P2_P3_RequestPending == P2_P2_P3_Pending | P2_P2_P3_HOLD ==1'b1)&( P2_P2_P3_READY_n ==1'b1& P2_P2_P3_NA_n ==1'b0))
                            P2_P2_P3_State  <= P2_P2_P3_StateT2I ;
                         else 
                           if ( P2_P2_P3_RequestPending == P2_P2_P3_Pending & P2_P2_P3_HOLD ==1'b0& P2_P2_P3_READY_n ==1'b1& P2_P2_P3_NA_n ==1'b0)
                               P2_P2_P3_State  <= P2_P2_P3_StateT2P ;
                            else 
                              if ( P2_P2_P3_RequestPending == P2_P2_P3_NotPending & P2_P2_P3_HOLD ==1'b0& P2_P2_P3_READY_n ==1'b0)
                                  P2_P2_P3_State  <= P2_P2_P3_StateTi ;
                               else 
                                 if ( P2_P2_P3_HOLD ==1'b1& P2_P2_P3_READY_n ==1'b1)
                                     P2_P2_P3_State  <= P2_P2_P3_StateTh ;
                                  else 
                                     P2_P2_P3_State  <= P2_P2_P3_StateT2 ;
                   P2_P2_P3_StateBS16  <= P2_P2_P3_BS16_n ;
                  if ( P2_P2_P3_BS16_n ==1'b0)
                      P2_P2_P3_DataWidth  <= P2_P2_P3_WidthWord ;
                   else 
                      P2_P2_P3_DataWidth  <= P2_P2_P3_WidthDword ;
                   P2_P2_P3_StateNA  <= P2_P2_P3_NA_n ;
                   P2_P2_P3_ADS_n  <=1'b1;
                end 
              P2_P2_P3_StateT1P  :
                begin 
                  if ( P2_P2_P3_NA_n ==1'b0& P2_P2_P3_HOLD ==1'b0& P2_P2_P3_RequestPending == P2_P2_P3_Pending )
                      P2_P2_P3_State  <= P2_P2_P3_StateT2P ;
                   else 
                     if ( P2_P2_P3_NA_n ==1'b0&( P2_P2_P3_HOLD ==1'b1| P2_P2_P3_RequestPending == P2_P2_P3_NotPending ))
                         P2_P2_P3_State  <= P2_P2_P3_StateT2I ;
                      else 
                        if ( P2_P2_P3_NA_n ==1'b1)
                            P2_P2_P3_State  <= P2_P2_P3_StateT2 ;
                         else 
                            P2_P2_P3_State  <= P2_P2_P3_StateT1P ;
                   P2_P2_P3_StateBS16  <= P2_P2_P3_BS16_n ;
                  if ( P2_P2_P3_BS16_n ==1'b0)
                      P2_P2_P3_DataWidth  <= P2_P2_P3_WidthWord ;
                   else 
                      P2_P2_P3_DataWidth  <= P2_P2_P3_WidthDword ;
                   P2_P2_P3_StateNA  <= P2_P2_P3_NA_n ;
                   P2_P2_P3_ADS_n  <=1'b1;
                end 
              P2_P2_P3_StateTh  :
                if ( P2_P2_P3_HOLD ==1'b0& P2_P2_P3_RequestPending == P2_P2_P3_Pending )
                    P2_P2_P3_State  <= P2_P2_P3_StateT1 ;
                 else 
                   if ( P2_P2_P3_HOLD ==1'b0& P2_P2_P3_RequestPending == P2_P2_P3_NotPending )
                       P2_P2_P3_State  <= P2_P2_P3_StateTi ;
                    else 
                       P2_P2_P3_State  <= P2_P2_P3_StateTh ;
              P2_P2_P3_StateT2P  :
                begin 
                   P2_P2_P3_Address  <= P2_P2_P3_rEIP /2%2**30;
                   P2_P2_P3_BE_n  <= P2_P2_P3_ByteEnable ;
                   P2_P2_P3_M_IO_n  <= P2_P2_P3_MemoryFetch ;
                  if ( P2_P2_P3_ReadRequest == P2_P2_P3_Pending )
                      P2_P2_P3_W_R_n  <=1'b0;
                   else 
                      P2_P2_P3_W_R_n  <=1'b1;
                  if ( P2_P2_P3_CodeFetch == P2_P2_P3_Pending )
                      P2_P2_P3_D_C_n  <=1'b0;
                   else 
                      P2_P2_P3_D_C_n  <=1'b1;
                   P2_P2_P3_ADS_n  <=1'b0;
                  if ( P2_P2_P3_READY_n ==1'b0)
                      P2_P2_P3_State  <= P2_P2_P3_StateT1P ;
                   else 
                      P2_P2_P3_State  <= P2_P2_P3_StateT2P ;
                end 
              P2_P2_P3_StateT2I  :
                if ( P2_P2_P3_READY_n ==1'b1& P2_P2_P3_RequestPending == P2_P2_P3_Pending & P2_P2_P3_HOLD ==1'b0)
                    P2_P2_P3_State  <= P2_P2_P3_StateT2P ;
                 else 
                   if ( P2_P2_P3_READY_n ==1'b0& P2_P2_P3_HOLD ==1'b1)
                       P2_P2_P3_State  <= P2_P2_P3_StateTh ;
                    else 
                      if ( P2_P2_P3_READY_n ==1'b0& P2_P2_P3_HOLD ==1'b0& P2_P2_P3_RequestPending == P2_P2_P3_Pending )
                          P2_P2_P3_State  <= P2_P2_P3_StateT1 ;
                       else 
                         if ( P2_P2_P3_READY_n ==1'b0& P2_P2_P3_HOLD ==1'b0& P2_P2_P3_RequestPending == P2_P2_P3_NotPending )
                             P2_P2_P3_State  <= P2_P2_P3_StateTi ;
                          else 
                             P2_P2_P3_State  <= P2_P2_P3_StateT2I ;
            endcase 
       end
  
  always @(  posedge   P2_P2_P3_CLOCK or posedge  P2_P2_P3_RESET )
       begin 
         if ( P2_P2_P3_RESET ==1'b1)
            begin 
               P2_P2_P3_State2  = P2_P2_P3_Si ;
               P2_P2_P3_InstQueue  [0]=8'b0000_0000;
               P2_P2_P3_InstQueue  [1]=8'b0000_0000;
               P2_P2_P3_InstQueue  [2]=8'b0000_0000;
               P2_P2_P3_InstQueue  [3]=8'b0000_0000;
               P2_P2_P3_InstQueue  [4]=8'b0000_0000;
               P2_P2_P3_InstQueue  [5]=8'b0000_0000;
               P2_P2_P3_InstQueue  [6]=8'b0000_0000;
               P2_P2_P3_InstQueue  [7]=8'b0000_0000;
               P2_P2_P3_InstQueue  [8]=8'b0000_0000;
               P2_P2_P3_InstQueue  [9]=8'b0000_0000;
               P2_P2_P3_InstQueue  [10]=8'b0000_0000;
               P2_P2_P3_InstQueue  [11]=8'b0000_0000;
               P2_P2_P3_InstQueue  [12]=8'b0000_0000;
               P2_P2_P3_InstQueue  [13]=8'b0000_0000;
               P2_P2_P3_InstQueue  [14]=8'b0000_0000;
               P2_P2_P3_InstQueue  [15]=8'b0000_0000;
               P2_P2_P3_InstQueueRd_Addr  =0;
               P2_P2_P3_InstQueueWr_Addr  =0;
               P2_P2_P3_InstAddrPointer  =0;
               P2_P2_P3_PhyAddrPointer  =0;
               P2_P2_P3_Extended  =1'b0;
               P2_P2_P3_More  =1'b0;
               P2_P2_P3_Flush  =1'b0;
               P2_P2_P3_lWord  =0;
               P2_P2_P3_uWord  =0;
               P2_P2_P3_fWord  =0;
               P2_P2_P3_CodeFetch  <=1'b0;
               P2_P2_P3_Datao  <=0;
               P2_P2_P3_EAX  <=0;
               P2_P2_P3_EBX  <=0;
               P2_P2_P3_rEIP  <=0;
               P2_P2_P3_ReadRequest  <=1'b0;
               P2_P2_P3_MemoryFetch  <=1'b0;
               P2_P2_P3_RequestPending  <=1'b0;
            end 
          else 
            case ( P2_P2_P3_State2 )
              P2_P2_P3_Si  :
                begin 
                   P2_P2_P3_PhyAddrPointer  = P2_P2_P3_rEIP ;
                   P2_P2_P3_InstAddrPointer  = P2_P2_P3_PhyAddrPointer ;
                   P2_P2_P3_State2  = P2_P2_P3_S1 ;
                   P2_P2_P3_rEIP  <=20'hFFFF0;
                   P2_P2_P3_ReadRequest  <=1'b1;
                   P2_P2_P3_MemoryFetch  <=1'b1;
                   P2_P2_P3_RequestPending  <=1'b1;
                end 
              P2_P2_P3_S1  :
                begin 
                   P2_P2_P3_RequestPending  <= P2_P2_P3_Pending ;
                   P2_P2_P3_ReadRequest  <= P2_P2_P3_Pending ;
                   P2_P2_P3_MemoryFetch  <= P2_P2_P3_Pending ;
                   P2_P2_P3_CodeFetch  <= P2_P2_P3_Pending ;
                  if ( P2_P2_P3_READY_n ==1'b0)
                      P2_P2_P3_State2  = P2_P2_P3_S2 ;
                   else 
                      P2_P2_P3_State2  = P2_P2_P3_S1 ;
                end 
              P2_P2_P3_S2  :
                begin 
                   P2_P2_P3_RequestPending  <= P2_P2_P3_NotPending ;
                   P2_P2_P3_InstQueue  [ P2_P2_P3_InstQueueWr_Addr ]= P2_P2_P3_Datai %(2**8);
                   P2_P2_P3_InstQueueWr_Addr  =( P2_P2_P3_InstQueueWr_Addr +1)%16;
                   P2_P2_P3_InstQueue  [ P2_P2_P3_InstQueueWr_Addr ]= P2_P2_P3_Datai %2**8;
                   P2_P2_P3_InstQueueWr_Addr  =( P2_P2_P3_InstQueueWr_Addr +1)%16;
                  if ( P2_P2_P3_StateBS16 ==1'b1)
                     begin 
                        P2_P2_P3_InstQueue  [ P2_P2_P3_InstQueueWr_Addr ]=( P2_P2_P3_Datai /(2**16))%(2**8);
                        P2_P2_P3_InstQueueWr_Addr  =( P2_P2_P3_InstQueueWr_Addr +1)%16;
                        P2_P2_P3_InstQueue  [ P2_P2_P3_InstQueueWr_Addr ]=( P2_P2_P3_Datai /(2**24))%(2**8);
                        P2_P2_P3_InstQueueWr_Addr  =( P2_P2_P3_InstQueueWr_Addr +1)%16;
                        P2_P2_P3_PhyAddrPointer  = P2_P2_P3_PhyAddrPointer +4;
                        P2_P2_P3_State2  = P2_P2_P3_S5 ;
                     end 
                   else 
                     begin 
                        P2_P2_P3_PhyAddrPointer  = P2_P2_P3_PhyAddrPointer +2;
                       if ( P2_P2_P3_PhyAddrPointer <0)
                           P2_P2_P3_rEIP  <=- P2_P2_P3_PhyAddrPointer ;
                        else 
                           P2_P2_P3_rEIP  <= P2_P2_P3_PhyAddrPointer ;
                        P2_P2_P3_State2  = P2_P2_P3_S3 ;
                     end 
                end 
              P2_P2_P3_S3  :
                begin 
                   P2_P2_P3_RequestPending  <= P2_P2_P3_Pending ;
                  if ( P2_P2_P3_READY_n ==1'b0)
                      P2_P2_P3_State2  = P2_P2_P3_S4 ;
                   else 
                      P2_P2_P3_State2  = P2_P2_P3_S3 ;
                end 
              P2_P2_P3_S4  :
                begin 
                   P2_P2_P3_RequestPending  <= P2_P2_P3_NotPending ;
                   P2_P2_P3_InstQueue  [ P2_P2_P3_InstQueueWr_Addr ]= P2_P2_P3_Datai %(2**8);
                   P2_P2_P3_InstQueueWr_Addr  =( P2_P2_P3_InstQueueWr_Addr +1)%16;
                   P2_P2_P3_InstQueue  [ P2_P2_P3_InstQueueWr_Addr ]= P2_P2_P3_Datai %(2**8);
                   P2_P2_P3_InstQueueWr_Addr  =( P2_P2_P3_InstQueueWr_Addr +1)%16;
                   P2_P2_P3_PhyAddrPointer  = P2_P2_P3_PhyAddrPointer +2;
                   P2_P2_P3_State2  = P2_P2_P3_S5 ;
                end 
              P2_P2_P3_S5  :
                begin 
                  case ( P2_P2_P3_InstQueue [ P2_P2_P3_InstQueueRd_Addr ])
                    P2_P2_P3_NOP  :
                      begin 
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +1;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +1)%16;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                    P2_P2_P3_OPsop  :
                      begin 
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +1;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +1)%16;
                         P2_P2_P3_Extended  =1'b1;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                    P2_P2_P3_JMP_rel_short  :
                      if (( P2_P2_P3_InstQueueWr_Addr - P2_P2_P3_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P2_P2_P3_PhyAddrPointer  = P2_P2_P3_InstAddrPointer +1-(8'hFF- P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +1)%16]);
                                 P2_P2_P3_InstAddrPointer  = P2_P2_P3_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P2_P2_P3_PhyAddrPointer  = P2_P2_P3_InstAddrPointer +2+ P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +1)%16];
                                 P2_P2_P3_InstAddrPointer  = P2_P2_P3_PhyAddrPointer ;
                              end 
                            P2_P2_P3_Flush  =1'b1;
                            P2_P2_P3_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P2_P3_Flush  =1'b0;
                            P2_P2_P3_More  =1'b1;
                         end 
                    P2_P2_P3_JMP_rel_near  :
                      if (( P2_P2_P3_InstQueueWr_Addr - P2_P2_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P2_P3_PhyAddrPointer  = P2_P2_P3_InstAddrPointer +5+ P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +1)%16];
                            P2_P2_P3_InstAddrPointer  = P2_P2_P3_PhyAddrPointer ;
                            P2_P2_P3_Flush  =1'b1;
                            P2_P2_P3_More  =1'b0;
                         end 
                       else 
                         begin 
                            P2_P2_P3_Flush  =1'b0;
                            P2_P2_P3_More  =1'b1;
                         end 
                    P2_P2_P3_JMP_intseg_immed  :
                      begin 
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +1;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +1)%16;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                    P2_P2_P3_MOV_al_b  :
                      begin 
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +1;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +1)%16;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                    P2_P2_P3_MOV_eax_dw  :
                      if (( P2_P2_P3_InstQueueWr_Addr - P2_P2_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P2_P3_EAX  <= P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +1)%16];
                            P2_P2_P3_More  =1'b0;
                            P2_P2_P3_Flush  =1'b0;
                            P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +5;
                            P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P2_P3_Flush  =1'b0;
                            P2_P2_P3_More  =1'b1;
                         end 
                    P2_P2_P3_MOV_ebx_dw  :
                      if (( P2_P2_P3_InstQueueWr_Addr - P2_P2_P3_InstQueueRd_Addr )>=5)
                         begin 
                            P2_P2_P3_EBX  <= P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +4)%16]*(2**23)+ P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +3)%16]*(2**16)+ P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +2)%16]*(2**8)+ P2_P2_P3_InstQueue [( P2_P2_P3_InstQueueRd_Addr +1)%1];
                            P2_P2_P3_More  =1'b0;
                            P2_P2_P3_Flush  =1'b0;
                            P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +5;
                            P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P2_P2_P3_Flush  =1'b0;
                            P2_P2_P3_More  =1'b1;
                         end 
                    P2_P2_P3_MOV_eax_ebx  :
                      if (( P2_P2_P3_InstQueueWr_Addr - P2_P2_P3_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P2_P3_EBX <0)
                               P2_P2_P3_rEIP  <=- P2_P2_P3_EBX ;
                            else 
                               P2_P2_P3_rEIP  <= P2_P2_P3_EBX ;
                            P2_P2_P3_RequestPending  <= P2_P2_P3_Pending ;
                            P2_P2_P3_ReadRequest  <= P2_P2_P3_Pending ;
                            P2_P2_P3_MemoryFetch  <= P2_P2_P3_Pending ;
                            P2_P2_P3_CodeFetch  <= P2_P2_P3_NotPending ;
                           if ( P2_P2_P3_READY_n ==1'b0)
                              begin 
                                 P2_P2_P3_RequestPending  <= P2_P2_P3_NotPending ;
                                 P2_P2_P3_uWord  = P2_P2_P3_Datai %(2**15);
                                if ( P2_P2_P3_StateBS16 ==1'b1)
                                    P2_P2_P3_lWord  = P2_P2_P3_Datai %(2**16);
                                 else 
                                   begin 
                                      P2_P2_P3_rEIP  <= P2_P2_P3_rEIP +2;
                                      P2_P2_P3_RequestPending  <= P2_P2_P3_Pending ;
                                     if ( P2_P2_P3_READY_n ==1'b0)
                                        begin 
                                           P2_P2_P3_RequestPending  <= P2_P2_P3_NotPending ;
                                           P2_P2_P3_lWord  = P2_P2_P3_Datai %(2**16);
                                        end 
                                   end 
                                if ( P2_P2_P3_READY_n ==1'b0)
                                   begin 
                                      P2_P2_P3_EAX  <= P2_P2_P3_uWord *(2**16)+ P2_P2_P3_lWord ;
                                      P2_P2_P3_More  =1'b0;
                                      P2_P2_P3_Flush  =1'b0;
                                      P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +2;
                                      P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P3_Flush  =1'b0;
                            P2_P2_P3_More  =1'b1;
                         end 
                    P2_P2_P3_MOV_ebx_eax  :
                      if (( P2_P2_P3_InstQueueWr_Addr - P2_P2_P3_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P2_P2_P3_EBX <0)
                               P2_P2_P3_rEIP  <= P2_P2_P3_EBX ;
                            else 
                               P2_P2_P3_rEIP  <= P2_P2_P3_EBX ;
                            P2_P2_P3_lWord  = P2_P2_P3_EAX %(2**16);
                            P2_P2_P3_uWord  =( P2_P2_P3_EAX /(2**16))%(2**15);
                            P2_P2_P3_RequestPending  <= P2_P2_P3_Pending ;
                            P2_P2_P3_ReadRequest  <= P2_P2_P3_NotPending ;
                            P2_P2_P3_MemoryFetch  <= P2_P2_P3_Pending ;
                            P2_P2_P3_CodeFetch  <= P2_P2_P3_NotPending ;
                           if ( P2_P2_P3_State == P2_P2_P3_StateT1 | P2_P2_P3_State == P2_P2_P3_StateT1P )
                              begin 
                                 P2_P2_P3_Datao  <=( P2_P2_P3_uWord *(2**16)+ P2_P2_P3_lWord );
                                if ( P2_P2_P3_READY_n ==1'b0)
                                   begin 
                                      P2_P2_P3_RequestPending  <= P2_P2_P3_NotPending ;
                                     if ( P2_P2_P3_StateBS16 ==1'b0)
                                        begin 
                                           P2_P2_P3_rEIP  <= P2_P2_P3_rEIP +2;
                                           P2_P2_P3_RequestPending  <= P2_P2_P3_Pending ;
                                           P2_P2_P3_ReadRequest  <= P2_P2_P3_NotPending ;
                                           P2_P2_P3_MemoryFetch  <= P2_P2_P3_Pending ;
                                           P2_P2_P3_CodeFetch  <= P2_P2_P3_NotPending ;
                                           P2_P2_P3_State2  = P2_P2_P3_S6 ;
                                        end 
                                      P2_P2_P3_More  =1'b0;
                                      P2_P2_P3_Flush  =1'b0;
                                      P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +2;
                                      P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P3_Flush  =1'b0;
                            P2_P2_P3_More  =1'b1;
                         end 
                    P2_P2_P3_IN_al  :
                      if (( P2_P2_P3_InstQueueWr_Addr - P2_P2_P3_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P2_P3_rEIP  <= P2_P2_P3_InstQueueRd_Addr +1;
                            P2_P2_P3_RequestPending  <= P2_P2_P3_Pending ;
                            P2_P2_P3_ReadRequest  <= P2_P2_P3_Pending ;
                            P2_P2_P3_MemoryFetch  <= P2_P2_P3_NotPending ;
                            P2_P2_P3_CodeFetch  <= P2_P2_P3_NotPending ;
                           if ( P2_P2_P3_READY_n ==1'b0)
                              begin 
                                 P2_P2_P3_RequestPending  <= P2_P2_P3_NotPending ;
                                 P2_P2_P3_EAX  <= P2_P2_P3_Datai ;
                                 P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +2;
                                 P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +2);
                                 P2_P2_P3_Flush  =1'b0;
                                 P2_P2_P3_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P3_Flush  =1'b0;
                            P2_P2_P3_More  =1'b1;
                         end 
                    P2_P2_P3_OUT_al  :
                      if (( P2_P2_P3_InstQueueWr_Addr - P2_P2_P3_InstQueueRd_Addr )>=2)
                         begin 
                            P2_P2_P3_rEIP  <= P2_P2_P3_InstQueueRd_Addr +1;
                            P2_P2_P3_RequestPending  <= P2_P2_P3_Pending ;
                            P2_P2_P3_ReadRequest  <= P2_P2_P3_NotPending ;
                            P2_P2_P3_MemoryFetch  <= P2_P2_P3_NotPending ;
                            P2_P2_P3_CodeFetch  <= P2_P2_P3_NotPending ;
                           if ( P2_P2_P3_State == P2_P2_P3_StateT1 | P2_P2_P3_State == P2_P2_P3_StateT1P )
                              begin 
                                 P2_P2_P3_fWord  = P2_P2_P3_EAX %(2**16);
                                 P2_P2_P3_Datao  <= P2_P2_P3_fWord ;
                                if ( P2_P2_P3_READY_n ==1'b0)
                                   begin 
                                      P2_P2_P3_RequestPending  <= P2_P2_P3_NotPending ;
                                      P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +2;
                                      P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +2)%16;
                                      P2_P2_P3_Flush  =1'b0;
                                      P2_P2_P3_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P2_P2_P3_Flush  =1'b0;
                            P2_P2_P3_More  =1'b1;
                         end 
                    P2_P2_P3_ADD_al_b  :
                      begin 
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +1;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +1)%16;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                    P2_P2_P3_ADD_ax_w  :
                      begin 
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +1;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +1)%16;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                    P2_P2_P3_ROL_al_1  :
                      begin 
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +2;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +2)%16;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                    P2_P2_P3_ROL_al_n  :
                      begin 
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +2;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +2)%16;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                    P2_P2_P3_INC_eax  :
                      begin 
                         P2_P2_P3_EAX  <= P2_P2_P3_EAX +1;
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +1;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +1)%16;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                    P2_P2_P3_INC_ebx  :
                      begin 
                         P2_P2_P3_EBX  <= P2_P2_P3_EBX +1;
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +1;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +1)%16;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                   default :
                      begin 
                         P2_P2_P3_InstAddrPointer  = P2_P2_P3_InstAddrPointer +1;
                         P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +1)%16;
                         P2_P2_P3_Flush  =1'b0;
                         P2_P2_P3_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P2_P2_P3_InstQueueRd_Addr < P2_P2_P3_InstQueueWr_Addr ))|((( P2_P2_P3_InstQueueLimit - P2_P2_P3_InstQueueRd_Addr )<4)| P2_P2_P3_Flush | P2_P2_P3_More ))
                      P2_P2_P3_State2  = P2_P2_P3_S7 ;
                end 
              P2_P2_P3_S6  :
                begin 
                   P2_P2_P3_Datao  <=( P2_P2_P3_uWord *(2**16)+ P2_P2_P3_lWord );
                  if ( P2_P2_P3_READY_n ==1'b0)
                     begin 
                        P2_P2_P3_RequestPending  <= P2_P2_P3_NotPending ;
                        P2_P2_P3_State2  = P2_P2_P3_S5 ;
                     end 
                end 
              P2_P2_P3_S7  :
                begin 
                  if ( P2_P2_P3_Flush )
                     begin 
                        P2_P2_P3_InstQueueRd_Addr  =1;
                        P2_P2_P3_InstQueueWr_Addr  =1;
                       if ( P2_P2_P3_InstAddrPointer <0)
                           P2_P2_P3_fWord  =- P2_P2_P3_InstAddrPointer ;
                        else 
                           P2_P2_P3_fWord  = P2_P2_P3_InstAddrPointer ;
                       if ( P2_P2_P3_fWord %2==1)
                           P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr + P2_P2_P3_fWord %4)%16;
                     end 
                  if (( P2_P2_P3_InstQueueLimit - P2_P2_P3_InstQueueRd_Addr )<3)
                     begin 
                        P2_P2_P3_State2  = P2_P2_P3_S8 ;
                        P2_P2_P3_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P2_P2_P3_State2  = P2_P2_P3_S9 ;
                end 
              P2_P2_P3_S8  :
                if ( P2_P2_P3_InstQueueRd_Addr <= P2_P2_P3_InstQueueLimit )
                   begin 
                      P2_P2_P3_InstQueue  [ P2_P2_P3_InstQueueWr_Addr ]= P2_P2_P3_InstQueue [ P2_P2_P3_InstQueueRd_Addr ];
                      P2_P2_P3_InstQueueRd_Addr  =( P2_P2_P3_InstQueueRd_Addr +1)%16;
                      P2_P2_P3_InstQueueWr_Addr  =( P2_P2_P3_InstQueueWr_Addr +1)%16;
                      P2_P2_P3_State2  = P2_P2_P3_S8 ;
                   end 
                 else 
                   begin 
                      P2_P2_P3_InstQueueRd_Addr  =0;
                      P2_P2_P3_State2  = P2_P2_P3_S9 ;
                   end 
              P2_P2_P3_S9  :
                begin 
                   P2_P2_P3_rEIP  <= P2_P2_P3_PhyAddrPointer ;
                   P2_P2_P3_State2  = P2_P2_P3_S1 ;
                end 
            endcase 
       end
  
  always @(  posedge   P2_P2_P3_CLOCK or posedge  P2_P2_P3_RESET )
       begin 
         if ( P2_P2_P3_RESET ==1'b1)
            begin 
               P2_P2_P3_ByteEnable  <=4'b0000;
               P2_P2_P3_NonAligned  <=1'b0;
            end 
          else 
            case ( P2_P2_P3_DataWidth )
              P2_P2_P3_WidthByte  :
                case ( P2_P2_P3_rEIP %4)
                 0 :
                     P2_P2_P3_ByteEnable  <=4'b1110;
                 1 :
                     P2_P2_P3_ByteEnable  <=4'b1101;
                 2 :
                     P2_P2_P3_ByteEnable  <=4'b1011;
                 3 :
                     P2_P2_P3_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P2_P2_P3_WidthWord  :
                case ( P2_P2_P3_rEIP %4)
                 0 :
                    begin 
                       P2_P2_P3_ByteEnable  <=4'b1100;
                       P2_P2_P3_NonAligned  <= P2_P2_P3_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P2_P3_ByteEnable  <=4'b1001;
                       P2_P2_P3_NonAligned  <= P2_P2_P3_NotPending ;
                    end 
                 2 :
                    begin 
                       P2_P2_P3_ByteEnable  <=4'b0011;
                       P2_P2_P3_NonAligned  <= P2_P2_P3_NotPending ;
                    end 
                 3 :
                    begin 
                       P2_P2_P3_ByteEnable  <=4'b0111;
                       P2_P2_P3_NonAligned  <= P2_P2_P3_Pending ;
                    end 
                 default :;
                endcase 
              P2_P2_P3_WidthDword  :
                case ( P2_P2_P3_rEIP %4)
                 0 :
                    begin 
                       P2_P2_P3_ByteEnable  <=4'b0000;
                       P2_P2_P3_NonAligned  <= P2_P2_P3_NotPending ;
                    end 
                 1 :
                    begin 
                       P2_P2_P3_ByteEnable  <=4'b0001;
                       P2_P2_P3_NonAligned  <= P2_P2_P3_Pending ;
                    end 
                 2 :
                    begin 
                       P2_P2_P3_NonAligned  <= P2_P2_P3_Pending ;
                       P2_P2_P3_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P2_P2_P3_NonAligned  <= P2_P2_P3_Pending ;
                       P2_P2_P3_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_W_R_n;
assign P1_P1_dc1 = P1_P1_P1_D_C_n;
assign P1_P1_mio1 = P1_P1_P1_M_IO_n;
assign P1_P1_ads1 = P1_P1_P1_ADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_Datao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
assign P1_P1_be2 = P1_P1_P2_BE_n;
assign P1_P1_addr2 = P1_P1_P2_Address;
assign P1_P1_wr2 = P1_P1_P2_W_R_n;
assign P1_P1_dc2 = P1_P1_P2_D_C_n;
assign P1_P1_mio2 = P1_P1_P2_M_IO_n;
assign P1_P1_ads2 = P1_P1_P2_ADS_n;
assign P1_P1_P2_Datai = P1_P1_di2;
assign P1_P1_do2 = P1_P1_P2_Datao;
assign P1_P1_P2_CLOCK = P1_P1_clock;
assign P1_P1_P2_NA_n = P1_P1_na;
assign P1_P1_P2_BS16_n = P1_P1_bs16;
assign P1_P1_P2_READY_n = P1_P1_rdy2;
assign P1_P1_P2_HOLD = P1_P1_hold;
assign P1_P1_P2_RESET = P1_P1_reset;
assign P1_P1_be3 = P1_P1_P3_BE_n;
assign P1_P1_addr3 = P1_P1_P3_Address;
assign P1_P1_wr3 = P1_P1_P3_W_R_n;
assign P1_P1_dc3 = P1_P1_P3_D_C_n;
assign P1_P1_mio3 = P1_P1_P3_M_IO_n;
assign P1_P1_ads3 = P1_P1_P3_ADS_n;
assign P1_P1_P3_Datai = P1_P1_di3;
assign P1_P1_do3 = P1_P1_P3_Datao;
assign P1_P1_P3_CLOCK = P1_P1_clock;
assign P1_P1_P3_NA_n = P1_P1_na;
assign P1_P1_P3_BS16_n = P1_P1_bs16;
assign P1_P1_P3_READY_n = P1_P1_rdy3;
assign P1_P1_P3_HOLD = P1_P1_hold;
assign P1_P1_P3_RESET = P1_P1_reset;
assign P1_P2_be1 = P1_P2_P1_BE_n;
assign P1_P2_addr1 = P1_P2_P1_Address;
assign P1_P2_wr1 = P1_P2_P1_W_R_n;
assign P1_P2_dc1 = P1_P2_P1_D_C_n;
assign P1_P2_mio1 = P1_P2_P1_M_IO_n;
assign P1_P2_ads1 = P1_P2_P1_ADS_n;
assign P1_P2_P1_Datai = P1_P2_di1;
assign P1_P2_do1 = P1_P2_P1_Datao;
assign P1_P2_P1_CLOCK = P1_P2_clock;
assign P1_P2_P1_NA_n = P1_P2_na;
assign P1_P2_P1_BS16_n = P1_P2_bs16;
assign P1_P2_P1_READY_n = P1_P2_rdy1;
assign P1_P2_P1_HOLD = P1_P2_hold;
assign P1_P2_P1_RESET = P1_P2_reset;
assign P1_P2_be2 = P1_P2_P2_BE_n;
assign P1_P2_addr2 = P1_P2_P2_Address;
assign P1_P2_wr2 = P1_P2_P2_W_R_n;
assign P1_P2_dc2 = P1_P2_P2_D_C_n;
assign P1_P2_mio2 = P1_P2_P2_M_IO_n;
assign P1_P2_ads2 = P1_P2_P2_ADS_n;
assign P1_P2_P2_Datai = P1_P2_di2;
assign P1_P2_do2 = P1_P2_P2_Datao;
assign P1_P2_P2_CLOCK = P1_P2_clock;
assign P1_P2_P2_NA_n = P1_P2_na;
assign P1_P2_P2_BS16_n = P1_P2_bs16;
assign P1_P2_P2_READY_n = P1_P2_rdy2;
assign P1_P2_P2_HOLD = P1_P2_hold;
assign P1_P2_P2_RESET = P1_P2_reset;
assign P1_P2_be3 = P1_P2_P3_BE_n;
assign P1_P2_addr3 = P1_P2_P3_Address;
assign P1_P2_wr3 = P1_P2_P3_W_R_n;
assign P1_P2_dc3 = P1_P2_P3_D_C_n;
assign P1_P2_mio3 = P1_P2_P3_M_IO_n;
assign P1_P2_ads3 = P1_P2_P3_ADS_n;
assign P1_P2_P3_Datai = P1_P2_di3;
assign P1_P2_do3 = P1_P2_P3_Datao;
assign P1_P2_P3_CLOCK = P1_P2_clock;
assign P1_P2_P3_NA_n = P1_P2_na;
assign P1_P2_P3_BS16_n = P1_P2_bs16;
assign P1_P2_P3_READY_n = P1_P2_rdy3;
assign P1_P2_P3_HOLD = P1_P2_hold;
assign P1_P2_P3_RESET = P1_P2_reset;
assign P2_P1_be1 = P2_P1_P1_BE_n;
assign P2_P1_addr1 = P2_P1_P1_Address;
assign P2_P1_wr1 = P2_P1_P1_W_R_n;
assign P2_P1_dc1 = P2_P1_P1_D_C_n;
assign P2_P1_mio1 = P2_P1_P1_M_IO_n;
assign P2_P1_ads1 = P2_P1_P1_ADS_n;
assign P2_P1_P1_Datai = P2_P1_di1;
assign P2_P1_do1 = P2_P1_P1_Datao;
assign P2_P1_P1_CLOCK = P2_P1_clock;
assign P2_P1_P1_NA_n = P2_P1_na;
assign P2_P1_P1_BS16_n = P2_P1_bs16;
assign P2_P1_P1_READY_n = P2_P1_rdy1;
assign P2_P1_P1_HOLD = P2_P1_hold;
assign P2_P1_P1_RESET = P2_P1_reset;
assign P2_P1_be2 = P2_P1_P2_BE_n;
assign P2_P1_addr2 = P2_P1_P2_Address;
assign P2_P1_wr2 = P2_P1_P2_W_R_n;
assign P2_P1_dc2 = P2_P1_P2_D_C_n;
assign P2_P1_mio2 = P2_P1_P2_M_IO_n;
assign P2_P1_ads2 = P2_P1_P2_ADS_n;
assign P2_P1_P2_Datai = P2_P1_di2;
assign P2_P1_do2 = P2_P1_P2_Datao;
assign P2_P1_P2_CLOCK = P2_P1_clock;
assign P2_P1_P2_NA_n = P2_P1_na;
assign P2_P1_P2_BS16_n = P2_P1_bs16;
assign P2_P1_P2_READY_n = P2_P1_rdy2;
assign P2_P1_P2_HOLD = P2_P1_hold;
assign P2_P1_P2_RESET = P2_P1_reset;
assign P2_P1_be3 = P2_P1_P3_BE_n;
assign P2_P1_addr3 = P2_P1_P3_Address;
assign P2_P1_wr3 = P2_P1_P3_W_R_n;
assign P2_P1_dc3 = P2_P1_P3_D_C_n;
assign P2_P1_mio3 = P2_P1_P3_M_IO_n;
assign P2_P1_ads3 = P2_P1_P3_ADS_n;
assign P2_P1_P3_Datai = P2_P1_di3;
assign P2_P1_do3 = P2_P1_P3_Datao;
assign P2_P1_P3_CLOCK = P2_P1_clock;
assign P2_P1_P3_NA_n = P2_P1_na;
assign P2_P1_P3_BS16_n = P2_P1_bs16;
assign P2_P1_P3_READY_n = P2_P1_rdy3;
assign P2_P1_P3_HOLD = P2_P1_hold;
assign P2_P1_P3_RESET = P2_P1_reset;
assign P2_P2_be1 = P2_P2_P1_BE_n;
assign P2_P2_addr1 = P2_P2_P1_Address;
assign P2_P2_wr1 = P2_P2_P1_W_R_n;
assign P2_P2_dc1 = P2_P2_P1_D_C_n;
assign P2_P2_mio1 = P2_P2_P1_M_IO_n;
assign P2_P2_ads1 = P2_P2_P1_ADS_n;
assign P2_P2_P1_Datai = P2_P2_di1;
assign P2_P2_do1 = P2_P2_P1_Datao;
assign P2_P2_P1_CLOCK = P2_P2_clock;
assign P2_P2_P1_NA_n = P2_P2_na;
assign P2_P2_P1_BS16_n = P2_P2_bs16;
assign P2_P2_P1_READY_n = P2_P2_rdy1;
assign P2_P2_P1_HOLD = P2_P2_hold;
assign P2_P2_P1_RESET = P2_P2_reset;
assign P2_P2_be2 = P2_P2_P2_BE_n;
assign P2_P2_addr2 = P2_P2_P2_Address;
assign P2_P2_wr2 = P2_P2_P2_W_R_n;
assign P2_P2_dc2 = P2_P2_P2_D_C_n;
assign P2_P2_mio2 = P2_P2_P2_M_IO_n;
assign P2_P2_ads2 = P2_P2_P2_ADS_n;
assign P2_P2_P2_Datai = P2_P2_di2;
assign P2_P2_do2 = P2_P2_P2_Datao;
assign P2_P2_P2_CLOCK = P2_P2_clock;
assign P2_P2_P2_NA_n = P2_P2_na;
assign P2_P2_P2_BS16_n = P2_P2_bs16;
assign P2_P2_P2_READY_n = P2_P2_rdy2;
assign P2_P2_P2_HOLD = P2_P2_hold;
assign P2_P2_P2_RESET = P2_P2_reset;
assign P2_P2_be3 = P2_P2_P3_BE_n;
assign P2_P2_addr3 = P2_P2_P3_Address;
assign P2_P2_wr3 = P2_P2_P3_W_R_n;
assign P2_P2_dc3 = P2_P2_P3_D_C_n;
assign P2_P2_mio3 = P2_P2_P3_M_IO_n;
assign P2_P2_ads3 = P2_P2_P3_ADS_n;
assign P2_P2_P3_Datai = P2_P2_di3;
assign P2_P2_do3 = P2_P2_P3_Datao;
assign P2_P2_P3_CLOCK = P2_P2_clock;
assign P2_P2_P3_NA_n = P2_P2_na;
assign P2_P2_P3_BS16_n = P2_P2_bs16;
assign P2_P2_P3_READY_n = P2_P2_rdy3;
assign P2_P2_P3_HOLD = P2_P2_hold;
assign P2_P2_P3_RESET = P2_P2_reset;

assign P1_P1_clock = P1_clock;
assign P1_P1_reset = P1_reset;
assign P1_P1_datai = P1_di1;
assign P1_do1 = P1_P1_datao;
assign P1_P1_hold = P1_hold;
assign P1_P1_na = P1_na;
assign P1_P1_bs16 = P1_bs;
assign P1_ad11 = P1_P1_address1;
assign P1_ad12 = P1_P1_address2;
assign P1_wr1 = P1_P1_wr;
assign P1_dc1 = P1_P1_dc;
assign P1_mio1 = P1_P1_mio;
assign P1_as11 = P1_P1_ast1;
assign P1_as12 = P1_P1_ast2;
assign P1_P1_ready1 = P1_r11;
assign P1_P1_ready2 = P1_r12;
assign P1_P2_clock = P1_clock;
assign P1_P2_reset = P1_reset;
assign P1_P2_datai = P1_di2;
assign P1_do2 = P1_P2_datao;
assign P1_P2_hold = P1_hold;
assign P1_P2_na = P1_na;
assign P1_P2_bs16 = P1_bs;
assign P1_ad21 = P1_P2_address1;
assign P1_ad22 = P1_P2_address2;
assign P1_wr2 = P1_P2_wr;
assign P1_dc2 = P1_P2_dc;
assign P1_mio2 = P1_P2_mio;
assign P1_as21 = P1_P2_ast1;
assign P1_as22 = P1_P2_ast2;
assign P1_P2_ready1 = P1_r21;
assign P1_P2_ready2 = P1_r22;
assign P2_P1_clock = P2_clock;
assign P2_P1_reset = P2_reset;
assign P2_P1_datai = P2_di1;
assign P2_do1 = P2_P1_datao;
assign P2_P1_hold = P2_hold;
assign P2_P1_na = P2_na;
assign P2_P1_bs16 = P2_bs;
assign P2_ad11 = P2_P1_address1;
assign P2_ad12 = P2_P1_address2;
assign P2_wr1 = P2_P1_wr;
assign P2_dc1 = P2_P1_dc;
assign P2_mio1 = P2_P1_mio;
assign P2_as11 = P2_P1_ast1;
assign P2_as12 = P2_P1_ast2;
assign P2_P1_ready1 = P2_r11;
assign P2_P1_ready2 = P2_r12;
assign P2_P2_clock = P2_clock;
assign P2_P2_reset = P2_reset;
assign P2_P2_datai = P2_di2;
assign P2_do2 = P2_P2_datao;
assign P2_P2_hold = P2_hold;
assign P2_P2_na = P2_na;
assign P2_P2_bs16 = P2_bs;
assign P2_ad21 = P2_P2_address1;
assign P2_ad22 = P2_P2_address2;
assign P2_wr2 = P2_P2_wr;
assign P2_dc2 = P2_P2_dc;
assign P2_mio2 = P2_P2_mio;
assign P2_as21 = P2_P2_ast1;
assign P2_as22 = P2_P2_ast2;
assign P2_P2_ready1 = P2_r21;
assign P2_P2_ready2 = P2_r22;
 
  
 
   integer P2_P3_reg0 ; 
   integer P2_P3_reg1 ; 
   integer P2_P3_reg2 ; 
   integer P2_P3_reg3 ; 
   reg P2_P3_B ; 
   reg[19:0] P2_P3_MAR ; 
   integer P2_P3_MBR ; 
   reg[1:0] P2_P3_mf ; 
   reg[2:0] P2_P3_df ; 
   reg[0:0] P2_P3_cf ; 
   reg[3:0] P2_P3_ff ; 
   reg[19:0] P2_P3_tail ; 
   integer P2_P3_IR ; 
   reg[0:0] P2_P3_state ; 
   integer P2_P3_r ; 
   integer P2_P3_m ; 
   integer P2_P3_t ; 
   integer P2_P3_d ; 
   integer P2_P3_temp ; 
   reg[1:0] P2_P3_s ; 
 parameter P2_P3_FETCH =0; 
 parameter P2_P3_EXEC =1; 
  always @(  posedge   P2_P3_clock or posedge  P2_P3_reset )
       begin 
         if ( P2_P3_reset ==1'b1)
            begin 
               P2_P3_MAR  =0;
               P2_P3_MBR  =0;
               P2_P3_IR  =0;
               P2_P3_d  =0;
               P2_P3_r  =0;
               P2_P3_m  =0;
               P2_P3_s  =0;
               P2_P3_temp  =0;
               P2_P3_mf  =0;
               P2_P3_df  =0;
               P2_P3_ff  =0;
               P2_P3_cf  =0;
               P2_P3_tail  =0;
               P2_P3_B  =1'b0;
               P2_P3_reg0  =0;
               P2_P3_reg1  =0;
               P2_P3_reg2  =0;
               P2_P3_reg3  =0;
               P2_P3_addr  <=0;
               P2_P3_rd  <=1'b0;
               P2_P3_wr  <=1'b0;
               P2_P3_datao  <=0;
               P2_P3_state  = P2_P3_FETCH ;
            end 
          else 
            begin 
               P2_P3_rd  <=1'b0;
               P2_P3_wr  <=1'b0;
              case ( P2_P3_state )
                P2_P3_FETCH  :
                  begin 
                     P2_P3_MAR  = P2_P3_reg3 %2**20;
                     P2_P3_addr  <= P2_P3_MAR ;
                     P2_P3_rd  <=1'b1;
                     P2_P3_MBR  = P2_P3_datai ;
                     P2_P3_IR  = P2_P3_MBR ;
                     P2_P3_state  = P2_P3_EXEC ;
                  end 
                P2_P3_EXEC  :
                  begin 
                    if ( P2_P3_IR <0)
                        P2_P3_IR  =- P2_P3_IR ;
                     P2_P3_mf  =( P2_P3_IR /2**27)%4;
                     P2_P3_df  =( P2_P3_IR /2**24)%2**3;
                     P2_P3_ff  =( P2_P3_IR /2**19)%2**4;
                     P2_P3_cf  =( P2_P3_IR /2**23)%2;
                     P2_P3_tail  = P2_P3_IR %2**20;
                     P2_P3_reg3  =(( P2_P3_reg3 %2**29)+8);
                     P2_P3_s  =( P2_P3_IR /2**29)%4;
                    case ( P2_P3_s )
                     0 :
                         P2_P3_r  = P2_P3_reg0 ;
                     1 :
                         P2_P3_r  = P2_P3_reg1 ;
                     2 :
                         P2_P3_r  = P2_P3_reg2 ;
                     3 :
                         P2_P3_r  = P2_P3_reg3 ;
                    endcase 
                    case ( P2_P3_cf )
                     1 :
                        begin 
                          case ( P2_P3_mf )
                           0 :
                               P2_P3_m  = P2_P3_tail ;
                           1 :
                              begin 
                                 P2_P3_m  = P2_P3_datai ;
                                 P2_P3_addr  <= P2_P3_tail ;
                                 P2_P3_rd  <=1'b1;
                              end 
                           2 :
                              begin 
                                 P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                 P2_P3_rd  <=1'b1;
                                 P2_P3_m  = P2_P3_datai ;
                              end 
                           3 :
                              begin 
                                 P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                 P2_P3_rd  <=1'b1;
                                 P2_P3_m  = P2_P3_datai ;
                              end 
                          endcase 
                          case ( P2_P3_ff )
                           0 :
                              if ( P2_P3_r < P2_P3_m )
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           1 :
                              if (~( P2_P3_r < P2_P3_m ))
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           2 :
                              if ( P2_P3_r == P2_P3_m )
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           3 :
                              if (~( P2_P3_r == P2_P3_m ))
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           4 :
                              if (~( P2_P3_r > P2_P3_m ))
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           5 :
                              if ( P2_P3_r > P2_P3_m )
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           6 :
                              begin 
                                if ( P2_P3_r >2**30-1)
                                    P2_P3_r  = P2_P3_r -2**30;
                                if ( P2_P3_r < P2_P3_m )
                                    P2_P3_B  =1'b1;
                                 else 
                                    P2_P3_B  =1'b0;
                              end 
                           7 :
                              begin 
                                if ( P2_P3_r >2**30-1)
                                    P2_P3_r  = P2_P3_r -2**30;
                                if (~( P2_P3_r < P2_P3_m ))
                                    P2_P3_B  =1'b1;
                                 else 
                                    P2_P3_B  =1'b0;
                              end 
                           8 :
                              if (( P2_P3_r < P2_P3_m )|( P2_P3_B ==1'b1))
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           9 :
                              if ((~( P2_P3_r < P2_P3_m ))|( P2_P3_B ==1'b1))
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           10 :
                              if (( P2_P3_r == P2_P3_m )|( P2_P3_B ==1'b1))
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           11 :
                              if ((~( P2_P3_r == P2_P3_m ))|( P2_P3_B ==1'b1))
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           12 :
                              if ((~( P2_P3_r > P2_P3_m ))|( P2_P3_B ==1'b1))
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           13 :
                              if (( P2_P3_r > P2_P3_m )|( P2_P3_B ==1'b1))
                                  P2_P3_B  =1'b1;
                               else 
                                  P2_P3_B  =1'b0;
                           14 :
                              begin 
                                if ( P2_P3_r >2**30-1)
                                    P2_P3_r  = P2_P3_r -2**30;
                                if (( P2_P3_r < P2_P3_m )|( P2_P3_B ==1'b1))
                                    P2_P3_B  =1'b1;
                                 else 
                                    P2_P3_B  =1'b0;
                              end 
                           15 :
                              begin 
                                if ( P2_P3_r >2**30-1)
                                    P2_P3_r  = P2_P3_r -2**30;
                                if ((~( P2_P3_r < P2_P3_m ))|( P2_P3_B ==1'b1))
                                    P2_P3_B  =1'b1;
                                 else 
                                    P2_P3_B  =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~( P2_P3_df ==7))
                           begin 
                             if ( P2_P3_df ==5)
                                begin 
                                  if ((~( P2_P3_B ))==1'b1)
                                      P2_P3_d  =3;
                                end 
                              else 
                                if ( P2_P3_df ==4)
                                   begin 
                                     if ( P2_P3_B ==1'b1)
                                         P2_P3_d  =3;
                                   end 
                                 else 
                                   if ( P2_P3_df ==3)
                                       P2_P3_d  =3;
                                    else 
                                      if ( P2_P3_df ==2)
                                          P2_P3_d  =2;
                                       else 
                                         if ( P2_P3_df ==1)
                                             P2_P3_d  =1;
                                          else 
                                            if ( P2_P3_df ==0)
                                                P2_P3_d  =0;
                             case ( P2_P3_ff )
                              0 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                    P2_P3_t  =0;
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  = P2_P3_t - P2_P3_m ;
                                    1 :
                                        P2_P3_reg1  = P2_P3_t - P2_P3_m ;
                                    2 :
                                        P2_P3_reg2  = P2_P3_t - P2_P3_m ;
                                    3 :
                                        P2_P3_reg3  = P2_P3_t - P2_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                    P2_P3_reg2  = P2_P3_reg3 ;
                                    P2_P3_reg3  = P2_P3_m ;
                                 end 
                              2 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  = P2_P3_m ;
                                    1 :
                                        P2_P3_reg1  = P2_P3_m ;
                                    2 :
                                        P2_P3_reg2  = P2_P3_m ;
                                    3 :
                                        P2_P3_reg3  = P2_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  = P2_P3_m ;
                                    1 :
                                        P2_P3_reg1  = P2_P3_m ;
                                    2 :
                                        P2_P3_reg2  = P2_P3_m ;
                                    3 :
                                        P2_P3_reg3  = P2_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  =( P2_P3_r + P2_P3_m )%2**30;
                                    1 :
                                        P2_P3_reg1  =( P2_P3_r + P2_P3_m )%2**30;
                                    2 :
                                        P2_P3_reg2  =( P2_P3_r + P2_P3_m )%2**30;
                                    3 :
                                        P2_P3_reg3  =( P2_P3_r + P2_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  =( P2_P3_r + P2_P3_m )%2**30;
                                    1 :
                                        P2_P3_reg1  =( P2_P3_r + P2_P3_m )%2**30;
                                    2 :
                                        P2_P3_reg2  =( P2_P3_r + P2_P3_m )%2**30;
                                    3 :
                                        P2_P3_reg3  =( P2_P3_r + P2_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  =( P2_P3_r - P2_P3_m )%2**30;
                                    1 :
                                        P2_P3_reg1  =( P2_P3_r - P2_P3_m )%2**30;
                                    2 :
                                        P2_P3_reg2  =( P2_P3_r - P2_P3_m )%2**30;
                                    3 :
                                        P2_P3_reg3  =( P2_P3_r - P2_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  =( P2_P3_r - P2_P3_m )%2**30;
                                    1 :
                                        P2_P3_reg1  =( P2_P3_r - P2_P3_m )%2**30;
                                    2 :
                                        P2_P3_reg2  =( P2_P3_r - P2_P3_m )%2**30;
                                    3 :
                                        P2_P3_reg3  =( P2_P3_r - P2_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  =( P2_P3_r + P2_P3_m )%2**30;
                                    1 :
                                        P2_P3_reg1  =( P2_P3_r + P2_P3_m )%2**30;
                                    2 :
                                        P2_P3_reg2  =( P2_P3_r + P2_P3_m )%2**30;
                                    3 :
                                        P2_P3_reg3  =( P2_P3_r + P2_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  =( P2_P3_r - P2_P3_m )%2**30;
                                    1 :
                                        P2_P3_reg1  =( P2_P3_r - P2_P3_m )%2**30;
                                    2 :
                                        P2_P3_reg2  =( P2_P3_r - P2_P3_m )%2**30;
                                    3 :
                                        P2_P3_reg3  =( P2_P3_r - P2_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  =( P2_P3_r + P2_P3_m )%2**30;
                                    1 :
                                        P2_P3_reg1  =( P2_P3_r + P2_P3_m )%2**30;
                                    2 :
                                        P2_P3_reg2  =( P2_P3_r + P2_P3_m )%2**30;
                                    3 :
                                        P2_P3_reg3  =( P2_P3_r + P2_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_m  = P2_P3_tail ;
                                    1 :
                                       begin 
                                          P2_P3_m  = P2_P3_datai ;
                                          P2_P3_addr  <= P2_P3_tail ;
                                          P2_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg1 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P3_addr  <=( P2_P3_tail + P2_P3_reg2 )%2**20;
                                          P2_P3_rd  <=1'b1;
                                          P2_P3_m  = P2_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  =( P2_P3_r - P2_P3_m )%2**30;
                                    1 :
                                        P2_P3_reg1  =( P2_P3_r - P2_P3_m )%2**30;
                                    2 :
                                        P2_P3_reg2  =( P2_P3_r - P2_P3_m )%2**30;
                                    3 :
                                        P2_P3_reg3  =( P2_P3_r - P2_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case ( P2_P3_mf )
                                    0 :
                                        P2_P3_t  = P2_P3_r /2;
                                    1 :
                                       begin 
                                          P2_P3_t  = P2_P3_r /2;
                                         if ( P2_P3_B ==1'b1)
                                             P2_P3_t  = P2_P3_t %2**29;
                                       end 
                                    2 :
                                        P2_P3_t  =( P2_P3_r %2**29)*2;
                                    3 :
                                       begin 
                                          P2_P3_t  =( P2_P3_r %2**29)*2;
                                         if ( P2_P3_t >2**30-1)
                                             P2_P3_B  =1'b1;
                                          else 
                                             P2_P3_B  =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case ( P2_P3_d )
                                    0 :
                                        P2_P3_reg0  = P2_P3_t ;
                                    1 :
                                        P2_P3_reg1  = P2_P3_t ;
                                    2 :
                                        P2_P3_reg2  = P2_P3_t ;
                                    3 :
                                        P2_P3_reg3  = P2_P3_t ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if ( P2_P3_df ==7)
                              begin 
                                case ( P2_P3_mf )
                                 0 :
                                     P2_P3_m  = P2_P3_tail ;
                                 1 :
                                     P2_P3_m  = P2_P3_tail ;
                                 2 :
                                     P2_P3_m  =( P2_P3_reg1 %2**20)+( P2_P3_tail %2**20);
                                 3 :
                                     P2_P3_m  =( P2_P3_reg2 %2**20)+( P2_P3_tail %2**20);
                                endcase 
                                 P2_P3_addr  <= P2_P3_m %2*20;
                                 P2_P3_wr  <=1'b1;
                                 P2_P3_datao  <= P2_P3_r ;
                              end 
                    endcase 
                     P2_P3_state  = P2_P3_FETCH ;
                  end 
              endcase 
            end 
       end
 
 
  
 
   integer P2_P4_reg0 ; 
   integer P2_P4_reg1 ; 
   integer P2_P4_reg2 ; 
   integer P2_P4_reg3 ; 
   reg P2_P4_B ; 
   reg[19:0] P2_P4_MAR ; 
   integer P2_P4_MBR ; 
   reg[1:0] P2_P4_mf ; 
   reg[2:0] P2_P4_df ; 
   reg[0:0] P2_P4_cf ; 
   reg[3:0] P2_P4_ff ; 
   reg[19:0] P2_P4_tail ; 
   integer P2_P4_IR ; 
   reg[0:0] P2_P4_state ; 
   integer P2_P4_r ; 
   integer P2_P4_m ; 
   integer P2_P4_t ; 
   integer P2_P4_d ; 
   integer P2_P4_temp ; 
   reg[1:0] P2_P4_s ; 
 parameter P2_P4_FETCH =0; 
 parameter P2_P4_EXEC =1; 
  always @(  posedge   P2_P4_clock or posedge  P2_P4_reset )
       begin 
         if ( P2_P4_reset ==1'b1)
            begin 
               P2_P4_MAR  =0;
               P2_P4_MBR  =0;
               P2_P4_IR  =0;
               P2_P4_d  =0;
               P2_P4_r  =0;
               P2_P4_m  =0;
               P2_P4_s  =0;
               P2_P4_temp  =0;
               P2_P4_mf  =0;
               P2_P4_df  =0;
               P2_P4_ff  =0;
               P2_P4_cf  =0;
               P2_P4_tail  =0;
               P2_P4_B  =1'b0;
               P2_P4_reg0  =0;
               P2_P4_reg1  =0;
               P2_P4_reg2  =0;
               P2_P4_reg3  =0;
               P2_P4_addr  <=0;
               P2_P4_rd  <=1'b0;
               P2_P4_wr  <=1'b0;
               P2_P4_datao  <=0;
               P2_P4_state  = P2_P4_FETCH ;
            end 
          else 
            begin 
               P2_P4_rd  <=1'b0;
               P2_P4_wr  <=1'b0;
              case ( P2_P4_state )
                P2_P4_FETCH  :
                  begin 
                     P2_P4_MAR  = P2_P4_reg3 %2**20;
                     P2_P4_addr  <= P2_P4_MAR ;
                     P2_P4_rd  <=1'b1;
                     P2_P4_MBR  = P2_P4_datai ;
                     P2_P4_IR  = P2_P4_MBR ;
                     P2_P4_state  = P2_P4_EXEC ;
                  end 
                P2_P4_EXEC  :
                  begin 
                    if ( P2_P4_IR <0)
                        P2_P4_IR  =- P2_P4_IR ;
                     P2_P4_mf  =( P2_P4_IR /2**27)%4;
                     P2_P4_df  =( P2_P4_IR /2**24)%2**3;
                     P2_P4_ff  =( P2_P4_IR /2**19)%2**4;
                     P2_P4_cf  =( P2_P4_IR /2**23)%2;
                     P2_P4_tail  = P2_P4_IR %2**20;
                     P2_P4_reg3  =(( P2_P4_reg3 %2**29)+8);
                     P2_P4_s  =( P2_P4_IR /2**29)%4;
                    case ( P2_P4_s )
                     0 :
                         P2_P4_r  = P2_P4_reg0 ;
                     1 :
                         P2_P4_r  = P2_P4_reg1 ;
                     2 :
                         P2_P4_r  = P2_P4_reg2 ;
                     3 :
                         P2_P4_r  = P2_P4_reg3 ;
                    endcase 
                    case ( P2_P4_cf )
                     1 :
                        begin 
                          case ( P2_P4_mf )
                           0 :
                               P2_P4_m  = P2_P4_tail ;
                           1 :
                              begin 
                                 P2_P4_m  = P2_P4_datai ;
                                 P2_P4_addr  <= P2_P4_tail ;
                                 P2_P4_rd  <=1'b1;
                              end 
                           2 :
                              begin 
                                 P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                 P2_P4_rd  <=1'b1;
                                 P2_P4_m  = P2_P4_datai ;
                              end 
                           3 :
                              begin 
                                 P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                 P2_P4_rd  <=1'b1;
                                 P2_P4_m  = P2_P4_datai ;
                              end 
                          endcase 
                          case ( P2_P4_ff )
                           0 :
                              if ( P2_P4_r < P2_P4_m )
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           1 :
                              if (~( P2_P4_r < P2_P4_m ))
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           2 :
                              if ( P2_P4_r == P2_P4_m )
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           3 :
                              if (~( P2_P4_r == P2_P4_m ))
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           4 :
                              if (~( P2_P4_r > P2_P4_m ))
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           5 :
                              if ( P2_P4_r > P2_P4_m )
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           6 :
                              begin 
                                if ( P2_P4_r >2**30-1)
                                    P2_P4_r  = P2_P4_r -2**30;
                                if ( P2_P4_r < P2_P4_m )
                                    P2_P4_B  =1'b1;
                                 else 
                                    P2_P4_B  =1'b0;
                              end 
                           7 :
                              begin 
                                if ( P2_P4_r >2**30-1)
                                    P2_P4_r  = P2_P4_r -2**30;
                                if (~( P2_P4_r < P2_P4_m ))
                                    P2_P4_B  =1'b1;
                                 else 
                                    P2_P4_B  =1'b0;
                              end 
                           8 :
                              if (( P2_P4_r < P2_P4_m )|( P2_P4_B ==1'b1))
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           9 :
                              if ((~( P2_P4_r < P2_P4_m ))|( P2_P4_B ==1'b1))
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           10 :
                              if (( P2_P4_r == P2_P4_m )|( P2_P4_B ==1'b1))
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           11 :
                              if ((~( P2_P4_r == P2_P4_m ))|( P2_P4_B ==1'b1))
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           12 :
                              if ((~( P2_P4_r > P2_P4_m ))|( P2_P4_B ==1'b1))
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           13 :
                              if (( P2_P4_r > P2_P4_m )|( P2_P4_B ==1'b1))
                                  P2_P4_B  =1'b1;
                               else 
                                  P2_P4_B  =1'b0;
                           14 :
                              begin 
                                if ( P2_P4_r >2**30-1)
                                    P2_P4_r  = P2_P4_r -2**30;
                                if (( P2_P4_r < P2_P4_m )|( P2_P4_B ==1'b1))
                                    P2_P4_B  =1'b1;
                                 else 
                                    P2_P4_B  =1'b0;
                              end 
                           15 :
                              begin 
                                if ( P2_P4_r >2**30-1)
                                    P2_P4_r  = P2_P4_r -2**30;
                                if ((~( P2_P4_r < P2_P4_m ))|( P2_P4_B ==1'b1))
                                    P2_P4_B  =1'b1;
                                 else 
                                    P2_P4_B  =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~( P2_P4_df ==7))
                           begin 
                             if ( P2_P4_df ==5)
                                begin 
                                  if ((~( P2_P4_B ))==1'b1)
                                      P2_P4_d  =3;
                                end 
                              else 
                                if ( P2_P4_df ==4)
                                   begin 
                                     if ( P2_P4_B ==1'b1)
                                         P2_P4_d  =3;
                                   end 
                                 else 
                                   if ( P2_P4_df ==3)
                                       P2_P4_d  =3;
                                    else 
                                      if ( P2_P4_df ==2)
                                          P2_P4_d  =2;
                                       else 
                                         if ( P2_P4_df ==1)
                                             P2_P4_d  =1;
                                          else 
                                            if ( P2_P4_df ==0)
                                                P2_P4_d  =0;
                             case ( P2_P4_ff )
                              0 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                    P2_P4_t  =0;
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  = P2_P4_t - P2_P4_m ;
                                    1 :
                                        P2_P4_reg1  = P2_P4_t - P2_P4_m ;
                                    2 :
                                        P2_P4_reg2  = P2_P4_t - P2_P4_m ;
                                    3 :
                                        P2_P4_reg3  = P2_P4_t - P2_P4_m ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                    P2_P4_reg2  = P2_P4_reg3 ;
                                    P2_P4_reg3  = P2_P4_m ;
                                 end 
                              2 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  = P2_P4_m ;
                                    1 :
                                        P2_P4_reg1  = P2_P4_m ;
                                    2 :
                                        P2_P4_reg2  = P2_P4_m ;
                                    3 :
                                        P2_P4_reg3  = P2_P4_m ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  = P2_P4_m ;
                                    1 :
                                        P2_P4_reg1  = P2_P4_m ;
                                    2 :
                                        P2_P4_reg2  = P2_P4_m ;
                                    3 :
                                        P2_P4_reg3  = P2_P4_m ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  =( P2_P4_r + P2_P4_m )%2**30;
                                    1 :
                                        P2_P4_reg1  =( P2_P4_r + P2_P4_m )%2**30;
                                    2 :
                                        P2_P4_reg2  =( P2_P4_r + P2_P4_m )%2**30;
                                    3 :
                                        P2_P4_reg3  =( P2_P4_r + P2_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  =( P2_P4_r + P2_P4_m )%2**30;
                                    1 :
                                        P2_P4_reg1  =( P2_P4_r + P2_P4_m )%2**30;
                                    2 :
                                        P2_P4_reg2  =( P2_P4_r + P2_P4_m )%2**30;
                                    3 :
                                        P2_P4_reg3  =( P2_P4_r + P2_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  =( P2_P4_r - P2_P4_m )%2**30;
                                    1 :
                                        P2_P4_reg1  =( P2_P4_r - P2_P4_m )%2**30;
                                    2 :
                                        P2_P4_reg2  =( P2_P4_r - P2_P4_m )%2**30;
                                    3 :
                                        P2_P4_reg3  =( P2_P4_r - P2_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  =( P2_P4_r - P2_P4_m )%2**30;
                                    1 :
                                        P2_P4_reg1  =( P2_P4_r - P2_P4_m )%2**30;
                                    2 :
                                        P2_P4_reg2  =( P2_P4_r - P2_P4_m )%2**30;
                                    3 :
                                        P2_P4_reg3  =( P2_P4_r - P2_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  =( P2_P4_r + P2_P4_m )%2**30;
                                    1 :
                                        P2_P4_reg1  =( P2_P4_r + P2_P4_m )%2**30;
                                    2 :
                                        P2_P4_reg2  =( P2_P4_r + P2_P4_m )%2**30;
                                    3 :
                                        P2_P4_reg3  =( P2_P4_r + P2_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  =( P2_P4_r - P2_P4_m )%2**30;
                                    1 :
                                        P2_P4_reg1  =( P2_P4_r - P2_P4_m )%2**30;
                                    2 :
                                        P2_P4_reg2  =( P2_P4_r - P2_P4_m )%2**30;
                                    3 :
                                        P2_P4_reg3  =( P2_P4_r - P2_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  =( P2_P4_r + P2_P4_m )%2**30;
                                    1 :
                                        P2_P4_reg1  =( P2_P4_r + P2_P4_m )%2**30;
                                    2 :
                                        P2_P4_reg2  =( P2_P4_r + P2_P4_m )%2**30;
                                    3 :
                                        P2_P4_reg3  =( P2_P4_r + P2_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_m  = P2_P4_tail ;
                                    1 :
                                       begin 
                                          P2_P4_m  = P2_P4_datai ;
                                          P2_P4_addr  <= P2_P4_tail ;
                                          P2_P4_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg1 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P2_P4_addr  <=( P2_P4_tail + P2_P4_reg2 )%2**20;
                                          P2_P4_rd  <=1'b1;
                                          P2_P4_m  = P2_P4_datai ;
                                       end 
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  =( P2_P4_r - P2_P4_m )%2**30;
                                    1 :
                                        P2_P4_reg1  =( P2_P4_r - P2_P4_m )%2**30;
                                    2 :
                                        P2_P4_reg2  =( P2_P4_r - P2_P4_m )%2**30;
                                    3 :
                                        P2_P4_reg3  =( P2_P4_r - P2_P4_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case ( P2_P4_mf )
                                    0 :
                                        P2_P4_t  = P2_P4_r /2;
                                    1 :
                                       begin 
                                          P2_P4_t  = P2_P4_r /2;
                                         if ( P2_P4_B ==1'b1)
                                             P2_P4_t  = P2_P4_t %2**29;
                                       end 
                                    2 :
                                        P2_P4_t  =( P2_P4_r %2**29)*2;
                                    3 :
                                       begin 
                                          P2_P4_t  =( P2_P4_r %2**29)*2;
                                         if ( P2_P4_t >2**30-1)
                                             P2_P4_B  =1'b1;
                                          else 
                                             P2_P4_B  =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case ( P2_P4_d )
                                    0 :
                                        P2_P4_reg0  = P2_P4_t ;
                                    1 :
                                        P2_P4_reg1  = P2_P4_t ;
                                    2 :
                                        P2_P4_reg2  = P2_P4_t ;
                                    3 :
                                        P2_P4_reg3  = P2_P4_t ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if ( P2_P4_df ==7)
                              begin 
                                case ( P2_P4_mf )
                                 0 :
                                     P2_P4_m  = P2_P4_tail ;
                                 1 :
                                     P2_P4_m  = P2_P4_tail ;
                                 2 :
                                     P2_P4_m  =( P2_P4_reg1 %2**20)+( P2_P4_tail %2**20);
                                 3 :
                                     P2_P4_m  =( P2_P4_reg2 %2**20)+( P2_P4_tail %2**20);
                                endcase 
                                 P2_P4_addr  <= P2_P4_m %2*20;
                                 P2_P4_wr  <=1'b1;
                                 P2_P4_datao  <= P2_P4_r ;
                              end 
                    endcase 
                     P2_P4_state  = P2_P4_FETCH ;
                  end 
              endcase 
            end 
       end
 
assign P1_P3_clock = P1_clock;
assign P1_P3_reset = P1_reset;
assign P1_ad31 = P1_P3_addr;
assign P1_P3_datai = P1_di3;
assign P1_do3 = P1_P3_datao;
assign P1_rd3 = P1_P3_rd;
assign P1_wr3 = P1_P3_wr;
assign P1_P4_clock = P1_clock;
assign P1_P4_reset = P1_reset;
assign P1_ad41 = P1_P4_addr;
assign P1_P4_datai = P1_di4;
assign P1_do4 = P1_P4_datao;
assign P1_rd4 = P1_P4_rd;
assign P1_wr4 = P1_P4_wr;
assign P2_P3_clock = P2_clock;
assign P2_P3_reset = P2_reset;
assign P2_ad31 = P2_P3_addr;
assign P2_P3_datai = P2_di3;
assign P2_do3 = P2_P3_datao;
assign P2_rd3 = P2_P3_rd;
assign P2_wr3 = P2_P3_wr;
assign P2_P4_clock = P2_clock;
assign P2_P4_reset = P2_reset;
assign P2_ad41 = P2_P4_addr;
assign P2_P4_datai = P2_di4;
assign P2_do4 = P2_P4_datao;
assign P2_rd4 = P2_P4_rd;
assign P2_wr4 = P2_P4_wr;
 
  always @(                                 P2_do1                                 or  P2_rd3  or  P2_wr1  or  P2_mio1  or  P2_dc1  or  P2_as12  or  P2_do2  or  P2_rd4  or  P2_wr2  or  P2_mio2  or  P2_dc2  or  P2_as22  or  P2_as21  or  P2_as11  or  P2_wr3  or  P2_ad31  or  P2_tad2  or  P2_wr4  or  P2_ad41  or  P2_tad1  or  P2_do3  or  P2_do4  or  P2_ad11  or  P2_ad12  or  P2_ad21  or  P2_ad22  or  P2_tad3  or  P2_tad4  or  P2_sel  or  P2_din  or  P2_td1  or  P2_td2  )
       begin 
          P2_di3  <= P2_do1 %2**20;
          P2_r12  <=(~( P2_rd3 & P2_wr1 & P2_mio1 & P2_dc1 &(~ P2_as12 )));
          P2_di4  <= P2_do2 ;
          P2_r22  <=(~( P2_rd4 & P2_wr2 & P2_mio2 & P2_dc2 &(~ P2_as22 )));
          P2_r11  <= P2_as21 ;
          P2_r21  <= P2_as11 ;
         if ( P2_wr3 ==1'b1)
             P2_tad3  <= P2_ad31 ;
          else 
             P2_tad3  <= P2_tad2 %2**20;
         if ( P2_wr4 ==1'b1)
             P2_tad4  <= P2_ad41 ;
          else 
             P2_tad4  <= P2_tad1 %2**20;
         if ( P2_do3 >2**28)
             P2_tad1  <= P2_ad11 ;
          else 
             P2_tad1  <= P2_ad12 ;
         if ( P2_do4 >2**29)
             P2_tad2  <= P2_ad21 ;
          else 
             P2_tad2  <= P2_ad22 ;
          P2_dout  <=( P2_tad3 * P2_tad4 )%2**19;
         if ( P2_sel ==1'b0)
            begin 
               P2_td1  <=0;
               P2_td2  <= P2_din ;
            end 
          else 
            begin 
               P2_td1  <= P2_din ;
               P2_td2  <=0;
            end 
          P2_di1  <= P2_do4 * P2_td1 ;
          P2_di2  <= P2_do3 * P2_td2 ;
          P2_aux  <=( P2_tad1 * P2_tad2 )%2**3;
       end
 
assign P1_clock = clock;
assign P1_reset = reset;
assign P1_hold = hold;
assign P1_na = na;
assign P1_bs = bs;
assign P1_sel = sel1;
assign do1 = P1_dout;
assign P1_din = di1;
assign ax1 = P1_aux;
assign P2_clock = clock;
assign P2_reset = reset;
assign P2_hold = hold;
assign P2_na = na;
assign P2_bs = bs;
assign P2_sel = sel2;
assign do2 = P2_dout;
assign P2_din = di2;
assign ax2 = P2_aux;
 
  always @(  posedge clock or  posedge reset)
       if (reset==1'b1)
          begin 
            sel1 <=1'b0;
            sel2 <=1'b0;
          end 
        else 
          begin 
            if (do1==39)
               sel2 <=1'b1;
             else 
               if (do1==1735)
                  sel2 <=1'b0;
            if (do2==398)
               sel1 <=1'b1;
             else 
               if (do2==1013)
                  sel1 <=1'b0;
          end
  
  always @(         sel1 or  sel2 or  in1 or  in2 or  in3 or  do1 or  do2 or  ax1 or  ax2)
       begin 
         if (sel1==1'b0&sel2==1'b1)
            begin 
              di1 <=in1/2;
              di2 <=in2/16;
            end 
          else 
            begin 
              di1 <=in1/2;
              di2 <=in2/8;
            end 
         ris <=((ax1-ax2)*do1)-((ax1-ax2)*do2);
       end
  
endmodule
