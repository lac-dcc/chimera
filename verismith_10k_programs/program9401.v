module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h28d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire25,
                 wire24,
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
                 wire4,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire4 = $signed((^(~wire1)));
  assign wire5 = ($unsigned(wire1[(1'h0):(1'h0)]) ?
                     wire4 : $unsigned((^~((&wire0) - (+wire1)))));
  assign wire6 = wire3[(3'h7):(3'h6)];
  assign wire7 = wire4[(4'hf):(1'h1)];
  assign wire8 = $signed(wire7[(3'h6):(2'h2)]);
  assign wire9 = ($unsigned({$signed($unsigned(wire0))}) >> $unsigned(wire3[(3'h6):(2'h3)]));
  assign wire10 = wire0[(3'h6):(3'h5)];
  assign wire11 = {wire6[(4'h8):(2'h2)]};
  assign wire12 = (~$signed(((8'ha0) == (!$unsigned(wire3)))));
  assign wire13 = (((((wire12 ? wire12 : (8'hb1)) ? (~&wire1) : wire1) ?
                      ($unsigned(wire2) * wire0[(1'h1):(1'h1)]) : {(~(7'h41))}) >> $unsigned(((wire2 ^ wire8) << (wire5 ?
                      wire4 : (8'hae))))) * ({$signed($unsigned(wire1)),
                      wire2[(2'h3):(1'h0)]} << (!(|$signed((7'h43))))));
  assign wire14 = ((wire3[(5'h13):(4'h8)] ?
                      (wire2 ?
                          wire3[(4'hc):(3'h6)] : ($unsigned(wire7) | (wire2 < wire4))) : wire11) ~^ {wire2[(1'h0):(1'h0)]});
  assign wire15 = (($signed(wire11) ?
                          wire11[(1'h0):(1'h0)] : wire11[(2'h3):(2'h2)]) ?
                      ($signed((wire14 ~^ (!(8'hb5)))) ?
                          wire2 : wire2) : ((8'had) ~^ (8'ha4)));
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire13)))
        begin
          reg16 <= ((8'hac) ?
              wire2[(3'h6):(2'h2)] : $unsigned($signed(wire10[(1'h1):(1'h1)])));
          if (wire7)
            begin
              reg17 <= $unsigned(((+$signed({wire9})) ?
                  wire13 : wire12[(1'h0):(1'h0)]));
            end
          else
            begin
              reg17 <= ((&(^~wire8)) * $unsigned({wire11[(2'h3):(1'h0)],
                  $signed(wire7[(3'h6):(3'h6)])}));
              reg18 <= $signed((($unsigned($unsigned(wire13)) ?
                  ((wire1 ? wire5 : wire9) ?
                      $unsigned((8'hba)) : wire5[(2'h2):(1'h0)]) : wire11) <= (~^(wire12[(3'h4):(2'h2)] ?
                  (+wire9) : wire4))));
              reg19 <= {(($unsigned((wire12 ?
                      reg16 : wire12)) || wire4) >> ((wire7 >>> (!(8'ha5))) ?
                      (wire5[(2'h2):(2'h2)] ?
                          (wire7 ?
                              (8'ha8) : wire1) : $signed(wire7)) : ((reg17 == wire1) ?
                          $unsigned((8'hb9)) : $signed(wire14))))};
              reg20 <= $signed(wire2);
              reg21 <= ($unsigned({$unsigned({wire9})}) ?
                  (-(~|wire7[(3'h7):(3'h4)])) : wire5[(2'h2):(1'h1)]);
            end
          reg22 <= wire10;
          reg23 <= wire12[(4'h8):(4'h8)];
        end
      else
        begin
          reg16 <= {$signed(((^(wire7 + wire6)) ?
                  (^~wire5[(1'h0):(1'h0)]) : (^(reg20 * wire10)))),
              (wire0 ? {$signed(wire6)} : (8'hb7))};
          reg17 <= (((((!reg21) ? wire15 : (~wire15)) ?
                      $unsigned(wire9) : (~|wire12)) ?
                  $signed(wire5) : {$unsigned((~^wire0)), $unsigned({wire9})}) ?
              $unsigned((((reg17 >> wire0) ?
                  (wire0 ?
                      wire4 : wire11) : wire0) ^~ (8'hac))) : wire15[(3'h4):(1'h1)]);
        end
    end
  assign wire24 = $unsigned({$unsigned(({(8'ha8), reg20} ^ (wire4 >> wire4))),
                      wire1[(2'h3):(1'h1)]});
  assign wire25 = $unsigned((wire0[(3'h7):(2'h2)] ?
                      (wire12[(1'h1):(1'h0)] != wire15) : $signed($unsigned((&wire24)))));
  always
    @(posedge clk) begin
      reg26 <= {{(!$unsigned(((8'had) ? reg16 : wire4)))}, (~&wire12)};
      reg27 <= (7'h44);
      if (wire9)
        begin
          reg28 <= wire6[(3'h5):(1'h1)];
          reg29 <= wire6[(1'h1):(1'h1)];
          reg30 <= ($unsigned($signed(reg22)) ?
              {(8'ha0), wire11} : $unsigned(wire12));
        end
      else
        begin
          reg28 <= $signed($unsigned((!(reg23[(4'h8):(2'h3)] ?
              (reg28 ? (8'hb3) : reg27) : (reg21 ? wire6 : (8'haa))))));
          if ({((~((wire13 << wire15) ?
                  (~|wire14) : $unsigned(wire11))) && wire9)})
            begin
              reg29 <= (((|wire8[(4'hc):(2'h3)]) ?
                  {{$signed((7'h40)),
                          wire11[(3'h4):(1'h0)]}} : $unsigned(wire0)) + reg28[(3'h4):(2'h2)]);
              reg30 <= $unsigned((~^(((wire2 ? wire25 : wire11) ?
                  reg18 : (wire7 >>> wire12)) >> (8'hbd))));
              reg31 <= {(wire6 * $signed(reg19[(2'h2):(1'h0)]))};
            end
          else
            begin
              reg29 <= $signed(wire13);
            end
        end
      reg32 <= reg26;
      reg33 <= (~|wire5);
    end
  assign wire34 = wire9;
  assign wire35 = $unsigned(wire2[(4'h9):(3'h4)]);
  always
    @(posedge clk) begin
      reg36 <= $signed({(8'hae)});
      if (reg22[(2'h3):(2'h3)])
        begin
          reg37 <= (($signed((&$signed(wire25))) << wire12) ?
              {(-$signed($signed((7'h42)))),
                  ((8'hb4) ^~ {(reg19 ? wire13 : wire8),
                      (reg26 ^ wire34)})} : reg26);
          reg38 <= reg28;
        end
      else
        begin
          reg37 <= ((~|wire12) ?
              wire0[(3'h7):(3'h4)] : {wire9[(3'h7):(2'h2)],
                  ($signed((+(8'ha6))) ?
                      $signed($unsigned(wire11)) : (wire8[(4'hf):(4'hb)] ?
                          $unsigned(wire10) : $signed(wire11)))});
        end
      reg39 <= (wire24 ?
          ($unsigned(wire4) ?
              ($unsigned((8'hbc)) >>> wire9[(4'hc):(4'ha)]) : ({{reg21},
                  $unsigned(wire9)} >> ($signed(reg18) << (reg33 ^~ wire7)))) : (wire8[(4'hd):(4'hd)] - $unsigned((reg26 ?
              (wire13 ? reg38 : wire12) : $signed(reg29)))));
      if (reg23[(1'h1):(1'h0)])
        begin
          reg40 <= reg39[(4'hb):(4'h8)];
          reg41 <= $signed(($unsigned((~|((8'h9d) << reg31))) < reg39[(3'h5):(3'h4)]));
          if ($unsigned((~^(($signed((8'ha2)) ? reg36 : wire13) ?
              {(~&reg33)} : wire9[(4'h8):(4'h8)]))))
            begin
              reg42 <= reg38;
              reg43 <= ((+({(wire2 ? reg23 : wire2)} ?
                  reg26 : $signed(wire9))) ~^ (|$unsigned((wire7 == (wire24 ?
                  reg28 : reg37)))));
            end
          else
            begin
              reg42 <= reg41;
              reg43 <= wire2[(3'h7):(2'h2)];
              reg44 <= ({reg33[(1'h1):(1'h0)],
                  wire0} != {$unsigned($unsigned($unsigned(reg18)))});
              reg45 <= (^~reg19);
              reg46 <= (+$signed(reg26));
            end
          reg47 <= (((^~$unsigned($unsigned(wire3))) || wire3[(4'hc):(4'ha)]) <= ((~^(8'hba)) ?
              {{(reg17 != (8'hbf))}, reg23} : ((reg32[(1'h1):(1'h0)] ?
                  wire2[(3'h7):(3'h4)] : (reg32 + reg41)) ~^ wire15[(4'hc):(3'h5)])));
          reg48 <= ($signed(wire5) ? {wire24} : {reg26[(5'h11):(4'hc)]});
        end
      else
        begin
          reg40 <= reg36[(4'hb):(4'h8)];
          if ($signed((($signed((8'h9f)) < (reg37 ?
                  wire8[(2'h3):(1'h0)] : $signed(wire6))) ?
              ({((7'h43) & wire3), $signed(wire15)} - reg46) : {wire6})))
            begin
              reg41 <= (+wire1[(1'h0):(1'h0)]);
              reg42 <= $signed($signed((~$unsigned(reg27[(2'h2):(1'h0)]))));
              reg43 <= {{$signed(((reg32 ? reg18 : wire35) >= $signed(reg27)))},
                  (wire2[(2'h2):(1'h0)] ?
                      {(8'ha0), (^((8'hbf) ? wire14 : wire35))} : (((wire4 ?
                              reg43 : reg36) ?
                          $unsigned((8'hbb)) : $unsigned(reg20)) || (^reg47[(3'h6):(3'h5)])))};
              reg44 <= reg32;
            end
          else
            begin
              reg41 <= {(~&(wire12[(3'h6):(3'h6)] <= ((reg44 << reg36) ?
                      (reg16 ? wire34 : reg17) : (wire11 ~^ wire25))))};
            end
          reg45 <= wire34[(1'h1):(1'h0)];
        end
      if (reg36[(4'hb):(1'h0)])
        begin
          if ({$signed({((reg47 ? wire12 : reg36) + $unsigned((8'hb0)))}),
              {reg23,
                  ((~|(reg45 * (8'hba))) ?
                      $signed((wire35 ? reg28 : wire13)) : wire13)}})
            begin
              reg49 <= (^~reg22);
            end
          else
            begin
              reg49 <= $unsigned(reg47);
              reg50 <= {(wire35 | $unsigned((!(&wire7))))};
              reg51 <= (-(((wire3 < (reg29 < reg45)) >= wire10) ?
                  (8'hbd) : $signed((reg27 << $signed(reg50)))));
            end
          if ($unsigned(wire34))
            begin
              reg52 <= $signed((wire0[(3'h5):(3'h5)] - ((&$unsigned(wire5)) != $signed((wire15 ?
                  reg47 : wire7)))));
              reg53 <= (-(+(reg30 < (8'ha7))));
            end
          else
            begin
              reg52 <= ({$unsigned($signed($unsigned(reg50)))} ?
                  $signed($unsigned((reg31[(4'hf):(4'hb)] ^ (wire15 ?
                      reg44 : wire25)))) : (wire25 || $signed($signed($unsigned(reg43)))));
            end
          reg54 <= (reg29[(5'h11):(4'h9)] ?
              reg30 : ($signed(reg42[(1'h0):(1'h0)]) >= $signed((~&(~|wire12)))));
          reg55 <= $unsigned((-$unsigned((8'hb4))));
          reg56 <= (($unsigned($unsigned(((8'hae) <<< reg38))) > $unsigned($unsigned($unsigned((8'hb7))))) ?
              reg17 : (reg50 ? $unsigned((&wire7[(1'h0):(1'h0)])) : reg49));
        end
      else
        begin
          if ($signed(((8'hb6) ?
              $unsigned($signed((wire1 ?
                  (8'hbd) : (8'ha6)))) : ({$unsigned(reg39),
                  $unsigned(reg41)} != $signed({reg18})))))
            begin
              reg49 <= (wire1 ?
                  $unsigned(($unsigned((reg55 ? reg48 : reg52)) ?
                      {(~&wire5)} : (8'h9d))) : (^reg20));
              reg50 <= (reg50[(4'h8):(2'h3)] >= $unsigned({(8'hb1)}));
              reg51 <= $signed((~&$unsigned({(!reg36), reg20})));
              reg52 <= (+{$unsigned((8'ha4)), (~&wire35)});
            end
          else
            begin
              reg49 <= (wire5[(1'h0):(1'h0)] && (~^(-wire7[(1'h1):(1'h1)])));
              reg50 <= (7'h43);
              reg51 <= $signed($signed($unsigned(((wire0 == (8'ha0)) ?
                  (reg41 ~^ wire6) : (wire24 <<< (8'h9d))))));
              reg52 <= reg16;
              reg53 <= reg22[(2'h2):(1'h0)];
            end
          reg54 <= ($signed((({wire25, reg52} >>> reg21) ?
              ((reg33 ? wire2 : (8'hbd)) ?
                  (|wire35) : reg50) : reg18)) || reg48[(1'h1):(1'h0)]);
          reg55 <= (&(|($unsigned($unsigned(wire2)) >>> $signed((reg37 ?
              (8'h9d) : (8'h9d))))));
          reg56 <= ((reg46[(2'h3):(2'h3)] ?
              $unsigned(wire25) : reg27) != ($unsigned(($signed((8'hb4)) > (&reg48))) ?
              $signed(reg43[(1'h0):(1'h0)]) : (reg17 ^ {{(8'ha9)}})));
        end
    end
endmodule
