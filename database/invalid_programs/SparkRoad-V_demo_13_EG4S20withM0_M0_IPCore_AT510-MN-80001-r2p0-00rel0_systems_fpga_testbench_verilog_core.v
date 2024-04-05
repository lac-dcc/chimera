//  FileName: core.v
//  Unified Sram Core Model for Sync Burst/NBT/DDR Sram 
//  Revision History:
//  7/12/00   1.0  1) first draft, DDR is not implemented yet
//  7/13/00   1.1  1) reduce state machine to 3 states
//  7/14/00   1.2  1) add task-shiftnow for suspend cycle
//  7/16/00   1.3  1) add NBT function
//          2) reduce ZZ pesmistics at powerup
//          3) add nop(NBT) cycle - dummy W (BW=0)is nop 
//  7/17/00   1.4  1) add the NBT R/W same address match case
//  5/14/01   1.5  2) removed jtag info, added W and ADV back in
//      5/31/01  1.6  1) corrected lw and llw mode for the NBT.
//                       a) lw is for NBT Flow
//                       b) llw is for NBT Pipe
//                    2) Changed ce assgin block for SCD addition
//                    3) Changed oe assgin block for SCD addition
//                    4)  Added ce2 signal for SCD output hold
//      8/27/01  1.7  1) Fixed a race condition between = and <= assginments
//                2) In the state Machine section, shiftnow and all the states
//      9/25/01  1.8  1) Shorten the DCD data hold on a deselect.  needed to 
//                2) shorten by one complete cycle
//      4/04/02  1.9  1) Model did not support a Suspend Burst command changed
//                    2) ce default from (ce0 | ce1) to (ce0)
//                    3) Suspend command in state table not outputs last read command data
//      6/25/02  2.0  1) Changed EXTEST command from 001 to 100
//     02/20/03  2.1  1) Modified read to look at previous write byte write's and 
//       determine where to get the data from.
//     08/12/03  2.2  1) Added a DELAY variable that allows the use of tKQX to simulate output hold
//                    2) updated state maching to seperate the Burst Read and Burst Write states.
//                    3) updated internal Bytewrite signals for NBT mode, they ignore the nW
//     03/16/04  2.3  1) updated state machine to have a suspend state.
//                    2) Changed idle state to deselect.
//     04/28/04  2.4  1) Rearranged state that determins Deselect, Burst and Suspend
//     06/11/04  2.5  1) Removed all refernece to BurstRam functionality.
//     06/30/08  2.6  1) Removed unused signals
//     08/19/09  2.7  1) ce signal needed to be issued CE1 in pipeline mode not CE0.
//     05/10/10  2.8  1) changed Pull-up and Pull-down strengths to weak.
//     03/14/12  2.9  1) Added coherancy to model.
//     05/28/13  3.0  1) Updated Coherancy checking.
//
//---------------------------------------------------------------
//    Preload SRAM For Debugging
//---------------------------------------------------------------
reg     [DQ_size-1:0]   bank0 [0:bank_size],
                        bank1 [0:bank_size],
                        bank2 [0:bank_size],
                        bank3 [0:bank_size],
                        bank4 [0:bank_size],
                        bank5 [0:bank_size],
                        bank6 [0:bank_size],
                        bank7 [0:bank_size];
//---------------------------------------------------------------
//      Valid Sync Sram Operatons  - 3 configuration pins 
//---------------------------------------------------------------

//  Setting below is based on the actual chip,
//  When these pins are left floating, the chip is internally set to: 
//  => No sleep, Pipeline , Interleaved Burst Address 
//    => Single cycle deselect, Even parity, Parity enable

pulldown (weak0) (ZZ);
pullup   (weak1) (nFT);
pullup   (weak1) (nLBO);
pullup   (weak1) (E2);
pulldown (weak0) (nE3);

//---------------------------------------------------------------
//    Merging Input Pins of NBT / Burst Operation
//---------------------------------------------------------------

wire          E;  // internal chip enable
wire          W;  // internal write strobe
wire  [7:0]        BW;  // internal byte write enable
wire          ZNOP;  // NBT mode the nop cycle
real                                    DELAY;

assign  E    = ~nE1  & E2 & ~nE3;
assign  W  =(~nW & (~nBa|~nBb|~nBc|~nBd|~nBe|~nBf|~nBg|~nBh)) ;  
assign   BW  ={~nBh,~nBg,~nBf,~nBe,~nBd,~nBc,~nBb,~nBa};
assign  ZNOP  = ~nW & (BW==0);

