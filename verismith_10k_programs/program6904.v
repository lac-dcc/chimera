module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h221):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire [(4'h9):(1'h0)] wire282;
  wire signed [(3'h7):(1'h0)] wire281;
  wire signed [(3'h5):(1'h0)] wire273;
  wire [(5'h11):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire275;
  wire signed [(4'hd):(1'h0)] wire276;
  wire [(4'hb):(1'h0)] wire277;
  wire signed [(2'h2):(1'h0)] wire278;
  wire signed [(2'h3):(1'h0)] wire279;
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire282,
                 wire281,
                 wire273,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire4,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire25,
                 wire98,
                 wire275,
                 wire276,
                 wire277,
                 wire278,
                 wire279,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg24,
                 reg19,
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
                 (1'h0)};
  assign wire4 = (~&$signed(((|$signed((7'h43))) ^~ $unsigned(wire3))));
  always
    @(posedge clk) begin
      if ($signed(wire2[(2'h2):(1'h1)]))
        begin
          reg5 <= wire3;
          reg6 <= (~&{$signed(((-wire2) ?
                  $unsigned(wire3) : (wire4 ? wire0 : wire3))),
              $signed((^{wire1, wire2}))});
          reg7 <= (8'hb7);
          if (((reg5[(5'h15):(4'h8)] ^~ $signed(wire4)) | (8'hb0)))
            begin
              reg8 <= $signed($signed((reg6[(4'hb):(2'h2)] ?
                  $unsigned(wire2) : $unsigned(wire1[(3'h6):(2'h3)]))));
            end
          else
            begin
              reg8 <= (+($unsigned({(reg7 ? wire4 : wire1)}) ~^ ((wire0 ?
                      (reg7 ^ wire2) : $unsigned(wire4)) ?
                  {wire1} : $signed(((8'hb3) ? reg6 : reg7)))));
              reg9 <= (~|(~&$unsigned(({wire3} ?
                  $signed(reg8) : $signed(wire2)))));
              reg10 <= ((&reg7[(2'h2):(1'h0)]) ?
                  $unsigned(({reg5} ?
                      $signed($signed(wire4)) : ($unsigned(reg7) >= wire2))) : {reg7});
              reg11 <= (~^{reg8});
              reg12 <= reg9[(3'h7):(3'h7)];
            end
          if (wire4)
            begin
              reg13 <= {$signed((reg12 ? reg12 : {wire3[(3'h4):(1'h1)]}))};
              reg14 <= $signed((+$signed((reg6 ? (!reg11) : reg8))));
              reg15 <= $signed((~^(~&reg13)));
              reg16 <= $unsigned((reg14[(3'h5):(1'h0)] ?
                  wire2 : ((wire0 < $signed(wire1)) != ($unsigned(reg9) ?
                      $signed(reg13) : (reg7 ? reg13 : (8'hb6))))));
            end
          else
            begin
              reg13 <= ((8'hb6) ?
                  ({(~|$unsigned((7'h41))),
                      (reg15 ?
                          (reg5 + reg11) : reg12)} | reg11) : (wire4[(3'h5):(2'h3)] - (~$signed(wire3))));
            end
        end
      else
        begin
          if (((($unsigned((reg6 < wire3)) || {wire0[(3'h7):(1'h1)],
                      {(8'ha0)}}) ?
                  ((!{reg7, reg9}) == (wire4 ?
                      reg12[(4'ha):(2'h2)] : reg12)) : (((~reg10) ~^ reg14) + reg12[(4'h8):(4'h8)])) ?
              ({$unsigned((reg6 ? wire4 : reg5)),
                      ((reg9 ? wire3 : wire1) ^ {reg10})} ?
                  ((reg9 * wire0[(3'h6):(2'h2)]) ^ (wire0[(3'h4):(1'h0)] && $signed(reg8))) : $signed((~$signed(reg5)))) : wire1[(2'h2):(1'h0)]))
            begin
              reg5 <= reg10;
              reg6 <= $unsigned(reg15[(3'h6):(3'h5)]);
              reg7 <= $signed((~wire2));
              reg8 <= (reg7 ?
                  ((~(reg9 < reg9[(3'h7):(1'h0)])) ?
                      (wire3 >= (wire1 <<< {reg10})) : $signed(reg5)) : ((~|wire3) <<< $signed($signed((wire1 ?
                      reg8 : reg10)))));
              reg9 <= wire4[(4'h8):(2'h3)];
            end
          else
            begin
              reg5 <= reg15[(4'he):(4'hb)];
            end
          reg10 <= (~^wire1);
          reg11 <= $unsigned(wire4);
          if ($unsigned({wire0, ((8'hb1) > (~reg8))}))
            begin
              reg12 <= (~|$signed(($signed({reg11, reg10}) << ((7'h41) ?
                  ((8'had) < reg5) : (8'ha1)))));
              reg13 <= $signed(($signed(reg9) << reg7[(2'h3):(1'h0)]));
              reg14 <= {(reg13 ?
                      ($signed(wire0) ?
                          ($unsigned(wire4) ?
                              (8'hb8) : reg12) : wire3[(4'ha):(3'h6)]) : reg7[(3'h7):(3'h5)])};
            end
          else
            begin
              reg12 <= {reg6,
                  ($signed((((8'haf) + reg8) > $signed(wire3))) & $signed($unsigned((|(7'h41)))))};
              reg13 <= $signed($signed(wire3));
              reg14 <= $unsigned(reg8[(3'h4):(1'h0)]);
            end
        end
      reg17 <= reg10[(3'h6):(1'h1)];
      reg18 <= reg17[(4'ha):(4'h9)];
      reg19 <= reg17;
    end
  assign wire20 = reg13[(4'he):(3'h4)];
  assign wire21 = (!{reg18});
  assign wire22 = $unsigned((reg17 + ($unsigned((&reg8)) <<< reg5)));
  assign wire23 = wire2[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg24 <= reg15[(3'h5):(1'h0)];
    end
  assign wire25 = ((~^{wire0[(3'h7):(3'h6)], $signed((!reg16))}) ?
                      wire21[(4'he):(4'hb)] : (!$signed($signed(wire20))));
  module26 #() modinst99 (.wire30(wire22), .wire28(reg19), .clk(clk), .wire31(reg6), .wire27(wire20), .wire29(wire1), .y(wire98));
  assign wire100 = $unsigned((reg10[(3'h6):(1'h0)] > reg13));
  assign wire101 = reg13;
  assign wire102 = (((((-reg11) >> wire1) >= ((^~reg11) == $signed(wire101))) ?
                       reg10[(3'h7):(3'h4)] : $signed(reg18[(4'h8):(1'h0)])) ^ {wire98[(3'h4):(1'h0)]});
  assign wire103 = (|$unsigned($signed((-wire3[(1'h0):(1'h0)]))));
  assign wire104 = reg8;
  always
    @(posedge clk) begin
      if (($unsigned((reg13 >> {(~^reg6),
          wire23})) != (reg16[(4'h8):(3'h6)] & ($signed((8'hb7)) >= $unsigned((reg7 ?
          (8'hbb) : reg10))))))
        begin
          reg105 <= (reg18 ?
              ((+$signed((^~wire4))) ?
                  (~&$signed($signed(wire1))) : (8'had)) : ({wire3} ?
                  $unsigned(reg6[(2'h2):(1'h1)]) : (wire104[(2'h2):(1'h1)] * {$unsigned((8'h9f)),
                      wire20})));
        end
      else
        begin
          if ($unsigned($unsigned((|(8'hb6)))))
            begin
              reg105 <= $unsigned(wire0[(2'h2):(2'h2)]);
              reg106 <= $signed((wire21[(5'h14):(4'hb)] ?
                  (~|(wire104 ?
                      (^reg12) : (reg14 ?
                          reg19 : wire1))) : (!$signed((-reg16)))));
              reg107 <= wire20[(4'h9):(1'h1)];
            end
          else
            begin
              reg105 <= reg9;
              reg106 <= $unsigned(wire102);
              reg107 <= (-(+($unsigned($signed(reg6)) ?
                  ($signed((8'hba)) ? reg10 : (~^wire23)) : ($signed(wire22) ?
                      $unsigned(reg107) : (-reg19)))));
            end
        end
      reg108 <= reg18;
      reg109 <= {wire22[(4'hb):(4'ha)], reg10[(4'hb):(4'h9)]};
    end
  module110 #() modinst274 (.wire113(reg9), .wire115(reg17), .wire111(wire4), .y(wire273), .wire114(reg108), .wire112(reg106), .clk(clk));
  assign wire275 = $unsigned($unsigned(((~&$signed(wire4)) + (!reg106[(5'h10):(4'ha)]))));
  assign wire276 = $signed(({((~|reg8) ?
                           {(8'ha7), wire21} : {wire101})} & (&(^~wire273))));
  assign wire277 = (+{($signed(reg9) ?
                           $unsigned(((8'h9d) != wire273)) : $unsigned(((8'hb9) ?
                               wire104 : (8'ha8))))});
  assign wire278 = $unsigned(wire276[(4'hc):(1'h1)]);
  module192 #() modinst280 (.wire195(wire275), .clk(clk), .wire193(wire104), .y(wire279), .wire197(wire22), .wire194(wire103), .wire196(wire21));
  assign wire281 = ({(!($signed(wire103) ? reg6 : (~&(7'h42)))),
                           ({{wire20}} ?
                               ({wire25} <<< (reg18 <= reg14)) : ((&wire276) ?
                                   reg19[(2'h2):(1'h0)] : (reg19 > reg108)))} ?
                       $signed(wire104) : ($unsigned($signed((~^reg6))) ?
                           $signed($unsigned($signed(wire21))) : $signed($signed($unsigned(wire100)))));
  assign wire282 = (~^($unsigned(reg7) ?
                       ($unsigned((~&wire3)) ?
                           $signed($unsigned(wire1)) : {(wire1 ^~ wire281)}) : $unsigned((8'hac))));
endmodule

module module110
#(parameter param272 = {((8'hb3) ? {({(8'ha6)} ^ {(8'hb5), (8'hbe)})} : (~(((8'ha7) == (8'ha8)) ? ((8'hb8) ? (8'hbc) : (7'h44)) : {(8'ha0), (8'ha7)}))), {(({(8'h9d)} ? (~^(8'ha1)) : (~^(8'ha8))) | {((7'h40) ? (8'ha0) : (8'hb8)), (~|(8'ha7))}), ((~&((8'hbb) ^ (8'ha4))) >>> (|((8'h9f) ? (8'h9f) : (8'hac))))}})
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire115;
  input wire signed [(5'h11):(1'h0)] wire114;
  input wire [(5'h12):(1'h0)] wire113;
  input wire [(4'h9):(1'h0)] wire112;
  input wire [(5'h11):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire270;
  wire signed [(5'h14):(1'h0)] wire233;
  wire signed [(5'h10):(1'h0)] wire191;
  wire signed [(3'h6):(1'h0)] wire190;
  wire [(5'h12):(1'h0)] wire189;
  wire signed [(5'h15):(1'h0)] wire188;
  wire signed [(4'h9):(1'h0)] wire187;
  wire signed [(4'hd):(1'h0)] wire186;
  wire signed [(5'h13):(1'h0)] wire183;
  wire [(5'h14):(1'h0)] wire182;
  wire [(5'h11):(1'h0)] wire181;
  wire [(4'ha):(1'h0)] wire180;
  wire signed [(5'h10):(1'h0)] wire179;
  wire signed [(4'hc):(1'h0)] wire178;
  wire signed [(5'h15):(1'h0)] wire177;
  wire [(5'h15):(1'h0)] wire176;
  wire [(4'hb):(1'h0)] wire174;
  wire [(5'h13):(1'h0)] wire173;
  wire [(5'h12):(1'h0)] wire172;
  wire [(4'h9):(1'h0)] wire170;
  reg signed [(4'hc):(1'h0)] reg185 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg175 = (1'h0);
  assign y = {wire270,
                 wire233,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire174,
                 wire173,
                 wire172,
                 wire170,
                 reg185,
                 reg184,
                 reg175,
                 (1'h0)};
  module116 #() modinst171 (.wire119(wire113), .wire117(wire115), .y(wire170), .clk(clk), .wire120(wire114), .wire118(wire111));
  assign wire172 = wire114[(4'hc):(3'h6)];
  assign wire173 = ((~|(((wire170 ^~ wire115) < ((8'hae) ?
                           wire111 : (7'h43))) >= wire113)) ?
                       ($signed($signed(wire111)) ?
                           wire114[(3'h4):(2'h3)] : $unsigned((wire115[(4'h9):(1'h1)] > {wire170,
                               wire112}))) : ({(|$signed((8'hbc)))} ?
                           wire115 : {($unsigned(wire111) + $unsigned(wire170))}));
  assign wire174 = $unsigned((~|wire172));
  always
    @(posedge clk) begin
      reg175 <= wire111;
    end
  assign wire176 = $signed((7'h41));
  assign wire177 = {wire112[(4'h8):(2'h2)], (&$signed((!(8'hae))))};
  assign wire178 = ($unsigned(((~^(wire173 <<< wire170)) >= wire172[(5'h10):(3'h7)])) ?
                       $unsigned((reg175 ?
                           $unsigned((&(8'hb2))) : (~|(wire115 << (8'hb9))))) : (8'hb6));
  assign wire179 = ($signed((({wire115} < (wire170 ^ wire113)) <<< ($signed(wire114) * wire173[(3'h6):(2'h2)]))) ?
                       reg175 : (^~wire112[(3'h4):(2'h3)]));
  assign wire180 = {(~|$signed(wire112[(3'h6):(2'h2)])), wire113};
  assign wire181 = $signed((-wire112));
  assign wire182 = ((reg175 | (reg175[(5'h12):(4'hd)] | (wire173[(3'h5):(3'h5)] <<< wire179))) ?
                       ($signed(($signed(wire174) ?
                               $signed(wire174) : (wire176 >> wire113))) ?
                           $unsigned(({reg175,
                               wire114} ~^ wire180[(4'h9):(2'h2)])) : wire174[(2'h3):(1'h0)]) : wire174[(4'h8):(3'h4)]);
  assign wire183 = $unsigned(reg175[(4'ha):(2'h3)]);
  always
    @(posedge clk) begin
      reg184 <= ($unsigned(($unsigned(reg175) << (wire176[(2'h3):(2'h2)] || $signed(wire172)))) ^ $signed(({(8'ha4),
              (wire172 < wire181)} ?
          (~|{wire114, wire176}) : $unsigned($signed(wire111)))));
      reg185 <= {((reg175 ?
              $signed({wire174, reg184}) : $signed({(8'ha8),
                  reg175})) >>> {(wire177 ?
                  wire115[(3'h5):(1'h1)] : $signed(wire179)),
              wire173[(3'h5):(3'h4)]})};
    end
  assign wire186 = ({(8'hb7)} ?
                       (~(wire113[(4'hc):(4'h9)] & (&(wire177 ?
                           wire112 : (8'haa))))) : $signed(wire181));
  assign wire187 = wire183;
  assign wire188 = (~&wire179[(2'h2):(2'h2)]);
  assign wire189 = $signed((~(wire111[(1'h0):(1'h0)] >>> $unsigned((wire172 ?
                       wire114 : wire180)))));
  assign wire190 = ($unsigned(wire113[(3'h4):(1'h0)]) ?
                       $signed(((~reg175[(3'h6):(3'h4)]) ?
                           $signed((wire179 ? wire113 : wire189)) : (~(wire187 ?
                               wire187 : wire183)))) : (8'hbe));
  assign wire191 = $signed(wire112[(3'h5):(3'h4)]);
  module192 #() modinst234 (wire233, clk, wire179, reg175, wire181, wire170, wire191);
  module235 #() modinst271 (.wire239(wire190), .wire240(wire177), .wire236(reg175), .wire238(wire191), .wire237(wire173), .clk(clk), .y(wire270));
endmodule

module module26
#(parameter param96 = (((~|{((8'hb9) << (7'h43)), {(8'hbe)}}) ? {((!(8'hbe)) ? {(8'ha9), (8'h9e)} : ((8'hba) <= (8'h9f))), (8'ha2)} : (((^~(8'h9f)) ? (^~(8'h9e)) : (!(8'hb4))) ^~ (8'hab))) ? {({((8'hb5) <<< (8'hb7))} ? (^(~|(8'ha2))) : (~&{(8'haa)}))} : (((~&(~&(8'h9c))) & (~((8'ha1) ? (8'hb5) : (8'haa)))) ? {((&(8'hb3)) ? (8'hb7) : ((8'hb9) * (8'ha2)))} : ((((8'hb1) ? (8'hb2) : (8'ha5)) ^ ((8'hba) & (8'haf))) ^~ ((^~(8'ha3)) ? ((8'hb9) <= (8'hbd)) : {(7'h40)})))), 
parameter param97 = param96)
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h209):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire30;
  input wire signed [(3'h6):(1'h0)] wire29;
  input wire [(2'h2):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  assign y = {wire94,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire34,
                 wire33,
                 wire32,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 (1'h0)};
  assign wire32 = wire31[(1'h0):(1'h0)];
  assign wire33 = (+((~&wire31) ?
                      (wire28[(1'h1):(1'h1)] ?
                          $unsigned($unsigned((8'h9c))) : wire32) : $unsigned(wire32)));
  assign wire34 = (((^(8'hb0)) ?
                      (((wire30 ?
                          wire30 : wire28) <<< $signed(wire27)) < ($unsigned(wire28) != $signed((8'hab)))) : ((!(-(8'ha5))) >> $unsigned((wire32 && wire32)))) & wire30);
  always
    @(posedge clk) begin
      if (({$unsigned($signed(wire34[(3'h5):(1'h0)])),
              (wire29[(3'h4):(3'h4)] >>> ((wire27 ? wire34 : wire27) ?
                  wire29 : wire34))} ?
          ($signed((^$signed(wire33))) ?
              $unsigned($unsigned((-(8'h9e)))) : $signed(wire34)) : $signed((~$unsigned((^~wire32))))))
        begin
          reg35 <= wire27;
          reg36 <= (^wire31);
          reg37 <= (&$unsigned(($unsigned(wire29) == wire30[(3'h4):(2'h3)])));
          reg38 <= wire29[(2'h2):(2'h2)];
        end
      else
        begin
          if ($signed(($unsigned(((-wire30) <= (wire32 ~^ wire30))) && wire29)))
            begin
              reg35 <= {(^~(~&$signed($unsigned(wire30))))};
              reg36 <= wire32;
              reg37 <= (((wire32 ?
                      (wire29[(3'h6):(2'h2)] ?
                          {(8'had)} : wire33[(2'h2):(1'h1)]) : $signed((~|(7'h43)))) ?
                  $signed(wire28[(1'h1):(1'h1)]) : $unsigned(((~(8'hbb)) ?
                      wire34 : (reg35 > wire30)))) ^~ (({(wire28 ?
                          (7'h43) : (8'hb9))} >>> $unsigned((8'hac))) ?
                  (wire32[(4'hd):(4'ha)] ?
                      {$signed(wire30)} : wire32[(1'h0):(1'h0)]) : $signed({(reg38 ?
                          (8'hbb) : wire29),
                      $unsigned(wire30)})));
              reg38 <= ($unsigned(((!wire34) ?
                      $signed($signed(reg37)) : wire31[(4'he):(1'h1)])) ?
                  $unsigned(reg35) : ((8'ha1) ?
                      $signed({{reg37, reg37},
                          (reg37 ? wire33 : wire33)}) : (wire32 ?
                          (~|(7'h41)) : (+{wire32}))));
              reg39 <= $unsigned(wire31[(4'hd):(4'ha)]);
            end
          else
            begin
              reg35 <= reg37[(4'h9):(3'h6)];
              reg36 <= (~reg35);
              reg37 <= {(wire29 ?
                      ($signed(reg37) || ((wire31 ?
                          reg39 : reg38) + (+wire34))) : reg35[(3'h4):(3'h4)])};
            end
          reg40 <= ($signed(((wire28 << $unsigned(wire30)) ?
              (reg38 < (&reg36)) : wire33[(2'h2):(1'h0)])) << wire28);
          reg41 <= ({(((reg35 ? wire29 : (8'hbb)) >>> (^~reg38)) ?
                      (&$signed((8'ha1))) : (|(reg35 ~^ reg36)))} ?
              {{$signed($signed(wire31)),
                      $unsigned($signed((8'hb5)))}} : (7'h43));
          reg42 <= ($signed($signed($signed(reg39))) ?
              wire30 : $unsigned($signed(wire32)));
          reg43 <= (&{wire30[(3'h5):(2'h3)], wire31[(4'ha):(4'h9)]});
        end
    end
  assign wire44 = reg36[(2'h3):(1'h1)];
  assign wire45 = reg43;
  assign wire46 = $signed($signed(wire29));
  assign wire47 = wire45;
  assign wire48 = (($unsigned($unsigned(reg43)) ?
                      wire34[(1'h0):(1'h0)] : (-(reg42[(4'h8):(2'h3)] ^~ $signed(wire29)))) < (8'ha9));
  assign wire49 = ({reg41,
                          (wire30 ?
                              $unsigned({wire34, (8'haf)}) : ((wire44 ?
                                      wire29 : reg38) ?
                                  $unsigned(wire30) : (wire34 ?
                                      wire30 : wire48)))} ?
                      (((7'h42) ? $unsigned($signed(wire30)) : (8'hbc)) ?
                          $signed(wire48[(1'h1):(1'h0)]) : (wire45[(2'h3):(2'h2)] ?
                              $signed(((8'hba) ?
                                  wire46 : wire28)) : (8'hb1))) : {reg43});
  assign wire50 = $signed($unsigned((8'haa)));
  assign wire51 = ($signed(wire34) & wire50[(4'h9):(2'h2)]);
  assign wire52 = wire46[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      if (((wire46 ?
              ($unsigned(wire31[(5'h14):(4'he)]) ?
                  ((reg39 ? wire33 : wire33) ?
                      {reg43,
                          (8'h9c)} : (+reg38)) : (~^(wire28 >>> wire34))) : {(~wire50),
                  (((8'hb8) ~^ wire31) && $unsigned(wire49))}) ?
          reg35[(4'h8):(3'h4)] : (^~{$signed(wire44[(1'h1):(1'h0)]),
              $unsigned((wire34 ? wire27 : reg42))})))
        begin
          reg53 <= wire52[(1'h1):(1'h1)];
          reg54 <= {(wire52 <= ($unsigned($signed(wire44)) ?
                  (^wire33[(1'h1):(1'h0)]) : $signed(wire51[(1'h1):(1'h1)])))};
        end
      else
        begin
          reg53 <= wire29[(3'h5):(1'h0)];
          if ($unsigned(reg53[(3'h4):(1'h0)]))
            begin
              reg54 <= $signed(($signed(wire33[(1'h1):(1'h1)]) && ($signed($unsigned(wire28)) && reg42[(5'h13):(4'h9)])));
            end
          else
            begin
              reg54 <= $signed(((~(reg37[(3'h6):(2'h3)] ?
                      $signed(wire31) : reg42[(5'h13):(5'h11)])) ?
                  $unsigned(wire32[(3'h6):(3'h4)]) : {wire48}));
              reg55 <= {reg36[(2'h2):(1'h1)]};
              reg56 <= wire27;
              reg57 <= $signed(($unsigned($unsigned({wire31, reg40})) ?
                  (~|((wire48 ?
                      wire44 : reg54) < wire34[(3'h7):(3'h6)])) : reg54));
            end
          reg58 <= $signed($signed((({reg36, wire32} ?
                  {reg38, reg56} : (~|reg55)) ?
              ($unsigned(wire46) ^ reg35[(4'ha):(2'h3)]) : ($signed(wire48) ?
                  (reg54 <<< reg40) : $unsigned(reg40)))));
        end
      if (($unsigned((&($signed(reg43) ? (reg36 & wire30) : $signed(reg40)))) ?
          (&$signed($unsigned((~&wire33)))) : ($signed(reg58[(3'h5):(2'h3)]) | $unsigned($signed($unsigned(wire52))))))
        begin
          reg59 <= ($unsigned(($unsigned((~|(7'h42))) ?
              wire31 : ((wire48 < wire46) ?
                  ((8'ha9) ?
                      reg41 : wire30) : (~&wire51)))) | $signed($unsigned((~&(&reg40)))));
          reg60 <= wire44[(4'h8):(3'h4)];
          reg61 <= wire34[(3'h5):(2'h2)];
        end
      else
        begin
          reg59 <= $signed($signed(wire29));
          if (wire33[(1'h0):(1'h0)])
            begin
              reg60 <= reg61[(1'h1):(1'h1)];
            end
          else
            begin
              reg60 <= {$signed((($unsigned((7'h44)) + $signed(reg39)) > reg42[(4'ha):(3'h4)]))};
              reg61 <= ($signed(wire52) <= $unsigned((((reg57 ?
                      reg40 : wire51) >>> $signed(wire51)) ?
                  $unsigned(reg60) : $unsigned((&wire44)))));
              reg62 <= {$unsigned(((wire28 ?
                      $signed((8'ha9)) : (~^wire46)) >>> $signed(reg57)))};
            end
        end
      if ($signed((reg35 ?
          wire52[(1'h0):(1'h0)] : (($unsigned(wire31) ^ wire47[(1'h0):(1'h0)]) ?
              (~|$signed(reg54)) : (!(&reg41))))))
        begin
          reg63 <= (~$signed($signed(reg58)));
        end
      else
        begin
          reg63 <= $signed($signed(((~|wire44) ^ (^~$unsigned(wire30)))));
        end
      if ($signed($unsigned($signed({reg63}))))
        begin
          if ({wire28})
            begin
              reg64 <= ({(&{$signed((8'h9c))}), reg59} ?
                  $unsigned(reg37) : ($unsigned({(wire29 ? reg43 : reg63),
                      (wire27 <= wire34)}) >>> (reg41 < wire32)));
              reg65 <= $signed(wire48);
              reg66 <= (-(!{(wire45[(1'h0):(1'h0)] ?
                      (reg62 ? reg63 : (8'hb9)) : wire31)}));
            end
          else
            begin
              reg64 <= reg38[(1'h0):(1'h0)];
            end
          reg67 <= reg63[(2'h3):(2'h2)];
          reg68 <= $signed(reg61);
          reg69 <= ($signed($signed((wire29 ?
              (8'hba) : (reg62 >>> wire46)))) & (^(!(8'haf))));
          reg70 <= reg67[(3'h4):(1'h1)];
        end
      else
        begin
          reg64 <= ((+reg42) ? $signed((~|wire49[(3'h6):(3'h4)])) : wire49);
          reg65 <= ((&((7'h43) ? $unsigned((reg70 < reg43)) : (~(~^reg59)))) ?
              wire48 : (^(&(reg41[(1'h0):(1'h0)] | ((8'haf) == reg70)))));
          reg66 <= reg69[(4'hf):(2'h3)];
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed((reg66[(3'h4):(1'h1)] ?
          ({wire46, reg69} ?
              {reg38} : $unsigned(reg43)) : ($signed(reg66) << $signed(reg69))))))
        begin
          reg71 <= {$unsigned($signed(reg55[(2'h2):(1'h1)])), reg64};
          reg72 <= $signed(((wire46 >>> reg38[(1'h0):(1'h0)]) ?
              (+($unsigned(wire45) || reg64)) : $unsigned((~&(reg66 << reg36)))));
          reg73 <= (wire47[(4'he):(1'h1)] * reg56[(2'h2):(2'h2)]);
        end
      else
        begin
          reg71 <= reg36[(2'h2):(1'h1)];
        end
      reg74 <= (reg56 == reg56[(2'h2):(1'h1)]);
      reg75 <= {{$signed($signed((^~reg38)))}};
    end
  module76 #() modinst95 (.wire79(reg74), .y(wire94), .wire77(reg65), .clk(clk), .wire81(reg58), .wire80(wire45), .wire78(wire52));
endmodule

module module76
#(parameter param92 = {(^~({(|(8'haf)), (8'had)} >= (~|(-(8'h9c)))))}, 
parameter param93 = param92)
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire81;
  input wire [(4'h8):(1'h0)] wire80;
  input wire signed [(5'h11):(1'h0)] wire79;
  input wire signed [(5'h14):(1'h0)] wire78;
  input wire [(5'h11):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire82;
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 (1'h0)};
  assign wire82 = wire79[(2'h2):(2'h2)];
  assign wire83 = wire78;
  assign wire84 = wire79[(2'h3):(2'h2)];
  assign wire85 = wire84[(1'h0):(1'h0)];
  assign wire86 = (~|(|(~|((wire81 + wire79) ? wire84 : (8'hb7)))));
  assign wire87 = $signed(($unsigned(wire84) ?
                      (wire85[(1'h1):(1'h0)] ~^ (8'hb0)) : $unsigned(((wire81 ?
                              wire82 : wire79) ?
                          (wire84 & wire83) : (wire81 ? wire79 : wire78)))));
  assign wire88 = (~|(^$unsigned(((8'hb7) <= (+wire86)))));
  assign wire89 = (wire84[(4'hd):(4'h8)] ?
                      (wire80 ^ wire84) : $unsigned(wire80[(1'h1):(1'h1)]));
  assign wire90 = wire86;
  assign wire91 = $signed($signed(((8'hb5) <= $unsigned((wire80 ~^ wire86)))));
endmodule

module module235  (y, clk, wire240, wire239, wire238, wire237, wire236);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire240;
  input wire signed [(3'h4):(1'h0)] wire239;
  input wire [(2'h3):(1'h0)] wire238;
  input wire [(5'h13):(1'h0)] wire237;
  input wire [(4'hb):(1'h0)] wire236;
  wire [(4'ha):(1'h0)] wire269;
  wire signed [(5'h14):(1'h0)] wire261;
  wire signed [(4'h9):(1'h0)] wire260;
  wire signed [(5'h15):(1'h0)] wire259;
  reg [(5'h14):(1'h0)] reg268 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg267 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg266 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg265 = (1'h0);
  reg [(3'h5):(1'h0)] reg264 = (1'h0);
  reg [(4'hc):(1'h0)] reg263 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg262 = (1'h0);
  reg [(4'he):(1'h0)] reg258 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg257 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg256 = (1'h0);
  reg [(4'hc):(1'h0)] reg255 = (1'h0);
  reg [(4'hf):(1'h0)] reg254 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg253 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg252 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg251 = (1'h0);
  reg [(5'h15):(1'h0)] reg250 = (1'h0);
  reg [(3'h6):(1'h0)] reg249 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg248 = (1'h0);
  reg [(5'h15):(1'h0)] reg247 = (1'h0);
  reg [(5'h12):(1'h0)] reg246 = (1'h0);
  reg [(4'hd):(1'h0)] reg245 = (1'h0);
  reg [(2'h3):(1'h0)] reg244 = (1'h0);
  reg [(4'hb):(1'h0)] reg243 = (1'h0);
  reg [(4'hf):(1'h0)] reg242 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg241 = (1'h0);
  assign y = {wire269,
                 wire261,
                 wire260,
                 wire259,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg241 <= $signed((8'ha6));
      if ((^$unsigned((^wire240))))
        begin
          reg242 <= ($signed(($signed(reg241) * ($signed(wire237) ?
                  $signed(wire236) : (8'ha2)))) ?
              ((-reg241[(2'h3):(1'h1)]) ?
                  $unsigned($signed((&wire237))) : (reg241 ?
                      reg241 : (^reg241))) : ($signed((!$signed(wire237))) ?
                  wire237[(2'h2):(1'h1)] : ((wire237[(5'h13):(4'ha)] ?
                          (reg241 ?
                              wire240 : (8'hb7)) : wire237[(3'h4):(2'h3)]) ?
                      $signed($signed(reg241)) : ((reg241 >>> wire239) << ((7'h40) || wire240)))));
          reg243 <= $signed(reg242[(3'h5):(3'h5)]);
          reg244 <= (~&(reg242 <<< (+$unsigned($unsigned(reg241)))));
          reg245 <= $signed((($signed((wire238 ? wire236 : wire236)) ?
              {wire237[(4'hb):(4'h8)],
                  ((8'h9f) <<< reg243)} : wire237) >>> reg241[(2'h2):(1'h1)]));
        end
      else
        begin
          reg242 <= $signed(wire236[(4'hb):(1'h1)]);
          reg243 <= wire237[(3'h4):(3'h4)];
          if ((reg241[(3'h4):(2'h2)] ?
              (wire239[(3'h4):(3'h4)] ?
                  reg245[(1'h0):(1'h0)] : (^~wire240)) : {$unsigned(reg241[(1'h0):(1'h0)]),
                  (~|(wire236 ? (^(8'haa)) : {wire240, wire237}))}))
            begin
              reg244 <= ($unsigned(({$signed(reg245)} ?
                      ($signed(reg243) ?
                          (wire238 ?
                              reg245 : reg241) : reg245[(2'h2):(2'h2)]) : $signed($unsigned(reg241)))) ?
                  $signed((8'had)) : (+(&({reg241,
                      wire238} && wire239[(2'h2):(2'h2)]))));
              reg245 <= $unsigned($unsigned((~^(|(wire237 ?
                  reg241 : wire240)))));
              reg246 <= reg242;
              reg247 <= $signed($signed({(wire237[(4'h9):(3'h7)] ^ $signed((8'h9f)))}));
            end
          else
            begin
              reg244 <= ($signed(reg245) ?
                  ($signed((!{(8'ha5), reg245})) < (~|((reg242 ?
                      (8'h9c) : wire239) ~^ $signed(reg246)))) : {reg242[(1'h0):(1'h0)]});
            end
          reg248 <= {(wire237[(4'ha):(4'ha)] | ($unsigned(wire238[(2'h3):(1'h0)]) >>> ((reg244 ?
                      reg247 : reg242) ?
                  reg243 : $signed(reg245))))};
        end
      reg249 <= ({{($unsigned(reg244) + (reg247 ? wire236 : reg247))},
              $unsigned({reg243[(4'h9):(2'h3)]})} ?
          ((wire238[(2'h3):(2'h3)] < $unsigned((^~(8'ha6)))) ^~ (reg246[(3'h4):(2'h3)] == (^$signed(wire238)))) : reg247);
      if ((wire237 ?
          $unsigned(wire237) : (~|(((reg245 ?
              reg242 : wire239) || $signed(wire237)) - wire238[(1'h0):(1'h0)]))))
        begin
          reg250 <= reg248[(4'h8):(1'h0)];
          reg251 <= (wire240 ?
              $unsigned(reg249) : $signed((^~$unsigned(reg242[(1'h0):(1'h0)]))));
          reg252 <= (+reg250[(5'h11):(3'h6)]);
          if (reg248[(3'h6):(3'h4)])
            begin
              reg253 <= {reg247[(2'h2):(1'h1)],
                  (reg241[(2'h3):(2'h3)] ?
                      $unsigned($unsigned(((8'ha8) ^ reg251))) : (7'h41))};
            end
          else
            begin
              reg253 <= $unsigned(({$signed((~|reg247)),
                      (reg253[(4'h8):(1'h0)] && reg250[(4'h8):(3'h7)])} ?
                  reg244[(2'h3):(1'h1)] : reg246));
              reg254 <= $signed(reg253);
            end
        end
      else
        begin
          if ((+reg251))
            begin
              reg250 <= $unsigned($signed($unsigned(reg245)));
              reg251 <= ((!($unsigned(wire238) ?
                  (^~{reg247, (8'hb2)}) : {(reg245 >= reg252),
                      $unsigned(reg249)})) ^~ reg244);
              reg252 <= $unsigned($unsigned(wire240[(3'h6):(3'h5)]));
            end
          else
            begin
              reg250 <= (reg247[(5'h13):(1'h0)] < $signed({{(~reg254),
                      (reg251 <= reg241)}}));
              reg251 <= ((reg247[(5'h11):(1'h1)] ?
                      {reg254[(3'h5):(3'h4)]} : wire239[(3'h4):(1'h1)]) ?
                  wire236 : $signed((reg242[(1'h0):(1'h0)] || ({(8'ha4),
                          reg253} ?
                      ((8'hb3) ? (8'hbe) : reg242) : {reg243}))));
              reg252 <= ($signed(reg254) ?
                  {wire240[(3'h5):(2'h3)]} : $signed($signed(((reg243 ?
                          (8'hbf) : wire236) ?
                      (~^reg246) : {reg244, reg242}))));
            end
          reg253 <= (reg246[(4'hd):(4'hc)] ?
              reg252 : ((8'hac) ? reg242 : (-$signed(reg245[(4'hc):(3'h7)]))));
          reg254 <= reg251[(3'h4):(1'h1)];
          if (reg254[(2'h3):(1'h0)])
            begin
              reg255 <= reg245[(3'h5):(3'h5)];
              reg256 <= reg247;
              reg257 <= (($unsigned(reg256[(1'h1):(1'h1)]) ~^ reg245[(4'ha):(2'h2)]) || (reg248 ?
                  (-$unsigned((reg250 ? reg251 : reg247))) : wire239));
            end
          else
            begin
              reg255 <= {reg250[(5'h12):(4'he)], reg251};
              reg256 <= (~$signed($unsigned(($signed(reg250) == reg241))));
              reg257 <= reg251[(4'h8):(3'h4)];
            end
        end
      reg258 <= reg251;
    end
  assign wire259 = $signed((reg255 == reg251));
  assign wire260 = $signed($unsigned((8'haa)));
  assign wire261 = ($signed($unsigned(reg246)) ?
                       (($signed((wire238 * (8'hbc))) != {$signed(reg243),
                               (reg254 || wire260)}) ?
                           (^~{$signed(wire238),
                               wire236}) : $signed((~^$signed(reg242)))) : ((wire260 ?
                               ((8'ha6) ?
                                   reg258[(3'h6):(2'h2)] : ((8'h9f) ?
                                       (8'h9e) : reg253)) : wire259) ?
                           wire240[(4'ha):(4'h9)] : $unsigned((-reg250[(4'he):(2'h3)]))));
  always
    @(posedge clk) begin
      if ((~(wire240 ?
          $unsigned(wire259) : ((~^$signed(reg254)) ?
              reg241 : ({reg254} ?
                  ((8'ha4) ? wire261 : (8'hab)) : wire260[(2'h2):(2'h2)])))))
        begin
          reg262 <= (^$signed(reg250[(5'h12):(4'hc)]));
          reg263 <= $unsigned((~&$unsigned(wire261[(4'hc):(4'ha)])));
          reg264 <= (8'ha8);
          if ((reg264[(3'h5):(2'h2)] >= $signed(reg250[(2'h2):(1'h0)])))
            begin
              reg265 <= reg246;
            end
          else
            begin
              reg265 <= (~&reg252[(4'h8):(3'h6)]);
              reg266 <= $signed((^$signed(reg243)));
            end
        end
      else
        begin
          reg262 <= ($signed(reg243) ^~ $signed($unsigned((((8'hbc) ?
                  reg252 : reg242) ?
              reg255 : (+wire239)))));
          reg263 <= $unsigned(reg253[(2'h3):(2'h3)]);
          reg264 <= $unsigned(reg248[(3'h4):(2'h2)]);
        end
      reg267 <= ((-(^~$signed(((8'had) ? reg264 : reg265)))) ?
          $signed(($unsigned({(8'hb7), wire236}) ?
              (!(reg253 ?
                  reg253 : wire237)) : (|$unsigned((7'h41))))) : (reg256[(4'hc):(3'h7)] ?
              (^~$signed(reg263)) : reg263[(4'h8):(3'h4)]));
      reg268 <= wire236;
    end
  assign wire269 = reg256;
endmodule

module module192  (y, clk, wire197, wire196, wire195, wire194, wire193);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire197;
  input wire [(4'ha):(1'h0)] wire196;
  input wire [(4'ha):(1'h0)] wire195;
  input wire [(3'h4):(1'h0)] wire194;
  input wire signed [(2'h2):(1'h0)] wire193;
  wire [(2'h3):(1'h0)] wire232;
  wire [(3'h5):(1'h0)] wire231;
  wire [(5'h11):(1'h0)] wire230;
  wire signed [(4'h8):(1'h0)] wire229;
  wire [(5'h12):(1'h0)] wire228;
  wire [(5'h10):(1'h0)] wire227;
  wire [(5'h14):(1'h0)] wire226;
  wire [(4'hb):(1'h0)] wire225;
  wire [(5'h10):(1'h0)] wire224;
  wire [(5'h12):(1'h0)] wire221;
  wire signed [(5'h13):(1'h0)] wire220;
  wire [(5'h15):(1'h0)] wire219;
  wire signed [(5'h12):(1'h0)] wire218;
  wire signed [(5'h13):(1'h0)] wire213;
  wire signed [(5'h11):(1'h0)] wire212;
  wire signed [(5'h15):(1'h0)] wire200;
  wire [(4'hf):(1'h0)] wire199;
  wire [(5'h12):(1'h0)] wire198;
  reg [(5'h12):(1'h0)] reg223 = (1'h0);
  reg [(3'h7):(1'h0)] reg222 = (1'h0);
  reg [(4'ha):(1'h0)] reg217 = (1'h0);
  reg [(5'h14):(1'h0)] reg216 = (1'h0);
  reg [(5'h11):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg211 = (1'h0);
  reg [(4'h8):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg209 = (1'h0);
  reg [(4'hd):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg207 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg206 = (1'h0);
  reg [(4'h8):(1'h0)] reg205 = (1'h0);
  reg [(4'ha):(1'h0)] reg204 = (1'h0);
  reg [(3'h4):(1'h0)] reg203 = (1'h0);
  reg [(4'he):(1'h0)] reg202 = (1'h0);
  reg [(2'h2):(1'h0)] reg201 = (1'h0);
  assign y = {wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire213,
                 wire212,
                 wire200,
                 wire199,
                 wire198,
                 reg223,
                 reg222,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
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
                 (1'h0)};
  assign wire198 = (!wire193[(1'h1):(1'h1)]);
  assign wire199 = (wire196 | $signed($unsigned($signed(wire195))));
  assign wire200 = $unsigned({$unsigned((wire198 ?
                           (wire198 ? wire199 : wire194) : wire196))});
  always
    @(posedge clk) begin
      if ($unsigned({wire196}))
        begin
          reg201 <= wire193;
          reg202 <= (wire194 ~^ wire195[(1'h1):(1'h1)]);
          reg203 <= (&($unsigned((wire195 * ((7'h44) != (8'hb0)))) ?
              $unsigned((wire200 && (reg201 && wire196))) : $unsigned({$unsigned(wire199)})));
          if ((8'hbb))
            begin
              reg204 <= (wire198 ?
                  $unsigned($unsigned($unsigned((^~(8'hb8))))) : ($signed($unsigned($signed(wire196))) < $unsigned({(wire197 ?
                          wire194 : wire199),
                      (|wire195)})));
              reg205 <= $signed(reg202[(4'hc):(4'hc)]);
              reg206 <= reg204[(3'h4):(1'h0)];
              reg207 <= (((reg202[(1'h0):(1'h0)] << ((wire196 == (8'hb5)) ?
                      $signed(reg203) : wire194[(2'h3):(2'h2)])) ?
                  {$unsigned((|reg204)),
                      $unsigned(wire200)} : (reg203[(2'h3):(1'h1)] ?
                      wire193[(1'h0):(1'h0)] : (8'hbd))) + $unsigned({(~^wire194[(2'h2):(2'h2)]),
                  ({(8'ha2), wire196} <<< $signed(wire200))}));
              reg208 <= (~(reg201[(1'h1):(1'h1)] ?
                  $signed(wire200) : $signed($unsigned((~|wire195)))));
            end
          else
            begin
              reg204 <= (reg208 ?
                  ((wire197 * $signed((-reg204))) ^~ (reg204 ?
                      (^~{wire196}) : ($unsigned(reg203) <<< $signed(wire196)))) : {((reg202[(4'ha):(1'h1)] ?
                          reg201[(2'h2):(2'h2)] : (wire197 >> wire197)) >> ((8'haf) ?
                          reg205[(3'h6):(3'h6)] : (8'hb5)))});
              reg205 <= $signed((!$unsigned(($unsigned((8'h9c)) ?
                  (reg202 ? (8'ha3) : (8'hab)) : $unsigned(reg208)))));
              reg206 <= $unsigned($signed(((((8'hbd) ?
                  wire196 : (8'hb2)) * (wire200 ?
                  wire200 : reg202)) >> reg205)));
              reg207 <= ($unsigned($unsigned($unsigned((7'h42)))) ^ (~($unsigned(wire197) ?
                  $unsigned((reg208 ?
                      (8'h9f) : (8'ha4))) : $signed((reg205 << (8'hbd))))));
            end
        end
      else
        begin
          reg201 <= (-(~$signed((reg202 ?
              $signed(reg203) : $signed(wire199)))));
          if ((~|{$signed(reg201[(1'h0):(1'h0)])}))
            begin
              reg202 <= (reg201 <= $unsigned({wire198, (+$signed(reg204))}));
            end
          else
            begin
              reg202 <= wire194;
              reg203 <= (({({reg204,
                      reg206} && (reg204 * (8'hba)))} < $unsigned(((!(8'hae)) >> (8'ha8)))) <<< reg203[(3'h4):(3'h4)]);
              reg204 <= wire198;
            end
          reg205 <= (+wire200[(5'h15):(1'h0)]);
        end
      reg209 <= $signed(($unsigned(($unsigned(wire196) <<< wire200[(5'h14):(1'h0)])) ?
          wire194[(3'h4):(2'h3)] : $unsigned((7'h40))));
      reg210 <= ({$signed(reg201[(1'h1):(1'h0)]), reg207[(3'h5):(3'h4)]} ?
          (~{(reg204[(2'h2):(1'h1)] ? reg202 : (wire200 ? (8'ha5) : wire200)),
              ($unsigned(reg208) ?
                  (wire197 ^~ wire196) : (!reg208))}) : (reg206 <<< reg206));
      reg211 <= wire194[(3'h4):(2'h3)];
    end
  assign wire212 = ((+{($unsigned(wire196) | $signed(wire198)),
                           ({wire193, (7'h42)} && (reg204 ?
                               reg201 : wire195))}) ?
                       ({$unsigned($signed(wire200)), reg209} ~^ ((~(wire200 ?
                           wire195 : wire198)) >= ({reg207,
                           wire200} * reg207[(4'hd):(4'hc)]))) : (~|((reg202[(3'h6):(1'h0)] < {wire197,
                               wire196}) ?
                           reg207[(4'he):(4'h9)] : ($unsigned(wire195) >= (!wire197)))));
  assign wire213 = (reg204[(2'h3):(2'h3)] ?
                       {reg211[(2'h3):(2'h3)]} : ((+$unsigned(wire212)) ?
                           (8'ha8) : (!$signed(wire212))));
  always
    @(posedge clk) begin
      reg214 <= (wire197[(1'h0):(1'h0)] ?
          $signed({{{wire194}, (~^reg207)},
              reg206}) : $unsigned(((~&(wire212 ~^ wire200)) ?
              $unsigned((|(8'hb3))) : reg205[(2'h2):(1'h0)])));
      reg215 <= {((wire193[(1'h1):(1'h1)] ^ ({(8'h9d), reg203} ?
              reg204 : $unsigned((8'h9e)))) || (8'hab)),
          ({(((8'h9d) > reg210) ? (!reg205) : (|reg204))} ?
              {reg202,
                  (((8'ha5) && reg202) >>> $unsigned(reg201))} : $unsigned($signed(wire194[(2'h3):(2'h3)])))};
      reg216 <= $signed($signed($signed((wire198[(4'ha):(4'h8)] ?
          (reg211 <= reg206) : reg205))));
      reg217 <= reg210;
    end
  assign wire218 = wire197[(4'he):(4'h9)];
  assign wire219 = {((&(|{wire213, reg207})) || $unsigned($signed((wire212 ?
                           reg204 : reg208))))};
  assign wire220 = (^~$unsigned(wire212[(3'h4):(3'h4)]));
  assign wire221 = wire194[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg222 <= wire221[(5'h12):(4'hc)];
      reg223 <= $signed($signed({($signed(reg209) >> $signed(reg207)),
          $unsigned(((8'h9d) ? reg209 : wire212))}));
    end
  assign wire224 = (((~|(-{wire213, wire213})) ?
                           {wire197[(3'h6):(1'h0)], (-(^reg208))} : reg208) ?
                       ($unsigned(((&wire218) ?
                               (reg203 * wire194) : (^~reg214))) ?
                           {$signed(reg206[(2'h2):(2'h2)]),
                               $unsigned($signed(wire212))} : $unsigned((wire199[(1'h0):(1'h0)] || (~^reg205)))) : wire193[(1'h1):(1'h1)]);
  assign wire225 = ($signed(($signed($unsigned(reg206)) << reg204)) ?
                       $signed($signed(wire197)) : $signed(reg216[(5'h11):(5'h10)]));
  assign wire226 = reg204;
  assign wire227 = $unsigned((~{$signed((wire224 || wire219))}));
  assign wire228 = $signed($unsigned(reg207));
  assign wire229 = $signed(reg214[(3'h4):(2'h2)]);
  assign wire230 = ($signed(wire193) >>> ({wire213,
                           ({wire193, (8'hac)} || $signed(wire228))} ?
                       $unsigned(reg209) : reg223[(1'h1):(1'h0)]));
  assign wire231 = (^(-wire224));
  assign wire232 = $unsigned(reg202);
endmodule

module module116
#(parameter param168 = {(((~((8'hae) ^ (7'h40))) - ((^(8'hba)) | (!(8'hae)))) ? {({(8'hb4), (7'h44)} ^~ {(8'ha4)}), (((8'ha6) <<< (8'ha9)) ^~ ((8'hbd) ? (8'hb9) : (8'ha9)))} : ({(+(8'ha2))} | (-((7'h42) ? (8'h9d) : (8'ha8)))))}, 
parameter param169 = ((~&(param168 ? ((-param168) ? param168 : (param168 ? param168 : param168)) : {((8'hbf) ? param168 : param168), (param168 ? (8'hb6) : param168)})) ? (param168 ? (~|((8'h9d) ~^ param168)) : param168) : ((~&((param168 & param168) ? (8'hb1) : (param168 ^ param168))) ? {{(param168 ? (8'ha7) : param168), (&param168)}, (^{(8'hb2), (8'hb5)})} : (param168 ? param168 : (~|(param168 >= param168))))))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h219):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire120;
  input wire signed [(4'hd):(1'h0)] wire119;
  input wire [(5'h11):(1'h0)] wire118;
  input wire signed [(4'h8):(1'h0)] wire117;
  wire [(5'h12):(1'h0)] wire167;
  wire signed [(5'h14):(1'h0)] wire166;
  wire signed [(5'h11):(1'h0)] wire165;
  wire signed [(3'h6):(1'h0)] wire164;
  wire [(3'h6):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire162;
  wire [(2'h2):(1'h0)] wire161;
  wire [(5'h15):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire148;
  wire signed [(4'hc):(1'h0)] wire125;
  wire signed [(4'hc):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire123;
  wire [(3'h6):(1'h0)] wire122;
  wire [(3'h6):(1'h0)] wire121;
  reg [(5'h10):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(3'h5):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire148,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
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
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
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
                 (1'h0)};
  assign wire121 = (+wire119);
  assign wire122 = (+(^~wire120));
  assign wire123 = (~wire119);
  assign wire124 = ({(wire118 && (8'h9e))} && (wire118[(2'h3):(2'h3)] ?
                       wire122[(1'h1):(1'h0)] : wire118));
  assign wire125 = ((wire119[(2'h2):(2'h2)] < $unsigned($signed({wire120,
                           (8'h9d)}))) ?
                       (8'ha7) : wire121);
  always
    @(posedge clk) begin
      reg126 <= wire118;
      reg127 <= $signed((wire121[(2'h2):(2'h2)] ?
          (reg126 ?
              ($unsigned(wire118) * wire121) : wire120) : $unsigned($signed($signed(wire118)))));
      if ($unsigned($unsigned(wire123)))
        begin
          reg128 <= $signed($unsigned($signed($signed((!wire125)))));
          if (wire119[(3'h5):(1'h0)])
            begin
              reg129 <= wire123[(3'h6):(3'h5)];
              reg130 <= (~reg126);
              reg131 <= $unsigned(($signed((^~wire117)) > (wire124[(4'ha):(1'h1)] ?
                  {$signed((8'haf))} : (wire118 ?
                      $unsigned(wire124) : {reg130}))));
              reg132 <= ($unsigned($unsigned(wire117)) ?
                  $unsigned((~^wire119[(4'ha):(2'h3)])) : (8'hbf));
            end
          else
            begin
              reg129 <= $unsigned(reg129);
              reg130 <= $signed(wire121);
            end
        end
      else
        begin
          if ((7'h43))
            begin
              reg128 <= (~&$signed(wire120));
            end
          else
            begin
              reg128 <= $signed(((($unsigned(reg132) ?
                  (&reg128) : $signed(wire120)) & reg127) == $signed(($signed(wire119) ?
                  $unsigned((8'h9e)) : $unsigned((8'hbd))))));
              reg129 <= $signed(wire121[(3'h5):(3'h4)]);
              reg130 <= $unsigned((&(wire123[(3'h5):(2'h3)] ?
                  $signed(wire125[(4'h9):(3'h5)]) : ((8'hb2) ?
                      (wire123 ? wire117 : reg126) : (~wire121)))));
            end
          reg131 <= $signed(reg128[(4'ha):(3'h4)]);
        end
      if (wire117[(1'h1):(1'h1)])
        begin
          reg133 <= (($signed(((wire121 << wire117) + $unsigned(wire120))) ?
              wire122 : reg127) != {reg129});
          reg134 <= $signed($signed((~(wire124 & (wire118 & wire119)))));
        end
      else
        begin
          if (reg126[(4'h9):(1'h1)])
            begin
              reg133 <= reg131;
              reg134 <= $signed({($signed((+reg131)) < {$signed(wire117)})});
              reg135 <= $signed({reg127, ({{(8'hb9)}} * reg133)});
              reg136 <= (($unsigned((-(wire125 ?
                      wire119 : (8'hb7)))) >>> wire120[(1'h0):(1'h0)]) ?
                  $unsigned(({$unsigned(wire117),
                      wire123} < wire119)) : $signed((~$unsigned(wire119[(3'h7):(3'h4)]))));
            end
          else
            begin
              reg133 <= (wire124[(1'h0):(1'h0)] + {(~&wire122)});
              reg134 <= reg133;
              reg135 <= wire123;
            end
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed((((!wire117) | (reg134 || wire124)) - ($signed(reg131) ?
          reg133[(2'h2):(2'h2)] : $unsigned((8'ha4)))))))
        begin
          reg137 <= (((reg127 ? $signed(reg135) : wire117[(2'h3):(2'h2)]) ?
              $signed(($unsigned(wire124) ^~ wire117[(3'h5):(1'h1)])) : reg135) >> (wire124 ?
              $unsigned(((reg136 ?
                  reg133 : wire118) >>> $signed(reg127))) : ($unsigned(reg135[(2'h3):(2'h3)]) ^~ (-(wire117 ?
                  wire124 : (8'hbb))))));
          reg138 <= ((!$signed($signed((~^reg134)))) ?
              $signed($unsigned($signed($signed(reg135)))) : {(|reg126),
                  {$unsigned($unsigned(reg127))}});
          reg139 <= (~^reg133[(1'h1):(1'h1)]);
          reg140 <= (~|$unsigned($unsigned((wire122[(3'h5):(1'h1)] || (8'ha3)))));
        end
      else
        begin
          reg137 <= wire120;
        end
      if (wire125)
        begin
          reg141 <= reg130[(4'hb):(1'h1)];
          if (($signed({({reg129, (7'h44)} ?
                  $signed((7'h44)) : (^(8'hb8)))}) >= ($unsigned((~reg128[(3'h7):(3'h5)])) ?
              wire118[(1'h1):(1'h1)] : (~|((reg127 ^~ reg136) ?
                  (reg137 ? (8'hb5) : (8'ha0)) : $signed(reg137))))))
            begin
              reg142 <= {$unsigned(reg126[(1'h1):(1'h1)])};
              reg143 <= (~$signed(($signed($signed(reg136)) <<< wire122)));
              reg144 <= $unsigned((-$unsigned((reg133 ?
                  {reg137, wire117} : reg135[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg142 <= {($unsigned({$signed((8'hb1))}) ~^ {(~&reg139[(2'h2):(1'h0)])}),
                  (($unsigned(wire125[(3'h5):(1'h1)]) > (~|reg138)) ?
                      (($unsigned(reg128) ? reg127 : reg137) ?
                          wire121 : $signed((reg127 - reg127))) : ((~|(-wire122)) ?
                          $signed((^~reg126)) : (reg141 ?
                              {wire122} : {reg141})))};
            end
          reg145 <= ((wire117 ?
              ($signed((wire121 ? reg138 : wire121)) == (reg140[(4'hd):(3'h6)] ?
                  (reg143 && wire124) : wire119)) : reg141) ^~ wire117[(1'h1):(1'h0)]);
          reg146 <= $signed($signed(reg127[(3'h4):(2'h2)]));
          reg147 <= $signed($unsigned($unsigned(((reg139 ~^ (8'h9c)) ?
              reg135[(3'h5):(2'h3)] : {reg139}))));
        end
      else
        begin
          reg141 <= wire120;
          reg142 <= $unsigned(reg131[(4'h8):(2'h3)]);
        end
    end
  assign wire148 = reg145[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg149 <= (!{(~{(&reg128), $unsigned(reg133)}),
          ($unsigned($signed((8'hbe))) | $signed(reg143))});
      reg150 <= ($signed(reg140) ^~ (reg129[(5'h10):(4'h9)] ?
          $unsigned(($signed(reg140) != (reg134 && reg143))) : (reg143 ?
              reg146 : ($signed((8'ha2)) != ((8'ha2) <<< wire120)))));
      if (reg137)
        begin
          if ((reg144[(2'h3):(2'h2)] || reg130))
            begin
              reg151 <= wire118[(2'h3):(1'h0)];
              reg152 <= wire118;
              reg153 <= (reg146[(1'h0):(1'h0)] << ((^((wire124 >= reg126) <<< (reg140 ?
                  reg128 : reg126))) ^~ wire117));
            end
          else
            begin
              reg151 <= $unsigned(reg149);
            end
          reg154 <= wire119;
        end
      else
        begin
          reg151 <= reg139[(3'h4):(1'h1)];
          reg152 <= {$unsigned(($signed(reg147[(2'h3):(1'h0)]) * $unsigned($unsigned(reg137))))};
          if ($unsigned(((reg138 ?
              (~$signed(reg151)) : $signed((wire117 ?
                  reg144 : reg127))) == (|reg144[(3'h4):(3'h4)]))))
            begin
              reg153 <= reg136[(2'h2):(1'h1)];
              reg154 <= $unsigned((^~((~^$unsigned(reg126)) ?
                  (^(wire119 << (8'hbb))) : {reg147[(2'h3):(2'h2)],
                      ((8'hb4) >>> reg154)})));
              reg155 <= $signed((reg154 ? $unsigned((~&(~&reg142))) : reg130));
              reg156 <= $signed((^~(~^{wire124, wire124[(3'h5):(1'h0)]})));
              reg157 <= (($unsigned($unsigned($signed(reg134))) ?
                      $signed($unsigned($unsigned(reg138))) : (-reg142)) ?
                  $signed($unsigned((&(8'ha1)))) : reg128[(1'h1):(1'h0)]);
            end
          else
            begin
              reg153 <= (($signed((&reg128[(4'hb):(4'h8)])) ?
                  {reg155[(4'h9):(2'h3)]} : reg141) ^~ $unsigned({reg151,
                  $signed({reg151})}));
              reg154 <= $signed((~&reg136[(2'h3):(1'h0)]));
            end
          reg158 <= {{reg140[(5'h11):(3'h6)]}, reg142};
          reg159 <= reg138;
        end
    end
  assign wire160 = reg141;
  assign wire161 = $unsigned((($signed((reg158 ?
                       wire122 : reg159)) < (&(wire124 ?
                       reg130 : reg134))) && reg156[(4'he):(3'h5)]));
  assign wire162 = (~|(^~$unsigned((~&$unsigned((8'h9c))))));
  assign wire163 = $unsigned(reg141[(4'h8):(3'h7)]);
  assign wire164 = (~&wire161[(1'h1):(1'h1)]);
  assign wire165 = (((~^reg153[(4'hf):(3'h4)]) & $unsigned((reg138 ?
                       {reg128} : {wire118}))) & $unsigned((reg131[(3'h7):(1'h0)] ?
                       (+reg152) : $unsigned($signed((7'h40))))));
  assign wire166 = reg128;
  assign wire167 = ($unsigned((wire117 != {(reg138 ?
                           reg154 : reg149)})) | wire120);
endmodule
