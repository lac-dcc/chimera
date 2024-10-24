module top
#(parameter param35 = ((+(({(8'hbe)} << ((8'haa) ^ (8'ha0))) <<< {(8'hb8), ((8'ha2) ? (8'hb3) : (8'haf))})) != ({(|((8'ha6) && (8'haa)))} ? (({(7'h40), (8'hb8)} ^~ (|(8'h9c))) ? ((~(8'hbf)) ? {(8'hb5)} : ((8'ha0) ? (8'hb1) : (8'hb9))) : {{(8'h9c)}}) : (8'hbb))), 
parameter param36 = (({({(8'haa), param35} ~^ (8'ha2)), param35} || {{(param35 ? param35 : (8'hba))}}) ? {(-param35)} : (param35 ? (&(-(~^param35))) : (+(^~param35)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
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
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($unsigned($signed(((wire2 ? wire1 : wire3) ?
              $unsigned(wire3) : {wire0, wire3}))) ?
          $signed(wire2[(1'h0):(1'h0)]) : wire1);
      reg5 <= {wire0,
          (~&{((wire1 ? (8'ha0) : wire1) ?
                  (-wire2) : ((8'ha5) ? wire2 : wire1))})};
      reg6 <= ($unsigned(((|reg5[(1'h0):(1'h0)]) <= wire1[(1'h0):(1'h0)])) * $signed($unsigned(reg4[(3'h5):(1'h1)])));
    end
  assign wire7 = reg5;
  assign wire8 = wire2;
  assign wire9 = (!($signed((wire3 | (wire7 ?
                     wire7 : (8'hbf)))) & wire1[(4'h9):(3'h7)]));
  assign wire10 = wire1;
  assign wire11 = $unsigned(reg4[(4'hd):(4'h9)]);
  assign wire12 = $signed(($unsigned((|(-wire7))) << wire9[(2'h3):(2'h3)]));
  assign wire13 = wire8;
  assign wire14 = wire1[(2'h2):(1'h0)];
  assign wire15 = ((+($signed(wire13[(2'h3):(1'h0)]) >>> $signed(reg5))) ?
                      ({(wire14 - $unsigned(wire7)),
                          $unsigned((reg4 << reg5))} || ($signed($unsigned(wire9)) ?
                          (!wire2[(4'h9):(3'h7)]) : (~&(&reg6)))) : $unsigned((~^(~&$signed(wire2)))));
  always
    @(posedge clk) begin
      reg16 <= wire9;
      reg17 <= wire3[(3'h5):(3'h5)];
      if (((wire0 && (((!wire9) ? (wire8 * (8'haf)) : (wire13 - (8'h9f))) ?
              reg4 : wire11)) ?
          wire15 : ({(wire3[(2'h2):(1'h0)] ?
                      wire12[(3'h4):(1'h0)] : {wire8, wire1})} ?
              wire12 : ((((8'h9d) ? wire9 : reg6) ?
                  $signed(reg17) : $signed(wire13)) | (wire14 || reg6)))))
        begin
          reg18 <= ((7'h40) ? wire12 : (-$unsigned(reg6[(3'h5):(3'h5)])));
          reg19 <= ((~&$unsigned(reg17)) ?
              (-$signed(((reg6 << wire13) << reg17[(1'h0):(1'h0)]))) : (&$signed(({reg17,
                      (8'hbc)} ?
                  (reg16 > wire0) : $unsigned(wire10)))));
          if ({$signed(wire13)})
            begin
              reg20 <= ($signed({((!wire7) >= $unsigned(reg18))}) + (wire3 ?
                  ($signed((wire15 < (8'hac))) ?
                      $signed((-wire11)) : {(~^reg18),
                          reg16}) : $unsigned(wire11)));
              reg21 <= $unsigned(wire3[(3'h7):(2'h2)]);
              reg22 <= (8'hbc);
              reg23 <= $signed((((~$unsigned(wire12)) | wire15[(4'h9):(2'h2)]) == (|(8'h9e))));
            end
          else
            begin
              reg20 <= {((($signed(wire0) ^~ {reg5}) ?
                      reg17[(1'h0):(1'h0)] : wire0) - (&((^~reg4) || $unsigned(wire9))))};
              reg21 <= (^(~^{(-reg18[(3'h7):(3'h6)])}));
              reg22 <= $unsigned({{($unsigned(reg4) <<< $signed(reg4)), reg22},
                  $unsigned((&$unsigned(wire13)))});
              reg23 <= wire12;
              reg24 <= (|wire13);
            end
        end
      else
        begin
          reg18 <= wire14;
          reg19 <= ({(((^~reg23) ?
                  $signed(wire11) : (|reg23)) | $signed(reg22))} <= $unsigned({$signed((reg17 && reg23))}));
        end
      reg25 <= reg16[(4'hb):(2'h3)];
      reg26 <= wire9[(2'h3):(2'h2)];
    end
  assign wire27 = ($unsigned(wire13[(2'h3):(2'h3)]) ?
                      wire2[(4'hb):(3'h6)] : (+$unsigned(((wire7 && wire13) <= (reg23 ^~ reg26)))));
  assign wire28 = (+(!(-($signed(reg16) && {(8'hac)}))));
  assign wire29 = (reg26 ?
                      (~|$signed((~&$unsigned(reg4)))) : $unsigned(wire9[(1'h0):(1'h0)]));
  assign wire30 = ($signed(((wire27 <= reg22[(1'h0):(1'h0)]) ^~ ((wire15 ?
                          (8'ha1) : (8'hb2)) & (~^wire2)))) ?
                      (reg22[(2'h2):(2'h2)] ?
                          (reg17 ~^ (8'hac)) : $signed(wire2)) : ((((reg22 * wire11) ?
                                  reg5[(3'h7):(3'h7)] : (|reg4)) ?
                              $signed({wire11}) : $unsigned(wire8[(2'h2):(2'h2)])) ?
                          {reg18} : wire1));
  assign wire31 = ((-$unsigned($signed((~reg16)))) == (~wire7));
  assign wire32 = $unsigned(($signed(((~&(8'ha0)) ?
                          reg18[(4'h9):(3'h6)] : (reg5 == wire9))) ?
                      ((&$signed((8'hba))) ?
                          reg4 : $unsigned(((8'ha3) != (8'hab)))) : (8'hab)));
  assign wire33 = {{(8'ha8), (^$signed($unsigned(wire32)))},
                      (($signed((reg25 || reg26)) << (~(wire10 ?
                              reg16 : wire3))) ?
                          wire29[(1'h0):(1'h0)] : (wire14 >= ({wire10} ?
                              wire10[(3'h6):(1'h0)] : $unsigned((7'h41)))))};
  assign wire34 = ($signed($signed(wire7[(1'h1):(1'h1)])) ~^ wire9[(2'h2):(1'h0)]);
endmodule
