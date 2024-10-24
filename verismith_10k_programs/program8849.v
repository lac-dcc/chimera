module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire11,
                 wire10,
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
                 (1'h0)};
  assign wire5 = {$unsigned((^~$unsigned((wire2 <= wire1))))};
  assign wire6 = wire4[(4'hd):(4'h9)];
  assign wire7 = $unsigned(wire2[(2'h3):(1'h0)]);
  assign wire8 = (^$signed(wire4));
  assign wire9 = $signed(($signed((wire1[(3'h5):(2'h2)] ^~ $unsigned(wire4))) ~^ (7'h43)));
  assign wire10 = ((~^{{(!wire4)},
                          (wire9[(3'h6):(1'h0)] == (wire0 ? wire8 : wire2))}) ?
                      ($unsigned(((wire9 ? wire3 : wire0) * wire1)) ?
                          (!((!wire2) ?
                              $unsigned((8'hb6)) : (~&wire7))) : wire0) : $signed(($signed(wire5) >= wire8)));
  assign wire11 = wire2[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg12 <= (wire1[(2'h3):(2'h3)] <<< ((~|($signed(wire1) ?
              ((8'ha3) ? wire2 : wire8) : wire1[(1'h1):(1'h0)])) ?
          (8'ha2) : $signed($signed($unsigned(wire1)))));
      reg13 <= {(^$signed((8'haf)))};
      reg14 <= {wire10[(5'h11):(3'h4)]};
      reg15 <= wire1[(4'hf):(4'hb)];
      if (($signed((~&($unsigned(reg12) & {wire3}))) || (8'hbf)))
        begin
          if ($unsigned(($unsigned(((|wire3) ?
                  (8'ha9) : reg13[(3'h7):(3'h7)])) ?
              $unsigned($unsigned({wire2,
                  wire11})) : ($signed((wire9 >> wire2)) | (wire3 ?
                  wire3[(4'he):(3'h6)] : (wire7 ? reg12 : wire6))))))
            begin
              reg16 <= $unsigned(reg12[(2'h3):(1'h1)]);
              reg17 <= (~|$unsigned($unsigned({$unsigned(reg14),
                  (reg13 ^~ wire2)})));
              reg18 <= $unsigned($unsigned(((wire3[(1'h1):(1'h1)] ?
                      reg17[(1'h0):(1'h0)] : $unsigned((7'h44))) ?
                  $unsigned($unsigned(wire6)) : {$signed(reg14)})));
            end
          else
            begin
              reg16 <= wire10[(3'h7):(2'h2)];
            end
          reg19 <= (~^$signed(reg12));
          if ((~^({$unsigned((wire1 ? wire3 : wire9))} ?
              ($unsigned((wire1 ? reg15 : (8'ha0))) >> ({wire3,
                  wire10} >= (reg17 != wire0))) : (|wire4))))
            begin
              reg20 <= $unsigned(wire8[(3'h7):(3'h6)]);
              reg21 <= wire11[(3'h7):(3'h5)];
              reg22 <= $signed($signed($signed(wire1[(4'hc):(2'h2)])));
              reg23 <= (~|wire10[(3'h6):(1'h0)]);
            end
          else
            begin
              reg20 <= reg16;
              reg21 <= wire8;
              reg22 <= reg14[(2'h2):(1'h1)];
              reg23 <= ({(($unsigned(reg13) >>> $unsigned(reg17)) * wire9[(1'h1):(1'h0)])} ?
                  $unsigned($signed($signed(reg22[(1'h0):(1'h0)]))) : (reg22[(2'h2):(2'h2)] * ((8'hbe) ?
                      $unsigned((reg20 ?
                          wire2 : reg19)) : ($unsigned(wire3) >= $signed(wire0)))));
              reg24 <= ($unsigned($unsigned($unsigned(wire1[(3'h5):(2'h3)]))) ?
                  $signed($signed($signed(wire10[(4'hd):(1'h0)]))) : reg16);
            end
          reg25 <= wire9;
          if (wire4)
            begin
              reg26 <= (wire6 ?
                  {$signed(($signed(wire4) ?
                          (wire10 ^ reg21) : $unsigned(wire2))),
                      wire7[(3'h4):(2'h2)]} : reg24);
              reg27 <= wire7[(2'h3):(2'h3)];
              reg28 <= {({(^~{(7'h40), wire11})} >= $signed(reg14))};
              reg29 <= {($unsigned(($unsigned(reg27) & (-reg28))) ?
                      $signed((!{reg17, wire3})) : (8'ha9)),
                  $unsigned(reg28)};
            end
          else
            begin
              reg26 <= (^~(8'hb3));
              reg27 <= ($unsigned(reg19[(4'h8):(1'h1)]) || (8'hae));
              reg28 <= $signed((wire4 ?
                  $signed((+{(7'h40)})) : (reg19 ?
                      $unsigned((~&wire5)) : {(7'h40), ((8'hab) <= wire1)})));
              reg29 <= reg28;
              reg30 <= ($unsigned(wire8) << {$signed(wire1[(2'h2):(1'h1)]),
                  (((wire5 << wire4) ?
                      $signed(reg29) : ((8'hb6) && wire1)) << (^~$signed(reg18)))});
            end
        end
      else
        begin
          reg16 <= reg16[(5'h10):(3'h5)];
          reg17 <= {wire1[(1'h1):(1'h1)]};
          reg18 <= (~^$unsigned(reg20[(1'h1):(1'h1)]));
          if ((^($signed(reg22) & (~(reg16[(3'h5):(3'h5)] * $signed(reg19))))))
            begin
              reg19 <= ((reg25 ?
                  (((reg15 == wire8) ? $signed(wire4) : wire2[(2'h3):(2'h3)]) ?
                      $signed(reg26[(4'he):(2'h3)]) : $signed({(8'hbb),
                          reg23})) : {((wire1 ?
                          reg30 : reg15) <= (|wire9))}) <<< (reg21[(1'h0):(1'h0)] ?
                  (reg24 ?
                      (-(8'h9c)) : $unsigned(wire0)) : reg22[(1'h1):(1'h1)]));
              reg20 <= {{(+reg23[(2'h2):(2'h2)])}, reg13};
              reg21 <= $unsigned($signed(reg28));
              reg22 <= ({wire3, reg25} * wire6);
              reg23 <= $signed(wire4[(4'hc):(1'h0)]);
            end
          else
            begin
              reg19 <= wire5[(4'h9):(3'h5)];
              reg20 <= reg22[(2'h2):(1'h0)];
              reg21 <= (|$unsigned((~^wire6)));
              reg22 <= reg18[(4'hf):(1'h1)];
            end
        end
    end
  assign wire31 = ((wire11 ? $unsigned($signed((-(8'h9e)))) : (~^reg18)) ?
                      $signed(reg23) : $unsigned((!(reg13[(1'h0):(1'h0)] != (reg21 >= reg12)))));
  assign wire32 = {{(((|reg13) ?
                              $unsigned(reg15) : wire2[(1'h0):(1'h0)]) - (((7'h44) >= reg23) <<< (+reg19))),
                          $unsigned({$unsigned(wire6), $signed(reg18)})}};
  assign wire33 = (~&(^~reg15));
  assign wire34 = wire5[(3'h6):(3'h4)];
  assign wire35 = (($signed($unsigned((~^reg21))) ?
                      $unsigned(reg16) : $signed(reg22)) ~^ (^reg28));
endmodule
