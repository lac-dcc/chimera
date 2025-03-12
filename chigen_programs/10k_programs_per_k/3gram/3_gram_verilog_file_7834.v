// Seed: 8831208
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output tri1 id_5,
    output tri0 id_6,
    input wand id_7
);
  assign id_0 = -1;
  assign id_2 = -1 + id_4;
  wire id_9;
endmodule
module module_1 (
    input tri0 id_0,
    inout supply1 id_1,
    output tri id_2,
    output logic id_3,
    output supply0 id_4,
    output supply0 id_5,
    output tri0 id_6,
    input supply0 id_7,
    input supply0 id_8,
    input wand id_9
);
  always @(negedge id_7) begin : LABEL_0
    id_3 <= 1;
  end
  wire [1 : ""] id_11;
  parameter id_12 = 1;
  assign id_11 = id_0;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_8,
      id_1,
      id_5,
      id_5,
      id_7
  );
  assign modCall_1.id_3 = 0;
  wire id_13;
  always @(id_1 or posedge id_7);
  parameter time id_14 = id_12;
endmodule
