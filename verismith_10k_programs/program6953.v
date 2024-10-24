module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire22,
                 wire11,
                 wire5,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (~&{wire1, wire2});
  always
    @(posedge clk) begin
      reg6 <= wire3;
      if (wire3[(3'h5):(1'h1)])
        begin
          reg7 <= reg6[(3'h4):(2'h2)];
        end
      else
        begin
          reg7 <= ($unsigned(reg7[(4'he):(3'h5)]) ~^ {(-(&reg7[(2'h2):(1'h0)]))});
          reg8 <= reg6[(3'h5):(1'h0)];
          reg9 <= reg8[(1'h0):(1'h0)];
        end
      reg10 <= (!wire2[(4'hf):(3'h7)]);
    end
  assign wire11 = ({(8'h9f)} != wire2);
  always
    @(posedge clk) begin
      if ($signed($unsigned(((reg7[(4'hc):(3'h7)] ~^ $signed(reg10)) ?
          reg9 : $unsigned((^wire4))))))
        begin
          reg12 <= (-(($signed($unsigned(wire3)) ?
              {(8'hac),
                  (^wire11)} : (|$unsigned(reg10))) <= $signed((reg7[(4'hf):(1'h1)] ?
              wire5[(2'h3):(1'h0)] : {wire1}))));
          reg13 <= (((wire11[(2'h2):(1'h0)] ?
                  $unsigned(reg9[(3'h5):(3'h5)]) : $unsigned(reg8[(1'h1):(1'h1)])) < (~&$signed(wire2[(2'h3):(2'h2)]))) ?
              reg10 : $signed((~$signed($unsigned(wire2)))));
        end
      else
        begin
          if ($signed(((!(~&$signed(wire1))) ?
              (((&wire5) ? (reg13 && wire11) : (~reg7)) ?
                  $unsigned($unsigned(reg10)) : ($unsigned(wire0) + wire2[(5'h11):(4'hb)])) : $unsigned((reg8[(2'h2):(1'h1)] || $unsigned(reg9))))))
            begin
              reg12 <= $signed(wire0);
              reg13 <= reg13;
              reg14 <= $unsigned($signed(wire1));
            end
          else
            begin
              reg12 <= ($signed(reg10[(3'h5):(2'h2)]) ?
                  wire1 : (reg14 ? $signed((&(wire1 >= reg9))) : wire4));
              reg13 <= (^~$signed(reg10));
              reg14 <= (^$signed((reg14 ^ reg10)));
            end
          reg15 <= (~($signed(wire11) ?
              reg13[(4'hd):(4'h9)] : {reg10[(4'he):(4'hd)],
                  (wire2[(1'h1):(1'h1)] ? reg8[(2'h3):(1'h0)] : (~|wire4))}));
          if (wire1)
            begin
              reg16 <= $unsigned(((reg9[(3'h6):(1'h1)] ?
                      reg12 : wire0[(3'h4):(1'h0)]) ?
                  $unsigned((-(8'h9e))) : (-reg15)));
              reg17 <= {$unsigned((^((reg6 == wire2) ?
                      $signed(reg12) : wire1[(4'hc):(3'h7)])))};
            end
          else
            begin
              reg16 <= $unsigned(((^~$unsigned(reg12)) ^~ wire1));
              reg17 <= $unsigned(reg14[(1'h1):(1'h0)]);
              reg18 <= ((+$signed($signed({reg7, (8'hbd)}))) <= ((~((8'ha5) ?
                      $unsigned((8'hb4)) : reg16)) ?
                  wire1[(5'h10):(4'hf)] : $signed(reg8[(1'h0):(1'h0)])));
              reg19 <= ((wire4[(2'h2):(2'h2)] & $unsigned((&{reg10}))) > (~(reg15[(2'h2):(2'h2)] == $signed($unsigned(reg12)))));
              reg20 <= (~&(wire2[(5'h11):(2'h2)] > (!$signed($unsigned((8'ha1))))));
            end
        end
      reg21 <= wire4[(2'h2):(1'h0)];
    end
  assign wire22 = {(($signed((&wire5)) >>> wire1) ?
                          (({wire3} << ((8'hb6) ? reg13 : reg19)) ?
                              $unsigned(reg18) : {{reg14, wire11},
                                  (+wire11)}) : {(~^(reg12 <<< reg12)),
                              reg18})};
endmodule
