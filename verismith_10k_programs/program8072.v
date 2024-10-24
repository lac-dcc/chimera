module top
#(parameter param10 = (((((8'hb8) ? ((8'hab) ? (8'haa) : (7'h43)) : (^(8'hbf))) ? {(&(8'hbe)), ((8'hb6) ? (8'ha9) : (8'hbc))} : (((8'hb4) + (7'h44)) ^~ ((8'hbe) ? (8'haf) : (8'had)))) ? ((((8'ha7) ? (8'hb3) : (8'h9e)) ? ((8'hb6) ? (8'hb6) : (8'ha8)) : {(8'hb2)}) == (((8'hb1) ? (8'haf) : (8'hb1)) ? (~&(8'hba)) : ((8'hb0) - (8'h9d)))) : ((((8'hb5) * (8'hb3)) ? {(8'ha7), (8'hb0)} : ((8'hac) ? (8'had) : (8'ha1))) ? (((8'ha2) || (7'h44)) ? (8'ha9) : ((8'had) ? (7'h42) : (8'haf))) : (((8'ha2) ? (8'ha3) : (7'h40)) != (~|(8'ha8))))) ? ((&{((7'h42) && (8'ha8))}) ^ (~(^~((8'h9f) ? (8'ha5) : (8'ha5))))) : (!(((&(8'h9f)) ? (~|(8'hb7)) : ((8'haf) ? (8'haa) : (7'h41))) ? (-((8'h9f) | (8'ha0))) : (+{(8'ha2)})))), 
parameter param11 = ({param10, param10} ? ((~|{param10}) > (param10 ^ {(&param10), param10})) : param10))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire9, wire8, wire4, reg7, reg6, reg5, (1'h0)};
  assign wire4 = (~&$signed(wire3));
  always
    @(posedge clk) begin
      reg5 <= {(((&{(7'h41)}) ?
                  $signed((wire4 ?
                      wire3 : wire0)) : (wire2[(4'h8):(2'h3)] >>> $unsigned(wire3))) ?
              (wire1[(3'h7):(3'h6)] ?
                  $unsigned((wire2 ~^ wire0)) : $unsigned((wire2 == wire3))) : wire0[(4'h9):(3'h7)]),
          $signed((~&$signed((~&wire3))))};
      reg6 <= wire0[(3'h7):(3'h7)];
      reg7 <= $signed((((~^$signed(wire0)) ?
              $unsigned((wire0 ? reg5 : wire2)) : $signed(wire1)) ?
          wire3[(3'h7):(2'h3)] : wire1));
    end
  assign wire8 = $signed((({$signed(reg7)} >> ((wire2 ?
                         wire0 : wire4) + reg5)) ?
                     (wire0[(3'h6):(3'h6)] ?
                         $unsigned($unsigned(wire4)) : {(wire1 && (8'h9e)),
                             $unsigned(reg7)}) : (reg5[(3'h6):(2'h2)] <= reg5[(4'h8):(3'h6)])));
  assign wire9 = (($unsigned(((wire2 <= wire2) <<< wire3[(3'h5):(2'h2)])) >= (($signed(wire2) ?
                         $unsigned(wire1) : $unsigned(wire3)) ?
                     $signed(wire3) : $signed({(8'hac), reg6}))) + wire3);
endmodule
