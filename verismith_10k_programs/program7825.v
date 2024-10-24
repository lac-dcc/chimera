module top
#(parameter param98 = ((&{(+(&(8'ha6)))}) ? (~|((((8'hac) < (8'ha3)) == (!(8'had))) * (~|(8'ha2)))) : {((((8'hae) >>> (8'hb1)) ? (8'hab) : ((8'hac) < (8'ha5))) + (~^(8'ha5))), {((~(8'h9c)) ? ((8'ha8) - (8'h9e)) : (^(8'ha6)))}}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  wire [(2'h2):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire92;
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire92,
                 (1'h0)};
  assign wire4 = (wire1 * wire0);
  assign wire5 = (&{((~|$unsigned(wire1)) - (-(|wire2)))});
  assign wire6 = ($unsigned(((~^(wire2 ? (8'hbf) : wire5)) ?
                     (7'h40) : $unsigned((&wire1)))) ^~ (({(wire2 ?
                             wire2 : wire1),
                         wire5[(2'h2):(2'h2)]} ?
                     $unsigned((~^wire4)) : (wire2[(1'h1):(1'h0)] ?
                         wire4[(1'h0):(1'h0)] : $signed(wire4))) > wire2));
  assign wire7 = (^~(-$signed((8'hac))));
  assign wire8 = (8'haa);
  assign wire9 = ({($signed((wire5 ? wire0 : wire1)) > {(~|wire4),
                             (wire4 ^ (8'hbe))})} ?
                     $unsigned(wire5) : ({{(wire6 ? wire1 : (8'hae)),
                                 (wire5 ~^ wire5)},
                             ({wire6} ? wire6[(3'h4):(1'h0)] : wire7)} ?
                         $unsigned(($unsigned((7'h44)) ~^ $signed(wire5))) : $signed(({wire0,
                             wire8} >= (^(7'h40))))));
  assign wire10 = ($signed(wire5[(1'h0):(1'h0)]) || wire5[(2'h2):(1'h1)]);
  assign wire11 = (((-$unsigned((wire7 ? wire7 : wire2))) ?
                      $unsigned(wire8) : wire10[(2'h2):(1'h0)]) <<< (wire1[(2'h3):(1'h1)] ~^ wire8));
  assign wire12 = (|wire10[(2'h2):(1'h0)]);
  module13 #() modinst93 (wire92, clk, wire9, wire2, wire3, wire1, wire6);
  assign wire94 = $signed(($unsigned(wire0) * (wire12[(3'h7):(3'h6)] ^ (~$unsigned(wire6)))));
  assign wire95 = wire10;
  assign wire96 = {$unsigned((&$signed((wire9 ^ (8'ha4)))))};
  assign wire97 = (~|{$signed(wire6),
                      ((wire12[(4'h9):(1'h1)] ?
                          {wire94,
                              wire3} : wire5[(1'h1):(1'h0)]) || $unsigned(wire11[(4'ha):(3'h6)]))});
endmodule

module module13
#(parameter param91 = (8'hb4))
(y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire15;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire55;
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire72,
                 wire57,
                 wire19,
                 wire55,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
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
                 (1'h0)};
  assign wire19 = wire18;
  module20 #() modinst56 (wire55, clk, wire15, wire14, wire18, wire19, wire17);
  assign wire57 = (!{(wire55[(4'hd):(4'hb)] & (wire16[(3'h7):(3'h6)] != $unsigned(wire14))),
                      ((~wire18[(4'hd):(3'h4)]) <= wire15)});
  always
    @(posedge clk) begin
      if ({(wire57[(2'h2):(1'h0)] ?
              (wire19[(4'hc):(4'ha)] & $unsigned((wire19 && (8'h9f)))) : ($unsigned({(8'hb9)}) ?
                  $signed((wire57 == (8'ha8))) : wire55)),
          wire18})
        begin
          reg58 <= ((wire18[(4'hd):(2'h3)] != (wire55 ?
              $signed({wire57}) : $unsigned(wire16[(3'h5):(3'h4)]))) && (((^~$signed(wire19)) & (wire19[(4'hb):(3'h7)] ?
                  (wire14 + wire16) : wire55)) ?
              (wire57[(3'h6):(3'h5)] * ($signed(wire18) >= (wire16 >= wire19))) : $signed($unsigned((+wire55)))));
          if (wire18)
            begin
              reg59 <= $signed({wire17[(4'h9):(3'h4)],
                  {(-wire15[(5'h10):(1'h0)]), {wire55[(4'ha):(1'h0)]}}});
              reg60 <= ((~^wire16[(3'h4):(1'h1)]) - $unsigned(({wire17,
                      (&(8'ha6))} ?
                  $unsigned((wire17 ? wire17 : reg59)) : $unsigned(wire19))));
              reg61 <= reg58[(3'h5):(3'h5)];
              reg62 <= $unsigned((((reg61[(4'ha):(2'h3)] ?
                  wire19 : ((8'ha3) ?
                      reg60 : reg58)) != ($signed(wire19) <= ((7'h42) ?
                  wire18 : wire16))) << $signed(($signed(reg58) ^ (!wire17)))));
            end
          else
            begin
              reg59 <= $signed(wire14);
              reg60 <= (+$unsigned(($unsigned((^wire17)) != (^(|(8'h9d))))));
              reg61 <= $unsigned(($unsigned(($signed(wire14) ?
                      $signed(reg59) : $unsigned(wire57))) ?
                  wire18[(3'h5):(3'h5)] : {($unsigned(wire19) == $signed((8'hbd)))}));
            end
          if ({(wire57[(2'h3):(1'h0)] ?
                  wire19 : (((~|(8'hb0)) ?
                          (reg60 - (8'hb9)) : (wire55 | wire19)) ?
                      (wire14[(4'ha):(3'h4)] || $signed(wire17)) : (8'h9e))),
              $signed((~&({reg60, wire19} * (8'ha4))))})
            begin
              reg63 <= $unsigned(($signed(reg61[(2'h2):(1'h1)]) ?
                  (~&(8'ha5)) : (^~reg61)));
              reg64 <= $unsigned(($unsigned($unsigned($signed(wire16))) < $signed({(~&reg60),
                  {reg61, wire55}})));
              reg65 <= {wire18, ((8'hac) == (~^$signed($unsigned((8'hb6)))))};
              reg66 <= ($unsigned(reg65) ? wire57 : $signed(wire55));
              reg67 <= reg66[(1'h0):(1'h0)];
            end
          else
            begin
              reg63 <= $unsigned($unsigned((wire16 ?
                  {(wire14 == (8'hb1)),
                      {wire17, wire17}} : wire55[(5'h12):(3'h4)])));
              reg64 <= (!($signed((8'hb1)) ?
                  $unsigned(((&wire57) ?
                      (reg61 ?
                          (8'hba) : reg63) : reg66[(1'h1):(1'h1)])) : {(~wire55),
                      wire19[(1'h1):(1'h1)]}));
            end
          reg68 <= wire16[(3'h7):(1'h1)];
        end
      else
        begin
          reg58 <= $signed(reg62);
          if ((&(+(+$signed((^reg59))))))
            begin
              reg59 <= {(|(((reg58 | reg61) ?
                      (8'hae) : $unsigned(reg66)) - wire17[(1'h1):(1'h0)])),
                  $signed(reg67)};
            end
          else
            begin
              reg59 <= (^~(wire19[(4'hb):(3'h7)] ?
                  reg58[(3'h7):(2'h3)] : reg63[(2'h3):(2'h2)]));
              reg60 <= (reg65 >> $signed($unsigned({reg64})));
              reg61 <= (reg67[(4'h8):(1'h0)] ?
                  (^~{wire55[(3'h5):(2'h3)]}) : $unsigned($signed($signed($unsigned(wire18)))));
            end
          reg62 <= (reg65[(1'h1):(1'h0)] | ($unsigned(({reg65, (8'hb8)} ?
                  reg62 : reg67)) ?
              wire14[(5'h11):(1'h1)] : ((|reg59) ?
                  $unsigned($unsigned(reg60)) : $unsigned((8'hb2)))));
        end
      reg69 <= $signed({reg64});
      reg70 <= ((~^($signed({wire57,
          reg64}) | reg59[(4'h8):(4'h8)])) >> ($signed(reg69[(4'hd):(3'h6)]) + (({wire14,
              reg61} ?
          (|wire19) : (reg61 ~^ wire16)) << {reg69[(1'h0):(1'h0)],
          (reg58 ? wire15 : reg66)})));
      reg71 <= (reg68 | (+((~|reg61) ?
          (wire18 && (reg58 ^~ wire19)) : (reg67 ?
              reg67[(2'h3):(2'h2)] : $unsigned(reg64)))));
    end
  assign wire72 = (wire14[(4'hf):(4'hf)] || (wire16 + (($signed(reg68) > ((8'h9c) << wire57)) ?
                      reg69 : $signed((wire14 ? wire17 : (8'ha1))))));
  always
    @(posedge clk) begin
      reg73 <= wire18[(3'h6):(3'h6)];
      reg74 <= ($signed($signed($signed(wire17[(2'h3):(1'h1)]))) ?
          reg67[(4'h8):(1'h0)] : ({reg70[(2'h3):(2'h2)]} * reg71[(4'he):(4'hd)]));
      if (({((reg63 || (reg59 ? wire72 : reg62)) != $signed(reg73)),
          ($signed((~&reg73)) ?
              wire57 : $signed((wire55 && wire16)))} << wire17[(3'h7):(2'h3)]))
        begin
          if ($signed(reg58[(4'h9):(1'h1)]))
            begin
              reg75 <= (~|$unsigned(reg73));
              reg76 <= ($unsigned(wire17[(3'h7):(3'h6)]) ?
                  ($signed($unsigned(reg60)) ?
                      {((reg73 <<< reg68) ?
                              wire17[(4'hb):(3'h4)] : $unsigned((8'h9d)))} : $unsigned(($signed((8'haa)) < wire57))) : {{($unsigned(reg68) ?
                              $signed(reg67) : (reg68 >>> (8'hb1)))}});
              reg77 <= (8'hab);
            end
          else
            begin
              reg75 <= (8'hb1);
              reg76 <= reg73;
              reg77 <= (^($unsigned(({reg66, reg60} ?
                      $signed(wire17) : reg68[(4'hf):(4'h8)])) ?
                  $unsigned(((reg64 & wire55) + reg61[(4'h9):(3'h7)])) : reg66));
              reg78 <= $unsigned(reg64);
            end
          reg79 <= (8'hb5);
          reg80 <= reg65;
          reg81 <= reg78[(1'h1):(1'h0)];
          if (reg66[(1'h1):(1'h1)])
            begin
              reg82 <= $unsigned({wire17[(1'h1):(1'h1)], reg64[(1'h1):(1'h1)]});
              reg83 <= $signed((reg80[(3'h6):(3'h5)] ~^ {reg58}));
              reg84 <= $unsigned({{reg66[(3'h6):(3'h6)]},
                  (((wire14 - reg61) == $signed(reg79)) && reg82)});
              reg85 <= $unsigned($signed(reg78[(3'h4):(1'h0)]));
            end
          else
            begin
              reg82 <= (~^(({$signed(reg62), (!wire55)} ?
                  wire14[(3'h4):(2'h3)] : (reg69 ^~ (7'h44))) >> ((&wire18[(3'h6):(2'h3)]) ?
                  $unsigned((8'ha1)) : wire15[(4'he):(4'ha)])));
              reg83 <= (~^(($signed((reg61 ? wire57 : reg66)) ?
                  (((8'h9d) ? reg69 : wire55) ?
                      (~^reg82) : (~reg58)) : (&$unsigned(wire55))) & reg63));
            end
        end
      else
        begin
          if ((wire16[(2'h3):(2'h3)] ?
              reg85[(1'h1):(1'h1)] : ((reg75[(2'h2):(1'h1)] ?
                      ({reg74} & {reg82}) : ($unsigned(reg85) && reg74[(1'h1):(1'h1)])) ?
                  $unsigned(reg82[(3'h6):(1'h0)]) : ({$unsigned((8'hb5)),
                      (reg68 ?
                          (8'hba) : reg75)} <<< $unsigned(wire19[(3'h7):(1'h0)])))))
            begin
              reg75 <= $signed((8'hb6));
            end
          else
            begin
              reg75 <= (8'hbf);
              reg76 <= (((|(|{reg67})) > reg62[(4'ha):(3'h4)]) ?
                  $unsigned(((reg79 | $signed((8'ha9))) ^ reg80[(1'h1):(1'h1)])) : wire16[(1'h0):(1'h0)]);
              reg77 <= (^(!$signed($signed($unsigned(wire72)))));
              reg78 <= (reg58[(4'hd):(3'h5)] ?
                  (($unsigned(((8'ha5) > reg76)) ?
                          wire55 : ((wire17 >> reg70) ?
                              $unsigned(wire72) : $unsigned((8'haf)))) ?
                      wire17 : $unsigned((^(~reg64)))) : (reg80 ?
                      $signed((reg80[(4'ha):(2'h3)] ?
                          (reg77 ? reg68 : reg79) : ((8'haf) ?
                              reg62 : reg65))) : reg84[(2'h3):(1'h1)]));
              reg79 <= ($unsigned((reg58[(4'hc):(3'h7)] ?
                  {(reg84 >= wire72)} : {reg82[(2'h2):(2'h2)]})) - (!$signed(reg74)));
            end
          reg80 <= reg74[(3'h7):(1'h0)];
        end
      reg86 <= $signed(reg67[(2'h2):(1'h1)]);
      reg87 <= ({wire55[(5'h12):(4'hc)]} ?
          {(+reg82[(1'h1):(1'h0)]),
              ((reg65 + $signed(wire19)) == ((reg80 ? reg76 : reg78) ?
                  reg67 : (reg75 ? reg67 : wire14)))} : $unsigned((((reg63 ?
              wire18 : reg86) & $signed(reg64)) != (~$unsigned(reg79)))));
    end
  assign wire88 = (((8'ha4) ?
                      reg68[(4'he):(4'h8)] : (((~&reg84) ?
                          (wire14 ?
                              wire72 : wire18) : $unsigned((8'hac))) < (reg74 ?
                          (reg87 <<< (8'hbb)) : reg79[(4'ha):(2'h2)]))) ^~ (wire16 ^~ reg62));
  assign wire89 = $signed($signed(((8'haf) <<< $unsigned($signed(reg63)))));
  assign wire90 = {{$signed((((8'ha4) ? wire17 : (7'h43)) ^~ (|reg78))),
                          reg66[(2'h3):(2'h3)]},
                      reg85};
endmodule

module module20
#(parameter param53 = {(((^~{(7'h44)}) > (~|{(8'ha5)})) ? (-(((8'hb7) ~^ (8'ha1)) | (|(8'hb8)))) : ({((8'ha6) ? (8'h9d) : (8'hb0))} ? (!((8'hac) ? (8'hab) : (8'had))) : (((8'ha8) <<< (7'h40)) & (^~(8'hbb)))))}, 
parameter param54 = (((-(((8'hba) ? param53 : param53) ? (param53 - param53) : (param53 ? param53 : (8'h9d)))) - ((param53 ? (param53 ? param53 : param53) : (^param53)) ? param53 : (^~(param53 ? param53 : param53)))) >= param53))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire25;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire signed [(5'h12):(1'h0)] wire22;
  input wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire26;
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire34,
                 wire33,
                 wire32,
                 wire26,
                 reg45,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire26 = $signed((wire21[(2'h3):(2'h2)] ?
                      (wire21[(3'h4):(1'h0)] || wire21[(3'h6):(3'h4)]) : (-(wire22[(4'he):(1'h1)] ?
                          (wire22 ? wire25 : (8'hbd)) : {wire21}))));
  always
    @(posedge clk) begin
      reg27 <= $unsigned(((wire22 ? wire25[(5'h10):(4'hd)] : (8'ha8)) ?
          $signed($unsigned(wire26[(3'h6):(2'h3)])) : wire21[(3'h4):(1'h1)]));
      reg28 <= wire25;
      reg29 <= reg28[(4'ha):(3'h6)];
      reg30 <= (~|(~&$unsigned(($signed(wire25) ?
          (wire23 ? wire23 : wire25) : ((8'ha4) <<< wire26)))));
      reg31 <= $signed($signed((!$unsigned(wire22[(3'h6):(1'h1)]))));
    end
  assign wire32 = (+$signed(wire22));
  assign wire33 = {{(~&$signed($unsigned(reg29))), reg30[(2'h2):(2'h2)]}};
  assign wire34 = wire26;
  always
    @(posedge clk) begin
      reg35 <= ((~&$unsigned((^(^~wire21)))) ?
          wire32[(1'h1):(1'h1)] : reg29[(4'h8):(3'h6)]);
      reg36 <= (^(!(~|(wire24 || wire22[(3'h4):(3'h4)]))));
      reg37 <= $unsigned($unsigned({$unsigned($unsigned(wire22))}));
      reg38 <= wire33[(3'h7):(1'h0)];
      if ($unsigned((&$unsigned({$signed(wire22)}))))
        begin
          reg39 <= ((~^reg29) ?
              {(({reg27, wire22} ?
                      (wire34 <<< reg37) : (!wire33)) >>> ((~^wire24) <<< (reg38 ?
                      reg37 : wire21))),
                  reg28[(3'h6):(3'h5)]} : $unsigned((reg37[(4'hf):(1'h0)] ?
                  wire32[(3'h6):(1'h1)] : ({reg31, reg36} ?
                      (reg37 ? wire34 : wire34) : reg30[(1'h0):(1'h0)]))));
          if (reg36)
            begin
              reg40 <= reg30;
            end
          else
            begin
              reg40 <= ($unsigned((((8'had) ? reg35[(4'h8):(2'h2)] : (^reg27)) ?
                      (&(wire26 - wire22)) : (|$signed(reg39)))) ?
                  wire26 : $signed((8'ha9)));
              reg41 <= $unsigned((|{(8'hae),
                  (wire26[(5'h10):(4'hb)] <<< reg31)}));
              reg42 <= reg37;
              reg43 <= (~&(($signed($unsigned(reg36)) <<< $signed((wire24 && reg37))) * (~wire25[(3'h6):(1'h1)])));
            end
        end
      else
        begin
          if ((~^wire24))
            begin
              reg39 <= (({reg37} & $signed($unsigned(reg41[(1'h1):(1'h0)]))) == wire26[(3'h7):(3'h7)]);
              reg40 <= $signed($signed({reg40}));
              reg41 <= ($signed($unsigned((8'had))) <<< $signed($signed($signed(reg28[(3'h4):(1'h1)]))));
              reg42 <= wire22[(4'hf):(4'he)];
            end
          else
            begin
              reg39 <= ($unsigned($unsigned(reg28)) * $signed((+(~^$signed(reg42)))));
              reg40 <= $unsigned($signed((7'h44)));
              reg41 <= $signed(reg40[(4'h8):(4'h8)]);
            end
        end
    end
  assign wire44 = ($signed(reg28[(1'h0):(1'h0)]) << ((($unsigned(reg41) ?
                          $signed(reg29) : $signed(reg38)) ?
                      $unsigned(wire23) : (8'ha3)) + ($unsigned((wire34 ?
                          reg39 : reg27)) ?
                      $signed($unsigned(wire25)) : reg36[(4'hc):(3'h4)])));
  always
    @(posedge clk) begin
      reg45 <= wire44[(4'he):(4'ha)];
    end
  assign wire46 = wire21[(2'h3):(2'h3)];
  assign wire47 = (($unsigned((7'h41)) ?
                          $unsigned(((reg29 >= wire23) ?
                              (reg35 || reg36) : $unsigned(reg28))) : {reg27[(3'h4):(3'h4)],
                              (((8'ha8) <<< wire32) && $unsigned(reg29))}) ?
                      (|{(reg43[(1'h0):(1'h0)] <<< wire24[(4'hb):(3'h7)]),
                          (|wire26)}) : $signed($signed(reg36[(4'h9):(1'h1)])));
  assign wire48 = $unsigned(wire22[(5'h11):(3'h5)]);
  assign wire49 = (-(reg37 ? reg43 : $unsigned((^reg27[(1'h1):(1'h0)]))));
  assign wire50 = ((~&$signed({reg42,
                      (reg39 ?
                          reg38 : reg38)})) >> (($unsigned(wire49[(3'h6):(1'h1)]) - $unsigned((wire22 ?
                          wire44 : wire46))) ?
                      ((+{(8'had)}) <= wire34) : $unsigned({(wire24 ?
                              (8'hb7) : wire46)})));
  assign wire51 = wire26[(4'he):(4'hb)];
  assign wire52 = {$unsigned(reg43[(2'h3):(2'h2)]),
                      $signed($unsigned(wire32[(4'ha):(3'h6)]))};
endmodule
