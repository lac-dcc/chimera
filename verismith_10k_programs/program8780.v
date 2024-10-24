module top
#(parameter param87 = ((((((8'hb9) ? (8'hb0) : (8'hb1)) | ((8'hbe) || (8'ha5))) ? {((8'h9c) ? (8'ha3) : (8'hb4)), ((8'h9d) ? (8'hac) : (8'h9f))} : (((7'h40) ? (8'ha1) : (8'h9d)) ? (8'ha5) : ((8'ha9) << (8'hbf)))) < {(~|((7'h44) ? (8'hba) : (8'hb0)))}) ? (~(^((+(8'hb5)) ^ (&(7'h43))))) : (((^~((8'hb8) <= (8'ha0))) * (((8'hb5) ? (8'haf) : (7'h43)) ? ((8'haf) << (8'ha2)) : ((7'h43) >= (8'hbb)))) ? {((^(8'hbb)) ? ((8'hb9) || (8'hab)) : (^(8'ha1)))} : {(((8'h9e) ^ (8'hab)) && ((8'ha6) * (8'h9c)))})), 
parameter param88 = param87)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire73,
                 wire71,
                 wire15,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg75,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire4 = $unsigned(((!wire2[(2'h2):(1'h1)]) ?
                     wire2[(2'h3):(2'h2)] : ($unsigned($signed(wire2)) ^~ ((wire2 ?
                         wire2 : wire2) < (wire3 <<< (8'hb5))))));
  assign wire5 = (7'h42);
  assign wire6 = wire1;
  assign wire7 = ($signed(wire4[(4'he):(4'ha)]) <= wire6[(4'hf):(4'h8)]);
  assign wire8 = $signed((+$signed($unsigned(wire0[(2'h2):(2'h2)]))));
  assign wire9 = (wire8[(3'h7):(1'h1)] ?
                     wire1[(2'h2):(2'h2)] : ((wire6[(1'h1):(1'h1)] != $signed({wire0,
                             (8'hbc)})) ?
                         ((|wire1[(2'h3):(2'h3)]) <= {(wire1 ~^ wire5),
                             wire1[(2'h3):(2'h3)]}) : wire0));
  always
    @(posedge clk) begin
      if ($unsigned((wire4 >= $unsigned({(8'h9d)}))))
        begin
          reg10 <= $signed(wire5[(3'h4):(1'h0)]);
          if ((^~((~$unsigned({wire0, wire7})) ?
              (wire0 ?
                  (~|(reg10 < wire5)) : $signed($unsigned(wire0))) : $unsigned($signed($signed(wire3))))))
            begin
              reg11 <= $unsigned(((wire5 ?
                      ((&wire9) <<< wire1[(1'h0):(1'h0)]) : ($unsigned(wire9) ?
                          (wire4 >>> wire7) : $unsigned(wire3))) ?
                  $signed((|$unsigned(wire9))) : $signed(wire4[(2'h2):(1'h0)])));
              reg12 <= $unsigned(wire3);
            end
          else
            begin
              reg11 <= (~&$signed({wire7}));
            end
          reg13 <= wire5;
        end
      else
        begin
          reg10 <= (8'haf);
          reg11 <= reg11[(1'h1):(1'h1)];
          reg12 <= (^~(((8'hbf) ?
                  ({wire3} ?
                      (reg12 == wire2) : (wire7 ?
                          (8'hb2) : wire0)) : (+wire8)) ?
              $unsigned($signed((wire0 ?
                  wire9 : wire7))) : (~wire3[(5'h13):(4'h9)])));
        end
      reg14 <= $signed(wire3[(1'h1):(1'h0)]);
    end
  assign wire15 = {reg11[(2'h2):(1'h1)]};
  module16 #() modinst72 (wire71, clk, wire6, wire5, reg11, wire9, wire7);
  assign wire73 = (reg14 >> ((((-(8'ha2)) ?
                      wire71 : $unsigned(wire0)) - wire0[(1'h0):(1'h0)]) || $signed(((~^(8'h9d)) ?
                      $signed(wire1) : ((8'hb8) ? wire15 : reg11)))));
  assign wire74 = (&wire8);
  always
    @(posedge clk) begin
      reg75 <= wire15[(2'h2):(1'h1)];
    end
  assign wire76 = (^wire74[(1'h1):(1'h1)]);
  assign wire77 = ($signed(reg13) > $unsigned(($unsigned((reg12 ^~ reg13)) ?
                      wire1 : {reg11})));
  assign wire78 = wire9;
  assign wire79 = reg75;
  assign wire80 = (-$signed((wire77[(2'h2):(2'h2)] ?
                      (8'haf) : ((wire5 ? (8'ha4) : wire9) ?
                          (wire3 ? reg13 : wire1) : (wire9 ~^ reg13)))));
  assign wire81 = (((^~wire1[(1'h0):(1'h0)]) ?
                      reg75 : $signed((reg75[(5'h10):(2'h2)] ?
                          {wire71} : (8'hb6)))) <<< (-$unsigned(wire15[(5'h13):(4'hb)])));
  assign wire82 = $unsigned(($unsigned(wire81[(1'h0):(1'h0)]) == $signed($unsigned($signed(wire7)))));
  assign wire83 = ((($unsigned($signed(wire4)) ?
                      $unsigned($signed(wire71)) : ($signed(reg10) ?
                          (8'ha9) : (wire6 ^~ reg75))) == $unsigned(wire73[(1'h0):(1'h0)])) >> ({$signed(wire82[(2'h2):(2'h2)])} + $signed(reg14)));
  assign wire84 = $unsigned($signed(wire0[(4'hb):(3'h7)]));
  assign wire85 = ($unsigned(wire77[(3'h6):(1'h0)]) ?
                      (((reg75 >> (wire4 << (8'ha1))) ?
                          $signed(wire76) : $signed(wire71[(3'h4):(1'h0)])) >= (8'ha9)) : $signed($unsigned($unsigned((wire9 + wire82)))));
  assign wire86 = wire6[(4'he):(4'h8)];
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire21;
  input wire [(3'h7):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  assign y = {wire67, wire23, wire22, reg70, reg69, reg24, (1'h0)};
  assign wire22 = (!((~^(wire19 ?
                      (wire17 ?
                          wire18 : (7'h42)) : $signed(wire21))) - $signed((wire17 < (wire19 && wire20)))));
  assign wire23 = ({({$signed((8'ha5))} ?
                              $unsigned($signed(wire22)) : wire21[(3'h6):(1'h0)])} ?
                      (8'hbc) : {$unsigned(wire20[(2'h3):(1'h0)]),
                          wire17[(2'h3):(1'h1)]});
  always
    @(posedge clk) begin
      reg24 <= ((~|$unsigned(wire22[(5'h15):(4'hc)])) && (~|{$unsigned(wire17[(1'h0):(1'h0)]),
          $signed((~wire18))}));
    end
  module25 #() modinst68 (wire67, clk, reg24, wire17, wire18, wire21, wire19);
  always
    @(posedge clk) begin
      reg69 <= ($unsigned(wire67) ?
          wire22[(5'h11):(4'he)] : ((|{(wire19 <<< wire67)}) == $unsigned($unsigned((~wire21)))));
      reg70 <= reg24[(1'h1):(1'h0)];
    end
endmodule

module module25
#(parameter param65 = (((+(((8'hac) ? (8'hb0) : (8'hac)) * ((8'hae) ^ (7'h41)))) ? (^~(((8'hbc) ~^ (8'hb2)) && (~(7'h44)))) : (((8'h9d) ? ((8'ha0) != (8'h9f)) : {(8'hba)}) ? ((~&(8'ha1)) >> ((8'hbf) ? (8'hbd) : (7'h42))) : (~^{(8'hb6), (8'hb3)}))) >= ((&{{(8'hbd)}, {(8'hb1)}}) ? (8'ha8) : (((+(8'h9e)) <= (+(8'had))) ? ((~&(8'hbc)) ? ((8'ha5) + (8'h9e)) : {(8'ha8)}) : ((-(8'ha0)) ? (&(8'hae)) : (~(8'ha7)))))), 
parameter param66 = (((((param65 ? (8'hb0) : param65) && (param65 ^~ (8'ha8))) >> ((8'ha1) >>> (param65 && param65))) ^ param65) << (~^(param65 * {(8'had)}))))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire signed [(4'h9):(1'h0)] wire28;
  input wire signed [(5'h11):(1'h0)] wire27;
  input wire [(4'he):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire52,
                 wire33,
                 wire32,
                 wire31,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
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
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire31 = $signed((&$signed(wire26[(4'hb):(3'h4)])));
  assign wire32 = (wire27[(1'h0):(1'h0)] * $signed({$unsigned($unsigned(wire29)),
                      (wire30[(4'hc):(3'h4)] & $unsigned(wire31))}));
  assign wire33 = ((~^(wire32[(2'h2):(1'h0)] & $signed((wire28 ?
                          wire32 : wire29)))) ?
                      $unsigned((($unsigned(wire32) ?
                              $signed(wire31) : (~|wire30)) ?
                          ($signed(wire32) ?
                              (wire32 ?
                                  wire30 : (8'hb8)) : (wire30 >>> wire29)) : wire30[(4'h8):(2'h3)])) : ($signed($signed((wire27 ?
                          wire27 : wire26))) & (~|($signed((7'h40)) ?
                          wire27[(3'h4):(3'h4)] : $unsigned(wire26)))));
  always
    @(posedge clk) begin
      if ((~^wire33[(3'h4):(2'h3)]))
        begin
          if (wire29[(2'h2):(1'h1)])
            begin
              reg34 <= ($signed(((wire27 ? ((8'ha1) == wire28) : wire33) ?
                      {wire30[(4'hf):(4'hf)],
                          $unsigned(wire32)} : $unsigned(wire32))) ?
                  $unsigned($unsigned((8'haa))) : (((^(wire30 && wire33)) == $signed(wire31)) != (|wire30)));
              reg35 <= wire33[(1'h1):(1'h0)];
              reg36 <= (($signed({reg35}) ?
                      $unsigned({$unsigned(reg35)}) : wire29) ?
                  wire32 : ($unsigned($signed({wire29})) ?
                      $unsigned($signed(wire31[(1'h0):(1'h0)])) : (!wire32)));
              reg37 <= {($unsigned($signed(wire32[(2'h2):(1'h0)])) ?
                      (^reg36[(4'hb):(4'h9)]) : wire26)};
            end
          else
            begin
              reg34 <= (((wire30 ?
                  {reg34[(2'h3):(2'h3)],
                      $signed(wire30)} : (+$unsigned((8'hb0)))) > wire29[(3'h5):(3'h4)]) << (wire29[(1'h0):(1'h0)] != {($signed(wire28) ?
                      $signed(reg34) : (reg37 ? wire26 : wire31))}));
              reg35 <= $unsigned($unsigned((-($signed(wire33) <<< (+reg34)))));
              reg36 <= $signed(wire31);
            end
          if ((^(-($unsigned($unsigned(wire30)) ?
              ($signed(wire32) ?
                  $unsigned(reg34) : (wire26 ?
                      (8'ha2) : wire27)) : $signed(reg34)))))
            begin
              reg38 <= {$unsigned(wire31),
                  $unsigned((reg34 ? $unsigned((!(7'h40))) : $signed(reg34)))};
              reg39 <= $unsigned(wire27[(2'h3):(2'h2)]);
              reg40 <= $unsigned(reg39[(3'h4):(2'h2)]);
              reg41 <= $unsigned(wire32);
            end
          else
            begin
              reg38 <= $unsigned($unsigned(wire31));
              reg39 <= {{(((~wire28) >>> $unsigned(wire30)) == (8'h9d)),
                      {($unsigned(reg36) ? $signed(reg36) : wire28)}},
                  (&reg40[(4'h9):(3'h6)])};
              reg40 <= (((reg34[(1'h0):(1'h0)] <<< {{reg39, wire28},
                      $unsigned((8'hb0))}) ?
                  $unsigned($signed($unsigned(reg41))) : ($unsigned($unsigned(reg39)) * wire33[(1'h0):(1'h0)])) ^~ (~|(+{reg38,
                  (8'ha1)})));
              reg41 <= $signed((wire29[(3'h4):(3'h4)] || (wire26 ~^ (~|(wire30 != reg40)))));
            end
          if ($unsigned(($signed($signed($signed(wire31))) >>> (wire31[(4'h8):(1'h0)] - $unsigned((reg41 <= reg35))))))
            begin
              reg42 <= $unsigned({(reg40 ? {(~^wire30)} : {$signed((8'haa))})});
              reg43 <= {($signed($signed((+(8'hb7)))) >>> $signed(reg37[(4'h9):(2'h2)]))};
            end
          else
            begin
              reg42 <= {{(&{wire29[(1'h1):(1'h0)]})}, wire33};
              reg43 <= reg40;
              reg44 <= ((((~&$signed(reg42)) ?
                  (reg34 ?
                      $unsigned(wire33) : (!(8'hb9))) : ($unsigned(reg40) + (reg40 ?
                      wire31 : reg40))) || wire33[(1'h0):(1'h0)]) | (reg38 ?
                  (((+reg42) && (+wire30)) ?
                      (^reg38) : wire31[(5'h10):(3'h6)]) : wire26));
              reg45 <= $unsigned(({reg44} ?
                  $unsigned((!(reg36 > (7'h44)))) : ({$signed(reg40)} & ((wire29 ?
                          wire26 : reg34) ?
                      {reg44, wire28} : ((8'hb4) ^ reg44)))));
            end
          reg46 <= reg36[(2'h2):(1'h0)];
          reg47 <= (wire31 & (8'hbb));
        end
      else
        begin
          reg34 <= (~&$signed(($unsigned(reg41[(4'hd):(3'h5)]) != $signed((+reg43)))));
          reg35 <= (+{(reg45[(3'h7):(1'h1)] ?
                  reg38 : (((8'hb9) == (8'ha8)) - reg45[(4'hd):(4'hc)])),
              reg47[(2'h3):(1'h1)]});
          reg36 <= (-{$unsigned($unsigned($unsigned(reg40))),
              (~{(^~reg47), (reg41 ? reg43 : wire30)})});
          reg37 <= ($unsigned(({(~|(8'hb0)), (wire33 ? (8'hb2) : reg47)} ?
              $unsigned($signed(reg38)) : $unsigned($signed((8'h9c))))) & (8'ha7));
          reg38 <= $signed($signed($unsigned($unsigned(reg40[(1'h1):(1'h1)]))));
        end
      reg48 <= reg39[(2'h3):(2'h3)];
      reg49 <= (8'ha5);
      reg50 <= {(8'ha7)};
      reg51 <= $signed($signed(wire26[(3'h5):(3'h4)]));
    end
  assign wire52 = ($unsigned({$unsigned($unsigned(reg39)),
                      $signed(wire30[(4'hf):(3'h6)])}) >>> ($unsigned(({(8'hb7),
                              reg51} ?
                          $unsigned(reg40) : reg34)) ?
                      ($signed($unsigned(reg42)) ?
                          ($unsigned(wire29) ~^ {reg47,
                              reg48}) : $signed(wire31[(4'hd):(4'h8)])) : ($signed($signed((8'ha8))) ?
                          (reg49[(3'h6):(3'h6)] ?
                              $unsigned(wire26) : (reg47 ?
                                  (8'hbf) : (8'hbf))) : {reg40,
                              $signed(reg43)})));
  always
    @(posedge clk) begin
      if ($unsigned((((^~(^reg45)) | $signed((reg49 * reg44))) >= (8'ha0))))
        begin
          reg53 <= (($signed((~^$signed(wire27))) <<< $signed(wire26[(3'h5):(3'h4)])) >= reg41);
        end
      else
        begin
          reg53 <= reg38;
          reg54 <= $unsigned({$unsigned((8'hb4))});
          reg55 <= reg39[(2'h2):(1'h0)];
        end
      reg56 <= (-(^~(~$unsigned({reg48, reg35}))));
    end
  assign wire57 = $unsigned((8'hb6));
  assign wire58 = ({(({reg39} ? (reg34 ? reg35 : wire28) : (reg51 && reg49)) ?
                          ((~&wire27) & reg41[(4'hb):(3'h6)]) : reg43[(4'hf):(4'hc)]),
                      wire33} || {((~$unsigned(reg36)) <= reg49[(2'h2):(1'h0)])});
  assign wire59 = (^(~|(({wire52, reg36} ?
                          $unsigned(reg36) : $unsigned(wire58)) ?
                      (+wire30) : $signed((reg38 << wire29)))));
  assign wire60 = $signed($signed({$signed($unsigned(reg50))}));
  assign wire61 = (reg51 ? reg37[(3'h7):(3'h4)] : wire33[(1'h1):(1'h1)]);
  assign wire62 = $signed($unsigned(wire60));
  assign wire63 = wire61;
  assign wire64 = ($signed(wire28) ?
                      (8'ha7) : (wire62[(3'h7):(2'h3)] ?
                          (wire31 ?
                              $unsigned($unsigned(reg47)) : (^~{reg53})) : reg37[(2'h2):(1'h0)]));
endmodule
