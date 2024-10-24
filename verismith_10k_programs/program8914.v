module top
#(parameter param43 = (-(+({{(8'hbd), (8'haf)}} || ({(8'hbe), (8'hb0)} >> (8'haa))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  assign y = {wire42, wire41, wire40, wire38, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {(8'ha7)};
  assign wire5 = $unsigned($unsigned(((wire2[(3'h7):(1'h0)] ^~ $unsigned(wire0)) ~^ (wire1 * wire2[(2'h2):(1'h0)]))));
  assign wire6 = (($unsigned(((wire3 ?
                     wire5 : wire4) || (8'ha2))) ^ {(wire2[(3'h6):(3'h6)] | wire5)}) >> wire0[(2'h2):(1'h0)]);
  module7 #() modinst39 (wire38, clk, wire0, wire4, wire2, wire1);
  assign wire40 = ({(($unsigned(wire0) ? {wire4} : (&wire3)) ?
                          $signed((^wire0)) : wire0[(5'h13):(5'h10)]),
                      (&{(~^wire38)})} - {(!wire5),
                      (wire4[(1'h1):(1'h0)] ?
                          $signed($unsigned(wire2)) : $signed($unsigned((7'h40))))});
  assign wire41 = wire0;
  assign wire42 = wire40[(3'h7):(2'h2)];
endmodule

module module7
#(parameter param36 = ((~|(!(((8'h9f) ~^ (8'had)) >>> ((8'haa) ? (8'had) : (8'h9c))))) ? (-{(8'hb1), (((8'hab) ? (8'h9f) : (7'h42)) - ((8'hbe) ^~ (8'hbd)))}) : (~|((((8'hb9) ? (8'h9f) : (8'h9d)) || ((8'hb3) ^~ (8'h9d))) ^~ ((~|(7'h42)) ? (^~(8'hb6)) : ((8'ha9) <= (8'hb1)))))), 
parameter param37 = param36)
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire14,
                 wire13,
                 wire12,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire12 = (^~{(($signed(wire11) ? wire9 : (8'ha9)) ?
                          $signed($signed(wire11)) : $unsigned($signed(wire9))),
                      wire10});
  assign wire13 = (~&wire9[(1'h0):(1'h0)]);
  assign wire14 = (^~($signed(wire12) ^ (((wire8 ^ wire13) <<< (&wire10)) ?
                      wire9[(4'hc):(2'h2)] : {(wire10 >> wire12),
                          $signed(wire10)})));
  always
    @(posedge clk) begin
      reg15 <= ((|$signed({$unsigned(wire9), wire9})) ?
          $signed($signed((^~(wire11 ?
              wire13 : wire8)))) : $unsigned(((^~wire12) ? wire12 : wire13)));
      if ($signed((wire13[(5'h10):(5'h10)] ?
          (reg15 || ($unsigned(wire8) + (wire10 ?
              wire11 : wire8))) : $signed((^~$unsigned(wire12))))))
        begin
          reg16 <= ((^~$signed(((wire14 ?
                  reg15 : wire12) << wire13[(5'h11):(5'h10)]))) ?
              (!wire8[(5'h11):(5'h11)]) : wire13);
        end
      else
        begin
          if (((~&(8'hac)) & wire13[(3'h4):(3'h4)]))
            begin
              reg16 <= ({((!wire13) << $unsigned($signed(wire8))),
                  (wire13 ? wire12 : $signed({wire14}))} && wire12);
              reg17 <= wire9;
              reg18 <= (8'ha6);
              reg19 <= ((wire12[(2'h2):(2'h2)] >> ((~(^~reg18)) == ((reg16 | wire9) ?
                  $unsigned(wire12) : (wire13 <= (8'h9e))))) & wire10[(2'h3):(1'h1)]);
              reg20 <= (($signed(($signed(reg15) ?
                      {(8'ha1)} : $signed((8'hac)))) >>> ((-(!wire13)) ?
                      wire12[(4'h9):(3'h7)] : $signed($unsigned(wire12)))) ?
                  ($signed((~|wire10[(4'h8):(1'h1)])) ?
                      wire11[(3'h7):(3'h5)] : (^($unsigned(reg15) ?
                          (~^wire11) : (wire12 ?
                              wire11 : reg15)))) : $unsigned((wire14 ?
                      {(wire11 & reg19),
                          reg19} : $unsigned($unsigned(reg16)))));
            end
          else
            begin
              reg16 <= $unsigned(({(-$signed(reg18))} ?
                  (((reg17 < wire8) ^~ {reg19,
                      reg16}) <= {(reg19 >= wire12)}) : $unsigned({(wire13 ?
                          reg17 : wire12)})));
              reg17 <= $signed(wire11[(3'h7):(2'h3)]);
            end
          reg21 <= ($signed(reg18[(4'hb):(4'h9)]) ?
              {{(~|$signed((8'hbc)))}} : $signed(($signed($signed(wire14)) ?
                  wire10 : (reg15 >= reg17))));
        end
      if (reg19[(4'hc):(4'h8)])
        begin
          if ($signed(($unsigned(($signed(wire12) ^ (|(8'h9c)))) << $unsigned(((reg19 >> (8'hb2)) ?
              $signed(wire12) : $unsigned(reg21))))))
            begin
              reg22 <= $unsigned((&reg21));
              reg23 <= (($unsigned(reg15) ?
                  (($unsigned(wire14) ~^ $unsigned(wire9)) ?
                      ((reg20 && wire14) ?
                          $signed(wire10) : reg21[(1'h0):(1'h0)]) : ($signed(reg22) ?
                          wire13[(3'h6):(1'h0)] : (reg22 ?
                              wire9 : wire11))) : reg20) - wire10);
            end
          else
            begin
              reg22 <= $unsigned((|$unsigned(((reg21 ? (8'haa) : wire9) ?
                  {reg21} : wire11[(3'h4):(2'h2)]))));
            end
          reg24 <= reg22;
          reg25 <= (wire11 ? {(^~reg18)} : reg23);
        end
      else
        begin
          reg22 <= (~|$unsigned(($signed(reg23) ?
              $unsigned((wire8 ?
                  (8'hb9) : wire11)) : $unsigned($unsigned((8'h9c))))));
          reg23 <= $unsigned(wire12[(1'h1):(1'h0)]);
          reg24 <= $unsigned({({$signed((8'hbc)), wire14[(4'hb):(1'h0)]} ?
                  {(8'hb7), reg20[(1'h0):(1'h0)]} : $signed($signed(reg24)))});
          reg25 <= $signed((+((!(reg19 >> reg21)) < $signed(wire10[(3'h7):(1'h0)]))));
          if ($unsigned({reg19, $signed($unsigned($signed((8'ha2))))}))
            begin
              reg26 <= (($signed($signed($signed(wire12))) ?
                      (8'ha8) : {((8'hb5) ? (^~reg25) : {wire8})}) ?
                  reg18[(4'hc):(3'h4)] : (~(~|wire10[(4'hd):(4'h8)])));
              reg27 <= ((+$signed({(reg23 >>> reg23),
                  (^~(8'had))})) | $signed({(~&reg24)}));
              reg28 <= reg27[(1'h0):(1'h0)];
            end
          else
            begin
              reg26 <= (((((reg19 << reg19) ?
                      (reg15 ? reg15 : wire12) : wire9) ~^ ((wire10 ?
                          reg26 : reg16) ?
                      reg20 : (|reg26))) | (|$signed((reg15 && reg20)))) ?
                  ((({reg25,
                      wire8} ^ (reg18 != wire12)) || $signed((8'hb6))) >>> (reg16 ?
                      ((wire14 ? reg20 : reg27) ?
                          (~(8'hb0)) : reg16) : reg15)) : reg27[(3'h7):(1'h1)]);
              reg27 <= reg24[(1'h1):(1'h1)];
              reg28 <= (-{$unsigned((((8'had) ? (7'h41) : reg23) ?
                      (~|wire10) : $signed(reg23))),
                  (reg15 ^~ $unsigned({wire13, wire14}))});
              reg29 <= $signed(($unsigned((~&wire14[(1'h0):(1'h0)])) ?
                  {((!reg17) > {wire11, wire9}),
                      ((wire11 ? reg18 : reg27) & (&reg17))} : (8'hae)));
            end
        end
      reg30 <= (8'hb8);
    end
  always
    @(posedge clk) begin
      reg31 <= ((reg29[(3'h4):(2'h3)] ?
              (reg23 + $signed(wire9)) : wire13[(4'hd):(1'h0)]) ?
          ($signed({(-reg26)}) ?
              (&$signed((^reg16))) : ((((8'hbe) ? reg29 : wire9) ?
                      reg21[(3'h5):(3'h4)] : $unsigned(reg15)) ?
                  ((reg23 ~^ reg27) || reg20) : (8'h9e))) : ((^reg28[(3'h4):(1'h1)]) ?
              $signed($signed(reg18[(3'h6):(3'h6)])) : $signed(reg21[(2'h3):(1'h1)])));
    end
  assign wire32 = {$unsigned((-({reg19, reg27} != $signed(wire14))))};
  assign wire33 = reg22[(5'h10):(4'he)];
  assign wire34 = $unsigned(reg16);
  assign wire35 = $unsigned($signed(wire8));
endmodule
