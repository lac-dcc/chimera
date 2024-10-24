module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire121;
  wire signed [(4'ha):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire117;
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire117,
                 (1'h0)};
  assign wire4 = $signed({(wire3 ^ $signed((8'hb0)))});
  assign wire5 = $unsigned(($signed(wire3[(2'h2):(2'h2)]) ?
                     wire0[(3'h5):(1'h1)] : $signed($unsigned((^~wire4)))));
  assign wire6 = $unsigned($signed(((wire1[(2'h3):(2'h3)] == {wire0}) >= ((wire1 ?
                         wire0 : wire3) ?
                     $unsigned(wire3) : wire2))));
  assign wire7 = wire6;
  module8 #() modinst118 (.wire12(wire7), .y(wire117), .wire10(wire6), .wire11(wire4), .clk(clk), .wire9(wire0), .wire13(wire3));
  assign wire119 = ($signed($signed(wire5[(2'h3):(1'h0)])) <= wire1);
  assign wire120 = wire7;
  assign wire121 = wire0;
endmodule

module module8
#(parameter param115 = (^(((8'h9f) ? {((8'ha7) ? (8'had) : (8'hba)), (8'h9e)} : (&((8'ha2) * (7'h42)))) ? (((^(7'h44)) ~^ ((8'hba) >= (8'hab))) * ((!(8'ha4)) ? (~(7'h41)) : (+(8'ha3)))) : (&({(8'ha5), (8'ha8)} ? (8'ha2) : ((8'haf) || (8'ha9)))))), 
parameter param116 = (&({((param115 | param115) == (&(8'ha9)))} ? (((param115 - param115) ? (~&param115) : (-(8'h9c))) ^~ (param115 ? (param115 < param115) : (param115 ^ (8'ha1)))) : (param115 >>> param115))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(3'h5):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire111,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire15,
                 wire14,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire14 = $unsigned(wire9);
  assign wire15 = ($signed($signed(((~^wire11) ?
                          wire12 : wire14[(2'h3):(1'h1)]))) ?
                      (|$unsigned(wire14)) : (+$unsigned(((wire12 <<< wire11) ?
                          $signed(wire11) : ((8'hbf) * wire10)))));
  always
    @(posedge clk) begin
      reg16 <= wire10;
      reg17 <= $signed(wire13[(1'h1):(1'h0)]);
      if ((wire11 ^~ $signed(($signed({wire15, wire14}) ^ (~(+wire11))))))
        begin
          reg18 <= reg17[(1'h1):(1'h0)];
          if ($signed($signed(reg16[(3'h6):(3'h6)])))
            begin
              reg19 <= wire10;
              reg20 <= {wire9, (8'haf)};
            end
          else
            begin
              reg19 <= {$signed(($signed((wire14 | wire10)) ?
                      (((8'h9d) ? wire14 : wire15) ?
                          (reg20 || reg16) : (wire9 ?
                              reg18 : reg19)) : (((8'h9f) ?
                          (8'hb5) : wire9) > wire12[(3'h7):(2'h3)])))};
              reg20 <= wire14;
              reg21 <= reg18;
              reg22 <= ({reg19} ^ (^reg19));
              reg23 <= (~wire12[(1'h1):(1'h1)]);
            end
          reg24 <= $unsigned(reg20);
        end
      else
        begin
          reg18 <= (+{($signed((8'hb9)) ?
                  reg23[(3'h5):(1'h0)] : ((|(8'h9d)) ?
                      wire12 : $signed((8'hb1))))});
          if ({(^~$signed(($signed(reg23) ?
                  $signed(wire10) : (wire10 ? reg23 : wire13))))})
            begin
              reg19 <= (8'ha4);
              reg20 <= wire15[(3'h4):(2'h3)];
              reg21 <= (reg24[(4'hd):(1'h0)] ? reg24 : $unsigned((|wire10)));
              reg22 <= ($signed($signed(((wire13 >> wire14) ?
                  (wire12 >> wire14) : (~^wire12)))) || {$signed(reg21[(2'h2):(1'h1)]),
                  $unsigned($signed(((7'h40) & reg18)))});
            end
          else
            begin
              reg19 <= reg17[(1'h1):(1'h0)];
              reg20 <= $unsigned($signed((8'hb1)));
              reg21 <= ($unsigned(($unsigned(wire15[(2'h3):(2'h2)]) ?
                  {{reg23,
                          reg16}} : ((wire15 == wire12) >> reg24))) <<< wire11[(4'h8):(3'h5)]);
              reg22 <= ($signed($unsigned((+(wire9 ? reg16 : (7'h43))))) ?
                  $signed($signed($signed((~^reg19)))) : (wire12[(2'h3):(2'h3)] ?
                      (~^reg24[(4'h8):(3'h4)]) : {$unsigned({reg17, reg24}),
                          (|(^(8'haf)))}));
              reg23 <= wire15;
            end
        end
      reg25 <= (~&(^~(((-reg20) > (8'ha7)) == {{reg16, reg24},
          $unsigned(reg22)})));
      reg26 <= $unsigned($unsigned($unsigned((+(reg17 ? reg16 : reg20)))));
    end
  module27 #() modinst54 (.clk(clk), .y(wire53), .wire28(wire13), .wire32(wire12), .wire31(reg24), .wire29(reg25), .wire30(reg22));
  assign wire55 = ((($signed((reg18 ^~ reg18)) + reg22[(4'hd):(3'h7)]) ?
                          (($unsigned(reg26) ? $signed(reg23) : (!wire12)) ?
                              $signed(wire12) : $signed((+reg17))) : ($unsigned($unsigned(reg26)) || $unsigned((reg24 != (8'hb5))))) ?
                      $unsigned({$signed($unsigned(reg23)),
                          (((7'h40) << wire11) ?
                              reg25[(5'h10):(4'hf)] : (!wire10))}) : (~{wire15[(1'h1):(1'h1)]}));
  assign wire56 = {$unsigned($signed($signed((reg25 < (8'ha2))))), reg22};
  assign wire57 = ((8'ha0) ? $signed((8'had)) : wire10);
  assign wire58 = wire15[(2'h3):(2'h3)];
  module59 #() modinst112 (wire111, clk, reg18, wire58, reg26, wire9);
  assign wire113 = ($unsigned({(8'hb7)}) < $signed(((((8'hb4) ?
                       wire14 : reg16) || (+wire111)) ~^ $unsigned({reg18,
                       reg23}))));
  assign wire114 = wire57[(2'h3):(2'h3)];
endmodule

module module59
#(parameter param109 = ({(-({(8'h9f)} ? ((8'hbe) ? (8'ha8) : (7'h44)) : (~(8'hb7)))), ((8'hbe) ? (((8'hb4) ? (7'h42) : (7'h44)) <<< ((8'ha9) < (8'hbe))) : {((7'h42) - (8'h9d)), ((8'hae) && (8'h9c))})} ? ((((8'hae) ? ((7'h41) >= (8'ha1)) : {(8'had), (8'hb8)}) | {(~^(8'hbe)), {(8'ha7), (8'hbd)}}) != (&(((8'ha7) + (8'had)) ? (+(8'h9d)) : (&(8'haa))))) : ((~&(!((8'hb8) ? (8'hb7) : (8'haf)))) != (^{((8'ha0) ^~ (8'hb8))}))), 
parameter param110 = (({param109, ((~&param109) ? (param109 ? param109 : param109) : (param109 ? param109 : param109))} ? ((param109 || {(8'hbe)}) != (param109 && (param109 ? param109 : param109))) : (&((param109 ? param109 : param109) ^~ param109))) ? {((param109 ? (param109 ? (8'hb8) : param109) : {param109, (8'h9d)}) || (~(param109 == (8'hae)))), param109} : ((((param109 ? param109 : (8'had)) ~^ ((8'hab) > param109)) * param109) + ((8'hab) ? (~(param109 ? param109 : param109)) : ((&param109) - (8'hbd))))))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire63;
  input wire signed [(3'h6):(1'h0)] wire62;
  input wire [(5'h13):(1'h0)] wire61;
  input wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(3'h4):(1'h0)] wire68;
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire99,
                 wire98,
                 wire97,
                 wire92,
                 wire68,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg64 <= ((!wire62[(3'h4):(1'h0)]) ? wire62[(1'h0):(1'h0)] : (8'ha1));
      reg65 <= (7'h40);
      reg66 <= $unsigned(($unsigned({reg64, wire60[(1'h1):(1'h0)]}) ^ reg65));
      reg67 <= (8'hbe);
    end
  assign wire68 = ((($unsigned((reg66 ?
                      wire62 : (8'ha6))) <= ($unsigned((8'ha3)) ~^ (wire61 ?
                      wire61 : wire63))) && $unsigned({wire62})) > $signed(reg65));
  always
    @(posedge clk) begin
      if ($unsigned((!wire63)))
        begin
          reg69 <= (^~(^((-(~reg66)) ? wire63[(1'h1):(1'h0)] : wire62)));
          reg70 <= ($unsigned(((wire63[(2'h2):(1'h0)] & wire62) ?
              ($signed(reg64) * (reg64 ^ reg64)) : reg67)) + $signed($unsigned($signed(reg65[(3'h5):(3'h5)]))));
          if (reg66)
            begin
              reg71 <= wire61;
              reg72 <= reg70[(4'h9):(4'h9)];
              reg73 <= (wire63[(1'h0):(1'h0)] ?
                  ((~&$unsigned((~^reg69))) ?
                      $unsigned((-(+(8'ha8)))) : $unsigned($unsigned($signed(reg67)))) : $signed(wire62));
              reg74 <= $signed(reg64[(1'h1):(1'h0)]);
              reg75 <= (reg72[(4'h8):(1'h0)] >= (~$unsigned(($unsigned(wire60) != $unsigned(wire63)))));
            end
          else
            begin
              reg71 <= $signed((~|reg70[(4'h9):(2'h2)]));
              reg72 <= (($signed(reg67) ?
                      $unsigned((((8'h9f) < reg72) << $signed(reg71))) : ((|$signed(wire61)) & (^$unsigned(wire68)))) ?
                  reg64[(1'h1):(1'h0)] : $signed($signed($signed($signed(reg67)))));
              reg73 <= ((&(reg66[(2'h2):(1'h1)] ?
                      ((wire63 < (8'hbd)) & (reg67 ?
                          (8'h9e) : (8'hb9))) : (~^{reg64, reg72}))) ?
                  reg73 : reg72[(5'h11):(3'h6)]);
              reg74 <= (^$signed($signed($signed(wire60))));
            end
          if (reg73)
            begin
              reg76 <= (wire60 + ($unsigned((~&(~wire63))) & ($signed((&(8'haf))) ?
                  $unsigned({reg66,
                      reg74}) : (wire63[(1'h0):(1'h0)] + reg67[(3'h7):(2'h2)]))));
              reg77 <= $unsigned((^~$unsigned((!reg71[(3'h7):(3'h7)]))));
              reg78 <= wire61[(5'h10):(3'h6)];
              reg79 <= (reg77 <<< {((|((8'hb6) || reg77)) ?
                      {(^wire62), {wire61}} : (|reg66))});
              reg80 <= ($signed($unsigned((reg72[(5'h13):(1'h0)] >= (wire60 ?
                  wire60 : reg72)))) & ($unsigned($signed({(8'haa)})) ?
                  $unsigned($signed($signed(reg67))) : ((reg65 << $unsigned(reg65)) ?
                      {{wire63, (8'hba)}} : (~|(reg78 ? reg71 : reg74)))));
            end
          else
            begin
              reg76 <= {wire63[(2'h2):(1'h1)]};
            end
          reg81 <= (|(reg72[(4'he):(3'h4)] ^~ {reg64, $signed({reg66})}));
        end
      else
        begin
          reg69 <= ($unsigned($signed(wire62)) <<< $signed({(+$signed((8'ha8)))}));
          reg70 <= {$unsigned(wire61[(4'hd):(4'hd)])};
          reg71 <= wire61[(5'h11):(3'h5)];
        end
      reg82 <= $signed((((-(~^reg72)) ?
              ($unsigned(reg81) ~^ reg64) : (!$unsigned(reg70))) ?
          reg74 : reg74[(2'h3):(2'h2)]));
      reg83 <= $unsigned(wire68);
      if ($unsigned(wire63[(1'h0):(1'h0)]))
        begin
          reg84 <= ((({$signed(wire68), wire61[(3'h5):(3'h4)]} ?
              ((reg79 ?
                  wire68 : reg69) < (^~reg82)) : reg65[(2'h2):(2'h2)]) || (^~wire60)) ^ ((($signed(reg74) * reg76[(1'h0):(1'h0)]) || {$unsigned(wire60),
              (&reg69)}) > reg64[(1'h0):(1'h0)]));
          if ((8'had))
            begin
              reg85 <= $signed((-$unsigned(reg76)));
              reg86 <= reg74;
              reg87 <= reg66[(4'h9):(3'h5)];
              reg88 <= ((~^($signed(reg80) + $signed((~^reg65)))) ?
                  ($signed($signed((!(8'hac)))) >= $unsigned(reg87[(3'h5):(2'h3)])) : {{(+wire63[(2'h3):(2'h2)]),
                          (reg75 >> $unsigned(reg76))}});
            end
          else
            begin
              reg85 <= reg70;
              reg86 <= (wire63[(2'h3):(2'h3)] ?
                  reg84[(3'h5):(2'h2)] : $unsigned(($unsigned(((8'ha4) << reg75)) < ((wire60 ?
                          reg84 : reg81) ?
                      $signed((8'ha6)) : $signed(reg87)))));
            end
          if ({({$unsigned({reg73}),
                  $signed(wire62)} >>> (&(reg73 - $signed((8'hb1))))),
              {(~^(&(reg65 >= reg85)))}})
            begin
              reg89 <= $signed($signed(reg81));
              reg90 <= (~reg67[(4'hb):(2'h2)]);
            end
          else
            begin
              reg89 <= $unsigned(((~^reg64[(1'h1):(1'h0)]) ?
                  (8'hbc) : (-reg85[(4'h9):(3'h7)])));
              reg90 <= wire62[(2'h2):(1'h1)];
              reg91 <= wire62[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg84 <= reg71;
          reg85 <= $unsigned($unsigned($signed($signed((~|reg64)))));
          reg86 <= reg69[(4'h8):(3'h5)];
          reg87 <= {{(8'ha3), (^~$signed($signed(reg67)))}};
          if (reg69[(4'hb):(2'h2)])
            begin
              reg88 <= reg64[(1'h1):(1'h1)];
            end
          else
            begin
              reg88 <= wire60[(3'h4):(1'h1)];
              reg89 <= ((reg65 ?
                      ((~^((8'hbe) != reg89)) && $unsigned((&reg87))) : (reg86 ~^ wire63)) ?
                  $unsigned({((~^wire68) ~^ {reg70})}) : $signed(reg74));
              reg90 <= (|((|$signed((reg69 ?
                  reg87 : reg64))) >> {(~^{reg85})}));
              reg91 <= $unsigned(($unsigned({(~^reg74)}) || ($unsigned($unsigned(wire63)) ?
                  reg76[(2'h2):(2'h2)] : (reg78[(2'h3):(1'h1)] >>> reg71))));
            end
        end
    end
  assign wire92 = ((reg81 || {$signed((reg64 ^~ (8'hab)))}) ? reg76 : reg82);
  always
    @(posedge clk) begin
      reg93 <= reg84;
      reg94 <= $signed(($unsigned($signed((&reg66))) >= (|reg81[(4'h8):(3'h7)])));
      reg95 <= reg79[(4'h9):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg96 <= wire60;
    end
  assign wire97 = {$unsigned((|(~&$signed(wire92))))};
  assign wire98 = reg90[(1'h1):(1'h1)];
  assign wire99 = ((((reg81[(2'h3):(1'h1)] ^~ (reg71 ?
                              reg72 : (8'hb5))) <= ($signed(reg75) ?
                              (reg82 ? (8'ha1) : reg82) : $unsigned(reg67))) ?
                          (&({wire92} + {reg77,
                              wire61})) : ($unsigned($signed(reg73)) == reg67[(4'hc):(2'h2)])) ?
                      {((&$signed(reg77)) ^~ (!reg67[(4'h8):(1'h0)]))} : (8'ha5));
  always
    @(posedge clk) begin
      reg100 <= reg76[(1'h0):(1'h0)];
      reg101 <= {reg91[(5'h14):(3'h7)]};
      reg102 <= $signed($signed(reg101));
      reg103 <= {(!reg67[(3'h5):(1'h0)])};
    end
  always
    @(posedge clk) begin
      reg104 <= (8'hbd);
    end
  assign wire105 = $unsigned((($unsigned(((8'hae) & (8'hab))) ?
                           $unsigned(wire98) : reg66) ?
                       $signed(reg80) : (((|reg78) >> (^reg103)) ^~ $unsigned((reg78 == (7'h42))))));
  assign wire106 = (^~reg69);
  assign wire107 = reg77;
  assign wire108 = (!reg70[(3'h7):(3'h5)]);
endmodule

module module27
#(parameter param52 = (((~&{((8'ha8) & (8'ha4)), (~|(8'hb2))}) + (((+(7'h41)) << ((8'hb6) ? (8'hbd) : (8'hba))) ? ((~&(8'hb1)) ~^ ((8'hb9) != (8'hae))) : ((&(8'had)) > {(7'h43), (8'hb1)}))) ? ((~^{{(8'hb5), (8'hb2)}, {(8'ha0)}}) < ((-((8'hb1) > (8'ha6))) ? (((8'hb8) ? (8'hb5) : (8'hab)) || ((8'hb1) ? (8'hab) : (8'ha5))) : (!(^(8'ha4))))) : (8'hb0)))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire32;
  input wire signed [(2'h3):(1'h0)] wire31;
  input wire signed [(3'h7):(1'h0)] wire30;
  input wire [(3'h5):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire34,
                 wire33,
                 reg51,
                 reg50,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire33 = wire28[(2'h2):(1'h1)];
  assign wire34 = $signed($signed(wire33[(4'h8):(1'h0)]));
  always
    @(posedge clk) begin
      reg35 <= ((wire31[(2'h3):(2'h3)] | wire33) ?
          (wire32 && (wire32[(4'ha):(4'ha)] >> $unsigned($unsigned(wire28)))) : $unsigned(wire34));
      reg36 <= (!((((~&wire32) >>> (wire30 ?
              (8'h9f) : wire32)) ~^ $unsigned(reg35)) ?
          (|wire31[(2'h2):(1'h1)]) : reg35[(3'h4):(3'h4)]));
    end
  assign wire37 = (wire29 < wire31[(1'h0):(1'h0)]);
  assign wire38 = wire31;
  assign wire39 = wire33[(2'h2):(1'h1)];
  assign wire40 = ((8'hbb) ?
                      ($signed(wire33[(4'h8):(3'h6)]) ?
                          (~wire28[(2'h3):(2'h2)]) : wire31) : $signed((!{$unsigned(wire31),
                          $unsigned(wire33)})));
  assign wire41 = wire29;
  assign wire42 = wire37;
  assign wire43 = ($unsigned(($signed($unsigned(wire40)) ?
                          {(wire31 || wire29)} : $signed($unsigned(wire34)))) ?
                      ((&(wire39 ?
                          (wire41 ?
                              wire41 : reg36) : reg35[(2'h2):(1'h0)])) >= $unsigned(($unsigned((7'h41)) ?
                          wire33 : $signed(wire39)))) : wire42);
  assign wire44 = (($signed(wire42) < {wire31[(1'h0):(1'h0)], (8'ha3)}) ?
                      (wire41[(2'h2):(1'h0)] <= $unsigned($unsigned(((7'h41) ?
                          wire31 : wire31)))) : $unsigned({(&wire28)}));
  assign wire45 = (wire37[(3'h7):(1'h1)] ?
                      $signed((wire30[(3'h7):(1'h0)] > $unsigned((~&wire44)))) : ((-$unsigned(reg35[(3'h5):(2'h2)])) * $signed($unsigned((wire40 ?
                          (8'hb1) : wire28)))));
  assign wire46 = (+($unsigned((~^(wire32 + wire41))) > wire37[(2'h2):(2'h2)]));
  assign wire47 = (^$signed($unsigned(wire41[(1'h1):(1'h1)])));
  assign wire48 = ($unsigned((($unsigned(wire37) <<< {(8'hbb)}) ?
                          wire30[(2'h3):(2'h2)] : $unsigned($signed((8'hb5))))) ?
                      ((((!(7'h40)) ? (wire38 | wire39) : {reg35, wire38}) ?
                              {(&wire39),
                                  (reg35 ^~ wire33)} : $unsigned(wire37)) ?
                          $unsigned(wire32) : (($unsigned(wire34) ?
                                  wire31 : reg35) ?
                              wire44[(2'h2):(2'h2)] : wire38)) : (+$signed($unsigned($signed(wire46)))));
  assign wire49 = {$unsigned(wire37[(4'h9):(3'h6)]),
                      $unsigned($signed(wire46))};
  always
    @(posedge clk) begin
      reg50 <= {{wire32}};
      reg51 <= wire43;
    end
endmodule
