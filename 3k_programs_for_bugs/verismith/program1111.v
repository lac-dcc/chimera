module top
#(parameter param143 = {{({(7'h44), (8'h9c)} ? (((8'hab) ? (8'ha6) : (8'hb5)) ? (&(8'ha4)) : ((8'ha0) ? (8'ha5) : (8'hbf))) : (((8'hab) >> (8'hb7)) >= {(8'hb5)})), ({{(8'hba)}} || (~|(8'ha7)))}, (&((8'hbf) ? (((8'ha7) ? (8'hbd) : (8'hbb)) << ((8'hb0) >>> (8'hbb))) : ((~^(8'haa)) ? {(8'hb3), (8'ha6)} : ((8'h9d) - (8'hb3)))))}, 
parameter param144 = param143)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire133;
  wire [(4'hd):(1'h0)] wire131;
  wire signed [(4'hd):(1'h0)] wire129;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire139;
  wire signed [(3'h7):(1'h0)] wire140;
  wire signed [(4'ha):(1'h0)] wire141;
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  assign y = {wire133,
                 wire131,
                 wire129,
                 wire5,
                 wire139,
                 wire140,
                 wire141,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 (1'h0)};
  assign wire5 = $unsigned((-$signed(($signed(wire0) ?
                     (^wire2) : $unsigned(wire1)))));
  module6 #() modinst130 (.wire8(wire0), .wire9(wire5), .wire7(wire4), .y(wire129), .clk(clk), .wire10(wire3));
  module78 #() modinst132 (wire131, clk, wire129, wire0, wire2, wire4);
  module54 #() modinst134 (wire133, clk, wire3, wire2, wire129, wire5, wire1);
  always
    @(posedge clk) begin
      reg135 <= ($signed(wire2) ?
          $unsigned($signed(wire0)) : (wire133 - (($unsigned(wire129) == (8'ha2)) ?
              (^wire2[(4'hd):(3'h5)]) : $unsigned($unsigned(wire131)))));
      reg136 <= {(-(wire131[(4'hd):(2'h3)] ? wire129[(4'ha):(4'h9)] : wire2)),
          $signed(((wire4 ? (7'h44) : (wire4 - wire133)) ?
              wire3[(4'h8):(1'h1)] : ($signed(wire129) <<< wire5[(4'ha):(1'h0)])))};
      reg137 <= wire131[(4'ha):(3'h7)];
      reg138 <= (!((~&$unsigned((~&wire3))) ?
          $signed(reg136) : ($signed(reg136[(2'h2):(1'h0)]) >>> {((8'hbb) ?
                  reg135 : wire3),
              $signed(reg137)})));
    end
  assign wire139 = (wire0 ?
                       (!(reg137[(3'h4):(1'h1)] >= $signed(wire2))) : wire131);
  assign wire140 = reg135;
  module12 #() modinst142 (wire141, clk, wire3, wire4, wire0, reg137);
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire126;
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  assign y = {wire128,
                 wire49,
                 wire23,
                 wire51,
                 wire52,
                 wire53,
                 wire75,
                 wire77,
                 wire126,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= (8'hb0);
    end
  module12 #() modinst24 (.wire13(wire10), .y(wire23), .wire15(wire7), .wire14(wire9), .clk(clk), .wire16(reg11));
  module25 #() modinst50 (.wire26(wire8), .wire28(wire9), .wire27(reg11), .clk(clk), .y(wire49), .wire29(wire7));
  assign wire51 = wire49[(1'h0):(1'h0)];
  assign wire52 = wire23;
  assign wire53 = (!(reg11 ? (8'ha8) : {(^$unsigned(wire49)), wire52}));
  module54 #() modinst76 (wire75, clk, wire53, reg11, wire9, wire8, wire10);
  assign wire77 = $signed(wire49);
  module78 #() modinst127 (wire126, clk, reg11, wire9, wire7, wire8);
  assign wire128 = wire9[(5'h13):(5'h13)];
endmodule

module module78
#(parameter param125 = (((~(((8'h9e) && (8'hb5)) ? ((7'h44) ? (8'hab) : (8'hb9)) : ((8'ha3) ? (8'ha6) : (8'h9d)))) == (+{((8'hb6) * (8'ha7))})) ^~ (((+((8'hb2) ? (8'ha3) : (8'h9f))) ? (+{(8'ha4), (7'h44)}) : (((8'hb5) ^~ (8'haf)) && {(8'hb9), (8'ha9)})) ? ((!((8'hb2) ? (8'ha4) : (8'h9f))) ? (((7'h43) ? (8'ha9) : (8'hb1)) ~^ (!(8'ha4))) : {{(8'ha5)}, {(8'hbe)}}) : ((^(8'ha3)) - (~&(~(8'h9c)))))))
(y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h227):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire82;
  input wire signed [(5'h15):(1'h0)] wire81;
  input wire [(5'h12):(1'h0)] wire80;
  input wire [(5'h11):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire124;
  wire [(5'h13):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire122;
  wire [(5'h11):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire116;
  wire [(2'h2):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire85,
                 wire84,
                 wire83,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire83 = $signed(((8'ha5) ^~ (~{(wire80 >>> wire82)})));
  assign wire84 = {wire79[(4'hf):(4'he)]};
  assign wire85 = (~|$unsigned(((~^(|wire80)) ?
                      ($unsigned((8'hab)) ?
                          (wire79 & wire84) : (wire81 ?
                              wire84 : wire84)) : wire82[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg86 <= (($unsigned((~&wire83)) >= wire80) * wire82);
      reg87 <= (wire83 < (((!(wire82 ^ wire84)) >> $unsigned((wire83 ?
              (8'ha3) : reg86))) ?
          $unsigned((^$signed(wire82))) : (wire84[(4'h8):(1'h0)] ?
              (~|((8'hac) ~^ wire84)) : $unsigned(reg86[(5'h11):(4'h9)]))));
      reg88 <= ((({$signed((8'hb2)),
          wire80[(4'hf):(4'h9)]} && wire79[(4'hb):(2'h2)]) - $unsigned((^(wire85 ?
          wire81 : reg86)))) ^~ $signed($signed(wire82[(1'h0):(1'h0)])));
      if ($unsigned(({{wire79, reg88}} >>> (~^((wire82 & wire83) ?
          (wire81 ? (8'hb1) : wire83) : $signed(reg87))))))
        begin
          reg89 <= wire82;
          reg90 <= {reg87[(4'h8):(1'h1)],
              $unsigned(($signed((&reg86)) >> ($signed(wire80) <= $signed(reg88))))};
        end
      else
        begin
          reg89 <= $signed($signed($unsigned((7'h44))));
          reg90 <= $signed((8'hbd));
          reg91 <= wire79;
          reg92 <= (8'hb1);
          reg93 <= {$signed(reg87[(5'h11):(4'he)])};
        end
    end
  assign wire94 = {(7'h41), wire84};
  assign wire95 = (&wire82);
  assign wire96 = (^((+reg88) ?
                      reg92[(1'h0):(1'h0)] : ((~$unsigned(wire80)) * $unsigned((~wire85)))));
  assign wire97 = wire94[(1'h0):(1'h0)];
  assign wire98 = (wire84 ? reg90 : wire97[(2'h3):(1'h1)]);
  assign wire99 = {(~&wire82), (^~(|reg93))};
  assign wire100 = (~|({$signed((wire94 ? wire94 : wire85))} ^ wire80));
  assign wire101 = (wire84 ?
                       ($unsigned($signed({(8'hbf), (8'hb2)})) | (+{(wire98 ?
                               reg87 : reg92)})) : $unsigned(wire100));
  always
    @(posedge clk) begin
      reg102 <= $signed((wire99[(1'h0):(1'h0)] ?
          ((8'ha2) >>> ({wire80} <<< $signed(reg89))) : ($signed((wire80 == reg93)) != $signed((^reg93)))));
      reg103 <= wire96[(4'hb):(1'h0)];
      if ($signed({$signed(($signed(wire95) != $signed(wire99))),
          ($unsigned((8'h9e)) >> (|$unsigned(wire80)))}))
        begin
          reg104 <= ((^$unsigned($signed($unsigned(wire79)))) ?
              ($unsigned(($unsigned(reg88) <= (reg92 ~^ reg92))) ?
                  (~|($signed(wire83) ?
                      (7'h44) : ((8'ha9) ?
                          wire97 : (8'haa)))) : $signed((^(~|reg91)))) : $signed((^~reg90)));
          reg105 <= {(reg89 <= (wire80 ^~ ((wire79 ? wire84 : reg103) ?
                  $unsigned(reg92) : $unsigned(reg104)))),
              (((wire97 ? {reg92} : (wire99 ^~ wire99)) && {$signed((8'ha8)),
                  (~&reg104)}) && reg90[(1'h1):(1'h0)])};
          reg106 <= $unsigned(($unsigned(($signed((8'ha6)) > reg88)) >> (((^wire95) < (wire81 ?
              reg102 : wire97)) >>> (-$unsigned(reg88)))));
        end
      else
        begin
          reg104 <= wire94[(2'h3):(2'h3)];
          reg105 <= $unsigned((~|(|wire81)));
        end
      if (((reg93[(4'h8):(3'h6)] >= (|((wire99 ?
              wire94 : reg89) ^ (reg86 * (8'hab))))) ?
          $unsigned(reg102[(2'h3):(2'h2)]) : $unsigned(reg87[(3'h6):(3'h5)])))
        begin
          if ($signed(reg92[(4'hf):(2'h3)]))
            begin
              reg107 <= reg92[(4'ha):(4'h8)];
              reg108 <= (reg105[(2'h3):(1'h1)] ? reg105 : (8'ha2));
            end
          else
            begin
              reg107 <= wire79;
            end
          reg109 <= {reg93};
        end
      else
        begin
          reg107 <= $signed(((reg104[(3'h6):(2'h2)] * ({wire83,
              reg86} && (reg105 + wire101))) ~^ ($unsigned(wire94[(2'h3):(2'h2)]) <= (&$signed(wire83)))));
          if (reg93)
            begin
              reg108 <= ((^~reg108) ?
                  wire95[(4'h8):(3'h7)] : ((~&$unsigned($unsigned((8'h9d)))) ?
                      (^reg102) : wire85[(1'h0):(1'h0)]));
              reg109 <= {$signed((8'ha4))};
              reg110 <= $signed((reg92 <= (^~{(^reg86), (wire85 < wire83)})));
              reg111 <= reg105;
              reg112 <= $signed((~|$unsigned(reg92)));
            end
          else
            begin
              reg108 <= ((&(reg103 - reg106[(4'h8):(3'h6)])) | $signed(reg103));
              reg109 <= wire95[(1'h0):(1'h0)];
            end
          reg113 <= $signed((8'hae));
        end
      reg114 <= wire100[(3'h5):(1'h0)];
    end
  assign wire115 = $signed((-((~|reg87[(5'h12):(3'h7)]) ?
                       (~&{wire100, reg90}) : $unsigned((reg112 ?
                           (7'h41) : wire94)))));
  assign wire116 = $signed($signed({((reg87 <<< reg114) ?
                           (wire95 & (8'ha8)) : $signed((8'hac))),
                       ({reg86, (8'h9f)} ?
                           ((8'h9e) ?
                               reg93 : reg105) : wire85[(4'hc):(4'h8)])}));
  assign wire117 = (-$signed(($signed((^wire84)) ?
                       $signed((wire84 > (8'haa))) : (((8'hb4) ?
                               wire83 : (8'ha5)) ?
                           wire96[(3'h5):(2'h2)] : (reg102 ?
                               (8'h9e) : reg112)))));
  assign wire118 = reg91;
  assign wire119 = (^$signed(($signed((reg90 ? (8'h9f) : (8'haa))) << reg114)));
  assign wire120 = wire100;
  assign wire121 = ({(!reg112[(4'h9):(3'h4)])} == $unsigned($unsigned(({wire85,
                       reg105} <<< wire100))));
  assign wire122 = reg109;
  assign wire123 = $unsigned((+(!(^~(wire115 ? wire101 : (8'h9c))))));
  assign wire124 = (reg104 & {wire97,
                       (((wire81 == reg107) ~^ (~wire97)) ?
                           wire79 : ($unsigned(wire84) ?
                               $signed(reg110) : $signed(wire79)))});
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire59;
  input wire signed [(4'hf):(1'h0)] wire58;
  input wire [(4'hd):(1'h0)] wire57;
  input wire signed [(4'hd):(1'h0)] wire56;
  input wire signed [(4'ha):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire62,
                 wire61,
                 wire60,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire60 = $unsigned($unsigned((~&(wire58 + (~wire59)))));
  assign wire61 = $unsigned(wire55[(2'h3):(2'h3)]);
  assign wire62 = {(~|((8'ha6) ^~ wire57)), wire57};
  always
    @(posedge clk) begin
      reg63 <= (({(^~wire59[(2'h3):(1'h1)])} && $signed($signed(wire59))) ?
          ((wire62 && wire57[(3'h7):(3'h5)]) ?
              (($unsigned(wire62) < $unsigned(wire56)) < ((~|wire60) - $unsigned(wire58))) : wire55) : (~$signed(wire56[(3'h5):(1'h0)])));
      if ((^wire61[(2'h2):(1'h0)]))
        begin
          reg64 <= ($signed($unsigned(wire62)) && ($signed($unsigned((wire62 ?
                  wire55 : (8'h9c)))) ?
              reg63 : (wire60[(2'h3):(1'h1)] <<< ((wire62 - wire60) ?
                  $unsigned(wire61) : (wire55 < wire57)))));
          if (($unsigned((((wire57 || wire58) ?
                  wire58[(4'he):(3'h4)] : (wire59 ^~ (8'hbd))) ?
              wire62[(3'h4):(2'h3)] : wire58)) > ((+((wire56 < wire61) ?
              (wire62 ? wire59 : wire57) : {wire58})) == wire56)))
            begin
              reg65 <= $unsigned((wire61[(1'h0):(1'h0)] <<< $signed(wire59)));
            end
          else
            begin
              reg65 <= $signed($signed(wire59));
              reg66 <= $unsigned({(((reg64 ?
                      reg63 : wire60) * wire61) * $signed($unsigned(reg65))),
                  wire56});
              reg67 <= ((^((~|(+wire57)) ?
                  wire61 : (wire62 ?
                      reg65[(4'ha):(2'h3)] : {wire56,
                          reg65}))) << wire58[(1'h0):(1'h0)]);
              reg68 <= $signed(wire62);
            end
        end
      else
        begin
          reg64 <= ((!(8'hb4)) | {$signed($signed(wire58[(4'h8):(4'h8)]))});
          reg65 <= ((7'h41) < $signed((&(|(~^reg68)))));
        end
      reg69 <= ($unsigned(wire58[(3'h4):(2'h2)]) != (reg65 ?
          $unsigned(wire58) : ({{reg63, (8'ha3)}} ?
              wire60[(4'h8):(1'h0)] : (8'hb0))));
      reg70 <= reg64[(2'h3):(2'h3)];
      reg71 <= reg66;
    end
  assign wire72 = ((wire61[(4'h9):(1'h1)] ?
                      (wire57 > ((~^reg69) >= wire56[(4'hb):(2'h3)])) : ((reg67 << {reg66}) == ((wire57 ?
                              wire60 : wire60) ?
                          $signed(reg67) : (reg67 ?
                              wire59 : wire58)))) >> (-$signed(wire57)));
  assign wire73 = ((~&(reg70 ?
                          $unsigned($unsigned(reg67)) : (^wire60[(4'h9):(3'h7)]))) ?
                      (wire59 ? wire55 : (-reg64)) : wire72[(3'h4):(3'h4)]);
  assign wire74 = (^~reg67);
endmodule

module module25
#(parameter param48 = (~|(~{(((8'hb2) ? (8'hb2) : (8'hb8)) > ((8'ha0) ? (8'hb6) : (8'ha8)))})))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire29;
  input wire signed [(5'h10):(1'h0)] wire28;
  input wire [(4'h9):(1'h0)] wire27;
  input wire [(4'hb):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  assign y = {wire47,
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
                 wire36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg30 <= wire29;
      reg31 <= $unsigned(wire28);
      reg32 <= (wire27[(4'h8):(3'h6)] ?
          $unsigned($signed((~|reg31))) : (~|wire27));
      reg33 <= (8'ha0);
    end
  always
    @(posedge clk) begin
      reg34 <= (reg32 <<< wire28[(4'he):(4'hd)]);
      reg35 <= reg32;
    end
  assign wire36 = reg34[(4'h8):(2'h3)];
  assign wire37 = reg31;
  assign wire38 = $signed((wire37[(1'h1):(1'h1)] ?
                      ($signed($signed(wire27)) ?
                          $unsigned(wire29[(3'h7):(3'h5)]) : wire28[(2'h3):(2'h2)]) : {wire36}));
  assign wire39 = $unsigned((~&wire38[(4'ha):(3'h7)]));
  assign wire40 = wire26[(2'h3):(2'h2)];
  assign wire41 = wire40[(4'ha):(1'h1)];
  assign wire42 = (($signed((~|(wire28 < wire41))) >> (($unsigned((8'ha2)) | (reg32 ?
                          reg32 : reg34)) ?
                      (~|$unsigned(wire37)) : wire29[(3'h4):(1'h0)])) > wire40);
  assign wire43 = (({(!{wire41})} == reg30) >>> {$unsigned((~{reg34, wire39})),
                      $signed(wire38)});
  assign wire44 = (+((($unsigned(wire26) || ((8'ha0) ?
                          wire42 : wire38)) == ($unsigned(wire40) <= $signed((8'h9e)))) ?
                      $signed(($unsigned(reg34) & $signed(wire38))) : {$signed((wire28 <= wire41)),
                          {wire29[(3'h7):(3'h7)]}}));
  assign wire45 = wire36;
  assign wire46 = wire43;
  assign wire47 = $unsigned($signed(({reg34[(3'h7):(3'h4)],
                      wire42[(1'h1):(1'h0)]} <= ((reg34 ?
                      wire43 : wire41) <<< wire40[(4'ha):(3'h7)]))));
endmodule

module module12
#(parameter param21 = (&(^~({((8'hb4) <<< (8'hac)), ((8'hb5) ? (8'hb4) : (8'hb6))} >= ({(7'h43), (8'hbd)} ? ((8'hbd) ? (8'ha7) : (8'hb0)) : ((8'hb0) ? (8'hb9) : (7'h43)))))), 
parameter param22 = param21)
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire16;
  input wire [(4'hf):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  assign y = {wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = $signed((8'hae));
  assign wire18 = (($unsigned(({wire14, wire16} & $signed(wire14))) ?
                          wire14[(4'h8):(2'h3)] : wire13) ?
                      (($signed(wire14[(4'hb):(3'h7)]) >= (!$signed(wire16))) - (~|$unsigned((~wire17)))) : (($unsigned(((8'hb0) ?
                          wire17 : wire17)) < $unsigned($signed(wire14))) != (!($signed(wire14) ?
                          wire14 : (wire17 ? wire13 : wire15)))));
  assign wire19 = ((&(~($unsigned(wire18) <= (wire15 <= wire15)))) ?
                      wire18[(1'h1):(1'h1)] : (($signed((wire15 ?
                                  wire13 : wire16)) ?
                              wire13 : wire14[(2'h3):(1'h0)]) ?
                          $unsigned((^~(wire18 ?
                              wire16 : wire13))) : $unsigned(wire15)));
  assign wire20 = $signed($unsigned(((~^(wire15 ? wire16 : wire19)) ?
                      $unsigned((|wire14)) : (-((8'hbc) & wire13)))));
endmodule
