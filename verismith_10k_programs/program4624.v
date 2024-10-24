module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire33,
                 wire31,
                 wire19,
                 wire18,
                 wire17,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg35,
                 reg34,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = (wire0 ? (^~wire3) : (&wire4));
  assign wire6 = $unsigned(wire0[(2'h3):(2'h2)]);
  assign wire7 = {(+(+(~^$signed(wire6)))),
                     ($unsigned(((~|wire2) ?
                         $unsigned((8'h9c)) : wire2[(3'h5):(1'h1)])) & wire5[(3'h4):(2'h3)])};
  assign wire8 = wire1[(4'hc):(4'hb)];
  assign wire9 = wire0[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg10 <= (-((8'haa) ?
          (($signed(wire8) ? (~wire4) : wire5[(1'h1):(1'h0)]) ?
              (8'hbe) : $signed((~(8'had)))) : ((8'hb5) >> {(wire9 ^~ wire2)})));
      if (wire9[(3'h6):(3'h5)])
        begin
          reg11 <= {{$unsigned($unsigned(((8'h9d) >> wire5))),
                  wire7[(4'h8):(3'h4)]}};
        end
      else
        begin
          reg11 <= reg10;
          if ((~^{wire9, (wire8 & ((8'h9c) ? wire0 : $signed(wire9)))}))
            begin
              reg12 <= (~reg11[(2'h2):(1'h1)]);
              reg13 <= $signed($unsigned($signed(wire8[(2'h2):(2'h2)])));
            end
          else
            begin
              reg12 <= $unsigned((reg13 ?
                  ((&$unsigned(wire3)) - ($signed(wire9) << $signed((8'hb7)))) : ({$unsigned((8'hae))} ?
                      (^~(+(8'h9d))) : ((wire9 - wire6) <<< ((8'ha7) ?
                          reg10 : reg12)))));
            end
          reg14 <= (7'h44);
        end
    end
  always
    @(posedge clk) begin
      reg15 <= (&(|(8'h9f)));
      reg16 <= $unsigned(wire4[(4'h8):(1'h0)]);
    end
  assign wire17 = wire1;
  assign wire18 = reg16;
  assign wire19 = (+$unsigned(wire3[(4'h9):(3'h6)]));
  module20 #() modinst32 (wire31, clk, wire0, reg11, reg15, wire6);
  assign wire33 = {reg13, $unsigned(reg10)};
  always
    @(posedge clk) begin
      reg34 <= {reg10[(3'h5):(1'h1)], wire0};
      reg35 <= {(((wire3[(4'hf):(4'ha)] >>> (&(8'hb6))) ?
                  ((-wire4) ?
                      reg10[(2'h2):(1'h0)] : (wire0 ?
                          wire3 : (8'ha8))) : {{reg13}}) ?
              (wire6[(3'h5):(1'h1)] || $unsigned((wire0 + wire33))) : (!(~|$unsigned(reg12))))};
    end
  assign wire36 = wire9[(2'h3):(1'h0)];
  assign wire37 = (wire31 == wire19);
endmodule

module module20
#(parameter param29 = (&(+((((8'haf) + (8'ha9)) + {(7'h44)}) ? (~^(~(8'hb9))) : (&((8'hb4) == (8'hbc)))))), 
parameter param30 = {((8'ha1) ? param29 : param29)})
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire24;
  input wire signed [(2'h2):(1'h0)] wire23;
  input wire signed [(4'he):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  assign y = {wire28, wire27, wire26, wire25, (1'h0)};
  assign wire25 = (((wire24[(4'hc):(2'h3)] ?
                          $unsigned(wire21[(4'hc):(3'h6)]) : $unsigned((wire23 << wire22))) | ($signed({wire22}) ?
                          $signed(wire24) : (!$signed(wire22)))) ?
                      (&(($signed(wire22) ?
                              ((7'h40) ? (8'hbe) : wire22) : wire24) ?
                          wire24[(3'h6):(2'h2)] : $signed((wire22 != wire23)))) : $unsigned((wire22 ?
                          $signed((+wire23)) : $unsigned(wire22))));
  assign wire26 = ($unsigned($signed(wire21)) ?
                      wire24 : ($unsigned($unsigned(((8'hae) ?
                              wire23 : wire25))) ?
                          (^{(wire22 ? wire22 : wire23),
                              (wire24 ? wire24 : wire24)}) : $signed({wire22,
                              $unsigned(wire22)})));
  assign wire27 = ($unsigned($unsigned((wire24[(4'ha):(2'h3)] ?
                          $signed(wire23) : {wire25, wire25}))) ?
                      (~(&$unsigned($signed(wire23)))) : wire22[(4'he):(4'hb)]);
  assign wire28 = (|{wire23, $unsigned(wire22)});
endmodule
