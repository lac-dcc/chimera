module top
#(parameter param159 = (^{((!{(8'hb8), (8'haf)}) ? ((+(8'h9e)) & ((8'hb2) ~^ (8'ha4))) : (((8'ha8) || (8'hbf)) ? ((8'hbf) || (8'ha4)) : ((8'ha7) ^~ (8'hac)))), ({(8'ha8), ((7'h41) ~^ (8'haf))} || (-(&(8'hab))))}), 
parameter param160 = (param159 <<< (^(^~(~&(param159 ? (8'hb0) : (8'hb9)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire157;
  wire [(4'h9):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire signed [(4'he):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg151 = (1'h0);
  reg [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(3'h5):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg133 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire131,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
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
                 (1'h0)};
  assign wire5 = wire3[(1'h0):(1'h0)];
  assign wire6 = wire5[(1'h1):(1'h0)];
  assign wire7 = $signed(wire4[(4'hb):(3'h5)]);
  assign wire8 = ((wire7[(4'hc):(4'h9)] ? wire6 : wire0) ?
                     wire4[(1'h0):(1'h0)] : $unsigned(($signed({wire3,
                         (8'hbe)}) << $signed((wire7 ? wire5 : wire4)))));
  assign wire9 = (8'hbf);
  module10 #() modinst132 (wire131, clk, wire8, wire3, wire1, wire5);
  always
    @(posedge clk) begin
      if ($signed(wire8[(3'h7):(2'h3)]))
        begin
          if (wire2)
            begin
              reg133 <= $signed(wire7);
            end
          else
            begin
              reg133 <= wire4[(1'h1):(1'h1)];
              reg134 <= $unsigned($signed(wire1));
            end
          reg135 <= wire6;
          if (reg133)
            begin
              reg136 <= (&$signed(((^{(8'ha0)}) ?
                  ((wire3 ? wire8 : wire5) ?
                      (wire131 ~^ reg134) : (&(8'ha5))) : $unsigned(wire2[(3'h4):(1'h0)]))));
              reg137 <= {wire3, (reg134 ? {wire1[(3'h7):(1'h0)]} : wire7)};
              reg138 <= $signed(wire7);
              reg139 <= $unsigned($signed({reg138[(1'h1):(1'h1)]}));
              reg140 <= $unsigned($signed(($unsigned((~wire5)) != ($unsigned(reg134) ?
                  (wire7 ? reg139 : wire3) : (reg136 ? wire9 : (8'h9e))))));
            end
          else
            begin
              reg136 <= (^~$signed((&(8'hb8))));
              reg137 <= $signed(wire131);
            end
        end
      else
        begin
          reg133 <= ($unsigned(reg133[(4'hf):(3'h4)]) ^ (|$signed((reg138 + (reg135 ?
              wire5 : wire5)))));
          reg134 <= wire131;
          reg135 <= ((wire7[(1'h0):(1'h0)] ?
              wire8 : (~|$signed({(8'hab),
                  wire5}))) != $unsigned($signed($signed(reg135[(4'h9):(4'h8)]))));
        end
      reg141 <= ($signed({wire3[(1'h1):(1'h1)],
              (wire8 > wire4[(5'h10):(2'h2)])}) ?
          ($unsigned(reg140) ?
              wire6[(2'h2):(1'h1)] : ({$signed(reg135), $signed(wire131)} ?
                  reg139 : reg136)) : (^~(~&(~&(8'h9f)))));
      if (reg137)
        begin
          reg142 <= $unsigned((((-(wire8 && reg141)) ?
              (reg134 ? reg139 : $signed(wire1)) : ($unsigned(reg140) ?
                  (~|wire1) : (~^reg136))) != {(reg134[(2'h2):(1'h1)] ?
                  (+(8'hb5)) : (!reg133))}));
          reg143 <= (({((reg135 && wire6) ? $unsigned(reg136) : {wire9}),
              $unsigned((wire2 + (8'h9d)))} >= reg141) && {(8'h9f), wire131});
          if (reg137[(2'h3):(1'h1)])
            begin
              reg144 <= ((($signed($unsigned(wire3)) <= (~^(!(8'hbb)))) <<< (&wire5[(3'h6):(3'h6)])) ?
                  ((reg136 ~^ reg139) ?
                      (wire8[(3'h5):(1'h1)] ?
                          (wire7[(4'h8):(1'h1)] > {wire5,
                              wire7}) : (~$signed((8'ha2)))) : (wire6 ?
                          $signed(wire9[(4'ha):(3'h4)]) : $signed($signed(wire131)))) : (7'h44));
            end
          else
            begin
              reg144 <= $signed(reg139[(1'h0):(1'h0)]);
              reg145 <= $unsigned({$unsigned(($signed(reg137) ?
                      (reg133 ? wire0 : wire131) : {reg143})),
                  (!$signed(wire9[(3'h6):(1'h1)]))});
            end
          reg146 <= $unsigned($signed((($unsigned(reg141) ^~ $signed(wire7)) && (reg142[(4'h8):(3'h6)] == (~&wire8)))));
          reg147 <= wire1[(2'h3):(1'h1)];
        end
      else
        begin
          if ($signed((reg142 ?
              ($unsigned({reg140, wire7}) ?
                  {wire3[(5'h12):(4'hd)],
                      (~reg142)} : (reg145[(4'ha):(2'h3)] >= (wire131 > reg140))) : (8'h9d))))
            begin
              reg142 <= wire1;
              reg143 <= $signed(reg138);
              reg144 <= {(reg134 & ((((8'ha6) <= reg144) ?
                      $unsigned(reg147) : $signed(reg146)) <<< reg141)),
                  wire2[(3'h4):(1'h0)]};
              reg145 <= (-wire9);
            end
          else
            begin
              reg142 <= (((~$signed(wire1)) | {$unsigned((wire5 ?
                          wire4 : reg142)),
                      $signed(wire8)}) ?
                  $unsigned((~|({wire9,
                      reg134} & $signed(wire1)))) : (^$signed($unsigned((&reg134)))));
              reg143 <= reg145;
              reg144 <= wire0;
              reg145 <= (~|wire0);
              reg146 <= $unsigned(((((~^wire8) ?
                      reg147[(2'h2):(1'h1)] : (reg146 ?
                          reg145 : wire5)) >>> ((~reg143) >= reg146)) ?
                  {(|reg140[(5'h13):(4'h9)])} : (8'hac)));
            end
          reg147 <= (wire7[(5'h13):(5'h12)] ?
              wire3[(2'h2):(2'h2)] : (wire0 ? wire9 : wire2));
          if (reg133[(2'h2):(1'h1)])
            begin
              reg148 <= (wire3[(2'h3):(2'h3)] ?
                  (!$signed(((reg134 * reg141) ?
                      (&reg137) : (|reg141)))) : wire2);
            end
          else
            begin
              reg148 <= reg137[(1'h1):(1'h1)];
              reg149 <= reg145;
              reg150 <= (8'h9e);
              reg151 <= (^~reg145[(4'hb):(3'h5)]);
            end
          reg152 <= wire1;
          reg153 <= (reg145[(3'h6):(1'h0)] >>> (&$unsigned($unsigned((~|reg150)))));
        end
      reg154 <= wire7[(4'ha):(3'h4)];
    end
  assign wire155 = $signed((^~((reg135[(4'hc):(4'h9)] ?
                       {reg152, wire7} : {reg154,
                           wire6}) < ({reg147} > (reg153 ? reg147 : reg145)))));
  assign wire156 = $unsigned(wire3);
  assign wire157 = reg146[(1'h1):(1'h1)];
  assign wire158 = ($signed(wire0) == ($unsigned($unsigned(reg140)) ?
                       ((~&(8'ha6)) - ($signed(reg146) ?
                           (~|reg151) : (-reg148))) : $signed($signed((wire2 >>> (7'h41))))));
endmodule

module module10
#(parameter param130 = (+(((^(8'hb7)) + ((+(7'h44)) ? {(8'hb6)} : ((8'ha0) ? (8'haa) : (8'hb5)))) ~^ {(((7'h44) ? (8'ha4) : (8'ha5)) >> (~&(8'haf))), (((7'h40) == (8'ha3)) >>> ((8'hbc) ? (8'ha9) : (8'ha2)))})))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire14;
  input wire [(5'h12):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire12;
  input wire signed [(4'he):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire127;
  wire signed [(5'h13):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire124;
  wire [(5'h14):(1'h0)] wire122;
  wire signed [(5'h11):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire96;
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire122,
                 wire77,
                 wire29,
                 wire28,
                 wire27,
                 wire96,
                 reg15,
                 reg16,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= ((&$unsigned((~&(wire11 >= wire13)))) ?
          ($unsigned(({(8'ha3)} ?
              (wire12 ?
                  wire14 : (8'hbc)) : (wire11 | wire13))) & (wire14[(3'h6):(2'h2)] ?
              (wire14[(4'hd):(4'h8)] ?
                  wire13 : $signed(wire14)) : ($signed(wire11) && (wire13 == wire12)))) : $signed($signed(((wire14 * (8'hb6)) ?
              (wire14 >>> wire13) : $signed(wire13)))));
      reg16 <= $unsigned(wire13[(4'h9):(3'h4)]);
      if (wire11[(2'h2):(1'h1)])
        begin
          reg17 <= {(reg15 >> $unsigned(reg16[(3'h7):(1'h1)]))};
          reg18 <= {((($unsigned((8'h9c)) ?
                      (reg15 ? reg16 : reg17) : (reg16 - wire11)) ?
                  ((wire11 & wire11) ?
                      $unsigned(reg16) : reg15[(5'h11):(3'h6)]) : ($unsigned(reg17) ?
                      (reg17 <<< wire13) : $unsigned(wire13))) <<< reg16),
              ((|wire13) ? {(^~(^~wire11))} : $unsigned(reg16))};
          if (($unsigned(reg18) ^ (8'hbd)))
            begin
              reg19 <= wire11;
              reg20 <= (~|(wire12[(2'h2):(1'h1)] <<< reg17));
              reg21 <= {wire14,
                  ({((wire14 < wire11) ? reg15[(5'h10):(4'hb)] : (~(8'hae)))} ?
                      $unsigned($signed((reg19 ? reg20 : reg18))) : (8'hb2))};
              reg22 <= (|($unsigned((+(wire11 == reg19))) ^~ $unsigned($unsigned((reg18 | reg15)))));
              reg23 <= $unsigned($signed(wire13));
            end
          else
            begin
              reg19 <= (~|$signed(reg15));
            end
          reg24 <= reg21[(1'h1):(1'h1)];
          reg25 <= reg24[(3'h5):(1'h0)];
        end
      else
        begin
          reg17 <= reg18[(4'hd):(3'h5)];
          reg18 <= (^(reg18 ?
              ($signed(wire12) | $unsigned($unsigned((7'h44)))) : (~^{(^(8'ha6))})));
          reg19 <= reg20[(4'ha):(4'h8)];
        end
      reg26 <= $signed($unsigned($unsigned(reg24)));
    end
  assign wire27 = (&((((reg25 ? reg16 : reg17) ?
                      reg16 : (reg20 ?
                          reg25 : reg26)) | reg25[(1'h1):(1'h0)]) != $unsigned(reg19)));
  assign wire28 = reg17;
  assign wire29 = reg22[(4'h9):(4'h9)];
  module30 #() modinst78 (wire77, clk, reg26, reg16, wire27, reg21);
  module79 #() modinst97 (.wire81(reg25), .clk(clk), .wire83(reg21), .y(wire96), .wire82(wire12), .wire80(reg23));
  module98 #() modinst123 (wire122, clk, reg24, reg18, reg20, wire11, wire28);
  assign wire124 = ((^~$signed((wire12[(3'h5):(1'h1)] ?
                           (wire28 ? reg18 : wire77) : reg19))) ?
                       (reg17 ?
                           ($unsigned((wire27 ? reg24 : (8'hb6))) ?
                               reg19 : ({reg18} ?
                                   wire13 : (wire122 <<< wire96))) : $signed($unsigned($unsigned(wire11)))) : (!(&$signed($signed(wire29)))));
  assign wire125 = {(^wire96),
                       $unsigned(($signed((wire122 & reg16)) ^~ {(reg20 ?
                               wire28 : wire29),
                           (reg22 ^~ wire11)}))};
  assign wire126 = $unsigned({{(!$unsigned(reg22)), reg21[(1'h1):(1'h0)]}});
  assign wire127 = wire124;
  assign wire128 = ($unsigned({$signed((reg18 ? reg24 : wire29)),
                       (7'h44)}) ~^ $signed(($signed((+reg17)) ?
                       (-(-reg16)) : reg16)));
  assign wire129 = (wire11 | {$unsigned($unsigned((-wire13)))});
endmodule

module module98  (y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire103;
  input wire signed [(5'h13):(1'h0)] wire102;
  input wire [(4'hc):(1'h0)] wire101;
  input wire [(4'he):(1'h0)] wire100;
  input wire signed [(3'h7):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  assign y = {wire121,
                 wire111,
                 wire106,
                 wire105,
                 wire104,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire104 = $signed((&wire103));
  assign wire105 = wire103;
  assign wire106 = ($unsigned((+(~&wire104[(4'hd):(4'h9)]))) ?
                       wire101 : ({((wire103 ?
                               (8'hb1) : wire103) ^~ wire103[(4'hb):(3'h4)])} != ((^~$unsigned(wire100)) ?
                           $signed(wire100) : $signed(wire105[(4'h8):(2'h2)]))));
  always
    @(posedge clk) begin
      reg107 <= $signed(($unsigned($signed(wire102[(3'h6):(3'h5)])) ?
          $unsigned(((wire102 ? wire99 : (8'ha1)) ?
              (wire104 ? wire99 : wire105) : ((8'hb7) ?
                  wire101 : (8'hb1)))) : ($unsigned(wire103) <<< {wire99,
              (wire99 != wire106)})));
      reg108 <= $unsigned((!$signed($unsigned(wire101[(4'hc):(3'h4)]))));
    end
  always
    @(posedge clk) begin
      reg109 <= (~|$unsigned(reg107));
      reg110 <= ($signed($signed({reg108[(3'h5):(2'h2)],
          wire104[(2'h2):(1'h1)]})) && {(8'ha2), wire99});
    end
  assign wire111 = (~|reg107[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg112 <= $unsigned(wire99);
      reg113 <= $signed(wire104);
      reg114 <= (wire104[(4'hc):(4'h9)] ?
          {wire100} : $signed((^~$unsigned((reg113 >>> wire111)))));
      if ($unsigned($signed(($signed(((7'h40) ?
          wire105 : wire106)) << ($signed(reg108) ?
          $signed(reg114) : wire105)))))
        begin
          reg115 <= (~|(~^$unsigned((~|{wire111}))));
        end
      else
        begin
          if ((8'hbd))
            begin
              reg115 <= (|$signed(((~&wire102) ?
                  $signed({wire104, wire102}) : $signed($unsigned(reg108)))));
            end
          else
            begin
              reg115 <= $unsigned($unsigned(reg110[(4'ha):(3'h7)]));
              reg116 <= $unsigned(wire106);
              reg117 <= (-$unsigned(wire101));
              reg118 <= reg116;
              reg119 <= (&(+({reg107} ?
                  ((~|reg112) ? {reg116} : (-reg109)) : (-wire105))));
            end
        end
      reg120 <= (wire101 ? {$signed((~$signed(reg107))), wire105} : wire104);
    end
  assign wire121 = (~^(({$signed(wire102),
                       reg112[(3'h4):(2'h3)]} || $signed({reg114,
                       reg114})) & ({reg109} ?
                       (|wire100) : $signed(((7'h41) > wire105)))));
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire83;
  input wire signed [(4'hd):(1'h0)] wire82;
  input wire [(3'h7):(1'h0)] wire81;
  input wire signed [(5'h15):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire84 = ({({$unsigned(wire82)} + ($signed(wire80) >>> wire80[(4'hb):(3'h7)]))} ?
                      (+$signed((wire80[(3'h5):(3'h4)] | $unsigned(wire83)))) : ((wire81 ^ (|wire83)) ?
                          wire82[(3'h7):(3'h4)] : $signed(wire80)));
  assign wire85 = (!(wire84 & wire84));
  assign wire86 = ((wire84 ?
                      (~&$unsigned(((8'hb8) ?
                          (8'hac) : wire80))) : wire84) ~^ $unsigned((wire80 ?
                      wire84 : wire85)));
  assign wire87 = wire84;
  assign wire88 = ((!(|$unsigned((wire81 >> wire85)))) ?
                      $signed($unsigned($unsigned((wire86 >> wire87)))) : $signed($signed(({wire85} ?
                          (~(8'hbf)) : ((8'ha9) <= wire83)))));
  assign wire89 = (wire83[(1'h1):(1'h1)] >= wire88[(3'h4):(3'h4)]);
  assign wire90 = wire87;
  assign wire91 = ($unsigned((((wire82 >> wire84) ?
                          (wire86 ?
                              wire89 : wire84) : $unsigned(wire86)) < (&$unsigned(wire89)))) ?
                      ({(~wire80[(5'h13):(2'h3)])} << ($unsigned({wire86}) & $signed(((8'hba) || wire81)))) : ((($unsigned((8'ha9)) >= $unsigned(wire86)) & $unsigned($signed(wire90))) ?
                          $unsigned(((8'hbb) ?
                              {wire90} : wire85[(1'h0):(1'h0)])) : wire80));
  assign wire92 = wire80;
  assign wire93 = wire84[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg94 <= (~$unsigned((wire86[(1'h1):(1'h1)] ?
          wire87[(3'h7):(3'h5)] : ($signed((8'h9c)) ?
              wire86 : (wire88 < wire93)))));
      reg95 <= (~&{$signed({$signed(wire90), (wire86 ~^ (8'hb8))}),
          $signed($signed((reg94 ? wire92 : wire82)))});
    end
endmodule

module module30
#(parameter param75 = {((-{((8'hbb) ? (8'hb6) : (8'hbb))}) > ((((8'ha6) ? (8'ha4) : (8'ha7)) ? (~|(8'hbc)) : ((8'ha4) ? (7'h44) : (7'h41))) ~^ ((~^(8'hbd)) <= ((8'hb0) ? (8'ha0) : (8'hb6))))), (((~&((8'ha1) ? (8'hac) : (8'hbd))) ? (((8'hb2) >>> (8'h9d)) <= ((8'h9e) || (8'hb0))) : {((8'ha0) ? (8'h9e) : (7'h43)), ((8'hb7) ? (8'ha6) : (8'had))}) + ((((8'hb6) ? (8'hb0) : (8'ha2)) ? {(8'hbe)} : ((8'hbb) ? (8'haf) : (8'h9d))) ? {((8'hb0) ? (8'hbe) : (7'h42)), {(8'hb1), (8'ha5)}} : ((~^(8'ha0)) <<< ((8'ha0) == (8'hac)))))}, 
parameter param76 = (!(-param75)))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire34;
  input wire signed [(4'he):(1'h0)] wire33;
  input wire [(3'h6):(1'h0)] wire32;
  input wire [(3'h6):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
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
                 reg43,
                 (1'h0)};
  assign wire35 = (-$unsigned($signed(((!wire32) ?
                      $unsigned((8'had)) : wire32))));
  assign wire36 = wire33;
  assign wire37 = (~^(~wire36[(1'h1):(1'h1)]));
  assign wire38 = $signed((|$unsigned(wire33[(3'h4):(1'h1)])));
  assign wire39 = {(8'ha4)};
  assign wire40 = $unsigned((-wire34[(3'h5):(3'h4)]));
  assign wire41 = $unsigned((wire31[(3'h5):(1'h1)] ?
                      $unsigned(wire39) : (~(~&{wire35}))));
  assign wire42 = (wire35[(3'h5):(3'h4)] <<< ($unsigned((-(&wire31))) > ($signed($unsigned(wire32)) ?
                      ((-wire32) ?
                          $signed(wire35) : (wire36 & wire34)) : $signed($unsigned((8'ha3))))));
  always
    @(posedge clk) begin
      if ($signed({$unsigned($unsigned($signed(wire39)))}))
        begin
          if ((($unsigned(wire33) && {(!{wire37, wire33}),
              wire40[(4'h8):(3'h4)]}) ^ (wire41 << wire31)))
            begin
              reg43 <= ((^wire32) ?
                  wire33 : $unsigned($signed(wire35[(4'h9):(2'h3)])));
              reg44 <= ($signed($unsigned($unsigned((wire38 ^~ wire35)))) ?
                  wire33 : ((-wire35) != $signed((-(~wire41)))));
              reg45 <= wire35[(2'h3):(1'h1)];
              reg46 <= $unsigned(($signed((~^(wire42 * wire40))) ?
                  (~^$signed({(8'ha3), (8'ha4)})) : {$signed($signed(wire41)),
                      ((~&(8'h9d)) || $unsigned(wire35))}));
              reg47 <= (($unsigned(wire34) && reg44[(4'h8):(3'h5)]) > $unsigned({($signed(reg46) & (&wire34))}));
            end
          else
            begin
              reg43 <= $signed($unsigned((($unsigned((7'h42)) ?
                      (wire38 ? wire35 : wire42) : $signed(wire40)) ?
                  {(wire31 > reg47)} : $unsigned((!wire40)))));
              reg44 <= reg47[(3'h4):(1'h0)];
              reg45 <= $unsigned(($unsigned({wire37[(4'hd):(3'h7)]}) ?
                  $unsigned(wire41) : (($signed(wire42) ?
                          (~&wire36) : $unsigned(reg47)) ?
                      $unsigned((wire34 ? wire37 : (8'h9c))) : wire31)));
              reg46 <= ((-($signed({(8'h9e)}) ?
                  (^~(reg44 ?
                      wire32 : wire37)) : wire33[(4'he):(4'h9)])) | $signed(wire41[(3'h4):(2'h2)]));
              reg47 <= $signed(((-((^reg47) ? reg44 : wire37[(3'h7):(3'h7)])) ?
                  $unsigned({(wire33 ? wire40 : reg44),
                      (^reg44)}) : ($signed((wire39 ? reg46 : wire40)) ?
                      wire42[(3'h6):(3'h5)] : $signed(reg45))));
            end
          reg48 <= $unsigned($signed(wire39));
          reg49 <= $unsigned(($unsigned(reg45[(3'h4):(1'h1)]) & $unsigned(reg48[(3'h5):(1'h1)])));
          reg50 <= (wire37 ?
              (^$unsigned(($signed(reg48) ?
                  $signed(wire40) : {(8'hb1), reg45}))) : (wire33 ?
                  $unsigned(reg46[(1'h1):(1'h1)]) : {(|(reg46 ?
                          wire33 : wire37)),
                      $unsigned($unsigned((7'h40)))}));
        end
      else
        begin
          if ($signed($signed(($signed(reg43) ? wire41 : (~^$signed(wire41))))))
            begin
              reg43 <= {$unsigned($signed(wire33)),
                  ((!wire35[(3'h6):(1'h0)]) < $signed(wire37))};
              reg44 <= {((|(~|(wire42 < wire31))) >>> wire34[(2'h2):(2'h2)])};
              reg45 <= $unsigned(({$unsigned((reg44 ?
                      reg46 : wire34))} ~^ $signed({(-reg48),
                  (wire42 ? reg44 : wire40)})));
              reg46 <= (($unsigned(wire35[(5'h10):(2'h2)]) != $signed(wire37)) & (!reg46));
            end
          else
            begin
              reg43 <= $signed($signed(wire37));
              reg44 <= $signed($signed({wire33[(4'ha):(3'h4)]}));
              reg45 <= wire33;
              reg46 <= $unsigned((($unsigned({(8'hb2),
                  reg49}) | (~^(reg49 | wire34))) <<< (~|((~&wire41) - (wire42 ?
                  (8'hae) : wire34)))));
              reg47 <= (reg50 ?
                  $signed($signed(wire36)) : (!wire39[(4'hc):(3'h4)]));
            end
          if ({((({reg48, reg48} ?
                      (wire41 ^~ wire38) : (reg49 ? reg49 : reg49)) ?
                  wire33 : $signed($unsigned(wire39))) ~^ ($unsigned((wire40 == reg50)) + reg43))})
            begin
              reg48 <= wire40[(3'h5):(1'h0)];
              reg49 <= reg45;
              reg50 <= reg49;
            end
          else
            begin
              reg48 <= (8'hbe);
            end
          reg51 <= (({(~&{wire40, reg46})} ?
                  reg45 : ($unsigned((wire36 << wire38)) ?
                      reg46 : (reg47 ?
                          wire38[(4'h9):(1'h1)] : {wire31, wire33}))) ?
              wire32 : (((8'hb5) < wire41[(3'h5):(2'h3)]) ?
                  (^(~(wire36 ?
                      wire40 : wire38))) : ((wire37 <<< (~(8'hbb))) <= {(|wire36)})));
          if ($unsigned(((8'hac) ?
              $signed(reg43[(2'h2):(1'h1)]) : $unsigned(((reg48 ?
                  wire39 : reg50) <<< wire40)))))
            begin
              reg52 <= (((wire40[(5'h11):(4'hb)] ^~ $unsigned($unsigned(reg49))) ^ ($signed({reg49}) || $signed($unsigned(wire37)))) < (({(+(8'hb2))} >>> ((!wire37) && (wire36 ?
                      (8'ha8) : reg50))) ?
                  reg48 : (~reg43)));
              reg53 <= $unsigned(wire37[(2'h3):(1'h1)]);
              reg54 <= $unsigned((^reg48));
            end
          else
            begin
              reg52 <= (~&(8'ha1));
              reg53 <= ((({(reg48 ? (8'ha6) : (8'hb9)), wire36[(1'h0):(1'h0)]} ?
                  $unsigned((reg48 - reg49)) : {((8'hab) <<< reg53),
                      ((8'hb2) - reg46)}) - $signed($signed((reg51 != reg53)))) <= (reg52[(4'he):(4'h8)] * {({wire38} ~^ (wire33 ?
                      wire34 : reg52)),
                  (~^(^(7'h43)))}));
              reg54 <= wire40[(3'h6):(3'h5)];
            end
        end
      reg55 <= ((^wire38[(5'h10):(2'h3)]) + wire36);
      reg56 <= reg43[(4'hc):(4'h9)];
    end
  always
    @(posedge clk) begin
      reg57 <= {wire38[(5'h12):(4'ha)], reg54[(4'h8):(1'h0)]};
    end
  assign wire58 = (~^reg44);
  assign wire59 = {(|reg43), reg51[(4'hb):(3'h5)]};
  assign wire60 = wire37[(1'h1):(1'h0)];
  assign wire61 = (~$unsigned((wire34 != $signed((~^(8'ha9))))));
  assign wire62 = reg51;
  assign wire63 = reg52[(1'h1):(1'h1)];
  assign wire64 = (8'hbd);
  assign wire65 = (+reg53);
  always
    @(posedge clk) begin
      reg66 <= ($signed({$unsigned((+wire35))}) >> wire37[(2'h3):(2'h2)]);
      reg67 <= wire60;
      reg68 <= $signed($unsigned(wire59));
      reg69 <= {(~^(+{reg55[(1'h0):(1'h0)]})), wire59[(4'he):(4'h8)]};
      reg70 <= $unsigned(((reg53[(1'h0):(1'h0)] + (reg54[(3'h4):(3'h4)] <<< wire31)) ?
          ($unsigned({reg68, wire58}) ?
              $signed(wire37) : (^$signed(reg68))) : ($signed(reg53[(2'h3):(1'h1)]) ~^ reg49[(4'hc):(4'hc)])));
    end
  assign wire71 = (~(reg47[(1'h1):(1'h0)] == wire63[(3'h4):(1'h0)]));
  assign wire72 = reg66;
  assign wire73 = (7'h44);
  assign wire74 = {{wire32[(2'h2):(1'h1)], reg66[(1'h1):(1'h0)]}, (7'h40)};
endmodule
