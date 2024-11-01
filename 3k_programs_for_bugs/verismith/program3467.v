module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = ($unsigned(wire4) >>> ((($unsigned(wire2) ?
                             $signed(wire3) : $signed(wire5)) ?
                         wire2[(4'h8):(3'h4)] : $unsigned({wire1, wire4})) ?
                     {{wire5[(3'h4):(2'h3)]},
                         $signed(wire0[(1'h0):(1'h0)])} : $unsigned((~&wire3))));
  assign wire7 = (8'hac);
  always
    @(posedge clk) begin
      reg8 <= $unsigned((|(^wire2)));
      if ($unsigned(wire7[(4'h9):(3'h4)]))
        begin
          reg9 <= $signed(wire3);
          if ((wire4 ?
              ((!$unsigned((wire1 ? wire7 : (8'ha0)))) ?
                  (((wire7 ? wire7 : wire0) & ((8'haa) ^ wire2)) ?
                      (wire2[(4'h9):(3'h5)] ?
                          (-(7'h43)) : {reg8}) : $unsigned((8'had))) : wire6) : $signed(reg9[(3'h7):(3'h7)])))
            begin
              reg10 <= (wire1[(5'h12):(3'h5)] ?
                  (((-$unsigned(wire2)) ? (+$signed(wire7)) : wire6) ?
                      wire3[(4'hb):(3'h4)] : wire3[(4'hf):(2'h3)]) : $unsigned((wire7 - $unsigned(wire2))));
            end
          else
            begin
              reg10 <= (-($signed($signed((~wire5))) & (wire2[(3'h7):(3'h7)] ?
                  reg9[(3'h5):(1'h0)] : wire1[(3'h7):(2'h3)])));
              reg11 <= wire0[(1'h1):(1'h1)];
              reg12 <= (reg11 ? wire2[(2'h2):(2'h2)] : wire2[(4'he):(3'h4)]);
            end
          reg13 <= (wire4[(1'h1):(1'h0)] ?
              (8'ha4) : (wire6[(2'h3):(2'h3)] > ($signed((reg8 <<< wire1)) <<< reg11[(3'h5):(2'h2)])));
        end
      else
        begin
          if ((~|$unsigned((reg8 ?
              $unsigned(wire7[(4'hc):(3'h7)]) : wire1[(2'h2):(2'h2)]))))
            begin
              reg9 <= (|wire6[(1'h0):(1'h0)]);
              reg10 <= (+wire4);
              reg11 <= (~^((~((reg8 ? reg12 : wire4) ? $signed(wire1) : reg9)) ?
                  $signed($signed((|reg8))) : {((reg9 & wire3) ?
                          (~^wire0) : (|reg9))}));
              reg12 <= ($unsigned(((~|$signed(reg9)) * {reg8})) ?
                  $unsigned((8'hbc)) : $unsigned(wire3[(3'h7):(3'h4)]));
              reg13 <= wire2[(4'ha):(3'h4)];
            end
          else
            begin
              reg9 <= $unsigned(wire0[(2'h2):(1'h0)]);
            end
        end
      reg14 <= $unsigned(wire6[(2'h3):(2'h2)]);
      if ((wire5 ?
          reg13[(2'h2):(2'h2)] : ($signed(((~(8'hb1)) << ((8'hbc) > wire4))) << reg8[(4'h8):(2'h3)])))
        begin
          reg15 <= reg14[(4'h9):(3'h5)];
          reg16 <= (($unsigned(reg15) ? reg8 : $signed({wire7})) ?
              (+((^wire0[(4'ha):(3'h7)]) ~^ reg9)) : {$unsigned({$unsigned((8'h9c))})});
          if ($signed((^~$signed($signed({(8'hbc), (8'haf)})))))
            begin
              reg17 <= $signed((~|wire3));
              reg18 <= reg14[(4'hb):(3'h7)];
              reg19 <= $unsigned((reg13 ? wire5 : reg18[(2'h3):(1'h0)]));
              reg20 <= $unsigned(reg10);
              reg21 <= reg20;
            end
          else
            begin
              reg17 <= {(^reg11[(3'h7):(3'h4)])};
              reg18 <= $unsigned(((!wire1[(2'h3):(1'h1)]) < $signed(($unsigned(reg20) ?
                  $signed(wire5) : $unsigned(reg9)))));
              reg19 <= $unsigned(wire4[(4'he):(3'h6)]);
            end
          reg22 <= ((((~^reg17) == reg11[(4'h9):(2'h3)]) ?
              (((^~reg15) ? reg15[(4'hf):(1'h0)] : (!(8'ha3))) == ((-wire7) ?
                  wire7 : (wire5 ?
                      wire5 : reg18))) : ($signed($unsigned(reg10)) ?
                  reg21 : ((8'ha5) >> (&reg21)))) + {reg16[(2'h2):(1'h0)],
              $unsigned({((8'ha5) != reg12)})});
          reg23 <= (!(reg9 >>> $signed(wire6[(2'h3):(1'h0)])));
        end
      else
        begin
          if (((reg20 >> wire2[(3'h4):(3'h4)]) && ({({reg10, wire1} ?
                      reg18[(1'h1):(1'h0)] : (~^reg14)),
                  reg23[(3'h5):(2'h3)]} ?
              (($unsigned(wire5) ?
                  $signed((8'ha6)) : (reg9 ?
                      wire3 : reg15)) - reg9) : {($unsigned((8'haa)) ^~ reg8[(3'h6):(1'h1)])})))
            begin
              reg15 <= {$unsigned($signed(reg9))};
              reg16 <= reg17[(2'h2):(1'h1)];
              reg17 <= $unsigned((^~$signed(reg16)));
              reg18 <= reg22[(5'h11):(5'h11)];
            end
          else
            begin
              reg15 <= $unsigned(reg13);
              reg16 <= (wire1 ?
                  $unsigned(reg23[(5'h11):(3'h5)]) : ((7'h44) ^ {$unsigned((reg17 ?
                          wire1 : wire4)),
                      ($unsigned(reg9) || (reg9 >> wire5))}));
            end
          reg19 <= reg17[(1'h0):(1'h0)];
          reg20 <= wire5[(4'h8):(3'h4)];
          reg21 <= (($unsigned(reg21) >= {{reg14},
              reg14[(2'h2):(1'h1)]}) * (($signed(reg20) ?
                  $unsigned({(8'h9c), (8'hb1)}) : reg13[(4'h8):(1'h1)]) ?
              reg14[(3'h4):(3'h4)] : reg10));
        end
    end
endmodule
