module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire7,
                 wire6,
                 wire5,
                 reg64,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = (wire2 == wire1[(1'h0):(1'h0)]);
  assign wire7 = $signed(({($unsigned(wire0) != (+wire5))} ~^ $signed($unsigned((wire6 >>> wire4)))));
  module8 #() modinst54 (.clk(clk), .wire9(wire1), .wire12(wire5), .wire11(wire7), .y(wire53), .wire10(wire4));
  assign wire55 = {$signed($unsigned((((8'ha9) ? wire4 : wire0) ?
                          wire0 : wire7[(3'h6):(2'h2)]))),
                      $signed(($unsigned((wire2 ? (8'hb4) : (8'hba))) ?
                          wire7 : (wire7 >>> $signed(wire2))))};
  assign wire56 = (($unsigned($signed({(8'hac), wire4})) ?
                          $signed($unsigned((^~wire2))) : wire1[(3'h7):(2'h3)]) ?
                      (^~(~&$unsigned((~|wire3)))) : $unsigned(wire55[(3'h4):(1'h0)]));
  assign wire57 = ({(wire56 ~^ (~|(&wire5)))} ?
                      $signed($unsigned(wire4[(5'h10):(3'h7)])) : wire5[(3'h7):(1'h0)]);
  assign wire58 = $signed((wire5[(1'h0):(1'h0)] ?
                      (!($signed((8'hb6)) ?
                          (wire4 << wire3) : (~^wire6))) : $signed((^~$signed(wire6)))));
  assign wire59 = {$signed($unsigned(wire58))};
  assign wire60 = wire57[(2'h2):(1'h1)];
  assign wire61 = (wire55[(2'h2):(2'h2)] ?
                      wire5[(3'h4):(1'h1)] : (+$unsigned($unsigned($signed(wire1)))));
  assign wire62 = (~&wire59);
  assign wire63 = $unsigned((wire5[(4'hb):(3'h4)] >>> wire5[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg64 <= (-wire0);
    end
endmodule

module module8
#(parameter param51 = (({((~|(8'hba)) ? ((8'had) ? (8'hb3) : (8'hb5)) : (~(8'ha1)))} ? ((((8'ha4) < (8'hb6)) ^ (|(8'ha6))) * {((8'ha6) >= (7'h43)), {(8'hb2), (8'hbc)}}) : ({(|(8'hb7))} ? ({(8'hb3)} && ((8'ha1) ~^ (8'ha3))) : ((~^(8'hb2)) ? (~(8'ha3)) : ((8'hbc) ? (8'ha3) : (8'hbb))))) + (((((8'hbc) ? (8'hbe) : (8'h9d)) ? ((8'hb6) | (8'ha9)) : ((8'ha9) ? (8'hb3) : (8'ha0))) - ((^(8'ha9)) > (^~(8'hb9)))) & ((~^((8'ha5) <<< (8'h9f))) ? (((8'h9d) + (7'h42)) ? (^(8'h9f)) : ((8'ha2) + (8'ha4))) : ({(8'had)} || ((8'hac) ? (8'ha8) : (8'hb8)))))), 
parameter param52 = ((|({(param51 ? param51 : (8'ha9))} ? {(param51 ^ param51)} : ((|param51) ? {param51, (8'h9e)} : (~^param51)))) | ((&{param51, {param51, param51}}) ? (|((param51 ? param51 : param51) ? (param51 ? param51 : param51) : (param51 || param51))) : ((&(param51 ? param51 : param51)) ? param51 : (~|(~^(8'ha3)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire13;
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  assign y = {wire50,
                 wire41,
                 wire40,
                 wire36,
                 wire31,
                 wire30,
                 wire29,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire13,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg14,
                 (1'h0)};
  assign wire13 = ((~(^~($unsigned(wire9) ?
                      (wire11 <<< (8'haf)) : (wire9 ?
                          wire9 : wire11)))) - $unsigned({((wire12 <<< wire12) ?
                          $unsigned(wire12) : (wire11 ^~ (8'h9e)))}));
  always
    @(posedge clk) begin
      reg14 <= $unsigned($unsigned(($signed((wire13 ? wire12 : (8'ha6))) ?
          (|$unsigned(wire11)) : wire11)));
    end
  assign wire15 = reg14;
  assign wire16 = {{($unsigned((|(8'ha8))) <= $unsigned((~|wire10)))},
                      $unsigned(wire11[(2'h3):(1'h1)])};
  assign wire17 = $unsigned($signed((&wire11)));
  assign wire18 = wire11;
  assign wire19 = ({(8'ha3), $unsigned((&(wire15 & reg14)))} ?
                      ((((wire16 >> (8'ha9)) << $signed(wire10)) & ((wire13 >>> wire13) ?
                              wire18 : (wire10 << reg14))) ?
                          reg14[(4'h9):(3'h7)] : (~^((wire12 ^~ (8'hb2)) ?
                              (-wire16) : wire18[(2'h2):(1'h0)]))) : $unsigned($signed($signed(wire16))));
  always
    @(posedge clk) begin
      if (((8'hb6) | (((wire18[(1'h0):(1'h0)] >>> $signed(wire10)) ?
              wire15[(4'hd):(3'h4)] : {wire19}) ?
          (($unsigned(wire16) != $signed((8'hb7))) ?
              wire9[(1'h1):(1'h1)] : (&wire18[(4'hd):(1'h0)])) : (~&$unsigned((~|wire17))))))
        begin
          if ((~|{$unsigned(((wire18 ?
                  wire15 : wire15) & wire17[(5'h11):(4'hd)])),
              reg14}))
            begin
              reg20 <= $signed(wire16[(1'h1):(1'h0)]);
              reg21 <= wire13[(3'h4):(2'h3)];
              reg22 <= $signed(({((wire12 ?
                          reg21 : (8'ha1)) >= wire18[(1'h1):(1'h0)])} ?
                  $signed(wire17) : (~|$signed($unsigned(wire9)))));
            end
          else
            begin
              reg20 <= ((8'ha2) ?
                  (!($signed(reg22) ?
                      $signed(wire9) : {(wire19 ? reg20 : wire18),
                          {reg20}})) : (wire11 ?
                      (-reg20[(1'h0):(1'h0)]) : ($unsigned({wire9,
                          wire11}) ^ ((reg14 ?
                          reg22 : (8'hb1)) | $unsigned(wire12)))));
              reg21 <= $signed($unsigned(wire9[(4'h9):(3'h7)]));
              reg22 <= ({(!{(!reg22)})} <= ($unsigned(wire17[(5'h11):(2'h2)]) ?
                  ({(reg21 || wire12)} ?
                      {wire19[(1'h0):(1'h0)],
                          wire12[(4'hd):(4'h8)]} : ($unsigned(wire10) ?
                          $signed((8'hb8)) : $signed(wire18))) : ({$signed(wire16),
                      {wire10, (8'hb7)}} + (^{wire10}))));
            end
          reg23 <= (((((wire15 >= wire15) ?
                      (wire18 ? wire17 : wire13) : wire18[(4'h9):(3'h6)]) ?
                  ((wire12 ? wire15 : reg21) ?
                      $unsigned(wire16) : reg21) : (+$signed(wire16))) ?
              (-wire13[(2'h3):(1'h1)]) : ({{reg21, wire9}, (|wire18)} ?
                  $unsigned($signed((7'h42))) : wire12[(1'h1):(1'h0)])) != reg21[(4'hc):(3'h4)]);
          reg24 <= (wire9 ?
              (^$unsigned(($unsigned(reg22) >> (reg20 & reg14)))) : wire19);
          if (($unsigned({((^~reg22) + reg21[(4'hc):(4'hb)]),
                  $signed(((7'h42) ? (8'ha6) : (8'hbe)))}) ?
              $unsigned($unsigned(($unsigned((8'hbc)) ?
                  wire17[(4'hc):(2'h2)] : $unsigned(wire10)))) : $unsigned($unsigned($unsigned(reg21[(4'h8):(1'h0)])))))
            begin
              reg25 <= {(($unsigned($unsigned(wire19)) || $unsigned((~^reg24))) <= ((reg24[(1'h0):(1'h0)] ?
                          reg21 : $signed(wire18)) ?
                      reg21[(4'hc):(2'h3)] : reg21))};
            end
          else
            begin
              reg25 <= {reg21};
              reg26 <= (|(&wire10[(4'hc):(1'h1)]));
              reg27 <= wire17;
            end
        end
      else
        begin
          reg20 <= $unsigned((~($signed((wire12 != (8'h9e))) ?
              reg27 : {{wire15}})));
          if (((wire11[(3'h6):(3'h6)] ~^ wire9) ?
              reg23[(3'h5):(2'h3)] : (((((7'h41) + reg23) ?
                  (wire11 > (8'hb1)) : {reg25, reg25}) || (wire10 ?
                  ((8'ha4) ? wire18 : reg22) : {wire19,
                      wire13})) && {$signed($unsigned(wire12))})))
            begin
              reg21 <= (reg23[(2'h2):(1'h0)] ~^ ($unsigned(((8'hbc) * ((8'haf) ?
                      wire9 : (8'hb9)))) ?
                  reg23[(3'h5):(3'h4)] : (^~((wire19 > (8'ha4)) & wire12[(4'he):(4'h8)]))));
              reg22 <= reg21[(4'hd):(3'h6)];
              reg23 <= (|(~(~reg20[(4'hc):(2'h2)])));
              reg24 <= wire10;
              reg25 <= wire17[(4'hb):(3'h6)];
            end
          else
            begin
              reg21 <= (~reg22);
            end
          reg26 <= ($unsigned((~reg22)) >> ($signed((7'h40)) ?
              (|wire19[(1'h1):(1'h1)]) : wire10));
          reg27 <= reg22[(2'h2):(2'h2)];
          reg28 <= $signed((8'hbd));
        end
    end
  assign wire29 = wire11[(3'h7):(1'h1)];
  assign wire30 = reg20[(2'h2):(2'h2)];
  assign wire31 = (|wire16);
  always
    @(posedge clk) begin
      reg32 <= $signed($unsigned((+$signed(reg20[(4'he):(4'hd)]))));
      reg33 <= $unsigned(($signed((reg32[(3'h4):(2'h2)] ?
              {wire29, wire30} : reg14[(3'h7):(2'h2)])) ?
          $unsigned((8'hbd)) : (~(&(+wire29)))));
      reg34 <= $unsigned(reg27[(3'h7):(2'h3)]);
      reg35 <= wire29;
    end
  assign wire36 = (reg32[(1'h1):(1'h0)] ? $unsigned(wire9) : reg34);
  always
    @(posedge clk) begin
      reg37 <= $signed(((8'hb2) <= ($unsigned((reg14 ? reg14 : wire31)) ?
          $unsigned($signed(wire11)) : reg23)));
      reg38 <= $signed($signed(reg33));
      reg39 <= ($signed(wire36[(4'hc):(4'hc)]) ?
          {{(~&(8'haf)), $signed($signed((8'hb6)))}} : ((8'ha0) ?
              ($signed((~^(7'h40))) - (wire11[(4'h8):(2'h3)] || (wire30 ?
                  reg34 : wire10))) : reg20));
    end
  assign wire40 = (8'ha0);
  assign wire41 = {$unsigned($signed(reg37[(2'h3):(2'h3)])), $signed({reg38})};
  always
    @(posedge clk) begin
      reg42 <= (~^(wire17 ? reg20 : reg24));
      if (reg38)
        begin
          reg43 <= (8'hba);
          reg44 <= reg21[(4'h9):(2'h3)];
          reg45 <= wire31;
          reg46 <= reg34[(2'h3):(2'h3)];
        end
      else
        begin
          reg43 <= (^wire16);
          reg44 <= wire36[(1'h1):(1'h0)];
          reg45 <= (reg39[(2'h2):(1'h0)] ?
              $unsigned($unsigned(($signed(wire17) ^~ (^wire29)))) : reg44[(1'h1):(1'h1)]);
          reg46 <= $unsigned(wire9);
          reg47 <= ((($unsigned($signed(reg21)) ^ $signed((wire18 ~^ (8'haa)))) ?
                  $signed(({reg27} ?
                      (reg44 <<< reg38) : reg45)) : {(((8'ha2) ^ wire13) * $unsigned(reg27))}) ?
              wire18[(4'h9):(1'h0)] : (($signed(reg45) ?
                  $signed($unsigned(reg46)) : (reg37[(2'h3):(1'h0)] ?
                      {reg46} : $signed(reg46))) << ($signed(wire31[(3'h6):(1'h0)]) - ((+wire9) || $signed(reg33)))));
        end
      reg48 <= (&(-$unsigned({{(8'hbf)}})));
      reg49 <= ($signed($signed(reg38[(2'h2):(1'h0)])) ?
          ($unsigned($unsigned($signed(wire31))) + {{(!wire13)}}) : $signed((^reg39[(1'h0):(1'h0)])));
    end
  assign wire50 = wire17;
endmodule
