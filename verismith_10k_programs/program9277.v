module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg9,
                 (1'h0)};
  assign wire4 = $unsigned({wire3[(1'h1):(1'h0)]});
  assign wire5 = ($signed(({$signed(wire3), (wire4 ? wire4 : wire1)} ?
                         wire3 : wire3[(2'h2):(1'h0)])) ?
                     (~|$signed({wire1[(3'h7):(3'h6)],
                         $signed(wire0)})) : (wire4 >= $unsigned((wire4[(4'h8):(4'h8)] > (^~wire4)))));
  assign wire6 = $unsigned(wire1);
  assign wire7 = ($unsigned($unsigned(((~&wire2) ? {wire1} : wire4))) ?
                     $unsigned((8'hb8)) : $signed(wire0));
  assign wire8 = (((!{(wire2 != wire2), wire2}) ?
                         (wire6[(3'h7):(3'h4)] ?
                             (|(7'h43)) : $signed($unsigned(wire2))) : (wire4[(1'h1):(1'h0)] >>> wire4[(4'ha):(3'h5)])) ?
                     wire7[(1'h0):(1'h0)] : $signed((($unsigned(wire7) ?
                             wire0[(4'hb):(2'h3)] : (~&wire1)) ?
                         $unsigned((~(8'ha6))) : $unsigned(wire5))));
  always
    @(posedge clk) begin
      reg9 <= (($unsigned(wire4[(4'he):(1'h1)]) << ((&(wire5 ?
          wire0 : wire5)) << (wire6 << $unsigned(wire0)))) ~^ wire7[(1'h1):(1'h0)]);
      if ((~|wire4[(4'ha):(4'h8)]))
        begin
          if ((wire8 ?
              {$unsigned((-(~^wire0))),
                  wire0[(4'h8):(1'h0)]} : wire4[(3'h7):(3'h6)]))
            begin
              reg10 <= wire5;
              reg11 <= (&(&(wire0[(3'h6):(1'h0)] ?
                  wire2[(2'h2):(1'h0)] : wire2[(1'h0):(1'h0)])));
              reg12 <= (8'hb5);
              reg13 <= wire7[(2'h3):(2'h3)];
              reg14 <= $unsigned(($unsigned(reg9) ?
                  ((~^wire0[(4'h9):(1'h0)]) >>> $signed($unsigned(wire2))) : {wire4,
                      (^~(reg10 && wire7))}));
            end
          else
            begin
              reg10 <= wire2;
              reg11 <= (reg9[(4'he):(3'h6)] << wire8[(4'h8):(1'h1)]);
              reg12 <= wire6[(1'h1):(1'h1)];
              reg13 <= $unsigned((wire4[(4'hb):(2'h3)] || (&wire0)));
            end
          reg15 <= (reg11 ? wire7[(1'h1):(1'h0)] : wire8);
          if (({((-reg13) >>> (^(&wire0))), reg9} ?
              wire2[(2'h3):(1'h1)] : (({$signed(wire0)} ?
                  wire7[(1'h1):(1'h1)] : {wire2[(1'h1):(1'h0)],
                      $unsigned(wire0)}) != $unsigned(((wire8 ? reg9 : reg14) ?
                  {wire0} : $unsigned(reg14))))))
            begin
              reg16 <= $unsigned($signed(wire3[(1'h1):(1'h1)]));
              reg17 <= (~&wire8[(3'h5):(3'h5)]);
              reg18 <= $signed(((((wire0 - wire1) | (~|reg10)) ?
                      wire6[(3'h5):(3'h5)] : reg12[(3'h4):(1'h0)]) ?
                  wire3 : reg17[(3'h4):(1'h1)]));
              reg19 <= (($unsigned($signed((^~reg11))) ?
                  (^~($unsigned(reg18) ?
                      (wire7 ?
                          (8'ha4) : reg13) : (-reg12))) : {$signed(wire5[(4'hd):(3'h6)]),
                      $unsigned((wire2 << (8'ha6)))}) > (~|(reg18[(1'h1):(1'h0)] ?
                  (reg18 <= $unsigned((8'hb3))) : $unsigned((reg11 >>> wire2)))));
              reg20 <= reg18[(2'h3):(1'h0)];
            end
          else
            begin
              reg16 <= wire1;
              reg17 <= (~($signed((reg9 ?
                      (wire5 == wire2) : ((7'h42) ? wire7 : wire1))) ?
                  (reg14 + (~|(wire0 | wire3))) : ({(8'hac)} <= {wire2,
                      $unsigned(reg13)})));
              reg18 <= (reg9[(4'hb):(3'h5)] <= wire8);
            end
          reg21 <= $signed(wire4[(1'h0):(1'h0)]);
        end
      else
        begin
          reg10 <= (|((^~(^(-reg13))) ?
              $signed(((7'h42) < (reg18 ? reg9 : reg9))) : $unsigned(reg12)));
          reg11 <= reg15[(2'h3):(2'h3)];
          reg12 <= $signed((({(wire6 <= reg16), (8'ha7)} ?
                  $signed((reg16 << reg17)) : {{(8'h9f)}, $signed((8'ha0))}) ?
              reg16 : ({(8'ha9)} ?
                  ((wire1 ? wire2 : reg17) >>> {wire0,
                      wire5}) : $unsigned($signed(wire1)))));
          reg13 <= wire7[(2'h2):(2'h2)];
        end
    end
  assign wire22 = $unsigned((+reg20));
  assign wire23 = (+(wire0 != $unsigned(wire1)));
  assign wire24 = reg10;
  assign wire25 = (reg19 | (|reg18));
  assign wire26 = ($unsigned((reg10 + $signed(wire22[(5'h13):(4'hb)]))) == ((&wire1[(1'h0):(1'h0)]) & (($unsigned(wire25) ?
                          reg14[(1'h0):(1'h0)] : $unsigned(wire6)) ?
                      (~&wire1) : wire8[(4'hd):(4'hb)])));
endmodule
