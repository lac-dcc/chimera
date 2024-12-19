// Seed: 73010409
module module_0;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    output logic id_2,
    input wor id_3,
    input logic id_4,
    input uwire id_5,
    input tri id_6,
    output logic id_7,
    input uwire id_8,
    input tri id_9,
    input supply1 id_10,
    output logic id_11,
    input tri id_12,
    input tri1 id_13,
    input logic id_14
);
  always begin : LABEL_0
    @(posedge id_3 or posedge id_0 & id_6) id_7 <= id_2++;
    id_2 <= 1;
    @(1) begin : LABEL_0
      id_11 <= id_14;
    end
    id_7 <= 1;
    id_7 <= #1 id_4;
  end
  wire id_16;
  module_0 modCall_1 ();
endmodule
