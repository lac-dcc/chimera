module top
#(parameter param110 = (~|(^~(-(|((8'hba) ? (8'hb5) : (8'hba)))))), 
parameter param111 = ({param110} ? {((((8'hbd) == param110) ^ (param110 ? param110 : param110)) ~^ param110), (&{{param110, (8'haf)}})} : param110))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire93,
                 wire16,
                 wire15,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg96,
                 reg13,
                 (1'h0)};
  assign wire5 = {wire0,
                     ($signed((!(wire4 == (8'hba)))) + ((8'hac) ?
                         wire4 : (wire3 ? $unsigned(wire1) : (|wire2))))};
  assign wire6 = ($signed((wire1 ~^ wire4[(3'h5):(2'h2)])) ?
                     (&(~&wire1[(1'h1):(1'h0)])) : ((wire3 ?
                             (!{(8'hbf), wire3}) : $unsigned((wire2 ?
                                 (7'h44) : wire0))) ?
                         {(^$signed(wire0)),
                             (8'ha0)} : $signed($signed((wire0 || wire2)))));
  assign wire7 = wire5;
  assign wire8 = {$signed(((!wire3) != (!(^~wire5)))), $signed(wire1)};
  assign wire9 = $signed($unsigned((&((+wire1) == (wire8 ? (8'h9e) : wire0)))));
  assign wire10 = ({{(((8'h9e) >= (8'h9d)) ?
                              (wire9 >>> wire6) : wire7[(1'h0):(1'h0)])}} | ((8'hb9) ?
                      $unsigned(($signed(wire3) > wire3[(4'ha):(4'ha)])) : $unsigned(({wire8,
                              (8'ha8)} ?
                          wire8[(4'h9):(1'h0)] : wire3))));
  assign wire11 = wire3[(4'hb):(3'h7)];
  assign wire12 = ({(|((wire3 ? wire9 : wire10) ? wire10 : $unsigned(wire6)))} ?
                      $unsigned(wire10) : (+{{((8'hb9) | wire7), {wire0}},
                          wire7}));
  always
    @(posedge clk) begin
      reg13 <= $unsigned(wire4);
    end
  assign wire14 = $signed(wire3);
  assign wire15 = $signed(({wire6[(3'h5):(2'h2)],
                      ((|wire4) ? {(8'h9d), wire1} : (~^wire9))} && {((wire7 ?
                              wire2 : reg13) ?
                          (8'ha7) : {wire14, wire6})}));
  assign wire16 = $signed(wire6);
  module17 #() modinst94 (.wire21(wire8), .wire20(wire3), .y(wire93), .wire18(wire0), .wire19(wire1), .clk(clk));
  assign wire95 = wire16[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg96 <= $unsigned(($unsigned(($unsigned((8'ha4)) ?
              (~wire95) : $unsigned(wire12))) ?
          ((~&{wire15}) ?
              ($signed(wire6) ?
                  (!wire3) : wire9[(4'hf):(3'h4)]) : (+(wire16 + wire7))) : wire12));
    end
  assign wire97 = ($unsigned($signed((~^(^wire8)))) ?
                      $unsigned(wire8) : {wire10[(3'h5):(1'h1)],
                          (((wire93 & reg96) ?
                                  (wire10 ? (8'ha4) : wire2) : (+wire16)) ?
                              (8'haa) : $signed(wire6[(1'h1):(1'h1)]))});
  assign wire98 = $signed((-wire5));
  assign wire99 = wire4;
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg100 <= (8'hb5);
          reg101 <= wire12;
          reg102 <= (+(($unsigned((wire5 ?
              (8'hae) : wire11)) >> $signed({wire9})) != (~&wire2)));
          reg103 <= wire97[(3'h6):(1'h0)];
        end
      else
        begin
          reg100 <= {(wire6 ?
                  (~(wire93[(1'h1):(1'h0)] != (wire1 | wire98))) : (~&wire95)),
              wire93[(3'h4):(3'h4)]};
          reg101 <= wire97;
        end
      reg104 <= (&((~^((wire98 ? wire5 : wire99) == reg100[(1'h1):(1'h1)])) ?
          wire4 : (^((|wire95) != (~(8'h9f))))));
      reg105 <= $unsigned((8'hbf));
      reg106 <= $signed($unsigned((~&$signed((wire16 ? (8'haa) : reg96)))));
    end
  assign wire107 = wire3[(4'h8):(2'h2)];
  assign wire108 = wire97;
  assign wire109 = $signed(reg106);
endmodule

module module17
#(parameter param92 = ((-({((8'ha7) >>> (7'h43))} ? ((&(8'hb1)) ? ((8'ha8) ? (8'hb9) : (7'h41)) : ((8'had) ? (8'hb8) : (8'hb2))) : (~{(8'ha1)}))) ? (({((8'hbc) - (8'hb6))} ^ ((~^(8'hac)) ? (!(8'hb7)) : ((8'ha9) >>> (8'ha0)))) ? ((^((8'hab) == (8'hb8))) && (((8'ha9) >= (7'h43)) ? ((8'hb8) ? (8'hb5) : (8'hb6)) : ((8'ha0) ? (8'h9d) : (8'ha7)))) : ((((8'h9c) * (7'h42)) && {(8'h9d)}) ~^ (-((8'ha3) ? (7'h44) : (8'hb0))))) : (~((^~{(8'haf), (8'hbe)}) ? ((~^(8'ha9)) ? (7'h42) : ((8'ha1) ? (8'hb5) : (8'ha4))) : ((~|(8'hb3)) ? {(8'hb8), (8'hb3)} : (!(8'had)))))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  wire signed [(3'h7):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire22;
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire24,
                 wire22,
                 reg23,
                 (1'h0)};
  assign wire22 = wire20[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg23 <= $signed((-wire19));
    end
  assign wire24 = (wire21[(2'h3):(1'h1)] ? wire21 : $unsigned(wire21));
  module25 #() modinst65 (.clk(clk), .wire28(wire19), .y(wire64), .wire29(wire20), .wire26(wire22), .wire27(reg23), .wire30(wire18));
  assign wire66 = wire19[(3'h5):(3'h5)];
  assign wire67 = $signed(wire24[(4'he):(4'h8)]);
  assign wire68 = ($unsigned(wire24[(3'h4):(2'h2)]) ~^ $unsigned($unsigned(wire24)));
  assign wire69 = wire21;
  module70 #() modinst80 (wire79, clk, wire64, wire67, wire18, wire19);
  assign wire81 = (((|(reg23[(4'hf):(4'hb)] ~^ $signed(wire19))) ^~ $unsigned(wire64)) ?
                      $unsigned(wire21[(2'h2):(1'h0)]) : $signed($signed(wire69)));
  assign wire82 = ($unsigned(wire69) ?
                      wire64[(4'ha):(2'h2)] : $signed({((wire20 ?
                                  (8'ha6) : wire21) ?
                              $signed(wire24) : wire64)}));
  assign wire83 = $unsigned(((-(~(wire22 ?
                      wire18 : wire20))) >= ({(wire21 << wire82),
                      $unsigned(wire66)} < (&(wire18 || wire64)))));
  assign wire84 = wire67[(4'hb):(4'hb)];
  assign wire85 = ((|(!$signed({wire82, wire20}))) ?
                      $unsigned({$unsigned((!wire21)),
                          $signed({wire84})}) : (wire19 ?
                          $unsigned(wire68) : $unsigned($unsigned(wire69))));
  assign wire86 = (wire24 >= wire22[(5'h12):(3'h4)]);
  assign wire87 = $unsigned(({(wire66 >= wire21), (8'hac)} ?
                      (8'hb0) : $unsigned($signed(wire24))));
  assign wire88 = $unsigned($signed(wire18[(4'hd):(4'hb)]));
  assign wire89 = wire20;
  assign wire90 = $signed($signed((~&{(wire68 ? wire66 : wire81), (+wire89)})));
  assign wire91 = ($signed(($signed((wire18 ? wire85 : wire66)) ?
                      wire66 : ((8'hb4) ?
                          (wire22 ? wire89 : wire85) : (wire90 ?
                              wire67 : wire90)))) ~^ wire24[(4'he):(4'hd)]);
endmodule

module module70  (y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire74;
  input wire [(4'hb):(1'h0)] wire73;
  input wire signed [(4'h8):(1'h0)] wire72;
  input wire signed [(3'h7):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  assign y = {wire78, wire77, wire76, wire75, (1'h0)};
  assign wire75 = (($unsigned($unsigned($signed(wire74))) ?
                      wire72[(3'h6):(1'h0)] : (-wire71[(2'h3):(2'h2)])) || $unsigned((wire73 ?
                      wire72[(3'h7):(3'h7)] : $unsigned($signed(wire71)))));
  assign wire76 = (!(-(wire75 && (8'h9c))));
  assign wire77 = (7'h44);
  assign wire78 = (^~(((wire71 * $signed(wire74)) ?
                          wire77[(2'h3):(1'h1)] : ((wire73 ? wire76 : (8'hb5)) ?
                              wire76[(5'h12):(4'hc)] : $unsigned(wire72))) ?
                      ($signed((wire76 ?
                          wire74 : wire77)) >> (8'ha0)) : $unsigned((|(wire74 ?
                          wire75 : wire73)))));
endmodule

module module25
#(parameter param62 = (|((({(8'ha6), (7'h40)} ? (^~(8'hb3)) : ((8'ha2) - (8'hbe))) > (~&((8'ha1) & (8'h9f)))) | (((8'ha2) ? (~^(8'hba)) : ((8'h9d) ? (8'ha8) : (7'h42))) ? ((~(7'h41)) >>> ((8'hb4) ? (8'had) : (8'hb7))) : (|((8'hbd) ? (8'hba) : (8'hbb)))))), 
parameter param63 = ((!param62) ? param62 : param62))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire30;
  input wire signed [(3'h4):(1'h0)] wire29;
  input wire signed [(4'hc):(1'h0)] wire28;
  input wire signed [(5'h12):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire49,
                 wire48,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire32,
                 wire31,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg34,
                 (1'h0)};
  assign wire31 = (wire29[(2'h3):(1'h1)] - (~&wire26));
  assign wire32 = wire29[(1'h1):(1'h1)];
  assign wire33 = (~^((~(~wire28[(3'h7):(3'h7)])) >>> ($unsigned(wire26[(2'h2):(1'h0)]) ?
                      ($signed(wire32) > $unsigned(wire27)) : (-$unsigned(wire28)))));
  always
    @(posedge clk) begin
      reg34 <= (wire30 ~^ wire32);
    end
  assign wire35 = $signed(wire27[(3'h4):(2'h2)]);
  assign wire36 = wire32[(1'h1):(1'h1)];
  assign wire37 = $unsigned(wire36);
  assign wire38 = $unsigned(wire36);
  assign wire39 = ($unsigned($signed($unsigned(wire36[(5'h10):(4'hd)]))) && $signed($signed($signed(wire31[(4'he):(4'he)]))));
  assign wire40 = wire31;
  always
    @(posedge clk) begin
      reg41 <= ((8'ha9) - (8'ha7));
      reg42 <= $signed((~^(&wire37[(4'hc):(4'h9)])));
      reg43 <= $signed(wire33[(5'h15):(5'h11)]);
      reg44 <= ($signed((8'ha1)) ?
          (+$signed($unsigned($unsigned(wire27)))) : $unsigned((-wire32)));
    end
  always
    @(posedge clk) begin
      reg45 <= ($signed(wire26[(4'hf):(4'h8)]) ?
          reg43[(3'h4):(2'h3)] : $signed((~|(&$signed((8'ha8))))));
      reg46 <= $signed(wire28[(2'h2):(2'h2)]);
      reg47 <= (reg43 ?
          $signed(((wire31 ?
              (+wire29) : {reg43,
                  wire40}) && $signed(reg42))) : (&(~($signed(wire37) ?
              $unsigned(wire26) : (wire39 ~^ wire26)))));
    end
  assign wire48 = wire35;
  assign wire49 = $signed((wire31 ? (&$unsigned(wire26)) : (8'hab)));
  always
    @(posedge clk) begin
      reg50 <= {{(({reg42, wire39} * (wire38 || wire40)) ?
                  $unsigned(wire30[(3'h4):(2'h3)]) : (~&((8'hb6) <= reg42))),
              wire27[(3'h5):(1'h1)]}};
      reg51 <= $signed(reg46[(3'h4):(1'h1)]);
      reg52 <= ($unsigned(((wire27 && (wire36 ^ reg34)) ?
          {(wire36 ?
                  wire32 : wire29)} : (!(wire28 ~^ wire38)))) <<< ($signed((^wire29[(3'h4):(1'h1)])) ?
          wire36[(2'h2):(2'h2)] : $signed((^$signed(wire29)))));
      reg53 <= {(8'h9d), $unsigned(reg46)};
      reg54 <= $unsigned($signed(wire49));
    end
  assign wire55 = (^$unsigned({$signed($unsigned(reg53)),
                      ($signed((8'haf)) ? (reg53 > wire49) : reg44)}));
  assign wire56 = reg51;
  assign wire57 = wire28[(3'h4):(1'h0)];
  assign wire58 = $unsigned((8'hab));
  assign wire59 = reg43;
  assign wire60 = $signed((~|$unsigned($signed($unsigned(wire27)))));
  assign wire61 = $signed(((~(~&(wire59 <<< reg34))) <<< wire48));
endmodule
