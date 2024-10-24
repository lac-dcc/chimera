module top
#(parameter param114 = ((~|{{(8'hb0)}}) ? (~^{{((7'h41) >= (8'hab)), ((8'hb7) ? (8'hb9) : (8'ha6))}, (((8'hb8) ? (8'hb8) : (8'hae)) <= (!(8'ha2)))}) : ({(|((8'hb6) || (8'hb3)))} >>> (8'hbf))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire37;
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire98,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 (1'h0)};
  module5 #() modinst38 (wire37, clk, wire0, wire3, wire1, wire4);
  assign wire39 = wire0[(3'h6):(3'h6)];
  assign wire40 = (wire39[(4'ha):(2'h2)] ?
                      wire1[(4'he):(3'h7)] : {({(!wire3)} ?
                              $unsigned(wire4[(2'h2):(1'h1)]) : wire37[(1'h0):(1'h0)]),
                          $unsigned((~^(wire1 ? wire37 : wire1)))});
  assign wire41 = ((wire4 & ($signed(wire2[(4'hd):(2'h3)]) == (~&wire37))) ?
                      (8'hba) : wire1[(5'h11):(4'h9)]);
  always
    @(posedge clk) begin
      reg42 <= $unsigned({wire39});
      if ($signed(((((|wire40) ? (wire37 < (8'hab)) : $unsigned(wire4)) ?
              ((wire40 - (8'hb0)) > wire40) : (-$signed(wire1))) ?
          $signed(wire40) : (8'hb6))))
        begin
          reg43 <= ({$signed($unsigned(wire4))} < ($signed($signed((~|(8'hb5)))) | {(!wire0)}));
        end
      else
        begin
          reg43 <= (~&$signed($signed(wire39[(4'ha):(4'ha)])));
          reg44 <= $signed((8'hbb));
          if ($signed(($signed((wire2[(4'h9):(3'h7)] ?
              (&(8'hb8)) : {wire1, wire0})) ~^ (reg42[(2'h2):(2'h2)] ?
              ((~&(8'haf)) * reg44[(4'h9):(4'h9)]) : wire41))))
            begin
              reg45 <= {{$signed($unsigned(wire41[(1'h1):(1'h1)]))}};
              reg46 <= $unsigned((-($unsigned($signed(wire2)) ?
                  wire2[(2'h2):(2'h2)] : wire0)));
              reg47 <= (reg42[(3'h5):(1'h0)] ?
                  (wire4[(2'h3):(1'h1)] < wire39[(1'h0):(1'h0)]) : wire40);
            end
          else
            begin
              reg45 <= (((+(8'hae)) ?
                      $signed((wire3 != reg46)) : ((wire3 ?
                          (reg47 ?
                              reg44 : wire40) : reg44) <<< (^~(reg44 >= (8'hae))))) ?
                  (wire0[(1'h0):(1'h0)] <= (~&wire40[(2'h3):(2'h3)])) : $signed((8'h9c)));
              reg46 <= {$unsigned($unsigned({(wire4 >>> wire0)})), reg44};
              reg47 <= (wire2 ?
                  (($unsigned($unsigned(wire3)) ?
                          $unsigned((wire3 ? wire2 : reg46)) : ((!wire39) ?
                              (~&wire3) : wire37[(1'h1):(1'h0)])) ?
                      (!reg43[(2'h3):(1'h1)]) : wire2) : wire41[(1'h1):(1'h1)]);
            end
        end
    end
  module48 #() modinst99 (.wire53(wire4), .wire49(reg43), .wire52(wire40), .wire51(wire0), .wire50(wire37), .y(wire98), .clk(clk));
  assign wire100 = $signed({$signed({$signed(reg47), reg42}),
                       reg42[(1'h0):(1'h0)]});
  assign wire101 = (^~((wire2 ?
                           $signed($signed(wire3)) : wire40[(4'h8):(3'h5)]) ?
                       wire0 : ($unsigned((!wire1)) >> (wire41[(1'h1):(1'h0)] ^~ (~&(8'hb6))))));
  assign wire102 = $signed((((8'h9d) <= ((^~(8'h9f)) ?
                           (wire1 > wire40) : $signed(reg47))) ?
                       $unsigned(({wire39, wire3} ?
                           $signed(reg42) : {wire4,
                               reg47})) : $signed(wire3[(2'h3):(1'h0)])));
  assign wire103 = reg46[(3'h5):(1'h1)];
  assign wire104 = (!{reg43});
  assign wire105 = $unsigned(wire102[(3'h6):(2'h2)]);
  assign wire106 = ((~^(+(~|(|wire103)))) ?
                       reg43[(3'h7):(2'h2)] : wire1[(5'h12):(4'ha)]);
  always
    @(posedge clk) begin
      reg107 <= $unsigned(wire0[(2'h3):(2'h3)]);
      if (reg43[(3'h7):(2'h3)])
        begin
          reg108 <= wire1;
          reg109 <= wire104[(3'h5):(1'h0)];
          reg110 <= (^wire40[(4'h9):(3'h4)]);
          if ((reg109 | wire102))
            begin
              reg111 <= (~&(!(wire101 * reg109[(1'h0):(1'h0)])));
              reg112 <= ($signed((wire3[(3'h7):(3'h4)] && reg42)) ^ $signed($signed(($signed(wire40) | (8'haf)))));
              reg113 <= $unsigned((wire3[(1'h0):(1'h0)] >= (^~({reg46} >> wire2[(5'h10):(4'h9)]))));
            end
          else
            begin
              reg111 <= $unsigned(reg43);
            end
        end
      else
        begin
          reg108 <= $signed($unsigned((~^((~|wire37) >> $unsigned(wire103)))));
          reg109 <= (($unsigned((8'h9d)) ?
                  {reg110[(4'h9):(4'h8)],
                      ((~wire2) >>> {wire40,
                          (8'hbf)})} : (^~(~$unsigned(wire39)))) ?
              ($unsigned((~^(&wire0))) != ({(wire40 ?
                      wire3 : wire105)} || $unsigned(wire100))) : wire39[(2'h3):(2'h2)]);
          reg110 <= $unsigned(reg46[(4'hb):(4'hb)]);
        end
    end
endmodule

module module48
#(parameter param96 = {(((((7'h40) ? (7'h41) : (8'hb1)) ? ((8'haf) ? (8'hb8) : (8'haa)) : (^~(8'hb8))) - {{(8'hb5)}, (-(8'hb8))}) ? {(^((8'hb3) - (8'hb6))), (((8'ha4) ~^ (8'ha4)) & ((8'ha9) ? (8'hb4) : (8'ha4)))} : (({(8'hbf)} ? ((8'ha0) ? (8'h9f) : (8'ha2)) : {(8'ha7)}) & ((8'h9f) << ((8'ha2) == (7'h40)))))}, 
parameter param97 = ((~^((param96 ? (param96 ? param96 : param96) : (~param96)) ? ((~^(8'ha2)) ? param96 : (|param96)) : (&(param96 | param96)))) ^ {{((param96 > param96) ? param96 : (param96 ? param96 : param96))}}))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire53;
  input wire [(4'ha):(1'h0)] wire52;
  input wire signed [(5'h13):(1'h0)] wire51;
  input wire [(4'hf):(1'h0)] wire50;
  input wire signed [(4'h9):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  assign y = {wire94,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire61,
                 wire60,
                 wire55,
                 wire54,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg62,
                 reg63,
                 (1'h0)};
  assign wire54 = $signed(wire50);
  assign wire55 = wire49;
  always
    @(posedge clk) begin
      if ($signed(wire51))
        begin
          reg56 <= wire49;
        end
      else
        begin
          reg56 <= wire53[(4'h9):(3'h5)];
          reg57 <= wire52[(4'ha):(4'h8)];
          reg58 <= wire49[(1'h1):(1'h1)];
          reg59 <= (wire49 >= {((+reg57[(2'h3):(2'h3)]) * wire54[(3'h4):(2'h2)]),
              $unsigned(reg58)});
        end
    end
  assign wire60 = $unsigned($signed(reg58[(4'h8):(1'h1)]));
  assign wire61 = $signed($unsigned($signed($signed(reg56))));
  always
    @(posedge clk) begin
      reg62 <= wire55;
      reg63 <= $signed((wire51 ? wire49 : {{wire53[(1'h1):(1'h1)]}, reg56}));
    end
  assign wire64 = $unsigned(((reg57 == $unsigned($signed(reg59))) ?
                      $signed((^~{reg56})) : reg62));
  assign wire65 = wire52;
  assign wire66 = ((reg63 ?
                      {wire53[(4'h8):(3'h6)],
                          wire60} : $signed(wire55)) || ({(reg58[(3'h4):(1'h0)] <= reg63[(2'h3):(2'h2)]),
                          $unsigned((reg56 * (8'hb1)))} ?
                      (((-reg57) ~^ reg63) ?
                          $unsigned((reg63 | wire60)) : reg56) : $signed(wire52)));
  assign wire67 = ($unsigned(({(8'had), (reg58 * wire50)} ?
                          (^~wire66[(2'h2):(1'h1)]) : ((reg57 ?
                                  (8'hbc) : reg56) ?
                              wire54 : ((7'h44) != reg57)))) ?
                      wire51[(3'h4):(1'h1)] : {($signed(wire61) == (~^$unsigned((8'h9f)))),
                          (($unsigned((8'hbe)) ? $unsigned((8'ha5)) : (8'ha8)) ?
                              ((~&wire49) ?
                                  (wire65 ?
                                      wire55 : (8'ha3)) : reg56[(1'h1):(1'h1)]) : wire54[(4'he):(3'h4)])});
  assign wire68 = (~wire61[(4'h8):(2'h2)]);
  assign wire69 = wire49[(3'h5):(1'h0)];
  assign wire70 = wire53[(2'h2):(1'h1)];
  assign wire71 = $signed($unsigned((&$unsigned(reg58))));
  assign wire72 = {{$unsigned((-(wire52 ? reg58 : reg63)))}, wire66};
  module73 #() modinst95 (wire94, clk, wire54, wire61, reg57, wire71, wire60);
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 reg25,
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
                 (1'h0)};
  assign wire10 = (~&$unsigned(wire7[(4'h8):(1'h1)]));
  assign wire11 = (!$signed((~((wire6 ? wire6 : wire7) >>> $signed(wire8)))));
  assign wire12 = (wire11[(4'hc):(3'h6)] ?
                      $unsigned($signed(wire8)) : wire11[(4'h8):(1'h0)]);
  assign wire13 = (~&wire12);
  assign wire14 = wire9;
  always
    @(posedge clk) begin
      reg15 <= $signed((8'h9e));
      reg16 <= ((wire14 ^~ (wire14 ?
          $signed((~|wire7)) : $signed({wire13,
              (8'hb3)}))) >> ((^wire11[(1'h0):(1'h0)]) ?
          ($unsigned((wire10 << wire6)) != $signed($unsigned(wire12))) : $signed((~wire9))));
      reg17 <= wire9;
      if ($signed(reg16))
        begin
          reg18 <= $unsigned({reg17,
              $signed($unsigned((wire10 ? reg17 : wire12)))});
          reg19 <= (wire6[(3'h5):(2'h2)] ?
              ($signed((7'h41)) ?
                  wire13 : $signed(((8'had) ?
                      (wire10 ?
                          reg17 : (8'hac)) : $signed((8'ha9))))) : (reg18[(4'hf):(4'hf)] + (8'h9d)));
          if ((~^((({(8'ha1)} ? reg18[(4'hc):(2'h3)] : {wire7, reg15}) ?
                  (reg19[(3'h5):(3'h5)] ?
                      (~reg18) : (wire13 ?
                          (7'h41) : (8'h9d))) : $unsigned((reg18 <= wire10))) ?
              (($signed(wire9) ? $unsigned(reg16) : $signed(wire14)) ?
                  (8'hbb) : ($unsigned((8'ha4)) >> {wire9})) : (($signed(wire9) | wire10) & (wire9 <= wire14[(3'h6):(1'h1)])))))
            begin
              reg20 <= ($signed($signed($signed((wire10 >= reg15)))) << ((^~wire11) ?
                  $signed((^~(wire11 & reg19))) : wire6));
              reg21 <= ((((wire7 * $signed(wire11)) ?
                  {$signed(wire11)} : reg20[(4'h9):(3'h5)]) >>> wire13[(1'h1):(1'h1)]) + {{($unsigned(wire13) && (~^reg19)),
                      (&reg20[(4'hb):(4'ha)])},
                  ({{reg17, (8'hb4)}} ? wire10[(3'h5):(3'h4)] : (8'h9d))});
            end
          else
            begin
              reg20 <= $signed($unsigned(($unsigned((+wire12)) | $signed({wire11}))));
              reg21 <= wire7;
            end
        end
      else
        begin
          reg18 <= $signed((^~$unsigned((~&$unsigned(wire8)))));
          reg19 <= wire13[(2'h2):(1'h1)];
          if (wire11[(4'hb):(3'h7)])
            begin
              reg20 <= wire14[(1'h1):(1'h1)];
              reg21 <= $signed(((~&(~&((8'h9e) & (8'hb9)))) >> (!(!(&reg20)))));
              reg22 <= wire13[(2'h2):(1'h0)];
              reg23 <= (wire7[(3'h7):(3'h6)] ?
                  (&((!{reg21}) ?
                      {$unsigned((8'hb7))} : $signed(reg15))) : ((reg15 ?
                      (+$unsigned(reg19)) : (^~$signed(reg19))) == reg22[(2'h2):(2'h2)]));
              reg24 <= $signed({(~^reg21[(4'h9):(3'h5)]),
                  (((reg22 ~^ (8'hb2)) == $signed((8'hac))) ?
                      reg15 : {$unsigned(reg22)})});
            end
          else
            begin
              reg20 <= $signed({reg20,
                  (~&(wire11[(4'ha):(3'h5)] <= (reg19 ? reg15 : wire9)))});
              reg21 <= reg19[(2'h3):(1'h1)];
              reg22 <= (!($unsigned(reg18[(4'he):(4'hd)]) ^~ reg19));
            end
          reg25 <= {({{wire13[(2'h3):(1'h1)]}} ?
                  $unsigned((&reg15[(2'h3):(1'h1)])) : ($signed($signed(wire7)) ?
                      (8'hbb) : wire6))};
          reg26 <= (~|reg24);
        end
      reg27 <= {$signed(reg23[(3'h4):(1'h1)]), $signed(reg17)};
    end
  always
    @(posedge clk) begin
      reg28 <= (reg25 ?
          (|$signed(reg21[(3'h6):(1'h0)])) : ((+((~|wire11) | $unsigned(wire9))) <= ((^(reg26 ?
              reg21 : reg27)) != (^~(wire10 <<< reg18)))));
      if ((|{$unsigned(($signed(reg23) && {(8'hbd)}))}))
        begin
          reg29 <= (((wire7 ?
                      $unsigned($signed((8'hbb))) : reg16[(1'h0):(1'h0)]) ?
                  ({$signed(reg28)} ?
                      $unsigned((7'h43)) : $signed(((8'hbf) * wire8))) : $unsigned(wire14)) ?
              $signed($unsigned($signed((^wire12)))) : $signed($unsigned((~^$unsigned(reg17)))));
          reg30 <= ((reg27 ?
              $unsigned($unsigned(wire10)) : (~|reg15)) != (-(|wire12)));
          reg31 <= $unsigned($unsigned(wire7[(4'h8):(3'h6)]));
          reg32 <= $signed((8'hb3));
        end
      else
        begin
          reg29 <= wire11;
          reg30 <= (~&((~|reg28[(4'hb):(1'h0)]) * (wire14[(1'h1):(1'h1)] ?
              wire14[(3'h6):(1'h1)] : $signed(reg24))));
          if ($signed($unsigned($unsigned(reg17))))
            begin
              reg31 <= $unsigned((&($unsigned((reg31 ^ (8'hac))) ?
                  wire14[(2'h2):(2'h2)] : reg31)));
              reg32 <= (wire12[(5'h10):(4'hc)] ?
                  wire14 : (reg31[(1'h1):(1'h1)] ?
                      $unsigned(($unsigned(reg23) | (wire10 ?
                          wire13 : (8'hbd)))) : ({reg28,
                          reg30[(3'h5):(3'h4)]} >> $signed(reg32))));
              reg33 <= (($unsigned($unsigned($signed(reg19))) ?
                      ($unsigned(((8'ha6) <= wire8)) ?
                          $signed((wire8 ?
                              reg25 : reg28)) : reg25) : (~&(((8'hb2) ?
                          reg25 : wire10) <<< $unsigned(wire12)))) ?
                  $unsigned(reg32[(4'hb):(1'h0)]) : $unsigned($unsigned($signed(reg18[(4'he):(3'h6)]))));
              reg34 <= {{(wire9[(4'ha):(4'h8)] ?
                          ((8'hae) ?
                              (wire10 ?
                                  (8'hab) : reg27) : $unsigned(reg24)) : (8'hac))},
                  wire12[(3'h7):(1'h1)]};
              reg35 <= reg16[(4'hb):(2'h2)];
            end
          else
            begin
              reg31 <= (~&($signed($signed(wire8[(1'h1):(1'h1)])) ?
                  {reg21, reg17[(4'ha):(3'h5)]} : (&reg17[(4'h9):(3'h6)])));
            end
          reg36 <= wire7[(3'h4):(1'h1)];
        end
    end
endmodule

module module73  (y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire78;
  input wire [(4'h9):(1'h0)] wire77;
  input wire signed [(3'h5):(1'h0)] wire76;
  input wire [(5'h14):(1'h0)] wire75;
  input wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire79 = $unsigned(((^~(&wire78)) <<< $unsigned($unsigned((wire78 ?
                      wire76 : wire75)))));
  assign wire80 = wire77;
  assign wire81 = (~&(~^$unsigned((wire77 ? {wire80} : (&wire76)))));
  assign wire82 = wire79;
  assign wire83 = ((&{(^~$unsigned(wire78)),
                      {(wire80 ? wire78 : wire77),
                          $unsigned(wire78)}}) <= {{wire76[(3'h4):(2'h2)]}});
  assign wire84 = wire74[(2'h2):(1'h0)];
  assign wire85 = (($unsigned(wire74[(4'h9):(4'h9)]) >>> wire84) | {($signed(wire78[(1'h0):(1'h0)]) ?
                          (&$unsigned(wire82)) : ((!wire79) | wire76)),
                      (-$unsigned((!wire81)))});
  always
    @(posedge clk) begin
      reg86 <= $unsigned(($signed($unsigned(wire85)) ?
          (&wire75[(1'h0):(1'h0)]) : wire80[(4'h9):(3'h5)]));
      reg87 <= wire85[(4'hb):(3'h6)];
      reg88 <= wire75[(4'ha):(4'ha)];
      reg89 <= (~{reg86, ($unsigned((!wire78)) > $unsigned(wire84))});
    end
  assign wire90 = $signed((reg86[(3'h7):(2'h3)] ?
                      ($signed((~|(8'hb3))) - wire77[(4'h9):(3'h7)]) : (wire76 * (reg86 > {wire80}))));
  assign wire91 = $unsigned((~&reg88));
  assign wire92 = (reg86[(4'hb):(2'h2)] >>> $signed(($signed(((8'hac) | wire90)) && wire75)));
  assign wire93 = (wire82[(3'h4):(2'h2)] ?
                      $signed(((wire80 + {wire91}) ?
                          $signed((wire74 <= (8'ha9))) : ((reg88 || (7'h41)) <<< (reg86 ?
                              reg88 : reg89)))) : ($signed(((|wire85) ?
                          ((8'ha4) ?
                              wire90 : wire78) : (wire75 <= reg88))) <= ($unsigned((^(8'ha5))) ?
                          (~^reg87[(3'h6):(1'h0)]) : $signed(wire80[(1'h1):(1'h1)]))));
endmodule
