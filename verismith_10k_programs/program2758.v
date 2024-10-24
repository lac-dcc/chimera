module top
#(parameter param146 = ({({{(8'hb3), (8'hb4)}} <= (((8'hbf) ? (8'hbb) : (8'hbf)) ? (|(8'hb1)) : ((8'hb7) < (8'ha3)))), {(+((8'ha4) > (8'hb8)))}} < (((((8'hb7) != (8'h9d)) << (&(8'hbe))) > ((^~(8'h9f)) >> ((8'hb9) > (8'ha6)))) << ((((8'hbc) < (8'h9c)) & ((8'ha8) | (8'hae))) >= ({(8'ha3)} ? (8'hae) : ((8'hbc) ? (8'hba) : (8'hb8)))))), 
parameter param147 = ((8'hba) <= (~|{param146})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire144;
  wire [(4'he):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire21;
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  assign y = {wire144,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire29,
                 wire28,
                 wire25,
                 wire24,
                 wire23,
                 wire21,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg26,
                 reg27,
                 (1'h0)};
  module5 #() modinst22 (.wire7(wire1), .wire9(wire4), .wire10(wire3), .wire6(wire0), .clk(clk), .wire8(wire2), .y(wire21));
  assign wire23 = $signed((+($unsigned((&wire21)) ?
                      wire0[(4'ha):(1'h0)] : wire1)));
  assign wire24 = (~&(^wire3));
  assign wire25 = ((wire24[(4'h8):(3'h4)] >>> $signed(($unsigned((8'ha5)) ?
                      (^~wire21) : $unsigned(wire21)))) + (8'h9e));
  always
    @(posedge clk) begin
      reg26 <= $unsigned({wire4[(4'ha):(1'h1)],
          (wire4 ?
              (!$signed(wire2)) : ($unsigned((7'h40)) ?
                  wire23[(3'h4):(1'h0)] : {(8'hbf)}))});
      reg27 <= (!((^$unsigned(wire3)) + $unsigned(wire2[(4'hf):(4'hd)])));
    end
  assign wire28 = ($unsigned(($unsigned((wire4 >= wire25)) ?
                          ((wire21 ? (8'hac) : wire3) ?
                              $unsigned(wire21) : (wire4 ?
                                  wire1 : wire3)) : (reg26 | (-wire0)))) ?
                      ({{(wire2 ? reg26 : wire21),
                              reg26}} | reg27[(5'h14):(1'h1)]) : $signed($signed((^$unsigned(wire0)))));
  assign wire29 = wire24;
  module30 #() modinst46 (.wire35(wire23), .wire31(wire24), .clk(clk), .y(wire45), .wire34(wire29), .wire33(reg26), .wire32(wire1));
  assign wire47 = wire23;
  assign wire48 = wire45;
  assign wire49 = $signed(wire3);
  always
    @(posedge clk) begin
      reg50 <= $signed(({(!$signed((8'hb7))),
          wire23[(1'h1):(1'h1)]} || ((8'hb0) >>> wire28)));
      reg51 <= $unsigned((8'ha5));
      if (wire23)
        begin
          reg52 <= ((wire3 ?
                  wire2[(5'h10):(4'ha)] : (wire47[(4'h9):(1'h1)] << wire29[(1'h1):(1'h0)])) ?
              $signed((wire24 ?
                  ({(8'ha7)} != reg51[(3'h4):(3'h4)]) : (~|wire24))) : wire45);
          reg53 <= (^{({(reg50 & wire21)} != (~&(wire2 ? (7'h42) : reg26))),
              $signed(((wire1 != wire0) ?
                  (reg52 ? (8'haa) : wire1) : (wire0 ? wire1 : wire29)))});
        end
      else
        begin
          if ((8'had))
            begin
              reg52 <= ($unsigned(($signed($signed(wire29)) >>> (&(!wire45)))) ?
                  ($signed($signed((~wire23))) ?
                      reg52 : $unsigned($signed((reg27 ?
                          (8'hba) : reg52)))) : $signed(wire25));
              reg53 <= $signed(wire47[(3'h5):(1'h0)]);
            end
          else
            begin
              reg52 <= reg52;
              reg53 <= $signed({(wire25 ? (wire4 | wire0) : (&(-wire2)))});
              reg54 <= (~^wire3[(3'h4):(3'h4)]);
              reg55 <= $unsigned(reg51);
              reg56 <= (8'hb4);
            end
          if (($unsigned(((~&wire1) ~^ {{wire49, wire48}})) < (~reg50)))
            begin
              reg57 <= $unsigned(wire0[(1'h1):(1'h0)]);
              reg58 <= ($signed($signed((^~(+wire45)))) | wire24[(5'h10):(3'h5)]);
            end
          else
            begin
              reg57 <= $unsigned(wire21);
            end
          reg59 <= $unsigned(((($signed(wire24) ?
                      wire4[(4'he):(4'h9)] : ((8'had) ? wire21 : wire23)) ?
                  wire2[(5'h10):(4'hd)] : (wire25 < (wire45 ? reg55 : reg27))) ?
              (-{$signed(reg54)}) : {wire0}));
        end
      reg60 <= wire49[(4'ha):(1'h1)];
    end
  module61 #() modinst145 (wire144, clk, wire2, wire21, wire47, wire25);
endmodule

module module61
#(parameter param143 = (8'h9c))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire65;
  input wire signed [(5'h13):(1'h0)] wire64;
  input wire [(5'h12):(1'h0)] wire63;
  input wire signed [(5'h12):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire141;
  wire signed [(4'hb):(1'h0)] wire140;
  wire signed [(2'h2):(1'h0)] wire139;
  wire [(5'h10):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire118;
  reg [(3'h4):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire81,
                 wire68,
                 wire67,
                 wire66,
                 wire118,
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
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire66 = {wire64[(4'h8):(4'h8)]};
  assign wire67 = wire66[(2'h2):(2'h2)];
  assign wire68 = (~&{wire62});
  module69 #() modinst82 (wire81, clk, wire66, wire63, wire68, wire65, wire64);
  always
    @(posedge clk) begin
      reg83 <= ((|{(|(7'h41))}) ? $unsigned(wire66) : wire64);
      reg84 <= $unsigned(wire66[(4'h9):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg85 <= ($unsigned(wire68) ? $unsigned(wire65) : wire81[(3'h6):(3'h6)]);
      reg86 <= reg83;
      reg87 <= wire63;
    end
  module88 #() modinst119 (.wire93(wire67), .wire91(reg83), .wire92(reg87), .wire89(wire64), .clk(clk), .y(wire118), .wire90(wire81));
  always
    @(posedge clk) begin
      reg120 <= $signed(wire68[(4'he):(3'h4)]);
      if (wire64)
        begin
          reg121 <= (wire64 ?
              $unsigned((7'h44)) : {$unsigned((~^((8'hba) ? reg86 : wire64)))});
          reg122 <= (!(~|{$unsigned(((8'hae) | (7'h42)))}));
          if ({reg120[(2'h2):(2'h2)]})
            begin
              reg123 <= {$unsigned($signed({(wire66 ? reg83 : wire64),
                      reg83[(3'h4):(1'h0)]}))};
            end
          else
            begin
              reg123 <= (({wire63} - (({wire62, reg123} ?
                  wire81 : wire62[(3'h5):(1'h0)]) == (reg121[(3'h4):(1'h1)] != (^reg87)))) & ({($unsigned(wire81) ?
                          {reg85} : wire66[(3'h6):(1'h1)])} ?
                  reg120 : wire62));
              reg124 <= (~((reg86 ?
                  (reg85 >>> $signed(wire81)) : (reg120[(3'h6):(3'h6)] ?
                      $signed((7'h44)) : reg121[(2'h3):(1'h0)])) ^~ (8'hb2)));
              reg125 <= (^$unsigned((((-wire64) ?
                  reg124[(3'h4):(3'h4)] : (reg124 ^~ (8'h9d))) | (^$unsigned(wire118)))));
              reg126 <= {(wire68 ?
                      $signed(reg84) : ({$unsigned(wire66)} != $signed((reg83 ~^ reg123))))};
              reg127 <= reg125[(3'h7):(3'h5)];
            end
          reg128 <= (7'h42);
        end
      else
        begin
          if ((reg87[(2'h2):(1'h0)] ? wire65 : wire63[(4'he):(4'h8)]))
            begin
              reg121 <= {reg125, reg120[(3'h5):(2'h3)]};
              reg122 <= (reg121 ^ wire65);
              reg123 <= reg128[(2'h2):(1'h0)];
              reg124 <= (wire68[(4'h9):(4'h8)] ?
                  $signed((((reg122 ? wire81 : wire64) || (wire81 ?
                      reg125 : reg121)) || reg87)) : wire65[(1'h0):(1'h0)]);
            end
          else
            begin
              reg121 <= ((8'hb3) ^ (8'hb6));
              reg122 <= wire67[(3'h4):(1'h1)];
              reg123 <= $signed($signed({wire67[(4'ha):(4'ha)]}));
            end
        end
      reg129 <= ({((reg123 | (wire62 ? reg128 : wire118)) || wire67),
              {$unsigned((8'ha3)), $signed({reg86, reg123})}} ?
          ((~&($signed(reg85) ? $signed(wire118) : wire62)) ?
              wire65 : $unsigned((~&reg83))) : reg84);
      reg130 <= wire64[(4'hc):(2'h2)];
      if ((reg86[(2'h3):(1'h1)] ?
          $unsigned($unsigned((~|{(8'ha1), wire65}))) : (~(({wire68,
                  (8'hac)} ^ (wire68 || reg127)) ?
              (-((8'hb9) ?
                  wire63 : wire81)) : $unsigned(wire66[(4'ha):(3'h7)])))))
        begin
          reg131 <= $signed(reg125[(4'h8):(3'h5)]);
          reg132 <= ($unsigned(reg120) + $signed((reg123[(3'h4):(1'h1)] & reg83)));
          if (wire81[(3'h4):(2'h2)])
            begin
              reg133 <= ($unsigned($unsigned(((reg87 ? wire68 : wire68) ?
                  reg132 : $signed(wire66)))) ~^ ($unsigned(reg129[(4'h8):(2'h3)]) >= $unsigned({$signed(reg83)})));
              reg134 <= wire65[(4'h9):(3'h5)];
              reg135 <= wire81;
            end
          else
            begin
              reg133 <= $signed($unsigned($signed(reg85[(3'h5):(2'h2)])));
            end
        end
      else
        begin
          reg131 <= $signed($signed((($signed(reg134) ?
              reg87[(2'h2):(1'h0)] : (+reg128)) <<< $unsigned($unsigned(reg124)))));
          reg132 <= $signed((((((8'hb8) ?
                      reg84 : reg121) >> reg135[(1'h1):(1'h1)]) ?
                  $unsigned(((8'hb7) >= (7'h41))) : wire67) ?
              reg128[(2'h3):(1'h0)] : {($unsigned(reg129) ^ reg133),
                  ((reg120 ? wire64 : (8'hb2)) <= ((8'hb5) ?
                      wire64 : reg86))}));
          if (wire63)
            begin
              reg133 <= $unsigned({reg126,
                  (reg126[(2'h2):(2'h2)] >> $unsigned(reg130))});
              reg134 <= ($unsigned(reg128) && {({$signed(reg128)} < (~|$signed((8'hb0)))),
                  {$signed((reg132 ^~ reg124))}});
            end
          else
            begin
              reg133 <= wire68;
              reg134 <= reg132[(2'h3):(1'h0)];
              reg135 <= {reg123, $signed($signed((|(reg135 ~^ wire67))))};
              reg136 <= (~$unsigned(reg132[(3'h6):(3'h4)]));
            end
          reg137 <= (({$unsigned((reg132 ?
                  reg132 : reg126))} != (reg129[(2'h3):(2'h2)] ?
              ($unsigned(reg131) ?
                  reg120 : (-wire67)) : (+wire63))) != reg83[(1'h0):(1'h0)]);
          reg138 <= $signed((~(^reg134[(4'hd):(4'hd)])));
        end
    end
  assign wire139 = ((~&$signed((((8'hac) ?
                           wire66 : reg127) <= (reg124 >>> (7'h40))))) ?
                       $signed((reg83 == (reg122 ^~ (wire67 == (8'hab))))) : $unsigned($signed(wire64)));
  assign wire140 = (&(^~($signed((reg133 == wire62)) ? reg85 : (&reg83))));
  assign wire141 = $signed(((~&{((8'ha4) || wire139)}) < ((|wire65) ?
                       $unsigned(reg87[(3'h4):(3'h4)]) : $signed((reg137 + wire64)))));
  assign wire142 = (^~$unsigned({(8'h9e)}));
endmodule

module module30
#(parameter param43 = (|(~^((((8'hba) <<< (8'ha9)) ^~ {(8'hab)}) ? ((^(7'h43)) ? ((7'h40) >= (8'ha4)) : {(8'ha0)}) : (|((8'hbf) ? (8'haf) : (8'hab)))))), 
parameter param44 = ((((~&param43) ? (~(!(8'ha8))) : param43) ? {{(param43 == param43), (+param43)}} : {param43}) ? {(((param43 == (8'h9d)) * ((8'hbe) ? param43 : param43)) && (&(~^param43))), {((~|param43) > ((8'ha9) ^ param43)), (^(param43 >>> (8'hb6)))}} : (&(param43 != ({param43} - (8'hb7))))))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire signed [(2'h3):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire [(5'h10):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  assign y = {wire42, wire41, wire40, wire37, wire36, reg39, reg38, (1'h0)};
  assign wire36 = wire34;
  assign wire37 = {$unsigned(((|(wire35 | wire31)) + ((wire33 ?
                              wire35 : wire36) ?
                          (8'haf) : wire31[(4'ha):(4'h8)])))};
  always
    @(posedge clk) begin
      reg38 <= ($signed(wire34) ? (wire31 <= wire31) : wire33);
      reg39 <= $unsigned(($unsigned(((8'hab) > wire34)) <<< wire37));
    end
  assign wire40 = {(~^{(wire34 ? wire32 : (wire37 ^~ wire35))})};
  assign wire41 = $unsigned(((wire32 == (-(!wire36))) ?
                      (&wire33[(2'h3):(2'h2)]) : reg39[(3'h7):(3'h5)]));
  assign wire42 = (8'hb1);
endmodule

module module5
#(parameter param19 = (({(((8'ha0) >= (8'hb9)) ? (-(8'hbf)) : ((8'haa) + (8'had)))} <<< ((+((8'hbc) ? (8'hae) : (8'hb2))) ? (-((8'ha5) * (8'hb7))) : (((7'h41) | (8'hbb)) | {(8'hac), (8'hb4)}))) ? ((~(+(+(8'ha7)))) ? {(8'hb3)} : (~|(7'h43))) : {({((7'h43) ? (8'hbd) : (8'had)), ((8'hbf) ? (8'ha6) : (8'haf))} ? (((8'hab) && (8'ha8)) >>> ((8'hab) | (8'hb4))) : (((8'hb5) ? (8'ha0) : (8'hb8)) ? ((8'h9d) <<< (8'hb5)) : {(7'h40), (8'ha7)}))}), 
parameter param20 = ((&param19) ~^ ((((param19 ? param19 : param19) ^~ (~param19)) ? ({param19} >= (param19 >> param19)) : (~&{param19})) ? (|param19) : (param19 ? param19 : (param19 ? (param19 >> param19) : (param19 <= param19))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg15,
                 (1'h0)};
  assign wire11 = (^($unsigned(wire9[(4'hb):(4'hb)]) ^~ (~{{wire8}})));
  assign wire12 = ($signed($signed($unsigned((8'ha5)))) && ({wire8[(3'h5):(3'h5)]} >> $unsigned(wire8)));
  assign wire13 = $unsigned((|($unsigned({wire6}) + wire6)));
  assign wire14 = $unsigned(wire12);
  always
    @(posedge clk) begin
      reg15 <= (wire8[(5'h10):(4'he)] ? wire8 : (8'had));
    end
  assign wire16 = ($signed((($signed(wire12) == (~&wire14)) ?
                          wire11[(1'h0):(1'h0)] : $unsigned(wire8[(1'h0):(1'h0)]))) ?
                      wire14[(4'hd):(4'ha)] : $unsigned(wire11[(2'h3):(2'h3)]));
  assign wire17 = reg15;
  assign wire18 = (((($signed(reg15) ?
                          wire8[(4'h8):(3'h4)] : wire14) >>> (reg15 ?
                          $unsigned(reg15) : $signed((8'haf)))) ^~ reg15) ?
                      $signed(reg15[(2'h2):(1'h0)]) : ($unsigned({(wire6 != wire10),
                          reg15}) >= wire10));
endmodule

module module88  (y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire93;
  input wire [(2'h3):(1'h0)] wire92;
  input wire [(3'h6):(1'h0)] wire91;
  input wire signed [(4'h8):(1'h0)] wire90;
  input wire [(5'h13):(1'h0)] wire89;
  wire [(5'h10):(1'h0)] wire117;
  wire [(4'ha):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire111;
  wire [(3'h7):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire96;
  wire signed [(3'h4):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  assign y = {wire117,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg116,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire94 = (~&(wire89 > wire90));
  assign wire95 = (8'ha6);
  assign wire96 = (&(~|wire91[(3'h6):(3'h5)]));
  assign wire97 = $signed(wire91[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      reg98 <= wire90[(1'h0):(1'h0)];
      reg99 <= (+$unsigned(wire90));
      if (((^~wire91[(1'h1):(1'h1)]) ~^ {($signed((|wire90)) ^~ reg99[(5'h14):(4'hf)]),
          wire95[(2'h2):(1'h1)]}))
        begin
          reg100 <= $unsigned((reg99[(4'hc):(3'h6)] && $unsigned($signed((wire97 ?
              wire92 : wire94)))));
          if ($signed(reg100[(1'h0):(1'h0)]))
            begin
              reg101 <= ((wire90[(2'h3):(1'h0)] ?
                      (~((~|reg98) >= wire94[(3'h6):(1'h0)])) : ($unsigned(wire91[(2'h3):(1'h0)]) ?
                          $unsigned((wire96 * wire92)) : ($unsigned(wire95) <= {wire95}))) ?
                  wire92[(1'h0):(1'h0)] : wire96);
              reg102 <= $unsigned((((8'haf) ?
                      {$signed(wire96)} : $unsigned(wire93)) ?
                  $signed(wire89[(2'h2):(1'h1)]) : $unsigned(wire92[(2'h3):(1'h0)])));
              reg103 <= reg100[(3'h6):(2'h2)];
              reg104 <= ($unsigned(($unsigned((^wire96)) - $signed((-reg99)))) >> (+({reg98} ^ ((^wire90) ?
                  (wire90 + reg101) : $signed(wire97)))));
              reg105 <= (^(~&(reg103 != reg100[(3'h6):(3'h4)])));
            end
          else
            begin
              reg101 <= reg100;
              reg102 <= (((^wire90) < (!$unsigned((^~wire90)))) ?
                  (&(!$signed((wire90 | wire93)))) : reg100);
              reg103 <= $signed(($signed(reg104) ?
                  $unsigned(((wire92 - wire92) <= (wire89 & wire95))) : $signed((~reg98))));
              reg104 <= wire92;
              reg105 <= (wire94 > {$unsigned(($unsigned(reg100) ?
                      reg103 : (reg104 - (8'hb5))))});
            end
          reg106 <= ($unsigned(((-$signed(reg102)) ? reg102 : (&(~wire91)))) ?
              $unsigned($unsigned(((~^wire91) ?
                  wire97[(3'h7):(2'h2)] : (reg103 ?
                      wire94 : wire91)))) : reg98[(2'h3):(1'h0)]);
          if ($unsigned(({reg101,
              reg102[(1'h0):(1'h0)]} >= reg100[(3'h4):(2'h3)])))
            begin
              reg107 <= wire93;
              reg108 <= wire96[(1'h0):(1'h0)];
              reg109 <= ((^{(~^(!wire96))}) - wire93[(3'h4):(1'h1)]);
              reg110 <= ($signed((wire91[(2'h3):(1'h0)] ?
                      $unsigned(reg100) : (~|(+reg104)))) ?
                  (8'hb8) : $signed((($unsigned(reg106) | (8'hab)) ?
                      ($signed(reg101) & (wire90 ?
                          wire95 : reg98)) : wire89[(2'h3):(2'h3)])));
            end
          else
            begin
              reg107 <= (~&((8'ha2) ?
                  $unsigned((8'hbd)) : {($unsigned(reg100) <= (^~(8'hae))),
                      ({wire90, reg103} ~^ (~^reg108))}));
              reg108 <= reg106[(2'h3):(1'h0)];
              reg109 <= (~^{(~|(~&(+wire95)))});
            end
        end
      else
        begin
          reg100 <= reg102;
          reg101 <= (^{(^~$signed((+reg106)))});
          reg102 <= reg110;
          reg103 <= reg103;
          reg104 <= ($signed(reg109) >> $signed((~^$unsigned($unsigned(wire89)))));
        end
    end
  assign wire111 = $signed($signed(((&(wire92 >> wire90)) ^ $signed({wire90,
                       (8'hb8)}))));
  assign wire112 = ((!$signed((wire97 ^~ {reg103, reg109}))) ?
                       wire94 : (8'hb9));
  assign wire113 = $unsigned(($signed($unsigned(reg100[(2'h2):(1'h1)])) ?
                       {($signed(wire95) ?
                               (wire93 ?
                                   (8'ha0) : reg100) : reg105)} : ($signed(((8'ha0) >>> wire94)) << reg106[(1'h0):(1'h0)])));
  assign wire114 = ($signed(($unsigned((wire113 * wire89)) ?
                       $unsigned((reg102 | reg103)) : ((^reg107) && ((8'haf) ?
                           reg98 : reg101)))) != ($signed(($signed(wire93) ?
                       (reg100 ?
                           wire89 : (8'hb0)) : $signed((8'ha5)))) - $signed($unsigned($unsigned(reg105)))));
  assign wire115 = $unsigned((reg101[(2'h3):(2'h2)] || (~&reg105)));
  always
    @(posedge clk) begin
      reg116 <= ({(~^wire95),
          $unsigned($signed(wire97[(3'h6):(3'h4)]))} ~^ reg103);
    end
  assign wire117 = reg98[(1'h0):(1'h0)];
endmodule

module module69  (y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire74;
  input wire signed [(5'h12):(1'h0)] wire73;
  input wire [(4'ha):(1'h0)] wire72;
  input wire signed [(4'ha):(1'h0)] wire71;
  input wire signed [(4'ha):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire77;
  wire [(4'hb):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  assign y = {wire80, wire79, wire78, wire77, wire76, wire75, (1'h0)};
  assign wire75 = $unsigned((wire72[(4'ha):(2'h2)] << (^~{$signed((8'haf)),
                      (wire73 ? wire71 : (8'hac))})));
  assign wire76 = (8'hbc);
  assign wire77 = $unsigned($unsigned($unsigned($unsigned({(8'ha7)}))));
  assign wire78 = $signed({$unsigned({$unsigned(wire76), $unsigned(wire71)})});
  assign wire79 = wire74[(1'h1):(1'h1)];
  assign wire80 = $signed(($unsigned(((wire72 ? wire76 : wire77) ?
                          $unsigned(wire78) : wire72[(3'h4):(1'h0)])) ?
                      wire71 : (&wire73[(5'h11):(5'h10)])));
endmodule
