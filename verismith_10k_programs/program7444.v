module top
#(parameter param28 = {((-(8'hbe)) & (({(8'ha1), (8'hac)} ? (^~(8'hab)) : ((8'ha7) << (8'h9c))) > {(~|(8'h9d)), ((8'h9f) << (8'hbb))})), {((~|((7'h43) || (8'hb4))) ? (^((8'hb7) ? (7'h43) : (8'ha4))) : (^~((8'hab) <<< (8'hab))))}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire15,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire4[(1'h0):(1'h0)]);
    end
  assign wire6 = ((^$unsigned(((wire1 ? reg5 : (8'ha3)) ?
                         (wire1 >>> wire1) : wire2))) ?
                     wire1[(3'h6):(3'h5)] : wire3);
  assign wire7 = $unsigned(wire6);
  assign wire8 = $signed($signed($unsigned((|wire4))));
  assign wire9 = (wire7 << wire7);
  always
    @(posedge clk) begin
      reg10 <= (((((wire7 ?
          wire4 : wire7) ^ $signed(wire0)) - (|((8'hbb) >= wire0))) ^~ (^~{(reg5 << (8'h9e)),
          (^reg5)})) | wire0[(3'h5):(3'h5)]);
      reg11 <= $signed(wire1);
      reg12 <= (^(((&(~wire7)) ^~ ((wire8 ?
          wire4 : reg10) != wire2)) <= wire1[(4'hd):(4'hb)]));
      reg13 <= $unsigned($signed((^({(8'ha0), reg11} < (reg5 >>> (8'hb8))))));
      reg14 <= wire0;
    end
  assign wire15 = wire6[(4'h8):(1'h1)];
  always
    @(posedge clk) begin
      reg16 <= (wire3 ?
          (((wire0 ? $unsigned((8'ha9)) : (~&wire1)) ?
                  (^$signed(wire7)) : ($unsigned(reg13) == (wire9 ?
                      wire0 : wire6))) ?
              (wire1[(4'ha):(4'ha)] ?
                  $signed(wire4) : (~^$unsigned(reg10))) : (!$signed(((8'hbd) && wire8)))) : $unsigned((-reg11[(4'h8):(3'h6)])));
      reg17 <= {{(~&(~&$signed(reg13))),
              (((wire1 | wire6) ?
                  (reg16 > wire2) : wire2[(1'h1):(1'h1)]) * (&(!(8'ha6))))},
          ($unsigned($unsigned((8'hb0))) || (8'hb2))};
      reg18 <= (((-{(+reg17)}) ?
          ((^~$unsigned(reg11)) ?
              $unsigned($signed((8'ha1))) : (~reg17[(4'hc):(3'h7)])) : {((8'hb9) ?
                  $unsigned(reg10) : ((8'ha0) ?
                      wire15 : reg5))}) > $signed(($unsigned((wire15 ?
          reg12 : reg12)) != wire9)));
      reg19 <= (8'hb8);
      reg20 <= (~$unsigned({wire8}));
    end
  assign wire21 = reg16;
  assign wire22 = {$unsigned(wire8),
                      $signed((((^reg19) * $unsigned(wire6)) <= wire3))};
  assign wire23 = $unsigned(((&{$signed(wire22)}) ^~ wire9[(3'h4):(3'h4)]));
  assign wire24 = $unsigned($unsigned(reg16));
  assign wire25 = $unsigned(wire7[(1'h1):(1'h1)]);
  assign wire26 = (wire2[(3'h5):(3'h5)] ^ ({wire15[(2'h2):(1'h1)],
                      $signed((reg11 ?
                          (8'h9e) : (8'hb9)))} & $unsigned(((reg17 + wire15) ?
                      $signed(wire24) : $signed(reg5)))));
  assign wire27 = ({{((8'ha6) & wire3)}} ?
                      ($signed((8'hb2)) ?
                          wire22 : (7'h40)) : (wire1 || {(reg13[(4'ha):(3'h5)] > (8'hb7))}));
endmodule
