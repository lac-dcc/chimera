module top
#(parameter param125 = (-(^((-((8'hab) ? (8'ha2) : (8'hb4))) && ({(8'h9e)} ? ((8'hbf) ? (8'hab) : (8'ha2)) : (8'hbd))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire124;
  wire [(4'hc):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire113;
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire113,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  module5 #() modinst114 (.wire9(wire1), .wire6(wire3), .wire7(wire2), .wire8(wire4), .clk(clk), .y(wire113), .wire10(wire0));
  always
    @(posedge clk) begin
      reg115 <= {($signed($unsigned((wire1 ? wire4 : (8'haf)))) ?
              wire4 : (~&$unsigned((wire113 ? wire3 : wire4))))};
      if ((wire0[(4'hc):(3'h4)] ?
          $signed(wire1) : (~^(wire113[(3'h6):(3'h4)] ?
              wire2[(5'h10):(3'h5)] : $signed(wire3[(3'h5):(1'h1)])))))
        begin
          reg116 <= $unsigned((!$unsigned({(~wire4), (^wire1)})));
          reg117 <= {(-(~|wire2[(5'h13):(4'hb)])),
              $unsigned($unsigned($signed(wire2)))};
          reg118 <= (8'ha4);
          reg119 <= wire2[(3'h5):(2'h2)];
        end
      else
        begin
          reg116 <= reg115[(3'h4):(1'h1)];
          reg117 <= $unsigned((((|(reg117 ? wire4 : reg117)) ?
              ({(7'h41), wire2} ?
                  reg119 : (reg118 ?
                      (8'ha4) : wire1)) : reg119[(3'h4):(1'h0)]) || ((8'hb6) ?
              $signed(((8'hb7) || reg118)) : $signed((wire3 ^~ wire0)))));
          reg118 <= (wire1 ?
              (!$signed((wire113 ?
                  ((7'h43) <<< (8'ha1)) : $unsigned(reg118)))) : reg118);
          reg119 <= wire0;
          reg120 <= (!wire0[(5'h10):(3'h6)]);
        end
      reg121 <= wire2;
      reg122 <= reg120;
    end
  assign wire123 = (((~wire113) ?
                       (&reg119[(4'he):(4'hd)]) : (~^(&wire3))) <= $signed($signed($signed((reg122 + reg119)))));
  assign wire124 = wire2;
endmodule

module module5
#(parameter param111 = (({(((8'hb7) | (8'hac)) <= ((8'hae) ? (8'hbc) : (8'hba))), ({(8'had), (8'hb1)} ? {(8'ha2), (8'hab)} : {(8'ha6), (8'had)})} ? ((~|(~(8'hbc))) > {(&(8'hac))}) : (({(8'hbd), (8'hb4)} * ((7'h42) ~^ (8'had))) << ({(8'hbb)} & ((7'h43) + (8'ha1))))) * (^(({(8'hb7)} * {(8'h9d), (8'ha2)}) ? (^(~&(8'hb8))) : ((~(8'hbb)) ~^ ((7'h44) ? (8'ha6) : (8'hbf)))))), 
parameter param112 = (param111 >> ((^~(!(param111 ~^ param111))) >= (param111 ? {(param111 - param111)} : param111))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  assign y = {wire110, wire108, wire38, wire36, wire12, wire11, (1'h0)};
  assign wire11 = (~|(8'hac));
  assign wire12 = wire8[(2'h3):(1'h1)];
  module13 #() modinst37 (wire36, clk, wire8, wire6, wire12, wire9);
  assign wire38 = wire6;
  module39 #() modinst109 (wire108, clk, wire11, wire7, wire8, wire10);
  assign wire110 = (wire12 ?
                       (wire6[(2'h2):(2'h2)] ?
                           wire8[(4'h8):(4'h8)] : (~|$signed((wire38 | wire36)))) : (&(|$signed((wire6 ?
                           (8'ha9) : wire36)))));
endmodule

module module39
#(parameter param107 = (8'hb9))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h29c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire43;
  input wire signed [(4'hf):(1'h0)] wire42;
  input wire [(3'h5):(1'h0)] wire41;
  input wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire106;
  wire signed [(4'h9):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire93;
  wire [(3'h6):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  assign y = {wire106,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire71,
                 wire70,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg73,
                 reg69,
                 reg68,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg44 <= ((-(&$signed(wire40[(2'h2):(1'h0)]))) != wire40[(4'h9):(1'h1)]);
      if (wire40[(3'h7):(2'h2)])
        begin
          if ((~|($signed($signed($signed(wire43))) < (((wire40 ?
                  wire43 : wire41) >= $signed(wire41)) ?
              (reg44[(3'h6):(1'h0)] ?
                  (wire41 < reg44) : (8'hb5)) : $signed({reg44, reg44})))))
            begin
              reg45 <= {reg44[(3'h4):(1'h0)]};
              reg46 <= reg45[(2'h2):(1'h1)];
              reg47 <= ($signed((~&wire42)) << (8'hb8));
              reg48 <= reg44[(2'h2):(1'h0)];
              reg49 <= (^(8'haa));
            end
          else
            begin
              reg45 <= ($unsigned({{wire41}, wire42[(4'hb):(3'h4)]}) > (8'hae));
              reg46 <= $unsigned($signed(((8'hbf) >= $signed(reg46))));
              reg47 <= (wire42 ?
                  {({(!reg48),
                          {wire41,
                              wire40}} - (^(reg45 - wire41)))} : (((wire43[(4'h8):(1'h1)] ^ wire40[(1'h1):(1'h0)]) >>> (wire41 >>> $unsigned((8'had)))) ?
                      reg44 : reg45[(2'h2):(1'h0)]));
              reg48 <= (($signed(((wire42 ? reg46 : wire41) ?
                          (&reg48) : $unsigned((7'h43)))) ?
                      $signed(($unsigned(reg46) ?
                          $signed(wire43) : (&wire43))) : $signed(reg47)) ?
                  (~|(reg45[(1'h1):(1'h1)] ?
                      (((8'ha1) ? reg46 : reg48) ?
                          {reg48} : wire43[(1'h0):(1'h0)]) : wire43[(4'ha):(2'h2)])) : {$unsigned($unsigned($signed(reg47)))});
              reg49 <= ($signed(((reg46[(4'hd):(3'h5)] >> (!reg46)) & reg49[(3'h5):(3'h4)])) >>> $signed($signed(({(8'hb0)} ?
                  $signed(reg46) : {reg44, reg49}))));
            end
          reg50 <= $signed({$signed((~&reg47[(3'h5):(3'h5)]))});
          reg51 <= (~^$unsigned((!{$signed(reg47)})));
          if ((^~$signed((~&{reg51, (&(8'hb6))}))))
            begin
              reg52 <= $signed((reg48 >= $unsigned(reg47)));
              reg53 <= reg47;
              reg54 <= ((8'ha8) ?
                  $unsigned((reg47 + wire42[(2'h3):(2'h3)])) : $signed((~|(8'ha1))));
            end
          else
            begin
              reg52 <= (($unsigned(($signed(wire41) == (&reg52))) ?
                      $unsigned(wire43[(4'h8):(3'h4)]) : reg47[(2'h2):(1'h0)]) ?
                  (8'hb0) : reg48);
              reg53 <= reg50;
              reg54 <= $unsigned(($signed($unsigned($signed(reg48))) ^~ ($unsigned((reg53 ?
                  wire40 : (8'h9d))) ^ $signed(((8'had) >>> reg47)))));
              reg55 <= $signed(($signed(reg50[(1'h0):(1'h0)]) - $signed({reg45[(2'h3):(2'h2)]})));
              reg56 <= (~|(^~reg54));
            end
          reg57 <= $signed(reg56);
        end
      else
        begin
          reg45 <= ((~$unsigned(reg56)) | ($signed($unsigned($unsigned(reg45))) ?
              $signed(($signed(reg56) + (wire41 ?
                  reg55 : reg53))) : ((^((8'ha7) ?
                  reg55 : wire42)) + $unsigned({reg46, reg45}))));
          if ((wire41 ?
              {reg49[(3'h4):(1'h0)],
                  ((^~reg55) - ((reg44 != reg56) ?
                      $unsigned(wire41) : ((8'h9f) >> reg54)))} : (+(^reg46))))
            begin
              reg46 <= reg51;
              reg47 <= {(8'hb6)};
              reg48 <= reg50[(4'h8):(4'h8)];
            end
          else
            begin
              reg46 <= wire42;
              reg47 <= $unsigned((~&($signed((~&reg53)) - $unsigned(reg49))));
              reg48 <= $signed(reg52[(4'h9):(3'h6)]);
              reg49 <= $unsigned(reg52);
              reg50 <= ((reg55 ? reg51 : wire41[(2'h3):(1'h0)]) ?
                  {$signed((reg57 >> (reg54 <<< reg57)))} : wire42[(3'h7):(3'h7)]);
            end
          reg51 <= reg51[(1'h0):(1'h0)];
        end
      reg58 <= reg46;
      reg59 <= {(((wire41 ? (reg48 ? wire40 : reg44) : reg46) ?
                  reg58 : (((8'ha7) ? wire43 : wire41) << $unsigned(wire41))) ?
              ($signed($signed(reg54)) ?
                  $signed(((8'hbf) << reg46)) : $unsigned($unsigned(reg45))) : reg48[(4'hd):(4'h8)]),
          reg44[(2'h3):(2'h2)]};
    end
  always
    @(posedge clk) begin
      if ((+$signed($signed($signed($unsigned(reg53))))))
        begin
          reg60 <= ((reg59[(3'h5):(1'h0)] * (|reg58)) ?
              reg59 : {reg52, {({wire42, reg57} || reg59)}});
        end
      else
        begin
          if (($signed(reg57[(4'hf):(2'h2)]) || (~$signed($unsigned(reg53)))))
            begin
              reg60 <= reg60;
              reg61 <= (+(8'hb2));
              reg62 <= reg45[(2'h3):(2'h2)];
            end
          else
            begin
              reg60 <= {$signed($signed(reg46[(4'h8):(3'h4)])),
                  $signed(((+reg60) ?
                      reg57[(1'h0):(1'h0)] : $signed($unsigned(reg57))))};
              reg61 <= reg52[(4'h8):(3'h7)];
              reg62 <= (~reg46[(3'h5):(1'h0)]);
              reg63 <= reg49[(2'h2):(1'h0)];
              reg64 <= $signed(((({wire43} ?
                      (8'hae) : (reg59 ? reg58 : reg44)) ?
                  ((reg60 ? wire40 : reg48) != $signed((8'ha3))) : {(+reg61),
                      reg44[(2'h2):(2'h2)]}) - $signed(($signed(wire41) ?
                  reg60[(3'h7):(3'h6)] : reg60))));
            end
          if ($signed(((reg55[(5'h13):(4'he)] ?
              $unsigned(reg63) : reg64) > reg60[(2'h3):(1'h0)])))
            begin
              reg65 <= wire40[(3'h7):(3'h7)];
            end
          else
            begin
              reg65 <= $signed(reg49);
              reg66 <= {{reg53[(3'h5):(3'h4)]},
                  (reg53 ~^ ((+$unsigned(reg49)) ?
                      ((reg53 ? reg55 : reg63) >>> (reg61 ?
                          reg44 : reg60)) : reg57[(3'h7):(2'h2)]))};
            end
          reg67 <= ((^{(~&reg52[(3'h4):(1'h0)]),
              ({wire41, (8'h9c)} ?
                  {reg64} : ((8'hb9) ?
                      reg51 : (8'hb9)))}) ^~ $unsigned($signed($signed((reg47 > (8'hb5))))));
        end
      reg68 <= reg63[(3'h5):(3'h4)];
      reg69 <= (7'h44);
    end
  assign wire70 = $signed(reg67[(3'h5):(1'h0)]);
  assign wire71 = (~|$signed((reg62 ?
                      ((~|reg62) ?
                          (reg50 ? reg69 : reg69) : $signed(reg58)) : reg60)));
  assign wire72 = ((reg50 >>> $signed((reg47 << $signed(reg56)))) ?
                      ($unsigned(reg60[(3'h7):(2'h2)]) ?
                          ({(reg45 ? (8'h9d) : reg52), $unsigned(wire71)} ?
                              {{reg56},
                                  ((8'hb5) + reg59)} : reg64[(5'h11):(4'ha)]) : (~|(wire43[(4'h8):(3'h4)] ^~ (+reg64)))) : (($signed($unsigned(reg55)) ?
                              reg62[(3'h4):(1'h1)] : {$unsigned(reg58),
                                  (reg59 ? reg65 : reg53)}) ?
                          (wire40 & reg50) : reg53[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg73 <= wire71[(1'h1):(1'h0)];
    end
  assign wire74 = (&$signed((-((~^(8'hb8)) >> wire71))));
  assign wire75 = $unsigned(reg63);
  assign wire76 = {$signed((^(&{(8'hb0), (7'h43)}))),
                      (!(~^(reg44[(3'h5):(3'h5)] >= reg69[(2'h3):(1'h0)])))};
  assign wire77 = $signed($unsigned((($signed(reg68) || reg54[(1'h0):(1'h0)]) ?
                      (8'hb3) : (~&reg51))));
  always
    @(posedge clk) begin
      if ($signed((|((^{reg52}) ?
          {(wire74 > reg48), $unsigned(wire76)} : $signed((reg65 & wire43))))))
        begin
          reg78 <= (~(wire40 ?
              $unsigned($signed(((7'h43) ? (8'hbc) : reg49))) : wire77));
          if ((8'ha2))
            begin
              reg79 <= reg56[(3'h4):(3'h4)];
              reg80 <= $signed((~&((^~(reg69 ? reg65 : reg61)) ?
                  $unsigned(reg66) : wire77[(3'h5):(3'h4)])));
            end
          else
            begin
              reg79 <= {(~|$unsigned(reg68[(4'hf):(4'h8)]))};
              reg80 <= (!({reg59} ?
                  (($signed((8'hab)) && ((8'hb2) <<< reg63)) ?
                      reg50[(3'h7):(3'h5)] : {((8'hbf) >> reg79)}) : $unsigned(reg63)));
              reg81 <= {(-$unsigned(((^reg47) ?
                      reg55 : (reg49 ? reg54 : wire41)))),
                  reg46};
              reg82 <= $signed(reg78[(3'h6):(1'h0)]);
            end
          reg83 <= $signed((&$signed(wire42)));
        end
      else
        begin
          reg78 <= ((wire41[(2'h3):(1'h1)] ?
              $signed(reg61) : {(reg63 < (|(8'hba)))}) && {$unsigned((~^reg64[(4'hf):(4'h9)]))});
          reg79 <= {($unsigned(reg64) || {($signed(wire72) ?
                      wire74[(3'h5):(2'h3)] : $unsigned((7'h42)))}),
              (8'ha4)};
          reg80 <= $signed({(({wire41} - (reg83 & reg78)) | reg64)});
          reg81 <= reg80[(1'h1):(1'h0)];
          reg82 <= {$signed({reg61[(5'h12):(5'h12)], (~|$signed(reg81))}),
              wire77};
        end
      reg84 <= ((((|(!(8'hb2))) <= ({(8'h9f),
          reg59} >= (^reg61))) << $signed(reg65)) && ((&($unsigned((8'hb8)) <= $signed(reg49))) ?
          ((^(reg68 - reg60)) != reg45) : {($signed(reg83) ?
                  (wire43 ^ reg63) : (reg64 >>> reg53)),
              reg56[(3'h4):(3'h4)]}));
      reg85 <= {($signed((reg68 ? {reg49} : (wire70 <<< reg44))) ?
              {($unsigned((8'hba)) >> (reg55 | reg73))} : (reg53[(3'h5):(2'h2)] ?
                  $signed($unsigned(reg73)) : reg44))};
      reg86 <= ($signed($signed(((&wire77) ?
          reg66[(1'h0):(1'h0)] : wire41))) | (reg78[(2'h3):(2'h2)] >>> reg62));
    end
  assign wire87 = (8'ha8);
  assign wire88 = $signed(($signed({(reg50 ? reg83 : reg48),
                      (7'h40)}) > (wire43[(1'h1):(1'h0)] ?
                      $signed((reg45 ?
                          reg80 : (8'ha8))) : ((8'ha5) && (|reg68)))));
  assign wire89 = {(7'h44), (^$signed($signed((wire72 ? (8'h9d) : wire40))))};
  assign wire90 = $unsigned(reg64);
  assign wire91 = ({$signed((&((8'hb6) ? reg67 : reg58))),
                          wire42[(4'hf):(2'h2)]} ?
                      $signed((($unsigned(reg46) || (8'hbd)) ?
                          $signed($unsigned(reg52)) : wire70[(4'he):(1'h1)])) : $unsigned(reg56[(4'he):(1'h1)]));
  assign wire92 = $unsigned((&$unsigned({(^wire71)})));
  assign wire93 = ((&(^({(8'ha2)} ?
                      (-(8'ha6)) : reg64[(4'ha):(4'h8)]))) <<< (-$unsigned(($unsigned(reg56) != ((8'hb5) ?
                      wire40 : wire77)))));
  assign wire94 = (reg47[(1'h1):(1'h0)] || (reg58 ?
                      reg46[(3'h4):(1'h0)] : (~|{$unsigned(reg61)})));
  assign wire95 = ((reg83 >> wire72) ?
                      (&$signed(wire74)) : $unsigned((({reg49} & ((7'h44) & reg60)) + wire71)));
  assign wire96 = reg63[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg97 <= $signed($unsigned((+(wire87[(4'he):(3'h5)] << (~&(8'hb3))))));
      if ($unsigned($signed($unsigned(((~|wire77) ? (8'ha2) : (~reg54))))))
        begin
          reg98 <= (+(wire72[(4'ha):(4'h9)] ?
              {((wire71 ~^ reg58) ?
                      $signed(wire75) : (reg64 | wire76))} : $signed((~&(reg51 ?
                  reg80 : reg61)))));
          if ($unsigned((8'hb6)))
            begin
              reg99 <= reg67;
              reg100 <= $signed($unsigned((~$unsigned(wire87))));
              reg101 <= $unsigned(reg67[(1'h1):(1'h0)]);
              reg102 <= $signed(wire90[(2'h2):(1'h0)]);
            end
          else
            begin
              reg99 <= {$unsigned((wire77 >>> (!wire89[(2'h3):(1'h1)]))),
                  (wire94[(2'h2):(1'h0)] >>> {wire70[(2'h3):(2'h2)]})};
            end
          reg103 <= {($unsigned(reg101[(1'h1):(1'h0)]) ?
                  $unsigned(reg57) : ((reg48[(3'h5):(1'h1)] ?
                          $signed(wire41) : ((8'hb5) ^ reg102)) ?
                      ((8'hac) ^~ $signed(reg101)) : $unsigned($signed((8'hae)))))};
        end
      else
        begin
          reg98 <= ((($signed((wire92 ? (8'hb8) : reg78)) << wire92) ?
              wire71[(2'h2):(1'h0)] : (-$signed((wire93 ?
                  wire75 : reg80)))) > (8'hbf));
          reg99 <= ((^(((reg102 ^~ reg47) ^~ (reg81 >= reg49)) != (wire76[(3'h5):(2'h3)] ?
                  (!(8'hb4)) : reg50))) ?
              $signed((8'hbe)) : $signed(reg73));
          if ((reg52 + reg103[(3'h6):(3'h6)]))
            begin
              reg100 <= ((&(reg60[(1'h0):(1'h0)] ?
                      reg100[(4'hb):(3'h6)] : $unsigned(wire92[(3'h5):(2'h3)]))) ?
                  $signed($signed(((reg60 ? reg84 : reg51) + (wire94 ?
                      wire41 : wire92)))) : (reg101 << (~|(reg51[(1'h0):(1'h0)] != $signed(reg46)))));
              reg101 <= (|(+(~&reg86)));
              reg102 <= (|(8'ha2));
              reg103 <= $unsigned(((+{(!wire87)}) ?
                  (^~$signed($signed(reg52))) : (8'hb3)));
            end
          else
            begin
              reg100 <= reg86[(1'h1):(1'h0)];
              reg101 <= wire76[(4'hb):(4'ha)];
              reg102 <= (((^((7'h44) << $signed(reg84))) ?
                  $unsigned(((wire94 ?
                      wire74 : (8'hb9)) - reg51[(3'h7):(3'h6)])) : {$unsigned((reg62 > (8'hbf)))}) <<< (|(^(-wire93))));
            end
        end
      reg104 <= reg64;
      reg105 <= reg56;
    end
  assign wire106 = (($unsigned($unsigned((reg83 ~^ reg99))) ?
                           (reg56[(4'hf):(4'hd)] ?
                               ((reg61 < reg102) != (wire91 != wire87)) : ((~|reg61) != $unsigned(reg98))) : reg63) ?
                       (wire40[(4'h9):(4'h8)] ?
                           $unsigned($unsigned((reg102 >>> reg104))) : (^$unsigned((reg98 ?
                               reg55 : reg49)))) : ((reg52 ?
                           reg79 : {$unsigned(reg61)}) >>> ($signed((&wire42)) ?
                           $unsigned(reg82) : reg68)));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire [(4'hb):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire18;
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  assign y = {wire32,
                 wire18,
                 reg35,
                 reg34,
                 reg33,
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
                 (1'h0)};
  assign wire18 = wire14;
  always
    @(posedge clk) begin
      reg19 <= {$signed((8'ha1))};
      reg20 <= wire18;
      if ((wire15[(2'h3):(1'h0)] ?
          wire17[(4'h9):(3'h6)] : (reg20 ?
              $signed((wire16[(3'h4):(3'h4)] ?
                  (~|wire15) : (wire14 ?
                      wire16 : wire14))) : $signed(wire17[(5'h12):(3'h6)]))))
        begin
          reg21 <= ($unsigned($signed((-(^~reg20)))) ?
              (^~$unsigned(($unsigned(wire15) ?
                  (^wire16) : wire14[(4'ha):(3'h7)]))) : (wire15[(3'h6):(1'h0)] ?
                  (wire14 ?
                      (~(wire17 ?
                          wire14 : wire14)) : $signed((wire14 | wire17))) : wire15));
          reg22 <= (((^$signed(((8'hac) || wire15))) && wire14[(2'h3):(1'h1)]) && $unsigned((~|($unsigned(wire18) ?
              (^~wire17) : (wire18 ? (8'hb6) : wire18)))));
          reg23 <= $unsigned(($unsigned(((~^(8'ha4)) + (wire15 ?
                  wire15 : wire18))) ?
              wire18[(4'hf):(4'hc)] : $signed(((reg20 ?
                  reg19 : wire16) != wire14))));
          if (reg23)
            begin
              reg24 <= ({$unsigned(((wire15 == (8'h9c)) ?
                          (wire14 ? reg19 : reg20) : ((8'had) && reg19))),
                      (&wire15)} ?
                  $signed((+($unsigned((8'hb0)) ?
                      wire18[(2'h2):(1'h0)] : {wire14}))) : $unsigned($unsigned($signed(wire17))));
              reg25 <= $unsigned(reg24);
              reg26 <= $unsigned(reg19);
            end
          else
            begin
              reg24 <= reg25[(3'h5):(2'h2)];
            end
          if (wire17[(4'hf):(3'h7)])
            begin
              reg27 <= reg19[(2'h2):(2'h2)];
              reg28 <= $signed((wire16 ?
                  reg23[(3'h5):(1'h1)] : reg24[(5'h10):(4'hb)]));
            end
          else
            begin
              reg27 <= (8'ha4);
              reg28 <= {reg19};
              reg29 <= (+reg19[(3'h7):(1'h1)]);
              reg30 <= $unsigned($signed(wire18[(3'h6):(2'h3)]));
              reg31 <= $unsigned(($signed((+(wire17 ? reg26 : reg26))) ?
                  (8'h9c) : reg20[(3'h6):(3'h6)]));
            end
        end
      else
        begin
          reg21 <= (8'hbc);
          reg22 <= (!($signed((|wire16)) ?
              wire18[(5'h14):(5'h10)] : ((!reg23) ^~ $unsigned(reg22))));
          reg23 <= $unsigned($signed($signed((|(~&reg20)))));
        end
    end
  assign wire32 = $signed((($unsigned({reg28}) != $unsigned((wire15 ?
                      wire15 : reg26))) >>> $signed(reg19)));
  always
    @(posedge clk) begin
      reg33 <= ($signed($unsigned(reg19)) ^ $unsigned($signed((reg31[(1'h1):(1'h1)] ?
          (-reg26) : $signed(reg24)))));
      reg34 <= (!reg30[(3'h5):(2'h2)]);
      reg35 <= ($signed(reg19[(1'h0):(1'h0)]) ?
          ((8'hbd) ~^ $unsigned({{reg34},
              (7'h40)})) : (&$signed(($unsigned((8'haf)) && reg30))));
    end
endmodule
