// Seed: 2551549836
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_6 = 1;
  end
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1
);
  wire id_3;
  wire id_4 = id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_10;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_10,
      id_5,
      id_6
  );
  assign id_10 = id_1;
  and primCall (id_6, id_1, id_8, id_3, id_10, id_7, id_2, id_5, id_4);
endmodule
