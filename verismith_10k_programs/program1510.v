module top
#(parameter param107 = ((((((8'hba) * (8'h9f)) ? ((8'ha9) ? (8'hb2) : (8'hb3)) : ((8'h9e) * (8'hb5))) ? (((7'h41) << (8'hb0)) ? ((8'hbc) ? (8'hbf) : (8'hb9)) : (|(8'hb6))) : ((!(8'h9c)) ? ((8'hb6) ? (8'hb3) : (8'hb1)) : ((8'haf) ? (8'hb4) : (8'h9c)))) ~^ (((^(8'hb0)) ? (~|(8'ha4)) : (~^(8'hbe))) ? {((8'haf) ~^ (8'ha2)), {(8'ha0), (8'h9c)}} : ((^~(8'hab)) | (8'ha2)))) ? (((((8'hb2) ? (7'h41) : (8'ha9)) ? {(8'ha4)} : ((8'h9e) >>> (8'hb5))) ? (((7'h42) & (8'ha1)) <= (|(8'hb0))) : ({(8'hb4)} != (~(8'ha5)))) ? (^{(&(7'h43)), {(8'hab)}}) : ((-((8'h9e) ? (8'had) : (8'ha3))) ? ({(8'hb1), (8'hb5)} ? (&(8'had)) : {(8'hb2)}) : (+(&(8'hb1))))) : (~&{((~^(8'hb3)) ? ((8'ha5) || (8'hb3)) : (!(7'h44)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire44;
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  assign y = {wire105,
                 wire46,
                 wire5,
                 wire6,
                 wire44,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire5 = ((wire4[(4'ha):(3'h7)] ?
                         (((|wire3) ?
                                 (wire2 ? (8'ha1) : wire3) : $unsigned(wire2)) ?
                             wire2[(4'hc):(4'hb)] : wire4[(3'h4):(3'h4)]) : ((wire2 && wire3) ?
                             {(wire2 ^ (8'haa))} : wire3)) ?
                     (({wire0[(2'h2):(1'h1)],
                         (~wire0)} << (&(|wire3))) >> (!(~&((7'h43) ?
                         wire3 : wire2)))) : $unsigned($signed($unsigned($signed(wire2)))));
  assign wire6 = (wire1[(2'h3):(1'h1)] ?
                     wire2 : $unsigned(($unsigned((wire5 ?
                         wire5 : wire1)) < wire1[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg7 <= (wire1[(5'h12):(4'hc)] << (~|((wire0 ?
          $signed(wire6) : (^~wire4)) <<< wire1[(2'h2):(1'h1)])));
      reg8 <= ((^~(^~{(wire0 - wire1)})) ?
          $signed((^~(wire5[(3'h6):(1'h1)] ?
              (wire2 && wire0) : wire2))) : $unsigned({wire5,
              ((wire4 ? wire1 : wire2) && (wire4 | wire5))}));
      reg9 <= $unsigned($signed((~^((wire3 ? wire2 : wire4) ?
          $unsigned((8'hb1)) : $signed(reg8)))));
      reg10 <= wire5[(1'h1):(1'h1)];
    end
  module11 #() modinst45 (wire44, clk, wire0, wire3, wire4, wire2, wire5);
  assign wire46 = $unsigned(reg7);
  module47 #() modinst106 (.wire49(wire4), .wire50(wire1), .wire48(wire46), .y(wire105), .wire51(wire6), .wire52(reg7), .clk(clk));
endmodule

module module47
#(parameter param103 = ((((((8'ha8) ? (8'ha9) : (8'h9f)) ? ((8'hbe) ? (8'hbc) : (8'hba)) : ((7'h43) | (8'had))) ? (-((8'hac) ? (8'hb0) : (8'ha4))) : ({(8'hb2), (8'ha7)} ? (8'haf) : ((8'ha1) < (8'haa)))) & {(((8'ha9) * (8'ha2)) ? (~(8'hab)) : ((7'h42) ? (8'ha4) : (8'ha6)))}) ? ((((8'ha1) && ((8'ha4) * (8'hb7))) && (8'ha3)) ? (+(~{(7'h44), (7'h43)})) : {(((8'ha2) ? (7'h41) : (8'hbd)) ? (7'h40) : {(7'h41), (8'ha4)}), ({(8'haf), (8'ha0)} != ((8'ha9) ? (8'hbe) : (8'hab)))}) : (~(^(((8'hbd) ^ (8'hb7)) >>> ((8'hbd) ? (8'hbe) : (8'ha3)))))), 
parameter param104 = ((~^(8'had)) ^ param103))
(y, clk, wire48, wire49, wire50, wire51, wire52);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire48;
  input wire signed [(5'h11):(1'h0)] wire49;
  input wire [(2'h2):(1'h0)] wire50;
  input wire signed [(4'hb):(1'h0)] wire51;
  input wire [(5'h10):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire89;
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire53,
                 wire54,
                 wire69,
                 wire89,
                 reg96,
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
                 (1'h0)};
  assign wire53 = wire51[(1'h1):(1'h0)];
  assign wire54 = $signed($unsigned(($unsigned((wire51 ~^ wire48)) >>> ((8'haa) ?
                      (-wire52) : $signed(wire49)))));
  always
    @(posedge clk) begin
      reg55 <= wire49;
      reg56 <= wire51[(2'h2):(2'h2)];
      reg57 <= wire52[(4'hb):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg58 <= ((wire52 != wire49[(4'hb):(1'h1)]) ?
          reg57[(4'h8):(1'h0)] : {(wire54[(4'hc):(3'h7)] ^ (&wire48))});
      if (wire51[(2'h2):(1'h1)])
        begin
          reg59 <= (~^({(reg58[(4'hc):(4'ha)] ?
                  {reg56, reg56} : reg57[(1'h0):(1'h0)]),
              ((!reg56) >> wire54)} && wire49[(4'he):(1'h1)]));
          reg60 <= $unsigned(reg56);
          reg61 <= wire49;
          reg62 <= (8'h9e);
          if ({(wire48[(5'h12):(4'ha)] | reg56), reg61})
            begin
              reg63 <= $signed($unsigned(reg60[(1'h0):(1'h0)]));
              reg64 <= (~|(8'h9f));
              reg65 <= (($unsigned({(^reg58)}) ^ $unsigned(((reg63 && (8'ha7)) ?
                      (^reg55) : {reg58, reg62}))) ?
                  $unsigned(reg60) : (wire50[(1'h0):(1'h0)] && (8'hac)));
            end
          else
            begin
              reg63 <= ($signed(reg60) ?
                  {reg58[(4'hb):(4'h9)]} : $unsigned(wire49));
              reg64 <= wire53;
            end
        end
      else
        begin
          reg59 <= (~|$unsigned(reg57));
          reg60 <= (7'h43);
        end
      reg66 <= ({(((~wire54) >= reg55[(5'h10):(4'he)]) >> (~(8'hb9))),
              $unsigned((((8'haf) ? (8'ha6) : wire54) - {reg59, (8'hbb)}))} ?
          (reg63 | $signed((8'hbf))) : reg60[(3'h5):(3'h5)]);
      reg67 <= {((~^wire54[(3'h4):(1'h1)]) <= reg65)};
      reg68 <= wire51;
    end
  assign wire69 = $unsigned($signed(reg55));
  module70 #() modinst90 (wire89, clk, wire48, wire52, reg58, wire49, reg66);
  assign wire91 = wire52;
  assign wire92 = ($signed((+(!reg64[(3'h6):(2'h2)]))) ?
                      (~&wire69) : reg67[(2'h3):(1'h0)]);
  assign wire93 = wire51;
  assign wire94 = $unsigned(reg67);
  assign wire95 = reg55[(5'h12):(3'h7)];
  always
    @(posedge clk) begin
      reg96 <= {(($unsigned((wire49 || wire52)) < $unsigned($unsigned(wire95))) ?
              (((reg63 - reg68) ?
                  $unsigned(wire50) : $unsigned((8'ha1))) & reg59[(2'h3):(2'h3)]) : $signed(({reg62} ?
                  reg60[(3'h4):(3'h4)] : $signed(wire91)))),
          (|(!$unsigned(reg67)))};
    end
  assign wire97 = $unsigned({(((wire93 ? reg57 : reg55) ?
                              ((8'hbf) ? wire48 : (8'ha0)) : (^~(8'hb2))) ?
                          $signed(wire95[(4'h9):(3'h6)]) : (wire49[(3'h6):(3'h4)] <= ((8'ha8) ?
                              reg68 : wire51)))});
  assign wire98 = $signed(reg58[(4'hf):(4'hc)]);
  assign wire99 = (~&wire92);
  assign wire100 = {($signed(wire97[(2'h3):(1'h1)]) < wire97)};
  assign wire101 = wire54[(4'h9):(3'h6)];
  assign wire102 = (8'h9f);
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= (((wire12 + ((-wire16) == $unsigned(wire13))) ?
          $signed($signed({wire15})) : ($signed($signed(wire13)) | $unsigned((wire12 <<< wire12)))) | (8'hbe));
      if (wire15[(3'h7):(3'h6)])
        begin
          reg18 <= $signed(((~((wire12 ~^ wire12) >> $signed((8'h9e)))) ^ wire15[(3'h5):(3'h4)]));
        end
      else
        begin
          reg18 <= wire14;
          reg19 <= $signed(({$unsigned(wire13[(4'hc):(2'h2)])} ?
              ({reg18} ?
                  reg18 : wire16[(3'h7):(3'h6)]) : ((&(~^wire14)) >>> {(^wire12),
                  reg18})));
          reg20 <= ($signed(((~|$unsigned(wire16)) ?
                  ($signed((8'ha0)) ?
                      $signed(wire12) : (reg19 ?
                          reg19 : wire12)) : (^~(wire13 ^~ wire15)))) ?
              ((&$unsigned({(8'hab)})) ^~ reg18[(3'h6):(1'h1)]) : (~$signed($signed((8'haf)))));
        end
      if ((((((~^wire12) ^ wire16) >> (^$unsigned(reg17))) ~^ reg20) <= $signed($unsigned(((reg20 || wire13) ~^ {wire14})))))
        begin
          if ($signed(wire13))
            begin
              reg21 <= (~&{(wire16[(3'h7):(3'h5)] <<< $unsigned((~wire14))),
                  reg19[(2'h2):(1'h0)]});
              reg22 <= {(8'hb5)};
              reg23 <= (wire16[(5'h12):(4'hc)] <<< (~reg18));
              reg24 <= (($unsigned((^~$signed(reg17))) > $unsigned(reg18)) ?
                  (-(!reg22[(4'hc):(3'h4)])) : reg18[(3'h7):(2'h3)]);
            end
          else
            begin
              reg21 <= reg24;
              reg22 <= ($unsigned({((reg23 + reg19) ?
                      $unsigned(wire16) : $signed((8'ha5)))}) > wire15);
              reg23 <= {(reg18[(1'h1):(1'h1)] ^ $signed($unsigned($signed(wire12)))),
                  (|(-{reg21, $signed(reg20)}))};
              reg24 <= ((~&$signed(((-(8'hbf)) >> $signed(wire13)))) <<< (|{reg24}));
              reg25 <= $unsigned($unsigned((8'hb4)));
            end
        end
      else
        begin
          if ($signed((&(^$signed($unsigned(reg18))))))
            begin
              reg21 <= reg21[(4'h8):(1'h1)];
            end
          else
            begin
              reg21 <= (~reg21[(4'ha):(3'h6)]);
              reg22 <= $unsigned(reg23[(3'h4):(1'h1)]);
              reg23 <= ((^~$signed($unsigned((reg25 != reg18)))) ?
                  $signed($signed(wire13[(4'he):(4'he)])) : {(({reg18,
                              reg23} < $unsigned(wire12)) ?
                          reg22[(4'h8):(1'h0)] : ({reg17} ?
                              (wire14 ? reg23 : reg25) : (wire15 + wire16)))});
            end
          reg24 <= ((reg20[(3'h5):(3'h5)] || ((~$unsigned(wire12)) ?
                  $unsigned((~&wire14)) : reg21)) ?
              (((-$unsigned((8'haf))) | ($signed(wire12) ?
                      (wire16 ? wire13 : (8'ha8)) : (reg17 ? reg21 : reg25))) ?
                  (~&reg17) : reg19) : reg25[(1'h1):(1'h0)]);
          if (($signed($unsigned(reg24[(4'h8):(3'h4)])) ?
              (^~{reg24, (-(8'hbb))}) : $signed((~|$signed(wire12)))))
            begin
              reg25 <= $unsigned((reg17[(4'hc):(3'h7)] * $unsigned({(reg22 ?
                      wire14 : reg17),
                  ((8'haa) <<< reg18)})));
              reg26 <= $signed(wire15);
              reg27 <= wire13[(4'h8):(1'h1)];
              reg28 <= (~&$signed(wire13));
              reg29 <= reg18[(1'h1):(1'h0)];
            end
          else
            begin
              reg25 <= ((reg19[(1'h1):(1'h0)] >> $unsigned(wire16)) ?
                  reg24 : $signed((reg23[(3'h6):(2'h3)] ?
                      wire12[(4'h9):(3'h7)] : wire12[(4'ha):(4'ha)])));
              reg26 <= (~^(reg21[(2'h2):(1'h0)] ?
                  {wire16[(2'h2):(2'h2)], reg24[(1'h1):(1'h0)]} : reg26));
              reg27 <= $unsigned($signed($signed(((reg24 <= wire13) ~^ $unsigned(reg17)))));
            end
          reg30 <= ((^~reg25) * reg26[(4'hd):(4'h9)]);
        end
      if (($signed($unsigned((^$unsigned(reg27)))) ?
          ((~|{(wire16 >= (8'hae)), reg23}) ?
              (^(-reg19)) : $signed({((8'h9e) ? reg30 : wire14)})) : (|reg26)))
        begin
          reg31 <= (wire15 != (($unsigned({reg28,
              reg18}) && wire13[(5'h10):(2'h2)]) & $signed(reg27)));
          reg32 <= (|(((~(wire14 ? reg17 : reg17)) && ($unsigned(reg27) ?
              $signed(reg26) : reg24)) - (^wire16[(4'hd):(3'h4)])));
          if ($signed($signed($unsigned($signed(wire15[(4'ha):(2'h2)])))))
            begin
              reg33 <= {{(|reg29[(3'h5):(3'h4)]), wire16}};
              reg34 <= $signed((8'hbb));
              reg35 <= {$unsigned((-reg22))};
            end
          else
            begin
              reg33 <= (((reg29[(3'h5):(2'h2)] << (wire13[(3'h6):(3'h5)] >= {(8'ha6)})) - $unsigned(reg27)) ?
                  reg35 : (reg34[(3'h6):(3'h4)] ?
                      wire12 : (!$unsigned({(8'h9f)}))));
            end
          reg36 <= ((8'h9f) != reg31[(4'hd):(1'h0)]);
          reg37 <= $signed(($unsigned($signed((&(8'haf)))) ?
              {wire14, (8'ha1)} : ($signed($unsigned(wire16)) ?
                  ($unsigned(reg24) >>> (wire14 ?
                      reg19 : reg23)) : (reg31[(3'h5):(2'h2)] ?
                      reg24 : (reg30 ? (8'h9f) : reg18)))));
        end
      else
        begin
          reg31 <= reg35;
          reg32 <= {(($unsigned((-reg21)) != reg36[(4'ha):(4'ha)]) ^ $signed((8'hb9))),
              wire15[(4'h8):(2'h2)]};
          reg33 <= {(reg35[(1'h1):(1'h1)] ?
                  reg31[(2'h2):(2'h2)] : (!((~reg37) || (reg29 > reg32)))),
              $signed((((8'haa) ? $unsigned(wire14) : (reg20 ~^ (7'h40))) ?
                  ({reg27, reg19} ?
                      $unsigned((8'h9d)) : (^reg34)) : reg31[(3'h7):(3'h4)]))};
          if ($unsigned(reg25))
            begin
              reg34 <= ($unsigned((~&$unsigned($unsigned(reg25)))) ~^ $signed({$signed($unsigned(reg32))}));
              reg35 <= {reg35};
              reg36 <= $unsigned((~&reg19));
              reg37 <= (((&$signed((8'hb2))) ?
                      (((reg17 ? reg18 : (8'hb2)) ? $unsigned(reg19) : reg29) ?
                          ($unsigned(reg18) >> (reg28 | wire15)) : ($unsigned(reg25) ?
                              (reg18 >= reg22) : $unsigned((8'hbe)))) : $signed((((8'hb4) ?
                          reg20 : reg22) >> reg37))) ?
                  {(($unsigned(reg21) ? (wire14 * reg17) : {reg17, (8'hb6)}) ?
                          (8'ha7) : {(reg27 ? (8'h9f) : reg20),
                              $unsigned(reg35)})} : (~$signed((((8'ha3) ?
                          reg21 : reg23) ?
                      (8'hb8) : (8'hb8)))));
              reg38 <= reg26;
            end
          else
            begin
              reg34 <= $signed(((|(^~(reg31 ?
                  reg31 : reg35))) < ($signed($signed(reg27)) + $signed((!wire15)))));
              reg35 <= $signed((((~&(reg19 << (8'hb5))) != $unsigned($signed((8'hba)))) ?
                  reg34 : reg23[(2'h2):(2'h2)]));
              reg36 <= (&reg24[(4'ha):(3'h5)]);
              reg37 <= (reg28[(4'hd):(4'ha)] ?
                  ((reg17 >> $unsigned(reg37)) ?
                      $unsigned((reg36[(3'h6):(3'h5)] ?
                          wire16 : {wire14})) : {reg17[(3'h6):(3'h5)]}) : reg37);
              reg38 <= ($unsigned((wire15 >>> ((reg30 ?
                  reg38 : (8'hab)) > (~&reg27)))) & $unsigned($signed($signed((^~reg28)))));
            end
        end
    end
  assign wire39 = reg22[(2'h3):(1'h0)];
  assign wire40 = $unsigned($unsigned(($unsigned($signed(reg34)) - ({reg21,
                      reg26} << (reg34 < reg24)))));
  assign wire41 = (((~^$unsigned((-(8'ha0)))) ?
                      (((reg21 || wire16) >= (reg30 ~^ reg29)) ?
                          ($signed(wire40) ?
                              $signed((8'hbd)) : $unsigned(wire39)) : wire13) : $signed((!$signed(reg18)))) >>> $unsigned(((|$signed(reg29)) >> (-(wire39 ?
                      reg21 : wire40)))));
  assign wire42 = ($unsigned((8'hb1)) ?
                      $unsigned($signed($signed($signed(reg22)))) : $signed($signed(reg21[(4'hb):(1'h0)])));
  assign wire43 = reg26[(5'h10):(4'hb)];
endmodule

module module70
#(parameter param87 = (|(~|(~{(-(8'hb7))}))), 
parameter param88 = (~|((({param87} & (param87 ? param87 : param87)) * (param87 >>> param87)) && param87)))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire75;
  input wire signed [(5'h10):(1'h0)] wire74;
  input wire signed [(5'h12):(1'h0)] wire73;
  input wire [(5'h11):(1'h0)] wire72;
  input wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 reg80,
                 (1'h0)};
  assign wire76 = wire73[(3'h4):(2'h3)];
  assign wire77 = $unsigned(wire74);
  assign wire78 = ($signed(({(wire74 ?
                              wire73 : wire73)} <= wire76[(2'h3):(2'h2)])) ?
                      $signed(((|wire75[(2'h2):(1'h1)]) ?
                          {{(7'h43)},
                              wire76} : $signed((~&wire71)))) : (wire76 ?
                          {{wire75[(1'h1):(1'h0)], $signed(wire71)},
                              wire74} : $unsigned(wire71[(5'h11):(4'h8)])));
  assign wire79 = ((($unsigned((~wire71)) + $unsigned((wire77 ^ wire78))) < (~&({(8'had)} & wire72[(3'h7):(2'h3)]))) ?
                      $signed(($unsigned((wire71 ?
                          wire75 : wire71)) ^~ $signed($unsigned(wire74)))) : $unsigned({($signed(wire78) ?
                              {wire76, wire78} : (-(8'hbd))),
                          wire74}));
  always
    @(posedge clk) begin
      reg80 <= $unsigned(wire73);
    end
  assign wire81 = ((!(!(|$signed(wire75)))) <<< wire72);
  assign wire82 = $signed(wire81);
  assign wire83 = wire77[(3'h5):(2'h3)];
  assign wire84 = ((&$unsigned(wire77)) ?
                      $unsigned(({((8'h9d) && wire71),
                          wire78[(5'h12):(4'hb)]} - (~(|reg80)))) : (wire77[(3'h5):(2'h2)] ?
                          $unsigned(wire77[(1'h0):(1'h0)]) : (({(8'hb3)} == (~^(8'ha1))) ?
                              wire71[(4'hb):(1'h0)] : (+(wire77 ?
                                  (8'hbd) : wire73)))));
  assign wire85 = (~&({({wire72} ? (^wire75) : $signed(wire83)),
                      wire75[(4'h8):(1'h0)]} - $signed($unsigned((~wire84)))));
  assign wire86 = wire73[(4'hd):(2'h2)];
endmodule
