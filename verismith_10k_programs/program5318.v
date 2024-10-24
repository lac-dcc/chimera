module top
#(parameter param150 = (~^(^(-(((8'h9f) ? (8'ha5) : (8'hbc)) <<< ((8'hb5) << (8'hb3)))))), 
parameter param151 = (param150 ? (((((8'h9d) ? param150 : param150) ^ (8'hb3)) != ({(7'h40), param150} ? (param150 ? param150 : param150) : {param150, param150})) == (~^(8'hb0))) : (8'ha8)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire147;
  wire signed [(4'h8):(1'h0)] wire146;
  wire [(5'h14):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire137;
  wire signed [(4'hb):(1'h0)] wire126;
  wire signed [(4'h9):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire138,
                 wire137,
                 wire126,
                 wire73,
                 wire23,
                 wire5,
                 reg149,
                 reg148,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire5 = wire1[(3'h7):(3'h4)];
  module6 #() modinst24 (.y(wire23), .wire10(wire4), .wire9(wire1), .wire7(wire0), .clk(clk), .wire8(wire2));
  module25 #() modinst74 (.wire27(wire3), .y(wire73), .wire28(wire2), .wire29(wire4), .clk(clk), .wire26(wire23));
  module75 #() modinst127 (wire126, clk, wire4, wire23, wire0, wire3);
  always
    @(posedge clk) begin
      reg128 <= (wire126[(3'h7):(1'h0)] | $unsigned({wire4[(1'h0):(1'h0)]}));
      reg129 <= (wire73[(1'h1):(1'h1)] > (^~(^(~&wire0[(2'h2):(1'h0)]))));
      if ($unsigned(reg129))
        begin
          if (({((wire4[(4'he):(2'h3)] + {(8'hbc), wire1}) ?
                  ((wire23 ? wire73 : (8'ha7)) ?
                      (^~wire3) : $unsigned(reg129)) : reg128)} - $unsigned(wire3[(2'h2):(2'h2)])))
            begin
              reg130 <= {((-$unsigned(reg129)) ?
                      wire73 : wire73[(2'h2):(1'h0)]),
                  $unsigned((wire2 ?
                      {(!wire5), reg129[(1'h0):(1'h0)]} : ((wire126 ?
                          (7'h43) : wire0) * $unsigned(reg128))))};
              reg131 <= $unsigned((((!$unsigned(wire5)) > (~reg130)) ?
                  $signed(((~&wire5) ?
                      (reg129 + wire126) : {(8'hb5),
                          wire3})) : $unsigned((((8'hba) ?
                      wire23 : reg129) != (8'hb4)))));
            end
          else
            begin
              reg130 <= ((^wire23) * $unsigned((~{{wire2, wire2},
                  $unsigned(wire4)})));
              reg131 <= ($signed(wire23) << $signed(reg130));
            end
        end
      else
        begin
          if (wire4[(5'h13):(5'h11)])
            begin
              reg130 <= wire1[(4'hb):(3'h6)];
              reg131 <= $unsigned({$unsigned((8'hbe)), (8'hb0)});
              reg132 <= $signed(((&($unsigned(wire5) >> (wire4 <<< wire1))) > (-$unsigned((reg131 ?
                  reg131 : wire1)))));
            end
          else
            begin
              reg130 <= ({{({wire5} ?
                          $unsigned(reg130) : (wire73 ?
                              wire73 : (8'ha2)))}} >>> ($unsigned((((8'hb7) ?
                          (8'hbb) : wire3) ?
                      ((8'ha5) ? reg128 : reg131) : $unsigned(wire0))) ?
                  wire4 : (wire0 - (^~reg132[(4'hc):(3'h4)]))));
              reg131 <= (~(reg132[(4'hf):(4'hb)] ?
                  $signed($signed((wire23 < (8'ha8)))) : $signed((wire1 ?
                      wire5[(3'h6):(1'h1)] : (wire73 ? (8'h9f) : reg128)))));
              reg132 <= reg132;
              reg133 <= $signed(wire2);
            end
          reg134 <= (8'haf);
        end
      reg135 <= ($signed(wire1[(5'h11):(4'he)]) == ((($signed(reg131) >>> reg130) ?
              (!$unsigned((8'ha6))) : wire5) ?
          wire0[(4'h8):(1'h0)] : ({$signed(wire23),
              $signed(wire5)} != ((~^reg128) ?
              (reg131 ? reg132 : reg134) : (wire73 * wire5)))));
      reg136 <= ($unsigned(($signed(wire4[(3'h6):(2'h2)]) ?
              wire2[(2'h2):(1'h1)] : {(reg132 ^~ wire126)})) ?
          (~^($unsigned({wire23}) ?
              (7'h40) : $signed(reg133))) : {$unsigned({(wire126 > (8'hbd)),
                  (wire2 ? wire23 : reg128)})});
    end
  assign wire137 = $signed(reg132);
  assign wire138 = (8'h9c);
  always
    @(posedge clk) begin
      if (({$unsigned((^~reg130[(4'h8):(4'h8)]))} ?
          reg133[(1'h1):(1'h1)] : wire2))
        begin
          reg139 <= $signed((&(~&($unsigned(wire126) >= reg129))));
          if ($signed(reg139[(2'h3):(2'h3)]))
            begin
              reg140 <= reg132[(1'h1):(1'h1)];
              reg141 <= reg136;
              reg142 <= reg133[(2'h2):(2'h2)];
            end
          else
            begin
              reg140 <= $unsigned((wire126 > (+reg131)));
              reg141 <= {(reg129[(4'h8):(3'h4)] ?
                      wire4[(4'hd):(4'ha)] : (reg132 ?
                          $unsigned(reg141[(2'h3):(2'h3)]) : (!reg142[(1'h1):(1'h0)]))),
                  reg139};
            end
          reg143 <= $unsigned((&(~&($unsigned((8'hb6)) | {wire5, wire0}))));
          reg144 <= $signed(reg134);
          reg145 <= {(^(reg142 < $signed($signed(reg130))))};
        end
      else
        begin
          reg139 <= reg134;
          reg140 <= wire3;
        end
    end
  assign wire146 = reg131[(3'h5):(2'h2)];
  assign wire147 = (^~wire2[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      reg148 <= (~&(~|($signed($unsigned(reg140)) ?
          reg139[(5'h10):(3'h7)] : $signed((reg128 ? reg144 : reg129)))));
      reg149 <= ({($signed(reg129) ?
              $signed((wire4 ^~ wire73)) : {reg145[(3'h6):(1'h1)],
                  reg144})} + $unsigned({(~&$unsigned(reg133)),
          $signed($unsigned(wire73))}));
    end
endmodule

module module75
#(parameter param124 = (((((8'hb6) + (~(8'hbb))) ? {(~(8'hb9)), (+(8'ha1))} : (((8'ha6) <<< (8'ha4)) > ((8'hab) ^~ (8'ha3)))) ? ((((8'hab) | (8'ha0)) & ((8'ha4) >> (8'h9f))) ? ((^~(8'h9d)) - ((8'ha5) ? (7'h40) : (8'h9c))) : (|((8'hab) ? (8'ha5) : (8'hb5)))) : (!(((8'haa) - (8'haf)) ? {(8'ha2)} : ((8'h9f) <= (8'hb2))))) != (((((7'h41) | (8'hbe)) >> (!(8'hae))) > (((8'hb9) > (7'h42)) >>> {(8'ha0), (8'ha4)})) ? (-{((8'hae) ^~ (8'h9c)), (8'ha5)}) : (&{((8'hb2) ? (8'had) : (8'hb2)), ((8'hb6) ^ (8'had))}))), 
parameter param125 = param124)
(y, clk, wire76, wire77, wire78, wire79);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire76;
  input wire signed [(5'h15):(1'h0)] wire77;
  input wire [(5'h11):(1'h0)] wire78;
  input wire [(5'h13):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire123;
  wire signed [(3'h7):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire120;
  assign y = {wire123,
                 wire122,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire120,
                 (1'h0)};
  assign wire80 = $signed(wire78);
  assign wire81 = wire77;
  assign wire82 = $unsigned({$unsigned($unsigned($signed(wire77))), wire78});
  assign wire83 = (+({wire78, wire81[(1'h1):(1'h0)]} ?
                      {($signed(wire82) ?
                              wire78[(3'h4):(2'h3)] : $signed(wire81))} : wire77));
  module84 #() modinst121 (wire120, clk, wire78, wire79, wire80, wire77, wire81);
  assign wire122 = ((|((wire83[(3'h4):(1'h1)] + ((8'hb8) * wire83)) ?
                       (~&(8'ha5)) : ((wire83 ^~ wire82) ?
                           (^~wire82) : wire76))) ^ {(({wire120,
                           wire80} - $unsigned(wire81)) || wire82[(1'h0):(1'h0)])});
  assign wire123 = wire77;
endmodule

module module25
#(parameter param72 = ({((7'h40) ? {((8'hb2) ? (8'hbc) : (8'hbc))} : (((7'h42) ? (8'ha8) : (8'haa)) ? ((8'hb2) ? (8'hb0) : (8'h9d)) : ((8'hbe) >>> (8'hbd)))), (~^({(8'ha7)} ? {(8'hbf)} : ((8'hb3) ? (8'h9d) : (8'hb1))))} ? ((!(((8'hb4) >> (8'h9c)) ? ((8'ha9) ? (7'h44) : (8'hb7)) : (!(8'hba)))) >= (-(((8'ha8) ? (8'hb1) : (8'haa)) ? ((8'hba) ? (8'hbb) : (7'h40)) : {(8'ha9), (8'hbb)}))) : (((8'h9d) * (+((8'ha3) ? (8'hb5) : (8'hba)))) ? (((~^(8'ha6)) >> ((8'hab) << (8'hb7))) ? {((8'hb1) ? (8'ha6) : (8'ha6)), ((8'ha1) ? (7'h42) : (8'ha8))} : ((~&(8'hae)) ~^ {(8'hbb), (8'ha0)})) : {{((8'hba) ? (8'hb5) : (8'hb3)), ((8'h9f) ? (8'ha7) : (8'h9c))}})))
(y, clk, wire26, wire27, wire28, wire29);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire26;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire67;
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  assign y = {wire71,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire67,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire30 = wire28[(4'h8):(4'h8)];
  assign wire31 = (|$signed(($signed($unsigned(wire27)) ?
                      (((8'ha6) ? wire26 : wire29) ?
                          $unsigned(wire29) : (wire29 <<< wire30)) : ((8'h9d) ?
                          (^wire29) : (wire28 * wire26)))));
  assign wire32 = $signed($unsigned($signed($signed($unsigned((7'h41))))));
  assign wire33 = (((({wire30, wire27} ? (~(8'ha4)) : wire28) ?
                          $signed((-(8'hb1))) : (((8'hae) ? wire26 : wire26) ?
                              (wire30 ^~ wire26) : wire32)) ?
                      $unsigned(((~&wire26) && ((8'ha4) && (8'hb8)))) : $signed($signed((!(8'h9d))))) >>> (($unsigned((|wire29)) > wire31[(4'hd):(4'hc)]) < (^(8'hae))));
  assign wire34 = ((~|$signed(wire28)) ?
                      wire30 : ((&($signed(wire32) ?
                              (wire32 ? wire30 : (7'h43)) : $signed((8'hb9)))) ?
                          wire33 : wire32[(4'hc):(1'h0)]));
  assign wire35 = $unsigned($unsigned(wire34));
  module36 #() modinst68 (.clk(clk), .wire38(wire28), .wire39(wire35), .wire40(wire33), .y(wire67), .wire37(wire26), .wire41(wire29));
  always
    @(posedge clk) begin
      reg69 <= (^~($unsigned({(-wire31)}) ?
          wire34[(2'h3):(2'h3)] : $unsigned(((&(8'ha2)) ?
              wire35[(4'h9):(4'h9)] : (wire34 ? (8'hb3) : wire35)))));
      reg70 <= wire31[(4'h9):(1'h1)];
    end
  assign wire71 = $signed((($signed(wire31[(4'hb):(4'h9)]) > $signed(wire32)) ?
                      $signed($signed({reg70,
                          wire67})) : $signed((!$signed(wire35)))));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire11 = $unsigned(wire10[(2'h2):(1'h1)]);
  assign wire12 = {$signed((8'hb8)), wire10};
  assign wire13 = (8'hb2);
  assign wire14 = (^~wire13[(4'hb):(2'h2)]);
  assign wire15 = (wire8 ?
                      $unsigned(($unsigned(wire11[(2'h2):(1'h0)]) * wire12[(2'h2):(1'h0)])) : ($signed(wire9) ?
                          ((^$unsigned(wire13)) ?
                              wire10 : $signed((wire11 ?
                                  wire9 : wire10))) : $signed($unsigned((!wire10)))));
  assign wire16 = $signed((~^wire12));
  always
    @(posedge clk) begin
      if (($signed((~^{(wire12 ? wire12 : wire12)})) ?
          (~^$unsigned($unsigned(wire13))) : (-$unsigned(wire9[(1'h0):(1'h0)]))))
        begin
          reg17 <= {$signed($signed({$signed(wire11), (wire16 <<< wire8)}))};
          reg18 <= $unsigned(wire8[(4'hd):(2'h2)]);
        end
      else
        begin
          reg17 <= (+wire11[(1'h0):(1'h0)]);
          if ((&(8'hbd)))
            begin
              reg18 <= (&(wire11 >> ($signed($unsigned((8'h9c))) + (|$signed(reg18)))));
              reg19 <= $signed($unsigned(wire7[(3'h6):(2'h3)]));
              reg20 <= (wire14[(3'h6):(3'h4)] ?
                  wire11[(1'h0):(1'h0)] : {$unsigned($unsigned((wire9 ^ (8'hbf))))});
            end
          else
            begin
              reg18 <= (^(({wire16,
                  (8'hb3)} != wire13[(4'hf):(3'h5)]) ^ $signed(reg18[(4'h8):(2'h3)])));
            end
        end
    end
  assign wire21 = (((~|((reg20 > (8'ha5)) ?
                          (!(7'h41)) : $signed(wire11))) ^~ (((reg18 >>> wire11) ?
                          reg17 : (~&(8'ha5))) ~^ reg19[(2'h2):(1'h1)])) ?
                      {$unsigned(reg19)} : reg17);
  assign wire22 = $signed(((+$unsigned(wire9)) | ($signed(reg18) == wire21)));
endmodule

module module36
#(parameter param66 = (^~((~&(^((8'hb3) <<< (8'ha2)))) ? (8'hb6) : {((~&(8'ha8)) ? {(8'haa), (8'hac)} : (|(8'h9f)))})))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire41;
  input wire signed [(4'h8):(1'h0)] wire40;
  input wire [(4'he):(1'h0)] wire39;
  input wire signed [(4'h9):(1'h0)] wire38;
  input wire [(4'hb):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((!$unsigned(wire40)))
        begin
          reg42 <= $unsigned(($unsigned(((+wire40) & ((8'hba) ?
                  wire38 : (8'hb8)))) ?
              (^~(^{wire39})) : (|(wire37 ~^ {wire37}))));
          reg43 <= (^(($unsigned({(8'ha2), wire41}) << (~&$signed(reg42))) ?
              $unsigned(wire38[(3'h6):(3'h6)]) : $unsigned(wire39)));
        end
      else
        begin
          if ($unsigned($signed(((~|$signed(wire41)) ?
              (~^(^wire40)) : $signed($unsigned(reg43))))))
            begin
              reg42 <= reg42;
            end
          else
            begin
              reg42 <= (8'hb3);
            end
          if ($unsigned(($signed((!wire41[(4'hb):(1'h1)])) + reg43)))
            begin
              reg43 <= ($signed($signed((~^(+reg42)))) ? (8'hb2) : wire38);
            end
          else
            begin
              reg43 <= wire39[(1'h1):(1'h1)];
              reg44 <= wire39[(3'h7):(2'h2)];
            end
          reg45 <= ($unsigned({wire39,
              wire41[(4'h9):(1'h1)]}) * (&($unsigned($signed(reg42)) > wire37[(1'h1):(1'h1)])));
          reg46 <= (~((&(wire39[(3'h6):(3'h6)] ?
                  wire38[(3'h7):(1'h1)] : (wire41 ? reg44 : (7'h44)))) ?
              (wire37[(3'h7):(2'h3)] ~^ (7'h41)) : reg42[(2'h2):(1'h1)]));
          reg47 <= wire37[(4'ha):(1'h1)];
        end
    end
  assign wire48 = $unsigned($signed(wire37));
  assign wire49 = reg47[(1'h0):(1'h0)];
  assign wire50 = ($unsigned($unsigned(((|wire48) <= wire38[(3'h6):(2'h2)]))) & (~|(((wire48 ?
                              wire38 : reg43) ?
                          reg47[(3'h5):(2'h3)] : $signed((8'ha6))) ?
                      wire41 : wire39[(3'h5):(3'h5)])));
  assign wire51 = wire49;
  assign wire52 = $unsigned($signed($unsigned(reg43)));
  always
    @(posedge clk) begin
      reg53 <= $signed($unsigned((+$signed(wire48))));
      reg54 <= wire50[(1'h1):(1'h0)];
      reg55 <= ($unsigned((-(8'ha8))) & $unsigned((~&$signed((wire49 & reg45)))));
      reg56 <= $signed({wire38[(3'h7):(1'h1)]});
      if (wire49)
        begin
          reg57 <= (!(+reg46[(1'h0):(1'h0)]));
          if ({$signed(wire37[(3'h7):(3'h5)])})
            begin
              reg58 <= (-(~reg53[(3'h7):(3'h4)]));
              reg59 <= (((~&((reg47 * reg56) >= (wire39 ? reg47 : reg46))) ?
                  ((|$unsigned(reg56)) ?
                      (wire50 + (wire50 * wire50)) : (~^$signed(wire51))) : wire49[(2'h3):(1'h0)]) * wire40);
            end
          else
            begin
              reg58 <= ({((~$unsigned(reg59)) ?
                      (&wire51) : reg47[(4'hc):(3'h5)])} == (reg43[(3'h7):(3'h5)] != $signed(reg59[(3'h7):(3'h6)])));
              reg59 <= ((reg47 ?
                  ({$signed(wire40), reg46[(3'h7):(3'h4)]} ?
                      $unsigned(wire40) : (~^{(8'h9f)})) : wire51[(2'h3):(1'h1)]) ~^ ({$unsigned($signed(reg46))} ?
                  ($signed($unsigned(reg46)) * $unsigned((~|wire49))) : reg53));
            end
          reg60 <= (~|$unsigned($signed((^wire41[(4'ha):(3'h6)]))));
        end
      else
        begin
          if ((((&reg42) < ($unsigned({reg57, wire50}) ^ ((reg43 << wire40) ?
                  {reg56, wire48} : $unsigned(reg44)))) ?
              (+$unsigned(({(8'haa)} ?
                  (reg43 + (8'ha2)) : (reg60 ?
                      reg60 : reg45)))) : ((~&((wire52 ?
                  reg58 : reg45) < reg46)) < $unsigned($unsigned((reg46 == wire51))))))
            begin
              reg57 <= $unsigned((^~(~&reg58)));
              reg58 <= (&($unsigned(reg60[(4'h8):(2'h2)]) ?
                  {$unsigned((wire49 ?
                          reg57 : reg47))} : $unsigned((~|$signed(reg43)))));
            end
          else
            begin
              reg57 <= wire49[(1'h0):(1'h0)];
              reg58 <= $signed(wire48);
              reg59 <= (reg54[(2'h2):(1'h1)] >= reg54[(1'h1):(1'h1)]);
              reg60 <= ((^~reg55) ^ ($signed($unsigned((wire50 ?
                      (8'hb2) : reg58))) ?
                  {((&(8'hb5)) ?
                          reg58[(1'h0):(1'h0)] : ((7'h42) ?
                              wire37 : (7'h43)))} : {reg54}));
            end
          reg61 <= (reg47 >>> {($unsigned($signed(reg59)) <<< reg53)});
        end
    end
  assign wire62 = {$signed($signed(reg55)),
                      (($signed((~|wire48)) ^~ {{reg58, reg42}}) ?
                          reg54 : $unsigned($signed(reg61)))};
  assign wire63 = wire39;
  assign wire64 = reg46[(1'h0):(1'h0)];
  assign wire65 = {reg53[(2'h2):(2'h2)],
                      ($signed(wire51) ?
                          reg60[(1'h1):(1'h1)] : ($signed(wire50[(1'h0):(1'h0)]) ?
                              wire37[(4'h8):(2'h2)] : (^(wire62 ?
                                  wire37 : (8'ha2)))))};
endmodule

module module84
#(parameter param118 = (~(!(({(8'hae)} ? (-(8'ha4)) : (|(8'hb8))) | (&{(8'hbf), (8'ha5)})))), 
parameter param119 = {((8'ha6) && param118), {param118}})
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire89;
  input wire signed [(5'h13):(1'h0)] wire88;
  input wire [(4'h9):(1'h0)] wire87;
  input wire [(5'h15):(1'h0)] wire86;
  input wire signed [(4'hb):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire117;
  wire signed [(4'hb):(1'h0)] wire116;
  wire signed [(4'ha):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire [(4'ha):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire92,
                 wire91,
                 wire90,
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
                 reg93,
                 (1'h0)};
  assign wire90 = wire88[(4'hf):(2'h2)];
  assign wire91 = wire90;
  assign wire92 = wire89[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg93 <= (~$signed(wire87));
      reg94 <= ((((&{wire87}) * $signed((wire87 * wire88))) ^~ wire89[(4'h9):(3'h5)]) != $signed(wire90[(2'h3):(2'h2)]));
      if ($unsigned((~&$signed({(wire92 ? wire88 : (8'hb4)),
          (wire88 ? reg94 : wire87)}))))
        begin
          reg95 <= $unsigned(wire87[(2'h3):(2'h3)]);
          reg96 <= (($signed($signed($unsigned(wire86))) ?
              wire90[(3'h4):(2'h2)] : ($signed($signed(reg95)) != {$unsigned(wire92)})) ^ wire89);
          reg97 <= (|reg93[(5'h10):(4'h8)]);
          if (wire91)
            begin
              reg98 <= wire87;
            end
          else
            begin
              reg98 <= (+reg98);
              reg99 <= {({$signed(wire88), $unsigned((wire87 + reg94))} ?
                      ((|(|reg94)) ?
                          (!wire92[(2'h2):(1'h0)]) : ({wire86} ?
                              {wire86, wire88} : ((8'haa) ?
                                  reg98 : wire85))) : $unsigned($unsigned($signed(reg97))))};
              reg100 <= (+((($signed(wire86) < $signed(wire92)) ~^ (^$signed(reg93))) && (wire92 > $signed(reg96[(1'h1):(1'h0)]))));
              reg101 <= $signed(wire89[(4'hb):(3'h6)]);
            end
        end
      else
        begin
          reg95 <= reg101[(3'h4):(2'h3)];
          if ({((+(~^{reg94})) ?
                  (~^(~|(reg93 ? reg101 : wire89))) : (~&$unsigned(wire88))),
              (8'hbf)})
            begin
              reg96 <= (|(&(wire86[(2'h2):(1'h1)] ?
                  (reg101 ?
                      wire86[(2'h3):(2'h3)] : $signed((8'h9c))) : wire92)));
            end
          else
            begin
              reg96 <= (+reg94);
              reg97 <= $signed((^($unsigned(wire91[(4'hb):(2'h3)]) >>> wire89)));
              reg98 <= $signed(({$signed(reg98[(2'h2):(1'h1)])} ?
                  (wire86[(2'h3):(1'h1)] ?
                      reg100[(3'h5):(2'h3)] : {{(8'hbc)}}) : wire92));
            end
          if (reg99)
            begin
              reg99 <= (~&reg100);
              reg100 <= reg98;
              reg101 <= (~|$unsigned(((-(reg95 ?
                  wire92 : wire86)) << (^(+wire90)))));
            end
          else
            begin
              reg99 <= $unsigned((~|(reg93 ? wire89[(3'h4):(1'h1)] : reg96)));
            end
          reg102 <= reg94;
          reg103 <= {(($signed((reg102 ?
                  (8'hb4) : reg96)) >> $signed($signed(reg95))) - (((wire89 ?
                      (8'h9f) : wire90) >>> ((8'hac) >>> reg98)) ?
                  ($unsigned(reg97) <<< wire91) : ((^wire92) ?
                      (reg99 ? reg102 : reg98) : wire86)))};
        end
    end
  always
    @(posedge clk) begin
      reg104 <= $unsigned((~&reg95));
      reg105 <= (-((($signed((7'h43)) ? wire87[(2'h2):(1'h0)] : (~|reg96)) ?
          $unsigned(reg93[(5'h10):(3'h7)]) : ($unsigned(reg95) > (^reg101))) < (+(reg97[(4'hd):(1'h0)] <<< (8'ha4)))));
    end
  assign wire106 = $signed((wire92[(1'h0):(1'h0)] ?
                       {((8'hb2) ?
                               (reg94 ?
                                   wire85 : wire86) : $signed(reg94))} : $unsigned((~$signed(reg104)))));
  assign wire107 = (reg95[(4'hc):(3'h6)] ?
                       wire85 : ((((wire92 ? wire85 : reg96) ?
                                   $unsigned(wire85) : wire86) ?
                               $unsigned((+wire106)) : $signed({(8'hae)})) ?
                           $signed(reg94) : $signed($signed($signed(reg93)))));
  assign wire108 = (!($signed((((8'ha9) ? reg94 : wire87) ?
                           (reg102 <<< reg103) : {(8'haa)})) ?
                       (8'had) : ($signed((wire86 ?
                           wire88 : reg100)) & ((!wire90) ^ $unsigned(wire92)))));
  assign wire109 = reg101;
  assign wire110 = (~&($signed((+$unsigned(wire92))) ?
                       reg102[(5'h13):(3'h5)] : {wire86,
                           (-(reg93 ? reg103 : wire91))}));
  assign wire111 = (($signed(wire89) <<< (~^(wire86[(4'hd):(3'h6)] ^~ (-(8'hba))))) > $signed($unsigned($unsigned((wire108 ?
                       (7'h44) : wire106)))));
  assign wire112 = wire108[(4'h8):(3'h5)];
  assign wire113 = reg95[(4'h9):(3'h4)];
  assign wire114 = (-$signed(((8'hb5) <<< reg97)));
  assign wire115 = wire112;
  assign wire116 = (wire113 ^~ ($signed($signed({wire86})) ?
                       $unsigned((8'hb7)) : ($signed((reg105 ?
                               wire106 : wire86)) ?
                           (8'h9c) : reg99)));
  assign wire117 = (reg100 < (+((+(wire113 ?
                       (8'hb7) : reg94)) != $unsigned(wire91))));
endmodule
