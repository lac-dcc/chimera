module top
#(parameter param57 = (({{((8'hba) ? (7'h40) : (8'ha3)), {(8'ha3)}}, (((8'hac) & (8'ha3)) ? (^~(8'hb1)) : ((8'h9c) > (7'h41)))} ? ((&((8'ha0) ^ (8'ha2))) ? (|((8'h9c) ? (8'hb2) : (8'h9c))) : (~^(|(8'hb7)))) : (({(8'hac)} & ((7'h41) & (8'h9f))) ? (((8'ha4) ? (7'h41) : (7'h44)) >>> ((8'hae) && (8'ha2))) : ((&(7'h42)) <= (8'hb4)))) ? ((((~^(8'hac)) && ((8'ha9) == (8'ha7))) ? {((8'hba) ^~ (7'h44)), {(8'hbf)}} : {((8'had) <= (8'hba))}) == ((((8'hb8) ? (8'hab) : (8'haa)) >= ((8'hbc) ? (8'ha2) : (8'ha7))) ~^ ((+(8'hb0)) ? ((8'hb9) ? (8'hae) : (8'ha2)) : (~(8'haf))))) : (((((8'hb3) * (8'hb1)) ? (~^(8'hbb)) : {(7'h41)}) ? {{(8'hbb), (8'hb5)}, ((8'ha3) ~^ (8'hbc))} : {((8'hb6) == (8'had)), (~(8'hbe))}) > {({(8'h9e)} <<< (^~(8'had))), ({(8'hbf)} << {(8'ha8), (8'hab)})})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire55;
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire34,
                 wire55,
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
  assign wire4 = wire1;
  assign wire5 = $unsigned($signed(($unsigned({wire4,
                     (7'h44)}) - $signed((wire0 & wire4)))));
  always
    @(posedge clk) begin
      reg6 <= $unsigned({(wire4[(4'h9):(3'h6)] ?
              wire4 : (wire3[(4'hb):(1'h0)] <<< $unsigned(wire3))),
          (8'haf)});
      if ($signed(($signed(((~&wire4) ?
          (wire5 > wire5) : $signed(wire5))) < $signed(wire3[(4'hf):(2'h2)]))))
        begin
          reg7 <= wire1[(4'hc):(3'h6)];
          reg8 <= $signed(wire2[(1'h0):(1'h0)]);
          reg9 <= $unsigned((-$signed({(wire0 ? (8'h9c) : reg8)})));
        end
      else
        begin
          if ($unsigned(reg6[(2'h3):(1'h0)]))
            begin
              reg7 <= wire4[(2'h2):(2'h2)];
              reg8 <= reg6[(4'ha):(2'h3)];
              reg9 <= ((!(~^$signed((8'hbf)))) && wire2[(5'h11):(3'h5)]);
              reg10 <= (wire1 < reg9);
            end
          else
            begin
              reg7 <= $signed(wire3[(1'h1):(1'h0)]);
              reg8 <= $signed($signed((reg7[(2'h3):(2'h2)] ?
                  $unsigned(wire3) : $unsigned(wire2))));
              reg9 <= wire2[(4'he):(4'h8)];
              reg10 <= $unsigned((~&wire4[(3'h4):(1'h0)]));
            end
          if ($unsigned(($unsigned($unsigned((reg10 ?
              reg8 : (8'hb0)))) >>> (8'hb3))))
            begin
              reg11 <= $signed(wire3[(4'hf):(3'h7)]);
              reg12 <= (wire0 <<< $signed(wire0[(4'he):(4'he)]));
              reg13 <= reg8;
              reg14 <= (|wire0);
              reg15 <= (((((reg13 || reg11) & ((7'h43) ? reg6 : (8'ha0))) ?
                  ((wire2 ? reg9 : (8'hb1)) ?
                      wire1 : (8'hbf)) : ((wire2 * reg9) ?
                      wire2[(3'h4):(1'h0)] : reg13)) << (reg13 + $unsigned($unsigned(reg8)))) <<< wire5[(2'h2):(2'h2)]);
            end
          else
            begin
              reg11 <= wire2;
              reg12 <= {(~{$signed(reg6), $unsigned((wire5 ? reg15 : wire0))})};
              reg13 <= (($unsigned($unsigned($unsigned(reg13))) ~^ (reg14[(4'h9):(4'h8)] ?
                  reg9[(2'h3):(1'h0)] : (|reg14[(2'h2):(2'h2)]))) || $unsigned(reg8));
            end
          reg16 <= reg11[(3'h7):(3'h6)];
        end
      reg17 <= reg14[(3'h4):(1'h1)];
      reg18 <= ((~&(~$signed((reg17 ? reg14 : wire2)))) ?
          wire5[(1'h1):(1'h0)] : (+$unsigned(reg10)));
      if (({(reg18 ?
              $unsigned($unsigned(reg13)) : $signed(reg14[(1'h0):(1'h0)])),
          (~{reg17[(4'ha):(2'h2)]})} | $unsigned($unsigned(reg7))))
        begin
          reg19 <= $signed({$signed(($unsigned(reg18) ?
                  $unsigned(reg17) : (reg17 + reg6)))});
          reg20 <= $unsigned($signed((reg13[(1'h1):(1'h0)] ? reg8 : reg10)));
          reg21 <= (~|wire1);
          if (wire2[(4'he):(3'h4)])
            begin
              reg22 <= (~&((reg21[(3'h4):(2'h3)] ?
                  reg20[(5'h10):(4'hb)] : reg12[(3'h6):(1'h1)]) << reg14));
            end
          else
            begin
              reg22 <= wire4;
              reg23 <= (reg18[(4'hd):(3'h4)] ?
                  ((&((reg6 ? wire3 : wire4) ?
                      {reg20, reg18} : {(8'h9f)})) << $signed({reg6,
                      (reg20 - reg16)})) : $signed((~$unsigned((reg13 ?
                      wire1 : reg16)))));
              reg24 <= {wire2, reg10};
            end
          if ((-(8'haf)))
            begin
              reg25 <= reg13;
            end
          else
            begin
              reg25 <= (reg16 * reg22[(1'h1):(1'h1)]);
              reg26 <= (!($signed((reg13 >= (|wire3))) <<< ($signed(((8'ha6) > (8'ha7))) ?
                  ({reg13, reg10} >> {(8'hbc)}) : (!reg14))));
              reg27 <= (((wire3 >>> wire2) << ((reg14[(4'ha):(1'h0)] ?
                      (reg17 || reg20) : reg24) ~^ (reg6[(2'h2):(2'h2)] <<< (+reg15)))) ?
                  (((reg16[(3'h6):(3'h4)] | (^reg20)) ?
                          $signed(wire5) : ((~&reg24) | $signed(reg22))) ?
                      ((reg9[(1'h1):(1'h1)] ?
                          (reg21 + wire5) : $signed(reg17)) > reg17[(2'h3):(1'h1)]) : $signed(reg14)) : $unsigned(((((8'hb1) && reg9) >>> ((8'hac) ?
                          reg7 : reg9)) ?
                      $signed(wire4[(4'ha):(3'h5)]) : ($unsigned(wire3) > $unsigned(reg23)))));
            end
        end
      else
        begin
          reg19 <= (-reg22);
          if ((+($unsigned((reg17[(3'h5):(2'h2)] >= $signed(wire5))) * (!($unsigned(reg22) ?
              {reg13, reg19} : $unsigned(wire1))))))
            begin
              reg20 <= reg24[(1'h0):(1'h0)];
            end
          else
            begin
              reg20 <= reg13[(1'h0):(1'h0)];
              reg21 <= $signed($unsigned({((reg6 ?
                      reg17 : wire3) ^~ $signed(reg21))}));
              reg22 <= {$unsigned((-(+$unsigned(reg14))))};
              reg23 <= $signed(reg12[(4'hc):(4'hc)]);
              reg24 <= (reg14[(3'h7):(1'h1)] <<< $unsigned($signed(reg24[(1'h1):(1'h0)])));
            end
          reg25 <= ((&({$unsigned(reg9), $signed(wire2)} ?
              (~&(~^reg6)) : $signed((8'hbc)))) <= (~&(8'hab)));
          reg26 <= (reg20 ?
              $signed($signed($signed(reg8[(4'hf):(3'h6)]))) : {$unsigned(reg14[(4'h9):(3'h4)]),
                  (((reg6 ? (8'ha0) : reg8) ?
                          {wire4, reg25} : ((7'h44) ? (8'hbd) : reg7)) ?
                      (!(reg22 ? reg25 : reg18)) : (8'hba))});
          reg27 <= (reg7 ^ (wire2 ~^ {$unsigned((^wire3)), wire3}));
        end
    end
  always
    @(posedge clk) begin
      reg28 <= {(~|(($signed(reg23) ? {reg9, reg6} : reg25) >= ({wire4} ?
              (!wire4) : (-(8'hb6)))))};
      if (reg13[(3'h5):(2'h3)])
        begin
          reg29 <= (reg24 >= {$signed($signed($signed(reg16))), (8'ha0)});
          reg30 <= (~&((~^reg24[(1'h0):(1'h0)]) ?
              (~|(^~(~|wire4))) : $signed(((!reg13) == (~reg17)))));
          reg31 <= reg20;
          reg32 <= (reg15 ?
              $signed((~&(wire0[(1'h0):(1'h0)] ?
                  (^wire5) : {(8'hbc), wire2}))) : reg28);
          reg33 <= {(8'hb7),
              ($signed(($unsigned(reg21) ? $unsigned((8'ha4)) : (^(7'h40)))) ?
                  $signed((wire2 ? (reg25 ? reg29 : reg10) : reg24)) : reg30)};
        end
      else
        begin
          reg29 <= (~&$signed((8'hbf)));
          reg30 <= $unsigned({reg31[(4'h8):(3'h7)]});
          reg31 <= ({$unsigned({((8'hab) << (8'hb8)),
                  {reg26,
                      reg19}})} >= (reg27 == $signed($unsigned(wire0[(4'h8):(1'h1)]))));
        end
    end
  assign wire34 = $signed((reg13 | $unsigned(reg31[(3'h7):(2'h3)])));
  module35 #() modinst56 (.wire38(reg26), .wire39(reg32), .wire40(wire5), .wire36(reg19), .clk(clk), .y(wire55), .wire37(reg14));
endmodule

module module35
#(parameter param54 = {((((!(8'hbb)) ? ((8'haa) != (8'hba)) : ((8'ha8) ? (8'ha9) : (7'h43))) <<< {(8'hba), ((8'h9f) ? (8'haa) : (8'hac))}) || (&({(8'hb2), (8'hb3)} << (8'ha6)))), {{(8'h9e)}}})
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire40;
  input wire [(4'h8):(1'h0)] wire39;
  input wire signed [(3'h5):(1'h0)] wire38;
  input wire [(5'h15):(1'h0)] wire37;
  input wire signed [(4'h9):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 (1'h0)};
  assign wire41 = wire37;
  assign wire42 = (((wire39 + $signed($unsigned(wire41))) == wire38) ?
                      wire38[(2'h3):(2'h2)] : (+wire38));
  assign wire43 = (wire41[(3'h6):(1'h1)] ?
                      $unsigned((8'ha4)) : $unsigned((wire36 > wire41[(2'h3):(1'h1)])));
  assign wire44 = $unsigned($unsigned(($unsigned($unsigned(wire40)) - (((8'hb8) + wire37) ?
                      {wire40} : (~^(7'h44))))));
  assign wire45 = wire44;
  assign wire46 = (~^$signed({(wire43 | (wire37 + wire45))}));
  assign wire47 = (~(wire37 ~^ wire44[(1'h0):(1'h0)]));
  assign wire48 = wire47[(3'h6):(3'h5)];
  assign wire49 = (7'h43);
  assign wire50 = wire48;
  assign wire51 = $signed(({(~|{wire45}), (^~wire40)} ?
                      $unsigned($unsigned({wire41})) : $unsigned($unsigned((wire40 ~^ wire49)))));
  assign wire52 = $unsigned(((^wire50) ?
                      $unsigned($signed($unsigned(wire46))) : wire42[(1'h1):(1'h0)]));
  assign wire53 = (8'hae);
endmodule
