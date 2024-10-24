module top
#(parameter param41 = (~{((-(8'ha8)) ? (((7'h44) ^~ (8'h9f)) != {(8'hb0)}) : (((8'ha3) == (8'had)) ? (|(8'h9d)) : ((8'hb3) == (8'hb7))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire22,
                 wire21,
                 wire6,
                 wire5,
                 wire4,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 (1'h0)};
  assign wire4 = $signed(wire2);
  assign wire5 = $unsigned({wire4[(5'h10):(4'ha)],
                     ($signed($unsigned((8'h9d))) ?
                         (wire0 ?
                             {wire0,
                                 wire1} : wire0[(1'h0):(1'h0)]) : ({wire2} + $signed(wire2)))});
  assign wire6 = ((($unsigned(wire2) ^~ ($signed(wire2) ?
                         (wire1 | wire4) : wire5[(2'h2):(2'h2)])) << wire5) ?
                     (|(~|$signed(wire5))) : (-wire2[(4'hb):(3'h4)]));
  always
    @(posedge clk) begin
      if ((~|$unsigned(wire2)))
        begin
          reg7 <= wire6[(4'h9):(4'h9)];
        end
      else
        begin
          reg7 <= $signed($signed(wire3));
          if ({$unsigned((-(reg7[(1'h1):(1'h1)] >> (wire0 || wire4)))), wire1})
            begin
              reg8 <= $signed(wire1);
              reg9 <= reg7;
              reg10 <= wire4[(4'hd):(4'h9)];
              reg11 <= wire3;
            end
          else
            begin
              reg8 <= wire5[(4'hc):(2'h3)];
            end
          reg12 <= wire4;
          reg13 <= $unsigned(((~&$unsigned(wire2[(4'hd):(2'h3)])) ?
              wire3[(4'hb):(4'h9)] : (reg10 ?
                  wire3[(2'h2):(2'h2)] : ((8'hbc) ? reg11 : (&wire6)))));
          reg14 <= ((&(reg13 ?
              {$signed(reg10),
                  $unsigned(reg13)} : $signed((wire6 <= reg11)))) ^ ($unsigned($unsigned($signed(reg7))) <= {(|(reg9 ?
                  reg7 : reg9))}));
        end
      if ($signed(reg10[(4'hf):(2'h3)]))
        begin
          if ($unsigned($signed({((8'hb9) | (reg9 ? reg13 : wire6)), reg8})))
            begin
              reg15 <= (wire0 ?
                  {($signed($signed(reg9)) && reg13)} : ((8'hbf) == (reg11 & ((wire4 != (8'hb4)) ?
                      $signed((8'h9c)) : $unsigned(reg10)))));
              reg16 <= ($unsigned($unsigned(((~&reg15) ?
                  (reg11 ? wire5 : wire5) : (~^wire3)))) >= wire0);
              reg17 <= (!({$signed(wire1),
                  ((~|reg8) ?
                      (wire5 && wire0) : (reg13 + reg13))} ^ $unsigned(wire2[(4'hf):(4'he)])));
            end
          else
            begin
              reg15 <= reg12[(4'hf):(4'hb)];
              reg16 <= $unsigned(((~^(wire5[(4'ha):(4'h8)] & $signed(reg16))) > ((wire4 > (~&reg12)) ?
                  ((wire1 ?
                      reg10 : reg12) * (~|wire3)) : (reg13 >= (~&reg12)))));
              reg17 <= wire0[(2'h2):(1'h0)];
              reg18 <= $unsigned((($signed(((8'hae) == reg13)) <= ((wire5 >> reg7) == (~|reg11))) ?
                  {(!(reg11 + reg16))} : {(-reg14[(1'h1):(1'h1)]), wire2}));
              reg19 <= (($unsigned((reg11 ? $signed(reg8) : wire5)) ?
                  $unsigned((wire1 ?
                      {(8'ha3)} : (reg16 != reg8))) : $unsigned((~|{reg8,
                      wire5}))) & reg17[(3'h6):(3'h4)]);
            end
          reg20 <= ((~|(^~$unsigned((wire2 ? wire4 : reg11)))) ? reg19 : reg11);
        end
      else
        begin
          reg15 <= (^reg15[(2'h2):(1'h1)]);
          reg16 <= (~|reg13);
        end
    end
  assign wire21 = {(8'ha1),
                      ($unsigned(({(8'h9e)} ?
                          reg16 : reg19)) ^ (reg7 ~^ (~^(8'haa))))};
  assign wire22 = reg7[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg23 <= wire2[(4'ha):(4'h8)];
      if ((wire3[(2'h3):(2'h3)] ?
          reg19 : $unsigned($signed(((-reg8) < (reg18 - reg10))))))
        begin
          reg24 <= ((^($unsigned((8'ha8)) << $signed((+reg19)))) ?
              reg12 : (~^(((wire22 < wire22) >> $unsigned(wire0)) ?
                  $signed({wire1, reg12}) : ($unsigned(reg17) ?
                      (8'hba) : (wire2 || reg11)))));
          if ((~&($unsigned((-{wire21, reg8})) ?
              ($signed(((8'ha8) ? (8'haa) : (8'ha9))) ?
                  (reg10 & reg11) : ($unsigned(reg11) ?
                      $unsigned(reg7) : (wire4 ?
                          wire4 : reg17))) : ($unsigned((reg19 ?
                      wire5 : wire6)) ?
                  $unsigned((~^reg8)) : reg19[(4'he):(3'h4)]))))
            begin
              reg25 <= reg17[(3'h6):(3'h5)];
              reg26 <= wire5[(4'ha):(4'ha)];
              reg27 <= (!$signed($signed($signed($unsigned(reg15)))));
            end
          else
            begin
              reg25 <= {$unsigned($signed((&$signed((8'h9f))))),
                  ((wire0[(3'h5):(3'h4)] ?
                      {(~reg18),
                          {reg13}} : $unsigned(reg18)) - (($signed(reg9) ?
                          (^~wire3) : reg8) ?
                      (-wire5) : $unsigned({wire22})))};
              reg26 <= ({(reg18[(4'h9):(4'h8)] ?
                      ($signed(wire1) ?
                          {(8'ha9)} : (wire4 <= reg16)) : (8'haa))} ^~ (~&($unsigned((reg9 ^~ reg24)) <<< ({wire21} ?
                  (reg13 ? reg7 : reg17) : (+reg18)))));
              reg27 <= $unsigned(reg12);
              reg28 <= (^wire4[(4'he):(3'h4)]);
            end
          reg29 <= $unsigned((~wire6));
          if ((8'had))
            begin
              reg30 <= $signed((((7'h42) ^ (^(~(8'hb6)))) ?
                  ($signed((reg18 ? reg29 : reg25)) ?
                      $unsigned((~|wire5)) : ((wire21 == wire0) ~^ $unsigned(reg17))) : (8'h9f)));
              reg31 <= (wire3 ?
                  $signed(reg23[(1'h1):(1'h1)]) : (reg19[(1'h1):(1'h0)] >= ((wire2[(4'hb):(1'h1)] < $unsigned(wire21)) ?
                      (8'haf) : ((reg17 || reg30) <= {wire0}))));
            end
          else
            begin
              reg30 <= wire21;
              reg31 <= ((+(8'ha7)) ? reg27[(3'h6):(2'h3)] : reg10);
              reg32 <= (reg30 * reg29[(4'hb):(4'hb)]);
              reg33 <= $unsigned((-(reg29[(4'h8):(1'h1)] | (+(|wire0)))));
            end
          reg34 <= $unsigned(wire2[(3'h7):(2'h3)]);
        end
      else
        begin
          reg24 <= ($unsigned($unsigned(reg11)) ?
              (reg17[(2'h3):(1'h1)] ?
                  ($signed((^(8'hb6))) ~^ $signed((reg28 ?
                      wire4 : (8'hb4)))) : (-$signed((reg29 ?
                      reg32 : reg27)))) : wire5);
          reg25 <= (($signed((reg12[(4'hb):(4'ha)] ?
              $signed(wire22) : (^~wire4))) ^ (~^(reg23[(1'h1):(1'h1)] + {(8'hb1)}))) == (~&reg16[(1'h0):(1'h0)]));
        end
    end
  assign wire35 = reg7[(3'h4):(1'h1)];
  assign wire36 = reg19;
  assign wire37 = {$signed($unsigned(wire1))};
  assign wire38 = $unsigned($signed(wire37));
  assign wire39 = $unsigned(wire4[(4'ha):(4'ha)]);
  assign wire40 = ({({(reg30 ? reg30 : (8'ha6))} ?
                          reg25[(3'h4):(3'h4)] : reg24[(1'h1):(1'h0)])} | wire38);
endmodule
