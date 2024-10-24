module top
#(parameter param217 = ((-((~^(8'hab)) > (((8'ha3) ? (8'h9e) : (8'hbd)) ^~ ((8'ha0) ? (8'ha1) : (8'hb8))))) > ((((-(8'hb7)) | ((8'hb4) || (8'hb5))) ? {(^(8'h9e)), (^(8'hb8))} : (-(-(8'hbb)))) == ((~&(~(8'hb7))) ? (((8'hae) << (8'had)) * ((8'hb5) < (8'hab))) : (((8'ha1) * (8'hab)) ^~ (&(8'hb8)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h298):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire216;
  wire [(3'h6):(1'h0)] wire215;
  wire [(5'h13):(1'h0)] wire214;
  wire signed [(5'h10):(1'h0)] wire212;
  wire [(5'h11):(1'h0)] wire211;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire178;
  wire signed [(2'h3):(1'h0)] wire179;
  wire [(5'h15):(1'h0)] wire181;
  wire signed [(2'h3):(1'h0)] wire182;
  wire signed [(2'h2):(1'h0)] wire183;
  wire [(5'h11):(1'h0)] wire184;
  wire [(4'hf):(1'h0)] wire185;
  wire [(3'h6):(1'h0)] wire202;
  wire [(4'hd):(1'h0)] wire203;
  wire signed [(5'h10):(1'h0)] wire204;
  wire [(5'h12):(1'h0)] wire205;
  wire [(4'hc):(1'h0)] wire206;
  wire [(5'h10):(1'h0)] wire208;
  wire signed [(5'h11):(1'h0)] wire209;
  reg signed [(4'he):(1'h0)] reg201 = (1'h0);
  reg [(4'h8):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg198 = (1'h0);
  reg [(5'h11):(1'h0)] reg197 = (1'h0);
  reg [(4'ha):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg195 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg193 = (1'h0);
  reg [(5'h13):(1'h0)] reg192 = (1'h0);
  reg [(4'h8):(1'h0)] reg191 = (1'h0);
  reg [(5'h13):(1'h0)] reg190 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg188 = (1'h0);
  reg [(5'h10):(1'h0)] reg187 = (1'h0);
  reg [(4'hf):(1'h0)] reg186 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire212,
                 wire211,
                 wire5,
                 wire176,
                 wire178,
                 wire179,
                 wire181,
                 wire182,
                 wire183,
                 wire184,
                 wire185,
                 wire202,
                 wire203,
                 wire204,
                 wire205,
                 wire206,
                 wire208,
                 wire209,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
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
  assign wire5 = (($unsigned(wire2[(2'h3):(2'h2)]) + $unsigned(wire1)) ?
                     {(wire3 ?
                             {((8'h9c) ? wire1 : wire4),
                                 $signed(wire0)} : ((~^wire0) & wire1[(1'h0):(1'h0)])),
                         {$unsigned(wire1[(2'h2):(1'h0)])}} : $signed($signed((8'ha3))));
  always
    @(posedge clk) begin
      reg6 <= $signed(wire4);
      reg7 <= wire0[(2'h2):(1'h0)];
      if ($signed(wire3))
        begin
          if ($unsigned($signed($signed(reg6))))
            begin
              reg8 <= wire0[(5'h14):(1'h1)];
              reg9 <= $unsigned((~&(wire2 ?
                  ((wire5 ? reg7 : wire5) ? wire0 : $signed(wire0)) : wire1)));
            end
          else
            begin
              reg8 <= $signed({({(^reg8)} != wire4[(2'h2):(1'h0)])});
              reg9 <= $unsigned((reg9 > wire4));
              reg10 <= {$signed($signed((wire2 ?
                      wire5[(3'h4):(1'h1)] : (-wire0))))};
            end
          if (reg9[(4'hf):(3'h6)])
            begin
              reg11 <= $signed($unsigned(reg6[(3'h4):(1'h0)]));
            end
          else
            begin
              reg11 <= $unsigned(reg11);
              reg12 <= $unsigned(((~wire3) ?
                  (^(wire2 ?
                      wire0[(5'h11):(4'he)] : (^wire4))) : $unsigned((+(reg9 ?
                      wire3 : wire5)))));
              reg13 <= (-$signed(((8'hb2) ? reg9 : (~&$signed(wire4)))));
            end
          if ($unsigned((reg13 >> {{{reg6, reg12}, wire1[(1'h0):(1'h0)]}})))
            begin
              reg14 <= $signed((~|$unsigned(wire3[(4'he):(3'h4)])));
            end
          else
            begin
              reg14 <= ($unsigned(wire4[(4'h9):(3'h6)]) << (reg8 | $unsigned($unsigned($unsigned(wire5)))));
              reg15 <= {reg9,
                  $signed((^~({reg8, (8'hb3)} <= {reg6, (7'h44)})))};
            end
          reg16 <= (+wire3[(3'h7):(3'h7)]);
        end
      else
        begin
          reg8 <= reg10;
          if ($unsigned($unsigned((($unsigned((8'haf)) ^ $signed(reg14)) ?
              ($unsigned(reg15) != (8'hab)) : $signed((reg15 ?
                  wire4 : wire0))))))
            begin
              reg9 <= {$signed(reg11), reg8[(1'h0):(1'h0)]};
              reg10 <= $signed($unsigned($unsigned(((reg15 ?
                  reg11 : reg14) || wire0[(4'h9):(3'h5)]))));
              reg11 <= $unsigned(wire5);
              reg12 <= ($unsigned((~&wire4)) ?
                  $signed(reg16) : $unsigned((!$signed(reg16))));
            end
          else
            begin
              reg9 <= reg10;
              reg10 <= $signed((reg15[(1'h0):(1'h0)] ?
                  $signed(reg14[(3'h5):(1'h1)]) : $unsigned(wire3[(2'h3):(2'h3)])));
              reg11 <= ($unsigned(wire2) ?
                  reg6 : $unsigned(reg15[(3'h7):(3'h6)]));
            end
        end
    end
  module17 #() modinst177 (wire176, clk, reg6, wire2, wire3, reg13, reg8);
  assign wire178 = reg10[(4'he):(3'h4)];
  module17 #() modinst180 (.wire20(wire176), .clk(clk), .y(wire179), .wire18(reg14), .wire21(reg13), .wire22(wire0), .wire19(reg15));
  assign wire181 = (reg15 > (~&$unsigned((8'hab))));
  assign wire182 = reg7;
  assign wire183 = $unsigned(reg13[(4'hf):(3'h7)]);
  assign wire184 = (~$unsigned(reg7));
  assign wire185 = reg7[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      if (wire184)
        begin
          reg186 <= (&$signed(reg10));
          if ((~&(~^{(~^(wire5 ? reg186 : wire3)),
              ((wire2 ^ wire184) ~^ wire176)})))
            begin
              reg187 <= (^~{wire176,
                  (~&({reg8, wire183} * ((8'hb8) >= (7'h40))))});
              reg188 <= ($signed($unsigned({wire183[(1'h1):(1'h0)]})) > $signed((8'ha4)));
            end
          else
            begin
              reg187 <= (~^$signed((($signed(wire0) >> reg8) <<< (+(reg11 << wire176)))));
            end
          reg189 <= reg7[(4'h8):(3'h4)];
          reg190 <= $unsigned(wire0);
        end
      else
        begin
          reg186 <= (8'hbc);
          reg187 <= ($unsigned(reg12[(2'h2):(1'h0)]) ^ ($signed((((8'hb4) ?
                  reg15 : wire176) >= wire2[(3'h5):(3'h5)])) ?
              $signed(($signed(reg189) ?
                  reg6[(3'h7):(3'h4)] : $unsigned((8'hae)))) : reg15[(3'h7):(3'h6)]));
        end
      if ($signed(wire183))
        begin
          reg191 <= $signed((($signed((reg186 ? wire178 : (8'haa))) ?
              $signed(((8'h9f) ? wire185 : reg186)) : ($unsigned(wire185) ?
                  {wire176} : reg7)) ^ (8'h9f)));
          reg192 <= $signed($signed(reg188));
          reg193 <= wire178;
          reg194 <= ((reg10 >>> {wire5[(3'h4):(2'h3)]}) ~^ $unsigned((($unsigned(wire182) ?
                  (wire2 ? reg9 : wire179) : (wire181 ? wire4 : wire0)) ?
              $signed(reg12) : $unsigned($signed(wire185)))));
        end
      else
        begin
          if (wire3[(4'hc):(4'ha)])
            begin
              reg191 <= $unsigned(reg16);
              reg192 <= {(reg15[(3'h4):(1'h0)] >>> $unsigned($unsigned(wire5)))};
              reg193 <= ({((+reg16) ? wire185 : reg186[(4'hb):(3'h7)]),
                      $signed($signed(reg193[(4'hf):(4'hc)]))} ?
                  $signed((-(((8'ha5) ? reg14 : (8'hab)) ?
                      ((8'hb6) ?
                          reg190 : wire176) : (~&wire5)))) : {$signed($unsigned((wire184 ?
                          (8'h9d) : reg192)))});
              reg194 <= ($unsigned(wire176) ?
                  (((^~(wire182 ? reg194 : wire4)) || ($unsigned(wire179) ?
                      reg8 : (reg188 & wire185))) & $unsigned($unsigned({reg8}))) : wire2);
            end
          else
            begin
              reg191 <= reg192[(3'h5):(3'h4)];
              reg192 <= reg11[(4'hb):(3'h6)];
              reg193 <= ((~|(~|((^reg194) * (-reg6)))) < {{{(wire2 ?
                              wire0 : reg12)}}});
              reg194 <= {($signed({(reg192 ? wire184 : reg10), (!reg14)}) ?
                      (-(reg187[(4'hf):(4'hc)] ?
                          reg15[(3'h6):(1'h1)] : (reg192 + reg10))) : $signed(($unsigned(reg7) ^~ wire2)))};
            end
          reg195 <= ($unsigned(($unsigned((+reg12)) ?
                  ((8'hb7) ^~ reg6[(3'h7):(3'h7)]) : wire182)) ?
              reg194 : wire2);
          if (((+(8'hb0)) ^~ wire3))
            begin
              reg196 <= (reg190[(4'ha):(4'ha)] ?
                  reg189 : $signed({$unsigned((reg186 ? reg189 : reg6))}));
              reg197 <= ((({(-wire179)} != {((8'ha5) ? reg8 : (8'hae)),
                      (reg186 ? wire2 : wire181)}) ?
                  {($unsigned(reg10) ?
                          reg196 : (reg190 & (8'ha1)))} : (wire3 ^ wire3)) & wire176);
              reg198 <= $unsigned(({reg8[(4'hd):(1'h0)]} >> (|$signed((wire181 || wire178)))));
              reg199 <= ((wire181 && ($unsigned((~^wire178)) ?
                  (((8'ha4) ? reg186 : reg8) ?
                      wire1 : $signed((7'h43))) : reg7)) ^~ $unsigned({((|(8'hb2)) || $signed((8'hac)))}));
              reg200 <= reg11;
            end
          else
            begin
              reg196 <= ({{$unsigned((reg189 + reg190)), $signed({wire4})},
                  {$unsigned($unsigned((8'ha8)))}} - $signed($unsigned(wire5[(2'h2):(1'h0)])));
            end
          reg201 <= $signed($unsigned($signed($unsigned((~(8'ha9))))));
        end
    end
  assign wire202 = $signed($signed(wire183));
  assign wire203 = (wire179 ?
                       ($unsigned($signed((reg200 ^ reg12))) - ({(wire2 + reg191)} ?
                           wire182[(2'h3):(2'h3)] : ({reg201} ?
                               (reg193 ^ (8'ha7)) : $unsigned((8'hbe))))) : (reg187[(3'h6):(1'h1)] ?
                           $unsigned(reg14) : wire176[(4'h9):(3'h7)]));
  assign wire204 = {(-{$signed(reg192)}),
                       ((~(reg10 ? (8'hb6) : $signed(reg196))) ?
                           $signed((reg16 ?
                               (reg196 ?
                                   wire183 : reg194) : (reg6 ~^ reg197))) : $unsigned($unsigned($unsigned(reg9))))};
  assign wire205 = $unsigned((reg186 * $unsigned(wire176[(4'hf):(4'hc)])));
  module101 #() modinst207 (wire206, clk, reg186, reg201, reg196, reg190, reg192);
  assign wire208 = (^~{((!(reg190 <= wire203)) <= ({reg14} | reg194[(3'h5):(1'h1)]))});
  module46 #() modinst210 (wire209, clk, wire181, reg192, reg8, reg14, reg16);
  assign wire211 = $unsigned(reg9[(3'h6):(3'h4)]);
  module46 #() modinst213 (wire212, clk, reg186, reg6, reg190, wire1, wire0);
  assign wire214 = $unsigned($signed(reg8[(5'h12):(4'hd)]));
  assign wire215 = reg14;
  assign wire216 = {{(^$signed((+reg201)))}};
endmodule

module module17
#(parameter param175 = ((((8'hac) || (((8'hb3) & (8'hbf)) ? (|(8'hab)) : (^~(8'h9d)))) ? (+((8'h9f) ? ((8'hbb) << (8'haa)) : (8'hab))) : (!({(7'h42), (8'hb6)} << ((8'ha8) >> (8'hbf))))) >> (({((8'h9e) >> (8'hb6)), {(8'hb6)}} ? (((8'h9f) >= (8'ha1)) & ((7'h41) == (8'hb0))) : ((~(8'h9e)) ? ((8'ha7) ? (8'hb2) : (8'hb5)) : (~(8'hb0)))) ? (~|(((8'ha8) << (8'hba)) ? (&(8'hbf)) : ((8'hae) ? (8'ha8) : (8'ha5)))) : ((((8'haf) + (8'hb5)) - (~|(8'haf))) != (|(~^(8'hb7)))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire174;
  wire [(2'h2):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire148;
  wire [(3'h4):(1'h0)] wire142;
  wire [(5'h10):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire172;
  reg signed [(2'h2):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  assign y = {wire174,
                 wire170,
                 wire148,
                 wire142,
                 wire97,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire44,
                 wire23,
                 wire66,
                 wire135,
                 wire172,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire23 = ($unsigned(wire21) < (($unsigned($unsigned(wire20)) ?
                          {wire21[(1'h0):(1'h0)]} : $unsigned((|wire20))) ?
                      {$signed(wire21)} : ((&wire18[(2'h2):(2'h2)]) ?
                          {(wire22 ~^ wire18), {wire18}} : ($signed(wire18) ?
                              wire20[(1'h0):(1'h0)] : wire19[(1'h0):(1'h0)]))));
  module24 #() modinst45 (wire44, clk, wire19, wire23, wire20, wire22, wire21);
  module46 #() modinst67 (.wire50(wire18), .clk(clk), .y(wire66), .wire48(wire23), .wire51(wire22), .wire49(wire19), .wire47(wire21));
  assign wire68 = {(|(~^$unsigned(wire22[(5'h11):(3'h4)]))),
                      $signed((~&(!(wire66 ? wire66 : (8'haa)))))};
  assign wire69 = wire19[(4'hc):(2'h3)];
  assign wire70 = wire66;
  assign wire71 = wire44[(1'h1):(1'h1)];
  assign wire72 = {((~($signed((8'hab)) ? (8'hbe) : $unsigned(wire23))) ?
                          wire19[(3'h4):(2'h2)] : (-(^(wire20 ^~ (8'hb8))))),
                      $unsigned(wire69[(4'hc):(4'ha)])};
  assign wire73 = wire19;
  assign wire74 = $signed($signed({(^wire19)}));
  module75 #() modinst98 (.wire79(wire74), .wire80(wire68), .y(wire97), .wire76(wire21), .wire78(wire18), .clk(clk), .wire77(wire19));
  always
    @(posedge clk) begin
      reg99 <= $unsigned($unsigned((^wire70[(4'h8):(3'h7)])));
      reg100 <= (+((8'h9f) ?
          $signed($unsigned($signed(wire70))) : ({((8'haa) ?
                  wire44 : wire44)} ^~ $unsigned(wire19[(1'h0):(1'h0)]))));
    end
  module101 #() modinst136 (.y(wire135), .wire103(wire18), .clk(clk), .wire106(wire69), .wire102(wire74), .wire105(wire44), .wire104(wire71));
  always
    @(posedge clk) begin
      if (wire18[(3'h6):(2'h3)])
        begin
          reg137 <= ($signed({$unsigned($unsigned(wire68))}) - $unsigned(wire21[(5'h12):(3'h5)]));
          reg138 <= $signed((!$unsigned($signed($unsigned(wire22)))));
          reg139 <= $signed((wire68[(1'h1):(1'h0)] + wire23));
          reg140 <= reg139;
          reg141 <= (!$unsigned(({wire22[(4'hc):(4'ha)]} ^~ wire20)));
        end
      else
        begin
          reg137 <= wire68;
          reg138 <= wire69[(5'h11):(2'h2)];
          if ((!wire21))
            begin
              reg139 <= (~wire22);
            end
          else
            begin
              reg139 <= $signed($signed(reg141));
              reg140 <= (~&{$unsigned(wire97)});
            end
        end
    end
  assign wire142 = (~|(($unsigned((!wire97)) ?
                       (|reg141) : wire73[(5'h13):(4'he)]) && wire44));
  always
    @(posedge clk) begin
      reg143 <= (($unsigned($signed(wire21)) * (($signed(wire19) ?
              $unsigned(reg138) : (wire68 <<< wire70)) | $unsigned((~wire66)))) ?
          reg140[(3'h4):(2'h3)] : (~|wire142[(3'h4):(2'h3)]));
      reg144 <= ((!($signed($unsigned(wire73)) || {(wire44 >>> wire44),
          $signed(wire135)})) * $unsigned(wire20));
      reg145 <= $signed(wire23[(3'h4):(3'h4)]);
      reg146 <= $unsigned(reg144);
      reg147 <= $signed($unsigned(reg143[(1'h0):(1'h0)]));
    end
  assign wire148 = {({(~|(reg139 ? wire73 : (8'hac)))} | $signed((8'ha1))),
                       wire21[(1'h1):(1'h1)]};
  module149 #() modinst171 (wire170, clk, reg137, reg145, wire74, wire21, wire148);
  module149 #() modinst173 (.wire150(reg138), .wire153(wire74), .clk(clk), .wire152(wire68), .wire154(wire19), .wire151(reg140), .y(wire172));
  assign wire174 = $signed({(reg139[(2'h3):(1'h0)] + reg137)});
endmodule

module module149  (y, clk, wire154, wire153, wire152, wire151, wire150);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire154;
  input wire [(2'h2):(1'h0)] wire153;
  input wire [(2'h3):(1'h0)] wire152;
  input wire signed [(4'h9):(1'h0)] wire151;
  input wire [(5'h12):(1'h0)] wire150;
  wire [(2'h3):(1'h0)] wire169;
  wire signed [(2'h2):(1'h0)] wire168;
  wire [(5'h12):(1'h0)] wire167;
  wire signed [(3'h5):(1'h0)] wire166;
  wire signed [(3'h5):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire164;
  wire [(4'hc):(1'h0)] wire163;
  wire signed [(3'h7):(1'h0)] wire162;
  wire signed [(5'h12):(1'h0)] wire161;
  wire signed [(3'h7):(1'h0)] wire160;
  wire signed [(3'h4):(1'h0)] wire159;
  wire signed [(3'h7):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire155;
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire156,
                 wire155,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire155 = wire152;
  assign wire156 = ((^~{(-$signed(wire153)),
                       (8'h9f)}) ^~ wire150[(4'hf):(4'he)]);
  always
    @(posedge clk) begin
      reg157 <= (wire150[(4'he):(1'h0)] >= (wire150[(4'he):(3'h4)] <= (wire153[(1'h0):(1'h0)] ?
          (|(wire156 ? wire150 : wire156)) : ((wire153 >>> wire150) <= {wire154,
              wire153}))));
      reg158 <= (wire153[(1'h1):(1'h0)] ?
          (((&$signed(wire153)) > {$unsigned(wire150)}) ?
              (wire154[(4'hc):(2'h3)] ^~ (^~(~&wire154))) : $unsigned($unsigned(wire150[(3'h4):(2'h3)]))) : (|(({wire152} >>> (wire153 ^ wire150)) ?
              wire156[(3'h4):(3'h4)] : $signed((wire150 ? wire154 : reg157)))));
    end
  assign wire159 = {wire151[(2'h3):(1'h1)], wire152};
  assign wire160 = ((((^~$unsigned(wire154)) ?
                       reg158[(4'he):(4'he)] : $unsigned((wire159 ?
                           reg157 : wire153))) >> ($unsigned($unsigned(wire152)) * wire155)) <= {(^~reg157)});
  assign wire161 = $signed(wire160);
  assign wire162 = wire154;
  assign wire163 = (($signed((+reg157)) && reg157[(3'h4):(2'h3)]) >= (8'ha1));
  assign wire164 = (|(^reg158));
  assign wire165 = (~&$unsigned(wire154[(2'h2):(1'h0)]));
  assign wire166 = (-reg158);
  assign wire167 = wire162;
  assign wire168 = (wire152[(1'h1):(1'h0)] ~^ $unsigned(({$unsigned(wire159)} * $unsigned((wire166 != wire166)))));
  assign wire169 = (|((wire165 ?
                           {(~wire164)} : ($signed(wire155) || (wire164 ?
                               wire164 : wire155))) ?
                       $signed($unsigned($signed(wire153))) : $signed(wire162)));
endmodule

module module101
#(parameter param133 = (8'ha1), 
parameter param134 = ((param133 ^ (&((~^(8'ha5)) || ((8'hbe) ^~ param133)))) & ((((param133 ? param133 : param133) != param133) < {{param133}, (param133 ? param133 : (8'hab))}) ? ((~|param133) | param133) : (((^~param133) & (param133 << (8'hb6))) ? (~|((8'ha5) - (7'h43))) : param133))))
(y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire106;
  input wire [(4'he):(1'h0)] wire105;
  input wire signed [(3'h5):(1'h0)] wire104;
  input wire [(5'h13):(1'h0)] wire103;
  input wire signed [(4'hf):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire128;
  wire [(2'h2):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire113;
  wire [(5'h14):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(3'h6):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire107;
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire107 = wire105[(1'h1):(1'h1)];
  assign wire108 = (~&$signed((~^wire106[(2'h2):(2'h2)])));
  assign wire109 = {(|((wire106 ?
                               $signed(wire108) : (wire108 ?
                                   wire102 : wire105)) ?
                           (^$signed(wire103)) : (~|(~wire104)))),
                       wire108[(2'h3):(1'h0)]};
  assign wire110 = (($unsigned($signed(wire104)) * ((wire103[(5'h11):(4'hc)] <= wire104) ?
                       ((wire107 > (8'hbe)) + (wire102 * (8'hb3))) : wire108)) >= wire107[(5'h12):(2'h3)]);
  assign wire111 = wire106[(1'h0):(1'h0)];
  assign wire112 = ($signed(((+{wire105}) ?
                           ((wire103 ? wire106 : wire102) ?
                               $signed(wire103) : wire110[(3'h4):(1'h1)]) : (8'hbb))) ?
                       (wire105[(2'h2):(1'h0)] << (+$unsigned((wire107 ?
                           wire105 : wire104)))) : wire110[(1'h0):(1'h0)]);
  assign wire113 = (+$unsigned($signed($unsigned(wire106[(1'h1):(1'h1)]))));
  assign wire114 = wire111[(4'hc):(2'h3)];
  assign wire115 = wire113[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg116 <= (($signed((~(wire108 ? wire110 : wire102))) == ({wire103,
          wire106[(1'h1):(1'h0)]} <= wire114)) | (+$unsigned($unsigned(((8'ha9) > wire102)))));
      reg117 <= (reg116[(1'h1):(1'h0)] ?
          $unsigned($unsigned((((8'hb0) ?
              wire109 : wire104) != (^wire104)))) : wire115[(1'h0):(1'h0)]);
      reg118 <= $signed(($signed($unsigned($unsigned(wire111))) ?
          wire114 : ($unsigned(wire107) ^~ reg116[(3'h5):(1'h0)])));
      if ((wire113 ?
          {$signed((^~wire104[(3'h4):(2'h2)]))} : $signed(((-$unsigned(wire112)) ?
              $signed((wire103 ? wire108 : wire112)) : (^(wire104 ?
                  wire107 : reg116))))))
        begin
          reg119 <= $signed($unsigned($signed($signed((wire104 - wire113)))));
          if ((~&({{(wire115 ^~ (8'h9e)), (~|wire111)}} ?
              (wire112 - (!wire103)) : (wire103[(4'ha):(2'h2)] - wire104))))
            begin
              reg120 <= (~^$unsigned($unsigned(reg118)));
              reg121 <= (~|(wire115[(2'h2):(1'h0)] ?
                  $signed($signed(wire114[(3'h5):(2'h3)])) : (($signed((8'hb4)) ?
                          (~wire114) : (wire106 == wire108)) ?
                      (|(reg120 ? wire110 : (7'h40))) : $signed((!wire106)))));
              reg122 <= $unsigned({{(~^$unsigned(wire109)),
                      (~(wire109 << wire107))},
                  (wire110[(2'h2):(1'h1)] < wire111[(4'h9):(1'h1)])});
              reg123 <= {(&(-wire106[(1'h0):(1'h0)]))};
              reg124 <= wire108[(1'h1):(1'h0)];
            end
          else
            begin
              reg120 <= (&((^~({wire104, wire109} ?
                      wire111 : $signed((8'haa)))) ?
                  wire102 : $unsigned(reg119)));
              reg121 <= $signed((-(8'hbc)));
              reg122 <= (wire108[(2'h2):(2'h2)] >> (+($signed(((8'hb0) * reg116)) ?
                  ((wire102 >= wire102) && (wire110 >= wire106)) : ((wire107 ?
                          wire103 : wire112) ?
                      ((8'hbb) <= wire112) : reg121))));
              reg123 <= reg119[(4'ha):(2'h3)];
            end
          reg125 <= (reg121[(3'h4):(3'h4)] ~^ {(!$signed({reg120, wire102})),
              reg121[(3'h4):(2'h2)]});
          reg126 <= {$unsigned((reg119[(3'h6):(1'h0)] ?
                  ((wire102 ? wire104 : reg121) ?
                      reg117 : $unsigned(reg124)) : ((reg125 == wire109) << wire104))),
              $signed($signed(wire102[(4'hd):(4'h9)]))};
        end
      else
        begin
          reg119 <= wire105;
          reg120 <= ($signed(((~$unsigned(wire104)) ?
              {((8'had) ? wire109 : reg117),
                  $unsigned((8'ha8))} : $signed(wire107[(4'ha):(3'h7)]))) ^~ {($unsigned((^wire115)) ?
                  ($signed(wire115) > $signed(wire113)) : $unsigned(((8'hbe) - wire103))),
              reg119});
          reg121 <= wire104;
          reg122 <= $unsigned((|reg117[(3'h7):(3'h6)]));
        end
      reg127 <= wire104;
    end
  assign wire128 = $unsigned($signed(({wire105, (-wire111)} ^ reg126)));
  assign wire129 = (wire110[(3'h4):(1'h0)] ?
                       {$signed($signed($unsigned(reg122))),
                           ({wire106[(2'h2):(2'h2)], {reg118, reg123}} ?
                               (~(^(8'ha0))) : wire115[(2'h2):(1'h0)])} : ({$signed(wire106)} >>> {(!$unsigned(wire112)),
                           {(wire110 < wire110)}}));
  assign wire130 = $signed((wire108[(1'h1):(1'h0)] ?
                       (^~{(^~reg123)}) : reg122[(1'h0):(1'h0)]));
  assign wire131 = (((reg126 ?
                               ({wire106} ?
                                   $signed(reg120) : (reg122 >= wire113)) : (7'h44)) ?
                           $signed($unsigned(wire102[(4'he):(4'hc)])) : reg118[(3'h5):(2'h3)]) ?
                       (~^$signed((!$unsigned(reg125)))) : (!(wire114 ?
                           (8'hb5) : {reg119[(4'h8):(3'h4)],
                               $signed(reg116)})));
  assign wire132 = ((~&$unsigned((reg117[(4'hf):(4'ha)] ^~ (~wire131)))) == wire129);
endmodule

module module75  (y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire80;
  input wire [(4'he):(1'h0)] wire79;
  input wire [(4'h9):(1'h0)] wire78;
  input wire [(5'h10):(1'h0)] wire77;
  input wire [(5'h14):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire81;
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire81,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire81 = wire77[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      if ((wire78 >> wire79))
        begin
          reg82 <= {(~(wire81[(3'h7):(3'h4)] || wire78)),
              ($signed($unsigned({wire81, wire78})) ?
                  ({wire78} ?
                      (&wire81[(2'h2):(2'h2)]) : (8'hb5)) : $unsigned(wire77))};
          if ($signed((-wire77[(5'h10):(3'h5)])))
            begin
              reg83 <= $unsigned($signed(($unsigned((wire77 ?
                      wire80 : wire81)) ?
                  wire77[(4'h8):(3'h6)] : wire81)));
              reg84 <= $signed($unsigned(wire78));
              reg85 <= wire79[(3'h7):(3'h5)];
              reg86 <= reg82[(2'h3):(2'h3)];
              reg87 <= wire79[(4'h9):(4'h8)];
            end
          else
            begin
              reg83 <= {wire80, ({reg84} >= $unsigned(wire77[(4'hc):(3'h6)]))};
            end
        end
      else
        begin
          if (reg84)
            begin
              reg82 <= reg83;
            end
          else
            begin
              reg82 <= (7'h43);
              reg83 <= reg86;
              reg84 <= reg82;
            end
          reg85 <= ($signed($signed(reg87)) ?
              wire81[(5'h13):(5'h13)] : reg86[(2'h2):(2'h2)]);
          reg86 <= $signed($signed(reg86[(2'h2):(1'h1)]));
          reg87 <= ((((8'hb2) >>> wire77[(4'he):(4'hc)]) * {wire81}) - $signed(reg82));
        end
      reg88 <= reg86[(1'h0):(1'h0)];
      reg89 <= (8'hb3);
      reg90 <= {(8'hac), $signed((^~reg82[(2'h3):(2'h3)]))};
    end
  assign wire91 = ($signed(wire80[(4'hb):(2'h3)]) ?
                      wire77[(4'h8):(1'h1)] : reg86);
  assign wire92 = {wire77};
  assign wire93 = ($unsigned((($signed(reg82) ?
                          (reg90 >> reg89) : $unsigned(wire76)) ?
                      $unsigned({(8'haf)}) : reg87[(3'h4):(2'h2)])) - (8'ha2));
  assign wire94 = wire78;
  assign wire95 = ((wire78 ? wire91 : reg90[(4'hb):(3'h6)]) ?
                      (|(~^($signed(wire92) <<< wire81))) : reg90[(1'h0):(1'h0)]);
  assign wire96 = $signed(wire94);
endmodule

module module46
#(parameter param65 = (((((~|(8'haa)) <= {(8'ha1), (8'hb1)}) ? (((8'hba) ^~ (8'hb2)) ? (^(8'hbd)) : (!(8'ha1))) : (((7'h44) >> (8'hb4)) - ((8'ha5) ? (8'haa) : (7'h42)))) ? (~(-(~|(8'ha4)))) : (-((~(7'h42)) || (|(8'ha2))))) != (+{(((7'h41) < (8'hb9)) << (~&(8'hb8)))})))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire51;
  input wire signed [(5'h13):(1'h0)] wire50;
  input wire [(4'hd):(1'h0)] wire49;
  input wire signed [(3'h4):(1'h0)] wire48;
  input wire signed [(5'h15):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg56,
                 (1'h0)};
  assign wire52 = $unsigned(wire50);
  assign wire53 = (~|$signed(wire49[(4'h8):(1'h0)]));
  assign wire54 = ((wire51[(4'hc):(2'h2)] * wire51) == {(-$unsigned($unsigned(wire47)))});
  assign wire55 = (wire47 || $signed(wire52));
  always
    @(posedge clk) begin
      reg56 <= ({wire54} ?
          wire47 : (|(wire48 ?
              (wire55[(4'h9):(3'h7)] ?
                  (~wire47) : wire54) : $signed((-wire54)))));
    end
  assign wire57 = wire48;
  assign wire58 = (wire54[(4'ha):(3'h5)] & wire53);
  assign wire59 = ($signed((7'h43)) <<< $unsigned(((8'hb8) ~^ {$unsigned(wire52),
                      $unsigned(reg56)})));
  assign wire60 = $signed((((8'h9c) != (-(~|wire57))) << wire55[(3'h7):(3'h7)]));
  assign wire61 = $unsigned((~|(((!wire49) < $signed(wire50)) ?
                      $signed({wire53}) : ($unsigned(reg56) ?
                          ((8'ha6) ?
                              wire52 : wire55) : wire54[(4'hc):(4'hb)]))));
  assign wire62 = (wire61 ? ((+wire53) && wire50) : $signed(wire48));
  assign wire63 = $unsigned({($signed(wire57[(3'h4):(2'h3)]) ?
                          wire50[(4'hb):(4'h8)] : wire48[(2'h2):(1'h1)]),
                      reg56});
  assign wire64 = $unsigned((^$unsigned((|(wire52 ? (8'hbb) : wire53)))));
endmodule

module module24
#(parameter param42 = ((({((7'h43) ? (8'hae) : (8'hb9)), ((7'h44) ~^ (8'ha6))} < (((8'h9d) || (8'ha7)) ? ((8'hbc) ^ (8'h9d)) : ((8'hbe) ? (8'hb5) : (8'haf)))) * {(~&((8'hb9) << (8'ha5))), ({(8'hb5), (8'h9e)} ? ((8'hb3) ? (7'h44) : (7'h44)) : {(8'haa)})}) ? {((((8'ha8) > (7'h42)) & (~&(8'hb6))) ? (((8'hb0) * (8'ha2)) ? {(8'hb8), (8'hb8)} : ((7'h41) <= (8'hb4))) : (8'hac))} : (!(((8'ha0) ? ((8'hb0) ? (8'hbe) : (8'haa)) : ((8'haf) >>> (8'hae))) ? (~((8'hb0) * (8'ha5))) : (~((7'h44) ? (8'hb3) : (8'hbf)))))), 
parameter param43 = ((~|((8'ha0) ? (!param42) : ((&param42) - (param42 ~^ param42)))) ? (-(8'haf)) : ((((~|(8'hb1)) >>> (-param42)) >= (param42 ? (~|param42) : (~|param42))) ? param42 : ({(param42 == param42), param42} ? (~|param42) : ((param42 ? param42 : param42) > (~&param42))))))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire signed [(3'h4):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire27;
  input wire [(5'h14):(1'h0)] wire26;
  input wire signed [(2'h3):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire30;
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire30,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire30 = $signed(wire25);
  always
    @(posedge clk) begin
      reg31 <= $signed(((wire30 ?
          (~^(|wire26)) : wire26[(3'h6):(1'h0)]) << $unsigned(wire28)));
      reg32 <= {{((8'ha8) >> $unsigned($unsigned(reg31))), $signed(wire29)}};
      reg33 <= (reg32 ?
          $signed(($signed(wire27) ?
              ((~wire27) ?
                  $unsigned(wire26) : (wire30 ?
                      wire26 : wire29)) : wire26)) : wire29[(2'h2):(2'h2)]);
      reg34 <= (~&$signed({($unsigned(reg32) ?
              (wire26 ? wire25 : wire26) : (+reg31))}));
    end
  always
    @(posedge clk) begin
      reg35 <= (~^wire28[(1'h1):(1'h1)]);
      reg36 <= (wire25 ~^ reg34[(3'h7):(3'h7)]);
      reg37 <= ({$signed(reg34[(3'h6):(3'h4)])} == (&reg34[(4'h9):(3'h4)]));
      reg38 <= $unsigned($unsigned(wire26));
      if ($signed(reg32[(2'h3):(1'h1)]))
        begin
          reg39 <= (~&(reg34 ? $unsigned(wire26[(5'h10):(3'h6)]) : reg38));
        end
      else
        begin
          reg39 <= (^~(~&reg34));
        end
    end
  assign wire40 = (((8'haa) ?
                      {{reg38[(4'h8):(3'h6)]}} : reg35[(1'h0):(1'h0)]) & {wire29});
  assign wire41 = reg35;
endmodule
