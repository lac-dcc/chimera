module top
#(parameter param108 = (-({({(8'ha0), (8'hae)} != {(8'h9e)})} || ((~|(&(8'ha9))) < ({(7'h41), (8'ha7)} <= (+(8'hbf)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire107;
  wire signed [(2'h3):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire90,
                 wire88,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire4,
                 reg105,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned(wire1[(4'he):(4'hb)]);
  always
    @(posedge clk) begin
      reg5 <= wire3[(4'h8):(3'h7)];
      reg6 <= ($unsigned(wire4[(2'h3):(1'h1)]) - wire2);
    end
  assign wire7 = $signed(reg6);
  assign wire8 = (~&{$unsigned($signed(((8'hb5) ? wire7 : wire7)))});
  assign wire9 = wire4;
  assign wire10 = {wire9[(3'h5):(2'h2)],
                      (((~^reg6[(3'h5):(1'h0)]) >>> ($unsigned(wire3) * {wire0})) ?
                          (wire1[(4'h9):(2'h3)] << (+wire0[(3'h7):(3'h6)])) : {((8'hb7) ?
                                  wire2[(4'hb):(3'h6)] : wire3[(1'h1):(1'h0)])})};
  assign wire11 = reg5[(1'h0):(1'h0)];
  assign wire12 = (wire8[(2'h2):(1'h0)] ?
                      (^wire11) : $signed((wire2 >>> wire11)));
  assign wire13 = ({(~^$unsigned(wire4[(1'h0):(1'h0)])),
                      ((7'h41) <<< (~&wire11[(1'h1):(1'h1)]))} << ((wire8[(2'h3):(1'h1)] || (~^wire2[(4'hb):(2'h2)])) ?
                      {wire10[(4'h8):(3'h6)],
                          (~$unsigned((8'hb2)))} : (~|wire1)));
  assign wire14 = $unsigned(wire4[(2'h3):(2'h2)]);
  assign wire15 = $unsigned(wire0);
  always
    @(posedge clk) begin
      reg16 <= wire0;
      reg17 <= (~&((~|$unsigned((reg6 ? wire10 : wire3))) ?
          $unsigned(wire13[(4'he):(1'h1)]) : wire4[(3'h7):(3'h4)]));
      reg18 <= ((wire9[(5'h10):(4'hf)] ?
          ($signed($signed(wire4)) * wire4) : ($unsigned((^~wire13)) < wire14[(3'h6):(2'h2)])) < $unsigned(wire13[(4'hf):(3'h4)]));
      if (wire13)
        begin
          reg19 <= (((+((wire14 ? wire7 : (8'had)) >= (wire15 || wire14))) ?
                  (|$signed({reg6, wire15})) : wire11[(2'h2):(1'h0)]) ?
              (wire4[(3'h5):(2'h2)] ^ $unsigned(wire14)) : wire4[(2'h3):(1'h1)]);
          if (((reg17[(4'h8):(2'h3)] ?
                  (8'hbc) : {$unsigned((reg16 ? reg6 : reg18)),
                      ({wire2, wire4} ? (wire14 ? (8'hb0) : reg19) : reg17)}) ?
              ((-$unsigned($signed(wire3))) ?
                  (&reg17[(4'he):(4'hd)]) : $unsigned(((wire13 >>> reg16) ?
                      (~&wire3) : $unsigned(wire13)))) : ({($signed(wire2) ^ wire2[(4'he):(4'h9)]),
                      $unsigned({reg6})} ?
                  wire7 : {($unsigned(reg19) & (reg6 > (7'h42))),
                      ($signed(reg18) || $signed(wire13))})))
            begin
              reg20 <= wire14[(1'h0):(1'h0)];
              reg21 <= ({$signed(((-(8'ha1)) ?
                          $unsigned(wire14) : (wire11 >= (8'hbc))))} ?
                  $unsigned(reg18[(3'h6):(3'h5)]) : (reg5[(2'h3):(1'h0)] ?
                      reg20 : $unsigned(reg19[(5'h14):(4'he)])));
            end
          else
            begin
              reg20 <= wire7[(5'h11):(4'h9)];
            end
        end
      else
        begin
          reg19 <= {$unsigned((8'ha9)), $signed((|{(wire9 <<< (8'h9f))}))};
        end
    end
  module22 #() modinst89 (wire88, clk, wire4, wire1, reg18, reg17);
  assign wire90 = $unsigned($signed($signed((|wire8))));
  always
    @(posedge clk) begin
      reg91 <= (!(8'hb3));
      reg92 <= $unsigned($signed((^wire15[(1'h1):(1'h1)])));
      if ($signed(((&$unsigned($unsigned(wire15))) | ($signed((reg16 ?
          (8'hab) : wire8)) >= {(wire90 ? reg91 : wire10)}))))
        begin
          if (wire9)
            begin
              reg93 <= $unsigned((reg17 ~^ (^wire0[(3'h7):(3'h7)])));
              reg94 <= {($unsigned(reg21) | ((!$signed(wire7)) ?
                      (+$signed((8'ha0))) : wire12)),
                  (reg91 - wire90)};
              reg95 <= $signed($signed((^((reg91 ? wire0 : wire9) ?
                  $unsigned(wire14) : (8'haf)))));
            end
          else
            begin
              reg93 <= ((|((((8'had) ?
                      reg93 : wire9) == reg6[(4'hb):(3'h5)]) >= $signed($unsigned((8'hb0))))) ?
                  {wire9,
                      $unsigned($signed((wire0 ? wire0 : wire9)))} : wire12);
            end
          if (wire11)
            begin
              reg96 <= (^(&$unsigned($signed(wire11))));
              reg97 <= ($signed({(8'haa)}) ?
                  (~|(8'ha5)) : $signed($signed(wire8[(1'h0):(1'h0)])));
            end
          else
            begin
              reg96 <= ($unsigned((-$signed($signed(reg96)))) ?
                  ({($signed(wire7) & (^~reg92)),
                      $signed($unsigned(wire14))} < $unsigned((|reg21[(1'h0):(1'h0)]))) : {$signed((wire15[(1'h0):(1'h0)] >= (wire90 == reg6)))});
            end
          reg98 <= $unsigned(wire88[(4'hd):(4'ha)]);
          reg99 <= $signed($signed((wire3 >>> $signed((reg20 & reg92)))));
        end
      else
        begin
          reg93 <= $unsigned((!(+reg91[(2'h2):(2'h2)])));
        end
      reg100 <= (reg93 ?
          ((((!wire11) | wire4) ?
              $unsigned((reg91 > reg92)) : $signed(wire8[(2'h3):(2'h2)])) | reg93[(2'h2):(1'h1)]) : (((-$unsigned(reg5)) ?
                  wire8 : $unsigned((wire11 <<< reg19))) ?
              (!reg91) : ({(~^reg93)} ?
                  (wire15 >>> wire1[(1'h0):(1'h0)]) : (((7'h44) ?
                      (8'hb1) : reg16) ^~ wire8))));
    end
  assign wire101 = $signed($unsigned($unsigned(reg97[(1'h0):(1'h0)])));
  assign wire102 = $unsigned((wire4[(3'h7):(3'h6)] <= reg95));
  assign wire103 = ((($signed(wire4[(4'ha):(3'h6)]) != $signed((wire1 ?
                       wire90 : wire102))) > wire2) <= ($unsigned((~&(wire2 ^ reg93))) ?
                       $unsigned((8'hb3)) : $unsigned($signed($signed((7'h40))))));
  assign wire104 = $unsigned(({$signed(wire90[(1'h1):(1'h1)])} ^ {reg18[(3'h5):(2'h2)]}));
  always
    @(posedge clk) begin
      reg105 <= $signed($signed((~&$signed({reg99}))));
    end
  assign wire106 = (($unsigned((|(wire14 <= reg105))) ?
                           wire1[(2'h3):(2'h3)] : $unsigned((wire7[(4'hc):(2'h3)] || wire10[(3'h4):(2'h2)]))) ?
                       (((~&reg20) ?
                               (!(wire102 ?
                                   (8'had) : wire4)) : (~|$unsigned(wire88))) ?
                           (~&((~^reg20) ?
                               {reg100} : wire2[(4'he):(4'hd)])) : {wire9[(2'h2):(2'h2)],
                               ((reg16 <<< wire88) ?
                                   ((8'hb6) > reg6) : (reg99 ?
                                       reg105 : wire4))}) : (^(wire0[(1'h1):(1'h0)] ?
                           (reg92[(4'hd):(3'h5)] && $unsigned(reg98)) : wire103[(3'h5):(3'h4)])));
  assign wire107 = (wire14 ^~ $signed((wire15 < reg5)));
endmodule

module module22
#(parameter param86 = (~(~^((8'hb9) ? {{(8'h9e), (8'haa)}} : ((~^(8'hb6)) <= {(8'had)})))), 
parameter param87 = ((^((~(param86 ? param86 : param86)) <<< param86)) << (~&(((param86 ? (8'hbc) : param86) ? (^param86) : (~^param86)) >> (((8'hb6) || (7'h42)) ? (param86 <<< param86) : (-param86))))))
(y, clk, wire23, wire24, wire25, wire26);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire23;
  input wire [(3'h5):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire72;
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  assign y = {wire85,
                 wire75,
                 wire74,
                 wire27,
                 wire28,
                 wire29,
                 wire32,
                 wire33,
                 wire49,
                 wire72,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire27 = wire25;
  assign wire28 = wire25[(3'h4):(3'h4)];
  assign wire29 = ((~(7'h40)) < {wire24,
                      $unsigned(($unsigned((8'haf)) >>> (|wire25)))});
  always
    @(posedge clk) begin
      reg30 <= $signed(wire23);
      reg31 <= {$signed(wire24)};
    end
  assign wire32 = wire24[(2'h3):(2'h2)];
  assign wire33 = ($unsigned(wire23[(1'h1):(1'h0)]) ? reg31 : {wire24});
  always
    @(posedge clk) begin
      reg34 <= {$signed($unsigned(wire28))};
      reg35 <= $unsigned($unsigned((($unsigned(reg30) - {reg34,
          wire33}) <= (wire27[(1'h0):(1'h0)] >>> $unsigned(reg30)))));
      reg36 <= ($unsigned(({wire33[(4'h8):(1'h0)], $signed(reg31)} ?
          $unsigned({wire32, reg35}) : $signed((wire29 ?
              (8'hab) : wire33)))) << ($signed(($unsigned(wire24) * $unsigned(reg34))) ?
          (+$unsigned($signed(reg30))) : (((wire23 ? wire29 : wire27) ?
                  (|wire32) : $unsigned(wire32)) ?
              $signed({reg34}) : reg35[(1'h1):(1'h0)])));
    end
  always
    @(posedge clk) begin
      if (reg31[(1'h0):(1'h0)])
        begin
          reg37 <= ($signed($unsigned((!{(8'ha6)}))) ?
              (^~{$unsigned($unsigned((8'haf))),
                  $signed({reg31, reg31})}) : (wire33[(3'h4):(2'h2)] ?
                  $unsigned(((~^(7'h42)) >>> $signed(reg35))) : (wire32[(4'ha):(4'h8)] != ((~^wire29) ?
                      (wire33 | wire23) : $unsigned(reg35)))));
          reg38 <= (reg37[(2'h2):(2'h2)] ?
              (reg34 | (reg34 ?
                  $signed(((8'hac) >> reg37)) : (wire33[(1'h1):(1'h1)] ?
                      wire27[(3'h4):(2'h2)] : $unsigned(reg37)))) : $signed(reg37));
          reg39 <= (wire32 <<< (((~^(7'h44)) ?
                  (8'h9d) : {$signed(wire33), $signed(wire24)}) ?
              $signed((^$signed(wire23))) : reg36[(3'h4):(2'h2)]));
          reg40 <= {reg35[(1'h0):(1'h0)],
              (wire33 ?
                  ((8'had) ^~ $unsigned({(8'hbc),
                      wire28})) : reg31[(3'h5):(3'h4)])};
        end
      else
        begin
          if ($unsigned($unsigned(reg36[(2'h3):(1'h1)])))
            begin
              reg37 <= $signed((|(!$signed((wire28 ? reg30 : (8'haf))))));
              reg38 <= wire32[(5'h15):(4'h8)];
            end
          else
            begin
              reg37 <= (!(~($unsigned({reg38}) + {reg34[(4'hd):(1'h1)],
                  $unsigned((8'h9e))})));
              reg38 <= $unsigned($unsigned((((wire26 ?
                      reg30 : (8'hbd)) ^~ (reg35 && (8'hbd))) ?
                  ((~|wire24) ?
                      $signed(reg34) : $unsigned(reg40)) : $signed(wire23))));
              reg39 <= ((wire33 ?
                  (!(wire24 ?
                      (reg38 ? (8'ha2) : (8'ha5)) : (|wire27))) : (!(wire29 ?
                      (!reg40) : (wire26 ? reg37 : wire26)))) ^ (wire23 ?
                  wire26 : (+$signed((wire32 + (8'h9d))))));
              reg40 <= {$unsigned((reg31[(1'h0):(1'h0)] ?
                      ((!wire23) || (reg38 << wire29)) : reg37[(1'h0):(1'h0)])),
                  ((^~wire28[(4'h8):(4'h8)]) + (($signed(reg37) ?
                      $unsigned(reg39) : {reg31, (8'haa)}) * wire33))};
              reg41 <= wire28[(4'h9):(3'h7)];
            end
          reg42 <= reg37;
          if (reg39)
            begin
              reg43 <= (-((8'ha4) <<< ((reg35[(2'h2):(2'h2)] <<< (reg38 ?
                      reg42 : wire28)) ?
                  ($signed(wire28) ?
                      (~&wire26) : (|wire24)) : $unsigned(reg36))));
              reg44 <= $signed(reg38[(2'h2):(1'h1)]);
              reg45 <= $signed(wire27);
              reg46 <= $unsigned(reg35[(1'h0):(1'h0)]);
              reg47 <= $signed(reg31);
            end
          else
            begin
              reg43 <= (wire24[(2'h3):(2'h2)] ?
                  (wire29 ^~ (8'hb9)) : $unsigned((~$signed($unsigned(reg38)))));
              reg44 <= {($unsigned($unsigned($signed(reg30))) ?
                      reg45[(4'h9):(3'h7)] : ({{(8'ha6), reg42}} ?
                          (8'ha2) : $signed((wire33 ? reg35 : reg41))))};
              reg45 <= (!(wire28[(3'h7):(3'h5)] != (8'hae)));
            end
        end
      reg48 <= $unsigned((((8'hba) ?
          ($unsigned(wire28) * $unsigned(wire32)) : wire23) ~^ ($unsigned($signed(reg45)) ?
          (-(reg40 ~^ reg40)) : ($signed(wire32) ~^ $unsigned(wire26)))));
    end
  assign wire49 = (8'ha2);
  module50 #() modinst73 (.wire52(reg30), .y(wire72), .wire54(wire27), .wire51(wire49), .wire55(reg48), .wire53(wire25), .clk(clk));
  assign wire74 = ((~^$unsigned((wire25 ? reg43[(2'h3):(2'h2)] : (~^wire72)))) ?
                      (~&reg39) : (&$signed($signed($unsigned(wire29)))));
  assign wire75 = $unsigned(wire25[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      if (($unsigned((8'hab)) ?
          {(&reg30)} : $unsigned($signed($unsigned(wire72[(1'h1):(1'h0)])))))
        begin
          reg76 <= ((&wire29) ?
              (&$unsigned((!(8'hb8)))) : $unsigned(wire29[(1'h0):(1'h0)]));
          reg77 <= $unsigned((|((~^(reg45 ?
              wire74 : reg42)) <= reg47[(3'h5):(2'h2)])));
          if ((($unsigned(wire26) ?
                  ($unsigned($unsigned(reg47)) ?
                      (~|(8'haa)) : (wire32[(3'h7):(3'h5)] ?
                          $unsigned(reg45) : (wire72 ?
                              reg43 : wire75))) : $signed(reg46[(2'h2):(1'h1)])) ?
              $unsigned($signed($signed((reg43 & reg46)))) : (($signed({wire32}) ?
                      wire29[(2'h2):(2'h2)] : $unsigned({reg42, reg30})) ?
                  reg30[(1'h0):(1'h0)] : ($signed(reg31[(3'h7):(1'h0)]) ?
                      $unsigned(reg30[(2'h2):(2'h2)]) : reg44[(1'h1):(1'h0)]))))
            begin
              reg78 <= (wire75[(1'h0):(1'h0)] + (reg47[(4'h9):(4'h9)] * reg45));
              reg79 <= reg35;
              reg80 <= ((-reg34[(4'hc):(3'h6)]) ?
                  ((&$signed((reg76 ?
                      wire72 : (8'hab)))) * {reg78[(1'h0):(1'h0)],
                      $signed($signed(reg46))}) : (reg36 ?
                      (~$unsigned($signed((8'had)))) : reg35));
              reg81 <= ($unsigned((wire72[(4'hc):(4'hb)] >= reg42)) ?
                  $unsigned($unsigned((reg79 || wire27))) : (+{$signed(reg30[(3'h4):(2'h3)]),
                      {(reg46 ? wire25 : wire75)}}));
            end
          else
            begin
              reg78 <= ((reg77 < reg41) ?
                  $signed($unsigned(reg45)) : ($signed((^~wire33)) << $signed({(reg77 + reg30)})));
              reg79 <= $signed(reg41);
              reg80 <= reg34;
              reg81 <= $signed($signed((~|reg47)));
            end
          reg82 <= {((+(^~$unsigned(reg48))) ?
                  $signed({reg30,
                      wire75[(1'h1):(1'h1)]}) : (((wire74 & reg46) != wire29[(3'h6):(3'h5)]) ?
                      reg31[(2'h2):(1'h1)] : ($unsigned(wire26) ?
                          (~^reg48) : wire72[(1'h1):(1'h0)])))};
          reg83 <= (((&(~&$signed(wire25))) ?
              $unsigned(((~reg37) ?
                  (reg41 ?
                      (8'hae) : reg30) : $unsigned((7'h44)))) : (8'hbf)) >= (({(reg37 | wire33),
                  (~&reg35)} ?
              (|$unsigned(reg45)) : (8'hb0)) & reg78));
        end
      else
        begin
          if ($signed((((~^reg46[(2'h3):(2'h3)]) ?
              {$unsigned(wire27)} : (~&(wire29 - reg34))) << (~&($unsigned((8'ha9)) ?
              (!(8'h9d)) : reg35)))))
            begin
              reg76 <= reg48[(4'h8):(3'h6)];
            end
          else
            begin
              reg76 <= {{wire25}};
              reg77 <= reg40[(3'h5):(2'h3)];
            end
          if (reg38)
            begin
              reg78 <= (reg42 ?
                  (|(reg35[(1'h1):(1'h1)] ^~ {$signed(wire23),
                      wire49})) : (8'ha9));
              reg79 <= $unsigned($unsigned(wire72[(1'h0):(1'h0)]));
            end
          else
            begin
              reg78 <= (^~reg77[(3'h4):(3'h4)]);
            end
          reg80 <= (reg34 << (({reg81[(1'h1):(1'h1)],
              $signed((8'ha3))} >> wire28[(4'hb):(4'h9)]) & ({(reg76 | wire29),
                  reg35[(1'h0):(1'h0)]} ?
              ({wire28} * (wire25 ? reg82 : (8'hb2))) : wire75)));
          reg81 <= reg79;
        end
      reg84 <= $signed(reg77);
    end
  assign wire85 = $signed({$unsigned(((wire24 ? wire49 : reg42) >>> {wire24,
                          wire27})),
                      ($unsigned($signed((8'h9d))) & (|(reg44 || wire28)))});
endmodule

module module50  (y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire55;
  input wire signed [(4'hb):(1'h0)] wire54;
  input wire [(4'hb):(1'h0)] wire53;
  input wire signed [(3'h6):(1'h0)] wire52;
  input wire signed [(5'h12):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire56;
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire56,
                 reg71,
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
                 (1'h0)};
  assign wire56 = ((wire52[(2'h2):(1'h1)] == wire52[(3'h4):(3'h4)]) ?
                      (~^wire55) : (wire51[(1'h0):(1'h0)] << wire53[(4'h9):(3'h6)]));
  always
    @(posedge clk) begin
      reg57 <= wire56;
      reg58 <= wire56;
      reg59 <= $unsigned({reg58,
          ((^(8'had)) ? wire52 : $unsigned((wire52 ? wire52 : wire52)))});
      reg60 <= wire54;
      if (reg59[(3'h6):(1'h1)])
        begin
          if ($signed($unsigned(((-wire56) ?
              wire52 : ($signed(wire51) ^ $signed(wire54))))))
            begin
              reg61 <= (8'ha5);
              reg62 <= $unsigned({(wire56 ^ ($signed(wire52) | (reg59 ?
                      wire55 : wire51)))});
              reg63 <= reg62[(4'h8):(3'h4)];
              reg64 <= (reg59 >= reg57);
              reg65 <= (reg60 ?
                  (8'ha5) : $unsigned($signed(((wire52 ?
                      wire51 : reg62) ^~ $signed(wire55)))));
            end
          else
            begin
              reg61 <= ((~&{(8'hb3),
                  ((wire51 > reg59) ?
                      wire51 : $unsigned(reg63))}) <= ($signed((reg60[(1'h0):(1'h0)] ~^ (~&reg65))) != (reg64[(4'ha):(2'h2)] || ((8'ha7) ?
                  $unsigned(wire52) : (wire54 ? reg57 : reg62)))));
              reg62 <= {($signed(reg65[(3'h4):(1'h0)]) ?
                      reg57[(4'h8):(2'h3)] : $signed((^~{wire56, wire55})))};
            end
          reg66 <= wire51;
        end
      else
        begin
          reg61 <= (~|$unsigned(reg66[(1'h1):(1'h1)]));
        end
    end
  always
    @(posedge clk) begin
      reg67 <= {{(-((reg60 ? reg60 : reg59) >> (reg58 ? reg58 : wire55))),
              ($signed(wire52[(2'h2):(2'h2)]) ?
                  $signed((wire54 >= wire51)) : (reg66 | (reg66 ?
                      reg65 : reg66)))},
          $signed($unsigned(wire55))};
    end
  assign wire68 = $unsigned((reg62[(4'h8):(4'h8)] ?
                      $signed(($unsigned(reg61) != reg59[(3'h4):(1'h1)])) : reg61));
  assign wire69 = $unsigned($unsigned(((-(reg67 ? reg57 : reg62)) ?
                      ({wire51} ^~ reg58[(1'h1):(1'h1)]) : $unsigned((wire54 ?
                          wire51 : reg63)))));
  assign wire70 = (&((&reg57[(4'he):(1'h1)]) == (reg64[(4'h8):(1'h0)] ?
                      {wire55} : reg60[(4'hc):(1'h1)])));
  always
    @(posedge clk) begin
      reg71 <= reg65[(3'h7):(3'h6)];
    end
endmodule
