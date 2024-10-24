module top
#(parameter param206 = ({((~^((7'h44) | (8'hbc))) ? (((8'h9c) >= (8'ha0)) >= ((8'hb6) ? (8'ha5) : (8'hbb))) : {(8'hae)})} - (+{(((8'hb0) != (8'ha6)) ? (8'had) : {(8'h9f)}), (((8'hb2) >= (7'h42)) ? ((8'hac) < (8'had)) : ((8'hbc) ? (7'h41) : (7'h43)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire205;
  wire signed [(5'h12):(1'h0)] wire204;
  wire signed [(5'h10):(1'h0)] wire202;
  wire [(4'ha):(1'h0)] wire201;
  wire [(4'hf):(1'h0)] wire200;
  wire signed [(4'hb):(1'h0)] wire199;
  wire signed [(5'h14):(1'h0)] wire198;
  wire signed [(3'h5):(1'h0)] wire194;
  wire signed [(3'h6):(1'h0)] wire188;
  wire signed [(2'h2):(1'h0)] wire187;
  wire signed [(4'h8):(1'h0)] wire186;
  wire signed [(5'h10):(1'h0)] wire185;
  wire signed [(5'h12):(1'h0)] wire184;
  wire [(5'h12):(1'h0)] wire183;
  wire [(4'ha):(1'h0)] wire181;
  wire signed [(5'h15):(1'h0)] wire163;
  wire [(4'hf):(1'h0)] wire162;
  wire signed [(5'h11):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire159;
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg4 = (1'h0);
  reg [(2'h2):(1'h0)] reg189 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  reg [(5'h14):(1'h0)] reg191 = (1'h0);
  reg [(5'h15):(1'h0)] reg192 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg193 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg195 = (1'h0);
  reg [(4'hd):(1'h0)] reg196 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg197 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire194,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire181,
                 wire163,
                 wire162,
                 wire161,
                 wire159,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg195,
                 reg196,
                 reg197,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(wire2[(3'h7):(3'h7)]);
      if (wire2)
        begin
          if ((8'hb9))
            begin
              reg5 <= reg4;
              reg6 <= wire0[(2'h2):(1'h0)];
              reg7 <= reg5[(1'h0):(1'h0)];
            end
          else
            begin
              reg5 <= (reg7[(4'hf):(4'hc)] > $signed((reg5[(2'h3):(1'h0)] + (((7'h44) == wire3) ?
                  wire2 : reg4[(5'h11):(5'h10)]))));
            end
        end
      else
        begin
          reg5 <= {((reg7 ?
                  $unsigned({reg6, reg6}) : $signed(((8'ha1) ?
                      (8'hb2) : reg5))) ~^ wire3[(2'h2):(1'h1)]),
              (~|(~&reg6[(3'h5):(2'h3)]))};
          reg6 <= wire0;
          reg7 <= $signed($signed((~|(|(wire3 ? reg6 : wire3)))));
          if ((wire3 ?
              reg4[(5'h12):(1'h1)] : ($signed((reg5[(3'h7):(3'h5)] >> reg6[(4'hb):(1'h1)])) ?
                  ($signed({wire1,
                      reg6}) == wire1[(3'h4):(2'h2)]) : (-wire0[(4'h9):(2'h2)]))))
            begin
              reg8 <= wire1[(3'h5):(2'h2)];
            end
          else
            begin
              reg8 <= ({reg4[(1'h1):(1'h1)],
                      {(~^(wire0 ? wire3 : wire2)), wire2}} ?
                  reg6 : $unsigned((~&wire1[(3'h6):(1'h1)])));
            end
        end
      reg9 <= $unsigned($unsigned((~^{(^wire1), (~^(8'h9f))})));
      reg10 <= $unsigned($unsigned(((reg9 & wire0) ?
          $signed(reg8[(2'h3):(2'h2)]) : wire1[(4'hf):(3'h4)])));
    end
  module11 #() modinst160 (.wire12(wire0), .y(wire159), .clk(clk), .wire13(wire3), .wire14(reg9), .wire15(reg7), .wire16(reg6));
  assign wire161 = $signed({($unsigned({reg4, reg5}) ?
                           {reg10} : ($signed(wire2) ?
                               reg8[(2'h2):(1'h1)] : (+wire1))),
                       $unsigned(wire0)});
  assign wire162 = reg8[(3'h7):(2'h2)];
  assign wire163 = wire159;
  module164 #() modinst182 (.wire166(wire2), .wire167(reg10), .wire168(reg9), .wire165(wire159), .clk(clk), .y(wire181));
  assign wire183 = {$unsigned(reg9), wire162};
  assign wire184 = (!$unsigned($signed((reg5[(1'h1):(1'h1)] >= (wire0 ?
                       wire183 : wire162)))));
  assign wire185 = {((7'h44) ?
                           reg4 : (($signed((8'ha9)) && wire162[(1'h1):(1'h0)]) ?
                               (~(-wire181)) : $signed($signed(wire1)))),
                       $signed($signed(wire184))};
  assign wire186 = (-($unsigned({(7'h41), $unsigned(wire161)}) ?
                       $signed($signed($unsigned(wire185))) : ((|wire0[(3'h7):(3'h7)]) ?
                           $unsigned(wire163[(4'he):(3'h4)]) : reg8)));
  assign wire187 = wire161;
  assign wire188 = reg5[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((!$unsigned({(8'hb1), wire185[(3'h5):(2'h2)]})))
        begin
          reg189 <= (~^{{((wire0 ? wire163 : reg10) ^~ (wire161 ?
                      wire181 : wire3))}});
          reg190 <= ((reg4 <= (|((|wire188) < {wire184}))) ?
              {wire0, wire186} : {wire1[(5'h13):(4'hf)], reg7[(5'h10):(4'hb)]});
          if ((~|{(wire3[(4'hf):(4'he)] || reg10[(3'h5):(1'h0)])}))
            begin
              reg191 <= (^$signed((~|$unsigned(((8'ha7) > (7'h42))))));
            end
          else
            begin
              reg191 <= reg7[(3'h7):(3'h5)];
              reg192 <= $unsigned({(-wire184), wire163[(5'h11):(4'h9)]});
              reg193 <= (wire186[(2'h3):(1'h1)] >> $unsigned(reg5[(4'h8):(2'h3)]));
            end
        end
      else
        begin
          reg189 <= (!reg190[(3'h6):(2'h3)]);
        end
    end
  assign wire194 = (({$unsigned($unsigned((8'hb4)))} ?
                       reg10 : wire187[(2'h2):(1'h0)]) ~^ ((!(wire184[(4'h9):(3'h6)] ^~ (~wire183))) * {{(wire187 >>> reg6)}}));
  always
    @(posedge clk) begin
      reg195 <= wire181;
      if (reg9)
        begin
          reg196 <= wire183[(4'hb):(1'h0)];
        end
      else
        begin
          reg196 <= (8'hb0);
        end
      reg197 <= (~^(($signed($unsigned(wire2)) ?
          ($unsigned(wire183) ?
              (-wire184) : reg5[(4'h8):(1'h1)]) : ((!reg5) != (reg6 ?
              wire194 : wire3))) == ((^$signed(reg189)) ?
          {(wire194 - reg189), $signed(reg7)} : $signed($signed(wire163)))));
    end
  assign wire198 = wire1;
  assign wire199 = ($signed(wire2[(3'h5):(1'h1)]) ?
                       $unsigned({$unsigned(wire162[(4'hb):(3'h4)])}) : reg197[(4'h8):(1'h0)]);
  assign wire200 = wire198[(4'hb):(1'h1)];
  assign wire201 = (^$unsigned((~&(^~$signed(reg196)))));
  module85 #() modinst203 (.wire90(reg4), .wire86(wire161), .wire87(wire185), .wire89(reg192), .wire88(reg7), .clk(clk), .y(wire202));
  assign wire204 = reg189[(1'h1):(1'h1)];
  assign wire205 = wire181[(3'h5):(2'h3)];
endmodule

module module164
#(parameter param179 = ((+((~|(&(8'ha1))) ? (8'haf) : (&((8'h9c) ? (8'h9e) : (8'ha9))))) ? (&((+((8'ha2) ^ (8'haa))) ? ((!(8'ha3)) > (+(8'hb8))) : (^((8'hab) < (8'hac))))) : (({(~|(8'hb4))} < (^~((8'ha2) && (8'ha1)))) || ((((8'hae) ? (8'ha8) : (8'hb8)) & (8'hab)) ? ((|(8'hae)) ? ((8'hac) ? (8'hae) : (8'hbb)) : ((8'haa) ? (8'hb3) : (8'hbb))) : (((8'hac) ? (7'h41) : (8'hb5)) ? (~^(8'hb3)) : ((8'hb9) ? (8'hae) : (8'ha9)))))), 
parameter param180 = {param179, (8'hab)})
(y, clk, wire168, wire167, wire166, wire165);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire168;
  input wire signed [(5'h11):(1'h0)] wire167;
  input wire [(5'h12):(1'h0)] wire166;
  input wire [(3'h7):(1'h0)] wire165;
  wire signed [(4'hf):(1'h0)] wire178;
  wire [(4'he):(1'h0)] wire177;
  wire signed [(4'hf):(1'h0)] wire176;
  wire signed [(4'hb):(1'h0)] wire175;
  wire [(5'h15):(1'h0)] wire174;
  wire signed [(4'hd):(1'h0)] wire170;
  wire signed [(4'hd):(1'h0)] wire169;
  reg [(5'h10):(1'h0)] reg173 = (1'h0);
  reg [(2'h2):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg171 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire170,
                 wire169,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire169 = {(~^(((wire168 >= wire168) && $signed(wire167)) * $signed(wire168[(3'h4):(1'h1)])))};
  assign wire170 = (~$signed((((wire168 ?
                       (8'hb9) : wire167) == wire169[(4'h8):(3'h5)]) ~^ wire165[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg171 <= {wire166[(4'ha):(2'h3)], $signed(wire165)};
      reg172 <= wire165;
      reg173 <= $signed(($signed(($unsigned((8'h9e)) ?
              $signed(wire168) : (wire165 ? wire167 : wire165))) ?
          reg172[(1'h1):(1'h0)] : $unsigned((8'hb2))));
    end
  assign wire174 = $unsigned($unsigned((~|wire170[(3'h5):(1'h1)])));
  assign wire175 = ((reg171 >>> wire168) >= $unsigned((8'hbc)));
  assign wire176 = $signed($signed(wire165));
  assign wire177 = (((wire174[(4'hb):(3'h5)] ?
                           $signed($signed(wire175)) : $signed(reg171[(4'hd):(3'h5)])) <<< (-(wire170[(4'hd):(4'h9)] << (wire166 ?
                           wire176 : reg171)))) ?
                       ({wire174[(5'h10):(1'h1)], wire174[(4'h9):(3'h7)]} ?
                           {({reg172} <<< {wire169}),
                               (wire174 ?
                                   $signed(wire175) : wire170[(2'h3):(2'h2)])} : (8'hb5)) : ((~|{wire175[(3'h5):(1'h1)],
                           $signed(wire176)}) && wire165[(3'h7):(2'h2)]));
  assign wire178 = ({wire177} - (|(~^((wire169 & wire166) ?
                       $signed(wire167) : (wire168 ? wire169 : wire166)))));
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire signed [(2'h3):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire158;
  wire signed [(4'he):(1'h0)] wire157;
  wire signed [(2'h2):(1'h0)] wire153;
  wire signed [(3'h4):(1'h0)] wire152;
  wire [(2'h2):(1'h0)] wire151;
  wire [(5'h12):(1'h0)] wire150;
  wire [(3'h7):(1'h0)] wire148;
  wire [(4'h9):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg [(2'h3):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire148,
                 wire71,
                 wire52,
                 wire37,
                 wire35,
                 wire21,
                 wire20,
                 wire18,
                 wire17,
                 reg156,
                 reg155,
                 reg154,
                 reg19,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 (1'h0)};
  assign wire17 = ((&wire13) >> $signed(wire14));
  assign wire18 = $signed($unsigned($signed($unsigned($signed(wire15)))));
  always
    @(posedge clk) begin
      reg19 <= $signed(wire18[(1'h1):(1'h0)]);
    end
  assign wire20 = (8'ha5);
  assign wire21 = ((wire18 ? reg19 : $signed(reg19[(3'h5):(1'h0)])) ?
                      $unsigned($signed(wire20)) : {$unsigned((^~(wire18 ?
                              wire13 : (8'hb3))))});
  module22 #() modinst36 (wire35, clk, wire15, wire13, wire21, wire16);
  assign wire37 = wire21[(5'h10):(4'hf)];
  module38 #() modinst53 (wire52, clk, wire16, reg19, wire21, wire13, wire37);
  always
    @(posedge clk) begin
      reg54 <= {wire20};
      reg55 <= {{$unsigned(wire35[(3'h5):(1'h1)]),
              (wire20[(4'hb):(4'h9)] * (~|{wire52, reg54}))},
          (&(~&(8'ha1)))};
      if (((($signed({wire16}) ?
              (wire17 ^ (wire20 != reg55)) : wire14[(2'h3):(1'h1)]) && $signed((wire21 ?
              ((7'h41) ? wire14 : wire13) : (&(8'hb3))))) ?
          ((^~(((8'ha9) > wire20) != reg54[(3'h6):(3'h6)])) - $signed($unsigned(reg19[(5'h12):(2'h2)]))) : (wire20 >>> $signed(wire13))))
        begin
          reg56 <= (&$signed($unsigned($unsigned((&wire16)))));
        end
      else
        begin
          if (($signed(((~^wire13) < wire17[(3'h5):(1'h1)])) << $unsigned(wire21)))
            begin
              reg56 <= wire18;
              reg57 <= ((^$unsigned((((8'h9f) & reg54) ?
                      (wire13 > wire13) : {wire17, (8'hb9)}))) ?
                  $signed((reg54[(1'h1):(1'h0)] ?
                      $unsigned((reg56 ?
                          wire12 : wire18)) : (8'h9c))) : wire14[(2'h2):(1'h1)]);
              reg58 <= ($unsigned(wire52[(1'h1):(1'h0)]) ?
                  (wire13[(4'h9):(3'h4)] ?
                      (~&{$unsigned(wire17),
                          (wire16 ? reg56 : wire17)}) : (({wire17} ?
                              wire14 : $unsigned(wire15)) ?
                          (wire16[(1'h1):(1'h1)] ~^ $unsigned(wire18)) : (8'h9c))) : ((({reg54} == $signed(wire37)) & {$signed(wire14),
                      wire12}) == (8'hb8)));
            end
          else
            begin
              reg56 <= $unsigned((~({(^wire13),
                  (wire16 == wire18)} - wire20[(2'h2):(1'h0)])));
              reg57 <= ({(wire12[(2'h2):(1'h0)] >= (8'hb0)),
                      $signed($signed($unsigned(reg57)))} ?
                  $unsigned(((~&$unsigned(wire16)) >= ((wire15 << (8'h9c)) <<< reg57[(4'h9):(3'h4)]))) : reg57[(3'h7):(3'h4)]);
            end
          reg59 <= (({(((8'hb5) >= (8'had)) | (reg54 >>> reg58)),
                  (!wire18[(1'h0):(1'h0)])} ?
              $unsigned(wire18) : (8'had)) & $unsigned(reg54[(4'h9):(4'h8)]));
        end
      reg60 <= $unsigned(wire20[(4'hd):(2'h3)]);
      if ((^(~|$unsigned(reg55))))
        begin
          reg61 <= $signed((~^((reg59[(4'ha):(4'h9)] || wire37) ?
              (wire14 >= (^reg19)) : reg54[(4'hb):(3'h6)])));
          reg62 <= $signed($signed(wire16));
          reg63 <= $unsigned(wire20);
          reg64 <= (8'hb5);
        end
      else
        begin
          reg61 <= reg55;
          if ($signed({$signed((reg61 ? wire20 : $unsigned(reg64))),
              (!(((8'hb7) - reg55) | wire37[(2'h2):(2'h2)]))}))
            begin
              reg62 <= reg54[(1'h0):(1'h0)];
              reg63 <= ((~^$signed(((wire37 ? reg56 : wire13) ?
                      (wire14 < wire16) : (wire20 && wire14)))) ?
                  (((~(reg19 ? reg56 : reg57)) >= (~(reg57 >>> reg61))) ?
                      ((-(^~reg56)) ~^ {(reg57 ^~ reg60)}) : {wire13}) : (-reg60[(1'h0):(1'h0)]));
              reg64 <= reg59;
              reg65 <= (~(~{(((8'h9e) & reg55) > $signed(wire20))}));
            end
          else
            begin
              reg62 <= $signed($unsigned(wire18));
              reg63 <= reg60[(1'h1):(1'h1)];
              reg64 <= $signed(wire18[(3'h4):(2'h2)]);
              reg65 <= wire35[(1'h0):(1'h0)];
            end
          if ((~$signed((^~wire35[(1'h1):(1'h0)]))))
            begin
              reg66 <= {reg58[(4'ha):(1'h0)],
                  (&($signed((wire18 & reg63)) > (^$signed(wire21))))};
              reg67 <= reg64;
              reg68 <= (~|reg56[(3'h5):(3'h5)]);
              reg69 <= reg65;
            end
          else
            begin
              reg66 <= ((8'hbe) ?
                  $signed(((+$signed(wire16)) ?
                      ($unsigned((8'hb6)) ?
                          ((8'hb2) >= reg54) : (~^reg62)) : $signed(wire18))) : {($signed(reg57) ?
                          reg57[(4'hd):(4'hb)] : ($unsigned(reg19) ?
                              (wire13 ?
                                  (8'hbe) : reg69) : reg68[(4'ha):(3'h7)]))});
              reg67 <= ($signed({($unsigned(reg63) != (!wire21)),
                  {{reg68, (8'hba)},
                      (reg59 ? wire12 : (8'hb7))}}) && (wire20[(3'h5):(1'h0)] ?
                  $unsigned(reg62) : reg55[(4'h9):(3'h5)]));
              reg68 <= wire37;
              reg69 <= reg66;
            end
          reg70 <= (wire20 ?
              (reg69 ?
                  {wire18[(2'h3):(1'h0)],
                      ($unsigned(reg56) <= (+reg58))} : (~&$unsigned($unsigned(reg67)))) : ($unsigned((-$signed(wire52))) * reg55));
        end
    end
  assign wire71 = reg19;
  always
    @(posedge clk) begin
      if ((wire71 * reg64[(2'h3):(1'h1)]))
        begin
          if ($signed($signed($signed(($unsigned(wire13) ?
              $unsigned((8'hbf)) : $signed(reg54))))))
            begin
              reg72 <= $signed((8'hbc));
            end
          else
            begin
              reg72 <= $signed(reg68);
              reg73 <= (8'ha0);
              reg74 <= (((reg62[(2'h2):(1'h0)] & $signed((wire17 ?
                      wire15 : wire21))) ?
                  ((8'hae) ~^ wire35[(2'h2):(1'h1)]) : (((reg60 && reg58) * $unsigned((7'h41))) ?
                      $unsigned($unsigned(wire14)) : reg55)) <= $unsigned($signed(((&wire18) ^ ((8'hbe) ?
                  wire13 : wire35)))));
            end
          reg75 <= reg62[(3'h4):(1'h1)];
          reg76 <= {($unsigned((((8'hbf) >> wire14) ?
                  (wire12 ?
                      reg57 : wire14) : (~&wire13))) <<< $unsigned(($signed((8'ha5)) ?
                  reg58[(4'hf):(4'h8)] : reg67[(2'h2):(1'h0)])))};
          if ($unsigned($unsigned((!wire71))))
            begin
              reg77 <= (~&$unsigned(reg61));
              reg78 <= wire18;
            end
          else
            begin
              reg77 <= $unsigned((~^(((reg56 ? wire16 : (8'hba)) ?
                  reg55[(4'h9):(4'h9)] : (reg63 ^ (8'hbe))) <= ((reg60 ?
                  wire71 : reg62) != (wire35 > reg73)))));
              reg78 <= $unsigned($unsigned((&$signed($unsigned(reg64)))));
              reg79 <= $signed((wire71[(3'h7):(2'h3)] != wire37));
              reg80 <= $signed($unsigned(reg59));
            end
        end
      else
        begin
          reg72 <= ($signed(($signed({(7'h44), (8'haa)}) ?
              reg19 : ((wire18 >> (7'h44)) || (-reg54)))) * (!((^(reg70 == reg58)) ?
              $unsigned((reg75 ? wire16 : reg75)) : ((reg78 ?
                  wire17 : reg77) > (reg61 ? reg57 : reg65)))));
          reg73 <= {{(~|($unsigned(reg61) ?
                      $signed((8'hab)) : $unsigned(reg55))),
                  reg70}};
          reg74 <= $signed({($signed((wire15 ?
                  wire15 : reg78)) - ($unsigned(reg62) || ((8'hbe) ?
                  reg70 : reg78))),
              reg74[(5'h11):(3'h6)]});
          reg75 <= $unsigned(wire35);
        end
      reg81 <= (~(!$signed(wire13[(5'h11):(2'h2)])));
      reg82 <= $unsigned($unsigned(wire16[(1'h0):(1'h0)]));
      reg83 <= (!$unsigned($unsigned($unsigned(wire13[(1'h0):(1'h0)]))));
      reg84 <= reg74;
    end
  module85 #() modinst149 (.clk(clk), .wire87(reg55), .y(wire148), .wire88(reg59), .wire89(reg64), .wire86(reg68), .wire90(reg72));
  assign wire150 = (-(~reg82));
  assign wire151 = $unsigned((~|(wire150 >>> (!reg62))));
  assign wire152 = $signed((((((7'h42) ? reg82 : (8'ha0)) ^~ $signed(reg77)) ?
                       (((7'h42) && reg76) ?
                           wire20[(1'h1):(1'h1)] : $unsigned(wire151)) : (&reg55[(4'ha):(3'h7)])) > ((~&(reg65 ?
                           reg66 : reg62)) ?
                       ($signed(reg58) >> $signed((8'hb8))) : (8'ha7))));
  assign wire153 = wire151;
  always
    @(posedge clk) begin
      reg154 <= (+$unsigned((!((reg81 ? (8'ha8) : (8'ha9)) ?
          {reg72, reg77} : reg62))));
      reg155 <= (~^$signed($signed((wire16 || reg64[(5'h10):(4'hc)]))));
      reg156 <= $unsigned({{reg60, ($unsigned(reg55) >>> reg67[(4'h8):(2'h3)])},
          (7'h43)});
    end
  assign wire157 = wire17;
  assign wire158 = (+reg154[(3'h6):(2'h3)]);
endmodule

module module85
#(parameter param147 = ((&(~(((8'hb8) ? (8'ha6) : (8'haf)) | (~^(8'hac))))) ? (^({(!(7'h40)), ((7'h42) || (8'hb6))} ? ({(8'ha4)} ^ ((8'hbe) ? (8'haa) : (7'h42))) : ((7'h44) * ((8'ha0) ^~ (8'h9e))))) : ((({(8'hbf)} - ((8'hbf) ? (8'hae) : (8'ha6))) ^~ (~((8'hb3) >> (8'hb0)))) ? ((!((8'hb7) ? (8'hba) : (8'ha3))) >= (((8'hb4) * (8'hbe)) & (^~(8'hba)))) : ({((8'hbb) ^ (7'h41)), ((8'ha5) + (8'hb5))} ^~ {((7'h44) ? (7'h42) : (7'h40)), (~^(8'ha2))}))))
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h285):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire90;
  input wire signed [(3'h4):(1'h0)] wire89;
  input wire signed [(5'h11):(1'h0)] wire88;
  input wire [(4'he):(1'h0)] wire87;
  input wire [(4'hd):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire146;
  wire signed [(4'ha):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire143;
  wire signed [(4'h9):(1'h0)] wire138;
  wire signed [(2'h2):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire [(4'hd):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire129;
  wire [(5'h11):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire120;
  wire [(4'hc):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire91;
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire138,
                 wire137,
                 wire136,
                 wire131,
                 wire130,
                 wire129,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire92,
                 wire91,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire91 = $signed((wire87 && wire88[(4'hc):(4'hb)]));
  assign wire92 = (wire90[(2'h3):(1'h0)] >= (wire88[(3'h4):(2'h2)] ?
                      wire91[(4'ha):(2'h2)] : (|$unsigned($unsigned(wire86)))));
  always
    @(posedge clk) begin
      reg93 <= (~(^wire89));
      reg94 <= $signed(($signed({$signed((8'ha9)),
          reg93[(3'h7):(3'h7)]}) >> (($signed(wire86) << (wire89 ?
          (8'hba) : (8'hb7))) << ($unsigned(wire86) << (wire91 | (8'hbb))))));
      if ($signed($signed(({wire92[(2'h2):(1'h1)],
          wire87[(4'he):(1'h0)]} >> $signed($unsigned(wire88))))))
        begin
          if (wire89)
            begin
              reg95 <= (~wire92[(3'h5):(2'h2)]);
              reg96 <= reg95;
              reg97 <= reg96[(4'hd):(4'hd)];
              reg98 <= reg94[(2'h2):(2'h2)];
              reg99 <= ((|wire92[(2'h3):(1'h1)]) ^~ ((^($signed(reg95) >> $signed(wire92))) ?
                  (($unsigned((8'ha9)) ? $unsigned(reg96) : $signed((8'hb1))) ?
                      wire90 : ($unsigned(reg93) ?
                          $unsigned(reg98) : wire88)) : ($unsigned(reg95[(3'h5):(1'h1)]) ?
                      reg93 : ((wire87 ?
                          reg97 : wire90) <<< $signed(wire91)))));
            end
          else
            begin
              reg95 <= wire86;
              reg96 <= {{$signed((|(reg99 ? reg99 : (8'h9d))))},
                  wire86[(4'ha):(2'h3)]};
              reg97 <= wire92;
            end
          reg100 <= $signed(($signed($signed($unsigned(wire91))) * reg98));
        end
      else
        begin
          reg95 <= (($unsigned($signed(wire90)) << (~&$signed(reg99))) & $signed((reg98[(1'h1):(1'h1)] >= ($unsigned((8'ha9)) ?
              (~|reg94) : reg99))));
          if ((|wire88))
            begin
              reg96 <= (+(((reg98 ?
                  $signed((8'ha3)) : (reg98 ?
                      wire88 : wire91)) <<< reg93) <= (~|$signed((reg96 - reg95)))));
              reg97 <= {wire91, wire90[(3'h6):(3'h5)]};
              reg98 <= (8'ha5);
            end
          else
            begin
              reg96 <= $signed($signed(((((8'hbf) ?
                  reg93 : reg96) >= reg95[(3'h4):(2'h2)]) ^~ ($signed(reg93) << wire92[(2'h3):(1'h0)]))));
              reg97 <= reg99[(3'h5):(3'h5)];
              reg98 <= reg93[(1'h0):(1'h0)];
              reg99 <= ((7'h41) ? $unsigned((8'hbc)) : (&wire91));
              reg100 <= wire91[(5'h11):(4'hb)];
            end
          reg101 <= wire90[(2'h3):(2'h3)];
          if ((wire89[(2'h3):(2'h2)] ?
              (~&(((reg94 ? reg98 : wire90) ? $signed((7'h43)) : reg95) ?
                  (+(reg93 >= wire91)) : $signed($unsigned(reg96)))) : {$signed(wire86)}))
            begin
              reg102 <= $signed(($signed({reg94[(3'h6):(1'h0)],
                      wire91[(5'h13):(3'h6)]}) ?
                  (-(reg100 >> $unsigned(wire87))) : (~^reg93[(3'h4):(1'h1)])));
            end
          else
            begin
              reg102 <= ((8'ha4) ?
                  reg99 : ((8'hb7) != $signed($signed($unsigned((8'hae))))));
              reg103 <= ($signed(reg99) != ($signed($unsigned(wire92)) < wire89));
              reg104 <= (~^wire89);
              reg105 <= reg102[(3'h6):(3'h4)];
            end
          if (reg95[(4'hd):(4'h9)])
            begin
              reg106 <= (((8'hab) ? reg93 : (+wire92)) ?
                  {reg102[(3'h5):(3'h5)]} : reg95);
              reg107 <= ($unsigned((((^~reg101) == $signed((8'haa))) ?
                      wire89 : $signed(reg98))) ?
                  (-(|reg102[(4'h9):(4'h9)])) : $unsigned(wire91));
              reg108 <= ($unsigned(reg100) ?
                  $unsigned((($signed(wire86) ~^ $signed(reg102)) + $unsigned(reg98[(4'ha):(3'h6)]))) : (~&$unsigned(reg105)));
              reg109 <= reg93[(3'h5):(3'h5)];
            end
          else
            begin
              reg106 <= $unsigned($unsigned($unsigned(($unsigned((8'hbc)) >> $unsigned(wire92)))));
            end
        end
      reg110 <= (reg106 ?
          ((reg93[(1'h0):(1'h0)] ? wire86[(4'h8):(1'h0)] : $signed(reg109)) ?
              $unsigned((!reg100[(1'h0):(1'h0)])) : $signed(wire87[(3'h6):(1'h0)])) : $signed(reg109[(3'h4):(2'h3)]));
      reg111 <= $signed({wire89[(3'h4):(2'h3)]});
    end
  always
    @(posedge clk) begin
      reg112 <= (({$unsigned((^reg109))} ?
              reg102[(3'h5):(3'h5)] : ((^~reg104[(2'h2):(1'h1)]) ?
                  ($unsigned(reg110) ? (7'h44) : (7'h40)) : {(~|wire90),
                      reg96[(4'h8):(3'h6)]})) ?
          (wire88[(5'h10):(1'h1)] ?
              reg102 : wire89) : $unsigned($unsigned(reg100)));
      if (reg95)
        begin
          reg113 <= reg94;
        end
      else
        begin
          reg113 <= $unsigned(wire90);
          reg114 <= $signed((reg99 ?
              ($unsigned(wire92[(3'h7):(3'h5)]) ?
                  reg104 : $signed(wire89)) : wire86));
          reg115 <= $unsigned((~^(^reg113)));
        end
      reg116 <= (reg101 * $signed((wire86[(1'h1):(1'h0)] ?
          $unsigned(wire91) : wire91)));
      reg117 <= {reg109};
      reg118 <= wire87;
    end
  assign wire119 = reg104;
  assign wire120 = $unsigned($signed({$signed(reg117[(3'h6):(1'h1)])}));
  assign wire121 = {wire91};
  assign wire122 = (wire92[(1'h1):(1'h1)] <= {(((wire120 != wire91) ?
                               (reg113 ? reg118 : reg105) : (reg107 ?
                                   wire121 : reg96)) ?
                           $unsigned($unsigned((8'ha1))) : (8'hbe))});
  always
    @(posedge clk) begin
      reg123 <= reg118[(2'h2):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg124 <= (!((+((wire90 ? reg109 : reg104) ?
          $unsigned((8'haa)) : wire87)) * (&reg104[(2'h3):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg125 <= ((~reg93[(3'h7):(2'h2)]) ?
          ($unsigned($signed((8'ha8))) ?
              {$unsigned($unsigned(wire90)),
                  (8'ha5)} : $unsigned($signed(reg113[(2'h3):(1'h1)]))) : ((({(8'hbc),
                      reg117} ?
                  $signed(reg101) : reg112[(4'h8):(1'h0)]) - ({(8'hb6)} ?
                  wire121 : wire89)) ?
              (reg124 | (reg123[(4'hd):(3'h7)] - (wire119 ?
                  (8'had) : reg94))) : ($signed($signed(reg100)) <= ((|(8'hbd)) << reg108))));
      reg126 <= reg117[(1'h1):(1'h1)];
      reg127 <= (({($signed(reg105) & reg123[(4'h9):(4'h8)]),
                  reg115[(4'hd):(2'h3)]} ?
              ((-(reg102 ? reg98 : reg108)) ?
                  $unsigned((wire86 && reg113)) : reg93[(2'h3):(1'h1)]) : ((~^reg97[(3'h5):(3'h4)]) ?
                  ($unsigned(wire90) ?
                      (reg113 ? wire87 : reg99) : (wire121 ?
                          reg126 : reg116)) : (-{wire121}))) ?
          ($signed({$unsigned(reg102)}) ?
              $unsigned(((reg114 || reg98) <= (wire121 >= reg101))) : {((reg113 && wire120) ?
                      $unsigned(reg106) : $signed(wire122)),
                  wire119[(3'h5):(2'h2)]}) : $unsigned((|{$signed(reg108)})));
      reg128 <= $signed({(~^$signed((&wire89))),
          $signed(reg112[(4'h8):(1'h1)])});
    end
  assign wire129 = $signed((~reg101));
  assign wire130 = ({(|reg112),
                       (~$signed($signed(reg107)))} << ((wire121 << $signed((reg123 ?
                           reg105 : reg102))) ?
                       (~&reg105) : (reg104 ^~ (^$unsigned((8'hbc))))));
  assign wire131 = $unsigned({reg126,
                       ($unsigned((wire120 > (8'haa))) ~^ reg114[(4'hf):(3'h6)])});
  always
    @(posedge clk) begin
      reg132 <= ($unsigned(reg113[(2'h3):(1'h1)]) << (((~(~wire91)) ?
          ((~reg98) ?
              (reg124 || reg111) : (~^reg126)) : wire86) - ($signed((wire87 ?
          wire91 : reg113)) > ((wire92 || (8'hb8)) << (~|reg104)))));
      reg133 <= reg126;
      reg134 <= $unsigned($unsigned((reg107 ?
          ((wire90 ?
              reg98 : reg117) * $unsigned(wire122)) : $unsigned($unsigned((8'ha4))))));
      reg135 <= ($unsigned(wire130[(2'h2):(2'h2)]) ?
          ((($unsigned(wire91) ?
              (-reg96) : $unsigned(reg93)) <<< (!{reg118})) || reg134[(5'h10):(1'h0)]) : (^~$unsigned(($unsigned(reg132) ?
              $unsigned(wire130) : wire90[(4'h9):(1'h1)]))));
    end
  assign wire136 = $unsigned(reg107);
  assign wire137 = (-reg133);
  assign wire138 = $signed(((-reg102[(4'ha):(3'h7)]) > ($unsigned($signed(reg108)) ^ reg96)));
  always
    @(posedge clk) begin
      reg139 <= $unsigned((reg102 ?
          {$signed($unsigned((7'h42))),
              ((+wire122) >>> (wire87 - reg99))} : {(wire87[(2'h2):(2'h2)] ?
                  (wire91 == wire122) : ((7'h42) ? reg118 : reg135)),
              (~&wire91)}));
      reg140 <= ($signed((|$unsigned((7'h44)))) >>> ($unsigned($unsigned($signed(reg93))) - (reg96[(3'h7):(3'h7)] ?
          (reg112 < reg104[(1'h0):(1'h0)]) : $signed(wire90))));
      reg141 <= {$unsigned($signed(reg113[(1'h1):(1'h0)])), (8'ha2)};
      reg142 <= $unsigned(reg102[(2'h3):(2'h2)]);
    end
  assign wire143 = reg94[(2'h3):(1'h0)];
  assign wire144 = $signed(reg112);
  assign wire145 = wire121;
  assign wire146 = $signed(reg111[(2'h3):(1'h0)]);
endmodule

module module38
#(parameter param50 = (&{((((8'h9f) ? (8'hbb) : (7'h41)) << ((8'ha3) > (8'ha3))) <= (((8'ha4) ? (8'hb3) : (8'hbd)) ? {(8'hb2)} : (^~(8'hb5))))}), 
parameter param51 = (^((param50 ? {(~^(8'h9f))} : (~&((8'ha4) & param50))) & (param50 ^~ {(~|param50), param50}))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire43;
  input wire [(5'h12):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire41;
  input wire signed [(4'hf):(1'h0)] wire40;
  input wire signed [(4'hf):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  assign y = {wire49, wire48, wire47, wire46, wire45, wire44, (1'h0)};
  assign wire44 = wire43[(5'h13):(3'h7)];
  assign wire45 = wire39;
  assign wire46 = wire43[(1'h1):(1'h0)];
  assign wire47 = wire41[(5'h12):(3'h4)];
  assign wire48 = wire44;
  assign wire49 = wire42;
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire26;
  input wire signed [(5'h11):(1'h0)] wire25;
  input wire signed [(4'h9):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 (1'h0)};
  assign wire27 = wire25[(2'h2):(2'h2)];
  assign wire28 = (wire23[(4'hb):(1'h1)] + (8'hb7));
  assign wire29 = ($unsigned(wire27) ? (~$unsigned(wire25)) : wire25);
  assign wire30 = ((+wire27) >>> $unsigned(wire28));
  assign wire31 = (((~wire30) | (($unsigned(wire26) ?
                          $signed(wire27) : ((8'ha8) ?
                              wire24 : wire30)) + ($signed(wire28) ?
                          $signed(wire30) : {wire28, wire23}))) ?
                      wire23[(4'h9):(3'h7)] : wire24);
  assign wire32 = $unsigned($unsigned($signed($unsigned($unsigned((8'ha3))))));
  assign wire33 = $unsigned($signed(((wire30 == $signed((7'h40))) ?
                      (wire28[(1'h1):(1'h1)] >> $signed((8'ha6))) : {$unsigned(wire29),
                          $signed((8'ha3))})));
  assign wire34 = ((($unsigned($signed(wire23)) + $unsigned({wire30, wire32})) ?
                          $unsigned($unsigned(wire24[(3'h7):(3'h5)])) : ($signed($signed(wire29)) || ((!wire25) ?
                              (8'hbf) : (wire23 ? (8'hb5) : wire29)))) ?
                      {wire28[(4'h9):(4'h9)]} : (~&{wire29[(1'h0):(1'h0)],
                          $signed((^~wire25))}));
endmodule
