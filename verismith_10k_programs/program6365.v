module top
#(parameter param77 = ((({(8'hba), (!(8'ha4))} ? ((&(7'h43)) && ((8'ha4) + (8'hbe))) : (((8'ha4) > (8'hbd)) <<< {(8'hb1), (8'hbe)})) != {{(~^(7'h44))}, (((8'hb5) && (8'hb5)) * ((8'ha6) ? (8'h9f) : (8'hb3)))}) >>> {(~^(((8'ha8) ? (7'h43) : (7'h40)) && ((8'ha7) >>> (7'h44)))), (({(7'h42)} ? {(8'hbb), (7'h40)} : (8'hb9)) ~^ (((8'h9f) ^~ (8'hb4)) | {(8'haa)}))}), 
parameter param78 = ((({(param77 ? param77 : param77)} << (8'hb1)) != {{(-param77)}}) ? param77 : (~|(&((param77 == param77) ? (^param77) : (~&param77))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  assign y = {wire76,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire4 = ($signed((^~{wire1[(4'ha):(1'h1)],
                     wire1})) >> (wire3[(4'ha):(2'h3)] & wire1[(2'h2):(1'h0)]));
  assign wire5 = {(($unsigned((wire4 ? wire0 : wire2)) ?
                         (wire3[(3'h6):(3'h4)] >= {wire0,
                             wire3}) : wire0) || $unsigned(wire1[(4'hb):(3'h6)])),
                     (&($unsigned(wire4) ?
                         $unsigned(((8'hbb) >= wire3)) : {wire2[(3'h5):(2'h2)]}))};
  assign wire6 = (wire3[(2'h3):(1'h1)] >> (8'hbf));
  assign wire7 = {($unsigned((wire2 ?
                         wire4[(4'h9):(3'h7)] : $unsigned(wire2))) * (-(^(wire4 ?
                         wire4 : wire5))))};
  module8 #() modinst59 (.wire11(wire6), .wire12(wire4), .wire10(wire2), .wire9(wire1), .y(wire58), .clk(clk));
  assign wire60 = $signed(wire2);
  assign wire61 = ({($unsigned((wire5 != (8'h9d))) < wire7)} ?
                      wire2 : $signed({wire3[(3'h5):(1'h1)]}));
  assign wire62 = wire3[(2'h3):(1'h1)];
  assign wire63 = (|wire58);
  always
    @(posedge clk) begin
      reg64 <= {{{$unsigned((wire0 ? wire2 : wire7)),
                  ((wire60 ? (8'hb6) : wire4) <= ((8'h9d) ? wire5 : wire58))}}};
      reg65 <= reg64;
      reg66 <= $unsigned((~|(8'ha7)));
      reg67 <= wire62;
      if ({$signed((($unsigned(wire63) != wire60) - wire63))})
        begin
          reg68 <= wire2;
          if ($unsigned(wire1[(3'h7):(1'h0)]))
            begin
              reg69 <= (!$unsigned(wire62));
              reg70 <= (~&$signed($signed((&(-wire4)))));
              reg71 <= wire4;
            end
          else
            begin
              reg69 <= (!$signed((!reg65[(2'h2):(1'h1)])));
              reg70 <= {reg71};
              reg71 <= wire58[(4'hf):(4'h8)];
            end
          if ((~^($signed({(reg69 || wire0),
              (wire0 ? wire0 : reg66)}) == $signed($signed($unsigned(reg71))))))
            begin
              reg72 <= wire1[(4'hd):(1'h0)];
              reg73 <= reg68[(3'h6):(3'h4)];
              reg74 <= ((wire58 && ($signed((wire0 && (8'haa))) ?
                      (wire58 ? $unsigned(reg70) : (8'h9f)) : {(!wire60),
                          reg69[(1'h1):(1'h0)]})) ?
                  $unsigned($unsigned($signed($signed(wire62)))) : reg71[(4'hb):(2'h2)]);
              reg75 <= $unsigned({(^$signed($signed(reg64)))});
            end
          else
            begin
              reg72 <= $unsigned(reg69[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg68 <= $signed((7'h40));
        end
    end
  assign wire76 = (~|$unsigned($unsigned((~$unsigned(wire1)))));
endmodule

module module8
#(parameter param57 = {{((((7'h40) ? (8'hae) : (8'hb5)) ? ((8'hb5) ^~ (8'hbb)) : (!(8'h9d))) ? ((-(8'h9d)) && ((8'ha1) * (8'hbc))) : ((8'hb7) ? {(8'ha7), (8'hba)} : ((8'ha0) && (8'ha1))))}, ((~^(+((8'hb6) ? (7'h41) : (8'hb0)))) ? {(~|((8'hb4) ? (8'ha6) : (8'hb1))), (((8'hab) ? (7'h40) : (8'ha3)) && {(8'hb5), (8'ha3)})} : ((~^((8'hbc) >> (8'h9c))) ? {((8'hb0) <<< (8'hb3))} : (~^{(8'hae)})))})
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h1f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire12;
  input wire [(4'h8):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  assign y = {wire56, wire54, wire14, wire13, (1'h0)};
  assign wire13 = $unsigned(((~{wire11}) + ($unsigned((wire12 ?
                      wire11 : wire10)) > $unsigned((wire11 ?
                      wire10 : wire9)))));
  assign wire14 = (({wire11[(2'h2):(1'h0)], (^$unsigned(wire11))} ?
                      ((~&(wire9 ? (8'hb6) : wire10)) ?
                          ({wire11} >> wire13) : ((~wire10) ?
                              $unsigned(wire13) : (wire13 ?
                                  wire11 : wire11))) : $signed(((wire13 ?
                              (8'hbe) : wire12) ?
                          $signed(wire11) : wire12[(3'h5):(3'h4)]))) * (wire13[(2'h2):(2'h2)] ?
                      wire10 : wire13));
  module15 #() modinst55 (wire54, clk, wire13, wire10, wire11, wire12);
  assign wire56 = wire14[(3'h6):(1'h1)];
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
                 (1'h0)};
  assign wire20 = $signed((-wire18));
  assign wire21 = (|wire18[(1'h0):(1'h0)]);
  assign wire22 = (~^wire18);
  assign wire23 = $signed(wire17);
  assign wire24 = wire19[(3'h6):(2'h2)];
  assign wire25 = wire18;
  always
    @(posedge clk) begin
      if (wire20)
        begin
          if ($unsigned((wire22[(1'h1):(1'h0)] ?
              $signed($signed(wire16[(1'h1):(1'h0)])) : $unsigned($unsigned(wire24)))))
            begin
              reg26 <= ($signed(($signed((|wire17)) ?
                  ($signed(wire19) <<< (~^wire17)) : $signed((wire25 ?
                      wire23 : wire24)))) >> wire20[(2'h2):(1'h1)]);
              reg27 <= wire18;
              reg28 <= (($signed({{(8'haf), reg27}}) + $unsigned(({wire16,
                          wire21} ?
                      (wire20 && wire23) : ((8'hb2) ? wire20 : wire19)))) ?
                  wire25 : (~|wire22));
              reg29 <= wire20[(1'h1):(1'h1)];
            end
          else
            begin
              reg26 <= $unsigned($unsigned($unsigned((((8'ha6) ?
                  wire19 : reg29) * $unsigned(wire18)))));
            end
          reg30 <= (($signed(((wire25 >>> wire19) <<< $signed(reg27))) ?
                  ($unsigned(wire24[(1'h1):(1'h1)]) && $unsigned((wire19 ?
                      wire20 : wire18))) : wire16[(3'h6):(3'h4)]) ?
              reg26[(2'h2):(1'h0)] : (($unsigned({wire19,
                  wire18}) ~^ (^~$signed(wire23))) ^ $unsigned(reg26[(1'h0):(1'h0)])));
          reg31 <= (reg29[(2'h3):(2'h2)] * wire22[(3'h7):(3'h5)]);
          reg32 <= {$unsigned(reg28[(1'h0):(1'h0)]), wire24};
        end
      else
        begin
          reg26 <= wire21;
          if (reg29)
            begin
              reg27 <= wire24;
              reg28 <= (($signed(((reg28 + wire17) && (reg28 ?
                      (8'h9c) : wire25))) ?
                  {reg26,
                      ({wire21} + $unsigned(reg26))} : {$unsigned($signed(wire23))}) || reg31);
              reg29 <= $unsigned(($unsigned((&$unsigned(reg27))) ?
                  ($signed((~&reg29)) ?
                      (8'ha3) : reg26) : wire25[(4'ha):(2'h3)]));
            end
          else
            begin
              reg27 <= ((wire22[(3'h6):(2'h3)] ~^ {$signed(((8'ha3) ?
                      wire23 : wire24))}) >> wire21[(2'h2):(1'h1)]);
              reg28 <= (8'hb1);
              reg29 <= $signed((&reg26));
              reg30 <= $signed((!$signed((~^(reg31 == (8'h9e))))));
            end
        end
      if ((wire23 ? wire21[(2'h3):(2'h3)] : (!wire25)))
        begin
          reg33 <= ((((~wire19[(3'h6):(3'h5)]) ?
                  $signed(((8'hba) ?
                      wire24 : (8'hab))) : $unsigned($signed(reg30))) ?
              ($signed((wire25 | reg30)) > wire16[(1'h0):(1'h0)]) : ($unsigned(reg31) + $unsigned((~wire17)))) ^~ $unsigned((~|(8'hb1))));
          reg34 <= {$unsigned($unsigned($unsigned((wire24 || wire21))))};
          reg35 <= ((+$signed($unsigned(wire18))) ?
              $signed({$signed($unsigned((8'hb7))),
                  ((|wire21) ?
                      ((8'ha8) ?
                          wire22 : wire24) : (&reg31))}) : ((~^wire18) ^~ (($unsigned(reg28) ?
                      (reg33 ? reg28 : wire23) : (wire19 == (8'h9c))) ?
                  $unsigned({wire22}) : $unsigned((reg30 & wire20)))));
          reg36 <= $signed($unsigned(reg32[(4'h8):(4'h8)]));
          reg37 <= ((reg29 ? reg27[(3'h4):(1'h0)] : reg36) ?
              ($signed((-wire17[(1'h1):(1'h1)])) << (($unsigned(reg29) ?
                      $unsigned((8'hae)) : {(8'ha2), (8'ha3)}) ?
                  reg30 : ({reg31} ?
                      (reg34 | reg30) : $unsigned((8'ha6))))) : (~^((8'hb7) ?
                  reg30[(1'h1):(1'h1)] : (wire22[(3'h5):(1'h1)] ?
                      $signed((8'ha1)) : {reg33, wire16}))));
        end
      else
        begin
          reg33 <= {$signed((reg28[(2'h3):(1'h1)] != (8'ha5)))};
        end
      reg38 <= {$unsigned((|reg26))};
    end
  assign wire39 = reg29[(4'he):(4'hb)];
  assign wire40 = $unsigned((($signed($signed(reg27)) ?
                      reg29[(3'h4):(1'h0)] : reg29) || reg26));
  assign wire41 = reg28;
  assign wire42 = (reg26 ?
                      $unsigned(wire23) : $signed((^(((8'h9f) ?
                          reg32 : wire39) - (wire25 ? wire16 : (8'h9d))))));
  assign wire43 = $signed($unsigned((((-reg34) + {wire41}) ?
                      ($unsigned(reg28) ?
                          (-wire42) : $unsigned(wire42)) : ((wire42 ?
                              reg30 : wire16) ?
                          $signed(wire40) : {(8'hbd), wire40}))));
  assign wire44 = ((8'hb3) <<< $signed(($signed(wire22[(3'h5):(1'h1)]) ?
                      ((wire39 >> reg26) ~^ (~|reg33)) : (((8'ha7) >> wire41) | (reg34 - wire43)))));
  assign wire45 = ($unsigned($signed(reg37)) ?
                      $unsigned(((8'had) ?
                          {$unsigned(wire24)} : (~reg38))) : ($signed((|reg36)) <= reg30));
  assign wire46 = {$unsigned($unsigned(wire25))};
  assign wire47 = (wire18[(3'h5):(2'h2)] ?
                      (^~((|(wire24 >= reg36)) ?
                          ($signed(wire43) ?
                              $unsigned(reg27) : (reg36 >>> (7'h42))) : wire20[(3'h5):(2'h3)])) : (8'ha1));
  assign wire48 = wire20[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg49 <= $unsigned($unsigned($signed($signed($unsigned(reg33)))));
      reg50 <= (wire24[(2'h3):(1'h1)] << (($signed($unsigned(wire21)) * ((^~wire24) ?
              (reg34 ? reg32 : (8'hb7)) : $signed(reg32))) ?
          reg31 : reg35));
      reg51 <= (^~({((~&wire21) ? $unsigned(reg28) : wire48[(3'h5):(2'h2)])} ?
          {wire17[(1'h0):(1'h0)],
              $unsigned((wire39 ?
                  reg35 : reg26))} : $signed(wire20[(3'h4):(2'h2)])));
      reg52 <= {$unsigned($unsigned($unsigned($unsigned(reg30)))), wire21};
      reg53 <= (~|$unsigned($unsigned(($signed((8'ha5)) & reg36))));
    end
endmodule
