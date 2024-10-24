module top
#(parameter param18 = {((({(8'ha2)} ? ((8'hb5) ? (8'hac) : (8'hb3)) : ((8'h9d) ? (8'hb7) : (7'h42))) != (~|{(8'hbd), (8'hbe)})) * (((^~(8'had)) == ((8'h9e) <<< (8'hac))) ? (((8'h9d) ? (8'h9d) : (8'hb8)) <= ((8'hb1) ^~ (8'ha4))) : (^~((8'hb8) - (8'h9d)))))}, 
parameter param19 = ((((~^(^param18)) ? (((8'hb7) + param18) ? (-param18) : (~&param18)) : (+param18)) | (&{(~^param18)})) ? ((^~{(param18 || param18), (param18 && param18)}) * ({param18} ? ((param18 ? param18 : param18) && {param18}) : ((7'h42) ? (param18 >>> param18) : ((8'hbc) + param18)))) : (param18 | (8'hbe))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire5 = $signed(wire3[(4'ha):(3'h5)]);
  assign wire6 = $signed($unsigned(wire0));
  assign wire7 = ({(~&wire5)} && (((wire4 >>> {wire0}) ?
                     (wire6[(4'ha):(1'h1)] ?
                         wire5 : (~|wire3)) : $unsigned(((8'hb3) ?
                         wire6 : wire5))) ^ (~^wire0)));
  assign wire8 = ({$signed(((wire1 >> wire5) ? wire3 : {wire5, wire0})),
                         wire4[(3'h6):(1'h0)]} ?
                     ((wire1 ~^ wire7) ?
                         wire6 : ((~wire1[(2'h3):(1'h0)]) ?
                             {wire0} : $unsigned({wire7}))) : (wire0[(2'h2):(2'h2)] < (((+wire0) >= $signed(wire2)) << ((wire7 + (8'hbf)) + (wire0 * wire2)))));
  assign wire9 = ((^wire1[(4'ha):(4'h9)]) ?
                     {$signed((8'hb0))} : ((8'hbe) ?
                         $signed({wire5}) : $unsigned(wire3[(2'h3):(1'h1)])));
  assign wire10 = (8'hbb);
  assign wire11 = $unsigned(((({wire4} * $unsigned(wire7)) && $unsigned($signed(wire4))) ~^ wire0[(3'h5):(3'h4)]));
  assign wire12 = {(($unsigned(wire3[(4'h9):(1'h0)]) ?
                              wire6[(3'h4):(2'h2)] : $signed({(7'h42),
                                  (8'haf)})) ?
                          wire1 : (($signed(wire3) | wire7[(2'h3):(1'h0)]) ?
                              wire3[(3'h4):(3'h4)] : $unsigned((~&wire10)))),
                      $signed($unsigned((wire10 & wire2)))};
  assign wire13 = (~&(wire10[(4'hd):(2'h3)] ? wire10 : wire2));
  always
    @(posedge clk) begin
      reg14 <= {(~&(-(+(wire7 != wire4)))), $unsigned((8'hac))};
      reg15 <= (({$signed(wire3)} ?
              $unsigned($unsigned($signed(wire2))) : (|(wire11 ?
                  (wire2 ? wire10 : wire11) : (~^wire6)))) ?
          wire7 : ($signed($unsigned(wire0[(2'h2):(1'h0)])) ?
              (wire12 || $unsigned((wire7 ?
                  wire10 : reg14))) : $unsigned((-{wire13}))));
      reg16 <= (^$signed((~|$signed(reg15))));
      reg17 <= $unsigned(((!$unsigned(wire3)) == (($unsigned(wire1) <<< (wire8 ?
          wire12 : wire4)) == wire13)));
    end
endmodule
