module top
#(parameter param64 = ((~|(~|(((8'hbe) ? (8'ha5) : (8'ha1)) ? (-(8'hb8)) : {(8'hb4), (7'h42)}))) ? (((^(8'hb1)) < {((8'hbf) * (8'hb5))}) ? ((!(!(7'h43))) & ({(8'h9f), (8'hb7)} ? ((8'hbe) ^ (7'h41)) : ((8'hbc) ? (8'hbb) : (8'h9d)))) : (({(8'ha9), (7'h44)} <= ((8'haf) ? (8'ha1) : (8'ha8))) != (7'h43))) : (((!((8'hb7) << (8'h9f))) ? (((8'hb9) > (8'hb0)) ? (^~(8'haf)) : ((8'hb4) + (8'ha0))) : ({(8'hb0), (8'hbc)} ? (~(8'hb3)) : ((8'ha4) ? (8'hb4) : (7'h42)))) ? {(((8'hb2) && (8'hac)) ^~ (^~(8'ha2))), {((7'h42) && (8'ha8)), (|(8'ha2))}} : (^~{(8'h9f)}))), 
parameter param65 = ((({(param64 >= param64), param64} ? ((param64 ? (8'hbb) : param64) ? param64 : (param64 ? param64 : param64)) : {param64}) ? (8'hb7) : {(^~(param64 <<< param64))}) ? ((!((~param64) != (param64 ? param64 : param64))) ? (~&param64) : (param64 ? (^~(~&param64)) : ({param64, param64} || param64))) : (({(param64 != param64)} << ((~&(7'h42)) <= param64)) ~^ ((!(~^param64)) | ({param64, (8'ha4)} ? (~|param64) : param64)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2e8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire43,
                 wire29,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire4,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (~$signed(wire3));
  always
    @(posedge clk) begin
      reg5 <= wire0[(4'he):(4'h8)];
      reg6 <= $signed($unsigned($unsigned(wire3[(1'h1):(1'h1)])));
      if ($unsigned(wire4))
        begin
          reg7 <= $unsigned({reg6});
        end
      else
        begin
          reg7 <= (~&wire3[(2'h2):(1'h1)]);
          if ($signed($signed(wire0[(4'hd):(4'hb)])))
            begin
              reg8 <= ((!$signed((^~$signed(wire4)))) + (~&(&$signed(wire3[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg8 <= (^~$signed((reg8 >> wire1[(2'h2):(1'h1)])));
              reg9 <= $unsigned(((-wire1[(1'h0):(1'h0)]) > ((reg7 ?
                      wire1 : wire4[(1'h0):(1'h0)]) ?
                  wire4 : $signed(reg5))));
              reg10 <= (-$signed(reg6));
              reg11 <= (((+wire3[(1'h1):(1'h0)]) ?
                  $unsigned($signed(wire1[(1'h0):(1'h0)])) : $unsigned(reg10[(1'h0):(1'h0)])) >>> $signed((&$unsigned($signed((8'hac))))));
              reg12 <= $signed((-($signed({reg8, (8'ha9)}) ?
                  $unsigned({reg6}) : (~^(reg8 * wire0)))));
            end
          reg13 <= ((reg8 >= ((reg11[(4'he):(3'h7)] ?
                  $signed(wire4) : reg6) > ((wire0 ?
                  reg7 : wire2) && {wire0}))) ?
              {(|$unsigned(((8'hbb) && wire2)))} : $signed({(reg6 ?
                      $unsigned(wire2) : {wire4})}));
          reg14 <= $unsigned(reg11[(4'h9):(4'h9)]);
        end
    end
  assign wire15 = $signed((wire0[(4'hc):(2'h2)] ?
                      $unsigned(($signed(reg7) & $unsigned((8'haf)))) : (((reg6 ?
                                  reg10 : reg5) ?
                              ((7'h44) < wire0) : (^~reg13)) ?
                          ((reg5 ? (8'hae) : (8'haa)) ?
                              reg13[(4'h8):(2'h3)] : ((8'h9d) != (8'ha1))) : ($unsigned(reg14) <= $unsigned(reg13)))));
  assign wire16 = $unsigned($unsigned($unsigned(reg11)));
  assign wire17 = $signed($unsigned(reg5));
  assign wire18 = ((^{{(reg8 << (8'ha1)), wire4[(1'h0):(1'h0)]},
                          $signed($unsigned(wire0))}) ?
                      wire2[(2'h2):(2'h2)] : (($signed((reg8 < (8'hb4))) ?
                              (reg11 && reg8[(5'h12):(4'hb)]) : {((8'hbb) && reg6)}) ?
                          reg9[(4'hf):(4'he)] : $unsigned($signed((~|reg9)))));
  assign wire19 = (reg9 ? reg14 : {wire16, reg13[(4'hb):(4'hb)]});
  always
    @(posedge clk) begin
      reg20 <= {(((&$signed(wire19)) ?
                  $signed((reg9 ?
                      reg6 : reg8)) : $unsigned(wire16[(4'hc):(3'h5)])) ?
              (|$signed((reg9 <<< wire17))) : $signed(wire0[(1'h1):(1'h1)])),
          (&$unsigned(wire15[(2'h3):(1'h0)]))};
      reg21 <= $signed({$signed((~^(wire17 * reg6)))});
      if (wire15)
        begin
          if (($unsigned($signed(({(8'hb8),
              reg6} + $signed(reg7)))) ~^ ($unsigned(wire19) ? reg5 : (!reg6))))
            begin
              reg22 <= ((8'ha0) | (reg11[(3'h5):(3'h5)] ?
                  wire17 : $signed($unsigned(wire1))));
              reg23 <= $unsigned(($unsigned(($signed((8'hbb)) ?
                  {reg20} : reg7)) >>> $unsigned($unsigned((reg6 || reg20)))));
              reg24 <= (+wire0);
            end
          else
            begin
              reg22 <= reg5[(4'ha):(4'h8)];
              reg23 <= (reg9[(3'h4):(3'h4)] <<< reg22[(4'hf):(2'h2)]);
            end
          reg25 <= ((^({reg5[(4'hb):(4'h9)], $unsigned((8'ha7))} ^~ (((8'hac) ?
                      (8'hb0) : wire2) ?
                  $signed((8'hb2)) : (reg11 ? reg21 : reg8)))) ?
              ((wire15 ~^ wire3) ?
                  reg11[(4'hd):(1'h1)] : reg14[(1'h1):(1'h0)]) : ((reg6[(3'h4):(3'h4)] ?
                      reg7[(3'h4):(3'h4)] : $unsigned($unsigned(reg24))) ?
                  (|((8'haf) < reg6)) : $signed((^(wire0 - reg13)))));
          reg26 <= wire15[(2'h3):(1'h0)];
          reg27 <= wire3;
          reg28 <= reg23;
        end
      else
        begin
          reg22 <= reg5[(2'h2):(2'h2)];
        end
    end
  assign wire29 = $signed(($unsigned(($unsigned(reg27) ?
                      $unsigned(reg24) : ((8'ha7) ?
                          reg9 : reg6))) >> $unsigned(wire4)));
  always
    @(posedge clk) begin
      if ({{{$unsigned((!reg28)), wire15}},
          (((8'hbd) ?
              ((wire0 ? (8'h9c) : wire29) || (wire18 ?
                  wire2 : reg26)) : reg23) != reg8)})
        begin
          reg30 <= reg23[(4'hb):(4'h9)];
          reg31 <= $signed((8'ha2));
          reg32 <= ((~|(+((&reg27) ?
              (wire4 ^~ reg10) : $signed(reg23)))) * (-(^~(((8'hba) ?
                  (7'h42) : (7'h44)) ?
              $unsigned((8'ha6)) : wire4))));
        end
      else
        begin
          reg30 <= reg26;
          if ((+$signed(wire3)))
            begin
              reg31 <= $unsigned((reg14[(2'h2):(2'h2)] ?
                  ((^(reg28 ? (8'hb2) : reg7)) ?
                      $unsigned(((8'hac) ?
                          wire2 : reg21)) : reg22[(1'h0):(1'h0)]) : $signed(($signed((8'hbf)) - wire19[(3'h6):(2'h3)]))));
            end
          else
            begin
              reg31 <= $signed($unsigned((-reg28[(3'h7):(3'h6)])));
              reg32 <= (((((reg28 ? (8'ha6) : reg20) ?
                  ((8'hb4) ? reg5 : reg12) : (|wire0)) >= reg23) * (~^((reg11 ?
                  wire17 : wire0) == (wire16 ~^ reg12)))) << $signed((8'ha5)));
              reg33 <= reg28;
              reg34 <= $signed(reg27[(4'hb):(4'h9)]);
              reg35 <= $signed($signed($signed(((reg23 <= reg31) > $signed((8'hbe))))));
            end
          reg36 <= $signed((~&reg30[(1'h0):(1'h0)]));
        end
      if ($signed((reg14 ?
          $signed($signed(reg5)) : $signed(((wire2 ? reg27 : reg28) < (reg21 ?
              reg32 : wire29))))))
        begin
          reg37 <= reg23[(4'hb):(1'h1)];
          if ($unsigned($unsigned(reg35)))
            begin
              reg38 <= $unsigned(reg23[(4'he):(3'h4)]);
              reg39 <= {$signed(($signed($unsigned((8'ha9))) ?
                      $signed((&wire3)) : (8'ha9))),
                  reg30[(1'h0):(1'h0)]};
              reg40 <= reg9[(4'hc):(3'h4)];
            end
          else
            begin
              reg38 <= reg8;
              reg39 <= {reg37,
                  ($unsigned((+$signed(reg25))) ?
                      $signed(((-(8'hbb)) ?
                          $signed(reg33) : (reg9 >>> wire15))) : ($signed(((8'h9d) ?
                          wire2 : reg7)) && ((wire4 <<< reg11) ?
                          (8'hba) : (~reg23))))};
              reg40 <= (8'hbc);
            end
        end
      else
        begin
          reg37 <= $signed({$signed($unsigned((reg30 ? reg20 : reg31))),
              {wire29, {{reg35, wire3}, $signed((8'ha6))}}});
          reg38 <= $unsigned({reg39});
          if (reg23[(1'h0):(1'h0)])
            begin
              reg39 <= $unsigned({$signed(reg38[(4'hd):(4'hd)])});
              reg40 <= (^~($unsigned((~&(reg23 ?
                  wire19 : reg9))) ^ $signed(($unsigned(reg25) ?
                  (reg5 >= wire2) : ((8'had) <= wire3)))));
            end
          else
            begin
              reg39 <= (((7'h41) ?
                  {reg27[(4'he):(4'h8)],
                      $signed($unsigned(wire29))} : $signed(reg32)) >= $unsigned((~^(~(7'h43)))));
              reg40 <= (8'hb3);
              reg41 <= $signed($signed(($signed((8'hae)) ^~ reg11[(3'h4):(2'h3)])));
            end
          reg42 <= wire0;
        end
    end
  assign wire43 = $unsigned(reg14[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg44 <= $unsigned(({(^~$signed((8'hb5))),
              ((reg21 | reg24) ? $unsigned(reg36) : $signed(wire1))} ?
          $signed(((reg22 < reg38) ?
              $unsigned(wire2) : wire19[(5'h11):(3'h6)])) : reg6[(1'h0):(1'h0)]));
      reg45 <= $signed((-{((wire0 ? reg44 : (8'had)) ?
              (~^reg14) : $signed(reg13))}));
      if (reg30[(1'h0):(1'h0)])
        begin
          reg46 <= reg41[(5'h10):(3'h5)];
          reg47 <= $signed($unsigned($unsigned($signed((&reg32)))));
          if (((~$unsigned(wire16[(1'h0):(1'h0)])) ?
              (8'hb8) : $signed((~^(~^$signed(reg28))))))
            begin
              reg48 <= reg38;
              reg49 <= reg20[(3'h4):(3'h4)];
              reg50 <= $signed(wire29);
            end
          else
            begin
              reg48 <= $signed(reg46);
              reg49 <= $signed($signed((($signed((8'hb7)) | $unsigned(reg46)) << {$unsigned(wire16)})));
              reg50 <= $signed($unsigned({reg13}));
              reg51 <= (~((&$unsigned((reg44 != reg11))) ? wire18 : reg23));
            end
        end
      else
        begin
          if ((reg23[(4'hf):(3'h7)] ?
              $unsigned(wire1[(1'h0):(1'h0)]) : $unsigned({reg49,
                  $signed((-wire0))})))
            begin
              reg46 <= $unsigned($unsigned($signed($unsigned($signed(reg45)))));
            end
          else
            begin
              reg46 <= (~|(+$unsigned(((reg11 ? reg47 : wire3) == {reg46}))));
            end
          reg47 <= reg5[(3'h6):(1'h1)];
          reg48 <= $signed((((^~reg44) ?
              reg50[(3'h4):(1'h1)] : ($unsigned(wire18) & (reg38 ^ reg45))) || reg28));
          reg49 <= (wire3 * ((8'ha7) ?
              (($signed(wire1) ?
                  $signed(wire15) : wire15[(3'h6):(3'h6)]) >>> (~^(reg45 >= reg48))) : (~wire43)));
          reg50 <= reg37;
        end
      reg52 <= $signed(($unsigned(reg40[(3'h4):(1'h1)]) ?
          reg7[(3'h7):(3'h7)] : reg6[(2'h3):(1'h1)]));
      reg53 <= $unsigned($unsigned($signed($unsigned(((8'ha8) ?
          reg12 : (8'ha7))))));
    end
  assign wire54 = ((|wire17[(2'h2):(1'h0)]) <= $unsigned(reg27));
  assign wire55 = reg35;
  assign wire56 = reg7;
  assign wire57 = $signed($signed(reg26));
  always
    @(posedge clk) begin
      if (((8'ha0) ?
          $signed($signed($unsigned(wire57))) : $signed((~&(-$unsigned(reg50))))))
        begin
          reg58 <= $unsigned(($unsigned(reg12) ?
              (8'ha0) : $unsigned($signed(wire56[(1'h0):(1'h0)]))));
          reg59 <= {((($unsigned(reg27) ^ (reg22 & reg39)) ?
                      reg33[(4'ha):(3'h4)] : $unsigned((reg11 ?
                          reg22 : reg5))) ?
                  (~|($signed(reg35) | reg13[(3'h6):(3'h5)])) : (wire55[(3'h6):(1'h0)] ?
                      reg20[(4'h9):(4'h8)] : (!reg53))),
              $unsigned($signed(reg21))};
          reg60 <= $signed($unsigned(($signed(reg51) ?
              $signed((^reg35)) : ($unsigned(reg23) ?
                  wire56[(2'h3):(1'h0)] : $unsigned((8'had))))));
          reg61 <= $unsigned(($signed(($signed(reg60) ?
                  (+(8'h9f)) : (wire29 > reg41))) ?
              (reg27 >>> $signed(wire3)) : (^$signed($signed(reg28)))));
        end
      else
        begin
          reg58 <= (~|reg42);
          reg59 <= (^~(reg13[(4'h8):(3'h5)] ~^ (7'h43)));
        end
      reg62 <= $unsigned({reg7, reg13[(2'h2):(2'h2)]});
      reg63 <= reg53[(2'h2):(1'h1)];
    end
endmodule
