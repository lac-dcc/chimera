module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire134;
  wire signed [(5'h15):(1'h0)] wire132;
  wire [(2'h2):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire30;
  assign y = {wire134,
                 wire132,
                 wire34,
                 wire33,
                 wire32,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire30,
                 (1'h0)};
  assign wire4 = ($signed($signed($signed((wire2 ^~ wire3)))) || $unsigned(wire2[(3'h7):(1'h1)]));
  assign wire5 = $unsigned(wire0);
  assign wire6 = (((wire1 <= $unsigned(wire4)) ^~ wire4[(5'h11):(4'he)]) <<< wire0);
  assign wire7 = ($unsigned((wire1[(4'hf):(1'h1)] ?
                     {((8'had) - wire1)} : wire6)) >>> {{wire3,
                         $unsigned(wire6)},
                     ((wire5[(5'h12):(2'h3)] - (wire3 ? wire1 : wire6)) ?
                         (8'haf) : (wire0 > (wire2 > wire0)))});
  assign wire8 = $signed((wire3 ?
                     {((wire7 >= wire2) ? $signed(wire7) : $unsigned(wire5)),
                         {(wire1 ?
                                 wire2 : wire1)}} : $signed($unsigned(wire1[(4'hd):(4'h9)]))));
  module9 #() modinst31 (wire30, clk, wire8, wire1, wire3, wire7, wire0);
  assign wire32 = wire2;
  assign wire33 = (8'hba);
  assign wire34 = wire32;
  module35 #() modinst133 (.wire36(wire8), .wire37(wire0), .clk(clk), .wire38(wire1), .wire39(wire2), .y(wire132));
  assign wire134 = {wire3};
endmodule

module module35  (y, clk, wire36, wire37, wire38, wire39);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire36;
  input wire signed [(5'h10):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire38;
  input wire [(5'h13):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire127;
  wire [(5'h10):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire112;
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(3'h5):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  assign y = {wire131,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire114,
                 wire40,
                 wire56,
                 wire57,
                 wire112,
                 reg130,
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
                 reg115,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
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
                 (1'h0)};
  assign wire40 = $unsigned(((($unsigned(wire39) ^~ (~&wire37)) - $unsigned((wire39 >> wire39))) ?
                      $unsigned(((wire39 ? wire39 : (8'hac)) ?
                          (!wire38) : $signed(wire39))) : $unsigned((&(8'ha8)))));
  always
    @(posedge clk) begin
      reg41 <= ((+((~|((8'ha4) ?
          wire39 : wire38)) <<< (~(wire36 <= wire37)))) <<< wire37);
      reg42 <= (8'h9c);
      reg43 <= (((~&wire40[(5'h10):(1'h0)]) * wire38) || ((~(~^(wire40 < (8'ha3)))) ?
          ({{wire39, wire40}} ?
              (reg41 ? (&wire40) : $unsigned((8'haf))) : ((wire36 >>> reg42) ?
                  (^wire39) : $signed(wire37))) : $unsigned(((^~wire40) ?
              (reg42 ? wire38 : wire38) : (reg41 ? wire37 : reg42)))));
    end
  always
    @(posedge clk) begin
      reg44 <= reg43;
      reg45 <= reg41;
      if (wire39[(3'h5):(3'h5)])
        begin
          if ((($unsigned($unsigned((wire39 ? (8'h9d) : wire40))) ?
              (reg45 ?
                  ((wire39 ?
                      wire39 : reg43) < reg42) : (+(reg41 == reg45))) : reg44) == $signed($signed(((^wire37) > ((8'hbc) ?
              wire36 : (8'ha2)))))))
            begin
              reg46 <= ($unsigned(($signed(wire36[(1'h0):(1'h0)]) & (reg42 ?
                  reg42[(1'h1):(1'h1)] : $unsigned(reg43)))) * ($signed(((reg44 < (8'hbf)) || $unsigned(wire37))) | wire36));
            end
          else
            begin
              reg46 <= (-(~^(~&($unsigned(reg41) ^ (|wire39)))));
              reg47 <= $signed(reg46);
              reg48 <= reg44;
            end
        end
      else
        begin
          reg46 <= $unsigned({(-$signed($signed(reg42))),
              ({reg44[(4'hb):(3'h4)], (wire40 >>> reg47)} & $unsigned((wire39 ?
                  wire36 : wire37)))});
          reg47 <= $signed(({$signed($signed((8'hb0))),
              (~^$signed(wire37))} - {(wire37 ?
                  $unsigned(wire40) : (~|wire36))}));
          reg48 <= reg45[(4'he):(4'hc)];
          reg49 <= {$signed(($unsigned(reg45[(5'h10):(3'h7)]) ?
                  {wire39[(4'hf):(3'h5)], reg43} : reg46[(3'h4):(2'h3)]))};
        end
      reg50 <= $unsigned((~|(8'hbb)));
      reg51 <= {$unsigned((~|{{reg50, reg43}})),
          {(reg47[(2'h3):(2'h2)] ? $signed((|(8'hb2))) : reg48[(5'h13):(2'h2)]),
              reg50}};
    end
  always
    @(posedge clk) begin
      reg52 <= ($unsigned({reg43[(4'h8):(1'h0)]}) + (^~reg49));
      reg53 <= reg44;
      reg54 <= $unsigned((^(reg41 ? $signed(reg48) : reg52)));
      reg55 <= wire36;
    end
  assign wire56 = $signed($signed(((&(8'hb1)) + ($signed(wire38) ?
                      $unsigned(reg45) : {reg48}))));
  assign wire57 = (wire36 ?
                      (~&(|{(reg50 ? (8'hba) : reg45),
                          $signed(reg55)})) : reg41[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg58 <= $unsigned((-{wire37[(2'h3):(1'h0)]}));
      reg59 <= reg45[(2'h2):(1'h1)];
      reg60 <= reg44[(1'h1):(1'h0)];
      if ((!$signed(wire36)))
        begin
          reg61 <= ($signed($unsigned($signed(reg51))) >> $unsigned((reg46[(2'h2):(1'h1)] ?
              $signed($unsigned(wire40)) : $signed({reg55}))));
          if (((~^(((8'hb9) ? $signed(reg47) : $unsigned(reg50)) ?
              ((|reg45) + {wire39,
                  reg42}) : $unsigned($unsigned(wire39)))) * (^~reg53[(1'h0):(1'h0)])))
            begin
              reg62 <= {reg48};
              reg63 <= reg54;
            end
          else
            begin
              reg62 <= (+{($signed($unsigned(wire57)) ?
                      $unsigned((reg50 && wire37)) : reg44[(3'h5):(1'h1)]),
                  wire38[(3'h4):(2'h2)]});
              reg63 <= reg49[(3'h5):(1'h0)];
              reg64 <= wire37[(2'h3):(2'h3)];
              reg65 <= $signed($signed(((~|$unsigned((7'h41))) ?
                  (+(reg43 ?
                      reg64 : reg44)) : ((+wire39) ~^ (reg50 <<< reg60)))));
              reg66 <= wire56[(3'h5):(2'h2)];
            end
          if ((wire39[(4'hc):(4'hc)] << $signed($unsigned(wire37[(3'h6):(1'h0)]))))
            begin
              reg67 <= {(reg52 << (~&((+wire57) - (reg42 != reg47))))};
            end
          else
            begin
              reg67 <= reg41[(2'h2):(2'h2)];
              reg68 <= ((reg43 && reg62) >= (^~($unsigned($signed(reg48)) << (+$unsigned(wire40)))));
              reg69 <= $signed((^reg53[(2'h2):(2'h2)]));
              reg70 <= (wire36[(1'h0):(1'h0)] ^ wire57);
            end
          reg71 <= ($unsigned(reg42[(3'h4):(3'h4)]) ?
              ((|$signed($signed(wire39))) | $signed(({(8'ha3)} < $signed(reg47)))) : $unsigned(((8'ha2) ?
                  reg66 : (!$signed(reg41)))));
        end
      else
        begin
          reg61 <= wire37[(4'h9):(1'h1)];
          reg62 <= (((reg55 == reg50[(2'h3):(2'h3)]) <<< ((7'h42) > {((7'h42) * reg49)})) ?
              ((~^($unsigned(reg71) ?
                  (|reg47) : reg62)) <= (^~(8'hba))) : ($signed($signed((reg48 ?
                  (8'hb9) : reg48))) + (wire37[(2'h2):(1'h1)] <= $unsigned($signed(reg60)))));
        end
    end
  module72 #() modinst113 (.wire76(reg48), .wire75(wire37), .y(wire112), .wire74(reg41), .wire73(reg58), .clk(clk));
  assign wire114 = reg58[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      if ((&(-$unsigned(((^reg41) ? $unsigned(reg63) : (reg45 && (8'hbd)))))))
        begin
          reg115 <= reg43[(2'h3):(2'h2)];
        end
      else
        begin
          if ((reg52 ?
              $signed(({(-(8'hb8)), ((8'ha7) >> wire40)} ?
                  $unsigned((~^reg51)) : ($unsigned(reg47) ^ (^reg61)))) : (+wire36[(3'h6):(3'h5)])))
            begin
              reg115 <= reg68[(1'h1):(1'h0)];
              reg116 <= reg41[(2'h3):(1'h0)];
              reg117 <= reg115;
              reg118 <= reg63[(3'h4):(2'h2)];
              reg119 <= wire114;
            end
          else
            begin
              reg115 <= (~|(reg45[(3'h6):(2'h3)] ?
                  $unsigned(reg65[(3'h6):(3'h4)]) : reg51[(3'h5):(2'h3)]));
              reg116 <= $signed((($unsigned({reg65}) >= $signed((wire112 ^~ reg47))) ?
                  (8'ha3) : (-$unsigned((reg51 ? reg54 : wire38)))));
            end
          if (($unsigned((!$unsigned((+(8'ha8))))) + (^$unsigned(({(8'hb7)} ?
              wire38 : (reg41 ? wire112 : reg48))))))
            begin
              reg120 <= $unsigned($unsigned(reg61));
              reg121 <= ($unsigned(($unsigned(reg66) ?
                  (^~reg118) : (&{reg65}))) ^~ reg60[(2'h2):(1'h1)]);
            end
          else
            begin
              reg120 <= reg70[(5'h13):(5'h11)];
              reg121 <= (^(wire37[(2'h3):(2'h3)] * $unsigned((+(reg54 ?
                  (8'hb3) : reg41)))));
              reg122 <= $signed(wire57);
            end
          if ($unsigned(reg71))
            begin
              reg123 <= $signed(((~&($signed(reg48) < wire114[(4'hc):(1'h1)])) ?
                  (-($unsigned(reg41) ?
                      wire114 : $unsigned(wire36))) : $unsigned(wire39[(3'h7):(3'h4)])));
              reg124 <= ((reg71 >> (~^$signed(reg53))) ^ reg55);
              reg125 <= ($unsigned((!$signed((reg68 ?
                  reg67 : reg47)))) <= $signed($unsigned(wire56)));
            end
          else
            begin
              reg123 <= $unsigned($unsigned((reg116 ?
                  (~$signed((8'hae))) : (~^(reg71 ? reg44 : reg60)))));
              reg124 <= {{(|(wire40 ~^ wire114[(4'hb):(4'hb)])),
                      (+$signed($unsigned(reg48)))}};
            end
        end
    end
  assign wire126 = reg62;
  assign wire127 = reg62;
  assign wire128 = ($unsigned(reg41) >> reg69);
  assign wire129 = $signed(reg123[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg130 <= $signed($unsigned(reg115));
    end
  assign wire131 = {reg117, {$unsigned(reg61[(1'h0):(1'h0)])}};
endmodule

module module9
#(parameter param29 = ((({((8'haa) ? (8'hbf) : (8'hb3))} <<< {(&(8'hb2))}) <= {(|{(8'hb7), (8'hb3)})}) - (((&((8'hbe) << (7'h43))) ? (+((8'hb4) << (8'ha5))) : ((~^(8'had)) ? (~^(8'had)) : (+(7'h44)))) + (&{((8'hb1) >> (8'hb0)), ((8'hac) ? (8'hb3) : (8'h9d))}))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire14;
  input wire [(2'h3):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  input wire [(2'h3):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire23;
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  assign y = {wire24,
                 wire23,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((8'hb9) ?
          $signed(wire13[(1'h1):(1'h1)]) : $signed($signed((wire14[(2'h3):(2'h3)] >> wire13)))))
        begin
          reg15 <= (-wire13);
          reg16 <= (wire13 != (wire14 >>> reg15));
          reg17 <= (reg15[(3'h4):(2'h2)] ?
              ($unsigned(wire14) ?
                  $signed(wire10[(3'h6):(1'h0)]) : ($signed((reg15 ?
                      (8'had) : wire10)) >> ((wire11 ? wire11 : reg16) ?
                      $signed((8'haa)) : (~|wire13)))) : (&wire14));
          reg18 <= wire12;
          reg19 <= ((($unsigned(wire14) ?
                  {reg18[(1'h0):(1'h0)],
                      wire10[(2'h3):(2'h3)]} : reg15[(4'h9):(4'h8)]) ?
              reg16[(1'h1):(1'h0)] : (~&{wire11[(2'h3):(2'h2)]})) >>> {(~wire10[(5'h14):(1'h1)]),
              (~&(^~$unsigned(reg15)))});
        end
      else
        begin
          reg15 <= (&reg17);
          reg16 <= $unsigned(($unsigned(((wire10 ? wire13 : wire11) ?
              {reg16, reg17} : (wire13 >> reg17))) || wire14));
          reg17 <= $signed((~(+wire12[(2'h3):(2'h3)])));
          reg18 <= $signed((~^{$unsigned($signed(reg15))}));
        end
      if ((reg16[(1'h1):(1'h0)] < (wire14 ? reg19[(2'h3):(1'h1)] : wire10)))
        begin
          reg20 <= ((&(wire14[(3'h5):(1'h0)] ?
                  (wire13 || reg17[(4'h9):(3'h6)]) : (-(~reg18)))) ?
              ($unsigned((+$unsigned(wire14))) ?
                  $signed(reg16[(2'h3):(1'h0)]) : {$unsigned({wire12, reg16}),
                      (reg19 == (!reg19))}) : (wire14 ?
                  wire12 : $unsigned(((reg19 ? wire11 : wire14) ?
                      wire11 : {(8'h9e), (8'hb0)}))));
          reg21 <= (({$unsigned(((8'hb7) ? wire10 : reg17)),
              $unsigned(reg17[(1'h1):(1'h1)])} <<< $signed((~&wire11[(2'h3):(1'h1)]))) ^ {(~{(^wire12)}),
              $unsigned(wire10[(4'hd):(4'h8)])});
        end
      else
        begin
          reg20 <= (wire12[(3'h4):(3'h4)] ? reg15 : $signed($signed(reg17)));
        end
      reg22 <= {$signed(wire14)};
    end
  assign wire23 = (!(~^reg22[(4'hb):(4'hb)]));
  assign wire24 = {reg17};
  always
    @(posedge clk) begin
      reg25 <= reg18;
      reg26 <= reg22[(4'h9):(3'h5)];
      reg27 <= $signed((wire14[(1'h0):(1'h0)] ?
          $unsigned($signed(reg26[(4'h9):(3'h5)])) : wire10));
      reg28 <= (wire23 >= ($unsigned((reg27 + (reg18 ? reg17 : reg22))) ?
          $signed(wire24[(3'h5):(3'h5)]) : $signed(reg19[(3'h4):(1'h1)])));
    end
endmodule

module module72
#(parameter param110 = (+{(|(^((8'hb7) << (8'hab))))}), 
parameter param111 = (({((^~param110) ? (-param110) : (^param110))} + {param110}) <= param110))
(y, clk, wire76, wire75, wire74, wire73);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire76;
  input wire [(5'h10):(1'h0)] wire75;
  input wire [(3'h4):(1'h0)] wire74;
  input wire [(5'h11):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  assign y = {wire109,
                 wire105,
                 wire104,
                 wire103,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire83,
                 wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 reg108,
                 reg107,
                 reg106,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg81,
                 (1'h0)};
  assign wire77 = $signed(wire75);
  assign wire78 = (wire77 >= $signed(((~|(wire74 ? wire74 : wire74)) ?
                      {{wire77, wire74}} : wire73)));
  assign wire79 = (7'h42);
  assign wire80 = {wire77[(2'h3):(1'h0)], wire76};
  always
    @(posedge clk) begin
      reg81 <= wire79;
    end
  assign wire82 = $signed(wire80[(4'h9):(1'h1)]);
  assign wire83 = (reg81[(2'h3):(2'h2)] + $signed($unsigned($signed((!wire77)))));
  always
    @(posedge clk) begin
      if ($signed($signed(((~^{wire79, wire78}) ?
          ((wire73 >= (8'h9f)) >> $unsigned((7'h42))) : ((wire78 ?
              wire74 : wire82) ~^ wire83[(4'h8):(4'h8)])))))
        begin
          reg84 <= (^wire79[(3'h4):(2'h3)]);
          reg85 <= (wire82[(4'ha):(4'ha)] ?
              (({{reg84}} >>> ($signed(wire73) < $unsigned(wire80))) ?
                  ((+(wire79 ? wire75 : (8'hbc))) ?
                      wire82 : wire76[(1'h1):(1'h0)]) : $unsigned({(wire82 | wire80),
                      $unsigned(wire74)})) : $unsigned(($signed($unsigned(wire79)) ?
                  ((^wire78) == (+wire80)) : (&{(8'ha0), (8'hae)}))));
          if ($signed((reg85 ^~ wire73)))
            begin
              reg86 <= wire75;
              reg87 <= $unsigned((-$unsigned((~|(reg85 <= wire78)))));
              reg88 <= wire76;
              reg89 <= reg84[(1'h0):(1'h0)];
            end
          else
            begin
              reg86 <= wire76[(1'h1):(1'h0)];
              reg87 <= $unsigned($unsigned($unsigned((~|wire76))));
              reg88 <= ((reg89 ?
                  (^~$signed($signed(reg87))) : $signed((~&wire77[(1'h0):(1'h0)]))) == $unsigned((^wire77)));
              reg89 <= $signed(reg88[(2'h2):(2'h2)]);
            end
          reg90 <= ((~^{({reg86} ? (wire79 ? (8'hbc) : reg81) : wire79),
              ((reg89 ?
                  (8'hb7) : reg88) ^~ wire78)}) > ($unsigned(($unsigned(wire79) > $unsigned(wire82))) + {wire76}));
        end
      else
        begin
          if ($unsigned($signed(({{wire75, (8'ha4)},
              reg88} ^ $unsigned(wire76)))))
            begin
              reg84 <= reg89;
              reg85 <= $unsigned((|$signed({$unsigned(wire75)})));
              reg86 <= wire74[(2'h2):(1'h0)];
              reg87 <= reg89[(3'h4):(2'h3)];
            end
          else
            begin
              reg84 <= (&$unsigned(reg86));
            end
          reg88 <= $signed($unsigned(reg84));
          reg89 <= $signed((reg88[(3'h7):(2'h2)] ?
              (~^$unsigned(reg89)) : (+(8'h9e))));
        end
      reg91 <= {(7'h43),
          (wire83[(3'h5):(3'h5)] ?
              $signed(($signed((8'ha9)) >> (wire77 ?
                  wire77 : (7'h40)))) : wire80[(4'hc):(1'h0)])};
      reg92 <= ($signed((~(wire77 << $signed((8'hb3))))) ?
          wire77 : reg90[(3'h4):(1'h0)]);
    end
  assign wire93 = $unsigned($signed(($signed((wire74 || wire80)) ?
                      ($signed((8'ha4)) ?
                          (wire74 >>> wire77) : reg90[(4'h8):(4'h8)]) : $signed(wire78[(4'hf):(4'h8)]))));
  assign wire94 = (8'h9d);
  assign wire95 = (~^(!wire76[(1'h0):(1'h0)]));
  assign wire96 = wire74;
  always
    @(posedge clk) begin
      if ((^~wire93[(4'hc):(4'h8)]))
        begin
          reg97 <= reg91[(5'h13):(2'h3)];
          reg98 <= wire80;
          if ({{$signed(reg90[(3'h4):(1'h0)]), wire94}})
            begin
              reg99 <= (-(8'ha4));
            end
          else
            begin
              reg99 <= wire83[(4'hb):(3'h4)];
              reg100 <= $unsigned(reg99);
              reg101 <= {(^~($unsigned($signed(reg85)) ?
                      (wire94 ? $signed(wire74) : {(8'hb5), wire93}) : {(reg87 ?
                              wire74 : (8'hb8))})),
                  wire80};
              reg102 <= reg101[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg97 <= (8'hb6);
          if ($signed(($signed({wire76,
              (wire76 * wire93)}) ^ ($signed((reg100 | (8'h9d))) ?
              wire93 : $unsigned((reg81 > reg99))))))
            begin
              reg98 <= wire82;
              reg99 <= $signed($signed(({((8'ha6) ?
                      reg99 : (8'hac))} >> {(|wire73)})));
              reg100 <= $unsigned(reg99);
            end
          else
            begin
              reg98 <= ((8'ha8) ^ $unsigned(($unsigned((reg101 ?
                      reg102 : reg99)) ?
                  $unsigned($unsigned((8'ha2))) : $unsigned(reg92[(1'h1):(1'h0)]))));
              reg99 <= (reg92 ?
                  reg88[(3'h6):(1'h0)] : (!{$unsigned(reg85),
                      {$unsigned(wire96)}}));
            end
        end
    end
  assign wire103 = (|reg99[(5'h11):(1'h1)]);
  assign wire104 = reg87[(1'h0):(1'h0)];
  assign wire105 = reg89[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if (($signed((($signed((8'haf)) ?
          (!reg100) : (reg100 ?
              (8'hb7) : wire104)) && reg98[(2'h2):(2'h2)])) << reg87))
        begin
          reg106 <= wire78[(3'h4):(3'h4)];
          reg107 <= {(~|reg101[(1'h0):(1'h0)])};
        end
      else
        begin
          reg106 <= $unsigned(({(reg84 ? wire74 : $signed(reg85)),
              $signed(reg98[(2'h2):(1'h1)])} - {($unsigned(wire74) ?
                  (8'ha0) : wire76)}));
        end
      reg108 <= {{((~(+wire79)) ~^ $unsigned(wire75)), (&(!reg97))},
          (!((8'ha1) <<< wire96))};
    end
  assign wire109 = {wire104[(2'h2):(1'h1)]};
endmodule
