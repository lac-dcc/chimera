module top
#(parameter param33 = (8'hbe), 
parameter param34 = (~&param33))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire5;
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire5,
                 (1'h0)};
  assign wire5 = {(8'hb9), $signed(({wire3[(3'h4):(2'h3)], wire2} >= (8'hb3)))};
  module6 #() modinst26 (.wire8(wire5), .y(wire25), .wire7(wire3), .wire10(wire0), .clk(clk), .wire9(wire4));
  assign wire27 = $signed(wire2);
  assign wire28 = (^~$signed((wire0 ? wire27[(4'ha):(1'h1)] : $signed(wire0))));
  assign wire29 = $unsigned(wire28[(2'h2):(1'h0)]);
  assign wire30 = {{(($signed(wire0) | $unsigned(wire3)) ?
                              ((~wire2) ?
                                  (wire3 <<< wire29) : ((7'h44) << wire5)) : wire28[(1'h0):(1'h0)]),
                          {$signed(wire25),
                              (wire4[(4'ha):(2'h3)] ?
                                  $signed(wire29) : (wire3 != wire3))}}};
  assign wire31 = (|$signed({wire27,
                      ((wire25 >>> wire29) + (wire25 >= wire1))}));
  assign wire32 = $unsigned((|$signed(wire3[(5'h10):(4'hc)])));
endmodule

module module6
#(parameter param24 = (^{(~&(((8'hab) + (7'h40)) ? ((8'ha1) + (8'h9c)) : ((8'hb5) & (8'ha6))))}))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire8[(3'h4):(1'h1)];
      if ((((+{wire9}) ?
          wire10 : wire10[(4'hc):(1'h1)]) || {((|$signed((8'hb7))) | $unsigned(reg11[(3'h6):(3'h6)])),
          $signed((-(~wire7)))}))
        begin
          reg12 <= wire9;
          if (((+{$signed((wire7 >>> wire7))}) ?
              $signed((|($unsigned(reg11) ?
                  {(8'hb3), wire7} : ((8'hb3) ?
                      wire8 : wire9)))) : $unsigned($unsigned($signed((!wire8))))))
            begin
              reg13 <= reg11;
            end
          else
            begin
              reg13 <= {reg13,
                  ($unsigned(((~&reg12) ? wire8[(3'h5):(1'h1)] : (8'haf))) ?
                      $signed(wire7[(5'h11):(4'hb)]) : $signed((reg11[(5'h11):(4'h9)] ?
                          $signed(wire7) : reg13)))};
              reg14 <= wire10[(4'hf):(4'hd)];
            end
        end
      else
        begin
          reg12 <= reg14[(3'h5):(2'h3)];
          reg13 <= $signed(reg13);
          if (($signed($unsigned({(wire9 > wire8)})) <= reg12))
            begin
              reg14 <= $unsigned(wire9);
            end
          else
            begin
              reg14 <= wire7;
            end
          reg15 <= $unsigned({($unsigned(reg13[(3'h4):(2'h2)]) ?
                  $signed(reg14) : ((8'hbb) <<< $unsigned(reg11))),
              $unsigned((|(wire8 ? wire7 : wire10)))});
        end
      if ($unsigned(wire10[(5'h10):(1'h0)]))
        begin
          reg16 <= reg12[(4'h8):(1'h1)];
          reg17 <= ((~|{$unsigned({(8'hac)}), {$signed(wire8)}}) ?
              $unsigned({reg16[(3'h6):(2'h3)],
                  ({reg11, reg13} >>> (~&reg15))}) : (8'ha4));
          reg18 <= (~^$unsigned($unsigned($signed((reg11 ~^ wire10)))));
          reg19 <= ((~|$signed(((wire7 - reg18) < reg18))) <<< {reg12[(4'ha):(4'ha)]});
        end
      else
        begin
          reg16 <= reg14[(5'h10):(3'h7)];
          reg17 <= wire9;
          reg18 <= wire8[(1'h1):(1'h0)];
          reg19 <= reg14[(2'h3):(1'h1)];
          reg20 <= wire9;
        end
    end
  assign wire21 = wire9;
  assign wire22 = $signed($signed(({reg14,
                      $signed(reg15)} <<< {reg18[(1'h0):(1'h0)]})));
  assign wire23 = reg17[(3'h7):(3'h5)];
endmodule
