module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h267):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire37;
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire70,
                 wire69,
                 wire68,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
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
                 reg71,
                 reg67,
                 reg66,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg44,
                 (1'h0)};
  module5 #() modinst38 (.y(wire37), .clk(clk), .wire8(wire1), .wire10(wire0), .wire7(wire4), .wire6(wire2), .wire9(wire3));
  assign wire39 = wire37;
  assign wire40 = wire4;
  assign wire41 = ((~^$signed(((wire2 ? wire1 : wire40) >> {wire40, wire40}))) ?
                      (~|({(wire4 ? wire37 : wire3), (wire2 ? wire39 : wire1)} ?
                          $unsigned(wire40[(4'hd):(3'h6)]) : ((wire3 ?
                              wire37 : wire3) == $unsigned(wire40)))) : ((+wire40) != wire1));
  assign wire42 = {$unsigned($unsigned((8'ha5)))};
  assign wire43 = (^~(8'hb1));
  always
    @(posedge clk) begin
      reg44 <= $signed($unsigned(wire3[(3'h6):(3'h5)]));
    end
  assign wire45 = ($signed(((wire4[(2'h2):(2'h2)] <<< (wire4 == (8'hbd))) + wire4)) ?
                      $signed((8'ha2)) : wire39[(2'h2):(1'h1)]);
  assign wire46 = $unsigned(wire37[(3'h5):(2'h2)]);
  assign wire47 = $unsigned($signed(wire37[(4'h8):(1'h0)]));
  always
    @(posedge clk) begin
      reg48 <= (~|({$signed($unsigned(reg44)),
              (wire42 && wire40[(4'hf):(4'he)])} ?
          wire41 : {reg44[(4'hd):(3'h5)],
              ($signed(wire41) ?
                  (wire1 ? (8'hba) : wire40) : (wire1 >>> (8'hb4)))}));
      reg49 <= $unsigned($signed((|((|(8'h9e)) ?
          (wire43 ? wire46 : wire47) : {(8'hb9)}))));
      reg50 <= (|$unsigned(wire0));
    end
  always
    @(posedge clk) begin
      if ((+wire0[(3'h6):(3'h5)]))
        begin
          if ({($signed(wire0) ?
                  ((~&$signed(wire40)) ?
                      $unsigned((~(8'hba))) : wire0[(4'hf):(3'h5)]) : (wire39[(3'h5):(2'h2)] ?
                      (wire47 < wire45) : ((7'h43) ?
                          (wire3 ? wire40 : reg48) : reg48)))})
            begin
              reg51 <= $signed((&wire45[(2'h2):(2'h2)]));
              reg52 <= ((wire40[(3'h4):(3'h4)] ?
                      wire46[(4'hd):(3'h7)] : ($signed($unsigned(reg51)) ?
                          (-(wire37 ? reg50 : reg50)) : {$signed((8'hb6))})) ?
                  wire39 : (({wire45[(4'hb):(2'h3)]} - wire42[(2'h2):(1'h1)]) && (wire40[(3'h5):(3'h4)] ?
                      reg44 : (^(|wire37)))));
              reg53 <= $unsigned(wire1);
              reg54 <= (reg49[(3'h7):(2'h2)] * {($unsigned(reg44[(1'h0):(1'h0)]) + {wire45}),
                  $unsigned($signed($unsigned((8'ha9))))});
            end
          else
            begin
              reg51 <= $unsigned(($signed($signed($signed(reg53))) ?
                  ($signed((reg50 >= (8'hbb))) ?
                      wire47[(4'h9):(4'h8)] : ((+reg48) >>> (|reg48))) : (wire2[(2'h3):(1'h1)] - wire37[(4'h9):(4'h8)])));
              reg52 <= {(wire37[(3'h4):(2'h2)] + (~&wire37[(4'ha):(1'h1)])),
                  ($unsigned((8'haf)) ^~ $unsigned($signed({wire43})))};
              reg53 <= (wire0[(1'h0):(1'h0)] ?
                  wire0[(3'h6):(2'h2)] : ((&wire39) & (~&(-$signed(reg51)))));
            end
          reg55 <= (8'hb7);
          reg56 <= ({$unsigned($unsigned((|(8'hbc))))} ~^ $signed(wire4[(3'h4):(1'h1)]));
          if (reg54[(4'h8):(3'h5)])
            begin
              reg57 <= ((~$unsigned(($signed(wire40) ?
                  (reg54 | wire2) : ((8'hb3) ?
                      wire40 : (7'h40))))) >>> $unsigned(($unsigned(((8'haa) ?
                      wire3 : wire41)) ?
                  $unsigned((~&reg49)) : $unsigned((&reg52)))));
            end
          else
            begin
              reg57 <= wire39[(1'h0):(1'h0)];
              reg58 <= ((($signed(reg55[(1'h1):(1'h0)]) <<< reg48) >>> $signed((wire39[(1'h0):(1'h0)] <= $signed(reg49)))) ?
                  reg50 : wire4[(2'h2):(1'h1)]);
            end
          if ((~|wire0))
            begin
              reg59 <= reg55;
              reg60 <= reg55;
              reg61 <= reg56;
              reg62 <= (wire46 ?
                  ({$unsigned($unsigned(wire41))} ?
                      ($unsigned($unsigned((8'hb3))) ?
                          (8'ha7) : $unsigned(reg50[(4'h8):(3'h5)])) : {($unsigned(reg59) ?
                              $signed((8'ha4)) : $unsigned(wire0)),
                          (((8'hbd) * (8'had)) ?
                              $unsigned((8'ha1)) : $unsigned(reg50))}) : reg56[(2'h3):(2'h2)]);
              reg63 <= ((^~reg62[(1'h1):(1'h1)]) + ($unsigned(((reg54 ~^ (8'hba)) ?
                      $signed(reg56) : (~&reg57))) ?
                  (|{{reg62}, (^~(8'hb4))}) : reg60));
            end
          else
            begin
              reg59 <= wire37;
            end
        end
      else
        begin
          reg51 <= reg60[(3'h5):(3'h4)];
          reg52 <= $signed(reg59);
          if ($signed(((reg61[(1'h0):(1'h0)] + (^~reg53)) ?
              (reg57 < wire3[(2'h3):(2'h2)]) : ($unsigned(reg53[(1'h0):(1'h0)]) ?
                  {$unsigned(wire0)} : wire2))))
            begin
              reg53 <= wire41[(2'h3):(2'h3)];
            end
          else
            begin
              reg53 <= {reg53[(3'h4):(1'h0)], wire46[(4'hf):(4'h8)]};
              reg54 <= (wire45[(3'h7):(1'h0)] * $signed($unsigned($signed($unsigned(wire47)))));
              reg55 <= (wire46 >>> wire43[(4'hf):(3'h4)]);
              reg56 <= $signed(($unsigned($signed($unsigned((8'ha7)))) | ($signed(wire42[(3'h7):(3'h5)]) << (^~(wire45 ?
                  wire37 : (8'hb4))))));
            end
          reg57 <= {$signed(wire45[(4'hb):(4'h8)]), $signed(reg63)};
          reg58 <= wire41[(3'h4):(1'h0)];
        end
      reg64 <= wire45;
      reg65 <= wire46[(4'he):(3'h6)];
      reg66 <= ($unsigned((wire3[(3'h5):(2'h3)] ?
          (reg50 ?
              (wire40 ?
                  reg51 : wire39) : (!reg64)) : (^wire3[(4'hb):(4'h8)]))) ^ (8'hb5));
      reg67 <= reg60[(3'h6):(2'h3)];
    end
  assign wire68 = $unsigned(wire2);
  assign wire69 = wire4;
  assign wire70 = wire42[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if ((8'hb9))
        begin
          reg71 <= {$signed($unsigned((~&reg51))), reg50};
          if ((~&reg53))
            begin
              reg72 <= ((|$signed($signed(reg52[(2'h2):(1'h0)]))) | ($unsigned(reg63) ?
                  ({$unsigned(wire3),
                      (reg67 > reg44)} + $unsigned(((8'ha3) + wire4))) : reg54[(1'h0):(1'h0)]));
            end
          else
            begin
              reg72 <= ($unsigned(reg48) - $unsigned($signed($unsigned((~|reg65)))));
              reg73 <= ($unsigned($signed((8'ha2))) >= {(+reg49[(3'h7):(1'h1)]),
                  ((^~reg64) ? (^~{reg72}) : ($signed(wire3) >> {reg62}))});
              reg74 <= $signed((reg56[(1'h1):(1'h1)] ?
                  ((^~(reg58 && wire43)) > (7'h42)) : {(|reg72[(3'h7):(3'h7)]),
                      ((wire69 ? wire41 : wire46) ?
                          (reg65 ? reg57 : wire1) : {reg54, reg67})}));
              reg75 <= $unsigned(reg65);
            end
          if ($unsigned(($signed(wire4[(1'h0):(1'h0)]) << wire3)))
            begin
              reg76 <= (^~$signed(wire37));
            end
          else
            begin
              reg76 <= (reg66[(4'he):(1'h0)] ?
                  (^(&($signed(reg55) ?
                      $signed(reg56) : (!reg62)))) : $unsigned($unsigned(reg51)));
              reg77 <= (reg48 ? (8'had) : $unsigned(reg75));
              reg78 <= wire3;
            end
          if ((^~(8'ha3)))
            begin
              reg79 <= {(^~$unsigned(reg54[(3'h5):(1'h0)]))};
              reg80 <= (wire40 << $signed(($unsigned({reg61}) || (reg55 < $signed((8'h9d))))));
              reg81 <= reg61[(2'h2):(1'h1)];
            end
          else
            begin
              reg79 <= (~$signed((~^({(7'h41), reg72} >= (8'hb3)))));
              reg80 <= (~reg44);
              reg81 <= (~&{(^$signed(reg51[(5'h13):(4'ha)]))});
              reg82 <= $signed(wire39);
            end
        end
      else
        begin
          reg71 <= {(reg49 == reg59[(5'h12):(3'h7)])};
        end
      reg83 <= ($unsigned(reg79[(4'h9):(3'h5)]) > (+{$unsigned(reg78[(4'h8):(2'h3)])}));
      reg84 <= {((reg50[(2'h2):(1'h1)] ?
              $signed(reg79[(4'hc):(2'h3)]) : (reg66[(4'hd):(4'ha)] ?
                  $signed(reg67) : (reg53 ?
                      wire3 : reg79))) - (($unsigned(reg60) <<< (reg66 > reg77)) ?
              ({wire41, wire1} >= wire47) : $signed((~reg77))))};
      reg85 <= {$unsigned(wire42), (+reg64[(2'h2):(1'h1)])};
      reg86 <= reg73;
    end
  always
    @(posedge clk) begin
      reg87 <= $unsigned(reg48);
      reg88 <= {(reg57 ?
              (($unsigned(reg73) ? $unsigned(reg73) : (-reg59)) ?
                  ({(7'h40),
                      wire47} | $signed(reg53)) : {wire1}) : (~$signed($signed(reg44))))};
    end
  assign wire89 = (~^$signed((8'hae)));
  assign wire90 = reg50;
endmodule

module module5
#(parameter param36 = (|{((((8'hb3) + (8'h9d)) ? ((8'ha8) ? (8'ha2) : (8'hb2)) : (8'haa)) ? (((8'haf) == (8'hb4)) ? {(8'hb1)} : ((8'haa) ? (8'hb3) : (7'h41))) : ((|(8'hb3)) ? ((8'ha7) ^~ (8'h9e)) : ((8'hab) ^~ (8'ha1)))), (|({(8'h9d)} ? (+(7'h41)) : (+(8'hb5))))}))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire11 = (~$signed((((wire8 || wire9) ?
                          wire6[(3'h5):(2'h3)] : (8'ha5)) ?
                      (~|(wire8 - wire7)) : ({wire10} ?
                          {wire8, wire10} : (-wire10)))));
  assign wire12 = ($unsigned(($signed((|wire11)) * wire11)) * {wire11,
                      $unsigned($unsigned((wire11 ? wire9 : wire10)))});
  assign wire13 = wire9[(2'h3):(2'h2)];
  assign wire14 = (8'hb1);
  assign wire15 = $signed({(wire10 <= wire9[(2'h2):(2'h2)]),
                      $signed(($signed((8'haa)) || $signed(wire9)))});
  assign wire16 = wire10[(4'he):(4'he)];
  always
    @(posedge clk) begin
      if (wire15)
        begin
          reg17 <= {(^wire14[(3'h7):(2'h3)])};
          reg18 <= ((!(+$signed((wire12 ? (7'h40) : (8'ha2))))) ^ {((wire7 ?
                  $signed(wire14) : ((8'h9c) ?
                      wire15 : (7'h41))) + (&wire10[(4'hb):(1'h1)]))});
          reg19 <= (+reg18);
          reg20 <= $signed((8'hb2));
        end
      else
        begin
          reg17 <= wire15[(1'h0):(1'h0)];
          reg18 <= wire9;
          if (((!((^{wire15, wire9}) * $unsigned(wire13))) ?
              $unsigned((wire16 <= (|{(8'hb6),
                  (8'ha2)}))) : wire8[(3'h7):(3'h6)]))
            begin
              reg19 <= (wire14 >> ($signed($unsigned($unsigned(wire9))) << $signed($unsigned((wire8 != wire14)))));
              reg20 <= $signed(wire13);
            end
          else
            begin
              reg19 <= reg17;
              reg20 <= ((~&((|reg17[(2'h3):(1'h0)]) == wire16[(3'h5):(2'h2)])) && $unsigned($signed($signed({reg17,
                  reg18}))));
              reg21 <= $unsigned(($signed((((8'ha8) >= wire13) ?
                      (wire7 ? wire13 : reg17) : (&wire16))) ?
                  ($signed($signed(wire13)) != ({reg19} ^~ (wire6 ^ reg17))) : $unsigned(wire7)));
              reg22 <= ($signed(($unsigned((reg20 ? wire6 : (8'ha2))) ?
                  (-reg19) : $signed((wire13 ?
                      (8'ha7) : wire11)))) + {$signed({reg17})});
              reg23 <= ($unsigned($unsigned((~^wire11))) + reg19[(2'h2):(1'h1)]);
            end
          reg24 <= {(((~^(wire16 ^~ reg17)) ^ $unsigned(wire13[(3'h7):(1'h1)])) <<< (^~$unsigned((|wire6)))),
              $unsigned((wire8[(4'ha):(1'h1)] ?
                  (!(reg21 >> (8'hb2))) : ((wire8 ?
                      wire16 : wire10) < (^~wire8))))};
        end
      reg25 <= (8'hb1);
      reg26 <= $signed($unsigned(wire10[(4'hf):(4'ha)]));
      reg27 <= $unsigned($signed($signed($signed((wire13 ? (8'ha0) : reg21)))));
      if ((8'h9e))
        begin
          if ((~^wire13))
            begin
              reg28 <= (reg26[(3'h7):(1'h0)] | wire10[(2'h2):(1'h1)]);
            end
          else
            begin
              reg28 <= {$unsigned(reg18[(4'he):(4'hc)])};
              reg29 <= wire11[(2'h3):(2'h3)];
              reg30 <= (~^(~|$signed($unsigned(wire7))));
              reg31 <= ($unsigned(((~&reg18[(3'h4):(1'h1)]) > ({wire13, reg22} ?
                  (8'hbd) : (~|reg17)))) > (~&(-(|$signed((8'haa))))));
            end
          reg32 <= (~&$unsigned($signed($signed((reg25 > wire13)))));
          reg33 <= $unsigned(wire7);
          reg34 <= reg33;
          reg35 <= $unsigned((((^~((7'h40) ^~ reg30)) ^~ $signed({reg32,
              (8'hb1)})) <= reg19[(4'ha):(2'h3)]));
        end
      else
        begin
          reg28 <= {($unsigned(reg21[(1'h0):(1'h0)]) ^ ((reg25[(3'h5):(2'h3)] ?
                  (reg24 ?
                      (7'h40) : reg19) : reg23[(2'h3):(1'h0)]) > reg20[(1'h1):(1'h0)])),
              (reg17[(2'h2):(1'h0)] <<< $signed($unsigned(reg27)))};
        end
    end
endmodule
