module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire72;
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire23,
                 wire72,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg10,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  assign wire5 = (wire3[(1'h1):(1'h1)] ?
                     $signed($signed((wire0[(4'h8):(3'h7)] ?
                         wire0 : wire4[(2'h2):(1'h0)]))) : $unsigned($signed($signed($signed(wire1)))));
  assign wire6 = $signed($signed({wire1}));
  assign wire7 = (({wire5[(3'h4):(1'h1)], wire2} ^~ (7'h44)) ?
                     ((($signed(wire2) << $signed(wire0)) ?
                         wire3[(2'h2):(2'h2)] : $signed($signed(wire6))) + (wire4[(4'ha):(3'h4)] <= {$unsigned((8'h9e))})) : $unsigned((+(7'h41))));
  assign wire8 = {$unsigned(wire3[(3'h6):(3'h4)])};
  assign wire9 = wire5;
  always
    @(posedge clk) begin
      reg10 <= {wire2};
    end
  assign wire11 = $unsigned($signed($unsigned($unsigned(wire2))));
  assign wire12 = (($signed(wire1[(3'h7):(3'h4)]) ~^ {({reg10} ?
                          (wire6 ? wire9 : wire1) : (wire6 ? wire2 : wire7)),
                      {((8'hb8) ?
                              (8'hbd) : wire9)}}) != {(~&wire6[(1'h1):(1'h1)])});
  assign wire13 = {$unsigned($signed({(wire2 ? wire0 : wire3),
                          (wire2 ? wire6 : wire4)})),
                      {{$signed((wire8 >> wire12))},
                          ($unsigned((reg10 ^ wire5)) & {wire5[(4'h8):(3'h6)],
                              wire2[(1'h1):(1'h1)]})}};
  assign wire14 = wire5;
  always
    @(posedge clk) begin
      if (wire12[(5'h13):(4'h8)])
        begin
          reg15 <= $unsigned(wire2);
          reg16 <= (8'ha0);
          if ((&$unsigned($unsigned(((reg16 | wire9) ?
              wire3 : (wire9 >> (7'h44)))))))
            begin
              reg17 <= wire6;
              reg18 <= ($signed(($signed((wire13 * (8'ha4))) > {(reg15 ^~ wire13),
                      $unsigned((7'h42))})) ?
                  $unsigned((&{(+reg10), wire3})) : {wire3});
              reg19 <= {{$unsigned((wire2 && (reg17 != wire6)))},
                  {$unsigned({$unsigned(wire12), $unsigned(wire1)}), (-wire0)}};
              reg20 <= ((&(($signed(wire5) | wire5) >= wire9)) < wire5[(1'h1):(1'h1)]);
            end
          else
            begin
              reg17 <= (7'h43);
              reg18 <= reg20[(4'hc):(3'h5)];
            end
          reg21 <= wire5[(3'h6):(3'h6)];
          reg22 <= ($signed($unsigned({wire12})) ?
              wire3[(1'h0):(1'h0)] : {(wire14[(2'h3):(1'h0)] ^ {(&reg18)}),
                  (wire5 << wire14)});
        end
      else
        begin
          reg15 <= (-(8'hbc));
          reg16 <= (wire9[(2'h3):(1'h1)] | wire9);
          reg17 <= (($unsigned($unsigned((wire12 >>> (7'h41)))) & $signed((wire7[(3'h6):(1'h0)] ?
                  (reg10 ? (8'hab) : (8'ha6)) : wire11))) ?
              reg16[(4'hb):(3'h4)] : (~wire8[(3'h5):(3'h4)]));
        end
    end
  assign wire23 = wire14;
  module24 #() modinst73 (wire72, clk, wire5, reg20, reg18, reg10);
  always
    @(posedge clk) begin
      reg74 <= {wire6,
          ($signed($signed((wire9 > wire13))) ?
              (wire14 || {{reg20}, $signed(reg16)}) : (-(8'hb2)))};
      reg75 <= $unsigned(($signed((|$unsigned(reg19))) ?
          (((wire6 && (8'hb9)) ?
              (8'hb6) : (reg19 <= (7'h44))) ^~ reg16[(1'h1):(1'h1)]) : $signed(((reg17 << wire4) ~^ $signed(wire8)))));
      reg76 <= $unsigned(wire7[(3'h5):(1'h0)]);
      reg77 <= reg10[(3'h4):(3'h4)];
      reg78 <= (!(~^wire23));
    end
endmodule

module module24  (y, clk, wire25, wire26, wire27, wire28);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire [(2'h3):(1'h0)] wire27;
  input wire [(3'h4):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire65;
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire29,
                 wire30,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire40,
                 wire65,
                 reg31,
                 reg39,
                 (1'h0)};
  assign wire29 = (((wire27 - (|$signed((8'hb8)))) ?
                          ((wire28[(1'h1):(1'h0)] ?
                              (wire28 ?
                                  wire27 : wire26) : $signed(wire28)) & $unsigned($unsigned(wire27))) : $unsigned(((wire28 ?
                              (8'ha1) : wire28) | (wire25 < wire28)))) ?
                      {wire26,
                          $unsigned((wire25 ?
                              (wire25 + wire26) : (8'hac)))} : wire26);
  assign wire30 = (~$unsigned((wire26 ? wire27 : wire25[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg31 <= (!$unsigned((wire29[(5'h11):(2'h2)] & (!$signed(wire25)))));
    end
  assign wire32 = {reg31};
  assign wire33 = (((|$unsigned(reg31)) ?
                          $unsigned(wire28[(2'h3):(2'h3)]) : {{wire26}}) ?
                      wire30[(3'h4):(1'h1)] : wire30);
  assign wire34 = ((~$signed($unsigned((reg31 >= wire32)))) ?
                      (~|(($signed(wire28) - $unsigned(wire25)) ^ (&$unsigned(wire33)))) : (~|({(wire25 <<< wire32),
                          (&reg31)} > ($unsigned(wire27) ?
                          $unsigned(wire27) : wire28[(3'h4):(2'h2)]))));
  assign wire35 = $signed(({(wire32[(4'h8):(2'h3)] ?
                          $signed(wire29) : (~^wire27)),
                      wire26[(1'h1):(1'h1)]} && wire34[(4'hd):(2'h3)]));
  assign wire36 = {(wire32 ^~ (!{$unsigned(wire30), (wire25 | wire30)}))};
  assign wire37 = wire33;
  assign wire38 = wire35;
  always
    @(posedge clk) begin
      reg39 <= reg31[(3'h6):(3'h6)];
    end
  assign wire40 = $signed($unsigned((!wire27[(1'h1):(1'h1)])));
  module41 #() modinst66 (.wire43(wire33), .clk(clk), .wire42(wire28), .wire44(reg39), .y(wire65), .wire45(wire40));
  assign wire67 = (8'hbc);
  assign wire68 = wire32;
  assign wire69 = wire65[(3'h6):(1'h0)];
  assign wire70 = {($unsigned((((8'hae) <<< reg31) ?
                              (wire25 ? (7'h42) : wire40) : $signed(wire69))) ?
                          $signed(($unsigned(wire32) >>> (~|wire29))) : $signed((wire69[(2'h3):(1'h1)] || (wire29 ?
                              wire36 : wire34))))};
  assign wire71 = (8'ha1);
endmodule

module module41
#(parameter param64 = (~(((((7'h41) ? (8'ha9) : (8'hbf)) >= ((8'hb1) ? (8'haf) : (7'h43))) ? {((8'hbe) ? (8'had) : (7'h40))} : {((8'hb5) ? (7'h42) : (7'h42))}) < {(((8'hb8) <<< (8'hb7)) ? ((8'ha5) & (8'ha6)) : ((8'hb7) ? (8'hbb) : (8'haa)))})))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire45;
  input wire signed [(3'h7):(1'h0)] wire44;
  input wire signed [(4'ha):(1'h0)] wire43;
  input wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire46 = $signed($unsigned(((+(wire45 ? wire43 : wire43)) | (((8'hab) ?
                          wire45 : wire44) ?
                      $unsigned(wire45) : wire45))));
  assign wire47 = (8'hb9);
  assign wire48 = $signed((-wire44));
  assign wire49 = wire43;
  assign wire50 = ($unsigned($unsigned({(wire47 <<< wire47)})) ?
                      ((~&(wire45 ^ $unsigned(wire45))) ?
                          (~|$signed((!wire46))) : (~$signed((wire47 - wire43)))) : (~wire42));
  always
    @(posedge clk) begin
      reg51 <= {(~$unsigned($signed((-wire45)))),
          (~&((-$signed((8'hb0))) ?
              (wire44 ?
                  wire45[(4'hb):(4'hb)] : (wire46 ^ wire47)) : $unsigned(wire43[(2'h3):(2'h2)])))};
      reg52 <= (reg51 < $signed(wire48));
      reg53 <= $signed((8'hbc));
    end
  always
    @(posedge clk) begin
      reg54 <= {($unsigned($signed(((8'hae) ? reg53 : wire48))) ?
              $unsigned($unsigned($unsigned(wire46))) : $signed({wire44})),
          $unsigned(($signed((reg51 ? reg52 : wire42)) <<< ((~(8'h9d)) ?
              (wire48 && wire43) : $signed(wire49))))};
      reg55 <= $signed(($signed($unsigned((wire46 ? (8'ha1) : reg52))) ?
          ($unsigned(wire43[(4'ha):(3'h6)]) ?
              reg52[(4'he):(3'h4)] : $signed((reg52 ^ reg54))) : {(8'hbd)}));
    end
  assign wire56 = (($unsigned((~|wire47)) ? (8'hb4) : wire48) ?
                      $signed(reg51[(1'h0):(1'h0)]) : wire46[(5'h10):(1'h0)]);
  assign wire57 = (({(~|$unsigned(wire46)), reg51} ?
                      ($unsigned($unsigned(wire42)) ?
                          $signed((!wire45)) : $signed(wire42[(2'h2):(2'h2)])) : (-$unsigned($signed(wire56)))) + reg51);
  assign wire58 = $signed(($signed($unsigned((wire42 ~^ wire44))) ~^ (!{{(8'hbf)},
                      (+(8'hbd))})));
  assign wire59 = ((($unsigned($unsigned(wire56)) ?
                      $unsigned($signed(wire48)) : ({wire57} ?
                          reg52[(3'h5):(3'h4)] : $signed(reg53))) < (({wire57} ?
                      {(8'hb2)} : wire56) + $signed({wire42}))) + $unsigned(reg54[(1'h1):(1'h1)]));
  assign wire60 = (({$unsigned((wire56 ? wire44 : wire58))} ?
                      $unsigned(wire47) : reg54) - {{wire58[(2'h2):(1'h0)],
                          $unsigned(wire56)}});
  assign wire61 = ((~^wire56) ?
                      $signed((((reg52 ^ wire44) ?
                          $unsigned(wire48) : (reg51 ?
                              wire47 : wire47)) == ({reg54, wire60} ?
                          (wire56 ? (8'ha1) : reg53) : ((8'ha4) ?
                              reg54 : wire57)))) : wire50[(3'h7):(3'h6)]);
  assign wire62 = (8'hb4);
  assign wire63 = wire47;
endmodule
