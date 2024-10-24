module top
#(parameter param10 = (((-((8'hbb) && (~(8'h9f)))) ^~ (8'ha4)) ? ((|((~(8'ha7)) ? ((8'h9e) ? (7'h42) : (8'hb8)) : ((8'hb8) <= (8'hac)))) || ({((8'ha6) || (8'hba))} ? {((8'h9f) != (8'hba))} : ((~(8'hb7)) && (~(8'hb5))))) : (^(^(~&(~^(8'haa)))))), 
parameter param11 = {((8'hab) ? ({(~&param10), (^~(8'haf))} != ((^~param10) < (~param10))) : param10)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire9, wire8, wire7, wire5, wire4, reg6, (1'h0)};
  assign wire4 = wire3;
  assign wire5 = {wire3};
  always
    @(posedge clk) begin
      reg6 <= (((8'ha1) ^~ {wire4[(3'h6):(1'h0)],
              ((wire3 ? (8'hbb) : wire4) ?
                  (wire0 ? wire1 : (8'h9f)) : $signed(wire1))}) ?
          wire3[(4'ha):(1'h0)] : ((8'hb0) >>> $signed($signed($unsigned(wire1)))));
    end
  assign wire7 = ($signed((~$unsigned(wire5[(3'h4):(2'h3)]))) ?
                     ((wire0[(4'hb):(3'h4)] ?
                             (wire4 ?
                                 (wire1 ?
                                     (8'hb1) : (8'had)) : wire1) : (~$signed(wire0))) ?
                         wire2 : $unsigned((wire0 ?
                             ((8'hb5) && wire5) : {wire2}))) : ($signed($signed($unsigned(wire2))) | ((~&wire2) << wire2)));
  assign wire8 = ((-wire7) >= wire4[(4'hc):(4'ha)]);
  assign wire9 = (((wire0 ? $signed((wire2 < wire1)) : wire5) ?
                         $signed(((+wire7) >= $unsigned(wire2))) : ($signed(wire4) != ($unsigned(wire2) ?
                             wire3 : {wire8}))) ?
                     (wire7[(1'h0):(1'h0)] - wire0[(4'hb):(1'h0)]) : reg6[(3'h7):(2'h2)]);
endmodule
