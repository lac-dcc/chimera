/************************************************************************
 *
 * Copyright(c) ISSI Inc., 2010
 *
 * == 64M Async/Page PSRAM behavioral Model by ISSI Inc. ==
 *
 * Address : 1940 Zanker Road San Jose,CA95112-4216,U.S.A.
 * Tel : +1-408-969-6600, Fax : +1-408-969-7800
 *
 * Revision : Rev0.0 (2010.04.09)
 *
 * Operating Spec
 *    Power Supply  : 2.7V ~ 3.6V
 *    IO Supply     : 2.7V ~ 3.6V
 *    Asynch access : 70 ns
 *    Isb           : 180uA max
 *
 * Running Options
 *
 *  +VERBOSE    : Display internal operation status
 *
 ************************************************************************/

`timescale 1ns / 1ps


module IS66WVE409616BLL ( dq, addr, lbb, ubb, ceb, oeb, web, zzb);


   // bit-width definition

   parameter no_of_data   =      16 ;  // number of data bits

   parameter no_of_addr   =      22 ;  // number of total address bits

   parameter mem_width    =       8 ;  // array size of 8 bits for ub & lb

   parameter mem_cnt      =      23 ;  // counter for mem_sizes

   parameter mem_sizes    = 4194304 ;  // mem_sizes of 4194304 bits x 16



   parameter tAA   = 70.0; // Address Access time

   parameter tAPA   = 20.0;   // Page Access time

   parameter tBA        = 70.0; // UB#, LB# Access time

   parameter tCO        = 70.0; // Chip select Access time

   parameter tPC   = 20.0; // Page Read cycle time

   parameter tRC        = 70.0; //Read cycle time

   parameter tAW        = 70.0; // Address valid to end of Write

   parameter tBW        = 70.0; // UB#, LB# select to end of write

   parameter tCW        = 70.0; // Chip enable to end of write

   parameter tWC        = 70.0; //ns Write cycle time

   parameter tOW   =  5.0;   // End write to Low-Z output

   parameter tWP        = 46.0; // Write pulse width

   parameter tBHZ   =  8.0;   // UB#, LB# Disalbe to high -Z output

   parameter tCPH   =  5.0; // CE# high time during write

   parameter tHZ   =  8.0;   // Chip Disable to high-Z output

   parameter tOE   = 20.0;   // OE# low to valid output

   parameter tOHZ   =  8.0;   // OE# high to High-Z output

   parameter tOLZ   =  3.0;   // OE# low to low-Z output

   parameter tDH   =  0.0;   // Data hold from write time

   parameter tDW   = 23.0;   // Data Write setup time

   parameter tWHZ   =  8.0;   // Write to ADQ high-Z output

   parameter tWR   =  0.0;   // Write recovery time

   parameter tZZWE   =  10.0; // ZZ# LOW to WE# LOW [10ns min, 500ns max]

   parameter tOH   =  5.0;   // Output hold from address chage

   parameter tAS   = 0.0;   // Address and ADV# Low setup time

   parameter tCDZZ   = 5.0;    //ns Chip delsect to ZZ# LOW

   parameter tR      = 150e3;// Deep Power-Down recovery

   parameter tZZ_min    = 10e3; // Minimum ZZ# pulse width

   parameter tPU   = 150e3; // initialization period



   // IO declaration

   inout [no_of_data - 1 : 0]    dq ;   // data bits inout [15:0]

   input [no_of_addr - 1 : 0]    addr;   // address bits input [21:0]

   input          lbb ;   // lower byte select LB#

   input          ubb ;   // upper byte select UB#

   input          ceb ;   // chip select CE#

   input          oeb ;   // output enable OE#

   input          web ;   // write enable WE#

   input         zzb ;   // Control Register Enable


   `ifdef VERBOSE

   wire      DEBUG     = 'b1;                          // Debug messages : 1 = On
   `else

   wire      DEBUG     = 'b0;                          // Debug messages : 0 = Off

   `endif

