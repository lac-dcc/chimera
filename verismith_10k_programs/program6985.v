module top
#(parameter param283 = ((((((7'h43) | (8'hb8)) ? (~|(7'h40)) : {(8'h9e), (8'hb2)}) ? (!(-(8'hbe))) : (((8'haa) << (8'h9c)) * {(8'hb9)})) <= {({(7'h40), (8'ha2)} & {(8'hab)}), ((&(8'hb5)) ? (8'hb4) : {(8'h9e)})}) ? ((((&(8'h9f)) ? (|(8'hb2)) : {(8'hbd), (8'ha2)}) ? (-(|(8'haa))) : ({(8'h9c)} ? ((8'hbb) ^~ (8'h9f)) : ((7'h41) ? (8'ha0) : (8'ha3)))) ? ((!((8'hae) ? (8'ha8) : (8'hb9))) ? {((8'h9e) ? (8'hb0) : (8'ha8)), ((8'ha8) <<< (8'h9e))} : (((8'h9c) ? (8'ha7) : (8'ha1)) ? ((8'h9e) ~^ (7'h40)) : (|(8'ha4)))) : ((+(~&(8'ha3))) ? {((7'h41) << (7'h42))} : (((8'hb5) ^~ (8'hb0)) ? (^(8'ha2)) : {(8'ha2)}))) : (((&((8'haf) ? (8'ha6) : (8'ha5))) >> (&{(8'ha7)})) <<< {{((8'haf) ? (8'ha8) : (8'hb9)), (~(8'ha7))}, ((~(8'hb7)) ? ((8'ha9) >>> (8'ha8)) : ((8'ha8) >= (8'ha3)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire264;
  wire [(5'h11):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire266;
  wire signed [(4'hd):(1'h0)] wire267;
  wire [(5'h14):(1'h0)] wire268;
  wire [(4'hb):(1'h0)] wire269;
  wire signed [(2'h2):(1'h0)] wire270;
  wire signed [(4'hb):(1'h0)] wire272;
  wire [(3'h4):(1'h0)] wire273;
  wire signed [(3'h4):(1'h0)] wire274;
  wire [(2'h2):(1'h0)] wire280;
  wire signed [(5'h14):(1'h0)] wire281;
  reg [(4'h9):(1'h0)] reg275 = (1'h0);
  reg [(2'h2):(1'h0)] reg276 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg277 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg278 = (1'h0);
  reg [(5'h13):(1'h0)] reg279 = (1'h0);
  assign y = {wire264,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire100,
                 wire266,
                 wire267,
                 wire268,
                 wire269,
                 wire270,
                 wire272,
                 wire273,
                 wire274,
                 wire280,
                 wire281,
                 reg275,
                 reg276,
                 reg277,
                 reg278,
                 reg279,
                 (1'h0)};
  module4 #() modinst101 (wire100, clk, wire2, wire0, wire1, wire3);
  assign wire102 = ($unsigned(({(wire2 ? wire1 : wire2),
                           $signed(wire0)} <<< (^wire1))) ?
                       wire1 : {($signed($signed(wire0)) ?
                               $unsigned((~^wire1)) : $signed((wire2 ?
                                   wire1 : wire100))),
                           (^~($signed(wire100) >>> wire3[(4'ha):(4'ha)]))});
  assign wire103 = {((&{wire3[(4'hd):(2'h3)]}) ?
                           wire3[(4'hc):(1'h0)] : ($signed(wire1) > {wire100[(2'h3):(2'h2)],
                               (^wire1)}))};
  assign wire104 = $unsigned((|$signed(wire0[(3'h4):(2'h3)])));
  assign wire105 = ((|(~^(wire104[(5'h10):(3'h7)] ?
                           wire100 : (wire2 ? wire103 : wire104)))) ?
                       $unsigned((~{{wire103,
                               wire3}})) : $signed(((~(|wire103)) ^~ $signed($unsigned((8'hae))))));
  assign wire106 = wire105;
  module107 #() modinst265 (.wire111(wire100), .wire110(wire103), .wire108(wire106), .wire109(wire1), .y(wire264), .clk(clk), .wire112(wire104));
  assign wire266 = ({(wire103[(4'hc):(3'h4)] ? {$unsigned(wire105)} : wire3)} ?
                       $unsigned((((wire103 && wire0) ? (~wire104) : (~wire2)) ?
                           ((wire100 << wire104) && {wire105,
                               wire1}) : (((8'hae) ?
                               wire2 : wire100) | (~&wire106)))) : wire103);
  assign wire267 = (|((wire3[(4'h9):(3'h7)] ?
                           ({wire103} ~^ (wire2 < wire104)) : wire102[(2'h2):(1'h0)]) ?
                       (+wire104) : wire103[(4'h9):(1'h0)]));
  assign wire268 = ({$signed(wire267)} - ((-(^(wire105 ?
                       wire105 : wire105))) || $unsigned(wire104[(4'hc):(1'h1)])));
  assign wire269 = wire266;
  module4 #() modinst271 (wire270, clk, wire269, wire105, wire268, wire0);
  assign wire272 = ({{$signed(wire270), (+(wire264 ? wire104 : wire2))},
                       (((wire102 & wire267) << wire100[(2'h2):(2'h2)]) | (wire106 ?
                           (wire269 ?
                               wire100 : wire269) : $unsigned(wire3)))} <= (wire105 | (wire269 | {{wire268}})));
  assign wire273 = (7'h40);
  assign wire274 = ((8'hab) < $unsigned(($unsigned((wire100 >>> wire0)) ?
                       ((+wire266) & wire2[(4'h9):(2'h2)]) : $signed(wire3[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg275 <= ({((-wire106[(4'h8):(3'h7)]) ?
                  $unsigned((|wire266)) : ({wire1, (8'hb7)} ?
                      $unsigned(wire104) : (wire269 ? (8'had) : wire106))),
              (({wire264} <= (wire2 ? wire105 : wire104)) ?
                  wire264 : $unsigned($signed(wire103)))} ?
          wire264 : $unsigned((($signed(wire272) >> {wire2,
              wire104}) <= ((wire102 ~^ wire273) ?
              $signed(wire0) : (wire269 * wire267)))));
      reg276 <= (wire266 ?
          wire102 : $unsigned({($unsigned(wire268) ?
                  $unsigned(wire105) : $signed(wire273)),
              $unsigned($signed(wire270))}));
      reg277 <= wire103;
      reg278 <= {$unsigned({((^wire106) == (wire264 ? wire104 : wire270))})};
      reg279 <= (wire0[(4'hc):(1'h0)] <= (&$unsigned(wire270[(1'h0):(1'h0)])));
    end
  assign wire280 = (reg278[(1'h0):(1'h0)] ?
                       wire0[(3'h7):(2'h3)] : $signed($signed($signed({wire274}))));
  module165 #() modinst282 (wire281, clk, wire100, wire105, reg278, wire1);
endmodule

module module107  (y, clk, wire108, wire109, wire110, wire111, wire112);
  output wire [(32'h2cc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire108;
  input wire [(3'h7):(1'h0)] wire109;
  input wire [(3'h5):(1'h0)] wire110;
  input wire signed [(2'h2):(1'h0)] wire111;
  input wire [(4'hd):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire263;
  wire [(4'ha):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire124;
  wire [(5'h14):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire145;
  wire signed [(4'hf):(1'h0)] wire161;
  wire signed [(2'h3):(1'h0)] wire163;
  wire [(5'h12):(1'h0)] wire164;
  wire [(5'h15):(1'h0)] wire193;
  wire signed [(4'hb):(1'h0)] wire195;
  wire [(4'ha):(1'h0)] wire223;
  wire [(3'h4):(1'h0)] wire225;
  wire signed [(3'h6):(1'h0)] wire237;
  wire [(5'h12):(1'h0)] wire261;
  reg signed [(4'h8):(1'h0)] reg240 = (1'h0);
  reg [(5'h10):(1'h0)] reg239 = (1'h0);
  reg [(5'h11):(1'h0)] reg238 = (1'h0);
  reg [(5'h14):(1'h0)] reg236 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg234 = (1'h0);
  reg signed [(4'he):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg232 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg231 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg230 = (1'h0);
  reg [(4'h8):(1'h0)] reg229 = (1'h0);
  reg [(4'hb):(1'h0)] reg228 = (1'h0);
  reg [(5'h11):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg226 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  assign y = {wire263,
                 wire113,
                 wire114,
                 wire124,
                 wire125,
                 wire145,
                 wire161,
                 wire163,
                 wire164,
                 wire193,
                 wire195,
                 wire223,
                 wire225,
                 wire237,
                 wire261,
                 reg240,
                 reg239,
                 reg238,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 (1'h0)};
  assign wire113 = {$unsigned({($signed(wire108) ^ wire109[(3'h7):(3'h5)])})};
  assign wire114 = $signed({wire108,
                       $signed(((wire113 > wire113) < $unsigned((8'hbd))))});
  always
    @(posedge clk) begin
      reg115 <= (!{(+$signed($unsigned((8'hb2))))});
      reg116 <= (-$signed((~|((~wire108) | $signed(wire108)))));
      reg117 <= $signed((($signed(wire113) - ((wire110 & wire109) ?
          (wire110 ? (8'hbf) : wire108) : wire110)) + wire114[(3'h5):(2'h3)]));
      reg118 <= (8'ha3);
      if ((wire112 ^~ $signed((8'h9c))))
        begin
          reg119 <= $signed((-$signed(wire109[(1'h0):(1'h0)])));
          reg120 <= ((8'hab) + (wire110 ?
              {$signed(reg117[(3'h7):(3'h7)])} : $unsigned(($signed(wire113) ?
                  reg115[(3'h4):(1'h1)] : wire112))));
          reg121 <= ($signed(({(wire108 ? reg120 : reg120),
              $unsigned(reg115)} * (&(wire111 ? (8'hb9) : wire113)))) + reg117);
          reg122 <= reg115[(2'h3):(2'h2)];
          reg123 <= {reg117[(3'h4):(2'h3)]};
        end
      else
        begin
          reg119 <= (reg119[(3'h7):(3'h4)] ? (-wire111) : wire108);
          reg120 <= reg119;
          reg121 <= {(({(~&(8'ha1))} == $unsigned((reg118 ?
                  wire110 : wire113))) + (((reg116 ? wire109 : wire113) ?
                  $unsigned((8'h9d)) : $unsigned(reg121)) - $unsigned((|(8'hbb))))),
              $signed({$unsigned((7'h44))})};
          reg122 <= reg123[(3'h6):(3'h6)];
        end
    end
  assign wire124 = (wire110 | ($unsigned($signed($signed(reg123))) >= $unsigned((&(wire114 ?
                       wire108 : reg123)))));
  assign wire125 = $signed(wire114[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg126 <= {$unsigned((wire112 << {reg115})), $signed(reg120)};
      if (reg117)
        begin
          if (((~|reg126[(2'h2):(1'h1)]) ?
              {reg115[(1'h1):(1'h0)], reg117[(3'h6):(3'h4)]} : (&{(wire111 ?
                      (~|wire112) : wire124),
                  (7'h43)})))
            begin
              reg127 <= (^wire110);
              reg128 <= ($signed((reg118[(5'h11):(4'hb)] ?
                  wire110 : reg118)) ^~ $unsigned($signed($signed(reg123[(1'h0):(1'h0)]))));
              reg129 <= (8'hae);
              reg130 <= {$unsigned((~&wire112))};
              reg131 <= $unsigned($signed($signed($unsigned(reg119[(4'h9):(3'h4)]))));
            end
          else
            begin
              reg127 <= reg117[(3'h7):(1'h0)];
            end
          if (((wire110[(2'h2):(1'h1)] ?
                  ((^~(~^reg121)) || $signed(wire110)) : (reg128[(2'h3):(2'h3)] >> $signed((^wire112)))) ?
              (((|$signed(reg117)) ?
                  wire108 : ((|wire110) ?
                      $unsigned(reg121) : (!reg121))) < (~^$signed($unsigned(wire113)))) : $signed($unsigned(wire108))))
            begin
              reg132 <= reg121[(3'h5):(1'h1)];
              reg133 <= reg115;
              reg134 <= reg115[(1'h1):(1'h1)];
            end
          else
            begin
              reg132 <= ((^~($unsigned($unsigned((8'hbb))) ?
                  (~|reg115) : reg130)) <= reg127);
              reg133 <= reg130[(2'h3):(1'h1)];
            end
        end
      else
        begin
          reg127 <= reg121[(1'h1):(1'h0)];
          reg128 <= (($unsigned($unsigned((reg129 ?
                  (7'h44) : reg127))) <= $unsigned($signed({reg116}))) ?
              ((($signed(reg116) ?
                      (reg116 < wire108) : ((8'ha3) <<< (8'ha0))) > $signed((&reg128))) ?
                  $unsigned(reg132) : {$unsigned((reg120 ? wire114 : (8'hbd))),
                      ((reg126 ^~ reg123) ?
                          reg131 : (wire113 ?
                              reg126 : wire111))}) : $unsigned(reg128[(2'h2):(2'h2)]));
          reg129 <= $signed(reg133);
          if (reg123)
            begin
              reg130 <= reg134;
              reg131 <= $unsigned(wire112[(4'h9):(4'h9)]);
              reg132 <= {reg122[(3'h6):(3'h5)],
                  $unsigned((-reg118[(4'he):(4'ha)]))};
              reg133 <= ($signed($signed((~&(&reg128)))) ^~ (reg118[(5'h13):(4'hf)] >> reg121));
              reg134 <= (reg128[(2'h2):(1'h1)] ?
                  $signed({reg133,
                      reg132[(4'hc):(3'h5)]}) : reg117[(2'h2):(2'h2)]);
            end
          else
            begin
              reg130 <= wire110;
              reg131 <= wire110;
              reg132 <= $unsigned(((8'hb7) == reg116));
              reg133 <= ($signed(((|$signed(wire112)) ?
                  wire111 : ((wire110 ? reg127 : (8'hbc)) <= (reg128 ?
                      (8'h9d) : reg131)))) || (+(^(8'hba))));
            end
        end
      reg135 <= (reg120[(4'h9):(3'h6)] >= ((reg133 <<< reg130) ?
          {reg134[(1'h1):(1'h1)], wire113} : reg119[(4'h9):(4'h9)]));
      if ($signed((+{((reg132 < reg128) ? reg120 : (&wire109)),
          $signed($unsigned(wire108))})))
        begin
          reg136 <= wire114[(2'h2):(1'h1)];
          if (reg117[(3'h5):(2'h3)])
            begin
              reg137 <= $unsigned((reg131[(3'h7):(2'h2)] ^~ wire111[(2'h2):(2'h2)]));
              reg138 <= reg135;
              reg139 <= ($signed($unsigned(($signed(reg121) ?
                  reg134[(3'h7):(1'h1)] : (reg117 ?
                      reg128 : wire111)))) & {reg129[(2'h2):(2'h2)], reg115});
              reg140 <= (({(reg132 < (-reg132))} <<< wire108[(1'h1):(1'h1)]) && ({($unsigned(reg131) || ((8'hae) ?
                      reg133 : wire110))} >>> $signed(reg133)));
              reg141 <= ($signed({$signed((~^reg118))}) ?
                  ((~{$signed(reg136), (wire109 == reg136)}) ?
                      $signed(((reg138 ? reg136 : wire124) ?
                          wire109 : (reg136 ?
                              wire124 : reg132))) : reg119[(2'h2):(2'h2)]) : (reg136[(1'h0):(1'h0)] ?
                      reg130 : (wire114 | (^~$signed(reg132)))));
            end
          else
            begin
              reg137 <= reg117;
              reg138 <= reg118;
              reg139 <= $signed($unsigned(reg135));
              reg140 <= reg120[(4'ha):(4'h8)];
              reg141 <= (8'hb3);
            end
          reg142 <= (reg118 ?
              {$signed(((reg131 >> reg133) >= reg140))} : $unsigned($signed(reg127)));
          reg143 <= (&($signed((8'hae)) < {$signed($signed(reg122))}));
          reg144 <= {($signed($unsigned($signed(reg140))) <<< (reg129[(2'h2):(2'h2)] ?
                  (reg132 || (8'hbc)) : (^$signed(reg133)))),
              wire113[(1'h0):(1'h0)]};
        end
      else
        begin
          reg136 <= (reg142[(2'h2):(2'h2)] ?
              (reg117 ?
                  (wire112[(3'h6):(1'h1)] < $signed($signed(reg123))) : (wire111 >= ((reg116 == (8'ha7)) + $signed(reg144)))) : wire114[(1'h1):(1'h1)]);
          reg137 <= $unsigned(((~&reg126[(4'hc):(2'h2)]) || $signed((^$unsigned(reg143)))));
          reg138 <= $signed((reg116 ^~ (~^reg127[(3'h6):(2'h2)])));
        end
    end
  assign wire145 = reg118;
  module146 #() modinst162 (.wire151(reg131), .wire149(reg127), .wire147(reg137), .wire150(reg135), .wire148(reg122), .y(wire161), .clk(clk));
  assign wire163 = ($unsigned(($unsigned((~&reg115)) && wire113)) ?
                       $signed({wire109}) : (~($signed((|reg115)) ?
                           {$unsigned(reg117)} : $signed(reg139[(1'h0):(1'h0)]))));
  assign wire164 = $signed(wire108[(2'h3):(1'h0)]);
  module165 #() modinst194 (wire193, clk, reg121, reg129, reg137, reg126);
  assign wire195 = $signed(((~reg131[(4'h9):(3'h6)]) ?
                       $signed(((~|wire193) ^~ reg115)) : (($unsigned(reg133) ?
                               $unsigned(reg143) : (reg131 * reg120)) ?
                           $unsigned((wire125 >= (8'h9f))) : (~&{wire110,
                               reg137}))));
  module196 #() modinst224 (.wire198(wire108), .clk(clk), .y(wire223), .wire197(wire164), .wire200(reg123), .wire199(reg137));
  assign wire225 = (reg128[(3'h4):(2'h3)] ? reg120 : (-reg116[(3'h7):(1'h0)]));
  always
    @(posedge clk) begin
      reg226 <= $signed($unsigned(((wire164 ?
              $unsigned(wire113) : $signed(wire108)) ?
          ($unsigned(wire108) ?
              {(8'hb0), reg140} : $signed(reg119)) : wire113)));
      if (wire195)
        begin
          reg227 <= (~{reg115,
              ((~&(+reg135)) ?
                  reg143 : ($unsigned((8'hab)) ?
                      reg118 : wire125[(4'h9):(3'h4)]))});
          reg228 <= ((+($unsigned(reg138[(3'h5):(1'h1)]) ?
              (-$signed(reg144)) : {(reg143 ?
                      reg227 : (8'ha9))})) ~^ $signed($unsigned($signed((~reg130)))));
          reg229 <= reg120;
        end
      else
        begin
          if ((+$signed(wire124[(4'hf):(4'hf)])))
            begin
              reg227 <= {((~$signed(reg133)) ? (8'hb5) : wire114),
                  (reg134[(3'h7):(3'h6)] ~^ (($signed(reg136) > $signed(reg226)) ?
                      $unsigned((!wire225)) : $unsigned($unsigned(reg128))))};
            end
          else
            begin
              reg227 <= reg128;
              reg228 <= reg122;
              reg229 <= $signed((({$signed((8'had)),
                          ((8'hb5) ? reg136 : reg136)} ?
                      reg142 : reg140[(2'h2):(1'h0)]) ?
                  $signed(wire223) : (^reg227[(3'h5):(1'h1)])));
              reg230 <= (!$signed(reg123));
              reg231 <= $signed(reg121);
            end
          reg232 <= {{$unsigned(wire111),
                  (($unsigned((7'h42)) ?
                      (~^(8'hb1)) : (reg227 ? reg132 : reg138)) <= (^~(reg227 ?
                      reg122 : reg127)))}};
          reg233 <= (&reg229);
          if ($signed(reg135[(1'h0):(1'h0)]))
            begin
              reg234 <= reg132[(4'hf):(2'h3)];
              reg235 <= (+reg116[(4'ha):(3'h6)]);
            end
          else
            begin
              reg234 <= $signed($unsigned($unsigned((8'hbd))));
              reg235 <= (8'hb2);
            end
          reg236 <= $signed(((reg139[(2'h3):(1'h1)] >> reg127) ?
              $unsigned({((7'h43) | reg140)}) : reg118[(4'hb):(1'h0)]));
        end
    end
  assign wire237 = ($unsigned(($signed(((8'ha2) - reg233)) ^~ (~&$unsigned(reg138)))) ^~ (!$unsigned($unsigned(reg137))));
  always
    @(posedge clk) begin
      if ({(^~((reg121[(4'hb):(2'h2)] ?
              (wire109 | reg230) : $signed(wire223)) > reg234))})
        begin
          reg238 <= {($signed((reg133 ?
                  $unsigned(reg130) : reg138[(3'h4):(1'h0)])) ~^ ($unsigned((~&(8'hab))) ^ (~^wire114))),
              reg122};
        end
      else
        begin
          reg238 <= $unsigned(wire112[(1'h1):(1'h1)]);
          reg239 <= ($unsigned((wire124 ?
                  ((reg116 - wire223) <= $signed(reg126)) : reg132[(4'hd):(2'h3)])) ?
              $unsigned($signed({(~^wire109)})) : reg233);
          reg240 <= $signed(wire193);
        end
    end
  module241 #() modinst262 (.wire245(reg128), .wire246(reg131), .y(wire261), .wire242(reg140), .clk(clk), .wire243(wire112), .wire244(reg234));
  assign wire263 = $signed(($signed((^~reg139)) ?
                       ((reg143 ? {reg127} : $unsigned(reg128)) ?
                           {$unsigned(reg116)} : $unsigned(reg232)) : (wire114[(1'h1):(1'h1)] ?
                           ($unsigned(reg138) ?
                               reg134 : (!reg119)) : {(|reg227)})));
endmodule

module module4
#(parameter param99 = {(-(8'haf))})
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire5;
  input wire [(5'h13):(1'h0)] wire6;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire97;
  assign y = {wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire97,
                 (1'h0)};
  assign wire9 = $signed($signed((8'hba)));
  assign wire10 = (~|$signed({$signed(wire9)}));
  assign wire11 = (^~wire7);
  assign wire12 = {($signed(((&wire10) ? $signed(wire10) : (~^wire9))) ?
                          $signed((~^wire6[(2'h2):(1'h1)])) : {wire11[(2'h2):(1'h0)]})};
  assign wire13 = wire8[(4'h9):(2'h3)];
  assign wire14 = ($unsigned((8'hb2)) != ($signed(($signed(wire13) + (wire10 ?
                          wire11 : wire11))) ?
                      ({$signed(wire5), (wire9 > wire5)} ?
                          (+(8'h9e)) : (+(~wire5))) : (!$signed({wire12,
                          wire9}))));
  assign wire15 = $signed(($unsigned((~&$signed((8'hbd)))) ?
                      (wire13[(2'h2):(2'h2)] << (^~(wire6 <= wire13))) : $signed(wire13)));
  assign wire16 = (~|$unsigned($unsigned(wire12[(3'h6):(3'h5)])));
  assign wire17 = {$unsigned((^{wire15[(2'h3):(1'h0)], $unsigned(wire11)}))};
  assign wire18 = (+(((|(wire9 ? wire11 : wire10)) ? wire10 : (8'haa)) ?
                      wire15[(2'h2):(1'h1)] : ((wire5 * $unsigned((8'haa))) ?
                          $signed((wire13 ?
                              wire13 : wire14)) : $unsigned((wire8 ?
                              wire5 : wire7)))));
  module19 #() modinst98 (wire97, clk, wire8, wire17, wire15, wire18, wire11);
endmodule

module module19
#(parameter param95 = (^(-(~|((^~(8'ha6)) ~^ ((8'hb5) ? (8'hba) : (8'hbe)))))), 
parameter param96 = (({({(8'hbf)} ? (param95 * param95) : param95), {param95, {param95}}} ? ((param95 ? (param95 & (8'hb5)) : (param95 ? param95 : param95)) ? (8'hac) : (~&param95)) : {(!(param95 >= (8'ha9)))}) ? {(param95 <= (^(^param95))), (&(+(8'hab)))} : (8'had)))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h33d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire [(4'h8):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire21;
  input wire [(3'h6):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire48,
                 wire35,
                 wire34,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire25 = (|wire24[(1'h0):(1'h0)]);
  assign wire26 = (wire20[(3'h6):(3'h6)] ?
                      $signed((+$unsigned((wire21 | (7'h42))))) : (wire25 ?
                          wire20[(3'h4):(2'h3)] : $unsigned((~^(~&wire21)))));
  assign wire27 = $signed(($signed(wire21[(1'h0):(1'h0)]) >>> ($unsigned(wire22[(1'h0):(1'h0)]) ?
                      $unsigned($unsigned((8'hbd))) : (+(wire23 - wire24)))));
  assign wire28 = $unsigned({$unsigned((~((8'h9d) <= wire22)))});
  always
    @(posedge clk) begin
      reg29 <= (-{wire25[(5'h11):(5'h11)]});
      reg30 <= wire25[(4'hd):(1'h1)];
      reg31 <= $unsigned(({$unsigned(wire22)} ?
          ($unsigned($unsigned((8'hb3))) >>> (^(wire27 ?
              wire28 : wire21))) : (({wire21, wire27} ?
              (wire28 != wire24) : wire25) >>> (reg29[(3'h6):(2'h2)] ?
              wire21[(1'h1):(1'h0)] : $signed(wire21)))));
    end
  always
    @(posedge clk) begin
      reg32 <= $unsigned(wire21);
    end
  always
    @(posedge clk) begin
      reg33 <= $signed({({$unsigned(wire20),
              wire24[(1'h1):(1'h0)]} == (^~reg29[(2'h3):(1'h1)]))});
    end
  assign wire34 = wire23[(4'ha):(1'h0)];
  assign wire35 = (&$signed({$unsigned((~&wire26))}));
  always
    @(posedge clk) begin
      reg36 <= (~&((~(wire25[(2'h3):(1'h1)] ?
              (reg33 ? wire35 : wire34) : (wire24 < reg32))) ?
          wire35[(3'h5):(1'h1)] : wire23[(4'hb):(4'hb)]));
      if ((8'hb2))
        begin
          reg37 <= (+wire20[(3'h5):(2'h3)]);
          if (wire27[(1'h1):(1'h1)])
            begin
              reg38 <= {$unsigned(((8'h9e) ?
                      (~^(wire24 ?
                          reg37 : wire34)) : $unsigned($unsigned(wire34))))};
            end
          else
            begin
              reg38 <= $unsigned($unsigned(reg38[(3'h6):(3'h4)]));
              reg39 <= (8'hbf);
              reg40 <= ((~|(((reg36 ? reg36 : reg31) || (|reg36)) ?
                      (~^$unsigned(wire34)) : reg33[(4'hb):(1'h1)])) ?
                  wire22[(4'h8):(2'h2)] : {wire34, reg32[(2'h2):(2'h2)]});
              reg41 <= $unsigned((wire26[(5'h10):(2'h2)] ?
                  ($signed($unsigned((8'ha2))) ?
                      {(wire26 >>> wire25)} : wire20[(3'h4):(1'h0)]) : ((reg30 ?
                          wire22[(4'h8):(2'h3)] : (!wire28)) ?
                      (-(reg31 ? reg37 : reg36)) : wire34[(3'h5):(2'h2)])));
            end
          reg42 <= wire34;
          reg43 <= wire35;
        end
      else
        begin
          reg37 <= $signed(reg42[(1'h0):(1'h0)]);
          reg38 <= $signed((~^(^~(!reg37))));
          reg39 <= (wire24[(1'h0):(1'h0)] ?
              wire25[(4'h9):(3'h7)] : (^~$signed(((^reg33) << {reg30,
                  wire25}))));
          if ($signed(($signed($unsigned($unsigned(wire21))) & (~$unsigned((reg40 >>> wire20))))))
            begin
              reg40 <= $unsigned(($unsigned((|(~^wire22))) != wire27[(4'hc):(2'h2)]));
              reg41 <= $unsigned(((reg43[(2'h2):(1'h0)] <= ($signed((8'hb4)) + reg43)) <<< ((^~wire34) ?
                  (((8'ha7) ? wire35 : reg32) ?
                      (reg39 ?
                          wire22 : wire21) : wire35) : wire20[(1'h1):(1'h1)])));
              reg42 <= $signed(($unsigned((reg33 ?
                      $unsigned(reg33) : $signed((8'hb5)))) ?
                  reg36[(1'h1):(1'h1)] : (($unsigned(wire28) != (wire24 | reg40)) ?
                      $signed(reg42[(2'h3):(2'h2)]) : reg32[(3'h7):(1'h1)])));
            end
          else
            begin
              reg40 <= {$unsigned({reg39[(5'h11):(4'hc)]}),
                  ((wire24[(1'h0):(1'h0)] - wire21) ?
                      (&reg30[(3'h6):(3'h5)]) : wire20[(1'h1):(1'h0)])};
              reg41 <= ($signed(wire35) ?
                  $signed({wire22[(3'h5):(2'h2)]}) : ({$signed({wire25})} < (~$signed($unsigned(wire22)))));
              reg42 <= wire25;
              reg43 <= $signed((~($unsigned(reg43[(3'h6):(3'h5)]) >> reg29[(4'he):(3'h6)])));
              reg44 <= (~(($signed((reg30 | reg42)) ?
                  $signed($unsigned(wire22)) : (~reg30[(3'h7):(2'h3)])) - wire24[(2'h2):(1'h1)]));
            end
        end
      reg45 <= ({$signed(wire22[(3'h6):(2'h3)]),
          (&wire20[(2'h3):(2'h2)])} >> (~&((|wire35) ~^ {$signed(wire22),
          $signed(wire28)})));
      reg46 <= (((reg43[(3'h7):(3'h6)] < {wire28[(3'h4):(2'h3)],
              (reg42 * wire24)}) ^~ $signed((reg29 << reg38))) ?
          (~&$unsigned((reg39 ?
              $signed(reg43) : reg41))) : $signed(((reg31 == $signed(reg38)) ?
              reg41[(4'h9):(3'h4)] : reg41[(4'hb):(4'hb)])));
    end
  always
    @(posedge clk) begin
      reg47 <= $unsigned((wire27 << wire27));
    end
  assign wire48 = ({(reg47[(4'hb):(1'h0)] <<< wire28[(2'h3):(1'h0)])} <<< ($unsigned($unsigned($signed(reg36))) - (reg43 ?
                      ($unsigned(reg45) ?
                          $signed((8'hbb)) : wire25[(3'h7):(3'h5)]) : (8'ha0))));
  always
    @(posedge clk) begin
      reg49 <= (((($signed(wire26) >> (reg33 || (7'h40))) ?
          ({reg37} >= $unsigned(reg41)) : (reg47 <<< (!reg30))) != reg40) ^ ({$signed((|reg29)),
              ((-(8'h9c)) && (reg42 > reg44))} ?
          $unsigned({(reg37 >>> wire24)}) : reg32));
      if ({wire25,
          (((reg43 | (wire34 >>> reg37)) || reg33) >>> (~$signed({wire26})))})
        begin
          reg50 <= (+$unsigned((($unsigned(wire20) ?
              (reg37 ?
                  reg47 : reg42) : (wire28 ~^ reg42)) >= reg30[(3'h6):(2'h2)])));
          reg51 <= {reg37[(4'hf):(4'he)], (8'hbf)};
          reg52 <= (+$signed(wire20));
        end
      else
        begin
          reg50 <= reg31[(4'h9):(2'h2)];
          reg51 <= (wire26[(3'h4):(1'h0)] ? $signed($unsigned(reg47)) : reg31);
          reg52 <= ((|reg40) <= (reg33[(4'hb):(3'h5)] + (~|$signed((+wire26)))));
          if ((($signed({$signed(reg46)}) ?
              $unsigned($signed($unsigned(reg43))) : {({reg51} ?
                      {reg36} : (wire27 <= reg39)),
                  (reg32[(3'h5):(1'h1)] >> wire22[(2'h2):(2'h2)])}) >> reg49))
            begin
              reg53 <= reg43;
            end
          else
            begin
              reg53 <= $unsigned($unsigned($signed($signed((~&reg32)))));
              reg54 <= ($unsigned((8'hbd)) != ($unsigned($unsigned(reg41[(5'h15):(5'h14)])) ?
                  $unsigned(reg42[(2'h2):(2'h2)]) : reg46[(3'h6):(3'h5)]));
              reg55 <= reg49[(1'h0):(1'h0)];
            end
          reg56 <= wire21;
        end
      reg57 <= $signed(reg54[(3'h5):(2'h3)]);
    end
  always
    @(posedge clk) begin
      if ((~wire22[(2'h2):(2'h2)]))
        begin
          reg58 <= $unsigned((^~((+(^~wire34)) ?
              {(reg43 == wire23)} : (7'h41))));
        end
      else
        begin
          reg58 <= $signed(reg43);
          reg59 <= (~^$unsigned(((reg46 << reg32[(1'h1):(1'h0)]) <<< wire27[(2'h3):(2'h2)])));
          if ({$signed({$unsigned((reg33 >> wire34)), (+$unsigned(reg39))})})
            begin
              reg60 <= $unsigned(wire27[(1'h0):(1'h0)]);
              reg61 <= (+(8'hbc));
              reg62 <= reg50;
            end
          else
            begin
              reg60 <= {((reg52[(3'h4):(3'h4)] & (^~$signed(reg44))) > reg61),
                  reg61};
              reg61 <= $signed((!reg45[(3'h4):(1'h1)]));
              reg62 <= $signed(reg36);
              reg63 <= wire26;
            end
          if ((~&reg54))
            begin
              reg64 <= wire35[(1'h1):(1'h0)];
              reg65 <= ($signed((reg31[(4'h9):(4'h9)] || reg61[(3'h4):(1'h1)])) ~^ $unsigned($signed({(^~reg31)})));
              reg66 <= $unsigned(reg60[(2'h2):(2'h2)]);
            end
          else
            begin
              reg64 <= $unsigned($signed(reg49));
              reg65 <= (~&wire22[(3'h7):(1'h0)]);
              reg66 <= (($unsigned($unsigned(wire24)) + $unsigned($signed({reg32,
                  reg37}))) >>> wire34[(2'h2):(1'h0)]);
              reg67 <= ((8'hb8) << reg30);
            end
          reg68 <= (+(wire25 + ((reg63 >>> (reg43 ?
              reg55 : reg63)) < (((8'ha1) || reg33) || (wire24 ?
              wire28 : reg56)))));
        end
      if ((~^($signed((((7'h44) ? (8'hb9) : (7'h41)) ?
          ((8'ha5) ?
              reg60 : reg61) : $unsigned(reg56))) <<< $signed($signed((reg36 <= reg51))))))
        begin
          reg69 <= $signed((reg65 ?
              $signed($unsigned({(8'hbd),
                  wire23})) : $unsigned((~&reg40[(2'h3):(2'h3)]))));
          reg70 <= (!($signed($signed($signed(reg45))) ?
              {wire48, reg39[(4'h9):(1'h0)]} : ({((8'hac) ? reg52 : wire26)} ?
                  (8'ha9) : $signed(reg56))));
          reg71 <= ($unsigned(reg68) ?
              $signed($unsigned(($unsigned(reg50) ?
                  $unsigned(reg67) : {reg60, reg45}))) : {(~^{$unsigned(wire26),
                      $signed(wire34)})});
          reg72 <= (~|(&(~&$unsigned(wire21))));
        end
      else
        begin
          reg69 <= $unsigned({reg45});
          reg70 <= reg57;
          reg71 <= $signed(($unsigned($unsigned(reg46)) > reg39[(5'h11):(2'h3)]));
          if (((-$signed($unsigned((reg60 || reg63)))) ~^ $signed((($signed(reg45) ?
                  $unsigned(reg59) : (reg43 && reg42)) ?
              $signed({reg51}) : ((reg64 || (8'ha7)) <= $signed((8'hab)))))))
            begin
              reg72 <= {((8'ha8) ? wire26 : reg50[(1'h0):(1'h0)]),
                  reg47[(4'hc):(2'h2)]};
            end
          else
            begin
              reg72 <= $signed(reg45[(3'h7):(3'h7)]);
              reg73 <= (^~reg68);
              reg74 <= {((({(8'hb0), reg45} == $unsigned(reg65)) ?
                          (-(^~(8'hba))) : (~&$unsigned(reg60))) ?
                      ((~^reg64) ?
                          (|(~|reg54)) : ($unsigned(wire20) << (!reg39))) : reg40[(1'h1):(1'h0)]),
                  $signed((((reg71 != (7'h41)) & reg73[(2'h2):(1'h0)]) & ({wire34} < {(8'ha7),
                      (8'hbb)})))};
            end
        end
      reg75 <= $unsigned((~wire21));
      if ((($unsigned(wire25) ? (8'hb2) : wire35[(4'hb):(1'h0)]) ?
          reg67 : (8'ha0)))
        begin
          reg76 <= (reg39[(5'h11):(5'h10)] ?
              ((((|(8'ha1)) | (reg29 >>> (8'hbd))) > wire48[(4'h8):(1'h0)]) ?
                  reg60 : $unsigned(reg61[(3'h5):(2'h3)])) : $unsigned($unsigned(($signed((8'hac)) < reg49))));
          reg77 <= reg52[(2'h2):(1'h1)];
          if ({$signed({((reg30 <= reg61) ? (^~(8'h9e)) : (-(8'hbf)))})})
            begin
              reg78 <= reg55;
              reg79 <= $unsigned(wire26[(5'h10):(3'h6)]);
              reg80 <= reg70;
            end
          else
            begin
              reg78 <= (-$signed(($unsigned($unsigned(reg47)) ?
                  ((8'hbf) * {wire20}) : (reg70[(1'h1):(1'h1)] ?
                      wire25[(3'h4):(1'h0)] : {(8'hb4)}))));
              reg79 <= {$unsigned($signed(reg66))};
            end
          if ((-{reg62[(3'h5):(1'h0)],
              $signed(((~|reg36) ? (-reg54) : $signed(reg66)))}))
            begin
              reg81 <= $signed($unsigned(({(^reg36)} ?
                  reg55[(4'h8):(3'h7)] : ((reg33 ?
                      (8'h9c) : (8'hb2)) | reg70[(3'h6):(2'h2)]))));
              reg82 <= $unsigned($unsigned(reg53));
              reg83 <= ($signed(reg68) ?
                  wire22[(3'h6):(3'h6)] : (((-(~|reg51)) && (wire48 ?
                          $signed(reg61) : $signed(reg68))) ?
                      reg47[(3'h6):(3'h4)] : $signed(($signed(reg52) >= reg42[(3'h6):(2'h3)]))));
              reg84 <= (~&$signed(reg67[(3'h5):(1'h1)]));
            end
          else
            begin
              reg81 <= $unsigned({{(&(^~(8'hbf)))},
                  {$signed((reg53 ? wire24 : reg64))}});
              reg82 <= reg53;
              reg83 <= ($signed((|((reg61 <<< reg66) ?
                  (~^reg81) : {reg40, reg62}))) + reg38);
            end
        end
      else
        begin
          reg76 <= {(reg83 == $unsigned({(reg42 | reg79), $unsigned(wire28)}))};
          if ($unsigned((&{(reg72[(2'h3):(1'h0)] | $unsigned(reg79))})))
            begin
              reg77 <= reg33;
              reg78 <= $unsigned(wire26[(4'h8):(4'h8)]);
              reg79 <= reg62;
              reg80 <= ((-((~^(reg73 * reg73)) ?
                  ($signed(reg50) ?
                      reg67[(1'h0):(1'h0)] : reg31) : $unsigned((|reg75)))) | {$signed((&reg46)),
                  (!reg30)});
              reg81 <= (&(8'h9c));
            end
          else
            begin
              reg77 <= reg51[(1'h1):(1'h0)];
              reg78 <= wire28[(2'h2):(1'h0)];
            end
          reg82 <= $unsigned(wire25);
        end
      reg85 <= $unsigned(reg33);
    end
  assign wire86 = $signed(((^~((wire23 ? reg60 : reg65) ? reg84 : (+reg74))) ?
                      reg77[(1'h0):(1'h0)] : $unsigned($signed($unsigned(wire27)))));
  assign wire87 = (8'hac);
  assign wire88 = ((^~(~&$signed($signed(reg36)))) ^~ wire25);
  assign wire89 = {reg65[(1'h0):(1'h0)],
                      ($unsigned((reg64 < $signed(reg39))) ?
                          {(8'h9d)} : (~({reg33, reg69} ?
                              (reg55 != reg66) : reg40[(1'h0):(1'h0)])))};
  assign wire90 = (8'h9c);
  assign wire91 = (reg40[(3'h4):(2'h3)] ?
                      (reg56 + ((-reg36) > ((-reg82) ?
                          (reg51 << wire35) : $unsigned((7'h43))))) : ($signed(wire24[(1'h0):(1'h0)]) ?
                          reg44[(3'h6):(2'h3)] : $signed(((reg30 ?
                                  reg32 : reg57) ?
                              $unsigned(wire35) : reg36[(1'h0):(1'h0)]))));
  assign wire92 = $unsigned(reg80);
  assign wire93 = wire87[(4'h9):(3'h6)];
  assign wire94 = $unsigned($signed((reg47 ?
                      reg58[(3'h6):(2'h3)] : $signed({reg58}))));
endmodule

module module241
#(parameter param260 = ((8'ha6) ? (((~^(~&(8'h9e))) >> (^~(~|(8'ha2)))) ? ((8'ha5) || (((8'ha7) ^~ (8'hbd)) >= (-(8'ha7)))) : (8'hb4)) : (^((((8'h9d) & (8'ha7)) ? ((8'ha3) >> (8'hb6)) : ((8'ha4) ? (8'h9f) : (8'hb6))) ? (~^(~&(8'hbf))) : (-{(8'h9d), (8'hb3)})))))
(y, clk, wire246, wire245, wire244, wire243, wire242);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire246;
  input wire [(4'he):(1'h0)] wire245;
  input wire signed [(3'h6):(1'h0)] wire244;
  input wire [(4'h8):(1'h0)] wire243;
  input wire [(4'he):(1'h0)] wire242;
  wire signed [(2'h2):(1'h0)] wire259;
  wire signed [(4'hd):(1'h0)] wire258;
  wire [(2'h3):(1'h0)] wire247;
  reg [(4'he):(1'h0)] reg257 = (1'h0);
  reg [(3'h7):(1'h0)] reg256 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg255 = (1'h0);
  reg [(4'h9):(1'h0)] reg254 = (1'h0);
  reg [(4'hd):(1'h0)] reg253 = (1'h0);
  reg [(5'h12):(1'h0)] reg252 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg251 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg250 = (1'h0);
  reg [(4'hb):(1'h0)] reg249 = (1'h0);
  reg [(4'h8):(1'h0)] reg248 = (1'h0);
  assign y = {wire259,
                 wire258,
                 wire247,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 (1'h0)};
  assign wire247 = ((({(^wire244)} && ($signed((8'hb2)) >> $signed((8'h9f)))) ?
                           (8'ha4) : (~^{(&wire244)})) ?
                       (~^{((wire245 ?
                               wire246 : wire243) <= wire243)}) : ($unsigned(($unsigned((7'h42)) < wire245)) ?
                           (wire244[(3'h6):(2'h2)] < wire242) : $signed($signed((wire245 ?
                               (8'hb0) : (8'hb0))))));
  always
    @(posedge clk) begin
      if ((wire243[(2'h3):(2'h2)] ? (|{wire244}) : $signed($unsigned(wire243))))
        begin
          reg248 <= ({$unsigned(wire242)} + ({(wire244 >= ((8'ha1) ?
                      wire243 : wire246))} ?
              $unsigned((8'haf)) : (-(~&(wire246 >= wire246)))));
          reg249 <= wire244[(1'h0):(1'h0)];
          if (((~^((~^(wire242 ? wire246 : wire247)) ?
                  ((wire243 ? wire242 : wire247) ?
                      wire242 : $signed(wire245)) : {{wire246}})) ?
              (&((^wire243) ?
                  (8'hb4) : $unsigned($unsigned((8'ha8))))) : ($unsigned(wire247) && {$unsigned({reg249,
                      wire243})})))
            begin
              reg250 <= $signed(wire246);
            end
          else
            begin
              reg250 <= reg249;
            end
          if (reg249)
            begin
              reg251 <= (~|wire243[(4'h8):(2'h2)]);
              reg252 <= wire247;
              reg253 <= {$signed((wire244[(2'h2):(2'h2)] ?
                      (^~wire244) : ($signed(wire244) ?
                          (wire247 & wire243) : $signed(wire243))))};
              reg254 <= wire243;
              reg255 <= $signed(wire246);
            end
          else
            begin
              reg251 <= wire242;
              reg252 <= (($signed(($unsigned(reg254) & (reg250 ?
                      wire242 : (8'h9f)))) ?
                  $unsigned(wire244) : ($unsigned((reg253 >= reg250)) <= ((-reg254) > (8'hb7)))) ~^ $unsigned((~&(~&(+reg251)))));
              reg253 <= ({$signed({(|wire246), $signed(wire244)})} ?
                  $signed((reg255 ?
                      ((!(7'h40)) & {wire245,
                          reg250}) : $unsigned(wire242[(4'h8):(2'h2)]))) : wire246);
              reg254 <= (!$unsigned($signed((8'hae))));
              reg255 <= reg252[(3'h6):(3'h4)];
            end
        end
      else
        begin
          reg248 <= {(wire242[(2'h2):(1'h1)] << ((wire247[(2'h3):(2'h2)] & $signed(reg248)) ?
                  ({wire242} ? (reg249 ^~ wire243) : wire242) : (|reg252))),
              {reg248[(4'h8):(1'h1)]}};
          if (reg255)
            begin
              reg249 <= $signed((~&((wire244[(1'h1):(1'h0)] ?
                      (wire247 & reg249) : {(8'hb0), wire244}) ?
                  $unsigned(((7'h41) ?
                      reg248 : wire245)) : ((8'hbd) | $signed(reg250)))));
              reg250 <= $signed(reg250);
            end
          else
            begin
              reg249 <= ((wire245 ?
                  $unsigned(wire243) : $signed(((~^(7'h41)) ?
                      (reg252 ^ wire246) : wire247))) < $unsigned($unsigned(reg255)));
              reg250 <= wire243[(1'h0):(1'h0)];
              reg251 <= ({(^(wire244 ? $unsigned(reg250) : {wire247})),
                      ($unsigned((8'haa)) ?
                          reg252[(4'ha):(1'h0)] : ((^(8'hb7)) ~^ (wire242 * wire244)))} ?
                  reg253 : reg251);
            end
          reg252 <= wire242[(2'h2):(2'h2)];
          reg253 <= reg252;
        end
      reg256 <= (wire243 ^ (&($unsigned({wire242}) ?
          {reg253, $unsigned(reg251)} : wire244)));
      reg257 <= (!{($signed((reg256 ? reg252 : reg250)) ?
              ((reg250 ? reg250 : wire247) ?
                  $unsigned(reg253) : (wire247 ? wire247 : reg253)) : (reg256 ?
                  $unsigned((8'had)) : (reg248 ? reg254 : reg253)))});
    end
  assign wire258 = (^~$unsigned(reg249[(2'h3):(1'h0)]));
  assign wire259 = reg256[(3'h4):(3'h4)];
endmodule

module module196
#(parameter param221 = {((+(((8'h9f) ? (8'ha8) : (8'ha0)) - ((8'ha6) ? (7'h42) : (8'ha4)))) <<< ((((8'ha8) ^~ (7'h40)) ? ((8'hbd) ? (8'hb6) : (8'hb8)) : ((8'hba) ? (7'h43) : (8'h9f))) ? (((7'h40) * (7'h44)) ^~ (-(8'hba))) : (8'hbe))), ((8'ha1) ? {(((8'ha0) ? (8'haa) : (8'hba)) < {(8'ha5)})} : (&(~((8'h9e) ? (8'h9f) : (8'hb3)))))}, 
parameter param222 = ((~^param221) ? (((+param221) ? ((8'hb0) ? (param221 ~^ param221) : (param221 + param221)) : ((~param221) ? param221 : (~|(8'ha0)))) ? (!param221) : ((|(~(8'hb7))) & (&{param221}))) : param221))
(y, clk, wire200, wire199, wire198, wire197);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire200;
  input wire signed [(5'h10):(1'h0)] wire199;
  input wire [(5'h10):(1'h0)] wire198;
  input wire [(5'h12):(1'h0)] wire197;
  wire signed [(4'hc):(1'h0)] wire220;
  wire [(2'h2):(1'h0)] wire219;
  wire signed [(5'h12):(1'h0)] wire218;
  wire [(2'h3):(1'h0)] wire217;
  wire signed [(4'hf):(1'h0)] wire216;
  wire [(2'h3):(1'h0)] wire205;
  wire [(5'h14):(1'h0)] wire204;
  reg signed [(4'h8):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg213 = (1'h0);
  reg [(4'hf):(1'h0)] reg212 = (1'h0);
  reg [(5'h12):(1'h0)] reg211 = (1'h0);
  reg [(5'h15):(1'h0)] reg210 = (1'h0);
  reg [(2'h2):(1'h0)] reg209 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg208 = (1'h0);
  reg [(5'h13):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg201 = (1'h0);
  assign y = {wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire205,
                 wire204,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg203,
                 reg202,
                 reg201,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg201 <= ((wire197[(1'h0):(1'h0)] ^~ ((~&(wire197 << wire197)) * wire200[(3'h7):(3'h4)])) ?
          ($unsigned({(wire197 && wire198), (^~wire200)}) ?
              $signed(wire199[(4'hc):(4'hc)]) : ((~|(wire200 ?
                  (8'hab) : wire199)) && $signed(wire198[(4'hd):(3'h5)]))) : (&wire197));
      reg202 <= (($unsigned((^{reg201, wire199})) * (({wire197, reg201} ?
              wire198 : reg201) ?
          $unsigned(wire200[(3'h6):(1'h1)]) : wire198)) << $signed((~(~|(wire198 ?
          wire200 : (8'ha3))))));
    end
  always
    @(posedge clk) begin
      reg203 <= {(wire197[(2'h3):(2'h2)] && wire197)};
    end
  assign wire204 = (~|$unsigned({(wire200[(4'hb):(4'hb)] ?
                           $unsigned(reg202) : $signed(wire197))}));
  assign wire205 = (+reg203[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire198)
        begin
          if ($unsigned($unsigned((+$signed((wire197 <= wire205))))))
            begin
              reg206 <= $unsigned(wire199[(4'hb):(3'h6)]);
              reg207 <= (wire205 * {($signed((reg201 ?
                      reg206 : reg203)) != (wire199 ?
                      (wire205 ? wire197 : wire204) : $unsigned(reg206))),
                  ($signed(reg203) ?
                      {(wire198 ? wire204 : wire200),
                          (reg203 ?
                              wire200 : wire204)} : wire199[(4'hc):(1'h0)])});
              reg208 <= $signed((^~reg203[(3'h5):(2'h2)]));
              reg209 <= wire204[(1'h0):(1'h0)];
            end
          else
            begin
              reg206 <= $signed($signed((&(!reg208))));
              reg207 <= {reg208};
              reg208 <= $unsigned($signed((~&((reg208 << reg206) ?
                  (^~(7'h40)) : wire205[(2'h3):(2'h3)]))));
            end
          reg210 <= wire199;
          reg211 <= ($signed(reg206) ?
              ($signed(reg208[(1'h0):(1'h0)]) ?
                  (reg210 ?
                      reg206 : $unsigned(reg208)) : {wire204[(3'h6):(3'h6)],
                      $unsigned((wire204 ?
                          reg206 : wire197))}) : (wire205[(1'h0):(1'h0)] + wire200));
        end
      else
        begin
          reg206 <= wire199;
        end
      reg212 <= wire199[(3'h7):(1'h0)];
      reg213 <= {(~&$unsigned((wire205 ?
              (reg201 || reg209) : (wire199 ? (8'hab) : reg206))))};
      reg214 <= ($unsigned((~&((wire199 ^~ reg207) ?
          reg208[(1'h1):(1'h0)] : (reg209 ?
              wire198 : reg211)))) || $unsigned(wire205[(1'h0):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg215 <= (((reg201 ? {{reg206}} : reg203[(1'h1):(1'h0)]) != {(8'h9c)}) ?
          $signed(($unsigned({wire197, reg211}) ?
              ($unsigned((8'hb0)) ?
                  wire197 : ((8'hae) >= reg211)) : (+(wire204 ?
                  (8'ha3) : reg208)))) : reg212[(2'h2):(2'h2)]);
    end
  assign wire216 = wire197;
  assign wire217 = (($signed({((7'h42) ? (8'hb6) : (8'hb2)),
                           wire216}) != reg202) ?
                       (^~(({wire200} - $signed(reg202)) - reg209)) : reg206);
  assign wire218 = $unsigned((reg213[(1'h1):(1'h1)] ?
                       (reg209[(1'h1):(1'h1)] ?
                           reg211 : {(wire200 >= reg209),
                               (~|reg201)}) : ((8'hb9) ?
                           ($unsigned(reg202) ?
                               (reg207 ?
                                   reg201 : reg201) : $signed(reg210)) : $signed((-wire205)))));
  assign wire219 = (&(|reg206[(4'hb):(2'h2)]));
  assign wire220 = $unsigned($unsigned(reg208[(2'h3):(2'h3)]));
endmodule

module module165
#(parameter param191 = {(~((-((8'hbd) ? (7'h42) : (8'hab))) ? (|((8'ha4) ? (8'hbb) : (8'hb8))) : (((8'ha6) ? (8'h9d) : (8'ha7)) ~^ ((8'haa) ? (8'ha4) : (8'hbd)))))}, 
parameter param192 = (~(((param191 <= (8'ha0)) < (^{param191, (8'hb7)})) ? ((+(^param191)) ? param191 : param191) : {{{param191, param191}, (param191 >= param191)}})))
(y, clk, wire169, wire168, wire167, wire166);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire169;
  input wire signed [(2'h2):(1'h0)] wire168;
  input wire [(4'h9):(1'h0)] wire167;
  input wire [(4'hd):(1'h0)] wire166;
  wire [(4'hd):(1'h0)] wire190;
  wire signed [(2'h3):(1'h0)] wire189;
  wire [(3'h4):(1'h0)] wire188;
  wire [(3'h5):(1'h0)] wire187;
  wire signed [(5'h11):(1'h0)] wire186;
  wire signed [(3'h7):(1'h0)] wire184;
  wire [(4'hc):(1'h0)] wire183;
  wire [(5'h11):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire176;
  wire [(4'hb):(1'h0)] wire175;
  wire [(3'h4):(1'h0)] wire174;
  wire [(5'h12):(1'h0)] wire173;
  wire [(3'h7):(1'h0)] wire172;
  wire [(5'h10):(1'h0)] wire170;
  reg [(5'h12):(1'h0)] reg185 = (1'h0);
  reg [(3'h5):(1'h0)] reg182 = (1'h0);
  reg [(5'h10):(1'h0)] reg181 = (1'h0);
  reg [(5'h14):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg178 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire184,
                 wire183,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire170,
                 reg185,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg171,
                 (1'h0)};
  assign wire170 = (wire166[(4'hd):(1'h0)] ?
                       ($signed(($unsigned(wire169) >= (-wire169))) ?
                           (~^wire168[(1'h1):(1'h0)]) : $unsigned($signed({(7'h44)}))) : (-wire168));
  always
    @(posedge clk) begin
      reg171 <= ($unsigned((^~$unsigned((^~wire169)))) <<< (&$signed(wire166[(1'h1):(1'h1)])));
    end
  assign wire172 = (^~$unsigned((8'ha9)));
  assign wire173 = $signed($unsigned(wire169[(3'h5):(2'h2)]));
  assign wire174 = $unsigned(({wire167,
                           (wire172 ? wire170[(3'h7):(3'h6)] : (!(8'hb1)))} ?
                       wire168[(1'h0):(1'h0)] : $signed((&$unsigned(wire173)))));
  assign wire175 = wire172[(3'h7):(2'h2)];
  assign wire176 = $signed(wire169);
  assign wire177 = (wire166 ?
                       {wire172,
                           (wire175 ?
                               (^((8'hb6) - (8'hbe))) : $signed((wire170 ?
                                   wire166 : (7'h41))))} : ((($unsigned(wire170) && (wire166 | (8'h9e))) >= (&wire175)) & (|(wire168[(1'h1):(1'h0)] ?
                           wire175 : (wire176 ? (8'h9f) : reg171)))));
  always
    @(posedge clk) begin
      reg178 <= wire168;
      if ($signed((wire166 ?
          wire166[(4'ha):(4'h9)] : $unsigned($unsigned((wire176 ^~ reg171))))))
        begin
          reg179 <= {wire167[(2'h2):(2'h2)],
              ($unsigned({$signed(wire168),
                  (wire177 <= reg178)}) | $signed(($unsigned(wire167) <= wire170[(3'h6):(1'h1)])))};
          reg180 <= wire169;
          reg181 <= (^((wire167 || wire168[(1'h0):(1'h0)]) < $unsigned(((reg179 ?
              wire174 : wire176) <<< {wire176}))));
        end
      else
        begin
          reg179 <= {$unsigned(wire168[(1'h0):(1'h0)]), reg180[(4'he):(2'h3)]};
        end
      reg182 <= (($unsigned((&$signed(wire169))) ?
          reg179[(3'h6):(2'h2)] : $unsigned(reg181[(3'h5):(3'h5)])) ~^ (((8'h9e) - $unsigned($signed(wire177))) ?
          (reg181 * wire173) : {($unsigned(wire170) ?
                  $signed(wire167) : $signed(reg179))}));
    end
  assign wire183 = wire168[(2'h2):(1'h1)];
  assign wire184 = ($unsigned(wire174) & (^~((^~(wire177 ?
                       wire174 : wire169)) || $signed(reg179[(3'h6):(1'h0)]))));
  always
    @(posedge clk) begin
      reg185 <= (-($signed(((wire169 <<< (8'ha5)) ?
          (reg181 ?
              reg179 : wire184) : (^~wire175))) && (wire168 <<< (~((8'h9c) << wire166)))));
    end
  assign wire186 = reg181;
  assign wire187 = wire167[(3'h7):(1'h0)];
  assign wire188 = wire186;
  assign wire189 = (+((^$signed(wire173[(4'hb):(1'h0)])) ?
                       ({$unsigned(wire168),
                           wire173} * wire173[(4'hb):(2'h2)]) : $signed($signed((~&wire168)))));
  assign wire190 = (&(wire175[(3'h4):(2'h3)] ?
                       wire176[(1'h0):(1'h0)] : $unsigned(wire174)));
endmodule

module module146
#(parameter param159 = ((((^~((8'hb6) ? (8'ha6) : (8'h9c))) << (+(^~(8'hae)))) <= {(~^((8'hb4) + (8'hb9))), ({(7'h40), (7'h41)} ? (-(8'ha7)) : (~^(7'h40)))}) ? (7'h41) : ((|((|(8'ha0)) >= (~^(8'ha8)))) ? ((~^((8'ha7) < (8'ha0))) ? (~&((8'ha5) != (8'ha3))) : (8'hbc)) : (~&{((8'haf) ? (8'h9f) : (8'h9e)), ((8'had) * (7'h42))}))), 
parameter param160 = ({(param159 | (~((8'ha7) * param159))), (((param159 ? (8'hb7) : param159) & (param159 ~^ param159)) ~^ param159)} ? param159 : ({param159} ^~ param159)))
(y, clk, wire151, wire150, wire149, wire148, wire147);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire151;
  input wire [(4'h9):(1'h0)] wire150;
  input wire signed [(4'hd):(1'h0)] wire149;
  input wire signed [(5'h11):(1'h0)] wire148;
  input wire [(5'h10):(1'h0)] wire147;
  wire signed [(2'h2):(1'h0)] wire158;
  wire [(4'ha):(1'h0)] wire157;
  wire [(3'h4):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire154;
  wire signed [(5'h11):(1'h0)] wire153;
  wire [(5'h11):(1'h0)] wire152;
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 (1'h0)};
  assign wire152 = wire147;
  assign wire153 = $signed((+(|{$unsigned((8'hba)), wire148[(3'h6):(3'h4)]})));
  assign wire154 = wire149;
  assign wire155 = $signed(wire152[(3'h4):(2'h3)]);
  assign wire156 = wire150;
  assign wire157 = ($signed($unsigned($unsigned((wire147 ?
                           wire156 : wire148)))) ?
                       (!(wire151 ~^ (~&(~|wire150)))) : ($signed(($unsigned((8'ha9)) <<< ((8'hac) | wire152))) < $signed(wire147[(3'h4):(1'h1)])));
  assign wire158 = {$signed(wire152[(5'h10):(3'h4)]),
                       {(8'ha7),
                           $signed(((wire153 ? (8'h9e) : wire154) ?
                               $unsigned(wire148) : (wire157 >>> wire156)))}};
endmodule
