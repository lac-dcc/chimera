module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire26,
                 wire20,
                 wire14,
                 wire13,
                 wire7,
                 wire6,
                 wire5,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (wire1 ?
                     (wire0 ? $unsigned($signed((~^wire1))) : wire4) : wire4);
  assign wire6 = $signed((wire3 ?
                     wire5 : $signed((wire5[(4'ha):(3'h7)] ~^ {wire1}))));
  assign wire7 = ($unsigned(({wire0[(3'h7):(3'h6)]} ?
                     wire5 : (8'ha6))) ^ wire5[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg8 <= (+{$unsigned(wire5), wire0});
      reg9 <= $signed($unsigned(wire0));
      reg10 <= $signed((8'hb9));
      reg11 <= (~(-(~&wire1)));
      reg12 <= wire6;
    end
  assign wire13 = wire0[(4'ha):(3'h6)];
  assign wire14 = reg10[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if (wire13[(3'h4):(1'h0)])
        begin
          reg15 <= wire14[(3'h6):(2'h2)];
          if ((&$signed(wire1)))
            begin
              reg16 <= $unsigned($unsigned(({(wire6 ? wire4 : wire1), wire4} ?
                  (8'hbd) : wire7)));
              reg17 <= reg11[(1'h0):(1'h0)];
              reg18 <= ((wire5 || (8'ha5)) ?
                  $signed(wire7) : (reg10 ?
                      (({reg10} ?
                          (reg10 ^ wire6) : (^wire4)) | reg16[(2'h3):(1'h0)]) : $signed($signed((-wire6)))));
            end
          else
            begin
              reg16 <= {$unsigned($unsigned((reg12 && reg15[(3'h5):(3'h4)])))};
            end
          reg19 <= (+$unsigned((8'hb1)));
        end
      else
        begin
          reg15 <= ($signed((|(reg15 ?
                  wire5[(4'he):(4'h9)] : $unsigned(wire4)))) ?
              wire3[(2'h3):(2'h2)] : ((($signed(reg11) & (reg12 >>> wire3)) ?
                      wire7 : ($signed(reg17) & (reg11 ? reg8 : wire6))) ?
                  $signed($signed((~&(8'hbf)))) : {{reg18,
                          wire4[(2'h2):(2'h2)]},
                      (wire13 & $unsigned(wire6))}));
          reg16 <= {{$unsigned($signed((wire4 ? reg17 : (8'ha6)))),
                  (reg16 ? reg10 : reg19)}};
          reg17 <= ($signed(wire0[(4'he):(4'ha)]) >>> wire3);
        end
    end
  assign wire20 = {$unsigned((&(!(!wire1))))};
  always
    @(posedge clk) begin
      if ({wire13})
        begin
          reg21 <= $signed(wire5);
        end
      else
        begin
          reg21 <= ((&($unsigned((~&reg19)) <<< $signed((~&wire13)))) ?
              ({reg8} ?
                  ($signed(wire20) <<< (7'h44)) : (^$signed((reg10 ~^ (8'had))))) : ((!{(+wire5),
                      (&wire1)}) ?
                  (($unsigned((8'hb5)) - $signed(reg17)) >= $signed((~wire7))) : wire5[(3'h5):(2'h2)]));
          reg22 <= {$unsigned(wire14[(5'h14):(5'h12)])};
          reg23 <= (($signed((wire5[(4'hf):(4'hc)] || (wire1 + (7'h44)))) >= wire5[(3'h5):(1'h0)]) ?
              wire20 : ($signed({$signed(reg17),
                  reg9[(1'h0):(1'h0)]}) != reg22[(1'h1):(1'h0)]));
          reg24 <= wire20;
          reg25 <= reg11;
        end
    end
  assign wire26 = ($unsigned((8'hb7)) ? reg21 : (|reg9[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg27 <= $unsigned({$unsigned({$signed(wire3)})});
      reg28 <= (+{$unsigned($unsigned($signed(reg12))),
          $signed($unsigned(reg19))});
      reg29 <= ((({$signed(wire5), $unsigned(reg19)} ?
                  ((-reg11) ?
                      wire2[(3'h4):(1'h0)] : $unsigned((7'h44))) : reg9) ?
              $signed($unsigned($signed(reg16))) : wire7[(4'hb):(3'h4)]) ?
          $unsigned(reg23[(3'h6):(1'h1)]) : wire4[(4'h8):(3'h4)]);
      if (((|$unsigned($signed({wire2,
          (8'hb2)}))) <<< ((~^$unsigned((~reg18))) ?
          reg19[(3'h4):(1'h1)] : (7'h42))))
        begin
          reg30 <= (({$unsigned($signed(wire4)), {$unsigned(reg17)}} ?
              $signed((&$unsigned(reg15))) : {reg28[(4'ha):(4'ha)]}) <<< ($unsigned(reg9) ?
              $unsigned((~|(reg23 ?
                  wire4 : reg23))) : $unsigned(reg16[(1'h0):(1'h0)])));
          if ($signed((!((~$unsigned(wire13)) <<< (~|reg25[(3'h4):(1'h0)])))))
            begin
              reg31 <= reg24;
              reg32 <= ($unsigned((8'hae)) ^~ reg25);
              reg33 <= wire5;
            end
          else
            begin
              reg31 <= (~|((~^({reg25} == ((7'h41) ? (8'had) : wire6))) ?
                  reg10[(3'h4):(2'h3)] : $unsigned({reg30,
                      (reg10 - (8'hbd))})));
            end
          if (($unsigned(wire3) ^~ $signed($unsigned((reg24[(3'h6):(2'h3)] ?
              (&wire7) : reg22)))))
            begin
              reg34 <= ($unsigned((({wire0, reg8} ?
                  (reg15 - reg12) : ((8'haf) > reg9)) | $signed((wire2 || reg9)))) & reg27[(3'h7):(1'h0)]);
              reg35 <= (~&reg27);
              reg36 <= reg35[(2'h3):(1'h1)];
              reg37 <= {(wire4[(5'h10):(4'h8)] ? reg12 : wire4[(3'h6):(3'h4)])};
            end
          else
            begin
              reg34 <= reg29[(3'h6):(1'h0)];
              reg35 <= reg27;
              reg36 <= reg30[(2'h3):(1'h0)];
              reg37 <= $signed(wire13[(2'h2):(1'h1)]);
            end
          reg38 <= $unsigned(reg28);
          reg39 <= reg12;
        end
      else
        begin
          reg30 <= reg19[(1'h1):(1'h0)];
          reg31 <= reg16;
          reg32 <= $signed(reg39[(3'h7):(3'h7)]);
          reg33 <= ($unsigned((+($signed(reg18) >= (wire0 ?
              wire7 : wire4)))) * (~{$unsigned(reg10)}));
          if ($unsigned(reg22[(3'h5):(3'h5)]))
            begin
              reg34 <= $signed((|(8'hbb)));
            end
          else
            begin
              reg34 <= wire4[(4'ha):(3'h4)];
            end
        end
    end
  assign wire40 = wire14[(4'ha):(2'h3)];
  assign wire41 = $unsigned((~{((reg11 + reg18) ?
                          reg34[(2'h3):(1'h1)] : $unsigned(reg38)),
                      reg8[(1'h0):(1'h0)]}));
endmodule
