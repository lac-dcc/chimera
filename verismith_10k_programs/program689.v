module top
#(parameter param31 = (^~(|((+((8'hb2) ? (8'hbe) : (8'hab))) ? (+(&(8'hab))) : (((8'ha2) | (8'hb6)) ? (&(8'hbd)) : ((8'h9d) ? (8'hb9) : (8'ha9)))))), 
parameter param32 = {(param31 ? {param31, ({param31, param31} ^~ (param31 ^ param31))} : (!((~^param31) ? param31 : (param31 >> param31)))), (~|param31)})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire29;
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire16,
                 wire17,
                 wire29,
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
  assign wire4 = $signed(wire1[(1'h0):(1'h0)]);
  assign wire5 = wire1[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if (($unsigned((wire5 ^~ (8'hb1))) - ($signed(((wire1 >> (8'ha8)) & {wire2,
              wire0})) ?
          (8'hbf) : (wire2[(1'h0):(1'h0)] ?
              {(wire5 ? wire3 : wire5), $signed(wire3)} : wire5))))
        begin
          reg6 <= $unsigned($unsigned((wire1[(3'h4):(2'h2)] ?
              (wire3[(3'h4):(2'h3)] ?
                  (wire1 ?
                      (8'ha7) : wire0) : (+wire2)) : $unsigned((-wire0)))));
          reg7 <= (((($unsigned((8'h9f)) != (wire0 ? wire0 : (8'ha7))) ?
                      (~|(wire3 ? wire4 : wire3)) : (wire4[(2'h2):(1'h1)] ?
                          (wire1 ? wire0 : wire1) : (8'ha5))) ?
                  (reg6 | wire2) : ((^wire2[(3'h7):(3'h4)]) * $unsigned((wire4 & reg6)))) ?
              (((~&wire0) ?
                  ($unsigned(reg6) ? (wire0 * wire5) : (8'hba)) : {(wire0 ?
                          (8'hb6) : wire4)}) ^~ wire2) : $signed($unsigned(wire1)));
          if ($signed($unsigned($signed(wire2[(3'h7):(3'h6)]))))
            begin
              reg8 <= wire1;
            end
          else
            begin
              reg8 <= (wire2[(3'h5):(1'h1)] < $unsigned(wire3));
              reg9 <= (~((!reg7) > wire3[(1'h1):(1'h1)]));
              reg10 <= $unsigned(wire5);
              reg11 <= $signed((($unsigned($signed(wire1)) ?
                  wire0[(3'h4):(1'h1)] : wire0) - (!wire0[(2'h2):(1'h0)])));
              reg12 <= $signed((($signed((wire2 && wire3)) ?
                      (~(~^wire2)) : {reg10, (~&reg7)}) ?
                  (($signed(reg11) ? $signed((8'hb1)) : wire3[(2'h3):(2'h2)]) ?
                      (!{wire5}) : $signed((wire4 ?
                          wire1 : wire0))) : {wire0[(3'h7):(2'h2)], reg7}));
            end
        end
      else
        begin
          if ($signed(reg9))
            begin
              reg6 <= (~^$signed((^(reg11 - $unsigned(reg12)))));
              reg7 <= $signed(((((&wire0) >>> $unsigned(reg7)) <= reg6) ?
                  wire2[(4'h9):(4'h9)] : reg10[(2'h3):(1'h1)]));
            end
          else
            begin
              reg6 <= (~^(({$unsigned(reg11),
                  (~&reg7)} != $signed((reg10 ~^ wire5))) ~^ $signed($signed($signed(reg6)))));
              reg7 <= (((reg12 - (((8'ha8) ? wire2 : reg11) ?
                      reg10 : reg9[(3'h5):(1'h0)])) ?
                  ((8'hb2) >>> ({wire0,
                      reg9} ^~ (+wire2))) : ($unsigned((wire2 ?
                      reg8 : reg11)) << reg7)) ^~ $unsigned(reg8[(2'h3):(1'h0)]));
            end
          reg8 <= $signed(reg12[(3'h7):(3'h5)]);
        end
      reg13 <= (($unsigned($unsigned($signed((8'ha7)))) == reg12[(2'h2):(2'h2)]) ?
          ((-{(wire0 & (8'hb1))}) ?
              (((~reg8) ?
                  $signed(reg10) : (wire1 * wire5)) > wire1[(2'h2):(1'h1)]) : $signed(reg7[(4'hc):(4'h9)])) : reg10[(3'h5):(2'h3)]);
      reg14 <= reg7;
      reg15 <= (((($signed(wire1) <<< (reg12 && wire3)) ?
              reg9[(2'h2):(1'h1)] : reg14) * $unsigned({$unsigned(wire4)})) ?
          $signed((reg14[(1'h0):(1'h0)] >> ((|reg7) + $unsigned(wire2)))) : {$unsigned((reg8 ?
                  ((8'hb8) != (8'hab)) : (reg6 ^ (8'ha1)))),
              reg12});
    end
  assign wire16 = reg13[(2'h2):(1'h0)];
  assign wire17 = (8'hbf);
  module18 #() modinst30 (wire29, clk, reg11, wire4, wire3, reg8, wire17);
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire [(3'h4):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  assign y = {wire28, wire25, wire24, reg27, reg26, (1'h0)};
  assign wire24 = $unsigned($signed(wire21));
  assign wire25 = (wire22[(3'h4):(2'h2)] ?
                      wire20[(4'h8):(2'h2)] : wire21[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg26 <= wire19[(2'h2):(1'h0)];
      reg27 <= (wire23 >> $signed(($signed({wire22, wire22}) ?
          $signed(wire20) : $unsigned((~^wire23)))));
    end
  assign wire28 = (reg27 ?
                      (wire25 == wire22) : (((wire23 ?
                              $signed(wire19) : ((8'h9c) ?
                                  wire21 : reg26)) && $unsigned($signed(wire21))) ?
                          (reg26[(2'h3):(2'h3)] ?
                              ($unsigned(wire22) ?
                                  $unsigned(wire21) : (wire20 ?
                                      wire24 : wire22)) : reg27) : $unsigned($unsigned($signed(wire22)))));
endmodule
