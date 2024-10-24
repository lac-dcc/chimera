module top
#(parameter param170 = ((~|(^~(((7'h40) || (8'ha4)) ? ((8'ha8) != (8'h9e)) : (^(8'hbf))))) ? (({((8'h9d) ? (8'ha7) : (8'hbb))} == {((8'ha1) ? (8'hb9) : (8'hb0)), ((8'hab) ? (7'h43) : (8'hbf))}) >> {(~&((8'hab) ? (8'ha9) : (8'haf))), {((7'h40) ? (8'hbc) : (8'hbd)), ((8'hb2) >>> (8'hae))}}) : (~|(^(((8'ha1) ? (7'h40) : (8'h9d)) ? ((8'ha7) - (8'ha4)) : (~&(8'ha1)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(3'h5):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire167;
  assign y = {wire169, wire4, wire101, wire167, (1'h0)};
  assign wire4 = $unsigned(wire3);
  module5 #() modinst102 (.wire7(wire1), .wire6(wire0), .y(wire101), .wire8(wire4), .wire9(wire3), .clk(clk));
  module103 #() modinst168 (wire167, clk, wire101, wire4, wire1, wire0, wire3);
  assign wire169 = (~^(($unsigned(wire4) + {wire3}) * wire101));
endmodule

module module103
#(parameter param166 = ((((((8'hbc) >>> (7'h41)) ? ((8'ha8) & (7'h44)) : (^(7'h42))) ? (((8'hbf) && (8'hab)) ? ((8'hac) ? (8'ha1) : (8'hbc)) : (~&(8'hbb))) : {{(8'hb6)}}) && ((((8'h9d) ? (8'h9c) : (8'h9f)) ? ((8'hbb) ? (8'hbc) : (8'ha9)) : (^(8'hbf))) ? (!((8'haf) <<< (8'ha7))) : (((8'haf) ? (7'h40) : (8'ha2)) ? (~(8'hb8)) : ((8'hb0) ? (8'ha1) : (8'h9f))))) >>> (&{(((8'hb0) ^~ (8'hb4)) ? ((7'h44) ? (8'hb8) : (8'hb2)) : {(8'ha9), (8'hae)}), (8'hbd)})))
(y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire108;
  input wire signed [(5'h13):(1'h0)] wire107;
  input wire signed [(4'hc):(1'h0)] wire106;
  input wire [(5'h12):(1'h0)] wire105;
  input wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire163;
  wire [(5'h12):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  assign y = {wire165, wire163, wire111, wire110, wire109, reg112, (1'h0)};
  assign wire109 = wire104[(2'h2):(1'h1)];
  assign wire110 = $signed((-(~$unsigned($signed(wire109)))));
  assign wire111 = {(8'ha4)};
  always
    @(posedge clk) begin
      reg112 <= $unsigned($unsigned((((~|wire110) ?
              $signed(wire106) : {wire104, wire104}) ?
          ((wire110 ? wire111 : wire108) * $signed(wire111)) : (wire111 ?
              {wire107, wire104} : $unsigned(wire109)))));
    end
  module113 #() modinst164 (wire163, clk, wire105, wire106, wire109, reg112, wire107);
  assign wire165 = reg112[(5'h10):(2'h3)];
endmodule

module module5
#(parameter param99 = ({(~^(~^((8'hbf) ? (8'hba) : (8'ha8))))} ? (((&{(8'ha4), (8'hb5)}) ? {(~|(8'ha9))} : (8'hae)) ? ((~|((7'h40) ? (8'ha5) : (8'hbe))) ^ (((8'h9f) ? (8'ha5) : (8'ha7)) ? ((8'ha3) <<< (7'h43)) : {(8'ha2), (8'hab)})) : ((^(8'hb9)) <<< (((8'hbd) ? (8'ha5) : (7'h42)) ? ((8'ha5) >> (8'h9c)) : {(8'h9f)}))) : ((|(|((8'ha9) < (8'ha1)))) == (~((8'hab) ? ((8'hae) + (8'hbe)) : ((8'ha5) ? (8'hbc) : (8'ha5)))))), 
parameter param100 = (~^(param99 ? (^~((param99 ? param99 : param99) >>> {(8'ha0)})) : (((param99 ? param99 : param99) ~^ (8'haa)) || ((~^param99) ^~ ((8'ha2) ? param99 : param99))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h255):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  assign y = {wire98,
                 wire78,
                 wire41,
                 wire40,
                 wire39,
                 wire26,
                 wire25,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire11,
                 wire10,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 reg81,
                 reg80,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = ({$unsigned((8'ha6)),
                          ($unsigned($signed(wire8)) != $signed((wire9 >= wire6)))} ?
                      (|((!$unsigned(wire6)) ?
                          wire6[(4'h8):(3'h7)] : $unsigned(wire8))) : (wire7 - wire6[(1'h0):(1'h0)]));
  assign wire11 = ($signed($unsigned($unsigned((!wire7)))) ?
                      $unsigned(((~(wire8 ~^ (8'h9c))) ?
                          $signed({wire7,
                              wire10}) : {wire9[(3'h5):(3'h4)]})) : wire6[(4'hb):(4'ha)]);
  always
    @(posedge clk) begin
      reg12 <= (+$signed(wire10[(1'h1):(1'h1)]));
      reg13 <= {(wire8[(1'h1):(1'h1)] ^~ $signed(($signed(wire11) ?
              wire9[(2'h3):(1'h1)] : wire10[(3'h6):(3'h5)]))),
          (wire8[(2'h2):(2'h2)] ?
              ($unsigned((-wire9)) ?
                  wire8[(1'h1):(1'h1)] : ((wire6 ^~ wire11) ?
                      $unsigned(wire9) : wire10[(3'h5):(3'h5)])) : ($unsigned($signed((8'h9d))) ?
                  wire8[(2'h3):(1'h1)] : wire8))};
    end
  assign wire14 = (-reg13);
  assign wire15 = {(wire6 ? (|wire10) : $unsigned(reg13))};
  assign wire16 = $signed((($unsigned((wire6 + wire9)) ?
                      $signed(wire15[(1'h0):(1'h0)]) : reg12[(2'h2):(2'h2)]) >= ((~|(wire10 ?
                          (8'hab) : wire10)) ?
                      ($signed(wire10) && {wire7,
                          reg13}) : {wire7[(1'h1):(1'h1)],
                          (wire6 + (7'h43))})));
  assign wire17 = (7'h40);
  always
    @(posedge clk) begin
      reg18 <= wire6[(1'h0):(1'h0)];
      reg19 <= {((^wire6[(3'h4):(3'h4)]) || $signed((~^reg18[(2'h2):(1'h1)])))};
      reg20 <= $unsigned(wire6[(4'h8):(3'h4)]);
      reg21 <= wire16[(4'ha):(3'h6)];
      reg22 <= ((((8'haf) ?
          $signed(reg18) : $unsigned((8'hb8))) <= wire17) << $signed((~|reg13[(4'h9):(3'h6)])));
    end
  always
    @(posedge clk) begin
      reg23 <= reg20[(2'h2):(1'h1)];
      reg24 <= (((-((wire11 < (8'ha2)) ? (+wire7) : (reg12 ^~ reg21))) ?
              $unsigned($signed((~wire17))) : wire10) ?
          {$unsigned($unsigned($signed(reg12)))} : $unsigned($unsigned((^~(wire16 ?
              (8'haa) : reg23)))));
    end
  assign wire25 = reg19;
  assign wire26 = wire17;
  always
    @(posedge clk) begin
      if (({(|(~&wire26[(4'h8):(3'h5)])), $unsigned(wire8)} ?
          $unsigned($signed(wire16[(3'h7):(3'h7)])) : {reg12}))
        begin
          if (reg21)
            begin
              reg27 <= (wire14 - (reg19[(4'hb):(3'h5)] || reg18[(1'h1):(1'h1)]));
              reg28 <= wire14;
              reg29 <= (($signed($unsigned($signed(wire14))) <= ($unsigned(reg20) & (&(wire6 ?
                  wire26 : (8'h9f))))) >= $unsigned({((~^(8'hbb)) && wire25)}));
            end
          else
            begin
              reg27 <= ($signed((((wire9 ?
                  reg23 : wire15) <= (wire26 ^ (8'hbe))) < {((8'ha5) >= (8'hac)),
                  (wire25 ?
                      wire15 : (8'hb4))})) << ($signed(reg13) - $unsigned($unsigned((wire11 && reg20)))));
              reg28 <= (8'hbc);
              reg29 <= $signed($signed({wire10[(2'h2):(1'h1)],
                  $signed((reg21 ? reg13 : (8'ha8)))}));
              reg30 <= $unsigned($unsigned($unsigned(wire14[(1'h0):(1'h0)])));
            end
          if ((+$signed($signed(wire14))))
            begin
              reg31 <= {{$signed((8'ha4)),
                      ($signed((wire6 ?
                          (8'hb7) : (8'hbf))) || (~&(reg20 << wire7)))}};
            end
          else
            begin
              reg31 <= reg24[(4'h8):(2'h2)];
            end
          reg32 <= (8'had);
        end
      else
        begin
          reg27 <= reg27[(2'h2):(2'h2)];
          if (reg27[(1'h0):(1'h0)])
            begin
              reg28 <= wire6;
              reg29 <= reg27[(1'h1):(1'h1)];
            end
          else
            begin
              reg28 <= $signed(wire14[(3'h7):(1'h0)]);
            end
          reg30 <= (|($signed((!(reg32 < reg20))) ?
              (8'hbc) : $signed(wire25[(4'h9):(3'h4)])));
          reg31 <= {(^$unsigned((wire14[(4'h8):(1'h1)] <= ((8'hb0) | reg13)))),
              $signed((^(8'hbe)))};
          reg32 <= wire15;
        end
      reg33 <= wire10[(3'h4):(2'h3)];
      reg34 <= wire9;
    end
  always
    @(posedge clk) begin
      reg35 <= reg13;
      reg36 <= wire7[(2'h2):(1'h0)];
      reg37 <= $signed((wire17 ?
          reg18 : (((&wire10) - wire6) ? wire14 : wire10)));
      reg38 <= ({$unsigned((wire14[(2'h3):(2'h2)] ?
                  (^~reg34) : $unsigned(wire14))),
              (($signed(wire14) ?
                      (reg18 ? wire26 : wire16) : $unsigned(wire14)) ?
                  reg29 : ((~^(8'ha4)) ? $signed(reg22) : $signed(reg19)))} ?
          (reg18[(2'h2):(2'h2)] ?
              {wire8, reg24[(4'ha):(4'h9)]} : reg21) : reg28);
    end
  assign wire39 = $signed((~$signed((reg28 + $unsigned((8'hb8))))));
  assign wire40 = $unsigned(((((reg29 ?
                      reg30 : reg21) >= wire6[(2'h3):(1'h1)]) && ((~&wire6) == {reg19})) << $signed({wire17,
                      {wire16}})));
  assign wire41 = {((8'ha8) ?
                          {reg37,
                              $signed($signed(reg29))} : reg36[(1'h0):(1'h0)])};
  module42 #() modinst79 (wire78, clk, reg29, reg33, wire25, wire17);
  always
    @(posedge clk) begin
      reg80 <= wire40[(4'ha):(4'h9)];
      reg81 <= reg21[(4'hb):(2'h3)];
      reg82 <= $signed($unsigned($signed((wire17 || {wire16, reg19}))));
      if (wire9[(3'h5):(2'h2)])
        begin
          reg83 <= (((wire78[(1'h1):(1'h0)] > ($unsigned(wire26) ?
              $unsigned(reg37) : $signed(wire7))) >> $signed(reg20)) ^ (-$unsigned(({wire26} <<< $unsigned(wire41)))));
          if ((^reg19))
            begin
              reg84 <= $unsigned($signed(wire15[(2'h3):(2'h3)]));
              reg85 <= $signed($unsigned((((reg21 ?
                  reg28 : (8'hb6)) <<< $unsigned((8'ha5))) <<< (((8'had) | reg20) <= (+reg33)))));
            end
          else
            begin
              reg84 <= (-({$signed($signed(reg35))} ?
                  (-(~^(~^reg21))) : {($signed(reg33) >= $unsigned((8'hbc))),
                      wire10[(3'h5):(3'h4)]}));
              reg85 <= $unsigned(wire14);
              reg86 <= (wire11[(1'h0):(1'h0)] ?
                  (^(reg23 ? wire15 : wire39[(1'h0):(1'h0)])) : $signed(reg81));
            end
        end
      else
        begin
          if ((-((^~((~&reg23) ^ reg37[(3'h5):(3'h5)])) ?
              $signed(((reg31 ? reg84 : reg34) ?
                  wire15 : $unsigned(reg85))) : ($unsigned((wire15 ?
                  wire16 : (8'hb6))) || $signed($unsigned(wire7))))))
            begin
              reg83 <= (((&wire15[(4'hb):(3'h7)]) ?
                  ($signed(wire41[(1'h1):(1'h0)]) ?
                      $unsigned((!reg80)) : {(reg85 >> reg29)}) : $unsigned(reg12[(3'h4):(1'h0)])) >>> reg13);
              reg84 <= {reg27, {reg32[(1'h1):(1'h0)]}};
              reg85 <= $signed((wire10 < $unsigned((+{wire6, wire14}))));
              reg86 <= reg33[(4'he):(1'h0)];
              reg87 <= reg18[(1'h0):(1'h0)];
            end
          else
            begin
              reg83 <= {$signed((wire7 * wire15[(1'h0):(1'h0)]))};
              reg84 <= (!((reg38 == $signed(wire26)) ? reg23 : reg80));
              reg85 <= {wire9[(4'hc):(4'ha)],
                  ($unsigned(((8'ha4) - wire6[(3'h4):(1'h0)])) * (8'hbf))};
            end
          reg88 <= (reg38[(4'hd):(3'h4)] <= ({$signed($unsigned(reg31))} ?
              wire16 : ((^~wire78[(1'h1):(1'h1)]) ?
                  wire14[(2'h3):(1'h0)] : reg18[(2'h2):(2'h2)])));
          if (wire9)
            begin
              reg89 <= $signed($signed($unsigned(($unsigned(reg33) ?
                  ((7'h42) || reg20) : (~&(8'hab))))));
              reg90 <= $unsigned(reg83[(4'hd):(4'hc)]);
              reg91 <= $unsigned(reg37[(3'h5):(2'h3)]);
              reg92 <= (&reg19[(1'h1):(1'h0)]);
              reg93 <= reg81;
            end
          else
            begin
              reg89 <= (|(reg85 << ($unsigned((wire78 || reg12)) ?
                  (8'ha5) : $unsigned(reg38))));
              reg90 <= reg18;
            end
          if (reg28)
            begin
              reg94 <= $unsigned($unsigned($signed(wire6)));
            end
          else
            begin
              reg94 <= ((($signed((reg90 ?
                          reg35 : (8'h9f))) <<< ($signed(wire41) > {wire39})) ?
                      (8'hac) : reg88) ?
                  reg93[(3'h7):(3'h6)] : $signed((&reg18[(1'h0):(1'h0)])));
              reg95 <= $signed($signed(({(wire14 ?
                      reg37 : reg36)} ^ reg91[(3'h4):(1'h1)])));
              reg96 <= ($signed((7'h42)) && (|{reg35[(4'h9):(4'h9)],
                  $signed(((8'hb8) ? wire16 : (8'hae)))}));
              reg97 <= ((wire78 < reg92) ?
                  ($signed(reg34[(3'h7):(3'h7)]) != $signed((~&(wire9 ?
                      reg29 : wire40)))) : ((wire11[(2'h2):(2'h2)] <<< ($signed(wire41) ?
                          (wire39 || reg89) : (reg88 ^~ (8'h9c)))) ?
                      $signed($unsigned(reg28[(4'hc):(1'h0)])) : {reg84,
                          (wire15 ?
                              wire39[(4'h8):(3'h4)] : (reg87 >> (8'h9f)))}));
            end
        end
    end
  assign wire98 = wire7;
endmodule

module module42  (y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire46;
  input wire signed [(4'h8):(1'h0)] wire45;
  input wire [(3'h4):(1'h0)] wire44;
  input wire [(5'h12):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire47;
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire47,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire47 = (wire46 ?
                      $signed((({wire45, wire45} ^ wire44) ?
                          $unsigned($unsigned(wire43)) : $signed((wire46 ~^ wire46)))) : ((^wire45[(4'h8):(4'h8)]) ?
                          {$signed({(8'hb4), wire45}),
                              $signed($signed(wire45))} : $signed(wire43)));
  always
    @(posedge clk) begin
      if (wire45[(2'h2):(1'h1)])
        begin
          if (wire45[(2'h2):(1'h1)])
            begin
              reg48 <= ($signed(wire46) ?
                  $signed((^~wire44)) : $unsigned(((|$signed(wire47)) | {$unsigned(wire46),
                      $signed(wire47)})));
              reg49 <= ((reg48 ?
                  (wire46 ?
                      ($unsigned(reg48) ?
                          wire43[(4'h9):(2'h3)] : (wire44 ?
                              reg48 : wire45)) : (wire44[(2'h3):(2'h3)] ?
                          (~wire44) : $signed(wire44))) : wire46[(2'h3):(1'h1)]) <<< $signed(wire43));
              reg50 <= wire44[(3'h4):(3'h4)];
              reg51 <= (8'ha7);
            end
          else
            begin
              reg48 <= ((~$signed(wire46[(1'h0):(1'h0)])) * (reg51 ?
                  $signed($unsigned((~|wire45))) : reg51[(1'h0):(1'h0)]));
              reg49 <= reg51;
              reg50 <= $unsigned((~{(~|{reg50}), (^~$signed(reg49))}));
              reg51 <= ($unsigned(wire43[(4'hf):(4'hf)]) ?
                  reg49 : (((~|$signed(reg50)) ?
                          ($signed(reg48) ?
                              wire46[(1'h0):(1'h0)] : {wire46,
                                  wire46}) : ((~|reg49) ?
                              (reg48 * wire43) : (wire47 >>> (8'hb5)))) ?
                      $unsigned($signed((reg51 << reg49))) : $unsigned($signed($unsigned(reg50)))));
              reg52 <= ((8'hae) + reg50[(4'he):(3'h5)]);
            end
          reg53 <= ((~^{wire45[(3'h4):(2'h2)]}) ?
              $unsigned((~$unsigned({wire45,
                  (8'hb5)}))) : $signed(wire43[(1'h1):(1'h0)]));
        end
      else
        begin
          reg48 <= $signed({((~|$unsigned(reg53)) == wire43[(1'h1):(1'h1)])});
          reg49 <= ($unsigned((8'hb7)) ?
              (wire45[(4'h8):(3'h5)] > ((reg53[(3'h5):(2'h2)] ?
                      {reg51} : reg51[(4'hc):(4'hc)]) ?
                  $signed((wire46 ? wire44 : reg50)) : $unsigned((reg51 ?
                      wire43 : reg52)))) : reg53[(1'h0):(1'h0)]);
        end
    end
  assign wire54 = (^$signed(((^reg49) ?
                      ((~|reg51) ?
                          (^~wire47) : (wire47 ?
                              reg49 : wire44)) : ($signed(reg48) | (^~reg48)))));
  assign wire55 = wire54;
  always
    @(posedge clk) begin
      reg56 <= (((-((reg48 | wire44) == wire46[(3'h5):(2'h2)])) ?
              ((!wire45) ?
                  reg53[(1'h1):(1'h0)] : wire44[(2'h3):(1'h1)]) : reg50) ?
          (^~($unsigned((8'hac)) ? reg51 : reg48)) : reg50[(4'h8):(3'h7)]);
      reg57 <= wire44[(2'h3):(2'h2)];
      reg58 <= $signed(((+((reg53 ? wire55 : wire44) * (reg52 ?
              (8'hb6) : reg52))) ?
          reg57[(2'h3):(2'h3)] : (~^(wire45[(3'h7):(2'h3)] ?
              (wire55 ? reg48 : wire44) : $signed(wire46)))));
      reg59 <= reg50;
    end
  always
    @(posedge clk) begin
      reg60 <= $unsigned(reg58);
      reg61 <= ($signed(reg56[(2'h2):(1'h0)]) - (($signed((&(8'hbc))) ?
              {(-(8'hab))} : $unsigned((&wire44))) ?
          (((reg57 >= (7'h44)) ? (reg59 ? (8'had) : wire54) : wire54) ?
              reg56[(2'h3):(1'h0)] : ($signed(wire54) << $unsigned(reg60))) : wire54));
      if (reg51)
        begin
          if ((($signed({wire55[(4'hf):(4'h9)], (reg60 ? reg56 : wire55)}) ?
              $unsigned({reg50[(4'hb):(1'h1)]}) : reg57[(1'h0):(1'h0)]) != ({reg59[(4'hb):(3'h5)]} & reg58[(4'hf):(1'h0)])))
            begin
              reg62 <= ($unsigned({wire47}) ?
                  reg50 : $unsigned(reg53[(4'h8):(1'h1)]));
              reg63 <= (-($unsigned((~^reg60[(1'h0):(1'h0)])) || (^~$signed(reg49[(4'he):(3'h6)]))));
            end
          else
            begin
              reg62 <= reg50[(4'ha):(4'ha)];
            end
          reg64 <= wire46[(2'h2):(1'h1)];
          reg65 <= (^{((+reg60) ^ ((wire54 + wire43) ?
                  $unsigned((8'hbc)) : {wire45, reg49}))});
          if (reg53[(2'h3):(2'h3)])
            begin
              reg66 <= wire43[(1'h0):(1'h0)];
              reg67 <= ((~&$signed($unsigned((~reg60)))) ?
                  (reg60 ~^ (-reg52)) : ((-reg66[(3'h5):(1'h1)]) ?
                      $unsigned($signed({reg64, (8'haf)})) : reg65));
              reg68 <= (reg65 >= reg59);
              reg69 <= $unsigned((wire54 ~^ ($unsigned(((8'ha8) * wire54)) & reg59)));
              reg70 <= $signed(({{(wire45 ? (8'hb3) : reg67)},
                      (reg66 && (reg57 <<< reg52))} ?
                  $signed(($signed(reg69) ^ {reg65,
                      (8'hb2)})) : ($unsigned(reg66) >> $signed($signed((8'ha2))))));
            end
          else
            begin
              reg66 <= reg57;
              reg67 <= $signed((((^~(~(8'ha4))) <= $unsigned($unsigned(reg65))) == (((|(8'hbc)) ?
                      $signed((8'hac)) : (~&(8'hb5))) ?
                  reg58 : ({wire43} || reg68[(4'h9):(3'h7)]))));
              reg68 <= $unsigned($signed({$signed(reg58[(5'h11):(4'h9)]),
                  $unsigned((-reg68))}));
              reg69 <= reg59[(4'hf):(1'h0)];
              reg70 <= ($unsigned($signed(reg56[(2'h2):(1'h1)])) ?
                  {reg50[(3'h5):(1'h1)]} : ((($signed(reg70) ?
                          (wire54 && reg66) : (reg61 <= reg60)) ^ $unsigned((reg48 ?
                          (8'hb2) : reg69))) ?
                      wire44 : {(&((8'hab) ? wire47 : reg63))}));
            end
        end
      else
        begin
          reg62 <= $signed((^~($unsigned((~^reg48)) ?
              wire54[(1'h0):(1'h0)] : (reg69 | $unsigned(reg69)))));
          reg63 <= $unsigned((|reg70));
          reg64 <= wire43[(3'h7):(3'h7)];
          if (reg63)
            begin
              reg65 <= $unsigned(reg63);
              reg66 <= reg61;
              reg67 <= (~^($signed(reg57[(2'h2):(1'h1)]) ?
                  (($unsigned(wire47) << $unsigned(reg62)) ?
                      reg59 : ((wire45 ? wire44 : wire44) ?
                          (reg57 >= reg58) : (reg59 == wire43))) : $unsigned($signed((reg67 ?
                      reg66 : reg62)))));
              reg68 <= $unsigned((8'hae));
              reg69 <= $unsigned({(^reg50)});
            end
          else
            begin
              reg65 <= $unsigned((((^((8'hb8) == reg53)) ?
                  $signed($unsigned(reg58)) : ({(8'hb1),
                      reg63} | $signed(reg52))) || reg50[(4'ha):(3'h7)]));
              reg66 <= $signed((wire54 ?
                  ($signed(((8'ha6) ? reg65 : reg56)) << {{reg63, reg50},
                      $signed(reg52)}) : $unsigned(reg64)));
            end
        end
    end
  always
    @(posedge clk) begin
      reg71 <= {(reg64 ?
              $unsigned($signed({wire46})) : $signed((|(wire43 << (8'ha8))))),
          {(((reg57 ?
                  (8'h9f) : reg63) >>> $unsigned((8'ha1))) ~^ $unsigned(reg59)),
              (~|{(reg63 ^~ reg51), (-reg63)})}};
      reg72 <= (-(!(($signed(reg51) ? (reg71 <= (7'h40)) : (^wire47)) | ({reg51,
              (8'hb1)} ?
          (+reg53) : reg52))));
      reg73 <= (((+$signed((8'ha8))) != ($signed({wire43,
              wire46}) - (~^reg62[(4'h8):(3'h7)]))) ?
          reg52[(4'hb):(4'ha)] : ($signed(wire45) >= (~&((reg69 - wire43) ?
              (reg66 ~^ (7'h43)) : (~^reg63)))));
      if (reg61[(4'hd):(4'hd)])
        begin
          reg74 <= (({{(7'h40), $signed(wire43)}} ?
              reg70 : wire44) || ((reg48[(1'h1):(1'h0)] ^~ (^~((8'hba) ^~ reg64))) ?
              wire54[(4'h8):(3'h7)] : (~|{$signed(wire55), $signed(wire44)})));
          reg75 <= ((~^$signed({{reg70, reg70}})) ?
              ((((&wire55) ? reg56 : (&(8'h9f))) > (8'hbc)) ?
                  (wire46 ?
                      reg60 : ({reg72,
                          reg60} == wire44)) : $unsigned($unsigned(reg57))) : ($unsigned((!(+reg68))) >> (~&((reg48 ?
                      reg71 : wire43) ?
                  $signed(wire54) : (reg74 > (7'h41))))));
        end
      else
        begin
          if (reg59[(5'h10):(4'he)])
            begin
              reg74 <= ($signed((((&reg67) ? reg50 : $signed(reg68)) ?
                  $unsigned($unsigned(reg61)) : wire44)) ^ ((!(-(reg66 ~^ reg51))) != ($signed($unsigned(reg68)) ?
                  reg50 : $signed($unsigned(reg48)))));
            end
          else
            begin
              reg74 <= reg67;
            end
          reg75 <= $unsigned($signed({((reg70 ?
                  reg62 : reg75) & (wire46 >= (8'ha1)))}));
          reg76 <= (reg62 ? $unsigned(reg73) : wire55);
          reg77 <= $unsigned({reg59,
              ($unsigned((reg63 ? reg74 : reg66)) >>> wire55)});
        end
    end
endmodule

module module113
#(parameter param162 = {({((^(8'hae)) < ((8'h9d) & (8'had))), (~((8'h9f) ? (8'hbb) : (8'hb4)))} >> {({(8'hb7), (8'hb2)} ? ((8'haa) ? (7'h44) : (8'ha4)) : ((8'hb4) ? (8'ha3) : (7'h42)))}), ((~((|(8'ha8)) * ((7'h40) < (8'ha8)))) != (({(7'h44)} <= ((8'hba) + (8'h9d))) <= (((8'hba) && (8'hbf)) ? ((8'hbe) ? (8'had) : (8'hb3)) : {(8'h9f)})))})
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire118;
  input wire signed [(4'hc):(1'h0)] wire117;
  input wire [(4'hc):(1'h0)] wire116;
  input wire signed [(3'h5):(1'h0)] wire115;
  input wire signed [(4'h8):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire146;
  wire signed [(3'h6):(1'h0)] wire145;
  wire signed [(3'h5):(1'h0)] wire144;
  wire [(3'h7):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire128;
  wire [(4'ha):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire119;
  reg [(4'hd):(1'h0)] reg161 = (1'h0);
  reg [(3'h5):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg signed [(4'he):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(4'hf):(1'h0)] reg156 = (1'h0);
  reg [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire128,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire119 = ($unsigned({wire118[(4'h8):(2'h2)],
                       wire115}) <= $signed($unsigned(((wire115 << wire116) >> (wire115 > wire116)))));
  assign wire120 = (|((~|$unsigned($unsigned(wire115))) ~^ (~&wire115[(3'h4):(1'h0)])));
  assign wire121 = ((wire114[(2'h2):(2'h2)] >>> ($signed(wire120) || ($signed((8'h9d)) & wire117[(4'ha):(3'h5)]))) ?
                       ($unsigned(($unsigned(wire118) ?
                               (wire116 ?
                                   wire115 : wire114) : $unsigned(wire120))) ?
                           (!{wire120[(2'h2):(1'h0)],
                               (wire120 ? wire114 : wire115)}) : (((!(8'hb3)) ?
                               wire114[(4'h8):(2'h2)] : (wire117 ?
                                   wire117 : wire116)) <<< (^~$unsigned(wire120)))) : $unsigned((&(+(-(8'h9f))))));
  assign wire122 = {wire115[(1'h1):(1'h0)]};
  always
    @(posedge clk) begin
      reg123 <= $unsigned(((+(+(~^wire114))) ?
          {((wire116 << wire120) ? (wire118 ^~ wire118) : $signed(wire120)),
              $signed($signed((8'hab)))} : $signed($signed((wire120 ~^ wire115)))));
      reg124 <= $unsigned((~|wire114[(2'h2):(2'h2)]));
      reg125 <= {($unsigned({(~(8'ha9))}) & $unsigned((!$signed(wire122))))};
      reg126 <= {(reg125 < reg125[(1'h1):(1'h0)])};
      reg127 <= ($unsigned((-$signed(wire122[(4'h8):(2'h3)]))) << wire119[(4'hd):(1'h0)]);
    end
  assign wire128 = wire122[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if ((($unsigned((7'h40)) * reg123[(2'h3):(2'h3)]) > (reg123[(3'h4):(1'h1)] == $signed((-(wire121 ?
          wire117 : reg126))))))
        begin
          reg129 <= reg124[(3'h7):(1'h1)];
        end
      else
        begin
          if (wire115[(3'h4):(3'h4)])
            begin
              reg129 <= $signed((8'hbd));
            end
          else
            begin
              reg129 <= wire118;
              reg130 <= (((((!reg125) ~^ (wire115 ? reg124 : wire118)) ?
                      $unsigned((wire117 ?
                          wire117 : wire128)) : $signed($signed(reg127))) ?
                  $signed(((reg123 ? wire114 : wire122) ?
                      (wire118 ?
                          wire117 : wire116) : reg123)) : ($unsigned((-wire120)) < (~|reg127[(3'h5):(2'h3)]))) ^ (($unsigned((wire118 >= reg124)) && (reg124[(5'h13):(4'hf)] ?
                      (wire117 && wire122) : (wire121 + wire120))) ?
                  (wire120[(3'h5):(2'h3)] ^~ (8'had)) : $signed((~|$unsigned((8'hb1))))));
              reg131 <= (&(wire122[(4'h9):(4'h8)] ? reg129 : (8'hbb)));
              reg132 <= wire121;
              reg133 <= $unsigned(reg126[(1'h1):(1'h1)]);
            end
          reg134 <= reg133;
        end
      reg135 <= wire118[(5'h11):(3'h7)];
      if ($signed($signed((wire115[(1'h0):(1'h0)] ?
          reg133[(4'hb):(1'h0)] : wire116))))
        begin
          reg136 <= {(reg125 ? (^reg135) : $signed(reg130))};
          reg137 <= (((reg130[(1'h0):(1'h0)] <= $signed(((8'ha6) == reg125))) ?
                  {{(wire128 <= wire119),
                          (reg124 ?
                              reg125 : wire117)}} : (|(~|(reg134 ^ reg133)))) ?
              ($unsigned(wire118[(4'hf):(4'hf)]) ^~ (8'ha2)) : {wire120,
                  {((wire117 ? reg129 : reg132) >> $signed((8'ha6))),
                      $unsigned(reg126)}});
          reg138 <= (~wire114);
        end
      else
        begin
          if (reg125[(1'h0):(1'h0)])
            begin
              reg136 <= $signed(wire115);
              reg137 <= $unsigned(reg134);
              reg138 <= wire121[(1'h1):(1'h1)];
              reg139 <= $signed(wire122);
              reg140 <= $signed($signed((reg139[(4'h8):(3'h5)] >>> (reg123 <= $unsigned((8'haf))))));
            end
          else
            begin
              reg136 <= ((wire116[(1'h0):(1'h0)] ?
                  reg135 : (8'hb6)) ^~ $unsigned(((+(reg126 ?
                      reg139 : reg138)) ?
                  ($signed(reg140) ^~ (+reg137)) : reg139[(3'h7):(1'h1)])));
              reg137 <= $signed(reg127);
            end
        end
      reg141 <= reg134;
      reg142 <= (~(((~(8'ha4)) && wire121) ^~ ($unsigned((wire120 ?
              wire128 : reg125)) ?
          ($unsigned(reg132) >= (reg138 > reg137)) : (|(wire122 ^~ wire116)))));
    end
  assign wire143 = wire115;
  assign wire144 = $signed($signed((~^($unsigned((8'ha0)) ?
                       {wire143, reg141} : (reg126 ? (8'had) : wire121)))));
  assign wire145 = reg136[(3'h4):(2'h2)];
  assign wire146 = $signed((~&$signed((~|reg132))));
  always
    @(posedge clk) begin
      reg147 <= reg131;
      if ({$unsigned(wire128[(2'h2):(2'h2)]), reg142})
        begin
          if ($signed(wire145))
            begin
              reg148 <= reg132[(2'h2):(2'h2)];
              reg149 <= $unsigned((reg136 ?
                  wire146 : $signed(wire118[(5'h10):(4'hc)])));
              reg150 <= ({((|((8'hba) ? reg132 : wire115)) ?
                      ((+wire128) ?
                          wire122 : (reg136 << (8'hbf))) : (~&(^(8'ha6)))),
                  $unsigned((8'hb7))} | (wire117 ^ reg142[(3'h5):(1'h1)]));
            end
          else
            begin
              reg148 <= (^wire114);
              reg149 <= $unsigned(wire144[(2'h2):(2'h2)]);
              reg150 <= (($unsigned((|$signed(reg138))) && (~$signed(reg123))) ^ $signed(($signed($signed(reg148)) ~^ $signed((reg123 != reg126)))));
              reg151 <= ((~|(+({reg150, reg136} ^~ reg124))) ?
                  wire114[(3'h4):(2'h3)] : $unsigned({(8'ha0)}));
            end
          if (((($signed(((8'ha5) | wire146)) - {reg148[(1'h0):(1'h0)]}) || $unsigned((reg124 != {wire119}))) ~^ ($unsigned({(7'h43)}) ?
              (reg151[(2'h3):(2'h2)] ?
                  reg142[(2'h3):(1'h0)] : $signed((~|reg127))) : ({(reg133 ?
                      reg148 : reg149)} ~^ ($unsigned(reg123) ?
                  (wire118 ? wire118 : wire121) : (wire143 != reg142))))))
            begin
              reg152 <= ($signed($signed(reg125)) ?
                  $signed($unsigned(((wire115 ?
                      reg127 : wire117) > reg138[(2'h3):(1'h1)]))) : (+$unsigned($signed(reg149))));
              reg153 <= $signed((reg150[(2'h2):(1'h0)] > wire145));
              reg154 <= (+($signed((8'ha0)) <= $signed($unsigned((^~reg140)))));
              reg155 <= $unsigned(reg133);
            end
          else
            begin
              reg152 <= (~|(^~reg129[(5'h10):(4'hb)]));
            end
        end
      else
        begin
          if (($unsigned($unsigned(reg137)) ?
              reg155[(3'h4):(1'h1)] : ({(|((8'ha2) == wire146)),
                  $unsigned($signed((8'ha5)))} || wire128)))
            begin
              reg148 <= (($unsigned(((wire116 ^~ reg148) || reg134[(1'h0):(1'h0)])) ?
                  (($signed((8'had)) ? {reg133} : (wire121 >>> (8'hbd))) ?
                      $signed(wire145) : $signed(reg152[(3'h4):(3'h4)])) : ($unsigned((~|(8'ha8))) ?
                      ({reg137, wire119} ? {reg153} : (~reg147)) : {(reg138 ?
                              (8'hbe) : wire116)})) >= (8'h9c));
              reg149 <= $signed(((^~(reg127[(2'h2):(2'h2)] && (reg132 ?
                  reg130 : reg134))) == reg149[(1'h0):(1'h0)]));
              reg150 <= (8'hbb);
              reg151 <= {$signed($unsigned(reg154[(2'h2):(1'h1)])),
                  reg147[(1'h0):(1'h0)]};
            end
          else
            begin
              reg148 <= $signed($unsigned((~|reg127[(3'h5):(1'h0)])));
              reg149 <= (!$signed(($signed($signed((8'hbc))) ?
                  wire120[(3'h5):(2'h2)] : {reg150[(1'h1):(1'h0)],
                      $signed(reg140)})));
              reg150 <= wire144;
              reg151 <= ($unsigned($unsigned(((reg140 ? (8'hb8) : wire115) ?
                      $unsigned(reg136) : wire114))) ?
                  $signed((8'haf)) : $unsigned(reg141[(2'h3):(2'h2)]));
              reg152 <= {reg133[(3'h4):(3'h4)]};
            end
          reg153 <= $signed(((~(wire114 <<< (reg129 != wire116))) >>> (wire122 ?
              $signed($unsigned(reg123)) : reg152[(4'h8):(3'h4)])));
          reg154 <= reg133;
        end
    end
  always
    @(posedge clk) begin
      reg156 <= $signed((wire143 ?
          ($signed((wire114 <= (8'hb0))) ?
              wire114[(2'h3):(1'h1)] : $signed(reg130)) : wire122));
      reg157 <= ((~&((~|(~reg125)) ? (~|(wire119 >>> (8'hbd))) : reg138)) ?
          reg133[(3'h4):(2'h2)] : (~^$signed(((reg127 ? reg125 : reg149) ?
              $signed(reg123) : $unsigned((7'h40))))));
      reg158 <= $signed($unsigned(((reg148 ?
          (wire118 <<< wire117) : (~^reg138)) << (wire119 ?
          $unsigned(reg130) : wire120[(3'h4):(1'h0)]))));
      reg159 <= ((+$unsigned(reg126)) | reg132[(2'h2):(1'h1)]);
      if ($signed(wire145[(1'h0):(1'h0)]))
        begin
          reg160 <= ((!((|(~|reg158)) ^ (8'h9d))) ?
              reg157 : $signed(wire145[(1'h0):(1'h0)]));
          reg161 <= (^~(reg151 * ({wire143} ?
              (~$signed(reg136)) : $signed($unsigned(reg141)))));
        end
      else
        begin
          reg160 <= reg130;
          reg161 <= ($signed($unsigned((reg142[(2'h3):(1'h1)] && reg149[(3'h4):(2'h3)]))) >> (!reg152));
        end
    end
endmodule
