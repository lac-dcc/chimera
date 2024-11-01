module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $unsigned((-(~^$signed((wire1 ? wire4 : wire3)))));
  assign wire6 = (((|wire1[(4'he):(4'hd)]) + wire4) ?
                     $unsigned(($unsigned((^wire5)) <<< $signed((wire1 != wire3)))) : wire0);
  assign wire7 = (8'h9f);
  assign wire8 = $signed(wire1);
  module9 #() modinst48 (wire47, clk, wire7, wire0, wire1, wire8);
  assign wire49 = ((&($signed($unsigned(wire0)) ?
                          wire47[(1'h0):(1'h0)] : wire3[(4'ha):(1'h1)])) ?
                      wire5[(3'h4):(3'h4)] : wire0);
  assign wire50 = $signed({wire1, wire8});
  assign wire51 = ((+wire49) ?
                      $signed(wire5[(4'h9):(1'h0)]) : $signed(((wire49 >= $unsigned(wire2)) ?
                          (wire0[(3'h4):(1'h1)] ?
                              $signed(wire6) : $unsigned((8'hbe))) : wire3)));
  assign wire52 = (wire3 ?
                      ($unsigned((7'h40)) ?
                          $signed($signed((wire1 <= (8'hbc)))) : (-$unsigned($signed(wire4)))) : ({wire7[(5'h11):(3'h4)]} ?
                          wire2 : wire0[(2'h2):(1'h1)]));
  assign wire53 = ((~($signed(((8'ha6) ? wire51 : wire5)) ?
                          (~&(^~wire51)) : (!wire5[(2'h2):(2'h2)]))) ?
                      (^{(8'ha8)}) : wire51);
endmodule

module module9
#(parameter param45 = (+({((-(8'hbe)) ? (^~(7'h40)) : (!(8'ha4)))} ? ((8'haf) | ((~|(7'h44)) ? (~&(8'haa)) : (~^(8'ha5)))) : ((&{(8'h9e)}) >= (-((8'ha4) > (8'hb1)))))), 
parameter param46 = (param45 != {{(&(~param45))}, (param45 ? ({param45} - (param45 ? (8'ha6) : param45)) : (^~(param45 ? param45 : param45)))}))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire14;
  assign y = {wire44, wire43, wire42, wire41, wire39, wire14, (1'h0)};
  assign wire14 = ($signed($unsigned(wire12[(4'he):(2'h3)])) ?
                      wire10 : (~^wire11[(2'h3):(2'h3)]));
  module15 #() modinst40 (wire39, clk, wire14, wire10, wire13, wire12);
  assign wire41 = wire11[(4'ha):(1'h1)];
  assign wire42 = $signed($unsigned((8'hb5)));
  assign wire43 = wire41;
  assign wire44 = $signed((wire42[(5'h15):(5'h13)] ?
                      $signed(wire12[(4'he):(4'he)]) : {wire11,
                          {wire39[(1'h1):(1'h0)], $signed(wire42)}}));
endmodule

module module15
#(parameter param38 = (-(|((((8'ha0) <= (8'h9c)) ? (^~(7'h43)) : ((8'hb7) ? (8'hb9) : (8'ha4))) & ({(8'hb5), (8'hb7)} ? (&(8'hb4)) : (7'h41))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire31,
                 wire30,
                 reg33,
                 reg32,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed((~^$unsigned(wire16[(4'ha):(1'h0)]))) ?
          wire17 : $signed($unsigned((&(wire19 == wire17))))))
        begin
          reg20 <= {$signed($unsigned($signed(wire19)))};
          if ((reg20 ? wire19[(1'h1):(1'h1)] : reg20))
            begin
              reg21 <= $signed(({{(~wire16), $signed(wire19)},
                      $unsigned(wire17)} ?
                  reg20 : $unsigned($signed((wire16 ? wire18 : wire17)))));
            end
          else
            begin
              reg21 <= $signed($signed($signed((~&(reg20 ? wire16 : wire19)))));
              reg22 <= $signed(wire16[(3'h6):(1'h0)]);
              reg23 <= {{reg20}, $signed(reg21[(3'h4):(2'h2)])};
            end
          if (reg20[(2'h2):(1'h0)])
            begin
              reg24 <= $unsigned((+(($signed(wire17) < (wire19 ?
                      reg23 : (8'hb2))) ?
                  reg21[(2'h2):(1'h0)] : ({reg23} ?
                      ((8'hb4) ? wire16 : reg20) : $signed(wire16)))));
              reg25 <= $signed(wire19[(3'h4):(2'h2)]);
              reg26 <= $unsigned((7'h41));
              reg27 <= reg25[(1'h0):(1'h0)];
              reg28 <= $unsigned($signed((reg25 >> $signed($unsigned((8'ha9))))));
            end
          else
            begin
              reg24 <= {$signed((+{{reg24, reg27}})),
                  (-($unsigned(reg23) > {(reg24 ? reg24 : reg22),
                      (wire18 ? reg23 : reg28)}))};
              reg25 <= wire17;
              reg26 <= ($signed(reg22) << $unsigned(({wire18[(2'h3):(2'h3)],
                  reg24[(2'h3):(2'h3)]} && $unsigned(reg23[(2'h2):(1'h0)]))));
              reg27 <= {(|{($unsigned(wire16) ?
                          (reg26 + reg25) : {(8'ha5), (8'hbd)})})};
            end
        end
      else
        begin
          if (reg21[(2'h3):(2'h3)])
            begin
              reg20 <= $unsigned($unsigned(($unsigned((^~reg20)) ?
                  reg22 : ($signed((8'h9f)) ?
                      (reg27 < (8'hac)) : $unsigned((8'h9f))))));
              reg21 <= (+(^reg27));
              reg22 <= (^reg20[(2'h3):(1'h0)]);
            end
          else
            begin
              reg20 <= reg20;
            end
          reg23 <= wire16[(4'hc):(3'h7)];
        end
      reg29 <= $signed(reg26[(3'h4):(1'h1)]);
    end
  assign wire30 = ($unsigned(reg28[(3'h7):(3'h6)]) & reg29);
  assign wire31 = reg26[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg32 <= reg21[(1'h0):(1'h0)];
      reg33 <= $signed(({$unsigned((wire30 ? reg22 : reg20)),
          ($signed(wire16) >> (reg29 ?
              reg20 : reg22))} <= wire19[(4'h9):(4'h8)]));
    end
  assign wire34 = (+wire18);
  assign wire35 = reg20;
  assign wire36 = wire18;
  assign wire37 = wire19;
endmodule
