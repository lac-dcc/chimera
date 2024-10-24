module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  assign y = {wire10, wire8, wire7, wire6, wire5, reg9, (1'h0)};
  assign wire5 = $signed($unsigned({(^~$unsigned((8'ha1))),
                     wire3[(4'h8):(3'h4)]}));
  assign wire6 = ($signed(wire0) ?
                     (&($unsigned($unsigned(wire0)) ^~ (+wire0[(4'hb):(2'h3)]))) : (~^((~|(!wire5)) ?
                         (wire2 ?
                             wire3[(5'h10):(2'h3)] : $signed(wire1)) : $unsigned(wire3[(3'h5):(3'h5)]))));
  assign wire7 = wire5[(3'h4):(1'h1)];
  assign wire8 = ($unsigned((~&$signed($signed((8'hbe))))) << (($signed($unsigned(wire1)) | $signed(wire6)) ?
                     $signed((~^$unsigned(wire2))) : $signed((~&(8'hbe)))));
  always
    @(posedge clk) begin
      reg9 <= ($unsigned($unsigned($unsigned(wire6[(4'h9):(3'h5)]))) ?
          wire4 : $unsigned(wire1[(3'h5):(2'h3)]));
    end
  assign wire10 = wire0[(4'hb):(1'h0)];
endmodule
