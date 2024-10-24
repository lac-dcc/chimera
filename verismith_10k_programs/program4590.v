module top
#(parameter param33 = ((((!((8'hb7) ? (8'hb4) : (8'hb8))) ? ((8'ha6) <<< (~(8'hb5))) : (^~((8'ha1) * (7'h43)))) ? (~(~^{(8'h9d)})) : (|(((8'ha8) >>> (8'had)) ? ((8'hbe) >>> (8'ha5)) : ((8'hb0) <= (8'hab))))) ? (((&{(7'h42), (7'h43)}) ? ((~&(8'ha9)) ? {(8'hb0), (8'hba)} : ((8'ha5) ? (8'ha0) : (8'ha3))) : ({(8'hb0), (8'hb7)} ^~ ((8'hbd) ? (8'haf) : (8'ha6)))) ? ((!(|(8'haf))) || (((8'hab) ? (8'h9f) : (8'hae)) ? ((8'hb7) <<< (8'hbc)) : ((8'hba) <<< (8'hbe)))) : (&({(8'hb0)} + (|(8'hb1))))) : ((({(8'ha0), (8'ha9)} ^~ (8'h9e)) > (((7'h43) < (8'h9f)) ? (~(8'had)) : ((8'hba) ? (8'hab) : (8'hbd)))) ? (!{((7'h44) >> (8'hbf))}) : (8'ha3))), 
parameter param34 = (((((param33 & param33) ? (~^param33) : {param33}) * (param33 <<< (param33 ? param33 : (7'h41)))) <<< (((~&param33) ? (^param33) : param33) ? ({param33, (7'h44)} >= (param33 ? param33 : param33)) : param33)) >>> {((~^{param33, (8'ha3)}) * ((~|param33) + (+(8'ha2))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire5,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~^(($unsigned($unsigned(wire3)) ?
          (+$signed(wire3)) : ((~|wire2) ? {wire1, wire3} : wire3)) & (7'h41)));
    end
  assign wire5 = wire2[(5'h13):(1'h1)];
  module6 #() modinst24 (.wire10(wire5), .wire7(wire1), .clk(clk), .wire8(wire0), .wire9(wire2), .y(wire23));
  always
    @(posedge clk) begin
      reg25 <= {(8'hae), wire23};
    end
  always
    @(posedge clk) begin
      reg26 <= (|($unsigned((wire1 ?
          (reg25 < wire3) : (~|wire3))) > wire5[(5'h10):(4'h9)]));
      if (($unsigned($signed((-(|(8'hb1))))) ? wire1 : wire2))
        begin
          reg27 <= $unsigned(reg25);
          reg28 <= $signed(reg26);
          reg29 <= ({((^~(reg26 != wire1)) || reg27)} >> (($signed({wire5,
              reg28}) >>> wire1[(3'h7):(3'h7)]) && reg27));
          reg30 <= (-{(reg29 && $unsigned($unsigned(reg29)))});
        end
      else
        begin
          reg27 <= $signed($signed(wire5[(3'h4):(1'h1)]));
          reg28 <= $unsigned($signed($unsigned(reg26)));
          reg29 <= reg30[(3'h6):(3'h5)];
        end
      reg31 <= (|($signed(((^~reg29) <<< {reg26, reg29})) ?
          ($signed(wire0[(3'h4):(2'h2)]) ?
              $signed({wire23,
                  (8'ha5)}) : $unsigned($signed(reg4))) : (($unsigned(reg29) ?
                  $signed(wire0) : (-wire5)) ?
              reg26 : (wire3[(4'hc):(2'h2)] <<< {(7'h43)}))));
      reg32 <= wire2[(5'h10):(1'h0)];
    end
endmodule

module module6
#(parameter param22 = {((8'hb5) ? ({{(8'hbb)}, (~&(8'hb6))} ? (((8'hbc) != (8'had)) >>> {(8'ha9), (8'hbe)}) : (((8'h9f) ? (8'ha6) : (8'hb8)) ? (^(8'ha2)) : (&(8'hb5)))) : ((!{(7'h43)}) ~^ (((8'hac) ? (8'h9c) : (8'hb1)) & ((8'hb6) < (8'hbb)))))})
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire11;
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire11,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = (+$signed(wire9));
  always
    @(posedge clk) begin
      reg12 <= (~|($signed((((7'h40) + wire9) <<< $signed((8'hb7)))) ?
          $unsigned((8'ha1)) : ((wire7[(3'h4):(1'h1)] ^~ wire7) ?
              $signed((!wire10)) : $unsigned((+wire8)))));
      reg13 <= wire7;
    end
  assign wire14 = $signed(reg12[(4'hb):(3'h4)]);
  assign wire15 = reg13;
  assign wire16 = $signed($signed($unsigned(wire9[(1'h0):(1'h0)])));
  assign wire17 = $unsigned(reg12);
  assign wire18 = reg13[(2'h3):(1'h0)];
  assign wire19 = $unsigned(wire7);
  assign wire20 = (reg12[(2'h2):(1'h1)] ?
                      (~|$unsigned((^~wire14))) : (~&$signed(wire16[(2'h2):(1'h1)])));
  assign wire21 = $signed(((wire8 + {wire14[(3'h4):(1'h0)]}) ?
                      ($unsigned(wire15) ?
                          (((8'hb5) || wire17) ?
                              (^wire20) : {reg12}) : $unsigned(((7'h40) & wire17))) : wire10));
endmodule
