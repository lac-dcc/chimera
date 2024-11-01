module top
#(parameter param34 = ((+((((7'h42) ? (8'hbe) : (8'ha9)) >>> {(8'ha1)}) ~^ (((8'hbd) * (8'hb9)) != ((8'hb6) ? (8'hb8) : (8'hb6))))) == {((((8'ha9) ^ (8'ha2)) ? ((8'hac) ? (8'hb7) : (7'h40)) : {(7'h43)}) ? ((^(8'hac)) ~^ (+(8'hbc))) : (~((8'hbc) ? (8'had) : (8'ha5)))), (8'hbb)}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  assign y = {wire33,
                 wire22,
                 wire21,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = (wire2 ?
                     (~^$unsigned($unsigned((wire3 ?
                         wire2 : (8'ha3))))) : ((!{(~wire4)}) | $signed(((^wire0) ?
                         $signed(wire4) : wire4[(3'h7):(3'h5)]))));
  assign wire6 = wire5[(3'h5):(2'h3)];
  assign wire7 = wire5;
  assign wire8 = wire3;
  assign wire9 = wire3;
  assign wire10 = ({$unsigned((wire8 ? (wire5 ? wire9 : wire8) : wire8)),
                          {($signed(wire2) >= (wire2 & wire9)),
                              $signed((wire6 ? wire2 : wire8))}} ?
                      $unsigned((((wire0 ^ wire8) ? wire2 : {wire6, wire2}) ?
                          $signed($signed((7'h42))) : wire5[(1'h0):(1'h0)])) : (!wire3));
  assign wire11 = (((((^~wire2) ?
                              (wire4 ?
                                  wire4 : wire8) : (+(8'hae))) != (wire10[(4'h8):(3'h6)] ?
                              $signed(wire6) : wire5)) ?
                          (wire5[(1'h1):(1'h1)] ?
                              $signed($signed(wire3)) : $signed(((8'haf) ?
                                  wire3 : wire9))) : ((wire7[(1'h0):(1'h0)] == (wire6 ~^ wire6)) <<< (-{wire4,
                              wire2}))) ?
                      $unsigned((((~&wire5) > wire2[(3'h5):(3'h4)]) ?
                          wire2[(4'hb):(3'h4)] : $signed((wire3 ?
                              (8'hb3) : wire8)))) : (^$unsigned(wire6)));
  always
    @(posedge clk) begin
      if ({((8'h9e) ? (^$signed(wire8[(4'hc):(1'h1)])) : wire7),
          $unsigned(wire0)})
        begin
          if ($signed(wire5[(1'h1):(1'h0)]))
            begin
              reg12 <= (((wire5 ^ $unsigned((wire8 ? wire11 : wire9))) ?
                  $unsigned(wire6) : $signed((^~(wire2 >= wire9)))) - $signed($unsigned((wire3 >> wire2[(3'h4):(1'h0)]))));
              reg13 <= wire2;
              reg14 <= {{$unsigned((|(8'hae))),
                      ($signed((wire4 ? wire11 : wire7)) ?
                          $unsigned(wire1) : reg12[(2'h2):(1'h0)])},
                  wire5};
            end
          else
            begin
              reg12 <= $unsigned($signed($unsigned($unsigned($signed(wire3)))));
              reg13 <= (wire2 ?
                  (!((reg12 && $signed((8'h9e))) ^ ((-reg14) ?
                      {(8'hb0)} : (wire11 + wire1)))) : {$signed(wire9[(2'h2):(2'h2)])});
              reg14 <= $signed($unsigned((((wire0 ? wire2 : wire0) ?
                      (|reg13) : wire1) ?
                  $unsigned($unsigned(wire9)) : {(wire4 ? wire1 : (8'ha7))})));
            end
        end
      else
        begin
          if (wire5)
            begin
              reg12 <= reg13[(4'hc):(1'h0)];
              reg13 <= ((wire11[(3'h4):(2'h2)] * $signed((|$signed((8'hb7))))) - {wire9[(1'h0):(1'h0)]});
              reg14 <= wire11;
            end
          else
            begin
              reg12 <= $signed($signed($signed(wire6[(3'h6):(3'h5)])));
              reg13 <= wire7;
              reg14 <= $signed($unsigned($signed(wire8)));
              reg15 <= ($signed($signed(wire9[(4'h8):(4'h8)])) * wire2[(3'h5):(3'h4)]);
              reg16 <= (8'ha8);
            end
          reg17 <= $unsigned($signed(((~&$unsigned(wire2)) ?
              $unsigned((reg16 ? (8'ha5) : reg15)) : {(+wire0), (~|wire10)})));
        end
      reg18 <= {reg17, (!$unsigned($unsigned((wire2 != wire5))))};
      reg19 <= ($unsigned((^((reg18 ? wire10 : reg12) ?
          {wire0, (8'ha8)} : (~^reg14)))) + {wire1});
      reg20 <= $unsigned(reg14);
    end
  assign wire21 = $unsigned($signed($unsigned($unsigned($signed(wire1)))));
  assign wire22 = (~^(-$unsigned((8'hbe))));
  always
    @(posedge clk) begin
      if (wire1[(5'h12):(3'h5)])
        begin
          if ($unsigned((+((~^(|reg19)) != $unsigned((wire3 ?
              wire2 : (8'hae)))))))
            begin
              reg23 <= ($unsigned($signed(($signed(reg13) ?
                      wire10[(1'h1):(1'h0)] : {reg14}))) ?
                  $unsigned((~{wire7[(3'h5):(2'h2)],
                      (wire3 == wire21)})) : $signed({(wire10 ?
                          reg14[(3'h5):(2'h2)] : $unsigned(reg20))}));
              reg24 <= $unsigned((^~$unsigned((wire10 ?
                  (wire21 ? reg12 : wire1) : (reg14 ? wire3 : reg13)))));
            end
          else
            begin
              reg23 <= ($signed(reg12[(1'h0):(1'h0)]) ?
                  wire8[(3'h4):(3'h4)] : (~|$unsigned(reg23[(2'h3):(2'h3)])));
              reg24 <= reg13[(4'h9):(1'h1)];
              reg25 <= reg23;
            end
          reg26 <= (wire9 - $signed($unsigned(wire5)));
          reg27 <= (^(~^$signed(reg16)));
          reg28 <= (+(reg24 == ((wire7[(3'h4):(3'h4)] ?
                  wire9[(1'h1):(1'h0)] : (reg18 >>> reg13)) ?
              $unsigned((wire7 > reg17)) : (|$unsigned(reg17)))));
          if ((^~(8'ha7)))
            begin
              reg29 <= $signed(wire11[(2'h3):(2'h3)]);
              reg30 <= wire8;
              reg31 <= ({($unsigned((reg12 + reg25)) > (reg12 ?
                      (reg15 ?
                          reg23 : wire7) : $unsigned(reg18)))} & {$signed($unsigned(reg13[(1'h0):(1'h0)])),
                  ($signed((wire11 << wire4)) || $unsigned(((8'haa) >> (8'h9f))))});
              reg32 <= ((~$unsigned($unsigned(wire22))) ?
                  wire5[(2'h3):(1'h0)] : ((wire2[(4'hb):(4'ha)] ^ {wire9,
                          {reg26, (8'hb5)}}) ?
                      ((^(wire9 > (8'ha3))) ^ {reg13[(3'h6):(3'h4)]}) : wire9[(4'ha):(3'h6)]));
            end
          else
            begin
              reg29 <= $unsigned($unsigned(($signed((wire5 < wire1)) ?
                  ($signed(wire9) ?
                      reg27[(5'h10):(4'h8)] : (reg31 ?
                          wire5 : wire9)) : ({wire0, (8'ha4)} ?
                      $signed(wire7) : (reg14 || reg14)))));
            end
        end
      else
        begin
          reg23 <= reg31;
          reg24 <= {$signed({({wire10, reg27} ^~ $signed(reg18)),
                  $signed(reg20)})};
        end
    end
  assign wire33 = (reg25 ?
                      $signed(wire22[(5'h10):(1'h1)]) : $unsigned((~^((~&reg26) | (wire22 ?
                          reg19 : (8'haa))))));
endmodule
