module top
#(parameter param20 = ((7'h40) ? (-(((~&(8'ha4)) ? ((8'hba) == (7'h41)) : ((8'ha5) ? (8'hbe) : (8'ha0))) ? (8'ha1) : {((8'hbb) ? (8'hb5) : (8'h9d)), ((8'ha6) + (8'hbe))})) : (~(~^(((8'h9d) ? (8'hb0) : (8'hb3)) ? (^~(8'ha8)) : ((8'h9f) > (7'h41)))))), 
parameter param21 = (^~(({(!param20)} ? ((param20 * (8'h9d)) ? (!param20) : (param20 >= param20)) : param20) + param20)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire1[(4'hd):(4'h8)])
        begin
          reg4 <= $signed({$signed($signed((-wire2)))});
          reg5 <= $signed(wire2);
          reg6 <= reg4;
          reg7 <= wire1;
          reg8 <= $unsigned($unsigned($unsigned($unsigned({wire0, (7'h41)}))));
        end
      else
        begin
          if ($signed(wire2))
            begin
              reg4 <= $signed($signed($unsigned((~&$signed(wire3)))));
            end
          else
            begin
              reg4 <= {reg8};
              reg5 <= wire1;
              reg6 <= wire0[(3'h7):(1'h0)];
            end
          reg7 <= {reg5, reg4};
          reg8 <= ({(reg8[(1'h1):(1'h0)] ?
                  (&reg5[(2'h3):(2'h3)]) : $unsigned(wire3[(1'h0):(1'h0)])),
              reg6} >= wire2[(2'h2):(2'h2)]);
          reg9 <= $unsigned({wire1});
          reg10 <= $signed(((reg8[(2'h3):(1'h1)] ?
              ($signed(wire0) == (wire0 + reg9)) : {$unsigned(wire0),
                  (wire3 ? (8'hbb) : reg7)}) || wire3));
        end
      reg11 <= $signed((~^(reg5[(5'h11):(3'h6)] ?
          (~&reg8) : (&reg9[(2'h3):(1'h1)]))));
      if (((^{((&(8'h9c)) <<< reg7[(3'h4):(1'h1)])}) <= reg8[(1'h1):(1'h1)]))
        begin
          if ((!(reg7[(3'h5):(3'h4)] ?
              reg9 : (((wire3 * wire1) < (~|reg8)) ?
                  reg11 : ($unsigned(reg10) ?
                      reg9[(2'h2):(2'h2)] : (reg4 || reg5))))))
            begin
              reg12 <= (^~reg8);
              reg13 <= $unsigned($signed((8'hb4)));
              reg14 <= ((+$unsigned((&(reg8 < wire2)))) << ((reg8 ?
                  reg7[(4'h8):(2'h2)] : reg5[(3'h6):(1'h1)]) == ($unsigned($unsigned(reg7)) ?
                  $signed((reg9 ~^ reg10)) : $signed((wire3 ? wire2 : reg6)))));
              reg15 <= (reg11[(3'h7):(2'h2)] + (({((8'hb0) ? (8'hb9) : reg10),
                          (^~(8'ha7))} ?
                      ($unsigned(reg12) ? (~reg10) : $signed(wire3)) : reg6) ?
                  (reg5 ?
                      ((reg8 ? wire3 : wire0) <<< (reg5 ?
                          reg7 : (8'h9f))) : $unsigned((reg13 ^~ reg7))) : reg6[(4'hb):(1'h1)]));
              reg16 <= ((wire2 ?
                  reg15[(3'h6):(2'h2)] : reg7[(3'h6):(3'h6)]) && (&$unsigned(({reg4,
                  reg4} != {reg9}))));
            end
          else
            begin
              reg12 <= reg10[(1'h0):(1'h0)];
              reg13 <= (!($signed((~^(^~wire2))) ?
                  (reg10[(2'h3):(2'h2)] ?
                      $signed((!reg8)) : ((+wire3) < (reg16 ?
                          reg4 : reg4))) : reg14[(3'h5):(1'h1)]));
              reg14 <= $unsigned((+reg6));
            end
        end
      else
        begin
          reg12 <= ((($signed({reg13, (8'hab)}) ?
              (8'hb2) : wire1) != $signed(({(8'hab)} * reg14))) == (reg6 ?
              {(wire0[(4'h8):(4'h8)] ?
                      reg16[(4'h8):(1'h1)] : ((7'h42) ? reg10 : reg11)),
                  (^(wire1 >> reg15))} : (({reg15, wire1} & (wire0 ?
                  wire1 : reg12)) != (reg5 ? (|reg9) : $signed(reg12)))));
        end
    end
  assign wire17 = ((8'ha5) << $unsigned(reg11[(2'h3):(1'h0)]));
  assign wire18 = (~$signed(reg15));
  assign wire19 = ((^~{$signed((reg13 ? wire17 : (8'ha3))),
                          ({reg13, (8'hb3)} > {wire1, wire1})}) ?
                      $unsigned($unsigned((!$unsigned(reg11)))) : $unsigned(($signed((wire3 > reg8)) ?
                          $unsigned(wire18[(2'h2):(1'h0)]) : (!(wire1 ?
                              reg8 : reg10)))));
endmodule
