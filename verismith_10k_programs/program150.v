module top
#(parameter param93 = ((~(8'hbc)) ? ((~^(&((7'h43) ? (7'h41) : (8'hbc)))) ? (^(~(7'h41))) : ((~(|(8'hb3))) ? (((8'ha6) ^~ (8'hac)) ? {(8'hbc), (8'hb5)} : (~&(8'hb5))) : ((!(8'ha4)) ? ((8'had) < (8'hb4)) : ((8'ha3) ? (8'ha5) : (8'ha5))))) : (((((8'h9f) ? (8'hb6) : (8'ha6)) ^ ((8'hba) <<< (8'hbf))) ? ({(8'hb0), (8'ha9)} ? ((8'hb5) ? (8'hbd) : (8'hae)) : ((8'h9c) <<< (8'hba))) : {{(8'hb1)}}) ^~ ((!((8'hb5) ? (7'h44) : (8'ha2))) ? (((8'hae) ? (8'hae) : (8'hb6)) != ((8'h9d) ? (8'hb4) : (8'ha8))) : {(7'h42), {(8'ha0)}}))), 
parameter param94 = (8'haa))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire86,
                 wire31,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire4 = $signed($unsigned(wire1[(4'hd):(4'ha)]));
  assign wire5 = $unsigned((-(~^{wire1})));
  assign wire6 = wire0;
  assign wire7 = wire2[(4'h9):(3'h6)];
  assign wire8 = wire2;
  assign wire9 = (8'ha8);
  assign wire10 = $unsigned((-wire3));
  assign wire11 = $unsigned(((wire8 ?
                          (wire5[(4'h8):(3'h5)] >= $signed(wire2)) : (|{wire9})) ?
                      (~^wire1[(3'h6):(3'h5)]) : (^((^~wire8) ~^ $signed(wire4)))));
  assign wire12 = $signed((wire9[(1'h0):(1'h0)] ?
                      ({wire3[(5'h10):(4'hf)], (wire8 >>> wire7)} ^ (~{wire3,
                          wire2})) : ({((8'hb5) == wire7), $unsigned(wire7)} ?
                          (~&wire2[(5'h10):(3'h6)]) : ((wire0 ?
                              wire8 : (8'haa)) != (&wire2)))));
  assign wire13 = ($signed({{$unsigned(wire11)}}) ^~ wire9[(1'h1):(1'h1)]);
  assign wire14 = ($signed((~&(~&wire10[(2'h3):(1'h0)]))) == (($unsigned($unsigned(wire13)) >> wire12[(1'h0):(1'h0)]) ?
                      $unsigned($signed($unsigned(wire1))) : wire12));
  assign wire15 = (^~(({$unsigned(wire13),
                          (|wire9)} | $signed($unsigned(wire8))) ?
                      ((wire2 ^ wire1[(4'h9):(2'h3)]) ?
                          ($signed(wire10) ?
                              $signed(wire2) : wire14[(3'h4):(3'h4)]) : ({wire8} ?
                              (^wire6) : wire11[(4'h9):(3'h4)])) : (8'ha1)));
  assign wire16 = wire4;
  assign wire17 = ({(((7'h41) ? (+wire4) : $signed((8'ha2))) ?
                              (|wire15[(4'hc):(1'h1)]) : $unsigned(wire11))} ?
                      $signed({wire0[(2'h2):(1'h1)]}) : (~&wire16[(4'h9):(2'h2)]));
  assign wire18 = wire17;
  assign wire19 = ({(~&(((8'hb0) || wire11) > (~|wire9)))} ?
                      wire10[(2'h2):(1'h0)] : wire6[(3'h6):(3'h4)]);
  module20 #() modinst32 (wire31, clk, wire19, wire2, wire17, wire14);
  module33 #() modinst87 (wire86, clk, wire6, wire7, wire13, wire11);
  always
    @(posedge clk) begin
      reg88 <= (!$signed({$signed((wire11 ? wire19 : wire7)),
          (|$unsigned(wire3))}));
      reg89 <= $signed(((wire86 ?
          {(wire19 ? wire11 : wire0)} : ({wire8,
              (8'ha6)} <<< $signed(wire11))) ^ wire19[(1'h1):(1'h0)]));
      reg90 <= ((wire5[(4'hb):(4'h9)] ?
          $unsigned(wire0) : $unsigned((8'hb5))) + {$signed($unsigned((-wire5)))});
    end
  assign wire91 = (wire14[(2'h2):(2'h2)] ?
                      (($unsigned(reg90[(4'ha):(4'h8)]) ?
                          ({wire86} || (+wire8)) : (8'hb2)) - (^{$signed((8'h9e)),
                          wire1})) : $unsigned($signed($unsigned({wire10}))));
  assign wire92 = $signed(wire16);
endmodule

module module33
#(parameter param85 = (~(!(~(~(~&(8'hb3)))))))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h179):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire [(5'h12):(1'h0)] wire35;
  input wire signed [(4'h9):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire75;
  wire [(4'ha):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire75,
                 wire73,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire40,
                 wire39,
                 wire38,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg54,
                 reg55,
                 (1'h0)};
  assign wire38 = ($signed({(^wire35)}) ?
                      wire36[(2'h2):(2'h2)] : ((wire34 ?
                          $unsigned({wire36}) : $unsigned(wire36)) >> (wire36 >= wire36[(1'h1):(1'h0)])));
  assign wire39 = (~&wire38);
  assign wire40 = ($unsigned(wire36) < $unsigned(wire35[(4'hb):(4'h9)]));
  always
    @(posedge clk) begin
      reg41 <= wire37;
      reg42 <= $signed($unsigned(wire35));
      reg43 <= (wire39 == $signed((((wire38 ?
              wire37 : reg41) <= $unsigned(wire36)) ?
          wire36[(4'h8):(3'h6)] : ((wire40 - wire40) ?
              (wire38 ? (8'ha0) : wire39) : reg41[(3'h7):(2'h2)]))));
      if (($signed(((^~wire39) ?
          (+{wire37}) : (^(&wire39)))) * $unsigned(($signed($signed(wire36)) ?
          ({wire37, wire35} ?
              (|wire39) : reg42[(4'he):(2'h3)]) : (wire34 >> wire38)))))
        begin
          if (reg42[(4'h8):(2'h2)])
            begin
              reg44 <= $unsigned($signed(($unsigned($unsigned(reg42)) != wire37)));
              reg45 <= (~|$unsigned(reg42));
              reg46 <= $signed($unsigned((($signed(wire36) >> (reg43 ^~ wire36)) ?
                  $signed($unsigned(wire35)) : $signed((|wire40)))));
              reg47 <= (wire40 ?
                  $unsigned((wire35[(1'h0):(1'h0)] || wire40)) : wire38[(2'h2):(2'h2)]);
            end
          else
            begin
              reg44 <= $unsigned((wire39[(2'h3):(1'h0)] & ((~^(8'hab)) & wire40[(4'h8):(4'h8)])));
              reg45 <= reg47;
              reg46 <= wire38[(3'h4):(2'h2)];
            end
        end
      else
        begin
          reg44 <= wire34[(3'h6):(2'h2)];
          reg45 <= ($signed(wire35) ?
              $unsigned(reg44[(3'h4):(1'h1)]) : (wire38 - ($signed({reg42,
                  reg42}) >= {$unsigned(reg42), (8'hb7)})));
          reg46 <= wire40[(3'h5):(1'h0)];
        end
      reg48 <= ((~&((reg44 ? (reg47 || reg44) : $unsigned(wire40)) ?
              ((!wire37) << ((8'hac) ? wire37 : wire38)) : wire40)) ?
          {((reg41 ^~ {wire38}) ? wire38 : wire40), (&wire34)} : wire39);
    end
  assign wire49 = wire39;
  assign wire50 = $signed(wire49);
  assign wire51 = $unsigned(reg45[(2'h2):(2'h2)]);
  assign wire52 = $signed(((-(8'hb6)) ?
                      {(wire51 << (wire35 > reg44))} : (+((wire37 ?
                              reg47 : reg44) ?
                          wire50[(1'h1):(1'h0)] : (wire51 ?
                              reg43 : (8'hbb))))));
  assign wire53 = $unsigned(($unsigned($signed((wire39 > reg46))) > (wire34[(3'h4):(3'h4)] ?
                      reg42 : $unsigned(reg46))));
  always
    @(posedge clk) begin
      if ($unsigned((-wire52[(4'h8):(3'h6)])))
        begin
          reg54 <= $signed(wire35);
          reg55 <= wire53[(4'hb):(1'h0)];
        end
      else
        begin
          reg54 <= (!{($signed((wire40 ?
                  reg45 : wire39)) * (~|$unsigned(reg44))),
              (wire34[(3'h6):(2'h2)] ?
                  ((wire50 - reg47) ?
                      reg55[(2'h2):(1'h1)] : {reg41}) : $signed(wire52[(2'h2):(1'h1)]))});
        end
    end
  module56 #() modinst74 (wire73, clk, reg46, reg55, reg43, wire40, wire51);
  assign wire75 = $signed((((8'hac) ?
                          (!wire34[(1'h1):(1'h0)]) : reg47[(1'h1):(1'h1)]) ?
                      $signed($unsigned($unsigned(wire36))) : reg42[(4'hb):(4'h9)]));
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed(((wire37 >> wire50) ^~ reg48)))))
        begin
          reg76 <= reg46[(1'h0):(1'h0)];
        end
      else
        begin
          if ((+(wire73 ?
              (($unsigned(reg48) ?
                  $signed(wire37) : (wire73 ?
                      wire39 : wire39)) ^ ($signed(wire73) ?
                  (wire35 ? wire75 : reg54) : ((8'ha0) ?
                      reg45 : wire53))) : (~reg42[(4'h8):(1'h1)]))))
            begin
              reg76 <= (($signed(wire40[(3'h7):(1'h0)]) >>> $unsigned((~^wire51))) ?
                  $signed(($unsigned((!reg43)) & (((8'ha2) | reg54) ?
                      (reg42 ?
                          wire51 : reg54) : ((8'hbe) == wire39)))) : $signed({(|(reg44 ?
                          reg45 : wire34)),
                      ((|reg45) + reg44)}));
              reg77 <= wire37;
              reg78 <= reg77[(4'he):(3'h5)];
              reg79 <= ($signed((~&(&wire53))) | reg76);
              reg80 <= wire52;
            end
          else
            begin
              reg76 <= ($unsigned((+wire50)) >>> wire37);
              reg77 <= ((reg78 >= ((!$unsigned((8'hb5))) ?
                  (((8'ha3) && reg47) ?
                      $unsigned(reg55) : ((8'ha4) << reg44)) : $unsigned($unsigned(wire53)))) << $unsigned($signed(reg80)));
            end
          reg81 <= $unsigned(wire52[(1'h1):(1'h1)]);
          reg82 <= $unsigned($signed($signed((~|$signed(wire36)))));
        end
    end
  assign wire83 = ($signed(wire40) ^~ {reg42});
  assign wire84 = wire83[(4'ha):(2'h3)];
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire24;
  input wire [(2'h2):(1'h0)] wire23;
  input wire signed [(3'h4):(1'h0)] wire22;
  input wire [(4'h9):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  assign y = {wire30, wire29, wire28, wire27, wire26, wire25, (1'h0)};
  assign wire25 = ($signed(wire24[(2'h2):(1'h1)]) ?
                      wire22[(1'h0):(1'h0)] : $signed(($signed({(8'hb0),
                              wire23}) ?
                          $unsigned((wire22 ? wire23 : wire22)) : wire23)));
  assign wire26 = $signed((~wire23[(1'h0):(1'h0)]));
  assign wire27 = wire23[(1'h1):(1'h0)];
  assign wire28 = ((~(wire22 >> (wire21[(1'h1):(1'h1)] ^ (wire27 != wire21)))) & $unsigned(((wire27 ~^ {wire27}) ?
                      $unsigned((wire25 << wire23)) : ((wire24 ?
                          wire25 : (8'ha4)) ~^ wire24[(3'h4):(2'h2)]))));
  assign wire29 = (!$signed({wire27, (~&(7'h44))}));
  assign wire30 = (((~^((wire26 - wire25) ?
                          wire27[(3'h5):(2'h3)] : $unsigned(wire22))) && ((+$unsigned(wire22)) - ({wire25} == (wire24 ?
                          (8'hb9) : wire22)))) ?
                      ((~^(^~wire29[(4'hf):(3'h7)])) ?
                          (~$unsigned((~&wire22))) : (~|(|(8'ha4)))) : wire24[(3'h6):(3'h6)]);
endmodule

module module56
#(parameter param71 = ((8'ha4) ? ({{(|(8'hab))}} > (((~&(8'ha1)) ? ((8'hb3) <<< (8'ha2)) : (8'hbe)) ~^ (~^(~&(8'hb8))))) : (7'h43)), 
parameter param72 = param71)
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire61;
  input wire [(5'h15):(1'h0)] wire60;
  input wire signed [(5'h12):(1'h0)] wire59;
  input wire signed [(5'h15):(1'h0)] wire58;
  input wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 (1'h0)};
  assign wire62 = {{(!$unsigned({wire57})),
                          $signed($unsigned((wire60 >>> wire57)))},
                      (~^wire60)};
  assign wire63 = $signed(wire57[(3'h4):(1'h1)]);
  assign wire64 = ((wire63[(3'h5):(3'h4)] && wire59[(3'h6):(3'h6)]) != wire62[(3'h4):(3'h4)]);
  assign wire65 = wire62;
  assign wire66 = wire65;
  assign wire67 = ($unsigned(wire59) ^ (&wire58[(5'h13):(3'h6)]));
  assign wire68 = {$unsigned($unsigned((8'haa)))};
  assign wire69 = (~(8'hb2));
  assign wire70 = wire62[(3'h5):(1'h0)];
endmodule
