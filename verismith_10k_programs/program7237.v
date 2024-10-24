module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire47;
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire5,
                 wire47,
                 (1'h0)};
  assign wire5 = wire2;
  module6 #() modinst48 (wire47, clk, wire2, wire3, wire4, wire1, wire0);
  assign wire49 = $signed(wire3);
  assign wire50 = {$unsigned({($unsigned((8'h9c)) ? $signed(wire1) : (^wire0)),
                          {wire47[(2'h2):(1'h1)], (wire4 * wire3)}}),
                      (~(~^(~^$unsigned(wire3))))};
  assign wire51 = (7'h41);
  assign wire52 = wire51;
  assign wire53 = wire47[(2'h2):(1'h1)];
  assign wire54 = wire2;
  assign wire55 = wire0[(5'h10):(2'h3)];
  assign wire56 = (($unsigned(((wire47 ?
                          wire51 : wire54) && wire47[(2'h2):(1'h0)])) ?
                      wire2 : (wire55[(3'h4):(2'h3)] < wire53)) >> ({((8'ha2) > wire53),
                      $unsigned(wire5)} - $signed($unsigned($unsigned((7'h44))))));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire32;
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  module12 #() modinst33 (wire32, clk, wire9, wire11, wire10, wire7, wire8);
  assign wire34 = (^$unsigned(wire9[(1'h0):(1'h0)]));
  assign wire35 = wire9[(3'h4):(1'h0)];
  assign wire36 = (+$unsigned(wire32));
  assign wire37 = $unsigned(wire11[(5'h11):(2'h2)]);
  assign wire38 = (-(+$signed($unsigned($signed(wire10)))));
  always
    @(posedge clk) begin
      reg39 <= $unsigned(wire9[(2'h3):(2'h3)]);
      if ((8'ha3))
        begin
          reg40 <= $unsigned($unsigned($signed(wire35)));
        end
      else
        begin
          reg40 <= wire8[(5'h13):(4'h8)];
          reg41 <= $unsigned(wire32[(2'h3):(2'h2)]);
          reg42 <= {$unsigned($signed((~|wire32[(1'h0):(1'h0)]))),
              (wire8[(4'hd):(2'h3)] * $signed(wire10))};
          reg43 <= $signed($unsigned(reg42));
          if ($unsigned($unsigned(wire8[(2'h3):(2'h3)])))
            begin
              reg44 <= $unsigned($signed((!(~|(wire7 ? reg40 : reg41)))));
            end
          else
            begin
              reg44 <= wire11[(3'h7):(1'h1)];
              reg45 <= $unsigned($unsigned(((wire36 ?
                  (wire32 ? wire35 : (8'ha1)) : (reg39 ?
                      wire37 : (8'hba))) >= $unsigned(wire7[(4'h8):(1'h1)]))));
            end
        end
      reg46 <= $unsigned(reg39);
    end
endmodule

module module12
#(parameter param30 = ((({{(8'hbb), (8'hbe)}, {(8'ha1), (7'h41)}} ? (!{(8'hbc), (8'hbb)}) : (((8'hbe) ? (8'hb1) : (8'haa)) ? ((8'ha7) || (7'h42)) : (^~(8'ha8)))) ? {((~|(8'ha3)) | ((8'hab) ? (7'h43) : (8'hac)))} : (((-(7'h40)) ^~ ((7'h40) == (8'hbd))) | (+((8'hb0) ? (8'h9e) : (8'hb8))))) & (((((8'hb7) ? (8'hb9) : (8'h9c)) ? ((8'hae) != (8'h9c)) : ((8'ha0) * (7'h42))) >>> (7'h44)) ^~ (8'hbe))), 
parameter param31 = ({(&(+((8'hbd) ^ param30)))} ? (((param30 ? (-(8'hbc)) : (8'hb6)) * (param30 > param30)) ^ (((param30 ? param30 : param30) && (param30 ? param30 : (8'ha3))) ? (|param30) : (&(param30 * (8'h9d))))) : (|(+({param30, (8'h9f)} > (param30 != param30))))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire [(3'h4):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  assign y = {wire29,
                 wire25,
                 wire19,
                 wire18,
                 reg28,
                 reg27,
                 reg26,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire18 = ({(+(wire16[(2'h2):(2'h2)] ?
                              (wire13 ?
                                  wire16 : wire17) : $unsigned(wire15)))} ?
                      wire14[(2'h2):(1'h0)] : wire16[(1'h1):(1'h1)]);
  assign wire19 = wire17;
  always
    @(posedge clk) begin
      if ({$unsigned($signed(wire13))})
        begin
          reg20 <= $unsigned({{$signed(wire19)}, $signed($signed((|(7'h40))))});
          reg21 <= wire15[(2'h3):(1'h0)];
          reg22 <= $unsigned(wire19);
        end
      else
        begin
          reg20 <= ((&$signed($unsigned((+reg22)))) ^~ ({({wire14,
                      wire17} != reg21[(3'h7):(2'h3)])} ?
              wire18[(4'hd):(4'ha)] : wire19));
          reg21 <= {{(({wire16,
                      reg20} + (wire15 >= wire13)) ^~ reg20[(4'hc):(3'h6)]),
                  wire16},
              $unsigned((|$unsigned((-reg22))))};
        end
      reg23 <= (^~wire18);
      reg24 <= $unsigned($signed(wire15[(4'h9):(4'h9)]));
    end
  assign wire25 = {((^~reg21[(1'h1):(1'h1)]) ?
                          reg24 : $signed((~|reg24[(1'h0):(1'h0)])))};
  always
    @(posedge clk) begin
      reg26 <= ((($signed($signed(wire17)) & reg23[(1'h0):(1'h0)]) * {((wire18 && (8'hb3)) ?
                  $unsigned(wire18) : $unsigned(reg24))}) ?
          {((reg24[(3'h5):(3'h4)] >>> reg23[(4'ha):(3'h5)]) <<< ($unsigned(reg22) - (~|wire15)))} : reg22);
      reg27 <= $unsigned(wire13);
      reg28 <= $unsigned((&{{reg24[(2'h2):(2'h2)], wire15},
          (reg20[(4'ha):(1'h0)] | (~&reg21))}));
    end
  assign wire29 = $unsigned(($signed($unsigned(wire16[(1'h1):(1'h0)])) ?
                      wire15 : wire14));
endmodule
