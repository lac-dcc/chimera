module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire226;
  wire signed [(3'h4):(1'h0)] wire225;
  wire [(5'h10):(1'h0)] wire224;
  wire [(4'hb):(1'h0)] wire223;
  wire [(4'he):(1'h0)] wire221;
  wire signed [(5'h15):(1'h0)] wire209;
  wire signed [(4'ha):(1'h0)] wire208;
  wire [(4'h8):(1'h0)] wire207;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire205;
  reg [(4'h9):(1'h0)] reg220 = (1'h0);
  reg [(4'h8):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg218 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg217 = (1'h0);
  reg [(3'h7):(1'h0)] reg216 = (1'h0);
  reg [(4'he):(1'h0)] reg215 = (1'h0);
  reg signed [(4'he):(1'h0)] reg214 = (1'h0);
  reg [(5'h13):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg211 = (1'h0);
  assign y = {wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire221,
                 wire209,
                 wire208,
                 wire207,
                 wire5,
                 wire68,
                 wire70,
                 wire71,
                 wire205,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 (1'h0)};
  assign wire5 = {(~wire3[(2'h2):(1'h1)])};
  module6 #() modinst69 (wire68, clk, wire1, wire5, wire0, wire3);
  assign wire70 = (|(8'hbf));
  assign wire71 = $signed((!($unsigned((wire0 ~^ wire68)) ?
                      $unsigned((^wire70)) : $unsigned(((8'ha1) ?
                          wire68 : wire5)))));
  module72 #() modinst206 (wire205, clk, wire70, wire5, wire1, wire2, wire68);
  assign wire207 = $signed(wire4);
  assign wire208 = wire2;
  module13 #() modinst210 (wire209, clk, wire71, wire3, wire2, wire5);
  always
    @(posedge clk) begin
      reg211 <= $unsigned($unsigned($signed(($signed(wire1) ?
          wire70 : wire3))));
      if ((^(wire1 ^ ($signed($unsigned(wire1)) | ((wire205 ?
              wire205 : wire207) ?
          wire70 : $unsigned(wire68))))))
        begin
          reg212 <= $unsigned($signed($signed({reg211, (-wire1)})));
        end
      else
        begin
          reg212 <= wire3[(4'hb):(2'h2)];
          if ((!(!wire68[(2'h2):(1'h0)])))
            begin
              reg213 <= {reg212};
              reg214 <= ((wire2[(1'h0):(1'h0)] == (~^reg211[(4'hb):(3'h6)])) <= wire68);
              reg215 <= $unsigned((^((^~$signed(reg212)) != ((wire4 >> wire205) ?
                  $signed(wire5) : (wire208 + wire70)))));
            end
          else
            begin
              reg213 <= reg213[(2'h3):(1'h1)];
              reg214 <= wire205[(1'h0):(1'h0)];
            end
          if (((-$signed(($signed(wire207) - reg214))) ?
              $unsigned(({(wire207 ?
                      wire68 : wire1)} >> wire3)) : reg211[(3'h7):(3'h7)]))
            begin
              reg216 <= $unsigned($unsigned({$unsigned($unsigned(wire208)),
                  $unsigned(reg215[(1'h1):(1'h1)])}));
              reg217 <= {wire68,
                  ($signed({$signed(wire70), (8'h9c)}) ? wire70 : wire208)};
              reg218 <= $unsigned(($unsigned(reg211[(2'h3):(1'h1)]) ?
                  ((~&((8'hb6) ?
                      wire3 : wire0)) > ($signed(wire205) >>> (reg216 || reg212))) : ((wire1[(3'h4):(3'h4)] ?
                          (reg212 != wire205) : {wire207, wire1}) ?
                      (~|(^~wire205)) : (~|{reg217}))));
              reg219 <= (~(!(~|{(wire2 >= (8'ha5))})));
              reg220 <= wire3[(3'h7):(1'h1)];
            end
          else
            begin
              reg216 <= $unsigned($unsigned($unsigned({reg211[(4'hb):(4'h8)]})));
            end
        end
    end
  module140 #() modinst222 (.clk(clk), .wire143(wire1), .y(wire221), .wire144(wire71), .wire142(wire68), .wire141(wire209));
  assign wire223 = (!$signed(reg216[(1'h0):(1'h0)]));
  assign wire224 = $signed(reg214);
  assign wire225 = ({(((wire208 && wire223) ?
                                   wire205[(1'h0):(1'h0)] : $signed(wire1)) ?
                               (!$unsigned(wire70)) : $unsigned((wire2 ?
                                   wire221 : reg217)))} ?
                       wire221 : wire209);
  module79 #() modinst227 (wire226, clk, wire205, wire71, wire208, wire209);
endmodule

module module72
#(parameter param204 = ((-((((7'h41) ^ (8'hbb)) ~^ ((8'hae) ? (8'haa) : (7'h40))) == ((+(8'ha9)) ? (^~(8'hb2)) : ((8'ha9) + (8'haf))))) ? (((!(8'hb9)) ~^ (((8'ha3) <<< (8'ha1)) >> ((8'ha3) ? (8'hb8) : (8'hb8)))) ^~ ((!{(7'h41)}) == {(~^(8'haa))})) : {(+((&(8'hb4)) ? ((8'hb3) ? (8'ha7) : (8'hb3)) : (|(7'h41)))), (~&(((8'hb5) != (7'h43)) ? (^~(8'ha6)) : ((8'hbb) ? (8'ha1) : (8'h9c))))}))
(y, clk, wire77, wire76, wire75, wire74, wire73);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire77;
  input wire signed [(5'h15):(1'h0)] wire76;
  input wire signed [(5'h13):(1'h0)] wire75;
  input wire signed [(5'h10):(1'h0)] wire74;
  input wire [(4'hc):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire202;
  wire signed [(2'h2):(1'h0)] wire162;
  wire [(5'h13):(1'h0)] wire161;
  wire signed [(5'h14):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire159;
  wire [(3'h6):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire139;
  wire signed [(5'h12):(1'h0)] wire137;
  wire signed [(4'h8):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire78;
  reg signed [(4'hc):(1'h0)] reg119 = (1'h0);
  assign y = {wire202,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire157,
                 wire139,
                 wire137,
                 wire120,
                 wire118,
                 wire117,
                 wire115,
                 wire78,
                 reg119,
                 (1'h0)};
  assign wire78 = (^~$unsigned((wire73[(3'h7):(3'h5)] ~^ (^((8'hbb) ?
                      wire74 : wire73)))));
  module79 #() modinst116 (.wire81(wire73), .wire82(wire78), .y(wire115), .clk(clk), .wire83(wire75), .wire80(wire74));
  assign wire117 = (!$unsigned($signed((((8'hb3) ?
                       wire77 : wire75) <<< (^wire78)))));
  assign wire118 = ((wire73[(4'h9):(2'h2)] ?
                           (-(|(wire78 == (7'h42)))) : ($signed((~(8'ha6))) ~^ wire73[(3'h6):(2'h3)])) ?
                       ((^$unsigned((wire78 ? wire115 : (8'hb8)))) ?
                           $unsigned(wire117) : ((|{wire75, wire75}) ?
                               wire117 : (~{(8'hb0),
                                   wire75}))) : $signed($unsigned(wire77)));
  always
    @(posedge clk) begin
      reg119 <= $unsigned({(wire115 >>> ({wire76} ? (!wire74) : wire74)),
          $signed({wire77[(4'h8):(4'h8)], (wire73 ? (8'hb2) : wire76)})});
    end
  assign wire120 = $signed((wire78 >= ($signed(wire76[(1'h0):(1'h0)]) ?
                       (~$unsigned(reg119)) : (+$unsigned(wire118)))));
  module121 #() modinst138 (wire137, clk, wire78, wire115, wire75, wire118);
  assign wire139 = {reg119[(1'h1):(1'h1)],
                       ($signed($signed(wire120)) <= (&$signed((wire115 ^ wire137))))};
  module140 #() modinst158 (.wire143(wire73), .wire142(wire117), .y(wire157), .wire141(wire77), .wire144(wire76), .clk(clk));
  assign wire159 = $signed((wire157 ?
                       $signed(($signed(wire120) * (wire139 - wire118))) : $signed(wire157)));
  assign wire160 = $unsigned((wire139 && $unsigned((-wire77[(4'hf):(1'h1)]))));
  assign wire161 = (~^(wire73 ^ $signed((reg119 + wire73[(4'h9):(2'h3)]))));
  assign wire162 = $signed((^((-wire75) ?
                       ((+(8'ha3)) ?
                           wire117[(2'h2):(1'h1)] : (wire75 ?
                               wire115 : wire137)) : wire73)));
  module163 #() modinst203 (wire202, clk, reg119, wire118, wire160, wire77, wire76);
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire12,
                 wire11,
                 (1'h0)};
  assign wire11 = wire10[(3'h7):(3'h4)];
  assign wire12 = wire8[(1'h0):(1'h0)];
  module13 #() modinst62 (wire61, clk, wire9, wire11, wire8, wire12);
  assign wire63 = $unsigned(wire12);
  assign wire64 = {wire9};
  assign wire65 = (((!((wire11 ?
                      wire7 : wire12) < wire64)) <<< ((!wire64) <= {(wire9 | (8'ha3)),
                      $signed(wire7)})) != wire10[(4'hd):(3'h4)]);
  assign wire66 = $signed($unsigned((~((+wire12) ?
                      wire65[(3'h5):(2'h2)] : (wire9 ? wire8 : wire64)))));
  assign wire67 = (~^wire12);
endmodule

module module13
#(parameter param59 = (((~|{((8'h9f) ? (8'h9c) : (8'ha5))}) ? ((!((8'ha6) != (7'h42))) ? (-((8'h9d) ? (8'h9d) : (8'ha4))) : {((8'hbc) == (8'hb9)), ((8'hb0) ? (8'hb9) : (8'hab))}) : {((~^(8'ha5)) || ((8'ha1) ^~ (8'h9c))), (-((8'hb7) ? (8'had) : (8'ha0)))}) ^~ {((|{(8'ha1), (8'ha7)}) ? (~^(~^(8'ha0))) : {((8'hb9) ^ (8'haf))}), ({(7'h44), ((8'hbb) || (8'hb4))} ^ (!((8'h9f) != (8'hba))))}), 
parameter param60 = param59)
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h1f5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire17;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire19,
                 wire18,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire18 = (~&wire16[(1'h1):(1'h1)]);
  assign wire19 = {$signed(wire16[(2'h3):(1'h0)]),
                      (~&$unsigned($signed(wire18)))};
  always
    @(posedge clk) begin
      reg20 <= (8'h9c);
      reg21 <= {$unsigned($signed(wire18)), $unsigned(wire15[(3'h4):(2'h3)])};
      reg22 <= wire18;
      reg23 <= (wire15[(4'hc):(3'h7)] <= wire18);
      reg24 <= $unsigned($unsigned({$signed((reg22 ? wire19 : (7'h43))),
          (!(wire14 ? wire16 : reg21))}));
    end
  assign wire25 = (reg21[(5'h10):(4'hd)] & {$unsigned(((~^reg20) & (wire17 ?
                          wire14 : (7'h42))))});
  assign wire26 = wire18;
  assign wire27 = reg22;
  assign wire28 = ($unsigned(($signed((reg24 ? (8'hb0) : (8'hb7))) ?
                          wire17[(3'h4):(3'h4)] : $unsigned($unsigned(wire18)))) ?
                      reg23 : reg20[(1'h0):(1'h0)]);
  assign wire29 = $unsigned(wire28[(4'h8):(2'h3)]);
  assign wire30 = reg21[(3'h6):(1'h0)];
  assign wire31 = wire26;
  always
    @(posedge clk) begin
      reg32 <= {$unsigned((((reg22 ? (8'hb1) : reg21) ?
                  wire25[(2'h2):(1'h0)] : ((8'hab) & (8'haa))) ?
              wire17[(3'h4):(2'h2)] : $unsigned((wire15 ? wire31 : reg23)))),
          (^~wire31)};
      if ((wire16[(3'h4):(1'h0)] <<< wire27[(4'hf):(4'h9)]))
        begin
          if ((^($signed($unsigned({reg21, reg32})) ?
              (!wire29) : $unsigned(((~&reg20) ?
                  (wire27 * (8'ha4)) : (wire30 + wire15))))))
            begin
              reg33 <= $unsigned(wire30[(5'h11):(3'h5)]);
              reg34 <= (|(^wire25[(2'h2):(2'h2)]));
              reg35 <= ({reg22[(3'h6):(3'h6)],
                  (wire15 ? reg24 : $unsigned(reg23[(3'h5):(3'h5)]))} == reg33);
              reg36 <= reg22[(3'h6):(3'h5)];
              reg37 <= reg23;
            end
          else
            begin
              reg33 <= (-$unsigned(reg33));
              reg34 <= (~^$unsigned($unsigned((reg21[(4'ha):(3'h4)] ?
                  reg20 : (reg20 > wire18)))));
              reg35 <= (8'hbf);
              reg36 <= $signed((~^wire26));
            end
        end
      else
        begin
          reg33 <= $unsigned($unsigned($signed(((8'ha2) ? reg23 : {wire27}))));
          if (wire31)
            begin
              reg34 <= reg24;
              reg35 <= (~|((wire26[(1'h0):(1'h0)] <<< ((~wire29) ?
                      ((7'h41) ? reg35 : wire18) : reg37)) ?
                  {(reg22[(3'h7):(3'h5)] ? {reg22, (8'hb7)} : (reg36 & wire15)),
                      {$unsigned(wire29), {reg22}}} : (~^{$signed(reg21),
                      $signed(wire18)})));
              reg36 <= (-wire28);
              reg37 <= (-((wire28[(4'ha):(4'ha)] != ((wire28 ?
                  wire29 : wire31) != reg34[(3'h4):(2'h3)])) << (~$signed(reg33[(4'he):(4'hc)]))));
              reg38 <= {$unsigned(reg20),
                  ((((8'hbc) ^ (~(8'hb2))) ?
                          (~^(8'had)) : $signed(reg22[(4'h8):(3'h5)])) ?
                      (+(^$unsigned(reg20))) : (~reg32))};
            end
          else
            begin
              reg34 <= $signed((reg24[(4'h8):(1'h1)] ?
                  ((8'hb7) ?
                      wire30 : (wire15 ?
                          wire18 : (wire30 + reg22))) : $signed($signed((-wire16)))));
              reg35 <= (({reg32[(4'ha):(2'h2)]} <= $signed({(wire14 ?
                          wire14 : reg21),
                      wire16})) ?
                  ((wire26 <<< (wire19[(4'hb):(3'h7)] ?
                          (wire14 ? (8'hb5) : wire17) : (8'hb0))) ?
                      $signed(wire25) : $signed(wire17[(3'h4):(2'h3)])) : reg36[(3'h5):(1'h0)]);
              reg36 <= (wire14[(4'he):(2'h2)] ?
                  (reg35[(4'he):(4'h8)] ?
                      (8'hb6) : (~&(reg37 || $unsigned(wire27)))) : $unsigned(({((8'ha2) ?
                              wire17 : reg35)} ?
                      $signed($signed(wire31)) : ($unsigned(wire18) >>> (wire31 ?
                          wire19 : (8'hba))))));
              reg37 <= $signed(wire28[(4'h9):(3'h7)]);
              reg38 <= $unsigned(({(wire19[(1'h0):(1'h0)] ? (!reg34) : wire16),
                  $unsigned($signed((8'h9e)))} | wire17[(3'h5):(2'h3)]));
            end
          reg39 <= reg35;
          reg40 <= wire27;
          reg41 <= ($signed((~$signed($signed(wire29)))) ?
              reg24[(3'h4):(2'h3)] : ((wire16 <= (~&(wire25 ?
                  wire14 : reg37))) <= ((~^(~(8'hbf))) ^ $signed(reg36[(3'h6):(2'h3)]))));
        end
    end
  always
    @(posedge clk) begin
      if ({{((reg23 || (-wire31)) ? wire28 : {((8'hb3) ^ reg32)})}})
        begin
          reg42 <= (wire18[(4'ha):(2'h2)] || ((($signed(wire28) - $unsigned(reg20)) ?
              ((wire15 < reg21) + (~&reg38)) : $signed((|reg34))) <<< reg34));
          reg43 <= wire17[(3'h6):(3'h6)];
          if ((^~((-wire30[(1'h0):(1'h0)]) > $signed((8'hb2)))))
            begin
              reg44 <= (reg20[(4'hb):(1'h1)] - (~|($signed((wire28 ?
                  reg24 : wire30)) == {$unsigned(wire26)})));
            end
          else
            begin
              reg44 <= wire18;
              reg45 <= ($signed($signed($unsigned($signed(reg43)))) <= $signed(wire14));
              reg46 <= reg43[(2'h3):(1'h1)];
              reg47 <= wire28;
              reg48 <= wire25[(1'h0):(1'h0)];
            end
          if ($unsigned((~wire17)))
            begin
              reg49 <= reg43;
            end
          else
            begin
              reg49 <= {(reg46[(1'h0):(1'h0)] ?
                      $signed($unsigned($signed(reg44))) : (reg24 ?
                          ($unsigned(reg49) << reg44[(4'h9):(1'h0)]) : $unsigned($unsigned((8'had)))))};
              reg50 <= (reg46 || reg34);
              reg51 <= ($signed(reg36) * (reg33[(4'ha):(4'h9)] ?
                  (wire16 ?
                      (&(wire15 ? reg47 : (8'ha3))) : $unsigned((wire17 ?
                          wire29 : reg20))) : $unsigned(reg38[(4'he):(2'h3)])));
              reg52 <= $signed($signed(reg42[(5'h11):(1'h1)]));
            end
        end
      else
        begin
          reg42 <= $signed((((8'haf) ?
                  (reg49 == {reg36, reg20}) : (reg22[(3'h5):(1'h1)] ?
                      ((7'h40) ? reg46 : reg33) : ((8'ha8) ?
                          reg46 : (8'hb2)))) ?
              $signed(wire31[(4'he):(4'h8)]) : $signed($signed(wire31))));
          reg43 <= ($signed(((!$signed((8'hba))) >= $unsigned($signed(wire16)))) || wire25);
          if (reg48[(4'hd):(4'hb)])
            begin
              reg44 <= (^~(|(~^wire26[(3'h5):(1'h1)])));
              reg45 <= ((-(~(|(reg44 ~^ reg33)))) > ((wire16 << ($signed(reg23) + reg36[(3'h5):(1'h1)])) ^ reg49[(3'h4):(1'h0)]));
              reg46 <= $unsigned(($signed((reg24[(4'he):(4'h9)] ^~ (reg49 ?
                      reg52 : reg37))) ?
                  (reg51[(4'h8):(3'h4)] ?
                      wire30[(4'hd):(3'h4)] : reg35[(3'h6):(3'h4)]) : (^(((8'haa) > wire29) ~^ wire16))));
            end
          else
            begin
              reg44 <= $signed((+reg37[(3'h5):(1'h0)]));
              reg45 <= {$signed((~^($signed(reg21) >>> (wire17 + reg44))))};
              reg46 <= $unsigned(reg43[(2'h2):(2'h2)]);
            end
          if ($unsigned((!wire31)))
            begin
              reg47 <= $unsigned(reg47[(2'h3):(2'h2)]);
              reg48 <= (8'hbd);
              reg49 <= wire27[(1'h1):(1'h0)];
              reg50 <= $signed(wire29);
            end
          else
            begin
              reg47 <= reg48[(4'h9):(3'h5)];
              reg48 <= (((wire17[(4'h8):(2'h3)] ?
                      {reg20} : reg32[(2'h2):(1'h1)]) <<< reg22) ?
                  ($unsigned($unsigned((wire16 ? reg35 : wire17))) ?
                      reg46[(2'h2):(1'h1)] : reg47) : ($signed($signed((wire29 <<< wire30))) ?
                      ({$signed(reg41)} ?
                          {$unsigned((8'hb2)),
                              $unsigned(reg39)} : {$unsigned(reg44),
                              $unsigned((8'hb0))}) : $unsigned({reg37[(1'h0):(1'h0)],
                          reg46})));
              reg49 <= wire26;
              reg50 <= (7'h42);
              reg51 <= wire30[(5'h10):(3'h7)];
            end
        end
      reg53 <= $signed(((8'hb9) ^~ {$unsigned((wire26 <<< wire15))}));
    end
  assign wire54 = ($unsigned(reg45[(2'h2):(2'h2)]) >> wire30[(4'hf):(3'h7)]);
  assign wire55 = (~reg50);
  assign wire56 = (8'h9d);
  assign wire57 = reg38;
  assign wire58 = $signed((reg38 > reg34[(3'h5):(3'h4)]));
endmodule

module module163
#(parameter param201 = (((((-(8'ha0)) ? ((8'h9d) >= (8'ha9)) : (~^(8'ha5))) ? (^((8'hbb) ^~ (8'hbc))) : (&((7'h42) > (8'hb8)))) ? {(((8'hb2) ~^ (8'hb7)) || (|(7'h42))), (((8'h9c) ^ (8'h9d)) ? ((8'hbb) ? (8'hb3) : (8'hb3)) : ((7'h40) ? (7'h41) : (7'h42)))} : (((~|(8'had)) ? (~|(8'hb4)) : ((8'hb1) != (8'hb1))) || (((8'hb2) ? (8'hb7) : (8'hb4)) ? (&(7'h41)) : ((8'hb3) ? (8'h9c) : (8'hbd))))) ? (^~({(~&(8'hbc)), {(8'h9c), (8'hae)}} ? ({(8'hab), (8'hb9)} >= (8'h9c)) : {(&(8'hac))})) : (^((((8'h9f) - (8'hb5)) & ((7'h44) << (8'hb3))) > {((7'h41) ? (8'hb3) : (8'h9e)), ((8'hbc) != (7'h40))}))))
(y, clk, wire168, wire167, wire166, wire165, wire164);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire168;
  input wire [(4'h9):(1'h0)] wire167;
  input wire [(5'h14):(1'h0)] wire166;
  input wire signed [(5'h12):(1'h0)] wire165;
  input wire [(5'h15):(1'h0)] wire164;
  wire signed [(4'hf):(1'h0)] wire200;
  wire signed [(3'h7):(1'h0)] wire185;
  wire [(3'h6):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire169;
  reg signed [(4'hb):(1'h0)] reg199 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg198 = (1'h0);
  reg [(5'h13):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg196 = (1'h0);
  reg [(4'hd):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg194 = (1'h0);
  reg [(5'h15):(1'h0)] reg193 = (1'h0);
  reg [(2'h2):(1'h0)] reg192 = (1'h0);
  reg [(4'h9):(1'h0)] reg191 = (1'h0);
  reg signed [(4'he):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg189 = (1'h0);
  reg signed [(4'he):(1'h0)] reg188 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg184 = (1'h0);
  reg [(3'h6):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(3'h5):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg177 = (1'h0);
  reg [(4'h8):(1'h0)] reg176 = (1'h0);
  reg [(4'h8):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg174 = (1'h0);
  reg [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(4'ha):(1'h0)] reg172 = (1'h0);
  reg [(4'he):(1'h0)] reg171 = (1'h0);
  assign y = {wire200,
                 wire185,
                 wire170,
                 wire169,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire169 = $unsigned(wire165[(5'h11):(4'hb)]);
  assign wire170 = wire168[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg171 <= wire168[(2'h2):(1'h0)];
      reg172 <= (~^wire164[(5'h11):(4'hb)]);
      reg173 <= ($signed($signed($unsigned({wire164}))) ?
          wire164 : (~^(~^(wire170 ?
              (reg171 == wire169) : (wire166 ? reg171 : wire167)))));
      if (({{reg172[(1'h1):(1'h0)], ((7'h40) ? wire164 : $unsigned(wire164))}} ?
          reg171[(4'h9):(4'h9)] : (^$signed(wire169[(4'ha):(4'ha)]))))
        begin
          reg174 <= wire170;
          reg175 <= reg172;
          if ((7'h42))
            begin
              reg176 <= wire165;
              reg177 <= $signed((~&wire164[(4'h8):(4'h8)]));
              reg178 <= reg172;
            end
          else
            begin
              reg176 <= wire169;
              reg177 <= (~$unsigned(({{(8'ha2), reg177}} ?
                  wire169 : (+(reg171 ? (8'hb1) : wire169)))));
              reg178 <= $unsigned({(($unsigned((7'h42)) ?
                      $signed(reg178) : (wire169 || reg171)) & ($signed(wire170) ?
                      $unsigned(reg173) : (^reg176))),
                  ((-$signed(wire166)) ?
                      (!$signed(reg174)) : $signed($signed(wire165)))});
            end
          reg179 <= (!reg174[(1'h0):(1'h0)]);
          if ($signed(({(+(reg179 ? reg179 : reg176))} ?
              (^(wire168[(3'h4):(2'h3)] ?
                  (reg172 ?
                      wire164 : wire168) : {reg175})) : (~|$unsigned((~wire165))))))
            begin
              reg180 <= (reg175 ? wire166 : (+$signed((8'h9c))));
              reg181 <= $unsigned({(~&{(~wire170), (reg179 <= reg180)})});
              reg182 <= reg174[(1'h1):(1'h0)];
              reg183 <= $unsigned(reg180);
              reg184 <= reg178;
            end
          else
            begin
              reg180 <= ((~|wire164) != ({{(~reg175),
                      $unsigned((8'hb8))}} << $signed({{reg173}})));
            end
        end
      else
        begin
          reg174 <= $unsigned(($unsigned({$unsigned((8'h9e)),
                  {reg171, reg184}}) ?
              $unsigned((reg179[(2'h3):(1'h1)] ?
                  (7'h40) : $signed(reg181))) : $signed($unsigned((+wire167)))));
          reg175 <= {{wire166, (&$unsigned(wire170[(1'h0):(1'h0)]))}};
          reg176 <= $signed(wire170[(3'h6):(3'h6)]);
        end
    end
  assign wire185 = reg184[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (reg180[(2'h3):(1'h0)])
        begin
          reg186 <= (+$signed(($signed($unsigned((8'hb1))) ^ $signed((wire169 ?
              reg178 : wire167)))));
          if (wire169[(4'h9):(3'h4)])
            begin
              reg187 <= (&(reg186[(1'h1):(1'h1)] > (!reg175)));
              reg188 <= $signed((-wire169[(5'h13):(5'h13)]));
              reg189 <= (~|(^~(^~wire164)));
              reg190 <= (((reg172[(2'h3):(2'h2)] ?
                          reg182[(3'h5):(3'h4)] : $signed(reg179[(3'h5):(1'h0)])) ?
                      (((reg174 ? wire169 : reg172) ?
                              wire164[(4'ha):(3'h5)] : ((8'hb0) ?
                                  reg180 : reg181)) ?
                          (reg186[(1'h1):(1'h0)] >> (wire170 ?
                              reg173 : reg186)) : $signed((7'h42))) : (reg189[(2'h3):(1'h0)] ?
                          (!$signed((8'hb8))) : (reg189[(4'hf):(2'h3)] ?
                              (~reg178) : $signed(reg187)))) ?
                  (^~{((^reg184) ? $signed(wire170) : $unsigned((8'h9f))),
                      {$signed(wire185), reg175[(4'h8):(2'h2)]}}) : (8'ha9));
            end
          else
            begin
              reg187 <= (^(8'hbb));
              reg188 <= $unsigned($signed(reg175[(2'h3):(1'h1)]));
            end
          if ({(reg175[(2'h2):(1'h1)] ?
                  wire165 : $unsigned({$signed(wire166)})),
              (!((reg173 >>> (reg187 ? (8'hb8) : wire165)) ?
                  ((&wire164) + (-(8'hb0))) : $unsigned({(8'ha2), reg189})))})
            begin
              reg191 <= reg178;
            end
          else
            begin
              reg191 <= $unsigned($unsigned(reg172));
              reg192 <= reg184[(2'h2):(1'h1)];
              reg193 <= wire167[(2'h2):(1'h1)];
              reg194 <= reg175;
            end
          reg195 <= (-$signed({reg186[(2'h3):(2'h3)]}));
        end
      else
        begin
          if ((reg193 ~^ wire166[(4'hb):(1'h1)]))
            begin
              reg186 <= ($signed((+reg174)) ?
                  (~^(!reg179[(3'h5):(1'h1)])) : wire170[(2'h2):(1'h1)]);
            end
          else
            begin
              reg186 <= {$unsigned(wire166[(1'h1):(1'h1)]),
                  reg173[(3'h4):(1'h0)]};
              reg187 <= {(reg183 ?
                      reg176[(4'h8):(1'h1)] : $signed({(reg188 < reg195)}))};
            end
        end
      reg196 <= (($unsigned(((reg175 << (8'ha7)) ? $signed(reg171) : wire169)) ?
              (-(8'hb1)) : $unsigned($unsigned((reg171 ? reg179 : reg179)))) ?
          ((~&((reg190 << (8'ha0)) < wire165)) ^ ((|(8'hbb)) ?
              reg175[(3'h7):(2'h3)] : reg176[(3'h4):(1'h0)])) : $signed($signed((~|reg171))));
      reg197 <= (8'hac);
      reg198 <= (^$signed($signed(reg176[(1'h0):(1'h0)])));
      reg199 <= $signed(reg172);
    end
  assign wire200 = ((~&reg199) ^~ $signed((~^(|$signed(reg195)))));
endmodule

module module140  (y, clk, wire144, wire143, wire142, wire141);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire144;
  input wire [(3'h7):(1'h0)] wire143;
  input wire signed [(4'h8):(1'h0)] wire142;
  input wire [(5'h12):(1'h0)] wire141;
  wire [(4'ha):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire147;
  wire signed [(4'h9):(1'h0)] wire146;
  wire signed [(2'h3):(1'h0)] wire145;
  reg signed [(5'h15):(1'h0)] reg155 = (1'h0);
  reg [(4'he):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  assign y = {wire156,
                 wire147,
                 wire146,
                 wire145,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  assign wire145 = (wire143 ?
                       ((((wire142 ?
                               (8'hab) : wire141) >= $signed((8'ha0))) * $unsigned($unsigned((8'ha0)))) ?
                           (({wire144} && {wire141, wire142}) ?
                               (~^(wire144 ?
                                   wire141 : (8'hbf))) : wire143[(1'h0):(1'h0)]) : wire141[(5'h12):(4'ha)]) : ((-(((8'hb4) & (8'ha3)) <<< (wire144 ?
                           (8'hb4) : wire141))) & wire142));
  assign wire146 = (wire141 ?
                       ((^~($signed(wire142) <<< $signed((8'haa)))) ?
                           wire142[(1'h1):(1'h0)] : wire142) : wire142[(2'h3):(1'h1)]);
  assign wire147 = (^~wire145);
  always
    @(posedge clk) begin
      reg148 <= (-wire143[(3'h6):(1'h0)]);
      reg149 <= (|wire141[(4'hd):(2'h3)]);
      reg150 <= {wire143[(3'h4):(1'h0)],
          (~|$signed((wire146[(3'h7):(3'h4)] ?
              wire147[(2'h2):(1'h1)] : {wire141})))};
      if ((wire142[(3'h5):(2'h3)] != {(((reg149 ?
              wire141 : reg149) ^~ $unsigned(wire144)) ~^ (|$signed(wire147))),
          (~|reg148[(3'h7):(2'h3)])}))
        begin
          if (reg150)
            begin
              reg151 <= ((wire143 <= ($unsigned($unsigned(wire141)) * $signed((wire145 >= wire142)))) ?
                  (~&(($unsigned(reg148) != (reg149 || wire144)) ?
                      wire141 : wire143[(1'h0):(1'h0)])) : reg148);
              reg152 <= (!$signed((&(~^wire144[(3'h5):(3'h5)]))));
              reg153 <= $unsigned(($unsigned({(!wire142)}) ?
                  wire147[(4'h9):(3'h4)] : {($signed(wire146) != {(8'hbe)})}));
              reg154 <= $signed($signed($signed($signed((~reg153)))));
              reg155 <= reg151;
            end
          else
            begin
              reg151 <= $signed(({{reg155}} ?
                  ({(wire141 > wire143),
                      (wire143 - reg151)} ^~ reg154[(3'h4):(1'h1)]) : ((~^(wire143 + wire147)) ?
                      (((8'hb5) && wire141) ?
                          wire146 : $signed((8'hb6))) : $unsigned(reg151[(3'h6):(3'h4)]))));
              reg152 <= (~((($signed(wire142) | wire145[(1'h0):(1'h0)]) ?
                      $unsigned(reg153) : ((wire143 ^~ reg154) ?
                          wire144[(3'h5):(1'h0)] : (reg150 != reg153))) ?
                  ({$unsigned(wire144),
                      (wire141 < reg153)} < (^~$signed(wire146))) : $unsigned(reg155[(4'he):(2'h3)])));
              reg153 <= reg152;
              reg154 <= (~^wire146);
              reg155 <= $unsigned(reg155);
            end
        end
      else
        begin
          reg151 <= $signed(((($signed(reg149) ?
                      (|wire141) : $unsigned((8'ha6))) ?
                  (~|(-reg152)) : ({wire147} ?
                      $unsigned(reg154) : (reg149 < wire141))) ?
              reg148 : ((&(wire145 ? (8'hb5) : (8'haa))) ?
                  ((wire146 >>> reg151) - $unsigned(wire144)) : wire144[(3'h6):(3'h6)])));
          reg152 <= (~wire146);
          reg153 <= $unsigned($signed($signed($signed(wire145))));
        end
    end
  assign wire156 = $unsigned($signed(((!$signed(reg154)) == ($unsigned(reg148) ~^ $signed(wire141)))));
endmodule

module module121
#(parameter param136 = {(&(^((~^(8'hb2)) ~^ ((8'hb2) ? (8'ha3) : (8'ha1)))))})
(y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire125;
  input wire signed [(5'h14):(1'h0)] wire124;
  input wire [(4'hb):(1'h0)] wire123;
  input wire [(5'h13):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire127;
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  assign y = {wire135,
                 wire130,
                 wire127,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg129,
                 reg128,
                 reg126,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg126 <= ((wire122[(1'h0):(1'h0)] ?
          wire125[(4'ha):(1'h0)] : wire125) == wire122[(5'h12):(4'hd)]);
    end
  assign wire127 = (-$unsigned((-$signed((~&wire124)))));
  always
    @(posedge clk) begin
      if (({((&reg126) & ((+wire122) + {(8'h9f)})),
              (((!wire124) < $signed(reg126)) == ((wire124 <<< wire123) ?
                  (|reg126) : wire124[(3'h6):(3'h5)]))} ?
          (wire127 || wire122) : (^~((~$unsigned((8'hba))) <= $unsigned(wire127[(1'h0):(1'h0)])))))
        begin
          reg128 <= ((7'h44) & {$unsigned($signed({wire127, wire123}))});
        end
      else
        begin
          reg128 <= wire125[(4'h9):(3'h4)];
        end
      reg129 <= $signed(reg128[(1'h1):(1'h0)]);
    end
  assign wire130 = wire125[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg131 <= reg126;
      reg132 <= $signed((^~($unsigned((wire130 ? wire130 : wire122)) ?
          $unsigned(wire123[(4'ha):(4'h9)]) : wire124)));
      reg133 <= ($unsigned(((-(reg126 != reg128)) ?
              {wire124, {wire127, reg126}} : $signed(wire125[(3'h6):(1'h0)]))) ?
          (reg128[(4'ha):(3'h4)] | reg129) : $unsigned((8'hba)));
      reg134 <= wire130;
    end
  assign wire135 = reg126;
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire83;
  input wire signed [(3'h5):(1'h0)] wire82;
  input wire [(4'h8):(1'h0)] wire81;
  input wire [(5'h10):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire114;
  wire [(5'h14):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire84;
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire84,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire84 = $unsigned(wire83);
  always
    @(posedge clk) begin
      reg85 <= wire81[(3'h7):(1'h1)];
      reg86 <= (^($unsigned(wire82) ?
          (($signed(wire81) ? (wire84 > (8'haa)) : $signed(wire81)) ?
              $signed(wire83[(5'h11):(3'h7)]) : ((wire80 ?
                  wire82 : wire80) ~^ (wire80 ?
                  wire82 : (8'hba)))) : reg85[(3'h6):(2'h3)]));
      reg87 <= (-$unsigned($signed((-$signed((8'hab))))));
    end
  assign wire88 = reg86[(3'h5):(3'h5)];
  assign wire89 = $unsigned(wire80);
  assign wire90 = (!((8'hbd) ~^ wire80[(4'hb):(2'h3)]));
  assign wire91 = {wire81};
  always
    @(posedge clk) begin
      reg92 <= {(reg85 != $signed($signed($unsigned(wire81)))), (7'h42)};
      if ({$unsigned(wire80),
          ($unsigned($signed($signed(reg92))) < $unsigned($signed((+wire80))))})
        begin
          if (reg85[(3'h6):(1'h0)])
            begin
              reg93 <= {((((wire82 < reg87) ?
                      (|(8'ha3)) : $signed((7'h44))) | (~&(wire89 & wire88))) ^ $unsigned((~&wire83[(3'h4):(3'h4)]))),
                  (&(((^~wire88) == {wire82, wire88}) ? wire88 : wire89))};
              reg94 <= $unsigned(reg85[(3'h6):(1'h1)]);
              reg95 <= (~|reg85);
            end
          else
            begin
              reg93 <= ((~$signed(wire82)) >= wire90[(3'h6):(3'h5)]);
              reg94 <= (wire82[(3'h4):(3'h4)] ?
                  (&(^(8'hb5))) : (($signed($signed(wire80)) ?
                          (reg87[(3'h4):(1'h1)] ?
                              (~^reg87) : reg95[(3'h6):(2'h2)]) : (|(wire89 ?
                              reg93 : (8'hbd)))) ?
                      wire88 : reg86));
            end
        end
      else
        begin
          reg93 <= (reg86 & (((^~{(8'ha2)}) + wire83) + ((!$signed(reg92)) ?
              $signed(reg92[(3'h7):(3'h4)]) : ($unsigned(reg86) | (^~reg85)))));
          reg94 <= reg94;
          reg95 <= wire82;
          reg96 <= (wire91 && $unsigned($signed($unsigned((wire83 ?
              (8'hb4) : wire91)))));
        end
      reg97 <= reg86[(3'h7):(3'h5)];
      reg98 <= {$unsigned(((reg87 == $signed(reg92)) >= $signed((reg87 ?
              wire82 : reg92))))};
    end
  assign wire99 = reg98;
  assign wire100 = $signed((^~wire82[(1'h1):(1'h1)]));
  assign wire101 = (reg95[(2'h3):(1'h0)] <= $unsigned(reg94));
  assign wire102 = wire89[(4'hb):(2'h2)];
  assign wire103 = (|(~&((~&(wire102 != wire80)) <<< reg85)));
  assign wire104 = ((({$signed((8'ha6)), wire90} ? wire83 : $signed(reg93)) ?
                           $unsigned(((wire102 ? reg94 : reg85) ?
                               {(8'h9d)} : (reg92 ?
                                   wire100 : (8'ha5)))) : (reg95 ?
                               (&(~|reg92)) : {$unsigned(reg86),
                                   (wire103 >> wire100)})) ?
                       (wire84[(4'h9):(2'h2)] ?
                           ({{wire80, wire102}} ?
                               reg85 : reg85[(3'h6):(1'h0)]) : (|(~^((8'ha8) ?
                               reg95 : wire103)))) : $signed($signed(wire83)));
  assign wire105 = wire90;
  assign wire106 = ((($signed(((8'hbf) ?
                               reg86 : wire82)) + $signed($signed(wire84))) ?
                           (!$unsigned((^~wire99))) : wire83) ?
                       wire105 : ($signed($signed($unsigned(wire88))) >>> wire81[(2'h2):(1'h0)]));
  assign wire107 = wire100;
  assign wire108 = $unsigned(wire90);
  assign wire109 = wire106[(2'h3):(1'h1)];
  assign wire110 = (~^wire102);
  assign wire111 = wire104[(5'h10):(4'hf)];
  assign wire112 = ($signed(wire81) ? $unsigned($unsigned(wire104)) : wire100);
  assign wire113 = (wire103 ^ ({$unsigned($unsigned(wire111)),
                       ((wire90 <<< wire106) + {(8'ha5),
                           wire110})} + (($unsigned((8'hb9)) ?
                       (wire83 ?
                           wire82 : wire89) : (reg86 && (8'ha6))) > wire108)));
  assign wire114 = (!((-(+(~&wire104))) != reg92[(4'ha):(1'h0)]));
endmodule
