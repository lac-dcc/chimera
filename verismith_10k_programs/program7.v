module top
#(parameter param22 = {((7'h42) ? ((~((7'h43) >>> (8'ha0))) * ((~(8'hb0)) != {(8'h9e), (8'hbc)})) : (~&((~(8'hb8)) & (~|(8'ha6))))), ((~|{((8'hab) != (8'hb1)), (~(8'hab))}) ? ((((8'hb4) ? (8'hb9) : (7'h43)) ? ((8'hb0) >>> (8'ha4)) : (~|(8'hb2))) > ((~|(8'hbe)) ? ((8'hbf) ? (8'hab) : (8'hb7)) : ((8'hba) < (8'hb2)))) : (({(8'ha9), (8'hbc)} ^~ ((8'hbe) << (8'ha1))) || ((^(8'hba)) ? (+(8'hb6)) : ((8'ha3) - (8'ha5)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire12,
                 wire11,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg10,
                 (1'h0)};
  assign wire4 = $unsigned(wire2[(1'h0):(1'h0)]);
  assign wire5 = ($signed((8'ha9)) ?
                     ((((+wire1) ? {wire4, wire3} : wire0[(5'h10):(1'h1)]) ?
                             ((wire4 <<< wire4) ?
                                 (~|(8'hb2)) : (7'h42)) : {(~&wire1), wire4}) ?
                         $unsigned((8'ha6)) : $unsigned($unsigned((!wire1)))) : wire3);
  assign wire6 = $unsigned($unsigned((~wire3)));
  assign wire7 = (wire6 ?
                     {(~|(wire0[(1'h1):(1'h0)] ^ {wire3})),
                         ((wire5[(3'h4):(2'h2)] ? wire0 : $signed((7'h40))) ?
                             (wire5[(3'h4):(1'h0)] != $signed(wire4)) : $signed((~(8'hb1))))} : (wire4[(1'h0):(1'h0)] && (^~$unsigned($unsigned(wire1)))));
  assign wire8 = wire4[(1'h1):(1'h1)];
  assign wire9 = ($signed(wire1) ?
                     (~&wire8) : $unsigned(($signed((8'ha2)) ? wire5 : wire3)));
  always
    @(posedge clk) begin
      reg10 <= wire0[(4'h9):(1'h1)];
    end
  assign wire11 = (+($signed(wire7[(4'hf):(4'h9)]) ^ wire1[(2'h2):(1'h1)]));
  assign wire12 = reg10;
  always
    @(posedge clk) begin
      reg13 <= wire11[(3'h7):(3'h7)];
      reg14 <= wire0;
      reg15 <= (reg13 ?
          (wire0[(5'h11):(3'h7)] || (8'ha6)) : ((-wire5[(1'h0):(1'h0)]) <<< (^~$unsigned($signed(wire9)))));
      reg16 <= ((&{wire0}) ?
          (^($signed(wire8[(5'h11):(4'he)]) != (&(~&wire12)))) : wire2[(1'h0):(1'h0)]);
      reg17 <= ($signed(wire6) ^ wire6);
    end
  assign wire18 = ((^({wire11, (-reg10)} * (|$signed(wire1)))) ?
                      (^~$signed(wire2[(2'h2):(2'h2)])) : ((((wire4 ^ (8'hb7)) ?
                              (|reg17) : $unsigned(reg15)) ?
                          (8'ha1) : $signed(((8'hb6) ?
                              wire2 : wire9))) + wire7[(4'he):(3'h4)]));
  assign wire19 = (^~$unsigned(({$unsigned(reg10), (wire11 << wire3)} ?
                      ({reg15} <<< wire5) : (8'hb2))));
  assign wire20 = wire7;
  assign wire21 = {($signed(((wire4 <<< wire18) >> reg10)) ?
                          $unsigned($unsigned((wire8 != wire0))) : ($unsigned($unsigned((8'ha7))) ?
                              $signed($signed(wire4)) : $signed(reg13[(3'h5):(1'h0)])))};
endmodule
