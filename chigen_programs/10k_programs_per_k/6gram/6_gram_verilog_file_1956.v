// Seed: 2065359323
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input supply0 id_2
);
  logic id_4;
  assign module_1.id_1 = 0;
  assign id_4 = {id_2, -1};
endmodule
module module_1 (
    input  tri   id_0,
    input  uwire id_1,
    output logic id_2
);
  always id_2 <= #id_1 id_0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1
  );
endmodule
module module_2 (
    input supply1 id_0,
    output supply1 id_1,
    input tri id_2,
    input wand id_3,
    output uwire id_4,
    input uwire id_5,
    input wire id_6,
    input wand id_7,
    output logic id_8
);
  always repeat (id_0) id_8 <= id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
