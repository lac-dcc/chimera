module top
#(parameter param12 = ((!(^((+(8'hb3)) ? ((8'hb8) >= (8'ha9)) : (-(7'h40))))) ? {({{(8'hbb)}, ((8'had) ^~ (8'ha7))} <<< (8'h9d)), ((((8'hbc) ? (8'ha0) : (8'ha0)) ? ((8'hb4) ? (8'ha4) : (7'h40)) : ((8'haf) - (8'hb4))) ? (((8'hb2) ? (8'h9d) : (8'ha5)) > (~(8'ha5))) : (((8'hbf) ? (8'hbf) : (8'hb9)) ? ((8'hba) ? (8'hb6) : (8'hb9)) : {(8'hb4)}))} : ((((|(7'h42)) <= ((8'hb0) < (8'ha2))) ? ((~(8'hac)) ? ((8'haa) ? (8'hbf) : (7'h41)) : ((8'hb4) ^ (8'hb4))) : ({(7'h44), (8'hb9)} <= (^~(8'had)))) ? ((((7'h43) < (8'ha7)) ? ((8'h9f) ? (8'ha5) : (8'ha6)) : (~|(8'ha9))) <= (((8'hbe) ? (8'h9e) : (8'hab)) | (!(8'hb7)))) : (-(^~(-(8'hbf)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire11, wire9, wire8, wire7, wire6, wire5, wire4, reg10, (1'h0)};
  assign wire4 = wire3;
  assign wire5 = (8'hbd);
  assign wire6 = wire5;
  assign wire7 = ($unsigned(($signed((~^wire2)) == wire6[(4'hc):(3'h7)])) >> wire1[(3'h5):(3'h4)]);
  assign wire8 = (($unsigned((wire7[(4'h9):(3'h7)] ?
                     $unsigned(wire6) : wire0)) + $signed(wire6[(4'hf):(4'hc)])) - (^$signed((wire4[(5'h13):(5'h10)] ^ (~|(7'h43))))));
  assign wire9 = (wire1 && (|$signed($unsigned((wire5 >> wire2)))));
  always
    @(posedge clk) begin
      reg10 <= $unsigned(wire2[(3'h7):(3'h4)]);
    end
  assign wire11 = ($signed($unsigned(wire6[(1'h1):(1'h0)])) ^ $signed(wire3));
endmodule
