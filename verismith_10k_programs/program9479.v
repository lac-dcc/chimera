module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire87, wire85, wire4, reg6, reg5, (1'h0)};
  assign wire4 = (wire3[(1'h0):(1'h0)] * $signed(wire1));
  always
    @(posedge clk) begin
      reg5 <= wire0;
      reg6 <= wire4[(1'h0):(1'h0)];
    end
  module7 #() modinst86 (wire85, clk, reg5, reg6, wire0, wire1);
  assign wire87 = (~^(8'hbf));
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire80;
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire80,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire12 = (wire8[(4'ha):(1'h1)] | (!$signed((~&$unsigned(wire10)))));
  assign wire13 = (wire12 ?
                      {{(8'ha6),
                              ({wire9} ?
                                  wire9 : ((8'ha2) || (8'hb6)))}} : wire11[(4'ha):(2'h3)]);
  assign wire14 = $unsigned($signed((wire13[(1'h1):(1'h1)] ?
                      (wire10[(3'h5):(3'h4)] ?
                          (&(8'ha5)) : (wire12 ? (8'hae) : wire13)) : wire10)));
  assign wire15 = (8'ha5);
  assign wire16 = wire11[(1'h0):(1'h0)];
  assign wire17 = ((|$signed(($unsigned(wire16) ?
                      $signed((8'hab)) : $unsigned(wire12)))) >>> wire12);
  assign wire18 = wire16[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed(wire14[(1'h0):(1'h0)]))
        begin
          reg19 <= (~&(wire14 ?
              wire13[(1'h0):(1'h0)] : $unsigned(((~^wire16) > $unsigned((8'hba))))));
          reg20 <= (wire18[(1'h1):(1'h1)] ?
              wire14[(1'h1):(1'h0)] : {$unsigned(((8'hac) ^~ (~^reg19))),
                  $unsigned(({(8'hae), wire18} - (wire16 ? wire11 : wire16)))});
          if ((~^wire18))
            begin
              reg21 <= ($signed({($signed(wire12) ?
                          {wire8, wire15} : (wire16 ? (7'h40) : wire15)),
                      wire9}) ?
                  (reg19[(3'h4):(3'h4)] || wire17[(3'h5):(1'h1)]) : (~^wire15));
              reg22 <= ($signed((reg19 == $unsigned($unsigned(wire17)))) ?
                  $unsigned(($signed($unsigned(wire14)) <= $signed((+wire8)))) : reg20);
              reg23 <= (($signed(((reg20 ? reg22 : (8'haa)) ?
                      wire16[(3'h5):(3'h4)] : $signed(wire11))) ?
                  wire16[(3'h5):(3'h4)] : (wire16[(2'h3):(1'h0)] ?
                      {wire10[(1'h0):(1'h0)],
                          wire16[(2'h2):(1'h1)]} : wire10)) * $signed((((~&wire16) ?
                      (wire13 ? wire9 : wire17) : wire9) ?
                  $unsigned($unsigned(wire9)) : $signed(wire9))));
            end
          else
            begin
              reg21 <= (&((^~($unsigned(wire9) * reg20)) <<< (^((&(8'ha8)) ?
                  {reg22} : (^(8'ha4))))));
            end
          reg24 <= wire8;
        end
      else
        begin
          reg19 <= (reg24[(3'h4):(1'h0)] ?
              ((({wire18, wire17} || wire16[(1'h1):(1'h1)]) ?
                      $signed($signed(reg23)) : $signed((8'hb0))) ?
                  (wire10 - ({reg23} ?
                      (8'hb1) : (wire10 != reg19))) : (~^wire18[(5'h11):(2'h2)])) : (~|(!reg19[(4'h9):(4'h9)])));
          reg20 <= $signed(wire8[(5'h10):(1'h1)]);
        end
      reg25 <= $signed((~((reg23[(3'h4):(1'h0)] + (-reg21)) ~^ $unsigned((wire8 <<< reg19)))));
      reg26 <= (wire10 ? $signed($unsigned($unsigned((~^(8'ha3))))) : wire15);
    end
  module27 #() modinst81 (.wire28(wire10), .wire30(reg25), .clk(clk), .wire31(reg26), .wire29(reg20), .y(wire80));
  assign wire82 = reg25[(3'h7):(3'h7)];
  assign wire83 = (($unsigned((&$signed(wire15))) ?
                      wire13 : $unsigned((-reg19[(4'he):(3'h7)]))) << $unsigned(reg19));
  assign wire84 = (+wire12[(1'h0):(1'h0)]);
endmodule

module module27
#(parameter param79 = ((8'ha8) ? (!((!(7'h41)) >>> (8'hbf))) : (((((8'hbf) ? (8'h9d) : (8'haa)) ? ((8'h9c) ? (8'hbe) : (8'ha5)) : ((8'ha9) <<< (8'ha7))) ? {((8'haf) ? (8'hb7) : (8'hb9))} : (~&((8'hb2) ? (8'ha3) : (7'h43)))) - {((|(8'ha7)) ? {(7'h43), (8'haf)} : {(8'ha6), (8'hae)})})))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h234):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire signed [(4'ha):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire29;
  input wire [(5'h11):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire32;
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  assign y = {wire78,
                 wire58,
                 wire57,
                 wire40,
                 wire32,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire32 = wire28;
  always
    @(posedge clk) begin
      if (({$unsigned(((~&wire29) ?
                  (wire31 != (8'had)) : wire31[(1'h0):(1'h0)])),
              $unsigned(wire28)} ?
          $unsigned(wire32) : (wire31[(1'h0):(1'h0)] - $unsigned(wire30))))
        begin
          if ((|$unsigned((((wire29 ? wire32 : wire31) & $signed(wire31)) ?
              $unsigned({wire30, wire29}) : ((&(8'h9f)) ?
                  wire30 : (wire32 <<< (8'hb5)))))))
            begin
              reg33 <= {{(+((wire29 < wire29) <= (~^wire31))), (8'ha5)},
                  wire31[(3'h6):(3'h6)]};
              reg34 <= (wire28 ? {wire31} : (^~$signed(wire31[(4'ha):(4'ha)])));
            end
          else
            begin
              reg33 <= $unsigned($unsigned({wire32[(1'h1):(1'h1)],
                  {wire31[(3'h5):(1'h1)]}}));
              reg34 <= $signed({reg34[(5'h11):(4'hb)],
                  ((wire31 ? reg34 : (~wire28)) ?
                      (8'haa) : $signed(wire31[(1'h0):(1'h0)]))});
              reg35 <= ($unsigned(reg33) << $unsigned(wire30));
              reg36 <= $unsigned($unsigned(((^~(8'ha9)) ?
                  reg35[(1'h1):(1'h1)] : (-(wire32 >= (8'hb5))))));
              reg37 <= $unsigned(reg36);
            end
          reg38 <= {reg36[(3'h4):(1'h0)]};
        end
      else
        begin
          reg33 <= wire28[(4'hd):(4'hd)];
          reg34 <= {{(wire28[(4'hb):(3'h6)] - wire29[(2'h3):(2'h3)]),
                  $unsigned($unsigned(reg35))},
              (^~(($unsigned((8'h9d)) ?
                  reg34 : ((8'ha5) >= (8'hb2))) * (8'hb9)))};
        end
      reg39 <= wire28[(2'h2):(2'h2)];
    end
  assign wire40 = $signed(($unsigned(reg38) < wire29));
  always
    @(posedge clk) begin
      reg41 <= ({$signed(reg37)} - $unsigned((((wire29 ? reg37 : wire29) ?
              reg37[(1'h1):(1'h1)] : $signed((7'h41))) ?
          ($unsigned(reg34) ?
              $signed(reg37) : (reg37 ?
                  wire30 : wire31)) : (^~$unsigned(reg35)))));
      if (wire32[(2'h3):(1'h0)])
        begin
          reg42 <= (($signed($signed((!reg33))) ?
              (^~$signed($signed(reg36))) : (~(reg36 ?
                  {wire28} : reg38[(4'he):(4'hc)]))) && (~|($unsigned((8'hbe)) + reg36)));
        end
      else
        begin
          reg42 <= (((reg36 ^~ reg35[(3'h4):(2'h3)]) || wire30[(2'h2):(2'h2)]) == {($signed((~&(8'hb3))) ?
                  (|(~^reg34)) : (((8'ha5) & wire32) <<< (reg38 ?
                      reg39 : reg39)))});
        end
      reg43 <= (~^(|{((^~wire40) >> (wire28 ~^ reg41)),
          (|(wire29 <<< wire29))}));
      if (reg42)
        begin
          if ($signed($signed($unsigned($signed((reg38 && reg37))))))
            begin
              reg44 <= (reg33 <= $signed($unsigned(((+wire32) - reg34[(4'ha):(1'h1)]))));
              reg45 <= wire29[(1'h1):(1'h1)];
              reg46 <= ($signed(($unsigned($unsigned(reg44)) ^ $unsigned({reg44}))) ?
                  $unsigned(wire28[(2'h2):(1'h1)]) : {reg43, wire29});
              reg47 <= ((wire31[(3'h6):(3'h5)] || (((reg34 ? wire29 : reg42) ?
                      reg44 : $unsigned(wire29)) > (reg41[(4'hb):(3'h5)] | (^~(8'hb8))))) ?
                  (wire31 ?
                      reg33 : $unsigned(reg37[(1'h1):(1'h0)])) : (reg41 - ({(|(8'haf)),
                      (wire31 ? wire29 : wire29)} < $signed($signed(reg43)))));
              reg48 <= reg46;
            end
          else
            begin
              reg44 <= reg43[(4'ha):(3'h7)];
              reg45 <= (~&reg35[(1'h0):(1'h0)]);
            end
          if (((|reg48) ? reg38 : $unsigned((reg46[(4'h9):(4'h8)] || reg39))))
            begin
              reg49 <= reg45;
              reg50 <= $signed({$signed(wire28)});
              reg51 <= $signed((8'h9f));
              reg52 <= reg47[(2'h3):(1'h1)];
            end
          else
            begin
              reg49 <= ({(-$unsigned(reg48[(3'h5):(3'h4)]))} ?
                  $signed((reg50 ?
                      wire29 : (reg45 ?
                          $signed(reg49) : $unsigned(wire28)))) : {(($signed(wire28) ?
                              reg42 : $signed((8'h9c))) ?
                          ($signed((8'hb6)) >> (+reg44)) : reg42)});
              reg50 <= ({(((|reg35) ?
                          $unsigned(reg34) : $unsigned(reg36)) * $unsigned($signed(reg52))),
                      wire32[(1'h1):(1'h1)]} ?
                  ($unsigned({reg35, reg33}) >>> reg45) : (!reg38));
              reg51 <= $signed($unsigned(wire40));
              reg52 <= reg42[(4'he):(4'he)];
              reg53 <= reg33[(4'hd):(4'h8)];
            end
          reg54 <= (|(^{$signed((reg38 > reg33)), $signed(wire28)}));
          reg55 <= $signed(reg47[(3'h6):(1'h1)]);
          reg56 <= (+$unsigned((-(~reg45[(3'h7):(1'h0)]))));
        end
      else
        begin
          reg44 <= {($unsigned(((reg39 <= (7'h43)) < reg48[(2'h3):(1'h1)])) ?
                  reg55 : $unsigned({reg51[(3'h4):(2'h2)], {reg45, (8'hbd)}})),
              (^~(~^reg46))};
          reg45 <= wire32[(3'h5):(2'h2)];
          if ((reg41 ?
              reg36[(4'ha):(3'h7)] : $unsigned((((8'ha1) >= (reg48 && (8'h9e))) >> {reg42[(5'h12):(4'hd)]}))))
            begin
              reg46 <= $signed(wire29);
              reg47 <= {((wire30[(1'h0):(1'h0)] >>> reg52) ?
                      {(^(|wire31))} : $signed(reg43[(4'h8):(1'h1)]))};
              reg48 <= reg53;
            end
          else
            begin
              reg46 <= $unsigned(reg55[(4'hb):(3'h7)]);
              reg47 <= $signed((^((~reg49) & $unsigned((reg38 ?
                  reg55 : reg37)))));
              reg48 <= ($unsigned(((|$unsigned(reg36)) ?
                      reg35[(2'h2):(2'h2)] : {reg50, wire40})) ?
                  $signed(reg50[(3'h4):(1'h1)]) : ((~&reg44[(3'h6):(1'h1)]) >> (reg36 <<< ($unsigned((8'h9d)) ?
                      (reg53 ? reg33 : reg50) : $signed(reg49)))));
              reg49 <= $signed(((~^($unsigned(reg41) + (reg44 ~^ (8'ha8)))) + (^~{(reg54 * (8'hbf))})));
            end
          reg50 <= $signed({($unsigned($unsigned(reg48)) ?
                  ((reg35 ? wire28 : wire32) << reg41) : (^((8'hb6) ?
                      wire30 : (8'hbe))))});
        end
    end
  assign wire57 = $unsigned(((((reg43 ? reg37 : wire40) ?
                          (reg47 ?
                              reg53 : reg36) : ((8'hb3) ^ reg53)) * reg54[(2'h2):(2'h2)]) ?
                      $signed({(wire28 | reg34)}) : reg47));
  assign wire58 = $unsigned($signed($unsigned(wire30[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if ($signed(reg39))
        begin
          reg59 <= reg55;
          if (wire31[(4'ha):(3'h7)])
            begin
              reg60 <= wire29[(2'h3):(1'h1)];
              reg61 <= $unsigned(reg48[(1'h0):(1'h0)]);
              reg62 <= (+$signed((&{{wire58, reg54}, $signed(reg51)})));
              reg63 <= ((reg55[(3'h4):(2'h3)] ^ $signed($unsigned($signed(reg35)))) ?
                  reg36[(1'h1):(1'h0)] : $signed($unsigned($unsigned(((8'had) ^ reg56)))));
            end
          else
            begin
              reg60 <= ($signed($unsigned(($unsigned((7'h44)) ?
                  reg61[(4'hc):(4'h8)] : (-wire31)))) >>> (({reg46[(3'h7):(1'h1)],
                      reg33} ?
                  (reg56 ?
                      $signed(wire31) : wire40[(3'h4):(3'h4)]) : (~^((8'ha8) ?
                      reg48 : reg39))) > $unsigned((|(&(7'h42))))));
              reg61 <= (reg59[(1'h0):(1'h0)] ?
                  reg63[(2'h2):(1'h0)] : $unsigned($unsigned($signed($unsigned(reg60)))));
            end
          reg64 <= {$unsigned(reg61[(5'h11):(4'ha)])};
          reg65 <= $unsigned({reg34[(5'h11):(2'h3)]});
          reg66 <= {(reg43 != $signed($signed((~&reg37))))};
        end
      else
        begin
          reg59 <= ({$unsigned(($signed((8'hb8)) ?
                      (reg39 ? wire57 : (8'hb7)) : reg59))} ?
              reg47 : (((~(^~reg42)) == reg35[(1'h1):(1'h0)]) != ($signed(wire30[(1'h0):(1'h0)]) ?
                  {(reg39 ? wire57 : reg43),
                      reg39[(2'h2):(2'h2)]} : wire29[(2'h2):(2'h2)])));
          reg60 <= ($unsigned({reg43[(2'h3):(1'h0)]}) + $signed(($signed($signed((8'hb6))) ?
              $signed({(8'hab), (8'hb7)}) : $unsigned($signed(wire28)))));
        end
      if (reg49)
        begin
          reg67 <= ((8'h9f) ?
              $signed((-(wire58 <= $unsigned(reg66)))) : (~^reg49));
          reg68 <= {$signed((-(!wire28[(1'h1):(1'h1)])))};
          reg69 <= (({$signed((wire28 ? reg43 : wire58))} ?
                  (^wire29[(2'h3):(1'h1)]) : (reg33[(1'h0):(1'h0)] ?
                      wire31[(3'h4):(1'h0)] : reg39[(3'h4):(2'h2)])) ?
              $unsigned($unsigned({reg64,
                  (reg35 ? (8'ha0) : wire57)})) : reg46);
          reg70 <= (8'ha8);
          reg71 <= ((7'h44) ?
              reg66 : (~&$unsigned($signed((wire32 ? reg47 : reg70)))));
        end
      else
        begin
          if ((reg69 ~^ reg65))
            begin
              reg67 <= {(reg38[(4'hc):(3'h7)] >>> $signed({(8'ha2),
                      (reg43 - reg52)})),
                  (&reg69[(3'h4):(3'h4)])};
              reg68 <= (8'ha8);
              reg69 <= ($signed((((reg44 >>> (8'hac)) ?
                      $signed((8'hb9)) : reg60) ?
                  $unsigned(reg66[(2'h3):(2'h2)]) : reg33[(4'hc):(2'h2)])) ~^ {reg35});
              reg70 <= wire58[(2'h2):(1'h1)];
              reg71 <= reg50[(2'h2):(1'h0)];
            end
          else
            begin
              reg67 <= (~|(+(+reg47[(1'h0):(1'h0)])));
              reg68 <= ((-(({reg55} - $signed((8'hac))) ?
                  (~$signed(reg69)) : (reg68 | (reg45 || reg37)))) ~^ wire57[(3'h4):(1'h0)]);
              reg69 <= reg52;
              reg70 <= reg54;
            end
          reg72 <= (($unsigned(reg70[(5'h10):(3'h7)]) ?
              (8'hb2) : (+$signed($unsigned((8'ha0))))) <<< ((&(8'haf)) ?
              (reg63[(4'hf):(4'hc)] ?
                  (8'hb6) : (reg45 - (reg37 | wire57))) : (~&{(reg66 ?
                      reg71 : reg33)})));
          reg73 <= (reg41[(4'hd):(4'h8)] >> $signed({((!(8'hb1)) != reg41)}));
        end
    end
  always
    @(posedge clk) begin
      reg74 <= $unsigned(reg48);
      reg75 <= ($signed(($signed({(7'h41)}) * reg66[(3'h6):(2'h3)])) != reg50[(2'h3):(1'h0)]);
      reg76 <= $unsigned(reg43[(3'h4):(2'h2)]);
      reg77 <= reg53;
    end
  assign wire78 = (^~wire31);
endmodule
