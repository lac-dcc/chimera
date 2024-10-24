module top
#(parameter param17 = (({{(+(8'h9e))}} ? ((((7'h42) == (8'hb1)) ? (8'hbb) : {(8'haa), (8'h9e)}) ? (((7'h40) + (8'hb4)) ? ((8'ha6) ? (8'ha5) : (7'h40)) : ((8'ha5) ? (8'hb2) : (8'ha5))) : (((8'ha1) ? (8'ha3) : (8'h9c)) ? (-(8'hbd)) : {(8'ha7)})) : (~{((7'h40) ? (8'ha4) : (8'hb2)), ((8'hb8) ? (8'h9e) : (8'h9e))})) - (8'h9c)), 
parameter param18 = ({((!(param17 && param17)) ? {(param17 ? param17 : (8'hb4)), {param17}} : (^~param17)), ((!((8'h9f) ? param17 : param17)) ? ((&(8'h9c)) && (~&param17)) : (|param17))} | {(((8'hbf) && (param17 >>> param17)) >> (param17 ? (~^param17) : ((8'ha4) | param17)))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  assign y = {wire15,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg14,
                 (1'h0)};
  assign wire5 = wire3[(2'h2):(2'h2)];
  assign wire6 = $unsigned(wire0[(3'h5):(3'h5)]);
  assign wire7 = ({({(8'ha7),
                         wire2[(5'h13):(3'h6)]} >> {wire1})} | $signed(wire3[(3'h5):(1'h1)]));
  assign wire8 = (|(8'ha9));
  assign wire9 = $unsigned((wire3[(2'h2):(1'h0)] ?
                     (~&$unsigned({wire1,
                         wire0})) : {((wire6 || wire4) + {wire2})}));
  assign wire10 = $unsigned($signed((8'hb7)));
  assign wire11 = wire6;
  assign wire12 = $signed(($signed({(wire11 ^~ wire6), {wire11, wire6}}) ?
                      (8'hbf) : $signed($unsigned({wire9, wire10}))));
  assign wire13 = wire8;
  always
    @(posedge clk) begin
      reg14 <= $unsigned($signed((^(8'ha8))));
    end
  assign wire15 = wire0;
  always
    @(posedge clk) begin
      reg16 <= ({$unsigned(((-wire1) + $unsigned(wire10))),
          wire0} == ($unsigned($unsigned({(8'ha5), (8'h9d)})) ?
          $unsigned(wire7) : (($unsigned((8'hb5)) ?
                  (wire1 ^ wire11) : $unsigned(wire10)) ?
              wire13[(2'h3):(2'h2)] : wire1)));
    end
endmodule
