module top
#(parameter param73 = (((8'ha2) ? ((~|((8'haa) - (8'hb7))) ? (((7'h40) == (8'ha1)) - ((8'hba) < (8'ha5))) : (!(^~(8'hac)))) : (((~|(8'ha3)) ? ((7'h44) > (8'hbb)) : (8'ha6)) > (~((7'h43) ? (8'ha4) : (8'hb6))))) | (((~^((8'had) ? (8'ha2) : (8'hb7))) >>> (((8'h9f) ? (8'ha8) : (8'ha2)) ? ((8'ha1) ? (8'ha7) : (8'ha8)) : ((8'ha5) ~^ (8'hbe)))) ? (~^{{(8'hb4), (7'h41)}}) : (({(8'ha1), (8'hb3)} >>> {(8'ha7), (8'ha2)}) ? {((8'ha2) ? (8'had) : (8'ha1))} : (^~((8'ha2) ? (8'had) : (8'hb0)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  assign y = {wire71,
                 wire19,
                 wire18,
                 wire5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire5 = wire1[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg6 <= {((({wire0, wire5} < (!wire0)) | $signed((|wire4))) ?
              (+$signed((wire2 ? wire1 : wire1))) : (|($signed(wire2) || {wire1,
                  wire0}))),
          $signed($unsigned($signed(((8'ha8) * (8'ha0)))))};
      if ((($unsigned(($unsigned((8'hb0)) ^~ wire3)) | $signed(wire4)) ?
          wire1[(1'h0):(1'h0)] : {($unsigned((7'h43)) ?
                  $unsigned($signed(wire2)) : ($signed(wire2) < (~reg6)))}))
        begin
          reg7 <= (wire1 ?
              wire1 : $signed(((+$unsigned(wire1)) ?
                  {(^~(8'hb2))} : wire0[(5'h10):(2'h3)])));
        end
      else
        begin
          reg7 <= $unsigned($unsigned((((wire5 ? wire4 : wire5) ?
              (^wire3) : wire3) - ($unsigned(reg6) - (wire1 ? wire0 : reg6)))));
          reg8 <= {reg6};
          reg9 <= (wire0 ?
              $unsigned(reg8) : ({$unsigned($unsigned(wire4)), wire0} ?
                  (|(~|{wire3})) : $unsigned($signed(reg6))));
          reg10 <= $unsigned(reg7);
        end
      if (wire0)
        begin
          reg11 <= $unsigned((~|(|$signed((8'hb5)))));
        end
      else
        begin
          reg11 <= $unsigned({($signed((reg7 - (8'ha3))) ?
                  (7'h42) : $signed((reg10 ? reg8 : (8'ha4))))});
          if ((^reg10[(2'h2):(1'h0)]))
            begin
              reg12 <= $unsigned($unsigned(($unsigned($signed(reg7)) ?
                  (&$signed(reg10)) : (-$signed(wire3)))));
              reg13 <= reg12[(1'h1):(1'h0)];
              reg14 <= ({reg6,
                  wire3[(2'h3):(1'h1)]} | (~((((8'h9f) - wire3) >> wire2[(4'h9):(3'h7)]) ^~ {$signed(wire5),
                  {wire2, wire1}})));
            end
          else
            begin
              reg12 <= {wire1[(4'ha):(4'h9)], $unsigned($unsigned(wire4))};
              reg13 <= $unsigned(wire2[(1'h1):(1'h1)]);
              reg14 <= $signed($unsigned($signed($unsigned((wire3 ?
                  (8'hbc) : reg14)))));
              reg15 <= $signed((^reg8));
            end
          reg16 <= $signed(reg15[(3'h5):(3'h5)]);
          reg17 <= reg15;
        end
    end
  assign wire18 = wire1[(2'h2):(1'h0)];
  assign wire19 = (~{(($unsigned(wire3) <<< reg12[(1'h0):(1'h0)]) ~^ reg13[(4'h8):(2'h3)])});
  module20 #() modinst72 (.wire23(reg14), .wire24(reg7), .wire21(wire0), .wire25(wire2), .clk(clk), .wire22(reg15), .y(wire71));
endmodule

module module20
#(parameter param69 = (-{(~&(~((8'hb7) > (8'hac))))}), 
parameter param70 = param69)
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  input wire signed [(5'h10):(1'h0)] wire22;
  input wire [(3'h6):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire26;
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  assign y = {wire67,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire26 = (|$unsigned(wire21));
  always
    @(posedge clk) begin
      if ((^wire21))
        begin
          reg27 <= wire26;
          reg28 <= wire24[(1'h1):(1'h0)];
          reg29 <= $unsigned($unsigned((reg28 == wire26[(2'h3):(1'h0)])));
          if (reg28[(4'hb):(4'hb)])
            begin
              reg30 <= ((({$unsigned(wire25)} ?
                  (~^wire21) : ((wire21 ?
                      wire23 : wire25) >= wire24[(2'h3):(2'h2)])) ^ reg28) == (^~((8'ha2) ?
                  $unsigned(wire24[(2'h2):(2'h2)]) : $signed({(8'hb6),
                      reg27}))));
              reg31 <= {wire22[(3'h6):(2'h3)], reg28};
              reg32 <= ($signed($unsigned(reg27)) ?
                  wire25[(4'ha):(4'h9)] : wire25[(3'h6):(3'h6)]);
              reg33 <= reg31;
            end
          else
            begin
              reg30 <= ((($unsigned((wire25 ^ wire25)) ?
                  $signed((~wire25)) : $signed((wire26 ?
                      reg30 : wire22))) <= $unsigned((!(reg30 ?
                  reg30 : (8'ha7))))) | reg30);
              reg31 <= {reg31,
                  (($signed((reg32 ? (8'hbd) : reg31)) ?
                      reg33 : {wire26[(2'h3):(2'h2)]}) | $unsigned(wire24))};
              reg32 <= reg29;
              reg33 <= $signed((-reg29));
              reg34 <= (!{$signed((wire25[(4'hc):(4'hc)] <= $unsigned(reg27))),
                  (reg30 > reg30[(4'h8):(3'h5)])});
            end
          reg35 <= reg32[(2'h2):(2'h2)];
        end
      else
        begin
          reg27 <= reg32;
          reg28 <= $signed(((~(((8'hb5) ? reg28 : reg28) < (~reg28))) ?
              $unsigned(wire21) : $unsigned(reg27)));
          if ({(($unsigned((-wire23)) && $signed($signed(reg32))) >> ({(reg30 >>> reg31)} ?
                  $unsigned(reg33) : reg31[(3'h7):(1'h0)])),
              ((~&wire22) ?
                  (~&$signed((wire25 ^~ reg35))) : (wire25 <= $unsigned(reg31)))})
            begin
              reg29 <= (^$unsigned((~$signed(reg29[(3'h6):(2'h3)]))));
              reg30 <= {(!(+((reg35 & (7'h42)) || $signed((8'ha4))))), reg27};
              reg31 <= reg32[(4'hc):(4'ha)];
              reg32 <= wire26;
              reg33 <= (((8'ha5) ?
                  {({reg33} ? reg33[(1'h0):(1'h0)] : $unsigned(reg35)),
                      (!(~^reg27))} : (8'h9d)) == $signed((((reg34 ?
                      wire24 : (8'hba)) ?
                  reg32[(2'h2):(1'h1)] : (reg34 ?
                      reg28 : wire25)) >= (reg31[(3'h7):(1'h0)] ?
                  $signed(wire24) : $unsigned((8'ha7))))));
            end
          else
            begin
              reg29 <= reg29;
            end
          reg34 <= $unsigned(((~$unsigned($signed((8'h9c)))) ~^ {$signed(wire23[(4'h8):(3'h7)]),
              reg35}));
          reg35 <= wire24[(3'h6):(2'h2)];
        end
      reg36 <= $unsigned((~|$signed(wire24[(1'h1):(1'h1)])));
    end
  assign wire37 = (wire26 ? reg28 : reg35[(3'h5):(3'h4)]);
  assign wire38 = $signed((($signed({reg32, reg27}) || (8'h9c)) ?
                      wire26[(2'h2):(2'h2)] : ($unsigned(reg34) || reg34)));
  assign wire39 = ($unsigned($signed($unsigned($unsigned(wire26)))) ?
                      reg29 : $unsigned(($signed($unsigned(reg31)) || ((8'ha8) ?
                          (wire37 ? reg31 : wire24) : wire26[(4'ha):(4'ha)]))));
  assign wire40 = (!($signed(reg36) ?
                      {($unsigned(reg28) ?
                              (8'hab) : reg29)} : (!reg36[(4'hc):(4'hb)])));
  assign wire41 = $unsigned($unsigned($signed((wire23 ?
                      $unsigned(wire37) : $unsigned(reg28)))));
  assign wire42 = (|$unsigned(reg35));
  module43 #() modinst68 (wire67, clk, reg29, wire39, wire37, reg30, reg33);
endmodule

module module43
#(parameter param66 = ({(((~|(8'hb0)) <= (+(8'haf))) ? ((^(8'hb9)) && (8'hb0)) : (((7'h41) != (8'ha0)) > (~^(8'hb8)))), (+{(!(8'hae)), ((8'ha8) ? (8'h9f) : (8'hbc))})} & {(~^(((7'h44) + (8'hb9)) ? (~|(8'haa)) : ((8'haa) ? (8'hb9) : (8'hb9)))), (({(8'ha7), (8'ha5)} < {(8'hbd), (8'ha3)}) + (-(&(8'hbf))))}))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire48;
  input wire signed [(4'ha):(1'h0)] wire47;
  input wire [(3'h5):(1'h0)] wire46;
  input wire signed [(4'hb):(1'h0)] wire45;
  input wire [(2'h2):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire44)
        begin
          if (({$unsigned($signed($unsigned(wire44)))} || $signed((^({wire44} ?
              wire48 : wire48)))))
            begin
              reg49 <= $signed(((((wire46 ?
                  wire48 : wire48) | $unsigned((8'h9d))) ^~ ((8'hbe) ?
                  wire45[(4'h9):(3'h4)] : wire45)) >>> {$signed((&wire46)),
                  wire48[(3'h5):(1'h1)]}));
              reg50 <= ($signed(($signed(((8'had) ? wire44 : wire47)) ?
                  wire44[(1'h1):(1'h0)] : wire48)) > $unsigned(wire44[(1'h0):(1'h0)]));
              reg51 <= $signed((wire48[(3'h4):(3'h4)] && wire47));
              reg52 <= ($unsigned($unsigned($unsigned($unsigned((7'h43))))) >> wire46[(2'h2):(1'h1)]);
              reg53 <= {(^wire44[(1'h1):(1'h0)]),
                  ((~|$unsigned((^reg50))) ?
                      ((7'h42) ?
                          $unsigned((reg49 || reg50)) : ((8'hae) <= (wire45 ?
                              wire44 : reg49))) : $unsigned((|reg52)))};
            end
          else
            begin
              reg49 <= ((7'h44) ?
                  (reg51[(4'hb):(3'h5)] << reg50) : ({((reg52 ?
                                  reg49 : (8'hae)) ?
                              (+reg51) : reg49[(4'h9):(4'h9)]),
                          (-((8'hbd) ? (8'hbd) : wire45))} ?
                      (^~((!wire47) ?
                          $signed(reg53) : (-wire47))) : (((^~reg49) <<< $signed(reg51)) ~^ (reg50[(3'h4):(2'h3)] >= (wire47 ?
                          (7'h42) : reg50)))));
              reg50 <= reg52;
              reg51 <= (wire46[(3'h5):(1'h1)] ?
                  {(reg51 == ((-reg53) <= (!(8'h9e)))),
                      $signed(reg53)} : (~^(8'hb8)));
              reg52 <= wire45;
              reg53 <= wire47[(3'h6):(1'h0)];
            end
          reg54 <= $signed($signed((~^$unsigned($unsigned(reg53)))));
          reg55 <= $unsigned($signed($signed(reg50)));
          if (reg50)
            begin
              reg56 <= {((8'ha6) ? (|$unsigned((+reg54))) : reg51),
                  $signed(reg55)};
              reg57 <= $unsigned($signed(wire46[(3'h4):(3'h4)]));
            end
          else
            begin
              reg56 <= $signed((~|reg51[(3'h5):(3'h4)]));
              reg57 <= $signed($unsigned(reg53[(1'h0):(1'h0)]));
              reg58 <= reg52[(3'h6):(3'h6)];
              reg59 <= ($signed((-$unsigned((wire48 ?
                  wire48 : wire45)))) >> wire44);
            end
        end
      else
        begin
          reg49 <= ($signed($signed(reg54)) || (($signed($unsigned(reg56)) ?
              reg52[(4'h8):(1'h1)] : $unsigned((reg51 ?
                  reg52 : (8'hb1)))) == ($unsigned((~reg49)) ?
              (^(+wire47)) : $unsigned((reg57 >= reg51)))));
          reg50 <= (-$signed(reg57));
        end
      reg60 <= $unsigned((^~reg57));
      reg61 <= {{(+($signed(wire44) ?
                  (reg52 >= reg51) : wire47[(3'h7):(3'h6)])),
              wire47}};
      reg62 <= {reg59[(4'hc):(4'h8)]};
    end
  assign wire63 = (reg60[(4'he):(2'h2)] ?
                      reg49[(2'h3):(1'h0)] : $signed((^~reg49)));
  assign wire64 = (^~$unsigned((reg60[(5'h10):(4'ha)] && $unsigned(((8'h9f) >= wire45)))));
  assign wire65 = (~&reg50);
endmodule
