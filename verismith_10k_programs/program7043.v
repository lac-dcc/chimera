module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire8,
                 wire4,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire1;
  always
    @(posedge clk) begin
      reg5 <= (^$unsigned($signed({((7'h43) ? (8'hac) : wire0)})));
      reg6 <= wire3;
      reg7 <= $signed($signed(((wire4[(4'he):(3'h7)] ?
              (wire4 && reg6) : (wire1 ? wire2 : reg6)) ?
          ({(8'ha0)} ?
              $unsigned(wire3) : {wire1, (8'ha0)}) : $signed((~wire3)))));
    end
  assign wire8 = $signed($signed((($unsigned(reg6) >> (reg7 ^~ wire4)) ?
                     ({wire2, reg7} <= (reg7 != reg6)) : (-$unsigned(wire2)))));
  always
    @(posedge clk) begin
      reg9 <= (($unsigned(wire8) || (7'h40)) ?
          wire0[(4'hd):(1'h1)] : (($unsigned(reg7[(3'h6):(3'h6)]) ?
                  wire0 : ({wire8, reg7} ? {reg5} : (|wire3))) ?
              ((|(reg6 ?
                  (8'hb4) : (8'ha6))) + reg7) : $signed($unsigned((wire4 * wire1)))));
      reg10 <= ($signed(({(reg6 ? wire3 : (8'ha3))} ?
              reg6 : reg5[(1'h1):(1'h1)])) ?
          $unsigned({$unsigned((wire0 - reg9))}) : $unsigned((((wire8 > wire1) ?
                  (wire4 ? (8'hb3) : reg7) : (reg6 ? wire8 : wire1)) ?
              (~^$signed(wire8)) : $unsigned($unsigned(reg9)))));
      if ((~|wire0))
        begin
          reg11 <= $signed((-{(&(wire4 - reg7))}));
          reg12 <= $unsigned($signed(reg7));
          reg13 <= $unsigned($signed($signed(wire2[(4'h9):(1'h1)])));
          reg14 <= wire1;
        end
      else
        begin
          reg11 <= reg13;
          if ((~|reg5))
            begin
              reg12 <= (~&$unsigned(wire0[(2'h2):(1'h0)]));
              reg13 <= ({(reg10 <<< ({reg14, (8'h9c)} ? {reg10} : (+wire2)))} ?
                  ((~{wire3}) >= $unsigned((&$signed((8'hb9))))) : $unsigned((~&{(reg9 ?
                          reg9 : wire4),
                      (reg6 ? (8'hae) : (8'had))})));
              reg14 <= (~$signed({$unsigned((reg11 ? reg7 : reg14))}));
              reg15 <= (wire0[(4'h9):(1'h1)] ?
                  (~^wire1) : (wire4 < (reg13 || {(reg14 ? reg13 : reg10),
                      wire1})));
            end
          else
            begin
              reg12 <= wire8;
            end
        end
      if ({(wire3 <= wire0[(4'ha):(1'h1)])})
        begin
          reg16 <= (8'haa);
          reg17 <= $unsigned((&(({(8'hae)} != (wire3 ~^ wire1)) < reg7[(1'h0):(1'h0)])));
        end
      else
        begin
          reg16 <= $unsigned(reg5);
          reg17 <= (&(&wire3));
          reg18 <= ((7'h43) ?
              ((reg5[(3'h7):(3'h6)] ?
                      (~|wire0[(4'hb):(2'h3)]) : ((wire4 ?
                          reg6 : (8'ha1)) != $signed(reg17))) ?
                  $unsigned(wire8) : (reg7[(1'h1):(1'h1)] || wire2)) : reg10[(1'h1):(1'h1)]);
        end
    end
  assign wire19 = $unsigned($signed($signed($signed((reg6 + reg10)))));
  assign wire20 = (((^~$unsigned(reg13)) <<< (wire8[(4'h9):(3'h6)] ?
                      (((8'hb1) * (8'ha5)) ?
                          $unsigned(wire3) : (wire3 < reg15)) : (8'ha1))) && reg16);
  assign wire21 = $signed($signed(reg14[(4'h8):(3'h6)]));
  assign wire22 = (wire19 | wire4);
  assign wire23 = $signed((!((~|(wire0 && reg12)) >>> ({wire0} - $unsigned(reg7)))));
  always
    @(posedge clk) begin
      reg24 <= $signed($signed($unsigned(reg17[(2'h3):(2'h2)])));
      reg25 <= reg12;
      reg26 <= $unsigned(($unsigned(wire20[(1'h1):(1'h1)]) ?
          {reg11, (~^$unsigned((8'haa)))} : (~({reg9} | ((8'hb6) << wire19)))));
      reg27 <= (($signed(reg15) > (!$unsigned((~&reg5)))) || (~^(~$unsigned((~^reg13)))));
      reg28 <= wire20;
    end
  assign wire29 = {$unsigned(wire3[(4'h9):(2'h3)])};
  assign wire30 = $unsigned((-$unsigned(($signed(reg24) ?
                      (~^reg24) : (wire4 ? reg25 : wire1)))));
endmodule
