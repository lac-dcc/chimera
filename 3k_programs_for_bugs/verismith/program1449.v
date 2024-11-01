module top
#(parameter param19 = (((((!(8'h9e)) == ((8'hb4) << (7'h41))) >= (8'ha3)) <= (({(8'ha2), (7'h42)} ? {(8'h9f)} : (~&(8'h9f))) ? ((~(8'hb2)) != ((7'h43) & (8'hab))) : (((8'ha4) <<< (8'ha5)) ? ((8'haa) ? (8'ha5) : (7'h40)) : ((8'ha0) > (8'hbe))))) ? ({(-(~&(7'h42)))} ^~ (((!(8'hab)) ? (~^(7'h41)) : ((8'hac) >>> (7'h42))) != ((~(7'h42)) + ((8'haf) & (7'h43))))) : {((+((8'hba) ? (8'hb0) : (8'haa))) ^ (~&((7'h42) != (8'hab))))}), 
parameter param20 = ({(^~(param19 ? param19 : (|param19)))} ? ((&(((8'hba) ? param19 : param19) ? (param19 ? param19 : param19) : (&(7'h40)))) & (param19 ? (^~(param19 <<< param19)) : param19)) : (param19 ^~ (((param19 ? param19 : param19) ? (^~param19) : param19) == {(param19 ? param19 : param19), (-param19)}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire5,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = ($unsigned(($unsigned($unsigned(wire0)) ?
                         ($unsigned(wire3) ?
                             wire1 : wire3[(3'h5):(1'h1)]) : $unsigned({wire3}))) ?
                     (($signed($unsigned(wire0)) >> (!(wire4 ?
                             wire3 : wire4))) ?
                         (wire4 + wire1) : $unsigned($signed(wire2[(3'h7):(2'h2)]))) : wire1);
  always
    @(posedge clk) begin
      reg6 <= $signed(wire4);
      reg7 <= wire1[(3'h4):(2'h3)];
      reg8 <= wire3;
      reg9 <= wire2;
      reg10 <= wire2[(4'hd):(4'hb)];
    end
  assign wire11 = $signed({(~&wire1[(3'h7):(3'h4)])});
  assign wire12 = $signed({$unsigned({(~|wire11), wire2})});
  assign wire13 = (-wire11);
  assign wire14 = wire1;
  always
    @(posedge clk) begin
      reg15 <= reg10[(1'h1):(1'h1)];
      reg16 <= $unsigned(reg6[(3'h4):(1'h1)]);
      reg17 <= wire2[(4'hb):(4'hb)];
      reg18 <= (wire5 ~^ ((~^reg6[(4'hf):(2'h2)]) ?
          reg10[(1'h1):(1'h0)] : (^((wire3 ~^ wire14) && ((8'h9d) ?
              reg7 : (8'hb8))))));
    end
endmodule
