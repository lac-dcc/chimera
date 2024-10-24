module top
#(parameter param57 = (({((~&(7'h44)) && ((8'ha1) ^~ (8'h9f))), ((-(8'hb4)) ^~ {(8'hb2), (8'had)})} ? (!(~&((8'h9e) | (8'hae)))) : (((!(8'ha0)) + ((8'ha1) <<< (8'hb0))) || ({(7'h41)} ? (8'hbc) : {(8'hb7)}))) ? (~^(|(~^((7'h42) | (8'ha0))))) : ({(((8'ha3) ? (8'h9d) : (8'hab)) ? (&(8'ha8)) : ((8'h9c) & (8'h9d))), {((8'hbc) ? (8'ha4) : (8'h9c))}} <<< (^{(~(8'ha6)), (^(8'h9e))}))), 
parameter param58 = ((&(~|((param57 >= param57) && (8'ha7)))) ? (((param57 ? {param57, param57} : param57) ~^ (8'hae)) >>> param57) : (param57 > param57)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire50,
                 wire41,
                 wire40,
                 wire38,
                 wire13,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = (wire1[(4'hc):(3'h6)] ^ (~^wire0));
  assign wire5 = (^~wire2);
  assign wire6 = $unsigned($signed(wire3[(2'h3):(2'h2)]));
  assign wire7 = ((+{(8'ha4)}) == {$signed({$signed(wire2)}),
                     {$unsigned((^~wire5)), wire4[(3'h4):(2'h3)]}});
  always
    @(posedge clk) begin
      reg8 <= ($signed($unsigned($unsigned((~|wire0)))) ?
          wire6[(4'he):(4'h9)] : wire4);
      reg9 <= $unsigned(wire2);
      reg10 <= $signed((($unsigned(wire2[(3'h5):(1'h0)]) | $unsigned((reg9 ?
              wire6 : wire2))) ?
          $unsigned((^~{wire2})) : (-(-(wire7 >= wire4)))));
      reg11 <= (~(((^~(+reg9)) ? wire2 : $signed({reg9})) ?
          $signed(wire1[(1'h0):(1'h0)]) : ({(-wire0)} ?
              ((reg8 ^~ wire0) ~^ (wire0 >= wire0)) : (wire5 ?
                  {reg10} : $unsigned(wire2)))));
      reg12 <= $signed($signed(wire7));
    end
  assign wire13 = $signed($unsigned(wire5));
  always
    @(posedge clk) begin
      reg14 <= reg8;
      if ($unsigned((|($unsigned((wire4 && (7'h42))) >> $unsigned((wire0 ?
          wire0 : wire13))))))
        begin
          if ((^~($unsigned($signed((wire0 ~^ (7'h41)))) ?
              $unsigned((!$unsigned((8'hbd)))) : (~{{wire13, wire13},
                  (~&reg9)}))))
            begin
              reg15 <= ($unsigned(wire0[(2'h2):(2'h2)]) & ($unsigned(((wire13 ?
                      wire5 : wire1) ^ $unsigned(wire7))) ?
                  reg9 : ((~&((8'hba) ? wire7 : reg12)) ^ wire0)));
              reg16 <= (((^$unsigned((8'hba))) | wire3[(2'h2):(2'h2)]) ?
                  $unsigned(wire6) : $unsigned((^~wire1)));
            end
          else
            begin
              reg15 <= (wire4 ? $signed(reg11[(1'h1):(1'h0)]) : wire1);
              reg16 <= wire2[(1'h1):(1'h0)];
              reg17 <= $unsigned(wire1[(2'h3):(1'h1)]);
              reg18 <= ((~|$unsigned({(^~wire5)})) ?
                  reg16 : $signed((((wire7 - wire0) ?
                      {(7'h44), wire3} : {wire6}) << reg9)));
            end
          reg19 <= ((+$unsigned(reg12[(2'h2):(1'h0)])) >>> (~&(reg11[(2'h2):(1'h1)] - $unsigned(wire3[(1'h1):(1'h0)]))));
          if ({(8'hb2),
              {((^~(^reg19)) ?
                      ((wire7 ?
                          wire6 : reg16) ^ $signed((8'hab))) : ($signed(reg8) ?
                          (wire3 ? wire5 : wire5) : (+(8'hb1)))),
                  wire13[(1'h0):(1'h0)]}})
            begin
              reg20 <= $unsigned(wire2);
              reg21 <= reg11[(1'h1):(1'h0)];
            end
          else
            begin
              reg20 <= ((reg15[(2'h3):(2'h2)] ?
                      reg12[(3'h6):(3'h4)] : (&$unsigned($unsigned(wire3)))) ?
                  wire0[(4'hc):(4'h9)] : (8'h9f));
            end
        end
      else
        begin
          if ((~&reg14[(4'h9):(1'h1)]))
            begin
              reg15 <= ((8'h9e) ^ ($unsigned((~|$unsigned(reg17))) != $signed((^~((7'h42) ?
                  wire5 : reg18)))));
              reg16 <= (wire5[(3'h4):(1'h1)] == $signed(reg14));
              reg17 <= (&({(wire6[(4'h9):(1'h0)] < (reg9 > wire13))} & (wire6 ?
                  (+(|reg11)) : $unsigned(reg11[(1'h0):(1'h0)]))));
              reg18 <= reg11[(2'h3):(2'h2)];
            end
          else
            begin
              reg15 <= {reg17, wire1[(3'h5):(1'h1)]};
            end
          reg19 <= (reg19[(3'h6):(3'h5)] ?
              $signed(reg9) : (reg14[(3'h5):(1'h1)] <<< wire6[(2'h3):(2'h3)]));
          if (((~(((reg17 ? wire13 : reg18) ?
                  (&reg16) : (wire13 ? wire6 : wire2)) ?
              {(8'ha7)} : ((wire7 ?
                  wire2 : reg19) || reg16[(3'h4):(3'h4)]))) ~^ $unsigned((|($unsigned(reg21) ?
              $signed(reg10) : (reg19 ? wire1 : reg8))))))
            begin
              reg20 <= ($unsigned(reg15) == $signed(wire3[(3'h4):(1'h0)]));
              reg21 <= ($unsigned(wire13) >= (($unsigned((reg16 ?
                  reg8 : wire2)) - wire6[(4'hb):(4'hb)]) ~^ $signed(reg18)));
            end
          else
            begin
              reg20 <= reg10;
            end
          reg22 <= reg14;
        end
      reg23 <= (((8'had) == (~^(~(reg21 ? wire4 : reg19)))) ?
          {reg20[(2'h2):(1'h0)]} : $unsigned((wire0 ?
              (|(&wire3)) : wire3[(1'h0):(1'h0)])));
    end
  module24 #() modinst39 (wire38, clk, wire7, wire6, reg10, reg15);
  assign wire40 = (($signed(($signed(wire0) ?
                          $signed(reg20) : (reg9 ?
                              reg11 : reg10))) - ($unsigned((wire5 ?
                          reg11 : wire13)) > $signed((reg17 ?
                          (8'hb9) : (8'haf))))) ?
                      (($unsigned(reg17[(4'h8):(3'h6)]) <<< ($signed(wire2) ?
                              wire0 : reg21)) ?
                          reg18[(3'h5):(3'h5)] : (wire13 ?
                              $unsigned(reg17[(3'h5):(3'h4)]) : (~|wire4[(4'hd):(3'h5)]))) : reg12);
  assign wire41 = $unsigned(reg10[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg42 <= reg17[(3'h5):(1'h1)];
      if (wire2)
        begin
          reg43 <= ((!$unsigned(((~reg11) ? $unsigned(wire1) : (!reg12)))) ?
              reg8 : $signed(wire7[(2'h2):(1'h0)]));
          reg44 <= (8'ha9);
        end
      else
        begin
          reg43 <= {reg15[(3'h6):(3'h5)]};
          reg44 <= wire40[(3'h7):(3'h4)];
          reg45 <= $signed((-wire7));
          if ($unsigned(((~&(&reg16[(3'h4):(1'h1)])) ?
              $signed((8'hb4)) : (wire6 ? wire41 : (8'hbc)))))
            begin
              reg46 <= $unsigned(wire40);
              reg47 <= reg10[(2'h3):(2'h2)];
              reg48 <= (+(((-wire4) ? {$signed(wire7)} : reg8) >> reg45));
            end
          else
            begin
              reg46 <= {wire5, $unsigned((~|$signed((~reg17))))};
              reg47 <= (&$signed((((reg19 ? reg16 : wire2) ?
                  wire5 : (+reg23)) & $unsigned(reg47))));
            end
          reg49 <= ((reg23 << wire40[(3'h7):(3'h7)]) ^~ wire7[(3'h5):(1'h1)]);
        end
    end
  assign wire50 = $signed(reg18[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg51 <= (!reg21);
      reg52 <= {reg16[(2'h3):(1'h0)]};
      if (reg48[(4'hc):(4'hc)])
        begin
          if ($unsigned((((7'h41) && (~&(reg10 ?
              reg18 : (8'hb2)))) << $signed((reg48 < $signed(reg46))))))
            begin
              reg53 <= $signed(reg47[(5'h10):(4'ha)]);
              reg54 <= $signed(reg10[(4'hf):(4'he)]);
            end
          else
            begin
              reg53 <= $unsigned($unsigned($signed($unsigned((+reg54)))));
            end
          reg55 <= (-{wire3, wire41});
          reg56 <= $signed(reg49);
        end
      else
        begin
          reg53 <= wire1;
          reg54 <= (((~|{(reg23 >> reg11),
              wire41[(4'h9):(3'h4)]}) == $unsigned(($unsigned(wire0) >> (+reg20)))) >>> (-{reg49[(2'h3):(2'h2)]}));
        end
    end
endmodule

module module24  (y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire27;
  input wire signed [(4'hf):(1'h0)] wire26;
  input wire [(4'hd):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg37,
                 (1'h0)};
  assign wire29 = {wire27[(1'h0):(1'h0)]};
  assign wire30 = $signed(((+wire25[(4'h8):(1'h1)]) ?
                      $unsigned(((&wire28) >>> $unsigned(wire27))) : (|((-wire27) && (wire27 ?
                          wire28 : wire29)))));
  assign wire31 = (+(8'hac));
  assign wire32 = $signed($signed(wire25));
  assign wire33 = (~&(8'had));
  assign wire34 = (^~(wire32 >>> ((|(-wire27)) ?
                      $unsigned(wire30[(5'h10):(1'h1)]) : wire29)));
  assign wire35 = (&$unsigned(wire31[(4'h8):(3'h6)]));
  assign wire36 = wire31[(4'h9):(3'h6)];
  always
    @(posedge clk) begin
      reg37 <= (+{(~&$unsigned({wire28}))});
    end
endmodule
