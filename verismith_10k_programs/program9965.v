module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = wire1[(1'h0):(1'h0)];
  assign wire5 = {wire2[(1'h1):(1'h0)], wire3};
  assign wire6 = $unsigned($signed($unsigned($unsigned((|(8'hb5))))));
  assign wire7 = (wire2 ?
                     $signed($unsigned((wire5 == $unsigned(wire6)))) : $unsigned($signed($unsigned(((8'hb9) ?
                         wire0 : wire0)))));
  always
    @(posedge clk) begin
      if ($signed({{((wire4 ? wire3 : wire7) * (~|wire6)), wire2},
          (wire7[(2'h2):(2'h2)] ?
              $signed($signed((7'h42))) : $signed((wire2 && wire7)))}))
        begin
          reg8 <= (($unsigned((~$signed((8'haa)))) ?
                  $signed(($unsigned(wire6) ?
                      $unsigned(wire4) : $unsigned(wire2))) : (-(7'h42))) ?
              wire0[(3'h4):(2'h2)] : wire0[(4'hc):(2'h2)]);
          reg9 <= $unsigned((wire2[(2'h2):(1'h0)] && wire7[(5'h10):(5'h10)]));
          reg10 <= wire2;
          reg11 <= (((wire0[(3'h5):(2'h3)] ~^ reg9[(4'hc):(2'h3)]) ?
              wire6 : (wire5 == $unsigned((reg9 ?
                  reg10 : wire3)))) << $signed((reg10 >> $signed(reg10))));
          reg12 <= reg8;
        end
      else
        begin
          reg8 <= wire7;
          if ($unsigned((~&$unsigned($signed({(8'ha2)})))))
            begin
              reg9 <= ((+($signed($unsigned(reg8)) <<< (8'hac))) - $signed({(^~(7'h44))}));
              reg10 <= (|(reg8[(4'ha):(3'h6)] << ((wire7 ?
                      reg11[(4'h9):(3'h4)] : wire1[(2'h2):(1'h0)]) ?
                  ($signed(reg9) <<< (^reg9)) : ((wire5 >>> wire5) ?
                      (~^wire6) : $unsigned(wire6)))));
              reg11 <= (-$signed({reg11}));
            end
          else
            begin
              reg9 <= $unsigned($signed(wire6));
              reg10 <= {(wire4[(4'ha):(4'ha)] ?
                      ($unsigned({wire3}) ?
                          ({wire2, (8'hbc)} == (wire3 ?
                              wire6 : wire3)) : (|(8'ha1))) : ((8'h9c) ?
                          wire0 : wire6))};
            end
          reg12 <= $signed(reg10);
          if ((~|(($signed((reg10 * reg10)) ^ ((!(8'ha8)) ?
              {reg8, wire4} : $unsigned(reg12))) ^~ {{$signed(reg8),
                  $signed(wire3)}})))
            begin
              reg13 <= (($signed(wire3) ?
                      ({$unsigned(wire2)} ?
                          ($signed(wire5) ?
                              (~|wire6) : (^wire6)) : ($unsigned(reg10) + {reg10,
                              reg11})) : $signed({((8'ha8) ? (8'had) : wire2),
                          {reg11, wire2}})) ?
                  $unsigned((&reg9)) : $unsigned(reg12));
              reg14 <= ((wire3[(3'h4):(1'h1)] ^ wire5[(2'h2):(1'h1)]) >> $signed((reg10 ?
                  $unsigned(wire4) : $unsigned($signed(reg11)))));
            end
          else
            begin
              reg13 <= $signed((+wire0[(4'h8):(3'h5)]));
              reg14 <= wire6[(2'h3):(2'h2)];
              reg15 <= {($signed($unsigned(wire1[(1'h0):(1'h0)])) < reg10[(5'h13):(4'h9)]),
                  $signed($signed($signed(reg12)))};
              reg16 <= (^(7'h40));
              reg17 <= $signed((($unsigned($unsigned((8'had))) ?
                  reg8 : reg12) << wire4[(3'h4):(2'h2)]));
            end
        end
    end
endmodule
