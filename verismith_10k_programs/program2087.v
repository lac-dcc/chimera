module top
#(parameter param13 = (((|({(8'hb8)} ? ((8'hab) ? (8'hbe) : (8'haa)) : ((8'hb9) ? (8'hbd) : (8'h9c)))) ? ((((7'h41) ? (8'hbd) : (8'ha5)) != (~|(8'hb1))) ? (-{(8'ha5)}) : (~^((8'hb6) ? (8'ha1) : (7'h41)))) : ({((8'ha4) ? (8'hbd) : (8'h9d))} ? (((8'ha2) ? (7'h41) : (8'hbb)) || ((8'ha1) | (8'ha6))) : ({(7'h40), (8'ha9)} & ((8'h9e) ^~ (7'h42))))) ? ((((|(8'hba)) ? ((8'hbc) ? (8'h9c) : (7'h41)) : ((7'h40) && (8'hbf))) ? {((8'ha4) ? (8'hb6) : (8'hba))} : (((8'h9d) ~^ (8'ha0)) ? (8'h9c) : ((8'hb6) <= (8'hbf)))) ? (({(8'ha9)} ? ((8'hb6) ? (8'h9e) : (8'h9f)) : ((8'ha1) | (8'ha7))) == (((8'hba) ^ (8'haf)) ? (~(8'ha6)) : ((8'hac) ? (8'hb2) : (8'hab)))) : {(((7'h42) << (8'ha7)) << (-(8'had)))}) : (((((8'h9e) ? (8'h9f) : (8'hb1)) * (+(8'hb4))) > (((8'ha2) ? (8'hac) : (8'hbb)) >>> ((8'hbd) * (7'h40)))) ^ ((((8'ha2) << (7'h40)) << (8'ha0)) == (8'ha0)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (wire4 ? $signed(wire2) : wire3[(3'h6):(1'h1)]);
  assign wire6 = wire4[(3'h5):(1'h0)];
  assign wire7 = $signed((~^($unsigned(wire2) >>> wire6)));
  assign wire8 = {($unsigned(($signed((8'hab)) ?
                         (!(8'hac)) : (&wire4))) ~^ wire0[(5'h10):(3'h4)])};
  assign wire9 = ({wire2} ?
                     ($unsigned(({wire3} << wire5)) ?
                         wire1[(1'h0):(1'h0)] : {((|wire1) >>> wire4)}) : (|((8'ha1) == ((wire3 - wire6) ?
                         wire7[(3'h5):(3'h4)] : $signed(wire0)))));
  assign wire10 = $signed((wire9[(1'h0):(1'h0)] ?
                      wire4[(4'hc):(4'h9)] : (-$unsigned((wire5 ?
                          wire8 : wire2)))));
  assign wire11 = ($signed({$signed(wire8),
                      (~&wire1[(1'h1):(1'h0)])}) >> $unsigned((!(wire2[(3'h7):(1'h1)] | (wire0 ^~ wire3)))));
  assign wire12 = $signed($signed(wire8));
endmodule
