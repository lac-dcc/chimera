// Seed: 880256590
module module_0 (
    output wand id_0,
    output supply0 id_1,
    input wire id_2,
    output uwire id_3,
    input wand id_4,
    output tri0 id_5
);
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    output supply1 id_2
);
  specify
    specparam id_4 = id_1;
  endspecify
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_2,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_5 = id_5;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  always @(posedge 1) begin : LABEL_0
    force id_2 = id_4;
  end
  always @(posedge id_3) force id_6 = 1;
  module_2 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1
  );
  initial
  fork
  join_any
endmodule
