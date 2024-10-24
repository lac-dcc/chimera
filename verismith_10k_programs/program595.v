module top
#(parameter param12 = (&((~&(((8'hb7) ^ (8'ha1)) + ((8'h9d) ? (8'hbf) : (8'hb9)))) == (((|(8'hb5)) || (~(8'haa))) << (((8'hb9) ? (8'hb7) : (7'h40)) ? ((8'ha1) != (8'ha6)) : ((8'h9e) * (8'hb5)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire7;
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire11, wire10, wire7, reg9, reg8, reg6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($signed($unsigned((wire1[(1'h0):(1'h0)] ?
          $unsigned(wire1) : $unsigned(wire2)))) < ((~&wire1) * wire0[(3'h4):(3'h4)]));
      reg6 <= ($signed(wire3) ?
          wire2[(5'h10):(4'he)] : (+wire3[(4'hd):(2'h3)]));
    end
  assign wire7 = $unsigned({({wire4} >> $unsigned(reg6[(2'h3):(2'h2)]))});
  always
    @(posedge clk) begin
      reg8 <= (({(^$unsigned(wire1)), ((8'haa) && (&(8'hb1)))} ?
          ($unsigned(wire1) ?
              wire2 : reg6[(4'h8):(3'h7)]) : reg5[(4'h8):(3'h4)]) <<< reg5[(3'h6):(3'h6)]);
      reg9 <= $signed((~&(8'hbb)));
    end
  assign wire10 = (reg5[(5'h15):(4'ha)] ?
                      $signed((~$signed(wire4[(1'h1):(1'h1)]))) : $unsigned(reg8));
  assign wire11 = wire3[(4'hc):(4'hc)];
endmodule