//---------------------------------------------------------------
//    Gated SRAM Clock
//---------------------------------------------------------------
reg [DQ_size-1:0]   Dia,Dib,Dic,Did,Die,Dif,Dig,Dih; // write data 
reg                        clk_i;
reg [7:0]        bw0;   // saved bw 
reg [7:0]        bw1;   // bw buffer 1 
reg [7:0]        bw2;   // bw buffer 2 
reg [A_size-1:0]      addr0;   // saved address 
reg [A_size-1:0]      addr1;  // address buffer 1
reg [A_size-1:0]      addr2;  // address buffer 2
reg [1:0]        bcnt;   // burst counter 
// output of state machine
reg          we0, we1, we2;  // we flags 
reg          re0, re1, re2;  // re flags
reg          ce0, ce1, ce2;  // ce flags
// 
wire            ce, oe, we, re;  // active ones 
wire [7:0]        bwi ;     // active ones
wire [A_size-1:0]      baddr;   // burst memory address
wire [A_size-1:0]      waddr;   // write memory address
wire [A_size-1:0]      raddr;   // read memory address


always begin
   @ ( posedge CK ) begin
      clk_i = ~nCKE & ~ZZ;
   end
   @ ( negedge CK ) begin
      clk_i = 1'b0;
   end
end

   parameter  HighZ = 9'b ZZZZZZZZZ;

   assign   #(DELAY) DQa = (nG|~oe|ZZ) ? HighZ : (raddr==waddr & bwi[0] & we==1'b1 ) ? Dia : bank0[raddr];  // 
   assign   #(DELAY) DQb = (nG|~oe|ZZ) ? HighZ : (raddr==waddr & bwi[1] & we==1'b1 ) ? Dib : bank1[raddr];  // 
   assign   #(DELAY) DQc = (nG|~oe|ZZ) ? HighZ : (raddr==waddr & bwi[2] & we==1'b1 ) ? Dic : bank2[raddr];  // 
   assign   #(DELAY) DQd = (nG|~oe|ZZ) ? HighZ : (raddr==waddr & bwi[3] & we==1'b1 ) ? Did : bank3[raddr];  // 
   assign   #(DELAY) DQe = (nG|~oe|ZZ) ? HighZ : (raddr==waddr & bwi[4] & we==1'b1 ) ? Die : bank4[raddr];  // 
   assign   #(DELAY) DQf = (nG|~oe|ZZ) ? HighZ : (raddr==waddr & bwi[5] & we==1'b1 ) ? Dif : bank5[raddr];  // 
   assign   #(DELAY) DQg = (nG|~oe|ZZ) ? HighZ : (raddr==waddr & bwi[6] & we==1'b1 ) ? Dig : bank6[raddr];  // 
   assign   #(DELAY) DQh = (nG|~oe|ZZ) ? HighZ : (raddr==waddr & bwi[7] & we==1'b1 ) ? Dih : bank7[raddr];  // 
   //---------------------------------------------------------------
   //
   //    Combinatorial Logic 
   //
   //---------------------------------------------------------------

   // Internal data is always 9 bits

   assign        baddr  = nLBO ? {addr0[A_size-1:2],bcnt[1]^addr0[1],bcnt[0]^addr0[0]} : 
            {addr0[A_size-1:2], addr0[1:0]+bcnt} ; 
   assign        waddr  = ~nFT ? addr1 : addr2;
   assign        raddr  = ~nFT ? baddr : ( nFT ? addr1 : addr2);
   assign        bwi  = ~nFT ? bw1 : bw2;
   assign        we  = ~nFT ? we1 : we2;
   assign        re  = ~nFT ? re0 : ( nFT ? re1 : re2);
   assign        ce   = ~nFT ? ce0 : ce1;
   assign        oe   = re & ce;

   

   //---------------------------------------------------------------
   //
   //              Synchronuos Logic 
   //
   //---------------------------------------------------------------
   parameter        deselect   = 0,
           newcyc   = 1,
           burst   = 2,
           suspend = 3;

   reg [2:0]        state;

   initial
     begin
  state <= deselect;
  ce0 <= 0; ce1 <= 0; ce2 <= 0;
  we0 <= 0; we1 <= 0; we2 <= 0;
  re0 <= 0; re1 <= 0; re2 <= 0;
  bw0 <= 0; bw1 <= 0; bw2 <= 0; 
  bcnt=0;
     end
   

   //---------------------------------------------------------------
   //    State Machine
   //---------------------------------------------------------------

   task shiftnow;
      begin
   addr2 <= addr1;
   addr1 <= baddr;
   bw2 <= bw1; bw1 <= bw0; 
   we2 <= we1; we1 <= we0;
   re2 <= re1; re1 <= re0;
         ce2 <= ce1; ce1 <= ce0;
   Dia <= DQa;
   Dib <= DQb;
   Dic <= DQc;
   Did <= DQd;
   Die <= DQe;
   Dif <= DQf;
   Dig <= DQg;
   Dih <= DQh;
 
      end
   endtask

   always @ (posedge clk_i) begin: st
      DELAY <= (~W & ~nFT & E) ? tKQ_flow : (nFT & re0) ? tKQ_pipe : nFT ? tKQX_pipe : tKQX_flow;
      case (state)
        deselect: 
    begin
       if(E==1 & pADV==0) begin
    shiftnow;
    state <= newcyc;
    we0<=W; re0<=~W & ~ZNOP; ce0<=1;
    addr0<=A; bw0<=BW;
    bcnt<=0;
       end
       if(E!=1 & pADV==0) begin
    shiftnow;
    state <= deselect;
    we0<=0; re0<=0; ce0<=0;
       end
    end
  
        newcyc:
    begin 
       if(E==1 & pADV==0) begin
    shiftnow;
    state <= newcyc;
    we0<=W; re0<=~W & ~ZNOP; ce0<=1;
    addr0<=A; bw0<=BW;
    bcnt<=0;
       end
       if(E!=1 & pADV==0) begin
    shiftnow;
    state <= deselect;
    we0<=0; re0<=0; ce0<=0;
       end // if (( E!=1 | ADS==0))
       if(pADV==1) begin
    // continue
    if (we0==1) begin
       shiftnow;
       state <= burst;
       we0<=pADV; ce0<=1;
       bw0<=BW;
       bcnt<= bcnt+1;
    end
    else if (re0==1) begin
       shiftnow;
       state <= burst;
       re0<=pADV & ~ZNOP; ce0<=1;
       bcnt<= bcnt+1;
    end
       end // if (ADS==0 & ADV==1)
    end // case: newcyc
  
        burst: 
    begin 
       if(E==1 & pADV==0) begin
    shiftnow;
    state <= newcyc;
    we0<=W; re0<=~W & ~ZNOP; ce0<=1;
    addr0<=A; bw0<=BW;
    bcnt<=0;
       end
       if( E!=1 & pADV==0) begin
    shiftnow;
    state <= deselect;
    we0<=0; re0<=0; ce0<=0;
       end // if (( E!=1 | ADS==0))
       if(pADV==1) begin
    if (we0==1) begin
       // continue 
       shiftnow;
       state <= burst;
       we0<=pADV; ce0<=1;
       bw0<=BW;
       bcnt<= bcnt+1;
    end
    else if(re0==1) begin
       // continue 
       shiftnow;
       state <= burst;
       re0<=pADV & ~ZNOP; ce0<=1;
       bcnt<= bcnt+1;
    end
       end // if (ADS==0 & ADV==1)
    end // case: burst
  
  suspend:
    begin
       if(E==1 & pADV==0) begin
    shiftnow;
    state <= newcyc;
    we0<=W; re0<=~W & ~ZNOP; ce0<=1;
    addr0<=A; bw0<=BW;
    bcnt<=0;
       end
       if(E!=1 & pADV==0) begin
    shiftnow;
    state <= deselect;
    we0<=0; re0<=0; ce0<=0;
       end
       if(pADV==1) begin
    if (we0==1) begin
       // continue 
       shiftnow;
       state <= burst;
       we0<=pADV; ce0<=1;
       bw0<=BW;
       bcnt<= bcnt+1;
    end
    else if(re0==1) begin
       // continue 
       shiftnow;
       state <= burst;
       re0<=pADV & ~ZNOP; ce0<=1;
       bcnt<= bcnt+1;
    end
       end // if (ADS==0 & ADV==1)
    end // case: suspend
  
  default:
    begin
       shiftnow;
       state <= deselect;
       we0<=0; re0<=0; ce0<=0;
       bcnt<=0;
    end
      endcase

      //---------------------------------------------------------------
      //
      //              Data IO Logic 
      //
      //---------------------------------------------------------------


      if (we) begin 
   if (bwi[0]==1)  bank0[waddr] <= Dia;
   if (bwi[1]==1)  bank1[waddr] <= Dib;
   if (bwi[2]==1)  bank2[waddr] <= Dic;
   if (bwi[3]==1)  bank3[waddr] <= Did;
   if (bwi[4]==1)  bank4[waddr] <= Die;
   if (bwi[5]==1)  bank5[waddr] <= Dif;
   if (bwi[6]==1)  bank6[waddr] <= Dig;
   if (bwi[7]==1)  bank7[waddr] <= Dih;
   
      end
      
   end   // st