module top
#(parameter param79 = {(((+((8'ha1) ? (8'ha4) : (8'hb0))) && (~((8'hbd) != (8'hbd)))) ? ((((8'hb0) != (8'hba)) ? ((8'hb1) <<< (8'hb8)) : ((8'ha0) ? (8'h9e) : (7'h44))) ? ((~&(7'h41)) ? ((8'ha6) != (8'hb9)) : ((8'haf) ? (8'hb4) : (8'hae))) : (^((8'h9c) ? (8'hbf) : (8'ha8)))) : {(~((8'hb7) ? (8'hae) : (8'hab))), {((7'h43) * (8'hbe)), ((8'hb0) ? (8'h9d) : (8'hb6))}}), {((|((8'ha3) >= (8'hb2))) && ((&(8'hb8)) && {(8'h9f)}))}}, 
parameter param80 = (param79 && ((param79 ? param79 : param79) <<< ({{param79, param79}, (param79 < param79)} ? param79 : ({param79, param79} <<< (param79 >>> param79))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire51;
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire51,
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
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire4 = (wire1 ?
                     wire3[(5'h10):(2'h3)] : {$unsigned(wire1),
                         $signed((-$unsigned(wire0)))});
  assign wire5 = ((($signed(wire4[(1'h0):(1'h0)]) ?
                         $unsigned($signed((8'hbe))) : wire2[(3'h6):(3'h6)]) ?
                     wire2 : wire4[(3'h5):(1'h0)]) < (~wire4[(3'h4):(1'h1)]));
  assign wire6 = $signed(((~$unsigned(wire2)) ?
                     (~^(~$unsigned(wire5))) : {wire1}));
  assign wire7 = wire4;
  assign wire8 = (({$unsigned(wire7[(4'hb):(1'h1)]),
                     wire5} < $signed(wire3)) * (((-(8'had)) ?
                         $unsigned($signed(wire2)) : wire1[(2'h3):(1'h0)]) ?
                     wire6 : ($signed((wire1 >= wire7)) ?
                         ((8'ha3) ?
                             (wire3 >> wire7) : {wire0}) : wire5[(4'hf):(4'h9)])));
  assign wire9 = wire0;
  module10 #() modinst52 (.wire12(wire3), .wire13(wire6), .y(wire51), .wire11(wire2), .wire14(wire9), .clk(clk), .wire15(wire5));
  always
    @(posedge clk) begin
      if (($signed($unsigned(($signed((8'hba)) >= wire4))) * (wire4 ?
          wire0[(1'h0):(1'h0)] : ($unsigned($unsigned(wire51)) ?
              (+$signed(wire3)) : (wire51[(2'h2):(1'h1)] ?
                  {(8'ha2)} : (-wire4))))))
        begin
          reg53 <= {wire3[(4'he):(4'hd)]};
          if (wire2)
            begin
              reg54 <= wire4[(1'h1):(1'h0)];
              reg55 <= wire51;
              reg56 <= wire7[(2'h3):(1'h1)];
              reg57 <= $signed({(((8'hb4) * $signed(wire6)) ?
                      $unsigned($signed(wire1)) : $unsigned({wire5, wire9})),
                  wire3[(2'h2):(2'h2)]});
              reg58 <= $unsigned(wire6);
            end
          else
            begin
              reg54 <= reg54;
              reg55 <= {$signed((wire51[(2'h2):(2'h2)] > $unsigned($signed((8'hba))))),
                  $signed($signed((reg56[(1'h1):(1'h1)] == (~^reg58))))};
            end
          if ((~&wire3[(4'hf):(4'hc)]))
            begin
              reg59 <= wire5[(2'h3):(2'h2)];
              reg60 <= reg56;
              reg61 <= (^$signed({(+reg54[(4'h9):(2'h2)])}));
              reg62 <= (~^$unsigned(({$signed(reg55)} ?
                  {wire0[(2'h2):(1'h0)]} : wire3[(3'h7):(3'h6)])));
            end
          else
            begin
              reg59 <= wire51[(3'h4):(1'h0)];
              reg60 <= reg57;
            end
          if ($unsigned(wire5))
            begin
              reg63 <= reg54[(3'h6):(3'h5)];
              reg64 <= wire6[(1'h0):(1'h0)];
              reg65 <= {$unsigned(reg63[(1'h1):(1'h1)])};
            end
          else
            begin
              reg63 <= reg55;
              reg64 <= (+(wire6[(4'ha):(3'h6)] ?
                  $unsigned((reg62[(1'h1):(1'h1)] && (~|wire6))) : (wire0[(2'h3):(1'h0)] ?
                      ($signed((7'h41)) ?
                          (reg57 ?
                              wire1 : wire0) : (reg55 | wire8)) : $unsigned({reg54,
                          reg55}))));
              reg65 <= $signed(reg54);
              reg66 <= (!((~{wire51}) ?
                  {((reg55 ? reg59 : reg55) >= (7'h43)),
                      {reg61[(4'h8):(3'h5)],
                          (^reg55)}} : reg56[(4'h9):(3'h6)]));
            end
        end
      else
        begin
          reg53 <= ((reg58[(1'h0):(1'h0)] >> reg62[(2'h2):(1'h0)]) ?
              (^wire5[(3'h6):(1'h1)]) : (reg64 ?
                  (wire9[(4'h8):(4'h8)] * {(wire51 != reg62),
                      reg56}) : ({(~(8'h9c)), $unsigned(wire5)} ?
                      {$unsigned(wire7), (~|reg66)} : ((wire1 ? wire1 : reg62) ?
                          wire0 : reg64))));
          reg54 <= (~$signed(wire3[(1'h0):(1'h0)]));
          if (($signed((&$signed((reg56 == (8'hb6))))) ?
              {(+{(wire5 ? reg59 : wire4), $signed(wire5)}),
                  (8'hbd)} : ((~|(&reg66[(2'h2):(1'h1)])) ?
                  {reg64[(3'h4):(3'h4)]} : reg59[(4'h9):(4'h8)])))
            begin
              reg55 <= {(-(7'h44)),
                  (-(($unsigned(wire0) & $signed(wire9)) * (8'h9c)))};
              reg56 <= wire9[(3'h4):(2'h2)];
              reg57 <= wire3[(4'h8):(3'h4)];
              reg58 <= wire2[(3'h5):(1'h1)];
            end
          else
            begin
              reg55 <= $unsigned((($unsigned(reg63) ?
                      ((&wire9) ^ $unsigned(reg58)) : (~^$unsigned(wire6))) ?
                  $unsigned(reg64) : (reg61 ?
                      $unsigned((reg59 ? reg61 : (8'hbc))) : ($signed(wire5) ?
                          $unsigned(wire2) : (reg59 ? reg62 : (8'had))))));
            end
          if ((((~&((^(8'ha7)) != reg55[(2'h3):(1'h0)])) != ({$unsigned(wire0)} - (wire7 ?
              $signed(reg64) : $signed((8'hb8))))) > reg57))
            begin
              reg59 <= $unsigned($unsigned(({(reg58 ? (7'h41) : reg53),
                  $signed(reg65)} >>> wire0)));
              reg60 <= wire51[(1'h0):(1'h0)];
            end
          else
            begin
              reg59 <= $unsigned(((|reg65[(2'h3):(2'h3)]) & $unsigned(reg63)));
              reg60 <= ($signed(({reg61, (reg62 ? reg64 : reg60)} ?
                  $unsigned(wire3[(4'h9):(4'h9)]) : reg53[(3'h7):(3'h4)])) & $signed(reg59));
              reg61 <= $unsigned($unsigned(($signed(reg64[(2'h2):(1'h1)]) ?
                  $signed($signed((8'ha6))) : {reg61[(2'h2):(1'h0)],
                      reg53[(4'h8):(3'h6)]})));
            end
        end
      reg67 <= $unsigned($unsigned(wire3[(3'h6):(3'h6)]));
      reg68 <= $signed($signed($signed((~(wire8 ^~ reg55)))));
      if (wire8[(2'h2):(2'h2)])
        begin
          if ($unsigned($signed($signed($unsigned(reg56[(2'h3):(2'h2)])))))
            begin
              reg69 <= ((-($unsigned(reg67) ?
                  wire7 : {((8'hae) ? wire5 : reg61),
                      $signed((8'hba))})) << $unsigned(reg53[(3'h6):(3'h6)]));
              reg70 <= $unsigned($unsigned((~^$signed(reg66[(3'h4):(1'h0)]))));
              reg71 <= $signed(($unsigned(($signed(wire8) <<< ((8'haf) && wire0))) ?
                  $unsigned(reg59) : reg64[(4'hb):(3'h4)]));
              reg72 <= {(~&reg65)};
              reg73 <= reg59[(5'h11):(3'h7)];
            end
          else
            begin
              reg69 <= $unsigned(({$signed((|(8'hb9)))} ^ ($signed($unsigned(wire5)) ?
                  ({wire6, reg69} ?
                      (wire51 ? (8'ha0) : wire6) : (reg67 ?
                          wire3 : reg69)) : reg62)));
              reg70 <= {((((reg59 == (8'ha0)) ? reg58 : wire4) ?
                          wire7[(3'h4):(3'h4)] : (~(~|reg57))) ?
                      $signed($unsigned($signed(reg73))) : (reg59[(4'hd):(4'hd)] != (^~{reg66,
                          reg66}))),
                  (reg53 ?
                      ((-$unsigned(reg70)) < $signed($signed(reg53))) : $unsigned($unsigned((^~reg72))))};
              reg71 <= (8'ha0);
              reg72 <= (~$signed((reg69 ?
                  ((-reg56) * (+reg53)) : $signed(reg59))));
              reg73 <= $signed((+reg66[(3'h6):(3'h6)]));
            end
          if (((($unsigned(reg63[(3'h6):(2'h3)]) ?
                      (reg73 ?
                          $unsigned(wire8) : (reg60 ?
                              reg67 : reg63)) : (&(&reg63))) ?
                  (~&$signed(reg63)) : reg62[(2'h2):(1'h0)]) ?
              (reg57[(3'h7):(3'h5)] >>> $unsigned(wire4)) : $unsigned((($signed(reg68) ?
                  {wire51} : reg70[(4'hd):(1'h1)]) >> ($signed((8'hbf)) ?
                  $signed(reg56) : (~^(8'hb7)))))))
            begin
              reg74 <= reg73;
            end
          else
            begin
              reg74 <= $signed($unsigned(wire0));
              reg75 <= (({$signed(wire2)} ^ reg53) ~^ reg70);
              reg76 <= ((reg71 ? reg74 : reg59) ?
                  $unsigned($signed(((wire6 || (8'ha2)) ?
                      reg63[(2'h2):(2'h2)] : wire2[(4'h9):(4'h9)]))) : {(|(8'hbc)),
                      $signed(wire0[(1'h1):(1'h0)])});
              reg77 <= (-wire4[(3'h6):(1'h1)]);
              reg78 <= (&($signed($unsigned($unsigned(wire7))) < {reg71}));
            end
        end
      else
        begin
          reg69 <= (|(reg64 ^ (~^$signed((wire6 ? reg71 : (8'hb6))))));
        end
    end
endmodule

module module10
#(parameter param49 = (((+(~^(&(8'hbb)))) && (8'ha3)) ? (((|(8'hb0)) >>> (((8'ha3) ? (8'hbc) : (7'h41)) == (+(8'hae)))) ~^ (8'haa)) : (8'ha6)), 
parameter param50 = param49)
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire13;
  input wire [(4'h8):(1'h0)] wire12;
  input wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire22,
                 wire21,
                 wire20,
                 wire17,
                 wire16,
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
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire16 = $unsigned($unsigned(wire14[(2'h3):(2'h3)]));
  assign wire17 = $unsigned((wire16[(3'h5):(3'h4)] >= ($unsigned($signed(wire11)) < $unsigned((~&wire16)))));
  always
    @(posedge clk) begin
      reg18 <= $signed((~^wire16));
      reg19 <= (({$unsigned((^wire16))} >> ((reg18[(1'h0):(1'h0)] >> (-wire13)) ?
              wire14 : wire12[(1'h1):(1'h1)])) ?
          $signed($signed($signed(wire16[(1'h0):(1'h0)]))) : ($unsigned(wire16[(2'h2):(2'h2)]) >= ($signed(wire17[(4'h9):(4'h9)]) ?
              {{wire17}} : ((^reg18) | (wire14 ? wire16 : (8'hba))))));
    end
  assign wire20 = (&reg19);
  assign wire21 = $unsigned({(!wire20), wire11[(1'h0):(1'h0)]});
  assign wire22 = (^~((wire12 || {(~wire12),
                      (^~wire20)}) >> (~&$unsigned((wire20 ?
                      wire12 : reg19)))));
  always
    @(posedge clk) begin
      if (({(!wire13)} >> wire13[(3'h4):(3'h4)]))
        begin
          reg23 <= wire21[(4'ha):(4'h8)];
          reg24 <= ($signed(($signed(wire11) ?
                  {$unsigned(wire13)} : ($unsigned(wire13) ?
                      (!wire14) : wire20))) ?
              $unsigned((^wire13[(3'h5):(2'h3)])) : $unsigned(wire15[(2'h2):(1'h0)]));
        end
      else
        begin
          reg23 <= (-$signed(reg23));
          reg24 <= reg18;
        end
      reg25 <= ((+reg19[(3'h7):(2'h3)]) ?
          (-$unsigned(((-(8'ha2)) ^ (wire12 ? reg24 : wire16)))) : wire20);
      if (reg23)
        begin
          reg26 <= ((reg19 ?
              wire13 : $signed((~&wire12[(4'h8):(2'h3)]))) >>> ((^{(wire11 ?
                  reg25 : wire12)}) ^ $unsigned(reg24[(5'h14):(5'h14)])));
          if (wire22)
            begin
              reg27 <= wire14[(3'h5):(2'h2)];
              reg28 <= wire14;
              reg29 <= ($unsigned(wire12) ?
                  (~|(reg27[(3'h6):(2'h2)] ^~ {reg19[(1'h0):(1'h0)]})) : wire16);
              reg30 <= $unsigned(wire22);
            end
          else
            begin
              reg27 <= (wire14[(4'hd):(4'hd)] <= (8'hb3));
              reg28 <= reg23;
              reg29 <= ($signed((wire22[(3'h6):(2'h2)] ?
                  wire15[(3'h7):(3'h4)] : (wire11 | (^~(8'ha3))))) - ((wire17 ?
                  (wire11[(1'h0):(1'h0)] << ((8'hbc) ^ reg26)) : $signed((!reg23))) >= reg29));
            end
          if (wire17[(3'h7):(3'h4)])
            begin
              reg31 <= (~|(8'hb6));
            end
          else
            begin
              reg31 <= $signed((((8'ha2) || ((reg30 + (7'h44)) ?
                  (wire12 == (8'h9e)) : (wire12 >= reg30))) == (reg23[(1'h0):(1'h0)] != reg26[(1'h0):(1'h0)])));
              reg32 <= wire14;
              reg33 <= reg30;
              reg34 <= wire13;
              reg35 <= reg28;
            end
          if ($signed($unsigned($unsigned(wire22[(3'h4):(3'h4)]))))
            begin
              reg36 <= reg18;
              reg37 <= (reg23 ~^ (($signed((8'ha5)) ?
                      {wire14, (wire14 ~^ (8'haf))} : (~^(reg28 * wire22))) ?
                  (~wire12) : {$unsigned(wire14), wire21}));
              reg38 <= ($signed((8'ha9)) - $unsigned(((+reg27) >>> ((wire15 ?
                      reg19 : (8'ha5)) ?
                  (~|reg31) : {reg29, reg31}))));
              reg39 <= {reg28[(4'hc):(4'hb)],
                  $unsigned(($unsigned(wire15[(4'h9):(3'h7)]) <= $unsigned((wire21 ?
                      wire21 : reg24))))};
            end
          else
            begin
              reg36 <= $unsigned($unsigned(wire14[(2'h3):(1'h0)]));
              reg37 <= $signed({$unsigned(wire14)});
            end
        end
      else
        begin
          reg26 <= {$unsigned(reg38[(4'he):(3'h7)])};
          reg27 <= $unsigned(wire20[(3'h7):(3'h4)]);
          reg28 <= ((~&({(&(8'h9c))} ?
              (wire21 ^~ $signed(reg24)) : $signed(((8'hbe) + reg34)))) * (reg35[(3'h5):(2'h2)] != (-(~reg23[(2'h2):(2'h2)]))));
          reg29 <= $unsigned(($signed($unsigned((reg33 - wire20))) ?
              reg31 : reg36));
        end
      reg40 <= (8'hac);
    end
  assign wire41 = $unsigned((!(|(8'hb7))));
  assign wire42 = $unsigned($signed($signed($signed((wire16 >>> reg26)))));
  assign wire43 = {$unsigned(reg18[(2'h3):(1'h0)])};
  assign wire44 = ((~|$signed(($unsigned(reg18) ? $signed(reg31) : wire41))) ?
                      (reg18[(2'h2):(1'h0)] ~^ reg29) : ((~(wire21 ?
                          reg30 : wire41[(4'h9):(3'h6)])) && reg29));
  assign wire45 = (+(wire11[(3'h5):(1'h1)] > $signed(((-wire17) != (8'had)))));
  assign wire46 = (^~reg33[(2'h2):(1'h0)]);
  assign wire47 = reg27[(4'h8):(3'h4)];
  assign wire48 = (($unsigned(($unsigned(reg29) - $signed(reg27))) >= $unsigned(wire22)) ?
                      $signed($unsigned((wire22 ?
                          $unsigned(reg31) : {wire44,
                              wire41}))) : $signed(({$unsigned(reg25)} | (!(+wire15)))));
endmodule
