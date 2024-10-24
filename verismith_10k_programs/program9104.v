module top #(parameter param99 = (8'ha5)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire96;
  assign y = {wire98, wire4, wire5, wire96, (1'h0)};
  assign wire4 = (^(~$unsigned(wire3[(4'hb):(2'h3)])));
  assign wire5 = $signed($unsigned({wire2}));
  module6 #() modinst97 (.clk(clk), .wire11(wire4), .wire9(wire3), .wire7(wire5), .y(wire96), .wire10(wire2), .wire8(wire1));
  assign wire98 = (~($signed({(&wire0)}) || $signed((~^(wire5 ?
                      wire1 : wire2)))));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(3'h5):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire62;
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire89,
                 wire12,
                 wire13,
                 wire62,
                 reg91,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire12 = $signed((~&($unsigned($unsigned(wire7)) ~^ $signed((wire10 ?
                      wire11 : wire11)))));
  assign wire13 = wire12[(4'ha):(1'h0)];
  always
    @(posedge clk) begin
      if (($unsigned((({wire13, wire11} >= ((8'hb0) ?
              wire8 : wire7)) >>> wire10[(3'h5):(1'h0)])) ?
          $unsigned((wire11[(1'h1):(1'h1)] ?
              $unsigned($signed((8'hac))) : wire9)) : wire8[(3'h6):(1'h1)]))
        begin
          reg14 <= $unsigned(((^~((wire7 | wire12) ?
                  wire8[(3'h4):(2'h2)] : $unsigned(wire9))) ?
              wire8 : wire11));
          if ($unsigned($unsigned(wire12[(4'hf):(1'h1)])))
            begin
              reg15 <= $signed(wire8[(3'h7):(1'h0)]);
              reg16 <= (reg14[(1'h1):(1'h0)] == (wire8 ^~ (&$unsigned({wire13,
                  wire12}))));
              reg17 <= ((8'hbe) && ({($unsigned(wire8) <<< reg15),
                      (~^(|(7'h41)))} ?
                  wire12 : {wire9[(4'hb):(3'h5)],
                      (((8'ha1) ? (8'hab) : wire10) ?
                          (&wire11) : (wire10 ? wire9 : wire11))}));
              reg18 <= ((^$unsigned(((wire10 || reg14) << (-wire13)))) | $unsigned($signed(reg16[(2'h3):(1'h0)])));
              reg19 <= {(reg17 * {($unsigned(wire12) ?
                          $unsigned((7'h44)) : (wire9 ? wire10 : reg14)),
                      reg15[(1'h1):(1'h0)]}),
                  wire12[(4'hd):(4'ha)]};
            end
          else
            begin
              reg15 <= ({wire10[(1'h1):(1'h0)]} ?
                  reg19[(1'h0):(1'h0)] : wire12);
              reg16 <= reg18[(3'h7):(3'h4)];
              reg17 <= $signed((+wire12[(5'h10):(5'h10)]));
              reg18 <= (~|wire13[(2'h2):(1'h0)]);
              reg19 <= $signed(((reg14 ?
                  wire12 : ($signed(wire9) ?
                      $unsigned(wire8) : $unsigned(reg14))) <<< ((+$unsigned(reg19)) < (-$signed(reg18)))));
            end
        end
      else
        begin
          reg14 <= ($signed(($signed($signed(wire11)) ?
                  {wire10} : (wire8 | {wire8}))) ?
              (+(reg18[(1'h1):(1'h0)] ?
                  (^~((7'h42) != reg19)) : (8'had))) : reg15);
          reg15 <= reg17[(1'h0):(1'h0)];
          if (reg17)
            begin
              reg16 <= ($signed(wire11[(3'h7):(1'h1)]) ?
                  (^((7'h42) ?
                      reg16[(3'h4):(1'h0)] : (8'hba))) : $unsigned(wire12[(5'h12):(2'h2)]));
              reg17 <= (~((~&(+((8'hb6) || wire7))) >= (((wire11 ?
                      reg18 : reg15) ?
                  (^~wire9) : $unsigned(reg16)) << $unsigned((wire13 & reg14)))));
              reg18 <= reg16[(2'h3):(2'h2)];
            end
          else
            begin
              reg16 <= ((($unsigned((^~wire10)) && $unsigned(wire13)) < reg15) << $unsigned(($unsigned($unsigned(reg17)) != $signed($unsigned(reg19)))));
              reg17 <= $signed({(8'hae)});
              reg18 <= reg16;
              reg19 <= wire8[(4'ha):(3'h5)];
            end
        end
      reg20 <= ((reg17 || $unsigned(wire11[(3'h4):(2'h2)])) ~^ (~&$unsigned((|(wire8 ?
          wire8 : wire7)))));
      reg21 <= ((wire12[(5'h13):(1'h0)] ?
              (((^(8'hac)) ?
                  $signed((8'ha5)) : wire9[(4'hc):(3'h4)]) * reg14) : wire12[(1'h0):(1'h0)]) ?
          ($signed({wire11}) ?
              (^~reg19[(1'h1):(1'h1)]) : ($unsigned((wire11 == wire12)) <= $signed(wire7[(3'h5):(3'h5)]))) : {(~&$unsigned($signed(reg19)))});
    end
  module22 #() modinst63 (wire62, clk, wire10, reg14, reg18, reg16, reg15);
  always
    @(posedge clk) begin
      reg64 <= reg17;
      reg65 <= wire62[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg66 <= wire7[(4'he):(4'hb)];
      reg67 <= $signed($unsigned($unsigned((!reg18[(1'h0):(1'h0)]))));
    end
  module68 #() modinst90 (wire89, clk, wire62, wire8, reg15, reg20);
  always
    @(posedge clk) begin
      reg91 <= ($unsigned(wire10[(3'h4):(2'h3)]) >= ((reg21 != ((8'h9c) ?
              wire62[(4'hf):(4'ha)] : (reg17 ? wire12 : reg64))) ?
          wire7 : $signed({(reg21 <= reg16), wire13})));
    end
  assign wire92 = (-(~|$unsigned((8'ha5))));
  assign wire93 = ((~|(&$signed({(7'h42)}))) >> $signed($signed(reg65[(3'h4):(2'h3)])));
  assign wire94 = $unsigned((8'ha4));
  assign wire95 = $signed((reg67[(3'h5):(3'h5)] ?
                      $signed($signed(((8'hb6) <= reg64))) : $unsigned(((-reg19) ?
                          (^~wire10) : wire93[(3'h5):(1'h1)]))));
endmodule

module module68  (y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire72;
  input wire signed [(4'ha):(1'h0)] wire71;
  input wire signed [(4'h9):(1'h0)] wire70;
  input wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 (1'h0)};
  assign wire73 = $signed(wire70);
  assign wire74 = (&wire72);
  assign wire75 = (~(8'ha8));
  assign wire76 = wire70;
  assign wire77 = (-(^~wire71));
  assign wire78 = ({wire75, ($unsigned(wire70) - wire75)} ?
                      wire77[(5'h12):(5'h10)] : (((~$signed(wire72)) <= ($signed(wire69) ?
                              wire69 : wire75[(1'h0):(1'h0)])) ?
                          (&$unsigned((wire69 ?
                              wire77 : (8'had)))) : (wire69 >> $signed(wire71[(3'h5):(1'h1)]))));
  assign wire79 = wire78[(1'h0):(1'h0)];
  assign wire80 = wire74[(5'h12):(4'h9)];
  assign wire81 = ((~^wire80) >>> wire73);
  assign wire82 = {wire72};
  assign wire83 = {($signed(wire77) ~^ wire71)};
  assign wire84 = (+((~({(8'hb1)} > (wire81 * wire77))) == wire77));
  assign wire85 = ({wire75, {$unsigned({(8'haf), wire82})}} ?
                      (wire80 ?
                          $unsigned($signed($unsigned((8'hb6)))) : (({wire71,
                              wire69} < (-wire79)) >= (8'hbd))) : $unsigned(($signed({wire80,
                              wire71}) ?
                          (wire71 > wire69[(2'h3):(1'h0)]) : ((wire82 ?
                                  (8'hbe) : wire77) ?
                              (~&wire82) : $unsigned(wire76)))));
  assign wire86 = $signed({wire69[(2'h3):(1'h1)]});
  assign wire87 = (wire86 + (($unsigned(wire70[(1'h0):(1'h0)]) > ($unsigned(wire74) ?
                          (wire80 ? wire73 : wire76) : wire77)) ?
                      ($signed($unsigned(wire82)) == ($unsigned((8'ha3)) ?
                          wire71[(1'h1):(1'h0)] : ((8'ha0) == wire75))) : $unsigned($unsigned((wire80 | (8'had))))));
  assign wire88 = {((&($unsigned((8'ha7)) ?
                          $signed(wire70) : $signed(wire84))) ^ ($unsigned(wire78) || {$signed(wire76),
                          (wire83 ? (8'hb6) : wire70)})),
                      $signed(($unsigned($signed(wire75)) >= wire81))};
endmodule

module module22
#(parameter param60 = {(|(((!(8'hb5)) ? ((8'hbc) ? (8'hbb) : (8'haa)) : ((8'hbf) ? (8'ha1) : (8'hb1))) ? ({(8'hb3)} ? (&(8'ha5)) : {(8'h9f)}) : ((&(8'hb4)) >>> (|(8'hba))))), ((({(8'hb1), (8'h9c)} ? ((8'hb2) ? (8'ha0) : (8'haa)) : ((8'hb0) ? (8'hbd) : (7'h42))) & (((8'ha4) < (7'h42)) ? (~&(8'ha8)) : (&(8'hb3)))) ? ((((8'hb0) | (8'hbb)) ? ((8'h9c) ? (8'h9f) : (8'ha3)) : {(8'h9d), (8'ha9)}) ? ((~|(7'h44)) ? (-(8'ha0)) : (|(8'hbc))) : ((~|(8'ha0)) ? ((8'ha6) ? (8'h9d) : (7'h43)) : ((8'hb2) ^ (7'h43)))) : {(8'hbf), {((8'hb0) != (8'hb2))}})}, 
parameter param61 = (!((!param60) ? (^~((param60 ? param60 : param60) ~^ {param60, param60})) : (param60 << ((~&param60) ? (^~param60) : (param60 ? param60 : param60))))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire27;
  input wire signed [(3'h5):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
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
                 reg42,
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
                 (1'h0)};
  assign wire28 = {(((((7'h42) ?
                              (8'hbb) : wire23) != wire26[(2'h3):(2'h2)]) ^~ (~(^wire23))) ?
                          wire27 : $signed(($signed(wire25) ?
                              {(8'ha0)} : wire25[(2'h2):(1'h0)]))),
                      wire25};
  assign wire29 = $signed({wire26[(1'h1):(1'h1)], (+wire24[(1'h0):(1'h0)])});
  assign wire30 = $unsigned(($unsigned($unsigned((wire29 ? wire24 : wire24))) ?
                      $unsigned(wire23) : {($unsigned(wire29) ?
                              (|wire24) : {wire24})}));
  assign wire31 = (^wire23);
  always
    @(posedge clk) begin
      reg32 <= (($signed(wire25[(5'h13):(5'h13)]) * (+$signed($unsigned(wire26)))) != (+wire29[(3'h6):(1'h0)]));
      reg33 <= ((~^wire26) + wire23);
      if (({((wire29 ? (wire31 ? wire24 : wire27) : $unsigned(wire29)) ?
              wire30[(2'h3):(1'h1)] : $unsigned(wire27)),
          wire29[(1'h0):(1'h0)]} <= ($signed((8'had)) ?
          $signed(($signed(wire27) ^ $unsigned(wire25))) : $unsigned($unsigned((wire28 ?
              wire26 : (8'h9d)))))))
        begin
          reg34 <= reg32;
          reg35 <= wire31;
          reg36 <= (~&wire28[(3'h5):(3'h4)]);
        end
      else
        begin
          reg34 <= wire30[(4'hd):(3'h5)];
        end
      reg37 <= reg33;
      reg38 <= $unsigned((^~(~^$unsigned((-wire24)))));
    end
  always
    @(posedge clk) begin
      if (((wire28[(3'h4):(1'h0)] ?
          (reg38 ?
              $unsigned(wire27[(4'h8):(2'h3)]) : reg35) : wire28[(4'hb):(1'h0)]) || wire31[(1'h0):(1'h0)]))
        begin
          reg39 <= (reg34 ?
              reg37[(3'h7):(2'h2)] : $signed((($signed(wire31) ?
                      $unsigned(wire31) : (&reg38)) ?
                  {{wire24}} : {reg37, reg33[(5'h14):(3'h7)]})));
          reg40 <= ((reg37 ? wire28 : (~^(+$signed((8'hbd))))) ?
              (8'ha2) : $signed($signed($unsigned(reg32[(1'h0):(1'h0)]))));
          reg41 <= (($signed((&(+wire30))) ?
                  $signed(wire31[(1'h1):(1'h0)]) : $signed({$signed(wire30)})) ?
              $unsigned(wire24) : $unsigned((wire25[(4'ha):(3'h7)] >>> reg35)));
          reg42 <= reg32;
        end
      else
        begin
          reg39 <= $unsigned(((+reg35) <<< reg36[(4'h8):(2'h2)]));
          if ($signed((reg33[(5'h15):(4'h9)] ^~ $unsigned((~$unsigned(wire31))))))
            begin
              reg40 <= {reg38[(4'hc):(3'h5)],
                  ($unsigned(((-wire28) ?
                          $unsigned(reg38) : (wire23 ? reg35 : wire30))) ?
                      {((reg41 ?
                              reg42 : reg39) ^~ $signed(wire25))} : wire25[(4'h8):(3'h7)])};
              reg41 <= (((8'hbd) ?
                      wire24 : ({reg35[(3'h4):(1'h1)]} >>> reg34[(5'h10):(2'h3)])) ?
                  {($unsigned((^reg36)) ?
                          $unsigned({reg39, reg41}) : ((wire24 + wire23) ?
                              (-reg39) : (wire29 ? wire27 : reg35))),
                      reg40[(4'h8):(3'h7)]} : (((!(-reg37)) ?
                          reg32[(3'h5):(2'h3)] : (!(^wire25))) ?
                      $unsigned(((-(8'hb2)) ?
                          $signed(wire24) : {reg36})) : (({reg33} ?
                              {(8'ha4), wire26} : $unsigned((8'hbb))) ?
                          wire31 : ($unsigned(wire26) << $unsigned(reg32)))));
              reg42 <= reg42;
              reg43 <= wire31[(3'h4):(2'h2)];
            end
          else
            begin
              reg40 <= wire24;
              reg41 <= {reg39};
            end
          reg44 <= ((reg33[(5'h15):(4'h9)] ?
              $unsigned(($signed(wire26) ?
                  ((8'hab) ?
                      wire23 : reg36) : wire26[(3'h5):(2'h3)])) : (reg41 == ((reg32 < wire28) ~^ (7'h44)))) ^ (!reg43[(4'h8):(3'h6)]));
        end
      reg45 <= ((-reg32) >> reg41);
      reg46 <= (reg38[(4'he):(4'hc)] ? wire23 : wire26[(1'h1):(1'h0)]);
      if ($signed($signed($unsigned(((reg36 ?
          reg38 : (8'hac)) >>> wire25[(4'hb):(4'h9)])))))
        begin
          reg47 <= (wire23[(3'h4):(3'h4)] & (+$unsigned(((wire23 || (8'ha2)) ?
              wire28 : (wire27 ? wire30 : (8'hb3))))));
          if ((&reg37[(3'h5):(1'h1)]))
            begin
              reg48 <= {reg46[(1'h1):(1'h1)]};
              reg49 <= (((&$signed((8'h9e))) ?
                      $unsigned(reg43[(3'h5):(1'h1)]) : (|$signed($unsigned(reg40)))) ?
                  $signed((~&{{reg44}})) : reg39);
              reg50 <= wire29[(3'h5):(3'h4)];
            end
          else
            begin
              reg48 <= {(reg46 < (~|reg42[(4'ha):(2'h2)]))};
              reg49 <= {((-($signed((7'h40)) - reg49[(2'h3):(2'h3)])) ?
                      reg43 : ((reg38[(4'h8):(4'h8)] ?
                          $signed((7'h41)) : $unsigned(reg37)) <<< {$signed(reg33)})),
                  $unsigned({(!$signed(wire24)), $signed({reg38})})};
              reg50 <= $signed(reg32);
              reg51 <= $signed(wire23[(2'h2):(1'h1)]);
            end
          reg52 <= $unsigned({{((reg45 ? reg44 : (8'h9f)) ?
                      (wire25 ? reg35 : (8'ha2)) : $signed(reg38))}});
          if ((((~^(reg43[(2'h3):(2'h3)] >> (wire28 ^~ reg38))) || reg35[(3'h5):(3'h5)]) != reg52))
            begin
              reg53 <= reg37[(1'h1):(1'h1)];
              reg54 <= (^((8'hb0) ? {$signed(reg48), (8'hab)} : reg47));
            end
          else
            begin
              reg53 <= (^~reg38[(5'h10):(3'h6)]);
              reg54 <= (|$unsigned(($signed({reg46}) ?
                  (reg47 ~^ (reg52 < wire28)) : {(~reg53)})));
            end
        end
      else
        begin
          if ($signed(reg36))
            begin
              reg47 <= $signed(reg48);
              reg48 <= (($signed(reg49[(1'h0):(1'h0)]) ?
                      (7'h44) : (~^{(reg39 | reg52)})) ?
                  reg52 : $signed({((reg51 > reg41) ?
                          reg39 : (wire25 <<< wire24)),
                      wire23[(1'h1):(1'h0)]}));
            end
          else
            begin
              reg47 <= (^~reg36);
              reg48 <= $signed($unsigned($signed(wire27)));
              reg49 <= reg32;
            end
          reg50 <= {reg44};
          if ($unsigned(wire27))
            begin
              reg51 <= reg41;
              reg52 <= $signed((reg35 * (&(reg37[(3'h7):(3'h4)] * $signed(reg37)))));
              reg53 <= $signed($unsigned(reg35));
              reg54 <= ((reg34 ? reg49[(2'h2):(1'h0)] : $unsigned((8'ha9))) ?
                  reg46 : $signed($signed(wire24[(1'h1):(1'h1)])));
              reg55 <= $unsigned($signed(($unsigned({wire27,
                  wire31}) >> {((8'hbe) ? (8'ha0) : reg33)})));
            end
          else
            begin
              reg51 <= (reg42 ?
                  {{$signed((wire23 >= reg46)), $unsigned({reg51})},
                      {reg45, (&reg55[(2'h3):(2'h3)])}} : $signed(reg45));
              reg52 <= (reg32 ?
                  $unsigned((8'hb0)) : $unsigned({($unsigned(reg50) <= (reg41 ?
                          wire23 : reg39)),
                      (~^reg47)}));
              reg53 <= $signed((reg55 <<< (((+reg52) ?
                      wire30[(4'he):(4'h8)] : $signed((8'hba))) ?
                  (reg34 ? (8'hb9) : (^~wire24)) : (!wire27[(3'h7):(3'h7)]))));
            end
        end
      reg56 <= (reg46 ?
          $signed({$signed(reg52[(3'h4):(1'h0)])}) : wire23[(1'h1):(1'h1)]);
    end
  assign wire57 = $unsigned($unsigned((&wire23[(3'h4):(2'h3)])));
  assign wire58 = (+$signed(($unsigned($signed(wire57)) ?
                      $signed((reg42 ? reg47 : (8'ha0))) : (-reg42))));
  assign wire59 = (|reg41[(3'h5):(3'h4)]);
endmodule
