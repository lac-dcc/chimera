module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire104;
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire107,
                 wire106,
                 wire5,
                 wire6,
                 wire7,
                 wire104,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = ($unsigned(((|$unsigned(wire3)) ?
                     wire0[(4'hf):(2'h2)] : (^~(wire2 ?
                         wire0 : wire1)))) << (~wire0));
  assign wire6 = $unsigned(wire3);
  assign wire7 = $unsigned($unsigned(wire4[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      reg8 <= (wire0 ?
          ($unsigned(wire2) == {{{(8'h9f)}, (~wire4)},
              $signed($signed(wire6))}) : (~^(wire7 && ($unsigned((8'ha1)) ?
              $unsigned(wire5) : ((8'hac) ? wire5 : wire4)))));
      reg9 <= (^wire1[(3'h6):(2'h3)]);
    end
  module10 #() modinst105 (wire104, clk, wire3, reg8, wire7, wire4);
  assign wire106 = wire5;
  assign wire107 = ($unsigned(reg8) < ((~|$unsigned((+reg8))) ?
                       reg9[(1'h0):(1'h0)] : wire1[(3'h7):(2'h2)]));
  always
    @(posedge clk) begin
      reg108 <= wire107;
      reg109 <= $signed(wire107[(1'h0):(1'h0)]);
      reg110 <= (~&reg8[(3'h6):(1'h1)]);
      if ($unsigned(($unsigned(wire7) & wire0)))
        begin
          if (wire6)
            begin
              reg111 <= (~|(7'h42));
              reg112 <= (reg8[(4'h8):(3'h6)] != reg110);
              reg113 <= ((~$signed((reg110[(3'h5):(1'h0)] >> (reg8 ^ wire6)))) || (~^wire2[(3'h4):(1'h1)]));
            end
          else
            begin
              reg111 <= ($unsigned(((reg113[(3'h4):(2'h3)] ?
                      $unsigned(wire0) : reg112[(4'hd):(3'h4)]) != $unsigned($unsigned(wire3)))) ?
                  {wire104, $signed(wire0)} : $signed($unsigned((&{reg108}))));
              reg112 <= ($unsigned(((((8'h9f) ^~ wire1) ?
                          ((8'h9d) >>> reg111) : ((8'haf) == reg113)) ?
                      (wire5 >>> reg109) : $unsigned((!reg109)))) ?
                  reg110[(3'h5):(2'h3)] : (+((~^$signed(wire3)) ?
                      $unsigned($unsigned(reg8)) : (reg112 ?
                          {(7'h41), wire4} : $unsigned(wire6)))));
            end
          reg114 <= (~|reg8);
        end
      else
        begin
          reg111 <= (!reg111);
        end
    end
  assign wire115 = (+(!reg9));
  assign wire116 = $unsigned({({reg113[(2'h2):(2'h2)], {wire0}} ?
                           $unsigned(wire1) : {$signed(reg111),
                               (wire0 | (8'ha5))}),
                       (+((reg111 & wire106) ?
                           $signed(wire104) : $unsigned(reg114)))});
endmodule

module module10
#(parameter param103 = ((((~((8'ha1) & (7'h44))) ? ((~&(8'ha8)) - (|(8'ha9))) : (+(^~(8'hb9)))) + {(((8'hb9) || (8'hbd)) && (-(8'hba))), (((8'h9d) ~^ (8'hb2)) ? ((8'hb9) ? (8'hab) : (8'ha8)) : ((8'hb5) ? (8'ha9) : (8'hbd)))}) ? (~((|{(7'h40), (7'h44)}) ? (7'h40) : (+(^(8'hb0))))) : (^(((~|(8'hba)) != ((8'hbf) - (8'h9e))) ? (7'h40) : ({(7'h41), (8'ha7)} - (-(7'h41)))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h1f9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire13;
  input wire signed [(2'h3):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire15;
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  assign y = {wire102,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire15,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg28,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire15 = $signed((+wire11[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg16 <= (-(!wire11[(5'h10):(4'hb)]));
      if (((wire15[(1'h1):(1'h0)] ?
              $unsigned(($unsigned(reg16) == wire14[(2'h2):(2'h2)])) : wire15) ?
          (~(&(wire15[(3'h5):(3'h4)] >>> $unsigned(wire12)))) : (!{($unsigned(wire15) << (reg16 - reg16))})))
        begin
          reg17 <= $signed((~^$unsigned((reg16 ?
              wire15 : wire15[(2'h3):(1'h1)]))));
          reg18 <= {wire13[(4'h8):(2'h2)]};
          reg19 <= ($unsigned($signed((wire15 == $unsigned(reg17)))) ?
              (&wire14[(3'h6):(3'h6)]) : (~|(8'hb4)));
        end
      else
        begin
          reg17 <= ((~^$unsigned($unsigned({(7'h43), (8'h9f)}))) ?
              ($unsigned($unsigned(((8'ha0) <= wire12))) ?
                  ($unsigned((^~wire13)) < (~&$signed((8'hac)))) : wire12[(2'h2):(2'h2)]) : (~^(!$signed((wire11 <= wire12)))));
          if ($unsigned(reg18[(2'h3):(1'h0)]))
            begin
              reg18 <= $unsigned(wire13);
              reg19 <= $unsigned(reg16[(1'h0):(1'h0)]);
              reg20 <= $unsigned(((&$unsigned(((8'haa) ?
                  (8'hab) : wire11))) | {((^~wire15) ?
                      (&wire11) : (reg17 && reg18)),
                  {(reg17 << reg17)}}));
            end
          else
            begin
              reg18 <= reg19;
              reg19 <= $unsigned(reg17[(3'h7):(3'h6)]);
            end
          reg21 <= {$unsigned(reg18[(4'hc):(3'h4)])};
          reg22 <= $unsigned(wire12);
          reg23 <= ((wire12[(2'h2):(1'h0)] ? (+reg17[(4'h8):(2'h3)]) : reg19) ?
              $signed({((wire11 == (8'hbf)) ?
                      reg19[(5'h13):(3'h4)] : (reg18 >= reg16)),
                  $unsigned((!wire15))}) : ($signed(reg16[(3'h5):(3'h4)]) & ((~^wire11[(1'h0):(1'h0)]) ?
                  reg20 : $signed((wire13 > reg17)))));
        end
    end
  assign wire24 = wire15;
  assign wire25 = $signed($signed((wire12[(1'h0):(1'h0)] ?
                      reg21[(4'h9):(3'h6)] : $signed(reg21[(2'h2):(1'h1)]))));
  assign wire26 = (({reg17, (^~$unsigned(reg16))} != (~^(~|(!wire13)))) ?
                      $unsigned(reg23) : wire11[(4'ha):(4'h8)]);
  assign wire27 = reg22[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg28 <= $signed($unsigned(wire14[(2'h3):(2'h3)]));
    end
  assign wire29 = (reg20[(1'h1):(1'h1)] ?
                      ((~{(&reg17),
                          $signed(reg22)}) >>> ($unsigned((&wire25)) <= $unsigned($unsigned((8'hab))))) : reg20);
  assign wire30 = (~^(^wire25[(3'h5):(3'h4)]));
  assign wire31 = $unsigned((&reg19));
  module32 #() modinst86 (wire85, clk, reg21, reg28, wire26, wire12);
  assign wire87 = reg22[(3'h6):(1'h1)];
  assign wire88 = ((~|reg16[(5'h10):(5'h10)]) ? wire31 : wire13);
  assign wire89 = reg17;
  assign wire90 = wire15;
  assign wire91 = $unsigned({wire88,
                      (|($unsigned(wire25) ?
                          $signed(wire31) : $signed((8'ha0))))});
  assign wire92 = (|wire85);
  always
    @(posedge clk) begin
      reg93 <= $unsigned(({wire14[(2'h3):(1'h1)],
              ((wire29 ? reg23 : reg23) - $signed(wire29))} ?
          wire24 : (+(-(wire24 | wire31)))));
      if ($unsigned((wire30 ? wire29 : (8'hbf))))
        begin
          reg94 <= (~^(((8'h9f) ?
                  ((wire85 < wire90) ?
                      {wire87} : $signed((8'hbf))) : (+(reg18 ^~ wire11))) ?
              reg18 : (8'hb2)));
        end
      else
        begin
          if (($signed(wire90[(4'he):(2'h3)]) < {wire11,
              (^~$unsigned((^~wire30)))}))
            begin
              reg94 <= $signed({(($signed(reg20) ?
                      wire12[(2'h3):(1'h0)] : reg94[(2'h3):(1'h1)]) && $signed(((8'hae) ?
                      wire89 : wire11)))});
              reg95 <= ($signed((wire90[(3'h5):(2'h3)] <<< reg17[(1'h1):(1'h0)])) ?
                  ($signed(((wire89 ? wire15 : reg28) < (~^wire87))) ?
                      $unsigned((8'hbe)) : wire87[(4'hf):(4'hd)]) : wire30);
              reg96 <= $signed(wire92);
              reg97 <= $signed(({{(wire26 <= reg93),
                      (reg20 <<< reg21)}} & reg16));
            end
          else
            begin
              reg94 <= {(7'h43)};
              reg95 <= (8'hb0);
              reg96 <= $signed(($unsigned($signed((~reg97))) << ((((8'ha4) ?
                  reg93 : wire87) || $signed((8'hb7))) >> $unsigned(reg96[(4'h8):(3'h5)]))));
              reg97 <= $signed(wire29);
              reg98 <= wire13[(4'ha):(3'h6)];
            end
          reg99 <= {{(~{((8'h9c) << (8'ha0)), (wire29 >= (8'hb7))})}, reg96};
          reg100 <= (wire30 != reg20[(1'h0):(1'h0)]);
          reg101 <= ((^$signed($unsigned({(8'hb6), reg18}))) ?
              ((wire90[(2'h2):(2'h2)] <= $unsigned(reg98[(1'h0):(1'h0)])) ^ ($signed(((8'haa) ?
                      (7'h44) : reg28)) ?
                  $unsigned($unsigned(reg94)) : reg16[(2'h2):(2'h2)])) : ($unsigned(($unsigned(reg28) ?
                  (wire27 ?
                      reg17 : reg19) : wire24[(4'he):(4'he)])) >>> (reg99[(1'h1):(1'h1)] + {(wire27 ?
                      wire87 : wire31)})));
        end
    end
  assign wire102 = wire27;
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h228):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire36;
  input wire [(3'h6):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire34;
  input wire signed [(2'h3):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  assign y = {wire81,
                 wire71,
                 wire70,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg84,
                 reg83,
                 reg82,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
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
                 (1'h0)};
  assign wire37 = {(wire36[(5'h14):(3'h5)] ~^ $unsigned({wire33})),
                      (|({wire33[(2'h2):(1'h0)]} ?
                          $signed((wire35 ? wire33 : wire36)) : {wire34,
                              (wire36 ? wire35 : wire35)}))};
  assign wire38 = (8'hb4);
  assign wire39 = $unsigned((8'hbb));
  assign wire40 = {($signed((&(wire39 ?
                          wire35 : (8'ha6)))) - $unsigned(wire35[(3'h4):(1'h0)]))};
  assign wire41 = $unsigned(wire40);
  always
    @(posedge clk) begin
      reg42 <= wire35;
      reg43 <= (^~({$unsigned($unsigned(wire37))} >>> (wire38[(4'ha):(1'h1)] ?
          wire36 : ({wire41} + $signed(wire38)))));
      reg44 <= $signed(wire34[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg45 <= $signed({$signed($unsigned((&(8'haa))))});
      if (wire39)
        begin
          reg46 <= (wire40 ?
              (wire41 | (~^($unsigned(wire34) * (wire37 > reg42)))) : ($unsigned($signed((-wire34))) >= wire36));
          reg47 <= $signed(wire41);
          if (wire38)
            begin
              reg48 <= (!$unsigned({(reg45 ~^ (wire34 - (8'hb0))),
                  (~|wire41[(4'h9):(3'h4)])}));
            end
          else
            begin
              reg48 <= (($signed({$unsigned(reg42)}) ?
                      (&({reg42, reg43} ?
                          (reg42 ?
                              reg44 : wire40) : (~|reg47))) : ($signed($signed(reg43)) >>> $signed((reg47 & reg48)))) ?
                  (8'hb1) : $signed((!$signed(wire39))));
              reg49 <= wire33[(1'h1):(1'h1)];
              reg50 <= (~|$signed((~|(reg43 ^~ ((8'hb1) == (8'h9c))))));
              reg51 <= reg46[(1'h1):(1'h0)];
            end
          reg52 <= wire34;
          reg53 <= reg43[(1'h1):(1'h1)];
        end
      else
        begin
          reg46 <= (|$signed((reg52[(1'h1):(1'h1)] ?
              ($signed(reg53) || (8'hbb)) : (~|(wire37 ? wire34 : reg47)))));
          reg47 <= {($unsigned(wire37[(5'h10):(4'h8)]) ?
                  (!((reg44 ? reg42 : reg48) | (-wire38))) : reg46)};
          reg48 <= $signed($signed({$signed((reg49 ? (8'hbb) : reg49)),
              (~(wire37 ? wire40 : reg53))}));
          reg49 <= $signed(reg48);
        end
      reg54 <= ((&reg53) < $signed((($unsigned(reg49) ?
          wire36 : (reg45 - (8'hbf))) + (^~$unsigned(wire35)))));
      reg55 <= wire39[(4'h9):(3'h4)];
    end
  assign wire56 = $unsigned(reg49);
  assign wire57 = reg53;
  assign wire58 = ($unsigned(((+reg54[(4'h9):(4'h9)]) ? reg54 : {(8'hac)})) ?
                      (reg51[(3'h7):(2'h2)] & reg54[(3'h6):(3'h5)]) : (|$signed($signed((wire36 && reg42)))));
  assign wire59 = (&reg44[(4'hf):(4'h9)]);
  assign wire60 = (|$signed($signed((wire39[(3'h6):(2'h3)] ?
                      reg54 : {reg55, wire33}))));
  always
    @(posedge clk) begin
      if (wire37)
        begin
          if ((8'hb8))
            begin
              reg61 <= wire35[(1'h0):(1'h0)];
              reg62 <= ((|(8'hac)) ^~ ($signed($signed({wire34})) & (reg50 >> $signed(wire36))));
              reg63 <= (($unsigned((~&$signed(wire35))) || ((reg47[(1'h1):(1'h1)] >= wire38[(2'h3):(2'h2)]) ?
                  $signed({wire35,
                      (8'ha8)}) : reg50[(4'h9):(2'h2)])) * $signed({(wire56 ?
                      {reg42, wire39} : (|wire34)),
                  ((wire33 ^~ (8'hab)) ? {reg62} : $unsigned(wire37))}));
              reg64 <= ({(reg53[(4'h9):(3'h6)] == reg44[(2'h2):(1'h0)]),
                  $unsigned((&wire60[(1'h1):(1'h1)]))} >>> reg49[(3'h4):(2'h2)]);
              reg65 <= reg48;
            end
          else
            begin
              reg61 <= ((~|$signed(($signed(reg53) < $unsigned((8'hbd))))) >> (8'hb4));
              reg62 <= ((~|(^~reg53)) ?
                  (~|(reg62 - ((7'h42) ? wire60 : wire59))) : reg62);
              reg63 <= ({wire35[(1'h1):(1'h0)]} >> reg53);
            end
        end
      else
        begin
          reg61 <= reg54[(1'h1):(1'h0)];
          reg62 <= ((~|$unsigned(((reg42 || wire56) < (~^reg54)))) ?
              ($unsigned($unsigned($unsigned(reg53))) || (wire41[(1'h1):(1'h1)] ?
                  (~wire33) : (~reg62))) : (reg62 == {$unsigned((8'hab)),
                  {$signed(wire33), ((8'ha1) ? reg51 : reg53)}}));
        end
      reg66 <= (8'haa);
      reg67 <= reg52[(2'h2):(1'h1)];
      reg68 <= ($unsigned(wire56) ?
          (({{wire41}, reg47[(2'h3):(1'h0)]} * $signed((&reg42))) ?
              (~^(reg51[(5'h15):(3'h6)] && (-reg47))) : ({wire34[(4'he):(4'hb)]} ?
                  ((reg48 >>> reg67) & $unsigned(reg43)) : reg63[(5'h10):(4'hd)])) : reg67[(1'h1):(1'h1)]);
      reg69 <= (~|(~^reg47[(3'h4):(1'h1)]));
    end
  assign wire70 = wire41;
  assign wire71 = reg46[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg72 <= wire59;
      reg73 <= $signed(({(~|$unsigned(reg49))} ?
          {reg69[(3'h7):(3'h7)], $unsigned((&reg43))} : {(&$unsigned(reg43))}));
      reg74 <= (wire39[(4'hb):(4'h8)] ? $signed({reg63}) : wire59);
      reg75 <= (~&($signed((~^$signed(reg74))) ?
          (+($signed(reg65) ?
              (wire35 ?
                  reg63 : reg55) : $unsigned(wire38))) : {(((8'hb6) >>> wire70) ?
                  $unsigned((7'h44)) : $signed((8'h9d))),
              wire37}));
      if ((^wire33[(1'h1):(1'h0)]))
        begin
          reg76 <= (~&{wire58});
          if (reg49)
            begin
              reg77 <= reg75[(2'h3):(1'h0)];
            end
          else
            begin
              reg77 <= (($signed({$signed(reg47),
                      (reg47 == reg64)}) && ($signed(wire34[(4'h9):(2'h2)]) > {$unsigned(reg62),
                      (wire71 <= reg67)})) ?
                  (reg52[(2'h3):(1'h1)] ?
                      $signed((wire71[(3'h7):(1'h0)] ^ (reg64 + reg43))) : $unsigned((reg75 << $signed((8'ha7))))) : ((wire57[(2'h2):(2'h2)] <= reg61[(4'h9):(1'h0)]) && $signed((!(reg46 ^ wire60)))));
              reg78 <= wire70[(2'h2):(1'h1)];
              reg79 <= $signed($unsigned(wire36[(2'h3):(2'h2)]));
              reg80 <= $signed($signed(($unsigned({reg67, (8'ha5)}) ?
                  $unsigned((+reg68)) : ({reg74, reg53} ^~ (wire41 ?
                      wire40 : reg51)))));
            end
        end
      else
        begin
          reg76 <= $signed($unsigned({(reg64 ? reg42 : $signed(reg63)),
              wire60[(3'h4):(3'h4)]}));
          reg77 <= {$signed(reg46), reg44};
          reg78 <= $signed($unsigned($signed((~|$signed(reg53)))));
          reg79 <= {{((~&(reg45 != reg55)) & reg76)}, (8'h9f)};
          reg80 <= reg72;
        end
    end
  assign wire81 = (wire40[(4'h8):(4'h8)] - reg46);
  always
    @(posedge clk) begin
      if (reg61[(2'h3):(1'h1)])
        begin
          reg82 <= (~^(+(!reg45)));
          reg83 <= wire39[(2'h3):(2'h2)];
        end
      else
        begin
          reg82 <= wire38;
        end
      reg84 <= {$unsigned((^($unsigned(reg55) || $unsigned(wire40)))),
          $unsigned({$unsigned($signed(reg44)),
              {reg43, wire58[(4'he):(4'hb)]}})};
    end
endmodule
