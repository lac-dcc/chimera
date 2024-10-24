module top
#(parameter param144 = ((^~((((8'haa) ? (8'ha6) : (8'hb4)) ? (8'h9d) : {(8'h9c), (8'had)}) >= (8'ha0))) ? ({({(7'h43)} ? {(8'hb1), (8'had)} : (^~(8'hb4))), (((8'hbc) ? (8'ha6) : (8'had)) ? (!(8'hb6)) : ((8'hb4) == (8'hb1)))} < (^~(^~(~|(8'ha1))))) : ((-((~(8'ha0)) ? (8'hb1) : (&(7'h42)))) <<< ((^(8'hb9)) ? ((-(7'h43)) ? ((8'hac) & (8'hba)) : ((7'h44) ? (8'hb0) : (8'h9f))) : (((8'ha3) ? (8'haf) : (8'hb6)) > (~(8'hbc)))))), 
parameter param145 = {(~&(-((param144 ? param144 : param144) ? param144 : (param144 ? param144 : param144))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire [(5'h12):(1'h0)] wire140;
  wire signed [(5'h10):(1'h0)] wire139;
  wire signed [(3'h6):(1'h0)] wire137;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire137,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = {wire2[(2'h2):(1'h0)],
                     ($unsigned((wire2 ?
                             wire3[(2'h3):(2'h3)] : (wire0 ? wire2 : wire1))) ?
                         wire2 : (^~$unsigned((wire3 >= wire2))))};
  assign wire5 = (^~($signed((~^wire4[(4'ha):(3'h5)])) & {wire0[(3'h4):(3'h4)],
                     wire1[(4'hb):(3'h7)]}));
  assign wire6 = ({(wire4[(4'ha):(3'h7)] & $unsigned((wire5 ^~ wire2)))} * $signed((8'hab)));
  assign wire7 = (~^(wire0 < wire4));
  assign wire8 = $signed(wire4);
  assign wire9 = (wire5 ?
                     (wire5[(4'hc):(3'h4)] ?
                         (|((wire3 ? wire0 : (8'ha0)) ?
                             wire5[(3'h7):(3'h6)] : $unsigned((8'had)))) : $signed(wire1)) : wire8);
  module10 #() modinst138 (.y(wire137), .wire12(wire4), .wire11(wire9), .clk(clk), .wire14(wire7), .wire13(wire1));
  assign wire139 = {(({{wire8}, wire4[(5'h11):(4'hb)]} ?
                           wire6 : (~wire3[(3'h4):(2'h2)])) + wire7[(5'h10):(3'h5)]),
                       (wire1[(4'hd):(3'h4)] < wire1)};
  assign wire140 = ((^($signed((^~wire8)) == $signed($signed(wire5)))) ?
                       $signed((^~((wire4 ~^ wire6) > {wire9}))) : wire5);
  assign wire141 = ((wire8[(3'h4):(3'h4)] ?
                       ({(wire9 ? wire9 : wire4)} ?
                           wire137 : {((8'ha7) >= wire4),
                               (&(8'h9f))}) : ((!$signed(wire6)) ?
                           $signed($signed(wire140)) : ($signed(wire139) && (^wire137)))) ~^ (wire4[(4'h8):(1'h0)] == (wire6 ?
                       (wire137[(1'h1):(1'h0)] + wire5) : ($unsigned(wire139) || wire2))));
  assign wire142 = $signed($signed((-(wire4[(1'h1):(1'h0)] ?
                       wire6 : $unsigned(wire140)))));
  assign wire143 = ((8'ha8) ? wire2[(1'h1):(1'h1)] : wire137);
endmodule

module module10
#(parameter param135 = (((&(((8'ha9) ? (8'hb1) : (8'h9f)) ? ((8'ha9) ? (8'ha4) : (8'hb9)) : ((8'ha1) || (8'hb9)))) ? ((((7'h41) == (8'hb2)) >>> {(8'hab), (8'ha8)}) ? (^~((8'h9d) ? (8'hae) : (8'hb3))) : (8'ha5)) : ((!(~(8'hb6))) != ((~&(8'hab)) ? {(8'hbb)} : (8'hae)))) ^~ ((7'h43) ? (^~(^((8'hab) ? (7'h43) : (8'hb5)))) : (~^(8'h9f)))), 
parameter param136 = param135)
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire133;
  wire signed [(5'h12):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire131;
  wire [(3'h7):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire127;
  wire [(5'h15):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire100;
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire102,
                 wire86,
                 wire57,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire15,
                 wire16,
                 wire48,
                 wire88,
                 wire100,
                 reg134,
                 reg56,
                 (1'h0)};
  assign wire15 = (|(~^(wire14[(5'h10):(2'h3)] <<< ({wire12, wire11} ?
                      $signed((8'h9f)) : (~|wire12)))));
  assign wire16 = (((~&$signed($unsigned(wire13))) - wire14[(3'h6):(1'h0)]) ?
                      wire11[(1'h0):(1'h0)] : (~&$unsigned($unsigned($signed(wire13)))));
  module17 #() modinst49 (.wire19(wire13), .y(wire48), .wire22(wire14), .wire18(wire11), .wire20(wire12), .clk(clk), .wire21(wire15));
  assign wire50 = (^(wire16 ?
                      (~|wire48[(2'h2):(1'h0)]) : $unsigned((&(wire48 ?
                          wire11 : wire15)))));
  assign wire51 = (wire50[(3'h5):(3'h5)] ?
                      wire12[(4'he):(4'h8)] : (((|$signed(wire14)) ?
                              ((-wire11) > $unsigned((8'ha0))) : $signed($unsigned(wire50))) ?
                          {$signed({wire15}),
                              wire11[(2'h3):(1'h1)]} : {$unsigned($signed(wire14))}));
  assign wire52 = wire15[(3'h6):(3'h5)];
  assign wire53 = $unsigned($signed(wire16));
  assign wire54 = wire51;
  assign wire55 = wire13[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg56 <= ((wire14[(3'h5):(3'h5)] | wire11) <<< wire48);
    end
  assign wire57 = (wire53 ?
                      (+wire51[(4'h9):(1'h1)]) : $unsigned($unsigned($signed((~^wire48)))));
  module58 #() modinst87 (wire86, clk, wire16, wire14, wire11, wire55, wire50);
  assign wire88 = wire57[(1'h1):(1'h0)];
  module89 #() modinst101 (.wire90(wire52), .clk(clk), .wire91(wire51), .wire93(wire50), .y(wire100), .wire92(wire57), .wire94(wire12));
  assign wire102 = (7'h41);
  module103 #() modinst128 (wire127, clk, wire86, reg56, wire100, wire16, wire50);
  assign wire129 = (($signed($signed((~wire52))) ?
                           $unsigned((^wire51[(4'he):(4'hc)])) : $unsigned({wire16})) ?
                       ($signed(((^wire53) ?
                           wire127[(4'ha):(3'h5)] : wire57)) >> ((-(~|wire14)) | $unsigned((wire51 < wire51)))) : wire15);
  assign wire130 = wire57;
  assign wire131 = (-$signed(((wire11 ^ wire13[(2'h2):(2'h2)]) ?
                       {wire12} : $unsigned($signed(wire51)))));
  assign wire132 = wire16;
  assign wire133 = $signed($signed((~^wire12)));
  always
    @(posedge clk) begin
      reg134 <= (wire100[(2'h3):(2'h3)] & wire86[(5'h10):(1'h0)]);
    end
endmodule

module module103  (y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire108;
  input wire signed [(5'h11):(1'h0)] wire107;
  input wire signed [(5'h14):(1'h0)] wire106;
  input wire signed [(3'h4):(1'h0)] wire105;
  input wire signed [(3'h6):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire109;
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(3'h7):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
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
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire109 = $signed(($signed(((^wire104) ~^ $signed(wire106))) ?
                       (~wire104) : $signed($unsigned((wire107 ?
                           wire107 : (8'hac))))));
  assign wire110 = $unsigned({$signed($signed((8'hbf)))});
  assign wire111 = wire108[(4'h9):(3'h6)];
  always
    @(posedge clk) begin
      reg112 <= ((wire111 ?
          (8'hb5) : ((wire108[(4'h8):(4'h8)] ?
              (~&(8'hbb)) : (wire106 | wire111)) | $signed((wire111 ?
              (8'hb7) : wire104)))) ^~ $signed((8'ha5)));
      if (wire111[(3'h6):(3'h6)])
        begin
          reg113 <= $unsigned($unsigned(((-wire106[(4'hf):(4'hd)]) ?
              wire108 : (wire105[(1'h1):(1'h1)] ?
                  (~|wire111) : wire111[(2'h2):(1'h1)]))));
          if ((((reg113 * wire109[(3'h7):(3'h4)]) ?
              $unsigned((((8'hbc) ? wire109 : wire109) ?
                  wire109 : (wire108 ?
                      wire107 : wire110))) : ($unsigned(wire105) && wire108)) << (wire110 ?
              wire108[(3'h6):(2'h3)] : $signed($signed(wire110)))))
            begin
              reg114 <= (({$unsigned(wire110)} << $signed(((~&wire111) ?
                  $signed(wire105) : $signed(wire105)))) && $unsigned(wire110));
              reg115 <= wire108[(4'ha):(4'h9)];
              reg116 <= reg112[(1'h1):(1'h0)];
              reg117 <= wire111[(3'h4):(2'h3)];
              reg118 <= (~(($signed($signed(wire111)) & wire106[(4'hc):(2'h2)]) || $unsigned(((reg115 ?
                      wire109 : wire107) ?
                  (reg116 <= (8'haa)) : {wire107, wire107}))));
            end
          else
            begin
              reg114 <= (!(reg116[(3'h6):(2'h2)] ?
                  {(+(8'hb7))} : wire106[(3'h6):(3'h6)]));
              reg115 <= reg116;
              reg116 <= (+(!reg113[(1'h1):(1'h1)]));
              reg117 <= ($unsigned($unsigned(reg112[(1'h0):(1'h0)])) ?
                  (~|wire110[(4'hd):(1'h0)]) : (8'hac));
            end
          reg119 <= ((^(((~&(8'h9c)) ? $signed(reg114) : (^~wire108)) ?
              $signed((~&reg115)) : ((reg116 * wire109) ?
                  (~^wire110) : $unsigned(wire109)))) < reg115);
        end
      else
        begin
          reg113 <= {$signed((8'had))};
          reg114 <= ({wire110,
              ((^~reg113[(3'h7):(3'h4)]) ^ {(|wire110), {reg112}})} != wire111);
          reg115 <= (~&(^~(reg113 && $unsigned({reg117, reg113}))));
        end
      if ($unsigned(wire111))
        begin
          reg120 <= (^~$unsigned($signed({{wire110, reg112}, reg115})));
          if ((8'hb0))
            begin
              reg121 <= reg116;
              reg122 <= {(!$signed((~^$signed(wire108))))};
            end
          else
            begin
              reg121 <= (((($unsigned(reg115) >= (^~(8'ha7))) >>> $signed($signed(wire105))) ?
                      ($unsigned(reg114[(2'h2):(2'h2)]) | reg116) : reg118) ?
                  {{((reg112 >>> reg119) ? $signed(wire106) : wire111),
                          ((|reg118) ? $unsigned(wire105) : {reg114})},
                      $signed($unsigned($signed(reg114)))} : $unsigned($unsigned(($unsigned(wire108) ?
                      (reg116 ? wire107 : wire104) : $unsigned(wire108)))));
            end
        end
      else
        begin
          reg120 <= $unsigned($signed(reg121[(2'h2):(1'h1)]));
          if (((reg117[(5'h10):(3'h4)] ?
                  {reg119[(2'h2):(2'h2)]} : $signed($signed($signed(reg112)))) ?
              {{$unsigned($unsigned(reg115))}} : (+{$signed((!reg115)),
                  (~wire104)})))
            begin
              reg121 <= wire110;
              reg122 <= reg119;
              reg123 <= $unsigned(((((^reg114) && reg116) > (^~$signed(reg113))) ?
                  $signed(((reg118 | reg112) ?
                      $signed(reg112) : ((8'hb5) ?
                          reg115 : reg120))) : (~&{(~reg114),
                      reg117[(4'h9):(3'h7)]})));
              reg124 <= (((((^reg112) ~^ (reg120 ?
                  wire111 : wire108)) * $unsigned(reg118)) > $unsigned(({wire110} ?
                  (~|wire108) : reg121))) & (8'ha2));
            end
          else
            begin
              reg121 <= (wire110[(3'h5):(3'h5)] ?
                  ((((8'hbf) << $signed((8'hb6))) || $signed((reg118 ?
                          wire111 : wire105))) ?
                      {$unsigned((reg114 ?
                              wire111 : wire110))} : wire108[(3'h5):(1'h0)]) : reg112);
            end
        end
      reg125 <= (wire107 >>> reg118);
      reg126 <= ($signed({(^~((7'h44) >>> wire108))}) ? wire108 : reg114);
    end
endmodule

module module89  (y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h1f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire94;
  input wire [(5'h11):(1'h0)] wire93;
  input wire [(4'ha):(1'h0)] wire92;
  input wire [(5'h12):(1'h0)] wire91;
  input wire [(5'h11):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire95;
  assign y = {wire99, wire98, wire97, wire96, wire95, (1'h0)};
  assign wire95 = {(~|(wire91[(1'h1):(1'h1)] <<< $unsigned(wire90))), wire93};
  assign wire96 = (8'ha7);
  assign wire97 = wire93;
  assign wire98 = wire90[(2'h3):(2'h3)];
  assign wire99 = {wire93};
endmodule

module module58
#(parameter param85 = (^((({(8'hb9)} ? {(8'hbf)} : {(7'h41), (7'h42)}) & (((8'hb0) ? (8'hb5) : (8'hbe)) <= {(8'hb3)})) << (~|(((8'hb7) ? (8'hae) : (8'ha0)) >>> (!(8'hb3)))))))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire63;
  input wire [(2'h3):(1'h0)] wire62;
  input wire [(4'he):(1'h0)] wire61;
  input wire signed [(4'ha):(1'h0)] wire60;
  input wire [(3'h6):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire78;
  wire signed [(4'hc):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire [(3'h4):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  assign y = {wire84,
                 wire83,
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
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg69,
                 (1'h0)};
  assign wire64 = wire61;
  assign wire65 = $signed((+$unsigned($unsigned(((8'ha7) >= wire62)))));
  assign wire66 = wire63;
  assign wire67 = ($signed($signed(wire65[(2'h2):(1'h1)])) || $unsigned($signed((8'ha1))));
  assign wire68 = $signed((^$unsigned({wire61, {wire59}})));
  always
    @(posedge clk) begin
      reg69 <= (wire66 >= ($signed(wire60) ?
          (((&wire64) >= (wire66 << wire60)) <<< wire59[(2'h2):(2'h2)]) : $signed(wire63[(1'h0):(1'h0)])));
    end
  assign wire70 = $unsigned(wire68);
  assign wire71 = wire64;
  assign wire72 = $unsigned({(($signed(wire70) >> $signed(wire64)) << ($unsigned(wire64) != (wire61 | (8'ha4))))});
  assign wire73 = wire68[(4'h9):(2'h3)];
  assign wire74 = $unsigned((wire70[(1'h0):(1'h0)] ?
                      wire59 : ($unsigned((wire62 != wire73)) ?
                          wire64 : wire73)));
  assign wire75 = (!(&((((8'ha5) > wire74) ?
                      {wire72} : wire68) & {wire59[(3'h5):(1'h1)]})));
  assign wire76 = wire72;
  assign wire77 = {({({wire74,
                              (8'hb1)} * wire61[(2'h3):(2'h2)])} * ($unsigned(wire64[(3'h7):(2'h2)]) ?
                          wire76[(2'h2):(1'h0)] : wire72))};
  assign wire78 = wire76[(5'h12):(3'h7)];
  assign wire79 = wire77;
  assign wire80 = $unsigned(wire68);
  assign wire81 = $unsigned(({({wire75,
                          (7'h41)} > $unsigned(wire80))} >> ({(wire63 ^ (8'hb3)),
                      {wire63}} & (~^wire78))));
  assign wire82 = $unsigned($signed($signed(($unsigned(reg69) <<< $unsigned(wire71)))));
  assign wire83 = wire78[(4'he):(3'h6)];
  assign wire84 = (~&$signed(wire81[(1'h0):(1'h0)]));
endmodule

module module17
#(parameter param46 = {(((((8'ha8) ^~ (8'h9c)) ? ((8'hb7) ? (8'h9f) : (8'hae)) : ((7'h42) ? (8'hbb) : (8'hbc))) ? (((8'h9f) - (8'hb5)) < {(7'h43), (8'hac)}) : (((8'hb9) ? (7'h43) : (8'ha6)) ^~ (~^(8'ha6)))) ? {(((8'h9e) ? (8'hbd) : (8'ha5)) ? ((8'had) ? (8'hb5) : (8'hb8)) : ((8'hbe) ? (8'hae) : (8'ha8)))} : ((((8'ha6) & (8'hb3)) ^~ ((8'ha0) && (8'haa))) ~^ (~|(8'hbc)))), (((~((8'hb5) ? (7'h43) : (7'h42))) <= (-(^(8'hbb)))) ? ((8'ha5) <= ((+(8'had)) ? ((7'h42) ? (8'ha9) : (8'hb5)) : ((8'hb6) > (8'hba)))) : {(+((8'hae) ? (8'hbe) : (8'ha4))), (((8'hb0) ^~ (8'hba)) || ((8'haa) ? (8'ha6) : (8'ha8)))})}, 
parameter param47 = (param46 ? {({(param46 || param46), ((8'ha5) ? param46 : param46)} ? (~&{param46}) : ((param46 >> param46) ~^ (~&param46))), (+param46)} : (&{(&{param46})})))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire21;
  input wire [(5'h11):(1'h0)] wire20;
  input wire [(4'h9):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
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
                 (1'h0)};
  assign wire23 = (|$signed((+$unsigned($unsigned(wire18)))));
  assign wire24 = $signed(((+{(wire21 ? wire20 : (8'hb4)),
                      $unsigned(wire20)}) - wire23));
  assign wire25 = $signed((^wire22[(1'h0):(1'h0)]));
  assign wire26 = $unsigned((({$signed(wire22),
                      wire25} || ((wire23 >= wire18) && (^wire18))) << (~wire21)));
  always
    @(posedge clk) begin
      reg27 <= $signed($unsigned($signed(($signed((8'hbf)) != (wire23 <= wire25)))));
      if ($signed((wire22 < wire22)))
        begin
          if ((!reg27[(4'h8):(1'h0)]))
            begin
              reg28 <= ((~&$unsigned(((wire26 <= wire20) ? wire19 : (8'hb4)))) ?
                  $unsigned(reg27) : (+{$unsigned((~&wire22))}));
              reg29 <= wire18[(4'he):(4'hc)];
              reg30 <= (+(-$unsigned(((~&wire21) ? wire18 : (|wire26)))));
              reg31 <= wire25;
              reg32 <= (!wire22[(1'h0):(1'h0)]);
            end
          else
            begin
              reg28 <= (|reg27[(2'h2):(1'h1)]);
            end
          reg33 <= $unsigned((~|reg28));
          if (reg28)
            begin
              reg34 <= $unsigned(($signed(($signed(reg29) ?
                      reg27[(2'h3):(1'h1)] : (reg28 ? wire25 : wire19))) ?
                  ($signed($signed(reg31)) ^ ((wire25 ? wire26 : reg29) ?
                      (~|reg27) : (~^reg32))) : ((8'hb5) < reg28)));
              reg35 <= wire20[(4'h8):(3'h6)];
              reg36 <= wire26[(3'h6):(2'h3)];
              reg37 <= $signed((+(((reg28 ?
                  reg29 : (8'hba)) * wire26) > reg27[(4'ha):(3'h6)])));
            end
          else
            begin
              reg34 <= reg36;
              reg35 <= $signed(((&({wire20} ?
                  ((8'h9c) ? wire25 : wire19) : (^wire21))) < reg35));
              reg36 <= wire20;
              reg37 <= (((8'ha4) ? $signed((|$signed(reg30))) : (~^wire23)) ?
                  wire18[(5'h12):(4'hc)] : ($unsigned((~{wire19})) << (~|((wire26 * (8'hb2)) && {(8'h9c),
                      reg37}))));
            end
          reg38 <= {((~^reg35) || $signed(wire23))};
        end
      else
        begin
          reg28 <= (~$unsigned(wire25));
          if ((^(|wire20)))
            begin
              reg29 <= (|$unsigned($signed($signed((~wire21)))));
              reg30 <= $unsigned((-reg31));
              reg31 <= wire24;
              reg32 <= reg37[(2'h3):(1'h1)];
            end
          else
            begin
              reg29 <= (+wire25[(3'h5):(3'h4)]);
              reg30 <= (^((reg30[(4'h8):(3'h6)] ?
                      (((8'hae) ? wire26 : reg35) & (reg31 ?
                          (8'hb5) : reg30)) : ((reg37 ?
                          wire24 : wire20) < $signed(reg31))) ?
                  $signed((((8'hb5) ^~ reg37) | $unsigned(wire26))) : $unsigned(reg27)));
              reg31 <= (!$signed((8'ha2)));
              reg32 <= ($signed(((-(wire19 ?
                  reg31 : wire18)) <= $signed((reg37 == wire24)))) ^~ (wire22 | (wire21 ?
                  $unsigned($unsigned(reg35)) : $signed(reg29))));
              reg33 <= ((+(^~$unsigned((reg38 != reg30)))) ?
                  $signed((&((8'hb3) == $signed(reg27)))) : $unsigned($unsigned(((reg27 ?
                      reg33 : (8'hb3)) >>> {(8'hbe), reg37}))));
            end
        end
      if ($unsigned(reg30[(1'h0):(1'h0)]))
        begin
          reg39 <= $signed(reg33[(4'h8):(3'h7)]);
          reg40 <= $unsigned((reg32 ?
              ((&{(8'hab), wire25}) ?
                  $unsigned($unsigned(reg36)) : {$unsigned(reg33),
                      (-reg29)}) : ((wire21[(1'h1):(1'h0)] ~^ {reg36,
                  reg30}) * reg28[(3'h6):(2'h2)])));
          reg41 <= {wire25};
        end
      else
        begin
          reg39 <= {reg29[(3'h6):(3'h6)]};
          reg40 <= (($signed($unsigned($signed(reg35))) ?
                  $signed(reg41[(4'he):(4'hd)]) : wire26[(5'h10):(4'ha)]) ?
              $signed(wire21) : (^~$signed((!$signed(reg36)))));
          reg41 <= $signed(wire20[(2'h3):(1'h0)]);
          if (reg30[(4'h8):(1'h0)])
            begin
              reg42 <= $unsigned(reg33);
              reg43 <= (reg33 ? wire22 : reg29[(3'h6):(2'h3)]);
            end
          else
            begin
              reg42 <= ($unsigned(($signed($signed(wire24)) ?
                      (+reg27) : ((wire18 ? reg32 : reg31) ?
                          $unsigned(reg42) : (reg33 ^~ reg36)))) ?
                  $signed((~|(~$signed((8'hbf))))) : {(|$signed(wire23[(2'h3):(2'h2)]))});
              reg43 <= reg34[(3'h7):(2'h2)];
              reg44 <= wire25;
            end
        end
      reg45 <= {(^({(reg41 ? reg35 : wire24)} ?
              reg29[(4'hc):(3'h6)] : (8'hbc)))};
    end
endmodule
