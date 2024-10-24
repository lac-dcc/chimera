module top
#(parameter param62 = (-{(-(~|(-(8'hbb)))), (((&(8'hbc)) << ((8'h9f) ? (8'hbc) : (8'ha9))) & {((8'hab) && (8'hab)), (&(8'hb7))})}), 
parameter param63 = ((((8'hba) * ((~^(8'hbe)) ? {param62, (8'hb0)} : (~param62))) | ((~(~|param62)) ? param62 : param62)) ^~ (param62 - param62)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire20,
                 wire19,
                 wire5,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned((~wire0)));
  always
    @(posedge clk) begin
      if ((($signed((~(&wire1))) <= $signed((!(~|wire0)))) ?
          {$signed($signed(wire3))} : ($unsigned((wire2 || $unsigned(wire3))) | (((!wire5) > (^wire2)) - ((wire2 << (8'ha6)) == ((8'ha1) ?
              wire1 : wire2))))))
        begin
          if ((|(wire1[(3'h7):(2'h3)] ?
              $signed($unsigned(((8'h9c) ?
                  wire4 : wire4))) : (($unsigned(wire3) ?
                      wire5[(3'h6):(1'h0)] : wire3[(2'h3):(2'h2)]) ?
                  $unsigned(wire5[(1'h0):(1'h0)]) : ((wire5 ? wire2 : wire5) ?
                      (wire4 ? wire0 : wire3) : wire5[(3'h6):(3'h5)])))))
            begin
              reg6 <= (^~((8'haf) || wire1));
            end
          else
            begin
              reg6 <= ((($signed((wire2 ? wire3 : wire2)) || ((wire3 ?
                      reg6 : wire0) >= wire2)) ^~ reg6[(2'h2):(1'h1)]) ?
                  {wire2[(3'h5):(2'h2)],
                      (~(((8'hbe) ? (8'hb9) : (8'h9e)) ?
                          (^reg6) : $unsigned(wire3)))} : wire3[(3'h4):(2'h3)]);
              reg7 <= $signed((^wire2));
            end
          reg8 <= wire0;
          reg9 <= reg6[(2'h3):(2'h3)];
          if ((wire1 ~^ {{reg7[(2'h2):(1'h1)]}, (!(8'ha6))}))
            begin
              reg10 <= (+reg6);
              reg11 <= wire1[(1'h1):(1'h1)];
              reg12 <= ({$signed($signed(reg11))} ?
                  (reg10 ?
                      (((^~(8'hb0)) ~^ reg9) ?
                          wire4 : $unsigned({wire4})) : $signed(reg6)) : (^~(wire3 == {(wire1 ?
                          wire5 : reg9)})));
              reg13 <= (((~^reg8) ?
                  {$signed((reg6 ^ (7'h42))),
                      reg7} : wire3[(2'h3):(2'h3)]) >= reg12);
              reg14 <= reg10[(2'h2):(1'h1)];
            end
          else
            begin
              reg10 <= ((wire5 ?
                  ((reg7 ?
                      reg11 : reg12) || $unsigned((reg8 ~^ reg7))) : $signed($unsigned(reg9[(4'he):(2'h2)]))) ^ wire5[(3'h4):(2'h3)]);
              reg11 <= ($signed($signed({{wire1}, (wire2 << reg11)})) ?
                  reg9[(4'h9):(3'h7)] : {wire4[(4'hf):(3'h6)]});
              reg12 <= {$unsigned((($signed(reg14) < (wire5 == reg7)) << ($signed(wire3) >>> (^~reg11)))),
                  (&(|wire3))};
              reg13 <= $signed(reg11[(4'h8):(2'h3)]);
              reg14 <= $unsigned($signed(reg7[(4'ha):(2'h3)]));
            end
          reg15 <= {(($unsigned((~reg12)) || ((&reg10) << (wire0 >>> reg14))) != reg7[(4'ha):(4'ha)]),
              $signed(reg8)};
        end
      else
        begin
          if ((!(wire2 << reg15)))
            begin
              reg6 <= {(8'hb0)};
              reg7 <= reg9[(5'h10):(1'h0)];
              reg8 <= (^~($unsigned($signed(reg12)) ?
                  ((~^$signed(wire2)) > ($unsigned(reg11) <<< ((7'h42) ^ (8'h9c)))) : reg7[(4'ha):(4'ha)]));
              reg9 <= ((+reg7[(2'h2):(2'h2)]) ?
                  (8'ha8) : $unsigned((~^reg8[(3'h7):(1'h1)])));
            end
          else
            begin
              reg6 <= (8'hbc);
              reg7 <= (wire2 ?
                  $unsigned(($signed($signed(wire2)) > ($signed(reg10) << $unsigned(wire1)))) : (|$unsigned(wire4)));
              reg8 <= reg15;
            end
          reg10 <= (({(!(8'ha3))} && $unsigned(reg15[(3'h6):(2'h2)])) ?
              {(~|reg9),
                  ($signed($unsigned(reg11)) <<< reg11)} : {$signed((wire1 >>> (|reg11)))});
          reg11 <= ((^$unsigned((((8'hbc) ?
              wire3 : reg6) - reg15[(2'h3):(2'h2)]))) & ((((+(7'h42)) ?
                  wire3[(4'h8):(2'h2)] : $unsigned(reg9)) ^ ({(8'ha3)} ^ $signed(reg12))) ?
              ($unsigned(((8'ha6) <= reg10)) ?
                  reg6 : $unsigned(reg12)) : ($signed($unsigned(wire3)) ?
                  (reg7[(3'h5):(2'h2)] & $signed(reg13)) : ($unsigned(reg14) ~^ {wire0,
                      wire2}))));
        end
      reg16 <= reg7[(4'ha):(2'h3)];
      reg17 <= reg14[(4'h9):(3'h4)];
      reg18 <= wire3[(4'ha):(2'h3)];
    end
  assign wire19 = ($unsigned($unsigned(((~reg11) ?
                      {reg13, wire3} : $unsigned(wire3)))) ^ wire4);
  assign wire20 = (-{reg16[(2'h3):(1'h0)]});
  module21 #() modinst56 (wire55, clk, reg12, reg15, reg10, reg11);
  assign wire57 = (($signed((8'hbb)) ?
                      (|$signed($unsigned(wire20))) : (|((^~reg15) || (~wire0)))) || $unsigned($signed(wire0[(2'h3):(2'h2)])));
  assign wire58 = $unsigned(reg17[(1'h0):(1'h0)]);
  assign wire59 = ($signed(wire55[(1'h0):(1'h0)]) ^~ wire0);
  assign wire60 = $signed((reg12 > {$unsigned(wire4[(1'h1):(1'h0)]),
                      reg18[(4'hf):(3'h7)]}));
  assign wire61 = wire55[(3'h4):(1'h0)];
endmodule

module module21  (y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire25;
  input wire [(4'h8):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire23;
  input wire [(4'ha):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire48;
  assign y = {wire54, wire53, wire52, wire51, wire50, wire48, (1'h0)};
  module26 #() modinst49 (.wire27(wire22), .y(wire48), .clk(clk), .wire28(wire25), .wire30(wire23), .wire29(wire24));
  assign wire50 = (!(({$unsigned(wire23)} ^~ $signed(wire22)) ?
                      (wire22 ^ (^(wire23 ?
                          wire23 : (7'h43)))) : $signed(wire23[(3'h4):(1'h1)])));
  assign wire51 = {wire24[(4'h8):(1'h0)]};
  assign wire52 = ({wire23,
                      {(!$signed(wire48)),
                          (wire48[(4'hc):(1'h1)] ?
                              (wire51 ^ wire24) : wire25)}} >>> (+($signed({wire48}) <<< {(wire50 + wire23),
                      {wire22}})));
  assign wire53 = $signed(((^{$signed(wire51)}) ?
                      ((8'h9f) == (-wire24[(1'h1):(1'h0)])) : wire23));
  assign wire54 = $signed(((((wire53 == wire22) <= (+wire52)) ~^ wire50) == $signed((^(-wire22)))));
endmodule

module module26
#(parameter param47 = (^((^~(-(7'h43))) - {(&((8'hb5) < (8'h9f))), (~((8'hbf) ? (8'hb8) : (8'hb7)))})))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire30;
  input wire [(3'h7):(1'h0)] wire29;
  input wire [(3'h5):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire31;
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  assign y = {wire46,
                 wire41,
                 wire40,
                 wire39,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire31,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg38,
                 reg37,
                 reg32,
                 (1'h0)};
  assign wire31 = $signed((~$signed((~&$unsigned(wire27)))));
  always
    @(posedge clk) begin
      reg32 <= ({wire29[(3'h6):(2'h2)]} ?
          $unsigned($unsigned((wire27 + $signed(wire27)))) : $unsigned(((wire28 << (~^wire27)) ?
              (8'hbd) : wire27[(4'ha):(4'h9)])));
    end
  assign wire33 = $signed($signed($unsigned((^~wire27))));
  assign wire34 = (wire29[(3'h4):(1'h0)] || wire30);
  assign wire35 = wire30;
  assign wire36 = reg32[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg37 <= $signed($signed((8'hb0)));
      reg38 <= (^~$unsigned(((^reg32) ?
          (~^{wire27, reg37}) : $unsigned($signed(wire28)))));
    end
  assign wire39 = {(wire34 ? $unsigned(wire27) : (+{(|(8'hbd))})),
                      $unsigned((($signed(wire27) ^ (wire28 < reg32)) ?
                          (~$unsigned((8'haf))) : $signed($unsigned(reg37))))};
  assign wire40 = wire27[(4'h9):(1'h0)];
  assign wire41 = $unsigned(reg37);
  always
    @(posedge clk) begin
      reg42 <= wire41[(1'h1):(1'h0)];
      reg43 <= ($unsigned((wire39 ?
          $unsigned($unsigned(wire40)) : reg38)) != {wire27});
      reg44 <= (!(-(({reg38, wire40} ^ (wire28 ? (8'hb6) : wire33)) ?
          $signed((~&(7'h40))) : (((8'hb5) ? wire33 : reg38) & (~^reg42)))));
      reg45 <= $unsigned(wire28[(2'h2):(1'h1)]);
    end
  assign wire46 = $signed({(^~$unsigned((reg45 || wire40)))});
endmodule
