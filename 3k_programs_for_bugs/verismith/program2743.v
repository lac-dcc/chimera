module top
#(parameter param58 = ((&((((8'ha4) ? (8'hae) : (8'ha2)) != {(8'hb3), (8'hb1)}) ? (7'h44) : (((8'hbf) ? (8'hb6) : (7'h40)) ^~ ((7'h40) ? (8'h9e) : (8'hb8))))) > (~&((8'h9f) ? (~^((8'hb8) ? (8'ha3) : (8'ha1))) : (((7'h41) ? (7'h42) : (8'hbe)) || (^~(7'h42)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire53;
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire53,
                 (1'h0)};
  assign wire5 = ($signed($signed(wire4[(3'h7):(3'h6)])) ?
                     wire1 : $signed((wire0 ~^ wire2)));
  assign wire6 = wire3[(1'h1):(1'h1)];
  assign wire7 = wire1;
  assign wire8 = $unsigned(wire6);
  assign wire9 = wire0[(3'h6):(2'h2)];
  assign wire10 = $unsigned((|{((wire6 >= (8'hbe)) * wire5[(4'he):(2'h3)])}));
  assign wire11 = wire7[(2'h2):(2'h2)];
  assign wire12 = $unsigned($signed((!((wire1 ^ wire9) != $signed(wire6)))));
  assign wire13 = wire4[(3'h5):(1'h0)];
  assign wire14 = ($signed((wire12[(3'h5):(1'h0)] ?
                          wire8 : $signed($signed(wire3)))) ?
                      {{($signed(wire3) - (~^wire10))},
                          $signed(wire9)} : (+(((+wire4) >> ((8'ha3) >>> wire4)) ?
                          {$unsigned(wire10),
                              (wire3 << wire10)} : $unsigned((wire11 ?
                              wire1 : wire0)))));
  module15 #() modinst54 (wire53, clk, wire3, wire7, wire13, wire1, wire4);
  assign wire55 = {$signed(wire8[(4'h9):(4'h8)]), wire5[(2'h2):(2'h2)]};
  assign wire56 = (((-wire3[(2'h2):(2'h2)]) ?
                      (~^wire4) : wire2[(3'h5):(2'h3)]) << wire53);
  assign wire57 = (((wire6[(3'h7):(3'h4)] * $signed((8'haa))) | {(wire4[(3'h6):(3'h4)] && (wire5 >= wire13))}) <= wire53[(3'h4):(1'h1)]);
endmodule

module module15
#(parameter param51 = ((({((8'h9f) ? (8'hb3) : (8'haa))} & (|(^~(8'ha8)))) * {(((8'hac) ? (8'hb5) : (8'hbf)) > ((8'hb1) ? (8'ha4) : (8'hb5))), {(~^(8'h9d))}}) ? (~|{((~(7'h41)) ? (8'hb9) : (8'ha2))}) : ((~&(((7'h40) <<< (7'h43)) ? ((8'hb4) == (8'hb0)) : ((8'h9d) ? (7'h41) : (8'hb7)))) ? (^{(~|(7'h41))}) : ((~{(8'haa)}) * {{(8'hbf)}, ((8'hbf) ? (8'ha9) : (8'hbb))}))), 
parameter param52 = ((~((&{param51}) ? param51 : param51)) ? ({param51} && param51) : (!(({param51, param51} ? (param51 | param51) : param51) ? param51 : (((8'had) <= param51) ? (param51 >> param51) : (param51 >>> (8'ha8)))))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire signed [(3'h7):(1'h0)] wire18;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire [(3'h6):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire23,
                 wire22,
                 reg48,
                 reg47,
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
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= $unsigned($signed(wire19[(4'h8):(3'h5)]));
    end
  assign wire22 = $signed(wire18);
  assign wire23 = $unsigned($unsigned((^(&(wire20 ? wire19 : wire19)))));
  always
    @(posedge clk) begin
      reg24 <= wire17;
      if ($signed($signed(($signed((wire17 ? wire20 : (8'ha9))) ?
          ((wire23 >>> wire23) > (-wire17)) : (+wire23[(3'h4):(2'h2)])))))
        begin
          reg25 <= $unsigned((|(($signed((7'h40)) ?
                  (wire20 ^ (8'ha6)) : (wire18 ? (8'h9c) : wire20)) ?
              (!reg21) : $signed((reg24 ^ reg21)))));
        end
      else
        begin
          reg25 <= (wire20 ?
              {$signed((^~(!wire20))),
                  $unsigned($unsigned((wire18 ?
                      wire16 : reg24)))} : (~&($unsigned(wire16) > $unsigned((wire22 || wire22)))));
          if ((8'hbd))
            begin
              reg26 <= ((~&(wire22 <<< $unsigned({wire17}))) >= (~(~|$signed((wire23 ^~ reg21)))));
              reg27 <= reg25;
            end
          else
            begin
              reg26 <= {(($unsigned((^wire23)) || reg26[(2'h2):(1'h0)]) ?
                      $unsigned(wire17) : wire18)};
              reg27 <= ($unsigned($unsigned((!wire18[(2'h3):(2'h2)]))) != $signed(($unsigned(reg27) << reg27)));
              reg28 <= $signed($unsigned((wire20 ~^ reg24)));
              reg29 <= (reg28[(2'h2):(1'h1)] ?
                  (&(-{$signed((8'hb4)), reg26})) : wire18[(1'h1):(1'h0)]);
            end
          reg30 <= $signed(wire23);
          reg31 <= (reg24 && $signed($signed($unsigned($unsigned(reg24)))));
        end
      if ($unsigned($unsigned((^($unsigned(wire16) ?
          (reg26 ? wire20 : wire22) : $unsigned(reg21))))))
        begin
          reg32 <= (reg24[(1'h1):(1'h0)] << ($signed(reg29) ?
              (~^(8'hbb)) : $signed(((reg29 == wire18) ?
                  (wire16 ? wire16 : wire17) : reg29[(2'h2):(2'h2)]))));
          reg33 <= $unsigned(reg28[(2'h3):(1'h0)]);
          reg34 <= reg25;
          if ($signed(wire16))
            begin
              reg35 <= reg21[(2'h3):(1'h0)];
              reg36 <= reg35[(1'h1):(1'h0)];
              reg37 <= ((&($unsigned((reg32 ? reg34 : reg27)) ?
                  (8'haa) : $signed($signed(reg29)))) * (8'hb5));
              reg38 <= ((($unsigned(reg32) < $signed(((8'hbc) != (8'ha1)))) ^ (&wire18[(3'h6):(1'h0)])) + (&$unsigned($unsigned((-reg37)))));
            end
          else
            begin
              reg35 <= {reg36, reg26[(4'h8):(2'h2)]};
              reg36 <= $unsigned($unsigned({$unsigned((~|wire19))}));
              reg37 <= (^~$signed($signed(($unsigned(reg31) ?
                  $unsigned((8'hb5)) : (8'hbd)))));
            end
          reg39 <= (!(!$signed({(wire23 ^ reg29)})));
        end
      else
        begin
          if ((^(~|((reg21[(4'hc):(4'h8)] ?
              (reg32 >= reg37) : (reg24 * wire22)) ~^ $unsigned((wire17 - reg29))))))
            begin
              reg32 <= ($unsigned($unsigned($unsigned($signed((8'hb4))))) ?
                  reg21[(3'h5):(2'h2)] : reg34[(1'h1):(1'h1)]);
              reg33 <= reg25;
              reg34 <= $unsigned((((&$signed((8'hbb))) ?
                      reg32 : ((^(8'hb5)) << ((7'h43) - wire22))) ?
                  $unsigned($signed($unsigned(wire17))) : {((~^reg36) == $signed(reg35)),
                      {reg36, ((8'ha1) > (8'hb8))}}));
            end
          else
            begin
              reg32 <= (~^(+(^$unsigned($signed((8'ha9))))));
              reg33 <= {(-(&((&reg34) ? reg21[(1'h0):(1'h0)] : reg21))),
                  (((wire17 ? (~|reg24) : {reg34}) + reg38[(1'h0):(1'h0)]) ?
                      $unsigned($unsigned(wire20[(1'h1):(1'h0)])) : {reg33,
                          reg29[(2'h2):(1'h1)]})};
              reg34 <= $signed($signed(reg31[(3'h5):(2'h2)]));
              reg35 <= reg28[(2'h3):(2'h3)];
            end
          reg36 <= (reg25[(3'h6):(3'h4)] ?
              ($signed(({(8'ha0)} << ((8'hab) ? reg25 : reg35))) ?
                  reg36[(2'h2):(2'h2)] : ((&reg25[(4'h8):(1'h0)]) ?
                      ($unsigned(reg28) ^~ $unsigned(reg27)) : reg33[(2'h2):(1'h1)])) : {reg26});
          reg37 <= {(|reg28[(4'ha):(4'ha)]), $signed(wire20)};
          reg38 <= wire22[(1'h1):(1'h1)];
        end
      reg40 <= (8'hb9);
    end
  assign wire41 = (8'hbf);
  assign wire42 = $signed((+$unsigned((^(~|reg34)))));
  assign wire43 = reg40[(1'h1):(1'h0)];
  assign wire44 = reg33;
  assign wire45 = (^$signed({$signed((wire17 ? wire16 : reg40))}));
  assign wire46 = $unsigned($unsigned(reg30));
  always
    @(posedge clk) begin
      reg47 <= {reg35[(3'h5):(3'h4)], $signed({reg37[(3'h5):(1'h1)]})};
      reg48 <= reg40;
    end
  assign wire49 = (($signed($signed((wire19 == wire42))) > ($signed($signed(wire20)) ?
                          {reg34} : $unsigned((reg29 && wire23)))) ?
                      wire44[(2'h3):(2'h3)] : $unsigned((((reg36 ?
                                  reg35 : reg33) ?
                              {reg31, reg29} : {wire19}) ?
                          (-((8'hbb) * wire45)) : $signed($unsigned(reg28)))));
  assign wire50 = reg38[(4'h8):(3'h4)];
endmodule
