module top
#(parameter param214 = {(^(((^(8'ha1)) && ((7'h40) ? (8'ha7) : (8'ha9))) || (~&(+(8'ha9)))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire210;
  wire [(5'h10):(1'h0)] wire208;
  wire signed [(2'h3):(1'h0)] wire203;
  wire [(4'he):(1'h0)] wire202;
  wire [(2'h3):(1'h0)] wire200;
  wire [(4'hd):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire175;
  wire [(4'ha):(1'h0)] wire174;
  wire [(4'hb):(1'h0)] wire173;
  wire [(4'h9):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire171;
  wire signed [(5'h10):(1'h0)] wire212;
  reg [(5'h14):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg206 = (1'h0);
  reg [(5'h12):(1'h0)] reg207 = (1'h0);
  assign y = {wire210,
                 wire208,
                 wire203,
                 wire202,
                 wire200,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire48,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire171,
                 wire212,
                 reg204,
                 reg205,
                 reg206,
                 reg207,
                 (1'h0)};
  module4 #() modinst49 (.wire8(wire3), .wire5((8'ha9)), .clk(clk), .wire9(wire1), .wire7(wire2), .y(wire48), .wire6(wire0));
  assign wire50 = (wire3[(2'h3):(1'h1)] < (wire0[(2'h3):(2'h2)] ?
                      wire2 : wire0[(3'h7):(2'h2)]));
  assign wire51 = (!(8'haa));
  assign wire52 = wire3;
  assign wire53 = wire51;
  assign wire54 = $unsigned((~&wire1[(2'h2):(1'h0)]));
  assign wire55 = $signed($unsigned($unsigned($signed($signed(wire53)))));
  assign wire56 = wire48[(3'h4):(3'h4)];
  assign wire57 = $unsigned((!{($signed(wire50) ? wire50 : {wire3}),
                      $signed({wire52})}));
  assign wire58 = (|$unsigned(wire50));
  assign wire59 = wire55[(4'hb):(4'h8)];
  module60 #() modinst172 (.y(wire171), .clk(clk), .wire63(wire51), .wire64(wire1), .wire65(wire53), .wire62(wire48), .wire61(wire59));
  assign wire173 = $unsigned($signed(wire59[(3'h4):(3'h4)]));
  assign wire174 = (((~|wire51) ?
                       $unsigned(wire52) : wire59[(2'h2):(1'h0)]) < wire48[(3'h7):(3'h7)]);
  assign wire175 = wire173[(1'h1):(1'h1)];
  assign wire176 = (wire53 | wire48[(2'h2):(1'h1)]);
  module177 #() modinst201 (wire200, clk, wire1, wire52, wire54, wire55);
  assign wire202 = $signed((-(8'h9e)));
  assign wire203 = wire2[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg204 <= wire174;
      reg205 <= $unsigned((wire53 ~^ $signed(({(8'hb2), wire48} && (wire202 ?
          wire2 : wire59)))));
      reg206 <= (&(wire202[(3'h6):(3'h6)] ~^ wire1[(4'h8):(2'h2)]));
      reg207 <= (($signed(((8'haf) ^ (~^wire171))) ?
              {wire202[(3'h4):(2'h3)]} : wire176) ?
          {{wire0[(4'h8):(2'h2)], wire202},
              $unsigned($signed((wire59 <= wire202)))} : ($signed((8'ha3)) ?
              $signed($unsigned(wire175[(5'h11):(2'h2)])) : (&({wire202} > (wire50 ?
                  reg206 : wire174)))));
    end
  module90 #() modinst209 (wire208, clk, wire2, reg207, wire53, wire174, wire176);
  module4 #() modinst211 (.wire7(wire3), .wire9(reg204), .wire5(wire202), .y(wire210), .wire6(wire55), .clk(clk), .wire8(reg205));
  module4 #() modinst213 (wire212, clk, reg205, wire52, reg206, wire55, wire59);
endmodule

module module177
#(parameter param199 = ((|((((8'hbd) ? (8'h9f) : (8'hb4)) > (-(8'ha1))) ? (~^((8'ha8) ? (8'ha8) : (8'hb9))) : {((8'hb6) * (7'h40)), {(8'hab)}})) ? {{(((8'hb6) <<< (8'hb0)) ? {(8'hbf)} : {(8'had), (8'haf)})}} : (&(((!(8'hbc)) & {(8'hb6)}) ? (((8'hba) ? (8'ha5) : (8'hb1)) ? ((8'hb9) ? (8'hb1) : (8'h9f)) : ((8'ha8) ? (8'hbe) : (8'hb6))) : ((8'hbc) ? {(8'h9e)} : ((8'hb2) + (8'ha5)))))))
(y, clk, wire181, wire180, wire179, wire178);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire181;
  input wire [(5'h10):(1'h0)] wire180;
  input wire [(5'h10):(1'h0)] wire179;
  input wire signed [(4'hf):(1'h0)] wire178;
  wire signed [(4'hf):(1'h0)] wire198;
  wire signed [(2'h3):(1'h0)] wire197;
  wire [(4'he):(1'h0)] wire195;
  wire [(4'hb):(1'h0)] wire182;
  assign y = {wire198, wire197, wire195, wire182, (1'h0)};
  assign wire182 = (~$signed($signed(wire181)));
  module183 #() modinst196 (.wire184(wire182), .y(wire195), .wire185(wire180), .wire186(wire179), .wire187(wire181), .clk(clk));
  assign wire197 = wire178;
  assign wire198 = (+$signed((wire182 * wire180[(2'h3):(2'h3)])));
endmodule

module module60
#(parameter param170 = ((-((((8'hb1) ? (7'h42) : (7'h41)) ? (|(8'ha6)) : ((8'hb2) << (8'ha4))) << (((8'hb2) ~^ (8'ha2)) < (-(8'ha1))))) != (^(!{((8'hb0) ? (8'ha9) : (8'hae)), ((8'hb6) ? (8'hb3) : (8'hb2))}))))
(y, clk, wire61, wire62, wire63, wire64, wire65);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire61;
  input wire [(3'h7):(1'h0)] wire62;
  input wire signed [(3'h6):(1'h0)] wire63;
  input wire signed [(5'h11):(1'h0)] wire64;
  input wire signed [(4'hd):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire168;
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  assign y = {wire66,
                 wire67,
                 wire68,
                 wire168,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire66 = wire65[(3'h6):(3'h4)];
  assign wire67 = (($signed(wire61[(1'h1):(1'h1)]) > ((|(wire66 ?
                      wire65 : wire63)) > wire65[(3'h4):(1'h0)])) && (wire63 != $signed(wire65[(4'ha):(1'h0)])));
  assign wire68 = wire64;
  always
    @(posedge clk) begin
      reg69 <= (^~(^$unsigned((((8'hb4) ? wire65 : wire61) == {(8'hbe)}))));
      if ($unsigned($signed(($unsigned(wire61[(1'h0):(1'h0)]) ?
          $signed({(8'ha9)}) : {(wire63 ? wire62 : reg69),
              ((8'hbc) ? reg69 : wire62)}))))
        begin
          reg70 <= wire68;
          if (wire66[(4'hd):(3'h5)])
            begin
              reg71 <= $unsigned(wire68[(4'h8):(2'h3)]);
              reg72 <= {$unsigned(($signed(wire62) + (wire68[(4'h9):(4'h9)] <<< $unsigned(reg69)))),
                  ($signed(wire62[(2'h3):(1'h0)]) ?
                      ($unsigned($unsigned((8'h9e))) ?
                          $unsigned({wire65,
                              wire68}) : $signed($signed(reg70))) : ((8'hb3) & $unsigned({wire62,
                          wire61})))};
              reg73 <= $signed((^{reg72[(2'h3):(2'h2)], {(wire63 + (8'ha8))}}));
              reg74 <= ((((&(~wire66)) != $signed($signed(reg70))) ?
                      $unsigned(wire68[(3'h6):(3'h4)]) : wire63) ?
                  $signed((($unsigned(reg69) >> reg73) & (reg72[(1'h0):(1'h0)] <= (wire64 + wire61)))) : ((~^((reg71 ?
                          reg73 : wire68) ?
                      ((8'ha7) < reg70) : {wire67,
                          wire61})) < $signed(((~wire65) > (-reg69)))));
            end
          else
            begin
              reg71 <= ((|$unsigned(wire63)) & (((~&wire67) ?
                      wire63[(2'h2):(1'h1)] : (-(wire65 >>> reg71))) ?
                  ($signed((reg74 ? wire63 : reg72)) ?
                      reg70[(1'h0):(1'h0)] : {wire65[(4'hc):(1'h0)]}) : $signed(wire67[(5'h10):(4'h9)])));
            end
          reg75 <= reg69;
        end
      else
        begin
          if ((reg70[(4'ha):(4'h9)] ?
              ($signed(reg72) ?
                  ($signed(wire68) ?
                      $signed(wire64) : wire64[(3'h5):(3'h5)]) : $unsigned((^$unsigned((8'ha1))))) : ((~reg69[(4'he):(3'h4)]) ~^ {(!$unsigned(wire62))})))
            begin
              reg70 <= (wire62[(2'h3):(1'h1)] <<< wire68);
              reg71 <= ((|reg71) ?
                  {$unsigned((reg75 ?
                          (8'hb0) : reg69[(3'h7):(3'h7)]))} : $signed((((wire66 ?
                              reg69 : wire62) ?
                          (+wire61) : {reg70, reg69}) ?
                      {(8'hb5),
                          (wire63 ?
                              wire64 : wire66)} : $unsigned((wire67 - reg69)))));
            end
          else
            begin
              reg70 <= reg72[(3'h6):(2'h2)];
            end
          reg72 <= ($signed($signed($unsigned((^~(8'h9c))))) ?
              $signed((~^wire63[(2'h2):(2'h2)])) : $unsigned(wire61[(1'h0):(1'h0)]));
          reg73 <= $unsigned(reg72);
        end
      reg76 <= $signed(reg69[(2'h2):(1'h0)]);
      reg77 <= (8'hbb);
      if (reg71)
        begin
          reg78 <= wire65[(1'h0):(1'h0)];
          reg79 <= reg73;
          reg80 <= reg72[(4'ha):(2'h3)];
          reg81 <= reg77;
        end
      else
        begin
          if ($unsigned($unsigned((~$signed(reg73)))))
            begin
              reg78 <= $unsigned(wire67);
              reg79 <= ({$unsigned(wire61[(3'h4):(1'h0)]),
                  {(-reg73)}} ~^ {(wire61[(3'h4):(1'h1)] ?
                      (8'ha5) : {$signed(wire62), (reg81 ? wire66 : wire65)})});
              reg80 <= (~^wire62);
              reg81 <= ($signed(reg74) ?
                  ($unsigned($unsigned((8'hb4))) ?
                      {reg70,
                          {(reg73 << wire65),
                              $unsigned(wire62)}} : {(+(|wire62)),
                          reg71[(4'hf):(4'ha)]}) : {reg77,
                      (($signed(reg74) - wire64) ?
                          {{wire65}} : $signed(reg77[(2'h2):(1'h1)]))});
            end
          else
            begin
              reg78 <= $unsigned((wire68 <<< (-$unsigned((reg77 ?
                  wire62 : wire65)))));
              reg79 <= ((reg73 | (({wire64, reg81} ?
                      wire65[(4'h9):(2'h2)] : (reg73 ~^ reg77)) << $unsigned(wire61))) ?
                  $signed(reg81[(4'hb):(4'h9)]) : reg79);
              reg80 <= $signed($signed((~reg70[(3'h6):(2'h3)])));
              reg81 <= $signed((($signed(wire68) - reg72) ?
                  (reg77 + (reg73[(4'h8):(1'h0)] ? wire67 : wire65)) : reg80));
            end
          reg82 <= (reg72 ?
              ($signed(((wire64 ? (8'hb2) : reg81) ?
                  {wire66} : (reg81 ?
                      reg71 : reg74))) != (reg73[(2'h2):(2'h2)] ?
                  ($signed(wire67) >= (reg76 ?
                      reg73 : reg79)) : (!(wire62 & reg70)))) : (^~$signed(reg74[(4'h8):(1'h1)])));
          if (($signed((~|$signed((wire65 ?
              reg80 : (8'ha8))))) ^~ (~&{($signed(wire62) <= {reg80})})))
            begin
              reg83 <= ($unsigned((&reg80[(4'h9):(3'h4)])) ?
                  $unsigned(wire65) : ((+reg70[(3'h7):(3'h5)]) ?
                      {{(reg81 | wire64)}, wire62} : reg69[(4'hb):(2'h2)]));
              reg84 <= reg82[(4'hd):(4'ha)];
              reg85 <= (~^$signed($unsigned(($signed(reg76) && $signed(reg75)))));
              reg86 <= reg81;
              reg87 <= ($unsigned((-({wire61} ? $signed((8'hae)) : reg77))) ?
                  reg73 : wire66[(4'h9):(1'h1)]);
            end
          else
            begin
              reg83 <= reg71[(4'ha):(3'h7)];
              reg84 <= reg72;
              reg85 <= {((reg74 < ((~&wire65) ?
                      (reg78 ?
                          wire61 : (8'hbb)) : $unsigned(reg73))) != ({(reg74 ?
                          reg76 : wire61),
                      (reg69 * reg78)} & $signed(wire65[(2'h3):(2'h3)]))),
                  wire62[(3'h5):(2'h3)]};
            end
          reg88 <= $signed(reg72[(3'h5):(2'h2)]);
          reg89 <= $unsigned(((-reg71[(3'h4):(3'h4)]) > reg87));
        end
    end
  module90 #() modinst169 (wire168, clk, reg77, reg86, reg87, reg74, wire65);
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire10;
  assign y = {wire47, wire46, wire44, wire10, (1'h0)};
  assign wire10 = wire5;
  module11 #() modinst45 (.y(wire44), .wire13(wire7), .wire14(wire9), .wire15(wire6), .wire12(wire10), .clk(clk));
  assign wire46 = {wire7, wire5[(3'h4):(2'h3)]};
  assign wire47 = (!{wire6[(3'h7):(1'h1)], wire9});
endmodule

module module11
#(parameter param42 = (((^(((8'hb1) ? (8'hac) : (8'hb8)) < (+(7'h41)))) * (~&(((8'ha9) & (8'ha5)) ? ((8'hbc) | (8'ha5)) : {(8'hac)}))) ? (!(~^((~^(8'hba)) ~^ (|(8'ha4))))) : (((~^(^(8'h9f))) ? (((8'hbf) ? (8'hb5) : (8'ha7)) * {(8'haa), (8'hb4)}) : ((&(8'ha4)) != (~(7'h44)))) ? (8'h9c) : {(-((8'hb5) ? (8'ha0) : (8'ha3))), {((8'hb3) ? (8'ha8) : (8'hae)), ((8'hbc) - (8'hbe))}})), 
parameter param43 = ((8'hb2) > (^{(+((8'hbd) ? (8'ha3) : param42))})))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire16;
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire35,
                 wire33,
                 wire32,
                 wire19,
                 wire16,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg34,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire16 = wire13[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg17 <= ($signed($unsigned((8'ha2))) ?
          ($signed(($unsigned(wire16) && $unsigned((7'h41)))) ?
              $unsigned(wire13) : wire15[(1'h0):(1'h0)]) : (~^(($unsigned(wire12) == wire14) << $signed((wire12 << wire15)))));
      reg18 <= reg17;
    end
  assign wire19 = ($signed((wire13[(2'h2):(1'h1)] ~^ $unsigned($signed(wire15)))) && ((reg18[(1'h1):(1'h1)] ?
                      ($signed(wire16) | (~^wire15)) : (&(wire13 >>> wire12))) & reg17[(4'ha):(2'h3)]));
  always
    @(posedge clk) begin
      if ((!($signed({wire14[(4'he):(4'h8)]}) - wire19)))
        begin
          reg20 <= ({((wire16[(1'h0):(1'h0)] < $signed(wire16)) ?
                  (7'h41) : ((wire13 * reg17) == (7'h44)))} || wire14);
        end
      else
        begin
          if ($signed(((^~reg18) << $unsigned($signed(((8'ha8) & reg20))))))
            begin
              reg20 <= $signed((wire12 - wire19[(1'h0):(1'h0)]));
              reg21 <= (~&reg17);
              reg22 <= wire12[(1'h1):(1'h0)];
              reg23 <= wire15[(3'h7):(3'h4)];
              reg24 <= (reg21 || ((!(^~wire16[(4'hc):(2'h3)])) <= reg23));
            end
          else
            begin
              reg20 <= $unsigned($unsigned(wire19[(3'h4):(2'h2)]));
            end
        end
      reg25 <= reg20;
      reg26 <= $signed((&$signed($signed($unsigned(wire15)))));
      if ((wire13[(3'h5):(3'h4)] ?
          ((8'hbb) ^ wire13) : {(+$signed((wire12 ? wire19 : reg24)))}))
        begin
          reg27 <= reg25;
        end
      else
        begin
          if (wire13)
            begin
              reg27 <= $unsigned(wire15[(3'h6):(1'h1)]);
              reg28 <= {$signed($signed({reg18[(1'h0):(1'h0)],
                      $signed(wire13)})),
                  $unsigned($unsigned($unsigned((7'h44))))};
              reg29 <= (reg27 && (reg17[(3'h7):(1'h0)] ?
                  {$signed(wire16[(2'h2):(1'h1)])} : (((reg18 >>> reg23) + (wire19 >= reg25)) & $unsigned((wire15 ^~ wire15)))));
              reg30 <= $signed(reg26);
              reg31 <= ($signed($signed(({reg18} > $signed(reg26)))) ?
                  $signed(({$unsigned(reg28), reg22[(4'hb):(3'h6)]} < ((reg23 ?
                      reg21 : (8'haf)) > wire19))) : reg27);
            end
          else
            begin
              reg27 <= reg27;
              reg28 <= $unsigned((({(reg30 || wire15), reg21[(4'ha):(4'h8)]} ?
                      $signed((8'hae)) : ((reg31 ? wire19 : reg25) <<< (reg29 ?
                          reg27 : reg30))) ?
                  wire14[(3'h6):(3'h4)] : $unsigned((-{reg27}))));
              reg29 <= (wire16 ?
                  ((((reg25 | reg22) >= (wire19 ?
                      reg21 : wire13)) << {(~(8'hb7))}) + (wire15 <= reg27[(4'he):(4'hc)])) : {$signed($unsigned({wire16}))});
            end
        end
    end
  assign wire32 = ({$unsigned({$signed(reg26)})} ?
                      reg26[(4'hb):(3'h6)] : ((reg26[(4'hb):(4'ha)] ^~ $unsigned($signed(reg29))) ?
                          reg21 : (reg20 ?
                              ((8'hbe) >>> $signed(reg21)) : {(+(8'hbe)),
                                  (reg25 ? wire16 : reg27)})));
  assign wire33 = {$signed(reg31),
                      $signed($unsigned(($unsigned(wire13) ?
                          $signed(wire13) : $signed(wire14))))};
  always
    @(posedge clk) begin
      reg34 <= reg31;
    end
  assign wire35 = ((|(^reg21)) <<< reg31);
  always
    @(posedge clk) begin
      if (($signed(($signed($signed(reg25)) ?
          reg22[(3'h6):(1'h0)] : (reg31 ?
              $unsigned(reg30) : (~|(8'hb3))))) == (8'ha8)))
        begin
          reg36 <= wire16;
        end
      else
        begin
          reg36 <= reg24;
          reg37 <= (^~{$unsigned(($unsigned((8'hb5)) ?
                  (reg25 >= reg24) : reg24))});
          reg38 <= $signed(($unsigned({((8'hb5) | wire19),
              $unsigned(reg23)}) >= ($signed($signed(wire13)) ?
              reg36[(4'h9):(3'h7)] : wire33[(2'h2):(1'h0)])));
        end
      reg39 <= (7'h43);
      reg40 <= $signed($unsigned(reg26));
      reg41 <= (~^(~wire16[(4'h8):(1'h1)]));
    end
endmodule

module module90
#(parameter param166 = (+{(!(((8'hb3) ? (8'ha1) : (8'hb8)) <<< ((8'hb2) == (7'h44))))}), 
parameter param167 = (~^param166))
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h314):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire95;
  input wire [(5'h12):(1'h0)] wire94;
  input wire [(5'h15):(1'h0)] wire93;
  input wire signed [(3'h6):(1'h0)] wire92;
  input wire signed [(4'hd):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire153;
  wire [(3'h6):(1'h0)] wire152;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(3'h6):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire140;
  wire [(5'h13):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire137;
  wire [(4'hf):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire96;
  reg [(4'hd):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg163 = (1'h0);
  reg [(4'he):(1'h0)] reg162 = (1'h0);
  reg [(3'h7):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg [(3'h7):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire108,
                 wire107,
                 wire97,
                 wire96,
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
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
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
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire96 = wire95;
  assign wire97 = $unsigned((+$signed(wire92[(3'h6):(3'h4)])));
  always
    @(posedge clk) begin
      if ($signed($unsigned($unsigned((-wire91)))))
        begin
          if ((~|(($unsigned(wire94[(2'h3):(1'h1)]) ?
              (wire95 ?
                  (wire94 ?
                      wire91 : wire95) : (!wire96)) : wire94[(4'he):(1'h1)]) >>> (wire93 - ((|(8'hb2)) > wire91[(3'h7):(3'h7)])))))
            begin
              reg98 <= ((~(!(|(~&wire94)))) ?
                  (7'h43) : $signed(wire94[(4'ha):(4'h8)]));
              reg99 <= $unsigned({wire92[(3'h6):(3'h5)],
                  (wire92 > (wire95 * wire96))});
              reg100 <= {$signed({wire93[(3'h5):(3'h5)], reg99[(2'h2):(2'h2)]}),
                  wire93[(4'he):(4'h8)]};
            end
          else
            begin
              reg98 <= (~&(8'hab));
              reg99 <= ($signed($signed($signed(wire94[(4'ha):(1'h1)]))) ?
                  wire91[(3'h5):(3'h5)] : reg99);
              reg100 <= wire91;
              reg101 <= wire93[(4'h9):(3'h6)];
            end
          if ((($unsigned((8'hbc)) != {wire92}) <= {(wire91 ?
                  (~&$unsigned(wire96)) : (^((8'ha4) ^~ wire96)))}))
            begin
              reg102 <= (!{wire92[(2'h3):(2'h3)], (8'haf)});
              reg103 <= wire95;
            end
          else
            begin
              reg102 <= ($signed(reg98) ?
                  ({reg100[(3'h7):(3'h7)]} > $unsigned(($signed((8'hb4)) ?
                      $signed(wire96) : $signed(reg100)))) : reg98);
              reg103 <= (({reg99[(4'he):(2'h3)]} ?
                  (8'haa) : $signed(({reg98} ?
                      $signed((8'hbf)) : $signed((8'hbb))))) & (reg100 >> (^~(8'hbd))));
              reg104 <= ($signed($signed($signed($unsigned(wire97)))) ?
                  ((~^(~^(reg98 ^~ wire92))) ?
                      $unsigned({$signed(wire92)}) : wire97[(2'h3):(2'h3)]) : reg99);
            end
          reg105 <= {reg100};
        end
      else
        begin
          reg98 <= $signed($signed(wire96[(1'h0):(1'h0)]));
          reg99 <= ((reg105[(4'h8):(3'h6)] ?
                  (^{reg105[(5'h12):(4'hc)],
                      ((8'ha8) <= reg101)}) : $signed((8'h9e))) ?
              $unsigned(reg100) : reg99);
          reg100 <= $signed($signed(($signed((^~reg101)) == reg100)));
          if ((8'ha2))
            begin
              reg101 <= $signed($signed((reg99 ?
                  reg101[(1'h1):(1'h1)] : wire92[(2'h2):(2'h2)])));
              reg102 <= $signed((^({(wire92 || (8'hb6))} && (wire97[(2'h2):(2'h2)] ?
                  {wire96} : (wire92 ^~ reg101)))));
              reg103 <= ($unsigned((((8'ha9) ? reg99 : $signed(reg104)) ?
                  wire97[(1'h0):(1'h0)] : ((&(7'h40)) ^~ (wire96 ?
                      wire93 : (8'h9d))))) << reg104[(4'h8):(3'h5)]);
            end
          else
            begin
              reg101 <= {$unsigned($signed((~|((8'ha1) | wire91))))};
              reg102 <= $unsigned($unsigned(reg103));
              reg103 <= (^~({wire94[(3'h4):(2'h2)]} ?
                  reg98[(3'h5):(2'h2)] : reg102[(1'h0):(1'h0)]));
              reg104 <= reg98[(4'ha):(1'h0)];
              reg105 <= reg102[(1'h1):(1'h1)];
            end
          reg106 <= ((&(reg98 ?
                  $signed($signed(wire94)) : ((wire92 >= wire94) ^ {reg99,
                      (7'h41)}))) ?
              reg102 : wire92);
        end
    end
  assign wire107 = (reg100 && ($signed(reg101[(4'he):(4'he)]) ?
                       reg102 : (+(+(wire91 ? reg105 : (8'haf))))));
  assign wire108 = $signed((({(reg100 ? reg104 : wire94),
                       $unsigned(wire93)} - reg102[(1'h0):(1'h0)]) >>> (~|{$unsigned(wire92),
                       (^wire91)})));
  always
    @(posedge clk) begin
      reg109 <= (wire97[(1'h0):(1'h0)] ?
          $unsigned((^~((reg98 >>> reg98) ?
              reg104[(5'h12):(4'he)] : reg98[(3'h4):(3'h4)]))) : (~({(wire91 - wire94)} != reg101)));
      if (reg102)
        begin
          reg110 <= {reg105[(4'hd):(1'h0)]};
          if ({{$signed($unsigned((^(8'ha3)))),
                  {(8'hbf), reg101[(5'h10):(4'hb)]}}})
            begin
              reg111 <= $unsigned((!(^($signed(reg105) >>> reg100))));
              reg112 <= reg101[(4'hf):(4'h9)];
              reg113 <= $unsigned(reg105);
            end
          else
            begin
              reg111 <= wire91[(2'h2):(1'h0)];
              reg112 <= (($unsigned(reg113[(3'h6):(2'h2)]) ?
                      {(~reg109)} : $signed(wire95)) ?
                  {{reg110},
                      (+$signed((wire94 >> reg113)))} : $signed((+(reg98 ?
                      $unsigned((8'had)) : (wire95 ^ (8'ha8))))));
            end
          if ($signed({(!(reg101[(4'hd):(3'h6)] ?
                  (wire92 - (8'hab)) : {wire91, wire91})),
              reg103[(3'h4):(1'h1)]}))
            begin
              reg114 <= ({wire97[(1'h1):(1'h1)]} - reg106);
              reg115 <= $signed($signed($unsigned($signed(((8'ha4) ?
                  wire92 : reg109)))));
              reg116 <= ((($signed((reg102 | reg105)) ?
                      ((-wire97) ?
                          $unsigned(wire107) : (+wire107)) : reg115[(2'h2):(2'h2)]) ?
                  $unsigned($unsigned((wire95 ?
                      reg101 : reg100))) : ((&reg99[(5'h12):(1'h1)]) >>> wire92)) && ({(wire108 && $signed(reg113)),
                      reg114} ?
                  reg111 : (reg103 ?
                      {$unsigned(reg103), (8'haf)} : wire107[(5'h10):(3'h4)])));
            end
          else
            begin
              reg114 <= reg104[(3'h4):(2'h3)];
              reg115 <= $signed({((reg105[(4'h9):(3'h6)] ?
                      $signed((8'hbe)) : wire94[(4'ha):(3'h6)]) << (&$signed((8'haa))))});
              reg116 <= $signed((~^wire91[(2'h2):(2'h2)]));
              reg117 <= (+$signed(reg116[(3'h7):(3'h5)]));
              reg118 <= wire93[(5'h11):(5'h10)];
            end
          if ((8'hb4))
            begin
              reg119 <= (reg99 >> $signed((($unsigned(reg115) ^ (reg105 ?
                      reg102 : wire93)) ?
                  reg113[(2'h2):(1'h0)] : (8'ha6))));
              reg120 <= (((|wire107[(5'h11):(3'h7)]) ?
                      {$unsigned((wire93 ?
                              reg118 : (8'hbc)))} : $unsigned((^~reg118))) ?
                  reg118[(2'h3):(1'h0)] : ((($signed(wire94) ?
                              {wire91} : $unsigned(reg112)) ?
                          ((wire91 <<< wire94) <= wire107[(3'h6):(2'h2)]) : (~reg116)) ?
                      $unsigned((^reg114)) : (~&$unsigned((~|(8'haa))))));
              reg121 <= ($unsigned((-$unsigned((^~reg104)))) || (wire95[(2'h2):(1'h1)] ?
                  reg105 : ({(-wire94)} || (&((8'hb0) ? wire96 : reg110)))));
              reg122 <= reg104;
            end
          else
            begin
              reg119 <= reg112;
              reg120 <= {$signed({$unsigned((!reg101)),
                      wire92[(1'h0):(1'h0)]})};
              reg121 <= ((|reg101) ~^ (+$unsigned(reg114[(4'ha):(4'ha)])));
            end
        end
      else
        begin
          reg110 <= (((-((reg101 <= reg109) == (|(8'hb6)))) <= $signed({{reg98,
                  reg98}})) >>> ((~((8'hbb) ?
              (wire97 ? wire91 : reg120) : {reg122})) > reg118[(3'h4):(1'h1)]));
          reg111 <= (^$unsigned((((wire93 ? wire97 : reg114) ?
              $signed(reg99) : (reg121 ?
                  wire92 : (8'ha5))) <<< $unsigned($unsigned(reg113)))));
          if ($unsigned(wire93))
            begin
              reg112 <= $unsigned($signed(($unsigned($signed((8'ha1))) >= (reg110[(2'h3):(1'h1)] ?
                  reg115 : (!reg101)))));
            end
          else
            begin
              reg112 <= reg111;
              reg113 <= $signed(wire96);
              reg114 <= $unsigned(wire92[(2'h3):(1'h1)]);
              reg115 <= {$signed($signed($signed(reg98[(4'h8):(3'h7)]))),
                  $unsigned(reg120)};
            end
        end
      reg123 <= (((8'hbe) ?
              ((^(reg122 <= reg103)) * reg103) : reg98[(4'ha):(1'h0)]) ?
          (^($signed($signed(reg110)) ?
              {((8'hb3) > reg122)} : $unsigned(((7'h43) ?
                  reg109 : reg110)))) : ($unsigned(reg111[(4'ha):(4'ha)]) == {({reg113} ?
                  reg101 : {(8'hae), (8'hbd)}),
              wire92[(3'h6):(1'h0)]}));
      if (reg123)
        begin
          if ($signed({reg110[(2'h2):(2'h2)]}))
            begin
              reg124 <= $unsigned(reg112);
            end
          else
            begin
              reg124 <= $signed(wire95);
              reg125 <= $unsigned(((|(!$unsigned(reg105))) ?
                  $unsigned($unsigned((reg121 < (7'h41)))) : (reg105 != (reg98[(3'h4):(1'h1)] ?
                      (8'hbd) : (~^reg98)))));
              reg126 <= $unsigned($unsigned($signed($signed((wire93 >>> reg101)))));
              reg127 <= ({$signed($unsigned((reg115 ?
                      reg111 : (8'haf))))} + $signed(reg112));
              reg128 <= $unsigned(wire92);
            end
          reg129 <= reg127;
          reg130 <= reg120;
          reg131 <= ({$signed(wire95[(2'h2):(1'h1)])} ?
              (~|$signed(reg112)) : (~&{(reg99[(4'hb):(4'h8)] ?
                      $signed(reg103) : (wire92 != reg117)),
                  ((-reg127) ? (~&(8'hb3)) : (^reg120))}));
          reg132 <= $unsigned(wire95[(1'h0):(1'h0)]);
        end
      else
        begin
          if ($unsigned(reg102))
            begin
              reg124 <= $unsigned($unsigned({reg119[(2'h3):(2'h2)],
                  ((wire91 ^~ wire92) & (reg116 && (8'hb8)))}));
              reg125 <= ({(reg105 ?
                          reg105 : ($signed(reg112) ?
                              (!wire91) : $signed(reg106))),
                      $unsigned((reg121[(2'h2):(2'h2)] ?
                          $unsigned(reg99) : (wire96 ? wire92 : reg127)))} ?
                  $unsigned(wire94[(4'hf):(1'h0)]) : $signed(((((8'ha5) ?
                          (8'hbc) : reg131) ~^ (^(8'h9e))) ?
                      wire96[(3'h7):(3'h5)] : $unsigned(reg119))));
              reg126 <= reg123;
              reg127 <= (((wire93[(5'h11):(4'hf)] >>> $signed((reg118 ~^ wire97))) ?
                  (8'ha2) : reg106[(3'h5):(1'h1)]) >>> (({(wire93 <= reg121),
                          (8'hb6)} ?
                      $unsigned((^~reg114)) : {reg110[(1'h1):(1'h0)]}) ?
                  {$unsigned({wire91, reg128}),
                      $signed((~&(8'hb9)))} : $unsigned($signed((reg114 + reg119)))));
              reg128 <= wire96;
            end
          else
            begin
              reg124 <= reg105;
              reg125 <= reg118[(3'h4):(2'h3)];
            end
        end
      reg133 <= $unsigned((($signed(reg101) ? (|$unsigned(reg121)) : wire108) ?
          wire91[(4'hb):(1'h0)] : (wire97[(1'h1):(1'h1)] & reg114)));
    end
  assign wire134 = (~&(-$unsigned($signed((~reg129)))));
  assign wire135 = reg117[(1'h1):(1'h0)];
  assign wire136 = reg115[(1'h1):(1'h1)];
  assign wire137 = ((|$unsigned(((wire108 ? (8'ha1) : reg121) <<< (reg98 ?
                           reg112 : reg99)))) ?
                       ((reg98[(4'h9):(4'h9)] << (&wire91[(3'h5):(3'h4)])) ?
                           ({(~|(7'h42))} < (((8'hac) <= wire91) & (7'h44))) : reg112[(4'hd):(4'h9)]) : $signed(wire95));
  assign wire138 = ({(reg130 ?
                           ({wire94, reg130} == reg103) : (reg113 ?
                               (reg131 <<< wire137) : (reg99 ^~ wire134)))} >> $signed(wire137));
  assign wire139 = (!reg101[(4'he):(4'hc)]);
  assign wire140 = wire138[(4'hf):(1'h0)];
  assign wire141 = wire91;
  assign wire142 = (((^($signed(wire97) ?
                           wire134[(4'ha):(4'h8)] : $unsigned(reg126))) ?
                       (-$signed((~&(8'ha4)))) : (reg122[(2'h2):(1'h0)] < reg115[(1'h1):(1'h0)])) != {(+($unsigned(reg127) ?
                           $unsigned(reg104) : $unsigned(wire96))),
                       wire135});
  always
    @(posedge clk) begin
      reg143 <= (~&$unsigned(wire92[(1'h1):(1'h0)]));
      reg144 <= $signed((^~($signed({reg121,
          reg99}) > (~^(reg104 || reg115)))));
      reg145 <= {wire140[(1'h0):(1'h0)]};
      reg146 <= {(^wire136[(2'h3):(1'h1)])};
      if ($signed((((+$signed((8'hbd))) ? wire140 : {(^(8'ha4)), (|wire93)}) ?
          (~|wire141[(3'h5):(3'h5)]) : (reg99 ^ (reg110 ? reg99 : {reg98})))))
        begin
          reg147 <= ((^$unsigned((8'hac))) | ((^~$unsigned($signed(wire139))) ?
              $unsigned(wire136) : $unsigned(({reg110} ?
                  (+reg145) : $unsigned((8'ha7))))));
          reg148 <= wire93[(5'h11):(4'he)];
          reg149 <= ($unsigned((^$signed({reg112}))) <<< ({(reg117[(1'h1):(1'h0)] ?
                  (-wire139) : $signed(reg131)),
              $signed($signed(reg114))} ^ {$signed($signed(reg125)),
              $unsigned(wire141)}));
          reg150 <= (~^reg103[(1'h1):(1'h1)]);
          reg151 <= wire140[(4'h8):(1'h0)];
        end
      else
        begin
          reg147 <= (({((7'h40) <= reg116),
              $signed(reg127)} ^~ {$signed((reg149 + reg149))}) >>> $signed(reg147));
          if ((!reg127[(1'h1):(1'h0)]))
            begin
              reg148 <= $signed(($unsigned((+reg124)) ?
                  {$signed($signed(reg101)),
                      ((reg143 ?
                          reg101 : wire141) ^ (reg106 >= reg126))} : $signed($unsigned((~^reg122)))));
              reg149 <= ({(^~({reg120} * reg125[(1'h0):(1'h0)]))} ~^ (7'h40));
              reg150 <= $signed(wire94);
            end
          else
            begin
              reg148 <= wire136[(2'h2):(1'h1)];
              reg149 <= $signed(reg146);
              reg150 <= (wire94[(3'h7):(2'h3)] ?
                  wire95[(2'h2):(1'h1)] : wire96[(3'h5):(3'h5)]);
            end
        end
    end
  assign wire152 = (|($signed(reg113[(4'h8):(3'h5)]) ?
                       (reg98 ?
                           $unsigned((reg123 ~^ reg128)) : reg101) : (reg131 ?
                           $unsigned((reg121 ?
                               reg101 : wire140)) : reg144[(3'h4):(1'h1)])));
  assign wire153 = reg123;
  assign wire154 = reg130;
  assign wire155 = $unsigned({$unsigned(((wire134 | reg112) ?
                           reg127 : $signed(reg125)))});
  always
    @(posedge clk) begin
      reg156 <= (wire97 >>> (8'hb8));
      reg157 <= {$signed($unsigned($unsigned(wire135))),
          $signed((reg119[(2'h3):(1'h0)] != (8'hb4)))};
      if ((&(^~((^$signed(wire92)) ? reg100 : {(-(8'hae))}))))
        begin
          reg158 <= (reg127 ?
              wire140[(4'ha):(3'h7)] : (wire142[(3'h5):(1'h0)] ?
                  (|(wire141[(1'h0):(1'h0)] ?
                      ((8'h9c) || reg143) : wire107[(4'hb):(3'h6)])) : $signed($signed(reg126[(4'h8):(3'h6)]))));
          reg159 <= wire139[(3'h7):(2'h2)];
        end
      else
        begin
          reg158 <= reg143;
          reg159 <= {reg104[(1'h1):(1'h0)], $signed(reg132[(4'hd):(4'h8)])};
          reg160 <= ((~|($unsigned((7'h41)) <= $signed((+reg126)))) ^~ $signed(($signed($unsigned(wire94)) ?
              $signed((~reg146)) : ((reg146 <= wire94) >= $signed((8'hb8))))));
          if ((($unsigned($unsigned(reg117[(1'h0):(1'h0)])) && reg149) ?
              (reg116[(3'h6):(1'h0)] ?
                  (^reg160[(4'hc):(1'h0)]) : wire108[(2'h3):(2'h3)]) : $signed($unsigned(reg132))))
            begin
              reg161 <= reg112;
              reg162 <= wire155[(2'h2):(2'h2)];
              reg163 <= $signed((8'hbe));
            end
          else
            begin
              reg161 <= reg129[(4'ha):(1'h0)];
              reg162 <= $signed(reg103[(1'h0):(1'h0)]);
            end
        end
      reg164 <= (~$signed(($unsigned((^~reg123)) ?
          reg116[(1'h0):(1'h0)] : wire141)));
      reg165 <= {{(+reg163), reg144[(3'h5):(2'h3)]}};
    end
endmodule

module module183
#(parameter param193 = (8'ha9), 
parameter param194 = param193)
(y, clk, wire187, wire186, wire185, wire184);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire187;
  input wire signed [(5'h10):(1'h0)] wire186;
  input wire [(5'h10):(1'h0)] wire185;
  input wire signed [(3'h6):(1'h0)] wire184;
  wire signed [(5'h13):(1'h0)] wire190;
  wire [(4'hc):(1'h0)] wire189;
  reg [(5'h10):(1'h0)] reg192 = (1'h0);
  reg [(2'h2):(1'h0)] reg191 = (1'h0);
  reg [(4'ha):(1'h0)] reg188 = (1'h0);
  assign y = {wire190, wire189, reg192, reg191, reg188, (1'h0)};
  always
    @(posedge clk) begin
      reg188 <= wire187;
    end
  assign wire189 = ($unsigned((7'h42)) ?
                       $unsigned(($unsigned($unsigned(wire186)) ?
                           wire184[(1'h1):(1'h1)] : wire187)) : ($signed($unsigned($signed(wire184))) ?
                           wire184 : ($signed((wire185 ?
                               wire185 : wire187)) - ($signed(wire185) >> {wire185,
                               wire186}))));
  assign wire190 = ((wire184 ?
                           (((wire187 ? wire186 : wire185) | {wire184,
                               wire186}) == ({wire189,
                               wire185} > (wire186 + wire189))) : reg188) ?
                       $unsigned({((wire189 ?
                               wire189 : wire189) | (reg188 != wire187))}) : wire187);
  always
    @(posedge clk) begin
      reg191 <= (^($unsigned($signed(wire185)) >= (~((~^wire185) ?
          $signed(wire186) : {wire190}))));
      reg192 <= (!$signed($unsigned(wire187)));
    end
endmodule
