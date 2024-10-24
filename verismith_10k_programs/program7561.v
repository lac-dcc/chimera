module top
#(parameter param27 = {(((((8'hbe) & (8'hb7)) ? ((8'ha8) >= (8'ha3)) : ((7'h42) ? (8'hab) : (8'ha1))) ? {((8'ha5) ? (7'h44) : (8'hb5)), ((8'hac) != (8'hb8))} : (((8'hb2) <<< (8'ha6)) ? (8'hac) : ((8'hb9) && (8'hae)))) > {(&{(8'ha0), (8'hbd)}), (((8'hbf) != (8'ha4)) & ((8'hb6) ? (8'ha0) : (8'hbe)))}), {((8'hb9) ? (~&((8'hb3) ? (8'ha5) : (8'h9f))) : (((8'hb6) ? (8'hb7) : (8'h9d)) ? ((8'hb4) ? (7'h44) : (8'ha7)) : {(8'hb0)})), ((^(8'hbd)) ? (((8'hb2) <= (8'hbc)) & (&(8'had))) : ((-(8'hb4)) ? (+(8'haf)) : (|(8'hb7))))}}, 
parameter param28 = (~|param27))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = wire3[(3'h4):(1'h1)];
  assign wire5 = ($signed(wire1[(4'hd):(1'h1)]) ?
                     (^~$unsigned(((wire0 ?
                         wire1 : wire0) >> (!wire3)))) : $unsigned((~wire0)));
  assign wire6 = $unsigned($unsigned({((wire2 ? wire5 : wire0) ?
                         (^wire5) : (wire4 ^ wire1)),
                     (|(wire4 + (8'ha6)))}));
  assign wire7 = wire0;
  assign wire8 = $signed((|wire7));
  always
    @(posedge clk) begin
      reg9 <= $unsigned({(wire5 | ($signed(wire2) ?
              $signed((8'ha9)) : (wire3 ? wire0 : wire0)))});
      reg10 <= $signed(wire3[(2'h2):(1'h1)]);
      reg11 <= $unsigned($unsigned($signed((~(-(8'hb2))))));
      reg12 <= $unsigned((^~($unsigned(reg9) << wire2)));
    end
  always
    @(posedge clk) begin
      reg13 <= (~&$signed((~|(^~{reg11, (8'ha9)}))));
      reg14 <= (~|{$unsigned(((wire5 <= reg10) * (&wire3)))});
      if ((~(8'hb3)))
        begin
          reg15 <= (+reg13);
          reg16 <= (~|$signed(((~^wire0) && reg10)));
        end
      else
        begin
          reg15 <= (reg16[(1'h0):(1'h0)] ?
              (((^$signed(reg12)) ? (8'hb1) : $signed(wire5[(3'h7):(2'h3)])) ?
                  $signed(($signed(wire5) ?
                      reg11 : $unsigned(wire1))) : (reg12 != (+(+(7'h40))))) : (wire5[(4'h8):(1'h0)] <<< wire4));
          reg16 <= $unsigned(($unsigned(wire1) ?
              (7'h40) : $signed($unsigned($unsigned(reg9)))));
          reg17 <= (8'hbe);
          reg18 <= reg11[(1'h1):(1'h1)];
          reg19 <= ((~(({(8'h9c), wire5} > (^~wire8)) ?
              ((reg11 ?
                  (8'hb8) : wire4) >>> $unsigned((7'h44))) : (8'hba))) ~^ (|$signed((&$unsigned(reg12)))));
        end
      if (((reg11 ?
          $signed($signed((^~reg18))) : reg15[(3'h6):(3'h6)]) > ({wire6[(2'h2):(2'h2)]} ?
          ($signed((wire6 - wire8)) << wire5[(1'h1):(1'h1)]) : (-{wire0[(4'hd):(1'h0)]}))))
        begin
          reg20 <= $unsigned($unsigned(($unsigned($signed(wire1)) | (-$unsigned(reg15)))));
          reg21 <= $unsigned($unsigned(({(wire4 & wire2)} ?
              (8'ha5) : (~&$signed(reg20)))));
          reg22 <= (|$signed(reg14[(3'h7):(1'h1)]));
        end
      else
        begin
          reg20 <= (^~reg13);
        end
      reg23 <= (+$signed($signed((~^$signed((8'hb1))))));
    end
  assign wire24 = $signed({((^$unsigned(reg22)) ?
                          (-$unsigned(reg17)) : $signed((&wire3)))});
  assign wire25 = reg21[(2'h3):(1'h1)];
  assign wire26 = reg15;
endmodule
