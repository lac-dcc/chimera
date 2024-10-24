module top
#(parameter param103 = (({(((8'hb0) ? (8'hb5) : (8'hb6)) ? (|(8'hb9)) : ((7'h42) ? (8'ha3) : (8'h9e))), (|((7'h41) > (8'ha1)))} ^ ((((8'hb4) << (8'hb4)) << {(8'haf), (8'hb8)}) == ((^(8'hbf)) ? (-(8'hbc)) : ((8'hae) ? (8'hbf) : (8'hb9))))) << (7'h42)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire102;
  wire [(4'hb):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire100;
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire102, wire4, wire5, wire6, wire100, reg9, reg8, reg7, (1'h0)};
  assign wire4 = $signed({{(wire0 ?
                             (wire2 ? wire0 : wire3) : wire1[(1'h1):(1'h1)]),
                         {{wire3, wire1}}},
                     ($unsigned($signed(wire3)) <<< {{wire2, wire2}})});
  assign wire5 = wire2[(1'h1):(1'h1)];
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= $signed(wire0[(4'hd):(4'h8)]);
      reg8 <= {wire1};
      reg9 <= reg7;
    end
  module10 #() modinst101 (.wire14(wire3), .wire12(wire2), .wire13(reg9), .wire11(wire5), .clk(clk), .y(wire100), .wire15(reg7));
  assign wire102 = wire6[(4'hb):(2'h2)];
endmodule

module module10
#(parameter param98 = (^~{{({(7'h42)} * {(8'hb0), (7'h44)})}, (((!(7'h40)) ^~ (!(7'h43))) << (~|((8'h9c) <= (8'hb4))))}), 
parameter param99 = ((8'hb8) ^~ ((((!param98) ? (&param98) : (param98 ? param98 : (8'hbc))) != ((8'hbf) ? (~param98) : (param98 ? param98 : (8'ha8)))) & (((param98 ? param98 : param98) ? (~&(8'hb4)) : ((8'had) ? param98 : param98)) ? ({param98, param98} ? (param98 + param98) : param98) : param98))))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire96;
  wire signed [(3'h4):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire77;
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  assign y = {wire96,
                 wire94,
                 wire79,
                 wire17,
                 wire18,
                 wire23,
                 wire24,
                 wire25,
                 wire46,
                 wire77,
                 reg97,
                 reg16,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= wire11[(3'h6):(3'h4)];
    end
  assign wire17 = $signed($unsigned($signed(($signed(wire13) <= wire13))));
  assign wire18 = wire11[(5'h10):(4'hd)];
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire14[(3'h4):(2'h2)]);
      reg20 <= $signed($unsigned(wire11[(3'h7):(2'h2)]));
      reg21 <= (wire15[(3'h5):(2'h3)] <= wire12[(5'h12):(3'h7)]);
      reg22 <= {wire18[(3'h4):(2'h3)],
          (reg16 ?
              ($unsigned(((8'had) < wire13)) | $signed((+reg19))) : (8'ha6))};
    end
  assign wire23 = $signed((&$signed(((wire18 | wire12) - $signed(wire13)))));
  assign wire24 = wire17[(5'h12):(1'h0)];
  assign wire25 = $unsigned(wire13[(3'h7):(3'h7)]);
  module26 #() modinst47 (wire46, clk, wire17, wire18, wire24, wire15);
  module48 #() modinst78 (wire77, clk, wire23, reg22, reg16, wire46, wire14);
  assign wire79 = reg21[(2'h3):(1'h1)];
  module80 #() modinst95 (.wire85(wire13), .wire84(reg19), .wire82(wire14), .clk(clk), .y(wire94), .wire83(wire25), .wire81(wire24));
  assign wire96 = ($signed($unsigned(wire23[(1'h0):(1'h0)])) | $signed((!$unsigned(wire15[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      reg97 <= $signed(((wire94[(2'h2):(1'h0)] ?
          wire14[(4'h8):(2'h3)] : reg20[(3'h4):(2'h3)]) || ((&(~^wire77)) ^ $unsigned(wire18[(3'h5):(2'h2)]))));
    end
endmodule

module module80  (y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire85;
  input wire [(3'h7):(1'h0)] wire84;
  input wire signed [(3'h4):(1'h0)] wire83;
  input wire signed [(4'hb):(1'h0)] wire82;
  input wire signed [(5'h12):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire88;
  wire [(4'h8):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire86;
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 (1'h0)};
  assign wire86 = wire82[(4'h8):(2'h2)];
  assign wire87 = (8'hbf);
  assign wire88 = wire82;
  assign wire89 = wire81;
  assign wire90 = ((^~($unsigned({wire84}) ^~ wire87[(3'h5):(3'h4)])) ?
                      $signed((+(((8'hae) <= wire84) ^~ (|wire87)))) : $signed(({{wire81}} ?
                          ((wire89 ? wire84 : (8'hb9)) ?
                              $signed(wire89) : (^~(8'had))) : $unsigned((wire88 ?
                              wire81 : wire82)))));
  assign wire91 = wire87;
  assign wire92 = $signed($unsigned(wire84));
  assign wire93 = (^~$unsigned($signed($unsigned((wire82 ? wire84 : wire82)))));
endmodule

module module48
#(parameter param76 = ((8'hb2) << (~(+(^((8'hba) ~^ (8'hb7)))))))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire53;
  input wire [(4'h9):(1'h0)] wire52;
  input wire signed [(3'h5):(1'h0)] wire51;
  input wire signed [(4'ha):(1'h0)] wire50;
  input wire [(4'hb):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire54 = wire51;
  assign wire55 = $unsigned({$signed((wire50[(3'h5):(2'h2)] >>> wire50[(4'h9):(3'h4)])),
                      $signed($signed(wire53))});
  assign wire56 = $signed((wire52[(1'h0):(1'h0)] << {wire55[(3'h5):(2'h3)],
                      wire49}));
  assign wire57 = $unsigned($signed((^wire56[(3'h6):(2'h2)])));
  assign wire58 = (^$signed(wire55));
  assign wire59 = (wire55 ? $unsigned((+wire55)) : (8'ha1));
  always
    @(posedge clk) begin
      reg60 <= ((wire51 <= (^$unsigned($unsigned(wire52)))) ?
          $unsigned(wire58) : wire52[(4'h8):(3'h6)]);
      reg61 <= wire53[(4'hd):(4'hc)];
    end
  assign wire62 = $signed(wire52);
  assign wire63 = reg61;
  assign wire64 = ($signed((wire62[(5'h13):(4'h8)] ?
                      $signed((wire51 ?
                          wire49 : wire51)) : $unsigned((wire49 >> wire50)))) ^ (wire57 ?
                      wire62[(4'hb):(4'hb)] : (~|((+wire51) & wire55[(2'h2):(1'h1)]))));
  assign wire65 = (!((wire54 <= ({reg61} || $signed(wire56))) >> wire53));
  assign wire66 = wire65;
  assign wire67 = $signed(((|$unsigned(reg60)) ?
                      (wire56[(3'h4):(2'h3)] ^~ (~&wire62[(5'h14):(4'hc)])) : wire66[(4'h8):(3'h7)]));
  always
    @(posedge clk) begin
      reg68 <= (~^(8'h9f));
    end
  always
    @(posedge clk) begin
      reg69 <= ((^reg60[(4'h8):(1'h1)]) ? wire66 : wire66[(4'ha):(1'h0)]);
      reg70 <= $unsigned($signed(reg69));
      if (($unsigned(wire62) << wire57[(3'h6):(2'h3)]))
        begin
          reg71 <= $signed(($signed($unsigned($unsigned(wire56))) ?
              wire53[(3'h5):(3'h4)] : $unsigned(((wire62 ? wire50 : wire53) ?
                  $signed(wire54) : $unsigned(wire59)))));
        end
      else
        begin
          reg71 <= ({$unsigned($signed($signed(wire62)))} ?
              ($signed({(wire65 * wire62), (8'ha5)}) ?
                  $unsigned((^(wire49 < wire59))) : wire53) : {wire50[(4'h8):(1'h1)]});
          reg72 <= reg61;
          reg73 <= wire53[(4'h9):(4'h9)];
        end
    end
  assign wire74 = (~^reg73);
  assign wire75 = reg69;
endmodule

module module26
#(parameter param45 = (~|((8'ha0) << (((|(7'h42)) >> ((8'hbd) ? (8'ha3) : (7'h43))) != (~((8'ha5) ? (8'ha3) : (8'hb4)))))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  input wire [(5'h15):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire31;
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire31,
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
                 (1'h0)};
  assign wire31 = ((^~$signed((7'h43))) ^~ {$unsigned(((wire30 ?
                              wire30 : (8'hbc)) ?
                          (!wire28) : (|wire30)))});
  always
    @(posedge clk) begin
      reg32 <= wire31[(4'hb):(3'h7)];
      reg33 <= (+$signed($signed((wire27[(2'h2):(1'h0)] >>> (wire28 ?
          wire27 : wire31)))));
      reg34 <= wire29[(3'h5):(1'h0)];
      if ((wire30 ?
          (-(reg34[(4'hb):(3'h5)] ?
              $signed((wire29 ?
                  wire31 : (8'ha6))) : (~reg33))) : $signed((^((!wire29) ?
              wire29[(2'h3):(2'h3)] : ((8'ha4) ? wire31 : (8'h9d)))))))
        begin
          if ($unsigned((($unsigned({reg33, (8'h9d)}) ?
                  (^$unsigned(wire27)) : wire28) ?
              reg32[(4'ha):(4'h8)] : (^~$unsigned($unsigned(wire30))))))
            begin
              reg35 <= $unsigned(($unsigned({$unsigned(wire27)}) <<< $signed(wire27)));
              reg36 <= wire27;
              reg37 <= $signed((&(^~(~|reg34[(3'h5):(3'h4)]))));
              reg38 <= wire30[(3'h7):(3'h4)];
              reg39 <= wire30;
            end
          else
            begin
              reg35 <= $signed($unsigned(wire30));
              reg36 <= reg38;
              reg37 <= {(-($unsigned((|wire28)) != reg36)),
                  ({wire27[(4'hf):(4'hf)], {reg33, $unsigned(reg39)}} ?
                      ($signed($unsigned(reg35)) < $unsigned($unsigned((8'hb9)))) : $signed(($unsigned(reg34) ?
                          $unsigned(wire27) : $signed(reg35))))};
            end
          reg40 <= $signed($unsigned(({{(8'ha8), (7'h42)},
              $unsigned(wire30)} != reg34[(4'hb):(3'h5)])));
          reg41 <= {(reg35 || (({wire27, reg37} != $unsigned(reg36)) ?
                  (-(reg33 || reg33)) : (reg34[(3'h6):(3'h4)] ?
                      $unsigned(wire27) : ((8'hb0) ? reg34 : wire28)))),
              $unsigned((^($unsigned((8'ha7)) ?
                  (wire28 ? reg33 : reg35) : reg37)))};
        end
      else
        begin
          if (((($unsigned(reg34[(4'hc):(3'h7)]) >= (+(reg33 ?
                  wire31 : wire28))) ?
              {((reg33 ? wire29 : wire27) && wire28),
                  (8'hab)} : $signed(reg39)) | ($unsigned(reg33[(1'h0):(1'h0)]) != $signed((((8'ha9) ?
              (7'h40) : reg32) >>> (reg33 ? (8'h9d) : reg40))))))
            begin
              reg35 <= (($signed($signed(wire28)) << (reg40[(1'h1):(1'h1)] == reg38[(2'h2):(2'h2)])) ?
                  {$unsigned($signed((8'hb8)))} : reg32[(1'h0):(1'h0)]);
              reg36 <= $signed($unsigned((~(reg40[(2'h2):(1'h1)] ?
                  (+wire28) : (reg36 <<< wire29)))));
            end
          else
            begin
              reg35 <= $unsigned({wire27[(5'h12):(1'h0)]});
            end
          reg37 <= (reg34 > reg34);
        end
    end
  assign wire42 = reg35;
  assign wire43 = $signed(((|({reg39, reg38} > wire28[(3'h4):(3'h4)])) ?
                      (&$signed($signed((8'h9f)))) : {wire42,
                          $signed({(8'ha6)})}));
  assign wire44 = $unsigned((-((8'hb7) >> ((wire28 ? reg38 : reg36) ?
                      reg35 : (reg38 < reg36)))));
endmodule
