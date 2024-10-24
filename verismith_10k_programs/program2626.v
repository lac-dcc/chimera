module top
#(parameter param187 = {({((~&(8'ha5)) <<< {(8'ha4)}), {((7'h43) && (8'hb8)), ((8'hb9) ? (8'ha6) : (8'hbe))}} && ({((7'h43) <= (8'ha2)), ((7'h40) ? (8'haf) : (8'hb1))} == (|{(8'hbc)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire186;
  wire [(5'h12):(1'h0)] wire184;
  wire signed [(3'h4):(1'h0)] wire183;
  wire signed [(5'h12):(1'h0)] wire182;
  wire [(5'h13):(1'h0)] wire180;
  wire [(2'h3):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire139;
  wire [(4'ha):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg185 = (1'h0);
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(4'ha):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  assign y = {wire186,
                 wire184,
                 wire183,
                 wire182,
                 wire180,
                 wire141,
                 wire139,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg185,
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
                 reg143,
                 reg142,
                 (1'h0)};
  assign wire5 = (|$unsigned($signed(((&(8'hb9)) + $signed(wire2)))));
  assign wire6 = ($signed(($signed(wire4[(3'h4):(2'h2)]) >> (8'ha1))) > (($unsigned((wire1 | wire5)) || (wire5 && wire3[(3'h6):(2'h2)])) ?
                     $unsigned(wire4[(2'h2):(1'h1)]) : $signed($unsigned((wire5 && (8'ha3))))));
  assign wire7 = wire6[(1'h1):(1'h0)];
  assign wire8 = (^(^(~^(-(wire3 ? wire2 : (8'h9d))))));
  assign wire9 = (~&$signed({wire3[(3'h5):(1'h1)],
                     ({wire3, wire3} * $unsigned(wire7))}));
  assign wire10 = wire5[(4'hf):(4'hb)];
  assign wire11 = (((8'hbe) ?
                          ((^~((8'haf) ^ wire2)) ?
                              wire9 : wire8[(2'h3):(2'h2)]) : ((^~$unsigned(wire3)) ?
                              (~^$signed(wire8)) : wire8)) ?
                      wire10[(4'h8):(3'h5)] : wire6[(2'h3):(2'h3)]);
  assign wire12 = $unsigned($signed(wire6));
  assign wire13 = $signed($unsigned(wire12[(3'h6):(1'h0)]));
  assign wire14 = wire8;
  assign wire15 = (^(~&wire2));
  assign wire16 = (7'h40);
  assign wire17 = (((^$signed((^~wire5))) ?
                      wire7 : (wire11[(4'hb):(4'ha)] ~^ $signed($unsigned(wire12)))) & (^~wire13));
  module18 #() modinst140 (wire139, clk, wire15, wire16, wire4, wire14);
  assign wire141 = $unsigned(wire139[(4'hd):(4'hc)]);
  always
    @(posedge clk) begin
      reg142 <= wire3[(2'h3):(1'h0)];
      if (wire16)
        begin
          reg143 <= ((~|wire16[(4'hd):(4'hc)]) + $unsigned((wire17[(2'h3):(1'h1)] & wire13)));
          reg144 <= (8'hbd);
          reg145 <= wire11[(3'h6):(1'h0)];
          reg146 <= wire17;
          if (wire13)
            begin
              reg147 <= ({(($unsigned(wire6) >= (wire8 - wire13)) ?
                          ({wire10, wire3} ?
                              (wire2 ? wire11 : wire6) : (wire141 ?
                                  wire9 : wire2)) : reg143),
                      wire16[(3'h7):(3'h7)]} ?
                  $signed(wire8[(3'h4):(1'h1)]) : $unsigned(wire13[(3'h4):(1'h1)]));
              reg148 <= $unsigned((~^reg143));
              reg149 <= ((($signed($signed(reg143)) ?
                          wire141 : $signed((wire7 ? wire1 : wire11))) ?
                      $signed(((wire7 ? reg148 : wire0) ?
                          $unsigned((8'hbb)) : wire4)) : ($unsigned($signed(wire4)) >> $unsigned({wire12,
                          reg146}))) ?
                  ((~|$unsigned(wire139)) ?
                      reg148[(2'h2):(1'h1)] : {(^~$signed(reg143)),
                          (&{wire5})}) : (&($unsigned((wire9 > (7'h40))) != (~&$unsigned(reg144)))));
              reg150 <= $signed((~$unsigned({(wire7 ? reg148 : wire15),
                  $signed(reg144)})));
              reg151 <= reg147[(1'h0):(1'h0)];
            end
          else
            begin
              reg147 <= $signed({wire141, $unsigned({wire4})});
              reg148 <= ($unsigned(wire9[(3'h4):(1'h0)]) ?
                  $signed(({$unsigned(wire4), wire6} ?
                      $signed(((8'had) ?
                          (8'hb5) : (8'ha6))) : $signed($unsigned(wire5)))) : (wire9 ?
                      $unsigned(wire139[(5'h11):(3'h6)]) : wire7[(2'h3):(1'h1)]));
              reg149 <= $signed({(wire0 ?
                      (|$unsigned(wire6)) : $unsigned(reg150))});
              reg150 <= reg149;
            end
        end
      else
        begin
          reg143 <= reg151;
        end
      reg152 <= (((+wire7[(2'h2):(1'h0)]) ?
          $unsigned({(reg148 >>> wire4)}) : ({(^~wire6)} ?
              (~$unsigned(reg150)) : {(8'h9e),
                  ((7'h41) <= (8'hbb))})) > $signed({$unsigned((!reg144))}));
      reg153 <= ($unsigned(wire7) >= wire13[(2'h3):(1'h0)]);
    end
  module154 #() modinst181 (.y(wire180), .wire156(wire11), .wire155(reg149), .wire157(reg152), .clk(clk), .wire158(wire14));
  assign wire182 = ($unsigned($unsigned($signed((wire180 == wire8)))) ?
                       ((((&wire9) <<< wire139) ?
                               ($unsigned(wire2) >> (wire141 ?
                                   reg143 : wire0)) : ($unsigned(reg150) != $unsigned(wire12))) ?
                           wire1[(3'h5):(2'h2)] : wire8) : (reg149 ^ ({(wire5 | reg151)} ?
                           {(wire17 ? wire12 : (8'hb8))} : ({wire12} ?
                               $unsigned(reg149) : (+(7'h42))))));
  assign wire183 = wire2[(5'h13):(1'h0)];
  assign wire184 = wire8[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg185 <= {({$signed($signed(wire12))} ?
              $unsigned($signed(wire10)) : $unsigned($signed(wire17[(1'h1):(1'h0)]))),
          ((wire183 ? (|(^reg153)) : reg144) ?
              (!($signed(reg148) ? $signed(wire11) : (+wire1))) : (((wire13 ?
                      (8'hba) : wire12) == (reg150 ? reg148 : reg151)) ?
                  wire5[(4'hb):(3'h4)] : (7'h43)))};
    end
  assign wire186 = $unsigned($signed(wire7));
endmodule

module module154  (y, clk, wire158, wire157, wire156, wire155);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire158;
  input wire [(4'hb):(1'h0)] wire157;
  input wire [(4'he):(1'h0)] wire156;
  input wire signed [(5'h14):(1'h0)] wire155;
  wire [(4'hc):(1'h0)] wire179;
  wire [(4'hf):(1'h0)] wire178;
  wire [(5'h15):(1'h0)] wire177;
  wire [(3'h6):(1'h0)] wire176;
  wire [(4'h8):(1'h0)] wire172;
  wire signed [(4'hc):(1'h0)] wire171;
  wire [(5'h15):(1'h0)] wire169;
  wire [(5'h11):(1'h0)] wire168;
  wire [(5'h14):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire165;
  wire signed [(4'h9):(1'h0)] wire159;
  reg [(2'h2):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg173 = (1'h0);
  reg [(4'hd):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire172,
                 wire171,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire159,
                 reg175,
                 reg174,
                 reg173,
                 reg170,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 (1'h0)};
  assign wire159 = ((~$unsigned((|$unsigned(wire155)))) * (wire156[(3'h5):(2'h3)] ?
                       $signed((~wire156[(2'h3):(2'h2)])) : wire158[(4'ha):(2'h2)]));
  always
    @(posedge clk) begin
      reg160 <= (|(wire159 * wire156[(4'h8):(1'h1)]));
      reg161 <= wire155;
      reg162 <= {{wire156[(1'h1):(1'h0)]}, wire155[(4'hc):(4'h9)]};
      reg163 <= wire158;
      reg164 <= $unsigned($signed((~&((^reg162) * (~reg160)))));
    end
  assign wire165 = reg164[(1'h0):(1'h0)];
  assign wire166 = ($unsigned((^$signed((wire156 ?
                       wire165 : (8'h9f))))) || (((+(8'h9e)) > wire155[(3'h7):(3'h7)]) ?
                       (reg164[(5'h10):(4'hb)] ?
                           ((wire159 + wire159) ?
                               wire157[(4'h9):(2'h3)] : (reg162 ?
                                   reg162 : reg160)) : $signed((reg162 ~^ wire159))) : (!($signed(wire156) ?
                           (reg161 ? wire165 : reg162) : (reg163 ?
                               wire156 : wire158)))));
  assign wire167 = $signed(wire166);
  assign wire168 = (-$unsigned((wire165[(5'h11):(4'hf)] == (~&wire155[(1'h0):(1'h0)]))));
  assign wire169 = {$unsigned({wire167[(5'h11):(4'he)]}),
                       (($unsigned($signed(reg162)) | $signed($signed(wire167))) ?
                           wire166 : (|(-(~^reg164))))};
  always
    @(posedge clk) begin
      reg170 <= {{(!$signed((reg162 <<< wire156)))},
          $unsigned($unsigned(wire157))};
    end
  assign wire171 = $signed((+{(reg170 ?
                           $signed((8'ha7)) : $unsigned((8'hb1)))}));
  assign wire172 = ({reg170, $signed((~^{reg163, wire168}))} >> reg163);
  always
    @(posedge clk) begin
      reg173 <= ($signed($unsigned({((8'ha4) ? wire165 : wire168),
          $unsigned(reg163)})) <<< {wire168[(1'h1):(1'h0)]});
      reg174 <= reg163[(2'h3):(1'h0)];
      reg175 <= (~&wire169[(4'h8):(3'h6)]);
    end
  assign wire176 = (($unsigned(((wire155 ? reg164 : (7'h43)) && {wire158,
                           (7'h41)})) << reg163[(1'h0):(1'h0)]) ?
                       wire156 : $signed($unsigned((8'ha0))));
  assign wire177 = ({$unsigned($signed((&wire155)))} ?
                       reg173 : wire159[(3'h6):(3'h6)]);
  assign wire178 = $signed((^~(^(-$unsigned(reg162)))));
  assign wire179 = {reg161[(4'ha):(1'h1)],
                       $signed($unsigned(({wire166} ?
                           wire168[(5'h11):(3'h5)] : wire165[(5'h15):(4'h8)])))};
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  input wire signed [(3'h4):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire138;
  wire [(5'h10):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  assign y = {wire138,
                 wire136,
                 wire79,
                 wire78,
                 wire76,
                 wire41,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg40,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 (1'h0)};
  assign wire23 = $signed(((wire19 ?
                          ((wire19 * wire21) >> $signed(wire19)) : {(wire21 ?
                                  wire19 : wire22)}) ?
                      wire22[(2'h3):(1'h0)] : $signed((~&$unsigned(wire19)))));
  assign wire24 = wire22;
  assign wire25 = (8'hba);
  assign wire26 = (^~$unsigned(((~{(8'ha1), wire20}) ?
                      (wire24[(4'h9):(2'h3)] - wire22[(5'h10):(4'h9)]) : (wire23 ?
                          $unsigned(wire19) : $unsigned((8'ha9))))));
  assign wire27 = $unsigned(($unsigned({(wire21 ? wire20 : wire21),
                          $unsigned(wire23)}) ?
                      $signed((~&(wire20 ?
                          wire21 : (8'ha4)))) : (wire26[(2'h3):(1'h1)] == (wire20 ?
                          (wire20 < wire25) : (wire25 < wire19)))));
  always
    @(posedge clk) begin
      reg28 <= wire19[(2'h2):(1'h0)];
      if ((^wire27))
        begin
          reg29 <= (reg28 ? $unsigned((~wire19)) : wire26);
          reg30 <= ({$unsigned($unsigned((|wire19))), wire22} ?
              $unsigned(wire23[(1'h0):(1'h0)]) : $signed(((^{wire22, wire26}) ?
                  (8'hbf) : {(-wire21)})));
          reg31 <= ((~&$signed({(reg28 ? wire19 : (8'hab))})) ?
              wire21[(5'h13):(4'he)] : (wire23 ?
                  (wire25 ?
                      $signed(wire27[(2'h3):(2'h3)]) : wire20) : $unsigned((~&(wire24 ?
                      reg30 : wire27)))));
          reg32 <= $unsigned($unsigned(($signed(wire19[(1'h1):(1'h0)]) >> wire20[(2'h3):(2'h2)])));
          reg33 <= (wire27 != {$signed(reg29[(1'h1):(1'h0)]),
              ((-$signed(wire27)) ?
                  (&(wire23 <<< (8'hb1))) : ($unsigned(wire20) == wire19[(3'h4):(2'h3)]))});
        end
      else
        begin
          reg29 <= (($unsigned((~&reg33[(4'h9):(1'h1)])) + $unsigned({wire21})) ?
              (-wire22[(5'h12):(4'he)]) : (~((-wire19) ^~ $unsigned(wire21[(5'h11):(4'hc)]))));
          reg30 <= ($signed($signed(((^~reg31) ?
              (wire23 ? reg28 : wire19) : $signed(reg30)))) < ({(&{reg31})} ?
              reg33 : (&wire21)));
          reg31 <= $unsigned((reg30[(4'h8):(1'h0)] ?
              ({$signed((8'hb8)), wire24[(4'ha):(1'h0)]} ?
                  (~&$signed(wire25)) : {(8'hb0)}) : (~^(8'hbc))));
          reg32 <= $unsigned((~(!(+(^(8'hba))))));
        end
      reg34 <= wire20[(3'h4):(1'h0)];
      reg35 <= $signed((reg31[(2'h3):(2'h2)] ~^ $unsigned((~&$unsigned((8'hb8))))));
    end
  assign wire36 = ({$signed(reg33)} ?
                      (~reg34) : $signed((wire20 ?
                          (reg31[(4'ha):(4'h9)] || (reg28 * wire25)) : $signed(((8'ha1) + (8'hb2))))));
  assign wire37 = (8'ha8);
  assign wire38 = (~|($unsigned($signed({wire25,
                      wire36})) >>> $unsigned((reg29[(3'h5):(2'h3)] + reg29[(2'h2):(2'h2)]))));
  assign wire39 = $unsigned({(~&($signed(wire23) | (wire38 ?
                          reg30 : wire22)))});
  always
    @(posedge clk) begin
      reg40 <= $unsigned(reg29[(1'h1):(1'h1)]);
    end
  assign wire41 = wire37;
  module42 #() modinst77 (wire76, clk, wire39, wire20, reg40, wire27, wire41);
  assign wire78 = $unsigned((~$signed($signed(wire21[(3'h7):(3'h6)]))));
  assign wire79 = ($unsigned(wire37[(3'h5):(2'h3)]) ~^ {(!$unsigned((wire26 ?
                          reg29 : reg34)))});
  always
    @(posedge clk) begin
      reg80 <= wire19;
      reg81 <= $unsigned({(~{$signed(reg31), $unsigned((8'ha1))}),
          ($unsigned((8'ha3)) ?
              wire24[(4'hb):(3'h6)] : ($unsigned((8'ha1)) >= (reg28 ?
                  wire41 : wire27)))});
      if ($signed($signed($signed((8'ha5)))))
        begin
          reg82 <= (8'hb0);
          reg83 <= {($unsigned((reg31 || (^~reg28))) <= ($signed((wire36 ?
                      wire19 : reg80)) ?
                  ((reg80 ? (8'hb0) : (8'ha7)) ?
                      (wire24 - wire19) : $signed(wire37)) : reg28[(3'h4):(1'h1)])),
              (reg82[(1'h1):(1'h1)] + {(reg31[(2'h3):(2'h3)] >>> (+(8'hbe)))})};
          if ((^~$unsigned($unsigned($unsigned($signed(reg34))))))
            begin
              reg84 <= wire38;
              reg85 <= $signed(reg35);
              reg86 <= ((-$signed($signed((+(8'hb1))))) > wire26[(4'hb):(4'hb)]);
              reg87 <= (^~wire78[(1'h0):(1'h0)]);
              reg88 <= (!(reg30[(4'hd):(4'h9)] - ($unsigned(reg34[(1'h1):(1'h0)]) <<< wire22[(4'he):(4'he)])));
            end
          else
            begin
              reg84 <= (~&$unsigned($unsigned($signed((8'ha0)))));
              reg85 <= wire39;
              reg86 <= reg82[(3'h4):(1'h0)];
              reg87 <= wire41;
              reg88 <= reg81;
            end
        end
      else
        begin
          reg82 <= wire24[(3'h4):(3'h4)];
          reg83 <= reg29[(4'h8):(1'h1)];
          if ($unsigned($signed((~^$unsigned($signed(wire23))))))
            begin
              reg84 <= reg85;
              reg85 <= $signed((8'ha8));
              reg86 <= reg33;
              reg87 <= wire39[(1'h0):(1'h0)];
              reg88 <= reg40;
            end
          else
            begin
              reg84 <= $unsigned($signed(reg84[(2'h3):(1'h1)]));
              reg85 <= {($signed(reg29) ^ ($unsigned(reg40[(4'h8):(3'h7)]) ?
                      (&$unsigned(reg34)) : (-wire24))),
                  ((+wire38) - ($signed($signed(reg30)) ?
                      ({reg33, wire19} ?
                          $signed((7'h42)) : reg85[(4'hd):(1'h0)]) : $unsigned($unsigned(wire22))))};
              reg86 <= wire27;
              reg87 <= {{wire23}};
              reg88 <= $signed(wire78[(3'h4):(1'h1)]);
            end
          if ((~^wire19))
            begin
              reg89 <= wire19;
            end
          else
            begin
              reg89 <= $signed(wire22[(4'ha):(4'ha)]);
            end
          reg90 <= (($unsigned(wire39) ?
              (((&wire21) ?
                  wire38 : $unsigned(reg86)) < (-wire25)) : (^(7'h42))) | $signed(((8'ha3) ?
              ({wire27} ?
                  $signed(wire22) : $signed(wire76)) : $signed($unsigned(reg34)))));
        end
    end
  always
    @(posedge clk) begin
      reg91 <= reg90;
      reg92 <= (wire37[(4'hf):(4'he)] ^ wire38);
      reg93 <= (wire78[(3'h7):(1'h0)] ?
          $unsigned((~&$signed($signed(wire24)))) : reg83);
      reg94 <= ($signed(reg80[(3'h4):(2'h2)]) ?
          ({((reg92 * wire76) ?
                  (-reg93) : ((8'hb8) <= reg40))} >= {((reg84 * reg82) <= reg81),
              reg90}) : ({reg30,
              wire37[(4'hd):(4'h9)]} - (reg86[(4'hb):(3'h5)] ?
              reg35[(4'h8):(3'h6)] : $signed(reg82))));
    end
  module95 #() modinst137 (.clk(clk), .y(wire136), .wire100(wire24), .wire97(wire23), .wire96(reg80), .wire99(wire78), .wire98(wire37));
  assign wire138 = (8'hb3);
endmodule

module module95
#(parameter param134 = {(8'hb9)}, 
parameter param135 = param134)
(y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire100;
  input wire [(4'hb):(1'h0)] wire99;
  input wire signed [(4'hd):(1'h0)] wire98;
  input wire signed [(5'h11):(1'h0)] wire97;
  input wire [(4'hf):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire [(5'h10):(1'h0)] wire131;
  wire [(5'h15):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire129;
  wire [(4'h8):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire127;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire125;
  wire signed [(4'hc):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire123;
  wire signed [(3'h5):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire101;
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire119,
                 wire118,
                 wire117,
                 wire101,
                 reg122,
                 reg121,
                 reg120,
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
                 (1'h0)};
  assign wire101 = (7'h42);
  always
    @(posedge clk) begin
      if (wire101)
        begin
          reg102 <= ({wire96,
                  ($signed((wire99 >> wire98)) ?
                      wire96[(4'ha):(1'h1)] : (((8'ha5) ?
                          wire101 : wire97) << $signed(wire96)))} ?
              $signed($unsigned((!(~&wire99)))) : wire98[(1'h1):(1'h1)]);
          reg103 <= wire101[(2'h3):(1'h1)];
          reg104 <= $unsigned(((({wire101, reg103} ?
                  ((8'hab) ?
                      reg102 : reg102) : $unsigned((8'hb0))) >> (!(!(8'hbf)))) ?
              wire100 : {$unsigned($signed(wire99)),
                  $signed($unsigned(reg103))}));
        end
      else
        begin
          reg102 <= reg102[(3'h7):(3'h6)];
          reg103 <= wire97[(2'h3):(1'h1)];
          reg104 <= (|{(~(~^$unsigned(wire98)))});
        end
      if (reg104[(1'h1):(1'h0)])
        begin
          reg105 <= (~wire100);
          reg106 <= reg103;
          reg107 <= $signed((((~|reg102) ?
                  (wire100[(3'h6):(1'h0)] ? (+reg102) : (|(8'haa))) : (wire98 ?
                      (^~wire101) : $unsigned(wire100))) ?
              (&wire99[(1'h1):(1'h1)]) : {reg106}));
          reg108 <= wire99;
          reg109 <= (!$unsigned(reg105[(2'h2):(2'h2)]));
        end
      else
        begin
          reg105 <= ((8'h9d) + (((wire101 ?
              $unsigned(wire96) : wire98[(4'ha):(1'h0)]) ^~ reg107) != $signed((~|(-(8'hb9))))));
          reg106 <= {($unsigned(((reg107 ? reg106 : wire97) == (reg108 ?
                  (8'hab) : reg109))) >= (!wire100)),
              wire101[(4'hc):(2'h2)]};
        end
      reg110 <= (&$signed((^~wire98[(2'h2):(2'h2)])));
      if ({reg107[(2'h3):(2'h3)]})
        begin
          reg111 <= wire96[(3'h4):(2'h3)];
        end
      else
        begin
          reg111 <= $unsigned($signed($unsigned((reg105 ~^ $signed(reg106)))));
          if ($signed((&$signed($signed(wire100)))))
            begin
              reg112 <= {{wire101[(3'h6):(3'h5)],
                      $signed((^$unsigned((8'hbe))))},
                  $unsigned($signed({$signed(reg107), (~^reg108)}))};
              reg113 <= $unsigned(wire96);
              reg114 <= ((reg102 ?
                      {$unsigned(wire96[(4'h9):(3'h4)])} : (reg108[(4'ha):(2'h3)] ?
                          reg105 : (!(wire100 >> reg104)))) ?
                  ((8'hb5) ?
                      (({reg104, reg112} ?
                              $unsigned(reg112) : $signed(wire100)) ?
                          ((reg107 ?
                              wire98 : wire97) >> $unsigned(reg103)) : wire97[(2'h3):(1'h0)]) : {reg110}) : {(-$unsigned(reg108[(3'h5):(2'h3)])),
                      wire99[(4'h9):(2'h3)]});
            end
          else
            begin
              reg112 <= (-$signed(($signed((^(8'hbd))) ?
                  ((wire101 == wire101) ?
                      (reg113 && reg109) : $unsigned(reg114)) : reg103)));
              reg113 <= reg111;
              reg114 <= {(^~(({wire101, reg105} * ((8'hab) <<< reg105)) ?
                      {{reg109, reg103}} : $signed($unsigned((8'hae))))),
                  (&(~&wire98))};
            end
          reg115 <= (((+reg111) ?
                  {$unsigned((&reg102)),
                      (reg107[(4'h8):(3'h7)] != $unsigned(reg102))} : (|$unsigned(reg108))) ?
              (($signed($signed(wire99)) ?
                  ($unsigned(reg113) >= $signed(reg110)) : $signed($unsigned(reg113))) >> ($unsigned((&wire96)) == reg102)) : (reg112 ?
                  (reg105[(2'h3):(1'h1)] ?
                      ((reg102 == (7'h41)) && ((8'hab) | reg108)) : $unsigned($unsigned((8'ha8)))) : (wire97 ?
                      (+$unsigned(reg109)) : (^reg112))));
        end
      reg116 <= ($unsigned(($signed(((8'hbc) ? reg110 : wire100)) ?
              (~|(reg104 << reg112)) : $signed((reg102 ? reg115 : (8'ha8))))) ?
          reg105[(2'h2):(1'h1)] : (-reg114[(2'h2):(2'h2)]));
    end
  assign wire117 = $signed($signed((reg108 != reg114)));
  assign wire118 = ((-$unsigned(((reg116 ? (8'ha3) : reg104) ~^ {wire101,
                       wire97}))) == reg112);
  assign wire119 = (~&$unsigned(($signed(((8'ha0) ? reg107 : reg116)) ?
                       reg102 : {$unsigned((8'hae)), (~|reg111)})));
  always
    @(posedge clk) begin
      reg120 <= wire100;
      reg121 <= {((!(!reg103[(4'h8):(1'h0)])) ?
              wire99 : $unsigned(((+wire100) ?
                  reg103 : reg114[(3'h4):(3'h4)])))};
      reg122 <= $signed(($signed($signed($unsigned(reg113))) ?
          wire99[(2'h3):(1'h0)] : reg112[(2'h2):(1'h1)]));
    end
  assign wire123 = (wire97 >= ($signed((^~(^reg120))) && $signed((reg113[(2'h2):(2'h2)] ^~ wire97))));
  assign wire124 = {$signed((|$signed($signed(reg104))))};
  assign wire125 = (-($unsigned(($signed(reg111) ?
                       reg108[(4'hd):(4'hd)] : (wire123 << wire96))) ^ (reg108[(2'h2):(2'h2)] ?
                       $unsigned($signed(reg104)) : ((wire124 ?
                               reg110 : reg120) ?
                           $signed(wire119) : (reg113 + (8'ha6))))));
  assign wire126 = {{(wire125 ?
                               (|reg120) : ((wire123 & reg105) ?
                                   reg114[(3'h6):(3'h4)] : wire98[(2'h2):(2'h2)])),
                           (&($signed((8'haf)) > {wire124}))}};
  assign wire127 = $signed(reg102[(2'h3):(1'h0)]);
  assign wire128 = $signed({(((8'ha4) ?
                           wire101 : ((8'hbb) ?
                               wire124 : (8'h9e))) || reg122[(5'h14):(5'h14)]),
                       reg108});
  assign wire129 = {({(~&$unsigned(reg105)),
                           ((^~reg105) ?
                               $signed(reg114) : reg110)} & $unsigned(wire97[(2'h2):(1'h1)]))};
  assign wire130 = ((&(~&(wire117[(4'hb):(2'h3)] ?
                           (reg108 - reg113) : {wire126}))) ?
                       $unsigned(($signed($unsigned(reg120)) ?
                           $signed($signed(reg115)) : $signed($signed((8'ha9))))) : wire117);
  assign wire131 = $signed(({$unsigned((reg113 > reg103)),
                           ($unsigned(wire125) ?
                               $unsigned(reg103) : $signed(reg104))} ?
                       (^reg105[(5'h11):(5'h10)]) : $unsigned((!reg104[(1'h1):(1'h1)]))));
  assign wire132 = wire127;
  assign wire133 = (reg112 ?
                       (~$unsigned({$signed(wire132)})) : (+$signed((^(reg120 ?
                           reg109 : reg108)))));
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire47;
  input wire signed [(2'h3):(1'h0)] wire46;
  input wire signed [(4'hd):(1'h0)] wire45;
  input wire [(5'h14):(1'h0)] wire44;
  input wire signed [(2'h2):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire53,
                 wire52,
                 wire49,
                 wire48,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
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
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire48 = $signed($unsigned($signed({wire45[(2'h3):(1'h1)],
                      $unsigned(wire43)})));
  assign wire49 = ($unsigned(((wire47 >>> (^(8'ha7))) ?
                          ((8'ha0) != $unsigned(wire47)) : ($unsigned((8'ha2)) <= wire45[(2'h2):(1'h0)]))) ?
                      (wire45 == (+$signed((wire44 && wire44)))) : $signed($signed(($signed(wire48) >= ((8'ha2) && wire43)))));
  always
    @(posedge clk) begin
      reg50 <= (wire48[(4'h9):(4'h8)] ?
          wire46[(2'h3):(1'h1)] : (^~(wire48 ?
              wire48[(3'h7):(1'h1)] : wire47)));
      reg51 <= wire48;
    end
  assign wire52 = (|$signed($signed($signed(wire47))));
  assign wire53 = wire45[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg54 <= $unsigned(wire45[(3'h6):(3'h6)]);
      if ((~|(|$unsigned($signed(wire47)))))
        begin
          reg55 <= wire47[(4'hf):(4'hf)];
          if (({$unsigned(wire48), (^~(~&(wire48 ? reg51 : reg54)))} ?
              (!({(reg54 ? reg54 : wire49), wire47[(4'he):(4'hb)]} ?
                  (~&((7'h42) * wire52)) : (^~reg50))) : $unsigned($unsigned((wire46 ?
                  (wire49 ? (8'ha7) : (8'ha2)) : (wire53 ? wire44 : wire45))))))
            begin
              reg56 <= (!$unsigned((wire52 ?
                  (^~(8'ha8)) : (wire48 ^~ (wire45 ? reg55 : reg50)))));
              reg57 <= $signed(reg51[(2'h3):(1'h1)]);
              reg58 <= (-reg51);
              reg59 <= reg54;
            end
          else
            begin
              reg56 <= ((-(wire45[(2'h2):(2'h2)] ?
                      $unsigned($signed(wire45)) : $signed((wire45 == reg59)))) ?
                  ($unsigned(wire44[(2'h2):(2'h2)]) == reg56) : $signed(wire53[(2'h3):(2'h3)]));
              reg57 <= (+$signed({(|(^reg59)), wire46}));
              reg58 <= (^$unsigned(reg51[(4'h8):(1'h0)]));
              reg59 <= {(($unsigned($signed(wire49)) ?
                      wire48[(4'ha):(1'h1)] : (~|reg55)) < $signed(wire45[(4'ha):(2'h2)]))};
            end
          reg60 <= $unsigned((((!wire44[(2'h3):(1'h1)]) >> (~&((8'hbf) ?
              reg56 : reg57))) * $unsigned({$signed(wire49),
              (wire48 ? reg55 : reg54)})));
          reg61 <= ($signed((wire49[(1'h0):(1'h0)] <= reg57[(1'h1):(1'h0)])) ?
              wire44 : (-(((reg59 ?
                  reg59 : reg60) ^ reg55) <= wire46[(2'h3):(1'h1)])));
        end
      else
        begin
          reg55 <= (^~((|$unsigned((8'hbe))) > ({(~^reg58)} || ((~|wire53) ?
              wire46[(2'h3):(2'h2)] : $unsigned(wire52)))));
          reg56 <= ((reg57[(2'h2):(1'h0)] <<< wire45[(4'hd):(1'h0)]) << (~^reg55));
          reg57 <= ({$unsigned($signed(reg60[(4'ha):(3'h7)])),
              reg58[(4'ha):(4'h9)]} > $unsigned((&reg55[(4'ha):(4'h8)])));
        end
      if ((wire53[(3'h7):(3'h4)] ? wire48 : $unsigned((^reg50))))
        begin
          reg62 <= $signed($unsigned($unsigned($signed({wire45}))));
          reg63 <= reg60[(2'h3):(1'h0)];
          reg64 <= {$signed((^wire49))};
        end
      else
        begin
          reg62 <= $unsigned((reg50[(3'h4):(2'h2)] & ($unsigned($signed(wire46)) ?
              (wire53[(1'h1):(1'h0)] ?
                  (~reg61) : (wire45 ? (8'ha9) : reg57)) : ((reg54 ?
                      wire45 : wire48) ?
                  $signed((8'hb5)) : $unsigned((8'hb7))))));
          reg63 <= reg54[(1'h0):(1'h0)];
        end
      reg65 <= reg61[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg66 <= ((~&(($signed(reg61) ?
          reg65 : (+reg56)) ^~ wire47)) < $unsigned((!reg50)));
      reg67 <= (!reg60);
      reg68 <= reg63;
    end
  assign wire69 = $unsigned((^~$unsigned(((reg63 ^~ wire47) ?
                      (wire48 ? reg54 : reg68) : $signed(reg68)))));
  assign wire70 = $unsigned(wire46[(2'h3):(2'h2)]);
  assign wire71 = (&(((reg65[(1'h0):(1'h0)] < (8'hb9)) ^ $unsigned(wire47)) ?
                      (&$signed($unsigned(wire43))) : reg67[(1'h1):(1'h1)]));
  assign wire72 = ($unsigned(reg62) ?
                      reg60 : (reg54 ?
                          $unsigned({$unsigned(reg50),
                              (wire53 ^~ reg51)}) : (&reg57)));
  assign wire73 = (-$unsigned(wire69[(4'hd):(4'hc)]));
  assign wire74 = reg63[(3'h6):(1'h0)];
  assign wire75 = (wire43 && $signed($unsigned(wire48[(4'h9):(4'h9)])));
endmodule
