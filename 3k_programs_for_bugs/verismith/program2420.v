module top
#(parameter param191 = ((((^~(!(8'ha2))) ^~ (((8'ha0) ? (8'hb0) : (8'hb2)) ? ((8'hb0) * (7'h42)) : (8'ha8))) ? (&{((8'hb4) ? (7'h42) : (8'hbe)), (~^(8'hb0))}) : ((|((8'h9c) & (7'h40))) * (!(~^(8'hbd))))) ? {((((8'ha8) ? (8'ha3) : (8'had)) ? ((8'h9f) ? (8'ha1) : (8'ha9)) : ((8'hb2) - (8'ha1))) * {(~|(8'h9f)), (!(8'ha4))}), (~((^~(8'ha0)) ? ((8'hb1) ? (8'hbb) : (8'h9d)) : (^(8'h9e))))} : {((&(^(7'h41))) ^~ ({(8'hb1), (8'hba)} >>> ((8'h9d) >= (8'hbc))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h294):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire187;
  wire [(4'he):(1'h0)] wire178;
  wire [(5'h12):(1'h0)] wire177;
  wire [(5'h11):(1'h0)] wire176;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire174;
  wire signed [(4'hd):(1'h0)] wire180;
  wire signed [(5'h10):(1'h0)] wire181;
  wire [(5'h13):(1'h0)] wire182;
  wire signed [(3'h6):(1'h0)] wire183;
  wire signed [(5'h12):(1'h0)] wire184;
  wire signed [(4'he):(1'h0)] wire185;
  reg [(4'hc):(1'h0)] reg190 = (1'h0);
  reg [(5'h13):(1'h0)] reg189 = (1'h0);
  reg [(2'h2):(1'h0)] reg188 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire187,
                 wire178,
                 wire177,
                 wire176,
                 wire5,
                 wire106,
                 wire108,
                 wire174,
                 wire180,
                 wire181,
                 wire182,
                 wire183,
                 wire184,
                 wire185,
                 reg190,
                 reg189,
                 reg188,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
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
                 reg6,
                 (1'h0)};
  assign wire5 = {$signed((~|$signed((^~wire0))))};
  always
    @(posedge clk) begin
      reg6 <= $signed((+(~|(wire1 ? $unsigned(wire0) : wire3[(1'h1):(1'h0)]))));
    end
  module7 #() modinst107 (wire106, clk, wire3, wire0, wire2, wire1, reg6);
  assign wire108 = $unsigned($unsigned(reg6[(4'hf):(3'h7)]));
  always
    @(posedge clk) begin
      reg109 <= (^wire2);
    end
  always
    @(posedge clk) begin
      reg110 <= wire4[(2'h3):(2'h2)];
      reg111 <= ($signed(($unsigned((reg110 ? reg110 : wire2)) ?
          wire4[(2'h2):(1'h1)] : wire2[(4'hc):(1'h0)])) * $signed(wire5));
      if ((^(wire3 ?
          reg111 : ($signed($signed(wire106)) || ((~|wire106) ?
              $unsigned(reg110) : reg109[(1'h1):(1'h0)])))))
        begin
          reg112 <= $signed($signed(wire108[(4'ha):(3'h5)]));
          if ($signed(wire0))
            begin
              reg113 <= $signed($signed(reg112[(3'h7):(1'h1)]));
              reg114 <= wire3[(3'h6):(1'h1)];
            end
          else
            begin
              reg113 <= reg111;
              reg114 <= (+wire1);
              reg115 <= wire4;
            end
        end
      else
        begin
          if ((^~$unsigned({((+reg115) == (wire5 ? wire106 : reg6)),
              wire106[(4'ha):(4'ha)]})))
            begin
              reg112 <= ($signed($signed((-(wire108 || (8'hbd))))) ?
                  $signed(reg6) : wire106);
              reg113 <= ((reg111 | $unsigned($signed(wire5[(1'h0):(1'h0)]))) <= (+($signed((-wire3)) ?
                  ($signed(reg115) ?
                      (wire2 ?
                          reg115 : reg115) : $unsigned((7'h42))) : ((wire3 < reg111) ?
                      wire108[(2'h3):(2'h2)] : reg109[(4'hd):(3'h4)]))));
              reg114 <= (wire0[(4'hd):(4'h8)] ?
                  $signed(wire1[(4'h8):(3'h6)]) : (({reg115,
                              (wire4 || reg109)} ?
                          $signed($signed((8'hb3))) : (^(reg110 ?
                              (7'h40) : reg111))) ?
                      {wire3} : $unsigned(($signed((8'hac)) >> (reg110 ?
                          (8'ha5) : wire106)))));
            end
          else
            begin
              reg112 <= ((reg111[(1'h0):(1'h0)] ?
                  $signed($signed(wire1[(5'h10):(4'h9)])) : wire3[(3'h7):(3'h4)]) >>> wire106);
            end
          if (reg115[(4'he):(4'h9)])
            begin
              reg115 <= $unsigned($signed((8'h9d)));
              reg116 <= (8'hab);
            end
          else
            begin
              reg115 <= ((8'hac) ? reg115 : $unsigned(wire2[(5'h11):(4'ha)]));
              reg116 <= $unsigned($unsigned((~&($signed(reg115) + reg115))));
              reg117 <= $unsigned({(($signed(wire3) + (|reg114)) ~^ {wire1}),
                  ({(reg112 || wire5)} || {(8'h9c)})});
              reg118 <= wire5[(1'h0):(1'h0)];
              reg119 <= ($unsigned($unsigned((8'hba))) != (~wire5));
            end
          if (((&$signed($unsigned((&reg110)))) * $unsigned(({(reg111 != reg115),
                  (wire108 ? reg118 : wire0)} ?
              ((~wire2) < $signed(reg119)) : (~&reg115[(4'ha):(1'h1)])))))
            begin
              reg120 <= wire3[(2'h3):(1'h1)];
              reg121 <= $signed($signed((reg113[(4'h8):(1'h0)] ?
                  (8'h9f) : $signed($signed(reg115)))));
              reg122 <= $signed(reg110);
            end
          else
            begin
              reg120 <= $unsigned($unsigned({(+reg117), reg118}));
              reg121 <= $unsigned(($unsigned((~^wire1)) > $unsigned((^reg114))));
              reg122 <= reg114[(2'h2):(2'h2)];
              reg123 <= reg117;
            end
          reg124 <= (8'hba);
          reg125 <= ((^$unsigned($signed($signed(reg6)))) ^~ $signed(($signed((reg112 && (8'ha6))) ^ $unsigned(wire5[(4'ha):(2'h2)]))));
        end
      reg126 <= wire108;
      reg127 <= reg113;
    end
  always
    @(posedge clk) begin
      if (((((~^$signed(reg111)) ^~ ((|wire0) ?
              (^(8'hbd)) : wire3[(5'h10):(2'h2)])) | (reg126 ?
              $signed((~|wire3)) : (reg123 && (+reg110)))) ?
          ((~^reg123) ~^ ($signed({reg123}) ?
              (~^$unsigned((8'ha9))) : (-(reg116 ^ wire5)))) : (~&reg118)))
        begin
          reg128 <= (((+{reg116[(3'h4):(1'h1)], {reg113, (8'ha2)}}) ?
              reg111 : (&(~|$unsigned(wire4)))) || reg112[(4'he):(3'h7)]);
          if (reg123)
            begin
              reg129 <= wire108[(4'h8):(4'h8)];
              reg130 <= ($unsigned(($unsigned(wire106[(2'h2):(2'h2)]) ^~ reg128)) ?
                  wire0 : (|({(~&reg126), (wire106 + reg6)} <= reg121)));
              reg131 <= $signed($unsigned(((reg118[(3'h5):(3'h4)] ?
                      $signed(wire2) : $unsigned(wire1)) ?
                  reg122[(1'h1):(1'h1)] : wire106[(1'h1):(1'h0)])));
              reg132 <= $signed($unsigned($unsigned($unsigned($signed(wire4)))));
              reg133 <= reg122[(1'h0):(1'h0)];
            end
          else
            begin
              reg129 <= $signed($signed((reg6[(4'hc):(3'h6)] ?
                  $signed($signed(reg111)) : reg6[(4'hc):(2'h3)])));
              reg130 <= $unsigned((-(&((wire4 ? reg122 : reg132) ?
                  reg113[(4'h8):(3'h4)] : reg119[(1'h1):(1'h0)]))));
            end
        end
      else
        begin
          reg128 <= {reg117, $signed($signed(reg131))};
          reg129 <= reg129[(2'h3):(2'h3)];
          reg130 <= ($unsigned($unsigned(({wire4, reg128} ?
                  (wire1 >= reg126) : $unsigned(wire5)))) ?
              reg117[(1'h0):(1'h0)] : reg124[(4'h9):(3'h7)]);
          reg131 <= (8'ha3);
        end
      reg134 <= wire4[(3'h4):(2'h2)];
      if ($signed(reg119[(1'h0):(1'h0)]))
        begin
          if (((^~$signed(wire1)) << ($unsigned({$unsigned(reg132),
              (reg116 ? wire5 : reg124)}) || {$unsigned(reg134),
              ($unsigned(reg111) ? (^~wire1) : (wire5 + reg116))})))
            begin
              reg135 <= reg115;
              reg136 <= (reg116[(2'h3):(1'h1)] ?
                  reg125 : reg114[(2'h2):(2'h2)]);
              reg137 <= $unsigned(((8'hb6) ? reg109 : $unsigned(reg113)));
              reg138 <= $signed(reg110);
            end
          else
            begin
              reg135 <= wire106;
              reg136 <= (^~$signed($signed($unsigned({reg119}))));
              reg137 <= (~|reg129[(2'h2):(1'h0)]);
              reg138 <= $signed($signed($unsigned($signed(reg130[(2'h2):(2'h2)]))));
              reg139 <= ($unsigned($signed((~^$signed(reg114)))) ?
                  $signed((~&$signed(reg109[(4'hc):(4'h8)]))) : $unsigned((($unsigned(reg123) && $unsigned(reg118)) - {$unsigned((8'h9d))})));
            end
        end
      else
        begin
          reg135 <= $unsigned({(8'hae)});
          reg136 <= wire108[(4'h8):(3'h7)];
          reg137 <= reg133[(4'hb):(4'h9)];
          if (reg123[(1'h1):(1'h1)])
            begin
              reg138 <= (-($unsigned(reg132) == reg136));
              reg139 <= wire108;
              reg140 <= ($unsigned(reg129[(2'h3):(2'h2)]) ~^ (((+$signed(reg138)) > (+$signed(reg114))) ?
                  ((reg119[(3'h5):(3'h4)] ?
                      reg125 : reg135[(2'h3):(1'h0)]) + ($signed(reg138) | wire1)) : reg114));
              reg141 <= (reg113 >>> $unsigned({reg133[(4'h9):(4'h9)]}));
            end
          else
            begin
              reg138 <= {{($signed($unsigned(wire3)) ?
                          reg116[(2'h3):(2'h2)] : {reg110})}};
              reg139 <= reg112[(3'h4):(3'h4)];
              reg140 <= reg125[(3'h4):(2'h2)];
            end
        end
      reg142 <= (($unsigned({$signed((8'ha7)),
          (reg120 ~^ reg115)}) - ((((8'h9f) << reg134) << (~(8'ha7))) ^ (-wire108[(4'hb):(3'h6)]))) <<< ($unsigned(reg120[(5'h10):(4'ha)]) ?
          $signed((reg117[(2'h3):(2'h2)] ?
              $signed(reg129) : $signed(reg137))) : (8'hab)));
    end
  module143 #() modinst175 (.wire145(wire106), .wire147(wire0), .wire144(reg110), .wire146(wire4), .clk(clk), .y(wire174));
  assign wire176 = (~&reg127[(3'h4):(2'h2)]);
  assign wire177 = (~|reg133);
  module15 #() modinst179 (.wire20(reg116), .wire18(reg139), .wire16(wire4), .clk(clk), .wire19(wire5), .wire17(wire174), .y(wire178));
  assign wire180 = reg140[(4'hd):(3'h5)];
  assign wire181 = {(reg120 ?
                           $signed($unsigned({reg119})) : $signed((~|wire1[(4'h8):(1'h0)]))),
                       $unsigned($unsigned(wire5[(1'h1):(1'h1)]))};
  assign wire182 = $unsigned(reg131);
  assign wire183 = ({(7'h44)} - (^~{(reg130[(1'h0):(1'h0)] <= (^wire5))}));
  assign wire184 = reg118;
  module151 #() modinst186 (wire185, clk, reg136, reg140, wire4, reg113);
  assign wire187 = reg112[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg188 <= {(reg139[(4'he):(1'h1)] ?
              (reg139 ?
                  $unsigned((reg124 ?
                      wire187 : wire3)) : ($unsigned(wire176) ^~ {wire178})) : reg123[(4'h9):(3'h7)])};
      reg189 <= reg114[(1'h1):(1'h0)];
      reg190 <= {reg126,
          ((((reg121 ~^ reg127) | {wire108,
                  reg111}) >= $signed(((8'ha6) ~^ reg110))) ?
              ({(8'ha8), $signed(reg137)} ?
                  $signed({reg115,
                      reg120}) : reg127[(1'h1):(1'h1)]) : $unsigned((+(reg126 || reg116))))};
    end
endmodule

module module143
#(parameter param173 = (((!(((8'hb1) ? (8'hae) : (7'h41)) < (~|(8'hb5)))) && ({((8'hbe) >> (8'hb3))} + ({(8'hac), (8'ha7)} >>> (&(8'ha8))))) + ((((8'ha2) <= ((8'ha5) ? (8'hb1) : (8'h9e))) ? (~{(8'hb3), (8'ha0)}) : (!((7'h44) ^~ (8'hb7)))) ? ((|(&(8'hb7))) ? (((8'ha0) ? (8'hbe) : (8'had)) ~^ ((8'hb2) ? (8'hbb) : (8'ha6))) : ((~^(8'hbd)) && (!(8'hb8)))) : (~|{(~^(8'h9c))}))))
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire147;
  input wire signed [(4'hc):(1'h0)] wire146;
  input wire [(5'h12):(1'h0)] wire145;
  input wire signed [(3'h5):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire172;
  wire [(3'h5):(1'h0)] wire171;
  wire [(4'he):(1'h0)] wire170;
  wire signed [(5'h10):(1'h0)] wire169;
  wire [(4'hd):(1'h0)] wire167;
  wire [(3'h7):(1'h0)] wire150;
  wire [(4'hd):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire148;
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire167,
                 wire150,
                 wire149,
                 wire148,
                 (1'h0)};
  assign wire148 = $signed($signed((wire147[(4'ha):(3'h4)] ?
                       (wire144 | (wire144 >> wire144)) : wire145[(3'h6):(2'h3)])));
  assign wire149 = {wire146, $unsigned((+$signed(((8'hb0) - wire144))))};
  assign wire150 = wire144;
  module151 #() modinst168 (.wire154(wire150), .clk(clk), .wire152(wire149), .wire155(wire148), .y(wire167), .wire153(wire147));
  assign wire169 = wire145[(1'h1):(1'h1)];
  assign wire170 = ({wire144[(3'h5):(3'h5)]} << (((^$unsigned((8'hbe))) ^ $unsigned({wire149})) >> (((wire146 ?
                               (8'ha0) : wire145) ?
                           $unsigned(wire144) : wire169[(3'h7):(1'h0)]) ?
                       (~&{wire147, wire146}) : wire147)));
  assign wire171 = (~&$signed((~|wire150[(3'h4):(2'h3)])));
  assign wire172 = $unsigned({{$unsigned({wire146})}});
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h21f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire101;
  wire [(3'h4):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire33;
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire98,
                 wire63,
                 wire62,
                 wire61,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire36,
                 wire35,
                 wire13,
                 wire14,
                 wire33,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 (1'h0)};
  assign wire13 = ($signed((^~($unsigned(wire9) != $signed(wire10)))) ?
                      wire9[(3'h4):(3'h4)] : ({$signed((8'ha9)), wire9} ?
                          $unsigned(wire8[(2'h3):(1'h1)]) : ((^~(wire10 ?
                              (8'hbe) : wire10)) | wire8[(5'h12):(4'hd)])));
  assign wire14 = $unsigned($signed((~^{{wire12, wire8}})));
  module15 #() modinst34 (.wire18(wire13), .wire20(wire11), .wire17(wire9), .wire19(wire8), .wire16(wire14), .y(wire33), .clk(clk));
  assign wire35 = ({(wire10 >= (-(+wire33)))} ?
                      ((((wire33 && wire14) <= $signed(wire33)) ?
                          wire8[(1'h0):(1'h0)] : wire12[(3'h5):(2'h3)]) * wire13[(4'hf):(4'h9)]) : wire12[(1'h0):(1'h0)]);
  assign wire36 = ($unsigned(($unsigned($signed(wire14)) && $unsigned((~wire10)))) ?
                      wire35[(2'h3):(2'h2)] : (~|(~|(&(wire12 | wire10)))));
  always
    @(posedge clk) begin
      reg37 <= wire10;
      if (wire33[(5'h11):(4'hd)])
        begin
          reg38 <= {(wire14[(2'h3):(1'h1)] ~^ wire33), wire14};
          reg39 <= $signed(reg38);
          reg40 <= (|wire9[(5'h13):(3'h4)]);
          if ((&(wire11[(4'h9):(1'h1)] ?
              {((wire9 ~^ wire8) ? wire10 : wire8)} : wire13)))
            begin
              reg41 <= $signed(wire13[(5'h11):(1'h0)]);
              reg42 <= $signed({(&(^(reg41 ? wire33 : wire11))),
                  wire14[(3'h4):(1'h0)]});
            end
          else
            begin
              reg41 <= $unsigned($signed(wire33[(3'h6):(2'h3)]));
              reg42 <= wire8[(5'h10):(1'h1)];
              reg43 <= ({$unsigned(({(8'ha7), wire36} ?
                      (+(8'hbe)) : (wire10 != reg39))),
                  (((&wire14) >= $unsigned(wire12)) ?
                      (~|$signed(reg38)) : ($unsigned((8'ha6)) ?
                          $unsigned(reg38) : $unsigned(reg40)))} >>> ((|((~|wire9) ?
                  $unsigned(wire13) : $unsigned(reg40))) >>> reg38[(3'h7):(3'h5)]));
              reg44 <= $unsigned((7'h42));
            end
        end
      else
        begin
          reg38 <= wire36;
          reg39 <= ((((^~reg38[(4'hc):(1'h1)]) ?
              ($signed(reg38) - (reg41 ?
                  wire14 : wire14)) : $signed(wire9)) >>> (reg44[(3'h6):(2'h2)] || $unsigned($unsigned(reg39)))) - reg41[(3'h6):(2'h2)]);
          reg40 <= (|{(($signed(reg41) ? (wire8 ^~ wire33) : {(8'hb4)}) ?
                  ($signed(wire10) >= (reg44 ?
                      reg40 : wire11)) : (^~wire11[(1'h0):(1'h0)])),
              {(((8'hb5) ? reg42 : (8'hae)) >= $unsigned(reg40)),
                  ((wire11 ? (8'hb7) : wire36) ? (!wire36) : (8'hb6))}});
        end
    end
  assign wire45 = $unsigned(reg37[(1'h1):(1'h0)]);
  assign wire46 = reg37[(4'hc):(4'hb)];
  assign wire47 = $unsigned((8'hae));
  assign wire48 = $signed(reg37[(3'h5):(2'h2)]);
  assign wire49 = $unsigned(wire10[(3'h4):(2'h3)]);
  assign wire50 = ((reg38[(2'h2):(1'h1)] ~^ ({reg40[(1'h0):(1'h0)],
                      $unsigned((7'h41))} >> ((wire46 + wire33) & ((8'haf) + reg41)))) + {wire14});
  always
    @(posedge clk) begin
      reg51 <= (((({wire45} ?
                  wire8 : reg43[(1'h0):(1'h0)]) ^ (^$signed(reg42))) ?
              ((|{reg43,
                  reg40}) ^~ wire14[(4'hb):(3'h7)]) : $unsigned($signed((~&reg39)))) ?
          (&wire48) : wire9[(4'h8):(3'h4)]);
      reg52 <= ((wire36[(1'h0):(1'h0)] ?
          {(((8'hbb) ? wire14 : wire10) ?
                  $signed(wire35) : {reg38})} : (-{reg40,
              (wire14 ? reg39 : (7'h43))})) < (((((8'ha5) ? wire48 : reg41) ?
              $unsigned(wire9) : {wire49}) ?
          $unsigned($unsigned(wire14)) : reg44) ~^ {(|{(8'hbf)}),
          $unsigned((wire47 >>> (8'ha8)))}));
      if ((reg52 ?
          (wire49 ?
              (reg43[(2'h2):(1'h0)] ?
                  reg52[(4'h8):(3'h4)] : (8'hb9)) : (reg38[(1'h1):(1'h1)] ?
                  ((~|wire8) ^~ (reg38 ? wire48 : wire36)) : (reg39 ?
                      $unsigned(reg42) : (wire11 <= wire8)))) : wire46[(3'h5):(2'h2)]))
        begin
          reg53 <= (((!{(wire14 ? (8'ha4) : (8'ha2)), ((8'hba) << wire47)}) ?
                  wire12[(3'h4):(1'h1)] : $unsigned($unsigned($unsigned(reg37)))) ?
              ((~|$unsigned(reg40[(4'hb):(4'hb)])) >> reg38) : ((((!wire50) ^ $signed(wire12)) < (^$signed(reg41))) ?
                  {{(&reg38)}} : (-wire13[(3'h5):(3'h5)])));
        end
      else
        begin
          reg53 <= $unsigned(wire11[(4'h9):(2'h3)]);
          if ((8'hac))
            begin
              reg54 <= $unsigned($signed($unsigned($signed((reg51 * (8'ha8))))));
              reg55 <= $signed(($signed((^(-reg52))) == $signed($signed({wire13}))));
              reg56 <= $unsigned({((!(|wire49)) ?
                      ({wire10, reg41} ?
                          $unsigned(wire8) : (wire49 + wire8)) : $unsigned($signed(wire45))),
                  ($signed(wire14[(3'h5):(2'h3)]) && wire48)});
            end
          else
            begin
              reg54 <= $signed({{(reg40 ? reg54 : {reg40, wire36}),
                      {(wire13 ? reg52 : reg44)}}});
              reg55 <= $unsigned((+reg52[(3'h6):(3'h5)]));
              reg56 <= $signed((^$unsigned(reg42)));
              reg57 <= {$unsigned((((wire36 ? reg55 : wire9) < ((8'ha8) ?
                          reg42 : (8'hb9))) ?
                      reg54[(3'h7):(2'h3)] : $unsigned(reg52[(2'h2):(1'h0)]))),
                  (reg54 ?
                      wire8 : ((wire45[(2'h3):(2'h2)] ?
                              reg41 : (wire14 ? wire12 : wire12)) ?
                          ((~^wire46) ?
                              (reg56 ^ reg52) : reg37) : $unsigned((|wire50))))};
            end
          reg58 <= ((~&{((8'hab) + (reg52 ? wire47 : reg38))}) ?
              (reg55[(1'h0):(1'h0)] ?
                  (8'hae) : reg56) : ($signed(wire35[(1'h0):(1'h0)]) ?
                  (~^(wire45[(2'h2):(2'h2)] ?
                      (&reg57) : $signed((7'h44)))) : reg56[(5'h12):(4'h8)]));
        end
      reg59 <= wire12;
      reg60 <= $unsigned($unsigned(wire50[(3'h5):(3'h5)]));
    end
  assign wire61 = reg55[(3'h6):(1'h1)];
  assign wire62 = $signed($signed(wire13[(4'h9):(2'h2)]));
  assign wire63 = wire11[(3'h6):(1'h1)];
  module64 #() modinst99 (.wire67(wire35), .clk(clk), .y(wire98), .wire68(reg57), .wire69(wire8), .wire65(reg44), .wire66(reg37));
  assign wire100 = reg57;
  assign wire101 = $signed(reg53[(3'h5):(3'h5)]);
  assign wire102 = reg56;
  assign wire103 = ((reg52[(3'h6):(1'h0)] ?
                           $signed($unsigned($unsigned(wire11))) : $signed(((^~reg55) ?
                               (wire36 ?
                                   wire13 : wire12) : $unsigned(reg41)))) ?
                       $signed((&{wire33,
                           wire61[(4'h9):(4'h8)]})) : wire36[(4'h9):(3'h7)]);
  assign wire104 = {(|(|wire98))};
  assign wire105 = ({(reg59 < ((wire47 ~^ (7'h44)) > $unsigned(wire103)))} ?
                       ((reg58[(5'h11):(5'h10)] ?
                           (^$unsigned(reg56)) : reg39[(1'h0):(1'h0)]) | (reg59 ?
                           $signed((wire100 ?
                               reg57 : reg58)) : $signed((~^reg59)))) : $unsigned($unsigned($signed($signed(wire61)))));
endmodule

module module64
#(parameter param97 = ((({{(8'hbd)}} | (8'hb0)) ? {((~|(8'hb0)) ? ((8'had) ^~ (8'haa)) : (~&(8'hb7))), (!((7'h43) ? (8'hb7) : (8'hb5)))} : ((~^{(8'hba)}) ^ ({(8'hb8)} == (8'had)))) ? ({(|((8'ha7) ? (8'hb5) : (8'ha0))), ({(8'ha3), (8'hb3)} >> ((8'ha0) >= (8'h9d)))} >= ((8'h9c) ^~ (~|(!(8'ha2))))) : (8'hae)))
(y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire69;
  input wire signed [(4'hd):(1'h0)] wire68;
  input wire signed [(4'h9):(1'h0)] wire67;
  input wire signed [(5'h14):(1'h0)] wire66;
  input wire signed [(5'h15):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  assign y = {wire96,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire79,
                 wire78,
                 reg95,
                 reg94,
                 reg93,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~((({wire65, wire65} ? $unsigned(wire66) : wire68[(4'h8):(2'h3)]) ?
              ({wire66, wire69} ?
                  (wire68 ? wire68 : wire66) : (|wire68)) : (wire68 < wire65)) ?
          $signed($signed(((8'hb1) ? (8'hac) : wire66))) : (wire65 ?
              wire69 : $unsigned($signed(wire66))))))
        begin
          reg70 <= $signed(($unsigned(wire66) ?
              ((wire65[(3'h6):(2'h2)] ?
                  (wire69 ?
                      wire65 : wire68) : ((8'hbd) >= wire69)) - $signed($signed((8'ha7)))) : (wire65 == {(^(8'ha2))})));
        end
      else
        begin
          reg70 <= wire65;
          reg71 <= ($signed($signed(wire68)) ?
              (({(wire68 ? (7'h43) : wire66)} * ((wire67 ?
                      wire66 : wire66) << $unsigned(wire68))) ?
                  $unsigned($unsigned(wire65[(2'h2):(2'h2)])) : ($unsigned({(8'hbf),
                          (7'h41)}) ?
                      reg70 : (^~(wire66 >= wire68)))) : $unsigned(({$signed(wire66),
                      wire67[(4'h8):(2'h2)]} ?
                  ((8'h9e) ? (&wire68) : {wire67}) : {(|wire65)})));
          reg72 <= reg71;
        end
      if ({(wire68 || wire69[(4'ha):(4'h8)])})
        begin
          reg73 <= wire67;
          if (wire69)
            begin
              reg74 <= $signed($unsigned((wire66 ?
                  {$unsigned(reg70)} : $unsigned($unsigned(reg73)))));
              reg75 <= (8'hab);
            end
          else
            begin
              reg74 <= {$unsigned((+(reg73[(1'h1):(1'h1)] ?
                      reg70[(4'h8):(2'h3)] : (reg73 ? wire68 : wire68))))};
              reg75 <= ($unsigned(reg72[(5'h10):(3'h6)]) | $unsigned(wire69[(4'he):(3'h4)]));
              reg76 <= (wire68 <= ((~^$unsigned((~reg72))) >= wire68));
            end
          reg77 <= ($unsigned(({(reg72 - reg74)} ~^ reg70[(4'hc):(3'h7)])) ?
              reg76[(3'h4):(2'h3)] : (reg76 ?
                  $unsigned(wire67) : ({(reg73 <= reg70),
                      {wire65, reg73}} < wire67[(1'h0):(1'h0)])));
        end
      else
        begin
          reg73 <= reg73;
        end
    end
  assign wire78 = (reg71[(4'ha):(3'h5)] & $unsigned((reg73[(1'h0):(1'h0)] * reg75[(3'h6):(3'h5)])));
  assign wire79 = ($signed((reg71 ~^ ($unsigned((8'ha9)) < $signed(wire66)))) <= ($signed((~$signed(reg71))) && (|reg73)));
  always
    @(posedge clk) begin
      if (reg76[(1'h0):(1'h0)])
        begin
          reg80 <= reg70;
          if ({(!$signed(wire66[(5'h13):(3'h5)]))})
            begin
              reg81 <= reg74[(4'ha):(1'h1)];
              reg82 <= reg70[(1'h0):(1'h0)];
              reg83 <= $unsigned(wire65[(4'he):(4'ha)]);
              reg84 <= wire68[(4'ha):(3'h6)];
              reg85 <= reg74;
            end
          else
            begin
              reg81 <= {$unsigned((^$unsigned((8'ha9)))), {wire78}};
              reg82 <= ((!(reg82 ?
                  {(reg74 ^~ reg82), (reg85 ? (8'hae) : wire65)} : ((reg74 ?
                      wire65 : wire67) != reg85[(4'hf):(3'h7)]))) ^~ reg85[(5'h13):(4'hd)]);
              reg83 <= $unsigned($unsigned((wire66 & {(&reg74),
                  $unsigned((8'ha1))})));
              reg84 <= $unsigned((~(((reg80 >>> (8'hbc)) ?
                  (wire69 ~^ reg72) : (^reg74)) & ($unsigned(reg84) ?
                  wire69[(4'hd):(3'h5)] : (reg82 ? reg80 : reg81)))));
            end
        end
      else
        begin
          if (((|reg83[(3'h7):(3'h5)]) ?
              $unsigned(((+(~|reg84)) ?
                  (!reg75[(4'ha):(3'h6)]) : wire69[(2'h3):(1'h0)])) : (reg76[(1'h0):(1'h0)] >>> reg83)))
            begin
              reg80 <= reg81;
              reg81 <= $unsigned((~&$unsigned($unsigned($unsigned(reg74)))));
              reg82 <= (((($signed(wire65) > (reg70 ? reg82 : reg75)) ?
                      $unsigned($unsigned(wire69)) : reg76[(1'h0):(1'h0)]) << $signed((^(reg77 ?
                      wire65 : reg80)))) ?
                  (8'hb9) : (reg76[(4'hd):(1'h0)] ?
                      wire78[(3'h5):(1'h1)] : reg71));
              reg83 <= $signed((reg81 > ((~|(~reg71)) ?
                  $signed(wire79) : ((wire67 ? wire67 : wire78) ?
                      $signed(wire67) : $signed(reg73)))));
              reg84 <= $unsigned(reg73);
            end
          else
            begin
              reg80 <= ((reg81[(3'h4):(2'h2)] ?
                      (|(((8'hbf) ? reg74 : reg76) + ((8'hb2) ?
                          (8'h9d) : reg82))) : (~|$unsigned((!reg85)))) ?
                  reg81 : $unsigned($unsigned($unsigned((reg75 ?
                      reg77 : reg85)))));
              reg81 <= (^$signed((($unsigned(reg72) ?
                      $unsigned(reg85) : reg72[(4'ha):(2'h3)]) ?
                  $unsigned(reg70) : $signed($unsigned(reg77)))));
              reg82 <= $unsigned((wire65 < ((!(^wire79)) ?
                  $signed(reg85[(4'ha):(3'h5)]) : $unsigned({reg82}))));
              reg83 <= (wire67 ?
                  (((wire66[(4'h8):(1'h1)] ? reg81 : (&reg84)) ?
                      reg83[(1'h0):(1'h0)] : ($unsigned(wire79) ?
                          (reg81 ?
                              reg73 : (8'hb4)) : reg84[(2'h3):(1'h1)])) >= (^reg81[(1'h0):(1'h0)])) : ($unsigned(wire68) <<< reg82));
              reg84 <= ($signed({(reg71 >>> reg82[(3'h5):(2'h3)])}) >> $signed(wire78));
            end
        end
      reg86 <= reg71;
      reg87 <= $signed((~^$unsigned($signed(wire67[(2'h3):(1'h0)]))));
    end
  assign wire88 = (({reg84[(2'h2):(1'h1)],
                          (wire78[(1'h0):(1'h0)] ?
                              (reg80 ? reg80 : reg80) : {reg85, reg82})} ?
                      ((((8'haa) ^ reg70) ?
                              $signed(reg77) : (reg83 ~^ (8'hbf))) ?
                          (~^(+reg80)) : $unsigned((reg72 & reg86))) : ($unsigned({(8'hba)}) + $unsigned(((8'hb4) ?
                          reg82 : wire68)))) != (^{reg82,
                      (reg72[(3'h5):(2'h3)] ? {reg70} : (wire66 > wire69))}));
  assign wire89 = reg81;
  assign wire90 = (({((reg77 - wire79) ? (8'hb3) : $signed(wire79)),
                      wire65[(3'h7):(3'h5)]} || reg76[(2'h2):(1'h0)]) && (~|(8'haa)));
  assign wire91 = (8'h9c);
  assign wire92 = {wire69[(2'h3):(2'h2)]};
  always
    @(posedge clk) begin
      reg93 <= {$unsigned($unsigned(reg72[(3'h4):(1'h1)]))};
    end
  always
    @(posedge clk) begin
      reg94 <= reg74;
      reg95 <= $signed(wire68[(1'h1):(1'h0)]);
    end
  assign wire96 = (!({reg72, (~^{wire90, (8'hb3)})} + reg70[(5'h10):(3'h4)]));
endmodule

module module15
#(parameter param31 = ((^((~|((8'ha8) ? (8'hae) : (8'hb9))) ? {((8'had) ? (8'hbf) : (8'haf))} : ({(8'haa), (8'hbb)} ? ((8'haa) == (8'hbf)) : (&(7'h42))))) || ({(((8'hb0) >= (8'hbb)) < (^(7'h43))), (((8'h9d) ^~ (8'ha8)) < ((7'h40) ? (8'hbb) : (8'hbd)))} >= {{{(7'h44), (8'haf)}}, (((8'hb8) || (8'ha3)) | (^~(8'haa)))})), 
parameter param32 = ((~^(((param31 ? param31 : param31) ? param31 : (-param31)) ? ((&param31) ? param31 : {(8'hbf)}) : ((|param31) ~^ {param31}))) < {({param31} * ({(8'hb9)} ? (param31 - param31) : param31))}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire27,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg28,
                 reg26,
                 (1'h0)};
  assign wire21 = ((-($signed({wire18, wire18}) ?
                          (8'hb4) : (wire20[(3'h4):(2'h2)] ?
                              ((8'haa) ? wire17 : wire19) : (8'h9f)))) ?
                      wire16[(1'h0):(1'h0)] : ((($signed(wire16) ?
                                  (~|(8'hbc)) : {(8'haf)}) ?
                              wire16[(1'h1):(1'h1)] : $unsigned($unsigned(wire20))) ?
                          (8'hb7) : $unsigned(($signed(wire20) ?
                              (^wire16) : wire18))));
  assign wire22 = ((~|(wire20[(4'h8):(1'h1)] >> $signed({wire19}))) == {(^(^~wire19))});
  assign wire23 = $unsigned($unsigned((-((^~wire17) ^ (wire21 ?
                      wire20 : wire16)))));
  assign wire24 = $unsigned($signed(wire17));
  assign wire25 = $unsigned(wire21);
  always
    @(posedge clk) begin
      reg26 <= $signed((-(^~$unsigned(wire18))));
    end
  assign wire27 = $unsigned(wire18[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg28 <= (8'haf);
    end
  assign wire29 = reg26[(3'h4):(2'h3)];
  assign wire30 = $unsigned(($unsigned((!(wire22 ? wire18 : wire23))) ?
                      wire27[(4'ha):(3'h6)] : wire23));
endmodule

module module151  (y, clk, wire155, wire154, wire153, wire152);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire155;
  input wire [(3'h7):(1'h0)] wire154;
  input wire [(5'h15):(1'h0)] wire153;
  input wire [(4'hd):(1'h0)] wire152;
  wire [(5'h14):(1'h0)] wire166;
  wire signed [(3'h7):(1'h0)] wire165;
  wire [(3'h5):(1'h0)] wire164;
  wire [(5'h11):(1'h0)] wire163;
  wire [(5'h14):(1'h0)] wire162;
  reg [(4'hc):(1'h0)] reg161 = (1'h0);
  reg signed [(4'he):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg156 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg156 <= (wire155 ?
          (wire152 ?
              (~$unsigned($signed(wire152))) : ((~wire155[(4'h8):(1'h0)]) ~^ (wire153[(5'h12):(1'h1)] ?
                  {wire154} : wire154[(3'h4):(1'h0)]))) : $signed(wire152));
      if ({(+((-$signed(reg156)) ?
              (wire155 ? $unsigned(wire153) : {wire154}) : ((wire155 ?
                  wire153 : wire153) <<< (wire152 ? wire154 : wire155))))})
        begin
          reg157 <= $unsigned((~((reg156 < (wire154 ?
              wire154 : (8'had))) * $signed($signed((8'hac))))));
          reg158 <= ((|((^~wire153[(4'hd):(4'ha)]) ?
              $unsigned((wire155 ? reg156 : wire153)) : ($signed(wire152) ?
                  (wire153 ?
                      wire153 : wire154) : (~|wire153)))) - $signed((((wire153 < wire152) <<< $signed(wire152)) ?
              $signed({reg157}) : (reg156[(4'h8):(2'h2)] < $signed((8'hbd))))));
          reg159 <= $signed($signed((((~^wire155) - wire154[(3'h7):(3'h7)]) < ((reg157 || reg156) != reg158[(2'h3):(1'h0)]))));
        end
      else
        begin
          reg157 <= $unsigned($unsigned((+$unsigned((wire153 && (8'h9d))))));
          reg158 <= $signed($unsigned(wire155));
          reg159 <= (($unsigned((~|(wire153 == (8'h9f)))) << (|reg158)) ?
              $unsigned($unsigned((~|(wire153 < reg159)))) : (|$unsigned($unsigned({reg158}))));
        end
      reg160 <= ($unsigned($unsigned((!$unsigned(reg157)))) ~^ $signed(wire155));
      reg161 <= $signed(((wire153[(4'hc):(4'hc)] != $signed($unsigned(wire152))) ?
          $signed((+wire155)) : ($unsigned($signed((8'haa))) >> $unsigned((reg160 >>> reg160)))));
    end
  assign wire162 = $unsigned($unsigned(wire155[(3'h7):(1'h0)]));
  assign wire163 = wire162[(5'h13):(1'h0)];
  assign wire164 = $signed(reg160);
  assign wire165 = ($signed(wire162) > wire163);
  assign wire166 = $unsigned($signed(((wire165 ?
                       (+wire154) : $unsigned((7'h43))) - wire163[(2'h3):(2'h2)])));
endmodule
