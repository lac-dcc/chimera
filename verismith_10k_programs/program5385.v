module top
#(parameter param90 = (|((!(((8'hb5) ? (8'hb2) : (8'hae)) ? {(8'hb7)} : (&(8'ha1)))) ? (~((~^(8'ha1)) ? ((8'hb4) ? (8'hb6) : (8'hba)) : ((8'h9f) * (8'hbf)))) : ((((8'h9f) ? (8'ha2) : (8'haa)) - {(8'haa), (7'h44)}) >>> (^~((8'hb0) ? (8'h9c) : (8'ha1)))))), 
parameter param91 = (~|({param90} != (&((~&param90) ~^ param90)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire89;
  wire [(5'h11):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  assign y = {wire89,
                 wire87,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire20,
                 wire10,
                 wire9,
                 wire5,
                 wire4,
                 reg6,
                 reg7,
                 reg8,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg21,
                 reg22,
                 reg23,
                 reg29,
                 reg30,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (8'hb7);
  always
    @(posedge clk) begin
      reg6 <= wire0[(1'h1):(1'h0)];
      reg7 <= $unsigned(((wire1 >> (wire4 <= (wire5 ?
          wire2 : wire2))) ~^ (wire4 ?
          wire0 : ((wire1 ? wire0 : wire0) ?
              (wire2 >= wire1) : wire0[(1'h1):(1'h0)]))));
      reg8 <= ($unsigned(((^(wire1 && wire0)) <= wire5[(1'h1):(1'h0)])) ?
          $signed((+(^$signed(wire5)))) : (^~reg6));
    end
  assign wire9 = wire3[(3'h7):(3'h4)];
  assign wire10 = wire9[(4'ha):(3'h4)];
  always
    @(posedge clk) begin
      if (({$signed((-(wire5 + reg8)))} >= {wire1}))
        begin
          reg11 <= {wire0, $signed(wire0)};
          reg12 <= {(wire9[(3'h4):(3'h4)] == ((-(wire1 ?
                  wire10 : wire2)) == reg6[(4'h9):(2'h3)])),
              wire0};
          if (wire5)
            begin
              reg13 <= {($unsigned((~&$signed((8'hba)))) >= wire10)};
              reg14 <= $unsigned($signed($unsigned(wire0[(1'h1):(1'h0)])));
            end
          else
            begin
              reg13 <= ($signed((reg14 - wire2[(3'h5):(3'h5)])) < (wire1 ?
                  {((~&(8'hae)) ? (~|wire4) : $signed(wire1)),
                      wire9[(2'h3):(1'h0)]} : reg8[(4'ha):(3'h5)]));
            end
        end
      else
        begin
          reg11 <= (wire10 ? $unsigned(wire10) : reg12);
          if ($signed(reg13))
            begin
              reg12 <= $unsigned({wire0});
            end
          else
            begin
              reg12 <= $unsigned((^reg6[(3'h6):(2'h2)]));
              reg13 <= (wire0 & $signed($signed($unsigned((wire0 * wire5)))));
            end
          reg14 <= ($signed(wire2) ?
              $unsigned((reg12 ?
                  (~|((8'hb4) << wire2)) : ({wire5, wire0} ?
                      (8'hbb) : reg13[(1'h0):(1'h0)]))) : {$unsigned($signed(reg6[(4'hc):(1'h1)]))});
          reg15 <= wire2;
          reg16 <= wire0[(1'h0):(1'h0)];
        end
      reg17 <= (reg13 ?
          ((!(reg6[(4'h9):(4'h9)] << (reg13 ?
              reg12 : reg12))) ~^ (($unsigned(wire10) <<< $unsigned((8'haa))) >>> $unsigned((^~reg14)))) : (+wire1[(2'h2):(1'h1)]));
      reg18 <= (((reg11[(4'hb):(3'h4)] + (~^(wire9 || wire5))) - ($signed(reg13) >= $unsigned((+wire5)))) ?
          ({$signed($signed(reg17))} ?
              (~&$signed((wire4 < wire4))) : {($unsigned(wire2) == ((8'h9f) ?
                      reg8 : wire1)),
                  ($signed(reg15) ? $signed(reg8) : reg15)}) : {(8'hb4)});
      reg19 <= reg17[(1'h0):(1'h0)];
    end
  assign wire20 = {({$unsigned(reg6)} ? (8'ha1) : (8'hb7))};
  always
    @(posedge clk) begin
      reg21 <= (8'had);
      reg22 <= reg15[(1'h1):(1'h0)];
      reg23 <= (^~wire20[(1'h1):(1'h1)]);
    end
  assign wire24 = (8'ha3);
  assign wire25 = (!(&(^$signed(reg12))));
  assign wire26 = reg14[(5'h12):(2'h3)];
  assign wire27 = (!((wire1 ?
                      $unsigned((reg21 ?
                          wire0 : reg22)) : $signed((-wire9))) <= reg17));
  assign wire28 = ($unsigned({wire26, $unsigned({reg6, (8'ha6)})}) ?
                      (reg13[(1'h1):(1'h0)] >>> (wire1[(3'h5):(1'h1)] ?
                          (reg6 > wire26[(5'h10):(3'h6)]) : {$unsigned(wire26),
                              (reg21 ?
                                  wire3 : wire5)})) : $unsigned($unsigned((reg16 ?
                          (reg22 << reg23) : $signed((8'ha7))))));
  always
    @(posedge clk) begin
      reg29 <= ((7'h44) ?
          reg16 : $unsigned((({wire24} ? (^wire4) : reg18) <= (~^wire25))));
      reg30 <= reg19[(4'ha):(3'h4)];
    end
  assign wire31 = ($unsigned($unsigned(reg12)) <<< reg16);
  assign wire32 = $signed($unsigned($unsigned($signed($unsigned(reg8)))));
  assign wire33 = {($unsigned({$signed(reg14)}) ?
                          $signed($unsigned(reg13[(2'h2):(2'h2)])) : $signed($unsigned((reg6 ?
                              (8'ha4) : reg22)))),
                      $unsigned($signed($signed(wire25)))};
  assign wire34 = (reg18 - wire33);
  assign wire35 = wire4[(4'h8):(2'h3)];
  module36 #() modinst88 (wire87, clk, wire2, wire28, wire25, reg22, wire0);
  assign wire89 = $unsigned($unsigned(reg7[(5'h11):(4'hc)]));
endmodule

module module36
#(parameter param86 = (((&(((8'hbd) - (8'hbb)) != ((8'ha4) >>> (8'hae)))) == (~((|(8'ha2)) | ((8'h9f) ? (8'hac) : (8'hb5))))) + (+{{((8'hba) < (8'ha6))}})))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire41;
  input wire [(4'he):(1'h0)] wire40;
  input wire signed [(3'h5):(1'h0)] wire39;
  input wire signed [(3'h6):(1'h0)] wire38;
  input wire [(2'h3):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire38[(3'h4):(1'h0)]))
        begin
          reg42 <= (~&$unsigned((!(8'hab))));
          reg43 <= $signed((8'hae));
          if ((8'h9f))
            begin
              reg44 <= {((~^wire37) >>> {wire39[(2'h3):(2'h3)], wire38}),
                  {(wire38 != (wire37[(2'h2):(1'h0)] | wire41[(1'h0):(1'h0)]))}};
              reg45 <= $unsigned(wire41[(3'h5):(1'h1)]);
              reg46 <= $signed(wire37);
            end
          else
            begin
              reg44 <= $unsigned($signed(((((7'h41) ? wire38 : (8'hb6)) ?
                  (wire38 ? wire40 : reg45) : (8'hba)) && $unsigned({reg44}))));
              reg45 <= (+wire39[(3'h5):(2'h2)]);
              reg46 <= $unsigned(reg46);
            end
          reg47 <= reg44;
          reg48 <= {($unsigned($signed((reg45 << (8'hae)))) + (($unsigned(reg43) >= reg47[(3'h6):(1'h0)]) || ($unsigned(reg43) <= wire37[(1'h1):(1'h1)]))),
              ((+(wire37[(1'h0):(1'h0)] ?
                  $unsigned(wire37) : {(8'hbf), (8'hb4)})) << (~|wire41))};
        end
      else
        begin
          reg42 <= $signed({((~&$unsigned(wire41)) == ((wire37 ?
                      reg42 : wire38) ?
                  (reg46 ? wire41 : wire37) : reg42[(1'h1):(1'h0)])),
              (($signed((8'ha0)) <<< ((8'ha0) ? reg44 : wire39)) ?
                  $unsigned($signed(reg44)) : $unsigned((-reg44)))});
          reg43 <= $unsigned(((&($signed(reg46) > (wire38 ^ reg47))) ?
              ($signed($signed(wire41)) * wire39[(3'h5):(1'h0)]) : $unsigned(wire37[(1'h0):(1'h0)])));
          if ($unsigned(wire39))
            begin
              reg44 <= $unsigned((^~{({(8'ha0)} >>> {(8'ha6)}),
                  $signed($signed((8'ha2)))}));
            end
          else
            begin
              reg44 <= reg42;
              reg45 <= (8'h9f);
              reg46 <= (+(|((&(wire41 ?
                  (7'h41) : (8'hb5))) & (wire37[(2'h2):(1'h0)] ?
                  (-wire39) : ((7'h41) ? reg44 : wire37)))));
              reg47 <= $unsigned((^($unsigned({(8'ha3), wire39}) && ((8'h9f) ?
                  (reg44 ? (8'hb2) : wire40) : (^~wire40)))));
              reg48 <= reg43;
            end
          reg49 <= ({(^$unsigned({reg44, (8'h9e)})),
              wire41[(1'h0):(1'h0)]} >> $unsigned($unsigned($signed(wire41))));
          reg50 <= (+$unsigned(((reg43[(3'h5):(3'h5)] ^~ $unsigned(reg47)) ?
              {(wire39 + wire38)} : ({wire41} ?
                  $signed(reg48) : $signed(wire38)))));
        end
      reg51 <= reg44[(4'hf):(1'h0)];
      if ((((~$unsigned(reg48[(3'h4):(2'h2)])) + reg45[(1'h1):(1'h0)]) <= reg47[(1'h1):(1'h1)]))
        begin
          if ($unsigned($signed($unsigned(($signed(reg50) <<< (reg47 ?
              reg46 : wire40))))))
            begin
              reg52 <= $unsigned(reg47[(3'h7):(3'h5)]);
              reg53 <= reg44[(4'hc):(4'h9)];
            end
          else
            begin
              reg52 <= ((({reg48[(3'h6):(2'h2)]} ?
                  (7'h43) : reg48) <= ((8'hbc) ?
                  $unsigned($signed((8'hab))) : (reg53 ?
                      ((8'hb5) ?
                          reg42 : reg45) : reg45))) < $signed($signed(reg53)));
              reg53 <= (reg45 >= (wire37[(1'h0):(1'h0)] ?
                  reg47[(2'h3):(1'h1)] : wire41[(3'h7):(3'h6)]));
              reg54 <= $signed((wire39 ~^ {((reg52 ?
                      reg53 : reg46) < (wire40 <= wire38))}));
            end
          reg55 <= (~($unsigned((8'hb7)) + wire38));
          reg56 <= $signed(((~^$unsigned(wire39[(2'h2):(1'h1)])) - (^~$signed({reg50,
              (8'hab)}))));
          reg57 <= ((~reg55) << reg55);
        end
      else
        begin
          reg52 <= {{$unsigned(((reg56 - wire41) && ((8'h9e) <<< (8'ha2)))),
                  (reg54 ?
                      ((^~(8'haf)) <= reg45[(1'h1):(1'h0)]) : reg43[(4'hc):(4'hc)])}};
          reg53 <= (~$signed(wire37[(2'h3):(2'h2)]));
          if ((~^((reg43 ?
                  $unsigned((wire38 ?
                      wire40 : reg53)) : wire37[(1'h0):(1'h0)]) ?
              reg50 : ($unsigned((~reg53)) || (reg49 ?
                  $unsigned(reg51) : (reg54 == reg55))))))
            begin
              reg54 <= $unsigned($unsigned(reg50[(2'h2):(1'h0)]));
              reg55 <= (wire38[(1'h0):(1'h0)] ?
                  (((^~wire38[(2'h2):(2'h2)]) >> $signed(((8'ha4) ?
                          reg52 : reg57))) ?
                      (reg48 ?
                          ($unsigned(reg45) ?
                              reg43 : reg46) : (~reg54)) : (~&$unsigned($signed(reg43)))) : (reg47[(2'h2):(2'h2)] <<< $unsigned((^~wire38[(3'h6):(1'h0)]))));
              reg56 <= ((wire37 ?
                  reg44[(2'h2):(1'h0)] : reg56[(3'h7):(1'h0)]) >> reg54[(1'h1):(1'h0)]);
            end
          else
            begin
              reg54 <= (($signed($signed($unsigned(reg44))) ?
                  (&({(8'haa),
                      reg48} >>> $signed(reg44))) : ($unsigned($signed(reg51)) - (8'ha2))) - ({((reg48 ?
                              reg51 : reg48) ?
                          (-reg42) : (&reg56))} ?
                  $signed((reg45[(3'h7):(3'h7)] <= (|wire38))) : reg45[(3'h5):(3'h4)]));
              reg55 <= (((((|wire37) - reg55[(2'h3):(2'h3)]) ?
                          (8'had) : (~(8'hb4))) ?
                      reg53[(5'h14):(1'h1)] : ($unsigned($signed(reg43)) ^~ reg57[(4'hf):(3'h5)])) ?
                  ((^~(8'haf)) ?
                      wire40 : wire37[(1'h0):(1'h0)]) : reg57[(4'h8):(1'h1)]);
              reg56 <= reg55[(1'h1):(1'h0)];
              reg57 <= reg57[(4'hb):(1'h1)];
              reg58 <= ({wire39[(1'h0):(1'h0)],
                  (+$unsigned($signed(reg52)))} << $unsigned(reg52));
            end
          reg59 <= (~^{($unsigned($signed(wire41)) ?
                  {reg55} : (((8'ha3) ? wire39 : wire41) * $signed(reg47))),
              {$signed($unsigned(wire38)), reg50[(2'h2):(2'h2)]}});
          if ({reg47})
            begin
              reg60 <= $signed({reg44,
                  ((8'haf) ?
                      reg59[(4'hb):(2'h3)] : $unsigned((reg50 ?
                          reg59 : reg48)))});
              reg61 <= (&({$signed($unsigned(wire40))} == reg57));
              reg62 <= (|($signed($signed((~^(8'hbd)))) >>> wire38));
              reg63 <= ((wire38 ?
                      wire41[(4'h9):(2'h2)] : $signed(((reg42 ?
                          reg59 : reg48) > ((8'ha2) ^ (8'hb0))))) ?
                  (~reg60[(4'hb):(4'h9)]) : wire41);
              reg64 <= reg62[(2'h2):(1'h1)];
            end
          else
            begin
              reg60 <= ($unsigned(reg45[(3'h4):(1'h0)]) ?
                  ($signed((8'hba)) ?
                      ($unsigned($unsigned(reg62)) ?
                          reg53[(1'h1):(1'h1)] : reg43) : $unsigned(reg56)) : ((reg56[(4'h8):(1'h0)] ?
                      ($unsigned(wire38) ?
                          reg48 : (wire38 ?
                              reg61 : wire41)) : reg58[(1'h0):(1'h0)]) | reg56));
              reg61 <= (~|{(~|reg46[(4'ha):(3'h6)]),
                  $unsigned((|(wire37 ^ reg43)))});
            end
        end
      reg65 <= ({reg63, reg43} ?
          ((8'ha5) || (reg62 & ((~&reg49) + (reg44 ?
              (8'hb0) : reg47)))) : (~|{$signed({reg50, reg64}),
              {(reg55 == wire38)}}));
    end
  assign wire66 = reg45[(2'h2):(1'h0)];
  assign wire67 = (((8'h9d) <<< ($unsigned((wire66 ? wire39 : wire38)) ?
                          $unsigned($signed((8'ha9))) : reg45)) ?
                      $signed(((wire39[(1'h0):(1'h0)] > $signed(reg46)) ?
                          (8'ha5) : ((^reg62) >>> $unsigned(reg56)))) : ({(8'hb2),
                              reg61} ?
                          (^reg56[(3'h4):(1'h1)]) : reg64));
  assign wire68 = reg64;
  assign wire69 = {$signed(($unsigned($signed(reg42)) ?
                          $unsigned((reg50 ?
                              wire39 : reg55)) : reg60[(1'h0):(1'h0)]))};
  assign wire70 = reg45;
  assign wire71 = wire40[(4'hc):(1'h1)];
  assign wire72 = (~$unsigned(reg64));
  assign wire73 = ($unsigned($signed(wire71)) ?
                      ($unsigned(reg64[(2'h2):(1'h0)]) ^ $unsigned($signed((wire41 > (8'hb6))))) : (($unsigned((8'had)) + $unsigned($signed(reg44))) & $unsigned(((wire39 ?
                              reg48 : reg52) ?
                          $signed(wire39) : (+reg54)))));
  always
    @(posedge clk) begin
      reg74 <= $signed($signed(reg45));
    end
  always
    @(posedge clk) begin
      reg75 <= $unsigned({(~{wire70}), wire69});
    end
  always
    @(posedge clk) begin
      reg76 <= (&($unsigned((reg60 == wire66[(1'h0):(1'h0)])) >> reg47[(1'h0):(1'h0)]));
      reg77 <= reg60[(4'hb):(4'hb)];
      reg78 <= $signed((($unsigned($unsigned(wire70)) * reg43) ?
          {((reg76 ?
                  (8'hb5) : wire37) ~^ $signed(reg63))} : reg53[(3'h5):(1'h1)]));
      reg79 <= $unsigned(reg63);
    end
  assign wire80 = reg62;
  assign wire81 = (reg52[(4'h9):(4'h8)] ?
                      (^~(^~$unsigned((~&reg43)))) : $unsigned(reg65));
  assign wire82 = $unsigned(wire71[(3'h4):(1'h1)]);
  assign wire83 = $unsigned(({(8'ha5), (!$unsigned(reg78))} ?
                      ((~^reg79[(2'h2):(2'h2)]) ?
                          (((8'hba) ? (8'h9f) : reg50) ?
                              $signed(reg55) : $signed(wire37)) : $unsigned(reg78[(4'he):(4'h9)])) : wire67[(4'h8):(2'h3)]));
  assign wire84 = $unsigned($signed((8'h9e)));
  assign wire85 = $signed($unsigned(($signed(reg74[(3'h7):(3'h5)]) ?
                      reg76[(4'h8):(3'h4)] : ((~^reg76) > (wire72 && wire73)))));
endmodule
