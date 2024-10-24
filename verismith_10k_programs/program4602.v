module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
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
                 (1'h0)};
  assign wire5 = (!{($signed(wire2) | wire2), {((~|wire3) + wire1)}});
  assign wire6 = wire3;
  assign wire7 = $unsigned(wire4[(1'h1):(1'h0)]);
  assign wire8 = $unsigned($unsigned(wire1[(3'h6):(1'h0)]));
  assign wire9 = wire1[(1'h0):(1'h0)];
  assign wire10 = (~($unsigned((-wire6)) <<< ((!(wire3 ?
                      wire3 : wire4)) << $unsigned(((7'h41) - wire0)))));
  assign wire11 = (wire4 ?
                      $unsigned(($unsigned($signed(wire3)) ?
                          wire7 : ($signed(wire7) > $signed(wire3)))) : wire9[(4'hb):(1'h1)]);
  always
    @(posedge clk) begin
      reg12 <= (wire8 ?
          (~&wire10[(4'hd):(4'hd)]) : $signed($signed(($signed(wire3) > (~|wire3)))));
      reg13 <= $unsigned(wire3[(2'h3):(2'h2)]);
      reg14 <= (wire6[(2'h2):(1'h1)] <<< wire10);
      reg15 <= $signed(((8'h9f) ? reg14[(3'h7):(3'h5)] : (+reg13)));
      if (wire2[(3'h6):(2'h3)])
        begin
          if ($unsigned((~^wire3)))
            begin
              reg16 <= $signed((^~$unsigned($unsigned(wire4[(4'hc):(4'ha)]))));
              reg17 <= reg12[(5'h13):(5'h10)];
              reg18 <= ($signed(reg13) ?
                  (^~((!reg16) >> reg13)) : (!(wire6 ?
                      $unsigned((!wire1)) : $unsigned((wire4 ^~ reg13)))));
            end
          else
            begin
              reg16 <= (~&wire7[(3'h6):(1'h0)]);
              reg17 <= wire10[(4'hd):(3'h7)];
              reg18 <= wire11[(2'h3):(1'h1)];
              reg19 <= (wire4 < $unsigned(reg12));
              reg20 <= (+((+((reg17 >>> wire0) ^ reg13[(3'h6):(3'h5)])) ?
                  $signed((~wire5)) : ((8'hbd) ?
                      reg14[(1'h0):(1'h0)] : $signed(wire11))));
            end
          if ((-$unsigned({$unsigned((-wire4))})))
            begin
              reg21 <= wire3;
            end
          else
            begin
              reg21 <= (~|reg20);
              reg22 <= wire5;
              reg23 <= wire7[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg16 <= {{$unsigned(((reg23 ~^ reg13) && {wire10, wire4}))}};
          if ($unsigned((8'hbe)))
            begin
              reg17 <= reg13[(2'h2):(1'h1)];
              reg18 <= $signed(wire3[(2'h3):(1'h1)]);
              reg19 <= $unsigned($unsigned($unsigned({(-reg22), {wire10}})));
              reg20 <= $unsigned((!wire1[(3'h5):(3'h5)]));
            end
          else
            begin
              reg17 <= ($unsigned(wire0) ?
                  $signed($unsigned($unsigned((wire8 + (8'ha8))))) : ($unsigned($unsigned((wire9 != reg22))) ?
                      reg18[(4'h8):(4'h8)] : {reg21[(1'h1):(1'h1)]}));
            end
          reg21 <= ((^~reg22[(1'h0):(1'h0)]) ?
              ((8'hb2) << $signed((&((8'hbb) ?
                  reg16 : reg12)))) : $unsigned(($unsigned((!wire4)) + (~(wire3 != wire6)))));
        end
    end
  assign wire24 = ((8'h9f) == ({{{wire3, (8'ha4)}}} ?
                      $signed((reg16 ?
                          reg15 : (reg12 > reg13))) : $signed($unsigned($unsigned(reg19)))));
  assign wire25 = ({(~|wire0[(1'h0):(1'h0)]),
                      (((+wire10) || (reg14 ?
                          (8'ha9) : (8'ha4))) ^ $unsigned($signed((8'ha9))))} << reg17);
  assign wire26 = $signed((~|$signed((^~{reg15}))));
  assign wire27 = (+$signed($unsigned($unsigned($signed(wire5)))));
  assign wire28 = $signed({($signed((+reg20)) >= $signed(reg21)),
                      wire7[(3'h6):(1'h1)]});
  assign wire29 = (!$unsigned($unsigned($signed(wire7[(4'ha):(3'h6)]))));
  assign wire30 = (($signed($unsigned(reg13[(1'h1):(1'h0)])) != $signed(wire8)) & wire27[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg31 <= {$signed($unsigned({$signed(wire4)})), reg19[(2'h2):(1'h1)]};
      if ($unsigned({($unsigned(wire0[(5'h11):(4'h9)]) ?
              wire0[(3'h7):(2'h3)] : (^~$signed(wire7)))}))
        begin
          reg32 <= $unsigned((((wire11 <= $signed((8'ha0))) == wire1) >> (((wire30 ?
                  wire5 : wire28) ?
              reg22[(1'h1):(1'h1)] : reg19[(3'h4):(1'h0)]) <<< {reg20})));
          reg33 <= {wire27[(4'hd):(1'h1)], $signed(wire28)};
        end
      else
        begin
          reg32 <= (wire7[(4'ha):(4'h9)] ?
              $unsigned(wire5[(4'hd):(1'h1)]) : ({reg32} ?
                  $signed((~^$unsigned(wire4))) : $unsigned(wire5[(4'h8):(3'h4)])));
          reg33 <= (wire28 ?
              ($unsigned((!wire7)) ?
                  {((reg17 ?
                          (8'ha4) : wire29) >>> $unsigned(wire30))} : (|wire27[(5'h10):(4'hd)])) : wire30[(4'h8):(2'h2)]);
        end
      reg34 <= (~$signed((reg15[(2'h3):(1'h1)] ?
          $unsigned(reg18[(2'h3):(1'h1)]) : wire0)));
    end
  assign wire35 = $unsigned(({reg31[(2'h2):(1'h0)]} ?
                      ((-{reg21}) ?
                          ($unsigned(wire7) < (|reg32)) : {(|wire28)}) : $signed(({reg23,
                          (8'hba)} ~^ wire4[(4'hb):(1'h1)]))));
  assign wire36 = $unsigned($unsigned(($unsigned(wire9) + (~&(wire8 * reg13)))));
  assign wire37 = reg17[(4'hb):(3'h6)];
endmodule
