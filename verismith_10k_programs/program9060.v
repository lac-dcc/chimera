module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire134;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire132;
  assign y = {wire134, wire5, wire6, wire7, wire132, (1'h0)};
  assign wire5 = $signed(wire4);
  assign wire6 = (8'hb0);
  assign wire7 = wire0;
  module8 #() modinst133 (.wire11(wire2), .wire13(wire1), .wire12(wire6), .wire9(wire0), .wire10(wire4), .y(wire132), .clk(clk));
  assign wire134 = (~|(wire3[(4'h9):(3'h4)] ?
                       ($unsigned((wire0 ?
                           wire5 : wire7)) * $unsigned($signed(wire3))) : (~|($signed((8'hbf)) * $signed(wire4)))));
endmodule

module module8
#(parameter param130 = (~|(((^~((8'hbf) ? (8'hb0) : (7'h43))) ? {((8'haf) ? (8'hab) : (8'hb8))} : (((8'hb5) <<< (8'haa)) ? (!(8'hac)) : ((8'h9c) <= (8'hae)))) <<< ((((8'ha4) ? (8'hb7) : (8'ha0)) ? {(8'hbe), (8'hae)} : ((8'hb5) ? (8'h9e) : (7'h41))) ? (((8'h9e) ^ (8'had)) ? ((7'h43) - (8'hbd)) : (~|(8'haf))) : (((8'h9c) > (8'hb3)) << ((8'hae) ? (8'hbd) : (8'had)))))), 
parameter param131 = (~{({(param130 ~^ param130), {param130, (8'hac)}} * {(param130 ? (8'ha3) : param130)}), (((~&(8'ha0)) ? ((7'h41) ? param130 : param130) : (param130 >= param130)) | ((param130 ? param130 : (8'hb6)) >> (-(8'ha1))))}))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire [(3'h4):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire118;
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  assign y = {wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire82,
                 wire84,
                 wire118,
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
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= (|((wire10[(2'h3):(2'h2)] || wire10[(3'h4):(1'h0)]) ?
          (!{wire9[(4'hc):(3'h4)],
              wire11}) : $signed($signed($signed((7'h42))))));
    end
  assign wire15 = ((wire13[(3'h5):(1'h1)] & ({(wire11 ?
                          wire9 : reg14)} - $signed($signed(wire13)))) && (~wire13));
  assign wire16 = wire13;
  assign wire17 = wire12;
  assign wire18 = (&wire11[(4'hd):(3'h5)]);
  module19 #() modinst83 (.wire21(wire16), .wire23(wire13), .wire22(reg14), .y(wire82), .clk(clk), .wire20(wire10), .wire24(wire15));
  assign wire84 = ($unsigned(wire18) > wire9[(4'h9):(3'h5)]);
  module85 #() modinst119 (wire118, clk, wire17, wire13, wire16, wire15, wire9);
  always
    @(posedge clk) begin
      if (wire10[(2'h2):(2'h2)])
        begin
          if (($unsigned(wire118) >= ($unsigned({wire13[(4'h9):(4'h8)]}) ?
              (($signed(wire84) ?
                  wire84 : wire11) * (~wire82)) : wire10[(4'h9):(1'h0)])))
            begin
              reg120 <= wire12[(1'h0):(1'h0)];
              reg121 <= (&(($unsigned((-(8'h9c))) ^ (|$signed(wire9))) ?
                  $signed(((wire9 ?
                      wire82 : wire82) >= reg120[(2'h3):(1'h0)])) : wire13));
              reg122 <= $signed(wire17[(3'h5):(2'h3)]);
              reg123 <= wire9;
              reg124 <= {wire82};
            end
          else
            begin
              reg120 <= wire9[(5'h14):(4'hd)];
              reg121 <= (wire82 ?
                  reg122 : $unsigned((wire16[(2'h2):(1'h1)] ?
                      {(wire18 != wire118)} : reg120)));
              reg122 <= ((~^{(wire16[(4'hb):(4'ha)] >>> (8'hb2))}) ?
                  $unsigned((+(wire118 ?
                      reg121[(2'h3):(1'h1)] : (wire16 >= wire11)))) : $unsigned((^~$signed($signed(wire118)))));
            end
          reg125 <= (wire84[(1'h1):(1'h1)] * wire11[(4'ha):(3'h7)]);
          reg126 <= (reg125[(3'h6):(1'h1)] == wire15);
          reg127 <= $signed((reg121 - ((~|$unsigned(reg126)) ?
              ($signed(wire11) ?
                  (reg120 ?
                      (8'ha3) : (8'hac)) : $signed(wire84)) : (|(8'hb9)))));
          if (wire18[(1'h1):(1'h0)])
            begin
              reg128 <= reg122;
              reg129 <= ($signed(reg14) ? wire10[(4'hb):(2'h3)] : reg125);
            end
          else
            begin
              reg128 <= $signed(reg124[(2'h2):(1'h0)]);
              reg129 <= reg123;
            end
        end
      else
        begin
          reg120 <= $unsigned(reg128[(1'h0):(1'h0)]);
          reg121 <= (($unsigned(($signed((8'hb7)) ^ $unsigned(reg129))) == ($signed({wire82}) - ((reg126 < wire118) ?
                  (wire82 ? reg14 : (8'hbb)) : (reg124 ? reg14 : (8'ha6))))) ?
              ($signed(((|(8'hac)) - $signed(wire118))) << (~^$unsigned((&reg122)))) : reg14);
          reg122 <= $unsigned((^reg128[(4'h9):(3'h7)]));
          reg123 <= reg127[(4'hf):(4'ha)];
          if ((~^(8'hb1)))
            begin
              reg124 <= (reg120[(3'h6):(2'h3)] || ((((wire118 ~^ wire13) ?
                          ((8'ha1) ? reg120 : (7'h44)) : $unsigned(reg123)) ?
                      reg121 : (wire15[(4'h8):(3'h6)] >= {wire9, reg125})) ?
                  (($unsigned(reg123) && wire11[(3'h7):(3'h6)]) ?
                      {((8'h9e) ? wire17 : reg14)} : ($unsigned(reg120) ?
                          $unsigned(wire17) : reg124)) : (+((7'h42) || $unsigned(wire84)))));
              reg125 <= (^~$signed($unsigned((7'h40))));
              reg126 <= $signed(reg124);
              reg127 <= $unsigned({{wire11, $signed($unsigned(wire12))},
                  ((wire12[(1'h1):(1'h0)] | reg120) ?
                      wire18[(1'h0):(1'h0)] : (-{wire18, wire118}))});
              reg128 <= reg124[(4'hf):(3'h7)];
            end
          else
            begin
              reg124 <= (^~reg127[(1'h0):(1'h0)]);
              reg125 <= reg127;
              reg126 <= (wire17 == $signed(wire15[(3'h6):(2'h3)]));
            end
        end
    end
endmodule

module module85
#(parameter param116 = {({({(8'hb1), (8'hb7)} | (~|(8'hb2)))} - ((&((8'ha5) ? (8'ha6) : (7'h41))) ? (~|((8'ha2) <= (7'h43))) : ((+(8'h9d)) ? ((8'hba) ? (8'ha5) : (7'h42)) : ((8'ha7) ? (8'ha7) : (8'haa)))))}, 
parameter param117 = (param116 & param116))
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire90;
  input wire [(4'hf):(1'h0)] wire89;
  input wire signed [(4'hd):(1'h0)] wire88;
  input wire [(3'h7):(1'h0)] wire87;
  input wire signed [(4'hb):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire91;
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
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
                 reg97,
                 (1'h0)};
  assign wire91 = (wire88[(4'hc):(4'h8)] ?
                      wire88[(3'h7):(3'h7)] : wire90[(3'h5):(1'h0)]);
  assign wire92 = ({wire88[(4'h9):(3'h6)],
                      (($signed((8'hba)) >>> (8'hb4)) > $signed(wire90[(4'hd):(4'ha)]))} - wire90[(4'ha):(3'h6)]);
  assign wire93 = $unsigned(wire90);
  assign wire94 = $signed(wire89[(4'he):(2'h3)]);
  assign wire95 = ($unsigned(((~(wire92 ~^ wire87)) ?
                      ((!(8'ha6)) ?
                          (wire91 ^ wire88) : $unsigned(wire93)) : $signed({wire88}))) >>> $signed($unsigned(wire90[(3'h5):(1'h1)])));
  assign wire96 = (8'hbc);
  always
    @(posedge clk) begin
      reg97 <= {((wire88[(3'h7):(3'h4)] ?
                  $signed({wire95}) : wire95[(4'hd):(4'hc)]) ?
              wire89 : $unsigned(($signed(wire87) << $unsigned(wire96))))};
      reg98 <= wire90[(4'h9):(3'h4)];
      if (wire94[(4'hc):(4'h9)])
        begin
          if ((~|(8'h9f)))
            begin
              reg99 <= wire96;
              reg100 <= wire93;
              reg101 <= (&(wire96[(2'h3):(1'h1)] ?
                  (8'hbc) : $unsigned({(^~reg98)})));
            end
          else
            begin
              reg99 <= (wire90 == $unsigned(wire88));
            end
          reg102 <= wire93[(3'h4):(2'h2)];
          reg103 <= wire91[(1'h1):(1'h0)];
          reg104 <= (8'hac);
          reg105 <= reg103[(4'hf):(3'h6)];
        end
      else
        begin
          reg99 <= $unsigned(reg104[(4'hb):(2'h3)]);
          reg100 <= (wire89 >> {$signed((^(reg105 ? wire92 : (8'ha7)))),
              {$unsigned(reg101), (8'hb8)}});
        end
      reg106 <= (~|reg99[(3'h6):(2'h3)]);
      reg107 <= (reg105 ?
          $unsigned(wire93[(3'h4):(1'h0)]) : $unsigned({wire89,
              $unsigned(wire90)}));
    end
  always
    @(posedge clk) begin
      reg108 <= ($signed(wire88) >= {$signed(wire87)});
    end
  assign wire109 = $unsigned((~|wire96));
  assign wire110 = reg104;
  assign wire111 = reg100[(3'h4):(1'h0)];
  assign wire112 = $signed((~^(~&($signed(wire92) ?
                       (reg107 < wire93) : (8'hb4)))));
  assign wire113 = $unsigned({(($signed(reg97) >> (&reg97)) ?
                           $signed(reg100) : {(wire112 ? (8'hbf) : reg98),
                               ((8'hbb) ? (8'h9c) : wire110)})});
  assign wire114 = ((^wire91) ?
                       (!{$signed(reg104[(5'h11):(4'hd)])}) : ((!$unsigned(wire95[(4'h9):(1'h0)])) ?
                           $signed((&wire93)) : $unsigned(reg104[(3'h4):(1'h0)])));
  assign wire115 = wire94[(2'h3):(1'h0)];
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h2b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(4'ha):(1'h0)] wire21;
  input wire [(4'hd):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire25;
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  assign y = {wire80,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire25,
                 reg81,
                 reg79,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
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
                 reg57,
                 reg56,
                 reg55,
                 reg50,
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
                 reg26,
                 (1'h0)};
  assign wire25 = ($unsigned(wire24[(3'h7):(1'h0)]) >>> {(!(8'hbb))});
  always
    @(posedge clk) begin
      reg26 <= wire20;
      reg27 <= wire23[(4'ha):(4'h9)];
      reg28 <= (~^reg26[(4'h9):(4'h8)]);
      reg29 <= (($unsigned(wire20) + reg27[(2'h2):(1'h0)]) ?
          (8'ha7) : wire24[(3'h4):(1'h1)]);
      if ((-$unsigned(reg29[(5'h12):(2'h2)])))
        begin
          reg30 <= $unsigned(wire23);
          reg31 <= {$unsigned(reg30[(3'h6):(1'h1)]),
              {(+((wire25 ? wire24 : reg29) ?
                      (wire21 ? reg29 : (8'ha8)) : (reg30 ? wire22 : wire22))),
                  reg28[(3'h4):(2'h3)]}};
          reg32 <= $unsigned(($signed(reg28[(3'h4):(1'h1)]) >> wire20[(2'h3):(1'h1)]));
        end
      else
        begin
          reg30 <= (($unsigned(wire22[(4'hf):(3'h5)]) ?
                  reg28[(2'h2):(2'h2)] : {((reg29 ?
                          wire20 : (8'hb6)) < {wire23})}) ?
              wire21[(2'h3):(2'h2)] : (!{$unsigned(wire22),
                  ((reg28 == wire24) ? (!reg29) : $unsigned(reg28))}));
          if ({{reg26[(4'hd):(3'h7)]}})
            begin
              reg31 <= (($unsigned(reg29) & $unsigned((7'h44))) ?
                  (($signed(reg31) ? reg30 : {(8'ha3)}) ?
                      $unsigned(($signed((8'haa)) ?
                          (|wire24) : $unsigned(reg27))) : (wire21 ?
                          ({reg30} ?
                              $signed(reg30) : (reg29 ?
                                  reg27 : reg30)) : $signed(wire25))) : wire23);
              reg32 <= (reg32[(5'h10):(1'h1)] ?
                  {reg28[(1'h0):(1'h0)],
                      reg29[(5'h10):(2'h3)]} : {{$signed($unsigned(wire22)),
                          (+wire20[(3'h4):(1'h1)])},
                      (~&(!$signed(wire25)))});
              reg33 <= (wire21[(3'h4):(1'h1)] << (&((wire21[(3'h5):(2'h3)] ?
                      wire24[(3'h5):(3'h4)] : (+reg29)) ?
                  $unsigned((~(8'ha4))) : wire24[(4'he):(4'ha)])));
              reg34 <= wire25;
              reg35 <= $unsigned($signed(reg30[(3'h4):(2'h3)]));
            end
          else
            begin
              reg31 <= $signed(((~$unsigned((wire24 * reg30))) == (8'ha8)));
              reg32 <= wire20;
              reg33 <= $unsigned({wire23});
              reg34 <= $unsigned((8'ha2));
            end
          if ({(((wire21 == ((8'ha6) ?
                  (8'hb1) : (8'hb4))) >> reg28) ^ wire25[(1'h0):(1'h0)])})
            begin
              reg36 <= $signed($unsigned($unsigned(((~|wire20) <<< wire20[(3'h6):(1'h0)]))));
              reg37 <= (8'ha3);
              reg38 <= reg33[(3'h7):(3'h4)];
            end
          else
            begin
              reg36 <= (reg37[(3'h4):(2'h2)] ? (7'h43) : (8'h9d));
              reg37 <= (reg35 | reg26);
              reg38 <= reg30;
            end
          reg39 <= reg37;
        end
    end
  always
    @(posedge clk) begin
      reg40 <= (wire20 ? $unsigned((+reg27)) : wire20[(4'h8):(3'h4)]);
      reg41 <= $signed((($signed($signed((8'hbb))) ?
              (wire23[(4'he):(4'hb)] ?
                  reg29[(4'hb):(4'ha)] : reg26[(3'h7):(3'h4)]) : ((reg31 >> reg33) ?
                  reg27[(4'h8):(1'h1)] : $signed(reg26))) ?
          wire20 : {$unsigned($unsigned(reg29))}));
      reg42 <= {wire24[(1'h0):(1'h0)], wire20};
      if ($unsigned({$signed(wire22), reg36[(1'h0):(1'h0)]}))
        begin
          reg43 <= (+wire23[(5'h13):(2'h3)]);
          reg44 <= (~&$unsigned({{$signed((8'hb8))},
              ((wire21 ? reg31 : (8'h9f)) ^ wire23[(4'hf):(1'h0)])}));
          reg45 <= $unsigned((8'hab));
        end
      else
        begin
          reg43 <= (8'hb7);
          reg44 <= ((reg45 ?
              wire25[(2'h3):(1'h0)] : (({reg34, wire24} >>> $unsigned(reg39)) ?
                  reg38[(2'h2):(2'h2)] : (~&$unsigned(reg31)))) ^ $signed(reg44[(4'ha):(4'ha)]));
        end
    end
  assign wire46 = reg26;
  assign wire47 = $unsigned(((($signed(reg39) && (reg39 && wire46)) ?
                          $unsigned((8'ha1)) : $unsigned((reg45 & wire46))) ?
                      (($unsigned(reg33) ?
                          (!reg37) : (wire21 ^ reg45)) > {(reg36 ?
                              reg42 : reg45)}) : $signed(((wire23 | (7'h42)) < $signed(reg29)))));
  assign wire48 = ((($signed((reg28 * (8'h9c))) ?
                              (-(8'hae)) : wire46[(2'h2):(1'h0)]) ?
                          (((reg30 ? reg29 : reg31) ?
                              $signed(reg30) : {(8'hac)}) ^ wire21[(4'h9):(3'h7)]) : $unsigned((wire25 & (|reg37)))) ?
                      reg34 : ({{(reg33 <<< reg27),
                              (reg33 > (8'hac))}} == ($signed((reg40 <= reg35)) ?
                          (reg44 * reg38[(2'h2):(2'h2)]) : reg41)));
  assign wire49 = (|{$signed({reg27[(1'h1):(1'h0)], $signed(reg28)})});
  always
    @(posedge clk) begin
      reg50 <= $unsigned({wire48[(1'h1):(1'h0)], wire25});
    end
  assign wire51 = $signed($signed(reg41));
  assign wire52 = ($unsigned(reg45[(2'h3):(2'h2)]) ?
                      $unsigned(($signed(wire47[(3'h5):(3'h4)]) & ($signed(reg30) ^ (wire23 ?
                          reg42 : reg44)))) : (reg29 ?
                          (8'h9d) : (((reg42 ? reg36 : reg29) ?
                                  ((8'hb4) & reg44) : reg45[(2'h2):(1'h1)]) ?
                              $unsigned(reg35) : reg50)));
  assign wire53 = $unsigned((|(8'hb2)));
  assign wire54 = ((wire47 ?
                      ($unsigned({reg32}) ?
                          ({reg38, reg32} ?
                              $signed((8'ha7)) : (+(8'ha9))) : wire20[(3'h6):(2'h3)]) : reg37) ^~ (~&(|((reg37 ^~ wire47) ?
                      reg28[(3'h5):(3'h4)] : $unsigned((8'hb9))))));
  always
    @(posedge clk) begin
      reg55 <= (((|((reg37 >= (8'haa)) ?
              {reg41} : wire24[(4'he):(4'hd)])) == (wire20 ^ (~$unsigned(wire22)))) ?
          (~^wire49[(1'h0):(1'h0)]) : (reg26[(5'h12):(3'h4)] ?
              $signed(wire24[(3'h4):(1'h0)]) : reg41[(4'ha):(1'h0)]));
      if ($signed((~|(~|($signed(wire53) <<< wire53)))))
        begin
          if (wire22)
            begin
              reg56 <= ($unsigned(({reg43,
                  reg36[(2'h2):(2'h2)]} >> (^(+(8'ha4))))) >>> wire25[(3'h5):(3'h5)]);
              reg57 <= (^(((|reg45[(1'h0):(1'h0)]) ?
                      $signed((wire21 <<< reg55)) : $unsigned($signed(wire51))) ?
                  $signed(wire21[(3'h6):(3'h4)]) : $signed(wire22)));
            end
          else
            begin
              reg56 <= wire46;
            end
          if (wire21)
            begin
              reg58 <= $signed((reg56 ?
                  $signed((~|(&reg34))) : wire46[(3'h7):(1'h0)]));
              reg59 <= reg50[(3'h5):(1'h0)];
              reg60 <= $unsigned(((^~$signed((reg26 >>> wire24))) <= (!reg42[(4'he):(3'h4)])));
              reg61 <= (8'had);
            end
          else
            begin
              reg58 <= {(($signed(reg40) << reg59) ?
                      $signed(((-wire20) > $unsigned(wire51))) : $signed(({(8'hbb)} - $unsigned(reg29)))),
                  reg40};
            end
          if (wire24)
            begin
              reg62 <= wire49[(3'h4):(1'h0)];
              reg63 <= $unsigned(wire21);
              reg64 <= $unsigned((7'h42));
            end
          else
            begin
              reg62 <= $unsigned(reg37);
              reg63 <= (($signed($signed((~|(8'haa)))) ?
                      {((reg55 ? wire53 : reg61) ^~ reg32[(5'h10):(1'h0)]),
                          reg34[(1'h0):(1'h0)]} : ({(-reg34)} << {((8'hbb) ?
                              wire20 : (7'h44))})) ?
                  ((&$unsigned(reg34)) ?
                      ({$unsigned(reg40),
                          {wire20}} >= (&(^~reg36))) : wire48[(3'h5):(1'h0)]) : (reg43[(4'he):(4'hb)] ?
                      wire51 : (8'hb9)));
              reg64 <= (-$unsigned((+(reg26 | wire20[(1'h1):(1'h1)]))));
              reg65 <= $signed($signed(reg37[(3'h4):(1'h0)]));
              reg66 <= $unsigned(reg42);
            end
          reg67 <= {(($signed($signed(reg26)) > {$signed((8'hbb))}) ?
                  wire23 : $unsigned($signed(wire53)))};
        end
      else
        begin
          reg56 <= wire46[(4'hc):(1'h0)];
        end
      if ((reg67[(3'h4):(2'h3)] <= ($signed(((reg67 ? (8'hb4) : reg27) ?
          (wire23 ?
              wire25 : wire21) : reg55[(4'ha):(2'h3)])) ^ ($signed((+(8'hb0))) ^~ ((wire52 ?
              reg41 : reg58) ?
          (8'hb9) : ((7'h44) ? wire23 : wire47))))))
        begin
          if ({$signed(reg62)})
            begin
              reg68 <= (|(($unsigned(wire20) ? reg32 : reg42) ?
                  (8'hba) : $signed(reg61[(4'h8):(2'h3)])));
              reg69 <= ((($signed(wire21) ?
                          ((wire24 ? reg40 : wire51) ?
                              $unsigned(reg29) : (wire48 <= reg63)) : $signed((wire20 ?
                              reg66 : wire25))) ?
                      ((reg45[(3'h4):(2'h2)] ?
                          $signed(reg63) : (-(8'ha2))) <<< {$signed(wire25)}) : {(8'hb9)}) ?
                  reg68 : reg50);
              reg70 <= reg63[(3'h6):(2'h2)];
            end
          else
            begin
              reg68 <= ($unsigned(reg32[(1'h0):(1'h0)]) ?
                  {((reg41[(2'h2):(2'h2)] ?
                          {reg56, reg36} : wire53[(3'h4):(2'h3)]) * reg34),
                      (+(+$unsigned(reg59)))} : (|(&reg29)));
              reg69 <= (reg31 ? wire47[(3'h5):(1'h1)] : wire23);
            end
          reg71 <= $unsigned(reg43[(4'ha):(4'ha)]);
          reg72 <= wire46[(4'hc):(4'hb)];
          reg73 <= $unsigned((wire51[(4'h9):(2'h3)] ? wire22 : (-wire20)));
        end
      else
        begin
          reg68 <= (wire20[(3'h4):(1'h0)] ?
              (reg45 >= {$signed(reg35)}) : (-($unsigned((-reg68)) ?
                  reg66 : reg69[(5'h10):(4'h9)])));
        end
      reg74 <= reg72[(2'h3):(1'h1)];
    end
  assign wire75 = $signed(reg45[(2'h3):(2'h2)]);
  assign wire76 = {$unsigned((wire49[(1'h0):(1'h0)] ?
                          ((reg37 + reg58) ?
                              {reg28} : (reg72 >= wire21)) : (+$unsigned(wire25)))),
                      (!({((8'hb5) ? wire49 : wire49),
                          reg58[(2'h2):(1'h0)]} <= reg45[(3'h4):(2'h3)]))};
  assign wire77 = $unsigned($signed(wire48[(4'h8):(2'h2)]));
  assign wire78 = wire75[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg79 <= wire20[(1'h0):(1'h0)];
    end
  assign wire80 = (|(|reg73));
  always
    @(posedge clk) begin
      reg81 <= $unsigned(((^~((wire75 ? reg36 : reg45) != $unsigned(wire23))) ?
          (|((reg39 ? reg55 : reg36) ?
              (+reg66) : $unsigned(reg43))) : {$signed((~^reg29))}));
    end
endmodule
