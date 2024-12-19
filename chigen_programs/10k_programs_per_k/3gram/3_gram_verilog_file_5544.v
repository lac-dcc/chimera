// Seed: 3496521772
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input tri id_2,
    input wor id_3,
    input tri id_4,
    input tri1 id_5,
    output uwire id_6,
    input wor id_7,
    input supply1 id_8,
    input tri1 id_9,
    output tri1 id_10
);
  initial begin : LABEL_0
    id_6 = id_8;
  end
  id_12(
      .id_0(),
      .id_1(1),
      .id_2(1),
      .id_3(id_5 == 1),
      .id_4(1),
      .id_5(id_5),
      .id_6(1'b0),
      .id_7(id_13),
      .id_8(1),
      .id_9(1),
      .id_10(1),
      .id_11(1),
      .id_12(1),
      .id_13(id_4),
      .id_14(1'b0),
      .id_15(1),
      .id_16(1),
      .id_17(id_2),
      .id_18(),
      .id_19(1)
  );
  tri  id_14 = id_0;
  wire id_15;
endmodule
program module_1 (
    output uwire   id_0,
    output logic   id_1,
    input  supply0 id_2,
    output supply0 id_3,
    input  supply1 id_4,
    input  supply0 id_5
    , id_7
);
  always @(posedge 1'b0) id_7 <= #id_5 1;
  id_8 :
  assert property (@(posedge 1) 1)
  else begin : LABEL_0
    id_1 = new;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_4,
      id_4,
      id_0,
      id_5,
      id_4,
      id_5,
      id_0
  );
  assign modCall_1.id_6 = 0;
endprogram
