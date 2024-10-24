module top
#(parameter param58 = (-{(8'had)}), 
parameter param59 = ((((param58 ? (param58 > param58) : param58) + param58) ^~ ((param58 ^ (param58 ? (8'ha5) : param58)) ? (+param58) : (param58 ? (param58 ? param58 : param58) : {(8'hbf)}))) ^~ ((param58 ? ((!param58) >>> {param58}) : ((param58 ? param58 : param58) - {param58, param58})) ? (~|(~&(param58 ? param58 : param58))) : (&param58))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  assign y = {wire56, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {$unsigned(wire1), {$signed($signed((wire4 > wire3))), wire0}};
  assign wire6 = wire5;
  assign wire7 = ((wire5[(4'hc):(1'h0)] ?
                     wire0[(2'h3):(2'h3)] : wire0) >= ((~(wire6[(1'h0):(1'h0)] & wire2[(1'h1):(1'h0)])) >= $unsigned({(wire6 ?
                         wire1 : wire2),
                     $signed(wire0)})));
  module8 #() modinst57 (wire56, clk, wire2, wire5, wire4, wire3);
endmodule

module module8
#(parameter param54 = (((((+(8'hae)) ? (~|(8'hbc)) : ((8'haf) * (7'h43))) ? ((^~(8'hb2)) <<< ((8'ha8) ? (8'hbb) : (8'hb1))) : (~&((8'ha4) - (8'ha8)))) ? ((((8'hb1) <<< (8'ha7)) ? ((8'ha1) ? (8'hb8) : (7'h41)) : (8'haf)) >> (~|(^~(8'hba)))) : ((((7'h44) + (8'ha1)) ^~ ((8'ha7) ? (8'ha7) : (7'h42))) << {(~^(7'h40))})) > (((((8'hbf) ? (8'ha9) : (8'hb5)) || (^~(8'ha8))) ? (((8'h9f) ? (8'haa) : (8'ha4)) ^~ ((8'hab) | (8'hb6))) : (~|(7'h41))) ? ((((8'ha3) ? (7'h42) : (8'h9d)) ~^ {(7'h40), (8'ha8)}) ? (8'ha1) : (((8'hb9) ? (8'ha9) : (8'hb6)) >= (8'hb4))) : ({((8'ha5) > (7'h43)), ((8'hb2) ? (8'ha1) : (8'haa))} ? (|((8'ha3) ? (7'h44) : (8'hba))) : (((8'hb2) <= (8'hae)) ? {(8'ha9), (7'h41)} : ((8'hb9) && (8'ha8)))))), 
parameter param55 = param54)
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire48;
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire50,
                 wire13,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire48,
                 reg51,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire13 = ((-$signed(wire9[(3'h7):(1'h0)])) ?
                      ((($signed(wire11) ? wire10 : $unsigned(wire12)) ?
                              $signed((+wire12)) : {(wire9 ?
                                      wire12 : wire10)}) ?
                          $unsigned(((wire12 ? wire11 : wire9) ?
                              (|wire10) : (wire9 + wire12))) : (wire11[(3'h6):(2'h3)] ?
                              wire12 : (8'hbb))) : (8'ha4));
  always
    @(posedge clk) begin
      reg14 <= (8'hac);
      reg15 <= wire11[(5'h14):(2'h3)];
    end
  assign wire16 = ((reg15[(1'h0):(1'h0)] ?
                          (reg15 <= {(wire9 && reg15)}) : $unsigned((-(-wire11)))) ?
                      wire13 : reg15);
  assign wire17 = (|wire12[(4'hc):(3'h7)]);
  assign wire18 = ($unsigned((~|(^reg14[(4'h9):(3'h4)]))) ?
                      (|$signed((7'h44))) : $signed((~&reg14[(1'h0):(1'h0)])));
  assign wire19 = {(~&$signed(reg14[(3'h4):(2'h3)]))};
  assign wire20 = $unsigned((-(wire18 ^~ wire17[(3'h4):(1'h0)])));
  assign wire21 = ($unsigned(($unsigned($unsigned(wire12)) <<< wire10[(1'h1):(1'h0)])) ?
                      ((8'hba) + (($signed((8'hae)) < $unsigned(wire16)) ?
                          wire19 : $unsigned((&wire20)))) : wire12);
  assign wire22 = $unsigned((~&{$signed((reg15 ? (8'ha3) : wire21)),
                      (wire9[(4'hf):(3'h6)] == $signed(wire19))}));
  assign wire23 = (8'hb3);
  assign wire24 = ($signed((((-wire21) ? reg14 : (&wire22)) ?
                      {$unsigned(wire20)} : wire12[(4'h9):(3'h6)])) > wire20[(2'h2):(1'h1)]);
  assign wire25 = (&($unsigned((^(-reg14))) ?
                      (&wire18) : reg15[(3'h5):(1'h1)]));
  assign wire26 = wire17;
  assign wire27 = $signed(($signed($unsigned((8'hb4))) ?
                      wire12 : (~^(^~(wire10 | wire13)))));
  assign wire28 = ({$signed(((wire19 ? wire16 : wire24) ? wire23 : (|wire26))),
                          $signed(wire25)} ?
                      (&($signed(wire12) ^~ {$signed(wire17)})) : ((|((+reg14) < wire19)) ^~ $unsigned($unsigned((~^reg15)))));
  module29 #() modinst49 (wire48, clk, wire19, wire28, wire9, wire22, wire17);
  assign wire50 = $unsigned((($signed($signed(wire9)) < wire18[(4'h8):(1'h0)]) >>> (({wire20} ^ $signed(wire13)) ?
                      $unsigned((+(7'h42))) : {((8'hb4) ? wire21 : wire11)})));
  always
    @(posedge clk) begin
      reg51 <= wire24;
    end
  assign wire52 = ($unsigned(wire18) ?
                      {$signed($signed(wire27[(4'h9):(4'h8)]))} : {(+$signed((8'hac)))});
  assign wire53 = $signed((((8'hb0) - wire24[(4'hb):(4'h9)]) << reg15[(1'h0):(1'h0)]));
endmodule

module module29
#(parameter param46 = (&((~(((8'hae) << (8'h9e)) ? ((8'hb4) + (8'hbd)) : ((8'ha0) ? (8'hae) : (8'ha7)))) ? ((~{(8'ha5)}) >> (8'ha9)) : (+{((8'h9f) ? (8'hb8) : (7'h43)), ((8'h9d) ? (8'hb8) : (8'ha0))}))), 
parameter param47 = (+((~|param46) ? param46 : (^param46))))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire34;
  input wire [(4'hf):(1'h0)] wire33;
  input wire signed [(3'h7):(1'h0)] wire32;
  input wire signed [(4'h9):(1'h0)] wire31;
  input wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 (1'h0)};
  assign wire35 = (~&($signed($signed(((8'hb3) ? wire31 : wire31))) ?
                      wire31[(4'h8):(2'h2)] : (^wire34)));
  assign wire36 = (wire35 ?
                      (($signed(((8'h9f) >>> (8'hb7))) && $signed(wire35[(1'h1):(1'h0)])) ?
                          wire33[(3'h7):(3'h4)] : wire35) : $signed((wire35 == $unsigned((wire32 + wire34)))));
  assign wire37 = wire35;
  assign wire38 = $unsigned({$signed(wire31)});
  assign wire39 = (!((!$signed(wire33)) || (wire36[(1'h0):(1'h0)] != $signed(wire35[(2'h3):(2'h3)]))));
  assign wire40 = wire33;
  assign wire41 = {($signed(wire31) ?
                          $signed((-((8'hb1) ?
                              wire37 : (8'ha6)))) : $unsigned($signed(wire40)))};
  assign wire42 = $signed((($unsigned($signed(wire37)) ?
                      $unsigned((wire36 >>> wire41)) : wire39) ~^ (wire36 << {(wire35 ~^ wire37)})));
  assign wire43 = (wire34[(4'hd):(4'hd)] ?
                      $unsigned((8'haa)) : ($signed((~wire39[(3'h6):(3'h5)])) - $signed($signed(wire33))));
  assign wire44 = {$signed((wire43 ? wire31 : wire43))};
  assign wire45 = wire35;
endmodule
