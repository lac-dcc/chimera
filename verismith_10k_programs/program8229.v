module top
#(parameter param58 = ((8'hae) ? ((((^~(8'hac)) ? ((8'hbd) <= (8'h9f)) : ((8'hb7) ? (8'hb7) : (8'ha2))) <<< {((7'h41) << (8'ha0))}) <= {(((7'h43) ? (8'hbe) : (8'hb2)) << ((8'ha7) ? (8'hae) : (8'hab))), (!((8'ha1) < (8'ha9)))}) : (+{((~(8'hae)) ? {(8'hbf)} : (+(8'hbe))), ({(8'hbe)} >= {(8'haf)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire16;
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire50,
                 wire16,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2;
      reg6 <= (wire3[(2'h2):(2'h2)] ^ (({wire2,
          $unsigned(reg5)} ~^ $signed((|wire3))) ~^ wire4[(2'h2):(2'h2)]));
      if ((8'ha4))
        begin
          if (wire0)
            begin
              reg7 <= $signed(($signed((reg5 ^~ wire0)) ?
                  (reg5 ^ wire1[(1'h1):(1'h1)]) : {$signed((^(8'hae))),
                      (^~(wire4 ? (7'h41) : reg6))}));
            end
          else
            begin
              reg7 <= {(~$unsigned(reg6))};
            end
          reg8 <= (((-(~&(reg6 | wire0))) ?
              reg6[(3'h5):(2'h2)] : wire3[(2'h3):(1'h0)]) >> (wire1 ?
              wire4 : (reg7 ?
                  (+$signed(wire2)) : $signed(wire2[(2'h3):(2'h3)]))));
          reg9 <= $unsigned({$unsigned((wire0 ? (reg6 >= wire1) : (-reg6))),
              ((~&reg8) ?
                  ($signed(wire2) ? $unsigned(wire3) : (~&reg5)) : reg6)});
        end
      else
        begin
          reg7 <= reg5;
          if (wire0)
            begin
              reg8 <= ({(8'hb9)} >>> wire4[(2'h3):(2'h2)]);
              reg9 <= ($unsigned($signed(($unsigned(wire1) ~^ {(7'h43)}))) * reg6);
            end
          else
            begin
              reg8 <= reg9[(1'h1):(1'h1)];
            end
        end
      if ((wire1[(2'h2):(2'h2)] ?
          ((reg9 ?
              reg8[(4'hd):(3'h5)] : (!wire0[(2'h2):(1'h1)])) >> (($unsigned(reg6) ?
                  {(8'had)} : reg9) ?
              $signed($unsigned(reg7)) : reg9[(2'h3):(2'h2)])) : (&((wire0[(3'h6):(3'h5)] ?
                  (&reg8) : wire1[(3'h4):(3'h4)]) ?
              wire0 : ((|reg8) ? $signed(reg5) : (wire0 ? reg8 : (8'hb8)))))))
        begin
          reg10 <= wire3;
          if (wire2[(2'h2):(1'h1)])
            begin
              reg11 <= $signed(wire4[(1'h0):(1'h0)]);
              reg12 <= ({(!(&wire3[(1'h0):(1'h0)])),
                      ((((8'hb2) < wire4) && wire4) | reg9)} ?
                  ((~^($unsigned(reg9) <= reg5)) >>> ($signed({wire1,
                      wire4}) && (^((8'hb4) ?
                      reg7 : (8'hb2))))) : (-wire2[(1'h1):(1'h1)]));
            end
          else
            begin
              reg11 <= {$signed(wire4[(1'h1):(1'h1)])};
              reg12 <= reg7[(1'h0):(1'h0)];
              reg13 <= reg6;
              reg14 <= (reg11[(4'ha):(3'h7)] ~^ {$signed($signed((reg5 ?
                      reg9 : reg8))),
                  ($signed(wire1[(1'h1):(1'h1)]) >> (-(wire4 || (8'hb8))))});
            end
        end
      else
        begin
          reg10 <= $unsigned({({(~&reg14)} - (wire4[(2'h3):(2'h3)] * {wire4,
                  wire2}))});
          reg11 <= wire4;
        end
      reg15 <= $signed(reg12[(1'h0):(1'h0)]);
    end
  assign wire16 = (^~wire2[(1'h1):(1'h1)]);
  module17 #() modinst51 (wire50, clk, reg14, reg13, reg7, reg8);
  always
    @(posedge clk) begin
      reg52 <= reg8;
      reg53 <= reg10[(4'hb):(3'h4)];
      reg54 <= wire0[(3'h7):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg55 <= reg7[(4'hc):(2'h3)];
      reg56 <= $signed({$unsigned(reg10[(1'h0):(1'h0)]),
          ((reg8[(5'h10):(3'h5)] ?
                  ((8'hbf) == wire0) : (wire1 ? reg6 : reg52)) ?
              $unsigned((reg9 ? reg9 : reg54)) : $unsigned(((8'hab) ?
                  wire0 : reg13)))});
      reg57 <= $signed($signed($unsigned($unsigned((~&wire50)))));
    end
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire21;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire [(4'hb):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  assign y = {wire49,
                 wire47,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 (1'h0)};
  assign wire22 = $signed($signed(wire21[(2'h2):(1'h1)]));
  assign wire23 = wire20;
  assign wire24 = wire22;
  assign wire25 = wire21[(1'h0):(1'h0)];
  assign wire26 = (({({wire19} ?
                          (!wire19) : $signed(wire22))} > ((~&$signed(wire24)) << wire18[(3'h4):(3'h4)])) ^ (&wire19));
  assign wire27 = wire18;
  assign wire28 = {{(~&(~wire27[(2'h3):(1'h1)]))}, wire26};
  assign wire29 = (&wire26);
  assign wire30 = $unsigned((-wire24[(3'h4):(2'h3)]));
  assign wire31 = $signed(wire26);
  module32 #() modinst48 (.wire34(wire31), .wire33(wire22), .clk(clk), .y(wire47), .wire36(wire19), .wire35(wire25));
  assign wire49 = $unsigned(wire28);
endmodule

module module32
#(parameter param45 = ((-{((~^(8'hb1)) ? ((7'h43) ? (8'hab) : (8'h9d)) : ((8'hbc) ? (8'hb3) : (8'ha8)))}) >>> ((-(((8'h9f) + (8'hb8)) | ((8'hb6) ? (8'ha0) : (8'hbc)))) ? {(((8'ha8) <<< (8'hab)) ? (^~(8'ha7)) : {(8'hb1), (7'h40)}), (((8'ha4) > (8'hae)) ? (^~(8'ha1)) : ((8'hb0) ? (8'hb4) : (8'haf)))} : (((^~(8'hb0)) && ((7'h44) ? (8'h9c) : (8'ha0))) ? (^~((7'h42) ? (8'hab) : (8'ha6))) : (((8'haf) || (8'had)) ? ((8'hb5) ? (8'hac) : (8'hbe)) : (~^(8'hb9)))))), 
parameter param46 = {{(param45 >> ((&param45) ? (param45 ? param45 : param45) : {param45, param45})), {(~|(param45 ? param45 : param45))}}})
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire36;
  input wire [(2'h3):(1'h0)] wire35;
  input wire signed [(5'h11):(1'h0)] wire34;
  input wire [(4'h9):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 (1'h0)};
  assign wire37 = {wire35, wire33};
  assign wire38 = wire35[(2'h3):(1'h0)];
  assign wire39 = (+wire38);
  assign wire40 = ($signed($signed({$unsigned(wire33), wire33})) + wire36);
  assign wire41 = (($signed({(wire38 || wire38), $signed(wire35)}) ?
                          ((~(wire35 || wire34)) ?
                              $signed($unsigned(wire40)) : $unsigned((wire40 > wire36))) : (^wire35)) ?
                      wire33 : (($unsigned($signed(wire37)) < (&{wire37})) <= ((wire33[(3'h4):(2'h2)] ?
                              (+wire33) : wire38[(4'h8):(3'h6)]) ?
                          $unsigned($signed(wire39)) : wire36)));
  assign wire42 = (($unsigned(($unsigned(wire39) ?
                          wire36[(1'h1):(1'h0)] : (wire35 ? wire38 : wire41))) ?
                      (wire38[(2'h3):(2'h3)] - wire36) : (wire34 >> (8'ha6))) <= wire41[(2'h3):(2'h3)]);
  assign wire43 = (^{(-(wire38 ^ ((8'hb1) ? wire40 : wire35)))});
  assign wire44 = wire37[(4'hc):(4'hb)];
endmodule
