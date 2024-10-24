module top
#(parameter param127 = ((^{(((8'h9d) <= (8'ha2)) || (!(7'h44)))}) ? (^~((+(+(8'ha8))) ? (+(~|(8'ha8))) : (8'hbc))) : (((((7'h41) ? (8'ha1) : (8'hb3)) >> ((8'h9c) | (8'h9d))) < (^~((8'h9d) ? (8'hbd) : (8'hb6)))) * {{(~^(8'h9e)), (^(8'ha6))}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire126;
  wire signed [(5'h11):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'he):(1'h0)] reg114 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire113,
                 wire111,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire4 = (wire0[(4'hc):(1'h0)] + $signed(($signed((~|(7'h40))) ?
                     wire3[(3'h5):(1'h0)] : $signed($unsigned(wire3)))));
  assign wire5 = $unsigned($signed({wire0[(3'h4):(2'h2)]}));
  assign wire6 = wire4;
  assign wire7 = $signed((8'hbd));
  assign wire8 = $signed(({(^{wire4, (8'ha4)}), (^wire7[(1'h1):(1'h1)])} ?
                     (~(wire0 <= (|wire1))) : (8'hb2)));
  module9 #() modinst112 (.wire13(wire8), .wire12(wire1), .clk(clk), .wire11(wire2), .wire10(wire7), .y(wire111));
  assign wire113 = wire2;
  always
    @(posedge clk) begin
      if ($unsigned(wire2))
        begin
          reg114 <= wire111[(4'hd):(4'hd)];
          reg115 <= ($signed($signed((wire6[(1'h1):(1'h0)] ?
              ((8'ha9) ?
                  wire1 : wire8) : $unsigned(wire7)))) + ({wire3[(1'h1):(1'h1)],
              wire6[(3'h7):(3'h4)]} << wire3));
          reg116 <= $signed(((^({(8'hb1)} ?
              {wire0, (8'hb7)} : (!wire111))) <= (+wire8)));
        end
      else
        begin
          reg114 <= ((~&reg115[(2'h3):(2'h2)]) ?
              wire3[(3'h4):(1'h0)] : $signed(wire3[(1'h0):(1'h0)]));
          if ($unsigned($unsigned((wire111 ?
              $signed((wire3 < (8'ha9))) : reg115))))
            begin
              reg115 <= wire0[(4'he):(3'h6)];
              reg116 <= wire8;
              reg117 <= (!($unsigned(reg115[(1'h0):(1'h0)]) >= {({reg116,
                      wire5} | $unsigned(wire1))}));
            end
          else
            begin
              reg115 <= $unsigned((wire7 ?
                  (reg117 && $signed(wire4[(5'h10):(4'ha)])) : wire7[(3'h6):(1'h0)]));
            end
        end
      reg118 <= reg116;
      if ($signed($unsigned(reg114)))
        begin
          reg119 <= {(~&$signed((wire4 ? wire7 : $signed(wire4))))};
          reg120 <= wire2;
          reg121 <= (~{(~|$signed((wire8 ? (8'hbc) : reg118)))});
          reg122 <= reg117[(1'h0):(1'h0)];
        end
      else
        begin
          if ((($unsigned(wire6[(2'h2):(1'h0)]) ?
              wire6[(3'h4):(2'h2)] : ((8'h9e) + {{wire111, reg122}})) || wire4))
            begin
              reg119 <= $signed(reg122);
              reg120 <= reg117;
              reg121 <= $unsigned($signed({(wire1 && {wire113})}));
            end
          else
            begin
              reg119 <= $unsigned(reg121);
            end
          reg122 <= reg121;
          reg123 <= (&$signed(wire111));
          reg124 <= $signed(reg117[(2'h2):(1'h0)]);
        end
    end
  assign wire125 = {(reg123[(3'h5):(2'h2)] < reg121[(3'h7):(2'h2)]),
                       (wire0 ?
                           (^($unsigned(reg123) ?
                               reg120 : {reg117})) : (~^((wire4 <<< wire5) ?
                               {reg117} : reg123[(3'h4):(1'h1)])))};
  assign wire126 = (!((wire2[(4'hc):(4'hb)] ? reg122 : {((8'hb3) + reg121)}) ?
                       $signed($signed((reg116 >>> wire0))) : $unsigned((~$signed(wire1)))));
endmodule

module module9
#(parameter param109 = (~^({(7'h42)} & (({(8'ha6), (8'had)} ? ((8'hb8) ? (7'h40) : (8'hbf)) : ((7'h40) ? (8'hb6) : (8'ha1))) ? (^~((7'h40) ? (8'hb2) : (8'had))) : (~&((8'ha2) >> (8'hae)))))), 
parameter param110 = (^(param109 >>> param109)))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire12;
  input wire [(3'h7):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire108;
  wire signed [(4'hd):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire85;
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire14,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire54,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire61,
                 wire85,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg60,
                 (1'h0)};
  assign wire14 = (wire10 >>> {{$unsigned({wire12, wire10})},
                      (|$unsigned((!(8'hb3))))});
  always
    @(posedge clk) begin
      reg15 <= $unsigned((wire13[(3'h6):(3'h6)] == ((wire11 ?
              ((8'hac) ? wire10 : (8'hac)) : {wire10}) ?
          $unsigned(((8'ha6) ? wire12 : wire11)) : wire13[(2'h2):(1'h0)])));
      if ($unsigned(wire10))
        begin
          reg16 <= $signed(wire14);
        end
      else
        begin
          reg16 <= (wire12[(3'h4):(2'h3)] ~^ $signed({wire13[(3'h7):(3'h4)],
              ((reg15 & wire10) ? (7'h44) : wire10[(1'h0):(1'h0)])}));
          if ($unsigned((~wire10)))
            begin
              reg17 <= (~&{(~&$unsigned(((8'hb4) ? wire10 : (8'hae)))),
                  (~|wire10[(3'h5):(2'h3)])});
              reg18 <= $signed((|((8'h9e) - wire14[(3'h6):(3'h5)])));
              reg19 <= wire10;
              reg20 <= (!reg15[(4'h8):(2'h2)]);
              reg21 <= ((|reg16[(1'h0):(1'h0)]) >>> $signed(reg20));
            end
          else
            begin
              reg17 <= $signed($signed($unsigned(reg17)));
              reg18 <= wire11[(5'h10):(4'h8)];
              reg19 <= wire11[(3'h5):(3'h4)];
              reg20 <= reg19;
            end
          reg22 <= $unsigned($unsigned($signed((&$signed(reg20)))));
        end
    end
  assign wire23 = $unsigned(reg19[(2'h3):(1'h0)]);
  assign wire24 = ({wire10[(3'h6):(2'h2)]} != reg19[(1'h0):(1'h0)]);
  assign wire25 = wire13[(2'h2):(2'h2)];
  assign wire26 = wire14[(2'h3):(1'h0)];
  module27 #() modinst55 (wire54, clk, reg22, reg18, wire11, wire26, reg21);
  assign wire56 = $unsigned((wire12 ?
                      reg16[(4'h8):(3'h4)] : (^~(~|$signed(wire10)))));
  assign wire57 = wire26[(1'h1):(1'h1)];
  assign wire58 = reg17;
  assign wire59 = $unsigned($signed((!(reg21[(1'h1):(1'h1)] ?
                      (~wire11) : reg15))));
  always
    @(posedge clk) begin
      reg60 <= ((-reg19[(2'h2):(1'h1)]) ?
          ({(reg17[(4'hf):(1'h1)] ? $signed(wire58) : reg20[(3'h7):(1'h0)])} ?
              ($signed($signed(wire14)) >> $signed((wire14 ^~ wire57))) : reg20) : reg18);
    end
  assign wire61 = $signed($unsigned($unsigned(wire58[(1'h0):(1'h0)])));
  module62 #() modinst86 (wire85, clk, wire25, wire54, wire59, reg17);
  module87 #() modinst97 (wire96, clk, reg20, reg18, wire54, wire26);
  assign wire98 = (^~wire24[(1'h0):(1'h0)]);
  assign wire99 = $signed($signed(reg20));
  assign wire100 = (~^$unsigned({(~^$unsigned((8'hab))),
                       ((wire26 ? wire54 : wire54) ?
                           (wire26 ? wire24 : reg60) : (~wire85))}));
  always
    @(posedge clk) begin
      reg101 <= $signed(((((~wire10) ? (8'hb5) : $signed((8'hba))) ?
              $unsigned({wire13}) : (!(~&wire23))) ?
          wire23[(1'h0):(1'h0)] : (|wire98[(2'h2):(2'h2)])));
      reg102 <= (wire12 && (~^((&wire85) || $unsigned((~wire14)))));
      reg103 <= (8'hb0);
      reg104 <= {$signed($signed(wire100[(4'hf):(3'h7)]))};
    end
  assign wire105 = $unsigned({wire98});
  assign wire106 = {wire56[(1'h0):(1'h0)],
                       $unsigned(((reg104 && $signed(wire105)) * ((~&reg104) ?
                           (~reg16) : (wire56 * (8'ha8)))))};
  assign wire107 = reg104;
  assign wire108 = wire56[(1'h0):(1'h0)];
endmodule

module module87  (y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire91;
  input wire signed [(4'h8):(1'h0)] wire90;
  input wire [(2'h2):(1'h0)] wire89;
  input wire [(4'hf):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  assign y = {wire95, wire94, wire93, wire92, (1'h0)};
  assign wire92 = (8'hb5);
  assign wire93 = {(^{wire91})};
  assign wire94 = wire93;
  assign wire95 = (~&((+$unsigned((wire92 ? wire93 : wire93))) ?
                      {(^~$signed(wire93))} : (~&$signed((wire94 ^~ (8'hb4))))));
endmodule

module module62  (y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire66;
  input wire signed [(4'hd):(1'h0)] wire65;
  input wire signed [(4'hb):(1'h0)] wire64;
  input wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 reg84,
                 (1'h0)};
  assign wire67 = wire63[(4'hb):(3'h4)];
  assign wire68 = wire63;
  assign wire69 = $signed($unsigned(wire67));
  assign wire70 = $signed((($unsigned(wire64) && {wire69, wire66}) ?
                      $unsigned(($signed(wire63) ?
                          $unsigned(wire66) : ((8'hb4) ?
                              wire64 : wire66))) : ($unsigned((&(7'h42))) ?
                          ((8'ha2) << $unsigned(wire69)) : ((wire65 != wire64) ?
                              (8'ha3) : $unsigned(wire67)))));
  assign wire71 = $unsigned($unsigned($signed($signed((wire65 << wire67)))));
  assign wire72 = {$signed(wire68), (~^$signed(wire65))};
  assign wire73 = wire65[(4'h9):(3'h5)];
  assign wire74 = wire71;
  assign wire75 = $unsigned((~|(wire71[(1'h1):(1'h0)] ?
                      wire66[(4'hb):(2'h3)] : wire65[(4'h9):(1'h0)])));
  assign wire76 = $unsigned((wire73[(4'hb):(3'h5)] ?
                      (!$signed((~|wire66))) : $signed((wire63 > wire68[(5'h11):(4'h9)]))));
  assign wire77 = (~^$unsigned({$unsigned((wire67 ? wire65 : wire63))}));
  assign wire78 = (wire75 ?
                      {wire76[(4'h9):(3'h7)],
                          $signed(((wire74 <<< (8'hab)) * (~^wire66)))} : ($unsigned(($unsigned(wire67) ?
                              wire71 : $unsigned(wire64))) ?
                          (wire70[(1'h0):(1'h0)] ?
                              $unsigned((~wire69)) : (wire73 || (wire75 ^~ wire63))) : $unsigned({$signed((7'h41)),
                              {wire74, wire66}})));
  assign wire79 = ($unsigned((($signed(wire75) + wire71) || wire74[(3'h5):(1'h0)])) ?
                      $unsigned($unsigned(wire76[(2'h3):(2'h2)])) : (~&{{wire71[(1'h1):(1'h0)],
                              (wire66 ? (8'hb5) : wire77)}}));
  assign wire80 = wire74;
  assign wire81 = $unsigned(wire63);
  assign wire82 = $signed(wire78[(2'h2):(1'h1)]);
  assign wire83 = wire78[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg84 <= $unsigned($unsigned({(^(wire66 ? wire68 : wire65)),
          {(wire82 ? wire75 : wire75)}}));
    end
endmodule

module module27
#(parameter param52 = ((((~|{(8'hbb)}) ? {(^(8'h9e)), ((8'haa) != (8'had))} : {((8'hb5) >= (7'h44))}) & (((8'hb2) ? ((8'ha8) ^ (8'hba)) : ((8'ha9) != (7'h44))) ? ({(8'hae), (8'ha2)} == ((8'ha9) ? (8'hb8) : (7'h42))) : (-((8'hb8) ? (8'haa) : (7'h41))))) ? {(({(8'hae)} > {(8'hac)}) ^~ {(+(8'ha8)), ((8'ha3) << (8'hbf))}), {(7'h43), (~&((8'haa) | (8'h9d)))}} : (^~(~&{((8'hb8) ? (8'ha6) : (8'hbe))}))), 
parameter param53 = ((|(~&(8'hbd))) ? (+((!(param52 ? param52 : param52)) - (~|(+param52)))) : {param52}))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire32;
  input wire signed [(4'hb):(1'h0)] wire31;
  input wire [(4'hc):(1'h0)] wire30;
  input wire [(3'h5):(1'h0)] wire29;
  input wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg42,
                 (1'h0)};
  assign wire33 = wire31[(2'h2):(1'h1)];
  assign wire34 = (&(!wire30));
  assign wire35 = (wire34 ^ (+$unsigned({(-(8'hbd))})));
  assign wire36 = $signed($signed($unsigned($signed((wire31 ?
                      wire33 : wire30)))));
  assign wire37 = $signed(wire32[(3'h7):(3'h7)]);
  assign wire38 = $unsigned(wire34[(4'hc):(1'h0)]);
  assign wire39 = $unsigned((wire37[(4'hf):(4'h8)] ?
                      wire37[(2'h3):(1'h1)] : wire36[(2'h2):(2'h2)]));
  assign wire40 = wire33[(2'h3):(2'h2)];
  assign wire41 = wire39;
  always
    @(posedge clk) begin
      reg42 <= $signed(wire29);
    end
  assign wire43 = wire36[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg44 <= (((wire33 < ((reg42 ? wire32 : reg42) ?
                  $unsigned(wire43) : wire30[(3'h7):(2'h2)])) ?
              (wire35[(1'h1):(1'h0)] ?
                  wire28[(1'h0):(1'h0)] : $unsigned((wire31 > wire28))) : ((wire35[(3'h5):(2'h3)] ?
                  (wire37 ?
                      reg42 : reg42) : $signed(wire31)) == (!(wire33 && wire33)))) ?
          (8'h9f) : ($signed(wire33[(3'h4):(1'h0)]) ?
              wire34[(4'hd):(4'ha)] : $signed($signed((wire40 << wire32)))));
      reg45 <= $signed((wire38[(2'h3):(2'h2)] ?
          $signed($unsigned($unsigned(wire28))) : (&$signed((!wire40)))));
      reg46 <= $signed(((wire43[(4'he):(1'h1)] + (~|$unsigned(wire37))) ?
          ($unsigned(((8'hbf) ?
              (8'hb8) : wire34)) < reg45) : $unsigned($signed((reg44 ?
              wire39 : wire34)))));
      reg47 <= $unsigned(wire32[(4'hb):(2'h3)]);
    end
  assign wire48 = $signed(wire41);
  assign wire49 = (~$signed({(!((8'hba) <= wire36)), wire43}));
  assign wire50 = reg44[(3'h6):(2'h2)];
  assign wire51 = ((-wire35[(2'h2):(2'h2)]) ?
                      $signed(reg47[(4'hf):(3'h5)]) : $unsigned($signed($unsigned((wire41 ?
                          reg47 : reg47)))));
endmodule
