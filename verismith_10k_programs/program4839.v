module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire21,
                 wire20,
                 wire19,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((^$signed($signed(($unsigned(wire1) ?
          (wire0 ? wire0 : wire1) : wire1)))))
        begin
          if (((wire3 ?
              $unsigned($unsigned((wire0 >> wire2))) : (wire0[(2'h2):(1'h0)] << ({(8'hb8),
                  wire1} != ((8'hb5) > wire0)))) ~^ ($unsigned(((wire2 ?
                  (7'h41) : wire0) < $signed(wire1))) ?
              {wire0, wire0[(1'h1):(1'h1)]} : {$unsigned(wire3)})))
            begin
              reg4 <= (^wire3);
              reg5 <= {{reg4[(4'h9):(3'h4)], wire2}};
              reg6 <= (wire0 ?
                  ($unsigned(wire1) >>> (~^(((8'ha0) ? wire1 : wire3) - (reg4 ?
                      reg5 : wire1)))) : {wire1});
              reg7 <= wire2;
            end
          else
            begin
              reg4 <= ((~&$signed(({wire0} + (wire3 >= wire3)))) ?
                  ($unsigned(reg6) ?
                      ((!(wire1 ? wire2 : wire2)) ?
                          ((wire1 & wire2) ?
                              reg6[(2'h2):(1'h0)] : {wire3}) : (!$signed(wire2))) : (~^(~wire3))) : ((wire1 ?
                          ((wire3 ?
                              (8'hab) : reg4) >= $unsigned(reg5)) : reg7[(1'h0):(1'h0)]) ?
                      $unsigned($unsigned((wire0 > wire2))) : $unsigned(({wire1,
                          reg5} * $unsigned((7'h43))))));
              reg5 <= $unsigned((({reg6, {reg4}} ? reg4 : $unsigned(reg6)) ?
                  (8'ha4) : $signed((7'h43))));
              reg6 <= {wire3};
              reg7 <= ($signed($unsigned($signed((8'hb9)))) ?
                  ($signed((wire3 >>> ((8'haf) * wire2))) ?
                      $unsigned(($unsigned((8'ha9)) ?
                          $unsigned(reg4) : reg5[(3'h4):(2'h3)])) : ((((8'h9d) ?
                              reg4 : reg7) <= (8'haa)) ?
                          reg5[(1'h1):(1'h1)] : (^(~^wire2)))) : (~|$signed({(reg5 <= (8'hb3))})));
            end
          reg8 <= ((8'hac) ?
              ({{$unsigned((8'hb9))}} <= (|$unsigned(wire1[(3'h4):(1'h1)]))) : (~|wire1));
          reg9 <= reg6[(2'h3):(1'h1)];
        end
      else
        begin
          reg4 <= $signed($signed((reg5[(4'h9):(4'h8)] < $signed(reg6[(1'h1):(1'h1)]))));
          reg5 <= $signed(((((&reg9) & (wire0 || wire2)) ?
                  reg6 : {(reg5 ? wire0 : wire1), reg8[(1'h0):(1'h0)]}) ?
              $signed((8'ha2)) : $signed(reg4)));
          reg6 <= (^~((~&($unsigned(reg8) && reg8)) ?
              reg5 : wire2[(2'h2):(1'h0)]));
          reg7 <= {(($unsigned((^~reg4)) & $unsigned((~|reg9))) || (~|$signed(reg6[(3'h7):(3'h5)]))),
              $signed($signed($unsigned(wire2[(2'h2):(2'h2)])))};
        end
      reg10 <= (|(~|(~|$signed($unsigned(wire1)))));
      if ({$unsigned((~|wire0[(1'h1):(1'h1)])),
          {((|(wire0 ? reg7 : reg10)) ?
                  $unsigned($unsigned(reg7)) : (((8'hac) - reg5) >>> (reg5 <<< (8'hab))))}})
        begin
          reg11 <= wire1;
          reg12 <= $signed((~{(+{reg5, (8'ha6)}), reg7[(5'h10):(3'h6)]}));
        end
      else
        begin
          if (wire3)
            begin
              reg11 <= (8'ha5);
              reg12 <= (~&(7'h41));
            end
          else
            begin
              reg11 <= (((8'hba) ?
                      $signed((|{(8'ha8)})) : {$signed((reg5 ? reg10 : wire0)),
                          (wire2[(2'h2):(1'h0)] ?
                              (reg8 ^~ wire1) : $unsigned(reg5))}) ?
                  (!($unsigned(wire1) & ($signed(reg12) - ((8'hbd) ?
                      reg7 : reg7)))) : reg7);
              reg12 <= $unsigned(reg8[(3'h6):(3'h4)]);
              reg13 <= ($unsigned(($unsigned(((8'haf) ?
                  wire2 : (8'hb5))) && {$unsigned(wire3),
                  (reg12 ? reg6 : wire3)})) > wire2[(1'h1):(1'h1)]);
              reg14 <= reg12[(2'h2):(1'h1)];
            end
          reg15 <= ({{(reg10 ? wire2 : (^~reg13))},
              ((((8'hbc) < reg8) ? (reg12 ? reg6 : reg4) : {reg11, (8'hac)}) ?
                  ($signed(reg7) ?
                      (+reg12) : (~|reg10)) : (~^reg6))} << ((((reg5 ?
              (8'ha3) : wire3) && $signed(reg8)) * reg14[(1'h1):(1'h0)]) & $unsigned((+((8'haa) ?
              reg11 : wire3)))));
          reg16 <= $signed({(+wire3), reg6[(2'h2):(1'h0)]});
        end
      reg17 <= (+($signed(reg5) ? $signed($unsigned({reg12})) : (8'h9d)));
      reg18 <= reg13;
    end
  assign wire19 = $unsigned($signed($signed(((reg4 < reg7) == wire0))));
  assign wire20 = {(((!$unsigned(wire3)) && ((reg13 ~^ (8'h9c)) & $unsigned(reg18))) >> (((reg13 ?
                                  (8'ha7) : (8'ha1)) ?
                              (reg16 - reg16) : $signed(reg5)) ?
                          (8'hab) : reg14))};
  assign wire21 = (!(8'had));
  module22 #() modinst52 (.wire25(reg13), .y(wire51), .wire24(reg15), .clk(clk), .wire26(reg4), .wire23(reg16));
  assign wire53 = reg9;
  assign wire54 = (!$unsigned({$signed((wire1 ? reg18 : wire20)),
                      (^~$unsigned(reg16))}));
  assign wire55 = (-$unsigned((8'haa)));
  assign wire56 = {reg7[(1'h1):(1'h1)], $signed(reg7)};
  assign wire57 = wire21[(4'hd):(4'hb)];
  assign wire58 = ($unsigned(($signed({wire2,
                          wire2}) ^ wire21[(4'hc):(4'h8)])) ?
                      ((+((wire57 >> (8'hb7)) || {wire3,
                          (7'h41)})) >> $signed(($unsigned(reg4) << ((8'hb1) ?
                          reg9 : reg5)))) : ($signed($signed((wire51 ?
                              reg6 : wire19))) ?
                          ($signed($unsigned(wire57)) ~^ (^reg7[(4'hb):(3'h7)])) : (-reg5[(4'h9):(3'h6)])));
  assign wire59 = wire0;
  assign wire60 = wire20;
endmodule

module module22
#(parameter param50 = {({{{(8'hae)}}, ((&(8'hb8)) ? (~(8'ha4)) : (^~(8'ha4)))} <= ({((8'hb8) == (8'hb2))} <= (((8'ha1) ? (8'ha7) : (8'had)) ? ((8'haa) >> (8'hb2)) : ((8'hb1) ? (8'hab) : (8'hb0)))))})
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire26;
  input wire signed [(5'h11):(1'h0)] wire25;
  input wire [(4'hc):(1'h0)] wire24;
  input wire signed [(4'hf):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire30;
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire30,
                 reg49,
                 reg48,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg27 <= $unsigned(wire23[(3'h5):(1'h0)]);
      reg28 <= {(~|(wire23 ?
              wire24[(4'ha):(3'h5)] : {(wire25 >> wire24),
                  $unsigned(wire25)}))};
      reg29 <= ($signed($unsigned(wire25[(4'h9):(3'h6)])) ?
          $unsigned({wire26}) : {($signed($signed(wire23)) ?
                  $signed((&wire26)) : $signed((wire25 ? wire23 : wire23))),
              $signed(reg27[(4'h8):(3'h5)])});
    end
  assign wire30 = {wire23[(4'hf):(4'ha)]};
  always
    @(posedge clk) begin
      if ((^~(~|{reg27, wire24})))
        begin
          reg31 <= (reg29[(1'h0):(1'h0)] | (-((|wire30) ?
              {(~&(8'hb1))} : reg27)));
          reg32 <= wire25;
          if (reg31)
            begin
              reg33 <= wire23;
            end
          else
            begin
              reg33 <= $signed(({(wire24[(4'h9):(1'h1)] <<< {wire30})} ^~ ((reg28 ?
                  $unsigned(wire26) : wire24) <<< {(wire25 * wire26),
                  (~|wire24)})));
              reg34 <= $signed($unsigned($signed((~^$signed((8'hb8))))));
              reg35 <= (!reg31[(1'h1):(1'h0)]);
              reg36 <= (wire24[(4'ha):(4'h9)] ?
                  $signed($unsigned($unsigned((reg34 >>> reg35)))) : wire24[(1'h1):(1'h1)]);
              reg37 <= ({($unsigned($unsigned(reg31)) >>> $unsigned($signed(reg29)))} ?
                  $unsigned(wire23) : (~&$signed($unsigned(reg27[(4'hc):(2'h2)]))));
            end
          if (reg34[(4'h8):(2'h3)])
            begin
              reg38 <= {($unsigned(({reg27, reg36} >= $signed(reg36))) ?
                      $signed(reg27[(3'h6):(1'h0)]) : {(wire30[(1'h1):(1'h0)] ?
                              $signed((8'h9e)) : reg27[(4'hd):(3'h7)])}),
                  ($signed({(wire30 <= reg29),
                      reg33}) >= $signed($signed(wire24)))};
              reg39 <= wire23[(4'he):(4'ha)];
              reg40 <= reg38[(4'hd):(4'hc)];
              reg41 <= (reg37 - $signed({(~^$signed(reg35))}));
              reg42 <= reg39;
            end
          else
            begin
              reg38 <= reg35;
              reg39 <= (8'ha0);
            end
        end
      else
        begin
          reg31 <= ((!(-reg29[(1'h1):(1'h1)])) ? reg38 : $unsigned({reg32}));
          if (reg42[(3'h5):(2'h2)])
            begin
              reg32 <= ($signed((wire30[(2'h2):(1'h1)] ?
                      wire24 : $unsigned((^~reg42)))) ?
                  (~((&reg38[(2'h3):(2'h3)]) ?
                      ((^reg41) >= $unsigned(wire26)) : ($unsigned(reg33) ?
                          (~^(8'hb3)) : (reg42 ? reg38 : reg34)))) : wire26);
            end
          else
            begin
              reg32 <= (reg35[(3'h4):(1'h0)] ?
                  (&wire23[(4'hf):(4'hd)]) : {(-reg29[(2'h3):(1'h1)]),
                      reg35[(1'h0):(1'h0)]});
              reg33 <= wire25;
            end
          reg34 <= ($unsigned((($unsigned(reg33) ?
                      (reg36 != reg34) : (|wire25)) ?
                  $unsigned((reg41 < reg27)) : ((^~reg39) - $signed(reg40)))) ?
              wire26[(1'h0):(1'h0)] : reg28[(4'he):(2'h3)]);
          reg35 <= reg36[(4'h8):(3'h5)];
          if (reg41[(2'h2):(1'h0)])
            begin
              reg36 <= wire23;
              reg37 <= $signed((^~$signed(wire26)));
              reg38 <= (wire26 * $signed($unsigned($unsigned($signed(reg31)))));
            end
          else
            begin
              reg36 <= (wire23 ?
                  (|reg31) : (((~$unsigned(wire25)) & (|$unsigned(wire23))) <<< {(~&$unsigned(reg37))}));
              reg37 <= $signed(wire24[(4'hc):(3'h7)]);
              reg38 <= reg34;
            end
        end
      reg43 <= reg35[(4'h8):(2'h2)];
    end
  assign wire44 = $signed((-reg34));
  assign wire45 = $unsigned(reg39);
  assign wire46 = (7'h44);
  assign wire47 = (wire24[(3'h6):(3'h6)] ?
                      (-$signed(wire25)) : (($unsigned($signed((8'hbf))) >> ((^reg42) != $unsigned((8'h9d)))) ?
                          reg38 : reg39));
  always
    @(posedge clk) begin
      reg48 <= $unsigned($unsigned($unsigned(reg36[(3'h4):(1'h1)])));
      reg49 <= reg27;
    end
endmodule
