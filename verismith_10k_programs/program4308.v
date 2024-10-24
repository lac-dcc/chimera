module top
#(parameter param138 = (({(((8'ha2) ? (7'h41) : (8'ha0)) * {(8'h9f), (8'h9f)})} < (&((~&(8'hb1)) ? (+(8'hb3)) : (8'ha6)))) == (8'hba)), 
parameter param139 = param138)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire137;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire135;
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  assign y = {wire137,
                 wire47,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire26,
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
                 wire135,
                 reg30,
                 reg31,
                 (1'h0)};
  assign wire5 = ($unsigned((^~$signed((~^wire2)))) ?
                     {{{((8'hae) < wire1)}}} : ($signed({(8'ha3), wire2}) ?
                         (~^$signed(wire3)) : (!$unsigned((wire3 >>> wire4)))));
  assign wire6 = wire3;
  assign wire7 = $unsigned(((8'hba) * (~|$signed(wire2[(1'h0):(1'h0)]))));
  assign wire8 = (~|(&wire6[(3'h7):(3'h4)]));
  assign wire9 = (({((!(8'hb4)) & (|wire5))} ?
                         (((~^wire5) ? $signed(wire0) : wire2[(1'h0):(1'h0)]) ?
                             wire3[(3'h5):(2'h2)] : (!$unsigned(wire1))) : wire8) ?
                     $unsigned((wire4[(1'h0):(1'h0)] + wire6)) : ((!(wire1 ?
                         (^wire7) : $signed((8'h9e)))) & $unsigned(($signed(wire6) ?
                         wire2[(2'h2):(1'h0)] : $signed(wire5)))));
  assign wire10 = (~$signed((~&wire1[(2'h2):(2'h2)])));
  assign wire11 = ($unsigned($signed(((~&wire5) ^~ ((8'hb9) << wire1)))) <= wire2[(1'h0):(1'h0)]);
  assign wire12 = (((wire1[(1'h0):(1'h0)] ?
                              {$signed(wire3),
                                  (&wire4)} : $signed($unsigned(wire6))) ?
                          $unsigned((wire3 ?
                              (~&wire4) : (wire3 ?
                                  wire1 : (8'hae)))) : wire7[(2'h3):(1'h1)]) ?
                      wire2 : $unsigned(((8'h9c) ?
                          $signed(((8'hb5) * wire11)) : (8'ha8))));
  assign wire13 = wire1[(3'h4):(2'h2)];
  assign wire14 = wire2;
  module15 #() modinst27 (wire26, clk, wire12, wire0, wire9, wire14);
  assign wire28 = wire5[(1'h1):(1'h0)];
  assign wire29 = {wire28};
  always
    @(posedge clk) begin
      reg30 <= $unsigned(wire7);
      reg31 <= wire26;
    end
  assign wire32 = ($unsigned(($unsigned($signed(wire3)) <= $unsigned((wire0 | wire29)))) ?
                      {(~^wire0)} : $unsigned(((reg31[(4'h9):(4'h8)] <<< (wire4 | (8'hb2))) | {wire12[(2'h2):(2'h2)],
                          {wire9, (8'ha6)}})));
  assign wire33 = ((wire32 <<< $signed(($signed(wire7) ?
                      (~|wire10) : $signed(wire4)))) & wire7[(2'h2):(1'h1)]);
  assign wire34 = wire26[(1'h0):(1'h0)];
  module35 #() modinst48 (wire47, clk, wire8, wire34, wire32, wire14, wire7);
  module49 #() modinst136 (wire135, clk, wire26, wire7, wire2, reg30);
  assign wire137 = $signed((reg30 ?
                       $unsigned((wire3 ?
                           $signed(wire13) : wire26)) : $signed(($signed(wire34) < (&wire135)))));
endmodule

module module49  (y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h1d9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire53;
  input wire signed [(2'h2):(1'h0)] wire52;
  input wire signed [(5'h10):(1'h0)] wire51;
  input wire [(2'h3):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire134;
  wire signed [(4'hd):(1'h0)] wire133;
  wire [(3'h4):(1'h0)] wire132;
  wire [(2'h2):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire54;
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire54,
                 reg55,
                 reg56,
                 reg57,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 (1'h0)};
  assign wire54 = wire51[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg55 <= wire51[(3'h6):(2'h2)];
      reg56 <= ((~&$unsigned($signed($signed(reg55)))) ?
          $signed(({{reg55, wire52}, (~&wire52)} ?
              ((wire54 ?
                  wire52 : wire51) ~^ wire50[(2'h2):(2'h2)]) : (!(wire53 ^ wire51)))) : wire53);
      reg57 <= wire52;
    end
  assign wire58 = reg55;
  assign wire59 = (reg55[(3'h7):(2'h2)] <<< wire51);
  assign wire60 = wire54;
  assign wire61 = $unsigned(((wire58 ~^ $signed(wire58[(2'h2):(2'h2)])) && $unsigned($unsigned((wire58 ?
                      wire51 : wire51)))));
  assign wire62 = ($unsigned(reg55) && ({($unsigned(wire50) ?
                              ((8'haa) ? wire50 : wire51) : wire51)} ?
                      reg56 : ((wire58[(1'h0):(1'h0)] & reg55) == ($unsigned((8'haf)) | wire52[(1'h0):(1'h0)]))));
  assign wire63 = ((-(^~wire62[(3'h4):(1'h1)])) | $unsigned((wire58 << wire50[(2'h3):(1'h0)])));
  assign wire64 = $unsigned(wire51);
  assign wire65 = (($signed((!(wire58 ?
                          (8'hb0) : wire60))) + (wire60[(3'h4):(2'h3)] == {wire59[(2'h2):(1'h1)]})) ?
                      $signed($signed($unsigned($signed(wire61)))) : (wire51 << {(reg55 >= wire64[(2'h3):(2'h2)]),
                          ($unsigned((8'hbf)) <= wire53)}));
  assign wire66 = (^~{(|wire54[(3'h5):(1'h1)])});
  always
    @(posedge clk) begin
      reg67 <= (($signed((~$unsigned(wire60))) || $signed({(-wire51)})) ^ $signed($signed(($unsigned(wire53) | (!(7'h43))))));
      reg68 <= ({$unsigned(wire63[(3'h4):(3'h4)]),
          (|{$signed(wire59), (wire58 < wire63)})} <= (8'ha6));
      if (wire65)
        begin
          reg69 <= $signed($unsigned(wire50[(2'h2):(1'h0)]));
          if (({(reg56 <<< ($signed(reg55) > (reg69 ?
                  reg69 : wire50)))} >> reg68))
            begin
              reg70 <= (-$signed((&($unsigned(wire53) >>> ((8'haa) | wire60)))));
              reg71 <= ((wire63[(5'h12):(2'h2)] ?
                  reg67 : $signed(($unsigned(wire58) + wire62))) > ($unsigned(((-wire53) ?
                  (+wire60) : wire53)) != $unsigned(((&wire64) << (wire59 > wire51)))));
              reg72 <= $signed($unsigned($unsigned(((~|wire60) * {wire58}))));
              reg73 <= ($unsigned({{$signed(wire59), (^reg68)},
                  (reg56 ?
                      {wire65, wire63} : (reg72 ? reg67 : wire52))}) | ((reg69 ?
                  $signed((^reg70)) : $signed((reg55 ?
                      wire66 : reg67))) >>> $signed($unsigned(reg56[(4'ha):(3'h6)]))));
            end
          else
            begin
              reg70 <= $signed($unsigned((~^(~|(~reg73)))));
              reg71 <= wire63[(4'hc):(2'h2)];
              reg72 <= $unsigned($signed(wire53[(3'h7):(1'h0)]));
            end
          reg74 <= reg67[(2'h3):(1'h1)];
          reg75 <= $unsigned($unsigned((~^$signed((wire51 ?
              wire65 : wire61)))));
          reg76 <= (&(($signed((reg56 > reg68)) << {(reg56 < (8'hbe)),
              ((8'hb8) * wire59)}) + $signed((|{reg70, wire52}))));
        end
      else
        begin
          reg69 <= ($signed(wire61) ? wire52[(1'h0):(1'h0)] : wire65);
        end
      if ((((reg75[(5'h12):(1'h1)] || reg72[(3'h7):(3'h4)]) ?
              {(wire60 ? wire60[(3'h5):(2'h2)] : $signed((8'hbb))),
                  $unsigned({wire53, reg75})} : $signed(wire58)) ?
          $unsigned(wire64) : wire53))
        begin
          reg77 <= (((reg75 >>> reg57) * $signed((wire53 < reg55))) >= (!wire64[(3'h7):(3'h4)]));
          reg78 <= ($signed(reg71[(4'hd):(4'h9)]) <= {(reg73 || {(reg57 == reg76)}),
              $signed(reg77[(1'h1):(1'h0)])});
        end
      else
        begin
          reg77 <= $signed($unsigned((((reg76 ?
                  reg67 : wire60) >>> ((7'h41) && reg76)) ?
              reg69 : $signed(reg68))));
          reg78 <= (8'hbd);
          if ($signed($unsigned({wire58})))
            begin
              reg79 <= (+($signed({(-reg78), (wire63 != wire65)}) ?
                  ({(-reg70), reg70} * ((reg70 - wire65) ?
                      {wire58,
                          wire50} : (reg56 - wire52))) : ($unsigned((~^reg68)) ?
                      reg78 : $signed($unsigned(wire64)))));
              reg80 <= reg79;
              reg81 <= {(~$unsigned(reg72)),
                  (&$unsigned(reg74[(2'h2):(1'h1)]))};
              reg82 <= reg56[(1'h0):(1'h0)];
            end
          else
            begin
              reg79 <= (wire53[(1'h0):(1'h0)] != (-{$signed((wire52 >> wire63)),
                  (^$unsigned(reg67))}));
              reg80 <= (reg70 <<< $signed((8'ha6)));
              reg81 <= (&reg67[(3'h5):(3'h5)]);
              reg82 <= reg73[(2'h2):(1'h0)];
            end
          if (wire61[(2'h3):(1'h1)])
            begin
              reg83 <= {reg73,
                  (((8'hac) ?
                      $signed(((8'haf) ?
                          reg76 : (8'h9f))) : wire64[(2'h2):(1'h0)]) || $signed(reg76[(3'h4):(1'h1)]))};
            end
          else
            begin
              reg83 <= (({{{wire63, wire58},
                      (wire52 * wire53)}} || reg71[(4'hc):(4'h8)]) * (+(|$signed((~reg69)))));
              reg84 <= wire66;
              reg85 <= $unsigned((&$unsigned(reg78)));
              reg86 <= ($unsigned((reg78[(4'hd):(2'h2)] ?
                      (~$signed(reg77)) : ({reg81, wire65} ?
                          wire51[(3'h4):(1'h1)] : $unsigned(wire66)))) ?
                  ($unsigned($signed((reg73 >>> reg68))) ?
                      $unsigned($signed($unsigned(reg79))) : reg79) : wire61[(5'h11):(4'hf)]);
              reg87 <= wire58;
            end
          reg88 <= ((+$signed($unsigned($signed(reg56)))) != $signed(($unsigned({wire51}) ?
              reg73[(3'h4):(2'h2)] : (!$unsigned(wire62)))));
        end
      reg89 <= $unsigned(($signed(reg75[(3'h4):(1'h0)]) == wire53[(2'h3):(2'h2)]));
    end
  module90 #() modinst131 (.clk(clk), .wire95(reg86), .wire94(wire51), .wire92(reg85), .wire93(reg88), .wire91(wire64), .y(wire130));
  assign wire132 = $unsigned({$unsigned(wire50)});
  assign wire133 = wire66;
  assign wire134 = wire58[(2'h3):(2'h2)];
endmodule

module module35
#(parameter param46 = (|({(|{(8'hbd), (8'hba)})} ? {((!(8'h9c)) ? (-(8'ha8)) : (~&(8'hb4))), ((!(8'hb0)) | {(8'h9c), (8'ha8)})} : ({{(8'ha0), (7'h43)}} ? (((8'hb7) << (8'hba)) ? (~|(8'hab)) : (!(8'ha4))) : (&((8'hb0) ? (8'hb6) : (8'hae)))))))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire40;
  input wire [(4'h8):(1'h0)] wire39;
  input wire signed [(5'h14):(1'h0)] wire38;
  input wire [(4'hd):(1'h0)] wire37;
  input wire [(4'ha):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  assign y = {wire43, wire42, wire41, reg45, reg44, (1'h0)};
  assign wire41 = (-(8'hb2));
  assign wire42 = $signed($signed(wire39));
  assign wire43 = $signed($signed((((8'haf) ? $unsigned(wire42) : wire42) ?
                      (8'hb7) : {((8'ha3) ? wire40 : wire39), (|wire40)})));
  always
    @(posedge clk) begin
      reg44 <= ((($signed(wire42) ?
              ((wire40 > wire36) ? (8'hb4) : wire39) : wire36) ?
          $signed((~$unsigned(wire41))) : $signed({(wire40 ? wire41 : (8'h9f)),
              (wire37 ?
                  wire40 : wire37)})) == (|($signed(wire41[(1'h0):(1'h0)]) < $unsigned((wire40 >= wire43)))));
      reg45 <= $signed((^~({wire40[(1'h0):(1'h0)],
          $signed(wire39)} + $unsigned(wire43))));
    end
endmodule

module module15
#(parameter param24 = (({({(7'h43), (8'hb2)} >>> {(8'h9f)}), ((^~(7'h44)) ^~ ((8'ha0) ? (8'had) : (8'ha2)))} >> ((((7'h42) < (8'hbd)) < ((8'hbc) >>> (8'ha7))) ? (^~(&(8'ha0))) : ((|(7'h44)) && ((8'haf) * (8'ha5))))) * ({{(^~(7'h41))}} - (((~|(8'hb5)) ? ((7'h41) ? (8'h9e) : (8'ha2)) : ((8'h9f) && (8'ha7))) ? (((7'h42) != (8'h9d)) ? ((7'h44) ? (8'h9c) : (8'hbd)) : {(8'hb2)}) : (((8'hbb) * (8'hba)) ? (7'h42) : ((8'hb7) + (8'ha4)))))), 
parameter param25 = (+((param24 != {param24, (param24 != param24)}) ? {((param24 ? param24 : param24) ~^ (~(7'h42))), ((param24 ? param24 : param24) ? (8'hb9) : (param24 ? param24 : (8'ha0)))} : {(param24 ? (^(7'h41)) : ((8'hb5) | param24)), (param24 == (param24 | param24))})))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  assign y = {wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = $unsigned((!$unsigned(((wire17 || wire17) ?
                      (wire16 ? wire16 : wire18) : (wire16 & wire19)))));
  assign wire21 = (+{(!(wire20 - (-(8'h9d)))), $unsigned($unsigned(wire16))});
  assign wire22 = wire18;
  assign wire23 = $signed(({$unsigned((wire17 ? wire18 : (8'h9c))),
                      $unsigned($signed(wire20))} | wire18));
endmodule

module module90
#(parameter param129 = {((+(-{(8'ha1)})) <= ((((8'ha6) <<< (8'ha3)) << {(7'h40), (8'hae)}) ? (((8'hbd) ? (7'h42) : (8'ha0)) != ((8'h9f) << (8'h9c))) : ((~^(8'hbe)) ? ((8'hb3) + (7'h43)) : (~&(8'hb1))))), (^~(~|{(~|(8'hab)), ((8'hbd) ? (8'hb1) : (8'ha2))}))})
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire95;
  input wire signed [(5'h10):(1'h0)] wire94;
  input wire signed [(5'h13):(1'h0)] wire93;
  input wire signed [(5'h10):(1'h0)] wire92;
  input wire [(5'h14):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire128;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire108;
  wire signed [(4'hd):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  assign y = {wire128,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 reg127,
                 reg126,
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
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire96 = wire92;
  assign wire97 = (wire91 ? wire93 : (8'h9d));
  assign wire98 = (+wire93[(4'h9):(1'h0)]);
  assign wire99 = (wire98 & (^~wire93));
  always
    @(posedge clk) begin
      reg100 <= ($signed($unsigned({wire96[(3'h4):(1'h1)],
          $signed(wire92)})) < (wire95[(4'hf):(4'h8)] ?
          (-$signed(wire98)) : (~$signed($signed(wire99)))));
      reg101 <= (7'h41);
      reg102 <= $signed($unsigned($signed(wire99[(1'h0):(1'h0)])));
    end
  assign wire103 = $signed((-$unsigned(reg101[(3'h6):(3'h6)])));
  assign wire104 = ((wire95[(3'h6):(1'h0)] || $signed({wire94,
                           $signed(reg101)})) ?
                       $unsigned(($signed((wire96 ? wire97 : wire91)) ?
                           reg101[(2'h3):(2'h2)] : (+(~^(8'hb3))))) : (wire93 > $signed($unsigned(wire97[(4'hd):(2'h3)]))));
  assign wire105 = ($unsigned((~|(~^(~(8'haf))))) > (~&({$unsigned(wire104),
                           $signed(wire96)} ?
                       (!(~reg102)) : $unsigned((wire94 != (8'hac))))));
  assign wire106 = wire96[(1'h0):(1'h0)];
  assign wire107 = ((~^wire105[(3'h7):(1'h1)]) ?
                       (($signed({wire91}) >>> wire94) + ($unsigned($signed(wire98)) & wire103[(3'h7):(3'h5)])) : (~&$signed($unsigned((wire97 ?
                           wire95 : reg101)))));
  assign wire108 = {wire98[(4'h9):(2'h2)],
                       (wire98 * (((wire92 <= wire93) ?
                           (~|wire95) : (|wire105)) - $signed(wire96)))};
  assign wire109 = (-$signed((wire97[(4'h9):(3'h4)] <<< {wire92[(2'h2):(1'h1)],
                       wire105})));
  always
    @(posedge clk) begin
      if (wire106[(4'ha):(1'h1)])
        begin
          reg110 <= ({(^$unsigned($unsigned(wire108))), wire92[(3'h6):(3'h5)]} ?
              (8'hbd) : $unsigned(wire91[(4'hd):(4'hb)]));
          if (wire91)
            begin
              reg111 <= ($signed($unsigned(({wire105} ?
                      ((7'h41) >> wire105) : reg110))) ?
                  wire97 : wire105[(3'h6):(1'h1)]);
              reg112 <= $signed(wire91);
              reg113 <= ($signed(wire104[(4'ha):(4'h9)]) * reg100[(2'h2):(1'h0)]);
              reg114 <= (wire97 != wire98);
              reg115 <= $signed(($signed(wire92[(4'ha):(3'h6)]) ?
                  $unsigned({(wire93 ?
                          wire96 : wire107)}) : (reg102 || $signed((+reg111)))));
            end
          else
            begin
              reg111 <= ((~{reg110[(1'h0):(1'h0)],
                      (wire107[(4'ha):(4'h9)] ?
                          $unsigned(reg100) : $signed(reg114))}) ?
                  ((wire93 <= $signed((wire98 ? wire103 : wire97))) ?
                      ((^~(wire94 ? (8'h9f) : reg112)) ?
                          ((^~wire105) ?
                              (reg101 >> wire105) : reg114[(1'h0):(1'h0)]) : $unsigned($unsigned(wire95))) : $unsigned(((^~wire95) <<< $unsigned(wire104)))) : reg113[(4'h8):(3'h7)]);
              reg112 <= $unsigned(($signed((wire109 ?
                  $signed(reg115) : $signed(wire94))) + $signed(((reg102 ?
                      wire92 : reg110) ?
                  wire107[(4'h9):(4'h9)] : (reg102 || wire106)))));
              reg113 <= wire97[(1'h0):(1'h0)];
              reg114 <= {$signed((&($signed((8'hb8)) ?
                      $unsigned(reg114) : (-wire96)))),
                  $unsigned($unsigned(wire91[(5'h12):(4'h8)]))};
            end
          reg116 <= $unsigned((~^{((reg110 & wire93) >>> wire96)}));
          reg117 <= wire108[(4'hb):(3'h6)];
        end
      else
        begin
          reg110 <= $unsigned((&wire104));
        end
      if ({({reg112[(1'h0):(1'h0)]} == {($signed(wire108) ?
                  (&reg102) : wire103[(2'h2):(1'h0)])}),
          $unsigned((wire108[(2'h2):(2'h2)] ?
              (~|$signed(reg101)) : (wire104 ?
                  $signed(wire105) : (wire106 <<< (8'hb2)))))})
        begin
          if ($unsigned(((~|($signed(reg102) ?
                  wire106 : (reg111 ? (8'ha9) : wire92))) ?
              reg110[(3'h4):(1'h1)] : (reg117[(4'he):(4'h8)] << (-(~wire94))))))
            begin
              reg118 <= $signed(wire97[(1'h0):(1'h0)]);
              reg119 <= (~|wire94);
              reg120 <= wire95;
              reg121 <= wire94;
            end
          else
            begin
              reg118 <= $unsigned($unsigned($unsigned(reg102)));
              reg119 <= ((((~&$signed(reg117)) ?
                      reg110 : ({wire96} ?
                          (reg120 != (8'hb6)) : {wire97})) >>> ((&(wire93 <= wire106)) - $unsigned(reg117))) ?
                  reg100[(2'h3):(2'h3)] : $signed(wire104));
              reg120 <= reg117;
            end
          reg122 <= wire99[(1'h0):(1'h0)];
          reg123 <= $unsigned((^$unsigned((wire107[(4'h8):(3'h6)] < (wire105 ?
              wire96 : reg101)))));
          reg124 <= (reg117[(5'h10):(4'h9)] ?
              $unsigned(((+reg116) - {{reg112, reg112}, (~|wire91)})) : reg123);
          reg125 <= ((&wire108) ?
              reg115 : (^~$signed($unsigned($signed(reg116)))));
        end
      else
        begin
          reg118 <= wire103;
          reg119 <= ((~$signed(reg114)) ?
              ($signed($unsigned(wire95[(3'h5):(3'h5)])) ?
                  $unsigned($unsigned($unsigned(reg124))) : wire98[(1'h1):(1'h1)]) : $signed($signed((wire97[(3'h5):(3'h4)] ?
                  $unsigned(wire91) : wire91[(3'h7):(2'h3)]))));
          reg120 <= (8'ha8);
          reg121 <= wire91[(5'h10):(3'h5)];
          if ((^wire108))
            begin
              reg122 <= (~^reg110);
              reg123 <= reg121;
              reg124 <= $signed((reg121[(4'h8):(3'h4)] > (&(7'h42))));
            end
          else
            begin
              reg122 <= wire109;
              reg123 <= (!(({$signed(wire94), $unsigned(reg112)} ?
                  (-$unsigned((8'hab))) : reg114[(4'hc):(3'h6)]) << wire104));
              reg124 <= ((wire105 + $signed($unsigned(wire92[(4'hf):(4'ha)]))) ?
                  $signed($unsigned(($unsigned(wire97) <= reg118[(3'h6):(3'h5)]))) : ((~reg112) ^ $unsigned(reg114[(4'he):(4'h8)])));
            end
        end
      reg126 <= (~&((!$signed($unsigned((8'hb9)))) < ((wire103[(4'h8):(2'h2)] <<< wire106[(4'hf):(2'h3)]) >= wire94)));
      reg127 <= (wire92[(1'h1):(1'h1)] ?
          {$signed(wire103[(4'ha):(3'h5)])} : reg123[(3'h4):(3'h4)]);
    end
  assign wire128 = reg102;
endmodule
