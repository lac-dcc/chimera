module top
#(parameter param28 = ((~&(8'ha4)) << ((|(((8'hbc) ? (7'h40) : (8'ha1)) > ((8'hb2) << (8'ha8)))) & ((((8'ha7) < (8'hb2)) && (&(8'h9e))) && (((8'hb3) <= (7'h41)) >> ((8'hb2) != (8'hab)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire20,
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
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $signed($signed(wire2));
  assign wire5 = wire4[(2'h2):(2'h2)];
  assign wire6 = (-((~wire2[(4'hf):(4'ha)]) <= $signed((8'hbd))));
  always
    @(posedge clk) begin
      reg7 <= {wire6[(3'h6):(3'h5)]};
      if (wire2[(2'h2):(1'h1)])
        begin
          reg8 <= $signed(((!wire3[(1'h1):(1'h1)]) < wire1));
          reg9 <= ((($signed($unsigned(reg7)) ^ wire2) ?
                  $unsigned({reg8, wire6[(1'h0):(1'h0)]}) : (reg8 ?
                      $signed(wire2[(3'h4):(2'h2)]) : {wire3, wire3})) ?
              ({$unsigned(wire0[(2'h2):(1'h1)]),
                  (reg7 ?
                      (^wire1) : $signed(reg7))} >= $unsigned(wire1[(1'h0):(1'h0)])) : wire2);
          reg10 <= $unsigned($signed(($unsigned((wire0 ? wire4 : wire1)) ?
              ({wire3} ?
                  (wire3 ?
                      wire3 : wire4) : wire3[(3'h4):(1'h1)]) : ($signed(wire2) ?
                  (8'ha1) : (reg9 ? wire0 : reg9)))));
          reg11 <= reg7;
          if ((~|{reg11[(3'h6):(2'h3)]}))
            begin
              reg12 <= wire6[(4'hb):(1'h0)];
              reg13 <= wire5[(4'h8):(2'h2)];
              reg14 <= ($signed(reg9) ?
                  reg7[(1'h0):(1'h0)] : ((($signed(wire1) ? wire4 : wire6) ?
                      ((-wire5) ?
                          (~&reg10) : reg12[(4'h8):(2'h2)]) : $signed($unsigned(reg11))) * $signed($signed((reg10 + wire4)))));
              reg15 <= reg11[(3'h5):(3'h5)];
            end
          else
            begin
              reg12 <= (wire3 | $unsigned(({(wire1 ? (8'hb8) : (8'h9d)),
                      (wire1 ^~ reg14)} ?
                  $signed($unsigned(reg15)) : (8'had))));
              reg13 <= reg9;
              reg14 <= ((^(reg11 ?
                  $unsigned((reg11 ^~ wire5)) : wire6)) >= (~&$signed(((^~reg7) - $unsigned(reg7)))));
              reg15 <= $signed(((&((reg7 ? reg15 : wire1) >>> (wire5 ?
                  wire3 : reg14))) || (-({reg9} ?
                  reg9[(1'h0):(1'h0)] : reg7))));
              reg16 <= ($unsigned((8'h9d)) << {(wire4 ^ $signed({reg11,
                      reg14})),
                  $unsigned($signed({(8'ha3), wire6}))});
            end
        end
      else
        begin
          reg8 <= ({(8'hb2), (|$unsigned((!reg11)))} ?
              ({(reg15[(5'h10):(4'h9)] ?
                          {reg16, (8'h9c)} : (reg7 ? reg11 : reg15))} ?
                  wire6 : wire2[(1'h1):(1'h1)]) : $signed($signed((~(wire4 < reg12)))));
          reg9 <= reg16;
          if ({{(($unsigned(wire4) && (reg9 & reg12)) & $unsigned(((8'hbc) ?
                      wire1 : (8'ha0)))),
                  $unsigned(wire4[(1'h1):(1'h1)])}})
            begin
              reg10 <= reg15;
            end
          else
            begin
              reg10 <= $unsigned(reg12);
              reg11 <= reg16;
            end
        end
      reg17 <= {wire4, $unsigned((reg10 > $signed(reg7)))};
      reg18 <= ({((^((8'hb1) ? reg14 : reg8)) <<< (reg7 ?
              wire3[(1'h1):(1'h0)] : wire1))} ^~ (^reg16));
      reg19 <= (reg16[(3'h5):(2'h3)] != {reg18[(3'h4):(2'h2)]});
    end
  assign wire20 = $signed({reg12});
  always
    @(posedge clk) begin
      reg21 <= {(~|reg16[(2'h2):(1'h1)])};
      reg22 <= ((reg19[(3'h7):(3'h4)] >= reg8[(4'h8):(2'h3)]) ?
          (((~&(~|reg7)) ?
              ((&(7'h42)) <<< (reg15 * reg11)) : $unsigned(reg9)) > (~|(reg9 ?
              (reg13 ?
                  reg16 : reg10) : reg11[(1'h1):(1'h1)]))) : wire3[(3'h4):(3'h4)]);
    end
  always
    @(posedge clk) begin
      reg23 <= ($signed(((^$signed(reg21)) ?
          $unsigned({reg11}) : (((8'ha5) ?
              reg12 : wire2) >= reg7[(1'h1):(1'h0)]))) ^~ ((((reg10 ?
                  reg21 : (7'h44)) ?
              {wire1} : wire0) == reg15) ?
          (^((^~(8'h9f)) ? (^~wire20) : (wire1 >>> reg15))) : wire5));
      reg24 <= $unsigned((~^{reg12[(3'h6):(2'h2)], (8'ha6)}));
      reg25 <= ((!$unsigned($signed({reg7, reg11}))) ?
          $unsigned(($signed((reg15 ^ reg14)) ?
              $signed((wire5 ? wire5 : wire2)) : $unsigned((reg21 ?
                  reg8 : reg22)))) : reg21[(4'he):(1'h0)]);
      reg26 <= $signed($signed($signed(((+(8'hb8)) ?
          wire6[(2'h2):(2'h2)] : wire4))));
      reg27 <= $unsigned(((~&wire6) ?
          ((+$unsigned(reg9)) ?
              $unsigned((~^reg14)) : ((~wire4) ?
                  $unsigned(wire3) : reg14)) : ({(~&reg24), (|reg10)} ?
              (7'h43) : $signed(reg12[(1'h1):(1'h1)]))));
    end
endmodule
