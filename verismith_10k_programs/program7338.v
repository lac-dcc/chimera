module top
#(parameter param21 = {{((~((8'hba) ? (8'hae) : (8'hbb))) ? (((7'h44) >= (8'ha4)) <<< ((8'ha0) + (8'hb3))) : ({(8'haa), (8'h9c)} ? ((8'h9f) <<< (8'hbb)) : ((8'ha7) ? (8'hae) : (7'h43))))}, (+((!{(8'hb4)}) ? (((7'h42) ? (8'hab) : (8'h9c)) ? (~|(8'hb7)) : ((7'h41) ? (8'ha5) : (8'hbc))) : {((7'h40) | (7'h44))}))}, 
parameter param22 = ((~|(((8'hab) <= {param21}) >>> param21)) >= ((+((-param21) ? (|param21) : (param21 ? param21 : param21))) ? (|((param21 ^~ param21) ? param21 : (param21 | param21))) : (param21 ? ((~^param21) != (param21 == param21)) : param21))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = wire1[(3'h7):(3'h7)];
  assign wire6 = (^(8'ha4));
  assign wire7 = $unsigned(wire4[(4'h8):(1'h0)]);
  assign wire8 = ((|(($signed((8'ha0)) ?
                             wire2[(2'h3):(2'h3)] : (wire2 && wire1)) ?
                         $unsigned($signed(wire0)) : wire5)) ?
                     $signed({wire6}) : wire2[(3'h4):(2'h3)]);
  assign wire9 = {(|{wire7}), ($unsigned(wire0[(4'ha):(3'h5)]) == wire4)};
  assign wire10 = ($signed(($unsigned($unsigned(wire9)) ?
                          ($signed(wire8) ?
                              (wire8 + wire5) : wire4[(4'h9):(3'h4)]) : wire0)) ?
                      wire4 : $signed($signed(($signed(wire1) ?
                          (wire6 == wire7) : {(8'hb3)}))));
  always
    @(posedge clk) begin
      reg11 <= ($unsigned((+((!wire10) ?
          (wire3 ?
              wire8 : wire9) : ((8'ha4) && wire4)))) << ((|$signed((|wire7))) - wire4[(3'h7):(1'h0)]));
      reg12 <= $signed((^(~&({wire10} - ((8'hba) && (8'hb0))))));
      reg13 <= reg12;
      reg14 <= (|(&{((wire7 ~^ wire0) != $signed(wire5)),
          {(wire2 <<< wire3), ((8'hbe) <= reg12)}}));
      reg15 <= reg14;
    end
  assign wire16 = wire0;
  assign wire17 = (&(^((-wire2) >> $unsigned((wire7 > wire2)))));
  assign wire18 = $signed((((&wire2[(1'h0):(1'h0)]) != $signed($unsigned((8'hb0)))) ?
                      wire7[(4'hc):(4'hc)] : wire3));
  assign wire19 = (^wire1);
  assign wire20 = (wire16[(2'h2):(1'h0)] || (!$signed((((7'h41) >> wire19) ?
                      reg13 : (reg11 ? wire17 : wire18)))));
endmodule
