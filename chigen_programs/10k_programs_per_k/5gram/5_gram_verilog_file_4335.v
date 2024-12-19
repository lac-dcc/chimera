// Seed: 3525684465
module module_0;
  always @(posedge id_1) begin : LABEL_0
    id_1 <= id_1;
  end
  always_ff @(posedge id_1) begin : LABEL_0
    id_1 <= 1;
  end
  specify
    $setup(negedge id_2, id_3, 1 == 1);
  endspecify
  assign module_1.id_1 = 0;
endmodule
module module_1 ();
  assign id_1 = 1 == 1'b0;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input wor id_0,
    input wire id_1,
    input supply1 id_2,
    output tri id_3,
    input wand id_4,
    input wire id_5,
    input supply1 id_6,
    input supply1 id_7,
    output wire id_8,
    input wire id_9,
    output logic id_10,
    input supply1 id_11
);
  always @(1 | id_1 or posedge id_4) id_10 <= 1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
