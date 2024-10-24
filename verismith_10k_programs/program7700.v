module top
#(parameter param48 = ((({(^(8'hbf)), (^~(8'hbf))} ? {(^(8'ha1)), (+(8'hb7))} : ((8'hb2) ? (~(8'had)) : (!(8'ha2)))) ? ({(|(8'ha1))} < ((~&(8'had)) >= ((7'h42) * (8'ha6)))) : ((((8'h9d) ? (8'hab) : (8'ha1)) ? ((8'ha0) * (7'h41)) : ((8'hab) >> (8'had))) - (8'ha8))) << (!({((8'hb2) & (8'hb4))} ~^ {(8'hab), ((8'hab) && (8'hb0))}))), 
parameter param49 = (+param48))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h214):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire35,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 reg37,
                 reg36,
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
                 reg18,
                 reg17,
                 reg16,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= (-$unsigned(({wire5[(4'hc):(4'ha)]} ?
          {$unsigned(wire3), (^~wire4)} : (wire4[(2'h3):(1'h0)] ?
              ((8'hb9) ? wire2 : wire5) : (|(8'haf))))));
      reg7 <= ((^~$signed($unsigned((reg6 <= wire5)))) && reg6);
      reg8 <= {($signed($signed($signed((8'hb6)))) << (~$signed($unsigned((8'hb0)))))};
      reg9 <= ($signed($unsigned(((reg7 ?
          wire0 : wire1) - (-(8'had))))) & wire2);
    end
  assign wire10 = (((7'h43) - {reg6[(4'h9):(4'h9)], $signed({(8'h9c)})}) ?
                      (reg8 ~^ $signed(reg8[(2'h2):(2'h2)])) : $unsigned($signed($signed((wire5 ?
                          wire0 : reg8)))));
  assign wire11 = wire5[(2'h2):(1'h0)];
  assign wire12 = wire4[(1'h1):(1'h0)];
  assign wire13 = $unsigned((~(wire12[(5'h14):(4'h8)] ^~ ($unsigned(wire2) && (|wire4)))));
  assign wire14 = $unsigned(reg7[(4'h8):(2'h3)]);
  assign wire15 = (~|((^$signed((~wire5))) - (~^(~(wire14 ? wire12 : wire0)))));
  always
    @(posedge clk) begin
      reg16 <= $unsigned((~^(^~$signed(reg7))));
    end
  always
    @(posedge clk) begin
      reg17 <= wire1[(4'ha):(3'h7)];
      reg18 <= {$signed(wire2[(1'h0):(1'h0)])};
      reg19 <= (|wire4);
      reg20 <= (-$unsigned(($signed(wire3[(3'h4):(3'h4)]) + {$unsigned(reg6)})));
    end
  always
    @(posedge clk) begin
      if (reg6)
        begin
          reg21 <= ((8'hb0) <= $signed(wire2[(2'h3):(2'h2)]));
          if ($signed(($signed(wire15) ?
              $unsigned(((~|reg9) ^~ $unsigned(wire3))) : $unsigned((8'ha9)))))
            begin
              reg22 <= $signed(reg7);
            end
          else
            begin
              reg22 <= wire10;
              reg23 <= wire15[(1'h1):(1'h0)];
              reg24 <= wire1[(4'hd):(3'h5)];
              reg25 <= reg23;
            end
        end
      else
        begin
          if ((~(reg6 ?
              reg21[(1'h0):(1'h0)] : ($signed({(8'hbf)}) ?
                  $unsigned(reg23) : {wire1[(3'h5):(2'h3)],
                      wire13[(3'h4):(2'h2)]}))))
            begin
              reg21 <= $unsigned((&(((~&(8'hb8)) ?
                  {reg7} : (|wire13)) + $signed(wire2))));
              reg22 <= (8'hb2);
              reg23 <= $signed($unsigned($unsigned(((wire14 ? reg6 : wire0) ?
                  wire10[(3'h6):(1'h1)] : $unsigned(reg19)))));
              reg24 <= (-(reg19 != reg19));
              reg25 <= $signed((~^reg9[(4'he):(3'h5)]));
            end
          else
            begin
              reg21 <= (^reg24);
              reg22 <= ((((reg19 ? $unsigned(reg23) : $unsigned(wire12)) ?
                  ((reg18 & reg24) << $signed(wire4)) : $signed(((8'haf) & (8'hb0)))) >>> $signed(reg23[(4'h9):(3'h4)])) | $unsigned((+$unsigned((wire14 ?
                  wire0 : reg23)))));
              reg23 <= ($signed(((^~(reg18 * wire15)) ?
                  (8'ha6) : ($unsigned(reg9) & wire12))) & (&((~$signed(reg23)) ~^ reg19)));
              reg24 <= ((&wire2[(1'h1):(1'h1)]) >> (wire11[(2'h2):(2'h2)] ?
                  {((|reg24) ?
                          reg21[(1'h0):(1'h0)] : reg25[(4'hb):(1'h0)])} : (reg8 ?
                      {$unsigned((8'ha5)), wire15} : $unsigned(reg20))));
              reg25 <= ((~wire10[(4'he):(2'h3)]) ^~ (8'ha9));
            end
          if ({$signed(reg21)})
            begin
              reg26 <= $unsigned(wire14[(1'h0):(1'h0)]);
              reg27 <= (reg9[(4'hb):(4'h8)] < wire11[(3'h4):(2'h2)]);
              reg28 <= wire4;
            end
          else
            begin
              reg26 <= $signed(wire11[(2'h2):(2'h2)]);
              reg27 <= (((wire11[(1'h0):(1'h0)] >> reg18) ^ (~^reg6)) >> reg28[(3'h7):(3'h6)]);
              reg28 <= $signed($unsigned($unsigned(reg8)));
            end
          reg29 <= (wire0 ?
              (reg9[(1'h0):(1'h0)] ?
                  ($unsigned($signed(wire11)) == (^(wire4 ?
                      wire1 : reg21))) : $signed((wire15 << (wire11 ?
                      (7'h44) : wire5)))) : ({($signed(reg27) || (reg21 ?
                      reg21 : wire15)),
                  wire1[(4'ha):(4'ha)]} >>> ({$signed(reg25),
                  (wire4 ? reg18 : (8'haf))} >= ((wire10 ?
                  reg17 : wire2) >>> reg28))));
          reg30 <= (wire12 ? reg7 : $unsigned($signed(reg9)));
        end
      reg31 <= ($signed({(~|(wire14 ? (8'hbb) : reg30)),
              ($unsigned(reg6) ? reg9[(1'h0):(1'h0)] : reg28[(4'h9):(2'h2)])}) ?
          (~{wire2[(2'h3):(2'h2)],
              $unsigned((reg25 ? wire3 : wire4))}) : {reg18[(2'h2):(1'h1)]});
      reg32 <= $unsigned($unsigned((wire13 < {(~&reg25), $unsigned(reg26)})));
      reg33 <= reg29;
      reg34 <= ($unsigned($unsigned(reg33)) < ($signed(wire12) <= $signed(reg22)));
    end
  assign wire35 = (!((~^$signed(wire5[(3'h5):(2'h3)])) | $unsigned(reg16[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg36 <= $signed($unsigned(reg8[(3'h4):(1'h1)]));
      reg37 <= {((reg24 + reg28) * $unsigned(wire13[(2'h2):(2'h2)]))};
    end
  assign wire38 = reg24[(4'hc):(4'h8)];
  assign wire39 = (&reg34);
  assign wire40 = wire14;
  assign wire41 = ($signed((+reg34)) >>> {reg36[(1'h1):(1'h0)],
                      ((wire15 == $unsigned(reg36)) ?
                          $signed((wire0 + wire13)) : $signed((reg9 & wire38)))});
  assign wire42 = $signed(wire0[(1'h1):(1'h1)]);
  assign wire43 = ((wire3[(5'h10):(4'h9)] >>> $unsigned(wire1[(4'hb):(3'h7)])) ?
                      (8'hb7) : ((((|wire39) > (&reg34)) >> (((8'hb0) - reg9) + $unsigned(wire5))) ?
                          $signed(wire4) : wire0[(1'h1):(1'h1)]));
  assign wire44 = reg19[(3'h5):(2'h2)];
  assign wire45 = {{(((wire10 * wire41) <<< wire14[(1'h0):(1'h0)]) == reg29),
                          $signed(reg25)},
                      ($signed((^reg31)) ?
                          ((~&$signed(reg30)) ?
                              $unsigned($signed(wire4)) : $signed(wire14[(2'h2):(1'h0)])) : (~|$signed(reg17)))};
  assign wire46 = ((^(8'hb8)) >= reg24);
  assign wire47 = $unsigned((~^($signed({reg18}) != (|(+wire11)))));
endmodule
