// Seed: 1534261971
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output supply1 id_1;
  struct packed {
    logic id_6;
    id_7  id_8;
  } [1 : 1] id_9;
  ;
  logic id_10, id_11;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_3,
      id_4,
      id_5
  );
  inout wire id_2;
  input wire id_1;
  wire id_6;
endmodule
