module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire139;
  wire [(5'h12):(1'h0)] wire138;
  wire signed [(2'h2):(1'h0)] wire137;
  wire [(4'h9):(1'h0)] wire136;
  wire signed [(4'h8):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire130;
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire133,
                 wire102,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire4,
                 wire104,
                 wire126,
                 wire128,
                 wire129,
                 wire130,
                 reg135,
                 reg134,
                 reg132,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire4 = $unsigned(wire1[(4'ha):(2'h3)]);
  always
    @(posedge clk) begin
      reg5 <= {wire1,
          ($signed(wire0) >> $signed(((wire2 ?
              wire3 : (8'had)) == (wire3 && wire4))))};
    end
  always
    @(posedge clk) begin
      reg6 <= (~&wire0[(3'h7):(3'h7)]);
      reg7 <= $signed((~|(($signed(wire1) * $unsigned(wire2)) != $signed((wire4 * wire0)))));
      reg8 <= (!(-$signed((~^{wire0, wire4}))));
      reg9 <= $unsigned((reg7 ?
          (^(~(wire0 ? reg5 : reg8))) : {(~^{reg7, reg6}), (8'hb0)}));
    end
  assign wire10 = (+{reg8[(1'h0):(1'h0)], reg6});
  assign wire11 = ($signed($unsigned(wire1)) ?
                      (&({wire1[(2'h2):(1'h0)], $signed((8'hab))} ?
                          (^wire0) : (reg5[(3'h6):(2'h3)] ?
                              $signed(reg5) : wire2))) : (!reg5[(1'h0):(1'h0)]));
  assign wire12 = $signed(({wire0[(4'h9):(3'h6)]} ^~ wire11));
  assign wire13 = (&$signed((7'h41)));
  assign wire14 = wire4;
  assign wire15 = ((($unsigned(reg5[(4'hc):(1'h0)]) | wire12) >> (+wire14)) == (~&reg5));
  assign wire16 = ((|(|((reg9 << (8'hbd)) ?
                      (~&wire12) : $unsigned(wire3)))) <<< reg5);
  module17 #() modinst103 (wire102, clk, wire2, wire16, wire10, wire0, wire15);
  assign wire104 = (((~&$signed((reg9 ? (8'ha9) : reg7))) ? (8'hb6) : (7'h40)) ?
                       (wire12[(3'h5):(3'h5)] ?
                           (reg8 ?
                               (8'hbf) : wire13[(3'h4):(1'h0)]) : (wire1[(1'h0):(1'h0)] && $signed((&wire13)))) : wire4);
  module105 #() modinst127 (.wire108(wire3), .wire107(wire15), .wire106(wire2), .clk(clk), .wire109(wire13), .y(wire126));
  assign wire128 = reg7[(2'h2):(1'h1)];
  assign wire129 = $unsigned(((8'h9c) <= wire10));
  module61 #() modinst131 (.y(wire130), .wire64(wire16), .clk(clk), .wire62(wire10), .wire65(reg5), .wire63(wire1));
  always
    @(posedge clk) begin
      reg132 <= $signed((&(((&reg7) ~^ ((8'hb3) >>> (7'h43))) ?
          $unsigned($signed(reg5)) : wire130)));
    end
  assign wire133 = ((8'hb4) <= reg5[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg134 <= {$unsigned((~(8'ha4))),
          ((+{$signed(wire104)}) ?
              $unsigned((reg7 ?
                  (wire1 ?
                      wire130 : wire10) : $signed(reg8))) : wire15[(5'h10):(5'h10)])};
      reg135 <= wire16[(1'h1):(1'h0)];
    end
  assign wire136 = ((^wire128[(2'h3):(1'h0)]) ?
                       (|(-$signed((|wire130)))) : ((wire130[(1'h0):(1'h0)] ?
                           (~^(wire10 ?
                               wire11 : (8'hab))) : wire3[(1'h0):(1'h0)]) || (-$unsigned($signed(wire3)))));
  assign wire137 = ($signed(($unsigned(wire130) ?
                       {((8'hb8) >> wire3), (~(8'haf))} : {(^wire12),
                           (reg8 << wire128)})) > (wire0[(5'h10):(4'h9)] << wire4[(4'h9):(2'h3)]));
  assign wire138 = (~wire1[(3'h4):(2'h2)]);
  assign wire139 = reg8[(1'h1):(1'h1)];
endmodule

module module105
#(parameter param125 = ((+((((8'hab) <<< (8'ha4)) || ((7'h42) ? (8'hac) : (8'hbf))) ? (((8'hb6) ? (8'hbc) : (8'hb0)) ? ((8'h9d) ? (8'hb0) : (8'hb8)) : ((8'haa) || (7'h40))) : ({(8'h9e), (8'hb7)} > ((8'ha7) <= (8'hb9))))) << {((((8'hb8) ? (8'haa) : (8'had)) ? ((7'h43) ^ (8'had)) : (!(8'hb5))) >> {((8'ha2) ? (8'ha7) : (8'hb7))}), ((((8'hb3) ? (8'ha1) : (8'hb8)) >> ((8'ha7) && (8'hbc))) || (~^(!(8'ha6))))}))
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire109;
  input wire signed [(5'h12):(1'h0)] wire108;
  input wire signed [(5'h10):(1'h0)] wire107;
  input wire [(2'h2):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire124;
  wire [(4'ha):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(3'h6):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire110;
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  assign y = {wire124,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
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
  assign wire110 = {{(((wire107 != wire109) | (~wire109)) < (~|wire106[(1'h0):(1'h0)])),
                           {$signed((wire109 ? wire109 : wire109))}},
                       $unsigned(wire108)};
  assign wire111 = (((!wire108) ?
                       ((&wire110[(1'h0):(1'h0)]) ?
                           ($unsigned(wire110) >>> (wire107 & wire107)) : (^wire109)) : (wire106[(1'h0):(1'h0)] << (~^wire106))) >= wire107);
  assign wire112 = $signed((wire107 ?
                       wire108[(4'h8):(1'h1)] : (wire108 ~^ wire109[(2'h3):(1'h0)])));
  assign wire113 = $signed(wire110);
  always
    @(posedge clk) begin
      reg114 <= (8'hb2);
      reg115 <= wire109[(3'h5):(3'h5)];
      reg116 <= $signed((($unsigned((8'haa)) ^~ (reg114 ?
          wire110 : wire106[(1'h0):(1'h0)])) >= $unsigned(wire108[(3'h7):(2'h2)])));
    end
  always
    @(posedge clk) begin
      if ((^wire112[(3'h5):(1'h1)]))
        begin
          reg117 <= wire106[(1'h0):(1'h0)];
        end
      else
        begin
          if ($signed((-{($signed(reg117) + (reg116 ? wire109 : wire110)),
              wire111})))
            begin
              reg117 <= ($signed({wire109[(3'h4):(3'h4)]}) ~^ (($signed($signed(wire108)) <<< reg116) ?
                  wire109 : (&(&wire110))));
            end
          else
            begin
              reg117 <= wire110;
              reg118 <= reg114;
              reg119 <= (8'hab);
              reg120 <= wire108;
              reg121 <= wire109[(4'ha):(3'h6)];
            end
          reg122 <= (7'h43);
        end
      reg123 <= ($unsigned(reg118[(4'h8):(3'h5)]) ?
          $unsigned($signed((~&(|wire111)))) : ((~^wire113[(3'h4):(1'h0)]) ?
              ($unsigned((wire113 ? reg121 : reg121)) & $unsigned((wire109 ?
                  reg121 : (8'ha3)))) : (($signed(wire110) == {wire111,
                      reg121}) ?
                  $unsigned($signed(wire111)) : (~&{wire109}))));
    end
  assign wire124 = $signed($unsigned(({$unsigned((8'hb2)),
                       wire107[(4'h9):(3'h5)]} && ((&reg119) < reg120))));
endmodule

module module17
#(parameter param100 = ((-((((8'haf) + (8'hac)) & {(8'hbe), (8'haa)}) ^ (((8'hbf) < (8'haa)) >>> ((8'h9c) ? (8'ha7) : (8'ha1))))) * (((((7'h43) <= (8'ha9)) <<< ((8'ha7) ? (8'ha7) : (8'hbc))) ? (^(~^(8'haa))) : (^~((8'hab) ^ (8'ha2)))) ? (8'hb4) : ({((7'h40) ? (8'ha7) : (8'hbe)), (~(8'hb9))} * {{(8'haf)}, ((8'hb7) ? (8'h9d) : (8'had))}))), 
parameter param101 = ((+((8'hb3) ? ((param100 && param100) ^~ {param100, param100}) : ((~param100) == ((8'haf) | param100)))) >>> ((({param100, param100} ? (~param100) : ((7'h44) == param100)) - (param100 ? (param100 ? (7'h43) : param100) : (param100 & param100))) >= ((+{param100}) > (^(param100 << param100))))))
(y, clk, wire18, wire19, wire20, wire21, wire22);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire35;
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire96,
                 wire55,
                 wire54,
                 wire52,
                 wire23,
                 wire24,
                 wire35,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire23 = wire22[(2'h2):(1'h0)];
  assign wire24 = wire23[(2'h3):(2'h3)];
  module25 #() modinst36 (wire35, clk, wire23, wire19, wire21, wire22, wire18);
  module37 #() modinst53 (wire52, clk, wire20, wire22, wire23, wire19);
  assign wire54 = (!wire18[(3'h5):(1'h0)]);
  assign wire55 = wire21[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      if ($signed((&{$unsigned(wire23[(4'he):(4'hd)])})))
        begin
          reg56 <= wire52[(4'h8):(3'h6)];
          reg57 <= $signed(wire55[(3'h7):(1'h0)]);
          reg58 <= ($unsigned($signed({(wire55 ? wire21 : wire22), wire18})) ?
              wire23[(4'hd):(4'hb)] : wire22[(2'h2):(1'h0)]);
          reg59 <= wire20;
        end
      else
        begin
          reg56 <= (wire21 ? reg58 : (|wire54));
        end
      reg60 <= (^~(|wire18));
    end
  module61 #() modinst97 (wire96, clk, wire24, reg58, wire19, reg56);
  assign wire98 = (~wire35[(3'h4):(2'h3)]);
  assign wire99 = wire20;
endmodule

module module61
#(parameter param94 = ((((((8'hb0) >= (8'hb3)) ? (+(8'hb2)) : ((8'hb9) || (8'hbb))) + (((8'hbe) * (8'ha4)) ? {(8'had), (8'hb8)} : (+(8'hb2)))) ? ((((7'h40) ? (7'h42) : (8'hb1)) || ((8'had) ? (8'ha7) : (8'hbb))) != (|{(8'ha7), (8'hbe)})) : ((((8'haf) ? (8'ha8) : (8'hac)) ? ((8'hb3) ? (8'ha8) : (8'hb9)) : ((8'hb1) + (7'h44))) ? (+(-(8'ha7))) : ((!(8'hbb)) != (~|(8'hb6))))) ? ((8'hb1) ? {((~(8'ha9)) ^~ (~^(8'ha9))), (|((8'hbe) >>> (8'hb6)))} : ((((8'hb2) ~^ (8'h9d)) <<< ((8'ha2) ? (8'hba) : (8'h9c))) ? ({(8'ha6), (8'hb7)} + {(8'ha9)}) : (((8'hbd) && (8'hbb)) ? {(8'hb4)} : ((8'hbf) << (7'h44))))) : ((~{((8'h9d) ^~ (8'hbb))}) ? ((~|(|(8'ha9))) >= (^~(&(7'h44)))) : ((((8'hb4) ? (8'hae) : (8'hb5)) ? (~^(8'ha0)) : (8'ha5)) ? ((!(8'hb8)) <= ((8'ha5) - (8'had))) : (((8'h9c) ? (7'h40) : (8'ha8)) ? (^~(7'h43)) : ((8'hab) ? (8'ha9) : (8'haa)))))), 
parameter param95 = (&(~|(param94 <= param94))))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire65;
  input wire [(2'h2):(1'h0)] wire64;
  input wire [(3'h5):(1'h0)] wire63;
  input wire [(3'h4):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire66;
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire86,
                 wire85,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire66,
                 reg88,
                 reg87,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire66 = (!{(&$unsigned(wire63)), $signed((7'h40))});
  always
    @(posedge clk) begin
      reg67 <= ((wire62 ?
          ($signed((wire66 ? wire65 : wire63)) < wire62) : wire64) > wire65);
      reg68 <= ((|wire62) ? (8'hb7) : $signed((7'h44)));
    end
  assign wire69 = (wire64[(1'h0):(1'h0)] << ($unsigned(wire65[(4'hb):(2'h3)]) && ((((8'hbc) ?
                              (8'hb4) : wire66) ?
                          (wire65 ? reg67 : wire62) : (wire62 && wire62)) ?
                      (|{wire64}) : ((reg68 ? wire65 : wire63) | (^~wire63)))));
  assign wire70 = $signed(wire63);
  assign wire71 = $signed(((^~wire62) ?
                      (-$unsigned((^~(8'ha2)))) : (^~$unsigned((wire66 ?
                          wire70 : (8'h9f))))));
  assign wire72 = ((wire71 ?
                          $signed(({wire69, wire70} ?
                              (wire69 - wire65) : $unsigned((8'hbd)))) : $signed(wire69[(2'h2):(1'h1)])) ?
                      wire64[(2'h2):(1'h1)] : wire65[(3'h7):(3'h4)]);
  assign wire73 = $unsigned(wire69[(1'h0):(1'h0)]);
  assign wire74 = $unsigned(wire70[(4'he):(3'h7)]);
  assign wire75 = $signed($signed(wire71));
  assign wire76 = ($unsigned(wire73[(3'h4):(2'h3)]) & $unsigned({wire71[(3'h5):(2'h2)]}));
  always
    @(posedge clk) begin
      reg77 <= reg67;
      reg78 <= wire72;
      if (($unsigned($signed(wire63)) ?
          ($unsigned((^~((8'hab) ?
              wire66 : wire74))) >= (wire72 ~^ ($unsigned(reg77) ^ $signed((8'hbc))))) : (|reg67)))
        begin
          reg79 <= $unsigned((~((reg78 ?
                  (wire62 * wire69) : (wire66 < wire74)) ?
              (!(~^(8'h9d))) : $unsigned((reg67 > wire64)))));
          if ((&$signed((+{wire69[(1'h0):(1'h0)]}))))
            begin
              reg80 <= {wire63};
            end
          else
            begin
              reg80 <= (($signed(wire63) | (-(wire75[(3'h6):(1'h0)] ?
                  $signed(reg79) : $unsigned(wire75)))) >>> $signed((reg78[(4'h8):(1'h1)] ?
                  (wire63 <<< {reg80}) : (^reg80[(4'h9):(3'h7)]))));
              reg81 <= (($signed(((wire72 ?
                  reg68 : reg78) >= wire73)) <<< $signed((~^(wire72 < wire63)))) & $unsigned((|($unsigned(wire71) + (wire63 << wire71)))));
              reg82 <= (reg79 ?
                  ($unsigned(reg80[(1'h0):(1'h0)]) ?
                      reg80 : {(~&(!reg81)),
                          wire64}) : (^~$unsigned($signed(wire65))));
              reg83 <= $signed($signed($unsigned($unsigned($signed((8'hab))))));
            end
        end
      else
        begin
          if ((+wire69[(1'h0):(1'h0)]))
            begin
              reg79 <= (reg68 ?
                  ((((^~wire65) ? (~|reg80) : (+wire70)) ?
                          (-(wire65 ? wire75 : wire63)) : wire69) ?
                      reg81 : (!(7'h40))) : $unsigned((~|reg67)));
              reg80 <= (($signed(((reg67 ^ wire65) ? wire65 : wire72)) ?
                  (((wire69 < wire76) ?
                      ((8'ha7) <= wire66) : (+wire64)) ^ ((-reg68) ?
                      $signed(reg81) : (~&wire71))) : (((reg77 ?
                              wire75 : reg82) ?
                          $signed(reg83) : $signed(wire72)) ?
                      $unsigned((~&reg79)) : $signed(reg83[(3'h5):(3'h4)]))) << reg67[(3'h6):(2'h2)]);
              reg81 <= (!$signed((+wire64)));
              reg82 <= (8'ha9);
              reg83 <= (((+reg83) ^ ($signed(reg83) ^~ {(+wire65)})) ?
                  ($unsigned(wire71[(3'h7):(3'h4)]) ?
                      ($unsigned($unsigned(wire72)) + (8'hac)) : {$unsigned($unsigned(wire75)),
                          (wire72 ^ reg67[(4'he):(4'ha)])}) : $signed(($signed($unsigned(reg67)) | $signed((~&wire71)))));
            end
          else
            begin
              reg79 <= (8'ha6);
              reg80 <= (+{((reg82[(2'h2):(1'h1)] ? (~|reg68) : wire63) ?
                      wire63 : ($unsigned(wire76) ?
                          {reg78} : $signed(reg80)))});
              reg81 <= $signed((^reg68[(3'h5):(3'h5)]));
              reg82 <= (reg68 ~^ reg78);
              reg83 <= $signed((7'h40));
            end
        end
      reg84 <= ((!wire65) > $unsigned(({wire64} ?
          (~|{(7'h42), wire75}) : reg80)));
    end
  assign wire85 = $signed(wire66);
  assign wire86 = (^~wire85);
  always
    @(posedge clk) begin
      reg87 <= (&wire66[(3'h5):(1'h0)]);
      reg88 <= {wire86[(3'h7):(3'h6)]};
    end
  assign wire89 = $signed(wire66[(1'h1):(1'h0)]);
  assign wire90 = $unsigned({(+$signed($signed((7'h43))))});
  assign wire91 = $unsigned(((reg80 ?
                      ({reg79} ?
                          wire62 : $signed(wire71)) : (|wire72[(1'h1):(1'h0)])) | ((reg81 << (wire76 ?
                      reg81 : (8'hb9))) && $signed({reg81, reg79}))));
  assign wire92 = reg81;
  assign wire93 = reg77;
endmodule

module module37
#(parameter param51 = ({{{((8'hbb) ? (7'h40) : (8'h9c)), ((8'h9e) - (7'h42))}}, (-(!((7'h43) ? (8'h9c) : (8'ha2))))} ? {((((8'hae) <<< (8'hb0)) ? {(8'had)} : (&(8'hac))) << (((8'hb4) >= (7'h44)) ? (~(8'hb9)) : ((8'hae) ? (8'hba) : (8'hb1)))), (~&((8'ha5) ? ((8'ha5) != (8'hb1)) : ((8'hbb) ? (8'hb6) : (7'h40))))} : (((((8'hbc) ? (8'hbf) : (8'hb4)) == {(8'hb4)}) ? (((8'ha1) + (8'h9e)) || ((8'hb5) & (8'hbb))) : (|((8'hb0) ^ (8'ha6)))) <= ((((8'hb5) ? (8'hb2) : (8'h9c)) == (|(8'hb1))) == (~|((8'hba) & (8'hbb)))))))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire41;
  input wire [(5'h11):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire39;
  input wire [(2'h3):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire42,
                 reg44,
                 (1'h0)};
  assign wire42 = (wire41[(2'h3):(2'h2)] >>> wire39);
  assign wire43 = (($unsigned((~^{wire39, (8'hbc)})) == wire41) ?
                      $signed(wire42) : ({wire40[(1'h0):(1'h0)],
                          ($signed(wire42) ?
                              {wire39} : (~^wire41))} != (^{$unsigned(wire38),
                          (wire39 >= wire40)})));
  always
    @(posedge clk) begin
      reg44 <= ((8'hab) - (-((wire41[(3'h5):(1'h1)] < ((8'haa) ^~ wire41)) ?
          $unsigned({wire39, wire41}) : $unsigned(wire39[(1'h0):(1'h0)]))));
    end
  assign wire45 = {(^~($unsigned($unsigned(wire43)) ?
                          {(wire42 ? wire43 : wire40),
                              $unsigned(wire43)} : wire42[(4'hb):(1'h0)]))};
  assign wire46 = $signed(((~|$unsigned((~|wire39))) ?
                      (((reg44 | wire43) + (~^wire41)) & (wire43 * $signed((8'h9c)))) : wire41[(3'h7):(3'h5)]));
  assign wire47 = ($unsigned(((^$unsigned(wire41)) > {wire46})) ^ (^(!(^$unsigned(wire41)))));
  assign wire48 = $unsigned($unsigned($unsigned(($unsigned(wire43) ?
                      wire40 : (wire47 & wire41)))));
  assign wire49 = $signed(wire43[(4'he):(4'he)]);
  assign wire50 = (&{$signed({(wire49 ? wire48 : wire49)}),
                      (((wire42 ?
                          wire45 : wire43) >= $signed(wire45)) - (wire47[(3'h6):(3'h5)] ?
                          wire39[(5'h10):(4'hd)] : (^~(8'haa))))});
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire30;
  input wire [(2'h2):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  assign y = {wire34, wire33, wire32, wire31, (1'h0)};
  assign wire31 = ($signed(wire30[(3'h4):(1'h1)]) ?
                      (wire28[(4'hf):(1'h0)] - wire28[(3'h5):(1'h0)]) : wire29);
  assign wire32 = {({(&wire26[(3'h6):(3'h6)])} ?
                          wire30[(4'hd):(4'h9)] : ({(wire29 - wire30)} * wire30[(1'h1):(1'h1)]))};
  assign wire33 = (|wire27[(3'h6):(1'h0)]);
  assign wire34 = (wire30[(4'hd):(3'h4)] ?
                      $signed(wire30[(2'h3):(1'h1)]) : ({$signed($unsigned(wire27))} ?
                          {((wire27 ? wire28 : wire33) == (wire33 ?
                                  wire28 : wire27)),
                              (~^(wire32 ?
                                  wire31 : wire30))} : wire32[(4'hc):(4'ha)]));
endmodule
