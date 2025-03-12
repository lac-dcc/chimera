// Seed: 3755538791
module module_0 (
    input wor id_0,
    input wor id_1,
    output wire id_2,
    input wire id_3,
    input tri id_4,
    input uwire id_5,
    output wor id_6,
    input supply1 id_7,
    input wor id_8,
    output supply0 id_9
);
  logic id_11;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd19
) (
    output logic id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wire _id_3,
    output wor id_4,
    input supply1 id_5,
    output logic id_6
);
  logic id_8;
  ;
  always @(posedge -1) begin : LABEL_0
    id_0 <= id_8[id_3 :-1];
    if (1) begin : LABEL_1
      id_6 <= id_1;
      assert (id_8);
    end else begin : LABEL_2
      deassign id_8;
    end
  end
  wire id_9;
  assign id_6 = -1;
  logic id_10;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_4,
      id_2,
      id_5,
      id_2,
      id_4,
      id_1,
      id_2,
      id_4
  );
  assign modCall_1.id_7 = 0;
endmodule
