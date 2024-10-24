module top #(parameter param99 = (8'hba)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire95;
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire98, wire97, wire4, wire95, reg5, (1'h0)};
  assign wire4 = {wire1};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire4[(4'hc):(4'h8)]);
    end
  module6 #() modinst96 (.wire8(wire0), .y(wire95), .wire10(reg5), .wire9(wire2), .wire7(wire4), .clk(clk));
  assign wire97 = (~(-(7'h42)));
  assign wire98 = $signed($signed(wire97[(1'h0):(1'h0)]));
endmodule

module module6
#(parameter param93 = ((~(8'hbf)) ? (~({((8'hbb) <= (8'hbc)), (8'haa)} >>> (|(8'ha7)))) : {{(&((8'hb8) ? (8'h9f) : (8'h9d)))}, ((8'hb6) ? (((8'hbf) ? (8'hb9) : (8'h9e)) ? (8'hbd) : ((7'h43) ? (8'hb9) : (8'ha7))) : (+(&(8'hb1))))}), 
parameter param94 = param93)
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire80;
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire11,
                 wire36,
                 wire38,
                 wire39,
                 wire60,
                 wire80,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire11 = $signed($unsigned(($unsigned({wire10}) ?
                      $unsigned($signed((8'h9c))) : wire9)));
  module12 #() modinst37 (wire36, clk, wire9, wire8, wire11, wire10);
  assign wire38 = $unsigned((wire7 < $unsigned($signed(wire10))));
  assign wire39 = $unsigned($unsigned(wire11));
  module40 #() modinst61 (.wire42(wire36), .clk(clk), .wire44(wire11), .wire43(wire10), .y(wire60), .wire41(wire7));
  module62 #() modinst81 (wire80, clk, wire39, wire38, wire36, wire10, wire7);
  assign wire82 = $unsigned((wire60 < $unsigned(wire8[(5'h10):(4'hf)])));
  assign wire83 = (((((~|wire82) ? wire36 : wire9[(3'h7):(3'h4)]) ?
                              ($signed(wire60) || wire38) : (-(!wire9))) ?
                          wire10 : wire36[(4'h9):(2'h2)]) ?
                      (wire9 + (($unsigned(wire80) ?
                              ((8'hb8) ?
                                  wire60 : wire80) : $unsigned((8'h9f))) ?
                          wire9 : (^~wire60))) : wire60);
  assign wire84 = wire83[(1'h0):(1'h0)];
  assign wire85 = $signed($signed((wire7 ? wire11[(5'h11):(4'hf)] : wire10)));
  assign wire86 = (|(~&{((~wire11) ? wire83 : wire38), wire38}));
  assign wire87 = $unsigned(wire9[(4'ha):(4'h8)]);
  always
    @(posedge clk) begin
      reg88 <= {wire8[(5'h14):(3'h7)]};
      reg89 <= ($unsigned(($signed((+wire36)) ?
              (8'hac) : $unsigned(wire11[(3'h7):(3'h4)]))) ?
          ((wire86 >>> $unsigned((wire7 ?
              wire10 : wire10))) - (((wire86 ^ wire11) <= $unsigned(wire36)) ?
              $unsigned((wire84 != (8'h9c))) : $signed($signed(wire60)))) : ($unsigned(wire11[(4'hf):(4'ha)]) > {(((8'hac) ?
                  wire9 : wire11) ~^ (wire86 ? wire11 : wire11)),
              ($unsigned(wire10) ? $unsigned(reg88) : $unsigned(wire86))}));
      reg90 <= (~^{reg88, {wire85[(1'h0):(1'h0)]}});
    end
  assign wire91 = (reg90[(4'he):(3'h5)] <<< ((-((~|wire87) ~^ $signed(wire7))) <<< (-$signed($signed((8'ha3))))));
  assign wire92 = ({wire10[(3'h6):(1'h0)]} ~^ {(|(8'hba)),
                      $unsigned((wire86 ?
                          (wire83 ? (8'hbb) : wire8) : $signed(wire39)))});
endmodule

module module62  (y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire67;
  input wire signed [(3'h7):(1'h0)] wire66;
  input wire [(4'hf):(1'h0)] wire65;
  input wire [(4'he):(1'h0)] wire64;
  input wire signed [(4'ha):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  assign y = {wire79,
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
                 (1'h0)};
  assign wire68 = wire67[(3'h4):(3'h4)];
  assign wire69 = $unsigned(($unsigned(((wire67 ? wire64 : wire63) == (wire67 ?
                      wire63 : wire64))) == ($unsigned((wire68 ^ (8'hb2))) ?
                      wire66[(3'h6):(1'h0)] : ($unsigned(wire63) > $signed(wire67)))));
  assign wire70 = ($unsigned(wire68) >>> wire67);
  assign wire71 = wire64;
  assign wire72 = wire71;
  assign wire73 = wire65;
  assign wire74 = (&(($unsigned((~&(8'h9c))) ?
                      $unsigned((wire66 ?
                          wire70 : wire71)) : (wire67[(3'h4):(2'h3)] != wire72)) ^~ $signed((8'hb4))));
  assign wire75 = (|((~&$signed({(8'h9f), (8'hbd)})) ?
                      {({wire64} >> {wire72}),
                          ($signed(wire74) ?
                              wire74 : (^~wire67))} : (wire65[(3'h7):(3'h7)] << {wire65})));
  assign wire76 = (~|wire65);
  assign wire77 = (wire71 ?
                      {(&($unsigned(wire70) ? (~&wire76) : wire75)),
                          {($unsigned(wire65) << (wire64 ? wire66 : wire66)),
                              $signed((~wire75))}} : $unsigned((-((wire67 ?
                          wire63 : wire76) << $signed(wire67)))));
  assign wire78 = wire68;
  assign wire79 = (~|((($unsigned(wire77) ?
                              $unsigned(wire76) : ((8'hb6) ? wire66 : wire74)) ?
                          (wire65 <= (wire78 ?
                              (8'ha0) : wire74)) : $unsigned($unsigned((8'ha0)))) ?
                      $signed((!wire77)) : wire71));
endmodule

module module40
#(parameter param58 = {{({(^~(8'hb5))} >>> ((-(8'hbe)) >= (~^(8'h9c)))), (!(7'h41))}, (((^((8'ha1) && (7'h43))) ^~ (8'ha6)) ? (({(8'hbe), (8'ha9)} ? ((8'hb4) ? (8'ha6) : (8'hbe)) : ((8'ha2) >>> (8'hb3))) >> (((8'ha7) ? (8'h9d) : (7'h42)) ? (^(7'h41)) : ((8'h9f) <<< (8'haa)))) : ((!(8'hac)) | {((8'h9d) << (8'h9d)), ((8'hbf) ^~ (8'hb3))}))}, 
parameter param59 = ((~|param58) >> (^param58)))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire44;
  input wire [(3'h7):(1'h0)] wire43;
  input wire [(4'hf):(1'h0)] wire42;
  input wire signed [(4'hf):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 reg55,
                 reg54,
                 reg53,
                 reg49,
                 (1'h0)};
  assign wire45 = ($signed($unsigned(wire41[(3'h4):(2'h3)])) << $signed(wire44[(3'h4):(1'h0)]));
  assign wire46 = (^~(+$signed((wire41 > wire41))));
  assign wire47 = wire46[(1'h1):(1'h0)];
  assign wire48 = ($unsigned({$signed((wire42 ? (7'h41) : wire44)),
                      $unsigned($signed(wire45))}) ~^ $signed({((+wire43) + ((8'hb9) ?
                          wire46 : wire43)),
                      {wire41[(1'h1):(1'h0)]}}));
  always
    @(posedge clk) begin
      reg49 <= $signed((+(wire42[(4'ha):(1'h1)] || wire48[(1'h1):(1'h1)])));
    end
  assign wire50 = $unsigned((7'h42));
  assign wire51 = (^~((-($signed(wire41) + $signed((8'h9d)))) >>> $unsigned(((~^wire48) ?
                      $unsigned(wire43) : $signed((8'hb0))))));
  assign wire52 = wire43[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg53 <= $signed(wire43[(3'h4):(1'h0)]);
      reg54 <= (($signed((^~(wire52 ? wire42 : wire51))) ?
              (({wire42} ? {wire42, wire42} : (8'hb1)) ?
                  $signed($signed(wire41)) : $unsigned($signed(reg49))) : $signed(wire48[(1'h1):(1'h1)])) ?
          $signed((8'ha4)) : (($unsigned((wire44 || reg53)) ?
                  (wire46 != ((8'ha4) >> (8'hba))) : wire45[(3'h6):(2'h2)]) ?
              reg49 : $unsigned((~|(~^reg53)))));
      reg55 <= ((wire42 ? reg53[(1'h0):(1'h0)] : wire43) ?
          (^wire45[(3'h7):(3'h5)]) : ({(wire48[(1'h0):(1'h0)] ?
                  (^wire42) : wire51),
              wire45} ^~ $signed((~|wire44[(4'hd):(4'hc)]))));
    end
  assign wire56 = wire47[(3'h5):(2'h2)];
  assign wire57 = ($signed($signed((~&$signed((8'ha2))))) ?
                      ((((wire48 ? wire47 : wire45) >> wire50[(3'h6):(2'h2)]) ?
                              wire44 : $unsigned($unsigned(wire42))) ?
                          $signed($unsigned($unsigned(wire43))) : (~$signed($unsigned(wire56)))) : (reg55 ?
                          ((~&$signed(wire51)) - ($signed(reg54) ^ (reg55 ?
                              reg49 : wire43))) : ((!(~|reg55)) ?
                              ((wire45 ? wire51 : wire46) & {reg49,
                                  reg55}) : ($unsigned(reg53) != (wire46 > reg49)))));
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire17 = (wire16 > wire14[(2'h2):(2'h2)]);
  assign wire18 = $signed(({wire15} ?
                      $signed({$signed(wire15)}) : wire13[(4'ha):(3'h6)]));
  assign wire19 = wire18;
  assign wire20 = $signed({(({(8'hb8)} >= $signed(wire14)) >= wire18[(3'h6):(1'h1)])});
  assign wire21 = $unsigned($unsigned(wire13[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      if (wire19)
        begin
          reg22 <= wire14[(2'h2):(1'h0)];
          if (((($signed($unsigned(wire15)) - $unsigned((wire18 - wire15))) ?
              wire16[(3'h5):(2'h3)] : $signed($signed($signed(wire20)))) <<< $signed($unsigned(wire20[(3'h7):(3'h6)]))))
            begin
              reg23 <= ((wire15 ?
                  (($signed(wire19) >> (!wire15)) ?
                      $signed((reg22 & wire21)) : wire20[(4'hd):(4'hd)]) : {(((8'hbb) ?
                          (8'ha7) : wire17) || wire17[(3'h7):(1'h1)]),
                      $signed((wire16 & wire15))}) >>> wire18[(4'h8):(3'h5)]);
              reg24 <= $signed($signed($signed($unsigned(((8'haa) * (8'haa))))));
              reg25 <= wire20[(4'hb):(4'hb)];
              reg26 <= (~&$signed($signed((&(wire19 >> wire16)))));
              reg27 <= (~^reg22[(2'h3):(2'h3)]);
            end
          else
            begin
              reg23 <= reg25;
              reg24 <= wire20[(3'h4):(1'h1)];
              reg25 <= (|(~|$unsigned(reg23[(3'h4):(1'h0)])));
              reg26 <= {(reg26 && wire20)};
              reg27 <= reg27;
            end
          reg28 <= $signed((reg22 ? wire19 : (reg22[(2'h2):(1'h0)] + wire15)));
        end
      else
        begin
          reg22 <= (-reg23[(2'h3):(1'h0)]);
        end
      reg29 <= (+(|(((wire20 >>> wire19) ?
              (reg27 ? reg27 : wire18) : {(8'hb4), reg27}) ?
          ((&wire20) <= reg27[(3'h6):(3'h5)]) : ((wire13 ~^ reg24) <= (wire19 ?
              (8'ha5) : wire16)))));
    end
  assign wire30 = (~$unsigned((reg23 ?
                      ((reg25 ?
                          wire19 : reg23) > wire17) : (reg27 >>> wire16))));
  assign wire31 = (-{$signed(($signed(wire16) ?
                          $signed(wire19) : wire18[(3'h7):(2'h2)])),
                      ($unsigned($unsigned(reg23)) & ((wire16 ?
                              wire19 : reg27) ?
                          $signed(wire17) : $signed(reg22)))});
  assign wire32 = reg27;
  assign wire33 = $signed($signed($signed($signed(wire15))));
  assign wire34 = $unsigned(reg25);
  assign wire35 = reg29;
endmodule
