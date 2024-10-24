module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire113;
  wire [(5'h14):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  assign y = {wire113,
                 wire111,
                 wire29,
                 wire28,
                 wire27,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (wire2[(4'h9):(3'h4)] ?
                     {wire3[(4'hf):(2'h3)]} : (wire0[(3'h6):(3'h5)] * (!($unsigned((8'ha5)) ?
                         wire0 : wire4[(3'h6):(2'h2)]))));
  assign wire6 = $unsigned($unsigned($unsigned((^~wire2))));
  assign wire7 = (wire1[(3'h6):(1'h1)] != $unsigned(((((8'haa) && wire0) ?
                         (wire0 + wire6) : $signed(wire3)) ?
                     ($unsigned(wire2) ? (8'hb5) : wire0) : ((wire5 ?
                         wire1 : wire0) <= (wire1 <<< wire3)))));
  assign wire8 = wire6;
  assign wire9 = (8'hba);
  assign wire10 = wire0[(5'h10):(2'h2)];
  assign wire11 = ((^((wire5 <<< $unsigned(wire2)) >> wire9)) ?
                      (8'h9f) : (^~($unsigned((^wire0)) && wire1[(2'h3):(1'h1)])));
  assign wire12 = wire2;
  assign wire13 = $unsigned((~^{$signed($unsigned((8'ha7))),
                      ((wire9 * wire10) < (wire5 ^ wire5))}));
  assign wire14 = (-wire10);
  assign wire15 = $signed($unsigned(wire12[(2'h2):(1'h0)]));
  assign wire16 = (~^((!wire5[(4'hd):(4'hb)]) ?
                      wire14 : ({$unsigned(wire1),
                              ((8'hb9) ? wire13 : wire11)} ?
                          wire12[(4'h9):(1'h1)] : (~$unsigned((8'hb6))))));
  always
    @(posedge clk) begin
      reg17 <= {($signed(wire1) ?
              ({(7'h42)} ?
                  wire11 : (+$unsigned(wire12))) : $signed(wire7[(1'h1):(1'h0)])),
          ((^((wire3 ? wire1 : wire7) ?
              (wire2 << wire12) : (wire16 << wire6))) ^ ($unsigned(wire16) - (~|(wire7 & (8'hb2)))))};
      reg18 <= (wire11 - ($signed({wire13, (wire16 ^~ wire14)}) ?
          wire8 : $signed(wire5[(3'h5):(3'h4)])));
      reg19 <= ((!$signed($signed({reg18, wire9}))) ?
          $unsigned((!((wire11 ^ (8'h9c)) ~^ (wire5 || (8'hb5))))) : (&($signed((~&reg18)) ?
              {$unsigned(wire8)} : wire12[(3'h6):(1'h1)])));
      if (reg19)
        begin
          reg20 <= wire16[(1'h1):(1'h1)];
          if (wire14)
            begin
              reg21 <= wire7[(2'h3):(2'h2)];
              reg22 <= reg21[(3'h6):(1'h1)];
            end
          else
            begin
              reg21 <= (+$signed((8'ha2)));
              reg22 <= {(8'ha8), $unsigned(wire6)};
              reg23 <= $signed($unsigned(wire13));
              reg24 <= $signed(wire9[(2'h2):(1'h1)]);
              reg25 <= ((({reg19} || ($unsigned(reg18) || $unsigned(wire16))) ?
                  $unsigned($signed((wire10 >> (8'hb2)))) : (-((wire1 + (8'h9c)) ?
                      (wire3 ? wire8 : (8'hb6)) : {reg19,
                          wire14}))) * (^$unsigned(wire0)));
            end
          reg26 <= $signed(reg22);
        end
      else
        begin
          reg20 <= $unsigned((-wire7[(4'ha):(2'h3)]));
          if (((+(^$signed((8'hbd)))) ?
              wire3[(3'h7):(3'h4)] : ((((wire7 <= wire4) && (~^wire12)) ?
                      wire8[(2'h3):(2'h2)] : ($unsigned(reg18) ?
                          {reg21} : wire4)) ?
                  reg19[(2'h2):(1'h1)] : (~$unsigned((8'hb0))))))
            begin
              reg21 <= $unsigned(reg26[(5'h12):(3'h6)]);
              reg22 <= reg19;
            end
          else
            begin
              reg21 <= wire16;
              reg22 <= wire9[(1'h0):(1'h0)];
            end
          reg23 <= reg26;
          if (wire13[(2'h2):(1'h1)])
            begin
              reg24 <= wire10;
              reg25 <= (-$unsigned({(reg20[(2'h3):(1'h1)] ?
                      wire1[(3'h6):(3'h6)] : $unsigned(wire1))}));
            end
          else
            begin
              reg24 <= $signed(reg21[(4'he):(4'h9)]);
            end
          reg26 <= (8'ha2);
        end
    end
  assign wire27 = (~|wire7);
  assign wire28 = (wire4[(1'h0):(1'h0)] ?
                      $unsigned(wire3[(4'hf):(1'h1)]) : reg19);
  assign wire29 = (wire5[(4'hf):(4'h9)] ~^ ($signed($signed((|wire15))) ?
                      $signed($signed($signed(wire2))) : ((~wire27) ?
                          (8'ha1) : $signed($unsigned(wire12)))));
  module30 #() modinst112 (wire111, clk, wire12, reg25, wire8, reg21);
  assign wire113 = ({wire3} ? wire8[(3'h4):(2'h3)] : {(8'ha3)});
endmodule

module module30
#(parameter param110 = (~&(((((8'h9e) ? (8'hbb) : (8'hb9)) ? ((8'hbe) == (8'hbe)) : (~(8'hb7))) && (((8'hb8) ? (8'h9e) : (7'h41)) ? ((8'h9c) ? (8'had) : (8'ha8)) : (8'hac))) * (-((8'hb9) || ((8'hbb) ^ (8'hb4)))))))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire [(4'he):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire [(4'hb):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  wire signed [(4'hd):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire signed [(2'h3):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire100;
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire66,
                 wire43,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire100,
                 reg103,
                 reg102,
                 reg42,
                 reg41,
                 reg36,
                 reg35,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg35 <= ($signed({wire31[(1'h1):(1'h1)],
          wire31[(4'ha):(1'h0)]}) == ((wire32 ?
          ($signed((8'hac)) ?
              $signed(wire32) : wire33[(4'he):(4'he)]) : (&(wire34 ^ wire31))) != $signed((^$signed((8'hb9))))));
      reg36 <= wire33;
    end
  assign wire37 = ((-wire32[(2'h3):(1'h0)]) ?
                      reg36[(4'h8):(4'h8)] : ($unsigned($unsigned({wire32})) || ($signed(wire31[(2'h3):(1'h0)]) ?
                          {(wire34 ?
                                  reg35 : wire31)} : wire32[(1'h0):(1'h0)])));
  assign wire38 = wire37;
  assign wire39 = wire32[(2'h3):(2'h2)];
  assign wire40 = ($signed(reg35) ?
                      reg35[(2'h3):(1'h0)] : (((reg35 ?
                          (wire39 ?
                              wire37 : reg36) : $signed(wire38)) >= (wire39 ?
                          wire39[(1'h1):(1'h0)] : (wire33 ?
                              (8'haf) : reg35))) && wire34));
  always
    @(posedge clk) begin
      reg41 <= (^$unsigned((((wire40 ? wire37 : reg36) ?
              $signed(reg36) : (wire31 + wire34)) ?
          (~|reg36[(4'he):(3'h5)]) : wire34)));
      reg42 <= reg36[(4'hc):(1'h1)];
    end
  assign wire43 = $signed(reg35);
  module44 #() modinst67 (wire66, clk, wire31, wire39, wire37, reg41);
  module68 #() modinst101 (.wire69(wire66), .wire71(wire38), .wire72(wire33), .y(wire100), .wire70(reg35), .clk(clk));
  always
    @(posedge clk) begin
      reg102 <= (reg36[(4'hf):(3'h4)] ?
          reg42[(1'h0):(1'h0)] : $unsigned(((^(wire31 & (8'hbe))) < (-$unsigned(wire43)))));
      reg103 <= $signed(((!(-wire39)) ?
          wire66 : (({reg36, wire66} ? (~&wire66) : $signed(wire37)) ?
              (wire33[(3'h5):(1'h0)] != wire33) : (&(wire66 ?
                  reg36 : (8'ha5))))));
    end
  assign wire104 = (wire37[(1'h0):(1'h0)] + wire37);
  assign wire105 = $unsigned(((((|reg102) ^~ $signed(reg41)) ?
                       ({reg36, reg36} ?
                           reg42[(1'h1):(1'h0)] : $unsigned(wire39)) : wire43) == $signed((8'hb2))));
  assign wire106 = {reg41[(4'hb):(4'ha)], wire39[(3'h7):(2'h2)]};
  assign wire107 = (($unsigned($signed((wire43 ^~ wire34))) << wire105[(2'h2):(1'h1)]) < (~^($unsigned(wire106) * {{wire105,
                           wire34},
                       (~|wire33)})));
  assign wire108 = wire37;
  assign wire109 = $unsigned($unsigned(wire31[(1'h1):(1'h0)]));
endmodule

module module68
#(parameter param98 = (((((~&(8'ha2)) ? (&(8'had)) : ((8'hb8) ? (8'ha7) : (7'h44))) <<< (~^(8'hb7))) ~^ ((~((8'hbe) + (8'haf))) != (((7'h41) - (8'h9f)) ~^ ((8'ha0) != (8'hac))))) >= (+{{(8'h9c)}})), 
parameter param99 = (-(((!(~|param98)) ? ((param98 == param98) ^~ ((8'hb8) ? param98 : param98)) : (((7'h42) & param98) ? (~(7'h43)) : {(7'h44)})) ? (^{(|param98), param98}) : (-{((8'ha4) ? param98 : param98)}))))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire72;
  input wire signed [(5'h15):(1'h0)] wire71;
  input wire [(3'h5):(1'h0)] wire70;
  input wire [(3'h6):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire73;
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire73,
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
                 (1'h0)};
  assign wire73 = $unsigned($unsigned(wire69));
  always
    @(posedge clk) begin
      if (wire72[(2'h2):(1'h1)])
        begin
          if ((wire71[(4'hc):(3'h7)] ?
              wire71 : $signed((!{$unsigned(wire71)}))))
            begin
              reg74 <= (wire73[(2'h3):(2'h2)] ?
                  $unsigned((~(~(~wire73)))) : wire70[(2'h3):(2'h3)]);
            end
          else
            begin
              reg74 <= $signed({(((|wire70) * (wire73 - wire70)) ?
                      ((wire70 & reg74) < wire70[(2'h2):(1'h0)]) : ((wire71 >> (7'h43)) ^~ {wire71,
                          (8'ha1)}))});
              reg75 <= ($unsigned((wire69 ?
                      ($unsigned((8'h9e)) << (wire70 ?
                          wire72 : wire72)) : ($unsigned((8'hba)) << (wire70 ~^ reg74)))) ?
                  (&{$signed((+wire71))}) : reg74[(2'h2):(2'h2)]);
              reg76 <= $signed(((~|reg75) ~^ $signed((wire73 + wire72))));
              reg77 <= wire71[(4'hd):(4'h9)];
              reg78 <= (((!(wire70 >= $unsigned(wire73))) < $unsigned($signed($signed(wire69)))) + $unsigned((reg75 ?
                  ((reg75 ? (8'ha8) : wire73) ?
                      (wire69 << wire72) : ((8'hb6) >>> wire71)) : $unsigned(reg74[(2'h2):(1'h1)]))));
            end
        end
      else
        begin
          reg74 <= ((~|{$signed(reg75)}) ?
              ($signed((!reg76[(5'h10):(2'h2)])) | (~&wire72[(3'h4):(2'h2)])) : wire69[(3'h5):(1'h0)]);
          if ((~($unsigned((reg78[(3'h7):(2'h2)] ?
                  $unsigned(reg74) : $unsigned(wire72))) ?
              $signed(((wire73 ?
                  wire72 : (8'hb9)) > (8'hb3))) : (~^(wire70[(2'h2):(1'h1)] && $unsigned(reg74))))))
            begin
              reg75 <= wire69[(2'h3):(2'h2)];
              reg76 <= $signed((8'ha1));
              reg77 <= ((7'h43) ?
                  reg74 : $unsigned(((+reg78[(4'hc):(3'h5)]) <<< reg74[(2'h2):(1'h0)])));
              reg78 <= $signed($signed($unsigned($unsigned($unsigned(reg74)))));
            end
          else
            begin
              reg75 <= ((^~($unsigned($unsigned(reg77)) ?
                  (reg75 ?
                      reg75[(4'hc):(4'hc)] : ((8'ha6) <<< (8'ha5))) : ((8'hbe) ?
                      (reg76 ?
                          (8'hb0) : reg77) : wire73[(4'hb):(3'h5)]))) >> ($signed($signed(((7'h44) ?
                      (8'hb7) : wire71))) ?
                  reg76 : ((|(~|reg75)) ?
                      wire69[(2'h3):(2'h3)] : wire73[(4'ha):(2'h3)])));
              reg76 <= wire72[(1'h0):(1'h0)];
            end
          if (((((&(reg75 ? wire69 : wire71)) ?
                      $unsigned(((8'hae) ? reg76 : reg74)) : $unsigned(reg74)) ?
                  wire73[(4'he):(3'h4)] : reg75) ?
              $signed(($unsigned($unsigned(wire69)) >= ((^~reg77) ?
                  (8'hab) : (8'h9c)))) : {({reg74, wire72[(3'h6):(3'h5)]} ?
                      ((~&wire72) * wire71) : $unsigned($unsigned(reg76)))}))
            begin
              reg79 <= wire69;
              reg80 <= ({(~^{wire71})} > (wire71 == ($signed($unsigned(reg78)) ?
                  $unsigned((^~wire71)) : (-$unsigned((8'hbf))))));
              reg81 <= wire71;
            end
          else
            begin
              reg79 <= (+(~|{((8'h9c) ? (wire72 & wire70) : $signed(wire69)),
                  $unsigned($unsigned(wire70))}));
              reg80 <= reg81;
              reg81 <= {$signed($signed(((&wire70) ? wire72 : reg79))),
                  reg76[(4'hd):(1'h1)]};
            end
        end
      if ($unsigned(reg81[(1'h0):(1'h0)]))
        begin
          reg82 <= (({reg80[(3'h4):(2'h2)]} != reg79) << {$signed(((|(7'h40)) >= $unsigned(wire70)))});
        end
      else
        begin
          if ((^~(wire70 ?
              ($unsigned(reg77) ?
                  (reg79 == $unsigned(reg82)) : $unsigned((reg77 ^ reg81))) : wire70)))
            begin
              reg82 <= $signed($unsigned((wire71 ?
                  ($unsigned(reg80) ?
                      ((8'haa) ?
                          reg75 : reg78) : (^~reg76)) : $unsigned(wire69[(3'h4):(1'h1)]))));
              reg83 <= (8'hb5);
              reg84 <= (+$unsigned((~^($unsigned(reg75) ?
                  reg77[(3'h4):(2'h2)] : reg81[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg82 <= (!(~^wire73[(4'ha):(4'h9)]));
              reg83 <= $unsigned($unsigned((reg81[(1'h0):(1'h0)] >>> reg84)));
              reg84 <= (&$signed(reg78[(3'h4):(2'h2)]));
              reg85 <= ((reg83[(3'h7):(1'h0)] ?
                  (^((8'hbb) < reg79)) : $signed({(^wire69)})) ^ ($signed($unsigned((-wire71))) & (!reg76[(5'h10):(1'h0)])));
            end
          reg86 <= reg76;
          reg87 <= wire72[(3'h4):(2'h3)];
          reg88 <= $signed((reg79 ?
              (reg85[(4'hd):(3'h6)] << (reg86[(4'hd):(4'ha)] ?
                  (wire69 ?
                      reg85 : reg83) : wire71[(5'h10):(3'h5)])) : {$unsigned(reg86[(2'h3):(2'h3)])}));
          reg89 <= (~^reg80);
        end
      reg90 <= ((^~wire69[(1'h1):(1'h0)]) ?
          ($unsigned(wire69[(2'h2):(1'h0)]) < wire73) : ({$unsigned((!reg87)),
              $unsigned((8'ha5))} << (8'ha5)));
      if ($unsigned(reg78))
        begin
          if ((($unsigned($unsigned(reg75[(4'he):(1'h1)])) + $signed($signed(reg78))) ?
              {reg78,
                  ((+$unsigned(reg90)) ?
                      ((reg89 ? wire71 : reg83) ?
                          reg75 : $unsigned(wire71)) : {(reg81 * (8'h9f)),
                          $signed(reg84)})} : $unsigned(reg82)))
            begin
              reg91 <= (reg82 >= (^~$signed((!$signed((8'hbd))))));
            end
          else
            begin
              reg91 <= reg81[(1'h0):(1'h0)];
            end
          reg92 <= (reg81 ?
              ((8'ha8) ?
                  reg83[(3'h5):(1'h0)] : reg74) : $signed($unsigned((^(~|wire70)))));
          reg93 <= reg78;
        end
      else
        begin
          reg91 <= reg82[(2'h2):(2'h2)];
        end
    end
  assign wire94 = reg83[(2'h3):(2'h3)];
  assign wire95 = {((~|(&reg92[(2'h2):(1'h0)])) ?
                          reg81 : $signed({(reg75 <= (8'ha5)),
                              wire71[(5'h15):(3'h6)]})),
                      reg74[(2'h2):(1'h1)]};
  assign wire96 = reg82[(2'h3):(1'h1)];
  assign wire97 = wire95;
endmodule

module module44
#(parameter param64 = (~|(&((+((8'hb6) >> (8'hac))) ? (((8'h9d) <<< (8'ha1)) == (~^(8'ha5))) : (((8'ha5) ? (8'ha0) : (8'haa)) == {(8'h9c)})))), 
parameter param65 = {((+param64) ? param64 : (&((param64 ? param64 : param64) ? param64 : param64))), (~((param64 ? (&param64) : (8'ha6)) ? ((^~param64) ? (param64 ? (8'hbc) : param64) : (param64 < (8'ha1))) : (&{param64, param64})))})
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire48;
  input wire [(4'hf):(1'h0)] wire47;
  input wire [(3'h5):(1'h0)] wire46;
  input wire signed [(4'hb):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire49;
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  assign y = {wire63,
                 wire51,
                 wire50,
                 wire49,
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
                 (1'h0)};
  assign wire49 = (($signed($unsigned(wire45)) ?
                          $unsigned(wire45) : (~&(~{wire48}))) ?
                      (8'ha3) : wire48);
  assign wire50 = wire48;
  assign wire51 = ({$signed($unsigned((wire45 + wire45))),
                          (~$unsigned($signed(wire47)))} ?
                      wire47 : $unsigned(($signed(wire45) ?
                          $signed((~&wire46)) : ((!wire50) && $signed(wire48)))));
  always
    @(posedge clk) begin
      reg52 <= $signed(wire51);
      if ($unsigned({(wire50[(4'hc):(4'ha)] ?
              (wire50[(4'h8):(3'h6)] | $signed(wire46)) : ($signed(wire48) ?
                  wire49 : (wire51 & wire49)))}))
        begin
          reg53 <= (^((({wire48} ?
                  $unsigned(wire51) : wire51[(1'h0):(1'h0)]) >>> wire47) ?
              ($signed($signed(reg52)) ? wire46 : wire46) : ({reg52,
                  $unsigned(wire51)} < ($signed(wire50) <= (wire46 < wire46)))));
          if ((wire46 * (&$signed($signed((~reg52))))))
            begin
              reg54 <= (~&(~&wire48));
            end
          else
            begin
              reg54 <= ((!wire46) <= $unsigned($unsigned(($unsigned(wire45) ?
                  reg53[(3'h4):(2'h3)] : reg54))));
              reg55 <= (reg53 <= ((8'h9c) ?
                  (!(wire47 ?
                      ((8'h9f) ?
                          (7'h43) : wire47) : wire47[(4'hb):(4'h8)])) : wire49[(2'h2):(1'h1)]));
              reg56 <= reg52[(3'h7):(2'h3)];
              reg57 <= (reg54[(4'ha):(3'h4)] ?
                  (+reg55) : ($unsigned(wire47) ?
                      $unsigned((-$unsigned(wire50))) : ($unsigned((reg53 > wire48)) ?
                          reg56 : (reg53[(3'h5):(3'h5)] > (wire50 == reg52)))));
            end
          reg58 <= ((wire51[(4'ha):(3'h5)] ? reg56 : wire50[(2'h3):(1'h0)]) ?
              wire47[(4'hd):(4'hc)] : wire45[(4'h9):(3'h7)]);
          reg59 <= (reg52[(2'h3):(2'h3)] * $unsigned({(+(reg54 ~^ reg55))}));
          reg60 <= (+(+({reg57} | (^(reg58 ^ reg59)))));
        end
      else
        begin
          if ((8'hb2))
            begin
              reg53 <= reg59;
              reg54 <= (&$signed(wire46));
              reg55 <= {(!reg57),
                  (wire51[(2'h3):(2'h3)] != $signed((reg58 ?
                      $signed(reg58) : (!wire48))))};
              reg56 <= reg56;
              reg57 <= {((reg52[(3'h7):(3'h6)] ?
                      {wire45} : ($unsigned((8'hbe)) ?
                          wire45[(4'h9):(3'h5)] : {reg55})) || ((reg57[(1'h1):(1'h1)] ~^ reg57) | $signed($signed(reg54)))),
                  ((~&((reg55 | reg60) ?
                      reg57[(1'h1):(1'h0)] : $unsigned(wire51))) < $unsigned($unsigned((wire51 || wire47))))};
            end
          else
            begin
              reg53 <= (|$signed({((reg60 * reg59) * wire45[(2'h2):(2'h2)]),
                  ((reg59 ? reg59 : reg53) || $signed(reg54))}));
            end
          reg58 <= {$unsigned(reg58)};
          reg59 <= reg55[(3'h6):(2'h2)];
          reg60 <= wire48;
        end
      reg61 <= $unsigned((reg54[(5'h13):(1'h1)] * $signed($signed(wire48))));
      reg62 <= ($unsigned($unsigned(($unsigned((8'h9f)) ^ reg60[(2'h2):(1'h1)]))) ^ $unsigned((~^reg60)));
    end
  assign wire63 = (+(((~&(reg59 != wire46)) ?
                      (^~(wire46 <= reg61)) : $signed($signed(reg54))) != $unsigned({{reg56},
                      {wire49, wire47}})));
endmodule
