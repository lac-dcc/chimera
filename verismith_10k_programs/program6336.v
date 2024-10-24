module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire171;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire169;
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire171,
                 wire5,
                 wire10,
                 wire11,
                 wire82,
                 wire169,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = (-$unsigned($signed(wire0)));
  always
    @(posedge clk) begin
      reg6 <= $signed($signed((8'ha3)));
      reg7 <= (7'h41);
      reg8 <= ((8'ha9) ?
          ($unsigned((-{wire0,
              wire0})) >>> $signed($unsigned($unsigned(reg6)))) : ($signed(wire0[(3'h5):(1'h1)]) == ((~|wire2[(1'h0):(1'h0)]) ?
              wire4 : (~|(wire5 ? wire1 : reg6)))));
      reg9 <= reg8;
    end
  assign wire10 = (wire5 ? (~|reg7) : $unsigned((~^$signed(reg6))));
  assign wire11 = (-{(reg6[(2'h2):(1'h1)] ?
                          $signed($signed(wire0)) : {(8'haa),
                              wire3[(4'h8):(3'h4)]}),
                      (reg7[(1'h0):(1'h0)] ^ wire1[(1'h1):(1'h1)])});
  module12 #() modinst83 (wire82, clk, reg9, wire2, wire4, reg8, reg6);
  module84 #() modinst170 (wire169, clk, wire3, reg9, wire10, reg7, wire2);
  assign wire171 = {((reg6[(4'hc):(4'h8)] ?
                               wire3[(3'h4):(1'h1)] : {$unsigned((8'hab)),
                                   wire11[(3'h7):(2'h3)]}) ?
                           (~^(!reg8)) : (reg9 << {$signed(wire5),
                               $unsigned(reg6)})),
                       $unsigned(wire11)};
endmodule

module module84  (y, clk, wire85, wire86, wire87, wire88, wire89);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire85;
  input wire [(4'ha):(1'h0)] wire86;
  input wire [(5'h11):(1'h0)] wire87;
  input wire signed [(5'h14):(1'h0)] wire88;
  input wire [(5'h12):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire168;
  wire [(4'he):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire164;
  reg [(4'h9):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  assign y = {wire168,
                 wire91,
                 wire92,
                 wire93,
                 wire164,
                 reg167,
                 reg166,
                 reg90,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg90 <= wire87[(3'h6):(3'h6)];
    end
  assign wire91 = ($signed(({$signed(wire85)} ?
                          wire88 : ((wire89 ? reg90 : (7'h43)) ?
                              $signed(wire85) : (|wire88)))) ?
                      (^(8'hae)) : wire85[(4'h8):(4'h8)]);
  assign wire92 = ({wire85} >> (wire89 ?
                      $unsigned(($unsigned(wire87) <= $unsigned(wire85))) : $signed((wire86[(1'h1):(1'h0)] << ((8'h9c) ?
                          wire86 : wire88)))));
  assign wire93 = (8'hab);
  module94 #() modinst165 (.wire99(wire91), .wire95(wire88), .wire98(wire92), .wire96(wire86), .y(wire164), .clk(clk), .wire97(wire87));
  always
    @(posedge clk) begin
      reg166 <= (~&((wire89 ?
          wire164 : (~$unsigned((8'hb7)))) == wire164[(2'h3):(2'h2)]));
      reg167 <= {wire92[(1'h0):(1'h0)], $unsigned((|reg90[(3'h5):(1'h1)]))};
    end
  assign wire168 = (~^(reg167 ? wire88 : (~&wire85)));
endmodule

module module12
#(parameter param80 = (((((^~(8'hbf)) << {(8'ha1)}) ~^ ({(8'hbd)} < ((7'h44) ? (8'hb3) : (8'h9f)))) ? ((((8'hb5) ? (7'h43) : (8'hbd)) + (^(8'hb3))) * {{(8'hb6)}}) : ((~^(8'hb3)) ~^ {((8'hae) >> (8'hbe)), ((7'h44) ? (8'ha4) : (8'had))})) ? ((+(((8'hb5) <= (8'ha8)) ~^ ((8'ha5) ? (8'hbc) : (8'hb9)))) ? {(8'haa), (8'hba)} : ((((8'ha0) ? (8'hb5) : (8'hac)) ? {(8'hb5)} : {(8'hb7), (8'hac)}) ? (~|((8'hb8) ? (8'haf) : (8'hb5))) : {(7'h43)})) : (8'hb0)), 
parameter param81 = (7'h41))
(y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire33;
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire76,
                 wire33,
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
                 reg35,
                 (1'h0)};
  module18 #() modinst34 (.wire22(wire13), .y(wire33), .wire23(wire14), .wire21(wire16), .clk(clk), .wire19(wire17), .wire20(wire15));
  always
    @(posedge clk) begin
      if ((-(8'ha3)))
        begin
          if (((|$unsigned(((wire33 < wire17) * $unsigned(wire14)))) ?
              $signed((wire33[(4'hb):(4'hb)] ?
                  $unsigned(wire16[(1'h1):(1'h1)]) : ({wire16} ?
                      (~^(8'hb4)) : (^wire17)))) : wire14))
            begin
              reg35 <= (|$signed(($unsigned((wire16 ?
                  (7'h43) : wire17)) <<< wire15)));
              reg36 <= wire14[(1'h0):(1'h0)];
            end
          else
            begin
              reg35 <= (reg35 ?
                  ($signed(($unsigned((8'ha8)) ?
                      (8'hbc) : (wire14 ?
                          wire16 : reg35))) > wire17) : (8'ha7));
              reg36 <= wire15;
              reg37 <= {$unsigned($unsigned((^{(7'h40)}))),
                  ($unsigned($unsigned($signed((8'ha8)))) ?
                      reg36[(1'h1):(1'h1)] : wire15[(1'h0):(1'h0)])};
              reg38 <= (~{$signed(($signed(reg35) && {wire15, reg36})),
                  wire17});
              reg39 <= (~|(7'h42));
            end
          if ($unsigned(reg36[(1'h0):(1'h0)]))
            begin
              reg40 <= {((~$unsigned(((8'ha0) ?
                      wire14 : reg39))) + ($signed(((7'h42) * reg35)) ?
                      wire33 : (|reg35)))};
              reg41 <= wire33[(4'hc):(4'h9)];
              reg42 <= $unsigned(wire15[(4'ha):(4'h9)]);
              reg43 <= wire15;
              reg44 <= ((reg42 ?
                      (((reg43 ?
                          (8'haf) : (8'h9d)) * wire33) << reg39) : {(~$unsigned((8'hac)))}) ?
                  $unsigned(($signed((reg39 >= reg37)) ?
                      $signed($unsigned(reg42)) : reg36)) : $unsigned((((wire17 ^ reg35) ?
                      reg43[(4'ha):(4'h8)] : wire17) ~^ $unsigned(wire16))));
            end
          else
            begin
              reg40 <= (~reg37);
              reg41 <= ($signed(($signed(reg36) - {reg41[(2'h2):(1'h1)]})) <<< reg35[(1'h1):(1'h1)]);
              reg42 <= $unsigned(($unsigned(((reg39 ^ reg39) ?
                  $unsigned(reg41) : reg38)) && reg41));
            end
        end
      else
        begin
          if (reg40)
            begin
              reg35 <= ((($unsigned(reg37[(2'h3):(1'h1)]) == ($unsigned(reg39) ?
                  wire16 : reg37)) < {$signed((reg37 ? reg41 : (8'hbb))),
                  (~&$signed(wire16))}) ^~ reg43);
              reg36 <= (((reg36[(2'h2):(2'h2)] ?
                  ((wire33 ?
                      (8'hb1) : (8'hb0)) || ((8'ha5) + reg37)) : {{(8'hb9),
                          reg41}}) ~^ ((|(reg42 ?
                  reg36 : wire16)) << (!(reg35 ~^ wire17)))) && {reg41,
                  wire13});
            end
          else
            begin
              reg35 <= $signed($unsigned({reg43}));
              reg36 <= $signed((reg41[(3'h6):(3'h5)] ?
                  (|reg35) : ((!wire17) ^ reg40[(4'h9):(1'h0)])));
              reg37 <= {(!(reg42 > (wire33[(3'h5):(3'h5)] ?
                      reg38[(4'h8):(3'h6)] : $signed(reg44))))};
              reg38 <= $signed((reg42 | (reg36[(1'h1):(1'h0)] >> $signed(reg35))));
              reg39 <= ((^~$unsigned((~|wire15))) ?
                  (8'had) : $unsigned((&$signed({reg44, reg43}))));
            end
          reg40 <= reg42;
        end
      if (reg42[(2'h3):(2'h3)])
        begin
          if ((|$unsigned($signed(wire33))))
            begin
              reg45 <= reg37;
            end
          else
            begin
              reg45 <= $unsigned($signed(($unsigned($unsigned(wire15)) ?
                  $unsigned(reg40[(1'h1):(1'h1)]) : reg39[(3'h4):(1'h1)])));
              reg46 <= $unsigned($unsigned((reg37 ?
                  (8'hb9) : reg39[(2'h2):(2'h2)])));
              reg47 <= wire15[(2'h3):(1'h1)];
            end
        end
      else
        begin
          reg45 <= (((^~((reg37 ? (8'ha5) : (8'hb9)) ?
                  (reg39 || (8'hb6)) : (reg44 ? reg46 : wire15))) ^ reg41) ?
              (reg46[(3'h4):(3'h4)] <<< (^reg40)) : reg45);
          reg46 <= $signed(($unsigned(reg37) ?
              ({(reg42 <= reg41)} ?
                  ((reg39 ?
                      reg37 : reg46) != $unsigned(reg46)) : ($signed(reg37) ?
                      (^reg45) : (+wire16))) : (!((wire15 ?
                  wire17 : wire13) | (reg36 ? wire16 : reg41)))));
          reg47 <= reg39;
          reg48 <= (($signed(reg47) ?
                  (~&$unsigned((wire14 >> (8'ha9)))) : reg43) ?
              reg42 : reg46[(1'h0):(1'h0)]);
        end
    end
  module49 #() modinst77 (.clk(clk), .wire50(wire16), .y(wire76), .wire52(wire13), .wire51(reg45), .wire53(reg35));
  assign wire78 = $signed((+({reg40} ?
                      (!(^reg40)) : ((wire14 - (8'haa)) < (reg48 ?
                          reg44 : wire17)))));
  assign wire79 = wire76;
endmodule

module module49
#(parameter param75 = ((({((8'hbf) ? (8'h9c) : (8'hac))} ? ({(8'ha0), (8'had)} ? ((8'hb5) >> (8'ha6)) : ((8'ha2) || (8'ha4))) : {((8'hb6) ? (8'hbf) : (8'haa))}) | {(((7'h44) ? (8'had) : (8'h9f)) != (8'hb1)), (~|((8'ha9) ? (8'hbd) : (8'ha9)))}) ? (((((8'h9c) * (7'h44)) && ((8'hb4) ? (8'hb5) : (8'haf))) == (((8'hab) ^ (8'hb8)) ? ((8'hb8) << (8'ha4)) : ((8'hb8) >>> (8'hb8)))) ? ({((8'ha7) ? (8'hae) : (8'ha1)), ((8'hab) ? (8'ha4) : (8'h9f))} ? {((8'h9d) << (8'ha1))} : (~(~^(8'hb3)))) : ((((8'ha0) >>> (8'h9e)) ? (8'hb6) : (~(7'h42))) ? ((~|(8'hb7)) > {(7'h40), (8'haa)}) : {((8'h9f) ? (8'hb0) : (8'hae))})) : (((8'hbe) <<< ((~(8'ha7)) ~^ (^(8'haf)))) ? ((((8'ha2) ^~ (8'ha4)) & {(7'h44)}) ? (((8'haa) ? (8'ha6) : (8'hb8)) ? {(8'h9c), (8'hb2)} : ((8'hbe) || (8'ha3))) : ((|(8'h9d)) ? ((8'hb8) ? (8'ha1) : (8'hb8)) : (~^(7'h40)))) : ((8'had) && (((8'hb3) >= (8'ha8)) ? ((8'hb0) ? (7'h44) : (8'hb2)) : {(8'hb1), (8'h9c)})))))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire53;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire [(2'h2):(1'h0)] wire51;
  input wire [(5'h15):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire54 = $unsigned($unsigned(($signed($unsigned(wire51)) ?
                      ((wire53 ? (8'haf) : wire50) > {(8'hb1),
                          (8'hab)}) : $unsigned($unsigned(wire50)))));
  assign wire55 = ($signed(wire53[(3'h4):(1'h0)]) * wire51);
  assign wire56 = wire51[(1'h0):(1'h0)];
  assign wire57 = $signed(wire53);
  always
    @(posedge clk) begin
      reg58 <= ((~|((!wire53) * (|((8'hbc) ?
          wire50 : wire54)))) <<< $signed(wire53));
      if ({wire51[(1'h1):(1'h0)],
          (wire53 ? {(wire51 ^~ (!reg58))} : (-(^~wire52)))})
        begin
          reg59 <= wire57;
          reg60 <= reg58[(4'hc):(3'h7)];
          reg61 <= wire55;
        end
      else
        begin
          reg59 <= (~^reg59[(3'h4):(3'h4)]);
        end
      reg62 <= ($unsigned($signed((+{wire56, reg59}))) ?
          (~|wire57) : $signed((wire55 ?
              (!{reg59}) : ((~^reg59) ? (wire54 > wire51) : wire57))));
    end
  assign wire63 = (-reg59);
  assign wire64 = $signed(({(|(wire54 & wire63)), reg60} ?
                      (~|($unsigned(reg61) ?
                          $signed(reg60) : {reg62})) : reg58));
  assign wire65 = wire56;
  assign wire66 = wire52;
  assign wire67 = ((!(((8'haf) >>> $signed(reg59)) ?
                          $signed(wire66[(2'h3):(1'h0)]) : $unsigned((8'hae)))) ?
                      $unsigned((($unsigned(reg59) | (wire65 ?
                              wire54 : wire63)) ?
                          (~&$unsigned(reg60)) : $unsigned((wire65 && wire55)))) : wire53[(1'h1):(1'h0)]);
  assign wire68 = reg62[(4'ha):(2'h3)];
  assign wire69 = (8'h9d);
  assign wire70 = reg60[(2'h3):(1'h0)];
  assign wire71 = wire66[(2'h3):(1'h1)];
  assign wire72 = (($signed((wire55 & (~|wire50))) ~^ ({$unsigned(wire65),
                          wire56[(3'h6):(3'h5)]} ?
                      (~$unsigned(reg59)) : $signed((~&wire53)))) == {$signed($signed((&wire65))),
                      ($unsigned((wire50 << wire50)) || ({reg61, wire66} ?
                          $unsigned(wire56) : reg61))});
  assign wire73 = wire51;
  assign wire74 = (+($unsigned($unsigned(wire54)) + ({wire70} ?
                      $unsigned((8'haf)) : $signed($unsigned((7'h44))))));
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire signed [(3'h7):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 (1'h0)};
  assign wire24 = ((wire21 ?
                          (wire22 ?
                              $unsigned((wire22 ?
                                  wire21 : wire23)) : wire21[(2'h3):(2'h3)]) : (~^wire21)) ?
                      ((|((&wire22) ?
                          $unsigned(wire23) : (wire19 ?
                              wire23 : wire19))) || (8'ha5)) : wire19);
  assign wire25 = ({(wire24[(2'h3):(1'h0)] >> (wire21 ?
                              {wire23, wire23} : (wire20 + wire20)))} ?
                      (|((-{wire24}) >>> (&wire19[(3'h5):(2'h2)]))) : $unsigned(wire22[(3'h7):(3'h5)]));
  assign wire26 = ({{((-wire23) ?
                              $signed((8'hac)) : {wire19})}} ~^ $signed((8'hae)));
  assign wire27 = (8'hac);
  assign wire28 = wire24[(1'h0):(1'h0)];
  assign wire29 = (~|$signed($signed($signed(wire26[(4'h8):(2'h3)]))));
  assign wire30 = (($unsigned((wire20 * (wire24 || (8'ha3)))) ?
                          wire22[(1'h1):(1'h0)] : (wire21[(3'h7):(3'h4)] || $unsigned($unsigned(wire27)))) ?
                      (~^$signed($unsigned((wire20 && wire21)))) : $unsigned($signed($signed(wire28[(3'h7):(3'h7)]))));
  assign wire31 = (~|wire29);
  assign wire32 = ($signed($signed($signed(wire25))) ?
                      (~&(+wire26[(4'hc):(3'h5)])) : (~$unsigned($signed({wire19,
                          wire24}))));
endmodule

module module94
#(parameter param162 = (((~(~(7'h41))) ? (8'haf) : {((~|(7'h43)) ? ((8'ha8) != (8'ha7)) : ((8'ha9) <= (8'ha7))), (&((8'haa) >> (8'hbc)))}) ? {({(8'ha2), ((8'hb1) ? (8'hbb) : (8'ha6))} >> ((~|(7'h44)) <<< ((7'h42) ? (8'ha6) : (8'hb7))))} : {(((|(8'h9d)) ? ((8'h9f) ? (8'ha8) : (8'ha2)) : ((8'hbb) ? (7'h40) : (7'h43))) ? (((7'h43) ? (7'h42) : (7'h42)) ? {(8'hb2)} : {(8'hb0), (8'hbb)}) : ((!(8'h9e)) ? (!(8'ha2)) : {(8'hbd)})), {(((8'hb3) ? (7'h43) : (8'h9c)) ? (|(8'h9e)) : (~|(8'ha6)))}}), 
parameter param163 = (({((param162 ? param162 : param162) || {param162, (8'hb3)})} ? (^~{(~param162)}) : (|param162)) * ((^~param162) ? (8'hbe) : {(param162 + (param162 ? param162 : param162))})))
(y, clk, wire99, wire98, wire97, wire96, wire95);
  output wire [(32'h29d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire99;
  input wire [(4'he):(1'h0)] wire98;
  input wire [(5'h11):(1'h0)] wire97;
  input wire [(4'ha):(1'h0)] wire96;
  input wire [(5'h10):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire161;
  wire signed [(4'ha):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire159;
  wire signed [(4'hd):(1'h0)] wire158;
  wire [(4'hc):(1'h0)] wire157;
  wire [(3'h4):(1'h0)] wire156;
  wire signed [(3'h7):(1'h0)] wire147;
  wire [(4'hd):(1'h0)] wire146;
  wire signed [(2'h2):(1'h0)] wire145;
  wire [(4'h8):(1'h0)] wire144;
  wire [(4'ha):(1'h0)] wire140;
  wire [(2'h2):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire [(4'hc):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire100;
  reg [(5'h12):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire140,
                 wire123,
                 wire122,
                 wire102,
                 wire101,
                 wire100,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg143,
                 reg142,
                 reg141,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
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
                 (1'h0)};
  assign wire100 = wire99[(1'h1):(1'h0)];
  assign wire101 = ((-(wire96 ? $signed(wire95) : $unsigned({(8'ha1)}))) ?
                       $signed($unsigned((~|{wire100, wire96}))) : wire100);
  assign wire102 = {wire98,
                       ((^~wire100) ?
                           $unsigned((wire95 ?
                               (^~wire99) : ((8'hb3) | wire95))) : wire98[(2'h2):(1'h0)])};
  always
    @(posedge clk) begin
      if ((+(wire99[(1'h1):(1'h0)] ?
          ({wire99[(1'h1):(1'h1)]} ?
              wire98[(3'h7):(2'h2)] : ($signed(wire97) > wire96)) : $unsigned(((wire96 != wire102) ~^ wire97[(4'hb):(1'h0)])))))
        begin
          reg103 <= {(~wire99), wire95};
          reg104 <= (wire100 != $unsigned($signed(({wire102, reg103} ?
              (wire98 ? wire102 : wire96) : ((8'hba) ? reg103 : wire101)))));
          reg105 <= {(wire98 ?
                  (wire98 ?
                      $unsigned($signed(reg103)) : (wire96[(3'h4):(2'h2)] ?
                          wire99 : (reg104 ?
                              reg103 : wire97))) : reg103[(2'h2):(1'h0)])};
        end
      else
        begin
          reg103 <= (wire101[(1'h0):(1'h0)] ?
              wire95[(1'h1):(1'h0)] : ({$signed(reg103[(3'h5):(2'h3)])} ?
                  $signed($signed((wire97 >> wire95))) : {(|(wire100 >= wire97)),
                      wire101[(3'h7):(3'h6)]}));
        end
      reg106 <= (reg104[(1'h0):(1'h0)] ?
          $unsigned(wire98[(4'ha):(4'ha)]) : reg103[(3'h6):(1'h1)]);
      reg107 <= (+($unsigned($unsigned((~|wire101))) ?
          (+($unsigned(reg105) ? (~^wire101) : $signed(wire97))) : {(wire99 ?
                  wire97[(3'h5):(1'h1)] : {wire99, wire96})}));
      reg108 <= ((+({(wire101 * wire101)} >>> (~|(wire96 ?
          wire102 : wire101)))) | $unsigned(wire97[(3'h7):(2'h3)]));
      reg109 <= (reg107[(1'h1):(1'h1)] ?
          (^reg104[(1'h1):(1'h0)]) : $signed((+((wire95 ?
              reg108 : wire98) != reg106[(3'h7):(3'h6)]))));
    end
  always
    @(posedge clk) begin
      reg110 <= wire96[(4'h9):(3'h5)];
      reg111 <= ({$unsigned((~^wire98[(3'h6):(1'h1)])),
          (($signed(reg110) ? wire98 : (wire100 && wire100)) ?
              reg109 : (((8'hb5) ?
                  reg105 : wire97) != $signed(reg105)))} ^ (^~wire97[(3'h7):(1'h0)]));
      reg112 <= $unsigned($signed(reg110));
    end
  always
    @(posedge clk) begin
      reg113 <= wire96;
      reg114 <= $unsigned({({wire101, (wire98 <<< reg110)} ?
              wire99[(1'h1):(1'h1)] : reg112),
          $signed(((wire101 ? (8'h9e) : reg111) ?
              (reg112 ? (8'haa) : (8'ha5)) : (wire99 ? wire101 : (8'h9e))))});
      if ($signed(wire102[(1'h0):(1'h0)]))
        begin
          reg115 <= wire101[(1'h1):(1'h0)];
        end
      else
        begin
          reg115 <= ((~$unsigned($unsigned($signed(reg105)))) ?
              $signed(($unsigned((reg111 ? (8'ha0) : reg108)) <<< {(reg111 ?
                      wire98 : reg108)})) : $signed((!reg103)));
          reg116 <= $unsigned(reg110[(2'h2):(2'h2)]);
          if (reg107)
            begin
              reg117 <= $signed(reg110[(1'h1):(1'h0)]);
              reg118 <= (($unsigned(wire96) ?
                  reg105[(4'hb):(2'h2)] : {wire98[(4'hb):(1'h1)]}) ~^ (~^$unsigned(reg110[(2'h3):(1'h1)])));
              reg119 <= reg116[(1'h1):(1'h0)];
            end
          else
            begin
              reg117 <= $unsigned((reg110 <= $signed(((wire100 ?
                      (8'ha2) : reg114) ?
                  $unsigned(wire100) : $unsigned(reg112)))));
              reg118 <= {reg115,
                  (({(reg113 >> (8'hbe))} && ((reg112 <<< (8'hb8)) >> (reg110 ?
                      reg111 : reg104))) > (+reg117))};
              reg119 <= wire96;
            end
          reg120 <= {($unsigned($signed($signed(reg119))) < (~^$unsigned({(8'ha7),
                  reg107}))),
              ({(-(wire99 >>> wire101)), {reg114, (!reg105)}} ?
                  reg115[(1'h1):(1'h0)] : ($signed($unsigned(reg111)) << $unsigned($signed(reg112))))};
          reg121 <= $signed({reg107[(2'h3):(2'h3)], (~&$unsigned(wire101))});
        end
    end
  assign wire122 = $unsigned($signed($signed(wire100[(3'h5):(3'h4)])));
  assign wire123 = ((-reg106[(4'h8):(2'h2)]) < wire102[(4'ha):(1'h0)]);
  always
    @(posedge clk) begin
      reg124 <= wire102[(4'hc):(3'h7)];
      reg125 <= $unsigned(($signed(($unsigned(reg103) << $signed((8'h9e)))) ?
          wire98 : (8'ha3)));
      reg126 <= ($unsigned(wire102[(3'h4):(2'h2)]) >>> $unsigned((8'hac)));
      if (wire97[(3'h5):(3'h4)])
        begin
          reg127 <= reg124;
          reg128 <= ($signed((($unsigned(wire96) > $unsigned((8'hb9))) ^~ (+(reg114 ^~ (8'ha4))))) * ($unsigned(reg108) ?
              $signed((((8'hb4) >= reg121) ?
                  $signed(reg108) : $signed(reg111))) : wire123));
          if ($unsigned($unsigned((wire123[(2'h2):(2'h2)] ?
              $signed((reg107 <<< reg106)) : (reg112 << (reg103 ?
                  reg103 : reg108))))))
            begin
              reg129 <= {(~wire97),
                  ($unsigned(reg109[(3'h5):(1'h1)]) - $unsigned($signed($unsigned(reg115))))};
              reg130 <= ((&reg129) ?
                  $unsigned(reg107) : ($unsigned((reg108[(1'h1):(1'h0)] ?
                          (reg124 >= reg120) : (|wire122))) ?
                      $signed($unsigned(wire95)) : ($unsigned((reg117 <= reg127)) ?
                          reg112 : ($unsigned(wire97) * (wire97 ?
                              reg114 : reg127)))));
              reg131 <= wire100;
              reg132 <= $unsigned(wire102);
            end
          else
            begin
              reg129 <= (|$signed(wire97[(1'h1):(1'h0)]));
            end
          reg133 <= reg116[(1'h0):(1'h0)];
        end
      else
        begin
          if (($signed((reg106 - (!reg114))) ?
              {(reg130[(1'h1):(1'h0)] != {((8'hb6) ? reg127 : reg119),
                      ((8'ha8) + reg119)}),
                  {((wire96 <<< wire101) ~^ reg131[(3'h4):(1'h0)]),
                      $unsigned((wire99 + reg103))}} : (8'ha3)))
            begin
              reg127 <= reg114[(2'h2):(1'h0)];
              reg128 <= wire99;
              reg129 <= (8'h9d);
              reg130 <= ((|wire102) ?
                  $unsigned(reg103) : (~|$signed(($unsigned(reg116) ^ (reg121 ?
                      reg127 : reg120)))));
            end
          else
            begin
              reg127 <= {$unsigned($unsigned(($signed(reg112) >>> {wire101})))};
            end
          reg131 <= wire102;
          if ((~^(($signed($unsigned(reg110)) + ((wire102 ^ reg105) ^ (~|wire95))) && (8'hb1))))
            begin
              reg132 <= reg121[(2'h3):(2'h3)];
              reg133 <= $signed($signed($unsigned(reg112[(4'hd):(2'h3)])));
              reg134 <= reg115;
              reg135 <= (((wire98 ? reg106 : (&(reg113 & wire100))) ?
                      ({(~^wire123), ((8'ha2) ? reg119 : (8'hb1))} ?
                          {((8'h9d) || reg118)} : {{(8'hb0), wire97},
                              reg110}) : $signed((~|reg111[(3'h5):(1'h0)]))) ?
                  reg111[(4'hf):(4'h9)] : (((wire122[(4'hb):(2'h3)] ?
                              wire96[(4'h9):(1'h0)] : $unsigned((8'hb3))) ?
                          {reg132, (7'h41)} : (^(^~wire123))) ?
                      $signed(((|(7'h41)) != (reg114 == reg133))) : reg103[(3'h7):(1'h1)]));
            end
          else
            begin
              reg132 <= reg103;
              reg133 <= $unsigned(reg120[(4'he):(4'hd)]);
              reg134 <= (($unsigned({$signed(wire123)}) ?
                  $signed(reg129) : wire102[(4'h8):(3'h7)]) >>> (($signed($signed(reg121)) + $unsigned((^reg119))) ?
                  ($signed((reg120 < (8'haf))) ?
                      ((reg118 > reg113) - (wire99 ~^ reg119)) : (~&reg110)) : (($unsigned(reg111) ?
                      ((8'ha0) - wire100) : wire95) + reg126)));
              reg135 <= wire97[(4'ha):(1'h1)];
            end
          reg136 <= (~^$unsigned(((8'haa) <= ({reg128,
              reg131} <<< (!reg103)))));
          if (((!reg114) ?
              ((wire99[(2'h2):(2'h2)] ?
                  {$unsigned(reg132)} : ($unsigned(reg118) & $unsigned(reg117))) >>> reg106[(3'h4):(2'h2)]) : wire96))
            begin
              reg137 <= $signed(reg134[(4'hd):(4'hc)]);
              reg138 <= {(~$signed({reg137}))};
              reg139 <= ((+$signed((~^(wire97 ? reg118 : reg135)))) ?
                  reg112 : (~{(reg104[(1'h0):(1'h0)] ? reg124 : {reg131}),
                      $signed((^~reg125))}));
            end
          else
            begin
              reg137 <= reg112;
              reg138 <= (~|($signed(($signed(reg112) ?
                  (8'h9c) : (reg116 | reg129))) >>> $signed(($unsigned(reg138) ?
                  $signed(reg104) : (|reg116)))));
              reg139 <= reg106[(4'h8):(1'h1)];
            end
        end
    end
  assign wire140 = reg139;
  always
    @(posedge clk) begin
      reg141 <= $signed(reg104);
      reg142 <= (reg132[(4'h8):(3'h7)] <<< {(~((wire123 << wire102) < (reg130 && (8'hb2)))),
          (($unsigned(reg136) ^ reg138) ?
              {(reg117 || wire122), {reg120}} : ($unsigned(wire122) ^ (reg104 ?
                  reg103 : reg113)))});
      reg143 <= {(^~(reg113[(3'h6):(2'h3)] ?
              (^~$signed(reg121)) : $signed($unsigned((8'h9e)))))};
    end
  assign wire144 = $signed((reg125 ?
                       {wire122[(2'h3):(2'h2)], reg107} : reg138));
  assign wire145 = ($unsigned((^~{(!reg114),
                       (reg129 || wire122)})) < ($unsigned($unsigned(reg116[(2'h3):(2'h3)])) * (!($signed(reg137) <= $unsigned(reg128)))));
  assign wire146 = (((-(|$unsigned(wire144))) ?
                           {((~|(8'ha7)) >>> $signed(wire122))} : $signed(reg115[(1'h0):(1'h0)])) ?
                       ($signed(reg143) >= wire96) : (~|((&(reg130 + wire99)) ?
                           reg141[(3'h6):(2'h2)] : wire101[(1'h1):(1'h1)])));
  assign wire147 = (~^reg111[(4'hb):(2'h3)]);
  always
    @(posedge clk) begin
      if ($signed(wire100))
        begin
          reg148 <= reg142[(2'h3):(1'h1)];
          reg149 <= (($signed(reg107) >> (wire140 >>> wire144)) <= reg132[(1'h0):(1'h0)]);
          if (wire144[(2'h2):(1'h0)])
            begin
              reg150 <= wire100[(1'h1):(1'h0)];
              reg151 <= $signed(reg111[(1'h1):(1'h0)]);
              reg152 <= (reg149 ? $signed($unsigned(wire96)) : (8'hb1));
              reg153 <= $signed(reg143);
              reg154 <= (reg119[(3'h5):(2'h2)] < $unsigned($unsigned(reg105[(2'h3):(1'h0)])));
            end
          else
            begin
              reg150 <= (wire100 && $unsigned($signed((~|(wire102 & reg138)))));
              reg151 <= reg142[(4'hb):(4'ha)];
              reg152 <= reg126;
              reg153 <= reg127[(2'h3):(2'h3)];
              reg154 <= ($unsigned({reg125}) ?
                  $signed({$unsigned($unsigned(wire146))}) : (~^{(+$signed(wire122))}));
            end
        end
      else
        begin
          reg148 <= reg107[(1'h1):(1'h1)];
          if ($unsigned({(((~&(8'ha0)) ? reg113[(1'h0):(1'h0)] : {wire101}) ?
                  (^~(wire122 ? reg116 : (8'h9e))) : (reg125 >> (!wire140)))}))
            begin
              reg149 <= ((~$signed({(reg142 ? wire122 : reg109),
                  wire146})) ~^ $signed(reg117[(2'h3):(1'h0)]));
            end
          else
            begin
              reg149 <= wire123[(2'h2):(1'h1)];
              reg150 <= $signed(reg116[(3'h5):(1'h1)]);
              reg151 <= {reg118};
              reg152 <= (reg129 ?
                  (~|(~^wire100)) : $signed(($signed((reg152 ?
                          reg135 : wire146)) ?
                      ((~wire144) ?
                          (wire97 <<< (8'ha2)) : (reg104 << reg138)) : ($unsigned(reg113) >> $unsigned(wire123)))));
              reg153 <= (~|(((~^((8'h9e) >= wire98)) == (8'h9d)) ?
                  {(8'ha6)} : reg137));
            end
          reg154 <= ($unsigned((8'hb7)) | ((&$unsigned((^wire122))) ?
              {reg130} : reg109[(2'h3):(2'h2)]));
          reg155 <= $unsigned((reg143 && (-reg149)));
        end
    end
  assign wire156 = (wire122 ? reg119[(2'h3):(2'h2)] : reg131[(2'h3):(2'h3)]);
  assign wire157 = reg126;
  assign wire158 = $unsigned(reg109);
  assign wire159 = $unsigned({({reg152, reg126[(3'h5):(1'h1)]} ?
                           (8'haa) : (!(!(8'ha6)))),
                       (&reg151)});
  assign wire160 = $unsigned(($signed(($signed(wire96) & (reg155 <= reg149))) || {(wire146[(3'h6):(1'h1)] ?
                           (~reg137) : (^reg137))}));
  assign wire161 = ((~(reg106[(4'h9):(1'h0)] | $unsigned(wire123))) ^ reg104);
endmodule
