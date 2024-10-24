module top
#(parameter param85 = (((|{(~^(8'haa)), ((8'hb6) ^ (8'hbe))}) ? ({((8'hb5) ? (8'ha1) : (8'h9f)), {(8'h9f), (8'haa)}} ? ((&(8'hae)) == (!(8'h9c))) : (~{(8'hbd)})) : ((((8'ha1) == (8'hb8)) ? ((8'hb9) ? (8'hbf) : (8'h9f)) : ((8'h9e) ? (7'h41) : (8'hb8))) <<< (((8'h9d) || (8'hbc)) << ((8'ha6) ? (8'hb1) : (8'hac))))) >> (~^((~&{(8'hbd), (8'ha2)}) ^ (|((8'hbb) ? (8'hb8) : (8'hb6)))))), 
parameter param86 = ((((!(param85 ? param85 : param85)) ? (~{(8'ha9), param85}) : ({param85, (8'hb7)} ? {param85, param85} : ((8'hb1) <<< (8'had)))) ? (|(&param85)) : (8'hb4)) ~^ ({(-param85), ((param85 ? param85 : param85) ? (param85 ? (8'ha1) : param85) : param85)} ? (({param85} <= ((8'ha6) * param85)) ^ param85) : (!(-(8'hb2))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  assign y = {wire83, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire1[(2'h2):(1'h1)];
  assign wire6 = wire5[(2'h2):(1'h1)];
  assign wire7 = $unsigned($signed((wire3 ?
                     $signed(wire6[(4'h8):(2'h2)]) : $signed((wire5 >= wire6)))));
  assign wire8 = $signed($signed(wire0));
  assign wire9 = wire4[(1'h1):(1'h0)];
  assign wire10 = (8'h9d);
  module11 #() modinst84 (wire83, clk, wire10, wire0, wire2, wire7);
endmodule

module module11
#(parameter param81 = {(&((((8'hbf) ? (7'h41) : (8'hb8)) ? {(8'hb3), (8'hb5)} : (&(8'hb0))) - ({(8'hba)} ? ((8'hb6) ? (8'hb1) : (8'hb5)) : ((8'ha2) & (8'hac)))))}, 
parameter param82 = (param81 ? param81 : (((param81 | (8'hb7)) * param81) * (((|param81) ? (!param81) : (param81 ? param81 : param81)) == ((8'h9f) <= param81)))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire18,
                 wire17,
                 wire16,
                 reg78,
                 reg77,
                 reg76,
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
                 (1'h0)};
  assign wire16 = $unsigned((+($signed((wire14 ? wire12 : wire15)) ~^ {(wire15 ?
                          wire13 : wire15),
                      (8'hb0)})));
  assign wire17 = ({wire14,
                          (wire15[(1'h0):(1'h0)] - {$signed(wire14),
                              (wire12 ? (8'ha6) : wire15)})} ?
                      ((~|(8'ha8)) && ($signed($signed(wire13)) ?
                          ($signed(wire16) >>> wire15) : ($unsigned((8'hae)) ?
                              wire15 : wire16[(1'h0):(1'h0)]))) : (wire12 ?
                          (({wire16, wire14} == (!wire15)) ?
                              $signed((wire12 ?
                                  wire15 : wire14)) : wire15[(1'h0):(1'h0)]) : ((wire12[(3'h5):(2'h2)] <= (&wire14)) <= wire14)));
  assign wire18 = $unsigned((wire16[(1'h1):(1'h0)] - (^(-$unsigned(wire17)))));
  module19 #() modinst61 (.wire20(wire18), .wire23(wire16), .y(wire60), .wire22(wire15), .clk(clk), .wire21(wire13));
  assign wire62 = $unsigned((((wire60 >= $signed(wire14)) ?
                      $unsigned((wire13 >> wire60)) : wire60[(3'h5):(1'h1)]) + (((~^wire13) | $signed((8'hb6))) ?
                      ($unsigned(wire18) == {wire15, wire13}) : wire16)));
  assign wire63 = (wire13[(1'h1):(1'h1)] << wire60);
  assign wire64 = {wire12, wire18[(4'hc):(4'hb)]};
  always
    @(posedge clk) begin
      reg65 <= (+(8'hb1));
      if ($signed(((wire16[(1'h1):(1'h1)] + ((wire18 || wire17) ?
              wire17[(1'h1):(1'h1)] : $signed(wire14))) ?
          $unsigned(wire14) : (8'hb8))))
        begin
          reg66 <= (-wire17[(1'h1):(1'h1)]);
          reg67 <= {wire64[(4'ha):(1'h0)]};
          reg68 <= ({(((^wire14) ?
                          wire17[(3'h4):(3'h4)] : wire17[(2'h3):(1'h1)]) ?
                      ((wire62 ? wire12 : wire63) ?
                          (reg65 << wire14) : $signed(reg65)) : (wire16 ^ ((8'ha8) ?
                          wire17 : (8'hac)))),
                  $unsigned(wire14[(4'h8):(3'h5)])} ?
              {$signed($signed(wire12[(4'h8):(3'h5)]))} : (({wire60[(2'h2):(1'h1)],
                          ((8'hb1) ? wire60 : reg67)} ?
                      (wire64 ?
                          wire17[(1'h1):(1'h1)] : {wire17, wire15}) : wire16) ?
                  $unsigned(((wire15 ? wire12 : wire16) ?
                      $unsigned(wire14) : $signed(reg67))) : (8'ha5)));
        end
      else
        begin
          reg66 <= (($unsigned({{wire12}}) ?
              reg67 : (8'hbf)) ^ {$signed((-wire13[(1'h1):(1'h1)])),
              (|($signed(wire18) > wire60[(1'h0):(1'h0)]))});
          if (wire64)
            begin
              reg67 <= ($signed(wire60) && (~|wire17[(2'h3):(2'h3)]));
              reg68 <= wire13;
              reg69 <= (|{$unsigned(reg66[(4'h8):(3'h4)])});
              reg70 <= ($signed(wire16) - ((wire12[(3'h5):(2'h2)] && (+(^~(8'hb4)))) + $signed((8'ha8))));
            end
          else
            begin
              reg67 <= reg65[(2'h2):(1'h1)];
              reg68 <= wire18;
            end
          reg71 <= wire16[(1'h0):(1'h0)];
          if (reg65)
            begin
              reg72 <= wire60;
            end
          else
            begin
              reg72 <= {(^~wire60)};
              reg73 <= $unsigned($unsigned(((wire15 == reg65[(1'h0):(1'h0)]) ?
                  wire63 : {((8'haa) ? reg68 : (8'ha7))})));
              reg74 <= ($unsigned((+(~&{reg69}))) ? wire60 : wire16);
            end
          reg75 <= $signed((+wire64));
        end
      reg76 <= (-{((8'ha2) ? ({wire16} * $unsigned(reg69)) : reg68),
          ($signed($signed(reg74)) << (~|reg73[(3'h6):(2'h3)]))});
      reg77 <= (~&$unsigned(reg76[(5'h14):(5'h12)]));
      reg78 <= $signed(($unsigned(wire14[(2'h3):(1'h1)]) ? wire12 : (^reg70)));
    end
  assign wire79 = ($unsigned((8'ha0)) < (($unsigned(wire12) * {reg74}) ?
                      {(7'h41), $signed((reg74 ? reg70 : (8'had)))} : wire12));
  assign wire80 = (({($unsigned((8'h9f)) && {reg67, wire13})} ?
                          $signed(wire15[(4'hd):(3'h6)]) : reg74[(4'hc):(2'h3)]) ?
                      (~^($signed($signed(reg66)) == reg70)) : (|$unsigned(((~&wire14) ?
                          wire13 : (-(8'hac))))));
endmodule

module module19
#(parameter param58 = {(7'h42), {((~|(8'had)) ~^ (((8'h9c) != (8'ha0)) ? ((8'hb2) >= (8'hb3)) : ((8'hbd) ? (7'h41) : (8'hbc))))}}, 
parameter param59 = (7'h42))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire22;
  input wire [(2'h2):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire35;
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire35,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= (wire22[(4'he):(4'hc)] & wire21[(1'h1):(1'h1)]);
      if (((!$unsigned(($unsigned(reg24) ?
          (wire22 | wire21) : $unsigned(reg24)))) >= (wire20[(1'h1):(1'h0)] ?
          $signed($signed($unsigned(wire21))) : (wire23[(1'h0):(1'h0)] ^ {wire23[(3'h4):(1'h1)],
              $signed(wire21)}))))
        begin
          if (reg24)
            begin
              reg25 <= ((wire22 ?
                      (+(~(wire20 ~^ wire21))) : $signed({wire20, wire22})) ?
                  reg24[(3'h7):(3'h5)] : {(reg24[(2'h3):(2'h2)] ?
                          $signed(wire22) : (wire20 ?
                              $signed(wire20) : wire21)),
                      $unsigned(wire23[(2'h2):(1'h1)])});
              reg26 <= $unsigned(((+((!wire21) >> (reg24 ?
                  reg25 : wire23))) ^~ {$signed((wire22 ? wire20 : wire22))}));
              reg27 <= reg26;
            end
          else
            begin
              reg25 <= {{$signed(wire20)}};
              reg26 <= $signed(reg26[(4'hb):(1'h1)]);
              reg27 <= {wire22[(2'h3):(2'h3)], reg25[(4'hb):(3'h5)]};
            end
          if ((wire20[(2'h2):(1'h1)] > reg25))
            begin
              reg28 <= wire23[(3'h4):(3'h4)];
              reg29 <= $unsigned({reg24[(3'h7):(1'h0)],
                  (((8'ha6) | $unsigned(wire21)) >> wire22)});
              reg30 <= $signed($signed($signed({(wire22 ? reg24 : wire22)})));
              reg31 <= reg26;
            end
          else
            begin
              reg28 <= (({reg30[(2'h2):(1'h1)],
                  wire23[(3'h4):(1'h0)]} == $signed((+(reg27 ?
                  reg28 : reg28)))) <<< reg24[(3'h5):(3'h4)]);
              reg29 <= reg27[(5'h12):(2'h3)];
            end
          reg32 <= {reg27[(4'hf):(1'h1)], $unsigned(reg28)};
        end
      else
        begin
          reg25 <= wire21[(1'h1):(1'h0)];
          reg26 <= $signed((reg24 ? $signed(wire20[(4'he):(3'h5)]) : (!reg32)));
          reg27 <= ((~^((^(8'hbe)) ?
              wire23 : reg27)) << $unsigned($unsigned(((reg26 ?
              reg26 : reg30) ^~ {wire21, wire20}))));
          if (wire22)
            begin
              reg28 <= ((-(|((~|reg25) ?
                      $unsigned(reg30) : (wire23 ? reg31 : (8'ha4))))) ?
                  ((((reg26 ? reg26 : (8'h9f)) ?
                              (wire20 ? reg26 : reg32) : (^reg27)) ?
                          (((8'hb1) * reg26) ?
                              (reg26 ?
                                  wire23 : (8'ha3)) : $signed(wire20)) : ($unsigned(reg32) ?
                              wire22 : $signed(reg31))) ?
                      (~^$unsigned(reg32[(1'h0):(1'h0)])) : $unsigned($signed($unsigned(wire20)))) : (-$unsigned($unsigned((&wire20)))));
              reg29 <= (wire20 ? (wire21 + reg25) : reg24[(3'h7):(3'h4)]);
              reg30 <= $unsigned(($signed($signed($unsigned(reg27))) <= ($unsigned((reg27 ?
                  reg29 : (8'h9f))) ~^ (+{reg28, wire21}))));
            end
          else
            begin
              reg28 <= (-$signed(reg30));
            end
          reg31 <= (&(reg24 ?
              ((+reg27[(3'h5):(2'h2)]) ?
                  (8'haf) : (8'hb4)) : reg31[(4'h8):(2'h3)]));
        end
      reg33 <= $unsigned($unsigned($unsigned({reg28, $unsigned((8'hb1))})));
      reg34 <= {{$signed($signed({(8'hb2)})),
              (wire22[(3'h5):(1'h1)] ?
                  (~|(reg30 >= reg31)) : $unsigned($signed((8'hb1))))},
          $unsigned({wire21[(1'h0):(1'h0)], $unsigned((!wire21))})};
    end
  assign wire35 = reg24;
  always
    @(posedge clk) begin
      if (({reg26[(3'h6):(3'h5)],
              (reg28[(2'h3):(1'h0)] ?
                  ((wire20 ? reg29 : (8'h9d)) | (wire21 ?
                      wire23 : reg33)) : reg26)} ?
          $signed($signed($signed(reg30[(2'h3):(1'h1)]))) : ((reg30[(2'h3):(2'h3)] << ($signed(reg27) ?
              wire21[(1'h0):(1'h0)] : {reg27, (8'hb3)})) | reg26)))
        begin
          reg36 <= $unsigned({(reg34 <<< ($unsigned(reg30) >= (wire20 ?
                  reg34 : reg32)))});
          reg37 <= reg28[(2'h2):(1'h0)];
        end
      else
        begin
          reg36 <= $signed(reg25[(3'h5):(1'h0)]);
          if (wire35)
            begin
              reg37 <= (&($signed({(wire23 ^ reg24),
                  wire20}) ^ $signed((~|reg33))));
              reg38 <= (&wire23);
            end
          else
            begin
              reg37 <= {$signed((~|reg33[(4'hb):(1'h1)]))};
              reg38 <= $signed(((~reg36) ?
                  (((7'h44) ? (reg31 * (8'had)) : $unsigned(reg25)) ?
                      (~(!reg36)) : wire22[(5'h13):(1'h1)]) : wire23[(1'h0):(1'h0)]));
              reg39 <= $unsigned((reg32[(3'h5):(1'h1)] ^ (reg37[(4'ha):(1'h0)] >> wire35)));
            end
          reg40 <= reg27;
          reg41 <= $signed($signed(((~|(reg24 ? reg34 : wire21)) ?
              (^(reg38 ? reg26 : reg39)) : $signed(wire22[(4'hc):(4'h9)]))));
          reg42 <= ((wire22 != {$unsigned((reg36 ? (7'h41) : reg29)),
              reg24}) || reg32[(3'h6):(3'h5)]);
        end
      reg43 <= reg31;
    end
  assign wire44 = (reg38[(4'hd):(3'h5)] ?
                      reg34[(2'h3):(1'h1)] : reg28[(3'h7):(1'h0)]);
  assign wire45 = wire22[(4'h8):(2'h2)];
  assign wire46 = {$unsigned(reg31[(4'h8):(3'h7)])};
  assign wire47 = $unsigned($unsigned(({$signed(reg30),
                      $signed(reg38)} >>> $unsigned(reg39[(2'h3):(1'h1)]))));
  assign wire48 = (~&({reg32[(3'h4):(1'h0)]} + wire23));
  assign wire49 = reg33;
  assign wire50 = {$signed({reg37[(4'h9):(3'h5)]}), (~&$signed({(&(8'hbe))}))};
  assign wire51 = {wire21};
  assign wire52 = (^($unsigned(reg25) ?
                      $signed($unsigned($signed(reg29))) : (~(reg34[(1'h1):(1'h1)] ?
                          (reg28 ? reg38 : reg37) : wire47[(3'h7):(3'h4)]))));
  assign wire53 = reg32[(2'h2):(1'h0)];
  assign wire54 = {(~$unsigned($unsigned(reg40[(2'h3):(2'h3)])))};
  assign wire55 = (($unsigned(reg39[(2'h2):(1'h0)]) >>> $unsigned($unsigned($unsigned(wire49)))) ?
                      (~$unsigned({reg31[(4'hd):(4'h8)]})) : reg43[(3'h7):(1'h0)]);
  assign wire56 = {(~reg24)};
  assign wire57 = (+(($signed({wire22, wire55}) ?
                      (+(wire51 ?
                          wire54 : wire46)) : reg29[(4'hc):(4'hc)]) | $signed($signed(wire54))));
endmodule
