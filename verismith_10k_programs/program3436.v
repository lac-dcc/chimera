module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire145;
  wire signed [(5'h14):(1'h0)] wire135;
  wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire138;
  wire signed [(5'h15):(1'h0)] wire139;
  wire [(3'h7):(1'h0)] wire143;
  reg [(4'hd):(1'h0)] reg153 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg141 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  assign y = {wire145,
                 wire135,
                 wire19,
                 wire6,
                 wire5,
                 wire137,
                 wire138,
                 wire139,
                 wire143,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg141,
                 reg142,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = ($signed(wire4) ? (8'hae) : $unsigned(wire4[(4'hb):(1'h1)]));
  always
    @(posedge clk) begin
      if ($signed((~^(~(!{(7'h44)})))))
        begin
          reg7 <= $signed({wire5[(1'h1):(1'h1)]});
          reg8 <= ($unsigned((!(8'ha4))) ?
              (($signed(wire4[(3'h6):(3'h5)]) >> ($unsigned(reg7) << (&(8'hb0)))) - (wire3 == (((8'haa) != (8'ha5)) < (reg7 ?
                  wire1 : wire6)))) : $signed(wire6[(3'h6):(1'h0)]));
        end
      else
        begin
          reg7 <= $signed((~&$unsigned(((^wire0) ?
              (wire5 ? wire4 : reg8) : {(8'hbc)}))));
          reg8 <= wire1[(3'h4):(3'h4)];
          if (((|wire4) ? $unsigned(reg8) : $signed(wire1)))
            begin
              reg9 <= reg7;
              reg10 <= wire3[(3'h6):(2'h3)];
              reg11 <= $signed($unsigned({((wire6 ? wire5 : (8'ha7)) ?
                      $signed(wire3) : (!wire5)),
                  $unsigned(((8'ha3) ? wire1 : wire6))}));
              reg12 <= ((8'hb1) < $signed(wire4[(2'h3):(2'h3)]));
              reg13 <= ($signed(wire1[(4'ha):(4'ha)]) ?
                  ($signed(wire1[(4'hc):(2'h3)]) <= $unsigned(wire5[(3'h6):(2'h2)])) : wire4[(2'h2):(1'h1)]);
            end
          else
            begin
              reg9 <= (wire6[(1'h1):(1'h1)] ?
                  (($unsigned($signed(wire4)) ?
                          ($unsigned((8'hb5)) ?
                              (reg7 + wire3) : $signed(reg7)) : $signed(wire2)) ?
                      $signed($unsigned((-wire6))) : ((!wire1) ?
                          reg10 : wire0)) : wire2);
              reg10 <= (|wire3);
              reg11 <= wire3[(2'h3):(2'h2)];
              reg12 <= $unsigned((reg9 || reg8));
            end
          if (((+(&{{(8'hac), wire2}})) ?
              (((!$unsigned(reg9)) ? $signed((reg8 << wire5)) : (~|(^reg9))) ?
                  (~&(reg8 ? ((8'ha8) || reg10) : (reg13 ~^ wire2))) : {reg9,
                      ((wire0 ? wire6 : reg10) ~^ (wire5 ?
                          reg13 : reg8))}) : $signed({(~^(-wire2))})))
            begin
              reg14 <= wire2;
              reg15 <= (~$signed(reg8[(4'hd):(2'h3)]));
              reg16 <= reg15;
            end
          else
            begin
              reg14 <= wire3[(1'h0):(1'h0)];
            end
        end
      reg17 <= ($unsigned(($unsigned(wire3[(3'h4):(1'h1)]) > reg10)) ?
          (({reg12, wire5} >>> reg12[(3'h6):(1'h0)]) >= ((reg9[(3'h4):(2'h2)] ?
                  (~reg12) : (^~reg9)) ?
              (~^(wire0 <= (7'h40))) : reg9[(3'h4):(1'h1)])) : reg7[(5'h12):(4'hc)]);
      reg18 <= wire3[(4'h8):(1'h0)];
    end
  assign wire19 = reg8;
  module20 #() modinst136 (wire135, clk, wire3, reg18, reg13, reg14, reg11);
  assign wire137 = $unsigned((($signed(wire4[(3'h4):(2'h2)]) ?
                       $unsigned((reg14 ? reg10 : reg8)) : {(wire4 ?
                               reg13 : wire1)}) >= wire1));
  assign wire138 = (reg10[(1'h1):(1'h1)] ?
                       (((!(reg18 ^ wire19)) ?
                           $signed($signed(reg9)) : $signed((^~(8'ha7)))) + (8'hbe)) : (($signed(((8'hb0) ?
                               (8'ha3) : wire2)) ?
                           (~^wire1[(2'h3):(1'h1)]) : wire4) + $unsigned((~^(wire1 ?
                           wire19 : reg18)))));
  module77 #() modinst140 (.wire78(reg17), .y(wire139), .wire82(reg10), .wire79(wire3), .wire80(reg8), .clk(clk), .wire81(wire137));
  always
    @(posedge clk) begin
      reg141 <= ((~&((-$signed((8'hab))) ?
              (~wire135) : ((wire0 ? wire0 : (8'h9f)) != $unsigned(wire3)))) ?
          (reg17[(4'he):(3'h4)] <<< (wire135 > (~^reg18[(1'h0):(1'h0)]))) : $unsigned($unsigned(($signed(reg10) * $unsigned(reg8)))));
      reg142 <= {(^~(!({(8'hab)} ? {wire139} : (wire6 ? wire3 : wire3))))};
    end
  module59 #() modinst144 (wire143, clk, wire1, reg16, reg12, reg7);
  assign wire145 = wire138[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg146 <= (~^$signed((({(8'hb8), reg12} ?
              (reg16 ? reg9 : wire135) : reg15[(2'h3):(2'h2)]) ?
          $unsigned(reg11) : wire1)));
      reg147 <= $unsigned($unsigned(reg10));
      reg148 <= $signed(reg13);
      if (reg148)
        begin
          reg149 <= $unsigned(((reg8 + reg7) << (($unsigned(reg142) ?
                  reg18 : (reg146 ? reg8 : (8'ha5))) ?
              wire0[(1'h1):(1'h1)] : ({reg16, (8'hb9)} ^~ $signed(reg11)))));
        end
      else
        begin
          if (($signed($unsigned($unsigned((reg149 ? reg147 : reg13)))) ?
              (+reg141) : wire138))
            begin
              reg149 <= ((-wire0[(3'h5):(3'h4)]) ~^ $signed(wire137));
              reg150 <= (({$signed((wire5 ^ wire5))} < $signed(((reg14 == reg12) ?
                  (wire4 <<< wire145) : $unsigned(reg148)))) <<< {wire145});
              reg151 <= wire135;
            end
          else
            begin
              reg149 <= wire145;
              reg150 <= reg151[(1'h0):(1'h0)];
            end
          reg152 <= (wire139 ~^ (8'hae));
          reg153 <= (8'ha7);
        end
    end
endmodule

module module20
#(parameter param133 = (&{(!(((8'hbc) ? (8'hac) : (8'hb3)) ? (~(7'h40)) : (^(8'ha9))))}), 
parameter param134 = ((param133 * (^({param133, param133} ? (8'h9c) : ((8'ha9) ^~ (7'h43))))) ? ((~param133) + (param133 ? (-((8'hac) | (8'ha4))) : (8'ha5))) : ((~&(~(~&param133))) & (((param133 ? param133 : param133) ? (param133 ? param133 : param133) : (~(8'hb5))) && param133))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire [(4'hc):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire132;
  wire [(3'h5):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire126;
  wire signed [(4'h9):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire124;
  wire [(4'ha):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire119;
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire95,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire58,
                 wire56,
                 wire119,
                 (1'h0)};
  module26 #() modinst57 (.wire27(wire21), .wire30(wire24), .wire29(wire23), .wire28(wire25), .y(wire56), .clk(clk));
  assign wire58 = (|(wire56 ~^ $unsigned(((8'ha9) ?
                      (~wire23) : (wire24 << wire22)))));
  module59 #() modinst72 (wire71, clk, wire21, wire24, wire23, wire56);
  assign wire73 = $unsigned(wire21[(3'h7):(3'h7)]);
  assign wire74 = $signed(wire56);
  assign wire75 = $unsigned(((((^wire23) ?
                      (^wire21) : $signed(wire71)) | wire24) && wire25));
  assign wire76 = $unsigned(((wire24[(4'hb):(4'ha)] ?
                          {{wire25, wire71}, (-(8'hb4))} : ({wire75} ?
                              (~^wire71) : wire58[(4'he):(4'h8)])) ?
                      (((!wire71) ?
                          $signed(wire23) : (wire58 ?
                              wire22 : wire75)) != ($unsigned((8'ha9)) > {wire25,
                          wire24})) : wire22[(3'h6):(3'h6)]));
  module77 #() modinst96 (.wire82(wire58), .wire80(wire23), .wire81(wire56), .y(wire95), .wire78(wire22), .clk(clk), .wire79(wire74));
  module97 #() modinst120 (wire119, clk, wire58, wire73, wire56, wire71, wire23);
  assign wire121 = ((wire95 ^~ wire119[(4'hc):(3'h4)]) ?
                       wire73[(3'h7):(3'h5)] : $signed($signed((^~((8'hb0) - wire76)))));
  assign wire122 = wire121[(3'h4):(1'h1)];
  assign wire123 = (wire24 ? wire95 : $unsigned($signed($unsigned(wire122))));
  assign wire124 = $signed({(wire121[(4'h8):(3'h4)] | ({wire95, wire22} ?
                           (wire123 || wire25) : $unsigned(wire76))),
                       wire73[(4'h8):(3'h5)]});
  assign wire125 = wire95;
  assign wire126 = wire22[(1'h0):(1'h0)];
  assign wire127 = (wire75[(2'h3):(1'h0)] || wire76);
  assign wire128 = $signed($signed(({(^wire21)} ?
                       (wire123[(3'h5):(2'h3)] ^ (wire22 ?
                           wire75 : wire23)) : wire22[(4'hf):(1'h1)])));
  assign wire129 = wire121;
  assign wire130 = {wire123};
  assign wire131 = $signed((^~((~&wire21) > ((~^wire127) ?
                       (wire124 ? wire23 : wire129) : $signed(wire75)))));
  assign wire132 = wire127;
endmodule

module module97
#(parameter param118 = (~^((({(7'h43), (8'hb7)} != {(8'hbb), (8'hbf)}) ? (&{(8'hbf)}) : (((8'hb0) ~^ (8'hbd)) ? ((7'h43) ? (8'hb1) : (8'hbf)) : ((8'haf) ? (7'h42) : (8'ha1)))) | ((((8'hb8) ? (7'h41) : (8'hb3)) >= ((8'hac) ^~ (8'hb7))) ? (((8'had) ? (7'h41) : (8'hbe)) << {(8'hab), (8'h9d)}) : (((8'had) || (7'h40)) * ((8'hb8) <<< (8'ha2)))))))
(y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire102;
  input wire signed [(4'hd):(1'h0)] wire101;
  input wire [(4'h9):(1'h0)] wire100;
  input wire [(3'h4):(1'h0)] wire99;
  input wire signed [(4'hc):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire116;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire106,
                 wire105,
                 reg114,
                 reg109,
                 reg108,
                 reg107,
                 reg104,
                 reg103,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg103 <= (^~(wire100 ?
          (wire100[(4'h9):(1'h0)] && $unsigned((wire102 ?
              wire100 : wire101))) : $signed($signed(wire101[(2'h2):(1'h0)]))));
      reg104 <= (^~$unsigned((wire98[(1'h1):(1'h1)] ? reg103 : wire102)));
    end
  assign wire105 = {$signed(($unsigned(reg103[(3'h4):(2'h2)]) ?
                           ($unsigned((8'hbf)) + ((8'hab) ?
                               wire102 : reg103)) : wire98[(3'h6):(3'h5)])),
                       ({((^~wire102) ? $signed(wire98) : $signed(wire98)),
                           $signed((wire100 >> wire102))} + $signed(($signed(wire101) ?
                           (reg103 < (8'hbe)) : wire100[(3'h4):(1'h0)])))};
  assign wire106 = {(|wire99[(2'h3):(2'h3)]), $signed($unsigned(wire99))};
  always
    @(posedge clk) begin
      reg107 <= (+$unsigned($unsigned((wire99[(1'h1):(1'h0)] ?
          $unsigned(wire98) : (wire100 ? wire102 : wire99)))));
      reg108 <= wire101;
      reg109 <= wire102[(4'hb):(3'h4)];
    end
  assign wire110 = (!(reg103 ?
                       $unsigned($unsigned($signed((8'haf)))) : $signed({(8'hac)})));
  assign wire111 = $unsigned($unsigned($unsigned($unsigned((reg109 != wire106)))));
  assign wire112 = (($unsigned((wire102 <<< {wire98, reg109})) ?
                           (|($signed(reg108) ?
                               (wire111 ^ reg103) : $signed(wire101))) : reg103) ?
                       {(~&((reg109 << wire106) >> (wire105 && wire98))),
                           {wire105[(1'h0):(1'h0)]}} : (wire106 ?
                           wire106 : reg103));
  assign wire113 = (&$signed({wire99[(3'h4):(2'h3)],
                       ((wire111 << reg109) != $unsigned(reg103))}));
  always
    @(posedge clk) begin
      reg114 <= (^$signed((7'h42)));
    end
  assign wire115 = {reg109, $unsigned(wire101)};
  assign wire116 = wire115[(5'h12):(5'h10)];
  assign wire117 = wire115;
endmodule

module module77
#(parameter param93 = ((!(!(~|((8'ha1) ? (8'h9f) : (8'hba))))) || ({((^(7'h42)) + ((8'h9f) >= (8'hb4))), ({(8'h9e), (8'ha7)} ? (~^(8'hb2)) : (~&(8'hb0)))} ? (~&(((8'hba) || (8'hbe)) ? ((8'ha1) << (8'h9e)) : ((8'ha8) ~^ (8'hac)))) : (7'h42))), 
parameter param94 = param93)
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire82;
  input wire [(5'h14):(1'h0)] wire81;
  input wire [(2'h3):(1'h0)] wire80;
  input wire [(3'h4):(1'h0)] wire79;
  input wire [(5'h13):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 (1'h0)};
  assign wire83 = ($signed((~|wire82[(1'h1):(1'h0)])) || wire80);
  assign wire84 = (|{(wire83 ^ ($unsigned((8'had)) ?
                          (wire80 ? wire83 : wire79) : (wire82 ?
                              wire79 : wire78)))});
  assign wire85 = $unsigned($unsigned(wire79[(1'h1):(1'h1)]));
  assign wire86 = wire83;
  assign wire87 = wire82;
  assign wire88 = (^(~$signed((~^$signed(wire78)))));
  assign wire89 = $signed(($signed(((wire78 ?
                          wire85 : wire83) >= wire80[(1'h0):(1'h0)])) ?
                      wire85[(2'h2):(1'h1)] : (~|wire82)));
  assign wire90 = $signed((~wire80[(2'h3):(2'h2)]));
  assign wire91 = (!wire81[(4'hc):(3'h5)]);
  assign wire92 = (wire80 ?
                      wire91 : {$signed($signed((wire83 ? wire88 : wire83)))});
endmodule

module module59
#(parameter param69 = ((8'hb9) && (((-{(8'hb2)}) ? (((8'h9f) ? (8'h9d) : (8'ha4)) & ((8'ha0) ? (8'hbd) : (7'h42))) : {((8'ha9) ? (8'ha8) : (8'had)), (-(8'hb3))}) ? (^~(((8'hb7) ^ (8'hb4)) ? ((8'hba) && (8'ha1)) : ((8'hb9) ? (8'hbc) : (8'ha9)))) : ((((8'hba) ^ (8'ha1)) ? ((8'ha6) ? (8'ha3) : (8'hb0)) : {(8'ha8)}) << {(~|(8'hab))}))), 
parameter param70 = (({param69} ~^ (~&(&(-(8'ha8))))) ? ({{((8'ha7) ? param69 : param69), param69}, {param69}} ? ((~^((8'hbc) ? param69 : param69)) && (~&(param69 ? param69 : (8'hae)))) : ((param69 ? (~&param69) : param69) ? {(param69 || param69), (param69 * param69)} : ((param69 * param69) + param69))) : ({param69, {(-param69)}} == param69)))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire63;
  input wire signed [(2'h2):(1'h0)] wire62;
  input wire [(2'h2):(1'h0)] wire61;
  input wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  assign y = {wire68, wire67, wire66, wire65, wire64, (1'h0)};
  assign wire64 = (8'h9c);
  assign wire65 = ({(wire64[(4'he):(4'ha)] || (+{wire63}))} ?
                      (wire62[(1'h1):(1'h0)] ?
                          {wire63,
                              (wire62 ?
                                  (wire64 - wire62) : $unsigned(wire63))} : {($unsigned((8'haf)) ?
                                  (wire64 ?
                                      wire63 : wire64) : $signed(wire61))}) : $signed((8'hb2)));
  assign wire66 = (^~{$signed($signed($signed((8'hbe))))});
  assign wire67 = ((^~($unsigned($signed(wire66)) <= wire63[(3'h5):(1'h1)])) > (!wire65[(1'h0):(1'h0)]));
  assign wire68 = (wire65 && (&$signed(wire67)));
endmodule

module module26
#(parameter param55 = (~(-{(((7'h44) != (7'h42)) ? ((8'haf) * (8'hbb)) : (|(8'hb9)))})))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire28;
  input wire signed [(2'h2):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire31 = $signed((~^(^~wire27)));
  assign wire32 = wire31[(3'h7):(3'h6)];
  assign wire33 = wire32;
  assign wire34 = ($unsigned({wire31[(4'ha):(4'h8)],
                          ((wire32 ? wire30 : wire30) ?
                              (wire29 ? wire27 : wire27) : (+wire28))}) ?
                      (wire29[(1'h0):(1'h0)] ?
                          $unsigned($signed((wire33 > wire32))) : $signed($signed((wire31 ?
                              wire28 : wire29)))) : (wire27 ?
                          ((~wire29) ?
                              $unsigned(wire31) : wire27[(2'h2):(2'h2)]) : (wire30 ?
                              wire30 : (~^wire28[(2'h2):(2'h2)]))));
  assign wire35 = ((7'h43) ?
                      $signed(wire33) : $unsigned(($signed($signed(wire34)) ^~ (^(^~wire31)))));
  assign wire36 = (wire29[(1'h1):(1'h0)] && $signed(wire29));
  always
    @(posedge clk) begin
      reg37 <= (wire28 * $signed((wire35 <= wire32[(3'h4):(2'h3)])));
      reg38 <= ({((!(|wire28)) ^ ($signed(wire32) * (wire31 ?
              (8'h9f) : wire27)))} || (^~$unsigned(($unsigned(wire33) <= {wire30}))));
      reg39 <= (^$unsigned($signed(reg38[(4'hc):(2'h3)])));
      reg40 <= $signed(($signed($signed((wire34 ?
          (8'hb8) : wire31))) == ((&$signed(wire28)) + $unsigned($unsigned(wire33)))));
    end
  assign wire41 = $signed($signed($unsigned(wire31[(1'h1):(1'h1)])));
  assign wire42 = $unsigned(({(~^(8'ha4)), ({reg39} <<< $unsigned(wire35))} ?
                      (^~$unsigned((~reg40))) : wire27));
  assign wire43 = $signed(wire33);
  assign wire44 = ($unsigned($unsigned($signed($signed(wire29)))) >> ({(wire33 == $signed(wire27))} ?
                      $unsigned((8'ha9)) : ({((8'hb5) ? wire42 : wire30)} ?
                          {(~wire30),
                              {wire35,
                                  wire32}} : $signed((wire41 != (8'hab))))));
  assign wire45 = ($unsigned($unsigned($signed($unsigned((8'hab))))) >= ($unsigned((+(wire30 ?
                          wire32 : wire30))) ?
                      $unsigned($signed((reg38 ? reg38 : wire44))) : wire34));
  assign wire46 = wire45[(2'h3):(1'h0)];
  assign wire47 = (reg37[(4'hd):(2'h2)] < $signed($signed($unsigned({wire31,
                      wire31}))));
  assign wire48 = ($unsigned($unsigned($signed((wire33 >= wire32)))) ?
                      wire47 : wire28);
  assign wire49 = {$unsigned(($unsigned(wire41) ?
                          $unsigned($signed(wire45)) : wire27[(1'h0):(1'h0)]))};
  assign wire50 = $signed(reg39[(2'h3):(2'h3)]);
  assign wire51 = wire47;
  assign wire52 = (~|reg37[(2'h3):(2'h2)]);
  assign wire53 = reg38[(5'h12):(4'ha)];
  assign wire54 = wire49[(1'h0):(1'h0)];
endmodule
