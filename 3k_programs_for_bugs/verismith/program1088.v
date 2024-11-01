module top #(parameter param226 = (8'hb4)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire225;
  wire [(4'h8):(1'h0)] wire224;
  wire [(2'h3):(1'h0)] wire223;
  wire signed [(5'h15):(1'h0)] wire221;
  wire [(4'hd):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire219;
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  assign y = {wire225,
                 wire224,
                 wire223,
                 wire221,
                 wire61,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire63,
                 wire64,
                 wire68,
                 wire219,
                 reg4,
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
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
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
                 reg46,
                 reg47,
                 reg65,
                 reg66,
                 reg67,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (-(8'h9c));
      reg5 <= ($signed((wire0[(3'h7):(2'h3)] ?
              (~|$unsigned((8'ha6))) : ({wire1, wire0} ?
                  reg4[(1'h1):(1'h0)] : $unsigned(reg4)))) ?
          ((8'ha7) ?
              {$signed($unsigned((8'ha8))),
                  {(wire2 ?
                          wire0 : reg4)}} : $signed((^~wire1[(4'he):(3'h5)]))) : (8'ha5));
      reg6 <= reg4[(1'h1):(1'h0)];
      reg7 <= $signed(reg4[(1'h0):(1'h0)]);
      reg8 <= reg6[(4'h8):(1'h1)];
    end
  always
    @(posedge clk) begin
      if (wire2)
        begin
          if (({$signed({reg8[(1'h1):(1'h1)], reg8})} ?
              $unsigned(((~&$unsigned(wire2)) ^ ({reg7} ?
                  (wire1 ? wire1 : (8'hba)) : ((8'h9c) ?
                      reg4 : (8'hbc))))) : (wire3 ?
                  (~^reg5) : {reg5, $unsigned($signed(reg5))})))
            begin
              reg9 <= $unsigned((8'hbd));
              reg10 <= (&wire3[(4'hf):(4'h9)]);
              reg11 <= ($unsigned(wire3) ?
                  wire2[(1'h1):(1'h1)] : (|{reg9[(2'h3):(2'h2)], reg9}));
              reg12 <= (reg6 ?
                  $signed(reg5) : (&($unsigned((reg5 ? wire2 : wire1)) ?
                      $signed((^~reg4)) : {(reg10 | wire2)})));
            end
          else
            begin
              reg9 <= (~^$unsigned({reg7, {$signed(reg7)}}));
              reg10 <= $unsigned(reg12[(2'h2):(1'h1)]);
              reg11 <= ((!((wire2[(1'h1):(1'h1)] << (^reg9)) ~^ (~reg10))) ?
                  ($unsigned(reg11[(4'h9):(3'h6)]) << $signed(wire3)) : reg11[(3'h6):(2'h2)]);
              reg12 <= (reg11 ?
                  {reg9,
                      {(^~$signed((8'hbe)))}} : $signed(wire0[(4'hc):(4'hb)]));
            end
          reg13 <= (reg7[(4'h9):(1'h0)] ? reg7 : wire2);
          reg14 <= $unsigned($signed(reg6[(3'h4):(1'h0)]));
          if (($unsigned((-(&reg4[(2'h2):(2'h2)]))) ?
              ((((-reg11) ? reg13 : $signed(wire1)) ?
                      {$signed(reg13)} : (~^(+(8'hb2)))) ?
                  $unsigned($signed((-reg13))) : $signed({$unsigned(reg14)})) : $unsigned(reg6[(2'h2):(2'h2)])))
            begin
              reg15 <= ($unsigned($signed(($unsigned(reg11) | reg6))) ?
                  (wire3[(4'hb):(1'h1)] ?
                      ($signed(reg11[(4'hd):(4'hd)]) * (!reg10)) : $signed((-(wire1 <<< reg6)))) : $unsigned(reg13));
              reg16 <= (&(&reg8[(2'h3):(1'h1)]));
            end
          else
            begin
              reg15 <= {reg13[(4'ha):(4'h9)], wire1};
              reg16 <= reg9;
              reg17 <= wire0[(1'h0):(1'h0)];
              reg18 <= reg16[(3'h6):(3'h5)];
              reg19 <= (($signed(reg4[(2'h2):(1'h1)]) > wire1[(2'h2):(2'h2)]) && (8'h9e));
            end
          reg20 <= reg13[(3'h4):(1'h1)];
        end
      else
        begin
          reg9 <= {(+reg20)};
          reg10 <= reg16[(3'h4):(3'h4)];
        end
      if (reg14[(1'h0):(1'h0)])
        begin
          if ((~^(($signed(wire3) ?
              reg7[(1'h0):(1'h0)] : $unsigned(reg13[(4'hb):(3'h5)])) ^~ {($unsigned(reg9) << {reg19,
                  wire2})})))
            begin
              reg21 <= ($unsigned($unsigned(((~^reg4) ?
                      (wire0 << reg7) : $signed(wire2)))) ?
                  (((reg13[(4'h8):(3'h5)] + $signed(reg5)) <<< $unsigned({wire1,
                          (8'ha8)})) ?
                      {(8'h9f)} : (+(~$unsigned(reg16)))) : $unsigned((^($unsigned(reg15) ?
                      (wire2 != reg18) : $unsigned(reg16)))));
              reg22 <= (reg16[(4'ha):(4'ha)] ?
                  {$unsigned({(reg18 ? reg7 : wire2)}),
                      (~|(reg12[(2'h2):(1'h0)] ?
                          reg10 : (-reg4)))} : (reg6[(3'h5):(2'h2)] << (~&((wire0 <= reg11) ?
                      reg21[(3'h4):(2'h3)] : (reg10 >= reg12)))));
              reg23 <= reg17;
              reg24 <= reg5;
            end
          else
            begin
              reg21 <= $signed((8'h9f));
              reg22 <= (~$unsigned($unsigned((reg5[(3'h5):(1'h0)] ?
                  (!(7'h43)) : (reg16 <= reg7)))));
              reg23 <= {(~^$unsigned($unsigned((8'h9c)))),
                  reg10[(2'h2):(1'h1)]};
              reg24 <= ($unsigned(reg16) ?
                  (^~reg4[(2'h2):(1'h0)]) : ((&reg9[(1'h0):(1'h0)]) & ($unsigned({reg13}) <= $unsigned((wire1 ?
                      reg22 : (8'ha4))))));
            end
          if ((((~($unsigned(reg10) >>> (reg9 ? reg11 : (8'h9f)))) ?
                  reg19 : $unsigned(($unsigned(wire3) ?
                      (~reg16) : $signed(reg12)))) ?
              wire3 : $unsigned(reg22[(2'h2):(1'h0)])))
            begin
              reg25 <= ({(&$signed((8'hb1)))} ?
                  $signed((!((reg15 ?
                      reg24 : wire3) <= $signed(wire3)))) : (wire0[(4'hb):(4'h8)] ?
                      reg8[(2'h3):(2'h2)] : (~(~|(reg19 ? wire2 : reg19)))));
              reg26 <= ((reg19[(5'h14):(4'he)] ?
                  reg19[(3'h6):(1'h1)] : $signed(((reg19 * reg22) ?
                      reg22 : reg12))) > reg16[(4'hb):(3'h4)]);
            end
          else
            begin
              reg25 <= $signed(((~^wire1[(3'h5):(1'h0)]) ?
                  ($signed($signed(reg11)) ?
                      (^reg12) : reg12[(1'h0):(1'h0)]) : (+((reg5 >> (8'h9f)) ?
                      $signed(reg9) : $unsigned(reg15)))));
              reg26 <= reg7;
              reg27 <= $unsigned(reg22[(1'h0):(1'h0)]);
              reg28 <= (|reg13);
            end
          reg29 <= (~^$signed((&reg14)));
          reg30 <= {$unsigned($unsigned({(+wire2)})), reg6[(3'h6):(1'h0)]};
          reg31 <= (^~(($unsigned((reg14 ? (8'ha7) : reg5)) ?
                  (~^(reg8 < reg18)) : $signed((reg10 ? reg10 : reg28))) ?
              ((7'h41) ~^ $signed({(8'hbb), wire2})) : reg22));
        end
      else
        begin
          reg21 <= $unsigned({$unsigned((reg20 * {reg23, reg8}))});
        end
      reg32 <= {({(+$unsigned(reg17))} + (-$unsigned((|(8'haf))))),
          {reg10[(1'h1):(1'h0)],
              ((((8'hb2) ? reg20 : reg15) || reg5[(4'h8):(1'h0)]) ?
                  reg5[(3'h5):(3'h4)] : $unsigned($unsigned(reg17)))}};
      reg33 <= $unsigned(({$unsigned($signed((8'hbb))),
          ((^(8'hae)) - $signed((8'h9e)))} >>> ({reg18,
          (reg5 > reg16)} < $signed($unsigned(wire2)))));
      if (($unsigned($unsigned(((8'hb2) ? $unsigned(reg14) : reg17))) ?
          $unsigned(reg11[(1'h1):(1'h1)]) : wire1))
        begin
          reg34 <= (reg13 == (+$signed(({reg12, reg11} > (|reg4)))));
          reg35 <= (reg12 && ($signed(reg15[(1'h0):(1'h0)]) ?
              (!{reg27[(3'h4):(1'h0)], $unsigned(reg22)}) : $signed(({(8'hba),
                      wire1} ?
                  $unsigned(reg21) : (reg29 ? reg9 : reg6)))));
          reg36 <= (-($signed((~|(reg11 << (8'hb9)))) ?
              $unsigned($unsigned(reg16)) : {{{reg22, reg9}, reg11},
                  (((8'h9c) == wire0) ? (~&(8'ha9)) : wire2)}));
        end
      else
        begin
          reg34 <= ($signed({({(8'haa), reg4} >>> {reg31,
                  reg4})}) == ((((wire2 >> reg6) > (reg15 <<< reg29)) ^~ (+(+wire1))) ?
              reg23[(4'ha):(3'h7)] : reg35[(2'h2):(2'h2)]));
          reg35 <= ((reg24[(1'h1):(1'h1)] >>> (reg33 || reg5[(4'hd):(4'ha)])) | {(~&({(7'h40),
                  (8'hbb)} || $signed(reg14)))});
          if (((~$signed($unsigned($signed(reg20)))) <= (^reg15)))
            begin
              reg36 <= (reg11[(3'h6):(3'h6)] ?
                  (reg16[(3'h6):(3'h5)] | {($unsigned((8'hb4)) << wire1[(4'hf):(4'ha)])}) : {wire1[(5'h10):(4'he)],
                      reg23});
            end
          else
            begin
              reg36 <= wire0;
              reg37 <= $unsigned(reg24[(1'h1):(1'h1)]);
              reg38 <= $unsigned((reg7[(3'h4):(1'h1)] ?
                  $unsigned(reg9[(1'h0):(1'h0)]) : {reg17[(4'hf):(3'h7)],
                      ((~|wire2) << $signed((8'hbc)))}));
              reg39 <= (7'h42);
              reg40 <= reg5[(2'h2):(1'h1)];
            end
          reg41 <= reg26[(4'hb):(4'h8)];
        end
    end
  assign wire42 = (reg35[(1'h1):(1'h1)] ?
                      ((~({reg21, reg8} ?
                          $unsigned(reg6) : reg33)) ^ ($signed($signed((8'h9e))) >= reg27)) : $unsigned(reg30[(4'he):(4'h9)]));
  assign wire43 = $unsigned((+$signed(({reg40} <= (&reg26)))));
  assign wire44 = reg4[(2'h2):(2'h2)];
  assign wire45 = (reg7[(2'h2):(2'h2)] | ({((reg29 & reg31) | reg4[(1'h0):(1'h0)])} << ((((8'hb8) < reg26) - (reg32 ?
                      reg17 : reg28)) < (reg34[(3'h5):(3'h4)] ?
                      $unsigned(reg7) : {reg39}))));
  always
    @(posedge clk) begin
      reg46 <= (~|{$signed(reg40[(2'h3):(1'h1)])});
      reg47 <= reg24;
    end
  module48 #() modinst62 (wire61, clk, reg35, wire42, reg27, reg23, reg14);
  assign wire63 = (reg22[(4'ha):(3'h5)] ?
                      ((|({reg33,
                          (8'hbf)} >> $signed(reg17))) ^~ (8'ha3)) : ({($signed((8'hae)) << reg36),
                          {wire1}} || $unsigned(reg35)));
  assign wire64 = $signed(({($unsigned((8'hbc)) ^ (reg18 ? (8'haa) : reg35)),
                          (((8'hb3) >= wire1) ? reg14 : $unsigned(reg35))} ?
                      reg25[(2'h3):(1'h0)] : $unsigned($unsigned((reg37 ?
                          reg32 : reg37)))));
  always
    @(posedge clk) begin
      reg65 <= ($unsigned({reg37[(4'hc):(3'h7)]}) ?
          wire64 : (reg19[(2'h3):(1'h0)] ?
              {wire2} : $unsigned(($unsigned(reg17) > (+reg9)))));
      reg66 <= (8'hbe);
      reg67 <= ((~(($signed(reg39) ?
              (reg19 ? reg19 : wire0) : $unsigned(reg34)) ?
          reg38 : {wire2[(2'h2):(1'h0)], reg46[(5'h13):(4'h8)]})) << reg6);
    end
  assign wire68 = wire3[(4'hc):(2'h2)];
  module69 #() modinst220 (.y(wire219), .wire73(reg46), .wire72(reg24), .wire70(reg29), .clk(clk), .wire71(reg4), .wire74(wire61));
  module133 #() modinst222 (wire221, clk, reg31, reg46, reg25, reg38, reg41);
  assign wire223 = $unsigned(($signed(wire221[(5'h15):(4'hd)]) || wire45[(4'ha):(3'h7)]));
  assign wire224 = (^reg29[(2'h3):(1'h0)]);
  assign wire225 = reg29;
endmodule

module module69
#(parameter param217 = (((8'hbf) ? (8'hb8) : (~|(((8'ha0) <= (8'hb9)) ? ((8'hb0) | (8'ha3)) : (|(8'ha5))))) ^~ (({((8'hba) ^ (8'hbf))} ? (+((8'hb3) ^ (8'hbc))) : {{(7'h42), (8'hbb)}, ((8'hbb) & (8'ha3))}) ? ((((8'haa) <= (8'h9c)) ? (~&(8'hb4)) : (!(8'hae))) << ((&(8'hb5)) < (&(8'hb5)))) : (~^(~((7'h40) ^~ (8'ha9)))))), 
parameter param218 = param217)
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire74;
  input wire signed [(4'he):(1'h0)] wire73;
  input wire [(4'hd):(1'h0)] wire72;
  input wire signed [(5'h15):(1'h0)] wire71;
  input wire signed [(4'hd):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire216;
  wire [(4'he):(1'h0)] wire215;
  wire signed [(2'h2):(1'h0)] wire214;
  wire signed [(2'h2):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire131;
  wire signed [(4'hf):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire195;
  reg signed [(5'h15):(1'h0)] reg213 = (1'h0);
  reg [(4'hc):(1'h0)] reg212 = (1'h0);
  reg [(5'h14):(1'h0)] reg211 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg210 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg209 = (1'h0);
  reg [(5'h15):(1'h0)] reg208 = (1'h0);
  reg [(3'h7):(1'h0)] reg207 = (1'h0);
  reg [(4'ha):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg204 = (1'h0);
  reg [(3'h5):(1'h0)] reg203 = (1'h0);
  reg [(5'h11):(1'h0)] reg202 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg200 = (1'h0);
  reg [(5'h13):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg198 = (1'h0);
  reg [(4'h9):(1'h0)] reg197 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire163,
                 wire131,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 wire77,
                 wire76,
                 wire75,
                 wire195,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 (1'h0)};
  assign wire75 = (wire74 == (wire72[(4'h9):(3'h4)] ?
                      ($unsigned(wire71[(5'h10):(1'h1)]) - {{wire71, wire72},
                          {wire74, wire70}}) : $signed(wire70)));
  assign wire76 = (&wire72);
  assign wire77 = wire76[(3'h4):(2'h2)];
  module78 #() modinst95 (wire94, clk, wire73, wire70, wire71, wire75);
  assign wire96 = wire72;
  assign wire97 = ($signed(wire94) ~^ (wire73 ?
                      $signed(wire76[(4'h9):(3'h4)]) : (wire73 ?
                          (!{wire96, (8'hbc)}) : $signed(wire70))));
  assign wire98 = {($signed({$unsigned(wire97),
                          (8'hb6)}) >>> {$signed($signed(wire70)),
                          (&wire94[(4'ha):(3'h7)])})};
  module99 #() modinst132 (wire131, clk, wire97, wire76, wire74, wire73);
  module133 #() modinst164 (wire163, clk, wire96, wire74, wire94, wire75, wire72);
  module165 #() modinst196 (.clk(clk), .wire168(wire94), .y(wire195), .wire167(wire77), .wire166(wire97), .wire169(wire73), .wire170(wire131));
  always
    @(posedge clk) begin
      reg197 <= wire131;
      reg198 <= ($unsigned((^((wire77 ? wire75 : wire76) ?
              (wire73 ? wire72 : wire74) : wire71))) ?
          $signed($signed(wire77[(5'h15):(1'h0)])) : wire77);
      if (((8'h9c) ?
          (((wire163 ? $unsigned(wire75) : (reg197 ? wire77 : wire75)) ?
                  (|wire71[(5'h15):(1'h1)]) : ((^~wire163) ?
                      (wire74 | wire97) : {(8'ha2)})) ?
              $signed($unsigned($unsigned(wire163))) : $signed((~&(wire76 && wire73)))) : (8'hb8)))
        begin
          if ($unsigned((~^(wire77 ?
              ({wire76, wire96} * {wire70, (7'h42)}) : wire77[(3'h7):(1'h1)]))))
            begin
              reg199 <= (+{wire74});
              reg200 <= (&$signed($signed($unsigned((wire98 | reg198)))));
              reg201 <= ((($signed((wire131 >= (8'ha8))) ?
                          ((&reg197) ? $signed(wire74) : (-reg200)) : (8'h9e)) ?
                      wire75 : reg198[(4'h9):(4'h8)]) ?
                  $signed($signed($signed((8'ha4)))) : ($unsigned({(8'hb8)}) ?
                      wire74[(4'hd):(4'hb)] : $unsigned($unsigned((8'ha9)))));
              reg202 <= (-wire131);
            end
          else
            begin
              reg199 <= ((^$signed((+(wire75 && wire97)))) >= ($unsigned($unsigned((reg199 ?
                      wire94 : (8'hbe)))) ?
                  $signed(((^wire76) >= $unsigned(wire70))) : wire97));
            end
          if ($signed(($signed(reg202) ?
              (-(+$unsigned(reg200))) : (|$signed((|wire71))))))
            begin
              reg203 <= wire195[(1'h0):(1'h0)];
              reg204 <= ((^~(($unsigned(wire163) ?
                          (wire96 ? wire97 : reg201) : $signed(wire70)) ?
                      $unsigned($unsigned(wire72)) : wire96)) ?
                  (($signed(wire76) * ($unsigned(wire72) ?
                      (wire76 - reg201) : reg202[(5'h10):(5'h10)])) <<< wire73[(4'h8):(3'h4)]) : $signed(wire72));
              reg205 <= {{(reg200 - reg204[(4'hf):(1'h1)])}};
              reg206 <= (((~|(reg199[(3'h7):(2'h2)] <= (|(8'hb6)))) ?
                      wire94[(2'h3):(1'h1)] : reg205[(5'h11):(4'hd)]) ?
                  wire75[(3'h6):(1'h0)] : ($signed($unsigned(wire131[(4'h9):(3'h6)])) ?
                      ($signed(wire97[(3'h7):(3'h4)]) != wire77) : $unsigned(wire71[(1'h1):(1'h0)])));
            end
          else
            begin
              reg203 <= (($unsigned(wire75[(4'h9):(4'h9)]) < (((8'h9d) || (&reg198)) & {wire73[(4'hd):(2'h3)]})) ^ $unsigned((($signed((8'ha6)) ?
                      (reg199 ? wire98 : wire163) : $signed((7'h40))) ?
                  wire163[(2'h2):(1'h1)] : ($signed(wire70) >>> (^~wire96)))));
            end
          if ($signed((reg197[(4'h8):(3'h4)] < reg199)))
            begin
              reg207 <= wire75;
              reg208 <= wire96;
              reg209 <= $signed((~^(|(((8'hbf) ? wire74 : reg203) ?
                  (^wire76) : ((8'ha6) >= wire163)))));
              reg210 <= (~|($unsigned($unsigned((reg208 ? reg200 : wire77))) ?
                  ($signed($signed(wire195)) ?
                      reg198[(4'hf):(1'h1)] : $unsigned($signed(wire75))) : wire77));
              reg211 <= (~|(+$signed($unsigned((reg210 ? wire71 : reg198)))));
            end
          else
            begin
              reg207 <= ((~wire98[(2'h3):(2'h2)]) ?
                  ($unsigned(reg199[(5'h13):(4'he)]) ^ ($signed(reg210) <<< wire75)) : ($unsigned(($signed(reg206) || (8'h9c))) >>> wire77[(3'h5):(2'h3)]));
              reg208 <= (~(+(((~wire163) >>> (reg200 ? reg206 : wire77)) ?
                  reg202[(3'h4):(3'h4)] : $unsigned(wire131))));
              reg209 <= {(^wire98),
                  {($unsigned((wire70 ? wire71 : (8'hb9))) ?
                          ((reg208 || wire98) ?
                              reg199[(2'h2):(2'h2)] : $signed(reg204)) : (|$unsigned(reg203))),
                      {({wire71} >> (8'hb8))}}};
              reg210 <= $signed($unsigned(wire97));
            end
          reg212 <= $signed((-reg206));
        end
      else
        begin
          reg199 <= $unsigned(reg204[(4'h9):(1'h1)]);
          if ((((8'hb2) ?
              (~|(((8'ha7) ?
                  (8'ha9) : wire94) ^ reg212[(2'h2):(1'h0)])) : ((^wire74[(1'h1):(1'h1)]) > reg197[(2'h2):(2'h2)])) | $signed((-{(reg203 ?
                  wire72 : reg199)}))))
            begin
              reg200 <= $signed((((reg205 < (8'hba)) >> reg197[(3'h4):(1'h1)]) + $signed(reg201[(2'h2):(1'h0)])));
              reg201 <= reg204[(4'hb):(4'ha)];
              reg202 <= ((wire163 >= wire94[(4'h8):(3'h4)]) * ($signed($unsigned($signed((8'hb9)))) ?
                  reg198 : ((~^reg203[(2'h2):(1'h0)]) * reg212)));
              reg203 <= {(~^$signed($unsigned($unsigned(wire71))))};
              reg204 <= $signed({($signed({reg210, wire163}) != ((+reg205) ?
                      (|reg206) : $unsigned(reg211))),
                  reg207});
            end
          else
            begin
              reg200 <= reg204[(4'hb):(1'h1)];
              reg201 <= ((+(~({wire70, wire163} ?
                  $signed(reg200) : (wire71 + wire71)))) >= ({$signed((wire72 >> (8'hbd)))} ?
                  (~&reg201[(2'h3):(1'h1)]) : ($signed($signed(wire77)) ?
                      reg201[(1'h1):(1'h0)] : $unsigned((~^(8'hb9))))));
            end
          reg205 <= $signed($signed(wire71));
          reg206 <= reg197;
          if ({wire74[(1'h1):(1'h0)], wire74})
            begin
              reg207 <= wire94[(3'h5):(2'h3)];
              reg208 <= $signed({{$signed((reg200 << reg197))}});
            end
          else
            begin
              reg207 <= wire73[(4'hc):(4'h8)];
              reg208 <= (&$signed($unsigned(wire74)));
              reg209 <= (wire73 >= ({$unsigned($unsigned(reg206))} ?
                  reg207 : $signed((~$signed(wire163)))));
            end
        end
      reg213 <= (($signed((~|(wire75 ? (7'h44) : wire98))) ?
              (~reg204) : $unsigned(((~^wire98) >>> $unsigned(wire94)))) ?
          (reg206[(3'h5):(2'h3)] ?
              $signed(wire77[(4'hf):(4'ha)]) : (~^((reg198 - (8'hb1)) > (reg201 ^~ reg198)))) : $unsigned($unsigned(($signed(wire97) >= (wire75 ?
              reg210 : (8'hbb))))));
    end
  assign wire214 = $signed((!wire74));
  assign wire215 = ($signed((wire214[(1'h0):(1'h0)] ?
                       $signed($signed(reg197)) : (8'ha8))) <<< (({$unsigned((8'hb5)),
                           (reg199 ? reg205 : wire76)} >> {(reg206 ?
                               wire74 : (8'hbd))}) ?
                       ($unsigned((reg204 <= reg209)) >= ({wire75,
                           reg200} >= wire214[(1'h0):(1'h0)])) : $unsigned((^~$signed((8'hb8))))));
  assign wire216 = $unsigned(($signed(wire71) ?
                       $signed($unsigned(reg201[(2'h3):(2'h2)])) : (8'hba)));
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire53;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire signed [(4'h9):(1'h0)] wire51;
  input wire signed [(5'h12):(1'h0)] wire50;
  input wire signed [(4'he):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  assign y = {wire58, wire57, wire56, wire55, wire54, reg60, reg59, (1'h0)};
  assign wire54 = ($unsigned($unsigned($unsigned($unsigned(wire49)))) ?
                      wire50 : $unsigned((({wire53,
                              wire49} ^~ $unsigned(wire49)) ?
                          wire49 : (~^$signed(wire50)))));
  assign wire55 = (^~wire52);
  assign wire56 = ((wire52[(4'h8):(2'h2)] - wire55) < ((($unsigned(wire50) ?
                          (wire50 ? wire50 : wire55) : wire52[(1'h0):(1'h0)]) ?
                      wire55[(3'h7):(1'h0)] : $signed($signed(wire55))) * (~|wire51[(2'h2):(1'h0)])));
  assign wire57 = ((&wire49) ^ $signed((wire56 ?
                      $unsigned(wire53) : ({(8'haa), wire56} ?
                          (~&wire53) : ((8'hb7) ? wire50 : wire50)))));
  assign wire58 = $signed((^{(~&((8'hbe) ^~ wire55)),
                      ((wire53 ? wire54 : wire53) ?
                          $signed(wire54) : $signed(wire54))}));
  always
    @(posedge clk) begin
      reg59 <= (~^(wire51 ^ wire57));
      reg60 <= ({(wire57[(1'h0):(1'h0)] ?
                  ($signed(wire57) >= (reg59 ? wire58 : wire50)) : reg59),
              ($signed($unsigned((8'ha7))) || ((wire51 ?
                  wire55 : wire53) ~^ wire50[(4'ha):(1'h1)]))} ?
          (~&$signed((~^wire50))) : (~&(!wire58)));
    end
endmodule

module module165
#(parameter param193 = (((((^~(7'h42)) | ((7'h42) ? (8'ha2) : (8'ha8))) <= ((!(8'ha0)) ? ((8'hb1) - (8'haf)) : ((8'hbe) >= (8'ha0)))) || ((((8'hb0) <= (7'h42)) >>> (8'hb9)) ^~ (-(~|(8'hae))))) >> ({(^~((8'hb1) ? (8'haf) : (8'hab))), (((8'had) ? (8'hba) : (8'hb6)) | ((8'hbc) ^~ (8'h9d)))} >> ((((8'ha4) ? (8'haa) : (8'ha8)) ? (|(7'h41)) : ((8'haa) ? (8'hb5) : (7'h40))) ? (((8'h9c) ? (8'ha3) : (8'ha5)) ? ((8'hb6) && (8'hb6)) : (!(8'hb7))) : (~|((8'ha1) ? (8'ha5) : (8'h9f)))))), 
parameter param194 = (8'h9f))
(y, clk, wire170, wire169, wire168, wire167, wire166);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire170;
  input wire signed [(4'he):(1'h0)] wire169;
  input wire signed [(3'h5):(1'h0)] wire168;
  input wire [(5'h15):(1'h0)] wire167;
  input wire [(4'h8):(1'h0)] wire166;
  wire [(2'h3):(1'h0)] wire192;
  wire signed [(3'h5):(1'h0)] wire191;
  wire [(4'hf):(1'h0)] wire190;
  wire [(2'h3):(1'h0)] wire189;
  wire [(4'ha):(1'h0)] wire183;
  wire signed [(2'h2):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire181;
  wire [(3'h4):(1'h0)] wire180;
  wire signed [(5'h10):(1'h0)] wire179;
  wire signed [(4'hc):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire177;
  wire [(5'h15):(1'h0)] wire176;
  wire [(3'h4):(1'h0)] wire175;
  wire signed [(4'h8):(1'h0)] wire174;
  wire [(3'h5):(1'h0)] wire172;
  wire [(5'h11):(1'h0)] wire171;
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg [(5'h15):(1'h0)] reg187 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg185 = (1'h0);
  reg [(2'h2):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg173 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire172,
                 wire171,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg173,
                 (1'h0)};
  assign wire171 = $signed($unsigned($signed((!((8'ha9) >= wire170)))));
  assign wire172 = wire166[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg173 <= $signed($unsigned(wire170[(4'ha):(3'h7)]));
    end
  assign wire174 = $unsigned((wire171[(4'hb):(4'h8)] != ($signed($signed(wire167)) ?
                       wire166[(2'h3):(2'h3)] : $unsigned((+reg173)))));
  assign wire175 = ((^~((!(wire169 << wire172)) - $unsigned({wire171}))) ?
                       ((wire174 ? wire170 : wire169[(4'he):(3'h7)]) ?
                           $unsigned({$unsigned(wire168)}) : wire174) : wire169[(2'h2):(1'h0)]);
  assign wire176 = $signed($signed((~&{(^~wire172), (8'ha1)})));
  assign wire177 = $unsigned(((wire172 * (-((8'h9d) > wire171))) + wire171));
  assign wire178 = wire168;
  assign wire179 = (8'ha2);
  assign wire180 = wire172[(2'h3):(2'h2)];
  assign wire181 = (!wire176[(4'h8):(3'h4)]);
  assign wire182 = (((+wire168) ? {{(-wire178)}} : wire170) ?
                       $signed((8'h9c)) : $signed(wire176));
  assign wire183 = (~$signed((8'hbc)));
  always
    @(posedge clk) begin
      reg184 <= $signed(((^~((wire170 ? wire181 : wire181) ?
          (+wire169) : wire171)) + $signed($signed((wire168 ?
          wire183 : wire172)))));
      reg185 <= wire181;
      reg186 <= $signed(wire172);
      reg187 <= ((((^~wire181) << (&$signed((8'h9f)))) ^~ (~|($unsigned(wire177) ?
          {reg173, reg186} : (~^wire174)))) << $unsigned(wire171));
    end
  always
    @(posedge clk) begin
      reg188 <= wire176[(5'h10):(3'h7)];
    end
  assign wire189 = $unsigned(($unsigned(wire183) ?
                       wire171[(4'hb):(1'h0)] : $unsigned(((&wire179) || (|reg188)))));
  assign wire190 = $signed(wire174);
  assign wire191 = wire189[(2'h2):(2'h2)];
  assign wire192 = wire180;
endmodule

module module133
#(parameter param162 = (!((^(((8'hbb) ? (8'hac) : (8'hbf)) >>> {(8'h9e)})) > ({((8'hbb) >>> (8'ha4))} ? ((^(8'hbe)) ? (!(8'hb9)) : {(8'hba), (8'ha7)}) : ((~&(8'hab)) | (8'hbd))))))
(y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire138;
  input wire signed [(4'hd):(1'h0)] wire137;
  input wire [(3'h6):(1'h0)] wire136;
  input wire [(3'h7):(1'h0)] wire135;
  input wire signed [(3'h5):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire161;
  wire [(2'h2):(1'h0)] wire148;
  wire signed [(2'h3):(1'h0)] wire147;
  wire signed [(4'he):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire143;
  wire [(3'h6):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire141;
  wire [(5'h14):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire139;
  reg [(4'hb):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg159 = (1'h0);
  reg [(5'h14):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg155 = (1'h0);
  reg [(2'h2):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  assign y = {wire161,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
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
                 (1'h0)};
  assign wire139 = wire136[(2'h2):(1'h0)];
  assign wire140 = (!(~|(wire134[(3'h5):(3'h4)] ?
                       $unsigned(((8'hab) + wire137)) : (&(wire134 != wire138)))));
  assign wire141 = $signed((wire137 ?
                       (((wire139 & wire140) ?
                           $unsigned(wire134) : wire135[(1'h1):(1'h0)]) != wire134[(2'h2):(1'h0)]) : $unsigned((~&(wire137 ?
                           wire138 : wire139)))));
  assign wire142 = (wire139[(2'h3):(2'h2)] ?
                       ((wire135[(3'h4):(3'h4)] <= wire134[(3'h5):(3'h5)]) * (wire138 ?
                           wire139[(1'h1):(1'h1)] : ((+wire139) ?
                               (wire140 ?
                                   wire137 : wire136) : wire141[(2'h2):(1'h1)]))) : (^~{$unsigned(wire140)}));
  assign wire143 = wire134[(3'h4):(3'h4)];
  assign wire144 = $unsigned((($unsigned((wire138 || wire134)) ?
                           $unsigned(wire142[(2'h3):(2'h2)]) : {wire139[(2'h2):(1'h1)],
                               wire142[(3'h4):(1'h0)]}) ?
                       wire134[(3'h5):(1'h1)] : $signed((wire138[(1'h1):(1'h0)] ?
                           (~^wire139) : (wire140 || wire135)))));
  assign wire145 = $signed({wire139[(1'h1):(1'h0)]});
  assign wire146 = (wire137 >>> wire136);
  assign wire147 = wire135;
  assign wire148 = (^(&(~^$unsigned((wire143 <= wire136)))));
  always
    @(posedge clk) begin
      reg149 <= (~&(&(~^$unsigned((wire138 + (8'hac))))));
      reg150 <= $signed(($unsigned(({wire142} && (~^(8'hb6)))) ?
          (!$signed(wire139)) : $unsigned((~|(^~wire147)))));
      reg151 <= $unsigned($unsigned($unsigned($signed($unsigned(wire134)))));
      if (((8'ha2) | ((({wire140, wire144} ?
                  (wire139 ? wire146 : (8'hab)) : wire147) ?
              ((wire148 < wire135) & wire134[(2'h3):(1'h0)]) : wire141[(1'h0):(1'h0)]) ?
          (reg149 ?
              (8'hac) : ((8'ha8) ?
                  $signed(wire148) : (^wire136))) : (!($signed((8'hbc)) ?
              wire140 : (wire137 ? wire141 : wire141))))))
        begin
          reg152 <= ($signed(((8'hae) ?
              $unsigned($signed(wire144)) : $signed(wire142))) != ({$signed($signed(wire136))} ?
              ($signed({wire140, reg151}) || wire137) : wire142));
          reg153 <= ($unsigned({(8'ha5), {{wire143}}}) ?
              (~&($signed((-wire144)) << $unsigned(wire141))) : $signed((^~$unsigned((wire135 ?
                  wire143 : reg150)))));
          reg154 <= reg151[(4'h8):(2'h2)];
        end
      else
        begin
          reg152 <= {wire146};
          reg153 <= $unsigned($unsigned({($unsigned(reg151) >>> $signed(reg150)),
              reg149}));
          reg154 <= reg151[(4'h8):(4'h8)];
        end
      if (wire140[(5'h13):(3'h7)])
        begin
          reg155 <= $signed($unsigned((reg153[(5'h12):(4'hb)] ?
              $signed($signed(reg150)) : ($signed(wire138) > wire136))));
          reg156 <= ($signed(wire136[(1'h0):(1'h0)]) <= $signed(reg153[(5'h11):(2'h3)]));
          reg157 <= $signed($unsigned($signed($signed((~&wire142)))));
        end
      else
        begin
          reg155 <= {((reg149[(5'h13):(1'h1)] ?
                  wire147[(2'h3):(2'h2)] : $signed((wire143 ?
                      reg150 : reg157))) + (~&$unsigned((~|(7'h43)))))};
          if (wire136)
            begin
              reg156 <= ({$unsigned((reg149 ? wire147 : (~&wire141))),
                      reg153[(5'h11):(3'h5)]} ?
                  $unsigned((&wire140)) : ($signed($unsigned($unsigned(wire137))) ?
                      $signed($signed((wire145 > (8'hbd)))) : reg155));
            end
          else
            begin
              reg156 <= wire147[(2'h3):(2'h3)];
              reg157 <= (($signed(($signed(wire139) > (wire136 ?
                      reg157 : reg155))) ?
                  (~^reg150[(4'hb):(1'h1)]) : (reg156[(1'h0):(1'h0)] ?
                      ($unsigned((8'hac)) ^~ wire141) : wire141[(2'h2):(1'h0)])) >>> (wire137 && {($unsigned(wire146) ^~ (wire136 ?
                      wire137 : wire135))}));
            end
          reg158 <= $unsigned((($signed(wire135[(3'h5):(2'h3)]) ?
                  ((reg156 <= wire141) < $unsigned(wire140)) : (-$unsigned(wire141))) ?
              $unsigned(reg152) : wire145));
          reg159 <= $signed(wire141[(2'h2):(1'h0)]);
          reg160 <= $unsigned(($unsigned(wire144[(3'h6):(3'h5)]) ?
              $signed($signed((~reg159))) : (reg149[(4'h8):(4'h8)] ?
                  ((wire148 * wire141) >>> (reg156 << wire143)) : (-wire136))));
        end
    end
  assign wire161 = wire134[(1'h0):(1'h0)];
endmodule

module module99
#(parameter param129 = {(((~|(+(8'hb8))) + (((8'hac) ? (8'ha1) : (8'ha5)) ~^ ((8'hac) ? (8'ha6) : (8'hbc)))) ? (^~{(~&(8'hbf)), ((8'ha8) ? (8'ha4) : (8'hb3))}) : ({(~^(8'ha2))} & (^((8'hb8) ? (8'h9d) : (8'hba))))), (((~(8'ha8)) && ((8'hb9) ? {(8'hb9), (8'hb1)} : (-(8'ha3)))) ? {{(~^(8'hac)), {(8'hbc)}}, (((8'ha4) ? (8'h9c) : (8'hbe)) ? (+(8'ha0)) : (~|(8'haa)))} : {(8'hb6), ({(7'h42), (7'h43)} ? {(8'hb3)} : {(7'h42)})})}, 
parameter param130 = ((!(param129 ? (((8'h9f) >>> (7'h41)) ? (~|param129) : (^~param129)) : param129)) + ({param129} ? ({(-param129), (param129 ? param129 : param129)} << {(param129 ^~ param129)}) : {{(param129 && (8'ha2)), param129}, {param129}})))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire103;
  input wire signed [(3'h4):(1'h0)] wire102;
  input wire [(4'hd):(1'h0)] wire101;
  input wire signed [(4'he):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire115;
  wire [(4'he):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire104;
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  assign y = {wire128,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
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
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire104 = ((wire103 ?
                           wire101 : ((~|$unsigned(wire100)) == ($signed((8'hb3)) - (wire100 >>> wire102)))) ?
                       (&wire102) : wire103);
  assign wire105 = ($signed($signed(wire102[(3'h4):(3'h4)])) - wire104[(3'h6):(3'h6)]);
  assign wire106 = ($signed((wire103 & $unsigned((wire100 ?
                           wire101 : wire103)))) ?
                       (($unsigned(wire103) ?
                           {(^~wire104), wire101} : ((&wire102) ?
                               {(8'h9d)} : $unsigned((8'ha7)))) ^~ (($signed((8'hbc)) ?
                               $signed(wire104) : wire105[(1'h0):(1'h0)]) ?
                           $signed(wire104[(4'h9):(4'h9)]) : wire103[(1'h1):(1'h0)])) : wire102[(1'h0):(1'h0)]);
  assign wire107 = wire103[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg108 <= ((wire100 | $signed((~&{(8'hac)}))) ?
          ($unsigned($signed($unsigned((8'h9d)))) ?
              (wire102 ?
                  {$unsigned((8'hbf)), wire103[(2'h3):(1'h1)]} : (+(wire106 ?
                      wire102 : wire100))) : $unsigned(wire100)) : (&$signed((wire100[(2'h2):(1'h0)] <<< wire104[(3'h5):(2'h3)]))));
      reg109 <= wire105;
      reg110 <= $unsigned($unsigned(($unsigned($signed(wire107)) ^ $signed(wire105[(2'h2):(1'h0)]))));
    end
  assign wire111 = $unsigned(wire103[(4'ha):(4'h8)]);
  assign wire112 = {(((!(wire107 ? (8'hba) : wire103)) ?
                               {(wire100 || wire106)} : wire106) ?
                           $unsigned($signed(reg110)) : $signed(wire103))};
  assign wire113 = wire103[(3'h6):(3'h6)];
  assign wire114 = wire107;
  assign wire115 = (wire104 ?
                       (((-reg109[(4'h8):(2'h2)]) ^ {wire112[(4'h8):(1'h1)],
                               (wire104 ? reg110 : wire107)}) ?
                           $unsigned(wire107[(4'hc):(4'hb)]) : ((((8'ha1) + wire113) <= {wire106}) ?
                               (~|(wire111 ?
                                   wire114 : wire103)) : $signed({(8'hb4),
                                   wire105}))) : (~|(~^((8'ha6) ~^ (reg109 >= (8'hb4))))));
  always
    @(posedge clk) begin
      reg116 <= (~(($unsigned((wire114 ? wire104 : wire115)) ?
              (wire104[(2'h2):(1'h0)] ?
                  $signed(wire100) : $signed(wire100)) : wire114) ?
          $signed({(wire107 < wire105)}) : wire102[(2'h2):(2'h2)]));
      if ((~^$unsigned({reg116[(3'h6):(1'h0)]})))
        begin
          reg117 <= $signed((wire114 * (((~wire102) ?
                  (wire106 < reg110) : $signed(wire103)) ?
              reg110 : ($unsigned(reg110) ?
                  $signed(wire103) : (reg110 && reg109)))));
          if (((($signed((wire106 & wire101)) ~^ ($unsigned(reg109) != wire113[(1'h1):(1'h0)])) ?
                  (~$signed(wire106[(5'h10):(4'ha)])) : $unsigned((~wire103))) ?
              $signed(wire114[(1'h0):(1'h0)]) : $signed({($signed(wire101) || wire112),
                  wire106[(4'ha):(3'h5)]})))
            begin
              reg118 <= {$unsigned($signed(reg116))};
              reg119 <= $unsigned((wire111 | (&wire104[(4'h9):(3'h5)])));
              reg120 <= wire104;
              reg121 <= (-wire112);
              reg122 <= (&wire100);
            end
          else
            begin
              reg118 <= $unsigned($unsigned($unsigned($unsigned((reg121 * (8'hbb))))));
              reg119 <= wire111[(2'h2):(1'h0)];
              reg120 <= (8'hb8);
            end
          if ($unsigned(($signed(wire102[(1'h0):(1'h0)]) ?
              wire102[(2'h3):(2'h3)] : ((~|wire107[(1'h0):(1'h0)]) >= reg122[(4'hf):(3'h6)]))))
            begin
              reg123 <= (reg121 ?
                  $signed((((-wire107) ?
                      (reg109 <= (8'hbd)) : reg116[(2'h3):(1'h0)]) & (~(reg110 ?
                      wire102 : wire101)))) : (wire107 >>> $signed($signed(wire100[(2'h2):(1'h0)]))));
              reg124 <= {{($unsigned((wire107 > reg121)) ?
                          ((8'hb5) ?
                              wire104[(1'h0):(1'h0)] : $signed(reg110)) : wire104[(2'h3):(2'h2)])}};
              reg125 <= wire101;
            end
          else
            begin
              reg123 <= $unsigned(wire114);
              reg124 <= $unsigned((($unsigned($unsigned(wire106)) ?
                  (~^(!wire113)) : $unsigned(reg109)) <= wire106));
            end
          if ($unsigned(wire107))
            begin
              reg126 <= (~|((^$unsigned((&reg110))) == (~^$signed((~^reg119)))));
              reg127 <= {{$signed(((!reg122) != $unsigned(reg109))),
                      {$unsigned($signed(reg122)), (7'h43)}},
                  reg121[(4'hd):(2'h3)]};
            end
          else
            begin
              reg126 <= wire102[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg117 <= ($signed({((wire115 + wire114) != $unsigned((8'hb3))),
                  ({(8'hae)} ? wire111[(2'h3):(2'h2)] : {reg110})}) ?
              $unsigned(wire101[(4'hd):(4'hd)]) : (reg126[(2'h3):(1'h0)] ?
                  reg110 : reg118[(3'h4):(3'h4)]));
          if ((wire102 - $signed($unsigned($signed((~|wire103))))))
            begin
              reg118 <= ((reg122 ?
                      (reg121 | (wire105 >> ((8'haa) << (8'hbb)))) : (((^reg118) ?
                          (~&reg122) : (reg108 && (8'hba))) >> reg110)) ?
                  $unsigned($signed(($signed(reg119) ^~ reg109))) : (reg126[(3'h4):(2'h2)] <<< $signed($signed((wire111 | reg122)))));
              reg119 <= (reg116 >= ($unsigned((~|(reg116 < reg120))) ^ ({(wire104 > wire107),
                      $unsigned(wire107)} ?
                  $unsigned((8'hbc)) : $unsigned((reg116 + reg119)))));
              reg120 <= reg124[(2'h3):(2'h3)];
              reg121 <= {reg109[(1'h1):(1'h1)], reg116[(3'h6):(2'h3)]};
            end
          else
            begin
              reg118 <= $unsigned((~wire100[(4'hb):(1'h0)]));
              reg119 <= $signed((~|(reg125 ?
                  (~&wire102) : (~&$unsigned((8'haf))))));
            end
        end
    end
  assign wire128 = reg108[(2'h2):(1'h0)];
endmodule

module module78  (y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire82;
  input wire [(4'hd):(1'h0)] wire81;
  input wire signed [(4'he):(1'h0)] wire80;
  input wire signed [(4'ha):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  assign y = {wire93,
                 wire85,
                 wire84,
                 wire83,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire83 = $unsigned($unsigned($unsigned(wire79)));
  assign wire84 = (8'ha5);
  assign wire85 = $unsigned((($signed($signed(wire81)) ?
                          {(wire84 * wire80),
                              (wire79 < (8'hb4))} : (^wire83[(1'h0):(1'h0)])) ?
                      wire80 : (wire82[(1'h0):(1'h0)] & $unsigned($unsigned(wire79)))));
  always
    @(posedge clk) begin
      if ($signed(wire83))
        begin
          reg86 <= wire81[(3'h6):(2'h3)];
          reg87 <= $unsigned((reg86 <= (wire82 ?
              $signed($unsigned(wire84)) : (wire83[(1'h0):(1'h0)] ?
                  reg86 : (~^wire79)))));
          reg88 <= ($signed((reg86[(2'h2):(1'h1)] ?
              $signed((+wire81)) : wire79)) + (~(wire85 >>> $signed(wire79))));
        end
      else
        begin
          if ((|(+wire80[(1'h1):(1'h0)])))
            begin
              reg86 <= reg88[(4'h8):(3'h6)];
              reg87 <= {(((~^(^reg88)) ?
                      wire82 : {(&(8'hbd))}) ^~ (reg86[(1'h1):(1'h1)] ?
                      $signed((-(8'ha6))) : $unsigned(wire80))),
                  wire83};
              reg88 <= $unsigned(wire85[(3'h7):(2'h2)]);
            end
          else
            begin
              reg86 <= $unsigned({(^~(reg86 * (&wire85))),
                  $unsigned((~&wire82[(2'h2):(1'h1)]))});
            end
        end
      reg89 <= (wire81 ?
          wire82[(1'h0):(1'h0)] : ({(reg87 ?
                  $signed(wire81) : $unsigned((8'hb6)))} << wire79));
      if ((8'hbe))
        begin
          reg90 <= (wire80 && wire82);
          reg91 <= $unsigned(reg87[(4'he):(4'hc)]);
        end
      else
        begin
          reg90 <= $unsigned(wire79);
        end
      reg92 <= $signed(((8'hb9) ?
          (reg86 << (~|(wire81 ~^ (8'h9f)))) : (((wire82 ? wire80 : reg89) ?
              $unsigned(reg91) : wire83) << $signed(((8'haf) >>> reg88)))));
    end
  assign wire93 = (!wire82);
endmodule
