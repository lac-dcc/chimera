module top
#(parameter param12 = ((({((8'hb7) | (8'h9d))} ? ((&(8'hb3)) | (-(8'hac))) : (7'h42)) ~^ ((8'haf) ? ((|(8'haa)) ? (8'had) : ((8'ha3) != (8'ha6))) : ((~|(8'had)) ? ((8'ha9) || (8'hab)) : ((8'ha6) ? (7'h40) : (8'ha2))))) ? (^~({((8'h9d) ^~ (8'hb7)), {(8'hb2)}} || (((8'haa) ? (8'hbb) : (8'hb6)) ^ (+(8'hb9))))) : {(((&(7'h41)) | (~|(8'ha4))) <= {((8'hb5) && (8'hab))}), {(&(~|(8'hbe))), (((8'hae) && (8'hbb)) << ((8'haf) <= (8'hb8)))}}), 
parameter param13 = (8'h9e))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire11, wire10, wire4, reg9, reg8, reg7, reg6, reg5, (1'h0)};
  assign wire4 = wire3;
  always
    @(posedge clk) begin
      reg5 <= wire4[(2'h3):(1'h1)];
      if ((8'haa))
        begin
          reg6 <= ((-(~^($signed(wire2) ? {wire1, reg5} : $unsigned(wire1)))) ?
              reg5 : (wire3[(3'h6):(2'h2)] + (-$signed(((8'hbb) << wire2)))));
        end
      else
        begin
          reg6 <= (7'h42);
          reg7 <= $unsigned((~&$unsigned($unsigned((~^wire2)))));
          reg8 <= (((~^wire3) ?
              ($signed($unsigned((7'h40))) ?
                  $unsigned(wire3[(3'h7):(3'h7)]) : $signed((^reg6))) : $unsigned({$signed(reg6),
                  $unsigned(wire2)})) ^ (&(~|wire3)));
        end
      reg9 <= wire1[(1'h0):(1'h0)];
    end
  assign wire10 = (wire0 ?
                      (($unsigned((~&reg6)) ?
                          $signed((-reg7)) : reg6[(1'h1):(1'h1)]) == $unsigned(((reg9 < reg8) - (wire4 ?
                          wire2 : wire4)))) : ($unsigned(wire2) ?
                          (&(|{reg9})) : ($unsigned(reg7) ?
                              $signed((reg8 ? reg9 : reg9)) : reg7)));
  assign wire11 = reg5[(2'h3):(2'h2)];
endmodule
