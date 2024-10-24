module top #(parameter param116 = (8'haa)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire22;
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire103,
                 wire25,
                 wire24,
                 wire22,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  module4 #() modinst23 (.wire8(wire3), .wire7(wire1), .wire9(wire0), .wire6(wire2), .clk(clk), .y(wire22), .wire5((8'hb6)));
  assign wire24 = $unsigned($signed((((wire2 ?
                      wire1 : wire2) || (wire1 - wire1)) >= wire3[(4'h9):(3'h5)])));
  assign wire25 = (~(&$unsigned($unsigned(wire0))));
  module26 #() modinst104 (wire103, clk, wire1, wire25, wire3, wire22);
  always
    @(posedge clk) begin
      reg105 <= wire24[(4'hc):(4'hb)];
      reg106 <= $signed(($unsigned({$unsigned(wire2)}) ?
          wire25[(3'h7):(3'h6)] : (~|((wire0 + wire1) << (wire22 || (8'hb0))))));
      reg107 <= ($unsigned((($unsigned(wire3) == (wire25 || (8'h9e))) ?
          ($signed(wire0) * (wire103 != wire24)) : {wire3,
              $unsigned(reg105)})) ~^ {$unsigned(reg106),
          $unsigned((~&(wire22 <<< wire24)))});
      reg108 <= ($signed(({$unsigned(wire22)} & ($unsigned(wire0) == wire2))) || (((((8'h9f) ?
                      reg107 : wire3) ?
                  (wire0 ? reg106 : wire1) : {reg105}) ?
              ((wire0 ? wire0 : wire0) ~^ ((8'hae) ?
                  reg106 : wire3)) : (&wire25[(4'he):(4'hb)])) ?
          (&(^(wire25 ?
              (8'h9d) : reg106))) : {($signed(wire3) * wire103[(2'h2):(1'h0)])}));
    end
  assign wire109 = (((wire22 ?
                           $unsigned((wire22 >> reg108)) : ($signed(reg108) && wire103)) | $signed(($unsigned(reg108) ?
                           (~^wire22) : wire2[(3'h6):(2'h3)]))) ?
                       wire0 : ((wire103[(3'h4):(1'h1)] == $unsigned($unsigned(wire24))) == $unsigned(wire2)));
  assign wire110 = (($signed({$signed(wire103)}) * $unsigned(wire0[(1'h1):(1'h0)])) ?
                       $unsigned(wire103) : (~&wire109));
  assign wire111 = $unsigned((wire22[(3'h4):(3'h4)] * ({$unsigned(wire109),
                       wire22[(4'hd):(1'h0)]} * (8'h9d))));
  module26 #() modinst113 (.wire28(wire22), .clk(clk), .wire29(reg108), .wire30(reg107), .y(wire112), .wire27(wire110));
  assign wire114 = (wire110[(1'h0):(1'h0)] ?
                       $unsigned((^{(~wire109)})) : $unsigned(((8'h9c) ?
                           $signed((~&(8'h9d))) : $unsigned((wire110 + (8'hb9))))));
  assign wire115 = (wire109[(2'h2):(1'h0)] <<< ($signed($unsigned($signed(wire24))) ?
                       (!(&(!wire111))) : wire2));
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire30;
  input wire [(4'ha):(1'h0)] wire29;
  input wire signed [(5'h10):(1'h0)] wire28;
  input wire [(5'h12):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(4'h8):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire32,
                 wire31,
                 (1'h0)};
  assign wire31 = $unsigned((|($unsigned(wire28) ?
                      $unsigned($signed((8'h9f))) : {wire27})));
  assign wire32 = $unsigned((^~$signed(wire31)));
  module33 #() modinst55 (.wire34(wire29), .clk(clk), .wire37(wire32), .y(wire54), .wire35(wire31), .wire36(wire28));
  assign wire56 = wire27[(3'h4):(3'h4)];
  assign wire57 = wire28[(3'h4):(1'h0)];
  assign wire58 = $unsigned(wire30);
  assign wire59 = wire58;
  assign wire60 = wire57[(2'h3):(1'h0)];
  assign wire61 = $signed((!$unsigned($unsigned((|wire56)))));
  module62 #() modinst80 (wire79, clk, wire30, wire54, wire56, wire27);
  assign wire81 = $unsigned(wire59[(2'h3):(2'h3)]);
  assign wire82 = (($unsigned(($signed(wire81) << (wire27 ? wire61 : wire79))) ?
                          (((~&wire30) > ((8'ha1) ? wire60 : wire79)) ?
                              (wire31[(5'h13):(4'hd)] ?
                                  wire54[(3'h4):(2'h3)] : (|wire61)) : $unsigned(wire28)) : $unsigned((~^wire27[(4'he):(4'hc)]))) ?
                      (|($unsigned((8'haa)) >> {(-wire57),
                          (wire56 ? wire27 : wire32)})) : {wire32});
  assign wire83 = wire28;
  module84 #() modinst96 (wire95, clk, wire30, wire61, wire81, wire56);
  assign wire97 = $unsigned((&(~^wire29)));
  assign wire98 = wire97;
  assign wire99 = wire60;
  assign wire100 = (({wire98[(1'h1):(1'h1)],
                       $signed($unsigned(wire31))} != ($signed(wire59[(4'h8):(4'h8)]) << $unsigned((wire32 ?
                       (8'hae) : wire58)))) == (~^(wire32 ?
                       ($signed(wire61) >= wire58[(4'hf):(4'hc)]) : wire56)));
  assign wire101 = wire31[(4'hc):(2'h3)];
  assign wire102 = $unsigned(wire32[(4'hb):(4'h9)]);
endmodule

module module4
#(parameter param21 = (({(~^(-(7'h40))), (~^(+(8'ha7)))} >= {({(8'haf), (8'hb2)} ? (-(7'h44)) : ((8'hb2) ^~ (8'hb1))), (((8'hb4) ^~ (8'ha6)) <= {(7'h43), (8'hb3)})}) ? {({((7'h40) ? (7'h44) : (8'hbb))} * (^~((8'hbe) ? (8'haf) : (8'ha3)))), (-((&(7'h44)) < ((8'hb4) ? (8'hba) : (8'hb0))))} : (&(8'haf))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  input wire signed [(4'hf):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire13;
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire13,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= (wire8 ?
          $unsigned(((8'haa) >= ((wire9 ?
              wire8 : (8'hbf)) <<< (8'hb2)))) : {$unsigned($signed((wire8 << wire9))),
              wire7});
      reg11 <= (8'hbc);
      reg12 <= $signed($unsigned((!(8'hb9))));
    end
  assign wire13 = ((wire6[(3'h6):(3'h6)] > ({$signed(wire5)} ?
                          wire8 : (wire5 << reg12[(2'h2):(1'h1)]))) ?
                      $signed(reg11) : (~&(!{$unsigned(wire9),
                          (wire5 <= reg11)})));
  always
    @(posedge clk) begin
      reg14 <= $signed(wire13[(1'h1):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg15 <= ($unsigned(((wire9 & reg14[(2'h2):(1'h0)]) ? reg11 : (8'ha3))) ?
          (&$unsigned((reg12 ?
              $unsigned(reg11) : (wire7 << reg11)))) : $signed($unsigned($unsigned(wire8[(2'h3):(2'h2)]))));
    end
  assign wire16 = {reg15[(3'h5):(1'h0)]};
  assign wire17 = reg10;
  assign wire18 = (^((((reg15 ? (8'h9f) : (8'ha5)) | {wire8}) * (((7'h43) ?
                          wire8 : wire7) ~^ ((8'ha4) ? wire5 : (8'hac)))) ?
                      (!(reg11 > (wire5 ?
                          wire13 : (8'hb1)))) : $unsigned(({reg10} ?
                          (wire16 ? wire16 : wire16) : wire5))));
  assign wire19 = (^~(wire17[(2'h3):(2'h3)] > $signed($signed((8'hb3)))));
  assign wire20 = $signed(reg14[(3'h4):(1'h0)]);
endmodule

module module84
#(parameter param93 = (~(((((8'ha6) ? (8'hb4) : (8'ha2)) ? ((8'hae) & (8'h9f)) : (^~(8'hb5))) ? (((8'hb6) << (8'ha0)) - ((8'ha6) > (7'h44))) : (((8'hb4) ? (8'ha7) : (8'ha7)) ? ((7'h41) ? (8'hbe) : (8'hb5)) : ((8'hae) == (8'h9d)))) ? (((8'ha4) ? (~&(8'ha3)) : ((8'h9c) > (8'ha4))) ^~ (!((8'ha2) <= (8'hb4)))) : (-(~^((8'h9e) ? (8'hb8) : (8'ha0)))))), 
parameter param94 = param93)
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire88;
  input wire signed [(5'h13):(1'h0)] wire87;
  input wire [(2'h2):(1'h0)] wire86;
  input wire [(3'h4):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  assign y = {wire92, wire91, wire90, wire89, (1'h0)};
  assign wire89 = $signed($unsigned(($unsigned($signed((8'ha5))) >>> (8'hb8))));
  assign wire90 = (+$signed((wire88 ? wire85[(3'h4):(2'h2)] : wire87)));
  assign wire91 = ((wire86 ^ $signed(((~(8'hb6)) ?
                      $signed(wire88) : wire88[(2'h3):(2'h3)]))) != wire88);
  assign wire92 = (wire91 <<< (wire91 >>> $signed(wire87[(4'hd):(2'h2)])));
endmodule

module module62  (y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire66;
  input wire signed [(3'h4):(1'h0)] wire65;
  input wire [(3'h6):(1'h0)] wire64;
  input wire [(3'h5):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  assign y = {wire78,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg77,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg67 <= $unsigned($unsigned(wire63[(1'h0):(1'h0)]));
      reg68 <= ((reg67 ? {wire65} : wire66) && {$unsigned(reg67),
          (reg67[(2'h2):(1'h1)] | (8'ha8))});
      reg69 <= wire65[(2'h3):(2'h3)];
      reg70 <= wire64;
      reg71 <= {(wire64 ?
              (((~&(8'ha3)) ?
                  $signed((7'h40)) : (wire64 ~^ (8'ha3))) < (-(~&reg67))) : $signed((|((8'had) - wire63))))};
    end
  assign wire72 = (^~wire66);
  assign wire73 = ({reg71[(2'h2):(1'h0)]} ?
                      (~&(($signed(wire63) ?
                          (7'h43) : (reg67 - reg68)) * reg71[(2'h2):(1'h0)])) : $unsigned({(~(wire66 ?
                              (8'hbd) : wire72)),
                          {{reg69, (8'hba)}, wire66[(1'h0):(1'h0)]}}));
  assign wire74 = (^({(wire65 ? reg67 : (wire64 <= wire66)),
                      wire65} - (~^$signed($signed(wire73)))));
  assign wire75 = ((!$unsigned((reg70 != wire73[(3'h7):(3'h5)]))) ?
                      ($signed(($unsigned(wire65) ?
                              (reg71 ? wire65 : reg70) : {wire72})) ?
                          (wire74[(4'h9):(3'h7)] ?
                              ((8'hab) - $signed(wire65)) : {(|wire73),
                                  (reg70 ?
                                      reg69 : wire73)}) : reg68) : reg69[(4'h9):(3'h4)]);
  assign wire76 = ({$signed(wire73[(3'h4):(2'h3)]),
                      (($unsigned(reg67) ?
                          $unsigned(wire64) : {reg67,
                              wire73}) || (reg70[(2'h2):(1'h1)] + wire64))} == (-reg68));
  always
    @(posedge clk) begin
      reg77 <= (~^wire66);
    end
  assign wire78 = $signed(reg69[(1'h1):(1'h0)]);
endmodule

module module33
#(parameter param53 = (((((!(8'ha8)) ? ((8'hbf) ? (8'hbc) : (8'haf)) : (~&(8'hb6))) || {((8'hb9) ? (8'hba) : (8'hae)), ((8'haa) ? (8'hb2) : (8'haa))}) >>> {((~(8'haf)) ? ((8'hb8) <= (8'hbb)) : (~^(8'hbc))), (((7'h41) < (8'hbb)) && ((8'haa) ^~ (8'hb9)))}) & {(((!(8'hb0)) <<< {(7'h43), (8'hb7)}) ? (((8'hbf) ^~ (8'ha2)) ? (~(8'hb3)) : ((8'hbb) != (7'h40))) : (+(7'h42)))}))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire37;
  input wire signed [(5'h10):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire35;
  input wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  assign y = {wire48,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire38 = $signed(wire34[(1'h1):(1'h1)]);
  assign wire39 = ((|(((^~wire37) ? (wire38 == wire36) : wire37) ?
                          ((^~(8'ha9)) ?
                              ((8'ha8) >> wire38) : (~wire36)) : (8'ha8))) ?
                      (^$unsigned((|(wire37 << wire34)))) : (^~wire36[(2'h2):(1'h0)]));
  assign wire40 = ({$unsigned($unsigned((wire34 ?
                          wire35 : wire39)))} * (wire34[(2'h2):(1'h1)] - $unsigned((wire37 ?
                      $unsigned(wire39) : $unsigned((7'h44))))));
  assign wire41 = {$unsigned(wire36),
                      $unsigned(($signed((8'ha9)) ?
                          ($unsigned(wire34) == (-(8'hac))) : (wire35[(5'h10):(4'hd)] ^~ wire34[(2'h2):(1'h1)])))};
  assign wire42 = $signed({$unsigned(wire40)});
  assign wire43 = wire34[(2'h2):(1'h0)];
  assign wire44 = wire42[(2'h3):(2'h3)];
  assign wire45 = ($unsigned($unsigned($signed($signed(wire35)))) == wire41);
  assign wire46 = ({$signed(((~wire35) ?
                              $unsigned(wire43) : $unsigned(wire37)))} ?
                      wire39 : (((!(-wire38)) || $unsigned(wire42[(3'h5):(2'h3)])) ?
                          wire39 : $signed(wire42[(3'h4):(3'h4)])));
  assign wire47 = $unsigned($signed($unsigned($signed(wire39[(1'h1):(1'h1)]))));
  assign wire48 = {$unsigned((wire40 ?
                          ((wire43 & wire34) - wire44[(4'h8):(1'h0)]) : ((wire42 ?
                              wire39 : wire39) >> wire43[(1'h1):(1'h0)]))),
                      (wire47 ? (wire43 <<< (~&wire37)) : wire44)};
  always
    @(posedge clk) begin
      if ($signed(wire39))
        begin
          if (wire47[(1'h0):(1'h0)])
            begin
              reg49 <= $unsigned($unsigned($unsigned(((^wire36) ^~ wire45))));
              reg50 <= $signed($signed($signed((~&(~|wire38)))));
            end
          else
            begin
              reg49 <= (+$signed((&$unsigned({wire39, wire47}))));
            end
          reg51 <= wire43[(2'h3):(1'h1)];
        end
      else
        begin
          reg49 <= {$unsigned($signed((wire35 <= wire39[(3'h6):(2'h3)])))};
          reg50 <= $unsigned((8'h9c));
        end
      reg52 <= $signed((-($signed(wire37) ?
          {(wire47 & wire35)} : (!{wire43, wire45}))));
    end
endmodule
