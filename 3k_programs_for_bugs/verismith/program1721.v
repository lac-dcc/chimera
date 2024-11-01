module top
#(parameter param78 = (~&{(+(((8'ha7) && (8'hb0)) ? (~&(8'ha2)) : ((7'h43) ? (7'h40) : (8'ha8))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire46;
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  assign y = {wire77,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire5,
                 wire6,
                 wire46,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg59,
                 reg58,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire5 = $signed((wire3 != (~|(((8'ha2) ? wire4 : wire1) ?
                     {wire2, wire0} : {wire0}))));
  assign wire6 = ((~&(~|$unsigned(wire5[(2'h3):(2'h3)]))) ^ wire5[(3'h6):(3'h5)]);
  module7 #() modinst47 (wire46, clk, wire1, wire4, wire3, wire0, wire6);
  always
    @(posedge clk) begin
      reg48 <= wire0;
      reg49 <= reg48;
      reg50 <= wire0[(5'h12):(4'ha)];
      reg51 <= wire0;
      reg52 <= wire46;
    end
  assign wire53 = wire2[(2'h3):(2'h2)];
  assign wire54 = $unsigned(wire2);
  assign wire55 = wire2[(2'h2):(2'h2)];
  assign wire56 = $signed(reg51[(3'h4):(1'h0)]);
  assign wire57 = ((~&(|($unsigned((8'hbb)) ?
                          wire46[(4'h9):(4'h9)] : $signed(wire4)))) ?
                      (^~wire6) : ($signed($signed(wire46[(5'h11):(3'h6)])) - (((wire5 ?
                          (8'h9f) : reg50) ^~ (wire55 * wire5)) >> wire4[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg58 <= (($signed(reg51[(2'h3):(1'h1)]) ?
              (&$signed((wire56 ?
                  wire54 : wire53))) : ($unsigned($unsigned(wire54)) >>> wire46)) ?
          (($unsigned((reg48 ? wire55 : wire0)) ?
                  wire0 : ((8'haf) ? (|wire1) : wire3)) ?
              wire2 : reg51[(1'h1):(1'h1)]) : $signed(($unsigned($unsigned(reg52)) >> (7'h41))));
      reg59 <= (+$unsigned(reg52));
    end
  assign wire60 = ($unsigned((!reg58)) & (~&(~&($unsigned(wire54) >> {reg49,
                      wire54}))));
  assign wire61 = $signed(({(reg50 ? $signed(reg49) : (reg49 | (8'hb1))),
                      $signed(((8'ha0) >= wire3))} < (reg50[(5'h13):(4'hf)] ?
                      $signed({reg48}) : reg50)));
  assign wire62 = ({(7'h43)} ?
                      (~|$unsigned($unsigned(wire55[(4'h8):(4'h8)]))) : wire5);
  assign wire63 = $unsigned(reg58);
  assign wire64 = (~$unsigned(($signed(reg59) ?
                      (^(~^reg48)) : {(wire62 ? wire54 : wire54),
                          (reg59 && reg50)})));
  assign wire65 = wire2;
  always
    @(posedge clk) begin
      reg66 <= (|(~|$unsigned((wire46[(3'h4):(2'h3)] << wire1[(2'h2):(1'h1)]))));
      reg67 <= $unsigned($unsigned((^wire62)));
      reg68 <= ((~&((-(+wire2)) ?
              (reg58 ? reg50 : (&reg52)) : (^$unsigned(reg59)))) ?
          (^~$unsigned(wire61)) : reg67);
      if (wire6)
        begin
          if ($signed($unsigned($unsigned(($unsigned((8'hb5)) * (^wire5))))))
            begin
              reg69 <= $unsigned((($unsigned($unsigned(wire54)) | reg59[(1'h1):(1'h1)]) + reg49[(1'h1):(1'h1)]));
              reg70 <= ($signed(($signed(wire61[(4'hb):(3'h5)]) >= ((+wire0) ^ $unsigned(wire2)))) < $signed((~|(8'ha5))));
              reg71 <= $unsigned($signed(($unsigned((wire0 ?
                  wire62 : wire46)) != reg50)));
            end
          else
            begin
              reg69 <= wire46[(3'h6):(1'h0)];
              reg70 <= reg71;
              reg71 <= $unsigned((~^(7'h40)));
              reg72 <= (($unsigned(wire4) ?
                  wire60[(3'h7):(1'h1)] : {wire57}) | $signed($unsigned(wire53[(1'h1):(1'h0)])));
            end
        end
      else
        begin
          if ($unsigned($unsigned($signed({$unsigned(wire2)}))))
            begin
              reg69 <= wire63;
            end
          else
            begin
              reg69 <= ($signed((~{$signed(wire57)})) ?
                  ((|(-(wire53 ?
                      wire57 : wire46))) >> $unsigned((^~reg67[(3'h5):(2'h2)]))) : wire0);
              reg70 <= $signed((wire0 >>> (reg48[(5'h10):(4'hd)] ?
                  (reg58[(2'h3):(2'h2)] <= wire2[(2'h2):(1'h1)]) : (wire57 ?
                      (wire2 != wire46) : $unsigned(reg69)))));
            end
          if ($unsigned(wire64))
            begin
              reg71 <= $signed($unsigned((~|((reg59 <= (8'hbc)) ?
                  $signed(wire62) : (wire5 ? reg52 : wire63)))));
              reg72 <= reg59[(1'h1):(1'h1)];
              reg73 <= (((wire4 ? reg70[(3'h6):(1'h1)] : {$signed(wire1)}) ?
                      wire64[(1'h1):(1'h1)] : (!wire56)) ?
                  $signed(reg70[(1'h0):(1'h0)]) : $unsigned({((wire57 ?
                              wire54 : wire53) ?
                          $signed(wire55) : wire55[(4'hc):(2'h2)]),
                      ($signed((8'hbd)) <= $unsigned(wire62))}));
            end
          else
            begin
              reg71 <= (wire65[(4'h9):(1'h1)] == wire60[(4'h8):(3'h4)]);
              reg72 <= $unsigned(wire60[(4'h8):(1'h1)]);
              reg73 <= ({wire46, $unsigned({(reg70 ? reg58 : reg58), wire61})} ?
                  wire55 : ((~|(~&wire53[(3'h5):(2'h2)])) & {reg66}));
              reg74 <= wire1;
            end
          reg75 <= reg67;
        end
      reg76 <= $unsigned($unsigned((|wire62)));
    end
  assign wire77 = $signed((|((((8'hae) << wire65) ?
                      (reg58 ? wire65 : reg73) : {wire53,
                          wire3}) << $signed($signed(wire64)))));
endmodule

module module7
#(parameter param45 = ((~|(({(8'hac), (8'ha1)} ~^ ((7'h42) >>> (8'hb1))) ? ({(8'ha0)} ? (!(8'ha6)) : (!(8'hae))) : (((8'ha7) ? (8'ha3) : (8'hae)) - ((8'hab) || (7'h44))))) ? (~((^(~|(8'hbb))) ? (|((7'h40) ? (7'h44) : (8'hb9))) : {((8'hbe) ^~ (8'ha8)), (^(8'hb2))})) : ({(((7'h42) - (8'ha7)) && {(8'hb5)}), {(!(7'h43)), {(8'hb4), (8'hb5)}}} ^~ ((((8'h9f) ? (8'ha8) : (8'hb2)) ? (+(8'ha1)) : (+(8'hb8))) ? ((8'ha3) - (8'hb0)) : (+{(8'haf)})))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire12;
  input wire [(4'ha):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  assign y = {wire44,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
                 (1'h0)};
  assign wire13 = {$signed($signed((wire8 && $signed(wire11)))),
                      $unsigned(($signed(wire10[(2'h2):(2'h2)]) ?
                          $signed($signed(wire11)) : wire9))};
  assign wire14 = (wire13[(1'h1):(1'h1)] ? (7'h43) : wire11[(3'h7):(1'h0)]);
  assign wire15 = (~(~wire9[(3'h4):(1'h0)]));
  assign wire16 = {(|wire11[(4'h9):(1'h1)]),
                      $unsigned(($unsigned($unsigned(wire13)) ?
                          $signed((wire9 != wire10)) : $unsigned((wire15 ?
                              wire12 : wire15))))};
  assign wire17 = (($unsigned((wire11[(3'h6):(2'h3)] ?
                              (^~wire10) : {wire16, wire13})) ?
                          $unsigned($signed(wire9[(2'h2):(2'h2)])) : $unsigned(wire8[(3'h5):(2'h3)])) ?
                      (($unsigned($signed(wire14)) ?
                              wire8[(4'h8):(3'h7)] : $signed({wire15,
                                  (8'ha0)})) ?
                          (!(((8'h9d) ? wire9 : wire12) ?
                              wire12 : wire15)) : wire10[(3'h6):(1'h1)]) : $signed(wire15));
  always
    @(posedge clk) begin
      reg18 <= ($unsigned(($signed(wire15) * (8'hbe))) || (|(~($unsigned(wire17) ?
          wire13 : $unsigned(wire10)))));
    end
  always
    @(posedge clk) begin
      if ((wire17 >= ($signed($unsigned($signed(wire8))) ?
          (($signed(wire16) ?
              (wire17 > wire16) : wire8[(3'h7):(3'h6)]) + $unsigned((!wire9))) : {((^~wire17) ?
                  (wire9 ? wire11 : reg18) : $signed(wire12)),
              $signed($unsigned((7'h41)))})))
        begin
          if ($signed($signed(wire14[(1'h0):(1'h0)])))
            begin
              reg19 <= wire15;
            end
          else
            begin
              reg19 <= (wire14 | ($signed((wire8[(3'h7):(1'h0)] ?
                      (~^wire14) : (~|reg18))) ?
                  (-{(wire17 ? wire11 : reg19),
                      $unsigned(wire14)}) : (wire10[(1'h0):(1'h0)] <<< reg18)));
              reg20 <= ((8'had) >>> (^wire8[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          reg19 <= $unsigned((wire8[(4'he):(1'h1)] ?
              (~$unsigned(reg18[(5'h10):(4'h9)])) : ({$unsigned((8'haa))} >= (!wire8[(2'h3):(2'h3)]))));
          reg20 <= (~|{$unsigned(((~^wire10) ? $signed(wire17) : wire11)),
              $signed((wire13[(2'h2):(1'h1)] << $unsigned((7'h41))))});
          reg21 <= $signed(wire15);
        end
    end
  always
    @(posedge clk) begin
      reg22 <= $unsigned(wire11[(3'h4):(3'h4)]);
      reg23 <= ((~&$signed((reg21[(3'h6):(1'h0)] ?
              wire14[(1'h0):(1'h0)] : {(8'hb3), reg21}))) ?
          reg19 : (($unsigned(wire8[(1'h1):(1'h0)]) < $unsigned(((8'ha9) || (8'h9f)))) == reg22[(4'hd):(2'h2)]));
      if (reg20[(1'h0):(1'h0)])
        begin
          reg24 <= (((!(~|reg19[(3'h7):(2'h2)])) ?
              $unsigned(($unsigned(wire16) * $unsigned(wire10))) : ({reg20[(1'h0):(1'h0)],
                      (wire12 + wire11)} ?
                  $signed(wire9[(2'h2):(1'h1)]) : reg21[(5'h10):(3'h6)])) >> ($signed($signed(reg20)) ?
              (wire13[(3'h4):(1'h1)] - (wire16 + (8'haa))) : $signed(($unsigned(wire17) ?
                  (wire13 >>> reg20) : reg19))));
          reg25 <= (8'haf);
          reg26 <= $unsigned(wire17);
          reg27 <= (($signed($unsigned((reg26 <<< (8'ha6)))) ^ reg22[(4'ha):(2'h2)]) <= (|((reg23[(1'h0):(1'h0)] ?
              wire17[(1'h0):(1'h0)] : wire14[(4'hb):(3'h5)]) >> (~|(wire17 ~^ wire12)))));
          if (wire12)
            begin
              reg28 <= (((&{(8'ha2)}) ?
                  $signed($signed($signed(wire13))) : wire10) >>> reg24[(4'hc):(1'h1)]);
              reg29 <= wire17;
              reg30 <= (+reg27[(5'h10):(4'he)]);
            end
          else
            begin
              reg28 <= ((reg26 >>> (8'ha5)) ?
                  $unsigned($signed(wire14)) : wire17);
              reg29 <= (~|wire11[(3'h4):(2'h2)]);
            end
        end
      else
        begin
          reg24 <= reg25[(1'h1):(1'h0)];
          reg25 <= ($unsigned($signed((^(wire12 ?
              wire12 : reg27)))) <<< wire9[(4'h9):(4'h8)]);
          reg26 <= (($signed((wire11[(3'h4):(2'h2)] ?
                  $signed(wire13) : $unsigned(wire8))) ?
              (^reg29) : {wire13}) ~^ (~^wire14[(5'h14):(4'h9)]));
        end
      reg31 <= {$signed(reg30),
          $signed({reg27[(3'h5):(2'h3)], reg23[(2'h2):(1'h1)]})};
      reg32 <= wire13[(1'h1):(1'h1)];
    end
  assign wire33 = ((!$unsigned($unsigned($signed(reg31)))) <= (wire9[(3'h5):(2'h3)] | wire17[(2'h3):(1'h0)]));
  assign wire34 = $unsigned(((wire15[(3'h4):(1'h1)] + $signed(((8'hbf) ?
                      reg24 : reg27))) | (~^wire11[(3'h6):(2'h3)])));
  assign wire35 = (((((+wire16) ? $signed(wire33) : (-reg27)) ^~ ({reg27,
                              reg20} ?
                          wire8 : $unsigned(reg19))) <<< ((reg32 ?
                          (wire10 ?
                              reg27 : wire13) : (reg32 && reg23)) && (reg24 ?
                          reg28[(1'h0):(1'h0)] : {reg22, (7'h40)}))) ?
                      reg20[(1'h1):(1'h1)] : wire10[(1'h0):(1'h0)]);
  assign wire36 = $signed($unsigned((8'hb7)));
  assign wire37 = reg24[(3'h6):(3'h4)];
  assign wire38 = $unsigned(($signed($signed(reg29)) ?
                      reg20[(1'h0):(1'h0)] : $signed((reg22[(4'hd):(1'h0)] ?
                          (+reg26) : reg23[(3'h4):(1'h0)]))));
  assign wire39 = ($signed((&$signed(wire12))) ^ $unsigned($signed(wire16)));
  always
    @(posedge clk) begin
      if ($signed({$unsigned($unsigned(reg26)), reg25}))
        begin
          reg40 <= $unsigned({$signed(((wire11 < wire14) || (&wire15))),
              $unsigned(($unsigned(wire8) ?
                  $unsigned(wire13) : (reg27 ? reg19 : wire14)))});
        end
      else
        begin
          reg40 <= $unsigned(reg29[(3'h6):(3'h5)]);
          if ($unsigned((((8'haa) ?
              (wire39[(1'h1):(1'h1)] ?
                  {reg18,
                      wire11} : wire36) : reg32[(4'he):(2'h2)]) >= {((^reg29) & (reg28 ?
                  reg31 : wire33))})))
            begin
              reg41 <= (~({{{reg27}}} ? wire37 : $unsigned((8'had))));
              reg42 <= (reg20[(2'h2):(2'h2)] ?
                  reg32[(4'h9):(3'h4)] : {{wire16, reg29},
                      $unsigned(wire15[(2'h2):(1'h1)])});
            end
          else
            begin
              reg41 <= ((($unsigned((~wire36)) ^~ {$unsigned(reg26)}) ?
                      reg18 : wire14) ?
                  (wire38 ?
                      $signed({(reg20 & wire15),
                          wire14[(3'h7):(2'h3)]}) : $unsigned(reg25)) : (~(((-(8'hb5)) < (+reg25)) << $signed(wire11[(4'h9):(2'h2)]))));
            end
          reg43 <= $unsigned(reg23);
        end
    end
  assign wire44 = (8'hb6);
endmodule
