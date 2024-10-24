module top
#(parameter param17 = {(-{(((8'hb1) + (8'hac)) <= (&(8'hab)))})}, 
parameter param18 = (-((&{{param17, param17}}) ? ((^(param17 ? param17 : param17)) ? param17 : ((param17 ^ param17) | (8'ha9))) : param17)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 reg15,
                 reg14,
                 reg13,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire1[(2'h3):(2'h2)]);
      reg6 <= (($unsigned({(wire4 ? reg5 : wire0)}) & $unsigned($signed((wire3 ?
              wire0 : reg5)))) ?
          $signed(($signed({reg5,
              wire3}) == wire2)) : $unsigned($unsigned({$unsigned(wire1)})));
      reg7 <= wire1;
    end
  assign wire8 = ({wire2, $unsigned(wire2[(2'h2):(2'h2)])} <= (~&reg5));
  assign wire9 = {wire2,
                     (wire1[(3'h4):(2'h3)] ?
                         (reg7 != {(reg5 ?
                                 wire3 : (7'h44))}) : wire0[(4'h8):(2'h3)])};
  assign wire10 = wire0;
  assign wire11 = $unsigned((^~$unsigned($signed((wire0 ? reg6 : wire9)))));
  assign wire12 = $signed(((|(-(~&wire1))) && {$unsigned(((7'h42) + wire2)),
                      $unsigned((wire2 ? (8'h9c) : reg7))}));
  always
    @(posedge clk) begin
      if (wire8)
        begin
          reg13 <= (~^(~wire3[(1'h0):(1'h0)]));
          reg14 <= wire10;
          reg15 <= {((!wire1) & wire1)};
        end
      else
        begin
          reg13 <= wire4;
        end
    end
  assign wire16 = (^$unsigned($unsigned(($signed(reg15) ?
                      (wire12 ? reg6 : wire2) : reg14))));
endmodule
