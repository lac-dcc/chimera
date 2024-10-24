module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire4,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (^~($unsigned((-wire3)) || (wire3[(4'hb):(3'h4)] ?
                     wire3 : wire1[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      if (wire3[(4'ha):(4'ha)])
        begin
          reg5 <= ($unsigned($unsigned((wire1 || $signed(wire0)))) ?
              wire0 : $unsigned(({(-wire4), $signed((7'h40))} ?
                  (~|(wire2 << wire4)) : wire2)));
          if (({wire1} ?
              (($unsigned(((8'hba) ? (8'hb0) : wire2)) ?
                      $unsigned((reg5 ? wire2 : wire2)) : reg5[(2'h2):(1'h1)]) ?
                  wire1 : $signed(wire4[(5'h13):(1'h1)])) : wire0[(4'hd):(2'h3)]))
            begin
              reg6 <= $unsigned({wire2[(3'h6):(3'h6)], reg5});
              reg7 <= (($signed((wire2[(3'h6):(3'h6)] & {reg5})) ?
                  wire3[(2'h2):(1'h0)] : $signed((|(reg5 >>> (8'h9c))))) << reg6);
              reg8 <= reg7[(3'h6):(2'h3)];
              reg9 <= $signed($signed(reg7));
            end
          else
            begin
              reg6 <= (~(^wire3[(4'hb):(4'h9)]));
              reg7 <= ({(+(~^{reg5}))} ^ (-reg7[(3'h4):(2'h2)]));
              reg8 <= reg7;
              reg9 <= $unsigned(reg7[(2'h2):(1'h0)]);
              reg10 <= $signed($unsigned(({(reg5 ? reg7 : (8'hae))} ?
                  {reg5, (8'ha8)} : (^~(wire2 && reg8)))));
            end
        end
      else
        begin
          reg5 <= reg10[(1'h0):(1'h0)];
          if ((reg8[(1'h0):(1'h0)] != (+reg7[(5'h10):(4'ha)])))
            begin
              reg6 <= reg8;
              reg7 <= (($unsigned((((8'hb5) && reg6) ?
                  (&wire0) : wire4[(4'hc):(1'h1)])) <<< (!((+wire2) ?
                  reg5[(1'h1):(1'h1)] : wire3[(4'ha):(3'h7)]))) + ((reg9 != (-reg6[(3'h7):(3'h7)])) ?
                  $signed({(^~wire4),
                      (reg8 ?
                          wire2 : wire1)}) : ({(reg10 > (8'ha5))} ~^ reg9[(3'h7):(3'h6)])));
              reg8 <= $unsigned($signed((~|($signed(wire2) != (~wire1)))));
              reg9 <= $unsigned($signed($unsigned($unsigned($signed(reg6)))));
            end
          else
            begin
              reg6 <= $unsigned($unsigned($signed((~&wire4[(5'h10):(2'h3)]))));
            end
        end
      reg11 <= reg5[(1'h1):(1'h1)];
      reg12 <= wire0[(2'h2):(2'h2)];
    end
  assign wire13 = wire3;
  assign wire14 = (|{($unsigned(((8'hbe) ? wire2 : reg9)) > (((8'hab) ?
                              (8'hbb) : reg8) ?
                          $signed(reg11) : $signed(wire4)))});
  assign wire15 = {{wire1[(3'h6):(2'h3)]}};
  assign wire16 = {($signed(($unsigned((8'hb6)) ^~ $signed((7'h40)))) ^~ $signed($unsigned($unsigned(reg10)))),
                      (^{(8'h9d), (8'hb0)})};
  always
    @(posedge clk) begin
      reg17 <= (8'hbf);
      reg18 <= (wire1 ?
          (wire4 ?
              wire2 : $unsigned((wire3 ?
                  (&(8'hb7)) : (~wire13)))) : (reg8 || (~(~^$unsigned(reg17)))));
      reg19 <= $signed($unsigned($signed(reg11[(1'h1):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg20 <= reg8[(2'h3):(2'h2)];
    end
endmodule
