module top
#(parameter param180 = ((~|(&{(+(8'hbc)), (+(8'had))})) < ((~&(((8'hb3) ? (8'hbf) : (8'haa)) ? ((7'h43) ? (7'h43) : (8'hb8)) : (!(8'h9c)))) != (({(8'ha4)} ? (!(8'ha7)) : ((7'h41) ? (8'hbc) : (7'h41))) && ((^(8'hb9)) ? ((8'hba) ~^ (8'ha8)) : ((8'h9e) ^ (8'h9e)))))), 
parameter param181 = (param180 ? {({param180} ? param180 : ({param180} & (param180 - param180)))} : param180))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire179;
  wire [(5'h10):(1'h0)] wire178;
  wire [(5'h10):(1'h0)] wire177;
  wire signed [(3'h6):(1'h0)] wire176;
  wire signed [(3'h7):(1'h0)] wire175;
  wire [(5'h15):(1'h0)] wire174;
  wire signed [(5'h13):(1'h0)] wire173;
  wire signed [(4'hc):(1'h0)] wire172;
  wire [(5'h12):(1'h0)] wire171;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire169;
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire5,
                 wire6,
                 wire7,
                 wire169,
                 (1'h0)};
  assign wire5 = $signed(wire2);
  assign wire6 = $unsigned($unsigned((+wire5)));
  assign wire7 = wire6;
  module8 #() modinst170 (wire169, clk, wire2, wire3, wire0, wire6, wire1);
  assign wire171 = {wire7};
  assign wire172 = ((~&(wire1[(5'h11):(4'h9)] ?
                       ($signed(wire4) == (~wire6)) : wire2)) < wire3);
  assign wire173 = {{wire169[(1'h1):(1'h1)],
                           ($signed((wire2 ^ wire171)) ?
                               wire4[(3'h5):(3'h4)] : $signed((&wire0)))}};
  assign wire174 = $signed(wire0[(3'h7):(3'h5)]);
  assign wire175 = $signed(wire5[(2'h3):(2'h3)]);
  assign wire176 = wire5[(4'ha):(3'h6)];
  assign wire177 = (~&((wire7[(4'h9):(1'h0)] || {(8'hab), $signed(wire1)}) ?
                       $unsigned($signed($signed(wire173))) : (wire0 ?
                           (~^$unsigned(wire7)) : (8'hb0))));
  assign wire178 = wire174[(2'h3):(2'h3)];
  assign wire179 = wire178;
endmodule

module module8
#(parameter param168 = ((8'ha4) ? (|(8'hbb)) : (((!((7'h43) == (8'hbe))) ? (~^(+(8'ha5))) : (|{(8'hbe)})) <<< (&{((8'ha9) * (8'ha1))}))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire167;
  wire signed [(4'hb):(1'h0)] wire166;
  wire signed [(3'h5):(1'h0)] wire164;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire124;
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire164,
                 wire29,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire45,
                 wire124,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 (1'h0)};
  module14 #() modinst30 (wire29, clk, wire13, wire10, wire12, wire11);
  assign wire31 = $unsigned(wire13);
  assign wire32 = wire13[(2'h3):(2'h2)];
  assign wire33 = (~(~|$signed((wire32[(4'hb):(1'h0)] + $unsigned(wire29)))));
  assign wire34 = ((!(((wire10 ^ wire13) ?
                      wire12[(2'h2):(1'h0)] : (wire12 ?
                          wire13 : wire33)) >>> ($unsigned((8'hab)) >>> wire13))) ^ $unsigned($signed($unsigned(wire9))));
  assign wire35 = $signed(({$signed({(8'hb3), wire10})} ^ $unsigned((-(wire11 ?
                      wire34 : (8'hbd))))));
  assign wire36 = {$signed($signed(wire11)), wire12[(3'h4):(2'h2)]};
  assign wire37 = $unsigned(wire11[(1'h1):(1'h1)]);
  assign wire38 = $unsigned((wire12 ? wire12 : $unsigned(wire35)));
  always
    @(posedge clk) begin
      reg39 <= (wire31[(2'h2):(1'h1)] ?
          $signed((&$signed($unsigned(wire35)))) : (8'hb6));
      if ($signed((((8'hb2) << (8'hb9)) ^~ wire31)))
        begin
          reg40 <= (wire35[(1'h0):(1'h0)] ?
              (($signed((-(8'ha3))) <<< (wire36 << wire31)) >> wire9) : $unsigned($signed((~^$unsigned((7'h41))))));
          reg41 <= $signed((wire34 ^~ (($unsigned(wire35) ?
              $unsigned(wire9) : (^~wire9)) - wire10)));
        end
      else
        begin
          reg40 <= (~|((-{(8'hbb)}) >>> ((((8'hb8) ? (8'ha7) : wire10) ?
              (^~wire29) : (wire36 || reg40)) ^~ {reg39, $signed(wire32)})));
        end
      if (wire13[(1'h1):(1'h1)])
        begin
          reg42 <= (wire12 ?
              ($signed($signed((wire38 <= (7'h41)))) ?
                  ($signed(reg40) >>> (wire12 | (wire11 ?
                      (8'haf) : wire38))) : $signed(wire33)) : (^$signed(wire32)));
          reg43 <= wire38;
          reg44 <= {$unsigned(wire9)};
        end
      else
        begin
          reg42 <= ($signed((((wire12 ? wire13 : wire11) ?
              (reg43 ?
                  (8'ha0) : reg40) : $signed(wire13)) >> (|(~|reg40)))) ^~ {$unsigned({(-(8'ha5))})});
          reg43 <= ((reg40[(3'h5):(3'h4)] ?
                  {reg43, wire29} : $unsigned($unsigned(reg42))) ?
              ($signed(($unsigned((8'ha8)) ^~ reg44)) ?
                  {$signed((reg41 ? reg42 : wire32)),
                      $signed((wire10 ?
                          (8'hab) : wire34))} : (+((8'ha5) <= {wire34}))) : $signed((~wire37[(2'h2):(2'h2)])));
        end
    end
  assign wire45 = (&$unsigned(reg41));
  module46 #() modinst125 (wire124, clk, reg43, wire29, wire10, wire32);
  always
    @(posedge clk) begin
      if ((reg44[(3'h4):(2'h2)] <= (|wire32[(1'h0):(1'h0)])))
        begin
          reg126 <= reg40;
          reg127 <= wire34;
          reg128 <= {(~&(~^$signed(reg42[(3'h6):(3'h4)])))};
          reg129 <= ((!wire9) ? reg126 : wire35[(4'hb):(4'h8)]);
        end
      else
        begin
          reg126 <= ($unsigned(({(^~wire29),
              (~^(8'hb5))} <<< reg39[(4'ha):(3'h4)])) < $unsigned($signed(($unsigned(wire29) <= wire124[(4'hc):(1'h0)]))));
          reg127 <= wire38[(1'h1):(1'h1)];
          reg128 <= ($unsigned(wire12[(3'h6):(3'h6)]) ?
              reg127 : wire9[(3'h5):(3'h5)]);
        end
      reg130 <= reg40[(3'h4):(1'h0)];
    end
  module131 #() modinst165 (.wire132(wire11), .wire134(reg43), .y(wire164), .wire136(reg127), .wire133(reg40), .wire135(wire31), .clk(clk));
  assign wire166 = ((($signed({wire9}) ? wire10[(4'ha):(2'h2)] : reg129) ?
                       reg41[(2'h3):(2'h2)] : (~|{(wire10 ~^ (8'ha7))})) > $unsigned({(-reg129[(2'h3):(1'h1)])}));
  assign wire167 = wire29[(2'h2):(1'h1)];
endmodule

module module131
#(parameter param162 = ((^((~|(^~(8'h9d))) ? {(7'h43), (+(8'h9e))} : (((8'hb2) >>> (8'ha7)) ? ((8'hb9) ? (8'h9c) : (8'ha4)) : {(7'h42), (7'h42)}))) ? (8'ha8) : ({(((8'hbf) ? (8'hbd) : (8'ha7)) ? ((8'hb9) ? (8'hb9) : (8'ha6)) : ((8'hb8) ? (8'hb3) : (8'hbd))), (~&((8'haf) ^ (8'haa)))} ? (((~(8'hab)) ? {(8'hb6)} : ((8'ha6) + (8'haf))) ^ (((8'ha3) <<< (8'ha7)) | ((7'h44) ? (8'hb2) : (8'h9e)))) : (({(8'ha4)} ? ((8'hb3) == (8'hbe)) : ((8'hb8) >>> (8'hb8))) << ({(7'h44)} ^ {(8'hba), (8'hbc)})))), 
parameter param163 = {(~&param162), {(((param162 ? param162 : param162) ? (-param162) : (param162 && param162)) ~^ (8'ha1))}})
(y, clk, wire136, wire135, wire134, wire133, wire132);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire136;
  input wire signed [(5'h10):(1'h0)] wire135;
  input wire signed [(5'h13):(1'h0)] wire134;
  input wire signed [(4'h9):(1'h0)] wire133;
  input wire [(3'h6):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire160;
  wire signed [(2'h3):(1'h0)] wire159;
  wire [(4'h8):(1'h0)] wire158;
  wire [(3'h6):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire156;
  wire [(2'h3):(1'h0)] wire155;
  wire [(3'h5):(1'h0)] wire143;
  wire [(2'h2):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire141;
  wire signed [(3'h5):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire139;
  wire [(5'h13):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire137;
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(3'h4):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 reg161,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire137 = (|wire136[(4'hd):(4'ha)]);
  assign wire138 = wire137;
  assign wire139 = $signed(wire138[(3'h5):(3'h5)]);
  assign wire140 = $signed(((^wire133[(2'h3):(2'h2)]) ?
                       {$signed((&(8'ha6)))} : $signed((&(&(8'hb1))))));
  assign wire141 = wire137[(3'h4):(2'h2)];
  assign wire142 = ($unsigned($signed({$signed(wire137)})) >> wire133[(1'h0):(1'h0)]);
  assign wire143 = $signed({$unsigned(wire135),
                       (wire139[(2'h3):(1'h1)] ?
                           ((-wire138) ?
                               ((8'h9f) + wire140) : $signed(wire134)) : wire142)});
  always
    @(posedge clk) begin
      reg144 <= wire132;
      reg145 <= {($unsigned($signed($unsigned(wire136))) ?
              wire135[(4'he):(2'h2)] : $unsigned(wire143[(2'h2):(1'h0)]))};
      reg146 <= {(^{$unsigned((wire134 ? wire138 : (8'hb7))),
              (|wire137[(4'hc):(4'h9)])})};
      if ($signed(($signed({{wire132, wire138},
          $signed(wire133)}) | {$signed((~|wire142)),
          ({reg144} + (wire132 ? wire142 : wire132))})))
        begin
          if ($unsigned(($unsigned(((8'ha7) ?
                  $unsigned((8'haa)) : $unsigned(wire136))) ?
              $signed(reg145[(4'he):(3'h6)]) : {(~&(wire142 ?
                      wire143 : wire142))})))
            begin
              reg147 <= $unsigned(((wire140 ?
                  {(wire142 ?
                          (8'ha7) : (8'h9c))} : (-(8'hb9))) == ((~^$unsigned(wire143)) >= (wire137 ?
                  (reg145 ? reg144 : wire136) : (&wire138)))));
              reg148 <= (^($signed((8'hb6)) ?
                  ($unsigned($signed(wire138)) ?
                      ($signed(wire135) && (8'haf)) : $signed($unsigned(wire139))) : ((wire141 ?
                          reg144[(3'h5):(1'h1)] : $signed((8'ha2))) ?
                      ((wire140 != wire136) ?
                          (wire134 && reg146) : (wire141 && (8'haa))) : {wire135[(4'h9):(2'h3)],
                          {wire140, wire132}})));
              reg149 <= $signed(((^{(8'hb3),
                  (wire140 >> wire140)}) + wire140[(3'h5):(1'h0)]));
              reg150 <= ((($signed((wire136 ^ reg145)) ?
                          (wire140 ?
                              (wire139 & wire134) : wire141) : $unsigned((reg145 ?
                              wire136 : (7'h41)))) ?
                      (~(+reg145)) : wire133) ?
                  ({(^~$signed(wire142)),
                      (!(wire140 << reg149))} >= $signed((((8'hb9) ?
                      wire133 : reg144) + (reg149 ~^ reg145)))) : $signed(($signed((wire143 ?
                      (8'hbf) : wire140)) <<< (8'haa))));
            end
          else
            begin
              reg147 <= ((~&reg146[(1'h0):(1'h0)]) ?
                  $signed((wire138 ^~ wire133)) : wire141[(2'h2):(1'h0)]);
              reg148 <= {wire141[(2'h3):(2'h3)]};
              reg149 <= (7'h41);
            end
          reg151 <= ((reg149 >> {$unsigned(wire141),
                  ((wire142 != reg147) == $unsigned((8'ha0)))}) ?
              {$signed(wire142),
                  $signed({((8'hbb) ? (8'hb3) : wire133),
                      reg145})} : ((~&((wire132 < reg150) & reg150)) ?
                  (-$signed((8'haa))) : (reg146 ?
                      $signed($signed(wire138)) : {$unsigned(reg149)})));
          reg152 <= ((^~$signed($unsigned(reg151))) >>> wire140);
          reg153 <= (~{($unsigned(wire141) ?
                  $unsigned($signed(reg147)) : ((~reg152) < $signed(wire135))),
              $signed(wire141[(1'h1):(1'h1)])});
          reg154 <= ((reg151 ?
                  $signed((~(~&wire135))) : $signed(wire136[(3'h7):(3'h6)])) ?
              $unsigned((!wire135)) : ($signed($unsigned({wire141,
                  wire133})) >= reg153[(1'h0):(1'h0)]));
        end
      else
        begin
          if ($unsigned((~&{(reg153 != (~|(8'ha9))), $unsigned((-wire143))})))
            begin
              reg147 <= (((-$signed($unsigned(wire142))) ?
                  (~^((~|(8'haa)) <= $signed(reg145))) : {$unsigned((|reg152))}) || (wire142 ~^ (~^(^~(reg153 - wire133)))));
              reg148 <= ($unsigned(reg147) < (~&((reg148 | wire141) ?
                  $unsigned(wire133) : wire143)));
            end
          else
            begin
              reg147 <= {(^~$signed(($signed(reg151) ?
                      {wire135, reg151} : reg144)))};
            end
        end
    end
  assign wire155 = $signed($signed(wire137));
  assign wire156 = reg147;
  assign wire157 = (8'hbd);
  assign wire158 = reg152[(3'h4):(2'h2)];
  assign wire159 = reg154;
  assign wire160 = (($unsigned($signed(wire157[(2'h3):(2'h3)])) * $unsigned((-(~(8'ha3))))) ?
                       $signed((((|wire133) ? reg152 : $signed(wire138)) ?
                           ($unsigned(wire133) > reg151[(2'h3):(2'h3)]) : wire159[(1'h1):(1'h1)])) : wire143);
  always
    @(posedge clk) begin
      reg161 <= wire140[(1'h0):(1'h0)];
    end
endmodule

module module46  (y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h351):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire50;
  input wire signed [(2'h2):(1'h0)] wire49;
  input wire signed [(5'h11):(1'h0)] wire48;
  input wire [(4'ha):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(5'h12):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire51;
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire83,
                 wire81,
                 wire80,
                 wire51,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
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
                 reg96,
                 reg95,
                 reg94,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg82,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire51 = {wire50[(1'h0):(1'h0)], wire50[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg52 <= ((|wire51[(3'h7):(3'h6)]) <<< wire50);
      reg53 <= $unsigned(reg52[(4'ha):(4'ha)]);
      reg54 <= $unsigned(($signed((wire49[(2'h2):(2'h2)] * wire51[(2'h3):(2'h2)])) ?
          wire50[(1'h0):(1'h0)] : wire51));
    end
  always
    @(posedge clk) begin
      reg55 <= ($signed((^~(&wire48[(3'h7):(3'h4)]))) & $signed((&wire48[(1'h0):(1'h0)])));
      reg56 <= reg52;
      if (reg56[(4'hc):(1'h1)])
        begin
          if (wire51[(4'h9):(4'h8)])
            begin
              reg57 <= {($signed(reg53[(1'h1):(1'h1)]) || (wire49 <= $signed(wire51[(1'h1):(1'h0)]))),
                  {$signed($unsigned($signed(wire50)))}};
              reg58 <= $unsigned(((~^(8'ha8)) ?
                  (8'hb6) : $unsigned(reg55[(2'h2):(1'h0)])));
              reg59 <= $signed((~(reg52 >>> ($unsigned(reg56) ^ reg57[(1'h0):(1'h0)]))));
              reg60 <= wire49[(1'h1):(1'h1)];
              reg61 <= (($unsigned($signed((reg53 - reg60))) < $signed(({reg55,
                  reg55} | reg55[(3'h6):(3'h6)]))) | reg59[(3'h4):(2'h3)]);
            end
          else
            begin
              reg57 <= reg55;
            end
          reg62 <= (({$unsigned({reg54}), (&reg57[(3'h5):(3'h5)])} ?
                  (~^$signed(reg54[(1'h0):(1'h0)])) : $signed(((+reg54) ?
                      reg59[(1'h0):(1'h0)] : $signed(wire48)))) ?
              {($unsigned((reg54 ?
                      reg57 : reg57)) ^ $unsigned(wire47[(3'h6):(2'h3)])),
                  reg60[(4'ha):(2'h3)]} : ($signed($unsigned({reg56})) >>> $unsigned(((!reg60) & (+(8'haf))))));
          reg63 <= wire50;
          if (({wire47, reg61} >> reg63[(3'h4):(2'h2)]))
            begin
              reg64 <= ((8'hb3) ^~ wire48[(4'h8):(2'h3)]);
              reg65 <= $signed(reg56);
              reg66 <= (&$unsigned($signed({reg57})));
              reg67 <= (8'ha7);
            end
          else
            begin
              reg64 <= (((&$unsigned(reg58)) ~^ wire48) < (reg56 ?
                  (((reg59 | reg53) ~^ $unsigned(reg55)) << wire51) : (((reg55 ?
                          reg63 : reg62) != reg60) ?
                      $unsigned(reg57[(1'h0):(1'h0)]) : {reg61[(1'h0):(1'h0)]})));
              reg65 <= $unsigned($signed(reg55[(2'h3):(2'h2)]));
              reg66 <= $unsigned(({({reg60, reg62} ?
                          (wire48 ? reg61 : (8'hb6)) : reg57),
                      (|reg60)} ?
                  (reg60 != $unsigned({wire50, reg64})) : (8'hb5)));
              reg67 <= ($unsigned(reg60[(1'h1):(1'h1)]) ?
                  ({$unsigned($signed(reg56))} ?
                      {reg52,
                          ((8'hb5) + wire49)} : (reg58[(1'h0):(1'h0)] == reg54)) : $signed({reg58}));
              reg68 <= $unsigned(reg57);
            end
          reg69 <= {(($unsigned($signed(wire49)) ?
                      wire47 : ($unsigned(reg54) ?
                          $unsigned(wire49) : (^wire49))) ?
                  wire50[(2'h2):(1'h1)] : wire49),
              ((!$signed(wire47)) ?
                  reg53[(2'h2):(1'h1)] : $signed(($unsigned(reg62) ~^ reg66[(3'h4):(3'h4)])))};
        end
      else
        begin
          reg57 <= $signed((reg57[(3'h4):(1'h1)] ^ (((^~reg59) & (-wire51)) ?
              $unsigned((-reg59)) : $unsigned({reg66}))));
          reg58 <= ((~|reg63[(2'h2):(2'h2)]) ?
              (8'hb6) : (reg61 ?
                  (^reg61[(1'h1):(1'h1)]) : wire49[(2'h2):(1'h1)]));
          reg59 <= $unsigned((reg59[(4'he):(4'hc)] ~^ ((!$signed(wire47)) | ((8'hbe) + (reg65 >>> reg69)))));
          reg60 <= reg55;
        end
      if ((reg65[(3'h4):(3'h4)] ?
          (+(^$unsigned((reg65 ? reg62 : reg67)))) : reg66[(2'h2):(1'h0)]))
        begin
          if ({reg58})
            begin
              reg70 <= wire47;
              reg71 <= {((^~($signed(reg56) > $unsigned((8'hac)))) | $unsigned(($signed(reg59) << $unsigned((8'hba)))))};
              reg72 <= wire49[(1'h1):(1'h0)];
            end
          else
            begin
              reg70 <= $unsigned({$unsigned((reg64 ?
                      $signed((8'ha8)) : $unsigned(reg60)))});
              reg71 <= ($unsigned(({reg65, reg68} >>> reg67)) >> wire49);
              reg72 <= ($signed((((8'ha3) < (-reg57)) ?
                      (8'hbc) : (reg64 - reg64[(2'h2):(1'h0)]))) ?
                  ((8'ha0) + ($signed((reg55 ? (7'h43) : reg70)) ?
                      ({reg55,
                          reg66} << ((8'hb4) ~^ wire49)) : (reg71[(1'h0):(1'h0)] - (reg66 >> reg58)))) : $unsigned(((~&(reg64 ?
                          reg61 : reg71)) ?
                      (8'hb5) : reg71)));
              reg73 <= {(reg67[(4'hc):(3'h5)] >> (-(^(wire50 ?
                      reg63 : wire51))))};
            end
          if ($signed((reg60 != (({reg56} ?
                  (reg64 ? reg57 : reg60) : $signed(reg53)) ?
              $signed((wire51 + (8'hba))) : ($signed(reg60) ?
                  {reg72} : reg73)))))
            begin
              reg74 <= {(reg72[(4'h9):(3'h4)] & $unsigned(((reg54 ~^ reg71) <= {reg69,
                      (8'hac)}))),
                  reg64};
              reg75 <= (reg65 << ((({reg59} ? reg64 : $unsigned(reg58)) ?
                      ($unsigned(reg55) << (reg55 <<< reg63)) : ($unsigned(reg68) < reg61)) ?
                  (8'hb1) : (~$signed((8'ha2)))));
              reg76 <= (((8'ha0) ?
                  ({reg69} >> wire47[(4'ha):(1'h1)]) : wire51[(4'h8):(3'h4)]) && $signed($unsigned(wire48)));
            end
          else
            begin
              reg74 <= (reg70[(4'h9):(1'h1)] + $signed((((~wire47) >>> (reg75 * wire49)) + $unsigned(reg71[(1'h1):(1'h0)]))));
            end
          reg77 <= (($unsigned(reg75[(2'h3):(1'h1)]) || (wire49[(1'h1):(1'h1)] ?
                  ((!reg56) ? (&(8'ha1)) : {reg72}) : $unsigned((-(8'hbf))))) ?
              (reg56[(1'h1):(1'h0)] >= {(+(^reg59)),
                  {$signed((7'h44)),
                      wire49}}) : $unsigned(reg71[(1'h0):(1'h0)]));
          reg78 <= reg62;
          reg79 <= ((($unsigned(reg74[(1'h0):(1'h0)]) ? (~&reg68) : wire50) ?
                  (8'h9e) : $signed(((reg72 ? wire47 : reg70) ?
                      wire48[(4'hf):(4'h8)] : (reg62 >> (8'hb6))))) ?
              (reg67 ?
                  ({reg66[(2'h3):(2'h3)], $signed(wire49)} ?
                      reg75[(4'he):(2'h3)] : reg60[(3'h6):(3'h4)]) : reg60) : $signed($signed({$signed((8'hbb))})));
        end
      else
        begin
          reg70 <= {$signed($signed({reg65}))};
        end
    end
  assign wire80 = ((~^{{reg60, reg52[(3'h7):(3'h6)]}}) ?
                      reg66[(3'h4):(2'h3)] : ($signed(reg65[(1'h0):(1'h0)]) || {(reg72 ?
                              (|reg77) : (reg66 ^~ reg70))}));
  assign wire81 = $unsigned($unsigned($signed(((reg54 ?
                      reg55 : reg74) ~^ $signed((8'hbc))))));
  always
    @(posedge clk) begin
      reg82 <= $unsigned(reg68[(1'h1):(1'h1)]);
    end
  assign wire83 = ($signed(wire47[(3'h5):(2'h3)]) ?
                      ({((8'h9d) ? $unsigned(reg61) : $signed(reg67)),
                          reg66[(4'ha):(4'ha)]} ~^ {$signed(reg78[(1'h0):(1'h0)]),
                          (^reg75[(4'h8):(1'h1)])}) : {(reg54 ?
                              (~&(wire50 <<< reg60)) : (reg54 < $unsigned(reg78)))});
  always
    @(posedge clk) begin
      reg84 <= {$unsigned($unsigned({{(8'hb8), reg61}}))};
      reg85 <= $signed(((reg60 > (reg62[(2'h2):(2'h2)] ?
          $unsigned(reg62) : reg69)) * ({(reg55 ? reg66 : reg59),
          (reg69 > (8'hbe))} && wire80[(3'h6):(1'h1)])));
      reg86 <= ($unsigned($signed((+$signed(reg62)))) << {{reg57[(1'h0):(1'h0)]}});
      reg87 <= (reg78 ? (8'ha9) : (8'h9d));
    end
  assign wire88 = wire50[(2'h2):(1'h1)];
  assign wire89 = reg75;
  assign wire90 = (((reg78[(2'h3):(2'h3)] ? $unsigned(reg62) : wire49) ?
                          $signed((&$signed(reg56))) : {$signed(reg68),
                              (8'h9c)}) ?
                      $signed(wire47) : reg87);
  assign wire91 = ({reg85, $unsigned($signed($signed((8'ha8))))} ?
                      {($unsigned((reg87 + reg74)) ^~ reg74[(1'h1):(1'h0)]),
                          (^~(reg84 >> (7'h40)))} : ((($signed((8'h9f)) ?
                              reg60 : $unsigned((8'hab))) && {(wire49 ?
                                  reg64 : (7'h43)),
                              (wire89 >>> wire81)}) ?
                          (^wire48[(2'h3):(2'h2)]) : $signed(((~reg61) != reg54))));
  assign wire92 = (8'hb7);
  assign wire93 = (((+wire83[(5'h14):(1'h0)]) ?
                          wire92[(5'h11):(4'hd)] : $signed(reg54)) ?
                      wire88 : {$unsigned($unsigned(wire51))});
  always
    @(posedge clk) begin
      if (reg60)
        begin
          reg94 <= $unsigned((wire49[(1'h0):(1'h0)] ?
              reg54 : ($unsigned((~&reg86)) ?
                  $signed((reg84 ^ reg66)) : $unsigned($signed(reg57)))));
          reg95 <= reg76[(5'h12):(3'h5)];
          reg96 <= reg78;
        end
      else
        begin
          reg94 <= ($signed(($signed($unsigned((8'ha4))) | $unsigned($signed((7'h40))))) ?
              $signed((((~wire90) - $unsigned(wire89)) ~^ reg55[(2'h2):(1'h0)])) : (^~$unsigned(reg96[(3'h4):(2'h2)])));
          reg95 <= (^~(~^wire92));
          reg96 <= (|($signed($signed({wire91})) && $unsigned(reg56)));
          reg97 <= (($unsigned((~|wire80)) - reg69) ?
              reg53[(1'h0):(1'h0)] : wire83[(5'h10):(1'h0)]);
          if ((&reg59))
            begin
              reg98 <= $signed(wire50[(1'h1):(1'h1)]);
            end
          else
            begin
              reg98 <= {reg52,
                  {(~$signed(((8'hb9) >>> reg87))), $unsigned(reg98)}};
              reg99 <= (wire50[(1'h0):(1'h0)] >= $unsigned(((+$signed((8'haa))) ?
                  ((reg72 < reg56) ?
                      (~|reg76) : reg96[(4'hc):(2'h3)]) : reg97[(1'h0):(1'h0)])));
              reg100 <= ((reg62[(1'h1):(1'h1)] | wire48) ?
                  reg73[(1'h0):(1'h0)] : (((&(!reg60)) <= $signed($unsigned((8'ha2)))) < reg78));
              reg101 <= wire89[(3'h4):(1'h0)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg102 <= ($signed((~&{$unsigned(reg57)})) ?
          ($signed($signed((wire91 != wire80))) ?
              $signed({wire88[(3'h5):(3'h4)],
                  $unsigned((8'ha9))}) : ($unsigned(((8'had) <= reg94)) == (wire83[(1'h0):(1'h0)] ?
                  (-reg85) : wire92[(4'hc):(3'h4)]))) : (~|$unsigned($signed(((7'h42) ?
              reg78 : wire80)))));
    end
  always
    @(posedge clk) begin
      reg103 <= {(+$signed(({wire93} != (+reg63)))), $signed(reg52)};
      reg104 <= reg82[(3'h4):(1'h0)];
      if ($signed((^(+{(^~(8'h9e))}))))
        begin
          if ($signed(reg79[(5'h13):(4'h8)]))
            begin
              reg105 <= ((~^{(8'hac), (~|(~|(8'hbc)))}) >= (8'hbd));
              reg106 <= reg99;
              reg107 <= wire83[(5'h15):(4'h8)];
            end
          else
            begin
              reg105 <= $signed(reg58[(1'h1):(1'h0)]);
            end
          reg108 <= {reg71,
              $signed({$signed(wire49[(1'h1):(1'h0)]),
                  $signed($unsigned(reg78))})};
          reg109 <= (($unsigned(($signed(reg73) ?
              (~^(8'haa)) : reg108[(2'h2):(1'h0)])) << $unsigned(wire49)) ^ $unsigned(((reg59 ?
              reg106[(1'h0):(1'h0)] : {wire51}) * reg70[(4'h9):(3'h7)])));
          if (wire51[(2'h3):(2'h3)])
            begin
              reg110 <= $unsigned((8'haf));
              reg111 <= (reg106[(2'h2):(1'h0)] < (8'hb3));
            end
          else
            begin
              reg110 <= (~(+(8'hb1)));
              reg111 <= $signed((^reg101[(2'h2):(1'h0)]));
              reg112 <= wire91[(1'h0):(1'h0)];
              reg113 <= (8'hb6);
            end
          reg114 <= reg107;
        end
      else
        begin
          if (reg71[(1'h1):(1'h1)])
            begin
              reg105 <= (reg85[(4'h8):(3'h6)] == reg86);
            end
          else
            begin
              reg105 <= $signed((~$unsigned((-reg52[(3'h5):(3'h5)]))));
              reg106 <= wire80;
              reg107 <= $signed((~$unsigned(reg107)));
              reg108 <= $unsigned((~&(~|reg99)));
              reg109 <= wire47[(3'h7):(3'h4)];
            end
          if (reg98)
            begin
              reg110 <= $unsigned((((^$signed(wire88)) ?
                  reg72[(4'ha):(3'h4)] : $unsigned((^reg95))) > $signed($unsigned(((8'hb8) ?
                  wire47 : (7'h44))))));
              reg111 <= (!$signed((($unsigned(reg107) ?
                  reg112 : (reg68 && reg111)) && ((reg53 ? reg102 : (8'ha5)) ?
                  (8'ha4) : reg76))));
              reg112 <= reg112[(4'hb):(4'ha)];
            end
          else
            begin
              reg110 <= $signed($unsigned(((7'h43) ?
                  reg53 : reg66[(4'hf):(1'h1)])));
            end
          if (($signed(wire90) ?
              $unsigned(reg77) : $unsigned(reg84[(1'h1):(1'h1)])))
            begin
              reg113 <= reg56[(4'h8):(2'h3)];
              reg114 <= $signed(reg53);
            end
          else
            begin
              reg113 <= (^(!wire47));
              reg114 <= (|$unsigned({$signed(reg78[(3'h5):(3'h4)]),
                  ($unsigned(reg97) ? (reg98 ^ wire47) : $signed(reg106))}));
            end
          if (reg112[(1'h0):(1'h0)])
            begin
              reg115 <= $unsigned($signed((((-reg75) >> (reg110 == reg96)) ^ ($signed(wire92) <= (reg109 ?
                  (8'hac) : reg105)))));
            end
          else
            begin
              reg115 <= wire92[(2'h2):(1'h1)];
            end
        end
      if ((-$unsigned(((+$signed(reg98)) ? reg105[(1'h1):(1'h1)] : reg82))))
        begin
          reg116 <= reg113;
          if ($signed(((wire48 ?
              reg108 : ($signed(reg110) ?
                  (reg111 ?
                      reg109 : reg99) : $unsigned(reg77))) <<< {reg65[(2'h3):(1'h1)],
              (~|$signed(reg101))})))
            begin
              reg117 <= (((($unsigned(reg75) ?
                              reg97[(1'h0):(1'h0)] : $signed(wire47)) ?
                          (reg64[(3'h5):(1'h1)] ?
                              (^reg67) : (~&reg77)) : {(wire80 ?
                                  (8'ha7) : reg85)}) ?
                      ((!$signed(reg71)) ?
                          (7'h43) : ($signed(reg98) || (reg85 <<< reg74))) : $unsigned($unsigned((^reg58)))) ?
                  (reg60[(1'h0):(1'h0)] ?
                      (reg53[(2'h2):(1'h1)] ?
                          {reg110, reg99} : ((reg105 ?
                              reg104 : reg104) == (8'h9f))) : wire91[(1'h0):(1'h0)]) : (reg71 ?
                      ({$unsigned(reg96)} ?
                          reg102[(2'h3):(2'h3)] : $signed((-wire88))) : $signed((reg111[(2'h3):(1'h1)] | (reg107 ?
                          reg55 : wire47)))));
              reg118 <= reg94[(5'h12):(3'h7)];
              reg119 <= reg66;
              reg120 <= ({$signed((reg69 - ((8'hac) ? reg78 : reg63))),
                      reg112} ?
                  $signed(reg103) : ($unsigned((~|reg107)) & {(reg117[(5'h11):(4'ha)] ?
                          $unsigned(reg74) : reg78[(3'h6):(3'h5)]),
                      ($unsigned(reg106) <= (^(8'had)))}));
            end
          else
            begin
              reg117 <= reg75;
              reg118 <= (8'ha2);
              reg119 <= ((($signed((8'hbd)) ~^ ((8'ha7) ?
                      $signed(reg101) : reg82[(1'h0):(1'h0)])) ~^ wire48) ?
                  (~^reg61[(2'h3):(2'h2)]) : reg73[(4'h9):(1'h1)]);
              reg120 <= (~&(((^(reg108 <<< reg84)) ^~ $unsigned((~&wire88))) ?
                  $signed($signed(wire93[(3'h4):(2'h3)])) : {$unsigned($unsigned(reg69)),
                      reg115[(4'he):(2'h3)]}));
            end
        end
      else
        begin
          reg116 <= $unsigned($signed($unsigned((reg52 ?
              {(8'hbb), reg55} : $unsigned(wire51)))));
          reg117 <= reg85;
          if (((^~$signed({(reg58 == reg100), (reg76 | reg107)})) ^~ ((-reg99) ?
              $signed($signed({(8'ha8)})) : (-$unsigned(reg76)))))
            begin
              reg118 <= $unsigned(reg109);
            end
          else
            begin
              reg118 <= $signed(((~|($signed(reg99) & reg119)) ?
                  reg96 : $signed({$unsigned(reg113), $unsigned(wire93)})));
              reg119 <= ({wire47[(2'h3):(2'h2)]} || (reg118 ?
                  reg104 : reg71[(3'h4):(2'h2)]));
              reg120 <= $unsigned(reg78);
            end
        end
      if ((&($unsigned((((7'h40) + reg120) ? reg84 : wire51[(1'h1):(1'h1)])) ?
          $signed($signed($signed(reg61))) : $signed($unsigned($unsigned(reg98))))))
        begin
          reg121 <= $unsigned(reg56);
        end
      else
        begin
          reg121 <= {reg69[(3'h5):(2'h3)]};
        end
    end
  assign wire122 = (~|reg55[(1'h0):(1'h0)]);
  assign wire123 = ((!(~|$unsigned({reg54, reg56}))) ?
                       reg87 : (^reg98[(2'h3):(2'h2)]));
endmodule

module module14
#(parameter param28 = (~&{(^({(8'hb9), (8'had)} >= (8'ha3)))}))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 (1'h0)};
  assign wire19 = (!{$unsigned(wire16),
                      ($signed($unsigned(wire18)) >= ((wire15 ~^ wire18) ?
                          wire18[(3'h6):(3'h6)] : {wire17}))});
  assign wire20 = $unsigned($unsigned({((wire15 >= wire15) ?
                          $unsigned(wire19) : (~^wire18)),
                      wire19[(1'h1):(1'h1)]}));
  assign wire21 = (-{wire18[(4'h8):(3'h7)]});
  assign wire22 = $unsigned(wire17);
  assign wire23 = $unsigned(((wire18[(4'h8):(3'h4)] <= wire19[(4'hf):(2'h3)]) == $signed((!wire19[(2'h3):(2'h3)]))));
  assign wire24 = $signed(wire16[(3'h6):(1'h1)]);
  assign wire25 = (($unsigned((8'hab)) ?
                      {{(wire18 == wire24)}} : $signed(((wire20 ~^ wire20) ?
                          (wire21 ?
                              wire19 : wire22) : $unsigned(wire18)))) >> $unsigned((-(8'ha5))));
  assign wire26 = ((8'hbf) ? (8'hb8) : wire17[(4'h9):(2'h3)]);
  assign wire27 = wire19[(3'h5):(2'h2)];
endmodule
