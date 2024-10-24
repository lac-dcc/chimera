module top
#(parameter param21 = (((^(((8'hb7) + (8'ha7)) ? {(7'h41), (8'ha9)} : (8'ha2))) ? (|((+(8'hb3)) ? ((8'hba) - (8'h9d)) : {(8'hb2), (8'hbe)})) : (^~((~|(7'h43)) ? (&(8'hbd)) : ((8'hbf) > (8'hab))))) >> (&(~|(8'ha5)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire15,
                 wire14,
                 wire13,
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
                 (1'h0)};
  assign wire5 = $signed((!(((wire0 ? wire2 : wire4) ?
                         (+wire1) : $unsigned(wire2)) ?
                     (wire1[(2'h2):(1'h0)] > wire3) : $signed((~|wire3)))));
  assign wire6 = $unsigned($unsigned($unsigned((+(wire2 ? wire1 : wire1)))));
  assign wire7 = ({(&wire1),
                     (!$signed(wire3[(1'h0):(1'h0)]))} ^ $unsigned((!(|(wire0 <<< wire6)))));
  assign wire8 = (~wire3);
  assign wire9 = (wire4[(1'h1):(1'h1)] & wire6);
  assign wire10 = ($unsigned((8'had)) ?
                      $signed(wire6) : $signed(((~^(wire6 <= wire1)) ?
                          {(wire6 ? wire0 : wire9)} : ((wire0 ?
                                  (7'h40) : wire4) ?
                              wire6 : $signed(wire7)))));
  assign wire11 = $unsigned($unsigned((wire0 ?
                      ({(8'hba), wire5} ? (!(8'h9f)) : wire2) : ((~|wire2) ?
                          $unsigned(wire7) : $signed(wire9)))));
  assign wire12 = (wire11[(3'h6):(1'h0)] | $signed((!$unsigned(((8'h9d) ?
                      wire5 : wire9)))));
  assign wire13 = (~{wire12});
  assign wire14 = (^wire12[(1'h1):(1'h1)]);
  assign wire15 = wire8[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg16 <= (+$signed($unsigned($signed(wire14[(3'h5):(3'h5)]))));
      reg17 <= wire9[(3'h5):(1'h1)];
    end
  assign wire18 = ($signed(({$unsigned(wire9)} ?
                      (wire12 <= wire3) : $signed($unsigned(reg16)))) << ((~^{$signed((8'hbb)),
                          $signed((8'hbe))}) ?
                      wire14[(4'hf):(4'he)] : (8'ha0)));
  assign wire19 = ({$unsigned({wire3[(2'h2):(1'h0)],
                          $signed(wire12)})} || wire12);
  assign wire20 = ((|wire11[(2'h2):(1'h0)]) ?
                      $signed($unsigned(wire0)) : (!$signed((wire2[(3'h7):(3'h7)] ?
                          (wire10 ? wire12 : (8'ha3)) : (wire7 ?
                              wire3 : wire18)))));
endmodule
