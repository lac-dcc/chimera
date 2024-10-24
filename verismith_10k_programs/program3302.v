module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire167;
  wire signed [(4'h9):(1'h0)] wire166;
  wire signed [(5'h10):(1'h0)] wire165;
  wire signed [(4'hc):(1'h0)] wire164;
  wire signed [(3'h6):(1'h0)] wire162;
  wire signed [(5'h12):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire162,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg15,
                 reg16,
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
                 reg38,
                 (1'h0)};
  assign wire4 = wire0;
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire1[(2'h3):(1'h0)]);
      if ((8'haf))
        begin
          reg6 <= wire1;
          reg7 <= (8'hab);
        end
      else
        begin
          reg6 <= wire4;
          reg7 <= (((|{(reg6 ? (8'hb8) : wire0)}) ?
              reg5[(4'ha):(3'h7)] : $unsigned($signed({wire2,
                  (8'hb2)}))) ^~ wire0);
          reg8 <= {wire3,
              (reg5[(1'h1):(1'h1)] == ((|$unsigned((8'hb9))) ?
                  (~|wire0) : (!(~^wire3))))};
          reg9 <= $unsigned((reg8[(2'h3):(1'h0)] ?
              reg7[(3'h4):(1'h1)] : wire2));
        end
      reg10 <= wire4[(4'h9):(1'h0)];
    end
  assign wire11 = (((&wire2[(2'h3):(2'h3)]) * reg5) - reg6[(1'h1):(1'h1)]);
  assign wire12 = (^~(reg8[(2'h3):(2'h2)] ? wire0[(3'h7):(2'h2)] : reg5));
  assign wire13 = $signed((-($unsigned((reg5 ?
                      reg8 : reg5)) >>> reg7[(2'h2):(1'h0)])));
  assign wire14 = (|reg10);
  always
    @(posedge clk) begin
      if ((-(+$signed(wire11))))
        begin
          reg15 <= wire4[(4'h8):(2'h2)];
          if (((8'haa) - reg8))
            begin
              reg16 <= wire11[(2'h3):(2'h3)];
              reg17 <= {(8'hb9)};
              reg18 <= ($unsigned($unsigned($unsigned($signed((8'hb5))))) ?
                  $signed($unsigned($unsigned($unsigned(reg6)))) : wire1[(4'ha):(3'h4)]);
              reg19 <= reg6[(3'h5):(1'h1)];
              reg20 <= (wire3 || reg7);
            end
          else
            begin
              reg16 <= reg15[(1'h0):(1'h0)];
            end
          if ((~^$unsigned($unsigned(reg6))))
            begin
              reg21 <= reg10;
              reg22 <= $signed($signed($signed($unsigned((wire11 || reg18)))));
              reg23 <= wire11;
              reg24 <= reg6[(3'h6):(3'h6)];
              reg25 <= reg20[(4'hf):(2'h2)];
            end
          else
            begin
              reg21 <= (wire12 ? (8'ha9) : $signed($unsigned({(!reg25)})));
              reg22 <= $unsigned({(~&$signed($signed(wire11)))});
              reg23 <= (-(!($unsigned((|wire3)) | $unsigned($signed(wire13)))));
              reg24 <= reg15;
            end
          reg26 <= ({($signed($unsigned(reg6)) ?
                  wire4[(3'h7):(3'h7)] : (!((8'hac) ? (8'haf) : reg9))),
              reg9} - wire3);
        end
      else
        begin
          reg15 <= (reg25 > {$signed(reg7)});
          reg16 <= $unsigned((+reg17));
        end
      reg27 <= $unsigned($unsigned((reg6 ?
          (|(wire2 ? reg15 : wire3)) : (~|$signed(reg7)))));
    end
  always
    @(posedge clk) begin
      reg28 <= (((reg22 ^ $unsigned(wire14)) | (((+wire0) ^~ (wire11 << wire0)) ?
              (~(reg7 ? reg19 : reg24)) : reg5[(4'h8):(1'h1)])) ?
          (!{(reg8[(2'h3):(2'h3)] ? $signed(reg16) : (+reg10)),
              wire12[(5'h13):(4'ha)]}) : $signed(wire12[(3'h6):(3'h5)]));
      reg29 <= (^~wire11);
    end
  assign wire30 = $signed({$signed((&$unsigned((8'hac)))), reg5});
  assign wire31 = $unsigned(((~&(((8'hb3) ? reg8 : wire2) ?
                      reg27 : wire3[(4'h8):(3'h7)])) ^~ reg25[(2'h2):(2'h2)]));
  assign wire32 = ($signed({$unsigned(reg5[(4'ha):(2'h3)])}) ^ $unsigned({(reg21 << (~^reg5)),
                      reg29}));
  assign wire33 = (~{((wire12[(3'h6):(2'h2)] ^ (reg9 ?
                          wire1 : wire4)) >> reg27),
                      $signed($unsigned(wire13[(2'h2):(1'h1)]))});
  assign wire34 = (8'ha4);
  assign wire35 = reg25[(1'h1):(1'h0)];
  assign wire36 = reg10[(4'hb):(4'h8)];
  assign wire37 = (&wire35);
  always
    @(posedge clk) begin
      reg38 <= {((((reg5 ~^ reg26) ? reg24[(3'h6):(2'h2)] : $unsigned(reg18)) ?
                  $signed((wire0 ?
                      wire12 : (8'h9c))) : $unsigned((wire33 != wire33))) ?
              $unsigned(reg18[(4'ha):(1'h0)]) : $signed($unsigned((^reg25))))};
    end
  module39 #() modinst163 (.wire40(wire13), .wire44(reg19), .y(wire162), .wire43(reg15), .clk(clk), .wire41(reg26), .wire42(wire34));
  assign wire164 = $signed((^(^reg5)));
  assign wire165 = (!$signed($signed(wire162)));
  assign wire166 = reg27[(1'h1):(1'h0)];
  assign wire167 = reg19;
endmodule

module module39
#(parameter param161 = ({(~^((-(8'hab)) != {(8'h9e)}))} ? (^(!(((8'hb1) > (8'haa)) >>> ((8'hba) ? (8'ha4) : (8'hb0))))) : ((|(^((8'hbd) ? (7'h40) : (8'hb6)))) << ((((8'hbf) >= (8'ha3)) || ((8'h9e) ? (8'hbd) : (8'hbe))) ? ((8'hab) << {(8'hb8), (8'hbe)}) : ((&(8'ha8)) || (!(8'h9f)))))))
(y, clk, wire40, wire41, wire42, wire43, wire44);
  output wire [(32'h214):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire40;
  input wire signed [(4'hc):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire42;
  input wire signed [(3'h7):(1'h0)] wire43;
  input wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire159;
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  assign y = {wire45,
                 wire84,
                 wire85,
                 wire159,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 (1'h0)};
  assign wire45 = {{$unsigned((wire43 | wire40))},
                      ((wire43 < (|$unsigned(wire40))) ?
                          (((~wire42) - $unsigned(wire42)) ?
                              $signed({wire41, (7'h44)}) : ($signed(wire40) ?
                                  wire40[(4'hf):(2'h2)] : wire42)) : $signed($signed((wire44 ^ wire44))))};
  always
    @(posedge clk) begin
      if (((~|$unsigned(((wire45 & wire43) ?
          (&wire42) : ((8'ha7) ?
              wire44 : wire43)))) ^~ (((8'haa) - $signed($unsigned(wire41))) ?
          {$signed((wire42 ? wire44 : (8'hbe))),
              (~^(~^wire42))} : {(((8'ha5) - wire44) && wire42[(2'h2):(2'h2)]),
              $unsigned($unsigned((8'hb8)))})))
        begin
          reg46 <= {wire43, wire41[(2'h3):(2'h3)]};
          reg47 <= ($unsigned(wire44) ^ $signed(($signed((^~wire43)) ?
              (wire44 ^ $signed(reg46)) : wire44[(3'h5):(3'h5)])));
          reg48 <= wire45[(1'h0):(1'h0)];
        end
      else
        begin
          reg46 <= (~({($unsigned(wire45) || $unsigned((7'h40))),
              reg48[(3'h4):(3'h4)]} && (((~^reg47) != wire41) ?
              $unsigned((reg47 ? wire44 : reg48)) : $signed((reg48 ?
                  reg46 : wire44)))));
          reg47 <= wire45[(2'h3):(2'h3)];
        end
      reg49 <= {wire44[(5'h10):(3'h7)],
          {$signed($signed((!reg48))),
              (+($unsigned(reg46) ?
                  (wire44 ? wire42 : wire45) : {wire42, wire40}))}};
      reg50 <= $signed(wire41[(2'h2):(1'h0)]);
      reg51 <= $signed(reg47[(2'h3):(2'h3)]);
    end
  always
    @(posedge clk) begin
      if (reg50[(1'h1):(1'h1)])
        begin
          reg52 <= $unsigned((8'ha3));
        end
      else
        begin
          if ((8'ha3))
            begin
              reg52 <= {$signed(((~$unsigned(reg46)) != ($unsigned(wire41) == wire42[(3'h4):(3'h4)])))};
              reg53 <= {$signed(((&(wire43 ? reg51 : reg52)) ?
                      (reg52 ?
                          (reg48 ? wire41 : reg46) : $signed(reg50)) : ({reg51,
                              wire41} ?
                          (wire40 != reg47) : (~|wire40))))};
              reg54 <= $signed(wire40[(2'h2):(2'h2)]);
              reg55 <= wire40[(3'h4):(2'h3)];
            end
          else
            begin
              reg52 <= $unsigned((($signed((reg49 ?
                      (8'hab) : wire44)) ^~ ((~&wire41) >= (reg48 != (8'hb3)))) ?
                  $signed($signed((wire44 ?
                      reg47 : reg55))) : ((&(~^reg46)) || wire43[(1'h1):(1'h1)])));
              reg53 <= (|(8'hb5));
            end
          if (wire45)
            begin
              reg56 <= ($unsigned($signed(((+wire45) ?
                      {reg46} : reg55[(4'he):(4'hc)]))) ?
                  $signed($unsigned({{wire42}})) : {({$signed(reg52),
                              $unsigned((8'ha7))} ?
                          (8'hba) : (reg47 & reg48))});
              reg57 <= wire41;
              reg58 <= (~&$signed($unsigned(($signed(reg51) ?
                  reg50 : {reg50}))));
            end
          else
            begin
              reg56 <= ({(reg50 ?
                      ((reg46 & reg51) != $unsigned(reg48)) : {reg53,
                          reg53})} == wire43[(3'h7):(1'h1)]);
              reg57 <= (($unsigned(($signed(wire41) >>> (reg57 < reg53))) ?
                  (+((reg55 != (8'ha7)) < (reg52 ?
                      reg49 : wire45))) : $unsigned($unsigned($signed(reg52)))) < (^~{wire43}));
              reg58 <= (reg51[(3'h5):(3'h4)] <= (wire40 - (~(8'h9f))));
            end
          reg59 <= ($unsigned($signed($unsigned(reg52[(3'h5):(2'h2)]))) ?
              $unsigned($signed(reg56)) : (~&((+(^(8'h9c))) & (~$signed((8'had))))));
        end
      if ((((8'hb0) ?
          $unsigned(reg51[(3'h4):(3'h4)]) : $signed((|(wire40 ?
              reg51 : wire44)))) ^ wire40[(4'hd):(3'h4)]))
        begin
          if ($unsigned(reg51))
            begin
              reg60 <= reg49[(3'h6):(3'h5)];
              reg61 <= $signed(reg53);
              reg62 <= $unsigned($signed($signed((~|$signed(reg52)))));
              reg63 <= (8'hbb);
              reg64 <= (~reg61[(4'hf):(2'h3)]);
            end
          else
            begin
              reg60 <= wire40;
              reg61 <= wire45;
            end
          if ($signed((((reg46[(4'hd):(1'h0)] | ((7'h41) >>> reg50)) == $signed(((8'ha0) + reg48))) ?
              reg48[(1'h1):(1'h1)] : (+wire42))))
            begin
              reg65 <= reg64[(5'h12):(5'h11)];
            end
          else
            begin
              reg65 <= (~^(+$unsigned((reg63 ? reg56 : reg47[(3'h5):(2'h3)]))));
            end
          if ($unsigned(reg55[(4'hc):(2'h2)]))
            begin
              reg66 <= (-$signed($unsigned(((reg57 ? reg49 : wire44) <= (reg52 ?
                  reg61 : reg59)))));
            end
          else
            begin
              reg66 <= (reg62 ?
                  reg49[(3'h6):(2'h3)] : (($signed((reg51 ?
                      wire43 : reg55)) << reg63[(4'h9):(3'h4)]) >> $unsigned((wire43 || reg48[(1'h1):(1'h0)]))));
            end
          reg67 <= (^~reg52[(3'h6):(2'h3)]);
          reg68 <= reg57[(4'hc):(3'h7)];
        end
      else
        begin
          reg60 <= (((~^$unsigned(((8'ha4) ? wire40 : reg60))) ?
                  reg58 : reg65[(3'h5):(1'h1)]) ?
              reg63[(3'h4):(1'h1)] : ($signed((&reg46[(1'h1):(1'h1)])) == ((^~(~reg61)) ?
                  ($unsigned(reg60) ?
                      reg68[(1'h1):(1'h0)] : reg67) : reg57[(3'h4):(1'h1)])));
        end
      if ((reg46[(4'h8):(1'h1)] >> (8'had)))
        begin
          reg69 <= {reg47[(3'h7):(3'h6)]};
          reg70 <= $signed(reg66[(4'h9):(3'h6)]);
        end
      else
        begin
          reg69 <= reg68[(1'h0):(1'h0)];
        end
      reg71 <= reg58[(3'h7):(3'h5)];
      if (((reg47 ?
          {(^~(reg65 ? wire43 : wire40))} : (^((reg52 ?
              reg56 : reg65) >> reg48[(2'h2):(1'h1)]))) != ({(+(reg54 ?
                  reg50 : reg61)),
              (~$signed(reg58))} ?
          {reg62,
              (reg53 > (reg63 == reg47))} : $unsigned(reg69[(1'h1):(1'h1)]))))
        begin
          if ($signed((+($signed($unsigned(reg50)) * {$signed(reg61),
              {wire43}}))))
            begin
              reg72 <= (8'h9f);
              reg73 <= {(($unsigned({wire40, reg62}) ?
                          $signed((reg71 <<< reg56)) : $unsigned((8'hab))) ?
                      (+wire45[(4'ha):(4'h9)]) : (((reg72 | reg57) ?
                          reg47 : $unsigned(reg46)) + ($signed((8'ha3)) < (-reg50))))};
              reg74 <= $signed((($unsigned((wire45 ? wire42 : wire45)) ?
                  ((reg69 ? reg46 : reg67) ?
                      (|(8'ha9)) : (reg67 >> reg57)) : $unsigned((reg57 ?
                      wire42 : reg64))) >>> (-$unsigned(reg57[(4'h9):(2'h3)]))));
            end
          else
            begin
              reg72 <= reg61[(4'hd):(1'h1)];
            end
          if (reg59[(4'hd):(3'h6)])
            begin
              reg75 <= $unsigned($signed((wire45[(1'h1):(1'h1)] ?
                  wire44[(1'h1):(1'h1)] : (~^$unsigned(reg69)))));
              reg76 <= (8'hba);
              reg77 <= ((+($signed((wire43 ?
                  reg58 : (8'hb6))) > ($unsigned(reg76) & $signed(reg47)))) < $signed(reg65));
              reg78 <= ((((^{(8'hb1)}) ?
                      $unsigned($unsigned(reg50)) : ((^~reg77) ^ (~|reg61))) >= ((reg50[(1'h1):(1'h1)] > {reg65,
                      reg74}) <= $unsigned($unsigned((8'hb8))))) ?
                  (reg48 * $signed($unsigned(reg69))) : (~|reg55[(4'h9):(3'h4)]));
            end
          else
            begin
              reg75 <= (~^(+((wire41[(4'h9):(3'h4)] ?
                      ((7'h43) && reg61) : (~wire43)) ?
                  reg75 : $signed((wire42 != reg75)))));
              reg76 <= ({$unsigned(reg52[(4'he):(2'h3)])} ?
                  ($unsigned($unsigned((7'h40))) ?
                      wire42[(2'h3):(1'h0)] : $signed(reg75[(2'h3):(1'h0)])) : reg62[(4'ha):(2'h2)]);
              reg77 <= reg75[(4'hb):(3'h5)];
            end
          if (({((reg62 ? reg57[(3'h6):(3'h5)] : reg70) ?
                  $unsigned($signed((8'hac))) : reg68[(1'h0):(1'h0)]),
              reg69[(1'h0):(1'h0)]} - reg56[(1'h0):(1'h0)]))
            begin
              reg79 <= $signed((|(-($unsigned(wire42) * $signed(reg54)))));
              reg80 <= {{($unsigned($signed((8'h9d))) ?
                          (8'hb8) : $unsigned((reg67 ? reg78 : (8'hba)))),
                      (((|reg69) ?
                              (reg52 ? reg70 : (8'ha2)) : (wire44 ?
                                  reg47 : reg46)) ?
                          {reg46, reg75[(5'h13):(4'ha)]} : ({(7'h44),
                              reg56} ~^ {wire43, reg66}))},
                  reg67[(3'h4):(3'h4)]};
              reg81 <= reg72;
              reg82 <= (^reg59);
              reg83 <= (~^(^(-reg69)));
            end
          else
            begin
              reg79 <= ((wire44 || (~&((reg72 | reg83) | $unsigned(reg51)))) ?
                  $unsigned((~|(^~$signed(reg48)))) : ((^~$unsigned((^~reg48))) ?
                      (^reg64) : (+$unsigned((reg55 <= reg53)))));
            end
        end
      else
        begin
          if ($signed((~&$unsigned((~&reg83[(1'h0):(1'h0)])))))
            begin
              reg72 <= (^$signed((~|reg79[(5'h10):(4'he)])));
              reg73 <= reg76[(4'hb):(4'hb)];
              reg74 <= reg74[(4'hf):(4'hf)];
            end
          else
            begin
              reg72 <= (reg82[(3'h6):(2'h2)] ? (&reg55) : $unsigned(wire45));
              reg73 <= (~^($signed((~$signed(reg66))) <<< $signed($unsigned(wire44))));
              reg74 <= reg73;
              reg75 <= reg75;
              reg76 <= {({$unsigned($signed(reg80))} ^~ ((reg73[(3'h7):(3'h4)] ?
                          $unsigned(reg61) : wire40[(4'h8):(1'h0)]) ?
                      ((^~reg72) < $unsigned(reg46)) : reg62))};
            end
          reg77 <= reg60[(1'h1):(1'h0)];
          reg78 <= reg66[(3'h4):(1'h0)];
        end
    end
  assign wire84 = (~^((reg69[(1'h0):(1'h0)] ? reg65 : $signed({reg69})) ?
                      (!$signed(wire43[(3'h5):(3'h4)])) : $unsigned($unsigned((reg71 > reg83)))));
  assign wire85 = $unsigned($unsigned((+reg52)));
  module86 #() modinst160 (wire159, clk, wire44, reg56, reg61, reg83);
endmodule

module module86
#(parameter param158 = ((((((8'hae) ^~ (7'h44)) <<< {(8'hb8), (8'haf)}) ? {((8'ha0) ? (8'ha2) : (8'hb2)), {(8'hbb)}} : (!(&(8'hb8)))) & (+({(8'ha0)} ? {(8'hab)} : {(8'ha7)}))) ? (((((8'ha7) ? (8'hbf) : (8'h9e)) << ((8'hb0) ? (8'hb2) : (8'hb2))) ? (!((8'ha8) ? (8'hb8) : (8'h9c))) : (&{(8'ha3)})) ? ((((8'hbe) ? (8'hb8) : (7'h44)) + ((8'hbd) || (8'ha6))) >= (((8'hb5) >= (8'hab)) && {(8'hab), (8'hbb)})) : ({{(8'ha6), (8'hb9)}} << (8'hbc))) : ({(^~(~(7'h43)))} >> (-(^((7'h42) | (7'h42)))))))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h327):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire90;
  input wire signed [(5'h10):(1'h0)] wire89;
  input wire signed [(4'hb):(1'h0)] wire88;
  input wire signed [(5'h12):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire148;
  wire signed [(3'h4):(1'h0)] wire147;
  wire signed [(3'h7):(1'h0)] wire146;
  wire [(2'h3):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire119;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire [(3'h7):(1'h0)] wire91;
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg [(5'h10):(1'h0)] reg156 = (1'h0);
  reg [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  assign y = {wire154,
                 wire148,
                 wire147,
                 wire146,
                 wire132,
                 wire131,
                 wire130,
                 wire120,
                 wire119,
                 wire96,
                 wire95,
                 wire91,
                 reg157,
                 reg156,
                 reg155,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire91 = (^~$unsigned({wire88,
                      (wire89 ? wire90[(3'h7):(3'h5)] : $signed(wire89))}));
  always
    @(posedge clk) begin
      reg92 <= wire90;
      if ((~^(~|(~&wire87))))
        begin
          reg93 <= ($unsigned(((7'h40) + (&$signed(wire90)))) ?
              $signed($unsigned(((!wire91) ?
                  $signed(wire87) : wire87))) : ($signed(wire89[(1'h1):(1'h1)]) ?
                  $unsigned(wire89) : reg92));
        end
      else
        begin
          reg93 <= reg92[(1'h0):(1'h0)];
          reg94 <= wire90;
        end
    end
  assign wire95 = reg93[(4'h8):(3'h4)];
  assign wire96 = $unsigned($unsigned(({(^reg94)} ^~ reg93)));
  always
    @(posedge clk) begin
      if ((wire95 >= (~|(~({wire88, (8'hba)} ? {wire90} : (^~wire96))))))
        begin
          reg97 <= $signed(reg94);
          reg98 <= ((wire87[(1'h1):(1'h0)] ?
              $unsigned(reg94[(2'h3):(1'h1)]) : $signed(reg97)) * $unsigned((|(^$signed(wire96)))));
          if ((~wire88))
            begin
              reg99 <= $signed($signed(reg97));
            end
          else
            begin
              reg99 <= (!$unsigned(((^~wire95) ?
                  $signed(wire95) : (((8'hbf) ? wire91 : wire87) ?
                      $unsigned(reg92) : (reg92 ? (8'h9d) : reg97)))));
            end
          if (reg93)
            begin
              reg100 <= ($unsigned((~^$signed(wire87))) ?
                  (($signed(wire91) ?
                      ((reg92 * reg99) ?
                          (~reg99) : {reg98, wire90}) : (&(wire91 ?
                          reg92 : reg98))) == $signed($unsigned((8'hac)))) : ((reg93[(3'h7):(1'h0)] && (wire89[(4'h8):(1'h1)] ?
                          $unsigned((8'hb3)) : (reg98 + wire91))) ?
                      (~^$unsigned(reg98[(4'ha):(4'ha)])) : $unsigned($unsigned($signed((8'ha1))))));
              reg101 <= wire90;
            end
          else
            begin
              reg100 <= $signed($signed({wire89, $signed($unsigned(wire96))}));
              reg101 <= reg97;
              reg102 <= {(+($signed($signed(reg101)) < reg99)),
                  $unsigned(wire90)};
            end
          reg103 <= (^reg100[(3'h4):(2'h2)]);
        end
      else
        begin
          reg97 <= $signed(((~{reg93[(3'h5):(3'h4)]}) <= $signed(((reg103 ?
              wire88 : reg100) & (~wire90)))));
          reg98 <= ($unsigned(reg92) ?
              (reg102 ?
                  (7'h42) : wire88[(4'ha):(4'h8)]) : $signed(((~&$unsigned(wire90)) ?
                  (~$unsigned(wire89)) : ((~|reg103) ?
                      {reg97, (7'h40)} : (reg93 ? reg94 : reg97)))));
          reg99 <= ((8'h9e) ? wire96 : $signed(reg98));
        end
      if ({$unsigned(wire89)})
        begin
          reg104 <= {$unsigned(($unsigned(reg97) || (+reg92))),
              $unsigned(reg99)};
          reg105 <= $unsigned($signed(reg104));
          reg106 <= ($unsigned(reg99[(1'h0):(1'h0)]) ?
              reg100[(3'h6):(3'h6)] : $signed((|(wire90 ~^ $unsigned(reg101)))));
          if ({reg104})
            begin
              reg107 <= ((-reg98) ?
                  $unsigned((reg101[(1'h0):(1'h0)] ?
                      ((|(8'hb5)) >>> $signed(reg103)) : reg102[(3'h7):(3'h6)])) : reg106[(2'h2):(1'h0)]);
            end
          else
            begin
              reg107 <= $unsigned(((~reg93[(3'h4):(1'h0)]) != $signed(($unsigned(reg94) != reg103))));
            end
        end
      else
        begin
          reg104 <= $unsigned($unsigned((-(~reg97[(2'h2):(2'h2)]))));
          if (((wire87 || reg106[(3'h7):(3'h6)]) ?
              (wire95 != (&$unsigned(reg104[(2'h3):(2'h2)]))) : (reg106[(3'h6):(1'h0)] ?
                  {$unsigned($unsigned(reg97)), reg94} : reg104)))
            begin
              reg105 <= reg92[(2'h2):(1'h1)];
              reg106 <= {{$unsigned({((8'hb3) < reg94),
                          (reg97 ? (8'haf) : reg105)}),
                      reg97[(4'h9):(3'h7)]}};
              reg107 <= ({(~&$unsigned($unsigned(wire95))),
                  $signed(reg105[(3'h7):(2'h3)])} + $unsigned({($signed(reg99) ?
                      reg103[(2'h3):(1'h1)] : {wire89, wire89}),
                  (reg98 ? (reg94 ? reg104 : reg104) : reg99[(2'h3):(2'h3)])}));
              reg108 <= reg101[(2'h3):(1'h1)];
              reg109 <= $unsigned($signed(((^~(&wire91)) ?
                  $signed(wire87[(5'h11):(2'h2)]) : reg98)));
            end
          else
            begin
              reg105 <= (~|wire88);
              reg106 <= (($unsigned(reg106[(3'h7):(2'h3)]) ?
                  $unsigned($unsigned(reg97[(4'h8):(4'h8)])) : $signed((~&$unsigned(reg104)))) - {(wire87 ?
                      reg98 : wire95)});
              reg107 <= ({({$unsigned(reg94)} - (!$signed(reg94))),
                  (reg102 != {wire87[(3'h7):(2'h2)]})} != ((reg105 ?
                  ((reg98 ?
                      wire88 : reg100) ^ $signed(reg105)) : ((wire90 < reg103) ?
                      (8'hb7) : (wire91 >>> (8'hbb)))) & $unsigned({$unsigned(reg107)})));
              reg108 <= $signed((&{$unsigned(reg105[(4'h8):(2'h3)]),
                  ((8'haf) ? reg98 : $unsigned(reg106))}));
              reg109 <= wire95;
            end
        end
      reg110 <= wire95;
      if (reg100)
        begin
          if (({($signed((reg109 ^ reg101)) >> (^$signed(reg101))),
              $signed(({reg102} && (wire95 + reg103)))} ~^ $unsigned({((reg110 ?
                  wire90 : reg98) << $signed(wire88))})))
            begin
              reg111 <= (({(^$unsigned(reg97)), reg109} ?
                      (($unsigned((8'h9f)) ?
                          $signed(wire87) : wire90[(3'h5):(3'h5)]) >>> {(reg93 ?
                              wire96 : (8'hb0))}) : $unsigned($signed($signed(reg98)))) ?
                  ($signed($unsigned((reg107 ? reg110 : wire91))) ?
                      ((~$unsigned(reg94)) ?
                          ({(8'hb3)} ?
                              wire91[(2'h3):(1'h1)] : (reg109 << reg106)) : ($unsigned(wire90) ?
                              (^~reg94) : $unsigned(wire95))) : ($unsigned(reg98) ?
                          reg92 : wire87[(3'h6):(2'h3)])) : reg108[(2'h3):(2'h3)]);
              reg112 <= ($unsigned(reg111[(2'h2):(2'h2)]) ?
                  wire89 : {($unsigned(reg94[(2'h3):(2'h3)]) + reg105[(4'ha):(2'h3)])});
            end
          else
            begin
              reg111 <= (|$unsigned(reg112[(2'h2):(2'h2)]));
            end
          reg113 <= (~|(({reg99, (reg103 ? (8'hb3) : wire95)} ?
              reg109 : ($unsigned(wire87) ? (-wire89) : (|(8'hb6)))) || reg92));
          if (reg92)
            begin
              reg114 <= (({({(8'haf)} * (~(8'hab))),
                      ((~(8'had)) ~^ reg99[(2'h2):(1'h1)])} != $unsigned(reg107)) ?
                  $unsigned(reg92[(1'h0):(1'h0)]) : $signed(($signed(reg99[(2'h2):(1'h0)]) ?
                      $unsigned((+reg100)) : reg113)));
              reg115 <= $unsigned((reg106[(4'h9):(2'h2)] >> $unsigned($signed($signed(reg109)))));
              reg116 <= $unsigned({(|$unsigned((reg94 ? reg106 : reg108))),
                  reg113[(4'ha):(2'h2)]});
              reg117 <= reg104;
            end
          else
            begin
              reg114 <= reg110;
            end
          reg118 <= {reg114[(3'h7):(3'h4)]};
        end
      else
        begin
          reg111 <= reg116[(4'hb):(4'ha)];
        end
    end
  assign wire119 = (wire91[(3'h4):(1'h0)] - reg93[(3'h6):(3'h4)]);
  assign wire120 = ((($unsigned(reg105) | $signed(((8'hbc) >= reg109))) > $unsigned($unsigned($signed(wire87)))) >= reg101);
  always
    @(posedge clk) begin
      reg121 <= (~|(^~wire89));
      reg122 <= reg93[(1'h0):(1'h0)];
      reg123 <= (($signed(reg100[(4'h8):(2'h3)]) && wire91) ?
          reg93 : (($unsigned(reg121[(3'h4):(2'h2)]) ?
                  $unsigned({reg115, reg97}) : ((8'hb7) ^~ $signed(reg112))) ?
              (&((reg98 ? wire96 : reg115) == reg118)) : reg93[(4'h9):(4'h8)]));
      reg124 <= ($signed((~((reg118 >= reg114) * $signed(reg123)))) ?
          (($signed((8'hba)) ?
              (^$signed(reg118)) : (|reg108)) + $unsigned(($unsigned(reg99) ?
              $unsigned(reg104) : (^reg111)))) : ($unsigned($unsigned($signed((8'h9c)))) <<< (^$signed((8'hb0)))));
      if ($unsigned((($unsigned(wire95[(2'h2):(1'h0)]) < reg124[(1'h1):(1'h0)]) ?
          {reg92} : ($signed(wire91) <= reg97[(4'h9):(3'h5)]))))
        begin
          reg125 <= $signed({(+(~$signed((8'ha9)))),
              ({{reg114, reg109}, {(8'ha1), reg118}} < wire87[(1'h1):(1'h1)])});
          reg126 <= (~wire120);
          reg127 <= ($unsigned(reg93[(2'h3):(1'h1)]) ?
              reg104 : ($unsigned((&reg103)) ? $unsigned(reg114) : reg126));
          reg128 <= $signed((((!(reg109 ?
                  (8'ha5) : wire120)) * $unsigned($unsigned(reg123))) ?
              (&wire95) : reg98));
        end
      else
        begin
          if (wire96[(1'h1):(1'h0)])
            begin
              reg125 <= wire88[(2'h3):(2'h2)];
              reg126 <= reg98[(3'h5):(3'h5)];
              reg127 <= (|($unsigned(((reg94 ^~ reg124) >= (reg105 ^ reg98))) >= (^~(reg114[(4'h9):(4'h8)] ?
                  $signed((7'h44)) : {reg105, wire91}))));
              reg128 <= reg118;
            end
          else
            begin
              reg125 <= ($signed({$unsigned(reg122[(4'hb):(3'h4)])}) ?
                  reg118[(1'h1):(1'h1)] : $unsigned(((reg101 ?
                          $signed(reg94) : $unsigned(reg122)) ?
                      reg112[(2'h2):(2'h2)] : $signed((+wire89)))));
              reg126 <= $signed($signed(reg124));
              reg127 <= $unsigned($signed((reg112[(1'h0):(1'h0)] > (reg103 && {(8'ha1),
                  reg118}))));
              reg128 <= reg92[(5'h11):(5'h11)];
              reg129 <= $unsigned($unsigned((reg122[(3'h5):(2'h2)] ?
                  ($signed(reg126) ?
                      (^wire119) : wire88) : $signed($unsigned((8'hb4))))));
            end
        end
    end
  assign wire130 = (($unsigned({(wire120 ?
                               reg110 : reg113)}) > reg121[(1'h0):(1'h0)]) ?
                       $signed($signed($unsigned($signed(reg94)))) : {(7'h42),
                           (~(reg123[(3'h4):(3'h4)] > $signed(reg94)))});
  assign wire131 = $unsigned(({{(reg107 < reg92),
                           reg92[(3'h6):(3'h6)]}} ^~ $unsigned(reg114[(3'h4):(1'h1)])));
  assign wire132 = (reg115 * $signed({((reg104 ? (8'haa) : (8'ha0)) ?
                           (wire88 == reg115) : {reg113, reg129})}));
  always
    @(posedge clk) begin
      reg133 <= $unsigned(($signed((8'hb8)) <<< wire89[(1'h1):(1'h1)]));
      if (reg101)
        begin
          if ($unsigned((&((((8'hbc) ? reg104 : reg125) ?
              $signed((8'hbf)) : (wire120 ~^ reg98)) ^~ reg106[(4'ha):(1'h1)]))))
            begin
              reg134 <= $signed((8'hb3));
              reg135 <= (7'h40);
            end
          else
            begin
              reg134 <= reg113;
              reg135 <= $signed({reg99});
            end
          reg136 <= {$unsigned($signed(((+reg97) >= (8'hba)))),
              ((reg118[(1'h0):(1'h0)] != ($signed(reg107) || reg115[(3'h4):(1'h1)])) ?
                  (((!(8'ha8)) > $signed((8'hbc))) ?
                      $unsigned(reg127[(4'hf):(3'h5)]) : wire119) : wire89)};
        end
      else
        begin
          if ((reg118[(1'h1):(1'h0)] ?
              $signed({(reg117 - (!reg128)),
                  (~&{reg109})}) : $signed($unsigned((~((8'ha9) ?
                  reg124 : wire95))))))
            begin
              reg134 <= $signed($unsigned({({wire130, reg129} ?
                      $signed(reg115) : wire88),
                  (((8'hb3) ? reg125 : wire90) ^~ reg97[(2'h3):(2'h2)])}));
              reg135 <= $unsigned($signed({($unsigned((8'haa)) ?
                      (&(8'ha5)) : (&(8'ha6))),
                  ((wire95 ? reg107 : reg113) - (~&reg104))}));
              reg136 <= (&$signed({(~$unsigned(reg115)),
                  reg135[(4'h9):(3'h4)]}));
            end
          else
            begin
              reg134 <= $unsigned((($signed($signed(reg135)) ?
                      (~|wire131[(3'h6):(2'h3)]) : $signed((reg99 ?
                          reg98 : wire88))) ?
                  reg92 : $signed($signed($signed((8'ha6))))));
            end
          reg137 <= (reg113 ?
              $unsigned($unsigned(reg97[(3'h7):(1'h1)])) : (-($unsigned({(8'hb6)}) ?
                  (reg136 ?
                      (wire131 | wire88) : $unsigned(reg107)) : (8'hae))));
          if ($signed(reg103[(1'h1):(1'h0)]))
            begin
              reg138 <= ($signed(((+$signed((8'hb0))) ?
                  reg104 : (wire120[(4'hc):(4'ha)] ?
                      (reg134 ?
                          reg116 : (8'hb7)) : reg117[(3'h4):(3'h4)]))) ^~ (($unsigned((~&reg112)) ?
                  (~|(reg118 ~^ reg109)) : reg136) << (^~reg98[(1'h1):(1'h1)])));
              reg139 <= (8'hbf);
              reg140 <= reg104[(2'h2):(2'h2)];
            end
          else
            begin
              reg138 <= (wire130 ?
                  $signed(({reg117} ?
                      (reg117[(2'h3):(1'h0)] & {reg140,
                          reg127}) : $signed(((8'hb4) == reg106)))) : {{$signed((~&reg98))},
                      (reg105 ? reg122 : (reg114 + wire119[(5'h11):(4'h8)]))});
              reg139 <= $unsigned($signed(wire91[(1'h0):(1'h0)]));
              reg140 <= $unsigned(reg114[(1'h1):(1'h0)]);
              reg141 <= reg108;
              reg142 <= ($signed($signed(reg123)) >>> $signed(reg92[(4'h8):(3'h7)]));
            end
          reg143 <= $unsigned(reg104);
          reg144 <= wire132[(2'h2):(2'h2)];
        end
      reg145 <= $unsigned(reg108);
    end
  assign wire146 = reg114[(3'h7):(3'h5)];
  assign wire147 = (~^(~wire132[(2'h2):(2'h2)]));
  assign wire148 = ({{$unsigned($signed(reg133)),
                           $signed((-reg137))}} < ((~^$signed($signed(reg109))) ?
                       {reg145} : $signed((reg112 ?
                           (wire96 ? reg94 : reg115) : $signed(reg103)))));
  always
    @(posedge clk) begin
      if ((reg139 ?
          reg140[(4'ha):(3'h7)] : (wire130[(4'h9):(2'h2)] ?
              {reg129, reg111[(3'h7):(3'h5)]} : $unsigned((8'hab)))))
        begin
          reg149 <= (({$signed(((8'hb4) ? reg137 : reg104))} ?
                  (7'h41) : $signed(reg92[(4'hb):(3'h6)])) ?
              ({(reg117[(1'h0):(1'h0)] == ((7'h43) >>> wire95))} < reg126[(2'h3):(2'h3)]) : (reg143[(4'h9):(1'h1)] ?
                  reg105[(4'ha):(3'h7)] : (!reg99[(1'h0):(1'h0)])));
          reg150 <= (|$unsigned($signed((~|{wire130, reg144}))));
          reg151 <= $unsigned($unsigned($signed($unsigned((wire89 ?
              reg108 : reg128)))));
          reg152 <= $unsigned($unsigned(({$signed(wire95),
                  (wire90 ? (8'ha4) : reg108)} ?
              $signed(((8'ha0) ? reg93 : reg129)) : reg110)));
          reg153 <= (reg145 ?
              (reg129 ^~ ((reg102[(3'h6):(3'h4)] ?
                      (8'h9d) : reg126[(3'h7):(3'h7)]) ?
                  $unsigned({reg100}) : $unsigned(((8'h9d) ?
                      (8'ha0) : reg127)))) : $signed(wire88[(1'h1):(1'h0)]));
        end
      else
        begin
          reg149 <= reg140;
        end
    end
  assign wire154 = ($signed($unsigned(reg99[(1'h0):(1'h0)])) ?
                       (wire90[(3'h6):(2'h3)] << reg103) : reg111);
  always
    @(posedge clk) begin
      reg155 <= ({$signed((|(~wire146))),
          $signed(reg100[(2'h2):(2'h2)])} < $unsigned($unsigned($unsigned($unsigned(reg113)))));
      reg156 <= $unsigned((&(8'h9e)));
      reg157 <= $signed($signed((-((~|(7'h43)) ?
          (8'h9e) : reg153[(1'h1):(1'h1)]))));
    end
endmodule
