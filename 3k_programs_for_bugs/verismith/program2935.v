module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire16,
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
                 (1'h0)};
  assign wire5 = {wire4, wire1};
  assign wire6 = (^((((wire1 ? wire1 : wire4) > ((8'ha2) ?
                     wire3 : wire1)) ^ $unsigned(wire1[(1'h0):(1'h0)])) + (wire1 ?
                     (7'h40) : {$signed(wire1), $signed(wire5)})));
  assign wire7 = $unsigned({wire6[(1'h1):(1'h1)], (^wire4)});
  assign wire8 = $signed($unsigned(wire3));
  assign wire9 = wire6[(2'h2):(1'h0)];
  assign wire10 = $unsigned($unsigned($unsigned(wire1[(1'h1):(1'h1)])));
  assign wire11 = {((((~|wire5) ?
                              wire4[(3'h7):(2'h2)] : (~|(7'h41))) < {(wire5 | (8'hae))}) ?
                          ((wire7 ? (wire1 + wire4) : (wire0 + wire9)) ?
                              (~^wire9[(4'h8):(1'h1)]) : wire5[(1'h1):(1'h1)]) : wire0[(1'h0):(1'h0)]),
                      wire2};
  assign wire12 = $unsigned($unsigned(wire5));
  assign wire13 = (~&wire5);
  assign wire14 = (wire12 ^ (~^(wire0 > (~(^~(8'hb5))))));
  assign wire15 = $signed($unsigned($signed($unsigned($signed(wire14)))));
  assign wire16 = $unsigned((!wire15[(3'h4):(1'h1)]));
  module17 #() modinst65 (wire64, clk, wire13, wire15, wire4, wire2);
  assign wire66 = (wire64[(4'h9):(1'h0)] ? wire8[(3'h4):(2'h3)] : wire4);
  assign wire67 = wire8[(3'h6):(2'h3)];
  assign wire68 = wire3[(2'h2):(1'h0)];
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire49;
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 (1'h0)};
  module22 #() modinst50 (wire49, clk, wire20, wire18, wire19, wire21);
  assign wire51 = $unsigned(wire21);
  assign wire52 = wire49;
  assign wire53 = $unsigned(((((~&wire52) ?
                      wire52 : (wire52 ?
                          wire21 : wire19)) && $unsigned(wire49)) | wire20[(1'h0):(1'h0)]));
  assign wire54 = ((8'ha3) & wire51);
  assign wire55 = wire20;
  assign wire56 = (($unsigned({$unsigned(wire19)}) || $signed(($signed(wire19) >>> (wire51 ?
                          wire55 : wire20)))) ?
                      wire18[(3'h4):(1'h0)] : (wire21 ?
                          $signed(wire55) : $signed((~&(wire53 ^~ wire49)))));
  assign wire57 = (^~$signed((^$unsigned(wire21[(2'h2):(2'h2)]))));
  assign wire58 = wire51[(1'h0):(1'h0)];
  assign wire59 = (($unsigned({$signed(wire57),
                      (wire49 ^ (8'hb3))}) && $unsigned($signed($signed(wire18)))) >>> wire49[(1'h1):(1'h1)]);
  assign wire60 = wire55;
  assign wire61 = (~^(~^{(8'haa), {(wire52 ? wire54 : wire54)}}));
  assign wire62 = (wire57[(2'h2):(2'h2)] ?
                      (8'hb5) : $unsigned(wire54[(1'h1):(1'h0)]));
  assign wire63 = $unsigned((wire59 - (~|wire53)));
endmodule

module module22
#(parameter param47 = (({(~|(^~(8'hb7))), (8'ha2)} != ((-(^~(8'hb9))) - (^~((8'hb1) ? (8'haa) : (7'h42))))) ? ((~&(((8'hb7) ^~ (8'hb1)) ? (~&(8'hbb)) : ((8'ha5) ? (8'ha8) : (8'h9f)))) ? (~&{{(8'h9f), (8'hb6)}}) : (-(((8'h9e) ^~ (8'ha6)) ? ((8'hb3) ? (8'hbe) : (7'h40)) : (8'hb9)))) : ((-((~^(8'ha3)) ~^ {(8'ha4), (8'ha9)})) - ((8'hb9) ? ((-(8'ha0)) ? (^(8'h9c)) : (~^(8'hae))) : {((8'ha2) >>> (8'hac)), {(8'h9e), (8'hbf)}}))), 
parameter param48 = (param47 * ({((|param47) ? (^param47) : (^param47)), ((|param47) << param47)} >>> param47)))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(2'h2):(1'h0)] wire25;
  input wire [(3'h6):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire31,
                 wire28,
                 wire27,
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
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire27 = {((wire23 ?
                              (wire25 ?
                                  wire23[(4'h9):(3'h6)] : (wire25 ^~ wire26)) : ((wire25 >>> wire25) ?
                                  wire24 : (|(8'hba)))) ?
                          (((!wire23) ?
                              (wire26 + wire23) : (wire26 ~^ wire24)) | wire23) : $unsigned(wire26)),
                      (((8'hbb) >= wire23[(1'h0):(1'h0)]) >> {$unsigned((wire23 >> wire23))})};
  assign wire28 = (($unsigned(wire23) <= (+$unsigned(wire25))) < (^($signed($signed(wire24)) ?
                      ($signed(wire23) ?
                          $signed(wire25) : $signed(wire25)) : ($unsigned(wire27) <= (^~(8'ha3))))));
  always
    @(posedge clk) begin
      reg29 <= wire27;
      reg30 <= $unsigned($unsigned(($signed(reg29) * ($unsigned(wire24) << wire28[(2'h3):(2'h3)]))));
    end
  assign wire31 = (~^(reg30[(3'h6):(1'h1)] ?
                      reg30 : ($signed((reg29 < (7'h40))) ?
                          $unsigned(wire28[(2'h2):(1'h0)]) : {((8'hb1) ?
                                  wire27 : wire27),
                              wire26})));
  always
    @(posedge clk) begin
      reg32 <= wire27;
      if ((wire24[(1'h0):(1'h0)] ?
          (wire31[(1'h0):(1'h0)] | (^~(~|(^~wire23)))) : $signed((((~|reg30) ?
              (wire24 ? wire27 : (8'ha8)) : $unsigned(wire24)) | {(reg30 ?
                  wire25 : reg32)}))))
        begin
          if ((((^(!((8'haa) ? wire26 : (8'ha7)))) ?
              wire27[(4'hd):(3'h5)] : {wire31[(2'h2):(1'h1)],
                  (8'ha5)}) == (|{($unsigned((8'ha4)) ?
                  wire28[(3'h4):(2'h3)] : reg30[(5'h10):(4'hb)])})))
            begin
              reg33 <= (^~wire27);
              reg34 <= $unsigned((^~(~|(!((8'h9c) ? (8'hbe) : wire24)))));
              reg35 <= wire27;
              reg36 <= ($unsigned(((&(8'h9c)) ?
                  ($signed(reg30) <= $signed(reg34)) : $unsigned(reg32[(3'h4):(1'h0)]))) > $unsigned($signed(wire26)));
              reg37 <= $signed(reg33);
            end
          else
            begin
              reg33 <= (wire24[(2'h3):(2'h2)] ?
                  $signed($unsigned(($unsigned(reg30) ^ reg29[(1'h1):(1'h1)]))) : ($unsigned(reg32) ?
                      $signed((8'hb0)) : (reg34[(2'h3):(2'h3)] ?
                          $unsigned($unsigned(wire25)) : ($unsigned(reg36) ?
                              reg37 : {wire25}))));
              reg34 <= (~($unsigned((8'ha0)) ^ wire26));
              reg35 <= (reg35[(4'h9):(1'h1)] & ((($unsigned(reg30) < reg34) || (reg34[(4'he):(4'hb)] ?
                  reg33[(2'h2):(1'h0)] : $unsigned(reg36))) >> wire26));
            end
          reg38 <= {{(8'hba)}};
          reg39 <= $signed(((~^(~^{(8'hbc)})) ?
              $signed(($unsigned(reg34) << reg34[(2'h3):(1'h0)])) : $signed(($signed(wire28) ^~ reg34[(4'hb):(4'h8)]))));
          reg40 <= {reg30};
          reg41 <= ((|$signed($unsigned(reg39))) ?
              {{$unsigned($unsigned(wire25))}, wire24[(3'h4):(3'h4)]} : reg39);
        end
      else
        begin
          reg33 <= (($signed(($signed(reg29) ?
                  {reg39, (8'h9c)} : (reg37 ?
                      (8'hb6) : reg29))) - reg37[(4'hf):(1'h1)]) ?
              wire25 : (($unsigned((~wire23)) ?
                      (reg29[(1'h1):(1'h1)] & $unsigned((8'hab))) : ((reg37 < reg34) ?
                          (8'hbe) : (~|reg41))) ?
                  {reg32[(3'h4):(1'h1)], reg40[(3'h4):(3'h4)]} : (((wire26 ?
                              reg41 : reg29) ?
                          (wire26 - (7'h44)) : {(8'hb3), wire23}) ?
                      wire26 : {(wire31 && reg33)})));
          reg34 <= $signed(($signed($signed((~|reg41))) ?
              (~|$signed((~reg32))) : $unsigned(reg38)));
          reg35 <= $unsigned((-((((8'ha2) ?
              (8'ha4) : wire26) + reg30[(3'h7):(3'h6)]) | (~^reg35))));
          reg36 <= (reg40 <<< ($unsigned(((reg40 <<< reg41) ?
              reg36[(3'h6):(3'h5)] : reg32[(2'h3):(1'h0)])) || wire25[(1'h1):(1'h0)]));
        end
      if ((^reg29))
        begin
          reg42 <= reg37[(1'h0):(1'h0)];
          reg43 <= $unsigned($unsigned((~reg42[(4'he):(3'h5)])));
          reg44 <= $signed(({{reg34},
                  ($signed(reg35) ? {reg34} : $unsigned(reg30))} ?
              ($unsigned({reg36, (8'ha3)}) <= ($unsigned((8'h9f)) ?
                  $signed(wire28) : (reg29 ? wire31 : reg40))) : (wire23 ?
                  (wire23 <<< $unsigned(reg34)) : ($signed(reg42) | (|wire28)))));
        end
      else
        begin
          reg42 <= (reg44[(1'h1):(1'h0)] ?
              {(~(~|(wire28 != (8'hbb))))} : (((!(|wire31)) ?
                      {reg32[(3'h4):(2'h3)],
                          (~&reg32)} : reg42[(3'h6):(2'h2)]) ?
                  $signed(((-reg30) != $signed(reg42))) : {{reg30,
                          ((8'h9d) ? wire23 : wire25)}}));
          reg43 <= (($unsigned((-$unsigned(wire23))) ?
              {reg39[(1'h0):(1'h0)]} : reg40[(3'h7):(2'h3)]) != reg42);
        end
    end
  assign wire45 = $signed((8'ha2));
  assign wire46 = $signed((~^$signed(wire24)));
endmodule
