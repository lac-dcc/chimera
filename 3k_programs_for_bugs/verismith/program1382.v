module top
#(parameter param22 = (~^{{(~^{(8'hab), (8'had)}), ({(7'h41), (7'h40)} <<< ((8'hb6) << (7'h42)))}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire4,
                 reg15,
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
  assign wire4 = wire0[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg5 <= wire3;
      reg6 <= $signed((wire0 >= $signed(reg5[(5'h13):(5'h11)])));
      if ($unsigned($signed(((&(+wire3)) ? {(7'h41)} : wire1[(2'h3):(2'h3)]))))
        begin
          if ((~^(&(+$unsigned((^reg6))))))
            begin
              reg7 <= wire4[(1'h1):(1'h1)];
              reg8 <= (wire4 ? reg6[(3'h4):(1'h1)] : {reg6});
              reg9 <= wire3;
            end
          else
            begin
              reg7 <= $unsigned(wire4[(1'h0):(1'h0)]);
              reg8 <= wire1;
            end
          if (wire1[(2'h2):(1'h0)])
            begin
              reg10 <= {$signed($unsigned((|((8'hb8) * (8'h9c)))))};
              reg11 <= $unsigned(reg5[(3'h6):(2'h3)]);
              reg12 <= (reg5[(3'h5):(2'h3)] ~^ (reg8[(2'h3):(1'h1)] ?
                  wire3 : ($unsigned(wire0[(4'hf):(3'h7)]) ?
                      $signed(reg7[(3'h5):(1'h0)]) : (reg5[(2'h2):(1'h1)] * $unsigned(reg6)))));
              reg13 <= (7'h44);
            end
          else
            begin
              reg10 <= {(!$signed($unsigned($signed(wire0))))};
              reg11 <= (8'hb4);
              reg12 <= $unsigned(reg7[(1'h0):(1'h0)]);
            end
          reg14 <= ((wire3[(4'hd):(3'h6)] ?
              (^~$signed((+reg12))) : (^reg11)) <<< wire4[(1'h1):(1'h0)]);
        end
      else
        begin
          reg7 <= $unsigned(($unsigned((reg6[(4'hf):(4'he)] >>> $signed(reg14))) ~^ {{((8'hbd) ?
                      reg7 : reg10)},
              $signed((+reg13))}));
          reg8 <= ($signed(((&reg14[(1'h0):(1'h0)]) ?
              ($signed((8'hab)) || $signed((8'hb7))) : ({wire3,
                  reg14} & wire1))) != $unsigned(reg9));
          reg9 <= (($signed($signed($unsigned(reg13))) > {{(wire3 * reg12),
                      ((8'ha6) ? wire3 : wire0)}}) ?
              (+$unsigned($signed({(8'hb9),
                  wire1}))) : (-($signed(reg8[(4'h8):(2'h3)]) ?
                  reg10[(2'h3):(1'h1)] : (~|$unsigned(wire0)))));
          reg10 <= $signed({$unsigned((8'haf))});
        end
      reg15 <= $unsigned(wire4);
    end
  assign wire16 = wire2;
  assign wire17 = {$signed((reg6[(1'h0):(1'h0)] >> ((reg12 + (8'ha7)) ?
                          {reg11, (8'hb2)} : wire2[(2'h3):(1'h1)]))),
                      (($unsigned((wire1 ? wire0 : wire0)) ?
                              wire0 : (|{reg5})) ?
                          (^~(wire1[(4'ha):(3'h5)] >= $signed(wire1))) : $unsigned(reg12))};
  assign wire18 = (^~(({(8'ha8)} ? ((8'hb8) > (+wire4)) : $unsigned(reg15)) ?
                      (&wire1[(1'h1):(1'h0)]) : ((reg5[(4'h8):(3'h6)] ?
                          (wire17 ? (8'ha3) : reg6) : (reg12 ?
                              reg6 : reg13)) && (~(reg15 * reg12)))));
  assign wire19 = (wire16[(4'hc):(3'h7)] ?
                      (&{($unsigned(reg15) ? (reg14 * wire2) : {wire18}),
                          (^(8'ha0))}) : (-reg9[(3'h4):(1'h1)]));
  assign wire20 = (reg6 ?
                      ((!$signed((~|reg10))) ?
                          (wire0 * (((8'haf) ? wire4 : (8'haa)) ?
                              wire3 : wire3[(4'hb):(1'h0)])) : wire19[(2'h2):(1'h0)]) : (~$signed(reg10)));
  assign wire21 = ((~|(reg15 ? reg11 : $unsigned(wire3[(3'h4):(2'h2)]))) ?
                      reg8[(5'h11):(4'h8)] : {((reg13 <<< $unsigned(wire17)) + (|$signed((7'h42)))),
                          (($unsigned(wire3) ?
                              $signed(wire16) : $signed(wire1)) ^~ (wire17[(4'hb):(2'h3)] ?
                              (reg8 | wire16) : (&wire4)))});
endmodule
