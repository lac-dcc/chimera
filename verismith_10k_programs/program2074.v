module top
#(parameter param52 = {((~&({(8'hb3)} >> ((8'h9e) | (8'ha7)))) ? (8'hbc) : ((|{(8'ha7)}) | (~|((8'hb5) & (8'hbc)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire25;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 (1'h0)};
  module4 #() modinst26 (wire25, clk, wire0, wire1, wire3, wire2);
  assign wire27 = wire0;
  assign wire28 = ($unsigned(wire27) ?
                      wire1 : (((wire2 >>> (wire3 ~^ (7'h44))) && $signed(wire0[(4'ha):(1'h0)])) ^ wire3));
  assign wire29 = (^~{{$unsigned({wire0})}});
  assign wire30 = $signed(wire2);
  module31 #() modinst43 (.clk(clk), .wire32(wire28), .wire33(wire30), .y(wire42), .wire35(wire27), .wire34(wire25));
  assign wire44 = wire30;
  assign wire45 = $signed(((((wire0 ?
                      wire0 : wire1) - $unsigned((8'hb0))) ^~ (-wire29)) > (8'hb1)));
  assign wire46 = ($unsigned($unsigned((8'ha2))) ?
                      $signed($signed($signed($signed(wire44)))) : wire0[(4'h9):(3'h7)]);
  assign wire47 = $unsigned(($unsigned($signed($unsigned(wire45))) ?
                      wire30[(3'h4):(2'h3)] : wire27[(3'h5):(3'h5)]));
  assign wire48 = $signed($unsigned(($unsigned({wire30}) ?
                      (((8'hb8) ?
                          wire30 : wire29) > (8'haa)) : ((wire44 == wire2) == $signed(wire0)))));
  assign wire49 = (^~$unsigned($unsigned(wire46[(4'h8):(2'h3)])));
  assign wire50 = {(-wire30)};
  assign wire51 = $signed(wire30);
endmodule

module module31
#(parameter param40 = {{((-{(8'ha3)}) ? ((8'ha8) >> (~(8'ha3))) : ({(8'hb9)} ? (8'hbb) : ((8'hb5) <<< (7'h43))))}}, 
parameter param41 = param40)
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire35;
  input wire signed [(5'h11):(1'h0)] wire34;
  input wire [(4'hb):(1'h0)] wire33;
  input wire [(5'h15):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  assign y = {wire39, wire38, wire37, wire36, (1'h0)};
  assign wire36 = (&($unsigned(wire34[(4'h9):(1'h1)]) ?
                      $signed((~^$unsigned(wire33))) : $signed((((8'hbe) <<< wire35) <= wire32))));
  assign wire37 = ($signed((((~&wire36) || {wire36, (8'ha8)}) > $signed({wire32,
                      wire34}))) < wire32);
  assign wire38 = $unsigned($unsigned({wire36[(3'h7):(1'h0)]}));
  assign wire39 = wire35;
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire9 = $unsigned({(({wire8, wire5} ?
                         ((8'ha2) ?
                             wire7 : (8'ha6)) : $unsigned(wire5)) || wire6)});
  assign wire10 = (wire9 < (wire6[(3'h7):(2'h2)] + wire7[(3'h5):(1'h0)]));
  assign wire11 = wire6;
  assign wire12 = (!(~|(^~$signed($signed(wire10)))));
  always
    @(posedge clk) begin
      if (($unsigned((wire6[(4'ha):(3'h7)] ?
          $signed((wire12 && wire11)) : $unsigned(((8'ha9) + wire7)))) <<< (+$signed({$signed((8'hb2)),
          wire11}))))
        begin
          if (($unsigned(wire9) ?
              ($unsigned(wire12) ?
                  wire12 : $signed(wire7)) : $unsigned(($unsigned(wire9) ?
                  wire6 : ($unsigned(wire7) < (|wire6))))))
            begin
              reg13 <= (wire10[(4'hc):(4'h8)] >>> wire8[(2'h3):(2'h3)]);
              reg14 <= wire9;
              reg15 <= $signed(((!$unsigned($signed(wire9))) ?
                  wire6 : (!$unsigned((|wire5)))));
            end
          else
            begin
              reg13 <= wire7;
            end
          if ($unsigned($unsigned(({{(8'ha0), (8'hb4)}, (wire11 ^ wire7)} ?
              (~^$signed(wire8)) : {{wire10}}))))
            begin
              reg16 <= wire12;
              reg17 <= $unsigned($signed($signed(($unsigned(reg14) ?
                  $unsigned(wire5) : $unsigned(wire7)))));
              reg18 <= {{(~|$unsigned((wire11 ? reg16 : wire5)))}};
            end
          else
            begin
              reg16 <= {(reg17[(4'ha):(1'h0)] ?
                      $signed((reg17 ?
                          (!(8'ha4)) : (wire7 ? wire5 : reg17))) : reg14)};
              reg17 <= $signed({reg15,
                  (reg14 | (wire10[(5'h10):(3'h4)] > {reg14, wire8}))});
              reg18 <= (~$signed($unsigned({$signed((8'hbf)),
                  (wire8 + (8'h9c))})));
              reg19 <= (~^$signed(wire9));
              reg20 <= ((8'hb3) >> (&$signed(((wire12 != wire9) >= (wire11 || wire10)))));
            end
          reg21 <= ((((-reg20[(3'h5):(2'h3)]) ?
              ((!wire8) >>> $signed((8'hb0))) : ((wire7 ? (8'ha6) : reg14) ?
                  (!(7'h43)) : (^~reg16))) == $unsigned(((~&(8'ha0)) && (~reg13)))) >= wire9);
          reg22 <= ((wire8 << reg15) | {$signed($unsigned($unsigned(reg20))),
              {((reg16 << reg16) + (wire9 ? reg15 : wire11))}});
        end
      else
        begin
          if ((wire8[(2'h3):(1'h1)] ?
              $unsigned(wire8[(4'hc):(2'h3)]) : $signed({$unsigned((+(8'hb0))),
                  {(^~wire9), {reg14}}})))
            begin
              reg13 <= $unsigned({(&(reg14 != (wire12 != wire5))), wire5});
              reg14 <= ((!(reg18[(5'h11):(4'h9)] ?
                  (reg15 ? (8'hb2) : wire8) : wire9[(3'h5):(2'h3)])) ^ wire6);
            end
          else
            begin
              reg13 <= $unsigned(((~^$unsigned((wire11 >>> reg13))) ?
                  wire7[(1'h1):(1'h1)] : $unsigned($unsigned(wire7))));
              reg14 <= reg13[(1'h0):(1'h0)];
              reg15 <= (+$unsigned(wire7[(1'h1):(1'h0)]));
            end
        end
    end
  assign wire23 = (~^($signed({(+wire5),
                      (reg14 <<< reg15)}) >>> {reg15[(2'h2):(2'h2)],
                      ($signed(reg13) >= (^~reg17))}));
  assign wire24 = (reg13[(1'h0):(1'h0)] ?
                      $signed((!$signed(((8'hb1) ?
                          wire11 : (8'hb5))))) : reg16[(3'h6):(3'h4)]);
endmodule
