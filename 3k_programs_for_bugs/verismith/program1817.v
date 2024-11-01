module top
#(parameter param160 = (-(~^(~^(((8'ha0) ? (8'had) : (8'hb5)) < ((8'ha1) ? (8'ha3) : (7'h44)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire159;
  wire [(4'h8):(1'h0)] wire158;
  wire [(3'h4):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire46;
  reg [(4'h8):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg [(2'h3):(1'h0)] reg153 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire137,
                 wire63,
                 wire59,
                 wire58,
                 wire50,
                 wire49,
                 wire48,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire46,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg60,
                 reg61,
                 reg62,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 (1'h0)};
  assign wire5 = (wire4 >= wire3);
  assign wire6 = (wire5 ^~ {wire5[(2'h2):(2'h2)], {(wire1 << wire4)}});
  assign wire7 = $signed($signed($signed((~|(~^wire2)))));
  assign wire8 = $unsigned((((~|$signed(wire2)) | (7'h44)) ?
                     wire2 : $signed({$signed(wire4)})));
  assign wire9 = $unsigned($signed($unsigned({$unsigned(wire5)})));
  assign wire10 = ((~wire9[(1'h1):(1'h1)]) >= (wire3[(1'h1):(1'h1)] ?
                      wire6 : $signed((~^wire4[(3'h4):(3'h4)]))));
  module11 #() modinst47 (.y(wire46), .wire14(wire4), .wire15(wire2), .clk(clk), .wire16(wire5), .wire12(wire8), .wire13(wire1));
  assign wire48 = (wire2 - wire4[(4'h9):(1'h0)]);
  assign wire49 = ((wire2[(3'h4):(3'h4)] ?
                          (($signed(wire8) ? (wire5 >= wire46) : wire3) ?
                              (^~$unsigned(wire48)) : ((wire3 ^ wire46) ?
                                  $signed(wire4) : wire2[(1'h0):(1'h0)])) : ((wire7[(4'hb):(3'h7)] + (~^wire7)) ?
                              ({(8'hb4)} - wire1[(4'hd):(3'h4)]) : wire10[(2'h3):(1'h1)])) ?
                      (~|(+(wire46[(2'h2):(1'h0)] ?
                          (wire3 ? wire0 : wire3) : (wire0 ?
                              wire48 : (8'ha8))))) : wire3[(1'h1):(1'h0)]);
  assign wire50 = ((^~wire4[(4'hc):(1'h0)]) && $unsigned(wire8));
  always
    @(posedge clk) begin
      reg51 <= (^~((^~(^~(!wire1))) ?
          wire6[(5'h12):(3'h5)] : wire3[(1'h1):(1'h0)]));
      if ($signed((~|((7'h41) ?
          ({wire0} ? $unsigned(wire7) : (wire49 ? wire10 : wire2)) : wire2))))
        begin
          if (wire1)
            begin
              reg52 <= ({((-$unsigned(wire6)) ?
                      (~&wire7[(3'h7):(3'h4)]) : wire46[(2'h2):(1'h1)])} - ($signed(wire50) ?
                  {reg51[(4'hc):(3'h4)],
                      $unsigned(wire9)} : {{$signed((8'ha9))}}));
              reg53 <= $signed((!(((wire10 ?
                  wire1 : (8'h9e)) >= $signed(wire9)) == (^~$unsigned(wire8)))));
              reg54 <= (7'h41);
              reg55 <= wire48[(1'h1):(1'h1)];
              reg56 <= (!reg53);
            end
          else
            begin
              reg52 <= ((-(8'haf)) ?
                  {$unsigned((wire48[(1'h1):(1'h1)] ? (^wire4) : wire1)),
                      ((((8'ha4) ?
                          wire48 : wire10) ^~ $signed(reg56)) >= $signed((wire4 ?
                          wire6 : wire0)))} : (reg51 <= $signed(wire49)));
              reg53 <= {(^{$unsigned($unsigned(wire4))}),
                  (reg53[(1'h0):(1'h0)] ?
                      {$signed(reg54)} : reg55[(1'h1):(1'h1)])};
              reg54 <= ($unsigned(($unsigned({wire6}) ?
                      reg55 : ({wire5} == (wire8 ? wire6 : wire6)))) ?
                  {$signed((((8'h9f) <<< wire0) || (8'had)))} : wire8[(5'h11):(4'hb)]);
              reg55 <= $signed((-(~|$unsigned((-wire1)))));
            end
        end
      else
        begin
          reg52 <= wire50[(1'h0):(1'h0)];
          reg53 <= (^~$signed(wire50));
          reg54 <= $signed(((|((reg53 ? reg54 : wire4) ?
              (wire0 ? reg52 : wire1) : (~|wire50))) <<< $unsigned((-reg52))));
        end
      reg57 <= (((~&(~reg55)) ?
          (^~(^wire9)) : $signed(reg56)) && reg53[(4'h9):(2'h2)]);
    end
  assign wire58 = wire5;
  assign wire59 = $signed((wire2 * ($unsigned((wire9 != reg51)) << $unsigned(reg54))));
  always
    @(posedge clk) begin
      reg60 <= $unsigned(wire50[(1'h0):(1'h0)]);
      reg61 <= {wire59[(2'h2):(1'h0)]};
      reg62 <= (reg56[(2'h3):(1'h0)] ? $unsigned(wire1[(3'h4):(1'h0)]) : wire3);
    end
  assign wire63 = ((wire46 ?
                          wire9 : (~^((wire8 <= (8'hb2)) & $signed(wire7)))) ?
                      (($unsigned(wire7) ?
                              ($signed((8'h9d)) ?
                                  wire6[(1'h0):(1'h0)] : reg56[(3'h6):(1'h1)]) : {$unsigned(wire1),
                                  $unsigned(wire46)}) ?
                          $signed(((reg60 <= wire10) ~^ $unsigned(wire7))) : (($unsigned(reg57) ?
                              {wire9, reg56} : wire6) != $unsigned((reg60 ?
                              reg54 : wire58)))) : (|{(wire3 > $signed(reg57))}));
  always
    @(posedge clk) begin
      reg64 <= $unsigned($signed($signed({(wire8 >> reg51),
          wire9[(4'hb):(1'h1)]})));
      if ($signed(wire8[(3'h4):(1'h1)]))
        begin
          if ((8'haf))
            begin
              reg65 <= $unsigned({$signed({(wire58 ? wire8 : wire9)}),
                  wire63[(4'ha):(1'h0)]});
            end
          else
            begin
              reg65 <= ($unsigned($signed({$unsigned(reg57)})) ?
                  $unsigned(reg65[(2'h3):(2'h2)]) : wire8[(1'h1):(1'h0)]);
              reg66 <= ($unsigned((7'h43)) & $unsigned($unsigned((~((8'hb6) - reg51)))));
            end
          reg67 <= (&((|{(^~reg65), (8'hb3)}) ?
              $unsigned((7'h44)) : wire10[(3'h5):(2'h3)]));
          reg68 <= $signed(wire3);
          reg69 <= wire5[(4'ha):(1'h0)];
          if ($signed({reg68[(2'h3):(1'h0)]}))
            begin
              reg70 <= $signed($unsigned($signed((((7'h41) & reg60) ~^ wire50))));
              reg71 <= reg55[(1'h0):(1'h0)];
              reg72 <= $signed(({reg53[(2'h2):(1'h1)],
                  (reg65[(1'h1):(1'h1)] << $unsigned(reg51))} + wire49));
              reg73 <= $unsigned($unsigned(wire48));
            end
          else
            begin
              reg70 <= wire49;
            end
        end
      else
        begin
          reg65 <= ($signed((&wire46[(1'h0):(1'h0)])) ?
              wire4 : ($unsigned({((8'hb4) ? wire46 : reg68),
                      (reg62 ? reg60 : (7'h40))}) ?
                  $unsigned(($unsigned(reg54) ?
                      wire49[(3'h5):(1'h0)] : $unsigned((8'hb6)))) : (reg71[(4'hc):(4'h9)] ^~ (!wire3))));
        end
      if (reg69)
        begin
          reg74 <= ($unsigned(reg68[(3'h4):(1'h1)]) ?
              $signed(wire48[(4'ha):(2'h3)]) : reg67[(1'h1):(1'h0)]);
          reg75 <= (($unsigned({$unsigned(wire10), wire6}) ?
                  reg52[(2'h2):(2'h2)] : (reg73 >= reg57)) ?
              $unsigned(((~$unsigned(reg64)) && wire5)) : ((~|(-$signed(reg56))) || ((wire46[(1'h1):(1'h1)] ?
                  (wire3 >= reg67) : (wire58 - reg68)) >= ({reg60} ?
                  wire5 : $signed(wire46)))));
        end
      else
        begin
          reg74 <= reg66[(4'hb):(4'h8)];
          reg75 <= (8'ha3);
          reg76 <= (wire2 ? (^reg68) : (^reg66[(4'hd):(4'ha)]));
          reg77 <= (({((!reg68) == (reg66 <<< reg65))} >= reg75[(3'h5):(3'h4)]) > $signed(wire59));
        end
      reg78 <= (reg57[(4'h8):(1'h0)] ?
          reg68[(3'h4):(3'h4)] : (~^(((reg72 ? wire4 : wire1) ?
              (8'ha0) : (^reg69)) != ($signed(reg67) ?
              wire48 : (reg54 ? reg77 : (8'hb3))))));
    end
  module79 #() modinst138 (wire137, clk, wire4, reg76, reg53, wire10, reg65);
  always
    @(posedge clk) begin
      reg139 <= (+((wire4 ?
              (wire9[(4'hd):(3'h5)] ?
                  (reg68 ^~ reg51) : (reg68 ^~ reg57)) : wire10) ?
          {$unsigned($signed(wire6)),
              (((8'ha0) ^ (8'haf)) ?
                  (~^reg61) : $unsigned(reg64))} : (~&wire7[(4'h8):(4'h8)])));
      reg140 <= (reg55 ? $signed(reg76[(2'h2):(1'h0)]) : reg75);
      reg141 <= {$unsigned(reg51[(4'h9):(2'h2)])};
      reg142 <= (|$signed(reg140));
    end
  always
    @(posedge clk) begin
      reg143 <= {wire2[(3'h4):(3'h4)]};
      reg144 <= $signed({(|(~&wire63))});
      reg145 <= wire9;
      reg146 <= $unsigned($unsigned({(-(reg67 ? (7'h44) : (8'hab))), wire6}));
    end
  always
    @(posedge clk) begin
      reg147 <= reg56;
      if ({reg67[(1'h0):(1'h0)], $signed((^~$signed((reg140 & reg61))))})
        begin
          reg148 <= wire49[(1'h0):(1'h0)];
          reg149 <= $signed(((+reg74[(4'h9):(3'h7)]) * (^(^~(7'h41)))));
          if ((wire59 != $signed($signed(reg140[(4'hb):(4'ha)]))))
            begin
              reg150 <= ($unsigned($unsigned(reg56)) != (|$unsigned($signed(reg55))));
              reg151 <= $signed((((^~$unsigned(reg66)) ?
                  wire9[(4'hb):(3'h4)] : ($unsigned(reg140) ?
                      (8'hb4) : (8'ha0))) <<< $unsigned(((~&reg150) ?
                  (&reg62) : {reg150, (8'hb1)}))));
            end
          else
            begin
              reg150 <= $signed($signed((~&($signed(reg141) ^~ reg74[(4'ha):(4'h8)]))));
              reg151 <= reg147[(3'h4):(2'h3)];
            end
          reg152 <= {{$signed({$signed(reg141), reg139[(3'h4):(1'h1)]})}};
          if (reg147)
            begin
              reg153 <= {($signed((^~(reg146 ? reg69 : (8'hab)))) ?
                      wire4 : reg65[(1'h1):(1'h0)]),
                  {((wire59[(2'h2):(1'h1)] & (+reg55)) ?
                          (~^$unsigned((8'h9f))) : (~$signed(reg150))),
                      reg69[(5'h11):(3'h4)]}};
              reg154 <= (reg62[(1'h1):(1'h0)] > {(^~(reg144 & reg141))});
              reg155 <= $unsigned($unsigned(wire49[(1'h0):(1'h0)]));
              reg156 <= (($unsigned({reg54[(2'h2):(2'h2)]}) ^ (reg77 ^ (((8'ha5) ?
                          (8'h9f) : reg60) ?
                      {wire4, (8'hb2)} : (wire1 != reg62)))) ?
                  {{$signed($signed(reg72))}} : reg73[(3'h4):(1'h0)]);
            end
          else
            begin
              reg153 <= {wire6[(4'hc):(3'h7)],
                  $signed({((!wire2) ? (8'h9f) : (^wire1)), (8'hb4)})};
              reg154 <= ({$unsigned({(~&wire7)})} && (wire8 ^ ((8'hae) && ({reg155,
                      reg154} ?
                  $unsigned(reg61) : $signed(wire46)))));
              reg155 <= ($signed((reg147[(4'ha):(2'h2)] ?
                  $signed((^reg77)) : ((wire2 >= wire5) ?
                      (-reg67) : (8'ha2)))) != ({(reg142 ?
                      $unsigned(reg142) : {wire46}),
                  (((8'hb0) >> wire137) > wire49[(2'h3):(1'h0)])} ~^ $unsigned(reg76[(5'h13):(1'h1)])));
              reg156 <= ({((&reg153) ?
                          (^(~|reg66)) : (reg73[(2'h2):(1'h0)] ?
                              reg62 : $signed((8'hba)))),
                      $signed(wire3[(1'h1):(1'h1)])} ?
                  {reg75,
                      reg153} : $unsigned($signed((((8'hbd) * wire9) + $unsigned(wire7)))));
              reg157 <= (^$signed(((|(8'hbe)) <<< $unsigned({reg52}))));
            end
        end
      else
        begin
          reg148 <= wire0[(1'h0):(1'h0)];
          reg149 <= (^~((8'hba) ~^ (8'h9f)));
          reg150 <= reg65;
        end
    end
  assign wire158 = $unsigned(reg60[(4'hc):(3'h7)]);
  assign wire159 = (~^{($signed($unsigned(reg148)) ?
                           $unsigned(reg70) : ((~^reg150) == wire49[(1'h0):(1'h0)])),
                       (8'hbf)});
endmodule

module module79
#(parameter param136 = (-((({(8'hb4), (8'hb8)} ? ((8'hb6) ? (7'h40) : (8'ha9)) : {(8'hb6)}) ? (((8'hb8) < (8'h9e)) ? (&(8'hb1)) : ((8'hab) && (8'hac))) : (((8'hae) != (8'ha7)) << {(8'h9f), (8'hb2)})) <<< (~^(~&(|(8'hb9)))))))
(y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire84;
  input wire [(5'h15):(1'h0)] wire83;
  input wire signed [(3'h4):(1'h0)] wire82;
  input wire [(5'h14):(1'h0)] wire81;
  input wire [(2'h2):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire129;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg132 = (1'h0);
  assign y = {wire131,
                 wire129,
                 wire86,
                 wire85,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire85 = ($unsigned($unsigned(((wire82 ?
                      wire84 : wire82) >>> (wire81 | wire81)))) <= $signed({(wire80[(1'h1):(1'h1)] <= wire84)}));
  assign wire86 = $signed($unsigned((~|$signed((wire82 & wire81)))));
  module87 #() modinst130 (wire129, clk, wire85, wire81, wire83, wire80);
  assign wire131 = (~|$signed({$unsigned($unsigned(wire86)),
                       $unsigned($unsigned(wire85))}));
  always
    @(posedge clk) begin
      reg132 <= ($signed((8'ha9)) ~^ ((+wire81[(4'h9):(3'h7)]) * $unsigned(((&wire84) < (wire81 ?
          wire83 : wire129)))));
      reg133 <= {wire81,
          ((8'hac) && $unsigned(((wire83 >>> wire83) & wire81)))};
      reg134 <= ((($signed((~wire85)) >> $unsigned((wire131 + wire129))) ?
              $unsigned(wire85[(1'h0):(1'h0)]) : $unsigned((wire80 > wire81))) ?
          wire84 : wire84[(1'h0):(1'h0)]);
      reg135 <= (wire85[(3'h7):(2'h3)] > ($signed(($unsigned(wire85) ?
              (~^wire129) : reg132)) ?
          wire85 : ($unsigned((wire81 >>> wire84)) ?
              wire85 : {wire86[(3'h6):(2'h2)]})));
    end
endmodule

module module11
#(parameter param45 = (^~(((((7'h44) > (7'h44)) ? ((7'h42) ? (8'hb1) : (8'h9d)) : (^(8'hbb))) ? (+(-(8'hac))) : ((^(8'hb5)) >>> {(8'ha8)})) >= ((((8'hb9) > (7'h41)) ? ((8'ha2) ? (8'hac) : (8'hab)) : ((8'ha4) > (8'ha5))) ? ({(8'haf), (8'ha0)} && ((8'haf) ^ (8'hb0))) : (^(~|(8'hbd)))))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire16;
  input wire [(2'h3):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire17;
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  assign y = {wire44,
                 wire17,
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
                 (1'h0)};
  assign wire17 = $signed((~^$unsigned(({wire13} ?
                      $unsigned(wire13) : $unsigned((8'haa))))));
  always
    @(posedge clk) begin
      reg18 <= wire14[(1'h0):(1'h0)];
      if (wire17[(2'h2):(1'h1)])
        begin
          reg19 <= ((+{(8'hbb), $unsigned(wire17)}) ?
              ((&(wire12[(1'h1):(1'h1)] >> {wire17, reg18})) ?
                  (+((wire15 ? wire12 : wire16) ?
                      wire16[(3'h7):(2'h3)] : (reg18 ?
                          wire17 : wire12))) : (+{{(8'h9f)},
                      $unsigned(wire14)})) : ((wire15[(1'h1):(1'h1)] ?
                      ((~|wire16) != (wire15 ?
                          wire15 : wire17)) : $unsigned($signed(wire12))) ?
                  reg18 : reg18));
          reg20 <= wire14[(3'h6):(2'h3)];
          if (wire14[(4'hc):(3'h6)])
            begin
              reg21 <= (wire13[(4'hd):(3'h7)] ?
                  (wire12[(2'h2):(2'h2)] == (8'hb5)) : wire15[(1'h1):(1'h1)]);
              reg22 <= (^wire13);
              reg23 <= {$unsigned((7'h44)),
                  $signed($signed(((reg22 ? wire14 : wire16) ?
                      $unsigned(wire14) : wire17[(1'h1):(1'h1)])))};
              reg24 <= wire16;
            end
          else
            begin
              reg21 <= ($signed(wire12[(1'h0):(1'h0)]) >> reg20);
              reg22 <= (!(8'hb8));
              reg23 <= (wire14 <<< ((~^wire13) ?
                  (($signed(reg24) ? wire17[(1'h0):(1'h0)] : {(8'hb5)}) ?
                      {reg21} : $unsigned((reg24 ?
                          wire14 : reg21))) : {reg20}));
              reg24 <= (($unsigned($signed((~^wire13))) | (^$unsigned(reg18))) < {$signed($signed((reg21 ?
                      (7'h41) : reg24)))});
              reg25 <= ((reg23[(3'h5):(2'h3)] ?
                      (((reg23 == wire16) | {wire13}) & (^$signed(reg21))) : reg23) ?
                  reg18[(4'hc):(2'h2)] : ($signed($signed(((8'hb3) ?
                          wire16 : reg19))) ?
                      ($signed($unsigned(reg19)) <= wire15) : (^reg22)));
            end
          if (((~^((((8'hbf) | reg23) && (~^reg24)) >> ($unsigned((8'ha1)) ~^ $unsigned((8'ha0))))) ?
              {$signed($signed((reg23 ?
                      wire12 : (8'hb6))))} : ((!$signed(((8'hb3) ?
                      reg19 : (7'h44)))) ?
                  reg21[(2'h2):(1'h1)] : {(~^(^reg25)), reg20})))
            begin
              reg26 <= ($unsigned({$unsigned($unsigned((8'hb1))),
                  wire14[(3'h6):(3'h6)]}) ^ (reg20 >> {{reg24[(2'h3):(2'h3)],
                      reg21},
                  wire12}));
              reg27 <= ($signed(({reg23[(3'h6):(3'h5)],
                      reg25} > {(reg23 ~^ reg18), $unsigned(reg22)})) ?
                  reg23 : ($unsigned(reg19) ? {wire12} : $signed(wire14)));
              reg28 <= (^~((((reg20 ? reg18 : reg21) ?
                  $signed((8'hae)) : reg25[(1'h1):(1'h1)]) >> (~&wire14[(3'h6):(3'h6)])) & ($signed((reg25 ?
                  reg21 : (8'hb8))) != ($signed(reg22) ?
                  $unsigned(reg25) : (wire17 ^~ reg18)))));
              reg29 <= $unsigned((&(~|reg27[(2'h3):(1'h0)])));
              reg30 <= reg21;
            end
          else
            begin
              reg26 <= $unsigned($signed(reg18[(1'h1):(1'h0)]));
              reg27 <= (((((reg28 ? reg20 : reg30) ?
                          $unsigned(wire14) : $signed(reg27)) > (^~$signed(wire14))) ?
                      ((reg25[(1'h1):(1'h1)] - $signed(reg18)) ?
                          {((7'h41) ? reg18 : reg18)} : (reg27 ?
                              {reg19} : $unsigned(wire15))) : $unsigned($unsigned($unsigned(reg20)))) ?
                  $signed((($signed(reg26) ?
                      (^~reg21) : {reg28}) | $signed((wire15 ?
                      (8'hb6) : wire16)))) : $unsigned($signed(((reg18 <<< wire13) <<< wire13))));
              reg28 <= $signed(wire15[(2'h3):(1'h0)]);
            end
          reg31 <= reg23;
        end
      else
        begin
          if ($unsigned(reg31))
            begin
              reg19 <= ((reg21 != (reg18[(1'h0):(1'h0)] ?
                  wire17[(1'h1):(1'h1)] : ((-(8'ha6)) + (reg20 << reg26)))) ^~ $unsigned($signed(reg22)));
              reg20 <= wire16[(1'h1):(1'h1)];
              reg21 <= (reg23 == (8'ha5));
              reg22 <= $unsigned({(~&(reg23[(2'h3):(1'h0)] ?
                      (-reg25) : (reg28 ? reg22 : reg21))),
                  ((~|(reg18 ?
                      wire13 : reg30)) == ($signed(reg29) + (!(8'hac))))});
              reg23 <= (~&{(reg20[(5'h14):(4'hc)] ?
                      ($signed((8'ha8)) && (8'h9d)) : reg21)});
            end
          else
            begin
              reg19 <= (!reg21[(1'h0):(1'h0)]);
              reg20 <= $unsigned(reg19);
              reg21 <= wire14[(4'hf):(4'hc)];
              reg22 <= {(~&reg29[(5'h12):(5'h10)])};
              reg23 <= (+(reg27 != $unsigned($unsigned((reg22 ?
                  wire12 : (8'ha7))))));
            end
          reg24 <= reg19[(3'h7):(3'h5)];
          if ((8'hb9))
            begin
              reg25 <= ($unsigned((~^((8'hb7) + (^reg19)))) << ({($signed(reg20) ?
                          {reg27} : $signed(reg29)),
                      ((reg29 || reg20) ? reg25[(1'h0):(1'h0)] : (^reg28))} ?
                  (wire17[(2'h2):(1'h1)] ^ reg29) : (8'hae)));
              reg26 <= reg20[(4'hb):(1'h1)];
              reg27 <= ({wire13, reg28} | $signed($signed(((!wire16) ?
                  (reg22 ? reg24 : (8'hb4)) : (reg24 ? reg31 : wire16)))));
              reg28 <= (reg26 ?
                  reg28 : (($signed((reg23 ? wire13 : reg26)) ?
                      reg23[(3'h6):(3'h5)] : $unsigned({(8'hb5),
                          reg19})) << (~^$unsigned(wire14[(4'hb):(3'h7)]))));
              reg29 <= (8'hb0);
            end
          else
            begin
              reg25 <= reg18[(4'ha):(2'h2)];
              reg26 <= reg30[(3'h6):(3'h4)];
            end
          reg30 <= $unsigned($signed((reg30 ?
              ((reg24 ? (8'haf) : reg23) ?
                  {reg23, wire17} : (-reg23)) : ((~&reg25) >= (reg19 ?
                  (7'h44) : reg28)))));
          reg31 <= ($signed($unsigned((-((8'hb3) < (8'haf))))) ~^ $signed(reg19));
        end
    end
  always
    @(posedge clk) begin
      reg32 <= (reg26 <= (((reg29 ? (reg18 ? (8'hbe) : reg28) : (8'haf)) ?
              $unsigned({wire13}) : $unsigned((~reg27))) ?
          $signed({$unsigned(reg23), (reg18 >> reg18)}) : wire14));
      reg33 <= $signed((reg32 - (~^(+((7'h41) >> wire13)))));
      reg34 <= $signed((!(reg33[(2'h3):(1'h0)] ?
          (!(reg23 | (8'ha3))) : $unsigned((+(7'h41))))));
      if ({($unsigned(wire17[(1'h0):(1'h0)]) ?
              $unsigned($unsigned(reg19[(3'h7):(2'h3)])) : ($unsigned(reg29[(2'h2):(1'h1)]) ?
                  $unsigned($unsigned((8'ha9))) : (+(~^reg20))))})
        begin
          reg35 <= (wire13 >= (8'had));
          reg36 <= (7'h41);
          reg37 <= (((((~|(8'ha0)) >= (reg33 ~^ reg35)) < ($signed(reg18) + wire13[(4'hc):(4'hb)])) ?
              (($unsigned(reg28) ? (+wire17) : $unsigned((8'ha1))) || (reg31 ?
                  reg26 : (reg19 ?
                      reg20 : reg36))) : ((8'hbf) * $unsigned((wire16 ?
                  (8'hbb) : reg29)))) >> {((~&{reg28,
                  reg31}) <<< reg31[(4'h8):(1'h0)])});
          reg38 <= $unsigned($signed((+wire16)));
        end
      else
        begin
          reg35 <= reg38;
          if (reg32[(4'h8):(3'h6)])
            begin
              reg36 <= reg32[(2'h2):(2'h2)];
              reg37 <= (((-((reg32 - (8'h9f)) ? (~&reg18) : (&reg37))) ?
                      reg31 : $unsigned(((reg26 ? wire12 : reg24) ?
                          reg25 : (reg21 ? (8'ha8) : reg34)))) ?
                  ((+($signed(reg19) ? reg23 : $signed(wire14))) ?
                      $unsigned((((8'hb1) < (8'haa)) ?
                          ((8'hbd) <<< wire17) : (reg23 == (8'ha8)))) : reg37) : $unsigned(reg33));
              reg38 <= wire16[(2'h2):(1'h1)];
              reg39 <= (-($signed(($signed(reg38) <= $signed(reg37))) ?
                  (reg23 ?
                      ((reg25 > reg27) ?
                          $signed((7'h40)) : (+wire15)) : (((7'h42) + wire14) ?
                          (reg29 >> wire15) : (wire17 ?
                              reg19 : reg19))) : $signed((~&$signed(reg37)))));
            end
          else
            begin
              reg36 <= $unsigned((reg35 ? reg22 : $signed((8'haa))));
              reg37 <= reg33[(2'h3):(2'h2)];
              reg38 <= (8'ha3);
              reg39 <= reg28[(3'h5):(1'h1)];
            end
        end
      if ((reg28[(2'h3):(1'h1)] ?
          $signed(((reg34 ? {reg36, reg34} : (reg26 ? reg22 : (8'hb1))) ?
              ({wire16, reg36} ?
                  (wire14 <= wire15) : reg28) : (~(reg18 != reg19)))) : $unsigned(($signed(reg29) ?
              (~&(~&reg37)) : reg36[(1'h0):(1'h0)]))))
        begin
          reg40 <= (^~($unsigned(((wire14 + reg18) == (reg30 ?
                  reg33 : reg34))) ?
              {reg23, $signed((|wire14))} : reg23));
          if (reg37[(1'h1):(1'h1)])
            begin
              reg41 <= $unsigned((reg18[(4'h8):(2'h2)] != (reg28 > ($signed(reg40) ?
                  reg34 : {wire16, reg22}))));
              reg42 <= $signed(wire14);
            end
          else
            begin
              reg41 <= (((~|{$unsigned(reg20)}) < (!(~|reg26))) ?
                  ($unsigned(((^wire14) ?
                      ((8'h9e) ?
                          reg22 : wire15) : wire17[(1'h1):(1'h1)])) <<< (~$signed((reg30 | (8'h9d))))) : (~^$unsigned(reg27)));
              reg42 <= $unsigned(($unsigned({{reg23, reg37}, {reg42, reg29}}) ?
                  ($unsigned(wire13) ?
                      (^~$signed((8'hb8))) : {reg18[(4'ha):(4'h9)]}) : (((wire14 ?
                      reg32 : reg42) >>> {reg40}) >>> (~|(~|wire17)))));
            end
        end
      else
        begin
          reg40 <= $signed($unsigned(reg42));
          reg41 <= $unsigned((wire16 ~^ (!reg27[(1'h1):(1'h1)])));
          reg42 <= $unsigned((reg25 ?
              (reg38[(2'h3):(2'h3)] << $unsigned({reg24})) : reg41[(4'he):(4'ha)]));
          reg43 <= ((~&{((~^reg31) << reg40[(1'h1):(1'h1)]),
                  reg27[(1'h0):(1'h0)]}) ?
              $unsigned(reg24[(2'h3):(2'h3)]) : (^(^~wire12)));
        end
    end
  assign wire44 = {reg36};
endmodule

module module87  (y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire91;
  input wire [(3'h5):(1'h0)] wire90;
  input wire signed [(5'h11):(1'h0)] wire89;
  input wire [(2'h2):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire signed [(3'h7):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire116;
  wire [(3'h5):(1'h0)] wire115;
  wire signed [(4'hb):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire signed [(5'h14):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire107;
  wire [(4'ha):(1'h0)] wire92;
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  assign y = {wire128,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire92,
                 reg127,
                 reg126,
                 reg112,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire92 = $unsigned(($unsigned($unsigned($signed(wire89))) ?
                      $unsigned($signed($signed(wire91))) : $unsigned((+$signed(wire89)))));
  always
    @(posedge clk) begin
      reg93 <= $signed(wire91[(1'h0):(1'h0)]);
      if ($signed(wire90))
        begin
          if ((($unsigned((^reg93)) >> ({((8'ha5) * wire90)} || (~^(8'hae)))) ?
              $signed(wire88) : wire92[(3'h4):(3'h4)]))
            begin
              reg94 <= {$signed($signed(wire88))};
            end
          else
            begin
              reg94 <= ($signed($signed(($unsigned(reg93) >> (~^(8'hb4))))) ?
                  $unsigned($unsigned($signed($unsigned(reg93)))) : wire89[(3'h6):(3'h4)]);
            end
          if (wire89[(4'hd):(3'h4)])
            begin
              reg95 <= wire89[(4'h8):(2'h2)];
            end
          else
            begin
              reg95 <= wire92;
              reg96 <= (reg95[(1'h0):(1'h0)] ?
                  (~&(wire89 ?
                      ((!(8'ha6)) ?
                          ((7'h44) ?
                              (8'ha5) : wire88) : (8'hbc)) : wire89)) : $unsigned($unsigned({((8'ha5) ?
                          reg95 : wire89),
                      ((7'h44) ? reg94 : wire92)})));
              reg97 <= wire92;
              reg98 <= reg93;
            end
          if ({{wire88[(1'h1):(1'h0)], (+reg94[(2'h3):(2'h2)])}})
            begin
              reg99 <= (!{({(reg98 ? wire91 : reg97),
                      reg94} >= ($signed(wire91) & (wire91 ?
                      wire91 : (8'h9c))))});
              reg100 <= ($unsigned((8'hbc)) << ($unsigned(wire90) ?
                  {(^$unsigned(reg95)),
                      $signed(reg96[(3'h6):(2'h2)])} : (8'hb8)));
              reg101 <= (($unsigned(($signed(wire91) ~^ reg98)) ?
                  (8'h9f) : wire92[(4'h9):(3'h7)]) < ($unsigned(($signed(reg100) ^ wire91[(2'h3):(1'h1)])) ?
                  $unsigned({$unsigned(reg97)}) : (^$unsigned((wire88 ?
                      reg95 : reg97)))));
            end
          else
            begin
              reg99 <= wire90[(2'h2):(2'h2)];
              reg100 <= wire92;
              reg101 <= $unsigned((((8'ha9) ?
                      ((~&reg93) >>> $unsigned(reg99)) : {(^~reg100)}) ?
                  (+((reg98 > reg93) << (reg99 ? reg94 : reg95))) : reg95));
              reg102 <= reg96;
            end
          reg103 <= (reg97[(1'h0):(1'h0)] ?
              ((8'hab) ?
                  reg102[(4'h9):(4'h9)] : $unsigned((((8'hb8) ? reg96 : reg94) ?
                      (reg96 ?
                          reg97 : reg95) : $signed(wire88)))) : $signed(reg95[(3'h6):(3'h4)]));
          reg104 <= $unsigned($signed($signed(reg93)));
        end
      else
        begin
          reg94 <= reg99[(1'h0):(1'h0)];
        end
      reg105 <= $unsigned($unsigned(reg103));
      reg106 <= $signed(reg94);
    end
  assign wire107 = (|(wire91 ?
                       ($unsigned($unsigned(reg103)) ?
                           $unsigned((!reg95)) : reg93[(2'h3):(1'h0)]) : (wire91[(1'h0):(1'h0)] + ((reg103 <<< reg100) * (8'ha7)))));
  assign wire108 = $unsigned({(|reg93[(4'he):(1'h1)])});
  assign wire109 = $unsigned($signed(wire89));
  assign wire110 = reg98;
  assign wire111 = (($signed(reg102) ?
                       ({reg104} * (!(~|reg98))) : (wire89[(2'h2):(1'h1)] ?
                           $signed(reg106) : (wire107 || $unsigned(wire91)))) ^~ $signed(wire107));
  always
    @(posedge clk) begin
      reg112 <= {$signed(reg104[(2'h3):(1'h1)])};
    end
  assign wire113 = {reg99[(3'h4):(3'h4)],
                       $signed(((|(reg106 == wire107)) || $signed(wire109[(4'hc):(4'hc)])))};
  assign wire114 = $unsigned($unsigned($signed($signed($unsigned((8'h9f))))));
  assign wire115 = reg94[(3'h5):(2'h2)];
  assign wire116 = {$signed(($signed({reg105}) <<< reg95[(3'h4):(3'h4)]))};
  assign wire117 = reg95[(1'h1):(1'h0)];
  assign wire118 = $signed(reg93);
  assign wire119 = {(8'hb2), {reg112}};
  assign wire120 = wire107[(1'h1):(1'h1)];
  assign wire121 = {($unsigned($unsigned(reg103[(3'h4):(1'h0)])) ?
                           ({$signed(reg103)} | ({reg105} ?
                               (wire88 ?
                                   reg98 : (8'hb0)) : reg103)) : $signed($unsigned($unsigned(wire119))))};
  assign wire122 = wire91[(1'h1):(1'h1)];
  assign wire123 = reg103;
  assign wire124 = reg99[(3'h4):(2'h3)];
  assign wire125 = {{{$signed(reg99), wire116[(2'h3):(1'h1)]}, (^~wire89)}};
  always
    @(posedge clk) begin
      reg126 <= wire114[(3'h6):(1'h1)];
      reg127 <= (~^reg96[(3'h6):(1'h0)]);
    end
  assign wire128 = (({($signed(reg97) ?
                                   (wire114 ? reg102 : wire113) : (^wire125))} ?
                           wire90[(1'h1):(1'h1)] : $unsigned(((wire116 ?
                                   (8'hbe) : (8'ha4)) ?
                               $signed(wire89) : $signed(reg104)))) ?
                       wire91 : (|wire119));
endmodule
