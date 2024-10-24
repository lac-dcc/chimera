module top
#(parameter param29 = ((+(-((-(8'hbe)) >= ((7'h42) && (8'ha7))))) ? ((({(8'hae)} >= (~^(8'h9c))) != {((8'hbe) >= (7'h40)), ((8'hbb) + (8'hb7))}) ? (~&(~^((8'hb2) ? (8'hac) : (8'ha0)))) : (^({(7'h40)} << (-(7'h41))))) : ((|(&(|(8'hbe)))) ? (|((~(8'ha9)) ? ((8'hb4) ? (8'ha0) : (7'h43)) : ((7'h40) ~^ (8'hb6)))) : {(|{(8'ha6), (8'hb5)})})), 
parameter param30 = (((^((param29 && param29) ? param29 : {param29})) && (param29 ? param29 : param29)) ? (-(|(|(param29 < (8'hb9))))) : ({((~param29) ? (param29 ? param29 : param29) : (+param29)), (8'ha5)} & (((param29 || param29) || (param29 | (8'ha6))) ? ((param29 ? param29 : param29) ? (~&param29) : {param29, param29}) : (8'hbb)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = (wire4[(1'h1):(1'h1)] ?
                     {($unsigned((wire2 ? wire1 : wire1)) ?
                             wire0 : wire3[(5'h11):(4'he)])} : ((~^$unsigned((wire1 ?
                             (8'ha3) : wire3))) ?
                         wire3 : $unsigned(((8'h9e) * $unsigned(wire2)))));
  assign wire6 = wire3[(1'h0):(1'h0)];
  assign wire7 = (wire0 > ((!(|$signed(wire3))) ~^ (((wire1 ^ wire6) ?
                     (~^wire6) : (wire1 ? wire3 : wire5)) | (((8'hac) ?
                         wire3 : wire1) ?
                     $unsigned(wire6) : (8'hb2)))));
  assign wire8 = {$signed({wire6[(4'h9):(3'h6)], $signed(wire4)}),
                     (((wire0 ^ (~^wire3)) ? (+$signed(wire3)) : wire1) ?
                         (wire3[(3'h5):(3'h4)] ?
                             (wire5 < (wire1 ?
                                 wire2 : wire1)) : $unsigned((-wire7))) : ($signed(wire0) ?
                             (~^(wire4 - wire0)) : (~|$signed(wire7))))};
  assign wire9 = (($unsigned(((~|wire7) ?
                     (wire6 ? wire2 : wire2) : (wire7 ?
                         wire7 : wire7))) | $signed(wire8)) ~^ ({$signed($unsigned(wire3))} * {($unsigned(wire4) ?
                         (wire6 >= wire5) : $unsigned(wire2))}));
  assign wire10 = {$signed($signed(wire9[(4'hf):(3'h5)]))};
  always
    @(posedge clk) begin
      reg11 <= ((+(!wire10[(4'hb):(3'h4)])) | $signed($signed(($signed((7'h44)) != wire8))));
      reg12 <= wire0[(3'h6):(1'h1)];
      reg13 <= (&$unsigned((($signed(wire2) != (wire4 << reg11)) ?
          ((+reg12) >>> (wire9 ? wire10 : wire1)) : (wire1 ?
              (~|wire1) : $signed((8'h9c))))));
      if ($signed({($signed(((8'ha6) ? (8'hb7) : wire0)) <<< (~&wire3))}))
        begin
          reg14 <= (~&$signed({wire8[(2'h3):(1'h0)]}));
          reg15 <= reg14;
          reg16 <= $signed((-(^~(~^wire6[(4'h9):(3'h6)]))));
        end
      else
        begin
          reg14 <= $unsigned(((((7'h42) ? $unsigned(reg13) : {wire10}) ?
              ($signed(wire6) ?
                  wire5 : $signed(reg15)) : wire6[(5'h10):(4'hc)]) + reg12[(2'h2):(1'h0)]));
          if ((^{$unsigned(wire6[(4'hd):(4'h8)])}))
            begin
              reg15 <= wire7[(3'h4):(3'h4)];
              reg16 <= {((~$unsigned(reg11[(4'h8):(3'h4)])) < (&$unsigned(wire1)))};
              reg17 <= $unsigned($unsigned($signed({(wire2 | wire9),
                  ((8'ha4) >>> reg16)})));
              reg18 <= $signed(reg17);
              reg19 <= (+$unsigned(($signed(reg17[(4'he):(3'h4)]) ?
                  $unsigned((^~reg12)) : reg16)));
            end
          else
            begin
              reg15 <= $signed((~(wire1[(4'h8):(1'h0)] ?
                  ((reg11 ? wire2 : reg13) ?
                      $unsigned((8'ha0)) : wire6) : wire2)));
              reg16 <= reg16;
            end
          if ($unsigned(wire1[(3'h7):(3'h6)]))
            begin
              reg20 <= $signed(wire3[(3'h7):(3'h5)]);
              reg21 <= reg18;
              reg22 <= {(((wire5[(4'h8):(3'h4)] ?
                          {reg20} : (wire10 << wire3)) ^ wire6[(3'h7):(2'h2)]) ?
                      $unsigned(reg17) : reg11[(3'h4):(1'h0)]),
                  $unsigned(((-(wire0 ? reg15 : wire4)) ?
                      reg15[(2'h3):(2'h3)] : ((8'hbc) ?
                          (^~reg12) : (reg15 >= wire4))))};
              reg23 <= reg12[(1'h0):(1'h0)];
              reg24 <= $unsigned($signed(wire4));
            end
          else
            begin
              reg20 <= (+(~^$unsigned(((wire7 > wire7) ^ wire4[(1'h0):(1'h0)]))));
              reg21 <= ($signed((wire9[(5'h11):(5'h10)] ?
                      reg24[(4'hc):(3'h7)] : wire9[(4'hb):(3'h4)])) ?
                  $unsigned((reg24[(4'hb):(4'ha)] << (reg22[(3'h5):(1'h1)] ?
                      (wire8 ?
                          wire4 : (8'hba)) : (~|wire1)))) : {$unsigned(wire6),
                      $unsigned($signed((reg16 ? reg19 : wire9)))});
              reg22 <= $unsigned(($signed((reg22[(4'h9):(1'h0)] && {wire7,
                      wire8})) ?
                  (|(((7'h40) ? (8'hab) : wire6) ?
                      (reg21 ?
                          reg19 : wire1) : $unsigned(reg17))) : ((8'hac) << (+wire0[(4'hb):(1'h0)]))));
              reg23 <= ({$signed((8'hb7))} ?
                  $signed(wire6) : $unsigned(reg20[(3'h6):(2'h3)]));
              reg24 <= $unsigned((^~(~|reg18)));
            end
        end
      reg25 <= (~&$unsigned($signed($unsigned((reg19 ? (8'ha0) : reg15)))));
    end
  assign wire26 = $signed(reg12[(1'h1):(1'h1)]);
  assign wire27 = {$signed((wire9 ^~ (wire8 ? ((8'hbe) && wire0) : reg19))),
                      reg25[(4'hc):(4'hb)]};
  assign wire28 = wire4;
endmodule
