module top
#(parameter param98 = (~^{(8'hb1)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire97, wire95, wire9, wire8, wire4, reg5, reg6, reg7, (1'h0)};
  assign wire4 = wire0;
  always
    @(posedge clk) begin
      reg5 <= ((wire2 ?
              $signed((wire2 || $unsigned(wire0))) : $unsigned(((wire2 ?
                      wire0 : wire2) ?
                  $unsigned(wire1) : (~wire4)))) ?
          $signed(wire2) : wire1);
      reg6 <= wire4[(4'ha):(3'h6)];
      reg7 <= ($unsigned($unsigned({(wire2 ?
              wire4 : wire2)})) ^~ $signed(wire4[(3'h5):(2'h3)]));
    end
  assign wire8 = reg7;
  assign wire9 = $signed((|wire4[(1'h1):(1'h0)]));
  module10 #() modinst96 (.wire12(wire0), .wire11(reg7), .wire13(wire3), .clk(clk), .wire15(wire1), .wire14(wire8), .y(wire95));
  assign wire97 = {wire9};
endmodule

module module10
#(parameter param94 = ({(+(((7'h40) >= (8'hb2)) + ((8'h9e) != (8'ha4)))), (((!(8'ha3)) ? ((8'ha4) < (8'hbd)) : ((8'hb0) ? (8'hb9) : (8'hbf))) >= (((8'hb7) ? (8'h9f) : (8'hbf)) + ((8'hb7) == (8'ha2))))} ? (-(~((~|(8'hac)) ? ((8'hb2) << (8'hbd)) : ((8'ha6) ~^ (7'h42))))) : (((8'h9c) | ({(8'hb3), (8'ha3)} ? ((7'h43) <= (8'hbc)) : ((8'h9d) >> (8'haa)))) ? {(((8'ha1) ? (8'ha9) : (8'hb9)) > (~(7'h41)))} : ((((8'ha5) ? (8'hb0) : (8'hb1)) ? ((8'hbc) ~^ (8'hb9)) : (&(8'ha2))) || (|((8'hb9) ? (8'h9c) : (8'hb1)))))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  input wire signed [(2'h3):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire78,
                 wire46,
                 wire35,
                 wire18,
                 wire17,
                 wire16,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg19,
                 reg20,
                 reg21,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 (1'h0)};
  assign wire16 = (+$signed(($unsigned(wire12[(1'h0):(1'h0)]) ?
                      (!(wire15 + wire14)) : {wire13})));
  assign wire17 = wire12;
  assign wire18 = (+({({(8'hbe), wire15} || $signed(wire17)),
                      ({wire14} ?
                          (wire12 ~^ wire13) : (wire15 ?
                              (8'ha3) : (8'hbc)))} & ($signed(wire12) ?
                      wire12[(1'h0):(1'h0)] : (wire11 ?
                          $signed(wire17) : {wire15, wire15}))));
  always
    @(posedge clk) begin
      reg19 <= wire13[(1'h0):(1'h0)];
      if ((wire13[(4'h8):(3'h6)] >= $unsigned((reg19[(1'h1):(1'h1)] && ((^(7'h44)) ?
          wire11[(2'h2):(1'h1)] : (!wire18))))))
        begin
          reg20 <= {$unsigned($unsigned($unsigned((wire13 ? wire13 : wire15)))),
              (((+$unsigned(wire13)) ?
                  $unsigned({(8'h9c), wire16}) : (~&{wire11,
                      wire14})) << (~^$unsigned((^wire15))))};
          reg21 <= $signed((reg20 < $unsigned(wire14)));
        end
      else
        begin
          reg20 <= ({$unsigned((~|(wire13 ?
                  (7'h42) : wire16)))} >= {(!reg20[(4'hb):(2'h3)])});
          reg21 <= ($unsigned(($unsigned((8'haa)) + (^~$signed(wire16)))) ?
              (($signed({(8'hba), wire17}) >>> (^~$unsigned(reg21))) ?
                  $unsigned((^wire14[(3'h5):(3'h4)])) : (!(~^wire11[(3'h7):(3'h6)]))) : (wire16 ?
                  (wire12 && wire12) : (~^(^~$unsigned((8'haf))))));
        end
    end
  module22 #() modinst36 (.wire23(reg20), .wire26(reg21), .wire24(wire15), .y(wire35), .clk(clk), .wire25(wire11));
  always
    @(posedge clk) begin
      reg37 <= (wire12[(2'h2):(2'h2)] << wire14[(2'h2):(1'h1)]);
      if ($unsigned((8'hb5)))
        begin
          if (((8'hbc) ? $unsigned(reg21[(2'h3):(1'h1)]) : wire11))
            begin
              reg38 <= $unsigned($unsigned((&wire35[(2'h2):(1'h1)])));
            end
          else
            begin
              reg38 <= $signed($signed(wire11));
              reg39 <= wire14;
              reg40 <= wire12;
              reg41 <= {wire14[(3'h4):(3'h4)]};
            end
        end
      else
        begin
          reg38 <= wire17[(2'h3):(2'h2)];
        end
      if (wire18[(4'he):(4'h9)])
        begin
          reg42 <= $signed($unsigned(wire35[(1'h0):(1'h0)]));
        end
      else
        begin
          reg42 <= ($unsigned((-($signed(reg42) ?
              (reg37 ?
                  wire16 : wire11) : (~&reg21)))) & $unsigned($unsigned($signed(wire13))));
          reg43 <= wire16[(3'h7):(3'h6)];
          reg44 <= wire13[(3'h7):(2'h2)];
        end
      reg45 <= {reg42[(1'h1):(1'h0)]};
    end
  assign wire46 = reg44;
  module47 #() modinst79 (wire78, clk, reg39, reg38, reg40, reg42, reg37);
  assign wire80 = $signed($unsigned($unsigned(({wire18,
                      reg20} || reg42[(1'h0):(1'h0)]))));
  assign wire81 = $signed((wire11 > $signed(reg42[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg82 <= reg40;
      reg83 <= $signed($signed(wire16[(3'h5):(1'h0)]));
      reg84 <= (((8'haa) ?
          wire18[(4'hd):(2'h3)] : ((wire35 || (reg82 ? (8'h9f) : wire14)) ?
              $signed((~&wire11)) : wire81)) >>> reg37);
      reg85 <= $unsigned(wire13[(2'h2):(1'h1)]);
      if (wire18)
        begin
          reg86 <= wire15;
          reg87 <= wire14;
          reg88 <= reg38[(3'h6):(1'h1)];
          if ($signed((($signed(wire80[(2'h2):(1'h0)]) ?
              reg37[(3'h6):(3'h4)] : (reg83[(1'h0):(1'h0)] ?
                  (^reg21) : (~|reg44))) <= wire46)))
            begin
              reg89 <= wire18;
              reg90 <= {(+(~&wire15))};
              reg91 <= reg89;
            end
          else
            begin
              reg89 <= (+(wire12[(2'h3):(1'h1)] ?
                  $unsigned(wire46) : (($unsigned(reg21) ?
                      reg37 : $unsigned(reg91)) && $unsigned($unsigned(reg39)))));
              reg90 <= (reg42[(2'h2):(1'h0)] <<< wire17);
              reg91 <= ((((^{(8'hb7), reg88}) ?
                      reg43 : (|(wire18 ? (8'ha2) : reg86))) ?
                  wire80[(4'hd):(3'h6)] : (((8'ha1) ?
                      $unsigned(reg86) : reg38[(4'h8):(3'h5)]) | ((reg83 ?
                          wire35 : reg43) ?
                      (~^wire15) : (reg19 != reg43)))) ~^ (~$unsigned($signed($unsigned((8'ha7))))));
              reg92 <= wire18[(4'hd):(4'hd)];
              reg93 <= ((~&(|(^(^reg21)))) ?
                  $signed({(|reg39[(2'h3):(1'h1)]),
                      $unsigned((^~(7'h43)))}) : $signed(reg43));
            end
        end
      else
        begin
          reg86 <= $signed(reg20[(3'h7):(1'h0)]);
        end
    end
endmodule

module module47
#(parameter param76 = {((((-(8'ha9)) ? (+(8'ha5)) : (~|(8'hbf))) ? ({(8'hb4), (8'hb0)} ? ((8'hbe) ~^ (8'hb5)) : {(8'hb5)}) : {((7'h42) ? (8'hbb) : (8'hbe)), {(8'ha5), (8'h9e)}}) << ((((7'h42) | (8'hb6)) ? {(8'hbe), (8'hba)} : ((8'ha2) < (8'ha8))) ? (-(~&(8'hba))) : (((8'hae) ? (7'h40) : (8'hac)) <= (^~(8'ha6)))))}, 
parameter param77 = (param76 ? ((^(|param76)) | ((param76 & {param76, param76}) << ((|param76) ? param76 : param76))) : {param76, (^~param76)}))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire52;
  input wire [(4'h9):(1'h0)] wire51;
  input wire [(5'h10):(1'h0)] wire50;
  input wire signed [(3'h5):(1'h0)] wire49;
  input wire signed [(4'ha):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
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
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 (1'h0)};
  assign wire53 = $signed($signed(wire48[(3'h6):(2'h3)]));
  assign wire54 = (&(wire48 == (wire53[(3'h7):(3'h5)] < $unsigned((wire50 ?
                      wire52 : wire50)))));
  assign wire55 = ($signed({wire50, wire51}) ?
                      {($signed((8'ha1)) ~^ (&(~wire48))),
                          (^wire48[(3'h4):(1'h1)])} : ((wire48 > ($signed((8'ha6)) <= wire54[(4'he):(1'h0)])) ?
                          (wire50[(3'h7):(3'h7)] ~^ (wire48[(2'h3):(2'h2)] ~^ wire49[(3'h4):(3'h4)])) : wire52[(3'h6):(2'h3)]));
  assign wire56 = wire54[(3'h5):(1'h1)];
  assign wire57 = ({(wire55[(3'h4):(1'h0)] ?
                              ((~&(8'hb1)) >>> $unsigned(wire51)) : ((wire53 == wire56) > $unsigned(wire51)))} ?
                      $unsigned(wire48) : ((wire52 ~^ wire52[(3'h5):(2'h2)]) && {($unsigned((8'haa)) ?
                              (7'h44) : $unsigned(wire50))}));
  assign wire58 = wire51[(3'h5):(2'h3)];
  assign wire59 = $signed((|$signed(wire50[(2'h3):(2'h2)])));
  assign wire60 = (+wire51[(2'h2):(1'h0)]);
  assign wire61 = ($signed({(~&wire52[(2'h2):(1'h1)]),
                      (wire59 ?
                          wire50 : (wire60 ^~ (8'haa)))}) - wire52[(2'h3):(1'h0)]);
  assign wire62 = ($unsigned((wire61 ?
                          wire57[(1'h0):(1'h0)] : wire50[(3'h5):(2'h2)])) ?
                      $unsigned((((-wire56) ?
                              wire57 : ((8'h9d) ? wire51 : wire53)) ?
                          {(wire60 ? wire60 : wire51)} : {$unsigned(wire57),
                              (~wire50)})) : $signed(((wire60[(2'h3):(1'h0)] >= wire49[(3'h5):(3'h5)]) == (wire52 ?
                          (wire50 ? wire54 : wire53) : wire50))));
  assign wire63 = (|($unsigned(wire58) ?
                      ($unsigned((wire60 < wire49)) ?
                          (wire60 < (wire61 != wire56)) : ((wire61 ?
                                  wire61 : wire62) ?
                              wire48 : wire49[(1'h0):(1'h0)])) : (7'h42)));
  assign wire64 = wire53[(2'h2):(1'h1)];
  assign wire65 = $unsigned((wire58 * $unsigned({((8'hb8) >> wire57)})));
  assign wire66 = wire59;
  assign wire67 = ($signed(((8'hbd) > $unsigned(wire64))) >> (((wire55[(5'h12):(4'he)] >> (wire58 * wire49)) ?
                          wire59[(4'h9):(3'h5)] : (^$signed(wire57))) ?
                      (wire64[(4'hb):(2'h2)] * $unsigned((7'h43))) : $signed(wire48[(1'h0):(1'h0)])));
  assign wire68 = wire48[(3'h7):(2'h3)];
  assign wire69 = wire51[(3'h7):(2'h2)];
  assign wire70 = (8'hba);
  assign wire71 = wire53[(4'ha):(4'h8)];
  assign wire72 = (($signed((~|$unsigned((8'hb4)))) ?
                      (8'ha2) : wire58[(4'ha):(4'ha)]) >> ((wire55[(4'h8):(1'h1)] <= ((wire62 && wire66) ?
                          $unsigned(wire54) : ((8'hab) || (8'ha3)))) ?
                      {$unsigned((wire61 ?
                              wire51 : wire63))} : wire59[(3'h5):(2'h2)]));
  assign wire73 = $unsigned($signed((|(!$signed(wire62)))));
  assign wire74 = (wire72 * ((~&wire49[(3'h4):(3'h4)]) ?
                      $signed(wire49[(2'h2):(2'h2)]) : (wire71 < (wire67 ~^ $unsigned(wire54)))));
  assign wire75 = (8'ha9);
endmodule

module module22
#(parameter param33 = (+(({((7'h41) >>> (8'hbc))} >> ({(8'hbc), (8'haa)} ? (+(8'ha9)) : ((8'ha2) * (7'h44)))) == ((!{(8'hb5)}) && (!((8'hb5) ? (8'hbd) : (8'ha6)))))), 
parameter param34 = (&(((param33 != (+param33)) ~^ ((param33 >= param33) ? (|param33) : (param33 > param33))) ? {((param33 >> (8'haf)) ? (8'hb4) : (|param33)), (+(param33 || param33))} : {(~&(~^(8'ha0))), ((param33 ? param33 : param33) ? (~|param33) : param33)})))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire26;
  input wire [(5'h14):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire signed [(3'h6):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire27;
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  assign y = {wire32, wire31, wire27, reg30, reg29, reg28, (1'h0)};
  assign wire27 = $unsigned((~$unsigned((~wire25))));
  always
    @(posedge clk) begin
      reg28 <= wire23;
      reg29 <= (|wire25);
      reg30 <= (~^(-$signed($signed($signed(wire23)))));
    end
  assign wire31 = ({reg30[(4'h9):(4'h9)],
                          ($signed({wire23}) ?
                              wire23[(1'h0):(1'h0)] : $signed($unsigned(reg28)))} ?
                      (~|($signed($unsigned((8'ha3))) != (8'ha2))) : ((!(reg28 - $unsigned(reg29))) ?
                          reg29 : $signed($unsigned((wire26 ^~ wire24)))));
  assign wire32 = wire24[(5'h12):(1'h0)];
endmodule
