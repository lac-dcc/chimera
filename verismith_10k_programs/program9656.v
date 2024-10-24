module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire44;
  assign y = {wire47, wire46, wire5, wire44, (1'h0)};
  assign wire5 = ($signed(($signed((wire2 & wire0)) ?
                     wire0 : $unsigned($unsigned(wire1)))) || wire3);
  module6 #() modinst45 (.clk(clk), .y(wire44), .wire8(wire4), .wire10(wire2), .wire9(wire3), .wire7(wire1), .wire11(wire5));
  assign wire46 = wire1;
  assign wire47 = ((((~$unsigned(wire2)) == (wire2 ?
                          wire44[(3'h6):(3'h5)] : (wire46 ?
                              wire4 : wire4))) ^ wire4[(4'hd):(3'h4)]) ?
                      ($unsigned($signed($unsigned(wire0))) & wire4[(3'h6):(3'h6)]) : $signed((~($unsigned(wire5) ?
                          $unsigned((8'hac)) : (~|(8'hb1))))));
endmodule

module module6
#(parameter param43 = ((~&((&{(8'h9d), (7'h41)}) <= (((8'hbd) ? (8'ha5) : (8'ha9)) ~^ ((8'hb5) ? (8'hab) : (8'hbb))))) ? (~^(^~(((8'hb1) ? (8'ha0) : (8'ha6)) >= ((8'hbe) ? (8'hb6) : (8'haf))))) : ((((~&(8'ha4)) ? ((7'h44) > (8'ha8)) : ((8'ha2) | (8'h9e))) ? ((~^(8'h9f)) != ((8'hb4) ? (8'hb8) : (7'h42))) : {((8'hb4) ^ (8'hb2)), ((7'h43) ? (8'ha8) : (8'ha7))}) ? ({(^(8'ha7)), ((8'ha8) ? (8'hbe) : (8'hab))} & (^((8'hb2) && (8'hbd)))) : (((+(8'hba)) ? ((8'h9c) ? (7'h40) : (8'hbf)) : (7'h44)) || (((8'hba) ? (8'hbe) : (7'h41)) ? ((8'hac) ? (8'hb4) : (8'had)) : {(7'h42)})))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  assign y = {wire42,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire14,
                 wire13,
                 wire12,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire12 = $signed((7'h43));
  assign wire13 = ((((~&wire7[(3'h7):(2'h2)]) > $signed((wire11 + wire10))) ^ ((|wire11) * wire8[(3'h5):(1'h1)])) ?
                      $signed($unsigned($unsigned(wire11[(1'h1):(1'h0)]))) : {$signed(wire11)});
  assign wire14 = wire9;
  always
    @(posedge clk) begin
      if ($signed(wire13))
        begin
          reg15 <= $signed(wire7);
          reg16 <= wire8[(3'h5):(2'h3)];
          if (wire14)
            begin
              reg17 <= $unsigned($signed($unsigned($unsigned((wire12 ^~ wire13)))));
              reg18 <= $unsigned((~&$signed(wire7[(3'h4):(2'h3)])));
              reg19 <= {wire12, (&(&wire8[(3'h6):(1'h1)]))};
              reg20 <= {{reg18,
                      ($unsigned(reg17[(1'h0):(1'h0)]) | $signed((wire13 >= reg15)))}};
              reg21 <= (+$unsigned($signed($signed((wire7 ? reg16 : reg15)))));
            end
          else
            begin
              reg17 <= $signed((~^(~|(^~(^wire12)))));
              reg18 <= (wire14 << (({wire9,
                  (reg19 * wire8)} <= (~&wire10)) >>> $signed(({reg18} ?
                  wire13 : (8'hba)))));
              reg19 <= (~^wire11);
              reg20 <= ($unsigned(wire9[(1'h0):(1'h0)]) ?
                  $unsigned({(wire13 ?
                          (wire13 >> wire10) : wire9)}) : reg15[(3'h7):(3'h5)]);
              reg21 <= wire13[(1'h1):(1'h0)];
            end
        end
      else
        begin
          if (($unsigned(wire9[(1'h1):(1'h1)]) ?
              (wire11[(1'h0):(1'h0)] ?
                  $unsigned(((wire10 >>> wire7) | wire12)) : reg20) : wire8[(3'h4):(3'h4)]))
            begin
              reg15 <= (&((({wire11, wire13} ?
                  (reg21 <= wire7) : ((8'hab) * reg19)) + $unsigned({reg21})) & (8'haf)));
              reg16 <= $unsigned($unsigned((&(((8'h9c) > wire11) ?
                  (8'hba) : $unsigned(reg15)))));
              reg17 <= {$signed(reg21[(1'h0):(1'h0)])};
              reg18 <= (wire12 <= ($signed(reg17) <<< reg17));
            end
          else
            begin
              reg15 <= (reg16[(4'hf):(4'ha)] ? wire14 : reg18);
            end
          reg19 <= reg20;
          if ($unsigned({wire14[(3'h6):(1'h1)]}))
            begin
              reg20 <= (8'ha7);
              reg21 <= ((8'ha4) ?
                  $unsigned({{(-wire11), (|reg20)}}) : wire11[(3'h4):(2'h2)]);
            end
          else
            begin
              reg20 <= {$unsigned({(((8'hb3) <= reg19) ^~ $signed(wire11))})};
              reg21 <= ($signed((wire8 & reg15[(5'h11):(3'h5)])) ?
                  (($signed((8'h9f)) ?
                      $unsigned($signed((8'h9f))) : ($unsigned(wire12) & (wire9 ?
                          (8'ha9) : wire11))) || wire10[(3'h6):(3'h5)]) : $unsigned((wire11[(2'h2):(1'h1)] <<< {$unsigned(wire12),
                      (&(8'hac))})));
              reg22 <= $signed(((wire14[(3'h7):(3'h5)] ?
                      reg15[(3'h4):(1'h0)] : ((reg19 ?
                          wire8 : (8'hac)) | (~(8'hb0)))) ?
                  {(8'hb3),
                      wire13[(4'hf):(4'hf)]} : ((8'ha3) <<< (~|((8'hab) < reg17)))));
              reg23 <= ((&reg17[(4'hb):(3'h5)]) || wire8[(1'h0):(1'h0)]);
            end
          reg24 <= reg15;
        end
      reg25 <= reg21;
    end
  always
    @(posedge clk) begin
      reg26 <= ($signed((wire13[(3'h4):(3'h4)] & $signed(wire9))) ?
          wire13[(4'he):(4'hc)] : ($signed($signed(((8'haf) ?
              reg16 : reg16))) <<< $unsigned($unsigned((wire13 < reg23)))));
      reg27 <= reg20;
    end
  assign wire28 = $signed((wire11[(3'h5):(3'h5)] * (((wire10 ?
                          (8'hb9) : wire12) ?
                      (reg25 ?
                          reg23 : wire9) : (reg21 && reg18)) ~^ $unsigned(reg26[(3'h5):(1'h1)]))));
  assign wire29 = reg24;
  assign wire30 = {($signed($unsigned(wire9[(1'h0):(1'h0)])) ?
                          ($signed((wire9 & (8'h9f))) | (~^reg19[(4'hf):(4'he)])) : $unsigned($unsigned({reg20})))};
  assign wire31 = $signed(reg15);
  assign wire32 = (~(({(8'hae)} ?
                          ((+reg23) ?
                              reg26[(4'h9):(4'h8)] : (8'ha5)) : wire10) ?
                      ($unsigned(reg19[(4'he):(4'h9)]) ?
                          (((8'hba) <= wire13) * $signed(reg18)) : (reg21 - {wire12})) : wire12[(4'h9):(2'h3)]));
  always
    @(posedge clk) begin
      reg33 <= ($unsigned((~wire9[(1'h0):(1'h0)])) ?
          $signed((reg24 <= wire30[(3'h5):(2'h2)])) : reg26[(4'hf):(3'h7)]);
      reg34 <= $unsigned($signed((|(|((8'ha3) ? wire10 : reg15)))));
      reg35 <= $signed((-wire13));
      if (reg22)
        begin
          reg36 <= $signed(reg15);
        end
      else
        begin
          reg36 <= (+$unsigned(({$signed(wire31),
              (reg27 ? reg19 : reg26)} ^ (^~{wire8}))));
        end
    end
  always
    @(posedge clk) begin
      reg37 <= $signed($unsigned(reg22));
      reg38 <= wire11;
      reg39 <= ({$unsigned(((reg22 ^ reg38) ?
                  $unsigned(wire7) : ((8'hb7) ? wire11 : wire8))),
              ($signed((reg25 ? wire28 : reg19)) ?
                  ($signed(reg26) ?
                      (!wire28) : (reg37 ?
                          wire13 : reg25)) : $signed((reg20 >>> wire32)))} ?
          reg19[(1'h1):(1'h0)] : (-$signed(reg15)));
      reg40 <= (($signed((wire8[(2'h3):(2'h3)] ? (reg26 - reg18) : (~wire14))) ?
              (~^reg33[(4'hc):(2'h2)]) : $signed(reg34[(4'h8):(1'h0)])) ?
          wire8[(2'h2):(1'h0)] : $signed(($unsigned((8'h9f)) ~^ (&{wire8,
              (8'h9e)}))));
      reg41 <= (($unsigned((~&(wire29 ? reg37 : reg37))) ?
              (wire10 ?
                  ($unsigned(reg16) != wire11) : $signed((8'h9f))) : reg26[(1'h1):(1'h0)]) ?
          (($unsigned((wire12 ? wire11 : reg17)) <<< {reg20[(2'h2):(2'h2)]}) ?
              (~$unsigned((wire9 ^ reg22))) : reg37) : wire7[(1'h1):(1'h0)]);
    end
  assign wire42 = (reg26 >> reg36[(1'h0):(1'h0)]);
endmodule
