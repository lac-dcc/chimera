module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire11, wire10, wire9, wire5, reg8, reg7, reg6, (1'h0)};
  assign wire5 = ((^($signed(wire0[(4'h9):(2'h2)]) == {{wire0, wire1}})) ?
                     (~|wire1) : wire2[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg6 <= {wire3[(4'he):(3'h7)],
          (($signed((+wire2)) ? wire2[(3'h4):(2'h2)] : (8'hb5)) ?
              ($unsigned((wire4 ? (7'h42) : wire4)) ?
                  wire1[(1'h1):(1'h0)] : wire1[(4'ha):(3'h7)]) : (8'hb4))};
      if ($unsigned($signed($unsigned(wire3))))
        begin
          reg7 <= reg6;
          reg8 <= reg7[(4'hb):(3'h6)];
        end
      else
        begin
          reg7 <= (~^wire3[(4'h8):(3'h4)]);
        end
    end
  assign wire9 = ($unsigned($signed(($signed(wire2) ?
                         (reg7 ? reg8 : wire2) : (8'hb5)))) ?
                     (|(-((^~wire1) ?
                         {wire5} : (wire1 ? wire0 : reg7)))) : ((((|(7'h40)) ?
                             $unsigned(wire5) : (wire2 ?
                                 reg7 : reg8)) != ((wire5 ?
                             wire5 : reg6) >>> (wire0 ? wire5 : reg8))) ?
                         wire5[(2'h2):(2'h2)] : ($signed(wire2[(4'h8):(1'h1)]) & $signed({reg8,
                             wire0}))));
  assign wire10 = wire4[(1'h0):(1'h0)];
  assign wire11 = $signed(((^~$unsigned((reg6 != wire2))) < (~|(wire10 ?
                      wire9 : wire9))));
endmodule
