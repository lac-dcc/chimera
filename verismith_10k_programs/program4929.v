module top
#(parameter param50 = (!(8'hb7)), 
parameter param51 = ({param50, (-((param50 ? (8'hb1) : param50) ? (param50 - param50) : param50))} ? param50 : ((({param50} > (param50 <<< param50)) ? {(param50 < param50), ((8'ha1) ? (8'hbe) : param50)} : {(param50 ~^ param50)}) ? param50 : (^~((&param50) ? (param50 ? param50 : param50) : (param50 ? param50 : param50))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire45;
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire45,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {wire1[(3'h4):(2'h2)],
          ($unsigned($signed($unsigned(wire4))) == (&wire0))};
      reg6 <= $unsigned(wire4);
      if (((8'ha6) ?
          (~|(~&(7'h40))) : ((~&((8'h9d) == $unsigned(wire4))) ?
              wire2[(1'h1):(1'h0)] : ($signed((wire1 ?
                  reg5 : wire4)) >>> ($unsigned((8'ha7)) ?
                  wire3[(4'h9):(2'h2)] : wire1[(1'h0):(1'h0)])))))
        begin
          reg7 <= {wire3, $unsigned({$unsigned($signed((8'hb9)))})};
          if ($signed($unsigned(wire2)))
            begin
              reg8 <= wire2;
              reg9 <= {$unsigned(reg7),
                  (((reg8 ? reg5 : $unsigned(wire3)) ?
                          $signed(wire2) : (-(8'ha5))) ?
                      ($signed($signed((8'hb5))) >>> {(^~(8'haa)),
                          (~|wire2)}) : $signed(wire0))};
            end
          else
            begin
              reg8 <= reg6[(4'hb):(3'h5)];
              reg9 <= {reg7[(4'hc):(4'hc)], wire1};
            end
          reg10 <= ({reg6, $unsigned(wire1[(3'h6):(1'h0)])} ?
              ({reg5[(4'h8):(2'h2)]} ?
                  $unsigned(wire4[(1'h0):(1'h0)]) : ((wire0 ?
                      $signed(wire3) : reg6[(1'h0):(1'h0)]) ^~ (8'ha9))) : $unsigned((($unsigned(reg7) == (^wire4)) && (&reg8[(4'he):(3'h7)]))));
        end
      else
        begin
          reg7 <= $unsigned(($signed((~|$signed(reg8))) ?
              {(8'hb2)} : {((wire3 ? wire1 : wire4) | (reg6 >> reg7))}));
          reg8 <= $unsigned(wire1[(2'h2):(2'h2)]);
          reg9 <= $signed((~^($unsigned((^reg9)) ?
              $signed($signed(reg5)) : ($unsigned(reg5) ?
                  $unsigned(wire3) : $unsigned(reg7)))));
          reg10 <= ({reg8[(4'h8):(2'h2)]} >> (~^(reg6[(3'h7):(1'h0)] ?
              (-(wire2 ? wire3 : wire4)) : wire2)));
          reg11 <= $signed(wire4[(2'h2):(1'h0)]);
        end
      reg12 <= $signed(reg10);
      reg13 <= (8'hbc);
    end
  assign wire14 = (-reg5[(3'h5):(2'h3)]);
  assign wire15 = (reg11[(2'h2):(1'h1)] ?
                      {$signed(((wire1 ?
                              reg13 : reg13) > reg6))} : {$signed(reg8)});
  assign wire16 = $signed({{($signed(wire0) | (reg13 ? reg9 : reg6)),
                          (!(+reg10))}});
  assign wire17 = wire15[(4'h9):(4'h8)];
  assign wire18 = $unsigned((+$signed((wire4[(3'h5):(1'h0)] ?
                      wire15[(2'h2):(1'h0)] : (reg7 && reg7)))));
  assign wire19 = $unsigned(reg11[(1'h1):(1'h0)]);
  assign wire20 = (wire15 - (((-$signed(reg10)) ~^ (reg10 ?
                          wire4[(4'ha):(4'ha)] : (~reg7))) ?
                      (8'had) : {reg9[(3'h6):(3'h6)],
                          (wire17 & (reg9 ^~ wire17))}));
  assign wire21 = (8'hbe);
  assign wire22 = $signed(reg7);
  assign wire23 = $unsigned({wire18,
                      ({(wire17 >= wire19)} ?
                          $signed(reg11[(2'h2):(1'h1)]) : ((wire4 << wire0) > (reg12 ~^ wire18)))});
  module24 #() modinst46 (wire45, clk, reg10, reg7, reg9, wire3);
  assign wire47 = (reg8[(4'hc):(3'h5)] >= $unsigned(wire1[(3'h4):(1'h1)]));
  assign wire48 = $unsigned(($unsigned(wire20) && {(wire1 < ((8'hac) ?
                          wire23 : wire19))}));
  assign wire49 = (~&wire15[(1'h0):(1'h0)]);
endmodule

module module24  (y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire28;
  input wire [(5'h11):(1'h0)] wire27;
  input wire [(3'h6):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire29 = $unsigned((wire26[(1'h1):(1'h0)] ?
                      wire25[(4'hc):(4'h9)] : {wire28, wire27}));
  assign wire30 = $signed((^~((((7'h44) == wire27) ?
                      wire27[(4'he):(4'he)] : (~&(8'hbd))) <= $unsigned((~^wire26)))));
  assign wire31 = wire29[(2'h3):(1'h0)];
  assign wire32 = (wire29 || (~^$unsigned(($unsigned(wire29) - (wire27 ?
                      wire31 : wire27)))));
  assign wire33 = (wire25[(4'h8):(3'h4)] >> ((wire30 > (wire25[(4'hd):(1'h1)] >>> wire25[(4'h8):(1'h0)])) - wire26));
  always
    @(posedge clk) begin
      reg34 <= (($signed(($signed((8'h9e)) + (8'hb5))) ?
              {(((8'hac) ? wire31 : wire26) ^ wire31),
                  {wire25[(5'h10):(4'he)]}} : ((8'hb4) == (wire27[(5'h11):(1'h1)] ^ $signed(wire25)))) ?
          wire29 : $unsigned(wire32[(1'h0):(1'h0)]));
      reg35 <= wire30;
    end
  assign wire36 = wire29;
  assign wire37 = $signed({wire33, (7'h43)});
  assign wire38 = (+$unsigned((wire30[(1'h0):(1'h0)] && wire30)));
  assign wire39 = (-(8'hb2));
  assign wire40 = $signed(wire31[(1'h0):(1'h0)]);
  assign wire41 = (^~{$unsigned(($signed(wire31) >> (wire29 ?
                          wire27 : wire29)))});
  assign wire42 = $signed($unsigned(wire32[(3'h5):(1'h1)]));
  assign wire43 = (wire30[(1'h1):(1'h1)] >>> (~&$unsigned($unsigned((+wire27)))));
  assign wire44 = wire41[(5'h11):(1'h0)];
endmodule
