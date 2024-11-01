module top
#(parameter param80 = (~^{{{(8'hb4)}, (+((8'ha7) ^~ (7'h44)))}, {(^~((8'ha3) ? (8'ha0) : (7'h41))), (&((8'haf) ? (8'hb7) : (8'hbb)))}}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1eb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(5'h14):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire51;
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire58,
                 wire55,
                 wire54,
                 wire53,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire23,
                 wire25,
                 wire26,
                 wire27,
                 wire51,
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
                 reg61,
                 reg60,
                 reg59,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire4 = {(wire1 ? wire1 : (&{(wire1 ? wire3 : wire3)})),
                     $signed(($signed((-wire2)) ?
                         ($unsigned(wire3) < $signed(wire2)) : wire3[(1'h1):(1'h1)]))};
  assign wire5 = ($signed($signed((wire0 ?
                         (wire4 ? wire1 : wire3) : $unsigned(wire0)))) ?
                     {$unsigned(wire4[(4'h9):(3'h5)]),
                         {wire1}} : $unsigned(({wire4,
                         ((8'hb4) ?
                             wire2 : (8'hb7))} >>> (wire2[(4'h8):(3'h7)] ?
                         $unsigned(wire2) : (wire4 ? (7'h43) : wire2)))));
  assign wire6 = wire3[(1'h1):(1'h1)];
  assign wire7 = (!$signed(($signed($unsigned((8'ha2))) ?
                     (wire6 ?
                         (8'hbb) : wire2[(3'h5):(1'h1)]) : wire2[(3'h7):(3'h4)])));
  module8 #() modinst24 (.wire12(wire7), .clk(clk), .wire11(wire3), .wire10(wire5), .wire9(wire0), .y(wire23));
  assign wire25 = (wire3 ?
                      wire4 : ($signed(wire23) >>> (wire23 ?
                          ($signed(wire7) >>> $signed(wire4)) : ((wire5 | wire1) || (~wire3)))));
  assign wire26 = $unsigned(wire4[(2'h3):(2'h3)]);
  assign wire27 = (!(|((!wire23) ? (!(|wire5)) : $unsigned(wire0))));
  module28 #() modinst52 (.wire30(wire0), .wire29(wire26), .wire31(wire3), .clk(clk), .y(wire51), .wire33(wire6), .wire32(wire5));
  assign wire53 = $signed(wire1[(3'h4):(1'h1)]);
  assign wire54 = (&(^(~|$signed(wire23[(3'h5):(1'h0)]))));
  assign wire55 = (&wire25);
  always
    @(posedge clk) begin
      reg56 <= (~^($unsigned(wire55) ?
          $signed(wire3[(4'h9):(2'h3)]) : $unsigned(($unsigned(wire23) <<< (wire5 >> wire1)))));
      reg57 <= wire27[(4'h8):(3'h7)];
    end
  assign wire58 = $unsigned($unsigned(((^~$unsigned(reg56)) ?
                      $unsigned($unsigned(wire23)) : (8'hb2))));
  always
    @(posedge clk) begin
      reg59 <= wire2[(3'h6):(3'h4)];
      reg60 <= (+$unsigned($signed((~|(reg59 ? wire6 : wire23)))));
      reg61 <= (^$signed(((8'hb4) * $signed({reg57, (8'hbf)}))));
    end
  assign wire62 = ($unsigned($signed(($signed(reg56) ?
                      (wire58 ?
                          wire51 : wire6) : (~&wire55)))) <<< reg56[(4'hf):(4'hc)]);
  assign wire63 = $signed(((8'hb5) ~^ $signed(($unsigned((8'hae)) ?
                      (wire5 << (8'hb3)) : $unsigned(wire2)))));
  assign wire64 = ((-{reg60[(4'hb):(2'h2)]}) ?
                      reg57[(3'h6):(1'h0)] : $signed($unsigned(wire54)));
  assign wire65 = $signed((wire3 ?
                      $signed(((wire55 || wire7) ?
                          (wire3 || (8'ha8)) : {wire6})) : (+{$unsigned(wire53)})));
  assign wire66 = wire6;
  always
    @(posedge clk) begin
      reg67 <= reg61;
      if (wire6[(1'h1):(1'h0)])
        begin
          reg68 <= ($unsigned((wire25[(3'h7):(3'h5)] ?
              wire55[(4'hd):(4'h9)] : (+wire51))) << reg56[(1'h0):(1'h0)]);
          reg69 <= $unsigned((~(wire53[(4'h8):(1'h0)] ~^ (((8'haa) ?
              (8'hbe) : wire23) != ((8'hb2) ? wire6 : reg59)))));
          reg70 <= {reg68[(1'h1):(1'h0)]};
        end
      else
        begin
          reg68 <= $unsigned($unsigned($unsigned((8'hbe))));
          reg69 <= (^($signed($unsigned($signed(wire64))) < (reg69 ?
              (8'hae) : $signed(reg56[(1'h0):(1'h0)]))));
        end
      reg71 <= wire2[(3'h6):(3'h6)];
      if ($signed(($unsigned((~|$signed((8'ha5)))) && $unsigned((wire55[(4'hc):(4'h8)] ?
          (~|wire54) : (wire26 ? (8'hbf) : wire1))))))
        begin
          reg72 <= ({(-$signed($unsigned((8'hb9))))} ?
              {$unsigned(((~^wire3) == wire23)),
                  $signed($signed((&reg61)))} : ($signed($signed({reg56,
                      wire25})) ?
                  wire5[(4'ha):(3'h7)] : ((~$signed((8'hb0))) > $signed(reg61[(5'h11):(3'h6)]))));
          reg73 <= wire6[(1'h1):(1'h1)];
          reg74 <= $unsigned(wire2[(4'ha):(4'h9)]);
          if (reg74)
            begin
              reg75 <= $signed({wire62});
              reg76 <= (-((({wire7} == (reg60 && reg68)) ?
                      (!(reg75 ?
                          wire23 : wire58)) : ((reg60 <= reg72) <= wire65)) ?
                  (|$signed(wire6)) : reg69));
            end
          else
            begin
              reg75 <= $unsigned($unsigned(wire7));
              reg76 <= ((wire51[(4'ha):(2'h2)] && $unsigned(reg57)) ?
                  (($signed(reg61[(2'h3):(1'h0)]) ?
                      wire7 : $signed($unsigned(wire1))) ~^ wire54[(1'h0):(1'h0)]) : wire53[(1'h1):(1'h1)]);
            end
          reg77 <= (wire4 >= reg68[(5'h11):(3'h4)]);
        end
      else
        begin
          reg72 <= (wire63[(3'h6):(2'h2)] ?
              ((!(-reg73[(3'h5):(1'h1)])) == reg59) : $signed({{reg70[(4'hb):(3'h7)],
                      (!wire53)},
                  wire25[(3'h6):(1'h1)]}));
          if (wire26)
            begin
              reg73 <= ((wire51 << (reg72[(3'h6):(2'h3)] ?
                  (^~{wire7}) : reg76)) == $unsigned(wire62[(4'h8):(3'h6)]));
              reg74 <= $signed((($unsigned(reg60) << wire3) - ((8'hbe) != (~(wire62 != wire65)))));
              reg75 <= wire63[(4'hc):(2'h2)];
            end
          else
            begin
              reg73 <= $unsigned({{{$signed(reg56), wire1}}});
              reg74 <= ((!(-reg76)) <<< (8'hab));
              reg75 <= (^~$signed(wire51));
              reg76 <= wire51[(4'ha):(4'h9)];
              reg77 <= (~(reg69[(3'h5):(2'h3)] || $unsigned(((~|wire27) & (wire64 ?
                  wire26 : wire1)))));
            end
          reg78 <= $signed(wire23[(3'h6):(3'h6)]);
        end
      reg79 <= $unsigned((^~$signed((|reg68[(5'h11):(4'hc)]))));
    end
endmodule

module module28
#(parameter param50 = ((((-((8'ha1) == (8'ha1))) ? (8'ha1) : (8'hb2)) ? ((8'ha6) ? (~|(8'ha8)) : (&((8'hb9) ^ (8'hbc)))) : ((~&(^~(8'ha8))) ? (((8'hac) ? (7'h44) : (8'ha5)) + {(8'ha0), (8'ha5)}) : ({(8'ha6), (8'h9f)} ? {(7'h41), (8'hb5)} : (8'h9f)))) ? ((^~(((8'ha2) ? (8'hb2) : (8'ha7)) ~^ ((8'hba) ? (8'h9d) : (7'h44)))) == (~^({(8'ha8)} ? {(7'h43)} : ((8'ha9) ? (8'haa) : (8'hbf))))) : ((~(((8'hbd) + (8'hb3)) ? ((8'hb3) ? (8'ha4) : (8'hb9)) : (^(8'ha3)))) ? ((8'hb1) < (~|{(8'ha8)})) : ((8'ha2) <= (~^{(8'hb0)})))))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire33;
  input wire signed [(4'hd):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire [(5'h11):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire34;
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire34,
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
                 (1'h0)};
  assign wire34 = $unsigned((!(wire31 ~^ (~(~&wire33)))));
  always
    @(posedge clk) begin
      if ($unsigned((~^(wire34 ~^ ($unsigned(wire32) ?
          $unsigned(wire32) : wire29)))))
        begin
          reg35 <= wire31;
          reg36 <= (+$signed(($unsigned($unsigned(wire33)) && ((wire34 <= wire32) ?
              $signed(wire30) : $signed(reg35)))));
          reg37 <= $unsigned($signed($signed(wire33[(1'h0):(1'h0)])));
          if ({$signed(($signed($unsigned(wire31)) ?
                  (!{reg35}) : $signed($unsigned(wire29)))),
              $signed((((wire34 ? wire29 : reg35) ?
                      $signed(wire29) : {wire32, (8'hab)}) ?
                  wire31[(3'h6):(1'h1)] : $unsigned(wire30[(1'h0):(1'h0)])))})
            begin
              reg38 <= (+(8'ha4));
              reg39 <= {reg35[(4'h8):(3'h4)],
                  $unsigned((((wire30 != reg35) ^ ((7'h41) <<< reg36)) ?
                      $signed(wire33[(2'h2):(2'h2)]) : (-(8'hb5))))};
            end
          else
            begin
              reg38 <= (^(~{$unsigned($signed(wire32)), $signed((-reg36))}));
              reg39 <= (reg38 ^ wire34);
              reg40 <= wire30;
              reg41 <= ($unsigned(($unsigned(reg40[(2'h2):(1'h1)]) ?
                      $signed($unsigned(reg35)) : $unsigned(reg38))) ?
                  ((^({wire34, reg36} ?
                      wire31 : (wire29 * reg36))) >>> reg36) : wire30[(1'h1):(1'h1)]);
              reg42 <= (wire32[(3'h4):(3'h4)] ^~ ((((reg41 | reg36) ?
                          $unsigned((8'hb9)) : $unsigned(wire29)) ?
                      ($signed(wire29) ?
                          ((7'h42) ?
                              wire31 : reg40) : ((8'hb6) + (8'hbd))) : wire32) ?
                  wire30[(1'h0):(1'h0)] : reg38[(3'h5):(1'h1)]));
            end
          reg43 <= ((8'hbe) ^~ $unsigned(($signed((reg42 ? reg35 : wire29)) ?
              {(|reg37), {wire30}} : $signed($signed(reg40)))));
        end
      else
        begin
          reg35 <= reg41;
          reg36 <= (wire29[(1'h1):(1'h0)] ?
              $signed($unsigned((wire33[(1'h1):(1'h1)] || wire34[(1'h1):(1'h1)]))) : wire31[(3'h5):(2'h2)]);
        end
      reg44 <= wire31;
      reg45 <= $signed({(8'hb9)});
      reg46 <= (reg44 <<< ((~|$signed((7'h44))) ?
          $unsigned($signed($unsigned((8'ha9)))) : (reg35 != reg44)));
    end
  assign wire47 = $unsigned(wire30);
  assign wire48 = (~&$signed(((~|reg44) ? reg44[(4'hb):(4'h9)] : reg43)));
  assign wire49 = $signed(reg44[(3'h4):(2'h3)]);
endmodule

module module8
#(parameter param22 = ((!(~^(((8'hab) < (8'h9c)) ? ((8'hae) || (8'hb2)) : ((8'had) - (8'ha6))))) ? ((-(((8'hae) - (8'ha7)) ? ((8'haf) - (8'h9f)) : ((8'hbb) + (8'h9e)))) + {{(~^(8'hb0)), ((8'ha0) ? (8'hae) : (8'ha6))}, ((^(7'h40)) <= ((8'hba) ? (8'h9c) : (8'hba)))}) : {(~^(((8'ha1) ? (8'ha9) : (8'hbf)) + ((7'h43) ? (8'hb0) : (8'had))))}))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire13 = {(7'h41),
                      (!((~$signed(wire11)) ? (8'hbb) : {$unsigned(wire9)}))};
  assign wire14 = wire10;
  assign wire15 = wire10[(3'h5):(2'h3)];
  assign wire16 = {wire12[(2'h2):(2'h2)]};
  always
    @(posedge clk) begin
      reg17 <= $signed((((^~$signed((8'hb8))) ?
          $unsigned($unsigned(wire14)) : wire14[(3'h4):(1'h0)]) + (~wire16[(2'h2):(1'h1)])));
      reg18 <= wire12[(2'h3):(1'h1)];
      reg19 <= $signed((7'h42));
    end
  assign wire20 = wire14[(3'h5):(1'h1)];
  assign wire21 = $unsigned((wire11 ?
                      $signed({$signed(reg17), wire10}) : ({reg18,
                          wire9[(1'h1):(1'h1)]} | ({reg18,
                          wire20} || (!reg19)))));
endmodule
