module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire17;
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire37,
                 wire30,
                 wire17,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire4);
      reg6 <= wire4[(2'h3):(2'h3)];
      reg7 <= $unsigned(wire0);
      if ($unsigned($unsigned(wire1)))
        begin
          reg8 <= $unsigned(((wire4[(1'h0):(1'h0)] ?
                  ((wire1 ? (7'h41) : wire1) ?
                      (reg5 ? reg5 : reg6) : (8'hb5)) : ((wire3 ?
                          wire3 : wire4) ?
                      ((7'h41) >>> wire1) : (~^wire1))) ?
              ($signed($signed(reg6)) ?
                  wire1[(2'h2):(1'h0)] : reg7[(3'h4):(2'h3)]) : reg6));
        end
      else
        begin
          if (((($signed($signed(wire4)) ?
                  $unsigned((reg6 | wire4)) : $signed(wire2[(5'h11):(4'ha)])) ?
              (wire1 << ($signed(wire0) ?
                  $signed(wire3) : (wire3 ?
                      wire1 : wire1))) : {(^wire4[(2'h3):(2'h3)]),
                  (wire1 ?
                      $unsigned(reg7) : (reg5 << reg8))}) | $unsigned(((reg7 && $unsigned((8'ha5))) << (|reg7)))))
            begin
              reg8 <= $signed(wire2);
              reg9 <= (8'hb9);
              reg10 <= $unsigned($signed(reg8));
              reg11 <= ((8'hba) ?
                  $signed($unsigned(reg6[(2'h2):(1'h1)])) : reg9);
              reg12 <= (+wire2);
            end
          else
            begin
              reg8 <= reg7;
              reg9 <= reg5[(5'h13):(4'h9)];
              reg10 <= (reg10 ?
                  $unsigned({(reg12 ? $signed(wire3) : ((8'ha6) <<< wire4)),
                      ($signed((8'had)) ? (~wire2) : reg9)}) : reg7);
              reg11 <= reg8[(3'h4):(3'h4)];
            end
          reg13 <= $unsigned($signed(wire0[(4'h9):(2'h3)]));
          reg14 <= (7'h44);
          reg15 <= (8'hab);
          reg16 <= {(reg15[(4'hb):(3'h7)] >> {reg11})};
        end
    end
  assign wire17 = ((($signed((reg6 >>> reg5)) > ((&reg11) * (wire2 >>> (8'hbd)))) ?
                          {(~^(wire4 & reg14))} : (reg9[(3'h6):(3'h6)] ^~ ((reg7 ?
                              reg13 : reg7) >> $unsigned(reg9)))) ?
                      (|$signed(((&wire0) ? (^~reg8) : {wire0}))) : reg7);
  module18 #() modinst31 (wire30, clk, reg12, wire0, reg10, wire3);
  always
    @(posedge clk) begin
      reg32 <= $signed(wire4);
      reg33 <= reg12;
      reg34 <= reg13[(3'h5):(3'h4)];
      reg35 <= reg8[(2'h2):(2'h2)];
      reg36 <= (wire30[(4'h9):(4'h8)] * {wire1[(1'h1):(1'h0)]});
    end
  assign wire37 = $signed(reg5[(3'h4):(1'h1)]);
endmodule

module module18
#(parameter param29 = (((^~(((8'hae) << (8'hb6)) <= ((8'haf) || (7'h43)))) == (-(((8'ha2) ? (8'ha1) : (8'h9c)) >>> ((8'haa) ? (8'ha9) : (7'h41))))) << {((-(~^(7'h40))) != (((8'hbe) ? (8'ha4) : (8'hbd)) << ((8'hac) + (8'ha0)))), (~&(~^{(8'hb5)}))}))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire signed [(5'h15):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  assign y = {wire28, wire27, wire26, wire25, wire24, wire23, (1'h0)};
  assign wire23 = $signed($unsigned({wire21, (|((8'hba) ^ wire21))}));
  assign wire24 = {$signed($unsigned({(|wire20), $signed((7'h44))}))};
  assign wire25 = (|$unsigned((~&(wire24[(1'h0):(1'h0)] - (8'h9d)))));
  assign wire26 = $signed((+$unsigned((|wire21))));
  assign wire27 = ($signed(wire19[(5'h14):(3'h4)]) ?
                      {$signed(wire26[(4'hd):(1'h0)]),
                          wire24[(2'h2):(1'h0)]} : wire19);
  assign wire28 = {wire23,
                      $unsigned((wire23[(2'h2):(1'h0)] ?
                          (~^wire26) : wire27[(3'h5):(3'h5)]))};
endmodule
