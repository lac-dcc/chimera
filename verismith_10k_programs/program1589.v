module top
#(parameter param17 = ((((((8'hbf) ? (8'ha9) : (8'h9c)) ? {(8'hbf)} : (&(8'hb2))) ? ({(8'hae)} & ((8'hbb) << (8'ha9))) : (((8'ha0) > (8'h9d)) ? (~^(8'ha8)) : ((8'hb5) ? (8'h9d) : (8'ha5)))) <<< {(8'hb8), {((8'ha2) != (8'hb0)), ((7'h43) ? (8'ha6) : (8'ha0))}}) ? ({{((8'hbf) ? (8'ha7) : (8'hb0)), (|(8'ha3))}, ((8'ha2) ? {(8'h9e), (8'hb8)} : ((8'hac) ? (8'hb9) : (8'had)))} ? (-(+{(8'hbd)})) : (^(((7'h41) ? (7'h40) : (8'hb1)) >= {(8'ha0), (7'h40)}))) : ((+(((8'ha0) < (7'h43)) > {(7'h43), (8'ha2)})) ? ((~|((8'hbe) || (8'ha9))) ? ((^~(8'h9f)) ^~ ((8'hac) ? (8'hb2) : (8'hba))) : ({(8'hb4), (8'ha5)} == (~|(8'hbc)))) : (&(|(-(8'hb1)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg12,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire0[(3'h4):(2'h2)] <<< wire4[(1'h1):(1'h0)]);
      reg6 <= ($unsigned((((8'hb4) || (&wire4)) ?
              wire1[(5'h10):(2'h3)] : ((wire4 ? (8'hab) : wire3) ?
                  {wire2, wire3} : reg5[(4'h9):(3'h5)]))) ?
          ((&((wire0 ? wire4 : wire3) ^ {(8'hab)})) ?
              wire4 : wire1[(2'h3):(1'h0)]) : {$signed(wire2),
              reg5[(1'h1):(1'h0)]});
    end
  assign wire7 = $signed($signed(($unsigned((&wire4)) + $unsigned($unsigned(wire3)))));
  assign wire8 = (8'ha1);
  assign wire9 = $unsigned((!(-(+wire0[(2'h3):(2'h2)]))));
  assign wire10 = wire1[(5'h11):(5'h10)];
  assign wire11 = ($signed({reg5[(2'h2):(1'h1)]}) < (8'hb9));
  always
    @(posedge clk) begin
      reg12 <= wire10;
    end
  assign wire13 = (^wire3[(1'h0):(1'h0)]);
  assign wire14 = reg6;
  assign wire15 = wire9;
  assign wire16 = wire14[(2'h3):(1'h0)];
endmodule
