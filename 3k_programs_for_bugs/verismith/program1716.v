module top
#(parameter param81 = ((~((|{(8'ha9), (8'hb0)}) ? ((~(8'hb2)) <<< (~|(8'ha3))) : (((8'hbe) > (8'ha0)) ? ((8'h9c) ? (8'hb2) : (8'hb3)) : (+(8'haa))))) ? ((~^{{(8'hb5), (8'haf)}}) ? (8'ha4) : {(((7'h40) ? (8'ha1) : (8'haf)) - ((7'h40) >> (8'hb2))), {((8'ha4) ? (7'h44) : (8'ha6)), ((8'hb7) ^~ (8'had))}}) : ((!(((8'ha0) != (8'h9d)) ? ((7'h44) ? (8'hb2) : (8'hb0)) : ((8'ha5) + (8'ha4)))) ? ({((8'h9f) ~^ (8'ha8))} ? (!(^~(8'hbc))) : (((8'hab) ? (8'ha9) : (8'hab)) * (^~(8'hbf)))) : {({(8'hbd), (8'ha6)} >= (+(8'hb6))), (((8'ha6) ? (8'hb0) : (8'hbd)) ? {(8'h9c), (8'hba)} : {(8'hbb), (8'hbc)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire73,
                 wire16,
                 wire15,
                 wire14,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg11,
                 reg12,
                 reg13,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  assign wire4 = $signed(wire3[(3'h6):(3'h6)]);
  assign wire5 = $signed(((~|($signed(wire4) + (wire2 == wire0))) ?
                     ($signed((~|wire4)) ?
                         $signed(wire1[(3'h4):(1'h0)]) : wire3[(3'h4):(3'h4)]) : (~|(!wire3))));
  assign wire6 = (wire4 & wire5);
  assign wire7 = wire2[(3'h4):(1'h0)];
  assign wire8 = $signed($signed($unsigned(((|(8'hb1)) | (!wire3)))));
  assign wire9 = wire6;
  assign wire10 = (wire8[(4'ha):(4'h9)] ? wire1 : wire8);
  always
    @(posedge clk) begin
      reg11 <= $signed((wire6[(3'h7):(3'h6)] - ($signed(wire5[(4'ha):(3'h5)]) * {wire7[(2'h3):(2'h3)],
          $unsigned(wire4)})));
      reg12 <= wire0[(4'hc):(3'h6)];
      reg13 <= $unsigned((^~wire6[(1'h1):(1'h0)]));
    end
  assign wire14 = (8'hb5);
  assign wire15 = {$signed((wire3 + wire9[(4'hb):(1'h0)])),
                      (|$unsigned($unsigned($unsigned(wire5))))};
  assign wire16 = wire10;
  always
    @(posedge clk) begin
      reg17 <= reg11[(1'h1):(1'h0)];
      reg18 <= $signed($signed(($unsigned((8'ha5)) ?
          (8'h9d) : $unsigned((wire3 ? wire6 : reg17)))));
      reg19 <= (^~wire15[(1'h0):(1'h0)]);
      reg20 <= (reg11[(1'h0):(1'h0)] ?
          $unsigned(({reg11[(4'h9):(2'h2)],
              (^~wire16)} * $signed($signed((8'ha3))))) : (~&(~&{reg13[(4'he):(3'h6)]})));
      if ((8'hb5))
        begin
          reg21 <= (reg20 ?
              wire3 : $unsigned(((-$unsigned(wire16)) ?
                  $unsigned((wire10 != reg20)) : reg18[(5'h13):(5'h10)])));
          reg22 <= wire3;
        end
      else
        begin
          reg21 <= reg17[(1'h1):(1'h1)];
        end
    end
  module23 #() modinst74 (.y(wire73), .wire27(wire10), .wire25(wire9), .clk(clk), .wire24(reg12), .wire28(reg13), .wire26(reg22));
  assign wire75 = (^~{wire7,
                      ((reg20 | (~|(8'ha7))) ?
                          ($signed((7'h40)) + (reg20 > wire4)) : $unsigned((8'haa)))});
  assign wire76 = (-((reg21[(1'h1):(1'h1)] ?
                      (!wire73[(1'h0):(1'h0)]) : {{wire6}}) >> wire0[(4'h9):(3'h4)]));
  assign wire77 = (~^(^(~(wire4 ^ $signed(wire76)))));
  assign wire78 = wire1[(1'h1):(1'h1)];
  assign wire79 = wire16[(4'hb):(3'h6)];
  assign wire80 = $signed($signed((~^{$signed(wire73), (~reg20)})));
endmodule

module module23  (y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'h1e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire24;
  input wire [(5'h11):(1'h0)] wire25;
  input wire [(4'ha):(1'h0)] wire26;
  input wire [(5'h11):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire68;
  assign y = {wire72, wire71, wire70, wire68, (1'h0)};
  module29 #() modinst69 (wire68, clk, wire27, wire26, wire24, wire28, wire25);
  assign wire70 = $unsigned({(wire26[(3'h6):(1'h1)] ?
                          ((wire26 ? wire28 : wire68) | (wire27 ?
                              wire24 : wire24)) : {{(8'h9d), wire68}}),
                      $signed(wire25)});
  assign wire71 = (~|$signed({(&(wire68 ? wire27 : (8'ha4))),
                      $unsigned((&wire68))}));
  assign wire72 = $signed((((&$unsigned(wire24)) | (wire27[(4'hc):(4'hc)] ?
                          (wire28 * wire25) : (wire28 & wire68))) ?
                      wire68 : wire24));
endmodule

module module29
#(parameter param66 = {((~^{{(8'hab)}, (~(8'h9f))}) >>> ((&{(8'hb0), (8'hb2)}) || ((8'haa) ? {(8'hb6)} : (+(8'hbc)))))}, 
parameter param67 = (({(-(~&param66))} && (param66 ? ((~&param66) << {param66, param66}) : {(~&param66), (param66 ? param66 : param66)})) ? param66 : param66))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire34;
  input wire signed [(3'h5):(1'h0)] wire33;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  input wire [(2'h2):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg59,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg35 <= (-((((wire31 ? wire32 : wire33) | (wire32 ? wire32 : wire31)) ?
          (((7'h43) ? (8'hb9) : wire33) ?
              wire30 : (wire31 << (8'hb7))) : $unsigned($unsigned(wire33))) ~^ wire31[(4'h9):(3'h4)]));
      if (($signed(wire34) < (8'ha7)))
        begin
          reg36 <= (~&(!wire31));
        end
      else
        begin
          reg36 <= $signed(($signed($signed($signed((8'ha0)))) ?
              ({wire33} || ((7'h43) ?
                  $unsigned((8'h9e)) : $unsigned(reg36))) : (reg35[(3'h5):(3'h4)] ?
                  (~&(~^wire31)) : reg36)));
          if ($signed(($signed($signed((!reg35))) ?
              ($signed((~&wire31)) <= $signed($signed(wire33))) : ($unsigned($unsigned(reg36)) ?
                  wire31 : {reg36[(2'h2):(1'h0)], $signed(wire34)}))))
            begin
              reg37 <= (((&{(~(8'hbf))}) || ($unsigned(wire33[(1'h1):(1'h1)]) <<< $unsigned(wire33[(2'h3):(2'h2)]))) < {((~^(reg36 ?
                      wire33 : wire30)) < $unsigned(((8'haa) ?
                      wire33 : wire32))),
                  (^((&wire31) + wire30))});
              reg38 <= ((8'ha4) >>> (wire31[(5'h14):(5'h14)] ^~ $signed(((|wire34) ?
                  (wire30 != reg36) : $unsigned(reg35)))));
            end
          else
            begin
              reg37 <= ($signed(((+(reg38 ?
                  reg37 : wire33)) || $unsigned((wire33 >= reg35)))) <<< {(((~reg38) >> reg35) ?
                      (7'h41) : (wire32[(4'hd):(4'h8)] ?
                          reg35 : $unsigned(wire34))),
                  (~|{(+(8'ha1)), (~&reg35)})});
            end
          if ({reg38})
            begin
              reg39 <= $unsigned(wire31);
              reg40 <= {({$signed((|(8'ha9))),
                      wire32[(4'ha):(3'h4)]} == ((8'hb1) << $unsigned(((8'ha7) || wire33)))),
                  ({(^$unsigned(wire30))} << {($signed(wire34) <<< $unsigned(reg39)),
                      $signed($signed((8'ha6)))})};
            end
          else
            begin
              reg39 <= wire34[(4'hd):(3'h5)];
              reg40 <= {($signed((!reg39[(4'h9):(1'h0)])) ?
                      ((~(|reg37)) ?
                          $unsigned((wire34 ~^ reg38)) : $unsigned(reg40)) : (8'ha2))};
              reg41 <= $unsigned(($signed((~(reg35 + wire33))) & reg40));
              reg42 <= $unsigned($unsigned((reg36 ?
                  reg41 : (((8'ha1) ? reg39 : reg36) && $unsigned(reg41)))));
              reg43 <= (reg42 ? (+((8'h9f) - reg40)) : wire34);
            end
          reg44 <= $signed((reg36[(4'hb):(3'h4)] ^~ $signed(reg40)));
        end
      if ((|$signed($unsigned((&reg36[(4'hc):(3'h7)])))))
        begin
          reg45 <= wire34[(1'h1):(1'h1)];
          reg46 <= reg43;
          reg47 <= reg43[(4'ha):(2'h3)];
          reg48 <= reg41[(4'h8):(3'h7)];
          reg49 <= (reg45 >>> ($signed(($unsigned(wire30) - (wire32 ?
                  wire30 : wire30))) ?
              $unsigned({(|reg44)}) : (|{$unsigned(wire30),
                  $unsigned(reg45)})));
        end
      else
        begin
          reg45 <= $signed(reg43[(4'h9):(2'h3)]);
          reg46 <= $signed($signed({$unsigned($signed(reg47))}));
          reg47 <= (&(-reg38[(2'h3):(1'h0)]));
          reg48 <= ((reg35[(3'h5):(3'h5)] - $signed($unsigned(wire34[(3'h6):(3'h5)]))) ?
              $unsigned(reg39) : (reg48[(1'h0):(1'h0)] ?
                  $unsigned(($signed(reg35) && reg46[(1'h1):(1'h1)])) : reg35));
          reg49 <= $signed(wire31[(2'h3):(1'h0)]);
        end
      reg50 <= reg36[(4'hc):(3'h7)];
    end
  assign wire51 = (~|reg42[(3'h4):(3'h4)]);
  assign wire52 = (($unsigned(((~reg42) < {wire32})) && ($unsigned($unsigned(reg36)) == (-reg43[(4'h8):(3'h7)]))) >= reg46);
  assign wire53 = ((~|wire33) >> $signed(($unsigned($signed(reg44)) >> {reg49,
                      reg36[(3'h6):(3'h4)]})));
  assign wire54 = (((wire31[(2'h3):(1'h0)] & reg36[(3'h5):(3'h5)]) < $signed($signed(reg49))) ?
                      ($signed((((8'hb7) ? wire33 : reg40) <<< reg49)) ?
                          $signed({(reg35 & reg50),
                              (reg39 > (8'h9c))}) : reg46) : {$signed($signed((wire31 & reg50))),
                          $unsigned((!reg49[(1'h1):(1'h0)]))});
  assign wire55 = $unsigned(($signed($signed(wire34)) == reg35));
  assign wire56 = {reg38[(1'h0):(1'h0)]};
  assign wire57 = $unsigned(reg49[(3'h4):(3'h4)]);
  assign wire58 = ({reg49} ~^ reg50);
  always
    @(posedge clk) begin
      reg59 <= $signed({(((reg49 ?
              wire32 : reg45) == wire51) ^~ ((wire57 || (8'hae)) ?
              (~&(8'hbf)) : {(8'hb1), wire34}))});
    end
  assign wire60 = ($unsigned(wire51) != (wire57 ?
                      ($signed(wire34[(4'hb):(3'h4)]) ?
                          wire53[(1'h0):(1'h0)] : reg42[(4'hb):(4'h9)]) : reg36));
  assign wire61 = ($signed((~^$signed($unsigned((7'h44))))) >>> ($signed($unsigned($signed(reg44))) == {{wire51,
                          (-reg40)},
                      (~|wire32[(2'h2):(1'h1)])}));
  assign wire62 = ($unsigned(reg42) ?
                      $unsigned(reg40) : ((|(^~wire33)) >= ($unsigned({reg42}) + wire51)));
  assign wire63 = wire52[(3'h6):(3'h4)];
  assign wire64 = $unsigned(reg39);
  assign wire65 = $unsigned(((^$unsigned((reg47 - reg35))) ?
                      ((8'hb4) + wire64[(3'h4):(1'h1)]) : {{wire30[(1'h0):(1'h0)],
                              $signed(wire58)}}));
endmodule
