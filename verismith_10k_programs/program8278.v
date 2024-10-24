module top
#(parameter param58 = (+(&(({(8'ha0), (8'hb6)} ^~ (~(8'ha9))) ? {((8'hb0) + (8'haa)), (-(8'ha6))} : (+{(8'hbe), (8'ha8)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  assign y = {wire57,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire4,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire4 = $signed((wire0 * (wire0 ^ (|(wire2 ? wire0 : wire3)))));
  module5 #() modinst42 (.wire7(wire0), .wire6(wire1), .clk(clk), .wire9(wire3), .y(wire41), .wire8(wire4));
  assign wire43 = {(!(($signed((8'hbb)) ? (wire4 ? wire0 : wire4) : {wire41}) ?
                          (wire2[(3'h5):(1'h0)] ?
                              wire2 : $signed(wire3)) : wire41)),
                      $signed(wire3[(3'h5):(2'h3)])};
  assign wire44 = (wire2 ? wire3[(3'h6):(3'h6)] : (-wire0[(1'h0):(1'h0)]));
  assign wire45 = wire43[(4'hb):(2'h3)];
  always
    @(posedge clk) begin
      if ($signed((~^$signed((|((8'hb0) ? wire4 : wire4))))))
        begin
          reg46 <= wire0;
          reg47 <= ({wire0} ?
              wire1[(3'h4):(3'h4)] : $unsigned((wire1 - {wire0[(4'h9):(3'h7)],
                  (wire44 ? wire1 : wire4)})));
          reg48 <= wire45[(4'hc):(4'ha)];
          reg49 <= $signed($signed((wire1 ? (~^{(8'ha5), wire2}) : (8'ha3))));
        end
      else
        begin
          reg46 <= reg48[(4'h8):(3'h4)];
          if ((^~$signed(wire2)))
            begin
              reg47 <= $unsigned($unsigned($unsigned(((+wire2) | $unsigned(reg48)))));
              reg48 <= $signed((^wire3[(4'ha):(1'h1)]));
            end
          else
            begin
              reg47 <= ((&{$signed(((8'hae) ? (8'hb0) : reg47)),
                      {wire3[(3'h4):(2'h3)]}}) ?
                  {wire2[(2'h2):(1'h1)],
                      $unsigned((~&$unsigned(reg49)))} : wire2);
              reg48 <= $unsigned(reg47);
              reg49 <= ((7'h40) ?
                  $unsigned($signed(wire1[(2'h2):(1'h1)])) : $unsigned((^($unsigned(wire44) < reg47[(5'h11):(4'h8)]))));
              reg50 <= wire41;
            end
          reg51 <= wire0[(3'h7):(2'h3)];
          reg52 <= ((~^$signed((&$unsigned(wire41)))) <<< (~&$signed(wire41)));
        end
      if (($signed(({(reg52 >= wire44), (reg48 ? reg48 : wire1)} ?
              reg49 : (reg50[(4'h8):(1'h1)] >= (8'h9f)))) ?
          ((|$unsigned(((8'ha4) ? reg47 : reg52))) ?
              ({(wire2 ? wire1 : wire43)} ^ {{wire44, wire4},
                  (reg49 && wire4)}) : (~$signed($unsigned(reg48)))) : $unsigned((|wire44[(3'h4):(2'h2)]))))
        begin
          if ((&wire41))
            begin
              reg53 <= ((wire44 ?
                      ((&(wire43 | wire1)) ?
                          wire4 : reg51[(3'h4):(3'h4)]) : reg51) ?
                  (reg48[(4'hd):(3'h6)] ?
                      {$unsigned(reg48[(2'h3):(2'h2)]),
                          (reg46 <<< (8'hb8))} : ($signed({wire4}) ?
                          (-wire4[(2'h2):(1'h1)]) : (8'hb9))) : (8'ha6));
              reg54 <= (|(wire1 ?
                  (~wire3[(4'h8):(3'h4)]) : reg52[(2'h3):(2'h2)]));
              reg55 <= reg46;
              reg56 <= (|$signed($unsigned(reg49[(2'h3):(1'h0)])));
            end
          else
            begin
              reg53 <= {((^~($signed(wire4) ~^ reg53[(4'ha):(4'ha)])) != reg47)};
              reg54 <= reg54[(4'h9):(3'h4)];
            end
        end
      else
        begin
          reg53 <= (($signed((+wire2)) ?
              reg49 : $unsigned(((wire45 ^~ reg51) ?
                  $signed((8'ha0)) : reg55[(1'h1):(1'h1)]))) > {(($signed(wire41) ?
                      reg54[(3'h4):(2'h3)] : reg48) ?
                  (-(wire2 ? (8'ha6) : reg54)) : {$signed(reg51),
                      $unsigned(reg55)})});
          reg54 <= (wire4[(3'h6):(1'h1)] != $signed(reg56[(3'h5):(1'h1)]));
          reg55 <= $unsigned(reg55[(1'h0):(1'h0)]);
        end
    end
  assign wire57 = {$signed($unsigned((^~wire3[(4'ha):(4'ha)]))),
                      $unsigned((wire1[(2'h2):(1'h1)] ?
                          $unsigned($unsigned(reg55)) : ($unsigned(wire3) ~^ (wire1 ~^ wire41))))};
endmodule

module module5
#(parameter param39 = ((-((^((7'h41) ? (8'hae) : (8'had))) ? (((8'hac) + (8'ha3)) ~^ ((8'hac) * (7'h42))) : (((8'hb6) ? (7'h44) : (8'hb6)) != ((8'ha8) || (8'hb4))))) != (7'h43)), 
parameter param40 = (~^(~&param39)))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 (1'h0)};
  assign wire10 = (8'ha1);
  assign wire11 = ($signed((($unsigned(wire8) >= {(8'ha9),
                      wire10}) || $unsigned({(8'hbf),
                      wire8}))) && ($signed($unsigned((wire9 & wire9))) ^~ ({(wire7 ?
                          wire10 : (8'hb8))} * ((wire7 + wire9) ?
                      (wire10 + wire9) : wire10[(4'h8):(3'h7)]))));
  assign wire12 = (~^$signed((+$signed((8'h9c)))));
  assign wire13 = (~^(+$unsigned(wire11)));
  module14 #() modinst31 (wire30, clk, wire8, wire9, wire6, wire11);
  assign wire32 = $unsigned((8'hb5));
  assign wire33 = $signed(wire13[(3'h6):(3'h5)]);
  assign wire34 = (wire12 | wire30);
  assign wire35 = wire8;
  assign wire36 = (8'hb6);
  assign wire37 = $signed(wire9);
  assign wire38 = wire35;
endmodule

module module14
#(parameter param29 = {({(^~((8'hbc) <<< (8'hb8))), (|{(8'ha9), (8'ha8)})} ? ((((8'hb4) <<< (8'haf)) ? {(8'hb2)} : (-(8'ha1))) ? (((8'hb0) && (8'hb1)) << ((8'hb4) ? (8'hac) : (8'hb8))) : {((8'hbb) > (8'ha6)), ((8'ha8) ? (7'h42) : (8'ha8))}) : ((~((8'hb3) || (8'hab))) ^~ (((8'hb7) ? (8'ha0) : (8'ha5)) ? (!(8'hbb)) : (8'ha4)))), {(~|(~(~&(8'ha7)))), (~(!((8'hb9) == (8'hae))))}})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire18;
  input wire [(3'h7):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire21,
                 wire20,
                 wire19,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = (wire15 != (wire18 >= wire15));
  assign wire20 = ((((!wire17[(3'h7):(3'h6)]) != wire18[(1'h1):(1'h0)]) ?
                      ({$signed(wire15),
                          $signed(wire19)} >> ($unsigned(wire16) ?
                          $signed((8'h9d)) : (wire17 ?
                              wire15 : wire19))) : wire16[(4'ha):(4'h9)]) <= (!{$signed((wire16 ?
                          wire16 : wire16))}));
  assign wire21 = {{(($unsigned(wire17) ?
                                  (wire17 > wire17) : (wire15 << (8'ha3))) ?
                              (~^wire15) : ($unsigned((8'hbd)) ?
                                  (wire18 <<< wire19) : (8'hb6))),
                          wire18},
                      ($signed(((|(8'hb1)) > wire15)) | {(~|(wire18 ?
                              wire17 : wire16))})};
  always
    @(posedge clk) begin
      reg22 <= wire20;
    end
  always
    @(posedge clk) begin
      reg23 <= ((wire21[(4'ha):(4'ha)] >= wire19) - wire17[(3'h4):(1'h1)]);
      reg24 <= $unsigned(((-reg23) <<< (wire17 || ((|wire16) ?
          (+wire19) : (wire17 ? wire17 : wire17)))));
      reg25 <= $signed((($signed(wire16[(3'h5):(3'h4)]) <<< wire15) ?
          reg23 : {{(reg24 <= (8'hab)), wire15[(2'h3):(2'h3)]},
              ($signed(wire16) | $unsigned(wire17))}));
      reg26 <= $unsigned($unsigned(($signed($unsigned(reg22)) ?
          (+$unsigned(wire19)) : wire19)));
    end
  assign wire27 = $unsigned($unsigned($signed((~(reg26 <= (8'ha7))))));
  assign wire28 = wire18;
endmodule
