module top
#(parameter param31 = (8'hbc), 
parameter param32 = (({((~^param31) ? (~&param31) : (-param31))} - (((param31 ? param31 : param31) >= param31) ^~ param31)) ? {((-{param31, (7'h42)}) >> param31), {(~^param31)}} : param31))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  reg [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg24,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~^$unsigned(({wire3[(1'h1):(1'h1)]} == wire1[(3'h7):(3'h5)])));
      reg5 <= ($unsigned((^{wire1})) && wire1[(1'h1):(1'h1)]);
      if ({(~|(8'ha7))})
        begin
          reg6 <= (({wire2[(4'hb):(4'h9)],
                      ((wire3 ? wire0 : wire0) ?
                          reg5[(1'h0):(1'h0)] : (~|(8'hb3)))} ?
                  wire1[(1'h0):(1'h0)] : $signed((8'hb8))) ?
              $unsigned($unsigned((~&{wire0,
                  reg5}))) : $signed($unsigned($unsigned((8'hac)))));
          reg7 <= $signed(wire2);
          if (reg4)
            begin
              reg8 <= $signed($unsigned(wire1));
              reg9 <= (((^reg4) ?
                  {(reg6 < (8'ha9))} : ($unsigned(wire2) >= $signed(((8'hb9) ?
                      wire0 : reg4)))) != $signed($signed(((wire1 & reg4) ?
                  (~&reg5) : (|reg7)))));
            end
          else
            begin
              reg8 <= $unsigned($unsigned((8'hb3)));
              reg9 <= ((-(+(reg4[(1'h1):(1'h0)] ?
                      (wire3 ? wire1 : reg5) : {reg5}))) ?
                  ((~($unsigned(wire2) | ((7'h43) ^ reg7))) & wire3[(3'h6):(1'h0)]) : {$unsigned(((reg4 ^~ (8'ha9)) ?
                          (wire0 && wire0) : (8'hb0))),
                      ({(!reg9)} + $unsigned($unsigned((8'hb5))))});
            end
          if ({(|reg5)})
            begin
              reg10 <= reg7[(1'h0):(1'h0)];
              reg11 <= $signed(reg6[(5'h13):(4'h8)]);
              reg12 <= $unsigned(($signed(($signed(reg10) ?
                  {wire0, reg9} : $unsigned(reg10))) << {wire0[(1'h1):(1'h1)],
                  $signed($unsigned(reg7))}));
              reg13 <= $signed($unsigned((~(((7'h41) ? reg6 : reg5) ?
                  reg11 : reg11))));
            end
          else
            begin
              reg10 <= $unsigned(reg9);
              reg11 <= (!(~(wire2 ?
                  (~((8'hac) || reg6)) : ((wire1 ? wire2 : reg7) ?
                      reg11 : wire2[(3'h4):(2'h3)]))));
              reg12 <= (^reg12[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg6 <= {((^~reg10) | $signed(wire0[(1'h1):(1'h1)])), {reg8}};
          reg7 <= (8'hab);
        end
    end
  assign wire14 = (^~reg6[(1'h0):(1'h0)]);
  assign wire15 = wire1[(1'h0):(1'h0)];
  assign wire16 = (-reg10[(1'h0):(1'h0)]);
  assign wire17 = (~^(7'h44));
  assign wire18 = (((reg4 ? ((~|reg9) ? reg5 : reg4) : (8'hb5)) ?
                          (($unsigned(reg8) ~^ $unsigned((8'hbb))) ?
                              reg10 : (8'ha6)) : wire1[(3'h5):(2'h2)]) ?
                      (^~{{reg4[(2'h2):(1'h0)]}}) : (reg4[(1'h0):(1'h0)] - (^$unsigned($unsigned(reg6)))));
  assign wire19 = reg5;
  assign wire20 = reg13;
  assign wire21 = $signed((reg10 ^~ {($unsigned(wire14) ?
                          ((8'ha0) ? reg4 : wire16) : $signed(wire17)),
                      {$signed(reg6)}}));
  assign wire22 = (~&$unsigned((reg6[(5'h10):(4'hd)] ?
                      $signed((reg13 + reg11)) : (wire19 <= (reg11 ?
                          reg11 : reg8)))));
  assign wire23 = {((((wire3 ? wire0 : reg6) ?
                              $unsigned(reg11) : ((8'ha4) ?
                                  (8'hb2) : (8'hac))) ?
                          $unsigned($unsigned(wire20)) : (reg13[(2'h2):(1'h0)] && $signed(reg12))) * (^wire15[(5'h13):(4'h9)]))};
  always
    @(posedge clk) begin
      reg24 <= (|(wire17 >= (reg4 ?
          wire18 : ($signed(wire23) ?
              ((8'hb5) || reg12) : reg10[(2'h3):(1'h0)]))));
    end
  assign wire25 = reg12[(4'hc):(4'h8)];
  assign wire26 = ($signed(wire20) ?
                      (+($unsigned((wire23 + wire21)) - ((reg7 ?
                              reg10 : reg10) ?
                          reg24 : wire0))) : ((~|{wire19[(2'h3):(2'h2)]}) >= $unsigned($unsigned($unsigned(wire14)))));
  assign wire27 = (reg4 - wire21[(1'h1):(1'h1)]);
  assign wire28 = (-(+{($signed(wire27) - $signed(reg10))}));
  assign wire29 = (reg24[(5'h10):(5'h10)] << (~|(((reg11 ? reg13 : wire23) ?
                      (wire16 | (8'hb7)) : (wire2 < wire14)) ^ $signed($unsigned(wire1)))));
  assign wire30 = {(($unsigned((wire14 >>> reg7)) > reg10) >>> $unsigned(reg8[(3'h4):(1'h0)]))};
endmodule
