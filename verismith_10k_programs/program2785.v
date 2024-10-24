module top
#(parameter param209 = {(-(((8'h9e) ? {(8'hb2), (8'hab)} : {(8'hb6)}) & (8'hbe)))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire204;
  wire signed [(5'h15):(1'h0)] wire203;
  wire signed [(4'hc):(1'h0)] wire202;
  wire [(4'h9):(1'h0)] wire201;
  wire [(3'h6):(1'h0)] wire200;
  wire [(4'ha):(1'h0)] wire199;
  wire [(5'h10):(1'h0)] wire198;
  wire [(2'h2):(1'h0)] wire197;
  wire signed [(3'h6):(1'h0)] wire192;
  wire [(4'hc):(1'h0)] wire133;
  wire [(4'hd):(1'h0)] wire132;
  wire signed [(4'ha):(1'h0)] wire131;
  wire signed [(4'hd):(1'h0)] wire130;
  wire [(5'h12):(1'h0)] wire129;
  wire [(5'h11):(1'h0)] wire127;
  wire [(4'hb):(1'h0)] wire194;
  wire signed [(5'h14):(1'h0)] wire195;
  wire signed [(4'h9):(1'h0)] wire206;
  wire [(4'hc):(1'h0)] wire207;
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire192,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire194,
                 wire195,
                 wire206,
                 wire207,
                 reg5,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2[(4'he):(3'h6)];
      if ($unsigned(wire4))
        begin
          reg6 <= (wire0[(3'h4):(3'h4)] ?
              ($unsigned(wire4) ^ wire1) : $signed($unsigned($signed(wire1[(2'h2):(2'h2)]))));
          reg7 <= (!$signed(((wire0 ?
              $unsigned((8'h9f)) : (wire1 >>> wire3)) == (-$unsigned(wire0)))));
          reg8 <= $signed($unsigned(wire2));
          reg9 <= wire3[(4'hd):(4'h9)];
        end
      else
        begin
          reg6 <= {$unsigned(({$signed(wire2)} ?
                  {(reg6 << (7'h44))} : $unsigned(wire2))),
              $unsigned($signed($unsigned($signed((8'hb8)))))};
          reg7 <= (8'ha8);
          reg8 <= $unsigned($unsigned(reg5[(3'h4):(1'h0)]));
        end
      if ((8'hbb))
        begin
          reg10 <= (wire1[(1'h0):(1'h0)] ?
              ($unsigned(wire0[(1'h1):(1'h0)]) ?
                  (reg9 ?
                      ((reg8 | wire3) ?
                          (reg8 ? reg7 : reg9) : (+wire3)) : (!(reg6 ?
                          reg7 : reg7))) : ($unsigned(reg9[(4'h8):(3'h6)]) ^ reg7)) : $signed({$signed((7'h44))}));
          reg11 <= ((($signed($unsigned(reg9)) && $signed({wire0, reg5})) ?
              $signed(((^~reg7) ? $signed(reg9) : {reg7})) : (reg8 ~^ (reg5 ?
                  $unsigned(wire2) : reg5))) * reg7[(2'h3):(2'h3)]);
          reg12 <= {wire3, (wire0 << reg9[(4'h8):(1'h0)])};
          reg13 <= (((((reg12 > reg8) ? $unsigned(reg7) : (7'h41)) ?
              {wire2,
                  (~reg10)} : (!reg6[(3'h5):(3'h5)])) > reg7[(2'h2):(1'h1)]) ^ (($signed($unsigned(wire1)) >> $unsigned((wire2 ^ wire4))) > $signed({$unsigned((8'h9d))})));
          reg14 <= {reg9};
        end
      else
        begin
          if (((reg6 ?
                  (&{reg6[(3'h7):(1'h0)], {wire4}}) : ({wire1[(2'h2):(1'h0)]} ?
                      $unsigned($unsigned(wire0)) : $signed(reg7[(2'h2):(2'h2)]))) ?
              ((!(reg5[(3'h7):(3'h7)] ? (reg8 * reg11) : $signed(reg7))) ?
                  ((+{reg6}) ?
                      (reg12 << (~reg10)) : $unsigned((~|reg13))) : {((wire1 >> reg5) == reg11[(1'h0):(1'h0)]),
                      reg13[(4'hb):(1'h0)]}) : reg8[(1'h1):(1'h1)]))
            begin
              reg10 <= reg5;
              reg11 <= ($unsigned(((!(|reg14)) > ((wire3 <= reg6) ^ (reg14 ?
                      wire0 : reg13)))) ?
                  reg9 : reg6);
            end
          else
            begin
              reg10 <= $unsigned($signed($signed($unsigned((|wire1)))));
            end
          reg12 <= (reg11 ? $unsigned(wire3[(2'h3):(2'h2)]) : reg7);
          reg13 <= $signed($unsigned((((~^reg7) ?
              (wire3 >> reg8) : (&wire1)) || $unsigned((reg7 * (8'ha6))))));
          reg14 <= ((+((8'hb8) ?
              $unsigned((reg7 ? reg5 : wire4)) : (reg9 ?
                  $unsigned(reg6) : reg12))) <<< (reg8 ^~ {reg6[(1'h0):(1'h0)]}));
          reg15 <= (~&wire4);
        end
      reg16 <= reg8;
    end
  module17 #() modinst128 (wire127, clk, wire3, reg16, reg14, reg8);
  assign wire129 = wire1[(1'h1):(1'h0)];
  assign wire130 = ($unsigned({$unsigned(reg6)}) < reg8[(3'h4):(1'h0)]);
  assign wire131 = {$unsigned($unsigned((reg8[(1'h0):(1'h0)] | reg6[(2'h2):(1'h0)]))),
                       reg14[(3'h5):(2'h2)]};
  assign wire132 = (-((8'hb5) ~^ (^~(reg5[(2'h2):(2'h2)] & (|reg14)))));
  assign wire133 = wire132;
  module134 #() modinst193 (wire192, clk, wire133, reg8, wire131, wire0);
  assign wire194 = $unsigned($signed($unsigned((~{wire133, reg13}))));
  module67 #() modinst196 (.wire71(reg12), .wire69(reg16), .wire70(wire2), .wire68(reg10), .clk(clk), .y(wire195));
  assign wire197 = $unsigned({$signed({$signed(wire133),
                           (wire2 ? reg12 : reg9)})});
  assign wire198 = (!wire0);
  assign wire199 = ($unsigned($unsigned((!$unsigned(reg16)))) ?
                       $signed(((reg6 & wire192[(2'h2):(2'h2)]) ?
                           {wire198} : ($unsigned(reg13) ?
                               (wire192 < (8'hb8)) : (^~reg5)))) : $unsigned(($unsigned((8'ha5)) ?
                           reg13[(3'h5):(2'h2)] : $signed((reg8 ?
                               wire132 : (8'haa))))));
  assign wire200 = ($unsigned((|$unsigned((reg13 ?
                       wire132 : reg10)))) >= $signed($unsigned(((~|reg10) ?
                       ((8'ha2) ? reg10 : reg12) : wire127))));
  assign wire201 = $unsigned($unsigned(reg13));
  assign wire202 = (^~$signed(({wire133, {wire194, wire198}} < reg10)));
  assign wire203 = $unsigned(wire3[(3'h6):(3'h5)]);
  module134 #() modinst205 (wire204, clk, wire129, reg14, wire131, wire127);
  assign wire206 = $unsigned($signed((!($unsigned(wire4) ?
                       (reg15 ? (7'h40) : wire1) : {wire2}))));
  module17 #() modinst208 (wire207, clk, reg8, wire3, wire201, wire132);
endmodule

module module134
#(parameter param190 = {({(((8'hba) * (8'hbb)) + {(8'hbe)}), (&((8'ha4) + (8'haa)))} ? {({(8'ha3), (8'h9f)} < (~&(8'hb9))), ((8'hbf) ? ((8'hb0) * (8'hbc)) : ((8'hb0) >> (8'hab)))} : (~&{((7'h44) <= (8'haf))})), (8'hab)}, 
parameter param191 = (~&param190))
(y, clk, wire135, wire136, wire137, wire138);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire135;
  input wire signed [(5'h12):(1'h0)] wire136;
  input wire [(3'h4):(1'h0)] wire137;
  input wire [(5'h11):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire189;
  wire signed [(4'he):(1'h0)] wire139;
  wire signed [(4'hc):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire141;
  wire [(5'h12):(1'h0)] wire147;
  wire signed [(5'h14):(1'h0)] wire148;
  wire [(4'h9):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire162;
  wire [(4'h8):(1'h0)] wire187;
  reg signed [(4'ha):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg155 = (1'h0);
  reg [(3'h7):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  assign y = {wire189,
                 wire139,
                 wire140,
                 wire141,
                 wire147,
                 wire148,
                 wire161,
                 wire162,
                 wire187,
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
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  assign wire139 = wire135;
  assign wire140 = (&{$unsigned(wire138[(4'hd):(1'h1)])});
  assign wire141 = (($signed($signed($signed((7'h43)))) >> ((wire140[(4'h9):(1'h0)] ?
                           wire137[(3'h4):(1'h1)] : $signed(wire135)) ?
                       (8'hb8) : ({(8'hbc)} ?
                           ((8'hbf) == wire138) : (~&wire139)))) << wire140[(4'ha):(3'h7)]);
  always
    @(posedge clk) begin
      reg142 <= $signed((wire141 ?
          ($signed(wire139[(3'h6):(3'h5)]) < (^$unsigned((8'haa)))) : wire139));
      reg143 <= (!wire141);
      reg144 <= wire137[(2'h2):(2'h2)];
      reg145 <= (+$unsigned(wire140));
      reg146 <= ($signed((!wire135[(3'h7):(2'h2)])) ?
          (+$unsigned($signed((reg144 ?
              reg142 : wire139)))) : ($unsigned($unsigned($unsigned((8'h9c)))) <= reg144));
    end
  assign wire147 = ($signed(wire137[(2'h2):(1'h0)]) || ((wire139[(1'h1):(1'h0)] >>> ($signed(wire141) >= (wire137 ?
                           (8'hb4) : wire137))) ?
                       (|$signed(wire139[(2'h2):(1'h0)])) : $unsigned(($unsigned(wire141) & wire137))));
  assign wire148 = (&reg144[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      if ($signed((&$unsigned($unsigned({wire147})))))
        begin
          if ((&reg143[(4'h9):(3'h4)]))
            begin
              reg149 <= $unsigned($signed(wire147[(4'h9):(3'h5)]));
              reg150 <= $signed((&reg149[(3'h7):(3'h7)]));
              reg151 <= ($signed($signed((wire140[(3'h7):(3'h4)] << (reg150 ?
                  wire147 : reg149)))) | $unsigned(reg150[(1'h0):(1'h0)]));
              reg152 <= {{$signed({wire135[(2'h2):(1'h0)], $signed(wire140)}),
                      ((&wire137[(2'h3):(1'h1)]) != reg150[(1'h0):(1'h0)])}};
              reg153 <= (~^{{reg146, reg144[(4'hc):(4'hc)]}});
            end
          else
            begin
              reg149 <= $unsigned((^~$signed($unsigned((~^reg144)))));
              reg150 <= (~&$unsigned(wire147[(3'h4):(3'h4)]));
              reg151 <= {{reg146}};
            end
          reg154 <= {$unsigned(reg145[(2'h2):(1'h1)]), {reg151[(2'h3):(2'h2)]}};
          if ((8'ha3))
            begin
              reg155 <= (|($signed(((wire139 - wire141) << $signed((8'had)))) ~^ (7'h42)));
              reg156 <= $unsigned($unsigned((!$unsigned((^~wire147)))));
              reg157 <= ((~^($unsigned((-reg152)) ?
                      $signed((wire137 ?
                          (8'h9d) : reg153)) : reg150[(1'h1):(1'h0)])) ?
                  {($unsigned((~|reg153)) ?
                          reg154[(2'h3):(1'h1)] : $signed(((8'ha6) > wire141)))} : reg144);
              reg158 <= wire135[(3'h6):(2'h2)];
            end
          else
            begin
              reg155 <= $signed(reg146);
              reg156 <= (-($signed($unsigned(((8'ha6) > wire147))) ?
                  $signed((reg150[(2'h3):(2'h2)] < (~(8'ha6)))) : $unsigned($unsigned({reg151,
                      reg153}))));
            end
        end
      else
        begin
          reg149 <= (reg146[(2'h2):(1'h1)] ?
              ($signed(wire141) >= wire148) : $signed(({(reg157 | (8'hbd)),
                      {wire136, wire140}} ?
                  (~|reg151[(2'h3):(2'h3)]) : reg142[(3'h5):(2'h2)])));
          reg150 <= (wire141[(3'h5):(1'h1)] ?
              {{reg150, $unsigned({wire138})},
                  ((&wire147) < reg146)} : wire141);
          if ({(+$unsigned(($signed(reg158) ?
                  ((8'ha2) ? reg142 : (8'h9c)) : (~reg152)))),
              (|($signed((reg154 + (8'hb5))) - wire138[(4'hc):(3'h6)]))})
            begin
              reg151 <= reg142;
            end
          else
            begin
              reg151 <= $unsigned($signed($unsigned($unsigned((|wire138)))));
              reg152 <= $signed($signed({($unsigned((8'haa)) <= reg145)}));
              reg153 <= $unsigned((({$signed(reg158)} ^ $signed((~|reg152))) + wire136));
            end
        end
      reg159 <= ($unsigned((^((wire140 ? wire139 : reg142) ?
              reg154[(2'h2):(1'h1)] : reg154[(3'h6):(2'h3)]))) ?
          {wire136} : $unsigned(reg156[(1'h0):(1'h0)]));
      reg160 <= (-wire136[(4'hf):(2'h2)]);
    end
  assign wire161 = ($unsigned((8'ha4)) | $signed(reg160[(3'h5):(2'h3)]));
  assign wire162 = (((reg149 ^~ (8'hae)) > $signed(wire148[(4'he):(3'h4)])) & ($signed((wire137 ?
                       wire139 : (+wire148))) >>> reg160[(3'h6):(3'h5)]));
  module163 #() modinst188 (wire187, clk, wire141, reg160, reg146, wire147, wire162);
  assign wire189 = (8'had);
endmodule

module module17
#(parameter param125 = (-({(((8'hb3) ? (8'ha0) : (7'h44)) && ((8'h9f) <<< (8'had)))} | (!((|(8'hbe)) != ((7'h43) << (8'ha3)))))), 
parameter param126 = (param125 < (8'hae)))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(3'h4):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire55;
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  assign y = {wire123,
                 wire66,
                 wire65,
                 wire64,
                 wire57,
                 wire55,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  module22 #() modinst56 (wire55, clk, wire19, wire21, wire18, wire20);
  assign wire57 = {((8'ha0) <= ((wire18[(4'h8):(3'h4)] ^ $unsigned(wire19)) ?
                          (8'ha7) : wire20)),
                      $unsigned({$unsigned((~|(8'hbf)))})};
  always
    @(posedge clk) begin
      reg58 <= (^~$signed((^~wire21[(2'h3):(1'h1)])));
      reg59 <= ((8'ha2) << wire57);
      if ($unsigned($signed({($unsigned(wire57) ?
              $signed(wire21) : wire55[(3'h6):(2'h2)]),
          (~&(wire57 <= reg58))})))
        begin
          reg60 <= wire21[(4'hf):(2'h3)];
          reg61 <= $unsigned($unsigned(reg59[(4'h8):(3'h7)]));
        end
      else
        begin
          reg60 <= $signed({reg58[(1'h0):(1'h0)]});
          reg61 <= ({wire20[(4'hd):(2'h2)]} == wire18);
        end
      if (($unsigned((+(wire21 ? $signed(reg58) : (reg60 * reg58)))) ?
          ({{wire20[(4'hf):(4'hc)]}} - $signed(({reg59} ?
              (reg60 != reg58) : {(8'haa)}))) : $signed(reg61)))
        begin
          reg62 <= {$unsigned(((^~wire21) ?
                  ($signed((8'hbf)) ?
                      ((8'ha5) < wire21) : (wire21 ^~ reg61)) : reg60[(5'h10):(4'hb)]))};
        end
      else
        begin
          reg62 <= wire55[(3'h6):(1'h1)];
        end
      reg63 <= reg62;
    end
  assign wire64 = {(~|reg60)};
  assign wire65 = reg61[(2'h3):(2'h3)];
  assign wire66 = (8'ha0);
  module67 #() modinst124 (.y(wire123), .wire70(wire21), .clk(clk), .wire68(wire65), .wire71(wire55), .wire69(wire66));
endmodule

module module67  (y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h277):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire71;
  input wire [(4'hd):(1'h0)] wire70;
  input wire signed [(4'hc):(1'h0)] wire69;
  input wire [(5'h12):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire121;
  wire [(5'h12):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire87;
  wire [(4'hb):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
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
                 reg99,
                 reg98,
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
                 reg73,
                 reg72,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg72 <= wire70[(3'h5):(2'h3)];
      reg73 <= reg72;
    end
  assign wire74 = $unsigned(((&$unsigned($signed(reg73))) ?
                      $unsigned(($signed(wire71) ^ $unsigned(wire68))) : $signed(reg73[(1'h0):(1'h0)])));
  assign wire75 = (~|$signed($unsigned($unsigned($signed(wire70)))));
  assign wire76 = $signed(wire68[(1'h1):(1'h0)]);
  assign wire77 = ($signed({reg72}) ?
                      (|$signed(wire71[(1'h0):(1'h0)])) : $unsigned($unsigned((&$signed(reg72)))));
  assign wire78 = reg73[(2'h3):(1'h0)];
  assign wire79 = ($unsigned((&wire76)) ?
                      $unsigned(wire69[(3'h7):(3'h7)]) : ($signed(wire76[(3'h4):(1'h0)]) ^~ (wire75[(4'hf):(1'h0)] + (|wire77[(3'h6):(3'h6)]))));
  assign wire80 = (~&wire78);
  assign wire81 = $signed((wire79 ?
                      $unsigned($signed(wire78[(2'h2):(1'h1)])) : wire68));
  assign wire82 = (wire69[(4'ha):(2'h2)] - (wire79 ?
                      wire68 : {$unsigned({wire74})}));
  assign wire83 = $signed(wire68);
  assign wire84 = wire75;
  assign wire85 = wire79[(2'h3):(2'h3)];
  assign wire86 = {((~$unsigned(wire78[(2'h2):(2'h2)])) << wire80[(1'h0):(1'h0)]),
                      ({(wire84[(3'h4):(3'h4)] ^ ((8'hb2) & wire81)),
                          ({wire84, wire82} ?
                              (wire77 ? wire85 : wire75) : (wire68 ?
                                  reg72 : wire83))} ~^ (($unsigned(wire75) <<< (wire84 ?
                          wire71 : wire79)) != ((wire84 ^ wire69) ?
                          $signed(wire83) : (~&wire70))))};
  assign wire87 = wire83;
  always
    @(posedge clk) begin
      reg88 <= wire75;
      if (wire75[(5'h10):(4'hc)])
        begin
          if ((~^wire84))
            begin
              reg89 <= $signed(wire84);
              reg90 <= (($signed((8'hbe)) == ($unsigned((~&(8'had))) << $unsigned($signed((8'hb5))))) & $signed(((&$unsigned(reg88)) ?
                  (-wire71) : $unsigned(wire85[(5'h14):(5'h12)]))));
              reg91 <= ($unsigned(reg72[(1'h0):(1'h0)]) ?
                  (|reg89[(2'h2):(2'h2)]) : {$signed((|{wire69, wire70})),
                      wire80});
            end
          else
            begin
              reg89 <= (~|((!{((8'had) ? wire77 : reg91), {wire79, wire84}}) ?
                  $signed(reg89[(5'h11):(4'h8)]) : wire76));
              reg90 <= reg91;
              reg91 <= wire69[(3'h5):(1'h0)];
            end
          reg92 <= (&reg72[(4'hf):(4'h9)]);
        end
      else
        begin
          reg89 <= (~&(!({(wire84 >> wire82), reg89} ?
              wire74 : (((8'h9d) >>> reg88) ? wire70 : wire79))));
        end
      if ((wire77[(4'he):(3'h7)] ? reg90 : wire80))
        begin
          reg93 <= reg89;
          if ((((($signed((8'hba)) ? {reg91, (8'hb2)} : $signed(wire81)) ?
                      (|(^wire83)) : wire87) ?
                  wire85[(3'h4):(2'h3)] : $signed((^(^wire75)))) ?
              ((~|((8'hb6) || wire68[(4'hc):(4'ha)])) ^~ wire75) : (wire78[(4'h8):(1'h1)] ?
                  {$unsigned({wire68, wire81}),
                      (~^$unsigned(wire69))} : reg93)))
            begin
              reg94 <= wire87[(4'hc):(4'h8)];
              reg95 <= (!((^(^~$signed((8'hae)))) >>> ((^$unsigned(reg90)) < reg90[(4'he):(1'h1)])));
              reg96 <= reg93[(3'h7):(3'h5)];
              reg97 <= wire71[(4'h9):(4'h9)];
              reg98 <= $unsigned(($signed(($unsigned(reg92) ?
                      (wire82 + wire74) : {reg89})) ?
                  $signed((((8'hb9) ? wire80 : reg96) ?
                      reg93[(4'h8):(3'h7)] : reg88[(4'hb):(4'h9)])) : ((reg92 ?
                          $signed(wire81) : (reg93 ? wire76 : reg96)) ?
                      wire85 : $signed((-wire75)))));
            end
          else
            begin
              reg94 <= ({$unsigned(({wire84} >= reg93)), (wire70 || (8'ha0))} ?
                  $signed({$signed(wire85),
                      $signed($unsigned(wire79))}) : {($signed($signed(wire82)) | {$signed(reg91)}),
                      (~&(-{wire70, reg88}))});
              reg95 <= $unsigned($signed((reg88[(4'h8):(3'h7)] ?
                  $unsigned($unsigned((8'hbd))) : $signed((wire71 ?
                      reg73 : wire79)))));
            end
          if (($signed(({(reg98 ? reg95 : wire71), (8'ha6)} ?
              {{reg90}} : {wire87[(1'h1):(1'h0)]})) || ((wire70[(3'h5):(3'h4)] && reg92[(3'h4):(3'h4)]) || (reg73[(1'h0):(1'h0)] ^ $unsigned($unsigned(reg95))))))
            begin
              reg99 <= reg90;
              reg100 <= {((($signed((8'hb8)) * (reg89 ?
                      (8'ha0) : reg89)) & reg96[(5'h12):(1'h0)]) - (!(reg90[(4'h8):(1'h1)] ?
                      (8'hb5) : wire86)))};
              reg101 <= $unsigned(((!$unsigned($signed(wire76))) << (&wire76)));
              reg102 <= ((((|((8'ha2) ? (7'h41) : reg94)) ?
                      ((+reg89) ?
                          (^~wire79) : (~|wire75)) : ({(8'hb5)} >> (wire86 ?
                          reg88 : wire86))) + ($signed((wire81 ?
                      wire87 : reg91)) - (~wire76[(2'h3):(1'h0)]))) ?
                  ({$signed($unsigned((8'hb1)))} ?
                      {(reg96[(3'h6):(1'h1)] || (^~wire83))} : reg91[(4'he):(4'he)]) : (~{$signed(reg89)}));
              reg103 <= {$unsigned(((^wire81) & reg102))};
            end
          else
            begin
              reg99 <= ($unsigned($unsigned($signed((wire85 ?
                      reg72 : reg88)))) ?
                  (|reg91[(2'h3):(2'h3)]) : (&reg101));
              reg100 <= (+$signed((&($signed(wire74) != $unsigned((8'h9f))))));
            end
          reg104 <= reg96[(5'h10):(4'hf)];
          reg105 <= reg98[(4'hc):(4'h8)];
        end
      else
        begin
          reg93 <= {reg99[(3'h4):(3'h4)]};
        end
      if ((+wire70))
        begin
          reg106 <= $unsigned($signed(wire81[(3'h4):(1'h0)]));
          reg107 <= wire75[(4'hc):(4'hb)];
          reg108 <= (|reg92);
          if ($signed((reg108 >>> {wire85, reg107})))
            begin
              reg109 <= {(|wire82), reg103};
            end
          else
            begin
              reg109 <= (8'hb4);
              reg110 <= $signed({wire83});
              reg111 <= $unsigned((($signed(wire83[(2'h2):(1'h0)]) > reg88[(2'h3):(2'h3)]) ?
                  ($unsigned((reg99 ?
                      reg99 : wire74)) * reg104) : ($unsigned((reg106 == (7'h41))) > {(!(8'h9f))})));
              reg112 <= (7'h44);
              reg113 <= reg92;
            end
          reg114 <= $signed($unsigned($signed(((reg107 ? reg103 : reg108) ?
              (7'h40) : reg103[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg106 <= reg107;
        end
    end
  always
    @(posedge clk) begin
      reg115 <= (+wire75);
      reg116 <= wire83[(1'h1):(1'h1)];
      reg117 <= reg110;
    end
  assign wire118 = $signed($signed((~^reg98)));
  assign wire119 = wire70;
  assign wire120 = wire79[(3'h6):(3'h4)];
  assign wire121 = (|$signed((+reg110[(1'h0):(1'h0)])));
  assign wire122 = (&$signed(reg98[(2'h2):(1'h0)]));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire [(5'h11):(1'h0)] wire25;
  input wire signed [(3'h4):(1'h0)] wire24;
  input wire signed [(4'hb):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg28,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg27 <= (+wire25);
      reg28 <= $signed(($unsigned({((8'ha6) ? wire26 : (8'hb0)),
          wire25}) ~^ $unsigned(((~|wire23) ?
          $signed(wire25) : wire23[(4'ha):(3'h7)]))));
    end
  assign wire29 = (!((wire23 ? wire23 : {(reg28 || reg27)}) ?
                      $signed($signed(wire23[(1'h1):(1'h1)])) : $unsigned(reg27)));
  assign wire30 = wire25;
  assign wire31 = $signed((8'ha0));
  assign wire32 = ((!{$unsigned((^~wire31)), reg27}) ?
                      wire29[(1'h0):(1'h0)] : $unsigned(reg27[(2'h2):(1'h1)]));
  assign wire33 = $signed((($signed({wire26,
                      (7'h43)}) < (^~$unsigned(wire32))) <= (~|({wire31} <<< (wire25 && wire30)))));
  assign wire34 = $unsigned((wire32[(3'h5):(1'h0)] ?
                      $unsigned(wire30) : (($signed(wire30) | $signed((8'hb9))) && (reg27[(1'h1):(1'h0)] != wire30))));
  always
    @(posedge clk) begin
      if (wire26)
        begin
          reg35 <= ((($unsigned((wire25 != wire29)) << wire25[(4'hc):(1'h1)]) ?
              (~wire29[(3'h4):(2'h2)]) : wire33) < ($unsigned($unsigned(wire30)) ~^ (~|$signed((wire24 == reg27)))));
          reg36 <= wire30;
          reg37 <= wire31;
          reg38 <= ($unsigned((+{reg37[(1'h0):(1'h0)],
              $unsigned((8'hae))})) ~^ (wire23 != wire32));
        end
      else
        begin
          reg35 <= $signed(((reg27[(2'h3):(2'h3)] ?
              (~^(~^reg38)) : $signed({wire31,
                  wire33})) ^~ $signed(wire23[(3'h5):(3'h4)])));
          reg36 <= ((~^(($signed(wire30) >= wire24) ^~ (reg37 + wire33))) == $signed(wire29));
          reg37 <= wire24[(3'h4):(1'h0)];
          if ({{(~^wire30), $unsigned($unsigned($unsigned(wire29)))},
              reg38[(2'h2):(2'h2)]})
            begin
              reg38 <= ((!(8'hac)) ?
                  $unsigned($unsigned((|(wire31 ?
                      wire30 : wire33)))) : ((~&{((8'h9c) * reg38), wire31}) ?
                      (^wire32[(4'h9):(2'h2)]) : $unsigned($unsigned((wire34 && reg35)))));
              reg39 <= (8'ha1);
              reg40 <= (wire34 ?
                  reg27 : {{$unsigned($signed(reg27)), (!reg28)}});
              reg41 <= wire34;
            end
          else
            begin
              reg38 <= (8'ha1);
              reg39 <= wire32;
              reg40 <= wire32;
              reg41 <= ((reg28 ?
                  (~^{(reg36 == (8'ha6))}) : $unsigned(reg39[(5'h11):(3'h6)])) ~^ (wire30 ?
                  {$signed((wire24 && wire23)), wire25} : ($unsigned(((8'haf) ?
                      wire26 : wire32)) | (~$signed(reg38)))));
              reg42 <= $unsigned($unsigned((+wire23)));
            end
        end
      reg43 <= $unsigned(((+$unsigned((wire34 ? wire23 : wire24))) ?
          wire23 : $signed(reg35)));
      reg44 <= {(((|(~^reg42)) < ($signed(reg42) ?
                  ((8'ha8) | reg36) : wire33)) ?
              $signed($unsigned(wire30)) : {reg35}),
          reg35[(2'h3):(2'h2)]};
      if ((8'hb4))
        begin
          reg45 <= $unsigned((reg28[(3'h7):(3'h6)] ?
              $signed(((reg42 ?
                  (8'hac) : wire31) >>> wire32)) : (reg44[(5'h14):(2'h2)] ?
                  wire31 : $unsigned($unsigned(wire33)))));
        end
      else
        begin
          reg45 <= (~^(($signed((!wire24)) >> (+{reg45,
              wire33})) != wire33[(2'h2):(1'h0)]));
          if (reg37[(1'h0):(1'h0)])
            begin
              reg46 <= ((8'hbc) <= $signed((~&($signed(reg44) ?
                  reg43 : (reg27 ^~ reg36)))));
              reg47 <= wire23[(1'h0):(1'h0)];
              reg48 <= wire26;
              reg49 <= $unsigned((~^($unsigned((reg48 ? (8'hb8) : wire34)) ?
                  (&$signed(reg46)) : ((reg38 >> reg38) ?
                      $unsigned(wire30) : $unsigned(reg44)))));
              reg50 <= $unsigned((-(~^((8'h9c) ?
                  (wire29 ^~ wire34) : $unsigned(reg27)))));
            end
          else
            begin
              reg46 <= (reg49 ^ ((wire32 ?
                  reg38 : $unsigned((reg48 ^~ reg48))) <= reg36));
              reg47 <= ((8'h9f) | (!$unsigned((reg47 >> {reg47}))));
            end
        end
      reg51 <= {$unsigned(wire24)};
    end
  always
    @(posedge clk) begin
      reg52 <= $unsigned((!$unsigned((-wire29))));
    end
  assign wire53 = $unsigned($signed($signed((reg46[(4'h9):(4'h9)] ?
                      (reg39 ^ reg45) : (wire25 + reg51)))));
  assign wire54 = reg48;
endmodule

module module163
#(parameter param186 = ((((7'h43) || (~&{(8'ha8)})) != {{((8'h9d) + (8'h9d))}}) ? ((~{{(7'h41), (8'hbf)}, ((8'hbb) ? (8'hb5) : (8'haf))}) ? (~^{{(8'hbc)}, ((8'hb4) ? (8'haa) : (8'ha6))}) : {(((8'haf) ? (8'hb4) : (8'hbb)) == ((8'h9d) < (8'haa))), (8'hbe)}) : (((((8'ha9) ? (8'ha5) : (8'hb1)) >> ((8'hb8) ~^ (8'h9e))) ? {(8'hb9)} : (((8'haf) ? (8'hac) : (8'hb7)) ? ((7'h41) ? (8'ha9) : (8'ha0)) : ((8'ha3) >>> (7'h42)))) << (|(((8'hb6) != (7'h43)) ? ((8'hb1) || (8'hba)) : ((8'hb8) || (8'hba)))))))
(y, clk, wire168, wire167, wire166, wire165, wire164);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire168;
  input wire signed [(4'ha):(1'h0)] wire167;
  input wire signed [(3'h6):(1'h0)] wire166;
  input wire [(5'h12):(1'h0)] wire165;
  input wire signed [(2'h2):(1'h0)] wire164;
  wire signed [(5'h15):(1'h0)] wire185;
  wire [(5'h11):(1'h0)] wire184;
  wire [(3'h6):(1'h0)] wire182;
  reg [(5'h15):(1'h0)] reg183 = (1'h0);
  reg [(4'he):(1'h0)] reg181 = (1'h0);
  reg [(5'h11):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg179 = (1'h0);
  reg [(4'h9):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg177 = (1'h0);
  reg [(5'h12):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg175 = (1'h0);
  reg [(4'h9):(1'h0)] reg174 = (1'h0);
  reg [(4'h9):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire182,
                 reg183,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg169 <= {wire164};
      reg170 <= ((wire166[(1'h0):(1'h0)] ?
          $unsigned(reg169[(4'hb):(3'h7)]) : (wire167 ?
              (reg169 ?
                  (~^wire166) : $unsigned((8'hb9))) : ((8'ha4) ~^ wire165))) ^~ wire164);
      if (wire164[(1'h0):(1'h0)])
        begin
          reg171 <= $signed((wire165 >> ($unsigned((reg170 ?
              wire168 : wire167)) < $signed($signed((7'h41))))));
          reg172 <= $signed((&$unsigned(($signed(wire166) ?
              reg170[(1'h0):(1'h0)] : ((7'h43) ^ wire166)))));
          if (((reg170 ?
                  {reg169,
                      ((wire164 ? (8'haf) : reg169) + (wire166 ?
                          reg169 : (8'ha2)))} : (reg172 * $unsigned((wire165 >> wire168)))) ?
              $unsigned((({wire165} ?
                  {wire167} : (reg171 ?
                      reg170 : wire166)) | wire166[(1'h0):(1'h0)])) : reg172))
            begin
              reg173 <= (8'haf);
              reg174 <= ($unsigned(($unsigned((wire167 >>> wire168)) + (wire166[(2'h2):(1'h0)] ?
                      wire165 : reg169))) ?
                  $signed($signed((wire167[(3'h6):(3'h4)] ?
                      $unsigned((8'haf)) : {wire168,
                          reg170}))) : wire164[(1'h1):(1'h0)]);
              reg175 <= wire167;
              reg176 <= ($signed({$unsigned(reg170[(3'h7):(3'h4)]),
                      $unsigned((7'h41))}) ?
                  {reg170, wire164[(1'h1):(1'h1)]} : $signed(wire166));
              reg177 <= ($unsigned($signed(reg175)) ?
                  (8'ha9) : $unsigned(((7'h43) ?
                      ((-wire165) || $unsigned(reg172)) : wire167)));
            end
          else
            begin
              reg173 <= (!{$unsigned(reg169), reg171[(4'hc):(1'h1)]});
            end
          if ((reg169[(1'h0):(1'h0)] <= ((reg174 ~^ $unsigned($signed(reg172))) ?
              $unsigned(({reg177} < $unsigned(wire166))) : ($unsigned(wire168[(1'h0):(1'h0)]) << {wire168[(1'h1):(1'h0)],
                  $signed(wire167)}))))
            begin
              reg178 <= reg174;
              reg179 <= ($unsigned(wire166) ?
                  ({$signed(reg178)} ?
                      ((wire166[(1'h0):(1'h0)] >= (reg177 + wire168)) + $unsigned((~(8'hb9)))) : $signed((&{wire165}))) : wire166[(3'h6):(1'h0)]);
            end
          else
            begin
              reg178 <= (($signed($unsigned(reg173)) ?
                      (((^~wire167) ? (8'ha5) : reg171) ?
                          reg170 : ($signed((8'hba)) >> {wire168,
                              wire168})) : {$unsigned((~&reg173)),
                          $unsigned(wire166[(3'h6):(3'h5)])}) ?
                  (~&$signed(wire165[(3'h6):(1'h1)])) : ($signed((reg175[(3'h6):(3'h4)] ~^ (reg174 | wire165))) >> $unsigned((reg178[(2'h2):(2'h2)] ?
                      $signed((8'hb3)) : wire167[(1'h1):(1'h0)]))));
            end
        end
      else
        begin
          reg171 <= (+((~|wire168[(1'h0):(1'h0)]) || reg172[(2'h2):(2'h2)]));
          reg172 <= (($unsigned(wire164) & ($unsigned((reg172 ?
                  reg170 : reg177)) != reg179[(1'h0):(1'h0)])) ?
              reg171 : ((reg169 * (((8'hbe) >>> (8'ha7)) ?
                  (wire166 ?
                      reg170 : wire168) : {wire165})) >= reg177[(4'h8):(3'h4)]));
        end
      reg180 <= $signed((!(reg176 ?
          reg171[(3'h6):(3'h6)] : (wire168 ? $signed(reg169) : {reg172}))));
      reg181 <= $signed((~&(!($unsigned(wire165) ? reg178 : {reg177}))));
    end
  assign wire182 = reg173;
  always
    @(posedge clk) begin
      reg183 <= ((~^$signed($unsigned(reg169))) ?
          wire166[(1'h1):(1'h1)] : (reg169 ?
              (((reg177 ? reg175 : wire167) ?
                      reg181[(3'h6):(3'h5)] : $unsigned(reg171)) ?
                  $signed({wire168}) : reg176) : $unsigned(((reg169 | reg179) ?
                  wire164 : reg177))));
    end
  assign wire184 = $signed($signed((~^$signed($unsigned(reg183)))));
  assign wire185 = {((+($signed(reg175) ~^ wire165[(4'h9):(3'h5)])) ?
                           (|$unsigned(reg170[(3'h6):(3'h5)])) : wire168[(1'h1):(1'h0)]),
                       $unsigned(reg170)};
endmodule
