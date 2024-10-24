module top
#(parameter param116 = (((~&((^(8'hb0)) >= ((7'h40) ? (8'hab) : (8'haa)))) ? ((^((7'h44) - (8'hbd))) != {(!(8'hb7)), (^~(8'h9f))}) : (((8'hb6) || ((8'hb8) ? (8'hb6) : (8'ha5))) ? ({(7'h42)} ? {(8'h9f)} : (~|(8'hae))) : {((8'hab) ? (8'hae) : (8'hb2))})) ? ((^((^~(8'hbb)) && ((8'ha1) ? (8'ha9) : (8'ha3)))) ? ((((8'hb3) ^~ (8'hbf)) ? ((8'hbc) - (8'hbd)) : ((8'hab) ? (8'h9e) : (8'hbb))) ? (|{(8'hb8), (8'hb5)}) : (8'had)) : ((((8'ha6) ? (8'ha7) : (8'hbe)) || {(8'had), (8'hbf)}) ? ({(8'ha1), (8'hbe)} <= ((8'ha8) + (8'hb8))) : (((8'ha6) ? (8'hbf) : (8'hb7)) + (~^(8'hb1))))) : {((~|(8'haf)) ? ((8'h9f) ? ((8'hb6) ? (8'hb3) : (7'h40)) : ((8'ha1) ? (8'h9e) : (8'ha2))) : (~|((8'h9c) ? (8'hb8) : (8'ha2))))}), 
parameter param117 = (7'h41))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  wire [(4'ha):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire104;
  wire [(3'h5):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire102;
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire105,
                 wire104,
                 wire4,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire102,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire4 = (((^~{{wire1, wire3}}) | wire2) ?
                     ($unsigned(wire3[(1'h0):(1'h0)]) ?
                         wire0[(4'h8):(2'h2)] : wire2) : ($signed((-$unsigned(wire2))) >= wire2));
  always
    @(posedge clk) begin
      reg5 <= (|wire2);
      reg6 <= wire0[(2'h3):(1'h0)];
      if ($signed({wire0, $unsigned(wire2)}))
        begin
          reg7 <= ((reg6 >= ($unsigned({reg6}) ?
              (^~(~wire4)) : wire0)) ^ {((|wire0) ? wire1 : wire1),
              $signed($signed((!wire3)))});
          reg8 <= (7'h40);
          reg9 <= reg6[(3'h4):(1'h1)];
        end
      else
        begin
          reg7 <= (~^({((&reg5) - wire0), $unsigned($signed(reg9))} ?
              ($signed((reg7 ? (8'ha1) : wire1)) ?
                  $signed(wire0[(4'hc):(3'h4)]) : ($unsigned(wire2) > {reg8,
                      wire4})) : reg7));
          reg8 <= $unsigned($signed(reg9[(2'h2):(1'h0)]));
          reg9 <= (($signed((~|(reg9 << reg8))) && reg7[(1'h0):(1'h0)]) ?
              (~^($signed($signed(wire4)) ?
                  (wire4 >>> wire1) : $signed((wire3 + reg6)))) : (reg6[(1'h0):(1'h0)] <<< (wire0[(4'hb):(3'h7)] ?
                  $signed($unsigned(reg8)) : $signed($unsigned(reg6)))));
          reg10 <= $signed(wire3[(1'h0):(1'h0)]);
        end
      reg11 <= $signed($unsigned(reg5));
    end
  assign wire12 = $unsigned($signed((($signed(reg10) != (reg10 - reg7)) ?
                      (((8'hac) ? (8'h9e) : wire3) ?
                          $signed(wire1) : (~|(8'ha9))) : {(reg7 ?
                              reg7 : wire0),
                          $unsigned((8'ha3))})));
  assign wire13 = wire3[(1'h0):(1'h0)];
  assign wire14 = ((^$signed({reg9[(4'hc):(2'h3)]})) ?
                      $unsigned({wire0[(4'hb):(4'ha)]}) : (((reg11[(4'h9):(2'h3)] ?
                                  (wire0 > (8'hbc)) : $unsigned(reg10)) ?
                              $unsigned((reg5 < (8'ha6))) : (!reg6)) ?
                          (^$unsigned(wire2)) : (8'h9d)));
  assign wire15 = reg9[(4'he):(3'h4)];
  module16 #() modinst103 (.wire17(wire14), .y(wire102), .clk(clk), .wire19(wire0), .wire20(wire2), .wire18(reg11));
  assign wire104 = $signed(reg11[(4'he):(4'hb)]);
  assign wire105 = $signed($signed(wire12));
  always
    @(posedge clk) begin
      reg106 <= reg10[(2'h2):(1'h1)];
      reg107 <= (^(+{$signed((!wire102)),
          (reg11[(4'he):(4'ha)] ?
              (reg11 ? reg5 : wire13) : (reg6 ? reg11 : reg7))}));
      reg108 <= (($signed((wire102[(1'h1):(1'h0)] ^~ (wire13 ?
              reg8 : wire0))) + reg10[(3'h4):(1'h0)]) ?
          wire0 : {(~^(reg107[(3'h4):(3'h4)] ?
                  wire102 : reg9[(5'h10):(1'h1)]))});
      reg109 <= $unsigned(($signed($signed((reg5 ? wire104 : (8'ha6)))) ?
          {$unsigned($unsigned(wire12))} : {(-$unsigned(reg106)),
              $unsigned((+wire102))}));
      reg110 <= $unsigned(reg8);
    end
  assign wire111 = ($signed($unsigned($unsigned($signed(reg9)))) > {reg106,
                       $unsigned((reg10[(2'h2):(2'h2)] && $signed(wire3)))});
  assign wire112 = $signed(wire4[(2'h2):(1'h1)]);
  assign wire113 = reg11;
  assign wire114 = ($unsigned($unsigned(($unsigned(wire104) - $signed(reg107)))) && (reg6[(3'h7):(1'h0)] * $signed(wire111)));
  assign wire115 = $signed((|(&$unsigned((reg7 ? reg107 : (8'hb3))))));
endmodule

module module16
#(parameter param100 = (!(^~((8'hb6) ? (8'hbb) : (~((8'hb6) ^ (8'haf)))))), 
parameter param101 = (-param100))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire20;
  input wire [(4'h9):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire98;
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  assign y = {wire47,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire21,
                 wire49,
                 wire50,
                 wire58,
                 wire98,
                 reg22,
                 reg23,
                 reg24,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 (1'h0)};
  assign wire21 = wire19;
  always
    @(posedge clk) begin
      reg22 <= wire20[(4'h9):(2'h3)];
      reg23 <= $signed(((~wire19[(1'h0):(1'h0)]) ?
          wire21[(3'h4):(2'h3)] : $signed(((8'ha1) ?
              (!wire19) : $unsigned(wire21)))));
      reg24 <= ((-$unsigned($unsigned(wire17[(4'ha):(4'h8)]))) ?
          $unsigned(reg23[(3'h5):(1'h1)]) : (wire21[(2'h2):(1'h1)] ?
              (8'h9f) : ((wire18 & {(7'h42)}) == wire19[(1'h1):(1'h1)])));
    end
  assign wire25 = $signed($signed($signed(($signed(reg24) ?
                      {wire17} : $unsigned(wire17)))));
  assign wire26 = {{wire20[(4'ha):(2'h3)]}, wire19[(2'h2):(1'h1)]};
  assign wire27 = ((|wire17[(3'h6):(3'h4)]) ?
                      reg22[(4'h9):(3'h4)] : (&{reg24}));
  assign wire28 = wire25[(1'h0):(1'h0)];
  assign wire29 = (reg22[(3'h5):(2'h2)] ~^ (((-$signed(wire28)) ?
                      ((-wire17) ?
                          (wire28 ? (8'haf) : (8'ha9)) : ((8'hb4) ?
                              (8'ha7) : wire26)) : {(^~wire20),
                          (reg23 ?
                              (8'ha7) : wire20)}) == wire28[(4'hd):(4'h8)]));
  assign wire30 = (!(wire20[(3'h5):(2'h2)] ?
                      reg23 : ((~$unsigned((8'hbc))) * ((&wire29) ?
                          wire18 : wire26[(3'h4):(2'h2)]))));
  assign wire31 = ((8'haf) && ($signed(reg24[(4'h8):(3'h7)]) > wire27[(3'h5):(2'h3)]));
  assign wire32 = wire25;
  assign wire33 = $unsigned((~|wire26));
  module34 #() modinst48 (.clk(clk), .y(wire47), .wire35(wire19), .wire38(wire31), .wire36(wire28), .wire39(wire20), .wire37(wire25));
  assign wire49 = ((8'hb7) < (wire20 == $signed({wire26, (~wire19)})));
  assign wire50 = ($signed({wire18}) ^ {(wire18[(4'hf):(3'h6)] ?
                          (!$signed(wire31)) : $signed($signed(wire31))),
                      $signed(wire19)});
  always
    @(posedge clk) begin
      reg51 <= $unsigned($signed((~|$unsigned(wire47[(2'h2):(1'h0)]))));
      reg52 <= $unsigned($signed($unsigned((((8'ha6) + reg51) ?
          ((8'h9c) ? wire25 : wire50) : wire21[(1'h1):(1'h1)]))));
      reg53 <= reg22;
      if (wire21)
        begin
          if ($signed(reg51))
            begin
              reg54 <= ((wire17[(3'h6):(3'h5)] << wire26[(2'h2):(2'h2)]) ?
                  (~^$signed((~wire47[(4'ha):(1'h1)]))) : (-($signed($signed(wire25)) ^ (~(^~wire25)))));
              reg55 <= (&$signed(wire27));
            end
          else
            begin
              reg54 <= (~^$signed(reg23[(3'h5):(1'h0)]));
              reg55 <= $unsigned(wire50[(3'h5):(2'h2)]);
              reg56 <= (+$unsigned($unsigned((((8'hbb) ?
                  wire17 : wire27) < $unsigned((8'ha6))))));
            end
          reg57 <= reg23;
        end
      else
        begin
          reg54 <= $unsigned(((wire25 ^~ wire26[(2'h2):(1'h0)]) ?
              wire21[(4'hb):(1'h0)] : wire32[(2'h2):(1'h1)]));
        end
    end
  assign wire58 = (7'h44);
  module59 #() modinst99 (wire98, clk, reg57, wire26, reg54, reg22);
endmodule

module module59
#(parameter param96 = (((({(8'hb2)} >= ((7'h41) >> (8'hb5))) ? {(~^(8'hb9)), (+(8'ha1))} : ({(7'h43)} || ((8'hb2) > (8'hbb)))) ? ((+((8'hbc) >> (8'hbd))) * {(+(8'ha5)), ((8'hac) ? (8'hbb) : (8'hb0))}) : (8'hb0)) ? {((-((8'hb8) || (8'hac))) != (~&((8'ha8) >> (8'hb0))))} : ((8'hbc) <= (({(8'ha0), (8'hb2)} == (^(8'ha7))) <= ({(8'ha7)} ? (~(7'h40)) : (~&(8'haf)))))), 
parameter param97 = {((((~param96) ? (param96 * param96) : (param96 ? param96 : param96)) ? ((param96 ^ param96) ? param96 : param96) : (-(~^param96))) ? (({param96, param96} ^~ param96) && (&{param96, param96})) : (~{param96, (~^param96)}))})
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire63;
  input wire [(2'h3):(1'h0)] wire62;
  input wire [(3'h7):(1'h0)] wire61;
  input wire [(4'hf):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(4'h9):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
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
                 (1'h0)};
  assign wire64 = wire60[(1'h0):(1'h0)];
  assign wire65 = (((~&wire61[(2'h3):(2'h3)]) <= ({{wire60},
                          (wire63 * wire61)} ?
                      wire61[(2'h2):(1'h1)] : wire63)) > $signed($unsigned($signed(wire60))));
  assign wire66 = $unsigned(wire61);
  assign wire67 = {wire65};
  assign wire68 = $signed($signed((wire61[(3'h5):(1'h1)] ^~ {(~^wire65)})));
  assign wire69 = (wire66 > {(wire66[(3'h6):(3'h6)] <<< wire62[(1'h1):(1'h1)])});
  assign wire70 = (~wire69[(3'h4):(3'h4)]);
  assign wire71 = (-$signed($unsigned((~|(+wire65)))));
  always
    @(posedge clk) begin
      reg72 <= wire63;
      if ({((wire62 ?
                  {(wire62 ? wire60 : wire67),
                      (~&(8'hbe))} : wire65[(4'h8):(1'h0)]) ?
              $signed((~&wire69[(4'ha):(3'h6)])) : wire69[(4'hc):(2'h2)])})
        begin
          reg73 <= ((wire71[(1'h0):(1'h0)] ? (&(8'hb5)) : wire60) ?
              $unsigned({wire63}) : $unsigned(wire67[(3'h4):(3'h4)]));
          reg74 <= wire64[(2'h3):(1'h0)];
          reg75 <= $unsigned((~|wire61[(1'h0):(1'h0)]));
          reg76 <= $signed($signed((^(7'h42))));
          reg77 <= (7'h42);
        end
      else
        begin
          if ({$signed($signed(($signed(wire62) == (reg74 ?
                  wire62 : (8'h9e))))),
              {($unsigned((~|wire61)) ? (8'hb0) : reg76)}})
            begin
              reg73 <= (^~(^wire60[(4'hb):(1'h1)]));
              reg74 <= (&(($unsigned((^~wire61)) ?
                  reg74[(3'h5):(1'h1)] : (-$signed(wire61))) <<< reg74[(1'h0):(1'h0)]));
              reg75 <= {$signed(wire69),
                  {(~&((^reg73) ? {wire70} : (&wire67)))}};
              reg76 <= $signed(reg73);
              reg77 <= $signed(wire60);
            end
          else
            begin
              reg73 <= ($unsigned(wire69) | reg73[(3'h6):(1'h1)]);
              reg74 <= wire60;
              reg75 <= (+wire65[(3'h6):(2'h2)]);
              reg76 <= wire62;
              reg77 <= ($unsigned(($unsigned(reg73) || ((wire66 ?
                          wire60 : reg75) ?
                      wire66[(1'h0):(1'h0)] : $signed(wire71)))) ?
                  (($signed($unsigned((8'haa))) ^ ((^reg76) <= wire60)) ?
                      $signed($signed((~^wire63))) : reg77) : $signed((((wire60 * reg73) ?
                      (wire69 + reg75) : (wire69 <= (8'ha1))) >= $unsigned((reg77 ^ (8'hb1))))));
            end
          if ($signed((&($signed($signed(reg72)) && wire61[(3'h5):(3'h4)]))))
            begin
              reg78 <= $unsigned($signed(wire63));
              reg79 <= wire71[(2'h2):(1'h0)];
            end
          else
            begin
              reg78 <= wire65;
              reg79 <= $signed(reg78);
            end
          if (wire65[(3'h5):(2'h2)])
            begin
              reg80 <= reg76[(1'h0):(1'h0)];
              reg81 <= reg78[(2'h2):(1'h1)];
              reg82 <= (~((+$unsigned((~&reg75))) ?
                  (-reg76) : (wire60 ? reg75[(2'h2):(2'h2)] : $signed(reg76))));
              reg83 <= {{((wire60 ?
                          $signed(reg74) : reg75[(4'ha):(3'h5)]) < {{wire64}})}};
              reg84 <= reg76;
            end
          else
            begin
              reg80 <= $signed($signed(reg83));
              reg81 <= (!(^~($unsigned((reg82 ? reg83 : reg73)) && wire65)));
              reg82 <= ((8'hb3) * {(reg83 ?
                      $unsigned(wire64) : $unsigned($unsigned(wire63))),
                  (7'h43)});
            end
          reg85 <= ($unsigned($signed($signed({wire69, wire69}))) >>> reg83);
        end
    end
  assign wire86 = (wire67[(2'h3):(1'h1)] ?
                      (($signed((7'h43)) ?
                              ((-reg80) ?
                                  $unsigned(wire66) : $unsigned(reg79)) : reg73[(3'h4):(1'h1)]) ?
                          reg80[(3'h5):(1'h0)] : reg75[(4'h8):(2'h2)]) : {wire65,
                          ({reg77} ^~ $signed((!reg83)))});
  assign wire87 = (reg75[(4'h9):(3'h4)] ^ reg74);
  assign wire88 = reg75;
  assign wire89 = (wire68[(3'h4):(3'h4)] ^ $unsigned(($signed(reg81[(3'h7):(3'h4)]) ?
                      {reg74[(3'h5):(3'h4)],
                          (wire65 ? reg73 : wire86)} : (~^reg80))));
  assign wire90 = (~&($signed(((~&reg80) << (8'hb7))) >>> wire66[(2'h3):(2'h2)]));
  assign wire91 = (&$signed($unsigned((!$unsigned(reg83)))));
  assign wire92 = $signed($signed($signed({(wire67 ? reg84 : wire60),
                      ((8'hba) * wire66)})));
  assign wire93 = (wire71[(1'h1):(1'h1)] | $signed($unsigned(($signed(wire67) ?
                      $unsigned(wire61) : (wire67 << reg74)))));
  assign wire94 = wire91[(5'h10):(4'h9)];
  assign wire95 = reg81[(3'h7):(1'h0)];
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire39;
  input wire [(5'h15):(1'h0)] wire38;
  input wire [(4'he):(1'h0)] wire37;
  input wire signed [(5'h14):(1'h0)] wire36;
  input wire [(4'h9):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  assign y = {wire46, wire44, wire43, wire42, wire41, wire40, reg45, (1'h0)};
  assign wire40 = wire35;
  assign wire41 = wire36;
  assign wire42 = wire41[(1'h1):(1'h1)];
  assign wire43 = ((wire38[(3'h4):(1'h1)] == ({(wire41 < (8'hb6)),
                      $signed(wire42)} ~^ (~$unsigned((8'hbf))))) != wire41[(1'h0):(1'h0)]);
  assign wire44 = (!$signed(wire42[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      reg45 <= ((~^(((&wire36) ? wire41[(1'h1):(1'h1)] : (8'ha6)) ?
              (^~(wire44 | wire41)) : ($signed(wire36) < (~wire37)))) ?
          (8'had) : (8'ha6));
    end
  assign wire46 = wire39;
endmodule
