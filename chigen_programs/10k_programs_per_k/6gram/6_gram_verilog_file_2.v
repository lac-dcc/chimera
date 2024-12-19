// Seed: 1132148337
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input supply0 id_3
);
  assign module_1.type_0 = 0;
  wire id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18;
  wire id_19;
endmodule
module module_1 (
    input  uwire   id_0,
    input  logic   id_1,
    input  supply0 id_2,
    output logic   id_3
);
  logic id_5, id_6, id_7, id_8 = {id_1, id_1};
  initial id_3 <= id_1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_0
  );
endmodule
