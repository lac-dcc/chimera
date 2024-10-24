module top
#(parameter param16 = (&{((((8'ha2) ? (8'h9f) : (8'hbc)) >>> (~(8'ha3))) ? (((8'ha0) ? (8'ha4) : (8'ha5)) ? (~^(8'hb9)) : ((8'ha6) ? (8'hb7) : (7'h44))) : (((8'haf) ? (8'hba) : (8'haa)) ? ((8'hb7) ? (8'ha5) : (8'hbb)) : ((8'ha7) <= (8'h9c))))}), 
parameter param17 = ({(|{param16})} ? param16 : (param16 ? {((^~(8'hba)) ? {(8'ha5), param16} : {(7'h42)}), (8'hb0)} : ((~^(param16 != param16)) == ((param16 ? param16 : param16) <= (param16 ? param16 : param16))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 (1'h0)};
  assign wire4 = (^~$unsigned(wire2));
  assign wire5 = (-(|{wire4[(1'h0):(1'h0)]}));
  assign wire6 = wire5[(1'h1):(1'h1)];
  assign wire7 = ($signed(wire3[(1'h0):(1'h0)]) ?
                     ($signed(wire0) < wire0[(4'hc):(3'h4)]) : $unsigned(wire6));
  assign wire8 = $unsigned((wire5 ?
                     $signed(($unsigned(wire7) - $signed(wire7))) : wire5));
  assign wire9 = $signed(($signed(wire4[(1'h0):(1'h0)]) || wire4[(2'h2):(1'h0)]));
  assign wire10 = $signed($signed(($unsigned($unsigned(wire6)) <= $signed(((8'h9d) ?
                      (8'hac) : wire5)))));
  assign wire11 = $signed(wire0);
  assign wire12 = wire10;
  assign wire13 = ($signed(wire12) >>> $signed((($unsigned(wire9) != wire6) ?
                      (wire3[(2'h2):(1'h0)] ?
                          $unsigned((8'ha8)) : {wire0}) : ($unsigned(wire0) - $signed((8'ha8))))));
  assign wire14 = (~^(~&$signed((wire2 ? {wire8} : (wire0 < (8'hb6))))));
  always
    @(posedge clk) begin
      reg15 <= $signed($unsigned(($signed(wire11) ?
          wire2[(1'h1):(1'h0)] : ($unsigned(wire13) ~^ (wire12 ?
              wire4 : wire7)))));
    end
endmodule
