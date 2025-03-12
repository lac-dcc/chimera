// Seed: 1457787579
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input wire id_2,
    input tri1 id_3,
    input tri id_4,
    input supply1 id_5,
    output wire id_6
);
  assign id_6 = id_0;
  assign id_6 = id_5 | id_5;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    input supply1 id_2,
    output wor id_3,
    input wand id_4,
    output supply1 id_5
);
  assign id_5 = ~id_0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input wire id_0,
    output logic id_1,
    input supply1 id_2,
    output tri1 id_3
);
  logic id_5;
  reg   id_6;
  always @(1 or posedge -1) begin : LABEL_0
    deassign id_5;
    id_6 <= 1;
    disable id_7;
    id_1 <= id_2;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
