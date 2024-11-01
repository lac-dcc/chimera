module top
#(parameter param145 = {(!((((8'ha9) ? (7'h40) : (7'h44)) < (^~(8'haf))) ? {((8'haf) + (8'haf))} : (~&(8'hb1))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire138;
  wire signed [(4'hb):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire136;
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  assign y = {wire138,
                 wire60,
                 wire46,
                 wire44,
                 wire4,
                 wire102,
                 wire136,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 (1'h0)};
  assign wire4 = wire3;
  module5 #() modinst45 (wire44, clk, wire0, wire4, wire1, wire2);
  assign wire46 = ($unsigned(wire4[(4'he):(4'hc)]) * ($unsigned(wire44[(4'hf):(4'he)]) && $unsigned({$signed((8'ha2)),
                      (-(8'h9c))})));
  module47 #() modinst61 (.wire51(wire1), .wire50(wire46), .y(wire60), .wire49(wire2), .wire52(wire3), .wire48(wire44), .clk(clk));
  module62 #() modinst103 (wire102, clk, wire3, wire1, wire60, wire2);
  module104 #() modinst137 (.clk(clk), .wire106(wire2), .wire109(wire4), .wire108(wire46), .wire107(wire60), .y(wire136), .wire105(wire0));
  assign wire138 = (&wire4[(5'h12):(4'h9)]);
  always
    @(posedge clk) begin
      if ((wire138 ?
          (&wire4) : (-((|(~(7'h41))) ?
              $unsigned($unsigned((8'ha2))) : wire3))))
        begin
          reg139 <= wire46[(4'hb):(1'h0)];
        end
      else
        begin
          if ((^~$unsigned(wire138[(1'h1):(1'h0)])))
            begin
              reg139 <= reg139[(3'h5):(3'h4)];
              reg140 <= {wire44};
              reg141 <= $signed(wire60);
              reg142 <= wire1;
              reg143 <= wire3;
            end
          else
            begin
              reg139 <= (8'ha4);
              reg140 <= (-$signed((^(!(wire46 ? wire60 : wire1)))));
              reg141 <= reg142[(2'h3):(2'h3)];
              reg142 <= (!{(~^((-reg141) ?
                      (reg140 != (8'hbb)) : (wire0 ? wire2 : wire0))),
                  wire2[(3'h4):(1'h0)]});
            end
          reg144 <= ($signed(wire3[(5'h10):(2'h3)]) ?
              (|(wire4 << (((8'h9f) ? wire136 : wire4) ?
                  $signed(wire3) : $unsigned(wire4)))) : (|reg143[(1'h1):(1'h1)]));
        end
    end
endmodule

module module104
#(parameter param134 = ((((((8'hae) <= (8'hb6)) ? ((7'h41) != (8'ha6)) : ((8'ha3) || (8'hab))) << (((8'had) | (8'hb6)) ? ((8'hac) || (8'ha4)) : (|(8'hbf)))) || (!((|(8'haa)) ? ((8'hb2) | (8'hbe)) : ((8'hb0) == (7'h44))))) ? (8'h9c) : ({(!((8'ha4) < (8'h9d)))} ? (^~({(8'haa)} ? ((7'h42) ? (8'hac) : (8'hb3)) : ((8'hb8) <= (8'ha9)))) : (~^(((8'had) >> (8'h9e)) != ((8'hb0) > (8'hb4)))))), 
parameter param135 = (|param134))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire109;
  input wire [(5'h14):(1'h0)] wire108;
  input wire signed [(3'h6):(1'h0)] wire107;
  input wire [(4'hb):(1'h0)] wire106;
  input wire signed [(3'h4):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire133;
  wire signed [(4'hf):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire126;
  wire [(4'hc):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire signed [(3'h4):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(3'h4):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg116 = (1'h0);
  assign y = {wire133,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire110 = ({(wire107 ?
                           $signed((-wire108)) : $signed((wire106 ?
                               wire109 : wire107)))} ^~ $unsigned((8'ha0)));
  assign wire111 = wire108;
  assign wire112 = $unsigned(($signed((wire108 > (~wire111))) ?
                       (^~(-wire106)) : ($signed({wire109}) ~^ wire107[(3'h5):(1'h0)])));
  assign wire113 = $unsigned((wire110[(1'h0):(1'h0)] ?
                       {{$signed(wire107), wire108},
                           (~|(wire110 ? wire107 : wire107))} : wire111));
  assign wire114 = ({$signed(wire112), wire110} ?
                       wire105[(2'h3):(2'h2)] : $signed(wire110));
  assign wire115 = wire108[(5'h10):(3'h4)];
  always
    @(posedge clk) begin
      reg116 <= (~&(&$unsigned({$signed((8'hb8)),
          (wire105 ? wire111 : wire108)})));
      reg117 <= (wire108 <= {wire106});
    end
  assign wire118 = (reg117[(3'h6):(2'h2)] ?
                       ($signed({(wire105 ? reg116 : wire115),
                           $signed(wire110)}) >>> (~(((7'h40) ?
                           (7'h41) : (7'h40)) >> (wire107 ?
                           reg116 : wire105)))) : reg116[(4'he):(4'h8)]);
  assign wire119 = wire113[(1'h1):(1'h1)];
  assign wire120 = (8'ha7);
  assign wire121 = ({(wire108[(4'hc):(3'h6)] ?
                           $unsigned(wire118[(2'h3):(1'h1)]) : $signed((wire112 >>> wire106)))} != (8'hbe));
  assign wire122 = {($signed({reg116}) ?
                           {wire109,
                               (~|((8'hb1) >> wire118))} : ($signed((^wire109)) ?
                               wire110 : wire110[(4'h8):(3'h6)])),
                       $signed(((^(wire113 | wire119)) ?
                           (|(wire113 ? (8'ha8) : wire111)) : (|{(7'h44)})))};
  assign wire123 = wire107;
  assign wire124 = (!$unsigned((reg116[(4'h9):(1'h1)] >> wire122)));
  assign wire125 = (wire105 != $signed(wire121));
  assign wire126 = ($signed(reg116) && reg116);
  assign wire127 = $signed({((8'hb1) ? reg117 : wire110)});
  always
    @(posedge clk) begin
      if ((((wire127 ? $signed(((7'h43) ^~ wire122)) : wire115) ?
          wire112 : (((^~wire110) ?
              $signed(wire112) : $unsigned(wire123)) ^ (-(reg116 ?
              wire122 : (8'hae))))) ~^ wire115[(3'h5):(3'h4)]))
        begin
          reg128 <= (wire115[(5'h14):(5'h13)] ? reg116 : $unsigned((~wire108)));
        end
      else
        begin
          reg128 <= $unsigned(($signed(((&wire122) ?
                  $unsigned(wire119) : (wire111 <= wire125))) ?
              (wire123 ?
                  {(wire108 ? wire121 : wire105),
                      (wire125 <<< wire110)} : ({wire122} ?
                      $signed(wire112) : wire112)) : (^~$unsigned($signed((8'hb2))))));
          reg129 <= (((|wire105) ?
                  (^~(((8'hb0) ? (8'hbf) : wire127) ?
                      (wire126 ?
                          (8'hb9) : (8'hb5)) : wire106[(3'h4):(3'h4)])) : $unsigned($signed((wire126 ?
                      wire115 : wire127)))) ?
              $signed(($signed({wire122}) ?
                  wire115[(2'h3):(2'h3)] : ((~|(8'hb9)) ?
                      (wire120 ^ wire122) : $unsigned((8'h9d))))) : ($signed($signed((wire105 ?
                      wire123 : wire107))) ?
                  (((!wire122) ? (~&wire119) : $signed(wire111)) ?
                      (+(wire106 | (8'hba))) : $signed(reg116)) : wire106));
          reg130 <= $signed($signed(((~&$unsigned(wire122)) ?
              {$signed(wire109), {wire105, wire125}} : ((wire115 << wire112) ?
                  $signed(wire124) : {wire111, wire113}))));
        end
      reg131 <= wire122;
      reg132 <= (8'hac);
    end
  assign wire133 = $unsigned(({$signed({wire114}),
                       $unsigned($unsigned(wire122))} <<< wire115[(4'h9):(3'h6)]));
endmodule

module module62  (y, clk, wire63, wire64, wire65, wire66);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire63;
  input wire [(4'hd):(1'h0)] wire64;
  input wire signed [(4'h8):(1'h0)] wire65;
  input wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire91;
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire72,
                 wire75,
                 wire91,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg74,
                 reg73,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg67 <= (~$unsigned($unsigned(wire63[(4'h8):(3'h5)])));
      reg68 <= (~|{wire63, reg67[(1'h0):(1'h0)]});
      reg69 <= wire64[(2'h3):(2'h2)];
      reg70 <= (8'hbd);
      reg71 <= (&(wire64 ^~ $signed($unsigned($signed(reg69)))));
    end
  assign wire72 = $unsigned(reg69);
  always
    @(posedge clk) begin
      reg73 <= $signed(wire63);
      reg74 <= ((wire64 && $unsigned({(|reg69)})) ?
          reg67[(1'h0):(1'h0)] : ((({(8'hb4)} ?
                  wire63[(1'h0):(1'h0)] : (reg71 ?
                      wire65 : (8'hbe))) - (+(reg71 ? (8'hbb) : wire64))) ?
              reg70[(2'h3):(1'h0)] : (~&($unsigned(wire72) ?
                  (&reg67) : $unsigned(reg73)))));
    end
  assign wire75 = wire63[(2'h3):(2'h2)];
  module76 #() modinst92 (.wire80(wire63), .wire79(reg69), .wire81(reg74), .clk(clk), .wire77(wire75), .y(wire91), .wire78(wire66));
  always
    @(posedge clk) begin
      reg93 <= (8'h9f);
      reg94 <= reg69[(1'h1):(1'h0)];
      if ($unsigned((&{(((8'hbf) ^ wire64) ?
              reg69[(2'h2):(2'h2)] : ((8'haf) << reg67)),
          reg68[(1'h1):(1'h0)]})))
        begin
          reg95 <= reg94[(5'h13):(4'he)];
          reg96 <= $unsigned($signed({reg94}));
        end
      else
        begin
          reg95 <= $signed((^~($signed($signed(wire66)) == $unsigned(reg70))));
          reg96 <= reg73;
        end
      reg97 <= wire72[(3'h7):(3'h4)];
    end
  assign wire98 = $signed(($unsigned(($signed(reg95) ?
                          reg69 : $unsigned(wire65))) ?
                      wire64[(2'h2):(1'h0)] : $signed($unsigned((reg68 <= reg94)))));
  assign wire99 = (($signed($unsigned((^wire64))) ^ (+(+(reg67 == reg67)))) ?
                      (^~$signed((8'h9d))) : ((((reg97 ?
                          reg70 : wire64) || (wire72 * wire98)) <= $unsigned((wire63 ?
                          reg97 : reg70))) == reg96));
  assign wire100 = reg97[(4'hd):(1'h1)];
  assign wire101 = {(&reg73[(2'h2):(1'h1)]),
                       $unsigned(((reg96 ?
                               reg95[(1'h0):(1'h0)] : $signed(wire91)) ?
                           reg68[(2'h3):(2'h3)] : ($unsigned(wire65) ?
                               reg68[(2'h3):(1'h1)] : reg70)))};
endmodule

module module47
#(parameter param59 = {(^~(~|(^~(|(8'hb4))))), {((((8'ha9) ? (8'hbe) : (8'hbe)) ? (^~(8'hb9)) : (8'h9c)) >> (((8'hb7) ? (8'hb7) : (8'h9e)) ? (^(8'ha2)) : (^~(8'hbb))))}})
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire52;
  input wire [(4'hd):(1'h0)] wire51;
  input wire signed [(4'ha):(1'h0)] wire50;
  input wire signed [(5'h12):(1'h0)] wire49;
  input wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  assign y = {wire58, wire57, wire56, wire54, wire53, reg55, (1'h0)};
  assign wire53 = wire48[(4'he):(4'hc)];
  assign wire54 = {((((wire50 ? (8'h9f) : (8'had)) ?
                              $unsigned(wire52) : $unsigned(wire50)) ?
                          ((wire51 >>> wire51) & (wire52 >>> wire53)) : wire49[(2'h3):(1'h1)]) >> (wire52 ?
                          $unsigned(wire53) : {(wire52 >> wire51),
                              $unsigned((8'hba))}))};
  always
    @(posedge clk) begin
      reg55 <= {$unsigned((wire49 || wire49)),
          (wire52[(2'h3):(2'h2)] << $signed((wire49 ?
              (wire50 ? wire49 : wire54) : wire51)))};
    end
  assign wire56 = $signed($signed(wire49[(2'h2):(2'h2)]));
  assign wire57 = ($unsigned({$unsigned($signed(wire48))}) ^ ($signed($signed((wire48 ?
                          reg55 : wire50))) ?
                      {wire50,
                          wire53[(2'h3):(2'h3)]} : (reg55 ^ $unsigned($signed(wire49)))));
  assign wire58 = wire48[(4'ha):(1'h1)];
endmodule

module module5
#(parameter param43 = ((!((~|((8'h9c) ? (8'h9f) : (7'h40))) ? ({(8'ha3)} ? {(8'h9e), (8'had)} : ((8'hbc) < (8'haa))) : (-(+(8'ha1))))) ^~ (|{(((7'h44) ? (8'haa) : (8'hb2)) ? {(8'ha8)} : ((8'hb5) ? (8'ha8) : (8'hbe))), (((8'ha2) ~^ (8'ha6)) ? ((7'h40) ? (8'h9c) : (8'hb1)) : {(8'h9d), (7'h43)})})))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(3'h5):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire33,
                 wire24,
                 wire23,
                 wire22,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire10 = wire9[(4'ha):(1'h0)];
  assign wire11 = ($signed(({((8'hb9) > (7'h42))} < wire6[(3'h5):(2'h3)])) >= $unsigned(wire6));
  assign wire12 = (wire7[(4'hb):(1'h0)] || $signed(((wire8 >>> ((8'hb9) ^ wire6)) + ({(8'hb0)} ?
                      (|wire9) : {(8'haf), wire6}))));
  assign wire13 = $signed({$signed((wire12 ? (wire7 * wire11) : {wire11}))});
  always
    @(posedge clk) begin
      if ($signed(wire11[(3'h5):(2'h2)]))
        begin
          reg14 <= $unsigned((((~&(wire8 || wire12)) ? wire7 : wire7) ?
              (|(wire7 && (^~wire10))) : $unsigned(($signed(wire8) ?
                  wire11[(3'h6):(2'h3)] : (wire11 ? (8'hb5) : wire8)))));
          reg15 <= (-$signed(wire9[(5'h11):(4'ha)]));
          reg16 <= $unsigned(((&((~|wire7) ?
              $signed(reg15) : $unsigned(wire9))) - ((wire13[(3'h5):(1'h0)] == $unsigned(reg14)) ?
              $unsigned($unsigned((8'ha5))) : (^reg15))));
          if (wire7)
            begin
              reg17 <= (~|(8'ha2));
            end
          else
            begin
              reg17 <= (8'h9e);
              reg18 <= $signed(((~^(|(|reg15))) < {$unsigned((wire8 ^~ (8'haa)))}));
            end
          reg19 <= $signed(reg18);
        end
      else
        begin
          reg14 <= wire10;
          reg15 <= (8'ha8);
        end
      reg20 <= (wire13[(1'h0):(1'h0)] ?
          $unsigned((8'h9d)) : reg19[(2'h3):(2'h2)]);
      reg21 <= reg14;
    end
  assign wire22 = wire7[(4'hd):(4'ha)];
  assign wire23 = wire8[(1'h0):(1'h0)];
  assign wire24 = $unsigned(wire9[(4'ha):(4'ha)]);
  always
    @(posedge clk) begin
      reg25 <= $unsigned(wire9);
      reg26 <= (reg20[(4'hf):(3'h4)] ? $unsigned($unsigned(wire11)) : reg21);
      if ($signed((((~$unsigned(reg26)) ?
              {reg18} : $signed(wire23[(4'hb):(1'h1)])) ?
          {$signed(reg26)} : ($unsigned(reg15) ?
              ($signed(reg19) ?
                  ((7'h44) ~^ (8'hb7)) : (reg25 * wire12)) : wire13[(2'h3):(2'h2)]))))
        begin
          reg27 <= wire22;
          if ((wire7 ?
              (~&reg19[(1'h1):(1'h0)]) : $unsigned((^~$signed($unsigned(reg14))))))
            begin
              reg28 <= (8'hb5);
              reg29 <= reg17;
            end
          else
            begin
              reg28 <= (reg15[(4'hd):(2'h2)] ?
                  (wire6[(2'h2):(1'h1)] + $signed(((reg29 ?
                      reg18 : reg18) + $unsigned(wire22)))) : ($signed($unsigned((&wire7))) <<< (^wire10[(1'h1):(1'h1)])));
            end
          reg30 <= $signed(wire7);
          reg31 <= {(7'h44), (~$unsigned(((~reg27) || wire13[(2'h3):(2'h3)])))};
        end
      else
        begin
          if ($signed($unsigned($signed({reg25[(3'h4):(2'h3)], (~^reg27)}))))
            begin
              reg27 <= wire23[(4'hc):(1'h1)];
              reg28 <= $signed(((wire10[(2'h3):(2'h2)] > (^~(~^wire11))) ?
                  reg15 : {$unsigned(reg21[(4'ha):(3'h5)]),
                      $signed((wire11 > reg29))}));
              reg29 <= ((((~|(!reg26)) ?
                  (reg25[(5'h10):(3'h6)] <<< $signed(reg21)) : $unsigned((wire13 ?
                      reg29 : (8'had)))) ^~ wire22) - (!(~^(&$unsigned(wire7)))));
              reg30 <= ((($signed($unsigned(wire8)) ?
                          ((wire23 > (8'h9d)) << ((8'ha0) | (7'h43))) : $unsigned((wire23 ?
                              reg15 : reg17))) ?
                      reg19 : $unsigned(wire9)) ?
                  reg21[(5'h11):(3'h4)] : reg16[(1'h1):(1'h1)]);
            end
          else
            begin
              reg27 <= ((~^(($signed(wire9) ? reg21[(3'h6):(3'h4)] : wire10) ?
                  reg30[(2'h2):(2'h2)] : (^~reg14[(3'h6):(2'h3)]))) & reg14[(3'h4):(2'h2)]);
              reg28 <= (~|((($unsigned((8'hbc)) ?
                      (~^(8'haf)) : reg21[(4'h8):(3'h6)]) | ((~reg26) ?
                      $unsigned((7'h44)) : $unsigned(reg30))) ?
                  $signed(wire10) : (&reg30)));
              reg29 <= (!$unsigned(reg21[(3'h7):(3'h7)]));
            end
        end
      reg32 <= wire10;
    end
  assign wire33 = reg29[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg34 <= (($signed((+(^~reg29))) || (7'h42)) & wire33[(1'h1):(1'h1)]);
      if (($unsigned($unsigned($signed($unsigned(reg21)))) ?
          ((((wire22 ? (8'ha6) : wire7) * (reg25 ? wire11 : reg17)) ?
              $unsigned($signed((8'ha8))) : ({wire7, wire11} ?
                  (reg21 ?
                      wire24 : reg28) : (7'h40))) >= $unsigned($unsigned(reg21))) : {reg15[(4'h9):(4'h8)],
              wire33}))
        begin
          reg35 <= reg15;
          if (wire12)
            begin
              reg36 <= ($signed(wire10) ?
                  (^~($signed(wire23[(4'ha):(3'h7)]) || $signed(wire33[(2'h3):(1'h0)]))) : $signed(reg21));
              reg37 <= ({(reg34[(4'hc):(3'h6)] < {(~wire6), $signed((8'hae))}),
                      (reg16[(1'h0):(1'h0)] ?
                          reg32[(2'h3):(1'h0)] : (((8'ha4) < reg32) >>> (reg29 ?
                              reg30 : wire6)))} ?
                  ($unsigned((|((8'h9f) ^~ (8'hb7)))) && $unsigned($signed((wire23 + (8'hbc))))) : ({reg31[(4'hc):(1'h0)]} ?
                      $unsigned((-wire33)) : (-reg14[(3'h5):(2'h3)])));
              reg38 <= ($signed($unsigned($unsigned((reg37 >= reg15)))) ^~ ((8'haa) * reg25));
            end
          else
            begin
              reg36 <= (8'hb7);
              reg37 <= (8'hac);
              reg38 <= (wire7[(3'h4):(1'h1)] ?
                  (wire6 ?
                      wire11[(1'h0):(1'h0)] : ($signed(wire6[(3'h4):(1'h0)]) < {wire10[(1'h1):(1'h0)]})) : reg25);
              reg39 <= (8'ha8);
            end
        end
      else
        begin
          reg35 <= wire24;
        end
    end
  assign wire40 = ($unsigned(wire10[(1'h1):(1'h0)]) || (~|($signed(wire7[(3'h6):(1'h1)]) - reg38)));
  assign wire41 = wire22;
  assign wire42 = wire33;
endmodule

module module76
#(parameter param89 = (8'ha8), 
parameter param90 = {{(((8'hb2) ? (^~(7'h42)) : (^param89)) ? ({param89} >> (~|param89)) : param89), ((param89 ? param89 : param89) ? {(~^param89)} : param89)}, param89})
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire81;
  input wire [(3'h6):(1'h0)] wire80;
  input wire signed [(4'hc):(1'h0)] wire79;
  input wire [(4'hb):(1'h0)] wire78;
  input wire [(4'h8):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire [(3'h4):(1'h0)] wire82;
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  assign y = {wire87, wire85, wire84, wire83, wire82, reg88, reg86, (1'h0)};
  assign wire82 = (&{wire79});
  assign wire83 = wire79[(3'h6):(1'h0)];
  assign wire84 = wire79;
  assign wire85 = wire80;
  always
    @(posedge clk) begin
      reg86 <= wire77[(3'h7):(2'h3)];
    end
  assign wire87 = (((+(8'hb5)) ~^ (!wire77[(2'h3):(2'h2)])) <<< wire82[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg88 <= ({(+$unsigned((wire77 ? wire77 : wire80))),
              $signed(wire80[(3'h6):(3'h4)])} ?
          $unsigned((wire81[(5'h12):(4'hd)] ?
              ($signed(wire85) ?
                  wire78[(3'h5):(1'h1)] : (-wire77)) : (~&$signed(wire87)))) : wire83);
    end
endmodule
