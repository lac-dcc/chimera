module top
#(parameter param145 = ((-((((8'hae) ? (8'ha4) : (8'hae)) ^~ ((8'hb3) >>> (8'ha0))) ? (((8'hba) ? (8'ha8) : (8'hbd)) ? ((8'hbb) > (8'hab)) : (8'hba)) : ((&(8'hab)) ? ((8'ha1) == (8'h9e)) : (~|(8'h9f))))) != (+(~|(+((8'ha0) ? (8'ha5) : (8'hb0)))))), 
parameter param146 = param145)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire144;
  wire [(4'hb):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire142;
  wire signed [(3'h7):(1'h0)] wire118;
  wire signed [(4'hf):(1'h0)] wire95;
  reg signed [(2'h3):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg [(3'h4):(1'h0)] reg4 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire118,
                 wire95,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (^~$signed($unsigned($signed((wire0 ? wire3 : wire0)))));
      if ($signed((~|({(wire2 > (7'h41))} ?
          (+(~|reg4)) : $signed((wire3 ? (8'hbb) : (8'hbb)))))))
        begin
          reg5 <= $unsigned(($unsigned({wire0,
              $unsigned((8'ha2))}) >>> ((-$signed(wire2)) | (|$signed(wire2)))));
        end
      else
        begin
          reg5 <= ((wire3 ^ wire2) && wire2[(5'h10):(3'h5)]);
          reg6 <= {(($signed(wire3[(1'h1):(1'h0)]) ?
                  $unsigned({(8'ha3)}) : (+((7'h41) ?
                      wire1 : wire1))) ^ $unsigned((8'hb0)))};
        end
    end
  module7 #() modinst96 (wire95, clk, wire2, wire1, wire0, reg6, reg5);
  module97 #() modinst119 (.clk(clk), .wire100(reg5), .wire98(wire0), .y(wire118), .wire101(wire3), .wire99(reg6));
  always
    @(posedge clk) begin
      reg120 <= $signed({(^~(~^(wire0 ~^ (8'hb6)))),
          (reg4[(3'h4):(2'h3)] - $signed((reg6 | reg5)))});
      reg121 <= wire1;
    end
  always
    @(posedge clk) begin
      if ({((~&$signed($signed(reg6))) ?
              wire118[(3'h4):(3'h4)] : wire95[(3'h7):(1'h1)]),
          reg121})
        begin
          reg122 <= ($signed(($unsigned($unsigned(reg120)) > $signed(wire2))) <<< wire1[(4'hc):(3'h5)]);
          reg123 <= wire2[(1'h0):(1'h0)];
          if ($signed($signed((({reg6, reg120} ?
              $unsigned(reg122) : {reg120,
                  wire2}) - (wire95 && (wire0 > (8'haa)))))))
            begin
              reg124 <= {$unsigned($signed($unsigned((wire118 != reg5))))};
            end
          else
            begin
              reg124 <= $unsigned(reg122);
              reg125 <= {(wire2 - wire2[(4'hf):(2'h3)])};
            end
          reg126 <= {((~|reg4[(1'h1):(1'h1)]) - $signed(reg124[(1'h0):(1'h0)]))};
          reg127 <= (~|$unsigned(reg123[(2'h2):(1'h0)]));
        end
      else
        begin
          reg122 <= reg120[(1'h1):(1'h0)];
          reg123 <= wire118;
          reg124 <= (8'ha0);
          if ({(reg120[(2'h3):(1'h0)] ?
                  (~^($signed(reg6) >> $unsigned(wire95))) : $signed({$signed(wire95)}))})
            begin
              reg125 <= reg124;
              reg126 <= reg120[(1'h0):(1'h0)];
              reg127 <= (7'h41);
              reg128 <= reg124[(1'h0):(1'h0)];
              reg129 <= wire118;
            end
          else
            begin
              reg125 <= reg6[(4'h9):(4'h9)];
              reg126 <= $unsigned((~|wire3));
              reg127 <= ($unsigned($signed((~^((8'had) ? reg125 : (8'hac))))) ?
                  $unsigned(($signed({reg121,
                      reg121}) < reg127[(2'h2):(1'h0)])) : wire1[(3'h5):(1'h0)]);
              reg128 <= wire2[(4'h9):(3'h5)];
            end
        end
      reg130 <= $signed(($unsigned((+(reg4 ? wire0 : wire95))) > (8'had)));
      if (reg130[(3'h6):(2'h3)])
        begin
          reg131 <= reg125;
          reg132 <= {(7'h40)};
          if ($unsigned(reg128[(2'h3):(1'h0)]))
            begin
              reg133 <= (~$unsigned($unsigned(reg126)));
              reg134 <= (~^({($unsigned(reg124) >> reg6), {(^wire1)}} ?
                  $signed((+(reg4 >= wire0))) : $unsigned((wire95 ?
                      $unsigned((8'hbc)) : reg4))));
            end
          else
            begin
              reg133 <= (^((~$signed($signed(reg5))) ?
                  ((|$unsigned(reg133)) < $signed((^~reg129))) : $unsigned((|reg124[(1'h1):(1'h0)]))));
              reg134 <= $signed($unsigned(($unsigned((reg127 >> (8'h9f))) == (wire1 << {wire3}))));
              reg135 <= {(reg125[(4'h8):(3'h5)] ?
                      (&($signed(reg127) > {(8'ha1)})) : reg128),
                  wire0};
            end
          if (((reg127 + {{$unsigned(reg126), (~^reg132)}}) ?
              (((((8'ha9) << (8'ha9)) >> $signed(wire2)) && $signed($signed((8'hba)))) ?
                  $signed(wire0[(4'he):(4'h8)]) : {reg132[(4'h9):(4'h9)]}) : reg131))
            begin
              reg136 <= wire2[(1'h1):(1'h1)];
              reg137 <= $signed($unsigned(reg120[(1'h0):(1'h0)]));
              reg138 <= $unsigned($signed($signed(($signed((8'ha1)) <= reg137))));
              reg139 <= {reg133[(1'h1):(1'h0)]};
            end
          else
            begin
              reg136 <= (~{reg126});
              reg137 <= $unsigned({{$signed((|reg5))}});
            end
        end
      else
        begin
          reg131 <= reg5;
        end
      reg140 <= wire3;
      reg141 <= (reg123 ? reg120 : $unsigned(reg135));
    end
  assign wire142 = {(8'h9c), reg137};
  assign wire143 = reg129[(3'h5):(1'h1)];
  assign wire144 = ($signed(reg5) >>> (8'ha3));
endmodule

module module97
#(parameter param116 = (~|(((|((8'hb9) ~^ (8'ha3))) ? (&{(8'hb0)}) : (((8'ha7) * (8'ha3)) < ((8'hb1) && (8'hb3)))) <= (&(((8'hbd) ^ (8'hb7)) > (~|(8'ha1)))))), 
parameter param117 = (~^param116))
(y, clk, wire101, wire100, wire99, wire98);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire101;
  input wire signed [(5'h13):(1'h0)] wire100;
  input wire signed [(5'h13):(1'h0)] wire99;
  input wire [(3'h4):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire115;
  wire [(5'h15):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire102;
  reg [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire104,
                 wire103,
                 wire102,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire102 = $unsigned(wire98);
  assign wire103 = {wire98};
  assign wire104 = ((-($unsigned(wire98[(1'h0):(1'h0)]) | ({wire103, wire100} ?
                       wire98[(1'h0):(1'h0)] : (-wire99)))) << {wire102,
                       wire101[(3'h5):(3'h5)]});
  always
    @(posedge clk) begin
      reg105 <= wire101[(1'h1):(1'h0)];
      reg106 <= (wire102[(4'h9):(1'h1)] ?
          wire98[(1'h0):(1'h0)] : {$unsigned(({wire98,
                  wire100} ~^ $signed((8'h9c))))});
      if (({wire103[(2'h2):(1'h1)], (|$unsigned($signed(wire100)))} ?
          (wire101[(1'h1):(1'h0)] || wire98[(1'h0):(1'h0)]) : $unsigned((^$signed(reg106)))))
        begin
          if (wire103)
            begin
              reg107 <= (~^$unsigned(wire101));
            end
          else
            begin
              reg107 <= ($signed(wire98) | ($signed($unsigned((wire99 ~^ reg106))) & $signed(reg105[(3'h4):(3'h4)])));
              reg108 <= {wire100};
              reg109 <= (wire98 >> (wire101[(1'h1):(1'h0)] != wire103[(2'h3):(2'h3)]));
              reg110 <= {(^~$signed(reg107[(2'h2):(1'h1)])), wire98};
            end
          reg111 <= {wire102,
              ((((wire103 ? wire101 : (8'ha0)) * $unsigned(reg106)) ?
                  ((wire99 ? reg109 : (8'ha3)) ?
                      (reg107 ~^ (8'ha5)) : $signed(wire102)) : (8'ha1)) ~^ (-wire99[(4'h9):(2'h2)]))};
          reg112 <= reg106;
        end
      else
        begin
          reg107 <= (-{wire100});
          reg108 <= (~&$signed((8'hb8)));
          reg109 <= wire101[(1'h0):(1'h0)];
          reg110 <= {$unsigned({{$unsigned(reg105), $signed(wire98)},
                  $unsigned((~^reg112))}),
              ($signed(($unsigned(wire100) >> (8'hb1))) != (((~&reg110) ^ $unsigned(wire103)) & (~^$unsigned(reg107))))};
        end
      reg113 <= $unsigned($unsigned($signed(((wire99 ?
          (8'h9c) : reg112) ^~ (reg109 < reg110)))));
    end
  assign wire114 = reg113;
  assign wire115 = wire103;
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire93;
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  assign y = {wire13,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire47,
                 wire48,
                 wire49,
                 wire93,
                 reg51,
                 reg50,
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
                 (1'h0)};
  assign wire13 = wire8[(4'he):(3'h6)];
  always
    @(posedge clk) begin
      if ((8'h9c))
        begin
          reg14 <= $signed((-wire8[(5'h10):(4'he)]));
          reg15 <= wire13;
          reg16 <= $unsigned((wire8[(1'h0):(1'h0)] ?
              $unsigned(((^wire13) ?
                  (reg15 ? wire10 : wire13) : reg15)) : wire8));
          if (reg15[(4'h8):(1'h1)])
            begin
              reg17 <= ({wire8} - $signed($unsigned($signed($unsigned(reg14)))));
              reg18 <= ($signed(wire9[(3'h5):(2'h2)]) ?
                  $signed($unsigned(wire9[(4'h8):(4'h8)])) : $unsigned((~&(reg16[(1'h0):(1'h0)] >> $unsigned((7'h40))))));
              reg19 <= $signed($signed($unsigned((-$signed(wire13)))));
              reg20 <= wire8;
              reg21 <= $signed(((reg20[(2'h2):(1'h0)] ^ reg17[(1'h0):(1'h0)]) << (^~$signed($unsigned(wire9)))));
            end
          else
            begin
              reg17 <= reg16[(2'h2):(1'h1)];
              reg18 <= {{(($unsigned(wire12) ?
                          (wire9 ?
                              wire13 : (7'h44)) : (^reg20)) & (|(+reg20)))}};
              reg19 <= wire11;
              reg20 <= (({reg19} ?
                      (-($unsigned(wire8) ^~ $signed(reg14))) : (!wire10)) ?
                  ($unsigned((wire8[(4'hd):(1'h0)] ? $signed(wire12) : reg14)) ?
                      {((^reg20) ?
                              (wire11 ? reg15 : wire9) : (reg19 ?
                                  wire10 : (8'h9e))),
                          {$signed(reg21)}} : reg18) : (8'hb0));
              reg21 <= reg14[(5'h10):(4'hd)];
            end
        end
      else
        begin
          reg14 <= wire12[(1'h0):(1'h0)];
        end
      reg22 <= {reg20[(4'hb):(3'h6)]};
      reg23 <= $unsigned($unsigned($unsigned(wire13[(2'h3):(2'h2)])));
    end
  assign wire24 = (|($unsigned(((7'h44) == (reg20 == wire11))) || ((!(reg21 && reg17)) & (~(wire10 ?
                      reg21 : reg17)))));
  assign wire25 = {($signed($unsigned(reg15[(1'h0):(1'h0)])) <<< $signed(wire10))};
  assign wire26 = reg15;
  assign wire27 = (^~reg21[(3'h5):(3'h5)]);
  assign wire28 = (~^(^~({$unsigned(reg20)} ?
                      (reg17 >= (reg22 ? reg22 : reg20)) : ($signed((8'ha1)) ?
                          reg18 : reg16))));
  assign wire29 = ($unsigned(reg21) ?
                      $signed(($unsigned((reg23 ? wire26 : reg14)) ?
                          ((^reg18) <= (8'hb0)) : reg15[(3'h6):(3'h4)])) : wire8[(4'hb):(1'h0)]);
  always
    @(posedge clk) begin
      if ($unsigned((~&((reg14 && (~reg21)) ?
          (+(~^reg20)) : $unsigned((reg17 | (8'haf)))))))
        begin
          if ({$unsigned((((reg18 >> wire13) ?
                      {reg14, reg21} : reg22[(2'h3):(1'h1)]) ?
                  ((reg16 ? reg19 : reg17) ?
                      (wire24 == wire28) : (reg20 ^ reg16)) : ((wire9 ?
                          wire26 : reg18) ?
                      (wire24 ^~ wire28) : (&reg18))))})
            begin
              reg30 <= $unsigned(($unsigned((8'ha7)) > {wire12}));
              reg31 <= (8'ha6);
              reg32 <= $unsigned({$signed((reg22[(3'h4):(2'h2)] >= $signed((8'haf))))});
              reg33 <= $signed($unsigned($signed({wire9, $unsigned((8'ha3))})));
            end
          else
            begin
              reg30 <= (&(!$signed(reg20[(5'h10):(5'h10)])));
              reg31 <= reg18;
              reg32 <= {reg15};
            end
          reg34 <= reg32;
          reg35 <= wire29;
        end
      else
        begin
          if (wire8)
            begin
              reg30 <= (^~$signed(wire12[(1'h1):(1'h1)]));
            end
          else
            begin
              reg30 <= ($signed(reg23[(3'h7):(1'h1)]) < wire13[(4'hc):(4'hc)]);
              reg31 <= (wire27[(4'hc):(4'h8)] << wire28[(3'h7):(2'h2)]);
              reg32 <= $signed((reg32[(1'h1):(1'h0)] ?
                  (((wire26 ^~ reg34) <<< wire13[(1'h0):(1'h0)]) >= wire8) : ($signed((reg23 ?
                      reg19 : (8'hbc))) - reg17)));
            end
          reg33 <= $signed($signed((((^~reg14) < wire29[(3'h4):(1'h0)]) < $signed((8'hb3)))));
          reg34 <= $signed(reg15[(4'hf):(3'h7)]);
          reg35 <= (^~($signed(wire24) ?
              ({$unsigned(reg20), (!(8'hbd))} ?
                  reg23[(4'hd):(1'h0)] : ({wire27} - (reg15 ?
                      reg33 : reg23))) : wire10[(1'h1):(1'h0)]));
        end
      reg36 <= (|$signed(($unsigned({reg35, wire26}) && reg17[(1'h0):(1'h0)])));
      reg37 <= $signed($signed((~|$unsigned($signed(wire9)))));
      if ($signed(($unsigned(reg22) < (8'hb8))))
        begin
          reg38 <= ($unsigned($unsigned($signed((+reg20)))) ?
              {(({wire12} >> $unsigned(reg35)) * ((|reg34) << (+reg22)))} : (8'ha3));
          reg39 <= (~|wire12[(2'h3):(1'h0)]);
          if (((-$unsigned((^((8'haf) ? reg35 : reg30)))) ?
              $unsigned($unsigned(reg36[(2'h3):(2'h2)])) : (|{$unsigned((reg33 ?
                      reg14 : wire9))})))
            begin
              reg40 <= (~((($unsigned(reg35) ?
                  ((8'hbb) > reg39) : (&wire27)) || reg38) ~^ ((8'h9e) >= $unsigned($signed(reg32)))));
              reg41 <= $signed(reg32);
              reg42 <= (~&reg39);
              reg43 <= {reg15};
              reg44 <= $signed((8'ha5));
            end
          else
            begin
              reg40 <= {($unsigned((+(~wire13))) ~^ reg32),
                  wire10[(3'h4):(2'h2)]};
            end
          reg45 <= (&$unsigned(((reg34[(3'h4):(2'h2)] << $unsigned(wire24)) * (reg38 ^~ $signed(reg18)))));
        end
      else
        begin
          reg38 <= (((reg41[(2'h3):(1'h1)] ^ $signed((^wire12))) ?
                  $unsigned((reg45[(1'h0):(1'h0)] ?
                      $unsigned(wire27) : (wire29 >= reg35))) : $signed($signed(wire10[(4'he):(3'h6)]))) ?
              (~^$unsigned(reg37[(4'hc):(3'h4)])) : reg33);
          reg39 <= (wire28 ?
              $signed($unsigned(reg19[(3'h4):(1'h1)])) : $unsigned($signed((reg31[(4'h9):(4'h9)] >= reg20))));
          reg40 <= ($unsigned((^~$signed({reg22}))) | wire12[(2'h2):(1'h1)]);
          if ((|(&reg19[(2'h3):(2'h2)])))
            begin
              reg41 <= wire26[(2'h2):(2'h2)];
              reg42 <= reg17[(3'h6):(2'h2)];
            end
          else
            begin
              reg41 <= reg45[(1'h0):(1'h0)];
              reg42 <= (($unsigned({$unsigned(wire29)}) ?
                  (reg36[(3'h4):(1'h0)] + $unsigned($signed(wire9))) : wire28[(4'h9):(3'h5)]) - wire13);
            end
          reg43 <= $signed((8'hab));
        end
      reg46 <= (reg18 <= $signed(($signed(reg41[(1'h1):(1'h0)]) ?
          $unsigned($signed(reg22)) : $unsigned($unsigned(reg42)))));
    end
  assign wire47 = {(($unsigned(reg42) || (reg14 >>> wire10[(4'h8):(4'h8)])) ?
                          $signed(($unsigned(wire29) ?
                              (wire13 ?
                                  reg31 : reg46) : $unsigned(wire13))) : (^~(-(~&reg20))))};
  assign wire48 = $signed(reg32[(2'h3):(2'h2)]);
  assign wire49 = $signed($signed(wire10[(4'hd):(4'hc)]));
  always
    @(posedge clk) begin
      reg50 <= reg19[(1'h1):(1'h1)];
      reg51 <= $unsigned(reg18);
    end
  module52 #() modinst94 (wire93, clk, reg32, wire11, reg33, wire47, wire8);
endmodule

module module52  (y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire signed [(4'h9):(1'h0)] wire55;
  input wire [(4'ha):(1'h0)] wire54;
  input wire signed [(3'h4):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire82,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg90,
                 reg89,
                 reg84,
                 reg83,
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
                 (1'h0)};
  assign wire58 = $unsigned(wire55);
  assign wire59 = (|$unsigned(($signed((&wire57)) ^~ (~|wire57[(3'h4):(2'h2)]))));
  assign wire60 = (^(&{$unsigned(wire57[(4'hc):(4'ha)])}));
  assign wire61 = {wire56[(5'h13):(4'hf)]};
  assign wire62 = wire53;
  assign wire63 = wire54[(4'h9):(3'h7)];
  assign wire64 = wire53[(2'h2):(1'h1)];
  assign wire65 = ($unsigned($signed(($signed(wire57) ? wire59 : {wire61}))) ?
                      wire60[(1'h0):(1'h0)] : ((~&((~^wire59) ?
                          (wire53 < (8'ha4)) : wire55)) * (wire54[(1'h1):(1'h0)] | ((^~wire64) + wire64[(2'h3):(1'h1)]))));
  assign wire66 = (wire58 ?
                      $signed(wire61) : (wire55[(2'h3):(2'h3)] ?
                          {$unsigned($unsigned(wire55)),
                              wire54} : wire64[(4'ha):(3'h6)]));
  assign wire67 = $unsigned(({wire61[(3'h4):(3'h4)],
                      {(^wire62)}} <<< ((7'h43) <<< {wire62,
                      (wire54 ? wire56 : wire56)})));
  assign wire68 = {$unsigned(($unsigned($unsigned(wire54)) >= (!wire60[(1'h0):(1'h0)])))};
  assign wire69 = (wire64 | wire57);
  always
    @(posedge clk) begin
      reg70 <= ((^$signed({(-wire59)})) ? wire58 : wire55[(3'h5):(2'h3)]);
      reg71 <= wire59[(3'h5):(2'h3)];
      reg72 <= (~&(8'ha9));
      if ($unsigned(wire54[(2'h3):(1'h1)]))
        begin
          reg73 <= $unsigned($unsigned($signed(({wire67} ~^ $signed((8'hb3))))));
        end
      else
        begin
          reg73 <= ($signed(wire57[(1'h0):(1'h0)]) ?
              $signed(($signed(reg71) >> {wire54,
                  $signed(wire53)})) : $unsigned(wire66));
          if ((+(^{reg73[(4'h8):(3'h7)]})))
            begin
              reg74 <= $unsigned($signed($unsigned({(wire59 < wire58),
                  (!reg72)})));
            end
          else
            begin
              reg74 <= $signed($signed($signed(wire54[(1'h1):(1'h0)])));
              reg75 <= (((~^($signed(wire59) & (reg70 ? wire66 : (8'h9e)))) ?
                      wire55 : ($unsigned($unsigned(wire69)) ?
                          (wire60 >= (wire62 ?
                              wire57 : (8'hbc))) : wire59[(3'h7):(3'h7)])) ?
                  $signed(wire64[(4'ha):(1'h0)]) : $unsigned($unsigned(wire68)));
              reg76 <= $unsigned(wire62);
              reg77 <= (($signed(wire60) < wire55[(1'h0):(1'h0)]) <<< ($signed(wire67[(3'h4):(1'h0)]) ^~ ($signed((reg72 <= wire66)) ?
                  (|$unsigned(reg70)) : ($signed((8'h9d)) >> reg74[(1'h0):(1'h0)]))));
            end
          if ((((wire64 ?
              (|$unsigned((8'ha4))) : ((reg74 && wire53) << $unsigned((7'h44)))) & wire55[(3'h7):(3'h6)]) >> (+((&wire53) ?
              ($signed(wire56) ?
                  {reg72} : (reg75 ? wire67 : wire58)) : ($signed(wire61) ?
                  wire61[(2'h2):(2'h2)] : wire66)))))
            begin
              reg78 <= wire54[(1'h1):(1'h1)];
              reg79 <= {$signed(((|wire65) ?
                      ((8'hb7) ?
                          $signed((8'ha7)) : $signed(wire67)) : (8'haa)))};
              reg80 <= (wire55[(2'h3):(1'h0)] == {$unsigned($unsigned((reg73 != wire62))),
                  $unsigned(((reg75 ? reg76 : wire66) ^~ (7'h43)))});
              reg81 <= (8'ha2);
            end
          else
            begin
              reg78 <= $signed(wire69[(1'h0):(1'h0)]);
            end
        end
    end
  assign wire82 = (reg81 || reg73[(4'hd):(3'h4)]);
  always
    @(posedge clk) begin
      reg83 <= $signed((8'hb6));
      reg84 <= wire66[(3'h7):(2'h3)];
    end
  assign wire85 = (8'ha8);
  assign wire86 = ($signed(({(wire68 ? (8'ha2) : wire55),
                      (wire62 ? reg76 : wire65)} & ({(8'ha8)} ?
                      (~wire56) : $signed(reg71)))) == ($unsigned({(wire67 ?
                          wire53 : (8'ha2)),
                      {reg81,
                          wire85}}) <= ($signed({reg75}) & {wire62[(5'h11):(5'h11)]})));
  assign wire87 = $unsigned(((8'hab) ?
                      ($unsigned((~|wire64)) ?
                          ((!wire58) >> (~^wire86)) : wire64[(4'h8):(3'h6)]) : reg80));
  assign wire88 = reg74;
  always
    @(posedge clk) begin
      if (reg81[(3'h6):(1'h0)])
        begin
          reg89 <= (^~wire69[(4'hb):(4'hb)]);
          reg90 <= ((7'h40) | {(^~{$unsigned(wire59)})});
        end
      else
        begin
          reg89 <= ((|reg78) ?
              (wire88[(5'h11):(4'hb)] ?
                  $signed($signed(wire57[(4'hc):(2'h3)])) : (8'h9f)) : (wire53[(1'h1):(1'h1)] ?
                  (reg73 ?
                      $unsigned($signed(reg89)) : $signed((8'hb6))) : (wire87[(1'h1):(1'h1)] ?
                      ((^~wire86) >= $unsigned(wire65)) : {reg75[(3'h4):(1'h1)]})));
        end
    end
  assign wire91 = wire55;
  assign wire92 = reg80[(3'h7):(2'h2)];
endmodule
