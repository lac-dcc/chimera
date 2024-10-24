module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg25,
                 reg24,
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
                 (1'h0)};
  assign wire5 = wire0[(1'h0):(1'h0)];
  assign wire6 = (($unsigned(wire0[(2'h2):(1'h1)]) ?
                         $unsigned((8'hb8)) : (^wire5)) ?
                     $unsigned(($unsigned($unsigned(wire2)) ?
                         (~^(wire0 >> wire1)) : (~^(!wire5)))) : ($unsigned($unsigned((wire0 ?
                         wire2 : wire0))) < (+(wire3 ?
                         ((8'hb5) ? wire3 : wire4) : ((8'haa) == (8'hba))))));
  assign wire7 = wire4;
  assign wire8 = $unsigned((~^wire0));
  assign wire9 = (~^wire7[(4'ha):(3'h6)]);
  assign wire10 = wire6[(2'h2):(1'h0)];
  assign wire11 = wire7[(3'h7):(3'h6)];
  assign wire12 = ((8'hac) ?
                      $unsigned({{wire7[(4'ha):(1'h1)], wire7},
                          ((wire10 ? wire0 : wire10) <= {wire5,
                              wire11})}) : $signed(wire11));
  assign wire13 = $unsigned($signed($unsigned(((~&wire2) & wire6))));
  always
    @(posedge clk) begin
      reg14 <= (wire12[(4'hc):(4'h9)] ?
          wire11[(4'h9):(3'h6)] : $unsigned((~^wire2[(3'h7):(3'h7)])));
      reg15 <= wire3;
      reg16 <= $signed(wire3);
      if (wire2)
        begin
          reg17 <= ($signed(({(wire6 << (8'hae)), (wire8 ? reg15 : wire10)} ?
              $unsigned((+(8'hb4))) : (((8'hb8) > reg15) ^ (wire0 ?
                  wire0 : (8'h9d))))) <= (7'h40));
          reg18 <= wire13[(3'h4):(1'h1)];
          reg19 <= wire5[(3'h7):(3'h6)];
          if ($unsigned(wire2))
            begin
              reg20 <= wire8;
            end
          else
            begin
              reg20 <= (|$unsigned((~(~|(!reg16)))));
              reg21 <= $signed(((&(^~reg20)) ?
                  $unsigned((wire4 ?
                      wire4[(1'h0):(1'h0)] : {wire13})) : {(wire7[(5'h10):(4'hd)] ?
                          (reg20 == reg17) : (reg17 ? wire9 : reg20)),
                      wire8}));
              reg22 <= reg18[(2'h2):(2'h2)];
              reg23 <= wire4;
              reg24 <= $unsigned($signed(wire9[(3'h5):(2'h3)]));
            end
        end
      else
        begin
          reg17 <= $signed(wire12);
          reg18 <= (wire1[(3'h5):(3'h4)] ?
              $signed(($unsigned((~|(8'hbf))) << $signed(wire10[(2'h2):(2'h2)]))) : (8'ha9));
          reg19 <= {(8'hb9), $unsigned({(~|(&reg15))})};
          reg20 <= {($unsigned($signed($signed(reg19))) & ({(!reg17)} ^~ reg20))};
        end
      reg25 <= (^~(!($signed(wire4) < (reg15 << (wire6 & reg24)))));
    end
endmodule
