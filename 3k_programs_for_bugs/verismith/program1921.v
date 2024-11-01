module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire152;
  wire [(2'h2):(1'h0)] wire149;
  wire [(3'h6):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire147;
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire152,
                 wire149,
                 wire4,
                 wire5,
                 wire10,
                 wire11,
                 wire147,
                 reg151,
                 reg150,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire4 = ((^(+((wire3 <= (8'hbf)) ?
                         (wire2 <<< wire3) : wire0[(5'h14):(1'h1)]))) ?
                     wire2[(1'h0):(1'h0)] : ((((|wire3) || $signed((8'hb1))) ?
                             $unsigned($unsigned(wire2)) : ($unsigned(wire3) ?
                                 (wire2 >> wire2) : (wire2 ? wire3 : wire0))) ?
                         (wire2 ?
                             (wire1 ^ $unsigned(wire0)) : $unsigned((8'hbd))) : wire3[(1'h0):(1'h0)]));
  assign wire5 = ((^~$unsigned((wire0 ?
                         wire2[(3'h7):(1'h0)] : (wire3 ? wire0 : wire0)))) ?
                     ($signed((+wire4)) ?
                         (+($unsigned(wire2) ?
                             $signed((8'hae)) : $unsigned(wire1))) : $signed(wire0)) : (({(wire0 || wire2)} << {$unsigned(wire4),
                             (wire2 || wire1)}) ?
                         ((!(|(8'hbf))) ?
                             $signed(wire1) : $signed($unsigned(wire0))) : (+$unsigned(wire3))));
  always
    @(posedge clk) begin
      reg6 <= $signed($signed((($signed(wire5) + $signed(wire4)) ?
          (|wire0[(4'hd):(3'h4)]) : $signed((wire2 ? wire1 : wire5)))));
      reg7 <= $signed((((&(8'hbb)) ?
          (wire4 & (^wire0)) : ({(8'hb5),
              wire0} <= $unsigned(wire0))) >= wire0[(4'he):(2'h2)]));
      reg8 <= $signed({$unsigned((wire4 << wire2[(1'h1):(1'h1)])),
          (&($signed((8'haa)) ?
              (wire0 ? reg6 : (8'ha2)) : {(8'haf), (8'ha3)}))});
      reg9 <= $signed($signed((~(|(-wire5)))));
    end
  assign wire10 = $signed((({wire0, reg7[(2'h2):(1'h0)]} ?
                      ((reg6 ?
                          (8'ha3) : reg8) <= {wire3}) : $unsigned((|reg9))) || (8'hac)));
  assign wire11 = (8'h9f);
  module12 #() modinst148 (wire147, clk, wire11, wire3, reg7, wire0);
  assign wire149 = $signed(((+(~&$signed(wire10))) | wire2[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg150 <= wire0[(1'h1):(1'h0)];
      reg151 <= reg150[(4'hd):(3'h4)];
    end
  assign wire152 = $signed(((~^(~(reg150 ? wire10 : wire10))) ?
                       $unsigned(((wire4 > reg8) ?
                           $unsigned(reg9) : wire4)) : $unsigned((reg150[(4'hc):(1'h1)] ?
                           reg150 : {reg151}))));
endmodule

module module12
#(parameter param146 = (((((+(8'hb9)) != {(8'ha2)}) ? {{(8'hb8), (8'hab)}, ((8'hb0) ? (8'hb3) : (8'haf))} : (~^((8'hbd) || (8'hb8)))) ? ({((8'hb5) >>> (8'had)), (~(8'hae))} ? {(8'haa)} : (^~((8'hb0) < (8'h9e)))) : (((~^(8'haf)) > ((8'h9f) ? (7'h44) : (8'hb4))) <= (8'ha6))) < {(({(8'ha7), (7'h43)} >> ((8'hb9) ? (8'hb6) : (8'hac))) ? (8'ha3) : ((~&(8'h9e)) ? ((8'hba) ^ (8'h9c)) : ((8'ha0) ? (8'hbb) : (7'h42))))}))
(y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(4'ha):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire144;
  wire signed [(4'hb):(1'h0)] wire143;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire136;
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire75,
                 wire77,
                 wire92,
                 wire94,
                 wire95,
                 wire136,
                 reg145,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire17 = wire14[(5'h12):(4'he)];
  assign wire18 = (~(|(|((wire14 ? wire17 : wire13) * (wire17 > wire13)))));
  assign wire19 = (8'had);
  assign wire20 = wire17;
  assign wire21 = (&((8'hbf) ?
                      ((wire14 >= {wire17}) <<< $signed((wire20 < wire14))) : wire14));
  assign wire22 = (((^~($signed(wire16) ? (~&wire13) : wire20)) ?
                          {wire14[(5'h11):(4'hc)],
                              ((|wire17) ~^ (^~wire21))} : $signed(((wire15 ?
                                  wire19 : wire14) ?
                              (^wire15) : $signed(wire17)))) ?
                      $signed($unsigned(wire17)) : (($unsigned(wire18) ?
                              {(wire14 ? wire18 : wire18),
                                  (wire17 ?
                                      wire14 : wire21)} : $unsigned(wire20[(4'ha):(4'h9)])) ?
                          (($signed(wire15) != wire19[(1'h1):(1'h1)]) ?
                              wire18 : ($unsigned(wire18) && ((8'hac) >>> wire13))) : (($unsigned(wire19) ?
                                  $unsigned(wire15) : $unsigned(wire17)) ?
                              $unsigned((+(8'ha9))) : $unsigned(wire21))));
  assign wire23 = ($unsigned((((~&wire16) ?
                          (wire20 ^ wire13) : (wire14 ?
                              wire18 : wire15)) ^ $signed($unsigned(wire13)))) ?
                      ((((8'had) + (wire13 ? wire18 : wire20)) ?
                              ((~|wire19) ?
                                  (wire21 * wire20) : (8'h9e)) : (^wire16[(2'h3):(1'h1)])) ?
                          ($signed($unsigned(wire19)) ^ $unsigned({wire13,
                              wire16})) : $unsigned($signed(((8'ha9) ?
                              (8'hb0) : wire20)))) : (+$signed(($signed(wire16) + wire21[(2'h2):(1'h1)]))));
  assign wire24 = $signed({$signed(wire14)});
  assign wire25 = wire23;
  module26 #() modinst76 (wire75, clk, wire22, wire15, wire23, wire24);
  assign wire77 = ((8'hae) ? (~^wire13[(1'h1):(1'h0)]) : $signed(wire22));
  module78 #() modinst93 (wire92, clk, wire14, wire25, wire13, wire20);
  assign wire94 = (|wire92);
  assign wire95 = ($unsigned((((+wire13) ?
                          (^wire20) : $signed(wire77)) == wire24)) ?
                      $signed((wire22 ?
                          wire77 : ((+wire21) ?
                              (~wire17) : wire75[(1'h0):(1'h0)]))) : ((|(wire94[(3'h4):(2'h3)] >> $unsigned(wire75))) - {(wire25[(1'h1):(1'h1)] - (^wire18)),
                          wire13[(2'h2):(1'h0)]}));
  always
    @(posedge clk) begin
      if ((8'hb4))
        begin
          reg96 <= (|$signed($signed((wire23[(4'hc):(1'h0)] < {wire15}))));
          reg97 <= $unsigned((($signed($signed(wire92)) ?
              wire19 : {wire24[(4'h9):(1'h0)]}) <= $unsigned($signed((^~wire25)))));
          reg98 <= (8'ha7);
          reg99 <= $signed((wire19 ~^ (reg98[(2'h3):(1'h0)] != (wire92 && ((8'hbd) != (8'hbf))))));
          if ((+(wire95[(2'h3):(1'h1)] != (+reg97))))
            begin
              reg100 <= wire92[(1'h1):(1'h0)];
              reg101 <= $signed($unsigned(($unsigned((|wire16)) ?
                  ($unsigned((8'haa)) | wire22) : ((!wire18) ?
                      reg97[(2'h3):(1'h1)] : $signed(reg96)))));
            end
          else
            begin
              reg100 <= $unsigned((wire20[(3'h4):(2'h3)] ?
                  $signed($signed((&wire21))) : reg99));
            end
        end
      else
        begin
          reg96 <= $signed($signed((8'ha9)));
          reg97 <= reg101[(4'hc):(2'h2)];
          reg98 <= reg97[(3'h6):(2'h2)];
        end
      reg102 <= $unsigned((|(reg96[(2'h2):(1'h1)] ?
          wire15 : ((wire92 ? wire95 : reg101) ?
              (+(8'ha7)) : $signed(reg96)))));
      reg103 <= $signed((~|$signed({(~^wire77)})));
      reg104 <= wire21[(1'h0):(1'h0)];
    end
  module105 #() modinst137 (.wire106(wire14), .clk(clk), .wire108(wire75), .wire110(reg98), .y(wire136), .wire109(wire22), .wire107(reg102));
  always
    @(posedge clk) begin
      reg138 <= wire19[(1'h1):(1'h1)];
      reg139 <= reg101[(3'h6):(2'h3)];
      reg140 <= {wire75[(5'h13):(5'h10)]};
    end
  always
    @(posedge clk) begin
      reg141 <= wire18[(2'h3):(1'h1)];
      reg142 <= (^wire75);
    end
  assign wire143 = wire15[(1'h1):(1'h0)];
  assign wire144 = reg97;
  always
    @(posedge clk) begin
      reg145 <= $unsigned((~wire18));
    end
endmodule

module module105
#(parameter param134 = (((!(((8'ha3) ? (7'h41) : (8'hba)) ? ((7'h44) ? (8'hbf) : (7'h44)) : ((7'h42) | (8'hb4)))) ? ((~&((8'hbd) ? (8'hb6) : (8'ha0))) ? (^(&(8'hb9))) : (((8'ha7) + (8'hbd)) <= ((8'h9d) ? (8'hb4) : (8'ha3)))) : ({((8'ha1) >>> (8'h9f)), (8'ha2)} ? {(7'h42), {(8'hae)}} : ({(8'haa), (8'h9d)} <<< ((8'ha8) >>> (8'hb0))))) < (&(((~|(7'h41)) && ((8'haa) <<< (8'hb2))) >> ((8'h9d) ? (~(8'hbd)) : ((8'h9f) ^~ (8'hbc)))))), 
parameter param135 = (~|(|param134)))
(y, clk, wire110, wire109, wire108, wire107, wire106);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire110;
  input wire [(5'h10):(1'h0)] wire109;
  input wire signed [(5'h13):(1'h0)] wire108;
  input wire [(5'h15):(1'h0)] wire107;
  input wire signed [(5'h13):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire133;
  wire signed [(4'hc):(1'h0)] wire132;
  wire signed [(3'h7):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire126;
  wire [(3'h5):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(4'hd):(1'h0)] reg119 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire128,
                 wire127,
                 wire126,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 reg129,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire111 = {wire108[(3'h5):(3'h4)]};
  assign wire112 = ({$unsigned((-wire109[(4'ha):(4'h8)]))} == (^~wire111));
  assign wire113 = ($unsigned(wire110) >> {$unsigned({wire110[(3'h5):(3'h4)]}),
                       wire110});
  assign wire114 = wire111[(4'h8):(3'h7)];
  assign wire115 = {($signed($unsigned((wire109 << wire107))) < wire107)};
  assign wire116 = (({$unsigned($signed((8'hb4)))} ?
                       $signed({{wire107, wire107},
                           $signed(wire108)}) : (!$unsigned(wire113[(4'h9):(4'h9)]))) > {$unsigned($signed(wire108))});
  assign wire117 = $unsigned((8'hba));
  assign wire118 = wire107[(4'hd):(3'h6)];
  always
    @(posedge clk) begin
      if ((+wire112))
        begin
          reg119 <= $unsigned(wire110[(2'h3):(2'h3)]);
          reg120 <= {$signed(reg119),
              ({wire117[(3'h4):(1'h1)]} || ($signed({wire113,
                  wire118}) >>> (wire107 ~^ ((8'hae) + wire110))))};
          if (wire118)
            begin
              reg121 <= {(!$unsigned({{wire113, wire107}}))};
              reg122 <= wire117[(4'hb):(3'h4)];
            end
          else
            begin
              reg121 <= wire112;
            end
          reg123 <= (wire116[(3'h6):(1'h1)] ^ $signed((-reg122[(1'h1):(1'h1)])));
        end
      else
        begin
          reg119 <= (({(~^$unsigned((8'haf))),
              (reg119 ? reg121[(1'h0):(1'h0)] : reg120)} + {wire115,
              (~|(wire111 * reg121))}) ^ (~|$unsigned(((~^wire108) ?
              $signed(wire116) : reg120))));
        end
      reg124 <= wire107;
      reg125 <= ($signed(wire114) > wire115[(2'h3):(1'h1)]);
    end
  assign wire126 = reg122[(4'hc):(2'h3)];
  assign wire127 = ((8'hbf) - $signed((reg120 >= (+{wire114}))));
  assign wire128 = (^~$signed((~$unsigned((8'ha6)))));
  always
    @(posedge clk) begin
      reg129 <= wire116;
    end
  assign wire130 = ((($unsigned((-wire112)) ?
                           wire117 : wire108) - ((~|reg122[(4'hc):(2'h2)]) ?
                           {{(8'hbd), (8'h9e)}, (8'hb4)} : (+{reg129,
                               wire109}))) ?
                       (wire126[(1'h1):(1'h0)] >> ((^~$signed(wire112)) ?
                           (!(wire128 < wire118)) : reg124)) : (^wire117));
  assign wire131 = ({{$unsigned({(8'h9f),
                               wire106})}} < ($signed({$signed(wire115),
                           wire110}) ?
                       (((wire117 ? reg124 : (8'h9c)) ?
                           (wire126 ?
                               (7'h43) : wire115) : $unsigned(wire130)) ~^ (8'ha4)) : (+$unsigned((^wire106)))));
  assign wire132 = $unsigned($unsigned(reg122[(4'hd):(4'ha)]));
  assign wire133 = (((reg124[(3'h6):(3'h5)] ?
                       $unsigned($signed((8'hbe))) : (8'ha8)) != $signed(reg122[(1'h0):(1'h0)])) ^~ reg121[(1'h0):(1'h0)]);
endmodule

module module78  (y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire82;
  input wire signed [(2'h3):(1'h0)] wire81;
  input wire [(3'h5):(1'h0)] wire80;
  input wire [(4'hc):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire91;
  wire [(4'h8):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire83;
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 (1'h0)};
  assign wire83 = $signed(((^(wire81 ?
                      (wire81 ?
                          (8'ha0) : wire82) : (wire80 && wire82))) ^ ($signed((8'hb0)) | wire80[(1'h0):(1'h0)])));
  assign wire84 = wire82[(4'ha):(4'ha)];
  assign wire85 = ((!$signed(($unsigned(wire83) ?
                      $unsigned(wire83) : (~|wire84)))) ^ wire82[(4'h8):(2'h3)]);
  assign wire86 = wire81[(1'h1):(1'h1)];
  assign wire87 = wire83;
  assign wire88 = $signed(wire79[(4'hc):(4'ha)]);
  assign wire89 = ($signed(((~&wire85[(2'h3):(1'h1)]) ?
                      (((7'h44) * (8'h9d)) <<< wire81[(2'h3):(2'h2)]) : wire83)) ~^ wire84[(4'hb):(1'h0)]);
  assign wire90 = $unsigned({{wire83[(3'h6):(1'h1)],
                          {wire79[(3'h4):(2'h2)], $signed((8'hbb))}}});
  assign wire91 = {$signed($signed(wire84[(4'hb):(1'h0)])),
                      wire79[(1'h0):(1'h0)]};
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h1d9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire signed [(4'ha):(1'h0)] wire29;
  input wire [(4'h9):(1'h0)] wire28;
  input wire [(5'h11):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire31 = $unsigned(((wire27[(4'hd):(4'hd)] ?
                      $signed((wire30 <= wire28)) : (|$unsigned(wire27))) | (wire30[(5'h14):(4'h9)] ?
                      wire29 : ((!wire30) ? $unsigned(wire27) : (^(8'hb4))))));
  assign wire32 = wire30[(3'h5):(2'h3)];
  assign wire33 = wire28[(3'h6):(3'h6)];
  assign wire34 = (~^wire27[(4'hf):(3'h4)]);
  assign wire35 = $unsigned({($signed((wire34 | wire30)) ?
                          $signed((wire31 ?
                              wire30 : wire31)) : {wire31[(1'h1):(1'h0)]})});
  assign wire36 = wire34[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg37 <= (wire28[(3'h4):(2'h3)] ?
          $unsigned({(wire34 ^ wire28),
              (((8'hab) & wire31) ?
                  (wire30 ^~ wire32) : (wire28 >>> wire33))}) : $signed((($unsigned(wire32) ?
                  $signed(wire34) : (wire31 >> wire34)) ?
              $unsigned(wire29[(4'h9):(2'h2)]) : {{wire36}})));
      reg38 <= {$signed((+({wire34, (8'hbf)} ?
              $unsigned(wire31) : (~|wire30))))};
      reg39 <= $signed((wire36 ?
          ($signed(wire29[(4'h8):(2'h2)]) ?
              wire36[(1'h0):(1'h0)] : ((wire33 ? wire28 : wire28) ?
                  (+wire36) : wire36[(3'h5):(1'h1)])) : {$unsigned(((8'hb9) != wire30)),
              wire34}));
      if ({((^((wire35 ?
              wire28 : wire31) - (wire31 && wire33))) && (-$unsigned(reg39))),
          $unsigned((($signed(wire36) ?
              $signed(wire30) : (+reg39)) - $signed((wire31 - (8'ha7)))))})
        begin
          reg40 <= {{(7'h40), reg37}, reg37};
          if ($signed((8'had)))
            begin
              reg41 <= ($signed(wire30[(1'h1):(1'h1)]) && (reg38[(1'h0):(1'h0)] < (7'h41)));
              reg42 <= wire29[(3'h6):(2'h2)];
              reg43 <= wire35;
              reg44 <= (+reg43[(4'ha):(4'h9)]);
            end
          else
            begin
              reg41 <= reg44;
            end
          if ($signed((reg38 <= ((reg39[(2'h2):(1'h1)] ?
                  $signed(wire35) : $unsigned(reg44)) ?
              wire36[(3'h4):(1'h0)] : $signed({wire27})))))
            begin
              reg45 <= $unsigned($signed((&wire31[(1'h1):(1'h1)])));
              reg46 <= reg38;
            end
          else
            begin
              reg45 <= reg44;
              reg46 <= (~|$unsigned({(&wire30),
                  (~^(wire33 ? wire32 : reg45))}));
              reg47 <= {(((wire34[(3'h5):(1'h0)] ^~ (reg41 ?
                      (8'ha2) : (8'hb7))) <= $signed($signed(reg45))) & $unsigned($unsigned($signed(reg45))))};
              reg48 <= (($unsigned(($signed(wire29) ?
                  $unsigned(reg42) : (wire34 ^ wire34))) != {($signed(wire28) != $signed(reg42)),
                  $unsigned($unsigned(wire29))}) && (+(8'hbc)));
              reg49 <= {wire27[(3'h4):(1'h0)]};
            end
          reg50 <= $unsigned($unsigned($signed($signed({reg48}))));
        end
      else
        begin
          reg40 <= ((^~wire30) ?
              $signed($unsigned(wire35[(5'h12):(2'h2)])) : reg43[(3'h4):(2'h2)]);
          reg41 <= $signed(wire32[(1'h1):(1'h1)]);
          reg42 <= (({(^(+(8'hab))), reg44[(3'h4):(1'h1)]} || (reg43 ?
                  (~^{wire29, (7'h40)}) : reg42)) ?
              reg48 : reg38);
          reg43 <= wire28;
        end
    end
  assign wire51 = (^({reg41[(3'h5):(1'h0)]} ? (~^reg42) : ((8'hac) || wire27)));
  assign wire52 = ((~|reg42[(4'ha):(1'h1)]) ?
                      (wire51[(1'h1):(1'h1)] ?
                          $signed((~^((8'hbd) && reg39))) : (reg42[(1'h1):(1'h1)] <= ((reg45 < wire51) ?
                              {reg37} : (wire30 < reg37)))) : reg48[(2'h3):(2'h2)]);
  assign wire53 = (|reg42);
  assign wire54 = {reg49};
  assign wire55 = {wire53};
  assign wire56 = wire55;
  assign wire57 = (((reg44[(1'h0):(1'h0)] ?
                          ({reg50} ?
                              wire31 : $signed(wire29)) : reg41) < (($signed(wire30) ?
                          $signed(reg37) : $unsigned(reg41)) <= reg45)) ?
                      reg39 : (8'hb8));
  assign wire58 = $unsigned(wire33[(2'h3):(1'h0)]);
  assign wire59 = reg46[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg60 <= ($unsigned($unsigned((8'hab))) ?
          ((wire59 <<< ($unsigned(wire36) ^~ wire51[(3'h4):(2'h2)])) <= $signed(wire58)) : (((&((8'hb8) ?
                  wire28 : reg43)) ?
              (&wire55) : $unsigned($unsigned(reg41))) >> (8'ha1)));
      reg61 <= {(&{reg44[(2'h3):(1'h0)], $unsigned((~&reg45))})};
      reg62 <= $signed((wire58 >> wire55));
      if ((&{((~&$signed(reg46)) ?
              ({reg38,
                  reg48} > (wire29 >= (8'hb7))) : $signed($signed(wire52))),
          $unsigned($unsigned((reg43 == wire54)))}))
        begin
          reg63 <= wire56;
          reg64 <= (($unsigned($signed($unsigned((8'haf)))) ?
                  $unsigned({reg47, $unsigned(reg61)}) : (((wire33 ?
                          wire36 : (8'hbf)) ^~ reg39[(2'h3):(2'h2)]) ?
                      ((!reg43) ?
                          $unsigned(wire53) : (reg45 == (8'h9e))) : {(wire32 ?
                              reg42 : reg42),
                          wire51[(3'h5):(1'h1)]})) ?
              reg43[(3'h7):(3'h7)] : wire29);
          reg65 <= $unsigned(({wire28} ^ $signed(({(8'hb5)} ?
              $signed(wire51) : (wire31 | wire29)))));
        end
      else
        begin
          reg63 <= (~(~^((^reg50[(1'h0):(1'h0)]) ^~ $signed((~|(7'h44))))));
          if ($signed((8'h9c)))
            begin
              reg64 <= reg38;
              reg65 <= $unsigned(wire34[(4'ha):(1'h0)]);
              reg66 <= wire34[(2'h3):(2'h2)];
              reg67 <= ((~&wire32) + $unsigned($signed({(+reg64),
                  $signed((8'h9e))})));
              reg68 <= $unsigned($unsigned({$signed($signed(wire56))}));
            end
          else
            begin
              reg64 <= (-{$unsigned(wire29[(4'h8):(3'h5)])});
              reg65 <= ($signed(reg62) ?
                  $unsigned((!$signed((wire32 >>> (8'hb4))))) : $unsigned(reg61[(4'hc):(2'h3)]));
              reg66 <= $unsigned(wire30[(4'hd):(4'h9)]);
              reg67 <= (~&wire27);
              reg68 <= $signed($signed(wire59[(5'h12):(2'h3)]));
            end
        end
    end
  assign wire69 = (+(&$unsigned(($unsigned((8'h9e)) ^~ (wire36 ?
                      reg50 : wire28)))));
  assign wire70 = $unsigned($signed($signed($unsigned((reg47 >>> reg45)))));
  assign wire71 = $signed(reg48);
  assign wire72 = (8'hba);
  assign wire73 = (~|(7'h40));
  assign wire74 = reg44[(1'h1):(1'h1)];
endmodule
