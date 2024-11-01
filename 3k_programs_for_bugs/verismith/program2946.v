module top
#(parameter param18 = {(~^((((8'hbf) | (8'hb0)) ? {(8'ha2), (8'ha3)} : {(8'hb5), (8'ha3)}) + (|((8'hba) ~^ (8'ha3)))))}, 
parameter param19 = (({{{(7'h43), param18}}} ? ((8'had) * (!param18)) : (^((~&param18) ? (&param18) : param18))) >>> (^(+({param18} ? param18 : (param18 ? param18 : (8'hba)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
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
      reg4 <= ($signed(wire3) ?
          $signed(wire3[(1'h0):(1'h0)]) : wire3[(2'h2):(1'h0)]);
      if (wire2[(4'hf):(4'h8)])
        begin
          if (wire0)
            begin
              reg5 <= (wire1[(3'h6):(1'h1)] <= $unsigned(($signed((wire0 ?
                  wire0 : wire3)) <<< ((wire3 - wire1) <<< $unsigned(wire0)))));
              reg6 <= ((wire0[(3'h5):(3'h5)] == (~&reg4[(4'ha):(4'h8)])) ?
                  (wire2[(1'h1):(1'h0)] && ((reg4 ~^ {reg5, reg4}) ?
                      ((-(8'h9c)) ?
                          (~&wire1) : reg5[(4'hd):(4'ha)]) : (8'h9f))) : reg5[(3'h5):(1'h0)]);
            end
          else
            begin
              reg5 <= $unsigned($signed((^{(~^wire3), $signed(reg6)})));
              reg6 <= reg6[(1'h0):(1'h0)];
            end
          reg7 <= ((~^reg5) ?
              reg4[(3'h5):(1'h1)] : (reg4[(1'h1):(1'h1)] ?
                  $unsigned($unsigned(reg6)) : (8'hb3)));
          reg8 <= (&wire1[(3'h5):(2'h2)]);
        end
      else
        begin
          if ($signed(($unsigned(($signed(wire0) ?
                  (reg4 + wire0) : $unsigned(reg5))) ?
              (~^$unsigned((8'h9c))) : reg8)))
            begin
              reg5 <= $signed(reg4);
              reg6 <= (8'ha1);
              reg7 <= {$signed(reg4[(3'h6):(1'h0)]), reg8[(4'h9):(3'h6)]};
              reg8 <= (~^((8'h9f) <= $signed(wire0[(4'h9):(4'h8)])));
              reg9 <= ((({(~|reg4),
                      {wire2}} < $signed(wire3[(1'h1):(1'h1)])) ^~ ($unsigned((reg8 < reg8)) + $unsigned((^wire2)))) ?
                  reg5[(4'hc):(4'hc)] : (reg4 & $unsigned($unsigned(reg5))));
            end
          else
            begin
              reg5 <= $unsigned({(((wire3 ? reg5 : reg4) ?
                          (&(7'h42)) : {wire1}) ?
                      (wire2 ?
                          reg9 : $unsigned(reg9)) : $signed((wire3 - reg7))),
                  $signed($unsigned((reg9 <= reg6)))});
              reg6 <= $unsigned(($signed($signed((-wire2))) ?
                  (reg7[(2'h2):(1'h1)] != (reg4 ?
                      (&wire2) : wire1[(3'h5):(2'h2)])) : {(wire2[(3'h5):(2'h2)] == (8'h9d)),
                      {$signed(wire1)}}));
            end
          if ((reg9 << (((~&(~|reg6)) != $unsigned((+(8'had)))) >> $unsigned(reg4[(1'h1):(1'h0)]))))
            begin
              reg10 <= $unsigned({(($signed((8'hb5)) << (wire1 == wire2)) ^ (~$signed(wire1))),
                  reg5});
              reg11 <= wire0[(2'h3):(1'h1)];
              reg12 <= $signed((reg7 * $unsigned((^~reg10))));
              reg13 <= $signed($unsigned($unsigned($unsigned(reg12))));
              reg14 <= $unsigned((reg10[(2'h2):(2'h2)] ?
                  ($signed((reg6 >>> reg13)) < reg13[(2'h2):(1'h1)]) : reg7[(4'ha):(2'h2)]));
            end
          else
            begin
              reg10 <= $signed($signed($unsigned(((reg10 ? reg6 : (8'ha2)) ?
                  {reg12} : $signed(reg10)))));
            end
        end
    end
  assign wire15 = reg11[(2'h3):(1'h0)];
  assign wire16 = $unsigned((~|((reg12 * reg8) < reg9[(1'h1):(1'h1)])));
  assign wire17 = $signed(wire1);
endmodule
