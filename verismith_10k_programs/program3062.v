module top
#(parameter param41 = {((7'h42) ? {({(8'hb8), (8'hae)} <<< ((8'ha6) & (8'h9f)))} : (+{(&(8'hae)), ((8'ha9) ? (8'ha5) : (8'hb6))}))}, 
parameter param42 = {(!(((8'had) ? (param41 ? param41 : param41) : (~|param41)) ? param41 : (param41 <= param41)))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire31;
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire4,
                 wire5,
                 wire6,
                 wire31,
                 (1'h0)};
  assign wire4 = wire3[(1'h1):(1'h0)];
  assign wire5 = wire0;
  assign wire6 = (8'hae);
  module7 #() modinst32 (.wire8(wire5), .y(wire31), .wire12(wire4), .wire9(wire2), .wire10(wire3), .wire11(wire0), .clk(clk));
  assign wire33 = (wire31[(3'h6):(1'h0)] >>> (wire6[(3'h4):(1'h0)] ?
                      wire3[(3'h7):(1'h0)] : $unsigned($unsigned((8'hb1)))));
  assign wire34 = (+(~|$signed($unsigned(wire4[(1'h1):(1'h1)]))));
  assign wire35 = (&($signed(($signed(wire33) > $unsigned(wire0))) == $signed((~&(wire33 ?
                      wire6 : wire4)))));
  assign wire36 = $unsigned((wire5 < $signed((&(~|wire3)))));
  assign wire37 = ($signed($unsigned(wire33)) ~^ (^~((wire34 << (wire5 ?
                      wire0 : wire0)) && ((^~wire4) ? (8'hb4) : wire4))));
  assign wire38 = ((wire34 && (+((~^wire3) >= $unsigned(wire2)))) <<< (~^{wire35,
                      wire0[(2'h3):(2'h2)]}));
  assign wire39 = $signed(wire34);
  assign wire40 = wire1[(5'h13):(3'h6)];
endmodule

module module7
#(parameter param30 = ({(&(((8'h9c) ? (8'ha7) : (8'ha6)) >= ((8'hb0) << (7'h44))))} ? ((!(8'hbc)) ? ((~{(8'h9f)}) == (((8'hb0) ? (8'hbc) : (8'hbf)) & ((8'haa) ? (8'h9e) : (7'h40)))) : (~^((^~(8'hae)) ? ((8'hb8) ? (8'hb3) : (8'ha8)) : ((7'h41) ? (8'ha6) : (8'hb1))))) : (^(((~^(8'ha5)) ? {(8'ha2), (8'hbe)} : ((8'h9c) ? (8'ha6) : (7'h43))) ? ({(8'hab)} ? ((7'h44) ? (7'h44) : (8'hbf)) : ((8'haa) >= (8'hab))) : (!(|(8'hb5)))))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  input wire [(3'h4):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire29,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= wire11[(3'h6):(1'h0)];
    end
  assign wire14 = (({((reg13 ? wire9 : wire8) ? $signed(wire11) : wire9),
                              (8'hb8)} ?
                          $unsigned((&(wire12 ^ wire9))) : $signed((((7'h40) && wire12) ?
                              wire9 : (wire10 ? (8'ha1) : wire8)))) ?
                      $unsigned(((wire10[(2'h3):(2'h3)] >> (wire12 ?
                              wire11 : wire12)) ?
                          ((wire9 ^ wire11) >>> (|wire8)) : wire9[(2'h3):(2'h3)])) : (~$unsigned({((8'h9c) + wire8)})));
  assign wire15 = wire14;
  assign wire16 = (^wire15[(1'h1):(1'h0)]);
  assign wire17 = wire8;
  assign wire18 = (~^((wire8[(3'h5):(3'h5)] ?
                          {wire12, $unsigned((8'hbc))} : $signed((7'h40))) ?
                      $signed(((~wire11) ? wire15 : wire11)) : wire14));
  assign wire19 = wire17[(2'h2):(1'h0)];
  assign wire20 = (wire15[(4'h9):(2'h3)] << wire12);
  always
    @(posedge clk) begin
      reg21 <= $signed((wire18[(1'h1):(1'h1)] ?
          (wire18[(1'h0):(1'h0)] & ($signed(wire9) <<< wire16[(3'h4):(1'h0)])) : (wire11[(1'h1):(1'h1)] ?
              wire16 : wire14[(1'h0):(1'h0)])));
      if ((|(+$signed(((wire18 ? wire17 : wire8) ? {wire19} : (~&wire10))))))
        begin
          reg22 <= $signed(wire11);
          reg23 <= (~&$signed($signed({(wire10 << wire18), wire19})));
          reg24 <= (^wire9[(3'h5):(2'h3)]);
          reg25 <= wire20[(1'h0):(1'h0)];
          reg26 <= {wire12[(3'h5):(2'h3)]};
        end
      else
        begin
          reg22 <= reg25;
          if ($unsigned((reg24 ^ (reg23[(2'h3):(1'h1)] ?
              (~(reg26 ? wire18 : wire19)) : {(~^wire19),
                  wire15[(1'h0):(1'h0)]}))))
            begin
              reg23 <= wire16;
              reg24 <= wire20[(4'hd):(4'h8)];
              reg25 <= reg25[(4'hb):(4'hb)];
              reg26 <= $signed((wire9[(3'h5):(2'h2)] ?
                  ($signed((wire10 ?
                      (8'hb3) : wire12)) || ({wire8} ^~ $unsigned((8'hbe)))) : $signed({((8'hb3) || wire16)})));
              reg27 <= $unsigned(($signed({(~^(7'h41)), $signed(wire19)}) ?
                  ((8'ha5) ?
                      (^~(reg25 ?
                          wire16 : wire19)) : wire20[(2'h2):(1'h0)]) : $signed($signed($signed(wire12)))));
            end
          else
            begin
              reg23 <= wire12[(3'h4):(1'h1)];
              reg24 <= wire11;
              reg25 <= ($signed((reg21 ?
                      $signed($unsigned(reg26)) : $signed((reg23 ?
                          wire12 : reg25)))) ?
                  ($unsigned((wire16[(2'h3):(2'h3)] ?
                          $unsigned(reg26) : wire8[(5'h10):(3'h7)])) ?
                      ($unsigned((wire8 >> reg21)) ?
                          (^~$unsigned(wire12)) : reg22) : (8'haa)) : reg24[(4'hd):(3'h6)]);
              reg26 <= $unsigned((+$unsigned((!(wire9 == (8'haf))))));
              reg27 <= ($signed(($signed((wire18 <= wire9)) >>> {wire15,
                  $unsigned(wire16)})) ^~ (wire17 ?
                  ($unsigned($unsigned(wire15)) ~^ (((8'ha0) ?
                      wire14 : wire9) == ((8'hbd) ?
                      reg26 : reg22))) : (wire11[(3'h7):(1'h1)] <<< $signed((wire11 != reg13)))));
            end
        end
      reg28 <= wire16;
    end
  assign wire29 = wire14[(2'h3):(1'h1)];
endmodule
