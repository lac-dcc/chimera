module top
#(parameter param30 = (|(^{(((8'h9e) ? (8'hbf) : (8'hb5)) ? ((8'hac) >= (8'ha8)) : ((8'hbe) & (8'ha2)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire22;
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  assign y = {wire24,
                 wire8,
                 wire22,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(wire3[(1'h0):(1'h0)]);
      reg5 <= reg4;
      reg6 <= $unsigned(((((reg5 ? wire3 : wire2) ?
              wire0[(2'h3):(2'h2)] : reg4[(2'h3):(1'h0)]) & (+$signed(reg4))) ?
          reg4 : $unsigned($signed(wire1[(3'h5):(3'h5)]))));
      reg7 <= wire3[(1'h1):(1'h1)];
    end
  assign wire8 = ($signed($signed($signed(reg4[(4'ha):(3'h7)]))) != $unsigned(({(wire3 ^ (8'ha7))} == {wire0[(4'ha):(4'ha)]})));
  module9 #() modinst23 (.y(wire22), .wire13(wire1), .clk(clk), .wire10(reg5), .wire12(reg7), .wire11(reg4));
  assign wire24 = (wire2 ?
                      $unsigned(((8'hbd) != (-reg4))) : $unsigned($signed($signed((reg5 - reg6)))));
  always
    @(posedge clk) begin
      reg25 <= {reg7,
          (((wire22 ? ((8'hbd) + wire22) : (^~(8'hb1))) >= ((~&wire8) ?
                  $signed((8'hb9)) : wire1)) ?
              reg6[(1'h0):(1'h0)] : ($unsigned($signed(reg6)) ?
                  $signed($unsigned(wire8)) : ({wire1} << ((8'hb0) ?
                      wire8 : reg7))))};
      reg26 <= (wire2 ? reg7 : reg6);
      if ($signed(reg4))
        begin
          reg27 <= wire22;
          reg28 <= (8'ha3);
          reg29 <= (8'ha7);
        end
      else
        begin
          if ($unsigned(reg4[(4'h8):(2'h3)]))
            begin
              reg27 <= wire24;
              reg28 <= $unsigned(wire1[(3'h4):(2'h2)]);
            end
          else
            begin
              reg27 <= $unsigned((reg5 && ((reg28[(3'h5):(3'h5)] ?
                      (reg4 == reg6) : wire2[(3'h5):(1'h1)]) ?
                  reg5 : reg26[(3'h5):(1'h1)])));
              reg28 <= $signed(wire24[(2'h2):(1'h1)]);
              reg29 <= reg4[(4'ha):(3'h5)];
            end
        end
    end
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire13;
  input wire signed [(4'h9):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire14 = wire12[(1'h0):(1'h0)];
  assign wire15 = ($unsigned(($signed({wire13, wire14}) >= {wire14})) ?
                      $unsigned(wire12) : (($signed(wire14[(4'he):(3'h7)]) && $signed($unsigned((8'haf)))) != {wire11,
                          {{wire11}, wire11}}));
  assign wire16 = $signed({(^~(|wire11[(4'hb):(2'h2)]))});
  always
    @(posedge clk) begin
      reg17 <= $signed($signed((^$unsigned({wire14, (8'h9f)}))));
      reg18 <= wire12[(3'h4):(2'h2)];
      reg19 <= wire13;
      reg20 <= ($unsigned((wire14[(5'h14):(5'h13)] ?
              wire12 : $signed(wire13[(2'h3):(1'h0)]))) ?
          ((!wire12) && $unsigned($unsigned(((8'hab) + (8'haa))))) : (8'hba));
      reg21 <= $unsigned((wire13[(3'h5):(1'h0)] ?
          $signed($unsigned((wire10 ? wire16 : reg20))) : wire12));
    end
endmodule
