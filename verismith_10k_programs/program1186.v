module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire55;
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~^wire3[(4'h8):(1'h1)]);
    end
  module5 #() modinst56 (.clk(clk), .y(wire55), .wire9(reg4), .wire6(wire3), .wire7(wire0), .wire10(wire2), .wire8(wire1));
  assign wire57 = {$signed(wire55)};
  assign wire58 = $unsigned($signed($signed($signed($signed(wire3)))));
  assign wire59 = ($signed($unsigned(({wire58, wire1} ?
                          $signed((8'hbc)) : (reg4 * wire57)))) ?
                      wire58 : $signed($signed(wire0)));
  assign wire60 = $unsigned((($signed(reg4[(4'hf):(4'hb)]) < ((&reg4) ^~ $signed(wire3))) ?
                      (^~wire55[(1'h1):(1'h0)]) : $unsigned((!(&wire55)))));
  assign wire61 = {wire2[(4'hd):(4'hc)]};
  assign wire62 = wire57[(2'h2):(2'h2)];
  assign wire63 = ($signed(reg4) > $unsigned(((8'hb0) ?
                      ($unsigned(wire0) ?
                          (wire61 ?
                              wire60 : wire2) : $signed(reg4)) : ((wire57 != wire1) | (wire2 ?
                          wire1 : (8'hb5))))));
  assign wire64 = $unsigned(wire1[(4'h8):(1'h1)]);
  assign wire65 = {($signed(((wire58 ^~ wire2) && (~wire60))) == ((wire0 ?
                          (wire1 * (8'hab)) : $signed(wire63)) != (wire59 >> (8'hbd))))};
  assign wire66 = {wire57[(5'h11):(3'h6)], wire58[(3'h4):(2'h3)]};
endmodule

module module5
#(parameter param54 = ((((((8'hb2) != (8'ha1)) == ((7'h43) + (8'haf))) ? (!(+(8'ha8))) : {((8'hba) != (8'ha5)), {(8'hab)}}) + ((+((8'ha5) || (8'hbd))) ? ({(8'haf), (8'ha7)} ? {(8'ha0), (8'hb1)} : (!(8'hab))) : (~^((8'hb1) + (8'hac))))) ? (^(~|(~|(!(8'ha9))))) : (((((8'ha3) ? (8'had) : (8'hb0)) >>> (8'hb8)) ? (+((7'h44) ~^ (8'hbd))) : ({(8'hab), (8'ha1)} ? (~(7'h44)) : ((7'h44) != (7'h42)))) > (({(8'hb4)} >>> (-(8'hbb))) < (((8'ha9) ? (8'hba) : (8'ha0)) ~^ {(8'ha0)})))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  assign y = {wire53, wire51, wire13, wire12, wire11, (1'h0)};
  assign wire11 = ($unsigned(wire10) ? (8'ha5) : wire8[(1'h1):(1'h1)]);
  assign wire12 = ((|(wire6 + ((wire8 ? wire9 : wire8) ?
                          $unsigned(wire10) : (-wire7)))) ?
                      (&$signed((8'hbd))) : (~|(wire7 >= wire9)));
  assign wire13 = wire11[(3'h4):(3'h4)];
  module14 #() modinst52 (.clk(clk), .wire17(wire12), .wire16(wire11), .wire18(wire13), .y(wire51), .wire15(wire6));
  assign wire53 = ({$unsigned($unsigned((wire9 < wire51)))} | wire10[(2'h2):(1'h1)]);
endmodule

module module14
#(parameter param50 = {({{{(8'h9e), (7'h42)}}} ^~ {(-(&(8'hab)))})})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire [(4'h9):(1'h0)] wire17;
  input wire [(5'h10):(1'h0)] wire16;
  input wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire19;
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire19,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire19 = ({$unsigned(wire18),
                      (~wire18[(4'hc):(4'h9)])} < $unsigned($signed($unsigned($signed(wire15)))));
  always
    @(posedge clk) begin
      reg20 <= ({$signed($signed($signed(wire16)))} + {$unsigned((-{wire15}))});
    end
  always
    @(posedge clk) begin
      reg21 <= (~^wire19);
      reg22 <= {(reg20 ~^ ((reg20 ^ (|reg20)) ?
              (~^$signed(wire15)) : ({wire15} <<< wire18[(5'h11):(3'h4)])))};
      reg23 <= wire19[(1'h1):(1'h1)];
      if ($unsigned(((($unsigned((8'h9e)) | $signed(reg20)) ?
          reg21[(4'h9):(2'h3)] : $unsigned(reg23)) <<< ($unsigned(reg20) << {reg22[(2'h2):(2'h2)],
          $signed(wire17)}))))
        begin
          reg24 <= (wire16[(4'h9):(2'h3)] + $unsigned($unsigned(wire16[(4'h9):(3'h5)])));
        end
      else
        begin
          reg24 <= reg20[(2'h3):(2'h3)];
        end
      reg25 <= $signed($unsigned((+wire19)));
    end
  assign wire26 = (8'ha4);
  assign wire27 = (reg25[(4'hb):(3'h5)] + $unsigned(wire16));
  assign wire28 = $signed($unsigned($signed($signed({wire19}))));
  assign wire29 = $unsigned($signed((|reg24)));
  assign wire30 = (reg21[(3'h6):(2'h3)] - $signed(reg20[(4'ha):(3'h5)]));
  assign wire31 = (wire16 & (wire17 ? wire28 : wire18[(3'h4):(2'h2)]));
  assign wire32 = {wire30[(5'h10):(4'hf)],
                      $unsigned((~&(~((8'h9e) ? wire30 : reg23))))};
  assign wire33 = ((+(+wire31[(5'h10):(4'hc)])) ?
                      (wire19 & $unsigned($signed((~wire18)))) : (8'hb4));
  assign wire34 = $unsigned((wire27 ?
                      (wire19[(2'h2):(1'h1)] >> $unsigned((reg20 & wire29))) : ($signed(wire30[(2'h3):(2'h3)]) << reg25)));
  assign wire35 = ((7'h43) ? wire26 : wire16[(4'he):(1'h1)]);
  assign wire36 = $unsigned((($signed($signed(reg24)) ?
                          ($unsigned(wire18) || (wire18 ?
                              wire33 : wire17)) : $unsigned($unsigned(reg21))) ?
                      ({(wire16 ? wire19 : reg24)} + (reg22 ?
                          wire33[(2'h3):(2'h2)] : (~|reg22))) : (~|((8'h9d) == (^~wire19)))));
  assign wire37 = {wire36, wire31[(5'h11):(3'h4)]};
  assign wire38 = reg25;
  assign wire39 = {(~wire15)};
  assign wire40 = (-wire38);
  always
    @(posedge clk) begin
      reg41 <= (!wire19);
      if ($unsigned((8'hba)))
        begin
          if ($unsigned($unsigned((wire31 ?
              $signed(wire17) : ($signed(reg41) ?
                  wire35[(5'h12):(4'he)] : (wire29 - wire19))))))
            begin
              reg42 <= (wire36[(4'hb):(3'h5)] ?
                  $signed(reg23) : $unsigned((wire38[(3'h5):(1'h1)] ?
                      ((wire19 <= wire36) ?
                          wire38[(3'h6):(1'h1)] : $signed(wire17)) : {wire34[(1'h1):(1'h1)]})));
            end
          else
            begin
              reg42 <= $unsigned((((!$signed(wire15)) && $unsigned(wire36)) ~^ {((^~(8'ha9)) || reg25[(4'h8):(3'h4)]),
                  reg42[(1'h0):(1'h0)]}));
              reg43 <= (reg41 - (($unsigned($signed((8'ha4))) + wire17) * wire19[(1'h0):(1'h0)]));
            end
          reg44 <= (wire33[(2'h3):(2'h2)] >= wire30[(4'ha):(3'h6)]);
        end
      else
        begin
          reg42 <= $signed($unsigned((reg42[(2'h2):(1'h0)] ?
              (reg22[(1'h0):(1'h0)] ?
                  {wire39,
                      wire33} : reg42[(1'h1):(1'h0)]) : $unsigned((|wire18)))));
          reg43 <= $signed(((wire30[(4'ha):(4'ha)] & $signed($unsigned(reg20))) || $signed(($signed(wire32) ?
              {wire29} : reg44))));
          reg44 <= reg20[(3'h4):(3'h4)];
        end
      reg45 <= ($signed(((reg24[(3'h5):(2'h3)] ?
          $unsigned((7'h44)) : (^~wire38)) == (((8'h9e) || reg24) ?
          $signed(reg20) : (&wire38)))) >= $unsigned(((wire19 || wire32) ?
          wire19 : wire16)));
      reg46 <= (($unsigned((reg21[(2'h2):(1'h0)] < wire29)) ?
              $unsigned((^~$unsigned(reg41))) : wire26[(1'h0):(1'h0)]) ?
          $signed((wire28[(4'h9):(4'h8)] + $unsigned(reg42[(2'h3):(2'h3)]))) : wire33[(3'h4):(1'h0)]);
      reg47 <= $unsigned(($unsigned(($signed(reg25) <<< $unsigned(wire36))) ^~ wire27));
    end
  assign wire48 = wire32;
  assign wire49 = wire16[(4'hd):(3'h5)];
endmodule
