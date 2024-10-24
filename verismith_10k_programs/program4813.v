module top
#(parameter param257 = ((((((8'ha6) ? (8'hac) : (8'ha0)) - ((8'h9f) <<< (8'hbb))) + (((7'h41) << (8'h9e)) >>> (~&(7'h44)))) ? (^~(+((8'haf) ? (8'ha8) : (8'h9c)))) : ({(^~(8'h9c))} ? ((|(8'h9c)) ? ((8'hb7) != (8'hb6)) : (8'hbe)) : ((8'hb8) ? ((8'ha1) ? (8'hb9) : (8'hbe)) : (~(8'hbe))))) ? {(({(8'h9f), (8'hb5)} >= ((8'ha8) < (8'h9f))) ? (8'hb6) : ((^(8'hae)) ? {(8'hb9)} : (-(8'hb9))))} : {((~((7'h44) > (8'ha7))) > ({(8'hbc), (7'h44)} >> {(8'hb0)})), (({(8'hac), (8'haf)} <<< {(8'had), (8'hae)}) <<< ((^~(8'ha4)) ? (~^(8'ha7)) : ((8'hbc) ? (8'ha8) : (8'hb1))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire255;
  wire [(5'h14):(1'h0)] wire254;
  wire signed [(4'he):(1'h0)] wire253;
  wire [(4'ha):(1'h0)] wire251;
  wire signed [(5'h14):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire93;
  reg signed [(5'h11):(1'h0)] reg256 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire255,
                 wire254,
                 wire253,
                 wire251,
                 wire96,
                 wire95,
                 wire5,
                 wire6,
                 wire8,
                 wire9,
                 wire34,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire93,
                 reg256,
                 reg7,
                 (1'h0)};
  assign wire5 = (~^(8'ha9));
  assign wire6 = (^~(^~(+wire0)));
  always
    @(posedge clk) begin
      reg7 <= $signed({($signed((wire0 ? wire6 : wire3)) || (|(8'hb7)))});
    end
  assign wire8 = wire5[(2'h2):(1'h1)];
  assign wire9 = {{reg7},
                     {({$signed(wire6)} ^ $unsigned((~&wire1))),
                         (~^wire6[(4'h8):(2'h3)])}};
  module10 #() modinst35 (.clk(clk), .wire14(wire0), .y(wire34), .wire13(wire3), .wire11(wire6), .wire12(wire8));
  assign wire36 = {wire0};
  assign wire37 = $signed((~&(|$unsigned(wire0[(2'h2):(2'h2)]))));
  assign wire38 = wire2[(4'h9):(1'h0)];
  assign wire39 = wire5;
  assign wire40 = wire9[(1'h0):(1'h0)];
  assign wire41 = $signed(($signed(wire6[(2'h3):(2'h2)]) >= ($unsigned(wire0) >>> wire2[(4'h8):(1'h0)])));
  module42 #() modinst94 (wire93, clk, wire4, wire8, wire41, wire9, wire0);
  assign wire95 = $unsigned(($unsigned((~&(wire9 - wire2))) ?
                      $unsigned($unsigned((-(8'h9e)))) : reg7[(4'h8):(2'h3)]));
  assign wire96 = ((($unsigned((8'hb3)) ? $signed($unsigned(wire40)) : reg7) ?
                      (^$unsigned(wire4)) : wire3[(4'hb):(4'h9)]) > $unsigned($unsigned(((wire9 ~^ wire8) != (wire1 ?
                      wire41 : (8'ha3))))));
  module97 #() modinst252 (wire251, clk, wire34, wire6, wire5, wire39);
  assign wire253 = wire5;
  assign wire254 = wire3;
  assign wire255 = wire41[(4'hf):(1'h1)];
  always
    @(posedge clk) begin
      reg256 <= wire5;
    end
endmodule

module module97
#(parameter param250 = (^~(&(({(8'hb9), (7'h43)} ? ((7'h42) ^ (8'haf)) : ((8'ha0) && (8'hb5))) > ({(8'ha1), (8'haf)} | ((8'hb4) ~^ (8'hbd)))))))
(y, clk, wire98, wire99, wire100, wire101);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire98;
  input wire signed [(5'h13):(1'h0)] wire99;
  input wire [(5'h13):(1'h0)] wire100;
  input wire [(4'h9):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire129;
  wire signed [(4'h8):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(3'h4):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire135;
  wire signed [(4'h8):(1'h0)] wire209;
  wire [(5'h15):(1'h0)] wire211;
  wire [(2'h3):(1'h0)] wire212;
  wire signed [(5'h14):(1'h0)] wire213;
  wire [(4'h8):(1'h0)] wire214;
  wire [(4'hb):(1'h0)] wire215;
  wire [(2'h2):(1'h0)] wire248;
  assign y = {wire102,
                 wire129,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire209,
                 wire211,
                 wire212,
                 wire213,
                 wire214,
                 wire215,
                 wire248,
                 (1'h0)};
  assign wire102 = $signed(({((wire100 ? (7'h41) : (7'h40)) ?
                               $signed(wire98) : $signed((8'h9f))),
                           $signed($signed(wire98))} ?
                       $unsigned(wire98) : wire99));
  module103 #() modinst130 (.wire104(wire100), .y(wire129), .wire106(wire102), .wire107(wire101), .clk(clk), .wire105(wire98));
  assign wire131 = $unsigned(wire99);
  assign wire132 = wire131[(1'h1):(1'h0)];
  assign wire133 = {$unsigned(wire132[(3'h7):(3'h5)]),
                       (^(^$unsigned($unsigned(wire100))))};
  assign wire134 = (wire101 ? wire131 : wire101);
  assign wire135 = ($unsigned($signed((+(~&wire101)))) != ($signed((+(wire100 == wire133))) ?
                       wire133[(2'h3):(2'h3)] : (~|wire101[(3'h4):(1'h1)])));
  module136 #() modinst210 (wire209, clk, wire98, wire134, wire131, wire129);
  assign wire211 = wire134;
  assign wire212 = wire98[(4'hf):(4'hb)];
  assign wire213 = {wire131[(2'h2):(2'h2)],
                       ((wire101[(1'h0):(1'h0)] ?
                               (~&{wire135}) : $signed({wire212, wire135})) ?
                           wire134 : $unsigned(wire211[(3'h6):(2'h3)]))};
  assign wire214 = $signed(($unsigned(($signed((8'hb0)) ?
                           wire133[(2'h2):(1'h1)] : (8'hb7))) ?
                       $unsigned(wire213[(5'h12):(4'h8)]) : wire135));
  assign wire215 = wire213;
  module216 #() modinst249 (wire248, clk, wire213, wire99, wire211, wire98, wire135);
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire47;
  input wire [(4'he):(1'h0)] wire46;
  input wire [(4'hb):(1'h0)] wire45;
  input wire signed [(5'h13):(1'h0)] wire44;
  input wire [(5'h13):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire64;
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire64,
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
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  module48 #() modinst65 (.wire49(wire43), .wire51(wire45), .clk(clk), .wire52(wire46), .wire50(wire44), .y(wire64));
  assign wire66 = $unsigned(wire47[(4'h8):(2'h2)]);
  assign wire67 = ({(|{wire44}),
                      (&$signed((-wire66)))} & $signed($signed((+((8'ha8) ^ wire46)))));
  assign wire68 = $unsigned(($unsigned((^~wire44[(1'h0):(1'h0)])) != wire43[(5'h13):(5'h11)]));
  always
    @(posedge clk) begin
      reg69 <= (~^(~(8'h9d)));
      reg70 <= ($unsigned((7'h41)) ~^ (+(({(8'ha5)} ? wire45 : (|wire46)) ?
          wire66 : $signed(((8'h9e) ? wire64 : wire43)))));
      if ($unsigned(wire44[(5'h10):(4'h8)]))
        begin
          if ((($signed(wire67[(1'h1):(1'h1)]) ^ wire66) && (wire67[(1'h0):(1'h0)] ?
              $unsigned(($unsigned(wire68) <<< $signed(wire64))) : $unsigned(((wire64 <= reg69) ^ reg69)))))
            begin
              reg71 <= wire66[(2'h3):(1'h0)];
              reg72 <= (~^$signed((&{(wire67 << wire43),
                  ((8'ha7) ? reg71 : (8'hbb))})));
              reg73 <= $unsigned(wire43);
              reg74 <= reg73;
              reg75 <= $unsigned((!{($signed(wire43) != wire43)}));
            end
          else
            begin
              reg71 <= $signed(((^~(~reg74[(4'h8):(2'h3)])) ?
                  $unsigned({$unsigned(reg70),
                      (|(7'h43))}) : $unsigned(reg71[(1'h1):(1'h1)])));
              reg72 <= (!($signed(reg71[(2'h2):(1'h1)]) ?
                  $signed(({wire66,
                      reg71} & $unsigned((7'h42)))) : wire46[(1'h1):(1'h1)]));
            end
          reg76 <= reg73;
          if (reg69)
            begin
              reg77 <= {(wire66 + (wire44 ?
                      $signed(reg72) : wire44[(4'hd):(3'h7)])),
                  (&(reg74[(3'h4):(2'h3)] ?
                      wire45[(1'h0):(1'h0)] : {(wire64 ? wire67 : reg75),
                          (~^reg72)}))};
              reg78 <= $unsigned((|$signed(reg71[(3'h4):(2'h2)])));
              reg79 <= wire45[(2'h2):(1'h1)];
              reg80 <= reg71[(1'h0):(1'h0)];
            end
          else
            begin
              reg77 <= ($unsigned(reg72[(3'h5):(2'h2)]) & ($signed((7'h42)) ^~ ($signed((reg77 ?
                  reg77 : wire47)) + (^reg73[(2'h3):(2'h2)]))));
              reg78 <= reg70;
            end
          if ($unsigned(wire68[(2'h3):(1'h1)]))
            begin
              reg81 <= {(~|reg71),
                  (({$signed(reg71), (wire46 <<< reg72)} <<< $unsigned((wire67 ?
                          reg80 : reg77))) ?
                      $unsigned(reg73[(4'hf):(3'h7)]) : (&reg72[(4'he):(4'ha)]))};
              reg82 <= $signed(wire66[(4'hc):(3'h5)]);
              reg83 <= ((!reg79) ?
                  ({(8'hb9),
                      (~|$signed(reg77))} >>> reg69) : $unsigned($signed({$unsigned(reg78)})));
            end
          else
            begin
              reg81 <= (!$unsigned((((reg74 - (8'hb7)) && (wire68 << reg81)) && ($signed((8'hbc)) != $signed(wire45)))));
              reg82 <= $signed({{(-(reg79 ? reg77 : wire66)),
                      ($unsigned(reg79) ?
                          $unsigned(reg74) : wire64[(3'h5):(2'h2)])}});
              reg83 <= (^(reg69[(1'h0):(1'h0)] ?
                  ({reg72[(4'hc):(1'h1)], $signed(reg74)} ?
                      {(reg83 & reg82)} : (wire68 >= (^~reg78))) : $signed((+(reg72 * (8'ha3))))));
            end
          reg84 <= $unsigned($signed(reg73[(4'hb):(3'h6)]));
        end
      else
        begin
          reg71 <= {{(^~$signed($unsigned(reg76)))}, $unsigned($signed(reg71))};
        end
    end
  always
    @(posedge clk) begin
      if (((8'had) ? reg79 : $signed($signed({$signed((8'ha7))}))))
        begin
          reg85 <= ($signed($signed(($unsigned(wire66) >= (wire64 ?
              wire46 : reg70)))) != reg78[(1'h1):(1'h1)]);
          reg86 <= $signed($unsigned($signed(reg71)));
          reg87 <= $signed($unsigned((((wire44 ? wire46 : reg82) - reg72) ?
              wire43[(4'hb):(1'h0)] : reg80)));
        end
      else
        begin
          reg85 <= (wire64[(1'h1):(1'h1)] & (((reg75 ?
              reg73[(5'h10):(2'h2)] : wire64[(1'h0):(1'h0)]) >>> (reg83[(3'h4):(2'h3)] & reg78)) ^~ (+reg82[(2'h2):(1'h1)])));
          reg86 <= wire64;
          reg87 <= reg73;
          reg88 <= {reg83};
          reg89 <= {reg77[(2'h3):(2'h3)]};
        end
      reg90 <= $unsigned(wire67[(3'h4):(1'h1)]);
      reg91 <= reg75;
      reg92 <= $unsigned($signed(((^(!reg77)) || ($signed(reg72) ?
          reg70 : reg77))));
    end
endmodule

module module10
#(parameter param32 = ((~|(~(8'ha5))) ? ((|{{(8'hbe), (8'ha0)}}) >>> ((~((8'hb0) ? (8'hb9) : (8'hbd))) ? (&((7'h40) <<< (8'hbc))) : (((8'hb8) ^~ (8'hbd)) >= {(8'ha5)}))) : ((~^(7'h41)) ^ ((((8'h9c) > (7'h42)) ? ((8'ha5) < (8'ha4)) : (^(8'ha4))) ? (((8'hba) - (8'hab)) ? ((7'h40) ? (8'ha0) : (8'haf)) : (~|(8'hb8))) : (^((8'hba) ? (8'hbb) : (8'hba)))))), 
parameter param33 = param32)
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire15;
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 reg31,
                 reg30,
                 reg29,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg16,
                 (1'h0)};
  assign wire15 = wire12;
  always
    @(posedge clk) begin
      reg16 <= $signed($signed($signed(wire11)));
    end
  assign wire17 = wire15[(3'h5):(3'h5)];
  assign wire18 = (7'h40);
  assign wire19 = $unsigned((|wire11));
  always
    @(posedge clk) begin
      reg20 <= (wire17 * {wire19[(2'h2):(2'h2)], wire11});
      reg21 <= {(!wire19[(1'h0):(1'h0)])};
      reg22 <= reg20[(3'h5):(3'h5)];
      reg23 <= $signed(({wire13[(3'h6):(3'h6)],
          $signed($unsigned(wire15))} >>> reg22));
      reg24 <= reg23;
    end
  assign wire25 = {wire19};
  assign wire26 = ($signed((~|((reg23 > wire17) && ((8'ha4) - wire11)))) && wire12);
  assign wire27 = $signed($unsigned(({$signed(wire14), (^~wire14)} ?
                      $unsigned((~&wire19)) : $signed($signed(reg23)))));
  assign wire28 = $unsigned((($signed((~^wire27)) <= $signed($unsigned(reg21))) ?
                      ({(reg23 || (8'ha2))} >> $signed($unsigned(reg24))) : $signed(wire17)));
  always
    @(posedge clk) begin
      reg29 <= wire12[(2'h2):(1'h0)];
      reg30 <= wire26;
      reg31 <= wire15[(3'h5):(1'h1)];
    end
endmodule

module module48
#(parameter param63 = (((!{((7'h41) ^~ (8'h9c)), ((8'hb4) <= (7'h44))}) == (~(~|(&(7'h44))))) > ((~&(((7'h44) != (8'ha8)) ? ((8'haf) != (8'hb7)) : ((8'h9d) ? (8'hb9) : (8'hb9)))) >= (~&({(7'h43), (7'h40)} != (!(8'h9f)))))))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire52;
  input wire [(4'hb):(1'h0)] wire51;
  input wire signed [(5'h13):(1'h0)] wire50;
  input wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire53;
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire57,
                 wire56,
                 wire53,
                 reg59,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire53 = {$unsigned($unsigned((wire52 ?
                          wire51[(3'h7):(1'h1)] : wire52[(1'h0):(1'h0)]))),
                      (~|wire51[(4'ha):(3'h6)])};
  always
    @(posedge clk) begin
      reg54 <= wire49;
      reg55 <= $unsigned($unsigned((((wire52 || wire50) <<< $unsigned(wire53)) ?
          ((!wire52) - (wire53 + reg54)) : wire51[(4'h8):(2'h2)])));
    end
  assign wire56 = $signed((~&(((^~wire50) ?
                          $signed((8'hb7)) : (reg54 ? wire53 : (8'h9f))) ?
                      $unsigned((wire52 ?
                          wire49 : (8'ha5))) : ((wire50 << reg54) ^ wire52))));
  assign wire57 = $signed(((wire50 + $unsigned((wire52 ?
                      (8'ha5) : wire49))) <= $signed((!wire52[(1'h0):(1'h0)]))));
  assign wire58 = wire50[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg59 <= $unsigned(((~^$signed($unsigned((8'hbd)))) ?
          $signed(wire49[(5'h11):(5'h10)]) : wire52[(3'h5):(1'h0)]));
    end
  assign wire60 = {(+wire51),
                      ($unsigned(((reg55 <<< reg59) ?
                          (wire58 ?
                              (8'ha0) : wire49) : (wire49 <<< reg55))) << $signed(((^~wire50) ?
                          wire49[(1'h0):(1'h0)] : (wire56 ~^ (8'h9d)))))};
  assign wire61 = (&($signed(wire57) >>> $signed(wire58)));
  assign wire62 = wire50;
endmodule

module module216
#(parameter param247 = (({({(8'hb1)} > (~&(8'haa)))} ~^ (8'haf)) ? (((((8'had) ? (8'haa) : (8'hb0)) ? (~^(8'ha4)) : ((8'hb9) + (8'haa))) ^ ((&(8'had)) ? (8'hac) : (+(8'hbb)))) ? (({(8'hb9), (8'hb3)} ? ((8'hbf) && (8'h9e)) : ((8'h9d) - (8'hb7))) < (+(~&(7'h41)))) : {((~&(8'hb1)) ? (8'hbc) : (7'h41)), ({(8'hba)} ^~ ((8'haf) ? (8'h9c) : (8'ha5)))}) : ((&((!(8'ha5)) > (8'h9c))) ? ((-(|(7'h43))) | (~(|(8'hb0)))) : ((((8'hb3) << (8'ha9)) ~^ ((8'hb6) ? (8'hb2) : (8'hbc))) != ((~^(8'hb4)) > ((8'ha2) ^ (7'h42)))))))
(y, clk, wire221, wire220, wire219, wire218, wire217);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire221;
  input wire [(5'h13):(1'h0)] wire220;
  input wire [(4'hc):(1'h0)] wire219;
  input wire [(5'h10):(1'h0)] wire218;
  input wire [(5'h14):(1'h0)] wire217;
  wire signed [(5'h12):(1'h0)] wire246;
  wire [(3'h6):(1'h0)] wire245;
  wire [(3'h6):(1'h0)] wire244;
  wire [(4'hd):(1'h0)] wire239;
  wire signed [(3'h4):(1'h0)] wire238;
  wire signed [(5'h15):(1'h0)] wire237;
  wire [(5'h11):(1'h0)] wire236;
  wire [(4'hb):(1'h0)] wire235;
  wire signed [(4'hd):(1'h0)] wire234;
  wire signed [(4'hf):(1'h0)] wire233;
  wire signed [(5'h14):(1'h0)] wire232;
  wire [(3'h4):(1'h0)] wire231;
  wire signed [(3'h6):(1'h0)] wire230;
  wire [(5'h12):(1'h0)] wire229;
  wire [(5'h13):(1'h0)] wire228;
  wire signed [(5'h10):(1'h0)] wire227;
  wire [(5'h10):(1'h0)] wire226;
  wire [(4'hd):(1'h0)] wire225;
  wire signed [(5'h12):(1'h0)] wire224;
  wire [(5'h10):(1'h0)] wire223;
  wire [(3'h7):(1'h0)] wire222;
  reg [(4'hc):(1'h0)] reg243 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg242 = (1'h0);
  reg [(4'h8):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg240 = (1'h0);
  assign y = {wire246,
                 wire245,
                 wire244,
                 wire239,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 (1'h0)};
  assign wire222 = ({wire221} ?
                       (&((~|$unsigned(wire218)) ?
                           (~|(wire217 ? wire219 : wire220)) : ((^~wire220) ?
                               (wire220 != wire220) : (8'hb6)))) : (7'h40));
  assign wire223 = wire221;
  assign wire224 = $unsigned((7'h40));
  assign wire225 = (+wire222[(1'h0):(1'h0)]);
  assign wire226 = $unsigned(({(-wire224[(3'h4):(1'h0)])} ?
                       ($unsigned(wire224) & (wire221 <= $unsigned(wire225))) : wire218));
  assign wire227 = ((wire225[(4'h9):(3'h4)] ?
                           (~wire226[(3'h5):(3'h5)]) : (+wire223[(4'hf):(3'h6)])) ?
                       (^~wire223) : (($unsigned($signed(wire224)) <= wire217[(4'ha):(3'h5)]) ?
                           $signed($unsigned($unsigned(wire222))) : wire218[(4'ha):(3'h5)]));
  assign wire228 = {(~^((((8'hb8) >> wire220) ?
                           $unsigned(wire217) : wire225) << $signed($signed(wire225))))};
  assign wire229 = (((wire218 && (|$signed(wire220))) ?
                       wire221 : wire222) <= wire217[(4'he):(3'h7)]);
  assign wire230 = (+wire219[(3'h4):(2'h2)]);
  assign wire231 = $unsigned((^$unsigned({$unsigned((8'hbc)), wire222})));
  assign wire232 = {{wire228, wire225[(2'h2):(1'h0)]}, $unsigned({wire224})};
  assign wire233 = ((|(&{(wire218 - wire230)})) ?
                       $signed((|({wire229, wire220} ?
                           $signed(wire225) : (|wire220)))) : (~^(&(&wire225[(2'h2):(1'h0)]))));
  assign wire234 = {$unsigned($signed(wire220[(4'h9):(3'h7)])),
                       ($signed(wire226) <= (($signed(wire223) ?
                           (wire217 ?
                               wire221 : wire228) : $signed(wire221)) < (wire230 ?
                           wire223 : (wire232 > wire224))))};
  assign wire235 = ($unsigned($signed((wire228[(2'h2):(1'h0)] << wire223))) <= wire233[(3'h4):(1'h0)]);
  assign wire236 = wire219[(1'h0):(1'h0)];
  assign wire237 = wire233;
  assign wire238 = wire225[(3'h7):(2'h2)];
  assign wire239 = $signed(wire227);
  always
    @(posedge clk) begin
      reg240 <= $unsigned($unsigned((((~wire218) ?
          {wire233, wire236} : (~|wire223)) ^~ $signed((wire217 ?
          wire225 : wire236)))));
      reg241 <= (&$unsigned($signed((wire232[(4'he):(2'h2)] + (-wire236)))));
      reg242 <= (wire234[(1'h0):(1'h0)] ?
          $unsigned($unsigned($signed((+(8'ha4))))) : ((^$signed((|wire225))) ?
              ((+$unsigned(wire225)) ?
                  (wire221[(4'ha):(4'ha)] >> reg240[(3'h6):(1'h0)]) : $signed($signed(wire235))) : (((^(8'h9f)) & wire225[(3'h6):(3'h4)]) | $unsigned($unsigned(wire229)))));
    end
  always
    @(posedge clk) begin
      reg243 <= wire221;
    end
  assign wire244 = (wire231[(2'h3):(1'h0)] ?
                       ($signed(wire223) + wire226[(2'h3):(1'h0)]) : ((8'hab) ?
                           $unsigned((wire221 > $unsigned(wire230))) : $unsigned((~|(~^wire222)))));
  assign wire245 = wire226;
  assign wire246 = $unsigned(wire236[(2'h2):(1'h0)]);
endmodule

module module136
#(parameter param208 = (+((((+(7'h41)) >>> (^(7'h42))) ? (+((8'had) ? (8'h9f) : (8'ha0))) : (|{(8'hb2)})) ? {(((7'h40) ? (8'hae) : (7'h40)) ? (^(8'ha3)) : {(8'ha2)})} : {(+((8'hbc) + (7'h42)))})))
(y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'h311):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire140;
  input wire signed [(3'h6):(1'h0)] wire139;
  input wire [(4'h8):(1'h0)] wire138;
  input wire signed [(3'h4):(1'h0)] wire137;
  wire signed [(4'hd):(1'h0)] wire207;
  wire [(4'h8):(1'h0)] wire206;
  wire [(5'h10):(1'h0)] wire205;
  wire signed [(4'hd):(1'h0)] wire204;
  wire signed [(4'ha):(1'h0)] wire203;
  wire signed [(5'h14):(1'h0)] wire191;
  wire signed [(3'h5):(1'h0)] wire185;
  wire signed [(4'hd):(1'h0)] wire183;
  wire signed [(4'hb):(1'h0)] wire176;
  wire [(4'hf):(1'h0)] wire175;
  wire signed [(3'h6):(1'h0)] wire173;
  wire signed [(5'h11):(1'h0)] wire172;
  wire signed [(3'h6):(1'h0)] wire171;
  wire signed [(2'h3):(1'h0)] wire150;
  wire [(4'hb):(1'h0)] wire141;
  reg [(4'he):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg200 = (1'h0);
  reg [(5'h13):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg198 = (1'h0);
  reg [(4'h9):(1'h0)] reg197 = (1'h0);
  reg [(2'h3):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg195 = (1'h0);
  reg [(5'h10):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg193 = (1'h0);
  reg [(5'h12):(1'h0)] reg192 = (1'h0);
  reg [(5'h14):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg189 = (1'h0);
  reg [(3'h7):(1'h0)] reg188 = (1'h0);
  reg [(3'h6):(1'h0)] reg187 = (1'h0);
  reg [(4'he):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg184 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg181 = (1'h0);
  reg [(3'h7):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg [(4'hd):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg [(4'hb):(1'h0)] reg170 = (1'h0);
  reg [(4'hf):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg160 = (1'h0);
  reg [(3'h5):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg157 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg [(4'he):(1'h0)] reg154 = (1'h0);
  reg [(4'hb):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(5'h15):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  assign y = {wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire191,
                 wire185,
                 wire183,
                 wire176,
                 wire175,
                 wire173,
                 wire172,
                 wire171,
                 wire150,
                 wire141,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg184,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg174,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  assign wire141 = (-(|((~|wire139) << wire138[(3'h4):(3'h4)])));
  always
    @(posedge clk) begin
      reg142 <= (^~$unsigned($signed($unsigned($signed(wire137)))));
      reg143 <= ((($unsigned((wire138 * wire137)) >>> (wire137[(3'h4):(3'h4)] ^~ $signed(wire140))) ?
              wire140 : ($signed($unsigned((8'hba))) <<< (~&(wire137 < wire139)))) ?
          {((wire141[(4'ha):(2'h2)] <= $signed((8'hb4))) ?
                  (wire141[(4'h9):(3'h5)] ?
                      wire139[(3'h6):(1'h1)] : $signed(wire137)) : $signed((reg142 ?
                      wire137 : wire139))),
              reg142} : (+wire139));
      if ((($signed($signed(reg143)) == wire139[(3'h5):(3'h4)]) >> wire137[(2'h2):(1'h1)]))
        begin
          reg144 <= $unsigned(reg142[(2'h2):(2'h2)]);
        end
      else
        begin
          reg144 <= wire139[(3'h4):(2'h2)];
          reg145 <= wire140[(4'ha):(2'h2)];
          reg146 <= {((reg144[(3'h6):(1'h1)] <<< reg144) >= (wire138[(1'h1):(1'h1)] ?
                  (!reg143[(5'h13):(3'h6)]) : (+reg142))),
              $unsigned(((^~(!(8'hb9))) + $signed((reg144 != wire140))))};
          if (wire137)
            begin
              reg147 <= reg146;
              reg148 <= wire137;
              reg149 <= $unsigned(wire137[(2'h2):(1'h1)]);
            end
          else
            begin
              reg147 <= ({$signed((wire139[(2'h2):(1'h0)] ?
                      $unsigned(reg146) : ((8'hbc) <= reg145)))} * (reg148 ?
                  reg148[(1'h0):(1'h0)] : {reg149[(4'hc):(4'hb)],
                      wire138[(1'h0):(1'h0)]}));
            end
        end
    end
  assign wire150 = ($unsigned((~wire138[(2'h2):(1'h0)])) ?
                       reg144 : $signed((reg142 ?
                           (^{reg146}) : (reg142 ?
                               reg144 : $unsigned(wire141)))));
  always
    @(posedge clk) begin
      if (wire140)
        begin
          reg151 <= ((~$signed((-reg149))) ?
              (|$signed(reg149[(1'h0):(1'h0)])) : wire150[(1'h0):(1'h0)]);
          reg152 <= reg147[(3'h6):(3'h5)];
          if ((!{(reg148[(3'h4):(2'h2)] ?
                  ($signed(wire150) ?
                      (|wire138) : (reg152 - wire138)) : (^~{reg149}))}))
            begin
              reg153 <= $signed((~&reg143));
              reg154 <= $signed($signed(wire140[(1'h1):(1'h0)]));
              reg155 <= {$unsigned($unsigned(wire138[(3'h4):(2'h3)]))};
              reg156 <= (($unsigned($signed({(8'ha8),
                  wire138})) ^~ ((~|((8'haa) != reg155)) ?
                  (~&$unsigned(reg151)) : {reg142[(2'h2):(1'h1)]})) << (reg148 + $unsigned(($signed(wire137) != (~^wire141)))));
              reg157 <= {wire137[(1'h1):(1'h1)]};
            end
          else
            begin
              reg153 <= $signed($unsigned(((~&(reg146 == (8'h9c))) >>> ((-(8'hb9)) ?
                  (reg157 << wire150) : $unsigned(reg157)))));
              reg154 <= $signed(wire139);
              reg155 <= {$unsigned($signed((reg154[(2'h2):(1'h0)] ?
                      reg153[(1'h0):(1'h0)] : (wire140 * reg155))))};
              reg156 <= reg143[(4'h8):(3'h5)];
            end
        end
      else
        begin
          reg151 <= (((~&((reg148 | wire140) | reg144[(2'h2):(2'h2)])) ?
              (^$unsigned((reg142 ^ wire138))) : ($signed(reg152[(3'h5):(2'h2)]) >>> (8'ha6))) && (((|wire139[(1'h1):(1'h0)]) ^ ($signed(wire150) ?
              (8'hba) : $signed(wire150))) <= reg145));
        end
      reg158 <= (^~(~|(((+reg157) * ((8'ha1) + reg154)) ?
          {$signed(reg154),
              (reg145 ? reg153 : (7'h40))} : $signed((wire141 >> reg153)))));
    end
  always
    @(posedge clk) begin
      reg159 <= reg143;
      reg160 <= (!$unsigned(($signed($signed((8'hbc))) ?
          (&(8'hbe)) : $unsigned(reg145[(3'h4):(2'h3)]))));
      reg161 <= reg151[(3'h6):(1'h0)];
      if ((reg145 - (reg160 ? $signed(reg160) : reg161[(3'h6):(2'h2)])))
        begin
          reg162 <= ($unsigned(reg157) | $signed($unsigned($signed(reg161[(4'h9):(2'h3)]))));
          reg163 <= $unsigned($unsigned(reg157));
        end
      else
        begin
          reg162 <= (+reg151[(1'h0):(1'h0)]);
          reg163 <= reg142;
          reg164 <= (|$signed($unsigned(reg144[(1'h1):(1'h1)])));
          if ({($signed(reg158) ?
                  reg159[(3'h4):(2'h3)] : ($signed((reg162 ?
                      wire150 : wire138)) ^~ ($unsigned(wire141) ?
                      $unsigned(wire139) : $signed(wire150)))),
              $signed($unsigned(reg143[(5'h11):(4'h9)]))})
            begin
              reg165 <= (8'hb9);
              reg166 <= reg142;
              reg167 <= $unsigned((|{(~$signed(reg165)), (!reg157)}));
              reg168 <= reg144[(2'h3):(1'h1)];
              reg169 <= wire139;
            end
          else
            begin
              reg165 <= $unsigned((&((8'ha1) ?
                  reg148 : ($signed((7'h44)) * $unsigned(reg157)))));
              reg166 <= ($signed(($signed($signed(reg154)) >>> (reg165[(4'hc):(3'h4)] ?
                      (reg149 ? (7'h43) : reg147) : (^reg161)))) ?
                  $unsigned((+reg159)) : reg164[(4'he):(1'h0)]);
            end
          reg170 <= reg152[(2'h3):(2'h2)];
        end
    end
  assign wire171 = (^($signed(reg151[(2'h3):(2'h3)]) * {wire137[(1'h0):(1'h0)]}));
  assign wire172 = ($unsigned({((~|reg157) & {reg165}),
                       ((reg168 > reg161) ?
                           (wire139 >> reg155) : (8'ha1))}) >= reg165[(1'h0):(1'h0)]);
  assign wire173 = (~^wire137);
  always
    @(posedge clk) begin
      reg174 <= reg157;
    end
  assign wire175 = reg158[(3'h4):(3'h4)];
  assign wire176 = (wire175[(2'h2):(1'h0)] ?
                       reg145 : ((+reg160[(3'h5):(3'h5)]) ?
                           $unsigned(($signed(reg143) * $unsigned(reg164))) : ((~$signed(wire175)) <= (reg156[(2'h3):(1'h1)] ?
                               reg159[(2'h3):(2'h2)] : (reg164 >= wire138)))));
  always
    @(posedge clk) begin
      reg177 <= reg146[(4'he):(4'hb)];
      reg178 <= wire137[(1'h1):(1'h0)];
      if (reg177)
        begin
          reg179 <= (8'hb4);
          reg180 <= ((~|$signed({reg160})) <= $unsigned($signed(reg163)));
          reg181 <= ({$unsigned((!reg147)),
                  ($signed($unsigned(reg169)) ?
                      $signed(reg180) : ((wire175 && reg148) || (+wire172)))} ?
              $signed((reg174 ?
                  $signed((^(8'h9c))) : reg147)) : $signed($unsigned($unsigned((-reg164)))));
          reg182 <= ((($unsigned((^~reg151)) ?
                      reg163 : $signed($unsigned(wire175))) ?
                  ($signed({reg146}) ?
                      $unsigned($unsigned(reg146)) : reg170) : reg148[(2'h2):(2'h2)]) ?
              $unsigned(reg161[(3'h5):(1'h0)]) : {reg180[(3'h6):(1'h1)],
                  $unsigned({(reg165 ? wire171 : reg147)})});
        end
      else
        begin
          reg179 <= reg178[(3'h6):(3'h4)];
          reg180 <= reg168[(4'h8):(1'h0)];
          reg181 <= {reg167};
        end
    end
  assign wire183 = (!$signed((wire141[(3'h7):(3'h6)] <= (+$signed(reg168)))));
  always
    @(posedge clk) begin
      reg184 <= reg155[(1'h0):(1'h0)];
    end
  assign wire185 = (8'ha8);
  always
    @(posedge clk) begin
      if (reg142[(2'h2):(1'h0)])
        begin
          reg186 <= reg157[(4'hf):(2'h3)];
          reg187 <= (|{{reg144,
                  ({reg165, reg165} ? {reg170, reg165} : (-wire176))},
              wire185[(3'h4):(2'h2)]});
        end
      else
        begin
          reg186 <= {$unsigned(reg149)};
          reg187 <= reg165[(4'h9):(3'h5)];
          if (reg145)
            begin
              reg188 <= reg149[(4'ha):(3'h5)];
              reg189 <= ((reg153[(1'h0):(1'h0)] & $unsigned(reg153[(2'h2):(2'h2)])) | ({{reg155,
                      (8'hb5)}} > $signed((-(~&reg148)))));
            end
          else
            begin
              reg188 <= (~|$signed((reg154 ?
                  $signed($unsigned((8'haf))) : reg177[(2'h3):(2'h3)])));
            end
        end
      reg190 <= {(8'hbb),
          (-({$signed(wire150)} ?
              reg161[(4'h9):(3'h7)] : ((reg153 >>> reg151) ?
                  $signed(reg166) : {reg181, reg168})))};
    end
  assign wire191 = (($signed($signed((~|reg156))) ?
                       $signed(reg186[(1'h0):(1'h0)]) : $unsigned((~^(reg163 ?
                           reg181 : reg157)))) >= reg168);
  always
    @(posedge clk) begin
      reg192 <= {reg161[(2'h3):(1'h0)],
          ({$signed((&(8'hb7))), $signed(reg155)} > $unsigned(reg168))};
      if (reg149[(4'h8):(4'h8)])
        begin
          reg193 <= $signed(reg146);
        end
      else
        begin
          reg193 <= ($unsigned(reg188[(3'h5):(2'h2)]) | $unsigned({(((8'hb0) ?
                  (8'hba) : reg165) == reg187[(3'h4):(3'h4)]),
              $unsigned(reg167[(4'ha):(1'h1)])}));
          reg194 <= reg154[(4'ha):(3'h7)];
          reg195 <= wire138;
        end
      reg196 <= reg160[(2'h2):(1'h0)];
      if (($signed(wire183[(3'h4):(2'h2)]) <<< (reg163 != (&{(reg143 ?
              wire173 : reg180)}))))
        begin
          if ((!{(|reg190)}))
            begin
              reg197 <= (-reg184);
              reg198 <= {reg147, ($unsigned((reg155 == (+reg154))) >>> reg177)};
              reg199 <= $signed(reg156);
            end
          else
            begin
              reg197 <= {(~^$signed(reg159))};
              reg198 <= reg153[(3'h4):(1'h1)];
              reg199 <= ($signed($unsigned(wire175)) ?
                  (((&((8'hab) ? reg164 : reg182)) >> wire172) ?
                      {$unsigned($signed(reg198)),
                          ($unsigned(reg145) ?
                              {reg148} : $unsigned((8'hb4)))} : reg145[(3'h7):(2'h2)]) : reg187);
            end
          reg200 <= (($unsigned($signed(reg147)) ?
                  (($unsigned((8'hae)) ?
                      $signed(reg178) : $signed((8'haf))) > (~&wire191)) : $unsigned(wire183)) ?
              wire141[(3'h6):(1'h0)] : wire137[(1'h0):(1'h0)]);
          if ({$signed(reg200),
              ((reg200 ?
                  $signed($signed(reg157)) : $unsigned({wire138,
                      reg145})) || reg200)})
            begin
              reg201 <= ((^~reg156) >> (-($signed((wire150 ?
                      reg142 : wire175)) ?
                  $unsigned(reg156) : wire175)));
            end
          else
            begin
              reg201 <= ($signed(reg167[(4'hc):(1'h1)]) ?
                  (+reg165) : $signed((reg174[(1'h0):(1'h0)] ?
                      wire175[(4'hb):(3'h5)] : $signed(reg195))));
            end
        end
      else
        begin
          reg197 <= ((~reg164) ?
              {{reg192},
                  $signed((((8'hb4) == (8'ha0)) ^~ (~|reg156)))} : (!$unsigned($signed(reg182[(3'h4):(1'h1)]))));
          reg198 <= $unsigned($signed((~^$signed(reg153))));
        end
      reg202 <= {wire137[(1'h0):(1'h0)], $unsigned($signed(reg155))};
    end
  assign wire203 = $unsigned(reg192);
  assign wire204 = $signed(reg169[(3'h7):(2'h3)]);
  assign wire205 = ((((reg162[(5'h13):(3'h5)] || (~reg187)) >> {(reg182 | wire138)}) ?
                           reg189 : (($unsigned(reg166) ?
                               $unsigned(wire172) : reg166) == ($signed(reg142) ?
                               $signed(reg161) : (reg166 | (7'h44))))) ?
                       $unsigned((($unsigned(reg142) ?
                               wire140 : (wire176 != reg151)) ?
                           (^(reg142 > wire172)) : (~{wire140,
                               (7'h44)}))) : (~&(wire203 ?
                           reg195 : $unsigned((reg174 ? reg197 : reg167)))));
  assign wire206 = (~((~&(8'hab)) ?
                       $unsigned($unsigned($signed((8'h9e)))) : $unsigned((reg166 ~^ {reg181,
                           reg145}))));
  assign wire207 = (reg163[(2'h3):(1'h1)] == ((((reg167 ? reg180 : reg163) ?
                           reg198 : reg155) ?
                       ($signed(reg196) ?
                           (reg168 ^ (8'hab)) : {(7'h44)}) : reg167) ^ $unsigned($unsigned($signed((8'hb9))))));
endmodule

module module103  (y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire107;
  input wire signed [(5'h15):(1'h0)] wire106;
  input wire signed [(5'h10):(1'h0)] wire105;
  input wire signed [(3'h4):(1'h0)] wire104;
  wire signed [(4'ha):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire127;
  wire [(4'hf):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire110;
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire110,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg109,
                 reg108,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg108 <= ((&$unsigned($unsigned((+(8'haf))))) ?
          wire105[(3'h7):(2'h3)] : (7'h41));
      reg109 <= $signed($unsigned(wire106[(3'h4):(1'h1)]));
    end
  assign wire110 = (wire106[(4'ha):(3'h7)] * (|$signed(wire106[(4'h9):(1'h1)])));
  always
    @(posedge clk) begin
      reg111 <= wire106;
      reg112 <= ((~&({wire110[(1'h0):(1'h0)], (wire106 ? wire107 : wire104)} ?
          ((wire106 <= reg109) >> (wire110 ?
              wire107 : (8'haa))) : $unsigned(reg108))) >>> ((((reg109 ?
                  reg111 : reg109) ?
              reg108 : (reg109 | wire105)) != $unsigned(reg111[(3'h6):(3'h4)])) ?
          reg109 : $signed($signed(wire107[(1'h1):(1'h1)]))));
      reg113 <= (((reg108 >= $unsigned((wire110 ?
          reg112 : wire104))) & (^reg108)) != ($signed((~{wire110})) ?
          $signed((^~$unsigned(reg111))) : $signed($signed(((8'h9e) > reg108)))));
    end
  always
    @(posedge clk) begin
      reg114 <= $signed($signed(reg112[(1'h1):(1'h1)]));
    end
  assign wire115 = wire107[(4'h9):(4'h8)];
  assign wire116 = $unsigned((~&wire107));
  assign wire117 = ($unsigned(wire110[(1'h0):(1'h0)]) ^ ((($unsigned((8'had)) <= {(8'h9c)}) ?
                           $signed(reg114[(1'h0):(1'h0)]) : {wire106,
                               (^reg108)}) ?
                       {(wire116[(3'h4):(1'h1)] | $signed(reg109)),
                           $unsigned((reg108 ?
                               reg114 : reg113))} : $unsigned($unsigned((reg112 == reg113)))));
  assign wire118 = (((~^($unsigned(wire115) != (~reg111))) ?
                           $unsigned((|wire117[(2'h3):(2'h3)])) : ((8'hb9) ?
                               {$signed(reg111)} : ((^~wire104) ?
                                   (reg112 | (8'hb9)) : (wire117 < wire104)))) ?
                       (+{reg113[(1'h1):(1'h1)],
                           wire106[(3'h4):(1'h0)]}) : reg108);
  assign wire119 = (wire116[(4'h8):(3'h4)] ?
                       wire110 : (-wire116[(4'h9):(3'h7)]));
  always
    @(posedge clk) begin
      reg120 <= $unsigned(wire118);
      reg121 <= {({$signed(reg114),
              {$unsigned(wire119),
                  wire117}} | $unsigned(wire115[(1'h1):(1'h0)]))};
      reg122 <= ((^~reg113) > (reg109[(5'h10):(4'hd)] <<< wire110));
      reg123 <= (8'hbc);
    end
  assign wire124 = (reg123[(2'h2):(1'h0)] == (+reg111));
  assign wire125 = wire107;
  assign wire126 = reg111[(2'h2):(1'h1)];
  assign wire127 = wire117[(3'h4):(2'h2)];
  assign wire128 = reg111[(2'h3):(2'h3)];
endmodule
