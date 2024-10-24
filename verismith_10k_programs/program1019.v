module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h223):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire83;
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  assign y = {wire114,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire5,
                 wire13,
                 wire14,
                 wire15,
                 wire83,
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
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire5 = {{$signed(((!wire3) ? wire4 : $signed(wire2))),
                         ((+$unsigned(wire2)) ?
                             ((8'ha7) ?
                                 {wire1, (8'hb1)} : (wire1 ?
                                     wire0 : wire2)) : {wire2})},
                     wire1};
  always
    @(posedge clk) begin
      reg6 <= (~|wire5[(5'h10):(3'h6)]);
      if ((wire4[(4'ha):(3'h7)] ?
          ($signed($unsigned((^wire3))) ?
              $unsigned(wire3[(4'h8):(1'h1)]) : $unsigned($signed(wire2[(4'h9):(4'h9)]))) : ({$signed($signed(wire5))} ?
              (~^$signed((wire2 ? reg6 : wire2))) : (($signed(wire5) ?
                      wire1[(3'h7):(2'h3)] : $signed(reg6)) ?
                  (((8'h9d) <<< reg6) ?
                      (wire4 ? wire0 : reg6) : $unsigned(wire4)) : wire3))))
        begin
          reg7 <= $signed(((($signed(reg6) ?
                  (wire5 ? wire5 : wire1) : $signed(wire3)) == (wire4 ?
                  wire0[(5'h13):(4'h9)] : $signed(reg6))) ?
              (&(!(+wire1))) : (~&(~|(|wire0)))));
          reg8 <= (reg6[(3'h4):(2'h2)] << ((reg6[(4'ha):(4'h8)] < wire2) ?
              $signed($unsigned((wire4 ?
                  wire3 : wire5))) : $unsigned(($unsigned(wire2) ?
                  (~wire2) : reg7))));
          reg9 <= (+(|wire3[(3'h6):(3'h4)]));
          reg10 <= (&((wire2 >>> ({wire3, reg7} ^ {reg8,
              (8'ha6)})) >= $unsigned(($signed(wire0) < $signed(wire0)))));
          reg11 <= ({$unsigned({$signed(wire3), (~(7'h42))}),
                  ((wire4 ?
                      (wire1 ^~ wire1) : {wire5}) & $signed(reg6[(3'h6):(3'h5)]))} ?
              ({wire5} ?
                  $unsigned((wire0[(3'h7):(1'h1)] ?
                      reg10 : reg6)) : (^~{reg10[(4'h9):(3'h7)]})) : ((((wire1 ?
                          wire5 : wire2) ?
                      (wire0 && wire3) : (wire3 >> reg9)) <<< {wire3[(4'h8):(3'h5)]}) ?
                  wire3[(3'h5):(2'h3)] : (^reg7[(2'h3):(1'h0)])));
        end
      else
        begin
          reg7 <= {wire4,
              ((reg11[(1'h0):(1'h0)] >>> $unsigned($signed(wire4))) ?
                  $signed($signed(reg11)) : (^$unsigned(reg6[(1'h0):(1'h0)])))};
        end
      reg12 <= reg8[(3'h6):(1'h1)];
    end
  assign wire13 = $signed(reg7[(4'hc):(2'h3)]);
  assign wire14 = (((+(wire3[(2'h2):(2'h2)] ?
                      wire0 : wire13[(1'h0):(1'h0)])) < $unsigned($unsigned((|wire4)))) ~^ $unsigned(wire4[(3'h4):(1'h0)]));
  assign wire15 = reg11[(1'h1):(1'h0)];
  module16 #() modinst84 (.y(wire83), .wire17(reg8), .wire20(wire13), .clk(clk), .wire18(reg11), .wire19(reg9));
  assign wire85 = ((~^(!$signed((!wire13)))) > (({wire2,
                          (~^wire1)} * (~&(reg9 * wire0))) ?
                      reg12[(1'h0):(1'h0)] : reg12));
  assign wire86 = (wire83 ?
                      ((wire15 <= wire0) != reg7[(2'h3):(1'h1)]) : $signed($signed($signed($signed(wire14)))));
  assign wire87 = wire83;
  assign wire88 = (8'h9d);
  assign wire89 = (wire2[(4'h9):(1'h0)] <= (&reg9[(4'hf):(4'ha)]));
  always
    @(posedge clk) begin
      reg90 <= $signed((8'h9c));
      reg91 <= {reg6,
          {(wire88 ? (wire13 != wire5) : ({wire3, reg10} | (&reg10))),
              ({(reg12 >= wire5)} ?
                  $signed((wire5 ? (8'hb6) : wire4)) : wire88[(3'h4):(3'h4)])}};
      if (((reg6[(2'h2):(1'h0)] ?
              ((((8'h9f) == wire4) ?
                  (wire5 ~^ wire89) : reg7[(4'h8):(1'h1)]) && (^~(reg12 ?
                  (8'ha9) : wire83))) : (^(reg90[(1'h0):(1'h0)] != wire15))) ?
          (wire14 ?
              ((8'hb2) != ($unsigned((8'haa)) - {wire15})) : (~((wire87 ?
                  (8'hb1) : wire83) >= (^reg11)))) : $unsigned((^~$signed(reg6[(3'h4):(2'h3)])))))
        begin
          if ($signed($signed({reg8})))
            begin
              reg92 <= ((wire88[(3'h6):(3'h5)] ?
                      $signed(reg10[(4'hd):(4'hd)]) : $unsigned({$unsigned(reg6),
                          (wire15 ? wire1 : (8'ha0))})) ?
                  ((|((wire3 ? reg90 : wire85) & (reg12 & (8'hbe)))) ?
                      (8'ha1) : wire5[(3'h4):(1'h1)]) : ({(~|$signed(wire89)),
                      {(wire88 - wire2)}} <= (+(^~(~&wire14)))));
              reg93 <= reg7[(1'h0):(1'h0)];
              reg94 <= ((&{reg6, (reg9 ? wire85 : reg90[(2'h2):(2'h2)])}) ?
                  wire89[(4'h8):(3'h7)] : ($unsigned(($unsigned(wire4) + (wire86 ?
                          wire85 : reg8))) ?
                      wire86[(2'h3):(1'h0)] : wire13[(4'hb):(4'ha)]));
            end
          else
            begin
              reg92 <= wire13[(4'h9):(2'h3)];
              reg93 <= reg93[(4'hd):(4'ha)];
              reg94 <= wire87;
            end
          if (($unsigned($signed(((wire88 ? wire5 : wire0) ?
              reg91 : $signed(wire89)))) != $signed(reg92[(3'h5):(3'h4)])))
            begin
              reg95 <= {$signed(wire0[(4'hf):(2'h2)]),
                  ($unsigned(($signed(reg10) ?
                          $signed(wire1) : ((8'hae) - wire83))) ?
                      wire0[(4'h9):(2'h2)] : $unsigned($signed((&wire83))))};
              reg96 <= ({wire87[(3'h6):(2'h3)],
                  reg11} - ((~$unsigned({(8'hae)})) < $signed(($unsigned(wire13) ?
                  (wire15 >= wire86) : $signed(reg12)))));
              reg97 <= (!{wire2, (^~(8'h9d))});
              reg98 <= ($unsigned($signed(wire14)) != ((8'hbb) ?
                  (~&reg92) : reg95[(1'h1):(1'h1)]));
            end
          else
            begin
              reg95 <= (((-$unsigned({reg98})) ?
                  (reg92 ~^ {reg11[(2'h2):(2'h2)]}) : (((reg91 - wire4) ?
                      $unsigned((8'ha8)) : wire86[(4'h8):(2'h2)]) >>> $unsigned($signed((7'h44))))) == (^~reg95[(2'h2):(1'h0)]));
              reg96 <= $signed(wire5[(4'h8):(3'h7)]);
              reg97 <= $signed($signed($unsigned(wire14[(5'h10):(4'he)])));
              reg98 <= reg9;
            end
          if ($unsigned(wire87[(4'hb):(2'h2)]))
            begin
              reg99 <= wire3[(3'h4):(3'h4)];
              reg100 <= (&($unsigned($unsigned(reg96)) ?
                  (^{((8'hae) ? wire87 : reg90), (-reg97)}) : $signed((wire2 ?
                      reg94 : reg12))));
            end
          else
            begin
              reg99 <= ({$signed((((8'hb1) ?
                          reg90 : reg94) != wire1[(3'h4):(2'h3)]))} ?
                  (~^$signed($unsigned((!wire88)))) : (wire0[(1'h1):(1'h0)] ?
                      $unsigned(wire89[(3'h5):(2'h3)]) : $signed(wire15)));
              reg100 <= wire87;
              reg101 <= ($signed($unsigned($unsigned(wire86[(4'h8):(4'h8)]))) ?
                  {(~&$signed($unsigned(reg92)))} : $signed((!wire3[(2'h2):(2'h2)])));
              reg102 <= (~&$signed($unsigned($unsigned(reg99[(4'hc):(2'h2)]))));
              reg103 <= (|$unsigned(((reg100[(3'h5):(3'h5)] ?
                      $unsigned(reg99) : {reg11}) ?
                  reg91 : (reg99 ? $unsigned((8'hb4)) : $signed(wire13)))));
            end
          reg104 <= ({wire5[(4'h9):(1'h1)], (8'hbd)} ?
              $signed($signed((reg98 == {reg6,
                  reg103}))) : ($unsigned({wire14[(4'h8):(4'h8)]}) ?
                  {reg90} : reg101));
          reg105 <= reg90[(3'h6):(2'h2)];
        end
      else
        begin
          reg92 <= reg91;
          if ((^((wire88[(4'hb):(3'h6)] <<< ($signed(reg11) ?
                  (reg92 + reg6) : {reg90})) ?
              reg10[(2'h3):(2'h2)] : $signed(reg90[(3'h4):(2'h2)]))))
            begin
              reg93 <= {{$unsigned({(reg93 < reg98)}), reg92[(3'h5):(2'h3)]},
                  (^~($signed((wire14 ?
                      reg101 : (8'hb8))) - $signed((~^reg6))))};
            end
          else
            begin
              reg93 <= $unsigned(reg97[(4'hb):(3'h6)]);
              reg94 <= ($unsigned((($signed(wire85) ?
                      (reg102 ? reg105 : reg101) : $signed((8'ha1))) ?
                  reg9[(5'h11):(4'h9)] : ({reg101} && {(8'hb4)}))) + reg97[(3'h6):(1'h1)]);
            end
          reg95 <= ($signed((~^((reg99 > wire3) ?
                  wire83 : (wire87 > wire86)))) ?
              ({(+((8'ha3) ? reg9 : wire15)), $signed(wire14[(2'h3):(2'h2)])} ?
                  ({(8'hac), (reg96 & (8'h9e))} ?
                      $signed(reg105[(3'h5):(1'h1)]) : reg97[(2'h2):(1'h1)]) : (+reg102[(1'h1):(1'h1)])) : (^~($signed(wire87) & (wire13[(4'ha):(2'h3)] && reg100[(2'h2):(2'h2)]))));
          reg96 <= ((reg92[(3'h6):(3'h6)] <<< ({(^~(8'h9d))} ~^ $unsigned((-reg98)))) >> reg92);
        end
      if ((((8'hb8) ? $unsigned(reg104[(3'h6):(3'h4)]) : $unsigned(reg12)) ?
          $unsigned((~&(&(^reg97)))) : $unsigned(wire88[(3'h5):(2'h2)])))
        begin
          reg106 <= (~|(~reg8[(5'h13):(4'h9)]));
          reg107 <= reg100;
          reg108 <= $signed((~&$unsigned($unsigned($unsigned(wire15)))));
        end
      else
        begin
          if ($unsigned(reg10[(4'hd):(3'h7)]))
            begin
              reg106 <= $unsigned($signed($unsigned($unsigned($signed(wire15)))));
              reg107 <= wire5;
            end
          else
            begin
              reg106 <= {(~&((((8'hb2) ? wire2 : reg93) >>> $signed((8'hac))) ?
                      ((wire85 ~^ reg103) ?
                          $signed(reg104) : $unsigned(wire89)) : {reg97[(3'h5):(1'h0)]})),
                  (~{((|reg107) ? $unsigned(wire3) : $signed((8'ha4))),
                      $signed($unsigned(wire83))})};
              reg107 <= wire83[(3'h5):(1'h0)];
              reg108 <= reg106;
            end
          if ($signed((wire88[(2'h3):(1'h1)] ?
              wire83[(4'hd):(3'h4)] : {wire15})))
            begin
              reg109 <= {$signed(reg98[(4'hd):(1'h1)]), wire4[(4'h8):(4'h8)]};
              reg110 <= $unsigned(reg90);
              reg111 <= (^reg101[(2'h3):(1'h0)]);
              reg112 <= (^(reg91 <= ($unsigned((reg10 << (8'hbb))) ?
                  reg12[(4'hd):(4'ha)] : (reg8[(4'hb):(3'h7)] ?
                      ((8'h9d) ? reg102 : wire13) : wire87))));
              reg113 <= $signed((($unsigned(reg99) - $signed($unsigned(wire3))) ?
                  $signed(((8'hb4) & $signed(reg112))) : $unsigned(reg6[(4'h8):(2'h3)])));
            end
          else
            begin
              reg109 <= reg11;
            end
        end
    end
  assign wire114 = $signed(reg95);
endmodule

module module16
#(parameter param82 = (8'hac))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire51;
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire54,
                 wire53,
                 wire51,
                 (1'h0)};
  module21 #() modinst52 (.wire22(wire17), .wire24(wire19), .clk(clk), .wire25(wire20), .y(wire51), .wire23(wire18));
  assign wire53 = $signed(wire19[(1'h1):(1'h1)]);
  assign wire54 = $unsigned(wire51);
  module55 #() modinst76 (wire75, clk, wire19, wire53, wire54, wire18);
  assign wire77 = $unsigned({((wire19[(4'hb):(2'h2)] ?
                          (!wire18) : $unsigned(wire75)) | wire17[(5'h10):(4'hf)]),
                      (~|((^wire19) ?
                          $signed(wire19) : (wire75 ? wire19 : wire20)))});
  assign wire78 = ((wire54[(3'h4):(2'h2)] ^ (+(7'h40))) || wire53);
  assign wire79 = (-wire20[(4'h9):(2'h3)]);
  assign wire80 = (wire18[(3'h7):(1'h1)] || wire20);
  assign wire81 = $signed($signed((-{{(8'ha0), wire19}})));
endmodule

module module55
#(parameter param74 = ((((((8'hac) - (8'hbb)) ? {(8'hb7)} : (!(8'hae))) != (((8'hb0) != (8'hb2)) > ((8'ha5) ? (8'hbc) : (8'ha7)))) ? ((&((8'hb2) ^ (8'hb2))) ? (8'hae) : (((8'hb9) ~^ (8'haf)) ? (~&(8'h9e)) : ((8'ha4) ? (7'h43) : (8'hb1)))) : (!(((8'ha9) ? (8'hbe) : (8'hae)) >> (7'h41)))) > (|(8'hbc))))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire59;
  input wire signed [(3'h7):(1'h0)] wire58;
  input wire [(3'h6):(1'h0)] wire57;
  input wire signed [(4'hb):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire [(3'h5):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire61,
                 wire60,
                 reg73,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire60 = (($signed({(wire59 >> wire59),
                          $unsigned(wire56)}) <<< wire58) ?
                      $signed(({(-(8'hb0)), wire56} ^~ ((wire59 ?
                          wire59 : wire59) > (~wire56)))) : ($signed(wire56) ?
                          {$signed(wire59),
                              $signed(wire56)} : (($unsigned(wire56) ?
                                  (wire56 ? wire58 : wire58) : {wire57,
                                      wire58}) ?
                              wire58[(1'h1):(1'h0)] : wire56[(1'h0):(1'h0)])));
  assign wire61 = (($unsigned(((wire56 ? wire57 : wire56) ?
                          (|wire60) : wire59)) ?
                      ({$signed(wire57)} ~^ $unsigned(((8'ha8) != (8'h9e)))) : (((wire60 ?
                              wire60 : wire58) ?
                          (wire57 - wire59) : ((7'h42) == wire60)) <= (&$unsigned(wire60)))) < (wire57 << $signed(((wire58 ?
                      wire60 : wire56) <= (8'hb5)))));
  always
    @(posedge clk) begin
      reg62 <= wire60;
      reg63 <= {($signed(wire56) ? $unsigned(wire59) : reg62[(3'h7):(2'h3)]),
          (&$signed(({wire61} ?
              $signed(wire60) : (wire59 ? wire57 : wire58))))};
      reg64 <= wire60[(3'h4):(1'h1)];
      reg65 <= ({$unsigned((~(wire58 + (8'h9d)))),
          (reg63[(1'h0):(1'h0)] ?
              ({wire58} ^~ (wire58 || wire61)) : reg64)} == wire60[(4'h9):(3'h7)]);
      reg66 <= $unsigned($unsigned(wire58));
    end
  assign wire67 = $signed(reg66[(3'h7):(3'h7)]);
  assign wire68 = $unsigned($signed($signed($unsigned(reg66[(4'ha):(2'h3)]))));
  assign wire69 = ({wire58[(3'h5):(2'h3)]} ?
                      $signed((+((&wire68) ?
                          (wire56 || wire58) : (wire59 >> reg65)))) : wire61);
  assign wire70 = wire56[(1'h1):(1'h0)];
  assign wire71 = reg62;
  assign wire72 = $signed($signed((wire58[(3'h5):(1'h1)] && wire71[(3'h6):(2'h3)])));
  always
    @(posedge clk) begin
      reg73 <= reg62;
    end
endmodule

module module21
#(parameter param49 = {{{(((8'ha4) & (7'h42)) ? ((8'had) && (8'hab)) : (!(8'hac))), (((8'ha2) >= (8'hb1)) ^~ ((8'haf) ? (8'ha6) : (7'h43)))}}, (+(!((&(8'h9e)) ^~ (!(8'ha2)))))}, 
parameter param50 = (&param49))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire25;
  input wire signed [(3'h7):(1'h0)] wire24;
  input wire [(3'h6):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire26 = ($signed((8'hb4)) < (((&wire25[(2'h2):(1'h1)]) ?
                          {(8'hab), wire23} : wire22) ?
                      wire23 : ($unsigned(((8'ha2) || wire25)) < $signed((wire25 << wire24)))));
  assign wire27 = $signed(wire26[(1'h0):(1'h0)]);
  assign wire28 = (~&($signed((wire22[(4'hc):(3'h5)] ? wire27 : (~wire24))) ?
                      wire25[(4'hd):(1'h1)] : $unsigned(($unsigned(wire25) ?
                          {wire22, wire24} : (8'hb8)))));
  assign wire29 = wire26;
  assign wire30 = wire27[(2'h2):(1'h0)];
  assign wire31 = $unsigned($unsigned({($unsigned(wire23) ? (-wire24) : wire30),
                      ($unsigned(wire22) >= wire26[(1'h0):(1'h0)])}));
  assign wire32 = ($unsigned((wire29 || ((|wire22) >= (wire22 >= wire31)))) <= $signed(((wire22 ?
                      (-wire23) : (+(8'haf))) != (((8'hb1) ? (8'hae) : wire25) ?
                      $unsigned(wire22) : {wire28, wire24}))));
  assign wire33 = $signed($unsigned(wire31));
  assign wire34 = $signed((~^wire27[(1'h1):(1'h0)]));
  assign wire35 = ($unsigned(wire26[(2'h2):(1'h0)]) ?
                      {wire30[(1'h0):(1'h0)],
                          {{$signed((8'hb0)),
                                  (wire31 ?
                                      wire27 : wire28)}}} : (+((wire24[(2'h3):(1'h0)] <= (-(8'ha3))) ?
                          wire25 : ($signed((8'ha3)) ?
                              {wire31} : (wire28 != wire24)))));
  assign wire36 = wire22[(5'h11):(1'h1)];
  assign wire37 = $signed($unsigned(wire28[(4'hd):(2'h2)]));
  assign wire38 = (~wire28[(5'h10):(4'hd)]);
  assign wire39 = wire30;
  assign wire40 = wire34;
  always
    @(posedge clk) begin
      if ($signed(wire32[(1'h0):(1'h0)]))
        begin
          reg41 <= wire37;
          reg42 <= ((wire22 ? wire39 : wire33[(4'h9):(2'h3)]) ?
              $unsigned((~|$signed(wire37[(3'h4):(1'h1)]))) : {{(+(reg41 < wire23))}});
          if (reg42)
            begin
              reg43 <= ($signed($unsigned($signed(wire25))) ?
                  (($signed({wire31}) ?
                      (+$unsigned(wire32)) : (-(wire30 ?
                          wire39 : wire23))) > $unsigned(wire32[(3'h5):(1'h1)])) : {wire23});
              reg44 <= wire26[(1'h1):(1'h0)];
              reg45 <= wire37;
              reg46 <= (~&{wire23[(1'h0):(1'h0)]});
            end
          else
            begin
              reg43 <= $unsigned($signed({wire37}));
            end
        end
      else
        begin
          if (reg46)
            begin
              reg41 <= $signed(($signed((~&reg45[(4'ha):(1'h0)])) - (-wire23[(1'h0):(1'h0)])));
              reg42 <= wire30;
              reg43 <= reg42;
              reg44 <= $signed(wire31[(2'h3):(2'h3)]);
            end
          else
            begin
              reg41 <= (~wire30);
              reg42 <= wire28[(5'h13):(2'h2)];
            end
          reg45 <= $signed((7'h43));
          reg46 <= (({(~(wire23 ? reg42 : wire24))} ?
                  wire27 : ((^~(~^reg41)) && ((reg46 <= wire34) ?
                      wire37[(2'h3):(2'h3)] : (+wire35)))) ?
              wire40 : (((-$signed(wire31)) | wire36[(1'h0):(1'h0)]) == wire40[(4'hc):(3'h6)]));
          reg47 <= $unsigned((wire32[(4'hb):(4'h9)] <= wire37[(3'h4):(1'h1)]));
          reg48 <= wire29[(3'h7):(2'h3)];
        end
    end
endmodule
