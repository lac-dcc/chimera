module top
#(parameter param23 = ((-(((8'ha5) >= {(8'ha8)}) != (|((8'ha0) ? (8'hbe) : (8'ha6))))) - (|(|(-((7'h43) ? (8'h9f) : (8'ha2)))))), 
parameter param24 = {(-({((8'hb0) && (8'hac)), (param23 == param23)} >> param23))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire18;
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire22,
                 wire18,
                 reg21,
                 reg20,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($unsigned(({(wire0 ? wire3 : wire4)} ?
          wire1[(1'h1):(1'h0)] : $unsigned($unsigned(wire1))))))
        begin
          reg5 <= $signed({{(~|{wire3, wire4}), (^(wire1 && wire1))}});
          reg6 <= $unsigned((~(^(|wire1[(2'h3):(2'h3)]))));
          if ($unsigned(((-(8'ha7)) > ((~&$unsigned(reg6)) ^ $unsigned($unsigned(reg5))))))
            begin
              reg7 <= $signed((($unsigned(((8'ha6) ? wire3 : reg5)) ?
                      (&wire2) : (8'hb7)) ?
                  $unsigned($signed((~^wire1))) : $unsigned(($signed((8'hb4)) ?
                      reg6[(2'h3):(2'h2)] : (reg6 << reg6)))));
              reg8 <= $signed((~|(~wire0[(3'h6):(1'h0)])));
            end
          else
            begin
              reg7 <= reg5;
              reg8 <= (8'hb3);
              reg9 <= $unsigned($unsigned(reg5));
            end
        end
      else
        begin
          reg5 <= wire2[(1'h0):(1'h0)];
          reg6 <= (~^(~&((-wire0[(4'ha):(3'h6)]) ?
              {(reg9 ? reg7 : wire0)} : $signed((reg8 ? wire2 : wire4)))));
          reg7 <= {(wire4 >= (reg5[(4'h8):(2'h2)] ? reg6 : (^$signed(wire2)))),
              (-((~$signed(wire1)) ?
                  {$signed(wire3), (~^wire2)} : wire3[(3'h7):(2'h2)]))};
        end
      reg10 <= wire2[(2'h3):(2'h2)];
      reg11 <= (($unsigned(($unsigned(reg5) ?
                  $signed(reg7) : (reg6 ? wire3 : (8'hab)))) ?
              wire0 : (wire1[(1'h0):(1'h0)] * reg10)) ?
          ($signed((~|$unsigned(wire0))) == (wire4[(4'hd):(4'hb)] ?
              {(8'ha7)} : (((8'h9c) + wire0) ?
                  reg6 : (wire2 ^~ reg10)))) : (~^((~|(reg5 ? wire0 : reg5)) ?
              wire0[(4'hf):(4'hb)] : reg6[(1'h1):(1'h1)])));
      reg12 <= (~wire1[(2'h2):(1'h1)]);
      if (reg12[(4'he):(4'ha)])
        begin
          reg13 <= wire3[(3'h7):(3'h5)];
          reg14 <= (({reg13} | ((~^$unsigned(reg8)) & reg9)) ?
              reg12 : (reg10[(2'h2):(1'h0)] & wire0[(4'he):(4'ha)]));
          reg15 <= {{(($unsigned((8'hb4)) ?
                      reg10[(2'h2):(2'h2)] : reg8) > $unsigned((reg14 ?
                      reg6 : wire4))),
                  $signed((~|(reg5 - reg5)))}};
          reg16 <= (wire0 ? $unsigned($unsigned(wire2)) : $unsigned((8'hbe)));
          reg17 <= reg11[(2'h3):(2'h3)];
        end
      else
        begin
          if ({$signed(reg11)})
            begin
              reg13 <= ({$unsigned((wire4 ?
                      (reg13 * reg13) : {reg6}))} || (~&$signed($signed((reg10 ?
                  reg15 : reg8)))));
            end
          else
            begin
              reg13 <= (((wire0[(5'h12):(4'hb)] ?
                          $unsigned($unsigned(reg12)) : ($unsigned(reg16) ?
                              reg14[(3'h4):(3'h4)] : reg17[(1'h1):(1'h1)])) ?
                      reg8[(3'h6):(3'h4)] : (8'h9f)) ?
                  ((^~((wire4 ? reg15 : reg16) ?
                      (reg14 ?
                          reg5 : reg15) : $signed((8'hb0)))) <= (^reg15)) : (!({reg16[(3'h5):(3'h4)]} ?
                      ($unsigned((7'h40)) ^ (-reg14)) : $unsigned((^reg11)))));
              reg14 <= (^(reg17[(3'h4):(1'h0)] ?
                  $signed((~(8'hab))) : $unsigned(($unsigned(reg6) ^ $signed(reg6)))));
              reg15 <= {{reg11[(3'h4):(2'h3)],
                      ($unsigned((!reg13)) ^ ((reg16 ?
                          (8'hbd) : wire0) << $signed(reg5)))}};
            end
        end
    end
  assign wire18 = wire1;
  always
    @(posedge clk) begin
      if (reg14)
        begin
          reg19 <= $unsigned((~&reg9));
        end
      else
        begin
          reg19 <= reg9;
        end
      reg20 <= $unsigned((!(|$signed((wire0 ? wire2 : (8'ha2))))));
      reg21 <= (!(~^(($unsigned(reg16) ^~ ((8'h9e) + reg7)) | $signed($unsigned(reg5)))));
    end
  assign wire22 = ($signed($signed((-$unsigned((8'h9f))))) ?
                      ((reg21[(2'h2):(2'h2)] * $unsigned((reg11 ?
                          reg8 : (8'hb4)))) ^~ reg12) : reg13);
endmodule
