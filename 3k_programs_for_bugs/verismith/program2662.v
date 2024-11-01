module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire217;
  wire [(4'h8):(1'h0)] wire216;
  wire signed [(3'h5):(1'h0)] wire211;
  wire signed [(4'hf):(1'h0)] wire210;
  wire signed [(2'h3):(1'h0)] wire208;
  wire [(5'h15):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire69;
  reg [(2'h3):(1'h0)] reg215 = (1'h0);
  reg [(2'h2):(1'h0)] reg214 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg213 = (1'h0);
  reg [(4'h9):(1'h0)] reg212 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  assign y = {wire217,
                 wire216,
                 wire211,
                 wire210,
                 wire208,
                 wire72,
                 wire5,
                 wire6,
                 wire69,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg71,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = ($signed((+($unsigned((7'h41)) || (8'hb4)))) ?
                     ($unsigned(wire3) ?
                         wire5[(2'h3):(1'h0)] : (~({wire5, wire3} ?
                             wire0[(2'h3):(2'h2)] : (-wire5)))) : wire3[(3'h4):(2'h3)]);
  module7 #() modinst70 (wire69, clk, wire0, wire1, wire5, wire3, wire4);
  always
    @(posedge clk) begin
      reg71 <= $signed(wire3[(4'he):(3'h4)]);
    end
  assign wire72 = reg71[(1'h1):(1'h0)];
  module73 #() modinst209 (.wire77(wire0), .clk(clk), .wire75(wire6), .y(wire208), .wire76(wire5), .wire74(wire3));
  assign wire210 = ({$unsigned(((wire5 ? wire5 : wire208) ?
                               (8'hba) : (8'hb0)))} ?
                       {{((wire6 ?
                                   wire69 : reg71) ~^ wire3)}} : ((($unsigned(reg71) <= (wire3 >= reg71)) >> (((8'hbe) > wire1) << wire6[(3'h7):(1'h1)])) & (~|($signed(wire0) + {(8'ha8)}))));
  assign wire211 = (8'h9f);
  always
    @(posedge clk) begin
      reg212 <= (~&wire4);
      reg213 <= {(!wire210[(2'h2):(1'h1)]),
          $unsigned(((^~reg71) == {(reg212 ? wire211 : (8'ha0)), wire4}))};
      reg214 <= (&{((-$unsigned(reg71)) ?
              ({(8'hb1), reg213} ? (|wire1) : wire1[(3'h4):(2'h2)]) : wire1),
          {($signed(wire3) <<< (8'hb0))}});
    end
  always
    @(posedge clk) begin
      reg215 <= wire69[(1'h0):(1'h0)];
    end
  assign wire216 = {((reg214[(1'h0):(1'h0)] == $signed((8'ha0))) <<< wire208[(2'h3):(2'h2)]),
                       {wire72[(4'hb):(2'h2)],
                           {reg215, ({reg215, (8'ha6)} ^ $unsigned(wire5))}}};
  assign wire217 = $unsigned((+{(~wire69[(3'h7):(1'h0)]),
                       $signed(wire72[(4'hc):(3'h4)])}));
endmodule

module module73
#(parameter param207 = (((~&(((8'hba) ? (8'hba) : (8'hbc)) ? ((8'ha3) ? (8'hb7) : (8'ha1)) : ((8'h9f) ? (8'hbb) : (8'h9d)))) ? (~^(&((8'hbb) >>> (8'haf)))) : {(8'ha2), {((8'hbe) ? (8'hb8) : (7'h42)), {(8'hbd)}}}) ? (~({((8'haa) + (8'h9f)), ((8'h9c) != (8'hb6))} ? ((&(8'hb4)) + ((8'ha0) >>> (8'hb2))) : ({(8'hab)} ? ((8'h9e) != (8'ha7)) : ((8'hba) ? (7'h44) : (8'h9e))))) : (|{{(~|(8'hac))}})))
(y, clk, wire74, wire75, wire76, wire77);
  output wire [(32'h246):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire74;
  input wire signed [(5'h14):(1'h0)] wire75;
  input wire signed [(4'hd):(1'h0)] wire76;
  input wire signed [(4'hd):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire206;
  wire [(4'hc):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire193;
  reg [(4'h9):(1'h0)] reg205 = (1'h0);
  reg [(4'h9):(1'h0)] reg204 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg200 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg198 = (1'h0);
  reg [(3'h6):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg196 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  assign y = {wire206,
                 wire195,
                 wire78,
                 wire114,
                 wire193,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 (1'h0)};
  assign wire78 = ((({(wire74 ? wire74 : wire76), $unsigned(wire77)} ?
                          ($unsigned((8'hbf)) ?
                              $signed(wire75) : (wire75 ?
                                  wire74 : (7'h40))) : {wire77[(3'h5):(3'h4)],
                              {(8'hbb)}}) >> wire75[(3'h5):(2'h2)]) ?
                      $signed(($signed({wire76}) ?
                          $signed($unsigned(wire75)) : $signed($signed((8'haa))))) : $signed(wire76[(1'h1):(1'h1)]));
  module79 #() modinst115 (wire114, clk, wire77, wire76, wire75, wire78);
  always
    @(posedge clk) begin
      reg116 <= wire74;
      if ($unsigned((^~($unsigned($signed(wire78)) ?
          $unsigned((reg116 ? wire75 : reg116)) : {(+wire78)}))))
        begin
          reg117 <= (7'h41);
          reg118 <= (wire77[(3'h6):(1'h1)] ?
              (((~|$signed(wire114)) < $signed((wire76 != reg117))) | (((reg117 ?
                  wire76 : (8'ha1)) >= ((8'haf) ?
                  wire76 : (8'hb5))) >= (~((8'hbe) << reg116)))) : {(!{(8'hb7)})});
          if ($unsigned($signed(($signed(wire76[(4'hc):(4'hc)]) ?
              (wire74[(5'h10):(1'h1)] ?
                  reg117[(4'hc):(3'h6)] : $signed(wire78)) : (wire78 >>> $unsigned(wire76))))))
            begin
              reg119 <= wire114[(2'h2):(1'h0)];
            end
          else
            begin
              reg119 <= (&$unsigned($signed((+(^wire75)))));
              reg120 <= reg117;
              reg121 <= $unsigned(reg120[(4'hb):(4'ha)]);
              reg122 <= ($signed(reg117[(4'h9):(3'h4)]) ^ (reg120[(4'ha):(4'h8)] ?
                  (~|((~^reg117) ?
                      reg120 : (!wire75))) : wire114[(3'h6):(2'h3)]));
            end
          reg123 <= {$signed(reg121[(3'h4):(3'h4)]), reg121};
        end
      else
        begin
          if (($unsigned(($unsigned($signed((8'hb9))) ? reg117 : {(!reg119)})) ?
              wire114[(2'h3):(2'h3)] : $unsigned($signed((~(reg116 ?
                  reg119 : reg120))))))
            begin
              reg117 <= $unsigned(reg121);
            end
          else
            begin
              reg117 <= wire114;
            end
          reg118 <= reg121[(3'h6):(3'h6)];
          reg119 <= $unsigned((wire74 ?
              (8'ha8) : $unsigned(wire114[(4'h8):(2'h3)])));
        end
      reg124 <= wire114;
      if ({reg119})
        begin
          reg125 <= reg117;
          if ($signed($unsigned(wire74)))
            begin
              reg126 <= ((reg117 ?
                      {($signed(reg125) ?
                              (8'ha1) : (reg120 ?
                                  reg118 : reg123))} : ($unsigned(reg121) ?
                          ($signed(reg119) == $signed(wire76)) : reg124[(3'h4):(2'h3)])) ?
                  {(+$signed($unsigned(reg121))),
                      ((&(^~wire74)) ^ $signed((reg125 ^ wire74)))} : $signed($signed(((reg122 << reg125) ?
                      $unsigned((8'h9f)) : (reg124 ? wire114 : (8'ha0))))));
              reg127 <= wire76;
              reg128 <= (!(~|reg120));
              reg129 <= reg123;
              reg130 <= reg124[(1'h0):(1'h0)];
            end
          else
            begin
              reg126 <= $unsigned(((reg124[(2'h3):(1'h0)] << $unsigned((reg119 ?
                  reg122 : reg122))) & $signed(wire75)));
              reg127 <= reg125[(3'h6):(3'h4)];
              reg128 <= (^$signed(reg121));
              reg129 <= $unsigned(reg122[(4'ha):(1'h1)]);
            end
          reg131 <= (8'ha6);
          if (((^~($unsigned(((8'ha5) > reg124)) ^~ (^~((8'haa) - reg120)))) ?
              $unsigned(reg120[(4'h8):(2'h2)]) : ((-{$unsigned(reg122),
                  ((8'h9f) != (7'h40))}) ^ (wire114[(2'h2):(1'h1)] ?
                  (^~(8'hb3)) : ((reg120 < reg129) | $unsigned((8'hb8)))))))
            begin
              reg132 <= ($signed({$signed(((8'ha2) << reg124))}) > (&$signed((8'h9e))));
              reg133 <= ((wire76 ?
                      (^reg129[(2'h3):(2'h2)]) : (($unsigned(reg116) << $unsigned(reg132)) ?
                          {(^~(8'h9e))} : ($signed(reg130) ?
                              $unsigned((8'hb4)) : reg123))) ?
                  (($unsigned($signed(reg132)) | $signed($unsigned(reg123))) ?
                      (reg123 ?
                          reg119 : $unsigned(wire76[(4'h9):(3'h5)])) : reg131[(2'h3):(2'h2)]) : $signed({(!{reg120})}));
              reg134 <= reg128;
              reg135 <= {($unsigned(({wire74, reg116} ?
                      {wire78} : reg121)) <<< (((reg116 ?
                      (8'ha2) : wire74) * {reg133}) * wire75))};
              reg136 <= (!(!reg129));
            end
          else
            begin
              reg132 <= (~|(reg129[(3'h6):(1'h1)] ?
                  ((^(reg116 ? reg117 : wire77)) ?
                      (~&(reg131 - reg130)) : $signed((reg116 ^ reg116))) : {{$signed(reg117)},
                      ((^~wire78) * reg136[(4'hc):(4'h9)])}));
              reg133 <= $signed($signed($signed({(reg131 ? reg123 : wire78),
                  $unsigned(reg128)})));
              reg134 <= ((8'ha1) ?
                  {$signed((reg136 ?
                          (reg132 ?
                              reg135 : reg136) : $unsigned(reg124)))} : reg135);
              reg135 <= (wire77 ~^ (8'hb0));
              reg136 <= $signed(wire76);
            end
          if ($signed((8'hb8)))
            begin
              reg137 <= $signed(reg129[(1'h1):(1'h1)]);
              reg138 <= ($signed(((~&reg129) && $unsigned((wire76 ?
                  reg122 : (8'ha5))))) != $signed(reg125));
              reg139 <= ((!{$unsigned(reg133), reg122}) ^ (({$signed(wire114),
                          (reg125 == wire74)} ?
                      $signed(wire77[(3'h6):(2'h2)]) : reg123) ?
                  (reg120 != $unsigned(wire75[(3'h7):(2'h3)])) : reg134[(2'h2):(2'h2)]));
              reg140 <= $unsigned({wire77[(4'hd):(4'h9)]});
              reg141 <= $unsigned(reg131);
            end
          else
            begin
              reg137 <= reg131;
              reg138 <= $unsigned((!wire76[(1'h1):(1'h0)]));
              reg139 <= (8'hbb);
              reg140 <= (!(reg119[(3'h6):(2'h2)] >>> reg139));
              reg141 <= {$signed((((reg118 == reg141) > reg118) > $unsigned((reg137 ?
                      reg129 : reg129)))),
                  (~&reg123)};
            end
        end
      else
        begin
          reg125 <= {(8'hbd), wire74};
        end
      if ($signed(wire77[(2'h2):(2'h2)]))
        begin
          if (({$unsigned((8'hab)), (reg123 & (8'haf))} * ((((reg129 ?
                          reg119 : reg121) ?
                      (~^(8'ha6)) : (8'hb4)) ?
                  (!wire77[(3'h5):(1'h1)]) : ((!reg130) > (reg123 + (8'ha3)))) ?
              $unsigned((~{reg135, (7'h40)})) : {reg119})))
            begin
              reg142 <= reg119[(4'ha):(4'ha)];
              reg143 <= reg142;
              reg144 <= $signed(reg132[(2'h3):(2'h3)]);
              reg145 <= $signed(reg122);
              reg146 <= $unsigned(({$signed({reg121})} <<< $signed((reg134 >= (wire75 ?
                  reg132 : reg134)))));
            end
          else
            begin
              reg142 <= $signed(((^~reg131[(3'h4):(3'h4)]) ? wire114 : reg146));
              reg143 <= ($unsigned($unsigned($unsigned($unsigned(reg139)))) ?
                  (reg137[(4'h9):(3'h6)] >>> (reg139[(4'hb):(1'h1)] * $unsigned((reg131 ^ reg116)))) : $unsigned((reg129 << (|reg132[(2'h2):(2'h2)]))));
              reg144 <= (~^{(reg135[(4'hb):(2'h2)] ?
                      $signed(reg145[(3'h7):(2'h2)]) : (^(wire77 | reg116)))});
              reg145 <= reg125[(4'h8):(1'h1)];
              reg146 <= $signed(reg124[(2'h3):(1'h0)]);
            end
        end
      else
        begin
          reg142 <= (^~$signed((^$unsigned((8'ha8)))));
        end
    end
  module147 #() modinst194 (.wire150(wire75), .y(wire193), .wire151(reg132), .clk(clk), .wire149(reg128), .wire148(reg127));
  assign wire195 = (~$unsigned($signed($signed((wire76 + reg118)))));
  always
    @(posedge clk) begin
      reg196 <= reg132[(3'h7):(2'h3)];
      if ({(^wire114[(4'h8):(3'h4)])})
        begin
          reg197 <= (!{$unsigned(reg131),
              $signed(({reg116} < (reg124 > reg144)))});
          reg198 <= $unsigned($unsigned(reg116[(2'h2):(1'h1)]));
          reg199 <= $signed(((8'ha1) ?
              $signed(({reg127} ?
                  $unsigned(reg130) : ((8'haa) ? (8'hba) : wire76))) : reg138));
          if ((-(|(^~$unsigned($signed(wire75))))))
            begin
              reg200 <= wire193[(4'hd):(3'h5)];
            end
          else
            begin
              reg200 <= reg127[(1'h0):(1'h0)];
              reg201 <= wire195;
              reg202 <= {(((reg143[(1'h1):(1'h1)] ?
                              (wire76 & reg137) : reg199) ?
                          (!{wire195}) : reg142) ?
                      (~&$signed((reg121 + (8'haf)))) : ((reg128[(2'h3):(1'h0)] ?
                              reg129[(3'h6):(1'h1)] : $signed(reg121)) ?
                          ($unsigned(reg199) ?
                              reg127 : (reg128 ?
                                  wire76 : reg118)) : $unsigned($unsigned(wire74)))),
                  (reg119 >= $unsigned($unsigned(reg198[(5'h11):(3'h5)])))};
              reg203 <= reg135[(5'h12):(4'hd)];
              reg204 <= $unsigned((reg146 ~^ reg128[(3'h7):(1'h1)]));
            end
          reg205 <= ({$signed(wire76),
                  ({(reg198 >>> reg140), (~^wire75)} ?
                      reg204 : $signed(reg117))} ?
              ((((reg138 ? reg144 : reg136) ?
                      reg122 : reg204) == $signed(((8'hb2) ?
                      reg125 : (8'ha7)))) ?
                  reg201[(4'hf):(4'hc)] : $signed((|$signed(reg141)))) : reg125);
        end
      else
        begin
          reg197 <= $unsigned((8'ha8));
        end
    end
  assign wire206 = (8'ha9);
endmodule

module module7
#(parameter param67 = (7'h41), 
parameter param68 = (~(-(^~(param67 != (8'ha6))))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  assign y = {wire66,
                 wire64,
                 wire23,
                 wire22,
                 wire21,
                 wire19,
                 wire18,
                 wire17,
                 reg20,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= (+({($unsigned(wire10) ? $signed(wire8) : $unsigned(wire8)),
              wire10[(1'h1):(1'h0)]} ?
          (((8'h9f) ? wire12[(2'h2):(1'h1)] : {wire10, wire10}) ?
              wire11[(1'h0):(1'h0)] : $unsigned((wire9 == wire9))) : (wire9[(2'h2):(1'h0)] ?
              {wire9[(5'h10):(4'hc)]} : (!$signed(wire8)))));
      reg14 <= $signed(wire12);
      reg15 <= {(~$signed({$signed(reg14), wire10}))};
      reg16 <= $unsigned(wire12);
    end
  assign wire17 = $unsigned($unsigned((^~$signed(wire11[(1'h1):(1'h0)]))));
  assign wire18 = ((^($unsigned($unsigned(reg14)) ?
                      wire12[(2'h2):(2'h2)] : ((&reg15) < (wire11 | wire12)))) - (-reg13));
  assign wire19 = ((+$signed((reg16[(1'h1):(1'h1)] ?
                          {wire12, reg16} : {wire17, reg15}))) ?
                      {wire8} : (&{{$unsigned(wire9)}, {(~&wire12)}}));
  always
    @(posedge clk) begin
      reg20 <= $signed($signed(($signed((&wire12)) ? wire19 : (8'ha5))));
    end
  assign wire21 = $unsigned($unsigned(($signed($unsigned((8'hbb))) ?
                      $unsigned((wire12 <= wire9)) : $unsigned((reg15 ?
                          wire17 : wire10)))));
  assign wire22 = {(8'ha8)};
  assign wire23 = wire22[(3'h4):(2'h3)];
  module24 #() modinst65 (.wire27(wire10), .wire26(wire23), .wire25(wire8), .clk(clk), .y(wire64), .wire28(wire12));
  assign wire66 = wire11;
endmodule

module module24
#(parameter param62 = {({(~|((8'hbd) >= (8'hb5))), ((&(8'hbd)) + ((8'hb5) ^ (8'hbc)))} ? (&(((8'ha4) | (8'ha5)) ? (-(8'ha1)) : ((8'hba) ? (7'h42) : (8'hb4)))) : ((((8'hac) * (8'hba)) ? {(8'h9d), (8'hba)} : ((8'hb3) ? (8'h9c) : (8'hbf))) ? (!((8'hb7) ? (8'ha4) : (8'hb6))) : (((8'h9d) || (8'ha7)) && ((8'hbf) | (8'hb4)))))}, 
parameter param63 = (8'hb6))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire28;
  input wire signed [(4'he):(1'h0)] wire27;
  input wire signed [(4'hd):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg56,
                 reg55,
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
                 (1'h0)};
  assign wire29 = (-$unsigned($signed({wire28})));
  assign wire30 = ($signed($unsigned(wire28[(3'h4):(2'h3)])) != {((&(wire27 <<< wire26)) >= $unsigned((^wire27)))});
  assign wire31 = ({wire27,
                      (-$unsigned(wire27))} ^ (~(((wire29 == wire30) && $unsigned(wire28)) ?
                      ((^wire26) <<< wire25[(3'h6):(2'h3)]) : wire27)));
  assign wire32 = wire25[(4'hd):(4'hd)];
  assign wire33 = (&$signed((~&$signed((wire29 <<< (8'ha1))))));
  assign wire34 = $signed(wire25);
  assign wire35 = $unsigned(wire28[(4'hc):(3'h4)]);
  assign wire36 = $signed(($signed(wire35) ?
                      $unsigned(({wire35, wire27} ?
                          wire31 : wire32[(2'h2):(1'h0)])) : (wire26 ?
                          ((wire30 ?
                              wire35 : wire35) ~^ $signed(wire33)) : $unsigned($unsigned(wire32)))));
  assign wire37 = wire30;
  assign wire38 = (8'hac);
  always
    @(posedge clk) begin
      reg39 <= wire30[(4'hc):(2'h3)];
      if (wire26)
        begin
          if (wire35)
            begin
              reg40 <= ((((wire33 << (~&wire25)) ?
                      ((|wire30) && wire26[(4'hc):(4'ha)]) : ((&wire37) ^ $unsigned(wire26))) ^ $unsigned(($unsigned(wire38) ?
                      $signed(reg39) : wire25))) ?
                  wire38 : ((8'ha3) ?
                      {(&(7'h43)),
                          wire35} : $signed($signed(wire36[(4'h9):(3'h6)]))));
              reg41 <= (~{((|(wire26 > wire37)) >>> (wire37[(1'h1):(1'h1)] != wire27[(4'h8):(2'h2)]))});
            end
          else
            begin
              reg40 <= $unsigned(wire27[(4'hc):(4'h8)]);
              reg41 <= $signed(($unsigned({{wire28}}) ?
                  {$unsigned(wire26), $signed((~wire30))} : (~|(&wire33))));
              reg42 <= ($unsigned({{(reg40 << wire37),
                      wire32[(1'h1):(1'h1)]}}) ^~ $unsigned($unsigned(((reg39 ?
                  (8'hb4) : wire30) == (wire32 << wire27)))));
            end
          reg43 <= (($unsigned(reg40) | ((~$unsigned(wire34)) ?
                  wire32 : $unsigned($signed(wire30)))) ?
              {reg39} : ($unsigned($unsigned($signed(wire32))) ~^ {reg39[(1'h0):(1'h0)]}));
          reg44 <= ($unsigned((({wire25, reg40} ?
                      wire31[(3'h4):(1'h1)] : wire36) ?
                  wire31[(2'h2):(2'h2)] : ($unsigned(wire35) > (wire35 << wire25)))) ?
              wire34 : ({$unsigned($signed(wire34))} ?
                  wire37 : wire37[(3'h5):(1'h1)]));
          reg45 <= (((+wire33[(2'h2):(2'h2)]) ?
              wire25[(2'h3):(1'h1)] : $signed($signed($signed((8'ha0))))) >> {{{wire32[(2'h2):(1'h0)]},
                  wire35[(3'h7):(2'h2)]}});
        end
      else
        begin
          reg40 <= $signed(wire26[(3'h7):(2'h2)]);
          reg41 <= (((wire34 ?
                      (reg43[(4'h9):(3'h4)] ?
                          $signed(wire25) : (8'hbf)) : $unsigned((reg41 ^ wire38))) ?
                  (^(~{reg42,
                      wire26})) : ((reg40[(3'h7):(3'h7)] >>> $unsigned(reg40)) > ((wire33 << wire30) ?
                      wire37[(4'h9):(2'h3)] : $signed(wire29)))) ?
              $signed((reg41[(1'h1):(1'h1)] ~^ $signed($signed(wire36)))) : $unsigned({wire28[(2'h3):(1'h1)],
                  wire37[(1'h1):(1'h1)]}));
          if ((reg43 ?
              ($signed((8'hab)) > ((~&(wire29 ? (8'ha2) : wire25)) ?
                  wire34[(1'h1):(1'h1)] : $unsigned({(8'ha6),
                      reg42}))) : ($unsigned($unsigned($signed(wire26))) <= ((wire31 ?
                      (reg41 - wire27) : (wire35 ? (8'ha0) : wire29)) ?
                  $signed((~wire28)) : $signed(wire33)))))
            begin
              reg42 <= (reg42 ?
                  wire31[(3'h6):(1'h0)] : (((8'hba) ^ reg44) ?
                      $signed((reg41 ?
                          $unsigned(wire31) : {wire35})) : wire31[(4'h8):(3'h7)]));
              reg43 <= $unsigned(wire25);
              reg44 <= {$signed((~&$signed((wire38 - reg40)))),
                  (-$signed(reg42))};
              reg45 <= $unsigned(reg43);
            end
          else
            begin
              reg42 <= (~|wire37);
              reg43 <= (wire32[(1'h0):(1'h0)] & reg42[(2'h3):(1'h1)]);
              reg44 <= wire32[(1'h0):(1'h0)];
              reg45 <= $signed(wire33[(3'h5):(3'h4)]);
              reg46 <= wire33[(2'h3):(1'h1)];
            end
          reg47 <= $unsigned(reg39);
        end
      if (wire35)
        begin
          if ($unsigned((8'h9d)))
            begin
              reg48 <= wire28[(4'h9):(4'h8)];
            end
          else
            begin
              reg48 <= ((wire29 ? wire25 : (^{(reg39 <<< reg43), wire26})) ?
                  $signed(reg40) : {wire31[(3'h7):(2'h2)],
                      $signed((^reg47[(1'h0):(1'h0)]))});
              reg49 <= wire38[(2'h3):(2'h2)];
              reg50 <= (|((+wire29) != (($unsigned(wire28) ?
                  ((8'had) ^~ wire25) : (^reg49)) != (&reg44[(4'hc):(4'h9)]))));
            end
          if ((+wire28))
            begin
              reg51 <= (((~&($signed(wire34) + (wire33 != (8'ha0)))) < wire38[(2'h3):(1'h1)]) ^ (wire32 | $signed($signed((wire33 ^ reg45)))));
              reg52 <= $unsigned(($signed((~^(wire29 ~^ wire37))) ?
                  ($unsigned($unsigned((8'hac))) || $unsigned(reg39)) : (&((&reg45) <<< $signed(reg42)))));
            end
          else
            begin
              reg51 <= (8'ha7);
              reg52 <= reg43;
              reg53 <= {(wire30 ?
                      reg50 : $unsigned(($signed(wire38) ?
                          reg44[(4'h8):(1'h0)] : (reg43 ? reg49 : reg47)))),
                  (~|$unsigned(((~|wire28) ?
                      (wire32 << reg47) : (reg46 || reg47))))};
              reg54 <= (~&wire26);
            end
          reg55 <= {((($signed(wire34) ?
                      wire35[(2'h2):(1'h0)] : $unsigned(wire26)) ?
                  ((reg41 ? reg40 : reg48) ?
                      $signed(wire29) : reg42) : reg43[(3'h7):(3'h6)]) - {(~&(^~(8'ha5)))})};
        end
      else
        begin
          reg48 <= (wire30 ?
              (reg53 ?
                  $unsigned(((reg44 >>> (7'h42)) ?
                      (wire34 > reg53) : ((8'hae) ?
                          wire35 : reg39))) : $unsigned(reg54[(3'h5):(3'h5)])) : $unsigned((($unsigned(reg42) ?
                      wire25[(4'ha):(3'h5)] : $signed(wire36)) ?
                  reg40 : (8'hb9))));
          reg49 <= (($signed(wire32) ?
              wire27[(4'h8):(3'h6)] : {{(8'ha5),
                      $unsigned(wire38)}}) >> ((+wire36) ?
              ((~|(wire26 != reg54)) <= (wire28 + {wire30,
                  wire35})) : (~^$signed(wire30))));
        end
    end
  always
    @(posedge clk) begin
      reg56 <= $unsigned((^reg40));
    end
  assign wire57 = $signed(wire33);
  assign wire58 = {(8'h9f),
                      ((((reg43 ?
                          wire37 : reg47) < (wire37 || reg55)) >>> (&$unsigned(reg49))) ~^ $unsigned(((^reg56) == wire38)))};
  assign wire59 = (($unsigned((!(wire32 * wire35))) ?
                      wire26 : $signed($signed($signed(reg39)))) > {{reg39[(2'h2):(2'h2)]}});
  assign wire60 = $unsigned($unsigned(($unsigned({reg50}) <= (8'ha2))));
  assign wire61 = (~|wire38[(4'h9):(3'h4)]);
endmodule

module module147  (y, clk, wire151, wire150, wire149, wire148);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire151;
  input wire signed [(4'ha):(1'h0)] wire150;
  input wire signed [(4'hc):(1'h0)] wire149;
  input wire signed [(3'h6):(1'h0)] wire148;
  wire signed [(5'h13):(1'h0)] wire192;
  wire signed [(4'hf):(1'h0)] wire191;
  wire [(5'h15):(1'h0)] wire190;
  wire [(2'h3):(1'h0)] wire179;
  wire signed [(4'hb):(1'h0)] wire178;
  wire [(4'ha):(1'h0)] wire177;
  wire [(4'h9):(1'h0)] wire176;
  wire signed [(3'h4):(1'h0)] wire175;
  wire signed [(4'h9):(1'h0)] wire174;
  wire [(5'h10):(1'h0)] wire173;
  wire signed [(5'h12):(1'h0)] wire172;
  wire signed [(3'h7):(1'h0)] wire171;
  wire [(5'h12):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire164;
  wire [(2'h2):(1'h0)] wire154;
  wire signed [(4'hf):(1'h0)] wire153;
  wire [(4'he):(1'h0)] wire152;
  reg signed [(3'h4):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg188 = (1'h0);
  reg [(4'h8):(1'h0)] reg187 = (1'h0);
  reg [(5'h11):(1'h0)] reg186 = (1'h0);
  reg [(3'h5):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(5'h14):(1'h0)] reg182 = (1'h0);
  reg [(5'h12):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(3'h4):(1'h0)] reg168 = (1'h0);
  reg [(4'ha):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(3'h6):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(5'h11):(1'h0)] reg155 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire165,
                 wire164,
                 wire154,
                 wire153,
                 wire152,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 (1'h0)};
  assign wire152 = wire148[(1'h1):(1'h0)];
  assign wire153 = $signed((^~(((wire150 + wire148) ?
                           (~|wire151) : (wire149 || (8'h9f))) ?
                       wire152 : {(8'ha1), wire152[(4'ha):(4'h8)]})));
  assign wire154 = wire148[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg155 <= wire153;
      reg156 <= ((wire151[(2'h3):(1'h0)] * wire149) ?
          wire149[(4'hc):(4'h8)] : ((((wire151 - wire150) << (!wire154)) ?
              wire152 : {wire148}) & $signed($unsigned((wire148 ?
              wire149 : wire149)))));
      reg157 <= $unsigned($signed(wire154));
      if ((+$unsigned($unsigned(wire152[(3'h4):(1'h1)]))))
        begin
          if (({reg155[(4'h9):(2'h2)], $signed((~{wire154}))} ?
              reg155 : {wire149, $signed($signed((^~(8'hb6))))}))
            begin
              reg158 <= ($unsigned((((~^wire150) ?
                  $unsigned((7'h41)) : $signed(wire153)) >= reg157[(5'h12):(2'h2)])) & $signed($signed(($signed(wire153) ?
                  (wire150 && (8'hae)) : wire149))));
              reg159 <= (&$signed({((^wire151) <= {wire149}),
                  reg158[(1'h0):(1'h0)]}));
              reg160 <= ((($unsigned($signed(wire153)) ?
                  reg155 : $signed((reg159 && wire152))) <= (^$signed(reg157[(4'hd):(2'h2)]))) && $signed((reg159 <= (reg157[(3'h6):(3'h4)] ?
                  (wire148 ? wire149 : (8'ha7)) : (wire151 ?
                      reg157 : reg157)))));
              reg161 <= ((wire149 ?
                  (|wire151[(3'h7):(2'h2)]) : $signed($signed((!(8'hae))))) && {{reg160},
                  (reg159[(3'h5):(1'h1)] == {wire154[(1'h1):(1'h1)]})});
              reg162 <= (|reg158);
            end
          else
            begin
              reg158 <= {$unsigned(reg157[(5'h11):(3'h5)])};
              reg159 <= $signed(wire153[(4'he):(2'h3)]);
              reg160 <= reg157[(2'h3):(1'h0)];
            end
          reg163 <= $unsigned(wire151[(3'h7):(3'h4)]);
        end
      else
        begin
          reg158 <= $signed($unsigned(({$signed(reg158)} >= (~&(reg158 ?
              (8'hb9) : reg157)))));
          reg159 <= ($unsigned((8'hb7)) ?
              wire152[(4'hc):(2'h3)] : (-wire151[(4'h9):(3'h6)]));
        end
    end
  assign wire164 = $signed(reg162);
  assign wire165 = (~$signed(($unsigned(reg162) ?
                       (~&reg159[(3'h4):(1'h1)]) : (+(reg163 ?
                           (8'hb9) : wire164)))));
  always
    @(posedge clk) begin
      if ($unsigned(((~$signed($signed(reg155))) & (wire165[(2'h2):(2'h2)] ?
          (~(^wire150)) : {reg163, {(8'ha3), reg161}}))))
        begin
          reg166 <= $signed($unsigned($signed($unsigned((!reg157)))));
          reg167 <= wire152[(3'h5):(3'h4)];
          reg168 <= (reg159 ?
              (($signed((~wire154)) ~^ $signed($signed(reg167))) <= reg167) : (&($signed((-reg156)) >= (^(-wire151)))));
        end
      else
        begin
          reg166 <= (reg155 ? $signed((!$unsigned((~reg167)))) : wire152);
          reg167 <= $signed($unsigned((~|((reg163 <<< reg157) ?
              ((8'haf) ? (8'hbe) : wire150) : (reg159 ^~ wire149)))));
          reg168 <= (~|(&reg159[(3'h4):(2'h2)]));
        end
      reg169 <= (^reg159);
    end
  assign wire170 = $unsigned((reg156[(4'hf):(4'hc)] ?
                       (wire164[(1'h0):(1'h0)] == $signed($signed(wire149))) : {(&((8'ha3) ?
                               wire164 : wire149)),
                           {$unsigned(reg169), (~&reg157)}}));
  assign wire171 = ((wire164 >= (wire149 ?
                       ({reg163, (8'ha2)} ?
                           (~|wire148) : $signed(reg163)) : (|(^~wire154)))) >= $unsigned((~&reg158[(3'h6):(2'h3)])));
  assign wire172 = wire152;
  assign wire173 = ((-reg168[(1'h0):(1'h0)]) < ((!((wire153 >>> wire153) * $signed(wire151))) ^ wire171));
  assign wire174 = wire173[(5'h10):(3'h6)];
  assign wire175 = (((+$signed((+reg167))) > (($unsigned(wire174) < (reg158 * wire171)) ?
                       wire150 : $unsigned(((8'hb5) ?
                           wire151 : wire170)))) ^ (&$unsigned((reg168[(1'h0):(1'h0)] ?
                       $signed(reg167) : wire152[(4'hb):(3'h6)]))));
  assign wire176 = {{$unsigned($signed((!(8'hbb)))),
                           (~|$unsigned((-wire170)))}};
  assign wire177 = (wire165[(4'hf):(3'h7)] ?
                       ($unsigned(wire171[(3'h7):(1'h1)]) < $signed(({wire148,
                           (8'hbc)} == wire151))) : wire176);
  assign wire178 = ((-(8'ha7)) << $unsigned((reg167 ^~ (~&(^wire150)))));
  assign wire179 = (reg162[(1'h1):(1'h1)] ?
                       $unsigned($unsigned($unsigned((&wire177)))) : $signed($signed($unsigned($unsigned(wire154)))));
  always
    @(posedge clk) begin
      reg180 <= (((((~|wire178) + (8'hb8)) == $unsigned(reg163[(4'h8):(2'h2)])) | $signed((~|((8'had) + wire153)))) ?
          $signed((wire179 ?
              $unsigned($signed(wire148)) : ($signed(wire178) ?
                  (~|wire171) : ((7'h42) <= reg166)))) : {(~reg156[(3'h5):(1'h0)])});
      reg181 <= {$signed((|(|wire153[(2'h2):(1'h1)]))),
          ($signed($unsigned({reg168})) ~^ wire150)};
      reg182 <= ($unsigned({$signed((wire151 || wire173))}) >= reg160[(4'h8):(3'h7)]);
      if (reg167[(2'h2):(1'h1)])
        begin
          reg183 <= $unsigned(((~&$unsigned(((8'hb6) ? (8'h9c) : reg161))) ?
              {(!{wire179, wire178})} : wire153[(3'h6):(3'h6)]));
          if (wire154)
            begin
              reg184 <= ((8'hb8) ? wire176 : (~&wire149[(4'h8):(3'h4)]));
              reg185 <= $signed(((reg161[(1'h1):(1'h0)] ?
                      wire153 : (~$unsigned(reg183))) ?
                  (~^reg184[(1'h0):(1'h0)]) : $signed($signed((wire171 || (8'had))))));
              reg186 <= wire179[(2'h2):(1'h0)];
              reg187 <= (($unsigned((~(reg168 ? wire150 : wire152))) ?
                  ((-$signed(wire178)) == (reg156[(4'he):(1'h1)] ?
                      reg169[(4'hc):(1'h1)] : $signed(reg161))) : wire149[(2'h3):(2'h3)]) != reg167);
              reg188 <= (^~($signed($unsigned($unsigned(reg169))) == reg156));
            end
          else
            begin
              reg184 <= (reg181 ?
                  $signed($unsigned($signed($signed(reg161)))) : $unsigned((wire153 <<< reg167[(4'h9):(3'h6)])));
              reg185 <= reg182;
              reg186 <= $unsigned((wire174[(1'h1):(1'h0)] ?
                  reg181[(4'ha):(1'h0)] : ((~$unsigned(reg180)) - wire153)));
              reg187 <= ($signed(reg166) <<< {$unsigned($unsigned((reg180 ?
                      reg188 : reg163))),
                  (|{(reg161 || wire179)})});
              reg188 <= reg184;
            end
          reg189 <= wire179[(1'h0):(1'h0)];
        end
      else
        begin
          reg183 <= $signed(reg157[(4'hd):(2'h2)]);
        end
    end
  assign wire190 = ((|$signed((|(reg184 ?
                       wire154 : reg162)))) <= reg167[(3'h4):(3'h4)]);
  assign wire191 = reg189[(1'h1):(1'h1)];
  assign wire192 = wire148;
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire83;
  input wire [(4'hd):(1'h0)] wire82;
  input wire signed [(3'h5):(1'h0)] wire81;
  input wire [(5'h11):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire signed [(5'h10):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire84 = wire82[(3'h5):(2'h2)];
  assign wire85 = ((-$signed($unsigned(wire84[(3'h4):(2'h3)]))) ?
                      $unsigned(((^~wire81) + wire82)) : wire80[(2'h3):(2'h3)]);
  assign wire86 = (7'h42);
  assign wire87 = ($unsigned((((wire84 <<< (8'hb0)) != $unsigned((8'ha8))) & ((wire82 ?
                              wire81 : wire82) ?
                          $unsigned(wire84) : (8'h9d)))) ?
                      (~^($unsigned(wire81[(3'h5):(1'h0)]) >> $signed(wire85))) : (wire86[(4'ha):(4'ha)] ?
                          wire86 : $signed($unsigned((~&wire80)))));
  assign wire88 = wire84;
  always
    @(posedge clk) begin
      reg89 <= {(wire85 ? wire83 : wire87)};
      reg90 <= (reg89 >= wire86[(3'h7):(2'h3)]);
      reg91 <= wire88;
      if ((8'h9d))
        begin
          if (wire84)
            begin
              reg92 <= $unsigned($unsigned((8'hbb)));
              reg93 <= (((($unsigned(wire81) ^~ (reg92 ?
                          (8'hb8) : wire88)) << reg91) ?
                      $unsigned((&(reg89 ? reg91 : wire87))) : $signed(reg90)) ?
                  wire84 : wire81[(2'h2):(1'h1)]);
              reg94 <= {(^~({$signed((8'haf))} ~^ ($signed(wire85) * $unsigned(wire84))))};
              reg95 <= $unsigned((^~wire82[(4'hb):(3'h4)]));
              reg96 <= $unsigned($unsigned($unsigned(wire84)));
            end
          else
            begin
              reg92 <= wire86;
              reg93 <= (&(~&(($signed(reg96) ?
                  {(8'haa), reg96} : reg95) != $signed((&wire84)))));
              reg94 <= ((^~((wire80[(4'he):(2'h3)] << {reg92,
                  reg92}) <<< wire84[(2'h3):(2'h3)])) && (-$signed(((^reg90) <<< (8'ha9)))));
            end
          if ($signed((^~((~|(reg94 & wire82)) ?
              ((wire86 ? (7'h44) : reg92) ?
                  $signed(wire85) : wire83) : $signed(reg89[(4'h8):(3'h4)])))))
            begin
              reg97 <= (+wire86[(4'h8):(2'h2)]);
            end
          else
            begin
              reg97 <= ((((~^$unsigned(reg97)) & $unsigned(wire88)) ?
                  reg93 : $signed($unsigned((reg96 ?
                      (8'ha2) : reg94)))) ^ $signed(($signed($unsigned(wire81)) ~^ (~{reg93}))));
              reg98 <= ((wire81 >> $signed($unsigned((-reg91)))) ?
                  (~|(~&((wire85 || reg91) ?
                      (^~reg90) : $unsigned(wire81)))) : (wire81[(1'h1):(1'h1)] ?
                      (((wire87 >= wire84) != wire84[(1'h1):(1'h0)]) ?
                          (8'ha8) : ($signed((8'ha7)) ^ {wire80,
                              (8'hbf)})) : wire87[(1'h1):(1'h1)]));
              reg99 <= $unsigned(reg92);
              reg100 <= ((reg93 ?
                  {($signed(wire82) >> (~|reg98)),
                      ((7'h41) ?
                          (^~(8'h9f)) : (wire84 || reg93))} : (^(-(|(8'hbc))))) | reg97[(1'h1):(1'h1)]);
              reg101 <= {(wire88 == (~|$unsigned({wire88, wire86})))};
            end
          reg102 <= (((({reg99} ?
                  $unsigned(reg96) : ((7'h42) ?
                      wire82 : wire88)) <<< reg100[(1'h0):(1'h0)]) ?
              ($signed({reg90, wire82}) ?
                  reg96 : {(8'hb7),
                      ((8'ha4) ?
                          wire83 : wire87)}) : ($signed((reg95 << wire86)) ?
                  ((wire86 ? wire88 : reg100) ?
                      (wire83 | (8'hbc)) : (wire83 & reg96)) : $unsigned($signed(reg98)))) ^ $unsigned((~^((8'ha8) ?
              $unsigned((8'ha9)) : $signed(reg98)))));
        end
      else
        begin
          reg92 <= $signed((&$signed({(^~(8'hbb))})));
        end
      reg103 <= $unsigned(((+{$signed(reg101), ((8'hb5) || reg99)}) ?
          $signed(((~|(8'ha4)) ?
              (wire86 ? reg101 : (8'hae)) : ((8'hac) ?
                  wire84 : wire87))) : (((wire84 || reg95) ?
                  (reg92 || reg102) : $signed(reg99)) ?
              ({reg95} ? $signed(reg101) : $unsigned(reg100)) : ((~reg90) ?
                  reg95 : reg100))));
    end
  assign wire104 = {{reg90}, ($signed($signed((^wire82))) < (7'h40))};
  assign wire105 = wire80[(4'hf):(4'h9)];
  assign wire106 = $unsigned((8'hb6));
  always
    @(posedge clk) begin
      reg107 <= (wire82 ?
          $unsigned($signed(((reg90 ? reg95 : reg101) ?
              (wire88 + wire85) : (&(8'hb7))))) : reg92);
      reg108 <= ($unsigned(wire80[(5'h11):(3'h6)]) && reg92[(4'h9):(3'h5)]);
      reg109 <= (8'hba);
      reg110 <= reg103[(1'h0):(1'h0)];
      if ((wire86 ?
          {wire106[(3'h7):(1'h1)],
              (reg108[(2'h3):(1'h0)] | $signed((8'had)))} : (^~$signed(((reg92 ?
              reg89 : reg89) >= (7'h40))))))
        begin
          reg111 <= wire85[(3'h7):(3'h6)];
          reg112 <= $signed(reg89[(3'h4):(3'h4)]);
          reg113 <= reg97[(1'h1):(1'h1)];
        end
      else
        begin
          reg111 <= $signed(($signed($unsigned({(7'h43),
              reg100})) ^ $signed((~(&reg107)))));
        end
    end
endmodule
