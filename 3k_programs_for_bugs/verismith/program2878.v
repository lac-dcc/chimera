module top
#(parameter param102 = ((!(+(~&{(8'ha3), (8'hba)}))) ? (+((((8'hb4) ? (8'hb4) : (8'haa)) ^~ {(7'h44)}) < (8'ha5))) : (~|({(-(8'hb8)), ((7'h40) < (8'ha8))} + ((8'ha4) || ((7'h40) ? (8'hbf) : (8'ha9)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire95;
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire101,
                 wire99,
                 wire98,
                 wire97,
                 wire25,
                 wire95,
                 reg100,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {$signed((8'ha0))};
      reg5 <= wire1;
      reg6 <= $unsigned(wire0);
      reg7 <= {$unsigned(((wire1[(4'h9):(3'h7)] <= ((8'hb8) | (8'h9d))) ?
              {(~&wire0)} : ($unsigned(wire3) < wire0[(1'h0):(1'h0)]))),
          {wire2, $signed(wire1[(5'h10):(3'h4)])}};
    end
  always
    @(posedge clk) begin
      if ($signed(reg7))
        begin
          reg8 <= reg5[(1'h0):(1'h0)];
          reg9 <= (~^(~^(reg4[(2'h3):(1'h0)] ?
              (-reg8[(1'h0):(1'h0)]) : (-wire2[(3'h5):(3'h5)]))));
          if ($signed((((^~(8'had)) || $unsigned(wire3)) ?
              ((+(-reg5)) ?
                  (reg4[(1'h0):(1'h0)] ?
                      $signed(reg4) : (reg9 ?
                          wire3 : reg9)) : (+(~|reg6))) : {(-$signed(reg9))})))
            begin
              reg10 <= (^~wire2);
              reg11 <= {$signed(($signed((reg4 ? reg9 : wire0)) ?
                      reg5[(2'h2):(1'h0)] : $unsigned(((8'had) ?
                          reg5 : wire1))))};
              reg12 <= ({(7'h43)} + (8'hae));
              reg13 <= (~&(!$unsigned($unsigned($unsigned(reg7)))));
              reg14 <= ((~|$signed({((8'ha7) ? (7'h40) : reg7)})) ?
                  reg11[(2'h2):(2'h2)] : (^(8'hb0)));
            end
          else
            begin
              reg10 <= $signed($signed(reg14));
              reg11 <= (~^reg6[(1'h0):(1'h0)]);
              reg12 <= {(wire0[(1'h0):(1'h0)] << {{{wire3}, $unsigned(reg11)},
                      reg14})};
              reg13 <= wire3;
              reg14 <= $signed(reg14);
            end
          reg15 <= $signed(((8'hae) ?
              $signed((+(wire1 ? reg8 : reg13))) : ($unsigned($unsigned(reg6)) ?
                  (reg11 ^~ $unsigned(wire1)) : ({reg4, reg6} >= (|reg4)))));
          reg16 <= {reg12, (reg5 & reg15[(4'ha):(4'h8)])};
        end
      else
        begin
          reg8 <= $signed(($signed($signed((reg5 ? wire2 : reg4))) ?
              (&(((7'h41) | reg15) == reg11[(1'h0):(1'h0)])) : reg13));
          reg9 <= $signed(wire1[(3'h4):(2'h3)]);
          reg10 <= (-((-$signed((reg12 >= wire0))) == reg14[(1'h0):(1'h0)]));
        end
      reg17 <= $unsigned((8'hb7));
      if ((-({(+reg16[(2'h3):(1'h0)])} * {($unsigned(wire2) ?
              (^~wire1) : $unsigned(reg5)),
          reg17[(3'h4):(2'h2)]})))
        begin
          reg18 <= (($signed((8'ha1)) <<< reg8) ?
              reg9[(4'he):(4'h9)] : (~^((+((8'h9d) <<< reg8)) ?
                  $signed((+reg6)) : $signed(wire0))));
          reg19 <= $signed((&{(wire2 ? ((8'hb2) >= wire2) : (reg7 < reg7)),
              {$unsigned(reg7), $signed(reg11)}}));
        end
      else
        begin
          reg18 <= reg13;
        end
      if ((|(((~(wire3 ? reg18 : wire1)) ?
              reg17 : (-((8'hb9) ? (8'ha5) : reg5))) ?
          {(~|{reg18})} : (($signed(reg9) ?
              (~^reg19) : (reg9 ? reg16 : (8'haa))) | {(reg7 >= reg8)}))))
        begin
          if (reg9)
            begin
              reg20 <= wire2;
              reg21 <= (((((reg14 >= reg7) ? (~|wire2) : {wire1}) ^ (8'hbb)) ?
                      (({reg5} ? (~&reg7) : ((8'hb9) << reg12)) ?
                          reg11[(3'h4):(1'h1)] : reg12[(3'h5):(1'h0)]) : $unsigned(reg19[(5'h12):(4'hc)])) ?
                  $unsigned((({reg7, reg10} != (reg18 ? reg10 : reg8)) ?
                      reg16 : ($unsigned(reg10) ?
                          $unsigned(reg17) : reg17[(1'h1):(1'h1)]))) : reg16);
            end
          else
            begin
              reg20 <= $unsigned((reg9[(1'h0):(1'h0)] + reg13[(1'h1):(1'h1)]));
              reg21 <= wire2[(2'h2):(1'h0)];
              reg22 <= ((wire0[(2'h3):(1'h0)] > reg9[(4'hf):(4'hf)]) ?
                  ((~|$unsigned(((7'h41) ^~ reg17))) ?
                      $signed(((reg6 >> wire0) ^~ $signed((7'h44)))) : (&$signed((8'hb3)))) : reg15[(4'hd):(4'hd)]);
              reg23 <= reg6[(2'h2):(2'h2)];
              reg24 <= $signed(reg13);
            end
        end
      else
        begin
          reg20 <= ((~^((reg19 ? reg17 : $signed(reg23)) ?
                  (-reg18[(2'h2):(1'h0)]) : (reg20 + reg20[(2'h3):(1'h1)]))) ?
              $signed(reg20[(4'hb):(4'ha)]) : reg22[(5'h14):(3'h7)]);
          if ($unsigned($signed($signed($unsigned((reg17 ? reg19 : reg4))))))
            begin
              reg21 <= reg11;
              reg22 <= (reg14[(3'h5):(3'h4)] ?
                  (reg7 && reg13[(2'h3):(2'h2)]) : $signed({((+reg4) >= $signed(reg15)),
                      wire3[(4'hb):(2'h2)]}));
            end
          else
            begin
              reg21 <= {(8'hab)};
            end
        end
    end
  assign wire25 = (reg18 ?
                      $signed(reg15) : ($unsigned(reg17) ?
                          (reg19[(2'h3):(1'h1)] ^~ (~|(reg22 <= reg17))) : {(-(reg10 ^ reg22))}));
  module26 #() modinst96 (.y(wire95), .wire31(reg4), .wire30(reg20), .clk(clk), .wire28(wire2), .wire29(reg8), .wire27(reg15));
  assign wire97 = $unsigned({reg16, wire25});
  assign wire98 = reg5[(2'h3):(2'h2)];
  assign wire99 = ({$unsigned(((|reg22) * (wire95 ? reg17 : reg17)))} ?
                      ((((^reg21) ? $signed(reg19) : (wire25 + reg15)) ?
                          (|reg12) : reg12) == (^((8'ha5) ~^ reg24))) : $signed((reg22[(2'h3):(1'h0)] ~^ ($unsigned((8'haf)) == $signed(reg17)))));
  always
    @(posedge clk) begin
      reg100 <= (+(($unsigned((reg11 ? (8'hbc) : reg17)) != (8'hba)) ?
          (~^(reg20[(3'h4):(1'h1)] * (~^reg12))) : ({(reg21 ^~ reg14),
              (reg12 < reg19)} + $unsigned(reg24[(1'h0):(1'h0)]))));
    end
  assign wire101 = ($unsigned($unsigned(reg18)) ?
                       reg7[(4'hd):(4'hd)] : ((((wire95 ? reg13 : reg18) ?
                                   wire2[(4'he):(4'hb)] : (reg4 >= reg23)) ?
                               ({wire98, reg14} == {(8'haa)}) : {(reg16 ?
                                       reg8 : reg13),
                                   $unsigned(reg18)}) ?
                           (((|(8'h9d)) ? (~|reg11) : $signed(wire25)) ?
                               (8'hbe) : (|reg9)) : (8'hac)));
endmodule

module module26
#(parameter param93 = (&(((((8'ha0) ? (8'ha0) : (8'hbc)) ? ((8'hb6) ? (8'hab) : (8'had)) : (8'ha0)) ? {{(8'hae)}, ((8'h9e) ? (8'hb9) : (8'hb7))} : (~&(|(7'h44)))) >>> ({(-(8'hb5))} & (((7'h41) ? (8'hb6) : (8'hac)) ? {(8'hbb), (8'had)} : ((7'h42) << (8'ha7)))))), 
parameter param94 = {(~&(param93 ? (&param93) : ((~^param93) ? param93 : (~^(8'hbe))))), (&(-(&param93)))})
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire31;
  input wire signed [(4'h9):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  input wire signed [(5'h10):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire86;
  wire [(4'he):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire81;
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire50,
                 wire81,
                 (1'h0)};
  module32 #() modinst51 (wire50, clk, wire28, wire29, wire27, wire30, wire31);
  module52 #() modinst82 (wire81, clk, wire27, wire28, wire30, wire50, wire31);
  assign wire83 = {$signed((wire30 ?
                          $signed((wire81 ?
                              wire28 : wire81)) : ((^~wire28) <<< {wire30,
                              wire50})))};
  assign wire84 = ((+wire29) >= ((8'hbc) ?
                      (~|wire81[(1'h0):(1'h0)]) : $unsigned((8'hbe))));
  assign wire85 = $unsigned($unsigned(wire28[(3'h4):(1'h1)]));
  assign wire86 = $signed($signed(((wire28 ?
                          ((8'ha1) * wire31) : $unsigned(wire30)) ?
                      $signed((|wire27)) : {wire83[(1'h1):(1'h0)],
                          $signed(wire31)})));
  assign wire87 = $signed(wire27);
  assign wire88 = $unsigned((-(({wire84} < (+wire50)) ?
                      ($unsigned((8'hb8)) <= $signed(wire30)) : $signed({wire81,
                          wire30}))));
  assign wire89 = wire81;
  assign wire90 = ((wire87 ?
                          (-wire81[(2'h3):(2'h2)]) : ($signed((8'h9c)) <<< wire83[(2'h2):(1'h0)])) ?
                      $unsigned(((7'h43) ?
                          $unsigned($signed((8'had))) : ($signed((8'hb4)) ?
                              $signed(wire89) : $unsigned(wire50)))) : wire27[(3'h4):(2'h3)]);
  assign wire91 = wire31[(1'h1):(1'h0)];
  assign wire92 = (($unsigned({wire27[(3'h4):(1'h1)], (wire84 ^~ wire81)}) ?
                          $signed(($signed(wire81) ?
                              wire27[(3'h7):(2'h3)] : (^~wire86))) : $signed(($unsigned(wire27) ?
                              $signed(wire84) : wire87[(3'h4):(1'h1)]))) ?
                      (~^((~|$signed(wire81)) * {wire81,
                          (wire86 - wire91)})) : $signed(wire86));
endmodule

module module52
#(parameter param79 = (!(((((7'h43) ? (8'hb1) : (8'hb2)) <= {(8'haf)}) ? (((8'ha5) | (8'hb6)) || (~|(8'hbd))) : ((-(8'hb9)) >>> ((7'h41) <= (8'hbe)))) * (({(8'ha9), (8'ha4)} || (!(8'hbd))) >= (~^(~&(7'h44)))))), 
parameter param80 = ((+(((8'ha7) ? (param79 >> param79) : (param79 >= param79)) - {(param79 ? param79 : param79), ((8'hbb) ^~ param79)})) ? (((~^(param79 ? (8'hb5) : (8'ha8))) ? ((^param79) ? {param79} : {param79}) : ((param79 ? param79 : param79) ? {param79} : param79)) || (((8'hb9) | (param79 ? param79 : (8'ha8))) ~^ ((param79 & param79) ? (param79 - param79) : (param79 <= param79)))) : (|(^param79))))
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire57;
  input wire signed [(4'h8):(1'h0)] wire56;
  input wire signed [(2'h2):(1'h0)] wire55;
  input wire [(5'h11):(1'h0)] wire54;
  input wire [(2'h2):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
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
  assign wire58 = $unsigned(wire53);
  assign wire59 = wire54;
  assign wire60 = wire53[(2'h2):(2'h2)];
  assign wire61 = (wire56 * $signed((((8'hba) ?
                          (wire55 ? wire53 : wire54) : (wire55 ?
                              wire53 : wire56)) ?
                      wire58 : wire55[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      if ((8'ha4))
        begin
          if ((((~&{{wire59}}) ?
              (~|$unsigned($unsigned(wire57))) : $signed(wire59)) * ($unsigned($signed((wire54 ^ (8'h9e)))) >> (+(8'hb5)))))
            begin
              reg62 <= wire59[(4'hb):(4'h9)];
              reg63 <= $unsigned($unsigned(((~(~^wire56)) ?
                  wire57 : ({reg62, (8'ha7)} ?
                      (wire56 >>> wire53) : (^~reg62)))));
              reg64 <= (~wire56);
              reg65 <= (^~(&(reg63[(3'h4):(1'h1)] ?
                  $unsigned(wire57[(3'h5):(1'h0)]) : (wire61 ?
                      reg64 : (wire61 >= wire60)))));
            end
          else
            begin
              reg62 <= wire54;
              reg63 <= wire60[(2'h3):(2'h3)];
              reg64 <= {(~^$signed($signed(wire55[(1'h0):(1'h0)]))),
                  wire61[(2'h3):(1'h0)]};
              reg65 <= (($signed(((~|(7'h41)) ^~ reg64)) >= $signed($unsigned($signed(reg63)))) + (^$signed(reg63[(2'h2):(1'h0)])));
            end
        end
      else
        begin
          if (($signed((~{{wire60, wire58}})) ?
              wire58 : (|$unsigned($signed(reg65)))))
            begin
              reg62 <= wire55[(1'h0):(1'h0)];
              reg63 <= (&reg63);
              reg64 <= (({(+$unsigned(reg62)),
                  ($unsigned((8'hb6)) ?
                      (8'h9c) : wire60[(3'h5):(1'h0)])} >> wire54) & wire58[(3'h7):(1'h1)]);
            end
          else
            begin
              reg62 <= (!($unsigned(reg62) <= reg62));
            end
          if ($unsigned(wire58[(4'h8):(1'h1)]))
            begin
              reg65 <= ({$signed({reg62})} ^~ $unsigned(wire53[(2'h2):(1'h1)]));
              reg66 <= $unsigned({(8'hae)});
              reg67 <= reg65;
              reg68 <= wire54;
              reg69 <= wire53[(2'h2):(1'h1)];
            end
          else
            begin
              reg65 <= {$signed((+$unsigned(((8'ha9) || (8'hb2))))),
                  (($signed((wire61 && wire59)) & reg62[(2'h2):(2'h2)]) ?
                      ((^wire55) >>> reg62) : ((wire54[(4'hd):(4'ha)] ^ (+(8'hbb))) ?
                          reg65 : ((wire53 ~^ wire53) * reg66)))};
              reg66 <= (reg63 <= (({(7'h43), $unsigned(reg63)} ?
                  $unsigned($unsigned(reg66)) : $signed($signed(reg66))) ^~ $unsigned($unsigned((~^wire60)))));
            end
        end
      if (((8'hb2) ? $unsigned({wire56[(2'h2):(2'h2)]}) : reg63[(3'h4):(1'h0)]))
        begin
          reg70 <= $signed((reg66[(4'hd):(1'h0)] ?
              ({((8'haa) ? reg65 : wire56), {reg68}} ?
                  ((8'h9e) < $unsigned(wire58)) : ($unsigned(reg68) != $signed((8'hac)))) : $signed(reg63)));
          reg71 <= (~(~|(~(wire57 << {reg64}))));
          reg72 <= $signed((~$unsigned(($unsigned(wire60) ?
              $signed(reg70) : reg62[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg70 <= $unsigned(({($signed(reg64) ?
                  {reg63, wire55} : $signed(reg69))} << (~|($unsigned(reg63) ?
              reg72[(2'h2):(1'h1)] : $signed(wire59)))));
          reg71 <= (~&$unsigned($unsigned((reg68 - wire60[(1'h0):(1'h0)]))));
          reg72 <= wire60[(2'h2):(1'h1)];
          if (($unsigned($signed(wire57)) + $unsigned(($unsigned((reg67 ?
                  reg71 : wire54)) ?
              wire57 : (reg62[(2'h2):(1'h0)] ?
                  $unsigned(reg64) : $signed((8'hb5)))))))
            begin
              reg73 <= ((^~(8'hbf)) ?
                  reg66[(3'h5):(2'h2)] : (wire58[(1'h1):(1'h1)] > reg72[(1'h0):(1'h0)]));
              reg74 <= (8'h9d);
              reg75 <= (~^wire60);
              reg76 <= reg75[(2'h3):(1'h1)];
            end
          else
            begin
              reg73 <= reg71[(1'h0):(1'h0)];
              reg74 <= ($signed(wire61) > (-$unsigned($unsigned(wire56[(2'h3):(1'h1)]))));
            end
        end
      reg77 <= $unsigned((~^reg70));
      reg78 <= $signed({(~|reg75[(1'h0):(1'h0)])});
    end
endmodule

module module32  (y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire37;
  input wire signed [(3'h4):(1'h0)] wire36;
  input wire [(5'h10):(1'h0)] wire35;
  input wire [(3'h4):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  assign y = {wire49,
                 wire39,
                 wire38,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire38 = $unsigned($signed($unsigned({$unsigned(wire36)})));
  assign wire39 = {(wire36[(1'h0):(1'h0)] ?
                          (|({wire33} ?
                              (wire34 ? wire35 : (8'h9c)) : (wire37 ?
                                  wire33 : wire38))) : ($unsigned(wire38[(3'h5):(2'h3)]) ?
                              (wire33 < (8'hb6)) : (wire38 <= $signed(wire37)))),
                      ((8'ha3) || $unsigned($signed(wire38[(1'h0):(1'h0)])))};
  always
    @(posedge clk) begin
      reg40 <= {($unsigned(wire37) ?
              $unsigned(wire38) : wire39[(2'h2):(1'h1)])};
      reg41 <= wire33;
      if ($signed((8'h9c)))
        begin
          reg42 <= $unsigned(wire34[(2'h2):(1'h0)]);
          reg43 <= wire36[(3'h4):(3'h4)];
        end
      else
        begin
          reg42 <= ($unsigned((((wire38 == wire39) ?
                  {wire38, wire37} : wire37) ?
              reg40[(4'h8):(2'h3)] : $unsigned((reg42 ?
                  reg42 : wire34)))) ~^ reg43[(4'hf):(3'h4)]);
          reg43 <= ((~^wire35[(4'ha):(3'h5)]) ?
              $signed($unsigned(((&(8'hb4)) ?
                  wire39[(1'h1):(1'h0)] : {wire39, wire35}))) : (8'hab));
          reg44 <= {reg42[(3'h4):(2'h3)]};
        end
    end
  always
    @(posedge clk) begin
      if (((8'hb2) ?
          wire35[(1'h1):(1'h0)] : $unsigned(($unsigned($signed(wire34)) ?
              (^(~&wire39)) : wire35[(3'h4):(3'h4)]))))
        begin
          reg45 <= ((^~(wire36 ?
                  $unsigned((!(8'hb4))) : $signed($signed((8'had))))) ?
              (~&wire33[(3'h6):(3'h6)]) : reg44);
        end
      else
        begin
          reg45 <= reg41[(1'h0):(1'h0)];
          reg46 <= (~^$unsigned(wire36));
          reg47 <= wire33[(1'h1):(1'h0)];
          reg48 <= reg40[(3'h6):(1'h1)];
        end
    end
  assign wire49 = ($signed(wire35) ?
                      $signed($signed(wire35)) : ((~&(wire34 << (~wire35))) ?
                          ($unsigned($signed(reg44)) ?
                              wire35 : $unsigned($signed(reg45))) : wire38[(1'h1):(1'h1)]));
endmodule
