module top
#(parameter param92 = ((~((((8'hb8) ? (7'h44) : (8'hab)) ? ((8'hac) || (8'hac)) : {(8'h9d)}) >>> {((8'hb9) == (8'ha2)), ((8'ha5) ? (8'hb6) : (8'hae))})) ? ({({(8'hb3)} == (^~(7'h43))), {{(8'hb4), (8'ha6)}}} ? {(&(~(8'hbe)))} : ((((7'h42) ? (8'ha3) : (8'hb7)) ? {(8'hb0), (7'h42)} : ((8'hb0) < (8'hb2))) > ((-(8'hb6)) * ((8'hb0) ^ (8'hb3))))) : {(^(((7'h41) + (8'hb3)) ? ((8'ha1) && (8'haa)) : (~&(8'hbf)))), (~(((8'h9c) ? (8'hab) : (8'had)) ? ((8'hbc) * (7'h42)) : {(7'h43)}))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire90;
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire54,
                 wire7,
                 wire6,
                 wire5,
                 wire56,
                 wire90,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (|{wire3[(3'h7):(3'h6)], wire4});
  assign wire6 = wire4[(2'h2):(1'h0)];
  assign wire7 = {((~&wire6) ~^ ({(8'hbe)} ?
                         (wire3[(2'h2):(2'h2)] ^~ $unsigned(wire3)) : $signed($unsigned(wire4)))),
                     wire5};
  always
    @(posedge clk) begin
      reg8 <= wire4;
      if (wire5[(1'h1):(1'h1)])
        begin
          reg9 <= $signed(wire0);
          reg10 <= (reg9 ? $unsigned($unsigned({wire7, wire2})) : wire3);
          if (((7'h41) << (((wire4[(1'h1):(1'h0)] * ((8'hbf) >> wire1)) ?
                  (~^(wire7 << wire5)) : {$signed(wire6), $signed(wire2)}) ?
              $signed(((wire4 | (8'hac)) - ((8'haf) <= reg8))) : $unsigned(((reg9 + (8'hb4)) * wire2)))))
            begin
              reg11 <= {(+$unsigned(wire5)), $signed(reg8[(5'h14):(1'h1)])};
              reg12 <= reg10;
            end
          else
            begin
              reg11 <= $unsigned(((~^$unsigned((8'hbb))) ? (~(8'hbd)) : wire6));
            end
          reg13 <= {(wire5 ?
                  (~&(^(wire0 - wire4))) : $unsigned(wire6[(1'h1):(1'h0)])),
              (^((((8'h9e) ?
                  (8'had) : reg12) || $unsigned(wire5)) >> (8'hb1)))};
          reg14 <= {(8'h9f)};
        end
      else
        begin
          reg9 <= ($signed((reg11[(3'h6):(2'h3)] || reg12[(3'h6):(3'h4)])) ?
              ($unsigned($unsigned($unsigned((7'h42)))) ?
                  (8'haa) : wire7[(4'h9):(2'h3)]) : $unsigned((+$signed((wire6 >= reg8)))));
          reg10 <= (+(({reg12[(1'h0):(1'h0)]} >> $signed((wire0 - wire3))) ?
              wire5[(2'h3):(2'h3)] : $signed(($unsigned((8'hbb)) >= wire6[(2'h3):(1'h0)]))));
          reg11 <= $signed($signed(reg12));
        end
    end
  module15 #() modinst55 (wire54, clk, reg14, reg10, wire2, wire1, wire3);
  assign wire56 = reg10[(3'h6):(3'h5)];
  module57 #() modinst91 (wire90, clk, wire5, reg12, wire1, reg14, wire7);
endmodule

module module57
#(parameter param88 = ((~|({{(8'ha9)}} ? (((8'ha4) >> (8'ha2)) ? (8'hb4) : ((8'hab) + (8'haf))) : (~|((8'hac) ? (7'h44) : (8'ha5))))) ~^ ((|{(|(8'ha7)), ((8'had) ? (8'hb9) : (8'ha3))}) ? ((((8'hb8) ? (8'ha8) : (8'hbd)) || (&(8'ha2))) ? (((8'hb6) < (8'haa)) ? ((8'h9c) ? (8'h9c) : (7'h41)) : ((7'h42) ^ (8'hbc))) : {(-(8'haa)), ((7'h44) - (8'ha5))}) : ({((8'hb3) >= (8'ha1))} ? (~&(~^(8'hb6))) : (((8'hb5) >> (8'hb6)) ? ((7'h41) ? (8'ha7) : (8'had)) : {(8'hb2), (8'hbf)})))), 
parameter param89 = (param88 * (~(~|{(param88 >>> param88)}))))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire62;
  input wire [(4'h9):(1'h0)] wire61;
  input wire signed [(2'h2):(1'h0)] wire60;
  input wire signed [(4'h8):(1'h0)] wire59;
  input wire [(2'h2):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  assign y = {wire77,
                 wire74,
                 wire70,
                 wire69,
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
                 reg76,
                 reg75,
                 reg73,
                 reg72,
                 reg71,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((({((wire61 ? wire59 : wire58) ^ (wire59 & wire62))} ?
              (((wire61 ? wire58 : (8'ha5)) ?
                  wire60[(1'h0):(1'h0)] : (~|(8'hbf))) == (((8'hbc) ?
                      wire61 : (8'ha5)) ?
                  (wire59 - wire60) : wire62)) : $unsigned(($unsigned(wire60) ?
                  (wire58 ? wire58 : wire59) : (+wire59)))) ?
          (!wire61) : {($unsigned((wire60 >= (8'hb3))) ? wire59 : wire58),
              wire59}))
        begin
          reg63 <= wire59[(1'h0):(1'h0)];
          reg64 <= wire62;
          reg65 <= $signed((^~(~$unsigned($unsigned(wire59)))));
        end
      else
        begin
          reg63 <= wire61[(1'h1):(1'h0)];
        end
      reg66 <= (~&(((reg65[(2'h2):(1'h1)] ? {(8'ha0)} : (wire59 - reg64)) ?
          wire59 : reg63) ^ $unsigned({(wire61 ? wire60 : (8'hb9)),
          (~|reg65)})));
      reg67 <= reg64;
      reg68 <= (~|wire59[(3'h4):(3'h4)]);
    end
  assign wire69 = $unsigned($unsigned(({$unsigned(reg65)} - $signed({reg63,
                      reg64}))));
  assign wire70 = reg63;
  always
    @(posedge clk) begin
      reg71 <= ($unsigned(wire58) ?
          wire58[(2'h2):(2'h2)] : ((((reg67 != reg66) >= (wire70 & wire59)) >>> $signed(reg65)) ?
              $signed($signed((reg65 ? reg64 : wire60))) : $unsigned({{(8'hba)},
                  {(8'hac)}})));
      reg72 <= ({(((8'hb1) * (wire60 ^~ (8'hb7))) ?
                  $signed($signed(reg64)) : wire70)} ?
          $unsigned({reg66[(3'h5):(3'h4)]}) : $unsigned($unsigned($unsigned(reg63))));
      reg73 <= $unsigned($signed({(^~wire62), (reg67 ? {wire58} : (-wire70))}));
    end
  assign wire74 = (+wire59[(3'h6):(3'h5)]);
  always
    @(posedge clk) begin
      reg75 <= reg73;
      reg76 <= (reg64 >> $signed((wire62 != ((reg72 ? wire62 : wire58) ?
          wire61[(3'h5):(1'h0)] : reg68[(4'h8):(3'h4)]))));
    end
  assign wire77 = ($signed(reg71) != wire70[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      if ((($signed(($signed(reg76) ?
          (reg73 >>> reg65) : $signed((8'haf)))) > (7'h44)) <= $unsigned(($unsigned($signed(wire60)) ?
          wire59 : (reg73[(5'h12):(1'h0)] ?
              $signed(wire74) : $unsigned(reg73))))))
        begin
          reg78 <= (reg75[(2'h3):(2'h2)] ?
              ((~$unsigned(reg66[(1'h1):(1'h0)])) ?
                  wire77[(1'h0):(1'h0)] : {wire60, wire61}) : ((wire58 ?
                  ($unsigned(reg65) ?
                      $unsigned(wire77) : {(7'h41),
                          (8'hbb)}) : $signed({wire77})) == (!wire60[(2'h2):(2'h2)])));
          reg79 <= {(reg64 ?
                  $signed(((&reg63) ~^ reg63)) : reg76[(3'h4):(2'h3)]),
              wire59};
          if (({reg76} & wire77[(3'h7):(3'h5)]))
            begin
              reg80 <= {(~|$signed($unsigned(reg65[(4'hb):(3'h6)])))};
              reg81 <= ((8'hb9) ^ (^~wire74[(4'hd):(3'h5)]));
              reg82 <= wire61[(4'h9):(2'h2)];
              reg83 <= $unsigned((((wire58 ?
                      $signed(wire62) : (~reg81)) & (8'ha0)) ?
                  reg64 : (-$signed((!wire62)))));
              reg84 <= $signed(reg75[(4'h8):(1'h1)]);
            end
          else
            begin
              reg80 <= $signed(wire62);
              reg81 <= reg78;
              reg82 <= (reg68 ?
                  ((!reg65[(2'h3):(2'h3)]) ?
                      ((~^{reg66,
                          reg64}) < (+wire77)) : $unsigned(((reg72 && reg72) * $unsigned(reg75)))) : wire77);
              reg83 <= reg79[(3'h4):(2'h2)];
              reg84 <= ((reg68[(3'h6):(1'h1)] ?
                  $signed(((wire58 >= (8'h9d)) <= (wire58 ?
                      reg71 : reg79))) : $signed(((wire74 ?
                      (8'ha4) : reg64) >>> (-wire60)))) > ($signed((~&(reg73 ?
                  wire69 : reg63))) >>> ($unsigned((wire60 ? (7'h40) : reg80)) ?
                  $signed(((8'hbe) ? (8'ha3) : wire70)) : (8'ha8))));
            end
        end
      else
        begin
          reg78 <= ({$unsigned(wire58[(2'h2):(2'h2)]),
                  (reg64 ?
                      (~|(reg65 ?
                          reg83 : reg65)) : (reg65[(4'he):(3'h4)] >> (^~reg84)))} ?
              {$unsigned((reg82[(4'he):(1'h0)] ?
                      reg76[(3'h4):(2'h2)] : wire74[(4'hd):(2'h2)])),
                  $unsigned(wire77)} : (-(wire69 <= $unsigned((-reg78)))));
          reg79 <= $signed($signed($signed(wire60)));
          if (({(({reg68, wire59} >>> {(8'hac)}) >= wire69[(4'hf):(4'hf)]),
              $signed(({reg71, reg67} ?
                  reg72[(1'h1):(1'h0)] : (~reg82)))} == reg76[(2'h2):(1'h0)]))
            begin
              reg80 <= (|$signed((~^reg63[(1'h0):(1'h0)])));
              reg81 <= $signed(reg79[(3'h4):(1'h0)]);
              reg82 <= reg82[(4'h9):(3'h7)];
              reg83 <= reg65[(4'h8):(4'h8)];
              reg84 <= $unsigned((^~(~^{$signed(wire70)})));
            end
          else
            begin
              reg80 <= ($unsigned({wire61}) ?
                  (wire77 - (wire58[(1'h1):(1'h0)] ?
                      reg82[(4'h9):(1'h1)] : (+(~&reg75)))) : ($unsigned($unsigned($signed(reg76))) ?
                      (wire59 ?
                          reg75[(3'h6):(1'h0)] : ((~|wire62) ?
                              $unsigned(reg82) : (&reg75))) : $unsigned(wire69)));
              reg81 <= $unsigned(($unsigned(((wire77 ?
                  reg80 : reg78) < (^~wire59))) && ($signed((!(8'hbe))) ?
                  $unsigned(reg84) : (wire70[(3'h5):(1'h0)] << $unsigned(reg76)))));
            end
        end
      reg85 <= $unsigned(((((reg81 ?
              reg66 : (8'hb2)) - (reg82 <= (8'h9c))) > (~|$unsigned(reg76))) ?
          ($signed((wire60 ? reg72 : reg64)) ?
              ((reg78 <<< reg67) ?
                  {wire70} : $unsigned(wire69)) : $signed(reg78[(5'h12):(1'h1)])) : ({(wire61 * reg75)} ^ wire62[(3'h7):(2'h2)])));
      reg86 <= ($signed($signed(wire77[(2'h2):(2'h2)])) * {$signed((^~$unsigned(reg82)))});
      reg87 <= (-(reg66 <= reg68));
    end
endmodule

module module15
#(parameter param52 = (7'h42), 
parameter param53 = ({({(|param52)} && param52), (~^((~&param52) ? ((8'hbf) >>> param52) : (param52 ? param52 : param52)))} >> param52))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire20;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire [(4'he):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire31;
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire31,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg34,
                 reg33,
                 reg32,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(wire20[(4'hb):(4'hb)]) & (wire17 == $unsigned((~&(8'hbc))))))
        begin
          if ($signed($signed((~$signed((~^wire16))))))
            begin
              reg21 <= ((wire18 | wire20[(3'h6):(3'h6)]) ?
                  $signed($unsigned($signed((~&wire17)))) : (wire19[(2'h2):(2'h2)] ?
                      $unsigned(wire18[(3'h6):(1'h1)]) : $unsigned({(~wire16),
                          wire17})));
              reg22 <= ((~&(wire16[(2'h3):(1'h0)] ?
                  $signed({wire16}) : (!(wire16 == wire17)))) && $signed({reg21,
                  {wire17, $unsigned(wire19)}}));
              reg23 <= (reg22 ?
                  ($unsigned(reg21[(2'h3):(2'h3)]) ?
                      wire19[(2'h2):(1'h0)] : wire18) : $signed({$unsigned($unsigned((8'hb9)))}));
            end
          else
            begin
              reg21 <= wire20[(1'h0):(1'h0)];
              reg22 <= reg21[(3'h4):(1'h1)];
              reg23 <= (wire16 ?
                  ($signed((reg21[(2'h2):(2'h2)] >= wire20[(4'hc):(3'h6)])) & {wire18[(4'he):(4'ha)],
                      $unsigned((^~reg22))}) : wire17);
              reg24 <= ({(((^reg23) ?
                      reg22 : (wire20 ?
                          wire18 : (8'hb9))) & $signed((wire17 != wire19))),
                  reg22} > reg21);
              reg25 <= (wire19 ^ ($unsigned(reg23) >> ({wire16,
                  $unsigned(wire18)} & $unsigned(wire20[(4'hc):(3'h6)]))));
            end
          reg26 <= $signed((wire18 ?
              wire17[(3'h7):(3'h5)] : (-(~^(wire18 - wire20)))));
          if ($signed(((((reg26 <= reg22) ? {wire17} : {reg22}) ?
                  reg24 : (reg21 ? wire20[(1'h1):(1'h1)] : (wire18 * wire17))) ?
              $signed((wire18 ?
                  (reg24 ? wire19 : (8'ha0)) : wire19)) : {{(reg21 < reg21)}})))
            begin
              reg27 <= $signed(reg24);
              reg28 <= $unsigned($signed(reg25));
              reg29 <= (~$signed($unsigned($signed((reg25 ^ wire18)))));
              reg30 <= (((!$unsigned((~&reg29))) <<< reg28[(4'hc):(2'h3)]) ?
                  ({reg22[(3'h4):(2'h2)]} + wire20) : (~^(&$signed($unsigned(wire20)))));
            end
          else
            begin
              reg27 <= reg24;
              reg28 <= (((($signed(reg27) <<< $signed(reg26)) ?
                          {(!wire17), (reg25 - reg22)} : reg30) ?
                      $signed((~|(reg23 ?
                          wire19 : (8'hb0)))) : $signed(wire17[(4'ha):(1'h1)])) ?
                  $unsigned($signed((~^(8'hac)))) : reg29[(4'hb):(3'h5)]);
              reg29 <= $unsigned(($unsigned(((reg29 ? (8'hb1) : (8'hae)) ?
                      (7'h40) : reg29)) ?
                  (~$signed($signed((8'ha7)))) : (~|((reg26 <<< reg25) | (wire18 && wire20)))));
              reg30 <= (-$unsigned(reg25[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          reg21 <= $unsigned((reg29 ?
              $signed($unsigned($unsigned(reg22))) : $unsigned((~^(~reg21)))));
          reg22 <= (reg24 ?
              $signed((wire20 && $unsigned($signed(reg30)))) : (~&reg28[(5'h10):(2'h2)]));
        end
    end
  assign wire31 = {{reg22, $signed($unsigned(reg22[(4'hc):(4'h8)]))},
                      ({$signed(wire19)} ?
                          $unsigned(((&reg30) >> (8'ha4))) : ($signed(reg30) <= wire20[(2'h2):(1'h0)]))};
  always
    @(posedge clk) begin
      reg32 <= ($unsigned((~|{reg26})) ?
          (($signed($unsigned(reg25)) ?
                  reg29 : ({wire16, wire16} ?
                      ((8'ha6) ? reg22 : wire17) : (reg27 ? reg30 : reg21))) ?
              $unsigned(reg27) : $signed(reg26[(2'h3):(1'h1)])) : reg27);
      reg33 <= (8'hbb);
    end
  always
    @(posedge clk) begin
      reg34 <= (($unsigned({$unsigned(reg25)}) ?
          $signed(wire16[(3'h5):(3'h5)]) : $signed($unsigned((!reg26)))) ^ reg30[(3'h4):(1'h0)]);
    end
  assign wire35 = reg25;
  assign wire36 = (($unsigned(reg23[(1'h1):(1'h1)]) ^~ {$unsigned(reg25),
                          (&reg33)}) ?
                      $signed($signed(wire16)) : $unsigned((wire16[(3'h5):(1'h1)] ?
                          $unsigned(wire20) : reg27[(2'h3):(1'h1)])));
  assign wire37 = (reg27 ?
                      ($unsigned($unsigned($unsigned((8'hb2)))) ?
                          ((reg30 ?
                              wire19 : (8'ha1)) >= ((reg23 | reg21) + wire16)) : $signed((|wire35))) : (((^~{wire36}) || reg27[(1'h1):(1'h0)]) ?
                          $unsigned($signed(reg34[(2'h2):(1'h0)])) : $signed($signed(reg29[(3'h6):(3'h6)]))));
  assign wire38 = {wire20[(5'h13):(3'h5)]};
  always
    @(posedge clk) begin
      if ($signed($unsigned((wire31 <= $signed($unsigned(wire31))))))
        begin
          reg39 <= $unsigned({{wire35}, reg25});
          if ((wire37[(1'h1):(1'h0)] ?
              (($unsigned({(8'haf)}) - $signed($signed(wire18))) << reg30) : $signed((+$signed({wire31})))))
            begin
              reg40 <= wire19[(2'h2):(2'h2)];
              reg41 <= (wire17 & (~&(($signed(wire18) + $unsigned(wire18)) * (reg40[(3'h5):(3'h4)] - (~|reg22)))));
              reg42 <= wire36;
            end
          else
            begin
              reg40 <= (~&wire18[(2'h3):(1'h0)]);
              reg41 <= $signed(wire37);
              reg42 <= (reg39 <<< $signed($unsigned((((7'h41) ?
                  wire38 : reg27) < (wire17 && wire37)))));
              reg43 <= wire35[(1'h0):(1'h0)];
            end
          reg44 <= (reg39[(1'h1):(1'h0)] ? (~reg26[(1'h1):(1'h0)]) : wire31);
        end
      else
        begin
          reg39 <= $unsigned(($unsigned($unsigned(wire19)) - $unsigned($signed((reg23 ?
              reg24 : reg29)))));
          reg40 <= ($signed((({wire35} ? $unsigned(reg27) : $signed(wire36)) ?
                  $unsigned((reg22 && (8'hbf))) : (reg39[(1'h1):(1'h0)] || (wire17 ?
                      reg28 : reg33)))) ?
              (8'ha4) : (8'h9f));
          if ((reg42 & ((!reg43[(2'h2):(1'h1)]) ?
              reg39[(2'h2):(2'h2)] : {((reg42 ? reg21 : reg28) >= reg41)})))
            begin
              reg41 <= $unsigned(reg29[(4'ha):(1'h1)]);
              reg42 <= {wire31};
              reg43 <= $unsigned((reg27[(3'h4):(3'h4)] ^ reg21));
              reg44 <= ($signed($unsigned(reg21)) ?
                  reg42[(4'hc):(4'ha)] : (((~((8'haf) >= reg41)) < (~reg27)) ~^ {$signed(reg41),
                      ((wire16 ? wire16 : wire35) ?
                          (reg39 ? wire35 : reg43) : wire38[(4'hb):(2'h3)])}));
              reg45 <= (&$signed(reg21[(2'h3):(2'h3)]));
            end
          else
            begin
              reg41 <= $signed(($signed((wire31 ~^ $unsigned(reg22))) ~^ (^$unsigned((reg30 ?
                  reg27 : reg39)))));
              reg42 <= {$signed(reg42[(4'he):(4'hb)])};
              reg43 <= (((((reg26 << wire16) & (~^wire38)) ?
                      {(reg34 | reg21)} : $unsigned($signed(wire18))) ?
                  $unsigned(reg45[(3'h4):(1'h1)]) : {(-((8'hb3) || wire38))}) - (|reg29));
              reg44 <= ((($signed($unsigned((8'hb0))) ?
                          (reg28[(3'h4):(1'h1)] ?
                              $unsigned(reg29) : reg45) : reg39[(2'h2):(1'h1)]) ?
                      $signed($signed(reg30[(3'h5):(1'h1)])) : reg43[(1'h1):(1'h0)]) ?
                  $signed((+(~$unsigned(reg33)))) : $unsigned({reg27}));
              reg45 <= {$signed(reg21[(3'h6):(2'h2)])};
            end
        end
    end
  assign wire46 = $unsigned(($signed(wire38[(4'hb):(3'h6)]) ^ $unsigned($signed($unsigned(reg43)))));
  assign wire47 = wire37[(1'h1):(1'h1)];
  assign wire48 = $unsigned($unsigned($signed($unsigned((wire36 << reg43)))));
  assign wire49 = ($signed($signed($signed((reg39 ?
                      wire20 : reg25)))) == (|$signed((((8'hae) == reg22) ?
                      wire16 : wire19[(1'h0):(1'h0)]))));
  assign wire50 = {wire37[(1'h0):(1'h0)],
                      ($unsigned(wire31) ^ $unsigned($signed($signed((8'ha9)))))};
  assign wire51 = (+reg30[(2'h3):(2'h2)]);
endmodule
