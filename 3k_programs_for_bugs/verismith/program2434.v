module top
#(parameter param77 = (!((((&(8'hbe)) - ((8'hb0) > (8'hba))) ? (((7'h42) && (8'ha6)) ? ((8'hbe) ? (8'hb8) : (8'hb2)) : (8'ha0)) : ((8'hb7) ? ((8'ha7) ^~ (8'hba)) : ((8'ha6) ? (7'h42) : (8'hbc)))) ? ((^((8'h9c) ? (8'had) : (8'ha6))) ? (((8'hb6) || (8'hbe)) ? ((7'h40) ? (8'hb1) : (8'h9e)) : ((8'hb4) ? (8'hb3) : (8'ha9))) : (((8'hb5) != (8'h9e)) << ((8'h9e) <= (8'had)))) : (^~(7'h41)))), 
parameter param78 = ((8'hb6) ? ((((param77 | param77) ? param77 : (param77 >= param77)) ? ({param77, (8'ha6)} ? ((8'hbf) < param77) : {param77}) : param77) << {((param77 ? param77 : (8'ha6)) != {(8'ha0)}), (^(^~param77))}) : (({(|param77)} ? (param77 ? param77 : (~^param77)) : {(param77 ? (7'h42) : param77)}) && (((param77 ? param77 : param77) ? {(7'h43), param77} : (param77 && param77)) >= ((param77 >>> param77) > (!(8'hae)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h22):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire71;
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  assign y = {wire76, wire75, wire74, wire71, reg73, (1'h0)};
  module4 #() modinst72 (.wire6(wire0), .wire8(wire2), .wire5(wire1), .clk(clk), .y(wire71), .wire7(wire3));
  always
    @(posedge clk) begin
      reg73 <= $unsigned(wire71);
    end
  assign wire74 = (+wire2[(3'h7):(2'h2)]);
  assign wire75 = $signed(($signed((wire1[(4'ha):(2'h3)] ?
                          $unsigned(wire0) : (|wire2))) ?
                      (wire3[(4'h9):(4'h9)] ?
                          (wire1[(1'h1):(1'h0)] >>> $unsigned((8'hac))) : reg73) : (-wire0[(4'hf):(4'ha)])));
  assign wire76 = (+$signed(((((8'hb5) ? wire2 : wire1) ?
                      wire3[(1'h0):(1'h0)] : (wire1 ?
                          wire2 : wire74)) ^ {$signed(wire74),
                      $signed(wire71)})));
endmodule

module module4
#(parameter param69 = (((~(((8'hbf) ? (8'hbb) : (7'h44)) ? (^(8'haf)) : {(8'hb5), (7'h44)})) ? (((-(8'hb8)) ^ (&(7'h43))) & ((~(8'ha0)) ? ((8'ha2) ? (7'h42) : (8'hab)) : (&(8'ha0)))) : {(((8'hb2) & (8'h9c)) ? ((8'ha7) ^~ (8'haa)) : (|(8'hbe))), (8'haa)}) ? {{(-{(7'h42), (8'hbb)})}, (~&(8'hb5))} : (~&((-{(8'hbe)}) ? ({(7'h43), (8'ha8)} ? ((8'hab) || (8'haa)) : ((8'hac) ? (8'hb5) : (8'h9e))) : (+((8'haf) << (8'hbf)))))), 
parameter param70 = ((((((8'ha3) ? param69 : param69) ? param69 : (8'h9f)) ? ((param69 | (8'ha2)) < (param69 ? param69 : param69)) : ({param69} ? (param69 ? param69 : param69) : ((8'ha6) ^ param69))) ? {((param69 & param69) <= (param69 * param69))} : (8'ha6)) ~^ param69))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire5;
  input wire [(5'h13):(1'h0)] wire6;
  input wire [(4'h9):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire64;
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire23,
                 wire24,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire64,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({$signed({$signed((wire5 ? wire8 : (8'hb9))), wire6}),
          wire8[(1'h1):(1'h0)]})
        begin
          reg9 <= ({$unsigned({(wire8 ? wire8 : wire6), $signed((8'hb9))}),
              {wire5[(4'hf):(4'he)],
                  $unsigned((wire5 ^ (8'hbd)))}} << $unsigned({wire6[(5'h13):(5'h13)]}));
          reg10 <= (-$unsigned($signed($unsigned(wire8))));
          if (reg10[(1'h0):(1'h0)])
            begin
              reg11 <= wire7[(1'h1):(1'h0)];
              reg12 <= ({$unsigned((((8'had) ? wire6 : reg11) || {(8'hbe)})),
                      $unsigned($signed(((8'hb8) ? wire6 : reg11)))} ?
                  ($unsigned((wire5[(2'h3):(1'h1)] ?
                      ((8'hbf) && reg11) : $signed(wire6))) << $unsigned(reg10)) : $signed(wire6));
            end
          else
            begin
              reg11 <= $unsigned(({wire8[(3'h4):(1'h1)]} ?
                  wire7 : $unsigned((^reg10[(2'h2):(1'h1)]))));
              reg12 <= wire8[(2'h3):(1'h1)];
              reg13 <= $signed(wire7);
              reg14 <= ({({(wire5 <= reg9),
                      reg13} == $signed((reg9 < reg9)))} >= $unsigned($unsigned((^((8'hb2) ?
                  (8'ha8) : reg11)))));
              reg15 <= (~|($unsigned($signed($unsigned(reg9))) ?
                  $signed(wire5) : reg13[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg9 <= {$signed(wire6[(1'h0):(1'h0)]),
              $signed((reg11[(1'h1):(1'h0)] ? reg12[(5'h12):(4'ha)] : wire6))};
          if ((wire7[(3'h4):(2'h2)] ?
              $unsigned({reg9, wire6}) : reg14[(3'h6):(1'h0)]))
            begin
              reg10 <= (~|(|$unsigned((~&(-reg10)))));
              reg11 <= $unsigned(($unsigned((^~wire6)) ?
                  (wire7 ?
                      $signed($signed(reg13)) : (~^$signed(wire8))) : wire5));
              reg12 <= (^($signed($unsigned(reg9[(1'h1):(1'h0)])) ?
                  ($unsigned(reg13) ?
                      $signed((reg9 ~^ reg10)) : $unsigned((wire8 & (8'ha9)))) : $signed($signed((-wire8)))));
            end
          else
            begin
              reg10 <= $signed($unsigned({$signed(wire8[(4'he):(4'h9)]),
                  ((reg12 ? (8'hb7) : (8'hba)) * (~^wire8))}));
              reg11 <= (|$signed(reg9));
            end
          reg13 <= {$signed({{((8'hac) | (8'h9d))}, (~^reg11)})};
          if (reg13[(3'h7):(3'h6)])
            begin
              reg14 <= ((&(($unsigned(wire8) >>> wire7) - reg13)) ?
                  $signed((8'hbb)) : $unsigned((reg14 < (-(wire6 ?
                      reg14 : (8'hbf))))));
            end
          else
            begin
              reg14 <= (8'ha3);
              reg15 <= reg12;
            end
          reg16 <= ($signed((-$signed((wire7 ? wire5 : reg12)))) ?
              (reg15 ?
                  (((!wire8) >= $signed(wire5)) * $signed({reg15,
                      reg14})) : {$unsigned({reg9, reg14})}) : reg9);
        end
      reg17 <= (8'hb4);
      reg18 <= reg17;
    end
  always
    @(posedge clk) begin
      reg19 <= ($signed($unsigned($unsigned($signed(reg14)))) ?
          reg12[(5'h14):(5'h12)] : ($signed($unsigned((reg9 ?
              wire6 : wire6))) >> ($unsigned((reg18 ?
              wire8 : (8'hb4))) + wire5[(4'hf):(3'h4)])));
      reg20 <= ({(^reg11)} ? $unsigned({reg18}) : $unsigned((&$signed(wire5))));
      reg21 <= (^~(($unsigned(wire8) || $unsigned($signed(reg12))) >> (wire5[(4'hc):(3'h4)] | wire6)));
      reg22 <= (reg18[(3'h4):(2'h2)] ^ $signed($unsigned(reg15)));
    end
  assign wire23 = $signed(($signed(reg19) <= $signed({(wire6 > (8'hb3)),
                      (reg19 ? wire6 : reg11)})));
  assign wire24 = {(reg10[(1'h1):(1'h0)] ?
                          (8'hb3) : {(reg19[(4'hf):(4'he)] ?
                                  (wire7 >= reg20) : (+reg20))}),
                      $signed(((reg10[(1'h1):(1'h0)] ?
                              $unsigned(reg10) : {reg18, reg11}) ?
                          (^$unsigned(reg21)) : ($unsigned((8'hb1)) ?
                              (wire7 ? reg16 : (8'haf)) : (wire23 < reg9))))};
  always
    @(posedge clk) begin
      reg25 <= reg19;
      reg26 <= reg15;
      reg27 <= wire8;
      reg28 <= $unsigned($unsigned(wire8[(2'h3):(2'h2)]));
      reg29 <= $unsigned((reg17[(4'h8):(2'h3)] & ($unsigned(reg9) ?
          {(!wire23)} : ($unsigned((7'h40)) || {wire23, (8'ha7)}))));
    end
  assign wire30 = (~&reg16);
  assign wire31 = ($unsigned(($signed(wire23) < (!reg29))) ?
                      reg16[(1'h1):(1'h1)] : (^~($signed(reg12) >>> wire7)));
  assign wire32 = $signed($unsigned($unsigned((reg17 || (wire8 << reg29)))));
  assign wire33 = (-{(^(8'hb5))});
  module34 #() modinst65 (.clk(clk), .y(wire64), .wire38(reg28), .wire36(reg14), .wire37(reg18), .wire35(wire33));
  assign wire66 = ((wire6 ?
                          $unsigned(((wire7 - reg12) ?
                              ((8'ha9) > wire24) : {wire23})) : {((reg21 ?
                                  wire31 : (8'hbc)) > (reg22 ?
                                  wire64 : wire31)),
                              reg21}) ?
                      (~reg26) : (!(wire23[(1'h1):(1'h0)] ?
                          $unsigned(wire30) : {$unsigned(wire6)})));
  assign wire67 = (((8'hb4) * (wire31 ?
                      {reg27[(3'h5):(2'h2)]} : (-(reg13 || reg20)))) - reg28);
  assign wire68 = $signed(wire5);
endmodule

module module34
#(parameter param62 = {((8'hb5) ? {(((8'hac) ? (7'h43) : (8'h9f)) != ((8'hb1) ^ (7'h40))), ({(8'hba)} * {(8'h9f)})} : ({((8'hb8) | (8'hb3))} >> (^((8'hb1) ? (7'h44) : (8'haa)))))}, 
parameter param63 = (!(((param62 ? (param62 ? param62 : param62) : (param62 ? param62 : param62)) < (!(param62 && param62))) ? (param62 >>> param62) : (|((~^param62) ? ((8'hb4) ? param62 : param62) : (param62 >= param62))))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire38;
  input wire signed [(4'h9):(1'h0)] wire37;
  input wire [(2'h2):(1'h0)] wire36;
  input wire [(4'hf):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire47,
                 wire41,
                 wire40,
                 wire39,
                 reg61,
                 reg50,
                 reg49,
                 reg48,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire39 = (wire38[(4'hd):(4'hb)] ?
                      ($signed((^{wire37,
                          wire36})) ^~ $unsigned($unsigned($unsigned(wire37)))) : (((wire35 < (~^wire38)) <<< ($unsigned(wire37) <<< wire37)) ?
                          (wire35 ? wire38[(4'hb):(2'h2)] : wire38) : wire37));
  assign wire40 = ((($unsigned($unsigned(wire39)) <<< ($signed((8'ha6)) | (wire38 ^~ (7'h42)))) ?
                      wire39[(4'h9):(3'h7)] : ((~|wire38) > (wire36[(1'h0):(1'h0)] ?
                          (+wire37) : (wire35 >= wire37)))) >>> $signed((~^$unsigned((~wire35)))));
  assign wire41 = wire37;
  always
    @(posedge clk) begin
      reg42 <= (-(~|wire39));
      reg43 <= ((!(wire41 && ({wire38} <= $unsigned(wire35)))) - reg42[(2'h3):(2'h3)]);
      reg44 <= $unsigned(wire40);
      reg45 <= (wire39 ?
          $signed($signed($unsigned($signed((8'hb5))))) : ($unsigned(wire37) ^~ $signed(reg44)));
      reg46 <= wire39;
    end
  assign wire47 = (reg45[(3'h5):(2'h2)] | (wire37[(4'h8):(1'h1)] ^ $unsigned(reg45[(3'h4):(2'h2)])));
  always
    @(posedge clk) begin
      reg48 <= $unsigned($signed($unsigned(wire39)));
      reg49 <= wire36[(1'h1):(1'h1)];
      reg50 <= {$unsigned({({wire37, reg45} ? {reg44} : {reg46})})};
    end
  assign wire51 = $signed(wire37[(3'h7):(3'h6)]);
  assign wire52 = ((!wire47[(2'h3):(1'h1)]) ?
                      wire36 : (($signed($signed(wire36)) >> ((reg42 << reg50) || $signed(reg45))) ?
                          $unsigned($unsigned($unsigned(reg48))) : ((wire36[(2'h2):(1'h0)] ?
                                  (reg44 ^~ wire38) : reg44[(1'h1):(1'h0)]) ?
                              reg48 : ($signed(wire40) > $unsigned(reg49)))));
  assign wire53 = {($unsigned(((reg49 ? reg50 : wire51) ?
                              (wire35 > wire39) : (reg48 ? wire51 : wire51))) ?
                          $unsigned(((wire52 - wire38) << (wire39 <<< reg48))) : reg46[(1'h0):(1'h0)]),
                      ((&((reg48 ~^ wire35) ?
                          $unsigned(reg48) : $signed(reg48))) & $signed(wire36[(2'h2):(1'h1)]))};
  assign wire54 = (&$unsigned((($signed(wire51) ?
                      (wire41 ?
                          reg43 : (7'h42)) : wire51[(4'hb):(3'h4)]) < ($signed(reg50) <= (wire52 ?
                      (8'hb9) : reg45)))));
  assign wire55 = $unsigned((reg46 ?
                      (+wire38[(2'h2):(1'h1)]) : (((reg48 > (8'h9f)) << (8'ha3)) ?
                          {(wire41 < wire38), wire51} : {$unsigned((8'ha3))})));
  assign wire56 = ((!(~|$unsigned((reg50 + wire38)))) == (reg46[(3'h6):(1'h0)] <= wire37[(1'h1):(1'h0)]));
  assign wire57 = reg46[(4'h8):(2'h3)];
  assign wire58 = $unsigned(wire39[(4'hf):(1'h1)]);
  assign wire59 = ($unsigned($signed(wire57)) | ({$unsigned((reg49 ?
                          reg45 : wire53))} ^ wire38[(4'hc):(1'h0)]));
  assign wire60 = reg44;
  always
    @(posedge clk) begin
      reg61 <= $signed((&$signed($unsigned($unsigned(wire39)))));
    end
endmodule
