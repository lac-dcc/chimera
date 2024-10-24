module top
#(parameter param24 = (((~&(((8'hb1) | (8'ha0)) ? ((8'ha4) ? (8'hae) : (8'hac)) : (^(8'hbe)))) << ({((8'ha7) ? (8'ha1) : (8'hb0)), (8'hbf)} ? ((~(8'ha7)) & {(8'ha0), (7'h43)}) : ({(8'ha8)} ? ((8'hbe) ? (8'h9f) : (7'h41)) : ((8'ha3) ? (8'hb3) : (8'hb2))))) >> (&(!(+(8'haf))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire10,
                 wire9,
                 reg23,
                 reg22,
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
                 reg11,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0;
      reg5 <= $unsigned(wire0);
      reg6 <= $signed(wire2[(2'h2):(2'h2)]);
      reg7 <= (^~(8'hbd));
      reg8 <= (-$unsigned($signed($signed($signed((7'h40))))));
    end
  assign wire9 = (({reg7,
                     {(wire3 > (8'hbb)),
                         reg7[(3'h6):(2'h3)]}} >>> reg7) > (reg6[(1'h1):(1'h0)] ?
                     wire1[(4'h8):(3'h5)] : $signed((~|((8'h9e) + reg5)))));
  assign wire10 = ((reg5 ?
                          $unsigned((~&{reg8})) : (reg4 ?
                              ((reg4 | wire2) <<< $signed(reg6)) : $signed(wire2))) ?
                      {($unsigned(((8'ha5) ? wire2 : reg4)) ?
                              (wire9[(2'h2):(1'h1)] != reg8) : (8'ha0)),
                          $signed(($signed(reg5) ?
                              (&reg5) : ((7'h41) >= reg8)))} : (^~$signed(reg7[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg11 <= (((reg7 ?
              $unsigned(((8'h9f) ? wire10 : (8'hbf))) : $signed((reg6 ?
                  wire9 : (8'h9d)))) != (7'h43)) ?
          reg4[(1'h0):(1'h0)] : $unsigned($signed(((^wire2) ?
              wire1 : (^reg7)))));
      reg12 <= $unsigned($unsigned($unsigned(wire2)));
      if ($signed($unsigned(((!(~^reg8)) ? $signed((^~wire0)) : wire10))))
        begin
          if (reg11)
            begin
              reg13 <= (reg4[(4'ha):(2'h2)] ? reg12 : {reg7, reg6});
              reg14 <= wire2;
              reg15 <= reg11[(3'h7):(3'h5)];
              reg16 <= reg8[(4'ha):(4'h9)];
              reg17 <= (reg6 ?
                  reg13 : (wire9[(1'h0):(1'h0)] ^~ $signed((+$signed(reg11)))));
            end
          else
            begin
              reg13 <= ((~^$unsigned($unsigned($signed((8'haf))))) ^~ (-$signed($signed((~wire10)))));
              reg14 <= wire9;
            end
          reg18 <= {$unsigned(wire9)};
          if ((reg4 ?
              $signed(wire10[(3'h6):(2'h3)]) : ((wire9 ^~ reg16[(2'h2):(2'h2)]) || $signed(($unsigned(reg14) ?
                  $unsigned(reg13) : reg7[(4'h8):(3'h4)])))))
            begin
              reg19 <= {reg8, ($unsigned(reg14) >> wire2)};
            end
          else
            begin
              reg19 <= {(wire2[(1'h0):(1'h0)] ~^ reg8),
                  (~&{$signed($unsigned(reg19))})};
              reg20 <= (^$signed((8'hae)));
            end
          reg21 <= reg6;
          reg22 <= $unsigned(($signed((+wire1)) ?
              {(!reg16),
                  (reg18[(4'hc):(4'hb)] - {reg4})} : (~$unsigned(wire2[(1'h1):(1'h0)]))));
        end
      else
        begin
          reg13 <= reg21[(3'h5):(3'h5)];
          reg14 <= (~$unsigned(((reg21[(3'h4):(3'h4)] ^ (~|reg16)) ?
              (!{wire2}) : $signed(reg8))));
          reg15 <= reg5;
          reg16 <= reg18;
        end
      reg23 <= reg19[(3'h6):(3'h6)];
    end
endmodule
