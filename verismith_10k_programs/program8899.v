module top
#(parameter param167 = ((((+(&(8'hab))) && (~&((7'h43) ^~ (8'hbc)))) > ((!(|(8'ha5))) ? {((7'h42) ? (8'ha2) : (8'hb1))} : (((7'h42) + (8'hab)) == ((8'ha0) ? (8'hab) : (7'h41))))) - (^~((^~(~(8'hae))) <= ((~|(8'had)) ? ((8'hba) ? (8'ha4) : (8'hb2)) : {(8'ha2)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire166;
  wire [(5'h12):(1'h0)] wire153;
  wire [(4'ha):(1'h0)] wire152;
  wire signed [(5'h15):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire135;
  reg [(5'h13):(1'h0)] reg165 = (1'h0);
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg159 = (1'h0);
  reg signed [(4'he):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg [(3'h7):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  assign y = {wire166,
                 wire153,
                 wire152,
                 wire150,
                 wire90,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire94,
                 wire95,
                 wire96,
                 wire97,
                 wire135,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg13,
                 reg92,
                 reg93,
                 (1'h0)};
  assign wire5 = ({$unsigned($unsigned((wire1 ? (8'ha8) : wire1))),
                     (~^wire3)} || (~|$signed((+$signed(wire4)))));
  assign wire6 = (^wire4);
  assign wire7 = wire4;
  assign wire8 = ((wire7[(4'hc):(4'hb)] ?
                         (^~($signed(wire3) ?
                             $unsigned((8'hae)) : (&wire5))) : (($signed((8'hb6)) ?
                                 wire1 : (8'ha3)) ?
                             $signed((wire1 ?
                                 wire7 : wire4)) : (wire2[(3'h6):(1'h1)] >> (8'hb5)))) ?
                     $unsigned((~^$signed((|wire1)))) : wire1);
  assign wire9 = ((wire2 != wire2) <<< ({wire0[(3'h4):(2'h3)]} ?
                     (^wire3[(4'ha):(4'h8)]) : $unsigned(((^~wire6) ?
                         wire6[(4'h9):(4'h9)] : (|(8'ha3))))));
  assign wire10 = ((wire5[(4'hf):(4'h9)] * {$signed($signed(wire6)),
                      $signed((~^wire9))}) ^ ($unsigned(wire0[(4'hc):(4'hb)]) ?
                      (|(&((8'haf) & wire9))) : {(~^{wire5})}));
  assign wire11 = $signed(wire9[(1'h1):(1'h1)]);
  assign wire12 = {(!(8'hb0))};
  always
    @(posedge clk) begin
      reg13 <= ((^~{wire0[(1'h0):(1'h0)]}) & $unsigned((~|({(8'ha4)} < {(8'ha0),
          wire3}))));
    end
  assign wire14 = wire9[(2'h3):(2'h3)];
  module15 #() modinst91 (.wire16(wire0), .y(wire90), .clk(clk), .wire18(wire14), .wire19(reg13), .wire17(wire3));
  always
    @(posedge clk) begin
      reg92 <= ($unsigned(wire1[(3'h4):(1'h0)]) ?
          $signed(((wire12[(1'h1):(1'h0)] ?
              (wire10 ?
                  (8'hb0) : wire12) : wire10) & {(wire7 + wire5)})) : $signed(wire1[(1'h0):(1'h0)]));
      reg93 <= $unsigned((~&(($signed(wire10) ?
              (~^wire10) : wire7[(3'h6):(3'h5)]) ?
          (~&(wire10 * reg13)) : $signed((reg92 > wire12)))));
    end
  assign wire94 = ((~^wire7[(1'h0):(1'h0)]) == (8'ha4));
  assign wire95 = ((wire12[(2'h2):(2'h2)] | ($signed(wire8[(3'h4):(2'h3)]) ?
                          wire4[(3'h5):(2'h2)] : wire12[(2'h3):(2'h2)])) ?
                      ((wire10[(2'h2):(1'h0)] ^~ reg13[(4'hb):(2'h3)]) || (((wire10 && wire11) - (~(8'hbe))) ?
                          $signed(wire12) : wire12)) : wire90);
  assign wire96 = (+$unsigned({reg92[(2'h3):(2'h2)],
                      $signed($signed(wire95))}));
  assign wire97 = wire11;
  module98 #() modinst136 (wire135, clk, wire8, wire5, wire7, wire11, wire12);
  module137 #() modinst151 (wire150, clk, reg92, wire3, wire0, wire14, wire7);
  assign wire152 = {$unsigned(wire5),
                       (~&{((+wire90) != {wire10, wire150}),
                           wire12[(3'h7):(2'h2)]})};
  assign wire153 = ((^wire8) ?
                       $signed($unsigned($unsigned((~&wire5)))) : wire5);
  always
    @(posedge clk) begin
      if ($unsigned(wire97[(2'h2):(2'h2)]))
        begin
          reg154 <= ((~|(((wire8 ? wire9 : wire90) ?
                      $signed(reg13) : wire7[(4'hb):(3'h7)]) ?
                  wire4 : reg13[(3'h6):(3'h5)])) ?
              (|$signed((wire150[(4'hb):(2'h3)] ?
                  $signed(wire152) : $signed(wire6)))) : $unsigned($unsigned(wire135)));
        end
      else
        begin
          reg154 <= $unsigned(($unsigned((|(reg13 && (8'hab)))) ?
              wire152 : (wire95[(5'h12):(3'h6)] ?
                  ($unsigned(wire90) <<< {wire135}) : wire1)));
        end
      reg155 <= ((wire14 ?
          reg154[(1'h0):(1'h0)] : $unsigned(($unsigned(wire4) ?
              $signed(wire5) : (wire90 ?
                  wire0 : wire94)))) <= (wire2[(4'h8):(3'h6)] <= (wire10 >>> $unsigned($unsigned(wire14)))));
      reg156 <= wire94;
      reg157 <= (7'h40);
    end
  always
    @(posedge clk) begin
      reg158 <= (8'h9d);
      if (($signed(($signed(wire97[(3'h4):(3'h4)]) ?
          reg156 : $unsigned((wire8 ? reg157 : reg93)))) ~^ wire97))
        begin
          reg159 <= (!wire11);
          reg160 <= reg157[(1'h0):(1'h0)];
          reg161 <= wire9[(3'h6):(2'h3)];
          reg162 <= (^~reg159);
        end
      else
        begin
          reg159 <= wire5;
          reg160 <= ((+wire2[(1'h1):(1'h1)]) + reg154);
          if ($signed($unsigned($unsigned((7'h44)))))
            begin
              reg161 <= (8'ha9);
              reg162 <= {($signed((reg161[(1'h1):(1'h0)] ?
                      $signed(wire0) : (8'haf))) - (reg156 ?
                      reg160 : (~|wire97))),
                  (($unsigned((reg156 ?
                      reg159 : reg157)) + $signed((reg158 > (8'hbe)))) - $unsigned(wire153))};
            end
          else
            begin
              reg161 <= (|($signed({$unsigned(reg154)}) ?
                  {((reg13 ? reg162 : reg154) ?
                          $unsigned(wire4) : $unsigned(reg154))} : $unsigned(reg159[(1'h1):(1'h1)])));
              reg162 <= $signed((~(reg93 >= (-wire1[(3'h4):(1'h0)]))));
              reg163 <= (~&(^~{reg158[(4'h9):(2'h2)]}));
              reg164 <= $unsigned($unsigned((((~^wire90) ?
                      (|reg158) : (-wire153)) ?
                  $unsigned(wire11[(4'h9):(4'h8)]) : ((^~wire11) <= (wire7 >= wire2)))));
              reg165 <= {$signed($signed(reg161[(3'h5):(3'h5)])),
                  (($signed((~reg154)) | (wire4 ?
                          (~(8'ha7)) : reg160[(4'h8):(3'h7)])) ?
                      ((+{wire0}) <<< ((^reg162) >>> (wire96 ~^ (8'had)))) : reg155[(3'h7):(1'h0)])};
            end
        end
    end
  assign wire166 = (^~$unsigned((8'h9e)));
endmodule

module module137  (y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire142;
  input wire [(5'h12):(1'h0)] wire141;
  input wire signed [(4'h8):(1'h0)] wire140;
  input wire signed [(2'h2):(1'h0)] wire139;
  input wire signed [(5'h11):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire149;
  wire [(4'hf):(1'h0)] wire148;
  wire [(5'h10):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire146;
  wire [(3'h5):(1'h0)] wire145;
  wire [(4'hf):(1'h0)] wire144;
  wire [(5'h14):(1'h0)] wire143;
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 (1'h0)};
  assign wire143 = wire142[(2'h2):(1'h1)];
  assign wire144 = wire143;
  assign wire145 = (^($unsigned((8'ha9)) != $signed(($signed(wire143) & wire138))));
  assign wire146 = wire145[(2'h3):(1'h1)];
  assign wire147 = wire145;
  assign wire148 = wire146;
  assign wire149 = ($unsigned((wire140[(3'h5):(1'h0)] <<< ($signed(wire142) ?
                       $unsigned(wire147) : $signed(wire146)))) || ((wire139[(1'h0):(1'h0)] ?
                           ({wire144,
                               wire140} ^ $unsigned(wire147)) : wire144[(3'h6):(3'h6)]) ?
                       {$signed($signed(wire148)),
                           wire139} : wire148[(4'he):(2'h3)]));
endmodule

module module98
#(parameter param133 = (8'hb7), 
parameter param134 = (~^(param133 >= (~((+param133) || {(8'ha8), param133})))))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire103;
  input wire [(5'h12):(1'h0)] wire102;
  input wire [(5'h13):(1'h0)] wire101;
  input wire [(4'hd):(1'h0)] wire100;
  input wire [(3'h7):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire [(5'h10):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire125;
  wire [(5'h13):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire122;
  wire [(4'hf):(1'h0)] wire121;
  reg signed [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire125,
                 wire124,
                 wire122,
                 wire121,
                 reg127,
                 reg123,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg104 <= $unsigned(($unsigned(((wire100 ?
              wire101 : wire100) != (8'hbe))) ?
          $signed(((|wire102) ?
              (!wire100) : (-wire103))) : $unsigned({{wire103}})));
      reg105 <= ((8'h9f) & ((($signed(wire100) ?
              $unsigned(wire99) : $signed(wire100)) ?
          {$unsigned(reg104),
              (wire100 << (8'ha4))} : (~^$signed(wire100))) ^~ {wire103,
          $unsigned(wire101[(1'h1):(1'h1)])}));
      reg106 <= {$unsigned(wire103[(1'h0):(1'h0)]),
          ((((reg105 ? reg105 : reg105) && (wire103 ? wire100 : reg104)) ?
                  $unsigned(wire100[(4'h9):(3'h6)]) : $unsigned($unsigned(wire102))) ?
              $signed({reg105, ((8'hb4) - wire101)}) : (wire101 ?
                  $unsigned($signed(reg105)) : ((~&wire103) < wire102[(3'h7):(3'h4)])))};
      if ((+(((wire102[(4'hb):(4'h9)] ?
          $unsigned(wire102) : (wire102 ~^ reg106)) ^~ $signed((wire102 >>> reg106))) >>> (8'hbc))))
        begin
          if ((8'hab))
            begin
              reg107 <= ((~&(((reg105 ? wire103 : (8'ha3)) ?
                  (-(7'h41)) : ((8'hbe) ?
                      wire101 : reg106)) << wire100[(2'h2):(1'h0)])) == $unsigned(wire101));
              reg108 <= $unsigned(wire101);
              reg109 <= wire99[(3'h6):(1'h0)];
            end
          else
            begin
              reg107 <= $unsigned((~^($signed(reg107[(1'h1):(1'h1)]) + (reg105[(4'hc):(1'h0)] ?
                  {reg105, reg109} : (-wire100)))));
              reg108 <= ((8'h9e) ?
                  (!wire101) : (($signed(reg108[(1'h1):(1'h1)]) | reg109) ?
                      wire102 : (((!wire101) ? reg106 : wire101) ?
                          $unsigned((reg109 >>> wire101)) : (~|wire101))));
            end
          if ($signed(reg105))
            begin
              reg110 <= reg104[(5'h12):(5'h11)];
            end
          else
            begin
              reg110 <= (!(+(^~(reg105 ?
                  ((8'hb7) ? wire103 : reg108) : $unsigned(reg105)))));
              reg111 <= (((8'hbf) ^ (wire102[(4'hb):(1'h0)] ?
                  wire100 : ((reg104 ? wire101 : reg107) ?
                      (wire101 ? reg105 : reg108) : (reg104 ?
                          (8'h9d) : wire100)))) & wire102);
              reg112 <= $unsigned(wire99[(3'h6):(3'h4)]);
              reg113 <= $signed((7'h44));
            end
          reg114 <= wire100[(4'h8):(2'h3)];
          reg115 <= $unsigned({(-$signed((wire103 ? reg110 : wire100))),
              $unsigned($unsigned({reg110, wire100}))});
          reg116 <= (~&(~^$unsigned($signed((^reg105)))));
        end
      else
        begin
          if (reg114)
            begin
              reg107 <= (8'hb3);
            end
          else
            begin
              reg107 <= {$unsigned($unsigned(wire99[(1'h1):(1'h0)]))};
              reg108 <= wire101;
              reg109 <= $unsigned((reg112[(3'h5):(1'h0)] ~^ ((8'hb0) * $unsigned((reg106 < (7'h44))))));
              reg110 <= wire99;
              reg111 <= wire100;
            end
          reg112 <= (reg116[(3'h4):(1'h1)] ?
              (((&reg107) ?
                  reg110 : $signed($unsigned((8'hb0)))) < reg108) : ({wire99[(3'h7):(3'h4)],
                  $unsigned((^wire100))} >> {((~^reg115) ?
                      (~wire103) : $signed(reg114))}));
        end
    end
  always
    @(posedge clk) begin
      reg117 <= (8'hbb);
      reg118 <= reg112[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg119 <= {(!((^$signed(wire102)) <<< wire101))};
      reg120 <= ($unsigned(($signed(reg108) ?
              ({reg117, wire99} || $unsigned(reg116)) : reg105)) ?
          (($signed({wire99, wire103}) & (wire100[(1'h1):(1'h1)] ?
                  ((8'ha6) < reg105) : (reg114 ? reg104 : (8'hb0)))) ?
              wire102[(4'hd):(4'ha)] : (!(reg109[(1'h0):(1'h0)] ?
                  $signed(wire99) : $signed(reg111)))) : (wire100 <<< reg109));
    end
  assign wire121 = wire99;
  assign wire122 = $signed($signed($unsigned($unsigned((wire99 ?
                       reg120 : wire121)))));
  always
    @(posedge clk) begin
      reg123 <= (+reg107);
    end
  assign wire124 = (^~({$unsigned((^reg110)),
                       $unsigned($unsigned(wire101))} > $signed((reg116 <= (!reg114)))));
  assign wire125 = $signed((($unsigned((!reg110)) | ((8'hb3) - $unsigned(reg120))) << $unsigned(reg116)));
  assign wire126 = wire99;
  always
    @(posedge clk) begin
      reg127 <= $signed($signed((-({(8'hbe),
          reg105} ^~ reg116[(3'h5):(2'h3)]))));
    end
  assign wire128 = $unsigned({$unsigned(reg119[(3'h6):(3'h4)]),
                       $signed(((+wire103) ? (&reg118) : reg123))});
  assign wire129 = (wire99[(3'h4):(1'h1)] ?
                       ($unsigned(wire99[(2'h3):(1'h1)]) << ($signed(wire101) ?
                           (8'ha9) : $signed($unsigned(reg107)))) : (~&(((reg117 == reg109) ?
                           (reg109 ?
                               reg104 : wire126) : (wire121 == reg115)) - reg123[(1'h0):(1'h0)])));
  assign wire130 = (({$signed((wire122 ? wire125 : wire102))} ?
                           (((~^reg107) ?
                               (!reg127) : (reg107 ?
                                   reg105 : reg107)) && (wire101 ?
                               $signed(wire100) : (reg123 ?
                                   reg114 : (8'ha3)))) : ((!reg105[(4'hb):(3'h4)]) ?
                               wire125[(4'h8):(3'h7)] : ({reg115} & reg107[(1'h0):(1'h0)]))) ?
                       ($unsigned($signed(reg115)) ?
                           (!$unsigned($signed((8'hbc)))) : $unsigned((|$signed(reg106)))) : reg118);
  assign wire131 = (reg108[(3'h4):(1'h0)] >> $signed(($signed(reg123) ?
                       $unsigned(reg106[(4'ha):(3'h4)]) : $unsigned(reg115[(4'he):(4'hd)]))));
  assign wire132 = ($signed(($unsigned(((8'hbe) ? wire129 : reg114)) ?
                       ((reg115 ? reg114 : reg104) < (~&reg104)) : ({(8'hb8),
                               wire102} ?
                           $signed(wire99) : $unsigned(reg114)))) * (~((reg114[(2'h2):(1'h1)] ?
                           {reg110, reg111} : (wire100 <<< reg123)) ?
                       (~&(^wire126)) : ((reg120 || wire125) ?
                           $signed((8'ha0)) : $unsigned(reg106)))));
endmodule

module module15
#(parameter param88 = (~&({{((8'h9d) == (8'hbc)), ((8'hb0) || (8'ha3))}, ((!(8'hae)) ? ((8'hb2) + (8'ha0)) : ((8'ha0) ^~ (8'h9e)))} ? ((|(~(8'ha3))) ? (8'ha0) : (&(~^(8'haa)))) : {{{(8'hb4), (8'h9c)}, (~(7'h41))}})), 
parameter param89 = (param88 > (({param88, (|param88)} & (((8'ha5) * param88) + (param88 - param88))) ? {param88, ({param88} ? (~|(8'ha8)) : {param88})} : ((param88 ? (~^param88) : (param88 ? (8'ha2) : param88)) ? (((8'hab) ? param88 : param88) ^~ (~&param88)) : ((~param88) && (~param88))))))
(y, clk, wire16, wire17, wire18, wire19);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire16;
  input wire [(2'h2):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire86;
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  assign y = {wire20,
                 wire21,
                 wire22,
                 wire41,
                 wire42,
                 wire86,
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
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 (1'h0)};
  assign wire20 = wire17[(2'h2):(2'h2)];
  assign wire21 = wire17;
  assign wire22 = $unsigned($signed(wire19));
  always
    @(posedge clk) begin
      if ($unsigned((($signed(wire22) ?
          wire22[(1'h1):(1'h1)] : $unsigned($signed(wire22))) != $signed((~((8'ha9) ?
          wire22 : wire17))))))
        begin
          if ((($unsigned(($unsigned(wire17) + {wire21,
                  wire21})) >> ($unsigned($unsigned(wire18)) <= $unsigned((^wire16)))) ?
              wire17[(1'h1):(1'h0)] : (wire17 ? $unsigned(wire19) : wire16)))
            begin
              reg23 <= $unsigned($unsigned($unsigned(wire16)));
            end
          else
            begin
              reg23 <= $unsigned($signed({$signed(((8'hba) ?
                      wire21 : wire19))}));
            end
          reg24 <= (wire17[(1'h1):(1'h0)] > (~(($signed((8'ha4)) | $unsigned(wire16)) ?
              wire17 : ($unsigned(wire20) ?
                  $unsigned(wire19) : {reg23, (8'hb0)}))));
        end
      else
        begin
          reg23 <= wire20[(3'h4):(1'h1)];
          reg24 <= wire17[(2'h2):(1'h1)];
          reg25 <= (^$signed((($unsigned(reg23) >= {wire22}) || $signed(wire22[(2'h3):(1'h1)]))));
        end
      reg26 <= ((($unsigned(reg23) ?
              (wire20[(2'h3):(1'h1)] && $unsigned(wire16)) : reg25[(4'hd):(3'h7)]) ^~ wire19) ?
          $unsigned($signed((8'hb5))) : wire22);
      if ($unsigned(($signed(wire22) ?
          $signed(wire21) : wire18[(2'h2):(2'h2)])))
        begin
          reg27 <= $unsigned($unsigned($unsigned((8'h9c))));
        end
      else
        begin
          reg27 <= ($unsigned((~|reg25[(1'h1):(1'h0)])) ?
              $unsigned((~(((8'hb6) + wire19) ?
                  $signed(reg24) : wire19[(3'h5):(2'h3)]))) : wire18[(1'h0):(1'h0)]);
          reg28 <= ((~|$signed($signed(reg23))) >>> {$unsigned(((reg27 <= reg25) > reg27[(1'h1):(1'h1)])),
              ($signed($signed(reg23)) == (((7'h40) ? wire19 : wire21) ?
                  (-(8'had)) : (~reg25)))});
          reg29 <= ($unsigned((reg28 <<< {wire19})) ?
              (&reg23[(4'hb):(1'h0)]) : wire17);
          reg30 <= (({reg28[(3'h5):(3'h4)], (~wire16)} ?
                  (reg28 ?
                      wire16[(1'h1):(1'h1)] : ((+reg29) ?
                          (+reg27) : reg29)) : $unsigned(wire17)) ?
              wire22[(3'h4):(1'h1)] : $unsigned($unsigned(($unsigned(wire22) ?
                  (!wire22) : $signed((8'hac))))));
        end
      reg31 <= ({$unsigned(((-wire19) >>> $unsigned(reg27)))} ^~ (-(((reg25 ?
              reg23 : reg25) ?
          $signed(wire17) : $signed((8'hb1))) || ((wire16 ? reg25 : wire20) ?
          {reg25, reg29} : reg29[(5'h10):(1'h1)]))));
      if (reg31[(5'h10):(4'hb)])
        begin
          reg32 <= reg23;
          reg33 <= $signed(reg23[(1'h0):(1'h0)]);
          reg34 <= $signed((~|(((~wire16) * (wire17 && reg28)) ?
              (^~reg30) : reg31[(5'h13):(4'ha)])));
        end
      else
        begin
          if ($signed($unsigned(reg32)))
            begin
              reg32 <= reg28[(2'h3):(1'h1)];
            end
          else
            begin
              reg32 <= reg29[(4'h9):(2'h2)];
              reg33 <= reg33[(3'h7):(3'h7)];
              reg34 <= wire19;
              reg35 <= {$unsigned(($signed($signed(reg25)) * $signed(wire20)))};
              reg36 <= reg35[(4'hc):(3'h5)];
            end
          reg37 <= reg33;
          reg38 <= reg27;
          reg39 <= (reg27[(2'h3):(1'h0)] ?
              reg29[(5'h14):(4'hd)] : (wire19 || ($signed((reg33 < wire22)) | (!(reg36 | wire19)))));
          reg40 <= ((+$signed((((7'h42) ? (8'ha4) : reg27) ?
              $signed(reg30) : (~|wire21)))) ^~ wire22[(3'h5):(3'h5)]);
        end
    end
  assign wire41 = (~$signed(($signed((~&reg40)) ?
                      $unsigned((wire19 ? wire17 : (8'hbd))) : (7'h42))));
  assign wire42 = {($unsigned($unsigned(((8'ha3) ?
                          wire16 : reg26))) - reg38[(4'ha):(1'h0)]),
                      (!$unsigned((~(&reg32))))};
  module43 #() modinst87 (.wire45(reg27), .wire44(reg26), .y(wire86), .wire47(reg32), .wire46(wire22), .clk(clk));
endmodule

module module43  (y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire47;
  input wire [(5'h13):(1'h0)] wire46;
  input wire signed [(4'hd):(1'h0)] wire45;
  input wire [(4'h8):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire48;
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire71,
                 wire65,
                 wire64,
                 wire48,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
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
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire48 = ($signed($unsigned($signed((^~wire44)))) || $unsigned(((~|wire44[(3'h5):(2'h2)]) ?
                      (8'ha6) : $unsigned(wire46[(5'h13):(3'h4)]))));
  always
    @(posedge clk) begin
      reg49 <= wire48;
      reg50 <= (wire45 + wire44[(3'h5):(3'h4)]);
    end
  always
    @(posedge clk) begin
      reg51 <= $signed(reg50);
      reg52 <= $unsigned($unsigned(reg50));
      reg53 <= $signed({$unsigned(wire45[(4'h9):(3'h4)]), $signed(wire44)});
      reg54 <= (~|(reg51 ?
          {((reg53 ? (8'hbb) : (8'hbd)) ?
                  (reg51 ?
                      wire46 : reg51) : $unsigned(wire48))} : $unsigned(wire44)));
      if ((reg50[(2'h3):(1'h0)] ?
          (wire46 != $signed(wire48)) : $unsigned(($unsigned(wire48) >> $signed(reg52[(1'h0):(1'h0)])))))
        begin
          reg55 <= $unsigned($signed(wire44[(1'h0):(1'h0)]));
          reg56 <= (reg55 <= reg53);
          reg57 <= (^(8'haa));
          if ((^~{$unsigned(reg57[(4'hb):(1'h1)])}))
            begin
              reg58 <= ($signed(wire44) ?
                  (wire44 ?
                      ({(wire48 || wire44)} & (&wire48)) : wire44[(4'h8):(2'h2)]) : (~{($unsigned(wire46) ?
                          {wire46, reg53} : reg57[(4'ha):(2'h2)])}));
              reg59 <= $signed($unsigned(reg54[(3'h4):(1'h0)]));
              reg60 <= $signed(($signed($signed((reg57 ?
                  reg54 : reg54))) >= reg52[(2'h2):(2'h2)]));
              reg61 <= (!$signed(((reg59[(2'h3):(2'h2)] ^ (reg53 || wire47)) > (wire44[(3'h5):(3'h5)] == $signed(reg59)))));
              reg62 <= (wire46[(3'h4):(2'h3)] ^~ reg50[(1'h1):(1'h0)]);
            end
          else
            begin
              reg58 <= (wire48 ? (|reg50[(2'h2):(1'h0)]) : wire44);
              reg59 <= reg59[(3'h4):(3'h4)];
            end
          reg63 <= {((((reg50 ? reg54 : wire46) == (8'haf)) ?
                      $unsigned(reg52[(2'h2):(2'h2)]) : ((wire45 >= reg54) ~^ {wire44})) ?
                  ((^(-reg58)) ?
                      ({wire46} == ((8'hac) << wire44)) : $unsigned($unsigned(reg54))) : (reg61 ?
                      reg56 : reg54))};
        end
      else
        begin
          reg55 <= ((|$signed($unsigned(reg50))) ?
              $unsigned(($signed((^reg62)) == $signed($unsigned(reg50)))) : {$signed((~^$unsigned(reg60))),
                  reg56});
        end
    end
  assign wire64 = $signed((wire44[(3'h4):(1'h0)] ~^ ($unsigned($unsigned(reg51)) - $signed((~|wire48)))));
  assign wire65 = reg63;
  always
    @(posedge clk) begin
      reg66 <= (reg51[(4'h8):(3'h6)] << ($unsigned(reg53[(1'h1):(1'h1)]) ?
          ((~((8'hb2) >>> reg54)) ^~ ({reg62} ?
              (wire46 || reg50) : $signed((8'hb4)))) : (8'ha7)));
      reg67 <= $unsigned($unsigned(((~^$signed(reg49)) ?
          $unsigned($signed(reg53)) : (-wire65))));
      reg68 <= reg56[(4'ha):(4'ha)];
      reg69 <= ((8'hb0) > reg67);
      reg70 <= (8'h9d);
    end
  assign wire71 = (-$signed(((reg50[(1'h0):(1'h0)] - reg52) ?
                      (^reg66) : reg50[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if ((reg61[(3'h4):(1'h0)] > $signed((!$unsigned(((8'hab) & wire44))))))
        begin
          reg72 <= $unsigned((|$unsigned(reg57)));
          reg73 <= ($signed(reg54) <<< (&$signed(($unsigned(reg59) ?
              reg67[(4'hd):(1'h0)] : wire44))));
        end
      else
        begin
          reg72 <= (({$signed($unsigned(reg73)), reg60[(4'hc):(3'h5)]} ?
              (+(reg54 ^~ (reg56 ? reg70 : (8'h9d)))) : (reg54[(4'h8):(3'h4)] ?
                  ((8'had) + {reg53}) : $signed((^reg60)))) >= $unsigned(($unsigned($unsigned((8'ha5))) != reg73)));
          reg73 <= $unsigned((reg58 ?
              ($signed($signed(reg70)) << {wire45}) : wire45));
          reg74 <= $signed({(-(~&{(8'hae)})), {(-$unsigned((8'ha5)))}});
        end
      reg75 <= (((($unsigned(reg60) ?
              (reg69 & (8'hab)) : {reg56}) ^ ((+wire64) ?
              reg50 : (reg69 == wire47))) ?
          $unsigned($signed($signed((8'hb5)))) : $unsigned(reg61)) ^~ reg59);
      reg76 <= reg70;
      reg77 <= $signed(((^reg76[(1'h0):(1'h0)]) ^~ $unsigned(($unsigned(wire71) <= $unsigned(wire46)))));
      reg78 <= $signed($unsigned(((~^reg63[(2'h3):(1'h0)]) ?
          ((&reg61) ? $unsigned((8'hb0)) : {reg75, reg63}) : {reg49})));
    end
  assign wire79 = (^~reg75);
  assign wire80 = {$signed(({(reg55 | wire79)} + (~|reg60[(1'h0):(1'h0)])))};
  assign wire81 = (!reg53);
  assign wire82 = (reg56 ?
                      reg67[(4'hf):(1'h0)] : ((8'ha9) ?
                          (({reg62, (7'h43)} ?
                              {wire71} : (8'ha7)) * ($signed(reg60) - reg76[(1'h1):(1'h1)])) : $unsigned(((reg72 << wire48) <= reg53[(4'hf):(4'ha)]))));
  assign wire83 = reg49;
  assign wire84 = reg54[(4'h8):(3'h5)];
  assign wire85 = (((wire84[(1'h1):(1'h0)] > ((^~wire44) ~^ {reg50, reg78})) ?
                          $unsigned($unsigned((reg72 ?
                              reg68 : (8'hbe)))) : (wire64[(1'h0):(1'h0)] * {wire82[(2'h2):(1'h0)]})) ?
                      {wire65} : (reg50[(1'h1):(1'h0)] ?
                          $signed(reg70[(3'h5):(1'h1)]) : $signed($unsigned((wire44 ?
                              reg70 : reg60)))));
endmodule
