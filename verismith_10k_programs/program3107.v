module top
#(parameter param59 = (((8'ha7) ? (^~(^~{(8'ha1)})) : (({(8'ha2), (8'hbc)} ? (~^(8'hae)) : ((8'haf) ? (8'ha3) : (8'h9e))) ? (((8'h9e) * (8'ha2)) << ((8'haa) < (8'h9c))) : {((8'ha1) ? (8'ha4) : (8'hb7)), {(8'ha3), (8'h9f)}})) ? (!((!((8'hac) ? (8'hab) : (8'hac))) ? {(~&(7'h40))} : (((8'hba) ~^ (8'hbf)) - ((8'hb0) + (8'hbf))))) : (~&(8'hbd))), 
parameter param60 = ({((param59 ? (param59 ? param59 : param59) : (+param59)) ? (&param59) : (~|(param59 ^ param59)))} <= (8'ha8)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire41;
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  module5 #() modinst42 (wire41, clk, wire1, wire2, wire3, wire0, wire4);
  assign wire43 = $signed(($signed($unsigned((wire41 ?
                      wire0 : wire4))) || (!({(8'ha4),
                      wire3} ^~ $unsigned(wire3)))));
  assign wire44 = $signed(wire1[(3'h6):(3'h4)]);
  assign wire45 = ((^$unsigned(((^~wire3) - (8'hb4)))) + $unsigned(wire3[(4'h8):(2'h3)]));
  assign wire46 = wire3[(3'h4):(1'h1)];
  assign wire47 = {(!{$unsigned((wire0 ? wire46 : wire2)),
                          $signed((wire44 * wire41))})};
  assign wire48 = wire2;
  assign wire49 = (&wire43[(1'h0):(1'h0)]);
  assign wire50 = wire48[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      if ((&(+((wire44[(2'h2):(1'h0)] < {wire2,
          wire49}) <<< wire41[(4'h8):(4'h8)]))))
        begin
          if ($unsigned(({($signed(wire1) ~^ (wire41 & (8'hb9)))} ?
              (wire47[(3'h4):(1'h1)] ~^ wire45) : $unsigned(((wire49 ?
                      (8'hb5) : (8'hba)) ?
                  $signed(wire47) : $unsigned(wire3))))))
            begin
              reg51 <= $signed($signed(wire47));
              reg52 <= $signed(wire3);
              reg53 <= $signed($signed(wire1[(2'h2):(1'h0)]));
              reg54 <= $unsigned(wire44[(4'hc):(1'h0)]);
              reg55 <= ((~&$unsigned(((wire47 ? (8'ha0) : wire3) - (wire0 ?
                  wire45 : reg54)))) | $signed({(~^(wire3 <= reg51))}));
            end
          else
            begin
              reg51 <= (!$signed(wire3[(4'h8):(4'h8)]));
              reg52 <= wire3[(2'h3):(2'h3)];
            end
          reg56 <= $unsigned(wire3[(3'h5):(1'h1)]);
        end
      else
        begin
          reg51 <= ($unsigned({(^(!(8'hba))),
              $signed($signed(wire2))}) >> reg52);
        end
      reg57 <= $unsigned(((!$unsigned($signed((7'h42)))) ?
          {reg52,
              (wire45 ?
                  reg54[(4'hf):(3'h7)] : wire4[(4'h8):(1'h1)])} : wire4[(2'h2):(1'h0)]));
      reg58 <= (reg55 & {{({reg54, wire0} == (~|wire47)),
              $unsigned($signed(wire49))}});
    end
endmodule

module module5
#(parameter param39 = ((((^~((8'hab) >= (8'h9c))) & (&((8'ha6) * (8'hb2)))) ? (((~|(8'hbe)) || {(8'hbe), (7'h42)}) ? (!{(8'haf), (8'ha9)}) : (|(8'hb5))) : (((~^(8'hb0)) ? ((8'had) ? (8'ha4) : (7'h41)) : (&(8'hb8))) ? (((8'ha4) | (8'had)) ^~ ((8'ha3) ? (8'had) : (8'hba))) : (^~(8'ha2)))) ? ((~^(((8'haa) ^ (8'hb0)) ? {(8'hbc)} : (&(8'h9c)))) >>> (!(8'hb3))) : ({(~|(8'hbb)), {(^(8'hb2)), (^(8'h9c))}} ? (((~(8'hb9)) ? ((7'h40) ? (8'hbe) : (8'ha9)) : {(8'hb5)}) ? ((7'h44) ? ((8'hb0) & (8'hbf)) : ((8'hbe) == (7'h44))) : (!{(8'hb1), (8'ha6)})) : ({{(8'ha5), (8'hb9)}, ((8'had) > (8'haf))} ? {(~|(8'ha7)), ((8'hab) * (7'h42))} : {((8'hb3) ? (8'hba) : (8'hb0)), (^~(8'hb6))}))), 
parameter param40 = (((8'ha2) ? ((&param39) + (~(param39 ? param39 : param39))) : (+((^~(8'ha6)) ? param39 : (param39 ? (8'ha4) : param39)))) | ({(+(param39 ? param39 : param39))} < ((^(param39 || param39)) | ((^~(7'h43)) ~^ (param39 ? param39 : param39))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire signed [(3'h5):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire35;
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire20,
                 wire21,
                 wire35,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire11 = $unsigned(wire8[(2'h2):(1'h0)]);
  assign wire12 = $unsigned($unsigned(($signed((wire10 ? (8'hb2) : wire9)) ?
                      ({wire11} >= $unsigned(wire8)) : $signed((wire7 > wire8)))));
  assign wire13 = (+(wire12[(3'h7):(3'h4)] ?
                      $signed(($signed(wire6) & (wire7 ?
                          wire6 : wire10))) : wire9[(4'h8):(3'h5)]));
  assign wire14 = ({wire13} ? wire9 : $unsigned((&($signed(wire9) <= wire8))));
  assign wire15 = $unsigned($unsigned((8'hac)));
  always
    @(posedge clk) begin
      reg16 <= $unsigned(wire12[(4'h8):(1'h1)]);
      reg17 <= wire14[(3'h6):(3'h4)];
      reg18 <= ($unsigned($signed(wire6)) ?
          {$unsigned((-wire11[(3'h5):(3'h5)]))} : reg17[(2'h3):(2'h2)]);
      reg19 <= (reg18 ?
          $unsigned($unsigned({reg16[(4'h8):(3'h5)]})) : $signed($unsigned($signed((reg18 == wire6)))));
    end
  assign wire20 = wire14[(3'h6):(3'h6)];
  assign wire21 = ((reg19[(3'h5):(2'h3)] - (!(^(~^wire11)))) ?
                      $signed($unsigned($signed(((8'hb7) ?
                          wire15 : wire10)))) : wire9);
  module22 #() modinst36 (.wire24(wire7), .wire26(wire10), .wire27(wire20), .wire25(wire15), .clk(clk), .wire23(wire8), .y(wire35));
  assign wire37 = $signed(($signed($signed((wire15 + wire10))) ?
                      (((&wire7) & $signed(wire20)) > wire7) : (~^$signed((8'hb4)))));
  assign wire38 = reg17;
endmodule

module module22
#(parameter param34 = ((((+((7'h41) > (7'h41))) == ((|(8'hac)) == {(8'ha8)})) - (((&(8'ha7)) & ((8'haf) & (8'ha3))) >> (((8'haf) ? (8'had) : (7'h43)) - {(8'ha9)}))) ? ((~({(7'h41), (8'haf)} ? {(8'hab)} : ((8'ha4) & (8'hab)))) ? (~&(((8'hb3) ? (8'hbc) : (8'had)) ? ((8'ha6) ? (7'h44) : (8'hbc)) : (+(8'hbf)))) : {((~(8'hb5)) ~^ ((8'hb2) ? (8'haa) : (8'hb4)))}) : ((&(+((8'hb6) ? (7'h42) : (8'hbe)))) ? ((^~(^(7'h43))) >>> (~|((8'ha1) ? (8'ha9) : (8'hbe)))) : ((((8'hb0) >> (7'h41)) & ((8'h9c) ? (8'haf) : (8'ha8))) ? {{(8'hb5)}, ((7'h44) ? (7'h43) : (8'hbe))} : (((8'h9f) & (8'haa)) * {(8'haa), (8'hac)})))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire27;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire signed [(2'h2):(1'h0)] wire24;
  input wire signed [(5'h10):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  assign y = {wire33, wire32, wire31, wire30, wire29, wire28, (1'h0)};
  assign wire28 = ($unsigned($signed(((~&wire25) ?
                          (wire24 >> wire24) : (-wire25)))) ?
                      wire23 : wire23);
  assign wire29 = $unsigned(($unsigned((8'ha9)) != ($signed((~|(8'ha2))) >> (~|(wire28 >>> (8'had))))));
  assign wire30 = wire28[(2'h2):(2'h2)];
  assign wire31 = $signed(({$signed(wire26[(2'h2):(1'h0)])} >> wire29));
  assign wire32 = wire25;
  assign wire33 = $signed(((($signed(wire23) & {wire24}) * (^~$unsigned(wire23))) ?
                      (8'hb4) : $signed((^$signed(wire24)))));
endmodule
