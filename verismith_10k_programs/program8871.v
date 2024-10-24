module top
#(parameter param23 = ((~^(({(7'h43)} ? ((8'h9d) ? (8'haf) : (8'ha7)) : {(8'ha3), (8'h9e)}) ? (((8'h9d) << (8'ha4)) ^ (~^(8'haa))) : (8'hae))) == (((|((8'haf) ? (8'ha4) : (8'h9d))) <<< (((8'hb6) ? (8'hab) : (7'h40)) ? ((8'hbb) || (8'ha1)) : ((8'hb1) >>> (7'h42)))) >> ({((8'h9c) < (8'ha8)), {(8'hbb), (8'hba)}} ? {(8'ha8)} : (((8'hb0) < (8'h9d)) ? ((7'h41) >= (8'ha1)) : (^(8'haa)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire4,
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
  assign wire4 = $unsigned(((^~$unsigned((^wire0))) ?
                     ((~^$signed(wire3)) ?
                         ((&wire1) ? $unsigned(wire1) : (+wire2)) : ({wire0,
                                 wire1} ?
                             $signed(wire0) : {wire2, (8'hae)})) : (-wire3)));
  always
    @(posedge clk) begin
      reg5 <= (-wire2[(2'h3):(1'h1)]);
      reg6 <= $unsigned({(~&(8'hbf))});
      if ($signed(wire0[(3'h4):(2'h3)]))
        begin
          reg7 <= (~^$signed((+(8'ha5))));
          if ((~|{wire2, wire0}))
            begin
              reg8 <= (({((reg7 >= wire3) ?
                          (wire3 ? reg6 : wire4) : (reg7 ~^ wire1))} ?
                  $signed(reg7[(4'h9):(3'h7)]) : $signed(wire1[(2'h3):(2'h3)])) ^~ ((wire3 ?
                  (~^(wire4 ? reg6 : reg7)) : {((7'h43) ?
                          (8'hba) : wire3)}) >>> {(8'hbc),
                  $signed({(8'ha8), wire3})}));
            end
          else
            begin
              reg8 <= $unsigned((^(-(!$unsigned(wire3)))));
              reg9 <= wire2;
              reg10 <= $signed((~&$signed(reg8)));
            end
          if (wire0[(2'h2):(1'h1)])
            begin
              reg11 <= wire1;
              reg12 <= reg7;
              reg13 <= (8'ha8);
              reg14 <= (wire1[(2'h3):(2'h3)] * reg10);
            end
          else
            begin
              reg11 <= $unsigned(wire2);
              reg12 <= (+$signed((+((reg6 * reg12) * $unsigned(reg6)))));
            end
          reg15 <= $unsigned((|(+(~|$signed((8'ha6))))));
        end
      else
        begin
          if ($signed((8'hbb)))
            begin
              reg7 <= $signed((~((reg12[(2'h3):(1'h1)] ?
                  {reg12, wire1} : (~wire1)) && (&(8'hbe)))));
              reg8 <= ({$unsigned((~(^~wire4))), reg13} ~^ (|((+(reg12 ?
                      reg7 : (8'hbf))) ?
                  reg10 : $signed($unsigned(reg13)))));
              reg9 <= {(7'h43),
                  $signed($unsigned((reg9[(1'h0):(1'h0)] >>> {wire4})))};
            end
          else
            begin
              reg7 <= ($signed($unsigned(reg10[(1'h1):(1'h0)])) ?
                  wire4[(4'h8):(3'h4)] : ((reg10 ? $signed((^reg8)) : reg8) ?
                      ($signed((8'hab)) > reg11) : reg13[(4'h8):(4'h8)]));
              reg8 <= reg8[(3'h4):(2'h2)];
              reg9 <= $signed($unsigned(reg6[(3'h6):(1'h0)]));
            end
        end
    end
  assign wire16 = {(8'h9f)};
  assign wire17 = wire16[(1'h0):(1'h0)];
  assign wire18 = ($signed($unsigned((reg14[(1'h0):(1'h0)] <<< reg13[(3'h4):(3'h4)]))) * {((&(~(7'h40))) ?
                          ((reg10 >> wire0) + $signed(wire4)) : (reg9[(1'h0):(1'h0)] ?
                              $signed(wire1) : {(8'had), reg13}))});
  assign wire19 = wire18[(1'h0):(1'h0)];
  assign wire20 = $signed($unsigned({reg6,
                      (reg8[(3'h4):(2'h3)] ?
                          $unsigned(reg9) : $signed(wire0))}));
  assign wire21 = $unsigned(wire19[(1'h1):(1'h1)]);
  assign wire22 = (&reg13[(4'h8):(4'h8)]);
endmodule
