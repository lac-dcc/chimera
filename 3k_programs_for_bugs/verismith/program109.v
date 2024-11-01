module top
#(parameter param36 = (8'had))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire14;
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire32,
                 wire14,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned($unsigned(wire4));
      reg6 <= $signed($signed($unsigned(wire3)));
      if ($unsigned(reg6[(2'h3):(2'h2)]))
        begin
          if ($unsigned(($signed(wire4) ?
              $unsigned(wire1[(2'h3):(2'h2)]) : ((8'hb6) || $signed($signed((8'hb1)))))))
            begin
              reg7 <= {(reg5[(2'h2):(2'h2)] ~^ $unsigned((wire4[(1'h0):(1'h0)] ?
                      (wire0 ^~ wire3) : (wire0 ? wire2 : reg6))))};
              reg8 <= $unsigned($signed((&{(wire1 + reg6), (!(8'ha6))})));
              reg9 <= wire1[(4'h9):(1'h0)];
              reg10 <= (+reg7);
            end
          else
            begin
              reg7 <= $signed($unsigned(wire4[(2'h2):(1'h0)]));
              reg8 <= $signed((^~($signed(reg6[(4'hf):(3'h4)]) * (-(reg10 ^ wire0)))));
            end
          reg11 <= $unsigned(($unsigned($unsigned(reg5[(1'h1):(1'h1)])) <<< (reg9 <<< ($signed(wire3) * $signed(reg5)))));
        end
      else
        begin
          reg7 <= {reg7[(5'h10):(3'h4)]};
          if ((~{({(reg9 + reg6)} + {(wire2 ? reg5 : wire1), $signed(reg8)})}))
            begin
              reg8 <= ((reg6[(4'hb):(4'hb)] - ($signed((|wire3)) >= reg9)) ?
                  (wire4[(3'h6):(3'h6)] ?
                      reg8[(2'h3):(2'h2)] : $unsigned(((8'h9d) ?
                          (~|reg10) : $unsigned(reg7)))) : $unsigned(reg11[(3'h7):(3'h5)]));
              reg9 <= $signed($unsigned(({$signed(reg7),
                  (reg7 ? wire2 : wire1)} <= (^~reg11[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg8 <= (reg5 ? reg9[(3'h6):(3'h5)] : wire0);
            end
          reg10 <= reg7[(4'ha):(4'h9)];
        end
      reg12 <= $signed((8'hbd));
      reg13 <= (-$signed(($signed($unsigned(reg10)) < (~^(8'ha7)))));
    end
  assign wire14 = reg13[(5'h10):(4'he)];
  module15 #() modinst33 (wire32, clk, reg12, wire4, reg6, reg8, wire3);
  assign wire34 = (~reg9);
  assign wire35 = (-(^~{(reg5 >>> (reg5 * wire3))}));
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = (~|((8'ha8) | (wire16 >>> (&wire19[(3'h6):(3'h5)]))));
  assign wire22 = (!((wire19 ?
                          $signed(wire18[(1'h1):(1'h1)]) : wire19[(3'h6):(3'h5)]) ?
                      $signed($unsigned($unsigned(wire17))) : (!{(-wire16)})));
  assign wire23 = (8'hb4);
  assign wire24 = ({wire18[(1'h0):(1'h0)]} ?
                      wire19[(4'hf):(3'h7)] : (($unsigned((wire16 ^~ wire19)) ^ ((wire17 ?
                              wire16 : wire19) * (wire16 ? (8'hb3) : wire16))) ?
                          ($signed($signed((8'hb6))) | wire17) : {wire17,
                              wire23}));
  assign wire25 = $signed(wire19);
  assign wire26 = (wire25[(1'h1):(1'h0)] ?
                      {(^(~&(wire22 ? wire16 : (7'h40)))),
                          (wire19 << (^{wire24}))} : wire17);
  assign wire27 = wire26[(4'he):(4'hc)];
  assign wire28 = wire20[(4'ha):(1'h0)];
  assign wire29 = $signed($unsigned((wire22 == $unsigned((wire22 ?
                      wire23 : wire22)))));
  assign wire30 = {wire25};
  assign wire31 = wire22[(1'h0):(1'h0)];
endmodule
