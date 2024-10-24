module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire30;
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 (1'h0)};
  module5 #() modinst31 (wire30, clk, wire1, wire3, wire2, wire0, wire4);
  assign wire32 = wire3;
  assign wire33 = ((+(wire3 ? (~&wire30) : wire4)) | wire2[(4'hd):(4'ha)]);
  assign wire34 = $unsigned({(|wire4[(3'h6):(3'h5)]), wire4[(3'h4):(1'h0)]});
  assign wire35 = ((wire34[(2'h3):(2'h3)] ?
                          $unsigned($unsigned((-wire0))) : (8'hb4)) ?
                      ($signed($unsigned(wire33)) ?
                          {wire0} : (-(wire4[(3'h7):(3'h5)] << (wire4 + wire0)))) : (^~{($unsigned((8'ha3)) ^ ((8'hbd) ?
                              wire32 : wire30))}));
  assign wire36 = $signed(wire33);
  assign wire37 = (8'hac);
  assign wire38 = $unsigned(wire2);
  assign wire39 = $signed((((|wire35[(4'he):(4'ha)]) || ((-wire0) ?
                          $signed(wire36) : (+wire34))) ?
                      wire37[(3'h5):(3'h4)] : (~((wire37 ? (7'h41) : wire32) ?
                          (wire4 ^ (8'h9e)) : wire3))));
  assign wire40 = (8'had);
  assign wire41 = $unsigned(wire35);
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
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
                 (1'h0)};
  assign wire11 = wire10;
  assign wire12 = (wire7 ?
                      (8'hb2) : (((+(|wire10)) ?
                          (&wire11[(2'h3):(1'h1)]) : (wire6[(4'hb):(4'ha)] - $unsigned(wire10))) >= ((wire7[(3'h4):(1'h1)] ?
                          (wire8 == wire10) : $signed(wire11)) >>> wire8[(4'h9):(4'h9)])));
  assign wire13 = (-{$unsigned(($signed(wire7) ? (8'hbf) : {wire11})),
                      (wire6 ?
                          ((wire10 ?
                              wire8 : (8'had)) > (wire12 && wire9)) : $signed($unsigned(wire9)))});
  assign wire14 = wire12[(2'h3):(1'h1)];
  assign wire15 = ({(($signed((8'ha9)) ?
                              (wire8 ? wire10 : wire8) : wire7[(3'h4):(1'h0)]) ?
                          wire14[(1'h0):(1'h0)] : (8'hb9))} ~^ ($signed((wire6[(4'hc):(3'h4)] ?
                          (wire10 || wire14) : {wire10, wire11})) ?
                      wire13[(1'h1):(1'h0)] : (~^$unsigned((wire6 ?
                          wire12 : wire7)))));
  always
    @(posedge clk) begin
      if ($unsigned(((+wire9[(2'h3):(1'h0)]) ? wire15 : wire8)))
        begin
          reg16 <= wire6[(3'h7):(2'h2)];
        end
      else
        begin
          reg16 <= wire13[(2'h2):(2'h2)];
          reg17 <= ((wire14[(2'h2):(1'h0)] ?
              $signed(wire9) : wire14) & (($unsigned({wire9}) ~^ wire10[(4'ha):(3'h6)]) ?
              (8'hba) : ($unsigned((!wire14)) ^~ $signed((wire11 ?
                  reg16 : wire9)))));
          reg18 <= {$signed(reg17[(1'h0):(1'h0)]), $signed(reg16)};
        end
      if (((|wire14) ^ wire13[(2'h3):(2'h2)]))
        begin
          reg19 <= $signed((^~(^~$signed(wire11))));
        end
      else
        begin
          reg19 <= wire11;
          if ((wire8 ?
              ($signed({(wire10 || wire6), (wire8 <= reg17)}) ?
                  wire11[(2'h2):(2'h2)] : (~^{reg19})) : (reg16 ?
                  (8'ha1) : (({reg18} > (wire12 ? wire10 : wire6)) + ((wire15 ?
                      wire15 : wire15) ^ (reg19 == wire11))))))
            begin
              reg20 <= (($signed(((wire15 ?
                          wire14 : wire10) < $signed((8'ha3)))) ?
                      wire10 : wire12) ?
                  $signed(((wire6 >= {reg16,
                      wire7}) >= $unsigned($signed(wire15)))) : $unsigned({(8'haa)}));
              reg21 <= (($signed($signed((wire15 > (8'h9f)))) ^ (reg16[(3'h6):(1'h1)] || ({(7'h43)} ?
                  (wire8 != reg19) : (wire11 ? wire7 : (7'h42))))) == reg20);
              reg22 <= ({{{$unsigned(reg20)}},
                  reg17[(4'he):(4'h9)]} <= {(wire6 ?
                      $unsigned(wire10[(5'h12):(3'h4)]) : ((!(8'ha5)) == reg17))});
              reg23 <= $unsigned($signed(($unsigned((reg16 >> reg22)) ?
                  $signed({wire12}) : wire11[(1'h0):(1'h0)])));
            end
          else
            begin
              reg20 <= ((($unsigned((wire7 ?
                      wire8 : reg18)) && $unsigned((wire15 & (8'ha4)))) >>> (reg20 ?
                      $unsigned(((8'hae) + reg22)) : wire10)) ?
                  reg16[(3'h7):(1'h0)] : (((&wire15[(1'h1):(1'h1)]) & ((wire11 & reg20) + wire6[(3'h4):(3'h4)])) || $signed(reg19)));
              reg21 <= $signed($unsigned(wire13[(1'h1):(1'h1)]));
              reg22 <= {($signed(reg17[(3'h6):(3'h6)]) ?
                      $signed(($unsigned(reg16) ?
                          reg19[(4'hc):(4'hc)] : ((8'hbc) ?
                              wire6 : wire12))) : {(!((8'ha0) <<< (8'had)))})};
              reg23 <= ($signed(wire8[(3'h7):(2'h3)]) | (reg20[(3'h5):(2'h3)] ?
                  $unsigned(wire8) : ($signed($signed(wire11)) ?
                      (wire13[(1'h0):(1'h0)] ^~ wire13[(2'h2):(2'h2)]) : (((8'hae) ?
                              reg20 : (8'hbd)) ?
                          (|(7'h42)) : reg16[(4'he):(4'h9)]))));
              reg24 <= (($signed(((wire13 ? (8'ha5) : reg19) ?
                          reg18[(4'hc):(4'ha)] : $signed((8'h9c)))) ?
                      $unsigned(reg18) : (+{(~wire13), (~reg20)})) ?
                  $signed((((reg16 ?
                      wire10 : wire11) ^ wire7[(3'h4):(2'h3)]) | $signed((wire7 ^~ reg20)))) : $signed($unsigned($unsigned({wire8,
                      reg17}))));
            end
          reg25 <= (^{(((&wire6) ? $signed(wire13) : $signed(wire9)) ?
                  reg16 : (wire11[(3'h4):(1'h1)] ?
                      wire9[(3'h4):(1'h0)] : wire8)),
              wire10[(2'h2):(1'h0)]});
        end
      reg26 <= (((reg24 != {(reg25 <<< reg20)}) <<< (!$signed((8'hb7)))) ?
          ({(~$unsigned(wire6))} ?
              reg16[(5'h13):(5'h10)] : reg20) : ($unsigned((|wire14[(1'h0):(1'h0)])) ~^ (((wire7 > reg18) ?
              (|reg24) : (~|(8'hb4))) || ((reg22 ? wire6 : reg22) ?
              $signed(reg24) : reg18))));
    end
  assign wire27 = wire12[(3'h6):(1'h1)];
  assign wire28 = (reg17[(2'h3):(1'h0)] ?
                      reg18[(4'he):(3'h4)] : ($signed(((^~wire12) ?
                              $signed(wire10) : reg26)) ?
                          $unsigned((8'ha5)) : ((wire14 == reg26) >> (8'ha9))));
  assign wire29 = reg16[(4'hf):(4'hd)];
endmodule
