module top
#(parameter param84 = {((({(8'h9d)} ? {(8'ha1), (8'h9f)} : ((8'hb8) * (8'haf))) ^ (8'hb2)) ? (((~|(8'hb5)) ? (+(8'had)) : (~(8'ha4))) * (((7'h43) ? (8'ha1) : (7'h41)) ? ((8'hae) + (8'hb3)) : {(8'ha0), (8'hbc)})) : {{(^(8'hbb))}, ((~^(8'hb8)) ? (~(8'hb7)) : (-(8'ha7)))}), ((^(((8'hb5) >= (8'h9c)) ? ((8'ha7) - (8'hac)) : ((8'ha8) < (8'hbe)))) ? (((~&(7'h41)) ? ((8'h9f) << (8'had)) : ((8'ha8) * (8'hb0))) >> (^~((7'h42) != (8'ha8)))) : ({((8'hac) ? (8'hbd) : (8'hbc))} ? (((8'ha1) ? (8'ha0) : (8'hb7)) ? (7'h44) : ((7'h40) || (8'hb6))) : (|{(8'hab), (8'ha9)})))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire76;
  assign y = {wire83, wire82, wire81, wire80, wire79, wire78, wire76, (1'h0)};
  module5 #() modinst77 (wire76, clk, wire4, wire3, wire2, wire1, wire0);
  assign wire78 = $unsigned(wire2[(3'h6):(3'h4)]);
  assign wire79 = (wire4[(4'ha):(1'h1)] != $unsigned((~(wire1 ?
                      wire1 : wire78))));
  assign wire80 = ({($signed($signed((8'hbf))) != (8'ha4))} - (|((+wire3) != ($signed(wire1) && $unsigned(wire78)))));
  assign wire81 = ($unsigned((+((wire79 && wire0) ?
                          wire1 : (wire2 ^ (7'h44))))) ?
                      wire76 : wire4[(3'h5):(3'h5)]);
  assign wire82 = wire79[(3'h7):(1'h1)];
  assign wire83 = (8'h9c);
endmodule

module module5
#(parameter param74 = ((((((8'hbf) == (8'ha7)) ? (-(8'ha3)) : {(8'hba), (8'hb4)}) ? {{(8'hae), (8'h9c)}} : (((8'ha7) ? (8'hb2) : (8'hb9)) && {(8'hbc), (8'hb0)})) << {(~^((8'hb9) ? (8'hb5) : (8'hae)))}) ? ((~&({(8'ha1), (8'hb8)} ? ((8'hae) ? (8'haf) : (7'h44)) : (8'hbd))) ? ((((7'h44) ? (8'haa) : (8'ha9)) ? ((8'ha2) ? (8'hbf) : (8'ha9)) : ((8'hb7) * (7'h41))) ? (((8'hac) ? (8'hb5) : (8'hb0)) | ((7'h43) ^~ (8'ha3))) : (&((8'ha0) ? (8'h9c) : (8'ha8)))) : (!(~&((8'ha4) ? (8'hb4) : (8'hb9))))) : ((((+(8'h9f)) && ((8'hb3) ? (7'h41) : (8'hb7))) ~^ ((~&(8'h9e)) ? ((8'hb4) ? (8'hbe) : (8'hab)) : ((8'h9f) ? (8'hb7) : (8'hb7)))) ? (!({(8'hae)} ~^ ((7'h43) ? (8'h9c) : (8'hab)))) : {{((8'hb8) >= (8'hbb))}})), 
parameter param75 = {(((-(param74 == param74)) >>> ({param74, param74} << (~|param74))) ? param74 : param74)})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire70,
                 wire69,
                 wire68,
                 wire64,
                 wire62,
                 wire29,
                 wire28,
                 wire22,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg71,
                 reg67,
                 reg66,
                 reg65,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  assign wire11 = $unsigned(wire7);
  assign wire12 = (~&$signed($unsigned(((wire11 * wire9) | {wire10, wire8}))));
  assign wire13 = (wire12[(2'h3):(2'h2)] | wire9);
  assign wire14 = $signed($signed((-wire9[(5'h11):(5'h10)])));
  assign wire15 = $unsigned($signed(((8'hbc) ?
                      $unsigned($unsigned((8'ha1))) : (|wire11[(4'ha):(4'h8)]))));
  always
    @(posedge clk) begin
      reg16 <= ((8'ha2) ?
          wire6[(4'h9):(4'h9)] : ($unsigned(($signed(wire8) && {wire11})) ?
              wire10[(4'hc):(4'hb)] : {$signed($unsigned(wire13)), wire7}));
      reg17 <= (~^$unsigned(wire10));
      reg18 <= $signed(wire15);
    end
  always
    @(posedge clk) begin
      reg19 <= $unsigned($unsigned((wire6[(5'h11):(5'h10)] & (8'hae))));
      reg20 <= reg16;
      reg21 <= reg18[(4'hc):(4'h8)];
    end
  assign wire22 = wire13[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg23 <= (!wire13);
      reg24 <= $unsigned($signed(reg20[(1'h1):(1'h1)]));
      reg25 <= wire7[(4'ha):(1'h0)];
      reg26 <= $unsigned((~^wire8[(4'hc):(3'h4)]));
      reg27 <= ((reg20 != wire11[(4'ha):(3'h4)]) ?
          $unsigned(wire6[(4'ha):(3'h6)]) : (wire22 + $unsigned((reg16[(5'h10):(4'hb)] * $unsigned((8'ha9))))));
    end
  assign wire28 = wire12;
  assign wire29 = (8'hb0);
  module30 #() modinst63 (.wire31(wire22), .wire35(wire11), .wire34(wire14), .wire32(reg19), .clk(clk), .y(wire62), .wire33(wire9));
  assign wire64 = ($signed($signed((&((8'ha8) - reg16)))) >>> reg17);
  always
    @(posedge clk) begin
      reg65 <= {wire10[(4'hc):(3'h6)]};
      reg66 <= (($signed(reg16[(4'he):(1'h1)]) ?
              {$signed((!wire6)),
                  $unsigned(reg27[(3'h5):(3'h4)])} : reg17[(2'h2):(2'h2)]) ?
          ((8'hb6) ?
              $signed(({wire62} ?
                  (wire14 ?
                      reg27 : (8'ha8)) : $signed(reg21))) : (wire62[(4'hb):(4'h9)] ?
                  (wire12[(2'h2):(1'h0)] <<< (reg18 ?
                      wire28 : (8'hac))) : ($signed(wire64) ^ ((8'h9e) ?
                      (8'hbd) : (8'ha6))))) : reg24);
      reg67 <= ($signed((($signed((8'had)) >= (wire8 < reg23)) && reg16[(1'h0):(1'h0)])) ^~ (~^reg24));
    end
  assign wire68 = (wire15[(4'ha):(1'h0)] ?
                      {$unsigned((wire64 ? wire62[(4'hb):(4'h9)] : wire9)),
                          $signed((-((8'hbf) | wire62)))} : (($unsigned((^wire15)) ?
                          $signed({reg24,
                              wire29}) : (reg66[(3'h5):(1'h1)] <= wire12[(1'h0):(1'h0)])) == {reg67,
                          ({(7'h41)} | $signed(wire9))}));
  assign wire69 = $signed(($unsigned((wire13 + (reg24 ?
                      wire10 : wire64))) <= {wire9, (8'hb0)}));
  assign wire70 = reg16[(4'he):(2'h3)];
  always
    @(posedge clk) begin
      reg71 <= reg67[(4'h9):(2'h2)];
    end
  assign wire72 = wire62[(2'h2):(1'h1)];
  assign wire73 = $unsigned(wire29);
endmodule

module module30
#(parameter param60 = {(({((8'hb3) ? (8'h9e) : (8'h9d))} != ((|(8'hb3)) != {(8'hb4)})) ? (+(8'ha5)) : ((((8'h9f) ? (8'hbe) : (8'ha9)) ? (8'hba) : ((8'hbc) ? (8'ha5) : (8'hb5))) & (-((8'ha4) == (7'h40))))), (({((8'ha7) ^~ (8'hbf))} * ((~&(7'h42)) ? (~^(8'hbe)) : (+(7'h42)))) && (~&(((8'h9e) ^~ (8'ha3)) ? (~(8'hb0)) : (~&(7'h40)))))}, 
parameter param61 = (~|{(((param60 ? param60 : param60) ~^ (param60 ~^ param60)) >>> ((param60 ? param60 : param60) ? (param60 + param60) : {param60, param60}))}))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire35;
  input wire [(5'h11):(1'h0)] wire34;
  input wire signed [(5'h12):(1'h0)] wire33;
  input wire [(4'h9):(1'h0)] wire32;
  input wire [(3'h6):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire36;
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  assign y = {wire59,
                 wire44,
                 wire43,
                 wire39,
                 wire36,
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
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire36 = (+wire33);
  always
    @(posedge clk) begin
      reg37 <= (~($signed(wire34) ^ wire31[(3'h6):(2'h3)]));
      reg38 <= $signed($unsigned($unsigned(wire35)));
    end
  assign wire39 = reg38[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg40 <= wire39;
      reg41 <= wire33[(2'h2):(1'h0)];
      reg42 <= (~&(-({(~|wire31)} + {((8'hba) & reg40), (8'hbd)})));
    end
  assign wire43 = $signed((^(((~reg41) ?
                          reg42[(2'h3):(2'h2)] : $signed(wire36)) ?
                      reg37[(1'h0):(1'h0)] : wire39[(3'h6):(2'h2)])));
  assign wire44 = wire36;
  always
    @(posedge clk) begin
      if (wire44)
        begin
          if ($signed(reg41[(4'h9):(2'h2)]))
            begin
              reg45 <= $unsigned($signed((^($signed(wire33) ?
                  (wire33 ? wire43 : wire31) : (~|wire36)))));
              reg46 <= ($signed(reg38[(3'h4):(3'h4)]) ?
                  {$unsigned(($signed((8'hb6)) ?
                          reg42[(3'h6):(1'h1)] : reg37))} : $unsigned(reg42[(2'h2):(1'h0)]));
              reg47 <= ({(~(((8'haf) ? reg38 : (8'ha8)) ?
                      ((7'h41) ^~ wire39) : (wire36 ^~ wire34)))} && (~(!(~&wire35))));
              reg48 <= wire34[(2'h2):(2'h2)];
            end
          else
            begin
              reg45 <= reg45;
              reg46 <= wire35;
              reg47 <= ($signed($signed($unsigned(wire31[(2'h2):(1'h0)]))) ?
                  $unsigned((reg37 >= wire39)) : reg40);
              reg48 <= wire44;
            end
          reg49 <= (((^((~^reg37) ?
              (!(8'hac)) : ((8'hbd) ?
                  wire32 : wire43))) + $unsigned($signed((wire35 ^~ (8'hbd))))) * (({$unsigned(reg38)} ?
                  wire34 : reg47[(1'h0):(1'h0)]) ?
              (8'ha8) : (^reg48)));
          reg50 <= ((~({((8'ha8) - wire31),
                  $signed(wire36)} < ($signed(wire44) ?
                  $signed(reg47) : (reg42 * (8'ha0))))) ?
              ((^~reg48[(2'h2):(1'h0)]) || {$unsigned((reg45 ? reg45 : reg38)),
                  ((+reg47) ?
                      (wire31 < reg45) : $signed(wire31))}) : (reg47[(4'h9):(2'h3)] >= (&$unsigned((~|reg37)))));
          reg51 <= ({wire34[(4'hf):(4'hf)], reg50} ?
              (~&wire31) : $signed(reg50[(4'hc):(3'h4)]));
          if ($unsigned($signed($signed({reg37[(1'h0):(1'h0)]}))))
            begin
              reg52 <= wire33;
              reg53 <= (^~({($signed(reg47) - (reg51 ~^ reg41)),
                  $unsigned((wire35 ?
                      (8'ha0) : wire32))} > (wire32[(4'h9):(2'h3)] ?
                  $unsigned((reg42 ? wire44 : reg48)) : (wire43 ?
                      reg48 : ((8'hbd) ^~ reg42)))));
              reg54 <= ($signed((+(~^$signed(reg40)))) << (!((wire32[(2'h3):(2'h3)] ^~ {wire32,
                  reg42}) | ((reg45 - reg53) ?
                  $unsigned(wire34) : reg47[(2'h3):(1'h1)]))));
              reg55 <= (-((+$signed((-wire33))) & (8'hac)));
              reg56 <= ((^~$unsigned(reg40)) ?
                  (~$signed((reg47 ?
                      reg55[(1'h1):(1'h0)] : (~reg53)))) : reg49[(1'h1):(1'h1)]);
            end
          else
            begin
              reg52 <= ($unsigned(wire31[(3'h5):(2'h2)]) == ($unsigned({(~^wire44)}) ?
                  wire44[(2'h2):(2'h2)] : (^$unsigned($signed(wire35)))));
            end
        end
      else
        begin
          reg45 <= reg45;
          if ($unsigned((8'hab)))
            begin
              reg46 <= reg40[(1'h1):(1'h0)];
              reg47 <= $unsigned((($signed((^wire34)) ?
                      reg42[(3'h4):(1'h0)] : {((8'hbf) * wire31)}) ?
                  (((wire34 ? (8'hac) : reg52) ?
                      reg54 : (wire32 | wire39)) <<< ($unsigned(reg51) ?
                      (~^reg37) : wire43)) : $unsigned($signed((reg40 | reg50)))));
            end
          else
            begin
              reg46 <= reg46;
              reg47 <= {(8'ha5),
                  {$unsigned($unsigned($unsigned(wire43))),
                      ($signed(reg47) - wire44)}};
              reg48 <= $unsigned($unsigned({reg48[(3'h4):(2'h2)]}));
            end
          reg49 <= ($unsigned($unsigned($unsigned($signed(reg40)))) ?
              wire36[(1'h1):(1'h0)] : wire43[(3'h5):(2'h3)]);
          reg50 <= (reg53[(4'hd):(1'h0)] & $signed((((~&(8'hac)) <<< (reg48 ?
              wire43 : wire32)) || reg55[(1'h0):(1'h0)])));
        end
      reg57 <= ($signed({$unsigned((reg47 ? (7'h40) : (8'hbc))),
          (+(~^reg54))}) >>> $signed(wire33[(2'h3):(2'h3)]));
      reg58 <= {(^wire44)};
    end
  assign wire59 = ((~^$unsigned((wire39 ? (+wire34) : $signed(reg55)))) ?
                      $unsigned(wire33[(4'h9):(3'h7)]) : ($signed($unsigned(wire32[(1'h0):(1'h0)])) << (~|(~^(reg42 ?
                          reg38 : wire32)))));
endmodule
