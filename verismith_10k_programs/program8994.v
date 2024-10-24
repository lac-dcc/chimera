module top
#(parameter param25 = {(+{({(8'hb3), (8'hb5)} || (&(8'hb4))), (-((8'hb5) ^~ (8'hbd)))}), {((^~((7'h44) ? (7'h40) : (8'hb6))) ? (((8'hae) ? (8'hb4) : (8'ha4)) * ((8'hb6) + (8'ha4))) : (+{(8'hb0), (8'hac)}))}}, 
parameter param26 = (param25 ? ((~&{((8'ha0) ? param25 : param25)}) ? param25 : (7'h42)) : param25))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire9,
                 wire8,
                 wire7,
                 wire5,
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
                 reg12,
                 reg11,
                 reg10,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed(wire4);
  always
    @(posedge clk) begin
      reg6 <= ((wire0 * (~(~|{(8'hb0), wire4}))) & (^~$unsigned(wire2)));
    end
  assign wire7 = ($unsigned($unsigned(reg6)) ?
                     $unsigned($signed((wire2[(2'h2):(1'h1)] ?
                         {wire3} : (7'h43)))) : $unsigned(wire0));
  assign wire8 = ({$unsigned(wire3)} >= $unsigned($unsigned(((wire3 ?
                     wire3 : wire2) << $unsigned((8'hba))))));
  assign wire9 = ((^wire7) ? $unsigned(wire5) : wire8);
  always
    @(posedge clk) begin
      reg10 <= {$signed({wire7, $unsigned((~|wire0))}),
          ($signed((^{wire0, wire5})) ?
              (7'h42) : ((wire8 & wire3) ?
                  $signed(reg6[(1'h0):(1'h0)]) : wire9))};
      reg11 <= {($unsigned($unsigned((reg6 ? wire2 : wire5))) ?
              $signed(reg6) : ($signed($unsigned(wire8)) ?
                  (~^wire2[(4'hb):(2'h3)]) : ((~&reg10) ?
                      (wire4 >> wire9) : wire7[(3'h6):(3'h4)]))),
          ((wire3 | ((8'hb1) ? $signed(reg6) : wire0)) ?
              $signed({(|(7'h43))}) : (~^((8'haf) || reg6[(1'h0):(1'h0)])))};
      reg12 <= (^(wire9[(3'h6):(3'h5)] ~^ wire9[(3'h7):(1'h0)]));
      if ((!((8'h9d) ? wire7 : (~^(&wire4)))))
        begin
          reg13 <= (-$signed(wire1));
          reg14 <= $signed(({{$unsigned(wire7)}} ^ ($unsigned($signed(reg12)) ?
              $signed((&wire1)) : $signed((wire9 ? reg11 : wire4)))));
          reg15 <= (wire8 == {$unsigned($signed((|reg14))),
              (reg13 ?
                  $unsigned((reg14 ?
                      wire3 : reg10)) : $unsigned(wire2[(3'h6):(3'h6)]))});
          reg16 <= $signed(wire5[(1'h1):(1'h1)]);
        end
      else
        begin
          reg13 <= $unsigned((($unsigned((wire1 || (8'hb0))) && reg16) ?
              reg10 : (-(~|$unsigned(wire4)))));
          if ((^$unsigned((((wire9 && wire2) - ((8'hb4) ? reg11 : reg15)) ?
              $signed($unsigned((8'ha1))) : $unsigned($signed(reg10))))))
            begin
              reg14 <= $unsigned(($unsigned(reg10) ?
                  wire1[(1'h0):(1'h0)] : {wire8, reg15}));
              reg15 <= $unsigned($unsigned($signed((^~(reg12 ?
                  reg14 : (8'haf))))));
              reg16 <= (wire5 ?
                  reg14[(4'h9):(4'h9)] : $unsigned((wire7[(2'h3):(2'h2)] ?
                      $unsigned($unsigned(reg6)) : {(wire4 ? wire9 : reg16)})));
              reg17 <= reg13[(3'h6):(1'h0)];
            end
          else
            begin
              reg14 <= wire1;
              reg15 <= reg11[(2'h2):(1'h0)];
              reg16 <= (8'ha0);
            end
          if ($unsigned((wire2 ?
              $unsigned(($unsigned(reg14) ?
                  $signed(reg6) : (8'ha9))) : {(-$signed(wire7))})))
            begin
              reg18 <= ((~^reg12) ?
                  {$signed(($unsigned(wire2) ^ wire0[(3'h4):(2'h2)]))} : $unsigned((|wire0[(3'h6):(2'h3)])));
              reg19 <= wire8[(4'h9):(3'h4)];
              reg20 <= wire2[(3'h7):(1'h0)];
              reg21 <= (~|((^~((+(8'hbd)) >>> wire4)) ?
                  (reg17 ?
                      reg11 : reg18[(3'h4):(2'h3)]) : $unsigned($unsigned((reg6 ?
                      (8'hb2) : (8'hbc))))));
            end
          else
            begin
              reg18 <= ({(+($unsigned((8'ha8)) < (|reg17)))} ?
                  reg13 : (!$unsigned(((wire1 ^~ reg15) ?
                      ((8'haa) ? (8'hbb) : reg12) : $signed(wire3)))));
              reg19 <= wire5;
              reg20 <= reg11[(1'h0):(1'h0)];
              reg21 <= (!(-reg11[(1'h1):(1'h0)]));
            end
          reg22 <= $unsigned(((8'hb9) < ($unsigned(wire9[(3'h5):(3'h4)]) ?
              ($unsigned(reg15) & $unsigned((8'hab))) : ($signed(wire7) ?
                  $unsigned(reg10) : $signed(wire9)))));
          reg23 <= $unsigned(reg13);
        end
      reg24 <= {(&wire2[(3'h4):(1'h1)])};
    end
endmodule
