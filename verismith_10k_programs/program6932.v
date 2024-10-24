module top
#(parameter param125 = (-({(&(!(8'hae))), ((!(8'hab)) ? (~^(8'h9f)) : ((8'had) & (7'h40)))} != ((+((8'ha4) ? (8'hb1) : (8'ha0))) ? (((8'had) ? (8'hae) : (8'ha5)) ? (|(7'h40)) : {(8'haf), (8'haf)}) : (((8'hba) ? (8'h9d) : (8'h9c)) ? ((7'h42) ^ (8'h9d)) : (&(8'ha9)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire123;
  wire signed [(4'h9):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire120;
  wire signed [(3'h7):(1'h0)] wire119;
  wire [(2'h2):(1'h0)] wire118;
  wire signed [(5'h11):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire116,
                 wire5,
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
                 (1'h0)};
  assign wire5 = {$unsigned(wire1)};
  always
    @(posedge clk) begin
      reg6 <= {$unsigned(wire1)};
      reg7 <= wire1[(3'h5):(3'h4)];
    end
  always
    @(posedge clk) begin
      if ($unsigned((~(reg6[(3'h7):(3'h4)] ? {$unsigned((8'hb5))} : wire5))))
        begin
          reg8 <= (wire4[(1'h1):(1'h0)] == $unsigned(((+((8'ha6) ?
                  wire0 : reg7)) ?
              ($signed(wire5) << (reg7 ? reg6 : reg6)) : $signed((reg6 ?
                  reg6 : wire2)))));
          reg9 <= ({$signed({wire0}),
                  {$signed((~^wire0)), ($unsigned(wire4) & $signed(wire1))}} ?
              $unsigned({$unsigned(reg8)}) : wire1);
          if ((wire4 ?
              {reg7[(2'h3):(1'h1)]} : $signed($signed((-(wire5 <= wire5))))))
            begin
              reg10 <= $signed($unsigned($unsigned({wire2[(2'h2):(2'h2)],
                  wire3})));
              reg11 <= (~^wire2);
              reg12 <= ((-wire2[(2'h3):(2'h3)]) ?
                  (^~$signed(reg8)) : $unsigned(wire5[(5'h10):(4'hc)]));
              reg13 <= ($signed((reg6[(1'h0):(1'h0)] ?
                  {$signed((8'haf))} : (+$signed(reg6)))) & (reg6 == wire1));
              reg14 <= ({(8'hb7)} ?
                  ($signed({(reg8 < wire0), wire0[(2'h3):(2'h2)]}) ?
                      {reg7, reg6[(5'h14):(4'hc)]} : ({reg12[(4'hb):(3'h7)]} ?
                          (reg11[(1'h1):(1'h1)] ?
                              (reg9 >= reg7) : (wire5 ?
                                  (7'h41) : reg11)) : $signed(wire3))) : (~&((~$signed(wire5)) * $signed((~(8'hae))))));
            end
          else
            begin
              reg10 <= wire5;
              reg11 <= ($signed({$signed(reg6),
                  ($unsigned(reg7) << reg10)}) >>> $unsigned({$signed((^~wire2))}));
            end
        end
      else
        begin
          reg8 <= $unsigned($unsigned(wire2));
        end
      reg15 <= $signed(((~|reg7[(3'h6):(2'h3)]) ^ (&$signed((reg12 != wire0)))));
      reg16 <= (8'hba);
    end
  always
    @(posedge clk) begin
      if ($unsigned((8'h9d)))
        begin
          reg17 <= (!wire0);
          reg18 <= (~&$signed(wire5[(1'h0):(1'h0)]));
          reg19 <= wire1;
          reg20 <= (8'h9d);
          reg21 <= {wire3};
        end
      else
        begin
          if ($unsigned(((reg8[(5'h10):(5'h10)] ?
                  {reg7[(2'h3):(1'h0)],
                      $unsigned((8'ha1))} : $unsigned((~&reg12))) ?
              $signed($unsigned($signed((8'ha2)))) : (|$signed($unsigned(wire2))))))
            begin
              reg17 <= (((reg20 ?
                      $unsigned({reg8}) : ($unsigned(reg11) ?
                          {wire1, reg21} : (!reg16))) != ((wire2 | (wire3 ?
                          (8'hbd) : reg8)) ?
                      {reg6} : {$signed(reg6)})) ?
                  $signed(($unsigned($signed(reg19)) > (reg12[(5'h12):(5'h12)] ?
                      ((8'ha4) ~^ wire4) : {wire4,
                          wire2}))) : (^~$unsigned(reg18[(3'h7):(1'h0)])));
              reg18 <= ($unsigned($unsigned((-$unsigned(wire2)))) ?
                  reg12[(4'ha):(3'h4)] : ($unsigned(reg18) ?
                      reg15[(5'h13):(5'h12)] : (((wire4 ^ wire2) ?
                              (reg19 ~^ reg6) : $unsigned(reg13)) ?
                          $signed($signed(wire1)) : reg16[(2'h3):(1'h0)])));
              reg19 <= (!reg20[(4'h8):(3'h6)]);
              reg20 <= ($unsigned((wire5[(4'he):(4'hb)] <= ((wire3 > reg8) ?
                  (reg8 ^~ wire2) : (reg21 ?
                      (8'hb0) : wire4)))) << (((-reg14[(2'h3):(2'h3)]) || ($signed(wire0) >= reg14[(1'h1):(1'h0)])) || $unsigned((~&reg19[(4'hb):(2'h2)]))));
              reg21 <= $unsigned($signed(reg18));
            end
          else
            begin
              reg17 <= reg19;
              reg18 <= ($unsigned(((8'hae) ?
                  reg15 : (^(reg13 == wire0)))) | $unsigned(($unsigned(reg19) << reg16)));
              reg19 <= wire4;
              reg20 <= ({($unsigned($signed(reg7)) > {wire5,
                          reg8[(4'hc):(3'h6)]}),
                      reg6[(4'ha):(3'h4)]} ?
                  {((~(reg10 ? wire5 : wire1)) >>> (8'hbc)),
                      $signed({(8'ha9), (reg15 ? reg14 : reg14)})} : (~|(reg16 ?
                      $signed((+wire3)) : reg21)));
            end
          reg22 <= reg20;
          reg23 <= (^~reg19);
        end
      reg24 <= reg15[(4'h8):(3'h5)];
    end
  module25 #() modinst117 (.wire29(reg12), .wire28(reg20), .wire30(reg6), .clk(clk), .y(wire116), .wire27(reg15), .wire26(reg19));
  assign wire118 = (reg22 + reg17[(4'h8):(3'h6)]);
  assign wire119 = (((reg8[(3'h4):(1'h0)] ?
                               (~&reg8) : $unsigned(reg14[(1'h0):(1'h0)])) ?
                           ($unsigned(reg10[(3'h4):(2'h2)]) ?
                               ({reg9} >> (reg23 + reg13)) : wire3) : (((-reg23) ?
                               $unsigned(reg12) : (reg7 ~^ wire1)) * (reg13[(3'h4):(3'h4)] & (reg18 ^ (8'ha2))))) ?
                       $signed($unsigned(reg14)) : (reg7 > wire1[(4'hb):(4'ha)]));
  assign wire120 = wire1[(5'h14):(4'h8)];
  assign wire121 = $signed(($unsigned((^~(reg22 ~^ wire116))) | wire116[(4'h9):(3'h4)]));
  assign wire122 = (8'hb5);
  assign wire123 = $signed((~(~&(^~$signed(reg19)))));
  assign wire124 = (((wire3 || (reg8[(2'h2):(1'h0)] ?
                               $signed(wire4) : reg16[(1'h1):(1'h0)])) ?
                           {(reg6[(5'h14):(4'h8)] != reg17[(3'h4):(2'h3)]),
                               $signed((|reg16))} : (({reg9} ?
                               {reg8, (8'ha9)} : ((8'ha4) ?
                                   reg18 : reg6)) <<< $unsigned((~reg13)))) ?
                       $unsigned(reg16[(1'h0):(1'h0)]) : (reg21 >>> (($unsigned((8'ha0)) ?
                           $signed(reg7) : (reg19 ? wire2 : wire1)) <= reg18)));
endmodule

module module25
#(parameter param115 = {(~&(((|(8'haa)) < ((8'hb6) <= (8'hab))) <<< (~^(~(8'hb3))))), (&((((8'ha8) || (7'h40)) ? {(7'h40), (8'hb6)} : ((8'hbc) ? (8'hae) : (8'ha1))) >> (((8'hbe) ? (8'hb9) : (8'hb1)) ? ((8'hbd) ~^ (8'ha0)) : (8'haa))))})
(y, clk, wire26, wire27, wire28, wire29, wire30);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire26;
  input wire signed [(4'hc):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire29;
  input wire signed [(3'h4):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire113;
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  assign y = {wire31,
                 wire32,
                 wire33,
                 wire39,
                 wire81,
                 wire83,
                 wire84,
                 wire113,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire31 = {$unsigned(({$signed(wire26),
                          wire29[(1'h1):(1'h1)]} >= wire29[(1'h0):(1'h0)]))};
  assign wire32 = wire27;
  assign wire33 = (~wire29);
  always
    @(posedge clk) begin
      reg34 <= $signed($unsigned(((!(wire30 ~^ (8'ha3))) + $signed($signed(wire29)))));
      reg35 <= ({($unsigned(wire27) <= $signed({wire29}))} ^~ $signed(wire27[(4'ha):(1'h0)]));
      reg36 <= wire33[(1'h1):(1'h0)];
      reg37 <= wire28;
      reg38 <= wire32[(1'h1):(1'h0)];
    end
  assign wire39 = $signed($unsigned($unsigned($signed($unsigned(wire28)))));
  module40 #() modinst82 (wire81, clk, wire33, reg36, wire26, reg37);
  assign wire83 = ((7'h40) ?
                      ((|$signed($unsigned(reg36))) < wire31[(4'hc):(4'hc)]) : wire29);
  assign wire84 = ($signed((7'h41)) ~^ wire30[(1'h0):(1'h0)]);
  module85 #() modinst114 (wire113, clk, wire81, reg37, wire29, reg34, wire83);
endmodule

module module85
#(parameter param111 = ((+({((8'ha1) ? (8'hbe) : (8'ha8)), (~&(8'hb8))} == ((+(8'hb9)) ? {(8'hac)} : ((8'hb2) << (8'h9f))))) ? (((|(!(8'hbb))) ? {{(7'h41)}, (~(8'ha3))} : {((8'hbd) > (8'hab)), (^(8'hb6))}) >= ({((8'hbe) & (8'ha9))} >> {((8'hb6) <= (8'hbf))})) : ({(((8'hba) ? (7'h41) : (8'hb2)) ? ((8'hb3) >> (8'hb1)) : ((8'hb1) ? (8'hbd) : (8'hb0))), {((8'hb5) ? (8'ha3) : (8'ha1))}} ? (~&(8'hb4)) : ((((8'ha9) ^~ (7'h41)) == (~|(8'ha6))) <= ((~^(7'h42)) ? {(8'hb4), (8'had)} : (^(8'h9f)))))), 
parameter param112 = (-((((~&param111) ? (param111 ? param111 : param111) : {param111}) <<< {param111}) ? ((^~(param111 ^ param111)) ? ((~|param111) ? param111 : param111) : param111) : {(+(param111 ^~ param111))})))
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire90;
  input wire [(4'hf):(1'h0)] wire89;
  input wire signed [(4'h8):(1'h0)] wire88;
  input wire [(4'hb):(1'h0)] wire87;
  input wire [(2'h3):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire104;
  wire signed [(5'h11):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire104,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire91 = $signed(wire89);
  assign wire92 = $unsigned((-(($unsigned(wire91) ?
                      wire87 : wire90[(2'h3):(1'h1)]) != (^~(!wire91)))));
  assign wire93 = (+wire90[(3'h5):(2'h3)]);
  assign wire94 = (~|$unsigned((&({(8'h9f), wire88} >>> (wire92 | wire86)))));
  assign wire95 = wire94[(4'hf):(4'hd)];
  assign wire96 = $signed(($unsigned($signed($unsigned(wire94))) & $unsigned($unsigned(wire93))));
  assign wire97 = wire88[(3'h4):(1'h0)];
  assign wire98 = ((8'hb1) >>> (($signed((wire91 & wire91)) ^ (~&(!(8'hbc)))) + (wire95 || {wire90})));
  assign wire99 = $signed($unsigned({($unsigned(wire91) ?
                          $unsigned(wire86) : {wire93, wire91})}));
  always
    @(posedge clk) begin
      reg100 <= (~|((!{wire86[(1'h0):(1'h0)]}) && (($signed(wire94) || (!(8'hb1))) ?
          (^{wire95, wire99}) : wire97)));
      reg101 <= wire91[(1'h1):(1'h1)];
      reg102 <= wire96;
      reg103 <= (8'hb3);
    end
  assign wire104 = (wire87[(2'h2):(1'h0)] == (-wire89));
  always
    @(posedge clk) begin
      reg105 <= wire88[(1'h0):(1'h0)];
      if (wire93[(2'h2):(2'h2)])
        begin
          reg106 <= {wire86};
          reg107 <= $unsigned(wire93[(2'h2):(1'h0)]);
          reg108 <= $unsigned($unsigned($unsigned($unsigned(wire95[(4'hc):(3'h4)]))));
        end
      else
        begin
          reg106 <= $unsigned((|(reg101 ?
              (^~$unsigned((8'haf))) : (~&wire92[(2'h2):(1'h0)]))));
          reg107 <= {reg103,
              (((wire86[(2'h3):(1'h0)] ?
                          (wire96 || wire104) : reg105[(3'h5):(3'h5)]) ?
                      (-(wire88 ? wire99 : wire97)) : ($unsigned(wire87) ?
                          {(8'hac)} : wire99[(3'h5):(1'h1)])) ?
                  (($signed((8'ha7)) <<< {wire89}) ?
                      ((wire88 + (8'h9e)) ?
                          (~|reg101) : (8'h9d)) : reg102[(1'h0):(1'h0)]) : {wire93,
                      $unsigned($signed(wire95))})};
        end
    end
  assign wire109 = wire88[(3'h7):(3'h7)];
  assign wire110 = $unsigned(((^(!(wire97 > wire91))) ?
                       wire97[(3'h7):(2'h3)] : (~&$unsigned((-wire91)))));
endmodule

module module40
#(parameter param80 = (-{(^~{((8'ha0) << (7'h40))}), (^(((8'h9f) ? (8'hbf) : (8'ha2)) >= (|(8'hb8))))}))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire44;
  input wire signed [(5'h10):(1'h0)] wire43;
  input wire [(4'hf):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire46;
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire64,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire46,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg63,
                 reg62,
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
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg45 <= $unsigned((8'h9c));
    end
  assign wire46 = $unsigned({$unsigned(wire43),
                      $unsigned((-(reg45 > wire42)))});
  always
    @(posedge clk) begin
      reg47 <= ($signed($unsigned((~&wire43[(5'h10):(2'h2)]))) ?
          $unsigned($signed(($unsigned(wire43) ?
              reg45 : ((8'hab) ? (8'hbe) : (7'h40))))) : {reg45});
      reg48 <= $signed($signed($signed(wire41)));
      reg49 <= reg47;
    end
  always
    @(posedge clk) begin
      reg50 <= reg45[(1'h1):(1'h1)];
      if ($signed((~$signed(wire46[(2'h3):(2'h2)]))))
        begin
          reg51 <= ($unsigned($signed(wire43)) <= $unsigned((($unsigned(reg47) ?
                  reg50 : wire44) ?
              $signed((~|reg47)) : (reg45 ?
                  $signed(wire42) : {reg50, reg45}))));
          reg52 <= (($unsigned($unsigned($signed(reg47))) || (^{(-(8'ha6)),
                  (~^reg48)})) ?
              reg47[(1'h0):(1'h0)] : wire46[(4'h8):(2'h3)]);
          reg53 <= ($signed(reg48[(2'h2):(2'h2)]) ?
              (($signed(wire46) > reg48[(3'h4):(2'h3)]) == reg52[(1'h0):(1'h0)]) : reg48[(4'hb):(3'h6)]);
          reg54 <= (wire42[(3'h5):(1'h0)] ?
              $unsigned(wire44) : (-reg49[(4'hd):(1'h1)]));
        end
      else
        begin
          reg51 <= $signed(reg48[(3'h7):(3'h5)]);
        end
      reg55 <= $signed((8'hae));
      reg56 <= reg49;
      reg57 <= wire41[(3'h5):(3'h5)];
    end
  assign wire58 = $unsigned((-reg55));
  assign wire59 = $unsigned($signed(wire58[(1'h0):(1'h0)]));
  assign wire60 = reg53[(1'h0):(1'h0)];
  assign wire61 = (wire42[(4'h8):(3'h4)] ? reg56[(4'hf):(4'he)] : {(8'ha8)});
  always
    @(posedge clk) begin
      reg62 <= $unsigned($unsigned(((&(wire44 ? reg54 : wire58)) ?
          $unsigned($signed(reg45)) : reg52[(1'h1):(1'h1)])));
      reg63 <= wire41;
    end
  assign wire64 = {$signed($unsigned($unsigned((|reg57)))), (8'haa)};
  always
    @(posedge clk) begin
      if ((8'hb0))
        begin
          reg65 <= (&wire41);
          reg66 <= reg49;
          reg67 <= ((8'hb3) ?
              $signed((((~^(8'haa)) ?
                  {(8'h9e),
                      wire46} : (~^reg66)) ^~ ((reg53 != reg65) < $signed(wire43)))) : ($signed((~reg55)) ?
                  (!$unsigned((reg52 >= reg54))) : (reg45[(3'h4):(2'h2)] << reg66)));
          reg68 <= ((8'ha6) ?
              reg66[(4'ha):(1'h1)] : ($signed($unsigned(wire60)) + $signed(((+wire42) ?
                  (reg55 ^~ reg50) : $unsigned(reg51)))));
        end
      else
        begin
          reg65 <= {(8'haa)};
          if ((~&wire64[(2'h3):(2'h3)]))
            begin
              reg66 <= {($signed((reg57[(3'h7):(2'h2)] ?
                      (reg66 ?
                          (8'hbc) : wire61) : $signed((7'h44)))) ~^ (!(^(~^wire60)))),
                  reg65[(4'hb):(4'hb)]};
              reg67 <= $signed((~|{(+(^reg45))}));
              reg68 <= ((+(reg56[(3'h7):(3'h4)] >> (8'ha3))) | $unsigned((reg54 ?
                  reg63 : $signed({(8'hbc)}))));
              reg69 <= (~|((~^$unsigned($unsigned(reg67))) < reg56[(5'h10):(4'hc)]));
            end
          else
            begin
              reg66 <= reg49;
              reg67 <= (~^{(reg55 ?
                      reg56[(4'ha):(3'h6)] : ($signed(wire59) ?
                          (~|reg67) : reg69))});
              reg68 <= (reg62 ?
                  (8'haa) : {$signed(((^~wire64) ?
                          $unsigned(reg54) : ((7'h41) && reg55)))});
              reg69 <= reg65;
            end
          reg70 <= {reg68[(1'h1):(1'h1)],
              ((wire43[(4'h9):(2'h2)] > reg53) - (($signed(reg57) ?
                  (reg69 ?
                      wire59 : reg62) : $unsigned(reg67)) || ($signed(reg66) ?
                  (reg66 + wire64) : (&wire58))))};
        end
      reg71 <= $unsigned({$signed((|reg45[(2'h3):(2'h3)]))});
    end
  assign wire72 = $unsigned((((wire61 & {reg52}) <<< $signed(reg56)) ?
                      {$signed(reg47)} : $unsigned((&reg63))));
  assign wire73 = $unsigned($unsigned(reg57[(5'h11):(2'h2)]));
  assign wire74 = ((wire44[(1'h1):(1'h1)] ?
                      (|reg50[(4'hc):(3'h5)]) : $unsigned($unsigned((reg70 ?
                          reg54 : reg51)))) < (((7'h43) ?
                          {$signed(reg55)} : $signed(reg52[(2'h2):(1'h1)])) ?
                      $unsigned((reg55 << {wire61,
                          wire64})) : $unsigned((^wire58))));
  assign wire75 = $signed(((wire64[(4'hb):(3'h4)] ?
                      {wire42[(4'hb):(4'h9)],
                          $unsigned(reg70)} : reg56) ^ (~^($signed(reg53) << (reg48 * reg69)))));
  assign wire76 = $unsigned((~^$unsigned(reg49[(3'h4):(3'h4)])));
  assign wire77 = reg53;
  assign wire78 = (&(8'hb8));
  assign wire79 = reg54;
endmodule
