// Seed: 998236213
module module_0 (
    input wand id_0,
    input uwire id_1,
    input supply1 id_2,
    input uwire id_3,
    output tri id_4,
    input wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    output supply0 id_9,
    input uwire id_10,
    output wand id_11
);
  struct packed {logic id_13;} id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22;
  always begin : LABEL_0
    disable id_23;
  end
  wire id_24;
  logic id_25, id_26;
  logic id_27;
  assign id_22 = 1 == -1;
  logic id_28;
  ;
  assign id_28 = 1;
  assign module_1.id_3 = 0;
  assign id_20 = 1 == "" - -1;
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    input supply0 id_2,
    output supply1 id_3
);
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_3,
      id_1,
      id_2,
      id_1,
      id_2,
      id_3,
      id_1,
      id_3
  );
endmodule
