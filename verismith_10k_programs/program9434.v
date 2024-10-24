module top
#(parameter param150 = {(^~((((8'hbe) ? (8'hbf) : (8'ha5)) ? ((8'hac) ? (8'hbc) : (8'hb8)) : ((8'hb9) ? (8'h9c) : (8'hbb))) ? (8'ha7) : ((+(8'haf)) ? {(8'hbd), (8'ha9)} : (|(8'ha2))))), ((~(&((8'ha1) ? (8'hb8) : (8'hb1)))) == (&(^((8'ha5) ? (8'ha1) : (8'hbf)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire148;
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire80,
                 wire82,
                 wire148,
                 reg7,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = (+(~{(!wire5[(1'h1):(1'h0)])}));
  always
    @(posedge clk) begin
      reg7 <= $unsigned(((((8'hac) ? (wire2 && wire4) : $unsigned(wire4)) ?
              $unsigned($signed((8'h9d))) : (!(wire1 ? wire6 : wire1))) ?
          (~|wire4) : ($unsigned((wire0 ^ wire6)) ? wire3 : (~&wire4))));
    end
  assign wire8 = reg7;
  assign wire9 = (^(!{$signed(wire8), (8'hba)}));
  assign wire10 = wire8[(3'h5):(1'h0)];
  assign wire11 = $signed(($unsigned((~(~&wire4))) ?
                      $signed(wire1[(4'hd):(4'h8)]) : $signed(wire6)));
  assign wire12 = {((|wire5) < wire6[(2'h2):(1'h0)])};
  module13 #() modinst81 (.wire17(wire5), .clk(clk), .wire14(wire10), .wire15(wire3), .wire16(wire2), .y(wire80), .wire18(reg7));
  assign wire82 = $signed($unsigned((^~(wire1[(3'h5):(3'h5)] ?
                      ((8'h9c) ? wire2 : (8'ha0)) : (!wire5)))));
  module83 #() modinst149 (.wire84(wire82), .wire87(reg7), .wire85(wire3), .y(wire148), .clk(clk), .wire86(wire12));
endmodule

module module83
#(parameter param146 = (~&(((~(|(8'hb8))) ? (~(~&(8'ha5))) : (((8'hac) || (8'h9e)) ? {(8'hb0), (7'h40)} : ((8'hbb) >> (8'hbd)))) ? (+(~|(|(8'hb6)))) : (!(((8'h9c) ? (8'hbf) : (8'h9e)) == ((7'h44) + (8'hb1)))))), 
parameter param147 = {({(((7'h44) ? param146 : param146) == (param146 <= param146)), (param146 * param146)} >> param146), (|(param146 ? {(param146 * param146), param146} : (~(param146 > param146))))})
(y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire87;
  input wire signed [(5'h10):(1'h0)] wire86;
  input wire [(5'h10):(1'h0)] wire85;
  input wire [(5'h12):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire145;
  wire [(5'h15):(1'h0)] wire144;
  wire [(3'h4):(1'h0)] wire143;
  wire signed [(4'hc):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire88;
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg136 = (1'h0);
  reg [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire126,
                 wire88,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire88 = (((-(^(~wire85))) - (|$unsigned((wire87 ?
                      wire84 : wire84)))) > (((wire85[(1'h1):(1'h1)] - {wire85,
                              wire85}) ?
                          ((8'hab) ? (&wire87) : $signed(wire86)) : ((wire87 ?
                                  wire84 : wire85) ?
                              $signed(wire84) : $signed(wire86))) ?
                      (((^wire87) - (wire87 ?
                          (8'hbd) : (7'h40))) == $signed((wire87 ?
                          wire84 : wire87))) : wire84[(2'h2):(1'h0)]));
  module89 #() modinst127 (.wire90(wire84), .wire91(wire86), .wire92(wire85), .y(wire126), .wire93(wire87), .clk(clk));
  always
    @(posedge clk) begin
      reg128 <= (wire85[(3'h7):(2'h3)] != $signed(wire84[(3'h4):(3'h4)]));
      reg129 <= $unsigned((+(+(|$unsigned(wire85)))));
      if ((~(({$unsigned(wire88), $unsigned(wire85)} ?
              (+(wire86 ? reg129 : (8'h9f))) : wire126) ?
          wire86 : $unsigned(wire88))))
        begin
          if ({reg128[(2'h2):(2'h2)],
              ((|{{wire126},
                  reg128[(1'h1):(1'h1)]}) > ($unsigned($unsigned((8'ha0))) ~^ $signed((8'ha7))))})
            begin
              reg130 <= $signed($unsigned((!$unsigned((wire88 ?
                  reg129 : wire86)))));
              reg131 <= wire126[(1'h0):(1'h0)];
              reg132 <= reg128;
              reg133 <= (((((!(8'hb7)) >= (8'ha2)) ?
                      wire88 : ((reg128 ~^ reg128) <<< {wire126})) ?
                  (reg128[(1'h1):(1'h0)] >= $signed((-wire86))) : wire87) >>> (-(+(~|(reg132 ?
                  wire126 : reg131)))));
              reg134 <= (^$unsigned(reg130[(4'he):(4'h9)]));
            end
          else
            begin
              reg130 <= reg132;
              reg131 <= reg131;
            end
        end
      else
        begin
          reg130 <= $unsigned($signed((reg130[(4'ha):(4'h9)] <<< reg134[(4'h8):(3'h4)])));
          if (reg133[(3'h5):(2'h2)])
            begin
              reg131 <= wire126[(2'h2):(1'h0)];
              reg132 <= (^reg130);
              reg133 <= (&$unsigned(wire84[(4'hc):(3'h7)]));
              reg134 <= $unsigned($unsigned(wire85[(5'h10):(1'h1)]));
            end
          else
            begin
              reg131 <= {$signed($unsigned((~&(8'hbe))))};
              reg132 <= reg128[(1'h0):(1'h0)];
            end
          reg135 <= wire84;
        end
      if ($signed(wire88))
        begin
          reg136 <= (((reg133 >= $unsigned(((8'h9d) >= wire86))) ?
                  $signed($unsigned((reg135 ? wire84 : reg131))) : {((-reg129) ?
                          (wire84 << reg128) : (reg130 ? reg129 : reg133)),
                      ((~&reg131) >> $signed(wire87))}) ?
              ((!($unsigned(wire86) ?
                  (wire126 ^~ (8'hb2)) : wire126)) >= wire86) : $signed((8'hbe)));
          if ($signed($unsigned((^~$signed(wire86)))))
            begin
              reg137 <= ($unsigned($unsigned(((8'hb2) ?
                  wire84[(4'ha):(3'h6)] : (wire85 ?
                      reg128 : reg129)))) - reg136[(3'h6):(2'h3)]);
              reg138 <= reg130[(4'h8):(4'h8)];
            end
          else
            begin
              reg137 <= ((|$unsigned(reg130[(5'h15):(4'h8)])) ?
                  ($signed(($unsigned(wire87) << $signed(wire84))) >>> (~&reg135)) : {$unsigned(reg130)});
              reg138 <= (!reg128[(1'h0):(1'h0)]);
              reg139 <= reg136[(3'h6):(1'h1)];
              reg140 <= (($unsigned($signed((+wire85))) ?
                      $unsigned((^~reg138[(2'h3):(2'h3)])) : reg136[(2'h2):(1'h0)]) ?
                  wire88[(2'h2):(1'h0)] : (|({reg134[(3'h5):(2'h2)]} ?
                      reg132[(1'h1):(1'h0)] : $signed($unsigned(wire84)))));
              reg141 <= reg136;
            end
          reg142 <= $unsigned($unsigned({wire86[(4'hc):(2'h2)]}));
        end
      else
        begin
          reg136 <= {$signed(wire84[(3'h7):(1'h1)])};
          reg137 <= $unsigned((!($unsigned((reg142 ? wire86 : wire87)) ?
              $signed($signed((8'hb1))) : $unsigned((~reg135)))));
          reg138 <= ((({$unsigned(reg137), $signed(reg131)} ?
                  $signed(reg137[(2'h2):(1'h1)]) : $unsigned(reg129)) ?
              (^~wire88[(2'h2):(2'h2)]) : $unsigned($unsigned({reg141}))) * ((((reg137 && reg129) ^ ((8'hb8) != reg137)) ?
              {wire85[(3'h6):(3'h5)]} : reg139[(3'h5):(2'h3)]) & {reg135,
              {{reg138}, $signed(reg138)}}));
          reg139 <= ($unsigned($unsigned(((reg141 ? (8'ha6) : reg137) ?
                  (reg139 ? reg131 : reg129) : $unsigned(reg138)))) ?
              $unsigned((&(~&$signed(reg134)))) : $unsigned($signed(reg142)));
          reg140 <= {$signed({reg140,
                  ($unsigned(reg133) ?
                      (reg135 ? reg134 : reg141) : (reg134 != wire126))})};
        end
    end
  assign wire143 = $unsigned($signed((~wire126[(4'hc):(3'h4)])));
  assign wire144 = $unsigned((&reg140));
  assign wire145 = $signed(wire85[(3'h5):(3'h4)]);
endmodule

module module13
#(parameter param79 = (^(~&{(((8'hb1) << (8'hac)) + {(8'ha6), (8'ha6)}), ((!(8'ha6)) ? {(7'h41)} : {(8'hba), (8'ha8)})})))
(y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire14;
  input wire [(3'h6):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(4'hc):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire45;
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire49,
                 wire48,
                 wire47,
                 wire19,
                 wire20,
                 wire26,
                 wire45,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg63,
                 reg62,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire19 = $signed((((8'ha8) <<< {(wire15 ? wire18 : (7'h40)),
                      ((8'ha0) >= (8'hb9))}) + wire14[(2'h2):(2'h2)]));
  assign wire20 = wire16[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg21 <= $unsigned((~&((~^(wire18 <= wire14)) ?
          $signed(wire14[(1'h1):(1'h1)]) : $signed(((8'hb7) >= wire14)))));
      reg22 <= ((+reg21) >= reg21);
      reg23 <= {($signed((wire19 ?
                  $signed(wire19) : ((7'h41) ? (8'ha0) : wire17))) ?
              (wire14[(1'h0):(1'h0)] && (wire16 ?
                  wire18 : (wire17 ?
                      (8'hb1) : wire18))) : (~^$unsigned(wire19))),
          reg21[(4'ha):(3'h5)]};
      reg24 <= (wire20 ?
          reg23 : {(~(wire20[(2'h2):(2'h2)] ?
                  (wire17 + reg22) : (reg22 ? wire18 : wire16))),
              wire15});
      reg25 <= (wire14[(1'h0):(1'h0)] ? (^~reg22[(4'hb):(4'ha)]) : reg23);
    end
  assign wire26 = $unsigned($signed((^$unsigned((~^wire20)))));
  module27 #() modinst46 (wire45, clk, reg22, wire14, wire26, reg23, wire18);
  assign wire47 = (wire45 ?
                      wire19[(2'h3):(1'h0)] : (+$unsigned($unsigned((reg24 >> reg21)))));
  assign wire48 = $unsigned((~(|$signed((8'haa)))));
  assign wire49 = (~((!((wire47 ?
                      wire14 : wire18) || $unsigned(wire48))) < ({(reg23 ?
                          wire15 : wire20),
                      reg25} >= wire45[(4'hc):(4'h9)])));
  always
    @(posedge clk) begin
      if ((&(~{wire48[(4'h8):(3'h4)], wire47})))
        begin
          reg50 <= $signed((~^$unsigned(((wire18 >>> (8'ha7)) ?
              (wire47 ~^ wire26) : $signed(wire47)))));
          reg51 <= wire14;
          reg52 <= (-$signed((({wire20, wire48} >> wire45[(4'hc):(3'h5)]) ?
              {(reg25 ? wire26 : (8'h9f)),
                  $signed((8'hb0))} : wire17[(3'h6):(1'h0)])));
        end
      else
        begin
          reg50 <= $signed(wire20);
          reg51 <= wire26[(4'hc):(4'h8)];
        end
      reg53 <= reg21;
      if (((&(((7'h40) ? reg52 : reg22) ?
          $unsigned(wire18[(3'h7):(1'h1)]) : $unsigned($unsigned((8'ha6))))) <<< ((($signed(wire15) >= (reg24 ?
              (8'ha7) : reg53)) ?
          {wire15} : wire19) != reg24)))
        begin
          if ($signed((((~^reg52[(4'he):(4'he)]) >= ($unsigned((8'haf)) || reg24)) << ((~&reg23[(4'hd):(4'hd)]) != (+(^~wire19))))))
            begin
              reg54 <= reg21;
              reg55 <= $unsigned(($signed(reg54) && (~&((reg50 ?
                      wire16 : (7'h40)) ?
                  {(8'haf)} : (+wire49)))));
              reg56 <= reg51;
              reg57 <= $signed(($signed(($signed(reg25) * $unsigned(wire47))) ?
                  $unsigned($unsigned(((8'hb1) ? reg52 : reg56))) : reg50));
            end
          else
            begin
              reg54 <= wire45[(4'hd):(1'h1)];
            end
          if ((~|(($signed((wire20 ? reg57 : wire14)) ?
              {((8'ha3) ?
                      wire19 : (8'ha7))} : reg25[(3'h6):(1'h1)]) ~^ $signed({((8'h9c) ?
                  wire45 : (8'hb4))}))))
            begin
              reg58 <= wire15;
              reg59 <= {wire48[(2'h2):(1'h0)]};
              reg60 <= {{(wire26[(4'hf):(3'h5)] != reg58),
                      $signed((&(reg23 > reg23)))}};
            end
          else
            begin
              reg58 <= (($signed((8'hb7)) <<< wire17) ?
                  (wire47 + ($unsigned((reg22 < reg24)) | (reg52 != (reg54 >> wire18)))) : {$unsigned({(wire15 == reg21)}),
                      $unsigned({(~|wire20)})});
              reg59 <= {(wire20 ?
                      $signed((reg58[(4'ha):(3'h5)] ?
                          wire48[(3'h7):(2'h3)] : (reg58 - wire16))) : $signed(wire45))};
              reg60 <= reg25;
              reg61 <= reg57[(1'h0):(1'h0)];
            end
          reg62 <= (&$unsigned((~|((wire17 & wire15) ?
              {wire45, reg57} : (8'hbd)))));
          reg63 <= reg55;
        end
      else
        begin
          reg54 <= (-({$unsigned(reg52[(5'h12):(4'hf)])} >>> (^reg24)));
          reg55 <= $signed(wire45[(3'h6):(2'h2)]);
        end
    end
  assign wire64 = $signed($unsigned($signed(reg53[(1'h0):(1'h0)])));
  assign wire65 = wire64;
  assign wire66 = $signed((~(8'hbd)));
  assign wire67 = (&reg58[(4'hc):(4'h9)]);
  assign wire68 = ($unsigned((8'ha0)) ?
                      {(wire16 ? (~$unsigned(wire26)) : wire64),
                          {wire47[(3'h5):(3'h4)],
                              (~&$signed(reg59))}} : {((~&(wire67 ^~ reg50)) + reg21[(1'h1):(1'h1)]),
                          ((^~$signed(reg52)) ?
                              {(wire66 >> wire14),
                                  (^~wire20)} : reg63[(3'h7):(3'h4)])});
  assign wire69 = wire47;
  always
    @(posedge clk) begin
      reg70 <= $signed($unsigned($unsigned(wire20[(2'h3):(2'h3)])));
      reg71 <= ({$unsigned($signed((reg58 != wire17)))} >>> reg62[(1'h1):(1'h1)]);
      if (((((wire49 ? (wire67 & (8'hbe)) : ((8'hbd) <<< wire68)) ?
          $unsigned($unsigned(reg51)) : wire18[(1'h0):(1'h0)]) > (8'hb5)) == (-wire14[(1'h1):(1'h1)])))
        begin
          reg72 <= reg61[(5'h11):(4'hd)];
          reg73 <= wire14[(1'h0):(1'h0)];
          if ($unsigned({($signed({reg51, wire26}) ?
                  (~|wire48) : $unsigned(wire20)),
              ($signed({reg60, wire66}) ?
                  $signed(wire49) : $signed($unsigned((8'ha3))))}))
            begin
              reg74 <= ($unsigned(($signed({reg59}) >>> ((wire45 ?
                          (8'ha3) : (8'hac)) ?
                      {reg63} : $unsigned(reg51)))) ?
                  ($signed((~(&reg61))) ?
                      $unsigned({reg58,
                          {(8'hb2),
                              wire49}}) : wire16[(3'h5):(1'h0)]) : (reg72[(4'h8):(4'h8)] ~^ (8'ha8)));
              reg75 <= {$signed(reg61), reg52[(4'hb):(2'h3)]};
            end
          else
            begin
              reg74 <= $unsigned(reg25[(4'he):(3'h4)]);
              reg75 <= reg50[(1'h0):(1'h0)];
              reg76 <= wire14[(3'h5):(2'h3)];
              reg77 <= $unsigned(reg70);
            end
        end
      else
        begin
          reg72 <= {$unsigned(wire49)};
          if ((~&wire20))
            begin
              reg73 <= ((($signed($signed(reg55)) ?
                  ((reg75 ? reg25 : reg72) ?
                      $signed(reg25) : (^reg24)) : (^~$signed(wire20))) >> (&(reg60[(4'ha):(4'ha)] ?
                  (wire68 >= wire16) : (^(8'ha5))))) || ($unsigned((^~$signed(reg59))) >> wire49[(2'h2):(1'h1)]));
              reg74 <= (8'hbe);
              reg75 <= $unsigned($unsigned(reg51));
              reg76 <= reg56;
            end
          else
            begin
              reg73 <= ($unsigned((7'h41)) + $signed(({reg61,
                  {reg63, wire20}} + reg24[(4'hb):(3'h7)])));
              reg74 <= reg25[(4'hd):(4'hb)];
              reg75 <= reg77;
            end
        end
      reg78 <= wire14;
    end
endmodule

module module27
#(parameter param43 = ((~((((8'hab) ? (8'ha5) : (8'h9c)) && ((8'hba) >>> (8'hba))) >>> {(~(8'haa))})) ^~ (((((8'hb3) ? (8'hbc) : (8'hb2)) ? ((8'h9c) ? (8'hb5) : (8'hb7)) : ((7'h40) ~^ (8'ha4))) && (((7'h43) | (8'h9c)) ? ((8'hbc) - (8'had)) : ((8'h9c) ? (8'hac) : (8'haa)))) ? (^~(~^{(8'hba), (8'h9c)})) : (((|(7'h43)) << (8'hb8)) ? (+{(8'hb3)}) : {((8'hbc) && (8'haf)), ((8'hbb) ? (8'hb2) : (8'ha5))}))), 
parameter param44 = ((~({param43} <<< ({param43, param43} ? (param43 < param43) : param43))) >> (-((~&((8'haf) <= param43)) ? (!(param43 - param43)) : param43))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire32;
  input wire signed [(4'h9):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire [(4'hc):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire33;
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire33,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = (wire31[(2'h3):(1'h0)] <<< ((~&$signed($unsigned((8'hba)))) ~^ $signed((wire32[(4'h8):(1'h1)] + ((8'hbc) ?
                      wire31 : wire29)))));
  always
    @(posedge clk) begin
      reg34 <= $signed(wire31);
      reg35 <= (($unsigned((8'haf)) ? (8'haa) : $signed({(^~wire30), wire29})) ?
          wire28[(4'h9):(3'h6)] : {wire32, wire32[(2'h3):(2'h3)]});
      reg36 <= (!(wire29 ^~ wire33));
      if ((^~($unsigned($unsigned({wire29})) ?
          (~^$unsigned(wire31)) : {(reg35[(4'h8):(3'h6)] ~^ {reg34}),
              wire31[(4'h9):(4'h8)]})))
        begin
          reg37 <= (wire30[(5'h12):(3'h6)] >= $signed($unsigned($signed($unsigned(wire30)))));
          reg38 <= ({(reg37[(4'hd):(1'h0)] || reg34[(3'h4):(1'h1)]),
                  (((reg37 <<< wire31) ?
                      (wire32 < (8'hb6)) : wire32[(4'he):(3'h5)]) | {(reg34 < reg34),
                      {wire32}})} ?
              (reg36 ? (~wire30) : reg37[(4'h8):(1'h0)]) : (8'ha7));
        end
      else
        begin
          reg37 <= {$unsigned($unsigned(($signed(wire31) ?
                  {wire33} : wire29)))};
          reg38 <= (^~(-wire28));
          reg39 <= $signed((((reg35[(3'h7):(2'h3)] ?
                  $signed(reg37) : (reg38 ? wire31 : wire32)) ?
              {$signed(wire28)} : $unsigned($signed(wire32))) & (wire28[(1'h1):(1'h1)] < wire28)));
        end
    end
  assign wire40 = (~$signed($signed({$unsigned(wire33), wire32})));
  assign wire41 = $signed((~|wire32[(4'h8):(4'h8)]));
  assign wire42 = reg34;
endmodule

module module89
#(parameter param125 = ((-(((-(8'ha4)) ? ((8'ha1) ? (8'h9d) : (8'h9d)) : ((8'h9d) ? (7'h40) : (8'hb6))) ^~ (((8'had) ? (8'ha8) : (7'h44)) << ((8'hab) ? (8'ha2) : (8'ha6))))) ? {(|(((8'hbe) ? (7'h43) : (8'h9e)) << ((8'hbf) << (8'had)))), (~^(~^(~^(8'h9c))))} : (^~(~|(^~(~&(8'hae)))))))
(y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire93;
  input wire signed [(5'h10):(1'h0)] wire92;
  input wire [(4'hd):(1'h0)] wire91;
  input wire [(3'h7):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire124;
  wire [(4'hc):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire108;
  wire [(4'ha):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire99;
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire120,
                 wire119,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire99,
                 reg122,
                 reg121,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg94 <= wire93;
      if ((^{{(&(wire91 ? wire90 : wire90))}, {reg94[(4'he):(1'h1)]}}))
        begin
          if ((wire90 ^ (8'hab)))
            begin
              reg95 <= {{$unsigned(wire93)}};
              reg96 <= (reg94[(4'he):(4'h8)] <<< wire91[(1'h0):(1'h0)]);
              reg97 <= ($signed(({$unsigned(wire92)} ?
                  reg96[(2'h2):(1'h0)] : (&((8'hb5) ?
                      reg95 : wire91)))) >= ((((~^wire93) - reg96[(3'h4):(2'h2)]) ?
                      $unsigned(wire93) : ((wire93 ?
                          (7'h40) : reg96) || (wire93 == wire92))) ?
                  (((+wire91) ?
                          reg95[(4'ha):(1'h0)] : (wire92 ? wire93 : wire90)) ?
                      (!reg95) : $signed(wire92)) : wire91[(4'hd):(4'h8)]));
              reg98 <= reg95[(4'ha):(2'h2)];
            end
          else
            begin
              reg95 <= ($signed(reg98[(2'h2):(2'h2)]) ?
                  $unsigned(wire91[(4'h8):(3'h7)]) : $signed({wire91[(4'hd):(4'hd)],
                      wire91[(4'hb):(4'ha)]}));
              reg96 <= reg95;
            end
        end
      else
        begin
          reg95 <= (-(wire91 < ($signed(reg98[(1'h0):(1'h0)]) & (~^wire90))));
          reg96 <= wire92;
          reg97 <= ($unsigned(reg95) ^~ wire92[(4'hb):(3'h4)]);
        end
    end
  assign wire99 = {($signed((reg98[(1'h0):(1'h0)] * (reg98 && reg96))) ~^ (($signed((8'h9f)) || wire93[(3'h4):(1'h0)]) ^~ (reg94[(3'h5):(1'h1)] != (~^reg96))))};
  always
    @(posedge clk) begin
      reg100 <= ($signed($signed({$signed(reg97)})) ^ (wire90 ?
          (wire92[(3'h7):(2'h2)] + ($unsigned(reg94) * (&reg95))) : {reg95[(3'h6):(2'h3)],
              ($signed(wire99) | $unsigned(wire91))}));
      reg101 <= (wire99 ?
          wire92 : {reg100[(1'h0):(1'h0)],
              ((wire90 & $signed(wire91)) ^~ $signed({(8'hbf)}))});
      if (((^~reg96) <<< (^{({reg95} ? {(8'hbd)} : (wire92 != wire93)),
          $signed((8'hab))})))
        begin
          reg102 <= (~^$signed(($unsigned((reg95 ? reg95 : reg97)) ?
              $signed(reg98) : reg94[(5'h10):(4'hf)])));
        end
      else
        begin
          reg102 <= $unsigned($signed(reg94));
          reg103 <= $unsigned(((reg95[(2'h3):(2'h3)] ?
                  $signed(wire90[(3'h6):(3'h6)]) : (|reg100[(1'h1):(1'h1)])) ?
              ({(^reg98),
                  (8'haa)} * {$unsigned(reg102)}) : $unsigned(($unsigned(reg98) ?
                  (7'h40) : (reg98 ^~ reg96)))));
        end
    end
  assign wire104 = (({$unsigned((^wire93)),
                           (reg103 ? (reg103 < reg96) : $unsigned(wire91))} ?
                       wire93 : $signed((-(reg103 ?
                           reg95 : reg95)))) && reg101);
  assign wire105 = ((~|(((reg97 ? wire90 : (8'hb7)) > (reg100 >> reg94)) ?
                           wire93[(3'h4):(1'h0)] : wire93)) ?
                       wire90[(1'h0):(1'h0)] : (^~$unsigned(reg98[(1'h1):(1'h0)])));
  assign wire106 = $unsigned(($signed($unsigned((reg100 << wire91))) ^ reg100));
  assign wire107 = reg100;
  assign wire108 = {$unsigned(($signed(reg97) + $signed((reg97 ?
                           wire104 : reg103)))),
                       $signed($signed(wire92))};
  assign wire109 = $signed((~&$unsigned($unsigned((~^reg97)))));
  assign wire110 = reg100;
  assign wire111 = $signed((8'hb9));
  always
    @(posedge clk) begin
      reg112 <= (&(^~reg103[(2'h2):(1'h0)]));
      reg113 <= (8'hb5);
      if ($unsigned($unsigned((8'hb5))))
        begin
          reg114 <= wire105;
          reg115 <= ($unsigned((~|(wire111[(1'h0):(1'h0)] >>> $signed(wire93)))) <= (~^wire99));
          if ((reg97[(4'ha):(1'h1)] != $signed(($signed(wire106[(3'h4):(2'h2)]) ^ (~^$signed(wire104))))))
            begin
              reg116 <= reg103[(4'h9):(1'h1)];
              reg117 <= {reg113};
            end
          else
            begin
              reg116 <= (+(8'hb7));
              reg117 <= $unsigned((|$unsigned((^~wire92[(4'he):(3'h6)]))));
            end
          reg118 <= $unsigned($unsigned($unsigned($signed($unsigned(reg102)))));
        end
      else
        begin
          reg114 <= ((wire91[(2'h3):(1'h0)] <= (wire90[(1'h1):(1'h1)] ?
                  (-$signed(wire109)) : $unsigned((reg95 ~^ reg102)))) ?
              $signed(reg114[(2'h2):(2'h2)]) : $signed(reg118));
          reg115 <= wire110;
        end
    end
  assign wire119 = $signed(reg94[(2'h3):(1'h1)]);
  assign wire120 = ($unsigned(reg98) ^~ (reg98 - reg103));
  always
    @(posedge clk) begin
      reg121 <= (wire105 > (({(wire109 ? wire104 : reg96)} ?
          reg96 : wire109) | (reg116[(4'hc):(1'h1)] - {((8'ha2) || wire107),
          $unsigned(wire104)})));
      reg122 <= $unsigned(wire108);
    end
  assign wire123 = {(!reg103[(4'ha):(3'h5)])};
  assign wire124 = {reg97[(3'h7):(3'h6)],
                       ($unsigned(wire109) ? wire107[(3'h5):(3'h4)] : reg97)};
endmodule
