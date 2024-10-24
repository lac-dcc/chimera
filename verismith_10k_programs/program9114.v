module top
#(parameter param21 = (+(((|((8'h9d) == (8'hb0))) >= (~&(|(8'ha3)))) ? {((^~(7'h40)) ? {(8'ha0)} : (8'h9d)), (((8'ha4) ? (8'hba) : (7'h44)) <= (^~(8'hb8)))} : ((~^(~&(8'hb7))) | (~&(~(8'hba)))))), 
parameter param22 = ((-(^~((param21 ? (8'hbc) : param21) | (|param21)))) > (&(8'hb9))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg4 = (1'h0);
  assign y = {wire20,
                 wire19,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((~wire1) + (($signed((wire0 ?
              (8'h9e) : wire3)) * ((wire2 <<< wire0) ?
              (wire0 - (8'hab)) : $unsigned((7'h40)))) ?
          ((wire0 ?
              (wire3 ?
                  wire2 : wire1) : wire3[(4'he):(4'h8)]) >>> wire2) : (^~{(wire3 ?
                  wire3 : wire0),
              wire0[(4'hb):(2'h3)]})));
      reg5 <= (wire0 ? wire3[(3'h7):(2'h3)] : wire1[(4'hf):(3'h4)]);
      reg6 <= (|$signed((&reg5)));
      reg7 <= ($unsigned(((|(~wire3)) ?
              ((wire1 ? reg4 : wire3) * reg4[(3'h4):(1'h0)]) : wire0)) ?
          reg6[(3'h5):(3'h5)] : (wire0 ? reg4[(4'hc):(4'hc)] : reg5));
      reg8 <= $unsigned(reg4[(5'h13):(3'h6)]);
    end
  always
    @(posedge clk) begin
      reg9 <= wire3[(5'h10):(4'hd)];
      if ((~|$signed(((wire2[(1'h0):(1'h0)] ?
          $unsigned(reg9) : wire3) ~^ $signed((~&reg4))))))
        begin
          reg10 <= reg5;
          reg11 <= {((^$unsigned({reg5})) < (reg8[(3'h6):(1'h0)] ?
                  wire2 : reg10)),
              {wire3[(4'h8):(3'h7)]}};
          reg12 <= ((~(reg11 ? reg5[(4'h8):(3'h6)] : (^~reg9))) ?
              $unsigned(reg5[(1'h0):(1'h0)]) : wire3[(4'hd):(1'h1)]);
        end
      else
        begin
          if ((&({$signed($unsigned(reg8))} ^~ $unsigned(((7'h44) ?
              wire2[(1'h0):(1'h0)] : $unsigned(reg12))))))
            begin
              reg10 <= {($signed((^$unsigned(wire0))) == reg10[(2'h3):(1'h0)])};
            end
          else
            begin
              reg10 <= reg11[(2'h3):(1'h0)];
              reg11 <= ({wire2[(3'h5):(2'h2)], (^~reg10[(2'h3):(1'h0)])} ?
                  reg12[(2'h2):(1'h1)] : $unsigned(reg10));
              reg12 <= reg4;
              reg13 <= (|$unsigned(reg6[(5'h14):(3'h7)]));
            end
          reg14 <= reg11[(2'h2):(1'h1)];
          reg15 <= $signed((wire3[(5'h10):(4'he)] ?
              $signed(((~reg9) <= (reg10 ?
                  reg7 : reg6))) : (reg12 + $signed((wire1 == (8'hba))))));
        end
      reg16 <= wire3[(5'h10):(4'he)];
      reg17 <= (reg8[(2'h3):(1'h0)] ? reg12 : reg16[(2'h2):(1'h1)]);
      reg18 <= (reg17 && reg6[(4'hf):(4'hd)]);
    end
  assign wire19 = ((7'h40) && $unsigned(reg17[(4'ha):(4'ha)]));
  assign wire20 = (~&reg18[(4'h8):(4'h8)]);
endmodule
