module top
#(parameter param171 = {{(8'had)}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire167;
  wire [(4'h8):(1'h0)] wire166;
  wire signed [(5'h11):(1'h0)] wire165;
  wire [(3'h7):(1'h0)] wire164;
  wire signed [(2'h3):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire161;
  wire signed [(4'ha):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire161,
                 wire50,
                 wire49,
                 wire48,
                 wire46,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg170,
                 reg169,
                 reg168,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = (^wire4);
  assign wire6 = $signed((^~(((8'ha5) ?
                     (8'hba) : wire5[(3'h7):(1'h0)]) || ((8'haf) || {(8'ha6)}))));
  assign wire7 = (+{(~&(~|(8'ha6))),
                     ((~^$signed((8'hbd))) ?
                         ($unsigned(wire5) ?
                             (wire6 ? wire2 : wire3) : {wire6}) : wire2)});
  assign wire8 = wire5;
  assign wire9 = (wire2 ?
                     (8'ha3) : $signed(((wire2 <<< wire8[(3'h5):(2'h3)]) + ((wire3 ?
                         (8'haa) : wire4) <= wire3[(2'h2):(1'h1)]))));
  assign wire10 = (wire8[(4'ha):(3'h4)] >= wire3[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg11 <= {$signed($signed(((wire7 <= wire0) || (8'ha7))))};
      reg12 <= (|$unsigned((({wire1, wire8} ? (&wire9) : (wire10 > wire6)) ?
          ((~wire10) <= wire8[(1'h0):(1'h0)]) : ({wire9, wire3} << (8'ha4)))));
      reg13 <= (&$unsigned(wire7));
      reg14 <= {{$signed(wire6[(1'h0):(1'h0)]),
              ((~|(wire4 ? wire3 : reg12)) == wire1[(2'h3):(2'h3)])},
          (8'ha3)};
    end
  assign wire15 = reg13[(3'h5):(3'h4)];
  assign wire16 = $signed((wire1[(4'hd):(3'h7)] ?
                      wire5 : ((~reg12[(4'hf):(4'hf)]) > wire9[(4'hf):(4'hc)])));
  assign wire17 = reg12;
  assign wire18 = ($unsigned((&(8'ha9))) ?
                      $signed(($unsigned(wire2) | wire2)) : ($unsigned($signed(wire16[(2'h2):(1'h1)])) <= wire8[(3'h5):(2'h2)]));
  assign wire19 = $signed(($signed(wire9[(5'h11):(4'ha)]) == {$unsigned({reg11,
                          (8'hb2)})}));
  module20 #() modinst47 (.wire24(wire6), .wire22(wire17), .wire25(reg14), .clk(clk), .wire23(wire16), .y(wire46), .wire21(wire7));
  assign wire48 = (~&((!(wire46 >>> $unsigned(wire4))) >> ({(wire4 <= wire9),
                      wire7} ^ wire4)));
  assign wire49 = (-{wire8[(1'h0):(1'h0)]});
  assign wire50 = (-wire15[(4'ha):(4'h9)]);
  module51 #() modinst162 (.wire55(wire9), .wire54(reg13), .wire52(wire16), .y(wire161), .wire53(wire1), .clk(clk), .wire56(wire48));
  assign wire163 = $signed(((~&((reg12 ? reg14 : wire48) ?
                           wire7[(3'h5):(3'h4)] : $unsigned((8'ha5)))) ?
                       wire17 : wire7));
  assign wire164 = $signed($unsigned(reg12[(4'h8):(1'h1)]));
  assign wire165 = $signed(($unsigned($signed({wire48, wire48})) ?
                       (reg12[(2'h2):(2'h2)] ?
                           $signed((^wire0)) : {(wire18 | wire0)}) : reg13));
  assign wire166 = (7'h42);
  assign wire167 = wire16;
  always
    @(posedge clk) begin
      if (($unsigned(reg12[(4'hc):(3'h6)]) ?
          $signed({$signed($signed(wire49)),
              $unsigned($unsigned((8'hb8)))}) : (wire163 ?
              $signed(((wire5 ? wire16 : wire46) ?
                  wire6 : (~&wire10))) : wire48)))
        begin
          reg168 <= ((^~(~|(&$unsigned(wire165)))) > wire10[(3'h4):(2'h2)]);
        end
      else
        begin
          reg168 <= ((($unsigned(wire163[(1'h1):(1'h1)]) << wire46) ?
              $unsigned((!wire3)) : (wire18[(4'hf):(4'ha)] <= wire4)) >= $unsigned((-$unsigned($signed(wire48)))));
          reg169 <= wire16[(4'hc):(3'h6)];
          reg170 <= $unsigned(wire15);
        end
    end
endmodule

module module51
#(parameter param160 = {({(((7'h43) >= (8'hb6)) <<< ((8'hb4) | (7'h44))), ((~&(8'h9d)) ? ((8'hb7) ? (8'hb3) : (8'hb5)) : ((8'ha4) ? (8'ha8) : (8'h9e)))} ? ((+(|(8'hb5))) < (((8'h9d) ? (8'ha4) : (7'h41)) ^ ((8'ha9) ? (8'ha8) : (8'ha7)))) : (((~(8'h9d)) ? (8'hbf) : ((8'ha3) <<< (8'hab))) ? (((8'hba) ? (8'ha2) : (7'h44)) < (-(7'h41))) : (&(^(8'hb4)))))})
(y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire56;
  input wire [(4'hd):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire54;
  input wire signed [(5'h13):(1'h0)] wire53;
  input wire [(5'h11):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire159;
  wire signed [(2'h3):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire57;
  assign y = {wire159, wire158, wire156, wire99, wire57, (1'h0)};
  assign wire57 = $signed(($signed(($unsigned(wire54) ?
                      {(7'h43), wire56} : wire56[(1'h0):(1'h0)])) <<< ({{wire55,
                          wire56},
                      (wire54 ^ wire53)} < $signed((wire53 ?
                      wire56 : wire55)))));
  module58 #() modinst100 (.wire59(wire56), .clk(clk), .wire61(wire57), .wire60(wire52), .wire62(wire53), .y(wire99));
  module101 #() modinst157 (.y(wire156), .wire105(wire55), .clk(clk), .wire102(wire99), .wire103(wire52), .wire104(wire56));
  assign wire158 = (wire55[(3'h4):(2'h2)] ?
                       $unsigned({wire57,
                           $signed(wire53[(5'h12):(4'hf)])}) : $signed($signed((~$signed(wire56)))));
  assign wire159 = $unsigned(wire52);
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire24;
  input wire [(3'h5):(1'h0)] wire23;
  input wire [(5'h12):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire39;
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 reg40,
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
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed((^~(~|($unsigned(wire24) <= wire23[(1'h1):(1'h0)])))))
        begin
          reg26 <= (($unsigned((!(+wire22))) <<< wire23) ? wire23 : wire22);
          if (wire21)
            begin
              reg27 <= (({$unsigned($unsigned(wire21)),
                  wire25[(3'h5):(2'h2)]} || wire25) * reg26[(1'h0):(1'h0)]);
              reg28 <= ($signed(wire23) ^~ ($unsigned(((8'hb1) ?
                      reg26 : (wire22 ? (8'hbe) : wire25))) ?
                  (($unsigned(reg26) << (~^reg26)) >> wire25[(3'h5):(2'h3)]) : $signed(wire23[(1'h0):(1'h0)])));
              reg29 <= ($signed(reg26[(1'h0):(1'h0)]) & $signed(($unsigned((!(8'hbf))) < ($signed(wire24) + reg27))));
            end
          else
            begin
              reg27 <= ({$signed((|$signed((7'h41))))} == (^~{(~^$unsigned((8'hbd)))}));
              reg28 <= ({wire22} ?
                  $unsigned(($signed((wire22 ? (7'h41) : reg27)) ?
                      $signed((!wire21)) : $unsigned((wire24 ?
                          reg26 : reg29)))) : ((8'h9d) ?
                      $signed($unsigned((wire22 || wire21))) : (8'ha0)));
              reg29 <= reg26[(2'h2):(1'h1)];
              reg30 <= $unsigned(($signed(($unsigned(wire25) == (^wire24))) ?
                  wire21[(3'h7):(2'h3)] : $unsigned((~$signed(reg27)))));
              reg31 <= $unsigned({(&$unsigned((+wire21)))});
            end
          reg32 <= $signed(wire23[(1'h1):(1'h1)]);
          reg33 <= (7'h40);
          if (wire22)
            begin
              reg34 <= {reg26[(2'h2):(1'h0)]};
              reg35 <= $signed($unsigned((wire24 ? {(&wire22)} : wire22)));
              reg36 <= (8'ha6);
              reg37 <= (8'ha5);
              reg38 <= (!$unsigned($unsigned(((wire25 ?
                  reg37 : reg36) < (&wire22)))));
            end
          else
            begin
              reg34 <= $signed(reg38);
              reg35 <= wire23;
              reg36 <= (wire23[(1'h0):(1'h0)] < (((((8'hb0) <= reg26) ?
                      $signed(wire25) : (+reg30)) >= {wire23[(3'h4):(1'h0)]}) ?
                  reg32[(1'h1):(1'h0)] : {(8'ha3),
                      (reg31 ? (^(8'ha0)) : reg32)}));
            end
        end
      else
        begin
          reg26 <= (((wire22[(5'h11):(4'he)] == (!(|(8'hb0)))) | wire22) | {reg29[(1'h1):(1'h1)]});
          if (reg29)
            begin
              reg27 <= reg29[(2'h2):(2'h2)];
            end
          else
            begin
              reg27 <= $unsigned($signed($unsigned(reg30[(3'h4):(1'h0)])));
              reg28 <= {$signed(reg36[(1'h0):(1'h0)])};
              reg29 <= ($unsigned((+{{reg31, (8'hb8)}})) || (8'ha3));
              reg30 <= $signed((~($signed($unsigned((8'ha0))) == $unsigned(wire24))));
            end
          reg31 <= $unsigned(reg29[(1'h0):(1'h0)]);
          if (reg37)
            begin
              reg32 <= (!(reg34[(1'h0):(1'h0)] > $signed($unsigned({(8'hb9)}))));
              reg33 <= (reg33 ? wire24 : (~&(8'ha0)));
            end
          else
            begin
              reg32 <= ((~&$signed((8'h9c))) ?
                  (~reg36) : (($unsigned((reg31 >> wire21)) < (~{reg28})) ?
                      reg29 : {$unsigned($signed(reg36))}));
            end
        end
    end
  assign wire39 = (((wire24[(3'h4):(1'h0)] | ((8'hbe) + (reg28 ?
                      reg27 : wire23))) && reg27[(4'hf):(3'h4)]) - {(reg30 * reg32[(3'h4):(1'h1)]),
                      reg37[(1'h1):(1'h1)]});
  always
    @(posedge clk) begin
      reg40 <= (+wire22[(4'hf):(4'hb)]);
    end
  assign wire41 = (!(|(8'ha4)));
  assign wire42 = $unsigned((((reg34 <= $unsigned((8'h9f))) >>> reg32) || (+(~&reg37[(1'h0):(1'h0)]))));
  assign wire43 = $unsigned($unsigned((reg40 ?
                      $unsigned(wire24) : ((reg29 ^~ reg33) & reg37))));
  assign wire44 = (&$signed(wire41));
  assign wire45 = ($signed($signed(wire41[(3'h4):(1'h0)])) >= reg34[(2'h3):(2'h2)]);
endmodule

module module101  (y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h27e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire105;
  input wire [(4'hb):(1'h0)] wire104;
  input wire [(3'h5):(1'h0)] wire103;
  input wire signed [(4'hd):(1'h0)] wire102;
  wire signed [(4'ha):(1'h0)] wire155;
  wire [(4'hd):(1'h0)] wire153;
  wire [(5'h11):(1'h0)] wire152;
  wire signed [(4'he):(1'h0)] wire151;
  wire signed [(5'h14):(1'h0)] wire146;
  wire signed [(3'h4):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire144;
  wire [(3'h7):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire [(4'hf):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  reg [(5'h15):(1'h0)] reg154 = (1'h0);
  reg [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg [(4'hb):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(5'h14):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  assign y = {wire155,
                 wire153,
                 wire152,
                 wire151,
                 wire146,
                 wire145,
                 wire144,
                 wire139,
                 wire122,
                 wire121,
                 wire120,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg154,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg119,
                 reg118,
                 reg117,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg106 <= (~wire104);
      reg107 <= (&wire104);
      reg108 <= wire103[(3'h4):(2'h2)];
      reg109 <= $signed(reg107[(4'hb):(4'h9)]);
      reg110 <= ($unsigned($signed(({wire102} ?
          {reg107,
              (8'ha5)} : reg108[(1'h0):(1'h0)]))) >>> (-$signed(wire105[(4'h8):(3'h6)])));
    end
  always
    @(posedge clk) begin
      reg111 <= {reg106[(3'h5):(3'h5)], reg109[(1'h0):(1'h0)]};
    end
  assign wire112 = wire104;
  assign wire113 = (|$unsigned((($signed(wire104) ?
                       (wire112 != (8'ha7)) : {wire102}) | reg106[(3'h4):(1'h1)])));
  assign wire114 = $signed((|$signed((~&$signed(wire102)))));
  assign wire115 = $unsigned(($signed({(reg109 >= (8'haa))}) || wire102[(4'hd):(2'h3)]));
  assign wire116 = ((^(wire114[(1'h1):(1'h0)] ?
                           wire113 : ((wire114 ? reg111 : wire114) ?
                               wire112[(2'h2):(1'h0)] : wire112))) ?
                       {$signed(wire114[(1'h0):(1'h0)]),
                           $unsigned(wire113)} : $signed((^$unsigned(reg108))));
  always
    @(posedge clk) begin
      reg117 <= $unsigned($signed(wire112));
      reg118 <= $unsigned((8'hb4));
      reg119 <= (wire114 * $signed(((reg107[(4'h9):(3'h6)] <<< (8'hb6)) ?
          (((8'ha0) ?
              wire113 : reg110) ^ {reg109}) : $signed($signed(wire102)))));
    end
  assign wire120 = wire115[(4'hb):(1'h0)];
  assign wire121 = ((!($unsigned($signed(wire116)) ^ wire103)) ?
                       wire113 : wire116);
  assign wire122 = $unsigned($unsigned($unsigned($signed((-wire115)))));
  always
    @(posedge clk) begin
      reg123 <= ((-(+reg107[(4'ha):(2'h3)])) <= (wire102[(2'h3):(1'h0)] ?
          reg106 : $signed(wire112[(4'h8):(4'h8)])));
      reg124 <= reg117;
      reg125 <= ((~$signed($signed($signed(reg124)))) ^~ $unsigned($signed($signed((reg118 | (8'h9d))))));
      if ((((reg108[(4'h8):(2'h3)] * ({reg110} ?
              $signed(reg109) : $signed(wire120))) ?
          {reg107[(4'hc):(3'h7)]} : $signed($unsigned((reg124 ?
              reg108 : reg118)))) ~^ ((reg124 < $signed($signed(wire112))) ^ wire120[(3'h4):(2'h2)])))
        begin
          reg126 <= {($signed(((reg123 ? wire115 : reg107) ?
                  $unsigned(wire121) : (wire114 ?
                      reg106 : wire105))) - (8'hab))};
          reg127 <= (7'h43);
          if ((8'hb4))
            begin
              reg128 <= $unsigned($unsigned(((+reg110[(2'h2):(2'h2)]) ?
                  reg118 : $signed((^(8'hba))))));
              reg129 <= wire114[(2'h3):(1'h0)];
              reg130 <= (~^(~|((8'hb5) >= reg128)));
            end
          else
            begin
              reg128 <= (wire121[(3'h6):(3'h4)] && ((8'haa) - $unsigned(wire112)));
            end
          reg131 <= wire114[(2'h2):(2'h2)];
          reg132 <= $unsigned($unsigned((({reg117} & wire113) ?
              ({reg131, wire121} << wire104) : $unsigned((8'haa)))));
        end
      else
        begin
          reg126 <= $signed(wire122);
          if ((!$signed($unsigned(((reg127 + (8'hb8)) | reg129[(2'h2):(2'h2)])))))
            begin
              reg127 <= $signed({((~(~|reg106)) >= $signed($unsigned((8'hb7)))),
                  (^(!reg125[(4'h8):(3'h4)]))});
              reg128 <= $unsigned((+$signed(reg109)));
              reg129 <= (($unsigned(((wire102 ? wire116 : wire121) ?
                  {wire105,
                      wire102} : (&(8'h9f)))) != $signed({$unsigned(reg110),
                  $signed(reg129)})) > {(~|((reg107 ? reg125 : wire113) ?
                      {reg117} : $unsigned(reg132))),
                  (+$unsigned(reg125))});
            end
          else
            begin
              reg127 <= wire112;
              reg128 <= $unsigned($signed((-$signed(wire115))));
              reg129 <= wire121;
            end
          if (((^(8'hb2)) ? wire122 : (|reg118[(3'h5):(1'h1)])))
            begin
              reg130 <= (wire104 & (|wire116));
              reg131 <= ((($signed(reg123[(2'h3):(2'h3)]) & {{reg106},
                          ((8'h9c) >>> wire113)}) ?
                      ($signed((wire112 ?
                          reg130 : reg111)) == $unsigned(((8'hb6) ?
                          reg111 : reg126))) : (wire112 ^ reg127[(1'h1):(1'h1)])) ?
                  {{{reg110[(4'h8):(3'h7)], {wire120}}, (!$unsigned((8'hbc)))},
                      {$unsigned((reg131 ? wire116 : wire102)),
                          $signed((reg107 + wire115))}} : wire115[(1'h1):(1'h1)]);
              reg132 <= {reg119};
              reg133 <= (wire102[(4'h9):(1'h0)] | ((8'hb6) * wire105));
              reg134 <= $unsigned(reg126[(2'h2):(1'h1)]);
            end
          else
            begin
              reg130 <= ((^(((~|reg107) ?
                          (wire115 ? (8'hbd) : reg126) : (wire121 ?
                              reg130 : wire116)) ?
                      $unsigned((wire103 << (8'h9d))) : (wire115[(4'h9):(1'h1)] ?
                          (^reg134) : ((8'hb2) ? wire102 : reg111)))) ?
                  wire104[(3'h4):(2'h2)] : (wire102[(3'h6):(1'h1)] > {(&wire105[(3'h7):(3'h6)]),
                      ((8'hb6) ? $unsigned(wire121) : (8'hbb))}));
              reg131 <= $unsigned((wire102[(2'h2):(2'h2)] ?
                  reg130[(5'h12):(4'h8)] : (~$unsigned((reg111 > reg125)))));
              reg132 <= reg117[(3'h5):(2'h3)];
            end
        end
      if ($unsigned((reg129 ?
          reg106 : $unsigned(({reg109, reg125} == (~|reg133))))))
        begin
          reg135 <= $signed(reg118[(3'h4):(1'h0)]);
        end
      else
        begin
          reg135 <= {(~^{{{reg128, reg118}},
                  ((~|wire103) || $signed(wire102))})};
          reg136 <= {((~|reg133) ? $signed(wire120) : wire104),
              ($signed((~|$signed(reg117))) ?
                  (&$unsigned((reg130 ?
                      wire112 : reg129))) : $signed((^reg128[(3'h7):(1'h0)])))};
          reg137 <= (~&wire114[(2'h2):(1'h1)]);
          reg138 <= ({{$signed($signed(reg111)), (!$unsigned(reg131))},
              $unsigned(((-(8'hb8)) ?
                  {wire122} : (reg107 ?
                      wire102 : (8'hba))))} >>> (reg131[(4'he):(1'h0)] ?
              (~|($signed(wire114) ? reg137 : (~reg117))) : wire116));
        end
    end
  assign wire139 = reg133[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg140 <= (+reg132);
      reg141 <= wire116[(4'h9):(4'h9)];
      reg142 <= $unsigned(wire112);
      reg143 <= (-$unsigned((+$signed((wire120 ~^ reg131)))));
    end
  assign wire144 = $signed(reg133);
  assign wire145 = (~&((-(&(~&reg118))) ?
                       $unsigned($unsigned($unsigned(wire104))) : (wire121[(4'hd):(3'h7)] ?
                           (!$unsigned(reg127)) : wire103)));
  assign wire146 = reg119;
  always
    @(posedge clk) begin
      reg147 <= wire144;
      reg148 <= $unsigned((&(((wire139 ? wire105 : reg138) ?
          $unsigned((8'hb4)) : $unsigned(reg128)) >= ($signed((8'haf)) ?
          reg141 : $signed(reg126)))));
      reg149 <= wire144;
      if ((8'ha9))
        begin
          reg150 <= ($signed({$unsigned($unsigned(wire103))}) ?
              $unsigned((~^(~(wire113 ?
                  reg129 : reg111)))) : {reg129[(1'h1):(1'h1)],
                  $signed((((8'hba) * wire114) ?
                      (reg108 * wire116) : (reg149 - reg138)))});
        end
      else
        begin
          reg150 <= ($unsigned($signed(wire139[(1'h0):(1'h0)])) ~^ wire120[(4'he):(4'ha)]);
        end
    end
  assign wire151 = wire113[(4'hb):(3'h5)];
  assign wire152 = wire103;
  assign wire153 = $unsigned(reg141);
  always
    @(posedge clk) begin
      reg154 <= $unsigned(($unsigned(wire113[(4'hf):(3'h4)]) & reg131[(3'h7):(3'h6)]));
    end
  assign wire155 = (({$unsigned((^reg143))} > reg117[(2'h2):(1'h1)]) >= wire121[(3'h5):(3'h4)]);
endmodule

module module58  (y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire62;
  input wire signed [(4'hc):(1'h0)] wire61;
  input wire [(5'h11):(1'h0)] wire60;
  input wire signed [(4'h8):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire63;
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire63,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg84,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire63 = $unsigned(wire59);
  always
    @(posedge clk) begin
      reg64 <= wire59[(1'h1):(1'h0)];
      if ((wire62 != $unsigned(wire61[(4'hb):(4'h9)])))
        begin
          if ($unsigned(($signed(wire63) ^ wire62)))
            begin
              reg65 <= wire63[(4'ha):(4'h8)];
              reg66 <= ($signed((|$signed($signed(wire60)))) ?
                  (&((reg64[(4'hd):(4'h9)] ? (!wire62) : (wire61 >>> reg65)) ?
                      (&{wire62}) : ($signed((8'hac)) ?
                          reg64 : (^wire60)))) : wire60[(4'hc):(4'hb)]);
            end
          else
            begin
              reg65 <= (^wire63);
              reg66 <= wire62[(5'h12):(3'h7)];
            end
          reg67 <= $unsigned(wire63);
          if ({((&reg65) ?
                  {reg64, wire63[(3'h5):(2'h2)]} : ({reg67[(3'h7):(3'h6)],
                          wire60} ?
                      wire59[(2'h2):(2'h2)] : (~&reg67)))})
            begin
              reg68 <= ($signed((reg65 ?
                      wire63[(3'h6):(3'h4)] : $signed((wire60 ^~ (8'hb8))))) ?
                  ((^(reg64 ?
                      $signed(reg65) : {wire59, wire63})) | $signed(((!reg65) ?
                      (reg67 < (8'h9f)) : (reg65 << wire61)))) : (({$signed(wire61),
                              {reg64}} ?
                          $signed({wire60,
                              reg65}) : $unsigned((wire62 > reg66))) ?
                      (reg66[(2'h3):(2'h2)] ?
                          (reg67 ?
                              wire60 : (wire59 && wire62)) : wire63[(2'h2):(1'h1)]) : (!reg66)));
              reg69 <= $signed(wire61[(1'h0):(1'h0)]);
            end
          else
            begin
              reg68 <= $signed(reg65);
              reg69 <= $unsigned(((!$signed((wire59 ?
                  wire62 : reg66))) - $unsigned(reg67[(1'h0):(1'h0)])));
              reg70 <= {(&(reg65 - wire60[(5'h10):(2'h3)])), wire59};
              reg71 <= $unsigned((reg67 != $signed(((wire61 - wire61) ?
                  ((8'hb9) ^~ wire63) : $signed(reg65)))));
              reg72 <= $unsigned(wire63);
            end
          if (reg69[(5'h11):(4'h9)])
            begin
              reg73 <= (~|reg67[(4'h9):(1'h1)]);
              reg74 <= {(&$unsigned(((reg67 && (8'ha3)) ^ (^wire59)))),
                  {$signed((|reg69)), $unsigned($unsigned({wire60}))}};
              reg75 <= reg67[(3'h5):(3'h5)];
            end
          else
            begin
              reg73 <= $signed({$signed(reg65), reg66[(3'h4):(1'h1)]});
              reg74 <= (^~(reg64 < (~^(8'haf))));
              reg75 <= $unsigned(wire59);
              reg76 <= (reg72[(4'h9):(2'h3)] >>> (wire63[(2'h2):(2'h2)] ?
                  $signed(($unsigned(wire62) >> $unsigned(wire61))) : reg67[(3'h7):(3'h4)]));
            end
        end
      else
        begin
          reg65 <= reg74[(1'h0):(1'h0)];
          reg66 <= (~&$unsigned(wire60));
        end
      if ($unsigned((~^$unsigned((^~$unsigned(reg72))))))
        begin
          reg77 <= $signed($signed(wire61));
          reg78 <= wire60;
          reg79 <= $signed(reg68);
        end
      else
        begin
          reg77 <= (-(-reg76[(4'h8):(2'h2)]));
          reg78 <= ((wire63[(1'h1):(1'h0)] ?
                  (wire62 ?
                      reg70[(3'h4):(2'h3)] : reg77[(2'h2):(1'h1)]) : reg74) ?
              {(8'h9f), reg67[(3'h7):(3'h7)]} : reg66);
        end
      reg80 <= $unsigned($unsigned(({reg75[(3'h6):(3'h4)], $unsigned(reg64)} ?
          reg79[(1'h1):(1'h0)] : (((8'ha4) <= wire59) ~^ (wire60 * wire62)))));
    end
  always
    @(posedge clk) begin
      reg81 <= (+(reg75[(3'h6):(3'h5)] + $unsigned($signed($signed(reg73)))));
      reg82 <= $signed(reg75[(3'h4):(1'h1)]);
    end
  assign wire83 = $signed(((^~wire60[(4'hd):(4'h8)]) ?
                      ((~{reg70, (7'h40)}) ?
                          ($signed(reg64) ?
                              ((8'hb7) << reg65) : wire59) : $signed(((8'hb0) ?
                              wire62 : reg68))) : (8'hb4)));
  always
    @(posedge clk) begin
      reg84 <= ((~^(wire83[(2'h3):(2'h3)] ?
              (-(reg70 ? reg67 : reg75)) : $unsigned((reg72 * (8'hb8))))) ?
          (($signed((reg82 & reg65)) - (reg69[(1'h1):(1'h0)] * (reg81 ?
              (8'hac) : reg79))) && reg69) : wire60[(3'h7):(3'h5)]);
    end
  assign wire85 = (|($unsigned($signed(reg82)) ?
                      (^~(~^reg79[(2'h3):(2'h3)])) : (+reg76)));
  assign wire86 = reg75;
  assign wire87 = $unsigned((~(8'ha0)));
  always
    @(posedge clk) begin
      reg88 <= wire63;
      reg89 <= $unsigned(reg82[(2'h2):(1'h0)]);
      if (wire86[(2'h2):(2'h2)])
        begin
          reg90 <= $unsigned(({reg70} >= ({(reg67 > wire63),
              $signed(reg76)} <<< $unsigned($unsigned(wire59)))));
          reg91 <= $signed({reg77});
          if ((reg81[(1'h1):(1'h1)] ?
              (reg65[(2'h3):(1'h0)] ?
                  $signed($unsigned((reg79 ?
                      reg90 : wire61))) : ({wire62[(2'h3):(1'h1)],
                          (reg72 ? reg81 : reg80)} ?
                      ((reg73 ? reg64 : reg67) ?
                          (!reg90) : (wire86 ?
                              (8'h9e) : (8'hb9))) : (~&{reg66}))) : $signed($unsigned($unsigned({reg75,
                  reg65})))))
            begin
              reg92 <= (!(reg89 ?
                  ((&wire63[(1'h1):(1'h0)]) ? reg77 : (8'hbe)) : ((^(reg75 ?
                          reg81 : reg75)) ?
                      $signed(((8'haa) | reg80)) : $unsigned($signed(reg80)))));
              reg93 <= {(&$unsigned((reg69 != $signed(wire62))))};
            end
          else
            begin
              reg92 <= (~^$signed({{(8'hb7)}}));
            end
        end
      else
        begin
          reg90 <= reg70[(3'h4):(2'h3)];
          reg91 <= $unsigned(($unsigned((reg69[(4'ha):(2'h3)] + (|reg66))) ?
              (8'hbc) : ((reg81[(3'h5):(3'h4)] > wire83) << ({(8'haa)} ?
                  $signed((8'hb1)) : ((8'hae) ? (8'hac) : (8'haa))))));
          reg92 <= reg71[(2'h3):(2'h3)];
          reg93 <= $unsigned(wire86[(3'h7):(3'h6)]);
          reg94 <= (({$unsigned({(8'hb5), wire59})} ^ (~^{reg69})) & ({{{reg91,
                      wire87}}} || wire87[(2'h3):(2'h2)]));
        end
    end
  assign wire95 = (8'hbe);
  assign wire96 = $unsigned({$unsigned((~|{wire63})),
                      (reg73 & ((!(8'hb3)) ?
                          (wire63 ^~ (8'hbc)) : {(8'hb3), reg91}))});
  assign wire97 = $signed((+$signed((~|$unsigned(reg71)))));
  assign wire98 = (~(8'hb4));
endmodule
