module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire27;
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire4,
                 wire5,
                 wire11,
                 wire27,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire4 = (-{$unsigned($signed($unsigned(wire0)))});
  assign wire5 = ((-wire2) & wire0);
  always
    @(posedge clk) begin
      if ($unsigned(wire0[(4'ha):(3'h5)]))
        begin
          reg6 <= ((wire3 ?
                  (($signed(wire5) ? {wire4, wire1} : (~&(7'h41))) ?
                      (8'hbf) : $unsigned(wire1[(1'h1):(1'h0)])) : $unsigned((~(wire5 ?
                      wire2 : wire2)))) ?
              wire5 : $signed($unsigned(wire3)));
          if ($signed(wire0))
            begin
              reg7 <= wire4[(2'h2):(1'h1)];
            end
          else
            begin
              reg7 <= (((~^$signed(wire1)) >> wire2[(2'h2):(2'h2)]) ?
                  wire0 : wire5);
            end
          reg8 <= wire4[(2'h2):(2'h2)];
          reg9 <= $unsigned((wire0[(3'h6):(1'h1)] ?
              {reg8,
                  (((8'hb2) == wire4) == reg8[(4'h9):(1'h0)])} : ($unsigned($unsigned(wire0)) >>> ((wire1 >> (8'had)) > $signed(wire2)))));
          reg10 <= {((reg6 ?
                  ((reg8 ? wire1 : wire0) ?
                      $signed(reg7) : wire4) : wire0[(2'h2):(2'h2)]) >= wire2),
              {wire3[(2'h3):(1'h0)], (+wire4)}};
        end
      else
        begin
          reg6 <= reg8[(2'h2):(2'h2)];
          reg7 <= ($unsigned(reg7) <<< {$unsigned(wire2)});
          reg8 <= (~|$signed((((wire2 >= reg10) ?
              (8'ha0) : (reg10 | (8'h9d))) ^ ((wire2 * reg8) && reg9))));
        end
    end
  assign wire11 = ($signed((^$signed($signed(wire1)))) ^ {$signed({(wire2 ?
                              wire5 : wire3)}),
                      wire1[(5'h15):(5'h13)]});
  module12 #() modinst28 (.clk(clk), .y(wire27), .wire16(wire0), .wire13(reg10), .wire14(wire3), .wire15(wire4));
  assign wire29 = reg6[(3'h5):(1'h1)];
  assign wire30 = wire2;
  always
    @(posedge clk) begin
      if ($signed({wire3[(4'hd):(4'ha)], wire11}))
        begin
          if ($signed(wire2))
            begin
              reg31 <= {($unsigned({wire27[(1'h1):(1'h1)]}) ?
                      reg10[(1'h1):(1'h0)] : reg10[(4'h9):(2'h3)]),
                  $signed(reg10)};
              reg32 <= reg7;
              reg33 <= (8'h9e);
            end
          else
            begin
              reg31 <= wire27[(1'h0):(1'h0)];
              reg32 <= ($signed((!$signed((~reg31)))) <= (($signed({(8'haa)}) <= (+wire30[(4'hb):(3'h7)])) * ((wire3 ^~ $signed(reg8)) << $unsigned($unsigned(reg10)))));
            end
          reg34 <= $unsigned(reg10[(4'ha):(1'h0)]);
        end
      else
        begin
          if (wire1[(4'hc):(4'h8)])
            begin
              reg31 <= wire3[(5'h10):(3'h4)];
              reg32 <= $unsigned(({($unsigned(reg6) ?
                          (reg9 ? wire3 : wire1) : $signed(reg6))} ?
                  (~&wire11[(3'h7):(3'h7)]) : {$signed(wire30)}));
            end
          else
            begin
              reg31 <= wire5;
              reg32 <= $unsigned(reg32[(1'h0):(1'h0)]);
            end
          reg33 <= wire0[(4'h9):(3'h7)];
          if ((+{($signed($unsigned(wire30)) ?
                  (^~$signed(wire0)) : $unsigned($signed(reg32)))}))
            begin
              reg34 <= {(8'hb1)};
              reg35 <= {(^((-(reg34 ? wire1 : reg7)) ?
                      (~^((8'hbf) ? wire3 : reg8)) : {(reg7 | wire29)}))};
            end
          else
            begin
              reg34 <= (wire29 ? reg31 : {$signed((8'had)), $signed(wire1)});
              reg35 <= ($signed($signed((!(~|wire30)))) | (-{(~^$signed(reg9))}));
              reg36 <= reg6[(3'h5):(2'h3)];
              reg37 <= (^$signed((((7'h42) ^ (+wire11)) != wire1)));
            end
          reg38 <= ($signed(wire0) ?
              ({((~|wire30) - wire29)} != {$signed((wire4 ? wire3 : reg36)),
                  $unsigned(wire5)}) : (~&(+$signed((^~wire11)))));
        end
    end
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  assign y = {wire26,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg25,
                 (1'h0)};
  assign wire17 = {wire13[(4'h9):(4'h8)], wire13};
  assign wire18 = $signed(($unsigned(wire15) ?
                      ($unsigned({wire16}) ?
                          wire17 : (~&(wire13 + wire14))) : $unsigned({wire16,
                          (wire16 < wire14)})));
  assign wire19 = $unsigned((((|((8'h9f) ? wire15 : wire16)) ?
                      $signed(wire15[(2'h2):(1'h0)]) : wire14) ~^ (~wire18)));
  assign wire20 = ((~|{wire19}) ? wire14 : wire13[(1'h1):(1'h0)]);
  assign wire21 = ($signed(wire18[(5'h15):(4'hc)]) ?
                      (wire17[(1'h0):(1'h0)] <= {$unsigned({wire18, wire14}),
                          (+$signed(wire18))}) : ($unsigned((~|$signed(wire19))) || {$unsigned($unsigned((8'ha9)))}));
  assign wire22 = (~&((wire16[(4'h9):(2'h3)] || wire13) ?
                      $signed({$signed(wire14),
                          (8'ha1)}) : $signed(($unsigned(wire14) ?
                          (wire20 == (8'hb9)) : $signed(wire21)))));
  assign wire23 = $signed($signed($signed((&{wire18}))));
  assign wire24 = wire17[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg25 <= $unsigned(wire23);
    end
  assign wire26 = $unsigned((({(-wire24), (wire24 ~^ wire14)} ?
                          {(^wire15)} : $signed((8'hb2))) ?
                      $unsigned((wire13[(4'hd):(3'h5)] ?
                          $signed(wire18) : (wire19 ?
                              (8'hb9) : wire21))) : $unsigned($signed($unsigned(wire15)))));
endmodule
