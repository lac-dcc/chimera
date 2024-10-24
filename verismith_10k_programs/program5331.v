module top
#(parameter param120 = ((8'haa) <<< (8'haf)), 
parameter param121 = (((param120 ? (+(param120 ? param120 : (8'h9c))) : ((param120 ? param120 : param120) ? (|param120) : param120)) ? ((8'ha0) >= (8'ha3)) : (^param120)) < (((|(^(8'ha2))) >> (!param120)) ? param120 : (-(~^param120)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire97;
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire101,
                 wire97,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg100,
                 reg99,
                 (1'h0)};
  module4 #() modinst98 (wire97, clk, wire1, wire3, wire0, wire2, (8'h9e));
  always
    @(posedge clk) begin
      reg99 <= $signed(wire0[(1'h0):(1'h0)]);
      reg100 <= {(|(7'h40)), (~^wire1)};
    end
  assign wire101 = (wire97 ? wire3[(4'he):(3'h4)] : (-reg99));
  always
    @(posedge clk) begin
      reg102 <= (reg99 - wire0);
      if (wire97[(2'h3):(2'h3)])
        begin
          if ($signed(wire97))
            begin
              reg103 <= wire101;
              reg104 <= reg102;
              reg105 <= ($signed(wire101) ^ (reg102[(2'h2):(1'h0)] + ({wire0[(3'h7):(3'h4)],
                      $unsigned(reg99)} ?
                  ($unsigned(reg99) ?
                      $signed(wire0) : {wire2}) : ((^~wire97) || reg99[(3'h5):(2'h3)]))));
              reg106 <= $signed($signed($unsigned(($signed(reg99) ?
                  {(8'hab), wire101} : (~^reg105)))));
            end
          else
            begin
              reg103 <= $signed((!$unsigned($signed((reg105 ?
                  wire0 : reg105)))));
              reg104 <= (-reg100);
              reg105 <= ($signed({($signed((8'hb2)) < wire97)}) ?
                  $unsigned(reg106[(4'h8):(3'h7)]) : ((^reg105[(2'h3):(1'h0)]) ?
                      (|($unsigned(wire97) - (reg103 | reg99))) : $unsigned(({wire3,
                          (8'hb0)} == reg102[(1'h1):(1'h0)]))));
              reg106 <= wire101;
              reg107 <= (wire0[(4'hb):(4'h9)] >= ((($unsigned((8'ha8)) | (reg106 <<< reg104)) ?
                      $signed((reg100 ?
                          reg104 : wire3)) : wire101[(2'h3):(2'h3)]) ?
                  (reg105 || $unsigned(((8'hb6) - wire0))) : wire1[(3'h5):(2'h3)]));
            end
        end
      else
        begin
          if ((($unsigned((&(wire0 ?
                  reg102 : wire101))) >= {wire0[(3'h6):(3'h5)], reg107}) ?
              $unsigned(reg107[(5'h10):(4'h8)]) : $signed(reg100[(3'h5):(1'h0)])))
            begin
              reg103 <= reg107[(1'h0):(1'h0)];
              reg104 <= wire97[(2'h3):(1'h0)];
              reg105 <= (+$signed($unsigned((~((8'hb8) + reg106)))));
              reg106 <= (~&$signed($signed((^~(wire97 || reg105)))));
            end
          else
            begin
              reg103 <= ($signed((reg105[(2'h2):(2'h2)] ?
                  $unsigned($unsigned(wire97)) : (wire2 ?
                      (reg103 ?
                          reg105 : reg103) : $signed(wire97)))) || (-(~|wire0[(3'h4):(1'h0)])));
              reg104 <= $signed($signed(wire0));
              reg105 <= (|wire97[(1'h1):(1'h0)]);
              reg106 <= $signed(reg99[(1'h0):(1'h0)]);
            end
          reg107 <= ($unsigned((+wire97)) ?
              ((8'ha2) ~^ reg104[(3'h4):(1'h0)]) : (8'h9d));
          reg108 <= (|$signed(reg100[(2'h2):(1'h0)]));
          reg109 <= $signed(reg108);
          if ($signed($signed($unsigned(reg107[(5'h10):(4'ha)]))))
            begin
              reg110 <= ((~^(+$signed($signed(reg105)))) ?
                  {$unsigned($unsigned(((8'hb0) < reg106))),
                      ((&(reg107 ?
                          wire1 : wire97)) ^~ reg109[(1'h0):(1'h0)])} : (reg99 >= $signed(((~|reg100) & wire101))));
              reg111 <= $signed(reg105);
              reg112 <= ($unsigned($unsigned($signed($signed(reg104)))) ?
                  (-(reg99[(4'he):(4'hd)] ?
                      $signed((wire1 ?
                          reg109 : reg104)) : reg108[(2'h3):(1'h1)])) : (reg104[(1'h1):(1'h1)] ?
                      $unsigned($unsigned($unsigned(reg111))) : reg99[(1'h0):(1'h0)]));
            end
          else
            begin
              reg110 <= reg107;
              reg111 <= $signed((!{$unsigned(reg108[(4'hf):(4'hb)])}));
              reg112 <= (7'h42);
              reg113 <= $signed((!(((wire0 >> reg111) >= $signed(wire97)) ?
                  (wire1 ~^ $signed(reg102)) : reg99[(1'h0):(1'h0)])));
              reg114 <= {$unsigned($unsigned(wire1)), wire2};
            end
        end
      reg115 <= $unsigned((|(7'h40)));
      reg116 <= $unsigned($unsigned($unsigned(($signed((8'hae)) ?
          {reg111} : reg107[(5'h11):(3'h7)]))));
    end
  assign wire117 = {$unsigned((($unsigned(reg110) ?
                               $unsigned(reg104) : $signed(wire2)) ?
                           $unsigned($signed(reg103)) : $signed(wire3[(5'h13):(3'h4)]))),
                       $unsigned({((reg113 == wire0) != reg110[(3'h6):(2'h3)]),
                           reg108[(3'h4):(3'h4)]})};
  assign wire118 = (8'ha0);
  assign wire119 = (^~$unsigned(wire118));
endmodule

module module4
#(parameter param96 = ((7'h43) != ({{(&(8'ha3)), ((8'hae) ? (8'hbd) : (8'hbf))}} ? (~(((7'h41) ? (8'h9c) : (8'hbe)) ? ((8'hb7) << (8'hb9)) : ((8'ha0) ? (8'ha1) : (7'h43)))) : ((~^((8'hb4) ? (8'hb9) : (8'hb2))) ? (!((8'hbc) ? (7'h44) : (8'had))) : {((7'h42) <<< (8'ha8)), (+(8'hba))}))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire94;
  assign y = {wire47, wire31, wire10, wire49, wire50, wire51, wire94, (1'h0)};
  assign wire10 = ({{{$unsigned((8'hb2)), wire8}, wire9[(1'h0):(1'h0)]},
                      (wire9 - wire7)} ~^ {(8'hb3)});
  module11 #() modinst32 (wire31, clk, wire9, wire10, wire8, wire7);
  module33 #() modinst48 (wire47, clk, wire7, wire5, wire8, wire6, wire31);
  assign wire49 = (~$signed((~^((~|wire31) == $unsigned(wire5)))));
  assign wire50 = (wire7[(4'hb):(3'h6)] << (($signed((wire8 ?
                      wire5 : wire10)) && wire9) <= wire9[(3'h6):(2'h2)]));
  assign wire51 = (^$unsigned((+($unsigned(wire50) ?
                      (wire49 ? wire49 : wire31) : $unsigned(wire50)))));
  module52 #() modinst95 (wire94, clk, wire5, wire31, wire49, wire47, wire8);
endmodule

module module52
#(parameter param93 = ((8'hb3) ? (~|((8'ha5) ? ((~^(8'ha8)) >>> ((8'ha2) ? (8'hb5) : (8'hbd))) : ((+(8'ha1)) ? ((8'hb7) ? (8'hb9) : (7'h41)) : (|(8'ha3))))) : ({((~^(8'hbf)) <<< ((8'hba) ? (7'h42) : (8'hbb)))} || (8'ha4))))
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire57;
  input wire [(4'h9):(1'h0)] wire56;
  input wire signed [(5'h12):(1'h0)] wire55;
  input wire [(5'h15):(1'h0)] wire54;
  input wire [(2'h2):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire92;
  wire signed [(3'h4):(1'h0)] wire91;
  wire signed [(4'ha):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire86,
                 wire76,
                 wire75,
                 wire74,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg88,
                 reg87,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg58 <= $unsigned($unsigned({((wire57 ? wire53 : wire55) ?
              wire54[(2'h2):(2'h2)] : (wire53 ? wire55 : wire54))}));
      reg59 <= $unsigned((^($unsigned((wire55 <<< wire54)) || (wire54[(4'hf):(2'h3)] <= reg58[(4'hb):(4'hb)]))));
      if (wire54)
        begin
          reg60 <= $unsigned(reg58[(2'h3):(2'h3)]);
        end
      else
        begin
          if ($signed(reg60))
            begin
              reg60 <= $signed({(~^$unsigned($unsigned(reg60))),
                  ($unsigned(wire56[(2'h3):(2'h3)]) ?
                      ((^reg58) ?
                          (wire55 ?
                              reg58 : (8'h9c)) : (reg59 >> wire53)) : (^~{reg58,
                          (8'hac)}))});
              reg61 <= ($unsigned((|$signed($unsigned(wire53)))) && (reg60 >= (+reg59)));
              reg62 <= wire55;
            end
          else
            begin
              reg60 <= (^((~&wire55) ?
                  ((8'ha7) | (8'ha1)) : reg61[(3'h5):(2'h2)]));
              reg61 <= (reg60 ?
                  ($unsigned(wire53) >> wire56) : (-$unsigned(({reg58} ?
                      (~|reg62) : (~|reg61)))));
              reg62 <= (-($signed($unsigned((wire53 ? (8'hb9) : wire55))) ?
                  wire53 : ($unsigned((~wire53)) <<< {(reg62 == wire56),
                      $unsigned(reg62)})));
              reg63 <= wire57;
            end
          reg64 <= (~|$unsigned(wire54));
        end
    end
  assign wire65 = reg61;
  assign wire66 = ($signed(($unsigned(((8'hab) ?
                          (8'ha4) : wire65)) & $signed($signed(wire57)))) ?
                      ((~reg58[(4'hc):(3'h7)]) | wire55) : $signed($signed(reg62[(4'hb):(2'h2)])));
  assign wire67 = (wire65[(2'h3):(1'h0)] ^~ wire66);
  assign wire68 = reg62;
  always
    @(posedge clk) begin
      if (($signed(wire53[(2'h2):(2'h2)]) ?
          (!({reg63} > $unsigned(reg58[(2'h3):(2'h2)]))) : $unsigned((reg62[(4'ha):(2'h3)] ?
              wire68 : $signed((8'hac))))))
        begin
          reg69 <= reg62;
        end
      else
        begin
          reg69 <= ((&(|(&$signed(wire65)))) + ({$unsigned((~reg64))} ~^ {reg61[(1'h1):(1'h1)]}));
          if ($signed(((!$unsigned(((8'ha1) ? reg62 : reg69))) ?
              wire68 : $unsigned($unsigned({reg60, wire67})))))
            begin
              reg70 <= (8'ha1);
              reg71 <= reg60[(1'h0):(1'h0)];
            end
          else
            begin
              reg70 <= (($signed(reg69) && (wire53 ?
                  reg61 : ($unsigned((8'h9c)) || $signed((8'hbe))))) && reg63);
              reg71 <= {(reg59[(1'h0):(1'h0)] ?
                      reg59 : {$unsigned({reg59, reg58})})};
              reg72 <= reg60[(1'h0):(1'h0)];
            end
        end
      reg73 <= {wire65};
    end
  assign wire74 = (~|$signed($unsigned(reg60[(2'h3):(2'h3)])));
  assign wire75 = ($unsigned($unsigned(reg58)) ?
                      (^~{reg61[(2'h3):(1'h0)], reg72}) : reg58);
  assign wire76 = $signed(reg60[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg77 <= ((((~^(reg73 ? wire68 : wire74)) ?
              reg71[(3'h4):(2'h2)] : (^(reg58 ? reg69 : wire74))) ?
          ((+$signed(reg60)) ?
              ({wire65, wire55} ?
                  (reg61 ^~ reg72) : (wire67 != reg60)) : ($unsigned(wire55) ?
                  (+reg69) : (reg61 ^ reg73))) : $unsigned(($unsigned(wire57) & wire76[(2'h3):(2'h2)]))) ~^ ((|($signed(wire55) ?
              $unsigned(reg59) : (~^reg60))) ?
          (~|reg72[(2'h2):(1'h1)]) : wire68));
      reg78 <= wire55;
      if ({reg70, $signed((&(8'ha8)))})
        begin
          reg79 <= (~|$unsigned(((~^$unsigned(wire67)) | {wire53[(1'h1):(1'h0)],
              (8'ha8)})));
          if ($unsigned(($unsigned((~^reg62[(3'h6):(3'h6)])) ?
              $unsigned(reg71) : ({$signed(wire67)} ?
                  $signed($signed(wire74)) : $signed(wire56)))))
            begin
              reg80 <= (wire74 ? wire68[(2'h2):(2'h2)] : $signed(reg61));
              reg81 <= reg77[(1'h1):(1'h0)];
              reg82 <= (($signed((~&reg71[(1'h0):(1'h0)])) ?
                  $unsigned(reg62[(3'h7):(3'h4)]) : $unsigned($unsigned((reg70 ?
                      wire57 : reg79)))) || (~^({wire68[(1'h0):(1'h0)]} ?
                  (~^reg78) : ((+reg61) >= {(8'hab), reg70}))));
            end
          else
            begin
              reg80 <= ($unsigned(wire65[(4'hd):(1'h0)]) ?
                  {($unsigned((wire55 | (8'ha3))) | wire76[(2'h2):(1'h1)]),
                      ($unsigned(reg59[(2'h2):(1'h0)]) == $unsigned({reg63}))} : {(wire74 <= {(~|reg73),
                          {reg59, wire55}})});
            end
        end
      else
        begin
          if ($unsigned({(!$signed(wire55[(4'ha):(4'ha)])),
              (reg73 ^ $unsigned({(8'ha2)}))}))
            begin
              reg79 <= reg58[(4'hd):(4'h8)];
              reg80 <= (8'ha8);
            end
          else
            begin
              reg79 <= (8'haa);
              reg80 <= {wire67[(3'h4):(2'h3)],
                  ($signed(reg71) ?
                      (^~reg59[(2'h2):(1'h1)]) : ((reg78[(4'hf):(4'h9)] ?
                          (reg59 ? reg59 : reg79) : (reg59 ?
                              reg58 : wire65)) ^~ reg61))};
              reg81 <= $signed(($unsigned($unsigned(wire75[(3'h5):(3'h4)])) ?
                  (wire67[(4'hd):(3'h4)] ?
                      ((wire55 ? reg80 : reg58) <<< {reg79,
                          reg69}) : {(wire74 <<< reg77)}) : reg61));
              reg82 <= wire76;
              reg83 <= ($unsigned($unsigned((~^(wire57 ?
                  wire66 : wire76)))) || reg80[(4'h9):(4'h9)]);
            end
        end
      reg84 <= ({wire65[(2'h3):(1'h0)]} ?
          wire75[(3'h6):(2'h3)] : $signed(($unsigned((reg80 ?
              wire66 : reg58)) && reg77[(1'h0):(1'h0)])));
      reg85 <= (($unsigned(wire57) || {$unsigned(wire67[(4'hb):(2'h2)]),
          wire66[(3'h6):(2'h3)]}) >>> ($unsigned($unsigned(reg72[(3'h6):(2'h2)])) << (reg81[(1'h0):(1'h0)] == $unsigned((wire57 ^ reg79)))));
    end
  assign wire86 = reg85;
  always
    @(posedge clk) begin
      reg87 <= (&$unsigned({reg70}));
      reg88 <= (wire56[(4'h8):(3'h6)] ?
          $signed($unsigned(((~|(8'ha8)) ?
              (wire86 ? wire54 : reg84) : wire86))) : $signed((~|(8'ha1))));
    end
  assign wire89 = ((&(($unsigned(wire68) ?
                          $unsigned(wire56) : (reg78 ?
                              (8'hb4) : reg64)) >> $signed((~^reg62)))) ?
                      $signed(((&$signed(wire55)) ?
                          (!wire56[(4'h8):(2'h3)]) : (~&{reg73,
                              wire57}))) : (^(wire86 ?
                          $unsigned(reg62[(4'ha):(4'ha)]) : ($signed(wire57) ^~ wire66))));
  assign wire90 = reg88[(5'h11):(2'h3)];
  assign wire91 = $signed(($unsigned((~&reg83)) >= $unsigned(((!(8'ha3)) >>> (^~wire53)))));
  assign wire92 = reg59;
endmodule

module module33
#(parameter param45 = (~^((((&(8'ha6)) ? ((8'h9c) ? (8'ha3) : (8'hba)) : ((8'hbb) ~^ (8'ha0))) ? ((!(8'hbb)) ^ ((8'hb2) > (7'h41))) : (+((8'hb1) ? (8'ha0) : (8'hae)))) ? (~&(((8'ha0) ? (8'hb4) : (8'ha9)) ? {(7'h40), (8'hbe)} : {(8'hb9)})) : ((~(~(7'h40))) ? ((+(8'h9c)) ? ((8'hbe) > (8'hba)) : (8'hb2)) : (^(8'hb3))))), 
parameter param46 = ((param45 ? (8'hb2) : param45) ? param45 : ((((param45 ? param45 : param45) || param45) * (~|(param45 && param45))) ^ ((^(^param45)) ? param45 : {((7'h42) ~^ param45), (param45 ^ (8'hbc))}))))
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire38;
  input wire [(5'h14):(1'h0)] wire37;
  input wire signed [(5'h14):(1'h0)] wire36;
  input wire [(5'h12):(1'h0)] wire35;
  input wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  assign y = {wire44, wire43, wire42, wire41, wire40, wire39, (1'h0)};
  assign wire39 = $signed((({wire36, {wire34, wire36}} ?
                          $signed((^wire35)) : ((8'h9d) ?
                              ((8'ha7) ? wire38 : wire35) : (&wire36))) ?
                      $signed(((wire34 < wire34) ?
                          $unsigned(wire36) : $unsigned(wire38))) : ($signed({wire35}) << (^~wire35[(4'hd):(1'h1)]))));
  assign wire40 = $signed(($signed($unsigned(wire36)) ?
                      $unsigned((wire36 & $unsigned(wire37))) : (|((wire35 - wire38) ?
                          (^~wire38) : $unsigned(wire39)))));
  assign wire41 = wire40;
  assign wire42 = $signed(($signed($unsigned({(8'hb8)})) ^~ wire34));
  assign wire43 = ($unsigned(wire36[(2'h2):(1'h1)]) != $unsigned({$unsigned($unsigned(wire42)),
                      wire34[(1'h0):(1'h0)]}));
  assign wire44 = (-{$unsigned({(wire36 ^ wire36)})});
endmodule

module module11
#(parameter param29 = (((-((8'ha0) ^ (~|(7'h44)))) ^ (~^({(8'hb2), (8'hbd)} ? (|(8'had)) : {(8'ha4), (8'hbf)}))) ? (((8'ha2) >> {(^~(8'hae))}) ? (+(((8'h9f) ^ (8'ha1)) ? (&(8'ha1)) : (~&(8'ha0)))) : (!{(!(7'h41)), ((8'ha2) ? (8'hbe) : (8'hbc))})) : {((((8'h9c) ? (8'hbe) : (8'haa)) ? ((8'h9c) || (8'hb4)) : (^(8'ha1))) ? ({(8'ha1)} || ((7'h43) * (8'ha6))) : {{(8'ha2)}, ((8'hbf) ? (8'hae) : (8'h9c))}), ((((8'haa) ? (8'hb7) : (8'hab)) >= ((8'hbb) ? (8'haa) : (8'hb9))) && (+(~&(8'hae))))}), 
parameter param30 = (+param29))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
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
                 (1'h0)};
  assign wire16 = $unsigned((^~(^wire13)));
  assign wire17 = ($signed($unsigned((~|wire13[(3'h6):(3'h6)]))) - (~&wire12));
  assign wire18 = {(~|(({wire13,
                          (8'hb4)} & (wire15 >> (8'hbd))) != ($signed(wire17) ?
                          $unsigned((8'hb8)) : (wire15 <= wire12))))};
  always
    @(posedge clk) begin
      reg19 <= $signed({(wire17[(1'h1):(1'h0)] ?
              $signed($unsigned(wire16)) : (~^(wire18 ? wire18 : wire16)))});
      if (($signed((reg19 ?
              ($signed(wire17) ?
                  {wire16} : ((8'hae) <= wire17)) : $unsigned((wire18 && wire16)))) ?
          $unsigned({(!wire17)}) : $signed(wire14)))
        begin
          reg20 <= ((wire13 ~^ $unsigned(wire18[(4'h9):(4'h9)])) ?
              $signed($unsigned(((wire17 ?
                  (8'haa) : wire17) << $unsigned(wire18)))) : reg19);
          if ((wire15 ?
              (~^reg20[(3'h7):(3'h6)]) : {$signed((~^$signed(wire16))),
                  $signed((~^$signed(wire12)))}))
            begin
              reg21 <= $unsigned(($unsigned((|(wire14 && (8'hbd)))) * {(~$signed(reg20)),
                  (&wire18[(1'h1):(1'h1)])}));
              reg22 <= {reg20, wire17[(3'h4):(2'h2)]};
              reg23 <= wire14[(1'h0):(1'h0)];
            end
          else
            begin
              reg21 <= wire13[(1'h1):(1'h0)];
            end
          reg24 <= (~|$unsigned(wire12));
          reg25 <= (!$signed($signed($unsigned((wire16 ^~ reg23)))));
          reg26 <= (~&reg19[(1'h1):(1'h1)]);
        end
      else
        begin
          if (reg22[(1'h0):(1'h0)])
            begin
              reg20 <= wire15[(1'h0):(1'h0)];
              reg21 <= (($unsigned((-{wire13})) ?
                      wire12 : ($unsigned((~&reg24)) ?
                          wire18 : (~$signed(wire18)))) ?
                  reg24 : (-wire14));
              reg22 <= ((!wire17) ? reg21[(4'ha):(3'h4)] : wire16);
              reg23 <= reg19[(1'h0):(1'h0)];
              reg24 <= (reg20[(2'h2):(1'h1)] ?
                  (wire14 ?
                      ({$signed(reg26)} <= $unsigned($signed(reg19))) : reg22) : reg23);
            end
          else
            begin
              reg20 <= (($unsigned($unsigned(wire13)) ^ (($unsigned(wire13) ?
                          $unsigned(wire17) : $signed((8'haa))) ?
                      (wire12[(4'h9):(4'h9)] ?
                          (^~reg22) : (reg26 ? wire16 : reg24)) : (reg26 ?
                          (wire15 > wire13) : wire16))) ?
                  (^$signed(({reg21} ?
                      (^reg20) : reg21[(3'h7):(3'h7)]))) : (&reg21[(4'h8):(4'h8)]));
              reg21 <= reg20;
              reg22 <= (&reg20[(3'h7):(3'h4)]);
              reg23 <= ({reg20[(3'h7):(3'h6)],
                      ((+wire17) ~^ $unsigned(wire16[(3'h7):(3'h4)]))} ?
                  $unsigned(wire17[(4'hf):(4'hf)]) : $signed($signed(wire14)));
            end
          reg25 <= ($unsigned(reg25[(4'hd):(3'h4)]) ?
              $unsigned((reg24[(1'h0):(1'h0)] >>> {(reg23 && wire15)})) : $signed({reg22[(2'h2):(1'h0)]}));
          if (reg24)
            begin
              reg26 <= $unsigned((&reg23[(3'h4):(3'h4)]));
              reg27 <= ((~&($signed(reg19) >> ((wire17 ? reg20 : reg23) ?
                  reg22[(2'h3):(2'h3)] : {reg26}))) == $unsigned(wire18));
            end
          else
            begin
              reg26 <= (!$unsigned($unsigned(wire14)));
              reg27 <= (!($signed((~&$signed((8'h9f)))) == $signed($unsigned(wire18))));
            end
        end
      reg28 <= ($unsigned(reg24) ?
          $signed((((+wire17) | ((7'h40) < wire12)) ^~ {(reg24 ?
                  wire16 : wire15),
              ((8'hbe) || reg24)})) : wire12);
    end
endmodule
