module top
#(parameter param13 = (((~&((|(8'h9c)) ~^ (~(8'hb8)))) <<< {(((7'h40) ? (8'hac) : (8'hb9)) != ((8'ha9) ? (8'h9e) : (8'hac))), ({(8'hbf), (8'hb6)} >= ((8'ha1) ? (8'hb9) : (7'h41)))}) ? ((~^(~^((8'ha1) <<< (8'hbd)))) * ((^((8'ha2) ? (8'hb3) : (8'ha3))) ? (((8'ha2) ? (8'hbe) : (8'ha4)) >= (+(8'hb2))) : ((&(8'hb3)) ? ((8'hbe) > (8'ha4)) : ((8'hab) ? (8'hbd) : (8'haf))))) : {{{((8'hae) ? (8'hb8) : (8'hb6))}, (((8'haf) ? (8'had) : (8'hbd)) | (^(8'hba)))}, (!(((8'haa) ~^ (7'h42)) & ((8'ha2) ? (8'h9c) : (8'hb7))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire8, wire6, wire5, reg12, reg11, reg10, reg9, reg7, (1'h0)};
  assign wire5 = wire2;
  assign wire6 = ((^$unsigned((~&(^wire1)))) ?
                     {(wire5 ?
                             (-$unsigned(wire4)) : ((-wire5) ~^ wire5))} : wire5[(4'hb):(3'h4)]);
  always
    @(posedge clk) begin
      reg7 <= ((~^{(~&wire5[(4'he):(1'h0)]), (wire2 == wire2)}) ?
          (7'h44) : ($signed($unsigned($unsigned(wire1))) >> wire3[(1'h1):(1'h0)]));
    end
  assign wire8 = $unsigned(((($unsigned(wire4) ~^ {wire2}) >> (8'hb8)) ?
                     $unsigned({(wire4 ? wire3 : reg7),
                         $signed((8'hb6))}) : {{(^~reg7)}, $signed((8'ha1))}));
  always
    @(posedge clk) begin
      reg9 <= ((~|$unsigned(((wire2 ? wire2 : wire1) ?
              (wire8 ? wire8 : wire5) : (~wire2)))) ?
          (wire6 == wire6) : $unsigned(((&(wire0 ?
              wire0 : wire4)) != wire2[(1'h1):(1'h0)])));
      reg10 <= ($signed(wire6) ?
          reg7[(3'h6):(3'h6)] : $signed(((reg7 ?
              (8'hb7) : (+wire4)) || wire1[(1'h0):(1'h0)])));
      reg11 <= $signed(((wire5[(5'h10):(3'h5)] <<< wire2) + (~^{reg9})));
      reg12 <= (-(&wire8[(2'h3):(2'h3)]));
    end
endmodule
