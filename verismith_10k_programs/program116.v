module top
#(parameter param96 = ((+((((8'had) && (8'hbb)) ? ((8'h9d) ? (7'h44) : (7'h44)) : ((8'ha9) << (7'h44))) ~^ (-((8'hb1) | (8'ha8))))) ^ (({((8'ha0) + (8'ha0)), ((7'h41) ? (8'hbf) : (8'ha5))} <<< (8'ha5)) ? (({(8'hb9)} >= {(8'h9f)}) ? {((8'hbc) || (7'h44)), {(8'haa), (8'hac)}} : {((8'hab) ? (8'ha0) : (8'hb7)), ((8'haa) >> (8'ha9))}) : (8'hac))), 
parameter param97 = {param96, (-(({param96} || (param96 ? param96 : (8'hb0))) < (|param96)))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire93;
  assign y = {wire95, wire5, wire6, wire7, wire93, (1'h0)};
  assign wire5 = $unsigned((wire0[(1'h1):(1'h1)] || $signed($signed($signed(wire2)))));
  assign wire6 = $signed((!$unsigned(({wire2, wire2} ?
                     (wire4 ? wire4 : wire5) : (wire0 ? (8'hac) : wire4)))));
  assign wire7 = wire2[(1'h0):(1'h0)];
  module8 #() modinst94 (wire93, clk, wire0, wire4, wire1, wire5, wire7);
  assign wire95 = $unsigned(wire1);
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire14;
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  assign y = {wire90,
                 wire51,
                 wire49,
                 wire33,
                 wire32,
                 wire26,
                 wire25,
                 wire24,
                 wire14,
                 reg92,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 (1'h0)};
  assign wire14 = wire10[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (((wire12[(4'hd):(4'hc)] ? wire9[(1'h1):(1'h1)] : $unsigned(wire14)) ?
          wire14 : wire12[(3'h7):(2'h2)]))
        begin
          reg15 <= (~(-$signed($signed({wire9}))));
          if (((($signed((wire12 ?
                  wire14 : reg15)) ~^ ($unsigned(wire13) <= (wire14 ?
                  reg15 : wire11))) == (reg15[(3'h4):(1'h1)] <= ((wire13 ?
                      wire11 : wire9) ?
                  (wire11 ? wire13 : (8'hb7)) : $unsigned(wire9)))) ?
              wire9[(2'h3):(2'h2)] : ($signed(((reg15 ^ wire14) ?
                      {wire14} : (^~reg15))) ?
                  ($unsigned((+wire11)) <<< $unsigned(wire10[(2'h2):(1'h1)])) : $unsigned(wire12))))
            begin
              reg16 <= wire12[(4'hc):(3'h7)];
            end
          else
            begin
              reg16 <= wire14[(1'h1):(1'h1)];
              reg17 <= (+((((wire11 > wire9) ?
                      (wire12 ? (8'hbc) : reg15) : wire11[(1'h1):(1'h1)]) ?
                  wire14 : (wire9 ?
                      $unsigned((8'hbf)) : {wire13, reg16})) - (8'hb4)));
            end
          reg18 <= wire9[(3'h5):(3'h5)];
          reg19 <= (^$unsigned((+{(!reg16), $unsigned(wire9)})));
        end
      else
        begin
          reg15 <= $unsigned(((reg16 ?
                  wire10[(4'h8):(3'h7)] : wire10[(4'hb):(4'ha)]) ?
              {reg19, (!$unsigned(wire13))} : (+(&$signed((8'ha9))))));
          reg16 <= {((~&wire11) ?
                  (((+wire14) & reg18[(2'h2):(1'h1)]) ?
                      ((~^reg15) ?
                          $signed(wire10) : {reg17,
                              reg19}) : {reg15}) : $unsigned($unsigned(reg15)))};
          if (wire14)
            begin
              reg17 <= {wire14};
              reg18 <= ((8'hb8) ?
                  ((|(reg17[(2'h3):(1'h0)] >>> (reg19 >= reg16))) || (~&reg15[(2'h2):(2'h2)])) : $unsigned(($signed((^wire13)) ?
                      ((wire12 & reg17) >> (|(7'h42))) : wire13)));
              reg19 <= ($signed($signed(wire11[(3'h4):(2'h2)])) ?
                  wire14 : wire10);
              reg20 <= $unsigned((+wire13));
            end
          else
            begin
              reg17 <= reg16;
              reg18 <= $unsigned($unsigned($unsigned($unsigned((reg18 ?
                  reg15 : reg18)))));
              reg19 <= (8'ha3);
            end
          reg21 <= wire11;
        end
    end
  always
    @(posedge clk) begin
      reg22 <= $unsigned((8'hb2));
      reg23 <= reg22;
    end
  assign wire24 = $signed(reg16[(1'h0):(1'h0)]);
  assign wire25 = (wire10 ?
                      (wire14[(4'he):(3'h7)] ?
                          {(((8'ha3) >= reg19) | $signed(reg15))} : {{reg15,
                                  $unsigned(reg23)},
                              ({reg22,
                                  reg17} == reg23)}) : $signed((|(~&$unsigned(reg16)))));
  assign wire26 = wire12[(4'hd):(4'h9)];
  always
    @(posedge clk) begin
      reg27 <= {{((reg21[(1'h1):(1'h1)] >= (^(8'hb9))) ?
                  $unsigned($signed(reg17)) : ($signed(reg22) ?
                      (wire11 ? wire13 : wire26) : {reg19, wire25}))}};
      reg28 <= reg19;
      if ((reg18[(3'h5):(2'h3)] ? wire25 : wire24[(3'h4):(2'h3)]))
        begin
          reg29 <= ((&(8'hb4)) ^~ $signed(reg23));
          reg30 <= wire12[(1'h1):(1'h1)];
        end
      else
        begin
          reg29 <= (reg21[(1'h1):(1'h1)] ?
              {(~^$unsigned(wire14)), reg16} : reg18);
          reg30 <= $signed(wire11[(2'h3):(1'h1)]);
        end
      reg31 <= ((reg18[(3'h6):(2'h2)] < (8'hbb)) ? $unsigned((8'hb4)) : reg30);
    end
  assign wire32 = (~^wire25[(5'h10):(4'hd)]);
  assign wire33 = $unsigned((reg29[(1'h1):(1'h1)] ?
                      (($unsigned(reg19) ? (reg15 ? reg27 : wire24) : {reg18}) ?
                          ((wire24 ?
                              wire32 : wire10) + $signed(reg17)) : ($unsigned(reg20) ~^ (wire25 ?
                              wire10 : wire14))) : $unsigned(reg29)));
  module34 #() modinst50 (wire49, clk, reg27, reg23, reg28, reg29);
  assign wire51 = ($unsigned($signed(reg19[(2'h3):(2'h2)])) ?
                      (~|wire49) : (8'hb5));
  module52 #() modinst91 (.wire57(reg15), .clk(clk), .wire54(reg18), .wire55(wire13), .y(wire90), .wire53(reg28), .wire56(wire24));
  always
    @(posedge clk) begin
      reg92 <= $signed($signed(reg21[(3'h4):(2'h3)]));
    end
endmodule

module module52
#(parameter param88 = ({{(((7'h41) + (8'hb8)) ? {(8'h9c), (8'ha5)} : ((8'h9e) ? (8'hb9) : (8'ha3)))}, ((((8'hae) ? (8'ha6) : (8'hb1)) & (~^(8'hb9))) ? (((8'ha7) ? (8'h9c) : (8'ha6)) ? (~^(8'hb8)) : {(8'haf), (8'hbb)}) : ((8'ha0) * ((8'hbd) - (8'hb8))))} + ((~(+((7'h44) * (8'hb3)))) || {(((8'hbe) ? (8'ha2) : (8'hb2)) ? {(8'hac)} : {(8'hb2), (8'h9f)}), (~^((7'h43) != (7'h40)))})), 
parameter param89 = param88)
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire57;
  input wire [(2'h2):(1'h0)] wire56;
  input wire signed [(2'h3):(1'h0)] wire55;
  input wire signed [(2'h3):(1'h0)] wire54;
  input wire [(4'ha):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire59,
                 wire58,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg61,
                 (1'h0)};
  assign wire58 = ($signed((!wire55[(1'h1):(1'h0)])) ?
                      (wire55[(2'h3):(1'h0)] >> wire56) : $unsigned((8'hae)));
  assign wire59 = wire53;
  assign wire60 = (8'ha7);
  always
    @(posedge clk) begin
      reg61 <= ({$signed($signed(wire56[(1'h1):(1'h1)])),
          ($unsigned((wire56 < (8'hae))) ?
              ((!wire53) ?
                  $signed(wire55) : (wire54 ? (8'hab) : wire56)) : ((&wire58) ?
                  (wire60 ? wire53 : wire59) : ((8'hb9) ?
                      wire55 : wire56)))} < wire56);
    end
  assign wire62 = wire59;
  assign wire63 = $signed($unsigned($unsigned((wire54[(2'h3):(2'h2)] ?
                      (wire55 + wire53) : reg61[(2'h3):(2'h2)]))));
  assign wire64 = wire59[(3'h4):(1'h0)];
  assign wire65 = reg61[(1'h1):(1'h0)];
  assign wire66 = (!((wire63[(3'h5):(3'h5)] ?
                          wire55 : ({wire63} ? (+wire56) : (~^wire54))) ?
                      $unsigned((~&reg61)) : ({$signed(wire56),
                          (wire63 ? wire53 : wire54)} * wire55)));
  assign wire67 = {wire65[(5'h13):(1'h1)],
                      ($unsigned($unsigned(reg61[(1'h0):(1'h0)])) ?
                          (((~^wire65) >>> $unsigned(wire60)) ?
                              (wire64[(2'h3):(1'h0)] ?
                                  wire59 : wire66) : ($signed(wire54) ?
                                  (!wire62) : reg61)) : $unsigned($unsigned((wire62 >= (8'ha7)))))};
  assign wire68 = wire58;
  assign wire69 = (!((wire63[(3'h4):(1'h0)] >> wire59) ?
                      $signed($signed((wire67 && wire65))) : (wire68[(3'h6):(1'h0)] ?
                          (~^(wire54 ~^ wire58)) : ((wire55 > wire62) <= wire65[(5'h12):(5'h12)]))));
  assign wire70 = $signed(wire62);
  assign wire71 = wire69;
  assign wire72 = $unsigned((($signed(wire69[(3'h5):(3'h4)]) ?
                          $signed((wire55 < wire66)) : (~|$signed(wire57))) ?
                      reg61 : ({(^wire68)} <<< (wire70[(4'he):(4'hd)] ?
                          wire54 : (wire66 < wire60)))));
  assign wire73 = ({wire58[(3'h6):(3'h4)]} ?
                      wire67 : (((wire55[(1'h0):(1'h0)] ?
                              $signed((8'hb8)) : (wire54 ?
                                  wire53 : (8'h9d))) < ($unsigned(wire54) ?
                              $unsigned(reg61) : {wire60, wire66})) ?
                          $unsigned(wire69[(4'h9):(3'h7)]) : wire53[(3'h7):(2'h3)]));
  assign wire74 = ((~|$unsigned((~^wire63))) ? wire70 : wire72);
  assign wire75 = $unsigned(wire68[(4'hc):(2'h2)]);
  assign wire76 = ((wire73 ?
                      ($unsigned($signed(wire67)) ?
                          ($signed(wire75) ?
                              (wire54 & wire66) : (wire55 <<< wire59)) : ({wire56} & $unsigned(wire60))) : wire65[(4'hc):(4'hb)]) < $unsigned(wire56[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg77 <= (^$signed(($signed(wire66[(1'h0):(1'h0)]) ?
          $signed($unsigned(wire75)) : {$unsigned(wire74)})));
      if ($unsigned(($signed(((~&wire58) ? (8'hbd) : (~|wire58))) ?
          $signed($unsigned($unsigned(wire67))) : {((wire72 ? wire54 : wire59) ?
                  $unsigned(wire59) : {wire73})})))
        begin
          reg78 <= (!(~$unsigned($signed({(8'ha3), wire58}))));
        end
      else
        begin
          reg78 <= wire75[(3'h7):(1'h0)];
        end
      if ((!($signed((+$signed(wire54))) << wire62)))
        begin
          reg79 <= {((wire58[(1'h0):(1'h0)] ?
                  wire57[(2'h2):(2'h2)] : ((wire67 ? wire75 : wire65) ?
                      (^wire57) : $unsigned(reg61))) ^~ ($unsigned({reg78,
                      wire64}) ?
                  ((wire69 - wire57) ^~ (wire68 * wire62)) : $unsigned(wire54[(2'h2):(2'h2)])))};
          reg80 <= $unsigned(reg77);
        end
      else
        begin
          reg79 <= $signed(($unsigned($unsigned((~^wire55))) ?
              ((-((8'hbc) > wire64)) + wire72[(2'h2):(1'h0)]) : reg78[(2'h2):(1'h1)]));
          reg80 <= wire74;
          reg81 <= $unsigned($signed((^~(-(wire55 && wire53)))));
          reg82 <= wire72[(2'h3):(2'h2)];
          reg83 <= (+(~|(($unsigned(wire72) - ((8'ha6) <<< reg78)) ?
              reg81[(1'h1):(1'h1)] : wire75)));
        end
      reg84 <= ((!(!(((8'hb4) ? reg79 : wire73) ?
          reg80[(3'h6):(2'h2)] : (!reg79)))) != wire73[(3'h5):(3'h4)]);
    end
  assign wire85 = ({($signed((reg77 ? wire73 : wire76)) ?
                              ({(8'hb9)} ?
                                  (wire69 & wire62) : (^wire64)) : $unsigned(((8'hb3) ?
                                  reg61 : wire71)))} ?
                      (-(((reg79 != wire74) + wire62[(3'h7):(3'h5)]) ?
                          $unsigned((+wire70)) : ($unsigned(wire67) ?
                              ((8'hba) << wire53) : $signed((8'hba))))) : $unsigned(($unsigned($unsigned(wire63)) >= wire62[(2'h3):(1'h1)])));
  assign wire86 = (~wire57);
  assign wire87 = (wire60[(3'h6):(2'h3)] >>> ($unsigned(((~&wire58) < ((8'hb6) + wire63))) >>> wire74));
endmodule

module module34
#(parameter param48 = ((((((8'hb5) + (7'h40)) ^ {(8'hb7), (8'hb2)}) ? ((+(8'hb6)) ? {(8'hb5), (8'hb5)} : ((8'hbe) ? (8'hb6) : (7'h44))) : (-((8'hba) ? (8'hba) : (8'hba)))) ? (8'hab) : (^{{(8'hba), (8'ha7)}})) > {(-(8'hb3)), {({(8'ha5), (8'hbe)} * (8'hba)), {(-(7'h44)), ((8'hb0) & (8'ha0))}}}))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire38;
  input wire signed [(4'hd):(1'h0)] wire37;
  input wire signed [(3'h4):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire39;
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire39,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire39 = $unsigned({{$signed(wire37)},
                      {(((8'hbf) ? wire38 : wire35) + $signed(wire37))}});
  always
    @(posedge clk) begin
      reg40 <= ((!($signed($unsigned((7'h40))) ? (8'hbc) : $unsigned(wire38))) ?
          $signed($signed(wire37[(1'h0):(1'h0)])) : (~&{((wire37 <= wire35) + wire37),
              (+(wire35 ? wire35 : wire36))}));
      reg41 <= ((($signed((7'h42)) >>> (~^$unsigned(wire37))) * $signed($unsigned(wire35))) ?
          wire38[(3'h7):(3'h4)] : {(~((wire37 ? wire37 : (8'hbe)) ?
                  reg40 : ((8'hbc) ? wire37 : wire36)))});
    end
  assign wire42 = $unsigned((reg41[(4'h8):(2'h3)] ?
                      wire35 : ($unsigned((wire39 <<< wire37)) - wire37[(4'hc):(3'h4)])));
  assign wire43 = $signed(((!wire37[(3'h6):(1'h0)]) || wire37[(4'hb):(2'h2)]));
  assign wire44 = (^~((~|reg40) ? (-wire37[(3'h6):(1'h1)]) : reg41));
  assign wire45 = ((^~wire38) != (|reg41[(2'h2):(2'h2)]));
  assign wire46 = $unsigned((wire38[(4'hb):(3'h5)] >= (!{$signed(reg41),
                      {wire39}})));
  assign wire47 = wire45;
endmodule
