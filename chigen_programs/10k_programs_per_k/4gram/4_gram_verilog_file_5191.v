// Seed: 400498891
module module_0 (
    input wand id_0,
    input wire id_1,
    input tri0 id_2,
    input supply0 id_3,
    output tri1 id_4,
    output logic id_5,
    input wor id_6
);
  always_latch @* begin : LABEL_0
    id_5 <= -1 | id_3 - id_6 | id_0;
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd61,
    parameter id_7 = 32'd42
) (
    input  tri1  _id_0,
    input  wire  id_1,
    output wire  id_2,
    output logic id_3,
    output logic id_4,
    output logic id_5
);
  parameter id_7 = 1;
  always @(id_1 or posedge id_1) begin : LABEL_0
    id_3 <= 1 ? id_1 && 1 == 1 : id_0 ? 1 : id_7;
    assume (1);
    id_5 <= id_1;
    release id_2[id_7 : id_0];
    if (1) id_4 = id_1;
    else begin : LABEL_1
      return -1;
    end
    id_3 <= id_7;
    deassign id_4;
    $unsigned(id_7);
    ;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_4,
      id_1
  );
endmodule
