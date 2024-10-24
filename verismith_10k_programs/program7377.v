module top
#(parameter param28 = ((((((8'ha9) ? (8'ha8) : (8'ha5)) > {(8'hb4), (8'hb7)}) & ((8'hbd) & ((8'ha9) ^ (8'haf)))) == ((~&{(8'hac)}) | {(^~(8'hbb)), (~^(8'hb1))})) != (8'hb7)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = ($unsigned(($unsigned(((8'ha8) == wire2)) == $signed((^wire4)))) == (8'ha9));
  assign wire6 = $unsigned($unsigned(wire3[(3'h4):(2'h3)]));
  assign wire7 = ($signed(wire3) && (-$signed(((wire0 ?
                     wire2 : wire4) & wire5))));
  assign wire8 = (~wire5[(4'hf):(2'h2)]);
  assign wire9 = $unsigned(wire3);
  assign wire10 = $unsigned((~$unsigned((((8'ha0) << wire8) ?
                      {(8'had)} : (8'ha5)))));
  assign wire11 = wire8[(4'he):(4'hb)];
  assign wire12 = {wire10[(4'hd):(4'hc)],
                      ((|(!wire3)) > $unsigned(((wire4 <<< wire2) ?
                          (~wire2) : wire3)))};
  assign wire13 = $unsigned($unsigned((($signed(wire1) ?
                      (wire2 >> wire7) : (~wire7)) || wire11[(5'h11):(2'h3)])));
  assign wire14 = $unsigned(wire1);
  always
    @(posedge clk) begin
      reg15 <= {wire1, (8'haf)};
      if (($signed((wire12[(2'h2):(1'h1)] << (8'hb0))) >>> wire8[(5'h12):(4'ha)]))
        begin
          reg16 <= reg15;
          reg17 <= wire3;
          if ({{$signed($unsigned($signed(wire7)))}, wire2[(4'hb):(3'h6)]})
            begin
              reg18 <= $signed($signed((|wire10)));
            end
          else
            begin
              reg18 <= wire5;
              reg19 <= (8'hbe);
              reg20 <= (wire11 ?
                  wire14 : ($signed((wire7[(1'h0):(1'h0)] <= {wire10,
                      wire5})) > {(~|(reg16 * wire8)), reg15}));
              reg21 <= (8'h9e);
              reg22 <= (+(^{$unsigned(wire0), $signed($signed(reg19))}));
            end
          reg23 <= reg16;
          reg24 <= (wire6 && (reg19[(2'h2):(1'h1)] + $signed($unsigned((reg20 ?
              reg18 : (8'ha0))))));
        end
      else
        begin
          reg16 <= $signed($unsigned($signed(wire9)));
          reg17 <= $unsigned({wire3,
              $unsigned(($unsigned(reg23) ? (^~reg19) : (~wire6)))});
        end
      reg25 <= (8'ha5);
    end
  assign wire26 = (^~{$signed($unsigned(reg21)), wire13[(3'h4):(2'h2)]});
  assign wire27 = {(($signed(wire26[(2'h3):(1'h1)]) || (8'h9f)) != $signed((((8'ha5) | wire7) ?
                          (reg16 ? wire5 : reg18) : $unsigned(wire12)))),
                      $signed(wire2)};
endmodule
