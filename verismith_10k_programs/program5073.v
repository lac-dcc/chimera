module top
#(parameter param82 = {((~^((+(8'hba)) ? ((8'ha5) ? (8'hb3) : (8'hb2)) : (+(8'hab)))) ? ((((8'hbf) || (8'ha9)) && ((7'h44) - (8'hac))) ? ((~(8'hb0)) && {(8'had), (8'hb0)}) : (((8'ha5) && (7'h43)) ? (+(8'ha8)) : (!(8'haf)))) : (((^(8'ha7)) + ((8'hb9) ? (8'ha0) : (8'hb3))) ? ({(8'hbe), (8'ha9)} ? ((8'ha9) ? (8'ha3) : (8'hb4)) : ((8'had) ? (8'hbf) : (7'h42))) : (((7'h40) || (8'ha9)) != ((8'h9f) ? (8'hbe) : (7'h41))))), (((+(~^(8'hbe))) ? (&((8'hb8) <= (8'ha6))) : {(~&(8'hb3))}) == (8'h9c))}, 
parameter param83 = ((((8'ha2) ? (param82 << (param82 & param82)) : (^param82)) ? param82 : {param82, (8'hb8)}) >> {{(param82 & (param82 || param82)), param82}}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h264):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire33;
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 wire55,
                 wire37,
                 wire36,
                 wire35,
                 wire5,
                 wire33,
                 reg81,
                 reg80,
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
                 reg66,
                 reg65,
                 reg57,
                 reg54,
                 reg53,
                 reg52,
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
                 (1'h0)};
  assign wire5 = $signed($signed($unsigned($unsigned((wire3 <= (8'hb7))))));
  module6 #() modinst34 (.wire9(wire2), .clk(clk), .y(wire33), .wire10(wire0), .wire11(wire1), .wire7(wire4), .wire8(wire3));
  assign wire35 = {(-((8'ha9) ? wire0[(3'h6):(3'h4)] : $unsigned(wire4))),
                      ($unsigned(wire3[(4'ha):(3'h4)]) ?
                          $signed(wire0[(3'h7):(2'h3)]) : (8'hab))};
  assign wire36 = (8'hba);
  assign wire37 = ($signed(wire3) - $signed((7'h43)));
  always
    @(posedge clk) begin
      reg38 <= $signed(wire1[(4'h8):(3'h4)]);
      if ($signed((((~wire36[(4'he):(3'h7)]) ?
              (wire35 ? {wire35, wire35} : $signed(wire5)) : $signed((7'h41))) ?
          $signed($signed($signed((8'ha7)))) : wire33[(5'h12):(4'hf)])))
        begin
          reg39 <= {(({(8'hba)} ?
                  (wire35 ?
                      ((8'hb0) ? reg38 : wire3) : $signed(wire33)) : (((8'hbc) ?
                          wire0 : reg38) ?
                      $unsigned(wire1) : wire2)) ~^ ({$unsigned(wire36)} * $unsigned((wire2 <= wire3)))),
              $unsigned((~(&(wire5 != (8'ha6)))))};
          reg40 <= (&wire2);
          reg41 <= wire2;
          reg42 <= (wire36 + ({((wire35 ? reg41 : wire36) ?
                      $unsigned((8'hb5)) : (-(8'h9c))),
                  ((wire37 * wire4) ? {(7'h43)} : (~&wire2))} ?
              ($unsigned(reg41) ?
                  reg40[(4'h8):(1'h0)] : $unsigned($signed(wire3))) : ($signed(wire37) ?
                  (reg38 ? wire1 : (+wire4)) : wire37[(2'h3):(2'h2)])));
        end
      else
        begin
          reg39 <= {$signed($signed((~&(wire3 ? reg40 : reg38))))};
          reg40 <= wire3[(4'he):(3'h6)];
          reg41 <= $unsigned(wire3[(3'h6):(3'h5)]);
          if (((&$unsigned((~^(&wire2)))) ?
              $signed(wire1[(4'h9):(3'h5)]) : $unsigned(wire2[(3'h7):(2'h2)])))
            begin
              reg42 <= $signed(($unsigned((~&wire5[(3'h5):(2'h2)])) ?
                  ($unsigned(reg42) ^ {reg38[(2'h2):(1'h1)]}) : ($unsigned($unsigned(wire0)) ?
                      $unsigned($unsigned(wire1)) : reg40)));
              reg43 <= wire3;
              reg44 <= (^~($unsigned(((&wire4) > {reg43,
                  (8'hbf)})) >>> $unsigned(wire35[(4'hc):(4'hc)])));
              reg45 <= (-$unsigned({($unsigned(reg38) ?
                      {(8'h9c)} : $signed(wire37)),
                  wire5}));
              reg46 <= reg39[(3'h5):(2'h3)];
            end
          else
            begin
              reg42 <= $unsigned((wire3[(4'hc):(4'hb)] ?
                  ($unsigned($signed(wire36)) ?
                      {{reg45,
                              wire3}} : wire5[(2'h3):(2'h2)]) : {reg45[(3'h5):(1'h0)]}));
              reg43 <= ({(8'ha3),
                  (($unsigned(reg39) ?
                      (reg42 < reg40) : (|wire33)) == reg39)} || (~&reg41));
            end
          reg47 <= (&reg38[(2'h2):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg48 <= reg40;
      if (reg40)
        begin
          reg49 <= reg45;
        end
      else
        begin
          reg49 <= $unsigned(((reg38[(5'h12):(5'h12)] <<< (~(wire4 ^~ wire36))) ?
              $signed(wire1) : ($unsigned($signed(reg41)) ?
                  (-wire37) : (^~$unsigned(wire4)))));
        end
      reg50 <= ((($unsigned((~&reg42)) >> (-(wire3 << wire5))) <<< (((wire33 ?
              reg39 : wire37) - (wire35 - reg38)) ?
          wire3[(2'h2):(1'h0)] : wire36)) >>> $signed((reg48[(3'h7):(3'h6)] ~^ wire36)));
      reg51 <= ((reg43[(4'h8):(3'h6)] ^~ (^(-((8'haf) + reg42)))) ?
          reg40[(4'h9):(1'h0)] : $unsigned((&$unsigned({reg40, reg47}))));
      if (wire1[(4'he):(4'hc)])
        begin
          reg52 <= $unsigned(wire1);
          reg53 <= wire0[(4'h8):(4'h8)];
          reg54 <= (wire37 | reg53[(4'h9):(2'h2)]);
        end
      else
        begin
          reg52 <= (+((7'h40) >>> $unsigned(reg38)));
          reg53 <= {(reg47 >>> {$signed($unsigned(reg42))}),
              (((8'ha2) == ($unsigned(wire5) ?
                  (reg45 ? reg42 : wire3) : (^reg51))) ^~ {(|(~|wire35))})};
          reg54 <= $unsigned((~^(8'ha0)));
        end
    end
  assign wire55 = reg48[(3'h5):(1'h0)];
  assign wire56 = wire3[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg57 <= (($unsigned((|$unsigned(reg41))) ^~ reg38) >> reg42[(3'h7):(3'h5)]);
    end
  assign wire58 = ((($signed(reg40[(1'h1):(1'h1)]) ?
                          $unsigned((reg57 << wire0)) : (-(8'hbb))) <= (|$signed(wire0))) ?
                      ((~|(~reg43)) ?
                          (&$signed(reg44[(5'h12):(3'h7)])) : $signed((&((8'ha7) >= reg57)))) : $unsigned({(&wire0[(4'hd):(4'ha)])}));
  assign wire59 = (($signed(reg46[(5'h10):(1'h1)]) | $signed(wire0)) > $signed($signed(wire4)));
  assign wire60 = $signed($signed(reg45[(4'h9):(1'h0)]));
  assign wire61 = (|({((|wire56) * (reg53 >>> wire5))} > $signed({wire5})));
  assign wire62 = $signed(reg48[(1'h1):(1'h0)]);
  assign wire63 = wire2;
  assign wire64 = $signed(($unsigned(wire5) ?
                      wire61 : $signed(((|(8'hbf)) <= $unsigned(wire0)))));
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg65 <= (+{reg51,
              $unsigned(((reg48 >>> reg54) << (reg38 ? wire60 : reg44)))});
        end
      else
        begin
          reg65 <= wire59;
          reg66 <= ((+(^$unsigned($signed((8'hb2))))) ^~ $unsigned(wire3[(4'h8):(2'h2)]));
        end
      if ((~^$signed(wire61)))
        begin
          reg67 <= (reg46[(4'h9):(4'h9)] ?
              {$unsigned(({wire1, reg41} ?
                      $signed((8'hb4)) : (~^wire60)))} : ((reg53 == $unsigned(wire60)) ^ ((-(reg47 ?
                  wire5 : wire37)) >>> $signed($signed((8'hac))))));
          if (reg38)
            begin
              reg68 <= (reg48 ?
                  (wire64[(4'hb):(2'h3)] ?
                      reg45[(1'h1):(1'h0)] : (-wire36[(4'h9):(3'h6)])) : (wire0[(4'hc):(4'h8)] ?
                      (^~(^~(+reg50))) : $unsigned(((wire60 ? wire60 : reg49) ?
                          $signed(reg67) : wire63))));
            end
          else
            begin
              reg68 <= wire58[(4'h8):(3'h5)];
              reg69 <= $unsigned(reg47[(1'h0):(1'h0)]);
              reg70 <= (|(({(reg68 - reg42)} == ($unsigned(wire1) >= (|(8'ha1)))) ?
                  ((wire61[(1'h1):(1'h0)] << reg46) ?
                      reg49 : $signed((~reg65))) : ((8'hac) | $signed((8'had)))));
              reg71 <= $signed(($unsigned(wire4[(1'h1):(1'h1)]) >>> (((+reg66) && reg68) ?
                  $unsigned((~&reg53)) : {wire4})));
            end
          reg72 <= (~|reg51);
        end
      else
        begin
          reg67 <= $signed(((-$signed({reg50})) ?
              (($unsigned(wire58) ? wire62[(3'h5):(3'h5)] : reg66) ?
                  (|$unsigned(reg50)) : {(+wire33),
                      $signed(reg45)}) : $unsigned($unsigned(reg50[(2'h2):(1'h0)]))));
          reg68 <= (wire36 ?
              (8'hb1) : ($signed($unsigned($signed(wire63))) ?
                  (&$signed((^~reg65))) : wire37[(2'h3):(2'h2)]));
        end
      if (wire36)
        begin
          reg73 <= reg51[(2'h3):(1'h0)];
        end
      else
        begin
          reg73 <= $unsigned((reg38 == ((((8'h9d) ? reg45 : reg45) ?
              (reg52 ? reg69 : reg54) : (reg57 || reg47)) > ((reg39 ?
                  wire0 : (8'hac)) ?
              $unsigned(reg45) : (wire5 && (8'h9d))))));
        end
    end
  always
    @(posedge clk) begin
      if ((8'ha2))
        begin
          reg74 <= $unsigned({((|$signed((8'hab))) ?
                  reg48 : ({reg44} & ((8'hb0) ? wire33 : wire62)))});
          reg75 <= (^~$unsigned($signed((~^reg70))));
        end
      else
        begin
          reg74 <= $unsigned((^~reg53));
          reg75 <= $unsigned($unsigned($unsigned(($unsigned(reg49) ?
              $signed(reg46) : (~&reg49)))));
          if ($unsigned(({(~&$unsigned(reg51)),
                  (reg72[(3'h6):(2'h3)] ?
                      reg73[(1'h0):(1'h0)] : reg52[(3'h4):(1'h0)])} ?
              reg68 : $unsigned($unsigned(reg67[(4'hd):(1'h1)])))))
            begin
              reg76 <= reg69[(1'h1):(1'h0)];
              reg77 <= {(~|($signed($signed(reg43)) ?
                      $unsigned({wire1}) : ((reg53 ?
                          wire36 : reg65) * (wire62 >> wire2)))),
                  (reg53 + ($signed($unsigned(reg68)) ?
                      $signed($unsigned(wire59)) : {reg45}))};
              reg78 <= ((~$unsigned($unsigned({reg76}))) ?
                  $unsigned($unsigned(($unsigned(wire60) <<< (8'hb3)))) : (&((~^$unsigned(reg70)) ?
                      $signed({wire35}) : $signed($signed((8'hb2))))));
              reg79 <= $unsigned($unsigned({wire60,
                  ({reg78} > wire61[(1'h1):(1'h0)])}));
            end
          else
            begin
              reg76 <= wire61[(2'h2):(1'h1)];
              reg77 <= ($signed((($unsigned(wire58) ?
                      {reg71, reg65} : reg75[(4'hc):(2'h2)]) ?
                  $unsigned((~&(8'ha8))) : $signed((8'hbf)))) ^~ reg42[(2'h3):(1'h0)]);
            end
          reg80 <= reg46;
          reg81 <= $unsigned({(reg47 ?
                  reg44[(3'h7):(3'h5)] : ((wire1 >> reg46) >>> (reg44 ?
                      wire62 : wire61))),
              $signed($unsigned(wire1[(4'hd):(3'h6)]))});
        end
    end
endmodule

module module6
#(parameter param32 = ((({(!(8'hbb))} ? (((8'hac) ? (8'ha8) : (8'hbb)) != ((8'hb1) << (8'ha6))) : (((8'hbd) ? (8'hae) : (8'ha9)) | ((8'h9f) ? (8'had) : (8'ha5)))) ? (((~&(8'hae)) ? (^(8'haf)) : ((8'hb3) ? (7'h42) : (8'hbe))) ? ((~&(8'h9e)) ? (^~(8'ha6)) : ((7'h44) ? (8'hbb) : (8'hac))) : (((8'hb2) <= (8'h9d)) ? ((7'h43) - (8'haf)) : (8'h9c))) : ((((8'hab) ^~ (8'hb8)) ^ ((8'h9f) ? (8'ha5) : (8'hb7))) ? (((8'haf) ? (8'h9c) : (8'ha1)) >= (+(8'ha3))) : (8'hbd))) >= ((+(((7'h43) - (8'haf)) + {(8'hbb)})) ? ((^~(~(8'ha0))) ? ({(8'h9c), (8'hbb)} ? (+(8'hae)) : ((8'hab) * (8'hb6))) : (((8'h9d) ? (8'ha1) : (8'hb5)) & ((8'hbc) && (8'h9d)))) : {((~(8'hb0)) ? {(8'ha7)} : (-(7'h41)))})))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire11;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire13,
                 wire12,
                 reg26,
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
                 (1'h0)};
  assign wire12 = wire9[(4'h8):(3'h6)];
  assign wire13 = {({$signed($unsigned(wire8))} ?
                          $unsigned($unsigned($signed(wire11))) : $unsigned(($signed(wire11) ^~ $unsigned(wire11))))};
  always
    @(posedge clk) begin
      if ({wire12})
        begin
          if (wire13[(3'h5):(2'h2)])
            begin
              reg14 <= {wire10[(3'h5):(2'h2)]};
              reg15 <= ((!wire9) ~^ (~^(~&($signed(wire7) ^ (wire9 ?
                  (7'h42) : reg14)))));
              reg16 <= (!$unsigned((&(7'h41))));
              reg17 <= ((&$unsigned(($signed(reg15) | $unsigned(wire12)))) == $unsigned($unsigned($signed(reg15))));
            end
          else
            begin
              reg14 <= reg15[(1'h0):(1'h0)];
              reg15 <= ({$unsigned(reg15),
                  wire8[(4'ha):(3'h6)]} ~^ (~&$signed({wire7[(3'h7):(3'h5)]})));
              reg16 <= (|wire11[(1'h1):(1'h1)]);
              reg17 <= (($signed(((8'haa) ? wire8 : $signed(wire11))) ?
                      (wire7 ?
                          (((8'h9c) ? (8'hbe) : (8'hbf)) ?
                              ((8'hb8) ? wire10 : reg14) : (reg16 ?
                                  reg14 : wire10)) : (^~(^~wire7))) : ((~^$unsigned(wire10)) ~^ (~&$unsigned((7'h44))))) ?
                  $unsigned((^~(wire7 ?
                      wire10[(2'h3):(1'h1)] : wire7))) : (reg16 ?
                      $signed($signed((~&(8'ha7)))) : (+({wire10, (8'ha5)} ?
                          wire9[(2'h3):(1'h1)] : $signed(wire11)))));
              reg18 <= $signed(wire9[(4'hf):(1'h1)]);
            end
        end
      else
        begin
          reg14 <= (~&$unsigned(({(8'hb5), (^reg17)} ?
              $unsigned((~reg17)) : wire13)));
          reg15 <= (7'h44);
        end
      if ({$signed((8'hbc))})
        begin
          reg19 <= {$signed((wire9[(4'hd):(2'h3)] < {$unsigned(reg17),
                  wire7[(3'h5):(3'h5)]})),
              (~^$signed(((wire11 == reg16) << wire8)))};
        end
      else
        begin
          reg19 <= wire11[(4'h8):(3'h5)];
          reg20 <= $unsigned({(wire12 < $unsigned($unsigned(wire10)))});
          reg21 <= (+$signed({(~$signed(wire12))}));
        end
      reg22 <= (reg20 - $signed((&wire9)));
      reg23 <= (8'hba);
      reg24 <= (8'hb8);
    end
  assign wire25 = wire12;
  always
    @(posedge clk) begin
      reg26 <= $signed($unsigned($unsigned($unsigned((7'h43)))));
    end
  assign wire27 = $unsigned($signed(wire10[(1'h1):(1'h0)]));
  assign wire28 = $signed((|(^(wire7[(4'h9):(4'h8)] < {reg14, reg19}))));
  assign wire29 = ({reg26[(2'h3):(2'h2)],
                      reg18[(3'h5):(3'h4)]} >> $signed((reg23[(1'h1):(1'h1)] ?
                      ({reg21, (8'haa)} | ((8'hbc) ?
                          reg17 : wire7)) : $signed((wire27 && wire11)))));
  assign wire30 = reg20;
  assign wire31 = $signed($signed((~^{(8'h9d), (wire7 == wire30)})));
endmodule
