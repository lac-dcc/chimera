module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h296):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire266;
  wire signed [(2'h3):(1'h0)] wire265;
  wire [(5'h12):(1'h0)] wire264;
  wire signed [(5'h13):(1'h0)] wire244;
  wire [(4'hb):(1'h0)] wire243;
  wire signed [(5'h14):(1'h0)] wire241;
  wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire177;
  wire [(4'hb):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire180;
  wire signed [(5'h11):(1'h0)] wire193;
  wire signed [(4'hb):(1'h0)] wire194;
  wire signed [(3'h4):(1'h0)] wire195;
  wire signed [(4'hd):(1'h0)] wire196;
  wire [(4'h8):(1'h0)] wire197;
  wire signed [(5'h13):(1'h0)] wire198;
  wire signed [(5'h14):(1'h0)] wire201;
  wire signed [(4'hb):(1'h0)] wire218;
  reg [(5'h11):(1'h0)] reg263 = (1'h0);
  reg [(4'h8):(1'h0)] reg262 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg261 = (1'h0);
  reg [(4'ha):(1'h0)] reg260 = (1'h0);
  reg [(4'ha):(1'h0)] reg259 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg258 = (1'h0);
  reg [(4'h9):(1'h0)] reg257 = (1'h0);
  reg [(2'h3):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg255 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg254 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg253 = (1'h0);
  reg [(4'hd):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg251 = (1'h0);
  reg [(4'ha):(1'h0)] reg250 = (1'h0);
  reg [(4'he):(1'h0)] reg249 = (1'h0);
  reg [(4'hc):(1'h0)] reg248 = (1'h0);
  reg [(4'h9):(1'h0)] reg247 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg246 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg199 = (1'h0);
  reg [(4'hd):(1'h0)] reg192 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg191 = (1'h0);
  reg [(5'h11):(1'h0)] reg190 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg189 = (1'h0);
  reg [(4'h9):(1'h0)] reg188 = (1'h0);
  reg [(5'h10):(1'h0)] reg187 = (1'h0);
  reg [(5'h15):(1'h0)] reg186 = (1'h0);
  reg [(4'ha):(1'h0)] reg185 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  assign y = {wire266,
                 wire265,
                 wire264,
                 wire244,
                 wire243,
                 wire241,
                 wire4,
                 wire5,
                 wire177,
                 wire179,
                 wire180,
                 wire193,
                 wire194,
                 wire195,
                 wire196,
                 wire197,
                 wire198,
                 wire201,
                 wire218,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
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
                 reg247,
                 reg246,
                 reg245,
                 reg200,
                 reg199,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 (1'h0)};
  assign wire4 = $signed(($signed($unsigned(wire0[(1'h0):(1'h0)])) ?
                     (wire3[(3'h4):(1'h1)] <<< (wire0[(1'h0):(1'h0)] >> (^~(8'hae)))) : ($unsigned((wire0 + wire1)) ?
                         ((wire3 + wire1) ?
                             wire3 : (~wire0)) : $signed($signed(wire1)))));
  assign wire5 = wire1;
  module6 #() modinst178 (wire177, clk, wire1, wire0, wire3, wire2);
  assign wire179 = (-(+$signed((((8'hab) >>> wire0) ^~ wire1[(4'h8):(1'h1)]))));
  assign wire180 = (~&(wire5 || (wire2 ~^ ($unsigned(wire5) ? wire3 : wire1))));
  always
    @(posedge clk) begin
      reg181 <= wire4;
      reg182 <= {wire2[(4'ha):(4'ha)]};
      if ($unsigned($unsigned({$unsigned((+reg182))})))
        begin
          reg183 <= ((&($signed((+wire0)) | wire4)) ?
              ($unsigned((~&$unsigned(wire4))) ?
                  (((reg182 ? wire5 : wire180) ? $signed(wire177) : wire3) ?
                      $unsigned((-wire177)) : $unsigned({wire0,
                          reg182})) : wire2[(1'h1):(1'h1)]) : ($signed($unsigned((wire4 ?
                  wire0 : wire177))) <= $unsigned(($signed(reg182) >>> $signed((8'ha1))))));
          if ({wire179,
              (wire1[(3'h5):(1'h1)] ?
                  ({$signed(wire0),
                      wire1[(3'h4):(1'h0)]} != reg182[(2'h2):(1'h0)]) : $signed($signed((wire5 ?
                      reg182 : wire2))))})
            begin
              reg184 <= reg182[(4'hc):(4'hb)];
              reg185 <= (wire0[(4'hd):(1'h0)] ?
                  ($signed($signed((reg184 ?
                      reg181 : wire179))) >>> $unsigned($signed(wire180))) : wire2[(5'h10):(4'hc)]);
            end
          else
            begin
              reg184 <= $signed(wire5);
              reg185 <= $unsigned(wire177[(4'h8):(1'h0)]);
              reg186 <= ((8'hb9) ?
                  {$unsigned(reg185)} : (wire5 ?
                      $signed((((8'hbd) ^ reg185) ?
                          $signed(reg185) : $signed(reg184))) : ((((8'hb9) ?
                                  (8'hbc) : wire180) ?
                              $unsigned(reg181) : (wire2 ? (8'hbb) : wire0)) ?
                          (reg182 && {(8'hb5)}) : $signed({reg181}))));
            end
          if (($signed($signed($unsigned(reg184[(4'h9):(4'h9)]))) ^ {(($signed(wire5) ?
                  $signed((8'h9c)) : reg185[(4'h8):(2'h2)]) >>> $signed((reg185 ?
                  reg186 : reg186))),
              ($unsigned($unsigned(wire3)) + $signed((wire1 & wire5)))}))
            begin
              reg187 <= $unsigned(reg183[(4'ha):(3'h4)]);
              reg188 <= ((&(|wire3)) ~^ $unsigned(($signed(wire4[(3'h6):(2'h2)]) ?
                  $signed($signed(reg186)) : ($unsigned(reg185) ?
                      reg182 : $unsigned(reg185)))));
              reg189 <= reg184[(3'h7):(2'h3)];
              reg190 <= (!((&($unsigned(reg184) ~^ wire4)) && (wire179 == reg185)));
            end
          else
            begin
              reg187 <= (!wire2[(1'h1):(1'h1)]);
              reg188 <= reg181[(4'h9):(3'h6)];
              reg189 <= $unsigned(((8'h9f) ?
                  ($unsigned($signed((8'h9c))) ?
                      (wire177 ~^ $signed(reg187)) : {wire3}) : $unsigned($unsigned((wire2 ?
                      reg184 : (8'hb1))))));
              reg190 <= (reg184[(1'h0):(1'h0)] ?
                  reg186[(5'h15):(4'ha)] : wire177[(3'h4):(3'h4)]);
              reg191 <= {(({(reg185 ? (7'h44) : wire179), {reg187, wire180}} ?
                      $signed((&reg183)) : $signed(reg189[(2'h3):(1'h0)])) < reg187[(3'h5):(2'h2)])};
            end
          reg192 <= $signed((wire180[(5'h14):(5'h11)] ?
              wire4 : (|$signed(reg187))));
        end
      else
        begin
          reg183 <= $unsigned(({(-wire3),
                  ((wire0 ? reg187 : reg186) ? (8'ha3) : reg190)} ?
              reg186[(4'hd):(3'h5)] : $signed(((+reg181) >>> reg184))));
          reg184 <= reg185[(3'h6):(1'h1)];
          if (((8'hba) - (reg187 ~^ ({reg186} ?
              ($unsigned(reg184) & reg183) : $unsigned((!wire177))))))
            begin
              reg185 <= (reg188 && ((8'ha0) - (wire2 ?
                  ($unsigned(reg183) << {(8'hb2), (8'hb5)}) : reg185)));
              reg186 <= wire5;
              reg187 <= ($signed(reg185) >> ((reg190[(2'h2):(1'h1)] > ($unsigned(reg192) ~^ (!reg182))) ?
                  {reg181,
                      wire177[(4'hd):(4'h8)]} : ($signed(wire3[(4'he):(4'hd)]) == ($signed(reg183) ?
                      wire2 : wire177))));
              reg188 <= ((^~$signed((|$unsigned(wire2)))) ?
                  reg187 : (wire5 ?
                      (-(-(~^reg181))) : ($signed(wire177[(3'h5):(3'h4)]) ?
                          $signed({wire179, wire2}) : (((8'h9f) ?
                              (8'ha9) : wire177) && (~|reg185)))));
              reg189 <= $unsigned(reg189);
            end
          else
            begin
              reg185 <= (^~((|(+reg192[(3'h6):(1'h0)])) | reg185));
              reg186 <= (((($unsigned(reg192) > reg190[(4'hc):(2'h3)]) ^ $signed(wire180[(4'hf):(1'h0)])) ?
                      reg188 : (((reg191 <= reg184) ?
                          (reg190 ~^ reg191) : (reg190 ?
                              wire3 : reg186)) >>> $unsigned($signed((8'ha6))))) ?
                  $signed((reg187 ?
                      reg181 : $signed(((8'ha6) ?
                          wire0 : reg190)))) : $signed(($signed({wire5}) ?
                      reg183 : ((wire0 ? reg184 : wire0) ?
                          (reg190 ?
                              reg188 : reg187) : reg184[(2'h2):(2'h2)]))));
              reg187 <= wire177[(3'h7):(3'h5)];
              reg188 <= $signed((&(~&{$signed(wire179)})));
            end
          reg190 <= ((reg183[(4'h8):(1'h0)] ?
                  $unsigned($unsigned($signed((8'ha6)))) : wire179) ?
              ((-wire0[(1'h0):(1'h0)]) ?
                  $unsigned($unsigned({wire177, wire4})) : (!reg188)) : wire5);
        end
    end
  assign wire193 = $signed((~^$signed(reg191[(3'h6):(3'h4)])));
  assign wire194 = $unsigned((^wire3[(1'h0):(1'h0)]));
  assign wire195 = (+reg190);
  assign wire196 = $signed($unsigned($unsigned((wire3 + {wire4, reg188}))));
  assign wire197 = (~|(wire1[(1'h1):(1'h1)] ?
                       $unsigned(wire194[(4'h8):(2'h2)]) : wire196));
  assign wire198 = $signed(((wire177[(2'h2):(1'h0)] == (~|reg182[(2'h3):(1'h0)])) & wire1[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg199 <= ((~($unsigned(wire194) ?
              (^~$signed(reg189)) : {reg183, wire196})) ?
          (&({$signed(reg184), $signed(wire194)} ?
              ((&reg183) ?
                  (-(8'hbd)) : wire4[(2'h3):(2'h3)]) : wire180)) : $signed((({(8'haa),
                  (8'haf)} ?
              (8'hb7) : reg188) <<< wire4)));
      reg200 <= $signed(wire177[(3'h4):(2'h2)]);
    end
  assign wire201 = ((wire179 ?
                           ($unsigned($unsigned(wire5)) ?
                               $signed(reg189) : {reg200}) : wire180) ?
                       wire2 : ((!{reg187}) ?
                           (^$signed((wire195 >= wire197))) : {$unsigned(reg192)}));
  module202 #() modinst219 (wire218, clk, wire177, reg192, reg188, reg183, reg189);
  module220 #() modinst242 (wire241, clk, wire201, wire1, wire198, wire194);
  assign wire243 = (wire194[(1'h1):(1'h1)] != reg190);
  assign wire244 = (|(({(wire5 ? wire241 : wire243)} ?
                           ((reg182 ? reg191 : reg187) ?
                               $unsigned(reg184) : (^wire241)) : (!$unsigned(wire0))) ?
                       $unsigned(reg186) : (+(reg192[(2'h3):(2'h2)] ^~ reg187))));
  always
    @(posedge clk) begin
      reg245 <= (&reg189[(1'h1):(1'h1)]);
      if ($unsigned(wire201))
        begin
          reg246 <= ($unsigned((~&$signed((~reg185)))) ?
              ((wire5[(2'h3):(1'h1)] ?
                      (^reg183[(3'h6):(2'h3)]) : ({reg185} || $unsigned(wire194))) ?
                  (&(reg184[(4'h9):(1'h1)] ?
                      wire4[(4'h8):(2'h3)] : {wire243})) : ($signed((wire244 ?
                          reg190 : wire193)) ?
                      reg190[(4'ha):(3'h6)] : $unsigned((reg192 ?
                          wire197 : wire2)))) : $unsigned($signed(reg188)));
          reg247 <= (|wire1);
          if ($unsigned((|((8'haa) ~^ wire241))))
            begin
              reg248 <= (wire2 * {(reg247[(3'h4):(1'h1)] ?
                      (|$signed(wire180)) : (^~$unsigned((8'hba))))});
            end
          else
            begin
              reg248 <= reg248[(4'hb):(1'h1)];
              reg249 <= $signed($signed($signed(((8'hac) ?
                  (wire179 ? reg191 : wire180) : (wire5 ? reg185 : wire0)))));
              reg250 <= reg188;
              reg251 <= wire193[(4'hf):(4'hd)];
              reg252 <= reg185;
            end
          if ($signed((((wire0[(3'h6):(3'h6)] ?
              {wire2,
                  wire218} : reg188[(4'h9):(4'h9)]) ~^ ($signed(wire4) * (8'hae))) << (+$unsigned($signed(reg185))))))
            begin
              reg253 <= {$unsigned(reg188[(2'h3):(1'h0)]),
                  $signed((wire177 >> wire1))};
              reg254 <= (~&((reg189[(3'h5):(2'h3)] ^ ((8'h9d) ?
                      $unsigned(reg188) : wire218)) ?
                  wire5[(3'h6):(1'h1)] : $signed(wire177[(3'h7):(3'h7)])));
            end
          else
            begin
              reg253 <= (!$signed($unsigned(($signed(reg184) ?
                  reg199[(3'h7):(2'h2)] : $unsigned((8'ha4))))));
              reg254 <= reg252;
            end
        end
      else
        begin
          reg246 <= $unsigned($signed((($signed(wire198) ?
              $unsigned((8'hb8)) : reg249) >> (wire5[(3'h5):(2'h2)] ?
              ((8'hbe) && reg249) : (|wire244)))));
          reg247 <= $unsigned(reg253[(3'h6):(3'h4)]);
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(($signed(wire195) ?
          reg190 : $unsigned(wire195))) - wire179[(4'h9):(2'h3)])))
        begin
          if (((&wire2[(5'h11):(3'h7)]) ?
              (wire0[(3'h7):(3'h4)] ?
                  ($signed((~|reg246)) >>> $signed(wire2)) : {reg185,
                      {$unsigned(reg191), {reg185}}}) : (8'h9f)))
            begin
              reg255 <= ($signed((8'hb2)) | $signed($signed({(reg245 + (8'hab)),
                  $signed((8'hae))})));
              reg256 <= reg186[(3'h6):(3'h5)];
            end
          else
            begin
              reg255 <= $signed((reg192 && (~&(~(reg188 + reg245)))));
              reg256 <= (^~reg253[(4'ha):(3'h6)]);
              reg257 <= ($signed((8'hb4)) ?
                  (reg183[(5'h10):(1'h1)] == (reg245 ?
                      (wire194[(3'h4):(1'h1)] ?
                          (8'haa) : $unsigned(wire198)) : $unsigned((reg250 >= reg254)))) : $signed({wire194[(4'h9):(4'h9)],
                      reg181}));
              reg258 <= $signed($signed($unsigned(($unsigned(reg191) < (reg256 && wire241)))));
            end
          if ({($signed(wire177[(4'h9):(4'h9)]) & (-reg181[(3'h5):(2'h3)])),
              reg191})
            begin
              reg259 <= {$signed((wire5 ?
                      reg248[(4'h9):(3'h6)] : (wire198[(3'h6):(1'h0)] ?
                          {wire179} : wire244[(4'he):(4'hb)])))};
            end
          else
            begin
              reg259 <= reg253[(4'h8):(3'h5)];
              reg260 <= $signed(wire197);
              reg261 <= (8'hbe);
              reg262 <= ($unsigned(wire2[(3'h6):(3'h5)]) ?
                  reg248[(1'h0):(1'h0)] : {{$unsigned(wire4[(2'h2):(1'h0)])}});
              reg263 <= ($unsigned($unsigned($signed($unsigned(reg185)))) <= {(((wire201 ?
                              reg246 : reg190) ?
                          reg257[(3'h7):(2'h2)] : (~&(8'hb0))) ?
                      (~&reg191) : $unsigned({reg250})),
                  $unsigned($unsigned((reg252 >> reg256)))});
            end
        end
      else
        begin
          reg255 <= reg254[(3'h6):(2'h3)];
          reg256 <= $signed(wire241[(3'h6):(1'h0)]);
        end
    end
  assign wire264 = $unsigned(({{reg262[(2'h2):(2'h2)]}} >= (((wire1 - reg188) ?
                           (&reg185) : reg252) ?
                       (wire180[(4'ha):(3'h7)] ?
                           {reg257} : $unsigned(reg262)) : (~^(wire4 == reg186)))));
  assign wire265 = (reg192 ?
                       (!(wire195[(2'h3):(2'h3)] >= $signed($unsigned(wire3)))) : ((~&wire0[(4'hb):(3'h5)]) ?
                           (~^wire177[(4'hb):(2'h3)]) : $signed($unsigned(wire0))));
  module6 #() modinst267 (.wire7(reg263), .wire8(reg187), .wire10(wire241), .wire9(wire196), .clk(clk), .y(wire266));
endmodule

module module220
#(parameter param240 = ((((((8'ha5) ? (8'h9f) : (8'ha9)) == (&(8'ha6))) <= (((8'ha3) ^~ (7'h40)) < ((8'ha4) ? (8'hbc) : (8'ha8)))) ? ((((8'hb1) ? (8'haf) : (8'ha9)) ? ((8'hbe) ? (8'h9f) : (8'ha0)) : ((8'hab) < (8'ha2))) >> {(&(8'ha8))}) : ({((8'hb3) ? (8'hb0) : (8'ha7)), ((8'hb9) | (8'ha1))} ? (((8'hb7) ? (8'h9c) : (8'ha5)) ? {(8'haa)} : (!(8'hb6))) : ((^(8'hb6)) ^~ ((8'hbb) ? (8'hb7) : (8'ha9))))) ^~ (|((~((8'hb4) ^ (8'ha6))) ? (~^((8'hbf) ? (7'h43) : (8'h9f))) : {((8'ha0) * (7'h43))}))))
(y, clk, wire224, wire223, wire222, wire221);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire224;
  input wire [(4'h9):(1'h0)] wire223;
  input wire [(5'h12):(1'h0)] wire222;
  input wire [(2'h3):(1'h0)] wire221;
  wire signed [(4'hb):(1'h0)] wire238;
  wire signed [(3'h4):(1'h0)] wire227;
  wire signed [(5'h14):(1'h0)] wire226;
  wire signed [(4'hf):(1'h0)] wire225;
  assign y = {wire238, wire227, wire226, wire225, (1'h0)};
  assign wire225 = (wire222 ?
                       $unsigned($signed({(~^wire222),
                           wire223})) : wire223[(3'h6):(3'h4)]);
  assign wire226 = $unsigned(wire224);
  assign wire227 = wire224;
  module228 #() modinst239 (.wire229(wire226), .y(wire238), .wire232(wire221), .wire231(wire224), .clk(clk), .wire230(wire225));
endmodule

module module202
#(parameter param216 = ((({((7'h43) ? (8'hb7) : (8'had))} < (((7'h40) & (8'hbb)) ^ {(8'hba)})) ? ((|((8'ha3) ? (8'hbc) : (8'hbf))) ? (((8'h9e) < (8'hac)) ? {(8'ha5)} : (^(8'ha9))) : ({(8'haf), (8'ha3)} ? {(8'hba), (8'hb6)} : ((8'hbf) ? (8'hbf) : (8'ha1)))) : (((+(8'ha7)) - ((8'hb0) != (8'ha8))) ? {(-(8'ha9))} : (((8'haa) ? (8'ha9) : (8'hbb)) + {(8'hb7)}))) ? ((8'ha3) ~^ (~^(|((8'hbc) == (7'h40))))) : ((^~{(~|(8'hb8))}) & (((^~(8'hbb)) ? ((7'h40) <= (8'h9f)) : (^(8'hb5))) ? (((7'h41) ? (8'h9e) : (8'h9e)) != {(8'ha2)}) : ({(8'hb7)} ? ((8'hb2) <<< (7'h41)) : ((8'hb1) * (8'hb7)))))), 
parameter param217 = (((8'hbc) ? {param216, ((param216 ? (8'hb9) : param216) ? (param216 << param216) : param216)} : (&param216)) ? (^~{param216}) : (|(({param216} ~^ param216) ? (8'ha0) : {((8'ha9) <<< (8'hbe))}))))
(y, clk, wire207, wire206, wire205, wire204, wire203);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire207;
  input wire [(4'hc):(1'h0)] wire206;
  input wire [(2'h2):(1'h0)] wire205;
  input wire signed [(5'h11):(1'h0)] wire204;
  input wire [(4'h8):(1'h0)] wire203;
  wire [(4'hf):(1'h0)] wire215;
  wire signed [(4'h8):(1'h0)] wire209;
  wire signed [(4'h9):(1'h0)] wire208;
  reg signed [(4'hc):(1'h0)] reg214 = (1'h0);
  reg signed [(4'he):(1'h0)] reg213 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg212 = (1'h0);
  reg [(2'h2):(1'h0)] reg211 = (1'h0);
  reg signed [(4'he):(1'h0)] reg210 = (1'h0);
  assign y = {wire215,
                 wire209,
                 wire208,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 (1'h0)};
  assign wire208 = wire204;
  assign wire209 = ($signed((wire206 + ($signed(wire207) ?
                       (wire204 ?
                           wire203 : (8'had)) : (-wire207)))) + (^~(~^($unsigned(wire203) <<< (wire207 << wire206)))));
  always
    @(posedge clk) begin
      if ({((-wire207[(3'h4):(2'h2)]) << wire205)})
        begin
          reg210 <= wire203[(3'h5):(1'h0)];
        end
      else
        begin
          reg210 <= wire203[(3'h5):(2'h3)];
        end
      reg211 <= $unsigned(($signed(($unsigned(wire207) ?
              $signed((8'hb0)) : (wire209 + wire209))) ?
          (wire208[(2'h3):(1'h0)] ?
              wire204 : ($signed(wire203) ?
                  (!wire206) : (&wire204))) : (|$unsigned({wire203,
              wire207}))));
      reg212 <= wire208;
      reg213 <= $signed(({(!$signed(wire207)),
          $signed((wire203 >> wire203))} | wire209[(1'h0):(1'h0)]));
      reg214 <= reg213;
    end
  assign wire215 = {$unsigned(($unsigned(reg212) < reg214))};
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h304):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire176;
  wire [(3'h5):(1'h0)] wire175;
  wire signed [(4'hd):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire [(4'hd):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire159;
  wire [(5'h11):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire94;
  reg [(5'h12):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg173 = (1'h0);
  reg [(3'h4):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg [(5'h10):(1'h0)] reg170 = (1'h0);
  reg [(4'he):(1'h0)] reg169 = (1'h0);
  reg [(5'h12):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(2'h2):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire163,
                 wire162,
                 wire161,
                 wire159,
                 wire96,
                 wire94,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
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
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire8[(2'h3):(1'h0)])
        begin
          reg11 <= wire10;
        end
      else
        begin
          reg11 <= (~(((!$unsigned(wire9)) ?
              (((8'h9e) ?
                  wire10 : wire9) <= (reg11 + wire9)) : wire10[(4'h9):(4'h9)]) ~^ (reg11 ^ $unsigned(reg11[(3'h4):(1'h0)]))));
          reg12 <= reg11[(2'h2):(1'h0)];
          if ($unsigned(wire8))
            begin
              reg13 <= (8'hb9);
              reg14 <= wire9;
              reg15 <= (^(&wire10[(4'hd):(2'h2)]));
              reg16 <= reg12[(1'h1):(1'h1)];
              reg17 <= (|reg11[(3'h4):(3'h4)]);
            end
          else
            begin
              reg13 <= {reg16,
                  ($signed((|$signed(reg14))) != ($signed($unsigned(wire10)) <= ((reg12 ?
                          reg17 : reg15) ?
                      (reg15 ? (8'hb0) : wire8) : {wire9, reg17})))};
            end
        end
      reg18 <= $signed((((8'had) ^ {wire8, reg11[(3'h4):(2'h2)]}) ?
          $signed(($signed(reg13) <<< {reg13,
              wire9})) : (wire9[(2'h2):(1'h1)] <= ({reg15} ?
              (reg16 ? reg16 : reg15) : (reg16 ? reg16 : reg11)))));
      if ($unsigned((~^$signed($signed((~|wire9))))))
        begin
          if (wire9)
            begin
              reg19 <= wire8[(3'h7):(2'h3)];
            end
          else
            begin
              reg19 <= (reg15 ?
                  ((|({wire9, wire10} ?
                      reg15 : (reg18 | reg14))) == (reg17 <= (8'ha6))) : wire7[(4'ha):(3'h6)]);
              reg20 <= $signed($unsigned($signed({$unsigned(reg14), wire8})));
              reg21 <= reg11;
              reg22 <= {(^~$signed(((reg18 <= reg17) >>> $signed(reg21)))),
                  $unsigned((^~reg19))};
            end
          if (reg19[(1'h0):(1'h0)])
            begin
              reg23 <= reg19[(1'h1):(1'h1)];
              reg24 <= reg23[(1'h0):(1'h0)];
              reg25 <= reg19[(1'h1):(1'h0)];
              reg26 <= reg18[(2'h2):(1'h1)];
            end
          else
            begin
              reg23 <= reg21;
              reg24 <= $signed(((wire7 ?
                  (~&reg12) : ($signed(reg21) ?
                      reg12[(4'h8):(4'h8)] : reg11)) >= (&reg13)));
            end
          if ((~^(reg15 ?
              $unsigned($unsigned((reg24 <= wire7))) : reg25[(3'h7):(2'h3)])))
            begin
              reg27 <= $unsigned(((+((&reg20) == reg21[(3'h6):(3'h5)])) ^~ wire8));
              reg28 <= (~{(~|$unsigned((reg12 ? reg25 : (8'h9e))))});
              reg29 <= (~|reg28[(1'h1):(1'h1)]);
            end
          else
            begin
              reg27 <= wire8;
              reg28 <= (reg19[(1'h0):(1'h0)] ?
                  $unsigned(wire7) : (reg11[(3'h4):(3'h4)] || ($signed(reg12[(4'ha):(1'h0)]) * $unsigned((reg16 ?
                      wire10 : wire8)))));
              reg29 <= reg26[(1'h0):(1'h0)];
              reg30 <= $signed(((reg25[(1'h1):(1'h0)] & wire8) >> {(^$unsigned(reg19))}));
              reg31 <= reg29[(4'ha):(3'h4)];
            end
          reg32 <= $unsigned((~^(($signed((8'ha3)) ?
              (reg22 * wire8) : wire8) ^~ (wire10[(4'hc):(3'h6)] >>> (~&reg26)))));
          reg33 <= reg19[(2'h2):(1'h0)];
        end
      else
        begin
          reg19 <= $signed({(+(wire10[(4'hb):(4'ha)] ~^ (reg12 ?
                  (8'hae) : (8'hab))))});
          reg20 <= reg32[(3'h4):(1'h0)];
          if ($signed(({$unsigned({wire9})} ?
              {{(reg13 ?
                          (7'h43) : reg24)}} : $signed($signed((reg13 - (8'h9f)))))))
            begin
              reg21 <= (reg11[(3'h5):(1'h0)] ?
                  (~{$unsigned(reg19)}) : $signed($signed(($unsigned(reg16) ?
                      reg11[(1'h0):(1'h0)] : (wire8 ? reg25 : (8'h9c))))));
              reg22 <= $unsigned(($signed(($signed(reg22) ?
                      $signed(reg26) : reg26[(2'h2):(1'h1)])) ?
                  (~|(((8'h9f) ? wire8 : reg25) - ((8'ha4) ?
                      reg22 : reg25))) : reg25));
            end
          else
            begin
              reg21 <= reg21;
              reg22 <= (~&({(~&((8'hbb) ? reg20 : reg33)),
                  (~reg11[(3'h5):(2'h2)])} != $signed(wire8[(2'h2):(1'h0)])));
              reg23 <= reg27;
              reg24 <= reg27[(3'h7):(3'h4)];
            end
        end
    end
  always
    @(posedge clk) begin
      if ({reg15, ($signed(reg29) ? {(+(reg25 ? reg18 : reg27))} : reg19)})
        begin
          reg34 <= reg33;
          reg35 <= reg30[(2'h2):(1'h1)];
          if (((-(($unsigned((8'hb9)) ? (7'h43) : wire8[(2'h2):(1'h1)]) ?
                  reg32 : {reg25[(2'h3):(2'h2)], (~&reg29)})) ?
              reg33 : (-reg13[(4'he):(4'hc)])))
            begin
              reg36 <= $signed((~^$unsigned((8'h9e))));
              reg37 <= reg19;
              reg38 <= reg24;
              reg39 <= {reg30[(1'h1):(1'h0)]};
              reg40 <= $signed({($unsigned(reg18) ?
                      (+(reg37 >>> reg20)) : ($unsigned(reg12) <<< reg36))});
            end
          else
            begin
              reg36 <= (((8'haa) && (8'hb3)) ?
                  $unsigned($unsigned(reg16)) : (($unsigned((&reg39)) ?
                      reg37[(1'h0):(1'h0)] : (~^(reg40 * reg39))) || ($unsigned((wire9 ?
                          (8'ha2) : reg22)) ?
                      wire9 : reg29[(5'h10):(4'hd)])));
            end
          reg41 <= $signed($signed((-reg14)));
          reg42 <= {{reg25, $unsigned(reg24)}, (-(&(&reg39)))};
        end
      else
        begin
          reg34 <= (reg29[(4'h8):(1'h0)] ?
              (({reg34[(3'h4):(2'h3)]} * ((-(8'hac)) && $unsigned(reg35))) ?
                  reg21[(1'h1):(1'h0)] : reg33[(4'hb):(1'h1)]) : $unsigned({(reg26 ?
                      $signed(reg38) : reg35),
                  reg38[(3'h6):(1'h1)]}));
          if (reg32)
            begin
              reg35 <= (-$signed(((reg20[(1'h0):(1'h0)] ?
                  reg13 : $signed(reg16)) & reg17[(1'h1):(1'h0)])));
              reg36 <= reg29;
              reg37 <= ($signed(($unsigned(reg39[(1'h1):(1'h1)]) ^ ((reg21 ^~ reg31) == $unsigned(reg23)))) <= reg34);
              reg38 <= (&($signed($signed((8'haa))) ?
                  reg26[(2'h2):(1'h1)] : $unsigned((~^reg24[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg35 <= (&$signed((reg42[(3'h7):(1'h0)] ?
                  reg30[(2'h3):(1'h0)] : reg38)));
            end
        end
      if ($unsigned($unsigned((reg26 != reg40))))
        begin
          reg43 <= ((reg36 ? (&wire9[(1'h0):(1'h0)]) : reg24) ?
              (reg25 ? $unsigned(reg17) : reg22) : (|(~&$signed({wire8}))));
          reg44 <= (~&reg42[(3'h4):(3'h4)]);
          reg45 <= wire7[(4'h8):(2'h2)];
          reg46 <= $signed({$signed(wire9[(3'h5):(2'h3)]), $unsigned(reg38)});
        end
      else
        begin
          reg43 <= reg31;
          reg44 <= (^~{wire8[(3'h6):(3'h4)]});
          reg45 <= reg19[(2'h3):(2'h2)];
          if (reg35)
            begin
              reg46 <= (~|reg41);
              reg47 <= reg46[(3'h6):(3'h5)];
              reg48 <= $signed(reg15[(4'hd):(4'ha)]);
              reg49 <= reg32;
              reg50 <= (|reg27);
            end
          else
            begin
              reg46 <= $signed(reg30[(3'h4):(1'h1)]);
              reg47 <= reg50;
              reg48 <= reg14;
              reg49 <= $unsigned(reg18);
            end
        end
      reg51 <= ($unsigned(reg50[(4'h9):(2'h3)]) <= (8'haf));
    end
  always
    @(posedge clk) begin
      reg52 <= ($signed(reg17[(4'he):(3'h4)]) > reg23);
      reg53 <= (^(~^reg30));
      reg54 <= wire10;
    end
  module55 #() modinst95 (.wire58(reg50), .y(wire94), .clk(clk), .wire60(reg26), .wire59(reg23), .wire56(reg32), .wire57(wire8));
  assign wire96 = {($unsigned((reg44[(3'h6):(1'h0)] ?
                              reg41 : reg53[(1'h0):(1'h0)])) ?
                          reg54 : reg24),
                      $unsigned(reg53[(1'h1):(1'h0)])};
  always
    @(posedge clk) begin
      reg97 <= (reg49 && reg34[(4'hd):(1'h1)]);
      reg98 <= (~^((wire94[(4'hf):(1'h0)] <= ($unsigned(reg36) ?
              $unsigned(reg29) : ((8'h9e) && wire10))) ?
          (~&reg11[(1'h0):(1'h0)]) : ($unsigned((~|(8'hb5))) ~^ ($signed(reg16) <= {reg30,
              (8'hba)}))));
      if ($unsigned($unsigned($signed(reg14))))
        begin
          reg99 <= $unsigned(reg14[(1'h1):(1'h0)]);
          reg100 <= $unsigned($signed((+(reg36[(2'h2):(1'h0)] || (reg32 ?
              reg21 : reg99)))));
        end
      else
        begin
          reg99 <= $signed(reg11);
          reg100 <= $unsigned($unsigned((!$unsigned((reg26 ?
              reg13 : (8'ha7))))));
        end
      reg101 <= $unsigned((wire94 ?
          (((~^reg30) & reg54[(3'h4):(3'h4)]) ?
              (reg26[(1'h1):(1'h0)] ~^ (-reg19)) : reg43[(1'h0):(1'h0)]) : (^~(reg54 ~^ (&reg38)))));
      reg102 <= reg54;
    end
  module103 #() modinst160 (.wire108(reg50), .wire106(reg37), .wire105(reg26), .wire107(reg29), .clk(clk), .y(wire159), .wire104(reg36));
  assign wire161 = $unsigned($unsigned((reg18 ?
                       (reg48[(4'ha):(1'h1)] ?
                           (reg23 ~^ wire94) : $signed((7'h44))) : (wire7 ?
                           reg50 : ((8'hb0) ? (8'hbf) : reg97)))));
  assign wire162 = reg39[(3'h6):(3'h4)];
  assign wire163 = wire162[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      if ((8'ha3))
        begin
          if ((~|(|($signed(reg12[(2'h3):(2'h3)]) ?
              (|(~^reg51)) : $signed(reg35[(4'he):(4'hb)])))))
            begin
              reg164 <= (($signed($unsigned(reg36[(4'hc):(3'h5)])) & (8'h9d)) ?
                  ($unsigned($signed((8'hbf))) ?
                      (reg24[(1'h1):(1'h1)] ~^ (8'ha8)) : reg29[(4'hd):(4'hb)]) : $signed($signed($unsigned((reg27 << reg52)))));
              reg165 <= reg33[(5'h13):(3'h5)];
              reg166 <= ((!reg11[(1'h0):(1'h0)]) == reg18[(1'h1):(1'h1)]);
              reg167 <= $unsigned($unsigned($unsigned($unsigned(reg20[(4'h9):(2'h3)]))));
              reg168 <= (!wire10[(2'h2):(1'h1)]);
            end
          else
            begin
              reg164 <= ((&(|{$signed(wire8), (~|(8'hb8))})) ?
                  reg166[(1'h1):(1'h0)] : $signed(($signed(reg51) ?
                      (^{reg45}) : ((reg165 && reg52) * reg97[(1'h1):(1'h1)]))));
            end
          if (((reg37 & {($unsigned(reg41) ?
                  $signed(reg21) : $unsigned(wire7))}) << {reg26[(2'h3):(1'h1)],
              (reg53[(3'h5):(1'h0)] ?
                  $signed({(8'ha7)}) : ((reg36 ?
                      reg97 : wire7) || (wire10 << reg35)))}))
            begin
              reg169 <= reg15[(3'h7):(3'h4)];
              reg170 <= $signed(reg30[(4'h8):(2'h3)]);
              reg171 <= $unsigned(reg27);
              reg172 <= (~|(!reg16));
              reg173 <= reg101[(3'h6):(2'h2)];
            end
          else
            begin
              reg169 <= (($unsigned($signed($signed(reg14))) >> $unsigned(wire94)) >= reg44[(3'h6):(2'h2)]);
              reg170 <= reg172;
              reg171 <= reg20[(2'h3):(2'h3)];
              reg172 <= (^~$unsigned($unsigned($signed(reg169))));
              reg173 <= reg168[(3'h6):(2'h2)];
            end
        end
      else
        begin
          reg164 <= $unsigned($unsigned($unsigned(((reg26 >> (8'haa)) - reg29[(5'h12):(3'h4)]))));
          reg165 <= reg30;
          reg166 <= (!$signed($unsigned(((~^reg32) ?
              $unsigned(reg37) : reg28[(2'h2):(1'h1)]))));
          reg167 <= reg33;
          if ((~(reg46 <<< $unsigned(wire161[(4'h9):(2'h2)]))))
            begin
              reg168 <= {(8'h9c)};
              reg169 <= (&(^~($signed($unsigned(reg34)) && {$unsigned(reg25),
                  (~|reg15)})));
            end
          else
            begin
              reg168 <= $signed(reg97);
              reg169 <= (($unsigned((((8'hb3) + (8'hb0)) >> reg32[(4'hb):(4'hb)])) ?
                  (reg28[(3'h6):(3'h5)] ?
                      {$signed(wire159)} : reg17) : {reg29[(3'h5):(2'h2)],
                      $unsigned($unsigned((8'ha9)))}) == ((!reg17[(4'h9):(2'h2)]) ?
                  {(7'h43), $unsigned({reg49})} : (reg11[(3'h6):(1'h1)] ?
                      ((!reg42) ?
                          (8'ha5) : {reg50,
                              reg28}) : (reg47 >>> $signed(reg44)))));
              reg170 <= ($unsigned((reg41 != ({reg41} ?
                  $signed(wire8) : reg14))) ~^ ((+((^~(8'hb2)) ?
                  (~reg164) : (+reg164))) > reg52));
              reg171 <= (|wire9[(3'h4):(1'h1)]);
            end
        end
      reg174 <= ((~^({((8'ha6) < (8'ha5))} ?
          reg169[(1'h0):(1'h0)] : reg173)) & ((~($signed(reg13) ?
          $unsigned(reg30) : $unsigned((8'hb0)))) > ((~^$unsigned(reg30)) <<< $signed((!reg23)))));
    end
  assign wire175 = ({(~^$signed($unsigned(reg53))),
                           (~{(reg13 > reg20), (reg36 >>> (8'hb0))})} ?
                       (wire161[(3'h7):(3'h7)] + $unsigned((reg36[(5'h13):(4'h9)] - (!(7'h42))))) : $signed($signed($unsigned(((7'h40) * reg38)))));
  assign wire176 = $signed($unsigned($signed($unsigned($signed(reg98)))));
endmodule

module module103
#(parameter param158 = {(({(!(8'hb0)), (-(8'hba))} ? {(!(8'hb4)), ((8'ha8) ? (8'hb4) : (8'h9c))} : (((8'hba) ^ (8'hb9)) > ((8'hbc) ? (8'hbe) : (7'h42)))) ? ((((8'had) - (7'h41)) ? (^~(8'hba)) : ((8'hbc) ? (8'hba) : (8'ha4))) ^ (~((8'ha4) << (8'hbe)))) : ((&{(7'h40), (8'hb4)}) ? (^((8'hac) ? (8'hbd) : (8'haf))) : (((8'hb3) >> (8'hb6)) ? ((8'hae) ? (8'hb1) : (8'h9c)) : (~^(8'hb1)))))})
(y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'h23d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire108;
  input wire signed [(3'h4):(1'h0)] wire107;
  input wire [(3'h4):(1'h0)] wire106;
  input wire [(2'h2):(1'h0)] wire105;
  input wire signed [(5'h14):(1'h0)] wire104;
  wire signed [(3'h7):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire139;
  wire [(5'h14):(1'h0)] wire138;
  wire [(4'he):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire135;
  wire [(5'h11):(1'h0)] wire134;
  wire [(4'h8):(1'h0)] wire133;
  wire [(4'hd):(1'h0)] wire132;
  wire signed [(4'hd):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(2'h2):(1'h0)] wire109;
  reg signed [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
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
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
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
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire109 = (($signed(((~(8'hb5)) >>> wire108[(3'h6):(3'h4)])) || ({$unsigned(wire107)} != wire105)) >= $unsigned($unsigned((^~$unsigned(wire108)))));
  assign wire110 = (((^~$signed($signed(wire104))) * $unsigned(wire109)) ?
                       ({{$unsigned(wire109),
                               $signed(wire106)}} ^ ({$signed(wire109),
                               $signed(wire107)} ?
                           $signed($signed(wire106)) : (~(wire106 ?
                               wire108 : wire109)))) : ((($unsigned(wire109) ?
                               $unsigned(wire109) : (wire108 < wire109)) ?
                           {(wire105 && wire107)} : (~(wire107 ?
                               wire104 : wire106))) ^~ $signed((wire107[(2'h3):(2'h2)] <<< $signed(wire106)))));
  assign wire111 = $signed(((($unsigned(wire107) - $unsigned(wire105)) <= (+wire105)) == $signed($signed({wire105,
                       wire107}))));
  assign wire112 = (wire108[(5'h11):(4'ha)] == (((~$signed((8'ha2))) ?
                           (wire110[(3'h5):(2'h3)] ?
                               wire105 : wire110[(4'h8):(3'h7)]) : wire110[(4'h8):(1'h1)]) ?
                       {wire104, (7'h42)} : $signed(wire110[(1'h1):(1'h0)])));
  assign wire113 = (~&(|$unsigned((|(wire104 > wire106)))));
  assign wire114 = wire113;
  always
    @(posedge clk) begin
      if ($signed((((wire110[(1'h1):(1'h1)] ?
                  ((8'h9d) ^~ (8'ha8)) : $signed(wire108)) ?
              ({wire110,
                  wire112} != wire109[(2'h2):(2'h2)]) : {(wire110 ^ wire104)}) ?
          $unsigned(((wire105 ?
              wire108 : (8'hb8)) < wire104[(5'h12):(4'he)])) : {$signed(wire111[(4'ha):(1'h0)])})))
        begin
          if (wire106[(2'h2):(1'h0)])
            begin
              reg115 <= $unsigned((((+(+wire107)) != wire105) ?
                  (^~$signed(wire107[(3'h4):(1'h1)])) : wire106[(1'h0):(1'h0)]));
              reg116 <= $signed((8'hb3));
              reg117 <= reg115;
              reg118 <= wire106;
              reg119 <= (($unsigned({(|wire106), (^~reg115)}) ?
                      (($unsigned(wire111) > (-reg118)) ?
                          ($signed(reg116) ?
                              {wire114, wire111} : ((8'ha9) ?
                                  wire109 : wire105)) : wire113[(4'hf):(4'hc)]) : $unsigned((8'hbe))) ?
                  wire113 : $signed($signed($signed($unsigned((8'hb6))))));
            end
          else
            begin
              reg115 <= wire104[(2'h3):(2'h2)];
              reg116 <= reg119;
            end
          if (reg119)
            begin
              reg120 <= $signed(((~^wire113) == (reg119[(5'h14):(1'h0)] ?
                  ((wire104 ? wire104 : reg115) ?
                      {wire108} : $unsigned((8'hb8))) : $signed((wire111 ?
                      wire114 : wire109)))));
            end
          else
            begin
              reg120 <= reg116[(2'h3):(1'h1)];
              reg121 <= $unsigned(((wire111 <<< $signed((+reg117))) ?
                  {(^~(^~(8'ha3))),
                      wire108[(4'hd):(2'h2)]} : ((|$signed(wire109)) <= wire111)));
              reg122 <= {wire114};
              reg123 <= (((reg122 > $unsigned($unsigned(reg117))) ?
                      wire110[(3'h5):(2'h3)] : ((|(wire113 ^~ (8'hab))) - wire105[(2'h2):(2'h2)])) ?
                  {reg118,
                      (((reg115 ?
                          wire113 : wire112) || (^~reg117)) && (~&(wire110 ?
                          reg120 : wire104)))} : $signed(reg120));
              reg124 <= {$signed($unsigned(((wire109 ? reg121 : wire114) ?
                      $unsigned(reg121) : $unsigned((8'hb7))))),
                  (~&(+reg116[(3'h5):(1'h0)]))};
            end
          reg125 <= ((wire108 ?
                  (reg120[(3'h6):(2'h2)] ?
                      ((wire105 ?
                          wire104 : reg116) <= $signed(wire113)) : ({reg117,
                          reg116} * (7'h43))) : wire111) ?
              ($unsigned($unsigned((~^reg117))) > reg117[(4'h9):(3'h5)]) : $unsigned($unsigned((reg123 ?
                  $unsigned(wire109) : reg119))));
        end
      else
        begin
          reg115 <= {reg122,
              $signed((wire107 ? wire106 : {(wire104 >= wire111)}))};
          reg116 <= $signed((reg122[(4'ha):(1'h1)] ?
              wire110[(3'h4):(1'h1)] : wire109));
          if ($unsigned($signed($unsigned($signed($signed(reg117))))))
            begin
              reg117 <= reg121[(1'h0):(1'h0)];
            end
          else
            begin
              reg117 <= $unsigned(reg115);
              reg118 <= $unsigned($unsigned((reg116 || $signed((reg118 && reg120)))));
              reg119 <= (wire112 < ((&($signed((8'hb3)) ?
                      $signed(reg117) : $signed(wire104))) ?
                  $unsigned(wire104) : reg121[(1'h0):(1'h0)]));
              reg120 <= $unsigned(((8'haf) >>> $unsigned($signed((reg121 | (8'ha9))))));
            end
          reg121 <= ($unsigned(reg118[(4'ha):(3'h5)]) ?
              $unsigned({reg117[(3'h5):(2'h3)],
                  {wire105[(2'h2):(2'h2)], $signed(wire108)}}) : wire109);
        end
    end
  always
    @(posedge clk) begin
      reg126 <= (wire114 * (^~((|$signed(reg116)) * (wire112 ^ reg115[(3'h6):(3'h4)]))));
      reg127 <= $signed((8'ha7));
      reg128 <= reg121[(1'h0):(1'h0)];
      reg129 <= wire111[(1'h0):(1'h0)];
    end
  assign wire130 = $signed($signed(($signed({reg126, reg125}) ?
                       (+((8'ha3) ?
                           wire111 : wire109)) : $unsigned($signed(reg125)))));
  assign wire131 = reg124;
  assign wire132 = wire131;
  assign wire133 = $unsigned($signed(({(wire108 ? wire112 : wire107),
                       reg129[(1'h0):(1'h0)]} ~^ ((reg123 ?
                       reg115 : reg126) | (&(8'ha5))))));
  assign wire134 = $signed(reg122);
  assign wire135 = $signed((-$signed(reg126)));
  assign wire136 = (+($unsigned(wire104[(5'h12):(4'hc)]) * ($unsigned($unsigned(wire109)) ^~ reg127)));
  assign wire137 = reg116;
  assign wire138 = wire106[(1'h1):(1'h1)];
  assign wire139 = (wire114 ?
                       (|wire108) : (wire113 ?
                           ($unsigned({reg124}) && ((~^wire137) - (wire109 ^ wire114))) : (!wire109[(1'h0):(1'h0)])));
  assign wire140 = $unsigned(wire131);
  always
    @(posedge clk) begin
      if ($signed(reg115[(1'h0):(1'h0)]))
        begin
          reg141 <= (|wire108[(3'h4):(2'h2)]);
        end
      else
        begin
          if ($signed((+(+wire132))))
            begin
              reg141 <= (reg119 + ((((wire110 ~^ wire107) != ((8'ha2) ?
                          reg128 : wire131)) ?
                      $signed((wire133 ?
                          wire112 : (8'hb8))) : reg116[(3'h5):(1'h1)]) ?
                  ($signed((reg115 ^~ wire107)) ^~ (&$unsigned(reg129))) : wire137[(4'h8):(1'h0)]));
              reg142 <= wire104[(4'hb):(3'h6)];
            end
          else
            begin
              reg141 <= (^~($unsigned(((reg117 ? wire104 : wire136) ?
                      $unsigned(wire114) : $unsigned(reg121))) ?
                  reg124[(1'h0):(1'h0)] : (8'ha3)));
              reg142 <= wire133;
              reg143 <= ($signed($signed((~(reg121 ? wire105 : wire112)))) ?
                  (($unsigned($unsigned((7'h42))) & ((wire106 ?
                          wire106 : wire110) ^ wire114)) ?
                      $unsigned(($signed(wire111) != (~&reg120))) : $signed({reg141})) : wire104[(4'hd):(4'h8)]);
            end
          reg144 <= (-({reg129,
              (wire131 | $unsigned(reg115))} > {{$unsigned(wire132)},
              (^~(|wire133))}));
          reg145 <= wire110[(3'h7):(1'h1)];
        end
      if ((reg115 == wire110))
        begin
          reg146 <= $signed(($unsigned((~&(wire110 * (8'haa)))) ?
              (wire132 ?
                  reg141 : ((reg144 ?
                      reg119 : wire111) + (~(8'ha2)))) : (wire104[(3'h7):(2'h3)] ?
                  $signed(reg142[(5'h13):(5'h13)]) : (!(reg115 ?
                      wire107 : wire130)))));
          if (reg124)
            begin
              reg147 <= reg120[(1'h0):(1'h0)];
              reg148 <= (~|(^reg143));
              reg149 <= wire136[(1'h1):(1'h1)];
              reg150 <= $unsigned($signed((!(reg145 ?
                  (wire137 > (8'hb0)) : ((7'h40) <= wire138)))));
              reg151 <= reg148[(5'h12):(4'he)];
            end
          else
            begin
              reg147 <= wire107;
            end
          reg152 <= (^(~(wire109[(1'h0):(1'h0)] ?
              wire105[(1'h0):(1'h0)] : ({(8'hbc)} ~^ reg119))));
        end
      else
        begin
          if (reg149)
            begin
              reg146 <= (|($unsigned((reg146[(1'h0):(1'h0)] <<< (8'hab))) ?
                  ((~|(~^wire112)) ?
                      {(reg151 ? (8'hb1) : wire131),
                          (8'hbf)} : $unsigned(reg120[(4'h8):(4'h8)])) : ((wire109 != ((7'h44) || reg150)) - wire139)));
              reg147 <= (!wire111);
              reg148 <= $signed((|$unsigned(reg122[(4'hb):(3'h6)])));
            end
          else
            begin
              reg146 <= reg129;
              reg147 <= ({(((wire111 ?
                          reg148 : reg147) & wire132[(4'ha):(1'h1)]) * reg129[(4'he):(3'h6)])} ?
                  ({((|wire113) & {wire105}),
                      reg144} && reg118[(4'hc):(1'h1)]) : ((wire136[(3'h4):(1'h1)] + reg146[(4'hd):(3'h7)]) ?
                      reg116 : $unsigned(wire108)));
              reg148 <= ($signed((~|{(wire138 ? wire113 : wire136),
                      $signed(reg119)})) ?
                  $signed((reg121 - reg144[(1'h0):(1'h0)])) : $signed($signed((~|$signed(wire104)))));
            end
          if ($unsigned(wire104))
            begin
              reg149 <= reg142;
            end
          else
            begin
              reg149 <= $signed(reg121[(1'h0):(1'h0)]);
              reg150 <= (~(~&(((|(8'hac)) - (reg151 ?
                  reg150 : wire112)) - {(reg119 ? wire111 : reg150),
                  $signed(wire131)})));
              reg151 <= (~&$signed($unsigned($signed(wire133))));
              reg152 <= {$signed((wire113 >>> (^(reg117 ? wire134 : reg151))))};
              reg153 <= (^$unsigned(wire137));
            end
          reg154 <= wire108;
          reg155 <= (reg147[(4'h9):(2'h2)] >= reg148[(4'h8):(4'h8)]);
        end
      reg156 <= $signed(($unsigned($unsigned((reg119 ?
          (8'hae) : (7'h43)))) == ({reg122} > reg121[(2'h3):(1'h0)])));
      reg157 <= ({((reg115 == (reg155 ?
              reg127 : wire132)) <<< reg141[(3'h7):(3'h4)]),
          $signed((~&$signed(reg121)))} >= reg119);
    end
endmodule

module module55
#(parameter param92 = ({((((8'ha6) ? (8'hbe) : (8'haf)) >= ((8'h9c) ? (8'hbc) : (8'h9e))) || {((8'h9e) ? (8'hac) : (8'hb5))})} ? ((~(((8'ha4) & (8'haa)) ? ((8'hbb) ^~ (8'h9e)) : ((8'hb3) < (8'hbe)))) && ((((8'ha1) ? (8'ha4) : (8'ha5)) ? ((8'hbc) ? (8'hbe) : (8'hbd)) : ((8'hb2) || (7'h40))) * ({(8'ha2)} ? {(8'ha8), (7'h43)} : ((8'had) || (7'h43))))) : {(8'ha0)}), 
parameter param93 = ((^~((((8'hb2) ? param92 : param92) < (param92 ? param92 : param92)) != {param92, (param92 ? param92 : (8'haa))})) ? ({((param92 ? param92 : param92) ? {(7'h41), param92} : (~&param92)), (~&(param92 || param92))} ? (((+(8'hb3)) ? ((8'hb6) >>> param92) : (param92 ? param92 : param92)) <= (((8'hbd) ? param92 : param92) ~^ param92)) : (({param92, param92} <= (param92 & param92)) ? ((~^param92) < {param92}) : {(param92 == param92)})) : ((&(param92 ? {param92, param92} : (param92 ? param92 : param92))) ? {(~(+param92))} : (-param92))))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire60;
  input wire signed [(4'hf):(1'h0)] wire59;
  input wire signed [(4'hd):(1'h0)] wire58;
  input wire [(3'h5):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire61;
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire63,
                 wire62,
                 wire61,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire61 = ($unsigned($signed(($signed(wire60) ?
                      (wire58 - wire57) : (wire57 << wire59)))) != wire57);
  assign wire62 = (+$signed((~&wire58)));
  assign wire63 = {wire58,
                      $unsigned($signed((wire61[(5'h13):(5'h10)] ?
                          (wire61 ? wire60 : wire62) : $signed(wire60))))};
  always
    @(posedge clk) begin
      reg64 <= (wire61 + $signed(wire63[(5'h10):(4'ha)]));
    end
  always
    @(posedge clk) begin
      reg65 <= (!($signed($signed((|wire56))) + $signed(((&wire58) ?
          (wire58 <<< wire59) : wire62[(1'h1):(1'h1)]))));
      if ($unsigned($unsigned($signed((wire60[(2'h2):(1'h1)] ?
          (8'ha7) : $unsigned(wire57))))))
        begin
          reg66 <= $unsigned($signed(wire61));
        end
      else
        begin
          reg66 <= ($signed(reg66[(4'h8):(4'h8)]) != {(~(~(reg66 ?
                  wire62 : wire63)))});
          if ((!reg64))
            begin
              reg67 <= wire57[(1'h1):(1'h0)];
              reg68 <= {{$unsigned(($signed(wire57) ? reg67 : (^wire63)))},
                  $unsigned(wire59[(4'h9):(1'h0)])};
              reg69 <= (!(wire61[(1'h0):(1'h0)] ~^ ($unsigned((8'hba)) ?
                  (+wire62) : wire63)));
              reg70 <= ((~^$signed((+reg68))) >= reg68);
            end
          else
            begin
              reg67 <= ($signed(wire58) ~^ ($signed((+(wire61 ?
                  wire61 : reg70))) ~^ {reg66, $unsigned($unsigned(wire59))}));
              reg68 <= ({$signed(wire60[(3'h4):(2'h2)]),
                      ($unsigned((wire57 <<< wire63)) == reg67)} ?
                  (~$unsigned({reg66[(2'h3):(1'h1)],
                      (|reg64)})) : $unsigned(((((8'ha7) ~^ (8'ha3)) ?
                          reg68 : {wire59, wire58}) ?
                      (~&$signed(reg69)) : (+$signed((8'ha3))))));
              reg69 <= (^wire61);
              reg70 <= $unsigned(((8'hbe) ?
                  (((~|reg68) ?
                      $signed(wire57) : reg64) ^ $signed($signed(reg68))) : wire60));
            end
          reg71 <= reg68;
          reg72 <= $unsigned(reg64);
        end
    end
  assign wire73 = $signed((7'h42));
  assign wire74 = {$signed((($unsigned((8'ha7)) + (reg72 ? reg69 : reg69)) ?
                          ({reg71} ?
                              wire56[(5'h15):(4'he)] : (+(8'hbb))) : $unsigned($signed(reg64))))};
  assign wire75 = ((reg68 ?
                          $signed(wire61[(4'h9):(1'h1)]) : $signed($unsigned(wire60))) ?
                      wire74 : reg66);
  assign wire76 = $signed(reg64);
  always
    @(posedge clk) begin
      reg77 <= wire61[(4'hf):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg78 <= (^~((&(!wire62)) ?
          {$signed(((7'h42) ? wire60 : reg65))} : (~$unsigned((~wire73)))));
      reg79 <= reg77;
      reg80 <= ((reg64[(1'h0):(1'h0)] ?
              {(wire74 ? {reg68} : (!wire62)),
                  (wire61 ?
                      reg69[(1'h1):(1'h1)] : $unsigned(reg70))} : (~^{(reg69 | reg71)})) ?
          wire57[(2'h3):(2'h2)] : (&($unsigned(reg70[(4'ha):(1'h0)]) < reg79)));
      reg81 <= {$unsigned(reg80[(3'h4):(1'h0)]), reg64[(3'h7):(3'h4)]};
      if ((($unsigned(reg70[(2'h2):(2'h2)]) ?
          ((~|$signed(reg80)) ?
              wire58[(4'h9):(4'h8)] : wire56) : (^~$signed(wire58[(4'hc):(3'h4)]))) != $unsigned($unsigned(reg81[(3'h6):(2'h2)]))))
        begin
          if (((((+wire61) | $signed(reg77)) < (reg71 > (wire60 ?
              wire63[(4'hb):(4'hb)] : (reg64 ^ wire62)))) <<< (&wire74[(2'h3):(2'h2)])))
            begin
              reg82 <= $signed({$signed((8'hba))});
            end
          else
            begin
              reg82 <= ((reg70 ?
                  (((wire56 ? wire73 : (8'haf)) - (~wire76)) | ((wire62 ?
                      reg72 : reg68) == {reg67,
                      wire59})) : $unsigned($signed({reg64}))) <<< $signed(($unsigned(wire60[(3'h4):(2'h2)]) ?
                  (((8'hb4) != wire76) <<< wire76[(4'h9):(3'h5)]) : {(wire59 ?
                          (8'hb3) : reg82),
                      {reg65, (8'hbe)}})));
            end
          reg83 <= (!reg80[(4'ha):(3'h4)]);
          reg84 <= {$signed(reg77[(4'ha):(2'h3)]), wire61[(5'h13):(2'h3)]};
          reg85 <= (reg82[(3'h6):(2'h3)] ?
              (-$unsigned(wire57[(3'h5):(2'h2)])) : wire61);
          reg86 <= $signed(({$signed(reg71)} ?
              wire63[(1'h0):(1'h0)] : {reg70[(1'h0):(1'h0)],
                  wire74[(3'h7):(3'h6)]}));
        end
      else
        begin
          reg82 <= wire75;
          reg83 <= (^~$unsigned((~&(-$unsigned(wire74)))));
          if (reg65)
            begin
              reg84 <= $unsigned(((|reg70) ?
                  $signed((reg81[(1'h1):(1'h1)] << wire60)) : $unsigned(reg83[(3'h4):(3'h4)])));
              reg85 <= (wire57 ?
                  $signed(wire63) : ((reg71[(3'h5):(3'h5)] ?
                          {(8'hb0), $signed(reg70)} : {{(8'ha1), wire57},
                              {wire76, wire61}}) ?
                      $unsigned($unsigned((8'ha0))) : (8'hb1)));
            end
          else
            begin
              reg84 <= wire62;
              reg85 <= ($signed((wire75[(4'h9):(4'h8)] ^~ reg66[(4'h9):(2'h3)])) || wire57);
              reg86 <= $signed($signed($signed((((7'h42) != reg68) >>> ((8'hb6) ^~ reg72)))));
              reg87 <= (-(8'ha7));
            end
          reg88 <= ({reg66[(4'h9):(4'h9)]} ?
              (reg86[(5'h10):(3'h7)] ?
                  wire75[(4'h9):(3'h5)] : (wire74[(2'h2):(2'h2)] ?
                      $signed(reg78) : $unsigned((+reg64)))) : reg66);
        end
    end
  assign wire89 = $unsigned({wire73[(2'h2):(1'h0)]});
  assign wire90 = $unsigned((7'h43));
  assign wire91 = $unsigned(((reg80[(3'h5):(3'h5)] ?
                          ($signed(reg83) * $signed(wire59)) : wire60[(1'h1):(1'h0)]) ?
                      $unsigned(reg71[(4'h9):(1'h0)]) : ($unsigned({reg88}) ?
                          reg80[(4'h8):(3'h7)] : ($signed(wire57) ?
                              {(8'hab)} : $signed(reg68)))));
endmodule

module module228  (y, clk, wire232, wire231, wire230, wire229);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire232;
  input wire signed [(3'h7):(1'h0)] wire231;
  input wire signed [(4'hf):(1'h0)] wire230;
  input wire signed [(4'h8):(1'h0)] wire229;
  wire [(5'h14):(1'h0)] wire237;
  wire [(4'hb):(1'h0)] wire236;
  wire [(3'h7):(1'h0)] wire235;
  wire [(4'ha):(1'h0)] wire233;
  reg [(3'h5):(1'h0)] reg234 = (1'h0);
  assign y = {wire237, wire236, wire235, wire233, reg234, (1'h0)};
  assign wire233 = wire230;
  always
    @(posedge clk) begin
      reg234 <= (wire231 ~^ $unsigned($signed(($unsigned(wire231) ?
          wire233[(2'h2):(2'h2)] : wire230))));
    end
  assign wire235 = $unsigned((wire232 | $unsigned(({(8'hbc),
                       wire231} & reg234[(2'h2):(1'h0)]))));
  assign wire236 = ((^~wire232) ?
                       $unsigned((wire235 ?
                           (&(wire231 ?
                               wire235 : (8'hba))) : (wire229[(3'h4):(1'h0)] > $signed(wire235)))) : wire232);
  assign wire237 = (~^wire229[(3'h5):(2'h2)]);
endmodule
