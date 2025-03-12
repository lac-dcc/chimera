// Seed: 2822326287
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    output supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wire id_7
);
  always #1 $signed(73);
  ;
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri0 id_1,
    input  wand id_2,
    output tri0 id_3
);
  wire id_5;
  nor primCall (id_3, id_0, id_2, id_1);
  wire id_6;
  ;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_3,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
module module_2 (
    input  tri   id_0,
    output logic id_1,
    input  wor   id_2,
    input  tri   id_3,
    output tri1  id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_4,
      id_4,
      id_3,
      id_3,
      id_3
  );
  always_ff @(posedge -1 or posedge -1) begin : LABEL_0
    id_1 = -1;
  end
endmodule
