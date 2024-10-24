module top
#(parameter param112 = ((~|(|(((8'ha9) == (7'h42)) ? ((8'hbd) < (8'h9f)) : ((7'h42) + (8'h9c))))) ? (((((8'hae) && (7'h42)) ? ((8'hbe) ? (8'h9f) : (7'h42)) : {(8'hb0), (8'ha5)}) ^~ ((~(8'hb1)) != {(8'hb5), (8'h9f)})) ? (|((-(8'hbe)) ? (^~(8'h9e)) : {(7'h42)})) : ({((8'hb2) >= (8'ha7))} - {((8'ha4) ? (8'ha1) : (8'hb5)), ((8'h9e) ? (8'ha4) : (8'ha0))})) : (((((7'h42) ? (8'h9c) : (8'ha5)) && ((8'ha0) || (8'hb2))) && ({(8'hac)} > ((7'h43) ? (8'h9e) : (8'hbc)))) ? (8'hbc) : (8'hba))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire109;
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  assign y = {wire111,
                 wire5,
                 wire33,
                 wire35,
                 wire36,
                 wire52,
                 wire53,
                 wire109,
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
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire5 = wire0[(3'h4):(3'h4)];
  module6 #() modinst34 (.wire8(wire4), .wire10(wire1), .clk(clk), .y(wire33), .wire9(wire2), .wire7(wire5));
  assign wire35 = ($unsigned(((~&$unsigned(wire0)) << wire1[(1'h0):(1'h0)])) >= {$signed(wire4)});
  assign wire36 = ({$signed((-$unsigned(wire3))),
                          (((^(7'h43)) ?
                              (wire4 ?
                                  wire1 : wire1) : {wire4}) ~^ $unsigned((wire5 ?
                              wire3 : wire4)))} ?
                      wire33[(2'h2):(2'h2)] : ((((!wire4) || wire0[(3'h4):(1'h1)]) ?
                              (8'hae) : (wire2[(1'h1):(1'h1)] ?
                                  $signed(wire4) : ((8'hb0) | wire2))) ?
                          $unsigned($signed($unsigned(wire1))) : $unsigned((^~wire1[(4'h9):(2'h2)]))));
  always
    @(posedge clk) begin
      reg37 <= $signed(wire4);
      reg38 <= $unsigned(wire33);
      reg39 <= $signed((~|$signed((8'ha2))));
      if ((-(wire3 ? wire35 : $signed(wire36[(4'ha):(3'h4)]))))
        begin
          reg40 <= $unsigned((wire0 && (+(~^{wire33}))));
          if ((^((8'hae) ?
              $signed($unsigned((~|(8'hac)))) : $signed((!reg38[(2'h3):(1'h1)])))))
            begin
              reg41 <= $signed((wire2[(1'h1):(1'h0)] ?
                  ({$unsigned((8'ha7))} ?
                      (^~(wire3 ?
                          wire5 : (7'h40))) : $signed({(8'hb7)})) : wire0));
              reg42 <= reg39[(3'h6):(1'h0)];
            end
          else
            begin
              reg41 <= (~^(^~(&$signed(wire35[(2'h3):(2'h2)]))));
              reg42 <= (({wire35[(2'h3):(1'h1)], reg38[(4'h9):(1'h1)]} ?
                      reg41[(3'h6):(2'h3)] : $unsigned({(8'hb4)})) ?
                  (wire33 > reg37) : ($signed(((8'ha9) << wire33[(3'h5):(1'h0)])) != (~(^~wire33[(2'h3):(1'h0)]))));
              reg43 <= (8'haa);
              reg44 <= $signed((8'h9e));
              reg45 <= reg41[(1'h0):(1'h0)];
            end
          reg46 <= (wire33[(3'h6):(1'h1)] ?
              (~&(reg38 ^ (^reg44))) : {reg42, ($unsigned(reg43) * (~&reg37))});
          reg47 <= $unsigned(($signed(reg42) ?
              {reg44[(3'h4):(3'h4)],
                  $unsigned(((8'haa) ? reg45 : wire4))} : (|({reg45, wire33} ?
                  (&reg37) : (+(8'haa))))));
          if ({$unsigned($signed({(wire36 >> reg39), {wire35, wire33}})),
              reg42})
            begin
              reg48 <= (!(($signed((8'hbf)) < reg47) ?
                  (((8'hb7) ? $unsigned((8'had)) : {reg46, reg41}) ?
                      (~&(~&wire5)) : (wire5 - (reg43 ?
                          wire1 : reg43))) : ($unsigned((^~wire33)) | reg46)));
            end
          else
            begin
              reg48 <= (|((wire33 ?
                  wire35 : wire2[(3'h4):(3'h4)]) == (reg45[(2'h3):(1'h1)] >= reg47)));
              reg49 <= (wire3[(3'h6):(1'h1)] << {wire2[(2'h3):(2'h3)],
                  ($unsigned($signed(wire0)) ?
                      ($unsigned(reg38) ?
                          wire35[(1'h1):(1'h0)] : {(8'hbf),
                              wire3}) : (+$signed(reg48)))});
              reg50 <= (8'ha1);
              reg51 <= $signed(reg44[(4'h9):(2'h3)]);
            end
        end
      else
        begin
          reg40 <= ({(($unsigned(wire1) ?
                  {reg43} : wire0) + reg44[(3'h7):(2'h3)]),
              (^$unsigned((-wire5)))} == $unsigned(reg39[(1'h1):(1'h1)]));
          if ({($signed({((8'hb2) ? reg51 : reg48)}) != $unsigned(wire0))})
            begin
              reg41 <= (($signed(wire1) >> wire3[(3'h5):(1'h0)]) >= (-($unsigned((~(8'hb6))) ?
                  ($unsigned(wire1) ?
                      (^wire1) : wire35) : ((^wire5) == (~&reg38)))));
              reg42 <= $unsigned(reg41[(4'h8):(2'h3)]);
              reg43 <= wire35;
              reg44 <= (({$signed($signed(wire33)),
                      (-$signed(wire33))} & reg47[(5'h10):(3'h7)]) ?
                  $unsigned($signed(wire1)) : wire33[(2'h2):(1'h0)]);
            end
          else
            begin
              reg41 <= $signed($unsigned(reg37));
              reg42 <= reg51[(3'h7):(3'h5)];
              reg43 <= $unsigned($unsigned($signed(((&reg38) ?
                  $signed(reg41) : (reg41 <<< reg42)))));
            end
          if ((reg51[(1'h0):(1'h0)] && $signed($signed(reg39[(3'h6):(2'h3)]))))
            begin
              reg45 <= {reg49, $signed($signed(reg41))};
              reg46 <= reg47;
              reg47 <= $signed($signed($unsigned((~reg37))));
            end
          else
            begin
              reg45 <= wire3;
            end
          reg48 <= {wire35};
          reg49 <= {reg46[(3'h6):(1'h0)],
              (reg41 + ($unsigned(reg47) <<< (((8'h9c) <<< reg39) ?
                  (wire33 ? wire1 : reg42) : (reg47 != (8'hab)))))};
        end
    end
  assign wire52 = (-(8'hbf));
  assign wire53 = (reg39[(2'h3):(1'h1)] >>> reg48[(3'h7):(3'h5)]);
  module54 #() modinst110 (.wire55(wire4), .y(wire109), .wire59(reg38), .wire57(reg51), .clk(clk), .wire58(reg42), .wire56(reg47));
  assign wire111 = reg45;
endmodule

module module54
#(parameter param107 = (-{((((8'haa) ? (8'hb0) : (8'ha4)) ? ((8'h9d) ? (8'had) : (8'ha6)) : (+(8'h9e))) & (~&{(7'h44)})), (8'ha5)}), 
parameter param108 = ({(((~|(8'hb6)) ? (param107 & param107) : param107) ? ((param107 != param107) ? {param107} : (param107 ? param107 : param107)) : param107)} ? (param107 ? (param107 ? (~|(&param107)) : ((param107 || param107) ^~ (param107 ? param107 : (8'haf)))) : {{(^~(8'hab)), (!(8'hbc))}}) : param107))
(y, clk, wire55, wire56, wire57, wire58, wire59);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire55;
  input wire signed [(4'h8):(1'h0)] wire56;
  input wire signed [(4'hd):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire58;
  input wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire103;
  wire signed [(4'hb):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(3'h6):(1'h0)] wire100;
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire83,
                 wire85,
                 wire86,
                 wire87,
                 wire100,
                 reg84,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg60 <= wire59;
      if ($unsigned($unsigned((^$unsigned($signed(wire55))))))
        begin
          reg61 <= wire59;
        end
      else
        begin
          reg61 <= $signed(wire56[(3'h7):(3'h5)]);
          reg62 <= wire55[(2'h3):(2'h2)];
          reg63 <= {$signed({(8'hab)})};
          if (({((8'hb6) ?
                  wire55[(1'h0):(1'h0)] : $signed((wire56 ?
                      reg60 : wire59)))} && (reg62[(4'hc):(3'h7)] * wire58)))
            begin
              reg64 <= reg62[(4'h8):(1'h0)];
              reg65 <= (reg60[(4'h9):(2'h2)] ?
                  reg63 : ($unsigned((reg63[(3'h6):(1'h1)] ?
                      (reg63 < wire55) : $signed(wire55))) & $unsigned((reg62 ^ (~&reg64)))));
              reg66 <= (8'hb3);
            end
          else
            begin
              reg64 <= reg60[(4'h8):(3'h6)];
              reg65 <= reg63;
            end
          if ((8'h9f))
            begin
              reg67 <= reg62;
              reg68 <= (wire58 < $unsigned(wire55[(1'h0):(1'h0)]));
              reg69 <= (($unsigned($signed(reg60[(4'hf):(4'he)])) ?
                      (wire59 ?
                          reg64 : $unsigned((reg66 << reg60))) : $unsigned($unsigned({reg68,
                          reg63}))) ?
                  $unsigned($unsigned(wire55[(3'h7):(3'h5)])) : ((wire55[(3'h7):(2'h2)] ?
                          $signed((wire56 ?
                              reg62 : (8'hae))) : $unsigned((wire58 ?
                              reg64 : reg62))) ?
                      wire57 : $signed(($unsigned(reg63) ?
                          $signed(reg60) : (+wire56)))));
              reg70 <= wire56[(4'h8):(1'h0)];
            end
          else
            begin
              reg67 <= (wire56 ^~ $signed((|$signed(reg69))));
              reg68 <= $signed(($signed($unsigned($unsigned(reg64))) ?
                  reg68[(2'h2):(1'h1)] : (~|((wire56 + reg67) | $signed((7'h44))))));
              reg69 <= $unsigned(wire57);
              reg70 <= reg61[(1'h1):(1'h0)];
            end
        end
      reg71 <= {(8'hb6)};
      reg72 <= {({$unsigned($unsigned(reg67))} - {((reg60 <= wire56) ?
                  $signed((8'hb8)) : (&reg63))})};
    end
  assign wire73 = reg60;
  assign wire74 = (~^(~^wire73));
  assign wire75 = $signed(((!{(^~reg66), (&reg71)}) >= reg72[(3'h5):(1'h0)]));
  assign wire76 = $unsigned(($signed($unsigned((reg70 ? reg67 : wire74))) ?
                      {reg60,
                          $unsigned(((8'hbc) ? wire59 : reg66))} : {(&reg71),
                          $signed($unsigned(reg67))}));
  assign wire77 = wire58[(4'h9):(1'h1)];
  assign wire78 = (~^(^~wire76));
  always
    @(posedge clk) begin
      reg79 <= wire59[(1'h0):(1'h0)];
      reg80 <= reg71[(1'h0):(1'h0)];
      reg81 <= (((!$unsigned((reg67 ^~ reg69))) ?
          $unsigned((^~(^~reg66))) : {$unsigned((wire78 ? wire56 : wire59)),
              reg60}) > (^~$unsigned((~&$unsigned((8'ha7))))));
      reg82 <= (wire58[(4'he):(4'hb)] ?
          $unsigned(((wire57 ~^ $unsigned((8'h9e))) | (&(wire76 ?
              reg72 : reg81)))) : $unsigned($unsigned((&$unsigned((8'hab))))));
    end
  assign wire83 = ($signed((reg69 & ((reg72 > (8'hbf)) + (reg60 ~^ wire56)))) ?
                      $unsigned((~&(~((8'hb6) ?
                          reg62 : reg69)))) : wire77[(4'ha):(4'h8)]);
  always
    @(posedge clk) begin
      reg84 <= (wire58[(5'h12):(5'h11)] ?
          (^~reg81) : $signed($signed(((~^wire55) ^~ reg67[(2'h2):(2'h2)]))));
    end
  assign wire85 = (reg80 >> {(|($unsigned(reg65) << ((8'haa) || reg71)))});
  assign wire86 = wire78[(3'h4):(3'h4)];
  assign wire87 = {wire59[(1'h1):(1'h0)], (+wire56)};
  module88 #() modinst101 (wire100, clk, wire58, reg60, wire57, wire78, reg72);
  assign wire102 = (&((^(|(wire56 && wire83))) * ($signed((wire75 == wire57)) | reg62[(4'hf):(3'h6)])));
  assign wire103 = reg68;
  assign wire104 = ((8'hb2) ?
                       $signed((wire85 ?
                           reg82 : $signed((~wire58)))) : (&wire56[(4'h8):(3'h5)]));
  assign wire105 = $signed(($unsigned(reg63[(5'h12):(2'h3)]) * (+reg69)));
  assign wire106 = wire73;
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire26;
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  assign y = {wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire11,
                 wire12,
                 wire13,
                 wire26,
                 reg31,
                 (1'h0)};
  assign wire11 = wire10[(4'hf):(4'hc)];
  assign wire12 = $unsigned($signed(((^~(wire7 ?
                      wire11 : wire9)) && {(|wire11)})));
  assign wire13 = {$signed((wire12 > ((wire7 ? wire11 : wire7) && (^~wire9)))),
                      ($unsigned((&wire12[(4'h8):(3'h6)])) ?
                          $unsigned($signed((~&wire11))) : (^$signed({wire8,
                              (8'hb2)})))};
  module14 #() modinst27 (.wire17(wire12), .wire15(wire8), .wire19(wire7), .wire18(wire13), .wire16(wire10), .clk(clk), .y(wire26));
  assign wire28 = (+(($unsigned($unsigned((7'h41))) | ((!wire7) * wire9[(2'h3):(1'h1)])) ?
                      ($unsigned($signed(wire13)) >= {(!wire26),
                          {wire8}}) : {((~&wire10) ?
                              (wire7 || wire7) : wire12[(4'h9):(4'h9)])}));
  assign wire29 = ((^~$unsigned(wire13[(1'h1):(1'h0)])) ?
                      $unsigned(wire7[(1'h1):(1'h0)]) : {wire13[(4'hf):(2'h2)]});
  assign wire30 = $signed($signed(wire12[(4'hc):(1'h1)]));
  always
    @(posedge clk) begin
      reg31 <= $signed($unsigned($signed($signed(wire28[(3'h7):(1'h0)]))));
    end
  assign wire32 = $signed({wire8[(3'h4):(2'h3)]});
endmodule

module module14
#(parameter param25 = ({{(8'ha2)}, (((8'ha3) ? ((8'ha4) >> (7'h43)) : (!(8'ha2))) ~^ (((8'hb8) ? (7'h40) : (8'hbc)) ? (8'hb4) : {(8'hb6), (8'ha3)}))} ? ((^{(8'h9c)}) ? (~&(!(^~(8'hbf)))) : (~|(!((8'hab) <<< (8'h9f))))) : ({(8'hb6)} >= (((|(8'h9d)) << (-(8'hb2))) >= ({(8'ha1), (8'hba)} ? {(8'ha4), (8'hac)} : ((8'hb0) ? (8'had) : (8'ha8)))))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  assign y = {wire24, wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = wire15;
  assign wire21 = (({$signed($unsigned(wire17))} ~^ $unsigned((|$signed(wire17)))) ?
                      {wire19} : ((wire16[(2'h3):(2'h2)] ^~ (8'hb4)) == (wire16 - (^~(wire17 ?
                          wire16 : wire15)))));
  assign wire22 = $unsigned((+{$signed($unsigned(wire15)),
                      ($unsigned(wire21) != (wire15 + wire16))}));
  assign wire23 = $signed($signed($unsigned((8'hb3))));
  assign wire24 = $signed(wire17[(1'h0):(1'h0)]);
endmodule

module module88
#(parameter param98 = (|((~^(((8'hb3) < (8'hab)) == (^(8'haa)))) & (({(8'ha6), (8'hb9)} == ((8'hbb) ? (8'hbc) : (8'hb1))) ^ {(8'ha6), ((8'hb1) ? (7'h44) : (8'hb2))}))), 
parameter param99 = ((^(((param98 ? param98 : param98) || ((8'hbf) > param98)) ? {(param98 <<< param98)} : (^(param98 ? param98 : param98)))) + (({(~(7'h42))} ? param98 : (param98 - (param98 * (8'hac)))) ? (({param98} ? {param98} : (param98 ^~ (8'ha0))) ? ((param98 ? param98 : param98) + {param98}) : param98) : ({(!param98)} ? {param98} : (param98 <= param98)))))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire93;
  input wire signed [(3'h6):(1'h0)] wire92;
  input wire [(4'hd):(1'h0)] wire91;
  input wire [(5'h10):(1'h0)] wire90;
  input wire signed [(5'h12):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  assign y = {wire97, wire96, wire95, wire94, (1'h0)};
  assign wire94 = $unsigned(($unsigned((((8'hbb) ?
                          wire92 : (8'hbe)) == $signed(wire89))) ?
                      (8'ha3) : $unsigned(wire92[(3'h6):(2'h2)])));
  assign wire95 = $unsigned(wire94[(2'h3):(1'h0)]);
  assign wire96 = wire93[(1'h1):(1'h0)];
  assign wire97 = (wire91 ? wire93 : wire90[(4'hd):(2'h3)]);
endmodule
