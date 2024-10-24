module top
#(parameter param38 = {(~(({(8'hb2)} > (~|(8'hac))) ? {((8'h9d) <= (8'haf)), (^(8'hbb))} : (((8'ha7) - (8'hb2)) ? (~|(8'ha6)) : ((8'hb6) ? (7'h41) : (8'hb8)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
                 wire13,
                 wire12,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg21,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg11,
                 (1'h0)};
  assign wire5 = $signed($unsigned(((wire0[(2'h2):(2'h2)] >= (wire1 ?
                         wire3 : wire4)) ?
                     (~&(wire3 ?
                         wire1 : wire2)) : ($signed(wire1) == (wire1 < wire2)))));
  assign wire6 = {$unsigned($unsigned($unsigned(wire1))),
                     $unsigned({{(wire3 ? wire2 : wire2), (wire0 ^ wire4)}})};
  assign wire7 = $unsigned((^wire4));
  assign wire8 = $unsigned(wire6);
  assign wire9 = $signed(wire7[(1'h0):(1'h0)]);
  assign wire10 = wire2;
  always
    @(posedge clk) begin
      reg11 <= (((+($signed(wire7) ?
          wire1[(1'h0):(1'h0)] : {(8'hbf)})) >> {((wire3 ?
              wire4 : wire6) == (|wire7)),
          ({wire10,
              wire6} && wire0[(3'h6):(1'h1)])}) && $unsigned($signed($signed((~(8'haa))))));
    end
  assign wire12 = $unsigned($unsigned((wire2 >= $signed((~|wire1)))));
  assign wire13 = $unsigned($signed($signed(((wire3 && wire2) || (wire7 ?
                      wire12 : wire3)))));
  always
    @(posedge clk) begin
      reg14 <= (^~((((wire7 ? wire6 : reg11) ?
              $signed((7'h42)) : $unsigned((8'hb8))) - wire1) ?
          $signed(($signed((8'ha2)) ?
              (wire6 > wire7) : $unsigned((8'hbf)))) : $signed(((^~wire8) ?
              (wire1 > (8'hbd)) : wire10))));
      reg15 <= wire7;
      reg16 <= ($signed(wire1) ^~ (^($signed({reg11, wire2}) >> (!(wire9 ?
          wire12 : wire0)))));
      reg17 <= $unsigned({{$signed((+reg15))}, (+$signed($unsigned(wire4)))});
      reg18 <= $signed((wire10 * (((reg16 ? wire3 : reg11) ?
          $unsigned(reg17) : wire13) >> ($unsigned(wire1) << (~^wire10)))));
    end
  assign wire19 = $signed((($unsigned((wire2 ?
                          wire3 : (8'ha3))) > reg15[(4'ha):(4'ha)]) ?
                      $unsigned($signed($unsigned(wire5))) : (~&($signed(wire8) ^~ wire9[(1'h0):(1'h0)]))));
  assign wire20 = $signed(($signed((^$unsigned(wire13))) ?
                      $signed($signed(wire9[(4'hc):(4'hc)])) : $signed((wire3[(1'h0):(1'h0)] <<< $unsigned(wire10)))));
  always
    @(posedge clk) begin
      reg21 <= (+((reg11[(1'h1):(1'h1)] ?
          wire10 : $signed((wire0 ?
              wire7 : reg15))) << (^reg16[(3'h6):(3'h5)])));
    end
  assign wire22 = $signed((-wire10[(4'hc):(1'h0)]));
  assign wire23 = (~reg17);
  assign wire24 = ((~&((+reg16) * (wire1 <<< $signed((8'hb3))))) != $unsigned($unsigned(wire8[(4'hb):(4'hb)])));
  always
    @(posedge clk) begin
      reg25 <= $unsigned(((((wire9 ? wire4 : reg16) ?
              {wire22, wire1} : ((8'hbf) ? reg15 : wire22)) ?
          $signed(wire6) : wire2[(1'h1):(1'h0)]) + $unsigned((8'ha3))));
      reg26 <= $signed({($unsigned((!wire3)) <<< (^wire5[(5'h12):(2'h2)])),
          $unsigned($signed((~wire20)))});
      if ((|$signed($unsigned((&(wire9 ? wire12 : wire4))))))
        begin
          if ({wire13})
            begin
              reg27 <= reg16[(4'ha):(3'h7)];
              reg28 <= ((8'hba) | {$unsigned((((8'hae) ?
                      reg21 : wire12) >= wire22)),
                  ($unsigned($signed(wire23)) ?
                      (8'ha9) : $signed(wire19[(4'ha):(4'h8)]))});
              reg29 <= ({$unsigned(reg25[(4'he):(4'hd)]),
                      reg28[(2'h2):(2'h2)]} ?
                  wire2[(1'h0):(1'h0)] : (wire24 + $unsigned($unsigned({wire8}))));
              reg30 <= wire23;
            end
          else
            begin
              reg27 <= ((~&$signed($signed((~^reg30)))) ?
                  reg30 : (~^$unsigned($unsigned((reg16 ? wire24 : (7'h40))))));
              reg28 <= wire9[(5'h11):(2'h2)];
            end
          reg31 <= (reg26 ?
              ($unsigned($signed((wire0 * reg21))) ~^ {$unsigned($signed((7'h41)))}) : $unsigned(wire5));
        end
      else
        begin
          if ((($signed(wire19[(4'h9):(2'h3)]) ?
                  $unsigned(reg16) : $signed({(reg27 != wire9), (^~(8'hb1))})) ?
              {reg21,
                  ($unsigned($signed(wire0)) ?
                      ({(8'haf),
                          reg17} != wire22) : (~$signed(wire22)))} : (reg31[(3'h4):(1'h1)] ?
                  (|reg26[(4'h8):(3'h6)]) : $unsigned((wire5[(5'h11):(4'hd)] ?
                      $signed(reg30) : ((8'hb4) * reg31))))))
            begin
              reg27 <= wire24[(1'h1):(1'h0)];
              reg28 <= $unsigned(($signed((|(wire4 ? reg30 : wire6))) ?
                  ($unsigned($unsigned(wire7)) ?
                      (~|(wire19 ?
                          (8'haf) : wire6)) : $unsigned(reg11)) : reg26[(3'h4):(1'h0)]));
              reg29 <= $unsigned((((wire2[(1'h1):(1'h1)] <= wire3[(2'h3):(1'h0)]) == ((^~wire24) ?
                  $unsigned(wire2) : wire0[(4'h9):(2'h3)])) <= wire8));
              reg30 <= (reg11[(2'h2):(1'h0)] + $unsigned((+$signed($signed(wire7)))));
              reg31 <= $signed(($signed((^~wire22)) == ((~^reg25[(4'he):(1'h1)]) ?
                  wire22[(3'h5):(3'h5)] : ($unsigned((8'ha2)) >>> $unsigned(reg11)))));
            end
          else
            begin
              reg27 <= ((wire2 >= wire13[(5'h14):(3'h6)]) ?
                  ((8'hbf) ? (|wire9) : reg17[(1'h0):(1'h0)]) : $signed(reg14));
              reg28 <= ($unsigned($unsigned(((+wire24) >> $signed((8'h9c))))) ?
                  ((!wire2[(1'h1):(1'h1)]) >>> (~$signed(wire22))) : (wire2[(2'h2):(1'h1)] < $signed(reg15[(3'h6):(2'h2)])));
              reg29 <= ((wire9[(4'ha):(1'h0)] ?
                  {$unsigned((reg28 ? reg21 : reg27)),
                      (-wire19)} : (reg31[(2'h3):(1'h0)] - (reg15 ?
                      {wire24, (8'hb4)} : wire24))) >= ($signed((+(8'ha6))) ?
                  wire6 : wire1[(3'h5):(3'h5)]));
            end
          if ((8'ha2))
            begin
              reg32 <= reg14;
              reg33 <= reg17;
              reg34 <= wire8;
            end
          else
            begin
              reg32 <= reg18;
              reg33 <= (reg16 ? (^~wire13) : wire2);
            end
        end
      reg35 <= (-reg15);
    end
  assign wire36 = $unsigned((($unsigned(((8'ha4) != wire9)) ?
                          $signed((wire24 && wire9)) : $unsigned((reg32 ?
                              (8'hba) : reg14))) ?
                      $signed($unsigned((wire3 > wire24))) : $unsigned((8'hbb))));
  assign wire37 = ($unsigned((^{(reg18 ?
                          wire4 : (8'h9d))})) >>> ((~&reg14[(5'h14):(5'h12)]) ?
                      {reg28[(3'h5):(3'h5)], reg34} : $signed($signed((reg31 ?
                          reg29 : wire10)))));
endmodule
