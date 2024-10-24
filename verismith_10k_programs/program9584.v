module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire61;
  assign y = {wire68, wire67, wire66, wire65, wire64, wire63, wire61, (1'h0)};
  module5 #() modinst62 (wire61, clk, wire0, wire4, wire2, wire1);
  assign wire63 = (+$unsigned(wire4[(4'hc):(3'h7)]));
  assign wire64 = ({(~|wire63[(4'hb):(4'h9)])} != (~^(wire1 < (8'haa))));
  assign wire65 = wire0[(2'h3):(1'h1)];
  assign wire66 = (~wire2);
  assign wire67 = (wire4[(1'h0):(1'h0)] ?
                      $unsigned(wire64[(4'h9):(2'h3)]) : $unsigned((&wire3)));
  assign wire68 = (^wire2[(1'h0):(1'h0)]);
endmodule

module module5
#(parameter param60 = (-((((|(8'hb9)) ? (!(8'h9c)) : ((8'ha4) ^ (7'h40))) * (((8'hac) ^~ (7'h44)) ? ((8'hab) <<< (8'ha9)) : {(8'hab)})) >= (&({(8'hba)} ~^ {(8'hb7), (8'ha0)})))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire48;
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire48,
                 reg59,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  module10 #() modinst49 (.wire12(wire9), .wire13(wire7), .wire14(wire6), .wire15(wire8), .y(wire48), .wire11((8'hb5)), .clk(clk));
  always
    @(posedge clk) begin
      reg50 <= (~&wire48);
      reg51 <= $signed(wire48);
      reg52 <= {(($unsigned((reg51 | (8'ha9))) & $unsigned({wire8})) * wire9)};
    end
  assign wire53 = {$signed($unsigned((^(-wire7)))),
                      {$signed({reg51, {(8'haa)}})}};
  assign wire54 = ($unsigned(((8'hb6) ?
                      wire48 : $unsigned($signed(wire8)))) && ((~&$signed(reg52)) | $signed(reg51[(4'h8):(3'h7)])));
  assign wire55 = {$signed((($unsigned(wire8) ?
                              (wire53 != wire8) : wire8[(3'h7):(3'h7)]) ?
                          (~^reg51[(3'h4):(1'h1)]) : (wire48[(4'h9):(1'h0)] || reg52))),
                      wire9};
  assign wire56 = (~|reg52);
  assign wire57 = (wire9[(1'h0):(1'h0)] ~^ $signed((^~$signed((+wire54)))));
  assign wire58 = {{(($unsigned(wire54) | wire9) ~^ $signed((8'hb9))), wire55}};
  always
    @(posedge clk) begin
      reg59 <= reg50[(4'hd):(3'h4)];
    end
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  input wire signed [(3'h6):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire17,
                 wire16,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg31,
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
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire16 = $signed((~|$signed(($signed(wire12) << (wire11 + wire12)))));
  assign wire17 = $unsigned($unsigned((wire14 ?
                      $signed((wire12 ?
                          wire13 : wire16)) : $signed($signed(wire15)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire12[(2'h2):(2'h2)]))
        begin
          reg18 <= (8'hb6);
          reg19 <= $unsigned(wire15);
          if ((~reg19))
            begin
              reg20 <= (wire12 < $signed((8'hb7)));
              reg21 <= reg19[(2'h3):(2'h2)];
              reg22 <= wire16;
            end
          else
            begin
              reg20 <= $signed((~&{(reg19[(5'h10):(3'h7)] > wire16[(2'h3):(1'h0)])}));
              reg21 <= wire17[(2'h2):(2'h2)];
              reg22 <= reg20[(1'h1):(1'h0)];
              reg23 <= (((&$signed(reg20[(1'h1):(1'h0)])) ?
                      (wire17[(2'h3):(2'h2)] ?
                          ((wire13 ? wire14 : wire13) >> {wire12,
                              wire11}) : $signed((~&wire15))) : (|$signed($signed(reg19)))) ?
                  ($signed(($unsigned(wire14) || $signed((7'h40)))) << {$unsigned((8'ha2))}) : reg21);
            end
          reg24 <= (~|(!{reg20, (^(reg18 - wire17))}));
          if (reg21[(1'h0):(1'h0)])
            begin
              reg25 <= reg19;
              reg26 <= wire16[(3'h4):(1'h0)];
              reg27 <= (reg21[(1'h1):(1'h1)] ?
                  $unsigned((reg21 ?
                      $unsigned($signed((8'ha4))) : (reg20[(1'h1):(1'h1)] ?
                          (~^reg20) : (wire12 ^ reg26)))) : $unsigned(reg26[(5'h11):(4'he)]));
              reg28 <= ((^({$signed(wire14)} ^~ ((wire13 ?
                  reg24 : (8'hb9)) ^~ (&wire17)))) > $signed(wire11[(4'h8):(4'h8)]));
              reg29 <= reg28;
            end
          else
            begin
              reg25 <= reg28;
              reg26 <= {((((wire11 >> reg23) <<< (|(8'hbe))) > reg26[(4'hb):(2'h2)]) ?
                      reg20[(4'hb):(4'hb)] : reg27[(4'hc):(4'h8)]),
                  wire15[(3'h7):(2'h2)]};
              reg27 <= (^~$signed(reg24[(1'h0):(1'h0)]));
              reg28 <= (reg22[(1'h0):(1'h0)] > (reg25 != (reg25[(3'h6):(2'h3)] ?
                  (wire12 ?
                      $unsigned((7'h43)) : reg26) : (wire17[(2'h2):(1'h1)] ?
                      wire11[(2'h2):(2'h2)] : ((8'ha4) << reg20)))));
            end
        end
      else
        begin
          reg18 <= (^~wire17[(4'ha):(2'h3)]);
          reg19 <= (($unsigned(wire17[(3'h7):(2'h2)]) <<< {$unsigned((reg26 == (8'ha4))),
                  $unsigned((-reg25))}) ?
              ($unsigned((~&$unsigned(wire13))) <<< {(~&$signed((8'hb8))),
                  $unsigned($unsigned(wire14))}) : reg21[(3'h4):(1'h1)]);
          if (((~^($signed((reg18 <<< (8'ha1))) && (8'hb1))) ?
              $unsigned($signed($signed($signed(wire16)))) : reg22))
            begin
              reg20 <= $signed((-$unsigned({reg21})));
            end
          else
            begin
              reg20 <= wire16[(1'h1):(1'h0)];
            end
          reg21 <= (!reg18[(3'h7):(1'h1)]);
          reg22 <= reg27;
        end
    end
  assign wire30 = (wire17 ?
                      $signed((|({reg26, reg27} ?
                          ((7'h40) ?
                              (8'hac) : reg29) : reg27[(4'hb):(3'h5)]))) : $signed($signed($signed((^wire11)))));
  always
    @(posedge clk) begin
      reg31 <= reg24[(4'h8):(4'h8)];
    end
  assign wire32 = ($unsigned($unsigned((+$signed(wire14)))) < (reg26 ?
                      wire14 : reg31[(4'h8):(3'h5)]));
  assign wire33 = ((8'hbc) == reg20);
  assign wire34 = ((((+$signed(wire14)) & $unsigned({(8'hb3),
                      reg29})) != reg23[(3'h4):(2'h2)]) | (+{(+wire12),
                      ($signed((8'ha3)) ?
                          (reg20 ? wire13 : reg26) : {wire13})}));
  assign wire35 = ({$signed((!((8'hbc) ?
                          reg19 : reg21)))} << (~|(!$signed($signed(reg26)))));
  always
    @(posedge clk) begin
      reg36 <= wire15;
      if (reg20[(4'he):(1'h0)])
        begin
          reg37 <= wire14;
          reg38 <= ((~&reg22[(1'h0):(1'h0)]) ^~ reg23);
          if ($unsigned(reg26))
            begin
              reg39 <= ($unsigned(wire30) ?
                  ((+($unsigned(reg21) ?
                          (wire32 ? reg36 : reg36) : (^wire30))) ?
                      $signed($signed((8'ha0))) : ($unsigned(reg23) ?
                          (reg23[(2'h3):(2'h2)] ^~ ((8'hb7) ?
                              reg23 : wire15)) : {$unsigned(wire30)})) : reg21[(3'h4):(3'h4)]);
              reg40 <= {($signed(wire13[(3'h6):(3'h4)]) >> $signed(wire30[(1'h0):(1'h0)]))};
              reg41 <= (^~((|$unsigned($unsigned(reg24))) >> wire32));
              reg42 <= reg20;
              reg43 <= reg31;
            end
          else
            begin
              reg39 <= (|reg40[(2'h2):(2'h2)]);
              reg40 <= $unsigned($unsigned((8'ha0)));
              reg41 <= $signed($unsigned(reg25[(4'ha):(1'h1)]));
            end
        end
      else
        begin
          reg37 <= reg18[(4'hd):(4'h8)];
          reg38 <= (wire35 == $signed((((reg22 - reg41) ?
                  (reg41 ^ reg24) : reg29) ?
              $signed(reg18[(4'hb):(3'h5)]) : $signed(reg26))));
        end
    end
  assign wire44 = reg38[(3'h6):(1'h0)];
  assign wire45 = reg39;
  assign wire46 = reg24;
  assign wire47 = (^~{$unsigned(($signed(reg36) ?
                          $signed(wire45) : (reg20 + (8'hb4))))});
endmodule
