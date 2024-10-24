module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire182;
  wire signed [(4'ha):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire180;
  wire signed [(3'h6):(1'h0)] wire173;
  wire [(5'h11):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire171;
  wire [(5'h14):(1'h0)] wire175;
  wire [(2'h3):(1'h0)] wire176;
  wire [(3'h4):(1'h0)] wire177;
  wire signed [(4'hc):(1'h0)] wire178;
  reg [(5'h14):(1'h0)] reg184 = (1'h0);
  reg [(3'h7):(1'h0)] reg183 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire173,
                 wire46,
                 wire48,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire75,
                 wire171,
                 wire175,
                 wire176,
                 wire177,
                 wire178,
                 reg184,
                 reg183,
                 reg49,
                 reg50,
                 reg51,
                 (1'h0)};
  module4 #() modinst47 (wire46, clk, wire2, wire0, wire1, wire3);
  assign wire48 = {{{wire2[(2'h3):(2'h2)], $unsigned(wire46[(4'ha):(4'h8)])},
                          $unsigned((-(wire2 ? wire3 : wire3)))}};
  always
    @(posedge clk) begin
      reg49 <= $signed(wire46[(1'h1):(1'h1)]);
      reg50 <= wire48[(4'hd):(4'hb)];
      reg51 <= (^wire3[(5'h11):(5'h11)]);
    end
  assign wire52 = {$signed({((~^reg49) >> (reg51 ? (8'ha4) : wire48)),
                          (~&{(7'h40)})})};
  assign wire53 = reg50;
  assign wire54 = ($signed(((~&$signed((8'ha4))) ?
                      (8'ha7) : $unsigned(wire52))) + ((~(|$signed(wire46))) ?
                      reg51[(2'h2):(1'h1)] : ((|$signed(wire1)) ~^ ((wire53 - wire48) ?
                          $signed(wire3) : reg50[(1'h0):(1'h0)]))));
  assign wire55 = wire3;
  assign wire56 = $unsigned({{wire53}});
  assign wire57 = {(^(~&$unsigned({reg51})))};
  assign wire58 = wire54[(1'h1):(1'h1)];
  assign wire59 = (!wire56);
  module60 #() modinst76 (.wire65(wire52), .wire64(wire46), .y(wire75), .wire62(reg51), .wire63(wire3), .clk(clk), .wire61(wire56));
  module77 #() modinst172 (wire171, clk, wire0, wire2, wire58, wire52, wire57);
  module85 #() modinst174 (.wire89(wire46), .wire86(wire53), .wire87(wire59), .wire88(reg49), .clk(clk), .y(wire173));
  assign wire175 = $signed($unsigned((wire55 ?
                       $unsigned((reg50 ^~ (8'hb4))) : (~&(~^wire173)))));
  assign wire176 = $unsigned((8'hba));
  assign wire177 = $unsigned($unsigned(wire2));
  module85 #() modinst179 (.clk(clk), .wire86(wire54), .y(wire178), .wire89(wire1), .wire87(reg49), .wire88(wire48));
  assign wire180 = ({(-wire55[(1'h1):(1'h0)])} >= wire3);
  assign wire181 = (8'hb9);
  assign wire182 = $unsigned(wire58);
  always
    @(posedge clk) begin
      reg183 <= wire2;
      reg184 <= wire58[(3'h6):(3'h5)];
    end
endmodule

module module77
#(parameter param170 = (({(!((8'ha5) <<< (8'hb8)))} >> (((|(8'ha6)) * ((8'hb2) ? (8'hbb) : (8'h9d))) ? {((8'hbf) >>> (8'hbf)), (8'ha9)} : {((8'hae) ? (8'hae) : (8'ha0))})) & (&(&{((8'ha1) & (8'ha4)), ((8'hb7) ? (8'h9e) : (8'ha5))}))))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire82;
  input wire signed [(5'h13):(1'h0)] wire81;
  input wire signed [(4'hd):(1'h0)] wire80;
  input wire [(5'h10):(1'h0)] wire79;
  input wire signed [(4'h9):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire169;
  wire [(2'h3):(1'h0)] wire154;
  wire signed [(4'hb):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire150;
  wire signed [(4'hb):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire148;
  wire [(4'he):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire146;
  reg signed [(4'ha):(1'h0)] reg168 = (1'h0);
  reg [(2'h3):(1'h0)] reg167 = (1'h0);
  reg [(5'h12):(1'h0)] reg166 = (1'h0);
  reg [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(3'h5):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(3'h6):(1'h0)] reg162 = (1'h0);
  reg [(4'hb):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg [(5'h14):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(4'h9):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  assign y = {wire169,
                 wire154,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire121,
                 wire83,
                 wire146,
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
                 reg153,
                 reg84,
                 (1'h0)};
  assign wire83 = (wire82[(2'h2):(2'h2)] ? wire81[(5'h10):(4'hf)] : wire78);
  always
    @(posedge clk) begin
      reg84 <= wire81[(4'hf):(4'hd)];
    end
  module85 #() modinst122 (.wire89(wire80), .clk(clk), .wire86(wire83), .wire87(reg84), .wire88(wire79), .y(wire121));
  module123 #() modinst147 (.y(wire146), .wire124(wire121), .wire125(wire79), .clk(clk), .wire128(wire78), .wire126(wire83), .wire127(wire82));
  assign wire148 = (wire83[(3'h5):(1'h1)] >> {$signed(($unsigned(reg84) ?
                           (wire79 ~^ wire121) : wire83)),
                       $unsigned((!(wire79 >> wire82)))});
  assign wire149 = $signed(wire80);
  assign wire150 = $signed((reg84[(4'h9):(3'h4)] ?
                       wire83[(1'h1):(1'h0)] : wire148));
  assign wire151 = reg84[(4'hc):(1'h1)];
  assign wire152 = wire83;
  always
    @(posedge clk) begin
      reg153 <= $unsigned($unsigned($signed(reg84)));
    end
  assign wire154 = $unsigned(((((|wire79) ?
                       (wire149 << (8'ha9)) : (wire148 ?
                           reg84 : wire148)) == (7'h41)) && {(-$unsigned((8'h9c))),
                       wire82[(1'h1):(1'h1)]}));
  always
    @(posedge clk) begin
      if (wire82[(2'h2):(2'h2)])
        begin
          reg155 <= ((~(wire78[(1'h0):(1'h0)] <= wire150)) ~^ $signed($signed(((~|(8'hb2)) ?
              $unsigned(wire152) : $unsigned(wire82)))));
          if ($unsigned((wire80 ?
              (~|((~|reg84) ?
                  wire79[(2'h3):(1'h1)] : $unsigned(reg84))) : reg84)))
            begin
              reg156 <= (($unsigned({wire78[(3'h6):(1'h1)],
                  $unsigned(wire151)}) * (wire83 ?
                  {(&reg84), (wire83 << (7'h43))} : (wire121[(4'h8):(2'h3)] ?
                      $unsigned(wire82) : wire80[(4'h9):(2'h2)]))) < (((~^(reg155 ?
                          (8'hb5) : wire151)) ?
                      (reg155 || (~(8'hbe))) : (wire83 > (~&wire121))) ?
                  $signed({$unsigned(wire148),
                      (~^wire151)}) : $signed((reg153[(4'h9):(3'h4)] >> (wire83 ?
                      wire121 : wire82)))));
              reg157 <= {($signed(({reg84} ?
                          $unsigned(wire154) : ((8'ha3) < reg156))) ?
                      (&($signed(reg156) ?
                          (~|reg155) : $unsigned((8'hb0)))) : $signed(((wire152 ?
                              wire82 : wire152) ?
                          $unsigned(reg155) : {reg155, wire78})))};
              reg158 <= (reg155[(2'h3):(2'h2)] ?
                  (((-$signed(wire150)) & $signed($signed(reg155))) != wire154[(2'h2):(1'h0)]) : wire83[(1'h0):(1'h0)]);
              reg159 <= $signed(($unsigned(((reg155 < reg155) + $unsigned(reg157))) ?
                  (((reg84 ? wire79 : wire121) & $signed(wire149)) ?
                      (~^$unsigned(reg157)) : {reg155,
                          wire81[(4'hc):(4'hb)]}) : wire82[(4'hd):(2'h2)]));
              reg160 <= reg156;
            end
          else
            begin
              reg156 <= $signed(reg157[(2'h2):(1'h1)]);
              reg157 <= (reg155[(2'h3):(2'h2)] ?
                  (^$signed(($signed(wire82) < (reg155 && wire152)))) : reg159);
              reg158 <= ((&(+wire152[(4'hb):(2'h2)])) - reg153);
              reg159 <= ({wire154,
                  (^~($signed(wire82) >= $signed(wire81)))} && wire148[(5'h11):(3'h7)]);
            end
          reg161 <= (^(-($unsigned((~|reg160)) | $unsigned((wire150 * reg157)))));
        end
      else
        begin
          reg155 <= wire83;
          reg156 <= wire154;
          reg157 <= wire79;
          reg158 <= $unsigned($signed($unsigned(reg84[(4'h9):(2'h3)])));
        end
      if ($unsigned({reg153}))
        begin
          reg162 <= ($signed($signed(wire80[(4'h9):(1'h1)])) ?
              (7'h41) : ($signed($signed((wire150 ~^ (7'h42)))) ?
                  $signed($signed($unsigned(wire81))) : {$signed((~|wire149))}));
          reg163 <= ($unsigned($signed(wire78)) & {(+(^(reg157 ?
                  reg155 : wire80))),
              ({$signed(wire154)} ?
                  $unsigned(((8'ha4) << wire78)) : {$signed(reg157)})});
        end
      else
        begin
          reg162 <= (^~(^~({(8'haa),
              ((7'h40) ? wire121 : (8'h9c))} - (-$unsigned((8'hb7))))));
          reg163 <= reg155;
          reg164 <= wire151;
          reg165 <= $signed(reg153[(1'h1):(1'h0)]);
          reg166 <= (^~(wire150 ?
              {{reg156[(2'h2):(1'h0)],
                      (^~reg164)}} : (reg157[(4'hc):(3'h4)] < reg165[(4'ha):(4'h9)])));
        end
      reg167 <= ($unsigned(wire150) + (~|$unsigned(reg165)));
      reg168 <= {(8'hbf)};
    end
  assign wire169 = ((reg160[(1'h1):(1'h0)] ?
                           (~|reg159) : $signed($signed(wire83[(3'h7):(2'h3)]))) ?
                       wire81 : (|{(8'ha5),
                           ((reg159 >= wire78) * $signed(wire121))}));
endmodule

module module60
#(parameter param74 = ((((((8'hb4) ? (8'ha6) : (8'hba)) << {(8'ha9), (8'hbf)}) ? {((8'hba) ? (8'ha9) : (8'hb8)), ((8'hbc) ? (8'hb3) : (8'ha4))} : (^{(8'h9c), (8'hb9)})) ? ((8'hb8) >> ((&(8'ha3)) <= {(7'h43), (8'hac)})) : (({(8'haa)} ? ((8'hbc) ^ (8'ha5)) : (~(8'ha6))) || (~|((8'haa) * (8'hae))))) <<< (-(8'h9f))))
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire65;
  input wire [(5'h10):(1'h0)] wire64;
  input wire [(2'h2):(1'h0)] wire63;
  input wire signed [(3'h4):(1'h0)] wire62;
  input wire signed [(2'h3):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg66 <= {$unsigned((^($unsigned((8'haa)) ?
              $unsigned(wire63) : wire64)))};
      reg67 <= {($signed(wire62) | $unsigned(($signed(wire65) ?
              wire61 : wire63))),
          (wire61[(1'h1):(1'h1)] ?
              (^($unsigned(wire63) * ((8'hb9) >> wire61))) : $unsigned($unsigned(wire65[(2'h2):(1'h1)])))};
      reg68 <= reg67;
    end
  assign wire69 = (-$signed(reg66));
  assign wire70 = wire69[(2'h2):(1'h1)];
  assign wire71 = (reg67[(4'h9):(1'h0)] >>> (8'hae));
  assign wire72 = wire64;
  assign wire73 = $signed({(reg66[(4'h9):(3'h7)] ?
                          $signed(wire64[(2'h3):(1'h1)]) : (wire70 << (reg66 != wire62)))});
endmodule

module module4
#(parameter param45 = (((({(8'hb9)} ~^ ((8'hac) ? (8'hb9) : (8'hb5))) ? (((8'ha9) ? (8'ha1) : (8'haa)) & ((8'hbb) * (8'h9f))) : (((8'had) ? (8'hba) : (8'h9e)) != (~(8'ha1)))) >> (8'haf)) <= (&{(~{(8'ha5)}), ({(8'ha2), (7'h44)} & ((8'hb4) ? (8'ha8) : (8'hbb)))})))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire9;
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  assign y = {wire39,
                 wire25,
                 wire23,
                 wire9,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire9 = wire8[(1'h1):(1'h1)];
  module10 #() modinst24 (.wire14(wire7), .wire11(wire5), .wire12(wire9), .wire13(wire8), .y(wire23), .clk(clk));
  assign wire25 = (~&$signed($signed(wire8[(3'h5):(3'h5)])));
  always
    @(posedge clk) begin
      if (wire25[(4'h8):(3'h4)])
        begin
          reg26 <= {($unsigned(($unsigned(wire6) ?
                  (8'had) : (^wire6))) ^ (((wire25 ?
                  wire25 : wire25) >>> {wire9}) + ($unsigned((8'ha4)) ?
                  wire9 : $signed((8'hab)))))};
          reg27 <= ($signed(wire9) ~^ (~&$unsigned(wire6[(4'hd):(4'hd)])));
          if (($signed((wire25[(5'h14):(1'h0)] ?
                  ({(8'ha3)} ?
                      $signed((8'hbf)) : wire23[(3'h5):(2'h2)]) : (wire8[(3'h4):(2'h2)] ?
                      (8'hbc) : wire23))) ?
              ($unsigned(reg26[(3'h7):(2'h3)]) ?
                  (!{$unsigned(wire5)}) : $signed(wire8)) : wire9))
            begin
              reg28 <= (^~wire6);
              reg29 <= {(-(reg27[(2'h2):(1'h0)] ?
                      (^wire6[(4'hd):(1'h1)]) : $unsigned((^~wire6))))};
            end
          else
            begin
              reg28 <= (wire23 ?
                  ((($unsigned(wire25) ?
                          (wire6 == reg27) : (^(7'h44))) == ($signed(wire7) + $signed(reg26))) ?
                      wire7 : wire23[(3'h5):(1'h1)]) : {(wire5 ?
                          $unsigned(wire9) : ((~|wire7) ?
                              wire25 : (wire6 <<< wire9)))});
              reg29 <= reg29;
              reg30 <= (((~^wire8[(2'h2):(1'h0)]) ?
                      $unsigned(reg27[(1'h0):(1'h0)]) : (((wire23 ?
                                  wire23 : wire25) ?
                              (-wire6) : (wire8 + (8'ha7))) ?
                          (8'ha6) : wire5[(2'h2):(2'h2)])) ?
                  wire5[(4'hd):(4'hb)] : $unsigned($signed(wire7)));
              reg31 <= $unsigned({wire25});
              reg32 <= (-((^(~&$unsigned(reg30))) == ({{reg26, (8'ha0)}} ?
                  wire7[(1'h0):(1'h0)] : (((8'h9c) ? reg29 : reg30) ?
                      (8'hb6) : reg30))));
            end
          reg33 <= wire9[(2'h3):(1'h1)];
          if ((8'hae))
            begin
              reg34 <= reg27;
              reg35 <= $unsigned(reg32[(3'h7):(1'h1)]);
              reg36 <= reg31;
              reg37 <= ((reg32 ? {wire7[(4'he):(3'h7)]} : (+{reg28})) ?
                  $unsigned((wire9 == ((wire8 ^ reg36) ?
                      (-reg28) : reg30))) : (^reg26[(3'h6):(1'h1)]));
            end
          else
            begin
              reg34 <= $signed((8'hb2));
            end
        end
      else
        begin
          reg26 <= wire25[(5'h11):(4'h9)];
          reg27 <= $unsigned(wire8[(2'h3):(1'h0)]);
          if ({$signed(reg30)})
            begin
              reg28 <= (^$signed(reg33[(4'h8):(3'h6)]));
              reg29 <= (wire9[(3'h4):(2'h2)] + (-$unsigned(wire8)));
              reg30 <= ({($unsigned((reg35 ^~ wire5)) ?
                          reg35 : ((!reg36) != $unsigned(reg36))),
                      $unsigned($unsigned((reg26 ? reg27 : wire7)))} ?
                  (~&(wire7 >>> $unsigned(wire5[(1'h1):(1'h0)]))) : reg32[(3'h6):(2'h3)]);
            end
          else
            begin
              reg28 <= wire6;
              reg29 <= ($unsigned({(8'hb0), (~^(~|reg34))}) + reg27);
              reg30 <= ({(reg31 ?
                      ((reg34 ?
                          reg34 : reg33) == reg34[(1'h1):(1'h1)]) : $unsigned(reg32))} ^ $signed($unsigned((~&(+reg29)))));
            end
        end
      reg38 <= reg28[(2'h2):(1'h1)];
    end
  assign wire39 = $unsigned((8'hac));
  always
    @(posedge clk) begin
      reg40 <= (+(&($signed((wire5 ? reg36 : reg38)) << {wire23,
          reg33[(1'h1):(1'h0)]})));
      reg41 <= $unsigned(reg32);
      reg42 <= (~{wire8});
      reg43 <= wire8[(3'h7):(2'h3)];
      reg44 <= (reg41[(3'h4):(1'h1)] ?
          ({{(^~reg42), {wire39}}} ?
              reg37[(2'h2):(1'h0)] : $signed($unsigned((wire39 ?
                  reg38 : reg40)))) : reg30[(1'h1):(1'h0)]);
    end
endmodule

module module10
#(parameter param22 = (~&(^((((8'ha4) ? (7'h42) : (8'hbc)) || ((8'h9c) >> (8'ha5))) ? (|(8'h9d)) : (|((8'ha9) ? (8'haa) : (8'hbc)))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  assign y = {wire21, wire20, wire19, wire18, wire17, wire16, wire15, (1'h0)};
  assign wire15 = wire14[(2'h3):(1'h1)];
  assign wire16 = (~^$unsigned({(((8'hba) ?
                          wire14 : (8'ha4)) * $unsigned(wire11)),
                      (~((8'hbb) < wire15))}));
  assign wire17 = ((~$unsigned($unsigned((wire13 - wire12)))) < (({wire14[(4'h8):(2'h3)],
                              (|wire11)} ?
                          ({wire12, wire15} << {(8'hbd)}) : $signed(((8'hbd) ?
                              wire13 : wire15))) ?
                      ($signed($signed(wire16)) ?
                          $signed((wire12 ?
                              wire11 : wire15)) : $unsigned((wire14 ?
                              wire12 : wire16))) : ((|$unsigned((8'ha7))) ?
                          ((~wire11) ^~ wire16[(1'h0):(1'h0)]) : ({wire11,
                              wire13} <= wire13[(3'h4):(3'h4)]))));
  assign wire18 = wire17[(4'he):(4'hd)];
  assign wire19 = wire12;
  assign wire20 = ((wire11[(2'h3):(1'h0)] <= (((wire16 >= wire19) ?
                      (wire19 ?
                          wire14 : wire12) : (|wire13)) * $signed((wire19 + (8'ha6))))) ^ $unsigned({$signed($unsigned(wire18)),
                      (((8'hb7) < wire17) >> (wire16 ? wire14 : wire16))}));
  assign wire21 = ((($signed((wire19 >> wire12)) > wire12) ?
                          (~({wire17} ?
                              $signed(wire19) : wire13)) : ($signed((wire14 ?
                              wire14 : wire13)) < $signed(wire18))) ?
                      (8'hbf) : $unsigned(($signed({wire12, wire20}) ?
                          {(wire20 ? wire15 : wire17),
                              wire18} : wire15[(3'h6):(2'h2)])));
endmodule

module module123
#(parameter param145 = (((((8'hb8) | ((7'h41) * (8'ha8))) >= (((8'h9e) ? (8'hba) : (8'hae)) ? {(8'h9f), (8'hbf)} : ((8'h9f) ? (8'ha9) : (8'h9d)))) ? (({(8'ha0), (8'h9f)} ^ (+(8'ha4))) && (((8'hae) != (8'ha0)) ? (~(7'h42)) : ((8'hbe) ^~ (8'hb5)))) : ({(!(8'h9e)), ((8'hbb) + (8'ha3))} | (+((8'ha4) ^~ (8'ha1))))) & ({((^(8'ha2)) >= (&(8'hb3)))} >= (((8'ha7) + (!(8'ha3))) ? {{(8'hb0)}} : ({(8'hbe)} >>> ((8'hae) + (8'haf)))))))
(y, clk, wire128, wire127, wire126, wire125, wire124);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire128;
  input wire signed [(4'hd):(1'h0)] wire127;
  input wire [(4'h8):(1'h0)] wire126;
  input wire [(3'h7):(1'h0)] wire125;
  input wire [(4'he):(1'h0)] wire124;
  wire signed [(4'hd):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire143;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire132;
  wire [(4'h9):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire129;
  reg signed [(4'hd):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire129 = (^~wire125);
  assign wire130 = ((wire128[(3'h7):(2'h2)] ~^ $signed(wire126)) ^ (8'ha2));
  assign wire131 = wire129;
  assign wire132 = $signed(wire126);
  always
    @(posedge clk) begin
      reg133 <= (wire124 == $unsigned($unsigned($unsigned($unsigned(wire132)))));
    end
  always
    @(posedge clk) begin
      reg134 <= $unsigned(wire129[(3'h6):(2'h3)]);
      reg135 <= (({(wire128[(1'h1):(1'h0)] ?
                  (wire124 < (8'ha5)) : $signed(wire129))} ?
          (~$unsigned((wire129 & wire125))) : wire131[(1'h1):(1'h1)]) ^~ wire128[(3'h6):(3'h4)]);
      if (({reg135[(1'h0):(1'h0)]} ?
          $signed($signed((^$signed(wire127)))) : ($signed(reg134[(4'ha):(3'h4)]) && $signed((((8'ha9) <<< wire131) ?
              (7'h41) : (^~(8'haa)))))))
        begin
          if ($signed(wire132[(1'h1):(1'h1)]))
            begin
              reg136 <= ({wire124, (|{(reg133 ? wire131 : wire127)})} ?
                  wire131[(1'h1):(1'h1)] : {wire127[(4'h9):(3'h4)]});
              reg137 <= $signed(((!($signed(reg136) ?
                  ((8'hac) ? wire128 : reg135) : ((8'hb5) ?
                      wire129 : reg135))) >= $unsigned(($unsigned(reg134) ^ {wire132}))));
              reg138 <= ((($unsigned(wire124[(3'h4):(1'h0)]) << (+(8'ha4))) ?
                      $signed((^(wire131 ?
                          wire126 : wire127))) : ($signed(wire128) == $unsigned($unsigned(reg136)))) ?
                  (^(^(~|wire128[(3'h6):(2'h2)]))) : (reg134[(1'h0):(1'h0)] <<< $signed($signed(((8'hb6) & reg135)))));
            end
          else
            begin
              reg136 <= {reg134};
              reg137 <= (~^wire128[(2'h2):(1'h0)]);
            end
        end
      else
        begin
          if ((+(~^(~&(reg133[(3'h4):(2'h2)] >= (reg137 != wire132))))))
            begin
              reg136 <= (reg137[(5'h14):(4'hf)] ?
                  (-$unsigned(wire128)) : ((-(reg134 ?
                          $signed(wire132) : (wire125 ? reg133 : wire132))) ?
                      (wire125[(3'h4):(3'h4)] > $signed(((8'ha6) <<< (8'hb3)))) : (wire128[(2'h3):(2'h3)] != ((~wire124) <= $unsigned(reg138)))));
              reg137 <= $unsigned(reg135);
              reg138 <= (wire124 && wire126[(3'h7):(3'h7)]);
              reg139 <= (wire132 ?
                  $unsigned($unsigned((^{reg137,
                      reg137}))) : $unsigned($unsigned((!wire127[(3'h4):(1'h1)]))));
              reg140 <= (^($signed((|(wire128 * wire129))) != {(((8'hb3) & (8'hb6)) ?
                      (+reg134) : $unsigned((8'hb4)))}));
            end
          else
            begin
              reg136 <= {($unsigned({reg134[(4'h9):(4'h9)]}) ?
                      wire125[(1'h1):(1'h1)] : {$signed((-reg137)),
                          $unsigned((wire126 ? (8'hbf) : wire132))}),
                  (|reg135)};
            end
          reg141 <= ((reg135[(1'h1):(1'h1)] ?
                  ($unsigned((~&reg140)) | $unsigned(wire124)) : (~^wire128)) ?
              reg140[(3'h4):(2'h3)] : $signed((8'hbf)));
        end
    end
  assign wire142 = $signed(($signed(reg133[(4'h8):(3'h7)]) ?
                       (((!reg137) ?
                           wire124 : (-wire125)) && $unsigned((~|wire125))) : wire125[(3'h7):(2'h3)]));
  assign wire143 = (((((^reg137) ?
                       wire129 : {wire142,
                           wire124}) + {$unsigned(wire132)}) && $signed($unsigned((&wire142)))) == (~^({$unsigned(wire129),
                       (wire128 != reg136)} ^~ (^$unsigned(wire142)))));
  assign wire144 = $unsigned(($signed(wire127[(3'h6):(3'h5)]) ?
                       ((~$unsigned(wire127)) ?
                           $unsigned(reg135[(3'h4):(3'h4)]) : $unsigned((+wire132))) : wire129));
endmodule

module module85
#(parameter param119 = (({(((8'hab) << (8'ha0)) ? ((8'hae) ? (8'hb2) : (8'ha3)) : (^(8'hb6)))} ? ((^(~(7'h44))) ? ((8'haf) ? (~&(8'hac)) : {(8'hbf), (8'hac)}) : ((!(8'h9c)) ? ((8'hb7) >>> (8'h9d)) : ((8'hb7) ? (7'h43) : (8'ha6)))) : (+{(-(8'had))})) ^ (^~(!(~&((8'hb0) | (8'hb5)))))), 
parameter param120 = {((param119 ? (!(~^param119)) : (|(param119 - param119))) ? param119 : {(((7'h43) | param119) >= (param119 ? (8'hb5) : param119))}), ((({param119, param119} ~^ (param119 <= param119)) ? (|{param119, param119}) : param119) & (((param119 ? param119 : param119) < (param119 ? param119 : param119)) >> (8'hb7)))})
(y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire89;
  input wire [(4'hd):(1'h0)] wire88;
  input wire signed [(5'h12):(1'h0)] wire87;
  input wire [(2'h2):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire118;
  wire signed [(4'hf):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire95;
  wire [(3'h7):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire signed [(5'h10):(1'h0)] wire90;
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(5'h12):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  assign y = {wire118,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 reg117,
                 reg116,
                 reg115,
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
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire90 = wire86;
  assign wire91 = $unsigned(($unsigned(($signed(wire87) ?
                      $signed(wire87) : ((7'h44) <<< wire86))) ~^ $unsigned(wire89)));
  assign wire92 = ($signed((wire89[(4'ha):(3'h5)] ?
                          $signed((-wire90)) : wire86[(2'h2):(1'h1)])) ?
                      (-wire87[(4'hf):(3'h4)]) : {(|($unsigned(wire91) - wire86))});
  assign wire93 = $signed((7'h42));
  assign wire94 = (($unsigned((-$signed(wire90))) || wire87[(5'h12):(3'h5)]) ?
                      (+wire88[(2'h2):(2'h2)]) : wire92);
  assign wire95 = $signed((wire91 ?
                      $unsigned($unsigned($unsigned(wire90))) : (~|(^$signed((8'h9f))))));
  assign wire96 = $signed((wire92 ?
                      (((wire90 >> (8'hb8)) >>> $signed(wire88)) > wire94) : (8'hbe)));
  always
    @(posedge clk) begin
      if ((((((wire88 ? wire90 : wire90) ^~ (wire92 ?
              wire94 : wire90)) & ((wire86 ? wire87 : (7'h42)) + (wire96 ?
              wire87 : wire88))) ?
          (~&(~|wire93[(2'h2):(2'h2)])) : ({wire96} && $unsigned($unsigned(wire93)))) && {$signed($signed((wire89 ?
              wire94 : wire92)))}))
        begin
          reg97 <= $signed($unsigned(wire88[(4'h8):(2'h2)]));
          reg98 <= reg97[(3'h4):(1'h1)];
          reg99 <= (wire87 ?
              $signed(((&wire96[(1'h1):(1'h0)]) ?
                  ((^wire90) ? reg98 : wire93) : wire88)) : (!(&wire96)));
          if ({$unsigned(reg98)})
            begin
              reg100 <= $unsigned(((wire88 | reg97[(3'h4):(1'h1)]) && (wire92 >> {(wire90 ~^ wire88),
                  wire94[(3'h5):(2'h2)]})));
              reg101 <= ($unsigned((wire91[(4'hb):(3'h4)] ?
                  wire93[(1'h0):(1'h0)] : $unsigned($signed(wire91)))) ^ (wire95 ?
                  (^~$signed((wire92 + wire94))) : (+($signed(reg100) << (reg98 ?
                      wire93 : (8'hb2))))));
              reg102 <= $signed((8'ha5));
            end
          else
            begin
              reg100 <= $signed(wire90);
            end
        end
      else
        begin
          reg97 <= $unsigned(($unsigned(((wire93 ? reg99 : wire91) || reg100)) ?
              reg99 : (^((!reg99) && $signed(wire95)))));
          reg98 <= (^~reg97);
          reg99 <= $unsigned((8'hb4));
          reg100 <= $unsigned(wire88);
        end
    end
  always
    @(posedge clk) begin
      reg103 <= wire87[(5'h12):(5'h10)];
      if ((reg103 ^~ (reg103[(4'h9):(1'h1)] ?
          $signed((8'haa)) : {(reg97 ^ wire87[(3'h6):(3'h4)])})))
        begin
          reg104 <= wire94[(1'h1):(1'h0)];
          reg105 <= ($signed($unsigned(reg102)) ?
              (~&wire86[(2'h2):(1'h0)]) : $unsigned($signed(reg104)));
          reg106 <= (&(8'hae));
          reg107 <= (wire96[(1'h0):(1'h0)] ~^ ((wire89[(4'ha):(3'h7)] ?
              wire88[(3'h6):(1'h0)] : ((8'hb0) ?
                  wire94 : (wire86 ?
                      wire87 : wire89))) == $signed($unsigned((reg103 ?
              reg101 : wire86)))));
          if (((!(+($signed(wire96) ? reg100 : $signed(wire95)))) ~^ wire89))
            begin
              reg108 <= (((~^wire93) <= {((~&reg97) ?
                          (~|wire90) : (~^wire90))}) ?
                  (!reg103[(3'h4):(1'h0)]) : $signed((reg101 ?
                      $unsigned($signed(wire96)) : reg102)));
              reg109 <= ({$signed(reg108),
                  $signed((wire96 ~^ wire96[(4'he):(4'h9)]))} <= wire96[(3'h6):(1'h1)]);
            end
          else
            begin
              reg108 <= {(~^(wire95 >>> $unsigned(reg97[(3'h4):(1'h1)])))};
              reg109 <= {(~|(8'ha3))};
              reg110 <= $signed((reg100 != $signed((reg97[(1'h0):(1'h0)] ?
                  $unsigned(wire94) : (wire88 >= reg109)))));
              reg111 <= $unsigned((((8'hb6) * reg99) ?
                  reg98[(3'h7):(3'h5)] : $unsigned((&$unsigned(reg110)))));
              reg112 <= (wire92[(2'h2):(1'h1)] <<< $signed({((reg105 ?
                      wire93 : reg98) >>> (+wire96)),
                  (8'ha8)}));
            end
        end
      else
        begin
          reg104 <= {($unsigned($unsigned((reg107 && (8'hb0)))) * ((wire89[(4'hb):(1'h0)] ?
                  ((8'hbd) ^~ reg101) : {wire92}) + (!$signed(reg108))))};
        end
      if ($signed(wire87[(5'h12):(2'h3)]))
        begin
          if (wire92)
            begin
              reg113 <= $unsigned(wire91[(1'h0):(1'h0)]);
              reg114 <= ({wire96} ^ reg110[(4'hd):(4'ha)]);
              reg115 <= reg111;
            end
          else
            begin
              reg113 <= $signed((^~reg97));
            end
          reg116 <= ($unsigned($signed({(~&reg114),
              reg113[(1'h1):(1'h1)]})) << (|$unsigned(((~|(8'h9c)) ?
              (-wire96) : {(8'hb2)}))));
          reg117 <= reg107[(1'h1):(1'h0)];
        end
      else
        begin
          reg113 <= reg109;
          reg114 <= ((reg97 ?
              ($signed((reg100 > reg97)) ?
                  ((wire89 * (8'hbf)) - (wire92 ?
                      reg117 : reg97)) : reg117[(4'h8):(3'h5)]) : {(-{reg97})}) ^~ ({($unsigned(reg114) ?
                      reg106 : ((8'hbc) ? reg97 : wire88))} ?
              (~^reg98) : reg107));
          reg115 <= $unsigned($unsigned(($unsigned(((8'hbb) ? reg106 : reg98)) ?
              ((~|reg111) ?
                  (wire89 > wire95) : $unsigned(wire87)) : ($signed(reg113) ?
                  (reg114 ? reg101 : reg106) : (reg113 >>> (8'ha1))))));
          reg116 <= wire86;
        end
    end
  assign wire118 = reg100;
endmodule
