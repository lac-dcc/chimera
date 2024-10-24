module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire12, wire11, wire10, wire9, wire8, wire7, wire5, reg6, (1'h0)};
  assign wire5 = ($signed((((wire4 ? (8'hb3) : wire1) ?
                         (wire4 == wire3) : (&wire2)) ?
                     (~|wire4) : $unsigned(((8'hbd) >> wire1)))) > (wire1 ?
                     ($signed((wire1 ?
                         wire1 : (8'hac))) >> (8'hbd)) : $signed(((wire2 ?
                         wire4 : wire0) | (~|wire1)))));
  always
    @(posedge clk) begin
      reg6 <= wire4;
    end
  assign wire7 = ($unsigned($signed(reg6)) != (~&((wire1[(2'h2):(2'h2)] ^ (wire0 <<< reg6)) ?
                     {(wire4 ? wire1 : wire5)} : (^wire1[(1'h1):(1'h1)]))));
  assign wire8 = wire0[(1'h1):(1'h0)];
  assign wire9 = wire4;
  assign wire10 = ($signed($signed($unsigned((8'hb9)))) ?
                      $unsigned(wire4) : (8'hb1));
  assign wire11 = reg6[(3'h7):(1'h1)];
  assign wire12 = $unsigned($signed($signed((!(wire8 ? wire5 : wire7)))));
endmodule
