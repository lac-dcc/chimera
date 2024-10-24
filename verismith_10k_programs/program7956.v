module top
#(parameter param78 = ((8'hb5) ? ({(|((7'h43) ^~ (7'h41)))} ? ((((8'had) != (8'hb0)) ? ((8'ha2) >> (8'ha6)) : {(8'h9c)}) && {((8'h9d) ? (8'ha8) : (8'h9e)), ((8'hbb) ? (8'hbe) : (8'hb1))}) : (!((8'ha1) << ((7'h44) < (8'hbd))))) : (({(^(8'hbd)), ((8'ha3) != (8'hae))} ? (8'ha3) : (-{(8'ha6), (8'h9d)})) ? ((((8'haf) ? (7'h43) : (8'hb2)) ^~ ((7'h40) ? (8'ha6) : (8'hae))) - ((8'haa) <= ((8'h9c) ? (8'ha6) : (8'hbf)))) : ({((8'hbf) ? (8'ha5) : (8'hac)), ((8'ha8) ? (8'hae) : (8'hb6))} ? (((7'h43) ? (8'hb5) : (8'hba)) >= ((8'hbb) < (8'h9d))) : ((|(8'ha1)) ? {(7'h43), (8'hab)} : (~^(8'hba)))))), 
parameter param79 = (8'ha1))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire56;
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire70,
                 wire4,
                 wire5,
                 wire56,
                 reg73,
                 reg72,
                 reg71,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire4 = ($unsigned(wire3[(2'h2):(1'h0)]) ?
                     wire0 : ((~(wire2[(1'h1):(1'h0)] >> (!wire2))) & $unsigned(wire2[(3'h5):(2'h2)])));
  assign wire5 = (+$unsigned($signed((((7'h44) ?
                     (8'ha4) : wire0) <= wire2[(4'hc):(3'h5)]))));
  module6 #() modinst57 (.y(wire56), .clk(clk), .wire10(wire1), .wire11(wire4), .wire9(wire2), .wire7(wire3), .wire8(wire5));
  always
    @(posedge clk) begin
      reg58 <= wire4[(4'hf):(4'he)];
      reg59 <= ((8'hba) >>> $signed($unsigned(wire2)));
      if (wire2)
        begin
          reg60 <= $unsigned(((wire2[(3'h4):(2'h2)] * wire4) ?
              (($unsigned(wire3) * (!(8'ha3))) + {(~^wire2)}) : $unsigned(($unsigned(wire3) ?
                  (~|reg58) : (wire3 ? wire4 : wire1)))));
          if ((wire0[(3'h4):(1'h1)] ?
              $unsigned({$signed($signed(wire1)),
                  (&$signed(wire0))}) : {$unsigned((reg59 ?
                      (|wire0) : (8'ha1)))}))
            begin
              reg61 <= reg58;
              reg62 <= {reg60, reg59[(3'h4):(1'h0)]};
              reg63 <= wire4[(3'h5):(1'h0)];
              reg64 <= $unsigned(reg62);
              reg65 <= wire3;
            end
          else
            begin
              reg61 <= (~|$unsigned($signed(reg58)));
              reg62 <= (~&$signed($unsigned(($signed(reg62) ?
                  (^reg62) : ((8'hba) ? (8'hbd) : wire56)))));
              reg63 <= reg65[(1'h1):(1'h1)];
            end
          reg66 <= ((-((reg65 ?
                  {wire0,
                      reg64} : $unsigned(wire56)) - $unsigned($unsigned(wire0)))) ?
              (|(+wire1[(3'h7):(3'h5)])) : $signed($unsigned($signed({wire4}))));
        end
      else
        begin
          reg60 <= $unsigned({$signed((~|reg61))});
          reg61 <= reg64[(2'h3):(2'h2)];
          reg62 <= (-(&({wire5[(3'h5):(1'h1)]} + (~wire1))));
          reg63 <= (wire5 - reg66[(5'h11):(3'h7)]);
          reg64 <= wire56[(3'h5):(1'h1)];
        end
      reg67 <= wire1[(5'h14):(3'h5)];
      reg68 <= $unsigned(reg65);
    end
  always
    @(posedge clk) begin
      reg69 <= reg58[(1'h1):(1'h1)];
    end
  assign wire70 = (reg58 ?
                      {({reg63[(4'ha):(4'h8)], reg65[(2'h3):(1'h0)]} ?
                              $unsigned((reg62 ?
                                  (8'h9e) : reg61)) : wire2)} : reg63[(4'h9):(4'h8)]);
  always
    @(posedge clk) begin
      reg71 <= $unsigned(wire4[(1'h0):(1'h0)]);
      reg72 <= reg59;
      reg73 <= wire3;
    end
  assign wire74 = $signed((~^((&reg68[(2'h3):(1'h0)]) >>> ((^reg67) == wire5[(3'h5):(1'h1)]))));
  assign wire75 = (($unsigned({wire56}) ?
                      ({$unsigned(wire2), $unsigned(reg73)} ?
                          $unsigned((~&reg61)) : $signed(wire4[(5'h10):(4'hc)])) : reg65[(2'h2):(1'h0)]) ^ ((wire2[(1'h1):(1'h0)] ?
                          $unsigned($unsigned((7'h40))) : $unsigned((wire56 ?
                              reg69 : reg66))) ?
                      ({(wire2 ? (8'h9e) : (8'ha1))} >> {(reg61 && reg69),
                          (reg58 || (7'h42))}) : (8'hbb)));
  assign wire76 = reg66;
  assign wire77 = $signed((-wire74[(4'h8):(3'h4)]));
endmodule

module module6
#(parameter param55 = (~(((8'hae) ^ ({(8'hab), (8'hb4)} ? (~(8'hb5)) : ((8'h9d) <<< (8'hab)))) ? (~((-(8'hb6)) > (!(8'hbd)))) : ((+((8'hba) ^ (8'ha1))) ? (((8'ha3) ? (8'hb4) : (8'hbd)) < {(8'hb0), (8'hb5)}) : (((8'hb6) < (8'hb0)) | ((8'h9f) * (8'hbe)))))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 (1'h0)};
  assign wire12 = (~^((wire8 <<< (wire10[(2'h2):(1'h1)] ?
                      (8'ha4) : (wire9 & wire7))) + wire7[(3'h4):(2'h3)]));
  assign wire13 = ((8'h9f) ?
                      wire11[(5'h12):(1'h0)] : (~^$signed($unsigned({wire11}))));
  assign wire14 = (wire11[(2'h3):(1'h0)] - $unsigned((~&(^~$unsigned(wire7)))));
  assign wire15 = wire12;
  module16 #() modinst50 (wire49, clk, wire13, wire7, wire12, wire9);
  assign wire51 = $unsigned(wire49);
  assign wire52 = $signed(({(wire8 ? ((8'hb0) ? (7'h42) : wire7) : {(8'hb1)}),
                          wire11[(3'h5):(3'h4)]} ?
                      $unsigned((((8'h9f) ? wire9 : wire11) ?
                          (wire13 >= wire15) : (wire15 == wire9))) : $signed({(wire9 ?
                              (8'ha0) : wire8)})));
  assign wire53 = (+wire10);
  assign wire54 = (+{$signed($unsigned(((8'hb4) <= wire7))),
                      ((+$signed(wire8)) ?
                          ($unsigned(wire51) >= (wire8 * wire8)) : ((wire51 ?
                              wire49 : wire15) << (&wire52)))});
endmodule

module module16
#(parameter param47 = ((~(~^((!(7'h42)) + (8'hb4)))) | (&{(((8'hbf) != (8'hb8)) < (!(8'h9f)))})), 
parameter param48 = (((((~param47) ^~ (param47 ? param47 : param47)) ? param47 : ((7'h43) || (param47 ? param47 : param47))) ? (-((param47 ? param47 : param47) ? (param47 ? param47 : (8'h9d)) : ((7'h44) >> (8'hae)))) : ((8'haf) & ((param47 << param47) ? (~|param47) : {param47, param47}))) ? {(8'h9c)} : ((^~param47) ? ((^~{(8'h9f)}) >= (8'hb8)) : {param47})))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire21 = {wire19};
  assign wire22 = ($signed(wire21[(3'h6):(2'h2)]) ?
                      (7'h40) : $unsigned(wire18[(1'h0):(1'h0)]));
  assign wire23 = $unsigned($signed($unsigned((&(wire21 ? wire21 : wire19)))));
  assign wire24 = ({(((+wire20) - ((8'ha0) <= wire18)) ^~ (wire23[(3'h7):(2'h2)] ?
                          wire19 : wire22))} - $signed($signed((wire19 ?
                      wire19 : $unsigned((8'hb4))))));
  assign wire25 = (($unsigned($signed({wire18})) ?
                          $unsigned(wire21) : (^~$signed(wire20[(3'h6):(2'h3)]))) ?
                      wire23[(4'h9):(3'h6)] : $signed({wire24[(1'h0):(1'h0)],
                          $unsigned((wire19 != (8'hb0)))}));
  assign wire26 = wire23[(4'ha):(3'h4)];
  assign wire27 = {$unsigned($signed($unsigned(wire21[(1'h1):(1'h1)])))};
  assign wire28 = (wire19[(4'he):(3'h7)] != (^~{$unsigned({wire21}),
                      ($signed(wire18) >= $signed(wire20))}));
  always
    @(posedge clk) begin
      reg29 <= $signed($signed($unsigned(wire20[(5'h10):(3'h4)])));
      reg30 <= $signed((wire24 ? wire24 : $signed(wire28[(4'hb):(3'h7)])));
    end
  always
    @(posedge clk) begin
      reg31 <= $signed((wire19 ?
          (($signed(wire21) >> (^reg29)) ?
              wire18 : wire26) : (^($unsigned(wire23) || $signed(reg29)))));
      if ({wire20[(4'he):(2'h3)]})
        begin
          reg32 <= (($unsigned((&((7'h43) ? wire26 : reg30))) ?
                  $signed($signed($unsigned(wire20))) : {{(wire27 ?
                              wire25 : wire21)},
                      wire28}) ?
              {(8'hae),
                  (wire27[(3'h7):(2'h2)] * $unsigned((8'ha7)))} : $unsigned({wire26[(3'h7):(3'h5)],
                  ((~&wire23) ? (wire22 + wire17) : reg30)}));
        end
      else
        begin
          reg32 <= $unsigned((|$signed((wire23 >> $unsigned((8'hb0))))));
          reg33 <= (^wire24[(3'h7):(2'h3)]);
          reg34 <= wire18;
          reg35 <= wire26[(3'h4):(3'h4)];
        end
      reg36 <= (~^{$unsigned(wire28)});
      reg37 <= (+((wire24[(3'h6):(2'h2)] ?
          $unsigned($signed(wire26)) : $unsigned((-wire19))) >>> {wire18}));
    end
  assign wire38 = $unsigned($unsigned(($signed(wire25[(3'h4):(2'h3)]) & (^~(reg31 * (8'ha6))))));
  assign wire39 = ((&$unsigned($signed(wire25))) + {(((wire18 < wire19) ?
                          (|wire28) : (^~wire28)) != $signed(reg31)),
                      ((reg35[(5'h14):(3'h6)] ?
                              (7'h43) : (reg31 ? reg36 : wire19)) ?
                          {(wire38 ^~ wire23),
                              wire21[(4'hd):(4'hc)]} : ({wire22,
                              wire17} > (&wire17)))});
  assign wire40 = ((reg37 ? wire17 : reg30[(1'h0):(1'h0)]) ?
                      $signed($signed($signed($unsigned(reg30)))) : reg35);
  assign wire41 = ($signed($unsigned(wire17[(1'h0):(1'h0)])) != $signed((($signed(wire17) << wire22) * $unsigned(reg31))));
  assign wire42 = $unsigned(wire23);
  assign wire43 = (8'hbe);
  assign wire44 = ($unsigned(wire28) || ($unsigned(reg36[(5'h13):(2'h2)]) ?
                      (&(!$unsigned(reg37))) : (8'ha6)));
  assign wire45 = (wire40[(3'h5):(2'h2)] ?
                      $unsigned((-({wire24,
                          wire40} > wire24[(1'h0):(1'h0)]))) : wire27);
  assign wire46 = {(|wire38),
                      {reg30[(1'h0):(1'h0)],
                          ($unsigned(reg34) ?
                              (-$signed(wire38)) : {(wire25 ?
                                      reg32 : wire20)})}};
endmodule
