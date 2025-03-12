// Seed: 2338738264
module module_0 (
    input wand module_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wor id_5,
    output logic id_6,
    input supply1 id_7
);
  parameter id_9 = 1;
  assign id_6 = id_1;
  generate
    assign id_6 = id_0;
    always #1 id_6 <= 1;
  endgenerate
endmodule
module module_0 (
    input tri1 id_0,
    input supply0 module_1,
    output wire id_2,
    output logic id_3,
    input wand id_4,
    input supply1 id_5,
    input tri1 id_6,
    input wor id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_6,
      id_0,
      id_7,
      id_5,
      id_3,
      id_7
  );
  assign modCall_1.id_6 = 0;
  always @(posedge -1'd0) begin : LABEL_0
    id_3 <= -1;
  end
  xor primCall (id_3, id_4, id_0, id_5, id_9);
endmodule
