module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire41;
  assign y = {wire46, wire45, wire44, wire43, wire4, wire5, wire41, (1'h0)};
  assign wire4 = ({(wire1 <= (wire1 ? (~|wire3) : (wire1 ? wire2 : wire2))),
                         {(~wire2[(3'h4):(3'h4)]), $signed($signed(wire3))}} ?
                     $signed(wire3[(3'h6):(3'h5)]) : wire2[(2'h3):(1'h1)]);
  assign wire5 = $unsigned(($signed($signed(wire4[(2'h3):(1'h0)])) >= wire0));
  module6 #() modinst42 (wire41, clk, wire0, wire3, wire4, wire2, wire5);
  assign wire43 = ((~^(wire3 ?
                      wire4 : (wire0 < $unsigned(wire4)))) + $signed((wire1 ?
                      $unsigned((wire41 > (8'hb7))) : $signed($unsigned(wire3)))));
  assign wire44 = $unsigned(wire4);
  assign wire45 = wire43[(3'h5):(1'h0)];
  assign wire46 = {$unsigned((($signed((8'hae)) ?
                              ((8'hb1) ^ (8'haf)) : $signed(wire0)) ?
                          (wire41 ^~ (|wire0)) : $signed({(8'hb4)}))),
                      wire2};
endmodule

module module6
#(parameter param40 = ({({((8'ha3) ? (7'h42) : (8'ha3))} < ({(8'hb0), (8'ha6)} + (~(8'hb5))))} ? (~&{((8'ha7) || (~^(8'hb2))), {(^~(8'hb1)), ((8'hb2) ? (7'h43) : (8'hb2))}}) : ((|(!(^(8'hb7)))) || (({(8'hb9)} | (&(8'had))) ? ((^~(8'hb2)) ? ((8'hab) <<< (8'ha0)) : ((8'ha7) >> (8'ha6))) : (((8'h9e) ? (8'ha0) : (7'h43)) ? (-(8'h9c)) : (+(8'hbc)))))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire36;
  assign y = {wire39, wire38, wire12, wire13, wire14, wire15, wire36, (1'h0)};
  assign wire12 = (wire8 ? $signed(wire9[(5'h11):(4'ha)]) : (-wire10));
  assign wire13 = ({(~|wire11),
                          ((((8'ha2) != (8'hb0)) ? {(7'h42)} : wire7) ?
                              wire10 : $signed(wire9))} ?
                      $signed(wire8[(4'hd):(4'hb)]) : wire10[(1'h0):(1'h0)]);
  assign wire14 = $signed(($signed({(~wire10)}) ?
                      wire12 : $signed((-$unsigned((8'ha3))))));
  assign wire15 = {(8'ha9)};
  module16 #() modinst37 (.wire18(wire14), .wire19(wire10), .wire21(wire8), .clk(clk), .wire20(wire12), .wire17(wire9), .y(wire36));
  assign wire38 = (&(+wire10[(3'h6):(3'h5)]));
  assign wire39 = ((wire14[(4'hf):(4'h9)] ?
                      wire38 : (({wire14} ?
                          (7'h42) : (wire12 ?
                              wire12 : wire13)) && $signed(wire12[(1'h0):(1'h0)]))) != (!(-(|{wire15}))));
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire21;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  input wire [(4'he):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= $signed(wire21);
      reg23 <= wire19;
      reg24 <= (wire18 ? wire17[(3'h4):(2'h3)] : (+$unsigned(wire17)));
      reg25 <= (($signed(wire21[(3'h4):(2'h3)]) ?
              (($signed(wire19) | {reg23, wire20}) ?
                  $signed((!reg23)) : wire18[(4'he):(4'h8)]) : wire17[(4'hd):(3'h7)]) ?
          (^(~|wire20)) : $unsigned($unsigned({(wire18 ? reg23 : reg22),
              $unsigned(wire21)})));
    end
  always
    @(posedge clk) begin
      if ($signed({$unsigned(((&wire18) ? wire19 : (reg24 && wire21))),
          {((wire17 ^~ reg22) ? $unsigned(wire20) : wire18[(4'h8):(2'h3)]),
              ($unsigned(wire20) <= $signed(wire21))}}))
        begin
          reg26 <= wire17[(4'h8):(1'h1)];
          if (wire18[(5'h13):(4'hd)])
            begin
              reg27 <= wire18[(3'h6):(3'h5)];
            end
          else
            begin
              reg27 <= {(+reg26[(3'h4):(3'h4)]),
                  {$signed(((~|reg27) ?
                          $unsigned(wire20) : $unsigned(reg27)))}};
            end
        end
      else
        begin
          reg26 <= (~&reg22[(2'h2):(1'h0)]);
        end
      reg28 <= {(reg23 || $unsigned((~^(reg25 ? reg22 : wire20)))),
          (wire17[(4'ha):(3'h6)] ? reg24 : $signed(wire17[(4'ha):(4'h9)]))};
      reg29 <= reg27[(1'h1):(1'h1)];
      reg30 <= (($signed(reg23[(2'h2):(1'h0)]) ?
              $unsigned(reg27[(4'hd):(1'h1)]) : reg29[(2'h3):(1'h1)]) ?
          (8'h9d) : reg28);
    end
  assign wire31 = (&($signed($signed({reg27})) || (reg30 ^~ (((7'h44) << wire19) >> (reg26 * reg28)))));
  assign wire32 = reg28;
  assign wire33 = $signed({{$unsigned((reg29 - reg28))}});
  assign wire34 = $signed({(reg27[(4'h9):(4'h9)] > (reg25 ?
                          $signed(reg28) : (^reg24)))});
  assign wire35 = (8'hac);
endmodule
