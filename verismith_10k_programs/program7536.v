module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire138;
  wire [(5'h13):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire131;
  wire [(4'h8):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire117;
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire131,
                 wire79,
                 wire7,
                 wire4,
                 wire81,
                 wire117,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {(|wire2), ($unsigned(wire1[(3'h4):(3'h4)]) && (8'hbb))};
  always
    @(posedge clk) begin
      reg5 <= (((((wire4 ? wire2 : wire1) >> $unsigned(wire2)) ?
                  wire1[(3'h7):(3'h6)] : wire0) ?
              (8'h9c) : wire3[(3'h7):(3'h4)]) ?
          $signed({$signed(wire0), {wire3[(3'h5):(2'h3)]}}) : wire4);
      reg6 <= $unsigned($signed($signed((~^$unsigned(wire1)))));
    end
  assign wire7 = $unsigned($signed($unsigned({(wire4 ? wire0 : reg5),
                     $signed((8'h9c))})));
  module8 #() modinst80 (.y(wire79), .wire10(wire4), .wire9(wire7), .wire11(wire3), .wire13(reg6), .clk(clk), .wire12(reg5));
  assign wire81 = (|(reg5[(3'h6):(3'h4)] ?
                      reg5[(3'h4):(1'h0)] : $signed($signed($signed((8'hb8))))));
  module82 #() modinst118 (wire117, clk, wire0, wire4, reg5, reg6, wire81);
  always
    @(posedge clk) begin
      if ((-reg6))
        begin
          reg119 <= wire4[(4'ha):(3'h4)];
          reg120 <= $unsigned({$unsigned((reg5 ^ ((8'hbe) <<< reg6))),
              {(8'hae)}});
        end
      else
        begin
          if (wire117[(3'h5):(2'h3)])
            begin
              reg119 <= {(~|(&wire0))};
              reg120 <= $signed(($unsigned((reg119[(3'h5):(3'h4)] ?
                  wire1[(4'h8):(2'h2)] : wire2[(2'h3):(1'h1)])) >> (($unsigned(reg5) ?
                      (8'hbe) : (reg120 ? reg5 : wire1)) ?
                  ($unsigned(reg119) ?
                      (!wire7) : (wire3 ? wire81 : wire0)) : (8'hbf))));
              reg121 <= $unsigned((+((^wire7) ?
                  (~^(8'hb2)) : (reg5 ? (~^wire81) : (|wire1)))));
              reg122 <= wire81;
            end
          else
            begin
              reg119 <= {((wire1[(1'h0):(1'h0)] ?
                          ((wire0 | reg119) * ((8'had) ?
                              wire1 : reg121)) : wire117[(2'h3):(1'h0)]) ?
                      wire79[(2'h3):(1'h0)] : (wire117 ?
                          wire79[(4'h8):(3'h7)] : $unsigned((wire117 ?
                              wire79 : wire4))))};
              reg120 <= $signed({(wire2[(2'h3):(2'h2)] >= $signed((~^reg121)))});
            end
          if ((~|(!$signed(wire81))))
            begin
              reg123 <= ((wire4[(3'h7):(3'h7)] << ($unsigned((~reg5)) || $signed(wire79[(3'h7):(3'h5)]))) & (-(($unsigned(wire81) ?
                  reg120 : $unsigned(reg122)) >> wire81[(1'h1):(1'h0)])));
              reg124 <= reg121[(1'h0):(1'h0)];
            end
          else
            begin
              reg123 <= (!$signed((reg123 | wire7)));
            end
          if (reg6[(5'h14):(5'h12)])
            begin
              reg125 <= (({$unsigned(((7'h42) ^~ wire0)),
                      $signed(wire0)} <<< (({(8'ha2)} ?
                          (~reg5) : $signed((7'h41))) ?
                      $signed($unsigned((8'ha1))) : $signed($signed(reg122)))) ?
                  wire3 : $unsigned($signed($signed($signed((8'haf))))));
              reg126 <= ($signed($signed($signed((|(8'ha2))))) == (|$signed((-reg5[(4'ha):(3'h6)]))));
              reg127 <= reg6;
              reg128 <= wire2[(1'h0):(1'h0)];
              reg129 <= (^wire81);
            end
          else
            begin
              reg125 <= (wire4 ?
                  $unsigned((~&({reg123, reg120} ?
                      {wire4} : $signed((8'hae))))) : {$signed(($unsigned(wire0) & (wire4 >>> reg125))),
                      (((reg121 ? wire0 : reg120) ? (~wire0) : {(7'h43)}) ?
                          wire79[(3'h5):(1'h0)] : {{(8'hbd), wire79}})});
              reg126 <= $signed(($signed($signed((wire117 >> wire0))) ?
                  (((reg5 ? wire0 : wire2) ?
                      $signed(wire81) : reg127[(1'h1):(1'h0)]) | $unsigned((!reg129))) : ((~&{wire0,
                      reg123}) | ((wire4 ? reg127 : wire3) ?
                      (wire7 && reg124) : (!reg119)))));
            end
        end
      reg130 <= (reg123 ^~ wire0[(3'h5):(2'h3)]);
    end
  assign wire131 = $signed($unsigned(wire1));
  always
    @(posedge clk) begin
      reg132 <= wire4[(1'h0):(1'h0)];
      reg133 <= $unsigned({$signed(reg130), reg123});
      reg134 <= reg126;
      reg135 <= ($unsigned($signed($unsigned((-wire2)))) || (&($signed((-reg126)) | {(!(8'hb4))})));
    end
  assign wire136 = wire79[(3'h7):(2'h3)];
  assign wire137 = (wire3[(3'h6):(1'h1)] ?
                       (^wire79[(3'h5):(3'h5)]) : (reg127[(1'h1):(1'h1)] ^ (|reg124[(3'h4):(1'h1)])));
  assign wire138 = (wire3[(2'h2):(2'h2)] - ((($unsigned(reg130) <<< reg125[(4'h9):(1'h1)]) ?
                       wire136[(3'h4):(3'h4)] : (reg5[(4'ha):(3'h6)] << reg129)) ^ (reg130[(2'h3):(1'h1)] ?
                       ({wire2, wire131} ?
                           $unsigned(reg5) : {reg130, wire137}) : reg128)));
endmodule

module module82
#(parameter param116 = {(-(({(8'hae)} ~^ ((8'hac) ^~ (8'ha5))) < {{(8'hb6)}})), (^((~|(|(8'hbd))) ? (-(^~(8'ha4))) : {{(8'hbd)}}))})
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire87;
  input wire [(2'h2):(1'h0)] wire86;
  input wire signed [(4'hf):(1'h0)] wire85;
  input wire [(3'h7):(1'h0)] wire84;
  input wire [(3'h5):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire113;
  wire signed [(4'hd):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  assign y = {wire115,
                 wire113,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 (1'h0)};
  assign wire88 = (-(!$signed(((wire87 ^~ wire84) + $unsigned(wire85)))));
  assign wire89 = (^(8'hb5));
  assign wire90 = $unsigned($unsigned(wire84[(1'h0):(1'h0)]));
  assign wire91 = (~|(wire87[(3'h6):(2'h3)] ?
                      (^(&(~&wire85))) : wire86[(1'h0):(1'h0)]));
  assign wire92 = wire88;
  assign wire93 = wire91[(4'hd):(1'h1)];
  module94 #() modinst114 (wire113, clk, wire87, wire93, wire85, wire89);
  assign wire115 = $signed(($unsigned({(8'hae)}) ^ ((~^$signed((7'h42))) || wire113)));
endmodule

module module8
#(parameter param78 = ((|(({(8'ha5)} | (~|(8'ha6))) & ((+(7'h44)) + (!(8'hbc))))) ? (((^~((8'hb5) < (8'ha2))) ? (-{(7'h42), (8'hac)}) : ({(7'h43)} ? ((8'ha9) ^ (8'ha6)) : ((8'ha2) ? (8'hbc) : (8'hbd)))) ~^ ({((8'haa) <= (7'h42)), ((8'ha4) ^ (8'hb4))} ? {{(8'hb8), (8'ha2)}, (~&(7'h40))} : {(^~(8'ha2)), (~&(7'h42))})) : (8'hae)))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire76;
  assign y = {wire27, wire14, wire29, wire30, wire76, (1'h0)};
  assign wire14 = (&wire11[(3'h6):(1'h0)]);
  module15 #() modinst28 (wire27, clk, wire13, wire10, wire11, wire9, wire14);
  assign wire29 = (wire14 ?
                      $unsigned(wire27[(4'hb):(3'h4)]) : wire12[(3'h5):(2'h2)]);
  assign wire30 = ($unsigned(($unsigned(((8'hb4) ? (8'ha6) : wire9)) ?
                      ((wire9 && wire14) ?
                          $unsigned(wire29) : wire14) : ($signed(wire14) ?
                          wire9[(2'h2):(1'h0)] : {wire12}))) | wire13[(3'h7):(3'h7)]);
  module31 #() modinst77 (wire76, clk, wire9, wire27, wire13, wire10, wire12);
endmodule

module module31
#(parameter param75 = (8'hba))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire36;
  input wire signed [(4'hb):(1'h0)] wire35;
  input wire [(2'h3):(1'h0)] wire34;
  input wire signed [(2'h2):(1'h0)] wire33;
  input wire [(4'he):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire53,
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
                 wire37,
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
                 reg52,
                 (1'h0)};
  assign wire37 = $signed($signed(wire35));
  assign wire38 = (wire37[(2'h3):(1'h1)] >> {wire36[(1'h1):(1'h0)]});
  assign wire39 = wire38;
  assign wire40 = $signed(((wire39[(4'h9):(1'h0)] * ((8'hab) ?
                      (wire38 ? wire37 : wire33) : {wire32,
                          wire33})) - $unsigned(($signed(wire32) ?
                      wire37[(4'hd):(4'hb)] : $unsigned(wire39)))));
  assign wire41 = wire33[(1'h0):(1'h0)];
  assign wire42 = $unsigned(($signed(wire38[(3'h4):(2'h3)]) ?
                      ($unsigned((wire32 + wire32)) ?
                          $signed((!wire34)) : $unsigned($unsigned(wire41))) : wire38[(4'hb):(3'h5)]));
  assign wire43 = ({wire38, $signed((!$signed(wire41)))} ?
                      ($signed($signed(wire35)) <<< $unsigned($signed($signed(wire33)))) : (wire34 ?
                          $unsigned(($signed((7'h44)) ?
                              (-wire35) : wire40[(1'h1):(1'h1)])) : ($signed((wire40 && wire42)) ?
                              ($signed((8'h9f)) << wire35) : ((~&(8'hbc)) ?
                                  (-wire37) : (wire36 ? wire41 : wire35)))));
  assign wire44 = (+wire33);
  assign wire45 = ($signed(((((8'haf) >> wire43) != wire36) == $unsigned(wire34[(2'h3):(2'h2)]))) != wire37[(3'h6):(2'h2)]);
  assign wire46 = ($unsigned(wire32) ?
                      (+wire38[(2'h3):(2'h3)]) : $signed((wire44 && wire42)));
  assign wire47 = $unsigned(wire38);
  assign wire48 = $signed(((((wire35 << wire42) <<< wire34) ?
                          wire33 : $unsigned($signed(wire39))) ?
                      (&$signed(wire38)) : $unsigned($unsigned(wire42[(5'h10):(3'h6)]))));
  assign wire49 = {(wire35[(3'h5):(3'h4)] == wire36)};
  assign wire50 = $unsigned((^~$signed($signed({(8'hab)}))));
  assign wire51 = ($signed((|wire47[(1'h1):(1'h1)])) <= wire37);
  always
    @(posedge clk) begin
      reg52 <= ($signed($signed(($signed(wire46) | $signed(wire44)))) ?
          wire41 : wire36[(3'h5):(3'h4)]);
    end
  assign wire53 = ((wire38 ?
                          (-$unsigned((wire49 ?
                              wire42 : wire36))) : (+$unsigned((~&wire45)))) ?
                      {wire45, {($unsigned((7'h44)) > wire34)}} : wire50);
  always
    @(posedge clk) begin
      if (($unsigned((+(7'h42))) != wire46[(2'h2):(2'h2)]))
        begin
          if (wire40[(4'h8):(3'h6)])
            begin
              reg54 <= (+((wire50[(4'h9):(3'h6)] > ((8'ha6) ?
                  (wire51 >>> wire40) : $signed(wire45))) <= {$unsigned((reg52 ?
                      wire38 : wire50))}));
            end
          else
            begin
              reg54 <= wire35;
              reg55 <= {$unsigned((8'hb3)),
                  (wire40 & (wire34 ? wire35 : (-(wire47 >> wire46))))};
              reg56 <= $unsigned((|reg55[(3'h7):(3'h7)]));
              reg57 <= wire39;
            end
          reg58 <= ((^wire45) < wire38[(1'h0):(1'h0)]);
          reg59 <= (+(|$signed($unsigned($signed(wire36)))));
        end
      else
        begin
          reg54 <= reg52;
          if ({({{{reg54, (8'hae)}, $unsigned(reg52)}, (wire49 || wire39)} ?
                  (^(~^reg56[(4'h8):(3'h4)])) : $unsigned((!$signed(wire34))))})
            begin
              reg55 <= reg55[(3'h6):(1'h0)];
            end
          else
            begin
              reg55 <= {(((wire47 ?
                          $signed(wire43) : (wire42 ? (8'had) : reg56)) ?
                      reg58[(1'h1):(1'h1)] : (((8'h9d) != wire36) && (wire42 && reg58))) < ($signed((wire53 ?
                      wire50 : (8'ha9))) << (reg56 ?
                      wire34[(2'h3):(1'h0)] : {wire47, (8'hb5)})))};
              reg56 <= wire43;
            end
          if ($signed(((($signed(wire50) ?
              ((7'h41) ? wire32 : (8'had)) : {wire49, wire47}) ^~ ((wire40 ?
                  (7'h44) : wire39) ?
              wire47 : $unsigned(reg58))) == $unsigned({wire41}))))
            begin
              reg57 <= reg59[(1'h1):(1'h1)];
              reg58 <= reg57[(3'h5):(3'h5)];
              reg59 <= wire38;
            end
          else
            begin
              reg57 <= wire40[(1'h1):(1'h1)];
              reg58 <= wire32[(3'h7):(3'h5)];
            end
          reg60 <= (reg55[(5'h11):(4'h8)] >>> $unsigned(($unsigned(reg59) ?
              wire32 : {((8'had) ^ wire48), ((8'h9c) ? (8'hb9) : wire44)})));
          reg61 <= $unsigned($unsigned({(&(wire40 ? wire34 : (7'h44))),
              $unsigned({reg58})}));
        end
      reg62 <= ($signed({((wire32 ^~ wire43) << (wire38 ^~ wire53))}) - $unsigned(wire42[(2'h2):(1'h1)]));
      if (((&wire48) == wire39[(4'hc):(4'hb)]))
        begin
          if ({(8'hb5)})
            begin
              reg63 <= ((wire50[(3'h5):(2'h2)] ?
                  (&(8'h9f)) : reg54) > {(({wire32, wire35} ?
                      (8'ha0) : (+reg56)) ^~ reg54)});
              reg64 <= (8'haa);
              reg65 <= ($unsigned({((^reg59) << ((8'hbb) ?
                      wire42 : wire49))}) > wire33);
            end
          else
            begin
              reg63 <= (!{(~^$unsigned(reg65[(1'h1):(1'h1)])),
                  reg56[(1'h0):(1'h0)]});
              reg64 <= reg65;
              reg65 <= $unsigned($unsigned((reg60 - reg55[(4'h9):(2'h3)])));
              reg66 <= wire42;
              reg67 <= ($signed(((wire46 ?
                          (wire34 ? reg66 : wire40) : wire33[(1'h0):(1'h0)]) ?
                      $unsigned($signed(wire32)) : $signed(wire50[(4'hc):(3'h7)]))) ?
                  reg61 : reg59);
            end
          reg68 <= (((((-wire44) != $unsigned(wire47)) != wire32) >>> $signed($signed($signed(wire45)))) ?
              ((wire46 != (reg63[(3'h4):(1'h0)] ?
                      $unsigned(reg60) : $signed(wire38))) ?
                  (($unsigned(reg59) && (wire34 && wire38)) ?
                      wire37[(4'hd):(1'h1)] : $unsigned((wire50 ?
                          wire53 : wire45))) : $unsigned((wire32 ^ wire43))) : wire45[(1'h1):(1'h1)]);
          reg69 <= ($signed($unsigned((+(wire45 ? wire39 : reg58)))) ?
              reg58[(2'h3):(2'h3)] : reg63[(3'h6):(1'h0)]);
          if (reg52[(2'h2):(1'h0)])
            begin
              reg70 <= wire33[(2'h2):(2'h2)];
            end
          else
            begin
              reg70 <= (&($unsigned(reg64[(3'h6):(2'h2)]) > wire36[(4'hd):(2'h2)]));
            end
          reg71 <= ($signed(wire43) * {(wire37[(4'hf):(4'hc)] ?
                  ($signed(wire38) != $signed(reg66)) : $unsigned(reg55[(3'h6):(2'h2)])),
              wire41});
        end
      else
        begin
          if ({$signed(wire47)})
            begin
              reg63 <= reg69;
            end
          else
            begin
              reg63 <= (wire43 ?
                  $unsigned($signed($signed((reg67 ~^ reg58)))) : reg68[(4'ha):(4'h9)]);
              reg64 <= (~&(~(-reg67)));
            end
        end
      reg72 <= wire43;
    end
  assign wire73 = reg72;
  assign wire74 = reg58;
endmodule

module module15
#(parameter param26 = (((|(8'h9f)) ? (({(8'had), (8'h9d)} != ((8'hac) ? (8'hb5) : (8'hbc))) ^ ((~&(7'h40)) ? (-(8'ha2)) : ((8'hb8) ? (8'ha5) : (8'h9d)))) : ((((7'h42) <<< (8'ha0)) ? ((8'hbd) | (8'h9c)) : ((8'h9f) <= (8'ha0))) ? (((8'h9e) ? (8'ha6) : (7'h40)) - ((8'h9e) ? (8'ha3) : (8'hb5))) : (~((8'hb9) ^~ (8'hb0))))) ? (|(+(((8'h9c) ? (8'hbf) : (8'hb6)) ? (~&(8'ha5)) : ((8'h9c) >= (7'h40))))) : ((({(8'ha7), (8'hbb)} != {(8'haf), (8'h9f)}) ? (((8'haf) ? (8'hae) : (7'h42)) ? ((8'hb5) ? (7'h41) : (8'hb9)) : ((8'hb2) ? (8'hab) : (8'haa))) : {((7'h43) == (8'ha6)), ((8'h9f) - (8'h9e))}) + (-{(^~(8'ha1)), ((7'h43) >> (8'hb3))}))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire18;
  input wire signed [(4'hb):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  assign y = {wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = {wire19};
  assign wire22 = $unsigned($signed($unsigned(wire20)));
  assign wire23 = ((~(($unsigned(wire16) >> $unsigned(wire22)) ^ $unsigned($unsigned(wire18)))) - (&$signed(wire17[(4'h9):(3'h4)])));
  assign wire24 = (wire23 ? wire17 : wire20[(1'h1):(1'h0)]);
  assign wire25 = wire19[(2'h2):(1'h0)];
endmodule

module module94
#(parameter param112 = (&(-{{((8'ha9) ? (8'h9d) : (8'hbd))}})))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire98;
  input wire [(3'h6):(1'h0)] wire97;
  input wire signed [(4'hf):(1'h0)] wire96;
  input wire [(3'h5):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire111;
  wire [(4'hb):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire [(5'h12):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire104;
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire106,
                 wire104,
                 reg108,
                 reg105,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg99 <= wire96[(3'h6):(3'h5)];
      reg100 <= wire95[(3'h5):(3'h5)];
      reg101 <= (wire98[(1'h0):(1'h0)] >= wire97);
    end
  always
    @(posedge clk) begin
      reg102 <= ((~{$unsigned(reg100[(1'h1):(1'h1)])}) & {reg99[(2'h2):(1'h0)]});
      reg103 <= reg100;
    end
  assign wire104 = (!wire95[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg105 <= ($unsigned(((|(~^wire97)) ?
              ($unsigned((8'hbf)) >> (&reg100)) : $signed(wire97))) ?
          (+((~(+wire98)) ?
              $unsigned((8'hb3)) : wire95[(1'h1):(1'h1)])) : $unsigned(wire104));
    end
  assign wire106 = wire104;
  assign wire107 = (|wire98[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg108 <= wire98[(1'h1):(1'h0)];
    end
  assign wire109 = $unsigned(((~^(!wire104[(4'hf):(4'hd)])) - (reg101[(3'h7):(3'h6)] >>> $unsigned($signed(reg100)))));
  assign wire110 = ($signed((wire98 ?
                           reg108[(4'h8):(3'h7)] : reg103[(3'h5):(3'h4)])) ?
                       (wire97 ? $unsigned(reg103) : reg99) : wire98);
  assign wire111 = $unsigned(wire110);
endmodule
