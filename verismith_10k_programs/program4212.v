module top #(parameter param147 = (8'hb5)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  wire signed [(3'h5):(1'h0)] wire146;
  wire [(4'h9):(1'h0)] wire145;
  wire signed [(2'h3):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire143;
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire15,
                 wire16,
                 wire17,
                 wire143,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire4 = $signed($signed(wire3));
  assign wire5 = ({((^$unsigned(wire1)) < $signed((~|wire3))),
                     $signed(wire3[(4'h8):(4'h8)])} * (8'ha3));
  assign wire6 = wire4;
  assign wire7 = wire2[(5'h14):(4'hb)];
  always
    @(posedge clk) begin
      if ((!$unsigned(((wire7 || (wire7 ? wire3 : wire6)) | {(wire2 ?
              (8'hb9) : (8'ha1))}))))
        begin
          reg8 <= wire3[(4'h8):(3'h4)];
          reg9 <= (!wire6);
          if (wire2)
            begin
              reg10 <= $unsigned((|$signed($unsigned(wire5))));
              reg11 <= wire6[(3'h6):(3'h4)];
              reg12 <= reg10[(4'hb):(4'h8)];
              reg13 <= reg8[(3'h6):(2'h2)];
              reg14 <= ((((wire1[(3'h5):(1'h1)] ? wire4 : (!wire5)) ?
                      (~&$signed(wire6)) : ((~^wire5) >> {wire6})) ^~ (((wire0 ?
                          reg11 : reg9) ?
                      (wire2 ?
                          wire2 : wire2) : $signed(wire0)) + (((8'ha9) && (8'hb6)) ?
                      {reg9} : (~reg10)))) ?
                  (~&((reg8 ? (^reg13) : {(8'h9d)}) >> ($signed(reg10) ?
                      $unsigned(wire4) : (wire1 ?
                          reg10 : reg8)))) : (wire2 > (^~(8'hbc))));
            end
          else
            begin
              reg10 <= (~(|{$unsigned((|(7'h41)))}));
              reg11 <= (^(^~$signed(reg12[(3'h6):(2'h2)])));
              reg12 <= wire7[(4'h9):(4'h8)];
            end
        end
      else
        begin
          reg8 <= wire1;
        end
    end
  assign wire15 = reg14[(4'h8):(2'h3)];
  assign wire16 = $unsigned((&{(~|(|reg9))}));
  assign wire17 = $unsigned(($signed(((wire4 >= wire16) ?
                      (!reg10) : $signed(wire0))) ~^ (8'hb2)));
  module18 #() modinst144 (.wire22(reg8), .clk(clk), .y(wire143), .wire19(wire1), .wire21(reg12), .wire20(reg10));
  assign wire145 = ((reg12 ?
                       (~&$signed($unsigned((8'haf)))) : (($unsigned(wire143) || {reg9}) ^ (~^$signed(wire15)))) >>> $unsigned(wire7));
  assign wire146 = {(((&(reg12 ?
                           reg12 : wire6)) || reg14) << $unsigned(wire17[(4'h9):(4'h8)])),
                       wire16};
endmodule

module module18  (y, clk, wire19, wire20, wire21, wire22);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire141;
  wire signed [(5'h14):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire98;
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire139,
                 wire114,
                 wire70,
                 wire72,
                 wire74,
                 wire75,
                 wire76,
                 wire98,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
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
                 reg73,
                 (1'h0)};
  module23 #() modinst71 (wire70, clk, wire21, wire20, wire22, wire19, (8'ha0));
  assign wire72 = (^$signed({wire19[(4'hd):(4'h9)]}));
  always
    @(posedge clk) begin
      reg73 <= wire72;
    end
  assign wire74 = $signed(((!{(wire20 ? (8'h9d) : wire21),
                          (wire19 ? wire21 : (8'hb4))}) ?
                      $unsigned($unsigned((wire19 != wire72))) : ((&$unsigned(reg73)) ?
                          (wire72[(3'h6):(2'h3)] ?
                              wire70[(3'h7):(3'h4)] : {wire20}) : ((~&wire70) ?
                              $signed((8'h9c)) : wire20[(4'h8):(3'h7)]))));
  assign wire75 = ($unsigned($unsigned((|(-wire21)))) ?
                      wire70[(4'hc):(3'h7)] : (wire72[(5'h11):(4'hc)] ?
                          wire72 : $unsigned(((-wire20) ?
                              $signed(wire22) : $signed((8'hb2))))));
  assign wire76 = wire70[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg77 <= (~&wire22);
      reg78 <= wire72;
      if (({{(reg78 >= (!reg78)), wire72[(4'ha):(3'h4)]},
          $signed(($unsigned((8'hae)) ?
              ((8'hb9) - wire76) : (wire22 ? reg77 : wire20)))} >>> (reg77 ?
          (8'hab) : ((&wire20) | $unsigned($signed(reg73))))))
        begin
          reg79 <= (wire74[(2'h3):(1'h1)] * (~|{(|(~&reg73)),
              $unsigned($unsigned(wire70))}));
          reg80 <= wire76;
          reg81 <= ((((^(reg78 - reg73)) ? $signed((!reg77)) : wire72) ?
              (+$unsigned((reg77 ^~ reg73))) : (^$signed((wire72 ?
                  (8'hbf) : wire70)))) == wire70);
          reg82 <= ($unsigned(((|wire74[(3'h5):(3'h4)]) || ((-wire22) ^ {wire20,
                  wire76}))) ?
              (&$signed($signed((~|wire75)))) : wire76);
        end
      else
        begin
          if (reg73[(4'hb):(1'h0)])
            begin
              reg79 <= $unsigned($unsigned($signed(($unsigned(wire76) != (-wire70)))));
              reg80 <= reg82[(3'h5):(3'h5)];
              reg81 <= wire70[(4'he):(4'h9)];
            end
          else
            begin
              reg79 <= $signed((~^wire74));
              reg80 <= ($signed((~^$signed($signed(reg82)))) ?
                  (8'hb4) : {$unsigned(reg79[(4'hd):(3'h5)])});
              reg81 <= $signed(reg82);
              reg82 <= ((~^(~|{(wire22 ? wire75 : (8'hab))})) ?
                  reg82[(4'hb):(3'h6)] : (-reg77));
              reg83 <= reg80;
            end
          reg84 <= $unsigned($unsigned($unsigned(wire19)));
          reg85 <= $unsigned($unsigned($signed((~^$signed(wire70)))));
          reg86 <= reg80[(3'h5):(2'h2)];
        end
    end
  module87 #() modinst99 (wire98, clk, reg77, reg83, wire74, wire76, wire72);
  always
    @(posedge clk) begin
      if ((^~{(-reg78[(4'hc):(3'h6)])}))
        begin
          reg100 <= $unsigned(({$unsigned($signed(reg81)),
              reg81} != $unsigned(reg83[(4'he):(4'h9)])));
          if (($unsigned((^{$unsigned(wire22),
              reg77[(2'h3):(1'h0)]})) || (($signed(reg84[(2'h2):(1'h0)]) * (+(|reg85))) ?
              ($unsigned(reg100[(2'h2):(2'h2)]) << ((wire70 & wire72) + reg84)) : wire70[(4'h9):(1'h0)])))
            begin
              reg101 <= wire22[(1'h1):(1'h0)];
              reg102 <= {(8'hb0),
                  {$unsigned(({reg80} >>> $unsigned(wire70))),
                      (~(&reg79[(4'h9):(2'h3)]))}};
              reg103 <= wire72[(4'hc):(2'h3)];
              reg104 <= $signed(((((reg78 || reg82) + wire20[(2'h3):(2'h3)]) ~^ reg81) ?
                  ({(wire22 ? reg86 : (8'hae)), reg79[(4'h9):(4'h8)]} ?
                      ({reg85} << (reg78 <<< reg102)) : {reg82,
                          $unsigned(reg84)}) : (~{$unsigned(wire72), reg82})));
            end
          else
            begin
              reg101 <= ((^reg102) ^ ((!{{wire76}}) ?
                  wire19 : ($signed((~^wire70)) && reg86[(5'h10):(2'h3)])));
            end
          if ($unsigned($signed($signed(wire76))))
            begin
              reg105 <= (-$unsigned({reg81}));
            end
          else
            begin
              reg105 <= (~|reg80);
              reg106 <= (-(($unsigned(reg102[(4'hb):(1'h0)]) | (!reg80)) > (~&$unsigned((8'ha8)))));
              reg107 <= {$signed($signed((8'hb1)))};
            end
        end
      else
        begin
          reg100 <= $unsigned(reg107);
          reg101 <= (~&(7'h44));
          reg102 <= (&(reg73 ? reg103 : $unsigned(wire76)));
          reg103 <= reg101[(1'h0):(1'h0)];
          if ($signed(((reg79[(4'hd):(4'hd)] ?
                  reg85[(2'h2):(2'h2)] : ((reg102 ?
                      reg100 : reg85) & {reg81})) ?
              wire75[(4'ha):(3'h7)] : $unsigned(((reg73 ?
                  wire21 : reg81) ^~ wire98)))))
            begin
              reg104 <= ((wire98 * reg104[(4'ha):(1'h0)]) ?
                  $unsigned(reg85) : reg73);
            end
          else
            begin
              reg104 <= ({($unsigned((~|wire22)) >> reg83)} || (|wire74));
              reg105 <= ($unsigned((&$signed($unsigned(wire20)))) ?
                  ($unsigned(reg85[(1'h1):(1'h1)]) | (8'hbf)) : ($signed((-$signed(wire72))) ?
                      ((-$unsigned(reg84)) ?
                          $signed(wire74) : {reg106}) : (^((reg100 ^ reg73) ?
                          reg83 : {(8'ha1), (8'hbf)}))));
              reg106 <= ({{reg81, reg86},
                  wire76[(4'hf):(3'h6)]} > {$signed($signed({reg101,
                      reg106}))});
            end
        end
      reg108 <= (($unsigned(reg105) >> $unsigned($signed((&reg105)))) + ((^$signed(reg100[(4'h8):(2'h3)])) != (wire20[(2'h2):(2'h2)] ?
          reg79 : ($signed((8'hb4)) ? (7'h44) : $signed(reg102)))));
      if ($signed($signed((8'hbc))))
        begin
          reg109 <= (reg107 * (((8'hae) ^~ reg84) ?
              ({(reg80 > wire21), wire72[(1'h1):(1'h1)]} ?
                  (reg78[(4'hf):(4'ha)] >>> $unsigned(reg100)) : (&$signed(reg108))) : ((~reg103) ?
                  (8'hbd) : $signed(reg86))));
          reg110 <= ((({(reg109 ? (8'hb4) : (8'ha9))} << (reg109 ?
                  wire98[(4'h8):(3'h5)] : $signed(reg101))) ?
              reg106[(4'ha):(3'h6)] : reg78) & wire98);
        end
      else
        begin
          reg109 <= $signed((~^reg107[(4'he):(4'ha)]));
          reg110 <= reg107[(1'h1):(1'h1)];
          reg111 <= reg82[(2'h3):(2'h2)];
        end
      reg112 <= $unsigned($unsigned($unsigned(wire70)));
      reg113 <= (reg107 ?
          (reg86 ~^ wire22[(2'h3):(2'h2)]) : reg111[(3'h5):(2'h3)]);
    end
  assign wire114 = $signed(wire75);
  module115 #() modinst140 (.clk(clk), .wire119(reg84), .y(wire139), .wire118(reg104), .wire116(reg100), .wire117(reg110));
  assign wire141 = {{$signed(reg109[(1'h1):(1'h1)]), wire74},
                       {$signed({(^~reg100)})}};
  assign wire142 = (~&((|reg77[(4'h8):(1'h0)]) - reg107[(2'h2):(1'h1)]));
endmodule

module module115
#(parameter param138 = (((!(((8'hbc) && (7'h41)) ? ((8'ha3) & (8'h9e)) : ((8'ha1) ? (8'hb8) : (7'h44)))) ? (~&(~(~&(8'h9f)))) : {(((8'hb6) ? (8'ha0) : (8'hb6)) ? {(8'h9e), (8'had)} : ((8'haa) << (8'hb8)))}) <= (~^(((~|(8'hb4)) <= ((8'had) + (7'h43))) >>> {((8'h9d) | (7'h43)), (-(8'hb0))}))))
(y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire119;
  input wire [(3'h4):(1'h0)] wire118;
  input wire signed [(4'h9):(1'h0)] wire117;
  input wire [(5'h11):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire136;
  wire [(3'h6):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  wire [(4'h8):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire127;
  wire signed [(3'h4):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire125;
  wire [(3'h5):(1'h0)] wire124;
  wire signed [(4'hd):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 reg130,
                 (1'h0)};
  assign wire120 = $signed(((((^~(8'hb3)) ?
                           (~(8'h9d)) : (~^wire118)) <<< wire117[(1'h0):(1'h0)]) ?
                       {wire119[(2'h2):(1'h0)]} : ((^~(wire116 < wire119)) >= (8'hbc))));
  assign wire121 = (^~($signed(wire116) | $unsigned(wire119[(2'h2):(1'h1)])));
  assign wire122 = (wire118 == (wire119 == wire116[(4'hc):(3'h5)]));
  assign wire123 = ({$unsigned($signed((wire118 ?
                           (8'ha9) : wire119)))} | $unsigned($signed(($signed(wire117) ?
                       wire119[(2'h2):(1'h0)] : $signed(wire117)))));
  assign wire124 = (wire120 ?
                       $signed({(~^$unsigned(wire121)),
                           (~&((8'hba) << (8'ha1)))}) : $unsigned(wire123));
  assign wire125 = $signed(wire119[(1'h1):(1'h0)]);
  assign wire126 = ($unsigned((|(8'h9d))) - $signed($signed({wire125,
                       $signed((8'hb5))})));
  assign wire127 = (+{(((wire118 && wire125) & $signed((8'hba))) & (((8'ha8) != wire121) + $unsigned(wire122)))});
  assign wire128 = $unsigned((!{wire124,
                       (((8'hbe) * wire118) >> (wire116 ?
                           wire127 : wire120))}));
  assign wire129 = $signed($unsigned((((wire125 ?
                           wire121 : wire116) << wire122) ?
                       (wire121[(4'hd):(3'h6)] & wire118[(2'h3):(1'h0)]) : $unsigned((~wire126)))));
  always
    @(posedge clk) begin
      reg130 <= ($signed($unsigned(($unsigned(wire120) ?
              $signed(wire128) : (wire116 ? wire129 : wire121)))) ?
          (~^wire127[(3'h4):(3'h4)]) : $signed((($signed(wire125) - wire121[(4'h8):(4'h8)]) >= wire117[(2'h2):(2'h2)])));
    end
  assign wire131 = (wire129 ?
                       ((~wire117[(1'h1):(1'h0)]) >= $signed((+$unsigned(wire116)))) : wire125[(4'hc):(4'hb)]);
  assign wire132 = (wire121[(3'h5):(1'h1)] ?
                       $signed((($unsigned(wire122) ?
                           wire129 : $signed(wire121)) < ($unsigned(wire127) ?
                           (wire124 + reg130) : (^wire121)))) : ($signed(((wire126 < wire118) <<< (wire120 ^~ wire118))) - (~|(|(+wire117)))));
  assign wire133 = wire128;
  assign wire134 = ((-(($unsigned(wire129) | wire120) ?
                       (|wire123) : {(wire117 & (8'hbf)),
                           (wire131 ? wire116 : wire117)})) >>> wire120);
  assign wire135 = wire124[(1'h1):(1'h0)];
  assign wire136 = wire116[(4'h9):(4'h8)];
  assign wire137 = (-$signed($signed({(~|wire122)})));
endmodule

module module87  (y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire92;
  input wire [(4'hf):(1'h0)] wire91;
  input wire signed [(4'h8):(1'h0)] wire90;
  input wire [(2'h3):(1'h0)] wire89;
  input wire signed [(5'h11):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire93;
  assign y = {wire97, wire96, wire95, wire94, wire93, (1'h0)};
  assign wire93 = (({$unsigned((^wire90)), (^~$signed((8'hb1)))} ?
                      $signed((+(wire90 < wire89))) : (((&wire91) ?
                          (wire91 ^ (8'hb7)) : wire92[(3'h6):(3'h4)]) || $signed((~^wire92)))) != (^~$unsigned({$signed(wire89),
                      {wire92}})));
  assign wire94 = {(+wire90)};
  assign wire95 = $unsigned(wire88);
  assign wire96 = {(~&wire91[(4'h8):(3'h5)]),
                      (({$signed(wire90), (8'haf)} ?
                          $unsigned((wire88 ?
                              wire89 : wire95)) : ($signed(wire89) ?
                              wire94[(4'he):(3'h6)] : {wire91})) | $unsigned(((!wire93) ?
                          wire88[(2'h3):(1'h0)] : (8'ha3))))};
  assign wire97 = (($unsigned($signed((wire94 > wire92))) < (8'ha7)) >>> $unsigned($unsigned(wire93[(5'h12):(3'h7)])));
endmodule

module module23
#(parameter param68 = (({(8'ha0)} ? {{((7'h41) <<< (8'ha7))}, (((8'hb9) ? (8'h9d) : (8'haf)) >>> ((8'hb9) <<< (8'haa)))} : (^~(~&{(8'hab), (7'h40)}))) <= ((8'hb6) ? ((8'had) ? (~^(&(8'ha5))) : ((|(8'hae)) >> ((8'hb8) | (8'hb4)))) : ((~{(8'ha3)}) ? {((8'haa) ? (8'hac) : (8'ha5)), ((8'hac) ? (8'h9f) : (8'hbe))} : (~^((8'hba) ? (8'hbb) : (8'haa)))))), 
parameter param69 = {(param68 ? ((-(|param68)) * param68) : (8'ha2)), ((param68 ? (~param68) : ((param68 > param68) ? param68 : (param68 != param68))) <= ({param68} <<< {((8'hb6) & param68), (param68 ? param68 : param68)}))})
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire28;
  input wire [(2'h3):(1'h0)] wire27;
  input wire [(5'h14):(1'h0)] wire26;
  input wire [(4'he):(1'h0)] wire25;
  input wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  assign y = {wire67,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire41,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg66,
                 reg65,
                 reg64,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire29 = (~^(-wire28[(3'h5):(3'h5)]));
  assign wire30 = (wire24[(1'h0):(1'h0)] >> (8'hab));
  assign wire31 = ({$unsigned(((wire24 ? (8'h9e) : wire28) ?
                              $unsigned(wire30) : (wire28 ?
                                  (7'h42) : wire26)))} ?
                      ((wire27[(2'h3):(1'h1)] ?
                          wire24 : (wire28 ^ $unsigned(wire29))) <= ($unsigned($signed(wire24)) >>> ({wire30,
                          wire28} <= {wire28,
                          wire25}))) : (~^(!(|$unsigned(wire26)))));
  assign wire32 = ({{$unsigned((wire27 ? wire25 : wire26)),
                          $unsigned(((8'hbe) + wire30))}} | $signed({$unsigned($unsigned(wire25)),
                      (wire29 ^~ (wire27 ? wire29 : wire26))}));
  assign wire33 = (+$unsigned(wire24[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg34 <= (^~wire27[(2'h2):(2'h2)]);
      reg35 <= reg34[(1'h1):(1'h1)];
    end
  assign wire36 = wire30;
  always
    @(posedge clk) begin
      reg37 <= {wire28};
      reg38 <= wire33[(4'h8):(3'h4)];
      reg39 <= reg37[(3'h4):(2'h3)];
      reg40 <= ((wire26 < ((~&$unsigned(wire36)) ?
              (^~(reg34 ? wire33 : reg34)) : (~^(wire30 <= wire31)))) ?
          wire32 : (!(reg37[(2'h3):(1'h1)] == $signed($signed(reg37)))));
    end
  assign wire41 = (~&($unsigned({wire29[(4'h8):(2'h2)],
                      wire33[(3'h4):(2'h3)]}) ^~ $signed(((wire33 ?
                          wire26 : wire28) ?
                      wire28[(4'ha):(3'h4)] : ((8'ha7) > (7'h41))))));
  always
    @(posedge clk) begin
      if ((-reg37))
        begin
          reg42 <= wire33;
          reg43 <= {$signed(((reg34 > (~^reg34)) && (8'hbd))), {(+wire41)}};
          if ($signed((&((~^(^reg37)) * (wire26 + $signed(reg43))))))
            begin
              reg44 <= $unsigned((($unsigned(wire31[(5'h10):(4'h9)]) != $signed($signed(wire30))) ?
                  ($signed($unsigned(reg40)) > (~&(-(8'ha4)))) : $signed({(~&reg35)})));
            end
          else
            begin
              reg44 <= {{($unsigned($unsigned(wire31)) ?
                          (wire24[(2'h2):(1'h0)] >>> (wire41 < (8'hb7))) : $unsigned(reg40))}};
              reg45 <= (8'hbf);
              reg46 <= wire27[(1'h1):(1'h1)];
              reg47 <= (7'h44);
            end
        end
      else
        begin
          if ($unsigned((|reg38[(4'hc):(2'h2)])))
            begin
              reg42 <= (~&$signed(($unsigned((reg35 ~^ (8'hb4))) && {wire28[(2'h3):(2'h3)]})));
              reg43 <= $unsigned(({(~&$signed(wire27)), wire31} >= ({wire24} ?
                  (~&(wire28 ? (8'hbe) : reg38)) : (!(~wire31)))));
              reg44 <= reg37[(2'h2):(1'h1)];
              reg45 <= ((!($unsigned((wire41 ?
                      reg44 : wire31)) << (reg47 + reg39))) ?
                  $unsigned(($signed($unsigned(wire36)) && $unsigned($signed(wire28)))) : $signed((($unsigned(wire28) == wire29) <= {$unsigned((8'hbe)),
                      reg38[(3'h7):(3'h6)]})));
              reg46 <= reg44[(4'h9):(2'h2)];
            end
          else
            begin
              reg42 <= $unsigned($signed((~&wire28[(3'h7):(1'h1)])));
              reg43 <= (wire31[(5'h10):(3'h6)] ?
                  ((($signed(reg40) | {reg44,
                      reg43}) <= $unsigned((~|reg35))) > $signed($unsigned(reg34[(1'h0):(1'h0)]))) : $unsigned($unsigned(wire41)));
            end
          reg47 <= (~(((+(wire33 << reg47)) << $signed(wire25[(3'h4):(1'h1)])) == wire25[(4'hc):(4'h8)]));
          reg48 <= wire25[(4'hd):(3'h7)];
          if (((+(reg35[(3'h6):(1'h0)] >>> reg43)) >>> reg35))
            begin
              reg49 <= (~&wire36);
            end
          else
            begin
              reg49 <= $signed(reg49[(4'h8):(2'h2)]);
              reg50 <= wire32[(3'h4):(1'h0)];
              reg51 <= reg46;
            end
        end
      reg52 <= (+((!$signed({wire41})) ~^ (|$signed($unsigned(wire25)))));
      reg53 <= reg48;
    end
  assign wire54 = $signed((|{(((8'ha3) | reg44) - (+reg45))}));
  assign wire55 = wire26;
  assign wire56 = $unsigned($signed((~($signed(wire33) ?
                      (reg43 ? reg45 : wire30) : (~|reg43)))));
  assign wire57 = $signed({(reg44[(1'h0):(1'h0)] < (^~wire55)),
                      $signed((7'h42))});
  assign wire58 = (reg39 ?
                      {(~&reg34),
                          (((8'haa) == reg38[(2'h2):(1'h1)]) <<< (^~wire24[(3'h4):(1'h0)]))} : (+(8'ha7)));
  assign wire59 = {$unsigned(reg42), wire25[(2'h3):(2'h2)]};
  assign wire60 = $signed($unsigned(wire31));
  assign wire61 = $unsigned($unsigned((~&reg53[(1'h0):(1'h0)])));
  assign wire62 = $signed($unsigned((~^($signed(wire55) ?
                      (reg50 ? wire56 : (8'hb1)) : (^~(8'hab))))));
  assign wire63 = wire61[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg64 <= $unsigned(($unsigned($unsigned(wire59)) ?
          $unsigned(wire28) : reg40));
      reg65 <= {$unsigned({$signed(reg48)}),
          (wire60[(1'h0):(1'h0)] ?
              (-reg64[(5'h14):(4'hf)]) : $signed(({wire61} >>> (reg45 ?
                  (8'hbd) : wire32))))};
      reg66 <= $unsigned($signed(($signed($unsigned(wire26)) | $unsigned(reg42[(1'h1):(1'h0)]))));
    end
  assign wire67 = (($unsigned((!reg51)) ?
                      (^~$unsigned(wire58[(2'h3):(1'h0)])) : (~|(~&reg50))) <<< ($unsigned(((reg50 < (8'ha0)) ?
                      $unsigned(wire26) : $unsigned(wire26))) && {wire56}));
endmodule
