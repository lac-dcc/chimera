// Seed: 8361409
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_3
  );
endmodule
module module_2 (
    input tri0 id_0,
    inout tri0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    output tri0 id_4,
    output tri id_5,
    output tri id_6,
    output uwire id_7,
    output supply0 id_8,
    output supply1 id_9,
    input tri0 id_10,
    output wire id_11,
    output wire id_12
);
  always @(id_1) id_12 = id_10;
  assign module_3.type_7 = 0;
endmodule
module module_3 (
    input tri0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri id_3,
    output wire id_4,
    output uwire id_5,
    output supply1 id_6,
    input tri id_7,
    output tri0 id_8
    , id_10
);
  final $display(id_1 ==? id_7, id_3);
  module_2 modCall_1 (
      id_10,
      id_10,
      id_1,
      id_1,
      id_4,
      id_5,
      id_6,
      id_10,
      id_10,
      id_8,
      id_1,
      id_4,
      id_5
  );
  id_11(
      !id_4 == 1'b0, 1, 1, {id_3{id_10}}
  );
endmodule
