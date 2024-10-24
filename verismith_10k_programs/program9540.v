module top
#(parameter param125 = ((^~(~^(((8'hb8) - (8'h9c)) < {(8'ha4), (8'h9e)}))) ? {((((8'hb5) - (8'ha8)) ? (!(7'h42)) : (~|(8'hb8))) ~^ (~((8'hb9) ? (8'had) : (8'haf)))), (&{((8'hb0) && (8'hb8))})} : ((((8'h9f) || ((8'ha4) ? (8'had) : (8'hab))) ? {{(8'hb2), (7'h42)}} : (((8'hb0) << (8'haf)) ? {(8'hb9), (7'h41)} : ((8'ha9) ? (7'h41) : (8'ha7)))) ? ({(^(8'haf)), (^(8'ha0))} ? {((8'ha8) || (8'hb4)), ((8'hbe) & (8'ha2))} : (~&((8'hb9) * (8'haf)))) : ((~|((8'hac) ~^ (7'h41))) ? (^((8'hb1) ? (7'h42) : (8'ha8))) : (^((8'ha8) <<< (8'had)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire122;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  assign y = {wire124, wire122, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($signed(wire2[(1'h1):(1'h1)]));
  assign wire5 = {wire4};
  module6 #() modinst123 (wire122, clk, wire5, wire4, wire2, wire0);
  assign wire124 = wire3[(3'h5):(1'h0)];
endmodule

