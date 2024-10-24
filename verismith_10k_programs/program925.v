module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire156;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  assign y = {wire156,
                 wire25,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg9,
                 reg10,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  assign wire5 = ((8'ha3) >> ((^~wire3) << ((~&(^~wire0)) == ($signed((8'hba)) ?
                     $unsigned(wire1) : {wire3}))));
  assign wire6 = $unsigned({$unsigned(wire2),
                     $unsigned($unsigned((wire1 <<< wire1)))});
  assign wire7 = (wire4 || wire1[(4'hb):(3'h4)]);
  assign wire8 = wire5;
  always
    @(posedge clk) begin
      reg9 <= wire8[(4'h8):(1'h1)];
      reg10 <= $unsigned(($signed($unsigned((wire8 ^ wire3))) != {wire1,
          {(wire4 >> wire3), wire2}}));
    end
  assign wire11 = wire5[(4'hc):(4'hb)];
  assign wire12 = $unsigned(wire11[(3'h4):(2'h2)]);
  assign wire13 = $unsigned($unsigned(($signed((&wire12)) >= {(~wire6)})));
  assign wire14 = wire4[(4'hd):(3'h7)];
  assign wire15 = $signed(wire1);
  assign wire16 = ($signed((!wire14)) ?
                      $unsigned(wire5[(4'ha):(3'h4)]) : (~|reg10[(4'hd):(4'hd)]));
  assign wire17 = (((({wire14} ?
                      (reg10 ?
                          wire12 : wire5) : wire14) | (~^$unsigned((8'h9f)))) && {wire11[(4'h9):(3'h5)]}) | wire4);
  assign wire18 = $unsigned((wire5 << wire16));
  always
    @(posedge clk) begin
      reg19 <= $signed(((wire6 < (wire1[(3'h5):(3'h5)] ?
              (wire4 ? wire11 : wire8) : $unsigned(wire2))) ?
          (!wire5) : (wire18 ?
              wire3[(1'h1):(1'h1)] : ((&wire18) ?
                  (wire4 ? wire5 : wire13) : wire1[(1'h1):(1'h0)]))));
      if ($unsigned({reg10, {$signed($signed(wire17)), (~&wire11)}}))
        begin
          reg20 <= (^wire4);
          reg21 <= ((~^(($signed(reg9) ? wire2 : {reg20}) ?
                  reg10 : {{wire3}})) ?
              {($unsigned($unsigned(wire7)) ? $signed(wire14) : (&reg9)),
                  (8'ha5)} : (wire5[(2'h3):(1'h0)] & (!wire16[(3'h6):(3'h6)])));
          reg22 <= $signed({wire0[(1'h0):(1'h0)]});
          reg23 <= (($unsigned(wire7) ?
                  (wire1[(2'h2):(1'h1)] ^ ((wire0 <<< wire4) ?
                      wire14 : (~^wire3))) : ($unsigned(reg22[(4'hb):(4'h8)]) ?
                      (8'ha6) : wire4)) ?
              (-(^~wire17[(1'h1):(1'h1)])) : ((^($unsigned(wire18) ?
                  wire3 : reg22[(2'h2):(2'h2)])) - wire3[(1'h1):(1'h0)]));
          reg24 <= ((~^({wire7[(4'h8):(2'h2)]} ?
              ($signed(wire2) ?
                  reg22 : $unsigned((8'haa))) : wire2)) >> ((-((wire11 > reg9) & (|wire1))) ?
              $unsigned((wire1[(3'h5):(1'h1)] && (wire0 + wire17))) : ($unsigned((wire11 < (8'hb0))) <<< wire12)));
        end
      else
        begin
          reg20 <= $unsigned($signed(($unsigned({wire12, wire17}) ?
              reg24[(4'hf):(1'h0)] : reg21[(3'h4):(1'h0)])));
          reg21 <= (^($unsigned($unsigned($unsigned(wire18))) ?
              ((&$unsigned(wire5)) || $unsigned((wire15 ?
                  wire8 : wire1))) : (!$signed($unsigned(wire1)))));
          reg22 <= reg21[(4'h8):(2'h3)];
        end
    end
  assign wire25 = wire5[(4'hb):(4'h8)];
  module26 #() modinst157 (.y(wire156), .wire31(reg9), .clk(clk), .wire29(wire0), .wire27(reg23), .wire30(reg19), .wire28(wire1));
endmodule

module module26
#(parameter param155 = (8'ha0))
(y, clk, wire27, wire28, wire29, wire30, wire31);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire27;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire143;
  wire [(5'h11):(1'h0)] wire142;
  wire signed [(4'hb):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire79;
  reg signed [(4'hf):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire140,
                 wire86,
                 wire85,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg84,
                 (1'h0)};
  module32 #() modinst80 (wire79, clk, wire29, wire28, wire27, wire31, wire30);
  assign wire81 = $signed($unsigned((-wire79)));
  assign wire82 = wire27;
  assign wire83 = wire28;
  always
    @(posedge clk) begin
      reg84 <= (7'h44);
    end
  assign wire85 = wire79;
  assign wire86 = $signed($signed((~^$signed($signed(wire29)))));
  module87 #() modinst141 (.wire91(wire31), .wire89(wire30), .clk(clk), .wire88(reg84), .y(wire140), .wire92(wire81), .wire90(wire28));
  assign wire142 = ($unsigned(({wire140,
                       (wire30 ?
                           wire81 : wire83)} || wire140)) >= ((&(-(-wire29))) ?
                       $signed($unsigned($signed(wire27))) : $signed($unsigned((wire82 ?
                           wire29 : wire28)))));
  assign wire143 = {wire86[(3'h4):(3'h4)]};
  always
    @(posedge clk) begin
      reg144 <= $signed({(&(~^(wire28 ? wire85 : wire28)))});
      reg145 <= $unsigned(wire83[(3'h7):(2'h2)]);
      reg146 <= wire82[(4'h8):(3'h4)];
      if ((($unsigned(wire143) ?
              ($unsigned(reg84[(4'h8):(2'h2)]) | $unsigned((^reg146))) : wire86) ?
          (wire30 ? wire140 : (8'ha6)) : $unsigned((~^wire85))))
        begin
          reg147 <= $unsigned($unsigned($signed(wire30)));
          reg148 <= (&($signed(wire27[(1'h1):(1'h0)]) ?
              (wire83[(3'h5):(3'h5)] ?
                  (wire82 ?
                      wire143 : (reg84 ^~ wire82)) : (^~wire31)) : $unsigned($unsigned((reg146 && wire31)))));
          if ((-(wire27 ?
              ($signed($unsigned(reg144)) ?
                  reg144 : $unsigned({reg148,
                      wire27})) : (-wire82[(3'h7):(1'h1)]))))
            begin
              reg149 <= $signed($unsigned(($unsigned(((8'hb0) && reg146)) ?
                  wire142[(1'h0):(1'h0)] : ({wire82,
                      (8'hb6)} + $signed(wire143)))));
              reg150 <= $signed(((wire85[(3'h7):(3'h4)] >> $signed($signed(wire85))) <= $unsigned(wire142)));
              reg151 <= $unsigned(($unsigned({wire79[(1'h1):(1'h0)],
                      (reg149 ? wire85 : (7'h40))}) ?
                  (!((8'ha1) * (wire143 <<< wire83))) : wire31[(4'hf):(2'h3)]));
              reg152 <= reg150[(2'h2):(1'h1)];
            end
          else
            begin
              reg149 <= ((8'hab) > (!($unsigned($signed(wire31)) ?
                  $signed($unsigned(wire79)) : $unsigned(reg152))));
            end
          reg153 <= {(|$signed($signed((!reg147))))};
          reg154 <= $signed(wire31[(4'hc):(4'h9)]);
        end
      else
        begin
          reg147 <= wire81;
          reg148 <= $signed(wire28[(1'h1):(1'h1)]);
          reg149 <= $unsigned($unsigned((|((reg150 ? wire83 : (8'h9f)) ?
              (reg147 << wire27) : reg144[(4'hc):(3'h4)]))));
          if ((wire27 ?
              $signed($signed((^(reg147 < wire29)))) : (-($signed(((8'ha6) ?
                      wire142 : reg151)) ?
                  ((|wire140) - reg154[(1'h0):(1'h0)]) : $signed((wire31 <= wire85))))))
            begin
              reg150 <= (^{reg146, $unsigned(wire86[(2'h2):(1'h0)])});
            end
          else
            begin
              reg150 <= $signed(wire142[(4'hc):(2'h3)]);
              reg151 <= $unsigned({(((8'h9e) * (reg152 ~^ reg151)) ?
                      ({reg84} - wire79) : (reg154 ?
                          (wire81 || wire82) : (wire31 > wire28)))});
              reg152 <= (8'ha4);
            end
        end
    end
endmodule

module module87
#(parameter param139 = (~^((((+(8'ha9)) * (~|(8'ha8))) >>> ((8'ha5) & {(8'hbd)})) >= (8'hb8))))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire92;
  input wire signed [(3'h4):(1'h0)] wire91;
  input wire [(4'ha):(1'h0)] wire90;
  input wire [(5'h12):(1'h0)] wire89;
  input wire signed [(3'h4):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire138;
  wire [(2'h3):(1'h0)] wire133;
  wire signed [(4'hf):(1'h0)] wire128;
  wire [(5'h14):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire126;
  wire [(4'ha):(1'h0)] wire123;
  wire signed [(3'h5):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  assign y = {wire138,
                 wire133,
                 wire128,
                 wire127,
                 wire126,
                 wire123,
                 wire122,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg125,
                 reg124,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
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
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((((^wire89[(3'h4):(3'h4)]) ?
          (+wire92) : ((wire88 ?
                  (wire90 ? (8'hb1) : wire90) : $unsigned((8'ha2))) ?
              $signed({wire92,
                  wire90}) : (wire89 <<< ((8'ha4) & wire92)))) <= $unsigned(wire92[(3'h7):(3'h7)])))
        begin
          reg93 <= (wire90[(3'h4):(1'h1)] == wire89);
          reg94 <= $unsigned(wire92);
          reg95 <= $unsigned({(~&wire88),
              $unsigned((wire90 ? wire89[(5'h11):(5'h10)] : (~wire92)))});
          reg96 <= {reg94};
        end
      else
        begin
          reg93 <= reg94[(4'ha):(1'h1)];
          reg94 <= $signed((~|(((wire90 ? reg93 : wire91) ?
              (!reg94) : (&wire92)) - $unsigned($signed(reg95)))));
        end
      if (reg96[(5'h12):(3'h7)])
        begin
          reg97 <= (reg96[(4'h9):(3'h7)] ~^ $signed((^~($signed(reg96) | $signed(wire92)))));
          reg98 <= $signed((({((8'haa) * wire91)} | $signed((~^wire89))) ?
              $signed(((reg95 ? wire89 : wire92) | (wire88 ?
                  reg97 : (8'hac)))) : reg96));
          if ($signed($signed(wire89)))
            begin
              reg99 <= $unsigned($unsigned(($signed((~^wire91)) ?
                  {(wire90 > (7'h44))} : ($unsigned(reg97) ?
                      reg95[(1'h1):(1'h0)] : (8'hae)))));
              reg100 <= $unsigned($signed({($unsigned(reg98) ?
                      ((8'hae) ? wire90 : reg95) : $unsigned(reg96)),
                  wire90}));
            end
          else
            begin
              reg99 <= (wire90[(1'h1):(1'h1)] ?
                  $unsigned((($signed(wire90) ?
                      {(8'h9e)} : (reg97 ?
                          (8'ha7) : reg96)) ^ reg98[(4'hb):(4'hb)])) : ($signed(($unsigned((8'h9c)) ?
                          $signed(wire91) : $signed((8'ha7)))) ?
                      wire90 : (((reg97 <= (8'hbb)) || (-wire89)) ?
                          $unsigned($signed(wire90)) : wire92[(4'h9):(3'h4)])));
              reg100 <= reg93[(4'hc):(3'h5)];
              reg101 <= (^reg98);
              reg102 <= reg94;
              reg103 <= ((reg97[(4'h8):(2'h2)] < wire90) ?
                  reg97[(3'h5):(2'h2)] : $unsigned($unsigned(({wire89} ?
                      $signed(wire88) : {wire92, wire90}))));
            end
        end
      else
        begin
          reg97 <= wire90;
          reg98 <= reg98[(4'hf):(4'he)];
          reg99 <= ((reg93 ?
              (^~(^~wire88[(1'h0):(1'h0)])) : (~&(+$unsigned(wire92)))) <<< ($signed(reg93) ^ $signed(reg100)));
          reg100 <= (wire90[(3'h6):(1'h0)] * $unsigned($signed(reg102[(1'h0):(1'h0)])));
        end
    end
  always
    @(posedge clk) begin
      if (($signed((~|wire92)) <= reg103[(1'h1):(1'h1)]))
        begin
          reg104 <= reg98[(5'h10):(3'h7)];
          reg105 <= ((8'hbe) ?
              (wire88[(1'h1):(1'h1)] ?
                  {($signed(reg101) ?
                          reg100[(3'h7):(2'h2)] : (wire91 ? wire88 : wire88)),
                      reg93} : reg93) : {$signed((wire92 != reg94)),
                  ($unsigned(reg104[(4'h8):(4'h8)]) ?
                      $unsigned(wire88) : wire92[(4'h9):(2'h2)])});
          reg106 <= {wire89[(5'h11):(2'h3)]};
        end
      else
        begin
          reg104 <= (~&reg105[(4'he):(4'hc)]);
          reg105 <= (^~$unsigned(reg95[(3'h5):(1'h1)]));
          reg106 <= {$signed((7'h42))};
          reg107 <= ({((wire92[(3'h6):(2'h3)] >>> (~^reg93)) ?
                      ($signed((8'hb3)) ?
                          reg106 : (~reg97)) : reg99[(4'hc):(1'h0)])} ?
              wire92[(2'h3):(1'h0)] : $signed(reg97[(3'h7):(3'h7)]));
        end
      reg108 <= {reg96, wire91};
      reg109 <= $signed({$unsigned(reg93), (7'h43)});
    end
  assign wire110 = (reg94 && ($signed(($unsigned(wire92) ?
                       {reg104,
                           reg95} : reg108[(3'h4):(2'h3)])) >= reg106[(2'h2):(1'h0)]));
  assign wire111 = reg95[(3'h5):(1'h1)];
  assign wire112 = (((wire88[(1'h0):(1'h0)] ?
                           (^~(reg100 ?
                               reg104 : (8'hb9))) : reg97) <= reg102[(1'h0):(1'h0)]) ?
                       $unsigned((-$unsigned($signed(reg97)))) : (($unsigned((wire110 | reg103)) ?
                           (|(reg105 ? reg98 : wire91)) : ((reg107 ?
                               reg106 : wire111) < (reg99 > wire91))) || $unsigned($unsigned(reg107))));
  assign wire113 = (8'ha6);
  assign wire114 = reg104;
  assign wire115 = {$unsigned({$unsigned(reg107)})};
  always
    @(posedge clk) begin
      if ((~(wire90 ^ wire112)))
        begin
          if ((~^({($unsigned(reg98) < (|(8'hb5)))} << (|{reg99[(5'h10):(3'h7)],
              $unsigned(reg101)}))))
            begin
              reg116 <= ($signed((((reg109 - wire114) ?
                      $unsigned(wire88) : (~&(8'had))) != {$signed(reg99),
                      (^(8'hbf))})) ?
                  {$unsigned((~&wire89)),
                      reg104[(4'h8):(3'h5)]} : $unsigned((((reg93 ?
                          wire92 : wire90) ^ (wire89 ? (8'hbc) : wire89)) ?
                      (~&(wire110 ^~ reg103)) : {(^(8'ha6)),
                          (reg106 ^ reg109)})));
              reg117 <= $signed(wire113);
              reg118 <= (8'had);
            end
          else
            begin
              reg116 <= $unsigned((8'hb6));
              reg117 <= (reg101 != $unsigned($unsigned((~&wire89))));
              reg118 <= (((~&$signed({wire114, reg93})) >>> $unsigned(({(8'hae),
                  (8'hae)} << $unsigned(reg103)))) << $unsigned((~|(wire112[(2'h2):(1'h1)] ?
                  reg118 : reg108[(2'h3):(2'h2)]))));
              reg119 <= $unsigned($unsigned((!((reg106 * (8'hab)) <<< wire90[(4'h9):(3'h4)]))));
            end
        end
      else
        begin
          reg116 <= ({wire110} ?
              (~$signed(reg99[(4'hb):(4'h9)])) : $unsigned(wire90[(3'h5):(3'h5)]));
          reg117 <= $signed((8'hb9));
          reg118 <= ((+($signed((+reg108)) ?
                  wire112 : {wire113[(1'h0):(1'h0)], $signed(reg100)})) ?
              wire90[(2'h2):(1'h1)] : {wire91[(1'h1):(1'h0)]});
          reg119 <= ($unsigned({$signed(reg98)}) - reg107);
        end
      reg120 <= (reg104 - $signed((~^($unsigned(reg119) == wire88[(2'h2):(1'h1)]))));
      reg121 <= $signed(((8'h9f) ?
          $unsigned(reg116) : (wire90[(4'ha):(3'h6)] - (8'hb6))));
    end
  assign wire122 = $unsigned(($unsigned($signed(wire111[(3'h6):(2'h2)])) || (~&((wire110 + reg97) ?
                       (reg102 ? reg117 : reg99) : {reg99, wire112}))));
  assign wire123 = wire112;
  always
    @(posedge clk) begin
      reg124 <= $unsigned((reg101 ? reg101 : $signed((8'haa))));
      reg125 <= ((~(~$signed({wire123}))) ?
          {$unsigned(wire90)} : (~&(((wire114 ? reg116 : wire112) ?
              $signed(wire113) : reg106[(2'h3):(1'h0)]) > ((8'hb1) ?
              {wire90, wire88} : (reg121 && reg98)))));
    end
  assign wire126 = reg117;
  assign wire127 = (&((^~(reg125 ?
                       (reg118 - reg99) : reg109[(1'h0):(1'h0)])) | reg98[(2'h3):(2'h2)]));
  assign wire128 = ((&$signed((((8'h9e) >>> reg98) ?
                           $signed(wire111) : (wire122 || reg109)))) ?
                       $signed(reg107[(3'h4):(1'h0)]) : $signed($unsigned(reg108)));
  always
    @(posedge clk) begin
      reg129 <= reg119;
      reg130 <= (wire127[(4'h9):(2'h3)] >>> {{$signed((~&wire91)),
              $signed(((8'ha3) ? reg99 : reg100))}});
      reg131 <= wire88[(3'h4):(3'h4)];
      reg132 <= (reg108 ?
          (&(&{(reg109 != wire89)})) : $unsigned((((reg93 ?
                  (7'h41) : (8'hb2)) >> $unsigned(wire127)) ?
              wire90 : wire88[(1'h1):(1'h1)])));
    end
  assign wire133 = reg109[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg134 <= ((~&$signed((~^{wire110}))) ?
          ($signed($signed(reg109[(3'h5):(3'h4)])) ?
              $signed(reg118) : ({(~|reg105), (reg107 ^~ reg109)} ?
                  {{(8'hac)}} : (wire115[(1'h1):(1'h0)] && reg119[(3'h6):(3'h5)]))) : reg130);
      reg135 <= $signed(reg121);
      if ({{(!((~|reg103) & reg121[(4'ha):(4'h9)])),
              ($unsigned($signed(wire113)) ?
                  ((^(8'ha0)) ?
                      wire113 : ((8'hbb) != reg120)) : $signed($signed(reg100)))},
          $signed($unsigned(reg118))})
        begin
          reg136 <= $signed(reg97[(4'hc):(4'hc)]);
        end
      else
        begin
          reg136 <= {reg117[(2'h2):(2'h2)]};
          reg137 <= ($unsigned($unsigned($unsigned(reg132))) ?
              (((reg108[(1'h1):(1'h0)] ^~ {(8'hbb)}) <= {reg135[(3'h6):(1'h1)],
                  (reg120 ?
                      reg102 : reg134)}) != $unsigned(((reg116 < (8'ha8)) < (wire112 * reg96)))) : reg107[(3'h7):(3'h7)]);
        end
    end
  assign wire138 = ((^~(wire110[(2'h2):(1'h0)] ^ (~(wire91 ?
                           reg104 : wire110)))) ?
                       wire91 : $unsigned((^~$signed((wire114 ?
                           reg119 : reg99)))));
endmodule

module module32
#(parameter param78 = ((((((8'hb5) != (8'ha8)) ? (^(8'had)) : (^~(8'hb0))) ? {((8'hb7) ? (8'hb1) : (8'hbc))} : ((&(8'hb0)) > ((8'hb7) + (8'ha7)))) || ((((8'hba) <= (8'hb9)) ~^ (8'hbf)) ? (|((8'hb3) ? (7'h41) : (8'hab))) : ({(8'haa)} && ((8'ha7) ? (8'h9e) : (8'hba))))) ? ((~&(~|((8'ha0) ? (8'ha2) : (8'ha9)))) ? ((((8'h9d) + (8'hb9)) ? (^~(8'h9e)) : ((7'h44) >= (7'h44))) < ((~(8'ha0)) ? ((8'hb8) ? (8'hba) : (8'hbb)) : (~^(8'ha5)))) : (~&(-((8'h9d) ? (7'h44) : (8'ha1))))) : (~^((~|((8'hb6) ~^ (8'h9f))) >>> (((8'hbd) >= (8'hb6)) < (^(7'h44)))))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire signed [(4'he):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
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
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire38 = wire33[(4'he):(2'h2)];
  assign wire39 = wire35[(3'h4):(1'h1)];
  assign wire40 = wire37;
  assign wire41 = {(^(($unsigned(wire39) ?
                          wire35[(3'h4):(2'h3)] : {(8'hb8),
                              wire38}) <= $unsigned($signed(wire34)))),
                      wire35};
  assign wire42 = wire37;
  assign wire43 = (&$unsigned((|(^wire41))));
  assign wire44 = $unsigned({((&$unsigned(wire42)) ?
                          wire43 : $unsigned((~^wire39)))});
  assign wire45 = ((-$signed((wire36[(4'he):(4'h8)] || $unsigned(wire39)))) ~^ (wire40[(1'h1):(1'h0)] >> $unsigned((wire37[(2'h3):(1'h0)] <<< (!wire37)))));
  assign wire46 = ((~(8'hb6)) ?
                      {$unsigned({{wire42},
                              $unsigned((8'hb5))})} : ({$signed((wire37 >= wire37)),
                              wire42[(3'h4):(1'h0)]} ?
                          (^(wire39[(3'h6):(3'h6)] <<< (wire45 || wire43))) : ($signed((wire45 * (8'hb5))) ?
                              ($signed(wire41) < $unsigned(wire40)) : (~(wire39 ?
                                  (7'h44) : (8'ha8))))));
  assign wire47 = (wire43 ? $unsigned(wire33[(3'h5):(3'h5)]) : wire44);
  assign wire48 = (wire37 ? wire34[(5'h11):(3'h6)] : wire39);
  assign wire49 = ($signed((($unsigned(wire43) ? $signed(wire41) : (-wire37)) ?
                      (8'hb3) : wire35)) < {(wire47 > (&(~^wire42))),
                      wire39[(1'h1):(1'h1)]});
  assign wire50 = ((&(((+wire34) < {(8'hb9)}) ?
                          $signed($unsigned(wire49)) : (((8'hac) ^~ wire40) ?
                              (wire43 ? wire44 : (8'hba)) : $signed(wire43)))) ?
                      $signed(wire43[(1'h1):(1'h1)]) : (+wire40[(4'hd):(3'h6)]));
  assign wire51 = wire48[(2'h2):(1'h0)];
  assign wire52 = (wire47 ~^ (!{wire43}));
  assign wire53 = wire38[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (($unsigned(wire39) + {($unsigned(wire43[(3'h5):(2'h3)]) ?
              ((~&wire53) | $unsigned(wire42)) : (!$signed(wire40))),
          ((^{wire53, wire46}) >= (~&(8'h9e)))}))
        begin
          reg54 <= (($signed(((|wire51) ?
                  (~^wire43) : $unsigned((8'hb1)))) ^~ wire45[(3'h7):(3'h5)]) ?
              $signed(((+(wire33 == wire47)) ?
                  ({wire48, (8'h9d)} ?
                      ((8'hb2) && wire38) : (wire35 ?
                          (8'h9d) : wire42)) : ((wire52 ?
                      wire53 : wire35) >= ((8'ha8) & (8'ha5))))) : $unsigned({wire35[(2'h3):(1'h0)]}));
          reg55 <= ($unsigned(wire50) ?
              (!wire53) : (~((^~{wire37}) <<< wire35)));
          reg56 <= ($unsigned($unsigned(((wire35 ?
              wire48 : wire35) <<< $unsigned(wire34)))) & ($unsigned($signed((wire49 ?
              (8'hbb) : wire40))) || reg55));
          reg57 <= ($signed($unsigned(wire46)) ?
              wire48 : wire51[(3'h4):(1'h1)]);
          if ($signed({$signed((|{wire37})), $unsigned((^{wire35, wire47}))}))
            begin
              reg58 <= $unsigned(($signed($signed($unsigned((8'ha8)))) ?
                  reg56 : ($signed((wire43 & wire42)) ?
                      wire34[(4'he):(2'h2)] : {(wire46 << wire49)})));
              reg59 <= ((!$unsigned(wire48[(1'h1):(1'h1)])) ~^ ($unsigned((reg55 < $signed((8'hbf)))) & reg57));
              reg60 <= (!reg56);
              reg61 <= wire42[(2'h3):(1'h0)];
            end
          else
            begin
              reg58 <= $unsigned((+wire36[(4'hc):(3'h6)]));
              reg59 <= (wire46 - $unsigned((|wire35)));
              reg60 <= (((wire42 || $unsigned({wire38, wire53})) ?
                      (!(wire38[(3'h5):(2'h3)] ?
                          (wire41 >> wire51) : (wire45 ^ (8'ha0)))) : (|reg55[(4'h9):(3'h5)])) ?
                  $signed((($unsigned(wire34) ?
                      $unsigned(reg60) : wire45[(4'h9):(1'h1)]) < ($unsigned(wire52) - {reg61,
                      reg58}))) : (wire43[(3'h7):(2'h3)] || $unsigned(wire51[(3'h5):(1'h0)])));
              reg61 <= $signed({$unsigned(($signed(wire39) ?
                      $signed((8'hba)) : (wire46 << wire36)))});
            end
        end
      else
        begin
          reg54 <= (((($unsigned((7'h43)) * (8'hbe)) ~^ ((wire40 ?
                  wire38 : wire52) != $signed(reg58))) && {(~|$unsigned(reg60)),
                  wire38}) ?
              wire47 : wire50);
          reg55 <= ({reg61[(2'h3):(2'h2)],
              wire53[(2'h3):(1'h0)]} >= (($unsigned((^wire46)) ?
              ($unsigned(wire45) <<< wire34) : {$signed(wire37)}) <<< $signed((~&$unsigned(wire34)))));
          if (({reg55} ?
              $unsigned($signed(((wire34 && wire46) ?
                  $unsigned(reg57) : (reg54 ?
                      wire36 : wire46)))) : ($unsigned($unsigned(((8'hb8) ^ wire41))) ?
                  wire45[(4'hb):(3'h7)] : wire35)))
            begin
              reg56 <= $signed(((((^reg60) < wire50[(3'h6):(1'h1)]) ?
                      $signed(((8'ha5) ?
                          (7'h41) : (8'h9f))) : wire40[(2'h2):(2'h2)]) ?
                  ({wire47[(3'h7):(3'h6)]} + (~^$unsigned(wire46))) : wire46[(3'h7):(3'h5)]));
              reg57 <= ((|(wire43 ?
                      (~&$unsigned(wire52)) : reg58[(4'ha):(3'h4)])) ?
                  (({wire51[(2'h3):(2'h2)], (~^reg55)} ?
                          (wire39[(2'h2):(1'h0)] & (wire43 && reg56)) : (-reg59[(2'h2):(1'h1)])) ?
                      (reg61 ?
                          (~|reg58[(3'h4):(1'h0)]) : (((8'hbf) ?
                                  wire38 : wire50) ?
                              (wire39 ?
                                  wire40 : wire33) : $signed(wire44))) : reg57[(2'h3):(2'h3)]) : ($unsigned(reg57) ?
                      $unsigned(wire45[(4'hc):(2'h3)]) : ((8'ha7) | (&$signed(wire52)))));
              reg58 <= (&$unsigned((((+wire52) ?
                      ((8'h9d) < (8'ha6)) : {(8'h9d)}) ?
                  $signed((wire41 * (7'h44))) : (~&(7'h41)))));
              reg59 <= $unsigned((^~$signed(reg54)));
              reg60 <= (~wire46[(3'h5):(3'h4)]);
            end
          else
            begin
              reg56 <= $unsigned((wire49 ? reg56 : (~wire42[(2'h2):(2'h2)])));
              reg57 <= ((~^(~|{{wire34}})) >= {$unsigned(((reg54 && wire44) | $signed(reg55))),
                  $unsigned({wire49})});
              reg58 <= (^~$unsigned(wire35));
              reg59 <= wire52[(4'hb):(1'h1)];
              reg60 <= ((wire37 + (+(8'ha9))) ?
                  (($signed((!(7'h43))) << $signed({wire53})) ?
                      (|(wire37[(4'he):(3'h7)] - $signed((7'h44)))) : {((8'ha7) * (reg60 ?
                              wire45 : (8'hb8))),
                          (((8'hac) ? wire50 : reg58) ?
                              wire38 : (reg54 + reg55))}) : ((wire53[(2'h2):(1'h1)] * (wire34 ^~ $signed(reg57))) <<< $unsigned($unsigned(wire43))));
            end
          if ({$signed(reg61),
              $unsigned(((~|(wire43 && reg55)) > wire40[(4'hb):(3'h7)]))})
            begin
              reg61 <= reg58[(1'h0):(1'h0)];
              reg62 <= $unsigned($unsigned((wire50 != $signed(((7'h44) & wire42)))));
              reg63 <= (~^((($unsigned(wire33) ?
                      wire39[(3'h6):(3'h6)] : (wire43 ?
                          wire47 : wire36)) << $signed($unsigned(wire38))) ?
                  wire53 : reg58));
            end
          else
            begin
              reg61 <= $signed(wire43);
              reg62 <= {wire41[(1'h1):(1'h0)]};
              reg63 <= wire41[(4'hc):(3'h4)];
            end
        end
      reg64 <= ((wire43 >> $signed((^(-(8'ha4))))) - (^~reg59));
      reg65 <= $unsigned(wire37[(5'h12):(1'h0)]);
      reg66 <= ((wire34 <= reg59) - wire45);
      if (wire51)
        begin
          reg67 <= $signed({$unsigned($unsigned(wire33)),
              (~^$signed((wire43 ? wire44 : reg66)))});
          reg68 <= wire40[(5'h11):(1'h0)];
        end
      else
        begin
          if (reg57[(2'h2):(1'h1)])
            begin
              reg67 <= reg59;
              reg68 <= (($unsigned({(wire37 ? reg66 : (8'ha3))}) ?
                      (reg59 ?
                          ((wire33 ?
                              wire41 : reg58) < $unsigned(wire33)) : $unsigned(reg55)) : (^~{(wire49 + wire51)})) ?
                  {(^~(-$unsigned(reg59)))} : (reg67[(2'h3):(2'h2)] <<< $signed({(~reg56),
                      wire47})));
              reg69 <= $unsigned(wire48);
            end
          else
            begin
              reg67 <= {$signed($unsigned(((wire36 >>> reg60) ?
                      ((7'h42) < reg60) : reg63)))};
              reg68 <= {$unsigned($unsigned(((8'ha2) >= (wire33 ?
                      reg55 : (8'hb0)))))};
              reg69 <= $unsigned((+(8'hb0)));
            end
          if ($unsigned((7'h42)))
            begin
              reg70 <= reg62[(2'h2):(2'h2)];
              reg71 <= (($signed(reg57) | ((((8'ha0) ?
                          wire40 : wire49) < $unsigned(wire49)) ?
                      $unsigned((wire45 - wire47)) : {wire46,
                          $unsigned(wire44)})) ?
                  {$unsigned($unsigned((-wire42))),
                      (~^$unsigned({reg58}))} : $signed((($signed(wire42) || (wire50 <= reg68)) && wire52)));
              reg72 <= (-wire36);
            end
          else
            begin
              reg70 <= wire48;
              reg71 <= $unsigned($unsigned((-($unsigned(wire48) ^ reg71))));
            end
          reg73 <= ((wire38 ?
              {($unsigned(wire53) ~^ (+wire44))} : {((~reg56) & (reg67 <= (8'hb0)))}) > $unsigned($unsigned({wire41})));
        end
    end
  assign wire74 = wire43;
  assign wire75 = $unsigned(reg66[(1'h1):(1'h1)]);
  assign wire76 = $signed($signed($unsigned($signed((^(8'hbc))))));
  assign wire77 = wire37[(5'h10):(3'h4)];
endmodule
