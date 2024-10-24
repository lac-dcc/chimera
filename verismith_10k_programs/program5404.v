module top
#(parameter param31 = (((&(((8'h9e) ? (8'hb2) : (8'haa)) & (&(8'ha5)))) >= {{((8'ha6) ? (8'hb3) : (8'ha4))}}) ? ((({(8'ha6)} ? ((7'h44) ? (8'hb9) : (8'hb0)) : ((8'hba) ? (7'h41) : (8'ha5))) << ((~^(8'ha1)) ? ((8'ha9) ? (8'ha2) : (8'ha8)) : ((8'hb6) ? (8'hb9) : (8'hb2)))) && (({(8'h9e), (8'hb7)} - ((8'hb0) | (8'ha9))) ? (-(~(8'h9e))) : (~&((8'hbb) ^ (8'h9d))))) : (((^~((8'ha5) ? (7'h41) : (8'ha1))) <<< (~|((8'ha0) ? (8'h9e) : (8'ha4)))) <= ((((8'h9e) ^~ (8'hae)) ? ((7'h42) ? (8'ha9) : (8'hb3)) : (~&(8'haa))) ? ((&(7'h44)) ? ((8'ha4) || (8'hae)) : (!(8'ha9))) : (((8'ha2) ? (8'h9f) : (8'ha7)) >= ((7'h41) & (8'ha9)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire19;
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  assign y = {wire30,
                 wire21,
                 wire5,
                 wire6,
                 wire7,
                 wire19,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire5 = wire4[(4'h9):(3'h4)];
  assign wire6 = wire1;
  assign wire7 = $unsigned((~&(wire4[(3'h4):(3'h4)] > ((-wire3) > (wire5 ?
                     wire6 : wire0)))));
  module8 #() modinst20 (wire19, clk, wire4, wire2, wire1, wire5, wire0);
  assign wire21 = ($unsigned($unsigned($signed((wire7 ? wire3 : wire19)))) ?
                      wire5[(3'h7):(3'h6)] : (|wire6));
  always
    @(posedge clk) begin
      reg22 <= $signed($unsigned({wire19[(1'h0):(1'h0)], {wire7}}));
      reg23 <= $signed($unsigned((7'h44)));
      if (reg22[(5'h10):(4'ha)])
        begin
          if ({((-wire4) + (($unsigned((8'hbd)) ?
                      (wire6 <<< wire7) : (wire7 << reg22)) ?
                  (wire7[(4'he):(4'h8)] > {wire5, (8'hb2)}) : wire0))})
            begin
              reg24 <= reg22[(4'h9):(1'h0)];
              reg25 <= wire4[(1'h0):(1'h0)];
              reg26 <= $unsigned(($signed($unsigned(wire5[(1'h1):(1'h1)])) < $signed(wire21[(3'h6):(1'h1)])));
            end
          else
            begin
              reg24 <= reg25;
              reg25 <= (+reg25[(3'h7):(2'h3)]);
              reg26 <= (((&((wire7 ? (8'hac) : wire2) ?
                          (reg22 >> wire3) : (reg22 + wire3))) ?
                      ($unsigned(wire4) && (((8'hb5) ? wire1 : wire3) ?
                          $unsigned(wire0) : $unsigned(wire7))) : (^~wire6)) ?
                  $signed((~&(&wire1[(1'h0):(1'h0)]))) : (reg26 ?
                      (-{$unsigned(reg26),
                          (reg26 <<< wire4)}) : $unsigned(($signed(wire1) || {wire21,
                          reg24}))));
              reg27 <= ($unsigned(((((8'ha3) >> wire2) == (wire21 && reg24)) ?
                      reg24[(4'ha):(4'ha)] : (&(wire21 > wire2)))) ?
                  $unsigned($unsigned((^~(wire21 | (8'ha2))))) : wire1[(2'h2):(1'h0)]);
              reg28 <= (|(8'haa));
            end
        end
      else
        begin
          reg24 <= (~&$unsigned(($unsigned(wire2) << ($signed((8'hae)) ^~ wire1))));
          reg25 <= reg28;
        end
      reg29 <= wire21;
    end
  assign wire30 = wire0[(4'hb):(3'h6)];
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(4'h9):(1'h0)] wire12;
  input wire signed [(3'h6):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  assign y = {wire15, wire14, reg18, reg17, reg16, (1'h0)};
  assign wire14 = $unsigned({(wire9 ?
                          (&((8'hb0) >>> wire10)) : $signed((8'ha7))),
                      $unsigned((wire13[(1'h0):(1'h0)] ?
                          $unsigned((8'ha0)) : (wire10 ? wire11 : (8'had))))});
  assign wire15 = wire14;
  always
    @(posedge clk) begin
      reg16 <= $unsigned($unsigned(wire10[(1'h0):(1'h0)]));
      if ($unsigned($signed($unsigned($unsigned($unsigned((7'h41)))))))
        begin
          reg17 <= ((^(wire13[(2'h3):(2'h2)] ?
              (wire10 ?
                  (^~reg16) : $unsigned(wire15)) : $unsigned((wire9 + (8'hae))))) & $signed((reg16[(1'h0):(1'h0)] | wire9[(2'h3):(2'h3)])));
        end
      else
        begin
          reg17 <= (wire10 ?
              wire13 : ((^~{$signed(wire10),
                  (-wire9)}) < wire9[(2'h2):(1'h1)]));
        end
    end
  always
    @(posedge clk) begin
      reg18 <= (wire12[(4'h9):(3'h5)] == {wire10, reg17[(3'h6):(3'h5)]});
    end
endmodule
