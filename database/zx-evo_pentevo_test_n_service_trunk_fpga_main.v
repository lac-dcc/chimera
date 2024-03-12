module main(

 // clocks
 input fclk,
 output clkz_out,
 input clkz_in,

 // z80
 input iorq_n,
 input mreq_n,
 input rd_n,
 input wr_n,
 input m1_n,
 input rfsh_n,
 input int_n,
 input nmi_n,
 input wait_n,
 output res,

 inout [7:0] d,
 output [15:0] a,

 // zxbus and related
 output csrom,
 output romoe_n,
 output romwe_n,

 output rompg0_n,
 output dos_n, // aka rompg1
 output rompg2,
 output rompg3,
 output rompg4,

 input iorqge1,
 input iorqge2,
 output iorq1_n,
 output iorq2_n,

 // DRAM
 inout [15:0] rd,
 output [9:0] ra,
 output rwe_n,
 output rucas_n,
 output rlcas_n,
 output rras0_n,
 output rras1_n,

 // video
 output [1:0] vred,
 output [1:0] vgrn,
 output [1:0] vblu,

 output vhsync,
 output vvsync,
 output vcsync,

 // AY control and audio/tape
 input ay_clk,
 output ay_bdir,
 output ay_bc1,

 output reg beep,

 // IDE
 output [2:0] ide_a,
 
`ifdef IDE_HDD
  inout [15:0] ide_d,
  output ide_rs_n,
`elsif IDE_VDAC
  output [15:0] ide_d,
  input ide_rs_n,
`elsif IDE_VDAC2
  output [15:0] ide_d,
  output ide_rs_n,
`endif


 output ide_dir,
 input ide_rdy,

 output ide_cs0_n,
 output ide_cs1_n,
 output ide_rd_n,
 output ide_wr_n,

 // VG93 and diskdrive
 output reg vg_clk,

 output vg_cs_n,
 output vg_res_n,

 input vg_hrdy,
 input vg_rclk,
 input vg_rawr,
 input [1:0] vg_a, // disk drive selection
 input vg_wrd,
 input vg_side,

 input step,
 input vg_sl,
 input vg_sr,
 input vg_tr43,
 input rdat_b_n,
 input vg_wf_de,
 input vg_drq,
 input vg_irq,
 input vg_wd,

 // serial links (atmega-fpga, sdcard)
 output sdcs_n,
 output sddo,
 output sdclk,
 input sddi,

 input spics_n,
 input spick,
 input spido,
 output spidi,
 output reg spiint_n

);

//--Dummy----------------------------------------------------------------------

 assign iorq1_n   = 1'b1;
 assign iorq2_n   = 1'b1;

 assign res       = 1'b1;

 assign ay_bdir   = 1'b0;
 assign ay_bc1    = 1'b0;

 assign vg_cs_n   = 1'b1;
 assign vg_res_n  = 1'b0;

 assign a[15:14]  = 2'b00;

//--INT---------------------------------------------------------------------------

 reg enable_covox_int;  initial enable_covox_int = 1'b0;
 reg enable_frame_int;  initial enable_frame_int = 1'b0;

 always @(posedge fclk)
  begin
   if ( enable_covox_int )
    spiint_n <= cvx_ptr_diff[3]|main_osc[7];
   else if ( enable_frame_int )
    spiint_n <= vtxtscr;
   else
    spiint_n <= 1'b1;
  end

