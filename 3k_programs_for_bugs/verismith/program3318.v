module top
#(parameter param85 = ((~&(~(((8'hbc) >> (8'hac)) >>> ((8'hba) ? (8'hbf) : (8'hb3))))) * (-(~(&(!(7'h41)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire81;
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire4,
                 wire5,
                 wire6,
                 wire25,
                 wire43,
                 wire81,
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
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = ((8'hbf) ?
                     (($unsigned((-wire1)) ?
                         (wire2[(2'h3):(2'h3)] ^~ wire1[(1'h1):(1'h0)]) : wire2) < wire2[(3'h5):(3'h4)]) : $unsigned((!wire1[(3'h4):(1'h1)])));
  assign wire5 = $unsigned(((&$signed((wire4 ?
                     wire2 : wire1))) && (~&$signed((wire3 * wire1)))));
  assign wire6 = wire2;
  always
    @(posedge clk) begin
      reg7 <= (wire1 >= wire3[(3'h4):(2'h2)]);
      reg8 <= (^$unsigned($signed((~(wire2 ? wire4 : wire6)))));
      reg9 <= wire0;
    end
  module10 #() modinst26 (.wire14(wire4), .wire11(wire1), .wire12(wire2), .clk(clk), .y(wire25), .wire13(wire6));
  always
    @(posedge clk) begin
      reg27 <= ({(((wire2 ? reg7 : wire4) <<< $signed(wire4)) ?
                  reg8 : {(+wire6), $unsigned(wire1)})} ?
          reg9 : $unsigned($unsigned(wire1[(4'h8):(4'h8)])));
      reg28 <= (8'h9c);
    end
  always
    @(posedge clk) begin
      reg29 <= $signed(wire0[(1'h0):(1'h0)]);
      reg30 <= (|$unsigned({wire1[(2'h3):(2'h3)],
          ((wire25 == wire6) ? $signed(reg9) : reg7[(1'h0):(1'h0)])}));
      reg31 <= {((($signed(wire5) ?
                      (reg28 & wire3) : ((8'ha2) ? wire0 : wire1)) ?
                  wire0[(1'h1):(1'h0)] : reg7) ?
              (-(wire6[(2'h3):(2'h3)] < reg29[(4'h8):(2'h2)])) : reg28[(1'h1):(1'h1)])};
    end
  always
    @(posedge clk) begin
      reg32 <= $unsigned($signed((((~reg27) - $unsigned(reg8)) ?
          (wire2 ? (reg28 >>> reg8) : wire5) : $signed($unsigned((8'h9e))))));
      if ((|$signed(({$unsigned(wire0)} != $signed({(8'hb3), (8'ha8)})))))
        begin
          reg33 <= wire3;
          reg34 <= ((reg28 ?
              ((^~(reg33 >= reg29)) << wire4[(5'h13):(5'h10)]) : wire5[(1'h1):(1'h0)]) <<< $signed((~^{(8'hb6),
              (wire1 ^~ reg29)})));
          if ($signed($unsigned(((~^(wire5 ? reg29 : (7'h42))) ?
              $unsigned($unsigned(reg9)) : $signed(wire1)))))
            begin
              reg35 <= reg29;
              reg36 <= $signed($unsigned($unsigned((8'h9f))));
              reg37 <= (reg36 ^~ (reg28 >= (&$unsigned($unsigned(wire4)))));
              reg38 <= reg32;
              reg39 <= $unsigned(wire6[(4'hc):(3'h5)]);
            end
          else
            begin
              reg35 <= $signed((reg27[(4'hc):(1'h1)] && {{(8'hb4)}, reg9}));
              reg36 <= ((&$unsigned((reg28 - {(8'hb5), reg8}))) ?
                  $unsigned((({(8'hbb), reg35} ?
                          reg38[(3'h4):(2'h2)] : {reg39, reg32}) ?
                      reg7[(2'h2):(2'h2)] : $unsigned(((8'hb1) ?
                          reg34 : reg30)))) : ((($signed(reg39) ?
                      {(8'h9f)} : {reg27}) <= reg29) ^ (wire25 || (~&(wire0 ?
                      wire5 : (8'hb7))))));
              reg37 <= (reg37[(2'h2):(2'h2)] ~^ {$signed($signed(reg36)),
                  (~&reg28)});
              reg38 <= reg30[(3'h6):(2'h3)];
            end
          reg40 <= wire3;
          reg41 <= ($signed(reg38) ^~ $unsigned({$signed($signed(reg36)),
              (reg9 ? (^(8'hb8)) : reg37)}));
        end
      else
        begin
          if ((((((^wire4) >= (reg41 + wire0)) ?
                  ((reg7 ? reg41 : wire4) ~^ (reg28 == wire4)) : (8'hb6)) ?
              reg28[(2'h3):(2'h3)] : (!{$unsigned(reg8)})) == {(($signed(wire6) ~^ (~^reg33)) << ({reg9} ?
                  $signed(reg35) : ((8'hbb) ? wire0 : reg32)))}))
            begin
              reg33 <= wire6;
              reg34 <= (~|$signed(reg35));
              reg35 <= $unsigned(wire6[(3'h5):(2'h3)]);
              reg36 <= reg29;
              reg37 <= (~|(wire25[(3'h7):(2'h3)] ?
                  $signed(reg38) : $signed($signed(reg37))));
            end
          else
            begin
              reg33 <= (&((reg38[(4'hc):(4'hb)] ?
                  reg40[(2'h2):(1'h1)] : reg39[(2'h3):(1'h1)]) < (((^(8'hb6)) >= (wire6 ^ wire25)) ?
                  (!$unsigned(reg30)) : ((reg32 > reg9) ?
                      (-reg31) : (^wire0)))));
              reg34 <= wire3;
              reg35 <= (wire1[(3'h7):(1'h0)] >>> ({(reg41[(3'h4):(2'h3)] ?
                      (reg32 | wire2) : (reg28 ? wire3 : reg31))} & (8'hb5)));
            end
          reg38 <= reg33[(3'h5):(1'h0)];
          reg39 <= (({{(^reg35)}, $unsigned({reg33})} >>> (({wire4,
              reg41} + reg37) || reg38[(2'h2):(1'h1)])) == ($unsigned((&{(8'hae)})) ?
              reg8[(2'h2):(1'h1)] : reg30[(1'h0):(1'h0)]));
          reg40 <= {(wire6 | (wire3 ~^ (&(reg38 ? reg7 : reg9)))), (^~reg34)};
        end
      reg42 <= (~^($signed($signed(reg36[(1'h1):(1'h1)])) ^~ ((-(reg38 ?
          wire4 : reg37)) > $signed(reg41[(3'h4):(2'h2)]))));
    end
  assign wire43 = $unsigned(reg28);
  module44 #() modinst82 (.wire47(wire0), .wire45(reg39), .wire46(reg9), .wire48(reg35), .clk(clk), .wire49(reg33), .y(wire81));
  assign wire83 = (&($unsigned(((reg32 ? reg30 : (8'hb2)) | (~reg34))) ?
                      ((~|$unsigned(wire1)) ?
                          wire2[(2'h3):(2'h2)] : ($unsigned(reg34) >= wire4)) : {{(reg39 < (8'hb5)),
                              (8'ha7)}}));
  assign wire84 = reg39[(2'h2):(1'h0)];
endmodule

module module44  (y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire49;
  input wire signed [(5'h11):(1'h0)] wire48;
  input wire signed [(4'hf):(1'h0)] wire47;
  input wire signed [(4'ha):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire50;
  assign y = {wire80, wire79, wire77, wire50, (1'h0)};
  assign wire50 = ((8'haf) ?
                      wire47 : $unsigned($unsigned(wire49[(3'h6):(2'h2)])));
  module51 #() modinst78 (.wire55(wire47), .y(wire77), .clk(clk), .wire54(wire48), .wire52(wire45), .wire53(wire50));
  assign wire79 = $unsigned(((&({(8'ha1), wire48} ? (-wire45) : wire48)) ?
                      wire77[(4'hb):(3'h4)] : $unsigned(((wire49 ?
                              wire46 : wire49) ?
                          ((8'ha5) ? wire49 : wire49) : {wire48, wire50}))));
  assign wire80 = (wire50[(4'hf):(2'h3)] ^ {wire50[(4'hd):(3'h6)],
                      ((wire47[(3'h6):(2'h3)] * $unsigned(wire49)) >> ((8'ha6) >>> (~|wire77)))});
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire14;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire15 = ((~((&(wire11 == wire11)) != $signed((~^wire11)))) ~^ (wire11 ?
                      wire11[(3'h7):(2'h3)] : $signed((^~(-wire12)))));
  assign wire16 = (8'hac);
  assign wire17 = {$unsigned(wire11),
                      ($unsigned(((~|wire14) <= (+wire15))) << ($unsigned($signed(wire13)) == $unsigned((wire15 ?
                          wire14 : wire11))))};
  assign wire18 = ((8'hb4) ^~ ($unsigned(wire17[(1'h1):(1'h1)]) ?
                      (-((8'hb7) | $signed(wire14))) : wire13[(4'h8):(3'h4)]));
  always
    @(posedge clk) begin
      reg19 <= wire11;
      reg20 <= (wire12 ?
          (reg19 ?
              $unsigned($unsigned((8'hbe))) : (wire11 ?
                  ($unsigned(wire15) > (8'ha2)) : wire16)) : (^$unsigned(wire11[(4'hb):(3'h4)])));
      reg21 <= (~^{wire11, wire17[(1'h1):(1'h1)]});
    end
  assign wire22 = reg20;
  assign wire23 = (-$signed($signed(reg21)));
  assign wire24 = (^~reg19);
endmodule

module module51
#(parameter param76 = (^~(({((8'h9f) & (8'hb1))} && (((8'hbb) != (8'ha6)) > (^(8'hb1)))) ? ((((8'ha3) ? (8'ha7) : (8'ha7)) ^~ (+(8'h9f))) >> (^((7'h42) * (8'ha8)))) : ((~&{(8'hba)}) >>> (((8'hb1) || (8'ha5)) <= ((8'hb0) ? (8'ha0) : (7'h42)))))))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire55;
  input wire signed [(5'h11):(1'h0)] wire54;
  input wire [(2'h3):(1'h0)] wire53;
  input wire signed [(4'hf):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  assign y = {wire65,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire56 = ((-(-($signed(wire54) ? wire53 : (8'ha3)))) ?
                      $unsigned($unsigned(($unsigned(wire52) ?
                          (wire53 <<< wire53) : (wire54 ^~ wire52)))) : (!$signed(wire54)));
  assign wire57 = wire54[(2'h3):(2'h2)];
  assign wire58 = $unsigned((({$unsigned(wire55)} ?
                      $unsigned($signed(wire56)) : (8'h9d)) ^ $signed({wire54[(3'h7):(3'h4)],
                      (wire55 ? wire53 : wire55)})));
  assign wire59 = (wire58 ?
                      (|(^~(|$unsigned(wire53)))) : $unsigned((|$signed((+wire56)))));
  assign wire60 = wire56[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg61 <= (((^$signed($signed(wire54))) ?
              $unsigned(((wire57 ?
                  wire60 : wire54) * wire57[(3'h7):(3'h4)])) : (((wire55 ?
                      wire58 : wire54) ?
                  wire56[(1'h1):(1'h1)] : (&wire52)) >>> ((wire54 <<< wire54) << wire59[(3'h4):(1'h1)]))) ?
          (~&(wire55[(1'h0):(1'h0)] ?
              ((wire59 ? wire54 : (7'h43)) ?
                  (wire56 ^ wire52) : $signed(wire57)) : wire52)) : wire58[(5'h11):(2'h3)]);
      reg62 <= (8'hb8);
      reg63 <= wire60[(4'h8):(2'h3)];
      reg64 <= reg62[(3'h4):(3'h4)];
    end
  assign wire65 = wire60;
  always
    @(posedge clk) begin
      reg66 <= $unsigned((|{reg61, (+(reg63 ? (8'hbd) : wire60))}));
      reg67 <= $signed((reg64[(2'h2):(2'h2)] ?
          $unsigned(wire65[(1'h1):(1'h1)]) : wire52[(4'ha):(3'h6)]));
      if (wire56)
        begin
          reg68 <= ($signed($unsigned(wire59)) ?
              $signed($signed((^~$unsigned(reg67)))) : $unsigned((8'ha9)));
          reg69 <= (wire65[(2'h2):(1'h1)] * {$signed($signed((~&wire54))),
              wire54[(2'h2):(2'h2)]});
          if ((($signed(((+(8'hb5)) ? (~(8'h9d)) : reg62[(3'h4):(3'h4)])) ?
                  $unsigned({$unsigned(wire59),
                      wire55[(4'h8):(2'h2)]}) : {((wire58 | reg63) << {reg62})}) ?
              ({(reg61 ? reg66 : (reg66 == (8'hac)))} ~^ $signed((^~((8'h9e) ?
                  reg62 : (8'ha1))))) : $signed((wire60 >= (~^$signed(wire59))))))
            begin
              reg70 <= ($unsigned((8'hbf)) ? {(&(!$signed(wire58)))} : reg61);
              reg71 <= $signed(({$unsigned(wire60[(4'h8):(2'h2)])} ?
                  (8'ha1) : (^{((8'hac) ? reg69 : wire60)})));
            end
          else
            begin
              reg70 <= ($unsigned($unsigned({((8'haf) ?
                      wire58 : wire59)})) > (|reg62));
            end
          reg72 <= (((reg71 > ((8'hb5) && (8'ha4))) ?
                  ($signed((|(8'hb3))) ?
                      $unsigned($signed(reg64)) : (-reg71)) : {{{wire58,
                              wire65},
                          (wire58 - reg62)}}) ?
              (reg61 << ($signed($signed(wire56)) ?
                  $unsigned((~^reg63)) : {wire56[(4'h8):(3'h5)]})) : (^$unsigned(wire54[(3'h6):(3'h6)])));
          reg73 <= (-(&($signed((wire60 ? wire65 : reg72)) ?
              reg70 : reg67[(4'hb):(3'h4)])));
        end
      else
        begin
          reg68 <= ({reg72} >= reg73);
          reg69 <= wire60;
          if (reg61[(5'h11):(2'h3)])
            begin
              reg70 <= $unsigned(reg70[(1'h1):(1'h1)]);
            end
          else
            begin
              reg70 <= $signed((~|(($signed(reg69) ?
                  reg64[(1'h1):(1'h1)] : (^~(8'haf))) << $unsigned((reg71 ?
                  reg67 : wire52)))));
              reg71 <= (wire55 == {(((wire57 ?
                      wire60 : wire57) >= $signed(wire59)) != {(reg63 ?
                          wire56 : reg69),
                      (+(8'hb6))}),
                  reg70});
              reg72 <= reg64[(2'h2):(1'h0)];
              reg73 <= $signed((~wire55[(2'h2):(1'h1)]));
              reg74 <= (8'hb5);
            end
          reg75 <= {($unsigned($unsigned((reg73 ~^ wire58))) ?
                  ($unsigned(((8'hb4) >> wire59)) + ((~wire52) >= ((8'h9f) ?
                      reg71 : reg67))) : reg66[(4'h9):(3'h5)])};
        end
    end
endmodule
