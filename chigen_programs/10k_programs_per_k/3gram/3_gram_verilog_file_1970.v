// Seed: 3430445229
module module_0 (
    input wand id_0,
    output logic id_1,
    output tri0 id_2,
    input tri0 id_3,
    output supply0 id_4,
    output wor id_5,
    output tri0 id_6
);
  always @(posedge id_0) id_1 = #(1) 1'h0;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input wire id_0,
    output tri1 id_1,
    output logic id_2,
    output wor id_3,
    input wire id_4,
    input uwire id_5,
    input tri id_6,
    input supply1 id_7
);
  wor id_9;
  initial
  fork
    id_9 = 1 != !id_9;
    id_2 <= 1 != 1'b0;
  join
  integer id_10 = 1;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_1,
      id_6,
      id_1,
      id_1,
      id_1
  );
  assign id_1 = id_6;
  always @* begin : LABEL_0
    id_3 = id_4;
  end
endmodule
