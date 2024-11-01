module top
#(parameter param41 = ((!(|(((8'hb8) ? (8'h9e) : (7'h42)) <<< ((8'hb6) ? (7'h41) : (8'ha3))))) ? (((|{(8'ha1)}) ^ ({(8'hbd), (7'h43)} ? ((8'hb8) & (8'hbd)) : (!(8'hba)))) ? (+(8'h9c)) : (({(8'hbb), (8'hb9)} ? ((8'hb9) ? (8'hb7) : (8'hbc)) : (8'hb0)) >= (~|((8'had) ? (8'h9c) : (8'hb5))))) : {((~^((8'hbc) ^ (8'hb8))) ? ({(8'h9d)} ? ((8'haf) ? (8'hb1) : (8'hb9)) : (!(8'hba))) : {((7'h44) | (8'hb6)), {(8'hb1)}}), ((((7'h44) ? (8'hb9) : (8'h9e)) >> {(8'ha4), (8'haa)}) ? ((|(8'hba)) + (8'hbe)) : (8'hae))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire24,
                 wire23,
                 wire22,
                 wire12,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg27,
                 reg26,
                 reg25,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 (1'h0)};
  assign wire4 = {$unsigned(wire3), (^(8'hbd))};
  assign wire5 = (({(&wire2[(4'h8):(3'h7)]), $signed((|wire3))} ?
                     $unsigned($signed((wire4 && (8'ha0)))) : (wire0 ?
                         ({(8'haf), wire4} ?
                             (wire0 ?
                                 wire3 : wire2) : $unsigned(wire0)) : (wire2[(4'hb):(3'h6)] ^~ $signed(wire4)))) & $unsigned(($signed(((8'hbb) | (8'ha3))) ~^ (8'hbb))));
  assign wire6 = wire2[(3'h5):(3'h5)];
  assign wire7 = wire0[(1'h1):(1'h1)];
  assign wire8 = ($signed((+wire1[(4'hf):(4'hd)])) >>> (~&wire3));
  assign wire9 = $unsigned((~^(|(-wire5[(2'h3):(1'h1)]))));
  assign wire10 = (((8'hba) ?
                      (((!wire3) ? wire5[(4'hb):(4'ha)] : {wire9}) ?
                          wire1 : ((wire3 ?
                              wire5 : wire5) ^~ (~^wire9))) : wire6[(3'h4):(1'h1)]) >>> ((wire0 ?
                      $unsigned($signed(wire3)) : (+(8'hbd))) >= {({wire0} && $unsigned((8'hab))),
                      (wire3 - wire5)}));
  always
    @(posedge clk) begin
      reg11 <= wire8;
    end
  assign wire12 = wire6[(4'he):(2'h3)];
  always
    @(posedge clk) begin
      if ((((wire10[(5'h11):(1'h1)] * wire12[(2'h3):(1'h1)]) ?
              wire1[(3'h5):(2'h2)] : $unsigned(wire3[(4'h9):(3'h4)])) ?
          $signed(wire2) : ($unsigned(($unsigned((8'h9d)) ?
                  wire6 : wire7[(1'h0):(1'h0)])) ?
              wire12[(1'h0):(1'h0)] : wire3)))
        begin
          reg13 <= (wire2[(4'h8):(4'h8)] ^~ $unsigned((wire3 - wire2)));
          reg14 <= (|wire1[(4'hb):(3'h5)]);
          if (((reg11 == (((!wire4) ? $signed(wire1) : (wire9 ~^ wire9)) ?
                  $signed($signed(reg14)) : ($signed((8'hb5)) ?
                      $unsigned(wire8) : wire8))) ?
              reg11 : ($signed({reg14[(2'h3):(1'h0)],
                  ((8'hb2) ?
                      wire7 : wire5)}) && $signed($unsigned((wire12 ^~ wire4))))))
            begin
              reg15 <= (~&$unsigned(wire2));
              reg16 <= (wire12 >= {($signed(wire0) >>> wire9)});
              reg17 <= $unsigned($unsigned(wire8[(3'h4):(1'h1)]));
              reg18 <= wire4;
            end
          else
            begin
              reg15 <= wire4[(3'h4):(3'h4)];
              reg16 <= ($signed((^(|$signed(wire7)))) != (reg18[(1'h0):(1'h0)] ?
                  reg16 : $signed(({wire7, wire9} ?
                      {reg11, wire12} : {(7'h42)}))));
            end
          reg19 <= reg13;
          reg20 <= $signed(((((wire6 ?
                  wire5 : wire8) ^~ ((7'h41) ~^ wire3)) <= (~&{wire12})) ?
              wire3[(4'h8):(2'h3)] : ({reg19} <= (-(wire0 ? wire10 : wire1)))));
        end
      else
        begin
          reg13 <= (+(wire3[(4'hd):(2'h2)] ?
              ($signed((^~reg19)) ?
                  (wire10 >> wire2) : $unsigned(((8'hae) - wire4))) : ({$signed(wire1),
                      (reg20 ^~ wire0)} ?
                  $signed($unsigned(wire2)) : (^$signed(wire8)))));
          reg14 <= wire3;
        end
      reg21 <= ($signed($unsigned(reg14[(3'h7):(1'h1)])) << ($unsigned((|{wire7})) <= reg13[(2'h2):(2'h2)]));
    end
  assign wire22 = wire8[(5'h11):(4'h8)];
  assign wire23 = $signed((wire10 ?
                      $signed((^~reg14[(3'h4):(2'h2)])) : (-reg13[(3'h6):(3'h5)])));
  assign wire24 = ((~&((~&reg15[(3'h5):(1'h0)]) <= (-(wire10 ?
                      wire9 : wire12)))) < $unsigned($signed(reg17)));
  always
    @(posedge clk) begin
      reg25 <= wire7[(2'h3):(1'h1)];
      reg26 <= (|(-$unsigned(reg15)));
      reg27 <= (!(~&$unsigned(wire22[(4'he):(3'h4)])));
    end
  assign wire28 = wire0[(3'h7):(1'h0)];
  assign wire29 = $unsigned($signed($unsigned($unsigned((!reg16)))));
  assign wire30 = wire5;
  assign wire31 = $signed(($unsigned(wire30) * $signed(((&(8'hbd)) ?
                      {reg21} : (^~wire7)))));
  assign wire32 = wire5[(4'hc):(3'h4)];
  assign wire33 = (+({reg11} >>> (-wire7[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg34 <= wire1;
      reg35 <= ($unsigned(wire33[(3'h4):(1'h1)]) ?
          $signed((8'ha6)) : (!$unsigned((wire2[(2'h2):(1'h1)] ?
              $signed(reg21) : (wire30 ? wire1 : reg18)))));
      reg36 <= (((reg27 >>> $signed((reg34 ?
          wire9 : reg17))) & $signed($unsigned(wire9))) + (((~^$unsigned(wire10)) != wire33[(4'h8):(2'h2)]) ?
          {$unsigned($unsigned((8'haf)))} : ((wire32[(2'h3):(2'h3)] <= (-reg14)) ?
              (|(~|reg35)) : wire32[(3'h4):(1'h1)])));
      if (wire32[(3'h5):(2'h2)])
        begin
          reg37 <= (reg18 ?
              reg35[(3'h7):(2'h3)] : ((~^(wire12[(3'h7):(3'h7)] ?
                  (wire10 ?
                      reg16 : wire32) : $signed(wire23))) | $signed(reg15)));
          reg38 <= $signed($unsigned((((^wire2) > $signed((8'hbe))) * (-(^wire7)))));
        end
      else
        begin
          if (((-wire4) == (-$signed(wire5))))
            begin
              reg37 <= (^(~^((reg19 ? $unsigned(reg18) : reg25) * (+(wire1 ?
                  wire24 : reg34)))));
              reg38 <= $unsigned($unsigned($signed(({reg35, wire3} ?
                  reg15[(2'h2):(1'h0)] : reg21[(3'h4):(3'h4)]))));
            end
          else
            begin
              reg37 <= (wire31[(3'h4):(3'h4)] ?
                  wire10 : $signed((~(-(~&(8'had))))));
              reg38 <= wire23[(4'hf):(4'hd)];
              reg39 <= $signed((reg17 ?
                  {(((8'h9e) && (8'hb8)) ?
                          {(8'hbc)} : wire7)} : reg35[(3'h7):(3'h4)]));
              reg40 <= {wire22};
            end
        end
    end
endmodule
