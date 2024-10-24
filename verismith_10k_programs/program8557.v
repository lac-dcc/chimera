module top
#(parameter param69 = (+(~((&(~^(8'hb3))) ? (8'hbc) : (^((8'hb0) ^~ (8'ha2)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire65;
  assign y = {wire68, wire67, wire5, wire33, wire35, wire36, wire65, (1'h0)};
  assign wire5 = {$signed($unsigned((8'h9c))), $signed((^{(wire4 == wire4)}))};
  module6 #() modinst34 (.wire7(wire5), .wire8(wire0), .clk(clk), .y(wire33), .wire10(wire3), .wire9(wire4));
  assign wire35 = {($signed((~^(wire1 ?
                          wire33 : (8'ha3)))) != ((~|wire1) * (|wire33)))};
  assign wire36 = $signed(((~wire3[(1'h0):(1'h0)]) == wire4));
  module37 #() modinst66 (wire65, clk, wire1, wire33, wire36, wire5, wire35);
  assign wire67 = wire3[(1'h1):(1'h0)];
  assign wire68 = (~|(^~$signed($unsigned(wire3[(2'h2):(1'h0)]))));
endmodule

module module37  (y, clk, wire38, wire39, wire40, wire41, wire42);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire38;
  input wire [(3'h5):(1'h0)] wire39;
  input wire signed [(5'h15):(1'h0)] wire40;
  input wire signed [(5'h15):(1'h0)] wire41;
  input wire [(2'h3):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire63;
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  assign y = {wire43,
                 wire44,
                 wire47,
                 wire48,
                 wire49,
                 wire63,
                 reg45,
                 reg46,
                 (1'h0)};
  assign wire43 = $signed($signed(wire38));
  assign wire44 = wire39;
  always
    @(posedge clk) begin
      reg45 <= (-$unsigned($unsigned($signed($unsigned(wire39)))));
      reg46 <= wire39;
    end
  assign wire47 = $unsigned((((wire41[(4'he):(1'h0)] ~^ {wire42}) | $unsigned((reg45 && (8'hb4)))) == {$signed((wire42 ?
                          reg46 : wire40))}));
  assign wire48 = wire39;
  assign wire49 = {(~|(((wire48 ? wire39 : wire47) ?
                          (wire48 != wire47) : (&wire44)) * wire39[(3'h4):(3'h4)]))};
  module50 #() modinst64 (wire63, clk, wire38, reg46, wire48, wire40);
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire11 = {{wire9[(1'h1):(1'h1)]}, wire10};
  assign wire12 = $unsigned((wire11[(1'h0):(1'h0)] ?
                      wire7[(1'h1):(1'h1)] : $signed(((8'ha8) ?
                          $signed(wire10) : (wire8 >>> (8'ha7))))));
  assign wire13 = $unsigned(({(^~((8'ha7) + wire10))} ?
                      (~&wire10) : ((8'h9e) ?
                          wire12[(3'h6):(3'h4)] : ($unsigned(wire9) >= $signed(wire7)))));
  assign wire14 = wire13;
  always
    @(posedge clk) begin
      reg15 <= wire8;
      reg16 <= reg15[(3'h7):(2'h2)];
      reg17 <= $signed((8'haf));
      if ((~(wire13[(2'h3):(2'h3)] ?
          $signed(((^~wire14) ?
              wire13 : $unsigned(wire7))) : $signed(wire13[(1'h0):(1'h0)]))))
        begin
          reg18 <= $unsigned((reg17 ?
              (^~reg15[(3'h5):(2'h3)]) : $signed((~|(8'hab)))));
          reg19 <= reg17[(1'h1):(1'h0)];
        end
      else
        begin
          reg18 <= $signed(wire11);
        end
    end
  assign wire20 = wire11[(1'h1):(1'h0)];
  assign wire21 = $unsigned(((((wire11 ? reg16 : (8'ha3)) && $unsigned(reg17)) ?
                      $signed($signed(wire11)) : wire10[(1'h0):(1'h0)]) && wire13));
  assign wire22 = ((8'ha5) ?
                      {(+((wire10 <<< wire11) != {reg16})),
                          reg16[(4'he):(4'ha)]} : $unsigned({($unsigned((8'hb0)) ?
                              $unsigned((8'had)) : (wire7 ^ wire7))}));
  assign wire23 = wire11[(2'h2):(2'h2)];
  assign wire24 = $unsigned($signed((({wire10} ? wire9 : $unsigned(reg17)) ?
                      $unsigned(reg18[(2'h2):(1'h0)]) : $unsigned(reg19[(4'hf):(2'h2)]))));
  assign wire25 = $signed(($unsigned($unsigned($signed(wire13))) | (wire24[(2'h2):(2'h2)] > (!$unsigned(reg17)))));
  assign wire26 = $signed($unsigned(wire13[(2'h2):(2'h2)]));
  assign wire27 = reg16;
  assign wire28 = ($unsigned(($unsigned(wire13) <<< {wire25[(3'h7):(2'h3)],
                          wire11})) ?
                      (~|((^~(8'hb8)) + $signed($unsigned(reg16)))) : (8'hb1));
  assign wire29 = $unsigned(($unsigned(reg18) | wire11[(1'h0):(1'h0)]));
  assign wire30 = (&reg16);
  assign wire31 = wire7;
  assign wire32 = ((8'ha5) | {((wire23[(1'h1):(1'h1)] ^ (~&wire20)) - {(7'h43)}),
                      ($signed({(8'hb8), wire8}) ?
                          $signed(wire14) : (wire30 + $signed(wire11)))});
endmodule

module module50
#(parameter param62 = ((8'hb2) ^ (({((8'ha3) ~^ (8'hb6))} && ((~|(7'h41)) ? ((8'h9d) ? (8'hae) : (8'hb1)) : ((8'ha1) < (8'hab)))) ? ((((8'haa) < (8'hb2)) ^~ ((8'ha0) * (8'hae))) << {((8'ha1) ? (8'hbd) : (8'haf))}) : (({(8'hbb)} ? (~^(8'hbd)) : ((7'h41) ^~ (8'ha1))) ? (8'hb6) : (~&(~(8'h9f)))))))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire54;
  input wire [(3'h6):(1'h0)] wire53;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire [(3'h4):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  assign y = {wire61, wire60, wire59, wire58, wire57, wire56, wire55, (1'h0)};
  assign wire55 = ($signed(wire54) && $signed($unsigned(wire54)));
  assign wire56 = $unsigned(((((wire53 + wire51) ?
                      $unsigned(wire51) : {wire51,
                          wire54}) - (wire53 + (~&wire53))) >>> (^~(~^wire52[(3'h7):(1'h1)]))));
  assign wire57 = wire53;
  assign wire58 = (~&({(wire52[(1'h1):(1'h1)] <<< ((8'ha0) - wire52))} - (($signed(wire55) <= {wire51}) ?
                      (^~(+wire52)) : $unsigned((wire56 ? wire56 : wire57)))));
  assign wire59 = wire58[(2'h2):(2'h2)];
  assign wire60 = (wire56[(2'h3):(1'h0)] ?
                      wire52[(1'h1):(1'h1)] : $unsigned(((wire56 ?
                          (wire55 ?
                              wire56 : wire51) : (wire56 | (8'h9d))) > $signed(wire55))));
  assign wire61 = $unsigned((((|(wire51 ^~ (8'ha0))) ?
                      (8'had) : wire55[(1'h1):(1'h0)]) | (+wire54)));
endmodule
