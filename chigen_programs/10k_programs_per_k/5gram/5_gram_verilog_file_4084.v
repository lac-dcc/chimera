// Seed: 1029924278
module module_0 (
    input wor id_0,
    input wor id_1,
    input uwire id_2,
    input uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri id_6,
    input tri id_7,
    input uwire id_8,
    output uwire id_9
);
  logic id_11, id_12, id_13, id_14, id_15, id_16, id_17;
  always @(1 or 1) begin : LABEL_0
    id_15 <= -1;
  end
  always @(negedge -1) begin : LABEL_1
    id_13 = id_1;
  end
  assign module_1.id_2 = 0;
  logic id_18;
  wire id_19, id_20;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    output uwire id_2
);
  logic id_4 = "";
  not primCall (id_2, id_4);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
endmodule
