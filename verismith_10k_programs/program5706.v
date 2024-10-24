module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire29,
                 wire26,
                 wire25,
                 wire24,
                 wire5,
                 reg28,
                 reg27,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire3[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg6 <= $unsigned((~|(|wire1[(5'h12):(1'h1)])));
      reg7 <= $signed($signed(wire4[(3'h4):(2'h2)]));
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg7[(4'hf):(4'h8)]))
        begin
          reg8 <= (~&((reg6[(1'h1):(1'h1)] ?
                  {(wire3 ? reg7 : wire4),
                      (wire0 ? wire2 : wire3)} : (~^$signed(wire5))) ?
              ((8'haa) ?
                  wire4[(4'hc):(3'h4)] : (7'h43)) : ((~$unsigned(wire4)) ?
                  (+$unsigned(wire3)) : (|(reg6 << reg6)))));
          reg9 <= (~$unsigned($signed((reg7 >> $unsigned(wire5)))));
          if ($signed({(($unsigned(reg9) ? {reg7, wire1} : (reg6 < wire4)) ?
                  ($signed((8'hbd)) ?
                      wire5[(4'h9):(3'h5)] : $signed((8'had))) : $signed((reg9 && wire0)))}))
            begin
              reg10 <= $signed(reg7[(3'h4):(2'h2)]);
              reg11 <= $unsigned(((wire3 ?
                  (&$unsigned(wire2)) : $signed(reg6[(1'h0):(1'h0)])) << {($signed(wire3) ?
                      reg7[(5'h11):(1'h1)] : $signed((7'h41))),
                  wire0[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg10 <= wire3[(4'hc):(3'h7)];
              reg11 <= reg9;
              reg12 <= reg9;
              reg13 <= ($unsigned($signed(reg7)) <= reg11[(3'h7):(1'h0)]);
            end
          reg14 <= ((7'h41) ?
              ((^~$unsigned($unsigned(reg10))) ?
                  $unsigned($signed(reg11[(1'h0):(1'h0)])) : (reg9 ?
                      wire5[(4'he):(4'h9)] : wire1[(1'h1):(1'h1)])) : (~$unsigned((reg13[(4'ha):(1'h1)] << $unsigned((8'hbc))))));
        end
      else
        begin
          reg8 <= (wire4[(4'hc):(1'h1)] ? reg8[(1'h0):(1'h0)] : wire0);
          reg9 <= $unsigned((wire5[(3'h5):(3'h4)] && {reg11[(3'h4):(2'h3)],
              (((8'hb8) ? (8'h9f) : (8'hb5)) ?
                  $signed(wire1) : reg14[(1'h1):(1'h1)])}));
          if (($signed($signed($signed(((8'hb0) ? (8'hb1) : reg10)))) ?
              $unsigned(reg13) : $signed((reg11 ?
                  $signed((wire0 ?
                      reg14 : reg9)) : $unsigned(reg14[(2'h2):(2'h2)])))))
            begin
              reg10 <= (^~{{(-reg7), (&$unsigned(wire0))}});
            end
          else
            begin
              reg10 <= wire5;
            end
          reg11 <= $unsigned((~$signed(((wire1 ? wire1 : wire3) == {wire1,
              reg6}))));
        end
      reg15 <= reg13[(3'h5):(1'h1)];
      if (((reg13[(3'h7):(3'h6)] ?
          $signed(reg11) : $unsigned(((reg13 > (8'hab)) << (wire0 ?
              wire5 : wire3)))) <<< $signed((8'hb5))))
        begin
          reg16 <= $unsigned(((wire5 > ((&wire2) >= (~&wire2))) - (~|wire3[(3'h4):(2'h3)])));
          reg17 <= wire1[(2'h3):(1'h0)];
          if (reg14[(3'h6):(3'h5)])
            begin
              reg18 <= {$unsigned(reg6)};
              reg19 <= (~^(~|$unsigned((reg11 ? (^(7'h43)) : $signed(reg10)))));
              reg20 <= (8'had);
              reg21 <= (reg7 <= $signed((-(((7'h40) == wire5) * reg16))));
              reg22 <= wire3[(4'hf):(4'hf)];
            end
          else
            begin
              reg18 <= $signed((reg19 ?
                  (wire3 <= (wire0 >> ((8'hba) >> (8'hb3)))) : $unsigned(reg22[(1'h0):(1'h0)])));
              reg19 <= (reg15[(2'h2):(1'h1)] ?
                  (($signed({reg10}) < {$unsigned(reg8)}) | ($signed($unsigned(reg15)) ?
                      $unsigned(reg20[(3'h4):(2'h2)]) : (wire1 ?
                          reg17 : reg10[(3'h5):(3'h5)]))) : (8'h9d));
              reg20 <= wire2;
              reg21 <= reg20;
            end
          reg23 <= $signed(($unsigned($unsigned((reg9 <<< reg22))) & (((reg22 >>> wire0) ?
                  wire1[(1'h1):(1'h0)] : $unsigned(reg6)) ?
              $unsigned($signed((8'hb3))) : ($unsigned((8'h9e)) ?
                  reg9[(2'h2):(1'h1)] : {reg12, reg7}))));
        end
      else
        begin
          reg16 <= (~((~|$unsigned($unsigned(reg7))) ?
              {$signed((|reg10)),
                  ((wire3 ? reg8 : wire4) ?
                      (|wire1) : (reg19 <= reg9))} : $signed(reg7)));
          reg17 <= (reg18[(2'h2):(1'h0)] == reg7[(1'h1):(1'h0)]);
          reg18 <= reg20[(3'h5):(3'h5)];
          reg19 <= (~(&wire5));
        end
    end
  assign wire24 = reg8;
  assign wire25 = $signed(reg11[(3'h7):(1'h1)]);
  assign wire26 = $unsigned({{wire4, (~&reg23)},
                      ($unsigned($unsigned(reg6)) < (reg23 ?
                          $unsigned((8'h9e)) : $unsigned((7'h40))))});
  always
    @(posedge clk) begin
      reg27 <= (~^wire24);
      reg28 <= reg9[(1'h0):(1'h0)];
    end
  assign wire29 = (~&$signed($unsigned(wire25)));
endmodule
