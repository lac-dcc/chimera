module top
#(parameter param15 = {{(^{((8'h9c) + (8'ha0))})}, (((~&(8'hae)) ? ((~(7'h42)) ? ((8'ha7) && (8'haa)) : ((8'hb3) ? (8'hbf) : (8'hac))) : ((7'h41) ? ((8'ha7) ? (8'h9e) : (8'h9d)) : (|(8'hb1)))) + (+(((8'haf) ? (8'hba) : (8'ha1)) ? (7'h44) : ((8'hab) > (8'hb9)))))}, 
parameter param16 = param15)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire14,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 reg13,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (($unsigned($signed($signed((8'hb0)))) ?
                         (^~wire2) : wire0[(3'h4):(2'h2)]) ?
                     ($unsigned($signed(wire1[(2'h3):(2'h2)])) * wire2[(3'h5):(1'h0)]) : ($unsigned($signed(((7'h41) ?
                         wire0 : wire1))) < {{(wire2 >> wire2),
                             (wire1 || wire3)},
                         wire0[(1'h0):(1'h0)]}));
  always
    @(posedge clk) begin
      reg6 <= ((wire4[(4'hd):(4'ha)] ?
          {wire4[(4'h9):(4'h9)],
              $signed(wire0)} : wire1[(4'hc):(1'h1)]) & ((^~(+$unsigned((7'h41)))) ?
          ({wire4, wire2} ?
              {{wire3}} : ((wire2 ? wire1 : wire1) ?
                  (wire0 ?
                      (8'hb2) : (8'hb0)) : wire1)) : $signed($signed(wire4))));
      reg7 <= ((((|$unsigned(wire5)) ^~ $signed((+reg6))) ?
              wire2 : ((wire0[(3'h5):(1'h1)] ?
                  $signed(wire1) : ((8'hac) ? wire1 : wire4)) >>> (8'hb0))) ?
          (!$signed(wire1)) : $unsigned(wire1[(3'h6):(2'h2)]));
    end
  assign wire8 = reg6[(1'h0):(1'h0)];
  assign wire9 = (wire8[(3'h7):(3'h4)] * $unsigned((((8'ha4) * wire1[(2'h3):(1'h1)]) && reg7)));
  assign wire10 = $signed($signed(wire4[(2'h3):(2'h2)]));
  assign wire11 = ((-wire2[(1'h0):(1'h0)]) >> ($signed({(wire2 - wire3),
                          {wire2, wire5}}) ?
                      reg7[(4'hb):(1'h0)] : wire4[(3'h4):(2'h2)]));
  assign wire12 = reg6[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg13 <= wire8;
    end
  assign wire14 = $unsigned(wire11[(3'h4):(1'h1)]);
endmodule
