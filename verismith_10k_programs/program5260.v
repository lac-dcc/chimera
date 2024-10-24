module top
#(parameter param15 = (({((|(8'had)) ? ((8'ha5) ? (8'ha5) : (8'hbf)) : (~&(7'h44))), (((8'hb6) ? (8'hb9) : (8'hb1)) ? ((8'hab) << (8'hbd)) : (~|(8'hb9)))} ? (^~((+(7'h44)) ? ((8'ha8) ? (8'ha7) : (8'hb7)) : (+(7'h40)))) : {(((8'hb1) ? (8'ha9) : (8'ha5)) * ((8'ha4) ^ (8'hb7)))}) ? ({{((8'ha8) && (8'hb7))}, ((|(8'ha2)) || {(8'ha0)})} >>> ((((8'ha8) + (8'ha7)) >>> ((8'ha3) ? (8'ha0) : (8'hbb))) ? (+((8'hb9) ? (8'ha5) : (8'hab))) : (8'ha9))) : (({((7'h41) < (8'h9d)), (^(8'hbc))} ? ((&(8'h9d)) ? ((8'hb0) << (8'hb9)) : ((8'hba) ? (8'hbc) : (8'h9e))) : (((8'hbe) && (8'ha8)) ? (|(8'had)) : ((8'ha6) || (8'hb8)))) <<< ((8'ha9) && ((8'ha3) ? {(8'hac)} : ((8'hb4) > (8'ha5)))))), 
parameter param16 = (8'had))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 (1'h0)};
  assign wire5 = wire4[(5'h10):(3'h5)];
  assign wire6 = (^{wire4[(3'h7):(1'h0)]});
  assign wire7 = wire0;
  assign wire8 = wire1[(4'hb):(4'h8)];
  assign wire9 = ((+(~&wire4[(4'hc):(3'h4)])) ?
                     ({wire6, ($signed(wire5) <<< $unsigned(wire0))} ?
                         $signed(wire4[(4'h9):(1'h1)]) : ((wire7[(4'h9):(3'h5)] ?
                             wire4[(2'h2):(1'h1)] : $unsigned(wire0)) > (^(^~wire3)))) : ((wire5[(2'h3):(2'h2)] ?
                             $signed((wire1 << (8'hbc))) : wire4) ?
                         wire8 : $unsigned(((wire5 ? wire5 : wire0) ?
                             (wire4 | wire2) : (wire2 < wire5)))));
  assign wire10 = wire9;
  assign wire11 = ($signed(wire0) >= wire9);
  assign wire12 = ({(~^$signed(wire5[(2'h2):(1'h1)])), wire1} ?
                      (~$unsigned((((8'hb3) ? wire2 : wire10) ?
                          (wire7 ?
                              (8'haf) : (8'ha8)) : {wire10}))) : $signed(wire0[(3'h7):(2'h2)]));
  assign wire13 = wire11[(5'h12):(5'h10)];
  always
    @(posedge clk) begin
      reg14 <= (7'h43);
    end
endmodule
