module top
#(parameter param16 = {(8'ha5), ((~|({(7'h44), (8'hab)} ? (8'ha3) : {(8'had), (8'had)})) || (-((!(8'hb1)) ? ((8'hbc) ? (8'h9d) : (8'ha5)) : {(8'had)})))}, 
parameter param17 = {{param16}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~(((wire2[(2'h3):(2'h2)] ?
              (wire3 >> (8'haf)) : $signed(wire1)) << wire3[(4'hb):(2'h2)]) ?
          (8'haa) : (|($signed(wire2) ? (-wire1) : $unsigned(wire1)))));
      reg5 <= $unsigned($unsigned(wire0));
      reg6 <= wire2;
    end
  assign wire7 = $unsigned((!$signed(((|reg6) ? (~^wire3) : $unsigned(reg4)))));
  assign wire8 = (&$signed($unsigned(reg4[(4'h9):(3'h7)])));
  assign wire9 = reg6[(3'h7):(3'h7)];
  assign wire10 = (-((+$unsigned((-reg4))) * $unsigned(reg5[(3'h7):(1'h0)])));
  assign wire11 = (!reg6);
  assign wire12 = ((^~$unsigned((reg5[(3'h6):(1'h0)] ?
                      wire0 : wire9))) * wire1[(2'h3):(2'h2)]);
  assign wire13 = wire7[(1'h1):(1'h1)];
  assign wire14 = (($signed(((wire8 + wire2) ?
                      (8'hbf) : $signed(wire1))) << ((wire10 * ((8'ha2) <= reg5)) ^~ {{reg4,
                          wire8}})) && $signed(wire1));
  assign wire15 = reg4;
endmodule
