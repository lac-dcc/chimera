module top
#(parameter param23 = ((8'ha8) ~^ ({(((8'ha8) ? (8'ha4) : (8'hbc)) >> ((8'hb6) ? (8'ha2) : (7'h44)))} ? ((^((8'hac) ? (8'hb3) : (8'hbe))) ? ({(8'hb4), (8'hbd)} ? {(8'hb7), (8'hb1)} : ((7'h41) != (8'ha6))) : (((8'ha3) ^~ (8'ha1)) ? (~&(8'hb8)) : (+(8'hbe)))) : (|{{(8'hbf)}, ((8'hbf) ? (8'hbd) : (8'ha6))}))), 
parameter param24 = (!((((param23 ? param23 : param23) ? (param23 >> param23) : param23) ? (~^(param23 ? param23 : param23)) : (^(param23 >> (8'hb8)))) << ({param23} ? ({param23, (8'hb6)} ? (param23 ? (8'hb4) : param23) : ((8'hb0) ? param23 : param23)) : ((|param23) ^~ (param23 ^~ (8'hb2)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire7,
                 wire6,
                 wire5,
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
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = $signed(((~|(8'haa)) == ($signed($signed(wire3)) >> ($signed(wire3) <<< $signed((8'had))))));
  assign wire6 = {(($unsigned(((8'hb4) >= wire1)) && (&wire3[(3'h5):(3'h4)])) != wire3),
                     wire5[(5'h12):(1'h0)]};
  assign wire7 = wire3;
  always
    @(posedge clk) begin
      reg8 <= (^~$unsigned(($unsigned($unsigned(wire0)) >> ($unsigned((7'h40)) >> (~&wire4)))));
      reg9 <= $signed((&(wire3 * $unsigned($signed((8'hbb))))));
    end
  always
    @(posedge clk) begin
      reg10 <= (wire1[(1'h0):(1'h0)] ?
          $signed(wire7[(3'h5):(2'h3)]) : (!wire5[(2'h3):(2'h2)]));
      reg11 <= (reg10 ?
          (reg10 <<< $unsigned(($unsigned((8'hb6)) * (reg9 >> wire5)))) : $signed({(wire2[(4'h8):(2'h2)] ?
                  {wire3, reg8} : $unsigned(wire0))}));
      if ((wire3 - ((~^(~&wire5[(4'hc):(1'h0)])) << (reg8[(3'h5):(3'h5)] >> (~^(~^wire2))))))
        begin
          reg12 <= (reg11 ? $signed({reg10}) : reg10);
          if (($unsigned(reg12) ^~ ($unsigned({(wire5 <= wire0)}) ?
              $unsigned(wire6[(4'he):(1'h1)]) : $signed({reg8[(1'h1):(1'h0)]}))))
            begin
              reg13 <= wire3[(1'h1):(1'h0)];
              reg14 <= $unsigned((~(($unsigned(reg9) ?
                      reg9[(3'h7):(3'h5)] : reg9[(2'h2):(1'h0)]) ?
                  {wire7,
                      (wire6 ?
                          reg11 : reg10)} : (reg13[(1'h0):(1'h0)] ~^ $unsigned((8'hb5))))));
              reg15 <= $unsigned(((wire0 ?
                      (8'h9c) : $signed(((8'hba) - wire2))) ?
                  $signed(((~^(8'hbf)) > {wire7, reg11})) : reg9));
              reg16 <= ((^(-$signed($unsigned(wire6)))) & $signed((+((wire6 > reg8) ?
                  (wire5 ? reg10 : reg8) : {wire1}))));
              reg17 <= $unsigned((~reg14));
            end
          else
            begin
              reg13 <= $unsigned($unsigned(wire7[(3'h7):(1'h1)]));
              reg14 <= wire0[(4'hb):(3'h7)];
              reg15 <= reg11[(1'h1):(1'h0)];
            end
          reg18 <= $unsigned(((reg16[(3'h6):(2'h2)] ?
              {$signed(wire6)} : $unsigned($signed(reg12))) <= (&wire5[(3'h6):(3'h4)])));
          reg19 <= wire3;
        end
      else
        begin
          reg12 <= reg14[(2'h2):(1'h0)];
          reg13 <= {$signed(wire7[(3'h7):(1'h0)])};
          reg14 <= wire6;
          reg15 <= reg19;
          reg16 <= (wire2[(4'ha):(1'h1)] ?
              $signed((+reg18[(4'hc):(2'h3)])) : (-(!(8'ha2))));
        end
      reg20 <= reg8;
    end
  assign wire21 = wire5[(3'h7):(2'h3)];
  assign wire22 = $unsigned($unsigned($signed($unsigned(reg8))));
endmodule
