module top
#(parameter param30 = {(!(((|(8'hb2)) ? ((8'hb6) ? (8'hbc) : (8'haf)) : ((8'hac) ? (8'hae) : (8'ha1))) ? {((8'ha7) ? (8'ha1) : (8'ha8)), {(8'ha4)}} : (((8'ha1) <= (8'ha0)) - (7'h44)))), (((^((8'hb0) - (8'hbe))) - (((8'hb4) ? (8'h9e) : (8'h9e)) ? {(8'ha1), (8'ha6)} : ((8'h9e) && (8'ha4)))) ? (&({(8'haf)} && {(8'haf)})) : (((-(7'h41)) ? ((8'ha0) ? (8'ha9) : (8'hbf)) : ((8'hac) ~^ (8'ha1))) && (7'h42)))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = (~$signed((~&(~|(^wire0)))));
  assign wire6 = (wire3[(1'h1):(1'h0)] ?
                     (~&(&($signed((8'ha1)) < (wire0 ?
                         (8'hbf) : wire0)))) : (wire5[(4'h8):(4'h8)] <= {$signed($signed(wire0))}));
  assign wire7 = wire3[(1'h1):(1'h0)];
  assign wire8 = $signed(wire0);
  assign wire9 = (-{{$signed(wire7[(1'h1):(1'h1)]),
                         ({(8'hb1), wire8} ? $unsigned(wire4) : wire5)},
                     ($unsigned({wire2, wire1}) ^ $signed(wire1))});
  always
    @(posedge clk) begin
      reg10 <= (~&$unsigned((wire4[(4'hd):(3'h6)] ?
          {wire5[(4'h9):(4'h8)]} : (~|$unsigned((8'hbd))))));
      reg11 <= $unsigned((reg10[(3'h7):(3'h5)] ? wire2 : wire2));
      reg12 <= {wire8[(2'h3):(2'h3)], wire6[(3'h4):(2'h3)]};
      if ({(8'hab)})
        begin
          reg13 <= (~|reg12[(2'h2):(1'h1)]);
          reg14 <= wire1[(2'h3):(2'h3)];
        end
      else
        begin
          reg13 <= reg12[(4'h9):(2'h2)];
          reg14 <= (((~&wire2) | wire7) - wire0[(2'h3):(1'h0)]);
          if ({((($unsigned(reg11) ? (-wire1) : wire2) && ((7'h43) ?
                  (-wire2) : $signed(reg12))) | reg11[(3'h5):(1'h1)])})
            begin
              reg15 <= (^$signed({wire1, $unsigned(wire2[(3'h7):(3'h6)])}));
            end
          else
            begin
              reg15 <= (~($unsigned($unsigned((wire4 ? reg10 : reg14))) ?
                  $unsigned($unsigned({wire7, wire3})) : ($signed({wire6,
                          wire9}) ?
                      $unsigned({wire7}) : (^$signed(wire3)))));
              reg16 <= (~&$unsigned((($signed(wire6) ?
                  $unsigned(reg12) : (reg14 ^ reg11)) > (wire6 ?
                  (^(8'ha0)) : (wire1 | wire6)))));
              reg17 <= ((~|{reg14[(3'h7):(2'h3)]}) >= {wire5[(4'hb):(2'h3)]});
              reg18 <= reg16;
              reg19 <= wire3[(1'h0):(1'h0)];
            end
        end
      reg20 <= wire4[(5'h10):(3'h7)];
    end
  always
    @(posedge clk) begin
      reg21 <= (^~($signed(wire1) >>> wire8[(4'h9):(3'h5)]));
      reg22 <= (reg13 & ($signed(reg21) & (&$signed((&wire9)))));
      reg23 <= {(|wire4), wire8[(4'hb):(3'h6)]};
      reg24 <= $signed($unsigned((reg12[(4'h8):(3'h7)] ?
          ((wire5 ? wire8 : (8'hb5)) ?
              (~&reg12) : (wire4 ? reg12 : reg16)) : {$signed(reg21)})));
      if (reg20[(1'h1):(1'h1)])
        begin
          reg25 <= $signed(reg12);
          reg26 <= (&(&$signed((~|(&(8'hba))))));
          reg27 <= $signed({$signed($signed((^wire6)))});
        end
      else
        begin
          reg25 <= {{(~|(wire0 ? (reg14 ^ reg14) : reg18[(4'hc):(4'hb)])),
                  $unsigned(reg14[(1'h0):(1'h0)])}};
        end
    end
  assign wire28 = ((({{(8'hb9), reg16}} ?
                              wire2 : $signed((reg17 ? reg11 : wire9))) ?
                          $signed(($unsigned(reg14) > $unsigned(reg16))) : ((reg26 + $signed(wire0)) ?
                              $signed(reg11) : $unsigned((8'hb8)))) ?
                      $signed((+((8'hb4) ?
                          (~^reg24) : (wire5 ? reg17 : (8'ha4))))) : wire0);
  assign wire29 = (wire4[(4'hd):(3'h4)] ?
                      ($unsigned({$unsigned((8'hb0)),
                          ((8'ha0) ?
                              reg19 : (8'ha6))}) ~^ $unsigned($signed($signed((7'h41))))) : reg16);
endmodule
