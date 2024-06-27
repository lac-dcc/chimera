module module_0 (
    output [id_1[1 'b0] : id_1[id_1]] id_2,
    id_3,
    input logic [id_2 : id_1[id_2]] id_4
);
  assign id_2[id_4] = id_3;
  logic id_5 (
      .id_4(id_3),
      ~id_3[id_1]
  );
  assign id_2[1] = 1;
  always @(posedge id_4)
    if (id_5) begin
      if (id_4[id_3[1'b0]]) begin
        id_4[1] <= 1;
      end
    end else if ({1{1}}) begin
      id_6[id_6] <= id_6;
    end
  id_7 id_8 (
      .id_9(id_7),
      .id_7(id_7),
      .id_6(id_6[~(id_6[1'h0])]),
      .id_7(id_7),
      .id_7(id_6),
      .id_9(id_6)
  );
  id_10 id_11 (
      .id_7 (id_8),
      .id_8 (id_8 | id_6),
      .id_9 (1'b0),
      .id_10(1),
      .id_9 (1),
      .id_9 (1)
  );
  logic id_12;
  input [1 : 1] id_13;
  logic id_14;
  id_15 id_16 (
      .id_9 (1),
      id_10 + id_8,
      .id_10(id_14[1])
  );
  logic id_17;
  logic id_18 (
      id_14,
      id_16[~id_15]
  );
  id_19 id_20 (
      .id_18(id_15),
      .id_19(id_19),
      .id_21(id_9)
  );
  id_22 id_23 (
      .id_8 (1),
      .id_21(1)
  );
  logic id_24 (
      .id_21(id_19[""]),
      .id_16(id_9),
      .id_6 (id_21),
      .id_11(id_14),
      1
  );
  id_25 id_26 (
      .id_23(id_9 & id_17 & id_15[1] & id_12 & id_17),
      .id_12(1),
      .id_19(id_23)
  );
  id_27 id_28 (
      .id_17(id_18),
      .id_21(id_10)
  );
  assign id_11 = ~id_18;
  logic id_29 (
      .id_22(id_17),
      id_17
  );
  assign id_9 = id_29;
  logic [(  id_10  ===  id_25  ) : 1] id_30 (
      .id_29(id_19),
      .id_11(1),
      .id_16(id_10),
      .id_10(id_21),
      1'd0,
      .id_27(1),
      .id_13(id_29),
      .id_8 (id_28)
  );
  id_31 id_32 (
      .id_26(id_14),
      .id_7 (1),
      .id_30(1),
      .id_16(id_30),
      .id_24(1'b0)
  );
  logic id_33 (
      .id_20(1),
      id_12
  );
  assign  id_20  [  id_13  ]  =  id_18  [  id_21  [  id_16  &  id_30  ]  ]  ?  id_8  :  id_16  &  id_22  ?  id_16  [  id_14  [  id_32  :  id_14  ]  :  id_22  ]  :  id_9  ?  ~  id_28  :  1  ?  id_28  :  id_11  ;
  id_34 id_35 (
      id_30,
      .id_19(id_12),
      .id_6 (1'b0),
      .id_21(1),
      .id_7 (1)
  );
  assign id_14 = id_33[id_6];
  logic id_36;
  always @(posedge id_31 or posedge id_17[1]) begin
    id_11 <= 1'b0;
  end
  input id_37;
  id_38 id_39 (
      .id_38(id_37[~id_38]),
      .id_40(1 & 1 & id_37 & 1 & 1 & id_38[id_38[(id_37)]] & id_37),
      .id_37(id_40)
  );
  id_41 id_42 (
      .id_40(1),
      .id_40(id_41),
      .id_40(1 & id_41)
  );
endmodule
