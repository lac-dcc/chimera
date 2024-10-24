module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
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
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = ((wire4[(3'h7):(3'h7)] > wire4[(1'h1):(1'h0)]) || (&(~(wire3 || $unsigned(wire4)))));
  assign wire7 = ($unsigned((&$unsigned((~|(8'h9f))))) ?
                     $unsigned($unsigned(wire6)) : wire6[(3'h6):(1'h0)]);
  assign wire8 = wire1;
  assign wire9 = wire4[(2'h3):(2'h2)];
  assign wire10 = $signed((wire5 ?
                      wire1 : (($unsigned(wire2) ? wire9 : wire1) ?
                          $unsigned($signed(wire6)) : wire4[(3'h6):(2'h3)])));
  assign wire11 = (8'haa);
  always
    @(posedge clk) begin
      reg12 <= wire0;
      if ((~|wire5))
        begin
          if (wire11)
            begin
              reg13 <= wire7;
              reg14 <= (!$unsigned((~$signed(wire4[(3'h6):(3'h5)]))));
              reg15 <= wire3[(3'h6):(3'h4)];
              reg16 <= ((~&$signed($signed(wire10))) ? wire1 : wire3);
            end
          else
            begin
              reg13 <= (~$signed((-$unsigned(((8'hb4) ? wire4 : wire9)))));
              reg14 <= $unsigned(wire7);
              reg15 <= reg13;
            end
          reg17 <= (|reg16);
          reg18 <= ({wire8[(1'h0):(1'h0)]} ? wire9 : {wire5});
          reg19 <= wire7[(3'h7):(1'h0)];
        end
      else
        begin
          reg13 <= (wire4 ?
              ($signed($unsigned((reg16 >= wire11))) | wire0[(3'h4):(1'h0)]) : wire2[(3'h7):(3'h4)]);
          reg14 <= wire10[(4'h9):(4'h9)];
        end
    end
  assign wire20 = {($signed(wire7) ?
                          {$unsigned($signed(wire0))} : reg17[(1'h0):(1'h0)]),
                      $signed({{wire3, (~^wire4)}, reg17})};
  assign wire21 = (reg14 & (wire20 + wire5[(4'h8):(1'h0)]));
  assign wire22 = (~(({$unsigned(wire21),
                      wire21[(4'hd):(2'h2)]} >>> wire20[(3'h5):(3'h5)]) < (wire6[(3'h4):(3'h4)] - reg19[(3'h5):(3'h5)])));
  assign wire23 = (((reg18 + (-(8'hbf))) | $unsigned($unsigned($unsigned(wire22)))) ?
                      ((-(^(reg16 ? reg14 : reg18))) ?
                          wire8 : $signed({$signed((8'hb5)),
                              wire2})) : ($unsigned(wire21[(4'hf):(3'h6)]) && (+reg12[(2'h2):(1'h0)])));
  assign wire24 = (^~$unsigned((wire4 && wire0[(3'h7):(3'h6)])));
  assign wire25 = {wire2};
endmodule
