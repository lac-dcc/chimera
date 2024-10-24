module top #(parameter param25 = (8'h9c)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire4,
                 reg19,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {(wire3[(3'h4):(3'h4)] ?
                         $unsigned(((^~(8'hb6)) | (wire0 ?
                             wire2 : wire0))) : $signed($unsigned(wire3[(1'h1):(1'h0)]))),
                     ({wire0[(2'h2):(1'h1)],
                             (((8'ha7) < wire3) ?
                                 (!(8'hb9)) : $unsigned((8'h9c)))} ?
                         $signed(wire2) : ((&{wire3, wire3}) ?
                             $signed((!wire1)) : $signed(((8'ha0) | wire1))))};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(({((wire0 ?
              (8'h9f) : wire3) ~^ $signed(wire2))} ^~ ($signed(wire0) > wire2)));
      reg6 <= {$signed((reg5[(1'h1):(1'h1)] >> ($signed(wire2) != (~|wire0))))};
      reg7 <= (wire2 ~^ ((8'ha5) && wire3));
      reg8 <= wire2;
    end
  always
    @(posedge clk) begin
      reg9 <= wire2[(1'h0):(1'h0)];
      reg10 <= (wire4[(4'ha):(3'h6)] ?
          reg6 : ($signed($signed((8'hbb))) <= wire1[(3'h7):(3'h7)]));
      reg11 <= ($unsigned($unsigned((|(wire0 << (8'hb3))))) & $signed(reg8));
      reg12 <= ($signed($signed({wire1})) ?
          (&$signed($unsigned($unsigned(wire2)))) : (^(wire1 ~^ ((^reg6) & (^reg6)))));
      reg13 <= (&($unsigned(((~reg8) ? $signed(wire4) : $signed(reg5))) ?
          ((~|$signed(wire0)) ?
              {{wire1}, (wire4 ? reg9 : reg12)} : ((8'haf) ?
                  (reg11 ? reg12 : reg9) : wire1)) : (&$signed({(8'haf),
              wire0}))));
    end
  always
    @(posedge clk) begin
      if ((~&(reg7[(4'hd):(4'hc)] ?
          (reg10[(3'h4):(3'h4)] ?
              reg6 : ((reg13 ? reg13 : reg6) & {reg5,
                  reg13})) : $unsigned((reg7[(1'h0):(1'h0)] >>> wire0[(1'h1):(1'h1)])))))
        begin
          reg14 <= ((&({reg6[(2'h3):(1'h1)], wire3} ?
                  ((wire2 ^ reg11) ? (~&reg8) : $signed(reg7)) : ((~|reg7) ?
                      {wire0} : (wire2 ? wire3 : reg9)))) ?
              (8'h9d) : (($signed({(8'hb8)}) ?
                      $unsigned((+reg10)) : ($unsigned(wire2) != {wire3})) ?
                  {((wire0 > reg10) ?
                          reg8[(3'h5):(2'h2)] : (reg13 >>> wire1))} : (((reg12 ?
                          reg9 : (7'h41)) != (wire0 <= reg7)) ?
                      (wire2 | (reg13 ?
                          reg11 : (7'h40))) : $signed((~&reg12)))));
          reg15 <= (((+(^((8'h9e) ? reg13 : wire2))) ?
                  (reg13 ?
                      ($signed(reg9) - {reg7}) : $signed(reg14)) : (reg12 * reg5)) ?
              (reg5 <= (($signed((8'h9d)) ? ((7'h44) >> reg6) : (-wire1)) ?
                  reg6 : reg7)) : (~$unsigned(wire1)));
          reg16 <= $signed((((&$unsigned(reg11)) ?
                  reg8[(4'h8):(1'h1)] : wire1) ?
              ((~&reg15[(3'h4):(2'h2)]) << $unsigned($unsigned(reg6))) : {({wire4,
                          reg8} ?
                      {reg13, reg6} : (reg14 == reg14)),
                  $signed((reg8 ? (8'had) : (8'hb7)))}));
        end
      else
        begin
          reg14 <= reg11[(2'h2):(1'h0)];
          if ({$signed((8'hba)), $signed($unsigned($unsigned(reg12)))})
            begin
              reg15 <= $signed((!$signed(wire4[(3'h4):(2'h2)])));
            end
          else
            begin
              reg15 <= ((reg13[(4'hd):(3'h6)] ?
                  wire2[(1'h0):(1'h0)] : wire0) < (reg9 ?
                  ({{wire1},
                      (+wire4)} + $signed($signed(reg12))) : ($signed((wire3 - reg16)) << {reg13})));
              reg16 <= (((&$unsigned(reg12)) <<< {(wire4[(4'h8):(1'h0)] || reg10[(3'h6):(2'h2)])}) ?
                  ((reg11 ?
                      (reg10 ?
                          (7'h41) : {wire3}) : (wire4[(5'h11):(1'h0)] & $unsigned(reg11))) * reg14[(4'hc):(1'h1)]) : reg15);
              reg17 <= reg8[(3'h4):(1'h0)];
              reg18 <= $unsigned((^(&((wire1 | wire2) ?
                  $unsigned((8'h9e)) : (wire1 != (8'hb5))))));
            end
        end
      reg19 <= (~&reg5);
    end
  assign wire20 = $signed(reg7);
  assign wire21 = reg17;
  assign wire22 = reg13;
  assign wire23 = $signed($unsigned((&$unsigned((8'hbc)))));
  assign wire24 = reg10;
endmodule
