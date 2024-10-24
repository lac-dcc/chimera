module top
#(parameter param87 = (({(^(^~(7'h40)))} ? (8'hbb) : ((~|((8'hbc) - (8'ha7))) << (~((8'hae) ? (8'ha3) : (8'ha4))))) ? (&(({(8'hb3), (8'ha1)} ? (^~(8'hbf)) : {(8'hb0), (8'ha2)}) >= ({(8'haf)} || ((8'ha8) == (8'hba))))) : (+(7'h40))), 
parameter param88 = (~(|((|(~|param87)) >> (&(~param87))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire86,
                 wire82,
                 wire81,
                 wire79,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire5,
                 reg85,
                 reg84,
                 reg83,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire0[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg6 <= (^~wire4);
      reg7 <= (((wire0 ? ($unsigned(reg6) ? wire5 : (wire1 == wire4)) : wire1) ?
              reg6 : (wire1 ?
                  wire5[(3'h5):(2'h2)] : ($unsigned((7'h42)) ?
                      (~reg6) : $signed((8'ha6))))) ?
          wire5[(3'h5):(1'h1)] : wire1[(5'h13):(2'h3)]);
      reg8 <= wire1[(4'hb):(3'h4)];
      reg9 <= $signed($unsigned((~&({wire4, reg7} >= wire4[(2'h3):(1'h0)]))));
      reg10 <= wire2[(2'h3):(1'h1)];
    end
  assign wire11 = $unsigned((^(~|$signed($signed(wire5)))));
  assign wire12 = ((($signed($unsigned((8'ha1))) - $signed((wire3 ?
                      reg7 : reg7))) || ((~&wire11) + (wire4 ?
                      $unsigned(wire0) : (wire2 < reg9)))) ~^ $unsigned((~^$unsigned(wire4[(3'h5):(1'h1)]))));
  assign wire13 = ($signed(wire5) ?
                      {(&wire11),
                          $signed($signed((wire5 ?
                              reg6 : wire5)))} : $signed(wire5));
  assign wire14 = reg7;
  module15 #() modinst80 (.wire17(wire1), .wire18(wire2), .wire19(reg8), .clk(clk), .wire16(reg6), .y(wire79));
  assign wire81 = $signed(($unsigned(wire1[(5'h13):(4'hc)]) ?
                      wire13[(1'h1):(1'h0)] : (~&(^~(^wire79)))));
  assign wire82 = ($signed(($unsigned((wire5 >= wire5)) ?
                          $signed(wire11) : reg9[(4'hb):(1'h0)])) ?
                      {{((reg9 + wire81) ? (~^wire81) : wire12[(1'h0):(1'h0)])},
                          $signed({wire14[(2'h2):(1'h1)], reg7})} : (8'hb1));
  always
    @(posedge clk) begin
      if ((^~(8'ha0)))
        begin
          if ($signed($signed($unsigned((~|$signed(reg7))))))
            begin
              reg83 <= ({wire82} ?
                  (($unsigned($signed(reg8)) ?
                      ($signed((8'hb7)) << (!wire13)) : ((wire11 <<< wire0) ?
                          $unsigned(reg8) : (wire0 >>> wire82))) & $signed($unsigned((|wire5)))) : reg10);
              reg84 <= $unsigned(((+$unsigned({reg83, reg6})) ?
                  ($unsigned((wire12 && reg83)) ?
                      (reg10[(3'h5):(2'h3)] ?
                          (reg83 ? (8'hb4) : wire11) : (reg10 ?
                              reg8 : wire0)) : $unsigned($unsigned(wire81))) : (7'h41)));
            end
          else
            begin
              reg83 <= ((wire12[(3'h5):(2'h3)] ?
                      $signed(((reg6 + reg10) ?
                          (|wire12) : reg7[(2'h2):(2'h2)])) : wire0) ?
                  (~|wire4[(3'h4):(2'h3)]) : {wire11[(3'h5):(1'h1)]});
              reg84 <= {{$signed(reg8[(4'hd):(4'ha)]),
                      $unsigned($signed($signed(wire5)))},
                  ($unsigned(($unsigned(wire81) ?
                          (&wire5) : (reg9 ^~ wire79))) ?
                      (~&(-wire81[(1'h1):(1'h1)])) : $signed((wire3 ?
                          {(8'h9e)} : (^~wire3))))};
              reg85 <= ($signed(wire4) + $unsigned($signed(((reg9 << wire1) << $unsigned(wire79)))));
            end
        end
      else
        begin
          reg83 <= reg7[(1'h0):(1'h0)];
        end
    end
  assign wire86 = $signed(wire2[(2'h2):(1'h0)]);
endmodule

module module15
#(parameter param77 = {(((~&((8'h9c) ? (8'hb4) : (8'ha2))) ? ((~&(8'h9f)) ? (~|(8'haf)) : ((8'hab) ^ (8'ha3))) : (((8'hba) ? (8'ha6) : (8'hb7)) ? {(8'hb0)} : ((8'ha0) ? (8'h9f) : (8'h9e)))) ? (8'h9f) : ((&(~|(8'ha5))) <= (((8'hb2) ? (8'hb5) : (8'h9c)) ? {(8'ha4)} : ((8'ha0) ? (8'ha5) : (8'ha1))))), ((((8'had) >>> ((8'hb4) ? (8'hbc) : (8'hb2))) ? ((~&(8'ha1)) ? (8'hb8) : (+(8'ha5))) : (((8'ha9) != (8'ha4)) ? {(8'hbe), (8'hbd)} : {(8'ha4)})) >>> ((~&(!(7'h43))) ^~ (((8'h9f) ? (7'h44) : (8'ha7)) ? (8'hb1) : ((8'ha9) < (8'ha3)))))}, 
parameter param78 = ({(((param77 ? (8'hb8) : param77) ? {param77, param77} : param77) ? ({param77, param77} == ((8'hb8) == param77)) : param77)} ? (param77 ? {(!(param77 ~^ param77))} : (((^~param77) ? (^~(8'hbd)) : {param77}) ~^ ((^~param77) || (~&param77)))) : (~|((((8'hba) ? param77 : (8'hb0)) > (param77 ~^ (8'ha1))) ? (param77 ? (~|param77) : ((8'hbb) - param77)) : (^~(param77 ? param77 : param77))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire19;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire39;
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  assign y = {wire75,
                 wire50,
                 wire49,
                 wire48,
                 wire39,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= $unsigned($unsigned((wire17 ?
          wire18 : ((wire16 ^ wire16) >> (wire19 ? wire16 : (8'hac))))));
      if ((-$signed((8'hae))))
        begin
          reg21 <= ($signed(((wire17 ~^ $unsigned((8'ha1))) < {(wire17 ?
                  wire17 : (8'haf)),
              $signed(wire16)})) > (($unsigned({reg20, wire18}) ?
                  (wire16 ?
                      $signed(wire17) : (wire19 ?
                          reg20 : wire19)) : ((+wire19) ?
                      wire16 : $unsigned(reg20))) ?
              {($unsigned((8'ha6)) ? wire16 : wire16), wire18} : (+{wire19,
                  (wire16 ^ wire16)})));
          reg22 <= $unsigned((~$unsigned(({(8'hb9), reg21} << wire19))));
          reg23 <= $unsigned(reg20[(3'h7):(2'h3)]);
          if ($unsigned(reg22[(1'h1):(1'h1)]))
            begin
              reg24 <= (wire18[(1'h1):(1'h1)] >>> $unsigned($signed(wire19)));
              reg25 <= reg21;
              reg26 <= wire18;
            end
          else
            begin
              reg24 <= reg23[(4'hc):(2'h2)];
              reg25 <= {$unsigned(wire17[(2'h3):(1'h0)])};
              reg26 <= {$signed(reg23[(4'hb):(1'h0)])};
              reg27 <= reg21[(2'h3):(2'h2)];
              reg28 <= wire19[(1'h1):(1'h0)];
            end
          reg29 <= reg26;
        end
      else
        begin
          reg21 <= {reg27};
        end
      reg30 <= $signed($signed((~|reg24[(3'h7):(3'h7)])));
      reg31 <= (~&$signed((reg20 ?
          wire17[(2'h3):(2'h3)] : (^(reg20 ? wire16 : reg30)))));
      if ({reg30})
        begin
          reg32 <= reg30[(2'h3):(2'h2)];
          if (reg24)
            begin
              reg33 <= reg24[(4'h8):(3'h7)];
              reg34 <= $unsigned(wire17[(2'h3):(2'h2)]);
            end
          else
            begin
              reg33 <= $signed({reg32[(1'h1):(1'h1)],
                  $signed($signed($signed((8'hb9))))});
            end
          reg35 <= $signed(($unsigned(wire17) ? wire17 : $signed({reg24})));
          if (((reg26 * (+reg25[(4'ha):(4'ha)])) ?
              ((($unsigned(reg28) ^ (8'ha1)) ?
                      (~(reg33 <= (7'h41))) : (!reg34)) ?
                  reg30[(4'ha):(4'ha)] : $unsigned(wire18)) : reg22))
            begin
              reg36 <= {$unsigned($unsigned($signed($unsigned(reg32))))};
              reg37 <= {($signed($unsigned($unsigned((8'hbe)))) & ((wire17[(1'h1):(1'h0)] ~^ reg20) ~^ reg32[(4'hd):(4'hb)]))};
              reg38 <= wire16;
            end
          else
            begin
              reg36 <= (~(!(~(8'hb7))));
            end
        end
      else
        begin
          reg32 <= (7'h44);
          reg33 <= $signed(reg31);
          reg34 <= ($unsigned(reg25[(3'h7):(3'h7)]) ?
              $signed($signed($signed($unsigned(reg34)))) : (-$signed({$unsigned(reg33)})));
          reg35 <= reg35;
        end
    end
  assign wire39 = (reg34 ?
                      $signed(((+$signed((8'ha3))) * reg20[(4'h9):(3'h4)])) : (^~wire16[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg40 <= $unsigned({$signed({$unsigned(reg33)}),
          $signed(((reg31 != wire17) >> reg31[(2'h3):(1'h0)]))});
      if (reg23)
        begin
          reg41 <= (reg23 ? (^(^$signed(((8'hb8) >> reg20)))) : reg27);
        end
      else
        begin
          reg41 <= ($unsigned(reg24) ?
              $signed(wire18[(1'h1):(1'h0)]) : {$unsigned(reg28),
                  ($unsigned(((7'h41) * reg34)) << ({reg41,
                      reg31} * reg38[(4'h8):(3'h5)]))});
        end
      reg42 <= $signed(reg25[(2'h3):(2'h3)]);
      if ((((reg35[(1'h1):(1'h1)] ?
              (~^(reg32 * reg35)) : reg23[(4'h8):(2'h3)]) + reg33) ?
          ($unsigned(wire39[(4'h9):(3'h7)]) == (((~reg30) << wire18[(1'h0):(1'h0)]) - $unsigned({reg27,
              reg40}))) : wire19))
        begin
          reg43 <= $signed($unsigned(wire18));
          reg44 <= (|$unsigned(($signed((8'hb3)) ?
              (^(reg25 <<< wire16)) : (~^(reg40 <<< (8'hb4))))));
          if ({(8'hb1)})
            begin
              reg45 <= (8'ha9);
              reg46 <= (reg33 > $unsigned($signed((wire17[(2'h2):(1'h1)] ^~ (reg22 ^~ reg34)))));
            end
          else
            begin
              reg45 <= reg35;
              reg46 <= $unsigned($signed(reg21[(4'ha):(4'h8)]));
              reg47 <= ((^(!reg40[(1'h0):(1'h0)])) ?
                  reg40[(2'h3):(2'h3)] : $signed((~$unsigned($unsigned(reg31)))));
            end
        end
      else
        begin
          reg43 <= reg40;
        end
    end
  assign wire48 = ($signed($signed(wire39[(3'h5):(3'h4)])) ?
                      $signed(((^reg45) >> reg24[(4'h9):(3'h6)])) : (($signed((~^reg34)) * reg25) ?
                          $signed(((wire16 ?
                              (8'hb9) : reg22) ^~ reg21)) : $signed(reg20)));
  assign wire49 = $unsigned(reg35[(4'h9):(2'h2)]);
  assign wire50 = (&((!(reg30[(3'h7):(1'h1)] < wire49)) >> reg25));
  module51 #() modinst76 (wire75, clk, reg44, reg26, reg43, reg30);
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire55;
  input wire signed [(3'h5):(1'h0)] wire54;
  input wire signed [(4'hc):(1'h0)] wire53;
  input wire signed [(5'h12):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire [(4'h9):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire56;
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg65,
                 (1'h0)};
  assign wire56 = {(wire53 ?
                          ({(^~wire52), (^~wire54)} ?
                              (!{wire54,
                                  wire52}) : ($unsigned(wire55) < (~wire52))) : (&(~&(wire54 ?
                              wire55 : wire52)))),
                      $unsigned((^((|wire53) ?
                          wire52[(4'hc):(4'h9)] : $unsigned(wire52))))};
  assign wire57 = $unsigned($signed((wire54[(2'h3):(1'h1)] ?
                      ({wire55} < (+wire54)) : ($unsigned(wire55) && {wire56,
                          wire53}))));
  assign wire58 = ($unsigned((wire53 ?
                      $signed(wire55) : (((8'ha5) <<< (8'hbf)) ?
                          wire56[(3'h4):(1'h1)] : wire54[(1'h0):(1'h0)]))) ~^ wire55[(4'he):(1'h0)]);
  assign wire59 = (8'hac);
  assign wire60 = ({$signed(wire55[(4'hf):(1'h1)])} + (!($signed((wire57 <<< wire58)) ?
                      wire56[(3'h5):(2'h2)] : (wire53[(3'h6):(2'h3)] << (wire54 ?
                          wire57 : wire53)))));
  assign wire61 = ((((^wire58) ?
                          wire57[(1'h0):(1'h0)] : wire58) >> (!$unsigned((wire56 ?
                          wire52 : wire56)))) ?
                      $unsigned(wire54[(3'h5):(2'h3)]) : wire57);
  assign wire62 = wire52;
  assign wire63 = (~&$unsigned((8'h9d)));
  assign wire64 = wire52[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg65 <= (wire53 ~^ $signed({{{wire58, wire63}}, (|$signed(wire58))}));
    end
  assign wire66 = (~&(+$signed({$signed((8'hbc))})));
  assign wire67 = wire54[(2'h3):(1'h0)];
  assign wire68 = (wire61[(3'h7):(3'h7)] ?
                      wire63[(1'h1):(1'h0)] : (^((^(wire55 ?
                          wire54 : (8'ha0))) != $unsigned((wire61 ~^ wire60)))));
  assign wire69 = (~|(wire53[(4'hc):(3'h6)] ?
                      ((^wire54) ?
                          wire55[(3'h7):(3'h6)] : ((8'ha4) ?
                              $signed(wire64) : $signed(wire58))) : ({(-wire66),
                          $signed(wire61)} & ($unsigned((8'hb8)) ?
                          wire60 : {wire54}))));
  assign wire70 = wire54;
  assign wire71 = $signed(wire68[(1'h1):(1'h0)]);
  assign wire72 = $signed($signed(wire71));
  assign wire73 = (((wire67 | wire52) ?
                      {wire72[(1'h1):(1'h0)], wire55[(4'he):(3'h5)]} : (wire58 ?
                          $signed(wire70[(2'h3):(2'h3)]) : wire56)) ~^ wire64[(3'h4):(3'h4)]);
  assign wire74 = (~|((8'hbf) ? wire56 : (~(^~wire66))));
endmodule
