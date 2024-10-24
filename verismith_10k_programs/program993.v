module top
#(parameter param100 = ((({{(8'hb4)}} >= ((-(8'h9f)) ? ((8'ha3) ? (8'hba) : (8'hbb)) : ((8'hb0) | (8'haa)))) ? (|({(8'hb4)} != {(8'ha0)})) : (({(8'hb6), (8'hae)} ? (|(8'had)) : ((8'haa) < (8'hb3))) ? {(|(8'haa)), {(7'h41), (8'hbf)}} : (((8'haa) << (8'hb7)) & (+(8'hbe))))) ? (+{(((7'h44) ^~ (8'ha7)) + ((8'hbe) ? (8'hab) : (8'h9e)))}) : (~^({((8'hb0) != (7'h43)), ((8'ha0) & (8'ha4))} ? (((8'hb6) - (8'ha3)) ? ((8'h9f) ? (8'hb0) : (7'h42)) : (~(8'had))) : ({(8'hbd)} || {(7'h42), (8'hbe)})))), 
parameter param101 = (~^(^param100)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire52;
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 wire60,
                 wire54,
                 wire4,
                 wire52,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 (1'h0)};
  assign wire4 = $signed($unsigned(((wire2[(4'h9):(4'h8)] ?
                         (wire1 ? wire1 : (8'haf)) : $unsigned(wire3)) ?
                     $unsigned((!wire3)) : $signed({wire3}))));
  module5 #() modinst53 (wire52, clk, wire4, wire2, wire1, wire0, wire3);
  assign wire54 = ((~$unsigned($unsigned((wire0 - wire52)))) ?
                      (+$unsigned((|(wire4 ?
                          wire1 : wire0)))) : (~&$unsigned((!{wire1, wire3}))));
  always
    @(posedge clk) begin
      reg55 <= ((({wire4} <= wire1) ?
              $unsigned($signed((wire2 & wire3))) : $unsigned($signed($signed(wire54)))) ?
          {wire4,
              {$signed($unsigned(wire2)),
                  (^~(wire54 ? wire2 : wire1))}} : $unsigned(wire3));
      reg56 <= $unsigned($unsigned(((~&wire2) == $signed($signed(wire0)))));
      reg57 <= $signed((wire3[(4'h9):(4'h8)] ?
          (((wire2 ^ wire2) && wire54) ?
              (8'hb2) : ({wire1, reg56} ?
                  (~&wire0) : wire52)) : ((!wire52[(5'h10):(4'ha)]) ?
              reg55[(1'h0):(1'h0)] : $unsigned((~^wire4)))));
      reg58 <= (~&({$unsigned($signed(wire0))} ?
          wire52[(2'h3):(2'h2)] : ((~&(wire3 ?
              wire1 : (8'ha7))) > {$signed(wire54), wire52[(1'h1):(1'h0)]})));
      reg59 <= $unsigned($unsigned((wire0[(4'h9):(3'h4)] ?
          wire0 : ((wire2 >= reg58) ?
              reg58[(5'h10):(2'h2)] : $unsigned(reg55)))));
    end
  assign wire60 = reg56[(2'h2):(1'h0)];
  module61 #() modinst95 (wire94, clk, wire0, wire4, wire52, reg56, wire2);
  assign wire96 = $unsigned($unsigned(reg59[(2'h3):(2'h3)]));
  assign wire97 = (((|(~|reg59)) > wire3) ?
                      ($unsigned((~wire96)) ?
                          $signed(((wire60 ? reg59 : wire52) ?
                              (~|wire60) : (wire54 ?
                                  (8'hb0) : reg59))) : $unsigned(((wire3 ?
                              wire2 : (7'h43)) >>> reg59[(3'h6):(2'h3)]))) : $unsigned($unsigned((|$unsigned(reg56)))));
  assign wire98 = {wire2[(4'hb):(1'h1)], reg56[(1'h1):(1'h1)]};
  assign wire99 = wire98;
endmodule

module module61  (y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire66;
  input wire [(5'h12):(1'h0)] wire65;
  input wire signed [(3'h7):(1'h0)] wire64;
  input wire signed [(4'he):(1'h0)] wire63;
  input wire [(5'h13):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire67;
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  assign y = {wire67,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
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
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire67 = (((+wire65) - wire63) ?
                      {wire66[(3'h4):(1'h0)],
                          (8'hb5)} : $unsigned((~$unsigned((~^wire66)))));
  always
    @(posedge clk) begin
      reg68 <= (&wire65[(4'h9):(3'h6)]);
      reg69 <= ($signed($unsigned((~|reg68[(3'h4):(3'h4)]))) ?
          (((8'hb3) && (wire64 <<< $unsigned(wire66))) ?
              wire63 : $unsigned($unsigned(((7'h44) ?
                  wire64 : (8'ha3))))) : {wire63});
      reg70 <= $unsigned((~|wire66));
      reg71 <= (~|(~^$signed($unsigned(wire66))));
      if (wire64)
        begin
          reg72 <= reg68[(4'h8):(2'h3)];
          reg73 <= $unsigned((|((reg68 << (wire63 ?
              wire63 : reg69)) - $signed(wire62))));
        end
      else
        begin
          reg72 <= $signed(reg73[(4'h8):(2'h2)]);
          reg73 <= $unsigned($unsigned((reg73 < (reg71[(3'h6):(1'h1)] ?
              (&wire63) : reg68))));
          if ($unsigned(wire62))
            begin
              reg74 <= $unsigned((($unsigned(((8'hbd) ?
                  reg72 : (8'hb8))) | {(~|reg71),
                  (!wire62)}) + $unsigned(((reg69 ?
                  reg68 : reg73) <<< reg70))));
              reg75 <= $signed(reg70);
              reg76 <= ($unsigned(reg72[(4'ha):(3'h6)]) << (!(~^(^~wire67))));
              reg77 <= {wire66};
              reg78 <= ((wire65 ?
                      ({(~wire64), reg68} > (|(reg75 ?
                          wire66 : reg76))) : ((reg70 ?
                          ((8'ha7) <= reg76) : $signed(reg70)) - (wire67 ?
                          $unsigned((8'hba)) : (wire65 ? reg76 : wire65)))) ?
                  $unsigned(($unsigned((8'hb3)) ?
                      (~^$unsigned(wire66)) : ($unsigned(wire65) <<< ((8'hb8) & wire65)))) : reg77[(2'h2):(2'h2)]);
            end
          else
            begin
              reg74 <= ((~&$signed(wire65[(3'h5):(1'h1)])) ?
                  {(|reg73),
                      $signed($signed((~&wire66)))} : ((wire64[(1'h1):(1'h1)] < $signed({reg76,
                      reg68})) ^~ reg77));
              reg75 <= (-$signed((((&(7'h40)) ?
                  (reg72 ? reg69 : wire62) : (|reg75)) ^ $unsigned(reg69))));
              reg76 <= {reg70};
              reg77 <= {reg74[(4'hc):(4'hc)], (~{reg71[(4'ha):(1'h0)]})};
            end
        end
    end
  always
    @(posedge clk) begin
      reg79 <= (8'had);
      reg80 <= wire64;
      reg81 <= reg73[(4'h9):(2'h3)];
      if (reg70[(3'h4):(2'h3)])
        begin
          reg82 <= $signed((+(reg70[(5'h14):(4'hc)] ?
              wire65 : ((reg76 ? wire67 : reg73) - wire66[(3'h4):(1'h0)]))));
          reg83 <= (~&wire66);
        end
      else
        begin
          reg82 <= (&reg80[(3'h4):(1'h0)]);
          if (reg69)
            begin
              reg83 <= $unsigned(wire65);
            end
          else
            begin
              reg83 <= ({reg74[(4'he):(4'he)], $signed(wire63[(4'he):(4'ha)])} ?
                  (&wire63) : ((!(wire63[(1'h0):(1'h0)] ^~ $unsigned(reg69))) ?
                      $signed({$signed(reg82),
                          (8'hb0)}) : reg76[(3'h4):(1'h0)]));
              reg84 <= $signed((+((reg73[(4'hb):(3'h5)] ?
                      {reg71} : reg75[(4'ha):(2'h3)]) ?
                  $unsigned((reg75 <<< wire67)) : ($signed(reg79) ?
                      reg78 : reg72))));
            end
          reg85 <= (~&(8'hab));
        end
      reg86 <= $signed(((+reg78[(4'hc):(1'h0)]) ^ reg81));
    end
  always
    @(posedge clk) begin
      reg87 <= (~^{reg85});
      if (reg72)
        begin
          if ((reg84 ?
              reg77 : {(({reg80} >>> $unsigned((8'hb8))) ?
                      reg86[(5'h11):(3'h7)] : ($unsigned(reg80) ?
                          $signed(reg70) : (reg69 ? reg84 : reg73)))}))
            begin
              reg88 <= reg83;
              reg89 <= $signed((((!{reg77}) ?
                      (&reg80) : {(reg73 - reg70), $signed(wire64)}) ?
                  $signed(reg69) : ({$signed(wire64)} ?
                      reg84 : (^~$signed(reg82)))));
              reg90 <= ((&({$signed((8'hbb))} || $unsigned((reg88 ?
                  wire67 : reg85)))) ^~ reg86[(4'h9):(3'h5)]);
            end
          else
            begin
              reg88 <= (reg78 && (^~reg87[(3'h7):(2'h2)]));
              reg89 <= $signed(reg83);
            end
          reg91 <= wire67[(3'h5):(1'h0)];
          reg92 <= $signed($unsigned((($unsigned(reg76) ?
              (8'hbf) : $unsigned(reg73)) && $signed(((8'hb0) ?
              reg79 : (8'hab))))));
        end
      else
        begin
          reg88 <= $unsigned((($unsigned((|reg90)) >>> (reg69 * (reg89 - wire65))) ?
              reg71[(3'h7):(3'h5)] : wire67));
        end
      reg93 <= $signed($signed($signed(((^~wire67) && $unsigned(reg82)))));
    end
endmodule

module module5
#(parameter param50 = ({{(~((8'ha9) ~^ (8'h9d)))}} ? ((^~{((8'hb5) ? (8'hbe) : (8'ha1))}) > (((^~(8'hb8)) >= {(8'hb2)}) ? (((8'hae) ? (8'hb5) : (8'hab)) | ((8'hba) ? (8'hbb) : (8'hbe))) : (~^((8'hbd) ? (8'hb9) : (8'hbf))))) : ((~({(8'hb2)} ? (+(8'hbf)) : (^(7'h44)))) + (((&(8'h9f)) || ((8'hbc) == (8'haa))) ? (((8'ha6) >> (8'ha2)) ? {(8'hb0), (8'ha9)} : ((8'ha1) > (8'hb0))) : ((7'h40) ? ((8'had) != (8'h9f)) : (7'h42))))), 
parameter param51 = ({((&(-param50)) ? param50 : (param50 ? (param50 ? param50 : param50) : (^~param50)))} ? param50 : {(((-(8'hb9)) ? (param50 ? param50 : param50) : (^~param50)) ? {(param50 ? param50 : param50), (8'ha4)} : ((!param50) ? (param50 ^ param50) : {param50, (8'ha0)}))}))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  assign y = {wire49,
                 wire39,
                 wire37,
                 wire20,
                 wire19,
                 wire18,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg17,
                 (1'h0)};
  assign wire11 = wire9;
  assign wire12 = {(~|$signed(wire8[(5'h11):(4'h8)]))};
  assign wire13 = $unsigned($unsigned(wire10[(3'h5):(2'h2)]));
  assign wire14 = $unsigned({wire8, $signed({wire12[(4'h9):(2'h3)]})});
  assign wire15 = wire11;
  assign wire16 = wire15[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg17 <= $unsigned(wire9);
    end
  assign wire18 = wire15;
  assign wire19 = {$signed($signed(((wire16 >>> wire15) * {wire18}))),
                      (($unsigned((wire7 || wire9)) && (wire13 << (wire12 ?
                              wire15 : wire6))) ?
                          (($signed(wire14) ? wire13 : {wire12}) ?
                              wire14 : {wire9[(3'h5):(1'h1)]}) : (wire18 && (~^(~^wire6))))};
  assign wire20 = (!$signed((!((!wire7) <<< wire16[(3'h6):(3'h6)]))));
  module21 #() modinst38 (.wire24(wire16), .clk(clk), .wire25(wire15), .wire26(reg17), .wire22(wire12), .wire23(wire7), .y(wire37));
  assign wire39 = wire19[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((~^$unsigned(wire10[(4'h9):(2'h3)])))
        begin
          reg40 <= wire20;
          if (wire8)
            begin
              reg41 <= $unsigned((8'hb6));
              reg42 <= (^~($signed((+wire20[(2'h2):(1'h0)])) ?
                  $signed((+wire20)) : wire39[(3'h4):(1'h1)]));
              reg43 <= ((8'h9e) ^~ $unsigned(($unsigned(wire6) + wire6[(4'hb):(4'ha)])));
              reg44 <= (^$unsigned($unsigned((~|(wire8 & wire19)))));
            end
          else
            begin
              reg41 <= ($unsigned((8'hba)) >= $unsigned(wire9));
              reg42 <= wire39[(4'hf):(1'h1)];
              reg43 <= $signed(($signed((|(-wire6))) >> (7'h41)));
            end
          reg45 <= (((8'hbd) ?
              wire18 : ((reg41[(3'h7):(2'h3)] <<< (~&reg41)) ?
                  $unsigned(wire15[(4'h9):(3'h4)]) : ($unsigned((8'ha2)) ^ {(8'hb9)}))) >>> wire19[(1'h1):(1'h1)]);
        end
      else
        begin
          reg40 <= {(+($unsigned((~^wire39)) ?
                  reg41 : $unsigned($unsigned(wire10))))};
          reg41 <= ({reg45, (~wire13)} >> $signed(($signed((reg42 || wire20)) ?
              {wire10[(3'h5):(3'h4)],
                  reg17[(2'h2):(1'h0)]} : $signed($signed(reg41)))));
          if ((^~reg17[(5'h15):(5'h12)]))
            begin
              reg42 <= (wire7[(4'h8):(3'h4)] | (((wire19[(3'h5):(1'h0)] << $signed((8'hbc))) ?
                  $signed($signed(wire10)) : wire9) & (wire14 >= (&reg43))));
              reg43 <= {$signed((wire9[(4'he):(2'h3)] << {$signed(wire20),
                      (wire20 <<< wire12)})),
                  ((^((reg44 ? reg17 : wire20) >>> ((7'h44) ?
                          reg17 : wire14))) ?
                      wire16 : reg44)};
              reg44 <= wire12[(3'h4):(2'h3)];
              reg45 <= wire19[(3'h7):(3'h5)];
            end
          else
            begin
              reg42 <= wire19;
              reg43 <= $unsigned(wire9);
              reg44 <= reg40[(2'h2):(1'h0)];
              reg45 <= {reg43, wire6};
              reg46 <= ((($signed(wire6[(5'h10):(1'h1)]) ?
                          ({wire16} >> wire7[(1'h0):(1'h0)]) : $unsigned($signed(reg44))) ?
                      wire37[(1'h1):(1'h0)] : {(8'ha5)}) ?
                  ((|(8'hba)) ?
                      $signed((^~$unsigned(wire12))) : wire13[(4'hb):(2'h2)]) : $unsigned(wire11));
            end
        end
      reg47 <= ((($signed((+wire6)) * (wire10[(1'h0):(1'h0)] ?
              $signed(wire13) : $unsigned(wire15))) ^~ wire15) ?
          ($unsigned({$unsigned(wire9)}) <= (&wire9[(2'h3):(1'h1)])) : {(wire18 ?
                  wire15 : wire15),
              {$signed((wire19 ? reg44 : wire16)), (8'h9d)}});
      reg48 <= $unsigned(((wire18[(4'h8):(2'h2)] ^ $signed(reg43)) ?
          (8'h9d) : (~^reg41[(2'h2):(1'h0)])));
    end
  assign wire49 = $unsigned(((($unsigned(wire37) & {reg43,
                          wire37}) >= wire13[(1'h0):(1'h0)]) ?
                      $unsigned($unsigned((|reg42))) : $unsigned($unsigned((~|reg43)))));
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire26;
  input wire [(5'h11):(1'h0)] wire25;
  input wire signed [(3'h4):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire33,
                 wire32,
                 wire28,
                 wire27,
                 reg34,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire27 = wire22;
  assign wire28 = $signed($signed(wire25[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      reg29 <= ($unsigned({(wire26[(2'h3):(1'h1)] ?
              (wire22 << wire26) : wire24[(1'h0):(1'h0)])}) && $unsigned({wire23,
          $unsigned($unsigned(wire22))}));
      reg30 <= (~(7'h44));
      reg31 <= $signed((|wire28));
    end
  assign wire32 = $unsigned(wire27);
  assign wire33 = (wire26[(2'h2):(1'h0)] ?
                      (^~(wire32 << ((reg31 <= wire25) ?
                          reg29[(1'h0):(1'h0)] : wire25))) : $signed(reg30));
  always
    @(posedge clk) begin
      reg34 <= ((~^wire24) ? wire26 : $signed(wire26[(4'hb):(3'h5)]));
    end
  assign wire35 = wire23;
  assign wire36 = $unsigned((&$unsigned($unsigned(reg29))));
endmodule
