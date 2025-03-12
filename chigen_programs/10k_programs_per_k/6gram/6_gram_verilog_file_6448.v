// Seed: 3550520770
module module_0 (
    output wor id_0
    , id_15,
    output supply0 id_1,
    input supply0 id_2,
    output wor id_3,
    input wire id_4,
    input supply0 id_5,
    output tri0 id_6,
    input wire id_7,
    output supply1 id_8,
    input supply1 id_9,
    input wire id_10,
    input tri0 id_11,
    input tri0 id_12,
    input tri0 id_13
);
endmodule
module module_1 #(
    parameter id_5 = 32'd27
) (
    output logic id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    output tri1 id_4,
    input tri0 _id_5,
    output tri id_6,
    output logic id_7
);
  logic [7:0] id_9;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_3,
      id_6,
      id_3,
      id_1,
      id_6,
      id_2,
      id_4,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.id_10 = 0;
  assign id_4 = -1;
  assign id_7 = -1'b0;
  assign id_4 = 1;
  bit id_10;
  always @(id_9) begin : LABEL_0
    if (1 == 1 && -1'b0) begin : LABEL_1
      id_9[id_5 :-1] = id_1;
      id_10 <= -1;
      for (id_4 = id_1; 1; id_7 = -1) begin : LABEL_2
        id_7 = id_10 == id_9[!id_5 : id_5];
      end
    end else id_0 <= -1'b0 >> id_9;
  end
  always @(negedge id_1) force id_4 = -1'b0;
endmodule
