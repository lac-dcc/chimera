module tennis(
 input wire glb_clk,
 input wire pixtick, // short pulse before pixel edge (period 2 MHz for TV-PAL or 4 MHz for VGA50)
 input wire reset,
 input wire lbat_human,
 input wire [8:0] lbat_move, // data sampled at rising vsync edge
 input wire rbat_human,
 input wire [8:0] rbat_move, // data sampled at rising vsync edge
 input wire tv_mode,
 input wire scanlines,       // "TV's scanlines" effect in VGA mode

 output wire hsync,          // (All syncs is negative)
 output wire vsync,          //
 output wire csync,          // Warning!
 output wire ball,           // Resync all output outside
 output wire left_bat,       // by glb_clk & pixtick
 output wire right_bat,      //
 output wire field_and_score,//
 output wire sound           //
);

//-----------------------------------------------------------------------------

// -- -- sound -- --

 reg [8:0] snd_div;     initial snd_div = 9'd0;
 reg [1:0] snd_sel;     initial snd_sel = 2'd0;

 assign sound = (snd_sel[1]) ?
                 ( (snd_sel[0]) ? snd_div[2] : snd_div[3] )
                 :
                 ( (snd_sel[0]) ? snd_div[4] : 1'b0 );

 always @(posedge glb_clk)
 begin
  if (pixlineend)
  begin
   if (lastline)
   begin
    if ( ( (ball_xpos==7'd22) & ~ball_xdir )
         |
         ( (ball_xpos==7'd105) & ball_xdir )
       )
    begin
     snd_sel <= 2'd3;
     snd_div <= 9'd0;
    end
    else if (hcoll)
    begin
     snd_sel <= 2'd2;
     snd_div <= 9'd0;
    end
    else if (vcollonfield)
    begin
     snd_sel <= 2'd1;
     snd_div <= 9'd0;
    end
    else
     snd_div <= snd_div + 9'd1;
   end
   else // ~lastline
   begin
    if (snd_div==9'h1ff)
     snd_sel <= 2'd0;
    snd_div <= snd_div + 9'd1;
   end
  end // pixlineend
 end

// -- -- image -- --

 reg [7:0] hcount;      initial hcount = 8'd0;
 reg [8:0] vcount;      initial vcount = 9'd0;
 reg hfield;            initial hfield = 1'd0;
 reg vfield;            initial vfield = 1'd0;
 wire nsync;
 wire tborder, bborder, vborder, lborder, rborder, midline, v_lbat, v_rbat;
 wire lineend, pixlineend, lastline, lastlineend, pixlastlineend;

 reg [2:0] sc_h_cnt;    initial sc_h_cnt = 3'd7;
 reg [2:0] sc_v_cnt;    initial sc_v_cnt = 3'd7;
 reg [2:0] str6_cnt;    initial str6_cnt = 3'd0;
 wire sc_img;

 assign lineend = (hcount==8'd255);
 assign pixlineend = pixtick & lineend;
 assign lastline = (vcount==9'd311);
 assign lastlineend = lastline & lineend;
 assign pixlastlineend = pixtick & lineend & lastline;
 assign v_lbat = ~(above_lbat|below_lbat);
 assign v_rbat = ~(above_rbat|below_rbat);
 assign tborder = (vcount[8:1]==8'd24); // 48...49
 assign bborder = (vcount[8:1]==8'd139); // 278...279
 assign vborder = tborder | bborder;
 assign midline = (hcount[6:0]==7'd64);
 assign nsync = (hcount[6:3]==5'he); // 112...119
 assign hsync = (hcount[6:3]!=4'hf); // 120...127
 assign vsync = (vcount[8:1]!=8'd155); // 310...311
 assign csync = nsync | ( vsync & hsync );
 assign ball = ( hcount[7] | ~scanlines ) & hfield & vfield & vb & (hcount[6:0]==ball_xpos);
 assign left_bat = ( hcount[7] | ~scanlines ) & vfield & v_lbat & (hcount[6:0]==7'd26);
 assign right_bat = ( hcount[7] | ~scanlines ) & vfield & v_rbat & (hcount[6:0]==7'd102);
 assign field_and_score = ( hcount[7] | ~scanlines )
                          &
                          ( ( hfield & vborder & ~hcount[0] )
                            |
                            ( vfield & midline & ~(vcount[2]^vcount[1]) )
                            |
                            sc_img
                          );

 score_number scnum( .value( (hcount[6]?r_score:l_score) ),
                     .x(sc_h_cnt),
                     .y(sc_v_cnt),
                     .image(sc_img)
                   );

 always @(posedge glb_clk)
 begin
  if (pixtick)
   hcount <= (hcount+8'd1) | { tv_mode, 7'd0 };
 end

 always @(posedge glb_clk)
 begin
  if      (hcount[6:0]==7'd23)   hfield <= 1'b1;
  else if (hcount[6:0]==7'd105)  hfield <= 1'b0;
 end

 always @(posedge glb_clk)
 begin
  if (pixlineend)
  begin
   if (lastline)
    vcount <= 9'd0;
   else
    vcount <= vcount+9'd1;
   end
 end

 always @(posedge glb_clk)
 begin
  if (pixtick)
  begin
   if      ( (hcount[6:0]==7'd48) | (hcount[6:0]==7'd70) ) sc_h_cnt <= 3'd0;
   else if ( (sc_h_cnt!=3'd7) & (~hcount[0]) )   sc_h_cnt <= sc_h_cnt + 3'd1;
  end
 end

 always @(posedge glb_clk)
 begin
  if (pixlineend)
  begin
   if (vfield)
   begin
    if (str6_cnt==3'd5)
    begin
     str6_cnt <= 3'd0;
     if (sc_v_cnt!=3'd7)
      sc_v_cnt <= sc_v_cnt + 3'd1;
    end
    else
     str6_cnt <= str6_cnt + 3'd1;
   end
   else
   begin
    str6_cnt <= 3'd0;
    sc_v_cnt <= 3'd0;
   end
  end
 end

 always @(negedge bborder or posedge tborder)
 begin
  if (tborder)
   vfield <= 1'b1;
  else
   vfield <= 1'b0;
 end

// -- -- ball & bat position -- --

 reg [8:0] lbat_ypos;   initial lbat_ypos = 9'd96;
 reg [8:0] rbat_ypos;   initial rbat_ypos = 9'd224;
 reg [8:0] ball_ypos;   initial ball_ypos = 9'd192;
 reg [6:0] ball_xpos;   initial ball_xpos = 7'd64;
 reg ball_ydir;         initial ball_ydir = 1'd0;
 reg ball_xdir;         initial ball_xdir = 1'd0;
 reg ball_yspd;         initial ball_yspd = 1'd1;

 wire bs = ~(vcoll^ball_ydir);
 wire hs = ~(hcoll^ball_xdir);

 always @(posedge glb_clk or posedge reset)
 begin
  if (reset)
  begin
   lbat_ypos <= 9'd96;
   rbat_ypos <= 9'd224;
   ball_ypos <= 9'd192;
   ball_xpos <= 7'd64;
   ball_ydir <= 1'd0;
   ball_xdir <= 1'd0;
   ball_yspd <= 1'd1;
  end
  else if (pixlastlineend)
  begin

   if (hcoll) ball_xdir <= ~ball_xdir;

   if (hcoll)
   begin
    if (ball_ydir^(ball_xdir?rbat_ydir:lbat_ydir))
     ball_yspd <= 1'd1;
    else
     ball_yspd <= 1'd0;
   end

   if ( (l_score!=15) & (r_score!=15) )
    ball_xpos <= ball_xpos+{hs,hs,hs,hs,hs,hs,1'd1};

   if (vcoll) ball_ydir <= ~ball_ydir;

   ball_ypos <= ball_ypos+{bs,bs,bs,bs,bs,bs,bs,bs^ball_yspd,1'b1};

   if (lbat_human)
   begin
    if (lbat_move[8])
    begin
     if ((lbat_ypos-lbat_move)>9'd279)
      lbat_ypos <= 9'd279;
     else
      lbat_ypos <= lbat_ypos - lbat_move;
    end
    else
    begin
     if (lbat_move>(lbat_ypos-9'd31))
      lbat_ypos <= 9'd31;
     else
      lbat_ypos <= lbat_ypos - lbat_move;
    end
   end
   else // ~lbat_human
   begin
    if (~ball_xdir)
    begin
     if (lbat_ydir)
      lbat_ypos <= lbat_ypos+9'd4;
     else
      lbat_ypos <= lbat_ypos-9'd3;
    end
    else
    begin
     if (lbat_ydir)
      lbat_ypos <= lbat_ypos+9'd1;
     else
      lbat_ypos <= lbat_ypos-9'd1;
    end
   end // ~lbat_human

   if (rbat_human)
   begin
    if (rbat_move[8])
    begin
     if ((rbat_ypos-rbat_move)>9'd279)
      rbat_ypos <= 9'd279;
     else
      rbat_ypos <= rbat_ypos - rbat_move;
    end
    else
    begin
     if (rbat_move>(rbat_ypos-9'd31))
      rbat_ypos <= 9'd31;
     else
      rbat_ypos <= rbat_ypos - rbat_move;
    end
   end
   else // ~rbat_human
   begin
    if (ball_xdir)
    begin
     if (rbat_ydir)
      rbat_ypos <= rbat_ypos+9'd3;
     else
      rbat_ypos <= rbat_ypos-9'd4;
    end
    else
    begin
     if (rbat_ydir)
      rbat_ypos <= rbat_ypos+9'd1;
     else
      rbat_ypos <= rbat_ypos-9'd1;
    end
   end // ~rbat_human

  end // pixlastlineend
 end

// -- -- ball & bat size; collision event; autoplayer -- --

 reg [1:0] vbcnt;       initial vbcnt = 2'd0;
 reg [3:0] vlcnt;       initial vlcnt = 4'd0;
 reg [3:0] vrcnt;       initial vrcnt = 4'd0;
 reg prev_ball;         initial prev_ball = 1'd0;
 reg prev_lbat;         initial prev_lbat = 1'd0;
 reg hcoll;             initial hcoll = 1'd0;
 reg vcoll;             initial vcoll = 1'd0;
 reg vcollonfield;      initial vcollonfield = 1'd0;
 reg newline;           initial newline = 1'd0;
 reg vb;                initial vb = 1'd0;

 reg above_lbat;        initial above_lbat = 1'd1;
 reg below_lbat;        initial below_lbat = 1'd0;
 reg above_rbat;        initial above_rbat = 1'd1;
 reg below_rbat;        initial below_rbat = 1'd0;
 reg lbat_ydir;         initial lbat_ydir = 1'd0;
 reg rbat_ydir;         initial rbat_ydir = 1'd0;

 reg [3:0] l_score;     initial l_score = 4'd0;
 reg [3:0] r_score;     initial r_score = 4'd0;

 always @(posedge glb_clk)
 begin
  if (vb)
  begin
   if      (above_lbat)  lbat_ydir <= 1'b0;
   else if (below_lbat)  lbat_ydir <= 1'b1;
   if      (above_rbat)  rbat_ydir <= 1'b0;
   else if (below_rbat)  rbat_ydir <= 1'b1;
  end
 end

 always @(posedge glb_clk)
 begin
  if (pixtick)
  begin
   newline <= lineend;
   prev_lbat <= left_bat;
   prev_ball <= ball;
  end
 end

 always @(posedge glb_clk)
 begin
  if (pixtick)
  begin
   if (lastlineend)
   begin
    hcoll <= 1'b0;
    vcoll <= 1'b0;
    vcollonfield <= 1'b0;
   end
   else // ~lastlineend
   begin
    if ( ( prev_lbat & ball & ~ball_xdir ) |
         ( prev_ball & right_bat & ball_xdir ) )
     hcoll <= 1'b1;
    if ( ball & vborder )
     vcollonfield <= 1'b1;
    if ( vb & ~newline &
              ( ( tborder & ~ball_ydir )
                |
                ( bborder & ball_ydir )
              )
       )
     vcoll <= 1'b1;
   end // ~lastlineend
  end
 end

 always @(posedge glb_clk)
 begin
  if (pixtick)
  begin
   if (lineend)
   begin
    if (lastline)
    begin
     above_lbat <= 1'b1;
     below_lbat <= 1'b0;
     above_rbat <= 1'b1;
     below_rbat <= 1'b0;
     vbcnt <= 2'd0;
     vlcnt <= 4'd0;
     vrcnt <= 4'd0;
    end
    else // ~lastline
    begin

     if (vcount==ball_ypos)  vb <= 1'b1;
     if (vb)
     begin
      vbcnt <= vbcnt+2'd1;
      if (vbcnt==2'd3)  vb <= 1'b0;
     end

     if (vcount==lbat_ypos)  above_lbat <= 1'b0;
     if (v_lbat)
     begin
      vlcnt <= vlcnt+4'd1;
      if (vlcnt==4'd15)  below_lbat <= 1'b1;
     end

     if (vcount==rbat_ypos)  above_rbat <= 1'b0;
     if (v_rbat)
     begin
      vrcnt <= vrcnt+4'd1;
      if (vrcnt==4'd15)  below_rbat <= 1'b1;
     end

    end // ~lastline

   end // lineend
  end // pixtick
 end

 always @(posedge glb_clk)
 begin
  if ( reset |
       ( ~lbat_human & ~rbat_human & ( (l_score==4'd15) | (r_score==4'd15) ) )
     )
  begin
   l_score <= 4'd0;
   r_score <= 4'd0;
  end
  else
  if (pixlastlineend)
  begin
   if ( (ball_xpos==7'd105) & ball_xdir)
    l_score <= l_score + 4'd1;
   if ( (ball_xpos==7'd22) & ~ball_xdir)
    r_score <= r_score + 4'd1;
  end
 end

//-----------------------------------------------------------------------------

endmodule

//=============================================================================

module score_number(
 input wire [3:0] value,
 input wire [2:0] x,
 input wire [2:0] y,

 output wire image
);

 reg [7:0] ss;
 reg i;

 always @(*)
 begin
  case (value)  //1gfedcba
   4'h0: ss <= 8'b00111111;
   4'h1: ss <= 8'b00000110;
   4'h2: ss <= 8'b01011011;
   4'h3: ss <= 8'b01001111;
   4'h4: ss <= 8'b01100110;
   4'h5: ss <= 8'b01101101;
   4'h6: ss <= 8'b01111101;
   4'h7: ss <= 8'b00000111;
   4'h8: ss <= 8'b01111111;
   4'h9: ss <= 8'b01101111;
   4'ha: ss <= 8'b10111111;
   4'hb: ss <= 8'b10000110;
   4'hc: ss <= 8'b11011011;
   4'hd: ss <= 8'b11001111;
   4'he: ss <= 8'b11100110;
   4'hf: ss <= 8'b11101101;
  endcase
 end

 always @(*)
 begin
  case (y)
   3'd1: case (x)
          3'd0: i <= ss[7];
          3'd2: i <= ss[0]|ss[5];
          3'd3: i <= ss[0];
          3'd4: i <= ss[0]|ss[1];
          default: i <= 1'b0;
         endcase
   3'd2: case (x)
          3'd0: i <= ss[7];
          3'd2: i <= ss[5];
          3'd4: i <= ss[1];
          default: i <= 1'b0;
         endcase
   3'd3: case (x)
          3'd0: i <= ss[7];
          3'd2: i <= ss[6]|ss[5]|ss[4];
          3'd3: i <= ss[6];
          3'd4: i <= ss[6]|ss[1]|ss[2];
          default: i <= 1'b0;
         endcase
   3'd4: case (x)
          3'd0: i <= ss[7];
          3'd2: i <= ss[4];
          3'd4: i <= ss[2];
          default: i <= 1'b0;
         endcase
   3'd5: case (x)
          3'd0: i <= ss[7];
          3'd2: i <= ss[3]|ss[4];
          3'd3: i <= ss[3];
          3'd4: i <= ss[3]|ss[2];
          default: i <= 1'b0;
         endcase
   default: i <= 1'b0;
  endcase
 end

 assign image = i;

endmodule

//=============================================================================
