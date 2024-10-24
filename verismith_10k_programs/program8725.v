module top
#(parameter param46 = ((((((8'hb6) ? (8'hb5) : (8'ha6)) >= (&(8'hbe))) ? (((8'ha8) ? (7'h44) : (8'haf)) ? (^(8'hb5)) : ((8'ha8) ? (8'hb7) : (8'hbc))) : (&{(8'ha0), (8'hac)})) ? ({((8'hb3) ^ (8'ha9)), ((8'h9e) || (8'hb6))} > {((8'ha9) ? (8'hbd) : (8'hae))}) : {(^~(^(8'haa))), ((|(8'hab)) ? ((8'hb0) ? (7'h43) : (8'haf)) : ((8'hb9) | (8'ha2)))}) & (-(({(8'hb7), (8'hac)} >= {(8'hbd)}) ? (((8'haf) ? (8'ha4) : (8'haa)) * (+(8'hb5))) : ((-(8'h9f)) ? ((8'hba) ? (8'had) : (8'h9f)) : ((7'h40) ^ (8'ha4)))))), 
parameter param47 = (((((param46 & (8'hb4)) ? ((7'h41) ? param46 : param46) : {param46, param46}) ? param46 : ((param46 ? param46 : (8'hb5)) ^ {param46, param46})) & ({(-param46), (param46 ? param46 : param46)} << ((param46 ? (8'h9e) : param46) != (param46 ? param46 : param46)))) != (~|(~&(param46 > ((8'ha7) ? (8'hae) : param46))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire35;
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
                 (1'h0)};
  module4 #() modinst36 (wire35, clk, wire2, wire1, wire3, wire0);
  assign wire37 = wire2;
  assign wire38 = $signed({wire37[(3'h4):(1'h0)]});
  assign wire39 = (wire1[(4'hd):(3'h7)] ?
                      $unsigned((~^(-wire35[(1'h1):(1'h0)]))) : ($signed({((8'hba) ?
                                  wire35 : wire0),
                              (^~wire3)}) ?
                          ($signed(wire38) ?
                              ($unsigned(wire35) | ((8'ha9) | wire1)) : wire38[(3'h4):(1'h1)]) : ((wire38[(3'h6):(3'h5)] << (^~wire37)) ?
                              $signed(wire3) : (wire2 <<< wire38[(2'h3):(2'h3)]))));
  assign wire40 = ((((wire3[(3'h6):(2'h3)] ? wire3 : ((8'ha4) || wire3)) ?
                          wire0 : {{wire1, wire1}}) >> $signed(({(7'h42),
                          wire37} != $unsigned(wire3)))) ?
                      wire0[(1'h0):(1'h0)] : ($signed($signed((~&wire35))) ~^ {(&$unsigned(wire39)),
                          wire0[(4'hd):(1'h0)]}));
  assign wire41 = ((+wire1[(4'hf):(3'h4)]) ^ $signed($signed($unsigned($signed(wire3)))));
  assign wire42 = $signed(({wire2} | wire1[(5'h10):(4'h8)]));
  assign wire43 = wire38;
  assign wire44 = wire0[(3'h7):(3'h5)];
  assign wire45 = wire3[(3'h6):(3'h4)];
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire signed [(3'h6):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire11,
                 wire10,
                 wire9,
                 reg30,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire9 = wire5[(5'h13):(5'h12)];
  assign wire10 = {{wire7[(4'h8):(3'h7)]}};
  assign wire11 = ($unsigned($signed((-(wire7 ? wire9 : wire10)))) ?
                      wire9[(4'h8):(3'h4)] : wire5[(4'hc):(3'h7)]);
  always
    @(posedge clk) begin
      reg12 <= $signed(((({wire7, wire11} ? (!wire11) : {wire5}) ?
              (^$signed(wire10)) : (~^(wire7 & wire10))) ?
          $signed($unsigned(((7'h42) != wire8))) : (wire10[(2'h2):(1'h0)] ?
              wire11 : ((+(8'hb9)) ?
                  (wire6 ? wire8 : wire8) : wire9[(4'h8):(2'h3)]))));
      reg13 <= ($signed(($signed(wire5[(2'h3):(2'h3)]) ?
          wire6 : ((wire8 ? (8'ha9) : wire9) ?
              wire5 : {wire11}))) < ((reg12[(3'h6):(2'h3)] <<< wire8[(1'h1):(1'h0)]) >> (&reg12[(1'h0):(1'h0)])));
      if ((~&(|wire7[(1'h0):(1'h0)])))
        begin
          reg14 <= $unsigned($signed((~|((7'h40) ?
              $unsigned(wire6) : $unsigned(wire8)))));
          reg15 <= wire8[(3'h4):(3'h4)];
          reg16 <= wire7;
          reg17 <= ((wire11 && wire6[(1'h1):(1'h0)]) * ((wire8[(4'h9):(4'h8)] != (~^wire7[(2'h2):(1'h1)])) + $unsigned(wire11)));
          reg18 <= $signed((({$signed((8'ha6))} <<< ($signed(wire9) ?
              reg13[(2'h2):(2'h2)] : ((8'hbc) * wire8))) < wire10[(4'h8):(2'h2)]));
        end
      else
        begin
          reg14 <= $unsigned(reg15);
          reg15 <= (((~$signed($unsigned(wire8))) ^ wire5) ?
              $unsigned(wire9) : {(8'hbf)});
          reg16 <= ($signed({{reg12[(3'h6):(3'h4)]}}) ?
              (wire5[(4'hb):(3'h5)] >> reg12[(2'h2):(1'h1)]) : {(($signed(reg16) ?
                          (reg15 >= wire6) : reg16[(3'h7):(2'h2)]) ?
                      $signed($signed(wire6)) : (~|(reg13 ? wire5 : reg14))),
                  reg13});
          reg17 <= reg18;
          reg18 <= reg18;
        end
      if ((!(~|($signed((-reg13)) ?
          $unsigned((wire8 ? wire5 : wire10)) : (7'h40)))))
        begin
          reg19 <= wire9;
        end
      else
        begin
          reg19 <= $unsigned($signed(wire11[(1'h0):(1'h0)]));
          if ($signed(wire5[(4'h8):(4'h8)]))
            begin
              reg20 <= (8'hac);
            end
          else
            begin
              reg20 <= $unsigned(reg20[(3'h4):(3'h4)]);
              reg21 <= (wire6 >>> wire9);
              reg22 <= ($unsigned((~&((wire8 >> reg16) + {wire10}))) >>> $signed({{(wire6 || reg17),
                      reg16[(3'h7):(3'h6)]},
                  (((8'ha2) ? wire7 : (7'h43)) ? (8'hb2) : $signed((7'h42)))}));
              reg23 <= ($signed(reg17[(1'h1):(1'h1)]) < $signed(wire6[(1'h1):(1'h0)]));
            end
          reg24 <= (wire6 - ((($unsigned(wire10) >>> reg20[(1'h1):(1'h0)]) + ($unsigned(wire10) != wire5[(5'h12):(5'h10)])) <= reg17));
          if ($unsigned($unsigned(wire9[(3'h5):(1'h1)])))
            begin
              reg25 <= wire10;
              reg26 <= ((($unsigned($signed(reg24)) ?
                      ((wire5 >> reg19) ?
                          $signed(reg19) : $unsigned((8'ha1))) : $unsigned(reg18[(4'h9):(4'h8)])) > reg13[(4'hc):(4'h8)]) ?
                  {(({reg16, wire11} ? (reg22 ? reg21 : wire11) : wire9) ?
                          reg22 : $unsigned(reg21[(3'h5):(2'h3)])),
                      ((~^{reg21}) ?
                          (&$unsigned(reg16)) : wire8)} : {wire10[(2'h2):(1'h0)],
                      $signed(reg22[(3'h6):(3'h5)])});
            end
          else
            begin
              reg25 <= reg18;
              reg26 <= (-wire6);
              reg27 <= reg26[(1'h1):(1'h1)];
              reg28 <= reg13;
              reg29 <= $signed(reg19[(3'h5):(2'h3)]);
            end
        end
      reg30 <= wire7[(3'h6):(3'h6)];
    end
  assign wire31 = reg19;
  assign wire32 = (!$unsigned($signed((~&$signed(reg17)))));
  assign wire33 = ($signed($signed({(wire9 ? reg25 : reg25),
                      wire6})) > ($unsigned((8'ha0)) ?
                      ((wire6 ? (wire8 < reg17) : reg18) ?
                          {(wire7 << (8'h9c)),
                              (reg25 | wire11)} : wire6[(1'h0):(1'h0)]) : (^~wire8)));
  assign wire34 = wire32;
endmodule
