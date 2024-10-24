module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire94;
  wire signed [(4'ha):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire76;
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire79,
                 wire78,
                 wire22,
                 wire24,
                 wire25,
                 wire33,
                 wire34,
                 wire76,
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
                 reg82,
                 reg81,
                 reg80,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  module5 #() modinst23 (.clk(clk), .y(wire22), .wire9(wire1), .wire7(wire2), .wire6(wire0), .wire8(wire4));
  assign wire24 = (wire22 - wire4);
  assign wire25 = {wire1};
  always
    @(posedge clk) begin
      if ((wire25[(1'h0):(1'h0)] ?
          $unsigned(((~^(~&wire1)) ?
              (!(wire3 >> (8'hb3))) : (wire2 ?
                  (wire1 * wire24) : $signed(wire4)))) : (~&(8'had))))
        begin
          if ((8'ha8))
            begin
              reg26 <= wire4[(3'h4):(2'h3)];
              reg27 <= ($signed(wire25[(3'h4):(1'h0)]) ~^ $signed(wire0));
            end
          else
            begin
              reg26 <= {(8'hb5), $unsigned(wire22)};
              reg27 <= $signed(((wire1[(3'h4):(1'h0)] ? reg26 : (!{wire1})) ?
                  (($unsigned(wire24) ?
                      (wire1 ?
                          wire1 : (8'hb0)) : wire1) > $signed((!reg26))) : ($unsigned($unsigned((8'hac))) ?
                      {(wire1 ? wire3 : wire4)} : $signed($unsigned(wire22)))));
              reg28 <= $signed($unsigned(wire25));
            end
        end
      else
        begin
          if (wire0[(4'ha):(3'h6)])
            begin
              reg26 <= (7'h42);
              reg27 <= ($unsigned({$unsigned((reg27 - wire4))}) >= $signed(({reg27[(2'h3):(1'h0)]} ?
                  ((wire1 >>> reg28) ?
                      wire2[(2'h3):(2'h3)] : $signed(wire0)) : wire1)));
              reg28 <= $unsigned((^($unsigned((&wire24)) * ($signed(wire0) ?
                  wire2[(3'h6):(2'h2)] : $unsigned(wire24)))));
              reg29 <= {({$signed((wire1 ? reg26 : (8'ha2))),
                      ((reg27 != wire0) ? wire0 : (~^wire22))} < (({wire0} ?
                          wire24[(1'h0):(1'h0)] : (wire22 - wire3)) ?
                      $signed($unsigned((8'ha3))) : reg28[(4'ha):(2'h2)]))};
              reg30 <= $unsigned(reg29);
            end
          else
            begin
              reg26 <= $signed((($signed((wire22 ? wire1 : wire4)) ?
                  reg29[(2'h2):(1'h1)] : wire0) * (|(~wire3[(4'ha):(1'h1)]))));
              reg27 <= (reg28[(3'h4):(1'h0)] ?
                  ($signed(wire1[(2'h3):(1'h1)]) ?
                      wire4 : $unsigned($unsigned(wire2))) : $signed($unsigned(reg30)));
              reg28 <= ((-($signed(reg27) - (reg30 <<< (+reg26)))) + (~|$signed((+wire24))));
            end
        end
      reg31 <= $signed($unsigned(wire0));
      reg32 <= {reg29, wire1};
    end
  assign wire33 = (($unsigned($unsigned(wire2)) | ((~^$signed(wire4)) ?
                      (+$unsigned((8'hb1))) : ((^~wire3) ?
                          $signed(wire24) : wire1[(3'h6):(3'h6)]))) >= (($unsigned($unsigned((8'hb0))) ?
                          $unsigned((^reg31)) : (wire4 ?
                              (~&reg28) : (+reg29))) ?
                      $unsigned({reg32}) : $signed(wire2)));
  assign wire34 = {(($unsigned((reg31 ? wire4 : reg28)) << $unsigned((reg29 ?
                          wire2 : reg28))) ^ $signed((wire33[(3'h6):(2'h3)] + $signed(wire2))))};
  module35 #() modinst77 (wire76, clk, reg27, wire25, wire33, wire0, reg32);
  assign wire78 = {$signed(wire22)};
  assign wire79 = (~^wire22);
  always
    @(posedge clk) begin
      if (wire33[(3'h7):(3'h7)])
        begin
          reg80 <= {wire79[(3'h5):(2'h2)], reg28[(5'h10):(4'h8)]};
          reg81 <= wire33[(3'h6):(1'h1)];
          if ($signed(wire1))
            begin
              reg82 <= ($signed((~reg32[(3'h7):(3'h7)])) == (reg30[(3'h4):(1'h0)] << {(((8'hb1) ?
                          reg30 : (8'h9e)) ?
                      ((8'had) ? reg32 : reg30) : ((8'hb0) != wire22))}));
              reg83 <= (~&($signed(((reg82 <= wire76) >= (wire25 ~^ reg30))) ?
                  $unsigned(($unsigned(reg27) || wire24[(1'h0):(1'h0)])) : (~wire0[(3'h7):(2'h3)])));
              reg84 <= ($unsigned({wire78}) ~^ wire22[(4'he):(1'h0)]);
            end
          else
            begin
              reg82 <= (-(~^$signed($signed($signed(wire3)))));
              reg83 <= wire79;
            end
          reg85 <= (~^(~&$signed($unsigned($signed(wire2)))));
          reg86 <= ((((~&$unsigned(wire1)) ? wire0 : wire2) ?
                  $unsigned(reg26) : reg26) ?
              ((wire22 ?
                  $unsigned(reg81) : (reg82[(1'h1):(1'h1)] ?
                      {reg81, reg85} : (reg85 ? reg31 : wire0))) << {wire0,
                  $unsigned((reg26 ?
                      reg30 : wire24))}) : $signed(($signed((wire79 - reg27)) ?
                  (wire76 - $unsigned(wire76)) : (wire79 ~^ reg84[(4'hb):(2'h3)]))));
        end
      else
        begin
          reg80 <= ((wire33[(5'h10):(4'h9)] ?
                  ($unsigned(wire1) ?
                      ((reg81 ?
                          reg82 : reg32) <= {wire34}) : $signed((8'ha5))) : $signed(($unsigned(reg84) != reg26[(2'h2):(1'h1)]))) ?
              {$signed(reg82[(3'h4):(2'h2)])} : reg86[(1'h0):(1'h0)]);
          reg81 <= (($signed(({wire4, reg32} ? (|wire22) : $signed(wire79))) ?
              ((~^{reg85, reg83}) <= (8'ha2)) : {$unsigned((wire0 + reg80)),
                  ((wire76 ? wire2 : wire3) ?
                      (reg84 ?
                          wire3 : (7'h40)) : (~&(8'hb0)))}) & $unsigned((($signed(wire79) ?
                  $unsigned(reg82) : $unsigned(reg26)) ?
              (~^reg30) : ($unsigned(wire79) >= ((8'hb5) ? wire3 : (8'hb8))))));
          if ($unsigned(($signed($signed((wire2 ?
              (8'hbf) : reg83))) >= ((+reg31) ^ ({reg27, reg30} ?
              $unsigned(reg83) : (wire2 | wire4))))))
            begin
              reg82 <= $unsigned(wire79);
              reg83 <= reg30;
              reg84 <= $signed(reg80);
              reg85 <= (&(!$unsigned(($unsigned(reg86) | (wire24 | wire4)))));
            end
          else
            begin
              reg82 <= (reg32 <<< wire78[(2'h3):(2'h2)]);
              reg83 <= (+reg86);
            end
          if ({reg83[(4'hb):(2'h3)]})
            begin
              reg86 <= reg80[(2'h2):(1'h1)];
              reg87 <= (!((wire4[(4'hb):(4'hb)] ?
                      {wire4[(3'h6):(1'h1)]} : reg86[(4'hb):(3'h7)]) ?
                  $signed($unsigned({(7'h41)})) : (8'ha9)));
              reg88 <= $unsigned(reg29[(1'h1):(1'h1)]);
            end
          else
            begin
              reg86 <= $unsigned(reg28);
            end
          reg89 <= ((&(wire76 ?
              (((8'hb5) ?
                  wire3 : wire2) ~^ reg83[(3'h5):(3'h4)]) : reg87[(4'hb):(3'h7)])) || {$signed((+$unsigned(reg81)))});
        end
      reg90 <= $unsigned((^$signed(((wire24 ? (8'haf) : wire79) ?
          (^wire24) : reg86[(5'h10):(3'h7)]))));
      reg91 <= (&(-(8'ha8)));
      reg92 <= $signed((|($unsigned(reg26[(1'h1):(1'h1)]) + wire2)));
    end
  assign wire93 = $unsigned(wire78[(1'h0):(1'h0)]);
  assign wire94 = ($signed(wire1[(1'h0):(1'h0)]) ?
                      (~^(^((wire78 ? (8'hbc) : reg26) ?
                          (wire1 << reg80) : reg29[(1'h0):(1'h0)]))) : wire22);
  assign wire95 = (($unsigned((+$unsigned(wire25))) ?
                          $signed(($unsigned(wire0) - $unsigned(wire34))) : reg85[(2'h3):(2'h3)]) ?
                      (reg84[(4'he):(4'hb)] ?
                          $signed((8'h9c)) : $unsigned(((-wire76) ?
                              reg88[(2'h3):(1'h1)] : (~^reg80)))) : $signed($unsigned((reg90 == {wire24}))));
endmodule

module module35  (y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire40;
  input wire signed [(4'he):(1'h0)] wire39;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire [(5'h12):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  assign y = {wire74,
                 wire60,
                 wire59,
                 wire58,
                 wire42,
                 wire41,
                 reg75,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire41 = (^(wire36 == (($unsigned(wire40) ?
                          wire38 : (wire38 - (8'ha1))) ?
                      (-(wire37 ? wire39 : wire38)) : $signed((+wire37)))));
  assign wire42 = wire40[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg43 <= $unsigned((^((|(wire39 ?
          (8'hba) : (8'hb3))) - wire37[(1'h1):(1'h0)])));
      reg44 <= $signed($signed((wire37[(2'h3):(2'h2)] ?
          reg43 : ((^reg43) ?
              ((8'hb3) ? wire37 : wire38) : ((8'hb9) ^~ reg43)))));
      reg45 <= {(8'haf)};
      reg46 <= $unsigned(wire37);
      if (($unsigned($unsigned({$unsigned(wire36)})) ?
          {reg45} : $signed(reg43)))
        begin
          reg47 <= $signed((((+wire37) ?
                  ($unsigned(wire37) ?
                      (reg46 ?
                          wire40 : wire42) : $unsigned(reg46)) : ($signed(wire42) ?
                      (wire38 ? reg45 : wire41) : (wire36 <= (7'h40)))) ?
              reg44[(4'h8):(2'h3)] : reg45));
          reg48 <= ($signed((((reg45 ? (8'h9d) : reg47) ?
              wire37 : reg44[(3'h5):(2'h3)]) == reg45)) <<< (|{{(wire38 | reg45),
                  {wire42}},
              ((wire42 + reg46) ? wire36[(3'h4):(2'h3)] : (-reg44))}));
        end
      else
        begin
          reg47 <= ((reg47[(1'h0):(1'h0)] >= ($signed({reg45}) ?
                  (8'ha8) : (^~reg47[(1'h1):(1'h0)]))) ?
              ({($unsigned(wire38) ?
                      $signed(wire41) : wire39)} >>> $signed(((wire39 ?
                  reg48 : wire37) >= $unsigned(wire36)))) : $signed(reg48[(1'h1):(1'h0)]));
          reg48 <= wire38[(1'h1):(1'h0)];
          reg49 <= {wire37, (~|reg48)};
          if ($signed(wire36[(2'h3):(2'h2)]))
            begin
              reg50 <= ({reg45,
                  reg48[(2'h2):(1'h0)]} - (^$signed(wire42[(2'h3):(1'h0)])));
              reg51 <= wire38;
              reg52 <= $unsigned($signed((^~reg47)));
            end
          else
            begin
              reg50 <= wire38[(4'h8):(1'h0)];
              reg51 <= ($unsigned($signed(({(8'hbc), reg52} ?
                  $signed(wire39) : {reg48,
                      wire38}))) != (~^((-$unsigned(reg51)) > {wire40,
                  reg43[(3'h7):(2'h2)]})));
              reg52 <= reg47;
            end
        end
    end
  always
    @(posedge clk) begin
      reg53 <= reg52[(2'h3):(1'h0)];
      reg54 <= (^$signed((&({wire41} || (|wire38)))));
      reg55 <= (reg54[(4'h9):(4'h9)] & {$signed(reg51[(4'h8):(3'h7)]),
          (8'hb5)});
      reg56 <= (8'hb1);
      reg57 <= ((!$unsigned((^((8'ha7) ? (8'h9e) : reg52)))) ?
          (|({reg51[(3'h6):(3'h5)],
              wire38[(3'h4):(2'h3)]} <= {$signed((8'hb0))})) : reg46);
    end
  assign wire58 = (^$unsigned(((^(reg47 == wire36)) ?
                      {(~^reg45), reg52[(3'h5):(3'h4)]} : (8'ha9))));
  assign wire59 = ($signed(({(reg56 - reg52)} ?
                      $unsigned((reg55 ?
                          reg49 : (8'hb2))) : (^$unsigned(reg57)))) != ((|$unsigned((reg56 ?
                      wire58 : reg56))) >>> (~^wire36)));
  assign wire60 = reg56[(4'hd):(3'h7)];
  always
    @(posedge clk) begin
      if (wire60)
        begin
          reg61 <= $signed(reg57[(4'hf):(4'ha)]);
          reg62 <= (^reg61);
          reg63 <= ((!$signed(reg52[(1'h1):(1'h1)])) - $signed($unsigned($signed($signed(reg46)))));
        end
      else
        begin
          if (($unsigned((-wire40[(1'h0):(1'h0)])) ^ ($unsigned(((~reg43) | $unsigned(wire38))) ?
              $signed(($unsigned((8'hbe)) ?
                  $unsigned(reg49) : $signed((7'h40)))) : ($signed($signed(reg61)) ?
                  {(&(8'h9f)),
                      (reg63 & wire40)} : $signed(((8'hba) ~^ wire36))))))
            begin
              reg61 <= (reg61[(3'h7):(3'h7)] ?
                  wire38 : (~^$signed(((reg56 ^ reg61) && reg62[(3'h7):(3'h5)]))));
              reg62 <= ($unsigned(reg61) ?
                  $unsigned(({(reg55 - reg49)} ?
                      reg47[(4'h8):(1'h0)] : {wire60,
                          $unsigned((8'h9d))})) : ($unsigned((+$unsigned(wire40))) == (reg52 ?
                      wire37 : (8'hbb))));
              reg63 <= reg57;
              reg64 <= (^$signed(wire36[(1'h0):(1'h0)]));
              reg65 <= (($unsigned(($signed((8'ha1)) >>> reg55)) || (&reg55[(1'h0):(1'h0)])) - {$signed(reg62[(4'h8):(4'h8)]),
                  {wire58, reg61}});
            end
          else
            begin
              reg61 <= reg65[(5'h14):(4'hd)];
              reg62 <= (8'ha3);
              reg63 <= (8'ha8);
              reg64 <= ($signed((reg51 & reg56)) - $unsigned($signed(wire42[(1'h0):(1'h0)])));
            end
          if ($signed((((reg56[(3'h5):(2'h2)] ?
                  $signed(wire40) : $unsigned(reg61)) + (-$unsigned(reg57))) ?
              {((7'h40) ? (wire40 ? (7'h43) : reg51) : $signed(reg64)),
                  (+(~&reg65))} : $unsigned(wire41[(1'h0):(1'h0)]))))
            begin
              reg66 <= $unsigned((reg51 ?
                  $signed(((^(8'hb2)) ?
                      wire58[(4'h8):(2'h3)] : reg61)) : ($unsigned(reg63[(3'h6):(1'h1)]) ?
                      reg43[(4'h8):(3'h7)] : reg57)));
              reg67 <= ($signed({reg61[(1'h1):(1'h0)],
                  reg56}) < ({$signed({reg56}),
                  {wire37}} <= {$unsigned($signed(reg54)), (7'h43)}));
              reg68 <= $unsigned($unsigned({wire37}));
              reg69 <= $signed(reg49[(2'h2):(2'h2)]);
              reg70 <= reg67;
            end
          else
            begin
              reg66 <= (~|(!{(((8'ha6) == reg63) <<< $unsigned(reg63))}));
              reg67 <= (((~&wire59[(3'h6):(3'h6)]) ?
                  $signed(reg64[(2'h2):(1'h1)]) : {$signed(wire41)}) == reg68[(3'h5):(2'h2)]);
              reg68 <= reg44[(1'h0):(1'h0)];
              reg69 <= $signed((($unsigned((reg62 == reg46)) <= (!$signed(wire40))) << (&(|$signed(reg57)))));
            end
          reg71 <= (reg66[(1'h1):(1'h1)] ?
              (~($signed((~(8'h9f))) ?
                  wire60[(2'h3):(1'h1)] : wire60[(3'h5):(1'h0)])) : $unsigned($unsigned(reg43[(2'h3):(2'h3)])));
          reg72 <= (wire60 ?
              reg50[(3'h7):(3'h7)] : $unsigned((reg64[(3'h5):(2'h2)] ^~ (((7'h41) > wire38) ?
                  $signed((8'ha5)) : reg61[(4'h8):(4'h8)]))));
          if ((&(((reg62 * (reg45 & reg46)) ?
                  reg51 : ($signed(reg43) ?
                      (wire59 ? wire42 : reg45) : $signed(reg47))) ?
              (8'ha7) : ({$unsigned(wire38)} ?
                  (reg69 ^~ reg67) : {reg69[(1'h1):(1'h1)]}))))
            begin
              reg73 <= $unsigned(((^~($signed(reg44) ?
                  reg43 : reg66[(1'h0):(1'h0)])) >> ($unsigned(reg46) ?
                  reg48 : $unsigned((reg70 ? wire41 : reg45)))));
            end
          else
            begin
              reg73 <= $signed(wire39);
            end
        end
    end
  assign wire74 = $unsigned($unsigned(reg44[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      reg75 <= $unsigned({reg48[(3'h5):(3'h4)]});
    end
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire10 = (wire7 || wire6);
  assign wire11 = wire9;
  assign wire12 = wire11;
  assign wire13 = wire11;
  always
    @(posedge clk) begin
      reg14 <= (($signed($signed(wire12)) ?
              (wire9 ?
                  ({(8'hbc), wire10} != {wire8,
                      (8'hb0)}) : ($unsigned(wire10) + $signed(wire6))) : wire10[(4'h8):(1'h0)]) ?
          ((+wire10[(3'h7):(1'h0)]) ?
              $unsigned(wire12[(5'h12):(4'hc)]) : ($unsigned((wire8 ?
                      (8'ha4) : (7'h44))) ?
                  wire11 : ({wire10, wire6} ?
                      (8'hbf) : $signed(wire9)))) : (wire13[(3'h5):(2'h3)] > {wire13}));
    end
  always
    @(posedge clk) begin
      reg15 <= wire8[(1'h0):(1'h0)];
      reg16 <= {(-wire13[(4'hc):(4'hb)])};
      reg17 <= reg16;
    end
  assign wire18 = reg14[(3'h4):(3'h4)];
  assign wire19 = $signed((~^$unsigned((~&wire13[(4'hc):(4'hc)]))));
  assign wire20 = ($unsigned(wire6) ?
                      wire12 : $signed($signed(((~&wire7) ?
                          $unsigned(reg16) : (wire6 >> wire8)))));
  assign wire21 = (((reg14[(2'h3):(2'h3)] ?
                          $unsigned($signed(wire20)) : $signed((reg17 > wire13))) || (|$signed(wire19))) ?
                      $signed({((&(8'hb5)) ? {wire12} : (~&wire19)),
                          $signed(wire7[(1'h0):(1'h0)])}) : {wire6});
endmodule
