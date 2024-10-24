module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire132;
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  assign y = {wire5,
                 wire66,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire75,
                 wire76,
                 wire132,
                 reg78,
                 reg77,
                 reg74,
                 (1'h0)};
  assign wire5 = ($signed(wire2) >>> (~&wire3));
  module6 #() modinst67 (wire66, clk, wire1, wire2, wire4, wire5);
  assign wire68 = $unsigned((wire66 ?
                      $unsigned(($signed(wire1) ?
                          $signed(wire3) : (wire0 >= wire3))) : $unsigned((wire0 ?
                          $signed(wire4) : wire0))));
  assign wire69 = (wire4 * {wire0[(1'h0):(1'h0)], wire4});
  assign wire70 = wire69;
  assign wire71 = (~&(|(wire5[(5'h10):(4'hf)] > wire69[(2'h3):(2'h3)])));
  assign wire72 = (($unsigned($unsigned($unsigned(wire68))) > wire66[(3'h5):(1'h0)]) ?
                      wire5 : wire3);
  assign wire73 = (8'ha9);
  always
    @(posedge clk) begin
      reg74 <= ($unsigned(($unsigned((~^wire5)) ?
              $unsigned((~&wire2)) : wire72)) ?
          wire73[(3'h4):(1'h1)] : (wire70[(1'h1):(1'h1)] ?
              (-$unsigned(wire70[(1'h1):(1'h0)])) : ($signed({wire70,
                  wire70}) ~^ wire1)));
    end
  assign wire75 = ($unsigned(($signed((wire70 <= wire71)) ?
                      $signed($unsigned(wire3)) : {$unsigned(wire2),
                          wire66})) != $unsigned((!$signed({wire0}))));
  assign wire76 = wire71[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg77 <= {(|(~&wire2[(2'h3):(1'h0)])), (-wire3[(2'h2):(1'h0)])};
      reg78 <= {wire73[(2'h3):(2'h2)]};
    end
  module79 #() modinst133 (.y(wire132), .clk(clk), .wire83(wire5), .wire81(reg78), .wire80(wire66), .wire82(wire75), .wire84(reg77));
endmodule

module module79
#(parameter param131 = ((^{(((8'ha4) ? (8'ha2) : (8'hbf)) ^~ (^(7'h43)))}) == ((8'haf) ? (!(|((8'hba) | (8'ha9)))) : {(((8'ha1) ? (8'ha9) : (8'hb7)) ^~ {(8'hab)}), (&(&(7'h44)))})))
(y, clk, wire80, wire81, wire82, wire83, wire84);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire80;
  input wire signed [(4'hf):(1'h0)] wire81;
  input wire signed [(5'h13):(1'h0)] wire82;
  input wire signed [(3'h4):(1'h0)] wire83;
  input wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire129;
  wire [(5'h15):(1'h0)] wire128;
  wire [(4'hb):(1'h0)] wire126;
  wire signed [(3'h4):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire107;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire122;
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire125,
                 wire124,
                 wire85,
                 wire104,
                 wire106,
                 wire107,
                 wire108,
                 wire122,
                 reg127,
                 (1'h0)};
  assign wire85 = {(+{$unsigned((&wire81))})};
  module86 #() modinst105 (.y(wire104), .wire89(wire82), .clk(clk), .wire87(wire80), .wire90(wire85), .wire88(wire81));
  assign wire106 = {(wire85 ?
                           (wire85[(5'h13):(4'he)] ~^ wire81) : {wire82,
                               ($signed(wire104) ?
                                   (&wire82) : (wire80 && wire80))})};
  assign wire107 = ($unsigned($unsigned($signed(wire83[(2'h3):(1'h1)]))) ?
                       wire104 : $signed(wire84));
  assign wire108 = $signed($unsigned((((8'h9c) > $signed((8'haf))) ?
                       (wire81[(3'h4):(1'h0)] <<< (wire104 & wire81)) : wire80)));
  module109 #() modinst123 (wire122, clk, wire84, wire104, wire80, wire106, wire81);
  assign wire124 = (($signed($unsigned((wire82 ? wire122 : wire82))) ?
                       (&$unsigned((wire81 * wire85))) : wire83) || $signed(wire80[(3'h6):(2'h3)]));
  assign wire125 = wire81[(3'h5):(3'h4)];
  assign wire126 = $unsigned($unsigned(((wire104[(4'hb):(2'h3)] && wire81[(3'h7):(3'h5)]) ?
                       (~^(8'hba)) : $unsigned({wire104, wire107}))));
  always
    @(posedge clk) begin
      reg127 <= (^~{wire83[(1'h0):(1'h0)]});
    end
  assign wire128 = (wire84 != wire126[(3'h6):(2'h2)]);
  assign wire129 = wire128;
  assign wire130 = $signed(wire83[(2'h3):(1'h0)]);
endmodule

module module6
#(parameter param64 = ((~^((((8'hb9) ? (8'hb2) : (8'haa)) ? ((8'ha7) || (8'hbf)) : ((8'ha6) ? (8'hbe) : (8'hb2))) ? (8'haf) : (((8'ha8) < (8'hbb)) ? ((8'h9c) ? (7'h44) : (8'ha4)) : ((8'ha1) >> (8'h9c))))) ? (^((|{(8'hb5), (7'h44)}) ^ {((8'haa) ? (8'h9f) : (8'h9d)), ((8'hba) ? (8'ha8) : (8'ha3))})) : {(({(8'ha1)} ? ((7'h41) ? (8'ha7) : (8'hbe)) : (8'ha0)) ^~ {((8'h9f) ? (8'ha8) : (8'hb9)), ((8'hae) != (8'ha0))}), ((((8'hb4) ? (8'hbc) : (8'ha1)) ? ((8'ha3) == (8'ha3)) : {(8'ha6)}) ? (~^((8'hb5) != (8'hb0))) : (((8'ha7) ? (8'haa) : (7'h44)) ? {(8'haa)} : ((8'ha0) ? (8'hbb) : (8'hb2))))}), 
parameter param65 = (param64 & (param64 == (param64 ? ((param64 ? param64 : param64) ? param64 : (param64 ? param64 : param64)) : ((param64 <= (8'hae)) && (+param64))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire60;
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire43,
                 wire44,
                 wire60,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
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
                 reg16,
                 (1'h0)};
  assign wire11 = (-wire8);
  assign wire12 = ($signed(wire11[(2'h2):(1'h1)]) ?
                      wire10 : wire8[(3'h6):(2'h2)]);
  assign wire13 = (8'ha3);
  assign wire14 = wire11[(4'h8):(2'h2)];
  assign wire15 = wire13[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg16 <= {(+{(wire10[(3'h6):(3'h4)] >= (wire11 ? wire8 : wire8))}),
          $signed(wire15[(2'h2):(2'h2)])};
      reg17 <= (wire13 ?
          (wire14 ?
              (+{(|wire12), wire15}) : ((wire9 ?
                  $signed(wire10) : $unsigned(wire12)) && ($signed(wire14) << $signed(wire9)))) : ($unsigned(((wire8 <= wire14) ?
              (^~wire15) : {wire8, wire7})) <= wire12));
      reg18 <= ($signed(wire12) + {$signed(((~&wire15) ?
              $unsigned((8'hab)) : wire15)),
          (((^wire8) ? (wire8 ? reg17 : wire8) : $signed((8'ha4))) || reg16)});
      if (wire15)
        begin
          if ((~|($signed((wire10 | (wire14 ?
              (8'hb8) : (8'hb5)))) ^~ (|wire14[(3'h6):(2'h2)]))))
            begin
              reg19 <= (!(|($unsigned($unsigned(wire10)) ?
                  reg16[(3'h5):(3'h5)] : wire11)));
              reg20 <= $unsigned(((wire12[(3'h4):(2'h2)] ^ $signed($signed(wire10))) <= (((wire11 - wire13) ~^ $signed(wire8)) || $signed((^reg16)))));
              reg21 <= {(wire13 ?
                      reg16[(3'h7):(1'h1)] : ($signed(((8'hbe) ?
                              wire15 : wire14)) ?
                          $unsigned($unsigned(wire9)) : wire8[(1'h0):(1'h0)])),
                  reg16[(2'h3):(2'h3)]};
              reg22 <= (^~(~^wire12));
              reg23 <= ((~|$signed(wire9[(2'h3):(1'h1)])) ^~ ((8'ha9) * reg22));
            end
          else
            begin
              reg19 <= (((reg16[(2'h3):(2'h2)] | (~|(wire15 ?
                          wire13 : reg22))) ?
                      {$signed((reg19 ? (8'haf) : wire12))} : $signed(wire8)) ?
                  wire11 : ({{(wire11 ? reg19 : reg22)},
                          {$unsigned((8'hb7)), ((8'hb5) >> (8'h9f))}} ?
                      wire11 : (^~$unsigned($unsigned(wire8)))));
              reg20 <= {reg17[(2'h2):(1'h0)]};
              reg21 <= $signed($unsigned($signed({(reg19 ? wire7 : wire8),
                  (reg19 ? wire14 : (8'ha8))})));
              reg22 <= {$signed(($unsigned(wire7) ?
                      reg20[(3'h6):(2'h3)] : reg19)),
                  ((!(~&reg19[(1'h0):(1'h0)])) ?
                      reg21[(3'h5):(3'h5)] : (^((~wire14) ?
                          reg18[(1'h1):(1'h1)] : $signed(reg16))))};
              reg23 <= $signed($unsigned((!(~reg16))));
            end
          if (wire8[(2'h2):(2'h2)])
            begin
              reg24 <= ((&(~^wire9)) & wire7);
            end
          else
            begin
              reg24 <= ($unsigned(reg16[(1'h1):(1'h1)]) ^~ reg24[(3'h6):(2'h3)]);
              reg25 <= $signed(wire10);
            end
          reg26 <= (reg23 == {$unsigned(((&reg19) ?
                  reg20[(2'h3):(1'h0)] : (reg24 ? wire8 : reg17)))});
        end
      else
        begin
          if ($unsigned($unsigned($signed(((~reg20) >= (reg25 == (7'h40)))))))
            begin
              reg19 <= $signed($signed(reg19[(3'h6):(3'h6)]));
              reg20 <= $signed(($signed($signed({reg25,
                  reg21})) && $signed(((reg26 ? reg16 : reg26) ?
                  (&wire7) : reg26))));
            end
          else
            begin
              reg19 <= $unsigned(wire15[(2'h3):(1'h0)]);
              reg20 <= reg19;
              reg21 <= reg18;
              reg22 <= wire14;
              reg23 <= ($signed($signed(({wire13} ?
                      reg24[(1'h1):(1'h1)] : (reg22 ? reg25 : (8'h9e))))) ?
                  ((~^$unsigned(wire7)) <<< $signed({{wire12}})) : reg21[(1'h1):(1'h0)]);
            end
          reg24 <= ((($signed((8'h9e)) ?
              wire15[(1'h0):(1'h0)] : (^wire7[(1'h1):(1'h0)])) << (^~((8'hb9) ^~ $unsigned(reg24)))) >> (!((&(~^reg16)) ?
              $unsigned((8'ha2)) : {wire8[(3'h4):(2'h3)],
                  reg23[(2'h3):(1'h1)]})));
        end
      reg27 <= $signed(wire7[(1'h0):(1'h0)]);
    end
  assign wire28 = $unsigned({reg25, wire10[(1'h0):(1'h0)]});
  assign wire29 = (~&reg26[(3'h5):(3'h5)]);
  assign wire30 = reg25[(4'ha):(4'ha)];
  assign wire31 = (((-wire13[(4'h9):(4'h8)]) ~^ reg16[(3'h6):(1'h1)]) & $unsigned($unsigned((+wire30[(4'ha):(3'h6)]))));
  assign wire32 = (-$signed(wire31));
  assign wire33 = wire9;
  assign wire34 = {((~&$unsigned({wire7})) ? $signed((~wire31)) : (8'ha9)),
                      $signed(reg19)};
  assign wire35 = (^{({reg18, (wire11 ? reg27 : wire9)} ?
                          ((8'ha0) ?
                              (~^(8'h9e)) : (wire10 >= wire30)) : wire33[(2'h3):(2'h3)]),
                      ((((8'hbc) || wire29) ?
                          $signed(wire28) : (wire29 ?
                              reg17 : (8'h9c))) > (|{reg20, wire15}))});
  always
    @(posedge clk) begin
      reg36 <= $unsigned((($unsigned(((8'h9e) <= reg21)) ?
              wire34[(4'hf):(4'h8)] : ({wire8} * wire29[(4'ha):(3'h7)])) ?
          ($signed(((8'h9e) <<< (8'hbe))) ?
              {(8'hae)} : (~|{wire34})) : ($signed($unsigned(wire28)) ?
              ($signed(wire13) ?
                  $signed(reg19) : $unsigned(wire15)) : $signed(wire33[(5'h10):(4'he)]))));
      if ((wire33 & (|($unsigned((reg25 >>> (8'hba))) << $unsigned($unsigned(wire29))))))
        begin
          reg37 <= $unsigned((~&$signed(reg24)));
          reg38 <= $signed($unsigned(({{(8'hac), (8'ha8)},
                  (wire12 ? reg21 : (8'hb9))} ?
              wire15 : (^wire35[(5'h13):(1'h0)]))));
          reg39 <= $signed(wire31);
          reg40 <= wire10[(2'h3):(2'h3)];
        end
      else
        begin
          if ($unsigned((wire12[(3'h4):(2'h2)] ~^ reg18)))
            begin
              reg37 <= ((($unsigned($unsigned(reg21)) <<< $signed(wire33[(4'h9):(2'h3)])) ~^ ($unsigned((reg19 ?
                          wire30 : wire14)) ?
                      reg24[(3'h5):(2'h3)] : wire32)) ?
                  wire8[(3'h5):(1'h0)] : reg26);
              reg38 <= (!({(wire7 ?
                          wire9[(3'h5):(1'h1)] : wire8[(3'h6):(3'h4)])} ?
                  reg27[(1'h1):(1'h0)] : wire29[(3'h7):(1'h0)]));
              reg39 <= $signed((~|wire30));
            end
          else
            begin
              reg37 <= wire30[(1'h0):(1'h0)];
              reg38 <= reg23;
              reg39 <= (~{reg18[(4'he):(4'hc)],
                  {$signed(reg19[(3'h4):(2'h2)])}});
              reg40 <= (^~($signed((reg25[(3'h7):(3'h4)] < $signed(wire9))) < {($signed(reg40) ?
                      (reg39 ? reg40 : (8'hba)) : (reg16 ?
                          wire32 : (8'hb2)))}));
              reg41 <= ((~&reg38) == (~^((|reg18[(5'h14):(4'h8)]) + $unsigned({(8'hbb)}))));
            end
        end
      reg42 <= (~^(!(~&$unsigned(wire9))));
    end
  assign wire43 = (~&wire33[(3'h5):(2'h2)]);
  assign wire44 = $signed(({(wire12 <= reg22[(3'h6):(3'h5)]),
                          $unsigned((reg16 ^~ reg23))} ?
                      (~&reg20) : ((8'hbc) ^~ (~^((8'ha7) >= reg25)))));
  module45 #() modinst61 (.wire50(reg21), .y(wire60), .clk(clk), .wire46(reg39), .wire49(wire12), .wire47(reg40), .wire48(reg25));
  assign wire62 = $signed(((wire32[(4'ha):(3'h7)] >= {(-reg38), (&reg18)}) ?
                      reg36[(5'h10):(2'h3)] : wire7));
  assign wire63 = (wire44[(1'h1):(1'h0)] <= (8'hbf));
endmodule

module module45  (y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire50;
  input wire signed [(4'h8):(1'h0)] wire49;
  input wire [(3'h4):(1'h0)] wire48;
  input wire signed [(5'h14):(1'h0)] wire47;
  input wire [(5'h12):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire51 = (~&(8'ha1));
  assign wire52 = ($unsigned((wire47 ~^ wire48[(1'h1):(1'h0)])) >>> (wire46 && (|wire51[(2'h3):(1'h0)])));
  assign wire53 = wire51[(2'h2):(1'h1)];
  assign wire54 = {((+((~&wire47) ?
                          wire49[(2'h3):(1'h1)] : (~&wire50))) && ((wire53[(2'h2):(1'h0)] ?
                              (wire50 ? wire49 : wire47) : (|wire53)) ?
                          $unsigned($unsigned(wire49)) : $unsigned(wire51))),
                      $signed((|(&(wire51 ? (8'haa) : (8'ha8)))))};
  assign wire55 = $signed($unsigned(wire52));
  always
    @(posedge clk) begin
      reg56 <= wire50;
      reg57 <= (&$signed($signed(wire48)));
      reg58 <= wire49[(2'h2):(2'h2)];
      reg59 <= {(reg57[(4'h9):(3'h5)] < $unsigned(($unsigned(reg56) ?
              {wire50} : {(7'h43)})))};
    end
endmodule

module module109
#(parameter param121 = (^((~(8'haf)) ? ({((8'hbe) ? (8'h9c) : (8'hbd)), {(7'h41)}} ? ((~|(8'hb0)) != ((8'ha2) >= (8'hb5))) : (&(&(8'ha4)))) : ({((8'ha1) < (8'hbe))} ? (((8'hb6) >> (8'hba)) ? ((8'ha5) ? (8'ha2) : (8'hb6)) : (~|(8'ha7))) : ((-(7'h43)) ? ((8'h9f) >>> (8'hb1)) : ((8'hbb) * (8'ha1)))))))
(y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire114;
  input wire signed [(4'hf):(1'h0)] wire113;
  input wire [(3'h4):(1'h0)] wire112;
  input wire signed [(4'hb):(1'h0)] wire111;
  input wire signed [(4'hf):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire120;
  wire signed [(4'h8):(1'h0)] wire119;
  wire signed [(4'hf):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire116;
  wire signed [(3'h5):(1'h0)] wire115;
  assign y = {wire120, wire119, wire118, wire117, wire116, wire115, (1'h0)};
  assign wire115 = (($signed($unsigned((&wire111))) ?
                           (wire113 ?
                               (wire114[(3'h6):(3'h5)] >>> $unsigned((8'hb0))) : ((wire112 + wire112) < wire111)) : ((|$signed(wire112)) && (~^$unsigned(wire113)))) ?
                       ((~&wire113) != wire113) : wire111[(4'h8):(2'h3)]);
  assign wire116 = wire113[(1'h1):(1'h0)];
  assign wire117 = ((((wire116 ?
                       $unsigned(wire110) : $unsigned(wire111)) <= wire116[(2'h2):(1'h0)]) && wire110) | (^(~^((wire115 ?
                       wire111 : wire114) | $unsigned((8'h9d))))));
  assign wire118 = ((wire112 - (({wire115} ?
                           (~&(8'hb5)) : wire113[(2'h3):(2'h2)]) < (~^(wire114 ~^ (8'ha1))))) ?
                       (-($unsigned($unsigned(wire112)) ?
                           $signed($signed(wire111)) : ($unsigned(wire115) ?
                               (+wire114) : wire111[(4'h9):(3'h7)]))) : $unsigned((&(wire117 ?
                           (~|wire111) : wire117[(3'h5):(2'h2)]))));
  assign wire119 = (((^~$unsigned({wire117,
                           wire116})) | (^(!(wire110 | wire113)))) ?
                       wire112[(2'h2):(1'h1)] : $signed($unsigned($unsigned((+wire115)))));
  assign wire120 = {wire116[(1'h1):(1'h0)]};
endmodule

module module86
#(parameter param103 = ((&(8'ha2)) ? ((((^(8'had)) + {(8'ha7), (8'ha9)}) * ((&(8'ha6)) | ((8'haf) ? (8'haf) : (8'ha2)))) ? (~|(((8'hbd) <<< (8'hbc)) > ((8'hba) ? (8'hbb) : (8'hbe)))) : ((^((8'ha8) ? (7'h41) : (8'ha9))) + ((~^(8'hbf)) >>> ((8'hab) ? (7'h43) : (8'hb9))))) : (^~(7'h44))))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire90;
  input wire [(5'h13):(1'h0)] wire89;
  input wire [(2'h3):(1'h0)] wire88;
  input wire signed [(4'hb):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire98;
  wire signed [(3'h6):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 (1'h0)};
  assign wire91 = (((~&((~^wire90) * (~^wire90))) ?
                          (8'hb1) : $unsigned($unsigned({wire88, wire90}))) ?
                      $unsigned(wire88[(2'h2):(2'h2)]) : (~|wire87));
  assign wire92 = ($signed({wire90}) <<< {wire88,
                      $unsigned((|{(8'ha0), wire87}))});
  assign wire93 = ($signed(wire88[(1'h0):(1'h0)]) <<< (&{(^$signed(wire92))}));
  assign wire94 = $unsigned(($unsigned({(wire89 ? (8'h9c) : wire92),
                          (wire90 ? wire90 : wire93)}) ?
                      ($signed($signed((8'hb5))) ~^ wire93[(3'h5):(1'h1)]) : (&$signed($signed((7'h42))))));
  assign wire95 = {$signed(wire91),
                      ($signed($signed(wire92)) > (wire94 ?
                          ((wire93 ? wire89 : wire92) << {wire94,
                              wire89}) : $unsigned((wire92 ?
                              wire88 : wire90))))};
  assign wire96 = {$unsigned(wire92[(4'he):(4'hc)]), wire95[(3'h6):(2'h2)]};
  assign wire97 = wire87[(1'h0):(1'h0)];
  assign wire98 = (~^((~^$unsigned($signed(wire88))) ~^ (~&(&(wire96 >= wire95)))));
  assign wire99 = (wire88[(1'h1):(1'h0)] == {wire87[(3'h5):(2'h3)],
                      wire87[(2'h3):(2'h2)]});
  assign wire100 = (~wire89);
  assign wire101 = wire93;
  assign wire102 = $unsigned($signed(wire93[(3'h4):(1'h1)]));
endmodule
