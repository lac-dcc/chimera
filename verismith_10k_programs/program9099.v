module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire16,
                 wire15,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((~&$signed((wire0[(3'h6):(2'h2)] <<< (wire3 >= (8'hba))))) + (wire1 ?
          (^(~&{wire0, wire2})) : $signed($signed($unsigned(wire3))))))
        begin
          if (((|{({wire3} >>> wire3[(2'h2):(2'h2)]),
                  {$unsigned(wire3), $unsigned(wire2)}}) ?
              (&$unsigned($unsigned(wire0[(4'he):(4'ha)]))) : (~wire2)))
            begin
              reg4 <= wire0[(5'h14):(5'h13)];
              reg5 <= (^($unsigned($unsigned(wire2[(2'h2):(1'h1)])) == ((^(reg4 ?
                  wire3 : wire1)) < wire1[(1'h1):(1'h1)])));
              reg6 <= $signed(wire0[(3'h4):(2'h3)]);
              reg7 <= reg4[(1'h1):(1'h0)];
            end
          else
            begin
              reg4 <= {(!$signed(((~&(8'hae)) < (!(7'h42)))))};
              reg5 <= (8'ha0);
            end
          reg8 <= (($unsigned(wire2[(4'ha):(4'ha)]) ?
                  ($signed((wire2 <<< reg5)) ?
                      {{(8'h9f),
                              wire1}} : wire0[(5'h11):(5'h11)]) : wire2[(2'h2):(2'h2)]) ?
              $signed($signed(((wire2 ?
                  wire1 : reg4) > (reg6 - (8'ha2))))) : reg5[(3'h4):(1'h0)]);
          reg9 <= reg5;
          if ({(((((8'hb7) ?
                      reg7 : reg6) - (!reg9)) < $unsigned($unsigned(reg7))) ?
                  (|wire0[(5'h10):(1'h0)]) : $unsigned((wire1[(4'hd):(4'h8)] ?
                      (wire3 >>> reg8) : {wire3, wire1})))})
            begin
              reg10 <= reg5;
              reg11 <= (reg10[(1'h1):(1'h0)] ?
                  ($unsigned((!(reg5 + reg9))) & ((reg9[(3'h4):(1'h0)] ~^ (reg9 ?
                          reg6 : reg10)) ?
                      (((8'ha9) ?
                          reg5 : reg4) || (8'hb8)) : wire2[(4'h8):(3'h6)])) : ((reg6 ?
                          reg8 : (8'hbf)) ?
                      ($signed((reg8 ?
                          wire1 : reg9)) && wire1) : ($unsigned($signed((8'hb2))) ^ $signed((wire2 && reg8)))));
              reg12 <= reg7[(3'h4):(2'h2)];
              reg13 <= wire3[(4'h8):(3'h4)];
              reg14 <= ((^reg12) == reg10);
            end
          else
            begin
              reg10 <= (($signed(($signed(reg4) ?
                      $unsigned(wire3) : ((8'hb5) || (7'h42)))) & ({wire0[(1'h1):(1'h1)]} ?
                      $unsigned(((8'hbf) ^~ reg11)) : $signed($signed(reg13)))) ?
                  wire3[(3'h5):(3'h5)] : $signed($unsigned(($unsigned((8'ha1)) || $signed((7'h40))))));
              reg11 <= ((((reg7 & (^reg11)) ^ (+(wire2 ?
                  reg8 : (8'hbe)))) >= ((~^(reg12 | reg5)) - reg4)) - (-((^~(wire1 ?
                  reg14 : reg6)) & $unsigned((reg6 ? reg8 : reg9)))));
              reg12 <= $signed((reg11 ?
                  (~&({reg6} ?
                      (~|(8'hb9)) : (wire2 ? (8'hb4) : reg14))) : ({wire0,
                      {reg8, reg6}} - (reg5 ?
                      (reg4 ? reg4 : wire0) : {reg7}))));
              reg13 <= {$signed(($signed($unsigned(reg9)) < ((8'hae) ?
                      (+reg14) : (reg4 - reg14)))),
                  wire3[(2'h3):(1'h0)]};
            end
        end
      else
        begin
          reg4 <= (|reg4[(3'h5):(2'h3)]);
        end
    end
  assign wire15 = $signed((reg13 <<< wire1));
  assign wire16 = {(+wire0),
                      ($signed(($signed(reg14) >> (reg10 ? reg13 : reg5))) ?
                          wire2[(3'h5):(3'h5)] : (~&($signed(wire1) ?
                              (reg13 ? wire3 : reg8) : wire15)))};
  always
    @(posedge clk) begin
      reg17 <= $unsigned($unsigned({(reg7[(1'h1):(1'h0)] >> (reg7 ?
              (8'hb2) : wire2))}));
      reg18 <= wire0[(4'he):(1'h0)];
      reg19 <= (reg9[(2'h2):(2'h2)] && wire1[(2'h2):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg20 <= reg8[(4'ha):(2'h2)];
      reg21 <= {$signed((($unsigned(reg8) > $signed(reg18)) ?
              $unsigned((reg6 | reg7)) : {(wire1 >> reg11)}))};
    end
  assign wire22 = (reg18[(5'h10):(4'h9)] ?
                      (($signed((wire16 <<< (8'h9f))) ^~ $unsigned({reg19,
                              wire15})) ?
                          reg4[(2'h2):(1'h1)] : $unsigned(reg5)) : (~&($signed($unsigned((8'ha8))) ?
                          {wire16} : ((reg11 ? wire3 : wire1) ?
                              reg9[(2'h2):(1'h0)] : reg6))));
  assign wire23 = reg7;
endmodule
