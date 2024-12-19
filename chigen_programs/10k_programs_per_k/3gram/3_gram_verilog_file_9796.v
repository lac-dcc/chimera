// Seed: 3196689932
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 id_5 = 1;
  assign module_1.id_15 = 0;
  id_6(
      .id_0(1), .id_1(id_3), .id_2(1'b0), .id_3(id_1), .id_4(~1'h0), .id_5(id_1 == 1)
  );
  wire id_7;
  wire id_8, id_9;
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    output wor id_3,
    input supply0 id_4,
    output tri0 id_5
    , id_17,
    input tri id_6,
    input supply0 id_7,
    output wire id_8,
    output tri1 id_9,
    input uwire id_10,
    output wor id_11,
    output tri0 id_12
    , id_18,
    output tri id_13
    , id_19,
    input wor id_14,
    input supply0 id_15
    , id_20
);
  assign id_13 = id_1;
  uwire id_21 = id_6;
  id_22 :
  assert property (@(posedge id_15) id_4)
  else begin : LABEL_0
    return 1;
  end
  module_0 modCall_1 (
      id_20,
      id_17,
      id_20,
      id_19
  );
  wire id_23, id_24;
endmodule
