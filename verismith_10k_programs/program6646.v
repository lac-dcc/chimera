module top
#(parameter param28 = (((-(((8'hb0) & (7'h44)) <<< (+(7'h40)))) >>> (!{((8'haa) ? (7'h42) : (8'ha5))})) ? ((-({(8'hbf)} >= (~|(7'h41)))) ? ({((8'hb5) > (8'hb8))} ? (8'ha4) : ((^(8'hb4)) | (+(8'ha2)))) : (|(((8'haa) ? (8'hbe) : (8'ha0)) ? ((8'h9c) == (8'hb6)) : {(8'h9c), (8'hbb)}))) : (~&((~^((8'h9c) ? (8'ha1) : (8'ha7))) ? (~^((8'hb2) ? (8'hb7) : (8'hbb))) : ({(8'haa)} ? {(8'hbd), (8'haf)} : (8'ha7))))), 
parameter param29 = ((((~&(+param28)) ~^ (^param28)) * (~|({param28} + (~^param28)))) - (((|(&param28)) != ((param28 ? param28 : (8'hb9)) ? {param28} : param28)) ? ((8'ha8) ? ((param28 & (8'ha9)) ? {param28, param28} : (~|param28)) : (|(param28 ^ (8'ha6)))) : (((param28 ? param28 : param28) ? (|param28) : (^param28)) >= ((param28 * param28) ? (param28 + param28) : (+(8'ha6)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire18,
                 wire11,
                 wire7,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg6,
                 (1'h0)};
  assign wire4 = {$signed($signed(wire0)),
                     $signed($unsigned((wire2[(3'h5):(2'h2)] <= (wire2 ?
                         wire1 : (8'hb7)))))};
  assign wire5 = wire0[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg6 <= (8'hba);
    end
  assign wire7 = $signed(wire1);
  always
    @(posedge clk) begin
      reg8 <= ((((^wire7) ? wire5 : (|wire5[(2'h2):(1'h0)])) ?
              (!{wire4, (-reg6)}) : $unsigned(((wire3 ? wire1 : reg6) ?
                  (~wire7) : $unsigned(wire7)))) ?
          {wire0, reg6} : (^wire1[(1'h0):(1'h0)]));
      reg9 <= wire0;
      reg10 <= wire0;
    end
  assign wire11 = (~^wire1);
  always
    @(posedge clk) begin
      if ($signed(($signed(reg10[(4'hb):(2'h3)]) ?
          reg10[(4'hb):(3'h6)] : $signed((-reg8)))))
        begin
          reg12 <= ($unsigned($unsigned(({wire1} ?
              (wire0 ?
                  (8'hb3) : wire0) : $signed((8'ha2))))) < (({$signed(reg8),
                      $unsigned((8'ha7))} ?
                  ((wire11 ? (8'hb6) : wire1) ?
                      wire1[(3'h4):(1'h0)] : (wire5 ?
                          reg9 : (7'h41))) : (-wire5[(3'h6):(3'h4)])) ?
              {wire7, $signed($unsigned(reg6))} : wire3[(3'h6):(1'h1)]));
          reg13 <= (~{wire7,
              (wire4 ?
                  (wire2 ?
                      $signed((7'h40)) : (reg6 ?
                          reg6 : reg6)) : $unsigned((|reg9)))});
          reg14 <= wire7[(2'h2):(2'h2)];
          reg15 <= reg6;
        end
      else
        begin
          reg12 <= (~|(($unsigned($unsigned(reg8)) * $unsigned(wire3[(4'hc):(4'hc)])) <= $signed({(reg8 ?
                  wire11 : wire11)})));
          reg13 <= wire2;
          reg14 <= (~^{{(wire4[(4'hd):(1'h1)] ^ wire7), (+(^~reg6))},
              (((wire0 ? (8'haf) : reg10) <= (~reg15)) ?
                  (reg10[(4'h8):(3'h6)] == reg15) : ((wire11 + reg12) ?
                      $signed((8'hab)) : (reg13 ? reg9 : wire7)))});
          if (wire4[(4'hb):(1'h0)])
            begin
              reg15 <= wire7;
            end
          else
            begin
              reg15 <= $signed($signed((reg10 & reg15)));
              reg16 <= {((8'hab) == wire1[(4'h8):(1'h0)])};
              reg17 <= (+$unsigned((-reg16)));
            end
        end
    end
  assign wire18 = (~reg10);
  always
    @(posedge clk) begin
      reg19 <= (~|(8'h9c));
      if ((($signed({$signed(wire1), $signed(reg10)}) ?
          (8'hbb) : {wire5[(1'h0):(1'h0)]}) > wire18))
        begin
          reg20 <= $unsigned(wire1);
          reg21 <= $signed(reg8[(1'h1):(1'h0)]);
        end
      else
        begin
          reg20 <= wire1;
          reg21 <= reg19;
        end
      if ((~^(({reg20, reg20} ? (!$unsigned(reg19)) : {wire1}) ?
          (|$signed((reg6 >> (8'ha8)))) : (wire18[(2'h2):(1'h1)] | reg19))))
        begin
          if ((reg15 >>> reg21[(1'h0):(1'h0)]))
            begin
              reg22 <= reg8[(1'h0):(1'h0)];
              reg23 <= wire3[(3'h7):(1'h1)];
              reg24 <= (~|$unsigned(wire4));
              reg25 <= $signed((wire0[(3'h7):(3'h4)] ?
                  (!(-$signed(reg6))) : wire5));
            end
          else
            begin
              reg22 <= wire2[(3'h5):(1'h1)];
              reg23 <= wire1[(4'h9):(4'h8)];
              reg24 <= (^((((reg19 ? wire4 : wire7) ?
                      $signed(reg6) : {reg24, reg8}) ?
                  reg13[(2'h2):(2'h2)] : (wire18[(2'h3):(2'h2)] >= reg10)) >> wire18[(2'h3):(1'h1)]));
            end
        end
      else
        begin
          if ((~&(~|$unsigned(wire18[(1'h1):(1'h1)]))))
            begin
              reg22 <= (reg17 * reg10[(3'h7):(3'h6)]);
              reg23 <= ($unsigned($unsigned(reg19)) <= $unsigned($unsigned((reg23 ?
                  (reg10 ? reg14 : reg22) : (~^(8'ha5))))));
              reg24 <= $signed($unsigned((~&(~reg16))));
              reg25 <= (((~|$signed(wire11)) ?
                  $signed($unsigned(reg19)) : (-(reg9[(1'h1):(1'h0)] ?
                      (reg14 <<< reg23) : wire3))) && (wire0[(2'h3):(2'h3)] ?
                  reg23 : ({(wire2 ? reg16 : reg15), (reg20 - wire18)} ?
                      wire18[(3'h4):(2'h2)] : $unsigned({wire1, reg15}))));
              reg26 <= reg24[(3'h5):(2'h2)];
            end
          else
            begin
              reg22 <= wire7[(1'h1):(1'h0)];
            end
        end
      reg27 <= ((((~&{reg13}) ?
              ((reg12 ^ reg19) ~^ $signed((7'h40))) : $signed(((8'ha4) >>> (8'ha0)))) || $unsigned($signed(reg8))) ?
          $signed($signed(reg21[(2'h2):(2'h2)])) : (~&reg24));
    end
endmodule
