// Seed: 98439043
module module_0 (
    input wand id_0,
    input supply0 id_1,
    output logic id_2,
    output logic id_3,
    input wand id_4,
    input wor id_5
);
  always @(-1 or posedge 1) begin : LABEL_0
    id_2 = id_5;
    id_3 = "" + -1 == -1'd0;
  end
  always @(id_5);
  assign id_2 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    output wand id_2,
    output logic id_3,
    output supply1 id_4,
    output supply1 id_5,
    output supply0 id_6,
    input wor id_7
);
  always @(id_7 or posedge -1) begin : LABEL_0
    forever begin : LABEL_1
      id_1 = id_7;
      id_3 <= id_7;
    end
    id_1 = id_7;
  end
  parameter id_9 = 1;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_1,
      id_3,
      id_7,
      id_7
  );
  parameter id_10 = id_9;
endmodule
