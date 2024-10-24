module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire134;
  wire [(4'hf):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire129;
  wire signed [(5'h10):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire119;
  wire [(3'h5):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire117;
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire5,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire117,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
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
                 reg18,
                 reg19,
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
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 (1'h0)};
  assign wire5 = ($unsigned(($signed((wire1 <<< wire3)) << (!$signed((8'hab))))) ?
                     $unsigned((((^~wire2) ?
                         $signed(wire4) : wire3) <<< ({(8'ha3)} ?
                         wire3[(3'h7):(1'h1)] : $signed(wire2)))) : wire3);
  always
    @(posedge clk) begin
      reg6 <= wire3;
      if ($unsigned((wire0 << $unsigned($signed(wire4[(2'h2):(2'h2)])))))
        begin
          reg7 <= $unsigned(wire0);
          if ($unsigned((^~wire5)))
            begin
              reg8 <= wire5[(3'h4):(3'h4)];
              reg9 <= $unsigned({(~^(8'hb5)),
                  (($signed((7'h42)) ?
                      $unsigned(wire3) : $unsigned((8'haa))) == {((8'ha3) || (8'h9e)),
                      (wire2 != reg7)})});
              reg10 <= (~&$signed(((reg8 * (reg8 ? (8'hb1) : wire5)) ?
                  (reg9 >> $unsigned(wire5)) : ($unsigned(reg7) ^~ wire5[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg8 <= wire0;
              reg9 <= wire5[(2'h3):(1'h0)];
              reg10 <= (reg9 ?
                  ({((wire4 ?
                          wire2 : wire1) << $signed(wire5))} + reg7) : (8'haa));
              reg11 <= ({$signed(reg8),
                  wire3[(3'h7):(2'h2)]} << $signed((8'ha6)));
            end
          if (reg6)
            begin
              reg12 <= (~&wire5);
              reg13 <= wire2[(1'h0):(1'h0)];
              reg14 <= ({(^{(~wire0)})} - (~&(|reg6)));
              reg15 <= ((-((wire5 + reg9[(4'h8):(2'h3)]) ?
                      {reg13[(1'h1):(1'h1)]} : {reg7[(1'h0):(1'h0)]})) ?
                  (~&(^$signed($signed(reg11)))) : reg11);
              reg16 <= {reg14};
            end
          else
            begin
              reg12 <= {(((reg14 == $signed(reg11)) ?
                      reg14[(4'hb):(3'h6)] : (~|(~^wire1))) < $signed(reg15[(3'h6):(3'h6)])),
                  $signed(($signed((&reg11)) <<< $unsigned((wire5 || (8'haf)))))};
              reg13 <= $signed($unsigned(((reg16[(2'h3):(2'h2)] <<< {reg9,
                  (8'hab)}) << (!$unsigned(reg7)))));
              reg14 <= (($unsigned($signed(wire1)) ?
                      reg11[(4'hd):(4'h8)] : wire0[(1'h0):(1'h0)]) ?
                  {$unsigned(((reg7 <= wire4) <= reg12[(2'h2):(2'h2)])),
                      reg14} : $signed({$unsigned($signed(reg13)),
                      (reg9[(4'hc):(3'h4)] >= (8'h9c))}));
            end
          reg17 <= ((+{{reg15[(1'h1):(1'h1)], (reg8 ? reg16 : wire4)},
                  $unsigned($unsigned((8'ha7)))}) ?
              ($signed(reg12[(3'h6):(1'h0)]) ?
                  (reg10 ?
                      ($signed(reg15) ^~ wire1[(1'h0):(1'h0)]) : (-(^~reg13))) : (((8'h9d) ?
                      {reg12} : $signed(reg7)) + reg6[(4'ha):(3'h5)])) : (&reg9[(3'h4):(1'h0)]));
        end
      else
        begin
          if ($unsigned(reg16[(1'h0):(1'h0)]))
            begin
              reg7 <= reg17;
              reg8 <= wire0[(3'h4):(1'h1)];
              reg9 <= $unsigned(wire3);
              reg10 <= ($unsigned((reg12[(2'h2):(1'h1)] ?
                      $unsigned(reg16) : {(wire5 + (8'hbd)), {reg15, reg17}})) ?
                  reg16[(3'h4):(2'h2)] : $unsigned((($unsigned(reg9) ?
                          (^reg9) : $unsigned(reg17)) ?
                      {(-reg17)} : $unsigned((^reg15)))));
              reg11 <= $signed(reg15[(1'h1):(1'h1)]);
            end
          else
            begin
              reg7 <= {$unsigned((~&$signed({reg10}))), reg12};
              reg8 <= reg12[(2'h2):(2'h2)];
              reg9 <= $signed($unsigned($unsigned($signed(((7'h41) >>> reg17)))));
              reg10 <= wire4;
            end
        end
      reg18 <= {$unsigned({reg7[(3'h6):(2'h2)], wire3[(1'h1):(1'h0)]})};
      reg19 <= (8'hbf);
    end
  assign wire20 = reg6;
  assign wire21 = {(&(!$signed($signed(reg11)))),
                      $signed((($signed(wire1) & $unsigned(reg19)) >> (+reg12)))};
  assign wire22 = {reg7[(1'h0):(1'h0)], $unsigned(reg11)};
  assign wire23 = (wire21 == reg13);
  assign wire24 = wire22;
  assign wire25 = (^~$unsigned($signed(({reg8, wire0} >>> wire4))));
  assign wire26 = ($unsigned(reg16) ?
                      $signed($unsigned((reg11 ?
                          $unsigned(reg17) : (8'hbd)))) : (((|(!(7'h42))) >>> {$signed(reg6),
                          {(8'haf), reg15}}) ^~ $unsigned($unsigned(wire24))));
  always
    @(posedge clk) begin
      reg27 <= ({reg18[(3'h5):(3'h5)],
          (-(^~(wire0 <<< wire4)))} != $signed(reg7));
      reg28 <= (8'hb7);
      reg29 <= $signed((((^~(&(8'had))) ?
              {reg10[(1'h1):(1'h0)]} : reg7[(2'h3):(2'h2)]) ?
          reg27 : {wire0[(1'h0):(1'h0)]}));
    end
  always
    @(posedge clk) begin
      reg30 <= reg14[(4'hc):(4'hb)];
      reg31 <= (($signed((wire0[(3'h4):(2'h3)] ?
                  (reg8 ? wire24 : wire3) : (8'h9c))) ?
              reg15[(3'h7):(2'h2)] : reg15[(1'h1):(1'h0)]) ?
          {{$signed((reg13 | wire24)),
                  (|(8'hb0))}} : $unsigned({reg11[(4'h9):(2'h3)],
              (reg9[(4'hb):(4'h9)] ? $unsigned(reg27) : $signed(wire22))}));
      if (reg9[(4'ha):(1'h0)])
        begin
          if (reg30)
            begin
              reg32 <= (($unsigned({{wire26}}) ?
                  ($signed((reg14 <= reg6)) >>> wire26[(4'he):(2'h2)]) : $signed($signed($signed(wire22)))) >> $signed($signed((~&(reg27 ?
                  reg27 : reg28)))));
            end
          else
            begin
              reg32 <= reg18;
              reg33 <= wire25[(2'h3):(1'h1)];
              reg34 <= reg29[(1'h1):(1'h1)];
              reg35 <= (-({((reg19 ? reg32 : reg18) >= (reg10 & reg13)),
                  (reg15[(1'h1):(1'h1)] ?
                      $signed(wire24) : wire26[(2'h3):(1'h0)])} & ((8'hb3) ?
                  wire26[(4'h8):(1'h0)] : $signed((wire0 && reg32)))));
              reg36 <= reg6[(1'h1):(1'h0)];
            end
          if (wire22)
            begin
              reg37 <= $unsigned(reg36[(3'h7):(2'h3)]);
              reg38 <= $unsigned($signed((-wire22[(4'h8):(3'h5)])));
              reg39 <= (8'hb8);
              reg40 <= ($unsigned(reg10) ?
                  ($signed((8'hbd)) ?
                      $unsigned($unsigned($signed(reg35))) : $unsigned((!$unsigned(reg30)))) : wire25[(1'h0):(1'h0)]);
              reg41 <= (((8'haa) == $unsigned($unsigned({reg17,
                  reg11}))) >> reg10);
            end
          else
            begin
              reg37 <= $signed((reg32[(3'h6):(1'h0)] ?
                  $unsigned(wire0[(1'h1):(1'h0)]) : $signed((((8'h9c) - reg15) ~^ wire26[(5'h13):(5'h12)]))));
              reg38 <= {reg9[(3'h4):(3'h4)]};
            end
        end
      else
        begin
          reg32 <= (~^$signed((~&((+reg38) ?
              reg7[(3'h6):(3'h4)] : $unsigned(wire1)))));
          reg33 <= wire5[(1'h1):(1'h0)];
          reg34 <= wire0[(4'hb):(2'h3)];
          reg35 <= reg12[(1'h1):(1'h1)];
          reg36 <= reg9[(4'hc):(3'h7)];
        end
      reg42 <= $unsigned($unsigned($unsigned($unsigned((reg6 ?
          wire23 : reg10)))));
    end
  module43 #() modinst118 (.wire44(wire25), .wire45(wire1), .clk(clk), .wire46(reg38), .wire47(wire23), .y(wire117));
  assign wire119 = reg8;
  assign wire120 = reg27[(3'h4):(1'h1)];
  assign wire121 = $signed({(wire22 <= wire21), $signed((!(reg16 <<< reg36)))});
  assign wire122 = (reg16[(1'h1):(1'h1)] + reg32);
  always
    @(posedge clk) begin
      reg123 <= ((^~{(8'hb8), $signed(reg28[(4'hd):(3'h6)])}) ?
          ($signed((~^$signed(wire2))) ?
              $signed(reg29[(4'ha):(1'h1)]) : wire23) : $unsigned((reg9 ?
              (((8'had) - reg37) ?
                  (wire24 ? wire5 : reg10) : (-reg38)) : (reg29 ?
                  (reg11 ? (7'h41) : reg37) : $signed(reg35)))));
      if (reg42[(3'h4):(1'h0)])
        begin
          reg124 <= wire26;
          reg125 <= $signed((wire119 ?
              $unsigned($unsigned($unsigned(wire3))) : {($unsigned(wire1) < (8'hbb)),
                  {{(8'hbf), reg124}, reg14[(4'hf):(1'h1)]}}));
          reg126 <= (~^$signed(((-(wire20 > wire4)) <= $unsigned($unsigned(reg39)))));
        end
      else
        begin
          if ($unsigned($unsigned(reg6[(4'hb):(4'h8)])))
            begin
              reg124 <= $signed(reg40);
              reg125 <= {wire26[(5'h14):(2'h2)], reg7};
              reg126 <= (7'h40);
            end
          else
            begin
              reg124 <= (!(reg42 << (~|{(wire120 > reg8),
                  $unsigned(wire121)})));
              reg125 <= $unsigned({reg14[(3'h7):(1'h1)],
                  reg126[(1'h1):(1'h0)]});
            end
        end
      reg127 <= $signed((7'h43));
      reg128 <= ((wire117 ?
              ({(reg18 + (8'ha6))} | $unsigned((-reg14))) : reg29[(2'h3):(2'h3)]) ?
          $unsigned((&reg9[(3'h6):(3'h4)])) : {$signed($unsigned((8'hb4)))});
    end
  assign wire129 = reg40[(2'h3):(2'h3)];
  assign wire130 = wire0;
  assign wire131 = ({((&(wire0 ?
                           reg13 : (8'hbb))) > {$signed(reg33)})} < wire23);
  assign wire132 = ((wire3[(3'h7):(2'h3)] > reg7[(2'h3):(2'h2)]) != reg27);
  assign wire133 = reg125;
  assign wire134 = {((reg17[(4'h9):(1'h1)] * wire1) == reg16)};
endmodule

module module43  (y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire47;
  input wire signed [(4'hc):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire45;
  input wire [(3'h7):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire116;
  wire [(3'h4):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire114;
  wire signed [(2'h2):(1'h0)] wire104;
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire104,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  module48 #() modinst105 (wire104, clk, wire45, wire46, wire47, wire44, (8'hbd));
  always
    @(posedge clk) begin
      reg106 <= wire47[(4'hb):(2'h2)];
      if (((~$unsigned($signed((~wire45)))) ? wire44[(1'h1):(1'h0)] : reg106))
        begin
          reg107 <= (8'ha2);
          if (wire44[(2'h2):(1'h1)])
            begin
              reg108 <= (~wire44[(1'h0):(1'h0)]);
              reg109 <= reg107[(1'h1):(1'h0)];
            end
          else
            begin
              reg108 <= wire47;
            end
          reg110 <= (~^reg106);
          reg111 <= (reg108 ~^ $signed((reg110[(1'h1):(1'h1)] - (reg107 == $unsigned((8'ha4))))));
        end
      else
        begin
          if (wire45)
            begin
              reg107 <= $unsigned((wire45[(2'h2):(1'h0)] <= $unsigned((~|(wire104 ?
                  wire47 : wire104)))));
              reg108 <= ($unsigned(reg111) == $unsigned(($unsigned((-wire46)) ?
                  ($signed(reg107) < reg110) : wire46[(3'h7):(3'h6)])));
              reg109 <= reg110[(1'h1):(1'h1)];
              reg110 <= wire45;
            end
          else
            begin
              reg107 <= ($signed({(8'hbe)}) && $unsigned({$signed(reg109),
                  ((wire47 ? wire46 : reg110) ? reg109 : (~|reg111))}));
              reg108 <= ($signed(reg107[(3'h6):(1'h1)]) ?
                  reg107 : ($unsigned($unsigned($signed(reg107))) >> wire104[(1'h1):(1'h0)]));
              reg109 <= $unsigned((|reg106));
              reg110 <= (((((wire104 - reg107) ~^ wire44[(3'h5):(2'h3)]) + $unsigned((8'ha2))) != reg110[(2'h3):(2'h3)]) ?
                  (+(8'hb2)) : $signed($unsigned(wire44)));
            end
          reg111 <= $unsigned(reg106);
          reg112 <= $signed($unsigned(reg111[(1'h0):(1'h0)]));
        end
      reg113 <= $signed((reg111[(1'h0):(1'h0)] <= $signed($signed(wire44))));
    end
  assign wire114 = reg113;
  assign wire115 = (($unsigned(((reg106 ^ wire44) <= (reg112 <<< reg110))) >>> $signed({reg106[(5'h10):(4'hd)]})) || (wire104 ?
                       (8'ha9) : wire47));
  assign wire116 = (wire104 * reg107[(3'h5):(1'h1)]);
endmodule

module module48
#(parameter param102 = ({((~|((8'hbf) ^ (7'h44))) ? ({(8'h9f)} ? ((8'hbf) >>> (8'hb3)) : (~&(8'hbd))) : {{(8'hba), (8'ha0)}, (7'h40)}), (~(~^(8'hb6)))} ^ (((|(!(8'hbd))) ? ({(8'ha3), (7'h44)} ? ((8'h9c) * (8'ha5)) : {(7'h40)}) : (((8'ha6) >= (8'hbb)) < ((8'hb8) + (8'ha6)))) == {{{(8'hb5), (8'hb6)}}, (-(~^(8'hb5)))})), 
parameter param103 = (+param102))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire53;
  input wire signed [(4'hc):(1'h0)] wire52;
  input wire signed [(5'h12):(1'h0)] wire51;
  input wire [(2'h2):(1'h0)] wire50;
  input wire signed [(5'h12):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire80;
  wire signed [(4'hb):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire72,
                 wire71,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg75,
                 reg74,
                 reg73,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned($unsigned(wire49[(4'hb):(2'h3)])) ?
          $unsigned((wire50 << {$unsigned(wire52)})) : $unsigned(({$unsigned(wire53)} * $unsigned($unsigned(wire50))))))
        begin
          reg54 <= (wire50 ?
              {{(-(wire49 >>> wire50)), $unsigned((8'hbf))},
                  (|wire53)} : wire52[(3'h5):(2'h3)]);
          reg55 <= wire52[(3'h4):(2'h2)];
          reg56 <= ($unsigned(wire52[(4'ha):(4'h9)]) & $unsigned(($signed(wire53[(3'h5):(2'h3)]) ?
              {wire51[(1'h0):(1'h0)],
                  wire52[(2'h2):(1'h1)]} : $unsigned((+reg54)))));
          reg57 <= $unsigned(wire49);
        end
      else
        begin
          reg54 <= (!{{(8'hb6), reg56}, {{wire49[(4'hb):(4'h9)]}, wire53}});
          reg55 <= reg55[(3'h5):(2'h2)];
          reg56 <= (+reg54);
        end
    end
  assign wire58 = (wire50 ? wire52[(3'h5):(1'h1)] : (8'h9e));
  assign wire59 = ($signed((|(~(wire52 ^ wire49)))) ?
                      (~wire52[(3'h5):(2'h3)]) : $unsigned(({(wire58 ?
                              wire58 : wire58),
                          (wire50 ? wire51 : (8'ha5))} || wire51)));
  assign wire60 = (^~(!wire51));
  assign wire61 = (!$signed(wire50[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg62 <= reg56[(2'h3):(1'h1)];
      if ($unsigned(reg54[(1'h0):(1'h0)]))
        begin
          reg63 <= wire51[(2'h2):(2'h2)];
          reg64 <= {$unsigned(((-(wire52 << wire60)) * (8'ha2))),
              {{((^wire60) ? wire53[(4'hb):(1'h0)] : (8'hae))},
                  $unsigned(wire50)}};
          reg65 <= (($unsigned((-reg63[(1'h0):(1'h0)])) >> reg62) >= ((+wire53) != wire60[(2'h3):(2'h3)]));
          if (reg55)
            begin
              reg66 <= ($unsigned(($unsigned($signed(reg63)) ?
                      (reg64[(3'h4):(2'h3)] ^~ (reg64 > reg64)) : (^~(~|wire58)))) ?
                  (wire58[(5'h11):(4'he)] ?
                      $signed(reg64) : ((wire50 ^~ $signed(reg63)) ?
                          $signed($unsigned(wire60)) : $signed(wire50[(1'h0):(1'h0)]))) : (8'had));
              reg67 <= ($unsigned(reg55) * $signed($signed((-(reg62 ?
                  reg54 : reg65)))));
            end
          else
            begin
              reg66 <= {$signed(reg57), (^(^~$signed(reg64)))};
              reg67 <= $unsigned($unsigned((|wire60[(2'h3):(1'h1)])));
            end
        end
      else
        begin
          reg63 <= $unsigned(((wire50[(1'h0):(1'h0)] ? (8'haf) : (8'had)) ?
              ({$signed(reg56),
                  (8'ha6)} <= ($unsigned(wire52) || (8'hae))) : (^$signed(((8'ha9) == wire58)))));
          reg64 <= reg63[(3'h4):(1'h0)];
        end
      reg68 <= ((~|wire49) ? $signed((~^wire52)) : reg55[(1'h0):(1'h0)]);
      reg69 <= $unsigned({({(^reg64)} >>> (((8'hbf) ?
              reg55 : wire58) == (!(7'h40))))});
      reg70 <= $signed(($signed($signed((~^wire51))) ?
          (($unsigned(reg57) ? $signed(reg64) : reg67[(3'h5):(3'h5)]) ?
              {(reg55 | reg62),
                  (wire49 == reg63)} : ($signed((8'hb1)) >> (reg64 ?
                  (8'h9d) : reg69))) : $unsigned((~^(~|wire49)))));
    end
  assign wire71 = (-$signed(({$unsigned(reg63), (reg56 ~^ reg62)} - (((8'ha3) ?
                          (8'hbf) : reg62) ?
                      $unsigned(reg56) : {reg54}))));
  assign wire72 = $signed(wire71);
  always
    @(posedge clk) begin
      reg73 <= ($signed((wire50[(1'h1):(1'h1)] != ($unsigned((8'hb9)) ^ wire50[(2'h2):(1'h1)]))) - (wire61 ?
          (&((wire49 >>> wire52) ? $unsigned(reg56) : wire59)) : reg69));
      reg74 <= (~|{wire61});
      reg75 <= ($unsigned(wire52[(3'h5):(2'h2)]) ?
          (+(reg62[(1'h0):(1'h0)] | ((-reg68) ^~ (^reg70)))) : wire72[(4'h9):(3'h7)]);
    end
  assign wire76 = (wire58 + (reg55[(4'ha):(3'h5)] && reg55[(2'h2):(2'h2)]));
  assign wire77 = reg57[(2'h3):(1'h0)];
  assign wire78 = ($signed(reg73) ?
                      $unsigned(($signed(wire49) ?
                          reg68[(3'h5):(3'h4)] : $signed((^~wire76)))) : $unsigned(wire77[(3'h5):(3'h5)]));
  assign wire79 = reg63[(4'h9):(3'h6)];
  assign wire80 = {$unsigned(reg69)};
  always
    @(posedge clk) begin
      if ($unsigned($signed((($signed(wire50) ?
          (reg55 ? reg70 : wire72) : wire80) && ($signed(wire58) ?
          (reg69 & wire71) : (!reg65))))))
        begin
          reg81 <= $unsigned((~(reg56[(1'h0):(1'h0)] ?
              (!(wire58 + reg55)) : reg70)));
          reg82 <= ((+(~|{reg63[(2'h2):(2'h2)]})) ?
              wire61 : (((&$signed(reg73)) ?
                      wire61[(1'h0):(1'h0)] : $signed((wire59 | reg73))) ?
                  ($unsigned($unsigned(wire80)) ~^ {wire76[(4'hc):(3'h7)],
                      $unsigned(wire72)}) : (+$unsigned($signed(wire58)))));
          reg83 <= wire50;
          reg84 <= $signed($unsigned(({{(8'ha7),
                  (8'h9c)}} <= ((&(8'had)) ~^ (wire60 ? reg70 : wire72)))));
          if ({{(reg82 ? reg74 : reg81)}, (8'hab)})
            begin
              reg85 <= (~&$unsigned($unsigned(reg56[(4'hb):(2'h3)])));
              reg86 <= ($unsigned(({$unsigned(reg57), reg73} && (&(wire60 ?
                  reg85 : wire53)))) < (((wire78 ^ (reg84 >= (8'ha3))) ?
                  reg66[(4'h8):(3'h4)] : wire50[(1'h0):(1'h0)]) != wire50[(2'h2):(2'h2)]));
            end
          else
            begin
              reg85 <= (~$signed((reg82[(2'h3):(2'h3)] + $unsigned($signed(reg74)))));
              reg86 <= (wire60 <<< (!(wire50[(2'h2):(1'h1)] <= $unsigned((reg75 ?
                  reg57 : reg84)))));
              reg87 <= (reg57 ? (~wire76[(3'h6):(3'h4)]) : reg56);
            end
        end
      else
        begin
          reg81 <= {$unsigned({($unsigned((8'hb5)) >= {reg81, reg84}),
                  ({reg54} >> (8'hb3))})};
          reg82 <= reg62;
        end
      reg88 <= $signed((wire58 ?
          wire51[(3'h7):(1'h0)] : (reg68[(1'h0):(1'h0)] ~^ ((wire53 ?
                  wire77 : reg57) ?
              (wire72 & reg68) : $unsigned(reg83)))));
      if ($unsigned((~^(~|$unsigned($signed((8'h9c)))))))
        begin
          reg89 <= wire49;
          if (reg68[(3'h4):(1'h0)])
            begin
              reg90 <= $unsigned((8'haf));
              reg91 <= $unsigned($signed((reg55 ?
                  $signed(wire53) : reg88[(5'h11):(2'h3)])));
            end
          else
            begin
              reg90 <= wire72;
            end
          reg92 <= reg75[(4'hd):(4'hb)];
          reg93 <= reg56;
        end
      else
        begin
          reg89 <= $signed(reg86);
          reg90 <= $unsigned($unsigned($signed(reg84)));
          reg91 <= $unsigned(reg90[(3'h5):(1'h1)]);
          if ({$unsigned((^~wire72[(4'he):(1'h0)]))})
            begin
              reg92 <= $signed(wire71);
            end
          else
            begin
              reg92 <= reg86[(3'h5):(3'h4)];
              reg93 <= reg55;
              reg94 <= (reg68[(1'h0):(1'h0)] ?
                  (~^reg74[(1'h0):(1'h0)]) : reg87[(2'h3):(2'h2)]);
            end
          if ($signed((|$signed(wire61[(1'h1):(1'h0)]))))
            begin
              reg95 <= ((~^wire79[(1'h0):(1'h0)]) ?
                  (-{(8'hba), wire52}) : $unsigned({reg64,
                      ((reg93 && (8'ha5)) ?
                          (wire58 ? (8'hba) : reg67) : (reg75 ?
                              (8'ha9) : reg88))}));
              reg96 <= ({reg82[(2'h3):(1'h1)]} * $signed(((^~(reg84 ?
                  wire51 : reg70)) ~^ ((reg67 == (8'hb3)) ?
                  (wire60 ? (8'hae) : (8'hba)) : (^wire78)))));
              reg97 <= {(~&(($unsigned(wire58) ?
                          (reg75 >= (7'h41)) : (-wire59)) ?
                      (wire50 ?
                          $signed(reg91) : (wire61 > (8'had))) : $signed((reg66 == wire51)))),
                  reg62[(1'h1):(1'h0)]};
            end
          else
            begin
              reg95 <= $unsigned((|(~|(&wire71))));
            end
        end
    end
  assign wire98 = (^(($unsigned((wire60 ? reg96 : (8'hae))) ?
                      (wire60[(1'h1):(1'h1)] > reg91[(3'h5):(1'h1)]) : $unsigned($signed(reg91))) - (wire53 >> reg63[(3'h7):(1'h0)])));
  assign wire99 = {$unsigned(($signed((8'ha9)) ?
                          (reg85[(2'h2):(1'h0)] ?
                              reg97 : $unsigned(wire51)) : (8'hbc)))};
  assign wire100 = {$unsigned((+wire98[(2'h2):(1'h0)])),
                       ((7'h41) || (wire79[(3'h4):(3'h4)] ?
                           $unsigned(wire98[(3'h4):(1'h1)]) : ((~&(8'hb5)) & $unsigned(reg85))))};
  assign wire101 = reg82[(2'h3):(1'h0)];
endmodule
