module top #(parameter param36 = (8'hb2)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire19,
                 wire18,
                 wire17,
                 wire11,
                 wire4,
                 reg30,
                 reg29,
                 reg22,
                 reg21,
                 reg20,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire0;
  always
    @(posedge clk) begin
      if ((((!({wire3} ?
          wire3[(2'h2):(2'h2)] : wire0)) >> $signed($signed($signed(wire1)))) <= (~&($signed($unsigned(wire3)) ~^ wire1))))
        begin
          reg5 <= wire4;
          reg6 <= wire2[(2'h2):(1'h0)];
          reg7 <= (~|wire4);
          reg8 <= $signed(((((+reg6) << $unsigned((8'hb1))) ?
              $unsigned($unsigned(reg6)) : {{wire1},
                  (reg5 ? wire2 : (8'haa))}) ^~ (8'hbc)));
        end
      else
        begin
          reg5 <= $signed((|wire2[(1'h1):(1'h0)]));
        end
      reg9 <= $unsigned($signed($unsigned((^(~|wire3)))));
      reg10 <= reg6[(1'h0):(1'h0)];
    end
  assign wire11 = (reg6 ? reg6 : reg8);
  always
    @(posedge clk) begin
      reg12 <= wire2[(1'h1):(1'h0)];
      reg13 <= wire2[(3'h4):(2'h2)];
      reg14 <= (($unsigned($unsigned((-reg5))) << ((~^{wire2}) >>> {$signed(reg7),
          $unsigned(reg12)})) || $unsigned($unsigned(($signed(reg8) < reg13[(3'h4):(2'h2)]))));
      reg15 <= $signed(reg12[(4'hd):(1'h0)]);
      reg16 <= $unsigned({reg5[(2'h2):(1'h0)], (8'hab)});
    end
  assign wire17 = ($unsigned({reg15}) * (-$unsigned((!(|reg10)))));
  assign wire18 = ((|$unsigned($signed(reg9[(3'h6):(1'h1)]))) < (^($unsigned($signed(wire17)) ~^ ((^~(8'ha3)) >>> $unsigned(reg16)))));
  assign wire19 = reg5[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg20 <= wire0[(4'ha):(4'h8)];
      reg21 <= wire1[(4'h8):(3'h4)];
      reg22 <= $unsigned(reg13);
    end
  assign wire23 = {wire3};
  assign wire24 = (wire3[(1'h1):(1'h1)] ?
                      ((wire0 ?
                          (~^$signed(wire23)) : ((reg15 <= wire0) ?
                              $signed(reg10) : (wire4 ?
                                  (8'ha4) : (8'hbf)))) || (($signed(wire4) ?
                          $signed(reg6) : $signed(reg16)) >> (((8'hb1) ?
                          (8'ha5) : wire2) >= $unsigned(wire0)))) : $signed((($unsigned(wire11) >> reg15[(1'h1):(1'h1)]) ?
                          (wire19[(3'h4):(3'h4)] ?
                              (reg7 >> reg16) : $unsigned(wire4)) : $unsigned({wire4,
                              wire18}))));
  assign wire25 = $signed(reg20[(3'h4):(1'h0)]);
  assign wire26 = reg21[(5'h10):(5'h10)];
  assign wire27 = $signed(reg6);
  assign wire28 = (|$signed($signed((+$unsigned(reg21)))));
  always
    @(posedge clk) begin
      reg29 <= ((({(reg20 ? reg10 : wire2)} ?
              (reg16[(3'h6):(1'h1)] ^~ (reg5 ?
                  reg13 : reg20)) : wire28[(1'h0):(1'h0)]) & $unsigned((wire11 * (8'hb0)))) ?
          (-wire27) : $signed(wire2));
      reg30 <= (~(reg5 ?
          $signed(wire2[(2'h2):(2'h2)]) : (wire25[(1'h1):(1'h1)] - ($signed((8'ha6)) ?
              {wire26, reg22} : (reg20 ? wire26 : reg10)))));
    end
  assign wire31 = reg30;
  assign wire32 = $signed($unsigned((~&reg15[(1'h1):(1'h0)])));
  assign wire33 = $unsigned((~|wire1));
  assign wire34 = $unsigned($signed((^(~|(wire19 || wire25)))));
  assign wire35 = reg22[(4'hd):(3'h6)];
endmodule
