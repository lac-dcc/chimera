module top
#(parameter param20 = {((|({(8'ha8)} <<< ((8'hac) & (8'ha0)))) ? ({((8'hbe) ? (7'h41) : (7'h43)), ((8'ha6) - (8'h9c))} ? (((8'hb2) << (8'h9f)) ? (8'hbb) : ((8'h9e) ? (8'hbb) : (8'ha0))) : ((8'hb6) ? ((8'ha4) ? (8'had) : (8'hb5)) : ((8'ha4) ? (8'ha0) : (7'h43)))) : (8'ha1))}, 
parameter param21 = param20)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire5,
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
  assign wire5 = (~^(+$signed($signed(wire2))));
  always
    @(posedge clk) begin
      reg6 <= $signed((8'haa));
      reg7 <= $signed((+((((8'ha1) ? wire0 : (8'hb3)) * wire3) <= ((wire1 ?
          reg6 : wire1) >= (wire2 == wire0)))));
      reg8 <= (~&$signed(wire5[(1'h0):(1'h0)]));
      if ((+(~(~wire4[(3'h5):(2'h2)]))))
        begin
          reg9 <= reg6[(4'h9):(3'h5)];
          reg10 <= $signed((($unsigned($signed((8'hb5))) ?
                  (wire3[(2'h2):(1'h1)] ?
                      wire5[(4'hb):(4'h8)] : ((8'had) ?
                          wire0 : (8'ha7))) : {$unsigned(reg7)}) ?
              $unsigned($unsigned($unsigned((8'ha8)))) : (wire0 != ({reg8,
                  wire1} ~^ (wire1 ? wire3 : reg9)))));
        end
      else
        begin
          reg9 <= {$signed((8'hab)),
              {wire5,
                  ((wire1[(3'h7):(2'h2)] ^ reg7[(3'h6):(3'h4)]) ?
                      $signed({wire0, (8'hb0)}) : (+wire4))}};
          reg10 <= (reg6 < $unsigned(wire1[(4'ha):(2'h2)]));
          reg11 <= (($unsigned(((8'hbf) ? (!reg9) : ((8'h9f) >> reg10))) ?
              (-(&$unsigned((8'hbd)))) : (-wire0)) <= reg8[(3'h7):(2'h3)]);
          reg12 <= (wire3 ?
              (~|$signed($unsigned(reg8))) : ((~^((wire3 ? wire3 : wire1) ?
                      $signed(reg6) : $signed(wire0))) ?
                  (((|reg8) + reg10[(1'h0):(1'h0)]) ?
                      wire0 : $unsigned(reg11[(3'h4):(2'h3)])) : wire4));
          if ($signed(($signed(({(7'h40)} ~^ (~^reg6))) ^~ wire4)))
            begin
              reg13 <= reg10;
              reg14 <= (^$signed(reg6));
              reg15 <= $unsigned((wire1[(4'h9):(3'h6)] ~^ $signed(wire5)));
              reg16 <= ($unsigned(($unsigned($unsigned(reg6)) ?
                      (~|(wire2 ? wire2 : wire2)) : $signed((reg10 ^ reg9)))) ?
                  (^~wire5[(3'h5):(2'h3)]) : $unsigned((~|$unsigned((^(8'hba))))));
              reg17 <= $unsigned(($signed($unsigned((~reg13))) ?
                  (!$unsigned((reg14 | reg13))) : reg8));
            end
          else
            begin
              reg13 <= reg7;
              reg14 <= reg16;
            end
        end
    end
  assign wire18 = reg8;
  assign wire19 = $unsigned((|{reg11, $signed($unsigned(wire0))}));
endmodule