module module6
#(parameter param120 = (&{((((8'hac) ? (8'hbe) : (8'hb9)) < {(8'hae), (8'ha3)}) ? {((8'haf) <= (8'ha9))} : ({(8'haa)} + {(7'h42)}))}), 
parameter param121 = (((param120 >> ((param120 ? param120 : param120) ? (param120 ? param120 : (8'h9e)) : {(8'had), param120})) ? param120 : ({(param120 * param120), (param120 >= param120)} == param120)) ? (({(param120 ? param120 : param120)} || param120) ? (((param120 ? param120 : (8'ha4)) >= (^~param120)) & param120) : (~|((param120 ? param120 : param120) >> (+param120)))) : ((({param120, param120} == (!param120)) >= (((8'ha5) >>> param120) ? param120 : param120)) ? (~|param120) : (8'hb0))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h226):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire119;
  wire [(5'h14):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire116;
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire43,
                 wire12,
                 wire11,
                 wire47,
                 wire48,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire78,
                 wire116,
                 reg45,
                 reg46,
                 reg49,
                 reg50,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
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
                 reg79,
                 reg80,
                 reg81,
                 (1'h0)};
  assign wire11 = ($signed(wire9) ?
                      (^~$signed((&$signed(wire10)))) : ($signed($signed((wire8 == wire10))) > (&$unsigned(wire8[(4'h8):(3'h4)]))));
  assign wire12 = wire8[(4'hc):(2'h2)];
  module13 #() modinst44 (.clk(clk), .wire16(wire9), .y(wire43), .wire14(wire12), .wire15(wire7), .wire17(wire10), .wire18(wire8));
  always
    @(posedge clk) begin
      reg45 <= $unsigned($unsigned(wire9));
      reg46 <= $unsigned(((((wire11 != wire7) - $signed(wire8)) & reg45[(3'h4):(2'h3)]) ?
          (^wire11) : ($unsigned({(8'hb3)}) ?
              reg45[(4'h9):(4'h8)] : {wire11})));
    end
  assign wire47 = $unsigned((reg46[(1'h0):(1'h0)] * reg45));
  assign wire48 = {$signed((~&$unsigned($unsigned(wire10)))),
                      $signed(reg46[(2'h2):(2'h2)])};
  always
    @(posedge clk) begin
      reg49 <= wire11[(4'h8):(3'h5)];
      reg50 <= wire9;
    end
  assign wire51 = wire48;
  assign wire52 = {(~&{(~|wire10),
                          ($signed(wire43) ?
                              (wire8 ? wire9 : wire11) : (wire48 ?
                                  (8'hb4) : (8'hb9)))}),
                      $unsigned(wire43[(5'h11):(5'h10)])};
  assign wire53 = (^~wire7[(4'hf):(4'h8)]);
  assign wire54 = (!((8'hbd) ?
                      reg49[(4'h8):(2'h2)] : {{wire12[(4'hd):(1'h0)]}}));
  assign wire55 = $unsigned($unsigned(($unsigned((!wire52)) ?
                      $unsigned($unsigned(reg49)) : $unsigned((wire47 ~^ wire48)))));
  always
    @(posedge clk) begin
      reg56 <= $unsigned(($unsigned((reg50 ?
          (wire47 << (7'h41)) : (wire48 & wire12))) >= reg49[(3'h5):(3'h5)]));
      reg57 <= wire10[(4'hb):(2'h2)];
      if ($signed(($signed(($signed(wire8) <<< wire43[(4'he):(3'h6)])) ?
          {$unsigned($signed(wire7))} : $signed(wire8[(4'ha):(4'h8)]))))
        begin
          if ((-($unsigned({(^~wire48)}) ^ wire7[(4'h9):(1'h1)])))
            begin
              reg58 <= wire9[(4'h8):(1'h0)];
              reg59 <= wire43;
              reg60 <= (reg56 ? wire11 : reg58);
              reg61 <= (^$signed((wire52[(1'h1):(1'h0)] << ($unsigned(wire12) >>> (^~wire11)))));
              reg62 <= {$unsigned($unsigned($unsigned({reg49, wire12}))),
                  {reg60, (-$unsigned(wire7[(1'h1):(1'h0)]))}};
            end
          else
            begin
              reg58 <= $signed(reg56[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg58 <= $unsigned((reg62 >>> ($signed((wire51 >>> wire9)) & reg45)));
          if (reg59[(3'h5):(1'h1)])
            begin
              reg59 <= $unsigned(wire12[(2'h2):(1'h0)]);
              reg60 <= $signed($unsigned($unsigned($signed((^~wire53)))));
            end
          else
            begin
              reg59 <= (&$unsigned($unsigned($signed((~wire11)))));
              reg60 <= $unsigned(reg57);
              reg61 <= (7'h40);
            end
          if ($signed((({(reg61 - wire12), (&reg60)} ?
              (-wire12[(4'hc):(4'ha)]) : ((wire43 & wire11) ?
                  $signed(reg59) : wire54)) * $signed($unsigned(wire11[(1'h1):(1'h0)])))))
            begin
              reg62 <= $unsigned((^~{{(~&(8'ha8))}, wire54}));
              reg63 <= (reg62[(4'ha):(3'h4)] ^ (~((&wire11) ?
                  reg60 : {$signed(wire52), wire8})));
            end
          else
            begin
              reg62 <= $unsigned(wire51);
              reg63 <= {$signed({$unsigned(reg59[(4'h8):(2'h2)])})};
              reg64 <= $signed((wire54[(4'h8):(2'h2)] ?
                  ((((8'ha1) ? reg56 : wire12) ? {reg57} : (^~wire47)) ?
                      $unsigned($signed((8'hbc))) : {(^~(8'hb4)),
                          $unsigned(reg59)}) : reg57));
              reg65 <= $signed($unsigned(reg49));
            end
          reg66 <= $unsigned(wire47);
        end
      if ({(reg59[(4'h8):(2'h3)] ?
              wire48 : ({$unsigned(wire51)} ?
                  (reg56[(3'h4):(1'h0)] - {(8'hba)}) : wire9[(3'h7):(3'h6)]))})
        begin
          reg67 <= (~&wire54[(2'h3):(1'h1)]);
          reg68 <= (($signed((reg56[(2'h3):(1'h1)] ?
              wire9[(1'h0):(1'h0)] : (~|(8'h9e)))) ^~ wire53) || reg65);
          if ($signed((~|wire9)))
            begin
              reg69 <= ((wire52[(4'h9):(3'h4)] << $unsigned((-{(8'hab),
                      reg68}))) ?
                  $unsigned(((!(~|reg62)) ?
                      (!(wire8 >>> wire8)) : wire7[(3'h7):(1'h0)])) : $signed(((+(wire51 ?
                          wire8 : wire47)) ?
                      $signed((^~wire9)) : {reg60[(1'h0):(1'h0)],
                          (~^wire12)})));
              reg70 <= (^(reg67[(4'h9):(3'h5)] ?
                  wire43 : $unsigned($unsigned(((8'ha4) ? reg59 : (8'hb4))))));
              reg71 <= ($unsigned(($unsigned(reg61[(3'h6):(3'h5)]) >>> reg50)) ?
                  (wire54[(3'h7):(3'h6)] ?
                      {reg59[(4'h8):(3'h4)]} : (8'hac)) : (({(reg58 ^ wire7),
                              $unsigned(reg66)} ?
                          reg45 : (((8'ha4) ?
                              wire8 : (8'hbc)) || (reg56 >>> wire11))) ?
                      (+($signed((8'hbd)) - $unsigned(reg60))) : ($unsigned(reg60[(3'h7):(1'h0)]) ?
                          ((reg62 ? reg50 : reg63) || {(8'ha8),
                              wire53}) : $signed((8'haa)))));
            end
          else
            begin
              reg69 <= ($unsigned((reg71 ~^ $unsigned($signed(reg57)))) ?
                  ((wire10[(3'h7):(1'h0)] ?
                          wire9[(1'h0):(1'h0)] : ($signed((8'h9e)) ?
                              $unsigned(wire9) : (reg59 >> reg64))) ?
                      reg49 : (wire53 <= {$signed(wire54)})) : $unsigned($signed($signed({reg56}))));
              reg70 <= $signed(wire43[(4'hb):(1'h1)]);
            end
          reg72 <= ((!{($signed(wire7) ? (&reg63) : (~&reg65)),
              ($unsigned(reg59) <<< $signed(reg62))}) - reg60[(4'h9):(1'h0)]);
          reg73 <= $signed(wire48[(1'h0):(1'h0)]);
        end
      else
        begin
          reg67 <= $signed(($signed(reg70[(3'h4):(3'h4)]) & $signed((reg56[(1'h0):(1'h0)] < (reg49 ?
              wire53 : reg68)))));
          reg68 <= $unsigned($signed($unsigned(reg70[(3'h4):(2'h3)])));
        end
    end
  always
    @(posedge clk) begin
      reg74 <= reg61[(4'hb):(3'h7)];
      reg75 <= (~&(reg65 ? reg49 : $unsigned((~^(reg67 ? wire10 : reg72)))));
    end
  always
    @(posedge clk) begin
      reg76 <= {wire43};
      reg77 <= ({(reg64[(2'h2):(1'h1)] ?
                  (wire7 ?
                      $signed((8'h9d)) : $signed((8'hac))) : ($signed(wire8) ?
                      $signed(reg45) : (|reg59)))} ?
          (((-(wire48 ? reg74 : reg72)) ?
              (!(reg58 << (8'hb1))) : (wire7 && (reg70 ?
                  reg69 : wire54))) + (8'hb9)) : (+$unsigned($unsigned(wire52[(4'h9):(2'h2)]))));
    end
  assign wire78 = reg50[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg79 <= (reg67[(5'h13):(4'ha)] ? (!wire43[(1'h0):(1'h0)]) : reg72);
      reg80 <= (7'h43);
      reg81 <= (|{(^~$signed((!wire52))),
          $unsigned(((wire12 >> reg57) ?
              (8'ha5) : (reg77 ? (8'h9f) : (8'hbc))))});
    end
  module82 #() modinst117 (wire116, clk, reg49, reg68, wire11, reg63);
  assign wire118 = (&(~^(~|(((8'ha9) ?
                       reg76 : wire9) + reg58[(4'h9):(4'h8)]))));
  assign wire119 = reg49;
endmodule

module module82
#(parameter param114 = {{(((&(8'hbc)) ? ((8'ha6) >>> (8'ha7)) : {(8'hbd), (8'h9d)}) << ({(8'h9f)} ? ((8'hb8) & (8'ha1)) : ((8'ha8) ? (8'ha0) : (8'had)))), ((((8'had) >> (8'ha3)) ? (~^(8'h9f)) : {(8'h9e)}) || {((8'hb3) ? (8'had) : (8'ha1)), ((8'hbe) ? (8'ha8) : (8'ha2))})}, (((((7'h42) ? (8'hba) : (8'ha0)) < ((8'ha4) ? (8'had) : (8'ha2))) || (8'hba)) ? ((((8'hb8) != (8'h9c)) + ((8'ha5) ? (8'h9f) : (8'hb2))) ? ({(7'h42), (8'hb9)} ? ((8'had) ? (8'ha2) : (8'hb4)) : ((8'hb9) ? (8'haf) : (7'h43))) : {((7'h42) ? (7'h40) : (8'hb0)), {(8'ha1), (8'hb2)}}) : {{((8'h9f) - (8'ha1))}, (((8'ha3) ? (8'hb0) : (8'ha0)) <<< ((8'hba) ? (7'h43) : (8'hb0)))})}, 
parameter param115 = {(((^~(8'ha2)) ? ((param114 ? param114 : (8'ha4)) ? param114 : (|param114)) : {(param114 ? param114 : param114), ((8'haf) ? param114 : param114)}) ? param114 : ({{(8'hac)}, param114} == param114))})
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire86;
  input wire [(4'hb):(1'h0)] wire85;
  input wire signed [(4'hf):(1'h0)] wire84;
  input wire signed [(5'h14):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(4'h9):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  wire signed [(5'h10):(1'h0)] wire106;
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  assign y = {wire113,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg112,
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
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed((wire86 - wire84[(1'h1):(1'h0)]))))
        begin
          reg87 <= (^$unsigned($unsigned(wire85)));
          reg88 <= $unsigned(wire83);
          reg89 <= {$unsigned($signed(wire83[(4'he):(4'hc)])), (8'hb8)};
          reg90 <= $unsigned((~^({$unsigned(reg89),
              (wire85 | (7'h41))} ~^ (|(~^reg87)))));
          reg91 <= $signed($unsigned(($unsigned(reg90) ^ reg90)));
        end
      else
        begin
          reg87 <= $unsigned(($unsigned($signed(((8'ha6) ?
              reg87 : reg89))) > $unsigned((+((8'ha5) >= reg87)))));
          reg88 <= reg89;
        end
      reg92 <= ($unsigned({((wire85 <<< reg90) ?
              (reg88 ?
                  wire85 : reg90) : $unsigned(reg90))}) | $unsigned($signed($unsigned($unsigned((8'ha3))))));
      if ($unsigned(((8'hae) ^~ $unsigned((^(wire85 ? (8'hb1) : reg87))))))
        begin
          reg93 <= {reg89,
              ($signed(reg91) ?
                  $signed((~(^~wire86))) : (~^reg87[(4'hf):(4'hb)]))};
        end
      else
        begin
          reg93 <= {(!$unsigned(reg91[(2'h2):(1'h1)]))};
          reg94 <= ($unsigned(wire85) != reg93[(4'h8):(3'h4)]);
          if ($signed((8'ha8)))
            begin
              reg95 <= wire86;
              reg96 <= (((~$unsigned((reg90 ? wire86 : wire83))) ?
                      reg90[(2'h3):(2'h2)] : ($unsigned((reg93 ~^ reg92)) ?
                          (^wire84) : $unsigned($unsigned(wire83)))) ?
                  reg93 : reg90);
              reg97 <= (+((8'hbc) ?
                  $signed((~reg92)) : (($unsigned(reg89) ?
                          $signed(reg87) : reg94[(1'h0):(1'h0)]) ?
                      {$signed(reg92)} : reg95)));
            end
          else
            begin
              reg95 <= (~(~^$signed((!(|reg95)))));
              reg96 <= $signed(reg96);
              reg97 <= $signed(((-((wire83 != reg95) ?
                  $unsigned(reg94) : $unsigned(wire84))) & (^~reg89[(2'h2):(2'h2)])));
              reg98 <= reg94;
            end
          reg99 <= (reg95 >>> ($signed($signed(wire83[(5'h11):(4'hc)])) == $unsigned(reg93[(3'h7):(2'h2)])));
          if (wire83[(4'he):(4'hd)])
            begin
              reg100 <= ({reg91[(2'h3):(1'h0)]} ?
                  wire85 : (($signed(wire83) ?
                          $signed(((8'hb2) ?
                              reg89 : reg88)) : $signed((^wire84))) ?
                      $unsigned(((reg92 >> reg92) ?
                          reg89[(3'h7):(3'h4)] : (&reg96))) : (reg91 ?
                          {$signed(reg88), {wire86, reg88}} : {(reg98 ?
                                  reg90 : reg91),
                              (&reg91)})));
              reg101 <= $unsigned(reg100[(3'h6):(2'h2)]);
              reg102 <= $unsigned(($signed((-(reg91 == reg95))) <<< (({(7'h42)} + (&reg87)) ?
                  ((reg90 <<< wire85) ?
                      ((8'h9d) + reg89) : reg89[(3'h4):(3'h4)]) : {(reg90 ^~ reg98)})));
              reg103 <= $unsigned(((reg96 * (((8'hb5) ?
                  (8'hbc) : reg96) & (reg94 ?
                  reg88 : reg95))) <<< ({((8'hb7) <<< reg94),
                      $unsigned(reg102)} ?
                  {(reg100 ? reg87 : wire84), ((8'h9c) - reg99)} : ((reg94 ?
                          reg102 : reg92) ?
                      (~^(8'hbb)) : (-wire86)))));
              reg104 <= ($unsigned((~^(&((8'hb7) ?
                  reg100 : reg95)))) <= (8'ha9));
            end
          else
            begin
              reg100 <= reg100[(3'h4):(1'h1)];
              reg101 <= reg90[(4'h8):(3'h7)];
              reg102 <= reg103[(3'h7):(3'h4)];
              reg103 <= ($unsigned($signed($unsigned((!reg89)))) ?
                  reg102 : {$unsigned(((reg90 ? (8'hab) : reg99) ^ (~reg99)))});
            end
        end
      reg105 <= (~^reg89[(2'h2):(1'h0)]);
    end
  assign wire106 = (|($signed({$unsigned(reg102),
                       $unsigned(reg100)}) ^~ ({(+wire83), wire84} ?
                       wire84 : reg88)));
  assign wire107 = $signed($signed(reg92));
  assign wire108 = (wire85 ? (reg97 >>> (~&{wire84[(1'h1):(1'h0)]})) : wire86);
  assign wire109 = (~&((^~(^~(-(8'hac)))) ?
                       $signed(($signed(reg91) && $signed(reg98))) : reg104[(5'h14):(5'h10)]));
  assign wire110 = (~&wire86[(2'h3):(2'h2)]);
  assign wire111 = (wire106[(2'h3):(1'h0)] & wire85[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg112 <= {$unsigned((^~$unsigned((reg104 ^~ reg98)))),
          (($unsigned($signed((8'hb7))) ?
                  (reg102 | (|(8'haf))) : ({wire83} ?
                      (~|wire109) : wire110[(2'h2):(2'h2)])) ?
              wire111[(2'h3):(2'h3)] : (wire85 >>> wire110))};
    end
  assign wire113 = $unsigned((~|wire109[(3'h6):(1'h0)]));
endmodule

module module13
#(parameter param42 = ((((+(-(8'h9e))) == (((8'ha3) ? (8'ha5) : (8'ha3)) >= (!(8'hb3)))) > (7'h42)) == ((|((8'hbc) ? (+(8'ha2)) : {(8'ha2), (8'h9e)})) ? ((((8'ha4) ? (8'hb1) : (8'hb6)) != ((8'hb5) > (8'hb2))) && ((!(8'hba)) && (~(8'ha9)))) : (^((~&(8'ha4)) ? (^~(8'h9d)) : {(8'hbd)})))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire17;
  input wire signed [(3'h5):(1'h0)] wire16;
  input wire signed [(4'h9):(1'h0)] wire15;
  input wire [(3'h4):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire19 = wire17[(4'h9):(3'h5)];
  assign wire20 = wire18[(4'hc):(3'h6)];
  assign wire21 = $signed((~&wire19[(3'h4):(2'h2)]));
  assign wire22 = ((~|(~|(&(|wire17)))) << $unsigned(({(~|wire21),
                          ((8'h9e) < wire16)} ?
                      wire15 : (~^(~&wire16)))));
  assign wire23 = {({wire22[(3'h7):(2'h3)]} ?
                          {{$unsigned(wire16)}} : (wire17[(2'h2):(1'h0)] ?
                              $unsigned(wire16) : $signed(((8'ha8) ?
                                  wire14 : wire17))))};
  assign wire24 = ((wire23[(2'h3):(2'h3)] ?
                          $unsigned($signed((wire15 ?
                              wire20 : wire18))) : wire21) ?
                      ($unsigned(((+(8'hb9)) ?
                          $signed(wire19) : wire21[(4'h9):(3'h4)])) >>> {wire17[(1'h1):(1'h1)],
                          wire18}) : (~^$signed({(+wire21),
                          wire16[(3'h4):(3'h4)]})));
  assign wire25 = ((8'hbc) ^~ $unsigned($signed($signed(wire17))));
  assign wire26 = (&$signed($unsigned(($signed(wire25) + (wire24 >> wire18)))));
  assign wire27 = (($signed((^~(8'had))) >> wire25) ?
                      $signed($signed(wire23[(1'h0):(1'h0)])) : ((~&(wire19[(1'h0):(1'h0)] ?
                          (wire14 <<< wire22) : (|(8'hb0)))) >>> (+$signed(wire17[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg28 <= (^$unsigned(wire24));
      if (wire24[(1'h1):(1'h1)])
        begin
          reg29 <= $unsigned($signed($signed((8'ha8))));
          if ((wire26[(1'h1):(1'h1)] <<< $unsigned($signed({$unsigned((8'ha9)),
              wire18}))))
            begin
              reg30 <= wire23[(2'h3):(2'h3)];
              reg31 <= $signed($signed((~&(reg30[(4'h8):(3'h6)] || $signed(wire22)))));
              reg32 <= $signed(($unsigned($signed(wire20[(2'h2):(2'h2)])) ?
                  $signed((^~wire23[(1'h0):(1'h0)])) : wire23));
            end
          else
            begin
              reg30 <= reg29;
              reg31 <= wire18[(2'h3):(2'h2)];
              reg32 <= $signed($unsigned(wire23[(1'h0):(1'h0)]));
              reg33 <= ((wire27 ^ ((^~(wire21 >= wire27)) ^ (((8'hb7) * wire21) == wire27[(4'hb):(1'h0)]))) <= (-($signed({wire26}) + (^(wire27 && wire20)))));
              reg34 <= ($signed(wire15) ?
                  $signed(wire26[(1'h1):(1'h0)]) : wire15[(3'h5):(2'h3)]);
            end
          reg35 <= (wire18 ^ (8'hb6));
          reg36 <= (~|wire20[(4'hc):(3'h7)]);
        end
      else
        begin
          reg29 <= (|(((8'hb7) << $unsigned(wire20[(2'h2):(1'h1)])) ?
              wire15[(3'h7):(2'h2)] : (^~$unsigned(wire27[(1'h0):(1'h0)]))));
          if ((~|($signed({$signed(wire17)}) * reg34[(2'h2):(1'h1)])))
            begin
              reg30 <= reg35;
              reg31 <= $unsigned((($unsigned((reg35 + wire25)) ?
                  $signed({wire25}) : (8'hae)) || $unsigned($signed(wire22[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg30 <= (reg32 ?
                  (($unsigned((reg32 ? wire22 : wire25)) ?
                          $unsigned($unsigned(wire24)) : (((7'h44) ?
                              wire27 : reg32) == (reg28 ~^ reg33))) ?
                      $signed(reg30[(1'h1):(1'h1)]) : (($unsigned(wire21) - wire23) * wire27[(2'h2):(1'h1)])) : (~reg33));
              reg31 <= ((~$unsigned($unsigned((&reg28)))) ?
                  ((~&$signed((wire23 ?
                      (8'hb2) : reg33))) - $signed(wire21[(3'h7):(3'h7)])) : $signed($signed($signed(((8'hbc) ?
                      (8'hba) : (8'hbd))))));
              reg32 <= ({$unsigned($unsigned((~^reg34)))} > wire18[(3'h4):(2'h2)]);
              reg33 <= (|wire22[(1'h1):(1'h1)]);
              reg34 <= ((~|(wire15[(3'h6):(2'h3)] ?
                  $unsigned(((8'hb1) >>> reg31)) : $signed(wire15[(3'h5):(3'h4)]))) != reg33);
            end
          reg35 <= wire19;
          reg36 <= $signed((~&($signed($unsigned(reg36)) | (+$signed(reg31)))));
        end
      reg37 <= $unsigned(wire20[(4'hd):(2'h2)]);
    end
  assign wire38 = reg28;
  assign wire39 = {wire26[(4'h8):(1'h1)],
                      ($signed((8'hb6)) >> wire23[(3'h4):(1'h0)])};
  assign wire40 = ($signed(({$unsigned(wire15), wire18[(1'h1):(1'h0)]} ?
                          wire21[(2'h2):(1'h0)] : wire38[(2'h2):(2'h2)])) ?
                      $unsigned($unsigned(wire17)) : {wire14[(2'h2):(1'h0)],
                          $unsigned($unsigned($unsigned(wire21)))});
  assign wire41 = $unsigned((wire25[(5'h14):(5'h10)] & (|{(wire38 ?
                          (8'hb2) : (7'h41))})));
endmodule
