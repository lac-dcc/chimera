module top
#(parameter param54 = ((~&({((8'ha8) ? (8'ha4) : (8'hbb))} ? (((8'ha5) ? (8'hb8) : (8'ha9)) ? ((8'hb3) << (8'hb5)) : (8'hbb)) : (!((8'ha7) <<< (8'ha3))))) ? (^~(!(|((8'ha4) ? (8'hb6) : (8'hba))))) : (((8'hb7) * (8'hb9)) >= ((((8'hab) - (8'h9d)) <<< {(8'h9d), (8'ha0)}) == (((8'hba) >= (8'haa)) ? (+(8'ha5)) : {(8'hb3)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire50,
                 wire24,
                 wire23,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (|$unsigned(((((8'hb7) ? wire0 : wire0) ?
          (wire2 ? wire3 : wire1) : $signed(wire3)) <<< ((wire2 ?
              wire2 : wire3) ?
          $signed(wire0) : (wire0 ? wire1 : wire2)))));
      if ($unsigned(($signed(wire2) ?
          reg4[(3'h5):(1'h0)] : ($unsigned({wire1, wire1}) ?
              ($unsigned(wire0) != {wire3}) : wire0))))
        begin
          if ((((wire0 >>> ($signed((8'hbe)) ? (reg4 ? reg4 : wire1) : wire0)) ?
              $signed((wire2[(4'ha):(3'h7)] ?
                  (~^(8'haa)) : $unsigned(wire3))) : {$unsigned(wire2[(3'h5):(1'h0)]),
                  $signed(wire2[(4'hf):(3'h6)])}) ~^ $unsigned($signed({$signed((7'h43)),
              {wire3, wire3}}))))
            begin
              reg5 <= ((~&(((reg4 ?
                      wire1 : reg4) || $unsigned(wire0)) && (~&(reg4 ?
                      wire0 : (8'ha6))))) ?
                  {((7'h41) ^ (wire1[(4'h8):(1'h0)] ?
                          (^~wire3) : $unsigned(wire2)))} : (^~{((~|wire0) >>> $signed((8'hb3)))}));
            end
          else
            begin
              reg5 <= {$signed((~|$signed($unsigned(wire2)))),
                  ($signed(wire2) - (({(8'hbe)} ?
                          $signed(wire2) : $signed(wire3)) ?
                      wire3[(2'h2):(1'h1)] : $signed(wire2[(4'h8):(2'h2)])))};
            end
          reg6 <= $signed(($signed(({wire1, wire1} || (wire3 - reg5))) ?
              (8'h9f) : (((+wire1) ?
                  (-reg5) : {wire0, wire2}) >>> (reg4 ^~ wire0))));
          reg7 <= (^(~&(~|(wire2 ? (reg6 ? (8'hbf) : wire0) : (8'hbe)))));
        end
      else
        begin
          reg5 <= (~&$unsigned(((wire1[(3'h5):(1'h1)] * (wire1 ?
                  reg5 : (8'hb5))) ?
              reg6[(2'h3):(2'h3)] : {reg5[(5'h10):(3'h5)], (+wire1)})));
          reg6 <= $signed((reg5 * ($unsigned($unsigned(wire2)) ?
              wire0[(5'h13):(4'h8)] : wire3[(4'h8):(4'h8)])));
          reg7 <= $signed((8'haa));
          reg8 <= ({((|$signed(reg6)) ^~ $signed($signed(wire2)))} < $unsigned(wire1));
          reg9 <= wire1[(5'h10):(3'h5)];
        end
      if ($unsigned(reg6))
        begin
          reg10 <= reg8;
          reg11 <= $signed((($unsigned($unsigned(reg7)) <<< {reg10}) ?
              $unsigned($signed((&reg8))) : ($unsigned($unsigned(reg8)) ?
                  reg9 : $unsigned(reg6[(1'h1):(1'h1)]))));
          reg12 <= $signed(wire0);
        end
      else
        begin
          reg10 <= $signed((reg4[(4'he):(1'h1)] > reg5));
          if (($unsigned((+wire2[(3'h4):(1'h1)])) ?
              $unsigned((-$unsigned(wire3[(3'h4):(1'h0)]))) : (wire3 + (8'haa))))
            begin
              reg11 <= $signed((+reg8));
              reg12 <= (!reg8);
              reg13 <= $unsigned(reg6[(3'h5):(1'h1)]);
              reg14 <= $signed(((($unsigned(wire3) + (reg10 <<< wire0)) ?
                      ((reg7 << (8'ha2)) ?
                          {wire1,
                              reg4} : reg12[(5'h14):(4'hf)]) : (~|(^~reg5))) ?
                  (-(reg8[(3'h5):(3'h4)] ?
                      (8'h9c) : (wire0 ?
                          reg10 : wire3))) : $unsigned(((wire2 > (8'hb5)) || (^reg6)))));
            end
          else
            begin
              reg11 <= ($signed(wire1[(4'h8):(3'h6)]) >> ((reg4 ?
                      (^$unsigned(wire3)) : (~reg13[(3'h7):(2'h2)])) ?
                  ($unsigned(wire0) && wire3[(3'h5):(1'h1)]) : (8'ha1)));
              reg12 <= (((wire0 << wire2[(3'h5):(1'h1)]) ~^ $signed(((reg12 <<< reg5) ?
                  {wire0, reg7} : {reg5}))) && (reg13[(2'h2):(2'h2)] * reg14));
              reg13 <= {$signed(reg9),
                  $signed(({$unsigned((8'ha4)), $unsigned(reg8)} ?
                      ($signed((8'ha9)) ?
                          $unsigned(reg12) : (reg8 ?
                              reg4 : reg11)) : (8'hbf)))};
              reg14 <= wire3[(2'h3):(2'h3)];
            end
          reg15 <= $unsigned($signed((({(8'haa), (7'h44)} ?
              (reg6 ? wire0 : reg7) : $signed(wire1)) >= ((~|reg5) ?
              reg11 : wire3))));
          reg16 <= (^~(reg6 || (~^reg7[(4'hc):(1'h1)])));
          if ($signed((({(reg13 ? reg16 : reg13),
                  reg8[(3'h5):(3'h4)]} > reg11) ?
              $signed($unsigned((~wire3))) : (wire1 | $unsigned($signed(reg8))))))
            begin
              reg17 <= (8'hb2);
              reg18 <= $unsigned(((reg12[(5'h12):(4'hf)] >= $unsigned($unsigned(reg6))) > $unsigned({$unsigned(reg12)})));
              reg19 <= {$signed(($unsigned($signed(reg13)) ?
                      $signed(reg14[(4'hc):(3'h5)]) : (7'h40)))};
              reg20 <= $signed(($signed((reg13[(3'h6):(1'h1)] ?
                      reg5 : ((8'hba) ? reg13 : reg13))) ?
                  (^($unsigned((8'hba)) ?
                      $signed(reg16) : reg19[(2'h2):(1'h0)])) : (8'hba)));
            end
          else
            begin
              reg17 <= ($signed(reg9) ?
                  $signed($signed(($unsigned(reg6) ?
                      reg7[(3'h4):(2'h3)] : $signed(wire3)))) : $unsigned((((reg15 ?
                          reg12 : reg10) ?
                      reg18[(4'hb):(1'h0)] : {reg10,
                          (8'haa)}) ^~ ((8'hac) + $signed(reg5)))));
              reg18 <= $signed($unsigned((~reg14)));
              reg19 <= $unsigned((wire3 ?
                  ({reg4} ?
                      ($unsigned(reg20) ?
                          (^(8'ha6)) : $signed(reg19)) : $signed((reg19 ?
                          reg7 : reg10))) : $signed($signed({wire0}))));
              reg20 <= {((reg11[(1'h1):(1'h0)] ^~ (&{wire3, reg13})) ?
                      $signed($signed($unsigned(reg17))) : (^(reg18 ?
                          wire0[(5'h14):(4'hf)] : {reg6}))),
                  $unsigned(reg5[(4'h9):(1'h1)])};
              reg21 <= (wire1[(3'h6):(2'h2)] ?
                  wire2 : {($unsigned((!reg7)) ?
                          (reg5[(4'h8):(3'h7)] ?
                              wire0[(4'h9):(3'h4)] : (reg14 ?
                                  reg15 : reg18)) : $unsigned(((8'hbc) ?
                              reg6 : (8'hbb))))});
            end
        end
      reg22 <= $unsigned(reg12[(4'hf):(3'h5)]);
    end
  assign wire23 = ($signed($signed(reg6[(3'h5):(2'h2)])) ?
                      (~&($signed((reg13 | wire2)) ?
                          (reg19 || wire2[(5'h12):(3'h7)]) : $signed(reg4))) : ($signed($unsigned(reg4)) ?
                          $unsigned($unsigned($unsigned(reg16))) : $unsigned($signed((~&reg19)))));
  assign wire24 = {(~wire0[(5'h13):(5'h11)]),
                      ($unsigned($signed($unsigned(reg4))) ?
                          reg4[(2'h3):(2'h2)] : wire2)};
  module25 #() modinst51 (.y(wire50), .wire27(reg12), .wire29(reg11), .wire26(reg20), .clk(clk), .wire28(reg22));
  assign wire52 = {(!({$signed(reg8),
                          {reg14}} >>> $signed($unsigned((8'h9e))))),
                      $unsigned($unsigned(($unsigned((8'ha0)) ?
                          $unsigned((8'hbc)) : (+reg12))))};
  assign wire53 = $unsigned(((+{(reg11 >> reg9), (reg11 >> reg22)}) ?
                      ($signed(wire0) ?
                          $unsigned(reg14[(4'h9):(4'h9)]) : (^~reg14[(4'hc):(1'h1)])) : reg14[(3'h5):(1'h0)]));
endmodule

module module25
#(parameter param49 = (((((^(7'h43)) << ((8'h9d) ? (8'hbd) : (8'hb5))) ~^ ((-(8'hba)) > ((8'hb8) - (8'hbb)))) ? (~|(((8'ha3) ~^ (8'ha5)) ? ((8'haa) * (8'ha4)) : ((8'hb7) != (8'ha1)))) : ((((8'hb6) ^~ (8'hb6)) ? (&(8'had)) : ((8'h9f) ? (8'ha0) : (8'hb6))) ~^ ({(8'hab)} ? ((8'haf) ? (8'hb3) : (8'hb0)) : ((7'h40) ? (8'ha4) : (8'hb6))))) ? (({((7'h44) + (8'hb7))} <<< (~^(!(8'ha9)))) << {(~((7'h43) ? (8'ha2) : (8'hab))), (~|((8'hbb) ? (7'h44) : (8'h9f)))}) : (({(8'hae), ((8'hb3) > (8'hb6))} >>> ((!(7'h43)) - ((8'hb3) ? (8'hb5) : (8'hbf)))) > (({(8'hba)} >> (&(8'ha4))) > (-(~^(8'ha2)))))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire29;
  input wire [(4'hb):(1'h0)] wire28;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire signed [(4'ha):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  assign y = {wire48,
                 wire37,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
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
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire30 = ($unsigned(wire28[(2'h2):(1'h1)]) ?
                      ($unsigned(wire29[(2'h3):(2'h3)]) ?
                          {((~&wire28) ? $unsigned(wire28) : $signed(wire28)),
                              (wire28[(1'h0):(1'h0)] | wire26)} : $signed({{wire26,
                                  wire29},
                              (wire28 | wire27)})) : (wire26[(3'h6):(3'h4)] | (~|($unsigned(wire27) ?
                          wire27[(2'h2):(2'h2)] : (&wire26)))));
  assign wire31 = ((wire26 ?
                      ({((8'ha7) <<< wire26)} >= (~(wire29 >>> wire30))) : $signed({wire30})) - $unsigned(wire28));
  assign wire32 = (8'h9d);
  assign wire33 = ((^~$signed(wire28[(3'h4):(2'h3)])) == (wire29[(4'h9):(3'h5)] ?
                      $unsigned((wire27 ?
                          wire29[(3'h5):(1'h0)] : (~|wire30))) : $signed(wire31[(4'h9):(4'h8)])));
  assign wire34 = {$signed((wire33 >> ((-wire32) ? wire32 : wire30))),
                      {(((wire31 | wire29) ?
                                  (wire26 ?
                                      (8'hb0) : wire29) : (wire30 > wire31)) ?
                              $unsigned(wire31) : $unsigned(wire30))}};
  always
    @(posedge clk) begin
      reg35 <= $signed(wire28[(3'h5):(1'h1)]);
      reg36 <= $unsigned((wire31 >> (8'ha4)));
    end
  assign wire37 = (((((~wire28) & wire34[(1'h0):(1'h0)]) <= (8'hbb)) > (8'ha1)) << $unsigned((&(~^$signed(wire32)))));
  always
    @(posedge clk) begin
      reg38 <= $unsigned($unsigned($signed(reg36)));
      if ((~wire27))
        begin
          reg39 <= (wire32[(1'h0):(1'h0)] ?
              $signed(((^~(wire32 ? wire30 : wire27)) ?
                  wire37[(4'h8):(3'h4)] : $signed((wire27 ?
                      wire26 : (8'hab))))) : ((8'hb9) * (-((wire26 || reg38) ?
                  (reg36 & wire33) : (wire32 & wire30)))));
        end
      else
        begin
          reg39 <= ($unsigned((($unsigned(wire28) ?
                  $unsigned(wire31) : $unsigned(reg39)) ?
              ((wire34 & wire34) >= (wire30 ?
                  wire34 : wire37)) : {(^reg36)})) ^ (^(((wire27 ?
                  wire37 : reg39) ?
              reg38 : wire37) && (|wire31))));
          reg40 <= wire30[(4'hf):(3'h5)];
        end
      reg41 <= (!((($unsigned(wire30) ?
              (wire33 ? wire33 : (8'ha9)) : (reg36 <<< wire29)) ?
          (&(8'hac)) : (8'ha8)) && ((-$signed(wire30)) <= reg40)));
      if (wire28)
        begin
          reg42 <= $signed((8'ha8));
          reg43 <= reg42[(1'h0):(1'h0)];
          reg44 <= $unsigned($unsigned(reg41));
          reg45 <= wire32[(2'h3):(1'h1)];
        end
      else
        begin
          reg42 <= ((8'ha8) * (-$unsigned($signed((reg41 ? wire32 : reg42)))));
          reg43 <= wire27;
        end
      reg46 <= reg35;
    end
  always
    @(posedge clk) begin
      reg47 <= (reg35 ?
          wire28[(2'h2):(1'h1)] : $signed((-(((8'ha3) >= wire31) >> wire32))));
    end
  assign wire48 = (!(8'ha4));
endmodule
