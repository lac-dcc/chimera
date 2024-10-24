module top
#(parameter param66 = {(|(({(8'hab), (7'h44)} || ((8'ha2) ? (8'hb8) : (8'hb7))) ? (&(8'hbc)) : (((8'haa) ? (8'hab) : (7'h42)) ^~ ((8'h9f) ? (8'hb7) : (8'ha8)))))}, 
parameter param67 = (param66 | param66))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h203):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire29;
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire5,
                 wire6,
                 wire7,
                 wire29,
                 reg61,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire5 = wire1[(4'hd):(1'h1)];
  assign wire6 = (wire1 <= (-(&wire4[(2'h3):(1'h0)])));
  assign wire7 = (~|{wire3[(4'h9):(3'h4)]});
  module8 #() modinst30 (.wire13(wire1), .clk(clk), .wire11(wire3), .y(wire29), .wire12(wire6), .wire10(wire5), .wire9(wire0));
  assign wire31 = $signed(($signed((!(wire29 >= (8'hb3)))) ?
                      ($unsigned(wire3) >= wire3) : {{{(8'ha6), (8'h9e)},
                              wire6[(4'hc):(4'ha)]}}));
  assign wire32 = ($signed($unsigned(((-wire4) ?
                      ((8'ha2) ?
                          wire7 : wire4) : (wire1 || wire1)))) == ($signed(wire6) ?
                      wire2[(1'h0):(1'h0)] : ($unsigned(((8'ha7) ?
                          wire2 : wire6)) == $signed($unsigned(wire5)))));
  assign wire33 = ($signed((8'hba)) || (~wire7[(4'hb):(3'h6)]));
  assign wire34 = ($signed(((~&{wire33, wire2}) ?
                          ($unsigned(wire31) + (|(8'hb3))) : $unsigned($unsigned(wire3)))) ?
                      $unsigned(wire2) : $unsigned((~&wire0)));
  assign wire35 = (!wire6[(4'hd):(4'h9)]);
  assign wire36 = wire7[(3'h6):(1'h0)];
  assign wire37 = $unsigned($unsigned($signed(($signed(wire5) ?
                      wire0 : (wire33 ? wire1 : wire5)))));
  assign wire38 = $unsigned(wire34);
  assign wire39 = wire33;
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg40 <= (^(~&(wire31[(1'h0):(1'h0)] << wire31)));
          reg41 <= ((wire34[(2'h2):(2'h2)] <<< (|(~$signed(wire4)))) ?
              ($signed($signed((wire34 * wire1))) ?
                  (8'ha3) : ((^wire2[(1'h0):(1'h0)]) | $unsigned((wire4 ~^ wire39)))) : {(~$signed({wire1,
                      wire31}))});
          reg42 <= wire4[(4'h9):(4'h9)];
          reg43 <= $unsigned(((^$unsigned(reg42)) ?
              $unsigned(wire31) : $signed(wire2)));
          reg44 <= wire31[(5'h13):(3'h6)];
        end
      else
        begin
          reg40 <= {$signed({($signed(wire0) < (wire3 ? wire29 : wire39)),
                  $unsigned($signed(reg44))})};
          if ($signed($signed((+($signed((8'hab)) << wire7[(1'h1):(1'h1)])))))
            begin
              reg41 <= (~|$signed($signed(({wire1} ?
                  wire39 : (wire37 | (8'h9f))))));
              reg42 <= $unsigned(wire36);
            end
          else
            begin
              reg41 <= {(&($unsigned((~^wire5)) ? wire34 : (+wire37)))};
              reg42 <= {{(&$unsigned({(8'ha1)})),
                      (wire35 ? $unsigned((8'hbb)) : $unsigned({reg43}))},
                  $signed((wire39 ?
                      $unsigned((wire29 ?
                          (8'ha7) : reg40)) : $signed((8'hb8))))};
              reg43 <= ($signed($signed(wire0[(3'h4):(2'h2)])) ?
                  $unsigned(($signed((8'h9e)) | {wire35,
                      (^wire1)})) : $signed($signed(wire2[(2'h2):(2'h2)])));
              reg44 <= wire32;
            end
          reg45 <= $signed((({wire2[(4'h8):(3'h5)]} || $unsigned((wire36 ?
                  wire2 : wire38))) ?
              $signed(reg43) : (~^($unsigned(wire36) ?
                  ((8'ha4) <= wire0) : $signed(reg43)))));
        end
      reg46 <= ((reg40[(4'he):(3'h7)] ?
          wire5 : (((wire39 <<< wire29) ?
              {wire0,
                  wire34} : $signed(reg41)) == (wire34[(4'h9):(4'h8)] && $unsigned((7'h41))))) && ((((wire36 >>> (8'ha9)) ?
                  (reg45 < wire32) : (wire3 ^ wire29)) ?
              (wire1 | wire29[(3'h7):(3'h6)]) : {wire39[(4'ha):(4'h8)],
                  $unsigned(wire7)}) ?
          (((wire39 ? reg40 : wire1) * (wire38 - wire0)) ?
              $unsigned($signed(reg44)) : reg41[(5'h10):(3'h7)]) : (|$unsigned((wire36 ?
              wire36 : (8'hb0))))));
      if (wire7[(2'h2):(1'h0)])
        begin
          reg47 <= {$unsigned($unsigned($signed($signed((8'hbe))))),
              {(^~$unsigned({wire2, wire34})),
                  (|($signed(reg40) - ((8'ha0) + wire6)))}};
        end
      else
        begin
          if (((8'ha9) < $unsigned((-(wire39[(4'h8):(3'h4)] && (wire33 ?
              wire3 : wire2))))))
            begin
              reg47 <= ($unsigned(wire1[(1'h0):(1'h0)]) >> wire2);
            end
          else
            begin
              reg47 <= (&(+reg44[(3'h4):(1'h1)]));
              reg48 <= ({$unsigned(($signed(wire1) ?
                          (~^(8'ha8)) : $signed(wire31)))} ?
                  $unsigned(((-(-wire4)) ?
                      (8'ha0) : {$unsigned(reg46),
                          $signed(wire31)})) : ($signed(($signed((8'ha7)) < $unsigned(wire3))) ?
                      (~^{$unsigned(reg44),
                          $unsigned(wire4)}) : ($unsigned(reg46) ?
                          ((reg47 > wire0) == $signed(wire34)) : $unsigned((wire31 ^ (8'hb9))))));
              reg49 <= $unsigned(wire39[(2'h2):(2'h2)]);
              reg50 <= {wire32};
              reg51 <= (~wire36);
            end
          reg52 <= (wire6[(4'hb):(4'ha)] ?
              $unsigned($unsigned(wire7[(2'h3):(1'h1)])) : $unsigned((!$unsigned(reg42[(3'h7):(3'h7)]))));
          reg53 <= $unsigned(wire5[(5'h10):(4'ha)]);
        end
      if ((~|(7'h43)))
        begin
          reg54 <= $unsigned(wire36);
          reg55 <= ({reg46[(1'h0):(1'h0)]} ?
              $unsigned((8'ha3)) : $unsigned($unsigned(reg48)));
          reg56 <= reg50;
          if ((wire0 << wire33))
            begin
              reg57 <= $signed({reg50,
                  ($unsigned($unsigned((8'hb9))) ?
                      (~|reg51) : ($unsigned((8'ha8)) ?
                          $signed(reg44) : ((8'hba) || wire3)))});
            end
          else
            begin
              reg57 <= $signed((reg48 ?
                  ({$signed(reg53), (~|reg48)} ?
                      (reg43 ?
                          (wire4 >> wire4) : ((8'hb7) | reg43)) : $unsigned((wire31 <= reg44))) : {{$unsigned(reg55)},
                      {wire32}}));
              reg58 <= {((reg49 ?
                      $signed(wire34[(5'h14):(2'h3)]) : $unsigned($signed(reg41))) && $signed(wire29[(4'h9):(4'h9)]))};
              reg59 <= $signed((wire32[(2'h3):(2'h3)] > ({(-wire1)} ?
                  ((!wire36) && (reg57 ?
                      wire5 : reg57)) : $unsigned($unsigned((8'h9e))))));
              reg60 <= $unsigned(wire31);
              reg61 <= $unsigned((&$signed(reg52[(2'h2):(2'h2)])));
            end
        end
      else
        begin
          reg54 <= $unsigned(wire4[(1'h1):(1'h0)]);
          reg55 <= $signed((7'h44));
          reg56 <= ((((8'had) ?
              $signed((~&(7'h43))) : (wire36 ?
                  $signed(reg40) : $signed(reg45))) <<< reg51) >> (wire34 | reg51[(4'h8):(1'h0)]));
          reg57 <= wire29[(2'h2):(1'h0)];
        end
    end
  assign wire62 = wire35[(4'hb):(3'h4)];
  assign wire63 = $unsigned((~|wire2[(4'h8):(4'h8)]));
  assign wire64 = (-((~|reg48[(3'h4):(1'h1)]) & reg51[(4'h9):(1'h1)]));
  assign wire65 = ($signed({$signed($unsigned(wire62)),
                      {(~|(8'had))}}) ~^ wire33);
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 (1'h0)};
  assign wire14 = wire13[(1'h1):(1'h1)];
  assign wire15 = (wire9 == wire12[(4'hc):(4'h8)]);
  assign wire16 = (~|$unsigned($unsigned({(+wire11), (wire11 * wire13)})));
  assign wire17 = wire14;
  assign wire18 = (|$signed((((|wire17) ? (~^wire11) : $unsigned(wire16)) ?
                      ($signed(wire11) + $unsigned(wire11)) : {wire17[(2'h2):(1'h1)]})));
  assign wire19 = $signed(wire10);
  assign wire20 = (($unsigned(wire14[(4'hb):(3'h4)]) ^~ ((~^wire12) + $unsigned($signed(wire9)))) - $unsigned(((&$signed(wire15)) ~^ $signed((wire9 ?
                      wire12 : wire16)))));
  assign wire21 = (8'hb6);
  assign wire22 = ((^~{wire16[(1'h0):(1'h0)],
                      $unsigned((wire9 ?
                          wire13 : wire16))}) && (wire12[(4'hc):(4'ha)] | (8'ha4)));
  assign wire23 = $unsigned({$signed($signed((~&wire13))),
                      wire12[(4'ha):(2'h2)]});
  assign wire24 = wire14[(2'h2):(2'h2)];
  assign wire25 = $signed({($unsigned(wire13) ?
                          wire21[(1'h1):(1'h1)] : wire23)});
  assign wire26 = {(&wire23),
                      (wire22 > (wire11[(3'h6):(1'h0)] < wire24[(4'h8):(1'h0)]))};
  assign wire27 = $signed($signed($unsigned($signed({wire16}))));
  assign wire28 = wire13;
endmodule
