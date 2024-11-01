module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire18,
                 wire5,
                 reg19,
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
                 (1'h0)};
  assign wire5 = wire4[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire1[(2'h2):(1'h0)]);
      reg7 <= wire5;
      reg8 <= wire5;
      if (wire2)
        begin
          if ((reg8 ? (wire5 ^~ (+$signed((^~wire3)))) : $unsigned(reg8)))
            begin
              reg9 <= reg7;
              reg10 <= (8'hbc);
              reg11 <= $signed({$signed((^~(-wire2)))});
            end
          else
            begin
              reg9 <= (~|wire3[(2'h2):(1'h1)]);
            end
          reg12 <= {$unsigned($signed(reg10)),
              (wire0 ? {wire3[(4'ha):(4'h8)]} : $unsigned((!$unsigned(reg8))))};
          if ({$unsigned(reg9)})
            begin
              reg13 <= (~&(wire2 >= wire1));
            end
          else
            begin
              reg13 <= {({$unsigned((reg9 != reg10))} || wire3[(4'he):(4'ha)])};
              reg14 <= (7'h43);
            end
          reg15 <= ($unsigned(reg9) && reg12[(4'hb):(4'h8)]);
          reg16 <= {reg13[(3'h5):(1'h1)]};
        end
      else
        begin
          reg9 <= (reg6[(2'h3):(2'h3)] ?
              (($unsigned((8'ha3)) << wire0[(2'h2):(1'h0)]) & (reg8 ?
                  ((wire1 > (8'h9e)) ?
                      reg15 : (^reg15)) : $signed((reg9 >> reg14)))) : wire1);
          reg10 <= $unsigned((^reg10[(2'h2):(1'h1)]));
          if ($signed(wire5[(3'h4):(2'h2)]))
            begin
              reg11 <= $signed(((-($unsigned(reg10) ?
                      (^~reg7) : {reg12, wire4})) ?
                  $unsigned((|wire3)) : $unsigned($unsigned($signed(wire0)))));
              reg12 <= $signed((((reg16[(2'h3):(2'h3)] ?
                  reg14[(3'h6):(1'h0)] : (8'haa)) || ($signed(reg14) ?
                  reg14[(1'h1):(1'h0)] : wire2)) > {((reg9 ?
                      reg7 : wire4) + (wire5 ? reg14 : (8'h9f))),
                  $unsigned({reg15, reg16})}));
              reg13 <= (~&wire5);
              reg14 <= (+($signed({$signed(reg16)}) ?
                  wire5 : (^$unsigned(wire4))));
            end
          else
            begin
              reg11 <= (-($signed(wire4) ?
                  (($unsigned(reg8) ? reg14[(3'h7):(2'h3)] : $unsigned(reg6)) ?
                      (!(~&wire5)) : $signed($signed(reg14))) : $unsigned({$unsigned((8'hb9))})));
              reg12 <= reg11;
              reg13 <= ((~&wire1) >> (^(~^(((8'hb2) ? wire0 : reg11) ?
                  (reg16 ? reg9 : (8'hb1)) : (wire3 ? (8'hba) : (8'hbe))))));
            end
        end
      reg17 <= reg11[(3'h5):(2'h2)];
    end
  assign wire18 = reg16;
  always
    @(posedge clk) begin
      reg19 <= $unsigned((8'ha3));
    end
endmodule
