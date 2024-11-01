module top
#(parameter param46 = {({(((8'ha8) - (8'ha0)) ? ((8'hb2) - (8'hb6)) : ((8'ha8) ? (8'hb5) : (7'h41))), (((8'hb4) != (8'hbb)) ? ((8'hba) != (8'haf)) : ((8'h9c) * (8'hbc)))} ~^ ((((8'hb0) ? (8'ha5) : (7'h40)) + ((8'hbb) + (8'haa))) ? ({(8'h9c)} == {(8'had)}) : (((8'hbe) * (7'h40)) == ((7'h42) >>> (8'haa)))))}, 
parameter param47 = (param46 != ((((param46 != param46) ^~ (param46 & param46)) ? {(param46 >= param46), {(8'hab)}} : {(~param46), param46}) > ((param46 << {(8'hb1), param46}) ? ((8'ha4) ? (param46 ~^ param46) : {param46, param46}) : param46))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire45,
                 wire33,
                 wire12,
                 wire6,
                 wire5,
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
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire4[(2'h2):(1'h0)];
  assign wire6 = wire5;
  always
    @(posedge clk) begin
      reg7 <= {(~&wire3[(1'h0):(1'h0)]),
          (($signed(wire0) ?
                  $unsigned((wire3 == wire4)) : ((wire6 ?
                      wire0 : (7'h44)) || wire2[(1'h0):(1'h0)])) ?
              (wire1[(4'h9):(3'h4)] * ($unsigned(wire2) ?
                  wire0 : (wire0 - wire0))) : $signed($unsigned(wire2[(1'h1):(1'h0)])))};
      reg8 <= wire0[(3'h4):(1'h1)];
      reg9 <= wire4[(1'h0):(1'h0)];
      reg10 <= $signed($unsigned($unsigned({$unsigned(reg9), reg9})));
      reg11 <= (({$unsigned((wire1 ? wire3 : reg8)),
              $signed(wire1[(4'h8):(2'h3)])} ?
          wire5[(2'h3):(1'h1)] : $unsigned(reg8)) > $signed(wire3));
    end
  assign wire12 = (($unsigned((&(wire6 ? wire0 : (8'ha9)))) ?
                      $unsigned((!(wire5 >> reg10))) : (($unsigned(reg7) ?
                          (wire6 ?
                              reg11 : reg9) : {reg9}) << (-$unsigned((8'h9d))))) < (-((|$unsigned(reg9)) ?
                      (&$unsigned((8'hbe))) : (~|{(8'hb3)}))));
  always
    @(posedge clk) begin
      reg13 <= wire2;
      reg14 <= {wire4[(2'h3):(2'h3)], $unsigned(wire3[(2'h3):(1'h1)])};
      if ($signed(wire12))
        begin
          reg15 <= wire12[(2'h2):(2'h2)];
          reg16 <= (($unsigned($unsigned((wire2 ~^ reg7))) ?
                  wire1 : reg10[(4'hf):(4'hf)]) ?
              (wire2 ?
                  (~|$unsigned((reg13 - reg10))) : reg7) : wire5[(3'h7):(3'h4)]);
          reg17 <= $unsigned($unsigned(wire12));
          reg18 <= (((~^wire3) ?
                  $signed({(8'ha6)}) : (~($signed(reg7) ?
                      $signed((8'ha8)) : (reg14 << wire0)))) ?
              (!((^{wire1}) ?
                  ((^reg14) ?
                      wire3[(4'hc):(1'h1)] : {reg17}) : (8'h9c))) : $unsigned((-reg8)));
          reg19 <= reg10;
        end
      else
        begin
          reg15 <= ($unsigned(((wire2[(1'h1):(1'h1)] ?
                      (wire0 - reg16) : (reg19 <<< wire6)) ?
                  $unsigned((wire6 ?
                      reg14 : (7'h44))) : wire1[(2'h2):(2'h2)])) ?
              $unsigned({reg16}) : $signed((reg18[(4'hb):(1'h1)] >>> wire3)));
        end
      if (reg15[(2'h2):(1'h0)])
        begin
          if ((!$unsigned((~^$signed(reg10[(5'h11):(4'h8)])))))
            begin
              reg20 <= $signed(reg9[(4'h8):(1'h0)]);
            end
          else
            begin
              reg20 <= {{{wire12}}, wire2[(1'h0):(1'h0)]};
            end
          reg21 <= {$signed(wire5)};
          reg22 <= reg20[(2'h2):(2'h2)];
          reg23 <= $unsigned($signed((&({reg21, reg15} - $signed(reg13)))));
          reg24 <= reg10;
        end
      else
        begin
          if (($unsigned($signed((+reg14[(1'h1):(1'h0)]))) ?
              (|wire6[(1'h0):(1'h0)]) : reg16[(1'h1):(1'h1)]))
            begin
              reg20 <= $unsigned($unsigned($signed((reg21[(3'h6):(2'h3)] ?
                  wire1 : $signed(reg20)))));
              reg21 <= $unsigned(($signed($signed(wire6[(4'hb):(3'h4)])) && $signed(($unsigned(reg16) < $unsigned(reg18)))));
              reg22 <= {reg14,
                  (({$signed((7'h41)),
                      $unsigned((8'ha0))} && (~&((8'hac) >>> reg20))) == (($signed(wire1) ?
                      reg8 : $unsigned((8'hae))) >> $unsigned($signed(wire3))))};
            end
          else
            begin
              reg20 <= {(wire0 == $unsigned(wire6))};
              reg21 <= reg18;
            end
          reg23 <= (reg15 ?
              ((&$signed($unsigned(reg18))) <<< reg14[(3'h6):(1'h1)]) : reg17[(3'h7):(3'h7)]);
        end
      if ((!{$unsigned((^~((8'hb8) == wire1)))}))
        begin
          reg25 <= wire6[(4'hd):(2'h2)];
          reg26 <= {$signed(wire12)};
          reg27 <= $unsigned(((((wire4 >> wire1) || (8'h9c)) >> $signed($unsigned(reg23))) ?
              (reg22 ? (!{reg17, reg18}) : reg26) : $unsigned((reg26 ?
                  (reg18 ? reg7 : reg22) : {reg16}))));
          reg28 <= (((reg24[(1'h0):(1'h0)] ^ (+{wire2,
                  reg7})) ^ reg19[(5'h11):(4'hf)]) ?
              reg21[(4'h8):(1'h0)] : ($unsigned($signed(reg10[(4'ha):(4'h8)])) >= (&$signed(((8'hbf) <= reg22)))));
          reg29 <= reg25;
        end
      else
        begin
          reg25 <= $signed($signed((+(^~reg9))));
          if ({{$signed(wire5[(3'h7):(1'h0)])}, reg25})
            begin
              reg26 <= wire4[(2'h2):(1'h0)];
            end
          else
            begin
              reg26 <= reg9[(4'ha):(3'h6)];
              reg27 <= $unsigned({(+((|wire2) ?
                      reg29[(3'h7):(3'h5)] : $signed((7'h44)))),
                  $unsigned((reg27[(3'h5):(3'h5)] ?
                      $signed((8'ha6)) : (wire12 > reg29)))});
              reg28 <= $signed((&($unsigned((wire5 || reg8)) < reg22)));
              reg29 <= ((reg13 ?
                  {$unsigned(((8'ha2) ?
                          reg10 : wire6))} : (8'ha2)) >= reg28[(4'hb):(4'ha)]);
            end
          reg30 <= {wire3};
          reg31 <= $signed($signed(wire0));
          reg32 <= reg18[(4'hc):(4'h8)];
        end
    end
  assign wire33 = $signed(((reg30[(4'hb):(4'ha)] ?
                          (((8'hbf) == wire12) < ((8'h9c) ?
                              wire6 : reg7)) : {(reg32 - wire4)}) ?
                      (((reg15 ?
                          (7'h44) : reg10) < {reg21}) | $signed((-(8'hac)))) : reg14));
  always
    @(posedge clk) begin
      reg34 <= reg16[(3'h6):(3'h5)];
      if ((reg8 ~^ (reg30[(4'hc):(4'hc)] ?
          ($unsigned((-reg11)) | $unsigned($signed(reg20))) : reg27)))
        begin
          reg35 <= wire12;
          reg36 <= $unsigned(reg10[(1'h0):(1'h0)]);
          reg37 <= {wire12, {(~&reg30[(4'h9):(3'h6)])}};
          if (reg27)
            begin
              reg38 <= reg29;
              reg39 <= {reg25[(2'h3):(1'h0)]};
            end
          else
            begin
              reg38 <= reg9;
              reg39 <= wire4;
              reg40 <= reg16[(2'h2):(2'h2)];
            end
          reg41 <= ((~(reg22[(1'h1):(1'h1)] ?
              (8'hab) : (!reg38))) != ($unsigned($signed((wire3 ?
                  reg15 : reg16))) ?
              {reg37,
                  (^~reg18)} : ($signed((8'h9d)) - ($signed(wire1) ^ reg22[(2'h3):(2'h2)]))));
        end
      else
        begin
          if (reg24[(1'h1):(1'h1)])
            begin
              reg35 <= {{reg14, $signed(wire12)}, $signed(reg20)};
              reg36 <= (($signed((wire4[(1'h0):(1'h0)] ~^ $signed(wire33))) ?
                  reg36 : {(8'hba)}) * (~&$signed((|reg7[(1'h1):(1'h0)]))));
              reg37 <= (($unsigned(reg23[(3'h7):(3'h7)]) == wire6[(4'hc):(1'h0)]) ?
                  (8'hab) : $signed((-{wire4})));
            end
          else
            begin
              reg35 <= (~&$unsigned((8'h9c)));
              reg36 <= $unsigned(reg37);
              reg37 <= reg38[(3'h4):(3'h4)];
              reg38 <= ($signed((reg13 ?
                      reg28 : ($unsigned(reg17) + (wire6 ? reg35 : reg9)))) ?
                  $signed(reg8[(2'h3):(1'h0)]) : (^~$signed({reg10})));
              reg39 <= (~&(~$unsigned(($signed(reg39) != reg26))));
            end
        end
      reg42 <= {(($signed(((8'ha5) >= reg25)) ?
                  ({reg27} * (reg25 < reg8)) : $signed(reg10[(4'hb):(1'h0)])) ?
              ($signed($signed(wire0)) ^~ $unsigned(wire0)) : reg23),
          reg27};
      reg43 <= wire0;
      reg44 <= (wire2 ?
          $signed(($signed((~&reg39)) ?
              (-$signed(reg38)) : {$signed(reg16)})) : $signed(((reg31[(3'h4):(3'h4)] ?
              (^wire33) : (reg40 ^~ (8'hbf))) || reg34[(4'hb):(2'h2)])));
    end
  assign wire45 = $signed((+$signed($unsigned(((8'had) <= reg31)))));
endmodule
