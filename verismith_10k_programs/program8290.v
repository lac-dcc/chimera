module top
#(parameter param16 = ((((^~((8'hba) && (8'haa))) ? (((8'haa) ? (7'h43) : (8'hb8)) | ((8'ha5) * (7'h40))) : (&((8'hb8) + (7'h44)))) ? ({(&(8'ha8)), ((7'h41) ? (8'hb1) : (7'h44))} ? (!(~|(8'hbc))) : (~|(-(8'ha4)))) : ((^(~&(8'ha2))) <= {(~&(8'ha9)), ((7'h41) >>> (8'ha0))})) ? (~&({(!(7'h41))} > ({(8'hb6)} ^~ ((8'had) >> (8'h9d))))) : {(&{((8'hb6) ? (8'hb9) : (8'hba))})}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  assign y = {wire15,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = ((wire2[(3'h4):(3'h4)] * $unsigned(wire4)) ?
                     $signed((wire4 ?
                         (wire0[(1'h1):(1'h1)] ?
                             wire2 : (wire0 && wire1)) : (wire1 ^ wire4[(3'h4):(1'h0)]))) : {((|$unsigned(wire1)) ?
                             wire3[(2'h2):(2'h2)] : {(wire0 > wire3),
                                 $signed(wire1)}),
                         (|wire1)});
  assign wire6 = ($signed(wire2) ?
                     (^((!wire5) * (wire3 - wire3))) : $unsigned(wire5));
  assign wire7 = $signed(wire1[(4'h9):(1'h0)]);
  assign wire8 = (wire4 > ($signed(wire0) << wire6));
  assign wire9 = wire2[(4'he):(2'h3)];
  assign wire10 = wire7;
  assign wire11 = (~^wire7);
  assign wire12 = ((+($unsigned((wire2 ? wire8 : wire10)) ?
                          $unsigned((~wire1)) : wire10[(1'h1):(1'h1)])) ?
                      {((&(wire1 > wire9)) ?
                              ((wire3 ^ wire4) ~^ (wire9 >> wire8)) : $signed((!wire6)))} : ({$signed((wire2 ?
                              wire11 : wire6)),
                          (8'ha3)} ^ wire5));
  always
    @(posedge clk) begin
      reg13 <= (~^((^wire6) ? $signed(wire3) : wire8));
      reg14 <= wire8;
    end
  assign wire15 = (|((($unsigned(wire10) << wire10) ?
                          $signed(wire9[(1'h1):(1'h1)]) : (-$signed(wire5))) ?
                      {wire10} : wire3[(3'h7):(1'h1)]));
endmodule
