module top
#(parameter param81 = ((^~(({(8'hba), (8'hb4)} ? ((8'hab) << (8'ha2)) : ((8'hb5) ? (7'h44) : (8'hb2))) ? (-{(8'hbf), (8'ha1)}) : ((|(8'hac)) ? {(8'hb2)} : {(8'hb0)}))) ? ((|({(8'hb6), (7'h41)} ? (8'hbb) : {(8'h9c), (8'hb0)})) ? ({(|(8'hbd)), ((7'h41) < (8'hb3))} ~^ (((8'ha0) && (8'ha5)) ? ((8'h9e) != (8'hbe)) : ((8'had) ^ (8'haa)))) : ({{(8'hb1), (8'h9c)}, ((8'h9c) ^~ (8'hae))} & {((8'ha3) ? (8'ha5) : (8'ha1))})) : ((8'hbe) ? ((|{(8'hb5), (8'ha5)}) ? {(!(8'hae)), ((8'hbc) ? (8'hb4) : (8'had))} : ((8'hb7) > ((8'hb1) ? (8'ha1) : (8'h9f)))) : ((!(!(8'h9f))) ? (^~((8'hb3) <<< (7'h43))) : (~((8'hb0) ? (8'ha7) : (8'hb8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire39;
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  assign y = {wire59,
                 wire54,
                 wire39,
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
                 reg61,
                 reg60,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
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
                 reg42,
                 reg41,
                 (1'h0)};
  module5 #() modinst40 (.wire6(wire0), .wire8(wire1), .y(wire39), .clk(clk), .wire9(wire3), .wire7(wire2));
  always
    @(posedge clk) begin
      reg41 <= {(wire39[(2'h2):(2'h2)] ?
              wire3[(2'h2):(2'h2)] : $signed((!((7'h43) ? wire0 : wire4)))),
          wire39[(1'h0):(1'h0)]};
      reg42 <= (^wire39[(2'h3):(1'h1)]);
      if ({((((reg42 > wire0) ? (wire2 - wire4) : (reg42 ? wire1 : reg42)) ?
              (&{reg42,
                  reg42}) : ($unsigned(wire2) | wire2[(4'hf):(4'hd)])) ^ $signed(wire1[(4'ha):(4'h9)])),
          (-$signed($signed((reg42 ? wire4 : reg42))))})
        begin
          reg43 <= ((+($unsigned($signed(wire1)) ?
                  $signed($signed(wire0)) : $unsigned((~wire3)))) ?
              $unsigned(reg42[(4'hd):(4'h8)]) : wire4[(2'h3):(2'h3)]);
          reg44 <= wire1[(4'hf):(4'hd)];
          reg45 <= wire0[(5'h13):(4'hf)];
          reg46 <= (~|($unsigned((wire1 ?
              wire0[(3'h7):(3'h7)] : (wire39 ^~ wire3))) & wire0[(3'h4):(3'h4)]));
          reg47 <= wire3;
        end
      else
        begin
          reg43 <= (reg41 - ((|({(8'h9f), wire39} ?
                  ((8'hb0) <= wire39) : {reg47, reg43})) ?
              (!reg44) : (wire39 == $unsigned($unsigned((8'ha5))))));
          reg44 <= {$signed(({reg41[(1'h1):(1'h0)], {wire3}} ^ reg47)),
              $unsigned($signed({wire2}))};
        end
    end
  always
    @(posedge clk) begin
      reg48 <= ((!wire39[(2'h3):(2'h3)]) >> wire2);
      if ({$signed((((reg45 ?
              reg46 : wire4) && (wire39 && reg47)) <= ((^~(8'ha5)) ?
              wire4 : (reg45 > reg44)))),
          $unsigned(({reg41[(4'hd):(4'hc)], wire1} - (~&reg43)))})
        begin
          reg49 <= $unsigned((($unsigned(wire3) | (^~wire3[(4'hb):(2'h3)])) >= reg48));
          if (reg47)
            begin
              reg50 <= ($signed((({reg41} ?
                  reg46 : wire3[(4'h9):(1'h1)]) < $signed((reg44 ?
                  wire1 : reg47)))) - $unsigned((wire2 <= $unsigned((wire39 & reg48)))));
              reg51 <= $unsigned(reg47);
              reg52 <= $signed({$unsigned((reg47[(4'ha):(3'h7)] ?
                      (~reg45) : (reg44 || reg41))),
                  {(~(wire4 ? reg44 : wire3)), (-(reg43 << (8'hb8)))}});
            end
          else
            begin
              reg50 <= $signed(reg43);
              reg51 <= $signed(reg50);
              reg52 <= {(~&$signed(reg50))};
              reg53 <= $unsigned((wire4 ?
                  $signed((|reg41[(4'hf):(4'h9)])) : (8'had)));
            end
        end
      else
        begin
          reg49 <= (((8'hb1) + ($signed($unsigned((8'ha2))) ~^ (&$signed(reg51)))) > ((($signed(wire3) > {reg46,
                  reg53}) ?
              $signed((wire1 ?
                  wire3 : reg51)) : $unsigned($unsigned(wire3))) >>> $unsigned(((reg44 ?
              reg43 : reg48) && $signed(reg45)))));
          if ((reg47[(3'h6):(2'h3)] + wire4[(1'h1):(1'h0)]))
            begin
              reg50 <= {$signed(($unsigned($unsigned(reg47)) | reg45)),
                  reg53[(3'h6):(3'h4)]};
              reg51 <= (~&(reg52[(1'h1):(1'h0)] ~^ (($signed((8'ha8)) ?
                      reg42[(4'hf):(4'ha)] : {reg52}) ?
                  (reg47 ^~ wire1[(5'h11):(5'h11)]) : ($unsigned((8'hb9)) ?
                      $signed(reg49) : (|wire1)))));
              reg52 <= {($signed(wire0) != $unsigned((|$signed(wire1))))};
            end
          else
            begin
              reg50 <= reg45;
              reg51 <= wire1;
              reg52 <= ({(!reg53[(4'h8):(1'h0)]),
                      ((^~((8'ha3) + (8'ha6))) ?
                          $unsigned((wire0 != reg46)) : ((wire2 != wire2) | (reg50 << wire0)))} ?
                  reg50[(3'h5):(3'h5)] : (|(wire4[(3'h4):(3'h4)] && ((reg43 ?
                          reg46 : wire2) ?
                      (reg42 <<< wire3) : (reg42 >>> reg47)))));
            end
          if (((^~(~&((wire2 > reg48) >= (&reg52)))) ?
              (($unsigned((wire0 ? reg44 : reg50)) ?
                      reg42[(4'hb):(3'h7)] : (|reg45)) ?
                  ((reg52 >> (reg45 ? reg42 : wire2)) ?
                      ((^reg45) ? {reg49, reg42} : (reg45 ~^ wire3)) : ((reg44 ?
                          reg42 : reg48) == (reg46 ?
                          reg43 : reg51))) : ($unsigned(wire3[(2'h2):(1'h0)]) ~^ {$unsigned(reg52),
                      reg51[(5'h10):(4'he)]})) : (reg44[(1'h1):(1'h1)] && {{reg48,
                      reg41[(4'hf):(4'hc)]},
                  {reg50, (reg41 >>> reg41)}})))
            begin
              reg53 <= reg51;
            end
          else
            begin
              reg53 <= reg41;
            end
        end
    end
  assign wire54 = (reg53 | ($signed(({reg43, reg41} || {(8'ha0)})) ?
                      {$signed(wire3),
                          (wire2[(3'h5):(2'h2)] && {(7'h40),
                              wire39})} : reg47));
  always
    @(posedge clk) begin
      reg55 <= reg42[(2'h2):(1'h0)];
      reg56 <= $unsigned($unsigned(wire0));
      reg57 <= (~$unsigned((&$unsigned((wire1 < wire4)))));
      reg58 <= reg52;
    end
  assign wire59 = {reg42[(4'h9):(3'h6)], reg53};
  always
    @(posedge clk) begin
      if (reg51[(1'h1):(1'h0)])
        begin
          if (wire4[(1'h1):(1'h0)])
            begin
              reg60 <= $unsigned(reg51[(1'h1):(1'h1)]);
            end
          else
            begin
              reg60 <= $signed(wire59);
              reg61 <= (^$signed((8'hb5)));
              reg62 <= (((((~|(8'ha4)) ? (wire0 - (8'h9f)) : (wire3 + reg50)) ?
                          (|$signed(reg52)) : $signed(wire4)) ?
                      $unsigned(($signed(reg53) + wire59)) : $signed((wire54[(5'h14):(1'h0)] || (reg53 ?
                          reg58 : reg41)))) ?
                  $unsigned(reg45[(3'h6):(2'h3)]) : (reg46[(3'h7):(1'h1)] ?
                      reg43 : $unsigned(reg53[(2'h2):(2'h2)])));
              reg63 <= (!($unsigned(wire54) ?
                  (wire39 > $unsigned($signed(reg47))) : reg42[(4'hd):(2'h3)]));
            end
          reg64 <= wire0[(5'h11):(4'hb)];
          reg65 <= {(reg45 ^~ $unsigned($signed($unsigned(reg61))))};
          reg66 <= ((~|$signed(((~&reg56) - $unsigned(reg60)))) >> wire39[(1'h1):(1'h1)]);
        end
      else
        begin
          reg60 <= reg51;
          reg61 <= wire3;
          reg62 <= reg48;
          reg63 <= $unsigned(reg53);
          reg64 <= ((((^wire54) ?
                  reg42[(4'h9):(1'h1)] : $unsigned((reg41 ? reg60 : reg63))) ?
              (wire4[(2'h2):(1'h0)] ?
                  reg42 : $signed((reg50 ? reg53 : (7'h41)))) : {({(8'ha8)} ?
                      reg41[(4'hd):(3'h4)] : (reg66 < reg58)),
                  $unsigned((wire59 ?
                      reg52 : reg48))}) >>> {$signed($unsigned((reg55 >>> reg46)))});
        end
      if ($signed((reg48[(4'ha):(4'h8)] ?
          $unsigned(($signed(reg51) >>> {reg46,
              reg45})) : ((!reg61[(3'h4):(1'h1)]) ?
              reg47 : $unsigned(((8'h9e) ? reg45 : wire59))))))
        begin
          if (reg47[(3'h6):(2'h3)])
            begin
              reg67 <= wire2;
              reg68 <= {(($signed(((8'ha6) ?
                          reg67 : reg50)) < reg67[(4'hd):(1'h0)]) ?
                      reg57 : ($unsigned($signed(wire4)) <= wire3[(4'h8):(2'h2)]))};
              reg69 <= $signed(((^reg41) && $signed($unsigned((reg46 ?
                  reg45 : reg63)))));
              reg70 <= {(~$signed((~&reg49))), $unsigned((8'hb1))};
              reg71 <= $signed(reg66[(2'h2):(2'h2)]);
            end
          else
            begin
              reg67 <= reg58[(1'h0):(1'h0)];
              reg68 <= $signed(({(8'hb0), reg60} ?
                  $unsigned(reg63) : ($unsigned((reg69 >> (8'hbc))) ^~ reg70[(4'h8):(2'h3)])));
            end
          if ((!reg60))
            begin
              reg72 <= ({{$unsigned((reg56 && reg70))}} ?
                  $signed(wire0[(2'h2):(1'h0)]) : $unsigned($unsigned((~^$unsigned(reg69)))));
              reg73 <= $unsigned(reg63);
              reg74 <= wire0;
              reg75 <= reg65[(1'h0):(1'h0)];
            end
          else
            begin
              reg72 <= (~(8'h9f));
              reg73 <= $signed((~|$signed(((^reg74) * $signed(wire3)))));
              reg74 <= ($signed(reg57) ~^ (8'hbf));
              reg75 <= $signed((^(((~^(8'hb9)) ?
                      reg69[(2'h3):(1'h0)] : (reg73 & reg41)) ?
                  reg69[(1'h0):(1'h0)] : ((reg47 ? reg61 : reg63) ?
                      reg57[(3'h7):(2'h3)] : reg48[(2'h2):(1'h1)]))));
            end
          reg76 <= (((^~{(^~(8'hb1)), reg52}) ? wire54[(4'ha):(3'h6)] : reg44) ?
              ($signed((+reg47)) > reg43[(4'ha):(4'ha)]) : {(^~reg66)});
          reg77 <= (^$signed(($unsigned((reg61 ? reg73 : reg41)) && ({reg64,
                  reg46} ?
              (reg48 >>> reg60) : $unsigned(reg62)))));
          reg78 <= reg52[(1'h0):(1'h0)];
        end
      else
        begin
          reg67 <= reg67[(4'h8):(3'h4)];
          reg68 <= $unsigned((~^(reg55 ?
              $signed((reg73 && reg45)) : ((reg69 && reg47) && $unsigned(reg65)))));
          reg69 <= ($signed(reg69) ?
              reg62 : {(|reg43[(3'h5):(3'h5)]),
                  ($unsigned({reg49}) ^~ $unsigned($signed((8'hbe))))});
          reg70 <= reg48[(4'h9):(2'h3)];
        end
      reg79 <= $signed($signed({((~reg60) + $unsigned(reg63))}));
      reg80 <= reg74;
    end
endmodule

module module5
#(parameter param38 = ({{(((8'hb0) > (8'ha6)) ? {(8'h9e)} : ((8'ha4) <<< (7'h43))), ({(8'ha1)} ? ((7'h40) << (8'haa)) : {(8'hbf)})}} ? {((((8'hb6) <<< (7'h40)) ^ ((8'hb3) ? (8'hbf) : (8'ha2))) <= (((7'h44) ? (8'hab) : (7'h42)) ? ((8'hb8) ? (8'ha1) : (8'ha0)) : ((8'hb4) ? (8'hbd) : (8'ha8)))), (8'hbd)} : ((~&(~|{(8'hbe), (8'hb7)})) ? ({((7'h40) > (8'hac))} <= (^((8'hbc) ^~ (8'ha6)))) : (8'ha4))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire10;
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  assign y = {wire36,
                 wire17,
                 wire16,
                 wire10,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = wire6[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg11 <= {(~^((^wire8[(2'h2):(2'h2)]) + ($unsigned(wire9) ^~ ((8'hbc) ?
              wire9 : wire7)))),
          wire8};
      if ($unsigned($unsigned((~^({wire10, (8'ha9)} << $signed(reg11))))))
        begin
          reg12 <= {$unsigned(wire7)};
          reg13 <= $unsigned(reg11);
        end
      else
        begin
          if (($signed(wire8) ?
              $unsigned(reg11[(1'h1):(1'h0)]) : wire9[(4'h8):(3'h7)]))
            begin
              reg12 <= (!reg13[(1'h0):(1'h0)]);
            end
          else
            begin
              reg12 <= (wire10 ^ reg13);
              reg13 <= $unsigned($signed((^($unsigned(wire7) & (wire8 ?
                  wire8 : wire9)))));
              reg14 <= $unsigned((|(wire6 ?
                  ($signed(wire10) < reg12) : (&$signed(wire8)))));
              reg15 <= (~|(-$signed(reg14)));
            end
        end
    end
  assign wire16 = wire9[(3'h6):(2'h3)];
  assign wire17 = wire9;
  module18 #() modinst37 (wire36, clk, wire9, wire16, wire10, wire17);
endmodule

module module18
#(parameter param34 = {(((~|((8'hb8) ~^ (8'hb8))) > (+(8'hbb))) ? ((((8'ha5) << (7'h44)) ? {(8'hbf), (8'hb2)} : ((8'hb1) ~^ (8'hb9))) <<< (((8'h9c) ? (8'hac) : (7'h44)) ? ((8'haa) >> (8'hb5)) : ((8'ha4) * (8'h9f)))) : ((!(^~(8'ha6))) ? (^~((8'ha8) ? (8'hb9) : (8'hb5))) : ({(8'haa)} ? ((8'haa) + (8'hbf)) : (~&(8'h9f))))), {(((~|(8'hb2)) ? ((8'hbe) ? (8'ha8) : (8'h9f)) : {(8'ha8), (8'hbd)}) ? (^~((8'ha8) ? (8'hbc) : (7'h42))) : (~^(-(8'ha1))))}}, 
parameter param35 = param34)
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire22;
  input wire [(4'ha):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire25,
                 wire24,
                 wire23,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire23 = $signed(wire22[(2'h2):(1'h0)]);
  assign wire24 = wire21[(2'h3):(1'h1)];
  assign wire25 = $signed(wire22[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg26 <= (($signed(((wire21 ? wire24 : (8'hb2)) ^~ $unsigned(wire20))) ?
              wire22[(1'h1):(1'h0)] : $unsigned({wire23, wire19})) ?
          ((-wire20) - $unsigned(($signed((8'hb9)) + $signed(wire25)))) : (({(wire23 & wire22)} | wire23[(1'h1):(1'h0)]) == wire25));
      reg27 <= wire25[(1'h1):(1'h1)];
      reg28 <= $unsigned((wire25[(3'h5):(1'h1)] ?
          ($unsigned((wire22 > (7'h40))) ?
              (8'h9e) : (8'hb6)) : wire21[(3'h7):(2'h3)]));
    end
  assign wire29 = $unsigned($unsigned(reg28[(5'h10):(3'h7)]));
  assign wire30 = $signed(reg26[(1'h0):(1'h0)]);
  assign wire31 = (~&(&wire24[(2'h3):(2'h2)]));
  assign wire32 = $signed((wire31 < wire22[(1'h0):(1'h0)]));
  assign wire33 = (|wire19[(2'h2):(1'h1)]);
endmodule
