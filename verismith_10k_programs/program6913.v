module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire65;
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire67,
                 wire65,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
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
                 reg77,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  module4 #() modinst66 (wire65, clk, wire3, wire0, wire1, wire2, (8'hb7));
  assign wire67 = (wire2[(1'h0):(1'h0)] ~^ (((8'hbe) && wire2[(3'h5):(3'h4)]) ~^ $signed(wire65)));
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg68 <= ($signed(($signed(wire65) ?
              {(wire67 != wire65)} : wire1[(2'h3):(1'h1)])) ^ wire0[(3'h6):(2'h3)]);
          reg69 <= (^~$signed({reg68}));
          if ($unsigned(reg69[(2'h2):(2'h2)]))
            begin
              reg70 <= {(wire3[(3'h7):(1'h1)] ?
                      $unsigned($signed((reg68 ?
                          wire2 : wire1))) : (wire1[(3'h5):(2'h2)] - (-(~|wire3)))),
                  ($signed(wire65[(2'h2):(2'h2)]) != $unsigned(reg69[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg70 <= (((wire1 ?
                      {reg69[(2'h2):(1'h0)],
                          wire0[(5'h12):(2'h2)]} : (&$signed(wire2))) + wire65) ?
                  {$signed($unsigned({reg68, wire3})),
                      (wire1 > ($unsigned(reg69) >= (wire1 ?
                          wire67 : wire2)))} : ((~$unsigned($signed(reg68))) ?
                      reg68 : $unsigned({wire1})));
              reg71 <= reg70;
            end
        end
      else
        begin
          reg68 <= {(($unsigned(wire67) >> $signed({reg68})) ?
                  reg69 : $signed($signed(reg69)))};
          reg69 <= $unsigned((&reg70[(4'h8):(3'h4)]));
          reg70 <= reg68[(2'h2):(1'h0)];
        end
      reg72 <= ($unsigned($unsigned((+$signed(reg70)))) ? (^wire1) : wire0);
      reg73 <= reg69[(1'h0):(1'h0)];
    end
  assign wire74 = ($unsigned(((~reg68) ?
                      $unsigned($signed(reg73)) : (~|((8'hab) ?
                          reg69 : reg69)))) >= reg68);
  assign wire75 = reg70;
  assign wire76 = (wire67[(2'h2):(2'h2)] ?
                      $signed($signed((reg69[(1'h0):(1'h0)] & {reg71,
                          reg72}))) : reg73);
  always
    @(posedge clk) begin
      if ((8'hba))
        begin
          reg77 <= ($signed($signed(((-wire1) < reg72))) <<< reg71);
          if (wire75[(3'h6):(3'h5)])
            begin
              reg78 <= $signed($unsigned(($unsigned((wire75 * reg69)) ?
                  $signed(wire67) : (~&$unsigned(reg72)))));
              reg79 <= $unsigned($signed((^~(&$unsigned(wire65)))));
            end
          else
            begin
              reg78 <= {($signed($signed((reg77 && wire1))) ?
                      (~&(~(~wire74))) : (|reg72[(4'hb):(2'h2)])),
                  reg77};
              reg79 <= (!$unsigned(wire74[(4'hb):(4'ha)]));
            end
          reg80 <= (~^reg70);
        end
      else
        begin
          reg77 <= ($signed({(+wire76[(3'h4):(1'h1)]), reg69}) ?
              reg72 : wire2[(3'h7):(1'h0)]);
          reg78 <= (wire65 ?
              $signed($signed((~|(wire3 ?
                  wire1 : reg69)))) : $signed((|wire3[(4'hf):(4'h9)])));
          reg79 <= reg68[(2'h2):(2'h2)];
          reg80 <= ((~^(-(wire74 ?
                  wire0[(5'h11):(4'hf)] : ((8'ha3) == (7'h42))))) ?
              wire76 : $unsigned((~&$unsigned($unsigned(wire3)))));
        end
      if ($signed((reg70 > reg73)))
        begin
          reg81 <= wire76[(1'h1):(1'h0)];
          reg82 <= ((~^$unsigned((reg70[(3'h7):(3'h6)] ?
              $signed(reg70) : reg73))) < (~|$unsigned(({reg80, wire67} ?
              wire65[(3'h7):(3'h6)] : (wire3 ? wire65 : reg77)))));
        end
      else
        begin
          reg81 <= $unsigned((($signed((reg68 ? reg79 : (8'h9d))) ?
              reg82 : wire75) & wire75[(2'h2):(1'h1)]));
        end
      if ($unsigned(wire74))
        begin
          if ((($signed((|{reg70})) << reg79) ?
              $unsigned((~|((wire65 & reg70) ?
                  (~^(8'hbe)) : $signed((8'hac))))) : $unsigned(reg72)))
            begin
              reg83 <= reg71;
              reg84 <= $unsigned($signed(wire1));
              reg85 <= ($unsigned(reg77[(1'h0):(1'h0)]) ?
                  reg70[(3'h7):(3'h5)] : $unsigned(wire76));
              reg86 <= reg72[(4'h8):(3'h7)];
              reg87 <= {((+reg85) ?
                      (~&reg73) : $unsigned(wire65[(4'h8):(3'h4)]))};
            end
          else
            begin
              reg83 <= (reg80[(1'h0):(1'h0)] ?
                  (reg86[(1'h0):(1'h0)] <= ((~&$unsigned(reg68)) ?
                      $signed((reg83 & reg78)) : (reg85[(4'hb):(3'h4)] || (wire65 & wire65)))) : (~((+$signed((8'h9c))) ?
                      ($unsigned((7'h40)) != $unsigned(reg85)) : reg71[(4'hd):(1'h0)])));
              reg84 <= (^~$unsigned(reg83[(1'h1):(1'h0)]));
              reg85 <= wire67;
            end
        end
      else
        begin
          reg83 <= reg80;
          if ((($unsigned(wire0) > (~(+wire1[(4'h8):(3'h5)]))) <<< wire75[(3'h5):(2'h2)]))
            begin
              reg84 <= {(wire65[(3'h5):(1'h1)] >= $unsigned(({reg80} * reg81)))};
            end
          else
            begin
              reg84 <= (((-$unsigned($signed((8'h9c)))) ?
                  reg68 : $signed(((reg84 << wire2) ?
                      (wire74 ^ wire1) : $unsigned(wire0)))) > wire74);
            end
        end
      reg88 <= (((8'hb5) != (8'haf)) ? $signed(reg72) : reg82);
      reg89 <= ((($signed($signed(reg69)) ?
                  {{reg88, reg86}, reg84[(4'h8):(1'h0)]} : {(reg83 + wire76),
                      (reg84 + wire1)}) ?
              (^(~^(&wire65))) : (reg87 - {(reg78 < wire0)})) ?
          ((($signed(wire75) ?
                  (reg78 ? reg86 : (7'h40)) : wire65[(2'h3):(1'h0)]) ?
              wire2 : $unsigned(reg68)) ~^ (|$signed({reg77,
              (8'haf)}))) : (wire65[(2'h3):(1'h1)] ?
              reg87 : $signed(({(8'hb3)} ~^ ((8'had) ? reg71 : (8'hb1))))));
    end
  always
    @(posedge clk) begin
      reg90 <= $signed(reg78);
      reg91 <= reg68[(1'h1):(1'h1)];
      reg92 <= ($unsigned($signed(wire74)) - $signed(($signed($signed((8'ha3))) <<< ((wire75 <<< reg90) < (&reg78)))));
      reg93 <= $unsigned((wire76[(3'h6):(1'h0)] ?
          {{(~wire76)},
              $unsigned($signed(reg89))} : {($unsigned((8'hb8)) && $unsigned(reg84)),
              $unsigned($unsigned(wire1))}));
    end
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire5;
  input wire [(4'hd):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire36;
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire39,
                 wire38,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire36,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
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
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire10 = (&(({$unsigned(wire7)} && (&(wire7 ? wire6 : (8'ha0)))) ?
                      $unsigned($signed(wire5[(2'h2):(1'h0)])) : $signed(((~&(8'h9d)) || wire8))));
  assign wire11 = {wire9, wire7[(2'h3):(2'h3)]};
  assign wire12 = (~($unsigned($signed($unsigned(wire8))) ?
                      $signed((|wire11[(3'h5):(2'h2)])) : (wire6[(4'hb):(4'hb)] ?
                          ($unsigned((8'ha4)) ?
                              {(8'hb5), wire10} : (wire5 ?
                                  wire7 : wire7)) : wire7[(4'hb):(4'hb)])));
  assign wire13 = ({$signed(wire8),
                          ((&(~|wire9)) ?
                              $unsigned(wire12) : wire8[(2'h3):(1'h0)])} ?
                      (8'hb9) : (+wire6));
  assign wire14 = ((+($signed($signed(wire6)) ?
                          $signed($signed(wire8)) : (~^(wire13 != wire12)))) ?
                      ({(|$signed(wire5)),
                              (wire6 ?
                                  (wire13 ? wire13 : wire13) : (!wire12))} ?
                          $signed(wire8) : (~wire12[(4'ha):(3'h5)])) : $unsigned($signed(wire13)));
  assign wire15 = (((^~wire9) ?
                      $unsigned(($unsigned(wire5) <<< (+wire8))) : $unsigned(wire9)) * (~&(^~$unsigned(wire12[(4'hc):(3'h7)]))));
  assign wire16 = (~^(($signed(wire12[(2'h3):(2'h3)]) & $signed(wire12)) ?
                      wire9 : wire5));
  module17 #() modinst37 (wire36, clk, wire5, wire11, wire9, wire15, wire14);
  assign wire38 = {$unsigned((!{(^wire9)})), wire10[(4'he):(4'hd)]};
  assign wire39 = (({(&wire9[(4'h8):(3'h7)])} ?
                      {wire5[(3'h6):(1'h0)]} : $signed((!wire12))) <<< (wire10[(4'hd):(3'h4)] ?
                      (7'h44) : wire16[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg40 <= (wire39[(3'h5):(1'h1)] & $unsigned(wire13));
      if (wire13[(1'h1):(1'h1)])
        begin
          reg41 <= (+wire5);
        end
      else
        begin
          reg41 <= $unsigned(($signed(wire12) <= ($unsigned(wire6) ?
              wire16[(1'h0):(1'h0)] : wire7)));
          reg42 <= (($signed($unsigned($unsigned((8'ha4)))) ?
              wire38[(3'h7):(3'h7)] : wire10) >> {wire9});
          reg43 <= reg42;
        end
      reg44 <= (^$unsigned(wire13[(1'h0):(1'h0)]));
      if ((!wire13[(1'h0):(1'h0)]))
        begin
          reg45 <= wire14[(1'h0):(1'h0)];
          reg46 <= ($unsigned($unsigned(((wire15 ~^ (8'hb4)) ?
              $signed((8'ha0)) : (reg41 < reg42)))) >>> $unsigned($signed((~^wire16))));
          reg47 <= {wire39[(3'h4):(1'h1)]};
          reg48 <= ((~|(!$signed(wire8[(1'h1):(1'h0)]))) + $signed($unsigned($unsigned($signed(reg47)))));
        end
      else
        begin
          if (($unsigned($unsigned(((reg46 >> wire13) ?
              (reg41 ? reg44 : wire10) : {(8'hbc)}))) ^ (~(|(^~{reg40})))))
            begin
              reg45 <= $signed((({(reg44 ? (7'h40) : reg46), wire15} ?
                  $unsigned($unsigned(reg42)) : {{wire36, wire13}}) != wire12));
              reg46 <= wire8;
              reg47 <= reg46;
            end
          else
            begin
              reg45 <= $signed(reg42[(4'h8):(2'h3)]);
              reg46 <= $signed(wire14);
              reg47 <= (~$signed({($signed(wire13) >>> $signed(wire9)),
                  wire16[(3'h5):(1'h0)]}));
              reg48 <= reg42[(3'h4):(1'h1)];
            end
          if (({(reg47 ? ($signed((8'h9e)) >>> (|reg41)) : $signed({reg47})),
              ({{wire38}} ?
                  ($unsigned(wire16) ^ ((8'hb8) & reg42)) : {$signed(wire12),
                      reg44})} >> {reg45, wire16[(3'h4):(1'h1)]}))
            begin
              reg49 <= $signed($signed(($signed((^reg42)) ?
                  $unsigned($unsigned(wire10)) : ($unsigned(reg46) & wire8))));
              reg50 <= wire6;
              reg51 <= {reg43, wire36};
              reg52 <= $signed((+((|{reg47}) - ($signed((8'h9f)) ?
                  {reg44, wire39} : {(8'haf), wire9}))));
              reg53 <= wire16;
            end
          else
            begin
              reg49 <= {wire38};
            end
        end
      reg54 <= ($unsigned((~|(+$unsigned(reg51)))) ?
          {($unsigned($unsigned((8'h9c))) & reg50[(1'h1):(1'h0)]),
              wire6[(2'h3):(1'h1)]} : wire38[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg55 <= $unsigned(reg42);
      if (($signed($unsigned(reg42[(3'h6):(2'h3)])) ~^ ((reg42 >> {{wire36,
              wire36},
          $unsigned(reg40)}) ^~ $signed($unsigned((reg45 ? wire14 : reg54))))))
        begin
          reg56 <= (wire16 ?
              (($unsigned($unsigned(reg43)) ?
                  $signed($unsigned(wire38)) : (-wire9[(4'hd):(3'h4)])) & {$unsigned($unsigned(reg42))}) : reg49[(1'h1):(1'h1)]);
          reg57 <= ((~$signed((wire12[(3'h6):(3'h6)] + (wire15 ^ reg43)))) ?
              wire39[(3'h6):(1'h1)] : (reg45 > wire11[(3'h6):(3'h5)]));
          reg58 <= ({($signed((8'hbe)) ? reg42 : reg54),
              $signed({((8'ha0) != wire6),
                  wire15[(5'h12):(5'h10)]})} + (!(8'hb5)));
          reg59 <= ($signed(({$unsigned(reg54)} ?
              (wire15 ? {wire15, reg49} : (|(8'hb0))) : $unsigned((wire16 ?
                  wire14 : wire5)))) ^~ $signed($unsigned($signed((~(8'hab))))));
          reg60 <= (8'h9c);
        end
      else
        begin
          reg56 <= $signed(({reg47[(1'h0):(1'h0)],
              ((-wire9) ?
                  reg59[(4'hb):(2'h3)] : (wire7 ?
                      wire13 : reg46))} > $signed($signed($unsigned(reg42)))));
        end
      reg61 <= ($signed(wire15) * {$unsigned((~|(!reg47)))});
      reg62 <= {((^~{(wire6 ?
                  wire9 : reg45)}) >= (($unsigned(wire5) == (wire14 - wire6)) ?
              (8'hb0) : (8'hba)))};
    end
  assign wire63 = wire6[(1'h0):(1'h0)];
  assign wire64 = $signed((8'hbd));
endmodule

module module17
#(parameter param34 = ((!(~(8'hbf))) ? (~^(((^~(8'haa)) ? (~^(8'hba)) : (~(7'h41))) ? {((8'hbd) < (8'hb7)), ((8'ha0) ? (8'hae) : (8'hb9))} : (~|((8'ha3) && (8'ha9))))) : (&(-{{(7'h42), (7'h40)}}))), 
parameter param35 = {param34, param34})
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire22;
  input wire [(4'h8):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= $signed((+(~((wire20 ? wire18 : wire21) ?
          wire22[(2'h3):(2'h2)] : ((8'hbd) >> wire18)))));
      reg24 <= wire21;
      reg25 <= ($signed($signed(({reg24} ?
              reg24[(4'hc):(2'h2)] : wire20[(2'h2):(2'h2)]))) ?
          $signed(wire18[(1'h0):(1'h0)]) : (~reg24[(4'he):(4'hb)]));
      reg26 <= wire22[(4'hb):(4'h9)];
    end
  assign wire27 = $unsigned($unsigned(wire20[(2'h2):(1'h1)]));
  assign wire28 = (wire27 ?
                      {(({reg25} ? $unsigned(wire27) : reg25[(5'h10):(4'hd)]) ?
                              $unsigned((^~wire21)) : (7'h41)),
                          (reg26 ?
                              reg23[(2'h2):(1'h1)] : (~&{reg26,
                                  wire19}))} : (((&(~&(7'h41))) < wire27) ?
                          (~^{(|reg25)}) : (8'hbc)));
  assign wire29 = $signed($unsigned($unsigned((~^(+wire20)))));
  assign wire30 = (wire29[(2'h2):(1'h0)] ?
                      wire27[(3'h6):(3'h4)] : ({(((8'haf) ? (7'h40) : wire21) ?
                                  (reg25 ? reg25 : reg24) : (^reg25))} ?
                          wire27[(2'h2):(1'h0)] : $unsigned($unsigned($unsigned(reg25)))));
  assign wire31 = (wire29 >>> $unsigned(((^((8'hb1) ? wire28 : wire19)) ?
                      wire29 : ((wire22 ? wire19 : wire29) * ((7'h41) ?
                          wire18 : wire22)))));
  assign wire32 = $signed((8'hac));
  assign wire33 = {$signed($signed({reg24})), reg25};
endmodule
