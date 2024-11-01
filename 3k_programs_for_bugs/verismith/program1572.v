module top
#(parameter param134 = {{((((8'hbc) > (8'hb9)) ? (~(8'hb6)) : (~(8'hbe))) ^ {(8'hb0), (8'hb2)})}}, 
parameter param135 = (param134 ~^ param134))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire112;
  wire signed [(4'ha):(1'h0)] wire110;
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire112,
                 wire110,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  module5 #() modinst111 (wire110, clk, wire1, wire4, wire3, wire2);
  assign wire112 = wire3[(2'h2):(1'h1)];
  module113 #() modinst125 (.wire114(wire4), .y(wire124), .clk(clk), .wire117(wire2), .wire115(wire112), .wire116(wire3));
  assign wire126 = (^(8'h9f));
  assign wire127 = wire126[(1'h0):(1'h0)];
  assign wire128 = ($signed($signed(($unsigned(wire110) ?
                           (wire127 ? wire2 : wire4) : wire124))) ?
                       $signed((wire112 ~^ (wire124 >> $unsigned(wire4)))) : ($signed(wire127[(4'h9):(3'h6)]) || wire1));
  assign wire129 = $unsigned((&wire1[(4'hd):(4'ha)]));
  always
    @(posedge clk) begin
      if (($unsigned($signed(wire127[(3'h5):(2'h2)])) ?
          wire1[(3'h4):(1'h0)] : (|{wire126})))
        begin
          reg130 <= wire2;
        end
      else
        begin
          if ((^(wire112[(3'h7):(3'h7)] ?
              (wire112[(1'h0):(1'h0)] ?
                  (-$unsigned(wire1)) : (wire3[(2'h3):(1'h1)] & wire128[(1'h1):(1'h1)])) : wire3[(4'hc):(4'hc)])))
            begin
              reg130 <= ((wire126 ? (-$unsigned(wire1)) : wire110) > (wire112 ?
                  $signed(($unsigned(wire2) ^~ (wire124 + wire0))) : (!wire129)));
            end
          else
            begin
              reg130 <= wire0;
            end
          reg131 <= (~|$signed((~^wire129)));
          reg132 <= ((&($unsigned($signed(wire110)) ^ {(wire112 ?
                      wire127 : reg130),
                  (-wire128)})) ?
              (wire3 ?
                  $signed(((wire129 & wire110) >>> (wire2 && wire126))) : wire3) : wire128);
        end
      reg133 <= wire4[(4'hb):(3'h7)];
    end
endmodule

module module113
#(parameter param122 = (((+(((8'hb7) >>> (8'ha6)) ? {(8'h9d)} : (8'hae))) << (^(((8'hb9) <<< (8'hb4)) ? {(8'hae), (8'ha9)} : ((8'hae) & (8'ha5))))) ? ((((~|(8'ha2)) > ((8'hb2) ? (8'hbc) : (8'hac))) ? ((|(8'hb0)) > ((8'ha4) >>> (8'ha9))) : ((8'hba) ? (+(8'haa)) : ((8'ha4) ? (8'h9d) : (7'h44)))) ? {(((8'h9f) & (8'ha8)) ? ((8'hb7) < (8'hb8)) : (!(8'hb8))), ({(8'hab), (8'ha6)} <<< ((8'hb5) ? (8'ha3) : (7'h42)))} : ((!{(8'hb8)}) ^~ ((^~(7'h40)) << ((8'hb1) & (8'haf))))) : ({(8'hb2), (~|((8'hbe) & (8'hab)))} <<< ((&((7'h43) ? (8'ha7) : (7'h44))) ? ({(8'h9c), (8'had)} | ((8'hae) <= (8'hb2))) : ({(8'hb6), (7'h40)} ? ((8'h9e) ? (8'haf) : (8'h9d)) : {(8'ha4), (8'hb7)})))), 
parameter param123 = ({{((-param122) <= (7'h41))}, ({(param122 ? param122 : param122)} ? (!(^~param122)) : param122)} + (8'ha4)))
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h1f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire117;
  input wire signed [(3'h6):(1'h0)] wire116;
  input wire [(2'h2):(1'h0)] wire115;
  input wire [(3'h5):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire118;
  reg [(4'hc):(1'h0)] reg121 = (1'h0);
  assign y = {wire120, wire119, wire118, reg121, (1'h0)};
  assign wire118 = $signed(wire116[(1'h0):(1'h0)]);
  assign wire119 = $unsigned({wire114[(1'h1):(1'h1)],
                       $unsigned(((wire118 && wire116) <= (7'h42)))});
  assign wire120 = (wire116 ?
                       $unsigned((wire115[(1'h0):(1'h0)] ?
                           (wire115[(2'h2):(2'h2)] != wire114) : $signed({(8'hac),
                               wire118}))) : (8'ha1));
  always
    @(posedge clk) begin
      reg121 <= (~&wire118[(1'h0):(1'h0)]);
    end
endmodule

module module5
#(parameter param109 = ({((~(~&(8'hbe))) ? {((8'hb4) ? (8'ha3) : (7'h43)), (~|(8'ha5))} : (((8'ha2) >= (8'hba)) ? ((8'hab) >> (8'hac)) : (8'ha7))), (!(((8'hb4) ? (8'hb7) : (8'h9e)) || ((8'ha2) ? (7'h41) : (8'hb2))))} ? {((-(~|(8'ha9))) ? (|{(8'hbc), (8'hae)}) : ({(8'hab)} <= ((8'had) ? (8'ha2) : (8'hbd)))), (^~(((8'haf) != (8'hba)) < ((8'h9f) ? (8'hbc) : (7'h42))))} : ((^~(((8'ha0) ^ (8'haa)) - ((8'hb8) ? (8'ha9) : (8'hab)))) >= {(((8'hb7) ? (8'h9d) : (7'h44)) ? (8'hb3) : ((8'hac) <<< (8'hbf)))})))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h212):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire55;
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  assign y = {wire108,
                 wire105,
                 wire82,
                 wire81,
                 wire80,
                 wire57,
                 wire10,
                 wire55,
                 reg107,
                 reg106,
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
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire10 = (~&{wire7[(5'h10):(1'h0)]});
  module11 #() modinst56 (.clk(clk), .wire16(wire10), .wire13(wire9), .wire12(wire6), .y(wire55), .wire14(wire7), .wire15(wire8));
  assign wire57 = wire9;
  always
    @(posedge clk) begin
      if (wire8[(1'h0):(1'h0)])
        begin
          if ($signed($signed((wire10[(4'h9):(4'h9)] ?
              wire9[(4'h8):(2'h3)] : $unsigned((+wire6))))))
            begin
              reg58 <= wire57;
              reg59 <= (~&wire57);
              reg60 <= reg59[(1'h0):(1'h0)];
            end
          else
            begin
              reg58 <= wire9[(1'h0):(1'h0)];
              reg59 <= wire7;
            end
        end
      else
        begin
          if (($unsigned((~{$signed(wire55), {reg60}})) >= $signed((reg58 ?
              $unsigned({wire55,
                  (8'ha8)}) : ($unsigned(wire8) <<< ((7'h44) != reg59))))))
            begin
              reg58 <= wire6;
              reg59 <= reg58[(4'he):(4'ha)];
              reg60 <= $signed($unsigned({(wire8 || (wire8 == reg58)), wire9}));
            end
          else
            begin
              reg58 <= (+wire6);
              reg59 <= (8'hb3);
              reg60 <= wire6[(3'h4):(2'h2)];
              reg61 <= $signed((wire57 ? reg59 : (8'hb3)));
            end
          reg62 <= ($signed($signed(wire55)) ?
              ($unsigned(((wire57 ? wire10 : reg58) ?
                  $signed(wire10) : {wire8, reg58})) & ($signed((~|(8'hb1))) ?
                  ((+reg61) && $unsigned(reg58)) : (wire55[(3'h7):(3'h7)] ?
                      $unsigned(wire55) : $unsigned((8'hb9))))) : (~wire6));
          reg63 <= wire10;
          reg64 <= (~&((|(reg63[(1'h1):(1'h0)] >>> reg61[(3'h4):(1'h1)])) ?
              (wire55 ?
                  {wire6, {reg59, reg61}} : ($unsigned(wire8) ?
                      wire55[(2'h2):(1'h0)] : (wire7 + wire7))) : wire57));
          if ((!reg64))
            begin
              reg65 <= wire9;
            end
          else
            begin
              reg65 <= (~^$signed((~^$unsigned(reg61))));
              reg66 <= $signed($signed((^wire7[(3'h4):(3'h4)])));
              reg67 <= reg65;
              reg68 <= (~(wire6 ?
                  $signed($unsigned((wire10 ?
                      reg67 : wire57))) : $unsigned((reg63 ^ (reg67 ?
                      wire57 : wire55)))));
              reg69 <= (8'hba);
            end
        end
      reg70 <= ($signed($signed(reg69[(4'ha):(4'h9)])) ?
          (~($unsigned({wire55, (8'hbe)}) ?
              ($signed(wire9) ?
                  (wire9 >> wire55) : {reg60}) : reg66)) : (+(!reg63[(2'h2):(2'h2)])));
      if (reg60)
        begin
          reg71 <= reg63[(1'h1):(1'h0)];
          reg72 <= ((8'hb1) | (wire57[(1'h0):(1'h0)] - reg68[(4'hc):(2'h2)]));
          if (wire55[(1'h0):(1'h0)])
            begin
              reg73 <= wire7;
              reg74 <= ({(+$unsigned(reg61)),
                  (!(~|(wire7 ? reg69 : wire8)))} >>> $unsigned(reg59));
            end
          else
            begin
              reg73 <= ($unsigned({reg70[(4'hb):(1'h1)],
                      reg59[(1'h0):(1'h0)]}) ?
                  $unsigned((((wire10 + reg65) == wire6) ?
                      $signed($signed(wire6)) : $unsigned($signed(wire8)))) : $unsigned($unsigned(reg62[(3'h4):(3'h4)])));
              reg74 <= (((($unsigned(reg65) ?
                              reg63[(1'h0):(1'h0)] : $unsigned(wire7)) ?
                          reg67[(3'h6):(1'h1)] : $signed($unsigned((8'hb4)))) ?
                      $unsigned((((8'had) ~^ reg58) ?
                          ((8'haf) <= reg62) : (wire9 * reg71))) : (+reg74[(4'he):(4'h9)])) ?
                  reg61[(3'h5):(2'h3)] : (~^wire8));
              reg75 <= (8'hbf);
              reg76 <= (8'had);
            end
          reg77 <= reg69;
        end
      else
        begin
          if (reg58[(1'h1):(1'h0)])
            begin
              reg71 <= {wire55};
            end
          else
            begin
              reg71 <= $unsigned($signed($unsigned($unsigned((8'ha9)))));
              reg72 <= $unsigned(reg60[(3'h6):(1'h1)]);
              reg73 <= ($unsigned($unsigned($signed(reg69))) ?
                  ($signed($signed({wire55,
                      reg62})) | ($signed($unsigned(wire9)) ?
                      reg63 : ((wire8 ^~ (8'had)) ?
                          wire6 : reg75[(3'h5):(2'h2)]))) : (~((8'haa) ?
                      (~|(reg68 << wire7)) : $unsigned(reg72[(1'h0):(1'h0)]))));
            end
          if ((($signed(($unsigned(reg67) * (^~reg64))) ~^ {$signed(((8'hbb) ?
                      wire6 : reg58))}) ?
              $signed($signed($signed($signed(reg77)))) : ($signed((|reg77)) ?
                  ({$signed(reg77), (reg61 ? (8'had) : (8'hb5))} ?
                      reg60 : reg71[(1'h1):(1'h0)]) : ((^~$unsigned(reg62)) ?
                      {$unsigned(reg58)} : reg63[(2'h2):(1'h1)]))))
            begin
              reg74 <= $unsigned(reg74);
            end
          else
            begin
              reg74 <= $signed(($unsigned(($signed(reg69) + (reg65 ?
                      (8'hb2) : reg63))) ?
                  reg60 : $unsigned((~|$signed(reg75)))));
              reg75 <= (~|reg75);
              reg76 <= ($signed($signed((wire57 ?
                  ((8'hbc) ? reg58 : reg73) : ((8'hbd) ?
                      wire55 : wire8)))) && (+wire55));
            end
        end
      reg78 <= reg67;
      reg79 <= wire7;
    end
  assign wire80 = ((|{$unsigned((|reg73)), $unsigned((|reg72))}) <<< (8'ha6));
  assign wire81 = $signed((reg69[(4'h9):(1'h1)] <= (!$signed((reg77 * wire8)))));
  assign wire82 = reg75;
  always
    @(posedge clk) begin
      if (($signed(({(reg68 << reg62), (+reg62)} - $unsigned((~wire7)))) ?
          ((reg75[(2'h2):(2'h2)] ?
              ({reg72,
                  reg63} <<< wire10[(3'h4):(2'h3)]) : wire55[(1'h0):(1'h0)]) - $signed((^~(&reg71)))) : ({(reg77[(1'h0):(1'h0)] ?
                  wire8 : (+reg60))} + {{{reg77, reg69}, $unsigned(wire8)},
              reg72})))
        begin
          reg83 <= (~(+wire57[(3'h4):(2'h2)]));
          reg84 <= {{reg69[(1'h0):(1'h0)], (reg65 & reg70)}, $signed((8'hbd))};
        end
      else
        begin
          reg83 <= $unsigned((8'ha0));
          reg84 <= {($unsigned($signed((wire82 >>> reg59))) ^ $signed($signed($unsigned(wire8)))),
              reg69[(4'h9):(1'h1)]};
        end
      reg85 <= reg59[(2'h2):(1'h0)];
      if (reg69[(3'h7):(3'h5)])
        begin
          if ($unsigned({$signed(($signed(reg64) && wire80)),
              {{$signed(wire6)}}}))
            begin
              reg86 <= {((^~$signed((wire8 ?
                      reg68 : reg68))) >> $unsigned({(+wire6),
                      (reg62 ? wire81 : reg84)})),
                  (~^$signed(reg64))};
              reg87 <= reg64[(4'h9):(2'h3)];
            end
          else
            begin
              reg86 <= (|(wire82 << ({(~|reg66)} + $signed((^(8'hbd))))));
              reg87 <= (8'hb7);
              reg88 <= reg67;
              reg89 <= ($signed(wire57) * (8'h9f));
            end
          reg90 <= $unsigned($signed(($signed($signed(reg61)) > ((reg75 > reg69) | (reg59 && reg66)))));
          reg91 <= $unsigned((~(~wire10[(4'hc):(3'h4)])));
          reg92 <= $unsigned($unsigned($signed(wire10[(1'h1):(1'h1)])));
        end
      else
        begin
          if (((&(7'h41)) ?
              $unsigned(reg86) : $signed((+$unsigned(reg77[(2'h3):(1'h0)])))))
            begin
              reg86 <= $signed(((&wire7[(3'h4):(2'h3)]) <<< $signed(($unsigned(reg83) ?
                  {reg91, (8'hab)} : $unsigned(reg84)))));
              reg87 <= {$signed($signed(reg89[(2'h2):(1'h0)])),
                  $signed((8'h9c))};
              reg88 <= reg86;
              reg89 <= (8'had);
            end
          else
            begin
              reg86 <= (($unsigned($unsigned({reg63,
                      reg64})) || $unsigned(reg76[(1'h0):(1'h0)])) ?
                  {$unsigned((-(wire55 ? (8'hab) : reg60))),
                      (wire10[(1'h1):(1'h1)] ?
                          ((8'hb9) > $signed(reg73)) : ($signed(reg79) ?
                              (~&reg65) : {reg69}))} : wire9);
              reg87 <= {$signed(({reg59[(3'h5):(3'h4)]} >>> reg90[(2'h2):(1'h0)])),
                  (~(7'h40))};
              reg88 <= $signed($unsigned($unsigned(wire9[(4'ha):(3'h6)])));
              reg89 <= {$unsigned($signed(reg63))};
              reg90 <= (reg84[(4'ha):(2'h3)] ? reg69 : reg72);
            end
          reg91 <= (($signed(($unsigned(reg76) + $signed(wire7))) + (reg68 != ((reg78 >> wire6) != reg64))) ?
              reg68[(4'hf):(1'h1)] : (((8'ha6) ^ reg62[(2'h2):(1'h1)]) & ((8'haa) ?
                  (!wire6) : (~|(wire80 >>> reg65)))));
          reg92 <= (^~$unsigned((+reg70[(4'h8):(3'h6)])));
          reg93 <= reg76;
          if ((~^reg79[(4'hd):(4'ha)]))
            begin
              reg94 <= (($signed((reg73 << $unsigned(wire55))) ?
                  wire10 : $signed((|(reg61 ~^ reg72)))) ^~ $signed(($unsigned(reg89) ?
                  ({wire9, reg68} * $unsigned(reg84)) : reg65)));
              reg95 <= reg75;
              reg96 <= reg71[(1'h1):(1'h0)];
              reg97 <= reg73;
            end
          else
            begin
              reg94 <= $signed($unsigned(($unsigned(reg65[(2'h3):(2'h3)]) ?
                  (wire8 * $signed((8'ha8))) : ({reg66} ?
                      (-reg70) : {wire55}))));
              reg95 <= (&$unsigned((($signed(reg58) ?
                  $signed(reg63) : (8'h9e)) >= $signed($signed(reg67)))));
              reg96 <= $unsigned(($signed($unsigned(reg63[(1'h0):(1'h0)])) ~^ reg71[(1'h0):(1'h0)]));
            end
        end
      if ((($unsigned($unsigned((reg60 <<< (8'hae)))) & reg64) <= (&reg67[(3'h4):(3'h4)])))
        begin
          reg98 <= $signed(((-(reg60 ?
              $unsigned(reg62) : wire80[(2'h2):(1'h0)])) * wire81[(4'hb):(4'h8)]));
          reg99 <= (|reg95[(1'h1):(1'h0)]);
          reg100 <= reg65;
        end
      else
        begin
          reg98 <= reg60;
          reg99 <= reg93[(1'h1):(1'h0)];
          if (reg66)
            begin
              reg100 <= {$signed($unsigned((^~reg63)))};
              reg101 <= ((^~reg63[(1'h0):(1'h0)]) || $unsigned(wire80));
            end
          else
            begin
              reg100 <= $unsigned(($unsigned($signed(reg94[(3'h6):(2'h2)])) ?
                  ((8'ha7) ?
                      wire10[(4'hc):(4'h8)] : ((+reg91) ?
                          $signed(wire81) : $unsigned(reg65))) : $signed(reg100[(3'h7):(1'h0)])));
              reg101 <= (wire55[(1'h0):(1'h0)] ?
                  $unsigned((($unsigned(reg66) | reg78) ?
                      $signed((~&reg67)) : (reg93 | reg61))) : $signed((reg98[(3'h5):(2'h3)] ~^ $signed((reg83 ?
                      reg76 : reg99)))));
              reg102 <= $signed($unsigned($unsigned((reg76 ~^ ((8'hb4) && reg85)))));
            end
          reg103 <= (^~reg66);
        end
      reg104 <= reg100[(3'h6):(3'h4)];
    end
  assign wire105 = $unsigned($unsigned((~|wire80)));
  always
    @(posedge clk) begin
      reg106 <= reg95;
      reg107 <= $signed((7'h40));
    end
  assign wire108 = wire8;
endmodule

module module11
#(parameter param54 = ((^~({((8'hb4) || (8'hbf)), (-(8'h9f))} ? (((8'hba) ? (7'h42) : (8'ha4)) ? (+(8'haa)) : (^~(8'ha0))) : (8'hb0))) == ((8'ha8) ? ((8'h9d) * (((7'h41) >> (8'hbd)) ~^ (+(8'hb0)))) : (((+(8'ha6)) ? {(8'h9e), (7'h43)} : (~&(8'hb1))) * ((~(8'ha1)) ? ((8'hb2) >>> (8'h9c)) : (7'h41))))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire16;
  input wire [(4'hd):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire17;
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire33,
                 wire30,
                 wire17,
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
                 reg34,
                 reg32,
                 reg31,
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
  assign wire17 = (~^(~&$signed(((wire15 != wire12) ?
                      (wire13 ^~ wire15) : (8'hb0)))));
  always
    @(posedge clk) begin
      reg18 <= wire15;
      if (wire12[(3'h7):(3'h7)])
        begin
          reg19 <= wire12[(1'h0):(1'h0)];
          reg20 <= (($signed((^$unsigned(wire16))) ?
                  $unsigned((wire16[(4'h8):(3'h4)] << wire16[(1'h1):(1'h1)])) : (~^$unsigned((wire12 ?
                      wire14 : reg19)))) ?
              reg18[(4'hb):(2'h3)] : (|((&$signed(wire12)) > (wire15[(3'h7):(3'h4)] & wire13[(3'h7):(2'h2)]))));
          if ({((&((&wire13) ?
                  wire17[(3'h4):(3'h4)] : (reg19 == wire15))) < $unsigned(wire16[(3'h4):(3'h4)])),
              {wire16, wire13}})
            begin
              reg21 <= ((~|(~(+$unsigned(wire15)))) < {($signed((|wire12)) ?
                      (~&wire17) : wire15),
                  $signed(wire15[(4'hd):(2'h3)])});
              reg22 <= ((($unsigned(((7'h44) != reg21)) << (reg19 ?
                      reg21[(1'h0):(1'h0)] : $signed(wire15))) ?
                  $signed(reg19) : $unsigned(((|(8'hbe)) < $signed(reg20)))) + $signed((reg21[(2'h3):(1'h0)] <<< wire15)));
              reg23 <= (reg21 ?
                  $unsigned(((8'hbb) <= reg20[(4'h9):(3'h6)])) : {({wire16[(3'h4):(2'h3)],
                              wire13} ?
                          (wire14 >>> (wire12 ?
                              reg19 : (8'hbb))) : (reg22 | $unsigned(reg21))),
                      $signed(({reg19} ?
                          (wire12 == (8'hb4)) : wire17[(2'h2):(1'h0)]))});
              reg24 <= wire16[(3'h7):(2'h3)];
            end
          else
            begin
              reg21 <= $unsigned(wire13[(3'h5):(3'h4)]);
            end
          reg25 <= reg23;
          reg26 <= wire15;
        end
      else
        begin
          reg19 <= $signed(($unsigned($signed(wire16[(3'h4):(1'h1)])) ^~ $signed($signed($signed(wire17)))));
        end
      reg27 <= (((($unsigned(wire14) ?
              (^reg19) : (~|(8'hb7))) * $unsigned((8'hb2))) ?
          $signed((-$unsigned(reg20))) : wire15) - wire13);
      reg28 <= {$signed(((reg24 ?
              {reg26, reg27} : (!(8'ha8))) ^ $unsigned($unsigned((8'ha1))))),
          reg20};
      reg29 <= $unsigned($unsigned(reg21));
    end
  assign wire30 = $signed(((^(reg25 << wire15)) ?
                      (^~reg28[(4'h8):(2'h2)]) : wire16));
  always
    @(posedge clk) begin
      reg31 <= ((reg26 ? wire17[(4'hf):(4'ha)] : reg25[(5'h10):(4'hc)]) ?
          (reg24[(4'hf):(1'h0)] && $signed(((wire30 ?
              reg27 : reg22) - (wire15 < reg22)))) : ($unsigned(reg27) * (^wire16[(1'h0):(1'h0)])));
      reg32 <= reg28;
    end
  assign wire33 = wire30[(4'hc):(3'h6)];
  always
    @(posedge clk) begin
      if (wire12)
        begin
          reg34 <= {$signed(reg29[(1'h0):(1'h0)])};
          reg35 <= (~reg29[(1'h1):(1'h0)]);
          if ($signed(((^wire17[(1'h0):(1'h0)]) ?
              reg23 : ((reg18 ? reg26[(2'h2):(1'h1)] : reg26[(3'h5):(3'h4)]) ?
                  reg24[(4'h8):(3'h4)] : ($unsigned(reg32) ?
                      (wire13 ? (8'ha2) : reg23) : $unsigned(wire30))))))
            begin
              reg36 <= reg25;
              reg37 <= reg36;
            end
          else
            begin
              reg36 <= (((~^(^~wire33)) + $unsigned({$unsigned(reg21),
                      $signed((8'ha4))})) ?
                  reg24 : (^~$signed(wire33)));
            end
        end
      else
        begin
          if (reg22[(1'h0):(1'h0)])
            begin
              reg34 <= ((reg26[(1'h0):(1'h0)] ?
                  reg32 : {$unsigned(wire16)}) > $unsigned(wire15[(2'h2):(2'h2)]));
              reg35 <= reg31[(3'h5):(2'h2)];
              reg36 <= reg35;
              reg37 <= {reg32[(3'h5):(3'h4)], reg21};
              reg38 <= (wire17[(5'h12):(4'he)] > (8'hab));
            end
          else
            begin
              reg34 <= $signed($unsigned((wire13[(4'h8):(3'h5)] ?
                  reg37 : reg18[(2'h2):(2'h2)])));
              reg35 <= $unsigned($unsigned($signed(wire33[(2'h3):(1'h0)])));
            end
          reg39 <= $signed(reg35);
          reg40 <= reg39;
          reg41 <= {(^~((wire13 ?
                  {(8'hb4), (8'ha0)} : ((8'hb8) ?
                      wire14 : reg24)) <= (!(reg21 * wire33)))),
              ($unsigned((&(~^reg34))) != wire14)};
          reg42 <= $unsigned($signed(({$signed(reg22)} ?
              (reg31 - ((7'h42) == reg20)) : ((reg29 ?
                  reg28 : wire16) < wire16[(3'h7):(3'h6)]))));
        end
      reg43 <= reg38[(4'hd):(3'h6)];
      if ($signed(reg24))
        begin
          reg44 <= (reg32 && {reg20[(3'h6):(2'h2)],
              (+$signed((reg21 ? reg22 : reg27)))});
          reg45 <= reg28;
          if (wire12)
            begin
              reg46 <= (-$signed(reg43[(2'h3):(1'h0)]));
              reg47 <= $unsigned(((((&reg34) ? reg46 : reg18) ?
                  reg46[(3'h4):(1'h0)] : (^~(reg18 ?
                      reg39 : reg18))) | $unsigned((^~reg28))));
              reg48 <= (8'ha6);
              reg49 <= wire33;
              reg50 <= $unsigned((reg34[(1'h1):(1'h1)] << reg44[(4'h9):(2'h3)]));
            end
          else
            begin
              reg46 <= (reg49 == (^wire33[(4'h8):(3'h7)]));
              reg47 <= ($unsigned($signed($unsigned(reg28))) ?
                  {reg23[(4'ha):(4'h9)], (~&reg29)} : {reg47[(2'h3):(1'h1)],
                      (!(~&reg44[(2'h2):(1'h0)]))});
              reg48 <= $unsigned(reg32);
            end
        end
      else
        begin
          reg44 <= (reg42 || (~|{reg49[(3'h4):(2'h3)]}));
          reg45 <= $signed((^~$unsigned(((reg47 ?
              reg37 : reg47) >> $unsigned(wire30)))));
          reg46 <= {($unsigned($signed(reg22[(4'hd):(1'h1)])) - reg37)};
          reg47 <= (8'had);
          reg48 <= reg23[(4'ha):(3'h7)];
        end
    end
  assign wire51 = reg46;
  assign wire52 = $unsigned(($unsigned($unsigned((~&reg32))) << {$unsigned((reg48 != reg24)),
                      $unsigned(((7'h41) >>> reg35))}));
  assign wire53 = (reg22[(4'hd):(4'hd)] ?
                      {$unsigned((reg50[(1'h1):(1'h0)] - reg48))} : wire16[(4'h8):(3'h6)]);
endmodule
