module top
#(parameter param210 = (+(+(~{((8'ha7) ? (8'hbe) : (8'hb1)), ((8'ha8) ? (8'h9c) : (8'h9e))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire [(2'h2):(1'h0)] wire209;
  wire signed [(3'h6):(1'h0)] wire208;
  wire signed [(5'h12):(1'h0)] wire207;
  wire [(3'h7):(1'h0)] wire206;
  wire [(3'h5):(1'h0)] wire205;
  wire [(2'h3):(1'h0)] wire204;
  wire [(4'hd):(1'h0)] wire197;
  wire [(4'h9):(1'h0)] wire137;
  wire signed [(5'h15):(1'h0)] wire136;
  wire signed [(5'h10):(1'h0)] wire135;
  wire [(5'h10):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire131;
  wire signed [(4'hf):(1'h0)] wire199;
  wire [(2'h2):(1'h0)] wire201;
  wire [(5'h10):(1'h0)] wire202;
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  assign y = {wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire197,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire4,
                 wire5,
                 wire6,
                 wire15,
                 wire16,
                 wire17,
                 wire131,
                 wire199,
                 wire201,
                 wire202,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire4 = ($signed(wire0[(2'h3):(2'h3)]) ?
                     {{($unsigned(wire2) ? {wire1, (8'hb8)} : $signed((8'hba))),
                             (8'had)},
                         $unsigned(wire2[(2'h2):(1'h1)])} : (((wire2 ?
                             wire2[(3'h4):(1'h1)] : (&wire0)) <= (wire2[(3'h5):(1'h1)] <<< (wire2 << wire1))) ?
                         $signed($signed(wire2)) : (wire3[(1'h1):(1'h0)] ?
                             (~$unsigned((8'hac))) : $unsigned($unsigned(wire1)))));
  assign wire5 = $signed($signed($unsigned((wire1[(3'h4):(2'h2)] != (8'ha3)))));
  assign wire6 = wire0;
  always
    @(posedge clk) begin
      reg7 <= wire2[(4'h8):(3'h6)];
      if (($unsigned((({wire1} ?
          (!wire6) : (8'hbc)) >> wire3[(2'h3):(2'h2)])) - ($signed((^(wire1 <<< wire4))) ?
          wire1[(1'h1):(1'h1)] : (7'h40))))
        begin
          reg8 <= wire1[(2'h2):(1'h1)];
          if ({{((reg7 ~^ wire6[(5'h10):(4'hc)]) || ($unsigned(wire6) ?
                      (wire1 < wire1) : wire5))}})
            begin
              reg9 <= wire3[(1'h0):(1'h0)];
              reg10 <= (&{$unsigned(reg7[(2'h2):(2'h2)]),
                  ((-(wire6 ? (8'hab) : reg7)) ?
                      wire6[(4'he):(4'ha)] : $signed((+wire1)))});
              reg11 <= ((+$unsigned(((~(8'ha8)) | reg8[(4'h8):(2'h3)]))) ?
                  $unsigned($signed(wire3)) : wire6[(4'hb):(3'h7)]);
              reg12 <= ($signed((^~$signed({wire4}))) > wire5);
              reg13 <= $signed($signed(($signed(((8'ha3) >> reg9)) ?
                  (((8'hb3) >>> wire1) >>> (wire3 ?
                      wire4 : wire1)) : (+$unsigned(wire4)))));
            end
          else
            begin
              reg9 <= $unsigned(reg10);
              reg10 <= {reg7[(2'h3):(2'h2)]};
              reg11 <= ($signed(((^wire0) >>> reg11[(4'h8):(3'h6)])) ?
                  {(!reg9[(2'h3):(1'h0)]),
                      wire2[(4'h8):(1'h1)]} : ($unsigned(reg10[(3'h5):(3'h4)]) ?
                      (reg7[(3'h5):(2'h2)] ?
                          {(wire0 ? reg7 : reg12),
                              $signed(wire0)} : (((8'ha3) >= reg13) | reg12[(2'h2):(1'h0)])) : ((wire1 <= wire2[(3'h7):(3'h7)]) | (~$unsigned(reg8)))));
              reg12 <= (~^$signed(reg9[(4'h8):(3'h7)]));
              reg13 <= reg12[(2'h2):(1'h1)];
            end
          reg14 <= ((^((~|$signed(wire3)) ?
                  wire1[(4'h8):(2'h3)] : $unsigned((wire5 ? wire3 : wire1)))) ?
              $unsigned(reg8) : (8'ha3));
        end
      else
        begin
          reg8 <= $signed(wire1[(3'h4):(1'h0)]);
          reg9 <= wire2;
          reg10 <= {$unsigned($signed($unsigned((wire1 ? reg14 : wire4)))),
              wire0};
        end
    end
  assign wire15 = $signed($unsigned(reg14));
  assign wire16 = $signed({{({reg9} ? $signed(wire6) : $unsigned(reg8))}});
  assign wire17 = wire2;
  module18 #() modinst132 (.wire19(reg11), .y(wire131), .wire23(reg14), .wire21(wire1), .clk(clk), .wire20(wire3), .wire22(wire4));
  assign wire133 = wire1;
  assign wire134 = wire5[(2'h3):(1'h0)];
  assign wire135 = (8'h9e);
  assign wire136 = ($signed(reg10) ?
                       $unsigned((8'hb2)) : (wire135 ?
                           $unsigned((wire135 ?
                               {wire16,
                                   wire15} : wire6)) : $signed((~$unsigned(reg11)))));
  assign wire137 = (&(~(-(8'hab))));
  module138 #() modinst198 (.clk(clk), .wire142(wire3), .wire140(reg12), .wire139(wire136), .wire141(wire2), .y(wire197));
  module162 #() modinst200 (wire199, clk, wire17, wire1, reg12, wire16, wire2);
  assign wire201 = ((((wire135 ?
                       $unsigned(wire134) : $unsigned(reg14)) | ((|wire134) | $signed(wire17))) == wire133[(4'h8):(1'h1)]) >> {((wire16 <= $signed(reg13)) <<< reg9[(3'h7):(3'h7)]),
                       reg14[(4'hf):(3'h7)]});
  module64 #() modinst203 (wire202, clk, wire199, wire197, wire136, reg8);
  assign wire204 = $signed(((wire199[(3'h4):(1'h1)] + reg10) ?
                       wire134 : wire201[(1'h1):(1'h1)]));
  assign wire205 = wire135;
  assign wire206 = wire1;
  assign wire207 = {((-reg13[(1'h0):(1'h0)]) ?
                           (~&($unsigned(reg10) >>> (^wire137))) : $signed((wire197[(2'h2):(2'h2)] >> (wire199 ?
                               (8'hb1) : reg8)))),
                       $unsigned(((!(~wire201)) >= {(reg8 ? wire4 : reg9)}))};
  assign wire208 = wire17[(4'hc):(4'h8)];
  assign wire209 = (((wire2[(4'h9):(3'h5)] ?
                           ((wire208 ? wire133 : wire133) ?
                               ((8'h9c) ?
                                   wire131 : wire202) : wire15[(2'h2):(2'h2)]) : ((reg10 >>> wire199) ?
                               $unsigned(reg10) : (wire204 + wire201))) - reg10[(4'hb):(4'ha)]) ?
                       ((reg10[(3'h7):(3'h6)] > ($unsigned(wire6) <<< (^~wire197))) ?
                           (~|(!(~reg8))) : (-wire206[(3'h5):(1'h1)])) : wire2[(5'h14):(5'h13)]);
endmodule

module module138
#(parameter param196 = {{(~&({(8'hb2)} ? (8'ha9) : {(8'ha4), (8'hb5)})), (8'hb6)}, (&(((~|(8'hbd)) ? ((8'ha8) ? (7'h41) : (8'ha1)) : ((8'ha6) ? (8'ha4) : (8'ha7))) ? (~((8'hab) ^~ (8'hbd))) : (((8'ha9) ? (8'ha4) : (8'hab)) < {(8'hb7)})))})
(y, clk, wire139, wire140, wire141, wire142);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire139;
  input wire [(5'h15):(1'h0)] wire140;
  input wire [(5'h14):(1'h0)] wire141;
  input wire [(5'h11):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire159;
  wire signed [(5'h10):(1'h0)] wire160;
  wire [(3'h6):(1'h0)] wire161;
  wire [(4'hd):(1'h0)] wire194;
  assign y = {wire156, wire158, wire159, wire160, wire161, wire194, (1'h0)};
  module143 #() modinst157 (.wire147(wire142), .wire146(wire139), .y(wire156), .wire144(wire141), .clk(clk), .wire145(wire140));
  assign wire158 = {wire141, (&$unsigned(wire141))};
  assign wire159 = ($unsigned($unsigned($unsigned((7'h44)))) ?
                       (((8'hac) ?
                           wire140 : (~|((8'hb1) <<< wire141))) || $unsigned({$unsigned(wire141),
                           (wire156 || wire156)})) : {(!$signed(wire158[(5'h12):(1'h1)])),
                           $signed((wire141[(4'h9):(3'h4)] ?
                               $unsigned(wire139) : (wire141 ?
                                   wire156 : wire142)))});
  assign wire160 = $signed((-((8'hb5) ?
                       ((-wire139) << (wire159 ~^ wire139)) : {wire159[(2'h3):(1'h1)],
                           wire159[(1'h1):(1'h0)]})));
  assign wire161 = (8'ha4);
  module162 #() modinst195 (.y(wire194), .wire163(wire159), .wire164(wire158), .clk(clk), .wire166(wire142), .wire165(wire156), .wire167(wire160));
endmodule

module module18
#(parameter param129 = (+(((((8'hb4) ? (8'ha6) : (8'hb0)) ? ((8'hbc) ^ (8'ha8)) : (~(8'hba))) ? {((8'h9f) ? (7'h40) : (8'ha8)), ((8'ha7) << (8'hac))} : (((8'hb3) != (8'ha6)) << (+(8'ha5)))) ? (({(8'hb6)} > ((8'hae) || (8'h9c))) << (((8'hb8) & (8'hb0)) - (^(8'hbb)))) : (|(~|((8'hb3) ? (8'hb9) : (8'hb6)))))), 
parameter param130 = (((|(~^(param129 - param129))) ? (((param129 ? (8'haf) : (7'h41)) != (param129 | (8'hbd))) >>> param129) : {((^param129) | param129), (!(8'hb9))}) ? param129 : param129))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire23;
  input wire signed [(4'h9):(1'h0)] wire22;
  input wire [(4'hc):(1'h0)] wire21;
  input wire signed [(5'h12):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(2'h2):(1'h0)] wire127;
  wire [(4'hb):(1'h0)] wire126;
  wire signed [(3'h4):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire63,
                 wire62,
                 wire56,
                 wire55,
                 wire54,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire46,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire24 = (8'hbf);
  assign wire25 = (wire23 ?
                      $signed(((wire21 + $unsigned(wire22)) ?
                          $unsigned($unsigned(wire20)) : $signed($unsigned(wire21)))) : wire23[(4'hd):(2'h2)]);
  assign wire26 = ((^~wire24) ?
                      (wire20[(4'he):(4'hb)] ^ (-{(~|wire20),
                          (wire20 ?
                              wire22 : wire21)})) : (wire22[(2'h2):(2'h2)] ?
                          (wire25 ?
                              wire19[(2'h2):(1'h0)] : (((8'ha0) ?
                                  wire19 : wire23) & wire23)) : ((+wire23[(1'h0):(1'h0)]) || ($signed(wire21) ?
                              wire20 : (+(7'h43))))));
  assign wire27 = wire24[(3'h6):(3'h4)];
  assign wire28 = $unsigned(wire24[(3'h6):(1'h1)]);
  assign wire29 = ({($unsigned($signed(wire21)) ?
                          wire23[(5'h12):(5'h10)] : ($unsigned(wire19) | {wire26,
                              wire20}))} >> (~^({(wire26 ~^ wire20)} ?
                      {$unsigned(wire20)} : wire25)));
  assign wire30 = ($unsigned((+wire24)) ^~ $unsigned($signed($signed($unsigned(wire28)))));
  module31 #() modinst47 (.wire33(wire22), .wire32(wire26), .wire34(wire19), .clk(clk), .y(wire46), .wire35(wire27));
  assign wire48 = ($signed(wire30) ?
                      ($signed(((^~wire29) ?
                          {wire21} : $unsigned(wire26))) >> wire21) : wire28[(4'h8):(3'h4)]);
  assign wire49 = (~&$signed($unsigned((wire46 ?
                      (wire25 <= (8'hbb)) : $unsigned(wire30)))));
  assign wire50 = ($signed((&$unsigned(wire48[(4'he):(4'hc)]))) << ({(^~(wire27 > wire30))} ?
                      $signed((~&(&wire49))) : wire23[(4'hf):(3'h5)]));
  assign wire51 = wire23;
  always
    @(posedge clk) begin
      reg52 <= ((($unsigned((wire50 <<< (8'ha0))) + (wire50[(2'h3):(1'h1)] ?
          wire21 : (~&wire28))) ~^ (~((^~wire23) >> wire24[(1'h1):(1'h0)]))) <= wire48);
      reg53 <= (!wire30[(5'h12):(4'h9)]);
    end
  assign wire54 = (!(~&$unsigned(wire46[(4'hc):(4'h9)])));
  assign wire55 = (wire21[(4'h8):(2'h3)] ?
                      $unsigned($unsigned(((reg53 ? wire19 : wire46) ?
                          wire50 : $unsigned(wire28)))) : wire21[(1'h0):(1'h0)]);
  assign wire56 = {(wire23 ?
                          ({$signed(wire46)} ^ ((wire22 ?
                              wire29 : wire46) && wire51)) : {wire48[(2'h2):(1'h1)]})};
  always
    @(posedge clk) begin
      reg57 <= (~|wire19[(4'hb):(4'h8)]);
      if (wire24[(3'h6):(1'h1)])
        begin
          reg58 <= {((~^(&(wire50 ? wire25 : (8'ha8)))) ?
                  ((^~reg53[(1'h1):(1'h0)]) ?
                      {wire46[(3'h4):(3'h4)],
                          (wire49 - wire29)} : {reg52[(4'ha):(4'ha)]}) : $signed($signed((~&wire25))))};
          reg59 <= ((wire19[(1'h0):(1'h0)] ? wire27 : $unsigned(wire30)) ?
              wire50 : wire51[(2'h2):(1'h0)]);
        end
      else
        begin
          reg58 <= $signed(wire20[(3'h6):(1'h1)]);
          if ((wire20 == {$unsigned(((~^wire21) ?
                  $signed(wire54) : (wire20 ? wire26 : wire26))),
              (!$unsigned((!wire24)))}))
            begin
              reg59 <= reg58;
            end
          else
            begin
              reg59 <= $unsigned(reg53);
              reg60 <= $signed(wire19);
              reg61 <= reg57[(3'h7):(3'h4)];
            end
        end
    end
  assign wire62 = ($unsigned($unsigned(((-(8'hb7)) ?
                      (wire28 ?
                          (8'hb9) : wire22) : (wire55 && wire23)))) + $signed($unsigned({(wire22 ?
                          (8'hb0) : wire54),
                      (wire21 ? wire51 : wire51)})));
  assign wire63 = (reg58[(2'h2):(1'h1)] ^~ (~^(|((wire62 ^ (8'ha7)) == (wire54 ?
                      (8'hb2) : wire19)))));
  module64 #() modinst125 (wire124, clk, reg60, wire20, reg61, wire55);
  assign wire126 = wire48;
  assign wire127 = wire28;
  assign wire128 = wire21[(4'hb):(2'h2)];
endmodule

module module64
#(parameter param123 = ({{(((8'haa) ? (8'hb7) : (8'hb5)) << ((8'hb6) >= (7'h42))), (((8'hb7) ? (8'hbd) : (8'hb6)) >>> ((8'ha8) <<< (8'ha1)))}, {{(~^(8'hb4))}, (-((8'h9c) ? (8'hbe) : (8'hb9)))}} ? (-{{((8'had) ? (8'hac) : (8'hb4)), ((8'hb2) ? (8'hb1) : (8'ha1))}, (((7'h44) ? (8'hac) : (8'hbd)) >> (-(8'hac)))}) : (^~(({(7'h40)} ? ((8'ha3) ^ (8'ha4)) : ((8'ha5) ? (8'hab) : (8'ha6))) | ({(8'haa), (7'h40)} * {(8'hb9), (8'ha2)})))))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h235):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire68;
  input wire signed [(4'hd):(1'h0)] wire67;
  input wire [(5'h15):(1'h0)] wire66;
  input wire [(5'h14):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  assign y = {wire122,
                 wire117,
                 wire104,
                 wire103,
                 wire102,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire71,
                 wire70,
                 wire69,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
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
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire69 = $signed($unsigned((8'ha9)));
  assign wire70 = ((&$signed(($unsigned((8'ha5)) == (!wire67)))) + wire65[(2'h3):(2'h3)]);
  assign wire71 = ($signed((((~&wire65) >= (wire70 ? wire65 : wire68)) ?
                      $unsigned((wire69 & (8'haf))) : wire67[(3'h6):(3'h4)])) ^~ wire70[(4'h9):(4'h9)]);
  always
    @(posedge clk) begin
      reg72 <= (wire71[(3'h7):(3'h5)] ?
          {$unsigned($signed((-wire65)))} : wire71);
      reg73 <= wire71;
      reg74 <= wire66;
      if ((-(wire67 ^~ wire70)))
        begin
          reg75 <= $signed(((({wire70} ^ {reg73, wire71}) ?
                  (^wire65[(5'h14):(4'h9)]) : ({reg72, reg73} & (~|(8'haf)))) ?
              ($signed((reg73 ?
                  reg74 : reg73)) << (~&$signed(wire68))) : (+{$unsigned(reg72)})));
          reg76 <= wire71[(5'h14):(2'h2)];
          reg77 <= $unsigned(($signed((&wire67)) ?
              ($unsigned((!wire71)) - $signed($unsigned(reg76))) : reg73[(2'h2):(1'h0)]));
          reg78 <= $signed($unsigned(reg75));
          reg79 <= (~((~|$unsigned($signed(reg73))) | (reg74[(3'h4):(3'h4)] || reg77[(2'h2):(1'h0)])));
        end
      else
        begin
          reg75 <= reg73[(3'h6):(2'h2)];
          reg76 <= (+($signed(wire71[(1'h0):(1'h0)]) || (&$signed($signed(wire67)))));
          if (((wire66[(3'h5):(2'h3)] ?
              $unsigned({$signed(wire67)}) : $signed((^~$signed(wire65)))) + $unsigned($signed((^~{reg77})))))
            begin
              reg77 <= wire70[(4'h8):(3'h7)];
            end
          else
            begin
              reg77 <= ({$unsigned((~|(reg79 | wire71))), wire70} ?
                  wire66[(5'h13):(1'h0)] : $signed($signed($signed((|wire70)))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg80 <= wire65[(3'h4):(1'h0)];
      reg81 <= $signed((|$signed(reg76[(3'h5):(1'h1)])));
      if ({{reg77}})
        begin
          reg82 <= wire66[(4'h8):(1'h0)];
          reg83 <= (&(^$signed(reg72)));
          reg84 <= (($signed(wire67[(4'hc):(4'hb)]) <<< $signed($signed(wire70))) <= {(&(!wire69[(5'h11):(2'h2)]))});
        end
      else
        begin
          reg82 <= ((({(reg76 ? wire67 : reg79), $unsigned((7'h44))} ?
                  wire65[(1'h0):(1'h0)] : reg78) <<< $signed($unsigned((^~reg76)))) ?
              (8'hb7) : (({(wire65 >>> reg74), $unsigned(reg84)} ?
                  (~|(wire69 ?
                      reg83 : (8'ha2))) : wire68) != $unsigned($signed((reg75 ?
                  reg75 : reg74)))));
          if ((8'hb2))
            begin
              reg83 <= {$unsigned((!($unsigned(wire65) ?
                      (8'hbd) : $signed(wire66))))};
              reg84 <= ($unsigned(($signed((reg83 <= reg83)) ?
                      $unsigned($signed((8'haa))) : ((reg72 ?
                          wire70 : wire66) < $unsigned(wire70)))) ?
                  (^$signed((reg84[(5'h14):(1'h1)] ?
                      {reg80,
                          (8'hb9)} : wire67))) : (~(reg77 <<< (reg83 * {reg76,
                      wire70}))));
            end
          else
            begin
              reg83 <= (reg83 < {((8'ha7) > (~^((8'ha5) ? (8'hb2) : reg81)))});
              reg84 <= reg73;
            end
          reg85 <= $signed($signed(reg74[(3'h5):(3'h5)]));
        end
      reg86 <= $signed(reg85[(4'h9):(2'h2)]);
      reg87 <= reg85[(1'h0):(1'h0)];
    end
  assign wire88 = $signed($unsigned((&wire66)));
  assign wire89 = $signed(wire70[(3'h5):(3'h4)]);
  assign wire90 = $unsigned(($signed((!{wire88, (8'ha3)})) * reg78));
  assign wire91 = ({({(wire89 != reg75), {reg75}} ?
                              reg77[(2'h2):(1'h1)] : wire68)} ?
                      (^wire66) : {$signed($signed($signed(reg86))),
                          ($signed(wire69) ? reg81[(1'h1):(1'h1)] : reg76)});
  assign wire92 = {((^~{reg78}) >> ((reg86 ?
                          $unsigned(reg77) : reg80) >>> {$unsigned(reg86),
                          $unsigned(wire88)}))};
  assign wire93 = ((~&wire68) ? (8'ha7) : {(~&reg79[(4'h8):(3'h4)])});
  assign wire94 = reg83;
  always
    @(posedge clk) begin
      reg95 <= reg85;
      reg96 <= (~$signed((~{$signed((8'ha3))})));
      reg97 <= (((({wire68} || $signed(reg75)) * $unsigned((wire69 ?
                  wire65 : wire90))) ?
              wire91 : ((+$unsigned(wire88)) && ($signed((8'hb1)) <<< reg95[(4'hd):(3'h4)]))) ?
          (8'ha5) : reg85);
      reg98 <= ($signed($signed(reg95)) - (-(((reg84 ? wire69 : wire93) ?
              $unsigned(reg75) : ((8'hb9) && reg72)) ?
          (reg82 ? {wire66, reg77} : (reg84 ? reg78 : wire90)) : reg95)));
      if (wire94[(3'h5):(3'h4)])
        begin
          reg99 <= $unsigned((~(&((wire68 * wire65) << $signed(reg82)))));
          reg100 <= (reg74[(2'h3):(2'h3)] ?
              (((~|wire94[(4'h8):(2'h2)]) << reg76) ?
                  reg85 : (8'hb0)) : (!($unsigned($unsigned(reg74)) ~^ ((8'hb8) ?
                  reg98 : $unsigned(wire89)))));
          reg101 <= ((($unsigned((wire71 >= reg87)) ?
                  $signed((reg96 ?
                      reg78 : reg81)) : wire92[(4'h8):(1'h1)]) & (~&$unsigned($unsigned(wire91)))) ?
              $signed((~&reg75[(2'h3):(2'h2)])) : (wire69 ?
                  $unsigned(wire91) : reg74));
        end
      else
        begin
          reg99 <= reg100[(2'h3):(2'h2)];
        end
    end
  assign wire102 = {$signed((!reg76)), reg76[(2'h2):(1'h0)]};
  assign wire103 = ($signed(wire65[(5'h10):(4'hd)]) & (-{$unsigned((^~(7'h44)))}));
  assign wire104 = $signed(((^~((+wire67) >>> {reg82})) >= (~reg84)));
  always
    @(posedge clk) begin
      reg105 <= (~$unsigned({{wire88[(4'ha):(3'h5)], $signed(reg101)}}));
      reg106 <= (^((((7'h40) ?
          reg100 : $unsigned(reg74)) == wire71) ^ (~|(wire70 ?
          ((8'ha6) ? wire66 : reg95) : {reg84, reg96}))));
      if ({{(((wire90 ? wire65 : wire91) ?
                  wire88[(3'h4):(3'h4)] : (^~reg74)) <<< wire70),
              (($unsigned(wire104) >>> (wire89 ? wire88 : reg76)) ?
                  {$signed((8'hbe)), (7'h40)} : {$signed(wire103)})},
          ((|(~|(reg73 ? (7'h42) : wire102))) || $signed((&reg72)))})
        begin
          reg107 <= $unsigned(wire68[(2'h2):(1'h1)]);
          reg108 <= (~&(((wire92 & (8'ha7)) ?
                  (!{(8'hb8)}) : ((wire94 ? wire91 : wire93) ?
                      $signed((8'h9e)) : (wire102 ? wire68 : wire69))) ?
              (!reg100) : {reg75, $unsigned(reg85)}));
          if (((reg100 ?
                  $unsigned((~wire65)) : ((reg86 ?
                      reg83 : wire70[(3'h6):(1'h1)]) || $signed($signed((8'ha6))))) ?
              wire89[(1'h0):(1'h0)] : (&{((reg81 + reg101) < reg96[(2'h2):(1'h1)]),
                  ((wire103 ? reg101 : reg80) ?
                      $unsigned((7'h44)) : (!wire71))})))
            begin
              reg109 <= $signed($signed(($signed((reg95 ?
                  (8'ha0) : reg72)) >= ((~^wire91) ?
                  (+reg107) : reg107[(5'h11):(4'hc)]))));
              reg110 <= reg101;
              reg111 <= $unsigned((!reg99[(2'h2):(2'h2)]));
              reg112 <= ($signed($unsigned($unsigned($unsigned(reg84)))) ?
                  (wire65[(5'h13):(4'he)] >> (reg106 <<< reg87[(2'h2):(1'h1)])) : reg77);
            end
          else
            begin
              reg109 <= {reg96[(3'h4):(2'h2)],
                  (|(((wire102 ^ reg80) >> reg81) ?
                      ($unsigned(wire69) <<< (|reg74)) : reg74[(3'h5):(3'h4)]))};
              reg110 <= {(~$unsigned((^(-reg81)))), (8'hbc)};
              reg111 <= $unsigned(((8'ha4) <= $signed(($unsigned(reg108) < wire69[(4'ha):(4'ha)]))));
            end
          reg113 <= (wire90 ?
              ((reg107 && reg107) ?
                  $signed($signed((wire65 ?
                      reg98 : wire102))) : ((-$unsigned((8'hb7))) ?
                      wire91[(4'h9):(4'h9)] : $signed((reg108 >>> wire90)))) : $unsigned(($signed(reg77[(1'h1):(1'h0)]) ?
                  $signed((reg85 ? wire102 : (8'ha4))) : $unsigned(((8'ha1) ?
                      reg95 : (8'had))))));
        end
      else
        begin
          reg107 <= $unsigned($signed($unsigned(reg98[(4'h8):(2'h3)])));
          if ((8'ha6))
            begin
              reg108 <= $unsigned((reg101[(3'h4):(2'h2)] ^ (wire102 ?
                  ($signed(reg81) ?
                      $signed(reg86) : ((8'ha6) * reg79)) : reg112[(3'h5):(2'h3)])));
              reg109 <= reg86;
              reg110 <= $unsigned((~^wire94[(4'hf):(4'he)]));
            end
          else
            begin
              reg108 <= (&$signed($signed(((-reg79) + (reg79 || reg106)))));
              reg109 <= reg82[(2'h3):(2'h3)];
            end
          if ((reg84[(4'hb):(2'h2)] | reg112[(1'h1):(1'h0)]))
            begin
              reg111 <= (wire104 - (^(~&$signed($unsigned(reg107)))));
              reg112 <= reg87[(1'h0):(1'h0)];
              reg113 <= ((~wire71[(3'h7):(3'h5)]) >>> $unsigned({(reg105[(1'h1):(1'h0)] & ((8'hb7) >> wire104)),
                  reg76[(1'h1):(1'h0)]}));
              reg114 <= wire88[(3'h4):(1'h0)];
            end
          else
            begin
              reg111 <= {{($unsigned($unsigned(reg81)) ?
                          ($signed((8'hbe)) <<< $signed(wire104)) : reg79),
                      reg109[(4'hc):(4'hb)]}};
              reg112 <= (^~$unsigned(reg82));
            end
          reg115 <= ($signed($unsigned(wire71)) ?
              ((~&((reg100 ? (8'ha5) : (8'h9e)) ?
                      (reg72 - reg75) : (reg75 + wire66))) ?
                  $signed((~&$signed(reg77))) : ((&(reg74 <<< reg95)) | reg113[(1'h0):(1'h0)])) : ((^~{$signed((8'hbb)),
                  (8'ha2)}) ^ (reg98[(3'h5):(2'h2)] >>> {(reg72 ^~ (8'hb3)),
                  (!wire103)})));
          reg116 <= $unsigned(($signed($signed($signed(reg96))) + {reg107,
              $unsigned($signed(reg111))}));
        end
    end
  assign wire117 = reg111[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg118 <= wire70[(4'hc):(3'h4)];
      reg119 <= reg85;
      reg120 <= reg75;
      reg121 <= reg86;
    end
  assign wire122 = reg119[(1'h1):(1'h1)];
endmodule

module module31
#(parameter param44 = ((-(({(8'ha5), (7'h44)} - ((8'hb0) == (8'ha5))) ? (((8'haf) ? (8'ha7) : (8'hbf)) - ((8'ha1) + (8'ha6))) : (((8'hb8) > (8'hb2)) >> ((8'ha2) ? (8'hb2) : (8'ha5))))) ? (~|(^({(8'hb6), (8'hb8)} ? ((7'h42) * (8'haa)) : (^(8'ha6))))) : ((({(8'hbe), (8'ha4)} < ((8'had) ? (8'ha9) : (8'ha1))) - ({(8'ha4), (8'hac)} ? (+(7'h44)) : (^(7'h44)))) ^ ((8'h9c) != (((8'hbb) ? (8'haf) : (8'ha3)) && (^(8'had)))))), 
parameter param45 = (|((8'had) + param44)))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire35;
  input wire signed [(3'h5):(1'h0)] wire34;
  input wire [(4'h9):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 (1'h0)};
  assign wire36 = (~&wire32);
  assign wire37 = {$unsigned((^$signed((wire34 ? wire35 : wire32))))};
  assign wire38 = $unsigned($unsigned(({wire36} ?
                      $unsigned(wire32) : (&{wire33, (8'ha7)}))));
  assign wire39 = ((wire35 ?
                          $signed({(wire37 ^ wire36)}) : {{{(8'had)},
                                  (wire32 << (8'h9d))}}) ?
                      (~wire35) : $unsigned(wire36));
  assign wire40 = (((wire33 ^ (wire35 ~^ (wire33 ?
                          wire36 : (8'hab)))) ^ (wire32[(2'h2):(1'h0)] ?
                          ((|wire39) < wire38[(3'h4):(1'h0)]) : wire33[(4'h8):(1'h0)])) ?
                      wire33 : $signed((wire33 ?
                          $signed($unsigned(wire37)) : (^(8'ha3)))));
  assign wire41 = $signed(wire36);
  assign wire42 = wire39[(3'h4):(2'h2)];
  assign wire43 = (($signed(wire33[(3'h4):(3'h4)]) >>> wire32[(1'h0):(1'h0)]) - wire34[(2'h2):(1'h0)]);
endmodule

module module162
#(parameter param193 = ((!(((+(8'hb7)) ? (+(8'hb2)) : ((8'ha8) || (8'haf))) ~^ (((8'ha6) & (8'hbf)) ? (^~(7'h40)) : {(8'ha8)}))) & {(~(((8'ha9) ? (8'hb8) : (8'ha2)) ? ((8'hac) != (7'h43)) : {(7'h44)})), ((8'ha4) != {((8'ha4) ^~ (7'h42)), ((8'h9e) ? (8'ha0) : (8'had))})}))
(y, clk, wire167, wire166, wire165, wire164, wire163);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire167;
  input wire [(5'h11):(1'h0)] wire166;
  input wire signed [(3'h5):(1'h0)] wire165;
  input wire signed [(3'h7):(1'h0)] wire164;
  input wire [(4'hf):(1'h0)] wire163;
  wire signed [(4'hb):(1'h0)] wire192;
  wire [(4'hd):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire190;
  wire [(5'h12):(1'h0)] wire189;
  wire [(5'h11):(1'h0)] wire187;
  wire signed [(3'h5):(1'h0)] wire186;
  wire signed [(4'h8):(1'h0)] wire185;
  wire [(3'h4):(1'h0)] wire181;
  wire signed [(2'h3):(1'h0)] wire180;
  wire [(4'he):(1'h0)] wire179;
  wire [(3'h7):(1'h0)] wire178;
  wire signed [(3'h5):(1'h0)] wire177;
  wire [(5'h13):(1'h0)] wire176;
  wire [(4'hb):(1'h0)] wire175;
  wire signed [(5'h12):(1'h0)] wire174;
  wire [(5'h14):(1'h0)] wire173;
  wire [(4'ha):(1'h0)] wire168;
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  reg [(5'h12):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire187,
                 wire186,
                 wire185,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire168,
                 reg188,
                 reg184,
                 reg183,
                 reg182,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire168 = $unsigned((-(!$unsigned((wire165 ? wire165 : wire165)))));
  always
    @(posedge clk) begin
      reg169 <= $unsigned(wire164[(3'h7):(2'h2)]);
      reg170 <= (!$signed($signed((^wire167[(4'h8):(4'h8)]))));
      reg171 <= $signed(wire166[(3'h5):(3'h5)]);
      reg172 <= reg170[(1'h0):(1'h0)];
    end
  assign wire173 = reg170[(4'h8):(2'h2)];
  assign wire174 = wire164;
  assign wire175 = wire168[(1'h1):(1'h0)];
  assign wire176 = $unsigned(($signed((-wire165)) ? wire165 : $signed(reg169)));
  assign wire177 = ((8'haf) ? wire174 : reg171);
  assign wire178 = $unsigned((wire164[(3'h5):(1'h1)] <= (~&(~^$signed(wire164)))));
  assign wire179 = reg169;
  assign wire180 = $unsigned($signed($signed(($signed(wire166) ?
                       wire164 : {wire165}))));
  assign wire181 = ($unsigned(($signed($signed(wire173)) << (~^$unsigned(wire179)))) ?
                       wire179[(1'h0):(1'h0)] : (reg171[(4'he):(3'h4)] << wire176[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg182 <= ($signed({$signed($unsigned(wire166)), (!(^~(8'h9f)))}) ?
          (!wire166[(3'h4):(1'h0)]) : {{(wire166 && $unsigned(wire165)),
                  $unsigned((reg170 ? reg169 : wire179))},
              {(!$signed(reg169))}});
      reg183 <= (+(|wire176[(4'he):(3'h5)]));
      reg184 <= wire176[(3'h4):(2'h2)];
    end
  assign wire185 = $signed((wire164 ? wire181 : {wire163[(3'h4):(1'h1)]}));
  assign wire186 = wire173[(4'hd):(4'h9)];
  assign wire187 = ({(^(~&reg170)), {(7'h41), wire177}} ?
                       (wire163 >= wire186[(1'h1):(1'h1)]) : ((wire186 != (wire163[(3'h5):(2'h2)] || (+reg169))) ?
                           ($unsigned(((8'ha9) ?
                               wire186 : reg184)) >>> (~|(wire166 >= wire177))) : wire167));
  always
    @(posedge clk) begin
      reg188 <= (((~($unsigned(reg184) ?
          (wire166 ?
              reg171 : wire173) : wire165)) != $signed($signed((~|wire166)))) * wire175[(4'h8):(3'h4)]);
    end
  assign wire189 = $unsigned(($signed((7'h42)) ?
                       (~^(&(wire176 & wire165))) : ((wire187[(1'h1):(1'h1)] ?
                               wire165 : (wire164 ? wire166 : (8'ha3))) ?
                           wire180[(2'h2):(1'h1)] : (^(~wire177)))));
  assign wire190 = (wire175 >>> {$unsigned(((reg169 & wire174) ?
                           (reg169 >> (7'h40)) : $unsigned(reg188)))});
  assign wire191 = $unsigned((($unsigned(reg171) ?
                       wire190[(3'h7):(3'h7)] : (8'hb1)) != (wire189 ?
                       $signed({wire189}) : wire174[(3'h5):(1'h0)])));
  assign wire192 = (((+((wire178 >>> wire190) & wire174)) != reg182[(5'h11):(4'hb)]) ?
                       $unsigned((wire181 ?
                           {reg170} : $signed((reg170 ?
                               (8'ha7) : wire180)))) : (8'hb8));
endmodule

module module143
#(parameter param154 = (((8'ha2) ? (7'h42) : {(((8'hb7) * (8'hb8)) ? (-(8'hb2)) : (!(8'h9c))), (((8'ha9) || (8'hb0)) ? ((7'h43) ? (8'hb5) : (8'hb9)) : ((8'ha3) + (8'h9c)))}) ? ((~|(((8'hab) ? (8'ha4) : (8'hb2)) <<< {(8'hab)})) < {(~&{(8'haa), (8'ha8)}), (((8'ha0) ? (8'ha7) : (8'hb1)) && ((8'hbe) & (8'ha7)))}) : (~|(((&(8'h9d)) ? {(7'h43)} : ((8'hb3) ? (8'ha7) : (8'hb3))) ? ((~^(8'ha2)) ? (|(8'had)) : ((8'hb6) >>> (8'h9c))) : (((8'h9c) ? (8'hb6) : (8'ha9)) ? (~|(7'h43)) : ((8'hb7) ? (7'h43) : (8'ha3)))))), 
parameter param155 = ((({(param154 ^ (8'ha6)), {(8'hb1), param154}} ? (param154 & (^param154)) : ((param154 ? (7'h40) : param154) ? {param154, param154} : (+param154))) >>> param154) ? {(((+param154) & (~^param154)) ? (~^(param154 ? (8'ha8) : param154)) : ((8'ha3) << (param154 & param154))), ((8'ha4) != (param154 >= (param154 << param154)))} : (~|(^{(8'hbb)}))))
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire147;
  input wire [(4'hd):(1'h0)] wire146;
  input wire [(4'hb):(1'h0)] wire145;
  input wire [(5'h14):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire151;
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  assign y = {wire153, wire152, wire151, reg150, reg149, reg148, (1'h0)};
  always
    @(posedge clk) begin
      reg148 <= $signed((8'had));
      reg149 <= wire146[(3'h6):(2'h3)];
      reg150 <= $unsigned($unsigned(wire147[(2'h3):(1'h1)]));
    end
  assign wire151 = (~^$signed((~wire144)));
  assign wire152 = reg150[(1'h0):(1'h0)];
  assign wire153 = {{(((~|wire147) >= wire147[(1'h1):(1'h1)]) << (|(wire152 <= wire146)))}};
endmodule
