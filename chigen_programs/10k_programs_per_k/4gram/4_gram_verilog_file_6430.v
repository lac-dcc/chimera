// Seed: 2060741770
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input tri id_2,
    input wor id_3
    , id_10,
    input tri0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input uwire id_7,
    input tri1 id_8
);
  assign module_1.id_0 = 0;
  assign id_10[""] = 1'b0;
  wire [-1 : 1] id_11;
  struct packed {
    id_12 id_13;
    logic [1 : 1] id_14;
  }
      id_15, id_16, id_17, id_18, id_19 = id_4 | id_15 & (-1), id_20, id_21;
  assign id_15 = id_19 ? id_21 : id_16 - id_0;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    input wire id_2,
    input tri0 id_3,
    output tri0 id_4,
    input supply0 id_5,
    output uwire id_6,
    output wire id_7
);
  logic id_9;
  ;
  assign id_6 = 1;
  wire id_10;
  parameter id_11 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_1,
      id_3,
      id_1,
      id_5,
      id_5,
      id_2
  );
endmodule
