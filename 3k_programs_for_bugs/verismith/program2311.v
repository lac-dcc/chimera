module top
#(parameter param165 = {((((~&(8'hb6)) ? (8'ha2) : ((7'h41) - (8'hb0))) * (8'hb4)) ? ({(|(8'hab)), ((8'hb8) ^ (8'ha3))} || (((8'haf) >> (8'hbc)) ? (~|(8'hbc)) : ((8'hba) ? (8'hb5) : (7'h42)))) : ((((8'ha1) ? (8'haa) : (8'hb0)) <= (+(7'h40))) ? ((8'hbc) ? (-(8'ha3)) : {(8'hb6), (8'hb0)}) : ({(8'hb7), (8'ha5)} << ((8'ha0) ? (8'ha0) : (7'h43))))), (!{{((8'hba) ? (8'h9d) : (7'h41))}, (((8'hba) <= (8'ha0)) ? (8'hbc) : (!(8'hac)))})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire147;
  wire signed [(3'h7):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire145;
  wire signed [(3'h4):(1'h0)] wire144;
  wire signed [(5'h15):(1'h0)] wire143;
  wire signed [(3'h7):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire141;
  wire [(5'h12):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire136;
  wire [(3'h5):(1'h0)] wire137;
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg158 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(3'h7):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire139,
                 wire50,
                 wire5,
                 wire124,
                 wire126,
                 wire134,
                 wire136,
                 wire137,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire5 = $signed({($signed(wire2) ?
                         $unsigned(wire3[(1'h0):(1'h0)]) : {$signed(wire2),
                             $unsigned(wire1)}),
                     wire0[(3'h4):(1'h0)]});
  module6 #() modinst51 (.wire9(wire1), .y(wire50), .wire8(wire3), .clk(clk), .wire11(wire4), .wire7(wire5), .wire10(wire2));
  module52 #() modinst125 (wire124, clk, wire50, wire5, wire2, wire4);
  assign wire126 = wire0[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg127 <= $unsigned($unsigned(wire3));
      reg128 <= $signed(((reg127 >> $signed((!wire4))) > wire1[(5'h10):(1'h1)]));
      if (($signed({reg127}) ? (&$signed(reg127)) : reg128))
        begin
          reg129 <= (^$unsigned($signed({wire2[(2'h3):(2'h3)],
              $unsigned(reg127)})));
          reg130 <= (((^~reg128[(3'h4):(2'h2)]) ?
              (&reg128[(1'h0):(1'h0)]) : (-$unsigned({reg127}))) ^~ $unsigned($unsigned((wire2 ?
              $signed(wire2) : wire50[(1'h0):(1'h0)]))));
        end
      else
        begin
          if ({{(7'h40)},
              $unsigned(($signed($signed(reg128)) ?
                  wire3[(4'he):(4'hc)] : wire124[(4'h8):(4'h8)]))})
            begin
              reg129 <= $unsigned((wire124[(1'h0):(1'h0)] && $unsigned(({wire126,
                  wire1} >= $unsigned(wire124)))));
              reg130 <= reg128;
              reg131 <= wire4;
            end
          else
            begin
              reg129 <= wire2;
              reg130 <= $signed($signed($unsigned(reg127[(2'h2):(2'h2)])));
            end
          reg132 <= wire4;
        end
      reg133 <= {($unsigned((~&{wire2, (8'h9f)})) ?
              $signed($unsigned(reg127[(1'h0):(1'h0)])) : reg127[(3'h4):(1'h0)])};
    end
  module79 #() modinst135 (wire134, clk, wire124, reg131, wire5, reg130);
  assign wire136 = wire5;
  module59 #() modinst138 (.clk(clk), .wire61(wire126), .wire62(wire2), .wire60(reg130), .wire63(wire124), .y(wire137));
  module6 #() modinst140 (.wire7(wire2), .y(wire139), .wire9(wire136), .wire10(reg132), .wire11(wire3), .clk(clk), .wire8(wire1));
  assign wire141 = $signed((wire124 ?
                       $signed($unsigned((wire3 ?
                           (8'hb5) : reg131))) : ((8'hac) || $signed($signed(wire3)))));
  assign wire142 = reg128[(2'h2):(2'h2)];
  assign wire143 = ($signed({(7'h44)}) && wire1[(5'h12):(4'he)]);
  assign wire144 = reg132;
  assign wire145 = wire143;
  assign wire146 = $unsigned((~(wire50 ?
                       $signed($signed(wire2)) : wire137[(1'h0):(1'h0)])));
  assign wire147 = $unsigned(reg133[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg148 <= $signed({(({wire139} > (~reg128)) ?
              wire5[(3'h4):(2'h3)] : wire142),
          $unsigned($unsigned((wire143 | reg131)))});
      reg149 <= (~&{{wire136}});
      if (wire50)
        begin
          if ({(~&wire5[(4'ha):(4'h9)]),
              {$unsigned({(8'ha0)}), $signed(wire144)}})
            begin
              reg150 <= {((((wire139 ? wire147 : wire145) ?
                              wire144 : (wire136 ? wire136 : wire124)) ?
                          {(^~(8'ha2)), wire146} : $unsigned(reg131)) ?
                      $signed(((wire5 ? wire50 : (8'hac)) ?
                          (+reg128) : wire141)) : ($unsigned((wire126 ?
                          reg133 : (7'h44))) - $unsigned(wire137)))};
              reg151 <= wire2;
              reg152 <= $signed(($signed((reg132[(3'h5):(1'h1)] <= $unsigned(wire4))) * $signed($unsigned((wire50 * reg151)))));
            end
          else
            begin
              reg150 <= reg130;
            end
          reg153 <= (&$signed((8'hbb)));
          reg154 <= wire124[(4'hd):(4'ha)];
          if ($unsigned({($unsigned($unsigned(wire5)) ?
                  {(wire4 ? wire142 : reg149),
                      wire0[(4'hd):(4'h9)]} : ((reg129 ~^ reg152) ?
                      ((8'hbc) ? wire145 : wire134) : reg151)),
              wire134}))
            begin
              reg155 <= (wire4 ?
                  $unsigned({$signed($signed(wire141))}) : reg150[(1'h1):(1'h0)]);
              reg156 <= (+$signed(wire142[(3'h5):(1'h1)]));
              reg157 <= $unsigned({(~^({wire124, wire139} ?
                      {reg154, wire1} : wire124)),
                  $signed((8'hb9))});
              reg158 <= (~(8'hb2));
            end
          else
            begin
              reg155 <= reg152[(5'h11):(2'h2)];
            end
        end
      else
        begin
          reg150 <= wire142;
          reg151 <= $unsigned($unsigned(({wire136, $signed(wire5)} ?
              {(wire136 == reg148)} : reg128[(1'h0):(1'h0)])));
          reg152 <= (((wire137[(2'h2):(2'h2)] ?
                      (((7'h41) | reg132) > $signed((8'ha5))) : (~(wire143 ?
                          reg127 : wire4))) ?
                  ({(wire1 ? (8'ha0) : reg150), reg149[(1'h1):(1'h0)]} ?
                      reg154[(3'h5):(3'h5)] : wire141[(1'h0):(1'h0)]) : $signed($signed(wire142))) ?
              wire144 : $signed($unsigned(wire136[(1'h1):(1'h0)])));
          reg153 <= ($signed((((wire142 ?
                  reg150 : reg129) ^~ wire50[(4'h8):(1'h0)]) <<< $signed($unsigned(wire136)))) ?
              (+(8'ha5)) : wire137[(2'h3):(1'h1)]);
          reg154 <= $unsigned(((-(8'hb8)) & ($unsigned($unsigned((8'hb5))) ?
              $unsigned((wire144 || wire0)) : ($unsigned(reg148) | $unsigned(reg157)))));
        end
      if ($unsigned(wire139))
        begin
          reg159 <= {(~&(reg130 ? ((+wire142) < (~|(8'ha8))) : {(~reg149)})),
              $signed($signed($unsigned(reg130[(2'h3):(1'h1)])))};
          reg160 <= (8'hbe);
          reg161 <= reg131[(1'h1):(1'h0)];
          reg162 <= $unsigned($signed((reg130 ? (~(~wire0)) : {(~&reg154)})));
          reg163 <= (($unsigned($unsigned(wire145[(3'h7):(3'h4)])) ?
                  $signed(((reg154 >> (7'h43)) ?
                      (reg161 ? wire50 : reg162) : $signed(reg129))) : wire5) ?
              ((^$unsigned($signed(wire141))) ?
                  $unsigned((^$unsigned(reg157))) : (wire137[(2'h2):(1'h1)] << (~wire0))) : ({($signed(wire136) && wire4[(4'he):(3'h4)])} ?
                  $unsigned(($signed(wire2) <= (reg160 ?
                      reg159 : (8'hbb)))) : $signed({$signed((8'hb2)),
                      $signed((8'h9d))})));
        end
      else
        begin
          reg159 <= ($signed((~&(wire143[(2'h2):(1'h1)] ?
              $signed(reg154) : reg149))) * $signed(({$signed((8'hbb)),
              (~|wire146)} | ((!wire2) <<< (8'hbe)))));
          reg160 <= $signed(reg155[(2'h2):(2'h2)]);
        end
    end
  always
    @(posedge clk) begin
      reg164 <= reg156;
    end
endmodule

module module52
#(parameter param122 = ((((((8'ha0) != (8'h9c)) ? ((8'h9e) ? (7'h41) : (8'hac)) : ((8'ha1) ^ (8'ha8))) ? (((8'ha7) * (8'hb7)) <= ((8'hb9) != (7'h43))) : (^((7'h44) >= (8'ha5)))) > (-({(8'hbe)} ? ((8'hb9) ? (8'hb3) : (8'ha6)) : (|(8'hb7))))) & (~&{((^~(8'hb0)) & ((8'ha5) ? (8'h9c) : (7'h42))), ((8'hbc) ? (~|(8'hae)) : ((8'ha8) || (8'h9d)))})), 
parameter param123 = (8'hb9))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h20e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire56;
  input wire [(5'h15):(1'h0)] wire55;
  input wire [(4'hd):(1'h0)] wire54;
  input wire [(5'h10):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire [(3'h5):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire57;
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  assign y = {wire121,
                 wire96,
                 wire95,
                 wire93,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire68,
                 wire58,
                 wire57,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
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
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire57 = wire53;
  assign wire58 = wire55;
  module59 #() modinst69 (.y(wire68), .wire60(wire55), .wire63(wire57), .wire61(wire56), .clk(clk), .wire62(wire58));
  assign wire70 = $signed(wire57);
  assign wire71 = ($unsigned(wire55) >> wire58);
  assign wire72 = $unsigned($signed($unsigned(wire70[(2'h2):(1'h1)])));
  assign wire73 = (-wire57);
  assign wire74 = (^wire71[(3'h4):(2'h3)]);
  assign wire75 = ((&wire74[(3'h7):(2'h2)]) ?
                      (wire72 + wire74) : (($signed({wire68, wire57}) ?
                              (&(~&(8'hb8))) : wire55[(5'h14):(4'hb)]) ?
                          $signed(((-wire72) | ((8'h9f) ?
                              wire56 : (8'hab)))) : (~^wire71[(4'hb):(4'ha)])));
  assign wire76 = {(wire70[(5'h14):(3'h6)] & $unsigned(wire74))};
  assign wire77 = wire53[(4'hf):(2'h2)];
  assign wire78 = (({($signed(wire70) < $signed(wire56)),
                          (~&$signed(wire71))} != (($unsigned(wire73) ?
                              wire74 : $unsigned(wire54)) ?
                          $unsigned($signed(wire70)) : $signed(wire53))) ?
                      wire57[(4'hc):(2'h2)] : ($signed((8'hae)) ?
                          (wire57 ?
                              wire77[(3'h5):(2'h2)] : $unsigned($signed(wire72))) : wire74[(2'h3):(2'h3)]));
  module79 #() modinst94 (wire93, clk, wire73, wire76, wire70, wire56);
  assign wire95 = (~^$unsigned(wire74[(1'h0):(1'h0)]));
  assign wire96 = (wire77 ?
                      ($unsigned({(~&(7'h43)), wire53}) ?
                          $unsigned(wire74) : {($unsigned(wire76) << $signed(wire93)),
                              ($signed(wire58) ^~ (wire57 ?
                                  (8'hb3) : (8'h9e)))}) : (wire53[(3'h7):(2'h3)] ^ (wire74[(2'h2):(1'h0)] ?
                          wire53 : $unsigned(wire93))));
  always
    @(posedge clk) begin
      reg97 <= (8'hbd);
      if (wire56)
        begin
          reg98 <= (8'ha7);
        end
      else
        begin
          if (((8'ha0) >>> $signed(({wire95, (wire55 * wire54)} ?
              $unsigned((~^wire78)) : ({wire56} & (~|wire54))))))
            begin
              reg98 <= ((!reg97[(2'h2):(2'h2)]) ? wire54 : wire96);
            end
          else
            begin
              reg98 <= (8'ha8);
              reg99 <= wire54;
              reg100 <= $unsigned($unsigned($unsigned(wire78[(4'h9):(4'h9)])));
              reg101 <= wire73;
              reg102 <= {(wire53 ? wire58 : wire76)};
            end
          reg103 <= $signed(wire71);
          reg104 <= (+{($unsigned(wire75[(3'h5):(2'h2)]) ?
                  $unsigned((+(8'hb1))) : (wire56 ? (&(7'h43)) : (+wire78))),
              $signed($signed({wire93}))});
        end
    end
  always
    @(posedge clk) begin
      reg105 <= (8'h9f);
    end
  always
    @(posedge clk) begin
      reg106 <= ({{(wire73 ? ((8'hb0) ? wire77 : (7'h41)) : reg100)}, wire77} ?
          ($unsigned(wire71[(4'hc):(4'hb)]) ?
              wire71 : wire74) : $unsigned(reg103));
      if ((wire57[(4'h8):(1'h1)] != $signed((wire74[(4'h8):(3'h6)] ?
          $unsigned({wire77}) : reg99))))
        begin
          if ((-reg106))
            begin
              reg107 <= {((~$unsigned((wire72 <<< reg104))) ?
                      wire55 : ($unsigned(reg106[(5'h13):(3'h7)]) <<< ((~wire95) ?
                          wire71[(3'h5):(2'h2)] : $signed(wire57)))),
                  reg100};
              reg108 <= wire78[(5'h11):(1'h0)];
            end
          else
            begin
              reg107 <= reg107;
              reg108 <= ((~^(~^wire77)) ? reg97 : wire75[(3'h6):(1'h0)]);
              reg109 <= {wire95[(4'hd):(4'h9)]};
            end
          if (((reg98[(2'h3):(2'h2)] ~^ (^~{$signed(wire96),
              (reg109 + reg109)})) && $signed({(wire56 && wire78)})))
            begin
              reg110 <= (wire56 * ({$signed((reg97 & wire55)),
                  $unsigned($signed((8'haf)))} | $unsigned(wire56[(5'h14):(3'h4)])));
              reg111 <= ($unsigned(wire54[(3'h4):(1'h0)]) ?
                  $signed({reg105[(3'h7):(1'h0)],
                      (~$signed((7'h42)))}) : wire93[(1'h0):(1'h0)]);
              reg112 <= $unsigned($signed((~^($unsigned(wire73) ?
                  $unsigned((8'ha4)) : ((8'hba) + wire53)))));
              reg113 <= wire74[(3'h7):(2'h3)];
              reg114 <= reg112[(2'h3):(2'h3)];
            end
          else
            begin
              reg110 <= $signed($unsigned((wire77[(3'h4):(3'h4)] ^ reg107)));
              reg111 <= {(~|$signed(((8'hbe) < (8'ha7)))),
                  (($unsigned($signed((8'ha7))) ?
                          wire70[(3'h5):(1'h1)] : $unsigned(wire93)) ?
                      $signed($signed(wire53)) : $unsigned({$signed((8'hae))}))};
            end
          if ((wire68[(2'h3):(2'h2)] >> (reg100 ? wire70 : reg102)))
            begin
              reg115 <= wire93[(1'h1):(1'h0)];
              reg116 <= {($signed(reg106) ?
                      ((8'ha7) ?
                          reg104 : wire74[(3'h5):(1'h1)]) : reg113[(2'h3):(1'h0)])};
            end
          else
            begin
              reg115 <= (~reg100);
              reg116 <= wire53[(2'h2):(1'h0)];
              reg117 <= wire96[(3'h7):(2'h2)];
              reg118 <= (reg110[(1'h0):(1'h0)] ? (!{wire75}) : wire68);
              reg119 <= $signed((7'h44));
            end
          reg120 <= $signed(($unsigned(reg103) ^ $unsigned({(reg97 <<< reg111),
              $unsigned(wire56)})));
        end
      else
        begin
          reg107 <= ($signed({(8'hb4)}) ?
              (reg116[(1'h1):(1'h1)] && $unsigned((((8'ha5) && (8'hab)) << wire75))) : (8'hbb));
        end
    end
  assign wire121 = (8'had);
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire34;
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire34,
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
                 (1'h0)};
  module12 #() modinst35 (.wire17(wire7), .clk(clk), .wire14(wire10), .wire16(wire11), .wire15(wire9), .wire13(wire8), .y(wire34));
  always
    @(posedge clk) begin
      reg36 <= $signed((7'h42));
      reg37 <= wire10[(2'h3):(2'h2)];
      if (reg36)
        begin
          reg38 <= $unsigned({(+(^~$unsigned(wire8)))});
          reg39 <= (((|($signed(wire7) ?
              $signed(reg37) : (wire8 && wire11))) == $signed(reg37)) >> $unsigned($signed(($signed(reg36) ?
              wire9[(1'h1):(1'h0)] : wire8))));
          reg40 <= ($signed(reg39) ?
              wire8[(3'h4):(3'h4)] : wire9[(4'h8):(1'h0)]);
          reg41 <= ((reg36 >= (reg37[(4'hc):(1'h0)] <<< $unsigned({reg38,
              reg37}))) == $unsigned((((wire10 < reg36) ?
                  (+reg40) : (reg38 ? wire7 : wire34)) ?
              (&((8'hb6) && reg37)) : (reg38 ?
                  (wire10 ? wire11 : wire8) : (!wire8)))));
        end
      else
        begin
          if (($unsigned((reg37 ?
              reg41 : $signed(wire7[(2'h3):(1'h1)]))) << {(reg40[(2'h3):(1'h1)] ?
                  (~|{reg41, wire9}) : (+wire8[(4'h8):(3'h7)])),
              $signed((reg40[(4'hc):(4'hb)] ^ {(7'h41), reg39}))}))
            begin
              reg38 <= $signed(reg36);
              reg39 <= reg39[(4'hb):(3'h5)];
              reg40 <= $signed((&wire11));
              reg41 <= $signed($unsigned((7'h42)));
              reg42 <= (^~(^wire34));
            end
          else
            begin
              reg38 <= {(wire34 ^ wire7[(4'hb):(3'h4)])};
              reg39 <= $signed(reg42[(3'h6):(1'h1)]);
            end
          if ((+{$signed(wire9[(1'h0):(1'h0)]), reg38}))
            begin
              reg43 <= ($signed($unsigned(wire7)) ?
                  ($unsigned($signed(((8'hae) - reg42))) ?
                      (^(~|wire34[(3'h4):(3'h4)])) : wire9) : (wire11[(1'h0):(1'h0)] > (($unsigned(reg41) ?
                      $unsigned(wire11) : reg36[(3'h7):(1'h0)]) ~^ ($unsigned(wire7) ?
                      (^~wire7) : $signed(reg36)))));
              reg44 <= $unsigned((~|((wire8[(4'h8):(3'h6)] ?
                      (wire7 ? reg41 : wire7) : $unsigned(reg43)) ?
                  {reg38[(3'h6):(3'h4)]} : reg39[(3'h5):(3'h4)])));
              reg45 <= (+({$signed((&wire10))} + ((&{wire10,
                  wire11}) & $unsigned($signed(wire9)))));
              reg46 <= reg37;
            end
          else
            begin
              reg43 <= ($signed($unsigned(reg40)) ?
                  (^(((reg41 | reg46) && (wire10 ? reg38 : reg39)) ?
                      $unsigned((reg41 ? reg42 : wire9)) : ((+reg44) ?
                          (wire34 ?
                              reg43 : (8'hb4)) : reg39))) : wire8[(2'h2):(2'h2)]);
            end
        end
    end
  assign wire47 = $signed(((reg39[(3'h5):(1'h1)] <= ((wire10 ?
                          wire10 : (8'hb6)) ~^ reg38)) ?
                      $unsigned((&wire11)) : (+(-wire34))));
  assign wire48 = (!(wire11[(2'h2):(1'h0)] ?
                      ($signed($signed(wire34)) ?
                          wire10 : {reg41,
                              $signed(reg41)}) : (wire7 + ({(8'h9c), (8'haf)} ?
                          $signed(wire8) : $unsigned(reg42)))));
  assign wire49 = {(reg38 ?
                          (reg42[(3'h4):(1'h1)] >> reg44) : wire8[(4'hb):(3'h7)]),
                      reg36};
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire17;
  input wire [(4'hc):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  assign y = {wire33,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire19,
                 wire18,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg20,
                 (1'h0)};
  assign wire18 = wire16[(2'h2):(1'h1)];
  assign wire19 = ((($signed((wire16 ? (8'hbc) : wire15)) ?
                          wire14 : ((wire13 ?
                              wire13 : wire16) || wire13)) ^ wire13[(1'h1):(1'h1)]) ?
                      wire13 : ((((!wire16) != $unsigned(wire15)) ?
                          $signed($unsigned(wire16)) : wire18) & ($unsigned((wire18 ?
                          wire18 : wire18)) ~^ (-wire16))));
  always
    @(posedge clk) begin
      reg20 <= wire19[(1'h0):(1'h0)];
    end
  assign wire21 = wire13[(4'ha):(3'h7)];
  assign wire22 = $signed({wire15, (&wire16[(3'h6):(3'h4)])});
  assign wire23 = ($unsigned(($unsigned((-wire18)) ?
                      wire13 : $unsigned($signed(wire15)))) < wire22);
  assign wire24 = (~wire13);
  assign wire25 = ({$unsigned((~&(~reg20))),
                      (($signed((8'ha2)) << wire18) ?
                          $signed($signed(wire22)) : ($signed(wire14) <= (&(8'h9c))))} <<< (~|(^~$signed($signed(wire21)))));
  assign wire26 = {$signed(wire16[(3'h5):(2'h2)])};
  assign wire27 = $signed((wire18 | (wire24[(1'h1):(1'h0)] ?
                      ($unsigned((8'ha4)) != (7'h44)) : $signed((wire14 >>> (8'hb1))))));
  always
    @(posedge clk) begin
      reg28 <= (~^(((~^$signed((8'h9c))) <<< (8'hbd)) != $signed((wire17 ^~ $signed(wire22)))));
      reg29 <= ($signed((wire18 ?
              {(~|(8'ha2)), ((7'h44) ? (8'had) : wire23)} : $signed(wire14))) ?
          (((wire25 ^~ $signed(wire13)) ?
                  wire17 : ((^~wire13) | (wire15 | wire22))) ?
              $signed($signed(reg28[(4'hb):(4'ha)])) : {(~wire19[(2'h2):(1'h0)])}) : ({(-reg28[(2'h3):(2'h2)]),
                  (8'ha3)} ?
              $signed(((~wire26) * (reg20 ^ wire22))) : (^$unsigned($signed(reg20)))));
      if ($unsigned(reg29[(3'h6):(1'h0)]))
        begin
          reg30 <= wire19;
          reg31 <= reg20;
        end
      else
        begin
          reg30 <= wire15;
          reg31 <= wire16;
        end
      reg32 <= wire25;
    end
  assign wire33 = wire26[(1'h0):(1'h0)];
endmodule

module module79
#(parameter param91 = (^~((^(~&{(8'ha7)})) >>> (8'hb6))), 
parameter param92 = param91)
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire83;
  input wire signed [(2'h3):(1'h0)] wire82;
  input wire [(4'hd):(1'h0)] wire81;
  input wire [(4'h9):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire90;
  wire [(4'h9):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire84;
  assign y = {wire90, wire89, wire88, wire87, wire86, wire85, wire84, (1'h0)};
  assign wire84 = ($unsigned(($unsigned(wire83[(4'hd):(3'h4)]) ?
                          $signed(wire80[(2'h2):(1'h0)]) : ((wire80 != wire82) != (wire82 ?
                              wire80 : wire81)))) ?
                      wire81[(4'hd):(4'hc)] : (wire80[(3'h4):(1'h0)] - {({wire82,
                                  wire83} ?
                              (wire82 ^ wire80) : wire83[(4'hb):(4'h8)]),
                          ($signed((8'ha4)) ?
                              (wire81 ? wire80 : (8'hbc)) : (^wire83))}));
  assign wire85 = $unsigned((-(~|wire82)));
  assign wire86 = (8'hae);
  assign wire87 = $signed(wire80);
  assign wire88 = wire87;
  assign wire89 = ({{((wire83 ? wire87 : wire82) ?
                                  wire87[(2'h2):(2'h2)] : $signed((8'hb4)))}} ?
                      $signed(($unsigned((-wire80)) ?
                          $unsigned($unsigned(wire88)) : ((wire83 < wire85) - (wire81 <= wire85)))) : wire81);
  assign wire90 = wire83;
endmodule

module module59  (y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire63;
  input wire signed [(5'h15):(1'h0)] wire62;
  input wire signed [(5'h15):(1'h0)] wire61;
  input wire signed [(5'h15):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  assign y = {wire67, wire66, wire65, wire64, (1'h0)};
  assign wire64 = ((((~|$signed(wire61)) >>> wire62) ?
                          (wire63 <<< ($signed(wire62) ?
                              (wire62 ? wire61 : (8'hbd)) : (wire60 ?
                                  wire60 : wire60))) : (((|(8'ha2)) ?
                              wire60 : $unsigned(wire61)) & (^~$unsigned(wire62)))) ?
                      $unsigned(((wire60[(5'h14):(4'h8)] ?
                          (wire61 == (8'hb1)) : (wire63 ^~ wire61)) * $signed((!wire62)))) : $unsigned($unsigned($unsigned(wire63[(1'h0):(1'h0)]))));
  assign wire65 = $unsigned({((~^wire64[(5'h14):(4'h9)]) ?
                          ($unsigned(wire62) ?
                              (wire61 | wire64) : ((8'hb4) ^ wire63)) : $unsigned($unsigned(wire64)))});
  assign wire66 = (wire64[(4'h8):(3'h7)] <<< wire60[(4'hf):(4'h9)]);
  assign wire67 = wire61[(5'h10):(2'h3)];
endmodule
