module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire47;
  assign y = {wire93, wire18, wire20, wire21, wire47, (1'h0)};
  module5 #() modinst19 (wire18, clk, wire2, wire1, wire4, wire3);
  assign wire20 = $signed(((~&wire4[(4'hc):(3'h4)]) ?
                      wire2[(3'h6):(3'h4)] : (($unsigned(wire2) == (wire1 | wire3)) ?
                          ((wire1 != wire18) ?
                              (wire3 + wire18) : $signed(wire3)) : wire0)));
  assign wire21 = ((^~(8'haf)) & (|$unsigned((8'ha2))));
  module22 #() modinst48 (wire47, clk, wire20, wire18, wire2, wire3, wire4);
  module49 #() modinst94 (.y(wire93), .wire53(wire21), .wire51(wire20), .wire52(wire18), .wire50(wire3), .clk(clk));
endmodule

module module49  (y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire53;
  input wire [(5'h15):(1'h0)] wire52;
  input wire [(4'h9):(1'h0)] wire51;
  input wire [(3'h4):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire54;
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire81,
                 wire63,
                 wire55,
                 wire54,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg80,
                 reg79,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire54 = wire50[(2'h2):(1'h0)];
  assign wire55 = (|($unsigned($signed({wire51, wire51})) ?
                      ((~&(~&wire52)) && wire52[(4'hc):(4'hb)]) : (wire50[(2'h2):(1'h1)] ?
                          (8'hbc) : wire50[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg56 <= (^~(8'h9f));
      reg57 <= (($signed(($signed(wire55) ?
          (wire54 != (8'h9f)) : $signed((8'h9f)))) >> wire54) << {wire50[(3'h4):(2'h3)]});
      if ($unsigned($unsigned($unsigned(wire51[(3'h6):(3'h4)]))))
        begin
          reg58 <= (|($signed(((wire55 <= (8'hbe)) ?
              $unsigned(wire52) : $unsigned(wire51))) ^~ wire50[(2'h3):(1'h0)]));
          if (wire53)
            begin
              reg59 <= $signed((~^wire54[(1'h1):(1'h0)]));
              reg60 <= (wire51[(3'h6):(2'h2)] ?
                  (|(+($signed((8'hb6)) ^~ reg57))) : ({(^~(wire50 ?
                              reg57 : wire50))} ?
                      (+$signed(wire55)) : (!(wire55 ? (&wire55) : (8'hbd)))));
              reg61 <= wire55[(2'h2):(2'h2)];
              reg62 <= $unsigned(reg58[(4'he):(1'h0)]);
            end
          else
            begin
              reg59 <= ((($unsigned($signed(reg62)) ?
                  $unsigned({(8'hac)}) : (8'haa)) | wire55) != wire50);
              reg60 <= reg58[(3'h7):(1'h0)];
            end
        end
      else
        begin
          reg58 <= $unsigned(($signed($signed(wire51)) ?
              $unsigned(((~|wire53) | (|wire55))) : ($signed((wire52 >= (8'h9f))) | (!(wire53 ?
                  wire51 : (8'hb5))))));
          reg59 <= $unsigned(wire50[(1'h0):(1'h0)]);
          reg60 <= $unsigned($signed(((^~(wire53 ? reg59 : reg62)) ?
              reg56[(2'h2):(1'h1)] : reg61)));
          reg61 <= ($unsigned(reg58) ?
              reg62 : $signed({reg60, wire54[(4'he):(3'h7)]}));
        end
    end
  assign wire63 = wire55[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      if (($unsigned({((wire54 ? reg56 : wire51) ?
              (+wire52) : $unsigned(wire50))}) || (wire50[(2'h2):(2'h2)] > {wire50[(1'h1):(1'h1)],
          $unsigned($unsigned(reg59))})))
        begin
          if ($unsigned($unsigned(reg60[(1'h1):(1'h0)])))
            begin
              reg64 <= ((~(reg57 ?
                      (((8'hb2) ?
                          reg60 : reg56) & wire51[(1'h0):(1'h0)]) : (^~$signed(reg62)))) ?
                  wire52[(4'he):(4'h8)] : ($unsigned(((reg61 ? wire53 : reg58) ?
                      $signed(wire51) : $signed(wire52))) && {$signed($signed(reg59))}));
              reg65 <= wire53[(1'h1):(1'h1)];
              reg66 <= wire54;
            end
          else
            begin
              reg64 <= wire50;
              reg65 <= {($signed((8'hba)) && ($signed($unsigned(wire51)) | reg61))};
              reg66 <= $unsigned(({reg66} & (^$signed(reg59))));
              reg67 <= reg60;
              reg68 <= ({reg64[(2'h3):(2'h2)]} ?
                  (($signed($unsigned(wire53)) ?
                      (8'ha6) : reg60) < $unsigned({$unsigned(reg60)})) : ($unsigned(wire53[(1'h1):(1'h0)]) ?
                      $unsigned((~|$signed(wire52))) : $unsigned(((wire50 ?
                          reg65 : wire52) >>> (wire54 * reg66)))));
            end
        end
      else
        begin
          reg64 <= reg62;
          reg65 <= (wire55[(3'h4):(2'h3)] * wire52);
        end
      if ($unsigned(reg56[(3'h6):(1'h0)]))
        begin
          reg69 <= (~|$signed(reg56[(3'h4):(1'h0)]));
          reg70 <= reg60[(4'h9):(1'h1)];
          reg71 <= (~$unsigned(reg58));
          reg72 <= (reg70 ?
              (~(&{reg59[(2'h2):(1'h0)]})) : (+$unsigned((^~(reg57 ?
                  reg71 : reg64)))));
          if ($signed((reg58 != $unsigned(wire52))))
            begin
              reg73 <= $signed(wire63[(4'h8):(4'h8)]);
              reg74 <= $unsigned(({(~&(~^reg61))} >>> ((+(~^wire55)) ?
                  $signed(((8'hbc) ? reg67 : reg62)) : $unsigned(reg68))));
              reg75 <= reg64;
            end
          else
            begin
              reg73 <= (~&reg57[(4'hc):(3'h7)]);
              reg74 <= (-reg61[(2'h3):(2'h3)]);
              reg75 <= wire55[(3'h7):(1'h0)];
            end
        end
      else
        begin
          if (wire55)
            begin
              reg69 <= {$signed((reg65[(3'h7):(3'h7)] | (^$unsigned(wire50))))};
              reg70 <= (reg71 <= $unsigned($unsigned((((8'ha5) ?
                  reg75 : wire63) << (reg67 ? reg56 : reg70)))));
              reg71 <= (|($unsigned($signed(wire52[(4'hd):(3'h7)])) <<< wire53));
              reg72 <= reg60;
            end
          else
            begin
              reg69 <= (({$unsigned($signed(wire55))} ^ $unsigned($unsigned((~^wire63)))) ?
                  $unsigned((({reg61,
                      (8'hb5)} & ((7'h40) <<< (8'ha7))) * ($signed(reg62) ?
                      reg59 : (7'h44)))) : $signed(($unsigned((reg73 ?
                      reg73 : reg69)) && (reg70[(5'h10):(2'h3)] ?
                      $signed(reg65) : reg62[(4'h8):(4'h8)]))));
              reg70 <= {$unsigned({reg59}), wire63};
              reg71 <= $signed((wire51[(2'h2):(1'h1)] ? wire51 : reg57));
              reg72 <= reg72;
            end
          if ((reg59 ? $unsigned($unsigned({reg60[(3'h6):(3'h4)]})) : reg70))
            begin
              reg73 <= ((^~$unsigned($unsigned((reg59 ?
                  reg60 : reg75)))) ^~ ($unsigned(($signed((8'ha0)) | reg56)) ?
                  ($signed($unsigned(reg66)) ?
                      (^(-reg69)) : $unsigned(((8'hb0) ?
                          (8'hb5) : reg75))) : (($unsigned(reg67) <= reg60) ?
                      $unsigned(reg59[(1'h1):(1'h0)]) : (|(^reg61)))));
            end
          else
            begin
              reg73 <= (reg59 < wire54);
            end
          if (((wire50[(2'h2):(2'h2)] ?
              ((^~(wire51 ?
                  wire63 : reg57)) || $signed($unsigned(wire53))) : ((^(~|reg59)) ?
                  (&(8'hb3)) : (&(reg57 ?
                      reg65 : reg56)))) <<< (+wire63[(2'h2):(1'h1)])))
            begin
              reg74 <= ((|((-wire63) ?
                      (~&(reg57 ? reg70 : reg58)) : (|(^~(8'hb4))))) ?
                  (reg58 != wire53) : (($unsigned((wire63 ? reg67 : reg60)) ?
                          $signed($signed(reg66)) : (&{reg73, reg62})) ?
                      $signed((^reg73[(4'hb):(2'h3)])) : (reg65[(4'hc):(1'h0)] >> (|$signed((7'h43))))));
              reg75 <= $signed((((~&(~|wire50)) ?
                  ((reg56 ?
                      reg62 : wire52) + reg56[(3'h7):(1'h0)]) : {(~&reg65)}) * $signed({(~^reg66)})));
              reg76 <= (({reg73} ? reg61 : reg56) ?
                  $signed(wire63[(4'hb):(4'h9)]) : reg73[(3'h7):(3'h7)]);
              reg77 <= wire50;
            end
          else
            begin
              reg74 <= reg68;
            end
        end
      reg78 <= (($signed(({(8'hbf), reg65} >= reg57[(4'ha):(1'h0)])) ?
          (+(^$signed(wire53))) : $unsigned(wire55)) != (((~|wire51[(2'h2):(1'h0)]) >>> $signed(reg70)) <<< {(reg62[(2'h2):(1'h0)] * (^~wire51))}));
      reg79 <= ({$unsigned($unsigned(wire53)), (^~wire53[(3'h4):(2'h2)])} ?
          {{(wire52 && ((8'hb7) << wire63)), (|$signed(reg66))},
              wire63[(3'h7):(3'h7)]} : ({$unsigned(reg78), (^~$signed(reg77))} ?
              $unsigned($signed((reg62 & reg67))) : (reg73[(4'ha):(1'h0)] ?
                  $signed((reg58 && reg61)) : reg75[(2'h2):(1'h1)])));
      reg80 <= reg61;
    end
  assign wire81 = wire50[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned((!$unsigned(($signed(wire81) & reg61)))))
        begin
          if ((reg67[(1'h0):(1'h0)] ?
              $unsigned(wire55[(3'h6):(2'h2)]) : $signed(reg78)))
            begin
              reg82 <= $unsigned(wire55[(3'h5):(2'h2)]);
              reg83 <= (^$signed(({(!reg68)} ?
                  (!(!reg70)) : $signed(reg65[(3'h4):(2'h2)]))));
              reg84 <= reg77[(3'h5):(2'h3)];
              reg85 <= reg60;
              reg86 <= $unsigned($unsigned(((reg58 ?
                      (reg85 ? reg69 : (8'ha8)) : {wire52, reg75}) ?
                  (~reg74) : $signed((~|reg70)))));
            end
          else
            begin
              reg82 <= (reg62[(4'h9):(2'h3)] ?
                  $unsigned($unsigned(wire50)) : $signed({$signed(reg71[(3'h6):(3'h4)])}));
              reg83 <= reg66;
              reg84 <= $unsigned(reg72);
            end
          reg87 <= $unsigned({reg65});
          reg88 <= $signed({(~((!reg72) ?
                  reg73[(1'h0):(1'h0)] : (reg62 && reg85))),
              wire51[(3'h6):(2'h3)]});
          reg89 <= wire52[(5'h15):(4'h9)];
        end
      else
        begin
          reg82 <= ((~^$signed(((!reg68) ?
              $signed(reg70) : $unsigned(reg77)))) != (+$signed($unsigned(wire55))));
          reg83 <= wire51[(3'h6):(2'h2)];
        end
    end
  assign wire90 = (reg58[(5'h10):(5'h10)] ?
                      $unsigned((!{(reg72 | reg86)})) : $signed((wire51 ^~ ((reg77 + reg74) | $signed(reg86)))));
  assign wire91 = $unsigned(reg83[(1'h1):(1'h1)]);
  assign wire92 = wire54[(4'h9):(2'h2)];
endmodule

module module22
#(parameter param46 = (({{{(8'hb5), (8'ha2)}, ((8'hb5) ? (8'ha4) : (8'hbb))}, ((-(8'h9d)) >= ((8'hbc) <= (8'hb1)))} ? (8'hbb) : (((~(8'ha0)) ^ ((8'hb2) ? (7'h41) : (8'ha7))) * ((~(8'haa)) ^ ((8'hba) ? (8'ha2) : (8'h9e))))) ? ((({(8'hb3), (8'h9c)} ? ((8'hb6) ? (8'hac) : (7'h42)) : ((8'hbe) ^~ (8'haf))) ? {{(7'h43)}, (~(8'hb1))} : (~^(^(8'hae)))) ? ((8'h9e) < (~^(^~(8'hb2)))) : ((((8'hb2) ? (8'hba) : (7'h40)) ? (^~(8'hb8)) : ((8'ha9) ? (8'ha7) : (8'h9c))) ? {{(8'h9f), (7'h42)}, (!(8'hb3))} : ((!(8'hb3)) ? ((8'ha8) <= (8'hb5)) : ((8'ha0) <= (8'ha7))))) : (8'hae)))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire27;
  input wire signed [(5'h13):(1'h0)] wire26;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire29,
                 wire28,
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
                 (1'h0)};
  assign wire28 = ((wire23[(2'h3):(1'h1)] ^~ $unsigned((wire23[(4'h8):(1'h0)] ?
                      (wire25 ?
                          wire23 : wire24) : (wire25 ~^ wire23)))) << $signed((+$signed(wire24))));
  assign wire29 = ((~&wire25) >> (~(+(&{wire24, wire27}))));
  always
    @(posedge clk) begin
      if (wire26[(4'hc):(4'hb)])
        begin
          if ($signed({$unsigned((~^((8'ha6) ? wire27 : (8'haa))))}))
            begin
              reg30 <= wire26;
              reg31 <= $signed(wire29[(5'h13):(2'h3)]);
            end
          else
            begin
              reg30 <= wire27[(4'hd):(3'h7)];
              reg31 <= wire24[(4'he):(4'h8)];
              reg32 <= wire27;
              reg33 <= reg31[(2'h3):(2'h2)];
            end
          reg34 <= $signed($unsigned((((wire23 > wire29) ?
                  wire24 : (reg30 | wire25)) ?
              reg33[(3'h6):(1'h0)] : $unsigned($signed(wire26)))));
        end
      else
        begin
          reg30 <= (8'haa);
          reg31 <= ((+(((reg34 ? wire29 : reg30) ?
                  (wire29 ? wire29 : reg30) : wire29) ?
              reg30 : (~(!wire23)))) | (^$unsigned(((wire25 ^ (8'ha5)) != $signed(wire25)))));
          reg32 <= (((&$unsigned((|wire24))) ^~ wire24) ?
              (&wire23[(1'h1):(1'h0)]) : reg34);
          if ($signed((~&$signed({(wire27 & (8'hbf))}))))
            begin
              reg33 <= wire27[(3'h5):(2'h2)];
            end
          else
            begin
              reg33 <= reg32[(3'h4):(1'h0)];
            end
        end
      reg35 <= (reg32 ?
          $unsigned(({$signed(wire25)} ?
              $unsigned((&(8'hb1))) : wire28[(3'h5):(2'h2)])) : $signed(wire25[(1'h1):(1'h1)]));
      if ((+reg31[(3'h6):(2'h2)]))
        begin
          reg36 <= $unsigned({(&{(wire25 | reg31),
                  (wire23 ? wire24 : reg33)})});
          reg37 <= (&({reg31,
              ({reg36} >> (reg31 ?
                  (8'ha7) : wire27))} + $signed($unsigned($signed(reg30)))));
        end
      else
        begin
          if ($signed(((($signed(wire23) <= (&wire25)) ?
                  $unsigned(wire27) : $signed(wire24)) ?
              $unsigned($signed($signed(wire23))) : {wire28})))
            begin
              reg36 <= reg32;
              reg37 <= {(-{reg32[(1'h0):(1'h0)]}),
                  $signed(((!(wire27 || wire27)) != reg32))};
              reg38 <= (8'hb9);
              reg39 <= $unsigned(wire28[(3'h5):(1'h1)]);
            end
          else
            begin
              reg36 <= wire28;
            end
          reg40 <= ($signed((~^(&wire27[(4'he):(4'he)]))) * reg34);
        end
      reg41 <= reg39;
    end
  assign wire42 = {{{$unsigned($signed(wire28))}, reg40[(1'h1):(1'h1)]},
                      wire25};
  assign wire43 = $signed((8'hbd));
  assign wire44 = {wire26[(2'h2):(2'h2)],
                      (reg33[(3'h5):(1'h1)] ?
                          ((wire42[(2'h2):(1'h0)] + (reg32 ?
                              wire27 : wire26)) >= $unsigned({reg39})) : (~$signed((|wire26))))};
  assign wire45 = $signed($signed($signed($unsigned((reg36 || reg33)))));
endmodule

module module5
#(parameter param16 = (((8'hb4) ? (((7'h40) << {(7'h44), (7'h40)}) | (((8'hb6) || (8'haa)) < ((8'hb1) ~^ (8'ha5)))) : (^~({(8'hba), (8'hab)} ? {(7'h43), (8'hb6)} : (~|(8'hba))))) * (((((7'h42) ? (8'hbf) : (8'ha6)) ? ((8'ha1) ? (8'ha9) : (8'h9e)) : {(8'hb0)}) ? (^~((7'h43) | (8'hb2))) : (+((8'ha5) + (8'hb6)))) ? {{((8'hab) ? (8'hbc) : (8'ha9))}} : {{(&(8'h9c)), ((8'had) ? (8'hac) : (8'hac))}})), 
parameter param17 = {(((8'hbc) == (8'ha0)) >= (!((8'ha6) ? param16 : (&(8'hb1))))), param16})
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  assign y = {wire15, wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = wire7[(4'h9):(3'h4)];
  assign wire11 = {wire6[(3'h6):(2'h3)], (+wire10)};
  assign wire12 = $signed(wire11[(3'h6):(1'h0)]);
  assign wire13 = (~&((~wire6[(3'h4):(2'h2)]) ?
                      $unsigned(wire8) : $unsigned(((-wire7) <= $signed(wire11)))));
  assign wire14 = wire11[(3'h4):(1'h1)];
  assign wire15 = wire9;
endmodule
