module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  assign y = {wire8, wire7, wire6, wire5, wire4, reg10, reg9, (1'h0)};
  assign wire4 = $unsigned($unsigned((~(~^(wire1 ? wire0 : wire0)))));
  assign wire5 = (^~((+(!(wire0 && wire4))) >>> wire3));
  assign wire6 = {((8'hbc) << ((wire5[(2'h2):(1'h1)] ?
                             $signed((8'hbb)) : (wire0 ? (7'h41) : wire3)) ?
                         (8'hb9) : wire3[(3'h7):(1'h0)]))};
  assign wire7 = $unsigned((-$signed($unsigned({(7'h42), wire5}))));
  assign wire8 = $signed(wire2[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg9 <= $signed((({(wire6 + wire0)} >>> ((+wire3) << (wire7 <= wire4))) ?
          (+(~^$unsigned(wire4))) : wire3[(3'h5):(2'h3)]));
      reg10 <= wire0;
    end
endmodule
