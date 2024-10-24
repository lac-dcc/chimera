module top
#(parameter param37 = (~|(((((8'ha5) || (8'hb3)) <= (!(8'ha5))) ? (!((8'ha3) <= (8'hbb))) : (|((7'h43) ^ (8'hba)))) << {(~|(~^(8'hbf))), (((8'hba) > (8'ha5)) && ((8'ha2) ? (8'hb0) : (8'haa)))})), 
parameter param38 = (((((param37 | param37) >>> (~param37)) << ((param37 ? param37 : param37) ? (param37 ? param37 : param37) : (param37 ^~ param37))) << (((~(7'h43)) ? param37 : (param37 ? param37 : (8'hb6))) ~^ ({param37} ^ (^param37)))) >> (param37 > ({(-param37)} <<< param37))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $unsigned(({(-$signed(wire0))} ?
                     wire1 : $unsigned(((wire1 ? (8'ha4) : wire0) ?
                         (wire1 << wire4) : (wire4 ? wire3 : wire0)))));
  assign wire6 = ($unsigned(wire4) <= (wire3 ?
                     wire3[(1'h0):(1'h0)] : $signed(wire2)));
  assign wire7 = wire2;
  assign wire8 = $unsigned({({$unsigned((8'hb2))} << $signed((~wire5))),
                     $signed($signed((-wire1)))});
  always
    @(posedge clk) begin
      if ({$unsigned($unsigned((wire2 ? $unsigned(wire4) : {wire6, wire2}))),
          $signed(wire7)})
        begin
          reg9 <= (8'hb4);
          reg10 <= wire5;
          reg11 <= wire3[(4'h9):(1'h1)];
          reg12 <= ((~|$signed($signed(((8'hae) != reg10)))) ?
              (|wire8[(3'h4):(2'h2)]) : $unsigned({(8'hab), $unsigned(wire6)}));
        end
      else
        begin
          reg9 <= $signed((|$unsigned(wire7)));
          reg10 <= ((^(~^reg10)) ?
              (^wire0) : (wire1 ? wire6[(2'h3):(1'h1)] : (8'ha3)));
          reg11 <= {$unsigned($unsigned(wire6[(2'h2):(1'h1)]))};
          reg12 <= $signed(wire8);
          reg13 <= $unsigned((8'hab));
        end
      reg14 <= (-wire4);
      reg15 <= wire5[(4'hb):(3'h4)];
    end
  assign wire16 = $unsigned({wire1[(1'h0):(1'h0)],
                      (((wire1 ? wire8 : (7'h40)) * $unsigned(reg10)) ?
                          ((^~reg10) <<< wire4) : wire1)});
  assign wire17 = (+$signed((reg11 + {(wire1 ? wire3 : wire1),
                      $unsigned(reg9)})));
  assign wire18 = {(reg11 ? wire17[(2'h2):(2'h2)] : $signed((|{reg11})))};
  assign wire19 = {reg13};
  assign wire20 = ($signed(wire19[(4'h9):(4'h9)]) ?
                      (^~{$signed(wire3)}) : (^(~^({reg12} ?
                          {reg10, (8'ha1)} : $signed((8'ha5))))));
  always
    @(posedge clk) begin
      reg21 <= {$unsigned((((wire8 >>> wire5) >> (wire16 + wire16)) ?
              (wire16 ^~ wire4[(5'h11):(1'h0)]) : (^(|wire3)))),
          reg14[(1'h1):(1'h1)]};
      if (($unsigned({($unsigned(wire2) ~^ (wire4 > wire16))}) ?
          $signed({wire18,
              $unsigned((reg9 ?
                  reg15 : wire7))}) : ($signed((^~$signed(wire5))) || (^$signed(reg9[(2'h2):(1'h0)])))))
        begin
          reg22 <= (|(^$signed((wire17[(3'h6):(2'h3)] ?
              (wire3 * wire2) : (-(8'hb2))))));
          reg23 <= $signed($signed(reg21[(5'h14):(5'h12)]));
          reg24 <= {(~^$unsigned((wire2[(1'h0):(1'h0)] > $unsigned(reg23)))),
              {wire18}};
          reg25 <= (^{$signed(wire19[(2'h2):(2'h2)]),
              $unsigned(($unsigned(reg14) >= (~|wire2)))});
          reg26 <= wire7;
        end
      else
        begin
          if ($signed((7'h44)))
            begin
              reg22 <= wire2;
              reg23 <= {{reg26[(4'hc):(4'ha)]}};
              reg24 <= {(reg10[(1'h0):(1'h0)] >= (^~(&$signed(reg10))))};
              reg25 <= wire17[(3'h4):(2'h2)];
            end
          else
            begin
              reg22 <= (|((~^{(reg14 ?
                      reg11 : wire3)}) >> ((|reg9) + (^(^reg14)))));
              reg23 <= {{wire8[(1'h1):(1'h0)]},
                  ($signed((~|$signed(wire0))) ~^ $unsigned($signed($signed(reg9))))};
              reg24 <= wire1[(3'h6):(1'h1)];
              reg25 <= (~|$signed($signed($signed((reg22 ? wire7 : reg13)))));
              reg26 <= (reg24[(3'h5):(3'h5)] ?
                  ((&{wire17}) + $unsigned((wire16 * {wire8}))) : (~^reg9[(1'h0):(1'h0)]));
            end
          reg27 <= (wire0 ?
              (~^reg13[(3'h5):(1'h1)]) : $unsigned($signed((^(reg13 * reg25)))));
          if (wire16[(2'h3):(1'h1)])
            begin
              reg28 <= (^wire3);
              reg29 <= wire8[(2'h3):(1'h0)];
              reg30 <= reg23[(2'h2):(2'h2)];
              reg31 <= (reg10[(3'h5):(3'h5)] ?
                  (($unsigned(reg9) ?
                          (~(wire0 ? reg27 : wire17)) : wire1[(3'h7):(2'h3)]) ?
                      wire17 : (8'hbc)) : reg29[(2'h3):(1'h0)]);
              reg32 <= (8'had);
            end
          else
            begin
              reg28 <= $unsigned($signed((reg24[(3'h6):(2'h2)] ?
                  reg9 : $signed((wire7 ? reg24 : reg29)))));
              reg29 <= $unsigned(((reg32 ? {(wire17 == wire1)} : reg12) ?
                  ($signed($unsigned(wire17)) != (|(~|wire0))) : ($unsigned((wire17 ^~ wire18)) ~^ wire2[(2'h3):(1'h0)])));
            end
          if (reg28[(1'h1):(1'h0)])
            begin
              reg33 <= {((reg21[(3'h4):(2'h3)] ?
                      $unsigned(reg27) : {(reg14 ? reg31 : reg12),
                          $signed(wire19)}) & $signed($unsigned((8'hbd))))};
            end
          else
            begin
              reg33 <= $signed((($unsigned((8'ha7)) >> (&wire1)) >>> reg29[(4'h9):(3'h5)]));
              reg34 <= (8'had);
              reg35 <= (~&{$signed(($unsigned(reg14) << wire17))});
            end
          reg36 <= (~^$unsigned(wire8[(4'h8):(3'h6)]));
        end
    end
endmodule
