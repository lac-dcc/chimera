module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire10, wire8, wire7, wire6, wire5, reg9, (1'h0)};
  assign wire5 = ($unsigned($unsigned((((8'ha4) ? wire2 : wire2) ?
                     (^~wire1) : wire2))) || (&$signed($signed((wire2 ?
                     (8'ha4) : wire1)))));
  assign wire6 = ($unsigned($unsigned(((wire3 ?
                     (8'hab) : wire4) || wire0))) >> wire4);
  assign wire7 = (((wire0 ?
                         $unsigned({wire3,
                             wire2}) : (wire3[(3'h5):(1'h1)] ~^ $signed(wire6))) ?
                     (7'h41) : ((!(wire0 >>> wire5)) ?
                         wire0 : (~^((8'hbb) ?
                             wire6 : (8'ha2))))) ^~ (^(($unsigned(wire3) ?
                     (+wire4) : (8'hbe)) > $signed({wire6}))));
  assign wire8 = $signed((|$signed(((wire4 << (8'haf)) ?
                     (wire7 ? wire2 : wire3) : wire7))));
  always
    @(posedge clk) begin
      reg9 <= ({wire8[(5'h11):(4'h9)],
              ($unsigned((wire8 ^ (8'ha2))) ?
                  $signed($signed(wire8)) : ($unsigned((8'hb8)) >> wire7[(3'h6):(3'h4)]))} ?
          $signed((wire4 - (!$signed(wire3)))) : ($signed((~&(wire0 - wire3))) << $signed((^wire3))));
    end
  assign wire10 = (~$signed(((^~(8'hbf)) ?
                      (!(wire6 ? (7'h42) : wire8)) : wire1)));
endmodule
