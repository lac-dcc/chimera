module top
#(parameter param77 = (({((^(7'h42)) ? ((8'h9c) > (8'hb7)) : (&(8'ha9)))} ^ {(((8'hab) ? (7'h42) : (8'had)) ? ((8'ha3) ? (8'ha1) : (8'ha8)) : ((8'h9d) == (8'hbc)))}) ? (&{(((8'ha9) ? (8'hb1) : (8'ha7)) ? ((8'ha8) < (8'hb8)) : (~(8'ha2))), (~&(8'hac))}) : (((~|(|(8'hbd))) ? (((8'h9d) ? (8'hb5) : (8'ha3)) * ((8'hba) || (7'h42))) : {((8'ha0) ? (8'hb5) : (8'ha8)), ((8'ha0) ? (8'ha4) : (7'h41))}) - ({{(8'haf)}} && {((8'hb2) >>> (8'hbd)), (^~(8'hbe))}))), 
parameter param78 = param77)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  assign y = {wire76,
                 wire74,
                 wire73,
                 wire61,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg75,
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
                 (1'h0)};
  assign wire5 = $unsigned({$signed({$unsigned(wire0), (+wire2)})});
  assign wire6 = {$signed(wire5),
                     {$signed((|(8'haf))),
                         $signed($unsigned((wire3 ? wire1 : wire1)))}};
  assign wire7 = (8'hb4);
  assign wire8 = wire6[(1'h1):(1'h0)];
  assign wire9 = $signed($signed(wire0));
  module10 #() modinst62 (.wire12(wire1), .y(wire61), .wire13(wire0), .clk(clk), .wire14(wire3), .wire11(wire6));
  always
    @(posedge clk) begin
      reg63 <= wire7;
      reg64 <= (({$signed((~|wire5)),
              ($signed(wire1) >>> $unsigned(wire4))} <= $signed($unsigned((wire61 ?
              wire0 : wire2)))) ?
          wire6[(3'h7):(3'h4)] : (+wire2));
    end
  always
    @(posedge clk) begin
      reg65 <= wire5;
      if (wire9[(3'h4):(1'h1)])
        begin
          reg66 <= $signed(wire9[(3'h6):(2'h2)]);
        end
      else
        begin
          if (((reg63 <<< wire2) == wire4))
            begin
              reg66 <= $signed((reg63 ?
                  wire61 : ($signed((wire1 ?
                      (8'h9d) : wire3)) >> (wire9[(2'h3):(2'h2)] <<< (wire1 << wire3)))));
              reg67 <= (((~$signed((^reg66))) ?
                      wire1[(4'hd):(2'h3)] : wire61[(3'h6):(2'h3)]) ?
                  wire5 : (wire9[(1'h0):(1'h0)] ^~ wire4));
              reg68 <= {wire0[(4'h8):(2'h2)],
                  ({$unsigned((~^wire9))} <<< (~^wire0[(4'hf):(4'ha)]))};
              reg69 <= (~^(($unsigned(wire7[(3'h4):(2'h2)]) ?
                  wire7 : reg65[(5'h11):(4'hd)]) | reg65[(4'h8):(3'h6)]));
              reg70 <= $unsigned($signed(wire1[(5'h11):(3'h7)]));
            end
          else
            begin
              reg66 <= $signed($signed(($signed(reg64) ?
                  ($signed(reg66) <<< (~|reg66)) : {(~reg66)})));
              reg67 <= wire61;
            end
          reg71 <= reg69[(1'h1):(1'h1)];
          reg72 <= ($unsigned($unsigned($unsigned((reg66 + reg66)))) ?
              $unsigned((reg66 << ({(8'hb2)} ^ (8'ha2)))) : (|($unsigned((reg71 ^~ reg67)) <<< ({wire5} ?
                  wire8 : (+(8'ha6))))));
        end
    end
  assign wire73 = $signed(($unsigned({$unsigned(reg71),
                      (reg72 && (8'ha0))}) | ((~^{wire2, reg68}) ?
                      ($unsigned(wire1) ?
                          wire8[(3'h7):(2'h3)] : wire4[(3'h6):(1'h0)]) : $unsigned((^~reg71)))));
  assign wire74 = ($signed(wire3) ?
                      (($unsigned((wire0 ^ reg69)) >> (8'ha5)) ?
                          (reg72 ?
                              {(reg64 >>> reg67)} : $unsigned((reg68 & wire3))) : wire2[(4'hb):(1'h1)]) : ($unsigned((8'ha9)) | ($unsigned((^~reg65)) ?
                          wire6[(2'h2):(2'h2)] : ((reg63 != reg66) ?
                              (8'hb8) : $unsigned((8'hbc))))));
  always
    @(posedge clk) begin
      reg75 <= {((!$unsigned($unsigned(wire8))) && $unsigned(($unsigned(reg69) - (wire8 >= reg64)))),
          wire0};
    end
  assign wire76 = $signed($signed(wire3[(2'h2):(1'h1)]));
endmodule

module module10
#(parameter param59 = ((((((7'h42) || (8'hba)) ^~ {(8'hb1), (8'h9e)}) == ((8'ha0) + ((8'hb0) ? (8'ha5) : (8'haf)))) ? (8'hbe) : (^((^~(8'hb1)) ? {(8'hab)} : (+(8'hac))))) ? (~&(!(!(7'h42)))) : ((^((~^(8'ha5)) > (~(8'hbf)))) <= (({(8'hb6), (8'ha0)} ? ((8'hb7) << (8'ha5)) : ((7'h41) >= (8'hbc))) ? ((&(8'hb6)) >>> ((8'hbd) || (8'ha6))) : (((8'ha2) >= (8'hb7)) + ((8'hb6) ? (8'hbd) : (8'hbb)))))), 
parameter param60 = param59)
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire12;
  input wire signed [(3'h4):(1'h0)] wire13;
  input wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire47;
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  assign y = {wire58,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire15,
                 wire16,
                 wire47,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg49,
                 (1'h0)};
  assign wire15 = {wire11[(2'h2):(1'h0)],
                      ($signed(((wire13 * wire11) ^ wire11)) ?
                          wire13[(1'h1):(1'h0)] : wire14)};
  assign wire16 = wire14[(3'h5):(1'h0)];
  module17 #() modinst48 (.y(wire47), .wire19(wire14), .wire20(wire12), .wire18(wire15), .wire21(wire13), .clk(clk), .wire22(wire11));
  always
    @(posedge clk) begin
      reg49 <= ($signed(wire16) >= (8'haf));
    end
  assign wire50 = wire11[(3'h5):(2'h3)];
  assign wire51 = (~^wire50[(3'h7):(3'h6)]);
  assign wire52 = {wire51, $signed($signed((!(wire13 ? wire14 : wire11))))};
  assign wire53 = ((8'ha5) ~^ (|$unsigned(($signed(wire11) ?
                      reg49 : (wire13 ? wire14 : wire15)))));
  always
    @(posedge clk) begin
      reg54 <= {$unsigned(wire11)};
      if (($signed(wire50[(4'h8):(1'h0)]) ?
          $signed(wire52) : wire53[(1'h0):(1'h0)]))
        begin
          reg55 <= (!wire15);
          if (reg49)
            begin
              reg56 <= $signed($unsigned({wire53[(3'h5):(2'h3)]}));
              reg57 <= wire14;
            end
          else
            begin
              reg56 <= (~^$unsigned($unsigned((~&$signed(wire12)))));
            end
        end
      else
        begin
          reg55 <= (reg55 >> $signed(reg54[(4'h8):(4'h8)]));
          reg56 <= (~reg56[(1'h0):(1'h0)]);
          reg57 <= (($unsigned(((-(8'hbc)) ?
                  {wire13, wire15} : (reg57 ? wire52 : reg54))) == wire15) ?
              $signed((wire14[(3'h7):(1'h0)] ?
                  $signed($signed(wire12)) : wire11[(1'h1):(1'h0)])) : (~$unsigned($signed((wire53 ?
                  wire13 : wire11)))));
        end
    end
  assign wire58 = $unsigned((^~$signed(((wire50 ?
                      wire53 : wire51) >>> ((8'ha7) ? (8'ha9) : wire16)))));
endmodule

module module17
#(parameter param46 = (~^{(~&(8'hb8)), (((!(8'hac)) ? (^(8'haa)) : (-(8'hbf))) ? (+(+(8'hbc))) : (~&(~|(8'ha3))))}))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire signed [(3'h4):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire23;
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire23,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = {wire18[(1'h0):(1'h0)], $signed(wire21[(2'h3):(1'h0)])};
  always
    @(posedge clk) begin
      reg24 <= $signed(wire21[(2'h2):(1'h0)]);
      if ({$signed($signed($signed($unsigned(reg24))))})
        begin
          if ({wire20, reg24[(4'hb):(1'h0)]})
            begin
              reg25 <= $signed((wire23[(1'h0):(1'h0)] ?
                  $unsigned((reg24[(4'hc):(4'ha)] ?
                      (8'haa) : wire20)) : reg24));
              reg26 <= (((((-wire21) ^ wire19) ^ wire19) ?
                  $unsigned($unsigned((wire21 != wire20))) : wire23[(3'h6):(3'h4)]) == ({((wire21 > reg24) ?
                          $signed((8'h9f)) : (8'haa)),
                      ($unsigned((8'hb3)) ? (+wire22) : $signed(wire19))} ?
                  (+(8'hae)) : (~|wire22)));
              reg27 <= (~^(reg25[(2'h3):(1'h0)] & $signed(wire23[(4'hc):(4'ha)])));
            end
          else
            begin
              reg25 <= {(-(((wire22 ? wire18 : wire23) ?
                          reg24[(3'h7):(1'h1)] : (wire21 ? reg26 : wire23)) ?
                      (8'hb8) : (((8'hbf) <= wire21) == ((8'ha6) ?
                          wire22 : wire20))))};
              reg26 <= ((~$signed(($signed(reg25) & $unsigned(reg27)))) ~^ {((wire23[(3'h4):(2'h3)] & wire23) && (-$signed((8'hae)))),
                  wire22[(1'h0):(1'h0)]});
            end
          if (($signed($signed($signed((^~wire19)))) ?
              ((($signed(reg25) ~^ $signed((8'ha0))) <<< (8'hb2)) >> $signed((~{reg26,
                  wire18}))) : (8'hb4)))
            begin
              reg28 <= {(($unsigned(wire21) ~^ (^{(7'h40)})) >= (8'haa))};
              reg29 <= (reg28 ?
                  $signed(wire19) : ((^~$signed((8'hbb))) ?
                      (wire18 <<< $unsigned(((8'hac) < wire23))) : ((|$unsigned(reg27)) ?
                          (~$unsigned(reg27)) : ($unsigned(reg28) < $signed((7'h42))))));
            end
          else
            begin
              reg28 <= ($signed(wire23[(3'h5):(2'h3)]) - $unsigned($signed(($unsigned(wire21) || (8'hb0)))));
              reg29 <= $unsigned((8'h9c));
              reg30 <= $unsigned({$unsigned($unsigned((wire20 ?
                      reg27 : reg29))),
                  (8'ha1)});
            end
          reg31 <= $signed($signed($signed($signed(reg26[(4'ha):(1'h0)]))));
        end
      else
        begin
          if ($unsigned(((reg29[(2'h3):(1'h1)] ?
                  (~|(reg26 >= reg25)) : (!reg25[(3'h5):(2'h2)])) ?
              (((wire19 ? wire18 : wire19) ?
                      $unsigned(reg25) : (wire23 * (8'h9c))) ?
                  $signed($unsigned(reg26)) : {reg26}) : $unsigned((reg29[(4'h9):(3'h4)] ?
                  reg30 : (8'hbf))))))
            begin
              reg25 <= $signed($unsigned(reg25));
              reg26 <= $signed({$unsigned(($signed((8'hbb)) ?
                      (reg26 - reg25) : (~reg29)))});
              reg27 <= (^(~((-$unsigned((8'hae))) ?
                  (reg28[(2'h2):(1'h0)] ?
                      $signed(reg29) : $signed(wire18)) : (+$signed(wire19)))));
              reg28 <= ({reg29[(1'h1):(1'h0)], (|reg24)} ?
                  ($unsigned(reg25[(3'h6):(2'h2)]) ?
                      {{$unsigned(reg25), $signed((8'ha4))},
                          wire20} : wire18) : wire19[(1'h1):(1'h1)]);
            end
          else
            begin
              reg25 <= reg24[(3'h5):(3'h5)];
              reg26 <= ({$unsigned((+(reg31 ?
                      reg28 : wire23)))} ^ {wire22[(1'h1):(1'h0)],
                  (wire22 && (reg29[(2'h3):(2'h3)] ? (&(8'ha4)) : (~&reg25)))});
            end
          reg29 <= $signed($unsigned((({(8'ha9), reg24} ?
                  $signed((8'ha2)) : reg31) ?
              (&{reg27, (8'hb5)}) : wire21[(2'h3):(2'h3)])));
          reg30 <= ({(~reg28)} + reg24[(4'hc):(4'hb)]);
        end
      reg32 <= ((|(~|(wire19[(3'h4):(1'h1)] && (wire23 ^ reg30)))) ?
          (wire18 ~^ wire19) : ($unsigned({$unsigned(reg30),
              $unsigned(wire21)}) >> $signed(($unsigned(reg31) <= (8'hb6)))));
      reg33 <= reg30;
    end
  assign wire34 = reg24;
  assign wire35 = ((~|reg27[(2'h2):(2'h2)]) ^~ $unsigned({($signed(wire20) ?
                          wire34 : (~|reg25)),
                      $unsigned((!reg30))}));
  assign wire36 = $unsigned((($unsigned((~^reg26)) ?
                          (wire34 ? (!wire20) : wire34) : reg24) ?
                      $signed($unsigned(reg28)) : reg25));
  assign wire37 = $signed({(~|$unsigned(wire23))});
  assign wire38 = (wire21[(1'h1):(1'h1)] ?
                      (!wire20) : $signed($signed(((reg31 - wire20) == (+reg27)))));
  assign wire39 = reg32;
  assign wire40 = wire39;
  assign wire41 = $signed((wire36[(1'h0):(1'h0)] ?
                      (((~|wire22) ?
                          $signed(reg32) : wire36) * wire37) : (|reg28[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg42 <= (reg26[(4'ha):(3'h5)] * $signed($signed((~|{wire40}))));
      reg43 <= (&wire39[(1'h1):(1'h1)]);
      reg44 <= reg42;
      reg45 <= $signed(((~&$signed($unsigned(reg28))) << (^~(~&(wire39 + wire35)))));
    end
endmodule
