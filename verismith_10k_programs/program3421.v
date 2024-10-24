module top
#(parameter param74 = ((((~&((8'hb4) ? (7'h41) : (8'hba))) ? {((8'hb9) ? (8'hb6) : (8'hbc)), ((8'ha4) ? (8'hb5) : (8'hbc))} : (~&(8'ha1))) << (((^~(8'hb1)) && ((8'hae) ~^ (8'h9e))) ? {(^~(8'hb9)), (-(7'h41))} : (((7'h43) >> (8'had)) >>> (+(8'h9e))))) || {((~^((8'ha3) ^ (8'ha5))) - ((~^(8'hb5)) ? ((8'hb8) >>> (8'ha5)) : ((8'ha7) ? (8'hbf) : (8'hbe)))), (~^(((8'hbd) << (8'had)) ? {(8'ha7), (8'h9f)} : ((8'hae) ? (7'h42) : (8'ha9))))}), 
parameter param75 = (((8'ha2) == {(!param74), param74}) >> (8'haf)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire5 = (^~(|(-(&(~|(8'hb9))))));
  assign wire6 = wire0[(1'h1):(1'h0)];
  assign wire7 = wire1[(3'h5):(2'h2)];
  assign wire8 = wire5;
  assign wire9 = (~|(!wire7));
  module10 #() modinst68 (.wire14(wire0), .y(wire67), .clk(clk), .wire13(wire8), .wire12(wire3), .wire11(wire7));
  assign wire69 = ($signed(wire4[(1'h0):(1'h0)]) > wire0[(3'h4):(3'h4)]);
  assign wire70 = $unsigned({$unsigned(wire8),
                      $unsigned(({wire1, wire9} ?
                          $unsigned(wire0) : $signed(wire5)))});
  assign wire71 = wire3;
  always
    @(posedge clk) begin
      reg72 <= wire9[(4'hf):(3'h6)];
      reg73 <= $unsigned({((wire71[(2'h2):(1'h1)] - $unsigned(wire5)) ?
              $unsigned((wire71 ? wire6 : wire2)) : wire8)});
    end
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h24a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  assign y = {wire66,
                 wire60,
                 wire59,
                 wire58,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire17,
                 wire16,
                 wire15,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
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
                 reg31,
                 reg30,
                 reg29,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire15 = {wire14,
                      (wire11 ?
                          (+$unsigned($unsigned(wire12))) : ((~&(^wire11)) | $signed((wire13 ?
                              wire12 : wire12))))};
  assign wire16 = $unsigned(wire12);
  assign wire17 = (-$signed((((8'hbe) ?
                      $unsigned(wire12) : $signed(wire16)) >>> $signed((wire15 ?
                      wire13 : wire15)))));
  always
    @(posedge clk) begin
      reg18 <= (wire11 ? wire14[(3'h7):(2'h2)] : wire13);
      if (reg18)
        begin
          reg19 <= $unsigned($signed((!wire15[(2'h3):(2'h3)])));
        end
      else
        begin
          reg19 <= $unsigned($unsigned($signed({(~|wire17)})));
          if (($unsigned((&wire13)) ?
              $signed({(8'hb7),
                  (wire12[(1'h0):(1'h0)] ?
                      reg18[(5'h11):(4'hd)] : (8'ha0))}) : ($unsigned(($unsigned(reg18) ?
                  $unsigned(wire11) : wire16)) >>> reg18)))
            begin
              reg20 <= $signed((~^(~($unsigned(wire17) && $unsigned(reg18)))));
              reg21 <= (~(7'h42));
              reg22 <= (wire16 * wire16);
              reg23 <= wire11;
            end
          else
            begin
              reg20 <= (wire17[(4'ha):(3'h4)] ?
                  $unsigned((((8'hb9) ~^ $unsigned(wire17)) >= (-(wire15 || reg23)))) : reg23);
              reg21 <= reg23;
              reg22 <= wire12[(1'h1):(1'h1)];
              reg23 <= $signed($signed($unsigned(reg19[(3'h5):(1'h0)])));
            end
          reg24 <= ((~|$unsigned((^(reg20 + reg21)))) * (reg22 ^~ ((&wire15) < wire15[(2'h2):(2'h2)])));
        end
    end
  assign wire25 = (+((wire17 ? (+(reg23 >> wire16)) : reg23) ?
                      reg21 : $signed($unsigned(reg22[(4'hc):(3'h6)]))));
  assign wire26 = $signed(wire16);
  assign wire27 = (-$signed(wire26[(3'h7):(3'h5)]));
  assign wire28 = $unsigned((+({reg21[(3'h7):(1'h1)]} <= (+{(8'hbd),
                      wire13}))));
  always
    @(posedge clk) begin
      reg29 <= $signed((wire14[(3'h6):(2'h3)] || ({(reg23 * wire17),
              $signed(reg20)} ?
          (-$signed(wire16)) : (wire13 & (reg23 | (8'hab))))));
      reg30 <= wire16[(4'h9):(3'h5)];
      if (reg23[(1'h1):(1'h1)])
        begin
          if ($unsigned(((+wire11) ?
              (((~&reg19) & $signed(wire25)) <<< ((reg29 ?
                  reg24 : reg20) && (^~(8'h9c)))) : (~|{(&reg18),
                  $unsigned(wire13)}))))
            begin
              reg31 <= reg21;
              reg32 <= wire28;
            end
          else
            begin
              reg31 <= ($unsigned($signed($unsigned(wire28))) ?
                  $unsigned(wire14[(2'h2):(2'h2)]) : wire25);
              reg32 <= (&$signed($unsigned($signed($signed(reg24)))));
            end
          if (wire26[(5'h10):(4'hd)])
            begin
              reg33 <= wire13;
              reg34 <= reg19[(5'h10):(4'ha)];
            end
          else
            begin
              reg33 <= (&(~reg32));
            end
          reg35 <= $unsigned((~&wire15));
          if ($unsigned($signed($signed((8'hbd)))))
            begin
              reg36 <= (~($unsigned(wire15[(4'he):(1'h1)]) ?
                  $signed($signed(reg22)) : reg33));
              reg37 <= $unsigned(wire15[(4'hf):(4'he)]);
              reg38 <= (~($signed($signed((~reg19))) ?
                  (~&(-$unsigned((8'hac)))) : $unsigned(reg29[(1'h1):(1'h0)])));
              reg39 <= $unsigned(reg22);
              reg40 <= ($signed(reg36) ?
                  $unsigned(reg35[(1'h0):(1'h0)]) : wire28);
            end
          else
            begin
              reg36 <= ($signed((reg37 && $unsigned(reg20[(1'h1):(1'h1)]))) >= reg33);
            end
          reg41 <= {(reg39 ?
                  (($signed((8'h9c)) == (wire28 | reg33)) != reg37[(3'h5):(1'h0)]) : wire17),
              $signed($signed((reg32[(1'h0):(1'h0)] <<< reg39[(1'h1):(1'h0)])))};
        end
      else
        begin
          reg31 <= wire28;
          reg32 <= (($unsigned((((8'ha2) | reg29) ? (-wire15) : reg39)) ?
                  wire11[(3'h6):(3'h4)] : reg30) ?
              (wire13 ?
                  reg35 : ($unsigned(reg21) ?
                      ($unsigned(wire17) ?
                          (wire28 ?
                              wire16 : reg37) : $unsigned(reg36)) : wire13[(2'h2):(1'h0)])) : reg40);
          if (reg37)
            begin
              reg33 <= (+reg37);
              reg34 <= $unsigned((|reg37[(3'h7):(1'h1)]));
              reg35 <= (reg32[(3'h7):(3'h4)] ?
                  (($signed(wire28) ?
                          {wire14} : (reg19[(2'h2):(2'h2)] ?
                              $unsigned(reg41) : wire28)) ?
                      reg34 : (+{(^reg34)})) : (|(reg40 >> ($signed(reg38) ?
                      $signed((8'hbc)) : $signed(wire27)))));
              reg36 <= $unsigned($unsigned(((~reg34[(4'h9):(1'h0)]) ?
                  $signed({wire27}) : $unsigned($unsigned((7'h43))))));
              reg37 <= ($signed((wire12 ?
                      (reg41 - ((7'h43) ?
                          reg36 : wire26)) : $unsigned(wire14))) ?
                  reg21 : $unsigned(reg32));
            end
          else
            begin
              reg33 <= reg22;
              reg34 <= (((reg33[(2'h3):(1'h1)] <= ((wire16 ? wire14 : (8'hb2)) ?
                  $signed(wire27) : ((8'hbd) ?
                      reg36 : reg30))) + $signed((!{reg36,
                  reg18}))) * {reg39[(4'he):(4'h9)],
                  $signed($signed($signed(wire14)))});
              reg35 <= wire15;
            end
        end
      if ($signed((wire26 << wire28[(4'hd):(4'hd)])))
        begin
          reg42 <= reg24;
          if (($signed((($unsigned(reg18) ?
                  (reg36 >> wire17) : wire28[(2'h2):(1'h0)]) ?
              wire12[(3'h7):(3'h4)] : (~^$unsigned((8'hb1))))) > ($unsigned({reg41,
                  (reg34 ? wire11 : reg22)}) ?
              wire12 : wire14[(3'h5):(2'h2)])))
            begin
              reg43 <= ((8'h9c) ?
                  (!(wire27[(4'hf):(4'hf)] ?
                      reg38 : $signed($unsigned(wire17)))) : reg41[(4'hd):(1'h0)]);
              reg44 <= reg42[(4'ha):(1'h0)];
              reg45 <= {(-reg32), (^{(reg39 <= (8'ha4))})};
              reg46 <= reg31;
            end
          else
            begin
              reg43 <= (~^(+($unsigned(wire14) + (|(~&wire14)))));
              reg44 <= reg23[(1'h0):(1'h0)];
              reg45 <= $unsigned(reg37);
            end
          if ((~^wire27[(4'h8):(3'h6)]))
            begin
              reg47 <= ($signed($signed((~&$signed(reg39)))) ^~ reg42);
              reg48 <= (wire13[(3'h7):(2'h3)] ?
                  $unsigned($unsigned($unsigned((reg38 ?
                      reg22 : reg37)))) : wire27[(4'he):(2'h3)]);
              reg49 <= {((($signed((8'hb2)) ?
                      (&reg42) : reg40[(5'h12):(1'h0)]) != wire25) ~^ (|({(8'hbd)} + $signed(wire14))))};
            end
          else
            begin
              reg47 <= ((reg18 > (wire27[(3'h4):(3'h4)] ?
                  $signed((~|wire15)) : {(wire27 ?
                          reg31 : reg20)})) >> $signed(wire11));
              reg48 <= (&reg40[(1'h1):(1'h0)]);
            end
          if ({(|{(wire14 != (reg43 ^ reg41)),
                  (((7'h43) ? (8'ha4) : wire25) != $unsigned((8'ha1)))})})
            begin
              reg50 <= (reg41 ? reg38 : reg32);
              reg51 <= wire15;
              reg52 <= {reg51[(3'h4):(3'h4)],
                  {(({reg41, reg43} ? $unsigned(reg50) : $unsigned(wire12)) ?
                          $signed((~|reg24)) : ((|reg21) ?
                              (8'hac) : $signed(reg18))),
                      (reg32[(3'h5):(1'h1)] | ((reg48 * (8'ha1)) ?
                          (~^wire26) : reg34))}};
            end
          else
            begin
              reg50 <= reg51;
              reg51 <= (|(reg21[(1'h0):(1'h0)] - (+(+{reg36, reg36}))));
              reg52 <= {$signed((&$signed(((8'hb1) ? wire25 : wire12)))),
                  ($unsigned($signed((wire16 ? reg45 : reg31))) ?
                      (reg44 >= (|(+reg21))) : (~$unsigned((reg39 ?
                          reg23 : reg46))))};
              reg53 <= reg41[(4'h8):(2'h3)];
              reg54 <= wire11;
            end
          if ($unsigned($unsigned((+{reg52[(3'h7):(1'h0)]}))))
            begin
              reg55 <= $signed((&(((reg23 ? reg20 : reg30) & (wire11 ?
                  (8'hb6) : reg53)) ^~ {reg34, wire27})));
            end
          else
            begin
              reg55 <= (~^wire12);
              reg56 <= ($signed(wire26) ? $unsigned(reg54) : wire12);
              reg57 <= $unsigned($signed((reg46 <= ((wire17 | reg53) <<< (reg30 >> reg54)))));
            end
        end
      else
        begin
          reg42 <= (reg42 != reg32);
        end
    end
  assign wire58 = {reg51,
                      ((~((wire13 - reg20) ? reg54 : $unsigned(reg29))) ?
                          $signed(reg22) : ($unsigned($signed(reg41)) >= (~reg56[(1'h0):(1'h0)])))};
  assign wire59 = $unsigned($unsigned((((reg56 >>> reg45) + $unsigned(reg51)) << wire17)));
  assign wire60 = reg51;
  always
    @(posedge clk) begin
      reg61 <= $signed((&(({(8'haf), reg52} >= {reg31, (8'ha8)}) ?
          ((reg29 && wire16) | (reg19 != wire14)) : {(reg19 ?
                  reg53 : reg54)})));
      reg62 <= (^~reg43[(3'h5):(3'h5)]);
      if (reg18)
        begin
          reg63 <= reg41[(2'h3):(1'h0)];
          reg64 <= (-((^~$signed({reg46})) ?
              ({wire12} ?
                  $signed(wire16) : $signed((reg48 >>> (8'hbc)))) : ($signed((-reg48)) ?
                  {reg22[(4'hd):(4'hd)], (-wire11)} : reg22[(4'hf):(2'h3)])));
        end
      else
        begin
          reg63 <= $unsigned({(($signed((8'ha9)) & $signed(reg39)) ?
                  $signed((~reg34)) : (~|$signed(wire58)))});
          reg64 <= reg42[(2'h3):(1'h0)];
          reg65 <= ((wire12 ?
                  $unsigned(((+wire14) ?
                      (reg33 ?
                          reg42 : reg33) : $unsigned(wire59))) : reg55[(1'h0):(1'h0)]) ?
              $unsigned((-(^~(reg51 ? reg62 : reg20)))) : $signed(wire13));
        end
    end
  assign wire66 = (-$unsigned($signed(reg36)));
endmodule
