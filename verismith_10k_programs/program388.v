module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire10,
                 wire9,
                 wire5,
                 wire4,
                 reg23,
                 reg22,
                 reg21,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire3[(1'h0):(1'h0)];
  assign wire5 = ((~^wire2[(5'h15):(2'h2)]) < (~&{wire0[(4'h9):(1'h1)]}));
  always
    @(posedge clk) begin
      reg6 <= $unsigned($unsigned($signed({$unsigned(wire3),
          wire0[(4'h8):(1'h0)]})));
      reg7 <= wire0[(3'h7):(3'h6)];
      reg8 <= wire3;
    end
  assign wire9 = wire5[(4'he):(4'hb)];
  assign wire10 = {wire5, wire0[(3'h5):(1'h1)]};
  always
    @(posedge clk) begin
      reg11 <= ($unsigned(reg8) >> (8'haf));
      reg12 <= ($unsigned(((&reg11[(4'h9):(3'h7)]) ?
          reg7 : (8'hbd))) ^ ($unsigned({{reg7, wire4}, (^~wire1)}) ?
          $unsigned($unsigned($unsigned((8'haa)))) : (wire4[(4'hb):(1'h0)] + $signed($unsigned(wire1)))));
      if ($unsigned(((-reg6[(1'h1):(1'h0)]) ?
          $signed((&$unsigned(wire2))) : $signed(($signed(wire5) ^ ((8'haa) == reg11))))))
        begin
          if (($unsigned(({(reg7 ? reg8 : wire4)} << wire0)) > {(reg7 ?
                  (!$signed(wire0)) : (8'h9c)),
              (((+reg6) > wire9[(3'h5):(3'h4)]) << (reg12[(1'h1):(1'h1)] ?
                  (|(8'h9d)) : (wire10 >>> reg11)))}))
            begin
              reg13 <= (((reg11[(1'h1):(1'h0)] ?
                  $unsigned({wire3,
                      reg8}) : wire0) | reg12[(1'h0):(1'h0)]) == $unsigned(wire2));
              reg14 <= $signed($unsigned(reg12[(3'h5):(3'h5)]));
              reg15 <= ((8'hba) >= (reg8 ?
                  reg13[(4'hc):(4'h9)] : (|$unsigned(reg12))));
              reg16 <= $unsigned((({wire5[(4'hb):(2'h3)]} >>> (^((8'hbf) == wire4))) ?
                  $unsigned((~&$unsigned(wire5))) : reg12));
            end
          else
            begin
              reg13 <= wire10[(4'h8):(1'h1)];
            end
          if ({wire2, $signed($signed({wire1}))})
            begin
              reg17 <= reg12[(3'h6):(2'h3)];
              reg18 <= ($unsigned((~^$signed($unsigned(wire10)))) * reg8);
              reg19 <= wire2;
            end
          else
            begin
              reg17 <= (^~$signed(wire5));
              reg18 <= {$unsigned({reg7})};
              reg19 <= ((~|((8'hbb) ?
                  $unsigned({wire0,
                      wire3}) : reg11[(1'h1):(1'h0)])) << reg18[(4'h8):(3'h5)]);
              reg20 <= ($unsigned($unsigned(reg6[(2'h2):(2'h2)])) ^~ (&wire2));
              reg21 <= (reg14[(3'h7):(3'h5)] ?
                  $signed((~reg20[(1'h0):(1'h0)])) : (wire2 ?
                      (+(reg8 ^ $unsigned(wire9))) : (((wire4 ?
                          reg13 : reg13) && $unsigned((8'hb2))) ^ $unsigned($unsigned(reg14)))));
            end
        end
      else
        begin
          reg13 <= reg12;
        end
      reg22 <= (^($signed(((!reg21) >= (reg8 != reg7))) * wire0[(3'h4):(3'h4)]));
      reg23 <= $signed(wire4);
    end
  assign wire24 = (~|reg15[(4'he):(4'hb)]);
  assign wire25 = (^~(~^$unsigned($signed((^~wire5)))));
  assign wire26 = (&$unsigned($unsigned($unsigned(wire24))));
endmodule
