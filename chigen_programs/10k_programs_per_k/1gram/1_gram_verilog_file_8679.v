// Seed: 2576127058
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  parameter id_3 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd29
) (
    _id_1[id_1 :-1],
    id_2
);
  input wire id_2;
  inout logic [7:0] _id_1;
  logic [7:0][id_1] id_3;
  logic id_4;
  ;
  module_0 modCall_1 (
      id_4,
      id_3
  );
  struct packed {
    struct packed {logic id_5[id_1 : -1 'h0];} id_6;
    id_7  id_8;
    struct packed {id_9 id_10;} id_11;
    logic id_12;
    logic id_13  = -1;
  } id_14;
  ;
endmodule
