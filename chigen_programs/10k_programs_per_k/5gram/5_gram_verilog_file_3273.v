// Seed: 1782448730
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  uwire id_11 = 1'b0;
endmodule
module module_1 (
    output supply1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    output tri id_3,
    output tri1 id_4,
    input tri0 id_5,
    output uwire id_6,
    output supply0 id_7
);
  supply1 id_9, id_10;
  and primCall (id_1, id_9, id_2, id_5, id_10);
  always @* begin : LABEL_0
    if (1) assert (id_9 || 1 || 1) $display(1 == 1);
  end
  assign id_9 = id_2 ? 1'b0 : 1'b0;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_9,
      id_9,
      id_9,
      id_10,
      id_10,
      id_10,
      id_9
  );
  wire id_11;
endmodule
