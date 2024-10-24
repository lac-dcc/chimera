module top
#(parameter param114 = (((({(8'hac), (8'hb5)} ? ((8'ha1) ? (8'hb1) : (8'ha1)) : {(8'haa), (8'ha4)}) ? ((^(8'hbe)) & ((8'hb3) ^ (8'ha6))) : ({(8'hab)} ^~ ((8'hb5) ? (8'hb3) : (8'h9c)))) ? (^{{(8'had), (7'h41)}}) : (~|(((8'hb3) && (8'hb4)) << (!(8'hb1))))) ^~ (((~((8'h9c) >> (8'h9f))) == ((-(8'hb5)) >= {(8'hb5), (8'hbc)})) - {(~&{(8'hb4)}), ((-(8'ha2)) <= (-(8'ha8)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire112;
  wire [(3'h5):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire110;
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  assign y = {wire112,
                 wire53,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire5,
                 wire110,
                 reg113,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire5 = ($signed($unsigned(({wire2} ?
                         wire0[(3'h4):(1'h0)] : wire0[(2'h3):(2'h3)]))) ?
                     wire4[(3'h4):(2'h3)] : wire3);
  always
    @(posedge clk) begin
      reg6 <= (((!$unsigned(wire0)) & ($signed((wire0 ?
              wire4 : wire3)) || $unsigned(wire5))) ?
          wire0 : ($unsigned(wire3) ?
              (!({wire5} ^~ wire2[(4'he):(4'h9)])) : wire4));
      reg7 <= $unsigned(wire4);
      reg8 <= wire0;
      reg9 <= $unsigned({(({(8'ha0)} ? reg7 : (wire0 > wire4)) ?
              reg6[(3'h4):(2'h3)] : $unsigned((reg7 >= wire4))),
          (8'hbb)});
      reg10 <= ($signed($signed((^(reg6 ? reg9 : reg6)))) ?
          {$unsigned(wire2)} : {(wire5 >>> reg6[(1'h0):(1'h0)])});
    end
  assign wire11 = {($signed((wire0[(4'h9):(3'h7)] ?
                              $signed(reg9) : (wire4 ? reg9 : reg10))) ?
                          reg7 : reg9),
                      reg9};
  assign wire12 = wire0[(1'h0):(1'h0)];
  assign wire13 = $unsigned(wire12[(5'h11):(3'h7)]);
  assign wire14 = reg10;
  assign wire15 = (8'ha0);
  always
    @(posedge clk) begin
      reg16 <= (wire1[(5'h12):(4'hc)] && wire0[(1'h0):(1'h0)]);
      reg17 <= $unsigned((+$unsigned((wire5[(1'h1):(1'h0)] ?
          wire12[(4'he):(3'h6)] : $signed((8'hbb))))));
    end
  module18 #() modinst31 (.wire21(reg9), .wire20(reg7), .wire23(wire12), .wire19(wire5), .y(wire30), .clk(clk), .wire22(reg6));
  assign wire32 = reg8;
  assign wire33 = (reg16[(2'h3):(1'h0)] || wire2);
  assign wire34 = $signed($signed(((~|(~&reg9)) ?
                      ((wire11 + (8'hb8)) > wire1[(1'h1):(1'h1)]) : ($signed(wire11) >>> (reg17 | wire30)))));
  assign wire35 = $unsigned(reg17[(1'h1):(1'h1)]);
  assign wire36 = {($unsigned((^~(wire32 || reg10))) == wire15)};
  assign wire37 = $signed(((!($unsigned(reg9) ?
                      (reg7 * wire35) : ((7'h43) ^~ wire11))) ^~ $unsigned((|(wire13 ?
                      wire33 : reg17)))));
  assign wire38 = ($signed($unsigned(((wire4 < (8'h9c)) <= {wire12,
                      (7'h40)}))) >= (-wire37));
  module39 #() modinst54 (wire53, clk, wire4, wire12, wire36, wire3, wire34);
  module55 #() modinst111 (wire110, clk, wire14, wire34, wire5, wire2, wire15);
  assign wire112 = (reg7 ? reg9 : $unsigned(wire1));
  always
    @(posedge clk) begin
      reg113 <= wire32[(5'h11):(4'hb)];
    end
endmodule

module module55
#(parameter param109 = (((((+(8'haa)) ? ((8'haf) ? (8'hbf) : (8'haa)) : (~^(8'hba))) - (~^{(8'hb8)})) >>> (^~(((8'hb9) ^ (8'hb2)) & (~^(8'hb6))))) ? ((~(((8'ha1) & (8'h9f)) ? ((7'h42) + (8'hb4)) : ((8'hb8) ? (8'hbb) : (7'h44)))) >= {(((8'hba) - (7'h43)) ? {(8'hbf), (8'ha5)} : {(8'h9d)})}) : (~^((((8'ha1) ? (7'h40) : (8'hb0)) ? (8'hb0) : ((8'hac) ? (8'hac) : (8'h9f))) <= (((8'hb2) + (8'hbe)) + {(8'hb7)})))))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h21e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire60;
  input wire signed [(4'hd):(1'h0)] wire59;
  input wire [(4'h8):(1'h0)] wire58;
  input wire [(5'h12):(1'h0)] wire57;
  input wire signed [(5'h13):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire107;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(4'h9):(1'h0)] wire61;
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire90,
                 wire61,
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
                 reg92,
                 reg91,
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
                 (1'h0)};
  assign wire61 = $signed($signed(wire58[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg62 <= wire58[(1'h1):(1'h1)];
      reg63 <= $signed($unsigned(wire58));
      reg64 <= reg63;
      reg65 <= wire60;
      reg66 <= {$signed($unsigned(wire56)), $unsigned(wire59[(2'h3):(1'h1)])};
    end
  always
    @(posedge clk) begin
      reg67 <= (^~((!$unsigned(reg62[(1'h1):(1'h1)])) ?
          reg66[(4'hc):(4'h8)] : (+$signed(reg64))));
      if (wire57[(4'h8):(3'h5)])
        begin
          reg68 <= {reg62[(1'h0):(1'h0)]};
          reg69 <= (wire58[(1'h0):(1'h0)] & $unsigned(reg62));
          reg70 <= (^~wire58);
          reg71 <= $signed($signed((wire57[(3'h7):(3'h7)] >>> $unsigned($signed(wire61)))));
          reg72 <= {(8'ha3)};
        end
      else
        begin
          reg68 <= wire61[(2'h2):(1'h0)];
          reg69 <= (reg63 * reg69[(3'h6):(2'h3)]);
          reg70 <= ((-$unsigned((-{(8'hbd)}))) >> (^~reg62));
          if ($unsigned({($unsigned($unsigned((8'ha4))) == (|(reg65 && wire61)))}))
            begin
              reg71 <= $signed(($signed(($unsigned((8'hbc)) << (|reg67))) <= $unsigned($signed((reg63 ?
                  wire56 : reg71)))));
              reg72 <= $unsigned($signed(wire57));
              reg73 <= (({(((8'hb4) ? wire59 : reg63) ?
                              $signed(reg69) : (7'h44)),
                          (|{reg69})} ?
                      (reg70[(3'h5):(3'h4)] ?
                          $unsigned($signed(reg63)) : reg62[(1'h0):(1'h0)]) : {((8'hab) ^ (&wire61))}) ?
                  (~^(reg62 ?
                      $signed((~&reg65)) : (wire60[(3'h5):(1'h1)] ?
                          reg64[(1'h0):(1'h0)] : {reg70,
                              reg63}))) : $signed(wire59[(3'h4):(1'h1)]));
              reg74 <= (7'h42);
            end
          else
            begin
              reg71 <= reg73;
              reg72 <= (~&{$signed({$unsigned(reg71), (wire58 < wire59)}),
                  reg63[(5'h14):(4'h9)]});
              reg73 <= (wire56[(5'h13):(4'ha)] ?
                  $signed((+((^~reg63) < $signed((8'ha5))))) : (7'h41));
              reg74 <= {$signed((-$signed(reg74[(1'h1):(1'h1)])))};
              reg75 <= $unsigned($signed((+$unsigned(reg66))));
            end
          reg76 <= (|$unsigned(reg62[(4'ha):(2'h2)]));
        end
      if ($unsigned($unsigned((8'h9e))))
        begin
          reg77 <= {{$signed(wire61[(4'h9):(3'h4)]), reg73}};
          reg78 <= (~|(~|(reg64 ? reg71[(2'h3):(1'h1)] : (8'hba))));
          reg79 <= ($signed((((|wire58) && (8'ha8)) && $signed((reg76 ?
              wire58 : reg63)))) - reg64[(2'h3):(1'h1)]);
          if (reg65[(4'ha):(4'h9)])
            begin
              reg80 <= ((^(($unsigned(reg62) ^~ $signed(reg67)) >>> ($signed(reg62) | (|(8'hb0))))) ?
                  reg77[(1'h0):(1'h0)] : $signed(wire58));
            end
          else
            begin
              reg80 <= wire61[(2'h2):(1'h0)];
              reg81 <= {wire56[(4'he):(3'h5)],
                  $signed((!({wire56, reg78} <= (wire57 ? reg72 : (8'h9e)))))};
              reg82 <= $unsigned($signed(($unsigned((reg69 | wire56)) ?
                  ($signed(reg71) ? (&reg75) : reg78) : ($unsigned(reg71) ?
                      $unsigned(wire59) : (reg80 > reg69)))));
              reg83 <= $unsigned({reg71[(1'h0):(1'h0)],
                  ((~|wire58) ? (|(reg62 + reg69)) : (|reg71[(2'h2):(1'h1)]))});
            end
        end
      else
        begin
          if ((($unsigned(reg73) && {reg65[(4'hd):(3'h4)],
              (^~(reg81 < wire56))}) < {$signed($unsigned(wire56)),
              $unsigned($unsigned(reg79[(3'h5):(1'h1)]))}))
            begin
              reg77 <= {$unsigned(reg72), reg63};
              reg78 <= $unsigned($unsigned((reg66[(4'hd):(1'h1)] <= ((reg78 ?
                      wire59 : reg74) ?
                  reg82[(3'h4):(2'h2)] : reg78))));
            end
          else
            begin
              reg77 <= ((^~(reg71[(1'h1):(1'h1)] ?
                      (reg77[(3'h7):(3'h5)] <<< $unsigned(reg79)) : $unsigned((reg79 ?
                          (8'hab) : reg67)))) ?
                  (~reg81[(4'h8):(3'h6)]) : ($signed($signed($signed(reg70))) + $signed(((!reg75) ?
                      (8'ha3) : ((8'ha8) ? reg65 : reg63)))));
              reg78 <= reg79;
            end
          reg79 <= reg64;
          if (reg80)
            begin
              reg80 <= $signed({$unsigned(reg83[(1'h0):(1'h0)]),
                  ({((7'h44) << reg78)} ?
                      reg83[(1'h0):(1'h0)] : (reg83[(1'h0):(1'h0)] ?
                          (reg77 ? reg63 : reg67) : (wire59 ?
                              wire58 : reg69)))});
              reg81 <= reg62;
              reg82 <= $unsigned((!(reg66 ?
                  ($unsigned((8'hbe)) && (|(8'hac))) : reg62)));
              reg83 <= reg83[(2'h2):(1'h1)];
            end
          else
            begin
              reg80 <= (^(|$signed({(reg81 ? reg74 : reg70)})));
              reg81 <= ((reg62 && ((reg81 ?
                      reg67 : $signed(reg63)) ^~ reg82[(1'h0):(1'h0)])) ?
                  (wire56[(4'hd):(2'h2)] ?
                      wire60 : (&{(8'hbe)})) : ((reg65 >> ((!wire61) ?
                      (~&wire60) : (|reg82))) + reg62[(4'ha):(3'h5)]));
            end
          if (reg64[(1'h0):(1'h0)])
            begin
              reg84 <= (wire61 || $unsigned($signed(((reg67 ? reg68 : reg78) ?
                  (^reg69) : (reg62 - reg72)))));
              reg85 <= reg70[(4'h8):(4'h8)];
              reg86 <= ((wire56[(4'h9):(3'h6)] < {reg84,
                  reg80[(2'h2):(1'h1)]}) ~^ reg71[(2'h2):(1'h1)]);
              reg87 <= reg83;
              reg88 <= (!reg87);
            end
          else
            begin
              reg84 <= (~^{(|$unsigned(((8'haa) ? reg82 : (8'hb8)))),
                  ({(reg70 ? (8'ha3) : reg85), (reg68 > reg85)} ?
                      reg78 : ((reg70 ? (8'hac) : wire58) ?
                          $unsigned(wire57) : (~^reg80)))});
            end
          reg89 <= ($unsigned((~&reg85[(3'h6):(3'h5)])) ?
              reg86[(1'h0):(1'h0)] : (^reg78));
        end
    end
  assign wire90 = ($unsigned((8'h9c)) & {(|(^{(8'haa), reg85}))});
  always
    @(posedge clk) begin
      if (($signed({reg79[(4'hb):(4'hb)]}) ?
          $unsigned((reg63[(5'h14):(3'h6)] << (8'hb1))) : $unsigned($signed(($signed(reg77) < (~&(7'h41)))))))
        begin
          reg91 <= (wire61[(2'h2):(2'h2)] * reg68[(3'h5):(2'h2)]);
          if ((^({(+((8'haf) ? reg82 : reg82))} ?
              (^(reg62 > wire57)) : ((^reg68) ?
                  reg84[(3'h7):(1'h1)] : {{reg81, reg81}}))))
            begin
              reg92 <= reg66;
              reg93 <= ($unsigned({(8'ha5), (reg88 << $unsigned(reg64))}) ?
                  $unsigned((8'hbd)) : reg83[(2'h2):(1'h1)]);
              reg94 <= ($unsigned($unsigned($signed((reg62 ? reg77 : reg80)))) ?
                  $unsigned($signed(reg85)) : reg92[(3'h4):(3'h4)]);
            end
          else
            begin
              reg92 <= {reg66, reg67};
              reg93 <= (&($signed((~|{reg65})) < $unsigned($signed((reg69 - reg82)))));
              reg94 <= ($signed((wire61[(3'h6):(3'h5)] ~^ reg72)) ~^ (~(~&(~&$signed(reg83)))));
              reg95 <= (8'hb9);
            end
          reg96 <= $unsigned(reg88);
          if (wire90)
            begin
              reg97 <= ((|(^((reg71 == reg89) ?
                      wire57[(4'hc):(3'h7)] : $unsigned(reg88)))) ?
                  ($unsigned((!$signed((8'haa)))) ^~ $signed(reg93)) : wire90);
              reg98 <= reg84;
              reg99 <= wire90[(4'hb):(3'h7)];
              reg100 <= $signed((&(({wire61,
                  reg73} ^~ $unsigned((8'hba))) && reg77[(5'h11):(5'h10)])));
              reg101 <= ((reg87 >= (^~reg100)) ?
                  {$unsigned((|reg64[(2'h3):(2'h2)])),
                      {{reg65},
                          (reg94 && reg77[(1'h1):(1'h0)])}} : reg89[(5'h14):(4'ha)]);
            end
          else
            begin
              reg97 <= reg77;
            end
          reg102 <= ((((^wire60) ?
                      (~&(reg71 ~^ reg100)) : ($signed((8'hb4)) ?
                          $signed(reg68) : (^~reg69))) ?
                  {{reg69[(3'h5):(1'h1)], (^~wire60)},
                      ({reg80} & reg74)} : $unsigned({{reg81, reg88},
                      (!reg74)})) ?
              $signed($unsigned((&$unsigned(wire60)))) : $unsigned(($unsigned((&reg92)) ~^ (reg69 ~^ (-wire57)))));
        end
      else
        begin
          reg91 <= {$signed(($signed({reg72, reg101}) ?
                  reg95 : reg100[(3'h4):(1'h0)])),
              $unsigned((!(reg93[(4'h9):(1'h0)] ?
                  $signed(reg68) : reg82[(4'hb):(4'h9)])))};
          reg92 <= (~&{reg89[(5'h11):(4'hb)], reg63});
        end
      reg103 <= ({$unsigned((8'ha7))} == $unsigned((($signed((8'hb3)) | $signed(reg83)) ?
          reg78[(5'h11):(2'h2)] : reg94)));
      if ($signed((~^{(((8'hbc) >> reg85) ?
              ((8'ha9) ? wire90 : reg63) : (~&reg100))})))
        begin
          reg104 <= (8'hb9);
          reg105 <= $unsigned(reg81);
          reg106 <= reg83[(2'h2):(1'h0)];
        end
      else
        begin
          reg104 <= (|reg74[(2'h2):(1'h0)]);
        end
    end
  assign wire107 = (reg91[(3'h4):(2'h3)] || (reg91 ?
                       reg78 : $unsigned(wire90[(4'hd):(4'hb)])));
  assign wire108 = (({{(reg81 | reg63)}} ?
                           $unsigned($signed($signed(reg105))) : {reg105}) ?
                       reg76[(2'h3):(1'h1)] : {((~$unsigned(reg105)) <<< $unsigned(reg104[(1'h1):(1'h1)]))});
endmodule

module module39
#(parameter param51 = (+({{(~^(8'hb1)), (&(8'had))}} & {(((8'hb3) ? (8'h9f) : (8'hb0)) ? (-(8'ha8)) : {(8'hb4)}), (((8'hb0) - (8'hae)) ? ((7'h44) ? (8'hae) : (8'hb3)) : (~&(8'h9d)))})), 
parameter param52 = ({param51, (^~param51)} ? (8'hbd) : (8'ha5)))
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire44;
  input wire signed [(5'h13):(1'h0)] wire43;
  input wire [(5'h12):(1'h0)] wire42;
  input wire [(5'h12):(1'h0)] wire41;
  input wire [(4'h9):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire47;
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  assign y = {wire50, wire49, wire47, reg48, reg46, reg45, (1'h0)};
  always
    @(posedge clk) begin
      reg45 <= wire40[(3'h4):(3'h4)];
      reg46 <= (wire43[(2'h2):(1'h1)] ?
          (!$signed(wire41)) : wire40[(4'h9):(3'h6)]);
    end
  assign wire47 = {($signed((^~(wire40 ? wire41 : reg45))) ?
                          $unsigned(wire42) : {(wire43[(5'h13):(5'h11)] ?
                                  {wire41} : (wire40 ? wire43 : wire43)),
                              $unsigned((+reg45))}),
                      $unsigned((!wire43[(4'hd):(4'hc)]))};
  always
    @(posedge clk) begin
      reg48 <= $unsigned((+reg46));
    end
  assign wire49 = $unsigned({(wire41 ? wire40 : (+$signed(reg46)))});
  assign wire50 = $signed({$signed({reg48})});
endmodule

module module18
#(parameter param28 = (|(|{({(8'hbb)} ? ((8'had) * (8'hba)) : (~&(8'hb7)))})), 
parameter param29 = param28)
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire22;
  input wire [(3'h5):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  assign y = {wire27, wire26, wire25, wire24, (1'h0)};
  assign wire24 = ($signed(wire21) ?
                      (({$unsigned(wire19)} ?
                          ({wire21, wire21} ?
                              {(8'hb7)} : $signed(wire21)) : (~(wire19 ?
                              wire20 : wire23))) || wire19) : $unsigned($signed($signed($signed(wire22)))));
  assign wire25 = $signed((|wire23));
  assign wire26 = ((&wire19[(5'h13):(4'h9)]) ?
                      (wire25[(2'h2):(1'h0)] - (wire20[(2'h2):(1'h0)] >> wire22[(4'h9):(3'h6)])) : (wire22 ?
                          wire21[(1'h1):(1'h1)] : {$signed($unsigned(wire22)),
                              ($unsigned(wire25) << (-(8'hb1)))}));
  assign wire27 = $signed(({wire24, (-(wire26 > wire20))} - ($unsigned(wire21) ?
                      {(~&(8'hae)), $unsigned(wire22)} : wire22)));
endmodule
