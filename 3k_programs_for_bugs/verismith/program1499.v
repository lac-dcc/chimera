module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire124;
  assign y = {wire5, wire6, wire7, wire8, wire9, wire124, (1'h0)};
  assign wire5 = wire3[(4'ha):(3'h6)];
  assign wire6 = wire2;
  assign wire7 = (~&(wire6[(3'h4):(3'h4)] << (~wire6)));
  assign wire8 = $unsigned(wire5[(3'h5):(3'h4)]);
  assign wire9 = $unsigned({(&wire1)});
  module10 #() modinst125 (.wire11(wire4), .wire12(wire5), .wire13(wire9), .wire14(wire6), .y(wire124), .clk(clk), .wire15(wire7));
endmodule

module module10
#(parameter param123 = ((^(7'h44)) ? (({((8'hba) ? (8'ha6) : (7'h41))} || (((8'had) >> (7'h40)) ? ((8'ha9) < (8'hbe)) : {(8'haf)})) ? {(|{(8'h9c), (8'haf)})} : {(~|((8'hb0) ? (7'h44) : (8'hb2)))}) : {(!((^~(8'hbf)) >= ((8'hae) ? (8'hb6) : (8'ha4))))}))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h342):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire16;
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  assign y = {wire122,
                 wire112,
                 wire110,
                 wire80,
                 wire79,
                 wire78,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire37,
                 wire36,
                 wire32,
                 wire31,
                 wire30,
                 wire16,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
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
                 reg33,
                 reg34,
                 reg35,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 (1'h0)};
  assign wire16 = wire11;
  always
    @(posedge clk) begin
      reg17 <= (((&(((8'hba) <= (8'h9e)) < $unsigned(wire15))) == wire12) ?
          wire16[(3'h5):(2'h2)] : wire11[(2'h3):(2'h2)]);
      if ((~((~&({wire12} == (&wire11))) < wire16[(2'h3):(1'h0)])))
        begin
          if ($signed((|wire14)))
            begin
              reg18 <= (~|(~^wire16));
              reg19 <= (((7'h42) ?
                      (&wire13[(2'h3):(2'h2)]) : ({(wire12 && reg18),
                          $unsigned(reg18)} << $unsigned($signed(wire12)))) ?
                  $unsigned(wire12) : (8'hbc));
              reg20 <= wire13[(1'h0):(1'h0)];
              reg21 <= (&wire14[(4'hc):(1'h0)]);
            end
          else
            begin
              reg18 <= $unsigned(reg19[(3'h7):(1'h0)]);
            end
          reg22 <= $unsigned(wire12[(4'ha):(2'h2)]);
          if (wire13)
            begin
              reg23 <= $signed({(reg17 ?
                      reg21 : ((8'ha7) ?
                          reg17[(1'h1):(1'h1)] : (reg17 <= wire11)))});
              reg24 <= {{wire15[(4'ha):(4'ha)], $signed(wire12[(1'h1):(1'h1)])},
                  wire12};
              reg25 <= (!$signed(reg18[(2'h2):(1'h1)]));
              reg26 <= $signed((8'h9e));
            end
          else
            begin
              reg23 <= $unsigned((~&reg19));
              reg24 <= {{reg21[(1'h0):(1'h0)]},
                  $signed(((reg22[(2'h3):(2'h3)] ?
                      (reg23 ? reg17 : reg25) : ((8'hb1) ?
                          (8'hb8) : reg18)) != $signed(reg26)))};
              reg25 <= $signed($signed((|$signed(wire11))));
              reg26 <= $signed((^~wire15));
              reg27 <= reg19;
            end
        end
      else
        begin
          if ((wire11 * $unsigned((~|((+wire11) && wire12)))))
            begin
              reg18 <= ((8'hab) & reg27);
              reg19 <= ((reg24 ~^ ((~^((8'haf) ?
                  (8'hb9) : reg22)) * $unsigned(((8'ha3) ?
                  wire16 : reg18)))) - $signed($unsigned(reg17)));
              reg20 <= {reg22[(1'h0):(1'h0)]};
              reg21 <= $signed((reg24[(3'h7):(2'h3)] ?
                  {{(wire13 ? reg22 : (8'ha8)),
                          (reg21 ? reg17 : reg17)}} : reg24));
              reg22 <= $signed($unsigned($signed((~&$signed(wire15)))));
            end
          else
            begin
              reg18 <= (~^wire11[(2'h3):(1'h0)]);
              reg19 <= $unsigned(($unsigned((~$unsigned(reg19))) != wire11[(1'h1):(1'h1)]));
              reg20 <= wire12[(1'h1):(1'h0)];
            end
          if (reg23)
            begin
              reg23 <= (8'had);
              reg24 <= $signed($signed($signed($signed((+reg17)))));
            end
          else
            begin
              reg23 <= reg23[(2'h3):(1'h1)];
              reg24 <= ($signed({(wire12 ?
                      $unsigned(reg22) : $unsigned(wire12))}) + ($signed(($signed(wire15) * $unsigned(reg25))) ?
                  (+(-(&reg17))) : $unsigned($signed((reg25 ?
                      wire16 : reg27)))));
              reg25 <= {(!$signed(reg21[(1'h1):(1'h0)])), reg26};
              reg26 <= $unsigned((8'hab));
            end
          reg27 <= wire15;
          reg28 <= $unsigned($unsigned(reg26));
        end
      reg29 <= reg27[(3'h4):(1'h1)];
    end
  assign wire30 = (8'hbb);
  assign wire31 = $unsigned(($unsigned({(reg24 ? wire14 : reg23),
                          {wire11, reg25}}) ?
                      (reg17 == $signed((reg19 ? (8'hb0) : reg26))) : reg28));
  assign wire32 = {$signed((~|reg21)), wire14};
  always
    @(posedge clk) begin
      reg33 <= {{$unsigned(($unsigned(reg25) | (7'h44))),
              ($signed($signed(wire13)) ?
                  {reg21, (8'hb4)} : reg18[(2'h2):(1'h1)])},
          {((+(wire15 ? wire12 : (8'h9c))) ?
                  wire13[(2'h2):(1'h1)] : $signed((reg17 || reg17)))}};
      reg34 <= $unsigned(wire12);
      reg35 <= ($signed(($unsigned(wire31[(3'h4):(3'h4)]) >= {(wire16 ?
              (8'hbf) : (8'ha8)),
          (wire16 >= reg27)})) <= {$unsigned(((~|reg25) ?
              $unsigned(wire31) : ((8'h9d) ? reg20 : reg28)))});
    end
  assign wire36 = {$unsigned($signed(((wire13 ?
                          reg18 : reg19) - $signed(reg17)))),
                      (-$unsigned(reg23[(3'h5):(3'h5)]))};
  assign wire37 = ($unsigned({$unsigned($unsigned((8'hb7)))}) ?
                      (7'h40) : (^$signed((8'had))));
  always
    @(posedge clk) begin
      if ($signed(wire12))
        begin
          reg38 <= $signed(wire11);
          reg39 <= (8'hab);
          reg40 <= $unsigned({((wire15 ?
                  (wire32 ? reg23 : reg24) : $signed(reg24)) != reg26),
              (~|$unsigned(reg28))});
          if (reg23[(2'h2):(2'h2)])
            begin
              reg41 <= ({($signed((8'hba)) ?
                      $signed((wire12 && reg29)) : ((!reg20) && wire14[(3'h4):(2'h2)]))} << ((!$signed((-wire32))) ?
                  $unsigned(($unsigned(reg27) ?
                      (reg34 << reg28) : (reg20 ?
                          wire13 : (8'ha1)))) : $unsigned($unsigned(wire30))));
              reg42 <= $unsigned((reg21[(2'h3):(1'h1)] ?
                  ((^~reg23[(1'h1):(1'h0)]) ?
                      reg29 : ((reg29 | wire15) >= (reg21 ^~ wire14))) : $unsigned((7'h41))));
              reg43 <= (((&reg41[(4'h9):(1'h0)]) ^~ ((((8'hbd) ~^ reg35) ?
                          reg25 : $unsigned(wire36)) ?
                      reg20[(1'h0):(1'h0)] : reg35)) ?
                  $unsigned(($signed((reg29 ?
                      wire37 : reg33)) >> ($signed(reg28) ?
                      reg19[(4'h9):(3'h4)] : reg28[(2'h3):(2'h3)]))) : ($unsigned(wire36) ^~ {reg34,
                      wire11}));
              reg44 <= ($unsigned($unsigned(reg24[(2'h3):(2'h2)])) | {$unsigned($unsigned((wire12 <= (8'haa))))});
            end
          else
            begin
              reg41 <= {{$signed(reg19),
                      ((reg34 >>> $signed(reg39)) ?
                          reg28 : $unsigned((reg38 ? reg18 : reg42)))},
                  $signed((~((reg42 ? reg40 : reg44) - (~|reg42))))};
              reg42 <= reg23[(1'h0):(1'h0)];
              reg43 <= $signed(reg39[(2'h3):(1'h1)]);
              reg44 <= ($unsigned(wire14[(3'h5):(3'h5)]) < $unsigned($signed((wire36 ?
                  reg39[(1'h1):(1'h0)] : (reg19 ? reg35 : reg28)))));
              reg45 <= reg43;
            end
        end
      else
        begin
          reg38 <= (wire14 >> {(7'h44),
              (wire30 ? reg35 : (reg26[(2'h3):(2'h2)] ~^ ((7'h43) >= reg29)))});
          reg39 <= $signed(($unsigned(((wire11 ^~ reg17) ?
                  (reg17 ? reg27 : reg24) : $unsigned(reg21))) ?
              ($unsigned(wire37[(4'h9):(1'h1)]) == reg42) : ((|(^~reg33)) < reg17)));
        end
    end
  assign wire46 = $signed(reg40[(2'h2):(1'h1)]);
  assign wire47 = reg35[(3'h7):(2'h3)];
  assign wire48 = reg41[(4'he):(4'h9)];
  assign wire49 = ($signed(wire12) ^~ reg23[(2'h2):(2'h2)]);
  assign wire50 = reg27[(5'h13):(3'h6)];
  assign wire51 = (^~$unsigned({wire12, (|{reg44, wire37})}));
  always
    @(posedge clk) begin
      reg52 <= $signed({reg39[(4'hb):(4'h9)]});
      if ((reg20 ? wire13 : $signed($signed(reg52))))
        begin
          reg53 <= (reg42 ? wire36[(2'h3):(2'h2)] : reg24[(2'h2):(1'h1)]);
          if (((($unsigned({reg22}) ?
              (8'ha3) : wire13) + (~^(wire51[(4'h9):(3'h5)] ?
              {(7'h41)} : (reg42 ? (7'h42) : reg40)))) ^ reg39[(3'h4):(1'h1)]))
            begin
              reg54 <= $unsigned(wire51[(3'h7):(2'h2)]);
            end
          else
            begin
              reg54 <= $unsigned($signed($unsigned((~&(reg52 | wire50)))));
              reg55 <= wire13[(1'h1):(1'h1)];
              reg56 <= (wire13[(1'h0):(1'h0)] ?
                  (8'ha5) : ((reg33[(1'h1):(1'h0)] << ($signed(reg19) ?
                          $unsigned(wire11) : (+reg29))) ?
                      {reg22[(4'h9):(3'h4)], reg39} : reg24[(4'hc):(2'h3)]));
            end
          reg57 <= $signed(wire46);
          reg58 <= (+reg19);
          reg59 <= (^~wire30);
        end
      else
        begin
          if ((+$signed(reg33)))
            begin
              reg53 <= reg21;
              reg54 <= $signed({$signed(reg34),
                  (reg29[(1'h1):(1'h1)] ?
                      $unsigned(reg17) : {$signed(reg43)})});
              reg55 <= $signed($unsigned(reg52));
            end
          else
            begin
              reg53 <= $unsigned($unsigned((((-wire15) ?
                      reg18[(2'h2):(1'h0)] : wire48[(4'h8):(3'h6)]) ?
                  ($signed(reg53) ?
                      $unsigned(wire31) : $unsigned(reg38)) : {(+reg20)})));
              reg54 <= reg41;
            end
          reg56 <= reg23;
          reg57 <= $signed($signed(wire51));
          if (reg44)
            begin
              reg58 <= ((($unsigned((wire30 ? (8'hbe) : reg41)) ?
                      ($signed(reg21) | (7'h40)) : $unsigned($unsigned(reg17))) && (reg53[(1'h0):(1'h0)] ?
                      (reg27 + wire51) : (|reg24))) ?
                  (reg52 | reg24) : (8'ha8));
            end
          else
            begin
              reg58 <= wire37;
              reg59 <= (({wire15, reg58[(1'h1):(1'h0)]} ?
                  reg44[(3'h4):(1'h0)] : (((wire47 ? reg52 : (8'hbc)) ?
                          (wire16 >> wire30) : (-reg53)) ?
                      (~&(wire32 ?
                          reg45 : reg54)) : (+(8'ha2)))) <= $unsigned(wire50[(2'h3):(2'h3)]));
              reg60 <= (~&(reg52[(1'h1):(1'h0)] * $unsigned(reg22)));
            end
          if ((-reg27))
            begin
              reg61 <= wire47[(4'h8):(3'h5)];
              reg62 <= (!$signed(reg52[(2'h2):(2'h2)]));
              reg63 <= reg61[(4'ha):(2'h3)];
              reg64 <= ({$signed((^~wire36))} - ((^~reg58[(4'ha):(3'h7)]) | $unsigned(wire32[(3'h5):(3'h4)])));
            end
          else
            begin
              reg61 <= wire48;
              reg62 <= ($unsigned($unsigned(reg54)) ?
                  (reg27 ?
                      $unsigned((-reg21[(1'h1):(1'h1)])) : reg28[(5'h10):(3'h5)]) : reg53);
              reg63 <= reg21[(2'h2):(1'h0)];
            end
        end
      if (reg42)
        begin
          reg65 <= ((^((^reg52[(4'hd):(3'h7)]) ?
              (-(~&reg43)) : ((reg25 ? (8'hae) : wire11) ?
                  $signed(reg22) : $unsigned(wire30)))) - ({$unsigned(reg61)} <= reg41));
          if (wire47[(2'h2):(1'h1)])
            begin
              reg66 <= reg25[(1'h0):(1'h0)];
              reg67 <= reg53[(1'h0):(1'h0)];
              reg68 <= wire48;
              reg69 <= reg19[(3'h7):(3'h4)];
              reg70 <= reg64[(3'h4):(1'h0)];
            end
          else
            begin
              reg66 <= reg22;
              reg67 <= reg39;
              reg68 <= ((reg69[(2'h2):(1'h0)] ?
                      reg17[(1'h0):(1'h0)] : $signed(reg65)) ?
                  wire12 : (~|($unsigned(reg45[(1'h1):(1'h1)]) != reg52)));
            end
          reg71 <= $signed(wire30[(5'h10):(4'hf)]);
          reg72 <= reg63;
          if ((wire31 >= {($signed($signed(reg54)) ?
                  (wire47 ?
                      $unsigned(reg55) : (reg45 ?
                          reg24 : reg61)) : $unsigned($unsigned(wire30)))}))
            begin
              reg73 <= wire36;
            end
          else
            begin
              reg73 <= {(wire31 ~^ $signed($signed($unsigned(reg27)))),
                  reg70[(1'h1):(1'h0)]};
              reg74 <= (wire49 >> $signed(($unsigned((8'hb2)) ^ (~|(reg71 >= reg66)))));
              reg75 <= ((^reg65[(1'h0):(1'h0)]) - (+(8'hb7)));
              reg76 <= ((~{(+$signed(reg42)),
                  ($signed(reg21) <<< (reg26 < (7'h42)))}) ^ wire36);
            end
        end
      else
        begin
          reg65 <= (((reg38 > {{wire37, reg29}}) || reg40) ?
              $signed($signed(reg20)) : (~|reg74));
          reg66 <= reg54[(4'h9):(3'h7)];
        end
      reg77 <= (($unsigned(wire12[(2'h2):(2'h2)]) ?
              (((reg19 ? reg20 : reg65) + reg39[(3'h6):(2'h3)]) < (|(reg75 ?
                  reg59 : reg34))) : (8'ha9)) ?
          wire30[(4'h8):(3'h4)] : ((|((~^reg42) ?
                  reg58[(3'h7):(2'h3)] : reg21)) ?
              (~&reg41[(2'h2):(1'h0)]) : $signed({reg35, (reg28 + wire37)})));
    end
  assign wire78 = reg63[(1'h1):(1'h0)];
  assign wire79 = reg53[(1'h1):(1'h1)];
  assign wire80 = ($signed($unsigned(($signed((7'h40)) ^~ (reg39 * reg42)))) ^~ (~|(^reg75[(3'h4):(3'h4)])));
  module81 #() modinst111 (wire110, clk, wire47, wire31, reg72, wire46, wire79);
  assign wire112 = (reg72[(3'h7):(1'h1)] ?
                       $unsigned({wire16[(2'h2):(1'h1)],
                           reg25}) : $unsigned((|({wire12, reg56} ?
                           $unsigned(reg43) : (^~reg27)))));
  always
    @(posedge clk) begin
      reg113 <= $unsigned({reg75, reg19[(4'h8):(2'h2)]});
      reg114 <= (8'hb9);
      reg115 <= $unsigned(wire11[(2'h2):(1'h1)]);
      reg116 <= $signed($unsigned(reg68));
      if ($unsigned(($signed((reg38[(2'h2):(1'h1)] < {reg38,
          reg66})) || wire48)))
        begin
          reg117 <= $unsigned((8'hbd));
          if ({wire48[(3'h7):(3'h5)]})
            begin
              reg118 <= reg72;
              reg119 <= $signed($signed($signed($unsigned((reg28 <<< wire80)))));
              reg120 <= $unsigned(wire31);
              reg121 <= wire13;
            end
          else
            begin
              reg118 <= ($signed($signed(reg43)) >> (~^wire15[(1'h0):(1'h0)]));
              reg119 <= $unsigned(($unsigned((wire48[(2'h2):(1'h1)] ?
                  $unsigned(reg64) : $signed(reg61))) ^~ $unsigned(reg64)));
              reg120 <= wire31[(5'h13):(3'h7)];
              reg121 <= wire79[(4'hd):(4'h8)];
            end
        end
      else
        begin
          reg117 <= reg121;
          reg118 <= $signed($unsigned(reg55));
          reg119 <= {((7'h44) < $unsigned($signed((wire46 == wire32)))),
              (reg57 <<< $signed(reg119))};
          reg120 <= {$signed((reg57[(2'h2):(2'h2)] ?
                  (^~$signed(reg19)) : {$unsigned(wire46)})),
              $unsigned((~$unsigned($signed(wire51))))};
          reg121 <= ((~&(((~(8'hb5)) | (~^reg121)) ?
                  reg53 : reg58[(5'h14):(2'h3)])) ?
              reg53[(2'h2):(1'h1)] : (reg40[(1'h1):(1'h0)] ?
                  ((wire112[(2'h2):(2'h2)] | $unsigned(reg68)) ?
                      reg117[(3'h4):(1'h1)] : $unsigned(wire16[(1'h0):(1'h0)])) : reg55));
        end
    end
  assign wire122 = (~reg27);
endmodule

module module81
#(parameter param108 = ((^(&(((8'h9e) ^~ (8'haf)) ? (+(8'ha6)) : {(8'ha4)}))) ? (&(!{((8'hab) ? (8'h9e) : (8'hbf)), (|(8'hb9))})) : (-(8'hb0))), 
parameter param109 = ((^~param108) & param108))
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire86;
  input wire signed [(5'h14):(1'h0)] wire85;
  input wire signed [(5'h10):(1'h0)] wire84;
  input wire [(5'h13):(1'h0)] wire83;
  input wire [(4'hf):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(4'ha):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire94;
  wire signed [(4'ha):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire99,
                 wire98,
                 wire97,
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
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire87 = $signed((($signed(wire83[(3'h6):(1'h1)]) && ({wire84} ~^ (wire86 | wire82))) ?
                      $signed(wire82[(4'he):(2'h2)]) : wire84));
  assign wire88 = (+wire86);
  assign wire89 = {{((8'had) ?
                              $unsigned($unsigned(wire88)) : $signed($signed(wire82))),
                          (&wire88[(2'h2):(1'h0)])},
                      (8'h9d)};
  assign wire90 = wire87[(4'h8):(3'h6)];
  assign wire91 = ((+((wire83[(4'hc):(2'h3)] <= ((8'ha6) ? wire86 : wire86)) ?
                          wire83[(5'h12):(3'h4)] : ($signed(wire85) < $signed(wire87)))) ?
                      wire89 : ($signed((wire85 <= $unsigned(wire88))) ^~ wire87[(1'h1):(1'h1)]));
  assign wire92 = ((^~$signed(((wire86 || wire84) ?
                          (wire82 ? wire89 : wire90) : $signed(wire86)))) ?
                      $signed(($signed($signed(wire89)) ?
                          (!wire86) : wire83[(5'h12):(3'h5)])) : $signed(wire88[(2'h2):(1'h1)]));
  assign wire93 = wire85;
  assign wire94 = (^$unsigned({{(-(8'hac))}, wire92[(4'h8):(2'h2)]}));
  assign wire95 = (&($unsigned({wire93, (~&wire82)}) >= (((~wire90) ?
                          wire92 : $signed(wire91)) ?
                      ((wire90 <<< wire94) >>> {(7'h42), wire83}) : wire85)));
  assign wire96 = wire86[(4'hf):(4'h9)];
  assign wire97 = wire82;
  assign wire98 = ($unsigned(wire95[(4'hb):(1'h1)]) ?
                      wire86[(4'hd):(3'h6)] : wire88);
  assign wire99 = ($signed($signed((wire98 ?
                      (wire86 ?
                          wire96 : wire98) : (-wire85)))) ^~ wire86[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg100 <= ($signed($unsigned(((~wire96) != wire87))) ?
          (^{{wire97[(1'h0):(1'h0)]}}) : (wire89 ?
              (($signed(wire92) < (^wire95)) ^ ((wire82 ?
                  wire86 : (8'ha8)) >> $signed((8'haf)))) : $unsigned($unsigned($unsigned(wire91)))));
      reg101 <= $unsigned((|($signed((!wire89)) ?
          $unsigned(wire90[(3'h4):(1'h0)]) : wire98[(3'h7):(2'h2)])));
      reg102 <= $unsigned($unsigned((-wire83[(1'h0):(1'h0)])));
      reg103 <= wire84;
    end
  assign wire104 = wire96;
  assign wire105 = ($signed(((7'h44) ^ ({wire104, wire91} ?
                       $signed((8'ha7)) : ((8'hb6) >>> wire83)))) >>> $unsigned($signed((~^(wire92 ?
                       wire93 : (8'ha0))))));
  assign wire106 = ($unsigned(wire99) <= wire82[(4'hc):(3'h7)]);
  assign wire107 = ($unsigned(reg101) ?
                       wire97 : (wire98 ?
                           (^~((wire90 & (8'hb8)) <<< wire93)) : wire90));
endmodule
