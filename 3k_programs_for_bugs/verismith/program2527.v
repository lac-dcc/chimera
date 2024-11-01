module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire5,
                 wire4,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire1[(2'h3):(1'h1)];
  assign wire5 = $unsigned(((+$unsigned(wire2)) ?
                     wire3[(3'h5):(3'h4)] : (8'hba)));
  always
    @(posedge clk) begin
      if ($signed($unsigned($unsigned(((wire1 ? (8'haa) : wire1) ?
          wire0 : wire0)))))
        begin
          if ((wire1[(1'h1):(1'h0)] | ($signed(wire0) ?
              (wire5 ?
                  wire0[(4'hf):(4'hf)] : $unsigned(wire1[(1'h1):(1'h0)])) : wire2)))
            begin
              reg6 <= wire4;
              reg7 <= ({(((~^wire4) + ((8'haa) ? wire3 : wire3)) * wire2)} ?
                  wire1[(1'h0):(1'h0)] : wire1);
              reg8 <= wire4;
              reg9 <= $unsigned((8'ha1));
            end
          else
            begin
              reg6 <= (+$unsigned($signed(({reg9, wire0} ?
                  (wire2 ? reg8 : reg8) : (reg9 ? wire1 : wire5)))));
              reg7 <= ($signed(wire4) == (wire1[(2'h3):(2'h3)] ?
                  $signed(($signed((8'hb5)) == reg8[(2'h2):(1'h1)])) : {(^$unsigned(wire2))}));
            end
          reg10 <= ($signed($signed((^(^(8'hbc))))) * reg6);
        end
      else
        begin
          reg6 <= (&((((&(7'h40)) ? wire4 : $signed(wire4)) ?
                  $signed($signed(wire3)) : (reg10[(4'ha):(1'h1)] ^~ (reg7 ?
                      reg10 : reg6))) ?
              {((wire3 ? wire4 : reg8) ?
                      $unsigned((8'ha7)) : ((8'ha5) ? (8'hb7) : wire4)),
                  $unsigned((wire0 ?
                      wire4 : reg10))} : $unsigned(wire1[(2'h3):(2'h3)])));
          reg7 <= $unsigned({(~reg10)});
          reg8 <= (((wire0[(3'h7):(2'h2)] ?
                  wire2 : (~&((8'ha4) ? (8'hb6) : reg9))) ?
              (^~$unsigned($signed(wire0))) : reg7) > reg8[(4'h9):(1'h1)]);
          reg9 <= wire4;
          reg10 <= (~reg7[(1'h0):(1'h0)]);
        end
    end
  assign wire11 = wire5;
  assign wire12 = wire1[(2'h2):(1'h1)];
  assign wire13 = ($unsigned((|((wire5 > wire0) - {reg7}))) ?
                      (($unsigned({wire2}) ~^ wire0) ^ (~(((8'hb5) ^ (7'h43)) >= (reg10 < reg8)))) : $signed(reg8[(1'h1):(1'h1)]));
  assign wire14 = ($signed(reg6[(1'h1):(1'h0)]) ?
                      (reg10[(4'ha):(3'h7)] - $signed($unsigned((&wire5)))) : wire1[(1'h0):(1'h0)]);
  assign wire15 = (&reg8);
endmodule
