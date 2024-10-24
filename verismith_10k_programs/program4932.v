module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire86;
  wire [(4'he):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire5,
                 wire4,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire4 = wire3[(4'hd):(1'h0)];
  assign wire5 = $signed(({wire3[(5'h11):(5'h10)]} ^ ($unsigned((wire1 >> wire1)) ?
                     wire1[(1'h0):(1'h0)] : ((wire3 ?
                         wire3 : wire0) != $unsigned(wire2)))));
  always
    @(posedge clk) begin
      reg6 <= ($signed($unsigned($unsigned((|wire2)))) < wire2[(1'h0):(1'h0)]);
      reg7 <= {(^~((+$signed(wire3)) ?
              $signed((|wire5)) : $unsigned($signed(wire2))))};
      reg8 <= $unsigned({wire1});
    end
  module9 #() modinst62 (.wire10(wire1), .wire12(wire2), .clk(clk), .wire11(wire3), .y(wire61), .wire13(wire4));
  assign wire63 = $unsigned(((wire5[(3'h4):(2'h3)] ?
                          $unsigned($signed((8'ha8))) : wire3[(2'h2):(1'h0)]) ?
                      $signed((|{wire0, wire4})) : ((reg6[(3'h7):(1'h1)] ?
                              (!reg8) : reg7[(1'h1):(1'h0)]) ?
                          ($signed((8'hab)) ?
                              {wire4} : $signed(wire1)) : ($signed(wire0) ?
                              $signed((7'h43)) : $signed(wire4)))));
  assign wire64 = ($signed((wire2[(4'hc):(4'h9)] * (((8'ha8) ?
                          reg6 : wire4) == reg7[(1'h1):(1'h0)]))) ?
                      reg6 : wire2);
  assign wire65 = {($unsigned((reg7 ?
                          (reg7 ? wire2 : (8'hb3)) : (reg6 ?
                              reg6 : wire0))) * $unsigned(($unsigned((8'h9f)) == {wire2}))),
                      (-((wire63[(3'h5):(1'h1)] <= $signed(wire4)) ?
                          (8'ha4) : {wire5[(3'h4):(1'h1)], {(8'ha5), wire4}}))};
  assign wire66 = wire63;
  assign wire67 = (|(wire1[(4'h9):(1'h0)] ?
                      (wire64[(3'h6):(3'h4)] << $signed({reg8})) : $signed((+wire66[(3'h4):(1'h1)]))));
  assign wire68 = ($signed($signed($signed((wire0 ?
                      reg6 : (8'hb2))))) || (($signed(wire64[(3'h6):(1'h0)]) != {wire2,
                          (wire5 ? wire0 : wire4)}) ?
                      wire66 : {(wire0 ? (~^wire1) : (~|wire63))}));
  assign wire69 = reg6;
  assign wire70 = $unsigned(($unsigned(wire69) >>> wire0));
  assign wire71 = $unsigned((-{$signed((!wire0)),
                      {{reg7, reg7}, wire2[(3'h6):(1'h0)]}}));
  module72 #() modinst87 (wire86, clk, wire3, wire64, wire63, reg6, wire4);
  assign wire88 = (((((reg6 + wire71) ? wire71[(3'h7):(3'h7)] : {(8'hb2)}) ?
                              wire1 : (~^wire63[(1'h0):(1'h0)])) ?
                          $signed($unsigned(wire71)) : $unsigned($unsigned((7'h40)))) ?
                      (~&wire86[(3'h6):(1'h0)]) : (~&{((reg7 ?
                                  wire86 : wire67) ?
                              wire63 : (wire67 ~^ wire68))}));
  assign wire89 = {reg7};
  assign wire90 = ((wire61 ?
                          ({(&wire86)} ?
                              wire86[(3'h7):(3'h7)] : wire3[(5'h11):(4'h9)]) : {(~&$signed((8'hbb)))}) ?
                      ({$unsigned({wire70}), wire61} ?
                          {(^$unsigned(wire67))} : $unsigned(wire89)) : reg8[(4'hc):(1'h1)]);
endmodule

module module72
#(parameter param84 = {((~&(~^((8'ha9) ? (8'h9f) : (8'ha2)))) == (~((8'ha8) ^ (~|(8'ha2))))), (((~((8'hae) ? (8'ha0) : (7'h41))) * (((8'hbb) ? (8'h9f) : (8'ha6)) ? (~(8'hbd)) : ((7'h43) ? (8'hbf) : (8'hb5)))) ? (((8'ha8) ? ((8'hbb) ? (8'hac) : (8'hb7)) : ((8'haf) >> (8'ha7))) ? ((~(8'ha6)) ? ((8'h9d) ? (8'hbf) : (8'ha3)) : ((8'haa) - (8'ha4))) : (((8'hab) ? (8'ha6) : (8'ha8)) ? {(8'hbd), (8'hb2)} : {(8'ha4)})) : (&((^~(8'hb1)) && ((8'h9d) <<< (8'hab)))))}, 
parameter param85 = (param84 ? (!(param84 ? (param84 ? (param84 && param84) : param84) : (8'ha4))) : param84))
(y, clk, wire77, wire76, wire75, wire74, wire73);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire77;
  input wire signed [(2'h3):(1'h0)] wire76;
  input wire signed [(3'h5):(1'h0)] wire75;
  input wire signed [(4'h8):(1'h0)] wire74;
  input wire [(4'he):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire78;
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  assign y = {wire83, wire82, wire81, wire80, wire78, reg79, (1'h0)};
  assign wire78 = $unsigned((((!((8'ha4) ? wire73 : wire77)) ?
                          $unsigned(wire74[(2'h2):(1'h0)]) : (~|(wire77 | wire74))) ?
                      $unsigned($unsigned(wire75[(1'h1):(1'h1)])) : ($signed((&(8'h9e))) + {wire75[(3'h4):(1'h0)],
                          $signed(wire77)})));
  always
    @(posedge clk) begin
      reg79 <= (~|{{(^~(wire76 ? wire75 : (8'hab)))},
          (~^$signed((wire74 ? wire76 : (8'hac))))});
    end
  assign wire80 = wire74[(3'h6):(1'h1)];
  assign wire81 = reg79[(1'h1):(1'h1)];
  assign wire82 = wire78[(3'h5):(3'h4)];
  assign wire83 = wire78;
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire53;
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  assign y = {wire60, wire56, wire55, wire53, reg59, reg58, reg57, (1'h0)};
  module14 #() modinst54 (.wire16(wire11), .wire18(wire10), .wire17(wire13), .wire15(wire12), .y(wire53), .clk(clk));
  assign wire55 = wire13[(4'hd):(3'h5)];
  assign wire56 = (wire13 != wire11);
  always
    @(posedge clk) begin
      reg57 <= ($unsigned(wire13[(1'h0):(1'h0)]) & wire10[(4'h9):(1'h0)]);
      reg58 <= $signed(reg57);
      reg59 <= (($unsigned(($signed(wire10) >>> wire56[(1'h0):(1'h0)])) > $signed($signed((wire12 ?
              (8'h9f) : wire12)))) ?
          ($unsigned(wire55[(4'hc):(4'hb)]) ?
              (wire12 ?
                  wire12[(4'hc):(1'h0)] : $signed(reg57)) : $signed((((8'had) & wire11) ?
                  wire11 : {reg58, wire10}))) : {(wire13 | {(reg57 ?
                      wire13 : reg58),
                  (wire55 > wire11)}),
              reg57[(4'hb):(3'h5)]});
    end
  assign wire60 = $signed((-(^~reg57)));
endmodule

module module14
#(parameter param52 = (^((|(((8'ha8) ? (8'hba) : (8'hb0)) * (^~(8'ha3)))) && ((((8'h9f) ? (8'ha5) : (8'haf)) & ((8'ha0) ? (8'haf) : (8'hb7))) >>> ({(8'hba), (8'haa)} == (~(8'hb6)))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  input wire [(4'hd):(1'h0)] wire16;
  input wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire19;
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire35,
                 wire34,
                 wire33,
                 wire26,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire19 = (wire17[(3'h6):(2'h2)] ~^ $unsigned($unsigned(((wire17 ?
                      wire16 : wire18) & (wire18 ? wire17 : wire17)))));
  assign wire20 = {(wire17 >= (|(8'hbf))), wire18[(3'h5):(2'h3)]};
  assign wire21 = wire16[(2'h2):(1'h1)];
  assign wire22 = (&$signed(wire17));
  assign wire23 = {(|$unsigned(wire22))};
  always
    @(posedge clk) begin
      reg24 <= (wire20[(4'ha):(4'h9)] ? wire19 : wire16);
      reg25 <= wire17[(3'h5):(1'h1)];
    end
  assign wire26 = (8'h9c);
  always
    @(posedge clk) begin
      if ($unsigned(wire16))
        begin
          if ($unsigned((($signed((|reg25)) ?
              (+(8'hab)) : ((~|wire19) ~^ reg25)) < ((~&$signed(wire23)) ?
              wire23 : ((reg24 + (7'h43)) * wire23[(4'ha):(4'ha)])))))
            begin
              reg27 <= wire15;
              reg28 <= {{wire15}};
              reg29 <= $signed(wire23[(1'h1):(1'h0)]);
            end
          else
            begin
              reg27 <= ((~reg25) & (~&reg24));
              reg28 <= wire19[(3'h7):(1'h0)];
              reg29 <= $unsigned($unsigned((^~wire22[(4'hb):(2'h2)])));
              reg30 <= {(8'had), {(8'ha4), (7'h40)}};
            end
        end
      else
        begin
          reg27 <= (-$signed({$unsigned($signed(wire23)),
              ((wire20 ? wire15 : reg28) <= $signed(reg30))}));
          reg28 <= $signed(reg30);
          reg29 <= wire22[(4'hb):(1'h0)];
          reg30 <= wire18;
          reg31 <= ($unsigned((&wire21)) ? reg27 : (8'hbd));
        end
      reg32 <= $unsigned(wire18[(3'h4):(1'h0)]);
    end
  assign wire33 = wire17[(1'h1):(1'h0)];
  assign wire34 = wire20[(4'he):(4'ha)];
  assign wire35 = wire18;
  always
    @(posedge clk) begin
      reg36 <= (reg32 == $signed($unsigned((wire22[(1'h1):(1'h0)] ?
          wire33 : (~wire21)))));
      if ($unsigned(((^~($signed((8'hb0)) ?
          (wire35 << wire15) : ((8'hac) ? reg36 : reg24))) <<< (|{(8'ha8)}))))
        begin
          reg37 <= reg31[(3'h4):(2'h3)];
          reg38 <= ($unsigned($signed(((wire15 ? (8'hbd) : wire26) ?
                  (-wire33) : wire15[(3'h6):(3'h4)]))) ?
              (reg30 ?
                  (^(|$unsigned(wire35))) : reg28) : {$unsigned($unsigned((reg30 ?
                      wire15 : wire34)))});
          reg39 <= wire19[(3'h6):(1'h1)];
          reg40 <= reg37[(3'h4):(1'h0)];
          reg41 <= $unsigned((~|$signed(wire22)));
        end
      else
        begin
          if (reg24)
            begin
              reg37 <= ((+wire35) ?
                  (reg29[(4'h8):(1'h1)] | {$unsigned({reg24, wire35}),
                      $unsigned(reg27)}) : wire15[(1'h0):(1'h0)]);
            end
          else
            begin
              reg37 <= reg37;
              reg38 <= wire18[(3'h5):(3'h4)];
              reg39 <= (~|($unsigned($unsigned((~|wire33))) ?
                  (((wire18 ~^ wire18) ?
                      $unsigned(reg24) : reg30) != $unsigned({reg36,
                      reg28})) : $signed($unsigned(wire17[(2'h2):(1'h0)]))));
            end
          reg40 <= ((wire17[(2'h3):(1'h0)] << (reg32[(4'hf):(2'h3)] ?
              $signed((~|reg29)) : (8'haf))) ^ ((($signed(reg27) ?
                      $unsigned(wire35) : reg40[(4'hd):(3'h5)]) ?
                  (reg38 ?
                      $unsigned(wire16) : (|reg41)) : reg40[(4'h9):(3'h6)]) ?
              (8'hb9) : (wire18[(3'h4):(2'h2)] ?
                  (7'h41) : (!$unsigned(reg31)))));
        end
      reg42 <= ($signed($unsigned($unsigned({(8'hb3),
          reg38}))) + (^~($signed((8'h9e)) ?
          reg28[(4'hb):(1'h1)] : $unsigned((wire18 + wire20)))));
      reg43 <= reg37;
      reg44 <= ($unsigned((reg32[(2'h2):(2'h2)] == reg27[(2'h3):(1'h1)])) ?
          {reg38[(4'hf):(3'h7)], $signed({(~&reg43)})} : reg24);
    end
  assign wire45 = ((wire22[(2'h3):(2'h2)] ?
                      wire16 : reg44[(2'h3):(2'h3)]) ^~ $signed($signed(reg36)));
  assign wire46 = $signed(({reg42,
                      (~$signed(wire34))} + {($unsigned((8'h9c)) <<< (^reg42))}));
  assign wire47 = {(!reg37[(3'h4):(2'h3)])};
  assign wire48 = $unsigned(wire22[(4'h8):(1'h1)]);
  assign wire49 = (+reg37);
  assign wire50 = $signed(((~(^wire34[(4'h8):(3'h7)])) ?
                      reg25 : (^$unsigned(wire45))));
  assign wire51 = $unsigned(((7'h40) ?
                      ((-$signed(wire49)) ?
                          (wire26[(2'h3):(2'h2)] ?
                              (wire19 * wire18) : wire45[(3'h5):(2'h3)]) : $signed($signed(reg41))) : (8'haa)));
endmodule
