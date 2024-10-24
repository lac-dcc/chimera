module top
#(parameter param36 = (^~({(((8'hba) < (8'hb8)) ? ((7'h42) ? (7'h44) : (8'hbf)) : (8'ha6)), (((8'hbd) | (8'had)) ? ((8'ha9) ? (8'hb8) : (7'h42)) : {(8'h9d)})} * (|(((8'had) ? (8'hbb) : (8'h9c)) ? ((8'ha5) ^~ (8'had)) : (^~(8'haa)))))), 
parameter param37 = (8'h9e))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire31;
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  assign y = {wire33,
                 wire31,
                 reg35,
                 reg34,
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
      if ((8'haa))
        begin
          reg5 <= {wire3[(4'h8):(4'h8)]};
          reg6 <= $unsigned(({wire1[(4'h8):(1'h0)], $unsigned($signed(reg5))} ?
              $unsigned((wire1[(3'h6):(3'h6)] - wire1[(2'h3):(2'h3)])) : $signed($unsigned((!wire1)))));
        end
      else
        begin
          reg5 <= (reg5[(4'h8):(3'h7)] ?
              ({$unsigned(wire4)} < $unsigned((8'ha0))) : wire2);
          reg6 <= (~|(((8'hbf) ? reg5 : (+(reg5 ? wire3 : wire1))) ?
              (~$signed((wire1 >> wire2))) : (reg6[(3'h6):(1'h1)] ?
                  wire2[(3'h5):(1'h0)] : (~$signed(wire1)))));
          reg7 <= $signed(((($signed(reg6) << (|wire0)) ?
              ((wire0 ? wire0 : wire2) ?
                  wire0[(1'h0):(1'h0)] : (wire3 || wire3)) : (~&{wire2,
                  wire1})) ^~ ($unsigned(reg5) ?
              (wire0 ? (wire4 ? wire3 : wire2) : $unsigned(wire3)) : ((8'hbe) ?
                  (wire1 || wire2) : (wire3 ? (8'h9c) : wire0)))));
          reg8 <= (reg6 ?
              wire3[(2'h2):(2'h2)] : $signed($unsigned((^wire0[(2'h2):(1'h1)]))));
        end
      if ($unsigned({(reg5 == (!reg5[(4'ha):(4'h8)])),
          $unsigned((reg8 ? $signed(wire4) : $signed(wire1)))}))
        begin
          if (($unsigned((^(~(&(8'ha4))))) ?
              ($signed((-(-reg8))) ?
                  ((wire1 && (reg8 < wire1)) ?
                      wire4 : ($unsigned(wire2) ? reg5 : wire4)) : (wire3 ?
                      ({(8'ha4), wire1} > (wire0 - reg5)) : {wire0,
                          (8'ha6)})) : wire3))
            begin
              reg9 <= $signed(wire4);
              reg10 <= {wire4};
            end
          else
            begin
              reg9 <= reg5;
              reg10 <= (8'ha5);
            end
        end
      else
        begin
          reg9 <= (reg6[(3'h4):(2'h2)] || (~&(8'ha8)));
        end
      reg11 <= {$signed(($unsigned($signed(reg10)) ?
              wire0 : ($signed(wire3) ? (~wire4) : reg6)))};
      reg12 <= $unsigned($signed($unsigned($unsigned($unsigned(wire0)))));
      reg13 <= ((((8'hba) ?
              (&(|wire4)) : (^$unsigned(reg5))) == $signed(((reg9 ?
              reg6 : (8'hbb)) == (wire1 - wire0)))) ?
          $signed(({(wire0 ? reg5 : wire3), (7'h43)} ?
              (reg9[(3'h5):(3'h4)] <<< $unsigned(wire0)) : reg12)) : $signed(({wire1[(4'hc):(4'hb)]} * (((8'ha9) != reg11) ?
              $signed(wire3) : $signed(reg7)))));
    end
  module14 #() modinst32 (wire31, clk, wire2, wire4, reg6, reg8, reg10);
  assign wire33 = ((+(((reg6 | wire1) >>> $unsigned(reg7)) ?
                      $unsigned($signed((8'hbe))) : wire4)) ^~ (~^(((wire4 ~^ wire2) ?
                          $signed((8'ha6)) : wire2[(5'h11):(4'he)]) ?
                      $signed((wire0 ^ reg9)) : ($unsigned(reg7) ^~ $signed(reg5)))));
  always
    @(posedge clk) begin
      reg34 <= (7'h40);
      reg35 <= $signed(reg7);
    end
endmodule

module module14
#(parameter param30 = ((7'h41) ? {((((8'hb2) ? (8'hb9) : (8'hbf)) ? ((8'h9e) ? (8'hae) : (8'ha4)) : (8'hb1)) ? (&((8'hbf) & (7'h42))) : ((8'hb5) << ((7'h44) || (8'hbf))))} : (((|((8'hbf) ? (8'haa) : (7'h43))) <= (~|(+(8'ha4)))) ? ((((8'hb8) ? (8'hbe) : (8'hb0)) ^~ ((8'hba) ? (8'hb2) : (8'hb1))) >= (((8'hb0) ? (8'hba) : (8'ha5)) ? ((8'ha7) ? (8'had) : (8'h9f)) : ((8'hbd) ? (8'hbd) : (8'hb6)))) : ((~&((8'had) - (8'hb6))) ~^ ((|(7'h41)) ? ((8'ha9) ? (8'hb2) : (7'h42)) : (|(8'hbf)))))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire19;
  input wire [(2'h3):(1'h0)] wire18;
  input wire [(3'h7):(1'h0)] wire17;
  input wire signed [(2'h3):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire20;
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire20,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = ($unsigned(wire19) << wire19[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg21 <= {wire18[(1'h1):(1'h0)]};
      reg22 <= {$signed($signed(({wire15, wire19} && (~&wire20)))), wire16};
      reg23 <= (~&wire16);
      reg24 <= wire17;
      if ($signed($signed((8'ha2))))
        begin
          reg25 <= (wire19[(1'h1):(1'h0)] ?
              $unsigned((({(8'hbf)} ?
                  wire19[(2'h3):(1'h1)] : wire20) < ({reg21} >>> (wire19 ?
                  reg24 : (8'hb9))))) : (reg21 && $signed($signed(((8'hb0) ?
                  reg24 : wire19)))));
        end
      else
        begin
          if ((reg23[(1'h0):(1'h0)] ?
              (^~reg24) : (&(reg24[(5'h13):(1'h1)] ?
                  wire20 : $unsigned((wire16 ? wire18 : wire19))))))
            begin
              reg25 <= $signed($unsigned((~^{(reg23 ? (8'hab) : wire19)})));
            end
          else
            begin
              reg25 <= {reg22[(2'h2):(1'h0)]};
              reg26 <= ((8'ha6) > {$signed({$unsigned(wire16),
                      (wire20 == reg22)}),
                  $unsigned(((wire18 ? reg24 : (8'hb3)) ?
                      (reg25 ? wire16 : wire16) : $signed((8'ha3))))});
            end
        end
    end
  assign wire27 = reg24;
  assign wire28 = wire19;
  assign wire29 = wire18;
endmodule
