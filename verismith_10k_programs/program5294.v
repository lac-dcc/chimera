module top
#(parameter param106 = {((8'ha8) ? {({(8'haa)} ? ((8'hb3) >= (8'hac)) : ((8'hb5) & (8'hbf)))} : {{(8'hbd), (!(8'hb8))}}), (((((8'hb0) == (8'hb3)) < {(8'ha7), (8'hb8)}) + (((7'h43) < (8'hb2)) - ((8'hab) + (7'h42)))) * ((&(~(8'ha7))) - (+((8'had) ? (7'h44) : (8'haf)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h261):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire86;
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire100,
                 wire5,
                 wire6,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire35,
                 wire48,
                 wire86,
                 reg102,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
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
                 (1'h0)};
  assign wire5 = (~&({({wire4, wire1} ?
                             (wire4 ? wire1 : (7'h40)) : (wire3 ?
                                 wire1 : wire2)),
                         wire0} ?
                     (^~wire3[(1'h1):(1'h1)]) : wire4));
  assign wire6 = wire0[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg7 <= wire0;
      reg8 <= $signed((((wire6 << (wire0 ? wire5 : wire4)) ?
              $unsigned((~|reg7)) : $unsigned({(8'hb0)})) ?
          $unsigned(((8'hb5) >>> (wire6 > wire5))) : ($unsigned((wire1 | (7'h40))) & $signed((wire5 >= wire1)))));
      reg9 <= $signed((((^~(wire6 ? reg7 : wire6)) ?
          ($signed(wire3) ?
              wire0[(3'h4):(3'h4)] : ((8'hbd) ?
                  reg8 : wire3)) : wire0[(3'h4):(2'h2)]) | ((((8'hb6) ~^ (8'hb6)) ?
              reg7[(4'h9):(3'h4)] : (8'hbf)) ?
          ((wire2 ^~ reg8) << wire5[(4'ha):(3'h4)]) : $unsigned((wire6 ?
              wire2 : reg7)))));
      reg10 <= {$signed(($unsigned((wire3 <= (8'hbf))) ?
              wire6[(4'he):(3'h7)] : ((reg7 ? wire2 : wire0) ^~ {(8'hb1),
                  reg8})))};
    end
  assign wire11 = wire5;
  assign wire12 = reg9;
  assign wire13 = (({$unsigned((~|wire6)),
                      wire1} >>> $signed($signed((wire12 <<< (8'haf))))) || wire2);
  assign wire14 = (^~wire11[(3'h7):(2'h3)]);
  assign wire15 = wire11[(3'h7):(3'h4)];
  assign wire16 = (wire15[(2'h2):(1'h0)] ?
                      (wire15 ?
                          reg10[(3'h5):(2'h2)] : $signed(wire12)) : $signed(wire12));
  assign wire17 = $signed($signed((^~$signed(wire6))));
  always
    @(posedge clk) begin
      reg18 <= {wire16[(3'h4):(3'h4)]};
    end
  always
    @(posedge clk) begin
      if (wire15)
        begin
          if (wire0)
            begin
              reg19 <= ((&($signed(wire11) ?
                  $signed(wire1) : ((~&reg8) ?
                      (wire13 ?
                          (7'h44) : reg8) : reg8))) ~^ ($unsigned($signed((8'hb1))) >> (&{reg10[(3'h5):(3'h5)],
                  (reg7 ? wire13 : reg7)})));
              reg20 <= wire3;
              reg21 <= {(&(((7'h41) ? $signed((8'h9c)) : (8'had)) ?
                      $unsigned((wire16 ?
                          wire0 : wire13)) : reg18[(3'h6):(3'h5)]))};
              reg22 <= $signed($signed(wire15[(1'h1):(1'h1)]));
              reg23 <= $signed($unsigned((reg7[(1'h0):(1'h0)] ?
                  (^~$unsigned((8'hbf))) : (+(reg19 ? reg9 : reg9)))));
            end
          else
            begin
              reg19 <= $unsigned(reg19);
              reg20 <= (($signed(wire15[(1'h0):(1'h0)]) ?
                  ((~^(wire1 ? reg18 : wire2)) ?
                      (+wire2) : wire14[(4'ha):(2'h3)]) : reg20) > $unsigned($signed(wire0)));
              reg21 <= ({(!{{wire6}}),
                  {(!(reg20 ?
                          (8'ha7) : reg18))}} <= (&$signed($unsigned((+wire6)))));
              reg22 <= ((~|(((+(8'ha1)) || $signed(wire0)) ?
                      {reg18[(3'h4):(1'h1)]} : $signed($signed(reg9)))) ?
                  reg23 : ((wire2 ?
                      ((reg19 <<< wire13) ?
                          (~wire15) : $unsigned(reg8)) : (wire6[(3'h5):(2'h2)] ?
                          (~(8'ha6)) : wire16)) < $signed(reg9[(3'h7):(3'h4)])));
              reg23 <= $signed(reg22);
            end
          reg24 <= $signed(({wire17[(2'h3):(2'h2)]} <= wire1));
          reg25 <= (reg21 & reg10[(3'h6):(1'h1)]);
          if ($signed({(8'haf)}))
            begin
              reg26 <= $unsigned((wire1 | wire1));
              reg27 <= ($signed(reg22[(2'h2):(2'h2)]) ?
                  (wire13[(4'h8):(2'h2)] + ($unsigned((wire2 ?
                      wire17 : reg19)) & ((wire6 ?
                      reg26 : wire5) <<< (reg19 << wire17)))) : ($signed(reg10[(4'hb):(4'ha)]) ?
                      ({(-wire12), (~wire1)} ?
                          ({reg19,
                              reg9} && wire16[(4'he):(3'h6)]) : $signed($unsigned(wire15))) : reg23[(2'h3):(1'h0)]));
              reg28 <= $signed($unsigned((wire2[(3'h7):(3'h7)] ?
                  (~&$signed(wire2)) : $signed(wire12))));
            end
          else
            begin
              reg26 <= $signed(reg21[(3'h5):(3'h5)]);
              reg27 <= $unsigned((reg10 || wire15[(2'h2):(1'h1)]));
              reg28 <= ((-$unsigned((~|$signed(reg8)))) ?
                  (&((~^reg7[(3'h6):(2'h3)]) ?
                      $signed(wire0[(3'h7):(1'h0)]) : (((8'haa) >> reg22) - (wire16 ?
                          (8'ha8) : reg7)))) : (+reg26));
            end
          reg29 <= (($unsigned($signed({wire5, reg10})) >= {(reg28 ?
                  $unsigned(reg28) : reg25)}) <= reg21);
        end
      else
        begin
          reg19 <= $unsigned(wire2[(3'h5):(1'h0)]);
          reg20 <= (~wire5[(4'h9):(2'h3)]);
          reg21 <= reg8;
        end
      if (wire13)
        begin
          reg30 <= (reg23[(3'h7):(3'h5)] ?
              (wire13 ?
                  $signed(reg10[(4'h9):(3'h4)]) : (-$signed((reg7 ?
                      wire4 : wire16)))) : ($unsigned(((|reg26) ?
                  (wire3 || reg25) : {(7'h44),
                      reg27})) > $signed(((wire17 >> reg21) ?
                  reg8[(1'h1):(1'h0)] : $unsigned((8'hbe))))));
          reg31 <= reg22[(2'h3):(1'h0)];
          reg32 <= ($unsigned(wire14[(4'hf):(4'hd)]) ?
              ((8'hb3) ?
                  $signed(((wire2 ? reg28 : wire13) ?
                      reg21[(2'h2):(1'h0)] : (8'hbb))) : (reg26[(4'h8):(3'h5)] ?
                      $signed($signed(reg18)) : (^(reg9 + reg10)))) : wire11[(3'h7):(3'h5)]);
        end
      else
        begin
          reg30 <= reg19;
        end
      reg33 <= reg22[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg34 <= reg31[(2'h2):(1'h0)];
    end
  assign wire35 = $signed(wire0[(3'h7):(3'h7)]);
  always
    @(posedge clk) begin
      reg36 <= wire6;
      reg37 <= (reg25[(1'h1):(1'h1)] ~^ $signed((reg28 & reg9[(1'h0):(1'h0)])));
      if (((|(~&((!(8'hb1)) < (reg23 ^ wire1)))) ?
          (((^~reg30[(4'hd):(3'h4)]) << ((^(8'hb3)) ?
              (reg18 != reg25) : (~&(8'ha0)))) >> ($signed((~^wire13)) + {(~|wire13)})) : wire16))
        begin
          reg38 <= (wire15[(2'h3):(2'h3)] & $unsigned(wire6));
        end
      else
        begin
          reg38 <= wire12;
          reg39 <= (8'hbf);
          reg40 <= (-($signed($unsigned({reg24, wire15})) ? wire17 : reg7));
        end
      if ((8'hae))
        begin
          reg41 <= (~$signed(((~$unsigned(wire3)) << $signed(wire11))));
        end
      else
        begin
          if ($unsigned(reg30))
            begin
              reg41 <= ($unsigned($signed($signed($unsigned((8'hb2))))) & wire12);
              reg42 <= ($unsigned((8'hb8)) ?
                  wire15 : ($unsigned(($unsigned(reg25) == $unsigned(reg9))) ?
                      wire11[(2'h2):(2'h2)] : $signed({$signed(reg21),
                          ((8'hb4) | wire35)})));
              reg43 <= $unsigned((wire16[(4'hd):(4'ha)] ?
                  reg22 : $signed($signed(((8'ha6) - wire15)))));
            end
          else
            begin
              reg41 <= $signed(reg42[(3'h4):(2'h3)]);
            end
          if (((~|(reg34 ?
              (8'hbc) : $signed($unsigned(reg33)))) >> $unsigned(wire35)))
            begin
              reg44 <= ({reg26[(2'h2):(2'h2)], reg33[(4'hd):(4'h8)]} ?
                  (~reg29) : ({reg18, (8'hbb)} ?
                      ($unsigned((~reg37)) ?
                          (reg29[(2'h2):(1'h1)] ?
                              wire14[(5'h11):(4'he)] : $signed((8'ha3))) : (~^reg26[(3'h4):(1'h0)])) : (|$unsigned($unsigned(wire6)))));
            end
          else
            begin
              reg44 <= ($signed($signed((~^reg34))) >>> $signed(wire6));
              reg45 <= reg23;
              reg46 <= (reg44 + {({((8'hb2) ? reg45 : reg8)} < $signed(wire17)),
                  (^~({reg18} & (&wire1)))});
              reg47 <= $unsigned(reg32[(2'h3):(1'h0)]);
            end
        end
    end
  assign wire48 = $unsigned(((((reg46 ? reg28 : (8'hb0)) > reg20) ?
                          ((8'haa) ?
                              (wire12 ?
                                  (8'hbb) : reg27) : (reg31 ~^ wire6)) : {(reg19 || reg26)}) ?
                      $unsigned($signed((reg33 >>> reg9))) : (reg8[(1'h1):(1'h1)] ?
                          $signed($signed(reg33)) : {$unsigned(reg29)})));
  module49 #() modinst87 (.wire52(reg22), .y(wire86), .wire51(wire48), .clk(clk), .wire53(reg38), .wire50(reg26));
  module88 #() modinst101 (wire100, clk, reg40, reg27, reg8, reg31);
  always
    @(posedge clk) begin
      reg102 <= (8'h9e);
    end
  assign wire103 = $unsigned(($signed($unsigned(reg19[(1'h1):(1'h1)])) <= $signed(wire16)));
  assign wire104 = (~&$signed((!$unsigned((wire48 ^ reg45)))));
  assign wire105 = reg33;
endmodule

module module88
#(parameter param98 = ({((((8'ha6) ? (8'hbe) : (8'ha0)) ? ((8'ha1) == (8'hb3)) : {(8'hbe), (7'h43)}) <<< (|((8'hbc) ? (8'hb8) : (8'ha5))))} << (((((8'ha9) ? (8'hb2) : (8'hab)) ? ((8'hb5) ? (8'hb4) : (8'h9e)) : ((8'haa) ? (8'hb4) : (8'hbf))) * ((+(8'h9e)) ? ((8'hbe) - (8'hbf)) : ((7'h44) ? (8'hb9) : (8'ha9)))) ? {(((8'hbe) * (8'haf)) ? ((8'hba) ? (8'ha7) : (8'hb0)) : (~&(8'ha8)))} : (((-(8'h9d)) ? ((8'ha0) ? (8'hb3) : (8'hb3)) : ((8'hb5) - (8'h9f))) ? (^((8'hb0) + (8'hbd))) : (~&((8'hbb) | (8'ha5)))))), 
parameter param99 = {{{(param98 == (param98 != param98))}}})
(y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire92;
  input wire [(3'h4):(1'h0)] wire91;
  input wire [(4'hc):(1'h0)] wire90;
  input wire signed [(4'hc):(1'h0)] wire89;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  assign y = {wire96, wire95, wire94, wire93, reg97, (1'h0)};
  assign wire93 = (~^(8'hab));
  assign wire94 = (~&wire93);
  assign wire95 = wire94;
  assign wire96 = wire89;
  always
    @(posedge clk) begin
      reg97 <= wire89[(4'hb):(3'h5)];
    end
endmodule

module module49
#(parameter param85 = (^(({((8'hab) ? (8'ha9) : (8'hba)), ((8'hb4) == (8'hac))} - (7'h40)) ? (8'hb6) : {(|((8'hbd) + (8'hb6)))})))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire53;
  input wire signed [(4'h9):(1'h0)] wire52;
  input wire signed [(3'h7):(1'h0)] wire51;
  input wire signed [(5'h13):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 (1'h0)};
  assign wire54 = ((wire50 ?
                          $signed(wire53[(3'h4):(1'h1)]) : $unsigned($unsigned(wire51))) ?
                      {(((wire53 == (8'hac)) ^ ((8'hbf) <= (7'h42))) ?
                              (^(wire52 ?
                                  wire52 : wire50)) : (wire52[(3'h6):(2'h3)] >>> wire51))} : {wire52});
  assign wire55 = $unsigned(wire50);
  assign wire56 = ((((^~$unsigned((8'ha9))) >= $signed({wire53, wire55})) ?
                          ({$signed((8'hb1))} == ((wire51 > wire53) ?
                              wire55[(1'h1):(1'h1)] : (~wire51))) : (|wire55)) ?
                      (~^$unsigned(({wire53, wire51} ?
                          $unsigned(wire50) : wire51[(3'h7):(1'h0)]))) : wire54);
  assign wire57 = (8'ha5);
  assign wire58 = $unsigned(wire55);
  module59 #() modinst75 (wire74, clk, wire57, wire58, wire50, wire56);
  assign wire76 = ((($signed(wire52[(1'h1):(1'h0)]) ?
                          (|wire55[(1'h0):(1'h0)]) : (^~wire51[(3'h7):(2'h3)])) ?
                      $signed(((wire50 ? wire57 : wire53) ?
                          (wire74 * wire58) : (&(8'hab)))) : wire53[(3'h4):(2'h3)]) ^ (8'h9f));
  assign wire77 = ($signed(wire74[(4'h9):(3'h6)]) ?
                      wire55[(2'h2):(1'h0)] : ((^(wire58[(3'h7):(3'h4)] >>> (-wire54))) ?
                          $unsigned($signed($signed((8'h9c)))) : ({((8'hba) ?
                                  (8'hb5) : wire57)} & ($unsigned(wire57) ?
                              wire57[(4'h8):(2'h3)] : $signed(wire55)))));
  assign wire78 = (wire55 ~^ (({(wire54 ? wire53 : (8'ha5))} ?
                          (wire50[(1'h1):(1'h1)] && ((8'ha4) ^~ wire57)) : ($unsigned(wire58) ?
                              $unsigned(wire76) : $signed((8'hb5)))) ?
                      (wire52[(2'h3):(1'h1)] & $signed(wire56[(2'h2):(1'h0)])) : $unsigned((^~$signed(wire52)))));
  assign wire79 = wire54[(2'h3):(1'h0)];
  assign wire80 = (8'haa);
  assign wire81 = ({$unsigned($signed($unsigned(wire54)))} ^~ (~|(((wire77 ?
                              wire77 : wire51) ?
                          wire50[(5'h12):(4'he)] : $signed((8'haa))) ?
                      wire51[(2'h2):(1'h1)] : {(wire80 ? (8'ha7) : wire58)})));
  assign wire82 = wire74;
  assign wire83 = {wire54[(5'h12):(4'h9)]};
  assign wire84 = {$signed((((wire56 ^~ wire78) ?
                          {wire55, wire56} : (wire76 ?
                              wire76 : wire81)) ~^ wire80[(2'h2):(1'h1)]))};
endmodule

module module59  (y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire63;
  input wire [(3'h4):(1'h0)] wire62;
  input wire signed [(3'h7):(1'h0)] wire61;
  input wire [(4'hc):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire64;
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire64,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire64 = (wire61[(1'h0):(1'h0)] ?
                      wire61 : $unsigned((wire60[(1'h1):(1'h1)] ?
                          $unsigned((wire63 >= wire62)) : (wire62[(2'h3):(1'h0)] ?
                              (^(8'had)) : $signed((8'h9d))))));
  always
    @(posedge clk) begin
      reg65 <= wire60[(4'h9):(1'h0)];
      reg66 <= {((wire60[(2'h3):(1'h0)] ?
              $unsigned(wire64) : $signed(reg65[(1'h0):(1'h0)])) & $unsigned({{wire61,
                  wire63}})),
          $signed((^~($unsigned(wire64) ?
              (wire63 ? (8'ha6) : wire62) : $signed(reg65))))};
      reg67 <= ((^reg65[(1'h1):(1'h0)]) ~^ $signed($signed(((~(8'hbc)) == $signed((8'hab))))));
      reg68 <= reg65[(3'h5):(3'h5)];
      reg69 <= ($unsigned(wire64) + $signed((wire64[(1'h1):(1'h1)] * wire62[(3'h4):(2'h2)])));
    end
  assign wire70 = reg69[(1'h1):(1'h0)];
  assign wire71 = (-$signed((8'h9f)));
  assign wire72 = (({$unsigned($unsigned(reg66)),
                          (8'hb9)} != ($unsigned((reg66 >>> wire62)) * (^(~^wire60)))) ?
                      (^wire70) : wire60[(3'h6):(1'h1)]);
  assign wire73 = wire60[(4'hc):(2'h2)];
endmodule
