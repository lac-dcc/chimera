module top
#(parameter param54 = (((!(~(^~(8'hb8)))) ? ((~&((8'ha0) & (8'hb9))) >= ((&(8'hb3)) + (&(8'hbe)))) : (!((!(8'hbf)) ? {(8'h9e)} : ((8'ha1) ? (8'hba) : (8'ha6))))) ? (((~|((8'hbb) << (8'hb2))) || (((8'h9f) ^ (7'h41)) ? ((8'ha2) & (8'hb3)) : {(7'h40)})) ? {{(~|(8'h9f))}} : ((8'hac) && (((7'h43) >> (8'hb6)) ? ((7'h40) ~^ (8'hbe)) : ((8'hac) ? (8'h9c) : (8'ha8))))) : ((~(!(7'h42))) > (^~(~|((7'h41) ^ (8'hae)))))), 
parameter param55 = (param54 << ((8'hb8) ? {{param54, param54}} : (param54 ? {(param54 + param54)} : (8'ha1)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire28;
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  assign y = {wire52,
                 wire31,
                 wire30,
                 wire5,
                 wire6,
                 wire7,
                 wire28,
                 reg53,
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
                 (1'h0)};
  assign wire5 = ($signed($signed(($unsigned(wire2) < (|wire0)))) ?
                     wire4[(3'h7):(3'h7)] : {(((|wire3) ?
                                 $signed(wire0) : wire0[(1'h0):(1'h0)]) ?
                             $signed(wire0) : (^~$signed(wire4)))});
  assign wire6 = ((({(!wire2), (wire1 ? wire2 : wire2)} ?
                             ($signed(wire0) ?
                                 $unsigned((8'hb7)) : wire2[(1'h1):(1'h0)]) : wire0) ?
                         (+$signed((wire1 ?
                             (8'ha8) : wire1))) : ($signed($unsigned(wire2)) < wire2[(3'h7):(1'h0)])) ?
                     $signed({(8'hb6),
                         (wire2 >>> wire0[(2'h3):(1'h1)])}) : $signed($signed(($unsigned(wire0) * (wire0 ?
                         wire1 : wire1)))));
  assign wire7 = wire6[(3'h5):(3'h5)];
  module8 #() modinst29 (.clk(clk), .wire12(wire5), .wire13(wire7), .wire11(wire0), .wire9(wire4), .wire10(wire2), .y(wire28));
  assign wire30 = $signed(wire6);
  assign wire31 = $unsigned(wire1[(3'h5):(3'h4)]);
  always
    @(posedge clk) begin
      if (wire2[(4'h9):(3'h7)])
        begin
          reg32 <= ($signed(wire6) ?
              (8'hb2) : ($unsigned(wire3[(1'h1):(1'h0)]) ?
                  ({(^wire5)} != ((wire4 ? wire31 : wire4) ?
                      (wire7 >= (7'h40)) : $signed(wire7))) : $signed(wire31)));
          if ($unsigned((^~wire6[(3'h5):(3'h5)])))
            begin
              reg33 <= $unsigned(($unsigned($signed($signed(wire2))) ?
                  $unsigned(({wire30,
                      reg32} >= (^~wire28))) : $unsigned($signed(((8'hb8) - (8'hb2))))));
              reg34 <= $signed(wire3[(4'hf):(1'h0)]);
              reg35 <= $signed($unsigned(wire2));
              reg36 <= wire4[(2'h2):(1'h0)];
              reg37 <= ({(!wire6[(3'h5):(3'h5)])} ^~ {$unsigned((wire5 ?
                      (reg36 ? reg32 : (8'hbf)) : $unsigned(wire3))),
                  (^~reg34[(2'h2):(1'h0)])});
            end
          else
            begin
              reg33 <= $signed($unsigned(reg32));
              reg34 <= (&wire6);
              reg35 <= $signed($signed(((~^$unsigned((8'hbc))) ?
                  {reg34[(3'h7):(1'h0)]} : $unsigned(reg37[(2'h3):(2'h3)]))));
              reg36 <= (wire28 ?
                  $unsigned(wire30) : (reg35[(4'h8):(3'h6)] != (wire3 ?
                      $unsigned(wire6) : wire6[(2'h2):(1'h0)])));
              reg37 <= wire31[(2'h3):(1'h0)];
            end
          reg38 <= (wire5 ? wire6[(1'h0):(1'h0)] : reg36);
          reg39 <= {wire6[(2'h2):(1'h0)]};
          if ($signed(({(8'hbb), reg35[(1'h0):(1'h0)]} ^ (&wire7))))
            begin
              reg40 <= wire30[(4'h9):(4'h9)];
              reg41 <= ($signed((&wire1[(4'hc):(2'h3)])) ?
                  {($signed($signed(reg38)) ?
                          (reg36 >> $unsigned(wire3)) : $signed(reg37[(3'h4):(3'h4)])),
                      {(!$unsigned((8'hb1)))}} : (wire3 == $unsigned(((reg36 || (8'hbd)) >= reg33))));
              reg42 <= $unsigned((!$signed($unsigned((wire5 ?
                  reg33 : wire6)))));
              reg43 <= reg32;
            end
          else
            begin
              reg40 <= wire4;
              reg41 <= $unsigned((|reg39[(4'h8):(2'h2)]));
              reg42 <= ($unsigned((~|((|reg32) ?
                      $unsigned((7'h40)) : $signed(reg32)))) ?
                  ((!$unsigned(wire2)) ?
                      ((wire0 >>> $unsigned(wire7)) ?
                          $signed(((8'hb8) | (8'h9e))) : (~^(8'h9f))) : {((8'ha6) ?
                              wire30[(4'h9):(1'h1)] : $signed((7'h41))),
                          {(wire1 ^ wire30)}}) : $signed($unsigned(reg37[(3'h6):(3'h5)])));
              reg43 <= wire28[(2'h3):(1'h1)];
            end
        end
      else
        begin
          if ((wire3 ?
              $unsigned($signed(($unsigned(reg41) - wire0))) : wire6[(2'h2):(1'h0)]))
            begin
              reg32 <= ((-reg42) ?
                  $unsigned((((wire6 ?
                      reg43 : wire31) == wire7) >= (^~(wire28 << wire2)))) : ($signed((-{reg36})) ?
                      ($unsigned($unsigned(wire31)) ?
                          (^~{reg34,
                              wire30}) : reg36[(4'h8):(1'h0)]) : $unsigned({wire7[(1'h1):(1'h0)],
                          $unsigned(reg39)})));
              reg33 <= $unsigned((reg42 ?
                  (reg41 == ($unsigned((8'hbf)) & wire31[(1'h1):(1'h1)])) : (wire7[(2'h3):(1'h1)] ?
                      (reg34 >= $signed(wire6)) : ((+wire6) <<< reg35))));
            end
          else
            begin
              reg32 <= {(reg35 + $signed(wire2))};
              reg33 <= ((^~reg32) ^~ wire30);
            end
          if ((-(($unsigned((wire0 >> reg34)) ?
                  (7'h40) : wire5[(4'h8):(3'h7)]) ?
              (+(!$signed(wire30))) : reg39[(4'h8):(1'h0)])))
            begin
              reg34 <= (+$signed(wire3));
              reg35 <= (reg42[(1'h1):(1'h1)] >= ({(wire7 | (wire6 ?
                      reg40 : (8'hbf))),
                  ((~wire4) ?
                      $unsigned(wire0) : (wire30 && wire0))} | wire31[(2'h3):(2'h2)]));
              reg36 <= wire28[(2'h3):(1'h0)];
              reg37 <= $unsigned((~&(~reg33[(2'h3):(1'h0)])));
              reg38 <= ($unsigned((8'hbf)) ?
                  (8'hb9) : ($unsigned($unsigned((reg36 ?
                      reg39 : reg35))) & ((wire2[(4'h9):(3'h5)] < $signed(wire1)) ?
                      ({reg35} & {(8'ha9), reg40}) : reg33)));
            end
          else
            begin
              reg34 <= $unsigned($signed((((reg36 ?
                      wire30 : reg33) > (reg41 <= (7'h44))) ?
                  reg36 : ($signed(reg32) ?
                      (wire3 ? wire5 : reg35) : $unsigned((8'hb7))))));
              reg35 <= (8'ha1);
              reg36 <= wire5;
            end
          if ((|(reg35 ^~ $signed(wire6))))
            begin
              reg39 <= {reg38};
              reg40 <= {{(~&((~^wire6) < $unsigned(wire2))),
                      reg43[(4'hb):(3'h4)]}};
            end
          else
            begin
              reg39 <= {(~reg36)};
              reg40 <= (reg37[(1'h0):(1'h0)] ~^ wire4[(3'h4):(3'h4)]);
              reg41 <= ((8'h9c) ?
                  {$unsigned({reg37[(1'h0):(1'h0)],
                          (reg32 ? reg34 : reg38)})} : wire6[(2'h3):(1'h0)]);
              reg42 <= reg38[(5'h10):(1'h1)];
            end
          reg43 <= $unsigned($signed($unsigned(wire5[(1'h1):(1'h0)])));
        end
      reg44 <= $signed(wire0[(4'hd):(4'h8)]);
    end
  always
    @(posedge clk) begin
      if (reg41[(1'h1):(1'h1)])
        begin
          reg45 <= (reg32 ^ {(^~((reg41 ? reg35 : reg40) * (~reg39)))});
          if ((~|$signed(wire30[(4'hb):(4'h8)])))
            begin
              reg46 <= ($signed((($unsigned(reg37) ? (^~wire31) : reg36) ?
                  (8'hab) : {$signed(reg34),
                      $signed(reg43)})) ^~ $signed(wire31[(2'h2):(1'h1)]));
              reg47 <= reg36[(4'h9):(4'h9)];
              reg48 <= reg42[(1'h0):(1'h0)];
              reg49 <= $signed((7'h44));
              reg50 <= reg38;
            end
          else
            begin
              reg46 <= ($unsigned($unsigned(reg42[(1'h0):(1'h0)])) ?
                  (reg40[(2'h2):(1'h0)] ?
                      ((wire5 ? (reg39 >>> wire30) : reg35[(3'h7):(1'h1)]) ?
                          wire1 : wire1[(3'h4):(2'h3)]) : reg39[(4'hc):(3'h5)]) : $signed(wire31));
              reg47 <= $signed($signed($unsigned(reg45)));
            end
          reg51 <= {reg47,
              ((|wire30[(4'h9):(1'h1)]) ^~ (((^wire2) ~^ {wire5}) <= ($signed(wire28) ?
                  reg45[(2'h3):(2'h3)] : (wire28 ? wire1 : (8'ha6)))))};
        end
      else
        begin
          reg45 <= $unsigned((^wire5[(3'h4):(3'h4)]));
          reg46 <= ((~^$unsigned($signed($signed(wire4)))) ?
              reg51[(3'h5):(3'h4)] : reg40[(4'hd):(4'h9)]);
          reg47 <= {{(~reg46)}};
          reg48 <= (reg48[(4'h8):(3'h7)] != $signed(({wire1[(4'hb):(2'h3)]} > {$signed(wire1),
              $signed(reg37)})));
        end
    end
  assign wire52 = (reg36[(4'h9):(4'h9)] ?
                      reg33 : $signed({reg51[(3'h4):(1'h1)]}));
  always
    @(posedge clk) begin
      reg53 <= $unsigned($unsigned((~($signed(reg45) ?
          (reg33 ? reg37 : reg41) : wire1))));
    end
endmodule

module module8
#(parameter param26 = (((~&(((7'h43) ? (8'ha6) : (8'had)) ? (^~(8'hb9)) : (&(8'h9e)))) ~^ {(((8'had) ~^ (8'h9f)) >= ((8'hbb) ? (8'hae) : (8'ha3)))}) ? (~&(((&(8'hb6)) ? ((8'hbd) ^ (8'ha9)) : ((8'ha3) ? (8'hbb) : (8'hac))) ~^ (+{(8'hab)}))) : (^~((((8'h9e) || (8'hac)) ? (-(8'h9f)) : {(8'hb1)}) ? (((8'hbe) ? (8'ha5) : (8'ha7)) ? {(8'hbe), (8'haf)} : (~|(8'hbe))) : (~|{(8'hb6)})))), 
parameter param27 = {(({(param26 && param26), (~^param26)} ? {param26, (+param26)} : param26) == (~|((param26 ? param26 : param26) ? (param26 ^ (8'ha9)) : (~|param26))))})
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire signed [(2'h3):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire15,
                 wire14,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire14 = (8'hb0);
  assign wire15 = wire13;
  always
    @(posedge clk) begin
      if ($signed($signed((+wire15))))
        begin
          reg16 <= $unsigned($signed((wire11[(1'h0):(1'h0)] ?
              $unsigned((wire11 ? wire9 : wire12)) : {wire13,
                  $signed(wire10)})));
          reg17 <= wire10[(4'ha):(3'h6)];
          reg18 <= (~&{(~|wire13), $signed(wire10)});
        end
      else
        begin
          reg16 <= $unsigned((wire10[(2'h2):(2'h2)] ? (8'hbe) : (~^(&wire12))));
          reg17 <= (wire9 + ($unsigned(({reg18} >>> wire12[(4'h9):(3'h6)])) >> $unsigned((wire13 >= (~&(8'ha2))))));
          if (reg16[(3'h4):(1'h0)])
            begin
              reg18 <= (+$signed(reg17));
              reg19 <= $signed(((-$signed($unsigned(reg16))) * reg18[(4'h9):(1'h1)]));
            end
          else
            begin
              reg18 <= (({(8'hbc),
                  {((8'ha3) <<< wire10)}} ^ wire15) * ($unsigned(wire14) ~^ (($unsigned(wire14) ?
                      {wire11, reg19} : reg19[(4'he):(4'he)]) ?
                  {$unsigned(wire14),
                      {wire11, wire13}} : $signed((wire10 + wire14)))));
            end
        end
      reg20 <= wire9[(1'h0):(1'h0)];
      reg21 <= $unsigned((~&(reg16[(3'h4):(1'h1)] ?
          (^~(&reg17)) : $signed($unsigned((8'hb8))))));
    end
  assign wire22 = $signed($signed(($signed((reg21 || reg20)) ?
                      $unsigned((wire15 >> wire13)) : reg19[(4'h8):(1'h1)])));
  assign wire23 = {{$signed(wire14[(5'h14):(5'h10)])}};
  assign wire24 = {$signed($unsigned($unsigned(wire14[(2'h3):(2'h3)])))};
  assign wire25 = $signed((~&wire22));
endmodule
