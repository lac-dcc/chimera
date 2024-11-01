module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  assign y = {wire20,
                 wire19,
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
                 reg7,
                 (1'h0)};
  assign wire5 = ($unsigned(wire1) ~^ wire3[(2'h3):(1'h0)]);
  assign wire6 = ($unsigned({($unsigned(wire1) ^~ (&wire5)),
                         (wire4 || (wire3 | wire4))}) ?
                     (~|wire3) : ({{wire4}, (+wire1)} ?
                         (-$unsigned({wire2})) : wire2));
  always
    @(posedge clk) begin
      reg7 <= (($signed(wire6) ?
          (wire4[(4'he):(3'h4)] ?
              (((8'ha2) ?
                  wire2 : wire6) >>> wire4[(3'h6):(1'h0)]) : wire2) : $signed((-(wire4 ?
              (8'haa) : wire3)))) * ((!wire2) ?
          (($unsigned(wire2) * wire1[(4'hc):(1'h0)]) * wire3[(1'h0):(1'h0)]) : $unsigned((wire3[(3'h4):(1'h0)] ^~ wire6))));
      reg8 <= wire5[(4'hb):(3'h5)];
      reg9 <= reg8;
      if ((+(wire5[(2'h2):(2'h2)] ?
          $unsigned({(~reg9)}) : wire5[(4'h8):(3'h4)])))
        begin
          reg10 <= wire6[(3'h5):(3'h4)];
          reg11 <= (wire6[(2'h3):(1'h0)] ? wire2 : {reg8[(1'h1):(1'h1)]});
          reg12 <= $signed($signed($signed(wire4[(5'h14):(3'h4)])));
          reg13 <= $signed({wire5, reg9[(4'h9):(4'h9)]});
        end
      else
        begin
          if ((reg11[(3'h5):(2'h2)] ? wire6 : $signed(reg11[(2'h2):(1'h1)])))
            begin
              reg10 <= $unsigned(reg8[(4'ha):(2'h2)]);
              reg11 <= wire4;
              reg12 <= {$unsigned($signed({wire0[(1'h0):(1'h0)],
                      $unsigned(wire1)}))};
              reg13 <= {(reg12 < (~$unsigned(wire0))), {wire3, reg13}};
            end
          else
            begin
              reg10 <= {(((-(&reg8)) + $unsigned(((8'ha0) == reg11))) > (~((^reg11) << (7'h42))))};
              reg11 <= (!$unsigned($unsigned((reg7 ^~ reg12[(1'h0):(1'h0)]))));
              reg12 <= wire3[(3'h7):(1'h1)];
              reg13 <= $signed({{wire2, (8'haa)},
                  (reg8 ?
                      ((wire3 && (8'ha1)) & $signed(reg9)) : reg12[(2'h3):(1'h1)])});
            end
          reg14 <= wire0;
          if ((^{(((wire3 != reg11) ? reg14[(5'h11):(3'h4)] : $signed(reg9)) ?
                  $unsigned((reg8 == reg7)) : {(reg13 == wire3)})}))
            begin
              reg15 <= ((!{reg12,
                  $unsigned((wire2 != wire0))}) << $signed(reg8[(2'h3):(1'h1)]));
              reg16 <= $signed($signed((^~$unsigned($unsigned(reg12)))));
            end
          else
            begin
              reg15 <= {$unsigned($signed(wire6[(3'h6):(2'h2)])),
                  ($signed((((8'ha9) + reg16) != reg13)) - ($signed((|reg15)) ^ reg13[(4'hf):(1'h1)]))};
              reg16 <= reg16;
            end
          reg17 <= $unsigned(($signed(reg12) ?
              (((reg7 ? wire5 : (8'ha3)) ?
                      {reg15, reg10} : ((8'hb7) ? wire4 : reg8)) ?
                  wire1[(2'h3):(2'h2)] : {(reg16 >>> wire6),
                      wire3[(3'h5):(2'h2)]}) : (~&wire5[(3'h6):(1'h1)])));
          reg18 <= wire0[(4'hf):(4'he)];
        end
    end
  assign wire19 = (wire4 - reg15);
  assign wire20 = reg8;
endmodule
