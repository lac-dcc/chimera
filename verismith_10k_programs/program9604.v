module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire74;
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire74,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire4 = ($signed(wire2[(2'h2):(1'h1)]) ?
                     wire2 : $signed({$signed($unsigned(wire2))}));
  assign wire5 = $signed($signed($unsigned(wire2)));
  assign wire6 = $signed(($signed($unsigned(wire0)) ?
                     (!($signed(wire0) >>> $unsigned(wire2))) : wire4));
  assign wire7 = wire3;
  module8 #() modinst75 (wire74, clk, wire1, wire6, wire5, wire0, wire3);
  assign wire76 = (~(8'hb2));
  assign wire77 = ((^~(~^($unsigned((8'h9e)) - wire6[(4'hb):(4'h8)]))) >= (-($signed((+wire74)) ?
                      wire74 : (wire4 >>> $signed(wire4)))));
  assign wire78 = $unsigned({($signed(wire3[(3'h5):(1'h0)]) ?
                          ($signed((8'hb1)) | wire1[(2'h3):(2'h3)]) : wire2),
                      {$unsigned(wire74[(3'h5):(3'h5)]),
                          ((wire0 || wire74) ? wire2 : wire3)}});
  always
    @(posedge clk) begin
      reg79 <= (^~wire5[(4'h8):(4'h8)]);
      reg80 <= wire0[(1'h0):(1'h0)];
    end
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(4'h8):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire70;
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire14,
                 wire70,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire14 = (wire12 ?
                      {{((-wire10) == (wire13 | wire10))},
                          wire9[(1'h0):(1'h0)]} : (&wire12));
  always
    @(posedge clk) begin
      if (wire10[(1'h0):(1'h0)])
        begin
          reg15 <= wire12[(3'h7):(2'h3)];
          reg16 <= ((((8'hbb) <= $unsigned((reg15 ?
              wire14 : wire9))) >>> (8'hb3)) - $signed((wire11[(3'h4):(1'h0)] & reg15[(2'h3):(2'h3)])));
          reg17 <= wire10;
        end
      else
        begin
          reg15 <= (wire10 ?
              ($unsigned($signed((wire14 ?
                  wire11 : wire14))) ^~ ($unsigned($signed(reg17)) ?
                  {wire14,
                      $unsigned(wire9)} : {$unsigned(wire12)})) : ((!wire9[(4'h9):(1'h1)]) ~^ (+reg16)));
          if ((^~(-(wire14[(4'hb):(3'h6)] && (~&wire14)))))
            begin
              reg16 <= (wire14[(2'h2):(2'h2)] || reg15[(3'h6):(1'h0)]);
              reg17 <= reg15;
              reg18 <= wire14[(3'h6):(1'h1)];
              reg19 <= (((7'h43) ? (^~(~|(+reg15))) : reg17) ?
                  ((^~{(reg18 ? reg17 : wire9),
                      $unsigned(wire13)}) >> $signed(wire14)) : $signed(wire11));
            end
          else
            begin
              reg16 <= $signed($unsigned(wire11));
              reg17 <= $signed(($signed((wire10 > wire9[(4'h9):(4'h8)])) ?
                  wire9 : (wire13 ? reg17[(2'h2):(1'h1)] : (~&wire10))));
              reg18 <= $unsigned(((reg16[(2'h2):(1'h0)] < ((wire9 ?
                  reg17 : wire14) <= wire9)) != ($unsigned(reg19[(1'h1):(1'h1)]) >= (-(~&wire13)))));
            end
        end
      if ($signed($signed($signed({{reg16, reg18}, wire10}))))
        begin
          if ($unsigned(((~^reg15) == (wire12 ?
              ((wire11 >= (8'hbc)) ^~ (reg15 << (7'h42))) : (reg17 <<< wire12[(4'h8):(3'h4)])))))
            begin
              reg20 <= wire14[(3'h4):(1'h1)];
              reg21 <= $signed($unsigned($signed({(^reg17)})));
            end
          else
            begin
              reg20 <= (&({$unsigned($signed(reg18))} | (((~^wire10) ?
                      $signed(reg17) : {reg16, reg17}) ?
                  wire9 : (-(reg19 == reg20)))));
              reg21 <= (((8'hbc) && {($signed(wire12) > (^~wire13))}) == wire11[(1'h1):(1'h0)]);
              reg22 <= $signed((+$signed($unsigned({(8'ha4), (8'ha3)}))));
            end
          if ({$unsigned(((reg18[(2'h2):(1'h0)] ?
                  $signed(wire12) : (+reg21)) - (reg21[(1'h1):(1'h1)] <<< {(8'hb5),
                  wire10})))})
            begin
              reg23 <= reg17[(2'h2):(1'h0)];
              reg24 <= (reg19[(4'h8):(3'h5)] ?
                  $signed(wire10[(3'h5):(2'h3)]) : (wire12[(1'h1):(1'h0)] == reg23[(2'h3):(2'h2)]));
              reg25 <= wire10[(1'h0):(1'h0)];
            end
          else
            begin
              reg23 <= reg22;
              reg24 <= reg21[(4'he):(2'h3)];
              reg25 <= $unsigned(((!(~^$signed((8'ha1)))) ?
                  reg24 : (-((7'h40) ? (!reg21) : $unsigned((8'hbf))))));
              reg26 <= {$signed($unsigned((&wire13[(3'h6):(3'h4)]))),
                  ($unsigned((reg24[(2'h3):(2'h2)] ?
                          ((8'hb1) >= wire11) : (~^reg20))) ?
                      reg16[(1'h1):(1'h0)] : $signed((reg22[(3'h6):(2'h3)] ?
                          $unsigned(wire9) : wire12[(3'h6):(3'h6)])))};
            end
          if ((-$unsigned($signed((+(reg19 ? reg22 : wire14))))))
            begin
              reg27 <= $signed({reg25, {$unsigned((~&reg18))}});
              reg28 <= (&reg18);
              reg29 <= $signed(((wire11[(2'h2):(1'h0)] + ({(8'ha1)} && (|wire9))) ?
                  ((((8'ha5) & reg20) ?
                      wire13 : (reg18 | reg23)) ~^ ((&reg16) ~^ $unsigned(wire12))) : $unsigned(reg16[(2'h2):(2'h2)])));
              reg30 <= $unsigned($unsigned(reg25[(4'h9):(3'h4)]));
              reg31 <= (reg29[(3'h6):(1'h0)] ?
                  reg30[(4'ha):(2'h3)] : $unsigned($unsigned(reg18)));
            end
          else
            begin
              reg27 <= ($signed(($unsigned((reg19 ^ wire9)) && reg16)) ?
                  reg30[(4'hb):(4'h9)] : $unsigned(((^~$signed((8'h9c))) ?
                      ($signed(wire13) - (wire12 >>> reg24)) : reg29[(1'h1):(1'h0)])));
              reg28 <= reg20;
              reg29 <= $unsigned((reg25 ?
                  (!((&(8'hbe)) + $signed(wire12))) : reg23[(3'h4):(2'h2)]));
              reg30 <= ((~&wire9) + reg25[(4'h9):(1'h0)]);
              reg31 <= $unsigned((7'h40));
            end
          reg32 <= (reg15[(3'h7):(2'h3)] != (^~(reg25 ?
              $signed((wire9 > (8'ha0))) : wire12[(4'ha):(3'h4)])));
          reg33 <= reg30[(2'h3):(2'h2)];
        end
      else
        begin
          if (reg16[(2'h2):(1'h0)])
            begin
              reg20 <= ((+$unsigned(((reg24 ^ (8'ha8)) <= $unsigned(reg20)))) | reg19);
              reg21 <= ((|$unsigned((&(reg25 <= reg28)))) < wire11);
            end
          else
            begin
              reg20 <= (!$signed($signed($signed(((8'h9e) ? reg25 : reg19)))));
              reg21 <= (wire11 ?
                  (({reg30} & {(reg18 ?
                          wire12 : wire9)}) << ((reg25[(3'h5):(1'h1)] ?
                          ((8'ha3) <<< reg27) : (reg15 ? reg20 : wire13)) ?
                      (reg33[(4'h8):(1'h0)] <<< $signed(reg21)) : (((8'hbc) ?
                              reg28 : wire11) ?
                          $unsigned(reg16) : $signed(reg22)))) : reg21[(4'h9):(3'h5)]);
              reg22 <= (|$signed(((wire10 > reg17[(2'h3):(1'h1)]) <= (&$signed(reg27)))));
              reg23 <= ($unsigned(({reg21, $signed(reg16)} >= ((reg30 ?
                  wire10 : (8'ha4)) < (-reg33)))) == (8'ha0));
              reg24 <= ((($unsigned((reg18 ?
                          reg31 : reg33)) < {$signed(reg15)}) ?
                      reg17 : reg31) ?
                  (&(wire14 ?
                      wire10[(3'h7):(3'h5)] : ($unsigned(reg23) ?
                          {reg29} : $unsigned(reg22)))) : $signed(($signed($signed(wire10)) ?
                      $signed(reg17[(3'h4):(3'h4)]) : $signed($signed(wire12)))));
            end
          reg25 <= $signed((~|($unsigned(reg31[(2'h3):(2'h2)]) << wire12)));
        end
      reg34 <= reg22;
      reg35 <= wire9[(2'h2):(2'h2)];
    end
  module36 #() modinst71 (wire70, clk, reg19, reg23, reg34, wire9);
  assign wire72 = $unsigned((~$unsigned({$unsigned(reg33),
                      reg27[(2'h2):(2'h2)]})));
  assign wire73 = $unsigned({$unsigned((^~$unsigned(reg26)))});
endmodule

module module36
#(parameter param68 = (({(~^{(8'hb6)})} ? (({(7'h42)} & ((7'h41) ? (8'hb2) : (8'had))) << (~^((7'h43) ? (8'hbd) : (8'hb8)))) : ({((8'hb9) ? (8'ha7) : (7'h40)), (~(8'haf))} ? (((8'hba) ? (8'hb4) : (8'hab)) ? ((7'h40) < (8'ha8)) : (~|(8'h9c))) : (((8'ha3) << (8'hbd)) ? (~(8'hb1)) : ((8'hae) == (8'ha3))))) | ((&((~|(8'hb0)) == ((8'haf) ? (7'h41) : (8'h9f)))) == {{(^~(8'hbf))}})), 
parameter param69 = ({((-param68) + param68), (((param68 ? param68 : param68) ? param68 : (!param68)) != (^~(param68 + (8'ha2))))} ? ({(!(8'hbb)), ({param68, param68} ? ((8'hb0) ? (8'ha7) : param68) : (|param68))} ^~ (param68 ? ((param68 ? param68 : param68) ? (param68 ? param68 : param68) : (!param68)) : (+(+(8'ha5))))) : param68))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire40;
  input wire signed [(4'hb):(1'h0)] wire39;
  input wire [(5'h15):(1'h0)] wire38;
  input wire [(2'h3):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire41 = (^$unsigned(($signed($unsigned(wire39)) >> wire40)));
  assign wire42 = (wire37 << wire37[(2'h3):(2'h2)]);
  assign wire43 = wire42[(3'h4):(1'h1)];
  assign wire44 = {wire42[(5'h10):(1'h1)], wire42[(4'ha):(4'h8)]};
  assign wire45 = (~&(7'h41));
  assign wire46 = $signed((&(wire44 < wire38[(4'hb):(1'h0)])));
  assign wire47 = $signed((($unsigned((^~wire42)) ~^ (wire38[(5'h12):(1'h0)] || $signed(wire42))) << wire45[(3'h6):(3'h6)]));
  assign wire48 = {{{{(+wire40)}}, wire43[(4'ha):(2'h2)]},
                      (((wire42[(5'h12):(5'h12)] <= wire40) == {(wire46 < wire38),
                              $signed((8'h9e))}) ?
                          (+$signed((!wire42))) : ((wire42[(3'h4):(1'h0)] == wire42) <<< $signed(wire43)))};
  assign wire49 = $signed($unsigned(wire48[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg50 <= $unsigned(wire37);
      reg51 <= (~|$unsigned((~|$signed((wire37 && wire42)))));
    end
  assign wire52 = (wire37[(1'h1):(1'h0)] ?
                      $unsigned(wire39) : ((($signed(wire39) ?
                          (wire44 | wire44) : (~^(8'hb4))) < $signed((wire40 == wire45))) & (|$unsigned($signed(wire41)))));
  assign wire53 = (wire48[(1'h0):(1'h0)] + (&(8'hb1)));
  assign wire54 = $unsigned(($unsigned($unsigned(wire46)) ?
                      ($unsigned($signed(wire46)) ?
                          wire38[(5'h10):(5'h10)] : $unsigned({wire53,
                              wire48})) : ((^~$unsigned(wire37)) ?
                          wire44 : ({wire47} ?
                              (wire42 ?
                                  wire38 : wire45) : (wire47 <<< wire40)))));
  assign wire55 = wire42;
  always
    @(posedge clk) begin
      if ($signed((((^(-wire42)) ?
              $signed($signed(wire42)) : wire39[(3'h6):(3'h6)]) ?
          reg50[(1'h0):(1'h0)] : $signed($signed(((7'h42) ?
              wire39 : (7'h44)))))))
        begin
          if ((-(^wire52[(4'h8):(2'h2)])))
            begin
              reg56 <= wire41;
              reg57 <= ((+wire55) > (8'hb1));
            end
          else
            begin
              reg56 <= $unsigned(wire41);
              reg57 <= $signed(wire53[(4'hf):(2'h3)]);
              reg58 <= $unsigned(({(~|((8'hb7) ? wire48 : (8'hbd))),
                      $signed(wire39[(4'h8):(3'h5)])} ?
                  wire55[(4'hb):(3'h7)] : ((((8'h9d) ? (8'ha7) : wire44) ?
                      (&wire45) : {wire47, wire41}) - (wire44 <<< wire54))));
            end
          reg59 <= wire40[(1'h0):(1'h0)];
        end
      else
        begin
          reg56 <= wire54[(3'h6):(2'h3)];
          if ((~&reg59[(1'h0):(1'h0)]))
            begin
              reg57 <= $signed($unsigned($unsigned((!$signed(wire37)))));
              reg58 <= {(8'hbd)};
              reg59 <= ($signed($unsigned((wire54 > reg57[(1'h1):(1'h1)]))) || (^~wire44[(4'hc):(3'h5)]));
            end
          else
            begin
              reg57 <= $unsigned(wire46);
              reg58 <= $unsigned($signed($signed(wire54[(4'h9):(1'h1)])));
              reg59 <= (|wire38);
            end
          if ($unsigned(wire43[(2'h3):(1'h1)]))
            begin
              reg60 <= reg57;
            end
          else
            begin
              reg60 <= (8'hb6);
              reg61 <= wire38[(3'h5):(1'h1)];
              reg62 <= $unsigned((((-{reg58, wire38}) ?
                  $signed({wire40}) : $signed((~&reg58))) ^~ {wire49[(1'h1):(1'h0)]}));
            end
          reg63 <= reg60[(1'h0):(1'h0)];
          reg64 <= {({wire43[(4'h9):(3'h5)]} ?
                  {reg63[(3'h6):(2'h3)]} : {$unsigned($signed(wire53))}),
              (wire38 ?
                  (-wire49[(1'h1):(1'h0)]) : $signed($unsigned((wire53 ~^ wire53))))};
        end
      reg65 <= ($unsigned($signed($signed((reg51 ^ (8'ha5))))) ?
          $unsigned(({wire44[(4'hf):(4'h9)], wire41} ?
              {$unsigned(wire46), $signed(reg57)} : ($signed(wire42) ?
                  wire47[(1'h0):(1'h0)] : wire47))) : reg57[(2'h3):(2'h2)]);
    end
  assign wire66 = $unsigned(wire40);
  assign wire67 = $signed($unsigned($unsigned($unsigned($signed(reg62)))));
endmodule
