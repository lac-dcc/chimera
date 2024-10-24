module top #(parameter param37 = (8'hae)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  assign y = {wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
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
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $signed(wire2);
  assign wire5 = $signed(((&(wire0 ? $unsigned(wire1) : ((8'hba) ^ wire3))) ?
                     wire1[(3'h5):(3'h5)] : $signed(((wire0 ?
                         wire3 : wire4) | wire2))));
  assign wire6 = $unsigned(wire0[(4'hd):(2'h3)]);
  assign wire7 = wire2[(1'h0):(1'h0)];
  assign wire8 = ($unsigned((wire2[(1'h0):(1'h0)] ?
                     ($unsigned(wire4) ?
                         (^(8'had)) : (wire0 ?
                             wire5 : wire2)) : (~wire5))) * $signed((|($unsigned(wire4) ?
                     $unsigned(wire6) : (wire4 ? wire4 : wire2)))));
  assign wire9 = $unsigned((({wire4[(4'ha):(3'h5)]} >= (wire2[(1'h0):(1'h0)] * {wire0,
                         wire2})) ?
                     wire7[(1'h1):(1'h0)] : ((8'ha4) ?
                         $signed(wire4) : ($unsigned((8'h9f)) >= wire3[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg10 <= $unsigned($signed((wire8 ?
          {$unsigned((8'ha4))} : (wire1[(4'hb):(4'ha)] - (wire0 == wire2)))));
      reg11 <= wire0;
      if ($signed($unsigned((8'ha2))))
        begin
          reg12 <= ({(((wire2 < wire5) ~^ wire7[(3'h7):(3'h5)]) ?
                      wire8[(3'h7):(1'h1)] : (8'hb3)),
                  $signed(wire6)} ?
              wire8[(4'ha):(2'h3)] : $unsigned($signed(wire7)));
          reg13 <= $unsigned($signed($unsigned({{(8'ha9), wire2}})));
        end
      else
        begin
          reg12 <= $signed($unsigned((&((wire1 >>> wire3) < (wire2 ?
              wire7 : reg10)))));
          reg13 <= (^~(wire1 < ((reg11 ?
              (!(8'hb0)) : wire9[(3'h4):(2'h3)]) + (reg13 != $unsigned(reg10)))));
          if ((((reg13 ?
              $signed((reg12 ?
                  (8'hbe) : reg13)) : reg11[(3'h4):(1'h0)]) | ((8'ha2) >> reg12[(3'h5):(1'h0)])) <<< (-wire2)))
            begin
              reg14 <= (((wire0 <<< ($signed(wire2) >> (wire5 & wire6))) ~^ ((((8'hb1) ?
                          reg12 : wire8) != $unsigned(wire6)) ?
                      (-reg10[(5'h11):(5'h11)]) : wire2[(1'h0):(1'h0)])) ?
                  ((!{reg12, $unsigned(wire2)}) ?
                      (-((-(8'h9f)) ?
                          $signed(wire0) : wire0)) : (wire7 * reg10[(1'h1):(1'h1)])) : reg12[(4'h9):(4'h8)]);
            end
          else
            begin
              reg14 <= wire6;
              reg15 <= wire4;
              reg16 <= (reg10 ?
                  (wire9 >= $unsigned((&{wire0}))) : {reg15[(1'h1):(1'h1)],
                      ((+reg14) ~^ {reg10})});
              reg17 <= (reg15[(1'h0):(1'h0)] ?
                  $signed(wire6[(4'h8):(1'h0)]) : ($signed(reg16[(3'h6):(1'h1)]) ?
                      (^~$signed(wire9[(5'h14):(5'h10)])) : (|wire0[(3'h4):(2'h3)])));
              reg18 <= wire4[(4'hd):(2'h3)];
            end
          reg19 <= $unsigned($unsigned((wire7 ? $signed((~|wire7)) : wire2)));
          if ($unsigned((|{wire0})))
            begin
              reg20 <= ($unsigned(reg12) != wire7);
              reg21 <= $signed($signed((~^({wire3, reg16} + wire8))));
              reg22 <= $unsigned({wire8,
                  ((^~wire3[(2'h2):(2'h2)]) >>> ($unsigned(reg20) ?
                      (reg11 ? (8'haa) : reg11) : (reg11 ? wire5 : reg12)))});
              reg23 <= $unsigned(reg17[(1'h0):(1'h0)]);
              reg24 <= wire7[(3'h5):(3'h5)];
            end
          else
            begin
              reg20 <= wire9;
              reg21 <= reg14;
            end
        end
      if ($unsigned((~^(~wire4))))
        begin
          reg25 <= wire6;
          if (reg19[(2'h2):(2'h2)])
            begin
              reg26 <= ({(8'hb3)} > (({$signed(wire0)} ?
                  ((reg19 ? wire3 : reg25) ?
                      (reg13 ?
                          reg16 : wire3) : (!reg15)) : ((reg14 > wire6) >>> (reg11 ?
                      reg12 : wire0))) ~^ ($signed($unsigned(reg16)) - (8'hb5))));
              reg27 <= {($signed($unsigned($signed((8'h9c)))) >= $signed(wire4)),
                  {{wire6, $signed($signed(reg23))}}};
              reg28 <= reg25;
              reg29 <= {reg27[(2'h2):(1'h0)]};
              reg30 <= (($unsigned(((reg12 ?
                      wire1 : reg22) | $unsigned(reg28))) ?
                  reg27 : ((|$unsigned((8'hbb))) ?
                      $signed($signed(reg12)) : $unsigned($unsigned(wire3)))) >= reg25);
            end
          else
            begin
              reg26 <= {(&(((wire7 ? (7'h40) : (8'ha6)) ?
                          wire4[(3'h6):(3'h4)] : (reg24 ? reg10 : reg16)) ?
                      (8'h9c) : ((7'h42) && $signed(reg17))))};
              reg27 <= ($unsigned($signed(((!reg14) >> {(8'hbe), reg18}))) ?
                  $signed(({reg20, (!reg24)} ?
                      reg26[(4'hc):(4'hc)] : (~reg22))) : {wire0, reg21});
            end
          reg31 <= $signed($signed($signed(reg21[(1'h0):(1'h0)])));
          reg32 <= (8'hb4);
          reg33 <= ((reg11[(1'h0):(1'h0)] ?
              (~|((reg25 ? reg31 : reg16) ?
                  (+wire7) : (reg30 <= wire4))) : ($signed((~&reg11)) ?
                  wire4 : $signed({reg31, wire9}))) >= $unsigned(wire5));
        end
      else
        begin
          reg25 <= $signed($unsigned(wire9));
          reg26 <= ((^~($unsigned($signed((8'hb1))) < (((8'ha1) <= reg20) >= (wire3 ?
                  reg14 : (8'ha5))))) ?
              ({(wire3[(1'h1):(1'h1)] ^ (reg25 ? (7'h43) : wire4)),
                  reg11[(3'h5):(2'h3)]} <<< ($unsigned($unsigned(reg10)) ?
                  $signed(reg27[(3'h6):(3'h5)]) : $signed((^reg33)))) : (($unsigned(reg28) ?
                      $signed($signed(wire6)) : wire9) ?
                  $unsigned(((reg21 ? reg26 : reg16) ?
                      reg28 : (&reg15))) : $unsigned($signed({reg29,
                      (8'hb8)}))));
          reg27 <= (^reg18);
          reg28 <= (8'hbd);
          reg29 <= $signed(reg28[(2'h3):(2'h3)]);
        end
      reg34 <= wire2;
    end
  always
    @(posedge clk) begin
      reg35 <= $signed(((^~((^~reg24) ^ (reg23 - reg33))) ?
          $unsigned((reg21 > (reg31 || reg29))) : reg16[(4'h9):(4'h8)]));
      reg36 <= wire6[(4'h8):(3'h5)];
    end
endmodule
