module top
#(parameter param87 = (~^(&((8'hb7) > (^~{(8'h9f), (8'hb3)})))), 
parameter param88 = ((~^param87) >= (~^{(8'hb5)})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  assign y = {wire76,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire5 = (|wire2);
  assign wire6 = (~|{(wire4 > (wire0[(1'h1):(1'h1)] | wire4[(1'h0):(1'h0)])),
                     ((wire5[(2'h2):(1'h1)] ?
                             (wire0 > (8'hbe)) : (wire5 & wire0)) ?
                         wire4[(1'h0):(1'h0)] : {(wire2 | wire3)})});
  assign wire7 = wire3[(2'h2):(1'h0)];
  assign wire8 = $unsigned({$unsigned($unsigned($signed(wire5)))});
  assign wire9 = $signed({wire6});
  assign wire10 = wire9;
  module11 #() modinst77 (.y(wire76), .wire13(wire10), .wire15(wire2), .wire14(wire5), .clk(clk), .wire12(wire6));
  always
    @(posedge clk) begin
      if (($unsigned(wire8[(3'h6):(1'h0)]) - wire1[(3'h6):(2'h3)]))
        begin
          reg78 <= wire9[(3'h4):(1'h1)];
          if ((8'hbf))
            begin
              reg79 <= wire76[(1'h1):(1'h1)];
              reg80 <= (&$unsigned(((~(reg78 ? wire7 : wire1)) ?
                  (wire0 + {wire10}) : (!(~|wire5)))));
              reg81 <= (8'hb6);
              reg82 <= {wire9};
            end
          else
            begin
              reg79 <= (&(wire6 - $unsigned(($unsigned(reg78) || $signed(wire4)))));
              reg80 <= wire2[(3'h5):(2'h2)];
            end
          reg83 <= $signed($unsigned(wire76));
          reg84 <= (({(8'had)} ^ ((reg83[(4'hd):(3'h4)] < $unsigned(reg81)) > wire8[(1'h0):(1'h0)])) + reg83);
        end
      else
        begin
          reg78 <= ($unsigned(reg83) == wire76[(4'hb):(1'h0)]);
        end
      reg85 <= (reg80[(4'h9):(2'h3)] ?
          (+$unsigned(reg79[(2'h2):(1'h0)])) : $signed((($signed(wire9) | $signed(wire9)) ?
              $signed((reg78 - wire9)) : (^~$signed(reg78)))));
      reg86 <= ($signed((~reg82[(2'h3):(2'h2)])) ?
          $signed(reg83[(3'h5):(3'h5)]) : ((wire2[(2'h3):(2'h2)] ?
                  ($signed(reg80) & ((8'hb2) && (8'hb7))) : wire9) ?
              (8'hb8) : (($signed(wire1) - (!wire3)) <<< (~((8'hb8) ?
                  wire3 : reg80)))));
    end
endmodule

module module11
#(parameter param75 = ({(~|({(8'ha3)} | ((8'hb4) ? (8'h9d) : (8'hbf))))} * (~|(((-(8'haf)) != ((8'ha4) ? (8'hb7) : (8'h9f))) >>> {((7'h43) | (8'hb3)), ((8'ha6) ? (8'had) : (8'hb9))}))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire48;
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire48,
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
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  module16 #() modinst49 (wire48, clk, wire13, wire14, wire15, wire12);
  always
    @(posedge clk) begin
      reg50 <= (&wire14);
      reg51 <= wire14;
      reg52 <= (+wire14[(4'hb):(2'h3)]);
      if (((reg52 ?
          (&$unsigned(wire15)) : ({{reg51, reg51}, (^wire14)} ?
              ({wire48} ?
                  wire12 : (wire12 - (7'h42))) : ((wire15 > wire15) <= (~&wire13)))) >= ((((wire12 != wire48) ~^ $unsigned(wire48)) >>> ((wire15 ~^ wire12) - wire48)) <= wire48)))
        begin
          reg53 <= ($unsigned(reg50[(2'h2):(2'h2)]) ?
              (|(($unsigned(wire15) ?
                      reg50[(4'hb):(1'h1)] : $unsigned(wire15)) ?
                  (~&$unsigned(wire13)) : $signed($unsigned(reg52)))) : ((($unsigned(wire15) ?
                  $signed(wire12) : (reg51 ?
                      reg51 : wire14)) ^~ ($signed(reg50) | wire13)) < $unsigned($unsigned((~|wire14)))));
        end
      else
        begin
          reg53 <= ($signed(((8'ha8) ?
              wire12[(3'h4):(3'h4)] : $signed(((7'h42) ^ (8'hbb))))) >= ($signed(wire14) | $unsigned($signed($signed(wire15)))));
          if ($unsigned({wire15[(1'h1):(1'h0)]}))
            begin
              reg54 <= ((&$signed($unsigned($signed(reg51)))) > (~$unsigned(reg53)));
              reg55 <= $unsigned((7'h43));
              reg56 <= $unsigned(((wire12 ?
                      $unsigned((!reg52)) : {(reg54 < (8'hbe))}) ?
                  wire48 : reg53));
              reg57 <= ($unsigned($signed($unsigned(reg51))) >>> $unsigned($unsigned($unsigned(reg52[(3'h7):(3'h5)]))));
            end
          else
            begin
              reg54 <= $signed($signed((reg56 * wire15[(1'h0):(1'h0)])));
            end
          reg58 <= {{reg54[(2'h2):(1'h0)],
                  {$unsigned(reg56[(1'h0):(1'h0)]),
                      ((wire15 ? wire12 : wire15) ?
                          $signed(wire12) : $signed(reg57))}}};
          reg59 <= $unsigned(reg57);
          if ($signed(reg58[(2'h3):(1'h1)]))
            begin
              reg60 <= $signed(reg52);
            end
          else
            begin
              reg60 <= {reg57};
              reg61 <= (((-(reg51 || reg52)) >>> reg59) >> reg57);
              reg62 <= wire48[(4'hc):(4'ha)];
              reg63 <= $unsigned(wire15);
            end
        end
    end
  always
    @(posedge clk) begin
      reg64 <= wire14;
      reg65 <= $signed({(wire48[(3'h4):(2'h2)] ?
              $signed({reg55}) : (~^(wire14 ^ reg59))),
          (reg55[(2'h2):(1'h0)] ? ({(8'ha5)} ? (~|reg51) : {reg52}) : wire12)});
    end
  always
    @(posedge clk) begin
      if (wire15[(2'h3):(1'h1)])
        begin
          reg66 <= $unsigned(reg60[(3'h5):(3'h5)]);
          reg67 <= $unsigned(reg64[(3'h4):(1'h0)]);
          if ($signed((8'ha0)))
            begin
              reg68 <= (((reg52[(3'h6):(1'h0)] ?
                  ($signed(reg57) ?
                      (reg62 & (8'hb6)) : (reg50 ^~ reg62)) : (7'h40)) << reg60[(3'h7):(2'h2)]) <<< wire48[(2'h2):(2'h2)]);
              reg69 <= $unsigned($unsigned($signed($signed((reg64 ?
                  reg67 : reg64)))));
            end
          else
            begin
              reg68 <= ($unsigned({$unsigned(reg58)}) + (-wire12));
              reg69 <= {reg66};
              reg70 <= reg53;
              reg71 <= ((8'hb9) + ($unsigned((~(^~reg67))) ?
                  {$signed(((8'had) & (8'ha1)))} : {$signed((~^reg66))}));
            end
        end
      else
        begin
          reg66 <= ($unsigned($unsigned((reg52 > reg57))) | wire12[(3'h6):(2'h2)]);
          reg67 <= (&($signed(((reg54 > reg63) ? (^~wire12) : (~&wire13))) ?
              (8'hb3) : wire12[(3'h4):(3'h4)]));
        end
      reg72 <= wire12[(2'h3):(2'h2)];
    end
  assign wire73 = reg72;
  assign wire74 = ((reg59 ?
                      reg71 : (8'hb5)) & (reg69 >= $signed($unsigned($signed(reg60)))));
endmodule

module module16
#(parameter param47 = ({({{(8'hb1), (8'hb8)}} ? (((8'hb1) ? (8'ha1) : (8'hb8)) ? ((8'hb6) ? (8'haf) : (8'hb1)) : ((8'hb6) ? (8'hbd) : (8'h9d))) : ((-(8'ha3)) << (&(8'ha1)))), ((((8'ha0) ? (7'h43) : (8'ha2)) >> ((8'h9e) ^~ (8'h9c))) < {((8'h9d) << (8'h9d)), ((8'hb9) ^~ (8'hb4))})} >> ((!({(8'ha1), (8'ha2)} ^ (-(8'h9e)))) ^~ ((~|((8'hb6) ? (8'hbc) : (8'ha1))) ? ((^~(7'h44)) != ((8'h9e) <<< (8'h9d))) : (((8'hb4) ? (8'h9f) : (8'ha1)) <<< ((8'hbe) >= (8'ha5)))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg43,
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
  assign wire21 = {$signed(({$signed(wire17), (~|wire19)} ?
                          ((wire18 ? wire20 : (8'hb0)) ?
                              $signed(wire20) : (7'h43)) : wire19)),
                      wire17[(1'h0):(1'h0)]};
  assign wire22 = $signed({wire18[(1'h1):(1'h0)]});
  assign wire23 = ((!wire22[(4'he):(3'h7)]) - $unsigned((&wire17)));
  assign wire24 = ((($unsigned((^~wire20)) ^ ((~&wire19) > wire22)) ?
                      $signed(wire19[(3'h7):(2'h2)]) : $signed(wire21[(1'h0):(1'h0)])) >> $signed(($signed(wire20) <<< $signed((-wire17)))));
  assign wire25 = (wire23[(3'h4):(2'h3)] ?
                      (~|(~^(~|$signed(wire21)))) : $unsigned(((wire21[(2'h2):(2'h2)] >>> (wire23 - wire24)) ?
                          ((-wire23) == $signed((8'hb2))) : wire22[(3'h4):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire20)
        begin
          reg26 <= $unsigned((~((~|$unsigned((8'h9f))) ^ (|(~(8'ha1))))));
          reg27 <= (wire25 ~^ wire22[(1'h0):(1'h0)]);
          if (wire25[(3'h6):(3'h5)])
            begin
              reg28 <= (~&(-$signed((+wire23[(2'h3):(2'h3)]))));
              reg29 <= $unsigned($signed(wire18[(1'h1):(1'h1)]));
              reg30 <= ($signed((^(reg26 & (reg29 ? wire21 : wire25)))) ?
                  $unsigned(reg28[(3'h5):(1'h0)]) : $signed((~^reg28[(3'h5):(2'h2)])));
              reg31 <= $unsigned(reg26);
            end
          else
            begin
              reg28 <= wire24[(2'h3):(1'h0)];
              reg29 <= $unsigned($signed((~&($signed(wire17) ^~ wire20[(4'h9):(4'h8)]))));
              reg30 <= reg27;
            end
          reg32 <= (|(-($signed({wire25, reg27}) ?
              (^{wire25, wire22}) : ((wire20 << reg30) == $unsigned(reg29)))));
        end
      else
        begin
          if (reg30[(3'h5):(2'h2)])
            begin
              reg26 <= $unsigned($unsigned($signed(($signed(reg30) ?
                  reg30[(2'h2):(1'h0)] : ((8'hbb) ~^ wire25)))));
              reg27 <= $signed($signed(($unsigned($signed(wire21)) ?
                  (reg27[(3'h6):(3'h5)] ?
                      ((8'hb1) & wire25) : (^wire20)) : (wire23 ?
                      wire25 : $unsigned((8'hbb))))));
              reg28 <= ($unsigned((|$signed(wire18[(1'h1):(1'h0)]))) ?
                  (~&reg32) : (|$unsigned(reg31)));
              reg29 <= ((+(&$signed((+reg31)))) ~^ $signed(reg30));
            end
          else
            begin
              reg26 <= $signed((reg28 ?
                  (|reg26) : (reg31[(2'h2):(1'h1)] ?
                      ((~^wire25) ~^ (wire23 == wire24)) : (wire20 ?
                          (reg29 <<< wire18) : (wire20 ? reg26 : (8'haf))))));
              reg27 <= $unsigned((($unsigned((wire22 ? (7'h42) : reg28)) ?
                  $unsigned((reg31 ? reg26 : wire19)) : ((wire21 ?
                          wire17 : wire21) ?
                      reg32[(4'h8):(1'h1)] : wire23)) | (reg32 + reg26[(3'h5):(1'h1)])));
            end
          reg30 <= reg30[(3'h5):(2'h2)];
          reg31 <= wire18[(2'h2):(1'h0)];
          if (({($signed((reg30 ? wire21 : wire20)) ?
                      $signed($signed(reg32)) : ((+reg31) ? wire20 : {wire24})),
                  $unsigned((wire17 == (wire22 ? reg31 : (8'ha5))))} ?
              ($signed((^~$unsigned(wire21))) ?
                  $unsigned($unsigned((&reg26))) : (-$signed((wire22 <= wire17)))) : (^(reg31 <<< ($unsigned(wire19) && (wire17 || wire22))))))
            begin
              reg32 <= $unsigned(($unsigned($signed($unsigned(reg30))) < ($signed(reg32) * {((8'hbc) ?
                      reg26 : reg28),
                  {(8'hac), reg26}})));
              reg33 <= $signed((wire25 ?
                  reg26 : $signed((-$unsigned(wire24)))));
              reg34 <= (($unsigned((^~$unsigned(wire24))) || ({(reg31 ?
                          (8'ha6) : (8'h9e))} ?
                  {(reg31 ? (8'hb5) : (8'hb7)), $unsigned(wire21)} : ((reg29 ?
                          wire25 : reg31) ?
                      wire22 : (reg30 ?
                          reg32 : reg29)))) <<< $unsigned($unsigned($unsigned((+wire20)))));
              reg35 <= (reg33[(3'h6):(3'h5)] ?
                  ((|{(reg33 ?
                          (8'ha8) : reg31)}) <<< ($signed($signed(reg33)) >>> $unsigned((reg33 < wire21)))) : $signed($unsigned(wire17[(1'h0):(1'h0)])));
            end
          else
            begin
              reg32 <= $signed((^~reg32[(4'h8):(3'h5)]));
              reg33 <= $unsigned(($signed($signed($signed(wire23))) ?
                  {$unsigned(reg32)} : reg31[(1'h0):(1'h0)]));
              reg34 <= (^$unsigned($signed($unsigned($signed(wire25)))));
              reg35 <= $unsigned((($signed((reg33 ?
                      (8'hb5) : reg35)) | $signed($signed(reg33))) ?
                  reg34 : {reg30}));
            end
          reg36 <= $unsigned(wire17);
        end
    end
  assign wire37 = wire24[(3'h5):(2'h2)];
  assign wire38 = wire18;
  assign wire39 = (wire25 | ($unsigned(((~reg32) ?
                          $signed(wire24) : (~&reg30))) ?
                      $unsigned((wire23[(1'h1):(1'h0)] <<< wire20[(4'hb):(3'h6)])) : (reg28 ?
                          ($unsigned((8'hab)) * $signed(reg32)) : reg30[(3'h7):(3'h5)])));
  assign wire40 = (reg26[(3'h4):(2'h2)] ?
                      (^~((7'h43) && ((reg31 ? wire37 : reg26) ?
                          {reg31} : (|wire22)))) : (($signed((|reg32)) ?
                              (!wire19) : $signed((reg31 < reg36))) ?
                          reg34[(2'h2):(2'h2)] : (~^(!$unsigned(reg30)))));
  assign wire41 = $unsigned($unsigned((~|(~^reg31))));
  assign wire42 = {reg28[(4'h8):(2'h3)],
                      ($signed((^~(reg26 ? wire23 : (8'hae)))) ?
                          {(~^wire37[(1'h0):(1'h0)])} : (!(!(reg31 ?
                              reg32 : reg36))))};
  always
    @(posedge clk) begin
      reg43 <= (^reg34);
    end
  assign wire44 = (((^((&(8'hb6)) ? (wire21 >= reg29) : wire22)) ?
                          wire18[(2'h3):(2'h3)] : $signed((-(8'ha4)))) ?
                      $signed(wire42[(1'h1):(1'h0)]) : (-wire41));
  assign wire45 = wire39;
  assign wire46 = $unsigned(wire40[(4'hc):(3'h7)]);
endmodule
