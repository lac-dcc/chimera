module top
#(parameter param118 = (&(((((7'h43) || (8'hbd)) ? ((7'h41) ? (8'hb6) : (8'h9e)) : {(8'hba), (8'h9c)}) * (((8'hac) * (8'hb0)) ~^ ((8'ha6) || (8'hb8)))) ? ((8'haf) ? (8'hab) : (((8'hb7) ? (8'hb4) : (8'ha0)) ? (~|(8'hbc)) : ((7'h42) >> (8'hbe)))) : {(^(8'haf))})), 
parameter param119 = (param118 | {((param118 > (~&(8'ha6))) ? param118 : ((8'hb1) && param118)), (!param118)}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h296):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire94;
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire117,
                 wire96,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire33,
                 wire94,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg34,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(($signed((~wire3)) ?
          wire3 : $signed(((wire3 ^~ wire0) < (8'h9d)))));
      reg6 <= ($signed(wire2) ?
          (((-$signed(wire4)) * ($unsigned((8'hb0)) <<< wire1[(4'h8):(1'h0)])) >>> wire2) : (&($signed(wire0[(4'hb):(2'h2)]) ^ wire0)));
      reg7 <= ($unsigned((wire2 ?
              {$signed(wire3),
                  (wire0 ?
                      wire3 : (8'haa))} : $unsigned(wire2[(5'h10):(2'h3)]))) ?
          ((wire4[(2'h3):(1'h1)] > ($unsigned(wire1) ?
              wire4[(3'h6):(2'h2)] : $unsigned(wire2))) <= (~^(-wire2[(4'hc):(4'hb)]))) : reg5);
    end
  assign wire8 = $unsigned($unsigned($unsigned(reg5[(2'h2):(1'h1)])));
  assign wire9 = $signed($signed(wire8[(4'h9):(3'h6)]));
  assign wire10 = (wire9 ?
                      $unsigned($unsigned((wire3 <<< (8'haa)))) : (reg6 ?
                          {$signed((7'h41))} : $unsigned($unsigned((reg5 || reg6)))));
  assign wire11 = reg5[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg12 <= (reg7 ?
          $signed(wire3[(1'h0):(1'h0)]) : (~|$signed(wire2[(4'h9):(4'h9)])));
      reg13 <= (|(^(!$signed(reg5[(1'h0):(1'h0)]))));
      reg14 <= (|$unsigned(((8'h9e) ?
          wire9[(2'h2):(1'h0)] : (wire8[(2'h3):(2'h3)] || (wire2 ?
              wire2 : wire2)))));
      reg15 <= wire4;
      if (reg12)
        begin
          reg16 <= (~^$signed($unsigned((~|{reg13, reg12}))));
          if ({wire11})
            begin
              reg17 <= $unsigned($signed((&wire2)));
              reg18 <= (~&wire3[(1'h0):(1'h0)]);
              reg19 <= ((wire10 ?
                      wire11 : $unsigned(((wire9 ^~ wire9) && $unsigned(reg7)))) ?
                  ((reg17[(1'h0):(1'h0)] ?
                      $unsigned($signed((8'haa))) : ((wire1 <<< reg18) ?
                          wire3 : (reg17 != (8'hb4)))) ^ (8'hbb)) : reg5[(3'h6):(3'h6)]);
              reg20 <= (reg15 ?
                  (reg18 || $unsigned((~|reg6))) : ($unsigned($signed((~wire9))) - $unsigned($signed((reg12 ?
                      reg5 : wire1)))));
            end
          else
            begin
              reg17 <= {reg12[(1'h1):(1'h0)],
                  $unsigned((((wire9 ? reg12 : reg13) << $signed(reg13)) ?
                      (~&(reg17 ?
                          wire3 : reg20)) : ($signed(wire10) & (-wire11))))};
            end
          reg21 <= reg18;
          reg22 <= ($unsigned(wire9[(4'ha):(4'h8)]) != (^(((~|wire8) ^~ reg15[(2'h3):(1'h1)]) != (!{(8'hb2)}))));
          if ((((&(8'haa)) ?
                  $signed(($signed(wire8) + reg15[(3'h4):(2'h3)])) : $unsigned(($signed((8'hbe)) > {reg15,
                      wire4}))) ?
              (^~$signed((wire9 < ((8'hb8) ?
                  wire2 : reg12)))) : $signed($unsigned(($unsigned(wire8) && $signed(wire2))))))
            begin
              reg23 <= ($unsigned(($signed((reg16 ?
                  wire0 : reg16)) * wire1[(4'ha):(4'ha)])) ^ ($signed({reg17}) <<< ({reg6,
                  $unsigned(reg20)} << {{reg20}, (wire11 ? (8'ha0) : wire3)})));
              reg24 <= wire1;
              reg25 <= reg21;
              reg26 <= reg19[(2'h3):(1'h0)];
            end
          else
            begin
              reg23 <= (reg18[(1'h1):(1'h0)] ?
                  wire1[(4'h8):(1'h0)] : $signed(((((8'ha7) || reg5) ?
                          reg25 : (+wire11)) ?
                      (^reg18[(2'h2):(1'h1)]) : reg12[(4'h8):(3'h7)])));
              reg24 <= reg12[(3'h7):(3'h7)];
              reg25 <= (-((wire3[(3'h5):(3'h4)] ?
                      {reg16, $unsigned(reg5)} : wire3) ?
                  wire11 : wire8));
              reg26 <= reg18[(4'ha):(1'h1)];
              reg27 <= (|reg18[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg16 <= (wire8[(2'h3):(2'h2)] ? (~|reg14) : reg26);
          reg17 <= $unsigned((-reg16[(4'h8):(2'h2)]));
          if (wire3)
            begin
              reg18 <= $signed($signed(reg26[(4'h9):(1'h0)]));
              reg19 <= (~&(reg15 ~^ ((((8'hbc) ? (8'ha0) : reg16) ?
                  (^~reg27) : {(8'ha4), reg14}) * {reg27[(2'h3):(1'h1)]})));
            end
          else
            begin
              reg18 <= $unsigned($unsigned($unsigned(reg6[(2'h3):(2'h2)])));
              reg19 <= ({(8'h9e)} >> wire3[(2'h3):(2'h3)]);
              reg20 <= ($unsigned({({reg15, wire1} == (+(8'hbe))),
                      ((reg5 ? reg20 : (7'h41)) <= $unsigned((8'h9e)))}) ?
                  {reg25} : reg27);
            end
          reg21 <= reg12[(4'h8):(2'h2)];
        end
    end
  always
    @(posedge clk) begin
      reg28 <= ($unsigned(wire3[(3'h4):(1'h0)]) ? $unsigned(wire11) : wire2);
      reg29 <= (reg20 < (8'hb7));
      reg30 <= $signed(($signed({reg22}) << ({(reg28 | (8'hb4))} ?
          (reg7 ? (wire0 > reg22) : (reg19 ~^ reg22)) : ($signed(wire10) ?
              (wire0 ? reg22 : wire8) : (reg28 == wire8)))));
      reg31 <= (($unsigned(((reg30 ? (8'hbe) : reg29) < ((8'ha8) ~^ reg26))) ?
              wire11[(1'h0):(1'h0)] : {$unsigned(reg21[(2'h2):(2'h2)])}) ?
          reg27 : wire9);
      reg32 <= $unsigned(({reg24} * {reg30[(1'h1):(1'h0)],
          wire3[(3'h4):(2'h3)]}));
    end
  assign wire33 = (8'hac);
  always
    @(posedge clk) begin
      reg34 <= $signed($signed(((~&$signed((8'hb7))) ? wire0 : wire1)));
    end
  module35 #() modinst95 (.wire37(reg15), .wire36(reg23), .wire40(wire8), .wire38(reg28), .y(wire94), .wire39(reg17), .clk(clk));
  assign wire96 = ($unsigned(wire11[(1'h0):(1'h0)]) < (|reg6[(4'hf):(4'ha)]));
  always
    @(posedge clk) begin
      if ($unsigned({(reg7[(4'hd):(1'h1)] ? reg34[(5'h12):(2'h2)] : reg18)}))
        begin
          reg97 <= wire10;
          reg98 <= {(reg18[(4'h9):(1'h0)] <= wire4[(4'hf):(2'h3)])};
          if ($signed(wire9[(3'h7):(1'h0)]))
            begin
              reg99 <= ($unsigned(({(wire4 ? reg23 : reg7), (+reg31)} ?
                  reg28 : ((wire2 ? wire96 : wire33) ?
                      wire8[(3'h5):(2'h2)] : $signed((8'hae))))) ^~ $unsigned(reg16));
            end
          else
            begin
              reg99 <= reg29;
              reg100 <= $signed(reg25);
            end
          reg101 <= reg23[(3'h4):(1'h1)];
        end
      else
        begin
          reg97 <= $unsigned(reg99);
        end
      if ($unsigned({wire0[(3'h4):(3'h4)]}))
        begin
          reg102 <= ((8'hb3) ?
              $signed($unsigned(((reg30 ^ reg99) != reg22))) : (8'haf));
          if (($signed(reg26[(5'h10):(2'h2)]) ?
              (-reg97[(1'h0):(1'h0)]) : reg28[(4'h8):(3'h5)]))
            begin
              reg103 <= $signed((reg7 ^~ $unsigned($signed($unsigned((8'h9c))))));
              reg104 <= $signed($signed((8'hab)));
              reg105 <= (8'h9e);
              reg106 <= reg18[(4'hb):(2'h3)];
            end
          else
            begin
              reg103 <= (^~wire96[(1'h1):(1'h1)]);
              reg104 <= $unsigned($unsigned({{(~|wire33),
                      ((8'h9f) || wire3)}}));
              reg105 <= (~&(((|reg101) ?
                      (|{(7'h42)}) : ((8'ha9) && $signed(reg24))) ?
                  reg14 : ((((7'h43) ? reg24 : reg6) ?
                      {reg28} : {reg14, reg106}) <= reg102[(3'h7):(3'h6)])));
              reg106 <= (|reg34[(4'hc):(4'h8)]);
            end
          reg107 <= ($unsigned(wire3[(3'h4):(3'h4)]) ?
              $unsigned($unsigned((^(reg19 ?
                  (8'ha5) : reg25)))) : ({$unsigned($unsigned(reg97)),
                  wire9} || (8'ha2)));
        end
      else
        begin
          reg102 <= $signed(wire10);
          reg103 <= ($unsigned($unsigned((reg20 ^~ reg97))) > $unsigned((7'h40)));
          reg104 <= {(wire9[(4'h8):(1'h1)] ?
                  reg21 : {(reg102[(1'h0):(1'h0)] & reg23),
                      (((8'hb8) << (8'h9f)) <<< wire33[(1'h1):(1'h1)])})};
          if (wire9)
            begin
              reg105 <= reg14;
              reg106 <= ((wire9[(1'h0):(1'h0)] && {($unsigned(reg5) ?
                          $signed(reg18) : {reg14, wire10})}) ?
                  ((~&$signed((~^reg105))) ?
                      wire33 : reg20[(4'h9):(2'h2)]) : $unsigned(reg5[(3'h4):(3'h4)]));
              reg107 <= reg24;
              reg108 <= $signed(($unsigned(reg103[(1'h0):(1'h0)]) ?
                  $unsigned(((-reg29) ?
                      {reg106,
                          (8'hac)} : reg18)) : $signed((|$signed(reg20)))));
            end
          else
            begin
              reg105 <= wire8[(2'h2):(1'h1)];
              reg106 <= wire3;
              reg107 <= reg7;
            end
          reg109 <= $unsigned((8'hb4));
        end
      reg110 <= {reg102};
    end
  always
    @(posedge clk) begin
      if ((!(^~wire0[(4'hc):(2'h2)])))
        begin
          reg111 <= reg31[(2'h3):(2'h3)];
          if ((~|$unsigned((!(^(~^reg101))))))
            begin
              reg112 <= (~&((reg12[(4'hb):(4'hb)] ? reg98 : (^(!reg24))) ?
                  $signed($unsigned($unsigned(reg15))) : (7'h44)));
              reg113 <= reg17;
              reg114 <= {(($unsigned(reg21[(3'h5):(2'h2)]) && reg98[(4'hb):(4'hb)]) ?
                      $signed((reg112[(5'h12):(4'ha)] - $signed((8'hb4)))) : (+$unsigned(wire3)))};
            end
          else
            begin
              reg112 <= $signed($signed(({wire4,
                  (reg29 ?
                      reg99 : reg108)} >>> $signed(reg30[(1'h0):(1'h0)]))));
              reg113 <= (-{(reg14[(3'h7):(3'h4)] ?
                      $unsigned(reg27) : (reg21 - (wire33 - reg25))),
                  ($unsigned((wire0 ? wire8 : reg22)) ?
                      ($signed(reg29) ?
                          {reg106} : (reg98 >> reg112)) : {(-reg21), reg24})});
              reg114 <= wire9[(3'h4):(3'h4)];
            end
        end
      else
        begin
          if ((reg109[(4'hb):(1'h1)] ?
              $unsigned(wire1[(3'h7):(1'h1)]) : ({($unsigned((8'ha4)) > (&reg18)),
                  $unsigned($signed((8'hac)))} == ((~&(reg110 ^~ wire10)) ^ $signed(((7'h41) <= reg22))))))
            begin
              reg111 <= (-$unsigned($signed($unsigned($signed(reg20)))));
            end
          else
            begin
              reg111 <= reg34[(5'h14):(3'h5)];
              reg112 <= reg109[(3'h5):(1'h1)];
            end
        end
      reg115 <= reg19;
      reg116 <= (reg31 | (&(^((8'had) >= $signed(wire11)))));
    end
  assign wire117 = (reg5[(1'h0):(1'h0)] ?
                       (({$unsigned(reg13)} ?
                               {{wire9}, (!wire96)} : $unsigned((+wire10))) ?
                           (reg16 ?
                               $signed((reg114 ?
                                   reg113 : reg26)) : (((8'hae) == reg23) ?
                                   reg25 : (reg12 == wire10))) : reg28[(3'h5):(2'h3)]) : reg34);
endmodule

module module35
#(parameter param93 = ((({((8'ha7) == (7'h43)), ((8'ha3) ? (8'haf) : (7'h42))} >= (8'hb8)) <= (^~{((8'hb6) == (8'hae))})) ? (!((((8'ha7) ? (8'h9f) : (8'hb9)) <= (^~(8'hbe))) ? (((8'h9c) ? (7'h43) : (8'ha6)) | ((8'hb8) ? (8'ha6) : (8'hb0))) : (((8'haf) ? (8'hbe) : (7'h42)) ? ((8'haa) || (8'haf)) : ((8'hb9) != (8'h9d))))) : {{((&(8'hb8)) ? ((8'hbe) <<< (8'hb8)) : ((8'hbd) >= (8'hb7))), ((|(7'h40)) ? ((8'hbf) ? (8'hbf) : (8'hae)) : {(8'ha4), (8'haa)})}, ((((8'hb1) ? (8'ha4) : (8'hb7)) ? ((8'hb7) ? (8'ha0) : (8'h9c)) : (&(8'ha5))) ? ((8'ha9) ? ((8'ha8) ? (8'ha2) : (8'hac)) : ((8'hb6) != (8'hb2))) : (((8'hb8) ? (8'ha7) : (8'hb2)) ? ((7'h41) ? (8'hbc) : (8'hb6)) : (~(8'haa))))}))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire40;
  input wire signed [(4'ha):(1'h0)] wire39;
  input wire signed [(4'hc):(1'h0)] wire38;
  input wire signed [(5'h10):(1'h0)] wire37;
  input wire [(4'ha):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire89,
                 wire70,
                 wire69,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
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
                 reg58,
                 reg57,
                 reg56,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= $unsigned(wire40);
      reg42 <= $unsigned({$unsigned(reg41)});
      if (($signed(reg41) ? wire38 : $unsigned($signed(reg42))))
        begin
          if (($signed($unsigned(wire38)) | (~|{{$unsigned(wire39)},
              ($signed(reg42) != wire37[(3'h5):(3'h5)])})))
            begin
              reg43 <= {(&$unsigned($unsigned(wire37)))};
            end
          else
            begin
              reg43 <= $unsigned((8'hac));
              reg44 <= $signed($unsigned($signed((+((7'h42) ?
                  wire40 : (8'hb6))))));
              reg45 <= {wire39,
                  (({(-reg43)} ^~ (^~(~^wire39))) >>> ($signed(((8'hb6) || wire36)) ?
                      ((reg44 | wire36) ?
                          (reg43 ? reg42 : reg41) : (wire36 ?
                              wire37 : reg44)) : reg41[(3'h7):(2'h2)]))};
              reg46 <= $unsigned($unsigned({($signed((8'ha0)) ^ ((8'ha4) ^~ reg44))}));
              reg47 <= wire38[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg43 <= reg44;
        end
      reg48 <= $signed(($unsigned((-wire40[(1'h1):(1'h0)])) ?
          $unsigned(wire40) : ($unsigned((reg45 || reg47)) + reg41)));
      reg49 <= ($unsigned($signed($signed((reg46 ~^ wire39)))) * ($signed($unsigned(((8'h9d) ?
              (8'ha4) : (8'ha8)))) ?
          reg41 : ($signed({reg45, (8'hae)}) >>> $signed((^(8'hae))))));
    end
  assign wire50 = ((reg46 >= $signed((^~(!reg42)))) ?
                      ({$signed($signed(reg46))} ~^ {(~|(reg44 ?
                              reg48 : reg41))}) : $signed(wire38));
  assign wire51 = {(((~&(reg45 >>> reg47)) && $unsigned(wire36)) ^ ({(reg43 ?
                              wire36 : reg46)} >= $unsigned($signed(reg42))))};
  assign wire52 = ($signed((wire51 * $unsigned($unsigned(wire40)))) ?
                      $unsigned((wire50 & reg44)) : $unsigned({wire39}));
  assign wire53 = reg46[(3'h7):(2'h2)];
  assign wire54 = (|$unsigned(wire37[(4'hb):(4'h9)]));
  assign wire55 = $unsigned({$unsigned(((&reg47) ? (+reg45) : (|reg48)))});
  always
    @(posedge clk) begin
      if ((&(~(((8'ha6) || $signed(reg46)) > $signed((8'hab))))))
        begin
          reg56 <= (wire52[(3'h4):(2'h3)] ?
              $signed(($unsigned($signed(reg46)) | $signed(reg47[(2'h3):(1'h1)]))) : $signed($signed((8'hb1))));
          reg57 <= (8'hbd);
          if ($unsigned({{$signed((wire51 ? reg57 : reg45)),
                  (reg46[(4'h8):(2'h2)] ?
                      $unsigned(wire54) : $signed(wire36))}}))
            begin
              reg58 <= (($signed((reg44[(2'h2):(1'h0)] ?
                      (reg56 ? wire53 : reg44) : (~|reg46))) ?
                  $signed((reg56 + (^wire55))) : $signed(wire55)) < (~&$unsigned((^(+wire37)))));
              reg59 <= reg47;
              reg60 <= $unsigned($signed(((wire54 <= $unsigned(wire52)) <= $unsigned(wire50))));
              reg61 <= $unsigned($unsigned((reg47[(3'h4):(1'h0)] ?
                  wire51[(1'h0):(1'h0)] : ((-wire51) ?
                      (8'ha2) : ((8'hb2) | wire54)))));
            end
          else
            begin
              reg58 <= {($unsigned({$unsigned(reg56),
                      (wire55 ^~ reg41)}) || ((~|$signed(reg60)) ?
                      $signed((~^reg58)) : ($unsigned((8'ha9)) ?
                          {reg61} : $signed(reg61)))),
                  (($signed(reg44[(4'hf):(3'h6)]) * $signed(reg41)) & $signed($signed((8'h9c))))};
              reg59 <= (wire53 >>> (8'hb7));
              reg60 <= $signed((8'ha5));
            end
        end
      else
        begin
          reg56 <= (reg58[(4'ha):(3'h5)] ^ (reg49[(2'h3):(1'h0)] ?
              ($unsigned(((8'ha1) * reg46)) ~^ reg42) : $signed(wire54[(4'hc):(1'h0)])));
          reg57 <= {$signed(reg49[(3'h4):(2'h2)]),
              $signed(wire54[(3'h5):(2'h3)])};
        end
      reg62 <= $unsigned({(~^reg57),
          ((^$signed(reg41)) ?
              $signed((~|wire37)) : ((wire38 ^ wire36) && reg46))});
      if ($signed(($signed(((wire37 ~^ reg56) ?
          reg49[(2'h2):(2'h2)] : (reg62 << (8'ha4)))) && wire55[(4'h8):(1'h1)])))
        begin
          reg63 <= reg41[(4'hd):(4'ha)];
          reg64 <= (($signed(reg45) ?
              {((~(8'ha0)) <<< $signed((8'haa))),
                  {(wire51 == reg42)}} : (!(reg56[(1'h1):(1'h0)] ^~ reg49))) << wire53);
        end
      else
        begin
          if ((-(wire53[(2'h2):(1'h0)] >= reg45)))
            begin
              reg63 <= ((&((^(wire50 && (8'hac))) << {{reg48},
                  (reg59 * reg46)})) == (reg45 ^ ((reg64[(1'h1):(1'h0)] ?
                  (&wire51) : ((8'hb1) | reg44)) | $unsigned(((8'ha4) ?
                  reg56 : reg57)))));
            end
          else
            begin
              reg63 <= $signed(($unsigned((^~$signed(reg48))) != $unsigned(($signed(reg56) ?
                  $unsigned((7'h40)) : $unsigned(wire51)))));
              reg64 <= {(wire40[(3'h7):(2'h3)] <= {reg45[(4'ha):(3'h7)]}),
                  ($unsigned(wire38[(4'ha):(4'ha)]) * ($signed((reg41 ?
                      reg49 : (8'hb0))) | reg61[(1'h0):(1'h0)]))};
            end
          reg65 <= ($signed(reg43[(2'h3):(1'h0)]) - ($unsigned(reg57[(4'h8):(2'h3)]) - reg62[(1'h1):(1'h1)]));
          if (((($signed($unsigned((8'ha4))) * ((reg65 <<< reg59) >>> $signed(reg64))) <= (reg47[(1'h1):(1'h1)] ?
              {$unsigned(reg59)} : (^(reg57 - (8'h9e))))) + (~|({(wire37 | (8'had))} & ($unsigned((8'haa)) ?
              $unsigned(reg47) : (~|reg45))))))
            begin
              reg66 <= (($unsigned(({reg64, reg56} >> (wire39 ?
                      reg59 : wire39))) <= $unsigned($unsigned((reg60 < wire38)))) ?
                  (^(^~reg65)) : $unsigned($unsigned($signed((wire38 ?
                      reg58 : reg61)))));
              reg67 <= ($unsigned((8'ha1)) ?
                  ((reg61[(2'h2):(1'h1)] <= wire53[(2'h3):(1'h1)]) ?
                      {{(reg57 > reg59)},
                          {(reg66 == wire53),
                              $unsigned(reg46)}} : (~(^(&wire55)))) : $signed({(~(reg57 ?
                          wire36 : reg57)),
                      reg59[(3'h5):(2'h2)]}));
              reg68 <= (wire37[(4'he):(2'h3)] ?
                  reg42 : ($signed((reg67[(3'h4):(1'h1)] == (reg67 ?
                          wire39 : wire36))) ?
                      $unsigned({$signed(wire40)}) : (^{(reg43 || wire55)})));
            end
          else
            begin
              reg66 <= $unsigned(($unsigned((~^(~^reg45))) < ($signed(((8'hab) & reg59)) ?
                  $signed((|reg45)) : $unsigned((reg60 ? wire51 : reg42)))));
              reg67 <= reg45;
              reg68 <= (($signed(({(7'h42)} + ((8'h9c) ~^ reg64))) ?
                      $unsigned((8'hb4)) : $signed($unsigned($signed(reg68)))) ?
                  $unsigned(reg58) : $signed((reg49 < reg68)));
            end
        end
    end
  assign wire69 = $signed(($unsigned((reg64 ?
                      {reg66, reg59} : $unsigned(reg45))) > $unsigned(wire55)));
  assign wire70 = {(+$signed(($signed(reg42) + reg63[(4'hb):(4'h9)]))),
                      {(8'hb6), $signed($unsigned((8'hbb)))}};
  module71 #() modinst90 (.wire75(reg49), .wire72(reg60), .wire74(reg63), .y(wire89), .clk(clk), .wire73(reg62));
  assign wire91 = wire52[(4'hc):(2'h3)];
  assign wire92 = $signed($signed(reg60));
endmodule

module module71  (y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire75;
  input wire [(2'h2):(1'h0)] wire74;
  input wire signed [(3'h7):(1'h0)] wire73;
  input wire signed [(5'h10):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire76 = ($signed($signed((!wire75[(4'h9):(3'h7)]))) >>> wire75[(2'h3):(1'h0)]);
  assign wire77 = wire75[(4'hd):(3'h4)];
  assign wire78 = $signed((wire74[(2'h2):(1'h0)] ^~ $unsigned({wire73,
                      (wire75 ? wire72 : wire74)})));
  assign wire79 = $signed(({(+(^~wire78))} ?
                      $signed($unsigned((wire76 != wire78))) : $signed((((8'hbb) ?
                          wire72 : (8'had)) <= ((8'had) ? wire72 : (8'hba))))));
  assign wire80 = ($signed(wire75[(4'h9):(2'h2)]) ?
                      (($signed({(8'ha9)}) ? wire76 : wire74[(1'h0):(1'h0)]) ?
                          ({(wire75 ? wire74 : wire77)} ?
                              ({wire74,
                                  wire78} || wire77) : $signed(wire74)) : (wire78[(1'h1):(1'h0)] ?
                              $signed((wire79 ?
                                  wire73 : wire76)) : (wire74[(2'h2):(1'h1)] ?
                                  (!wire76) : wire72[(4'ha):(2'h2)]))) : {(wire73 ?
                              (&wire73[(3'h5):(2'h3)]) : (wire73 || $signed(wire77)))});
  always
    @(posedge clk) begin
      reg81 <= ({$signed({(wire74 ? wire80 : wire78)})} ?
          wire75[(4'ha):(4'ha)] : wire80);
      reg82 <= ($signed($unsigned((^~((8'hae) - wire78)))) ?
          ((~$signed(wire77[(1'h0):(1'h0)])) ?
              (~{(wire80 << wire75), wire73}) : wire79[(3'h5):(3'h4)]) : reg81);
    end
  assign wire83 = $signed((($signed((8'hb1)) ?
                      ($signed(wire80) & $unsigned(wire78)) : ((8'hbd) != $signed(wire74))) && (wire76 ?
                      (+wire79[(4'hb):(1'h0)]) : wire75)));
  assign wire84 = {$unsigned(((!(+wire78)) ?
                          $signed($unsigned(wire75)) : {{wire79}})),
                      (!wire74)};
  assign wire85 = $signed((~&wire78[(3'h5):(1'h0)]));
  assign wire86 = $unsigned((($unsigned((wire85 ? wire80 : wire72)) ?
                          (wire74[(2'h2):(1'h0)] <<< $signed(wire74)) : {{wire79,
                                  (8'hbf)}}) ?
                      (~&wire80[(2'h3):(2'h3)]) : (&(~|(wire78 | wire74)))));
  assign wire87 = (^$signed((~&wire80[(2'h3):(2'h3)])));
  assign wire88 = (7'h44);
endmodule
