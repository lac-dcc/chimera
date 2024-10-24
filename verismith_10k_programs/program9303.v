module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire8,
                 wire4,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {{(wire2 ?
                             ($unsigned(wire3) >> (^wire1)) : $unsigned((8'hbf)))},
                     wire2};
  always
    @(posedge clk) begin
      reg5 <= (wire2[(2'h3):(2'h2)] >= ({wire2[(2'h3):(2'h3)],
          $signed(wire2[(2'h3):(2'h3)])} & (8'hac)));
      reg6 <= (+($unsigned(((wire3 << wire0) ?
              ((8'h9e) ? wire4 : reg5) : (8'h9c))) ?
          $unsigned((!((8'h9e) ^ wire4))) : $unsigned({$unsigned(wire0),
              (wire0 ? wire0 : reg5)})));
      if ($signed($signed((~|wire4[(4'he):(1'h0)]))))
        begin
          reg7 <= (8'h9d);
        end
      else
        begin
          reg7 <= $signed({((~^$unsigned((8'h9f))) - (reg7 ?
                  (8'hb5) : {wire3, (8'hac)})),
              ($unsigned(reg7) == reg5)});
        end
    end
  assign wire8 = ({{((+wire2) ? reg6[(3'h5):(3'h5)] : reg6)},
                     wire2[(4'hd):(3'h7)]} != wire2[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg9 <= $signed((reg6[(2'h3):(1'h0)] ?
          (((reg7 & wire4) ?
              $unsigned(wire8) : $unsigned(wire2)) || (7'h42)) : ({$signed(reg6),
                  $unsigned((8'haa))} ?
              (wire0[(3'h6):(1'h1)] ?
                  wire8 : ((8'hba) ?
                      reg6 : (7'h42))) : $unsigned(wire2[(4'hd):(3'h6)]))));
      if (wire2)
        begin
          reg10 <= wire3[(4'h9):(1'h1)];
          reg11 <= wire1;
        end
      else
        begin
          reg10 <= (wire3[(3'h7):(1'h0)] > wire3);
        end
    end
  assign wire12 = $unsigned({($signed((-wire3)) ?
                          (wire0 >>> wire3[(4'hc):(4'hc)]) : (~{wire3})),
                      wire8});
  assign wire13 = reg10;
  assign wire14 = ({{{(reg10 ? wire4 : reg9)}},
                      $signed({((8'ha2) ?
                              (8'haa) : reg11)})} ~^ wire0[(2'h2):(2'h2)]);
  assign wire15 = (((wire3 ^ $unsigned($signed(wire8))) ~^ wire0[(4'h9):(2'h3)]) ?
                      (!$unsigned({reg11[(3'h5):(1'h1)]})) : ((8'h9c) && ($signed((reg7 < wire12)) && {((8'had) ?
                              wire3 : wire12)})));
endmodule
