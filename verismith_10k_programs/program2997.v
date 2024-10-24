module top
#(parameter param12 = (~{(~&((8'ha9) ? (~(8'h9e)) : {(8'hb2), (8'hb2)}))}), 
parameter param13 = (-(~(-{((8'hbf) ^~ param12)}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire11, wire10, wire9, wire8, reg7, reg6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire1[(1'h0):(1'h0)];
      reg6 <= (($signed($signed((wire4 ? wire4 : (8'ha5)))) ?
              (^~$unsigned(wire1[(2'h3):(1'h1)])) : {wire2[(4'ha):(4'ha)]}) ?
          {(8'hae)} : $signed((~^wire4[(4'h8):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg7 <= wire0[(1'h1):(1'h1)];
    end
  assign wire8 = wire4;
  assign wire9 = (((^(8'ha3)) ?
                         (~(|{(8'had), wire0})) : (~&(^~(wire0 <<< wire2)))) ?
                     $unsigned({(reg6 && $unsigned(reg6))}) : ($unsigned(wire0) ?
                         wire3[(3'h6):(2'h3)] : reg7));
  assign wire10 = $unsigned({($signed((reg6 * wire2)) ?
                          ({wire0,
                              (8'haa)} > $signed(wire1)) : wire4[(3'h7):(3'h5)])});
  assign wire11 = ((wire9[(3'h4):(3'h4)] ?
                          (~&(^~$signed(wire9))) : $signed(wire0)) ?
                      reg5 : wire3[(1'h0):(1'h0)]);
endmodule
