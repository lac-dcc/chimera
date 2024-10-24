module top
#(parameter param46 = ((((((7'h43) <<< (8'ha8)) || (^~(7'h41))) ? (~(~^(8'hbe))) : (((8'hbe) + (8'hbe)) ? (~(7'h42)) : ((8'hab) ? (8'hab) : (8'hab)))) ? (((!(8'ha8)) ? (|(8'ha1)) : ((8'h9f) ? (8'hb2) : (8'ha7))) ? {((8'hbe) || (8'h9d))} : (8'ha3)) : ((((8'ha7) ? (8'h9e) : (7'h42)) ? (^~(8'hbe)) : ((8'h9e) << (8'hbe))) ? ((-(7'h43)) ? ((8'hbb) ? (8'ha9) : (8'hb4)) : ((8'hb1) <<< (8'hb3))) : ((-(8'hbb)) ? ((8'hb7) ? (8'hba) : (8'ha0)) : (~^(8'h9d))))) ? (|({(~&(8'hb5))} >> ({(8'ha0)} && {(8'hab), (8'ha3)}))) : (((((8'ha5) ? (8'hb9) : (8'hb5)) < {(8'hb4), (8'ha2)}) | (((8'ha6) <= (8'haf)) < {(8'ha2), (8'hb0)})) ? ((((8'haf) ~^ (8'hac)) + (^~(8'ha7))) ? ((~&(8'hb0)) ~^ (&(7'h42))) : (((8'hb1) ? (7'h40) : (7'h40)) == {(8'ha5), (8'ha7)})) : ((^~(-(8'hb4))) ? ((-(8'hba)) ^ (~|(8'h9f))) : ((!(8'haa)) ? ((8'h9e) ? (7'h41) : (8'hb8)) : ((8'ha9) != (8'haf)))))), 
parameter param47 = {((((^~param46) * (param46 ? param46 : param46)) || param46) >= ((((8'ha2) ? param46 : param46) ? ((8'hbe) ? (8'hb4) : param46) : (param46 ? param46 : param46)) ^ param46))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire [(2'h2):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire44;
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire44,
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
  assign wire5 = $signed((!(~|(wire4[(1'h0):(1'h0)] ?
                     wire2 : wire3[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg6 <= ($signed($signed(wire2)) - (+((+wire5[(5'h10):(4'h9)]) ?
          $signed((8'hb7)) : wire1[(3'h4):(2'h2)])));
      reg7 <= $unsigned((^~reg6));
      reg8 <= wire1;
      if (((wire4 * reg6[(4'hb):(4'ha)]) << wire2))
        begin
          reg9 <= $signed(($unsigned((wire1[(1'h1):(1'h1)] >>> (wire2 ?
                  wire3 : reg8))) ?
              wire3[(3'h6):(1'h1)] : $signed(($signed(reg6) >= wire3[(2'h3):(2'h2)]))));
          if ($signed(wire2[(3'h7):(1'h1)]))
            begin
              reg10 <= wire1[(4'hc):(4'ha)];
              reg11 <= reg9[(2'h2):(1'h0)];
              reg12 <= (8'ha9);
              reg13 <= (($unsigned(((wire3 ? (8'h9d) : wire2) ?
                  $unsigned(reg7) : (reg8 <<< wire5))) & $unsigned((~wire3))) | $signed($signed(((+reg9) << {reg7}))));
            end
          else
            begin
              reg10 <= (~&$unsigned((|$signed($unsigned(reg13)))));
              reg11 <= ((8'ha0) ?
                  reg9 : $signed({(reg6[(4'h8):(1'h1)] >>> ((8'h9c) << reg13))}));
              reg12 <= {$signed($signed($unsigned(reg7[(4'h8):(3'h5)])))};
              reg13 <= ((wire4 | ($signed($signed((8'hb7))) ?
                      (wire2[(3'h5):(1'h1)] && (!wire1)) : $signed((reg10 ?
                          wire2 : reg9)))) ?
                  wire2[(1'h1):(1'h0)] : wire2[(4'ha):(4'h8)]);
              reg14 <= (wire3[(4'h8):(3'h4)] || wire0[(1'h0):(1'h0)]);
            end
          reg15 <= $unsigned((reg7 << $signed(reg13)));
          reg16 <= (^($signed(((^~reg9) ?
              $signed((8'h9f)) : (!reg14))) <<< reg12));
          reg17 <= $signed(reg9);
        end
      else
        begin
          if (reg8)
            begin
              reg9 <= ({(8'hbc),
                  (~((~&reg14) << (reg7 ?
                      wire5 : reg14)))} >>> $signed((~^((~^reg17) ?
                  $signed(wire1) : $signed(wire0)))));
              reg10 <= ((8'ha9) ?
                  ({(reg13 ?
                          (~&reg15) : $signed(reg11))} - reg16[(3'h4):(1'h1)]) : (($signed(((8'hb3) ?
                          (8'h9d) : reg8)) ?
                      reg17[(1'h1):(1'h0)] : reg11) ~^ (~$signed((~^reg9)))));
              reg11 <= wire0;
              reg12 <= $signed(wire2[(4'hd):(1'h0)]);
              reg13 <= (^~{(reg6 ?
                      ($unsigned(reg6) < (reg6 ?
                          reg10 : reg10)) : reg12[(4'h8):(4'h8)]),
                  (reg11[(4'ha):(4'ha)] ?
                      ((8'hab) >> (-wire2)) : ((reg8 | reg15) >= ((8'ha3) == reg17)))});
            end
          else
            begin
              reg9 <= ((reg12[(1'h1):(1'h0)] ?
                      $signed((&(reg13 * wire1))) : $unsigned($signed({wire3}))) ?
                  reg13 : (reg10 - $unsigned(reg10[(1'h1):(1'h1)])));
              reg10 <= (~(8'hb4));
              reg11 <= (reg16 == (reg11[(4'h8):(3'h7)] | reg17));
              reg12 <= reg17;
            end
          reg14 <= {$signed($unsigned($unsigned($signed(reg7))))};
          reg15 <= reg17[(4'ha):(3'h5)];
          if ((&$signed((($signed(reg8) ? (^reg17) : wire5) >= reg9))))
            begin
              reg16 <= reg12[(3'h6):(1'h0)];
              reg17 <= (~&reg10);
            end
          else
            begin
              reg16 <= (~&reg6[(3'h5):(1'h1)]);
              reg17 <= reg16;
            end
          reg18 <= wire2;
        end
    end
  module19 #() modinst45 (wire44, clk, reg12, reg14, reg17, reg7, wire2);
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire [(4'he):(1'h0)] wire23;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire21;
  input wire [(2'h2):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  assign y = {wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg42,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire25 = {($unsigned(wire22) >> {$unsigned($signed(wire23)),
                          (+(wire23 << (8'hb9)))}),
                      ((|(~&wire23[(1'h0):(1'h0)])) >> $signed(wire21))};
  assign wire26 = $signed({wire23[(2'h3):(1'h1)],
                      (wire20 ?
                          ((wire22 ? wire22 : (8'hb8)) ?
                              $signed(wire23) : $signed((7'h41))) : $signed((wire20 ?
                              wire22 : (8'hb0))))});
  assign wire27 = wire20;
  assign wire28 = (~|$signed((~^wire27)));
  assign wire29 = (wire22[(3'h4):(1'h1)] ?
                      (~wire25[(3'h4):(2'h2)]) : wire23[(4'hb):(3'h5)]);
  assign wire30 = (~wire27);
  assign wire31 = {$signed({$signed($signed(wire30)), wire20[(2'h2):(2'h2)]}),
                      (!(^$signed((wire22 ? wire26 : wire24))))};
  always
    @(posedge clk) begin
      reg32 <= (($unsigned(({wire26} > $unsigned((8'ha1)))) ?
          (|$signed($unsigned(wire23))) : (-wire22)) - $unsigned($unsigned($unsigned($signed(wire26)))));
      if ($unsigned({$signed(wire30)}))
        begin
          reg33 <= ((8'hae) ? (+wire22) : $unsigned(wire20[(2'h2):(2'h2)]));
          reg34 <= wire28[(1'h0):(1'h0)];
        end
      else
        begin
          if ((!$signed(wire22)))
            begin
              reg33 <= {wire23};
            end
          else
            begin
              reg33 <= wire29;
            end
          reg34 <= ({$signed(((reg34 >> wire31) ~^ wire25)),
                  {wire31[(5'h11):(4'hf)], ($unsigned(wire23) >> (~^wire23))}} ?
              (wire31 ?
                  ((8'ha2) ~^ wire26[(2'h3):(1'h1)]) : (wire31[(4'hc):(4'hc)] ~^ (wire25 > $signed((8'hbe))))) : {(~wire28[(4'h8):(4'h8)]),
                  $signed(wire31[(3'h7):(2'h3)])});
          reg35 <= (+wire30);
          reg36 <= reg35;
        end
    end
  always
    @(posedge clk) begin
      reg37 <= ($unsigned($unsigned($signed((^wire20)))) ?
          ($signed((wire27 > (reg35 < wire23))) || $signed({{reg32}})) : {(!wire29)});
    end
  assign wire38 = wire22;
  assign wire39 = wire28;
  assign wire40 = wire23;
  assign wire41 = $signed({reg37[(4'hb):(4'ha)], wire25[(4'h9):(4'h8)]});
  always
    @(posedge clk) begin
      reg42 <= $unsigned(reg35[(4'hb):(2'h3)]);
    end
  assign wire43 = (~$unsigned($signed((~^(~|(8'ha3))))));
endmodule
