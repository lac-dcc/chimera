// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

//--------------------------------------------------------------------------------------------
//
// Generated by X-HDL VHDL Translator - Version 2.0.0 Feb. 1, 2011
// ?? 7? 18 2023 00:05:13
//
//      Input file      : 
//      Component name  : b15
//      Author          : 
//      Company         : 
//
//      Description     : 
//
//
//--------------------------------------------------------------------------------------------

module b15(BE_n, Address, W_R_n, D_C_n, M_IO_n, ADS_n, Datai, Datao, CLOCK, NA_n, BS16_n, READY_n, HOLD, RESET);
   output [3:0]  BE_n;
   reg [3:0]     BE_n;
   output [29:0] Address;
   reg [29:0]    Address;
   output        W_R_n;
   reg           W_R_n;
   output        D_C_n;
   reg           D_C_n;
   output        M_IO_n;
   reg           M_IO_n;
   output        ADS_n;
   reg           ADS_n;
   input [31:0]  Datai;
   output        Datao;
   integer       Datao;
   input         CLOCK;
   input         NA_n;
   input         BS16_n;
   input         READY_n;
   input         HOLD;
   input         RESET;
   
   
   reg           StateNA;
   reg           StateBS16;
   reg           RequestPending;
   parameter     Pending = 1'b1;
   parameter     NotPending = 1'b0;
   reg           NonAligned;
   reg           ReadRequest;
   reg           MemoryFetch;
   reg           CodeFetch;
   reg [3:0]     ByteEnable;
   integer       DataWidth;
   parameter     WidthByte = 0;
   parameter     WidthWord = 1;
   parameter     WidthDword = 2;
   
   reg [2:0]     State;
   
   parameter     StateInit = 0;
   parameter     StateTi = 1;
   parameter     StateT1 = 2;
   parameter     StateT2 = 3;
   parameter     StateT1P = 4;
   parameter     StateTh = 5;
   parameter     StateT2P = 6;
   parameter     StateT2I = 7;
   
   integer       EAX;
   integer       EBX;
   
   integer       rEIP;
   
   parameter     REP = 8'hF3;
   parameter     REPNE = 8'hF2;
   parameter     LOCK = 8'hF0;
   
   parameter     CSsop = 8'h2E;
   parameter     SSsop = 8'h36;
   parameter     DSsop = 8'h3E;
   parameter     ESsop = 8'h26;
   parameter     FSsop = 8'h64;
   parameter     GSsop = 8'h65;
   parameter     OPsop = 8'h66;
   parameter     ADsop = 8'h67;
   
   parameter     MOV_al_b = 8'hB0;
   parameter     MOV_eax_dw = 8'hB8;
   parameter     MOV_ebx_dw = 8'hBB;
   parameter     MOV_ebx_eax = 8'h89;
   parameter     MOV_eax_ebx = 8'h8B;
   parameter     IN_al = 8'hE4;
   parameter     OUT_al = 8'hE6;
   parameter     ADD_al_b = 8'h04;
   parameter     ADD_ax_w = 8'h05;
   parameter     ROL_eax_b = 8'hD1;
   parameter     ROL_al_1 = 8'hD0;
   parameter     ROL_al_n = 8'hC0;
   parameter     INC_eax = 8'h40;
   parameter     INC_ebx = 8'h43;
   parameter     JMP_rel_short = 8'hEB;
   parameter     JMP_rel_near = 8'hE9;
   parameter     JMP_intseg_immed = 8'hEA;
   parameter     HLT = 8'hF4;
   parameter     WAITx = 8'h9B;
   parameter     NOP = 8'h90;
   
   
   always @(posedge CLOCK or posedge RESET)
   begin: P0
      if (RESET == 1'b1)
      begin
         BE_n <= 4'b0000;
         Address <= 0;
         W_R_n <= 1'b0;
         D_C_n <= 1'b0;
         M_IO_n <= 1'b0;
         ADS_n <= 1'b0;
         
         State <= StateInit;
         
         StateNA <= 1'b0;
         StateBS16 <= 1'b0;
         DataWidth <= 0;
      end
      
      else 
         case (State)
            StateInit :
               begin
                  D_C_n <= 1'b1;
                  ADS_n <= 1'b1;
                  State <= StateTi;
                  StateNA <= 1'b1;
                  StateBS16 <= 1'b1;
                  DataWidth <= 2;
                  State <= StateTi;
               end
            
            StateTi :
               if (RequestPending == Pending)
                  State <= StateT1;
               else if (HOLD == 1'b1)
                  State <= StateTh;
               else
                  State <= StateTi;
            
            StateT1 :
               begin
                  Address <= rEIP/4 % 2 ** 30;
                  BE_n <= ByteEnable;
                  M_IO_n <= MemoryFetch;
                  if (ReadRequest == Pending)
                     W_R_n <= 1'b0;
                  else
                     W_R_n <= 1'b1;
                  if (CodeFetch == Pending)
                     D_C_n <= 1'b0;
                  else
                     D_C_n <= 1'b1;
                  ADS_n <= 1'b0;
                  State <= StateT2;
               end
            
            StateT2 :
               begin
                  if (READY_n == 1'b0 & HOLD == 1'b0 & RequestPending == Pending)
                     State <= StateT1;
                  else if (READY_n == 1'b1 & NA_n == 1'b1)
                     ;
                  else if ((RequestPending == Pending | HOLD == 1'b1) & (READY_n == 1'b1 & NA_n == 1'b0))
                     State <= StateT2I;
                  else if (RequestPending == Pending & HOLD == 1'b0 & READY_n == 1'b1 & NA_n == 1'b0)
                     State <= StateT2P;
                  else if (RequestPending == NotPending & HOLD == 1'b0 & READY_n == 1'b0)
                     State <= StateTi;
                  else if (HOLD == 1'b1 & READY_n == 1'b1)
                     State <= StateTh;
                  else
                     State <= StateT2;
                  StateBS16 <= BS16_n;
                  if (BS16_n == 1'b0)
                     DataWidth <= WidthWord;
                  else
                     DataWidth <= WidthDword;
                  StateNA <= NA_n;
                  ADS_n <= 1'b1;
               end
            
            StateT1P :
               begin
                  if (NA_n == 1'b0 & HOLD == 1'b0 & RequestPending == Pending)
                     State <= StateT2P;
                  else if (NA_n == 1'b0 & (HOLD == 1'b1 | RequestPending == NotPending))
                     State <= StateT2I;
                  else if (NA_n == 1'b1)
                     State <= StateT2;
                  else
                     State <= StateT1P;
                  StateBS16 <= BS16_n;
                  if (BS16_n == 1'b0)
                     DataWidth <= WidthWord;
                  else
                     DataWidth <= WidthDword;
                  StateNA <= NA_n;
                  ADS_n <= 1'b1;
               end
            
            StateTh :
               if (HOLD == 1'b0 & RequestPending == Pending)
                  State <= StateT1;
               else if (HOLD == 1'b0 & RequestPending == NotPending)
                  State <= StateTi;
               else
                  State <= StateTh;
            
            StateT2P :
               begin
                  Address <= rEIP/2 % 2 ** 30;
                  BE_n <= ByteEnable;
                  M_IO_n <= MemoryFetch;
                  if (ReadRequest == Pending)
                     W_R_n <= 1'b0;
                  else
                     W_R_n <= 1'b1;
                  if (CodeFetch == Pending)
                     D_C_n <= 1'b0;
                  else
                     D_C_n <= 1'b1;
                  ADS_n <= 1'b0;
                  if (READY_n == 1'b0)
                     State <= StateT1P;
                  else
                     State <= StateT2P;
               end
            
            StateT2I :
               if (READY_n == 1'b1 & RequestPending == Pending & HOLD == 1'b0)
                  State <= StateT2P;
               else if (READY_n == 1'b0 & HOLD == 1'b1)
                  State <= StateTh;
               else if (READY_n == 1'b0 & HOLD == 1'b0 & RequestPending == Pending)
                  State <= StateT1;
               else if (READY_n == 1'b0 & HOLD == 1'b0 & RequestPending == NotPending)
                  State <= StateTi;
               else
                  State <= StateT2I;
         endcase
   end
   
   
   always @(posedge CLOCK or posedge RESET)
   begin: P1
      reg [7:0]     InstQueue[15:0];
      reg [4:0]     InstQueueRd_Addr;
      reg [4:0]     InstQueueWr_Addr;
      parameter     InstQueueLimit = 15;
      integer       InstAddrPointer;
      integer       PhyAddrPointer;
      reg           Extended;
      reg           More;
      reg           Flush;
      reg [15:0]    lWord;
      reg [14:0]    uWord;
      integer       fWord;
      reg [3:0]     State2;
      parameter     Si = 0;
      parameter     S1 = 1;
      parameter     S2 = 2;
      parameter     S3 = 3;
      parameter     S4 = 4;
      parameter     S5 = 5;
      parameter     S6 = 6;
      parameter     S7 = 7;
      parameter     S8 = 8;
      parameter     S9 = 9;
      
      if (RESET == 1'b1)
      begin
         State2 = Si;
         InstQueue = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
         InstQueueRd_Addr = 0;
         InstQueueWr_Addr = 0;
         InstAddrPointer = 0;
         PhyAddrPointer = 0;
         Extended = 1'b0;
         More = 1'b0;
         Flush = 1'b0;
         lWord = 0;
         uWord = 0;
         fWord = 0;
         CodeFetch <= 1'b0;
         Datao <= 0;
         EAX <= 0;
         EBX <= 0;
         rEIP <= 0;
         ReadRequest <= 1'b0;
         MemoryFetch <= 1'b0;
         RequestPending <= 1'b0;
      end
      
      else 
         case (State2)
            Si :
               begin
                  PhyAddrPointer = rEIP;
                  InstAddrPointer = PhyAddrPointer;
                  State2 = S1;
                  rEIP <= 20'hFFFF0;
                  ReadRequest <= 1'b1;
                  MemoryFetch <= 1'b1;
                  RequestPending <= 1'b1;
               end
            S1 :
               begin
                  RequestPending <= Pending;
                  ReadRequest <= Pending;
                  MemoryFetch <= Pending;
                  CodeFetch <= Pending;
                  if (READY_n == 1'b0)
                     State2 = S2;
                  else
                     State2 = S1;
               end
            S2 :
               begin
                  RequestPending <= NotPending;
                  InstQueue[InstQueueWr_Addr] = Datai % (2 ** 8);
                  InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                  InstQueue[InstQueueWr_Addr] = Datai % 2 ** 8;
                  InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                  if (StateBS16 == 1'b1)
                  begin
                     InstQueue[InstQueueWr_Addr] = (Datai/(2 ** 16)) % (2 ** 8);
                     InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                     InstQueue[InstQueueWr_Addr] = (Datai/(2 ** 24)) % (2 ** 8);
                     InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                     PhyAddrPointer = PhyAddrPointer + 4;
                     State2 = S5;
                  end
                  else
                  begin
                     PhyAddrPointer = PhyAddrPointer + 2;
                     if (PhyAddrPointer < 0)
                        rEIP <= -PhyAddrPointer;
                     else
                        rEIP <= PhyAddrPointer;
                     State2 = S3;
                  end
               end
            S3 :
               begin
                  RequestPending <= Pending;
                  if (READY_n == 1'b0)
                     State2 = S4;
                  else
                     State2 = S3;
               end
            S4 :
               begin
                  RequestPending <= NotPending;
                  InstQueue[InstQueueWr_Addr] = Datai % (2 ** 8);
                  InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                  InstQueue[InstQueueWr_Addr] = Datai % (2 ** 8);
                  InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                  PhyAddrPointer = PhyAddrPointer + 2;
                  State2 = S5;
               end
            S5 :
               begin
                  case (InstQueue[InstQueueRd_Addr])
                     NOP :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     OPsop :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Extended = 1'b1;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     JMP_rel_short :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 3)
                        begin
                           if (InstQueue[(InstQueueRd_Addr + 1) % 16] > 127)
                           begin
                              PhyAddrPointer = InstAddrPointer + 1 - (8'hFF - InstQueue[(InstQueueRd_Addr + 1) % 16]);
                              InstAddrPointer = PhyAddrPointer;
                           end
                           else
                           begin
                              PhyAddrPointer = InstAddrPointer + 2 + InstQueue[(InstQueueRd_Addr + 1) % 16];
                              InstAddrPointer = PhyAddrPointer;
                           end
                           Flush = 1'b1;
                           More = 1'b0;
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     JMP_rel_near :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 5)
                        begin
                           PhyAddrPointer = InstAddrPointer + 5 + InstQueue[(InstQueueRd_Addr + 1) % 16];
                           InstAddrPointer = PhyAddrPointer;
                           Flush = 1'b1;
                           More = 1'b0;
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     JMP_intseg_immed :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     MOV_al_b :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     MOV_eax_dw :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 5)
                        begin
                           EAX <= InstQueue[(InstQueueRd_Addr + 4) % 16] * (2 ** 23) + InstQueue[(InstQueueRd_Addr + 3) % 16] * (2 ** 16) + InstQueue[(InstQueueRd_Addr + 2) % 16] * (2 ** 8) + InstQueue[(InstQueueRd_Addr + 1) % 16];
                           More = 1'b0;
                           Flush = 1'b0;
                           InstAddrPointer = InstAddrPointer + 5;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 5) % 16;
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     MOV_ebx_dw :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 5)
                        begin
                           EBX <= InstQueue[(InstQueueRd_Addr + 4) % 16] * (2 ** 23) + InstQueue[(InstQueueRd_Addr + 3) % 16] * (2 ** 16) + InstQueue[(InstQueueRd_Addr + 2) % 16] * (2 ** 8) + InstQueue[(InstQueueRd_Addr + 1) % 1];
                           More = 1'b0;
                           Flush = 1'b0;
                           InstAddrPointer = InstAddrPointer + 5;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 5) % 16;
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     MOV_eax_ebx :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 2)
                        begin
                           if (EBX < 0)
                              rEIP <= -EBX;
                           else
                              rEIP <= EBX;
                           RequestPending <= Pending;
                           ReadRequest <= Pending;
                           MemoryFetch <= Pending;
                           CodeFetch <= NotPending;
                           if (READY_n == 1'b0)
                           begin
                              RequestPending <= NotPending;
                              uWord = Datai % (2 ** 15);
                              if (StateBS16 == 1'b1)
                                 lWord = Datai % (2 ** 16);
                              else
                              begin
                                 rEIP <= rEIP + 2;
                                 RequestPending <= Pending;
                                 if (READY_n == 1'b0)
                                 begin
                                    RequestPending <= NotPending;
                                    lWord = Datai % (2 ** 16);
                                 end
                              end
                              if (READY_n == 1'b0)
                              begin
                                 EAX <= uWord * (2 ** 16) + lWord;
                                 More = 1'b0;
                                 Flush = 1'b0;
                                 InstAddrPointer = InstAddrPointer + 2;
                                 InstQueueRd_Addr = (InstQueueRd_Addr + 2) % 16;
                              end
                           end
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     MOV_ebx_eax :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 2)
                        begin
                           if (EBX < 0)
                              rEIP <= EBX;
                           else
                              rEIP <= EBX;
                           lWord = EAX % (2 ** 16);
                           uWord = (EAX/(2 ** 16)) % (2 ** 15);
                           RequestPending <= Pending;
                           ReadRequest <= NotPending;
                           MemoryFetch <= Pending;
                           CodeFetch <= NotPending;
                           if (State == StateT1 | State == StateT1P)
                           begin
                              Datao <= (uWord * (2 ** 16) + lWord);
                              if (READY_n == 1'b0)
                              begin
                                 RequestPending <= NotPending;
                                 if (StateBS16 == 1'b0)
                                 begin
                                    rEIP <= rEIP + 2;
                                    RequestPending <= Pending;
                                    ReadRequest <= NotPending;
                                    MemoryFetch <= Pending;
                                    CodeFetch <= NotPending;
                                    State2 = S6;
                                 end
                                 More = 1'b0;
                                 Flush = 1'b0;
                                 InstAddrPointer = InstAddrPointer + 2;
                                 InstQueueRd_Addr = (InstQueueRd_Addr + 2) % 16;
                              end
                           end
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     IN_al :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 2)
                        begin
                           rEIP <= InstQueueRd_Addr + 1;
                           RequestPending <= Pending;
                           ReadRequest <= Pending;
                           MemoryFetch <= NotPending;
                           CodeFetch <= NotPending;
                           if (READY_n == 1'b0)
                           begin
                              RequestPending <= NotPending;
                              EAX <= Datai;
                              InstAddrPointer = InstAddrPointer + 2;
                              InstQueueRd_Addr = (InstQueueRd_Addr + 2);
                              Flush = 1'b0;
                              More = 1'b0;
                           end
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     OUT_al :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 2)
                        begin
                           rEIP <= InstQueueRd_Addr + 1;
                           RequestPending <= Pending;
                           ReadRequest <= NotPending;
                           MemoryFetch <= NotPending;
                           CodeFetch <= NotPending;
                           if (State == StateT1 | State == StateT1P)
                           begin
                              fWord = EAX % (2 ** 16);
                              Datao <= fWord;
                              if (READY_n == 1'b0)
                              begin
                                 RequestPending <= NotPending;
                                 InstAddrPointer = InstAddrPointer + 2;
                                 InstQueueRd_Addr = (InstQueueRd_Addr + 2) % 16;
                                 Flush = 1'b0;
                                 More = 1'b0;
                              end
                           end
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     ADD_al_b :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     ADD_ax_w :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     ROL_al_1 :
                        begin
                           InstAddrPointer = InstAddrPointer + 2;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 2) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     ROL_al_n :
                        begin
                           InstAddrPointer = InstAddrPointer + 2;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 2) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     INC_eax :
                        begin
                           EAX <= EAX + 1;
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     INC_ebx :
                        begin
                           EBX <= EBX + 1;
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     default :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                  endcase
                  if ((~(InstQueueRd_Addr < InstQueueWr_Addr)) | (((InstQueueLimit - InstQueueRd_Addr) < 4) | Flush | More))
                     State2 = S7;
               end
            
            S6 :
               begin
                  Datao <= (uWord * (2 ** 16) + lWord);
                  if (READY_n == 1'b0)
                  begin
                     RequestPending <= NotPending;
                     State2 = S5;
                  end
               end
            
            S7 :
               begin
                  if (Flush)
                  begin
                     InstQueueRd_Addr = 1;
                     InstQueueWr_Addr = 1;
                     
                     if (InstAddrPointer < 0)
                        fWord = -InstAddrPointer;
                     else
                        fWord = InstAddrPointer;
                     
                     if (fWord % 2 == 1)
                        InstQueueRd_Addr = (InstQueueRd_Addr + fWord % 4) % 16;
                  end
                  if ((InstQueueLimit - InstQueueRd_Addr) < 3)
                  begin
                     State2 = S8;
                     InstQueueWr_Addr = 0;
                  end
                  else
                     State2 = S9;
               end
            
            S8 :
               if (InstQueueRd_Addr <= InstQueueLimit)
               begin
                  InstQueue[InstQueueWr_Addr] = InstQueue[InstQueueRd_Addr];
                  InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                  InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                  State2 = S8;
               end
               else
               begin
                  InstQueueRd_Addr = 0;
                  State2 = S9;
               end
            
            S9 :
               begin
                  rEIP <= PhyAddrPointer;
                  State2 = S1;
               end
         endcase
   end
   
   
   always @(posedge CLOCK or posedge RESET)
   begin: P2
      if (RESET == 1'b1)
      begin
         ByteEnable <= 4'b0000;
         NonAligned <= 1'b0;
      end
      else 
         case (DataWidth)
            WidthByte :
               case (rEIP % 4)
                  0 :
                     ByteEnable <= 4'b1110;
                  1 :
                     ByteEnable <= 4'b1101;
                  2 :
                     ByteEnable <= 4'b1011;
                  3 :
                     ByteEnable <= 4'b0111;
                  default :
                     ;
               endcase
            WidthWord :
               case (rEIP % 4)
                  0 :
                     begin
                        ByteEnable <= 4'b1100;
                        NonAligned <= NotPending;
                     end
                  1 :
                     begin
                        ByteEnable <= 4'b1001;
                        NonAligned <= NotPending;
                     end
                  2 :
                     begin
                        ByteEnable <= 4'b0011;
                        NonAligned <= NotPending;
                     end
                  3 :
                     begin
                        ByteEnable <= 4'b0111;
                        NonAligned <= Pending;
                     end
                  default :
                     ;
               endcase
            WidthDword :
               case (rEIP % 4)
                  0 :
                     begin
                        ByteEnable <= 4'b0000;
                        NonAligned <= NotPending;
                     end
                  1 :
                     begin
                        ByteEnable <= 4'b0001;
                        NonAligned <= Pending;
                     end
                  2 :
                     begin
                        NonAligned <= Pending;
                        ByteEnable <= 4'b0011;
                     end
                  3 :
                     begin
                        NonAligned <= Pending;
                        ByteEnable <= 4'b0111;
                     end
                  default :
                     ;
               endcase
            default :
               ;
         endcase
   end
   
endmodule
//--------------------------------------------------------------------------------------------
//
// Generated by X-HDL VHDL Translator - Version 2.0.0 Feb. 1, 2011
// ?? 7? 18 2023 00:05:13
//
//      Input file      : 
//      Component name  : b17
//      Author          : 
//      Company         : 
//
//      Description     : 
//
//
//--------------------------------------------------------------------------------------------


module b17(clock, reset, datai, datao, hold, na, bs16, address1, address2, wr, dc, mio, ast1, ast2, ready1, ready2);
   input         clock;
   input         reset;
   input [31:0]  datai;
   output        datao;
   integer       datao;
   input         hold;
   input         na;
   input         bs16;
   output [29:0] address1;
   reg [29:0]    address1;
   output [29:0] address2;
   reg [29:0]    address2;
   output        wr;
   reg           wr;
   output        dc;
   reg           dc;
   output        mio;
   reg           mio;
   output        ast1;
   reg           ast1;
   output        ast2;
   reg           ast2;
   input         ready1;
   input         ready2;
   
   
   integer       buf1;
   integer       buf2;
   wire [3:0]    be1;
   wire [3:0]    be2;
   wire [3:0]    be3;
   wire [29:0]   addr1;
   wire [29:0]   addr2;
   wire [29:0]   addr3;
   wire          wr1;
   wire          wr2;
   wire          wr3;
   wire          dc1;
   wire          dc2;
   wire          dc3;
   wire          mio1;
   wire          mio2;
   wire          mio3;
   wire          ads1;
   wire          ads2;
   wire          ads3;
   integer       di1;
   integer       di2;
   integer       di3;
   wire [31:0]   do1;
   wire [31:0]   do2;
   wire [31:0]   do3;
   reg           rdy1;
   reg           rdy2;
   reg           rdy3;
   reg           ready11;
   reg           ready12;
   reg           ready21;
   reg           ready22;
   
   
   always @(posedge clock or posedge reset)
      if (reset == 1'b1)
      begin
         buf1 <= 0;
         ready11 <= 1'b0;
         ready12 <= 1'b0;
      end
      else 
      begin
         if (addr1 > 2 ** 29 & ads1 == 1'b0 & mio1 == 1'b1 & dc1 == 1'b0 & wr1 == 1'b1 & be1 == 4'b0000)
         begin
            buf1 <= do1;
            ready11 <= 1'b0;
            ready12 <= 1'b1;
         end
         else if (addr2 > 2 ** 29 & ads2 == 1'b0 & mio2 == 1'b1 & dc2 == 1'b0 & wr2 == 1'b1 & be2 == 4'b0000)
         begin
            buf1 <= do2;
            ready11 <= 1'b1;
            ready12 <= 1'b0;
         end
         else
         begin
            ready11 <= 1'b1;
            ready12 <= 1'b1;
         end
      end
   
   
   always @(posedge clock or posedge reset)
      if (reset == 1'b1)
      begin
         buf2 <= 0;
         ready21 <= 1'b0;
         ready22 <= 1'b0;
      end
      else 
      begin
         if (addr2 < 2 ** 29 & ads2 == 1'b0 & mio2 == 1'b1 & dc2 == 1'b0 & wr2 == 1'b1 & be2 == 4'b0000)
         begin
            buf2 <= do2;
            ready21 <= 1'b0;
            ready22 <= 1'b1;
         end
         else if (ads3 == 1'b0 & mio3 == 1'b1 & dc3 == 1'b0 & wr3 == 1'b0 & be3 == 4'b0000)
         begin
            ready21 <= 1'b1;
            ready22 <= 1'b0;
         end
         else
         begin
            ready21 <= 1'b1;
            ready22 <= 1'b1;
         end
      end
   
   
   always @(addr1 or buf1 or datai)
      if (addr1 > 2 ** 29)
         di1 <= buf1;
      else
         di1 <= datai;
   
   
   always @(addr2 or buf1 or buf2)
      if (addr2 > 2 ** 29)
         di2 <= buf1;
      else
         di2 <= buf2;
   
   
   always @(addr2 or addr3 or do1 or do2 or do3)
      if ((do1 < 2 ** 30) & (do2 < 2 ** 30) & (do3 < 2 ** 30))
         address2 <= addr3;
      else
         address2 <= addr2;
   
   
   always @(buf2 or do3 or addr1 or wr3 or dc3 or mio3 or ads1 or ads3 or ready1 or ready2 or ready11 or ready12 or ready21 or ready22)
   begin
      di3 <= buf2;
      datao <= do3;
      address1 <= addr1;
      wr <= wr3;
      dc <= dc3;
      mio <= mio3;
      ast1 <= ads1;
      ast2 <= ads3;
      rdy1 <= ready11 & ready1;
      rdy2 <= ready12 & ready21;
      rdy3 <= ready22 & ready2;
   end
   
   
   b15 P1(be1, addr1, wr1, dc1, mio1, ads1, di1, do1, clock, na, bs16, rdy1, hold, reset);
   
   b15 P2(be2, addr2, wr2, dc2, mio2, ads2, di2, do2, clock, na, bs16, rdy2, hold, reset);
   
   b15 P3(be3, addr3, wr3, dc3, mio3, ads3, di3, do3, clock, na, bs16, rdy3, hold, reset);
   
endmodule