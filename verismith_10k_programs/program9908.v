module top
#(parameter param41 = ((((((8'h9e) + (8'hb9)) ? (^~(8'h9e)) : {(8'hb0)}) ? {{(8'hbc), (8'ha4)}, (^~(8'hb0))} : (~((8'hb5) - (8'hb2)))) > (8'haa)) ? (~&((((8'hbd) ? (8'ha6) : (8'haa)) ? (^(7'h40)) : (~^(8'hb0))) && (((8'ha7) != (8'hb4)) >> ((8'h9e) ^ (8'ha8))))) : {(|(^(~^(8'ha0)))), (~|((^(8'haa)) && ((8'ha9) + (8'ha6))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire30;
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  assign y = {wire40,
                 wire34,
                 wire33,
                 wire32,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire30,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire5 = (($unsigned($signed(wire4[(2'h2):(1'h1)])) ?
                         ($unsigned({wire1, wire0}) < ((wire2 ? wire3 : wire1) ?
                             $signed(wire4) : wire0[(5'h10):(4'h9)])) : (&($unsigned(wire4) ^ wire4))) ?
                     wire4[(3'h4):(2'h3)] : wire0);
  assign wire6 = (wire2[(2'h3):(2'h3)] ?
                     $unsigned((((wire4 ? wire1 : wire1) ~^ (8'hb0)) ?
                         (~wire0) : wire3[(1'h1):(1'h0)])) : wire1);
  assign wire7 = wire0;
  assign wire8 = $signed(($signed(wire7) ? wire1[(4'h9):(4'h8)] : wire5));
  assign wire9 = (8'hba);
  assign wire10 = (($signed(wire2[(3'h6):(3'h5)]) != (7'h43)) != (&(|($unsigned(wire7) >= $unsigned(wire4)))));
  assign wire11 = $signed((^($signed(wire6[(4'h9):(2'h3)]) ?
                      $signed((~wire1)) : {$unsigned(wire2), {wire5}})));
  module12 #() modinst31 (.wire16(wire8), .y(wire30), .wire15(wire6), .wire17(wire3), .wire14(wire1), .clk(clk), .wire13(wire7));
  assign wire32 = $signed((8'ha3));
  assign wire33 = wire5[(3'h7):(3'h6)];
  assign wire34 = ($signed((8'h9f)) && $signed($signed($signed(wire0[(4'hd):(2'h2)]))));
  always
    @(posedge clk) begin
      reg35 <= $unsigned((^~{(-$signed((7'h44)))}));
      reg36 <= (~$unsigned(wire2));
      reg37 <= $signed(((&(^wire32[(1'h1):(1'h1)])) ? wire9 : (~|(8'ha2))));
      reg38 <= $signed((7'h44));
      reg39 <= wire9[(4'hc):(2'h3)];
    end
  assign wire40 = wire10[(3'h5):(3'h4)];
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(4'hd):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire18;
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire18,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = {wire13,
                      ($signed($unsigned(((8'hb6) ? wire15 : (8'hbc)))) ?
                          (((^wire14) * (wire15 | wire15)) << ((-wire15) ?
                              (+wire15) : wire14)) : $unsigned(wire17[(4'ha):(4'h9)]))};
  always
    @(posedge clk) begin
      reg19 <= $unsigned($signed(wire14[(3'h4):(1'h1)]));
      reg20 <= $signed({(|wire18)});
      reg21 <= wire17;
      reg22 <= ((+((|(wire17 ~^ wire13)) ?
          $unsigned((8'h9e)) : (reg20 ?
              $unsigned(reg19) : (~|wire14)))) | (wire18 ?
          ((wire14[(2'h2):(1'h0)] && $signed(wire16)) * wire14) : {$signed(((8'ha4) <<< reg21)),
              ((wire17 ? wire15 : reg21) - (wire15 ? reg20 : reg21))}));
      if ((($signed(reg19) ?
          {reg22,
              (-$signed(reg20))} : reg22) | ((-({(8'hac)} ^ $signed(wire13))) ?
          $unsigned($unsigned($unsigned(reg21))) : ($signed($signed(reg19)) << reg22[(3'h4):(3'h4)]))))
        begin
          reg23 <= (wire15 - (((reg22[(1'h0):(1'h0)] < (wire14 || wire15)) >>> ($unsigned(wire16) ?
              ((8'ha4) ? reg22 : wire13) : (reg22 ?
                  reg22 : reg22))) >= (reg20[(4'hb):(2'h3)] < ($unsigned(wire14) ?
              $unsigned((8'hbb)) : (~^wire18)))));
        end
      else
        begin
          if (reg23[(3'h5):(3'h5)])
            begin
              reg23 <= reg20[(4'ha):(4'ha)];
            end
          else
            begin
              reg23 <= $unsigned($unsigned((wire15[(3'h5):(3'h5)] ~^ (((7'h43) ?
                  wire13 : wire17) == wire13))));
              reg24 <= (wire13 > wire16);
            end
          reg25 <= (~|wire15);
          if ($signed($unsigned(($unsigned((reg20 ?
              reg23 : (8'hbc))) < wire16[(4'ha):(2'h3)]))))
            begin
              reg26 <= {(^wire13), (~^$signed((!$unsigned(wire13))))};
              reg27 <= wire17;
            end
          else
            begin
              reg26 <= reg23[(3'h5):(1'h1)];
            end
        end
    end
  assign wire28 = wire13;
  assign wire29 = reg25[(4'h8):(4'h8)];
endmodule
