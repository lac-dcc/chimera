module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire17;
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  assign y = {wire67,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire25,
                 wire17,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($signed(wire3[(2'h3):(2'h3)]) ?
          wire1[(1'h0):(1'h0)] : $unsigned($unsigned((8'ha4))));
      if (($unsigned((8'hac)) ?
          (^(wire1 ~^ wire2[(1'h1):(1'h1)])) : $signed((~^$unsigned((8'hb9))))))
        begin
          reg6 <= (~^$unsigned(wire3[(2'h3):(1'h0)]));
        end
      else
        begin
          reg6 <= (8'hb0);
          reg7 <= wire0[(1'h0):(1'h0)];
          if (($unsigned(reg7[(4'ha):(3'h5)]) ?
              (8'hb1) : (~^(^~($signed((8'h9c)) * reg6[(4'hf):(4'ha)])))))
            begin
              reg8 <= $signed(wire1[(1'h1):(1'h1)]);
              reg9 <= $signed((((reg6[(4'hc):(2'h3)] ~^ (|wire0)) ?
                  $signed($unsigned(reg5)) : $unsigned(wire3[(2'h2):(1'h0)])) >> (wire1 - reg5[(2'h2):(2'h2)])));
              reg10 <= (~(~((wire2[(2'h2):(1'h1)] >> {reg5}) >= (^$unsigned(wire0)))));
              reg11 <= $unsigned(((~&reg10[(2'h2):(1'h0)]) ?
                  (reg9[(3'h7):(2'h2)] ?
                      ($unsigned(wire4) ?
                          $unsigned(wire4) : $signed((8'h9e))) : {reg6}) : (reg9 << wire1)));
              reg12 <= (|((wire4[(5'h10):(4'ha)] - {$unsigned(wire0)}) ^ $signed(((reg5 ?
                  wire0 : reg6) || (wire4 ? reg6 : wire4)))));
            end
          else
            begin
              reg8 <= (-($unsigned($unsigned($signed(reg7))) ?
                  (!reg7[(1'h1):(1'h0)]) : $unsigned((^((8'hb2) ?
                      wire4 : reg6)))));
              reg9 <= (+{wire1[(3'h6):(3'h5)]});
            end
          reg13 <= $unsigned(($unsigned((~&$unsigned(reg12))) & (~$signed((!wire4)))));
        end
      reg14 <= (reg8 ? (~|$signed(reg6[(4'h9):(3'h6)])) : reg5[(2'h2):(1'h0)]);
      reg15 <= reg5;
      reg16 <= reg14;
    end
  assign wire17 = ((~^(~reg6[(4'hc):(4'hc)])) ?
                      ($signed({(+reg9)}) <= {reg12[(3'h6):(1'h0)],
                          $unsigned($signed((8'hb3)))}) : reg8[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg18 <= $unsigned($signed((wire2 == (wire4 ^ wire2[(1'h0):(1'h0)]))));
      if (reg16[(3'h5):(3'h5)])
        begin
          reg19 <= {$signed((~$unsigned(reg9))),
              (reg13 ?
                  (reg12 - $signed((reg5 ?
                      reg5 : reg13))) : (reg10[(4'hb):(2'h3)] ?
                      {(wire4 >> reg12), reg14} : ({wire17} ?
                          reg6[(4'hd):(2'h3)] : {reg8, (8'hbf)})))};
        end
      else
        begin
          reg19 <= reg14[(4'ha):(1'h0)];
          reg20 <= (!(^~$signed(reg14)));
          reg21 <= reg5;
        end
      reg22 <= $unsigned((~{reg7[(3'h6):(1'h0)], reg13}));
      reg23 <= wire3[(2'h2):(1'h0)];
      reg24 <= {(($unsigned((reg9 ? wire1 : (8'ha4))) ?
              (wire17[(3'h5):(3'h4)] >> reg22[(4'h9):(3'h7)]) : ($signed(wire3) ?
                  (reg11 <<< (7'h40)) : (reg14 ~^ (8'hb7)))) ^ (($unsigned(reg8) >>> $signed(reg5)) & reg12))};
    end
  assign wire25 = (8'hb6);
  module26 #() modinst55 (wire54, clk, reg8, reg7, reg18, reg22, reg11);
  assign wire56 = reg22[(4'hc):(1'h0)];
  assign wire57 = $unsigned($signed(((-(^~reg5)) <= $signed(((8'ha5) & wire2)))));
  assign wire58 = (reg5 ?
                      ({$signed($unsigned(reg21))} * ({(reg12 && reg10)} > $unsigned((-(8'ha2))))) : {((~^$unsigned((8'hb3))) ?
                              wire2 : {(reg15 ^ reg10)}),
                          ((&{reg7, reg14}) ^~ ({wire2} >> $signed(reg10)))});
  assign wire59 = reg13[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned(wire57))
        begin
          reg60 <= {(~^(($unsigned(reg22) ?
                      (reg7 ? reg7 : wire56) : $unsigned(reg21)) ?
                  $signed(wire1) : reg22[(3'h5):(3'h4)]))};
          reg61 <= {{(7'h43), (reg16 ^~ {$unsigned(wire0)})}, reg10};
          reg62 <= {$unsigned((8'hb4)),
              ($unsigned((reg11[(1'h0):(1'h0)] ? (!wire3) : (^wire56))) ?
                  reg23 : {((~reg19) ? (reg24 && reg20) : reg16),
                      $unsigned((reg16 ? reg15 : wire17))})};
          reg63 <= (((((wire2 ?
                  reg11 : wire3) ~^ $unsigned(reg14)) <= $signed((reg13 ^ wire2))) ?
              $unsigned((8'ha1)) : (((~reg12) - {reg12}) >= (wire4 <<< (reg10 >>> reg24)))) & reg21[(4'hb):(4'ha)]);
          reg64 <= reg62;
        end
      else
        begin
          if ((reg8 - (~reg6[(2'h2):(1'h0)])))
            begin
              reg60 <= ((!{{$signed(reg13)},
                  reg11[(4'h8):(4'h8)]}) <<< ({$signed({wire58}),
                      reg23[(1'h1):(1'h1)]} ?
                  $signed({(wire4 >> reg19)}) : (wire3[(1'h1):(1'h0)] ?
                      reg60 : {wire2[(4'hd):(4'hb)], (wire25 <= wire2)})));
              reg61 <= wire4[(4'hb):(2'h3)];
              reg62 <= $unsigned(($signed((((7'h41) ? wire57 : (8'hb6)) ?
                      $signed((8'ha8)) : $unsigned(reg6))) ?
                  reg8 : reg20));
            end
          else
            begin
              reg60 <= ($unsigned($signed(reg10[(4'h9):(1'h1)])) ?
                  reg5 : reg14);
              reg61 <= $signed((reg7[(4'hc):(4'hc)] ?
                  wire58 : (reg9 ?
                      (~reg22) : ((wire1 ?
                          wire56 : reg9) || reg7[(4'hc):(1'h0)]))));
              reg62 <= ($unsigned({wire3[(2'h2):(1'h1)],
                      $unsigned((+(8'ha4)))}) ?
                  (((((8'ha8) ?
                          reg7 : wire54) ~^ $unsigned(reg19)) | {(8'h9d)}) ?
                      reg60 : (reg5 < $signed((reg61 & wire1)))) : $unsigned($signed({reg21[(3'h7):(3'h4)],
                      $signed(reg13)})));
            end
          reg63 <= $signed($signed((((wire54 & wire57) ?
              wire17 : (reg22 * wire1)) ^ (reg62 ?
              (reg21 ? reg61 : reg9) : wire4[(4'h8):(1'h1)]))));
          reg64 <= ((8'ha7) > reg61[(3'h5):(1'h1)]);
          reg65 <= $signed($unsigned((~^$signed(wire57[(1'h0):(1'h0)]))));
        end
      reg66 <= ((wire58[(1'h0):(1'h0)] ?
          $unsigned(reg21[(4'hb):(3'h7)]) : $signed(reg61)) + reg15);
    end
  assign wire67 = (reg21 ? reg22[(4'hd):(4'hd)] : (!reg12));
endmodule

module module26
#(parameter param52 = (-((-(!(+(8'hae)))) ^ {((!(7'h41)) ? {(7'h43), (8'hb0)} : ((7'h41) ? (8'hb7) : (8'hb7)))})), 
parameter param53 = param52)
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire31;
  input wire signed [(2'h3):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire [(4'hb):(1'h0)] wire28;
  input wire signed [(2'h2):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  assign y = {wire51,
                 wire48,
                 wire47,
                 wire33,
                 wire32,
                 reg50,
                 reg49,
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
                 reg34,
                 (1'h0)};
  assign wire32 = wire27[(2'h2):(1'h1)];
  assign wire33 = wire27;
  always
    @(posedge clk) begin
      reg34 <= wire30;
      if ((~{(&({wire30} - (wire30 ? wire31 : reg34)))}))
        begin
          reg35 <= {(!(~((~wire28) + $unsigned(reg34)))),
              (^~wire32[(2'h2):(2'h2)])};
          reg36 <= ($unsigned((wire32[(2'h3):(1'h0)] == $unsigned($unsigned(wire33)))) ?
              (-($unsigned(wire28[(4'ha):(2'h2)]) ?
                  {wire29[(1'h0):(1'h0)],
                      $signed(wire28)} : (^~reg34[(5'h13):(5'h11)]))) : wire31[(2'h3):(1'h1)]);
        end
      else
        begin
          reg35 <= wire32[(1'h0):(1'h0)];
        end
      reg37 <= reg34;
      if ($signed(((-(reg35 ?
          reg36[(2'h2):(1'h1)] : (wire29 >>> reg34))) < (|((reg34 > (8'hba)) ?
          (^reg35) : $unsigned((8'hab)))))))
        begin
          reg38 <= $unsigned(($unsigned((reg34[(4'hc):(4'ha)] ?
                  ((8'haf) < (8'hbb)) : (reg37 ? wire27 : wire32))) ?
              {((+wire27) ? ((8'haf) ? (8'ha3) : wire31) : $signed(wire28)),
                  $signed((wire28 >>> wire32))} : (wire32[(2'h2):(2'h2)] ?
                  wire27[(1'h1):(1'h0)] : ($unsigned(reg34) ?
                      (reg34 && wire33) : (~^reg34)))));
          reg39 <= reg37;
          reg40 <= (&$unsigned(wire29[(1'h1):(1'h0)]));
          reg41 <= $unsigned((($unsigned($unsigned(wire28)) ?
              wire30 : reg37[(2'h3):(1'h0)]) ^~ ($unsigned(reg35[(1'h0):(1'h0)]) ?
              reg34[(3'h7):(1'h0)] : wire30[(1'h0):(1'h0)])));
          reg42 <= $unsigned($unsigned(reg40[(1'h0):(1'h0)]));
        end
      else
        begin
          reg38 <= reg34[(5'h10):(2'h3)];
          reg39 <= (+$unsigned((8'hb7)));
          reg40 <= (~^$signed((reg36[(3'h4):(2'h3)] | (~|(-wire32)))));
          if (reg35)
            begin
              reg41 <= $signed(wire33);
              reg42 <= {((wire32[(1'h1):(1'h0)] << (8'haa)) && wire31[(2'h2):(2'h2)])};
              reg43 <= $signed($signed((~|$signed(wire32))));
              reg44 <= reg40[(4'hd):(4'ha)];
              reg45 <= (~|$signed(wire33));
            end
          else
            begin
              reg41 <= wire30[(2'h2):(1'h0)];
              reg42 <= wire32[(2'h3):(2'h2)];
              reg43 <= $signed(reg40);
              reg44 <= reg39[(3'h4):(3'h4)];
              reg45 <= (reg36[(2'h2):(2'h2)] << ({$unsigned((reg38 ?
                      reg36 : (8'hb3))),
                  reg37} | $signed({(^wire27)})));
            end
        end
      reg46 <= reg42;
    end
  assign wire47 = (!$signed((((reg44 * reg45) >> wire31[(2'h3):(2'h2)]) ^ wire27)));
  assign wire48 = $unsigned(($unsigned({((7'h44) ^ wire33),
                      (wire29 > (8'hb6))}) <<< ((~&reg39[(4'h9):(3'h5)]) ~^ (wire31 ?
                      $signed(wire33) : wire32))));
  always
    @(posedge clk) begin
      if (($signed((!reg43[(4'h8):(3'h7)])) ?
          reg34[(5'h10):(4'h9)] : ($signed((reg45[(1'h1):(1'h0)] - wire32)) || ($signed((wire31 ?
              reg46 : wire31)) || ((wire30 + reg37) ?
              $signed(wire29) : wire29)))))
        begin
          reg49 <= {$unsigned(($unsigned($unsigned(wire27)) <= wire33)),
              ((^~(~|(reg36 ? wire32 : reg35))) ?
                  wire48 : ($unsigned($signed((8'ha9))) ?
                      ((reg38 != reg38) * (wire47 == reg37)) : ((^~wire48) ?
                          (wire29 ? (8'hb5) : (8'hb0)) : (wire27 ?
                              wire47 : reg44))))};
          reg50 <= (reg35 ? reg34[(5'h15):(4'hb)] : wire32[(1'h0):(1'h0)]);
        end
      else
        begin
          reg49 <= $signed((|$signed(reg44)));
        end
    end
  assign wire51 = reg40;
endmodule
