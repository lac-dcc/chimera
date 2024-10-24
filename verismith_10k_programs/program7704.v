module top
#(parameter param27 = (~^{(((^(8'ha9)) + ((7'h43) << (8'hbe))) * ({(8'hbf)} ~^ (^(8'hb0))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire26,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg25,
                 reg24,
                 reg23,
                 reg17,
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
      reg5 <= $signed($unsigned(($unsigned((wire1 ?
          wire1 : wire3)) || $signed($unsigned(wire4)))));
      reg6 <= {wire1[(3'h4):(3'h4)]};
      reg7 <= wire4[(3'h4):(1'h1)];
      reg8 <= $signed((8'ha8));
      if (((wire3[(4'hb):(4'h9)] ?
              (^~wire3) : (((&wire2) ? reg7 : (!reg6)) >= (-$signed(reg8)))) ?
          {(wire0 ?
                  ((reg5 ?
                      wire3 : wire2) && reg5[(1'h0):(1'h0)]) : ($unsigned((8'h9f)) >> (reg8 ?
                      wire0 : (8'hb8)))),
              ($unsigned(reg7[(3'h6):(3'h5)]) + reg7[(2'h2):(2'h2)])} : (~(-(~|(~&(8'had)))))))
        begin
          reg9 <= reg7;
          if (reg8)
            begin
              reg10 <= wire0[(3'h7):(3'h4)];
              reg11 <= $unsigned($unsigned(reg5[(3'h4):(1'h0)]));
            end
          else
            begin
              reg10 <= reg8[(4'hc):(2'h2)];
              reg11 <= ((wire3[(1'h1):(1'h1)] == $unsigned($signed((^~reg8)))) <= wire3);
              reg12 <= $unsigned(((~^wire0) || $signed(reg9)));
              reg13 <= wire3;
            end
        end
      else
        begin
          reg9 <= $signed($unsigned(reg13[(4'ha):(4'h9)]));
          reg10 <= $unsigned({(&($unsigned(reg11) || (reg6 ?
                  (8'ha8) : wire0)))});
          reg11 <= wire2;
          reg12 <= (8'hab);
        end
    end
  always
    @(posedge clk) begin
      reg14 <= (~|$signed(reg10[(3'h4):(2'h2)]));
      reg15 <= (|($signed(reg10[(2'h3):(1'h1)]) | $unsigned(((~&reg13) ^~ (reg9 ?
          reg6 : wire4)))));
      reg16 <= $signed(((~|wire1) > (8'ha5)));
      reg17 <= (~&($signed(({reg12} || $signed((8'ha3)))) ?
          (~(~|reg7[(4'hd):(4'hd)])) : {reg6[(2'h3):(1'h0)],
              (wire1 ^ $unsigned((8'ha4)))}));
    end
  assign wire18 = {reg15};
  assign wire19 = reg14[(3'h6):(2'h3)];
  assign wire20 = (reg14[(4'ha):(3'h4)] ?
                      ($unsigned(reg8) ?
                          (wire18 < {reg8,
                              ((8'haa) ? (8'hb8) : reg6)}) : ($signed(wire19) ?
                              ((wire3 | wire1) - $signed(wire1)) : $unsigned($unsigned(wire18)))) : (+$unsigned($signed($signed((8'hba))))));
  assign wire21 = (((reg10[(2'h3):(1'h1)] ^ wire1[(2'h2):(2'h2)]) <<< $unsigned((7'h42))) ?
                      $signed(wire3[(1'h1):(1'h1)]) : reg16[(1'h1):(1'h1)]);
  assign wire22 = $signed($signed((+(!reg7))));
  always
    @(posedge clk) begin
      reg23 <= wire3[(4'hd):(4'h9)];
      reg24 <= $unsigned((~&$signed((8'h9f))));
      reg25 <= ({{reg13[(4'h9):(1'h0)]}} ?
          {{$unsigned(((8'ha9) ? wire22 : reg5))}} : wire2[(3'h7):(1'h0)]);
    end
  assign wire26 = ((~&reg13) ? wire0 : $unsigned(reg6[(2'h2):(2'h2)]));
endmodule
