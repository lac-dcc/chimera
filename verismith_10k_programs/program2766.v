module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire19,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire4[(3'h7):(2'h2)];
  assign wire6 = wire4[(5'h10):(4'he)];
  assign wire7 = {(&wire0)};
  always
    @(posedge clk) begin
      reg8 <= ($signed($unsigned(((wire4 ? wire3 : (7'h40)) ?
              (wire5 ? (8'h9d) : wire1) : $signed(wire3)))) ?
          $unsigned((wire7[(3'h4):(2'h2)] || (~&(wire0 ?
              wire7 : wire3)))) : ((wire4[(2'h2):(2'h2)] ?
              $signed((^~wire4)) : wire5[(4'he):(4'h9)]) * {$unsigned($unsigned((8'hb0)))}));
      reg9 <= (8'ha4);
      if ($unsigned($unsigned($unsigned((wire7[(3'h4):(2'h3)] ?
          (wire2 ? (7'h44) : reg9) : $unsigned(wire7))))))
        begin
          reg10 <= $unsigned((~&$signed($signed((^~wire0)))));
          if ($signed({wire7[(5'h10):(4'ha)]}))
            begin
              reg11 <= {$unsigned(wire1[(2'h2):(1'h0)]), (~|wire1)};
              reg12 <= $signed(wire0);
            end
          else
            begin
              reg11 <= (($signed($signed(wire1[(2'h3):(1'h1)])) ?
                  {reg10,
                      ($unsigned(wire1) <<< {(8'hb3)})} : $unsigned(wire3)) >>> $signed(reg9[(2'h3):(2'h2)]));
              reg12 <= ($unsigned(wire5[(1'h1):(1'h0)]) || (8'ha0));
              reg13 <= $signed(wire7);
              reg14 <= ({($signed(wire1[(1'h1):(1'h0)]) ?
                      wire4 : $signed((8'hab)))} || ($signed(reg13) ?
                  $unsigned(wire1) : reg12[(2'h3):(1'h1)]));
              reg15 <= wire3;
            end
          reg16 <= wire3[(3'h7):(3'h4)];
          reg17 <= $unsigned($unsigned($signed(((reg14 - (8'hba)) ?
              reg8 : $signed(reg11)))));
          reg18 <= wire7[(4'h9):(3'h5)];
        end
      else
        begin
          if ({wire5[(3'h7):(2'h2)],
              ($unsigned((8'hb4)) << (~^wire3[(3'h7):(1'h1)]))})
            begin
              reg10 <= reg16[(4'h9):(4'h8)];
              reg11 <= (~$unsigned((-$signed({reg14}))));
              reg12 <= (reg10[(3'h7):(3'h5)] ?
                  reg17[(4'ha):(3'h5)] : wire5[(2'h3):(1'h0)]);
              reg13 <= reg18[(1'h1):(1'h0)];
              reg14 <= (wire5[(4'hd):(3'h6)] ?
                  (((~(~^reg11)) ?
                          ({reg12} - $unsigned(wire2)) : ($signed(reg8) ?
                              (wire7 ? (8'hb4) : reg17) : $signed(reg13))) ?
                      reg9[(2'h2):(2'h2)] : {$signed(reg9)}) : (reg15 != $unsigned((8'hab))));
            end
          else
            begin
              reg10 <= reg9[(3'h6):(3'h4)];
              reg11 <= reg13[(2'h3):(1'h1)];
              reg12 <= {($unsigned(((reg17 ? (8'hbc) : wire3) ?
                      reg13[(2'h2):(1'h1)] : wire0)) >>> (($signed(reg16) ?
                          $unsigned(reg12) : (wire3 ? (8'hbb) : reg14)) ?
                      ($signed(wire5) ?
                          $unsigned(reg15) : $unsigned(reg18)) : $unsigned($signed(wire4)))),
                  (reg11[(2'h3):(1'h0)] >> reg12)};
              reg13 <= (((~^$signed((reg15 >> wire5))) ?
                      reg12[(1'h1):(1'h1)] : (!{((8'hae) ^ reg15),
                          $unsigned(wire6)})) ?
                  (~reg16[(3'h4):(2'h3)]) : $unsigned((-wire2)));
              reg14 <= (wire6 == (8'ha5));
            end
        end
    end
  assign wire19 = (((8'hb2) << (|{reg18[(4'h9):(4'h8)]})) ?
                      (8'hb9) : $unsigned((&(~^(reg18 > reg18)))));
endmodule
