module top
#(parameter param14 = ((((((8'hbd) <<< (8'had)) != (~(8'hb5))) ? (~((7'h44) >= (8'hb1))) : ((~(8'hae)) ^~ (&(8'ha7)))) && (|(((8'hbb) ? (8'hae) : (7'h44)) | ((8'hb9) ? (8'ha0) : (8'hb0))))) && ((((|(8'haf)) == ((8'ha5) < (8'h9f))) ? (^~((8'h9e) <<< (8'hb4))) : (((8'hb4) ? (8'hb3) : (8'haa)) ? ((8'hbc) ? (8'ha6) : (7'h44)) : ((8'ha5) ? (7'h40) : (8'hbf)))) ? ((((8'h9f) ? (8'ha3) : (8'ha0)) == (~^(8'haa))) ^ ((~&(8'ha8)) ? ((8'h9f) ? (7'h44) : (8'hab)) : ((8'h9c) ? (8'hb8) : (7'h42)))) : (~(((8'hae) <= (8'haa)) + (~(8'hba)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 reg6,
                 (1'h0)};
  assign wire5 = (($signed(((~&wire2) ^ $unsigned(wire1))) ?
                         $signed((-wire4[(1'h0):(1'h0)])) : ($unsigned((wire3 ?
                             wire1 : wire1)) << $unsigned($unsigned(wire2)))) ?
                     ({$signed(wire1[(2'h3):(1'h1)]), $unsigned((~wire4))} ?
                         ({wire0[(4'hf):(3'h6)]} > wire4) : wire1) : wire4);
  always
    @(posedge clk) begin
      reg6 <= $unsigned($unsigned($signed((wire0 ?
          $unsigned(wire0) : (~|wire2)))));
    end
  assign wire7 = wire2[(4'hb):(1'h0)];
  assign wire8 = {(((wire4[(3'h6):(1'h0)] ? ((8'hae) + (8'hbb)) : (~&wire1)) ?
                             ((8'ha6) ^ (|wire3)) : $unsigned($signed((8'hba)))) ?
                         (8'ha9) : wire2[(2'h3):(2'h3)]),
                     (&wire3[(1'h0):(1'h0)])};
  assign wire9 = $unsigned(reg6);
  assign wire10 = (&(~|(8'ha8)));
  assign wire11 = wire3[(1'h1):(1'h0)];
  assign wire12 = wire9;
  assign wire13 = $unsigned(reg6);
endmodule
