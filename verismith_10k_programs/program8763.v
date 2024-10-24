module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire129;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire127;
  assign y = {wire129, wire5, wire6, wire7, wire8, wire127, (1'h0)};
  assign wire5 = wire0[(2'h2):(2'h2)];
  assign wire6 = wire5[(1'h1):(1'h0)];
  assign wire7 = ((~|(~^$signed(wire6))) ?
                     ((^~$signed({wire0, wire2})) * ($unsigned({(8'hb9),
                         wire0}) != wire4)) : wire6);
  assign wire8 = wire4[(1'h0):(1'h0)];
  module9 #() modinst128 (wire127, clk, wire6, wire3, wire8, wire4, wire5);
  assign wire129 = (wire2 ~^ (wire5 < (8'hbd)));
endmodule

module module9
#(parameter param126 = ((((~|(!(8'ha5))) <= (((8'haf) != (8'ha7)) ? (&(8'ha7)) : {(8'ha4)})) | (!(-(&(8'hb5))))) ? (&(~(!{(8'h9f), (8'ha4)}))) : {((((8'ha9) <<< (8'ha8)) <<< {(8'hb2), (8'hba)}) + (|{(8'hb7)}))}))
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire125;
  wire [(5'h13):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire90;
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire102,
                 wire101,
                 wire99,
                 wire15,
                 wire19,
                 wire90,
                 reg100,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg16,
                 reg17,
                 reg18,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire15 = wire10;
  always
    @(posedge clk) begin
      reg16 <= wire15;
      reg17 <= wire13[(4'hd):(3'h4)];
      reg18 <= wire11;
    end
  assign wire19 = (~|wire14[(4'h8):(2'h2)]);
  always
    @(posedge clk) begin
      reg20 <= $unsigned($signed((|{(wire10 ^~ wire10),
          (reg16 ? wire11 : (8'hb9))})));
      reg21 <= (reg17[(4'h8):(1'h0)] ^ (&(wire14 - ((|wire14) ?
          wire13 : $unsigned(wire15)))));
      reg22 <= (^~((&(~&$unsigned(wire15))) ?
          $signed((wire19 ?
              (wire11 ? wire12 : reg16) : (reg17 ?
                  reg17 : wire10))) : (8'hb0)));
      if ((-$signed(wire14)))
        begin
          reg23 <= (($signed(((-(8'ha5)) ^~ ((8'hb5) ?
                  reg22 : reg21))) - {wire10[(4'hd):(4'hd)]}) ?
              $signed($unsigned(reg22)) : ({(^(8'hbc))} || (~|(wire14[(4'ha):(1'h0)] ?
                  (wire10 ? wire11 : reg17) : $unsigned(reg17)))));
          reg24 <= (-(($signed({wire10,
              wire13}) ~^ ($signed((8'haa)) ^ (wire12 ?
              reg23 : reg23))) > $signed(wire12)));
          reg25 <= $signed((|wire10[(3'h6):(1'h1)]));
        end
      else
        begin
          reg23 <= (reg22 ?
              (~|({$unsigned(reg21),
                  $unsigned(wire12)} || {$signed(reg21)})) : $signed(((^~reg17) ^~ reg25)));
          reg24 <= $signed(reg23[(1'h0):(1'h0)]);
          reg25 <= (^~{$unsigned(reg16)});
          reg26 <= reg16;
          reg27 <= (~^((+{$signed(wire14)}) ?
              {(wire10[(4'ha):(2'h2)] > (~&reg16))} : wire15));
        end
      if ($signed(((($unsigned(reg24) ?
          $signed(reg23) : reg24[(1'h1):(1'h1)]) <= reg18[(4'h9):(1'h1)]) + (+$signed((wire15 >>> reg21))))))
        begin
          reg28 <= {(!(~^(&(8'hac))))};
          reg29 <= ($signed(wire15) ?
              wire19 : ($signed(({reg23, reg28} ?
                  (wire19 ?
                      reg18 : (8'h9e)) : reg22)) > $signed(reg22[(3'h5):(2'h2)])));
          reg30 <= (&(&$signed(((reg20 < reg29) ?
              $unsigned(reg24) : $unsigned(reg29)))));
        end
      else
        begin
          reg28 <= ($unsigned($unsigned({(!reg27)})) ?
              ((^~$signed(wire14)) ~^ ($unsigned($signed(reg29)) ?
                  {(~|(8'ha0))} : wire19)) : reg30);
          reg29 <= (~((({reg24} ? $signed(reg30) : (^~reg26)) ?
              $unsigned((~&reg16)) : wire19) | (~(8'haa))));
          reg30 <= $unsigned(wire19);
          reg31 <= (+$unsigned((((8'hb0) || (^reg24)) ?
              ((reg24 >> wire11) << (wire12 | reg20)) : reg18[(3'h5):(1'h1)])));
          if ((~wire10))
            begin
              reg32 <= reg24[(3'h4):(1'h1)];
              reg33 <= reg28[(3'h7):(1'h1)];
              reg34 <= (($unsigned($signed((-reg33))) ?
                  reg18[(4'hd):(3'h5)] : (reg29 ?
                      (7'h44) : $unsigned((wire13 | (8'hbe))))) ^~ $unsigned(((|(8'had)) >>> (wire19[(5'h12):(2'h3)] ?
                  (wire19 ? wire12 : reg33) : $unsigned(reg16)))));
              reg35 <= (^$signed((reg17[(1'h1):(1'h0)] ?
                  ((reg33 || reg20) - $signed(reg34)) : $unsigned($unsigned(reg26)))));
              reg36 <= $signed($unsigned(reg16[(1'h0):(1'h0)]));
            end
          else
            begin
              reg32 <= ((8'hb1) ? wire19[(1'h1):(1'h0)] : wire12);
              reg33 <= {((($signed(reg27) ?
                          $unsigned(reg28) : reg24[(3'h4):(2'h3)]) * (~^(~&(8'hb6)))) ?
                      reg26[(3'h6):(1'h1)] : $unsigned((reg18 ?
                          ((7'h42) << reg18) : (-(8'hae)))))};
            end
        end
    end
  module37 #() modinst91 (wire90, clk, reg30, wire12, reg20, reg26);
  always
    @(posedge clk) begin
      reg92 <= ({wire13,
          ($signed($signed(reg25)) < reg24)} < $unsigned((((wire10 ?
              wire15 : wire11) - (~(8'hbb))) ?
          $signed((wire19 ? (8'ha2) : (8'hbb))) : ((reg28 ? reg28 : (8'hbb)) ?
              ((8'haa) ? reg26 : reg25) : (~&reg25)))));
      reg93 <= (|(wire90 ^ wire13));
      if ((-wire90))
        begin
          if (reg20)
            begin
              reg94 <= (wire11[(3'h7):(3'h6)] ^ ($unsigned((&wire10[(5'h10):(4'h9)])) > {({wire13} || (wire90 ?
                      reg30 : reg31))}));
              reg95 <= (8'ha2);
              reg96 <= {{(-reg36), reg21[(5'h13):(2'h2)]}};
            end
          else
            begin
              reg94 <= $unsigned({$unsigned((((8'hbf) ? reg35 : reg26) ?
                      reg16[(2'h2):(2'h2)] : reg93[(2'h3):(2'h3)]))});
              reg95 <= reg16;
              reg96 <= ((&(+(~&$unsigned(wire10)))) * reg24);
            end
          reg97 <= {{$unsigned(wire15[(3'h5):(1'h1)]), wire11}};
          reg98 <= ((reg20 ?
                  $unsigned({reg26,
                      (~|wire11)}) : (&$unsigned(reg94[(3'h4):(2'h3)]))) ?
              $unsigned({$unsigned((reg34 == (8'ha5))),
                  (&(~&reg25))}) : $unsigned($signed(($signed(wire19) ?
                  (-reg20) : reg25[(4'hf):(4'h8)]))));
        end
      else
        begin
          reg94 <= (~^($signed(reg31) >= $unsigned(((reg92 ?
              reg27 : wire90) * ((7'h41) <<< reg95)))));
          reg95 <= ((~|{(^$unsigned(reg34)),
              ((~|reg97) | reg93[(1'h1):(1'h0)])}) || wire12);
        end
    end
  assign wire99 = $signed({({(reg20 >> wire11), reg94} || ($unsigned(reg35) ?
                          $signed(reg98) : $unsigned(reg96))),
                      reg18[(4'hb):(3'h7)]});
  always
    @(posedge clk) begin
      reg100 <= $signed($unsigned(wire90[(1'h1):(1'h0)]));
    end
  assign wire101 = {reg26};
  assign wire102 = wire99;
  module103 #() modinst121 (wire120, clk, reg93, wire14, reg32, wire101);
  assign wire122 = $unsigned($unsigned($signed(reg16[(1'h0):(1'h0)])));
  assign wire123 = $unsigned(($unsigned(({(8'ha6),
                       reg22} << $unsigned(reg24))) ^~ wire90[(3'h6):(2'h2)]));
  assign wire124 = reg20[(5'h12):(4'hd)];
  assign wire125 = (!{{$signed((wire99 ? wire99 : reg31)), reg24},
                       $unsigned({{wire10, reg100}})});
endmodule

module module103  (y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire107;
  input wire [(2'h2):(1'h0)] wire106;
  input wire signed [(4'hc):(1'h0)] wire105;
  input wire [(4'h9):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire108;
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire108 = wire106;
  assign wire109 = ((~(+wire107[(3'h4):(1'h1)])) ?
                       wire104[(3'h4):(1'h0)] : wire107[(2'h2):(1'h1)]);
  assign wire110 = wire106;
  assign wire111 = ((8'hb0) != $unsigned($unsigned({wire104[(3'h6):(3'h5)]})));
  always
    @(posedge clk) begin
      reg112 <= (((((wire108 ? wire106 : wire106) ?
                  (~|wire111) : {wire106, wire105}) << ($signed(wire111) ?
                  $unsigned((7'h43)) : wire108[(1'h0):(1'h0)])) ?
              $unsigned((^{wire106, wire111})) : {$unsigned(wire108),
                  (wire111 <= wire109[(3'h5):(3'h4)])}) ?
          {$unsigned($unsigned((wire106 ?
                  wire105 : wire105)))} : $unsigned((wire105[(3'h4):(2'h3)] ?
              (wire108 >= (~(8'hbb))) : {$signed(wire111)})));
      reg113 <= ($unsigned(wire108) ?
          $signed({(~&{reg112})}) : $unsigned({(|(wire106 + wire108))}));
    end
  assign wire114 = (~&$unsigned((|((wire111 ? wire111 : (8'hac)) ?
                       (wire110 ? wire105 : wire104) : (~|reg112)))));
  assign wire115 = (($unsigned($unsigned($unsigned(wire111))) ?
                       $unsigned($signed(wire107)) : ({(reg113 ?
                               reg112 : reg113)} != {wire105[(4'ha):(4'h8)],
                           $unsigned(reg112)})) <= ((&((wire106 ?
                               wire108 : wire104) ?
                           (8'ha9) : (~^wire108))) ?
                       (wire104[(3'h4):(3'h4)] ?
                           wire108 : wire108[(2'h2):(1'h0)]) : wire108[(3'h4):(1'h0)]));
  assign wire116 = wire104;
  assign wire117 = $signed(reg113);
  assign wire118 = reg112[(1'h1):(1'h1)];
  assign wire119 = ((reg112 ^ $unsigned(wire118)) ?
                       $unsigned(wire107[(3'h7):(3'h5)]) : $signed(((&$unsigned(wire109)) ?
                           wire110[(5'h12):(4'hb)] : wire111)));
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h1f9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire41;
  input wire signed [(5'h15):(1'h0)] wire40;
  input wire [(4'hf):(1'h0)] wire39;
  input wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire70,
                 wire49,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
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
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire42 = wire38[(1'h0):(1'h0)];
  assign wire43 = $unsigned($unsigned(($signed(wire41) >= (&(wire39 <<< wire42)))));
  assign wire44 = ({((~^wire38) ?
                          wire41 : (~wire42))} | {wire42[(1'h1):(1'h1)]});
  assign wire45 = (&$signed(wire40[(4'hd):(4'ha)]));
  always
    @(posedge clk) begin
      reg46 <= $signed($signed($signed(wire38[(1'h1):(1'h1)])));
      reg47 <= (^wire42);
      reg48 <= (wire41[(3'h6):(3'h6)] ? wire40[(3'h5):(1'h0)] : (|{(-reg47)}));
    end
  assign wire49 = wire44[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg50 <= (wire49 ? wire43[(4'h9):(2'h3)] : reg46);
      reg51 <= $signed((~(((~&wire43) ?
          $unsigned(wire38) : $signed(wire42)) ~^ {$unsigned(reg48),
          {wire41}})));
    end
  always
    @(posedge clk) begin
      reg52 <= wire39[(1'h1):(1'h1)];
      if ((7'h40))
        begin
          reg53 <= $unsigned($signed(reg48[(2'h3):(2'h3)]));
          if ((+(+wire49)))
            begin
              reg54 <= $unsigned($unsigned($signed(((reg53 ? reg52 : reg46) ?
                  (^reg51) : $signed((8'ha5))))));
              reg55 <= wire42[(4'h8):(1'h1)];
              reg56 <= $unsigned($unsigned({((reg50 ?
                      reg46 : (7'h41)) >= (reg51 <= wire49))}));
              reg57 <= (^~$signed($unsigned(((~&wire41) <<< {wire39,
                  wire40}))));
              reg58 <= wire40[(4'hc):(4'hc)];
            end
          else
            begin
              reg54 <= reg50[(1'h1):(1'h0)];
              reg55 <= reg52;
              reg56 <= reg54[(5'h12):(1'h0)];
              reg57 <= {(wire41 - (!reg48[(3'h4):(2'h3)]))};
              reg58 <= $signed((+$signed(({reg58} ? (&reg58) : (+reg47)))));
            end
          reg59 <= reg56[(2'h3):(1'h1)];
          reg60 <= $signed((~^$signed($unsigned((~&wire44)))));
        end
      else
        begin
          reg53 <= (wire40 ?
              $unsigned(((reg59 <<< $unsigned(reg57)) >= (&(reg58 < reg53)))) : (~^((~(reg46 ?
                  reg51 : reg50)) * ({reg59} ? (&wire45) : {wire38}))));
          if ((8'hb7))
            begin
              reg54 <= (^$unsigned(wire43));
            end
          else
            begin
              reg54 <= (((8'hbc) || {(wire39[(1'h0):(1'h0)] ^ (!wire49)),
                      reg56[(1'h0):(1'h0)]}) ?
                  wire38 : ($signed(((^~wire44) != reg50)) << $unsigned(reg46[(4'hc):(2'h2)])));
              reg55 <= (!{$signed(wire42),
                  $unsigned((reg50 ?
                      $unsigned((8'hab)) : (wire45 ? reg48 : (8'hb4))))});
            end
          reg56 <= reg46;
          reg57 <= $signed($unsigned((-(reg51 - reg54[(4'hb):(2'h2)]))));
        end
      if (wire43)
        begin
          reg61 <= $signed((({$signed(wire43), $signed(wire43)} ^ (8'hb1)) ?
              (!reg46) : (^~(&$signed((8'hac))))));
          reg62 <= wire39[(4'hd):(3'h4)];
          reg63 <= $signed((~reg56));
        end
      else
        begin
          reg61 <= reg56[(1'h0):(1'h0)];
          reg62 <= $unsigned(reg58[(1'h1):(1'h1)]);
        end
      reg64 <= ($unsigned(reg54[(4'hb):(2'h3)]) ^~ {wire44});
    end
  always
    @(posedge clk) begin
      reg65 <= $unsigned((reg56 ?
          (~^($unsigned((8'hbf)) > (~|reg46))) : $unsigned(($signed(reg51) ?
              $unsigned(reg54) : $unsigned(reg63)))));
      reg66 <= ((8'hac) ? (7'h44) : (+(8'h9d)));
      reg67 <= (reg62[(4'hc):(2'h3)] ?
          (&($unsigned((~reg61)) - {(~|wire49),
              (8'h9f)})) : ((+{wire44[(1'h0):(1'h0)],
              $signed(wire40)}) | (~|(&(reg60 || wire42)))));
      reg68 <= (reg52 ~^ ((7'h42) ?
          (|(wire45[(1'h1):(1'h0)] <<< (reg58 << reg55))) : ((^$unsigned(reg54)) ?
              wire49[(2'h2):(1'h0)] : (wire41 ?
                  (reg60 || reg60) : reg66[(3'h5):(1'h0)]))));
      reg69 <= (reg66[(4'h8):(3'h4)] <<< ($signed((+(wire43 - wire38))) | $unsigned((8'ha3))));
    end
  assign wire70 = ($unsigned($unsigned($unsigned(reg50[(4'ha):(3'h7)]))) == (8'haa));
  always
    @(posedge clk) begin
      reg71 <= $unsigned($signed({reg63[(5'h11):(3'h6)],
          wire38[(2'h3):(1'h0)]}));
      reg72 <= (reg58[(1'h1):(1'h0)] != ((&$signed($unsigned(reg60))) ?
          ((~|$unsigned(reg53)) + $signed($unsigned(reg58))) : wire70[(3'h4):(3'h4)]));
      reg73 <= {wire45[(2'h3):(2'h2)],
          $unsigned($unsigned(wire70[(2'h3):(1'h1)]))};
      reg74 <= reg60;
      if (reg64[(1'h1):(1'h0)])
        begin
          if ({(reg48[(3'h4):(2'h3)] || ((reg53[(4'h9):(2'h3)] * (^~wire38)) ^~ $unsigned(wire41[(3'h4):(1'h0)]))),
              (&{$signed((-wire49))})})
            begin
              reg75 <= $unsigned($unsigned((reg58 ?
                  (wire70[(1'h1):(1'h1)] && $unsigned((8'ha0))) : $unsigned($signed(wire41)))));
              reg76 <= $signed((|((^~(wire39 | reg65)) >= $signed($signed(reg72)))));
              reg77 <= $unsigned((8'ha2));
            end
          else
            begin
              reg75 <= reg52;
              reg76 <= ((reg77[(3'h5):(2'h3)] ? reg57 : wire41[(1'h0):(1'h0)]) ?
                  (~|$unsigned(($signed((8'hba)) <= reg55[(4'h8):(3'h7)]))) : ($unsigned(({reg48} ?
                          $signed(reg73) : reg52[(2'h2):(1'h0)])) ?
                      $signed($signed((reg51 ? (8'ha7) : reg64))) : reg72));
              reg77 <= reg66[(3'h7):(3'h5)];
            end
          reg78 <= $unsigned($signed(reg61));
        end
      else
        begin
          reg75 <= reg64;
          reg76 <= (!reg66[(4'h9):(3'h5)]);
          if ($unsigned($signed(reg46[(4'hf):(3'h6)])))
            begin
              reg77 <= $unsigned($signed((reg55 ?
                  $signed((reg55 ? reg68 : reg47)) : reg58[(1'h1):(1'h0)])));
              reg78 <= (reg66[(1'h0):(1'h0)] > ($unsigned(((~^reg75) ?
                      wire42[(1'h0):(1'h0)] : (~&wire40))) ?
                  $signed($signed($unsigned(wire40))) : $unsigned((&(~&(8'hb8))))));
              reg79 <= (reg62[(4'hd):(4'hc)] != wire45[(1'h0):(1'h0)]);
              reg80 <= (+((wire42 ?
                      ((reg55 - (8'ha1)) >>> (wire42 ?
                          reg56 : (8'hb5))) : (~$unsigned(reg62))) ?
                  $unsigned($unsigned((reg55 ?
                      reg67 : wire40))) : (~$unsigned(reg76[(4'he):(1'h0)]))));
              reg81 <= ((~|{(^~reg54[(4'hd):(2'h2)]),
                      (reg74 ? (-(8'ha8)) : (~|reg62))}) ?
                  (|(+reg73)) : $signed(reg53[(2'h3):(1'h1)]));
            end
          else
            begin
              reg77 <= ($signed((-$signed($unsigned(reg47)))) - {wire38[(1'h1):(1'h0)]});
            end
        end
    end
  assign wire82 = ($signed((wire43 != reg62)) ^ (&{$signed((reg73 ?
                          reg77 : reg74))}));
  assign wire83 = reg75;
  assign wire84 = {(8'had), reg72[(4'hf):(4'hd)]};
  assign wire85 = $signed((+$signed(($unsigned(reg47) ^ reg52))));
  assign wire86 = reg65[(4'he):(1'h1)];
  assign wire87 = (+$unsigned(reg61));
  assign wire88 = reg74;
  assign wire89 = reg64[(2'h3):(2'h3)];
endmodule