`protect

   // Configuration

   parameter CR        = 2'b00;

   parameter CR_default  = 16'b0000_0000_0111_0000;




   // reg declaration

   reg [mem_width - 1 : 0]    mem_array0 [0 : mem_sizes - 1] ;  // lower byte mem array

   reg [mem_width - 1 : 0]    mem_array1 [0 : mem_sizes - 1] ;  // upper byte mem array

   reg [mem_cnt - 1 : 0]   memiadr;                         // mem array init counter


   reg [no_of_addr - 1 : 0]   async_addr;   // latched memory access address for async


   reg [no_of_data - 1 : 0]   dq_temp_p;   // latched memory access temp data

   reg [no_of_data - 1 : 0]     dq_temp;       // latched memory access data





   wire         async_zzb;

   reg         par_enable;

   assign          async_zzb = zzb;


   initial      par_enable <= 1'b0; // Parital Array Refesh Using ZZ# or by software access Write




   wire [no_of_data - 1 : 0]   dq_o;

   wire [no_of_data - 1 : 0]   dq_in = dq;

   assign          dq = dq_o [no_of_data - 1 : 0];


  // Configuration register

   reg  [2:0]   p_ref;          // Partial refresh

   reg          dpd;            // Deep power down

   reg  [1:0]   tcr;            // Temperature Controlled Refresh

   reg      page;      // Page mode

   wire   [no_of_data - 1 : 0]   CR_reg  = {8'b0000_0000, page, tcr, dpd, 1'b0, p_ref[2:0]};   // rcr Config reg



   // software access reg

   reg   [1 :0]   cfg_reg_st;   // software count

   reg   [1 :0]  soft_reg;   // config reg

   reg      cfg_reg_done;   // config reg accessed

   reg      soft_cr_write;


   parameter idle = 0;

   parameter wr =1;

   parameter rd =2;

   parameter c_rd = 3;

   parameter c_wr = 4;

   reg   [2:0]   state;

   reg      async_wr_lock;

   integer   i;



   // Reg

   reg      dpd_exit;


   wire      zzb_w;

   reg      ubb_ww;

   reg      lbb_ww;

   wire      max_addr;

   wire      cfg_reg_acc;

   wire      CR_reg_acc;

   wire      data_out_enable; // data output mux

   // Reg

   reg      check_tow;


   // internal Wire

   wire #1 oeb_w = oeb;

   wire #1 ceb_w = ceb;

   wire #1 web_w = web;

   wire #1 lbb_w = lbb;

   wire #1 ubb_w = ubb;

   assign  zzb_w = !zzb;


   wire [no_of_data - 1 : 0] #1 dq_data = dq_in;

   // internal timing

   realtime   tm_tCDZZ;

   realtime   tm_tZZMIN;

   realtime   tm_tsleep;

   realtime   tm_tsleepx;

   realtime   tm_power_up;

   realtime   tm_async_addr;

   realtime   tm_tcw;

   realtime   tm_tbw;

   realtime   tm_web;

   realtime   tm_dq_tdw;

   realtime   tm_upper_addr;

   realtime   tm_page_addr3;

   realtime   tm_page_addr2;

   realtime   tm_page_addr1;

   realtime   tm_page_addr0;

   realtime   tm_write_end;


   assign dq_o = data_out_enable ? dq_temp : 16'bz;



   // Constant define

   `define   MAX_ADDR_ACC   22'h3f_ffff

   // Initial block
   initial
     begin

   $timeformat (-9,3, "ns", 1);

   mem_init ;

   async_wr_lock = 0;

   tm_power_up <= 0.0;

   cfg_reg_st = 2'b00;

   soft_cr_write = 1'b0;

   config_reg_write(CR, CR_default, 1'b0);

   dq_temp = 16'bz;

   dq_temp_p = 16'bz;

   async_addr = 22'bz;

   dpd_exit = 1'b0;

     end  // initial



  always @(zzb_w) begin

     if(dpd) begin

      tm_tCDZZ <= $realtime;

      if(!soft_cr_write) begin

            if(zzb_w) begin

         if(DEBUG)

         $display("%t INFO : Async - Partial Array Refresh Enable using ZZ#", $realtime);

         par_enable <= 1'b1;

            end else begin


         if(DEBUG)

         $display("%t INFO : Async - Partial Array Refresh Disable using ZZ#", $realtime);

         par_enable <= 1'b0;


            end

      end

   end else begin

      par_enable <= 1'b0;

      if(zzb_w) begin

                        if($realtime - tm_tCDZZ < tCDZZ)

                                $display ("%t Error : Chip deselect to ZZ# LOW by %t", $realtime, tm_tCDZZ + tCDZZ - $realtime);


         if(DEBUG)

            $display("%t INFO : DPD [Deep Power Down] Entry", $realtime);

                 mem_init;

         dpd_exit <= 1'b1;


         tm_tZZMIN = $realtime;


      end else begin

      if(dpd_exit && !zzb_w && ceb_w) begin

         if($realtime - tm_tZZMIN < tZZ_min)

                                $display ("%t Error : Minmum ZZ# pulse width by %t", $realtime, tm_tZZMIN + tZZ_min - $realtime);


         config_reg_write(CR, CR_reg | 16'h0010, 1'b0);



      end

   end

   end

  end



   // memory access flag

   assign data_out_enable = !ceb && !oeb && web;

   assign max_addr = (async_addr === `MAX_ADDR_ACC);

   assign cfg_reg_acc = cfg_reg_st[1] & cfg_reg_st[0] & max_addr;

   assign CR_reg_acc = cfg_reg_acc & !soft_reg[1] & !soft_reg[0];


   always @(posedge ceb)

   cfg_reg_done <= 1'b0;


   always @(addr) begin

   async_addr <= addr;

   tm_async_addr <= $realtime;

   end

    always @(addr[no_of_addr - 1 : 4]) begin

   tm_upper_addr <= $realtime;

    end


// Main async block


 always @( !ceb or web or oeb or ubb or lbb or zzb or async_addr) begin


      if((state == wr) && ((!ceb_w && ceb) || (!web_w && web) || (!ubb_w & ubb) || (!lbb_w & lbb)) ) begin

   // SPEC timing (parameter check)

   if($realtime - tm_tcw < tCW)

      $display("%t Error : tCW violation on CE# by %t", $realtime, tm_tcw + tCW - $realtime);

   if($realtime - tm_tbw < tBW)

                $display("%t Error : tBW violation on UB#/LB# by %t", $realtime, tm_tbw + tBW - $realtime);

        if($realtime - tm_web < tWP)

                $display("%t Error : tWP violation on WE# by %t", $realtime, tm_web + tWP - $realtime);


        if($realtime - tm_async_addr < tAW)

                $display("%t Error : tAW violation on Addr by %t", $realtime, tm_async_addr + tAW - $realtime);

        if($realtime - tm_dq_tdw < tDW)

                $display("%t Error : tDW violation on DQ by %t", $realtime, tm_dq_tdw + tDW - $realtime);


   if(($realtime - tm_async_addr < tWC) || ($realtime - tm_tcw < tWC))

      $display("%t Error : tWC violation on ADDR", $realtime);

        if((async_addr == {no_of_addr{1'b1}}) && (cfg_reg_st == 2))  begin

      case (dq_data[1:0])

      2'b00 : soft_reg <= CR;

      default : $display ("%t Error : Async - illegal register select =%h", $realtime, dq_data[1:0]);

      endcase

      if(DEBUG)

        $display("%t INFO : Async-software access = %d, Register select = %h", $realtime, cfg_reg_st, dq_data[1:0]);

      cfg_reg_st <= cfg_reg_st + 1'b1;

   end else if((async_addr == {no_of_addr{1'b1}}) && (cfg_reg_st == 3)) begin

      if(DEBUG)

       $display("%t INFO : Async-Software Access Write Data=%h", $realtime, dq_data);

        config_reg_write (soft_reg, dq_data, 1'b1);

      cfg_reg_st <= 2'b0;

   end else begin

      mem_write(async_addr, dq_data, ubb_w, lbb_w);

      cfg_reg_st <= 2'b0;


      if(DEBUG)

       $display("%t INFO: Async-Write Data Latch  addr =%h, UB#=%h,LB#=%h, Data =%h",$realtime,async_addr, ubb_w,lbb_w, dq_data);

   end

   state = idle;

   check_tow  <= #tOW 1'b1;


      end

   // Commit Config Write

    if((state == c_wr) && ((!ceb_w && ceb) || (!web_w && web))) begin

        // SPEC timing (parameter check)

        if($realtime - tm_tcw < tCW)

                $display("%t Error : tCW violation on CE# by %t", $realtime, tm_tcw + tCW - $realtime);

        if($realtime - tm_tbw < tBW)

                $display("%t Error : tBW violation on UB#/LB# by %t", $realtime, tm_tbw + tBW - $realtime);

        if($realtime - tm_web < tWP)

                $display("%t Error : tWP violation on WE# by %t", $realtime, tm_web + tWP - $realtime);

        if($realtime - tm_async_addr < tAW)

                $display("%t Error : tAW violation on Addr by %t", $realtime, tm_async_addr + tAW - $realtime);

        if($realtime - tm_dq_tdw < tDW)

                $display("%t Error : tDW violation on DQ by %t", $realtime, tm_dq_tdw + tDW - $realtime);

        if(($realtime - tm_async_addr < tWC) || ($realtime - tm_tcw < tWC))

                $display("%t Error : tWC violation on ADDR", $realtime);

        if(DEBUG)

   $display("%t INFO : Async- Configuration Register select =%h, Data= %h", $realtime, async_addr[19:18], async_addr[15:0]);

         config_reg_write (async_addr[19:18], async_addr[15:0], 1'b1);

         cfg_reg_st <= 2'b0;

         state = idle;

         async_wr_lock = 1;

         check_tow <= #tOW 1'b1;

         tm_write_end = $realtime;


    end


   if(state == rd) begin

        if(!ceb_w && ceb) begin

       if(($realtime - tm_upper_addr < tRC) || ($realtime -tm_tcw < tRC))

      $display("%t Error : tRC violation on ADDR", $realtime);

       if($realtime - tm_page_addr3 < tPC)

      $display("%t Error : tPC violation on ADDR bit %d by %t",$realtime, i, tm_page_addr3 + tPC - $realtime);

       if($realtime - tm_page_addr2 < tPC)

      $display("%t Error : tPC violation on ADDR bit %d by %t",$realtime, i, tm_page_addr2 + tPC - $realtime);

       if($realtime - tm_page_addr1 < tPC)

      $display("%t Error : tPC violation on ADDR bit %d by %t",$realtime, i, tm_page_addr1 + tPC - $realtime);

       if($realtime - tm_page_addr0 < tPC)

      $display("%t Error : tPC violation on ADDR bit %d by %t",$realtime, i, tm_page_addr0 + tPC - $realtime);

           state = idle;

        end else if (!oeb_w && oeb) begin

           state = idle;

        end

   end


   if(!web_w && web) begin

   async_wr_lock =0;

   end



   if(!async_wr_lock && !ceb && !web) begin

   state = wr;

   end


   if(!async_wr_lock && !ceb && !web && !async_zzb && oeb) begin

   if(state == c_wr) begin

   $display("%t Error : Asynch - Page Mode Configration Register Write is illegal", $realtime);

   end

   state = c_wr;

   if(DEBUG)

        $display("%t INFO : Asynch - Configuration Register Write ", $realtime);


   end


   // software Read and Read

    if(!ceb && !oeb && web) begin

   dq_temp_p = {no_of_data{1'bx}};

     if(!page && (state == rd))

       $display("%t Error : Async - illegal or unintended Page Mode Read, Page mode is disabled in CR", $realtime);

      if((async_addr == {no_of_addr{1'b1}}) && (cfg_reg_st == 3)) begin

        case(soft_reg)

       CR :  dq_temp_p = CR_reg;

   endcase

      if(DEBUG)

   $display("%t  INFO : Async-software access Read Data =%h", $realtime, dq_temp_p);

   cfg_reg_st <= 2'b0;

      end else begin

   dq_temp_p = mem_read(async_addr, ubb_w, lbb_w);


       if(DEBUG)

   $display("%t INFO : Async - READ ; ADDR = %h, DATA = %h", $realtime, async_addr, dq_temp_p);


       if(async_addr == {no_of_addr{1'b1}}) begin

   if(cfg_reg_st < 2) begin

       if(DEBUG)

      $display("%t INFO : Async  - software access unlock = %d", $realtime, cfg_reg_st);

      cfg_reg_st <= cfg_reg_st + 1;

   end

       end else begin

   cfg_reg_st <= 2'b0;


       end

      end

      ubb_ww <= #tOH ubb_w;

      lbb_ww <= #tOH lbb_w;

      dq_temp <= #tOH {no_of_data{1'bx}};

      if(state == rd)  begin

        dq_temp <=  #tAPA dq_temp_p;

      end else begin

        dq_temp <=  #tOE dq_temp_p;

      end

   state = rd;

  end

 end // always @( ceb_w or web or oeb or ubb or lbb or zzb or async_addr)





   // Tasks declaration

   task mem_init ;
      begin
    for ( memiadr = 0 ; memiadr < mem_sizes ; memiadr = memiadr + 1 )
      begin
         mem_array0[memiadr] = 8'bxxxx_xxxx ;
         mem_array1[memiadr] = 8'bxxxx_xxxx ;
      end
      end
   endtask // mem_init


   task Full_ ;
      begin
         for ( memiadr = 0 ; memiadr < 'h3f_ffff ; memiadr = memiadr + 1 )

           begin

              mem_array0[memiadr] = 8'bxxxx_xxxx ;

              mem_array1[memiadr] = 8'bxxxx_xxxx ;


           end
      end
   endtask

   task None_ ;
      begin
         for ( memiadr = 0 ; memiadr < 'h00_0000 ; memiadr = memiadr + 1 )

           begin

              mem_array0[memiadr] = 8'bxxxx_xxxx ;

              mem_array1[memiadr] = 8'bxxxx_xxxx ;


           end
      end
   endtask





   task mem_write;

    input [no_of_addr - 1 : 0]  addr;

    input [no_of_data - 1 : 0]  data;

    input                       ub_b,lb_b;

        begin

   if(max_addr && (CR_reg_acc && cfg_reg_acc))

        begin

      {mem_array1[addr], mem_array0[addr] } <= data;

        end

   else begin

          if(!lb_b) begin

                mem_array0[addr] <= data[7:0];

          end

          if(!ub_b) begin

                mem_array1[addr] <= data[15:8];

          end

       end

    end

 endtask


   function [no_of_data - 1 : 0] mem_read;

        input [no_of_addr - 1 : 0] addr;

        input                   ub_b, lb_b;

        begin

        if(!lb_b && !ub_b)

                mem_read = { mem_array1[addr], mem_array0[addr]};
        else
           begin

                if(!lb_b && ub_b)

                        mem_read = { 8'bz, mem_array0[addr]};

                else

                if(lb_b && !ub_b)

                        mem_read = { mem_array1[addr], 8'bz};

                else

                        mem_read = {16'bz};

           end //if(!lb_b && !ub_b)

        end

   endfunction


   //Config_reg_write;

   task config_reg_write;

   input [1 :0]   select;

   input [15 :0]   opcode;

   input      comment;

   begin

      case(select)

                        CR : begin

                                p_ref   = opcode[2:0];

            if(cfg_reg_st) begin

                                        if(dpd ^ opcode[4])

               $display("%t ERROR: DPD cannot be enable or disable using Software Access Sequence", $realtime);

               par_enable <= 1'b1;

               soft_cr_write = 1'b1;

            end

            //Exit DPD

                                if(!dpd && opcode[4]) begin

            begin

               tm_power_up <= $realtime;

               dpd_exit <= 1'b0;

            end

                                   if(DEBUG)

                                   $display("%t INFO : DPD [Deep Power Down] EXIT", $realtime);

                                end

                              dpd       = opcode[4];

               tcr   = opcode[6:5];

                              page      = opcode[7];

                        end



      endcase


      if(comment) begin

            if( select == CR) begin

                  $display("%t INFO : Register Select = CR", $realtime);

               case (p_ref)

                     3'b000 : begin

                  $display("%t INFO : Partial Array refresh = FULL Array", $realtime);

                  Full_;

                  end

                  3'b100 : begin

                                                $display("%t INFO : Partial Array refresh = None of Array", $realtime);

                  None_;

                                                end

                  default :

                  $display("%t INFO : llegal", $realtime);

               endcase


               case(dpd)


                 1'b0 : $display("%t INFO : Deep Power Down = DPD Enable", $realtime);

                 1'b1 : $display("%t INFO : Partial Array Refresh Enable[Default] ", $realtime);


                 default :

                                                $display("%t INFO : llegal", $realtime);

               endcase

                                        case(tcr)


                                          2'b00 : $display("%t INFO : TCR + 70C", $realtime);

                                          2'b01 : $display("%t INFO : TCR + 45C", $realtime);

                                          2'b10 : $display("%t INFO : TCR + 15C", $realtime);

                                          2'b11 : $display("%t INFO : TCR + 85C [Default]", $realtime);


                                        endcase


               case(page)

                 1'b0 : $display("%t INFO : Page Mode disable", $realtime);

                 1'b1 : $display("%t INFO : Page Mode enable", $realtime);

                 default :

                   $display("%t INFO : llegal", $realtime);

               endcase

              end // if(CR)


      end //comment

   end

endtask


// Timing check

   parameter no_addr_bits = no_of_addr;

   parameter no_data_bits = no_of_data;

   parameter tc_gtc   = 0.5;



   wire [no_of_addr - 1 : 16] tc_addr_async;

   wire [no_of_data - 1 :0] tc_dq_async;

   wire tc_ceb_async;

   wire tc_web_async;

   wire tc_oeb_async;

   wire tc_ubb_async;

   wire tc_lbb_async;


   reg  tc_web;




   initial

   begin


     tc_web = 1'b1;


   end



   always @(web)

   tc_web <= #tc_gtc web;


   always @(ceb) begin

   if(!ceb) begin

      if($realtime - tm_power_up < tPU)

      $display ("%t Warn : tPU violation on CE# by %t", $realtime, tm_power_up + tPU - $realtime);


   end

   end


   assign tc_addr_async =  addr[no_of_addr - 1 : 0];

   assign tc_dq_async = dq[no_of_data - 1 :0];

   assign tc_ceb_async =  ceb;

   assign tc_web_async =  web;

   assign tc_oeb_async =  oeb;

   assign tc_ubb_async =  ubb;

   assign tc_lbb_async =  lbb;




  always @(dq_in) begin

      tm_dq_tdw <= $realtime;

  end



  always @(posedge check_tow)begin

   if(!oeb) begin

      if(dq_in !=={no_of_data{1'bz}})

         $display("%t Error : tOW violation on DQ",$realtime);

      end

      check_tow <= 1'b0;

   end


task address_t_check;

   input t_h;

   integer t_h;

   begin

        if(!ceb && !oeb && web && (ubb == 1'b0) && (lbb == 1'b0)) begin

         case(t_h)

            0 : begin if($realtime - tm_page_addr0 < tPC)

   $display("%t Error : tPC violation on ADDR bit %d by %t", $realtime, t_h, tm_page_addr0 + tPC - $realtime);

            tm_page_addr0 <= $realtime;

            end

            1 : begin if($realtime - tm_page_addr1 < tPC)

        $display("%t Error : tPC violation on ADDR bit %d by %t", $realtime, t_h, tm_page_addr1 + tPC - $realtime);

                                tm_page_addr1 <= $realtime;

            end

                                2 : begin if($realtime - tm_page_addr2 < tPC)

        $display("%t Error : tPC violation on ADDR bit %d by %t", $realtime, t_h, tm_page_addr2 + tPC - $realtime);

                                tm_page_addr2 <= $realtime;

                                end

                                3 : begin if($realtime - tm_page_addr3 < tPC)

        $display("%t Error : tPC violation on ADDR bit %d by %t", $realtime, t_h, tm_page_addr3 + tPC - $realtime);

                                tm_page_addr3 <= $realtime;

            end

         endcase

      end

   end

endtask

        always @(addr[0])

                address_t_check(0);

        always @(addr[1])

                address_t_check(1);

        always @(addr[2])

                address_t_check(2);

   always @(addr[3])

      address_t_check(3);



`endprotect



   // AC timing parameters check



   // async access
   specify

      specparam tsBW    =       70.0 ;  // UB#,LB# select to end of Write; min

      specparam tsAW    =       70.0 ;  // Address valid to end of Write; min

      specparam tsCW    =       70.0 ;  // Chip Enable to end of write time; min

      specparam tsVS    =       70.0 ;  // ADV# setup to end of Write; min

      specparam tsWP    =       45.0 ;  // Write pulse width; min

      specparam tsCPH   =    5.0 ;   // CE# high between subsequent asynchronous cycles; min

      specparam tsDH   =    0.0 ;   // Data hold from write time; min

      specparam tsDW   =   20.0 ;   // Data Write Setup time; min

      specparam tsOE   =   20.0 ;   // OE# low to valid output

      $width     ( negedge ubb,  tsBW ) ;

      $width     ( negedge lbb,  tsBW ) ;

      $width     ( negedge web,  tsWP ) ;

      $width     ( posedge ceb,  tsCPH ) ;

   endspecify


endmodule // IS66WVE409616BLL
