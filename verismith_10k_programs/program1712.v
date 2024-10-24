module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(3'h7):(1'h0)] reg4 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire0))
        begin
          reg4 <= wire1[(4'h8):(3'h5)];
          if ($unsigned($signed($unsigned((wire3[(2'h3):(2'h2)] <<< (reg4 ?
              (8'hb1) : wire3))))))
            begin
              reg5 <= $unsigned($unsigned($signed((((8'hb1) ^ wire0) && (wire1 ?
                  wire1 : wire3)))));
              reg6 <= $unsigned($unsigned(wire2[(1'h1):(1'h0)]));
              reg7 <= ($signed((wire0[(1'h0):(1'h0)] ?
                  (8'hab) : wire3)) << wire3);
              reg8 <= $unsigned((((reg4 ?
                      reg6[(3'h4):(2'h3)] : wire2[(1'h1):(1'h1)]) ?
                  $signed(reg4[(1'h1):(1'h0)]) : $unsigned({wire2})) >= ((wire3 << $signed(reg5)) ?
                  wire3[(3'h5):(2'h3)] : (^~wire2))));
            end
          else
            begin
              reg5 <= (reg5[(4'hc):(3'h4)] <= wire0[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          if (((^~$unsigned({$signed((8'haf))})) ?
              ($unsigned($signed((wire0 ^ wire1))) ?
                  (wire2[(2'h2):(1'h0)] ?
                      $unsigned((|reg6)) : reg7[(3'h7):(3'h5)]) : (|$signed($unsigned(reg5)))) : $unsigned($unsigned($unsigned(reg8[(4'h9):(4'h8)])))))
            begin
              reg4 <= (reg7 ?
                  {$unsigned($unsigned($unsigned((8'hbb)))), reg7} : ((reg6 ?
                      wire0 : (reg7[(4'hb):(3'h6)] ?
                          ((8'h9d) ? reg6 : reg8) : (~^(8'ha1)))) ~^ ({{wire0},
                          (wire1 << wire2)} ?
                      $signed((~^reg7)) : $unsigned($signed((8'haa))))));
              reg5 <= wire3[(3'h4):(1'h1)];
              reg6 <= ($unsigned((reg8[(4'hd):(1'h0)] ?
                  $signed($signed(wire2)) : {(^reg8),
                      reg8[(4'ha):(2'h3)]})) << wire0);
              reg7 <= $unsigned({(({(8'ha8)} ?
                      reg7 : {wire0,
                          (8'hba)}) >>> (wire3[(2'h2):(1'h0)] ~^ reg6[(1'h1):(1'h1)])),
                  wire1});
            end
          else
            begin
              reg4 <= ((reg4 <<< (+$signed($signed(reg8)))) ?
                  $signed({reg5, $unsigned(reg5[(5'h12):(3'h4)])}) : wire1);
              reg5 <= wire3;
              reg6 <= reg6;
              reg7 <= (reg5 ?
                  $signed({{(8'haf), $signed(reg6)},
                      (reg8[(2'h2):(1'h0)] | $unsigned(wire1))}) : (~&wire2));
              reg8 <= $signed($unsigned(reg7[(3'h6):(3'h4)]));
            end
          reg9 <= (+$unsigned(((reg4[(1'h1):(1'h0)] <<< (+reg6)) << $signed((7'h41)))));
        end
      reg10 <= (wire2 ?
          $unsigned(((|reg9) ?
              {wire3,
                  $unsigned((8'hb3))} : reg9)) : (-$unsigned((wire0[(1'h1):(1'h1)] * $signed(wire1)))));
    end
  assign wire11 = $unsigned(wire0);
  assign wire12 = $signed(($signed($signed(wire3)) ~^ {reg9,
                      {((8'hb8) >>> reg7), $unsigned((8'hb9))}}));
  assign wire13 = reg10;
  assign wire14 = {wire2,
                      ($signed((wire3[(2'h2):(1'h1)] ?
                              (reg9 > wire2) : $signed(reg5))) ?
                          reg5 : (reg5[(5'h10):(2'h3)] ~^ (wire12[(3'h7):(3'h5)] | reg7[(3'h7):(3'h7)])))};
endmodule
