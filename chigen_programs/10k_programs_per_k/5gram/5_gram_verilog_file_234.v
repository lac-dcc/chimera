// Seed: 1501898349
module module_0 (
    input wire id_0,
    input wand id_1,
    input tri0 id_2,
    input uwire id_3,
    input supply0 id_4,
    input uwire id_5,
    output wire id_6,
    input tri0 id_7,
    input wor id_8,
    input wand id_9,
    output uwire id_10,
    output supply1 id_11,
    input supply0 id_12
);
  wire id_14;
  assign module_1.type_16 = 0;
endmodule
module module_1 (
    input wand id_0,
    output logic id_1,
    output uwire id_2,
    output tri1 id_3,
    input wor id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri id_7,
    output tri1 id_8,
    input logic id_9,
    output supply1 id_10,
    input wand id_11,
    input logic id_12
);
  wire id_14;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_6,
      id_7,
      id_5,
      id_11,
      id_10,
      id_5,
      id_4,
      id_6,
      id_10,
      id_3,
      id_4
  );
  always @(id_9 or posedge id_12) begin : LABEL_0
    id_1 <= id_9;
  end
endmodule
