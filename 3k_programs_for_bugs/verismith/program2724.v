module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire107;
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire112,
                 wire110,
                 wire109,
                 wire5,
                 wire6,
                 wire107,
                 reg113,
                 reg111,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = (~^{wire5,
                     (($signed(wire5) | (wire0 <<< (8'ha9))) ?
                         ({(8'ha1)} >> {wire1}) : ($unsigned(wire4) ?
                             wire5 : (!wire5)))});
  module7 #() modinst108 (.wire8(wire5), .y(wire107), .wire9(wire0), .clk(clk), .wire11(wire3), .wire10(wire4), .wire12(wire6));
  assign wire109 = (^~$unsigned($signed($unsigned(wire2))));
  assign wire110 = ((wire107[(2'h3):(2'h2)] ?
                           {((^~wire5) ?
                                   (~^wire2) : (wire1 ?
                                       wire3 : wire107))} : wire4) ?
                       ($unsigned($signed((wire6 != wire5))) ?
                           (~|wire3) : wire109) : $signed($unsigned(wire1[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg111 <= $unsigned((~^wire0[(4'ha):(3'h7)]));
    end
  assign wire112 = (&(^~(({wire107} ? (wire2 > wire4) : wire3) ?
                       (^~$signed(wire110)) : {wire4[(2'h2):(2'h2)],
                           $unsigned(reg111)})));
  always
    @(posedge clk) begin
      reg113 <= (wire2[(2'h3):(1'h1)] | ((+wire112) ?
          wire110 : $unsigned($unsigned(wire2))));
    end
  assign wire114 = wire112;
  assign wire115 = (-wire6);
endmodule

module module7
#(parameter param105 = ((^~(((~|(8'hb8)) ? (|(8'hba)) : ((8'hb6) ? (8'hb9) : (8'hbb))) >> (8'hb3))) || {((+((8'hbc) || (8'hb3))) || {(^~(8'hb4)), (^(8'ha8))}), ((((8'hb4) >>> (8'haf)) == ((8'ha5) <<< (8'hb2))) - (((8'ha4) != (8'hac)) ? {(8'hb6), (8'hac)} : ((8'h9f) * (8'ha2))))}), 
parameter param106 = (!(7'h42)))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire99;
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire39,
                 wire77,
                 wire79,
                 wire99,
                 reg102,
                 reg101,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= {$unsigned((+(8'h9c)))};
    end
  module14 #() modinst40 (.wire16(wire8), .y(wire39), .wire15(wire12), .wire18(wire10), .clk(clk), .wire17(wire9));
  module41 #() modinst78 (wire77, clk, wire8, wire11, wire39, wire12);
  assign wire79 = $unsigned(((($unsigned((8'hbf)) ?
                          (~|(8'ha4)) : (wire11 ? wire12 : wire12)) <= wire8) ?
                      reg13 : (^~$signed((^wire12)))));
  module80 #() modinst100 (.clk(clk), .y(wire99), .wire85(wire79), .wire81(wire39), .wire83(wire12), .wire84(wire77), .wire82(wire9));
  always
    @(posedge clk) begin
      reg101 <= $unsigned((!wire11[(5'h12):(1'h0)]));
      reg102 <= reg13[(2'h3):(2'h2)];
    end
  assign wire103 = $unsigned(((wire79 >= wire8[(4'ha):(3'h4)]) != (-$signed((wire77 | wire39)))));
  assign wire104 = {((8'h9f) + $signed((8'h9d)))};
endmodule

module module80  (y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire85;
  input wire signed [(5'h10):(1'h0)] wire84;
  input wire signed [(5'h14):(1'h0)] wire83;
  input wire [(4'he):(1'h0)] wire82;
  input wire [(5'h10):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire89;
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 reg96,
                 reg95,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg86 <= $signed($unsigned($signed($unsigned((!wire83)))));
      reg87 <= (wire83 ?
          {$signed({wire84[(2'h2):(1'h0)]})} : ((~^((~|wire81) & $signed((8'ha7)))) < wire82));
      reg88 <= (&(wire84[(4'hd):(4'hb)] ^~ $unsigned(reg86)));
    end
  assign wire89 = (+wire84);
  assign wire90 = reg86;
  assign wire91 = ($signed(wire82[(4'h9):(3'h5)]) + wire82[(2'h3):(1'h0)]);
  assign wire92 = $signed({reg86});
  assign wire93 = ((~$signed($signed($unsigned(wire89)))) ?
                      (~(reg88[(4'ha):(4'h8)] ?
                          $unsigned($signed(reg88)) : {wire85[(2'h2):(1'h1)],
                              (reg86 | wire92)})) : wire92);
  assign wire94 = ({wire81[(3'h7):(3'h5)],
                      wire92[(2'h2):(1'h1)]} - (|(^(8'hb1))));
  always
    @(posedge clk) begin
      reg95 <= (~^{(~^(wire85[(3'h5):(3'h5)] ~^ (wire85 > (8'hbc))))});
      reg96 <= {reg88[(4'h8):(3'h5)], $signed((~$signed($unsigned(wire83))))};
    end
  assign wire97 = ({$unsigned($signed((&wire92)))} ?
                      $unsigned((reg88 & ((wire89 + wire82) ?
                          reg86[(4'h8):(3'h4)] : reg95[(3'h6):(1'h0)]))) : reg87);
  assign wire98 = (!($unsigned({$signed((7'h40)),
                      {wire81}}) || wire93[(4'he):(3'h4)]));
endmodule

module module41
#(parameter param75 = {(|{(((8'h9f) ^~ (8'hbb)) ? {(8'h9c)} : {(8'hbf), (8'haa)}), {((7'h44) != (8'h9e))}}), ((~({(8'ha2), (8'ha7)} ? ((8'ha8) ? (8'ha7) : (8'ha0)) : ((8'hbc) ? (8'hb1) : (8'ha1)))) ? (~({(8'ha2), (8'h9e)} ? (!(8'hb0)) : (~|(8'hb5)))) : ((|(^(8'hb9))) ? (((8'hac) ? (8'hbb) : (8'hbb)) ? {(8'hb7)} : ((7'h42) & (8'haa))) : ((-(8'h9e)) * ((7'h44) == (8'haa)))))}, 
parameter param76 = ((((^~(~&param75)) >= (~^(param75 ~^ param75))) ? (((param75 ? param75 : param75) > param75) ? (param75 + (param75 ? param75 : param75)) : (8'ha6)) : ((param75 >>> (param75 * param75)) >>> {(param75 >= param75), (param75 ? param75 : param75)})) > (^~(((param75 & param75) ? param75 : param75) ? ((param75 ^~ param75) ? (param75 ? param75 : param75) : (param75 ? param75 : param75)) : (param75 == param75)))))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire45;
  input wire [(2'h2):(1'h0)] wire44;
  input wire signed [(4'h9):(1'h0)] wire43;
  input wire [(3'h7):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'hba))
        begin
          reg46 <= {(^~$signed(wire43[(2'h3):(2'h2)])),
              $unsigned($signed({wire44, (8'hbc)}))};
          reg47 <= $unsigned({wire45[(3'h6):(1'h1)],
              ((8'hb8) * $signed($unsigned((8'ha5))))});
        end
      else
        begin
          reg46 <= (wire44 || wire42);
          reg47 <= {(-$unsigned(reg46))};
          reg48 <= wire44;
        end
      reg49 <= wire44;
      if ($unsigned(((8'hbc) || wire42)))
        begin
          reg50 <= {$unsigned({(&(~&reg48)), $unsigned((~^(8'ha3)))}), (8'ha9)};
          reg51 <= {((~|{wire45, reg48[(3'h6):(1'h0)]}) ? reg47 : (8'hb1)),
              reg47[(4'h8):(2'h2)]};
          reg52 <= (wire45 ? reg47[(3'h5):(1'h0)] : {wire45[(4'h8):(1'h1)]});
          reg53 <= $unsigned(((^$unsigned($unsigned(wire44))) != {reg50[(3'h4):(2'h3)]}));
          reg54 <= $unsigned(reg47[(4'ha):(4'h9)]);
        end
      else
        begin
          reg50 <= $unsigned((~{(~^(8'hb1))}));
          reg51 <= $signed((-$unsigned(wire45)));
          reg52 <= $unsigned($unsigned(wire45[(3'h4):(2'h2)]));
        end
    end
  assign wire55 = $unsigned(wire42[(3'h5):(2'h3)]);
  assign wire56 = (!{(wire43[(1'h1):(1'h0)] <= $unsigned(((8'h9d) ?
                          (8'hb2) : reg48)))});
  assign wire57 = reg51;
  assign wire58 = ((!wire57) | (wire42 ?
                      (~($unsigned(wire44) ?
                          (reg52 > wire43) : wire45)) : (reg52[(1'h1):(1'h0)] != $signed(wire56))));
  assign wire59 = $unsigned(($signed(wire56[(5'h11):(2'h3)]) ?
                      $unsigned($signed($signed(wire45))) : $signed((wire43 - $signed(reg47)))));
  assign wire60 = wire57[(4'h9):(3'h6)];
  assign wire61 = $unsigned($unsigned(wire57[(3'h7):(3'h5)]));
  assign wire62 = $signed(wire57[(3'h7):(3'h6)]);
  assign wire63 = (-((^(wire61[(4'hb):(1'h0)] - {reg50})) ?
                      (~^reg51[(3'h5):(2'h3)]) : (^(wire60[(3'h6):(1'h1)] ?
                          wire60[(1'h1):(1'h1)] : reg51[(1'h0):(1'h0)]))));
  assign wire64 = reg46;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((wire42 <<< $signed(wire56)))))
        begin
          reg65 <= (~&wire62);
          reg66 <= wire57;
        end
      else
        begin
          reg65 <= $unsigned((~&wire61));
          reg66 <= (wire55 ?
              $unsigned(reg49[(1'h1):(1'h0)]) : {(((&wire61) > $signed(wire57)) ?
                      ((reg49 ?
                          reg48 : (8'ha0)) && {wire64}) : $unsigned((wire61 ?
                          reg66 : reg48)))});
          if ((!wire42))
            begin
              reg67 <= wire60;
              reg68 <= (wire43[(4'h9):(1'h1)] ?
                  $unsigned((reg54[(2'h3):(1'h0)] ?
                      wire44[(1'h1):(1'h0)] : (reg54 ?
                          (reg50 ?
                              (8'hb0) : wire57) : (8'hb6)))) : $unsigned(((reg47[(4'ha):(3'h7)] ?
                          (reg53 ? reg67 : wire60) : (wire63 ?
                              wire63 : wire61)) ?
                      wire60[(2'h3):(2'h3)] : $unsigned($unsigned(wire62)))));
              reg69 <= (reg47 >>> reg48[(2'h2):(1'h0)]);
            end
          else
            begin
              reg67 <= $unsigned($signed((reg48[(3'h6):(1'h0)] | $signed((~&reg51)))));
              reg68 <= ($signed(($signed($unsigned((8'h9c))) ?
                      ($signed(reg51) ?
                          $signed(reg65) : reg53[(3'h4):(2'h3)]) : ($unsigned(wire59) >> (wire60 >> reg69)))) ?
                  reg54[(1'h1):(1'h1)] : (8'hbc));
              reg69 <= wire64[(3'h4):(2'h2)];
            end
          reg70 <= ({$signed(wire56)} ?
              ((($signed(wire57) && (8'hbd)) ?
                  (+wire42) : wire44[(2'h2):(1'h1)]) && (^~(wire64[(4'ha):(3'h6)] ?
                  (wire57 ?
                      reg65 : (7'h43)) : wire55))) : reg49[(1'h1):(1'h1)]);
          reg71 <= wire55;
        end
    end
  assign wire72 = $unsigned(wire42);
  assign wire73 = reg54[(1'h1):(1'h1)];
  assign wire74 = (($signed(reg49) || wire73) ?
                      ((((wire73 ? wire45 : wire59) ?
                              $unsigned(reg70) : (wire58 ? reg50 : wire59)) ?
                          (8'hb9) : $unsigned((8'hb7))) != wire63) : (+(&$signed((wire73 & reg47)))));
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  assign y = {wire38,
                 wire33,
                 wire32,
                 wire31,
                 wire21,
                 wire20,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg19 <= ((~&(7'h42)) ?
          (((-((8'hab) ? (8'ha1) : wire17)) ?
                  (wire17 ? {wire15} : (wire17 == wire18)) : wire16) ?
              (wire17 > wire18) : (|$unsigned($signed(wire17)))) : (8'hb7));
    end
  assign wire20 = wire16[(1'h0):(1'h0)];
  assign wire21 = (+(+wire17[(4'ha):(1'h1)]));
  always
    @(posedge clk) begin
      reg22 <= ({$unsigned((^$signed(wire21))),
          $unsigned($unsigned((^~wire17)))} ^~ (({(^~(8'hbd)),
              (wire18 ^ wire17)} != {$signed(wire16),
              (wire17 ? wire18 : wire15)}) ?
          wire16 : ((+$unsigned(wire20)) ?
              reg19[(4'hc):(4'ha)] : (wire17 + $signed(wire16)))));
      if ((~&{$signed(((8'hbe) ? (!wire20) : wire15[(4'h9):(4'h9)]))}))
        begin
          reg23 <= $signed(((~|reg19[(4'hd):(3'h7)]) && {$signed((~^reg22)),
              {(wire21 ? (8'haa) : reg19)}}));
        end
      else
        begin
          if ((~($unsigned(({wire18, wire15} ?
              (&wire20) : (8'ha5))) | {((wire21 ? wire15 : wire17) ?
                  $unsigned(reg22) : ((8'hbb) & wire15)),
              $unsigned($signed((7'h41)))})))
            begin
              reg23 <= $signed((($signed((wire21 ? wire15 : reg19)) ?
                      ({wire17} - $signed(reg19)) : (~|wire21)) ?
                  $signed(wire17) : {$signed((~^reg19)), reg22}));
              reg24 <= $unsigned($signed(reg19));
              reg25 <= (!wire17);
              reg26 <= ((8'ha5) ?
                  (+(^{((8'ha4) ? wire18 : wire21),
                      (wire20 | wire21)})) : $signed((8'ha1)));
              reg27 <= wire21;
            end
          else
            begin
              reg23 <= $unsigned(($unsigned({wire15[(3'h4):(1'h0)],
                  $signed(wire17)}) >>> $unsigned(wire20)));
              reg24 <= ((reg27[(3'h7):(1'h1)] < $signed((wire15 > reg22))) ?
                  ($signed({(wire18 ? reg26 : wire18), wire15[(1'h1):(1'h0)]}) ?
                      (8'hbf) : $unsigned(({(8'had)} ^~ (reg27 | reg27)))) : (8'hb7));
              reg25 <= (reg25[(2'h2):(2'h2)] ?
                  wire17 : {({$signed((8'h9f))} || (reg26 ? reg23 : wire15)),
                      $unsigned(((wire15 ? reg22 : reg27) ?
                          reg25[(5'h12):(1'h1)] : $signed((7'h41))))});
            end
          reg28 <= wire20[(2'h3):(2'h3)];
          reg29 <= reg23[(4'h8):(2'h3)];
        end
      reg30 <= $signed($unsigned(((reg28[(4'ha):(3'h7)] ?
          wire18 : wire21[(3'h7):(2'h3)]) >= $unsigned(((8'hb7) + wire18)))));
    end
  assign wire31 = (~$signed(reg22));
  assign wire32 = $signed({reg28[(3'h4):(2'h3)], (^reg29[(4'hb):(3'h5)])});
  assign wire33 = (reg22[(2'h2):(1'h0)] ?
                      reg28[(1'h0):(1'h0)] : $unsigned(reg28));
  always
    @(posedge clk) begin
      reg34 <= (wire31 << (($unsigned(((8'h9c) ? (8'hbe) : wire16)) ?
          ((^wire16) < (&wire21)) : ((wire15 ?
              reg23 : wire31) < (~(7'h44)))) || (^~((wire17 + wire33) || (|reg27)))));
      reg35 <= (~^reg19);
      reg36 <= (($signed(((^reg19) ?
              $signed(wire16) : (wire16 ? reg26 : reg26))) ?
          (~^wire18[(1'h0):(1'h0)]) : $signed((reg27 ?
              $signed(wire33) : ((8'hb7) * wire21)))) - ((8'had) ?
          (8'hb9) : wire32));
      reg37 <= $unsigned({(wire17[(4'h8):(2'h2)] ?
              reg36[(5'h11):(3'h6)] : ($signed((8'had)) < {wire18, reg30})),
          reg26});
    end
  assign wire38 = ($unsigned({(&(^(8'ha1)))}) ?
                      $unsigned({(&$unsigned((8'hbd))),
                          $signed((reg25 - reg24))}) : reg29[(5'h10):(4'hb)]);
endmodule
