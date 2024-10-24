module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed($unsigned($unsigned($unsigned(wire1)))) ?
          (wire1[(2'h2):(1'h1)] ? {(-wire0)} : $signed((8'ha9))) : wire1);
      reg5 <= $unsigned((8'hb9));
      reg6 <= (($signed((~|(wire2 ? reg4 : (7'h41)))) ^~ reg4) ?
          wire1[(3'h4):(3'h4)] : (^~$signed(wire0)));
      reg7 <= reg4;
    end
  assign wire8 = ((8'ha1) - ((~&{$unsigned(wire0),
                     reg5[(2'h2):(1'h0)]}) * ($signed(reg7) ^ {(|wire2),
                     (wire0 ? reg4 : (8'hb3))})));
  assign wire9 = reg7;
  assign wire10 = {$signed($unsigned(reg6[(2'h2):(2'h2)]))};
  assign wire11 = (wire8 ?
                      $signed($unsigned($signed((reg7 ?
                          wire9 : (8'hbe))))) : ($signed($unsigned((+reg7))) ?
                          $unsigned(reg4) : $signed((~^(^reg5)))));
  assign wire12 = $signed($unsigned({((^~wire1) ^ {reg4})}));
endmodule