//--clocks--Z80_clk--VG_clk--COVOX---------------------------------------------

 reg [9:0] main_osc;
 reg [2:0] vgclk_div7;
 reg [7:0] covox [15:0];        initial covox[0] = 8'h7f;
 reg [8:0] qe;                  initial qe = 9'h0ff;
 reg [3:0] cvx_ptr_out;         initial cvx_ptr_out = 4'd0;
 reg [3:0] cvx_ptr_in;          initial cvx_ptr_in  = 4'd0;
 wire [3:0] cvx_ptr_iinc;
 wire [3:0] cvx_ptr_diff;
 assign cvx_ptr_iinc = cvx_ptr_in + 4'd1;
 assign cvx_ptr_diff = cvx_ptr_in - cvx_ptr_out;

 always @(posedge fclk)
  begin
   //
   if ( { 1'b1, covox[cvx_ptr_out] } >= qe )
    begin
     beep <= 1'b1;
     qe <= 9'h1ff - { 1'b1, covox[cvx_ptr_out] } + qe;
    end
   else
    begin
     beep <= 1'b0;
     qe <= 9'h000 - { 1'b1, covox[cvx_ptr_out] } + qe;
    end
   //
   if ( main_osc[7:0] == 8'hff )
    begin
     if ( cvx_ptr_in !== cvx_ptr_out )
      cvx_ptr_out <= cvx_ptr_out + 4'd1;
    end
   //
   if ( main_osc[1:0]==2'b00 )
   begin
    if ( vgclk_div7[2:1] == 2'b11 )
     begin
      vgclk_div7 <= 3'd0;
      vg_clk <= ~vg_clk;
     end
    else
     vgclk_div7 <= vgclk_div7 + 3'd1;
   end
   //
   main_osc <= main_osc + 10'd1;
   //
  end

 assign clkz_out = main_osc[2]; // 3.5 MHz

//--Video----------------------------------------------------------------------
// character image - 6x8
// character size  - 6x10
// col x row       - 53x25 (318x250)
// fullscreen test - 360x288

 localparam HTXTS_END   = 9'd416;
 localparam CSYNC_CUT   = 9'd415;
 localparam CSYNC_CUT2  = 9'd394; // 9'd395;            // 9'd382;
 localparam HSYNC_BEG   = 9'd0;
 localparam HSYNC_BEG2  = 9'd447;
 localparam HSYNC_END   = 9'd33;
 localparam HSYNC_END2  = 9'd52; // 9'd53;
 localparam HTXTS_BEG   = 9'd98;
 localparam HMAX        = 9'd447;

 localparam VTXTS_END   = 9'd293;
 localparam VSYNC_BEG   = 9'd0;
 localparam VSYNC_END   = 9'd2;
 localparam VTXTS_BEG   = 9'd43;
 localparam VMAX        = 9'd319;

 localparam HBORD_BEG   = 9'd77;
 localparam HBORD_END   = 9'd437;
 localparam VBORD_BEG   = 9'd24;
 localparam VBORD_END   = 9'd312;

 //                          GgRrBb
 localparam BLACK       = 6'b000000;
 localparam GRAY_1      = 6'b010101;
 localparam GRAY_2      = 6'b101010;
 localparam WHITE       = 6'b111111;

 localparam BLUE_3      = 6'b000011;
 localparam RED_3       = 6'b001100;
 localparam MAGENTA_3   = 6'b001111;
 localparam GREEN_3     = 6'b110000;
 localparam CYAN_3      = 6'b110011;
 localparam YELLOW_3    = 6'b111100;

 localparam BLUE_2      = 6'b000010;
 localparam RED_2       = 6'b001000;
 localparam MAGENTA_2   = 6'b001010;
 localparam GREEN_2     = 6'b100000;
 localparam CYAN_2      = 6'b100010;
 localparam YELLOW_2    = 6'b101000;

 localparam BLUE_H      = 6'b010110;
 localparam RED_H       = 6'b011001;
 localparam MAGENTA_H   = 6'b011010;
 localparam GREEN_H     = 6'b100101;
 localparam CYAN_H      = 6'b100110;
 localparam YELLOW_H    = 6'b101001;

 reg [8:0] hcount;      initial hcount = 9'd0;
 reg [2:0] pixptr;
 reg [8:0] vcount;      initial vcount = 9'd0;
 reg [5:0] hcharcount;
 wire [2:0] vcharline;
 reg [10:0] voffset;
 reg [3:0] vcharlinecount;
 reg hsync;             initial hsync = 1'b1;
 reg htxtscr;           initial htxtscr = 1'b0;
 reg vsync;             initial vsync = 1'b1;
 reg vtxtscr;           initial vtxtscr = 1'b0;
 reg csync;             initial csync = 1'b1;
 wire [10:0] video_addr;
 wire [7:0] charcode0, charcode1, charcode2;
 wire [7:0] charcode;
 wire [7:0] attrcode0, attrcode1, attrcode2;
 wire [7:0] attrcode;
 wire [5:0] charpix;
 wire pixel;
 wire [5:0] fcolor, bcolor, image_color;
 reg [5:0] color;
 wire fontenable;
 reg [8:0] hmouse, vmouse;
 wire mouse_here, mouse_i, mouse_image, mouse_m, mouse_mask;
 reg vgaff, nextline;
 reg hbord;             initial hbord = 1'b0;
 reg vbord;             initial vbord = 1'b0;
 reg circle;            initial circle = 1'b0;
 reg uhole;             initial uhole = 1'b0;
 reg hhole;             initial hhole = 1'b0;
 reg vhole;             initial vhole = 1'b0;
 reg [1:0] bcdir;       initial bcdir = 2'b00;
 reg [1:0] scdir;       initial scdir = 2'b00;
 reg [3:0] hsetka, vsetka;
 reg [4:0] hchess, vchess;
 reg [1:0] hchss3;
 reg [2:0] cband;
 reg [6:0] bccount;
 reg [4:0] sccount;
 reg [6:0] schcnt;
 wire [6:0] cb_val;
 wire [4:0] cs_val;
 reg [2:0] clr3;


 always @(posedge fclk)
  begin
   //
   if ( {(main_osc[1]&scr_tv_mode),main_osc[0]}==2'h0 )
    begin

     if ( scr_mode==2'h0 )
      color <= (htxtscr & vtxtscr) ? ( (mouse_image) ? ~image_color : image_color ) : BLACK;
     else if ( hbord & vbord )
      case ( scr_mode )
       3'h2:
             color <= (hchess[0]^vchess[0]) ? WHITE : BLACK;
       3'h3:
             case (vchess)
              5'd0, 5'd19:
                if (vsetka==5'd14)
                 color <= GRAY_2;
                else if (hchess[0])
                 color <= WHITE;
                else
                 color <= BLACK;
              5'd5, 5'd6:
                case (cband)
                 3'd0: color <= GRAY_2;
                 3'd1: color <= YELLOW_H;
                 3'd2: color <= CYAN_H;
                 3'd3: color <= GREEN_H;
                 3'd4: color <= MAGENTA_H;
                 3'd5: color <= RED_H;
                 3'd6: color <= BLUE_H;
                 3'd7: color <= GRAY_1;
                endcase
              5'd13, 5'd14:
                case (cband)
                 3'd0: color <= GRAY_2;
                 3'd1: color <= YELLOW_2;
                 3'd2: color <= CYAN_2;
                 3'd3: color <= GREEN_2;
                 3'd4: color <= MAGENTA_2;
                 3'd5: color <= RED_2;
                 3'd6: color <= BLUE_2;
                 3'd7: color <= BLACK;
                endcase
              default
               begin
                if (uhole)
                 begin
                  if (pixel)
                   color <= GRAY_2;
                  else
                   color <= GRAY_1;
                 end
                else if ( (circle) && !(hhole&vhole) )
                 case (vchess)
                  5'd2, 5'd17:
                    if ( (hchess==5'd2) || (hchess==5'd3) || (hchess==5'd20) || (hchess==5'd21) )
                     begin
                      if (hcount[0])
                       color <= GRAY_2;
                      else
                       color <= GRAY_1;
                     end
                    else
                     color <= GRAY_2;
                  5'd3:
                    if ( (hchess==5'd2)  || ((hchess==5'd3)  && (hsetka!=5'd14))
                      || (hchess==5'd20) || ((hchess==5'd21) && (hsetka!=5'd14)) )
                     begin
                      if (hcount[0]^vcount[0])
                       color <= GRAY_1;
                      else
                       color <= GRAY_2;
                     end
                    else
                     color <= GRAY_2;
                  5'd7:
                    case (cband)
                     //3'd0: color <= WHITE;
                     3'd1: color <= WHITE;
                     3'd2: color <= BLACK;
                     3'd3: color <= GRAY_1;
                     3'd4: color <= GRAY_2;
                     3'd5: color <= WHITE;
                     3'd6: color <= BLACK;
                     //3'd7: color <= BLACK;
                    endcase
                  5'd8:
                    if (hcount[3])
                     color <= MAGENTA_H;
                    else
                     color <= GREEN_H;
                  5'd9, 5'd10:
                    if ( (hcount[8]) ^ (vchess[0]) ^ ( (hchess==5'd4) && (hsetka==4'd14) ) )
                     color <= GRAY_2;
                    else
                     color <= BLACK;
                  5'd11:
                    if (hcount[3])
                     color <= RED_H;
                    else
                     color <= CYAN_H;
                  5'd12:
                    if (hcount[0])
                     color <= GRAY_2;
                    else
                     color <= GRAY_1;
                  5'd15:
                    if ( (hchess[0]) && (schcnt==6'd63) )
                     color <= BLACK;
                    else
                     color <= GRAY_2;
                  5'd16:
                    if ( (hchess==5'd2)  || ((hchess==5'd3) &&(hsetka!=4'd14))
                      || (hchess==5'd20) || ((hchess==5'd21)&&(hsetka!=4'd14)) )
                     begin
                      if (hcount[0]^vcount[0])
                       color <= GRAY_2;
                      else
                       color <= GRAY_1;
                     end
                    else
                     color <= GRAY_2;
                  default:
                   color <= GRAY_2;
                 endcase
                else
                 color <= ( (hsetka==4'd14) || (vsetka==4'd14) ) ? GRAY_2 : GRAY_1;
               end
             endcase
       3'h4: case (cband)
              3'd0: color <= GRAY_2;
              3'd1: color <= YELLOW_2;
              3'd2: color <= CYAN_2;
              3'd3: color <= GREEN_2;
              3'd4: color <= MAGENTA_2;
              3'd5: color <= RED_2;
              3'd6: color <= BLUE_2;
              3'd7: color <= BLACK;
             endcase
       3'h5: if (vchess[4]==1'b0)
              begin
               if (vchess!=5'd15)
                case (cband)
                 3'd0: color <= GRAY_2;
                 3'd1: color <= YELLOW_2;
                 3'd2: color <= CYAN_2;
                 3'd3: color <= GREEN_2;
                 3'd4: color <= MAGENTA_2;
                 3'd5: color <= RED_2;
                 3'd6: color <= BLUE_2;
                 3'd7: color <= BLACK;
                endcase
               else
                case (cband)
                 3'd0: color <= BLUE_2;
                 3'd1: color <= BLACK;
                 3'd2: color <= MAGENTA_2;
                 3'd3: color <= BLACK;
                 3'd4: color <= CYAN_2;
                 3'd5: color <= BLACK;
                 3'd6: color <= GRAY_2;
                 3'd7: color <= BLACK;
                endcase
              end
             else
              case (cband)
               3'd0: color <= WHITE;
               3'd1: color <= YELLOW_2;
               3'd2: color <= CYAN_2;
               3'd3: color <= GREEN_2;
               3'd4: color <= MAGENTA_2;
               3'd5: color <= RED_2;
               3'd6: color <= BLUE_2;
               3'd7: color <= BLACK;
              endcase
       3'h6: begin
              if ( (vcount[2:0]==3'd4) || (hcount[2:0]==3'd1) )
               begin
                color[0] <= clr3[0];
                color[1] <= clr3[0];
                color[2] <= clr3[1];
                color[3] <= clr3[1];
                color[4] <= clr3[2];
                color[5] <= clr3[2];
               end
              else
               color <= BLACK;
             end
       default: color <= (hcount[0]^vcount[0]) ? WHITE : BLACK;
      endcase
     else
      color <= BLACK;

     hmouse <= hcount - scr_mouse_x;

     if ( ~htxtscr )
      begin
       hcharcount <= 6'h00;
       pixptr <= 3'd0;
      end
     else
      begin
       if ( pixptr==3'd5 )
        begin
         pixptr <= 3'd0;
         hcharcount <= hcharcount + 6'h01;
        end
       else
        pixptr <= pixptr + 3'd1;
      end

     if ( hcount==HMAX )
      hcount <= 9'd0;
     else
      hcount <= hcount + 9'd1;

     if ( hcount==HTXTS_END )
      htxtscr <= 1'b0;
     else if ( hcount==HTXTS_BEG )
      htxtscr <= 1'b1;

     if ( hcount==HSYNC_BEG )
      begin
       if ( scr_tv_mode ) hsync <= 1'b1;
       vgaff <= scr_tv_mode | ~vgaff;
       if ( vgaff )
        begin
         if ( scr_tv_mode ) csync <= 1'b1;
         nextline <= 1'b1;
        end
      end

     if ( (~scr_tv_mode) && (hcount==HSYNC_BEG2) )
      begin
       hsync <= 1'b1;
       if ( vgaff ) csync <= 1'b1;
      end

     if ( (~scr_tv_mode) && (hcount==HSYNC_END2) )
      begin
       hsync <= 1'b0;
       if ( !vsync )
        csync <= 1'b0;
      end

     if ( scr_tv_mode && (hcount==HSYNC_END) )
      begin
       hsync <= 1'b0;
       if ( !vsync )
        csync <= 1'b0;
      end

     if (scr_tv_mode)
      begin
       if (hcount==CSYNC_CUT)
        csync <= 1'b0;
      end
     else if ( (vgaff) && (hcount==CSYNC_CUT2) )
      csync <= 1'b0;

     if ( ((hchess==5'd0) || (hchess==5'd18)) && (hsetka==4'd13) )
      schcnt <= 6'd0;
     else if (schcnt!=6'd63)
      schcnt <= schcnt+6'd1;

     if ( hcount==HBORD_BEG )
      begin
       hbord <= 1'b1;
       hsetka <= 4'd0;
       hchess <= 5'd0;
       hchss3 <= 2'd0;
       cband <= 3'd0;
      end
     else
      begin
       if ( hsetka==4'd14 )
        begin
         hsetka <= 4'd0;
         hchess <= hchess+5'd1;
         if ( hchss3==2'd2 )
          begin
           hchss3 <= 2'd0;
           cband <= cband+3'd1;
          end
         else
          hchss3 <= hchss3+2'd1;
        end
       else
        hsetka <= hsetka+4'd1;
       if ( hcount==HBORD_END ) hbord <= 1'b0;
      end

     if ( !((vcount[2:0]==3'd0)&&vgaff) && (hcount==9'd0) )
      clr3 <= { clr3[1:0], clr3[2] };
     else if (hcount[2:0]==3'd5)
      clr3 <= { clr3[1:0], clr3[2] };

    end
   //
   if ( nextline )
    begin

     nextline <= 1'b0;

     if ( ~vtxtscr )
      begin
       voffset <= 11'd0;
       vcharlinecount <= 4'd15;
      end
     else
      begin
       if ( vcharlinecount==4'd8 )
        begin
         voffset <= voffset + 11'd53;
         vcharlinecount <= 4'd15;
        end
       else
        vcharlinecount <= vcharlinecount + 4'd1;
      end

     if ( vcount==VMAX )
      begin
       vcount <= 9'd0;
       clr3 <= 3'b001;
      end
     else
      vcount <= vcount + 9'd1;

     if ( vcount==VTXTS_END )
      vtxtscr <= 1'b0;
     else if ( vcount==VTXTS_BEG )
      vtxtscr <= 1'b1;

     if ( vcount==VSYNC_BEG )
      vsync <= 1'b1;
     else if ( vcount==VSYNC_END )
      vsync <= 1'b0;

     if ( vcount==VBORD_BEG )
      begin
       vbord <= 1'b1;
       vsetka <= 4'd5;
       vchess <= 5'd0;
       circle <= 1'b0;
       bccount <= 7'd0;
       sccount <= 5'd0;
       bcdir <= 2'b00;
       scdir <= 2'b00;
      end
     else
      begin

       if (bcdir[0])
        bccount <= bccount+7'd1;
       else if (bcdir[1])
        bccount <= bccount-7'd1;

       if (scdir[0])
        sccount <= sccount+5'd1;
       else if (scdir[1])
        sccount <= sccount-5'd1;

       if ( vsetka==4'd14 )
        begin
         vsetka <= 4'd0;
         vchess <= vchess+5'd1;
        end
       else
        begin
         vsetka <= vsetka+4'd1;
         if ( vsetka==4'd13 )
          begin
           if (vchess==5'd1)
            bcdir <= 2'b01;
           else if (vchess==5'd9)
            bcdir <= 2'b10;
           else if (vchess==5'd17)
            bcdir <= 2'b00;
           if ( (vchess==5'd0) || (vchess==5'd14) )
            scdir <= 2'b01;
           else if ( (vchess==5'd2) || (vchess==5'd16) )
            scdir <= 2'b10;
           else if ( (vchess==5'd4) || (vchess==5'd18) )
            scdir <= 2'b00;
          end
        end

       if ( vcount==VBORD_END ) vbord <= 1'b0;

      end

     vmouse <= vcount - scr_mouse_y;

    end
   //
   if ( (hchess==5'd2) || (hchess==5'd10) || (hchess==5'd20) )
    hhole <= 1'b1;
   else if ( (hchess==5'd4) || (hchess==5'd14) || (hchess==5'd22) )
    hhole <= 1'b0;
   //
   if ( (vchess==5'd4) && (schcnt==6'd63) )
    begin
     if (hchess==5'd7)
      uhole <= 1'b1;
     else if (hchess==5'd17)
      uhole <= 1'b0;
    end
   //
   if (hcount==(9'd258+cb_val))
    circle <= 1'b0;
   else if ( (schcnt==(5'd31+cs_val)) && (sccount!=5'd0) )
    circle <= 1'b0;
   else if (hcount==(9'd257-cb_val))
    circle <= 1'b1;
   else if ( (schcnt==(5'd30-cs_val)) && (sccount!=5'd0) )
    circle <= 1'b1;
   //
   if ( (((vchess==5'd2) || (vchess==5'd16)) && (vsetka==4'd7)) || (vchess==5'd9) )
    vhole <= 1'b1;
   else if ( (((vchess==5'd3) || (vchess==5'd17)) && (vsetka==4'd7)) || (vchess==5'd11) )
    vhole <= 1'b0;
   //
  end

 circl_b ccb ( .in_addr(bccount), .out_word(cb_val) );
 circl_s ccs ( .in_addr(sccount), .out_word(cs_val) );

 lpm_rom_7x2 mouse_cursor ( .address({ vmouse[3:0], hmouse[2:0] }), .q({ mouse_i, mouse_m }) );
 assign mouse_here = (hmouse[8:3] == 6'd0) && (vmouse[8:4] == 5'd0);
 assign mouse_mask = mouse_here & mouse_m;
 assign mouse_image = mouse_here & mouse_i;

 assign video_addr = voffset + { 4'h0, hcharcount[5:0] };
 lpm_ram_dp_9x8 scrmem0  ( .data(indata), .wraddress(scr_addr[8:0]), .wren((scr_wren_c)&&(scr_addr[10:9]==2'h0)),
                           .rdaddress(video_addr[8:0]), .q(charcode0) );
 lpm_ram_dp_9x8 scrmem1  ( .data(indata), .wraddress(scr_addr[8:0]), .wren((scr_wren_c)&&(scr_addr[10:9]==2'h1)),
                           .rdaddress(video_addr[8:0]), .q(charcode1) );
 lpm_ram_dp_9x8 scrmem2  ( .data(indata), .wraddress(scr_addr[8:0]), .wren((scr_wren_c)&&(scr_addr[10:9]==2'h2)),
                           .rdaddress(video_addr[8:0]), .q(charcode2) );
 assign charcode = (video_addr[10:9]==2'h0) ? charcode0 :
                   (video_addr[10:9]==2'h1) ? charcode1 : charcode2 ;
 lpm_ram_dp_9x8 attrmem0 ( .data(scr_attr), .wraddress(scr_addr[8:0]), .wren((scr_wren_a)&&(scr_addr[10:9]==2'h0)),
                           .rdaddress(video_addr[8:0]), .q(attrcode0) );
 lpm_ram_dp_9x8 attrmem1 ( .data(scr_attr), .wraddress(scr_addr[8:0]), .wren((scr_wren_a)&&(scr_addr[10:9]==2'h1)),
                           .rdaddress(video_addr[8:0]), .q(attrcode1) );
 lpm_ram_dp_9x8 attrmem2 ( .data(scr_attr), .wraddress(scr_addr[8:0]), .wren((scr_wren_a)&&(scr_addr[10:9]==2'h2)),
                           .rdaddress(video_addr[8:0]), .q(attrcode2) );
 assign attrcode = (video_addr[10:9]==2'h0) ? attrcode0 :
                   (video_addr[10:9]==2'h1) ? attrcode1 : attrcode2 ;
 assign vcharline = (vcharlinecount[3]) ? ~vcharlinecount[2:0] : vcharlinecount[2:0];
 lpm_rom_11x6 chargen ( .address({ charcode, vcharline }), .q(charpix) );

 assign fcolor = { attrcode[2], (attrcode[2]&attrcode[3]),
                   attrcode[1], (attrcode[1]&attrcode[3]),
                   attrcode[0], (attrcode[0]&attrcode[3]) };
 assign bcolor = { (attrcode[6]&attrcode[7]), (attrcode[6]&(~attrcode[7])),
                   (attrcode[5]&attrcode[7]), (attrcode[5]&(~attrcode[7])),
                   (attrcode[4]&attrcode[7]), (attrcode[4]&(~attrcode[7])) };
 assign fontenable = (charcode[7:4]==4'hb)||
                     (charcode[7:4]==4'hc)||
                     (charcode[7:4]==4'hd)||
                     (~vcharlinecount[3]);
 assign pixel = ( charcode==8'hb0 ) ? ( (vcount[0]^hcount[1])&~hcount[0] ) :
                ( charcode==8'hb1 ) ? (  vcount[0]^hcount[0]             ) :
                ( charcode==8'hb2 ) ? ( (vcount[0]^hcount[1])| hcount[0] ) :
                ( fontenable ) ? charpix[3'd5-pixptr] : 1'b0;

 assign image_color = (mouse_mask) ? BLACK : ( pixel ? fcolor : bcolor ) ;

 assign { vgrn[1:0], vred[1:0], vblu[1:0] } = color;
 assign vhsync = hsync;
 assign vvsync = vsync;
 assign vcsync = ~csync;

//--AVRSPI--FlashROM-----------------------------------------------------------

 localparam TEMP_REG      = 8'ha0;

 localparam SD_CS0        = 8'ha1;
 localparam SD_CS1        = 8'ha2;
 localparam FLASH_LOADDR  = 8'ha3;
 localparam FLASH_MIDADDR = 8'ha4;
 localparam FLASH_HIADDR  = 8'ha5;
 localparam FLASH_DATA    = 8'ha6;
 localparam FLASH_CTRL    = 8'ha7;
 localparam SCR_LOADDR    = 8'ha8;
 localparam SCR_HIADDR    = 8'ha9;
 localparam SCR_SET_ATTR  = 8'haa; // запись в ATTR
 localparam SCR_FILL      = 8'hab; // прединкремент адреса и запись в ATTR и в память
                                   // (если только дергать spics_n, то в память будет писаться предыдущее значение)
 localparam SCR_CHAR      = 8'hac; // прединкремент адреса и запись в память символов и ATTR в память атрибутов
                                   // (если только дергать spics_n, то в память будет писаться предыдущие значения)
 localparam SCR_MOUSE_X   = 8'had;
 localparam SCR_MOUSE_Y   = 8'hae;
 localparam SCR_MODE      = 8'haf; // [7] - 0=VGAmode, 1=TVmode; [2:0] - 0=TXT, иначе ScrTESTs

 localparam MTST_CONTROL  = 8'h50; // [0] - тест памяти (0=сброс, 1=работа)
 localparam MTST_PASS_CNT0= 8'h51;
 localparam MTST_PASS_CNT1= TEMP_REG;
 localparam MTST_FAIL_CNT0= 8'h52;
 localparam MTST_FAIL_CNT1= TEMP_REG;

 localparam COVOX         = 8'h53;

 localparam INT_CONTROL   = 8'h54; // [0] - разрешение прерываний от covox-а (27343.75 Hz)
                                   // [1] - разрешение кадровых прерываний (~49 Hz)

 reg [7:0] number;          initial number = 8'hff;
 reg [7:0] indata;          initial indata = 8'hff;
 reg [7:0] outdata;
 reg [2:0] bitptr;
 reg prev_spics_n;
 reg [18:0] flash_addr;
 reg flash_cs;              initial flash_cs = 1'b0;
 reg flash_oe;              initial flash_oe = 1'b0;
 reg flash_we;              initial flash_we = 1'b0;
 reg flash_postinc;         initial flash_postinc = 1'b0;
 reg [7:0] flash_data_out;
 reg [10:0] scr_addr;       initial scr_addr = 11'h000;
 reg [7:0] scr_attr;        initial scr_attr = 8'h0f;
 reg scr_wren_c;            initial scr_wren_c = 1'b0;
 reg scr_wren_a;            initial scr_wren_a = 1'b0;
 reg [8:0] scr_mouse_x;     initial scr_mouse_x = 9'd0;
 reg [8:0] scr_mouse_y;     initial scr_mouse_y = 9'd0;
 reg scr_tv_mode;           initial scr_tv_mode = 1'b1;
 reg [2:0] scr_mode;        initial scr_mode = 3'b0;
 wire spicsn_rising;
 wire spicsn_falling;
 wire sd_selected;
 reg cs_trg;
 reg [7:0] temp_reg;

 always @(posedge spick)
  begin
   if ( spics_n )
    number <= { number[6:0], spido };
   else
    indata <= { indata[6:0], spido };
  end

 always @(negedge spick or posedge spics_n)
  begin
   if ( spics_n )
    bitptr <= 3'b111;
   else
    bitptr <= bitptr - 3'b001;
  end

 always @(posedge fclk)
  begin
   //
   if ( spicsn_rising )
    begin
     //
     cs_trg <= 1'b1;
     //
     case ( number )
      FLASH_LOADDR:  flash_addr[7:0] <= indata;
      FLASH_MIDADDR: flash_addr[15:8] <= indata;
      FLASH_HIADDR:  flash_addr[18:16] <= indata[2:0];
      FLASH_DATA:    begin
                      flash_data_out <= indata;
                      if (flash_postinc) flash_addr[13:0] <= flash_addr[13:0] + 14'd1;
                     end
      FLASH_CTRL:    begin
                      flash_cs <= indata[0];
                      flash_oe <= indata[1];
                      flash_we <= indata[2];
                      flash_postinc <= indata[3];
                     end
      SCR_LOADDR:    scr_addr[7:0] <= indata;
      SCR_HIADDR:    scr_addr[10:8] <= indata[2:0];
      SCR_SET_ATTR:  scr_attr <= indata;
      SCR_FILL:      begin
                      scr_attr <= indata;
                      scr_wren_a <= 1'b1;
                     end
      SCR_CHAR:      begin
                      scr_wren_c <= 1'b1;
                      scr_wren_a <= 1'b1;
                     end
      TEMP_REG:      temp_reg <= indata;
      SCR_MOUSE_X:   scr_mouse_x <= { temp_reg[0], indata };
      SCR_MOUSE_Y:   scr_mouse_y <= { temp_reg[0], indata };
      SCR_MODE:      begin
                      scr_tv_mode <= indata[7];
                      scr_mode <= indata[2:0];
                     end
      MTST_CONTROL:  mtst_run <= indata[0];
      COVOX:         begin
                      covox[cvx_ptr_iinc] <= indata;
                      cvx_ptr_in <= cvx_ptr_iinc;
                     end
      INT_CONTROL:   begin
                      enable_covox_int <= indata[0];
                      enable_frame_int <= indata[1];
                     end
     endcase
     //
    end
   else
   begin
    //
    scr_wren_c <= 1'b0;
    scr_wren_a <= 1'b0;
    //
    if ( spicsn_falling )
     begin
      //
      cs_trg <= 1'b0;
      //
      case ( number )
       SCR_SET_ATTR:  outdata <= ~scr_attr; // for SPI testing
       SCR_FILL:      begin
                       outdata <= 8'hff;
                       scr_addr <= scr_addr + 11'd1;
                      end
       SCR_CHAR:      begin
                       outdata <= 8'hff;
                       scr_addr <= scr_addr + 11'd1;
                      end
       FLASH_DATA:    outdata <= d;
       MTST_PASS_CNT0:begin
                       outdata <= mtst_pass_counter[7:0];
                       temp_reg <= mtst_pass_counter[15:8];
                      end
       MTST_FAIL_CNT0:begin
                       outdata <= mtst_fail_counter[7:0];
                       temp_reg <= mtst_fail_counter[15:8];
                      end
       COVOX:         outdata <= { 4'd0, cvx_ptr_diff };
       TEMP_REG:      outdata <= temp_reg; // read after MTST_PASS_CNT0, MTST_FAIL_CNT0
       default:       outdata <= 8'hff;
      endcase
      //
     end
    //
   end
   //
   prev_spics_n <= spics_n;
   //
  end

 assign spicsn_rising  = ( { cs_trg, prev_spics_n, spics_n } == 3'b011 );
 assign spicsn_falling = ( { cs_trg, prev_spics_n, spics_n } == 3'b100 );

 assign sd_selected = ( ( (number==SD_CS0) || (number==SD_CS1) ) && (~spics_n) );
 assign spidi = sd_selected ? sddi : outdata[bitptr];
 assign sddo  = sd_selected ? spido : 1'b1;
 assign sdclk = sd_selected ? spick : 1'b0;
 assign sdcs_n = !( (number==SD_CS0) && (~spics_n) );

 assign a[13:0]  =  flash_addr[13:0];
 assign rompg0_n = ~flash_addr[14];
 assign { rompg4, rompg3, rompg2, dos_n } = flash_addr[18:15];
 assign csrom   =  flash_cs;
 assign romoe_n = ~flash_oe;
 assign romwe_n = ~flash_we;
 assign d = flash_oe ? 8'bZZZZZZZZ : flash_data_out;

//-----------------------------------------------------------------------------

 reg mtst_run;      initial mtst_run = 1'b0;
 wire [15:0] mtst_pass_counter;
 wire [15:0] mtst_fail_counter;

 mem_tester mtst( .clk(fclk), .rst_n(mtst_run),
                  .pass_counter(mtst_pass_counter),
                  .fail_counter(mtst_fail_counter),
                  .DRAM_DQ(rd), .DRAM_MA(ra), .DRAM_RAS0_N(rras0_n), .DRAM_RAS1_N(rras1_n),
                  .DRAM_LCAS_N(rlcas_n), .DRAM_UCAS_N(rucas_n), .DRAM_WE_N(rwe_n) );

//-----------------------------------------------------------------------------

wire vdac_mode = 1'b1;

wire [4:0] vred_raw = {vred, vred, 1'b0};
wire [4:0] vgrn_raw = {vgrn, vgrn, 1'b0};
wire [4:0] vblu_raw = {vblu, vblu, 1'b0};

`ifdef IDE_HDD
  assign ide_d = 16'hZZZZ;
  assign ide_a = 3'bZZZ;
  assign ide_dir   = 1'b1;
  assign ide_rs_n  = 1'b0;
  assign ide_cs0_n = 1'b1;
  assign ide_cs1_n = 1'b1;
  assign ide_rd_n  = 1'b1;
  assign ide_wr_n  = 1'b1;
  
`elsif IDE_VDAC
  assign ide_d[ 4: 0] = vred_raw;
  assign ide_d[ 9: 5] = vgrn_raw;
  assign ide_d[14:10] = vblu_raw;
  assign ide_d[15] = vdac_mode;
  assign ide_dir = 1'b0;      // always output
  assign ide_a[0] = 1'bZ;
  assign ide_a[1] = !fclk;
  assign ide_a[2] = vhsync;
  assign ide_rd_n = 1'bZ;
  assign ide_wr_n = 1'bZ;
  assign ide_cs0_n = 1'bZ;
  assign ide_cs1_n = vvsync;

`elsif IDE_VDAC2

  wire vdac2_msel = 1'b0;
  wire ftcs_n = 1'b1;
  wire ft_int = ide_d[1];

  assign ide_d[ 0] = vdac2_msel ? 1'bZ : vgrn_raw[2];
  assign ide_d[ 1] = vdac2_msel ? 1'bZ : vred_raw[0];
  assign ide_d[ 2] = vdac2_msel ? 1'bZ : vred_raw[1];
  assign ide_d[ 3] = vdac2_msel ? 1'bZ : vred_raw[2];
  assign ide_d[ 4] = vdac2_msel ? 1'bZ : vred_raw[3];
  assign ide_d[ 5] = vdac2_msel ? 1'bZ : vred_raw[4];
  assign ide_d[ 6] = vdac2_msel ? 1'bZ : vgrn_raw[0];
  assign ide_d[ 7] = vdac2_msel ? 1'bZ : vgrn_raw[1];
  assign ide_d[ 8] = vdac2_msel ? 1'bZ : vgrn_raw[3];
  assign ide_d[ 9] = vdac2_msel ? 1'bZ : vgrn_raw[4];
  assign ide_d[10] = vdac2_msel ? 1'bZ : vblu_raw[0];
  assign ide_d[11] = vdac2_msel ? 1'bZ : vblu_raw[1];
  assign ide_d[12] = vdac2_msel ? 1'bZ : vblu_raw[2];
  assign ide_d[13] = vdac2_msel ? 1'bZ : vblu_raw[3];
  assign ide_d[14] = vdac2_msel ? 1'bZ : vblu_raw[4];
  assign ide_d[15] = vdac2_msel ? 1'bZ : vdac_mode;  // PAL_SEL
  assign ide_rs_n = vgrn_raw[2]; // for lame RevA
  assign ide_dir = vdac2_msel;   // 0 - output, 1 - input
  assign ide_a[0] = 1'b1;  // FT812 SCK
  assign ide_a[1] = 1'b1;   // FT812 MOSI
  assign ide_a[2] = !fclk;
  assign ide_rd_n = 1'b1; // FT812 CS_n
  assign ide_wr_n = vdac2_msel;
  assign ide_cs0_n = vhsync;
  assign ide_cs1_n = vvsync;
`endif





endmodule
