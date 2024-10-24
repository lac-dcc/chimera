module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg4 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire2[(2'h2):(1'h1)])
        begin
          if (wire3)
            begin
              reg4 <= (wire3[(2'h2):(2'h2)] ?
                  (~|wire0) : ($unsigned(wire2[(1'h1):(1'h0)]) ?
                      {wire3[(1'h1):(1'h0)],
                          $unsigned($unsigned(wire2))} : $signed(wire2)));
              reg5 <= {{$signed((~|(reg4 ? wire0 : wire3)))}};
            end
          else
            begin
              reg4 <= $signed({($unsigned(((8'haa) + wire3)) ?
                      {{(8'ha1), wire1}, (~wire1)} : $unsigned({reg5}))});
              reg5 <= (($unsigned(reg4[(1'h0):(1'h0)]) ?
                      reg4[(3'h7):(3'h6)] : {$unsigned(((8'hb4) ?
                              (8'hab) : wire1)),
                          wire0}) ?
                  $signed($signed({(~(8'ha3)),
                      (wire0 ? (8'ha6) : (8'hb6))})) : reg4[(3'h6):(3'h6)]);
              reg6 <= $signed($unsigned(((~wire1[(3'h6):(3'h6)]) ?
                  wire2 : $unsigned($unsigned((8'ha9))))));
              reg7 <= (wire1[(1'h1):(1'h1)] >> (($signed((~|reg6)) ?
                  reg4[(4'hd):(2'h3)] : $unsigned((wire2 < wire2))) >>> {wire3,
                  $unsigned({wire2})}));
            end
          reg8 <= wire1[(3'h5):(3'h5)];
          reg9 <= (wire2[(2'h2):(1'h1)] ?
              ($signed(reg8) ?
                  $signed(($signed((8'hb0)) && (!(8'hac)))) : (^($unsigned(reg4) ?
                      $signed(reg7) : (reg5 ^ reg8)))) : $unsigned($signed(reg8)));
        end
      else
        begin
          if ((~&$unsigned(wire3)))
            begin
              reg4 <= wire0[(2'h2):(1'h0)];
              reg5 <= (wire2[(1'h1):(1'h1)] >> $unsigned(reg9[(3'h5):(3'h5)]));
            end
          else
            begin
              reg4 <= ($signed(reg7[(1'h1):(1'h1)]) ?
                  reg7[(2'h2):(1'h1)] : wire1);
            end
          reg6 <= $unsigned($signed($signed((((7'h44) ?
              reg9 : reg8) > reg7[(1'h0):(1'h0)]))));
          reg7 <= ($signed(reg9) != $unsigned({wire3[(4'h9):(3'h7)], (^reg8)}));
        end
    end
  assign wire10 = {{$signed($unsigned(reg5))},
                      ((-wire2) ?
                          {(+(wire2 ?
                                  reg6 : wire0))} : $unsigned(reg5[(2'h3):(2'h3)]))};
  assign wire11 = (~reg6);
  assign wire12 = $unsigned(wire1[(3'h4):(1'h1)]);
  assign wire13 = $signed($signed(reg7));
  assign wire14 = reg7;
  assign wire15 = $signed({(^(8'ha4))});
  assign wire16 = (&reg8);
  assign wire17 = ($unsigned($signed((wire14 ? wire0 : {wire15}))) - wire11);
endmodule
