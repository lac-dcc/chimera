module top
#(parameter param70 = {{(|(((8'ha1) <= (8'ha3)) ? {(8'hb8)} : {(8'h9f)}))}}, 
parameter param71 = param70)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire65;
  assign y = {wire69, wire68, wire67, wire4, wire65, (1'h0)};
  assign wire4 = wire3[(3'h7):(1'h1)];
  module5 #() modinst66 (wire65, clk, wire2, wire3, wire4, wire0, wire1);
  assign wire67 = ($unsigned((wire1 ?
                      (-$unsigned(wire2)) : (~(wire0 * wire4)))) | wire3[(1'h1):(1'h0)]);
  assign wire68 = (~wire3);
  assign wire69 = (wire2 ?
                      (+(^~((wire2 ?
                          wire0 : wire2) == (8'hab)))) : (~&$unsigned((-wire2))));
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire11;
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire55,
                 wire11,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire11 = ((&$signed(((~&(8'haf)) ?
                      $signed(wire9) : wire6[(3'h6):(2'h2)]))) == {wire8[(4'h9):(3'h5)]});
  module12 #() modinst56 (.y(wire55), .wire15(wire8), .clk(clk), .wire16(wire10), .wire13(wire11), .wire14(wire6));
  always
    @(posedge clk) begin
      reg57 <= ((!wire11[(4'h8):(3'h6)]) ?
          (($unsigned((wire8 ? wire6 : wire11)) ?
              (8'hb3) : $unsigned((~|wire8))) | (wire6[(4'h9):(3'h7)] | wire9)) : $unsigned(wire9));
      reg58 <= (wire55[(4'h9):(3'h6)] ?
          {((^~(~&wire11)) ?
                  (wire11 ? $unsigned(wire7) : (~reg57)) : (&(wire6 ?
                      wire11 : wire10))),
              $signed(wire7)} : wire11);
      reg59 <= $signed(wire11[(1'h1):(1'h0)]);
    end
  assign wire60 = $signed((8'hbf));
  assign wire61 = {$signed($unsigned((8'hb3))),
                      ($signed((wire6 ^ wire7)) > (~|($signed(wire11) ?
                          (~^wire11) : $unsigned((8'ha1)))))};
  assign wire62 = (8'hb8);
  assign wire63 = $unsigned((wire62[(3'h4):(2'h3)] ?
                      (&wire11[(4'he):(4'h9)]) : $signed(wire9[(1'h0):(1'h0)])));
  assign wire64 = {($unsigned($signed($signed(reg57))) | $unsigned($signed(wire55)))};
endmodule

module module12
#(parameter param54 = (-(!(~&(+(~^(8'ha8)))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire16;
  input wire signed [(2'h2):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  assign y = {wire53,
                 wire46,
                 wire18,
                 wire17,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
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
                 (1'h0)};
  assign wire17 = (($signed(wire13[(5'h11):(3'h5)]) ?
                      ((wire13[(4'he):(4'hb)] == $unsigned(wire15)) <<< (-(+(7'h41)))) : ($unsigned({wire14}) != $unsigned(wire14))) && {$signed($signed(((8'ha3) * wire14))),
                      wire16[(2'h3):(1'h0)]});
  assign wire18 = $unsigned((&$unsigned((wire14[(4'hb):(3'h7)] << wire16))));
  always
    @(posedge clk) begin
      reg19 <= {$unsigned((8'hbb))};
      reg20 <= $unsigned($unsigned(reg19));
      if (wire17[(1'h0):(1'h0)])
        begin
          if ($unsigned($unsigned(reg20)))
            begin
              reg21 <= ((reg19 | (&$signed((~&wire15)))) * wire14[(3'h6):(3'h4)]);
              reg22 <= (wire15 ?
                  reg21 : $unsigned($signed(wire14[(4'hb):(2'h3)])));
              reg23 <= wire17[(1'h0):(1'h0)];
              reg24 <= wire18[(3'h4):(2'h2)];
              reg25 <= $unsigned(((!reg22[(4'hd):(3'h4)]) ?
                  $unsigned(wire13) : (&reg19[(2'h2):(1'h0)])));
            end
          else
            begin
              reg21 <= $signed(((~$unsigned((~^wire18))) <= (wire14[(4'h8):(4'h8)] + $signed($signed(wire17)))));
              reg22 <= (~^(|({$unsigned(reg23), $signed(reg21)} ?
                  {{wire13}} : wire17)));
              reg23 <= ($signed({(wire18[(2'h2):(2'h2)] ?
                          wire17 : (~^wire14))}) ?
                  $unsigned(($signed((reg24 ? reg19 : wire13)) ?
                      reg19[(3'h4):(2'h2)] : ($signed(wire17) ?
                          (reg23 ? (8'ha6) : reg24) : (reg24 ?
                              wire18 : wire14)))) : reg24[(2'h2):(1'h0)]);
            end
          if ({((^reg25[(3'h4):(1'h0)]) & reg21)})
            begin
              reg26 <= $unsigned({(wire14[(1'h0):(1'h0)] - wire16[(2'h3):(1'h0)])});
              reg27 <= $unsigned({reg21, reg21});
              reg28 <= ((-$signed((reg23 != reg24[(3'h4):(3'h4)]))) ?
                  wire16[(4'hc):(3'h5)] : (~|wire18));
              reg29 <= ({(($signed(wire18) ?
                      $signed((8'ha5)) : reg27) && (reg26 ?
                      $unsigned(reg21) : (+reg23))),
                  ($unsigned(reg25) >>> $signed((wire15 > reg19)))} <<< $signed(($unsigned(wire15) ?
                  $unsigned(wire13[(4'ha):(1'h1)]) : {$signed(wire14),
                      $signed((8'ha2))})));
            end
          else
            begin
              reg26 <= $unsigned($signed(wire14[(1'h0):(1'h0)]));
            end
          reg30 <= $signed($signed($unsigned(((reg19 <= reg27) ?
              $unsigned((8'ha3)) : (|wire15)))));
          reg31 <= $signed((wire15 ~^ $unsigned($signed((reg26 > (8'hb6))))));
          reg32 <= $unsigned(wire14[(3'h7):(3'h6)]);
        end
      else
        begin
          reg21 <= (reg20 & $signed($signed(wire13[(5'h12):(4'hb)])));
          reg22 <= {wire15,
              (wire18 | ((reg30 ?
                      ((8'ha6) ? wire17 : reg27) : wire17[(1'h1):(1'h1)]) ?
                  $unsigned({(8'ha9)}) : $unsigned($unsigned(reg25))))};
          if ((((($unsigned((8'hbb)) ? reg19[(1'h1):(1'h0)] : $signed(reg26)) ?
              reg21[(2'h2):(2'h2)] : {$signed(reg26)}) - (reg23[(1'h0):(1'h0)] || $signed($unsigned(reg22)))) && $signed($unsigned(wire16))))
            begin
              reg23 <= $signed({reg20[(1'h0):(1'h0)],
                  $signed($signed(((8'ha2) ? reg28 : reg30)))});
              reg24 <= $signed((reg21[(3'h6):(1'h1)] ?
                  $unsigned(wire15) : ((-(wire15 ?
                      reg22 : reg30)) == {(^~(8'ha3)), reg32[(1'h0):(1'h0)]})));
              reg25 <= $signed(reg28);
              reg26 <= (~&(~^$unsigned($unsigned((~reg29)))));
            end
          else
            begin
              reg23 <= ((8'hb7) <<< $unsigned($signed((&(reg32 <= reg29)))));
              reg24 <= wire15;
            end
        end
      if (reg19)
        begin
          reg33 <= $signed(reg28[(3'h5):(1'h1)]);
          reg34 <= (~&($signed(reg23) >= $unsigned($unsigned(wire13[(4'hf):(2'h3)]))));
          if (({wire13,
                  ($unsigned($unsigned(wire15)) ?
                      (|reg26[(2'h2):(1'h1)]) : $signed((wire18 + reg24)))} ?
              $signed(reg19) : reg23[(5'h11):(5'h10)]))
            begin
              reg35 <= ({$unsigned((~&{reg27}))} ?
                  {(reg34 ?
                          ((reg32 ^~ reg33) ?
                              $signed((8'ha0)) : (reg26 >> wire18)) : (8'hb5))} : $unsigned($unsigned($unsigned(wire17[(2'h3):(2'h2)]))));
              reg36 <= {$signed(reg22), (reg25 != wire14)};
              reg37 <= (8'ha9);
              reg38 <= {(8'hb7)};
              reg39 <= ((+({$signed(reg21)} ^ reg20)) > reg25);
            end
          else
            begin
              reg35 <= (($unsigned($signed($signed(reg39))) ?
                      ({(reg33 ? reg22 : reg24),
                          $unsigned(reg37)} ~^ $signed($unsigned(reg24))) : (~|$signed(reg22))) ?
                  (+($unsigned((reg27 && reg29)) ?
                      ((reg22 | (8'h9c)) < (-reg29)) : reg23)) : {$signed(((8'hbf) - {reg36,
                          reg30}))});
              reg36 <= ($unsigned(reg38) ?
                  (~&{$unsigned({(8'ha6), reg35})}) : reg37[(4'he):(3'h6)]);
              reg37 <= $unsigned($unsigned((&reg24[(3'h6):(3'h5)])));
              reg38 <= (reg29 <= reg39[(1'h0):(1'h0)]);
            end
          reg40 <= $signed(reg25[(1'h1):(1'h1)]);
          if ($unsigned(reg24[(3'h5):(1'h0)]))
            begin
              reg41 <= {(&$unsigned($unsigned((!reg22)))),
                  reg27[(4'ha):(4'ha)]};
              reg42 <= (reg30[(4'hb):(1'h0)] ?
                  (({((8'hb3) * wire17), (reg26 ? reg28 : (8'haa))} ?
                      $signed(wire18) : $signed((reg32 ?
                          reg31 : reg40))) ^~ (|$signed((~|reg26)))) : reg32);
              reg43 <= (&reg26);
              reg44 <= $unsigned($signed((~(~|(reg30 <<< reg32)))));
            end
          else
            begin
              reg41 <= reg33;
            end
        end
      else
        begin
          if (((wire18[(2'h3):(1'h0)] ?
              reg23 : reg37) ~^ {wire16[(3'h7):(1'h1)], reg42[(2'h3):(1'h1)]}))
            begin
              reg33 <= (({wire18[(3'h4):(2'h3)]} * reg23) < (|reg40[(1'h1):(1'h1)]));
              reg34 <= reg26[(1'h0):(1'h0)];
              reg35 <= ({$signed((^~reg38)),
                  (((~&reg42) ? reg22[(4'hc):(4'h9)] : {reg37, (8'haa)}) ?
                      (8'haa) : (reg44 << (reg30 ?
                          reg39 : wire17)))} ~^ (wire14[(3'h6):(1'h0)] ?
                  ({$signed(reg20)} ?
                      $unsigned((reg35 | reg28)) : (~(wire16 <<< reg21))) : wire15[(1'h1):(1'h1)]));
              reg36 <= (~$signed((((reg38 ? wire15 : reg39) ?
                  (+reg22) : (~^reg19)) || reg35[(4'hc):(4'hb)])));
              reg37 <= reg27[(4'hc):(4'hb)];
            end
          else
            begin
              reg33 <= $unsigned((reg31[(3'h4):(2'h3)] | $signed(({wire17} >>> $unsigned(reg37)))));
              reg34 <= $signed(wire17);
              reg35 <= reg28[(2'h2):(1'h1)];
            end
          reg38 <= (8'hac);
          reg39 <= $unsigned((($unsigned(reg32) ?
              $signed((+(8'hb1))) : $unsigned(wire18)) || reg33[(4'h9):(3'h6)]));
        end
      reg45 <= $unsigned(((($signed(reg43) ^~ (reg32 >= (8'ha2))) ?
          {$unsigned(reg31)} : reg23[(4'ha):(1'h1)]) << ((wire16[(2'h3):(2'h3)] ?
              wire16[(4'ha):(1'h0)] : wire17) ?
          reg39 : reg32[(1'h1):(1'h1)])));
    end
  assign wire46 = ($unsigned(wire18[(1'h1):(1'h1)]) << reg40[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ($unsigned((+reg38[(4'hd):(4'hd)])))
        begin
          reg47 <= reg42;
          if ({(($unsigned(reg32[(1'h1):(1'h0)]) ?
                      ((reg30 ? wire14 : reg20) >= (wire18 & reg33)) : ((reg28 ?
                              wire46 : wire18) ?
                          reg23[(3'h4):(2'h2)] : reg39)) ?
                  $unsigned(($signed(reg23) && (wire14 - wire18))) : $unsigned({$signed(reg28)}))})
            begin
              reg48 <= ({$signed(reg35[(3'h5):(2'h3)]), reg22} + (reg34 ?
                  {$unsigned(reg29)} : $signed($unsigned({reg28, reg31}))));
              reg49 <= $signed(reg25[(2'h2):(1'h0)]);
              reg50 <= {wire46,
                  (($unsigned($signed((8'h9c))) ~^ $unsigned(reg48)) ?
                      (reg29 ?
                          reg39[(2'h3):(1'h0)] : $unsigned((~|reg40))) : (8'hb5))};
              reg51 <= $signed($signed(($signed((~&reg34)) ?
                  $signed(((8'hb4) || reg25)) : reg21[(2'h2):(1'h1)])));
              reg52 <= $unsigned($signed((~^((reg24 ?
                  reg50 : (8'ha7)) >> {(7'h41)}))));
            end
          else
            begin
              reg48 <= reg38[(3'h6):(3'h6)];
            end
        end
      else
        begin
          reg47 <= reg32;
        end
    end
  assign wire53 = $unsigned(reg37);
endmodule
