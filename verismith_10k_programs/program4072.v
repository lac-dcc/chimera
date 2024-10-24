module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire210;
  wire signed [(5'h10):(1'h0)] wire208;
  wire [(5'h11):(1'h0)] wire206;
  wire [(5'h12):(1'h0)] wire19;
  assign y = {wire210, wire208, wire206, wire19, (1'h0)};
  module5 #() modinst20 (.clk(clk), .wire9(wire2), .wire10(wire3), .wire8(wire0), .wire6(wire4), .wire7(wire1), .y(wire19));
  module21 #() modinst207 (.wire25(wire3), .clk(clk), .wire22(wire0), .y(wire206), .wire24(wire19), .wire23(wire1));
  module101 #() modinst209 (.wire102(wire0), .wire105(wire2), .y(wire208), .wire104(wire19), .wire103(wire1), .clk(clk));
  assign wire210 = $signed(($signed(wire0[(3'h7):(2'h3)]) >>> $signed(wire4[(4'h8):(3'h5)])));
endmodule

module module21
#(parameter param204 = (~(~&{((^(8'hb8)) ~^ (8'ha7))})), 
parameter param205 = param204)
(y, clk, wire22, wire23, wire24, wire25);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire22;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire [(5'h12):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire203;
  wire signed [(4'hf):(1'h0)] wire201;
  wire signed [(4'hc):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(2'h2):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire90;
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  assign y = {wire203,
                 wire201,
                 wire132,
                 wire131,
                 wire130,
                 wire128,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire42,
                 wire90,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg43,
                 reg44,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg26 <= ($unsigned($signed($unsigned({wire23,
          wire22}))) != (wire22[(4'hb):(4'h9)] + ($unsigned((wire24 ?
              wire23 : wire24)) ?
          $signed(wire23[(1'h0):(1'h0)]) : (^((7'h41) << wire25)))));
      reg27 <= (!(^~$unsigned((-wire25[(2'h3):(1'h0)]))));
      reg28 <= {wire24[(1'h0):(1'h0)], wire24};
      reg29 <= $unsigned({wire24[(1'h1):(1'h0)], {(7'h42)}});
      reg30 <= wire25;
    end
  always
    @(posedge clk) begin
      if (($unsigned($unsigned($unsigned((8'ha6)))) ?
          (((8'hb6) ? $unsigned($unsigned(reg29)) : reg27) <<< reg27) : wire23))
        begin
          reg31 <= wire23[(3'h7):(3'h4)];
          reg32 <= (({$signed($signed(wire25))} == {$unsigned(wire25[(3'h4):(1'h0)])}) <= $signed((~&reg26[(2'h2):(2'h2)])));
          reg33 <= ((8'ha1) <<< ({wire23[(2'h3):(2'h3)]} ~^ ($signed((|(8'hb4))) ?
              reg32 : ((|(8'ha7)) + reg29))));
          reg34 <= ((reg32 ?
              reg33[(1'h1):(1'h0)] : (!$signed((reg26 ?
                  wire22 : reg29)))) | (((~^reg32) * (+$unsigned(reg31))) && ((~|$unsigned(wire24)) ?
              (8'ha4) : reg30[(4'hb):(2'h2)])));
          if ((($signed((~&reg26[(1'h1):(1'h0)])) | $signed($signed($unsigned(reg29)))) ?
              {reg30} : $signed($signed($signed((+wire23))))))
            begin
              reg35 <= {(^~({(reg34 ? (8'ha2) : (8'hb9))} ?
                      $signed((7'h44)) : {$unsigned(wire24),
                          (reg34 | (7'h43))}))};
              reg36 <= {(&reg35[(4'h8):(1'h0)]),
                  ($unsigned(((wire25 ? wire25 : wire23) ?
                          wire25 : (reg26 ? reg30 : (8'hb5)))) ?
                      $signed($unsigned($unsigned(wire22))) : reg29)};
              reg37 <= (-(reg26[(4'hc):(2'h2)] >>> (((reg32 >= reg34) ?
                  (^reg34) : {reg29}) ^ reg28)));
              reg38 <= reg37[(4'hf):(2'h2)];
            end
          else
            begin
              reg35 <= ((~({$signed(wire22)} <<< (~$signed(reg38)))) ?
                  {$signed(reg32), reg31[(5'h11):(4'h9)]} : (wire24 ?
                      reg34 : (wire22 ?
                          ((+(7'h41)) ?
                              $unsigned((7'h43)) : (reg34 ?
                                  reg27 : reg28)) : ($signed(reg26) <<< (8'ha9)))));
            end
        end
      else
        begin
          reg31 <= $signed(wire22[(4'h9):(3'h4)]);
          reg32 <= $signed(wire23);
          if ($signed($unsigned(((reg36[(1'h1):(1'h1)] == wire24) ?
              reg36[(4'he):(4'hc)] : ($unsigned(reg28) ?
                  (|wire25) : $unsigned(reg30))))))
            begin
              reg33 <= (|($unsigned((&reg28[(2'h2):(1'h0)])) ?
                  reg33 : ($unsigned((wire24 ?
                      reg31 : reg31)) ^~ ((~|reg32) != $signed((8'ha7))))));
              reg34 <= reg38[(2'h3):(1'h1)];
              reg35 <= {{$unsigned($unsigned(wire22))},
                  ($signed((reg27[(4'h8):(3'h6)] * (-reg28))) ?
                      reg28 : reg29[(3'h5):(1'h1)])};
              reg36 <= reg29[(3'h7):(3'h6)];
              reg37 <= (reg26[(5'h12):(4'hc)] ?
                  $signed($unsigned(((+reg36) > (^wire22)))) : reg31[(4'hc):(4'ha)]);
            end
          else
            begin
              reg33 <= (!(((~|(reg32 + (8'hb7))) ?
                      reg35 : (-reg30[(3'h5):(1'h0)])) ?
                  (!(reg31 ?
                      (wire22 ?
                          reg35 : reg35) : (+wire22))) : reg32[(3'h5):(3'h4)]));
              reg34 <= $signed($unsigned(reg30[(2'h3):(1'h1)]));
              reg35 <= reg30;
            end
          if ($unsigned(reg29))
            begin
              reg38 <= reg26[(4'ha):(3'h7)];
              reg39 <= $signed($unsigned((((~&reg32) >= $signed(reg29)) ?
                  wire24 : $unsigned($unsigned((8'hb1))))));
              reg40 <= reg26[(4'hb):(4'h8)];
              reg41 <= $unsigned($unsigned({{reg32[(3'h4):(2'h2)]}}));
            end
          else
            begin
              reg38 <= $signed((8'ha7));
            end
        end
    end
  assign wire42 = (reg30 * (8'hb1));
  always
    @(posedge clk) begin
      reg43 <= $signed(reg33);
      reg44 <= $unsigned({$unsigned((^~$signed(reg27))), reg30});
      reg45 <= {(+reg30), $unsigned(reg38[(1'h0):(1'h0)])};
    end
  module46 #() modinst91 (wire90, clk, reg40, wire22, reg43, reg36, reg29);
  assign wire92 = {$signed((((+reg29) - (|reg29)) ?
                          {reg41[(4'he):(4'h8)]} : wire90)),
                      {reg41}};
  assign wire93 = $unsigned((wire42[(1'h1):(1'h0)] ?
                      ($signed(reg35) > wire23[(1'h1):(1'h0)]) : (~^(reg27 > (reg30 * (8'h9c))))));
  assign wire94 = (^reg33[(2'h2):(1'h1)]);
  assign wire95 = reg38[(3'h4):(3'h4)];
  assign wire96 = (($unsigned((~^(reg36 ? reg45 : reg45))) ?
                          reg34[(3'h4):(3'h4)] : (+(wire24[(1'h1):(1'h0)] ?
                              reg41[(4'he):(4'hb)] : reg32[(3'h4):(1'h1)]))) ?
                      {wire23[(1'h0):(1'h0)],
                          wire92[(3'h5):(3'h4)]} : (~|$unsigned((8'h9f))));
  assign wire97 = (reg29[(4'h8):(3'h7)] != ({{(reg40 ?
                              (8'hba) : reg39)}} <= $unsigned($signed(reg28))));
  assign wire98 = $unsigned($unsigned((8'hb7)));
  assign wire99 = (!wire90[(4'h8):(4'h8)]);
  assign wire100 = reg30[(1'h1):(1'h1)];
  module101 #() modinst129 (.wire105(reg40), .wire104(reg37), .wire103(reg27), .wire102(reg34), .clk(clk), .y(wire128));
  assign wire130 = $signed(wire90);
  assign wire131 = $unsigned({reg40[(3'h5):(2'h3)]});
  assign wire132 = (~&$signed((($signed((8'ha2)) ? reg41 : wire98) ~^ wire23)));
  module133 #() modinst202 (.wire135(reg34), .wire137(wire131), .wire138(wire92), .wire136(wire24), .y(wire201), .wire134(wire23), .clk(clk));
  assign wire203 = ((+(!$unsigned({wire25}))) ?
                       reg28 : (wire128 < (~|$unsigned((wire92 ?
                           wire24 : wire95)))));
endmodule

module module5
#(parameter param18 = ((({((8'hbf) ? (7'h41) : (7'h41))} ? {(~(8'hb4))} : (((8'had) ? (7'h42) : (8'had)) & ((8'ha7) >>> (7'h40)))) >>> (((^~(8'h9d)) ? (+(8'hbb)) : (-(8'hb8))) ^~ (((8'h9d) ? (8'hb3) : (8'ha1)) <= ((7'h44) ^ (8'had))))) ? (((8'hae) ? ((~&(8'hae)) | ((8'hbc) ? (8'had) : (8'had))) : (-((8'h9c) & (8'hb6)))) ? ((((8'ha2) * (7'h41)) >= {(8'hb4), (8'haa)}) ? (((8'hb9) ? (8'ha4) : (8'ha0)) ? (~|(8'hbe)) : (!(8'hb6))) : (((8'h9e) | (8'h9c)) ? ((8'ha5) || (8'hb6)) : (|(8'hb9)))) : {{((8'hac) ? (7'h41) : (8'h9f)), ((8'ha8) < (7'h40))}}) : (((8'hb6) ~^ (~&{(8'hab), (7'h41)})) ~^ ((^~((8'hb3) ~^ (8'hb3))) - (^~(~^(8'hb0)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  assign y = {wire17, wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = wire6[(1'h0):(1'h0)];
  assign wire12 = wire8;
  assign wire13 = ($unsigned($unsigned($signed((-(8'ha3))))) != (!(8'hb3)));
  assign wire14 = wire11;
  assign wire15 = (~|$unsigned(($signed($unsigned(wire10)) ?
                      (~^wire12) : (-(wire13 ? wire8 : wire9)))));
  assign wire16 = (wire9[(3'h6):(1'h0)] || {$unsigned((-(wire8 ?
                          wire14 : wire11)))});
  assign wire17 = ((~(($signed(wire14) || $signed(wire12)) ?
                      ($unsigned(wire7) ?
                          (wire12 ?
                              wire8 : wire13) : wire14) : wire9)) <<< wire16);
endmodule

module module133
#(parameter param199 = ((((~&((8'hbe) ? (8'ha9) : (8'ha1))) ? (~&((8'hbc) & (8'ha4))) : (((8'hbf) ? (7'h41) : (8'haf)) ? ((8'ha7) <<< (8'had)) : (&(8'hb3)))) ? (8'hb9) : (((8'hbe) ? (+(8'hae)) : (8'hb1)) ? (^(~^(8'haa))) : (+((7'h44) ? (7'h44) : (8'ha7))))) ? (~{(8'hbf)}) : (~(~&((+(7'h43)) | (-(8'ha2)))))), 
parameter param200 = param199)
(y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'h2a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire138;
  input wire signed [(2'h3):(1'h0)] wire137;
  input wire signed [(5'h12):(1'h0)] wire136;
  input wire [(3'h4):(1'h0)] wire135;
  input wire [(3'h4):(1'h0)] wire134;
  wire signed [(4'hb):(1'h0)] wire198;
  wire [(4'h9):(1'h0)] wire197;
  wire [(4'hb):(1'h0)] wire196;
  wire signed [(4'h9):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire194;
  wire [(4'h9):(1'h0)] wire193;
  wire signed [(5'h15):(1'h0)] wire168;
  wire [(5'h11):(1'h0)] wire167;
  wire signed [(4'hc):(1'h0)] wire166;
  wire signed [(4'ha):(1'h0)] wire144;
  wire [(3'h4):(1'h0)] wire143;
  reg [(4'h8):(1'h0)] reg192 = (1'h0);
  reg [(3'h7):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg189 = (1'h0);
  reg [(4'hb):(1'h0)] reg188 = (1'h0);
  reg [(3'h4):(1'h0)] reg187 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg185 = (1'h0);
  reg [(4'h8):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  reg [(4'hd):(1'h0)] reg181 = (1'h0);
  reg [(5'h11):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg176 = (1'h0);
  reg [(4'hc):(1'h0)] reg175 = (1'h0);
  reg [(4'ha):(1'h0)] reg174 = (1'h0);
  reg [(3'h6):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(2'h3):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(4'hd):(1'h0)] reg164 = (1'h0);
  reg [(4'h9):(1'h0)] reg163 = (1'h0);
  reg [(3'h7):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(5'h12):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire168,
                 wire167,
                 wire166,
                 wire144,
                 wire143,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg139 <= $unsigned(wire134);
      reg140 <= reg139[(1'h0):(1'h0)];
      reg141 <= (($signed(wire135[(2'h2):(2'h2)]) ?
              ({(wire136 ? reg140 : wire137),
                  (&wire138)} >> (^reg139[(2'h3):(1'h1)])) : wire136[(5'h12):(3'h7)]) ?
          (wire138 * $unsigned((reg140 >>> reg139[(2'h2):(2'h2)]))) : (-((wire135[(1'h0):(1'h0)] ?
                  (reg139 ? wire134 : wire134) : $unsigned(wire136)) ?
              ((wire136 & wire138) ?
                  $unsigned(reg139) : {wire136}) : {$signed(wire138),
                  {wire137}})));
      reg142 <= wire137;
    end
  assign wire143 = wire138;
  assign wire144 = (~|(wire135 ?
                       (-$signed((wire136 ?
                           wire138 : reg141))) : wire136[(4'hf):(1'h0)]));
  always
    @(posedge clk) begin
      if (($unsigned({({(8'ha1), wire136} | (8'h9e))}) ?
          ($unsigned({(|wire138)}) ?
              (^(^(8'hb0))) : ($signed((reg142 ? (8'ha7) : reg140)) ?
                  wire134[(1'h1):(1'h0)] : (reg139[(3'h6):(1'h0)] & (wire144 ?
                      wire144 : reg139)))) : wire144[(4'ha):(3'h7)]))
        begin
          reg145 <= ($unsigned((^~(~{reg141, wire144}))) ?
              (^(~|$signed(wire136[(5'h10):(2'h2)]))) : (8'ha4));
          reg146 <= reg140[(3'h7):(3'h5)];
          if ((~&$signed(reg141[(3'h5):(2'h2)])))
            begin
              reg147 <= (^~$signed($signed(wire138[(4'ha):(4'h8)])));
              reg148 <= ({$signed($signed((reg142 >= reg147))),
                  (((~reg145) >= $unsigned(reg147)) ?
                      $unsigned(reg139[(3'h7):(3'h7)]) : ($signed(wire135) ?
                          wire144 : wire144[(2'h2):(2'h2)]))} >> (reg147 ^~ (((|wire144) ?
                  (~^wire137) : {wire136}) < $unsigned({wire137}))));
              reg149 <= {((((reg142 << reg142) || wire135[(1'h0):(1'h0)]) ^~ $signed((wire137 ?
                          reg145 : (8'hb3)))) ?
                      (7'h42) : ((wire136[(3'h5):(2'h2)] >> $signed(wire143)) | $signed(reg140)))};
              reg150 <= $unsigned($signed($signed(reg148)));
              reg151 <= $signed(wire138[(4'h8):(3'h5)]);
            end
          else
            begin
              reg147 <= {wire134,
                  (&((^~reg140) <= $unsigned($unsigned(wire144))))};
              reg148 <= $signed((8'hbd));
            end
          if ((reg149[(4'ha):(1'h0)] ?
              (-wire138) : ((({reg140} ?
                      reg140[(4'hf):(1'h0)] : (reg141 || wire138)) == $signed(wire143)) ?
                  {wire137,
                      ($signed(wire144) ?
                          (^(8'ha1)) : reg147)} : ((-((8'hb1) <<< wire135)) ?
                      wire136 : reg150[(5'h11):(4'h9)]))))
            begin
              reg152 <= reg147[(4'h9):(3'h7)];
            end
          else
            begin
              reg152 <= {wire134[(2'h2):(1'h0)], reg142};
            end
          if (($unsigned(wire138[(4'ha):(1'h1)]) ?
              $unsigned(((wire136[(4'he):(4'h9)] << $unsigned(reg150)) ?
                  ((!wire144) - $signed(reg152)) : ((reg142 & reg146) << $signed(wire138)))) : (~((wire136[(3'h5):(2'h2)] ?
                  {wire143} : $signed(wire137)) >>> {(reg146 < (8'hbe))}))))
            begin
              reg153 <= (reg152[(1'h1):(1'h0)] >>> (8'hac));
            end
          else
            begin
              reg153 <= wire143;
              reg154 <= (!$unsigned(reg146[(4'h9):(1'h0)]));
              reg155 <= {wire136[(4'hd):(3'h7)],
                  $signed($unsigned($signed(reg150[(2'h3):(1'h1)])))};
              reg156 <= $signed(reg151[(4'ha):(1'h0)]);
            end
        end
      else
        begin
          reg145 <= ((wire144[(4'h9):(1'h1)] && wire135[(1'h0):(1'h0)]) ?
              {(reg149 ^~ $signed((reg151 ? reg147 : reg150))),
                  reg152[(4'hb):(1'h0)]} : (reg152[(1'h1):(1'h0)] ?
                  ((wire135[(3'h4):(2'h3)] ~^ $signed(reg145)) ?
                      ($signed(wire144) ?
                          (^reg152) : reg148[(4'h9):(3'h5)]) : $unsigned((8'hbc))) : ($signed($signed(wire143)) ?
                      $unsigned($unsigned(reg142)) : $unsigned((-wire143)))));
          reg146 <= ((wire138[(3'h5):(2'h2)] <<< (((wire135 ?
                      reg140 : reg146) + reg151) ?
                  (^~$signed(reg156)) : (((8'ha3) ?
                      reg142 : wire136) < wire136[(3'h6):(1'h1)]))) ?
              $signed(({$signed(reg149), (^~wire135)} ?
                  ((~&reg153) ?
                      (reg152 == wire143) : {reg151,
                          reg142}) : $signed((8'hb4)))) : (wire143[(1'h0):(1'h0)] != wire137));
          reg147 <= wire136[(1'h0):(1'h0)];
          if (wire138[(2'h3):(2'h3)])
            begin
              reg148 <= (((($unsigned(reg152) ?
                          (~^wire143) : wire137[(2'h3):(2'h2)]) ?
                      {reg140} : reg146[(4'he):(2'h3)]) ?
                  $signed(((reg149 ? wire136 : reg147) ?
                      reg153 : $signed(reg150))) : $signed(reg151)) >= (^~reg139[(3'h6):(3'h5)]));
              reg149 <= $unsigned($unsigned(((~|(reg152 ? reg150 : reg154)) ?
                  ($signed(reg154) ?
                      reg150[(4'hd):(4'ha)] : {reg156}) : reg152[(3'h5):(3'h5)])));
              reg150 <= ($unsigned($signed((!reg155))) ?
                  $signed((reg153[(2'h3):(1'h0)] ?
                      ((wire143 ? wire135 : (8'hae)) ?
                          (~|reg147) : reg154) : $signed($unsigned(reg156)))) : ((reg149 ?
                      $unsigned({reg154}) : reg152[(4'hc):(4'hb)]) > (((reg149 * reg140) ^~ (8'hbf)) & $unsigned($unsigned(reg152)))));
              reg151 <= $signed((|(8'hb4)));
              reg152 <= (!($signed(reg151) >>> (-(((8'h9c) ?
                  reg154 : wire143) || (~&reg149)))));
            end
          else
            begin
              reg148 <= {$signed(({(reg148 > reg153)} ?
                      ((reg152 ?
                          wire136 : reg142) >> (+wire136)) : $unsigned(reg139[(2'h3):(2'h3)])))};
              reg149 <= ((~|(^(~|wire138))) >> (+$signed((^~$signed((8'hba))))));
              reg150 <= (!reg147);
              reg151 <= $unsigned((~&reg154[(2'h3):(2'h2)]));
              reg152 <= ($signed($signed((~((8'ha3) ? wire143 : reg148)))) ?
                  $signed({wire144}) : (wire138 != (wire144 != $signed((reg156 ?
                      (8'h9d) : wire143)))));
            end
          reg153 <= (reg142[(1'h0):(1'h0)] ?
              (|(($unsigned(reg156) ^~ $unsigned(reg156)) ?
                  reg150 : $signed(reg145))) : (+reg156));
        end
      reg157 <= $signed((reg155 | reg139[(2'h3):(1'h0)]));
      reg158 <= $signed({{({wire137, reg155} <<< reg154[(4'hf):(4'h9)])},
          ((&$signed(reg139)) ?
              {(reg156 ~^ reg149), (reg140 != reg155)} : ({reg156, (8'hbe)} ?
                  (reg151 ? reg142 : wire144) : (reg155 ? reg140 : wire138)))});
      reg159 <= (|{{(8'hbc)}});
      if ({(&($unsigned((reg148 ? reg152 : reg157)) ?
              wire143 : $signed((8'hb3))))})
        begin
          reg160 <= reg154;
          if ($unsigned((8'hbe)))
            begin
              reg161 <= ((^$unsigned(reg159)) ?
                  reg141 : {reg158,
                      (wire134[(3'h4):(1'h1)] - ((reg150 == reg148) ?
                          reg142 : reg156[(4'hd):(4'h9)]))});
              reg162 <= (+(($unsigned((-reg159)) - {(|reg160),
                      (wire134 >= wire135)}) ?
                  $unsigned($signed($unsigned(reg141))) : $unsigned($signed((reg145 - reg146)))));
              reg163 <= {$unsigned($signed($unsigned(reg145[(3'h5):(2'h2)])))};
            end
          else
            begin
              reg161 <= {({$unsigned((^~reg162))} ?
                      (|reg158) : {reg141, ((~&reg154) || reg148)})};
              reg162 <= reg162[(2'h3):(2'h2)];
              reg163 <= ((-({(-reg157),
                  wire138} <<< (~{reg147}))) << ($signed((^wire144)) == {$unsigned(reg146[(3'h5):(1'h0)])}));
            end
          reg164 <= $unsigned(reg142);
        end
      else
        begin
          if ((!$unsigned((~($unsigned(reg153) ?
              (-wire137) : {wire144, wire143})))))
            begin
              reg160 <= (+(!$unsigned((wire135[(1'h1):(1'h0)] != wire137))));
              reg161 <= {reg160};
            end
          else
            begin
              reg160 <= ($unsigned(({(wire144 >>> reg142),
                  reg164} >> ($unsigned((8'hbf)) ?
                  (reg148 ?
                      reg142 : reg149) : $unsigned(reg151)))) != ($unsigned(((~&reg140) <= $signed(reg155))) ?
                  {$unsigned(reg151[(4'ha):(4'h9)]), wire143} : (8'h9d)));
              reg161 <= $signed(reg155);
              reg162 <= {((^~(^~reg152)) ?
                      $signed({(reg151 & reg141)}) : $unsigned($unsigned($unsigned((7'h44)))))};
            end
          if ((~(!$unsigned($signed(wire144[(3'h4):(3'h4)])))))
            begin
              reg163 <= (reg154[(1'h1):(1'h0)] ~^ ($signed(((reg149 ?
                      (8'h9c) : reg150) ?
                  (wire144 ^~ wire135) : $unsigned(reg140))) > (~^(reg148 && $signed(reg139)))));
              reg164 <= ((~|(|$unsigned((reg150 ~^ (8'ha2))))) >>> ($signed($unsigned(reg163[(3'h6):(2'h3)])) <= $unsigned(wire143)));
              reg165 <= {($signed(({reg157, reg153} >> (reg161 != (8'hae)))) ?
                      reg156[(4'h9):(3'h5)] : $unsigned((~(reg152 >> reg154))))};
            end
          else
            begin
              reg163 <= $unsigned((~|{reg161,
                  ((reg150 ? reg155 : reg158) ?
                      (reg149 != (8'ha0)) : reg158)}));
            end
        end
    end
  assign wire166 = (&$unsigned($signed((^~(~&reg155)))));
  assign wire167 = $unsigned((reg140[(4'h9):(3'h7)] ?
                       reg145 : $unsigned(reg152)));
  assign wire168 = $signed(wire135[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      if (((!{reg164}) ^~ (~|(~|$signed((~wire134))))))
        begin
          if (($unsigned(wire166[(4'h9):(3'h6)]) ?
              (&reg158) : {((wire143[(1'h1):(1'h1)] ?
                      ((8'hbf) << reg153) : $signed((8'hb1))) + {reg145})}))
            begin
              reg169 <= $signed($signed($signed(($signed(reg149) ?
                  {reg151, reg156} : (~^reg164)))));
            end
          else
            begin
              reg169 <= wire143;
              reg170 <= (&(^($unsigned((-reg149)) ?
                  $signed((reg149 | reg162)) : ($signed(reg142) ?
                      $unsigned(wire135) : wire136[(5'h10):(4'he)]))));
              reg171 <= (reg148[(4'hd):(1'h1)] != ($signed(($signed(reg148) * wire137[(2'h2):(1'h1)])) ?
                  (($signed(wire168) ?
                          (!wire168) : ((8'h9f) ? reg165 : wire167)) ?
                      ($signed((7'h40)) ?
                          reg170[(1'h1):(1'h1)] : $signed(reg165)) : ($signed(reg157) == $signed(reg160))) : reg150));
              reg172 <= reg154[(4'h9):(1'h1)];
              reg173 <= (+$signed($unsigned($unsigned(reg163[(3'h5):(1'h1)]))));
            end
          reg174 <= (reg142[(1'h0):(1'h0)] ? reg148 : reg165[(3'h7):(2'h2)]);
          if ($signed((reg162 ?
              {(-reg140[(2'h3):(2'h2)])} : ($unsigned((wire166 ?
                      reg171 : reg170)) ?
                  {$unsigned((8'had))} : ((reg154 & reg156) & (reg147 * reg161))))))
            begin
              reg175 <= (+$signed(reg158[(3'h5):(3'h4)]));
            end
          else
            begin
              reg175 <= (reg148 != reg151[(4'hb):(3'h6)]);
              reg176 <= ((^~$signed(reg150[(4'h9):(2'h2)])) + $signed(($signed((+wire143)) ?
                  (~$unsigned(reg146)) : reg169[(2'h3):(1'h0)])));
              reg177 <= $unsigned((~^$unsigned(((wire137 & wire138) ^~ reg142[(1'h1):(1'h0)]))));
              reg178 <= ($unsigned(({{reg164,
                      wire166}} - reg170[(1'h1):(1'h1)])) <= wire166);
            end
          reg179 <= ((reg141 ^~ $signed(reg147[(3'h6):(1'h0)])) == wire135[(2'h3):(2'h3)]);
        end
      else
        begin
          reg169 <= $unsigned($signed(reg148));
          if (wire166)
            begin
              reg170 <= reg179[(2'h3):(2'h2)];
            end
          else
            begin
              reg170 <= $unsigned(reg170);
              reg171 <= (+$signed($signed({((8'ha8) ^ reg161), (~|reg142)})));
              reg172 <= reg163;
              reg173 <= ($unsigned($unsigned($signed(((8'ha6) && (8'hb7))))) & {($unsigned($unsigned(reg139)) + $unsigned($signed(reg147)))});
              reg174 <= (~|$signed((~^((!reg149) ?
                  reg140 : (wire143 != reg147)))));
            end
          reg175 <= $unsigned($signed((reg176 ?
              $signed((~reg161)) : {$unsigned(wire166)})));
          reg176 <= $unsigned((~^reg148[(5'h11):(3'h6)]));
        end
      reg180 <= reg172[(3'h7):(3'h7)];
      reg181 <= $signed($unsigned({(reg176 < (8'hbd)), (^(reg160 < (7'h42)))}));
      reg182 <= ($signed(wire134) ?
          $signed((-((~reg170) ? reg178 : (~|reg180)))) : reg173);
    end
  always
    @(posedge clk) begin
      reg183 <= (&{(({reg151} * (wire135 >>> reg161)) <<< reg145[(2'h3):(1'h1)]),
          $signed($signed((-reg159)))});
      if (reg177)
        begin
          reg184 <= reg156[(5'h11):(4'hd)];
          reg185 <= (|$signed({$unsigned(wire166[(4'h8):(3'h5)])}));
          if ((reg153 ?
              $unsigned((~^(8'ha3))) : (($unsigned(wire166[(3'h5):(2'h2)]) && ($signed(reg158) ?
                      $unsigned(reg140) : reg169)) ?
                  (8'hbc) : ($unsigned($signed(reg163)) ?
                      ($signed(wire136) & (wire144 <= wire144)) : $signed((reg158 & reg165))))))
            begin
              reg186 <= reg178;
              reg187 <= reg147[(3'h4):(2'h2)];
              reg188 <= reg179;
              reg189 <= (~&reg145);
            end
          else
            begin
              reg186 <= reg147[(3'h6):(1'h1)];
              reg187 <= reg161[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg184 <= (wire137 != wire144);
          reg185 <= (+wire168[(3'h7):(3'h4)]);
          if (reg140)
            begin
              reg186 <= (^~{$signed({(8'hb1), (+reg154)}), reg162});
              reg187 <= (~^$unsigned((7'h44)));
              reg188 <= (wire134 ?
                  (~|reg158) : ($signed(($unsigned(reg174) || wire134)) - $unsigned($signed(reg189[(3'h4):(2'h3)]))));
              reg189 <= ((reg157 << reg186) ?
                  (reg153 ?
                      reg177[(4'hf):(4'hd)] : ({reg179,
                          reg142[(1'h0):(1'h0)]} & $unsigned((reg150 ?
                          reg174 : reg148)))) : $signed(($unsigned((7'h44)) ?
                      (~$unsigned(reg141)) : {$unsigned(wire138)})));
              reg190 <= $unsigned((wire167[(1'h1):(1'h0)] >= reg173));
            end
          else
            begin
              reg186 <= reg156[(3'h5):(1'h0)];
              reg187 <= $unsigned($unsigned({((8'haf) & reg185[(3'h7):(2'h2)]),
                  reg150[(4'hc):(1'h1)]}));
              reg188 <= $signed($unsigned((|(~|reg186[(4'hc):(4'h9)]))));
              reg189 <= $signed(($unsigned(reg182) ?
                  ($signed(reg181[(3'h7):(3'h7)]) ?
                      $signed((-wire135)) : {reg146}) : $unsigned((+((8'hb8) ?
                      (8'ha4) : wire137)))));
              reg190 <= reg175;
            end
          reg191 <= reg160[(1'h0):(1'h0)];
        end
      reg192 <= reg191[(2'h2):(1'h0)];
    end
  assign wire193 = reg178[(1'h0):(1'h0)];
  assign wire194 = ($unsigned((reg192[(4'h8):(1'h0)] ^~ ($unsigned(reg157) ^ reg160))) ?
                       $signed(reg164) : $signed({(reg154[(4'hd):(3'h4)] ?
                               $unsigned((8'hb8)) : reg156[(4'he):(4'ha)]),
                           ($signed(reg184) ?
                               reg165[(4'h8):(3'h4)] : (reg164 * reg191))}));
  assign wire195 = wire137[(1'h1):(1'h0)];
  assign wire196 = ($unsigned($signed((reg185[(4'hd):(3'h7)] >> reg149))) ?
                       $unsigned((((reg191 ? reg180 : wire144) != (&reg145)) ?
                           $signed(((8'ha1) & (8'hb6))) : (reg159[(3'h4):(1'h0)] >= reg184))) : $unsigned((((reg163 ?
                           reg187 : reg173) - reg185) && {(!reg139),
                           $signed(reg150)})));
  assign wire197 = reg157[(1'h0):(1'h0)];
  assign wire198 = wire134[(1'h0):(1'h0)];
endmodule

module module101
#(parameter param126 = ((~^((((8'hbb) ~^ (8'h9f)) ? ((8'hb2) && (8'hb3)) : (^~(8'ha3))) ? (((8'hb2) > (8'hae)) + ((8'hbb) ? (8'hb8) : (8'ha2))) : ({(8'had), (8'hb7)} ? (&(8'hbd)) : {(8'hb6), (8'hb1)}))) ? ((8'haf) ? ((((8'hbe) != (8'hab)) ? (~&(8'hb5)) : (&(8'hba))) >= (8'hb3)) : (({(7'h40), (8'hb0)} ? ((7'h43) * (8'ha4)) : ((7'h44) > (8'hbb))) && ({(8'hba)} >>> (~(8'h9d))))) : (~^(7'h44))), 
parameter param127 = (((-{(param126 << (8'hbf))}) ? {((param126 ^ param126) ? (~^param126) : (!param126)), {(^~(8'had))}} : {((~&(8'hbc)) & ((8'hbb) | param126)), ({param126, (8'hb9)} ? {param126, param126} : (param126 ? param126 : (8'hb0)))}) << (~(~^((param126 + param126) ? (^~param126) : (param126 - param126))))))
(y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire105;
  input wire signed [(3'h6):(1'h0)] wire104;
  input wire [(5'h12):(1'h0)] wire103;
  input wire [(3'h5):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire125;
  wire signed [(3'h4):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire111;
  wire [(4'hb):(1'h0)] wire110;
  wire [(2'h3):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire106 = $unsigned($unsigned($unsigned($unsigned((&wire102)))));
  assign wire107 = wire102[(3'h5):(2'h2)];
  assign wire108 = $signed(wire103[(3'h6):(3'h5)]);
  assign wire109 = $unsigned($signed(wire107[(3'h6):(3'h4)]));
  assign wire110 = wire103;
  assign wire111 = (($signed((wire103 || wire108[(5'h11):(4'hc)])) > ((wire104[(2'h2):(1'h1)] << wire108[(3'h7):(1'h0)]) ?
                           wire103[(2'h2):(1'h0)] : (wire106 ?
                               ((7'h41) ? wire105 : wire109) : wire107))) ?
                       $signed(($unsigned((&wire108)) ~^ (wire110 < (wire106 <<< wire102)))) : (~^$signed(((8'h9c) ?
                           $signed(wire105) : (wire109 ? wire109 : wire110)))));
  assign wire112 = (+((wire106[(3'h5):(1'h0)] != {(-wire108)}) ?
                       $signed(((~&wire104) ?
                           (|wire105) : (~^wire102))) : $signed({wire104[(2'h3):(2'h2)]})));
  always
    @(posedge clk) begin
      reg113 <= $signed((~|$unsigned($unsigned(wire112[(4'hc):(3'h7)]))));
      if (((7'h44) <= (+wire106[(1'h0):(1'h0)])))
        begin
          reg114 <= wire102[(2'h2):(1'h1)];
          reg115 <= (^$signed({($unsigned(wire102) ? wire109 : (-reg113))}));
          reg116 <= ((~(wire111[(4'h8):(2'h3)] ?
                  $signed((wire107 ? wire107 : wire103)) : {$signed(wire106),
                      wire111})) ?
              $unsigned((-$unsigned((wire111 ?
                  wire112 : (8'hba))))) : wire108[(4'hd):(3'h5)]);
          reg117 <= ($unsigned(wire106) < {wire103, wire110[(3'h7):(2'h2)]});
        end
      else
        begin
          if ((((reg116 <<< ($unsigned(reg116) ?
              reg113[(3'h6):(3'h4)] : reg115[(2'h3):(2'h2)])) & (|((wire108 >>> (8'haa)) ^ wire105[(1'h1):(1'h1)]))) << $signed({(+reg117[(1'h0):(1'h0)]),
              ({wire111, (8'ha3)} ^~ wire106[(4'h8):(3'h4)])})))
            begin
              reg114 <= ((~(wire107 ?
                  (~(8'hac)) : $unsigned(wire103))) + $unsigned({((~wire111) ?
                      (!(8'h9d)) : {reg116, wire107}),
                  ((wire111 ? (7'h44) : wire103) ?
                      ((7'h42) ? wire110 : wire104) : (^reg114))}));
              reg115 <= $unsigned($unsigned({wire112[(4'h8):(3'h7)],
                  $unsigned($signed(reg116))}));
              reg116 <= (^~$signed(wire103[(4'hf):(1'h1)]));
              reg117 <= ((^$unsigned(wire107[(2'h3):(1'h1)])) | reg117);
            end
          else
            begin
              reg114 <= (wire109 ? wire110[(2'h3):(2'h3)] : $signed(wire104));
              reg115 <= {((^~reg116) ?
                      reg113 : ($signed(((8'ha1) < reg115)) - {(wire106 ?
                              (8'ha8) : wire111)})),
                  ($unsigned($signed(wire107)) ?
                      wire111[(4'hd):(2'h2)] : ($signed((wire112 >>> (8'hbb))) == reg115))};
              reg116 <= {((((~&wire112) ~^ $signed(wire112)) ?
                          wire105 : wire109) ?
                      {(wire110[(4'hb):(1'h0)] - (~wire108))} : ((wire109 ?
                          (!reg115) : (8'ha0)) < wire103[(3'h6):(3'h4)]))};
              reg117 <= $unsigned({wire111[(5'h14):(2'h3)]});
            end
        end
      reg118 <= reg113[(4'h8):(3'h6)];
    end
  assign wire119 = $unsigned({$signed(wire105[(4'ha):(3'h5)])});
  assign wire120 = (8'hb3);
  assign wire121 = (~(8'ha2));
  assign wire122 = $signed(reg113);
  assign wire123 = $unsigned(wire122);
  assign wire124 = ((&wire109) < (reg113[(3'h6):(1'h0)] << (((wire111 ?
                           reg115 : wire106) ?
                       (wire120 ?
                           (8'hb5) : reg116) : {wire108}) || ((+reg114) * wire105))));
  assign wire125 = reg117[(1'h1):(1'h0)];
endmodule

module module46
#(parameter param88 = ((~^((^{(8'hbb)}) ? (((8'h9e) ~^ (7'h43)) ? (^(8'hb9)) : ((7'h43) <= (7'h43))) : (^~{(8'hb7), (8'hae)}))) ? ({(((8'hb0) ? (8'ha0) : (8'ha9)) * (8'hb7)), (((8'ha3) <= (8'ha7)) >= ((7'h43) ? (7'h44) : (8'ha4)))} != {(~{(7'h43), (8'hbd)})}) : (((^~((8'hbf) ? (8'hb9) : (8'h9f))) << (8'hbf)) ^~ ((~&{(8'ha1), (8'h9d)}) ? (((8'haf) ~^ (8'hb9)) > ((8'h9c) | (8'hb3))) : ((~&(8'hbe)) ? (&(7'h42)) : {(8'hbb)})))), 
parameter param89 = (~&param88))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire51;
  input wire [(3'h6):(1'h0)] wire50;
  input wire signed [(4'hc):(1'h0)] wire49;
  input wire signed [(4'hf):(1'h0)] wire48;
  input wire [(3'h4):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire52 = (wire51[(1'h1):(1'h1)] ?
                      (~|$signed(wire50[(2'h2):(2'h2)])) : ((wire49[(3'h4):(3'h4)] ^~ wire48[(4'ha):(3'h7)]) ?
                          {($unsigned((8'hb7)) ?
                                  (wire51 ?
                                      wire48 : (8'h9c)) : $signed(wire48)),
                              $unsigned(wire50)} : ((wire48[(3'h5):(1'h1)] && (wire51 ?
                              wire48 : wire51)) >= wire48[(1'h1):(1'h1)])));
  assign wire53 = (wire47 - wire52[(4'ha):(2'h3)]);
  assign wire54 = wire50;
  assign wire55 = $unsigned({($unsigned($unsigned(wire47)) ^ wire52[(3'h6):(3'h4)])});
  assign wire56 = (^~wire49);
  assign wire57 = (((^~$unsigned((~wire50))) ?
                      (((+wire55) >>> $unsigned(wire52)) + $signed($unsigned(wire52))) : $unsigned((wire52[(1'h1):(1'h0)] ^~ wire48))) << (8'hb9));
  assign wire58 = wire47;
  assign wire59 = (!$unsigned((8'hb2)));
  assign wire60 = {($unsigned(wire57) ?
                          $signed($signed(((8'h9f) ?
                              wire58 : (8'ha1)))) : {$signed($unsigned(wire47)),
                              ((^~wire53) ? (wire57 > wire54) : (!wire53))}),
                      wire49[(3'h7):(3'h4)]};
  assign wire61 = (~wire55);
  assign wire62 = ($unsigned((~&$signed($unsigned(wire56)))) >= $signed(((wire53[(4'h8):(3'h7)] ?
                      (wire54 >> wire49) : (wire49 ?
                          wire61 : wire49)) != ($unsigned(wire49) ?
                      (wire60 ? (8'h9f) : wire48) : wire51[(2'h3):(2'h2)]))));
  assign wire63 = wire52[(4'hb):(3'h7)];
  assign wire64 = $signed(wire57[(5'h11):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire50)
        begin
          if (wire62[(5'h13):(3'h6)])
            begin
              reg65 <= (wire53 ?
                  ({wire57} & (wire51[(3'h4):(1'h0)] == {$unsigned((8'hbc)),
                      $unsigned(wire58)})) : wire58[(4'hc):(4'h8)]);
              reg66 <= $signed($unsigned($unsigned(wire59[(2'h2):(1'h1)])));
            end
          else
            begin
              reg65 <= $unsigned((~|$unsigned((-$signed(wire62)))));
              reg66 <= (~^$signed(((wire61[(2'h3):(2'h3)] ?
                      $signed(wire48) : $signed(wire64)) ?
                  ((~|wire48) ?
                      (^~wire53) : (wire58 * wire62)) : $unsigned($signed((8'ha2))))));
            end
          reg67 <= {$signed($unsigned(((wire63 | wire56) ?
                  (reg66 ? wire48 : wire48) : wire55)))};
          reg68 <= ((reg66[(4'hd):(1'h0)] && wire59[(1'h1):(1'h0)]) ?
              wire61[(2'h2):(1'h0)] : $signed((^~$signed((wire54 & wire61)))));
        end
      else
        begin
          reg65 <= wire59[(2'h2):(1'h0)];
          if ($unsigned((~wire59[(1'h0):(1'h0)])))
            begin
              reg66 <= wire53;
              reg67 <= (reg65[(2'h3):(1'h1)] | ($signed((~|{wire60, wire63})) ?
                  $signed(wire48[(4'hc):(3'h7)]) : (+wire54)));
              reg68 <= ($unsigned($signed($unsigned(wire60))) ^~ (~|($unsigned(reg66[(4'hf):(4'hb)]) <<< $signed($unsigned(reg66)))));
              reg69 <= $unsigned($signed((wire54 ?
                  (8'hb1) : ((wire60 * wire56) <= (8'ha5)))));
            end
          else
            begin
              reg66 <= $unsigned(($unsigned(($unsigned((8'hbb)) ?
                  $signed((8'hbe)) : reg66[(2'h3):(1'h0)])) < ((reg67 ?
                  $signed((8'ha7)) : (8'hae)) > ($unsigned(wire61) & $signed(wire47)))));
              reg67 <= (~|$signed(wire54[(4'hf):(4'ha)]));
              reg68 <= wire52;
              reg69 <= $unsigned($unsigned($signed((8'ha5))));
            end
          if (($signed((reg65[(4'he):(4'ha)] - ((&wire56) || $signed(wire64)))) && wire50[(1'h1):(1'h0)]))
            begin
              reg70 <= (+$signed(({(^reg66), (8'hbd)} ?
                  wire63 : (~&(wire53 ? wire48 : wire51)))));
              reg71 <= ($signed($signed((wire47[(1'h1):(1'h0)] ?
                      (|(8'hb8)) : $unsigned(wire61)))) ?
                  $signed(wire52[(4'he):(2'h3)]) : $unsigned($unsigned($signed($unsigned(wire61)))));
            end
          else
            begin
              reg70 <= wire47[(1'h0):(1'h0)];
              reg71 <= ((reg70 ?
                  (&({wire59, (8'hb2)} ?
                      (8'haa) : wire52)) : (($unsigned(wire47) ^~ reg66[(3'h4):(3'h4)]) ?
                      {$unsigned(wire60)} : (wire57 ?
                          wire61[(1'h0):(1'h0)] : (wire58 ?
                              wire49 : reg66)))) <<< ($unsigned($unsigned((wire48 ?
                  reg65 : wire59))) ^ ($signed((wire59 || wire48)) && $signed((&(7'h43))))));
              reg72 <= ($signed((&wire50[(3'h4):(2'h3)])) || wire64);
            end
          reg73 <= wire58[(4'hf):(4'hc)];
        end
      reg74 <= $signed($unsigned({{$unsigned(reg65), (wire48 | (7'h43))},
          $signed((~^(8'ha3)))}));
      reg75 <= $signed((8'hb5));
      reg76 <= {(wire58 ?
              (wire56[(3'h4):(2'h2)] ?
                  $unsigned(reg71[(3'h7):(1'h1)]) : ((wire62 ?
                      reg75 : reg70) == (reg67 != wire56))) : ($signed((wire55 << wire59)) | wire57[(3'h6):(2'h2)])),
          $signed(($unsigned(reg72) ^~ ((reg67 ?
              reg70 : reg65) >> $signed(wire60))))};
    end
  assign wire77 = (|$signed($unsigned((+(~^wire62)))));
  assign wire78 = (|wire54);
  assign wire79 = ((^~reg67) ?
                      {(-((8'h9e) >>> (reg65 ? reg74 : wire55)))} : (wire77 ?
                          $signed((reg68[(1'h1):(1'h1)] ~^ wire59)) : (&$unsigned(wire59[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg80 <= ($signed($unsigned(((wire48 ?
          wire60 : wire52) < $signed(wire54)))) >>> reg65);
      if (((^~{wire48[(3'h4):(1'h1)],
          (wire79[(4'h8):(2'h3)] * ((8'ha5) ?
              wire60 : wire57))}) && ((~^({wire49} ?
          reg70[(4'ha):(2'h3)] : (reg70 ?
              (8'hab) : wire53))) != (reg80[(3'h5):(3'h5)] | wire63))))
        begin
          if (((~$unsigned(({wire48} > (wire79 ?
              reg72 : (8'ha4))))) - (-((wire55 << (^~reg66)) ?
              reg76 : wire60[(3'h6):(3'h4)]))))
            begin
              reg81 <= $unsigned(reg69[(2'h3):(2'h2)]);
            end
          else
            begin
              reg81 <= reg71[(3'h6):(2'h2)];
            end
          reg82 <= {($unsigned(($unsigned(reg66) ?
                  wire59[(2'h3):(1'h0)] : (~^wire64))) | {((wire53 >>> wire63) ?
                      $signed(wire53) : ((8'h9c) ? reg81 : reg76))}),
              (reg65[(2'h3):(2'h3)] + (((wire77 ? wire53 : wire57) <= (wire78 ?
                      wire54 : wire77)) ?
                  $signed($signed(wire58)) : (8'h9e)))};
          reg83 <= $unsigned({($signed($signed(reg69)) && wire49[(3'h7):(1'h1)]),
              ((wire54[(4'h9):(1'h1)] ?
                  $signed(reg73) : reg75) >= reg80[(2'h2):(1'h0)])});
          reg84 <= (~|(-$signed({(|(8'had))})));
          reg85 <= $signed((wire54 ?
              (!(+(wire57 ? reg70 : (8'ha0)))) : $unsigned(wire48)));
        end
      else
        begin
          reg81 <= ((reg75[(3'h4):(1'h0)] || wire51) ? {(7'h41)} : wire63);
          reg82 <= $unsigned(reg74);
          reg83 <= $unsigned({(({reg65, (8'haf)} << (!wire48)) <<< wire63)});
        end
      reg86 <= wire54;
      reg87 <= (^~$signed((((reg71 || wire51) << (wire55 <<< wire61)) ?
          $unsigned(reg84[(1'h0):(1'h0)]) : (&((8'hb9) <<< reg69)))));
    end
endmodule
