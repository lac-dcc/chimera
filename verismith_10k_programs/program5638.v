module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire11, wire10, wire9, wire5, wire4, reg8, reg7, reg6, (1'h0)};
  assign wire4 = (~^$unsigned((wire0 ?
                     (~|$unsigned(wire2)) : ((~(8'hba)) ?
                         wire3[(1'h0):(1'h0)] : $unsigned((8'hb6))))));
  assign wire5 = (wire3 ? (!$signed($signed(wire1))) : (8'hb4));
  always
    @(posedge clk) begin
      reg6 <= wire3[(1'h1):(1'h0)];
      reg7 <= wire2[(3'h5):(2'h2)];
      reg8 <= wire1;
    end
  assign wire9 = (8'haa);
  assign wire10 = ((wire9 && (((reg8 ? (8'hb7) : wire0) ?
                          (~&reg6) : $signed(reg7)) ?
                      (wire5 ?
                          {(7'h44),
                              wire2} : $signed(wire9)) : (~^$signed(wire4)))) & $signed((reg8 ?
                      {(|wire5)} : reg7[(3'h6):(1'h0)])));
  assign wire11 = $signed(((wire3[(1'h0):(1'h0)] ?
                      $unsigned((wire1 ? (8'ha8) : wire5)) : ($signed((8'h9c)) ?
                          wire4 : (~^wire10))) != ((-(wire9 ^ wire3)) && wire9)));
endmodule
