module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire140;
  wire [(4'hd):(1'h0)] wire138;
  wire [(5'h10):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire58;
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  assign y = {wire140,
                 wire138,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire58,
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
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 (1'h0)};
  assign wire5 = $unsigned((wire2 <<< wire4));
  assign wire6 = wire0;
  assign wire7 = $unsigned(((~^$unsigned($signed(wire1))) || wire5));
  assign wire8 = wire6[(1'h0):(1'h0)];
  assign wire9 = wire8;
  module10 #() modinst59 (wire58, clk, wire6, wire2, wire0, wire4, wire8);
  always
    @(posedge clk) begin
      if (wire3[(3'h6):(3'h6)])
        begin
          reg60 <= wire6;
          reg61 <= wire58;
          reg62 <= (wire6[(3'h5):(2'h2)] < wire8);
        end
      else
        begin
          reg60 <= $unsigned(reg60[(3'h4):(3'h4)]);
          if (reg60[(4'h8):(4'h8)])
            begin
              reg61 <= wire5[(1'h0):(1'h0)];
              reg62 <= wire8[(4'h9):(3'h5)];
              reg63 <= reg60;
              reg64 <= (|((($signed((8'hbc)) & wire1[(2'h2):(1'h1)]) ?
                      reg62 : $unsigned((8'h9c))) ?
                  $signed((~^((8'hab) ^~ reg62))) : (((^~wire8) || $unsigned((8'ha1))) == wire1)));
            end
          else
            begin
              reg61 <= $signed((~&wire7[(2'h2):(2'h2)]));
              reg62 <= wire1;
              reg63 <= (~^reg61[(4'he):(4'hd)]);
            end
          if ((wire58[(4'h8):(3'h4)] ?
              (wire9 ?
                  (|((wire0 + reg62) ?
                      $signed(wire7) : $unsigned((8'hb6)))) : (($signed(wire5) >> {reg63}) >= ((^~wire4) * (wire9 ?
                      wire3 : reg60)))) : wire8[(3'h6):(2'h2)]))
            begin
              reg65 <= ((((+((8'hb2) ~^ (8'hb7))) ?
                      $unsigned(wire6[(1'h0):(1'h0)]) : wire4) <<< $signed($signed((reg61 ?
                      wire58 : wire3)))) ?
                  $unsigned(wire0[(4'hc):(4'h9)]) : $unsigned(reg62));
              reg66 <= $signed((!wire0[(4'h8):(2'h2)]));
              reg67 <= reg60;
              reg68 <= ({wire58[(3'h6):(2'h3)]} ?
                  $unsigned((wire3 | ({(8'hb3),
                      reg61} * $signed(wire8)))) : $unsigned(((reg63 << reg66[(2'h2):(1'h0)]) ?
                      ($signed(wire5) ?
                          ((8'ha3) ?
                              reg63 : wire7) : $signed(reg67)) : reg62)));
              reg69 <= reg61;
            end
          else
            begin
              reg65 <= reg64;
              reg66 <= reg69[(3'h6):(3'h4)];
              reg67 <= wire5[(5'h10):(1'h1)];
              reg68 <= wire7;
            end
          if ({$signed($signed({{wire8, wire8}}))})
            begin
              reg70 <= ((|({(reg61 ? (8'hb4) : reg66)} ?
                      wire6[(1'h1):(1'h0)] : $unsigned($signed(wire0)))) ?
                  $signed(wire7) : ({$unsigned(reg69)} ?
                      {(~^(8'hb5)),
                          $unsigned({wire58})} : $signed(wire5[(3'h5):(1'h1)])));
              reg71 <= reg60[(2'h3):(2'h2)];
            end
          else
            begin
              reg70 <= (8'hb8);
            end
        end
      if ($signed($unsigned(wire5)))
        begin
          reg72 <= $unsigned({(($signed(wire7) >>> {reg64, reg67}) ?
                  reg63 : reg67[(1'h1):(1'h0)])});
          if ($unsigned((wire58 << reg71)))
            begin
              reg73 <= {(reg65[(2'h2):(2'h2)] && (wire6[(1'h0):(1'h0)] ?
                      $unsigned($signed(reg65)) : (reg62[(1'h0):(1'h0)] ?
                          wire9 : (8'ha4))))};
              reg74 <= $signed($unsigned((((^wire6) ?
                      reg65[(1'h1):(1'h1)] : $signed(reg73)) ?
                  (wire0[(4'he):(1'h0)] ^~ reg67) : (~^$signed(wire6)))));
              reg75 <= {$unsigned((wire9 ? wire3 : $signed(wire0)))};
              reg76 <= $unsigned(reg66[(4'he):(1'h0)]);
            end
          else
            begin
              reg73 <= ((8'had) || $unsigned(reg68[(3'h4):(2'h2)]));
              reg74 <= (-(8'haf));
              reg75 <= ($unsigned(wire1[(2'h3):(2'h3)]) >>> (reg73 ?
                  (8'hb9) : $signed($unsigned($unsigned(wire7)))));
              reg76 <= reg61[(3'h6):(3'h6)];
              reg77 <= {reg70};
            end
          reg78 <= $unsigned($unsigned(reg72[(1'h0):(1'h0)]));
          reg79 <= $unsigned((+(~reg70)));
        end
      else
        begin
          reg72 <= (((~&($signed((8'hb7)) < {(8'hb8),
              reg64})) - ((^(reg76 || (8'ha5))) ?
              wire4[(4'h9):(2'h3)] : (reg68 ?
                  $signed((8'haa)) : (reg76 ?
                      reg68 : reg75)))) & $unsigned((&reg79)));
          reg73 <= (((reg78[(5'h11):(4'hc)] + $signed($signed(reg78))) ?
              ($signed(wire4) ?
                  ((^~reg79) ?
                      reg79[(4'hc):(4'ha)] : $unsigned(reg66)) : reg66) : reg77[(5'h13):(4'hd)]) < reg63);
          reg74 <= wire8;
          reg75 <= ({($unsigned(reg67[(3'h6):(2'h2)]) << (8'h9e)),
                  reg60[(4'ha):(4'h8)]} ?
              (((~&{reg75}) ?
                  ($unsigned(wire4) ^~ (^wire6)) : $unsigned((reg70 * reg77))) >= $signed(wire58)) : (reg73[(4'h9):(4'h8)] ?
                  $unsigned(reg77) : $signed(wire2[(4'hc):(4'hc)])));
        end
      reg80 <= {$unsigned($unsigned((wire1 == $signed((8'ha2))))),
          {$unsigned((&wire58[(4'hc):(4'h8)])),
              ((+(|reg77)) + $signed(wire0))}};
      if (($unsigned(reg68[(1'h1):(1'h0)]) >>> wire3))
        begin
          reg81 <= (((reg74 <= reg80[(2'h2):(1'h1)]) ?
              $unsigned(reg67) : wire6[(3'h5):(1'h1)]) != wire1[(1'h0):(1'h0)]);
          reg82 <= ($signed(($unsigned((reg80 ? reg60 : wire58)) && (^(reg80 ?
              (8'ha1) : wire6)))) >>> ({(reg72[(4'h8):(2'h2)] >= reg62[(4'h8):(1'h0)]),
              ({reg64} ?
                  (reg60 ?
                      reg69 : wire3) : $unsigned((8'ha1)))} <<< (wire0 || (^reg73))));
          reg83 <= $unsigned((($signed(reg81) >= (~&(reg64 <<< (7'h43)))) ?
              reg81[(4'h9):(3'h6)] : $unsigned(($unsigned((8'h9d)) ?
                  reg62 : reg69[(1'h0):(1'h0)]))));
          reg84 <= $unsigned(reg64);
          reg85 <= (~((^~(|wire2)) ?
              (((reg61 ^ wire8) ? $unsigned(reg73) : (wire9 && reg71)) ?
                  (|{reg76}) : ($signed((7'h43)) <<< reg76[(2'h2):(1'h0)])) : reg70[(4'hc):(4'h8)]));
        end
      else
        begin
          reg81 <= wire6[(1'h0):(1'h0)];
          reg82 <= reg68[(3'h5):(2'h2)];
          if ({(($unsigned({reg63}) ?
                  {(8'ha8)} : $unsigned(wire9)) && {reg72[(4'hf):(4'hc)],
                  $unsigned($unsigned(reg84))}),
              reg83[(4'h8):(3'h7)]})
            begin
              reg83 <= {(!(reg83[(3'h6):(1'h1)] ?
                      {(reg74 ? (8'hb5) : reg75)} : (~|wire0[(4'hc):(3'h5)])))};
              reg84 <= ((~&$unsigned($signed($unsigned(wire58)))) & (-(^$signed(reg72[(3'h5):(3'h5)]))));
              reg85 <= $signed({($signed($unsigned((8'hbf))) && ((+wire8) && $unsigned(reg75)))});
              reg86 <= ($signed($signed((8'hbc))) == reg75);
              reg87 <= $unsigned($unsigned($unsigned((&{(7'h42)}))));
            end
          else
            begin
              reg83 <= {$signed(wire6), wire1[(1'h1):(1'h1)]};
              reg84 <= reg82[(3'h4):(3'h4)];
            end
        end
    end
  module88 #() modinst139 (.clk(clk), .wire91(reg70), .wire90(reg83), .wire89(reg86), .y(wire138), .wire93(reg80), .wire92(reg67));
  assign wire140 = (reg79[(4'ha):(4'ha)] ? reg84[(1'h0):(1'h0)] : reg71);
endmodule

module module88
#(parameter param136 = (((~(((8'ha1) ? (8'hbf) : (8'haf)) ? {(8'hb6)} : ((8'ha9) ? (8'hb5) : (8'h9f)))) ? {(-{(8'ha5), (8'ha7)}), (((8'ha7) ? (8'ha0) : (8'hbd)) ? ((7'h44) ? (8'hb3) : (8'hae)) : ((8'hab) ? (8'hb7) : (8'hb8)))} : (&(!(~&(7'h44))))) >>> (((((8'hb2) * (8'ha9)) ? ((8'ha2) ? (8'hb3) : (8'h9e)) : ((8'hb7) - (8'hb8))) ? (((8'h9f) || (8'h9d)) & ((8'hbc) & (7'h43))) : ({(8'ha9)} >> (&(8'hb6)))) ? {{{(8'hb2), (8'hb0)}, ((8'ha4) | (8'ha8))}} : ((((8'hbc) ? (8'hba) : (8'hac)) != (~(8'h9f))) ? ((~&(8'hb9)) ? ((8'hb4) + (8'had)) : ((8'hb8) >>> (8'hbe))) : ((!(8'ha9)) ? ((8'hbb) ? (8'hb8) : (8'ha0)) : (-(7'h43)))))), 
parameter param137 = param136)
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire93;
  input wire signed [(3'h5):(1'h0)] wire92;
  input wire signed [(4'hc):(1'h0)] wire91;
  input wire signed [(4'hb):(1'h0)] wire90;
  input wire [(3'h7):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire135;
  wire [(5'h11):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire132;
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire132,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire89)
        begin
          reg94 <= $signed((($unsigned((+wire90)) ?
                  wire93 : $signed(wire89[(2'h3):(2'h3)])) ?
              (((+wire91) && (&wire90)) - (~(wire92 ?
                  wire91 : wire91))) : ($signed($unsigned(wire89)) ?
                  {(~^wire93), wire90[(3'h5):(3'h5)]} : (^wire92))));
          reg95 <= $unsigned((wire92 >> wire91));
          reg96 <= (~|(-{{((8'hb8) > (7'h42)), {reg94}}}));
          reg97 <= ({$unsigned({(8'hae)}), reg94[(1'h0):(1'h0)]} ?
              $signed({($signed(wire93) + reg96[(3'h5):(2'h3)])}) : (~&(&(((8'ha4) ?
                  reg96 : wire89) <<< wire90[(3'h6):(1'h1)]))));
        end
      else
        begin
          reg94 <= ($unsigned($unsigned($unsigned((wire91 >= (8'hb7))))) > $unsigned(reg95[(1'h1):(1'h0)]));
        end
      reg98 <= $signed(($signed((~{wire92, reg94})) ?
          (-$unsigned((wire92 ? reg95 : wire92))) : wire93));
      reg99 <= $signed($signed(reg97[(2'h2):(2'h2)]));
      reg100 <= $unsigned(reg98[(1'h1):(1'h1)]);
    end
  module101 #() modinst133 (wire132, clk, reg96, wire93, reg99, wire91);
  assign wire134 = wire132;
  assign wire135 = ((8'ha0) > $unsigned((((wire90 ? (8'haf) : wire90) ?
                       (reg95 ?
                           reg99 : wire93) : $signed(reg100)) >= reg95[(4'hd):(4'h8)])));
endmodule

module module10
#(parameter param56 = (~{({((8'ha4) ? (8'hae) : (8'hbf))} ? (~^(~&(8'hbb))) : (((8'hbb) ? (8'hbf) : (8'hbd)) <= (8'hbc)))}), 
parameter param57 = (~param56))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire [(4'hb):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire51;
  assign y = {wire55, wire54, wire53, wire16, wire51, (1'h0)};
  assign wire16 = (wire11 ?
                      (~|$unsigned($signed(wire13))) : wire11[(1'h1):(1'h1)]);
  module17 #() modinst52 (wire51, clk, wire11, wire16, wire15, wire12, wire14);
  assign wire53 = {$unsigned(((!((8'hb7) << wire15)) ?
                          $unsigned((^~wire16)) : (&wire11)))};
  assign wire54 = wire13[(2'h3):(1'h0)];
  assign wire55 = (^({wire12[(1'h0):(1'h0)], (~$unsigned(wire11))} ?
                      wire15[(2'h2):(2'h2)] : ((~|(wire11 ?
                          wire14 : wire51)) < ($unsigned(wire54) ?
                          $signed(wire14) : wire13[(3'h5):(1'h0)]))));
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire22;
  input wire [(2'h3):(1'h0)] wire21;
  input wire [(3'h6):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire23;
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire23,
                 reg42,
                 reg41,
                 reg40,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = ($signed(wire19) << wire21);
  always
    @(posedge clk) begin
      reg24 <= (((wire22[(3'h5):(2'h2)] ^ $unsigned((~&wire22))) + (wire18 ?
          {wire23[(2'h3):(1'h1)]} : $unsigned((wire19 + wire22)))) == wire22);
      if ((($unsigned(((wire22 ~^ (8'hb4)) != (!wire19))) + (wire23 ?
          $unsigned((wire23 > wire18)) : (~|wire22))) & ({wire23, wire21} ?
          {(((8'haf) - wire20) >= $signed(reg24)),
              (wire22 ? wire20 : $unsigned(wire20))} : (({wire22,
                  wire18} > {wire19}) ?
              wire19[(1'h0):(1'h0)] : $unsigned((wire21 + wire18))))))
        begin
          reg25 <= $signed((wire20[(1'h1):(1'h1)] ?
              (~$unsigned((7'h41))) : ((8'hab) ?
                  ((wire20 != wire21) << {wire22}) : {(reg24 ~^ wire22)})));
          if ({((7'h44) ?
                  $signed((wire21[(2'h2):(1'h0)] ?
                      wire21[(1'h0):(1'h0)] : ((8'hb6) ?
                          wire21 : wire23))) : $signed(reg25)),
              (^~$signed($signed(wire18[(1'h0):(1'h0)])))})
            begin
              reg26 <= (7'h43);
              reg27 <= {wire18[(3'h5):(2'h2)], {(|$signed(wire21))}};
            end
          else
            begin
              reg26 <= (|wire22[(3'h6):(3'h6)]);
              reg27 <= (wire18 >>> $signed(($unsigned($unsigned(reg24)) || reg24)));
            end
        end
      else
        begin
          reg25 <= (wire20 ?
              (~^reg25[(5'h12):(4'ha)]) : $signed(reg25[(3'h4):(2'h2)]));
          reg26 <= (|((^reg26) ?
              (wire19 ?
                  (|(reg26 ? reg25 : (8'hba))) : ((wire21 < reg24) >>> (reg27 ?
                      wire18 : reg26))) : reg24));
          if ((8'hbf))
            begin
              reg27 <= wire22[(3'h6):(2'h3)];
              reg28 <= wire18[(3'h7):(3'h6)];
              reg29 <= reg28;
              reg30 <= reg28[(3'h5):(3'h4)];
              reg31 <= reg25;
            end
          else
            begin
              reg27 <= (wire18 ? wire18[(3'h5):(2'h3)] : wire23[(2'h2):(1'h0)]);
              reg28 <= wire23;
              reg29 <= wire21;
            end
          reg32 <= (reg27 + (~&((wire22[(2'h3):(2'h3)] ?
              (wire20 << wire20) : $unsigned(wire18)) <= ((~&reg27) <<< wire20[(3'h6):(3'h5)]))));
        end
    end
  assign wire33 = $unsigned(reg32);
  assign wire34 = $unsigned(reg25);
  assign wire35 = ({((-(wire21 ? wire23 : wire34)) ?
                          (~{wire23,
                              (7'h44)}) : reg24)} != (reg32[(4'h9):(3'h6)] < {reg26[(2'h2):(1'h1)]}));
  assign wire36 = reg29[(4'hf):(1'h0)];
  assign wire37 = wire36[(2'h3):(2'h3)];
  assign wire38 = {($signed($signed(reg27[(3'h4):(2'h3)])) > $signed($signed((reg32 < (8'ha6))))),
                      ($unsigned((reg27[(1'h1):(1'h1)] ?
                          (^wire20) : {reg29, reg25})) > (reg32 << ({wire21,
                              reg26} ?
                          reg24 : (reg29 >>> wire36))))};
  assign wire39 = wire33[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg40 <= {{$signed(wire39)}};
      reg41 <= {({((!reg31) * (^~reg31))} ?
              wire37[(2'h3):(1'h1)] : $signed({((8'hba) + wire20)})),
          (wire18 ?
              (~|((-wire35) != wire20[(3'h4):(2'h3)])) : $unsigned(wire21[(1'h1):(1'h0)]))};
      reg42 <= (!$signed(($signed((reg25 | (7'h43))) ?
          $unsigned($signed(reg25)) : (8'ha2))));
    end
  assign wire43 = (|((+((reg26 ?
                      reg25 : wire19) && $signed(wire37))) << $unsigned((wire39 ?
                      (&wire18) : (!reg24)))));
  assign wire44 = ((wire19 <= $unsigned(wire18)) ?
                      reg41 : ((((-reg42) ?
                          (-wire36) : {reg27}) & reg41) | {reg31}));
  assign wire45 = wire38;
  assign wire46 = {(8'ha1),
                      (~^{((!reg41) ? $signed(reg31) : (wire33 <<< reg25))})};
  assign wire47 = (|(|(^~{$unsigned((7'h42)), (reg42 ? reg24 : wire19)})));
  assign wire48 = {wire19};
  assign wire49 = (+($unsigned($signed($signed(reg41))) ?
                      $unsigned(((|wire20) <= $unsigned(wire20))) : (~^$signed(wire39[(1'h0):(1'h0)]))));
  assign wire50 = $signed(($unsigned(wire46[(4'hb):(1'h0)]) ?
                      ($unsigned((&wire36)) ?
                          (|wire33[(1'h1):(1'h0)]) : reg31) : $signed($signed(reg42[(3'h4):(1'h1)]))));
endmodule

module module101  (y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire105;
  input wire signed [(5'h11):(1'h0)] wire104;
  input wire [(5'h10):(1'h0)] wire103;
  input wire signed [(4'ha):(1'h0)] wire102;
  wire signed [(3'h6):(1'h0)] wire131;
  wire [(5'h10):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire129;
  wire signed [(4'h8):(1'h0)] wire128;
  wire signed [(2'h2):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire118;
  wire [(4'h9):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire [(3'h4):(1'h0)] wire115;
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg106 <= $unsigned(wire102);
      if ($signed($unsigned((-$unsigned($signed(wire102))))))
        begin
          if ({(({reg106} + wire105[(1'h0):(1'h0)]) ?
                  wire102 : (|$unsigned(reg106[(4'h8):(1'h1)])))})
            begin
              reg107 <= $unsigned(reg106);
              reg108 <= (reg107 ^~ (^~$unsigned((~|$signed(wire103)))));
              reg109 <= (+reg106[(3'h7):(3'h7)]);
            end
          else
            begin
              reg107 <= (+wire103[(3'h5):(3'h4)]);
              reg108 <= (|(~^{$unsigned((8'hba)),
                  ($unsigned(reg107) >>> $unsigned(reg109))}));
              reg109 <= (wire104 ?
                  reg109[(3'h4):(1'h0)] : $signed((((reg106 ?
                          (8'hb9) : wire104) ?
                      (wire102 >= wire104) : wire104) != wire102[(1'h1):(1'h1)])));
              reg110 <= wire105[(2'h2):(1'h0)];
            end
          reg111 <= ($unsigned({{(reg108 == wire103)},
                  $signed(reg106[(2'h2):(2'h2)])}) ?
              $signed((^~reg109[(4'hd):(4'h8)])) : $unsigned($unsigned($unsigned((wire102 >>> reg108)))));
          reg112 <= ((wire104[(3'h4):(1'h0)] != wire102[(3'h6):(2'h2)]) ?
              (|((^$signed(wire105)) & wire105[(3'h4):(2'h2)])) : (wire102 && $signed($unsigned(((7'h43) & wire102)))));
          reg113 <= $signed({(8'ha3)});
        end
      else
        begin
          reg107 <= $signed($unsigned({$unsigned(wire104), reg110}));
          reg108 <= $signed({{($unsigned(wire103) >= (reg112 ?
                      reg113 : reg106)),
                  ((^reg108) >>> (wire102 ? (8'h9c) : (8'hb1)))}});
          reg109 <= (((($signed(wire104) ? $signed(reg109) : $signed(wire102)) ?
                  reg109[(4'hc):(4'hc)] : $unsigned((~|(8'hb5)))) ?
              reg111 : (((-wire102) ?
                  reg108[(3'h7):(2'h3)] : (wire103 ?
                      reg111 : reg109)) + $unsigned($signed((8'hbc))))) != reg111);
        end
      reg114 <= {($unsigned((8'hb1)) >> (^((reg110 <= reg107) ?
              (reg108 >>> reg113) : (|reg109))))};
    end
  assign wire115 = $unsigned($signed((((wire102 ? (8'h9f) : wire104) ?
                           {reg111} : reg111) ?
                       ($signed(reg107) > wire102) : reg114)));
  assign wire116 = reg109[(4'hf):(3'h7)];
  assign wire117 = reg114;
  assign wire118 = ($unsigned($unsigned((^reg113))) + (reg107[(3'h6):(2'h2)] ?
                       $signed(((wire104 ? wire117 : (8'haf)) >>> (reg106 ?
                           reg114 : wire116))) : wire105[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (((^~(wire103 ?
              (reg110 ?
                  (^(8'ha0)) : reg109[(1'h0):(1'h0)]) : wire118[(3'h6):(3'h6)])) ?
          reg113[(3'h6):(3'h5)] : ({$signed(wire104), (&$unsigned(wire117))} ?
              (reg107 <= (((8'ha1) ? wire102 : wire118) ?
                  $unsigned(wire116) : {reg113,
                      (8'ha6)})) : wire103[(4'ha):(3'h4)])))
        begin
          reg119 <= $unsigned($unsigned(wire105[(1'h1):(1'h0)]));
          reg120 <= $signed((~&$unsigned(wire104[(3'h7):(3'h5)])));
          reg121 <= ($signed($unsigned($signed(reg107))) ?
              reg111 : $unsigned((reg114 > reg119[(3'h4):(2'h2)])));
          reg122 <= {(&(^~wire116)),
              ((((|wire102) ?
                  $unsigned(wire104) : $unsigned(reg114)) << $signed($signed((8'hb7)))) ~^ (reg109 ?
                  wire105[(2'h2):(1'h1)] : {reg121, $unsigned(reg119)}))};
          reg123 <= (^~(~|(!reg122)));
        end
      else
        begin
          reg119 <= (-reg113[(3'h5):(3'h5)]);
          reg120 <= ($signed((~^{reg112[(2'h2):(1'h1)], $signed(reg109)})) ?
              (!wire115) : ((&((8'h9f) & (wire103 * reg111))) ?
                  $signed(reg121) : (7'h41)));
          reg121 <= $unsigned((({((8'h9c) ? (8'hbf) : reg110),
                  $signed(wire103)} || $signed((reg119 ? reg110 : reg122))) ?
              (({reg108} ?
                  reg111 : (wire105 ?
                      reg113 : reg122)) == (^~reg122)) : (^~$unsigned((~reg119)))));
          if ((reg106 ?
              (wire102[(4'h9):(1'h0)] ?
                  (($unsigned(reg111) < (reg119 && wire116)) - (~|(reg114 ?
                      reg107 : reg123))) : (($unsigned((8'ha2)) == (wire104 ?
                          reg112 : reg119)) ?
                      {wire118[(4'hb):(2'h3)]} : $unsigned((reg120 | reg119)))) : ((((wire118 + wire115) ?
                  $unsigned(reg109) : reg108) && (&$signed(reg114))) >>> $signed((~^(reg111 ?
                  reg121 : reg109))))))
            begin
              reg122 <= (+{wire104, reg120});
              reg123 <= (($signed(reg123) ?
                  (8'hb9) : reg123) >> (($signed(wire105) + (|$signed(reg119))) | (~|($unsigned(reg108) != ((8'hbe) && reg108)))));
              reg124 <= $signed(reg111);
              reg125 <= wire117[(1'h1):(1'h1)];
              reg126 <= ($unsigned(($signed($unsigned((8'ha8))) & reg110)) ?
                  ($signed((reg123[(4'h9):(4'h8)] - reg114)) != (|($signed(wire117) ?
                      {reg119, (8'hb2)} : $unsigned((8'hb4))))) : (&((((8'hbe) ?
                          reg110 : reg113) ?
                      (8'hba) : (wire118 ?
                          wire118 : wire103)) <<< wire105[(2'h2):(1'h1)])));
            end
          else
            begin
              reg122 <= ($unsigned($unsigned((|reg122))) < (reg126[(4'h8):(2'h3)] ?
                  reg107 : reg113));
            end
        end
    end
  assign wire127 = (&$signed(wire105[(2'h3):(1'h0)]));
  assign wire128 = $signed((({reg124[(1'h0):(1'h0)], $signed(reg125)} ?
                       (wire127[(1'h0):(1'h0)] ?
                           (&reg109) : (!reg111)) : $signed(reg113)) ^~ $unsigned(reg114)));
  assign wire129 = {$signed($unsigned(((reg110 + (8'hae)) ?
                           $unsigned(reg122) : (&reg126))))};
  assign wire130 = ((~|(&$unsigned($signed((8'hae))))) ?
                       $unsigned(((-(wire127 ? wire129 : wire103)) ?
                           $unsigned(reg109[(3'h5):(2'h3)]) : reg114)) : ((~&$signed((~&reg124))) ?
                           $unsigned($unsigned($signed(reg124))) : (~&((|reg113) ?
                               wire102 : (&wire105)))));
  assign wire131 = ((reg119 ?
                       $signed((~|$unsigned(reg108))) : reg123[(2'h2):(1'h0)]) + $signed({$unsigned({reg111,
                           (8'hb3)}),
                       (^(8'haf))}));
endmodule
