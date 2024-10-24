module top
#(parameter param28 = (((8'hb2) ? (((8'hb1) ? ((8'hba) ? (8'ha0) : (8'hae)) : (-(8'ha6))) && ({(8'hb9)} ^ {(8'hb5), (8'ha2)})) : {({(8'hae)} && ((7'h42) ^~ (8'hb1))), ((7'h42) >>> ((8'hb2) ? (8'h9c) : (8'ha5)))}) > ({((&(8'hab)) < ((8'hb4) << (8'ha5)))} == ({((8'ha4) ^~ (8'hb9))} ? (~^((7'h41) ? (8'hb8) : (7'h42))) : {((8'ha5) < (7'h40)), ((8'hb3) ? (8'hbc) : (8'ha2))}))), 
parameter param29 = ((+((param28 ? (param28 || param28) : (&param28)) <<< {{param28}, (param28 < param28)})) <<< param28))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = (((~wire1[(3'h6):(1'h0)]) ?
                         (^~wire1) : (|(wire1[(3'h5):(2'h3)] ?
                             (wire2 ? wire1 : wire1) : $signed(wire2)))) ?
                     (($signed((wire2 ? wire2 : (8'h9d))) + (&(wire3 ?
                         wire0 : (8'hbc)))) ^ (~^wire0)) : wire2);
  assign wire5 = wire2;
  assign wire6 = $signed(($unsigned({(wire4 ? wire5 : wire2),
                         (wire3 ^~ wire4)}) ?
                     $unsigned($signed((|(8'hb8)))) : $unsigned(wire4)));
  assign wire7 = (|$unsigned($signed($unsigned(wire1[(2'h3):(1'h1)]))));
  assign wire8 = $unsigned((($signed((~|wire1)) ?
                         $signed((&wire3)) : (^$signed(wire4))) ?
                     wire0 : $signed(((~&wire1) && $unsigned(wire5)))));
  always
    @(posedge clk) begin
      reg9 <= {$unsigned(((!wire5[(5'h12):(1'h0)]) ^~ {wire3, wire2}))};
      reg10 <= wire4;
      reg11 <= wire2;
      reg12 <= (~|wire2[(4'h9):(3'h4)]);
      reg13 <= reg11;
    end
  assign wire14 = reg10;
  assign wire15 = reg13;
  always
    @(posedge clk) begin
      reg16 <= (&wire14[(2'h2):(1'h0)]);
      if ((+((wire1 ?
          (~|wire4[(3'h7):(1'h0)]) : (-(!wire6))) >= wire4[(4'ha):(3'h4)])))
        begin
          reg17 <= (8'hb8);
          if ((wire7 ^~ ((~^($unsigned(wire3) || $signed((7'h43)))) ?
              (((~&wire7) ^ reg9) | $signed((reg12 & wire15))) : wire3)))
            begin
              reg18 <= (~&{$unsigned(wire5)});
              reg19 <= $unsigned(wire1);
            end
          else
            begin
              reg18 <= $unsigned($unsigned((reg11[(5'h10):(3'h6)] >>> (~|((8'h9f) ?
                  reg19 : (8'ha5))))));
            end
          if (($unsigned($unsigned(wire8)) ?
              ((((wire7 << reg9) ?
                      wire3[(1'h0):(1'h0)] : $unsigned(wire5)) ~^ reg19) ?
                  (($signed(wire6) ? wire14 : $signed(reg19)) ?
                      ((!wire15) ?
                          $signed(wire4) : $signed(reg13)) : $unsigned(reg16[(2'h2):(1'h0)])) : ($unsigned(reg11[(2'h3):(2'h2)]) ^ reg19)) : (|$unsigned(({reg19} ?
                  wire15[(4'he):(3'h6)] : (wire8 ^~ reg11))))))
            begin
              reg20 <= $unsigned({(((8'ha5) ? (^~(8'h9d)) : $signed(reg12)) ?
                      (~&$unsigned(wire3)) : reg10[(3'h4):(1'h0)])});
              reg21 <= reg18;
              reg22 <= $signed((~|$signed((8'ha9))));
              reg23 <= reg16;
              reg24 <= reg16;
            end
          else
            begin
              reg20 <= $unsigned(($signed($signed((reg11 <= reg18))) > $unsigned(($signed(reg11) ?
                  (^wire2) : reg10[(2'h3):(1'h0)]))));
              reg21 <= $signed(({$signed(reg11)} || $unsigned({reg19,
                  $signed((8'h9c))})));
              reg22 <= wire6[(1'h0):(1'h0)];
              reg23 <= ({reg9} <= $unsigned((!$signed(reg20))));
              reg24 <= reg21;
            end
        end
      else
        begin
          if (((wire5[(5'h13):(2'h2)] ?
              (reg10[(1'h0):(1'h0)] < wire14) : reg23) > $signed(reg18[(4'hb):(3'h6)])))
            begin
              reg17 <= reg9;
              reg18 <= ($signed((!$signed($unsigned(reg18)))) - (8'hae));
            end
          else
            begin
              reg17 <= ($signed(((!{wire15}) >>> (8'ha1))) ?
                  wire8[(1'h1):(1'h1)] : ($signed({$unsigned(wire3)}) ?
                      reg10 : {reg23, reg10[(2'h3):(2'h2)]}));
              reg18 <= ({(reg10[(2'h2):(2'h2)] | ($signed(reg20) != wire5[(3'h7):(3'h7)]))} * (reg17 ?
                  (wire0 ?
                      $unsigned((+reg24)) : ((~|reg18) ?
                          (reg22 >> (8'h9e)) : (reg24 || reg21))) : (((wire15 < wire7) ?
                      (~|reg10) : wire6) > reg10)));
              reg19 <= (&((~^(~(^wire6))) ?
                  {$unsigned({reg12})} : (wire7 ?
                      {(reg10 & reg16)} : {reg22, (&reg11)})));
              reg20 <= (8'h9f);
              reg21 <= wire1;
            end
        end
      reg25 <= ({{wire3, $unsigned((~|reg22))}} != (&($unsigned(reg17) ?
          ((~reg10) != (&reg24)) : ((wire8 ? wire1 : reg20) ?
              (wire8 ? reg22 : wire3) : (wire14 <<< wire5)))));
      reg26 <= $unsigned((wire5 != {(~|$signed(reg9))}));
      reg27 <= reg23;
    end
endmodule
