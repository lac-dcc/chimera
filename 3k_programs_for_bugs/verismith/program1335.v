module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg10,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = ({wire2[(5'h13):(4'he)]} ?
                     (^~wire4[(4'h9):(3'h5)]) : $unsigned($unsigned(wire5[(2'h2):(2'h2)])));
  assign wire7 = wire3;
  assign wire8 = $unsigned((~($signed((8'ha5)) ?
                     (wire0[(1'h0):(1'h0)] >>> wire0) : ((^wire1) ?
                         {wire7, wire0} : $signed(wire0)))));
  assign wire9 = ((wire2 < wire2) ?
                     $unsigned({$signed($signed(wire2))}) : (($signed(wire4) ?
                         $unsigned(((8'ha3) ?
                             wire1 : wire8)) : $unsigned(wire5)) << {$signed((|wire5))}));
  always
    @(posedge clk) begin
      reg10 <= (($signed($unsigned(wire7)) + (wire8 + (wire2 ?
              {wire0} : {wire1, wire4}))) ?
          wire2 : wire1[(2'h2):(1'h0)]);
    end
  assign wire11 = {(-wire5)};
  assign wire12 = $unsigned($unsigned(wire4));
  assign wire13 = wire4;
  assign wire14 = wire5;
  assign wire15 = wire14;
  assign wire16 = {wire15};
  assign wire17 = $signed($unsigned((-(wire13[(2'h3):(1'h0)] ?
                      (|(8'hab)) : wire7))));
  assign wire18 = (wire13 ?
                      (wire17 ?
                          wire4[(3'h7):(1'h0)] : (wire1[(2'h3):(1'h0)] ?
                              (wire15[(2'h2):(2'h2)] ?
                                  $unsigned((8'hae)) : wire8) : wire8[(2'h3):(1'h1)])) : wire0);
  assign wire19 = $signed(((~|$signed(wire7)) ?
                      (^~((wire1 * wire4) ^ {wire9,
                          wire4})) : wire8[(4'ha):(2'h3)]));
  assign wire20 = $signed((wire4[(4'hb):(4'hb)] == $unsigned(($signed(wire7) & (~&(7'h42))))));
  always
    @(posedge clk) begin
      if ($signed($signed({wire18[(1'h0):(1'h0)], wire13})))
        begin
          reg21 <= (wire9 ?
              (^~reg10[(4'hf):(4'hb)]) : ((((~|wire19) == {wire20,
                  wire11}) ^ ($unsigned(reg10) ?
                  $signed(wire19) : wire14)) > (wire19[(4'he):(4'hc)] << ({wire12,
                      wire0} ?
                  wire14 : (wire7 * wire11)))));
        end
      else
        begin
          reg21 <= $signed(($signed(($unsigned((8'ha5)) || wire3[(2'h2):(1'h1)])) && wire17));
          reg22 <= $signed(wire0);
          reg23 <= ($unsigned($unsigned(wire8)) <<< wire19[(3'h6):(1'h0)]);
          reg24 <= (wire8 != ((8'hb9) << ($signed(wire17) ?
              wire13 : wire12[(1'h1):(1'h1)])));
          reg25 <= ((!({$unsigned(wire3)} ?
              wire7[(4'hc):(1'h1)] : wire8)) >>> wire19[(3'h7):(3'h4)]);
        end
      if (reg21[(2'h3):(1'h0)])
        begin
          reg26 <= $signed(wire9[(5'h14):(4'ha)]);
          reg27 <= reg22[(1'h1):(1'h1)];
        end
      else
        begin
          reg26 <= wire13;
          reg27 <= reg24;
          reg28 <= ($unsigned(({(&wire8),
              $unsigned(wire16)} ~^ wire18[(4'hd):(3'h4)])) ^~ (^reg25[(2'h2):(2'h2)]));
          reg29 <= $signed((+($unsigned(wire5[(1'h1):(1'h0)]) > ((wire16 >= reg10) ?
              wire6[(4'ha):(4'h9)] : (8'h9f)))));
          reg30 <= $unsigned($signed((!(|(8'ha8)))));
        end
      reg31 <= {(wire6 ? wire3[(1'h1):(1'h0)] : reg28), reg21[(2'h3):(1'h0)]};
    end
endmodule
