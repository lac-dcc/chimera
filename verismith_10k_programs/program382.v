module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h232):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  assign y = {wire48,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 (1'h0)};
  assign wire5 = wire3[(4'ha):(4'ha)];
  assign wire6 = wire5;
  assign wire7 = wire4[(3'h4):(2'h3)];
  assign wire8 = (^$unsigned($signed($signed((!wire5)))));
  assign wire9 = (&$unsigned($unsigned($signed(wire7))));
  assign wire10 = $unsigned((~|wire9[(2'h2):(1'h0)]));
  assign wire11 = wire7[(3'h6):(3'h4)];
  assign wire12 = ({(wire4[(3'h5):(2'h3)] >>> (|(~|wire4))),
                          (~&((wire8 ^ wire3) ?
                              (&wire11) : $unsigned(wire8)))} ?
                      $signed(({$signed(wire5), (wire3 ? (8'hac) : (8'haa))} ?
                          ((~&(8'hb9)) ?
                              {wire1,
                                  wire3} : $signed(wire2)) : {$unsigned(wire8),
                              (~&(8'hb3))})) : (8'hbd));
  assign wire13 = $unsigned(wire5);
  assign wire14 = $unsigned($signed(($unsigned((wire9 ?
                      (8'haa) : wire13)) < ((wire4 ?
                      wire4 : wire0) - wire13))));
  assign wire15 = wire13;
  assign wire16 = (!$signed({$unsigned($signed((8'ha0))),
                      ((wire14 + wire5) ?
                          (wire0 ? (8'hb2) : (8'hbd)) : ((8'ha4) != wire14))}));
  always
    @(posedge clk) begin
      reg17 <= wire12;
      if ($unsigned(((($signed((8'ha8)) ?
                  (wire14 ? wire10 : wire5) : $signed(wire6)) ?
              reg17[(3'h6):(3'h4)] : $signed(wire9)) ?
          $signed(((wire15 ? wire2 : wire1) | {wire8})) : reg17)))
        begin
          reg18 <= wire6;
          reg19 <= $unsigned(wire3);
          reg20 <= wire3;
        end
      else
        begin
          reg18 <= (&$signed($unsigned(wire3)));
          reg19 <= wire8;
          if ({($unsigned((reg19 ? $unsigned(reg18) : {wire1})) ~^ wire12),
              (+reg20)})
            begin
              reg20 <= (~&(~|wire4));
              reg21 <= $unsigned((($unsigned(wire7[(3'h6):(3'h4)]) ^~ {(wire10 ?
                      wire6 : wire3),
                  $signed(wire1)}) >= (~&(((8'hb5) == wire16) ~^ $signed((8'h9d))))));
            end
          else
            begin
              reg20 <= (~|wire0[(1'h0):(1'h0)]);
              reg21 <= (~&(({wire2[(1'h0):(1'h0)],
                      wire13[(4'hf):(3'h7)]} || (~&(&(8'hb5)))) ?
                  $unsigned(((8'hbf) ?
                      (wire10 ?
                          wire10 : (8'h9f)) : {wire4})) : wire8[(3'h5):(1'h0)]));
            end
          reg22 <= wire10[(3'h4):(2'h2)];
          if (reg19[(1'h0):(1'h0)])
            begin
              reg23 <= {wire13};
              reg24 <= ((wire5[(4'ha):(4'h8)] != wire6) != reg20);
              reg25 <= $unsigned($signed($signed((^~$unsigned(reg24)))));
              reg26 <= (~&($unsigned(reg23[(5'h13):(4'hd)]) ?
                  (~|$signed(wire15[(3'h7):(2'h2)])) : (($signed(wire9) ~^ wire11[(3'h5):(2'h3)]) ?
                      (-$unsigned(reg18)) : $signed($signed((8'ha8))))));
            end
          else
            begin
              reg23 <= ((8'haa) <= ((~&((wire6 >= (8'h9c)) ?
                      (wire3 ? reg21 : wire10) : {reg25, wire4})) ?
                  $signed((~|(|(8'hb7)))) : (wire15 ?
                      ((wire11 == wire9) ?
                          (-reg26) : reg18[(3'h5):(3'h5)]) : (^~wire7[(2'h3):(2'h3)]))));
              reg24 <= ($unsigned($signed(wire0[(3'h6):(3'h5)])) || (~(((|wire4) << wire2[(5'h12):(5'h11)]) >>> reg21)));
            end
        end
      reg27 <= wire6[(1'h1):(1'h0)];
    end
  assign wire28 = {{$signed(((wire14 ? wire8 : wire1) ?
                              (reg20 <<< reg25) : $unsigned(wire5)))}};
  assign wire29 = {$unsigned(wire15[(4'h9):(3'h7)])};
  assign wire30 = $signed(((~(wire13[(4'hb):(3'h4)] ~^ (+wire13))) ?
                      ($signed((~&reg25)) ?
                          (^(reg17 ~^ wire6)) : reg20[(4'hd):(2'h3)]) : ($signed((wire5 ?
                              reg24 : reg22)) ?
                          $signed($signed((8'hb7))) : $unsigned({wire28,
                              wire9}))));
  assign wire31 = $signed($signed((+reg26)));
  always
    @(posedge clk) begin
      reg32 <= (|$signed($unsigned($signed((^wire30)))));
      if (wire4[(4'h9):(3'h4)])
        begin
          reg33 <= reg25[(3'h5):(2'h3)];
          reg34 <= ((reg20[(4'he):(2'h2)] ?
                  {(8'hac), $signed((&(8'ha4)))} : {{reg18[(3'h5):(2'h2)]},
                      ((wire12 ? wire2 : wire13) ^ (~|wire10))}) ?
              (reg20[(3'h5):(2'h2)] ?
                  {wire16} : reg18) : $unsigned((reg24[(1'h0):(1'h0)] << wire0)));
          if (wire2[(1'h1):(1'h0)])
            begin
              reg35 <= $unsigned(wire13);
              reg36 <= reg19[(3'h6):(1'h1)];
              reg37 <= (&reg19[(3'h7):(2'h3)]);
              reg38 <= (~&(wire3 + $signed($signed((reg19 || reg36)))));
            end
          else
            begin
              reg35 <= $unsigned(($signed($unsigned((+wire8))) < {$unsigned({wire2}),
                  ((wire28 || wire30) ? (reg27 + wire9) : reg24)}));
            end
        end
      else
        begin
          if ($unsigned(wire31))
            begin
              reg33 <= ((reg25 << (8'ha7)) ~^ {wire3[(2'h2):(2'h2)]});
              reg34 <= $unsigned((wire28 ^~ ((reg35 ?
                  $signed(wire11) : (reg23 ? wire6 : wire29)) + ((wire15 ?
                      wire7 : wire29) ?
                  reg35 : (reg32 ? wire4 : (8'hb1))))));
              reg35 <= reg33;
              reg36 <= reg22[(2'h3):(2'h3)];
            end
          else
            begin
              reg33 <= $signed(($signed(((reg21 * wire16) >= (wire14 >>> reg35))) & ((^~reg24[(2'h2):(1'h0)]) ?
                  reg23[(3'h7):(3'h5)] : wire3[(2'h2):(1'h0)])));
              reg34 <= (reg37[(4'hb):(1'h0)] ?
                  (($unsigned({reg26, wire31}) && (wire7 ?
                      (wire28 ?
                          wire28 : wire14) : (reg32 - wire2))) - wire31) : {(~&$signed((reg34 ?
                          reg20 : reg37)))});
              reg35 <= reg20[(2'h3):(1'h0)];
              reg36 <= wire4[(2'h3):(2'h3)];
              reg37 <= reg32;
            end
          if (($unsigned(wire8[(5'h10):(4'hd)]) ?
              (reg27 ? wire2[(5'h12):(2'h2)] : (8'hb2)) : wire9))
            begin
              reg38 <= {wire30};
              reg39 <= reg20;
              reg40 <= reg19[(4'h8):(2'h3)];
              reg41 <= $unsigned(wire12);
            end
          else
            begin
              reg38 <= {$unsigned($unsigned($signed($signed(reg40)))),
                  ({reg32[(3'h6):(3'h5)], reg33[(4'hf):(1'h0)]} ?
                      $unsigned((~&$signed(reg19))) : $signed((&reg21)))};
              reg39 <= $signed((({(reg35 ^~ reg39), reg24} && $signed(reg22)) ?
                  wire6[(3'h7):(3'h6)] : wire5[(4'hc):(1'h0)]));
              reg40 <= reg17[(4'hd):(4'hb)];
              reg41 <= $signed($signed({((reg24 ?
                      wire16 : reg21) <<< $unsigned(reg26))}));
              reg42 <= $unsigned(($unsigned($unsigned($signed((8'hae)))) + wire13));
            end
          if (reg25)
            begin
              reg43 <= reg20[(1'h1):(1'h1)];
              reg44 <= wire11[(4'hf):(1'h1)];
              reg45 <= ($unsigned(reg24) | $unsigned(({wire11} ?
                  {wire9[(5'h14):(3'h5)],
                      $unsigned(wire8)} : $signed(wire7[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg43 <= (reg44 ?
                  ((reg18[(1'h0):(1'h0)] ?
                      (((8'h9d) ? reg43 : wire29) ?
                          $signed(reg26) : $signed(reg21)) : wire30) && $signed({(8'haa)})) : (8'hb3));
              reg44 <= (-reg18[(1'h0):(1'h0)]);
            end
          reg46 <= (+((((+reg39) ? $unsigned(reg19) : $signed(reg38)) ?
              $unsigned(wire0) : (wire10 & $signed(reg39))) ^ {$unsigned($unsigned(reg27))}));
        end
      reg47 <= $unsigned((wire6 ^~ wire14[(4'h8):(1'h1)]));
    end
  assign wire48 = $signed(($unsigned(reg33[(1'h0):(1'h0)]) ?
                      (^$signed(reg44[(2'h2):(2'h2)])) : reg39[(3'h6):(1'h1)]));
endmodule
