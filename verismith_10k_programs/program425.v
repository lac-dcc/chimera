module top
#(parameter param35 = (^({(^(&(8'hb4))), {((8'hb2) ? (8'hb9) : (8'hae)), ((8'hb9) ~^ (8'h9e))}} == {((+(8'hb9)) && (^~(8'hae))), ({(8'hbb)} >> {(8'ha0), (8'ha9)})})), 
parameter param36 = ({(param35 ? param35 : param35), (~^((param35 ^~ param35) >>> param35))} <= (-(((!(8'ha0)) != (^(8'ha0))) ? (~(param35 ? param35 : param35)) : ((param35 ? param35 : param35) && param35)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = {wire4[(2'h3):(1'h0)], (^(-(|wire3)))};
  assign wire6 = $signed($signed(wire2));
  assign wire7 = $signed((!wire0[(4'hb):(3'h6)]));
  assign wire8 = wire7[(2'h2):(2'h2)];
  assign wire9 = $unsigned(($unsigned($signed((wire4 < wire7))) ?
                     wire4 : $unsigned(wire6)));
  always
    @(posedge clk) begin
      if ((~wire5))
        begin
          reg10 <= wire3[(4'hf):(3'h5)];
          reg11 <= (^~wire8);
          reg12 <= $signed({($signed(wire1[(1'h1):(1'h0)]) ~^ (8'hb7))});
          if (reg10[(3'h5):(1'h0)])
            begin
              reg13 <= (wire3 >>> reg11);
              reg14 <= wire8[(4'h9):(3'h5)];
              reg15 <= wire2;
              reg16 <= ((+(^(+wire2[(3'h7):(1'h1)]))) | (~|(reg10 ?
                  {(reg13 <= wire7)} : ($signed(wire1) < $unsigned(reg12)))));
            end
          else
            begin
              reg13 <= {wire9[(2'h2):(1'h1)]};
              reg14 <= $signed(((-{(wire4 >> reg10)}) ?
                  (!(wire9 - {(8'h9d), (8'ha9)})) : wire9));
              reg15 <= (($unsigned(wire6[(4'he):(4'hd)]) <<< ((reg13 ?
                  (wire1 ? reg16 : (8'hb9)) : (wire8 ?
                      reg12 : reg13)) ^ (-wire5[(5'h11):(3'h6)]))) | ((|(^~$unsigned(wire0))) >= $signed((reg15[(4'he):(3'h4)] ^ (~reg14)))));
              reg16 <= (^~wire3[(3'h4):(2'h2)]);
            end
          reg17 <= $signed($signed($unsigned(reg14[(1'h0):(1'h0)])));
        end
      else
        begin
          reg10 <= (^~$unsigned({((reg14 ?
                  (8'ha5) : wire8) >> $unsigned(reg11)),
              (+(reg17 || reg14))}));
          reg11 <= $unsigned((reg15 ?
              (wire3 ? reg12 : (~^{wire4, reg16})) : wire2));
        end
    end
  always
    @(posedge clk) begin
      reg18 <= reg11;
      reg19 <= (~{wire6[(3'h7):(3'h5)]});
      reg20 <= ((wire3 & {{(8'hab), (reg13 ? wire2 : (8'ha5))},
          (wire9 ?
              $signed((8'hb9)) : wire2[(4'h8):(3'h6)])}) <<< (~wire8[(1'h1):(1'h0)]));
      reg21 <= ((!(^((wire0 << (8'hb2)) ? $signed(reg12) : wire2))) ?
          (((wire4 >>> (reg16 ? wire1 : reg18)) ?
                  reg14 : (^((8'hbb) ? wire9 : wire1))) ?
              (($signed(reg10) | (^~reg20)) && (~|wire2[(4'hc):(3'h6)])) : {$signed((wire8 ?
                      wire9 : (8'h9f)))}) : (reg15[(4'ha):(3'h4)] ?
              reg15 : reg18[(4'hc):(2'h3)]));
      if (((+{({(8'hb0)} * wire7)}) ?
          wire2[(4'he):(1'h1)] : wire6[(3'h4):(2'h3)]))
        begin
          reg22 <= wire4[(2'h3):(2'h2)];
          reg23 <= (^wire3);
          reg24 <= $unsigned($signed($signed(reg20)));
          reg25 <= $unsigned((reg13 ?
              reg21[(3'h5):(3'h5)] : {$unsigned((reg10 ? reg20 : reg12)),
                  ((~reg23) ? {wire9, wire0} : $signed(reg20))}));
          if (((^$signed((wire7[(4'h8):(3'h7)] ? wire8 : $signed(reg24)))) ?
              $unsigned(({reg19,
                  $unsigned(reg19)} || $signed($signed(wire8)))) : $unsigned($unsigned((reg15 <= (wire6 ?
                  reg23 : reg18))))))
            begin
              reg26 <= $signed((^($unsigned(reg23) >= wire8)));
              reg27 <= wire2[(2'h3):(1'h1)];
              reg28 <= reg23;
              reg29 <= reg26[(3'h5):(1'h1)];
              reg30 <= reg27;
            end
          else
            begin
              reg26 <= (wire2[(2'h3):(1'h1)] ?
                  reg22[(3'h6):(1'h1)] : {{$unsigned(reg29), (|(^~reg18))},
                      ($unsigned(((7'h43) ?
                          wire2 : (8'ha8))) <<< ((~wire1) <<< (wire6 + wire1)))});
              reg27 <= $unsigned({(reg27 < ($signed(wire8) ?
                      $unsigned(wire8) : (reg22 ? reg23 : reg21))),
                  reg14});
              reg28 <= (8'hb2);
              reg29 <= $signed(($unsigned(((reg24 ? wire8 : reg12) ?
                      (8'hbf) : wire1)) ?
                  reg17 : $unsigned($unsigned({reg21}))));
            end
        end
      else
        begin
          reg22 <= (wire5[(3'h4):(2'h3)] <= $signed($unsigned($signed($signed(reg19)))));
          reg23 <= $unsigned(((!(~^(reg20 ? reg21 : reg28))) >= ({reg16,
                  reg20[(4'h9):(1'h1)]} ?
              {$unsigned((8'ha6))} : (reg18[(3'h6):(2'h2)] ?
                  (reg30 ? reg26 : reg12) : reg26))));
          reg24 <= $signed(reg20[(3'h7):(3'h4)]);
        end
    end
  assign wire31 = (~|((($signed(wire8) ? $unsigned(wire5) : (&reg26)) ?
                      reg18 : ((wire3 ?
                          wire8 : reg10) != (reg18 + wire7))) & $signed(wire3)));
  assign wire32 = ($signed((wire0[(2'h3):(1'h1)] ?
                          reg22[(1'h0):(1'h0)] : (reg20[(4'hc):(4'h9)] ?
                              (reg11 >>> wire8) : $signed(reg27)))) ?
                      reg30[(4'h9):(3'h5)] : ((^~$signed({(8'h9e),
                          wire9})) ~^ $signed((^~(reg25 ? reg23 : wire4)))));
  assign wire33 = {$unsigned(reg14[(1'h1):(1'h1)]),
                      (($unsigned((reg11 ?
                          wire4 : (8'ha6))) >> $unsigned({wire2})) <<< (+wire31))};
  assign wire34 = (~&wire31);
endmodule
