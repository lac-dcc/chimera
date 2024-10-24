module top
#(parameter param150 = (!(((&((8'ha7) ? (8'hac) : (8'h9f))) >= (((8'hbb) ? (8'ha4) : (8'ha0)) - ((7'h41) <<< (8'hb7)))) ? (~^(((8'hb3) ? (8'hb4) : (8'ha3)) ? {(8'hb2)} : ((8'hb2) ? (8'hba) : (8'hbd)))) : (((^~(8'ha8)) ? {(8'ha4), (7'h41)} : (~|(8'ha6))) ? (((8'hba) <= (7'h43)) ? ((8'ha3) ? (8'hb6) : (7'h41)) : (~^(7'h42))) : ((!(8'hb3)) & ((8'h9d) ? (8'hbf) : (8'ha7)))))), 
parameter param151 = ((~|(param150 ? (^~(-param150)) : (((8'hb3) ^~ param150) ^ (param150 >> param150)))) >> param150))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire149;
  wire signed [(3'h6):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire138;
  wire signed [(4'ha):(1'h0)] wire137;
  wire signed [(2'h2):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire113;
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(4'hc):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  assign y = {wire149,
                 wire139,
                 wire138,
                 wire137,
                 wire126,
                 wire117,
                 wire116,
                 wire115,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire113,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
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
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire4 = (8'ha8);
  assign wire5 = wire3;
  assign wire6 = ($signed(($signed((wire3 ? wire2 : wire2)) ?
                     $unsigned($unsigned(wire3)) : ((^wire4) ?
                         (wire1 ?
                             wire5 : wire5) : $signed(wire2)))) - $unsigned($signed(((wire3 ?
                         wire0 : wire2) ?
                     wire4 : wire2[(1'h0):(1'h0)]))));
  assign wire7 = (~|$unsigned($signed(wire3)));
  module8 #() modinst114 (.wire10(wire7), .wire9(wire1), .wire13(wire4), .y(wire113), .wire12(wire5), .wire11(wire3), .clk(clk));
  assign wire115 = (+$unsigned($unsigned((7'h42))));
  assign wire116 = wire2;
  assign wire117 = (((($signed(wire116) & wire4[(1'h1):(1'h0)]) - wire113[(1'h1):(1'h0)]) ?
                           $signed((^{wire7})) : {(wire4[(3'h7):(3'h4)] ?
                                   $signed(wire7) : (~&wire1))}) ?
                       wire0[(1'h0):(1'h0)] : ((wire6 + (|(wire7 <<< wire6))) ?
                           wire7 : $signed((wire6 <<< $unsigned((8'hb9))))));
  always
    @(posedge clk) begin
      reg118 <= $signed((~|wire1));
    end
  always
    @(posedge clk) begin
      reg119 <= $signed(wire3[(3'h4):(2'h2)]);
      reg120 <= (wire113 + ((&$signed((+reg119))) ~^ (-wire7)));
      reg121 <= wire113[(4'hf):(4'he)];
      if ($signed(wire1[(2'h3):(1'h0)]))
        begin
          if (reg119)
            begin
              reg122 <= (wire117[(2'h2):(2'h2)] ?
                  ($unsigned(reg121) > ($signed($unsigned(wire6)) - (8'ha6))) : {wire117,
                      (~|((reg121 ? (8'ha2) : wire7) ?
                          (wire115 <= wire4) : $signed((8'ha0))))});
              reg123 <= (-$signed(((-reg119) >>> $signed((wire1 ?
                  wire4 : wire116)))));
            end
          else
            begin
              reg122 <= wire0;
            end
          reg124 <= wire115[(4'hc):(1'h1)];
        end
      else
        begin
          reg122 <= (($signed(((reg122 ? wire3 : wire4) ?
                  wire113[(4'h9):(2'h2)] : wire7[(4'ha):(1'h0)])) ^ (~^{(!(8'ha0)),
                  $signed(wire4)})) ?
              reg120 : wire5[(4'h8):(3'h7)]);
          if (($unsigned(wire113) ?
              reg120[(3'h6):(3'h5)] : {($signed(((7'h40) ? (8'ha2) : wire6)) ?
                      $unsigned($signed(wire117)) : wire113)}))
            begin
              reg123 <= (~&($signed(((reg118 ? wire4 : (8'hb2)) ?
                      (wire6 + wire1) : (wire0 && wire115))) ?
                  wire5[(4'h8):(2'h2)] : $unsigned(reg120[(3'h4):(2'h3)])));
              reg124 <= $unsigned({((~(wire3 ?
                      reg123 : (8'hb1))) != ($signed(reg119) < {wire2}))});
              reg125 <= wire0[(4'he):(4'hd)];
            end
          else
            begin
              reg123 <= $signed((((|wire5[(5'h12):(4'he)]) <= (&$signed(reg121))) ?
                  $unsigned(reg123) : $unsigned(((&wire0) ?
                      {reg118, (8'hbe)} : $signed(reg123)))));
            end
        end
    end
  assign wire126 = (reg118[(3'h7):(3'h5)] == wire4[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg127 <= wire113;
      if (reg121)
        begin
          reg128 <= ($signed(((((8'ha5) ?
              reg127 : reg127) && (reg125 * wire4)) & (wire113[(2'h2):(1'h0)] || (wire2 ?
              wire6 : (7'h40))))) < wire5);
          reg129 <= $signed(($unsigned(reg124[(2'h2):(1'h0)]) ?
              wire7[(3'h5):(1'h1)] : wire126));
          reg130 <= reg123[(3'h7):(3'h6)];
          reg131 <= (reg120 ? (^~wire117[(1'h0):(1'h0)]) : reg119);
          if (((~(|((8'hbc) >> wire2[(1'h0):(1'h0)]))) ?
              ($signed($signed($unsigned(reg125))) ^ (+$signed($unsigned(wire6)))) : $unsigned(((7'h41) ?
                  $signed($signed(reg130)) : $unsigned(((8'hb2) != wire5))))))
            begin
              reg132 <= $signed((-$unsigned($signed($unsigned((8'haf))))));
              reg133 <= reg132;
              reg134 <= wire7[(3'h5):(2'h2)];
            end
          else
            begin
              reg132 <= (^reg123);
              reg133 <= (($unsigned((wire113[(4'hd):(4'hd)] ?
                      (reg132 ?
                          (7'h44) : wire5) : $unsigned(reg118))) <= {wire7,
                      (wire3 <<< wire117[(2'h2):(1'h1)])}) ?
                  wire115[(5'h13):(5'h12)] : ((^wire113) <= (wire116 ?
                      wire4[(3'h7):(3'h6)] : ($signed(reg123) ?
                          reg122 : reg119[(3'h5):(3'h5)]))));
              reg134 <= $unsigned($signed($signed((8'ha4))));
              reg135 <= $signed(((~^(^~$signed((8'hb8)))) ?
                  wire116 : ((wire116[(2'h3):(1'h0)] < $unsigned((8'ha8))) ?
                      reg128[(5'h14):(1'h0)] : $unsigned(reg131[(4'h8):(3'h4)]))));
              reg136 <= (~^reg120);
            end
        end
      else
        begin
          reg128 <= $signed($unsigned(($signed((wire0 | wire115)) ?
              $signed((reg136 + (7'h42))) : {wire7[(4'ha):(1'h1)],
                  $unsigned(wire126)})));
          if ((reg131[(5'h10):(4'h9)] != $unsigned((|$signed((^~reg119))))))
            begin
              reg129 <= {wire2[(1'h1):(1'h0)]};
            end
          else
            begin
              reg129 <= reg124[(3'h6):(1'h0)];
              reg130 <= wire115[(5'h10):(4'h9)];
              reg131 <= $signed(reg127);
            end
          reg132 <= $signed((~reg129[(1'h1):(1'h0)]));
        end
    end
  assign wire137 = ((!(8'hb2)) >>> $signed((wire4 ?
                       ((reg119 ?
                           wire4 : reg136) >>> reg119[(3'h5):(2'h2)]) : $unsigned((~^reg127)))));
  assign wire138 = reg133;
  assign wire139 = (!($unsigned((reg136[(5'h10):(5'h10)] >= wire126)) == (!reg132[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg140 <= $unsigned($unsigned(wire126[(1'h1):(1'h0)]));
      if (wire5)
        begin
          reg141 <= wire115[(2'h3):(1'h0)];
        end
      else
        begin
          reg141 <= wire2;
          if ($signed((wire137 > (wire5 ?
              reg136[(4'hb):(4'h8)] : (reg130 ?
                  $signed((8'ha8)) : $unsigned(wire137))))))
            begin
              reg142 <= {(8'h9e),
                  (reg118 >> {(-(reg121 ? reg130 : reg134)), (-(~^reg125))})};
              reg143 <= reg135[(1'h0):(1'h0)];
              reg144 <= {reg142};
            end
          else
            begin
              reg142 <= wire139[(1'h1):(1'h0)];
              reg143 <= {(~&(wire137 ?
                      reg121[(4'hb):(3'h4)] : $signed(((8'ha1) | reg128))))};
              reg144 <= $signed({(wire116 ?
                      (reg127[(2'h3):(1'h0)] ?
                          (wire113 >> (8'hb1)) : ((8'hb9) != wire4)) : reg136[(2'h2):(2'h2)]),
                  (^((reg134 && reg143) ?
                      reg129[(3'h7):(2'h2)] : $unsigned(reg118)))});
              reg145 <= $signed((($unsigned(reg129[(1'h0):(1'h0)]) ?
                      $signed({wire2, reg118}) : {wire3, (^~wire7)}) ?
                  reg125[(3'h6):(1'h1)] : reg134[(4'hc):(4'ha)]));
            end
          reg146 <= $unsigned({reg118[(5'h10):(1'h1)]});
        end
      reg147 <= reg133[(2'h3):(2'h2)];
      reg148 <= $signed($unsigned(($signed(wire6) ?
          (((8'h9c) ?
              reg128 : wire113) <<< $unsigned(wire5)) : (&$signed(reg141)))));
    end
  assign wire149 = ((+(reg125[(5'h11):(4'hb)] | $signed((reg141 << reg143)))) << ($signed($unsigned(reg128[(2'h3):(2'h3)])) ?
                       $signed((8'hb3)) : reg119[(3'h4):(1'h1)]));
endmodule

module module8
#(parameter param111 = ((((^~{(8'hbf), (7'h41)}) ? ({(8'haa), (8'hbc)} ? ((8'h9e) ^~ (8'ha6)) : ((7'h44) | (8'hbe))) : (((8'hb5) ? (8'hb6) : (8'hb6)) == (|(8'hbe)))) ? ((~^(~|(8'ha8))) & {{(8'ha1)}, (&(7'h44))}) : ((^~{(8'had), (8'hb3)}) << (!((8'hba) >> (8'hb5))))) * {{((~(8'hbe)) & (8'ha4)), (((8'hb4) ? (8'ha0) : (8'hab)) ? ((8'hbc) ? (8'hb9) : (8'hb5)) : ((8'ha0) ? (8'hbe) : (8'hbe)))}, (|{(~&(7'h43))})}), 
parameter param112 = (&{({param111} ? ({param111, param111} ? param111 : (param111 > param111)) : ((param111 ? param111 : param111) ? ((8'ha2) ^ (8'h9f)) : (|param111))), (((param111 ? param111 : param111) ? {param111, (8'ha5)} : (+param111)) | (~(param111 ? param111 : param111)))}))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h1e6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire107;
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire73,
                 wire31,
                 wire30,
                 wire16,
                 wire15,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire82,
                 wire83,
                 wire95,
                 wire107,
                 reg14,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg81,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= $signed($unsigned($unsigned(wire9[(3'h5):(3'h4)])));
    end
  assign wire15 = $signed(wire13[(3'h4):(2'h2)]);
  assign wire16 = wire10[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg17 <= $signed((wire11[(4'ha):(3'h6)] ?
          $signed({$unsigned(reg14)}) : ($signed(wire9) >> $unsigned((-(8'haf))))));
      reg18 <= $unsigned(wire11);
      reg19 <= $unsigned(wire12);
      if (wire16[(4'h8):(1'h0)])
        begin
          if (((~&$unsigned($signed(wire16))) >> $unsigned($unsigned((wire11[(5'h14):(4'hd)] && {reg17})))))
            begin
              reg20 <= (~wire16[(3'h6):(3'h4)]);
              reg21 <= ($signed(({wire9[(3'h5):(2'h2)],
                      (wire15 ? wire11 : wire12)} ?
                  $unsigned(((8'hab) ? wire16 : wire13)) : ((8'hb4) ?
                      $unsigned((8'hae)) : reg20[(2'h3):(1'h1)]))) - wire12[(2'h2):(1'h0)]);
              reg22 <= ((~&($unsigned(reg19[(1'h0):(1'h0)]) ?
                      ({reg20} ?
                          (wire15 > reg17) : reg21) : (~((8'had) < reg18)))) ?
                  (((((8'hbf) << reg20) ?
                          (!reg21) : (reg20 || reg14)) || {(&reg21),
                          $unsigned(reg19)}) ?
                      wire12[(4'h8):(1'h0)] : ($unsigned((^wire12)) < $unsigned($unsigned(reg19)))) : wire11[(4'ha):(1'h0)]);
              reg23 <= (^wire13);
            end
          else
            begin
              reg20 <= (({(8'ha3)} || reg17[(1'h0):(1'h0)]) == $signed($unsigned((reg21 <= {reg20}))));
            end
          if (reg23[(4'hf):(4'hc)])
            begin
              reg24 <= {(wire10[(3'h5):(3'h4)] * $unsigned(reg19[(2'h2):(2'h2)]))};
              reg25 <= wire12;
              reg26 <= (~(~&(~wire10[(2'h3):(1'h0)])));
              reg27 <= wire10[(2'h3):(2'h2)];
            end
          else
            begin
              reg24 <= reg24[(4'h9):(4'h9)];
              reg25 <= ({$signed((+reg21[(1'h0):(1'h0)]))} ?
                  $unsigned($signed((~|(wire12 ?
                      reg17 : (8'hb5))))) : ((~reg22[(3'h5):(3'h4)]) ?
                      (reg24[(2'h2):(1'h1)] <<< {(&reg20),
                          $unsigned(reg14)}) : $signed($signed(reg27[(1'h0):(1'h0)]))));
              reg26 <= (|$unsigned(({{wire9, reg14},
                  $unsigned(reg20)} ^ ({reg14} && $unsigned((8'hbf))))));
              reg27 <= reg14[(4'hf):(4'hf)];
              reg28 <= ($signed(reg21[(2'h2):(1'h0)]) | {(((reg26 ?
                          reg17 : reg24) << (reg21 + reg25)) ?
                      ((wire16 ? reg25 : reg21) == (reg20 ?
                          reg21 : wire11)) : $unsigned((reg19 ?
                          reg18 : reg24)))});
            end
          reg29 <= reg22;
        end
      else
        begin
          reg20 <= (^(~^$signed(reg26)));
          reg21 <= $unsigned(reg24[(1'h0):(1'h0)]);
        end
    end
  assign wire30 = (-((^~wire11) ?
                      (|((reg20 ?
                          (8'haa) : reg25) > (~^reg21))) : (($signed((8'hb1)) >>> reg27[(2'h2):(2'h2)]) ^~ ($unsigned(reg29) ?
                          reg28 : ((8'h9f) ? wire16 : reg19)))));
  assign wire31 = ((~&reg19[(1'h1):(1'h0)]) ?
                      ((~&wire16[(3'h5):(2'h2)]) == $unsigned(((reg27 - reg29) ?
                          (reg21 ? (8'hb5) : reg19) : reg20))) : wire30);
  module32 #() modinst74 (.wire37(wire12), .y(wire73), .wire33(wire10), .clk(clk), .wire35(reg27), .wire36(reg21), .wire34(wire15));
  assign wire75 = ((~&(reg22 || $unsigned((reg24 - wire11)))) & (8'ha5));
  assign wire76 = $unsigned($signed((8'hab)));
  assign wire77 = ((~&$unsigned((wire10 || (wire30 - wire15)))) ?
                      (^~reg28) : reg20[(1'h1):(1'h1)]);
  assign wire78 = ((wire16[(1'h1):(1'h1)] ?
                      ((wire15 >> wire15) ?
                          reg24 : (+reg21)) : $signed({(~|(8'hbb))})) * (wire11[(3'h4):(2'h2)] ?
                      $unsigned(wire31) : ((!(-(8'h9c))) ?
                          {$signed((8'haf))} : wire15)));
  assign wire79 = reg19[(1'h1):(1'h0)];
  assign wire80 = (wire16[(4'h9):(1'h1)] <<< {wire16[(4'h9):(2'h3)],
                      (-reg27[(4'hf):(3'h7)])});
  always
    @(posedge clk) begin
      reg81 <= ($signed((wire79 << $unsigned((wire75 <= reg24)))) ?
          $signed($unsigned(wire73[(4'h9):(4'h9)])) : $signed({{(reg22 ?
                      (8'hbd) : wire31)},
              ((reg29 ? wire16 : wire31) == ((8'ha9) ? wire15 : wire73))}));
    end
  assign wire82 = $signed((~wire9));
  assign wire83 = (-wire76[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(reg21) != $unsigned(wire10))))
        begin
          reg84 <= ($signed($signed(({wire76} > wire77[(1'h0):(1'h0)]))) ?
              wire75 : reg23);
          reg85 <= wire82[(4'ha):(1'h0)];
          reg86 <= $signed((|({wire77,
              $signed(wire9)} >>> (reg84[(4'h9):(1'h0)] ? (+reg23) : reg21))));
        end
      else
        begin
          reg84 <= $signed((&$unsigned($unsigned(wire75[(1'h0):(1'h0)]))));
          if ((^$unsigned((+(wire9 ~^ $unsigned(wire13))))))
            begin
              reg85 <= $unsigned((!({(wire30 ?
                      (8'h9c) : wire12)} || ($unsigned((8'h9c)) >> (~|(8'hba))))));
              reg86 <= (!$unsigned((((~^wire15) || $signed(wire31)) ?
                  wire11[(5'h10):(4'h9)] : (^wire77))));
            end
          else
            begin
              reg85 <= (reg21[(2'h2):(2'h2)] ?
                  ($signed({(reg27 ?
                          (8'ha3) : (8'haf))}) >= (reg17[(2'h3):(2'h3)] ?
                      $signed(((8'hb1) ?
                          wire15 : wire78)) : (8'hbb))) : reg18[(4'ha):(3'h7)]);
              reg86 <= ($signed($unsigned(((~|wire12) ^~ reg81[(2'h2):(1'h1)]))) ?
                  (wire16 ?
                      (reg18 ?
                          wire78 : ((~(8'hb1)) ?
                              reg29 : $unsigned(wire78))) : (wire13[(3'h4):(1'h0)] - (~&(^reg14)))) : wire31);
              reg87 <= {reg84};
            end
        end
      reg88 <= {wire76};
      if (($unsigned((~|wire79)) ?
          ({reg22[(4'h8):(3'h6)],
              (wire79[(2'h2):(1'h1)] & (wire82 ?
                  wire82 : wire75))} ^ reg29) : ((+{wire31[(4'h8):(3'h5)],
              (wire78 ? reg17 : wire75)}) ^~ wire15[(3'h4):(3'h4)])))
        begin
          reg89 <= {({wire75} ^ (({wire79} ?
                  reg28 : {reg22, reg87}) ^~ reg86))};
        end
      else
        begin
          reg89 <= $signed($unsigned(((!wire30) >>> {$signed(reg29)})));
          reg90 <= reg18[(5'h10):(4'hc)];
          if ({$signed(($unsigned((^(8'ha1))) + wire13))})
            begin
              reg91 <= $unsigned($signed((&$signed((wire10 ?
                  wire75 : reg24)))));
              reg92 <= (|(({(~&wire75)} || ((wire10 ?
                  (8'hba) : reg91) <<< ((8'haa) ^~ wire77))) && wire11));
            end
          else
            begin
              reg91 <= ($unsigned((-(~(reg84 != wire77)))) <= (|(|(^$signed(reg84)))));
            end
          reg93 <= wire11;
          reg94 <= $signed({wire82[(1'h1):(1'h1)], {wire73[(5'h12):(3'h7)]}});
        end
    end
  assign wire95 = (reg92 ?
                      (-$signed({(&reg22)})) : (wire16[(1'h1):(1'h0)] >>> $signed({$signed(reg26)})));
  module96 #() modinst108 (.clk(clk), .wire99(wire73), .wire98(wire15), .y(wire107), .wire100(wire82), .wire97(reg84));
  assign wire109 = reg14;
  assign wire110 = $unsigned(wire16[(1'h1):(1'h1)]);
endmodule

module module96
#(parameter param106 = ((((+(^(8'ha3))) ? {(~(8'hb8))} : {(~|(7'h41))}) ? ({((8'hb6) & (7'h41))} ? (&((8'hbe) <<< (8'hae))) : {{(8'ha3)}}) : ({(!(8'hae)), (~&(8'h9c))} ? (~^((8'h9d) == (8'ha4))) : ((!(8'hab)) ? (8'hbf) : (|(8'ha9))))) == (({((7'h40) ^~ (7'h40))} ? (((8'hbf) ? (7'h41) : (8'hbe)) && (~|(8'ha6))) : (~^((7'h42) == (8'h9f)))) ? {{(^(8'hb9)), ((8'h9f) ? (8'hb1) : (8'h9f))}, (8'hb4)} : (~&(8'ha5)))))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire100;
  input wire signed [(4'hc):(1'h0)] wire99;
  input wire [(4'hd):(1'h0)] wire98;
  input wire signed [(5'h11):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire105;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire101;
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  assign y = {wire105, wire103, wire102, wire101, reg104, (1'h0)};
  assign wire101 = (({(wire98[(3'h7):(1'h0)] ?
                                   wire100 : (wire98 ? wire98 : wire98))} ?
                           wire100[(4'hb):(1'h1)] : ($unsigned((~^wire99)) ?
                               (~|(wire100 - wire100)) : $signed($unsigned(wire97)))) ?
                       wire97 : ((+(wire100 || (wire100 ~^ wire99))) >>> $unsigned($signed(wire98))));
  assign wire102 = $unsigned(wire97[(4'hb):(3'h6)]);
  assign wire103 = wire99;
  always
    @(posedge clk) begin
      reg104 <= (^~(wire101[(3'h4):(2'h2)] - ($signed({wire97, wire97}) ?
          ((&wire102) >>> $signed(wire98)) : wire101)));
    end
  assign wire105 = (&wire101[(4'hc):(4'ha)]);
endmodule

module module32
#(parameter param72 = ((^((((8'ha2) >> (8'had)) ? (~&(8'hbc)) : (~&(8'hab))) ? (((8'hb8) ? (8'haa) : (8'ha6)) == {(7'h44)}) : (((7'h44) & (8'h9e)) & (-(7'h43))))) <= (|((~((8'ha2) != (8'hb7))) || (~|((7'h42) ^ (8'haf)))))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire37;
  input wire [(4'hb):(1'h0)] wire36;
  input wire signed [(5'h11):(1'h0)] wire35;
  input wire [(3'h4):(1'h0)] wire34;
  input wire signed [(4'hc):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire38;
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire38,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire38 = $signed($unsigned($unsigned((wire33[(4'hc):(4'ha)] > (wire35 > wire34)))));
  always
    @(posedge clk) begin
      reg39 <= wire36[(1'h1):(1'h1)];
      reg40 <= $signed(((&($unsigned(reg39) ? wire33 : (wire38 + wire36))) ?
          (&($unsigned(wire34) ? (-reg39) : $unsigned(wire36))) : wire33));
    end
  assign wire41 = $unsigned(wire33);
  assign wire42 = ((($unsigned(wire34) ?
                      reg40 : $signed(wire38)) || ((wire36 & wire41[(4'h8):(2'h3)]) ~^ wire37)) | wire36);
  assign wire43 = (wire35[(2'h2):(2'h2)] >>> (((wire34 ?
                          wire34[(1'h0):(1'h0)] : wire41) ?
                      $unsigned((~|wire38)) : (wire42[(3'h5):(1'h1)] && (wire33 ?
                          reg39 : wire41))) <= ((wire35 ?
                      $signed(wire35) : (wire42 >>> (7'h41))) ^~ ((reg40 ?
                      wire42 : (8'ha1)) & $unsigned(wire36)))));
  assign wire44 = $unsigned($signed((((~|wire35) ?
                          (8'ha2) : ((8'ha6) ? wire35 : wire43)) ?
                      $signed((~|(7'h44))) : wire36)));
  assign wire45 = (|((^~reg40[(5'h13):(1'h0)]) ^ (&{wire44})));
  always
    @(posedge clk) begin
      reg46 <= ((((wire41 > $signed(wire36)) <= $signed((wire42 + (8'ha0)))) > $unsigned($signed((wire35 + reg40)))) ?
          {$unsigned(((wire45 << (8'haf)) < wire34)),
              (&$unsigned(wire34))} : $unsigned({(+{wire44, wire42}),
              ($signed(wire37) ? $signed(wire36) : $unsigned(wire45))}));
      if (wire41)
        begin
          reg47 <= (wire44 <<< $signed($unsigned($signed($unsigned(wire42)))));
          reg48 <= ($signed(wire41[(2'h3):(1'h0)]) > $signed(wire42));
          reg49 <= (-(($unsigned(wire43) ^ {$signed(reg39), $signed(reg39)}) ?
              wire37 : {reg40[(2'h3):(2'h2)], $unsigned((~^wire41))}));
        end
      else
        begin
          reg47 <= ($signed(reg47) ?
              (8'hbd) : $unsigned($signed({(wire33 ? reg49 : wire38),
                  $signed((8'hb0))})));
          reg48 <= (((&wire38) ?
                  wire41[(4'hb):(2'h3)] : wire35[(3'h7):(3'h7)]) ?
              (($signed((wire43 ? wire35 : reg40)) ?
                  $unsigned((^~reg48)) : ((~&wire33) ?
                      wire45 : $signed(wire43))) * ((&(wire33 & reg39)) >>> {(reg47 != wire37)})) : {((+wire36[(4'h8):(3'h4)]) && reg46[(4'hc):(3'h4)]),
                  wire36[(3'h5):(3'h4)]});
          reg49 <= $signed((~^wire37[(5'h11):(3'h4)]));
          reg50 <= reg49;
        end
      reg51 <= $signed({$unsigned(reg40)});
      if ({wire37})
        begin
          reg52 <= $unsigned(($signed((8'ha3)) << $signed($signed($unsigned(reg39)))));
        end
      else
        begin
          reg52 <= ((^wire37[(5'h11):(4'he)]) >> reg49[(5'h12):(2'h3)]);
        end
      reg53 <= $unsigned(wire41);
    end
  assign wire54 = wire36;
  assign wire55 = (($signed(reg48) < $signed(((wire38 ?
                          wire38 : reg46) >> reg48))) ?
                      {$signed($unsigned($unsigned((7'h41))))} : wire43[(2'h3):(1'h1)]);
  assign wire56 = wire44;
  assign wire57 = $unsigned((~&{$signed((wire33 >= (8'h9c))), wire44}));
  always
    @(posedge clk) begin
      reg58 <= ($unsigned(wire55[(1'h1):(1'h1)]) < $signed(reg52[(3'h5):(2'h3)]));
      reg59 <= wire35;
      if ((^$unsigned((^(reg47[(2'h2):(1'h0)] ?
          (reg47 << reg47) : $signed((8'hb7)))))))
        begin
          reg60 <= reg52;
          reg61 <= (reg40[(5'h10):(4'h8)] >> (&wire34));
        end
      else
        begin
          reg60 <= $signed((-(($signed((8'hb8)) ?
              $signed(wire35) : wire45[(4'hd):(1'h0)]) && ($unsigned(wire45) & wire57[(1'h0):(1'h0)]))));
          reg61 <= wire41;
          reg62 <= (((!{$signed(wire41), (~^wire55)}) >>> $unsigned(wire57)) ?
              reg40 : (wire44[(3'h4):(1'h1)] ? reg39 : reg51));
          reg63 <= (wire38 <= $unsigned(reg49));
          if ((8'had))
            begin
              reg64 <= (wire35 ?
                  $signed((reg46[(4'h9):(2'h2)] ^ wire38[(3'h7):(2'h3)])) : ($unsigned({(reg59 ?
                              reg59 : wire37),
                          {reg52, reg59}}) ?
                      (((reg39 <= wire57) - wire54[(5'h14):(4'hd)]) * {(reg61 ?
                              reg40 : (8'hb6))}) : reg52[(3'h5):(3'h4)]));
            end
          else
            begin
              reg64 <= ({(((-reg61) ~^ wire56[(4'ha):(3'h4)]) - wire41[(5'h15):(4'h9)]),
                  reg49} << (wire41 ? wire34 : $signed(wire56[(4'ha):(2'h2)])));
              reg65 <= $unsigned(((8'hb7) > wire35[(5'h10):(4'h8)]));
              reg66 <= (($signed($unsigned($unsigned(wire56))) >>> $signed($unsigned((reg47 ?
                  wire37 : wire33)))) && reg49);
              reg67 <= $unsigned((!reg49));
            end
        end
    end
  always
    @(posedge clk) begin
      reg68 <= ((((8'ha0) <= $signed((+wire37))) || $unsigned($signed(reg63))) ?
          (8'h9f) : wire45);
      reg69 <= $signed($unsigned((~&($signed(wire35) ?
          reg50 : {wire57, reg67}))));
    end
  assign wire70 = {$unsigned(wire56[(3'h5):(1'h1)]), reg47[(2'h3):(2'h3)]};
  assign wire71 = $unsigned((((reg68 ?
                              (reg46 ?
                                  wire37 : wire70) : reg58[(1'h0):(1'h0)]) ?
                          wire37 : ((!wire44) ? (+wire41) : wire37)) ?
                      $signed($signed($signed(reg61))) : (|$signed(reg58[(4'ha):(3'h7)]))));
endmodule
