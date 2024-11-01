module top
#(parameter param352 = ((((((8'hbd) ? (8'hbd) : (7'h41)) ? (~^(8'h9d)) : {(8'hbf), (8'ha1)}) ? (8'haf) : {((8'hb7) ? (8'hbe) : (8'hb1))}) ? (+(((8'ha8) & (8'h9d)) ? ((8'h9c) + (8'hbe)) : ((8'ha8) ? (8'hab) : (8'haf)))) : ((&((7'h44) ? (8'had) : (7'h44))) ? (((8'hb0) == (8'hbf)) || ((7'h44) == (8'ha8))) : (((8'haa) >>> (8'hbd)) == ((8'hb8) ? (8'hb8) : (8'ha7))))) - (((((8'hae) ? (7'h43) : (8'hb2)) ? (^~(8'hbb)) : ((7'h43) ^ (8'ha9))) ? (~((8'hb9) ^~ (8'hbd))) : (((8'haf) ? (8'h9d) : (7'h40)) ? (~^(7'h42)) : ((8'ha8) ? (7'h44) : (8'hb4)))) ? (8'hbf) : (8'ha2))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire351;
  wire [(5'h11):(1'h0)] wire350;
  wire [(4'h8):(1'h0)] wire349;
  wire [(5'h13):(1'h0)] wire348;
  wire signed [(4'h8):(1'h0)] wire347;
  wire [(5'h13):(1'h0)] wire344;
  wire [(3'h7):(1'h0)] wire343;
  wire signed [(5'h15):(1'h0)] wire339;
  wire [(4'hd):(1'h0)] wire325;
  wire signed [(2'h2):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire145;
  wire [(5'h10):(1'h0)] wire144;
  wire [(3'h6):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire141;
  reg signed [(5'h13):(1'h0)] reg346 = (1'h0);
  reg [(5'h10):(1'h0)] reg345 = (1'h0);
  reg [(4'ha):(1'h0)] reg342 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg341 = (1'h0);
  reg [(4'he):(1'h0)] reg340 = (1'h0);
  reg [(3'h5):(1'h0)] reg338 = (1'h0);
  reg [(2'h3):(1'h0)] reg337 = (1'h0);
  reg [(4'h9):(1'h0)] reg336 = (1'h0);
  reg [(4'hf):(1'h0)] reg335 = (1'h0);
  reg [(4'ha):(1'h0)] reg334 = (1'h0);
  reg [(4'hb):(1'h0)] reg333 = (1'h0);
  reg [(4'hf):(1'h0)] reg332 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg331 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg330 = (1'h0);
  reg [(4'hb):(1'h0)] reg329 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg328 = (1'h0);
  reg [(2'h2):(1'h0)] reg327 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  assign y = {wire351,
                 wire350,
                 wire349,
                 wire348,
                 wire347,
                 wire344,
                 wire343,
                 wire339,
                 wire325,
                 wire146,
                 wire145,
                 wire144,
                 wire4,
                 wire5,
                 wire6,
                 wire10,
                 wire141,
                 reg346,
                 reg345,
                 reg342,
                 reg341,
                 reg340,
                 reg338,
                 reg337,
                 reg336,
                 reg335,
                 reg334,
                 reg333,
                 reg332,
                 reg331,
                 reg330,
                 reg329,
                 reg328,
                 reg327,
                 reg7,
                 reg8,
                 reg9,
                 reg143,
                 (1'h0)};
  assign wire4 = $signed(wire2);
  assign wire5 = ($signed({($signed((8'ha3)) * wire0),
                     ((!wire4) ?
                         $signed((8'hbf)) : wire3)}) & wire2[(2'h2):(1'h0)]);
  assign wire6 = (8'hb4);
  always
    @(posedge clk) begin
      reg7 <= {wire4,
          ((~$unsigned(((8'hb6) | (8'h9c)))) ?
              wire0[(3'h6):(3'h6)] : (wire1[(3'h6):(1'h0)] | $signed((wire1 ~^ wire4))))};
      reg8 <= $unsigned($unsigned({((wire0 ? wire1 : wire5) ?
              (wire4 ? wire6 : (8'ha6)) : (reg7 ? reg7 : wire4))}));
      reg9 <= ({$signed($signed((wire6 || reg7))),
          ({wire1[(3'h4):(2'h2)],
              (~|wire2)} >>> $signed(wire4[(3'h4):(3'h4)]))} > wire6[(5'h12):(5'h11)]);
    end
  assign wire10 = wire6;
  module11 #() modinst142 (.wire16(wire5), .y(wire141), .wire13(reg9), .wire12(wire0), .wire15(reg7), .clk(clk), .wire14(wire10));
  always
    @(posedge clk) begin
      reg143 <= wire6[(2'h3):(2'h2)];
    end
  assign wire144 = {wire0[(4'ha):(2'h3)]};
  assign wire145 = $signed(reg9);
  assign wire146 = wire141[(3'h7):(1'h1)];
  module147 #() modinst326 (.wire148(wire141), .clk(clk), .wire151(reg7), .wire149(wire1), .wire152(wire145), .y(wire325), .wire150(wire5));
  always
    @(posedge clk) begin
      reg327 <= wire10;
      if ((&$unsigned($unsigned(wire2))))
        begin
          reg328 <= $unsigned(wire4);
          reg329 <= ((((~&reg327) ?
                  wire5[(3'h7):(2'h3)] : (&wire6)) >>> (wire141 ?
                  $signed($signed(wire6)) : $signed((reg143 > wire144)))) ?
              $unsigned((wire146[(2'h2):(1'h1)] ~^ $signed($signed(reg327)))) : (($unsigned((wire146 ^ (7'h42))) ?
                      (&$signed(reg9)) : (|$signed(wire10))) ?
                  (~$signed($signed((8'h9f)))) : wire141));
          reg330 <= {(!$signed(reg329[(1'h1):(1'h0)]))};
        end
      else
        begin
          reg328 <= (^wire0[(4'ha):(2'h3)]);
          reg329 <= reg327;
          if (($unsigned($unsigned($signed((wire5 < wire144)))) ?
              reg327[(2'h2):(1'h1)] : $signed((($signed(wire146) ?
                  reg7[(3'h4):(1'h0)] : (wire2 ?
                      wire3 : wire145)) || ({reg143} << (reg327 ?
                  reg329 : reg328))))))
            begin
              reg330 <= (-(-(wire3[(1'h1):(1'h1)] > reg7[(4'he):(4'hd)])));
              reg331 <= $unsigned((wire4 < ($signed({reg329,
                  reg9}) ^~ (!{wire10, wire145}))));
            end
          else
            begin
              reg330 <= $unsigned($unsigned(($unsigned($unsigned(reg331)) < wire145[(3'h6):(3'h5)])));
            end
          if ($signed(($signed($unsigned($unsigned(reg143))) == reg329[(2'h3):(2'h3)])))
            begin
              reg332 <= $signed((wire4 ?
                  ((8'hb7) ?
                      ((!wire0) ?
                          reg330[(4'hd):(4'h8)] : wire10) : ((reg9 && reg330) ^ $unsigned(wire146))) : wire141[(3'h7):(1'h1)]));
              reg333 <= $signed(wire145);
            end
          else
            begin
              reg332 <= $unsigned(reg328[(4'ha):(4'h9)]);
              reg333 <= $signed(({reg329} ^ wire5));
              reg334 <= ($unsigned((&$signed({reg8, (8'hac)}))) ?
                  $signed($unsigned(reg331)) : wire5[(4'ha):(3'h4)]);
              reg335 <= (~|(reg143[(4'he):(4'h9)] ^ reg329));
              reg336 <= reg327;
            end
        end
      reg337 <= wire325[(4'hd):(3'h6)];
      reg338 <= $signed({($signed(wire144[(1'h0):(1'h0)]) ?
              {(reg333 | wire1)} : wire4[(2'h2):(1'h0)])});
    end
  assign wire339 = $signed(reg338);
  always
    @(posedge clk) begin
      reg340 <= wire2[(1'h0):(1'h0)];
      reg341 <= (!(((~{wire145}) >>> (~&$unsigned(wire1))) >> ((reg334 ~^ $signed((8'hb0))) ?
          ({reg143, wire3} <= (wire141 ? reg329 : reg330)) : $signed(((8'ha3) ?
              reg333 : reg340)))));
      reg342 <= (($signed({(wire4 <<< reg335), (&reg8)}) ?
          reg334[(1'h1):(1'h0)] : ((wire5[(4'he):(4'h9)] | (wire2 ^~ (8'h9f))) ?
              {$unsigned(wire339),
                  wire1} : wire144[(4'hd):(4'h9)])) || (reg330[(1'h0):(1'h0)] ?
          reg329[(1'h1):(1'h0)] : $signed(($signed(reg329) ?
              {wire141} : $signed(reg330)))));
    end
  assign wire343 = {reg335,
                       ((~|((^wire141) < (reg338 ?
                           (8'hb3) : wire144))) * $signed({$unsigned(reg8)}))};
  assign wire344 = $signed((($signed((&wire325)) << ($signed((8'ha2)) != (^~reg342))) - $unsigned((|(reg331 ?
                       reg328 : wire1)))));
  always
    @(posedge clk) begin
      reg345 <= $unsigned((~&({reg337,
          $signed(wire141)} >>> reg335[(2'h2):(1'h1)])));
      reg346 <= wire344[(4'ha):(1'h0)];
    end
  assign wire347 = {(^~$unsigned((~^$signed(wire2))))};
  assign wire348 = {reg338[(3'h4):(2'h2)]};
  assign wire349 = $unsigned({$unsigned({{wire339}})});
  assign wire350 = wire144;
  assign wire351 = (~{reg330,
                       (($signed(wire146) - (wire6 >= reg8)) ?
                           ($signed(reg345) ?
                               $signed(wire2) : (wire4 >> reg143)) : $signed(((8'hb4) ?
                               reg330 : reg342)))});
endmodule

module module147
#(parameter param324 = {({(((8'ha6) ? (8'ha8) : (8'h9c)) ? ((8'haa) <= (8'hb9)) : {(7'h42)})} ? (8'ha3) : {({(8'ha5)} ? ((8'hb2) ? (8'haa) : (8'ha3)) : ((8'ha8) == (8'ha6))), (((7'h41) ? (8'ha6) : (8'hb2)) <<< ((8'hae) ? (7'h44) : (8'ha1)))}), (8'hb4)})
(y, clk, wire152, wire151, wire150, wire149, wire148);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire152;
  input wire signed [(5'h10):(1'h0)] wire151;
  input wire [(4'hb):(1'h0)] wire150;
  input wire [(5'h15):(1'h0)] wire149;
  input wire [(3'h5):(1'h0)] wire148;
  wire signed [(2'h2):(1'h0)] wire323;
  wire signed [(5'h12):(1'h0)] wire322;
  wire [(5'h13):(1'h0)] wire321;
  wire [(2'h2):(1'h0)] wire320;
  wire [(4'hf):(1'h0)] wire318;
  wire signed [(4'he):(1'h0)] wire241;
  wire [(4'he):(1'h0)] wire240;
  wire [(5'h12):(1'h0)] wire239;
  wire signed [(5'h15):(1'h0)] wire238;
  wire [(5'h12):(1'h0)] wire237;
  wire [(4'h8):(1'h0)] wire236;
  wire [(4'h9):(1'h0)] wire235;
  wire [(5'h11):(1'h0)] wire234;
  wire signed [(4'h8):(1'h0)] wire229;
  wire signed [(5'h11):(1'h0)] wire153;
  reg [(5'h10):(1'h0)] reg233 = (1'h0);
  reg [(4'hd):(1'h0)] reg232 = (1'h0);
  reg [(4'h8):(1'h0)] reg231 = (1'h0);
  assign y = {wire323,
                 wire322,
                 wire321,
                 wire320,
                 wire318,
                 wire241,
                 wire240,
                 wire239,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire229,
                 wire153,
                 reg233,
                 reg232,
                 reg231,
                 (1'h0)};
  assign wire153 = $unsigned(wire151[(4'hb):(3'h4)]);
  module154 #() modinst230 (.wire158(wire149), .wire155(wire152), .y(wire229), .wire157(wire150), .wire156(wire153), .clk(clk));
  always
    @(posedge clk) begin
      reg231 <= (wire151[(4'he):(4'hd)] ?
          wire149[(2'h3):(1'h1)] : (~&$unsigned((~&wire149[(1'h1):(1'h1)]))));
      reg232 <= ((-$unsigned($unsigned($unsigned(wire229)))) <= $unsigned((~&wire152[(3'h4):(1'h1)])));
      reg233 <= $signed($unsigned({(!(8'hbc)), {$unsigned((8'hb4))}}));
    end
  assign wire234 = $signed((|wire229[(1'h1):(1'h0)]));
  assign wire235 = (&$signed($signed(wire149)));
  assign wire236 = wire152;
  assign wire237 = {(-$signed(wire149))};
  assign wire238 = $signed($unsigned(($signed($signed(wire150)) != (~wire237))));
  assign wire239 = wire234[(1'h1):(1'h1)];
  assign wire240 = {($unsigned(wire149[(4'ha):(2'h3)]) ?
                           {wire236[(3'h7):(3'h4)],
                               $signed(wire235)} : wire238[(4'he):(3'h7)]),
                       $signed((8'hbe))};
  assign wire241 = (((~^(((8'hb8) ? wire238 : wire235) <<< $signed(wire234))) ?
                           $unsigned({$unsigned((8'ha8)),
                               ((8'hb7) ?
                                   (7'h42) : reg233)}) : wire151[(5'h10):(2'h2)]) ?
                       (7'h40) : ((~^((-wire148) > $unsigned(wire150))) || (^wire149[(4'ha):(3'h5)])));
  module242 #() modinst319 (.wire246(wire239), .y(wire318), .wire245(wire150), .clk(clk), .wire244(wire152), .wire243(wire149));
  assign wire320 = (!$unsigned({($signed(wire149) ?
                           (reg231 ^ wire237) : ((8'h9f) ~^ wire153)),
                       ((+wire237) || (wire237 != wire235))}));
  assign wire321 = (|$unsigned((wire237 ?
                       ((^reg231) ?
                           (wire234 ?
                               (8'hb3) : wire236) : {(8'ha8)}) : wire151)));
  assign wire322 = (8'ha8);
  assign wire323 = wire321;
endmodule

module module11
#(parameter param140 = (~&((~&(((7'h40) ? (8'had) : (8'hb4)) * ((8'h9f) == (8'hae)))) != (8'hbf))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire17;
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire136,
                 wire82,
                 wire80,
                 wire28,
                 wire27,
                 wire23,
                 wire22,
                 wire21,
                 wire17,
                 reg139,
                 reg138,
                 reg18,
                 reg19,
                 reg20,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire17 = $unsigned($unsigned(wire12));
  always
    @(posedge clk) begin
      reg18 <= ($unsigned(($signed(((8'ha5) ~^ wire16)) ?
              ((&wire16) >>> $signed(wire15)) : wire14)) ?
          $signed($unsigned({$unsigned((8'hb3)),
              wire16[(4'hc):(1'h0)]})) : ($signed((!wire17)) - $signed(wire12)));
      reg19 <= wire16;
      reg20 <= wire12;
    end
  assign wire21 = $signed((~|wire14[(2'h2):(1'h1)]));
  assign wire22 = $signed((-wire17[(4'h9):(4'h8)]));
  assign wire23 = {(!(((reg19 + reg18) <<< (reg18 ? reg19 : wire13)) * reg18))};
  always
    @(posedge clk) begin
      reg24 <= (wire12[(3'h7):(2'h2)] < ((((wire17 ^ wire22) ?
              (wire15 ? reg20 : wire21) : (reg18 ? reg19 : reg20)) ?
          (8'ha1) : $signed((^wire22))) ^ ((!$signed(reg20)) ?
          reg18[(1'h1):(1'h0)] : wire14[(1'h0):(1'h0)])));
      reg25 <= wire14;
      reg26 <= wire13;
    end
  assign wire27 = {(&$signed((reg19 ? (8'hb5) : (wire16 ? wire15 : wire14)))),
                      ((({wire13, wire16} >= (wire13 - (8'hb4))) ?
                              (8'hae) : (~&$unsigned(reg25))) ?
                          reg26[(1'h1):(1'h1)] : (!$unsigned(reg26[(4'h8):(2'h2)])))};
  assign wire28 = (+wire14[(3'h4):(1'h0)]);
  module29 #() modinst81 (.clk(clk), .wire33(wire28), .wire32(wire21), .y(wire80), .wire31(reg18), .wire30(reg19));
  assign wire82 = (|$signed((|reg18)));
  module83 #() modinst137 (.wire85(reg18), .wire84(wire12), .wire87(wire15), .wire88(wire13), .y(wire136), .wire86(wire28), .clk(clk));
  always
    @(posedge clk) begin
      reg138 <= ($signed((reg19[(3'h7):(3'h6)] < wire27)) ?
          (^(-((wire136 != reg19) ?
              $unsigned((7'h41)) : (reg18 >= (8'hb9))))) : {(-(7'h41))});
      reg139 <= wire14[(3'h7):(3'h7)];
    end
endmodule

module module83
#(parameter param135 = (8'had))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire88;
  input wire signed [(5'h12):(1'h0)] wire87;
  input wire signed [(4'hf):(1'h0)] wire86;
  input wire signed [(2'h2):(1'h0)] wire85;
  input wire [(4'hd):(1'h0)] wire84;
  wire [(3'h4):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire126;
  wire signed [(3'h4):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire97;
  wire signed [(4'hf):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire89;
  reg signed [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 reg132,
                 reg131,
                 reg130,
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
                 reg111,
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
                 (1'h0)};
  assign wire89 = wire84[(4'hc):(3'h7)];
  assign wire90 = $signed(wire88[(2'h3):(2'h3)]);
  assign wire91 = ((wire90[(1'h0):(1'h0)] >= ((wire86 ?
                          wire89[(2'h3):(2'h2)] : {wire88, wire86}) ?
                      $signed(wire84) : (8'hae))) <= {(((^~wire84) + (~(8'hb9))) == ($unsigned(wire88) <= (~^wire84)))});
  assign wire92 = (~&wire86[(3'h6):(2'h2)]);
  assign wire93 = $unsigned((~^$signed(wire87)));
  assign wire94 = ($unsigned(($unsigned($signed((8'hab))) ?
                      wire89[(1'h1):(1'h1)] : wire87[(4'hd):(1'h1)])) + wire86[(4'hf):(4'h9)]);
  assign wire95 = $unsigned(wire87);
  assign wire96 = $unsigned($unsigned($signed(((wire87 ? wire94 : wire94) ?
                      (wire84 & wire92) : $signed(wire84)))));
  assign wire97 = {$unsigned(($signed($unsigned(wire89)) > ($unsigned(wire90) && ((8'h9d) == wire92))))};
  assign wire98 = wire93;
  always
    @(posedge clk) begin
      reg99 <= $signed((!(|((wire91 <= wire95) ?
          ((8'hbf) >>> wire87) : (wire87 ? wire91 : wire98)))));
      reg100 <= {(wire98 ?
              ((~|$unsigned(wire95)) != wire96) : $unsigned(wire85)),
          (wire87 ?
              $signed($signed((reg99 ?
                  wire85 : wire94))) : $signed(((wire90 & wire86) >= (~^wire96))))};
    end
  always
    @(posedge clk) begin
      reg101 <= wire98;
      if ($unsigned((~|(~^(+(wire94 < reg100))))))
        begin
          reg102 <= ((($unsigned((+wire93)) ?
                  ($unsigned(wire93) & (~&wire88)) : ((~reg99) & reg101)) ?
              $unsigned(wire85[(2'h2):(1'h1)]) : (wire94[(2'h3):(2'h2)] ?
                  ($unsigned(wire91) && $signed(wire89)) : (wire90 ~^ $signed(wire91)))) - wire96[(4'hf):(4'h8)]);
          reg103 <= wire92;
          reg104 <= ((reg101 & ($signed({wire87}) <= {(wire85 || wire84)})) >> wire92[(3'h6):(2'h2)]);
        end
      else
        begin
          reg102 <= (((&wire89) ?
                  reg102 : ($unsigned(wire94) ?
                      ((~|reg101) ?
                          (wire97 ?
                              (7'h43) : wire97) : wire92[(4'hd):(1'h0)]) : wire96[(4'h8):(3'h4)])) ?
              (wire96[(4'hf):(3'h4)] ~^ wire84[(3'h5):(1'h0)]) : {reg101});
          if (wire84[(4'h8):(3'h5)])
            begin
              reg103 <= wire94;
              reg104 <= (wire98[(2'h3):(2'h3)] << (8'hb4));
            end
          else
            begin
              reg103 <= $signed(({($unsigned(reg101) ?
                          (wire90 ? reg103 : wire91) : $signed(wire92)),
                      $signed($unsigned((7'h40)))} ?
                  $signed($unsigned($unsigned(wire86))) : ($signed($signed(wire89)) ?
                      (!$unsigned(reg104)) : wire95[(4'hb):(1'h0)])));
              reg104 <= wire87;
              reg105 <= (~|(^~$unsigned((^wire96))));
              reg106 <= reg101[(1'h0):(1'h0)];
            end
          if (((~&{wire90[(3'h6):(2'h3)], wire88}) - reg105))
            begin
              reg107 <= reg102;
              reg108 <= $signed((!reg101[(3'h5):(3'h5)]));
              reg109 <= wire91;
              reg110 <= wire87;
              reg111 <= reg103;
            end
          else
            begin
              reg107 <= {wire93[(3'h5):(3'h5)]};
              reg108 <= ($unsigned(($signed(reg105[(3'h5):(3'h5)]) || (&$signed(wire97)))) ?
                  reg107[(3'h4):(1'h0)] : (wire93[(3'h5):(2'h2)] + ((|$signed((7'h42))) ?
                      reg108 : wire86[(4'hf):(4'ha)])));
              reg109 <= {((((reg101 + reg108) ?
                          {(8'hbb)} : (reg99 ?
                              reg111 : wire93)) & $signed(reg106)) ?
                      (8'hbe) : reg100[(4'he):(4'hd)]),
                  reg104[(2'h3):(1'h1)]};
            end
          reg112 <= {wire94[(5'h10):(3'h4)],
              {({$unsigned(reg108)} + (^{(8'hb4)})),
                  $signed((&$unsigned(wire88)))}};
        end
      if ((~reg110[(4'ha):(3'h6)]))
        begin
          reg113 <= reg105;
          if ((8'ha9))
            begin
              reg114 <= ((reg102 | $unsigned(({reg107} + (8'hae)))) ~^ (&reg101[(3'h7):(3'h6)]));
              reg115 <= $unsigned((-reg99));
              reg116 <= ($signed($unsigned({(wire89 != reg106)})) <<< reg113[(3'h7):(3'h5)]);
            end
          else
            begin
              reg114 <= reg101[(1'h0):(1'h0)];
              reg115 <= ($unsigned($signed(wire88)) >> (($unsigned(reg116[(2'h2):(2'h2)]) - (8'hb9)) | wire92[(3'h6):(1'h0)]));
              reg116 <= wire91[(1'h1):(1'h1)];
              reg117 <= ($unsigned((^{(reg99 - wire88)})) || ({$unsigned($signed((7'h41))),
                  (8'had)} >= reg111[(2'h3):(2'h3)]));
              reg118 <= reg104;
            end
        end
      else
        begin
          reg113 <= ($unsigned($signed((~&(wire86 ? reg115 : (8'hbd))))) ?
              ((~^wire91[(4'h9):(3'h4)]) ?
                  wire91[(1'h1):(1'h1)] : (((8'haf) ?
                          (!(8'haa)) : {reg106, wire85}) ?
                      $signed($unsigned(reg115)) : {$unsigned(reg113)})) : (({$signed((7'h41)),
                  reg101} <<< ((reg109 != (8'hae)) ?
                  reg103 : $signed(reg110))) == (wire94[(4'h9):(3'h4)] < (+((8'had) >>> reg115)))));
          if ($signed(reg107[(3'h6):(3'h6)]))
            begin
              reg114 <= reg112;
              reg115 <= reg101;
            end
          else
            begin
              reg114 <= wire90;
              reg115 <= (~|$signed({(wire88[(2'h2):(1'h0)] > (~^reg104))}));
              reg116 <= ((|$unsigned(wire92)) ?
                  (reg110[(4'hc):(2'h3)] || ($signed($unsigned(reg113)) + (~^{(8'hbd)}))) : wire93[(4'h8):(3'h6)]);
              reg117 <= wire89[(2'h2):(1'h1)];
            end
          reg118 <= {$signed((&($unsigned(reg109) ?
                  (~^(8'ha1)) : wire96[(2'h2):(1'h1)]))),
              (reg116 <<< ($signed(wire92) <= ($unsigned(wire84) ?
                  reg107[(2'h2):(1'h1)] : (|reg108))))};
          reg119 <= {(wire94 ?
                  $signed(wire90[(2'h3):(2'h3)]) : $unsigned((8'hb8)))};
          reg120 <= ((^~reg99) != $unsigned(($signed((reg112 << (8'hb7))) < (((8'hb6) - (7'h42)) ?
              $unsigned(wire89) : $unsigned(wire96)))));
        end
      reg121 <= $unsigned(reg99);
    end
  assign wire122 = wire85[(2'h2):(1'h1)];
  assign wire123 = $signed({wire90[(2'h3):(2'h2)], (^wire85)});
  assign wire124 = reg116[(4'ha):(4'h9)];
  assign wire125 = ((reg118[(4'hb):(3'h4)] & $signed($unsigned((reg104 <<< (8'hba))))) ~^ (reg111[(4'hd):(2'h2)] ?
                       wire124[(3'h4):(3'h4)] : (wire97[(3'h6):(3'h6)] * ($signed(reg107) ?
                           reg106 : (wire123 != reg108)))));
  assign wire126 = $signed(($unsigned((!((8'hb7) >> wire125))) ?
                       (({(8'ha7),
                           reg116} << $signed(reg112)) ^ reg115[(3'h7):(2'h2)]) : (!($unsigned(reg108) ?
                           $signed(wire97) : $unsigned(reg117)))));
  assign wire127 = $signed((wire87 ? (8'ha5) : (-$signed({(8'hbe), reg105}))));
  assign wire128 = ($unsigned((&{$unsigned(wire124),
                       reg111})) < (($unsigned((wire96 ?
                           wire93 : reg99)) || {(^wire98)}) ?
                       ($signed(((7'h43) ? reg118 : wire127)) ?
                           {(8'h9d), $unsigned((8'hb6))} : ((wire89 ?
                               reg100 : (8'h9d)) <= $signed((8'hbb)))) : {($unsigned(reg116) ?
                               $unsigned(reg118) : $unsigned(wire92)),
                           $unsigned($signed(reg102))}));
  assign wire129 = (~^{wire128[(1'h1):(1'h0)], reg104});
  always
    @(posedge clk) begin
      if ($unsigned({(reg106[(5'h11):(5'h10)] >>> (wire84[(2'h2):(1'h1)] ?
              $unsigned(wire122) : (~|wire89)))}))
        begin
          reg130 <= $signed((wire98[(5'h14):(1'h1)] * (|$unsigned($unsigned(reg120)))));
          reg131 <= $unsigned((8'haf));
          reg132 <= $unsigned(({wire127, $unsigned((~&(8'hab)))} >>> ({wire86,
              reg111} >>> {$unsigned(reg110)})));
        end
      else
        begin
          reg130 <= ($signed($signed($signed($unsigned((8'haf))))) ?
              (reg105 << reg109) : $unsigned(({$unsigned(reg116),
                  (^~(8'ha6))} | (wire98 && (+(8'hb6))))));
        end
    end
  assign wire133 = $unsigned($unsigned(((^~(reg107 <= reg131)) ^ reg101)));
  assign wire134 = ((+(($unsigned(reg99) ? (^wire95) : (reg113 <= reg107)) ?
                           $unsigned($unsigned(wire95)) : wire95)) ?
                       ($unsigned(wire126[(3'h7):(3'h6)]) + $signed(({reg117,
                           reg100} ~^ (8'hbf)))) : ((-(reg132[(2'h2):(1'h0)] ^ (~&reg111))) ?
                           (wire84 ?
                               {(+wire97)} : $unsigned({(8'hbd),
                                   wire91})) : (^($unsigned(wire89) <= $unsigned(reg109)))));
endmodule

module module29
#(parameter param79 = {(&{(~^{(8'ha2), (7'h40)}), ({(8'hb3)} ? (~&(8'hbc)) : {(8'ha1), (8'hb2)})})})
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h224):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire33;
  input wire signed [(2'h2):(1'h0)] wire32;
  input wire signed [(3'h4):(1'h0)] wire31;
  input wire [(2'h2):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire58,
                 wire57,
                 wire56,
                 wire35,
                 wire34,
                 reg71,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire34 = $unsigned((&$unsigned((~((8'hb5) ? wire30 : wire30)))));
  assign wire35 = wire31;
  always
    @(posedge clk) begin
      reg36 <= (wire35[(1'h0):(1'h0)] ? wire32 : wire30);
      reg37 <= ((+wire31[(3'h4):(1'h1)]) ?
          ((($unsigned(wire31) ? $signed(wire32) : (wire35 ? reg36 : wire31)) ?
                  wire33[(1'h0):(1'h0)] : (8'ha3)) ?
              (reg36 ?
                  wire31[(2'h3):(2'h3)] : wire31[(1'h0):(1'h0)]) : $signed(wire31[(1'h0):(1'h0)])) : (wire33[(2'h3):(2'h2)] + wire34[(3'h5):(2'h2)]));
      if ({{(($signed(wire34) << (wire34 ? (8'hac) : wire35)) ?
                  (^~(wire35 > (8'hab))) : ({wire30} ?
                      wire34 : wire31[(1'h1):(1'h0)])),
              $signed($signed($signed(wire30)))},
          ($signed((wire30 ? (wire32 << wire32) : (+reg36))) ?
              $signed(((wire35 == wire31) ?
                  (wire34 >= wire30) : $signed(wire30))) : (-$signed(reg37)))})
        begin
          reg38 <= (!$unsigned((wire34[(3'h6):(3'h5)] ?
              {reg37[(4'ha):(2'h2)]} : $signed(wire30))));
          reg39 <= ((!$signed(((+wire35) ?
              reg38 : (wire32 ? reg36 : (8'hbc))))) * $signed((~^(~^wire33))));
        end
      else
        begin
          reg38 <= wire32;
          if ($signed(((wire30 & ({reg36,
              wire30} ^ reg37[(4'h9):(2'h3)])) & reg39[(3'h7):(3'h4)])))
            begin
              reg39 <= {wire33};
              reg40 <= (wire32[(2'h2):(1'h0)] ?
                  wire32[(1'h1):(1'h1)] : wire35[(2'h2):(2'h2)]);
              reg41 <= $signed((8'ha7));
            end
          else
            begin
              reg39 <= $signed($signed((+{$signed(wire30)})));
              reg40 <= (~(|{($signed((8'hb2)) ? (+wire35) : wire30),
                  $signed((!(7'h43)))}));
              reg41 <= reg36;
              reg42 <= $signed(reg37[(4'h9):(4'h9)]);
              reg43 <= ($unsigned($signed((+(wire32 * reg36)))) ?
                  (((!{reg36}) >> ({reg41} ^ $signed(wire35))) ?
                      reg41 : ((8'haa) ?
                          $unsigned(((8'hbc) ?
                              reg40 : reg37)) : wire31)) : ((reg41[(3'h7):(3'h6)] <= $unsigned((wire35 | reg41))) ^ wire34));
            end
        end
      if ($signed((((~^(reg43 | reg42)) ^~ ((wire32 ?
          reg43 : wire32) >>> wire33)) & (|(wire31[(1'h0):(1'h0)] ?
          (reg41 ? (8'h9c) : wire33) : wire34[(3'h7):(1'h0)])))))
        begin
          reg44 <= $unsigned(reg36);
          if ((!((reg40 ?
              ($signed(reg43) ?
                  reg42 : reg44[(3'h7):(1'h1)]) : ($signed(wire34) ?
                  {reg44,
                      wire31} : {reg40})) - $signed($unsigned(reg41[(5'h10):(4'hd)])))))
            begin
              reg45 <= $unsigned($signed(($signed(wire33[(2'h2):(1'h0)]) ?
                  (reg41[(1'h0):(1'h0)] ?
                      $signed(reg39) : $unsigned(reg38)) : ($unsigned(wire32) ?
                      wire30[(1'h1):(1'h1)] : (!wire32)))));
              reg46 <= $unsigned($unsigned(reg42[(4'ha):(3'h5)]));
              reg47 <= wire34;
            end
          else
            begin
              reg45 <= {(^(&(+$unsigned(wire33))))};
              reg46 <= wire35;
            end
          reg48 <= (reg37[(4'hc):(4'ha)] >> reg45);
        end
      else
        begin
          reg44 <= ($signed(($signed(reg37[(5'h10):(3'h5)]) > reg42[(3'h4):(1'h1)])) ?
              (!reg37[(2'h3):(1'h1)]) : reg48);
          reg45 <= $signed($unsigned($unsigned(reg44)));
          if (((^~(8'h9f)) ?
              (~^{(7'h41),
                  ((wire32 ? reg38 : reg42) ?
                      reg48 : {wire32})}) : (~{((reg43 < wire35) ?
                      wire35[(2'h2):(1'h1)] : $unsigned(reg43))})))
            begin
              reg46 <= $unsigned(reg47);
              reg47 <= ($signed(reg45[(4'h9):(4'h8)]) <= $unsigned($signed(wire35)));
              reg48 <= (($unsigned(wire35[(2'h2):(1'h0)]) <<< $signed(($signed((8'hbf)) ?
                  reg36 : $signed(reg44)))) >= $signed(($signed(wire31) | ($unsigned((8'hbe)) && reg39))));
              reg49 <= wire35[(1'h1):(1'h0)];
              reg50 <= (&reg48[(3'h7):(3'h5)]);
            end
          else
            begin
              reg46 <= (~&((~^(reg45 >> $unsigned(reg41))) >>> $unsigned((|(reg46 ?
                  wire32 : reg38)))));
              reg47 <= wire32[(1'h0):(1'h0)];
              reg48 <= (~&(((8'haa) ?
                  (reg50[(3'h4):(2'h2)] ?
                      (^wire33) : $unsigned(reg44)) : (reg44 ?
                      wire30[(2'h2):(2'h2)] : $unsigned(reg36))) == reg46[(2'h2):(1'h0)]));
              reg49 <= $signed(reg43);
              reg50 <= $unsigned(reg48[(5'h10):(2'h2)]);
            end
          if (((wire32 ?
                  ((~|$unsigned((8'h9f))) ?
                      ((reg49 <= reg43) + ((8'hb5) ?
                          reg37 : wire32)) : ($signed(reg40) ?
                          wire33[(2'h2):(1'h0)] : reg42)) : (~&reg38[(4'he):(4'he)])) ?
              $unsigned((reg37 == ($unsigned(wire32) | (wire33 ?
                  reg37 : wire31)))) : $unsigned((($signed(wire32) >>> reg37) ?
                  {reg44} : reg50))))
            begin
              reg51 <= ((~&wire35[(1'h1):(1'h0)]) ?
                  wire30[(2'h2):(1'h1)] : $signed($signed((wire30[(2'h2):(1'h1)] ?
                      (reg48 * reg48) : (|reg46)))));
              reg52 <= ((((-(|wire35)) * $unsigned((-wire35))) ?
                      $signed(((+reg50) & $signed((7'h40)))) : $signed($unsigned((8'ha2)))) ?
                  ((!{reg49,
                      $signed(wire35)}) >= (($signed(reg38) >>> ((8'hb2) ?
                          reg50 : wire30)) ?
                      (~^(reg45 ?
                          reg36 : reg39)) : reg37)) : (&($signed($unsigned(reg40)) ?
                      {$signed(wire34)} : $unsigned((|reg41)))));
              reg53 <= (!$unsigned(((+(-wire35)) | reg44)));
            end
          else
            begin
              reg51 <= ($unsigned({$signed($signed(reg44)),
                  ($signed(reg42) | $signed(reg39))}) - ((+reg37) ?
                  (!($signed(wire34) | $signed(reg49))) : ($unsigned({reg49}) && $unsigned($signed(reg48)))));
              reg52 <= ($signed($unsigned({wire33})) >> $unsigned({(8'ha7)}));
              reg53 <= $signed(((8'hb7) ?
                  reg37[(5'h15):(5'h13)] : wire34[(4'h8):(2'h2)]));
              reg54 <= wire34;
              reg55 <= $signed($unsigned(((|(wire35 - wire35)) >>> $signed($signed(reg53)))));
            end
        end
    end
  assign wire56 = reg40;
  assign wire57 = {((~^((reg46 ?
                          reg40 : (8'hb3)) != $signed(reg42))) >> wire32[(2'h2):(2'h2)])};
  assign wire58 = (wire35[(1'h0):(1'h0)] || $signed(reg51[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (((8'had) + $signed(reg52)))
        begin
          reg59 <= (!(wire30[(2'h2):(1'h0)] << reg48[(4'hb):(3'h4)]));
          reg60 <= $unsigned($unsigned(reg50[(4'h8):(3'h4)]));
          if ((8'ha8))
            begin
              reg61 <= $unsigned(reg49);
            end
          else
            begin
              reg61 <= $unsigned({wire58[(4'hb):(1'h1)]});
              reg62 <= $signed(wire35[(1'h0):(1'h0)]);
              reg63 <= {(reg39 ?
                      $unsigned(reg42[(3'h7):(2'h3)]) : $unsigned($unsigned({reg53})))};
            end
          reg64 <= ((+((^~((7'h41) ?
                  reg38 : reg62)) & $unsigned(((8'hb9) && reg44)))) ?
              reg50 : (!$signed({(reg62 ? reg55 : reg36)})));
          reg65 <= ((~&$unsigned((wire57 & $signed(reg42)))) + $unsigned(reg45[(3'h6):(3'h6)]));
        end
      else
        begin
          reg59 <= reg38;
          reg60 <= ((|((-reg55) >>> reg45)) ?
              reg52 : {$unsigned(wire31[(1'h1):(1'h0)])});
          reg61 <= wire35;
        end
      reg66 <= reg54[(3'h7):(1'h0)];
    end
  assign wire67 = (reg59[(2'h2):(1'h0)] == (reg41[(4'hd):(2'h2)] >= reg53[(4'h8):(3'h4)]));
  assign wire68 = reg55[(1'h0):(1'h0)];
  assign wire69 = reg45[(2'h3):(2'h2)];
  assign wire70 = $signed(($signed($signed((reg63 ?
                      reg59 : wire35))) * $signed($signed(wire68))));
  always
    @(posedge clk) begin
      reg71 <= $unsigned(wire56[(3'h4):(1'h0)]);
    end
  assign wire72 = (wire33[(2'h3):(2'h3)] ?
                      reg44[(3'h7):(3'h4)] : $signed($signed((wire70 ?
                          $signed(reg52) : ((8'hbb) ? wire67 : (7'h43))))));
  assign wire73 = reg64[(3'h4):(2'h2)];
  assign wire74 = $signed($unsigned(reg48));
  assign wire75 = reg48;
  assign wire76 = $unsigned((reg48[(4'hf):(4'he)] ?
                      (reg61[(1'h1):(1'h0)] ?
                          ($unsigned(reg42) - (+(8'hb6))) : reg45[(3'h5):(1'h0)]) : $unsigned(((wire70 ?
                          reg59 : reg49) << $unsigned(reg51)))));
  assign wire77 = {(~$signed((wire56[(2'h2):(1'h1)] ?
                          reg45[(1'h0):(1'h0)] : (reg49 ? wire33 : reg46)))),
                      $unsigned($signed(($signed(reg51) && $signed(wire75))))};
  assign wire78 = $unsigned(reg52[(3'h5):(3'h5)]);
endmodule

module module242  (y, clk, wire246, wire245, wire244, wire243);
  output wire [(32'h321):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire246;
  input wire signed [(4'hb):(1'h0)] wire245;
  input wire signed [(4'h9):(1'h0)] wire244;
  input wire signed [(5'h15):(1'h0)] wire243;
  wire [(5'h10):(1'h0)] wire301;
  wire [(4'hd):(1'h0)] wire297;
  wire signed [(5'h12):(1'h0)] wire296;
  wire [(4'hb):(1'h0)] wire272;
  wire [(5'h10):(1'h0)] wire271;
  wire [(4'h9):(1'h0)] wire270;
  wire signed [(4'hf):(1'h0)] wire269;
  wire [(4'hf):(1'h0)] wire268;
  wire signed [(4'h9):(1'h0)] wire267;
  wire signed [(4'hc):(1'h0)] wire266;
  wire [(4'hd):(1'h0)] wire265;
  wire signed [(2'h2):(1'h0)] wire264;
  wire [(5'h10):(1'h0)] wire263;
  wire signed [(3'h7):(1'h0)] wire262;
  wire signed [(4'ha):(1'h0)] wire251;
  wire signed [(3'h4):(1'h0)] wire250;
  reg [(4'hb):(1'h0)] reg317 = (1'h0);
  reg [(3'h7):(1'h0)] reg316 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg315 = (1'h0);
  reg [(4'he):(1'h0)] reg314 = (1'h0);
  reg [(5'h15):(1'h0)] reg313 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg312 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg311 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg310 = (1'h0);
  reg [(4'hc):(1'h0)] reg309 = (1'h0);
  reg [(5'h13):(1'h0)] reg308 = (1'h0);
  reg [(3'h4):(1'h0)] reg307 = (1'h0);
  reg [(4'h8):(1'h0)] reg306 = (1'h0);
  reg [(2'h2):(1'h0)] reg305 = (1'h0);
  reg [(5'h11):(1'h0)] reg304 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg303 = (1'h0);
  reg [(5'h15):(1'h0)] reg302 = (1'h0);
  reg [(2'h3):(1'h0)] reg300 = (1'h0);
  reg [(3'h6):(1'h0)] reg299 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg298 = (1'h0);
  reg [(4'h8):(1'h0)] reg295 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg294 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg293 = (1'h0);
  reg [(3'h4):(1'h0)] reg292 = (1'h0);
  reg [(4'he):(1'h0)] reg291 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg290 = (1'h0);
  reg signed [(4'he):(1'h0)] reg289 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg288 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg287 = (1'h0);
  reg [(4'he):(1'h0)] reg286 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg285 = (1'h0);
  reg signed [(4'he):(1'h0)] reg284 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg283 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg282 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg281 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg280 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg279 = (1'h0);
  reg [(5'h15):(1'h0)] reg278 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg277 = (1'h0);
  reg [(2'h2):(1'h0)] reg276 = (1'h0);
  reg [(3'h6):(1'h0)] reg275 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg274 = (1'h0);
  reg [(4'hd):(1'h0)] reg273 = (1'h0);
  reg [(2'h3):(1'h0)] reg261 = (1'h0);
  reg [(4'h9):(1'h0)] reg260 = (1'h0);
  reg [(4'h9):(1'h0)] reg259 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg258 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg257 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg256 = (1'h0);
  reg [(5'h14):(1'h0)] reg255 = (1'h0);
  reg [(2'h2):(1'h0)] reg254 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg253 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg252 = (1'h0);
  reg [(2'h3):(1'h0)] reg249 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg248 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg247 = (1'h0);
  assign y = {wire301,
                 wire297,
                 wire296,
                 wire272,
                 wire271,
                 wire270,
                 wire269,
                 wire268,
                 wire267,
                 wire266,
                 wire265,
                 wire264,
                 wire263,
                 wire262,
                 wire251,
                 wire250,
                 reg317,
                 reg316,
                 reg315,
                 reg314,
                 reg313,
                 reg312,
                 reg311,
                 reg310,
                 reg309,
                 reg308,
                 reg307,
                 reg306,
                 reg305,
                 reg304,
                 reg303,
                 reg302,
                 reg300,
                 reg299,
                 reg298,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg249,
                 reg248,
                 reg247,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg247 <= (8'h9d);
      reg248 <= $unsigned(wire244);
      reg249 <= ($unsigned((wire244 && (~^(wire244 ?
          reg248 : wire245)))) >= wire245[(4'h9):(1'h0)]);
    end
  assign wire250 = (~|wire246);
  assign wire251 = (~(reg248 >> $signed(wire244[(4'h9):(2'h3)])));
  always
    @(posedge clk) begin
      reg252 <= wire243;
      reg253 <= ((|($signed({wire245, wire250}) ?
          reg252[(2'h3):(1'h1)] : $unsigned($unsigned(wire250)))) ^ reg248);
      reg254 <= $unsigned(wire243);
      if ($signed($unsigned(reg252[(3'h7):(1'h1)])))
        begin
          if (wire245)
            begin
              reg255 <= $unsigned((-wire245));
            end
          else
            begin
              reg255 <= (^($unsigned($signed($unsigned((8'ha9)))) <= wire246[(2'h2):(2'h2)]));
              reg256 <= (~wire243);
              reg257 <= $unsigned($unsigned(wire244[(4'h9):(1'h1)]));
              reg258 <= (^$unsigned((&wire250[(2'h3):(1'h1)])));
            end
          if ({reg257, {wire250, (-({reg248, wire243} * {(8'hb0)}))}})
            begin
              reg259 <= (^~(reg256 ?
                  $signed($signed((reg252 ?
                      reg249 : wire251))) : reg249[(2'h2):(1'h1)]));
              reg260 <= (+reg258[(4'h8):(1'h1)]);
            end
          else
            begin
              reg259 <= wire251[(4'h9):(1'h1)];
              reg260 <= {reg258[(2'h2):(1'h1)],
                  ((reg258 + $unsigned(reg260)) >> reg252)};
            end
          reg261 <= reg254;
        end
      else
        begin
          reg255 <= $signed(reg248);
          reg256 <= reg249[(1'h1):(1'h0)];
        end
    end
  assign wire262 = ((({(wire245 ? wire245 : wire246), (!(8'h9e))} ?
                       (|$signed(wire245)) : ((reg249 ? wire246 : wire246) ?
                           (wire245 + reg257) : (+reg252))) * {(~&wire245)}) || ($signed($unsigned({reg257})) <= {$signed((reg248 ?
                           reg253 : (8'hb1))),
                       $signed(reg253)}));
  assign wire263 = reg256[(1'h1):(1'h1)];
  assign wire264 = reg260;
  assign wire265 = reg258[(4'hb):(2'h3)];
  assign wire266 = reg247[(3'h7):(3'h5)];
  assign wire267 = $unsigned(((~reg259) ?
                       (wire263 <<< {wire246}) : (+$signed($unsigned(wire243)))));
  assign wire268 = $signed(wire263);
  assign wire269 = reg253;
  assign wire270 = $signed($unsigned(wire243[(5'h12):(5'h11)]));
  assign wire271 = $signed((wire266 ?
                       wire245 : (((!reg260) ?
                           (wire263 ?
                               reg254 : reg258) : wire264) <= (reg258 ~^ wire246))));
  assign wire272 = (({(((8'haf) ? wire264 : reg247) ?
                               {wire263} : $signed(wire244)),
                           (+(+(8'hac)))} ?
                       ((~&reg249) ?
                           ({(8'hb1)} != {wire263,
                               reg259}) : wire263[(4'hb):(3'h4)]) : ((reg248[(4'he):(4'he)] ?
                           (reg256 == reg259) : reg253) >> (~&$unsigned(reg256)))) & wire250);
  always
    @(posedge clk) begin
      if (((+wire272) <<< reg258))
        begin
          reg273 <= wire265[(4'h8):(4'h8)];
          reg274 <= $signed($signed((-reg249)));
          reg275 <= reg249[(1'h0):(1'h0)];
          reg276 <= wire267[(2'h3):(1'h0)];
          if (wire264[(2'h2):(2'h2)])
            begin
              reg277 <= {reg254};
              reg278 <= (reg274 || (($signed(((7'h44) != wire246)) ^~ $signed($signed(wire244))) ?
                  (reg259 | $unsigned(wire264[(2'h2):(1'h0)])) : $signed((+wire250))));
              reg279 <= wire272;
              reg280 <= (wire243[(5'h10):(3'h4)] ?
                  wire272[(1'h1):(1'h0)] : (~&(&($signed((8'ha9)) | reg248))));
            end
          else
            begin
              reg277 <= {wire271[(4'he):(1'h0)]};
              reg278 <= wire267[(2'h3):(2'h3)];
              reg279 <= $signed(((~$unsigned({reg276, (7'h42)})) ?
                  reg260 : (((wire268 != wire264) ?
                          $unsigned(wire269) : (wire243 ? reg260 : (8'ha7))) ?
                      $unsigned($signed(reg261)) : (~(reg280 ^ reg255)))));
              reg280 <= $signed(reg252[(3'h7):(3'h6)]);
              reg281 <= $unsigned($unsigned(($signed((reg257 ?
                      reg259 : reg274)) ?
                  {wire263[(3'h6):(3'h4)]} : (reg254[(1'h1):(1'h1)] ?
                      (reg247 > wire246) : reg274))));
            end
        end
      else
        begin
          reg273 <= reg280[(5'h12):(2'h2)];
        end
      reg282 <= {(($unsigned({reg278, (8'ha3)}) ?
                  reg281[(3'h6):(3'h4)] : $unsigned(wire251[(4'h8):(3'h6)])) ?
              {($signed(reg260) ? (+reg248) : (reg276 == wire265)),
                  {(&wire244)}} : $unsigned($signed({(8'hbe), (8'ha4)})))};
      reg283 <= $signed($unsigned(wire262));
      if (reg274[(3'h5):(2'h3)])
        begin
          reg284 <= (~|((reg258 * $signed($unsigned(wire263))) ~^ reg274[(1'h0):(1'h0)]));
          reg285 <= ($signed((8'ha5)) ?
              (~^$unsigned((8'ha7))) : $signed((($unsigned(reg254) - (wire244 ?
                      reg277 : reg277)) ?
                  (reg280 & (wire266 ?
                      wire268 : reg273)) : (^wire251[(3'h4):(1'h1)]))));
          if ($unsigned((~&(reg279 | {$unsigned(wire250), $signed(wire245)}))))
            begin
              reg286 <= $unsigned(reg253);
              reg287 <= $unsigned(($signed((reg260 << $signed(wire272))) >= ($unsigned((8'hb0)) ?
                  $unsigned((wire251 > (8'ha6))) : (~&(wire245 || wire268)))));
              reg288 <= {{(~|{reg259}),
                      (reg257[(4'hc):(4'hb)] ?
                          wire246 : (((8'hb4) ?
                              reg253 : reg261) + (+reg252)))}};
            end
          else
            begin
              reg286 <= $unsigned($unsigned(((wire266 ?
                  wire267 : (reg279 ?
                      reg284 : (8'ha0))) >> $unsigned((reg257 | reg286)))));
              reg287 <= (~^(~(+reg258)));
              reg288 <= ((7'h42) && $signed($signed(wire265)));
              reg289 <= $unsigned({(reg273 ?
                      {$unsigned(reg276),
                          wire272[(1'h1):(1'h1)]} : {$signed(wire265),
                          (reg287 ? (8'ha7) : wire243)}),
                  wire266});
            end
          reg290 <= {$unsigned($unsigned(reg276[(2'h2):(1'h1)])),
              $signed($unsigned(wire263))};
        end
      else
        begin
          reg284 <= (~&$signed(((~|$signed((7'h42))) * $unsigned((reg287 == reg259)))));
          if ($signed(((^~((-reg278) ?
              (~|wire264) : (reg258 & (8'ha1)))) == reg283)))
            begin
              reg285 <= reg277;
            end
          else
            begin
              reg285 <= wire272;
              reg286 <= ((wire251 * (($signed(reg281) ~^ (reg252 ?
                          reg253 : wire271)) ?
                      (reg247[(3'h6):(2'h3)] < {reg256,
                          wire263}) : $signed({wire246}))) ?
                  reg253[(2'h2):(2'h2)] : (wire267 ?
                      reg261[(2'h3):(2'h2)] : reg257));
              reg287 <= reg273;
              reg288 <= $signed((reg288[(5'h10):(2'h3)] * (^$signed($unsigned((8'hbd))))));
              reg289 <= reg287[(1'h0):(1'h0)];
            end
          reg290 <= (8'hba);
          reg291 <= $signed((($unsigned($unsigned(reg255)) ?
              reg282 : ((^~wire265) ?
                  $signed((8'hba)) : reg288[(5'h12):(4'hf)])) * ($unsigned($signed(reg275)) * reg253)));
          reg292 <= (((({wire265} ?
                      (^reg252) : (wire263 * wire265)) * {$signed(reg254),
                      $signed((7'h41))}) ?
                  ($unsigned(reg283[(4'hb):(2'h2)]) + (wire269[(3'h7):(3'h5)] == $unsigned(wire262))) : (^reg291[(4'h9):(1'h0)])) ?
              $signed($unsigned((&((8'ha9) == reg258)))) : reg291[(3'h4):(1'h1)]);
        end
      if (reg280)
        begin
          if (reg259[(4'h8):(3'h6)])
            begin
              reg293 <= $signed((^~wire267[(3'h5):(2'h3)]));
              reg294 <= (!$signed($signed($signed($signed(reg277)))));
            end
          else
            begin
              reg293 <= {{$signed(($unsigned(wire251) ~^ (~|reg293))),
                      $signed((8'ha8))},
                  $signed(reg277)};
              reg294 <= {wire244[(1'h1):(1'h1)],
                  (({$signed(reg290), $signed(reg253)} ?
                      {(reg284 ~^ wire263)} : ($unsigned(reg275) ?
                          reg288 : (8'hb9))) < ($unsigned($signed(wire264)) ?
                      wire251 : reg278[(1'h1):(1'h1)]))};
            end
        end
      else
        begin
          if ((reg291[(4'h8):(1'h0)] ?
              reg290[(3'h6):(2'h2)] : (($signed((~^reg284)) ?
                      {((8'ha9) ? (8'hb7) : reg252),
                          $unsigned(reg260)} : wire262) ?
                  wire246[(4'h9):(2'h3)] : reg289[(3'h7):(2'h3)])))
            begin
              reg293 <= (^~($signed(wire266) == ($unsigned($signed(reg253)) ?
                  ((8'hb8) ?
                      $signed(reg288) : ((8'hab) ?
                          wire271 : wire269)) : (~|(reg259 == reg275)))));
            end
          else
            begin
              reg293 <= (+((~|(^{reg278})) == reg252[(1'h1):(1'h0)]));
              reg294 <= (~{$signed($unsigned($signed(wire264)))});
            end
          reg295 <= {$unsigned($unsigned(reg292[(1'h1):(1'h1)]))};
        end
    end
  assign wire296 = (((reg281[(4'hb):(4'hb)] ?
                           (^(reg295 <<< wire245)) : reg295[(4'h8):(2'h2)]) <<< reg284) ?
                       $signed((((reg282 << reg287) >> ((8'ha2) ^ reg260)) ?
                           {$unsigned(wire250),
                               reg273[(3'h4):(3'h4)]} : $signed(wire272))) : $unsigned(reg273));
  assign wire297 = ($unsigned(reg287[(2'h3):(1'h0)]) && reg285[(4'h8):(1'h1)]);
  always
    @(posedge clk) begin
      reg298 <= $signed($signed(reg252[(3'h4):(1'h0)]));
      if ((reg292 ? wire264[(2'h2):(2'h2)] : $signed(wire262[(2'h3):(2'h2)])))
        begin
          reg299 <= $signed(((+reg288[(2'h3):(2'h2)]) >> (8'haf)));
          reg300 <= $unsigned($unsigned(((reg288 ?
                  $unsigned(reg288) : $unsigned((7'h41))) ?
              (~(reg281 >>> (8'hbf))) : (^~$signed(reg275)))));
        end
      else
        begin
          reg299 <= $signed(wire264[(2'h2):(1'h0)]);
          reg300 <= (~&$unsigned((((~&wire245) && (reg300 & wire266)) ?
              (~|reg261) : $unsigned((reg287 ? wire266 : wire297)))));
        end
    end
  assign wire301 = $signed(($signed({$signed(reg288)}) ?
                       $unsigned(wire245) : reg300));
  always
    @(posedge clk) begin
      reg302 <= (8'hb6);
      if ((wire264[(1'h1):(1'h0)] >> $unsigned((^((8'ha4) && reg257[(3'h4):(1'h0)])))))
        begin
          reg303 <= (reg273 >= $unsigned(reg258[(3'h5):(3'h5)]));
          reg304 <= $signed($unsigned($signed({(^~(8'hb2))})));
          if (wire297[(4'h8):(3'h4)])
            begin
              reg305 <= ((wire266 >>> $signed($signed($signed(reg255)))) >>> wire272[(3'h7):(3'h6)]);
              reg306 <= (|$unsigned(reg298));
            end
          else
            begin
              reg305 <= (~|(^~wire267));
              reg306 <= (~&($unsigned((7'h43)) >> $unsigned(($unsigned(reg286) ?
                  reg282[(2'h3):(2'h3)] : (reg254 > wire267)))));
              reg307 <= $signed($unsigned($signed($unsigned($signed(reg257)))));
            end
        end
      else
        begin
          reg303 <= $unsigned({($signed((reg295 ?
                  wire265 : reg300)) + (((8'hba) == reg291) != wire251[(3'h4):(1'h1)]))});
        end
      reg308 <= {((((wire271 ? (8'ha0) : wire262) <= $unsigned((8'had))) ?
              (wire246 ~^ wire272[(3'h5):(1'h0)]) : $unsigned((!wire266))) | $signed($signed($signed(reg287))))};
      if (reg294)
        begin
          reg309 <= ((~($unsigned(reg300) ?
              (reg302 + $signed(reg277)) : $signed($signed(reg300)))) ^~ reg255[(3'h7):(2'h2)]);
          reg310 <= wire270;
          if ($unsigned((~&(~^(~(reg292 ? reg291 : wire271))))))
            begin
              reg311 <= (wire272[(3'h7):(3'h4)] >>> ($signed(reg275[(1'h0):(1'h0)]) ^ ((^~wire264[(1'h0):(1'h0)]) ?
                  $signed(reg290) : ((reg288 > reg298) ?
                      {wire243, reg304} : (reg257 ? reg253 : reg299)))));
              reg312 <= reg310;
              reg313 <= wire269;
              reg314 <= ({(~&((|wire244) ? $signed(reg286) : (8'hb2))),
                  {(~&$signed(wire243)),
                      $signed((^reg254))}} <<< (+(($unsigned(wire245) == reg260) << $signed((wire268 > wire264)))));
            end
          else
            begin
              reg311 <= wire250;
              reg312 <= $unsigned($unsigned(reg284));
            end
          reg315 <= reg294;
        end
      else
        begin
          if (((^~reg299[(1'h1):(1'h1)]) + reg276[(2'h2):(2'h2)]))
            begin
              reg309 <= ((^~reg248[(4'he):(3'h6)]) ?
                  $unsigned((8'hb1)) : $signed($signed(($signed(wire271) ?
                      $signed(reg309) : $unsigned(wire268)))));
              reg310 <= ($unsigned($signed(reg295[(3'h4):(2'h2)])) ?
                  reg278 : reg312);
            end
          else
            begin
              reg309 <= reg252;
              reg310 <= ($unsigned(($signed(wire272[(4'ha):(1'h0)]) + ($unsigned(reg315) || (reg276 << reg259)))) ?
                  $signed((({wire243, reg295} ?
                          $unsigned(wire296) : $unsigned(reg285)) ?
                      $signed((!reg303)) : {$signed(reg307),
                          (~^reg273)})) : $signed(((|$signed(reg280)) | reg279)));
              reg311 <= reg248;
            end
          if ((~^{$signed(reg256[(3'h4):(2'h2)]),
              (!(+wire296[(4'hb):(2'h3)]))}))
            begin
              reg312 <= (reg313[(5'h12):(1'h0)] ?
                  reg298 : reg258[(2'h2):(2'h2)]);
              reg313 <= $unsigned((((|$unsigned(reg248)) ?
                      wire268[(2'h3):(1'h0)] : (!$unsigned(wire269))) ?
                  reg247[(2'h3):(1'h0)] : ($unsigned((wire296 >>> reg278)) ?
                      $signed((~wire301)) : (~^$signed(reg256)))));
              reg314 <= (~|{reg276[(1'h0):(1'h0)]});
              reg315 <= wire264[(1'h1):(1'h0)];
              reg316 <= $signed((($unsigned((8'had)) ^ reg253) ?
                  ((!(reg287 == reg292)) ^~ (8'ha4)) : {((reg309 == reg287) ?
                          (wire262 + wire264) : {reg258})}));
            end
          else
            begin
              reg312 <= wire251;
              reg313 <= $unsigned(reg286);
              reg314 <= reg249[(2'h3):(2'h2)];
              reg315 <= $unsigned(($signed((~&(reg305 ? wire265 : reg261))) ?
                  $signed($unsigned({reg291})) : (~|$signed($signed(reg295)))));
              reg316 <= ({($unsigned({reg298}) ?
                          {reg281, (reg258 - wire244)} : reg310),
                      {$signed($signed(wire268))}} ?
                  (8'h9c) : {(~&((reg286 == wire262) ?
                          $signed(reg292) : (reg279 ? wire263 : wire267)))});
            end
        end
      reg317 <= $unsigned(reg276[(1'h1):(1'h0)]);
    end
endmodule

module module154
#(parameter param227 = ((~^{((+(7'h40)) ? ((8'hb7) ? (8'hbd) : (7'h40)) : (8'hb6)), ((~(8'hba)) ? {(8'ha3), (8'hbb)} : (~&(8'hb7)))}) ? (((((8'hb8) * (8'ha0)) >>> ((7'h44) & (8'h9c))) ? (~&(|(8'hb1))) : ((~|(8'ha0)) != {(8'hbe), (8'hb1)})) <= (+(-{(8'hb0), (8'ha1)}))) : (({(&(8'hb0))} ? (((8'hae) == (8'ha6)) & ((8'hbd) && (8'hac))) : ({(8'h9d), (7'h43)} ? ((8'hbc) >= (8'ha4)) : {(8'hb7), (8'hb9)})) ? (({(8'ha6)} ? ((8'hba) * (8'had)) : ((8'h9d) ? (8'hb1) : (8'hb6))) > (((8'hb1) ? (8'hb0) : (8'h9c)) << ((8'ha1) >> (8'hac)))) : (~^((!(8'ha3)) ? ((8'hac) ? (8'h9d) : (8'ha5)) : {(7'h43)})))), 
parameter param228 = (-((((&param227) == param227) ? (~^{param227, param227}) : param227) ? {((param227 & param227) ? (param227 ? param227 : (8'hab)) : {param227, param227})} : (~^param227))))
(y, clk, wire158, wire157, wire156, wire155);
  output wire [(32'h2ea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire158;
  input wire [(3'h6):(1'h0)] wire157;
  input wire [(2'h2):(1'h0)] wire156;
  input wire [(4'hc):(1'h0)] wire155;
  wire signed [(4'he):(1'h0)] wire226;
  wire [(5'h10):(1'h0)] wire225;
  wire signed [(3'h5):(1'h0)] wire224;
  wire signed [(5'h15):(1'h0)] wire201;
  wire [(5'h11):(1'h0)] wire200;
  wire [(2'h2):(1'h0)] wire199;
  wire [(4'h8):(1'h0)] wire198;
  wire [(5'h10):(1'h0)] wire197;
  wire signed [(4'ha):(1'h0)] wire196;
  wire signed [(3'h7):(1'h0)] wire195;
  wire signed [(4'he):(1'h0)] wire194;
  wire signed [(4'ha):(1'h0)] wire170;
  wire signed [(3'h4):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire168;
  wire signed [(3'h4):(1'h0)] wire167;
  wire [(4'ha):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire161;
  wire [(2'h3):(1'h0)] wire160;
  wire signed [(2'h2):(1'h0)] wire159;
  reg [(4'hb):(1'h0)] reg223 = (1'h0);
  reg [(5'h12):(1'h0)] reg222 = (1'h0);
  reg [(3'h6):(1'h0)] reg221 = (1'h0);
  reg [(4'h8):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg219 = (1'h0);
  reg [(5'h13):(1'h0)] reg218 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg217 = (1'h0);
  reg [(2'h2):(1'h0)] reg216 = (1'h0);
  reg [(3'h6):(1'h0)] reg215 = (1'h0);
  reg [(4'he):(1'h0)] reg214 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg213 = (1'h0);
  reg [(4'h9):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg211 = (1'h0);
  reg [(5'h12):(1'h0)] reg210 = (1'h0);
  reg [(4'hb):(1'h0)] reg209 = (1'h0);
  reg [(3'h5):(1'h0)] reg208 = (1'h0);
  reg [(5'h15):(1'h0)] reg207 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg203 = (1'h0);
  reg [(3'h4):(1'h0)] reg202 = (1'h0);
  reg [(5'h12):(1'h0)] reg193 = (1'h0);
  reg [(4'hd):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg191 = (1'h0);
  reg [(5'h15):(1'h0)] reg190 = (1'h0);
  reg [(3'h4):(1'h0)] reg189 = (1'h0);
  reg [(3'h7):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg186 = (1'h0);
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg184 = (1'h0);
  reg [(2'h3):(1'h0)] reg183 = (1'h0);
  reg [(4'hf):(1'h0)] reg182 = (1'h0);
  reg [(4'hb):(1'h0)] reg181 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(4'hb):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg [(3'h4):(1'h0)] reg175 = (1'h0);
  reg [(5'h14):(1'h0)] reg174 = (1'h0);
  reg [(5'h14):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg [(4'hb):(1'h0)] reg165 = (1'h0);
  reg [(4'hc):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  assign y = {wire226,
                 wire225,
                 wire224,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 (1'h0)};
  assign wire159 = wire157[(3'h6):(1'h1)];
  assign wire160 = $signed(wire156[(2'h2):(1'h1)]);
  assign wire161 = $signed({((^~$unsigned(wire157)) ?
                           $unsigned((~&wire159)) : wire158[(1'h1):(1'h0)]),
                       {(^$signed(wire155)), {{wire160, wire157}}}});
  assign wire162 = $unsigned($unsigned($unsigned(wire157[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg163 <= wire160[(2'h3):(2'h2)];
      reg164 <= $signed($unsigned({wire161[(3'h4):(1'h1)]}));
      reg165 <= (~(((8'hbe) < (wire161[(2'h2):(1'h0)] ?
          wire161 : reg164[(4'h8):(3'h6)])) + ((~|((8'hae) ?
          reg164 : (8'hbd))) && $signed((wire161 ? wire162 : (8'hb2))))));
      reg166 <= $signed($unsigned($signed((~(wire155 << reg164)))));
    end
  assign wire167 = ($unsigned((^reg166[(4'hb):(4'h9)])) ?
                       (~^($signed($signed((8'hb8))) & (((8'hb1) ?
                               reg163 : (8'ha8)) ?
                           reg166[(4'hd):(2'h2)] : (wire155 ?
                               reg163 : wire156)))) : $signed((^~$unsigned((8'hab)))));
  assign wire168 = {wire162};
  assign wire169 = ((!$signed(wire158[(2'h2):(1'h1)])) > (wire159 ?
                       (((wire160 && wire155) | ((8'ha8) - (8'ha4))) ?
                           (^(wire155 * reg166)) : wire157[(1'h0):(1'h0)]) : {$signed((wire158 ?
                               reg166 : wire155)),
                           {(wire160 - wire158), (wire168 <<< (8'haf))}}));
  assign wire170 = {$signed(reg163[(4'he):(2'h3)])};
  always
    @(posedge clk) begin
      reg171 <= $unsigned((~^(($unsigned(wire161) ?
              (wire155 * reg165) : (wire169 ? wire170 : wire160)) ?
          $unsigned(wire168[(3'h4):(3'h4)]) : (-(wire169 ?
              wire167 : reg166)))));
      if (wire162)
        begin
          reg172 <= wire161[(1'h0):(1'h0)];
        end
      else
        begin
          reg172 <= (($signed($signed(wire167[(1'h0):(1'h0)])) | {(~reg171)}) ?
              wire170[(3'h5):(1'h1)] : wire170);
          if ($unsigned((^$unsigned(reg165[(2'h2):(1'h0)]))))
            begin
              reg173 <= $unsigned({{((!reg166) ?
                          (wire170 ? wire161 : (8'hb6)) : (reg172 <<< wire159)),
                      wire156[(2'h2):(2'h2)]},
                  wire170});
              reg174 <= (((~^$signed((wire162 || reg166))) <= (({reg163,
                      reg163} || (wire169 ? reg171 : wire162)) ?
                  (-(wire168 ?
                      wire162 : wire156)) : reg163)) < $unsigned({$unsigned({wire155})}));
            end
          else
            begin
              reg173 <= ((wire162[(2'h2):(1'h0)] ?
                      reg172 : (|({(8'hb7)} ? (~wire170) : wire168))) ?
                  (8'hbf) : reg172);
              reg174 <= wire157[(3'h5):(2'h3)];
              reg175 <= {(-(|wire167[(1'h1):(1'h0)]))};
              reg176 <= $signed($signed(({wire161,
                  (reg171 ? wire160 : wire170)} > (8'h9e))));
            end
          reg177 <= ($unsigned($unsigned((~|reg175))) >= ((7'h42) >> wire170));
          reg178 <= ((((^~$unsigned(wire158)) | (((8'hb6) ?
                      wire157 : wire156) <= reg176)) ?
                  {$signed((reg171 ~^ wire170))} : (reg164[(4'h8):(3'h7)] ?
                      $signed((-reg173)) : ((wire161 ? reg174 : reg173) ?
                          ((8'hb1) & (8'ha1)) : (8'hb5)))) ?
              $unsigned($unsigned((+$signed(wire168)))) : ((wire167[(2'h2):(1'h1)] | reg174[(4'h8):(3'h4)]) + ((~&(reg176 - wire156)) ?
                  (~^(wire160 ? reg177 : wire155)) : ((wire157 ?
                          wire161 : (8'h9e)) ?
                      (reg166 != reg176) : wire167))));
          if ($unsigned(wire160[(1'h0):(1'h0)]))
            begin
              reg179 <= (^wire160[(2'h3):(2'h3)]);
              reg180 <= $unsigned($signed(($signed(reg178) ?
                  (+wire161) : (reg177[(1'h1):(1'h1)] == ((8'hae) ?
                      reg173 : (8'hab))))));
              reg181 <= $signed((((reg173[(5'h11):(4'hd)] * wire161) ?
                      (!(reg171 ? reg164 : (8'ha7))) : ($unsigned(reg178) ?
                          $unsigned(reg178) : (8'h9f))) ?
                  reg173 : $unsigned(reg176)));
              reg182 <= reg166[(4'hc):(2'h3)];
              reg183 <= $unsigned((($signed($unsigned(wire168)) ?
                      {wire161[(1'h0):(1'h0)],
                          {(7'h40)}} : (reg180[(1'h0):(1'h0)] ~^ (wire168 ?
                          wire168 : (8'hb6)))) ?
                  $unsigned($signed((wire156 != reg173))) : {reg174[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg179 <= ($signed($unsigned(wire169)) ~^ wire159);
              reg180 <= $signed($unsigned(wire170[(4'h9):(1'h1)]));
              reg181 <= {(reg183 ?
                      {(&(8'h9e)),
                          $unsigned({reg165})} : reg165[(4'h9):(3'h7)]),
                  (({reg171[(1'h1):(1'h1)],
                      (reg166 ? reg176 : wire161)} ~^ ($signed(reg179) ?
                      wire169 : (wire159 ?
                          reg173 : reg176))) ~^ (wire156[(1'h1):(1'h0)] - (reg165 ?
                      (~reg172) : {(8'hab)})))};
              reg182 <= ((reg165[(2'h2):(1'h1)] ?
                      reg174[(4'he):(4'h9)] : reg177[(3'h4):(1'h0)]) ?
                  $signed($signed(((reg171 ?
                      reg166 : (8'hbc)) & (-(8'hbb))))) : $signed($unsigned($signed({(8'hb7)}))));
              reg183 <= reg173[(4'ha):(4'h9)];
            end
        end
      if ({$signed($signed((reg183 ?
              (reg181 + reg173) : reg171[(1'h1):(1'h0)]))),
          $signed((+$signed($unsigned(reg173))))})
        begin
          reg184 <= ($unsigned(wire158[(3'h6):(3'h4)]) ?
              {reg181[(3'h6):(3'h4)]} : reg181);
          reg185 <= (^reg175);
          reg186 <= (wire158[(2'h2):(2'h2)] ^~ (reg165 ?
              $signed(($unsigned(wire157) ?
                  $unsigned(reg172) : reg182)) : (~|$unsigned($unsigned(reg175)))));
          if ($unsigned((+(~&{reg182}))))
            begin
              reg187 <= (($signed($signed($signed(wire159))) - {(^(reg172 ?
                          wire169 : wire168)),
                      $unsigned($unsigned(wire159))}) ?
                  (|wire161[(3'h4):(2'h2)]) : wire157[(3'h4):(1'h0)]);
              reg188 <= $signed($signed(reg164[(4'hc):(4'hc)]));
            end
          else
            begin
              reg187 <= wire155[(4'h8):(3'h4)];
              reg188 <= {$unsigned(wire157),
                  (~|$signed(((wire155 | reg182) > {reg172})))};
              reg189 <= $signed({(reg180[(2'h2):(1'h0)] ?
                      reg179 : ($unsigned(reg183) ? (8'hbe) : reg166)),
                  reg174});
              reg190 <= ((~&$unsigned(($signed((8'hba)) ^~ wire161))) ?
                  ((8'haa) ?
                      $signed(((reg177 ? reg182 : reg186) ?
                          (!reg176) : $signed((8'hb6)))) : {(~|wire157),
                          reg172[(3'h4):(1'h1)]}) : $signed((wire168[(2'h3):(1'h1)] ^ reg173[(5'h13):(4'hd)])));
              reg191 <= wire157[(3'h5):(1'h1)];
            end
        end
      else
        begin
          reg184 <= $unsigned((reg176[(2'h3):(2'h3)] * (~wire155[(3'h7):(3'h6)])));
        end
      reg192 <= $signed(reg173);
      reg193 <= (^~reg178[(3'h7):(1'h0)]);
    end
  assign wire194 = $unsigned(reg176);
  assign wire195 = (~reg189[(3'h4):(2'h3)]);
  assign wire196 = (8'hb8);
  assign wire197 = $signed(($unsigned($unsigned((8'hb2))) <<< (^~$unsigned($signed((8'hb4))))));
  assign wire198 = ((-(($unsigned(reg191) ?
                           (reg174 == wire169) : wire157[(3'h6):(3'h5)]) || (!(reg171 ?
                           reg165 : (8'haa))))) ?
                       $unsigned((^~wire195[(3'h4):(3'h4)])) : wire194[(4'h9):(4'h9)]);
  assign wire199 = $signed((|$unsigned($unsigned($unsigned(wire160)))));
  assign wire200 = reg181[(2'h2):(1'h0)];
  assign wire201 = $signed(((reg190[(2'h2):(1'h0)] ?
                       reg192[(3'h5):(2'h2)] : ($signed(wire195) ?
                           $signed(wire156) : (wire194 - reg193))) <<< reg175));
  always
    @(posedge clk) begin
      if ((reg172 ?
          $unsigned(($signed(reg165) ?
              {(~^reg182),
                  (wire156 >> wire155)} : $signed((~|reg177)))) : reg166[(4'ha):(2'h3)]))
        begin
          reg202 <= (wire162 && (8'ha4));
          if (({(($signed(reg185) | (|wire195)) ?
                  {(!reg183)} : $signed((&wire169)))} != ($unsigned({{reg163,
                      reg180}}) ?
              reg177[(1'h0):(1'h0)] : (~^(+(reg176 && wire159))))))
            begin
              reg203 <= {(wire159 && (((~|reg187) ?
                          (reg193 & (8'hb4)) : (reg192 ? wire167 : wire196)) ?
                      {reg192} : ($unsigned(reg183) ?
                          (reg173 ? wire196 : reg163) : reg191)))};
              reg204 <= (|$signed($signed($signed((reg182 ?
                  reg177 : reg181)))));
              reg205 <= wire197[(4'hf):(3'h7)];
            end
          else
            begin
              reg203 <= $unsigned(reg192);
              reg204 <= {reg171[(1'h0):(1'h0)]};
            end
          reg206 <= $signed(wire169[(1'h0):(1'h0)]);
        end
      else
        begin
          reg202 <= (reg203[(5'h11):(4'hf)] ?
              reg177[(1'h0):(1'h0)] : {$unsigned(((reg189 != reg205) <= ((8'hb7) ?
                      wire169 : reg182)))});
        end
      if ($signed(wire170))
        begin
          if (reg202)
            begin
              reg207 <= (^~wire201);
              reg208 <= (({$unsigned(reg176), (!reg176[(1'h1):(1'h0)])} ?
                      $signed(({reg192, wire168} ?
                          $unsigned(reg178) : ((8'ha0) ?
                              reg186 : reg172))) : (~&reg181[(3'h7):(2'h2)])) ?
                  (wire194 * $signed({wire194[(4'ha):(3'h4)]})) : (({$unsigned(reg179),
                              $signed(reg206)} ?
                          reg183 : {(~|reg181)}) ?
                      (($unsigned(reg191) << reg175) ?
                          $signed(reg173[(4'h9):(3'h5)]) : $signed((-wire157))) : $unsigned($unsigned(reg164))));
              reg209 <= $unsigned((~^reg190));
              reg210 <= ((((+$signed((8'h9c))) ?
                  ((wire157 >>> reg190) ?
                      (~|reg177) : (reg175 ?
                          reg184 : wire194)) : ((~&(8'hbb)) ~^ ((8'had) ^ reg185))) | (reg188 ?
                  (8'hbb) : (-reg180[(1'h1):(1'h1)]))) | (reg193 & (wire199 ^ reg205[(5'h15):(4'hb)])));
              reg211 <= wire156;
            end
          else
            begin
              reg207 <= ((((wire168 < reg182[(4'he):(4'hb)]) ~^ ((reg181 ?
                  reg211 : wire194) << (-reg187))) || reg193[(2'h2):(1'h0)]) >> (~|$signed((8'ha8))));
              reg208 <= $signed({($signed((8'hb7)) * wire201)});
              reg209 <= (8'hab);
            end
          reg212 <= reg209;
          if ($signed(((($signed(reg192) ~^ {reg179}) ?
              (7'h42) : reg185[(4'hf):(4'h9)]) || $unsigned(wire162))))
            begin
              reg213 <= ($signed($unsigned(((wire161 ^ reg185) && (reg189 ?
                  reg174 : wire201)))) >>> (($unsigned((reg165 ?
                          wire158 : reg165)) ?
                      reg172[(3'h4):(2'h3)] : $unsigned(((7'h42) <<< (8'hb5)))) ?
                  (&$signed(reg205[(5'h11):(5'h11)])) : $signed(($unsigned((8'ha7)) ?
                      $unsigned(reg182) : (~|wire195)))));
              reg214 <= (~&$unsigned($unsigned((~|$unsigned((8'ha7))))));
              reg215 <= (^~$signed($signed((((8'hab) ? reg171 : (7'h41)) ?
                  $signed(reg212) : (-(8'h9d))))));
              reg216 <= $unsigned(wire201[(4'hc):(4'hb)]);
              reg217 <= ($unsigned(reg211[(1'h0):(1'h0)]) < reg185);
            end
          else
            begin
              reg213 <= reg208;
              reg214 <= (~|reg185);
              reg215 <= ((&reg205) - ($signed($unsigned(reg171[(1'h0):(1'h0)])) ^ ((reg192 ?
                      (reg216 ? reg216 : wire168) : wire197) ?
                  $signed(reg183[(2'h2):(1'h1)]) : $unsigned($unsigned(reg205)))));
            end
          if ($unsigned(reg216))
            begin
              reg218 <= {reg182[(4'ha):(3'h4)], (8'h9f)};
              reg219 <= (&({(|(reg208 ? wire198 : wire156)),
                  $unsigned((~^wire168))} != {reg191[(3'h7):(2'h2)],
                  ({(8'hbc), (8'ha3)} ? $signed(wire169) : (8'h9e))}));
            end
          else
            begin
              reg218 <= reg203[(4'h8):(1'h1)];
              reg219 <= (reg191[(5'h15):(3'h5)] ?
                  wire155[(4'hc):(2'h2)] : $signed(reg173));
              reg220 <= $unsigned(wire194[(4'he):(4'hd)]);
              reg221 <= (&$signed(reg192[(4'hb):(1'h1)]));
            end
          reg222 <= (^~$signed((&((^reg190) + $signed(wire159)))));
        end
      else
        begin
          if ($unsigned((~($unsigned($signed(reg219)) ^ $unsigned(((8'hb0) ?
              wire196 : (8'hbf)))))))
            begin
              reg207 <= $unsigned(wire201);
              reg208 <= ((($signed($unsigned(reg184)) + ((~&reg177) ?
                          wire198 : wire201[(2'h3):(2'h2)])) ?
                      (8'hbf) : reg172[(1'h0):(1'h0)]) ?
                  $signed($signed(((reg173 ^ reg204) ?
                      reg176 : $signed(wire197)))) : $signed((^~(~$unsigned(reg175)))));
              reg209 <= $signed(reg174[(3'h6):(1'h1)]);
            end
          else
            begin
              reg207 <= $signed(($unsigned($unsigned($unsigned(reg205))) * $unsigned(reg165)));
              reg208 <= $unsigned(({reg182} >= reg181[(3'h6):(3'h6)]));
              reg209 <= reg177[(1'h0):(1'h0)];
              reg210 <= (reg177[(1'h1):(1'h0)] & ($signed(($unsigned(reg164) ?
                  $signed(reg213) : (wire194 ?
                      reg204 : reg215))) >> (($unsigned(wire158) ?
                  reg178[(3'h4):(2'h2)] : $unsigned(reg185)) * ($unsigned(wire167) ?
                  reg209 : (&reg177)))));
            end
        end
      reg223 <= ({{reg204, (reg186[(2'h3):(2'h3)] >= (reg166 << reg218))}} ?
          (~&$unsigned({(reg174 ?
                  (8'ha2) : (7'h44))})) : ($signed(wire200) || (|$unsigned(wire167))));
    end
  assign wire224 = $unsigned(((+reg212) ?
                       $unsigned({$unsigned(reg209)}) : $unsigned(((-reg192) ?
                           $unsigned(reg187) : $unsigned(wire168)))));
  assign wire225 = (reg172 ?
                       reg177 : ((^$signed($signed(reg212))) == $signed({{(8'had),
                               reg204}})));
  assign wire226 = reg180;
endmodule
