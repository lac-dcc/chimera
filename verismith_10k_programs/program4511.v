module top
#(parameter param132 = (&((8'hab) ? {((~(8'hb6)) ? ((8'hbc) <<< (8'ha6)) : ((8'had) ^ (8'haf))), ({(8'ha4)} >= {(8'hb8), (8'hb0)})} : (&(~&(&(8'ha6)))))), 
parameter param133 = (param132 ? {(((!(8'h9f)) ? (param132 ? (8'hb5) : param132) : {param132, param132}) ? (&(param132 < (8'hb5))) : ((param132 * param132) ? (~|param132) : (param132 ? param132 : param132)))} : ((~|{(param132 ? param132 : param132), (param132 ? param132 : param132)}) ? param132 : (((^~param132) ^~ {param132}) <= param132))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(3'h4):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire5,
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
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire5 = ((~|((8'h9f) ?
                     (^~(wire1 >= wire0)) : {{wire3, wire0}})) <= wire1);
  module6 #() modinst108 (wire107, clk, wire0, wire3, wire5, wire1);
  assign wire109 = {$unsigned((8'ha6)), (~&$unsigned(wire3))};
  assign wire110 = wire1[(3'h4):(3'h4)];
  assign wire111 = $signed(wire107);
  assign wire112 = wire1[(5'h15):(2'h3)];
  assign wire113 = $unsigned(((((!(7'h40)) ^ $signed(wire4)) <= $signed(((8'hac) ?
                           wire5 : wire109))) ?
                       $unsigned(((wire0 & wire1) ?
                           (8'had) : ((8'ha3) >> (8'hb5)))) : wire2));
  always
    @(posedge clk) begin
      reg114 <= $unsigned($signed(((wire113 ?
              $unsigned((8'ha9)) : (wire107 ? wire4 : (8'hb0))) ?
          (~^((8'hbe) ? wire107 : (8'hb0))) : wire111[(3'h7):(3'h6)])));
      if (((^~{(7'h42), $signed((+wire3))}) ?
          $signed($signed({(~wire4)})) : {(+{(reg114 - (7'h42)), (^wire2)}),
              (!(!$unsigned(reg114)))}))
        begin
          reg115 <= (8'hb4);
          reg116 <= ((($unsigned((&wire109)) << $signed($signed((7'h40)))) <= wire110[(1'h1):(1'h1)]) ?
              $signed($unsigned((((7'h40) ^ wire3) ?
                  {wire109} : $signed(wire113)))) : {$signed(reg114),
                  wire112[(3'h6):(1'h1)]});
        end
      else
        begin
          reg115 <= $signed($unsigned($unsigned(wire4)));
          if (($signed((wire110 >= ((wire111 ? reg115 : reg115) ?
              $signed(wire112) : wire5))) && $unsigned((($unsigned(wire113) ?
                  reg116 : wire113[(3'h5):(3'h4)]) ?
              $signed((wire3 ?
                  (8'hac) : wire113)) : $unsigned($unsigned(wire5))))))
            begin
              reg116 <= ($unsigned($signed(($signed(wire4) ?
                      (wire113 ? wire109 : wire112) : {reg116}))) ?
                  $signed($unsigned((^(8'hb5)))) : wire2[(1'h0):(1'h0)]);
              reg117 <= wire0;
              reg118 <= wire2;
            end
          else
            begin
              reg116 <= $signed(({wire110,
                      {(wire111 > wire109), $signed(reg114)}} ?
                  {$signed({reg114}), reg118} : wire2[(5'h12):(4'hc)]));
              reg117 <= $unsigned((8'hbc));
              reg118 <= (~^$signed((($unsigned(reg115) ?
                      wire113[(5'h11):(3'h4)] : {wire110}) ?
                  ((wire1 <= wire113) ~^ {reg114}) : $unsigned((wire110 ?
                      (8'ha9) : wire5)))));
              reg119 <= $unsigned($signed(reg118));
            end
          reg120 <= reg114;
          reg121 <= ((^~$signed(wire5)) >= ((wire3 <= ({(8'ha6),
              wire107} >= wire4)) ^ (wire2 ?
              (((8'hbe) + reg115) ?
                  reg115 : (reg114 || reg120)) : ($unsigned(reg119) <<< reg120))));
        end
      if ((wire1[(2'h2):(1'h0)] ?
          $signed(($signed(reg121) ~^ ($signed(wire5) != $unsigned(reg115)))) : wire110[(1'h1):(1'h1)]))
        begin
          reg122 <= (((wire113[(1'h0):(1'h0)] && (8'haf)) ?
                  ($signed((wire110 ? wire4 : wire110)) ?
                      (~$unsigned(wire5)) : reg116) : $unsigned(($signed(wire110) ?
                      (wire4 ? wire1 : wire2) : $unsigned(reg116)))) ?
              (~&(($unsigned((8'hb3)) | (&(7'h41))) << (^~{(8'ha7),
                  reg121}))) : $signed($signed((8'h9d))));
        end
      else
        begin
          reg122 <= ({($unsigned({wire2, reg121}) ~^ ((+wire3) ?
                  ((8'hb4) >> (8'hbe)) : wire3[(2'h2):(2'h2)]))} > reg122[(1'h0):(1'h0)]);
          reg123 <= (^~(reg119[(3'h7):(2'h3)] ?
              (-{$signed(reg117), reg114}) : (|wire3[(4'hb):(3'h5)])));
        end
      if ({$signed(wire4)})
        begin
          reg124 <= $signed((8'hb2));
          reg125 <= (-(wire113[(1'h1):(1'h1)] ?
              ($signed($unsigned(reg121)) >> (~|wire112[(3'h5):(3'h4)])) : wire109[(2'h3):(1'h1)]));
          reg126 <= wire111[(5'h10):(3'h6)];
          if ($unsigned($unsigned($unsigned({(^~wire5),
              wire4[(2'h3):(1'h0)]}))))
            begin
              reg127 <= reg117[(3'h5):(3'h4)];
            end
          else
            begin
              reg127 <= $signed(wire112[(3'h4):(2'h3)]);
              reg128 <= $signed((8'hb0));
              reg129 <= reg121;
              reg130 <= reg116[(4'h9):(3'h4)];
            end
        end
      else
        begin
          reg124 <= $unsigned(($unsigned((8'hbf)) >= reg120[(1'h1):(1'h0)]));
          reg125 <= (($signed($unsigned(reg117[(3'h7):(2'h2)])) < $unsigned(($unsigned(reg126) ?
              wire111 : (wire4 != reg120)))) != {wire107[(4'hc):(3'h6)]});
          if ($unsigned((((((7'h41) + wire4) ?
              $signed(wire3) : reg114[(3'h4):(1'h1)]) ~^ (|reg128[(2'h3):(2'h2)])) - ((((8'hab) | (8'hab)) ?
              $signed(wire109) : wire2[(4'hc):(4'h8)]) <<< (+((8'ha2) ?
              reg114 : reg121))))))
            begin
              reg126 <= $signed($unsigned($unsigned((~^(reg115 && wire110)))));
              reg127 <= $signed((&(8'hb5)));
              reg128 <= {{($signed($unsigned((8'hb0))) ?
                          ((7'h41) - $unsigned(reg116)) : $signed({reg125,
                              reg127}))},
                  {{(^~$unsigned((8'ha2)))},
                      ($unsigned(reg118[(5'h11):(3'h4)]) ?
                          (|(reg123 ? wire1 : reg120)) : wire0)}};
            end
          else
            begin
              reg126 <= $signed((^(~(^~$signed(wire5)))));
              reg127 <= {(($unsigned($unsigned(reg118)) ?
                      reg114[(3'h4):(1'h0)] : (~{wire113,
                          wire0})) <= $signed($unsigned((reg125 == reg120))))};
            end
          reg129 <= (wire1[(4'h8):(3'h7)] ~^ ((8'h9e) ?
              ({wire0[(2'h3):(2'h2)]} < reg125[(3'h5):(1'h0)]) : wire5));
        end
      reg131 <= $signed(reg114);
    end
endmodule

module module6
#(parameter param105 = ((&(-((!(8'hbc)) ? ((8'hab) ? (7'h43) : (8'h9f)) : ((8'hbc) <= (8'hb6))))) ? (8'h9e) : ({(((8'hbc) - (8'hbe)) ? ((8'hb1) >> (8'hab)) : {(8'hba)})} == ((~&(~&(7'h43))) <= ({(8'ha6)} + ((8'hbe) ? (8'hb4) : (8'hb7)))))), 
parameter param106 = param105)
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire100;
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  assign y = {wire104,
                 wire102,
                 wire60,
                 wire16,
                 wire12,
                 wire11,
                 wire62,
                 wire63,
                 wire100,
                 reg103,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire11 = (((wire9 | ((+wire7) < $unsigned(wire8))) >= (+$signed((wire10 <= wire7)))) ?
                      $unsigned(((~&(~^wire9)) << wire8[(3'h4):(2'h2)])) : $signed($signed((8'h9e))));
  assign wire12 = $signed(((7'h41) ?
                      ($unsigned($unsigned(wire10)) <<< ((~|(8'hbc)) ?
                          $signed(wire7) : (^wire11))) : ({(-wire9)} ?
                          (~$unsigned(wire9)) : $signed($unsigned(wire9)))));
  always
    @(posedge clk) begin
      reg13 <= (wire11 ?
          $unsigned(((8'hbd) - (~^$signed(wire10)))) : $unsigned(wire11));
      reg14 <= (~|wire7[(1'h1):(1'h0)]);
      reg15 <= reg13;
    end
  assign wire16 = reg13;
  module17 #() modinst61 (wire60, clk, wire11, wire12, reg15, wire10, reg13);
  assign wire62 = $unsigned(reg14[(1'h0):(1'h0)]);
  assign wire63 = ((reg14[(1'h1):(1'h1)] ?
                      $signed((wire60[(5'h14):(4'hc)] * {wire8})) : $unsigned($signed({wire10}))) >>> wire60[(5'h14):(5'h11)]);
  module64 #() modinst101 (wire100, clk, wire63, wire10, reg15, wire9);
  assign wire102 = wire9;
  always
    @(posedge clk) begin
      reg103 <= $signed(reg14[(1'h1):(1'h0)]);
    end
  assign wire104 = {(+($unsigned(((7'h44) + wire16)) <= (((8'hb7) > wire16) ?
                           wire100[(1'h1):(1'h0)] : wire60)))};
endmodule

module module64
#(parameter param98 = (((~{(8'hbf), ((8'ha0) ? (8'ha6) : (8'ha1))}) ? (({(8'h9c)} ? (~|(8'hb5)) : ((8'ha3) ? (8'hb7) : (8'ha9))) ? {(+(8'ha0))} : (|((8'ha3) ? (8'hb7) : (8'ha9)))) : ((8'hab) ? (8'ha7) : (((8'haf) ? (8'ha0) : (8'ha7)) - (^~(8'ha9))))) <= (((+(^(8'hab))) * {{(8'hbf)}, (~(8'haf))}) ? (8'haa) : ({((8'ha5) & (8'ha6))} | {{(8'hbf), (7'h40)}}))), 
parameter param99 = (param98 ? param98 : (((+(param98 <= param98)) << (8'ha1)) >>> (+(((8'hac) ? param98 : param98) > param98)))))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire68;
  input wire signed [(2'h3):(1'h0)] wire67;
  input wire [(5'h15):(1'h0)] wire66;
  input wire signed [(4'ha):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire84,
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
                 wire69,
                 reg97,
                 reg96,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire69 = (8'hb3);
  assign wire70 = wire65[(3'h7):(2'h2)];
  assign wire71 = (~&(&(wire69[(4'h9):(3'h5)] == wire66)));
  assign wire72 = wire69;
  assign wire73 = ((8'ha4) ?
                      $unsigned((($unsigned(wire66) ?
                          (7'h43) : {wire72, wire68}) >>> (((8'h9c) ?
                              wire65 : wire67) ?
                          $unsigned(wire66) : (wire66 ?
                              wire65 : (8'had))))) : $unsigned($signed(wire70[(1'h0):(1'h0)])));
  assign wire74 = (7'h44);
  assign wire75 = $signed({(({wire65, wire68} ?
                              wire72[(3'h6):(3'h4)] : (wire66 ?
                                  wire74 : wire72)) ?
                          (^(wire69 >>> wire73)) : $unsigned(wire73[(4'h9):(3'h5)]))});
  assign wire76 = ((^(-(wire66 ? wire66 : wire72))) ?
                      (~({(wire67 << wire71),
                          (wire75 ?
                              wire67 : wire71)} ~^ wire65[(3'h4):(2'h2)])) : ($unsigned($signed((wire75 <= wire65))) ?
                          (!(-{(8'hb3), wire66})) : (~^($signed(wire66) ?
                              (wire71 ?
                                  wire69 : (7'h43)) : (wire73 ^~ wire73)))));
  assign wire77 = {(8'hbe), wire70};
  assign wire78 = {wire76[(2'h2):(1'h1)]};
  assign wire79 = (^($unsigned($signed((wire67 ^ wire73))) * ((wire66 ?
                      wire77 : {(8'hbe), wire66}) < wire68)));
  assign wire80 = (|$unsigned($signed((8'hbb))));
  assign wire81 = (({(~^wire78[(3'h6):(3'h4)])} ?
                          $signed((^(wire65 > wire71))) : $unsigned(wire66)) ?
                      {(|$unsigned((wire66 ? wire72 : wire68))),
                          {wire76[(1'h1):(1'h1)],
                              ((wire73 << wire75) ?
                                  $unsigned(wire77) : $signed(wire79))}} : wire71[(5'h12):(5'h12)]);
  assign wire82 = wire79[(4'hb):(3'h6)];
  assign wire83 = ((wire77[(4'ha):(4'ha)] + $unsigned(wire74[(1'h1):(1'h0)])) ?
                      (wire77[(4'hf):(4'h8)] ?
                          $signed(wire67[(1'h1):(1'h1)]) : ((~^$signed((8'hbf))) ^ (8'h9c))) : wire65[(4'h8):(3'h4)]);
  assign wire84 = ($unsigned(($unsigned((wire71 ? wire67 : wire70)) ?
                          wire83 : (~|$unsigned(wire77)))) ?
                      $unsigned(($signed((~&wire75)) ?
                          $unsigned(wire70[(1'h0):(1'h0)]) : (^~((8'hbe) - (8'ha8))))) : wire71);
  always
    @(posedge clk) begin
      reg85 <= (-($unsigned($signed({wire67, (8'hb8)})) ?
          wire71[(5'h10):(4'hc)] : wire69));
      reg86 <= (wire78 - wire76);
      reg87 <= wire65;
      if ({((wire83[(1'h0):(1'h0)] * ({wire84} ~^ (reg87 ? wire73 : wire73))) ?
              $unsigned(((wire69 <= wire73) & $signed(wire84))) : ($signed($signed(wire65)) ?
                  wire82[(1'h1):(1'h1)] : (~&(wire70 - wire70)))),
          {((((8'hb7) ? wire78 : (8'hb3)) ?
                      (wire83 ? wire83 : (8'hbe)) : reg85) ?
                  {wire71[(5'h14):(5'h12)]} : (+$unsigned(wire72)))}})
        begin
          reg88 <= $unsigned($signed(($unsigned((wire76 ? wire73 : wire79)) ?
              ($unsigned(reg85) <= wire72[(3'h4):(3'h4)]) : {wire69})));
          reg89 <= $unsigned(((^reg85) ?
              (wire76[(4'hc):(1'h1)] ?
                  $unsigned({wire82}) : (^(^~wire79))) : wire65));
        end
      else
        begin
          reg88 <= {(wire65[(4'h8):(1'h1)] << wire79[(1'h1):(1'h0)]),
              (((&wire66[(4'he):(4'hc)]) ?
                  $signed((wire76 ?
                      wire78 : reg87)) : $signed(wire65)) ^ ((~|(wire81 ~^ wire79)) ?
                  wire71[(3'h5):(2'h2)] : reg89[(4'h9):(3'h6)]))};
          reg89 <= (wire67[(2'h2):(1'h0)] ?
              $unsigned($signed(reg88[(3'h4):(2'h3)])) : ({($signed(wire74) | (~wire68)),
                      $unsigned(wire70[(1'h1):(1'h1)])} ?
                  (~^({(8'hbb), (8'hac)} ?
                      wire71 : (^wire73))) : $unsigned((+$unsigned(wire72)))));
          reg90 <= $unsigned($unsigned((((-wire83) ?
              (+(7'h42)) : $unsigned(wire83)) ~^ $unsigned(reg89[(3'h4):(3'h4)]))));
          reg91 <= wire80[(4'h9):(3'h4)];
        end
      reg92 <= reg90;
    end
  assign wire93 = $signed(wire80);
  assign wire94 = $unsigned((wire76 ^ $unsigned(($signed(wire75) ?
                      (wire73 ? wire69 : wire65) : ((8'ha9) ?
                          reg87 : (8'h9c))))));
  assign wire95 = (|$unsigned(wire72));
  always
    @(posedge clk) begin
      reg96 <= ({reg88} ?
          wire78[(4'ha):(4'h9)] : (($signed($unsigned(wire79)) ^ (wire79 ?
                  (reg89 == reg92) : $unsigned(wire75))) ?
              ($unsigned($signed(reg86)) ?
                  (!(~wire83)) : ($signed(wire69) & (wire76 ?
                      wire94 : (8'hae)))) : (reg90[(3'h7):(2'h2)] ^~ ($signed(wire74) ?
                  $signed(reg87) : (reg85 ? wire94 : wire83)))));
      reg97 <= reg89[(4'h8):(3'h6)];
    end
endmodule

module module17
#(parameter param58 = ({{((8'h9f) >>> ((8'hb2) ? (7'h41) : (7'h44))), (!(~|(8'hb3)))}} ? (!(((^~(7'h42)) ? ((8'ha8) ? (7'h44) : (8'hb7)) : ((8'had) < (7'h44))) != ((^(8'hb0)) ? ((8'ha5) ? (8'h9e) : (8'h9c)) : ((8'hb9) ^~ (8'h9d))))) : ((~^({(8'hb6)} ? {(8'ha0)} : {(7'h44)})) ^~ ((((8'hae) > (7'h41)) ? ((8'ha3) ? (8'h9c) : (8'hb6)) : (~&(8'h9c))) ? (~^(^(8'hb4))) : {((7'h41) ? (8'h9f) : (8'hab))}))), 
parameter param59 = ({(param58 << (~|(param58 >>> param58))), (+{(param58 ? param58 : param58), ((8'ha9) ? param58 : param58)})} ? (param58 | {((&param58) ? (+param58) : (param58 >>> param58))}) : (^(param58 >= param58))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire22;
  input wire [(2'h3):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire [(5'h15):(1'h0)] wire19;
  input wire [(3'h4):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  assign y = {wire57,
                 wire43,
                 wire42,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire30,
                 wire29,
                 wire25,
                 wire24,
                 wire23,
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
                 reg41,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire23 = (&wire21);
  assign wire24 = {((~wire20[(3'h5):(1'h1)]) ?
                          wire20[(5'h15):(1'h0)] : {wire18[(2'h2):(2'h2)],
                              $signed(wire21[(2'h3):(2'h3)])}),
                      wire21};
  assign wire25 = wire19[(5'h15):(4'hb)];
  always
    @(posedge clk) begin
      reg26 <= {$unsigned($signed($unsigned({(8'hb5), wire19}))),
          wire25[(4'ha):(3'h5)]};
      reg27 <= $signed($signed({{(^~wire24)}, wire23}));
      reg28 <= ({(+wire19[(4'h8):(3'h5)]),
          $unsigned(wire22[(2'h2):(1'h1)])} <<< ($unsigned(wire19) != $unsigned((^wire21))));
    end
  assign wire29 = (+$signed({(!$signed(wire22)),
                      ($unsigned(wire19) ? wire18 : (^~wire23))}));
  assign wire30 = wire19;
  always
    @(posedge clk) begin
      reg31 <= {wire18[(2'h2):(1'h1)],
          $unsigned($signed($unsigned({wire29, wire24})))};
      reg32 <= ($unsigned((wire21 >>> {$unsigned(wire25),
          {reg28}})) >>> {wire24, wire22});
      reg33 <= (!(reg26[(2'h3):(2'h3)] & (|wire23[(2'h3):(1'h1)])));
      reg34 <= $unsigned(((^((~&(8'hb6)) << (reg32 ? (7'h40) : wire30))) ?
          $signed(wire23[(1'h1):(1'h0)]) : $signed($signed(wire18))));
      reg35 <= $unsigned((!wire23));
    end
  assign wire36 = $signed({reg32});
  assign wire37 = $signed((+wire22[(4'h9):(2'h3)]));
  assign wire38 = (wire24[(2'h2):(1'h0)] ? reg28[(1'h1):(1'h1)] : wire20);
  assign wire39 = (~reg27);
  assign wire40 = $unsigned(reg33[(3'h7):(3'h6)]);
  always
    @(posedge clk) begin
      reg41 <= (~&($unsigned((|(^wire40))) >> ($unsigned((~&wire40)) ?
          $signed((wire40 << reg26)) : (~|(&wire38)))));
    end
  assign wire42 = wire25[(4'hb):(4'ha)];
  assign wire43 = (~|{{$unsigned((8'ha5))}});
  always
    @(posedge clk) begin
      reg44 <= reg35;
      reg45 <= wire19[(4'h9):(3'h4)];
      if ($unsigned($signed(wire40[(3'h7):(3'h7)])))
        begin
          reg46 <= reg32[(3'h7):(3'h4)];
          reg47 <= (8'hb0);
        end
      else
        begin
          reg46 <= (~^(wire19 ?
              wire36[(1'h0):(1'h0)] : $signed($signed($signed(reg47)))));
          reg47 <= $unsigned((~|reg33));
          reg48 <= $unsigned((((wire40[(5'h12):(4'hb)] ~^ wire42) ?
              ((reg33 + reg45) ?
                  ((7'h40) ?
                      wire19 : wire24) : {reg33}) : $signed($unsigned(reg45))) - (-wire37[(1'h0):(1'h0)])));
          reg49 <= wire38;
          if ({reg34[(4'hb):(3'h7)]})
            begin
              reg50 <= wire29[(1'h0):(1'h0)];
              reg51 <= wire29[(3'h4):(1'h1)];
              reg52 <= wire42[(1'h1):(1'h0)];
              reg53 <= {$unsigned(($signed((wire24 ? wire36 : (7'h41))) ?
                      $unsigned($signed((7'h40))) : (reg47 ?
                          (~|reg28) : reg28[(2'h3):(2'h3)]))),
                  (!{((reg48 & reg34) ? (reg32 * reg28) : {wire40, reg41})})};
              reg54 <= reg52[(1'h1):(1'h1)];
            end
          else
            begin
              reg50 <= wire30[(4'hb):(2'h2)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg55 <= $unsigned((-wire38[(3'h7):(3'h7)]));
      reg56 <= reg26[(1'h1):(1'h0)];
    end
  assign wire57 = reg53;
endmodule
