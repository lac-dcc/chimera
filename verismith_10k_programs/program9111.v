module top
#(parameter param43 = ((-{(^((8'hab) ? (8'ha5) : (8'ha7)))}) ? ({((~^(8'ha4)) ^~ ((7'h43) >> (8'hb5)))} - {{(^(8'h9f)), ((8'ha6) ? (8'h9f) : (8'hb3))}}) : (((~&(-(8'ha1))) ^ ((+(8'ha9)) ? ((8'hac) ? (7'h42) : (8'hb1)) : ((8'ha8) ^ (8'hb9)))) <= (~&{(^(8'hba)), ((7'h41) ? (7'h44) : (8'hb5))}))), 
parameter param44 = (|param43))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
  assign wire5 = $unsigned((8'haf));
  assign wire6 = (wire0[(3'h6):(3'h4)] ~^ $unsigned((~^(&(8'ha9)))));
  assign wire7 = ($unsigned(({$signed((8'hbb)), (8'haa)} < ((8'ha9) ~^ (wire1 ?
                     wire6 : wire2)))) || $signed($signed((wire1[(1'h0):(1'h0)] & wire2[(4'hb):(2'h3)]))));
  assign wire8 = $signed((7'h42));
  assign wire9 = (8'hbd);
  assign wire10 = ((!wire1[(4'hb):(4'h8)]) ?
                      $unsigned($unsigned((wire2 ?
                          $signed(wire9) : wire6[(4'hd):(3'h5)]))) : $unsigned(wire2));
  assign wire11 = wire4[(4'hd):(4'h8)];
  assign wire12 = ((~|wire2[(3'h6):(2'h2)]) - $signed(wire5[(3'h5):(1'h0)]));
  assign wire13 = wire11[(2'h2):(2'h2)];
  assign wire14 = wire2;
  always
    @(posedge clk) begin
      reg15 <= (wire5 ~^ (wire13 != $signed($unsigned(wire13))));
      reg16 <= $unsigned({$signed(wire3),
          $unsigned($signed((wire3 - wire14)))});
      reg17 <= wire14[(2'h2):(1'h0)];
      if ((^~wire2))
        begin
          reg18 <= $signed($signed(wire10));
          if ($unsigned((~{wire9})))
            begin
              reg19 <= (^~wire12);
              reg20 <= (($unsigned({(8'ha7)}) ?
                      reg17[(3'h7):(3'h4)] : $unsigned(((wire5 ?
                          wire1 : wire14) >= wire11[(3'h4):(1'h0)]))) ?
                  (&reg16[(1'h1):(1'h0)]) : (~(~|(wire9 ?
                      {(7'h40)} : ((8'hbe) ? wire11 : wire7)))));
              reg21 <= (~(!$unsigned($unsigned($unsigned(wire2)))));
              reg22 <= $signed(($unsigned(wire4[(4'he):(3'h6)]) ?
                  (|((-wire0) <= reg17[(4'h8):(3'h7)])) : ($unsigned(reg21[(1'h1):(1'h1)]) <= $unsigned((&(8'ha4))))));
            end
          else
            begin
              reg19 <= (&(~{((wire12 >>> reg18) == $unsigned((8'had)))}));
              reg20 <= $signed(wire7);
              reg21 <= wire5;
              reg22 <= $unsigned($unsigned({(wire2 ^ (wire10 > (8'h9f))),
                  $unsigned($unsigned(wire7))}));
              reg23 <= wire14[(2'h2):(2'h2)];
            end
          reg24 <= wire14[(3'h4):(1'h0)];
        end
      else
        begin
          reg18 <= $unsigned(wire9[(3'h6):(3'h4)]);
          reg19 <= (^~(-((~^$unsigned(reg17)) ?
              wire0 : (wire4[(4'hd):(2'h2)] ?
                  $unsigned(reg20) : wire0[(2'h2):(1'h0)]))));
          reg20 <= $unsigned(reg20[(4'ha):(1'h1)]);
          reg21 <= ((+$signed({reg24[(1'h0):(1'h0)]})) == $unsigned({$signed((~&wire6))}));
        end
      reg25 <= wire14[(2'h3):(1'h1)];
    end
  assign wire26 = reg25;
  assign wire27 = ((~^wire11[(1'h0):(1'h0)]) ?
                      reg16 : (+(((~&(7'h41)) ?
                              $signed((8'hbd)) : $unsigned(wire0)) ?
                          $signed({wire11}) : wire10[(3'h5):(1'h1)])));
  assign wire28 = wire0[(1'h1):(1'h0)];
  assign wire29 = ((~|reg19[(4'h9):(2'h2)]) > $unsigned(reg23));
  always
    @(posedge clk) begin
      if (((wire5 > wire0[(4'h9):(2'h2)]) >= $signed((wire4[(4'hb):(4'h9)] << $signed({reg19,
          wire12})))))
        begin
          if ($signed((&(~{((8'hb6) ? wire8 : reg15)}))))
            begin
              reg30 <= ($unsigned(($signed(wire4) ?
                      (~$unsigned(wire29)) : (8'had))) ?
                  wire3 : reg21);
              reg31 <= $unsigned(($unsigned((8'ha9)) ?
                  $unsigned({$signed(wire4)}) : $signed((+$unsigned(wire3)))));
            end
          else
            begin
              reg30 <= $signed(wire11);
              reg31 <= $unsigned($unsigned((reg16 >= $signed((8'ha1)))));
              reg32 <= reg19[(3'h4):(2'h3)];
              reg33 <= (8'hbe);
            end
          reg34 <= {$signed((~^(&$unsigned(reg31))))};
          reg35 <= (^$signed(wire6[(4'he):(4'ha)]));
          reg36 <= $unsigned(({(~^wire6[(1'h0):(1'h0)]),
              {wire2[(4'hb):(3'h5)],
                  $signed(wire7)}} << ((reg21[(1'h0):(1'h0)] || $signed(reg33)) + $unsigned($unsigned(reg23)))));
        end
      else
        begin
          reg30 <= $unsigned(wire2[(3'h7):(3'h5)]);
          reg31 <= (8'haf);
          reg32 <= reg31[(4'h9):(3'h5)];
          reg33 <= $signed(wire2);
        end
      reg37 <= $unsigned(({wire10, (8'hb2)} ? wire14 : $unsigned((^~wire28))));
      reg38 <= wire4;
      reg39 <= $unsigned(($unsigned(($signed((8'hb0)) ?
              reg35 : $unsigned(wire0))) ?
          ((reg21[(2'h2):(1'h1)] ?
                  wire14[(1'h1):(1'h0)] : (wire1 ? wire10 : wire28)) ?
              $unsigned({(8'hbd)}) : {{reg21},
                  $unsigned(reg18)}) : ((-reg24) + reg19[(3'h5):(1'h1)])));
      reg40 <= wire27;
    end
  assign wire41 = (wire11[(1'h1):(1'h1)] >> reg32);
  assign wire42 = $unsigned(($unsigned((+reg21[(1'h0):(1'h0)])) > {(wire29 < (~|reg31))}));
endmodule
