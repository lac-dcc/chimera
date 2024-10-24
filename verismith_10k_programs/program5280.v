module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = $unsigned($signed((~&$unsigned((wire1 >= wire2)))));
  assign wire5 = (({wire1} << $unsigned(wire0)) >= wire1[(2'h3):(1'h0)]);
  assign wire6 = (~&wire1[(1'h1):(1'h0)]);
  assign wire7 = $signed(wire2);
  always
    @(posedge clk) begin
      reg8 <= wire3[(4'hd):(4'h9)];
      reg9 <= $signed((~^$signed(wire1)));
      reg10 <= $signed(($signed(wire0[(2'h3):(1'h0)]) >> wire1));
      if ((~^{$unsigned(({reg10, wire1} | {wire3, wire2}))}))
        begin
          reg11 <= ({$signed((wire0 - ((8'hb7) >> reg9)))} < ((~(|(wire2 - wire2))) ?
              wire7 : $unsigned($signed({wire5, wire0}))));
          reg12 <= (wire1[(1'h0):(1'h0)] <= $signed((((reg11 >= wire0) ?
                  ((8'haf) > (8'hb3)) : (wire3 ? wire0 : reg8)) ?
              (wire6 ?
                  wire4[(1'h1):(1'h1)] : reg10[(1'h0):(1'h0)]) : $unsigned(reg11))));
          reg13 <= (^~((reg11[(1'h1):(1'h0)] ?
              ($signed(wire7) <= $signed((8'ha5))) : (wire4 ?
                  wire7 : {reg9, reg9})) >> wire0));
          reg14 <= (8'hbe);
        end
      else
        begin
          if (($signed((((8'hb6) ? $signed(wire4) : reg11) ?
                  {wire2} : (((8'ha8) << reg11) ?
                      reg14[(4'h8):(1'h1)] : wire6))) ?
              wire1[(3'h4):(3'h4)] : (~{$unsigned((~&wire4))})))
            begin
              reg11 <= ($unsigned({wire2,
                  (~(wire7 ? wire2 : reg13))}) - wire4[(2'h2):(1'h0)]);
              reg12 <= $unsigned($unsigned((wire0[(2'h3):(1'h0)] <<< $unsigned(((8'hb9) & wire6)))));
              reg13 <= $unsigned(wire6);
            end
          else
            begin
              reg11 <= ((~$unsigned(($unsigned((8'h9d)) ?
                      {wire0} : (wire1 && reg14)))) ?
                  wire4[(3'h5):(1'h1)] : wire7[(2'h3):(2'h3)]);
              reg12 <= {$signed((-((~wire7) ? (8'hbe) : (reg9 >= reg9)))),
                  $signed((reg13[(1'h0):(1'h0)] && ((reg9 == wire0) ?
                      $unsigned(reg8) : (!wire1))))};
            end
          if ($signed(((&(^wire0[(3'h6):(3'h5)])) > ((wire4 ?
                  wire3[(2'h3):(2'h2)] : (!reg11)) ?
              ({(7'h40)} ? $signed(wire6) : (~|reg13)) : (&(reg10 * wire4))))))
            begin
              reg14 <= (^((8'hb2) ? wire0 : $signed((~(wire2 <= reg13)))));
              reg15 <= (reg12 ?
                  $signed(($unsigned($unsigned(reg9)) <<< ((wire7 ?
                          wire4 : wire4) ?
                      (wire7 ^~ reg9) : ((8'hab) ?
                          reg11 : reg13)))) : $signed(wire2[(4'he):(3'h5)]));
              reg16 <= (8'hb8);
            end
          else
            begin
              reg14 <= (~&($signed($unsigned($unsigned((7'h44)))) ?
                  $signed(((^~reg15) ?
                      reg11[(3'h4):(1'h1)] : reg14)) : $unsigned({(~(8'hb6)),
                      (!reg11)})));
              reg15 <= $signed($signed(($unsigned($signed(reg14)) <= ($unsigned(wire4) && (~|(8'h9d))))));
              reg16 <= reg12;
              reg17 <= ((~($signed({reg10}) ?
                      wire3[(4'h9):(1'h1)] : ((reg12 ? (7'h44) : wire7) ?
                          wire2[(4'h8):(3'h6)] : $signed(reg8)))) ?
                  $signed(($unsigned(wire7) ?
                      reg12[(3'h4):(1'h1)] : $unsigned(reg10))) : wire1);
              reg18 <= (!wire4);
            end
        end
      reg19 <= ({$signed((!$unsigned(reg10))),
              {$signed($signed(reg11)), {$signed(wire2)}}} ?
          $unsigned((^$signed((wire2 != (8'hae))))) : (!(($signed(reg12) - $signed(wire3)) < ($unsigned(reg16) >>> (8'h9d)))));
    end
  assign wire20 = (^reg19[(3'h4):(2'h3)]);
  assign wire21 = $unsigned(((~|(reg14 != (wire6 ? wire1 : wire5))) ?
                      reg14[(3'h4):(3'h4)] : (!$unsigned((wire4 ?
                          wire4 : reg13)))));
  assign wire22 = reg16[(3'h4):(3'h4)];
endmodule
