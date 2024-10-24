module top
#(parameter param40 = {(!(~|(!((8'h9e) >> (8'ha9))))), (((8'ha8) & {((8'ha3) ^ (8'ha5))}) ? (!(&((8'hb6) < (8'hab)))) : {(^~((8'ha6) ? (8'hb8) : (8'ha0))), {{(8'hbd), (8'ha7)}, ((8'h9e) ? (8'hac) : (8'ha4))}})}, 
parameter param41 = param40)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  assign y = {wire39,
                 wire36,
                 wire28,
                 wire27,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = $signed(wire3[(4'h8):(3'h5)]);
  assign wire5 = $signed(wire2[(3'h4):(1'h1)]);
  assign wire6 = wire3;
  assign wire7 = wire4[(2'h3):(2'h3)];
  assign wire8 = $unsigned((~^(wire5 >> wire6[(4'he):(4'h9)])));
  always
    @(posedge clk) begin
      reg9 <= $unsigned(wire8);
      reg10 <= {{($signed((wire4 < wire1)) ?
                  ((wire6 < wire1) == (~|wire4)) : wire1),
              $unsigned($signed((!(8'hb6))))}};
      if ((7'h40))
        begin
          reg11 <= wire8[(4'hc):(3'h5)];
          reg12 <= wire2[(3'h7):(1'h0)];
        end
      else
        begin
          reg11 <= $unsigned($signed(($signed($signed(reg9)) + wire0)));
        end
      reg13 <= reg12[(2'h2):(2'h2)];
    end
  assign wire14 = ($unsigned(wire7) ?
                      reg11 : {{$unsigned((~^reg11))},
                          ({$signed((8'hb8))} ?
                              (~^(~|(8'hba))) : $unsigned($signed(wire4)))});
  always
    @(posedge clk) begin
      if ((^wire8[(3'h7):(2'h2)]))
        begin
          reg15 <= ((wire7 ?
              ({wire1} * ((|wire7) * (~|wire3))) : wire14[(2'h3):(1'h0)]) > $unsigned($unsigned(wire7[(4'hc):(4'h8)])));
          reg16 <= $signed({reg11[(1'h1):(1'h1)], reg11});
          reg17 <= {(reg10[(3'h7):(1'h0)] ~^ (-(~(^wire1))))};
          reg18 <= $unsigned(reg11);
          reg19 <= ((reg18[(1'h1):(1'h1)] ?
              (wire8 ?
                  $signed(((8'hbe) < wire5)) : ({(8'ha6)} > (reg16 << reg13))) : (reg16 <<< ($unsigned((8'hb6)) ?
                  ((7'h40) ? reg9 : wire7) : (wire2 ?
                      wire8 : wire7)))) | reg17);
        end
      else
        begin
          reg15 <= reg19[(3'h5):(2'h2)];
          reg16 <= {(^~(((^(7'h44)) << (reg9 ? reg18 : reg12)) ?
                  ($unsigned((8'hbf)) ?
                      {reg10, (8'hb8)} : (+(8'hbe))) : ($unsigned(reg9) ?
                      {wire4, reg9} : $signed(wire5)))),
              ((^wire0[(1'h1):(1'h1)]) ?
                  wire4[(1'h0):(1'h0)] : (-$signed($unsigned(reg9))))};
          reg17 <= ($unsigned(reg17) ^ reg16);
        end
      if ((+($signed((wire5 >> {(8'ha4)})) * (^{reg18}))))
        begin
          reg20 <= (reg15[(4'he):(4'hd)] ? wire8 : wire14);
          if (((8'hb4) ?
              ($signed($signed(reg20[(4'ha):(4'ha)])) + wire0) : $unsigned(((8'hba) <= ((wire8 - wire4) ?
                  (+(8'ha9)) : reg11[(1'h0):(1'h0)])))))
            begin
              reg21 <= $signed(reg16);
              reg22 <= (reg11[(2'h3):(1'h1)] ?
                  ({{$unsigned(reg16), (reg18 >>> reg9)},
                          ($signed((8'ha7)) ^ (8'ha0))} ?
                      {reg19[(1'h1):(1'h1)],
                          (wire5 ?
                              (wire1 << reg15) : (reg18 >>> reg21))} : (&(-wire2))) : reg15[(4'ha):(1'h0)]);
            end
          else
            begin
              reg21 <= reg13;
              reg22 <= (|$signed($signed($signed(reg12[(1'h0):(1'h0)]))));
              reg23 <= ($signed($signed(((~&wire8) ?
                      (reg22 != reg22) : wire3[(5'h14):(5'h12)]))) ?
                  reg17 : wire4[(3'h6):(1'h1)]);
              reg24 <= $unsigned(($signed(reg15) && reg17[(4'hd):(4'hc)]));
            end
          reg25 <= (reg18 ^~ wire8);
        end
      else
        begin
          reg20 <= reg12[(2'h3):(2'h3)];
          reg21 <= (!(-(($signed((8'hb8)) ?
              reg10 : {reg10, reg12}) * wire3[(3'h5):(2'h3)])));
        end
      reg26 <= reg24;
    end
  assign wire27 = $unsigned((+(reg22 ?
                      $unsigned((reg15 ?
                          reg24 : wire6)) : {reg21[(2'h2):(1'h1)]})));
  assign wire28 = wire8;
  always
    @(posedge clk) begin
      if ((($unsigned(($signed(wire6) <= $signed(wire3))) ?
              $unsigned(reg16) : {$unsigned((|reg15)), $signed(reg23)}) ?
          ((~|((reg17 << reg11) ^~ {reg9,
              reg11})) > reg10[(4'h8):(1'h0)]) : (({reg21,
              reg9[(1'h1):(1'h1)]} || (8'hb5)) ^~ ($signed(reg24) | $signed(reg25[(3'h4):(1'h0)])))))
        begin
          if ($unsigned($signed(({(-reg24)} ?
              (reg16[(1'h0):(1'h0)] ?
                  reg26[(2'h2):(1'h1)] : wire3[(1'h0):(1'h0)]) : $unsigned(wire4)))))
            begin
              reg29 <= (reg26 ?
                  ($unsigned($unsigned((|reg15))) ?
                      {$unsigned((reg13 ? (8'hb8) : reg11)),
                          $unsigned($unsigned(reg13))} : ((reg25 <<< (reg12 ?
                              reg21 : (8'h9e))) ?
                          $signed(wire8[(4'ha):(1'h0)]) : ($signed(reg22) ?
                              (!reg9) : $unsigned(wire27)))) : reg20);
              reg30 <= {wire2, wire27};
              reg31 <= $signed({$unsigned(reg30),
                  {((~^reg20) ? wire4[(3'h4):(1'h1)] : $unsigned(reg26))}});
            end
          else
            begin
              reg29 <= $signed($unsigned($unsigned((wire4 <<< wire5[(3'h6):(2'h2)]))));
              reg30 <= (~^(~reg12));
              reg31 <= (reg26[(1'h1):(1'h1)] << wire6[(4'hd):(3'h5)]);
            end
          reg32 <= $signed(wire3[(2'h3):(2'h3)]);
          reg33 <= wire5[(4'h9):(4'h9)];
          reg34 <= wire7[(2'h3):(1'h1)];
        end
      else
        begin
          reg29 <= {$signed({$unsigned((~|wire3))}), (8'hab)};
          reg30 <= reg19;
          if ({(|$unsigned(reg17[(4'h9):(3'h5)]))})
            begin
              reg31 <= (~^((7'h44) ?
                  reg23[(2'h2):(2'h2)] : $unsigned($signed((reg16 | reg11)))));
              reg32 <= {reg17[(4'hf):(3'h7)]};
              reg33 <= $signed({(!$signed(wire4[(2'h3):(1'h1)]))});
            end
          else
            begin
              reg31 <= (8'ha9);
            end
        end
      reg35 <= reg25;
    end
  assign wire36 = $signed($signed(reg9));
  always
    @(posedge clk) begin
      reg37 <= ((~^wire27[(5'h11):(1'h0)]) ?
          (~&$signed({(|reg29)})) : $unsigned((wire4 > $signed(reg10))));
      reg38 <= $unsigned(reg18[(3'h7):(3'h7)]);
    end
  assign wire39 = ((+(^~$signed(reg25[(4'h8):(4'h8)]))) <<< ({({wire0, reg22} ?
                              (~reg11) : reg17[(2'h3):(1'h1)])} ?
                      ((-(reg35 ^ reg21)) ?
                          (8'hb8) : $unsigned((|wire1))) : (((~|wire0) ?
                          reg11[(1'h0):(1'h0)] : $signed(reg38)) >>> (wire5 | (^~wire8)))));
endmodule
