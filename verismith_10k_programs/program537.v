module top
#(parameter param19 = (~&{(~&((~|(8'h9c)) + (~^(8'hb1)))), {(-((8'hb2) ? (8'hb3) : (8'hb2)))}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire18,
                 wire6,
                 wire5,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = ((wire1[(1'h1):(1'h0)] ?
                     wire3 : wire1[(1'h0):(1'h0)]) || wire0[(4'he):(4'hb)]);
  assign wire5 = $signed(wire1);
  assign wire6 = {wire0[(4'h8):(3'h6)],
                     $signed(($unsigned({wire4, wire1}) ?
                         $signed((+wire3)) : ((+wire0) ?
                             wire5[(1'h1):(1'h1)] : (wire4 ? wire5 : wire0))))};
  always
    @(posedge clk) begin
      reg7 <= wire4;
      if ((!(~|wire5)))
        begin
          if ((((wire6[(4'h8):(2'h3)] < $signed((-wire1))) + $signed(((wire3 * (8'hb8)) ?
              wire5 : $unsigned(reg7)))) == (({$unsigned(reg7)} ?
                  $signed((wire3 ?
                      wire2 : wire1)) : ($signed(wire1) != (!wire5))) ?
              (!$signed($signed((8'haa)))) : $unsigned((-(wire5 > wire0))))))
            begin
              reg8 <= ((^~$unsigned((wire1[(1'h0):(1'h0)] != wire4))) ?
                  $signed($unsigned(((~|wire1) ?
                      wire6[(1'h1):(1'h0)] : (wire3 ?
                          wire4 : wire2)))) : {(&wire6), (~^wire3)});
              reg9 <= (~|wire3);
              reg10 <= (-{wire3});
              reg11 <= reg7;
            end
          else
            begin
              reg8 <= $unsigned(reg11);
              reg9 <= reg10;
            end
          reg12 <= $signed({($unsigned((-wire2)) ?
                  $unsigned(reg8) : $signed({wire1})),
              wire0[(1'h0):(1'h0)]});
          reg13 <= wire4[(3'h6):(3'h6)];
          reg14 <= $unsigned({((wire5[(5'h12):(3'h5)] <<< ((8'ha0) ?
                      (8'hb2) : (8'h9f))) ?
                  reg8 : ($signed(reg13) ?
                      (wire3 ? wire3 : wire4) : (wire4 & reg13))),
              $signed(wire3)});
        end
      else
        begin
          reg8 <= $signed({$unsigned(reg13)});
          reg9 <= $unsigned($unsigned($unsigned(reg13[(4'h9):(2'h2)])));
          reg10 <= {wire3[(3'h5):(1'h0)],
              $unsigned($signed(((reg10 ?
                  wire2 : wire1) != $unsigned(wire4))))};
        end
      reg15 <= (((((wire2 & (8'ha2)) ?
                  {wire4, reg7} : $signed(wire3)) + wire2) ?
              reg7 : wire3) ?
          (+($signed({wire3,
              wire4}) | reg10[(1'h0):(1'h0)])) : $unsigned(wire0));
      reg16 <= reg8[(1'h1):(1'h1)];
      reg17 <= (wire4[(4'ha):(3'h5)] ?
          $signed(wire6[(2'h2):(1'h0)]) : (({{wire3}, wire4} ?
                  $signed((reg8 ^ reg10)) : ($signed(reg15) > wire2[(3'h6):(3'h4)])) ?
              (wire2[(4'h8):(2'h3)] ?
                  reg11[(3'h7):(3'h5)] : $signed((wire6 ~^ reg9))) : wire2[(5'h12):(1'h1)]));
    end
  assign wire18 = (8'haf);
endmodule
