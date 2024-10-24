module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire11, wire10, wire9, wire4, reg8, reg7, reg6, reg5, (1'h0)};
  assign wire4 = wire3[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg5 <= ({(wire4[(1'h0):(1'h0)] ?
                  ((&wire1) ^~ (8'hac)) : $signed((wire3 - wire3))),
              (wire2[(4'h9):(3'h4)] ?
                  wire1 : $signed((wire4 ? wire4 : wire4)))} ?
          wire2[(1'h1):(1'h1)] : (8'hb0));
      if ((8'ha3))
        begin
          reg6 <= {wire1[(4'ha):(4'h8)]};
          reg7 <= wire1;
        end
      else
        begin
          reg6 <= ({wire3[(4'hd):(2'h2)]} <= wire3);
        end
      reg8 <= ($unsigned(($signed($signed(wire2)) != (^~wire1))) ?
          $signed((7'h42)) : (~|(wire1 ?
              $signed((8'hae)) : ((wire2 ~^ (7'h40)) ?
                  $unsigned(reg6) : reg5))));
    end
  assign wire9 = ((((^~(wire2 ? wire0 : wire2)) > reg6) <<< ($signed((wire4 ?
                         wire1 : reg6)) ?
                     $unsigned((&reg6)) : {reg6[(3'h5):(3'h5)],
                         reg7[(4'hf):(4'hc)]})) | $unsigned($unsigned(wire0)));
  assign wire10 = (+($signed(wire0[(4'hb):(2'h2)]) ?
                      $unsigned({$signed((8'ha8))}) : (&$signed((reg5 ?
                          (8'ha6) : wire9)))));
  assign wire11 = $signed(reg7[(4'hf):(3'h7)]);
endmodule
