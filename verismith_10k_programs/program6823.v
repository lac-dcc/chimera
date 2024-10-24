module top
#(parameter param67 = ((((7'h42) ^~ (((8'hbf) ? (8'ha8) : (8'haf)) & (&(8'hb2)))) ? {({(8'ha0), (8'hb9)} ? (^(8'haa)) : ((8'haa) ? (7'h43) : (8'ha2)))} : ({((8'hbd) ? (8'hab) : (8'hbd))} + ((8'hb1) >= ((8'hab) != (7'h40))))) <<< (~|({((8'hbb) ? (8'ha5) : (8'ha9))} ? (+((8'ha3) ? (8'ha3) : (7'h40))) : ((!(8'haa)) > ((8'hae) || (8'ha5)))))), 
parameter param68 = param67)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire63;
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire63,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire0[(1'h1):(1'h0)];
    end
  assign wire6 = ($signed((-$unsigned((&wire2)))) ?
                     (^~(reg5[(2'h2):(1'h1)] != (wire3 ?
                         (~^wire0) : (wire2 | (8'hb4))))) : $unsigned(wire2[(4'h9):(2'h3)]));
  assign wire7 = reg5;
  assign wire8 = (~$signed($signed(wire6[(1'h1):(1'h1)])));
  assign wire9 = wire2[(3'h4):(2'h3)];
  assign wire10 = $signed(((wire0[(1'h1):(1'h0)] ? $unsigned(wire6) : wire3) ?
                      wire2 : (+$signed((wire4 >>> wire3)))));
  assign wire11 = {wire2[(5'h10):(4'h8)]};
  module12 #() modinst64 (.wire17(wire10), .wire14(wire8), .wire13(wire0), .clk(clk), .wire15(wire1), .y(wire63), .wire16(wire3));
  assign wire65 = wire9;
  assign wire66 = (wire10 ?
                      (wire63[(2'h3):(2'h2)] - (!wire63)) : $unsigned(((^~$unsigned(wire3)) ?
                          ($unsigned(wire9) ?
                              (wire6 >= wire4) : reg5[(4'h8):(1'h0)]) : (^(wire6 + wire2)))));
endmodule

module module12
#(parameter param62 = ((&(|(!((8'h9c) != (8'hb7))))) ? (^(~|{{(7'h41)}, (+(8'h9d))})) : (((~|(~|(8'ha6))) ? (((7'h40) == (8'hb4)) | ((8'hb4) && (8'haa))) : (-(^~(8'ha9)))) ^ ((^(~|(7'h44))) ? {(!(8'hb9)), ((8'hb9) == (8'haf))} : ((-(8'ha1)) ^~ (~|(8'hb8)))))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h222):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  assign y = {wire61,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
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
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= ((~&wire16) >> {wire13[(4'h9):(2'h3)]});
      if (($signed(wire14[(4'h8):(3'h7)]) * $signed((($signed(reg18) >> (~&wire16)) << wire17[(3'h7):(2'h3)]))))
        begin
          reg19 <= $unsigned(reg18[(3'h5):(3'h4)]);
        end
      else
        begin
          reg19 <= $signed((wire16 ?
              $unsigned((((8'hbb) + wire13) ?
                  $unsigned(wire14) : $signed(wire16))) : reg19[(1'h0):(1'h0)]));
          reg20 <= $unsigned($signed(wire14));
        end
      reg21 <= $signed($signed($signed(reg20[(3'h6):(3'h5)])));
      reg22 <= wire15;
    end
  assign wire23 = $unsigned(wire17[(1'h0):(1'h0)]);
  assign wire24 = (wire15[(2'h2):(1'h1)] ?
                      $signed($unsigned(wire17)) : (~|$unsigned($signed(wire16))));
  assign wire25 = wire16[(3'h4):(1'h1)];
  assign wire26 = wire16;
  always
    @(posedge clk) begin
      reg27 <= $unsigned($signed((8'h9e)));
      if ((~(^((~wire24[(1'h1):(1'h0)]) >> wire14[(4'h9):(3'h4)]))))
        begin
          reg28 <= $unsigned(({reg18[(4'hd):(3'h5)]} ^~ {$unsigned($signed(reg22)),
              $signed((reg27 > wire24))}));
          reg29 <= $unsigned({((-{wire14}) ?
                  reg18 : (reg27 ? $unsigned(reg27) : wire25[(3'h7):(2'h2)]))});
          reg30 <= reg28[(4'hb):(4'hb)];
          reg31 <= ({(~&wire25[(3'h5):(2'h2)]), wire25[(1'h0):(1'h0)]} ?
              $unsigned($unsigned((~|(~^reg19)))) : $signed(($unsigned({reg29,
                      reg29}) ?
                  (wire16 && wire26[(3'h5):(2'h2)]) : (|(~wire24)))));
          reg32 <= (~&{reg27});
        end
      else
        begin
          reg28 <= (-($signed(wire16[(3'h7):(3'h4)]) & $unsigned((+(reg27 >>> (8'haf))))));
          reg29 <= $signed($unsigned((^~$unsigned($signed(wire26)))));
          reg30 <= {({$unsigned(((8'hbf) > (8'hbc))), $signed(wire26)} ?
                  (~$signed({reg32, (8'hab)})) : wire23),
              reg27};
          reg31 <= (((wire17[(4'hf):(4'h9)] ^~ $unsigned((8'hba))) - $signed((~&(^~(8'ha4))))) ?
              ((-(!(reg27 >> reg30))) ?
                  $signed(wire26) : (+wire15)) : (-{(wire15[(3'h4):(1'h0)] > (reg29 < wire14))}));
          reg32 <= (8'hb0);
        end
      if (($signed((-reg21[(2'h2):(1'h0)])) ?
          ((^{wire23[(4'h9):(3'h7)]}) ?
              wire13 : wire25) : wire24[(3'h7):(3'h5)]))
        begin
          reg33 <= reg21;
          reg34 <= ((((reg20[(4'hb):(3'h7)] ?
                  wire17 : (~^wire16)) & reg30) && $unsigned(((wire25 < wire26) >> (|reg28)))) ?
              {$unsigned($unsigned((reg28 ? reg27 : reg22))),
                  ($unsigned(reg32[(2'h3):(2'h3)]) & reg22)} : $signed(reg22[(1'h1):(1'h1)]));
          reg35 <= (((8'h9e) ? (^~$unsigned({(8'hb6), reg33})) : wire16) ?
              (~&(($signed(wire15) ^~ reg22[(4'h9):(4'h8)]) ?
                  $signed($signed(reg19)) : $unsigned($signed(reg18)))) : ((~&(((8'ha9) >= reg30) ?
                  (-wire16) : (&reg31))) - (+(reg20[(4'ha):(4'h8)] ?
                  (reg18 ? wire15 : reg31) : {(8'ha3), (8'h9d)}))));
          reg36 <= wire24;
        end
      else
        begin
          reg33 <= {reg27, {{{(reg35 ? wire24 : wire16), (^reg18)}}}};
          reg34 <= (-(($unsigned($signed(reg18)) ~^ ($signed(reg35) ?
              (~^reg28) : $unsigned(reg21))) & ({(+reg27)} ~^ $signed(reg34))));
          reg35 <= (+(~(({wire24} ^ (reg22 ?
              reg21 : reg33)) ^~ $unsigned($signed(reg19)))));
          reg36 <= {$unsigned((7'h41)),
              ($signed((8'hb6)) ? {(~&reg32)} : reg20[(4'h8):(1'h1)])};
          if (($unsigned({$unsigned((wire14 | reg28))}) | ($unsigned(($signed(reg22) ?
              reg33[(5'h13):(4'hb)] : $signed(reg29))) >= $unsigned($signed(wire17)))))
            begin
              reg37 <= reg32;
            end
          else
            begin
              reg37 <= $signed($signed({reg28, reg20}));
              reg38 <= reg21;
              reg39 <= (+$unsigned((~reg32)));
            end
        end
      reg40 <= ($unsigned(reg29[(2'h3):(2'h2)]) - $signed(reg34));
    end
  assign wire41 = $unsigned(reg27);
  assign wire42 = $unsigned((+(8'ha5)));
  assign wire43 = wire15;
  assign wire44 = (^$unsigned((&(8'haa))));
  always
    @(posedge clk) begin
      if (reg19)
        begin
          if ($unsigned(wire25))
            begin
              reg45 <= (wire14 < ($unsigned(wire14[(3'h7):(1'h0)]) ?
                  $signed({(reg28 ? wire16 : wire14)}) : $signed(reg34)));
              reg46 <= $unsigned(($signed((wire44 >> (~wire42))) ?
                  ({(8'ha4), (reg20 && reg32)} ?
                      $unsigned((wire16 ?
                          reg39 : wire42)) : {$unsigned((8'haf)),
                          $signed(reg38)}) : $unsigned(({reg28, wire41} ?
                      $unsigned(reg22) : $signed(wire26)))));
              reg47 <= reg35[(3'h4):(1'h0)];
              reg48 <= ($unsigned($signed(reg18)) == $unsigned($unsigned({$signed(wire23)})));
              reg49 <= $signed((~^wire16));
            end
          else
            begin
              reg45 <= ($signed($unsigned((+$signed(reg39)))) == reg49);
              reg46 <= reg37[(1'h1):(1'h0)];
            end
          reg50 <= (~&$signed(((~^wire17) <= (reg48 ~^ $unsigned(wire42)))));
          reg51 <= reg39;
          reg52 <= (wire15[(4'ha):(1'h1)] ?
              (reg49[(1'h0):(1'h0)] ?
                  {reg18, wire17} : {$signed(reg18),
                      reg46}) : {$signed(reg32)});
        end
      else
        begin
          reg45 <= $unsigned($signed((reg34[(4'h9):(3'h5)] ?
              ($unsigned(reg27) ? (wire13 && wire17) : {reg46}) : ({reg50,
                  wire13} <= (^reg21)))));
          reg46 <= $unsigned((&(~|((~&(8'ha9)) >= (wire42 ? reg19 : reg22)))));
          if (($signed(((^(-reg33)) <<< (8'hb9))) ^ ((wire16 ?
              ((reg34 ?
                  wire25 : reg37) + wire17) : reg28) ~^ wire44[(2'h2):(1'h1)])))
            begin
              reg47 <= $unsigned(reg36);
              reg48 <= wire16;
              reg49 <= wire17;
              reg50 <= (~^reg18[(2'h3):(1'h0)]);
              reg51 <= ({$unsigned(wire26)} ?
                  (reg47 ?
                      ({$signed(reg37), reg19} ?
                          (wire44 ?
                              wire44[(3'h4):(1'h1)] : (~^reg18)) : $unsigned((-reg40))) : ($signed(reg47[(2'h2):(1'h1)]) ?
                          $signed($signed((8'hbd))) : $unsigned((reg46 ?
                              wire41 : reg30)))) : (($signed((+wire14)) || $unsigned($signed(reg48))) ?
                      $unsigned($unsigned({reg39, wire42})) : reg50));
            end
          else
            begin
              reg47 <= $signed(reg37);
            end
          if ($unsigned(((~|($unsigned(wire17) || (~wire41))) ?
              (($signed(reg40) <<< (^~reg31)) - ((~reg21) & $signed(wire17))) : wire41)))
            begin
              reg52 <= ((^reg52) - {$unsigned(reg40[(3'h5):(1'h0)]),
                  ($unsigned((reg38 && reg51)) << (~$signed(reg27)))});
              reg53 <= ($signed(((reg46 & (reg35 + reg18)) + {(reg37 ?
                          wire14 : reg35),
                      wire15})) ?
                  (|($signed($unsigned((8'ha6))) ^~ reg47)) : $signed(wire23[(3'h6):(3'h5)]));
              reg54 <= reg49[(4'h8):(1'h1)];
              reg55 <= reg20;
              reg56 <= $unsigned((($unsigned((reg32 <<< reg22)) ?
                      {{(8'hbb)}} : wire17[(4'hd):(1'h1)]) ?
                  (reg34 && $signed($unsigned(wire43))) : wire41[(1'h1):(1'h1)]));
            end
          else
            begin
              reg52 <= ((|($signed($unsigned(wire43)) >> $unsigned((+wire15)))) ~^ (8'hb9));
              reg53 <= (-(7'h43));
              reg54 <= reg19;
              reg55 <= (wire41 ?
                  reg53 : (wire15[(2'h3):(1'h1)] ?
                      ((8'hb4) == {(reg29 ? reg36 : reg33),
                          (wire41 > reg32)}) : reg30[(1'h1):(1'h1)]));
            end
        end
      reg57 <= ($unsigned(({reg38[(4'h8):(1'h0)],
              (reg28 ? reg56 : reg33)} < ((reg33 ?
              wire15 : reg50) - ((8'hb4) && reg31)))) ?
          ({(wire42[(2'h2):(2'h2)] >= (reg55 ^~ reg47)), reg48} ?
              ($signed($signed(reg40)) >= $unsigned($unsigned(reg45))) : {$signed(reg40[(3'h6):(3'h5)]),
                  $unsigned($unsigned((8'hae)))}) : $unsigned((~|($unsigned(reg32) == $signed(wire44)))));
      reg58 <= (|wire23);
      reg59 <= reg28;
      reg60 <= (($signed(((^~reg33) >= reg36)) ^~ reg56) <<< (^$unsigned(((+wire13) ?
          (&wire44) : (reg48 == (8'ha0))))));
    end
  assign wire61 = reg47;
endmodule
