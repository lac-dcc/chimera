module top
#(parameter param110 = {((((-(8'ha4)) ? ((8'hbe) <<< (8'h9c)) : (~^(8'hab))) != {((8'ha8) ? (8'h9e) : (7'h44)), (~(8'hb1))}) ? ((((8'hb5) ? (8'ha5) : (8'ha5)) >>> (!(8'hb7))) >> {((8'hae) == (8'hb4)), {(8'ha9), (8'hbf)}}) : (!(((8'h9e) ? (8'ha3) : (7'h43)) < (-(8'ha6)))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire20;
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire108, wire6, wire20, reg5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire2 ?
          (+{(wire3 ? (wire3 << wire1) : (wire2 <<< wire0)),
              $unsigned((^~wire1))}) : wire1[(4'h8):(2'h3)]);
      reg5 <= wire1;
    end
  assign wire6 = wire1[(3'h6):(1'h0)];
  module7 #() modinst21 (.wire9(wire0), .wire11(reg4), .wire8(wire2), .wire10(reg5), .y(wire20), .clk(clk), .wire12(wire1));
  module22 #() modinst109 (.wire23(wire6), .wire26(wire2), .y(wire108), .wire25(wire1), .wire24(wire20), .clk(clk));
endmodule

module module22
#(parameter param107 = {(((((8'hac) ? (8'hae) : (8'h9e)) ? (^(8'hbc)) : (8'hb4)) - (((8'hb9) < (8'hbf)) << ((8'hb3) * (8'hab)))) <<< (((|(8'hbe)) < ((7'h41) ? (8'hb5) : (8'hb7))) ? (((8'hb7) < (7'h42)) ? ((7'h43) ? (7'h41) : (8'hac)) : ((7'h44) ? (8'ha7) : (8'h9c))) : ((8'ha7) || ((8'hb0) * (8'ha4))))), ({{(^~(8'h9f))}, (8'hb8)} ? (((&(8'h9e)) ? (!(8'ha2)) : ((8'haa) == (8'hb2))) < (!{(7'h43)})) : ({((8'ha3) ^~ (8'hbd))} ? {(8'h9f)} : ((|(8'hbe)) ? (~(7'h41)) : (~|(8'had)))))})
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire26;
  input wire signed [(5'h12):(1'h0)] wire25;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire [(3'h5):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire102,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg104,
                 reg33,
                 reg34,
                 reg35,
                 reg40,
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
                 (1'h0)};
  assign wire27 = $signed((8'hb7));
  assign wire28 = wire24[(1'h1):(1'h1)];
  assign wire29 = (&$signed(wire28[(2'h3):(2'h2)]));
  assign wire30 = $signed((($unsigned($unsigned(wire28)) ?
                      ((&wire28) ?
                          (wire27 >> wire25) : $signed(wire27)) : (~|(wire23 && wire28))) ^~ wire23[(3'h5):(2'h3)]));
  assign wire31 = (!(|(($unsigned(wire30) <= (~&(8'h9e))) <= (wire26[(2'h2):(2'h2)] ?
                      ((8'ha7) <= (8'hbb)) : (wire28 ? wire30 : wire24)))));
  assign wire32 = {(((~^(wire29 < wire31)) ?
                          $signed($signed(wire23)) : $unsigned($unsigned(wire28))) << $signed((wire25[(5'h12):(5'h11)] - (|(8'ha2)))))};
  always
    @(posedge clk) begin
      reg33 <= wire26[(2'h3):(2'h3)];
      reg34 <= wire30;
      reg35 <= $unsigned({($unsigned($unsigned((8'h9f))) != (+(wire29 & wire23)))});
    end
  assign wire36 = (({wire26[(2'h3):(1'h1)]} ?
                          (8'hbb) : ($signed((&reg33)) ?
                              $signed(wire30[(3'h6):(2'h2)]) : (~wire26))) ?
                      ((((wire27 ? wire24 : wire30) ?
                              (reg35 >= wire27) : $signed(wire28)) ^~ (!((7'h41) != wire31))) ?
                          (8'hab) : $unsigned(((reg35 >>> wire31) ?
                              wire31[(2'h3):(1'h1)] : (8'h9c)))) : $unsigned((&$unsigned(((8'hbe) <<< reg35)))));
  assign wire37 = $unsigned($unsigned((wire25 ?
                      (^wire29[(1'h0):(1'h0)]) : (~^(wire24 ?
                          reg34 : wire30)))));
  assign wire38 = (((reg33 ? (8'ha6) : reg35[(3'h5):(3'h5)]) ?
                          ((-reg34[(2'h2):(1'h0)]) ?
                              $unsigned(wire36) : reg33) : (&$signed((&wire32)))) ?
                      (~wire27) : (~|(~|$unsigned((-reg34)))));
  assign wire39 = wire23;
  always
    @(posedge clk) begin
      if (wire32)
        begin
          reg40 <= $signed($unsigned((-wire32[(1'h1):(1'h1)])));
          reg41 <= wire26;
          reg42 <= ($unsigned($unsigned($unsigned((-reg41)))) == $signed(($signed($unsigned(wire26)) ?
              wire37[(2'h2):(1'h0)] : reg34)));
        end
      else
        begin
          reg40 <= ($signed({(reg40[(2'h2):(1'h0)] << $unsigned(wire36)),
              (8'ha0)}) ~^ (^~$signed($signed((8'haa)))));
          reg41 <= $signed($unsigned(($signed(wire38) ?
              reg33[(4'he):(4'h9)] : reg35)));
          reg42 <= $unsigned((wire29[(1'h1):(1'h0)] ^~ $unsigned($unsigned($unsigned(reg33)))));
          reg43 <= {$unsigned((((8'haf) ?
                  reg40[(2'h2):(1'h1)] : reg33[(1'h1):(1'h0)]) >>> (8'ha8)))};
        end
      reg44 <= wire31;
      reg45 <= (($unsigned((^{wire32, reg43})) ?
              wire28 : $unsigned((!(wire23 ? reg42 : reg44)))) ?
          $unsigned(($signed(wire25[(2'h2):(2'h2)]) || wire32)) : (wire39 ?
              $unsigned(($unsigned(reg44) ?
                  (reg42 ?
                      wire32 : wire27) : (wire31 > wire32))) : $signed((!(wire29 ?
                  reg33 : wire23)))));
      if ($unsigned(wire32[(1'h0):(1'h0)]))
        begin
          reg46 <= $unsigned({(reg43 ^ (|reg40))});
          if (wire29[(1'h0):(1'h0)])
            begin
              reg47 <= (wire31 ?
                  $unsigned({reg46[(2'h2):(2'h2)]}) : $unsigned((wire36 || $unsigned((reg44 ?
                      wire27 : wire26)))));
              reg48 <= (~{wire38[(1'h0):(1'h0)]});
              reg49 <= ((|(wire26[(3'h4):(1'h1)] + {(~^(8'ha0))})) ?
                  reg47[(3'h7):(3'h6)] : ((8'h9f) != $unsigned(reg34[(1'h0):(1'h0)])));
              reg50 <= ($unsigned((((wire39 ^~ reg41) ?
                          $signed(reg48) : $unsigned(reg41)) ?
                      ($unsigned(reg48) ~^ {wire36, wire31}) : ({reg34} ?
                          wire25[(5'h10):(4'he)] : $signed(wire37)))) ?
                  ((wire24 || (8'h9e)) ?
                      (8'h9c) : wire26) : ($unsigned(wire30[(3'h7):(2'h2)]) < (reg41 ?
                      ((reg44 ?
                          wire37 : wire30) >>> (+wire26)) : (~&wire26[(1'h1):(1'h1)]))));
              reg51 <= $signed(($signed(wire32) - ({wire25[(3'h5):(3'h4)],
                      (reg40 != wire26)} ?
                  (|(+wire24)) : reg33[(5'h12):(1'h1)])));
            end
          else
            begin
              reg47 <= reg48;
              reg48 <= reg35;
              reg49 <= $signed(wire24[(1'h1):(1'h0)]);
              reg50 <= reg51[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg46 <= $signed($unsigned({((wire39 < wire36) ?
                  $unsigned((8'haf)) : {reg35, wire30})}));
          reg47 <= {(!reg33[(4'h8):(1'h0)])};
        end
    end
  assign wire52 = (($signed({wire31, reg50}) | (|$unsigned((-reg50)))) ?
                      (wire27[(2'h2):(2'h2)] ?
                          $signed(((-reg34) ?
                              $signed(reg47) : (wire24 ?
                                  wire26 : (8'hbf)))) : $unsigned(($signed(wire38) ^ ((8'hae) == wire25)))) : reg46[(2'h2):(1'h0)]);
  assign wire53 = reg49;
  assign wire54 = $signed(((7'h42) ?
                      ($signed(wire39) ?
                          $unsigned((wire39 ?
                              reg44 : reg50)) : $unsigned((8'haf))) : wire28[(2'h3):(1'h0)]));
  assign wire55 = ((^~wire25) ^ $unsigned((&$signed($signed(wire39)))));
  assign wire56 = reg46[(1'h0):(1'h0)];
  assign wire57 = reg49;
  module58 #() modinst103 (.y(wire102), .clk(clk), .wire62(reg41), .wire60(wire29), .wire63(reg51), .wire59(reg50), .wire61(wire24));
  always
    @(posedge clk) begin
      reg104 <= ($signed(wire38) ^~ ((wire56[(3'h6):(3'h5)] + wire37[(3'h7):(3'h4)]) ?
          (reg50 ?
              ($unsigned((8'hae)) && (-wire52)) : (+(!reg42))) : $unsigned((!(reg47 <<< wire25)))));
    end
  assign wire105 = ($signed((({reg40, wire25} > {wire56}) ?
                       ($signed(reg46) ?
                           reg50 : {wire23, reg33}) : {(wire52 != wire30),
                           reg40})) ~^ (~|{$signed(reg43[(5'h11):(4'h8)])}));
  assign wire106 = reg50[(4'hb):(3'h6)];
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  assign y = {wire19, wire14, wire13, reg18, reg17, reg16, reg15, (1'h0)};
  assign wire13 = wire12[(4'h9):(3'h6)];
  assign wire14 = (((wire12[(2'h3):(2'h3)] ?
                      {(wire13 ?
                              wire11 : wire11)} : (~(8'h9d))) && (+wire13[(2'h2):(1'h0)])) & (~($unsigned((wire13 ?
                          wire10 : wire12)) ?
                      wire13[(3'h4):(3'h4)] : wire10)));
  always
    @(posedge clk) begin
      reg15 <= $unsigned(({$unsigned((^wire12))} << {$unsigned((wire12 ^~ (8'haa)))}));
      reg16 <= wire9;
      reg17 <= ($unsigned({wire8[(4'ha):(4'ha)], $signed($signed(wire13))}) ?
          (~&(8'hb8)) : (&(~wire10[(2'h3):(2'h2)])));
      reg18 <= (^~((&($signed(wire14) >> {(8'ha9),
          wire9})) << $unsigned((-(reg15 ? reg16 : wire9)))));
    end
  assign wire19 = ((wire8[(3'h5):(1'h1)] ?
                      wire11[(2'h2):(1'h1)] : wire12[(4'h8):(3'h7)]) <<< (8'hb4));
endmodule

module module58
#(parameter param101 = ((^~((((8'ha1) ? (8'hb6) : (8'hb2)) != ((8'hb4) ? (8'h9f) : (8'ha9))) <<< (^((8'hbc) & (7'h41))))) != (&{((!(8'ha4)) ? ((8'h9c) ^ (8'ha4)) : (+(8'hba))), (((8'hbd) <<< (7'h44)) ? (&(8'h9f)) : (!(8'haa)))})))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h1df):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire63;
  input wire signed [(3'h4):(1'h0)] wire62;
  input wire signed [(5'h15):(1'h0)] wire61;
  input wire signed [(3'h7):(1'h0)] wire60;
  input wire [(2'h3):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire88;
  wire signed [(4'he):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire64 = $signed(((~&(((8'hb5) ? wire59 : wire62) ?
                      wire61[(4'hf):(3'h4)] : wire63)) + $unsigned($signed(wire61[(4'hf):(3'h5)]))));
  assign wire65 = $signed((^~(($unsigned(wire61) ?
                          wire64 : wire63[(4'hc):(3'h4)]) ?
                      $unsigned((wire64 >= wire63)) : wire63[(3'h7):(2'h2)])));
  assign wire66 = ($signed($unsigned((^(^wire60)))) ~^ ((~|wire60[(2'h3):(1'h0)]) ?
                      ($unsigned((8'hb1)) ?
                          $unsigned($unsigned(wire64)) : {$unsigned(wire62),
                              $signed(wire59)}) : wire61));
  assign wire67 = wire66;
  assign wire68 = wire65;
  assign wire69 = wire65[(2'h2):(1'h1)];
  assign wire70 = $signed(wire62[(1'h0):(1'h0)]);
  assign wire71 = ((~^($unsigned(wire62[(1'h1):(1'h0)]) >= wire65[(4'hf):(1'h1)])) * wire62);
  assign wire72 = $unsigned($signed((|($unsigned(wire65) ?
                      wire70[(4'h9):(3'h4)] : $signed(wire68)))));
  assign wire73 = (&$unsigned((($unsigned(wire67) || wire59[(1'h1):(1'h1)]) != {wire65})));
  assign wire74 = wire64[(1'h0):(1'h0)];
  assign wire75 = wire72[(1'h0):(1'h0)];
  assign wire76 = ((7'h43) ~^ wire72[(3'h5):(2'h2)]);
  assign wire77 = wire68[(3'h5):(1'h1)];
  assign wire78 = ((wire73 ^~ wire67) >= ((8'ha2) <= wire61));
  always
    @(posedge clk) begin
      reg79 <= ((-wire66) ?
          (+wire68) : ($unsigned($signed($unsigned(wire70))) ~^ ((wire69[(2'h2):(1'h1)] ?
              $unsigned((8'h9e)) : {wire70}) ^ $unsigned(wire68))));
      if ((~^wire71))
        begin
          reg80 <= ($signed($signed(((^(8'hb7)) - $unsigned(wire73)))) ?
              wire68[(3'h7):(1'h0)] : (~&wire68[(4'h9):(3'h5)]));
          reg81 <= wire62[(3'h4):(1'h1)];
          reg82 <= wire74;
          reg83 <= wire68[(4'h8):(1'h0)];
          reg84 <= ($signed(($unsigned((wire59 ?
              (8'hbc) : wire65)) | $signed(wire68[(4'h9):(4'h8)]))) < (^~(($unsigned(reg80) > (reg81 + reg80)) ?
              $signed({(8'hb0)}) : wire74[(3'h4):(1'h1)])));
        end
      else
        begin
          reg80 <= (|(wire74[(4'hf):(4'hf)] ?
              {$signed((wire65 ~^ wire78))} : wire60[(2'h2):(2'h2)]));
        end
      reg85 <= {wire67};
      reg86 <= ($signed({wire67}) >= $unsigned({$signed((^wire75)),
          $signed((wire60 ^ wire61))}));
    end
  assign wire87 = (wire72[(3'h4):(1'h0)] ^~ (^~$unsigned($unsigned($unsigned((8'hbc))))));
  assign wire88 = {(-$signed($signed((wire65 - wire75)))),
                      reg84[(4'he):(4'hb)]};
  assign wire89 = (reg83[(3'h5):(2'h2)] ?
                      wire70[(4'ha):(3'h5)] : ($unsigned(((^~(8'hb0)) ^~ ((8'ha6) > reg84))) - $unsigned(reg82[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg90 <= (^$unsigned((wire73[(2'h2):(2'h2)] << ($unsigned(wire66) ?
          reg84 : $unsigned(wire75)))));
      reg91 <= $unsigned($signed(wire68));
      reg92 <= wire75;
      if ((reg90 ?
          $signed(wire89[(4'he):(3'h7)]) : ((8'hb5) ?
              {(wire60[(1'h1):(1'h0)] ^~ (reg84 ?
                      reg92 : reg86))} : wire59[(1'h0):(1'h0)])))
        begin
          reg93 <= reg82[(3'h5):(1'h0)];
          reg94 <= wire69;
          reg95 <= $signed(wire88[(2'h2):(1'h1)]);
          if ((-({(wire65 ? (^~(8'hb3)) : (reg81 == wire60))} ?
              reg95 : $signed(wire66))))
            begin
              reg96 <= reg93;
              reg97 <= reg94;
              reg98 <= reg85;
            end
          else
            begin
              reg96 <= wire69;
              reg97 <= {(wire62 > $signed(((wire87 - reg97) ?
                      $unsigned(wire72) : $unsigned(reg93)))),
                  $unsigned(wire66[(4'h8):(4'h8)])};
              reg98 <= (!{$signed(reg93[(4'he):(3'h7)]),
                  (^($unsigned(wire69) & (wire64 < reg96)))});
              reg99 <= wire66[(3'h4):(1'h1)];
            end
        end
      else
        begin
          reg93 <= wire68[(4'h9):(3'h7)];
          reg94 <= reg92;
        end
      reg100 <= ((wire88[(1'h1):(1'h1)] ? reg95 : (-{$signed(wire89)})) ?
          (($signed((+reg90)) ^~ ($signed(wire59) <<< (reg91 ?
              wire66 : reg85))) & ($signed((^wire71)) << (reg92[(3'h6):(2'h3)] > $signed(reg85)))) : $unsigned(wire62[(2'h3):(2'h3)]));
    end
endmodule
