module top
#(parameter param16 = (((~^(((8'ha0) ? (8'ha2) : (8'ha6)) ? (+(8'hbb)) : ((8'ha6) ^ (8'hb1)))) ? (8'hb7) : (((|(8'hbf)) ? (|(8'haf)) : ((8'hba) - (8'h9d))) ? (((8'h9f) >> (8'h9f)) < ((8'ha1) >= (8'ha8))) : ({(8'h9f)} ? {(8'ha3)} : ((8'ha1) ? (7'h44) : (8'hb3))))) ? ({(8'ha6), {{(8'ha1)}, (-(8'h9e))}} <= (({(8'hae)} ? ((8'hb5) ? (8'haf) : (8'hb2)) : ((8'ha7) >= (8'hb4))) ? (&(+(8'hb8))) : (((8'h9f) ? (8'hbf) : (8'ha2)) > ((8'hab) ? (8'hb4) : (7'h43))))) : (~^({(~|(8'hb3)), {(8'ha1)}} ? (((8'ha5) ? (8'haf) : (8'ha2)) <= {(8'h9e), (8'ha7)}) : ({(7'h43)} ? ((8'ha8) ^ (8'hbf)) : (~|(8'hbe)))))), 
parameter param17 = ((~&(~^(param16 ? (param16 <<< param16) : (param16 - param16)))) || (~|((param16 ? (-(8'hae)) : (8'ha9)) ? param16 : (~|(~param16))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire11,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire3[(4'hc):(2'h3)];
  assign wire6 = wire2[(5'h11):(4'he)];
  always
    @(posedge clk) begin
      reg7 <= (^(8'hbc));
      reg8 <= (($unsigned(((wire0 == wire4) >> $unsigned(wire2))) > $unsigned($signed((~(7'h42))))) ?
          ($signed(wire4) ~^ $signed(reg7)) : (^~$unsigned((wire5[(1'h0):(1'h0)] ?
              wire4[(3'h4):(2'h3)] : ((8'hbc) - wire0)))));
      reg9 <= ($signed($signed((wire0 ~^ wire2[(2'h3):(2'h2)]))) ?
          (!(($unsigned(wire5) == wire6[(3'h4):(3'h4)]) ?
              $signed($unsigned(wire3)) : wire2)) : wire3);
      reg10 <= wire5;
    end
  assign wire11 = {(wire0 ?
                          $unsigned($unsigned(reg7)) : $unsigned((wire5[(4'hf):(2'h2)] | {reg9})))};
  always
    @(posedge clk) begin
      reg12 <= $signed(((wire5[(4'h9):(3'h5)] ?
              wire3[(4'he):(4'ha)] : reg9[(1'h0):(1'h0)]) ?
          wire11[(4'hc):(3'h7)] : reg8[(4'he):(4'ha)]));
      reg13 <= $signed(($unsigned($unsigned((wire5 <<< reg8))) >>> wire6[(3'h4):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg14 <= wire6[(1'h0):(1'h0)];
      reg15 <= $unsigned((((~(reg10 ? (8'hb7) : wire1)) > {$unsigned(reg7)}) ?
          (-(^$unsigned((8'hb9)))) : {{$signed(wire6)}}));
    end
endmodule
