module top
#(parameter param167 = (~|({((~|(8'ha3)) + (8'hb3)), (~{(8'ha6), (8'hab)})} & ({{(8'ha6), (8'ha7)}} ? (((8'hb5) ? (8'had) : (8'h9e)) ? (~(7'h40)) : ((8'hae) ? (8'h9d) : (7'h44))) : (((8'h9f) && (8'ha4)) != (~&(8'hb7)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire166;
  wire [(2'h2):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire164;
  wire signed [(3'h6):(1'h0)] wire163;
  wire [(4'hb):(1'h0)] wire162;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire142;
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  reg [(4'hc):(1'h0)] reg159 = (1'h0);
  reg [(4'h9):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(5'h14):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire21,
                 wire22,
                 wire142,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
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
                 (1'h0)};
  assign wire5 = $unsigned(wire4[(1'h0):(1'h0)]);
  assign wire6 = {($unsigned((&$signed(wire2))) && $signed($unsigned({wire4,
                         wire1})))};
  assign wire7 = $unsigned($unsigned($signed((wire1 ?
                     $signed(wire5) : $unsigned(wire3)))));
  assign wire8 = wire0[(5'h13):(4'hc)];
  assign wire9 = ($unsigned($unsigned((&(wire4 ? wire6 : wire4)))) ?
                     (~(~{wire7[(5'h11):(5'h10)],
                         (wire8 != (8'hbd))})) : {wire8,
                         {$unsigned($unsigned((8'ha9))),
                             wire8[(3'h6):(2'h3)]}});
  assign wire10 = wire8;
  always
    @(posedge clk) begin
      reg11 <= ((^~(&($signed(wire8) && ((8'hbb) ? wire7 : wire5)))) ?
          $signed({($signed((8'hb7)) ^ $unsigned(wire5))}) : (-wire8[(4'hc):(2'h3)]));
      reg12 <= reg11;
      if (($signed(($signed($signed(wire8)) + $unsigned($signed(wire0)))) ?
          $signed((($signed(wire2) ?
              wire9[(4'he):(1'h0)] : wire3[(1'h0):(1'h0)]) <<< wire0)) : $unsigned(wire9)))
        begin
          reg13 <= wire3;
        end
      else
        begin
          reg13 <= $signed(wire8);
          if (($unsigned((~|($signed((8'hbc)) ?
              reg13[(1'h0):(1'h0)] : wire2[(3'h6):(3'h5)]))) - $signed((($unsigned((7'h40)) ?
              (wire9 <<< wire10) : (^wire3)) ~^ $signed((wire0 ?
              (8'h9f) : wire4))))))
            begin
              reg14 <= ($unsigned($unsigned(({reg13,
                      reg13} ^ $unsigned((8'hb6))))) ?
                  (wire3 <= wire8) : wire1[(3'h5):(2'h3)]);
            end
          else
            begin
              reg14 <= (+$signed(wire4));
            end
          if ($unsigned($unsigned(({$signed(reg14)} ?
              wire1 : (~&(reg11 ? wire6 : wire6))))))
            begin
              reg15 <= (wire10[(4'ha):(2'h2)] ?
                  $signed(reg11) : $unsigned((~{(~&reg13)})));
              reg16 <= {wire2};
              reg17 <= $unsigned($unsigned((-({wire2} == (^~(8'hb7))))));
              reg18 <= $unsigned({$signed($signed((wire5 <<< wire10)))});
              reg19 <= reg14[(1'h0):(1'h0)];
            end
          else
            begin
              reg15 <= (|reg14);
            end
        end
      reg20 <= ({($signed($unsigned(reg18)) ?
              (wire2[(1'h1):(1'h1)] & (!wire9)) : $unsigned((wire2 ?
                  reg11 : (8'hb8)))),
          {((-reg17) ? (reg16 << wire2) : $unsigned(wire0)),
              reg16[(2'h2):(1'h0)]}} >>> (-(($signed(wire0) < (wire4 ?
          wire7 : wire3)) | wire7[(2'h3):(2'h3)])));
    end
  assign wire21 = wire5[(1'h0):(1'h0)];
  assign wire22 = wire1[(3'h6):(2'h2)];
  module23 #() modinst143 (wire142, clk, wire4, wire2, wire9, wire0, wire6);
  always
    @(posedge clk) begin
      reg144 <= $unsigned($unsigned($unsigned($signed(((8'hbb) ?
          reg14 : (8'had))))));
      if ($signed((({(~&reg13), $signed(reg12)} ?
          ((~^reg16) ?
              $unsigned(wire1) : $unsigned(reg15)) : ($signed((8'hbc)) ?
              (wire21 ? reg17 : wire22) : {wire2})) - (^reg16[(3'h6):(2'h2)]))))
        begin
          reg145 <= {(wire7 ?
                  $signed({reg19[(1'h0):(1'h0)]}) : {reg18,
                      (^~((7'h41) * (8'hb4)))}),
              wire10};
          reg146 <= wire8;
          reg147 <= $unsigned(($signed($unsigned({wire4})) ?
              wire8 : ($unsigned((wire22 << reg17)) ?
                  wire10 : ($signed(reg11) > wire5))));
        end
      else
        begin
          reg145 <= (~&(~|$unsigned(reg146)));
          reg146 <= {$signed((wire4 ^ $signed((wire2 ? reg19 : reg13)))),
              reg19};
          reg147 <= (8'haf);
          reg148 <= {$signed((~(+reg147)))};
          reg149 <= $unsigned((($unsigned((|wire142)) - $signed($unsigned(reg16))) ?
              $signed({reg18, $signed(wire2)}) : $signed(reg11)));
        end
      reg150 <= (((reg145[(2'h2):(1'h1)] ~^ (&wire8[(4'he):(4'hc)])) <= $signed((wire3 ?
              $unsigned(wire7) : reg16))) ?
          wire3[(1'h1):(1'h0)] : (reg146[(5'h11):(4'hd)] * {$unsigned(wire10)}));
      if (wire22)
        begin
          if ($signed($unsigned((~|($unsigned(reg18) ?
              (wire8 ? reg17 : (8'ha4)) : $unsigned(wire2))))))
            begin
              reg151 <= wire3;
              reg152 <= (($signed((^$unsigned(reg144))) <= $signed({(8'hae)})) >> ((reg13 && reg151[(1'h1):(1'h0)]) ?
                  {((reg148 >> reg150) >= wire8),
                      (~(wire22 ?
                          reg144 : wire9))} : (&(reg18[(1'h1):(1'h1)] << ((7'h43) < reg148)))));
            end
          else
            begin
              reg151 <= (reg147[(3'h6):(1'h0)] > (~|(reg19[(1'h1):(1'h0)] - $unsigned((reg20 ?
                  reg20 : reg12)))));
              reg152 <= ($unsigned(($signed(wire3) > reg14)) ?
                  ({$unsigned((&reg11)), {(!reg149)}} ?
                      (reg147[(2'h3):(2'h2)] >>> ($unsigned(wire4) && (|wire9))) : ((wire10[(2'h3):(1'h1)] ?
                              (reg17 ? wire10 : reg12) : {(8'hb1)}) ?
                          ((wire21 ^ wire8) ?
                              (&wire6) : (-(8'hbf))) : reg12)) : wire0);
              reg153 <= $unsigned($unsigned((-(reg150 >> $unsigned(wire9)))));
              reg154 <= reg20[(4'h9):(2'h2)];
              reg155 <= $unsigned(wire6);
            end
          if (reg144[(2'h2):(2'h2)])
            begin
              reg156 <= (reg19 ?
                  reg148 : {$signed($unsigned(wire22[(2'h3):(1'h0)]))});
              reg157 <= (-({((~^reg150) ? $signed(wire5) : {reg153, reg15})} ?
                  ({(wire7 <= wire4),
                      (reg155 ?
                          reg20 : reg149)} == $signed(reg12[(2'h2):(1'h0)])) : ($signed(((8'ha8) ?
                      wire9 : reg17)) << ($unsigned(reg149) >>> reg144))));
            end
          else
            begin
              reg156 <= reg19;
            end
          if (wire6[(4'hd):(3'h7)])
            begin
              reg158 <= reg145;
            end
          else
            begin
              reg158 <= ((wire0 & $unsigned(reg150[(4'he):(3'h6)])) ?
                  wire5[(3'h6):(2'h2)] : ($unsigned((reg12 || (~reg152))) << ((|$signed((7'h40))) & reg150)));
              reg159 <= {$signed(({reg157} ?
                      (((8'hb8) ? (8'hbb) : reg146) ?
                          (!reg14) : $unsigned(reg12)) : ((wire21 ?
                              wire8 : reg20) ?
                          (7'h42) : reg148[(4'he):(1'h1)]))),
                  $signed((reg155 ^ $unsigned($signed((8'h9c)))))};
              reg160 <= {reg15};
            end
          reg161 <= (~|reg149);
        end
      else
        begin
          if (reg151)
            begin
              reg151 <= (reg13 ?
                  $signed($signed(reg18)) : $signed((((8'h9d) ?
                      reg20 : $signed((8'h9c))) ^ reg153[(2'h2):(1'h0)])));
              reg152 <= $unsigned($signed((+{(|(8'h9d))})));
              reg153 <= $unsigned(reg160[(3'h7):(3'h6)]);
              reg154 <= (~^$unsigned($signed((reg145 ?
                  reg11[(4'hf):(3'h5)] : (reg160 | wire6)))));
            end
          else
            begin
              reg151 <= wire5;
            end
          reg155 <= (~^(reg149 && reg156[(1'h1):(1'h1)]));
          if (((((^~{reg16, reg145}) ?
                  (~^((8'hbd) ? reg158 : wire0)) : reg159) ?
              reg153[(1'h0):(1'h0)] : (((reg144 & (8'ha0)) < {reg153,
                  reg16}) >= reg156[(1'h0):(1'h0)])) * (($signed(wire0[(1'h1):(1'h0)]) ?
              $unsigned(wire21[(2'h2):(2'h2)]) : ((^wire10) < (+(8'hbc)))) >= reg16[(4'h9):(1'h1)])))
            begin
              reg156 <= (~$unsigned(((reg161[(2'h3):(2'h3)] ?
                  $unsigned(reg15) : $unsigned(reg155)) && wire10[(3'h4):(2'h3)])));
              reg157 <= (($unsigned($unsigned(reg157)) ^~ ((((8'h9e) ?
                  reg147 : reg145) >>> $unsigned(wire8)) < reg152)) <= (~&$unsigned(reg151[(2'h2):(1'h0)])));
              reg158 <= ({$unsigned(reg18[(3'h4):(3'h4)]),
                      $signed($signed((wire21 ? wire4 : reg154)))} ?
                  ((!(reg147 ?
                      (reg159 ^~ reg19) : (reg161 ?
                          wire0 : (8'hb9)))) | reg17) : reg156);
              reg159 <= wire8[(2'h2):(1'h1)];
              reg160 <= {reg144};
            end
          else
            begin
              reg156 <= ((~$signed(($unsigned(reg16) >> $signed(wire21)))) & $unsigned($unsigned((reg160[(1'h1):(1'h1)] ?
                  {reg14, reg19} : $unsigned(wire1)))));
              reg157 <= (~&$signed($unsigned($signed((wire7 ?
                  reg20 : reg150)))));
              reg158 <= reg155[(4'h9):(1'h0)];
              reg159 <= $signed($signed((((reg149 < wire3) ?
                  {reg149, reg16} : (reg146 ?
                      (8'hbd) : wire4)) ^ $signed((8'haf)))));
            end
        end
    end
  assign wire162 = $unsigned((reg153 ?
                       $unsigned({(reg157 ^~ reg18),
                           $unsigned(reg155)}) : (+{{(8'hac)}, (!reg145)})));
  assign wire163 = $unsigned($unsigned((~^(wire21 * $signed(reg148)))));
  assign wire164 = $unsigned($unsigned($signed(((wire2 <<< reg161) < reg17))));
  assign wire165 = reg151;
  assign wire166 = $unsigned({wire164});
endmodule

module module23  (y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire [(5'h10):(1'h0)] wire27;
  input wire [(4'hb):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire139;
  wire [(4'h9):(1'h0)] wire138;
  wire signed [(3'h6):(1'h0)] wire137;
  wire [(4'h9):(1'h0)] wire136;
  wire signed [(3'h7):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire134;
  wire signed [(5'h14):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  wire signed [(3'h7):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire100;
  wire signed [(4'hd):(1'h0)] wire125;
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire29,
                 wire97,
                 wire99,
                 wire100,
                 wire125,
                 (1'h0)};
  assign wire29 = $signed(wire24[(1'h1):(1'h1)]);
  module30 #() modinst98 (.wire32(wire26), .wire33(wire29), .y(wire97), .wire31(wire25), .clk(clk), .wire34(wire27));
  assign wire99 = wire29;
  assign wire100 = $signed((-wire25));
  module101 #() modinst126 (.wire105(wire28), .wire102(wire27), .wire103(wire25), .wire106(wire97), .wire104(wire99), .y(wire125), .clk(clk));
  assign wire127 = $unsigned($signed(wire25));
  assign wire128 = $signed(wire27);
  assign wire129 = $signed((-wire26));
  assign wire130 = $signed(($signed(($signed(wire27) ~^ (~^wire128))) ?
                       (8'ha7) : {(~{wire27, wire25}), wire100}));
  assign wire131 = $signed(wire25);
  assign wire132 = (~$signed(wire28));
  assign wire133 = wire128;
  assign wire134 = (+$signed((8'hbb)));
  assign wire135 = $unsigned((+{wire97[(3'h7):(1'h0)]}));
  assign wire136 = wire134;
  assign wire137 = wire26;
  assign wire138 = ((wire137 ? wire131[(2'h3):(2'h2)] : $signed(wire134)) ?
                       wire129 : $unsigned(($signed($unsigned(wire131)) ?
                           (8'hb7) : ((wire28 && wire125) ?
                               $signed(wire99) : (+wire133)))));
  assign wire139 = ($unsigned(({(-wire26), wire25} >> ((-wire132) ?
                       $unsigned(wire25) : (wire25 >> wire97)))) && ($signed(wire132) || wire99[(4'ha):(2'h2)]));
  assign wire140 = $signed((({(8'haa)} >= $unsigned(wire29[(3'h5):(1'h1)])) ?
                       ($unsigned(wire130) ?
                           (8'hab) : wire131[(2'h2):(2'h2)]) : ({wire24[(1'h0):(1'h0)]} ?
                           $unsigned((wire127 ^~ wire134)) : $signed((|(8'hab))))));
  assign wire141 = (({$signed((+wire138))} * (wire129[(2'h2):(2'h2)] ?
                       $unsigned($signed(wire27)) : wire127[(4'h8):(1'h0)])) != wire28[(4'h9):(1'h0)]);
endmodule

module module101
#(parameter param124 = (~^((!(+((8'hbb) ? (8'hbf) : (8'hbc)))) ? ({((8'hb4) ? (8'ha5) : (8'hbe)), ((8'ha1) <<< (8'hb8))} ? (8'ha9) : (|(~&(8'haf)))) : ((~{(7'h44)}) ~^ ({(8'hb2), (8'ha0)} ~^ ((8'ha6) ^ (7'h42)))))))
(y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire106;
  input wire signed [(4'hb):(1'h0)] wire105;
  input wire signed [(2'h3):(1'h0)] wire104;
  input wire [(3'h4):(1'h0)] wire103;
  input wire [(5'h10):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire122;
  wire [(5'h11):(1'h0)] wire121;
  wire signed [(4'hb):(1'h0)] wire120;
  wire signed [(3'h5):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire [(2'h3):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire107;
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg117,
                 (1'h0)};
  assign wire107 = ((($signed((~^wire104)) * (~$unsigned(wire103))) < wire105[(3'h5):(1'h0)]) ?
                       $unsigned((wire105[(3'h7):(3'h5)] << (8'ha7))) : ($signed((8'haa)) >= ($unsigned(((8'hae) ?
                           wire103 : wire106)) & (wire102 ?
                           (wire102 ?
                               wire105 : wire102) : $unsigned(wire105)))));
  assign wire108 = {(&{$unsigned((wire107 <= wire107)), (|wire105)}),
                       ((~|(^$signed((8'ha6)))) ~^ wire107[(3'h5):(2'h3)])};
  assign wire109 = wire106[(4'he):(4'h8)];
  assign wire110 = (~^$unsigned($signed((+((8'haf) ? wire105 : wire102)))));
  assign wire111 = {$signed(((wire105[(3'h7):(1'h1)] ?
                               wire107[(2'h2):(1'h1)] : (8'h9d)) ?
                           $signed((wire110 > wire102)) : ((wire108 < wire105) & (wire110 >>> wire109))))};
  assign wire112 = ($unsigned($unsigned(({wire105} <= (wire108 <<< wire104)))) * $signed(wire109[(2'h2):(1'h0)]));
  assign wire113 = (wire111 <= (|(^~wire105[(4'hb):(4'h8)])));
  assign wire114 = $signed($signed($unsigned((8'hb6))));
  assign wire115 = wire111[(2'h3):(1'h0)];
  assign wire116 = $signed((8'hbe));
  always
    @(posedge clk) begin
      reg117 <= {wire115[(4'hc):(3'h4)]};
    end
  assign wire118 = ($unsigned(wire114) <<< wire109[(1'h0):(1'h0)]);
  assign wire119 = (wire114 ?
                       ($unsigned($signed({wire102})) <<< ($unsigned((^~wire111)) * ((|wire118) ?
                           (wire108 >>> wire115) : $signed(wire105)))) : wire111);
  assign wire120 = $signed(($signed(($signed(wire118) ~^ $unsigned(wire113))) ?
                       (+wire119[(3'h4):(3'h4)]) : reg117));
  assign wire121 = wire118;
  assign wire122 = $unsigned((wire111[(4'ha):(3'h5)] && wire112[(1'h0):(1'h0)]));
  assign wire123 = (wire114 == (wire102 ?
                       ($signed(wire102[(2'h3):(1'h1)]) ?
                           ((wire116 ^~ reg117) ?
                               {wire118,
                                   wire116} : wire103[(1'h0):(1'h0)]) : $signed(wire102)) : wire116[(1'h0):(1'h0)]));
endmodule

module module30
#(parameter param95 = (!((&(((8'ha7) ? (8'haa) : (8'h9d)) ~^ (!(8'hb3)))) ? (8'hb5) : (7'h43))), 
parameter param96 = (((8'h9f) ? ((~&(param95 ^~ param95)) ? ((param95 != param95) ? (|param95) : param95) : ({(8'h9f)} != (param95 << param95))) : (param95 | {param95})) ? {({(param95 * param95)} ? param95 : ((param95 ? (8'ha5) : param95) ? (param95 ? param95 : param95) : (param95 == param95))), (^~param95)} : ((param95 >>> (7'h40)) ? (~^({param95, param95} * (param95 > param95))) : param95)))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h302):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire34;
  input wire signed [(3'h5):(1'h0)] wire33;
  input wire signed [(3'h4):(1'h0)] wire32;
  input wire [(3'h7):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire [(3'h7):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  assign y = {wire94,
                 wire90,
                 wire89,
                 wire88,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg93,
                 reg92,
                 reg91,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
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
                 reg63,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire35 = wire33;
  assign wire36 = (|(wire33[(2'h2):(1'h1)] ?
                      $unsigned(wire31[(1'h1):(1'h0)]) : $signed($unsigned($unsigned(wire34)))));
  assign wire37 = ($signed((wire31[(1'h1):(1'h1)] ?
                          wire35[(3'h7):(3'h4)] : wire34)) ?
                      ($signed((wire32 ?
                          (wire31 ?
                              wire36 : wire32) : wire32)) * $signed(((wire33 >>> wire31) ?
                          (&wire33) : (wire34 ?
                              wire31 : wire31)))) : $signed({({wire33, wire34} ?
                              ((8'ha4) ^ wire32) : {wire34, wire34}),
                          $signed((wire35 - wire36))}));
  assign wire38 = ($unsigned(wire34[(4'hb):(3'h4)]) ?
                      $unsigned($signed((wire32[(1'h1):(1'h1)] ?
                          wire35[(4'ha):(4'h8)] : wire37))) : {$unsigned(wire33[(1'h1):(1'h0)])});
  assign wire39 = $unsigned($signed(((wire36[(4'he):(2'h2)] > $signed(wire38)) ?
                      (wire32[(2'h3):(2'h2)] || {wire33}) : wire33)));
  assign wire40 = $unsigned((!$signed($unsigned($unsigned(wire38)))));
  always
    @(posedge clk) begin
      reg41 <= $signed($unsigned(wire40[(2'h2):(1'h1)]));
    end
  always
    @(posedge clk) begin
      if (wire34[(2'h2):(2'h2)])
        begin
          if (($signed((~&wire31[(3'h7):(3'h7)])) ?
              $signed($unsigned($unsigned((~^wire31)))) : (~|(~|(wire34 == (reg41 ?
                  (8'ha3) : wire32))))))
            begin
              reg42 <= (&(8'ha8));
              reg43 <= $signed(wire37);
              reg44 <= wire36;
              reg45 <= (($signed(($signed(wire34) & (wire34 ?
                          wire32 : wire39))) ?
                      ({wire39[(3'h7):(3'h7)]} ? wire32 : (8'ha0)) : reg42) ?
                  $unsigned((~((+wire34) ? wire40 : {reg44, reg44}))) : reg41);
            end
          else
            begin
              reg42 <= (^~wire38);
              reg43 <= $signed(wire37[(1'h1):(1'h1)]);
              reg44 <= $unsigned((8'hb6));
              reg45 <= wire36;
            end
          reg46 <= (wire34[(2'h3):(2'h2)] ?
              $signed((reg42 ?
                  $signed(reg44) : $unsigned($unsigned(wire32)))) : $signed(($signed(wire36[(4'he):(4'hd)]) ?
                  ((wire38 ? wire31 : wire37) ?
                      wire32 : reg42[(5'h12):(4'h9)]) : $unsigned($signed((8'hb0))))));
        end
      else
        begin
          reg42 <= ($signed($unsigned(((wire40 ?
                  reg46 : wire31) & $signed(wire37)))) ?
              reg44[(4'ha):(3'h4)] : (!(&reg41)));
        end
      if ($signed(({$signed(wire32[(3'h4):(1'h0)]),
              ((reg41 ? wire33 : wire32) || (reg42 != reg46))} ?
          (reg44 ? reg44 : reg41) : $unsigned($signed(wire37)))))
        begin
          reg47 <= ((((~|(wire39 ?
              (8'hb5) : reg46)) == (!wire37)) >= wire39[(2'h2):(2'h2)]) | $unsigned($signed((~&wire31[(3'h4):(2'h3)]))));
          reg48 <= (|(wire40 ?
              ($signed(reg45) ?
                  wire39[(4'h9):(3'h6)] : reg47) : reg43[(3'h5):(1'h0)]));
          if (reg41[(3'h7):(2'h3)])
            begin
              reg49 <= {(^~reg45),
                  ($unsigned(wire31[(2'h2):(2'h2)]) ?
                      wire32[(1'h1):(1'h1)] : $signed((8'h9e)))};
            end
          else
            begin
              reg49 <= (wire35[(3'h4):(2'h2)] ?
                  reg45[(4'h9):(2'h2)] : $signed(((~&((8'h9e) << reg48)) ?
                      (8'ha9) : {wire39[(4'h8):(4'h8)]})));
              reg50 <= reg46;
              reg51 <= ($signed(reg44) && wire36[(2'h2):(2'h2)]);
            end
          if (wire31)
            begin
              reg52 <= (~&$signed({reg50[(4'hf):(3'h7)], {{reg44}}}));
              reg53 <= wire36[(4'h9):(1'h0)];
              reg54 <= (8'hae);
            end
          else
            begin
              reg52 <= ($signed(($signed((-(7'h43))) && $unsigned($unsigned(reg41)))) == (+$signed($signed(reg46[(5'h10):(4'h9)]))));
              reg53 <= wire31[(2'h2):(1'h0)];
              reg54 <= wire39;
              reg55 <= ($signed({{(wire32 <= wire35)}}) ?
                  reg46[(1'h0):(1'h0)] : ($signed($signed((8'ha5))) != {(8'had)}));
              reg56 <= reg46;
            end
        end
      else
        begin
          reg47 <= wire36[(4'hc):(2'h3)];
          reg48 <= (wire37 >= $unsigned(reg46[(4'h8):(2'h3)]));
          reg49 <= (~^(~^(~^reg56)));
        end
      reg57 <= reg52;
      if ($signed($signed(wire31[(3'h6):(2'h2)])))
        begin
          if (((((^reg52) & $unsigned(reg45)) != {$signed((reg48 <<< reg44))}) >= reg49))
            begin
              reg58 <= $signed($unsigned($unsigned((reg44 ?
                  reg57 : (+reg52)))));
            end
          else
            begin
              reg58 <= $signed(reg48);
              reg59 <= (&{($unsigned(((8'hb8) * reg58)) - $unsigned((~|reg54))),
                  reg42});
              reg60 <= (wire32[(2'h2):(2'h2)] >= $unsigned($signed((+wire38))));
              reg61 <= $unsigned(reg43);
            end
          reg62 <= $unsigned((-(((|reg41) * (wire32 != wire38)) ?
              $unsigned(((8'hb9) >> wire33)) : ((wire35 && reg60) ~^ {reg47}))));
        end
      else
        begin
          reg58 <= {$unsigned(wire35[(4'he):(4'h8)])};
          reg59 <= $signed({(&reg47[(2'h2):(1'h1)]),
              ($signed($signed(reg53)) * $unsigned((~&reg44)))});
          reg60 <= reg41;
          reg61 <= ({(((reg45 + reg62) + {wire31,
                      reg54}) <<< reg55[(2'h3):(2'h3)])} ?
              ({$signed((~reg52)), wire33[(2'h2):(2'h2)]} ?
                  $unsigned((reg47[(3'h4):(2'h3)] && $unsigned(reg56))) : ((+wire40[(3'h7):(3'h6)]) ?
                      (reg50[(3'h7):(3'h4)] ?
                          {reg42,
                              (8'h9f)} : reg50[(4'h8):(3'h6)]) : reg43[(4'hc):(3'h4)])) : $unsigned(($signed(reg41[(5'h13):(4'ha)]) ?
                  (~|wire34) : $signed((reg42 ^ reg46)))));
        end
      reg63 <= {{$signed(wire36[(4'ha):(1'h0)]),
              ((^~(reg48 * reg53)) ? reg55 : reg51)},
          $signed($signed(reg47))};
    end
  assign wire64 = $signed(wire33);
  assign wire65 = {((reg47 ? (-$unsigned(wire36)) : $signed(reg44)) ?
                          (($unsigned(wire36) <<< reg41[(1'h0):(1'h0)]) ?
                              reg53[(3'h5):(3'h5)] : $unsigned(wire34)) : (({reg59} != (~^reg45)) ^ $signed({reg50,
                              (8'hae)}))),
                      $unsigned(($unsigned(reg47[(2'h2):(2'h2)]) && $signed($signed(reg56))))};
  assign wire66 = $unsigned($unsigned($unsigned((reg43 && wire37[(3'h4):(1'h1)]))));
  assign wire67 = wire31[(2'h2):(1'h1)];
  assign wire68 = ($unsigned((~&(!(|reg42)))) ? wire31 : reg51[(2'h2):(1'h0)]);
  assign wire69 = (~^reg55);
  always
    @(posedge clk) begin
      reg70 <= (8'ha3);
      if ($unsigned(((|wire38[(4'he):(3'h7)]) >= ((-((8'ha4) ~^ (8'hbf))) - ((reg70 ?
              (8'hbd) : reg41) ?
          (8'hbc) : reg53)))))
        begin
          reg71 <= (~|{((|$signed(reg58)) << (((8'ha6) ? wire69 : wire64) ?
                  wire69[(2'h3):(1'h0)] : (~&wire36)))});
          if ((^{$signed(({(8'hbd), (7'h40)} ?
                  $signed(wire68) : (wire34 <= wire68)))}))
            begin
              reg72 <= {{{(reg54[(1'h0):(1'h0)] || (reg49 ? reg52 : (8'ha7))),
                          (wire68[(2'h2):(2'h2)] <<< (reg61 ?
                              reg70 : (8'hb5)))}},
                  wire35[(4'h8):(3'h4)]};
              reg73 <= $signed(wire68[(2'h2):(1'h1)]);
              reg74 <= wire33;
            end
          else
            begin
              reg72 <= $signed((!$unsigned({(-reg42), reg55[(1'h0):(1'h0)]})));
              reg73 <= wire68[(2'h2):(1'h1)];
              reg74 <= {{(&((wire37 << (7'h44)) && (wire35 - wire65)))},
                  wire64[(1'h1):(1'h0)]};
              reg75 <= {{(&reg46), reg74[(2'h3):(2'h3)]}};
            end
          reg76 <= wire40;
          if (((~&reg59[(4'hd):(3'h7)]) ?
              reg71[(4'ha):(1'h1)] : wire34[(4'hc):(3'h6)]))
            begin
              reg77 <= $unsigned((reg42[(4'hc):(4'h8)] ^ (wire34 < $unsigned(reg52))));
              reg78 <= (-$unsigned((~^$signed((!reg43)))));
              reg79 <= reg62[(3'h5):(3'h5)];
            end
          else
            begin
              reg77 <= ($signed(wire67) != $unsigned(($signed($unsigned(reg59)) ?
                  reg76[(2'h3):(2'h3)] : reg51)));
              reg78 <= $unsigned((8'h9f));
              reg79 <= wire67[(3'h5):(2'h3)];
              reg80 <= {{reg55, (^~$signed({reg57}))}, wire34};
            end
          if ((wire65[(3'h6):(3'h4)] ?
              $unsigned($signed(reg43[(4'he):(4'hd)])) : $unsigned({$signed(reg43)})))
            begin
              reg81 <= $unsigned(reg52[(4'h8):(3'h4)]);
              reg82 <= (^~(wire34 <= {wire64[(2'h3):(1'h1)]}));
              reg83 <= (((7'h41) ?
                  ($unsigned((reg51 <<< (8'h9c))) <<< (-wire68)) : wire38) ^~ (~$unsigned(((wire69 > wire67) != reg72[(4'h8):(4'h8)]))));
              reg84 <= wire34;
              reg85 <= $signed($signed($unsigned(reg52[(4'ha):(3'h4)])));
            end
          else
            begin
              reg81 <= (({$signed((reg79 > wire33)),
                  $signed((~^wire67))} && $unsigned((wire65[(4'h9):(3'h4)] ?
                  (reg47 ?
                      reg58 : (7'h40)) : $unsigned((8'hbe))))) <= $signed((wire32[(2'h2):(1'h0)] ?
                  $unsigned(wire66) : $unsigned($unsigned(reg58)))));
              reg82 <= (^~(($unsigned($signed((8'hb1))) ?
                  reg80 : $unsigned(wire34)) <= (&reg80)));
              reg83 <= reg46[(2'h3):(1'h0)];
              reg84 <= wire65;
            end
        end
      else
        begin
          reg71 <= reg58[(3'h4):(3'h4)];
        end
      reg86 <= wire67[(4'h9):(4'h9)];
      reg87 <= $signed(($unsigned((reg79[(1'h1):(1'h0)] ? wire34 : reg55)) ?
          ((8'ha0) != $signed(((7'h41) && wire33))) : reg80[(3'h5):(1'h0)]));
    end
  assign wire88 = (~^(^reg74[(3'h7):(1'h0)]));
  assign wire89 = wire35;
  assign wire90 = $signed(((reg44 < (-$unsigned(wire34))) ?
                      (reg56[(1'h0):(1'h0)] <= reg57[(4'ha):(4'h9)]) : (($signed((8'hae)) ?
                          (~&wire64) : (reg82 ?
                              reg76 : wire38)) != (!$signed(wire67)))));
  always
    @(posedge clk) begin
      reg91 <= reg72;
    end
  always
    @(posedge clk) begin
      reg92 <= $unsigned(({reg56[(2'h3):(1'h1)],
              (reg41[(3'h6):(2'h2)] ? (reg44 == wire65) : (~&(8'hac)))} ?
          wire34[(4'hc):(2'h3)] : reg48));
      reg93 <= (!((|$unsigned(wire34[(3'h7):(2'h2)])) ?
          $unsigned(reg73) : (~$unsigned((reg91 < reg83)))));
    end
  assign wire94 = ((&(($unsigned(wire31) << (reg41 - reg52)) ?
                          {$unsigned(reg71),
                              $signed(reg53)} : (&$unsigned(reg54)))) ?
                      reg91[(2'h3):(2'h3)] : (~&(wire34[(3'h5):(3'h4)] ?
                          (reg53 > (wire38 <<< (8'hb6))) : $signed((wire65 ?
                              reg41 : reg87)))));
endmodule
