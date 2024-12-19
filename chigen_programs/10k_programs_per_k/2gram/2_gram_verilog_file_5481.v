// Seed: 2491616031
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  supply1 id_4 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34,
    id_35,
    id_36,
    id_37,
    id_38,
    id_39,
    id_40,
    id_41,
    id_42,
    id_43,
    id_44,
    id_45,
    id_46
);
  inout wire id_46;
  output wire id_45;
  output wire id_44;
  output wire id_43;
  output wire id_42;
  input wire id_41;
  input wire id_40;
  output wire id_39;
  output wire id_38;
  inout wire id_37;
  output wire id_36;
  output wire id_35;
  input wire id_34;
  input wire id_33;
  output wire id_32;
  input wire id_31;
  inout wire id_30;
  input wire id_29;
  inout wire id_28;
  inout wire id_27;
  input wire id_26;
  input wire id_25;
  inout wire id_24;
  output wire id_23;
  inout wire id_22;
  output wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always begin : LABEL_0
    id_22 <= id_11 & (1) & id_12 - 1;
    if (~id_25)
      fork : SymbolIdentifier
        if (1'h0) begin : LABEL_0
          id_12 = id_10[1-1];
          id_35 <= id_41;
        end
      join
  end
  assign id_19 = 1;
  assign id_24 = id_4;
  assign id_27 = id_10;
  tri0 id_47;
  assign id_30 = 1;
  if (1 === (1 & id_26 ? 1 : 1)) begin : LABEL_0
    assign id_13 = 1;
    assign id_7  = ~id_34;
    assign id_30 = 1'b0;
    assign id_6  = 1'h0 == id_6;
    id_48(
        .id_0(1), .id_1(id_32)
    );
    assign id_15 = 1;
  end else
    id_49 :
    assert  property  (  @  (  posedge  id_8  or  negedge  id_34  <->  id_31  [  1 'd0 :  1  ]  &  1 'b0 ?  id_18  :  id_37  )  id_40  )
    else;
  wand id_50 = id_47 ^ id_37 ^ id_11 ^ 1;
  module_0 modCall_1 (
      id_44,
      id_37,
      id_37
  );
endmodule
