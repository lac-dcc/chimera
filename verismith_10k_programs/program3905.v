module top
#(parameter param37 = ((8'ha8) ? {(((~(8'hbf)) ^~ ((8'hb6) ~^ (8'hb9))) < (((7'h42) ? (7'h44) : (8'h9d)) || {(8'h9c)}))} : ((8'h9f) ? ((((8'hba) ? (8'hbb) : (8'ha3)) <<< {(8'h9d)}) ? (^{(8'ha6), (8'h9d)}) : (((8'h9d) ? (8'haa) : (8'hb3)) ^~ ((8'hb0) ? (8'ha4) : (8'ha8)))) : ((8'h9c) ? (((8'hb0) ? (8'ha2) : (8'hae)) < {(8'ha5), (7'h44)}) : (+(~&(8'h9d)))))), 
parameter param38 = {((^~((param37 || param37) <<< (param37 ? param37 : (8'ha9)))) ? (((|param37) & (param37 ? param37 : param37)) ? {(param37 ? param37 : param37), param37} : ((+param37) ? (^~param37) : (param37 ? param37 : param37))) : (((-param37) ? {param37} : param37) >= ((param37 ? param37 : param37) ? param37 : (+param37)))), ({(&param37)} ? ((7'h42) <<< param37) : (~^{(param37 + param37)}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire33,
                 wire23,
                 wire22,
                 wire21,
                 wire6,
                 wire5,
                 wire4,
                 reg36,
                 reg35,
                 reg34,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
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
  assign wire4 = {{{$signed($unsigned((8'hb2))), wire0[(3'h5):(1'h1)]},
                         $unsigned($unsigned({wire2, wire1}))}};
  assign wire5 = $signed(wire4);
  assign wire6 = $signed($signed((wire5[(4'ha):(3'h5)] ? wire0 : wire2)));
  always
    @(posedge clk) begin
      reg7 <= $signed(({((wire5 <= wire2) ^ $unsigned(wire5))} ?
          wire5[(4'h9):(2'h3)] : $signed(($signed(wire3) | $unsigned(wire2)))));
      if (({{reg7}, {wire0}} || (wire4[(3'h7):(3'h4)] ?
          {((|reg7) ^~ wire0[(4'hd):(4'ha)])} : (7'h41))))
        begin
          reg8 <= $unsigned($unsigned(((wire3 ?
              (wire2 ? wire4 : wire2) : {wire3, wire6}) >= wire3)));
          reg9 <= (wire5[(3'h4):(1'h0)] >> $unsigned(reg7[(2'h3):(2'h3)]));
          reg10 <= (($signed(wire4[(1'h1):(1'h0)]) ?
              $unsigned(wire3[(4'h9):(3'h4)]) : $unsigned(reg8)) && {{wire5[(3'h7):(3'h5)],
                  reg8[(3'h4):(3'h4)]},
              reg7[(4'hd):(3'h7)]});
        end
      else
        begin
          if ((($unsigned($unsigned((&wire4))) ?
              {(8'hb8),
                  $unsigned((!wire2))} : (!$unsigned($signed(wire1)))) ^ (|(($signed((8'h9e)) > $unsigned((8'ha1))) == $signed((reg7 ?
              reg7 : reg10))))))
            begin
              reg8 <= (wire0[(3'h5):(1'h1)] || $signed((8'hb8)));
              reg9 <= reg9;
            end
          else
            begin
              reg8 <= $signed({wire5[(1'h0):(1'h0)], (~^{(~|wire2)})});
            end
          reg10 <= $unsigned(reg9[(3'h5):(1'h0)]);
          reg11 <= $signed((~&wire5));
        end
    end
  always
    @(posedge clk) begin
      reg12 <= (+(^$unsigned(((!wire1) ? {reg8} : reg11[(4'hf):(4'he)]))));
      if ((~&((+wire1) ?
          reg12 : (!(((7'h41) ? wire5 : reg11) <= ((8'hb8) * (8'h9d)))))))
        begin
          reg13 <= (&$unsigned((reg9 ^~ $signed($unsigned(reg10)))));
          reg14 <= ($unsigned($signed($signed(reg12[(2'h3):(2'h3)]))) & wire5[(1'h0):(1'h0)]);
          reg15 <= (~(reg12[(1'h0):(1'h0)] ?
              ($signed((wire2 << (8'hbf))) ?
                  ({(8'ha0)} ?
                      (reg7 != wire0) : (reg8 ?
                          reg10 : (8'hb3))) : $signed(((8'ha0) ?
                      wire3 : reg12))) : (8'h9d)));
          reg16 <= (&((wire2 ? reg12 : (~&(&wire4))) ?
              $unsigned(reg10) : (~|reg15[(1'h0):(1'h0)])));
        end
      else
        begin
          reg13 <= ((($signed((reg14 << wire6)) ?
                  ($unsigned(reg11) >= (wire3 ?
                      wire3 : (8'hb6))) : ($unsigned(reg7) ?
                      $signed(wire6) : wire2)) ?
              $signed((^{reg10})) : (~((8'hbf) ?
                  (reg12 ?
                      wire0 : wire4) : wire4[(2'h3):(1'h1)]))) < ($unsigned($signed(wire6[(4'hb):(4'h8)])) ?
              reg11 : (!wire1[(4'h9):(4'h9)])));
        end
      if (((&wire3[(4'hb):(4'ha)]) ?
          $signed(((reg11[(4'h8):(3'h4)] ? {reg9, (8'hb6)} : (^~wire4)) ?
              $unsigned(wire0[(2'h2):(2'h2)]) : wire2[(3'h4):(3'h4)])) : wire4))
        begin
          reg17 <= reg13;
          reg18 <= $unsigned((($unsigned(wire3) ?
                  ((wire6 ? wire2 : reg15) ?
                      $signed(reg10) : {reg9, wire0}) : reg14) ?
              $unsigned($unsigned(((8'ha8) ?
                  reg11 : wire6))) : ({(reg12 > reg7), reg9} ?
                  $unsigned(((8'ha1) ?
                      (8'h9d) : reg16)) : wire0[(3'h7):(3'h6)])));
          reg19 <= ((8'hba) ?
              $unsigned($signed(reg10)) : ((((+reg13) ?
                      (reg17 ? reg18 : wire2) : $unsigned(reg7)) & ((reg10 ?
                      reg15 : reg18) >> $unsigned(reg7))) ?
                  $signed((&(-reg17))) : wire5[(3'h4):(2'h3)]));
          reg20 <= ((^wire6) && ({reg14, {$signed(reg18), $unsigned(reg9)}} ?
              $unsigned(reg19) : (+reg14)));
        end
      else
        begin
          reg17 <= (((wire3[(3'h4):(2'h2)] ?
              $unsigned((wire5 ? wire0 : reg19)) : $unsigned((reg13 ?
                  reg11 : wire2))) >>> (((reg12 >> (8'hbb)) ?
                  $signed((8'ha7)) : $unsigned(reg14)) ?
              $unsigned(reg9) : reg16[(3'h7):(3'h4)])) ^~ {$unsigned($unsigned(reg18[(1'h1):(1'h1)]))});
          reg18 <= reg18[(1'h0):(1'h0)];
        end
    end
  assign wire21 = (({reg9[(4'ha):(1'h1)]} ? (^(7'h44)) : $unsigned(wire2)) ?
                      ($unsigned((-$signed((8'hb4)))) ?
                          ({$signed(reg14)} & $signed($unsigned(reg7))) : $signed($unsigned((8'haf)))) : reg12);
  assign wire22 = $unsigned(($unsigned($unsigned($signed(reg13))) || $signed({(reg10 * wire21)})));
  assign wire23 = $unsigned(reg18);
  always
    @(posedge clk) begin
      reg24 <= wire2[(3'h7):(3'h4)];
      if ($unsigned($signed($unsigned((~(wire3 | reg18))))))
        begin
          reg25 <= ($signed((^$unsigned($signed(reg18)))) ?
              wire3 : ($signed(((~wire4) >= wire5)) ?
                  wire2 : ((~(!(8'hb1))) && reg19)));
          reg26 <= (~^(reg16 ? wire2 : reg8[(4'hc):(4'h8)]));
        end
      else
        begin
          reg25 <= $unsigned((reg8[(5'h11):(4'hf)] ? wire5 : reg26));
          reg26 <= $unsigned(reg7);
          reg27 <= wire23;
        end
      if (wire23)
        begin
          if ((~&$unsigned($signed({reg27, (~&wire6)}))))
            begin
              reg28 <= $signed((-((reg24[(4'hb):(3'h5)] ?
                  (-wire0) : (+reg15)) & (~reg16))));
            end
          else
            begin
              reg28 <= wire4[(2'h2):(1'h0)];
              reg29 <= (((wire0[(2'h3):(2'h2)] ?
                      wire21[(3'h4):(2'h3)] : $signed({reg17})) * reg14) ?
                  $signed(reg20[(3'h4):(2'h3)]) : reg11[(4'hf):(4'h8)]);
              reg30 <= (reg26[(5'h11):(4'he)] ?
                  $signed($unsigned((|wire1))) : (|{$signed(reg16),
                      ((8'ha3) ? (wire0 - reg27) : $signed((8'hbc)))}));
              reg31 <= {(~reg16),
                  ($unsigned(($signed(wire4) ?
                      {wire23} : (^~wire4))) * $unsigned(wire4[(1'h1):(1'h0)]))};
              reg32 <= wire0[(4'ha):(2'h2)];
            end
        end
      else
        begin
          reg28 <= $unsigned((reg27[(3'h6):(3'h6)] << wire6));
          reg29 <= reg12;
          reg30 <= ((|wire3[(5'h12):(2'h2)]) ?
              (reg24 ?
                  {reg13[(4'hc):(3'h4)],
                      $unsigned(reg13[(1'h0):(1'h0)])} : $unsigned($signed($unsigned(wire5)))) : (&reg11[(4'ha):(3'h6)]));
          reg31 <= reg24;
          reg32 <= (8'ha9);
        end
    end
  assign wire33 = (-{reg25[(1'h0):(1'h0)], (&wire5)});
  always
    @(posedge clk) begin
      reg34 <= ($signed($signed(((&(8'ha3)) ?
          {wire22} : reg15[(1'h1):(1'h1)]))) ~^ {$signed(reg10),
          $unsigned(reg30[(3'h5):(3'h4)])});
      reg35 <= (|$unsigned((&$signed(reg12[(2'h3):(2'h3)]))));
      reg36 <= reg15[(3'h5):(3'h5)];
    end
endmodule
