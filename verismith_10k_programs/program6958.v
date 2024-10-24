module top
#(parameter param79 = (8'ha5), 
parameter param80 = (((param79 ? (&(param79 && param79)) : (8'h9f)) || param79) - (({(param79 || param79)} && ((~(8'haa)) & param79)) ~^ param79)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire78,
                 wire76,
                 wire45,
                 wire44,
                 wire42,
                 wire28,
                 wire27,
                 wire25,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = (8'hbf);
  assign wire5 = wire3[(1'h1):(1'h0)];
  assign wire6 = ((wire2 ?
                         (-$unsigned($unsigned(wire1))) : (wire5 ?
                             $signed($signed(wire4)) : wire5[(4'h8):(2'h2)])) ?
                     (((wire2 != wire1[(3'h6):(3'h6)]) ?
                         $signed((wire0 != wire2)) : $unsigned($signed(wire2))) <<< $unsigned((~$unsigned(wire5)))) : $signed($signed($unsigned((wire0 ?
                         wire2 : wire5)))));
  assign wire7 = (~^(^~({(+(8'ha7)), {wire1}} || ((wire0 < wire4) || wire5))));
  assign wire8 = {{(^~{$unsigned(wire1)}),
                         ($unsigned((&wire5)) ?
                             $unsigned(((7'h44) <= wire2)) : wire6)},
                     $unsigned(wire7)};
  always
    @(posedge clk) begin
      reg9 <= {wire5,
          (~^{wire0[(3'h4):(1'h0)], $signed((wire2 ? wire3 : wire4))})};
      reg10 <= ((((!(wire8 ? wire7 : wire3)) + $signed((wire8 < (8'hb4)))) ?
          $signed((reg9 + wire1)) : (-$signed({(8'ha6),
              (8'ha2)}))) <= $unsigned($signed({$unsigned(wire5),
          $unsigned(wire1)})));
    end
  assign wire11 = {wire0[(2'h2):(1'h0)]};
  assign wire12 = (($unsigned($unsigned($signed(wire6))) != $unsigned((~^(wire4 & wire7)))) ?
                      (((7'h43) ? wire4[(3'h5):(3'h5)] : wire8) ?
                          (&($unsigned(wire0) + wire1[(4'h8):(3'h5)])) : (|wire0[(3'h4):(2'h3)])) : (wire2[(1'h0):(1'h0)] ^ $unsigned((!wire0))));
  assign wire13 = ((~^$unsigned((~&reg10))) ?
                      $unsigned((~^wire8)) : (~$unsigned($signed((reg9 ?
                          wire8 : wire12)))));
  assign wire14 = wire6[(5'h11):(2'h3)];
  module15 #() modinst26 (.wire17(reg10), .wire19(reg9), .wire16(wire6), .y(wire25), .clk(clk), .wire18(wire0));
  assign wire27 = ({wire12} ? wire5 : wire13[(2'h2):(1'h1)]);
  assign wire28 = {wire11};
  module29 #() modinst43 (wire42, clk, wire27, wire1, wire8, wire25);
  assign wire44 = wire25[(3'h5):(3'h4)];
  assign wire45 = ($signed($signed($signed((&wire44)))) || ((&($signed((8'hb9)) ?
                      (wire12 <<< wire44) : wire12)) && wire28[(3'h7):(1'h0)]));
  module46 #() modinst77 (wire76, clk, wire11, wire1, wire4, wire5);
  assign wire78 = (~|$signed({wire6[(4'hc):(4'ha)]}));
endmodule

module module46
#(parameter param75 = (({(|((8'hba) >= (8'hbe))), (8'hbf)} >>> ((~^((8'ha0) ? (8'ha8) : (7'h42))) >>> (&((8'hb1) < (8'hac))))) | (({((8'ha6) <<< (8'hb1)), ((8'hb5) ? (8'ha0) : (7'h40))} > (((8'ha8) >>> (8'haa)) ? (8'hb6) : {(8'h9d)})) - (+(((8'hb6) != (8'ha1)) - {(8'haf), (8'hac)})))))
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire50;
  input wire [(3'h6):(1'h0)] wire49;
  input wire [(5'h12):(1'h0)] wire48;
  input wire signed [(4'hb):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire55;
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire55,
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
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg51 <= $signed({(((wire48 >> wire50) ?
              (~&(7'h41)) : $unsigned(wire50)) == $unsigned((wire48 > wire47))),
          {(wire50 ? (~|wire47) : {wire50})}});
      reg52 <= (~|(&(~&({wire48} ?
          (reg51 ? reg51 : wire47) : wire49[(2'h2):(1'h1)]))));
      reg53 <= $unsigned(($signed((wire48[(4'hc):(4'hc)] ?
              wire50[(4'ha):(1'h0)] : (wire49 < wire47))) ?
          ($signed((wire50 >> reg52)) && (~^(8'hb7))) : $unsigned(wire48)));
      reg54 <= reg52[(4'hc):(4'ha)];
    end
  assign wire55 = $signed(({$unsigned(wire47)} != wire48[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg56 <= $signed(((((reg51 ? (8'hbe) : wire47) < (-wire55)) ?
          $signed((-(8'hbc))) : reg54) <= $signed($unsigned((+reg53)))));
      if (reg56)
        begin
          reg57 <= reg56[(4'hc):(2'h3)];
          reg58 <= (~&wire50);
          reg59 <= wire50;
          reg60 <= $signed($signed($signed(((wire55 > wire47) ?
              wire47[(3'h6):(3'h6)] : reg54))));
        end
      else
        begin
          reg57 <= reg54;
          reg58 <= reg53[(4'hb):(3'h5)];
        end
      reg61 <= wire50[(4'hb):(3'h6)];
      if (reg59[(2'h2):(1'h1)])
        begin
          reg62 <= $signed(reg51);
          if ((^~(((-$unsigned(reg62)) ?
                  (8'hb3) : ($unsigned((8'ha1)) ?
                      {reg53} : ((8'ha4) ? reg62 : wire49))) ?
              $signed($unsigned(wire50)) : reg59[(1'h1):(1'h1)])))
            begin
              reg63 <= $unsigned($signed($signed(wire47[(4'h8):(2'h3)])));
              reg64 <= $unsigned(reg57[(2'h2):(2'h2)]);
              reg65 <= {$unsigned($signed($signed((wire55 <<< reg51))))};
              reg66 <= (~(!reg64[(3'h4):(2'h3)]));
              reg67 <= {$signed((({(8'hb1)} ? ((8'hbd) <<< reg65) : reg59) ?
                      reg52 : $signed({(8'hb1), reg51}))),
                  ($unsigned((&(reg53 < reg56))) ?
                      ((reg58[(1'h1):(1'h1)] ?
                          (reg65 <= reg59) : (reg56 >= reg60)) != (~&(reg60 ?
                          reg65 : wire48))) : $unsigned((~$unsigned(reg64))))};
            end
          else
            begin
              reg63 <= $signed(reg65[(4'hf):(4'ha)]);
              reg64 <= ({{$unsigned($signed(reg65))},
                  $signed({wire48[(5'h10):(2'h2)],
                      reg56})} >= (~^($unsigned($signed(reg63)) ?
                  $unsigned(reg54) : $unsigned((8'hbf)))));
              reg65 <= wire55;
              reg66 <= $unsigned(reg58[(1'h1):(1'h0)]);
              reg67 <= {((reg67[(2'h2):(1'h0)] >>> ($unsigned(reg51) ?
                          (wire50 ? wire50 : reg67) : (reg51 ?
                              reg65 : wire48))) ?
                      reg58[(1'h1):(1'h0)] : ($signed($unsigned(reg54)) ?
                          reg54 : (~^(!wire49)))),
                  $signed((8'hb9))};
            end
          reg68 <= reg67;
          reg69 <= (~&$signed((wire50 <<< ((~wire47) ^~ $unsigned((8'hb1))))));
        end
      else
        begin
          reg62 <= (~|(~|reg58[(1'h0):(1'h0)]));
          reg63 <= reg58[(1'h0):(1'h0)];
        end
    end
  assign wire70 = reg69;
  assign wire71 = ($unsigned($unsigned($unsigned((wire55 | (8'had))))) ?
                      $unsigned((-(8'hb0))) : reg60);
  assign wire72 = $unsigned((+$unsigned(reg57[(1'h1):(1'h0)])));
  assign wire73 = $unsigned((|$signed({wire48[(4'h8):(2'h2)]})));
  assign wire74 = $signed($unsigned((~&(wire72[(3'h7):(2'h2)] ?
                      (reg53 <= reg51) : reg58[(1'h1):(1'h1)]))));
endmodule

module module29  (y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire33;
  input wire [(3'h4):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  assign y = {wire41,
                 wire35,
                 wire34,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire34 = wire32[(1'h0):(1'h0)];
  assign wire35 = (8'hb1);
  always
    @(posedge clk) begin
      if ((-wire30))
        begin
          reg36 <= {wire33[(3'h4):(1'h0)], wire31};
          if ($unsigned(((&wire35) ?
              reg36[(4'ha):(3'h6)] : $unsigned($unsigned({(8'hb2), (8'hba)})))))
            begin
              reg37 <= ($signed((+(8'hb1))) ? wire32 : wire30[(1'h0):(1'h0)]);
              reg38 <= $signed($unsigned({((|wire33) ?
                      (wire33 ? wire31 : wire33) : (|wire31)),
                  (wire31[(5'h14):(4'h8)] ?
                      ((8'ha0) ? (8'hb0) : wire31) : (reg36 >> wire35))}));
            end
          else
            begin
              reg37 <= (wire33 ?
                  wire31 : {(wire33[(2'h3):(1'h0)] ?
                          $signed((wire34 ?
                              wire33 : reg36)) : ($unsigned(wire31) ?
                              (^~(8'ha6)) : ((8'hab) <= reg38)))});
              reg38 <= wire33;
            end
        end
      else
        begin
          reg36 <= (wire30 - wire31);
          reg37 <= {(^$unsigned(wire35[(4'he):(1'h1)]))};
        end
      reg39 <= reg37;
      reg40 <= $unsigned(reg37);
    end
  assign wire41 = $signed((~wire31[(2'h2):(1'h1)]));
endmodule

module module15
#(parameter param24 = (^~(((((8'hab) || (8'hb2)) < (7'h44)) ? ((!(8'haf)) ? (~^(7'h42)) : ((8'hb4) >> (8'hb7))) : (((7'h40) ? (8'hb6) : (8'hba)) ? ((8'hb0) ? (8'ha5) : (8'hba)) : (^(7'h42)))) >= ((~|((8'ha6) ? (8'hbd) : (8'h9e))) ? {((8'ha9) && (7'h40))} : {((8'hbd) | (8'ha8))}))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  input wire signed [(4'hb):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  assign y = {wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = (&$signed((|(wire17[(1'h0):(1'h0)] ^~ (wire16 ~^ (8'h9c))))));
  assign wire21 = ((|(((^~wire16) ?
                      $unsigned(wire19) : wire19) ~^ ($unsigned(wire19) >= (wire20 ?
                      wire18 : wire16)))) == $unsigned((wire16 << wire17)));
  assign wire22 = wire16;
  assign wire23 = ($signed($unsigned(wire22[(2'h3):(1'h1)])) ?
                      (+($signed($unsigned(wire17)) && (^$signed(wire18)))) : $signed({(~|wire16[(3'h7):(3'h7)])}));
endmodule
