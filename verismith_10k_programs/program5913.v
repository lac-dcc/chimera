module top
#(parameter param45 = ((((((7'h43) ? (7'h43) : (8'h9d)) ? ((8'hac) ? (8'ha7) : (8'hb7)) : (~|(7'h41))) ~^ ({(8'h9f), (8'hae)} <<< (+(8'hbd)))) && (~&{(-(8'hb5))})) > (((8'h9c) & ((&(8'ha6)) ? ((8'ha1) ? (7'h40) : (8'hb5)) : ((8'hb6) ? (8'hae) : (8'hba)))) && ((|(8'had)) + (((8'ha2) ? (8'ha3) : (8'h9d)) ? (&(8'hae)) : ((8'hb4) && (7'h43)))))), 
parameter param46 = ((^~(((param45 ? param45 : param45) ? (param45 ? param45 : param45) : (+param45)) ? (~{(8'hb0)}) : ((8'haf) ? (|param45) : param45))) != (((~|(param45 ? param45 : param45)) <= ((param45 << param45) & (param45 ? param45 : param45))) | (&(^param45)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire13;
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire39,
                 wire13,
                 reg41,
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
      reg4 <= $unsigned(($unsigned(((7'h41) ~^ (wire2 ? wire0 : wire3))) ?
          wire0[(3'h5):(2'h2)] : (wire1[(3'h7):(3'h7)] ?
              ((^~wire3) ?
                  (wire3 * wire1) : $signed((8'ha3))) : (~|$signed(wire0)))));
      if (({{(wire2 ? wire0 : $unsigned(reg4))}} ?
          (wire3[(3'h4):(1'h1)] || wire2[(3'h6):(1'h0)]) : $signed(wire0[(2'h2):(2'h2)])))
        begin
          reg5 <= wire0[(3'h7):(3'h5)];
        end
      else
        begin
          reg5 <= ((^({(wire1 - wire1),
                  $unsigned(wire0)} >>> ((wire1 ~^ (8'hb5)) == reg5[(2'h2):(2'h2)]))) ?
              wire2 : {(wire1 ? {$signed(wire0)} : $signed($signed(reg4)))});
          reg6 <= $unsigned($unsigned((wire0[(1'h1):(1'h1)] ^~ ($unsigned(wire0) & reg4[(2'h3):(2'h3)]))));
        end
      if ({reg4,
          $unsigned((wire2 ?
              ($signed(wire2) == reg5[(3'h5):(3'h5)]) : (^~(wire1 ?
                  wire0 : wire2))))})
        begin
          reg7 <= (wire1[(3'h5):(3'h4)] ?
              ((wire3[(1'h0):(1'h0)] | (((7'h42) & reg6) ?
                      (wire0 >> wire1) : (8'hba))) ?
                  $signed($signed((reg5 ?
                      wire0 : wire0))) : $signed($signed(wire0))) : (wire0[(2'h2):(1'h0)] ?
                  wire3 : wire2));
          reg8 <= (|(-$signed((8'ha1))));
          if ($unsigned(((wire0[(3'h6):(3'h4)] != reg8) == reg5)))
            begin
              reg9 <= $signed({{$signed($signed(reg4)),
                      ((7'h40) ~^ $signed(reg8))}});
              reg10 <= ((({wire0[(3'h5):(1'h0)]} + $signed(reg5[(2'h2):(1'h1)])) ?
                  $signed($signed($signed((8'hbb)))) : {{reg6}}) >> $unsigned($unsigned(($unsigned(wire3) < ((8'had) ?
                  reg7 : reg4)))));
              reg11 <= reg8;
            end
          else
            begin
              reg9 <= reg5;
              reg10 <= wire0;
            end
        end
      else
        begin
          reg7 <= (~&{(reg4 << {$unsigned(wire1)})});
          reg8 <= ($unsigned(reg6[(1'h0):(1'h0)]) ?
              wire2 : $unsigned((~$unsigned((reg6 ? reg7 : reg8)))));
        end
      reg12 <= (~&(^((reg9[(3'h7):(1'h1)] & (8'hbe)) >>> ($unsigned(reg5) ?
          wire0 : {wire1, reg10}))));
    end
  assign wire13 = $signed({reg12, reg5[(1'h1):(1'h0)]});
  module14 #() modinst40 (wire39, clk, reg5, reg10, reg4, reg6);
  always
    @(posedge clk) begin
      reg41 <= $signed(wire0[(3'h5):(2'h2)]);
    end
  assign wire42 = reg41[(1'h1):(1'h1)];
  assign wire43 = (reg9[(3'h5):(2'h3)] >= $unsigned(reg12));
  assign wire44 = wire13[(4'hc):(3'h5)];
endmodule

module module14
#(parameter param38 = {(({((8'hb5) ? (8'hb3) : (8'ha8)), ((8'ha1) || (8'hbd))} ? (~&((8'haa) << (8'h9c))) : (((8'ha0) <<< (8'hb8)) ? ((8'hba) ? (7'h43) : (8'hb9)) : ((8'hbc) || (8'h9d)))) ? (~(((8'hbe) ^ (8'hb8)) ^~ ((8'hb6) != (8'hbf)))) : ((((8'hba) ? (8'ha7) : (7'h42)) > ((8'ha5) == (7'h44))) | (((8'h9d) ? (8'hbc) : (8'ha9)) ? (~&(8'ha8)) : ((8'hb9) - (8'hb4))))), (~|{(!((8'hb3) ? (8'ha5) : (8'h9c))), (~((7'h44) ? (8'hac) : (8'hba)))})})
(y, clk, wire15, wire16, wire17, wire18);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire34;
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  assign y = {wire37, wire36, wire19, wire21, wire22, wire34, reg20, (1'h0)};
  assign wire19 = wire15[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg20 <= {$signed(wire19[(4'ha):(4'h9)]),
          (|((wire18 ?
              $unsigned(wire17) : (^~(8'hbc))) ^~ wire15[(2'h2):(1'h0)]))};
    end
  assign wire21 = $signed($unsigned(reg20[(3'h4):(3'h4)]));
  assign wire22 = {((&wire15[(2'h3):(1'h0)]) == wire18[(4'h8):(1'h1)]),
                      $unsigned(wire16[(3'h5):(2'h2)])};
  module23 #() modinst35 (wire34, clk, wire15, wire21, wire19, wire22, wire18);
  assign wire36 = (~wire15);
  assign wire37 = wire16[(3'h5):(1'h0)];
endmodule

module module23
#(parameter param33 = ((!{(((8'ha5) & (8'ha7)) - ((8'hba) ? (8'ha7) : (7'h41))), (((8'h9f) ? (8'hb8) : (7'h43)) ? (&(8'hbc)) : (~&(8'hab)))}) ? (((8'hb0) ? ((-(8'hb5)) ? ((8'hbb) ? (8'hbc) : (8'ha5)) : ((8'ha9) * (8'h9d))) : (((8'haf) ? (8'hb8) : (8'hbf)) & ((8'hab) >> (8'hb9)))) << ((((8'hae) ? (8'hb5) : (8'ha1)) ? {(8'hbe)} : ((8'ha9) > (8'ha2))) ? ((^~(8'hbf)) >>> (~(8'haf))) : ((^(8'hb9)) ? ((8'hbc) < (8'hb5)) : ((8'hbd) ? (8'hab) : (8'hbb))))) : ({({(8'ha2), (8'h9f)} ? ((8'hb8) <= (8'h9c)) : (-(8'hb6)))} + (((~(8'ha1)) ? {(8'had)} : ((8'hb6) ? (7'h40) : (8'ha1))) ? (((8'h9d) ? (8'ha0) : (8'had)) >= ((8'hb1) ? (7'h42) : (8'hbd))) : ((~&(8'hbc)) & ((8'h9f) ~^ (8'hb2)))))))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire27;
  input wire [(2'h2):(1'h0)] wire26;
  input wire [(5'h10):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  assign y = {wire32, wire31, wire30, wire29, (1'h0)};
  assign wire29 = $unsigned(((|{(wire26 ? wire28 : wire25)}) ^ wire28));
  assign wire30 = ($signed(({wire24[(1'h0):(1'h0)],
                      wire27} != (8'ha8))) >>> ((~^$unsigned(wire28[(1'h0):(1'h0)])) ?
                      wire27[(2'h2):(1'h0)] : wire25[(2'h3):(1'h0)]));
  assign wire31 = $signed(wire24[(4'hf):(4'hb)]);
  assign wire32 = (^~(^(8'haf)));
endmodule
