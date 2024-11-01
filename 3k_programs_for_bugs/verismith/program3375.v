module top
#(parameter param53 = ({{({(8'hb3)} & (8'haa))}} << (8'hb4)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire42;
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire42,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  module5 #() modinst43 (.y(wire42), .wire9(wire2), .wire6(wire1), .wire8(wire0), .clk(clk), .wire7(wire4));
  always
    @(posedge clk) begin
      reg44 <= ($signed({$signed($signed(wire42))}) && wire0);
      reg45 <= (8'ha6);
      reg46 <= ($unsigned((wire1 >>> reg45)) == $unsigned((($signed(wire1) != (wire1 ?
              reg45 : wire1)) ?
          wire1[(4'h9):(3'h7)] : $signed(wire42))));
      reg47 <= (wire1 == reg45);
    end
  always
    @(posedge clk) begin
      reg48 <= {wire4};
    end
  assign wire49 = (~|(7'h43));
  assign wire50 = $signed(wire2);
  assign wire51 = $signed(reg46);
  assign wire52 = wire42;
endmodule

module module5
#(parameter param41 = (^~({({(7'h42), (8'hbd)} ? ((7'h42) << (8'hba)) : ((8'ha2) >>> (8'ha6)))} >> ((((8'h9d) ~^ (8'hbb)) ? (&(8'hbb)) : (8'hb4)) ? (^((8'ha8) > (8'hb2))) : {((8'hbb) - (7'h41)), ((8'hb9) ? (8'ha8) : (7'h44))}))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire24,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire10 = wire7[(3'h7):(3'h7)];
  assign wire11 = wire9[(3'h4):(1'h0)];
  assign wire12 = wire8;
  assign wire13 = ((~$unsigned(wire11)) ?
                      ({((wire6 ?
                              wire8 : wire7) <<< wire7[(2'h2):(2'h2)])} >> (wire11 ?
                          (wire10[(2'h2):(1'h0)] ?
                              ((8'hb6) ?
                                  wire12 : wire7) : $unsigned(wire11)) : ($unsigned(wire10) ?
                              {(8'ha5)} : {wire12,
                                  wire11}))) : ((($signed(wire12) ?
                          $unsigned(wire7) : wire8) ^~ (+(wire9 ?
                          (8'hab) : (8'hbd)))) << $signed(wire12)));
  assign wire14 = $unsigned($signed($signed((8'hb7))));
  always
    @(posedge clk) begin
      if (($unsigned((wire6[(2'h2):(2'h2)] <<< ($unsigned(wire10) ~^ (&wire13)))) || wire10[(3'h7):(1'h1)]))
        begin
          if (wire12[(1'h1):(1'h1)])
            begin
              reg15 <= (~(-(^~$signed({wire10, wire7}))));
              reg16 <= (wire6 && $signed($signed($signed(wire10[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg15 <= (&wire10);
              reg16 <= $signed($signed(wire8[(3'h4):(2'h3)]));
              reg17 <= $unsigned($unsigned((wire9[(4'hc):(1'h1)] ?
                  (8'ha7) : $signed((&wire10)))));
              reg18 <= $signed(($signed((wire14 ?
                  wire11[(2'h2):(1'h0)] : {wire11})) != $signed(wire7[(1'h0):(1'h0)])));
            end
          reg19 <= reg17;
        end
      else
        begin
          reg15 <= ((!((8'hb0) >> {$signed(wire7)})) | {((~|wire6) ?
                  (wire12 ?
                      $signed(reg18) : $signed((8'hb9))) : ($signed(wire8) != (wire6 ?
                      (8'hb5) : wire9)))});
          reg16 <= ($signed($unsigned(wire6[(1'h1):(1'h0)])) ? reg16 : reg18);
        end
    end
  always
    @(posedge clk) begin
      reg20 <= $signed(($signed(((+wire11) ? reg17 : $signed(wire14))) ?
          ({$signed(reg15)} ?
              (reg17[(4'hf):(1'h1)] ?
                  (wire10 ? (8'hac) : (8'hb2)) : (reg16 ?
                      reg15 : wire7)) : ((reg16 || wire11) ?
                  $signed(reg19) : (wire6 & wire6))) : (-wire7)));
      reg21 <= ({($signed(wire13[(3'h4):(2'h3)]) ?
              ($signed(wire8) ?
                  (reg17 || (8'h9e)) : {reg15, wire7}) : {wire13})} <= (8'ha3));
      reg22 <= (+(wire10 ?
          ((reg21[(4'ha):(2'h3)] << wire11) ?
              $signed(reg21[(5'h10):(3'h6)]) : $signed((~|reg19))) : (wire10 < (wire12 < $signed(wire10)))));
      reg23 <= (|reg19[(4'h9):(2'h3)]);
    end
  assign wire24 = (((!wire13) || $signed(((reg17 == reg22) ?
                      wire9 : $signed(wire6)))) + {(((wire10 ^ reg16) ~^ $unsigned(reg23)) - (((8'hb9) ?
                          reg22 : wire14) && (reg20 && reg18))),
                      $signed(((^wire7) ? reg22[(2'h3):(1'h1)] : wire6))});
  always
    @(posedge clk) begin
      reg25 <= $signed(reg21[(3'h4):(1'h1)]);
      reg26 <= (~^$signed((((reg16 ? reg18 : reg16) ?
          {(8'hb0),
              wire11} : $signed(wire7)) + $signed(reg16[(1'h0):(1'h0)]))));
      if (wire10)
        begin
          reg27 <= (^($signed((reg23 >= wire13)) == {$unsigned(wire9[(4'hc):(3'h5)])}));
          reg28 <= reg26;
          reg29 <= (|reg21);
          reg30 <= (|(($signed((reg15 - wire10)) + (&$unsigned(reg16))) || ((|(wire6 + wire11)) ?
              $unsigned((8'hbf)) : (~&{(8'hb0), reg15}))));
          reg31 <= (~(&$signed(((reg27 | (8'haa)) ? (&wire8) : wire12))));
        end
      else
        begin
          reg27 <= $signed(($signed($unsigned($signed(wire11))) << {($signed(reg17) ?
                  reg31 : (+(8'hb8))),
              $signed((&reg22))}));
          reg28 <= $unsigned(reg23);
          reg29 <= $unsigned(wire6[(2'h2):(1'h1)]);
          reg30 <= ((($unsigned(((8'hbf) >> (8'hb4))) >> ({reg29,
                      reg25} <<< {(8'hb9), wire9})) ?
                  $signed($signed((+reg21))) : (~&(reg21 ?
                      {reg23} : wire9[(4'ha):(2'h3)]))) ?
              {($unsigned($signed((8'h9d))) ?
                      (8'hb0) : ($signed(reg23) - $signed(reg28)))} : (^~wire24));
          reg31 <= $signed($unsigned(wire24));
        end
      reg32 <= $unsigned(((reg16 ?
              ($signed(reg25) ?
                  reg29 : (wire10 ^ (8'ha3))) : $unsigned($signed(reg22))) ?
          (+$signed(reg25)) : $unsigned($unsigned(wire10[(3'h6):(3'h4)]))));
    end
  assign wire33 = wire9[(4'h8):(3'h4)];
  assign wire34 = ((reg19 || (~|wire12)) || (((reg15 ?
                          $unsigned(reg30) : (~reg23)) ~^ reg20[(4'hb):(4'ha)]) ?
                      $signed(wire24) : {$signed((reg18 ? wire12 : reg21)),
                          ($signed((8'ha5)) & ((8'hb5) ? wire24 : (8'haf)))}));
  assign wire35 = reg15;
  assign wire36 = ($unsigned(((((8'hb9) ~^ reg30) & reg15[(4'h9):(4'h9)]) ?
                      $signed(wire10) : $signed((~&wire9)))) != $unsigned($unsigned((!$signed(wire9)))));
  assign wire37 = reg31;
  assign wire38 = (reg18[(4'h8):(1'h0)] | reg16);
  assign wire39 = (((+($unsigned(reg17) ? (~&wire24) : (&reg16))) ?
                          $unsigned($unsigned(wire6[(1'h1):(1'h0)])) : (wire37 > $signed((wire11 ?
                              reg25 : wire10)))) ?
                      (~|$unsigned(((wire10 <= (8'hbd)) <= reg15))) : $unsigned((!$signed((reg18 ?
                          wire9 : reg28)))));
  assign wire40 = (reg21 ? $signed(wire11) : reg17);
endmodule
