// Seed: 2522088315
module module_0 (
    input supply0 id_0,
    input tri1 id_1
);
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input uwire id_2,
    input wand id_3,
    output uwire id_4,
    input uwire id_5,
    output wire id_6,
    input wand id_7,
    output supply1 id_8,
    input tri0 id_9,
    input wire id_10
);
  module_0 modCall_1 (
      id_2,
      id_7
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  assign id_1 = id_3;
  supply0 id_8;
  always begin : LABEL_0
    id_1[1] <= 1;
  end
  wire id_9;
  module_2 modCall_1 (
      id_4,
      id_9,
      id_5,
      id_9
  );
  initial id_8 = 1'b0;
endmodule
