module top
#(parameter param134 = (((^(~((7'h43) <<< (8'ha7)))) >= (((^~(8'hb4)) * ((8'haf) >> (8'ha6))) ? (+((8'ha0) <= (8'h9d))) : (~^((8'hb2) ? (8'ha8) : (8'h9c))))) ? (~|((~^(+(8'ha8))) ? ((-(7'h41)) ? (~^(7'h40)) : (~^(8'ha5))) : (~((8'ha2) ? (8'hae) : (8'h9d))))) : {{{(&(7'h42)), ((8'ha0) << (8'haa))}}}), 
parameter param135 = (+(-(~^((~&param134) ? param134 : (param134 ? (7'h42) : param134))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire120;
  wire [(3'h6):(1'h0)] wire121;
  wire signed [(4'h8):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire131;
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  assign y = {wire133,
                 wire16,
                 wire86,
                 wire115,
                 wire117,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 (1'h0)};
  module5 #() modinst17 (.wire6(wire4), .y(wire16), .wire8(wire0), .wire7(wire3), .wire9(wire1), .clk(clk));
  module18 #() modinst87 (.wire20(wire1), .wire19(wire2), .clk(clk), .wire21(wire0), .y(wire86), .wire22(wire3));
  module88 #() modinst116 (.wire91(wire2), .wire90(wire3), .wire92(wire1), .y(wire115), .wire89(wire16), .clk(clk));
  assign wire117 = ((wire115 ? wire1[(4'hc):(3'h5)] : wire3) * (7'h43));
  assign wire118 = wire0;
  assign wire119 = wire2[(2'h3):(1'h1)];
  assign wire120 = (-$unsigned((($signed(wire1) - wire115[(3'h4):(1'h0)]) + (~|{(8'hb2),
                       wire0}))));
  assign wire121 = wire120;
  always
    @(posedge clk) begin
      reg122 <= (wire117 <= wire121);
      if (wire3)
        begin
          if (wire1[(3'h4):(3'h4)])
            begin
              reg123 <= $unsigned($signed($unsigned((-wire86))));
              reg124 <= wire3;
              reg125 <= (~|($signed(($unsigned(wire0) < (wire1 ?
                      wire120 : wire0))) ?
                  (~&((wire115 > (8'hba)) ?
                      (wire119 == wire16) : (+wire121))) : (8'ha6)));
              reg126 <= {reg122,
                  ((|$signed((7'h41))) ?
                      (wire119 ?
                          ((~wire4) ?
                              reg122 : wire4) : {wire3[(3'h5):(3'h4)]}) : (((wire86 <<< wire86) & $signed((8'hbe))) + $signed(wire119[(3'h6):(3'h5)])))};
              reg127 <= {$unsigned(wire115), {wire2}};
            end
          else
            begin
              reg123 <= ({$unsigned((wire121[(2'h2):(1'h1)] >= (+(8'hb4)))),
                  (-((|wire3) ?
                      (!wire120) : wire2))} >> wire115[(3'h4):(1'h1)]);
              reg124 <= wire86;
              reg125 <= $unsigned($unsigned($unsigned($signed(reg122))));
              reg126 <= $unsigned((~&$unsigned(($unsigned(wire121) ?
                  $unsigned(wire16) : {reg122}))));
              reg127 <= ($unsigned(({{wire117, reg125}, reg127[(1'h1):(1'h1)]} ?
                      wire117 : (|$unsigned(wire16)))) ?
                  (wire0 ?
                      $unsigned($signed((+wire118))) : ({$signed(wire121),
                              $signed(wire0)} ?
                          ($signed(wire115) ?
                              wire121 : (wire2 ?
                                  reg123 : wire120)) : (~^reg125[(4'h9):(3'h4)]))) : reg126[(4'he):(3'h6)]);
            end
        end
      else
        begin
          reg123 <= reg124;
        end
    end
  assign wire128 = ({wire2} || reg123);
  assign wire129 = reg125;
  assign wire130 = wire16[(4'hb):(4'h9)];
  module25 #() modinst132 (wire131, clk, reg124, wire120, wire0, wire86);
  assign wire133 = $unsigned($signed((~{$signed(wire0)})));
endmodule

module module88
#(parameter param113 = (8'haa), 
parameter param114 = (param113 ? (param113 ? (((param113 >>> (8'hb2)) ? (8'h9e) : (^~param113)) ? (~^(param113 ? param113 : param113)) : param113) : (8'hb0)) : ((7'h41) & (~&(8'hba)))))
(y, clk, wire89, wire90, wire91, wire92);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire89;
  input wire [(4'hf):(1'h0)] wire90;
  input wire signed [(3'h6):(1'h0)] wire91;
  input wire [(4'hf):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire108;
  assign y = {wire112, wire111, wire110, wire93, wire108, (1'h0)};
  assign wire93 = {wire91[(1'h0):(1'h0)], wire91[(1'h0):(1'h0)]};
  module94 #() modinst109 (wire108, clk, wire93, wire92, wire90, wire91, wire89);
  assign wire110 = wire92;
  assign wire111 = $signed((wire110[(4'hc):(2'h3)] ?
                       $unsigned(wire110) : $signed(wire91[(2'h3):(1'h1)])));
  assign wire112 = {(~&wire93), wire111[(1'h1):(1'h0)]};
endmodule

module module18
#(parameter param84 = (((8'ha7) ? ((~((8'hb5) <= (8'ha7))) <= (^~((7'h40) ? (8'hb9) : (8'had)))) : ((((8'hbe) ? (8'hba) : (8'hba)) < ((8'ha7) ? (8'hab) : (8'hae))) ? ({(8'ha2), (8'ha6)} ? ((8'hb1) >>> (8'h9c)) : {(8'h9d)}) : {((8'ha8) & (8'haa))})) - (~((&((8'hab) <= (8'hbf))) ? {((8'hbc) >>> (8'h9d)), ((8'hbf) * (8'had))} : {((8'hb2) - (8'hae))}))), 
parameter param85 = param84)
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire22;
  input wire signed [(4'h9):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire57,
                 wire56,
                 wire54,
                 wire24,
                 wire23,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire23 = $signed((^~wire20));
  assign wire24 = (^({(wire19 ? {wire20, wire22} : wire20),
                      (wire20 ?
                          (wire21 ? wire20 : wire19) : {wire22,
                              wire23})} <<< (^$signed((wire22 ^~ wire22)))));
  module25 #() modinst55 (wire54, clk, wire23, wire24, wire19, wire22);
  assign wire56 = $signed(((~wire24[(1'h1):(1'h1)]) ?
                      $unsigned((wire23[(1'h1):(1'h1)] <= (wire22 ?
                          wire54 : wire54))) : (($signed(wire22) ?
                          $signed(wire22) : (8'ha6)) >> $signed((wire54 | wire20)))));
  assign wire57 = {{$unsigned((~^$unsigned(wire21)))}};
  always
    @(posedge clk) begin
      if (wire23[(3'h6):(1'h0)])
        begin
          reg58 <= $signed((~&(wire20 ?
              (((7'h40) ~^ wire56) >> {wire19}) : $signed($unsigned(wire24)))));
          reg59 <= wire19;
          reg60 <= $signed(({wire22[(2'h2):(1'h0)]} && (wire56[(1'h1):(1'h1)] ?
              wire23[(4'h9):(4'h9)] : $unsigned(((8'hb9) != wire22)))));
          reg61 <= wire21;
          if (((((8'haa) ?
              ({wire21, reg59} ?
                  $unsigned(reg59) : {reg61}) : $signed($unsigned(wire20))) ^ wire23[(4'hf):(3'h7)]) || $signed((~$signed($signed((8'hb4)))))))
            begin
              reg62 <= $signed({$signed($signed($signed(wire21))),
                  (|reg58[(1'h0):(1'h0)])});
              reg63 <= reg61[(5'h10):(4'ha)];
              reg64 <= reg58;
              reg65 <= reg58;
              reg66 <= $signed($signed(wire19));
            end
          else
            begin
              reg62 <= $signed(((8'ha8) ?
                  $unsigned(({wire24} ?
                      (wire24 < reg61) : wire24)) : reg59[(2'h2):(1'h1)]));
              reg63 <= $unsigned(((~|reg60) + reg61));
              reg64 <= (($unsigned(reg65[(4'hb):(4'ha)]) ?
                  $unsigned(reg64[(4'hc):(2'h3)]) : wire21[(4'h8):(3'h4)]) || $unsigned({reg66}));
            end
        end
      else
        begin
          reg58 <= (($unsigned(($signed(reg64) == wire20[(2'h3):(1'h0)])) ^ (&($signed(wire20) ?
              (^(8'ha0)) : reg64))) >> {({((8'ha5) ? reg65 : reg65),
                  $signed(reg64)} & (+$unsigned(reg61))),
              (&wire21[(3'h7):(3'h7)])});
          reg59 <= (~|$signed((($unsigned(wire57) ?
              {(7'h42), (8'ha7)} : wire22) | reg59[(3'h7):(3'h6)])));
          reg60 <= ($signed((($unsigned(reg64) > (wire19 ?
                  reg60 : reg61)) ~^ wire19[(1'h0):(1'h0)])) ?
              (~^(^$signed((wire54 ?
                  wire56 : (8'hbb))))) : (wire19 ^~ (!(reg59[(4'h9):(3'h4)] ?
                  (|reg63) : {reg62, (8'hb1)}))));
        end
      reg67 <= reg59[(4'h8):(3'h7)];
      reg68 <= $signed((8'ha7));
    end
  assign wire69 = $unsigned(((!(^(wire57 ?
                      reg68 : (8'hb1)))) * {$signed(((8'hac) ?
                          wire19 : wire57))}));
  assign wire70 = ($signed($signed(reg68[(1'h0):(1'h0)])) ?
                      ((+($signed(wire69) >>> $signed(wire20))) ?
                          $unsigned((|reg58[(3'h6):(2'h3)])) : (+(reg59 ?
                              (reg61 ?
                                  (8'ha4) : (8'ha5)) : $unsigned(wire23)))) : ((&(reg64[(3'h4):(1'h0)] == $signed(wire20))) ?
                          $unsigned({(wire22 ^~ wire22),
                              {reg67,
                                  reg61}}) : ({(wire56 < wire54)} << reg59[(3'h6):(3'h5)])));
  assign wire71 = $unsigned(($signed((~|$signed((8'hb9)))) ?
                      ((~|(wire69 && (8'ha7))) & wire57) : (((~reg58) << wire22) ?
                          $signed(wire21[(4'h8):(3'h4)]) : $signed($unsigned(reg58)))));
  assign wire72 = reg58;
  assign wire73 = reg64[(4'hf):(4'hb)];
  always
    @(posedge clk) begin
      if ({$signed($unsigned(wire73)),
          (reg66 * (((reg60 ? wire56 : (8'ha0)) ?
              $unsigned(wire57) : $signed((8'hb2))) * (^$unsigned(reg58))))})
        begin
          reg74 <= {(wire20 && (~&wire56))};
        end
      else
        begin
          if ((wire70 ?
              (~^((8'h9c) ?
                  {wire73,
                      (reg65 ?
                          reg68 : wire71)} : wire54[(3'h5):(3'h4)])) : ((reg61 ?
                  $signed({(8'ha4)}) : $signed((8'haf))) < wire69)))
            begin
              reg74 <= $signed($signed(wire54[(3'h4):(2'h2)]));
              reg75 <= $signed(({(wire72 ?
                          wire56[(3'h5):(3'h4)] : wire19[(4'h8):(2'h2)])} ?
                  reg67 : ($signed(wire70) ?
                      $signed((reg64 ? reg59 : wire21)) : (reg58 ?
                          $signed(wire73) : (wire57 ^ reg60)))));
              reg76 <= $signed($signed(reg74));
            end
          else
            begin
              reg74 <= $signed(reg66[(4'h9):(3'h6)]);
              reg75 <= {$unsigned((+((reg66 != wire20) ? (7'h41) : wire71)))};
            end
          reg77 <= {wire73[(3'h4):(3'h4)]};
          reg78 <= (reg60 != ($unsigned((~^$unsigned(reg66))) == (-wire56)));
        end
      reg79 <= reg64;
      reg80 <= (8'h9d);
    end
  assign wire81 = $signed(reg79);
  assign wire82 = $signed(wire71);
  assign wire83 = (^$signed($signed((~&wire54))));
endmodule

module module5
#(parameter param15 = ((((|(8'hb4)) < (~&{(7'h42)})) ? {(^~{(7'h44)}), ((&(8'haf)) ? (^~(7'h43)) : (8'ha7))} : {((^~(8'hb1)) ? {(8'haa)} : ((8'hbb) != (7'h43))), (((8'ha5) ? (8'hb7) : (8'ha9)) || ((7'h42) ^ (8'hbe)))}) == (!(!(~&((7'h41) ? (8'ha7) : (8'had)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(3'h5):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  assign y = {wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = wire7[(4'hd):(3'h6)];
  assign wire11 = {(wire6[(3'h5):(1'h1)] ?
                          (((wire6 ^~ wire10) ?
                              (wire6 < wire6) : wire6) >= $unsigned((wire6 >> wire9))) : (wire10[(1'h0):(1'h0)] - $signed(wire8[(1'h0):(1'h0)]))),
                      wire8};
  assign wire12 = ((wire9 + $signed((wire7[(4'hd):(2'h2)] ?
                      wire10[(4'hb):(3'h6)] : $signed(wire9)))) | wire7);
  assign wire13 = (((~(^{wire9,
                      wire10})) << $unsigned(({wire10} * $unsigned(wire7)))) & (^~$signed((-{wire10,
                      wire11}))));
  assign wire14 = (^~wire8[(3'h7):(3'h5)]);
endmodule

module module25
#(parameter param53 = ({(~^(((8'haf) ? (8'hb9) : (8'hb4)) ? ((8'haa) == (7'h42)) : (|(7'h43))))} ? (8'hb1) : (((^~(~(7'h41))) ? (8'hb9) : (^((8'ha0) ^ (8'ha1)))) ? ((^~(~(8'h9d))) >= (~^((8'hb8) != (8'h9f)))) : ({((8'haa) << (8'ha0)), {(8'ha9), (8'hb7)}} < (((8'hba) && (8'h9e)) ? (8'ha2) : (!(8'hb8)))))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire signed [(3'h5):(1'h0)] wire28;
  input wire [(5'h13):(1'h0)] wire27;
  input wire signed [(3'h5):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire30;
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire30,
                 reg43,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire30 = $signed(wire29);
  always
    @(posedge clk) begin
      if (wire29)
        begin
          reg31 <= (wire27[(3'h7):(1'h1)] - (^~$unsigned(wire29[(3'h7):(1'h1)])));
          reg32 <= (wire30[(3'h6):(2'h3)] || (8'ha7));
          if ({(~^(~^((reg32 > wire30) ?
                  (reg31 ? reg32 : wire28) : ((7'h40) ^ reg32)))),
              ((~|({reg32} > $signed(wire27))) ?
                  wire28 : {(&(&wire30)),
                      {(wire30 >> (8'haa)), {reg32, wire27}}})})
            begin
              reg33 <= (8'ha9);
              reg34 <= $signed(({($signed((8'ha9)) ?
                      (wire26 ?
                          wire28 : wire29) : $unsigned(wire27))} == (-wire27)));
              reg35 <= {{{$unsigned({wire30})},
                      ({reg31} & wire28[(2'h3):(1'h1)])},
                  reg32[(1'h1):(1'h1)]};
              reg36 <= $signed($unsigned((reg33[(2'h3):(2'h3)] ?
                  (^~$signed((8'ha6))) : ((wire29 + reg32) ?
                      (!wire30) : (reg34 <= wire28)))));
              reg37 <= wire27[(3'h6):(1'h1)];
            end
          else
            begin
              reg33 <= (-reg32[(1'h0):(1'h0)]);
              reg34 <= $signed(reg31);
              reg35 <= {$unsigned(wire29[(4'h9):(3'h6)])};
              reg36 <= {((~&(~|$signed(reg37))) ?
                      ((|wire29[(4'h9):(3'h4)]) >>> ({wire28} ?
                          $signed(reg36) : wire27)) : reg33[(2'h3):(1'h1)]),
                  reg32};
            end
        end
      else
        begin
          reg31 <= $unsigned($unsigned(wire28));
          reg32 <= $signed(reg33[(2'h3):(2'h3)]);
          if ({(&($unsigned(reg35) ?
                  $signed((8'had)) : $signed({wire27, reg36})))})
            begin
              reg33 <= wire28[(1'h0):(1'h0)];
            end
          else
            begin
              reg33 <= (|$unsigned((~((wire26 | wire26) <<< (reg31 ?
                  (8'ha4) : wire26)))));
              reg34 <= $unsigned((((((8'hb8) < reg32) && (|wire28)) ?
                      (((8'ha7) ? reg37 : reg34) < reg33) : {reg36}) ?
                  reg37[(1'h1):(1'h1)] : wire30[(2'h2):(2'h2)]));
              reg35 <= reg33;
            end
          reg36 <= reg32;
          reg37 <= $unsigned($unsigned((~^(8'hbc))));
        end
      reg38 <= $signed($signed($signed(($signed((8'ha0)) ?
          ((8'hba) ? wire28 : reg31) : $signed(reg33)))));
    end
  assign wire39 = reg36[(4'h9):(4'h8)];
  assign wire40 = $unsigned(wire27);
  assign wire41 = (|$unsigned($signed((&(reg37 <<< wire26)))));
  assign wire42 = wire28;
  always
    @(posedge clk) begin
      reg43 <= $unsigned((~|$signed($unsigned(wire30[(1'h0):(1'h0)]))));
    end
  assign wire44 = $signed(wire40[(4'h9):(3'h7)]);
  assign wire45 = (($signed((8'ha9)) * reg38) ?
                      $signed(wire44) : $unsigned(($unsigned($unsigned(reg38)) + (|wire39[(4'h8):(3'h7)]))));
  assign wire46 = reg32;
  assign wire47 = {$signed(($unsigned(reg43) ?
                          {(wire30 <= wire46),
                              reg31} : $signed(reg31[(1'h1):(1'h1)]))),
                      $signed(wire42[(4'ha):(4'ha)])};
  assign wire48 = $signed(((wire30 ?
                      $signed($signed(reg34)) : (^~reg33[(2'h2):(2'h2)])) * (~reg38)));
  assign wire49 = wire30;
  assign wire50 = (~^$unsigned($signed(reg36)));
  assign wire51 = $signed($unsigned((&{wire50[(4'ha):(4'h8)], (8'ha1)})));
  assign wire52 = (({wire50[(4'h8):(3'h4)]} ^ {wire49[(3'h6):(3'h5)],
                      $unsigned((&wire41))}) <<< wire44);
endmodule

module module94
#(parameter param106 = {{{{(~&(8'ha2)), (!(8'hbb))}}, ((^((8'hb0) < (8'hb5))) ? {((8'hb2) ? (8'hbc) : (8'hbe))} : {(~|(8'ha6)), (+(8'ha9))})}, ({(((7'h40) < (7'h40)) >> ((8'h9c) < (8'hb1))), (((7'h44) ? (8'h9e) : (8'haf)) ? ((8'ha3) ? (8'hac) : (8'ha9)) : ((8'hbc) ? (8'ha2) : (8'hb7)))} ~^ ((~&{(8'ha9), (8'ha5)}) ? (((8'ha9) || (8'hbe)) ^ ((8'hb3) < (8'hb2))) : ((^(7'h42)) ? ((8'hb1) <= (8'ha4)) : (!(8'haf)))))}, 
parameter param107 = (8'h9e))
(y, clk, wire99, wire98, wire97, wire96, wire95);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire99;
  input wire signed [(3'h5):(1'h0)] wire98;
  input wire signed [(4'hc):(1'h0)] wire97;
  input wire [(3'h5):(1'h0)] wire96;
  input wire [(4'hf):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire102;
  wire [(2'h2):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  assign y = {wire105, wire104, wire103, wire102, wire101, wire100, (1'h0)};
  assign wire100 = $unsigned((wire98[(3'h4):(1'h1)] != ($unsigned(wire99) ?
                       (7'h41) : wire99)));
  assign wire101 = wire97[(2'h2):(1'h0)];
  assign wire102 = $unsigned(((({wire95,
                           wire95} * {wire96}) >> $unsigned(wire100)) ?
                       wire101[(2'h2):(2'h2)] : $unsigned(wire101)));
  assign wire103 = {(wire101 + ($unsigned($unsigned(wire101)) != wire99[(4'h8):(2'h2)])),
                       (^{wire96})};
  assign wire104 = {$unsigned((~&{wire98})),
                       (-$signed((~|(wire96 ? wire103 : wire95))))};
  assign wire105 = wire99[(3'h5):(1'h1)];
endmodule
