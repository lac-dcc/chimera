module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire182;
  wire signed [(3'h5):(1'h0)] wire181;
  wire [(4'hb):(1'h0)] wire180;
  wire [(4'hd):(1'h0)] wire179;
  wire signed [(3'h4):(1'h0)] wire170;
  wire [(3'h7):(1'h0)] wire169;
  wire signed [(4'hc):(1'h0)] wire168;
  wire signed [(4'hb):(1'h0)] wire167;
  wire signed [(5'h10):(1'h0)] wire140;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire142;
  wire [(4'h8):(1'h0)] wire143;
  wire [(4'ha):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire159;
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg161 = (1'h0);
  reg [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg163 = (1'h0);
  reg [(4'h8):(1'h0)] reg164 = (1'h0);
  reg [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg166 = (1'h0);
  reg [(5'h15):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg172 = (1'h0);
  reg [(4'he):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg [(4'h9):(1'h0)] reg175 = (1'h0);
  reg [(4'hc):(1'h0)] reg176 = (1'h0);
  reg [(5'h11):(1'h0)] reg177 = (1'h0);
  reg [(3'h7):(1'h0)] reg178 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire140,
                 wire18,
                 wire20,
                 wire138,
                 wire142,
                 wire143,
                 wire158,
                 wire159,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 (1'h0)};
  module4 #() modinst19 (.wire7(wire3), .y(wire18), .wire8(wire0), .wire6(wire1), .wire5(wire2), .clk(clk));
  assign wire20 = wire2[(5'h10):(4'he)];
  module21 #() modinst139 (.wire24(wire1), .y(wire138), .clk(clk), .wire22(wire2), .wire26(wire0), .wire25(wire3), .wire23(wire18));
  module30 #() modinst141 (wire140, clk, wire2, wire0, wire18, wire20, wire138);
  assign wire142 = ({$signed($signed($signed(wire3))),
                           $unsigned(((wire20 ? wire20 : wire138) ?
                               (wire0 * (8'h9e)) : wire2[(5'h14):(1'h1)]))} ?
                       $signed($unsigned($unsigned((!wire20)))) : (^~wire140));
  assign wire143 = wire1[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      if ($unsigned($signed(((|$signed(wire18)) >= ($unsigned(wire20) ?
          $unsigned((8'hb1)) : $unsigned(wire143))))))
        begin
          reg144 <= $unsigned($signed(wire3[(3'h6):(3'h6)]));
          if ((wire138[(1'h1):(1'h1)] ?
              $signed(wire3[(1'h0):(1'h0)]) : {{wire20, (~&wire20)},
                  (~^reg144[(4'hf):(1'h1)])}))
            begin
              reg145 <= $signed($unsigned(wire3));
            end
          else
            begin
              reg145 <= ($signed((~|(~|$unsigned(wire2)))) ?
                  (~|$unsigned($unsigned(wire0))) : ((~$signed((^wire3))) ?
                      $signed($unsigned(((7'h41) ?
                          (8'hb2) : reg145))) : $unsigned(($unsigned(wire18) ?
                          (~^wire140) : $unsigned((8'hba))))));
              reg146 <= (^~(~&($signed(((8'hbd) != wire0)) << wire1[(4'h8):(3'h4)])));
              reg147 <= $unsigned((((reg144[(4'h8):(4'h8)] <<< $signed(reg146)) > $signed((wire138 >= wire142))) & wire0));
            end
        end
      else
        begin
          reg144 <= {(~^$signed(wire0[(4'hf):(4'hf)])),
              $unsigned(reg145[(2'h2):(2'h2)])};
          if (wire2)
            begin
              reg145 <= $signed(($unsigned($unsigned({(8'hb5)})) ?
                  {$unsigned($signed(wire140))} : reg144[(3'h6):(3'h4)]));
              reg146 <= $unsigned((($unsigned({(8'hac)}) ?
                      $signed((^~wire142)) : $unsigned(((7'h40) != wire138))) ?
                  wire20 : wire142[(3'h6):(2'h3)]));
              reg147 <= ((~&(^~((reg144 ?
                      reg146 : wire138) <= (reg144 - wire0)))) ?
                  (+reg144) : $unsigned(reg145[(1'h1):(1'h1)]));
            end
          else
            begin
              reg145 <= reg146[(1'h1):(1'h0)];
            end
        end
      reg148 <= wire142[(3'h5):(3'h5)];
      reg149 <= {$signed((wire142[(3'h4):(2'h3)] & (8'hab)))};
    end
  always
    @(posedge clk) begin
      reg150 <= (^$unsigned($signed($signed(wire2))));
      reg151 <= $signed(reg144[(3'h6):(3'h4)]);
    end
  always
    @(posedge clk) begin
      if ($unsigned((({(8'hbf)} < {(wire138 ? wire3 : wire138)}) - (wire2 ?
          ($signed(reg145) ~^ (reg149 ?
              wire18 : wire140)) : wire2[(1'h1):(1'h0)]))))
        begin
          reg152 <= wire20;
          reg153 <= reg146[(4'h8):(4'h8)];
        end
      else
        begin
          if ((^~wire138))
            begin
              reg152 <= (((reg153 ?
                  (wire140[(1'h0):(1'h0)] ?
                      $signed((8'ha3)) : (+wire20)) : $signed($unsigned(wire140))) | reg151) && $unsigned($signed($unsigned($unsigned(wire3)))));
            end
          else
            begin
              reg152 <= $signed((reg147 ?
                  wire1 : (reg153[(2'h3):(1'h1)] > wire20[(4'he):(3'h7)])));
              reg153 <= (~|$unsigned(($signed((reg152 ?
                  reg152 : (8'h9e))) || reg148)));
              reg154 <= reg146[(4'he):(2'h2)];
            end
          reg155 <= $signed(((((~|wire18) ?
                      (reg146 ? wire138 : wire18) : $signed(wire18)) ?
                  (wire2[(3'h4):(1'h0)] ?
                      (reg149 * reg151) : {wire20, wire3}) : {(+reg146),
                      $unsigned(reg145)}) ?
              reg148 : ({(~^wire140)} + reg153[(1'h1):(1'h0)])));
          reg156 <= $signed(reg151[(4'h8):(3'h4)]);
          reg157 <= ($signed(wire1) ?
              $unsigned({$unsigned($signed((8'h9d))),
                  (8'ha6)}) : (^~$unsigned(((reg154 | reg147) & (!(8'ha2))))));
        end
    end
  assign wire158 = wire143;
  module4 #() modinst160 (.y(wire159), .wire6(reg157), .wire7(wire140), .wire5(wire158), .clk(clk), .wire8(wire18));
  always
    @(posedge clk) begin
      reg161 <= reg151;
      if ($unsigned(($unsigned((~(wire138 != wire1))) ?
          {wire138[(2'h3):(2'h2)],
              $unsigned($signed(wire159))} : (wire0[(4'ha):(1'h1)] ~^ wire20[(5'h12):(5'h10)]))))
        begin
          reg162 <= ($signed((((reg148 ?
                  reg156 : reg154) && (wire2 <= (7'h40))) ?
              wire0[(3'h6):(2'h2)] : $unsigned((+wire140)))) >> $signed($unsigned(wire20[(1'h0):(1'h0)])));
        end
      else
        begin
          reg162 <= $unsigned($unsigned(reg154[(2'h2):(2'h2)]));
          reg163 <= wire1;
          reg164 <= {$signed(wire159[(1'h1):(1'h1)])};
          reg165 <= $signed($signed({wire159}));
          reg166 <= (($signed((8'ha6)) ?
              $unsigned(reg146[(4'he):(2'h3)]) : $signed(wire1)) >> $unsigned($unsigned($signed($signed(reg149)))));
        end
    end
  assign wire167 = $unsigned((~(reg157[(1'h0):(1'h0)] ^ reg146)));
  assign wire168 = (~^(8'hb4));
  assign wire169 = ((reg152 <= $signed($signed($unsigned(reg154)))) + (-(8'h9e)));
  assign wire170 = (8'hb9);
  always
    @(posedge clk) begin
      reg171 <= ((((reg156[(4'hf):(4'h9)] ?
                  $unsigned(reg150) : (wire170 ? (8'hbb) : wire2)) ?
              ($signed(reg157) | (reg165 ?
                  wire170 : reg147)) : reg148[(2'h2):(2'h2)]) != (wire138[(1'h0):(1'h0)] ?
              (~&reg147[(1'h1):(1'h1)]) : $signed((~^(8'hb6))))) ?
          ($unsigned($unsigned((reg146 >= reg155))) >= ($signed($signed((8'haf))) || ((+wire0) ?
              (8'haf) : $signed(wire1)))) : (((((7'h42) ? reg147 : wire168) ?
              wire159[(3'h4):(1'h0)] : (reg156 ?
                  reg157 : reg163)) >>> (~&(wire170 + reg155))) ~^ (reg145 || (reg150 + (~^wire2)))));
      if (((reg164 ?
          (^~((+reg149) ?
              reg164[(1'h1):(1'h0)] : reg149[(4'h8):(3'h5)])) : reg166) | reg148[(4'hb):(3'h6)]))
        begin
          reg172 <= ($signed(reg171[(4'h8):(3'h6)]) ?
              (+wire168[(4'h9):(1'h1)]) : (8'hba));
          reg173 <= reg164[(2'h3):(2'h2)];
        end
      else
        begin
          reg172 <= wire169;
          reg173 <= reg172;
          reg174 <= $signed((~|{reg147, $unsigned(wire2[(5'h13):(2'h2)])}));
          reg175 <= (($unsigned(({(8'hac)} && (~&reg165))) ?
                  reg166 : $unsigned(((reg144 * (7'h40)) ?
                      $unsigned((8'ha1)) : $signed(wire159)))) ?
              reg155 : reg157);
          reg176 <= (+(|(8'hb7)));
        end
      reg177 <= $signed({reg148});
      reg178 <= $unsigned(((~$unsigned(wire143[(3'h5):(2'h2)])) & (8'hb2)));
    end
  assign wire179 = ((reg164 ?
                       $signed({$signed((8'hbb)),
                           (~^reg165)}) : {$signed(wire18[(2'h3):(2'h2)])}) + wire170[(1'h1):(1'h0)]);
  assign wire180 = $signed((~&{wire20, (~^wire158)}));
  assign wire181 = wire18;
  module21 #() modinst183 (wire182, clk, wire18, reg174, wire20, reg148, reg163);
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire26;
  input wire [(4'hc):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire23;
  input wire signed [(4'he):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(3'h4):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire120;
  reg signed [(4'h8):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(4'h8):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire57,
                 wire29,
                 wire28,
                 wire27,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire99,
                 wire101,
                 wire102,
                 wire104,
                 wire105,
                 wire120,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg103,
                 (1'h0)};
  assign wire27 = {wire23[(4'h8):(3'h6)]};
  assign wire28 = (&wire23[(4'hd):(2'h3)]);
  assign wire29 = {wire28, wire27[(1'h1):(1'h0)]};
  module30 #() modinst58 (wire57, clk, wire27, wire25, wire23, wire28, wire24);
  assign wire59 = {((~^wire26) ^ (~|(wire27[(4'h8):(2'h2)] & (wire26 ?
                          wire29 : (8'hac)))))};
  assign wire60 = wire59;
  assign wire61 = wire25;
  assign wire62 = wire28;
  assign wire63 = wire22[(1'h0):(1'h0)];
  assign wire64 = $signed(wire23);
  assign wire65 = wire62;
  assign wire66 = wire23[(2'h3):(2'h2)];
  module67 #() modinst100 (.y(wire99), .wire70(wire65), .wire68(wire60), .wire71(wire26), .wire69(wire62), .clk(clk));
  assign wire101 = wire57;
  assign wire102 = wire62;
  always
    @(posedge clk) begin
      reg103 <= (wire22[(2'h3):(1'h0)] << {{wire101[(3'h7):(1'h0)],
              $signed($unsigned(wire59))},
          $unsigned($unsigned($signed(wire22)))});
    end
  assign wire104 = $unsigned((~$unsigned($unsigned(wire60[(2'h3):(2'h3)]))));
  assign wire105 = (8'h9c);
  module106 #() modinst121 (.wire109(wire28), .clk(clk), .wire110(wire64), .wire107(wire104), .wire111(wire57), .wire108(wire29), .y(wire120));
  assign wire122 = wire23[(2'h3):(1'h1)];
  assign wire123 = {(wire61 ? wire99 : $signed($signed(wire65[(4'ha):(3'h5)]))),
                       (wire105 || ((8'ha1) != $signed(wire28[(4'he):(3'h6)])))};
  always
    @(posedge clk) begin
      if (wire57[(5'h14):(5'h14)])
        begin
          reg124 <= $signed(wire28[(4'h8):(3'h5)]);
          reg125 <= (~^$unsigned({$signed((wire29 ? wire22 : wire122))}));
        end
      else
        begin
          reg124 <= $signed($signed((~^{$signed((8'hb3))})));
          reg125 <= $unsigned(wire24);
          reg126 <= {{($signed((~&wire22)) ?
                      {wire24[(2'h2):(1'h1)], {wire105}} : wire60),
                  ((~|(-wire123)) ?
                      wire22[(4'hc):(2'h3)] : (~^(wire120 ?
                          wire25 : wire101)))}};
          reg127 <= $unsigned((($signed(wire65) << (~^$unsigned(wire123))) ?
              (((wire25 + (8'hb1)) <<< (wire65 ? wire104 : wire59)) ?
                  ((wire102 ? (8'hb5) : wire101) ?
                      (8'ha2) : (wire104 || wire22)) : wire66[(4'h9):(3'h7)]) : (!wire122[(2'h3):(2'h3)])));
        end
      if ($unsigned($unsigned(reg126[(3'h7):(3'h7)])))
        begin
          reg128 <= wire62;
          reg129 <= reg125[(4'he):(2'h3)];
          if ((~^wire23[(4'he):(4'hc)]))
            begin
              reg130 <= reg125[(5'h11):(5'h10)];
              reg131 <= (reg128[(5'h11):(3'h4)] ?
                  wire122[(1'h0):(1'h0)] : (&{(reg127[(3'h6):(1'h1)] ?
                          wire57[(5'h11):(4'h9)] : wire122[(2'h3):(2'h2)]),
                      $unsigned((~&wire122))}));
              reg132 <= wire22[(1'h0):(1'h0)];
              reg133 <= ($unsigned(((8'hb6) ?
                  ((8'ha9) - (wire23 <<< wire61)) : ({wire62,
                      (8'hb0)} << $signed(wire59)))) >>> $unsigned($signed(wire60)));
            end
          else
            begin
              reg130 <= (({wire101[(3'h6):(3'h4)]} ?
                  {wire62,
                      (wire120 == (wire57 ?
                          wire122 : wire22))} : reg103[(3'h7):(1'h1)]) >>> (wire123 ?
                  {$unsigned($unsigned(wire102))} : (+reg103)));
            end
          reg134 <= wire61[(3'h6):(3'h6)];
        end
      else
        begin
          reg128 <= (8'hb8);
          if (wire29[(3'h7):(3'h6)])
            begin
              reg129 <= (~^wire104);
              reg130 <= ($unsigned(($signed(reg131[(3'h5):(2'h3)]) <= wire57)) ?
                  $signed($unsigned((^$signed(reg132)))) : {$unsigned(wire28),
                      $signed($signed((wire59 != (8'hbe))))});
              reg131 <= wire120;
              reg132 <= wire61[(3'h7):(3'h7)];
              reg133 <= reg124[(4'hd):(3'h4)];
            end
          else
            begin
              reg129 <= wire64[(1'h1):(1'h1)];
              reg130 <= (^~reg133[(2'h2):(1'h1)]);
              reg131 <= $signed($signed($unsigned((8'hb4))));
            end
          reg134 <= (+$signed(reg124[(5'h13):(1'h0)]));
        end
      reg135 <= {(~(($unsigned(wire123) * {wire59}) ?
              (7'h43) : wire120[(1'h0):(1'h0)])),
          (!$unsigned(reg127[(5'h12):(4'ha)]))};
      reg136 <= wire63;
      reg137 <= wire60;
    end
endmodule

module module4
#(parameter param17 = ({(^{(&(8'hb9)), ((8'ha0) ? (8'ha8) : (7'h41))}), ({{(8'hbc)}, (|(8'haf))} ? {(!(8'hb5)), (^~(8'hac))} : (8'hab))} ^ (~^{(|((8'ha5) ? (8'hb9) : (8'h9f)))})))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  input wire signed [(3'h7):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire9 = wire6;
  assign wire10 = $signed(wire5);
  assign wire11 = wire6[(3'h5):(1'h1)];
  assign wire12 = {wire6[(4'h8):(3'h6)]};
  always
    @(posedge clk) begin
      reg13 <= {{(!{$unsigned(wire5)}), wire11},
          ({($unsigned(wire9) ? wire9 : $signed(wire12))} ?
              $signed(wire8[(1'h1):(1'h1)]) : $signed($unsigned($unsigned(wire10))))};
      reg14 <= ((^~wire9) ?
          (~&$signed(((8'ha6) ?
              $signed(reg13) : $unsigned(wire12)))) : $unsigned({wire9,
              (wire12 ? wire6 : $unsigned((8'hab)))}));
      reg15 <= (($unsigned(wire6) & $unsigned(((|reg13) ?
              $signed(wire8) : (+reg13)))) ?
          $signed(($signed(wire10[(4'h9):(4'h8)]) ?
              $signed($unsigned(reg13)) : {$signed(wire7),
                  (wire9 ^ reg13)})) : $unsigned((7'h43)));
      reg16 <= $signed(wire6);
    end
endmodule

module module106  (y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire111;
  input wire [(2'h3):(1'h0)] wire110;
  input wire [(4'hf):(1'h0)] wire109;
  input wire signed [(5'h15):(1'h0)] wire108;
  input wire signed [(4'hb):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire119;
  wire [(4'hf):(1'h0)] wire118;
  wire signed [(4'hf):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire112;
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire112,
                 reg114,
                 (1'h0)};
  assign wire112 = wire111[(5'h14):(4'h9)];
  assign wire113 = $unsigned(($unsigned($unsigned((+wire107))) & (((~|wire107) >> (+wire110)) ?
                       $signed((|wire107)) : (~|wire108))));
  always
    @(posedge clk) begin
      reg114 <= (~|$unsigned((^(wire109[(3'h6):(3'h5)] ?
          $unsigned(wire107) : wire110))));
    end
  assign wire115 = $unsigned($unsigned($signed($signed((reg114 ?
                       wire112 : wire111)))));
  assign wire116 = wire111[(4'hc):(4'h8)];
  assign wire117 = wire110;
  assign wire118 = (~$unsigned(reg114[(3'h5):(1'h0)]));
  assign wire119 = $signed(({((wire109 && wire116) ?
                           $unsigned(wire117) : (wire117 ?
                               reg114 : wire108))} + ($unsigned((~&wire111)) && wire108)));
endmodule

module module67
#(parameter param97 = ((+({((8'h9e) << (8'hb4))} ? ((~^(8'h9e)) ? ((8'ha9) > (7'h42)) : ((8'hb7) && (8'ha7))) : {((8'hb2) ~^ (8'ha1))})) ? {((!(&(8'ha9))) & (((8'hb4) ? (8'had) : (8'hbe)) >> ((8'h9c) ^~ (8'hb9))))} : ({{((8'ha1) ? (8'ha2) : (8'ha5)), ((8'ha1) - (8'hb1))}} ? (8'hb8) : ((((8'ha5) ^ (8'hb5)) > ((8'hab) << (8'hb1))) ? ({(8'hbb), (8'hbf)} ^~ (&(8'ha0))) : (~((7'h43) + (8'hae)))))), 
parameter param98 = (|({((param97 - param97) ? (param97 ? (8'hb2) : param97) : {(8'hbb)})} >> param97)))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire71;
  input wire signed [(4'hf):(1'h0)] wire70;
  input wire signed [(3'h7):(1'h0)] wire69;
  input wire [(2'h3):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire96;
  wire [(2'h2):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire72;
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire72,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire72 = $signed((((&wire70[(4'hb):(3'h4)]) ?
                      ((wire69 ^ wire69) ?
                          wire70 : wire69) : wire70) >= $unsigned($signed(wire71))));
  always
    @(posedge clk) begin
      reg73 <= (~^$signed($unsigned({$signed(wire72), (~|wire69)})));
      reg74 <= wire69[(3'h6):(3'h4)];
      reg75 <= {$unsigned((((wire70 ? wire70 : wire70) > {wire68}) ?
              {reg74, (!(8'ha6))} : ($unsigned(wire68) ?
                  (wire68 ? wire70 : wire70) : (8'h9f))))};
    end
  assign wire76 = ($signed(wire69) ?
                      $unsigned(($unsigned(wire69[(3'h5):(2'h3)]) ~^ wire70[(1'h0):(1'h0)])) : {wire68[(1'h0):(1'h0)]});
  assign wire77 = reg73;
  assign wire78 = $unsigned($unsigned((~&($unsigned(wire69) ?
                      $unsigned(wire76) : wire72[(4'hc):(3'h5)]))));
  assign wire79 = {reg75[(1'h1):(1'h1)]};
  assign wire80 = wire71;
  assign wire81 = $signed(({(wire69 ? (!(8'ha1)) : wire78[(3'h6):(3'h6)]),
                          ($signed(wire71) - (wire80 * wire79))} ?
                      ($unsigned(wire71[(2'h3):(2'h2)]) ?
                          ({wire78,
                              wire78} + wire76[(3'h4):(1'h1)]) : wire80[(4'h8):(3'h5)]) : (|{reg74,
                          (^~(8'hb5))})));
  assign wire82 = $unsigned(wire70);
  assign wire83 = (wire78 && wire76[(4'hc):(3'h4)]);
  assign wire84 = (wire78[(1'h1):(1'h0)] ?
                      (($signed((wire69 ^~ wire76)) >= $unsigned((^~wire71))) >= (((~|wire77) ~^ wire81) < wire69)) : {wire77});
  assign wire85 = ((+(8'h9f)) * wire77[(4'h8):(3'h4)]);
  always
    @(posedge clk) begin
      reg86 <= ((-reg73[(4'hf):(3'h6)]) ?
          {(($signed(wire69) >>> (wire78 ^~ wire71)) || reg73[(1'h0):(1'h0)]),
              {{wire85[(4'ha):(3'h6)],
                      (wire78 ?
                          wire82 : wire80)}}} : $signed($signed((+wire68[(2'h2):(2'h2)]))));
      reg87 <= ($signed($unsigned($signed($signed((7'h41))))) < (wire81[(3'h5):(3'h4)] >> (-((wire79 ?
              wire72 : reg86) ?
          (wire69 ? wire77 : wire77) : wire71))));
      reg88 <= reg75;
      reg89 <= wire78;
    end
  always
    @(posedge clk) begin
      reg90 <= $unsigned($signed(wire76));
      reg91 <= ((~|$unsigned((reg86 || (wire77 ?
          wire79 : wire80)))) | {$unsigned(($unsigned(wire72) ?
              reg89 : (reg75 ? wire85 : wire78)))});
    end
  assign wire92 = wire80;
  assign wire93 = $signed(($unsigned(reg89[(1'h0):(1'h0)]) ?
                      ((((8'hbf) ?
                          wire77 : reg86) >= (!(8'hbd))) ^ reg75) : ($unsigned($unsigned((8'h9d))) ?
                          $unsigned((wire92 * wire79)) : (wire79 ~^ (reg86 && wire81)))));
  assign wire94 = wire92[(4'hc):(1'h0)];
  assign wire95 = $signed(($signed(((reg73 ? (8'hb3) : wire78) ?
                      $signed(reg90) : wire76[(4'hc):(3'h6)])) < (~|((~^reg73) ?
                      $signed(wire81) : reg88[(3'h7):(3'h4)]))));
  assign wire96 = (|{reg87});
endmodule

module module30
#(parameter param55 = (~&(-((((8'h9f) <= (8'ha0)) ? {(8'hab), (8'hb9)} : ((8'hbe) ? (8'h9d) : (8'ha0))) ? (((8'hab) != (8'hb9)) ? ((8'hb5) ? (8'hb9) : (8'ha0)) : ((8'hb2) ? (8'had) : (8'haf))) : (-((8'hbd) < (8'h9d)))))), 
parameter param56 = (&{((((8'hb2) << param55) * (param55 ^ param55)) ? ({(8'hb8)} < {(8'h9d), (7'h40)}) : (param55 ? (param55 ? param55 : param55) : (~^param55)))}))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire35;
  input wire [(4'hc):(1'h0)] wire34;
  input wire [(2'h2):(1'h0)] wire33;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire [(2'h3):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire36;
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire36,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire36 = (^~(8'hb6));
  always
    @(posedge clk) begin
      if (wire34[(4'h8):(1'h0)])
        begin
          reg37 <= wire34[(2'h2):(1'h1)];
        end
      else
        begin
          reg37 <= $signed(wire36[(3'h4):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      reg38 <= (~|wire31[(1'h0):(1'h0)]);
      reg39 <= reg37[(4'h9):(2'h3)];
      reg40 <= ((($signed(wire32[(2'h3):(2'h2)]) ?
                  wire34[(3'h7):(2'h3)] : ($signed(wire36) ?
                      (wire32 ? wire36 : wire36) : (reg39 ~^ wire35))) ?
              (~$unsigned(wire32)) : (&$signed(wire36[(2'h3):(2'h3)]))) ?
          $unsigned(wire36) : reg39[(3'h7):(3'h6)]);
      if ($signed(reg39))
        begin
          reg41 <= wire33[(1'h1):(1'h1)];
          reg42 <= (-($signed($unsigned(wire35)) * ((!(wire34 << reg40)) > {{wire33}})));
          reg43 <= ({(wire33 ?
                  ((~^reg39) ?
                      (reg37 ? wire34 : wire35) : (wire35 ?
                          reg37 : reg41)) : (~&(wire31 + wire36)))} >> $signed(($signed($unsigned(reg41)) + ((~|wire34) - $signed(wire35)))));
        end
      else
        begin
          reg41 <= ((|wire33) * ($signed(wire35[(3'h5):(1'h0)]) ?
              {(!(reg38 <<< wire36)), wire33[(2'h2):(1'h1)]} : reg37));
          reg42 <= $unsigned($signed(reg43[(2'h3):(1'h0)]));
          reg43 <= (^~$signed($unsigned(($signed(reg41) ?
              wire34[(3'h5):(2'h2)] : {wire31}))));
        end
    end
  always
    @(posedge clk) begin
      reg44 <= wire31[(2'h2):(2'h2)];
      reg45 <= (&((reg39 ?
          $unsigned({reg39}) : $unsigned(reg39)) & $signed(($signed((8'hb1)) ^ {wire35,
          reg44}))));
    end
  assign wire46 = {$signed(($unsigned((&reg44)) ?
                          (^(~^reg45)) : {$unsigned((7'h41)), reg42}))};
  assign wire47 = $signed(wire31[(2'h2):(1'h1)]);
  assign wire48 = $signed($unsigned((reg42[(4'h8):(3'h7)] ?
                      $unsigned((reg38 ?
                          reg45 : reg39)) : $signed($signed(wire34)))));
  assign wire49 = ($signed((~^$signed($signed(wire33)))) ?
                      reg41[(1'h0):(1'h0)] : (~&wire34[(1'h1):(1'h0)]));
  assign wire50 = $signed((((((8'ha6) ? wire34 : reg40) - (^wire46)) ?
                          reg41[(2'h2):(1'h0)] : $signed(((8'h9f) ^ wire49))) ?
                      (^((wire33 ? wire47 : wire49) ?
                          {reg44} : $unsigned(wire34))) : $unsigned(reg44[(4'h8):(2'h2)])));
  assign wire51 = $signed($unsigned(($signed((~(8'ha9))) ?
                      $unsigned(reg43[(2'h3):(1'h0)]) : reg45[(4'h9):(2'h2)])));
  assign wire52 = (8'hae);
  assign wire53 = ($unsigned((((reg39 ? reg45 : reg40) ?
                          $unsigned((8'hae)) : (wire51 ?
                              wire46 : wire47)) != (reg43 ?
                          ((8'haf) != wire35) : reg40))) ?
                      (8'ha8) : wire32[(3'h4):(1'h1)]);
  assign wire54 = ((wire48 ?
                          ($unsigned((reg44 ~^ wire33)) || (^~$signed(wire47))) : $unsigned(wire32[(3'h4):(1'h0)])) ?
                      $unsigned({((&(8'hb1)) ?
                              (reg45 >> (8'ha6)) : $unsigned(reg45))}) : ($unsigned({(wire34 >= wire33)}) - wire33[(2'h2):(2'h2)]));
endmodule
