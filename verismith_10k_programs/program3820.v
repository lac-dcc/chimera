module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  assign y = {wire135, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire2[(4'h9):(1'h1)];
  assign wire5 = ($signed($signed(wire2)) ^ wire2);
  assign wire6 = (~$unsigned({(wire5 && wire3)}));
  assign wire7 = wire1[(1'h0):(1'h0)];
  assign wire8 = ({wire7, (&$signed((+wire5)))} ?
                     $unsigned(wire2[(4'h8):(3'h6)]) : $signed((wire3 | (wire2[(4'h8):(3'h6)] ?
                         $signed(wire1) : {wire6, wire3}))));
  module9 #() modinst136 (wire135, clk, wire0, wire6, wire4, wire3);
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire133;
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  assign y = {wire56,
                 wire24,
                 wire23,
                 wire15,
                 wire14,
                 wire58,
                 wire133,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  assign wire14 = $signed((&wire13[(1'h0):(1'h0)]));
  assign wire15 = wire10;
  always
    @(posedge clk) begin
      if ($signed((wire10[(5'h10):(3'h7)] == wire11[(4'hb):(1'h0)])))
        begin
          reg16 <= wire10;
          if (((~($unsigned({wire12}) ?
              $signed($signed((8'ha2))) : $signed((+(8'ha1))))) >> $signed({reg16})))
            begin
              reg17 <= $signed($unsigned($signed(((reg16 ? wire14 : wire11) ?
                  (~(8'ha7)) : $signed(wire10)))));
              reg18 <= (^(^~{((~reg17) ? (wire15 >> wire13) : $signed((8'hae))),
                  {(~|(8'h9f)), ((7'h42) ? reg17 : wire15)}}));
            end
          else
            begin
              reg17 <= $signed(reg18[(2'h3):(1'h0)]);
              reg18 <= (7'h42);
              reg19 <= wire13;
              reg20 <= (8'hbd);
            end
        end
      else
        begin
          reg16 <= reg20;
          reg17 <= $unsigned((reg16 ^ wire14));
          reg18 <= reg18;
          reg19 <= wire12[(1'h0):(1'h0)];
        end
      reg21 <= $signed(wire10);
      reg22 <= (wire15[(3'h7):(2'h2)] + reg20);
    end
  assign wire23 = reg19[(2'h2):(1'h0)];
  assign wire24 = (|reg22[(2'h2):(1'h0)]);
  module25 #() modinst57 (.y(wire56), .wire29(reg18), .wire26(wire13), .clk(clk), .wire27(wire24), .wire28(wire12));
  assign wire58 = ({$unsigned(wire12), (!$unsigned(reg17))} ?
                      wire14 : ({((reg21 > wire15) ?
                              $signed(reg20) : $signed(wire14))} << {$signed((reg19 ?
                              wire14 : wire56)),
                          wire11}));
  module59 #() modinst134 (.wire64(wire14), .clk(clk), .wire60(reg21), .wire62(wire15), .y(wire133), .wire61(wire24), .wire63(reg20));
endmodule

module module59
#(parameter param131 = ((((((8'hbd) > (7'h44)) * ((8'ha5) != (8'hb9))) ? ((&(8'hab)) - ((8'hbb) ? (8'hbd) : (8'hb9))) : (((7'h40) ? (8'hab) : (8'haa)) ? (+(8'hbf)) : (8'hbc))) ? ((8'h9f) << ({(8'hb9), (8'ha1)} ? (~(8'hb2)) : ((8'hb9) * (8'ha2)))) : ((((8'hb2) ? (8'ha4) : (8'h9d)) > ((8'ha5) * (8'ha1))) + ((~|(8'hb4)) ? ((8'haf) << (8'ha1)) : ((8'hb7) ^~ (8'ha0))))) > {{(|((8'hb9) ? (8'hbe) : (8'hbb))), (+(+(8'ha0)))}}), 
parameter param132 = ((param131 ? (~|{{param131}}) : (((param131 <= param131) ? (~param131) : (param131 * param131)) && {(~|(8'ha4))})) ? ((~param131) <<< (-param131)) : (!(-(+param131)))))
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h2fc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire64;
  input wire [(2'h2):(1'h0)] wire63;
  input wire [(4'hc):(1'h0)] wire62;
  input wire [(4'he):(1'h0)] wire61;
  input wire [(4'ha):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire129;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire104;
  wire signed [(4'ha):(1'h0)] wire103;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire65;
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire65,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
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
                 reg79,
                 reg78,
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
                 (1'h0)};
  assign wire65 = (wire63 && wire63[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg66 <= ({(((wire64 ? wire63 : wire62) & (wire60 || wire63)) ?
              wire64[(2'h2):(1'h0)] : wire62[(1'h0):(1'h0)])} * ((~^wire61[(4'he):(3'h6)]) ?
          wire62[(4'hc):(4'hb)] : (8'hb3)));
      if ((~&$unsigned($signed({(wire65 ^~ wire61), {wire62}}))))
        begin
          reg67 <= wire62[(3'h7):(3'h4)];
          reg68 <= wire60;
          if ((+reg66))
            begin
              reg69 <= (^~$unsigned(((8'h9c) ? reg66 : reg68[(2'h2):(1'h0)])));
              reg70 <= wire60[(2'h2):(2'h2)];
              reg71 <= reg70;
            end
          else
            begin
              reg69 <= $unsigned({{wire61[(2'h3):(1'h1)], wire63},
                  (~&(!{reg66}))});
            end
          reg72 <= {(reg67[(2'h2):(2'h2)] >= {(^wire61[(3'h5):(3'h4)]),
                  (8'hb9)}),
              wire63[(1'h0):(1'h0)]};
          if (reg71[(4'hc):(4'h8)])
            begin
              reg73 <= {$signed($unsigned(wire62[(2'h3):(2'h2)]))};
              reg74 <= $signed(($signed({(^~reg72)}) ?
                  (($unsigned(wire65) ?
                      reg70 : (wire65 ?
                          reg70 : reg72)) && (-(^reg73))) : $unsigned(($signed(wire60) ?
                      (^wire64) : $signed((8'hbb))))));
              reg75 <= $signed(((reg66[(2'h2):(2'h2)] ?
                  (~&$signed(wire65)) : (&(8'hb0))) ^~ $unsigned({wire65[(2'h2):(2'h2)]})));
              reg76 <= (~&reg67[(4'ha):(1'h0)]);
            end
          else
            begin
              reg73 <= (((|((8'haf) && (wire62 ?
                      reg71 : (8'hb9)))) <= $unsigned(($signed(reg75) ^ (wire65 ?
                      (7'h41) : wire62)))) ?
                  {({(~^wire62), reg66[(3'h4):(2'h3)]} ?
                          (^~(reg69 | (8'hbd))) : {$unsigned(wire63)})} : $signed(($unsigned(reg68) ^~ {$unsigned(reg70)})));
              reg74 <= $signed($unsigned($signed((wire60[(3'h4):(2'h2)] | reg71))));
              reg75 <= $unsigned((wire62[(4'hc):(4'hc)] * ((+$unsigned(reg75)) + $unsigned(reg69))));
            end
        end
      else
        begin
          if ({($unsigned($signed(reg70)) + (((8'ha3) != reg74[(3'h4):(3'h4)]) ?
                  $signed(reg70[(5'h14):(4'hf)]) : $signed((reg71 ?
                      wire60 : wire62))))})
            begin
              reg67 <= $signed($unsigned($unsigned($unsigned(reg72))));
              reg68 <= {(^((reg67 << wire61[(3'h7):(1'h0)]) ?
                      reg72[(2'h2):(1'h1)] : ((reg76 >> (7'h40)) ?
                          (reg71 ? reg74 : wire60) : reg75[(1'h1):(1'h0)])))};
              reg69 <= $signed({reg71[(1'h1):(1'h0)]});
              reg70 <= reg68[(4'h9):(2'h2)];
            end
          else
            begin
              reg67 <= ({$unsigned($signed($signed(wire65))),
                  (+reg74[(2'h3):(1'h1)])} >= (8'hb4));
              reg68 <= (wire61 ?
                  ($unsigned($signed((wire60 || (8'haf)))) ?
                      wire63 : ($signed(reg72[(3'h6):(2'h2)]) ?
                          ($unsigned(reg72) ?
                              reg71 : $signed((8'ha0))) : {(-(8'hab))})) : (~^(~wire61[(4'hb):(4'h8)])));
            end
        end
      reg77 <= reg70;
      reg78 <= wire60[(4'ha):(3'h5)];
      reg79 <= wire65[(2'h3):(2'h3)];
    end
  assign wire80 = (8'h9c);
  assign wire81 = reg77;
  assign wire82 = (-((~(|(reg67 && (8'hb6)))) ?
                      (((+(8'ha8)) ?
                          (reg75 ?
                              wire81 : reg79) : ((8'ha1) >= reg77)) >> $unsigned((!(8'ha4)))) : $signed((reg66[(4'hb):(3'h6)] ?
                          $signed(reg75) : $unsigned(reg73)))));
  assign wire83 = {$signed((((reg75 ~^ reg72) & reg78[(1'h0):(1'h0)]) ?
                          ($unsigned(wire82) ~^ (reg70 ?
                              reg69 : (8'hb2))) : wire80[(3'h6):(3'h6)])),
                      wire82};
  assign wire84 = wire82;
  assign wire85 = (~^(reg78 ?
                      wire62[(4'h8):(2'h3)] : {((reg71 && wire63) == wire84)}));
  assign wire86 = $signed(wire80[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      reg87 <= (!wire61[(4'ha):(4'h8)]);
      if ((wire83 ? reg70 : $unsigned(reg69[(3'h6):(2'h3)])))
        begin
          if (wire84[(3'h7):(2'h3)])
            begin
              reg88 <= wire63;
              reg89 <= reg87;
              reg90 <= (&(+wire82));
              reg91 <= ((8'ha5) ^ $unsigned((($unsigned(wire82) ?
                  (wire63 ? wire61 : reg74) : $signed(wire85)) | (~^(reg79 ?
                  (8'hb5) : (7'h44))))));
              reg92 <= wire85[(4'ha):(2'h2)];
            end
          else
            begin
              reg88 <= reg71;
              reg89 <= $signed(reg79[(2'h3):(2'h3)]);
            end
          reg93 <= $signed($unsigned((~^wire60[(1'h1):(1'h1)])));
          reg94 <= reg78[(4'hf):(4'hb)];
          reg95 <= reg73[(1'h1):(1'h0)];
          reg96 <= $signed($unsigned({$unsigned(((8'had) ? wire64 : reg67)),
              $signed($signed(reg67))}));
        end
      else
        begin
          if ($signed($signed($signed(($unsigned(wire65) <= (^reg89))))))
            begin
              reg88 <= (wire81[(1'h0):(1'h0)] ?
                  (reg75[(1'h0):(1'h0)] && $signed(reg73)) : ({(^~reg89[(5'h11):(3'h6)]),
                      $unsigned((&wire63))} >> reg87[(3'h6):(3'h6)]));
              reg89 <= ($signed(reg95) > ((8'ha2) == (!($unsigned(reg94) ?
                  {(8'hab), reg93} : {wire60, reg87}))));
              reg90 <= ($unsigned(({reg87, $signed(wire62)} ?
                  (^(reg78 ?
                      reg87 : reg90)) : reg75)) >> wire83[(2'h2):(1'h0)]);
              reg91 <= $signed(((&(|$unsigned(reg70))) ?
                  ((wire62 < (wire81 <<< (8'hbb))) ?
                      ($unsigned(reg79) ?
                          $unsigned(reg71) : wire82[(1'h1):(1'h1)]) : (wire64[(1'h0):(1'h0)] ?
                          $unsigned(reg94) : (wire61 ?
                              (8'hb5) : (8'ha5)))) : reg79));
            end
          else
            begin
              reg88 <= reg78[(4'h8):(2'h2)];
            end
          if ({reg92[(4'ha):(3'h4)]})
            begin
              reg92 <= reg77;
              reg93 <= ({reg89} ?
                  reg69 : (((~((8'haa) | wire83)) - wire60) ?
                      (^$unsigned(wire80[(3'h4):(1'h1)])) : ($signed(reg95) || (^reg88))));
              reg94 <= $unsigned(reg94);
              reg95 <= $unsigned($signed(((8'ha9) ^~ (|(~wire61)))));
            end
          else
            begin
              reg92 <= $signed($signed((wire61 ? wire61 : $signed(wire64))));
              reg93 <= {($signed($signed(reg67)) <<< $signed(reg79[(3'h5):(2'h3)])),
                  (^(wire64[(3'h4):(1'h1)] || $unsigned($unsigned(reg92))))};
            end
          if (wire83[(3'h7):(3'h6)])
            begin
              reg96 <= {reg93};
              reg97 <= ($unsigned(((~^wire86[(4'ha):(3'h4)]) ?
                      reg91[(1'h0):(1'h0)] : (reg91[(2'h2):(2'h2)] >>> $unsigned(reg73)))) ?
                  ({$unsigned((7'h42)),
                      (reg89[(3'h4):(1'h1)] ?
                          $signed(reg69) : (+reg88))} || wire62[(4'h9):(4'h8)]) : reg88[(1'h0):(1'h0)]);
            end
          else
            begin
              reg96 <= $unsigned($unsigned($unsigned((&$signed(reg70)))));
            end
          reg98 <= (wire65 * (reg96[(4'he):(3'h7)] ?
              $unsigned(($unsigned(reg68) == reg69)) : reg95));
          reg99 <= (wire63 ?
              reg67[(3'h7):(2'h3)] : ($unsigned(reg68[(5'h10):(4'hd)]) * $unsigned($unsigned(((8'ha5) | reg93)))));
        end
      reg100 <= $unsigned(({$unsigned($signed(wire86)),
          $signed((~reg91))} <= reg70[(1'h0):(1'h0)]));
      reg101 <= reg100;
      reg102 <= {(-$signed($signed(((8'ha2) ^~ (8'hbc)))))};
    end
  assign wire103 = $unsigned($unsigned((^(8'hb6))));
  assign wire104 = $unsigned(wire63);
  assign wire105 = wire84;
  assign wire106 = (~($signed($signed((^wire64))) - $unsigned($unsigned($unsigned(reg75)))));
  always
    @(posedge clk) begin
      reg107 <= $signed($signed((reg89[(5'h14):(3'h7)] >>> $signed(((8'ha6) ^~ (8'hbd))))));
      if (reg88)
        begin
          if (($unsigned(reg98[(4'hc):(2'h2)]) ?
              ((-(^~reg90)) ?
                  reg99 : $signed((~^$unsigned(reg100)))) : {reg101[(2'h2):(1'h0)]}))
            begin
              reg108 <= $unsigned({reg101[(1'h0):(1'h0)],
                  $unsigned($unsigned((&(8'hb3))))});
            end
          else
            begin
              reg108 <= $unsigned((^$unsigned({(reg74 | wire103),
                  reg66[(3'h7):(1'h1)]})));
              reg109 <= $unsigned(wire104);
            end
        end
      else
        begin
          reg108 <= wire85[(5'h11):(1'h1)];
          reg109 <= reg69;
          reg110 <= (!($unsigned(reg78) * $unsigned($signed((reg109 | wire63)))));
          reg111 <= $signed($signed(((-(wire60 ?
              (8'hbb) : reg102)) << ($unsigned(reg89) && {(8'h9f), reg76}))));
          reg112 <= reg90[(3'h4):(3'h4)];
        end
    end
  assign wire113 = {(-{((reg72 ? wire61 : reg107) != reg70[(3'h5):(3'h4)])})};
  assign wire114 = (reg109[(3'h5):(1'h0)] ? wire82 : (~^$unsigned(reg112)));
  assign wire115 = (~|($signed({(!reg88), $unsigned(wire60)}) ?
                       $unsigned(((reg68 ~^ reg77) ?
                           reg111 : $signed((8'ha4)))) : ({((8'ha2) && reg101),
                           $unsigned(reg96)} || wire114)));
  assign wire116 = reg96;
  always
    @(posedge clk) begin
      reg117 <= (8'hb6);
      reg118 <= $signed($signed(reg89));
    end
  always
    @(posedge clk) begin
      reg119 <= $signed(wire116);
      if (reg110)
        begin
          reg120 <= $signed({wire80[(5'h11):(2'h2)],
              $signed({(&reg93), reg95[(1'h0):(1'h0)]})});
          reg121 <= reg100;
          if ($signed($unsigned({{reg99, reg78}})))
            begin
              reg122 <= $signed(wire103);
              reg123 <= (-{((((8'hb6) ?
                      (8'ha4) : reg73) <<< $unsigned(wire104)) > $unsigned(reg90))});
              reg124 <= wire65[(1'h1):(1'h0)];
            end
          else
            begin
              reg122 <= wire116[(3'h5):(3'h4)];
              reg123 <= $signed((8'h9e));
              reg124 <= ((reg100 ? (~|reg112[(3'h4):(1'h0)]) : reg122) ?
                  $signed(reg71) : (wire114 >>> ($unsigned({reg121,
                      wire63}) << (((8'hbe) >> (8'hb8)) & {wire106}))));
            end
          reg125 <= ((($signed($signed(reg79)) ^~ (!reg124)) >>> ((reg97[(3'h5):(2'h3)] ?
              {reg122} : reg79[(1'h0):(1'h0)]) >= (-wire103[(3'h5):(2'h2)]))) ^~ $unsigned(((reg66 ?
              (wire62 + (7'h42)) : wire115) & {wire63})));
          reg126 <= (~|(($signed($unsigned(wire64)) ?
                  ({(8'hac), reg122} ^ {wire64,
                      reg108}) : {reg76[(1'h0):(1'h0)], $signed(reg87)}) ?
              (((~&reg66) * $unsigned(reg109)) ?
                  (~|$unsigned(reg97)) : wire81) : $signed((reg99[(1'h0):(1'h0)] ?
                  (reg102 ? (8'h9f) : reg73) : reg112[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg120 <= ($signed($signed(wire84)) ^ reg75[(4'hb):(2'h2)]);
        end
      reg127 <= ($signed(wire84) ? reg120[(5'h15):(4'hc)] : (!wire64));
      reg128 <= wire113[(1'h0):(1'h0)];
    end
  assign wire129 = $unsigned(wire103[(3'h7):(3'h5)]);
  assign wire130 = wire86[(5'h13):(4'hb)];
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire29;
  input wire [(5'h13):(1'h0)] wire28;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire44,
                 wire43,
                 wire42,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire30 = (^~($signed($signed((wire27 ^ wire28))) & wire27[(4'h8):(3'h5)]));
  assign wire31 = wire30;
  assign wire32 = (8'hb1);
  assign wire33 = (($signed($signed(wire30)) | (&{(wire28 ? wire26 : wire27),
                          (~&(8'h9f))})) ?
                      $unsigned((~^$signed({wire31,
                          wire32}))) : $signed({(~^{wire29, wire29})}));
  always
    @(posedge clk) begin
      if ((!{wire28, $signed(wire29[(4'hc):(4'ha)])}))
        begin
          reg34 <= wire28;
          if ($unsigned(wire28[(3'h4):(3'h4)]))
            begin
              reg35 <= wire33[(4'h9):(4'h8)];
              reg36 <= (!$signed(wire27[(1'h0):(1'h0)]));
            end
          else
            begin
              reg35 <= wire28[(3'h7):(3'h4)];
              reg36 <= (reg36 ^ (wire29 ?
                  {wire33[(2'h3):(1'h0)],
                      wire28} : $unsigned(((wire27 <= wire27) >>> (wire32 << reg36)))));
              reg37 <= wire33;
              reg38 <= (|((((reg36 >= wire31) ?
                          (wire31 - wire28) : wire30[(4'ha):(4'ha)]) ?
                      (wire29 * (^reg36)) : reg37) ?
                  $unsigned($signed($unsigned(wire32))) : (|{$unsigned(wire26)})));
              reg39 <= {(wire31 ?
                      ((reg35[(4'h8):(1'h1)] ? wire33 : reg37[(3'h5):(1'h1)]) ?
                          ((wire33 ? wire33 : wire29) ?
                              $unsigned(wire30) : wire26[(4'hd):(3'h5)]) : reg38[(1'h1):(1'h0)]) : wire27[(4'h8):(3'h4)]),
                  $signed({(~$signed(wire29))})};
            end
        end
      else
        begin
          if ($signed({(8'haa)}))
            begin
              reg34 <= {(^~(reg38[(1'h0):(1'h0)] ?
                      (wire30 == {wire27, wire29}) : reg37))};
              reg35 <= wire26;
              reg36 <= reg36;
              reg37 <= ((8'hbd) ?
                  {wire30} : ((~^$signed((~reg36))) ?
                      $signed((+{reg36})) : (((reg35 <= reg37) <= (~wire33)) || {wire28[(3'h7):(2'h3)],
                          wire28[(4'hd):(4'ha)]})));
            end
          else
            begin
              reg34 <= $unsigned((wire32[(3'h6):(3'h5)] != (8'hb8)));
              reg35 <= {$signed(wire30)};
            end
          reg38 <= $unsigned(wire30);
        end
      reg40 <= wire26[(3'h4):(2'h3)];
      reg41 <= wire26;
    end
  assign wire42 = $unsigned((!$signed((~wire26[(4'h8):(3'h6)]))));
  assign wire43 = (wire29 ?
                      $signed($signed((8'hb4))) : $signed((reg35[(2'h3):(1'h1)] ^ ($unsigned(wire33) - (!wire31)))));
  assign wire44 = reg35;
  always
    @(posedge clk) begin
      reg45 <= reg41;
      reg46 <= wire42[(3'h4):(3'h4)];
      reg47 <= $signed(wire31);
      reg48 <= $unsigned((wire27[(1'h0):(1'h0)] > ($unsigned(wire28[(2'h2):(2'h2)]) ?
          ((~wire30) ?
              (reg36 || (8'ha6)) : {wire32, wire42}) : wire26[(4'h9):(4'h9)])));
    end
  assign wire49 = ((-$unsigned(reg34[(5'h10):(2'h3)])) ?
                      ($unsigned(reg35) - $signed(reg41[(3'h5):(2'h2)])) : ((((&reg41) ?
                                  wire43[(4'h9):(2'h2)] : (reg40 ?
                                      (8'ha3) : reg48)) ?
                              {((8'hb4) ^ wire33)} : $signed($unsigned(wire44))) ?
                          $signed({reg45[(1'h0):(1'h0)]}) : (!wire32)));
  assign wire50 = (-(reg38 << ((~(wire29 ^ reg37)) * (reg41[(1'h0):(1'h0)] || (wire30 ?
                      reg35 : wire43)))));
  assign wire51 = ((($unsigned(((8'hb8) ? reg46 : wire50)) != wire29) ?
                      {reg39} : {((wire43 >= (7'h40)) || reg38[(1'h1):(1'h0)])}) ^ (~^wire27[(1'h1):(1'h0)]));
  assign wire52 = ($unsigned((!((reg39 << (8'hb2)) ?
                      (wire33 ?
                          (7'h42) : (8'hab)) : $unsigned(wire29)))) + reg35[(4'hd):(3'h6)]);
  assign wire53 = {{$unsigned(reg46), $signed($signed((~|wire42)))}};
  assign wire54 = reg46;
  assign wire55 = (&$unsigned((((reg37 >> wire52) ?
                          $unsigned(wire42) : wire29) ?
                      $unsigned({wire50}) : ($unsigned(wire49) ^ wire44[(1'h1):(1'h0)]))));
endmodule
