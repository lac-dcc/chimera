module top
#(parameter param50 = (~({(^~(7'h43)), ((8'ha8) ? (~|(8'hb8)) : ((8'hb1) ^~ (8'hb9)))} ? (((^~(8'hb9)) < ((8'h9d) ? (8'ha5) : (8'ha6))) && (+(+(8'hb7)))) : ((((8'hbc) ? (8'hb8) : (8'hb9)) ? (8'hae) : ((7'h41) ? (8'ha6) : (8'had))) ? (^((8'ha6) ? (8'hbc) : (8'hbc))) : {((8'haf) ? (8'hb9) : (8'haf)), (~&(8'hae))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire33;
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire44,
                 wire36,
                 wire35,
                 wire5,
                 wire33,
                 reg46,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire5 = wire3[(5'h11):(3'h6)];
  module6 #() modinst34 (wire33, clk, wire3, wire0, wire5, wire1, wire2);
  assign wire35 = {wire5[(3'h4):(3'h4)]};
  assign wire36 = wire0;
  always
    @(posedge clk) begin
      reg37 <= (wire35[(1'h1):(1'h1)] ? wire2 : wire4);
      reg38 <= (reg37 ^ (({(^wire35),
          (wire35 && wire36)} ^~ wire5) + (~&$unsigned(wire0[(3'h5):(1'h1)]))));
      reg39 <= {wire33[(3'h5):(2'h2)]};
      if (wire36[(4'h9):(4'h8)])
        begin
          if (wire0[(5'h12):(4'hd)])
            begin
              reg40 <= (+$unsigned($unsigned(wire2)));
            end
          else
            begin
              reg40 <= ($unsigned(wire33[(4'he):(4'hc)]) ?
                  reg38[(1'h0):(1'h0)] : ((8'had) < $signed((~(wire2 < wire4)))));
            end
          reg41 <= {(^reg38),
              {(wire33 * ($signed((8'h9c)) ?
                      {wire1, wire1} : $unsigned((8'ha0))))}};
          reg42 <= (+($signed({$unsigned(reg40)}) || $signed((^$unsigned(reg38)))));
          reg43 <= {($unsigned(reg37[(1'h0):(1'h0)]) < ((reg40[(1'h0):(1'h0)] ?
                      (reg42 <= reg38) : wire1[(1'h0):(1'h0)]) ?
                  (wire35 ^~ (reg38 | wire0)) : wire35)),
              $unsigned(reg37[(3'h5):(1'h1)])};
        end
      else
        begin
          reg40 <= $unsigned((^~(+(reg37[(2'h2):(1'h0)] ?
              wire36[(4'hc):(1'h0)] : (~|wire3)))));
          reg41 <= (8'hbf);
          reg42 <= $signed(((!($signed(wire0) ?
                  $signed(reg39) : $signed(wire4))) ?
              wire3 : ((((8'hb2) - (7'h41)) ?
                  (-wire0) : wire3[(1'h0):(1'h0)]) == wire5[(1'h1):(1'h1)])));
        end
    end
  assign wire44 = wire4[(1'h0):(1'h0)];
  assign wire45 = ($unsigned(((+reg43) >= ({reg43} ?
                          (|reg43) : (reg39 ? wire4 : reg42)))) ?
                      reg37 : wire5[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg46 <= $unsigned(wire33);
    end
  assign wire47 = $signed(($signed((~|(reg39 ? reg41 : wire2))) * (wire1 ?
                      ((wire35 ? reg43 : reg37) ?
                          $unsigned(reg37) : (reg38 ?
                              reg42 : (8'hac))) : (~|(^reg41)))));
  assign wire48 = $signed(reg42);
  assign wire49 = $unsigned($unsigned($unsigned(reg41)));
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  assign y = {wire32, wire30, wire13, wire12, (1'h0)};
  assign wire12 = $unsigned((-$unsigned($signed(wire8[(3'h4):(2'h3)]))));
  assign wire13 = {wire8[(3'h7):(1'h1)],
                      $unsigned(((^$signed((8'ha4))) ~^ $unsigned(wire7[(2'h2):(1'h0)])))};
  module14 #() modinst31 (.wire17(wire11), .y(wire30), .wire18(wire12), .clk(clk), .wire16(wire8), .wire15(wire9));
  assign wire32 = wire13[(1'h1):(1'h0)];
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 (1'h0)};
  assign wire19 = wire17;
  assign wire20 = (wire19[(4'h9):(2'h3)] ?
                      ((wire17 ~^ (wire19 >> (wire18 ?
                          (8'hbb) : wire18))) - ($signed($unsigned(wire17)) << wire16[(3'h4):(2'h3)])) : wire18);
  assign wire21 = (~&((+$unsigned(wire20[(1'h1):(1'h0)])) && (~&(~^$unsigned(wire15)))));
  assign wire22 = (~(~wire15[(4'h8):(1'h1)]));
  assign wire23 = $unsigned($signed(((wire16[(3'h6):(2'h2)] ?
                      wire20 : wire21[(3'h6):(3'h6)]) << $unsigned(wire21))));
  assign wire24 = (!((~^(|(~&wire21))) ?
                      $signed(((wire18 ?
                          wire20 : wire18) >> $unsigned(wire17))) : wire21));
  assign wire25 = ((($signed(wire19) ?
                              (^~(wire19 ?
                                  wire20 : wire23)) : $unsigned((wire21 | (8'hb1)))) ?
                          wire24[(3'h5):(2'h2)] : $signed({wire24[(4'hd):(1'h1)]})) ?
                      {wire20[(2'h3):(2'h2)]} : $unsigned((+$unsigned($signed(wire18)))));
  assign wire26 = ({$signed(wire22[(2'h3):(2'h3)])} ?
                      $unsigned(($signed(wire24) ?
                          $signed((wire18 < wire19)) : $signed($signed(wire15)))) : ($unsigned(wire24) | (^(!(wire19 * (8'haf))))));
  assign wire27 = ((((-wire25[(2'h2):(2'h2)]) + wire22[(3'h6):(3'h6)]) ?
                      {(8'hb6), (8'h9f)} : (|({wire23} ?
                          wire25 : $unsigned(wire25)))) * ({{$signed(wire25)}} >> wire24));
  assign wire28 = (wire19[(4'hd):(1'h0)] ? wire18 : $unsigned((^wire17)));
  assign wire29 = (~(-$signed(wire22[(3'h6):(3'h6)])));
endmodule
