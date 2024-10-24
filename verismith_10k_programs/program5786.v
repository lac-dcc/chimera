module top
#(parameter param14 = {(|((7'h40) ? (((8'ha9) ? (8'ha9) : (8'ha1)) != ((8'hb4) != (8'haa))) : (((8'h9f) * (8'hb7)) && (|(8'hb2)))))}, 
parameter param15 = (param14 << {(~^(~(param14 != (7'h41)))), param14}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire4,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ((+(~^$signed(wire0))) >>> $signed({wire3[(1'h0):(1'h0)],
                     $unsigned(((8'hae) ? wire3 : wire1))}));
  always
    @(posedge clk) begin
      reg5 <= (+($unsigned(((~&wire0) == $unsigned(wire0))) & ($signed((wire3 ?
          wire0 : (8'hb6))) && {(8'hbd)})));
      reg6 <= (^~$signed(reg5));
      reg7 <= ($signed(reg5[(4'hb):(2'h2)]) >>> $signed($unsigned($signed((wire1 <= wire3)))));
      reg8 <= (~^$signed((8'hb3)));
    end
  assign wire9 = reg8;
  assign wire10 = wire3;
  assign wire11 = $unsigned(wire1);
  assign wire12 = ($unsigned({(8'hbc)}) + (~|{$unsigned((wire2 ?
                          wire1 : wire11)),
                      $signed(wire4[(4'hf):(4'hc)])}));
  assign wire13 = (wire10[(5'h10):(4'hc)] ?
                      $signed({wire2}) : {$signed($unsigned(wire4)),
                          (-(+((8'hb7) ? wire3 : reg6)))});
endmodule
