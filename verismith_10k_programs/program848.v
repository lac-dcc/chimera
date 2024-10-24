module top
#(parameter param52 = ({{(-((8'h9c) + (7'h41))), (((8'ha2) ? (8'hb3) : (8'haf)) ? ((8'haf) != (8'ha4)) : (|(8'ha7)))}} <<< ((((!(8'hb8)) ? ((7'h43) - (8'haa)) : (|(7'h40))) | ((+(8'hb4)) - ((8'hb9) != (8'hb7)))) ? (^~((~&(8'hbb)) && {(8'h9c)})) : ({((8'haa) >= (8'ha6)), (8'haf)} ? (((8'ha3) < (8'hb9)) ^~ (-(8'h9f))) : (!((8'ha0) > (8'ha9)))))), 
parameter param53 = (^~(^param52)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire36;
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire4,
                 wire5,
                 wire6,
                 wire36,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = (wire3[(3'h6):(3'h5)] ?
                     $signed($signed((wire4[(4'h8):(1'h0)] <= (+(8'ha6))))) : $signed($signed(wire0)));
  assign wire6 = wire2[(2'h2):(2'h2)];
  module7 #() modinst37 (.wire12(wire5), .wire8(wire4), .wire9(wire1), .wire11(wire0), .wire10(wire3), .clk(clk), .y(wire36));
  always
    @(posedge clk) begin
      reg38 <= $unsigned($unsigned((!$unsigned((wire1 <= wire0)))));
      if (((|$signed(((reg38 >>> wire1) < wire3[(4'hf):(3'h4)]))) ?
          wire2 : reg38))
        begin
          reg39 <= ((-wire2) & wire2);
          reg40 <= wire3[(2'h2):(1'h1)];
        end
      else
        begin
          if ((wire36 ?
              $signed(((7'h40) ?
                  (-(wire2 ?
                      (8'ha3) : reg40)) : (^(+(7'h43))))) : wire5[(3'h7):(3'h7)]))
            begin
              reg39 <= (-{wire4});
              reg40 <= $signed($unsigned($unsigned($unsigned($unsigned(reg39)))));
            end
          else
            begin
              reg39 <= wire2;
            end
        end
      reg41 <= wire3;
      reg42 <= (($signed((8'ha2)) ? (&(8'h9c)) : reg40) ?
          reg40 : reg41[(1'h0):(1'h0)]);
      if (reg38[(1'h1):(1'h1)])
        begin
          reg43 <= wire2;
          reg44 <= $unsigned({$unsigned({wire6[(4'h8):(4'h8)], (7'h42)}),
              (($unsigned(wire2) ?
                  $unsigned(reg41) : reg42[(1'h0):(1'h0)]) >= wire0[(4'hc):(2'h3)])});
          reg45 <= $signed(wire1[(5'h10):(3'h4)]);
        end
      else
        begin
          if ((!(reg41 <<< reg43)))
            begin
              reg43 <= reg45[(4'hd):(3'h7)];
              reg44 <= $signed(wire5);
              reg45 <= $unsigned((reg41[(4'hc):(2'h3)] >> ($unsigned((-(7'h40))) >> reg38)));
              reg46 <= {($unsigned($signed(wire5[(4'h8):(3'h7)])) ?
                      wire3[(2'h3):(1'h1)] : $unsigned(($signed((8'h9e)) ?
                          (~reg41) : $signed((8'hb8))))),
                  ((reg39 ? (8'hbf) : $unsigned(wire1[(4'he):(4'he)])) ?
                      wire5[(4'hc):(3'h5)] : (((~reg43) ?
                              reg38[(3'h7):(3'h4)] : $signed(wire4)) ?
                          (-$unsigned(reg39)) : (8'hb8)))};
              reg47 <= reg46;
            end
          else
            begin
              reg43 <= wire5[(4'h9):(4'h8)];
              reg44 <= (reg44 < $signed(wire4));
              reg45 <= reg45;
              reg46 <= $signed((~^wire4[(4'h9):(1'h0)]));
            end
        end
    end
  assign wire48 = reg45[(3'h5):(2'h3)];
  assign wire49 = $signed(reg43);
  assign wire50 = ($unsigned($unsigned({{reg42, reg45}})) ~^ ((wire0 ?
                          (~&$unsigned((7'h41))) : $signed($unsigned(wire4))) ?
                      $unsigned(wire49) : ($unsigned((reg38 == reg39)) >>> wire0)));
  assign wire51 = $signed((wire3 < {((reg43 >>> reg47) ?
                          {reg44, reg46} : $unsigned(wire5)),
                      reg42}));
endmodule

module module7
#(parameter param34 = ((^(|({(8'haf), (8'hb7)} ? ((8'hb1) * (8'hbe)) : ((8'hb4) ? (8'h9c) : (8'hb6))))) != {(|((+(8'h9e)) ? ((7'h44) ? (8'ha0) : (8'h9d)) : (^~(8'ha6)))), (~|{((8'hb0) ? (8'hab) : (8'h9f)), ((8'ha9) | (8'hbd))})}), 
parameter param35 = (8'ha9))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire [(2'h3):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  assign y = {wire33,
                 wire30,
                 wire29,
                 wire27,
                 wire15,
                 wire14,
                 wire13,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire13 = (($unsigned($unsigned((wire10 ?
                          wire10 : wire12))) >>> (~(+(wire8 - (8'ha2))))) ?
                      wire10 : $unsigned((8'ha0)));
  assign wire14 = ((&(wire8 << wire13[(1'h0):(1'h0)])) ~^ {$signed(($signed(wire13) ?
                          (8'ha5) : (wire12 ? wire10 : wire8)))});
  assign wire15 = (8'ha0);
  module16 #() modinst28 (.wire18(wire8), .wire19(wire12), .wire20(wire14), .wire17(wire15), .clk(clk), .y(wire27));
  assign wire29 = (8'h9e);
  assign wire30 = wire10;
  always
    @(posedge clk) begin
      reg31 <= ($signed(wire12[(1'h0):(1'h0)]) == (((~$unsigned(wire8)) ?
          $signed($signed(wire15)) : wire15) == $unsigned({wire10[(4'hd):(3'h4)],
          (wire11 ? wire10 : wire13)})));
      reg32 <= wire14;
    end
  assign wire33 = {(($signed(wire9) > wire8) ?
                          (((wire29 ? wire10 : reg32) ?
                                  $signed((8'hb1)) : (wire8 ^ (7'h41))) ?
                              wire29[(1'h1):(1'h1)] : wire29[(2'h2):(1'h1)]) : $unsigned($signed(reg32[(1'h1):(1'h1)])))};
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  input wire signed [(3'h7):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  assign y = {wire26, wire25, wire24, wire23, wire22, reg21, (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= (8'h9f);
    end
  assign wire22 = ({((wire19 || ((8'h9c) <= (8'hb5))) ?
                              $unsigned((wire20 ?
                                  reg21 : wire18)) : ((!wire18) ?
                                  reg21[(4'ha):(1'h1)] : (reg21 == (8'haa))))} ?
                      ((wire18[(3'h4):(1'h1)] ?
                              ($signed((7'h40)) ?
                                  (^~wire18) : (reg21 >> wire18)) : $unsigned((^~wire20))) ?
                          $unsigned(reg21) : (+$signed((reg21 * wire18)))) : $unsigned(wire19[(4'hb):(4'ha)]));
  assign wire23 = $signed($unsigned(($unsigned(wire19[(4'ha):(3'h6)]) == $signed((wire19 + wire19)))));
  assign wire24 = {(wire22 ^ reg21[(3'h5):(2'h3)])};
  assign wire25 = (wire17 < ($unsigned((^~$signed(reg21))) ?
                      ($signed((~&wire17)) ?
                          ($signed(wire18) * wire24[(3'h7):(3'h6)]) : ((wire22 - wire23) <<< (wire22 ?
                              (8'hb9) : (8'hbc)))) : ((&reg21[(4'hc):(3'h6)]) ?
                          {(-wire24), (-reg21)} : $unsigned((|wire18)))));
  assign wire26 = (8'hae);
endmodule
