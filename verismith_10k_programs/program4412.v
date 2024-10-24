module top
#(parameter param30 = ({(|({(8'hbe), (8'hb8)} ? {(7'h41), (8'hb4)} : (~(8'hb2)))), ((^(~^(8'hbe))) ? ((^~(8'ha5)) ~^ (~^(8'ha1))) : (^~(~^(8'ha6))))} ? (((-(~(8'haf))) >> {((8'hba) ? (7'h40) : (8'ha1)), (^(8'hb4))}) ? (~((8'haa) - ((8'h9e) >>> (8'haf)))) : (+(((8'h9c) >> (8'hb3)) ? ((8'ha7) ? (8'ha2) : (8'hb8)) : {(8'hb3), (8'hbc)}))) : (^((~^((8'ha5) ? (8'hb8) : (8'ha6))) ? (((8'hb9) ? (8'hae) : (8'ha5)) || ((8'hbe) <= (8'ha5))) : (~|((8'hb9) || (8'ha0)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire28;
  assign y = {wire4, wire5, wire6, wire7, wire8, wire9, wire10, wire28, (1'h0)};
  assign wire4 = (+(((wire1[(4'h9):(3'h5)] ?
                         (wire0 <<< wire1) : (wire2 == (7'h43))) ?
                     {(wire0 & (7'h41)), wire3} : ($signed(wire2) ?
                         ((8'hb4) ? wire0 : wire3) : (wire3 ?
                             wire1 : wire1))) && wire2[(2'h3):(2'h2)]));
  assign wire5 = $unsigned(wire3);
  assign wire6 = (8'hbb);
  assign wire7 = ($unsigned(wire6) ?
                     {wire3} : (((~|$signed(wire4)) <<< (8'hb3)) ?
                         (|$signed(wire5)) : wire2));
  assign wire8 = {wire0[(4'hd):(1'h0)]};
  assign wire9 = wire6;
  assign wire10 = (wire6[(4'hc):(4'h8)] ?
                      $unsigned({$signed((wire0 > wire1)),
                          $signed($unsigned(wire5))}) : wire1);
  module11 #() modinst29 (.wire13(wire0), .wire16(wire8), .y(wire28), .wire14(wire2), .wire12(wire4), .clk(clk), .wire15(wire5));
endmodule

module module11
#(parameter param27 = ((~((!(8'hb9)) <<< (&((8'ha3) ? (8'had) : (7'h40))))) != (((((8'ha8) > (8'hbe)) ? ((8'ha2) ? (8'hb3) : (8'hba)) : ((7'h43) ? (8'ha5) : (8'hb5))) ? {(^(8'h9c)), (~(8'ha1))} : (((7'h44) <<< (8'hb6)) ? {(8'hb6)} : ((8'ha7) && (8'ha2)))) ? {((8'ha0) ? ((8'hba) != (8'hb3)) : (8'ha4)), ((-(8'hb5)) >> ((8'h9e) ? (8'hb9) : (8'hae)))} : {(~|((8'hbb) << (7'h44)))})))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  assign y = {wire26,
                 wire18,
                 wire17,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = $unsigned($signed($signed(((wire14 ^~ wire14) <<< (wire16 ?
                      (8'ha7) : wire14)))));
  assign wire18 = (|$unsigned($signed(wire14)));
  always
    @(posedge clk) begin
      reg19 <= (wire16[(4'h8):(1'h0)] <<< $signed(wire13));
      reg20 <= (((wire17[(3'h5):(3'h5)] ^ $unsigned((8'hb5))) & $unsigned(wire17)) & {wire12[(3'h6):(1'h0)],
          wire12[(3'h4):(1'h1)]});
      reg21 <= wire17[(3'h6):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg22 <= (wire14 ?
          (((((8'hbc) + reg20) ? $signed((7'h42)) : wire15) ?
                  {(wire16 * wire18)} : $signed((reg19 >> reg21))) ?
              ($unsigned((^wire16)) ^~ ((~|reg20) >> $unsigned(wire14))) : $signed(wire13[(4'ha):(2'h2)])) : ((wire13 ?
              (~^wire15[(2'h3):(2'h2)]) : (wire12[(3'h6):(1'h1)] | reg20[(4'hb):(1'h1)])) || (({reg21} ?
              reg19 : (^reg21)) >> (~|wire12))));
      reg23 <= $unsigned($signed((+(+$signed(wire13)))));
      reg24 <= ($signed(reg22) ^ (wire14[(4'he):(3'h5)] ?
          $unsigned($unsigned($unsigned(reg20))) : (reg19[(3'h6):(2'h2)] ?
              (+(wire16 ? wire14 : wire17)) : wire14[(3'h4):(3'h4)])));
      reg25 <= (wire18[(5'h12):(4'hd)] ?
          reg23 : (wire15[(1'h0):(1'h0)] ?
              (((~|reg22) ? $signed(reg24) : (8'ha4)) ?
                  ((|wire14) ?
                      wire13 : $signed(reg21)) : (wire17[(3'h4):(2'h2)] ?
                      $signed(reg23) : (wire18 <<< (8'ha7)))) : reg19[(2'h2):(2'h2)]));
    end
  assign wire26 = reg24[(4'hf):(4'hc)];
endmodule
