module top
#(parameter param84 = {({(((8'hb7) ? (8'hae) : (8'ha0)) >> ((8'hae) ? (8'haf) : (7'h43)))} ? ((!(!(8'hb5))) ^ {((7'h43) && (8'ha0)), ((8'hab) < (8'hbf))}) : ((((8'hb6) ? (8'hb2) : (8'hb0)) ? ((8'haf) + (8'hbe)) : (~(8'ha9))) ^ (((8'hb3) ^~ (8'hbd)) != {(8'haf), (8'ha3)})))}, 
parameter param85 = (param84 ? (!{(~^(param84 ? param84 : param84)), (param84 ? param84 : param84)}) : (((&(param84 ? param84 : param84)) ? {{(8'hbc)}} : {((8'hbb) ? param84 : (7'h42))}) ? (8'ha7) : (~&(|(param84 ? param84 : param84))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire73;
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire76,
                 wire75,
                 wire5,
                 wire6,
                 wire7,
                 wire73,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire5 = $signed(wire1[(1'h1):(1'h0)]);
  assign wire6 = wire5[(3'h6):(1'h1)];
  assign wire7 = ($signed(wire3[(5'h13):(1'h0)]) <<< $signed(wire5));
  module8 #() modinst74 (.wire11(wire1), .wire13(wire3), .wire10(wire5), .y(wire73), .clk(clk), .wire9(wire0), .wire12(wire7));
  assign wire75 = (wire2[(5'h11):(2'h3)] ?
                      (wire7 ?
                          ((8'hb9) - $unsigned($signed((8'hb7)))) : $signed((&wire0[(4'hc):(3'h5)]))) : (-(|wire1[(4'hc):(2'h2)])));
  assign wire76 = ((((+(wire5 ? wire2 : wire6)) && ($unsigned(wire3) ?
                              {wire5, wire75} : wire6[(4'ha):(3'h7)])) ?
                          $unsigned((^~wire4)) : wire3) ?
                      wire6 : $unsigned((~^($signed(wire0) ?
                          $unsigned(wire1) : (~wire2)))));
  always
    @(posedge clk) begin
      reg77 <= wire2;
      reg78 <= ($signed(({$signed(wire7)} ?
          ($signed(wire6) & $unsigned((8'ha0))) : reg77)) < (wire75 > (8'hac)));
    end
  assign wire79 = ((wire0 == wire76) + $signed($unsigned((wire4[(2'h2):(2'h2)] + $signed(reg78)))));
  assign wire80 = (~(-wire4));
  assign wire81 = {{$signed(((reg77 ? wire76 : (8'hb6)) ^~ (wire5 ?
                              wire76 : wire80)))},
                      (($signed($unsigned(wire3)) >= $unsigned($unsigned((8'hbf)))) ?
                          reg77[(4'he):(4'h8)] : $signed(reg78))};
  assign wire82 = $unsigned($signed(wire5[(4'h9):(1'h0)]));
  assign wire83 = ((8'hb4) && (((wire80 ?
                              (|wire73) : (wire0 ? (7'h44) : wire76)) ?
                          wire1[(4'he):(3'h7)] : ((~|wire2) ?
                              ((8'hb2) ?
                                  reg78 : (8'hb7)) : (wire3 - (7'h43)))) ?
                      ($unsigned($unsigned(wire3)) >>> $unsigned(wire73[(2'h3):(1'h1)])) : (+$unsigned(wire79[(2'h2):(2'h2)]))));
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire69;
  assign y = {wire72, wire71, wire32, wire15, wire14, wire69, (1'h0)};
  assign wire14 = $unsigned(wire12[(3'h7):(3'h5)]);
  assign wire15 = wire12;
  module16 #() modinst33 (wire32, clk, wire11, wire15, wire9, wire13, wire10);
  module34 #() modinst70 (.wire38(wire32), .wire37(wire11), .clk(clk), .wire35(wire14), .y(wire69), .wire36(wire13), .wire39(wire9));
  assign wire71 = $unsigned({(8'hae),
                      ($signed(wire32[(2'h2):(1'h0)]) >>> {$signed((8'hba)),
                          wire12})});
  assign wire72 = {{wire11}};
endmodule

module module34
#(parameter param68 = (^(((8'haf) << ((!(8'ha1)) | ((7'h42) < (8'hbb)))) ? (+(!((8'ha5) ? (8'h9e) : (8'hb2)))) : {(((8'haf) ? (8'hb4) : (8'ha9)) ? ((8'hb8) ? (8'h9f) : (8'ha6)) : ((8'haf) ? (7'h44) : (8'hb1)))})))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire39;
  input wire signed [(4'hd):(1'h0)] wire38;
  input wire [(5'h15):(1'h0)] wire37;
  input wire [(4'hf):(1'h0)] wire36;
  input wire [(4'hb):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire40;
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire56,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire40,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire40 = wire39[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if ({$unsigned((((wire39 ? wire39 : wire40) ?
                  wire35 : (wire36 <<< wire38)) ?
              wire39 : ((|wire40) ? $unsigned(wire38) : (^wire37)))),
          (~&$signed((^(~^wire36))))})
        begin
          reg41 <= $signed(wire35[(3'h5):(3'h4)]);
          reg42 <= ((-$signed(((8'hb4) < $signed(wire36)))) ?
              (wire40[(3'h4):(3'h4)] ?
                  ((|wire38[(3'h6):(3'h6)]) ?
                      wire38 : ($signed(wire35) >>> reg41)) : $unsigned(wire38)) : ((8'ha5) ?
                  $signed(wire36) : wire36));
          reg43 <= $unsigned((($signed({wire37, wire40}) ?
              {(wire39 | (8'hac))} : (8'ha9)) > $signed((8'hab))));
          reg44 <= $signed(((&$signed($signed(wire39))) * (($signed(wire37) <<< wire38[(4'hd):(4'h8)]) << (~|$signed(wire37)))));
        end
      else
        begin
          reg41 <= $unsigned(wire38[(4'hd):(3'h5)]);
        end
    end
  assign wire45 = (wire38 ? $signed(reg42) : $unsigned($signed((-(8'had)))));
  assign wire46 = (~|{$signed((wire39[(1'h0):(1'h0)] && {wire35})),
                      $signed((-(~|reg43)))});
  assign wire47 = $signed($unsigned($signed(wire36)));
  assign wire48 = reg42;
  assign wire49 = wire48;
  always
    @(posedge clk) begin
      reg50 <= {{{(wire37[(5'h11):(3'h5)] ? (!wire49) : (reg43 >>> (7'h43)))}},
          (^~$signed(wire46))};
      if ($unsigned($unsigned($unsigned((wire35 >= wire37)))))
        begin
          if (reg44[(3'h4):(1'h1)])
            begin
              reg51 <= ((reg43 ?
                      ({(reg41 ~^ reg44), reg44[(1'h1):(1'h1)]} ?
                          $signed((wire36 ?
                              reg50 : wire49)) : wire48[(3'h4):(1'h0)]) : wire48[(3'h5):(1'h1)]) ?
                  ($unsigned((^wire40)) == ({(wire36 ?
                          wire40 : wire37)} * wire40[(3'h6):(2'h3)])) : (wire46[(5'h10):(4'hc)] > {((wire40 ?
                              wire49 : (8'hb9)) ?
                          (wire45 ? wire37 : wire36) : (7'h41)),
                      ((wire40 ? wire37 : wire40) == (^~wire46))}));
            end
          else
            begin
              reg51 <= ((reg44 ?
                  (-(wire46 != (wire37 >> (7'h44)))) : {wire45[(3'h7):(2'h3)],
                      (reg51 < reg43)}) ^ $signed($unsigned(((wire49 >= wire45) >>> {wire47,
                  (8'hab)}))));
              reg52 <= ($unsigned((|(reg50 + (wire39 ? reg41 : wire38)))) ?
                  reg41[(1'h1):(1'h0)] : {(((reg51 && wire48) <<< $signed(wire35)) ?
                          ((8'hb2) ?
                              (!wire36) : $signed(wire49)) : (reg44 ^ {reg42,
                              wire37})),
                      (((wire39 != reg44) ^~ $signed(wire49)) & reg50[(4'ha):(1'h0)])});
              reg53 <= $unsigned(reg50[(3'h7):(3'h4)]);
            end
          reg54 <= {(-(wire48[(1'h0):(1'h0)] ?
                  (!$signed(reg41)) : reg52[(2'h3):(1'h0)]))};
        end
      else
        begin
          reg51 <= reg41[(2'h2):(1'h0)];
          reg52 <= {(reg52 > (reg41 >= ($unsigned(reg42) >> (wire39 >= wire35))))};
          if ($unsigned(($unsigned($signed($signed(reg41))) ?
              reg51[(3'h5):(3'h4)] : (((^reg42) ^ $unsigned(wire40)) <<< (((8'ha0) | wire37) == reg52)))))
            begin
              reg53 <= ($signed((wire40 ?
                  ($unsigned(reg42) ?
                      (reg54 <<< wire39) : wire48) : wire48)) & (&(wire46 > reg54[(4'ha):(2'h3)])));
              reg54 <= (8'hb6);
              reg55 <= $unsigned({(7'h40)});
            end
          else
            begin
              reg53 <= wire46;
              reg54 <= wire40;
              reg55 <= $unsigned($unsigned((wire37 + reg42)));
            end
        end
    end
  assign wire56 = {$unsigned((-reg50)), $signed(wire46[(3'h6):(2'h2)])};
  always
    @(posedge clk) begin
      reg57 <= $signed((reg52 - wire37));
      if (($signed((wire36 ?
          $signed($unsigned(reg42)) : (~^$unsigned(wire56)))) + ((8'hbf) ?
          wire37[(4'h8):(3'h6)] : $unsigned($signed((reg50 ?
              wire39 : wire56))))))
        begin
          reg58 <= reg52[(1'h0):(1'h0)];
          reg59 <= ($signed({{reg55, reg55}, $signed(reg54[(1'h0):(1'h0)])}) ?
              reg42 : wire35);
          reg60 <= ((~^$signed(($unsigned(wire35) && {reg43}))) ?
              $signed(wire40) : wire35);
          reg61 <= wire36;
        end
      else
        begin
          reg58 <= $unsigned((8'had));
          reg59 <= $signed($signed($signed($signed((wire49 >>> (8'hbf))))));
          reg60 <= $signed($signed(((~|((8'ha1) ^~ wire47)) == reg41)));
          if (reg42[(1'h1):(1'h0)])
            begin
              reg61 <= ($signed(reg59) ?
                  wire36[(4'h8):(1'h0)] : (reg60[(2'h3):(2'h2)] ?
                      $signed({(wire48 ?
                              (7'h43) : wire49)}) : $unsigned({$unsigned(wire47)})));
              reg62 <= reg54[(5'h10):(4'h8)];
            end
          else
            begin
              reg61 <= (reg52 ?
                  (~|reg57[(4'h9):(3'h6)]) : {((-reg44[(1'h1):(1'h0)]) <<< (!(wire49 ?
                          wire36 : (8'hb4))))});
              reg62 <= $unsigned((~($unsigned($unsigned(reg44)) ?
                  wire35[(2'h3):(1'h1)] : reg44)));
              reg63 <= ($unsigned(((~wire46) >>> (~^$unsigned((8'hb8))))) ?
                  ((wire38 ?
                          ((^wire47) ?
                              ((8'hbe) <<< (8'hb9)) : reg54) : ((&reg61) ?
                              $unsigned(reg51) : reg41)) ?
                      reg57[(3'h7):(1'h0)] : (reg59[(4'hc):(2'h2)] ?
                          ((reg54 ?
                              reg60 : reg41) ^~ (reg42 - wire38)) : (^$unsigned(wire46)))) : (((reg60[(2'h2):(1'h1)] ?
                          ((8'hbb) ?
                              (8'hb6) : (7'h43)) : $unsigned(wire45)) >= (~&(~|wire39))) ?
                      $unsigned(reg62[(3'h4):(1'h1)]) : (+{(wire46 ?
                              reg52 : reg59),
                          (wire39 ? wire38 : reg41)})));
            end
          reg64 <= $signed({wire56,
              {($unsigned(wire37) <= (wire47 ? reg42 : wire40))}});
        end
    end
  always
    @(posedge clk) begin
      reg65 <= ($unsigned((^{$unsigned(reg64), reg57[(4'h9):(3'h4)]})) ?
          reg42[(3'h5):(3'h5)] : $signed((^wire38)));
    end
  assign wire66 = $signed($unsigned(reg60));
  assign wire67 = (($unsigned((reg44 - (~reg57))) != (-$unsigned(reg55[(1'h0):(1'h0)]))) + {($signed($signed((8'hbc))) ?
                          $signed(reg44) : wire39)});
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire20;
  input wire [(4'ha):(1'h0)] wire19;
  input wire [(3'h4):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg31,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire22 = wire20[(4'h8):(2'h3)];
  assign wire23 = ((~|(|wire21)) * $unsigned(wire18));
  assign wire24 = (wire22[(3'h4):(1'h1)] ?
                      (wire19 & ($unsigned((8'h9c)) <= (-(~&wire18)))) : wire20);
  assign wire25 = (~&$unsigned($unsigned(wire20[(4'h8):(2'h2)])));
  always
    @(posedge clk) begin
      reg26 <= wire21;
      reg27 <= {$signed(wire23[(1'h1):(1'h1)]), wire24};
      reg28 <= $unsigned($signed((!(-$unsigned(reg27)))));
    end
  assign wire29 = wire21;
  assign wire30 = (wire20 ~^ wire23);
  always
    @(posedge clk) begin
      reg31 <= reg28[(1'h0):(1'h0)];
    end
endmodule
