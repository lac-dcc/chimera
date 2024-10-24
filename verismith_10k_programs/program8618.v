module top
#(parameter param31 = (!{(((+(8'ha5)) <<< (!(8'hb8))) <= (+(~^(8'ha0)))), ((8'hbb) ? (((8'ha0) + (8'h9d)) ? ((8'ha3) == (8'hbb)) : {(8'haa), (8'ha2)}) : {(-(8'h9e))})}), 
parameter param32 = param31)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire30,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
                 wire4,
                 reg29,
                 reg28,
                 reg23,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (-wire1);
  assign wire5 = ($signed((((~|wire1) ? (|wire0) : wire3) ?
                     $unsigned($signed(wire3)) : (wire0 <<< $unsigned(wire4)))) * $unsigned((wire0 ?
                     (|{wire1}) : $unsigned((8'hb9)))));
  assign wire6 = wire2;
  always
    @(posedge clk) begin
      reg7 <= (~(wire1 ?
          ({(~^wire4)} ?
              ((~^wire4) ?
                  $unsigned(wire4) : $signed(wire1)) : wire3) : $signed($unsigned((wire6 || wire5)))));
      reg8 <= (+$unsigned($signed({(wire0 + wire1), wire1})));
      if (($unsigned($unsigned({(+wire2)})) != (&$unsigned($unsigned($signed(reg8))))))
        begin
          if ((wire2[(3'h7):(3'h7)] >>> (8'hbd)))
            begin
              reg9 <= $signed($unsigned(wire0));
              reg10 <= (8'ha2);
              reg11 <= ($unsigned({{(8'ha3)}}) ?
                  wire2[(1'h1):(1'h1)] : wire0[(4'hb):(1'h0)]);
              reg12 <= ($signed($unsigned($signed($signed(wire2)))) | reg9);
              reg13 <= $unsigned($signed($signed({((8'hb6) ? reg12 : wire0),
                  wire6})));
            end
          else
            begin
              reg9 <= reg7[(5'h13):(4'hc)];
            end
          reg14 <= $signed((8'haf));
        end
      else
        begin
          reg9 <= $signed((^(8'hbd)));
          reg10 <= wire4;
          reg11 <= ($signed((&(^~(wire6 ?
              wire0 : wire3)))) & wire4[(4'h8):(3'h4)]);
          if (($signed(wire6) - $unsigned($unsigned(wire0[(1'h0):(1'h0)]))))
            begin
              reg12 <= {(wire1[(4'h9):(3'h6)] ?
                      $unsigned(($unsigned(wire1) ?
                          (reg7 | reg11) : $signed(wire3))) : $unsigned({reg11,
                          wire0}))};
              reg13 <= $unsigned(reg8[(4'ha):(1'h0)]);
            end
          else
            begin
              reg12 <= (reg8 * (^~(~{wire0[(4'hc):(3'h4)]})));
              reg13 <= $signed((({$unsigned((8'hb4))} ?
                  ($signed((8'ha1)) && {(7'h44), wire1}) : {{reg7},
                      wire0[(3'h4):(2'h2)]}) ^ wire0));
              reg14 <= {reg8};
              reg15 <= wire0[(4'hb):(4'h8)];
              reg16 <= ((^(wire6[(3'h5):(3'h5)] - {reg7[(4'hf):(4'ha)],
                  $signed(reg14)})) >= $unsigned(reg7));
            end
        end
    end
  assign wire17 = ($unsigned($unsigned(reg7)) ?
                      $unsigned(reg13) : (+$unsigned(reg11[(2'h2):(1'h1)])));
  assign wire18 = (~|(&$signed(reg7)));
  assign wire19 = $signed({$unsigned(($signed(wire0) ?
                          reg14[(4'hf):(4'hf)] : (-reg11)))});
  assign wire20 = {(+wire18[(4'hc):(4'hc)]),
                      ((-wire2[(1'h1):(1'h1)]) ?
                          reg13 : ($unsigned($signed(wire4)) ?
                              $signed((~^reg13)) : $signed((^(8'hbc)))))};
  assign wire21 = ($unsigned($unsigned(($unsigned(reg14) * (~|reg16)))) >>> ((reg9[(3'h4):(2'h3)] >> ((+wire17) ?
                      {reg11} : (wire4 ?
                          reg11 : (8'h9e)))) << ((wire2[(1'h1):(1'h0)] ?
                      reg9 : wire3[(4'h9):(3'h5)]) || wire2)));
  assign wire22 = $signed(wire0);
  always
    @(posedge clk) begin
      reg23 <= (~&wire4);
    end
  assign wire24 = $unsigned($unsigned(wire21[(5'h12):(3'h5)]));
  assign wire25 = (((($unsigned(wire20) ?
                          (~reg16) : reg23) << ((~|reg12) >= wire2[(4'h9):(1'h1)])) ?
                      (+$signed((wire20 ?
                          reg10 : wire24))) : (~^$unsigned($unsigned(reg23)))) ~^ (~|({$signed(reg14),
                          reg7[(5'h13):(5'h12)]} ?
                      {(^reg13), $unsigned((7'h41))} : (-$signed(wire22)))));
  assign wire26 = (+(wire19[(4'hb):(2'h2)] | (wire19[(1'h1):(1'h0)] >> $unsigned(((8'hbd) >>> wire20)))));
  assign wire27 = (^$unsigned((($signed(wire25) >= (wire5 - wire26)) * $signed(reg12))));
  always
    @(posedge clk) begin
      reg28 <= $unsigned($signed(reg10));
      reg29 <= (|(($unsigned($unsigned((8'hb3))) ?
          $unsigned((reg12 ?
              reg28 : wire3)) : wire27) ~^ wire5[(3'h7):(2'h3)]));
    end
  assign wire30 = wire3;
endmodule
