module top
#(parameter param57 = ((^{{((8'ha9) ? (8'ha8) : (8'hb3))}}) ? {(({(8'hb8)} ? ((8'ha0) ? (7'h42) : (8'ha8)) : (~(8'h9d))) || {((8'hb7) ? (8'ha0) : (8'ha8))})} : ({(8'hba), (^((8'hbf) ? (8'hb2) : (8'hba)))} ~^ (~((&(8'hb7)) + ((8'hb3) ? (8'ha2) : (7'h42)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1f9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire27,
                 wire26,
                 wire21,
                 wire19,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire4 = ($signed(wire2[(1'h0):(1'h0)]) <<< ($signed({wire1[(2'h3):(1'h0)]}) ?
                     $unsigned((wire2 || (wire0 != wire1))) : $unsigned((~(wire0 == wire2)))));
  assign wire5 = wire2;
  module6 #() modinst20 (wire19, clk, wire3, wire0, wire5, wire4);
  assign wire21 = ((($unsigned(wire19[(4'hf):(1'h0)]) - ((^~(8'h9d)) == $unsigned(wire0))) ?
                      (($unsigned(wire19) ^ $unsigned((7'h42))) ?
                          wire19 : (8'h9d)) : (((wire4 ? wire1 : wire2) ?
                              $unsigned(wire3) : $unsigned(wire19)) ?
                          $unsigned((^~wire19)) : wire19[(3'h4):(2'h2)])) && {($unsigned((^~wire5)) ?
                          $unsigned($unsigned(wire3)) : $signed($signed(wire2)))});
  always
    @(posedge clk) begin
      reg22 <= wire3;
      reg23 <= ($unsigned($signed(((wire21 ? wire4 : wire5) ?
          ((8'haa) != wire3) : reg22[(2'h3):(1'h0)]))) >>> $unsigned(($signed((wire19 ?
              wire1 : reg22)) ?
          ((wire3 ^ (8'haa)) ?
              reg22[(1'h1):(1'h0)] : wire1) : $signed($signed((7'h41))))));
      reg24 <= (~(wire2[(3'h7):(2'h3)] ?
          (((reg23 ^~ wire2) ?
              (reg22 ?
                  wire21 : (8'hb6)) : (^~wire3)) ^~ $signed($unsigned(wire0))) : ($signed($signed(wire19)) ?
              ({wire5} ^~ $unsigned(wire1)) : ($unsigned(wire19) ?
                  $unsigned(reg22) : wire19[(2'h2):(2'h2)]))));
      reg25 <= {$signed($signed((wire5[(4'hb):(2'h2)] ?
              wire5 : (wire19 && wire19))))};
    end
  assign wire26 = {reg24[(3'h6):(2'h3)]};
  assign wire27 = $unsigned(wire1[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg28 <= {wire1, $signed(wire21)};
      reg29 <= {wire5, $unsigned(reg23[(2'h2):(2'h2)])};
      reg30 <= $unsigned($unsigned((((wire19 < wire3) ?
          (reg24 ^ reg23) : (wire5 > reg28)) == ((wire21 ?
          wire4 : wire4) >>> (8'hbe)))));
      reg31 <= ($signed(wire2) ?
          $unsigned((($unsigned((7'h44)) >> reg25[(2'h2):(2'h2)]) || (^~(&wire3)))) : $unsigned(wire2[(4'hb):(1'h1)]));
      if ((($signed((wire27 ? (!wire1) : $signed(reg28))) ?
              reg28[(3'h5):(3'h4)] : wire27) ?
          $signed($signed($unsigned(wire19[(1'h0):(1'h0)]))) : $unsigned((~^$signed(wire5[(1'h1):(1'h1)])))))
        begin
          if ((reg29[(4'h9):(2'h2)] > $unsigned(reg25[(2'h2):(1'h1)])))
            begin
              reg32 <= ((reg24[(3'h5):(2'h2)] && $signed($unsigned(wire1))) != wire3);
            end
          else
            begin
              reg32 <= $signed($signed(reg25));
              reg33 <= (7'h42);
              reg34 <= ($unsigned({reg25[(3'h4):(3'h4)], (~|$signed(wire2))}) ?
                  (~|$unsigned(($signed(wire26) - $unsigned(reg33)))) : ((^(8'hb8)) >>> reg29));
              reg35 <= wire19[(2'h2):(1'h1)];
              reg36 <= $signed($signed((($unsigned(reg30) ?
                  (wire21 ? reg23 : reg32) : {reg34}) >>> (&(!wire4)))));
            end
          reg37 <= $unsigned($unsigned({($signed(wire21) ?
                  {reg32} : $unsigned(reg30)),
              {reg24, $unsigned(reg32)}}));
          if (reg36)
            begin
              reg38 <= ((~|(+$signed($signed(reg34)))) ^~ $signed((8'hba)));
            end
          else
            begin
              reg38 <= $signed($signed(($unsigned(wire27[(3'h7):(1'h0)]) ?
                  (~(reg24 >>> wire1)) : (&$signed(wire3)))));
              reg39 <= (^~$unsigned((reg34 ?
                  ((-wire21) | {reg33}) : wire3[(1'h1):(1'h1)])));
            end
        end
      else
        begin
          reg32 <= {(~&(reg29 << ((reg37 ^~ reg36) ?
                  (-wire0) : $signed(reg28)))),
              $unsigned($unsigned((reg38 ? wire5 : (wire27 << wire26))))};
        end
    end
  assign wire40 = $unsigned((((8'haa) > reg36) * $signed((+(reg32 * reg22)))));
  assign wire41 = (~|$signed($signed($unsigned({reg38}))));
  assign wire42 = wire4;
  assign wire43 = wire41;
  assign wire44 = $signed($signed(($signed(wire21[(4'h8):(2'h3)]) ?
                      (~$signed((8'ha9))) : reg29[(3'h6):(1'h0)])));
  assign wire45 = $unsigned(reg31[(1'h1):(1'h1)]);
  assign wire46 = $unsigned({reg32});
  assign wire47 = ($unsigned($signed($signed((wire43 ?
                      wire5 : reg25)))) & (-$signed((~$signed(reg32)))));
  always
    @(posedge clk) begin
      reg48 <= {(wire27[(3'h4):(1'h1)] ?
              {reg36, wire44[(4'hf):(1'h0)]} : ((|wire4) ?
                  reg29 : $signed((reg24 <<< reg25)))),
          ((^({(8'hab)} ? {reg32, (8'ha1)} : {reg34, reg28})) ?
              $signed(((7'h41) >>> (reg22 >= wire5))) : ($unsigned((^(8'had))) || (~$signed(wire41))))};
      reg49 <= (~^((~|($signed(reg39) ?
          {wire46,
              (8'hbb)} : {wire27})) < $signed($unsigned($unsigned(reg24)))));
      reg50 <= $signed($unsigned(reg31));
      if ($signed((+$unsigned(reg39))))
        begin
          reg51 <= $unsigned({reg23, (|$unsigned(wire5))});
          if (wire1)
            begin
              reg52 <= $unsigned((~(8'hb8)));
              reg53 <= $unsigned(wire43[(1'h1):(1'h1)]);
              reg54 <= (|$signed((|$signed((|(8'hbd))))));
              reg55 <= (-$signed($signed($unsigned((&reg28)))));
              reg56 <= $signed((~^$unsigned($unsigned(reg35[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg52 <= reg34;
              reg53 <= {{wire5[(4'h8):(3'h7)],
                      ($signed((wire44 >> wire47)) > reg23[(2'h3):(1'h1)])},
                  (~wire19[(4'he):(3'h5)])};
              reg54 <= $unsigned(((($signed(reg50) ?
                      (wire42 & reg32) : (wire27 ^ reg24)) < wire42[(2'h2):(1'h1)]) ?
                  $signed((reg48 ?
                      (reg56 ~^ wire43) : ((8'hbd) ?
                          wire44 : wire45))) : reg51[(3'h4):(1'h0)]));
            end
        end
      else
        begin
          reg51 <= reg28;
        end
    end
endmodule

module module6
#(parameter param17 = (8'haf), 
parameter param18 = (+(((8'haa) ? param17 : (^param17)) ? param17 : {(~|(param17 ? param17 : (8'hb4))), ((~&param17) >= (param17 <= param17))})))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = $unsigned((~|$signed(($signed(wire9) && (wire10 & wire7)))));
  assign wire12 = wire10[(4'h9):(3'h6)];
  assign wire13 = (-{wire12,
                      (($unsigned(wire12) ?
                              $unsigned(wire8) : $unsigned(wire11)) ?
                          $unsigned((!wire11)) : (~wire8[(4'hc):(4'hb)]))});
  assign wire14 = (8'hae);
  assign wire15 = wire12;
  assign wire16 = (^~$signed(($unsigned(wire8[(3'h7):(3'h5)]) ?
                      ($unsigned(wire7) ?
                          wire13 : wire14[(1'h0):(1'h0)]) : (^~(wire15 ?
                          (8'h9f) : wire7)))));
endmodule
