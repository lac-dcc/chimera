module top
#(parameter param20 = (|{(&((~|(7'h40)) ? {(8'hb3)} : ((8'ha3) | (8'h9f))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = {wire0, wire0[(3'h7):(1'h1)]};
  assign wire6 = $signed(wire2);
  assign wire7 = {wire6, wire5[(2'h2):(1'h1)]};
  always
    @(posedge clk) begin
      if (($signed(wire6) >>> $signed((((!wire2) == $unsigned(wire1)) ?
          ((wire6 ? (8'hb1) : wire0) || (8'hb9)) : ({wire5, wire4} ^~ (wire3 ?
              wire2 : wire3))))))
        begin
          reg8 <= (+$signed((!wire3[(3'h7):(3'h6)])));
          reg9 <= ({wire6[(1'h1):(1'h0)]} >> reg8[(1'h0):(1'h0)]);
          reg10 <= (wire5[(1'h1):(1'h1)] ?
              ((~&$unsigned((wire1 ?
                  reg8 : wire4))) <<< (|wire7[(2'h3):(1'h0)])) : wire4[(1'h0):(1'h0)]);
          if (wire5)
            begin
              reg11 <= ($signed(wire4) ?
                  (($signed({(8'ha3)}) <<< wire5[(3'h4):(2'h3)]) <<< {wire4}) : ($signed((wire5 ?
                      (~reg9) : (8'ha3))) > (^wire6[(4'hd):(2'h2)])));
              reg12 <= $signed($unsigned($unsigned(({reg9,
                  wire2} != {wire6}))));
              reg13 <= ($signed(reg12) ?
                  {(^~((+wire7) ?
                          reg8 : (8'hbb)))} : $unsigned(reg8[(1'h0):(1'h0)]));
            end
          else
            begin
              reg11 <= wire7;
              reg12 <= (~|{((^~$signed(wire1)) << (reg13[(4'hf):(1'h0)] ?
                      wire2[(1'h1):(1'h1)] : (wire3 ? (8'hba) : wire3))),
                  $signed(wire3[(3'h4):(3'h4)])});
            end
        end
      else
        begin
          reg8 <= (8'hb9);
          reg9 <= (-(~&wire7));
          reg10 <= wire2;
        end
      reg14 <= $signed(wire5[(5'h11):(4'hd)]);
      reg15 <= (!reg14);
    end
  always
    @(posedge clk) begin
      reg16 <= wire5[(1'h1):(1'h1)];
      reg17 <= (reg11 ?
          ((~|reg11[(4'h9):(4'h8)]) & $unsigned({(reg13 && reg11)})) : ({((&(8'ha6)) ?
                      wire4 : $signed(wire4)),
                  (^$unsigned(reg10))} ?
              wire6[(4'he):(2'h3)] : wire5[(4'h9):(1'h0)]));
      reg18 <= ($unsigned($unsigned(reg17[(4'he):(3'h5)])) ? wire3 : wire2);
      reg19 <= $signed((^reg13[(4'hb):(3'h5)]));
    end
endmodule
