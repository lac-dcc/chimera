module top
#(parameter param31 = (((-(((8'ha0) != (7'h40)) >>> (+(7'h44)))) <= (+{{(8'hbf), (8'ha1)}})) ? ({(((8'haa) ~^ (8'hb1)) ? ((8'hac) >>> (8'hb7)) : ((8'h9f) && (7'h42))), {(-(8'hac))}} ? {(((8'hb9) - (8'hb1)) < (&(8'hbb))), (((8'ha4) - (7'h43)) > ((8'hb6) ? (8'ha2) : (8'ha0)))} : (~|({(8'ha3)} <<< ((8'h9e) ? (8'h9d) : (8'ha1))))) : ((((~&(8'hb4)) | ((8'ha5) ? (7'h42) : (8'ha0))) == (~^((8'hbe) ^~ (7'h44)))) ? (((~^(7'h40)) & ((8'hb4) ? (8'hbd) : (8'hb0))) << ((|(8'ha1)) ? ((8'ha4) ? (7'h42) : (8'hac)) : {(8'ha8)})) : (8'hb2))), 
parameter param32 = (^(param31 <<< param31)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire24,
                 wire22,
                 wire5,
                 reg30,
                 reg25,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2;
    end
  assign wire5 = wire3;
  module6 #() modinst23 (.wire10(wire5), .y(wire22), .wire8(wire0), .wire7(wire1), .wire9(wire2), .clk(clk));
  assign wire24 = $unsigned(wire2);
  always
    @(posedge clk) begin
      reg25 <= ({wire22[(3'h6):(3'h5)]} < $unsigned(wire0[(4'h8):(3'h6)]));
    end
  assign wire26 = $signed((^~$signed($unsigned((wire24 ? wire0 : wire1)))));
  assign wire27 = $unsigned(((wire22 >= (~(reg25 ? reg25 : wire5))) ?
                      $unsigned(((reg25 != (7'h42)) ?
                          wire1 : {wire5,
                              wire2})) : ($signed((~^wire24)) && ((8'hb2) ?
                          wire0[(5'h11):(5'h10)] : (wire3 ? wire0 : wire2)))));
  assign wire28 = {$unsigned($unsigned(((8'ha1) ?
                          wire5[(3'h6):(3'h4)] : $signed(wire27))))};
  assign wire29 = (!((({reg25, wire27} ? wire0 : (wire22 ? reg4 : wire28)) ?
                          wire26[(3'h4):(2'h2)] : (|wire22[(4'ha):(3'h4)])) ?
                      $unsigned(wire28) : (~|(!$signed(reg25)))));
  always
    @(posedge clk) begin
      reg30 <= $signed(((8'h9f) >= ((!$signed(wire2)) ?
          (-$signed((8'hb9))) : (8'hb3))));
    end
endmodule

module module6
#(parameter param21 = (({({(8'h9f)} ~^ ((8'ha7) ? (8'hbe) : (8'ha2)))} ? ((((7'h44) ^ (8'hb9)) ? ((8'ha3) ? (8'ha7) : (8'ha1)) : {(7'h44)}) ? (((8'hb0) ? (8'hbb) : (8'hbb)) ^~ ((8'hb9) ? (8'ha1) : (7'h44))) : ((+(8'hbe)) ? (^~(8'hbc)) : ((8'hb5) ~^ (8'hbf)))) : (({(8'hab)} ? {(8'hb1)} : {(8'hbd)}) | {(~(8'ha5))})) ^ ((({(8'ha8), (8'haa)} || ((8'had) ? (8'ha0) : (8'ha8))) | ((-(8'hb8)) ? ((8'hbb) ? (8'hbb) : (8'had)) : ((8'hbc) < (7'h41)))) ? ({((8'hbc) ? (8'ha9) : (8'hba))} ? ((^(8'h9f)) ? ((8'hba) >> (8'ha8)) : ((8'h9d) ~^ (7'h42))) : (&((8'h9d) > (8'had)))) : (^~(&{(8'hbb), (8'h9f)})))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  assign y = {wire20,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire11 = ($unsigned(((~^{wire9}) ?
                      (!(wire7 > wire7)) : ((~(8'ha3)) ?
                          $signed(wire7) : wire10[(1'h0):(1'h0)]))) - (^$unsigned($unsigned(wire8[(5'h11):(4'hc)]))));
  assign wire12 = (-(($unsigned(wire8[(5'h10):(4'h8)]) < wire10[(1'h1):(1'h0)]) + wire11[(1'h0):(1'h0)]));
  assign wire13 = $signed(wire7);
  assign wire14 = (!$unsigned((&(wire11[(1'h1):(1'h0)] | (~^(8'hb3))))));
  always
    @(posedge clk) begin
      reg15 <= $unsigned((~$signed({wire13[(4'hc):(4'hb)], wire9})));
      reg16 <= $signed($signed({wire11, (~&{wire7, reg15})}));
      reg17 <= ($unsigned($signed($unsigned(((8'ha2) ^~ wire8)))) > $unsigned((^~{(wire10 ?
              (8'hbf) : wire13),
          $signed(wire13)})));
      reg18 <= $unsigned({$signed((~^$signed(wire14))),
          {reg17[(4'hf):(4'h8)], $signed($signed((7'h40)))}});
      reg19 <= wire13[(5'h12):(5'h10)];
    end
  assign wire20 = $unsigned((~|$unsigned(($unsigned(reg15) && wire13))));
endmodule
