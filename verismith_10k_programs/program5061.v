module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $signed($signed((wire3 ~^ ($unsigned(wire0) ?
                     (~wire0) : wire3[(3'h6):(3'h4)]))));
  assign wire5 = {{$signed($signed($unsigned(wire2)))}};
  assign wire6 = wire1[(1'h1):(1'h1)];
  module7 #() modinst34 (.wire9(wire6), .y(wire33), .wire8(wire2), .wire11(wire4), .clk(clk), .wire10(wire1));
  assign wire35 = (wire33[(3'h5):(3'h5)] ?
                      (wire2[(1'h1):(1'h1)] ?
                          $signed((wire4 ?
                              $unsigned(wire2) : wire5[(4'hd):(3'h7)])) : wire2[(3'h5):(1'h1)]) : wire0);
  assign wire36 = (wire33 ? wire33 : $unsigned((^$signed(((8'hbe) ^~ wire6)))));
  assign wire37 = wire4;
  assign wire38 = wire37[(1'h0):(1'h0)];
  assign wire39 = ($signed($signed((wire4[(5'h11):(4'ha)] != (wire0 ?
                      wire38 : wire6)))) & (~^$unsigned(wire35[(2'h3):(2'h3)])));
endmodule

module module7
#(parameter param32 = ((!(!((!(8'hac)) ^~ ((8'hb8) == (8'haf))))) ? (~&{{((7'h40) <<< (8'h9f)), (&(8'h9d))}}) : ((({(8'hb7)} && {(8'ha7), (8'hac)}) ? (((8'h9e) | (7'h40)) - (~&(7'h40))) : (((7'h42) ? (8'ha3) : (8'ha5)) ? ((8'ha5) ? (8'h9e) : (8'ha8)) : ((8'h9f) >>> (8'h9f)))) == ((((8'haa) ? (8'hb9) : (8'ha2)) <<< ((8'hb1) ? (8'h9d) : (8'ha8))) && {((8'hbc) >= (8'h9d)), ((8'hbf) ? (8'haa) : (8'hb4))}))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= (wire11[(2'h3):(1'h1)] ?
          (&(-(!(wire11 ? (8'hb4) : wire10)))) : wire11[(2'h3):(1'h1)]);
    end
  assign wire13 = (^reg12[(1'h0):(1'h0)]);
  assign wire14 = wire8;
  assign wire15 = {$unsigned($signed((reg12[(2'h3):(1'h1)] ?
                          wire14[(4'ha):(3'h7)] : (|(8'hbb)))))};
  assign wire16 = $signed(((~&wire8) <<< $signed($signed($unsigned(wire9)))));
  assign wire17 = ((|$unsigned(((wire13 ?
                      reg12 : wire8) & wire16))) == (8'h9f));
  always
    @(posedge clk) begin
      if ({wire8[(4'hb):(4'ha)],
          ((wire8 ?
                  ($unsigned(wire15) ?
                      ((8'ha7) ? wire17 : (8'ha5)) : (wire14 ?
                          wire14 : wire11)) : (wire17[(3'h4):(1'h0)] < wire14)) ?
              wire17[(1'h1):(1'h0)] : (!{wire9[(1'h1):(1'h1)]}))})
        begin
          reg18 <= {$unsigned(wire16[(1'h0):(1'h0)])};
        end
      else
        begin
          if ($unsigned((^~(^~(wire13[(4'h8):(3'h4)] ? (!wire16) : wire11)))))
            begin
              reg18 <= reg12;
              reg19 <= $unsigned((wire15[(3'h7):(3'h7)] & (^reg12[(1'h0):(1'h0)])));
            end
          else
            begin
              reg18 <= wire11;
              reg19 <= ($unsigned($signed(wire9)) ?
                  ($unsigned(((reg19 ^~ wire14) ?
                      (8'h9e) : $unsigned(reg18))) ^~ $signed(($signed(wire14) ?
                      {wire11, (8'hb3)} : (wire16 ?
                          wire8 : wire17)))) : {(^$signed((~&wire9)))});
              reg20 <= {(^($unsigned($signed((8'ha8))) ?
                      (((8'hab) ? wire13 : reg19) * (8'hac)) : (8'hb6))),
                  $signed((wire11 ?
                      ((reg19 >= wire11) | wire17[(4'hd):(1'h0)]) : ($signed(reg18) ?
                          $unsigned(wire9) : $signed(wire11))))};
              reg21 <= reg20[(5'h13):(4'hb)];
            end
          if ({wire15[(1'h1):(1'h0)]})
            begin
              reg22 <= $unsigned(reg18);
            end
          else
            begin
              reg22 <= ((&(((~&(8'hb5)) == wire13[(4'h8):(1'h1)]) - $signed((reg21 ?
                      reg22 : reg22)))) ?
                  ((8'hb7) ?
                      reg12 : $unsigned($signed((wire15 ?
                          wire8 : wire16)))) : $signed(reg22[(5'h11):(2'h2)]));
              reg23 <= $signed({wire8[(3'h5):(3'h4)], reg12});
              reg24 <= $unsigned(reg23);
              reg25 <= (($unsigned(({reg18} ~^ reg23[(3'h4):(1'h0)])) ?
                      wire14[(5'h10):(3'h7)] : (wire9 ?
                          (-(wire10 << wire16)) : $signed(((7'h40) > (8'haa))))) ?
                  reg18[(1'h0):(1'h0)] : $unsigned(reg18[(1'h0):(1'h0)]));
              reg26 <= ($unsigned($unsigned((^(8'ha0)))) | ($signed(($unsigned((8'ha8)) ?
                  (wire9 >= reg23) : reg25)) - wire17));
            end
        end
      reg27 <= (&reg24[(1'h0):(1'h0)]);
      reg28 <= (~^(!(!(^(reg24 < reg19)))));
      reg29 <= reg26[(2'h2):(2'h2)];
    end
  assign wire30 = (($unsigned(reg22[(3'h7):(3'h4)]) ?
                      reg24[(4'hb):(2'h3)] : ((reg23[(5'h10):(4'hc)] & (wire9 ^ (8'hba))) >= wire16[(1'h0):(1'h0)])) & (reg26[(2'h2):(2'h2)] ^ (((~^wire10) >> (wire16 & wire14)) >>> $signed(wire13))));
  assign wire31 = reg20;
endmodule
