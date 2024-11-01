module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire14;
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire14,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((!$signed((&wire3))))
        begin
          if ($signed(wire1))
            begin
              reg5 <= wire1;
              reg6 <= wire3[(4'h9):(1'h0)];
            end
          else
            begin
              reg5 <= (-((~|wire4[(4'h9):(3'h5)]) > wire0));
              reg6 <= wire2;
            end
        end
      else
        begin
          if ($signed(($signed($signed((wire3 > (8'hb9)))) ?
              {$signed((wire1 == wire4))} : (wire4 ?
                  wire4[(3'h7):(2'h3)] : wire1))))
            begin
              reg5 <= reg6;
              reg6 <= wire3;
            end
          else
            begin
              reg5 <= ((|(~|wire0[(2'h2):(1'h0)])) & ($signed(wire4) ?
                  wire2 : (!$signed(reg6[(3'h7):(3'h5)]))));
              reg6 <= ($signed($signed((8'hb5))) || $signed($unsigned(reg6[(5'h13):(4'ha)])));
              reg7 <= wire2[(4'h8):(4'h8)];
            end
          reg8 <= ($signed($unsigned({(wire0 | reg5),
              (wire3 ^ wire0)})) && ({$signed((reg7 ^ wire1))} ?
              $unsigned(wire2) : $unsigned((8'hb2))));
          reg9 <= (reg7[(3'h4):(2'h3)] <<< ((8'ha0) ?
              (~^reg7[(3'h4):(3'h4)]) : $signed(wire2)));
          reg10 <= (((reg8 ?
              {$unsigned(reg7),
                  (reg7 + (8'hbc))} : wire4[(3'h6):(1'h0)]) << (+$unsigned($unsigned(wire4)))) != $unsigned($unsigned((-reg9))));
        end
      reg11 <= reg8;
      reg12 <= ($signed(wire2[(3'h7):(3'h6)]) + {wire1[(2'h3):(1'h1)],
          reg9[(1'h0):(1'h0)]});
      reg13 <= reg11[(1'h1):(1'h0)];
    end
  assign wire14 = (~{$unsigned(wire1[(1'h0):(1'h0)])});
  always
    @(posedge clk) begin
      reg15 <= ($unsigned(reg13) ?
          wire3[(1'h0):(1'h0)] : (~^((+wire2[(4'hd):(3'h7)]) ?
              (&((8'hb4) + reg5)) : $unsigned((~^reg9)))));
      reg16 <= ($unsigned(((~^$unsigned(wire1)) ?
          ($unsigned(reg13) ? $signed((8'hbb)) : $signed(reg11)) : ((wire14 ?
              wire2 : reg6) << {wire3, wire0}))) & reg15[(4'h9):(1'h0)]);
      reg17 <= reg11;
      reg18 <= $signed(reg5[(3'h5):(2'h2)]);
    end
  assign wire19 = (-reg15[(3'h7):(3'h7)]);
  assign wire20 = (reg6 ?
                      {(~^$signed((&reg8))),
                          $unsigned($unsigned((~reg13)))} : ((wire2[(3'h5):(3'h4)] >= $unsigned(((8'hac) - reg11))) * (reg16 ?
                          reg15 : (8'hb1))));
  assign wire21 = $signed(wire0);
  assign wire22 = $signed({(&$unsigned((reg8 ? wire14 : wire2))),
                      {reg6, reg11[(2'h3):(2'h2)]}});
  assign wire23 = reg15[(3'h6):(1'h1)];
endmodule
