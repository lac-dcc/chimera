// Seed: 3627010155
module module_0 (
    input tri1 id_0,
    input wire id_1,
    output wand id_2,
    input supply1 id_3,
    input wire id_4,
    output tri1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    output wand id_8,
    output uwire id_9
);
  assign id_5 = 1'b0;
  assign module_1.id_4 = 0;
  assign id_2 = id_1;
  wire id_11;
  if (id_3) begin : LABEL_0
    wire id_12;
    always assign id_11 = 1'b0;
  end
  wire id_13;
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    input tri1 id_2,
    output logic id_3,
    output uwire id_4,
    input logic id_5
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1
  );
  always_latch id_3 <= {id_5{"" + id_5}};
endmodule
