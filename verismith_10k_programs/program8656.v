module top
#(parameter param53 = ((+((((8'hb7) == (8'hb4)) & ((8'hac) ? (8'hac) : (8'ha7))) ~^ (|((8'ha2) + (8'ha8))))) ^~ (~&(8'hac))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire52, wire51, wire50, wire48, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (($signed({$unsigned(wire0)}) ?
                     wire2[(4'ha):(4'ha)] : $unsigned($unsigned(wire2[(2'h2):(1'h1)]))) - {wire1});
  assign wire5 = $unsigned($unsigned((wire4 | ((^(8'hbb)) ?
                     (wire2 << (7'h40)) : (&wire0)))));
  assign wire6 = $signed((wire5 ?
                     wire5 : ($signed($unsigned(wire3)) ~^ ((-wire5) + $signed(wire2)))));
  module7 #() modinst49 (wire48, clk, wire0, wire3, wire4, wire5);
  assign wire50 = ($unsigned(wire5) >>> wire48[(3'h7):(1'h1)]);
  assign wire51 = (wire4[(1'h1):(1'h0)] ?
                      {($signed(wire5[(3'h6):(2'h2)]) <<< (wire6[(1'h1):(1'h1)] < {wire48})),
                          (~$unsigned((8'h9c)))} : {(8'ha6)});
  assign wire52 = wire5;
endmodule

module module7
#(parameter param46 = ({((((8'hbf) ? (8'hb4) : (8'haf)) != ((8'hbb) ? (7'h44) : (8'ha1))) ? (!((8'hb0) >= (8'hac))) : (^~((8'ha0) ? (8'hbe) : (8'ha6)))), (((^~(8'hb9)) >>> {(8'ha2), (8'ha0)}) ? (&(~|(8'hb8))) : (!(&(8'hb7))))} ^ {(8'hb8), (-(((8'hb3) * (8'hab)) >>> ((7'h41) ? (7'h41) : (7'h42))))}), 
parameter param47 = {((8'ha3) > param46)})
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire12;
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  assign y = {wire45,
                 wire42,
                 wire12,
                 reg44,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire12 = wire10[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg13 <= $signed((~|$unsigned($signed(((8'ha2) ? wire12 : wire10)))));
      reg14 <= $signed({wire12[(5'h12):(4'h8)], (~wire12[(5'h12):(4'hf)])});
      reg15 <= (wire12 ^ (+wire8));
      if (reg13)
        begin
          reg16 <= $signed((+$unsigned((!$unsigned(wire11)))));
          if ((($unsigned((~^wire11)) != reg16) ?
              (+wire12[(4'h8):(3'h7)]) : $signed(wire9[(4'ha):(3'h7)])))
            begin
              reg17 <= $unsigned((((&wire8) ?
                  $unsigned((8'hbd)) : (wire11 ?
                      (reg14 ?
                          (8'hba) : reg13) : wire12[(4'hc):(3'h7)])) <= ($unsigned($unsigned(wire10)) >>> ((wire11 >= wire9) ?
                  (reg13 | wire11) : {reg14}))));
              reg18 <= ($signed((8'hb2)) ?
                  (((~{reg15}) ^ {(^wire10)}) ?
                      (~wire11[(5'h10):(2'h3)]) : reg16[(3'h7):(3'h4)]) : $signed($signed(reg14)));
              reg19 <= wire8;
              reg20 <= reg19;
            end
          else
            begin
              reg17 <= reg13;
              reg18 <= (~&$unsigned({((wire10 >= wire8) <<< $unsigned(reg15)),
                  reg14[(4'h9):(2'h2)]}));
              reg19 <= (!($unsigned(wire11) - reg20[(4'h9):(4'h9)]));
            end
          reg21 <= $unsigned((!{{reg19[(5'h10):(4'hb)]}}));
          reg22 <= reg16;
          reg23 <= ($unsigned({($signed(reg15) & (-reg22))}) ?
              $unsigned($signed($unsigned((8'hb6)))) : $signed(reg17[(3'h7):(3'h4)]));
        end
      else
        begin
          reg16 <= reg15[(4'hc):(3'h7)];
          if (($unsigned(wire8[(3'h4):(1'h0)]) ? wire10 : wire9[(3'h7):(2'h2)]))
            begin
              reg17 <= $signed($unsigned((~$signed(reg15[(4'hd):(3'h7)]))));
              reg18 <= $signed((reg14 ?
                  ($unsigned(reg15[(4'h8):(1'h1)]) - ((reg16 ?
                          wire12 : (8'h9e)) ?
                      $signed(reg13) : reg21[(1'h1):(1'h1)])) : $unsigned($signed(reg18))));
              reg19 <= ($signed(reg22[(3'h6):(3'h4)]) ?
                  (wire8 != reg16[(4'ha):(4'h9)]) : ((({reg17,
                          wire8} ^~ wire10[(1'h0):(1'h0)]) ^ (~(reg18 > wire8))) ?
                      ((reg23[(1'h1):(1'h1)] ?
                          (wire9 ?
                              wire10 : (8'hb7)) : $signed(wire12)) != (reg20[(1'h1):(1'h1)] << (reg21 >>> (8'ha5)))) : $unsigned($unsigned($signed(reg15)))));
              reg20 <= $unsigned((!$signed($unsigned($unsigned(wire9)))));
            end
          else
            begin
              reg17 <= reg16[(5'h12):(4'hd)];
              reg18 <= $unsigned((^~$unsigned((^(+wire8)))));
              reg19 <= $signed(reg21);
              reg20 <= $signed(reg17[(2'h2):(1'h0)]);
            end
        end
    end
  module24 #() modinst43 (.y(wire42), .wire28(reg22), .clk(clk), .wire29(reg19), .wire25(wire10), .wire26(wire11), .wire27(reg13));
  always
    @(posedge clk) begin
      reg44 <= ((~|{wire10[(3'h4):(1'h1)]}) ?
          ($signed(((8'hbf) ? (reg22 != (8'ha6)) : $unsigned((8'hb3)))) ?
              $signed(reg14) : ($signed($unsigned((8'hb6))) ?
                  $unsigned(wire11) : (reg19[(3'h6):(3'h4)] == $unsigned(reg19)))) : $unsigned(wire10));
    end
  assign wire45 = (|$signed($unsigned($unsigned(reg17[(1'h1):(1'h1)]))));
endmodule

module module24
#(parameter param40 = (~|(({((8'ha7) ? (8'hba) : (8'ha6))} ^ (((8'h9f) == (8'had)) ? (+(8'ha2)) : (!(8'h9d)))) * ((((7'h40) << (8'hb1)) >= ((8'ha8) ? (8'hb3) : (8'hac))) != ((!(8'ha8)) ? (8'ha4) : (&(8'hb6)))))), 
parameter param41 = ((~&(((-(8'hba)) ? param40 : (param40 | param40)) ? ((+param40) >= (param40 ? param40 : param40)) : (8'haf))) ? {(!(((8'ha2) ? (8'hb8) : param40) ? (param40 ^ (8'hb2)) : param40)), ((+(param40 ^~ (7'h43))) ? (~&(param40 ~^ (8'hbf))) : (-(param40 ? (8'ha9) : param40)))} : {param40, {((^~param40) ? (param40 ? param40 : (8'ha1)) : {param40, param40})}}))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire29;
  input wire signed [(4'hb):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire signed [(4'hc):(1'h0)] wire26;
  input wire [(4'h9):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 (1'h0)};
  assign wire30 = wire29;
  assign wire31 = wire25[(3'h7):(3'h4)];
  assign wire32 = wire25[(2'h2):(1'h1)];
  assign wire33 = {wire26};
  assign wire34 = wire29;
  assign wire35 = (!$unsigned({((~wire34) ? (^wire27) : $signed(wire30))}));
  assign wire36 = wire26[(3'h7):(3'h6)];
  assign wire37 = $unsigned((~|({(wire35 * wire36),
                      $signed(wire30)} ^ (!(~wire25)))));
  assign wire38 = (~|wire32);
  assign wire39 = wire35;
endmodule
