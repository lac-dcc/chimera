module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire73;
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire75,
                 wire4,
                 wire5,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire46,
                 wire73,
                 reg45,
                 reg44,
                 reg35,
                 reg34,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = {wire1[(4'hf):(4'h8)]};
  assign wire5 = wire1[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg6 <= wire5;
      reg7 <= {((($signed((8'hb5)) + reg6[(3'h6):(3'h4)]) <= ((^wire3) ?
              $signed(wire0) : $signed(wire0))) ^ wire5),
          $signed(wire1[(4'hb):(1'h0)])};
      reg8 <= ($unsigned($unsigned(((~^reg6) ~^ (wire2 ?
          wire3 : wire4)))) >= (reg7[(4'he):(3'h5)] ^ {wire5[(3'h4):(2'h3)],
          $unsigned({(7'h42), wire4})}));
    end
  assign wire9 = ($signed($unsigned({$unsigned(wire4),
                     $unsigned(wire3)})) * ($unsigned((~$signed((8'hb9)))) * (^$signed(wire3[(4'hb):(4'h8)]))));
  assign wire10 = {wire4};
  assign wire11 = {reg7[(4'he):(1'h1)]};
  assign wire12 = $unsigned(((reg8 ?
                          $unsigned($signed((8'h9d))) : ({wire4} <<< wire9)) ?
                      (({reg6, reg6} || wire3) ?
                          $unsigned(reg6) : $signed((wire11 ?
                              wire10 : wire5))) : (-(8'haf))));
  always
    @(posedge clk) begin
      if ((|((wire10[(4'h8):(3'h6)] ?
              (((8'hb6) + (8'h9e)) << (reg8 ^~ wire10)) : ((8'hab) > $signed(wire3))) ?
          wire9[(3'h6):(3'h5)] : $signed($unsigned({reg7, wire9})))))
        begin
          reg13 <= ((reg7 ?
              (8'ha5) : (|wire3[(4'ha):(4'ha)])) < ($signed(reg7) ?
              wire11 : wire1));
          reg14 <= wire0;
          reg15 <= wire1;
        end
      else
        begin
          reg13 <= (^$unsigned($signed(reg13)));
          reg14 <= wire3;
          if (wire10)
            begin
              reg15 <= $signed($signed((({reg13} | wire4) ?
                  {$unsigned(reg14), wire10} : $signed((wire5 || wire0)))));
            end
          else
            begin
              reg15 <= (~|reg6[(3'h6):(1'h0)]);
              reg16 <= ((7'h42) ? reg15 : reg6[(2'h2):(1'h1)]);
              reg17 <= $signed(($unsigned(wire9) ?
                  $signed($unsigned($signed(reg14))) : wire2));
              reg18 <= reg6[(3'h5):(2'h2)];
            end
          if ((reg13[(4'h9):(1'h1)] ? reg14 : wire4[(4'he):(4'hb)]))
            begin
              reg19 <= reg16;
              reg20 <= reg16;
              reg21 <= ({wire4} ?
                  wire3[(4'ha):(4'h9)] : ((((|wire9) ? (8'hbf) : (^(8'ha5))) ?
                      $unsigned((wire11 ?
                          wire12 : reg13)) : (wire10 ^~ wire0)) > ($unsigned((~&reg14)) || wire10[(3'h6):(3'h6)])));
              reg22 <= $unsigned($signed(({$unsigned(wire1)} ?
                  {(+reg19), (reg20 ? reg6 : reg6)} : wire9)));
              reg23 <= (-(~^(wire12 ~^ {(~^reg18)})));
            end
          else
            begin
              reg19 <= reg19;
              reg20 <= (reg16 < (~|reg13));
              reg21 <= ($signed(wire9) >>> {(&$signed(wire1)),
                  reg7[(1'h0):(1'h0)]});
            end
          reg24 <= ({reg8} > (&(^~$signed($unsigned(reg16)))));
        end
      reg25 <= $unsigned(wire3[(4'hb):(2'h2)]);
      if ($signed(((reg14 || (wire12 ~^ (reg21 ?
          reg17 : reg25))) == ({(reg6 + reg7), reg13[(4'hb):(4'ha)]} ?
          ($signed(reg14) << (~wire3)) : $signed(((8'h9f) < reg22))))))
        begin
          reg26 <= ($unsigned(wire0[(4'h9):(2'h3)]) * wire5);
          reg27 <= $unsigned(reg13);
          reg28 <= wire10[(4'h8):(2'h2)];
          reg29 <= ($unsigned($unsigned($signed((-(8'hbf))))) ^~ $unsigned(({(|wire9),
              $signed(wire3)} != {reg20, $signed(wire5)})));
          if ((((($signed((8'hac)) ?
                  (^~wire5) : wire1[(4'he):(3'h6)]) > reg14) ?
              $unsigned(wire9[(1'h1):(1'h1)]) : ((((8'ha3) ?
                      reg20 : reg22) ^~ $unsigned(reg15)) ?
                  ((!wire3) | wire9[(4'h9):(3'h6)]) : reg20)) && $signed({reg26[(2'h2):(1'h1)]})))
            begin
              reg30 <= reg28[(4'he):(4'hb)];
              reg31 <= $signed(wire10);
              reg32 <= wire12;
            end
          else
            begin
              reg30 <= {(&((-{reg28}) ? $unsigned(reg24) : (^{reg24}))),
                  (reg21[(4'hc):(4'h8)] ?
                      (|$signed($signed(reg24))) : (($unsigned(reg31) || (wire4 >>> (8'hb7))) ?
                          reg16 : (&((8'hba) > reg25))))};
              reg31 <= {wire9};
              reg32 <= {$unsigned((($signed((8'hba)) ?
                      (~wire1) : (~(8'ha9))) == (8'ha0)))};
              reg33 <= (wire11[(1'h1):(1'h1)] != (!(^~{reg30,
                  (reg26 ? reg19 : reg25)})));
            end
        end
      else
        begin
          reg26 <= ((^((~|{wire0, (8'hba)}) || wire4[(3'h5):(3'h5)])) ?
              reg20 : reg13[(2'h2):(2'h2)]);
          reg27 <= $unsigned(((((~|(8'hb4)) ? (7'h41) : reg26) ?
                  (-(reg29 ? reg6 : reg32)) : $unsigned(reg23[(4'hf):(1'h1)])) ?
              ((8'hb5) != reg22[(4'ha):(4'h8)]) : reg29[(3'h5):(2'h2)]));
        end
      reg34 <= (wire12 || reg24);
      reg35 <= ((~reg26) | {$signed(wire11[(1'h1):(1'h1)]),
          (|(~|{wire12, (8'hae)}))});
    end
  assign wire36 = reg19;
  assign wire37 = $unsigned((($unsigned(reg14) ?
                      ($signed(wire4) ?
                          (reg25 ?
                              wire9 : reg15) : $signed(wire3)) : wire11[(2'h2):(1'h0)]) & reg29));
  assign wire38 = (8'hb3);
  assign wire39 = $unsigned(wire1);
  assign wire40 = wire4[(4'h8):(1'h0)];
  assign wire41 = reg7;
  assign wire42 = wire40;
  assign wire43 = (reg27[(3'h6):(1'h0)] - {({(8'ha5),
                          $unsigned(reg14)} | ((|reg29) ^ reg25[(2'h3):(2'h2)])),
                      $unsigned(reg14[(1'h1):(1'h1)])});
  always
    @(posedge clk) begin
      reg44 <= (8'ha0);
      reg45 <= (reg20 ?
          $unsigned((((^~(8'h9e)) ? reg35 : wire12) <= (reg34[(3'h7):(3'h5)] ?
              $unsigned((8'hbc)) : ((8'hba) ~^ reg16)))) : ((($signed(wire38) ?
              (reg8 ? (8'ha7) : wire38) : $unsigned(wire41)) * (wire42 ?
              reg8 : wire2[(1'h1):(1'h1)])) != (~^{$unsigned((8'hb4))})));
    end
  assign wire46 = $unsigned((~|reg26[(3'h4):(3'h4)]));
  module47 #() modinst74 (wire73, clk, reg15, wire36, reg34, reg32, reg6);
  assign wire75 = ($signed(($signed(reg19[(4'h9):(3'h4)]) > $unsigned(wire41))) | ((8'haa) >>> (((8'hbf) ?
                          {wire12} : $unsigned(reg25)) ?
                      $unsigned((reg17 ? wire9 : reg19)) : {(wire36 ?
                              wire4 : reg26)})));
endmodule

module module47
#(parameter param72 = (~((^~(((8'hba) ^~ (8'haa)) ? ((8'ha9) ? (8'hb0) : (8'hb1)) : {(8'haf), (8'ha8)})) ? ((8'hab) ? (8'hbb) : (8'hb6)) : (+(((8'hb2) ^ (8'hbd)) + ((8'hbb) ? (8'ha7) : (8'hbc)))))))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire52;
  input wire [(4'he):(1'h0)] wire51;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire [(4'hc):(1'h0)] wire49;
  input wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire53 = wire51[(4'he):(4'ha)];
  assign wire54 = $signed(wire48[(3'h6):(3'h6)]);
  assign wire55 = wire52;
  assign wire56 = (&(|((wire55[(5'h11):(1'h0)] != ((8'had) && wire52)) | (wire48 ?
                      $signed(wire50) : $unsigned(wire53)))));
  assign wire57 = (!$signed((8'hb6)));
  assign wire58 = wire50[(1'h0):(1'h0)];
  assign wire59 = (^$unsigned((((wire53 < wire53) ?
                          (wire54 <<< wire49) : (wire48 ? wire53 : (8'ha3))) ?
                      wire57 : $unsigned((wire48 >> wire50)))));
  assign wire60 = wire58[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      if ($unsigned(({(wire50 - {wire56, wire60})} ?
          (^~wire59) : ({(~wire57), (-wire54)} ?
              $unsigned((!wire56)) : wire48))))
        begin
          reg61 <= {$unsigned((~^$unsigned((wire56 ? wire50 : wire59)))),
              wire55};
        end
      else
        begin
          reg61 <= {wire57, (~$signed(wire59))};
          reg62 <= wire55;
          reg63 <= reg61;
          if ($signed((~(~|($unsigned(wire59) ?
              (~|wire60) : ((8'ha7) == wire56))))))
            begin
              reg64 <= $unsigned($signed({$unsigned((wire53 ?
                      (8'ha7) : wire60))}));
              reg65 <= wire60;
              reg66 <= ($signed(((|wire51) > $unsigned($unsigned(wire49)))) >>> wire60[(2'h2):(1'h1)]);
            end
          else
            begin
              reg64 <= $signed($signed($unsigned(wire57[(3'h6):(1'h0)])));
              reg65 <= ((&reg62) ?
                  reg66[(4'he):(3'h6)] : ((((~&(8'ha1)) ^ (|wire48)) ?
                          reg65[(5'h11):(4'hf)] : (wire52[(1'h1):(1'h0)] >>> (wire59 >>> wire55))) ?
                      reg63[(4'h8):(2'h2)] : {$unsigned($signed(reg65))}));
              reg66 <= $unsigned(wire50[(1'h0):(1'h0)]);
              reg67 <= $unsigned(($signed($unsigned({reg65, wire55})) ?
                  (~^$unsigned((reg61 ?
                      wire51 : wire55))) : $unsigned({(wire58 | wire52)})));
            end
        end
      reg68 <= (wire59 ? (^~(!(^~$unsigned((8'h9f))))) : reg64[(2'h3):(1'h0)]);
      reg69 <= wire59[(4'h8):(3'h4)];
    end
  assign wire70 = ($signed((reg61 ?
                          wire49[(4'hc):(3'h4)] : ((reg63 ?
                              reg61 : reg67) ^ (reg69 ? wire59 : reg65)))) ?
                      $unsigned(reg68[(3'h7):(3'h4)]) : {((~|$unsigned(wire60)) ?
                              reg67[(2'h3):(1'h1)] : {(wire59 << wire59),
                                  (~reg67)})});
  assign wire71 = (wire52 ?
                      ((((~&wire58) ?
                          (wire59 || (8'ha3)) : (!reg66)) + wire48) ~^ (~|((8'hb4) ^~ $signed(wire49)))) : wire60[(2'h3):(2'h3)]);
endmodule
