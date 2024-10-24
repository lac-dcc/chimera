module top
#(parameter param120 = (+(((((7'h40) ^ (8'ha6)) ? ((7'h42) ? (8'hbc) : (8'hb1)) : (~(8'hb6))) && (&(|(8'haa)))) ? {{((8'h9c) < (8'hbf)), {(8'hac)}}} : (((8'ha2) ? ((8'ha4) ? (8'hbe) : (8'haa)) : ((8'ha3) >= (8'hb1))) ? (8'h9c) : (((8'ha3) ? (8'hb3) : (8'ha8)) ? ((8'hbb) ? (8'ha2) : (8'hae)) : ((8'had) ~^ (8'hae)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire116;
  wire signed [(4'ha):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire113;
  wire [(2'h2):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire14;
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire32,
                 wire31,
                 wire28,
                 wire14,
                 reg30,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire3[(1'h1):(1'h1)])
        begin
          reg5 <= ((|wire2) ?
              $signed($unsigned(($unsigned(wire1) ?
                  $unsigned(wire2) : $unsigned(wire0)))) : $unsigned((~|$unsigned((wire4 - (7'h41))))));
          if (wire0[(1'h0):(1'h0)])
            begin
              reg6 <= $signed((wire1 ?
                  ((^wire4) + ($signed(wire2) <<< (reg5 ?
                      wire0 : reg5))) : ((+(~&wire2)) ?
                      ((^~wire0) >= (8'haa)) : reg5[(4'h9):(2'h2)])));
              reg7 <= (-wire0);
              reg8 <= reg6;
              reg9 <= wire3[(5'h13):(4'he)];
            end
          else
            begin
              reg6 <= wire4[(1'h1):(1'h0)];
            end
          reg10 <= wire0;
        end
      else
        begin
          reg5 <= (($signed((-$unsigned(reg7))) ?
              (+wire0) : (({wire2} ? (reg7 >>> wire1) : $unsigned(reg7)) ?
                  ($signed(reg8) || reg6) : reg6[(1'h1):(1'h1)])) * $unsigned(((wire4[(3'h5):(3'h4)] || wire0) <<< (&$signed(reg7)))));
          reg6 <= $signed(wire3[(3'h4):(1'h1)]);
          reg7 <= $signed(((wire2[(3'h4):(2'h3)] ?
              ((-reg5) > $unsigned(wire3)) : $signed((wire1 ?
                  (8'had) : wire2))) < {(~^wire3[(3'h5):(1'h0)]),
              ((^~wire4) <= (wire1 ? reg7 : reg7))}));
          reg8 <= (8'hbd);
          reg9 <= (&(!wire1));
        end
      reg11 <= ({reg6[(4'ha):(3'h4)]} ?
          (($unsigned(reg8[(3'h4):(2'h3)]) == wire0[(1'h1):(1'h1)]) ?
              (reg6 ?
                  reg9 : ($unsigned(reg5) ?
                      $signed(reg9) : reg8[(2'h3):(2'h3)])) : $signed((^~(reg9 ?
                  wire0 : reg8)))) : (reg5[(3'h7):(3'h7)] - ($signed({wire4}) ?
              {(reg5 ? reg9 : (8'hb7)),
                  wire3[(5'h11):(4'h9)]} : wire4[(3'h5):(3'h5)])));
      if ($unsigned($signed($unsigned((reg10[(3'h4):(2'h3)] >= reg10)))))
        begin
          reg12 <= (~|(reg8[(1'h1):(1'h0)] > $signed(wire4[(2'h2):(2'h2)])));
        end
      else
        begin
          reg12 <= reg9;
          reg13 <= reg6[(4'h8):(2'h2)];
        end
    end
  assign wire14 = reg8;
  module15 #() modinst29 (wire28, clk, reg10, wire1, reg7, wire2);
  always
    @(posedge clk) begin
      reg30 <= $signed(((wire28 * (~^((8'ha6) << reg12))) ^~ ((reg13[(3'h4):(1'h1)] == reg12[(2'h2):(1'h1)]) == ((reg5 && reg12) && (reg10 ?
          reg8 : reg8)))));
    end
  assign wire31 = $unsigned($unsigned((wire0[(1'h0):(1'h0)] ^~ reg7[(4'hb):(3'h4)])));
  assign wire32 = $signed($signed((^~(|$unsigned(reg10)))));
  module33 #() modinst114 (.wire37(wire1), .wire34(wire28), .clk(clk), .wire35(wire3), .wire36(wire31), .y(wire113));
  assign wire115 = reg9[(4'h8):(3'h6)];
  assign wire116 = (&reg11[(2'h2):(1'h1)]);
  assign wire117 = (-$signed((({wire32} ?
                           (wire116 >> wire1) : $unsigned(wire3)) ?
                       (~^$signed(wire3)) : ((wire3 <<< wire115) ?
                           wire3[(4'ha):(3'h7)] : (wire113 <= reg30)))));
  assign wire118 = ($unsigned(wire31) || $unsigned((~&(|((8'ha8) ?
                       reg30 : reg8)))));
  assign wire119 = (((^~(8'hb8)) & wire3[(5'h12):(4'hd)]) ?
                       wire32 : $unsigned(((((8'hae) || wire2) ?
                               wire118[(4'hd):(1'h0)] : reg13) ?
                           (~|((8'hbd) ?
                               wire116 : reg30)) : $unsigned($signed(wire31)))));
endmodule

module module33
#(parameter param112 = (~(|(((+(8'hb7)) >> (!(8'hb8))) ? (^(!(8'ha1))) : {((8'haf) ? (8'ha2) : (8'hbf)), ((8'ha2) ? (8'h9c) : (7'h43))}))))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire37;
  input wire [(4'h9):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  input wire [(5'h10):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire38;
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  assign y = {wire111,
                 wire109,
                 wire87,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire47,
                 wire46,
                 wire45,
                 wire38,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire38 = (-($signed($unsigned(wire37)) == ((^wire35) ?
                      wire35[(2'h2):(1'h1)] : $unsigned($signed(wire34)))));
  always
    @(posedge clk) begin
      reg39 <= $unsigned($unsigned(wire38));
      if ((7'h42))
        begin
          reg40 <= wire38[(4'h9):(2'h3)];
          reg41 <= wire34;
          reg42 <= (wire34[(1'h0):(1'h0)] ? wire36 : (~&{(^wire34)}));
          reg43 <= ((({((8'ha2) ? wire34 : (8'hb8)), wire38} << (((8'ha4) ?
              wire38 : (7'h43)) + (wire36 != wire34))) || wire38[(3'h5):(3'h4)]) | $unsigned(reg40));
        end
      else
        begin
          if (($unsigned($unsigned({(wire38 && reg42),
              (|(8'hae))})) == ($signed((-(-reg40))) ?
              (reg40 ?
                  (|$signed(reg40)) : (reg39 < wire36)) : $unsigned(reg41))))
            begin
              reg40 <= {($signed(((reg42 ? wire37 : wire35) != (wire37 ?
                      wire35 : (8'hb8)))) >> wire38[(3'h5):(1'h1)]),
                  reg42[(4'h9):(2'h2)]};
              reg41 <= ((wire36 ?
                      reg41[(1'h1):(1'h1)] : (((wire37 ? (8'hb3) : wire37) ?
                              wire34 : reg40) ?
                          $unsigned(reg39[(3'h4):(1'h1)]) : {(~|wire37),
                              wire37[(2'h2):(2'h2)]})) ?
                  ($unsigned(reg40) ?
                      {($signed(reg40) ?
                              wire34 : {wire34})} : ($unsigned((~reg42)) ?
                          ($signed(wire35) != (8'ha2)) : ((8'ha4) ?
                              ((8'hae) <= wire36) : (&reg43)))) : reg39);
              reg42 <= wire35;
            end
          else
            begin
              reg40 <= reg41[(3'h5):(3'h5)];
            end
          reg43 <= wire37;
          reg44 <= ({(^~reg41)} ?
              wire37[(4'hd):(4'hc)] : (^wire37[(3'h7):(2'h3)]));
        end
    end
  assign wire45 = {($unsigned(wire35[(4'hc):(4'h9)]) ?
                          {(wire34 < (!reg40)), reg43} : {wire37}),
                      $unsigned({(~reg41[(3'h6):(1'h0)]),
                          ($unsigned(wire38) + reg39)})};
  assign wire46 = reg40;
  assign wire47 = (wire38[(1'h1):(1'h0)] ?
                      ($signed(reg41[(1'h0):(1'h0)]) > wire38) : (($unsigned({wire37,
                              wire38}) != $unsigned((wire45 >> reg39))) ?
                          reg44[(4'h8):(3'h7)] : (reg43 ^ ($unsigned((8'hab)) ?
                              (wire45 | wire35) : wire45[(4'hb):(1'h0)]))));
  module48 #() modinst68 (.clk(clk), .wire50(reg40), .wire52(wire36), .wire49(wire35), .y(wire67), .wire51(reg43));
  assign wire69 = wire47;
  assign wire70 = $unsigned(reg43);
  assign wire71 = $signed(wire45);
  assign wire72 = {{(wire36 <= wire38[(4'h9):(2'h3)]), (|wire69)}};
  always
    @(posedge clk) begin
      if (wire67)
        begin
          if (reg39[(5'h11):(3'h4)])
            begin
              reg73 <= (~&(~^wire71[(1'h0):(1'h0)]));
              reg74 <= {((8'hab) | (+(wire69 ?
                      (wire70 ? reg40 : wire67) : $unsigned(wire38))))};
              reg75 <= ($signed(wire37) ~^ ((7'h40) ?
                  (wire34[(4'he):(4'ha)] | $unsigned(wire67[(2'h2):(2'h2)])) : ($unsigned(wire69[(2'h2):(1'h0)]) ?
                      $unsigned(reg39) : (&wire35[(4'h9):(4'h9)]))));
              reg76 <= wire71[(2'h3):(1'h1)];
            end
          else
            begin
              reg73 <= ($signed({$unsigned($signed(reg76))}) ?
                  wire35 : $unsigned($signed(((wire69 == reg76) + $unsigned(wire36)))));
              reg74 <= reg42[(4'ha):(4'ha)];
              reg75 <= (!$signed(reg73[(1'h1):(1'h0)]));
              reg76 <= (wire36 ? wire38 : (^{reg42}));
              reg77 <= ((reg43[(3'h4):(3'h4)] ?
                      wire72 : $unsigned($signed(reg75))) ?
                  $signed(reg39) : (^~((reg41[(1'h1):(1'h0)] >> ((8'hbc) ?
                      wire46 : wire37)) && (|reg43[(4'ha):(2'h3)]))));
            end
          if (($unsigned($signed((~reg42[(4'hd):(4'h8)]))) ?
              (wire38 ^~ $signed($signed((8'hb8)))) : $signed({{(^(8'hbc))},
                  reg75})))
            begin
              reg78 <= {(($unsigned(reg42) ?
                      $signed(reg44[(4'hb):(3'h5)]) : {(reg75 ?
                              reg73 : (8'hbf)),
                          (wire38 ? wire36 : reg75)}) - {((reg74 ?
                          wire69 : wire47) ~^ $signed(wire35))})};
              reg79 <= (reg42 ? (8'hab) : (^(8'hb1)));
              reg80 <= $signed(wire45);
            end
          else
            begin
              reg78 <= $unsigned($signed(wire38[(2'h3):(1'h1)]));
              reg79 <= reg43[(3'h4):(1'h1)];
              reg80 <= wire67[(2'h2):(1'h1)];
            end
          reg81 <= reg74[(1'h0):(1'h0)];
        end
      else
        begin
          if (((reg74 ? $unsigned((~(wire69 <<< reg78))) : reg40) ?
              (reg74 ?
                  ($unsigned((~^wire36)) ?
                      reg78 : reg75[(2'h2):(1'h1)]) : (~^(reg39[(5'h12):(2'h2)] ?
                      (wire67 ?
                          (8'haa) : wire37) : (~(8'hbf))))) : reg74[(2'h2):(2'h2)]))
            begin
              reg73 <= $signed({{{reg80}}});
              reg74 <= $signed({{$unsigned($unsigned((8'hb7))), wire38},
                  ($unsigned($signed((8'ha9))) ?
                      reg76[(3'h6):(3'h5)] : (~^(reg75 >= (8'hab))))});
            end
          else
            begin
              reg73 <= (~&reg79);
              reg74 <= reg43;
            end
          reg75 <= reg40[(4'h8):(2'h2)];
          reg76 <= (~$unsigned((~|wire47[(3'h7):(1'h1)])));
          reg77 <= ((reg78 << (($signed(wire38) ^~ (wire70 ^~ reg81)) < ((^~(8'ha1)) - (wire46 ?
              reg41 : wire47)))) >>> wire45[(1'h1):(1'h1)]);
          reg78 <= $unsigned((wire72[(1'h0):(1'h0)] | (({wire36,
                  (8'haa)} || {reg39}) ?
              reg81 : ({reg76, (8'hb2)} ? (reg39 ? reg42 : reg77) : wire71))));
        end
      reg82 <= wire71[(3'h5):(3'h4)];
      if (($signed((((reg75 ? wire45 : (8'ha0)) ?
              (wire46 ?
                  wire37 : (8'ha7)) : (wire47 != wire47)) | $signed($signed(wire67)))) ?
          (wire37[(2'h2):(1'h1)] ?
              (wire71[(1'h1):(1'h0)] ?
                  $unsigned((reg39 ^ reg73)) : ((reg75 < wire45) ?
                      (&reg74) : wire35[(4'hb):(4'h8)])) : $signed($unsigned(reg40))) : $unsigned((^~$unsigned((wire67 ?
              (8'hb2) : reg39))))))
        begin
          reg83 <= reg82[(4'ha):(3'h7)];
        end
      else
        begin
          reg83 <= $signed(((((^wire47) ?
              $signed((8'hb6)) : $unsigned((8'ha3))) << $unsigned($unsigned(reg39))) != reg74[(2'h2):(1'h1)]));
          reg84 <= (!wire72);
        end
      reg85 <= ((~|(reg39[(3'h5):(1'h1)] >> ((wire47 && (8'ha4)) ?
          wire38 : wire45))) >= ((~|((8'h9e) >= (wire67 ? wire35 : (8'hbd)))) ?
          wire47 : (!((|(8'ha8)) == (8'hbd)))));
    end
  always
    @(posedge clk) begin
      reg86 <= ((($signed(reg82) ?
          $signed($unsigned(reg79)) : wire35[(4'ha):(2'h2)]) - (|({reg42} ?
          (~reg44) : ((8'hbd) | wire45)))) && $signed({$signed({reg74}),
          reg73[(2'h3):(2'h2)]}));
    end
  assign wire87 = (reg43 >> ((reg75 ?
                      reg74[(1'h1):(1'h0)] : $unsigned((wire34 ?
                          wire38 : wire34))) >> $signed(reg85[(3'h7):(3'h7)])));
  module88 #() modinst110 (.wire91(reg82), .y(wire109), .wire92(reg42), .wire90(reg39), .clk(clk), .wire89(reg80));
  assign wire111 = (~|(&reg83[(4'h9):(1'h1)]));
endmodule

module module15
#(parameter param27 = ((((((8'hb2) >= (8'hbb)) ? ((8'hb8) ? (8'hbb) : (8'hb1)) : ((8'hbf) | (8'hb3))) <= ((~(8'hbc)) ? ((8'hb3) ? (8'ha7) : (8'hac)) : {(8'ha4)})) <<< (~|(~^{(8'ha1), (8'h9f)}))) - (((((7'h42) | (8'hbb)) <<< (-(8'hb4))) ^~ (((8'ha4) && (8'hbb)) + ((8'ha7) >= (8'hbc)))) ? ((|((8'ha4) ? (8'hac) : (8'ha7))) ? (((8'ha2) | (8'hae)) ? ((8'hb9) ~^ (7'h44)) : ((8'hb5) ? (8'ha4) : (8'ha4))) : ((^~(8'ha3)) == (8'h9f))) : {{((8'h9f) ~^ (8'hb9))}})))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  assign y = {wire26, wire25, wire24, wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = wire18;
  assign wire21 = (~&wire16);
  assign wire22 = $unsigned(wire19);
  assign wire23 = $signed($unsigned({($signed(wire21) ?
                          {wire22, wire19} : wire21),
                      wire16[(1'h1):(1'h0)]}));
  assign wire24 = ((wire20[(3'h5):(1'h1)] ?
                      $signed(($signed((8'hb3)) + (wire19 - wire23))) : wire18[(4'ha):(4'h8)]) * (~&{($signed((8'ha3)) ?
                          (wire22 ? wire19 : wire21) : wire16),
                      (wire19 ?
                          $unsigned(wire17) : ((8'h9f) ? wire19 : wire20))}));
  assign wire25 = wire22[(1'h1):(1'h1)];
  assign wire26 = wire16[(3'h4):(1'h0)];
endmodule

module module88
#(parameter param108 = (~|(((!{(8'hb2)}) || (~^((8'had) + (8'h9f)))) << {({(8'hb3), (7'h40)} > ((8'ha5) <= (7'h43))), (((8'hab) <<< (8'hb6)) ? (~&(8'hba)) : {(8'h9d)})})))
(y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire92;
  input wire [(3'h4):(1'h0)] wire91;
  input wire signed [(3'h7):(1'h0)] wire90;
  input wire [(4'h8):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire103;
  wire [(3'h5):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire93;
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 reg104,
                 (1'h0)};
  assign wire93 = (~&(wire90 << (^~((~wire89) && (!wire91)))));
  assign wire94 = (wire90 << $signed(($unsigned($signed((8'hbd))) >= (wire92[(3'h4):(2'h3)] && (|(8'hbf))))));
  assign wire95 = (&$unsigned((($unsigned(wire89) ?
                      (^~wire92) : {(8'hae), wire91}) ^~ {$unsigned(wire94)})));
  assign wire96 = ((wire95[(2'h3):(2'h3)] | (((wire93 ? wire94 : (8'haa)) ?
                      wire92[(3'h4):(1'h1)] : (&wire91)) >>> $signed({(8'haa)}))) <= wire91);
  assign wire97 = $signed((($unsigned($signed(wire93)) ?
                      ($unsigned(wire93) ? wire93 : wire96) : $signed(((8'hb2) ?
                          wire89 : wire96))) ^~ wire93[(1'h1):(1'h0)]));
  assign wire98 = (!(^({$unsigned(wire95)} + wire93[(3'h5):(3'h4)])));
  assign wire99 = wire97[(1'h1):(1'h1)];
  assign wire100 = (($unsigned(((wire91 ? wire93 : (8'ha7)) ?
                           (~&wire90) : $signed((8'hbd)))) ?
                       (wire99[(3'h7):(2'h3)] >= (wire96 ?
                           wire99 : ((8'h9c) ?
                               wire95 : wire97))) : (8'hb6)) | wire95);
  assign wire101 = wire98;
  assign wire102 = $signed($signed($signed($signed(wire90[(3'h4):(3'h4)]))));
  assign wire103 = $signed(({(+$unsigned(wire97))} <= wire97));
  always
    @(posedge clk) begin
      reg104 <= $signed((~^$signed(($unsigned(wire95) + $signed(wire92)))));
    end
  assign wire105 = $signed($signed($unsigned(wire91)));
  assign wire106 = wire91[(2'h3):(2'h2)];
  assign wire107 = wire105[(3'h4):(1'h0)];
endmodule

module module48
#(parameter param65 = (^~(((((7'h44) ? (8'ha0) : (8'hb2)) == (8'hba)) ? (((8'ha7) ? (8'hb2) : (8'ha8)) ? {(8'hbb)} : ((8'hb6) ^ (8'h9c))) : (~&(~(8'hb6)))) ? ((((8'hac) == (8'hba)) ? (|(8'h9c)) : ((8'hb4) * (8'hba))) << (((8'hb7) == (8'ha1)) ? {(7'h40)} : ((8'hb2) && (7'h41)))) : (|(((8'h9e) ^ (8'ha5)) == ((8'hac) ? (8'hac) : (8'hb1)))))), 
parameter param66 = (param65 ? param65 : (~&(((~|param65) == {(8'ha7)}) ? param65 : param65))))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire52;
  input wire [(2'h2):(1'h0)] wire51;
  input wire signed [(4'ha):(1'h0)] wire50;
  input wire signed [(4'he):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire53 = $unsigned(wire51[(1'h1):(1'h0)]);
  assign wire54 = (wire52[(4'h8):(3'h6)] ?
                      wire52 : $unsigned(((wire52 ?
                          {wire50} : (!wire50)) == wire51[(2'h2):(1'h1)])));
  assign wire55 = wire53[(1'h1):(1'h0)];
  assign wire56 = ($unsigned((^wire55)) != {$unsigned(((^~wire54) ?
                          (wire49 >= (8'hb8)) : (!wire55)))});
  always
    @(posedge clk) begin
      reg57 <= (wire52 || {{wire52[(2'h2):(1'h1)], $unsigned({wire56})}});
      if ((|{wire52[(2'h2):(2'h2)],
          (wire54 ?
              ((wire52 ? reg57 : wire52) | wire49[(4'h9):(3'h7)]) : reg57)}))
        begin
          reg58 <= $unsigned(wire51[(1'h1):(1'h1)]);
        end
      else
        begin
          reg58 <= (-(~{reg57}));
          reg59 <= wire54;
          reg60 <= {$unsigned($signed($signed((wire55 >> wire53))))};
          if ({(((~^$signed(wire54)) - $unsigned(wire56[(3'h7):(1'h0)])) >> wire56[(4'hc):(3'h7)])})
            begin
              reg61 <= {((|(&$unsigned(reg57))) == (~wire51))};
            end
          else
            begin
              reg61 <= wire51[(1'h1):(1'h0)];
              reg62 <= ((-((reg58 ? (reg60 && wire49) : (~|reg57)) ?
                      $unsigned(wire50) : $unsigned({reg58}))) ?
                  wire56[(4'hd):(4'ha)] : reg58[(3'h7):(2'h3)]);
              reg63 <= (+$signed($unsigned(($signed(wire53) >> $unsigned(wire55)))));
            end
        end
      reg64 <= (~|$unsigned(({(reg59 >>> reg58)} ?
          reg60 : (~|$signed(wire52)))));
    end
endmodule
