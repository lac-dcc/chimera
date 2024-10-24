module top
#(parameter param83 = (-({(|((8'ha6) || (8'h9d))), (~|((8'ha3) - (8'hb4)))} >>> (8'hb1))), 
parameter param84 = (~(8'ha0)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire70;
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire4,
                 wire5,
                 wire70,
                 (1'h0)};
  assign wire4 = (wire3[(1'h0):(1'h0)] ^~ {$unsigned((&(~&wire3)))});
  assign wire5 = ((wire0[(4'hc):(1'h0)] ?
                     $unsigned(((wire3 ? wire3 : wire3) ?
                         (wire0 ?
                             wire0 : wire4) : (wire3 - wire0))) : wire2) << ($signed(({wire1,
                             wire1} ?
                         (wire1 ? wire4 : (8'hb0)) : {wire0, wire2})) ?
                     wire1 : $signed($unsigned((!wire3)))));
  module6 #() modinst71 (.y(wire70), .wire10(wire0), .wire11(wire3), .clk(clk), .wire9(wire2), .wire7(wire4), .wire8(wire5));
  assign wire72 = $unsigned(($unsigned(($signed((7'h40)) ~^ (&wire1))) ?
                      $unsigned((&(wire0 && wire5))) : $unsigned(((-wire0) ?
                          {(8'ha0)} : (^~wire1)))));
  assign wire73 = (wire0[(5'h11):(4'hd)] ?
                      {($signed($unsigned((8'h9c))) >= $unsigned($unsigned(wire2)))} : ((8'hb8) - {$signed(wire3[(3'h6):(1'h0)]),
                          $signed((^~wire1))}));
  assign wire74 = wire0[(5'h11):(5'h11)];
  assign wire75 = (&wire0);
  assign wire76 = $signed(wire3[(3'h7):(2'h2)]);
  assign wire77 = $unsigned($signed(((~$unsigned(wire0)) ?
                      {$unsigned(wire2), (wire72 ? wire73 : wire0)} : ({wire70,
                          wire70} > (wire70 ? wire4 : wire73)))));
  assign wire78 = (wire5[(4'ha):(4'ha)] == wire70);
  assign wire79 = $unsigned((wire4[(4'hb):(3'h5)] ^ ($signed($signed(wire0)) > wire3)));
  assign wire80 = wire74;
  assign wire81 = (({$signed($unsigned(wire4)),
                      wire1[(4'he):(3'h6)]} - wire75[(5'h10):(4'h9)]) <= ((!wire76) ?
                      (wire1[(4'hb):(3'h5)] >>> $unsigned((^wire76))) : (8'ha1)));
  assign wire82 = wire70;
endmodule

module module6
#(parameter param69 = {(~|(~|((&(8'hbf)) ? (|(8'hb9)) : {(8'haa)}))), (((((8'hb7) <<< (8'h9c)) <= ((8'ha7) ? (8'haa) : (8'ha8))) >> ({(8'had)} ? ((7'h43) < (8'hb0)) : ((8'hb5) << (8'ha6)))) ? ((~(^~(8'ha2))) ? ((8'hbd) || ((8'hb4) + (8'hac))) : ((^~(8'ha9)) ? ((8'ha4) ^~ (8'hb9)) : {(8'hbe), (8'ha2)})) : ((((8'ha3) ? (8'hab) : (8'hac)) ? {(8'h9f)} : ((8'ha6) > (8'hb1))) ~^ (((8'h9e) ? (8'haa) : (8'hae)) >= ((7'h41) - (8'hb2)))))})
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire65;
  assign y = {wire68,
                 wire67,
                 wire28,
                 wire14,
                 wire13,
                 wire12,
                 wire30,
                 wire31,
                 wire65,
                 (1'h0)};
  assign wire12 = $signed((|(^(8'hbd))));
  assign wire13 = ((+wire11) ^~ $signed({$unsigned((wire10 - wire10)),
                      (!(~^wire8))}));
  assign wire14 = $unsigned(wire7);
  module15 #() modinst29 (.wire19(wire12), .clk(clk), .y(wire28), .wire20(wire11), .wire17(wire8), .wire18(wire13), .wire16(wire7));
  assign wire30 = (!(wire13[(3'h7):(3'h7)] <= {wire9[(3'h6):(3'h4)],
                      (|(wire10 | wire7))}));
  assign wire31 = wire7;
  module32 #() modinst66 (wire65, clk, wire14, wire9, wire11, wire10, wire12);
  assign wire67 = wire13;
  assign wire68 = wire13[(2'h3):(1'h1)];
endmodule

module module32
#(parameter param63 = (7'h41), 
parameter param64 = ((+({param63} ? (param63 | ((8'ha4) ? param63 : param63)) : (|(8'ha7)))) ? ({(+(8'hb9)), (~|param63)} ? ({(-param63), (param63 * (7'h43))} ? param63 : ({param63, param63} ? (8'hab) : (param63 < param63))) : (~((+param63) ? (~&param63) : (param63 <= param63)))) : param63))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire37;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire [(5'h12):(1'h0)] wire35;
  input wire signed [(5'h10):(1'h0)] wire34;
  input wire [(3'h6):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
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
                 (1'h0)};
  assign wire38 = (8'haa);
  assign wire39 = wire33;
  assign wire40 = ((~&(~(~(^wire38)))) <<< wire36);
  assign wire41 = $unsigned(($signed($signed($unsigned(wire35))) ?
                      wire35[(3'h7):(3'h5)] : wire39));
  always
    @(posedge clk) begin
      reg42 <= wire37[(2'h2):(1'h0)];
      reg43 <= ((wire34[(5'h10):(3'h6)] * ((^((8'ha3) < wire33)) ?
          $unsigned((wire35 ?
              wire33 : (8'hab))) : wire33[(2'h2):(2'h2)])) < (8'hb6));
      reg44 <= $signed((wire40 ?
          (wire36[(1'h0):(1'h0)] ?
              ($unsigned(wire37) ?
                  $signed(wire37) : ((7'h44) ?
                      wire33 : wire39)) : (~|$unsigned(wire37))) : ((~^((8'hb2) ?
                  wire37 : wire41)) ?
              {$signed(wire34)} : ((wire38 >>> (8'hbf)) ?
                  $signed((8'ha2)) : (+reg43)))));
      reg45 <= {(wire41 - reg43)};
      if ((+reg45))
        begin
          reg46 <= reg45[(1'h0):(1'h0)];
          if ($signed((8'ha9)))
            begin
              reg47 <= reg42;
            end
          else
            begin
              reg47 <= (~|(reg44 ?
                  reg43[(1'h0):(1'h0)] : $signed(wire36[(3'h5):(3'h4)])));
              reg48 <= (8'hbe);
              reg49 <= $unsigned(reg47);
              reg50 <= ($signed($unsigned((8'haf))) & reg47[(4'h9):(3'h6)]);
            end
          if ({((((wire34 ? wire37 : wire36) ?
                      $signed(reg49) : (wire35 != reg49)) ?
                  $signed($unsigned(wire33)) : reg45) * reg43)})
            begin
              reg51 <= (wire41[(2'h3):(1'h0)] > wire35);
              reg52 <= (^(reg45[(2'h2):(1'h0)] ?
                  (+{reg42[(1'h1):(1'h0)]}) : reg49));
              reg53 <= $signed((($unsigned($unsigned(wire41)) ?
                  wire34[(4'hd):(4'hd)] : {(wire41 & wire38)}) <<< (({(8'hae),
                      reg50} ?
                  $unsigned((8'ha2)) : $unsigned(reg46)) != {(wire39 ?
                      wire35 : wire33),
                  ((7'h44) ^ wire37)})));
              reg54 <= reg47[(3'h7):(2'h3)];
              reg55 <= (&(|reg50));
            end
          else
            begin
              reg51 <= $signed((^~reg54));
              reg52 <= reg55;
              reg53 <= ({reg42[(4'ha):(4'ha)], (8'ha5)} != {(|({(8'hae),
                          reg50} ?
                      $signed((8'hb7)) : $unsigned(wire33)))});
              reg54 <= reg53[(3'h4):(2'h3)];
              reg55 <= wire36;
            end
        end
      else
        begin
          reg46 <= (^~($signed(wire41[(2'h2):(1'h1)]) || reg43[(4'h8):(4'h8)]));
          reg47 <= (~^wire37[(1'h0):(1'h0)]);
          reg48 <= $signed(reg46);
          reg49 <= (($unsigned(($unsigned(wire39) + reg52[(1'h1):(1'h0)])) & {wire37[(1'h0):(1'h0)]}) >>> $unsigned((wire39 ?
              (7'h44) : reg47[(4'ha):(3'h7)])));
          reg50 <= (((^~($signed(reg47) ?
              reg50[(4'hf):(2'h2)] : $unsigned(reg48))) < ((reg53 && $signed(reg49)) ?
              (!(8'hb1)) : (^~(-wire37)))) < reg51[(1'h0):(1'h0)]);
        end
    end
  assign wire56 = reg54;
  assign wire57 = wire37[(1'h1):(1'h0)];
  assign wire58 = $signed((8'hbd));
  assign wire59 = {(wire33 <<< (((-reg43) ?
                          (reg54 ?
                              wire56 : reg47) : (reg44 ~^ wire34)) != wire34)),
                      $signed((wire34 ?
                          $unsigned(reg48[(3'h5):(2'h3)]) : (!(+wire39))))};
  assign wire60 = reg52[(1'h1):(1'h0)];
  assign wire61 = ({(($signed(wire59) ?
                                  (wire33 | wire56) : ((8'hb4) && wire60)) ?
                              $signed($unsigned(wire58)) : $unsigned((~reg51))),
                          reg49[(3'h5):(3'h5)]} ?
                      $signed(wire60) : reg55);
  assign wire62 = ($signed(wire35) > (((8'hb1) <= ((reg44 ? reg43 : reg47) ?
                          reg44 : (&wire39))) ?
                      ($unsigned((wire61 && reg47)) <<< ($signed(reg42) ?
                          reg43 : ((8'hba) ?
                              reg55 : wire36))) : $signed(({reg43,
                          wire36} > $signed(reg54)))));
endmodule

module module15
#(parameter param26 = (7'h44), 
parameter param27 = param26)
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire18;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  assign y = {wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = wire20;
  assign wire22 = {wire17, (wire17 > (~$signed((wire21 ? wire21 : wire16))))};
  assign wire23 = $signed(wire19);
  assign wire24 = $signed($unsigned($signed($signed($signed(wire16)))));
  assign wire25 = wire21;
endmodule
