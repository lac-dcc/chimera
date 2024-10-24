module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  assign y = {wire114, wire112, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(2'h3):(1'h0)];
  assign wire5 = wire1[(3'h6):(3'h4)];
  module6 #() modinst113 (wire112, clk, wire3, wire5, wire0, wire2);
  assign wire114 = wire1;
endmodule

module module6
#(parameter param111 = (~^(((((8'h9d) ? (7'h40) : (8'hb3)) ? (~^(8'hb5)) : (-(8'hac))) * ((~(8'h9c)) != (+(8'ha3)))) ^ ((((8'hb3) ^~ (8'ha7)) ~^ {(8'hbe)}) > (8'ha2)))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire108;
  wire [(4'ha):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire85;
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire55,
                 wire23,
                 wire21,
                 wire57,
                 wire85,
                 reg106,
                 reg105,
                 reg104,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  module11 #() modinst22 (.wire15(wire7), .wire13(wire9), .clk(clk), .wire12(wire10), .y(wire21), .wire14(wire8));
  assign wire23 = ((|$signed($unsigned((wire21 ?
                      wire7 : wire10)))) != (!{$signed(wire7), (8'hb8)}));
  module24 #() modinst56 (wire55, clk, wire23, wire9, wire7, wire21, wire10);
  assign wire57 = ((8'hbe) ?
                      ((~&$signed($unsigned(wire7))) & $unsigned(wire21[(4'hc):(1'h0)])) : $signed($signed(((wire9 || (8'hb0)) != (~|wire55)))));
  module58 #() modinst86 (wire85, clk, wire21, wire23, wire7, wire8, wire57);
  assign wire87 = wire9;
  assign wire88 = wire87[(4'he):(4'hc)];
  assign wire89 = $unsigned(wire10[(2'h3):(2'h3)]);
  assign wire90 = (8'ha5);
  assign wire91 = $signed((&(($unsigned((8'hb7)) != $signed((8'ha2))) <<< {$unsigned((7'h40))})));
  always
    @(posedge clk) begin
      reg92 <= ($unsigned(wire7[(4'h9):(2'h2)]) ?
          wire8 : $unsigned(wire91[(4'ha):(4'ha)]));
      reg93 <= (!(^wire89[(4'hc):(2'h3)]));
      reg94 <= $unsigned({wire9[(3'h5):(3'h4)]});
      if ((~&{{$unsigned((wire57 < wire91))}, reg94[(2'h2):(1'h0)]}))
        begin
          reg95 <= (wire87[(4'hb):(4'h9)] ?
              ((~&(8'hae)) ?
                  {wire88[(4'hc):(3'h5)]} : reg92[(3'h6):(1'h0)]) : $unsigned((+((wire7 - wire10) ^ {wire23}))));
          reg96 <= $signed(wire9);
          reg97 <= $unsigned($signed((!wire9[(4'h8):(3'h7)])));
          reg98 <= {$unsigned($signed((((8'hb8) >= reg92) ~^ $unsigned(wire91))))};
        end
      else
        begin
          reg95 <= (+((^$unsigned({wire21, wire89})) ? wire87 : (~&(8'ha0))));
        end
    end
  assign wire99 = (({(~&(wire87 * wire23))} ?
                          (^((wire23 - reg93) ?
                              (-(8'hbf)) : wire90)) : (^$signed($unsigned(reg97)))) ?
                      ($unsigned((!$signed((8'ha9)))) | $signed(wire87)) : $unsigned({$unsigned(reg96[(2'h3):(2'h3)])}));
  assign wire100 = (reg98 >> reg97);
  assign wire101 = $signed((&reg95[(1'h0):(1'h0)]));
  assign wire102 = (|$signed($unsigned(($unsigned(wire7) != wire101[(4'h8):(4'h8)]))));
  assign wire103 = wire99[(4'hf):(3'h6)];
  always
    @(posedge clk) begin
      reg104 <= (8'hb8);
      reg105 <= $signed((wire57 ?
          ($unsigned((wire91 ? (8'ha5) : reg97)) << (reg96[(2'h2):(2'h2)] ?
              (wire101 ?
                  wire101 : reg97) : (~|wire55))) : $unsigned($unsigned(wire91[(4'hc):(3'h7)]))));
      reg106 <= $unsigned(wire102);
    end
  assign wire107 = $signed((8'hab));
  assign wire108 = $unsigned(((~|($unsigned(wire57) ?
                           $unsigned(wire101) : wire8)) ?
                       (^((wire107 ? (8'had) : wire85) ?
                           (reg97 >= wire7) : wire101)) : ((reg95[(1'h0):(1'h0)] >>> (wire88 ?
                           wire87 : wire103)) < wire10)));
  assign wire109 = $unsigned((($unsigned((!reg104)) ?
                       $signed({wire23,
                           wire85}) : $signed((reg94 <<< (8'hae)))) || (!$signed($unsigned((8'ha5))))));
  assign wire110 = ($unsigned(wire55[(2'h3):(2'h2)]) ?
                       wire9 : $unsigned($unsigned(wire88[(4'h9):(2'h2)])));
endmodule

module module58  (y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire63;
  input wire [(4'hd):(1'h0)] wire62;
  input wire signed [(3'h6):(1'h0)] wire61;
  input wire [(5'h15):(1'h0)] wire60;
  input wire [(5'h10):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(4'hb):(1'h0)] wire64;
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  assign y = {wire82,
                 wire77,
                 wire64,
                 reg84,
                 reg83,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
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
                 (1'h0)};
  assign wire64 = (~$signed({{wire61}, (&(wire60 == wire60))}));
  always
    @(posedge clk) begin
      reg65 <= $unsigned($unsigned((wire62[(2'h3):(2'h2)] & {(^~wire61)})));
      reg66 <= wire61;
      reg67 <= ($signed($signed((wire60[(5'h14):(4'hf)] ?
          wire64 : $signed(wire61)))) ^ ((~^($signed(wire64) | wire61[(2'h3):(2'h3)])) ?
          $unsigned(wire64[(4'ha):(4'h8)]) : ((-(reg66 ? wire61 : wire61)) ?
              (+wire63[(3'h6):(2'h3)]) : $signed((~^reg66)))));
      reg68 <= ({((^~$unsigned(reg65)) ?
                  $unsigned($signed(reg65)) : ((~|reg65) ?
                      $signed(wire59) : $signed((8'hbf)))),
              ({$signed(wire61), $signed(reg65)} || (-$unsigned(reg67)))} ?
          wire59[(4'h8):(1'h1)] : (($signed((reg66 ?
              reg66 : wire60)) >> reg67) <= wire64[(2'h2):(2'h2)]));
      if ((wire60 ?
          ($unsigned((&(8'haf))) || $signed(reg68)) : reg68[(1'h0):(1'h0)]))
        begin
          reg69 <= (reg68 < {reg68[(1'h1):(1'h1)]});
          reg70 <= wire63[(3'h4):(2'h3)];
          reg71 <= (~^$signed(wire62));
          reg72 <= {wire62[(4'hc):(3'h4)],
              $signed($unsigned((wire62 ? reg71[(4'h9):(4'h9)] : wire63)))};
          reg73 <= ({reg65[(3'h5):(3'h5)]} || $unsigned((^~{{(8'ha1), wire63},
              $unsigned(reg67)})));
        end
      else
        begin
          reg69 <= $unsigned(wire61[(2'h3):(1'h1)]);
          reg70 <= ((|reg67[(1'h1):(1'h1)]) ?
              (~|(((reg65 ^ wire61) ?
                      (&(8'hb8)) : ((8'hb9) ? (8'hab) : reg65)) ?
                  ($unsigned(wire61) ?
                      (reg69 ?
                          reg73 : wire61) : (~&reg71)) : (~(~&reg73)))) : (8'had));
          reg71 <= $unsigned({(^$unsigned((wire60 ~^ wire61))), reg73});
          if ((reg69[(3'h7):(3'h5)] - $unsigned(((~&{(8'hbf), (7'h42)}) ?
              {(^~wire64)} : $signed($signed(reg69))))))
            begin
              reg72 <= (wire60[(5'h11):(3'h4)] ?
                  $signed(wire62[(4'h9):(2'h3)]) : reg69);
              reg73 <= reg69[(4'h9):(3'h4)];
              reg74 <= ($signed(((wire64 ?
                  (-reg72) : $signed(reg69)) <= wire59)) | $unsigned(reg73));
              reg75 <= {($signed($signed((&reg65))) - $unsigned(reg68))};
              reg76 <= $signed((reg75 <<< (~^(~&$signed(reg74)))));
            end
          else
            begin
              reg72 <= reg67[(5'h10):(1'h0)];
              reg73 <= reg72[(4'hb):(3'h4)];
              reg74 <= $unsigned(reg72);
              reg75 <= reg70;
              reg76 <= {(!(reg68[(1'h1):(1'h0)] ?
                      $signed((|wire64)) : ((reg72 ?
                          reg74 : (8'hb5)) & {wire64})))};
            end
        end
    end
  assign wire77 = ((8'ha1) && (reg68 != $signed(reg65)));
  always
    @(posedge clk) begin
      if (((($signed((reg70 ? reg67 : (8'hb1))) ?
              ((reg73 >>> reg75) ?
                  $unsigned(reg70) : ((8'ha6) ?
                      reg73 : wire64)) : wire61[(3'h5):(3'h4)]) ?
          (+(^wire64[(3'h6):(1'h0)])) : ($unsigned((reg66 ? wire64 : wire61)) ?
              ((wire63 ?
                  wire77 : wire63) <= wire60[(4'hf):(4'h9)]) : wire59[(5'h10):(4'hd)])) | $unsigned($unsigned($unsigned(wire64)))))
        begin
          reg78 <= reg72[(4'hc):(4'ha)];
        end
      else
        begin
          if ((+{reg72, reg68}))
            begin
              reg78 <= (-(+wire60));
              reg79 <= ($unsigned((reg74[(3'h6):(1'h0)] ?
                      reg68 : {$unsigned((8'ha1))})) ?
                  wire62 : wire62[(3'h5):(1'h0)]);
              reg80 <= ((~((!(|reg71)) ? wire61 : $unsigned((!wire64)))) ?
                  $signed($signed({$unsigned(reg67)})) : ({$unsigned($unsigned((8'hb9))),
                      (!reg68)} || reg76[(4'h9):(4'h9)]));
              reg81 <= (wire64[(3'h6):(3'h6)] ?
                  (((-(^~reg67)) + ((reg74 >= reg74) ?
                      wire64 : {wire64})) >>> (8'ha6)) : $signed(((~$unsigned(reg78)) <<< (reg72 ?
                      (reg76 << wire61) : (^~reg78)))));
            end
          else
            begin
              reg78 <= {reg65, (8'hb0)};
              reg79 <= (($signed({$signed(wire59)}) ?
                  {(reg81 | $signed(wire61)),
                      wire63[(4'hd):(4'hb)]} : (($unsigned(reg75) ^ reg79) ?
                      wire62[(3'h4):(2'h2)] : $signed((reg73 | reg81)))) <<< $signed(reg73));
            end
        end
    end
  assign wire82 = reg81;
  always
    @(posedge clk) begin
      reg83 <= (~&reg71[(3'h4):(1'h1)]);
      reg84 <= {$signed($unsigned(reg67)), $signed((+reg81))};
    end
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire27;
  input wire signed [(3'h4):(1'h0)] wire26;
  input wire [(4'h9):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire30 = $unsigned((8'hb8));
  assign wire31 = ((~$signed(wire28[(1'h1):(1'h0)])) ?
                      (~^((!wire29) ?
                          {wire25[(1'h0):(1'h0)]} : wire26)) : ((~&$unsigned((~|(8'hae)))) > $signed(wire28[(2'h3):(2'h3)])));
  assign wire32 = (7'h42);
  assign wire33 = {$signed(((^(wire27 ^ wire26)) ?
                          ((8'had) ~^ wire28[(1'h1):(1'h0)]) : $signed((wire28 & wire30)))),
                      $signed((&(~^(wire25 ? wire31 : wire32))))};
  assign wire34 = wire29;
  assign wire35 = ((((-{(8'hbb), wire33}) ?
                          $signed(wire32[(3'h4):(1'h0)]) : wire26[(1'h0):(1'h0)]) ?
                      (wire27[(2'h2):(2'h2)] * $signed($unsigned(wire26))) : (($unsigned(wire27) ?
                              wire31[(1'h1):(1'h1)] : (wire28 ^ wire29)) ?
                          (~&(7'h43)) : $unsigned((-wire25)))) <<< wire34[(3'h7):(3'h7)]);
  assign wire36 = ($unsigned($signed((^$signed(wire27)))) <= ($unsigned($unsigned(wire31)) < (8'ha7)));
  assign wire37 = (wire26 == (wire25 ?
                      $unsigned(((~^wire36) || $signed(wire34))) : (((wire29 | wire25) ?
                          wire28[(2'h3):(1'h1)] : (wire25 > wire33)) ^~ ($signed(wire25) * (&(8'hb0))))));
  always
    @(posedge clk) begin
      reg38 <= (~|$signed((((wire31 ? wire27 : wire28) * (wire33 ?
              wire32 : wire34)) ?
          wire35 : ((wire25 ? wire30 : wire28) <= wire33[(4'hf):(4'hb)]))));
      if ($unsigned((8'ha1)))
        begin
          if (wire28)
            begin
              reg39 <= (wire26[(3'h4):(1'h1)] ?
                  $signed((!$unsigned((^~wire26)))) : ($signed(wire30) ?
                      (((~wire28) >= wire35[(4'he):(2'h3)]) ~^ $signed((^~wire37))) : ($signed({(8'hb7)}) ?
                          ($signed(wire28) ^~ $unsigned(wire31)) : ((wire28 ?
                              wire30 : (7'h43)) & ((8'hb7) ?
                              wire36 : wire28)))));
            end
          else
            begin
              reg39 <= wire34;
              reg40 <= wire34[(1'h1):(1'h1)];
            end
          reg41 <= wire34[(3'h7):(2'h3)];
          if (($unsigned((!$signed($signed(wire25)))) - wire27[(2'h2):(1'h1)]))
            begin
              reg42 <= (~^(|{$unsigned(reg38[(1'h1):(1'h1)]), wire31}));
              reg43 <= $signed(((~&$unsigned($unsigned((8'h9d)))) >> (~^((^~wire29) ?
                  (reg40 | reg40) : (+reg38)))));
            end
          else
            begin
              reg42 <= wire26[(2'h3):(2'h3)];
              reg43 <= ({(~^(~$unsigned(wire27)))} ^~ ({reg39,
                  {(^wire26)}} <<< (reg39 ?
                  (&(wire34 ? (8'ha0) : reg41)) : reg40)));
              reg44 <= (wire25 >> (-(~$signed(wire31))));
              reg45 <= ((|($signed(wire36[(1'h1):(1'h0)]) | ($signed(wire34) > $unsigned(wire31)))) >= (reg43[(2'h2):(1'h1)] ?
                  {((wire30 - reg40) != {wire30}),
                      (^reg39[(2'h3):(1'h1)])} : $signed((~wire27[(2'h2):(1'h0)]))));
              reg46 <= reg38;
            end
          reg47 <= wire27;
          reg48 <= wire26[(1'h1):(1'h0)];
        end
      else
        begin
          reg39 <= $signed($unsigned(reg47));
          reg40 <= $unsigned(({$signed((wire30 ^ wire34))} ?
              (!((!reg42) ?
                  $unsigned((8'h9e)) : (-wire31))) : $signed($signed($signed(reg38)))));
          reg41 <= (~^reg46[(3'h5):(1'h0)]);
        end
      reg49 <= reg47;
      if ((&({((&wire28) ?
              wire33[(1'h0):(1'h0)] : $unsigned(reg39))} <= {$unsigned((reg48 ?
              reg43 : wire30))})))
        begin
          reg50 <= {((((~|wire37) ?
                      {wire27} : (wire37 ?
                          reg40 : wire33)) <<< $signed((~^reg49))) ?
                  (~&((wire34 ?
                      wire30 : reg47) & $signed(reg42))) : ((^~wire27) ^ $unsigned((wire25 ?
                      wire30 : reg41))))};
        end
      else
        begin
          reg50 <= wire28[(3'h7):(2'h3)];
          reg51 <= (wire29[(3'h4):(2'h3)] << ((8'hb5) ?
              wire34[(2'h3):(2'h3)] : (reg50 ? (!{reg38}) : wire30)));
          reg52 <= (|{$unsigned(((^reg44) <<< {(8'hbf), wire27})), reg44});
          reg53 <= wire25;
          reg54 <= $signed(((reg46 ?
              $signed((wire34 ? (8'hbc) : reg41)) : ($signed(reg46) == (reg50 ?
                  reg39 : wire30))) | ($unsigned(wire30) == (-((8'hae) ?
              wire28 : (8'ha4))))));
        end
    end
endmodule

module module11
#(parameter param20 = {((-{((8'hbd) < (8'hb7)), {(8'h9c)}}) != {((8'hbb) ? ((8'ha5) ? (8'hb5) : (8'hb6)) : {(8'hb6)})}), (((((8'ha6) ~^ (7'h43)) ? (~(8'ha9)) : {(8'hb5), (8'hbd)}) == {{(8'ha3)}, ((8'ha3) ? (8'hb4) : (7'h41))}) == ((((8'ha8) << (8'ha1)) ? ((8'hbc) ? (8'hb9) : (8'hb8)) : (+(8'ha5))) < (~&{(8'haf), (8'h9e)})))})
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire15;
  input wire [(4'hd):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  assign y = {wire19, wire18, wire17, wire16, (1'h0)};
  assign wire16 = wire12;
  assign wire17 = $signed(wire15);
  assign wire18 = {(wire16[(3'h5):(1'h1)] ?
                          (wire15[(1'h0):(1'h0)] <= $unsigned((~wire15))) : (8'had)),
                      $signed(wire16)};
  assign wire19 = (~$unsigned(wire12[(3'h7):(3'h4)]));
endmodule
