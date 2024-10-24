module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire4 = $signed(wire3);
  assign wire5 = {$unsigned($unsigned((!$signed(wire1))))};
  assign wire6 = ((~({$unsigned(wire2)} ?
                     (wire0 ?
                         wire4[(4'ha):(2'h3)] : $unsigned(wire3)) : ((!(8'had)) << $signed(wire2)))) | (((wire4 <= (wire4 ?
                             wire0 : wire3)) ?
                         wire1 : ((wire4 ? wire4 : wire3) ?
                             {wire5} : wire3[(4'hc):(3'h6)])) ?
                     ($unsigned($unsigned(wire0)) ?
                         wire2[(4'h9):(1'h0)] : ($unsigned((8'ha7)) >> (wire5 >> wire0))) : {$unsigned((wire1 ?
                             wire4 : wire5))}));
  always
    @(posedge clk) begin
      if (($signed(wire2[(2'h2):(1'h1)]) ?
          (+(({wire6, wire3} >> (-wire6)) << {(wire3 ^ wire1),
              $unsigned(wire3)})) : (wire3[(2'h3):(2'h2)] - (8'hb2))))
        begin
          reg7 <= $signed(wire3);
          reg8 <= $signed((~^(wire5[(3'h5):(2'h3)] > wire2[(4'h8):(2'h2)])));
          if ($unsigned($signed((((8'ha8) >= wire3[(3'h7):(3'h7)]) ?
              ($signed(wire1) ?
                  wire0[(4'h9):(1'h1)] : $unsigned(reg7)) : wire5[(3'h7):(3'h6)]))))
            begin
              reg9 <= $signed(wire1[(3'h5):(1'h1)]);
              reg10 <= (|$signed($unsigned($signed($signed((8'haf))))));
              reg11 <= ((wire1[(4'hd):(3'h6)] ?
                  ((+(wire6 ? wire0 : (8'hb1))) ?
                      (+$signed(wire2)) : (8'hae)) : $signed({(8'hbf),
                      (8'h9f)})) <<< wire1);
              reg12 <= (reg11[(2'h3):(1'h1)] == (+(wire6 ?
                  (+$signed(wire0)) : $signed($unsigned((8'hb2))))));
            end
          else
            begin
              reg9 <= wire5[(3'h7):(3'h7)];
              reg10 <= reg7;
              reg11 <= (^reg8);
              reg12 <= reg7;
              reg13 <= (($signed({(8'ha2), (reg7 ? wire6 : wire2)}) ?
                      $unsigned(wire4[(3'h5):(3'h5)]) : $signed({$unsigned(wire5),
                          wire3})) ?
                  (($signed((~reg10)) == (wire0 ?
                      reg7 : (~|wire1))) > (reg7 ^ ((reg10 < reg8) > wire5))) : (($signed($unsigned(reg9)) <= wire3[(2'h3):(1'h0)]) ?
                      ((8'h9d) & ($signed(wire5) ?
                          reg11[(1'h0):(1'h0)] : (wire6 ?
                              reg9 : wire3))) : (!((^~reg9) ^ reg10))));
            end
        end
      else
        begin
          reg7 <= $signed(reg8);
          reg8 <= reg7;
          reg9 <= $unsigned((($signed(reg12) ?
                  reg7[(4'h9):(4'h9)] : ($unsigned(wire1) & (wire1 > reg12))) ?
              reg13 : {$unsigned($signed(wire4))}));
          if ($unsigned(reg13[(2'h3):(1'h0)]))
            begin
              reg10 <= (&($signed((~&wire4)) && reg12));
              reg11 <= wire2;
              reg12 <= wire5[(3'h4):(3'h4)];
              reg13 <= reg7;
              reg14 <= $unsigned($signed($signed((8'hb1))));
            end
          else
            begin
              reg10 <= reg12[(5'h13):(4'he)];
              reg11 <= wire0;
              reg12 <= $unsigned($unsigned(({$unsigned(reg13)} ?
                  $unsigned((8'hb8)) : reg14)));
              reg13 <= (~$signed((8'h9e)));
              reg14 <= (8'ha7);
            end
          reg15 <= $signed(wire2);
        end
    end
  assign wire16 = $unsigned((~&wire0));
  assign wire17 = (wire2 << $signed($signed((~|$unsigned(reg14)))));
  assign wire18 = (wire1 ?
                      reg14[(1'h0):(1'h0)] : (wire5 ?
                          $unsigned((^~{reg11})) : $signed($signed(((8'hb5) * (8'had))))));
  assign wire19 = ($unsigned({reg13}) ?
                      $unsigned((((reg8 - wire17) ?
                          (&wire0) : $signed(wire3)) - ((wire3 ?
                              wire18 : wire1) ?
                          reg8 : {(8'haa)}))) : $unsigned({({wire3,
                              wire6} << (wire2 + wire17)),
                          $signed((8'hb2))}));
  assign wire20 = {$signed((-reg13))};
  assign wire21 = {(({(reg14 <<< (8'hb1)),
                          (reg7 >>> wire19)} == wire0[(2'h2):(2'h2)]) >= ((reg12 || ((8'ha1) || (8'hb0))) ?
                          $signed((-wire5)) : wire5)),
                      ($signed($signed((reg9 ^ wire17))) ?
                          $unsigned($signed($unsigned(reg14))) : wire17)};
  assign wire22 = (^$signed((((8'had) ^ (wire17 < (7'h42))) ?
                      wire16 : $unsigned(wire1[(4'h9):(4'h9)]))));
  assign wire23 = ($signed((~|$unsigned($unsigned((8'haa))))) - $signed($signed(($signed(reg8) ?
                      $signed(reg8) : (wire18 & reg13)))));
endmodule
