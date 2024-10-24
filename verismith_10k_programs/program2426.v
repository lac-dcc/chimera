module top
#(parameter param35 = {(((((8'h9f) ^ (8'ha6)) ? ((8'haa) ? (8'ha2) : (8'hb5)) : ((8'hbe) ^~ (8'hbc))) ~^ (((8'hb0) <<< (8'ha0)) ? ((8'hbb) ? (8'h9e) : (8'h9c)) : {(8'hbc)})) ? ((^{(8'ha1), (8'hac)}) ? ({(7'h43)} >= ((8'had) ? (8'h9d) : (8'ha9))) : (~|((8'hac) <<< (8'ha1)))) : (~&((~^(7'h43)) << ((8'hb9) ? (8'hbf) : (8'hbd)))))}, 
parameter param36 = (8'hb7))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire14,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg16,
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
  always
    @(posedge clk) begin
      if ((~|(((8'hb4) <<< ($signed(wire1) || wire4)) ?
          wire0[(2'h2):(2'h2)] : {wire2[(4'ha):(3'h7)]})))
        begin
          reg5 <= wire2[(4'ha):(4'h8)];
        end
      else
        begin
          if ($unsigned($signed($signed($unsigned(reg5)))))
            begin
              reg5 <= {wire2[(1'h0):(1'h0)]};
            end
          else
            begin
              reg5 <= ((!$unsigned(((wire4 && wire1) ~^ $unsigned(wire0)))) ?
                  {$unsigned(((7'h41) <<< (8'h9f)))} : wire4);
              reg6 <= {$signed(((~&$unsigned(wire2)) ?
                      {wire3, (wire0 >> reg5)} : ($signed(wire3) ?
                          $unsigned(wire2) : $unsigned(wire0))))};
            end
          reg7 <= (+({wire2, (8'hb3)} ^~ ($signed(wire2) * (7'h44))));
          if (reg7[(1'h0):(1'h0)])
            begin
              reg8 <= ($unsigned(reg7) ?
                  $unsigned($signed($unsigned($unsigned(reg7)))) : $signed((wire2 + $unsigned((^~wire4)))));
              reg9 <= wire1;
              reg10 <= reg9[(3'h4):(1'h0)];
            end
          else
            begin
              reg8 <= ((reg5[(3'h4):(1'h0)] ^~ ((&reg10[(2'h2):(2'h2)]) ?
                  (reg7 * (wire0 < reg8)) : (+((8'ha7) & reg9)))) ^~ $signed(((8'hb6) ?
                  {reg8, reg9} : wire1)));
            end
        end
      reg11 <= $signed(((|{(reg6 <= reg9),
          ((8'h9d) ? reg9 : wire4)}) > wire3[(1'h1):(1'h1)]));
      reg12 <= (wire2 - {wire0});
      reg13 <= {{$signed(wire0[(5'h11):(4'h9)]),
              (+$unsigned(((8'hb3) ? reg7 : wire2)))},
          (^wire0[(5'h10):(4'hc)])};
    end
  assign wire14 = {$unsigned(wire4),
                      (~$unsigned(($unsigned(reg5) ^~ (-reg5))))};
  assign wire15 = (($signed(((reg10 ? reg8 : (7'h42)) && {wire2})) ?
                          (-reg7) : {((~&reg9) ? (8'ha8) : $signed(wire3)),
                              $unsigned($signed(wire4))}) ?
                      (~reg5) : $unsigned(reg11[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg16 <= (~^wire1);
    end
  assign wire17 = reg11[(2'h2):(1'h0)];
  assign wire18 = ($signed((~^reg9[(3'h4):(1'h1)])) <<< wire0);
  assign wire19 = wire15[(3'h7):(1'h1)];
  assign wire20 = ({$signed(wire2[(1'h1):(1'h0)])} != wire0[(5'h13):(2'h2)]);
  assign wire21 = $unsigned(((reg12[(3'h4):(1'h1)] ?
                      wire3[(3'h7):(2'h2)] : $signed(wire2)) >= (8'ha0)));
  assign wire22 = ($signed($unsigned(($signed(reg16) ?
                          {wire4, reg10} : (&(8'hb3))))) ?
                      wire4[(1'h1):(1'h1)] : wire15);
  always
    @(posedge clk) begin
      reg23 <= (~&$unsigned(wire0));
      reg24 <= reg9;
      reg25 <= (($unsigned((-wire0)) ?
          {reg6[(3'h4):(2'h3)],
              {(^~reg12)}} : (wire1[(1'h1):(1'h1)] <= $signed($unsigned(reg8)))) - {(8'ha4),
          $unsigned($signed((reg24 ? reg6 : reg6)))});
      reg26 <= {$unsigned((~^({wire21, reg5} ?
              (reg12 ? wire2 : reg16) : (reg6 >= reg6)))),
          $unsigned((~&$signed(wire4[(2'h3):(2'h3)])))};
    end
  assign wire27 = $unsigned((~reg11[(3'h6):(2'h2)]));
  assign wire28 = wire15[(3'h6):(2'h3)];
  assign wire29 = (|((wire28[(1'h0):(1'h0)] < $unsigned((reg12 | wire21))) || (reg25 ?
                      (+(|reg9)) : ((wire28 ?
                          (7'h44) : reg10) && $signed(reg8)))));
  assign wire30 = (-$unsigned((&(wire28[(1'h0):(1'h0)] ?
                      ((8'hb8) ? wire14 : reg26) : {wire3, wire2}))));
  assign wire31 = (reg11[(3'h7):(3'h6)] ^~ {$signed(wire19),
                      (^reg25[(3'h6):(2'h2)])});
  assign wire32 = (8'hb6);
  assign wire33 = (^(wire22[(3'h4):(1'h0)] | (((~&wire17) >> (wire3 & wire27)) ~^ $unsigned(reg23[(1'h1):(1'h1)]))));
  assign wire34 = $signed(((~|((reg8 ? wire21 : wire17) <<< $signed(wire17))) ?
                      wire33 : wire20));
endmodule
