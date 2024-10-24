module top
#(parameter param129 = ({(({(8'h9c)} ? (^(7'h44)) : (+(8'h9f))) ? {(^~(8'ha0)), (^(8'ha5))} : {(^~(8'hb3)), ((7'h44) ? (8'hb0) : (8'hac))})} < (((~^((8'hb9) & (8'ha7))) * {(-(8'hb2)), (-(8'hb3))}) == {(^~(~|(8'haf))), (((8'hb5) ? (8'hb6) : (8'ha5)) - {(8'hab), (8'ha3)})})), 
parameter param130 = (((((~^param129) | (param129 ? param129 : (8'hbc))) ? (~param129) : ((param129 & (8'hbe)) ? param129 : param129)) ? (((|param129) ? (param129 == param129) : (param129 <<< (8'hbb))) ? ((param129 & param129) > (-param129)) : (~|(~^param129))) : {((param129 ? param129 : param129) >= (^param129))}) ? (((((8'hb8) >>> param129) ? param129 : (param129 ? param129 : param129)) >> {(-param129)}) << (param129 ? param129 : ((!param129) ~^ (-param129)))) : (((8'had) >> (-((7'h44) ~^ param129))) ~^ param129)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire38;
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire41,
                 wire40,
                 wire4,
                 wire5,
                 wire6,
                 wire38,
                 (1'h0)};
  assign wire4 = wire1[(1'h1):(1'h1)];
  assign wire5 = $signed((wire2[(2'h2):(1'h0)] ? wire4 : (~wire1)));
  assign wire6 = wire3[(2'h3):(1'h1)];
  module7 #() modinst39 (wire38, clk, wire1, wire2, wire3, wire4, wire0);
  assign wire40 = wire38;
  assign wire41 = wire0[(4'hc):(4'hc)];
  module42 #() modinst121 (wire120, clk, wire2, wire4, wire38, wire6);
  assign wire122 = $signed((((~|(|wire0)) >> ({wire41} ?
                           wire3[(4'ha):(2'h2)] : $signed(wire0))) ?
                       ($unsigned($unsigned(wire4)) ?
                           wire41 : (wire1 ?
                               (~wire3) : {wire38,
                                   (8'hba)})) : wire40[(4'hf):(4'he)]));
  assign wire123 = {wire6[(4'h8):(3'h7)],
                       (-((wire1[(2'h3):(2'h2)] ?
                           (~|wire5) : (wire5 ^~ wire0)) >>> ((wire6 ?
                           wire2 : wire0) | (wire5 ? wire4 : wire40))))};
  assign wire124 = ((~^wire2[(1'h0):(1'h0)]) < ({wire38} & $unsigned(((|(7'h41)) ?
                       (wire2 ? wire1 : (7'h42)) : wire41[(2'h2):(1'h1)]))));
  assign wire125 = wire0[(1'h1):(1'h1)];
  assign wire126 = $signed(wire38);
  assign wire127 = wire123[(2'h2):(2'h2)];
  assign wire128 = wire126[(2'h2):(1'h0)];
endmodule

module module42
#(parameter param118 = {((~^({(8'hbb), (7'h42)} ^~ {(8'h9d), (7'h44)})) ? ((((8'hb2) ? (8'h9c) : (8'ha6)) <<< (8'ha1)) - {{(7'h42), (7'h41)}}) : (((&(8'hba)) ? ((8'h9c) ? (8'ha4) : (8'hbc)) : ((8'hbe) ^ (8'hbb))) ? (((8'ha3) >> (8'hbd)) ? (~^(8'hae)) : ((8'ha3) ? (7'h44) : (8'hbd))) : (((8'had) ? (7'h40) : (8'h9c)) ? ((7'h41) & (8'hbc)) : (!(8'ha7)))))}, 
parameter param119 = ((8'ha6) ? param118 : ((|((param118 ^ param118) ? param118 : param118)) == (param118 >= (((8'ha2) > param118) | ((8'ha3) ? param118 : param118))))))
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire46;
  input wire signed [(4'hb):(1'h0)] wire45;
  input wire [(5'h13):(1'h0)] wire44;
  input wire [(4'hd):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire117;
  wire signed [(5'h12):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire115;
  wire [(4'he):(1'h0)] wire114;
  wire signed [(3'h4):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire110;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire47;
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire110,
                 wire81,
                 wire80,
                 wire65,
                 wire64,
                 wire47,
                 reg113,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
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
                 (1'h0)};
  assign wire47 = (($unsigned((+{(8'hbb), wire43})) <= wire44) ?
                      $unsigned($signed(((8'ha5) ?
                          (wire45 ? wire44 : wire46) : (wire46 ?
                              wire44 : wire45)))) : ((!(wire44[(4'ha):(4'h9)] ^~ wire43)) ?
                          ($signed(wire44) | ((wire45 ^ wire43) ?
                              $unsigned(wire45) : {wire45})) : $unsigned(wire46)));
  always
    @(posedge clk) begin
      if ((8'hab))
        begin
          reg48 <= $unsigned({{(^~{wire47})}});
          reg49 <= {$unsigned((&wire45)), reg48};
        end
      else
        begin
          reg48 <= {(({(wire47 ? wire45 : wire44),
                  {wire43}} ^ $signed(reg48[(3'h4):(2'h3)])) + (^~$unsigned((^~(8'hae)))))};
          reg49 <= $signed({wire45[(4'h9):(3'h4)], wire45});
          reg50 <= (^$signed({$unsigned(wire43), wire44}));
          if ((((wire43[(4'hb):(3'h5)] ?
                      $unsigned($unsigned(reg48)) : wire46[(2'h3):(2'h2)]) ?
                  $signed((&wire46[(3'h4):(1'h1)])) : ({(reg48 != wire44)} << ((^~wire46) > wire43))) ?
              (&$signed($unsigned((reg50 <= wire45)))) : (~&((^(~|wire43)) ?
                  wire43[(3'h5):(1'h0)] : wire45[(4'ha):(4'h9)]))))
            begin
              reg51 <= wire44[(3'h7):(1'h1)];
            end
          else
            begin
              reg51 <= $unsigned((^~(reg50[(4'h9):(1'h1)] ?
                  (wire43[(4'h9):(3'h7)] ?
                      reg51[(5'h13):(4'hf)] : {reg50, reg50}) : ((^wire46) ?
                      reg48[(1'h1):(1'h0)] : (~&reg50)))));
              reg52 <= $signed((8'hb1));
            end
        end
      reg53 <= (^~($signed(({reg49, wire43} ? (-wire43) : (reg50 <<< wire47))) ?
          $signed(wire45) : (~({reg48, (7'h44)} ^ {wire47}))));
      reg54 <= {($unsigned(wire47[(2'h3):(2'h2)]) & wire46)};
      reg55 <= wire47[(2'h2):(1'h0)];
      reg56 <= (|(reg55[(2'h2):(2'h2)] >= (~((wire45 * wire47) ?
          $signed(reg54) : $signed(reg49)))));
    end
  always
    @(posedge clk) begin
      reg57 <= $unsigned((&{reg49, {(reg56 ? reg54 : wire43)}}));
      reg58 <= wire45;
      if (reg52[(3'h4):(3'h4)])
        begin
          reg59 <= (+{($signed(wire45[(3'h7):(1'h1)]) ?
                  ($signed(wire47) != ((8'ha5) ? reg58 : wire46)) : (reg58 ?
                      reg52 : wire46[(3'h5):(3'h4)])),
              reg55});
          reg60 <= $signed($signed((reg50 ?
              $unsigned((reg53 + reg59)) : $unsigned(wire45[(2'h3):(1'h1)]))));
          reg61 <= wire45;
          reg62 <= reg57[(4'hb):(3'h4)];
        end
      else
        begin
          reg59 <= wire47[(2'h2):(2'h2)];
          reg60 <= reg49[(1'h0):(1'h0)];
        end
      reg63 <= reg62[(3'h7):(2'h2)];
    end
  assign wire64 = $unsigned($signed((!((|reg54) ?
                      (reg52 ? reg58 : wire45) : $unsigned(reg53)))));
  assign wire65 = reg54;
  always
    @(posedge clk) begin
      if ((+reg58))
        begin
          reg66 <= wire46[(3'h5):(3'h4)];
        end
      else
        begin
          reg66 <= (^~{wire46[(2'h2):(1'h1)], (8'hbe)});
          reg67 <= (((8'hbc) ?
                  $signed((reg48 ?
                      reg66 : $signed((8'h9c)))) : ((reg57 * reg62) ?
                      $signed($signed(reg63)) : (8'hb9))) ?
              (((wire65 ? reg66 : reg55[(3'h4):(3'h4)]) ?
                      (8'hba) : {(reg53 ? wire47 : wire46), {wire45}}) ?
                  $signed(reg52[(2'h2):(1'h1)]) : ((reg51[(3'h7):(3'h5)] >>> reg52[(4'hc):(4'h8)]) >= reg66[(4'hd):(4'hb)])) : (((~^$signed(wire64)) ?
                      {((8'hb0) ? reg56 : wire47),
                          wire43[(1'h0):(1'h0)]} : $unsigned((&reg54))) ?
                  (($signed(reg58) <= reg50[(3'h7):(3'h6)]) ?
                      wire47 : reg62[(4'ha):(2'h2)]) : wire47));
          if ({($signed($unsigned(reg51)) ?
                  $unsigned($signed(reg62[(4'he):(4'he)])) : (|wire65[(4'hf):(4'hb)])),
              {(({reg53, reg59} ? {reg51} : (wire43 >>> (8'hb7))) ?
                      ($signed((8'hb1)) ?
                          (wire47 ?
                              reg52 : reg53) : reg51) : wire65[(4'hf):(3'h4)]),
                  {reg62, reg48}}})
            begin
              reg68 <= (reg66 || (-(8'ha3)));
              reg69 <= $signed({reg67});
              reg70 <= ((~reg56) ^ ((reg59 || (|(&reg66))) ?
                  wire44 : $unsigned($signed($unsigned(reg62)))));
              reg71 <= $unsigned(reg49[(2'h2):(1'h1)]);
            end
          else
            begin
              reg68 <= {reg57};
              reg69 <= ($signed({{$signed(reg48), {wire65}}, (^~(~reg54))}) ?
                  {(reg71[(1'h0):(1'h0)] ?
                          {reg66[(4'hc):(3'h7)]} : $signed((reg60 <<< reg52)))} : reg54);
              reg70 <= ($signed(((!$signed(wire44)) ?
                      (~&(reg54 ?
                          wire65 : reg52)) : $unsigned($unsigned(reg61)))) ?
                  ($signed(((wire46 ? wire44 : reg59) << ((7'h44) >> wire47))) ?
                      ($unsigned($unsigned(reg48)) ^ (~{reg50,
                          reg51})) : $unsigned((reg61 ^~ (reg62 < reg71)))) : $unsigned({reg58}));
              reg71 <= (reg51[(3'h7):(2'h2)] ?
                  (^reg50[(3'h6):(1'h0)]) : (^wire47[(1'h1):(1'h1)]));
            end
          if ((reg50[(3'h4):(2'h3)] ^ (8'hb5)))
            begin
              reg72 <= reg53;
              reg73 <= (~^$signed(reg60[(4'h8):(2'h2)]));
            end
          else
            begin
              reg72 <= {$unsigned((wire47 >= ((!(8'hbf)) >= {reg56})))};
              reg73 <= ($unsigned(reg62[(4'he):(4'he)]) == ($signed($unsigned(wire65[(3'h5):(1'h1)])) >= (~^reg57)));
              reg74 <= wire45[(4'h8):(3'h4)];
              reg75 <= ($unsigned(wire44) ? reg59 : reg72);
            end
          reg76 <= $signed(wire45[(3'h5):(1'h0)]);
        end
      reg77 <= wire64[(3'h5):(1'h0)];
      reg78 <= reg53[(5'h13):(3'h5)];
      reg79 <= reg50;
    end
  assign wire80 = reg71[(3'h7):(3'h4)];
  assign wire81 = (~&{$unsigned((~^(reg66 ? wire65 : reg69)))});
  module82 #() modinst111 (wire110, clk, reg63, wire47, reg49, wire80, reg55);
  assign wire112 = (((~|$signed({wire46,
                           reg48})) ^ ($unsigned($unsigned(wire64)) ?
                           (((8'haa) ?
                               reg79 : reg66) ~^ (wire110 || reg72)) : (((8'hbc) ?
                                   reg55 : reg58) ?
                               wire110 : wire43[(1'h1):(1'h0)]))) ?
                       ((reg75[(4'ha):(3'h6)] ^~ (^~(^~wire80))) << {reg66[(3'h4):(1'h0)]}) : (((wire46 || (8'hb6)) <= $signed((+reg74))) <= (((8'had) || reg48[(2'h3):(1'h1)]) << (wire43[(2'h3):(2'h2)] >= $signed(wire44)))));
  always
    @(posedge clk) begin
      reg113 <= {($signed($unsigned($unsigned((8'hab)))) == (~&((wire46 * reg78) ?
              {reg77, reg63} : wire65))),
          (8'hb8)};
    end
  assign wire114 = $unsigned(reg74);
  assign wire115 = $signed($unsigned($unsigned({reg71[(3'h4):(2'h2)]})));
  assign wire116 = $signed((reg57 ? reg69[(1'h1):(1'h0)] : reg113));
  assign wire117 = (~&$unsigned({$unsigned((-reg56))}));
endmodule

module module7
#(parameter param36 = ((8'ha7) ? (~&((&(~^(7'h44))) ? (((8'ha5) == (8'hb5)) << {(8'hba)}) : (((8'had) <= (8'haa)) ? ((8'ha7) < (8'haa)) : {(8'ha5)}))) : {((((8'hbc) >= (7'h44)) >>> ((8'haa) ? (8'hb6) : (8'haa))) ? (-((7'h43) < (8'hb8))) : (((8'hb0) <= (8'ha3)) ? (~|(8'haf)) : ((8'hb0) ? (8'hba) : (8'hbf)))), (!(((8'hb8) && (8'hbc)) ? {(7'h44), (7'h44)} : ((8'hbb) ? (8'hb1) : (8'haa))))}), 
parameter param37 = ({({(param36 & param36), param36} ? (^(-param36)) : (|param36)), (^~(^(param36 ? param36 : param36)))} || {(~(((8'hb9) == param36) ^~ param36)), (({param36, (8'ha4)} > (param36 && param36)) ? param36 : ((param36 == param36) == (param36 && param36)))}))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire13;
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  assign y = {wire30,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire13,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire13 = $signed((|(&wire11)));
  always
    @(posedge clk) begin
      reg14 <= wire11;
      if ((wire10 ? reg14[(1'h0):(1'h0)] : $unsigned((8'ha0))))
        begin
          reg15 <= ((8'ha2) ?
              {reg14[(4'h9):(2'h3)]} : ((wire12 ?
                      wire8[(2'h2):(1'h1)] : $unsigned($unsigned(wire12))) ?
                  (8'ha1) : wire11));
          reg16 <= $signed(wire11);
          if ((wire13[(4'hb):(4'h9)] ? $signed(reg16[(4'h9):(3'h6)]) : reg14))
            begin
              reg17 <= (~$unsigned(((reg16 <= $unsigned(wire12)) ?
                  (~&reg16[(2'h2):(2'h2)]) : $unsigned(wire11))));
              reg18 <= $unsigned(($unsigned((wire9[(4'h8):(1'h0)] & (wire11 ~^ wire12))) ?
                  $unsigned((|wire12)) : ((^wire12) - ((wire11 & reg14) ^~ {reg15,
                      (7'h40)}))));
              reg19 <= {wire10};
            end
          else
            begin
              reg17 <= $unsigned(wire11);
              reg18 <= $signed(wire12);
            end
          reg20 <= wire10;
        end
      else
        begin
          reg15 <= $signed(wire11);
          if ((((((wire8 << reg15) ? (reg16 <<< reg17) : (reg20 & wire9)) ?
              (reg15 ?
                  reg20 : (wire11 || wire11)) : reg16[(1'h0):(1'h0)]) - ((wire10 ?
                  {reg19} : {(8'hbf), reg19}) ?
              $signed(wire13[(3'h5):(2'h3)]) : {(reg19 >> reg18)})) < $signed((($unsigned(wire8) ?
                  $signed(reg17) : (~reg14)) ?
              ((reg19 < reg18) >> (8'h9e)) : $unsigned((~|reg14))))))
            begin
              reg16 <= $unsigned($unsigned($signed((&$unsigned(reg16)))));
              reg17 <= (((&$unsigned(reg18)) > wire10) && wire11);
            end
          else
            begin
              reg16 <= $signed(reg19);
              reg17 <= wire9;
              reg18 <= ($unsigned($signed((+wire9))) ?
                  (8'ha7) : ($signed($unsigned((^~reg16))) + $signed($signed({wire10,
                      reg15}))));
              reg19 <= $unsigned((~&((&wire10[(4'h9):(4'h8)]) ?
                  {(reg17 * reg14)} : $signed(wire8))));
            end
          reg20 <= reg20;
          reg21 <= {reg15[(4'hc):(3'h7)]};
        end
    end
  assign wire22 = wire8[(5'h10):(3'h5)];
  assign wire23 = {(^~reg20)};
  assign wire24 = (^~reg18);
  assign wire25 = ($unsigned($unsigned($signed((~|wire12)))) > reg16[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      reg26 <= wire24;
      reg27 <= ({wire22[(4'hd):(4'h9)]} ?
          (~^$unsigned(wire13[(4'hc):(4'hb)])) : {reg18[(4'ha):(3'h5)],
              {((reg17 <= (8'ha7)) | (reg17 ? reg20 : wire12))}});
      reg28 <= (&(-(~$unsigned($unsigned((8'hb1))))));
      reg29 <= wire12;
    end
  assign wire30 = ($unsigned(($unsigned((reg16 ? (8'hbf) : wire11)) ?
                      $signed((^(8'hb3))) : wire12)) ^~ ((!$signed($unsigned(wire8))) != reg29));
  always
    @(posedge clk) begin
      if ((|(~{$unsigned({wire30}), $unsigned($unsigned(reg15))})))
        begin
          reg31 <= reg28;
          reg32 <= $signed((+reg31[(3'h7):(3'h4)]));
        end
      else
        begin
          reg31 <= wire12;
          reg32 <= (($unsigned(reg16[(4'ha):(1'h0)]) & reg28[(3'h7):(3'h6)]) ?
              ({(wire10 ? ((8'hbb) ? reg19 : reg26) : (8'hb7)), (-(+(8'hb7)))} ?
                  (8'hbe) : (~&((wire23 << wire22) ?
                      $signed(reg14) : reg21[(3'h5):(1'h1)]))) : $unsigned((reg18[(4'h8):(3'h5)] >= $signed((reg15 ?
                  reg18 : reg19)))));
        end
      reg33 <= $unsigned(((reg19 ?
              $signed({reg32, wire10}) : ((wire9 * reg28) != (wire10 ?
                  reg27 : wire10))) ?
          $signed(((8'ha3) ?
              {reg19, wire13} : {wire22, wire8})) : {(-(&wire10))}));
      reg34 <= (~|$signed(reg28[(3'h7):(3'h4)]));
      reg35 <= wire8;
    end
endmodule

module module82
#(parameter param109 = ((~^({((8'hb5) & (8'hb9))} ~^ (((8'hb5) | (7'h44)) ? ((8'ha8) ? (8'hac) : (8'ha4)) : {(8'haa), (8'hb3)}))) | (((~(~(7'h41))) || (~((8'hbd) ? (8'ha0) : (8'hb9)))) + (^~(((8'hb3) * (8'hb2)) ? ((8'ha7) <= (8'hb3)) : (~&(8'haf)))))))
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire87;
  input wire [(5'h12):(1'h0)] wire86;
  input wire [(4'h8):(1'h0)] wire85;
  input wire [(4'he):(1'h0)] wire84;
  input wire [(3'h5):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  assign y = {wire101,
                 wire98,
                 wire97,
                 wire89,
                 wire88,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg100,
                 reg99,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire88 = $unsigned((~&wire87[(4'hd):(4'h9)]));
  assign wire89 = {(($signed($signed(wire85)) ?
                              {wire83} : ((wire83 & (8'ha7)) <<< wire88)) ?
                          (wire85 ? (~&(^~(8'ha9))) : (8'ha2)) : ((wire83 ?
                                  (wire85 != wire88) : wire83[(2'h3):(2'h2)]) ?
                              wire83 : wire87[(3'h4):(2'h2)])),
                      wire87[(4'hd):(2'h2)]};
  always
    @(posedge clk) begin
      reg90 <= wire88;
      reg91 <= $unsigned(wire89[(2'h3):(2'h3)]);
      reg92 <= wire85[(3'h6):(3'h5)];
      if (wire88)
        begin
          reg93 <= $unsigned({{(wire85 ?
                      (wire86 ? wire87 : (8'hbf)) : (8'ha0))}});
          reg94 <= reg92[(4'hc):(3'h6)];
          reg95 <= reg92;
          reg96 <= (~|(-$signed((~reg91[(5'h13):(1'h0)]))));
        end
      else
        begin
          reg93 <= wire89[(2'h3):(2'h2)];
          reg94 <= $unsigned($unsigned(reg93[(4'hd):(2'h2)]));
          reg95 <= (~|$unsigned({wire85, reg91}));
          reg96 <= ((+$signed($unsigned(reg93))) ?
              $unsigned(wire86[(3'h5):(3'h5)]) : {(((~&wire86) == $signed(reg95)) >>> wire83[(1'h1):(1'h0)])});
        end
    end
  assign wire97 = $signed((~&$signed($signed($signed(wire85)))));
  assign wire98 = {(wire86 ?
                          (|$signed((wire86 | wire88))) : reg95[(3'h5):(1'h1)]),
                      (^~$signed($unsigned((-wire88))))};
  always
    @(posedge clk) begin
      reg99 <= $signed(reg96);
      reg100 <= $signed(reg92);
    end
  assign wire101 = ($signed((($signed(reg94) ?
                       (reg92 >= reg90) : $unsigned(wire88)) && $signed($unsigned(reg91)))) ~^ ((((reg100 ~^ reg99) >>> (8'hae)) ?
                           $unsigned((wire97 ?
                               wire83 : (8'h9c))) : (((8'had) * reg100) ?
                               (wire85 ? reg96 : reg93) : (8'hb4))) ?
                       reg93 : wire87));
  always
    @(posedge clk) begin
      reg102 <= ((!(^($unsigned(reg91) << wire101[(4'hc):(4'h8)]))) - (reg95[(3'h6):(3'h5)] ?
          $signed(wire85[(1'h1):(1'h1)]) : reg93[(4'hb):(4'h9)]));
      reg103 <= wire88;
      if ((($unsigned({{wire88,
              (8'hba)}}) + reg90[(4'h9):(1'h0)]) < {(reg91[(1'h1):(1'h1)] << $signed((wire84 == wire98))),
          (((~|wire87) ?
              (+wire86) : $unsigned(reg100)) <<< (-(reg95 ^ reg92)))}))
        begin
          if ((|{((^~(^~wire87)) >= (((8'ha7) <= (8'h9c)) == wire83)),
              wire86[(3'h5):(1'h0)]}))
            begin
              reg104 <= $unsigned(($signed((~^(wire88 | wire89))) & (wire101[(5'h10):(2'h2)] >= ((&reg102) ?
                  reg103 : (reg102 ^~ wire101)))));
              reg105 <= $signed(((wire87[(1'h0):(1'h0)] ?
                  ($unsigned(reg102) <= (reg92 == wire89)) : $unsigned((8'hb3))) && (reg99[(3'h6):(3'h6)] != (!reg90[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg104 <= reg94;
              reg105 <= (+reg102);
            end
          reg106 <= $signed(reg91);
        end
      else
        begin
          reg104 <= (($signed(((&(8'ha2)) | $signed(reg100))) ?
                  wire88 : $unsigned(reg91[(4'hf):(3'h7)])) ?
              $signed($signed({$unsigned(reg103),
                  (wire101 <<< wire88)})) : ($unsigned(($unsigned((7'h42)) ?
                  $signed(wire84) : (+reg99))) < ((~&$unsigned(reg106)) > wire84)));
          reg105 <= reg93;
        end
      reg107 <= ((-wire88[(4'hd):(3'h7)]) >> (^wire86[(4'hd):(2'h3)]));
      reg108 <= $unsigned({wire86[(3'h4):(1'h1)]});
    end
endmodule
