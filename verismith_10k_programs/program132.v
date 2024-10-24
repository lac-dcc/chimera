module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire95;
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire12,
                 wire95,
                 reg11,
                 (1'h0)};
  assign wire5 = wire0[(5'h12):(3'h6)];
  assign wire6 = (&(((^~wire4) ?
                         wire0[(4'hf):(4'h8)] : (wire3 ?
                             (wire4 ? wire3 : wire5) : $signed(wire5))) ?
                     wire1[(2'h3):(1'h0)] : wire1));
  assign wire7 = wire6;
  assign wire8 = $signed({wire5[(2'h2):(2'h2)]});
  assign wire9 = $signed((^~($signed(wire7[(3'h5):(1'h0)]) >= (8'hb1))));
  assign wire10 = $unsigned(wire1);
  always
    @(posedge clk) begin
      reg11 <= (|(~|wire7[(3'h4):(2'h3)]));
    end
  assign wire12 = wire1[(1'h0):(1'h0)];
  module13 #() modinst96 (.wire14(wire9), .clk(clk), .wire18(wire10), .wire16(wire12), .wire17(wire4), .y(wire95), .wire15(wire5));
endmodule

module module13
#(parameter param93 = {{(&(^~((7'h40) ? (8'hab) : (8'haa))))}, {{((~|(8'hb8)) ? {(8'h9d), (8'hb4)} : {(8'ha2), (8'ha3)}), (!{(8'hac)})}, (({(8'haf)} >= ((8'h9d) ? (8'h9e) : (8'hb2))) << (!(^~(8'ha1))))}}, 
parameter param94 = (((~&((-param93) ? (param93 ? (8'hbb) : param93) : {(8'hbd)})) ? (param93 ? param93 : param93) : param93) || param93))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire [(4'hd):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire42,
                 wire40,
                 wire21,
                 wire20,
                 wire19,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = (-(~^$unsigned(((wire16 ? wire15 : wire17) ?
                      (wire16 >= wire14) : (wire16 == wire18)))));
  assign wire20 = (((((!wire17) | wire19) * wire16) ?
                          ({(wire14 || wire19),
                              (wire14 ?
                                  (8'ha4) : wire17)} * {wire18[(2'h2):(1'h1)],
                              wire14}) : {((wire15 ? wire15 : wire14) ?
                                  (8'hb2) : (~|wire14)),
                              ($signed((8'h9d)) | {(8'had)})}) ?
                      (wire19 ?
                          (!({wire17, wire19} ?
                              (wire14 != wire17) : (wire19 ?
                                  wire16 : wire17))) : wire15) : wire17);
  assign wire21 = (8'ha1);
  always
    @(posedge clk) begin
      reg22 <= wire18;
      if ($unsigned(reg22))
        begin
          if (($unsigned((+(~|$unsigned((7'h43))))) << wire18[(4'h9):(1'h0)]))
            begin
              reg23 <= wire21;
              reg24 <= (~wire18[(4'he):(2'h3)]);
              reg25 <= reg23[(3'h5):(3'h5)];
            end
          else
            begin
              reg23 <= ((!$signed(wire20[(1'h1):(1'h1)])) ?
                  (~^reg23[(3'h4):(2'h2)]) : $signed((~({wire14, wire18} ?
                      $signed(wire15) : {reg24}))));
              reg24 <= (wire15[(1'h1):(1'h1)] ?
                  (+reg24) : (($signed((reg22 ?
                      wire18 : (8'ha2))) < $signed((^reg24))) > (wire18 ?
                      wire15[(3'h5):(2'h3)] : ((reg24 ? wire21 : wire18) ?
                          $unsigned(reg25) : wire19))));
              reg25 <= $signed({$signed(wire19[(2'h3):(2'h2)]),
                  ($signed($unsigned((8'ha6))) * {reg25[(5'h11):(3'h6)]})});
              reg26 <= ((wire19[(1'h0):(1'h0)] & {($unsigned(wire20) ?
                      (reg24 ^~ (8'hb4)) : (~^(8'hbc)))}) != (!{(~|wire21),
                  (~(&wire15))}));
            end
          reg27 <= (reg23 != reg26);
        end
      else
        begin
          reg23 <= $unsigned((~|{wire17}));
        end
    end
  module28 #() modinst41 (.wire30(reg25), .wire31(wire15), .wire29(reg27), .clk(clk), .y(wire40), .wire32(wire14));
  assign wire42 = ((wire20 ?
                      (reg23 ?
                          ((!wire20) > {(8'ha2)}) : {(reg27 & (8'hba))}) : ($signed((7'h41)) >= reg26)) >>> wire20);
  module43 #() modinst89 (.wire47(wire19), .wire45(reg25), .wire46(reg23), .y(wire88), .clk(clk), .wire44(wire21));
  assign wire90 = wire88[(5'h12):(3'h5)];
  assign wire91 = ({reg25} ?
                      (|wire15[(4'hb):(3'h6)]) : ({({wire90,
                              wire21} >> (8'hae))} | (wire88 == $signed(wire17))));
  assign wire92 = (~&(8'ha4));
endmodule

module module43
#(parameter param87 = ((~|((((8'haa) + (7'h43)) ? (~^(8'ha1)) : (&(8'hac))) ? (((8'hb0) ~^ (7'h44)) ? ((8'ha6) ? (8'ha0) : (8'hb8)) : ((8'haa) ? (8'ha2) : (8'ha7))) : ((^~(8'h9d)) != ((7'h42) >= (7'h43))))) ~^ ((8'had) << {(((7'h41) * (8'hb9)) << (~^(7'h44))), (((8'hbe) ? (8'ha4) : (8'ha3)) && ((8'hab) <<< (8'hb9)))})))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire signed [(5'h10):(1'h0)] wire46;
  input wire [(5'h11):(1'h0)] wire45;
  input wire signed [(3'h4):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire48;
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire48,
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
                 reg61,
                 reg60,
                 reg59,
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
                 (1'h0)};
  assign wire48 = $signed($unsigned((wire47 >= wire46[(4'hf):(1'h1)])));
  always
    @(posedge clk) begin
      reg49 <= $signed(wire44[(1'h0):(1'h0)]);
      if ((&wire44))
        begin
          reg50 <= wire47;
          reg51 <= {((-{(wire45 > reg50),
                  $unsigned(wire45)}) <<< wire44[(1'h1):(1'h0)])};
        end
      else
        begin
          if ($signed((~&$signed(($signed(wire45) ^~ (wire45 >= wire48))))))
            begin
              reg50 <= $signed($signed($signed($unsigned((^~(8'hb1))))));
              reg51 <= $signed(reg49[(2'h3):(2'h3)]);
              reg52 <= ((reg49[(3'h4):(2'h3)] < ($signed($unsigned(reg50)) ?
                  wire46[(3'h7):(2'h3)] : wire44)) | {(wire45 ?
                      $signed((wire47 ?
                          wire46 : reg50)) : $unsigned(((8'hbc) ~^ wire47))),
                  (wire45 && ((&wire46) - wire46[(4'h8):(2'h2)]))});
              reg53 <= $signed({(((reg52 ? wire45 : wire48) ?
                          (+(8'ha7)) : $signed(reg51)) ?
                      $unsigned((reg49 <= wire46)) : $signed({wire48})),
                  $unsigned((~^$signed(wire47)))});
            end
          else
            begin
              reg50 <= (+reg49);
              reg51 <= $signed($signed((reg52 ? reg52 : reg50[(2'h2):(2'h2)])));
              reg52 <= {wire47[(4'h9):(3'h7)]};
            end
          reg54 <= $unsigned(((8'hbc) <<< (~^wire45)));
          reg55 <= ($unsigned((~$signed(reg51[(4'h9):(2'h3)]))) ?
              ((~^wire48[(4'he):(4'ha)]) ?
                  reg51 : (reg49[(3'h6):(1'h1)] ?
                      $signed(wire44[(2'h2):(2'h2)]) : ({reg49} >>> (~reg53)))) : $signed((8'hb1)));
          if (reg55)
            begin
              reg56 <= wire48[(2'h3):(1'h0)];
              reg57 <= $signed(wire47);
              reg58 <= (^reg57);
              reg59 <= reg50;
            end
          else
            begin
              reg56 <= $unsigned(((&($signed(reg51) < $signed(reg54))) ?
                  {reg54} : wire46));
              reg57 <= ((8'ha2) ?
                  {((!reg54[(1'h0):(1'h0)]) ?
                          $unsigned((wire48 - reg50)) : reg55[(1'h0):(1'h0)]),
                      $signed((|{wire48, (8'hb7)}))} : reg52[(3'h4):(3'h4)]);
              reg58 <= $unsigned(({{(&reg51), reg51}, (~{(8'h9d)})} ?
                  wire45[(3'h7):(3'h6)] : ($unsigned(((8'ha5) >= reg54)) <<< reg56[(4'h8):(3'h7)])));
            end
          reg60 <= (reg52 ? reg58 : wire47[(2'h3):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg61 <= $signed($unsigned(reg54));
    end
  assign wire62 = $signed((!(~reg50[(1'h0):(1'h0)])));
  assign wire63 = reg61;
  assign wire64 = $unsigned(reg53);
  assign wire65 = (~(reg50[(3'h7):(1'h0)] ?
                      $signed($unsigned($signed(reg61))) : wire47[(1'h1):(1'h0)]));
  assign wire66 = ((|wire45[(3'h4):(3'h4)]) && reg54);
  assign wire67 = $unsigned(reg59[(4'h8):(3'h7)]);
  assign wire68 = $unsigned(((reg55 ?
                      reg60 : (((8'haa) ? (8'h9c) : wire64) ?
                          (~^wire62) : (~|reg50))) && $signed((!wire63[(4'hd):(3'h7)]))));
  assign wire69 = ((((~reg54) <<< reg56) && (&wire67[(1'h1):(1'h0)])) ?
                      $signed($signed($signed((wire63 ?
                          (8'hab) : wire47)))) : wire63[(2'h2):(1'h0)]);
  assign wire70 = $unsigned(wire66[(1'h0):(1'h0)]);
  assign wire71 = wire65;
  always
    @(posedge clk) begin
      reg72 <= (reg58 >= $signed((wire71 ? {reg50} : $unsigned((&wire69)))));
      if ((8'hac))
        begin
          reg73 <= $unsigned($unsigned((~^($signed(reg54) ?
              $unsigned(wire62) : (^reg49)))));
          reg74 <= ($signed({wire48}) ^~ reg54[(1'h0):(1'h0)]);
          reg75 <= $unsigned($signed({(reg51 >> $unsigned(wire46))}));
          if ((~|$signed(({{wire66, wire44}, (reg75 ? wire71 : wire69)} ?
              reg51[(4'h8):(2'h2)] : ({reg58, wire48} ?
                  reg57[(2'h3):(1'h1)] : (^reg72))))))
            begin
              reg76 <= ($signed(($unsigned(reg60[(2'h3):(1'h0)]) & (8'h9d))) + $unsigned((~(reg55[(1'h0):(1'h0)] <<< $unsigned(wire47)))));
              reg77 <= wire48;
              reg78 <= $unsigned({reg77[(1'h0):(1'h0)]});
              reg79 <= reg75;
              reg80 <= (((($unsigned(reg58) == (wire69 ^ wire46)) ?
                      $signed((reg72 ?
                          wire69 : reg74)) : $unsigned((~&reg74))) ?
                  {wire71} : reg78) <<< $unsigned(wire44));
            end
          else
            begin
              reg76 <= (~((((~&reg72) ?
                      {(8'haf)} : $signed(wire67)) ^ $signed(reg61[(4'ha):(3'h6)])) ?
                  $unsigned(wire71[(4'hd):(3'h6)]) : wire48[(1'h0):(1'h0)]));
              reg77 <= reg79[(2'h2):(1'h1)];
              reg78 <= $unsigned(reg74);
              reg79 <= (wire47 << $unsigned($unsigned((reg80[(1'h0):(1'h0)] != $signed(reg50)))));
              reg80 <= (reg72 ?
                  $unsigned((&reg50[(3'h4):(1'h0)])) : (&$signed(reg78[(3'h4):(1'h0)])));
            end
          reg81 <= reg51;
        end
      else
        begin
          reg73 <= (^~(^~($unsigned($signed(wire62)) ?
              ((reg77 ? wire63 : wire69) ?
                  {reg80, reg75} : (wire64 ? reg74 : wire47)) : ((wire63 ?
                      (8'h9e) : (7'h40)) ?
                  (^~reg54) : (^~wire47)))));
          if (({(reg72[(2'h2):(1'h1)] >> (-(reg75 ?
                  reg54 : reg55)))} >= {((^((8'haa) ?
                  wire44 : reg78)) <<< $signed($signed(reg81)))}))
            begin
              reg74 <= $unsigned($signed(reg55[(1'h0):(1'h0)]));
            end
          else
            begin
              reg74 <= ($signed(wire44) + reg79[(4'hf):(3'h5)]);
              reg75 <= ($unsigned(reg59) ?
                  (($signed((reg54 | wire45)) ?
                      (^$unsigned(reg79)) : $signed($signed(reg54))) & (~reg73[(3'h6):(3'h6)])) : (wire67[(1'h0):(1'h0)] & reg51[(3'h6):(1'h1)]));
            end
          reg76 <= (($signed(((!reg49) ~^ ((8'had) ? reg52 : wire48))) ?
              $unsigned(reg51) : $signed(({reg56} ?
                  (wire63 - reg77) : $unsigned(reg50)))) << ((((reg60 || reg73) >> reg78[(2'h2):(2'h2)]) < $signed($signed(wire67))) ~^ $signed($unsigned((~(8'ha7))))));
          reg77 <= $unsigned($unsigned(reg59));
          reg78 <= wire64;
        end
      reg82 <= $unsigned((8'hb4));
    end
  assign wire83 = reg76[(2'h2):(1'h0)];
  assign wire84 = $signed({({wire44[(2'h2):(2'h2)]} ?
                          (~&(&reg78)) : (|(reg82 >>> reg58))),
                      (reg58 + $signed((|wire83)))});
  assign wire85 = $signed(wire83[(5'h11):(5'h10)]);
  assign wire86 = ({{wire67}, (~^reg81[(1'h1):(1'h0)])} ?
                      $signed({$unsigned((wire63 ?
                              (8'h9f) : wire84))}) : (|(!$unsigned(reg57[(3'h4):(3'h4)]))));
endmodule

module module28
#(parameter param38 = ((({(~|(8'hb1))} ? (~((7'h40) ? (8'hb3) : (8'ha4))) : ((~(8'h9f)) ? ((7'h43) ? (8'h9e) : (8'hbe)) : (+(8'hb5)))) ~^ ((-(8'hbd)) ? (((8'hbf) ? (8'hb8) : (8'ha0)) ? {(8'hb7)} : ((8'hb9) << (7'h44))) : (8'hbc))) ? (((+((8'hbd) >>> (8'hb5))) ? ({(8'hb6), (8'ha8)} ? ((8'hb1) ? (8'hac) : (8'hb7)) : (7'h42)) : ((~(8'hac)) * ((8'h9d) & (8'hb9)))) ? (|(((8'ha6) + (8'h9c)) * ((8'hbb) * (8'hae)))) : (((^~(8'h9f)) ? (|(8'hae)) : (&(8'hbd))) - ((&(8'hb2)) ? (|(8'h9e)) : (~^(8'hae))))) : {((^~((8'ha9) + (7'h41))) << (-((8'ha3) ? (7'h40) : (8'hb1))))}), 
parameter param39 = (|(param38 ? {{(~^(8'ha1)), (param38 <= param38)}} : ({(param38 ? param38 : param38), (+param38)} ? (8'hac) : (8'h9d)))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire32;
  input wire [(3'h4):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  assign y = {wire37, wire36, wire35, wire34, wire33, (1'h0)};
  assign wire33 = wire31;
  assign wire34 = (+$unsigned(wire32));
  assign wire35 = $unsigned($unsigned({(wire29 ? {wire34} : {wire30, wire29}),
                      ((wire31 != wire29) ^ $signed((7'h43)))}));
  assign wire36 = (~$unsigned($unsigned(wire34[(5'h10):(4'h9)])));
  assign wire37 = wire35[(2'h3):(2'h3)];
endmodule
