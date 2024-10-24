module top
#(parameter param17 = (-((({(8'h9e), (8'hb0)} ? {(8'ha6)} : ((8'ha5) || (8'h9e))) > (8'hba)) == (&(7'h40)))), 
parameter param18 = (({{(param17 == param17), (param17 ? (8'ha8) : param17)}, (~param17)} * (((|param17) ? {param17} : param17) >= ((param17 ^~ param17) ? param17 : param17))) ? (^{((&param17) <= {param17})}) : {({(8'ha7), (param17 ^ param17)} ? param17 : (param17 ? (param17 ? param17 : param17) : (param17 ? (8'ha8) : param17)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire16,
                 wire15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
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
      reg4 <= $signed($unsigned($unsigned($unsigned(wire3[(4'h8):(3'h6)]))));
      reg5 <= ($signed((~|$unsigned((-wire0)))) ?
          wire3[(2'h2):(1'h0)] : (wire1[(4'hd):(1'h0)] ?
              (($signed((8'had)) && wire1) + wire3) : wire3[(3'h6):(3'h6)]));
      reg6 <= wire3;
      if ((~^(|(reg5[(4'hc):(4'ha)] <<< reg5[(5'h10):(4'he)]))))
        begin
          reg7 <= $unsigned((~reg5));
          reg8 <= (wire3 ?
              reg7[(3'h7):(1'h1)] : (^(((wire2 >= reg6) ?
                      $unsigned(wire0) : wire2[(3'h4):(2'h3)]) ?
                  $signed(reg4[(3'h4):(2'h2)]) : wire0[(1'h0):(1'h0)])));
          reg9 <= $signed($signed($signed(((wire2 ? wire1 : reg6) ?
              $unsigned(wire1) : $unsigned((8'h9c))))));
        end
      else
        begin
          reg7 <= (~&reg5[(1'h0):(1'h0)]);
        end
      reg10 <= wire0;
    end
  always
    @(posedge clk) begin
      reg11 <= $unsigned($signed((+((reg6 >= (8'ha6)) << wire2))));
      reg12 <= (+{$signed({(~|wire1)})});
      reg13 <= (~(8'hab));
      reg14 <= (+(wire2[(4'hb):(1'h1)] ? (8'hb4) : reg9[(3'h4):(1'h1)]));
    end
  assign wire15 = $unsigned((($signed(reg12[(4'hf):(4'hf)]) ?
                          (reg13[(1'h0):(1'h0)] << $unsigned(reg9)) : ($unsigned(reg14) | reg8)) ?
                      {reg7,
                          $signed({wire2,
                              wire2})} : $signed(($unsigned((8'had)) ?
                          ((8'h9e) ? reg10 : reg7) : reg10))));
  assign wire16 = reg11;
endmodule
