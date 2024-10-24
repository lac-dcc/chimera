module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  assign y = {wire73,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire6,
                 wire5,
                 wire4,
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
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire4 = $signed((|$signed(($unsigned(wire3) || wire0))));
  assign wire5 = $unsigned((~^wire3[(4'hf):(4'ha)]));
  assign wire6 = ((~($signed((wire3 >> wire5)) <= $unsigned($signed(wire0)))) >>> ($signed($unsigned($unsigned(wire0))) ?
                     $signed($unsigned((wire3 * wire2))) : $unsigned({(wire1 ?
                             wire3 : wire0)})));
  module7 #() modinst61 (wire60, clk, wire3, wire2, wire6, wire1);
  assign wire62 = $signed((8'hbf));
  assign wire63 = $unsigned($signed(wire2));
  assign wire64 = $signed(wire0[(2'h2):(2'h2)]);
  assign wire65 = $signed($unsigned(($signed((-(8'hb4))) & ((~&wire63) & (^~wire6)))));
  assign wire66 = ({wire1} != $unsigned(wire5[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg67 <= wire2[(2'h3):(2'h2)];
      reg68 <= (wire60[(2'h3):(2'h3)] ?
          wire62 : ((($unsigned((8'hb1)) <<< (wire5 * wire2)) || wire66) - (((wire0 ?
                  wire5 : reg67) <<< $unsigned(wire6)) ?
              wire66 : ((wire60 >= wire5) ?
                  wire1[(4'hf):(4'he)] : ((8'hae) >>> (8'hb5))))));
      reg69 <= wire2;
      if ((((+(((8'haf) ? (8'hb7) : wire3) ?
              (wire0 && wire6) : $signed(wire5))) ?
          {({wire2, wire66} ? (wire63 ? (8'hae) : wire63) : (reg69 != wire5)),
              (+$signed(wire63))} : (wire6 ?
              wire5 : $unsigned($signed(reg67)))) * wire1))
        begin
          reg70 <= (($signed($signed({wire64,
              wire64})) || wire5[(3'h5):(3'h5)]) < $signed((-(7'h40))));
          reg71 <= $signed(wire4[(3'h7):(2'h2)]);
        end
      else
        begin
          reg70 <= wire63[(2'h2):(2'h2)];
          reg71 <= (~|($signed(($unsigned((8'ha9)) ?
              {wire3} : reg67)) - ({wire0[(4'hf):(4'he)]} & $signed(wire2))));
        end
      reg72 <= {wire3[(4'hd):(4'hd)]};
    end
  assign wire73 = $signed($signed(($signed(wire63[(4'hf):(4'hb)]) <<< {(|wire1),
                      $unsigned(reg69)})));
  always
    @(posedge clk) begin
      reg74 <= (|wire62);
      reg75 <= $unsigned(wire62);
      reg76 <= {reg68[(2'h3):(2'h2)], wire73};
      reg77 <= wire1[(1'h0):(1'h0)];
      if (((|(~&((wire5 * wire60) ? (reg69 || wire62) : (|wire3)))) ?
          (wire6 ? (&wire66) : (-$unsigned(wire6))) : (((+wire73) ?
                  (-(wire66 <<< (7'h43))) : $unsigned(wire3)) ?
              reg71 : ((-reg70[(3'h5):(3'h5)]) ^ ((reg71 ? wire1 : (7'h43)) ?
                  $signed(reg69) : (wire66 << wire64))))))
        begin
          reg78 <= (+((((~^wire66) ? $signed((8'hae)) : $signed(wire63)) ?
                  (~|wire5[(1'h1):(1'h0)]) : $unsigned({reg74})) ?
              ($signed({(8'hbe), reg72}) ?
                  (^wire2) : ($signed(wire63) << (8'hb8))) : $unsigned((7'h43))));
          reg79 <= reg75[(1'h1):(1'h0)];
          if (reg75)
            begin
              reg80 <= reg69;
              reg81 <= (|$signed((((reg70 ? wire65 : wire65) ?
                      $signed(reg72) : reg79[(4'h9):(1'h1)]) ?
                  reg80[(4'hf):(2'h2)] : ((^wire63) | $unsigned(reg76)))));
            end
          else
            begin
              reg80 <= ((^wire65) ?
                  ((wire62[(3'h7):(1'h0)] - $unsigned({wire1,
                      reg81})) >= $signed(reg79)) : (($signed((wire66 ?
                      wire5 : wire3)) > reg70[(1'h1):(1'h0)]) <<< $signed((((8'hbf) || reg81) ^ $signed((8'hba))))));
              reg81 <= {(^~$unsigned(wire3)),
                  (~^(+((~|reg72) * reg77[(3'h4):(3'h4)])))};
              reg82 <= wire62;
            end
          if ((reg70[(2'h3):(1'h1)] ?
              $unsigned($unsigned($unsigned(reg78[(4'ha):(2'h3)]))) : (($signed($signed(wire5)) ?
                      {(wire63 != wire73), reg71} : (^~reg74)) ?
                  $signed(reg74[(3'h4):(2'h3)]) : (-$signed(wire3)))))
            begin
              reg83 <= {{$unsigned(((wire2 >>> reg74) ?
                          reg81[(4'hc):(3'h6)] : {wire3, reg81})),
                      reg79}};
              reg84 <= (&wire62);
              reg85 <= reg79[(1'h0):(1'h0)];
            end
          else
            begin
              reg83 <= {reg77[(2'h3):(1'h0)]};
              reg84 <= wire64[(1'h1):(1'h0)];
              reg85 <= ($unsigned(reg69[(1'h0):(1'h0)]) ?
                  reg72[(3'h5):(2'h2)] : wire63);
              reg86 <= (reg70 ?
                  wire64[(5'h11):(1'h1)] : $signed(($signed({reg81, reg84}) ?
                      (~^(wire6 >= wire63)) : ($signed(reg85) >> wire60))));
            end
          reg87 <= reg76[(1'h1):(1'h0)];
        end
      else
        begin
          reg78 <= (~(wire65[(4'hb):(3'h5)] >>> (-$unsigned((8'ha4)))));
          reg79 <= $signed((($signed(reg72[(1'h1):(1'h1)]) ?
              $unsigned(reg81) : reg67) && ($signed(wire62[(2'h2):(1'h0)]) ?
              (wire4[(2'h2):(1'h0)] == ((8'h9e) || wire6)) : wire4[(5'h13):(4'hd)])));
          reg80 <= $signed(((8'hb1) ?
              $unsigned(((wire2 >= reg69) ?
                  reg67[(1'h0):(1'h0)] : $unsigned(reg72))) : (~(&reg75[(1'h0):(1'h0)]))));
          if ((-$unsigned(reg69[(2'h3):(2'h3)])))
            begin
              reg81 <= reg67;
              reg82 <= $unsigned((($unsigned((reg87 != reg78)) ?
                  $signed(reg67[(4'hb):(1'h0)]) : $signed(reg81)) >= (8'hb5)));
              reg83 <= ($signed($unsigned($unsigned((wire60 <= wire4)))) << ($unsigned(((reg79 == (8'hb6)) ~^ reg87[(1'h0):(1'h0)])) ?
                  $unsigned(wire65[(3'h4):(3'h4)]) : (!{$unsigned((8'hb2))})));
            end
          else
            begin
              reg81 <= (($unsigned($signed({reg75, reg85})) ?
                  reg83 : $unsigned((wire3 ?
                      reg77[(4'h8):(2'h2)] : (reg87 >>> (8'h9c))))) == reg75[(4'ha):(1'h1)]);
            end
          reg84 <= $signed($signed(reg81));
        end
    end
endmodule

module module7
#(parameter param59 = {((+(~^(^(8'ha7)))) ~^ (((~(8'haa)) ? ((8'hbb) ? (8'hb9) : (8'ha2)) : {(8'hbc), (8'hb6)}) ? {((8'hbc) ? (8'h9d) : (7'h40)), ((8'hb2) ? (8'ha0) : (8'hb2))} : ((7'h41) ? ((7'h43) ? (8'hbc) : (8'hb3)) : (^(8'hba)))))})
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire12;
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire24,
                 wire12,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire12 = wire9;
  module13 #() modinst25 (wire24, clk, wire8, wire12, wire11, wire10);
  always
    @(posedge clk) begin
      reg26 <= $unsigned(wire8[(4'hf):(2'h3)]);
      if (wire24[(2'h2):(1'h0)])
        begin
          reg27 <= $unsigned((~|wire9));
          reg28 <= (8'hb0);
        end
      else
        begin
          if (wire11)
            begin
              reg27 <= (^{((~&(|reg26)) && $signed({wire10, reg27})),
                  ((8'ha7) * (+(wire8 ? (8'hb8) : reg26)))});
            end
          else
            begin
              reg27 <= wire11[(4'hc):(1'h1)];
              reg28 <= $unsigned($unsigned({(wire12[(2'h2):(1'h0)] * (wire12 ?
                      wire12 : reg26)),
                  reg26[(1'h0):(1'h0)]}));
              reg29 <= $signed($unsigned(($signed($unsigned(wire9)) & (~&(+reg27)))));
              reg30 <= wire8;
            end
          reg31 <= ((wire9 <<< $unsigned(reg26)) || wire24);
          reg32 <= ((|$signed((~^(~^reg27)))) & (wire24[(1'h0):(1'h0)] ?
              ((reg30[(1'h0):(1'h0)] & (reg28 | wire9)) ?
                  $unsigned(wire10) : wire8[(3'h7):(2'h2)]) : (^(|wire24[(2'h2):(1'h1)]))));
        end
      if ($unsigned(((&(reg29 <= $unsigned(reg30))) ?
          reg31 : ((reg26 ?
              $signed(wire12) : $unsigned(reg29)) ^~ ($signed((8'haa)) ?
              reg26[(1'h0):(1'h0)] : wire12)))))
        begin
          reg33 <= (wire12 ?
              (reg26[(3'h5):(3'h4)] - reg27) : reg29[(4'h8):(3'h7)]);
        end
      else
        begin
          reg33 <= (wire12[(3'h4):(1'h0)] || reg31);
          if (wire10[(4'hc):(4'h8)])
            begin
              reg34 <= $signed(wire10);
            end
          else
            begin
              reg34 <= $signed(wire10[(3'h4):(2'h3)]);
              reg35 <= $unsigned(reg26);
              reg36 <= (reg35 ?
                  reg26[(4'hd):(3'h5)] : ($unsigned(($unsigned(wire9) ^~ ((8'hb0) ?
                          wire24 : wire11))) ?
                      $signed(reg32) : $unsigned(((~reg30) > (wire12 ?
                          reg33 : wire9)))));
              reg37 <= (~^(reg26[(3'h5):(1'h1)] ?
                  $unsigned((^(wire8 ?
                      reg34 : reg36))) : ($signed((reg36 | (8'hbc))) ^ $signed((-wire9)))));
              reg38 <= {$unsigned(($signed($signed(reg30)) >> $signed(reg32[(1'h1):(1'h0)])))};
            end
          reg39 <= reg36;
          if ({(~&$unsigned(reg34)), reg33[(1'h0):(1'h0)]})
            begin
              reg40 <= $signed((((8'hb0) ?
                      reg27 : ($signed(reg36) ?
                          (7'h43) : reg34[(3'h6):(1'h0)])) ?
                  (&$unsigned((wire8 >> (8'ha9)))) : ($signed((~^reg38)) ^~ ($signed(wire12) ?
                      reg35 : reg39[(4'h9):(2'h2)]))));
              reg41 <= $signed(reg34[(4'h8):(1'h1)]);
              reg42 <= reg41[(4'hd):(4'hd)];
            end
          else
            begin
              reg40 <= (~|$signed(((reg38 ? $signed(wire8) : wire9) ?
                  ((reg31 | reg36) ?
                      $signed(wire24) : reg36[(2'h2):(1'h1)]) : $signed($signed(wire24)))));
              reg41 <= (((reg33[(1'h0):(1'h0)] && {(reg29 == (8'hb0))}) ?
                  $unsigned((-(reg30 >> reg28))) : $unsigned((wire24 >>> reg37[(3'h4):(3'h4)]))) ^ (~|reg38[(1'h1):(1'h1)]));
              reg42 <= reg38[(3'h4):(1'h0)];
              reg43 <= $unsigned($signed($signed({(reg36 <<< reg31)})));
              reg44 <= $unsigned((^~reg37));
            end
          reg45 <= $signed($signed(reg30[(4'hd):(3'h7)]));
        end
    end
  assign wire46 = reg33[(2'h2):(1'h1)];
  assign wire47 = (($unsigned(((|reg39) ?
                          (reg40 ? (8'h9d) : reg37) : (reg44 ?
                              reg39 : reg32))) ?
                      ((reg35[(3'h4):(2'h2)] >>> wire10) ?
                          $unsigned($unsigned(reg33)) : (-reg40[(2'h3):(2'h2)])) : (-$signed((!(8'hb9))))) ^~ $unsigned($unsigned(wire11)));
  assign wire48 = {(reg33[(1'h0):(1'h0)] ?
                          $signed({{reg34},
                              reg28[(1'h1):(1'h1)]}) : (reg45[(1'h0):(1'h0)] ?
                              reg30 : (~&$unsigned(reg44))))};
  assign wire49 = (($unsigned(((reg37 ? wire48 : reg32) ?
                              (wire12 ? reg38 : wire24) : {reg29})) ?
                          $signed(({reg37} ?
                              $unsigned(wire46) : $unsigned(reg32))) : $unsigned((-{wire12}))) ?
                      {$signed(reg32),
                          (~&((reg38 ? reg34 : (8'ha7)) ?
                              (!reg27) : $unsigned(reg32)))} : ($signed($signed(reg28)) * {$signed((^~reg32)),
                          ((+wire48) ? reg36 : (reg37 ? wire24 : reg39))}));
  assign wire50 = $signed(reg33[(1'h0):(1'h0)]);
  assign wire51 = (reg44 < (reg26[(3'h7):(3'h6)] ?
                      $signed((reg39 ?
                          ((8'ha9) ?
                              reg44 : (8'ha3)) : $signed((8'hb7)))) : ((!wire9) ?
                          $signed($signed(reg39)) : ((~&wire10) << $unsigned(reg37)))));
  assign wire52 = (8'ha8);
  assign wire53 = $signed(wire48);
  assign wire54 = $unsigned({(^$signed((reg41 == (7'h43)))),
                      $signed((reg26[(4'hc):(4'hb)] ?
                          (reg28 ? wire47 : reg45) : reg30))});
  assign wire55 = (wire51 ?
                      ((reg27[(1'h1):(1'h0)] ?
                              reg29[(4'h8):(1'h1)] : $unsigned($unsigned(reg26))) ?
                          (reg34 << wire11[(2'h2):(1'h0)]) : wire52[(2'h2):(1'h0)]) : (($signed((reg28 && wire8)) ^~ (8'hb2)) & (wire24[(1'h0):(1'h0)] ?
                          {wire12[(2'h3):(2'h3)],
                              (reg34 >= (8'hba))} : $signed(wire10[(1'h0):(1'h0)]))));
  assign wire56 = reg41;
  assign wire57 = $unsigned($unsigned($signed(reg38[(1'h0):(1'h0)])));
  assign wire58 = ((wire51 ?
                          ($unsigned((+reg27)) ?
                              wire50 : (^(~wire24))) : $unsigned(wire51)) ?
                      ({(((8'hb4) ? wire12 : (8'ha5)) < (reg37 >= wire48))} ?
                          wire24[(1'h1):(1'h1)] : $signed(reg30)) : reg33);
endmodule

module module13
#(parameter param22 = ({((((8'hb2) ? (8'hb4) : (8'hb0)) < ((8'hba) ? (8'h9f) : (8'ha9))) ? {((8'hb3) ? (8'hba) : (8'hb0))} : ((~(8'hb8)) ~^ ((7'h40) ? (8'hb0) : (7'h44)))), ((((8'hb5) ? (8'hb3) : (7'h41)) ? ((8'ha1) * (8'ha5)) : ((8'h9f) ? (8'hbc) : (7'h43))) ? (~&(!(8'ha3))) : (^((8'hbf) ? (8'hbf) : (8'ha7))))} ? ((~&(8'ha0)) ? (&(((8'had) | (8'hb5)) ? (^~(8'hbb)) : (7'h43))) : (((|(8'ha9)) > ((8'hb3) ? (8'ha0) : (8'h9d))) < (((7'h41) * (8'haa)) << {(8'ha3)}))) : (((|((8'hb9) < (8'ha9))) != (+((8'hbf) ? (8'h9e) : (8'hbd)))) ~^ (((~(8'hb1)) ? ((8'h9c) >= (8'hbe)) : ((8'ha4) ? (8'hb1) : (8'hb2))) < {(~^(8'hb0)), (&(8'hb2))}))), 
parameter param23 = param22)
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  assign y = {wire20, wire19, wire18, reg21, (1'h0)};
  assign wire18 = (($signed((8'ha2)) <<< (8'ha5)) >> $signed((8'hb5)));
  assign wire19 = (~|(~&((wire15[(4'hb):(1'h0)] ?
                      wire15 : $unsigned((8'ha6))) + (-(wire14 ?
                      wire18 : wire16)))));
  assign wire20 = wire19;
  always
    @(posedge clk) begin
      reg21 <= (^~wire19[(3'h4):(1'h0)]);
    end
endmodule
