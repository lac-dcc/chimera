// Seed: 3442295153
module module_0 (
    input  wand  id_0,
    output logic id_1
);
  always @(posedge id_1++) id_1 <= 1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    input wand id_2,
    input uwire id_3,
    input tri1 id_4,
    input tri1 id_5,
    output logic id_6,
    input tri1 id_7,
    input wand id_8
);
  always_latch @(posedge -1 && id_3 or posedge id_3 == id_7) begin : LABEL_0
    id_6 = id_7 != 1;
  end
  module_0 modCall_1 (
      id_3,
      id_6
  );
  assign modCall_1.id_1 = 0;
  generate
    always @(posedge "" or posedge 1) id_6 <= id_2;
  endgenerate
endmodule
