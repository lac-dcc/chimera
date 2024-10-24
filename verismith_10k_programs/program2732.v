module top
#(parameter param26 = (^({(^~(~&(8'hb8))), (^((8'hb4) ? (8'ha9) : (8'ha6)))} < ((!((8'ha3) << (7'h44))) >>> (((8'hb8) >>> (8'hb7)) > (8'haa))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
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
                 (1'h0)};
  assign wire4 = wire3[(4'ha):(3'h6)];
  assign wire5 = $signed($signed((8'ha9)));
  assign wire6 = $signed(wire4);
  assign wire7 = $unsigned(wire3);
  always
    @(posedge clk) begin
      reg8 <= wire5[(3'h7):(3'h7)];
      reg9 <= $signed(($signed({$signed(wire5),
          wire5[(4'h8):(3'h4)]}) | $signed(((reg8 & wire7) ?
          ((8'hb4) ? wire1 : wire1) : (wire4 <<< wire5)))));
      if (wire0[(3'h6):(3'h4)])
        begin
          if ($signed($unsigned((-(~|$signed(wire2))))))
            begin
              reg10 <= $unsigned(wire5[(3'h5):(1'h1)]);
              reg11 <= (wire0[(3'h7):(3'h7)] + wire2);
              reg12 <= $unsigned(wire4);
            end
          else
            begin
              reg10 <= wire7;
              reg11 <= wire5;
              reg12 <= wire1;
              reg13 <= (-$unsigned(wire6));
            end
          reg14 <= wire6[(3'h5):(3'h4)];
          reg15 <= {$unsigned({wire5, (wire0 || wire5[(3'h4):(3'h4)])})};
          reg16 <= (~^(((~|$unsigned(reg14)) | (reg15[(4'hf):(4'h8)] >> $unsigned(wire0))) ?
              $unsigned(reg13) : (reg14[(2'h2):(1'h0)] ?
                  wire6 : (~|(^~reg12)))));
        end
      else
        begin
          reg10 <= (!(~$signed((&(wire3 - reg13)))));
          reg11 <= wire0;
          reg12 <= (($signed(((~|(8'h9f)) ? wire0 : (reg16 ? wire1 : reg9))) ?
                  $signed((^~$unsigned(reg13))) : (^~(~|$unsigned((8'ha9))))) ?
              $signed(reg13) : $unsigned(wire2[(2'h3):(2'h2)]));
          reg13 <= reg15;
        end
      reg17 <= $unsigned($signed(wire5[(3'h6):(1'h1)]));
    end
  assign wire18 = $signed($signed($signed((&{(8'ha9), wire4}))));
  assign wire19 = (reg10[(2'h3):(2'h2)] ?
                      ($unsigned(reg9[(1'h0):(1'h0)]) ?
                          (~&$signed({(8'haf)})) : $signed($signed((|wire6)))) : (^~reg16[(4'hc):(4'h9)]));
  assign wire20 = wire6;
  assign wire21 = ((~&reg16) ~^ ($unsigned(wire18[(4'h8):(2'h3)]) > $unsigned({wire7[(1'h0):(1'h0)]})));
  always
    @(posedge clk) begin
      reg22 <= (reg17 * (^~{(&reg9[(2'h2):(1'h1)]), (^$unsigned(wire20))}));
      reg23 <= {$signed(((+wire3) ^ ({wire18, wire2} < (reg13 ?
              wire18 : reg10))))};
      reg24 <= (((($unsigned(reg9) >> ((8'hbf) ?
              wire5 : wire21)) == (~&$signed(reg10))) ?
          ((~(reg14 >> reg13)) ?
              wire2[(2'h3):(2'h3)] : $signed(((7'h42) ?
                  reg17 : wire21))) : {wire1[(5'h13):(4'h8)]}) || reg22);
      reg25 <= ((~|reg15[(4'hc):(4'h9)]) && wire2[(3'h4):(2'h2)]);
    end
endmodule
