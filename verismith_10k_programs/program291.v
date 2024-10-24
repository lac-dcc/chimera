module top #(parameter param104 = (8'hb6)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire92;
  wire signed [(4'h8):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire89;
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire92,
                 wire91,
                 wire4,
                 wire5,
                 wire6,
                 wire89,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire4 = {$unsigned($signed((&wire1[(4'h9):(3'h5)]))),
                     ({(~^$unsigned(wire0))} < $signed($signed(wire0[(2'h2):(1'h0)])))};
  assign wire5 = wire0;
  assign wire6 = {($unsigned(wire3[(1'h0):(1'h0)]) ?
                         ((+((8'hb2) > wire2)) - wire3) : $unsigned({$signed((8'hab)),
                             wire3}))};
  module7 #() modinst90 (.wire9(wire2), .wire12(wire6), .wire10(wire3), .clk(clk), .wire8(wire0), .y(wire89), .wire11(wire4));
  assign wire91 = wire1;
  assign wire92 = ({($unsigned($signed((8'hb3))) ?
                              wire4 : wire91[(1'h0):(1'h0)]),
                          wire4} ?
                      ($signed($unsigned((+wire89))) ?
                          (^~wire2[(5'h14):(5'h14)]) : $unsigned(((+wire2) ?
                              $signed(wire5) : (wire2 ?
                                  wire4 : wire6)))) : wire5[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg93 <= (|$signed({$unsigned((+(8'ha7)))}));
      reg94 <= wire92;
      reg95 <= {wire92[(4'ha):(3'h6)]};
    end
  always
    @(posedge clk) begin
      reg96 <= wire3;
      reg97 <= $signed({wire2[(4'h8):(3'h6)], wire89[(3'h4):(3'h4)]});
    end
  assign wire98 = wire4;
  assign wire99 = $unsigned($signed((^~wire5)));
  assign wire100 = ((wire3 ?
                       {reg94[(1'h1):(1'h0)]} : wire0[(1'h1):(1'h0)]) ~^ $signed((^~$unsigned((8'haa)))));
  assign wire101 = $signed((-wire91[(3'h7):(3'h6)]));
  assign wire102 = $unsigned($signed($unsigned({reg95[(3'h6):(3'h6)], reg94})));
  assign wire103 = (reg97[(2'h2):(1'h1)] ^~ {$unsigned(((^wire101) ?
                           {(8'hae), reg93} : $unsigned((8'ha3))))});
endmodule

module module7
#(parameter param87 = {{(^{(~|(8'hba))})}, ((((&(8'hba)) * ((8'hb3) ? (8'hac) : (8'hbe))) << (&((7'h42) ? (8'hb2) : (8'hba)))) ? ((^~((8'haf) ? (8'hb9) : (8'hb5))) && (((8'ha7) ? (8'hb5) : (8'ha4)) ? ((8'haa) ? (8'haf) : (8'h9f)) : ((8'had) > (8'haa)))) : (^~(((8'hbd) >>> (8'ha1)) | {(8'ha0), (8'hb3)})))}, 
parameter param88 = ({((~(^param87)) ? ((param87 ? param87 : param87) ? param87 : (!param87)) : (param87 ? {param87} : (~^param87)))} <= (({(8'hb2), param87} ? ((~param87) ? (!(8'hb2)) : {param87}) : (~|(-param87))) ^~ ({(+param87), {(8'haa), param87}} + param87))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire13;
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire83,
                 wire18,
                 wire13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire13 = {(!wire10)};
  always
    @(posedge clk) begin
      if ((&wire9))
        begin
          if (wire10)
            begin
              reg14 <= $signed((wire13 ? (~^wire12[(2'h3):(2'h2)]) : wire9));
            end
          else
            begin
              reg14 <= wire10;
              reg15 <= $signed(wire9[(4'hc):(4'h9)]);
              reg16 <= $signed($signed({wire12}));
            end
        end
      else
        begin
          reg14 <= $signed($unsigned($unsigned(wire10[(1'h0):(1'h0)])));
          reg15 <= (+(($signed(wire10) - (7'h41)) ^ (reg16[(3'h6):(3'h5)] || (8'ha6))));
        end
      reg17 <= (8'hac);
    end
  assign wire18 = (reg16 ^ $signed($unsigned(((wire12 <= reg15) ?
                      (&wire8) : (~|reg17)))));
  module19 #() modinst84 (wire83, clk, wire10, reg16, wire12, wire13, wire9);
  assign wire85 = (($unsigned($unsigned((&wire11))) * wire10[(4'h9):(1'h0)]) != $unsigned(((~&$unsigned(wire13)) ?
                      $unsigned($signed(wire83)) : $signed($unsigned(reg15)))));
  assign wire86 = $unsigned((|wire12[(4'h9):(1'h1)]));
endmodule

module module19
#(parameter param82 = (((^(!((8'ha5) ? (8'ha5) : (8'ha7)))) ? ((~&(8'hbc)) && (~|{(7'h44), (8'haa)})) : {(((8'hb7) <<< (8'hbb)) - ((8'hb1) | (8'hbd)))}) ~^ ((8'ha0) ? (~^((&(7'h40)) ? ((7'h44) - (7'h42)) : (^~(8'ha2)))) : ((((8'ha8) > (8'hba)) ~^ (!(8'ha0))) ? {{(8'hb8), (7'h42)}} : (&{(8'haf)})))))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h2aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire21;
  input wire signed [(4'ha):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire53;
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire71,
                 wire70,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire23)
        begin
          if ((+{$signed($signed((wire23 ? wire20 : wire24))), wire21}))
            begin
              reg25 <= $signed(wire21[(4'hb):(4'h9)]);
            end
          else
            begin
              reg25 <= (|(~$signed($signed(reg25))));
              reg26 <= reg25;
              reg27 <= $unsigned(wire22[(4'h9):(2'h3)]);
              reg28 <= (((!($unsigned(wire24) ?
                      (reg26 ?
                          wire22 : reg25) : (+wire24))) * (($unsigned((8'h9c)) >= $unsigned(reg27)) ?
                      (8'hbe) : (+wire20))) ?
                  $signed((reg27[(4'he):(3'h6)] >= wire23)) : wire20[(3'h7):(3'h5)]);
            end
          reg29 <= (~^((((wire21 - reg27) ?
              (^wire23) : (wire21 ?
                  (8'hab) : wire20)) * $unsigned((wire21 | wire20))) >= (~reg25)));
          if (reg27)
            begin
              reg30 <= $unsigned((|$unsigned((~^reg29))));
              reg31 <= reg29;
            end
          else
            begin
              reg30 <= {((((wire21 > (8'hbe)) ^~ reg25) ?
                          reg29 : $signed(wire24[(1'h0):(1'h0)])) ?
                      reg29 : reg27[(4'hb):(4'ha)]),
                  wire21[(4'h8):(3'h4)]};
              reg31 <= ($unsigned($signed(($unsigned(reg30) <<< $unsigned(reg28)))) ?
                  (^~wire20[(1'h0):(1'h0)]) : ((wire22[(1'h0):(1'h0)] > $unsigned((reg28 ?
                          (8'hbe) : wire21))) ?
                      $unsigned(reg28[(3'h6):(2'h3)]) : wire20[(3'h5):(2'h2)]));
              reg32 <= reg30[(3'h6):(2'h3)];
              reg33 <= reg30;
              reg34 <= ($unsigned({$unsigned((reg25 ? wire21 : reg31))}) ?
                  $unsigned(((wire23[(4'hb):(3'h6)] == {reg25}) < $signed($signed((8'ha1))))) : ($signed((~&$signed(reg33))) ~^ $signed(reg33)));
            end
          if ($unsigned($signed((wire20 ?
              ($unsigned(reg28) ^~ $signed(reg30)) : (reg25 > $signed((8'ha3)))))))
            begin
              reg35 <= $unsigned({(($signed((8'hb2)) > wire21) ?
                      ((wire24 || reg27) < (+reg30)) : {reg29[(3'h5):(3'h4)]}),
                  {(reg30[(2'h3):(1'h0)] ? (reg25 & (8'ha9)) : $signed(wire20)),
                      $unsigned($signed((8'ha3)))}});
              reg36 <= {wire24};
              reg37 <= (^~$signed($unsigned($unsigned(wire20[(2'h2):(2'h2)]))));
              reg38 <= (^(|wire22));
            end
          else
            begin
              reg35 <= $signed($unsigned($signed(($signed(reg33) ~^ $unsigned(reg27)))));
              reg36 <= (~$unsigned($unsigned($unsigned(((8'ha9) ?
                  reg33 : reg25)))));
            end
          if ($signed(((reg37[(1'h0):(1'h0)] <<< $unsigned($unsigned(reg29))) ?
              reg26 : $signed(reg32))))
            begin
              reg39 <= $unsigned(wire20);
              reg40 <= (|reg34[(3'h5):(2'h3)]);
              reg41 <= ($unsigned(reg31) ^~ (+reg36[(3'h6):(3'h4)]));
            end
          else
            begin
              reg39 <= (($unsigned((reg26 && wire24)) ?
                      (reg33 != $signed((|wire24))) : wire21) ?
                  ((reg26[(4'hb):(3'h5)] ?
                          (reg36[(1'h0):(1'h0)] ?
                              wire20[(4'h8):(1'h1)] : reg25[(3'h6):(2'h3)]) : reg26) ?
                      (($unsigned(reg41) - (reg32 & (7'h40))) <<< {(-reg39),
                          (reg29 - wire21)}) : (!(!(reg26 | reg32)))) : $signed((((wire20 >> (8'ha1)) ?
                      {reg28} : (7'h43)) >> (+(^reg29)))));
              reg40 <= $unsigned($signed($unsigned(wire20[(2'h2):(2'h2)])));
              reg41 <= $signed(reg34);
              reg42 <= $signed({wire20[(1'h0):(1'h0)]});
              reg43 <= {(reg33 ? reg39[(3'h7):(3'h4)] : reg38)};
            end
        end
      else
        begin
          reg25 <= (8'hbf);
          reg26 <= (-($unsigned(reg25) ^ reg37[(3'h4):(1'h1)]));
          reg27 <= (-$signed(reg32));
          if ((reg29 ? reg25 : (~^$unsigned($unsigned($signed(reg42))))))
            begin
              reg28 <= ((((reg29[(4'he):(4'hd)] - $unsigned((8'ha3))) ?
                          wire24[(3'h6):(1'h0)] : (~&reg41)) ?
                      (reg37[(2'h2):(1'h0)] ?
                          (-reg25[(4'he):(2'h2)]) : {(8'haf),
                              ((8'ha7) ? reg27 : reg41)}) : (^reg36)) ?
                  reg32 : (|$unsigned($unsigned(wire23))));
              reg29 <= $unsigned(({(reg34[(3'h4):(1'h1)] ^ wire20),
                      ($signed(reg38) >> $unsigned(reg43))} ?
                  $unsigned($unsigned(reg26[(2'h2):(1'h0)])) : reg30[(1'h0):(1'h0)]));
              reg30 <= ({reg42} ?
                  $unsigned($unsigned(($unsigned(reg32) < $signed(reg33)))) : $unsigned(($unsigned({reg41,
                          wire23}) ?
                      $signed($unsigned(reg29)) : wire21[(4'ha):(4'ha)])));
              reg31 <= reg31[(3'h6):(1'h1)];
              reg32 <= ($signed(reg42[(4'ha):(4'ha)]) >>> reg34);
            end
          else
            begin
              reg28 <= (($unsigned((~&(reg37 & reg29))) ?
                  reg40 : ((^$unsigned(reg37)) ?
                      ($unsigned(reg30) ?
                          (reg25 < reg25) : (&reg27)) : ((reg38 ?
                              reg42 : reg32) ?
                          $unsigned((8'h9f)) : (~^wire22)))) && reg39);
              reg29 <= {(8'hbd)};
              reg30 <= $unsigned({reg33});
              reg31 <= ((&{((reg28 * reg32) << {wire22}),
                  ({wire21} ^~ $signed((8'hbd)))}) > (reg34[(3'h4):(1'h1)] ?
                  $signed(reg35[(1'h1):(1'h1)]) : (+{$unsigned(reg30),
                      (|reg35)})));
            end
        end
      reg44 <= ($signed(wire24[(4'h8):(2'h2)]) ?
          (wire23[(4'hf):(1'h1)] ?
              $signed((|(reg32 < wire24))) : $unsigned((8'ha6))) : $unsigned($unsigned(reg39[(1'h0):(1'h0)])));
      if ($signed($signed((8'hbc))))
        begin
          reg45 <= ((reg28 ?
              (($signed(reg41) != $unsigned(reg25)) | ((!(8'hac)) ?
                  wire24 : $unsigned((8'ha1)))) : wire20) <= $signed($signed(wire20)));
          reg46 <= reg31;
          reg47 <= ($signed($unsigned((-$signed((8'haa))))) + reg42[(3'h7):(2'h2)]);
          reg48 <= (~(reg35 ? wire24 : $signed(reg38)));
          if (reg29[(4'hd):(2'h3)])
            begin
              reg49 <= (&reg36);
              reg50 <= {$signed($unsigned((~|reg47[(1'h1):(1'h1)]))),
                  (({reg32[(2'h3):(2'h2)]} - (reg38 << (reg49 - (8'ha5)))) < (((reg45 ^~ (8'h9f)) ?
                      $unsigned(reg42) : (reg39 ?
                          reg26 : reg34)) >= $unsigned($unsigned(reg28))))};
              reg51 <= ((~|(~($unsigned(reg28) << (reg31 ?
                  reg31 : reg27)))) <= reg28[(1'h1):(1'h0)]);
            end
          else
            begin
              reg49 <= (~^$signed((reg47[(4'hb):(3'h7)] | reg47[(4'h9):(1'h0)])));
              reg50 <= reg48;
              reg51 <= reg51[(3'h4):(1'h0)];
            end
        end
      else
        begin
          reg45 <= $unsigned($unsigned({($unsigned(reg30) ? reg28 : {(8'ha8)}),
              reg35}));
          reg46 <= ($unsigned((7'h43)) ?
              reg51[(4'hb):(2'h3)] : ((wire23[(5'h10):(4'ha)] ?
                      (~&(wire24 ?
                          reg37 : (8'ha7))) : $signed((reg44 != reg48))) ?
                  (((reg46 ^~ reg35) ?
                      {(8'hb2),
                          reg48} : (+reg51)) <= $signed((+reg47))) : $unsigned({(^~(8'hbc))})));
          reg47 <= reg44[(3'h4):(2'h2)];
          reg48 <= {$unsigned($unsigned((+(reg40 ? reg47 : reg46))))};
          reg49 <= reg37[(3'h7):(3'h6)];
        end
      reg52 <= $unsigned((($unsigned(reg38[(3'h7):(2'h2)]) - {(reg45 + reg26)}) + $unsigned($signed(reg44))));
    end
  assign wire53 = (&{$signed(($signed(reg41) ? reg27 : reg35[(4'h8):(3'h7)])),
                      (wire23 <<< {(wire20 | wire20)})});
  assign wire54 = ((reg42 || ($signed((!wire23)) ?
                      ((+reg26) ?
                          (&reg29) : (|reg33)) : reg27)) | reg47[(4'ha):(4'h8)]);
  assign wire55 = reg32[(1'h0):(1'h0)];
  assign wire56 = (^$unsigned(((reg40[(3'h5):(2'h2)] == reg41) <<< (~(!reg40)))));
  assign wire57 = {reg44, wire21};
  assign wire58 = (|$unsigned($unsigned(($signed(reg32) ?
                      $signed(reg26) : $signed(reg39)))));
  always
    @(posedge clk) begin
      reg59 <= {(&{{{reg50}, $unsigned((8'hbb))}})};
      reg60 <= ((-(reg40 ?
              wire54[(4'h8):(3'h6)] : $unsigned(((8'haa) ?
                  (8'hbc) : (8'hbc))))) ?
          {{((~reg41) * $unsigned(wire58))}} : $unsigned($unsigned(($unsigned(reg31) && $signed(reg32)))));
      reg61 <= reg51;
      if (($unsigned({reg49}) || ($signed($unsigned(reg59[(1'h1):(1'h0)])) ?
          ((~|reg59[(2'h2):(2'h2)]) + {wire24[(1'h0):(1'h0)]}) : reg50)))
        begin
          reg62 <= reg38;
          reg63 <= (~(~(~(~$unsigned(reg45)))));
          reg64 <= $unsigned(((7'h41) ?
              $unsigned((((8'ha4) ? reg29 : wire56) ?
                  (~|reg60) : (8'hbe))) : reg43[(1'h0):(1'h0)]));
        end
      else
        begin
          if (reg26)
            begin
              reg62 <= (reg61[(3'h4):(2'h2)] >>> $unsigned(reg26[(2'h2):(2'h2)]));
            end
          else
            begin
              reg62 <= ((|(~(!(^~reg29)))) ? reg44 : wire58);
              reg63 <= $signed((~^((reg26[(3'h4):(3'h4)] ?
                      wire53 : $unsigned(reg60)) ?
                  (reg44 ?
                      (8'hb2) : (wire55 ?
                          reg31 : wire56)) : (&$unsigned(reg47)))));
              reg64 <= (^$signed($signed($unsigned(wire23[(5'h10):(1'h1)]))));
              reg65 <= {((8'had) <<< (+(~reg62[(4'h9):(3'h7)]))),
                  $signed(reg61[(4'ha):(4'h9)])};
            end
          reg66 <= $unsigned(($signed((wire23 ?
              $unsigned(reg26) : (wire20 || (8'ha0)))) >> reg26));
          reg67 <= reg66[(1'h1):(1'h0)];
          reg68 <= $unsigned((|{reg62[(3'h7):(1'h0)]}));
        end
      reg69 <= {reg42[(4'ha):(4'h8)]};
    end
  assign wire70 = ((reg40[(3'h4):(1'h0)] ?
                          $signed((wire55[(1'h1):(1'h0)] ?
                              (reg68 ^ (7'h42)) : (-reg47))) : $signed((~^(|reg34)))) ?
                      ((+(7'h41)) ?
                          ((reg40 >>> (wire23 ?
                              reg37 : (8'hab))) > $unsigned($signed(reg33))) : (|(~^reg65))) : reg50);
  assign wire71 = (8'ha5);
  always
    @(posedge clk) begin
      if ($signed((~$signed(((~(8'ha3)) ? wire58 : reg61[(1'h1):(1'h0)])))))
        begin
          if ($signed((8'hbe)))
            begin
              reg72 <= (+(~{$signed(reg25[(2'h2):(1'h0)]),
                  ($signed(wire23) ? $unsigned(reg47) : (8'ha0))}));
              reg73 <= (&reg36[(4'h8):(2'h3)]);
            end
          else
            begin
              reg72 <= ((({$unsigned(wire21),
                  reg28} || reg48) < $signed($unsigned((reg28 ?
                  reg65 : (8'ha4))))) ^ $unsigned({reg32[(1'h0):(1'h0)]}));
              reg73 <= (reg36 > reg41[(4'hd):(4'h8)]);
              reg74 <= $unsigned($signed(reg39[(3'h7):(2'h3)]));
            end
          reg75 <= $unsigned($signed($signed(((8'hb5) <= (reg29 ?
              reg28 : reg67)))));
        end
      else
        begin
          if (reg47[(4'h9):(2'h3)])
            begin
              reg72 <= $unsigned($signed((((8'hb1) * $unsigned(reg25)) ?
                  $unsigned((&(8'hb3))) : (reg74 != $unsigned(reg60)))));
              reg73 <= ((~&({(^~wire22), (~&reg52)} <<< ((+wire24) >>> (wire23 ?
                      reg29 : reg60)))) ?
                  (~&($signed($unsigned(wire53)) >= (&$unsigned(wire70)))) : ((8'h9f) ?
                      reg60 : (|((wire54 ? reg31 : wire20) ?
                          $unsigned(reg72) : {reg75, reg65}))));
            end
          else
            begin
              reg72 <= $unsigned($signed(wire54));
              reg73 <= $unsigned((wire53 & {((wire20 > wire21) < (wire24 - wire23))}));
              reg74 <= wire70[(1'h1):(1'h0)];
            end
        end
      reg76 <= $unsigned($signed($unsigned((reg26[(4'hf):(4'hd)] ?
          $unsigned(wire23) : reg26))));
      reg77 <= ({(reg49 ? (~^$unsigned(wire55)) : reg50),
          reg63} | ($signed(reg37) << (reg43[(3'h5):(2'h2)] ?
          ((reg28 << reg74) ^~ wire71) : reg29)));
    end
  always
    @(posedge clk) begin
      reg78 <= $signed(reg45);
    end
  always
    @(posedge clk) begin
      reg79 <= $signed((~wire22));
    end
  assign wire80 = wire21;
  assign wire81 = reg36[(3'h5):(1'h0)];
endmodule
