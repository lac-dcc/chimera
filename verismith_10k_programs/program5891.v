module top
#(parameter param16 = ((~|{(^((7'h41) + (8'hb0))), (((8'hb2) >> (8'hbb)) << ((8'hbb) ? (7'h43) : (7'h41)))}) ? (((^~{(8'ha0), (8'hbc)}) ? (((8'hbb) ? (8'ha1) : (8'had)) - ((8'hbc) == (8'ha3))) : (^~((8'hbe) <= (8'ha3)))) ? (|(|(&(8'ha1)))) : ((((7'h44) ? (8'hbb) : (8'had)) ? {(8'ha8), (8'hb0)} : (&(8'hb8))) ? (!((8'hb9) >>> (8'haa))) : (((8'hb2) ? (8'ha2) : (8'hb0)) >>> ((8'hb6) <<< (7'h44))))) : {(((+(8'ha3)) ? (|(8'hb1)) : ((8'hb5) - (8'hb7))) >> (((8'ha3) ? (8'hbe) : (8'hb0)) ? ((8'ha9) ? (8'hbe) : (7'h41)) : ((8'hbf) ? (8'hb1) : (7'h40))))}), 
parameter param17 = (((param16 ? {(param16 >= (8'hb9))} : ((param16 ~^ param16) ? (param16 & param16) : (+param16))) > (&((param16 ? param16 : (8'hb7)) ? (+param16) : (param16 ? param16 : param16)))) | (^(&((param16 < (8'ha1)) << (8'ha0))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = {wire1};
  assign wire6 = wire3[(5'h11):(2'h3)];
  assign wire7 = (($unsigned({(wire5 ? wire5 : wire2),
                         ((8'h9e) ?
                             wire2 : wire0)}) >>> (^~wire1[(4'hb):(4'h8)])) ?
                     ({wire5} ? wire2 : wire0[(4'hd):(3'h4)]) : ({{{wire0,
                                     wire5},
                                 (~|(8'hb6))}} ?
                         $signed($unsigned((wire0 + wire2))) : wire6));
  assign wire8 = wire5[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg9 <= {wire0[(3'h4):(3'h4)]};
      reg10 <= (^wire5);
      reg11 <= $unsigned((($signed($unsigned(wire3)) * (wire4 ?
              (~&(8'had)) : $signed((8'h9e)))) ?
          wire8[(2'h2):(1'h0)] : {({wire0} ? (wire2 & wire6) : (8'hbe))}));
      if ((8'hb1))
        begin
          reg12 <= {($signed((^wire0)) == (((wire7 ? wire5 : wire2) ?
                      (8'h9e) : {wire0, wire1}) ?
                  $signed((reg11 >> wire7)) : reg9[(1'h0):(1'h0)]))};
          reg13 <= ($unsigned(wire5[(4'hb):(3'h7)]) ^~ $unsigned((^((~&reg12) ?
              {(8'hb8)} : $unsigned(reg10)))));
        end
      else
        begin
          reg12 <= $unsigned({$signed((wire7 >>> $unsigned(wire3))),
              (|$unsigned($unsigned(wire3)))});
          reg13 <= (-$unsigned(wire0));
        end
    end
  assign wire14 = reg13[(3'h7):(1'h0)];
  assign wire15 = (wire1 ?
                      (|{((reg13 >>> wire8) == $signed(reg12))}) : wire14[(3'h4):(3'h4)]);
endmodule
