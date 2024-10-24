module top
#(parameter param139 = (~|(({((8'ha8) ? (8'ha6) : (8'ha7)), ((8'hb8) + (8'hbe))} ~^ (8'h9c)) ^ ((((8'ha8) ? (8'hbb) : (8'hbb)) ? ((8'hb3) >= (8'hb0)) : ((8'hbd) ? (8'ha5) : (8'hbc))) << {(+(7'h41))}))), 
parameter param140 = (((((~param139) ? (param139 ? param139 : (8'hba)) : (7'h40)) ? ((param139 * param139) ^ {param139}) : {(param139 ? param139 : param139), (param139 & param139)}) ? (8'had) : ((~(&param139)) & ({(8'hbf)} && param139))) < {param139, param139}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire138;
  wire [(4'ha):(1'h0)] wire136;
  wire signed [(3'h6):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  assign y = {wire138,
                 wire136,
                 wire40,
                 wire39,
                 wire38,
                 wire32,
                 wire31,
                 wire29,
                 wire17,
                 wire16,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 (1'h0)};
  assign wire5 = (wire1 >= $unsigned(wire4));
  assign wire6 = wire0[(3'h6):(2'h2)];
  assign wire7 = $signed(($unsigned({(|wire6)}) <= (({wire1} >> $unsigned(wire1)) ?
                     $signed($signed(wire2)) : wire3)));
  assign wire8 = $unsigned(wire5[(2'h3):(2'h2)]);
  assign wire9 = wire1[(3'h4):(1'h1)];
  assign wire10 = (wire9[(1'h1):(1'h1)] <= $unsigned(wire2));
  assign wire11 = {$signed((wire7 | $unsigned((~&wire4))))};
  always
    @(posedge clk) begin
      reg12 <= $unsigned(wire3);
      reg13 <= wire10;
      reg14 <= ({($unsigned($signed((8'hb4))) ? $signed((+wire7)) : wire6),
              ($unsigned((wire2 == (8'h9c))) ?
                  $signed(reg12[(3'h4):(2'h2)]) : ((8'hb9) ?
                      wire3[(4'ha):(3'h5)] : $signed(wire9)))} ?
          (&$signed($signed($signed(wire2)))) : $unsigned($unsigned(wire1[(2'h3):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg15 <= reg12[(4'he):(3'h6)];
    end
  assign wire16 = ($signed((wire2[(4'h9):(3'h5)] <<< $signed($unsigned(wire6)))) ?
                      wire6 : ((wire7[(2'h2):(1'h1)] ?
                              reg13 : (wire0[(1'h1):(1'h1)] > wire0)) ?
                          (wire4 ?
                              $unsigned(wire3) : wire8[(5'h13):(3'h4)]) : ($signed($unsigned(reg13)) | wire1[(4'h8):(1'h0)])));
  assign wire17 = ($unsigned($unsigned(wire1[(2'h3):(1'h0)])) >>> ($signed($unsigned(((8'hb1) == wire9))) ?
                      (~|$unsigned((reg15 ?
                          wire7 : (8'h9f)))) : $unsigned($signed(((8'hb3) ^ reg12)))));
  module18 #() modinst30 (.wire19(wire7), .wire20(wire5), .clk(clk), .wire22(wire10), .y(wire29), .wire21(wire6));
  assign wire31 = ($signed((~(^(wire7 ?
                      wire1 : wire2)))) ~^ (wire29 >= (wire9[(2'h2):(1'h1)] ?
                      wire29[(4'h9):(2'h2)] : (((8'h9d) ?
                          (8'hba) : wire29) - (reg15 ? wire11 : (8'ha5))))));
  assign wire32 = $unsigned($unsigned(wire29[(3'h7):(2'h3)]));
  always
    @(posedge clk) begin
      reg33 <= (!$signed({($unsigned((8'hb4)) ?
              $signed(wire1) : $unsigned((8'ha7))),
          $unsigned((wire0 ? (8'hbb) : wire2))}));
      reg34 <= wire31;
      reg35 <= ({(((&wire10) ?
              (wire3 > wire6) : (-wire11)) != (((8'hab) ~^ wire17) ?
              $signed(wire9) : (reg14 ?
                  (8'ha9) : wire10)))} - wire9[(1'h0):(1'h0)]);
      reg36 <= ({$unsigned(wire8)} ?
          ($signed($unsigned((wire7 <<< wire0))) + (($signed(reg13) ?
              {(8'hba)} : wire32) & (8'ha0))) : $unsigned($signed(wire32)));
      reg37 <= reg33[(5'h10):(2'h2)];
    end
  assign wire38 = $unsigned(($signed((&wire9[(1'h1):(1'h0)])) * wire4));
  assign wire39 = (~$unsigned($unsigned((~^{wire17, (8'hbe)}))));
  assign wire40 = $unsigned($signed($unsigned($unsigned((^~wire6)))));
  always
    @(posedge clk) begin
      reg41 <= wire4[(5'h12):(4'hb)];
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned($unsigned(wire6))))
        begin
          if (wire39[(2'h2):(2'h2)])
            begin
              reg42 <= wire11[(1'h0):(1'h0)];
              reg43 <= {reg34[(4'h9):(4'h9)]};
              reg44 <= (~&{$unsigned(wire8),
                  ($unsigned({wire17, reg33}) ? $unsigned((~^reg33)) : reg12)});
            end
          else
            begin
              reg42 <= $unsigned(reg36);
              reg43 <= $signed(wire31);
              reg44 <= (|wire32[(4'ha):(1'h0)]);
            end
          reg45 <= ($signed($unsigned((~&(wire38 ? reg41 : reg43)))) ?
              reg13 : ((reg42 < reg15) == (8'ha6)));
          reg46 <= (($signed(((-wire0) ?
              (wire6 >> wire11) : {reg13,
                  wire9})) >= ($unsigned($unsigned((8'hb7))) | wire38)) != (!wire0));
          reg47 <= {(+reg34)};
          reg48 <= wire2[(1'h1):(1'h1)];
        end
      else
        begin
          reg42 <= {(~$signed($signed((|wire0))))};
          reg43 <= $unsigned(reg45[(2'h3):(2'h2)]);
        end
      reg49 <= (-(wire11[(4'hd):(2'h2)] ?
          wire6 : (~&$unsigned(reg14[(3'h6):(1'h1)]))));
      reg50 <= ((&$signed((~^(-wire16)))) ?
          $unsigned(reg47[(1'h1):(1'h1)]) : reg12[(4'hc):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg51 <= wire2;
    end
  module52 #() modinst137 (wire136, clk, wire10, wire7, wire2, wire8, reg13);
  assign wire138 = wire5[(3'h4):(1'h1)];
endmodule

module module52
#(parameter param135 = {((({(8'had), (8'hb6)} < {(8'h9f)}) >> {(&(8'hab))}) ? (((~(8'h9f)) != ((8'ha9) < (8'haf))) ? ({(8'hb8)} ? (~(8'ha7)) : {(8'hb9)}) : ({(8'haa)} & {(8'hab), (8'hb2)})) : (^(((8'hb0) ? (8'hb8) : (8'ha3)) >= ((8'hbe) >>> (8'hb3))))), ({(7'h40), (((8'hbe) ? (8'h9d) : (8'hb5)) ? (-(8'ha9)) : (^(8'hb8)))} > (8'hbb))})
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire57;
  input wire [(2'h2):(1'h0)] wire56;
  input wire [(3'h4):(1'h0)] wire55;
  input wire [(3'h4):(1'h0)] wire54;
  input wire [(5'h13):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire133;
  wire signed [(5'h10):(1'h0)] wire132;
  wire [(4'he):(1'h0)] wire130;
  wire signed [(5'h11):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire104;
  wire signed [(5'h11):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire85,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 (1'h0)};
  assign wire58 = wire55[(3'h4):(3'h4)];
  assign wire59 = wire56[(1'h0):(1'h0)];
  assign wire60 = wire53;
  assign wire61 = $unsigned((8'had));
  assign wire62 = {wire61, $signed(wire60[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg63 <= {wire58[(3'h5):(1'h1)], wire54};
    end
  always
    @(posedge clk) begin
      if ((~$unsigned($unsigned((reg63 | {wire58})))))
        begin
          reg64 <= wire61;
          reg65 <= wire59;
          reg66 <= ($unsigned(wire56) ?
              $signed(($unsigned(wire55[(2'h2):(1'h1)]) ?
                  $signed($signed(wire61)) : reg63)) : (8'hac));
          reg67 <= (&wire54[(2'h2):(2'h2)]);
        end
      else
        begin
          reg64 <= reg67;
          reg65 <= (8'hbf);
          reg66 <= {wire58[(4'ha):(2'h2)],
              (wire61 ?
                  (wire62 ?
                      $unsigned(wire59[(2'h3):(2'h3)]) : $signed($unsigned(reg67))) : $signed(({reg64} < $unsigned((7'h40)))))};
          if (wire58[(1'h0):(1'h0)])
            begin
              reg67 <= (wire54[(3'h4):(1'h0)] ?
                  $unsigned($signed(((~&(8'hae)) ?
                      $signed(wire62) : wire58))) : wire57);
              reg68 <= (|$signed({reg65}));
              reg69 <= (^($unsigned(wire54[(2'h2):(2'h2)]) || ($unsigned((wire61 >> reg66)) & $signed((wire62 ?
                  reg65 : (7'h43))))));
            end
          else
            begin
              reg67 <= (~|$signed((((^wire61) & (reg63 << reg68)) ?
                  wire62 : $signed(reg69[(2'h3):(2'h3)]))));
              reg68 <= wire55;
            end
        end
      reg70 <= (8'haf);
      if (reg65[(4'ha):(4'h8)])
        begin
          reg71 <= wire57[(1'h1):(1'h1)];
          reg72 <= reg70;
          reg73 <= $signed(($unsigned(wire53) ?
              (({reg65} << (-wire56)) && (~{wire62,
                  (8'ha2)})) : wire53[(4'hb):(3'h4)]));
        end
      else
        begin
          reg71 <= reg67[(2'h2):(1'h1)];
          if ($signed(reg63[(4'h8):(1'h1)]))
            begin
              reg72 <= (($unsigned((8'hb3)) < wire56[(2'h2):(1'h1)]) ^~ ($signed(reg73[(1'h1):(1'h1)]) ?
                  ((8'hbd) ?
                      ((reg66 | reg66) <= (wire54 | (8'hb6))) : wire60) : (+wire56)));
              reg73 <= ((($signed($unsigned(wire55)) ^~ {{reg71},
                          (wire56 ? wire54 : (8'ha7))}) ?
                      $unsigned($signed($unsigned(reg72))) : reg63[(1'h1):(1'h0)]) ?
                  ((((~^wire56) ? ((8'hbc) ? wire54 : reg69) : reg67) ?
                      wire62[(1'h1):(1'h1)] : reg70) >>> wire62[(3'h5):(2'h2)]) : reg64);
            end
          else
            begin
              reg72 <= (~&(wire61 || $signed((~|(wire60 ? wire53 : reg72)))));
              reg73 <= $signed((wire62 - reg68));
              reg74 <= wire60;
            end
        end
      if ((~&{reg64[(2'h2):(1'h1)],
          (~|{wire53[(2'h3):(1'h1)], (reg68 >> reg74)})}))
        begin
          if ((~^(^$signed($signed($unsigned(reg67))))))
            begin
              reg75 <= wire56;
              reg76 <= ($signed($unsigned(($signed((8'haf)) ?
                  (|wire59) : reg65))) & {$unsigned($unsigned((reg74 ?
                      reg65 : wire60)))});
            end
          else
            begin
              reg75 <= ($signed(((-$signed(reg68)) != (reg69[(3'h5):(2'h2)] & (wire62 >= reg71)))) == (((8'hb7) * (-reg70)) ?
                  (~&((wire59 ? reg72 : reg70) ? (^wire54) : reg71)) : wire58));
            end
          reg77 <= reg73[(5'h14):(4'hf)];
          reg78 <= ((reg63[(3'h4):(2'h2)] * ((^~$signed(reg74)) ?
                  $signed((wire58 ?
                      wire59 : reg65)) : ({reg72} >= (-wire59)))) ?
              (|reg70) : $unsigned((reg63[(4'hd):(1'h0)] ?
                  (~^(!wire60)) : $unsigned($signed((8'ha9))))));
          reg79 <= reg63[(1'h1):(1'h1)];
          reg80 <= ((~^$signed(($signed(wire53) || (reg66 ?
              reg66 : reg75)))) && (reg67 > $unsigned((((8'hb8) >>> (8'hb9)) ?
              (reg66 ? reg68 : wire58) : reg77))));
        end
      else
        begin
          reg75 <= (~|$signed(reg63[(3'h6):(3'h5)]));
          reg76 <= $unsigned(((((reg77 ? wire58 : reg71) ?
                  reg80 : {reg64}) < (reg72[(2'h2):(1'h0)] ?
                  $unsigned(wire58) : (reg74 ? reg75 : wire59))) ?
              reg77[(3'h5):(3'h4)] : $unsigned(({reg72} - $unsigned(wire62)))));
          reg77 <= (wire59 ^ $unsigned($signed({wire54, $unsigned(reg75)})));
          reg78 <= (+(($signed(((8'ha0) == reg66)) < {$signed(wire58)}) ?
              $unsigned((~(~|wire57))) : wire54[(1'h0):(1'h0)]));
          if ((reg72 ?
              $signed($signed({reg76[(1'h0):(1'h0)],
                  reg67[(3'h5):(3'h4)]})) : $unsigned(reg65[(1'h1):(1'h0)])))
            begin
              reg79 <= reg79[(2'h2):(1'h0)];
              reg80 <= (^~reg76);
            end
          else
            begin
              reg79 <= reg68[(4'hb):(1'h1)];
              reg80 <= (8'hb2);
              reg81 <= $signed(reg70);
              reg82 <= (8'ha0);
              reg83 <= ((!((~^(reg72 >> reg70)) ?
                      (wire57[(2'h2):(1'h0)] || $unsigned((8'h9f))) : (~^(reg71 ?
                          wire53 : reg68)))) ?
                  (wire59[(2'h3):(1'h1)] * wire54[(1'h0):(1'h0)]) : ($signed((reg78[(1'h1):(1'h0)] * $unsigned(reg81))) ?
                      reg64 : (wire62 || reg63)));
            end
        end
      reg84 <= (~($unsigned($unsigned($unsigned(reg73))) ?
          (~(!{(8'hb2)})) : $signed(({reg78, reg81} ?
              wire62[(2'h2):(2'h2)] : $signed(wire54)))));
    end
  assign wire85 = ($signed(reg76) < ($signed({(reg64 ? reg71 : reg64)}) ?
                      ($signed((wire59 ?
                          reg83 : (8'hac))) & {{reg67}}) : $signed(reg63)));
  module86 #() modinst103 (.wire89(wire58), .y(wire102), .clk(clk), .wire88(reg67), .wire87(reg78), .wire90(wire59));
  assign wire104 = {(&$signed((8'ha4))), wire61};
  assign wire105 = (&(reg74[(4'h8):(3'h7)] ?
                       $unsigned(((reg77 && reg70) ?
                           $unsigned(wire62) : (reg81 >= reg73))) : $unsigned({wire53[(3'h6):(1'h1)],
                           {wire104, (8'ha2)}})));
  assign wire106 = $unsigned((reg67[(3'h6):(3'h5)] ?
                       reg71[(1'h0):(1'h0)] : (reg68[(4'he):(3'h5)] >>> $signed((reg70 ?
                           reg82 : reg68)))));
  assign wire107 = $unsigned((8'hab));
  module108 #() modinst131 (.wire111(reg83), .wire113(wire104), .wire109(wire107), .clk(clk), .wire112(wire55), .y(wire130), .wire110(wire106));
  assign wire132 = wire55[(1'h1):(1'h0)];
  assign wire133 = (!$signed({reg72[(2'h2):(2'h2)],
                       $signed($unsigned(reg80))}));
  assign wire134 = (~({reg78[(3'h6):(2'h2)]} || wire55));
endmodule

module module18
#(parameter param27 = {(((((8'h9e) ? (8'hbd) : (8'hb6)) ? {(8'hb4), (8'ha7)} : ((8'ha0) & (8'hb2))) - (+((8'hb2) ? (8'hbf) : (8'hb4)))) ? (~|(+(~^(8'ha8)))) : ((~{(8'hb0)}) * (((8'hb1) ? (8'h9e) : (8'h9e)) ? ((8'hb4) ? (8'hbe) : (7'h42)) : ((8'hb3) | (8'ha8)))))}, 
parameter param28 = (param27 == ({param27} & ((~param27) ~^ ((param27 <= param27) ? param27 : (param27 ? param27 : param27))))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire22;
  input wire signed [(5'h11):(1'h0)] wire21;
  input wire [(4'hc):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  assign y = {wire26, wire25, wire24, reg23, (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= (8'h9c);
    end
  assign wire24 = $unsigned({wire21});
  assign wire25 = ((wire22 | $unsigned($signed((!wire24)))) ?
                      $signed({$signed(wire22)}) : ($signed((wire22[(2'h3):(1'h1)] ?
                          $signed(reg23) : wire20)) && (^wire22[(2'h3):(1'h1)])));
  assign wire26 = (^wire21);
endmodule

module module108  (y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire113;
  input wire [(2'h2):(1'h0)] wire112;
  input wire [(4'h9):(1'h0)] wire111;
  input wire signed [(3'h6):(1'h0)] wire110;
  input wire [(5'h11):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire129;
  wire signed [(5'h12):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(4'h8):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire116;
  wire [(3'h5):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire114;
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire114 = $signed($unsigned($unsigned(wire110)));
  assign wire115 = $signed({$unsigned($signed(wire109))});
  assign wire116 = {$signed($unsigned($unsigned(((8'haf) ^~ wire111)))),
                       ($unsigned(($signed(wire112) ?
                               (~&wire111) : {wire111})) ?
                           (!(8'hbd)) : wire112)};
  assign wire117 = $signed((wire111[(4'h8):(1'h1)] ?
                       wire112[(1'h1):(1'h1)] : $unsigned((wire109 + (^~wire116)))));
  assign wire118 = ($unsigned($unsigned(wire114[(1'h0):(1'h0)])) <= wire111[(3'h6):(3'h6)]);
  assign wire119 = wire109;
  assign wire120 = ((^~wire119[(4'hb):(4'h9)]) & $unsigned($signed($signed(wire114))));
  assign wire121 = wire112[(1'h0):(1'h0)];
  assign wire122 = ((~|{(~^$unsigned(wire115))}) ?
                       (|(8'hb7)) : ((!(-(+(8'hae)))) ?
                           (~^wire111[(1'h1):(1'h0)]) : $unsigned(wire116)));
  assign wire123 = ((^~(((&wire110) ? wire121 : (wire122 == wire117)) ?
                           wire121[(3'h5):(2'h2)] : ((wire117 < wire111) ?
                               wire112[(1'h0):(1'h0)] : (~&wire122)))) ?
                       (^~wire118[(3'h4):(1'h0)]) : wire109[(3'h5):(2'h3)]);
  assign wire124 = (&wire116);
  assign wire125 = ((~^$signed(((|wire118) ?
                       wire124 : $unsigned(wire109)))) != {$signed(wire119[(4'h8):(3'h7)])});
  always
    @(posedge clk) begin
      reg126 <= (&(+(^~{$unsigned(wire122)})));
      reg127 <= wire112;
    end
  assign wire128 = $unsigned(wire109[(3'h7):(1'h1)]);
  assign wire129 = (|(($unsigned(wire120) || (&wire124[(2'h3):(2'h2)])) < $signed($signed($unsigned((8'had))))));
endmodule

module module86  (y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire90;
  input wire [(4'hd):(1'h0)] wire89;
  input wire signed [(4'hb):(1'h0)] wire88;
  input wire signed [(5'h14):(1'h0)] wire87;
  wire signed [(3'h6):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  assign y = {wire101,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire91 = wire87[(5'h13):(5'h13)];
  assign wire92 = ({$signed($signed(wire90[(4'h9):(1'h1)])),
                      ({wire90} ?
                          wire87 : wire88)} == ((&(wire87[(4'hf):(1'h1)] == (8'hb4))) - (8'haf)));
  assign wire93 = $unsigned($signed($unsigned(wire88[(3'h5):(2'h3)])));
  assign wire94 = (&$unsigned({((wire87 <= (8'ha1)) >> wire89),
                      $signed((7'h41))}));
  assign wire95 = (&wire91[(1'h0):(1'h0)]);
  assign wire96 = $unsigned(wire88[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ((&($signed(wire91[(2'h2):(1'h1)]) ?
          (|(wire89[(2'h3):(2'h2)] ? (~wire91) : $signed(wire89))) : wire96)))
        begin
          reg97 <= (((~|wire94[(1'h1):(1'h1)]) >>> $signed(wire96[(1'h1):(1'h0)])) >= ($signed((+(~|wire90))) << (((8'h9c) ?
                  (wire92 * wire92) : $signed(wire91)) ?
              {(wire87 ?
                      wire89 : wire89)} : $unsigned(wire92[(4'h8):(3'h7)]))));
        end
      else
        begin
          reg97 <= wire88;
          reg98 <= wire87[(5'h10):(4'ha)];
        end
      reg99 <= (($signed(($unsigned(wire91) == $unsigned(wire94))) ?
          (^~$signed($signed(wire87))) : wire91[(1'h0):(1'h0)]) ~^ ({((reg97 & wire95) ?
                  $unsigned(wire95) : $unsigned(wire96)),
              reg98} ?
          $signed($signed($unsigned(reg98))) : wire88));
      reg100 <= (8'ha2);
    end
  assign wire101 = wire96;
endmodule
