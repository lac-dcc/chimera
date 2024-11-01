module top
#(parameter param23 = (~^{(&(-{(8'hb9), (8'ha8)})), (((&(8'hb9)) ? ((8'ha9) <= (8'had)) : (^(8'ha0))) >= (&((8'haa) ? (8'ha0) : (7'h41))))}), 
parameter param24 = (({(+param23), ((~^(8'ha3)) && (param23 * param23))} < (((param23 ? param23 : param23) >= param23) == ((param23 > param23) > (&param23)))) ^ {(~param23), param23}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = $unsigned(wire1);
  assign wire5 = (^$unsigned((&$unsigned((!wire4)))));
  assign wire6 = $signed((~($unsigned($signed(wire0)) ?
                     wire2 : (wire4[(3'h7):(1'h1)] ~^ wire5[(3'h5):(2'h3)]))));
  always
    @(posedge clk) begin
      reg7 <= $signed($signed((($signed(wire3) ?
              (&wire2) : wire6[(2'h3):(2'h2)]) ?
          (^$unsigned(wire4)) : wire2[(2'h2):(1'h1)])));
      if ((-wire5))
        begin
          reg8 <= {wire1[(3'h7):(3'h4)], {wire3[(3'h7):(2'h3)]}};
          if ((wire1[(1'h0):(1'h0)] ?
              (~&(wire3[(3'h7):(2'h3)] ?
                  wire5 : $signed($unsigned(wire6)))) : ($unsigned($signed((wire6 > wire5))) * (wire6[(3'h6):(1'h1)] <= ((wire1 ?
                  wire1 : wire3) & (reg7 && wire4))))))
            begin
              reg9 <= $unsigned((((8'hb7) ?
                      (|(wire1 ? reg8 : reg8)) : {(|(8'h9e)),
                          (wire6 * wire4)}) ?
                  ((wire0 ? wire2 : (wire6 < wire6)) ?
                      $unsigned($signed(wire2)) : (-wire0[(1'h1):(1'h0)])) : wire4[(4'ha):(1'h0)]));
              reg10 <= $unsigned((reg9[(1'h1):(1'h0)] ?
                  $unsigned($signed((^~wire4))) : ({{(7'h44)}, wire5} ?
                      wire6 : reg9[(2'h2):(2'h2)])));
              reg11 <= $unsigned((~$signed((wire6 >>> $unsigned(wire2)))));
              reg12 <= ($signed($unsigned({{reg11, wire5}, $signed(wire2)})) ?
                  ($unsigned(((~^reg8) ? wire2 : (reg9 <<< wire6))) ?
                      (^~(~^reg8)) : (((reg10 ? (8'hb7) : wire2) ?
                          {reg8} : (^~reg9)) <<< reg8)) : (~|(^reg10[(3'h4):(1'h0)])));
            end
          else
            begin
              reg9 <= (wire3[(4'ha):(3'h6)] ^~ ((~&(wire4 ?
                      $signed(wire1) : $signed(reg9))) ?
                  $unsigned($signed($unsigned(wire4))) : (8'ha8)));
              reg10 <= reg7[(2'h2):(1'h0)];
            end
          if ((reg10 ?
              $signed({(~^(reg11 ? wire6 : wire1)),
                  ((reg8 != wire4) ? ((8'hb7) * reg9) : (8'hb5))}) : ({((wire0 ?
                              wire1 : reg9) ?
                          {reg8, wire5} : (reg8 >>> reg7))} ?
                  reg11 : (($unsigned(reg7) >> wire0) - (wire3[(3'h5):(3'h5)] ?
                      reg7 : (reg12 == (8'ha2)))))))
            begin
              reg13 <= reg8[(2'h2):(1'h1)];
              reg14 <= wire0[(3'h4):(1'h1)];
            end
          else
            begin
              reg13 <= (&(((^wire4) * (7'h41)) ?
                  (reg7 ^ (~&$unsigned(reg8))) : $unsigned(wire4[(3'h6):(1'h0)])));
              reg14 <= $signed(reg13[(2'h2):(1'h0)]);
            end
          reg15 <= wire1;
          reg16 <= ((^$signed((reg10 <= (^reg10)))) > reg7);
        end
      else
        begin
          reg8 <= (($unsigned(($unsigned(reg12) ?
                      (wire1 ^~ (8'hac)) : $signed((8'h9c)))) ?
                  $unsigned(((+reg16) >= {reg12})) : $unsigned({$unsigned(wire4),
                      (reg10 ? reg16 : reg15)})) ?
              reg8 : ((8'ha7) ?
                  wire5 : ($signed($signed(reg15)) > (^(^reg12)))));
          reg9 <= $signed($signed((reg11[(1'h0):(1'h0)] ?
              (reg7[(3'h4):(3'h4)] < (wire3 ?
                  (8'ha5) : wire3)) : $unsigned((reg14 ? reg10 : reg12)))));
          reg10 <= {$unsigned(wire6)};
        end
    end
  assign wire17 = $signed($signed(($signed((reg14 != reg11)) || reg12[(3'h5):(1'h1)])));
  assign wire18 = $unsigned(reg9);
  assign wire19 = $unsigned(($unsigned({(8'hb7)}) < {$signed((&(8'hbc)))}));
  assign wire20 = reg13;
  assign wire21 = $unsigned(($unsigned({(wire1 ? (8'hbf) : reg7)}) <= (wire3 ?
                      (reg11 ?
                          $unsigned(wire3) : (reg7 > reg16)) : $unsigned($unsigned(wire20)))));
  assign wire22 = (($unsigned((+(+(8'hab)))) ?
                          ($signed((wire3 & wire17)) ?
                              ((~|wire18) ?
                                  reg14 : $signed((8'h9c))) : $unsigned((^~wire19))) : (($signed((8'hb2)) && (~^(7'h42))) ?
                              reg13[(1'h1):(1'h0)] : wire0)) ?
                      reg13[(1'h0):(1'h0)] : (!$unsigned(wire1[(3'h5):(2'h2)])));
endmodule
