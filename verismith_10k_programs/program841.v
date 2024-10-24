module top
#(parameter param121 = (^{({(^~(7'h40))} == (^(+(8'had)))), ((((8'hbb) || (8'ha9)) >> {(8'hb4)}) ? (!(~^(8'hb9))) : (((7'h41) ? (8'ha2) : (8'hb0)) - {(8'hab)}))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire120;
  wire signed [(4'ha):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire112;
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire27,
                 wire28,
                 wire30,
                 wire31,
                 wire37,
                 wire38,
                 wire112,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg29,
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
  assign wire5 = wire0;
  assign wire6 = wire4[(2'h3):(2'h3)];
  assign wire7 = $signed(wire6);
  assign wire8 = {wire2[(3'h4):(1'h1)]};
  assign wire9 = (~|$unsigned((wire4 ?
                     $signed((wire1 - wire0)) : {wire1, $unsigned(wire4)})));
  assign wire10 = $signed(wire8);
  assign wire11 = wire4;
  assign wire12 = ($signed(wire4[(2'h3):(2'h2)]) >= wire9);
  assign wire13 = (&wire10);
  assign wire14 = (~|$unsigned(wire4));
  always
    @(posedge clk) begin
      reg15 <= ((wire7 ? {(~^wire2)} : $signed((8'hb2))) > {$signed((|((8'ha1) ?
              (8'ha0) : wire10)))});
      if (wire4)
        begin
          reg16 <= $unsigned(reg15[(1'h1):(1'h0)]);
          if ((($signed(({wire2} ^~ (wire1 ?
              wire13 : wire4))) ^ ((wire12 != (+wire5)) ?
              (reg15 ?
                  wire6[(2'h2):(1'h1)] : $signed(reg15)) : $unsigned({wire9,
                  reg16}))) | {($signed(wire9[(1'h0):(1'h0)]) || $unsigned(reg15[(1'h1):(1'h0)])),
              wire0[(4'hc):(4'h9)]}))
            begin
              reg17 <= (|($signed((reg15 ?
                  wire9[(4'h9):(3'h5)] : $unsigned((8'ha0)))) - {($signed(wire4) ^~ wire12[(1'h1):(1'h1)])}));
              reg18 <= wire6[(4'hf):(4'ha)];
              reg19 <= wire1[(4'hb):(1'h1)];
              reg20 <= (!wire9[(2'h2):(1'h1)]);
              reg21 <= $unsigned(((~&{(-reg17), wire5}) ?
                  wire1 : ((wire13 ^ wire14[(2'h2):(2'h2)]) >> (reg17[(2'h3):(1'h0)] * {(7'h44)}))));
            end
          else
            begin
              reg17 <= $signed((($signed((reg16 ?
                      wire3 : (8'hbb))) >= $signed(((8'ha3) ?
                      (7'h40) : wire4))) ?
                  reg18 : (((~|wire0) ?
                      (wire6 ?
                          reg16 : (8'had)) : reg15) ^ ($signed(reg20) & (!reg17)))));
            end
          if ($unsigned($signed($signed($signed(wire12[(2'h2):(1'h1)])))))
            begin
              reg22 <= wire13[(5'h12):(4'hc)];
            end
          else
            begin
              reg22 <= (8'ha3);
              reg23 <= $unsigned(wire8);
            end
        end
      else
        begin
          reg16 <= (8'hb0);
          reg17 <= wire12[(1'h0):(1'h0)];
        end
      reg24 <= wire0[(5'h13):(4'hb)];
      reg25 <= wire7;
      reg26 <= ($signed($unsigned($signed((wire9 ? wire3 : wire14)))) ?
          reg19[(1'h1):(1'h1)] : (~|$unsigned({wire9[(4'ha):(4'ha)]})));
    end
  assign wire27 = $unsigned($unsigned($unsigned(wire5)));
  assign wire28 = $signed(({reg24, (^$unsigned((8'ha7)))} ?
                      $signed((~|$signed(reg21))) : ({(reg19 ?
                              reg22 : reg25)} || reg22[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg29 <= reg26;
    end
  assign wire30 = $signed((8'hbe));
  assign wire31 = ($unsigned(reg18[(3'h6):(1'h0)]) ?
                      {$unsigned((((8'hb9) ?
                              wire11 : (8'hb9)) | $unsigned(wire8)))} : ($signed(((+reg20) && (wire7 ?
                              reg26 : wire13))) ?
                          $unsigned($unsigned($signed((8'ha4)))) : reg16[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg32 <= (!$signed(($unsigned($unsigned((8'hb3))) ?
          $signed((reg21 * reg20)) : $signed((wire4 <<< wire12)))));
      reg33 <= {((!(8'h9c)) ^~ {wire4[(2'h3):(1'h1)]})};
      reg34 <= $unsigned(wire7);
      reg35 <= (8'ha9);
      reg36 <= $unsigned(($signed($unsigned($signed((8'ha5)))) ?
          (reg29 ?
              ($signed(wire27) << $unsigned(wire2)) : reg17[(2'h2):(2'h2)]) : $signed(reg26[(1'h1):(1'h1)])));
    end
  assign wire37 = reg21[(2'h3):(1'h1)];
  assign wire38 = reg22;
  module39 #() modinst113 (.clk(clk), .wire43(reg15), .y(wire112), .wire42(wire28), .wire44(wire13), .wire40(reg25), .wire41(wire37));
  always
    @(posedge clk) begin
      reg114 <= wire2;
      reg115 <= wire27[(1'h0):(1'h0)];
      reg116 <= ((8'ha7) ?
          (~|$unsigned($unsigned(wire13[(4'h9):(4'h8)]))) : $unsigned((~|($signed(reg29) * wire4[(2'h2):(1'h0)]))));
      reg117 <= reg35[(5'h11):(4'hd)];
      reg118 <= wire11[(4'h8):(2'h2)];
    end
  assign wire119 = reg17[(3'h4):(2'h2)];
  assign wire120 = $unsigned($signed($unsigned(reg26)));
endmodule

module module39
#(parameter param111 = ((8'hb2) ? {(((^(8'haa)) & ((8'ha0) ? (8'ha6) : (8'hb1))) <<< {(^~(7'h43))})} : (~^(^(!{(8'hb6), (8'ha8)})))))
(y, clk, wire40, wire41, wire42, wire43, wire44);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire41;
  input wire signed [(5'h14):(1'h0)] wire42;
  input wire signed [(5'h14):(1'h0)] wire43;
  input wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire109;
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  assign y = {wire45,
                 wire46,
                 wire54,
                 wire59,
                 wire62,
                 wire90,
                 wire109,
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
                 (1'h0)};
  assign wire45 = wire42[(2'h2):(2'h2)];
  assign wire46 = $signed((((|(wire40 - wire41)) ?
                          ((wire41 ? (8'h9d) : wire41) ?
                              {wire43,
                                  wire42} : wire40[(2'h3):(1'h1)]) : $signed($signed(wire42))) ?
                      $signed((-{wire41,
                          wire41})) : $unsigned((wire41[(5'h15):(1'h0)] ^ (wire45 - wire41)))));
  always
    @(posedge clk) begin
      reg47 <= ({wire44} ?
          $unsigned($unsigned({$unsigned(wire42),
              $unsigned(wire44)})) : $unsigned(((~(~&wire43)) << ($unsigned(wire41) <= (8'hb6)))));
      reg48 <= wire43[(3'h6):(3'h4)];
      if ((+(~|((^~(wire40 ? wire40 : wire44)) & wire44[(2'h2):(1'h1)]))))
        begin
          reg49 <= $signed(wire46);
          if ((7'h40))
            begin
              reg50 <= (reg47 > {(((~^(8'haa)) ?
                      (|reg49) : (-wire44)) >> ((wire41 ? (8'ha2) : reg48) ?
                      ((8'h9c) ^ wire43) : (wire40 ? wire41 : wire44))),
                  $unsigned((^~(~|reg47)))});
              reg51 <= ($signed(((-(|(8'hb5))) ?
                  ((&reg49) >>> (wire43 ?
                      wire45 : reg49)) : ((wire44 && wire43) ?
                      (wire41 & wire45) : (8'h9d)))) ~^ $unsigned((^~((wire41 ?
                      wire45 : wire45) ?
                  wire43[(2'h2):(2'h2)] : $unsigned(reg49)))));
              reg52 <= ({reg51, (-reg47[(3'h5):(3'h5)])} ?
                  ((((wire43 ? wire40 : reg50) ?
                      {wire43} : (7'h40)) >>> $unsigned(reg49[(2'h2):(1'h1)])) ^ wire40) : (((^~$signed(wire45)) ?
                          {(wire43 ? reg50 : (8'hba)),
                              wire42} : $signed(((8'ha4) ? wire40 : (8'ha3)))) ?
                      (((~reg51) || (~reg50)) < $unsigned($signed(reg49))) : $signed((8'hbf))));
            end
          else
            begin
              reg50 <= wire42[(3'h4):(2'h2)];
              reg51 <= ($signed(reg48[(4'h9):(2'h2)]) ?
                  $unsigned($unsigned(wire41)) : $unsigned($unsigned(((reg50 | reg51) >> (reg49 ?
                      reg51 : reg52)))));
              reg52 <= wire41[(3'h6):(2'h2)];
              reg53 <= wire44[(4'hd):(3'h6)];
            end
        end
      else
        begin
          if ({(wire41 || (wire40[(3'h6):(1'h1)] ?
                  $signed(wire46) : wire43[(4'he):(4'he)])),
              ((&((~|reg47) | $signed(reg52))) ?
                  (+wire46) : (wire44 < (wire42[(4'h8):(4'h8)] <<< $signed(wire44))))})
            begin
              reg49 <= $signed({(($signed(reg53) ?
                          (!reg50) : (reg48 ? wire46 : wire43)) ?
                      ($unsigned(wire45) ^~ $signed(wire46)) : {$signed(wire41),
                          (~wire40)})});
              reg50 <= $signed({reg50[(1'h1):(1'h0)]});
              reg51 <= wire45[(1'h0):(1'h0)];
            end
          else
            begin
              reg49 <= wire46;
              reg50 <= (^~$unsigned(($unsigned((&wire43)) ?
                  reg51[(3'h4):(2'h3)] : wire41[(5'h13):(4'he)])));
            end
        end
    end
  assign wire54 = (reg50[(4'hb):(2'h3)] ?
                      (^({reg52[(4'hc):(3'h6)]} > reg48)) : wire41[(4'ha):(2'h3)]);
  always
    @(posedge clk) begin
      reg55 <= $signed($unsigned(($signed(wire46[(3'h5):(1'h0)]) ?
          $unsigned(wire46[(1'h1):(1'h1)]) : reg48)));
      reg56 <= (({wire43,
          ((!reg47) <<< reg49[(2'h3):(1'h1)])} <<< wire41[(3'h6):(1'h0)]) - (reg50 ?
          $signed(reg48[(1'h0):(1'h0)]) : reg49[(1'h0):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg57 <= wire43[(5'h11):(4'hc)];
      reg58 <= (~|wire43[(4'hc):(1'h0)]);
    end
  assign wire59 = reg50[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg60 <= (reg47 - wire54);
      reg61 <= {((((wire46 >> reg49) ?
                  ((8'ha2) ?
                      wire54 : (8'hb0)) : wire40[(2'h2):(1'h1)]) ^~ {(wire45 ?
                      reg53 : reg50)}) ?
              wire54 : (($signed(reg58) ?
                      $signed(wire41) : (reg60 ? wire54 : wire43)) ?
                  (~{reg49, reg58}) : (+$signed((8'ha5))))),
          $signed((reg57[(4'h8):(1'h1)] >> (reg55[(4'ha):(3'h6)] ?
              (~^wire54) : (reg51 && reg53))))};
    end
  assign wire62 = $unsigned(wire59[(3'h7):(3'h5)]);
  module63 #() modinst91 (.wire68(wire62), .wire66(wire43), .wire67(wire54), .y(wire90), .wire65(reg60), .clk(clk), .wire64(wire41));
  module92 #() modinst110 (.wire95(reg49), .wire94(wire42), .y(wire109), .clk(clk), .wire93(reg61), .wire96(reg58));
endmodule

module module92
#(parameter param107 = (~^((^~((~(8'hbc)) ? ((8'hab) ^ (8'h9f)) : ((8'ha1) ? (8'ha0) : (8'hb4)))) * ((~|((8'ha1) - (7'h42))) < {(-(7'h43)), ((8'hb0) > (7'h43))}))), 
parameter param108 = (param107 ? param107 : {((param107 ? ((8'hb5) > param107) : (^param107)) != param107), ((8'ha3) ? ({param107} > param107) : (8'h9d))}))
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire96;
  input wire signed [(3'h7):(1'h0)] wire95;
  input wire [(5'h14):(1'h0)] wire94;
  input wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 (1'h0)};
  assign wire97 = (^~$unsigned((&$unsigned(wire95))));
  assign wire98 = wire96[(4'ha):(1'h1)];
  assign wire99 = wire96;
  assign wire100 = $unsigned(wire96[(4'h9):(2'h2)]);
  assign wire101 = wire99[(5'h12):(2'h3)];
  assign wire102 = $unsigned($unsigned({$signed(wire97[(2'h2):(2'h2)]),
                       wire94[(4'ha):(1'h0)]}));
  assign wire103 = ((((wire93 ? $signed(wire93) : $unsigned(wire97)) ?
                           wire99 : $signed(wire100)) ?
                       (wire101[(1'h0):(1'h0)] ?
                           $unsigned(((8'ha9) ?
                               (8'hb4) : wire98)) : wire98) : (~wire98)) & wire101);
  assign wire104 = $unsigned(wire96[(2'h3):(1'h1)]);
  assign wire105 = {$signed((((wire100 ? wire102 : wire98) ?
                               (^wire97) : $signed(wire101)) ?
                           $signed(wire93) : $unsigned(((8'hac) || wire103)))),
                       wire95};
  assign wire106 = $signed($signed({{$signed((8'hbe)), $unsigned(wire105)}}));
endmodule

module module63  (y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire68;
  input wire signed [(4'hc):(1'h0)] wire67;
  input wire [(4'hc):(1'h0)] wire66;
  input wire signed [(2'h3):(1'h0)] wire65;
  input wire signed [(3'h6):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg69 <= {wire68, $unsigned(wire66)};
      reg70 <= $unsigned((+{((wire66 >> wire64) && wire68)}));
      if (reg69[(1'h1):(1'h1)])
        begin
          if ($signed((|$signed($unsigned($signed(wire66))))))
            begin
              reg71 <= (wire68 ?
                  reg70[(2'h2):(1'h0)] : {(~{wire64}),
                      (($signed(wire68) >= (wire64 ?
                          reg70 : wire67)) ~^ ($unsigned(wire64) | reg70[(3'h5):(3'h5)]))});
              reg72 <= reg70;
            end
          else
            begin
              reg71 <= ($unsigned(wire66) == $signed((^~(~^$unsigned(wire68)))));
            end
          reg73 <= {$unsigned(reg72)};
          reg74 <= reg70;
          reg75 <= wire65;
          if ($signed((8'ha2)))
            begin
              reg76 <= reg69[(1'h0):(1'h0)];
            end
          else
            begin
              reg76 <= reg72[(1'h1):(1'h1)];
              reg77 <= reg72;
              reg78 <= ((((|(reg77 << reg71)) << (wire68[(2'h3):(1'h1)] ^ $signed(reg75))) * (wire67[(4'hc):(4'h8)] ?
                  reg77[(3'h5):(2'h3)] : $signed($unsigned(reg71)))) <<< (((~&((8'haf) ?
                      (8'h9c) : reg74)) <= ($unsigned(reg75) ?
                      reg74[(4'h8):(2'h3)] : (~&reg76))) ?
                  ($signed((reg73 ?
                      (8'ha8) : wire65)) >> $unsigned((reg77 < (8'hbd)))) : (wire64 ?
                      (~&(-reg73)) : (~|(~^reg76)))));
              reg79 <= ($signed({($signed(wire67) ?
                      (-reg70) : $signed(wire66))}) << ($unsigned((|(!reg71))) == (~$signed(reg70))));
            end
        end
      else
        begin
          reg71 <= (((((^wire67) ? reg73[(3'h4):(1'h1)] : wire66) <= ((reg76 ?
                  wire67 : reg70) | {(8'hb8), (8'hb8)})) + (((~^reg75) ?
                  ((8'haf) ?
                      reg70 : wire65) : reg71[(4'ha):(3'h7)]) != (-(reg73 >>> reg71)))) ?
              reg71[(2'h3):(2'h3)] : (~|(~reg73[(3'h4):(2'h2)])));
          reg72 <= reg73[(4'h9):(2'h3)];
          if (((reg79[(2'h2):(2'h2)] ?
                  ((7'h44) ?
                      (~^{wire64}) : (+(wire68 ? reg70 : (8'hab)))) : reg73) ?
              ($unsigned(reg76[(1'h0):(1'h0)]) ^~ reg70[(4'ha):(2'h2)]) : (-wire64)))
            begin
              reg73 <= reg79[(2'h2):(2'h2)];
            end
          else
            begin
              reg73 <= $signed(reg76[(1'h0):(1'h0)]);
              reg74 <= reg71[(4'hc):(1'h1)];
            end
        end
    end
  assign wire80 = {wire68[(1'h1):(1'h0)],
                      (reg76 ? $signed($unsigned((8'h9d))) : reg77)};
  assign wire81 = $unsigned($unsigned(($signed($signed(wire67)) ?
                      ({(8'hbe)} ?
                          (wire68 < wire64) : (wire80 * reg70)) : (|wire64))));
  assign wire82 = (wire66 ? (~|reg77) : wire68);
  assign wire83 = $unsigned(($unsigned(wire64) >>> reg79));
  assign wire84 = (wire82 ?
                      $signed((($signed(reg74) ?
                          (wire65 ? reg79 : (8'hbd)) : {reg79,
                              reg70}) * reg76[(2'h2):(1'h1)])) : $signed((({wire67} && $unsigned(reg76)) ?
                          (wire80 >> $signed(reg70)) : ($signed(reg77) ?
                              (!wire83) : reg72))));
  assign wire85 = $unsigned(reg74);
  assign wire86 = (+(($unsigned({reg74}) + reg72[(1'h0):(1'h0)]) && wire82[(4'h9):(2'h3)]));
  assign wire87 = (($signed(reg75) != ((~|((8'hab) ? (8'hba) : reg72)) ?
                      ((!wire84) ~^ reg70) : $unsigned((reg71 ?
                          reg78 : (8'hb5))))) == $signed(((~^(reg71 ?
                          reg79 : wire81)) ?
                      ((-reg70) ^~ (reg74 ? reg77 : reg76)) : ((reg70 ?
                              wire85 : reg73) ?
                          $signed(wire86) : reg72))));
  assign wire88 = wire65[(1'h1):(1'h0)];
  assign wire89 = (+(8'hac));
endmodule
