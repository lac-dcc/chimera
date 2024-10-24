module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  reg signed [(3'h6):(1'h0)] reg4 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  assign y = {wire89,
                 wire87,
                 wire27,
                 wire23,
                 wire22,
                 reg4,
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
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((wire0 ^~ $signed(((wire0 ? wire2 : wire3) >= (wire0 ?
          wire2 : wire3)))) ^~ wire2[(5'h10):(3'h4)]))
        begin
          reg4 <= (~&wire0);
          reg5 <= wire0;
          reg6 <= $signed(((|wire3) ?
              $signed($signed($signed(reg4))) : $unsigned($unsigned((8'hbd)))));
        end
      else
        begin
          reg4 <= ((reg4 ?
              {((&reg5) ?
                      (&reg5) : wire0[(3'h4):(1'h1)])} : $signed($signed((wire3 & wire2)))) == $unsigned(wire3));
          reg5 <= ({reg6[(2'h3):(2'h2)],
                  $signed((wire0 <<< (reg5 >>> wire2)))} ?
              (($signed((wire0 ? reg5 : wire0)) <= reg6) ?
                  reg5[(4'ha):(2'h3)] : (8'h9f)) : (!wire0));
          reg6 <= ((reg6 && ((wire1 ? $unsigned((8'ha7)) : (~|wire1)) ?
                  (7'h44) : $signed((8'ha7)))) ?
              reg4[(2'h3):(2'h2)] : (~&(((reg4 ? wire1 : wire1) ?
                  (wire2 ? reg6 : wire0) : wire2) >= {(~|wire1), {wire3}})));
          reg7 <= reg5;
          if (((($unsigned((reg5 != wire1)) <<< (~$signed(reg4))) >> ((~^(wire2 ?
                  reg6 : (8'ha4))) ~^ (reg5[(3'h5):(3'h4)] ?
                  (wire2 ? reg6 : reg6) : (wire2 ? reg7 : (7'h44))))) ?
              wire2 : ((~&({wire1} * wire3)) - reg7)))
            begin
              reg8 <= $unsigned(reg6[(4'h8):(3'h6)]);
              reg9 <= reg5;
              reg10 <= ((~(~^wire1[(3'h6):(3'h5)])) >>> ($unsigned(reg5[(4'he):(1'h1)]) < $signed(reg6[(1'h0):(1'h0)])));
              reg11 <= wire1;
            end
          else
            begin
              reg8 <= (reg8 ?
                  wire2[(4'ha):(2'h3)] : (($signed(reg6[(2'h2):(1'h1)]) <<< $unsigned((8'ha6))) & {{(reg6 >>> reg10)},
                      $signed(reg7[(4'hf):(4'h9)])}));
              reg9 <= ($unsigned(wire0[(3'h4):(2'h2)]) ^ ((reg9[(1'h0):(1'h0)] ?
                      (reg10 >> $signed(reg6)) : (wire2 ?
                          (|reg11) : reg4[(2'h2):(1'h1)])) ?
                  (($signed(reg5) || (wire0 ^ reg5)) * wire2) : {wire3}));
              reg10 <= $signed({$signed(($unsigned(reg9) ?
                      reg11[(3'h6):(2'h3)] : (|(8'ha8))))});
              reg11 <= $unsigned({$unsigned(((^~reg5) ?
                      (&(8'h9e)) : (wire3 ? reg4 : wire2))),
                  $unsigned((((8'hbb) - reg5) & (8'hb0)))});
              reg12 <= $unsigned(reg7[(4'hd):(4'hb)]);
            end
        end
      reg13 <= $signed({reg7});
      reg14 <= ({reg5[(5'h10):(1'h1)],
          $signed(reg9[(1'h1):(1'h0)])} >= $signed(($unsigned(reg4[(3'h6):(3'h4)]) == reg10)));
      if ({reg7[(4'hf):(2'h3)],
          (wire2[(4'hf):(4'ha)] >> (wire2 >> (reg12[(4'h8):(3'h5)] ?
              $signed(reg4) : ((8'hb0) && reg8))))})
        begin
          reg15 <= $signed((((&(wire2 ~^ reg14)) != (8'hb9)) <= (((+wire3) ?
                  reg7 : {(8'hba)}) ?
              $signed((reg8 != (8'hac))) : ($unsigned(reg14) <<< {reg14,
                  reg12}))));
          reg16 <= reg5;
          if ((reg5[(2'h3):(1'h1)] ?
              $signed($signed(((reg7 + reg7) >= (reg7 < reg11)))) : ((&$unsigned($unsigned((8'ha5)))) ~^ $signed({(+reg13),
                  ((8'hb9) ? (7'h40) : wire3)}))))
            begin
              reg17 <= reg14[(1'h1):(1'h1)];
            end
          else
            begin
              reg17 <= (reg17[(3'h7):(1'h1)] - wire1[(2'h2):(1'h1)]);
              reg18 <= $unsigned(reg6[(4'h8):(3'h6)]);
            end
        end
      else
        begin
          reg15 <= (^{reg13[(4'h9):(4'h9)],
              (reg10[(4'ha):(4'ha)] ? wire3 : {(^~reg9)})});
        end
      reg19 <= (8'h9e);
    end
  always
    @(posedge clk) begin
      reg20 <= $signed((wire0 <<< ((&(|(8'hac))) + {$signed((8'hbd))})));
      reg21 <= {$unsigned({reg10[(3'h4):(1'h1)]})};
    end
  assign wire22 = ({wire2} + {(!((reg9 ? reg5 : (8'hbc)) ?
                          $unsigned(reg5) : $signed(reg19))),
                      (~&((reg14 ? (8'hbc) : wire1) > $unsigned((8'ha2))))});
  assign wire23 = reg9;
  always
    @(posedge clk) begin
      if (reg10)
        begin
          reg24 <= $unsigned($unsigned(reg7[(3'h5):(1'h0)]));
          reg25 <= $signed(((((~|(8'ha6)) >>> $signed(reg6)) & ($signed((8'h9d)) ?
              wire1 : (&reg19))) ^ $signed(reg8[(4'h9):(3'h6)])));
        end
      else
        begin
          reg24 <= ((8'ha3) ?
              reg15 : $signed(($signed((reg12 ? reg6 : reg18)) ?
                  wire23[(4'h8):(2'h3)] : (~^(8'h9e)))));
          reg25 <= {(($unsigned((~|reg11)) ?
                      {reg25[(2'h2):(2'h2)],
                          $unsigned(reg5)} : (+wire3[(3'h6):(1'h0)])) ?
                  ((reg5 ?
                      (reg20 >= reg16) : (reg11 * reg24)) | $unsigned((|reg7))) : (wire1 != ((^wire22) ?
                      $signed(reg18) : wire2[(3'h4):(2'h3)])))};
        end
      reg26 <= (+wire3);
    end
  assign wire27 = $unsigned((reg10[(3'h5):(1'h0)] ?
                      (($unsigned((8'hb0)) ~^ {(8'hbc)}) ?
                          $signed($unsigned(wire3)) : ((^reg21) ?
                              (reg11 ?
                                  reg15 : reg18) : reg17[(3'h6):(3'h4)])) : ((-wire22) * {(^reg18),
                          reg6})));
  module28 #() modinst88 (.wire33(reg26), .wire32(reg25), .y(wire87), .clk(clk), .wire30(reg14), .wire31(reg6), .wire29(reg20));
  assign wire89 = $unsigned($unsigned($unsigned((^(reg9 != reg5)))));
endmodule

module module28
#(parameter param85 = ((^~{(~&(&(8'hbe)))}) ~^ (+(({(8'ha6)} == {(8'hbf), (8'hb2)}) ? ({(8'hb0)} ? {(8'ha5)} : ((8'haa) ? (8'hab) : (8'hba))) : (-(7'h44))))), 
parameter param86 = param85)
(y, clk, wire29, wire30, wire31, wire32, wire33);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire29;
  input wire [(4'h9):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire signed [(4'ha):(1'h0)] wire32;
  input wire [(3'h4):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire82;
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  assign y = {wire84,
                 wire47,
                 wire48,
                 wire49,
                 wire52,
                 wire53,
                 wire82,
                 reg51,
                 reg50,
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
  always
    @(posedge clk) begin
      reg34 <= $unsigned($unsigned((8'hbc)));
      reg35 <= wire30;
      reg36 <= $unsigned($unsigned($signed((reg34[(3'h5):(2'h3)] ?
          (|wire31) : (~wire29)))));
      reg37 <= $signed((wire29 ? $signed($signed((^reg34))) : $signed(reg35)));
    end
  always
    @(posedge clk) begin
      reg38 <= reg36;
      reg39 <= $unsigned($signed((reg35 + $unsigned((|wire31)))));
      if ($unsigned($unsigned(reg34)))
        begin
          reg40 <= ((!(wire29[(1'h1):(1'h0)] ?
                  (reg38 ?
                      (reg38 ? wire29 : wire31) : (wire33 >> reg39)) : (reg34 ?
                      (wire30 > reg35) : (&reg37)))) ?
              ((((wire32 ? wire31 : wire33) ?
                      (reg36 ? wire33 : wire31) : wire30) ?
                  (reg37 || (wire30 >> wire33)) : $signed((7'h44))) <= ((8'h9e) > (~&wire33[(2'h3):(1'h0)]))) : $signed((8'hbd)));
        end
      else
        begin
          reg40 <= $unsigned((($unsigned((wire33 < wire31)) ?
              $signed(reg40) : wire33) <= $signed({reg38[(3'h6):(1'h1)],
              reg39})));
          if ((^~reg38[(3'h4):(1'h0)]))
            begin
              reg41 <= wire29[(1'h0):(1'h0)];
              reg42 <= ($unsigned(reg38) != reg41);
              reg43 <= (7'h43);
              reg44 <= (^~(!reg42[(1'h1):(1'h0)]));
            end
          else
            begin
              reg41 <= (|$signed(reg36[(2'h2):(1'h0)]));
              reg42 <= $unsigned((!($signed($unsigned(wire32)) < {wire31[(3'h4):(1'h0)],
                  (&wire30)})));
            end
          reg45 <= wire31;
          reg46 <= $unsigned({$signed((^~(wire32 << (8'hb4))))});
        end
    end
  assign wire47 = reg36[(3'h5):(2'h3)];
  assign wire48 = ({(reg35 | (-(wire31 >> reg36)))} >>> ((&$signed((-wire47))) ?
                      (reg40 ?
                          $signed((reg41 - wire47)) : reg35) : reg34[(2'h3):(2'h3)]));
  assign wire49 = reg36[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg50 <= reg35;
      reg51 <= $signed($unsigned($unsigned(reg36)));
    end
  assign wire52 = $unsigned((-(wire31 ?
                      {{reg45},
                          reg39[(1'h1):(1'h0)]} : $signed((reg35 >>> reg43)))));
  assign wire53 = ($unsigned(({$unsigned(wire33), (reg50 != wire31)} ?
                      {(reg42 - wire31)} : $signed(wire52[(3'h7):(1'h0)]))) & $unsigned((8'hb2)));
  module54 #() modinst83 (.wire55(reg41), .wire56(reg35), .wire59(reg34), .clk(clk), .wire58(reg46), .wire57(wire30), .y(wire82));
  assign wire84 = $signed(reg40[(4'h9):(4'h8)]);
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire59;
  input wire [(4'hb):(1'h0)] wire58;
  input wire signed [(2'h2):(1'h0)] wire57;
  input wire [(4'h9):(1'h0)] wire56;
  input wire signed [(3'h6):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire64,
                 wire63,
                 wire62,
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
                 reg65,
                 reg61,
                 reg60,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg60 <= ($signed($unsigned($unsigned(wire55[(3'h4):(1'h0)]))) - $unsigned({$signed(wire58[(3'h7):(1'h1)]),
          $unsigned((wire56 ? (8'hb1) : (8'hb4)))}));
      reg61 <= wire59[(1'h1):(1'h1)];
    end
  assign wire62 = reg61;
  assign wire63 = wire55[(1'h0):(1'h0)];
  assign wire64 = {(((~$unsigned(wire63)) ?
                          {(wire59 <<< wire59),
                              {reg60,
                                  wire55}} : reg61) & wire63[(3'h6):(3'h5)])};
  always
    @(posedge clk) begin
      if ((({$unsigned((+(8'ha2)))} != wire62[(1'h1):(1'h1)]) * $unsigned({($unsigned(reg60) | (wire64 ?
              wire58 : (8'hba))),
          wire63[(3'h4):(2'h2)]})))
        begin
          reg65 <= reg61;
        end
      else
        begin
          reg65 <= wire57[(2'h2):(1'h0)];
          reg66 <= wire58;
          reg67 <= wire56[(3'h7):(2'h3)];
          if ((($unsigned(reg60) ?
              $signed(reg65[(4'h9):(1'h0)]) : {reg60}) ^~ ($unsigned(((~&reg66) & $signed(wire57))) ?
              $signed(reg60[(5'h12):(4'hb)]) : (8'hb1))))
            begin
              reg68 <= (wire64[(2'h3):(1'h0)] ?
                  (~&reg66) : reg67[(5'h10):(3'h5)]);
              reg69 <= ((({(~wire56), {wire56}} ?
                      wire55 : $signed((&reg61))) && ($unsigned(reg60[(1'h0):(1'h0)]) ?
                      $unsigned((wire64 | wire58)) : wire64)) ?
                  ((!(7'h40)) ?
                      (|$unsigned((wire58 ?
                          reg66 : (7'h42)))) : reg67[(3'h7):(2'h3)]) : wire63);
              reg70 <= reg65[(3'h5):(1'h0)];
              reg71 <= (~|(-wire62));
            end
          else
            begin
              reg68 <= {$unsigned($unsigned(($unsigned(wire59) & (-wire57)))),
                  {$signed($signed(reg60))}};
              reg69 <= $unsigned((-reg61[(1'h0):(1'h0)]));
              reg70 <= (|((((reg61 ?
                  (8'hb0) : reg71) >>> (reg60 >= reg66)) << (~^{reg71,
                  wire63})) ^~ (^~(8'hac))));
              reg71 <= $unsigned(reg69[(2'h3):(2'h2)]);
              reg72 <= (reg66[(1'h1):(1'h1)] ?
                  reg70 : (~|((-$signed((8'hb1))) ?
                      $signed(reg67[(1'h1):(1'h0)]) : reg69)));
            end
        end
      reg73 <= ($unsigned((((~|wire62) ? (wire63 && reg65) : {(8'ha2)}) ?
          reg61 : $signed((wire57 || (8'h9d))))) * reg60[(4'ha):(3'h6)]);
      reg74 <= reg66[(1'h1):(1'h0)];
      reg75 <= $unsigned((-wire62));
    end
  assign wire76 = {$unsigned(reg69[(3'h5):(3'h4)])};
  assign wire77 = $signed(((reg69[(1'h0):(1'h0)] ?
                          $signed(reg71[(4'ha):(4'h9)]) : (~|reg73)) ?
                      $signed(((!reg61) ?
                          (8'h9c) : ((8'hb3) ?
                              reg74 : reg73))) : {$signed((reg71 && reg61)),
                          (wire76 - reg67)}));
  assign wire78 = ((reg61 ^~ $signed($unsigned($unsigned(reg61)))) > reg61);
  assign wire79 = (wire64 ?
                      ((-(reg67 ? {reg67} : $unsigned(reg71))) ?
                          (!{wire78,
                              (~|(8'hba))}) : reg70[(3'h7):(3'h5)]) : $unsigned($unsigned(wire56[(4'h9):(3'h4)])));
  assign wire80 = reg71;
  assign wire81 = reg73;
endmodule
