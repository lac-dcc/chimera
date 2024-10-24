module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire27;
  assign y = {wire69,
                 wire67,
                 wire31,
                 wire30,
                 wire29,
                 wire5,
                 wire6,
                 wire27,
                 (1'h0)};
  assign wire5 = wire3[(2'h2):(2'h2)];
  assign wire6 = ({wire4} ?
                     $signed(wire1[(4'hf):(2'h3)]) : ($signed((-$signed(wire0))) ?
                         wire1 : $signed(wire0)));
  module7 #() modinst28 (.wire10(wire2), .wire12(wire3), .wire8(wire1), .clk(clk), .y(wire27), .wire11(wire5), .wire9(wire4));
  assign wire29 = (|wire2);
  assign wire30 = ($unsigned((|wire3[(4'hb):(1'h1)])) ~^ wire0);
  assign wire31 = $unsigned($unsigned(((~&wire5) ^~ (~&$signed(wire1)))));
  module32 #() modinst68 (wire67, clk, wire31, wire3, wire5, wire1);
  assign wire69 = (wire3[(1'h1):(1'h1)] && wire4);
endmodule

module module32
#(parameter param65 = (^{(((|(8'hb0)) ? ((8'hb1) + (8'ha6)) : (^(8'haf))) > (~^((8'hbb) ? (8'ha2) : (8'ha3)))), ({((8'h9e) ^ (8'hbe))} ? {((7'h40) & (8'hbf))} : (((8'hb1) ? (8'hab) : (8'hbe)) | (~&(8'had))))}), 
parameter param66 = (^~(({(+param65)} >>> (|(~&param65))) ? (((param65 ? param65 : param65) ? {param65} : (param65 << param65)) >> (param65 >= (+param65))) : (~^(^~(~^param65))))))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire signed [(3'h4):(1'h0)] wire35;
  input wire signed [(4'hd):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  assign y = {wire64,
                 wire38,
                 wire37,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
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
                 (1'h0)};
  assign wire37 = (^$unsigned(wire34));
  assign wire38 = (wire35 >> ($signed(wire35) ?
                      $unsigned(wire36[(4'he):(4'hd)]) : wire34));
  always
    @(posedge clk) begin
      reg39 <= wire34[(1'h0):(1'h0)];
      if ((^~$unsigned(((8'ha0) ? (~&$signed(wire33)) : wire33))))
        begin
          reg40 <= ((~(8'ha1)) | ($unsigned((wire34 ?
              wire33 : $signed(wire33))) > {$unsigned(wire37[(4'hb):(3'h6)])}));
          reg41 <= {$signed(wire37)};
          reg42 <= (7'h40);
        end
      else
        begin
          reg40 <= {(wire35 - reg39[(4'h9):(2'h3)]),
              (~&($unsigned({reg41, (8'had)}) ?
                  (^~(~|wire34)) : ((wire38 ? (8'ha5) : wire35) ?
                      $signed(reg40) : {(8'ha2), (8'hb3)})))};
          reg41 <= $signed({{((reg40 ? wire37 : (8'ha8)) ?
                      (wire38 ? wire35 : (7'h40)) : (~|wire35)),
                  ($unsigned(wire38) ? (~|(8'hb0)) : (reg40 - reg42))},
              reg42[(3'h4):(3'h4)]});
          reg42 <= $unsigned(($unsigned(wire36) <= $unsigned($signed((wire36 >> wire38)))));
          if (wire36[(3'h7):(1'h0)])
            begin
              reg43 <= (((~^$unsigned(reg39[(2'h3):(1'h1)])) ?
                  (~&(reg42[(1'h1):(1'h0)] ?
                      wire37[(4'hb):(3'h6)] : $unsigned(wire34))) : reg40[(3'h6):(2'h2)]) != wire35[(1'h0):(1'h0)]);
              reg44 <= {(&(+reg40))};
            end
          else
            begin
              reg43 <= (reg40[(3'h5):(2'h3)] ?
                  $signed(wire37) : (($unsigned(wire38[(1'h1):(1'h1)]) ?
                      ({wire36} ?
                          reg39 : wire35[(2'h2):(2'h2)]) : $unsigned((&wire37))) | reg41));
            end
        end
      if ($unsigned((^~reg40)))
        begin
          if (reg39[(3'h6):(2'h2)])
            begin
              reg45 <= ({wire34,
                      ($signed($signed(reg40)) << {(wire36 ? wire38 : reg39),
                          (reg43 ? wire37 : reg42)})} ?
                  (~&$signed((~^{reg44,
                      wire33}))) : ({(|$unsigned(wire35))} << reg42));
              reg46 <= {reg39};
              reg47 <= (reg44[(1'h1):(1'h1)] && {(~^$unsigned(reg45[(4'hc):(4'hb)]))});
            end
          else
            begin
              reg45 <= (^~(&((^~(~|reg40)) || $unsigned((wire36 ?
                  reg42 : reg41)))));
              reg46 <= wire35;
              reg47 <= $signed(reg45);
            end
          reg48 <= {(wire36 ?
                  $unsigned($unsigned(wire35[(3'h4):(1'h1)])) : (~^(~&(^~reg46)))),
              (8'haf)};
          reg49 <= reg42;
        end
      else
        begin
          reg45 <= (+reg44[(2'h3):(2'h3)]);
          reg46 <= (((($signed(reg47) ?
                  wire35 : {reg46, wire35}) >>> ($signed(reg45) <<< (wire35 ?
                  reg48 : wire33))) + $signed(reg42[(3'h6):(2'h3)])) ?
              reg47 : $signed($signed(reg39)));
          if (wire38)
            begin
              reg47 <= $unsigned(($signed(($signed(wire36) ?
                  $unsigned(reg42) : (reg41 ?
                      reg39 : reg45))) > reg40[(4'hd):(4'ha)]));
            end
          else
            begin
              reg47 <= {{(&{((8'hb7) ? (8'ha6) : reg48), wire36}),
                      {(reg47[(1'h1):(1'h1)] * reg40[(3'h4):(2'h2)])}},
                  {reg46[(3'h5):(1'h0)]}};
              reg48 <= $unsigned(reg48[(2'h2):(2'h2)]);
              reg49 <= $signed($unsigned($signed((-$unsigned(reg43)))));
            end
          reg50 <= reg45[(4'he):(4'hd)];
        end
      reg51 <= ((($signed($unsigned(reg50)) ~^ (reg39[(2'h3):(1'h0)] < (reg48 ?
                  reg46 : reg45))) ?
              $unsigned($signed((reg45 ?
                  reg44 : wire37))) : (reg44[(1'h1):(1'h0)] ? reg46 : reg50)) ?
          ($signed(wire34) < reg49[(3'h7):(1'h0)]) : (((~{reg46}) == reg44[(1'h0):(1'h0)]) << {(~(+reg46))}));
      if (wire38)
        begin
          reg52 <= (reg46 ?
              $unsigned((({reg46,
                  reg42} >> reg49) == $unsigned((+wire38)))) : wire35[(2'h2):(1'h1)]);
        end
      else
        begin
          if ((~|$unsigned(wire36[(4'he):(4'hc)])))
            begin
              reg52 <= (~reg48[(2'h3):(2'h2)]);
              reg53 <= (!(&($unsigned((|(8'hb2))) & $signed((reg49 ?
                  reg50 : reg46)))));
            end
          else
            begin
              reg52 <= {reg45[(5'h14):(4'h9)]};
              reg53 <= (~{(($unsigned(reg42) << (-reg40)) ?
                      reg51[(2'h2):(2'h2)] : ({reg41} || reg40[(2'h2):(2'h2)])),
                  reg46[(1'h1):(1'h1)]});
              reg54 <= reg40;
              reg55 <= (^~(reg51[(3'h7):(3'h7)] << wire37[(3'h5):(1'h0)]));
              reg56 <= (reg41[(3'h5):(1'h1)] ?
                  ({{reg54}, ($signed(wire37) * reg48[(4'hb):(3'h4)])} ?
                      wire36 : reg40) : wire36);
            end
          reg57 <= wire33;
          reg58 <= {$signed(reg42),
              $unsigned(((~^(~&reg49)) != ((~|reg40) ?
                  ((8'hb4) ? reg48 : wire34) : (&reg42))))};
          if ($unsigned($unsigned((((-reg44) ?
              (!reg51) : (|wire37)) && {(wire35 & reg43)}))))
            begin
              reg59 <= reg39[(4'hd):(3'h4)];
              reg60 <= (&wire33[(1'h1):(1'h1)]);
            end
          else
            begin
              reg59 <= (~$unsigned($unsigned((^~$unsigned(reg44)))));
              reg60 <= $signed(reg51[(2'h3):(1'h0)]);
              reg61 <= reg47;
              reg62 <= $signed(({$signed($signed(reg58)),
                      $unsigned(wire36[(4'hc):(4'ha)])} ?
                  reg46 : ($signed(((8'ha0) ? reg48 : wire36)) ?
                      $signed((^reg49)) : ({(8'hb7),
                          reg45} && wire35[(1'h1):(1'h1)]))));
              reg63 <= (wire35[(2'h2):(2'h2)] + $unsigned($signed(($signed(reg48) << reg43))));
            end
        end
    end
  assign wire64 = $signed((({(reg63 ? wire38 : reg47)} ?
                      $unsigned((&reg51)) : {{wire33},
                          reg41[(2'h3):(1'h1)]}) >= (8'hb7)));
endmodule

module module7
#(parameter param26 = {(+(({(8'haa), (7'h43)} ? ((8'ha6) | (8'hbc)) : (~|(8'h9d))) && ((~&(8'hb4)) && ((8'hbc) << (7'h40)))))})
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = $signed(({$unsigned({wire8}),
                      (((8'ha8) ? wire11 : (7'h40)) ?
                          wire9 : ((8'hbc) <<< (8'h9f)))} * ({wire10} ?
                      wire11 : ((wire9 <<< wire10) + wire10[(1'h1):(1'h1)]))));
  assign wire14 = $signed((!((~|wire13) && $unsigned({wire12, wire11}))));
  assign wire15 = ((~((~&(&wire9)) ?
                          $unsigned($signed(wire10)) : $unsigned(wire14[(2'h3):(2'h2)]))) ?
                      ($unsigned({wire8[(2'h2):(1'h0)]}) - wire9) : (~|$unsigned(((wire11 == wire13) ?
                          wire12 : $unsigned(wire12)))));
  assign wire16 = {wire11[(2'h3):(1'h1)]};
  assign wire17 = $signed(((|($signed(wire14) ?
                          (wire9 ? wire10 : wire10) : wire12[(2'h2):(1'h1)])) ?
                      wire13 : $unsigned((|(wire9 ? (8'hb3) : wire12)))));
  assign wire18 = $signed((8'haf));
  assign wire19 = wire9;
  assign wire20 = $unsigned($unsigned(wire15[(4'h8):(1'h1)]));
  assign wire21 = $unsigned(wire15[(4'ha):(2'h3)]);
  assign wire22 = $signed((wire11 ? wire21[(3'h6):(2'h2)] : wire20));
  assign wire23 = $signed((wire15 | {wire9}));
  assign wire24 = $unsigned(wire23);
  assign wire25 = $signed(wire16[(2'h3):(2'h3)]);
endmodule
