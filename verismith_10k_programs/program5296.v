module top
#(parameter param25 = (+{((((8'h9e) ? (8'hb0) : (8'h9f)) ? {(8'hb0)} : (-(8'haa))) <<< (8'hb3)), (-(~((8'ha1) ^ (8'h9f))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  assign y = {wire15,
                 wire7,
                 wire6,
                 wire5,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = ($signed(({wire2} ^ ($unsigned((8'hbb)) ^~ {wire2}))) ?
                     $unsigned($signed((|$signed(wire2)))) : ({(~|$signed(wire2))} ?
                         wire2[(1'h0):(1'h0)] : ($signed(wire4) ?
                             $unsigned((wire3 ? wire1 : (8'h9f))) : wire0)));
  assign wire6 = $signed({wire2[(1'h0):(1'h0)]});
  assign wire7 = $signed(wire0);
  always
    @(posedge clk) begin
      reg8 <= wire7[(4'hc):(3'h6)];
      if ((&(((~$signed(wire2)) ^ (wire7[(3'h4):(2'h3)] ^ (8'ha1))) && (~|(+{wire2,
          wire2})))))
        begin
          reg9 <= {{$unsigned($unsigned($signed((8'hba)))),
                  $unsigned(((!wire4) ?
                      (wire2 ? wire7 : (8'hbf)) : (wire1 + wire1)))},
              wire0[(2'h3):(2'h3)]};
          reg10 <= $unsigned((-(((wire2 && wire7) ?
              wire3[(5'h10):(3'h5)] : {wire4,
                  reg9}) <<< wire2[(2'h2):(1'h0)])));
          reg11 <= wire4[(3'h5):(3'h5)];
          reg12 <= wire6[(1'h0):(1'h0)];
          reg13 <= {(~|$signed(reg9[(2'h2):(1'h0)]))};
        end
      else
        begin
          reg9 <= reg11;
          reg10 <= $unsigned(((^reg12) | ($unsigned($signed(reg12)) ?
              (((8'hb6) ? reg8 : wire2) ?
                  wire2[(1'h1):(1'h1)] : reg8) : $signed($signed(reg10)))));
        end
      reg14 <= (8'hae);
    end
  assign wire15 = (reg12[(3'h4):(2'h2)] ?
                      (!$signed((reg12 ?
                          (reg9 || (7'h41)) : {wire6}))) : ((-reg9[(2'h3):(1'h0)]) * {((reg12 & wire5) >>> (wire6 ?
                              reg14 : reg10)),
                          wire5}));
  always
    @(posedge clk) begin
      if ($signed({wire5[(1'h0):(1'h0)]}))
        begin
          reg16 <= (reg8[(4'h9):(1'h1)] ?
              $signed(reg11[(1'h1):(1'h0)]) : ($unsigned(wire15) << $unsigned(reg14[(1'h1):(1'h1)])));
          reg17 <= wire3;
        end
      else
        begin
          reg16 <= $signed(wire4);
          reg17 <= {(^(^reg14)),
              {($signed($signed(reg14)) ?
                      ({(8'had)} > wire3[(3'h5):(1'h0)]) : wire1)}};
          reg18 <= $signed((~&$unsigned(($signed(reg16) ?
              (^wire3) : (wire15 << reg8)))));
          reg19 <= $unsigned(($signed(reg13[(4'h8):(3'h4)]) ?
              (!{(reg11 ? reg13 : reg14), wire0}) : $signed(((^~wire5) ?
                  reg18[(1'h0):(1'h0)] : $signed(reg9)))));
          reg20 <= $unsigned((+$unsigned((+wire3))));
        end
      reg21 <= (8'hbe);
      reg22 <= $signed((wire1 - $signed((~&(wire6 ? wire4 : wire3)))));
    end
  always
    @(posedge clk) begin
      reg23 <= $unsigned(($unsigned($unsigned($signed(reg13))) ?
          ($signed($unsigned(reg13)) ? wire6 : reg16[(2'h2):(1'h0)]) : {(8'ha4),
              (reg8 ^ (~reg13))}));
      reg24 <= reg13;
    end
endmodule
