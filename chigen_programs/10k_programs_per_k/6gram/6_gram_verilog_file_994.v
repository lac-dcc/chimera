// Seed: 3346818106
module module_0 (
    input tri id_0,
    output logic id_1,
    output supply0 id_2
);
  always @*
    if (1) begin : LABEL_0
      id_2 = id_0;
      id_1 <= 1;
      $display;
    end else id_1 = 1;
endmodule
module module_1 (
    output logic id_0,
    output logic id_1,
    input logic id_2,
    input supply1 id_3,
    output tri1 id_4,
    input tri1 id_5,
    input wor id_6,
    input wire id_7,
    input wire id_8,
    inout tri1 id_9
);
  wire id_11;
  assign id_1 = id_5 % id_9;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4
  );
  assign modCall_1.type_0 = 0;
  uwire id_12 = 1 && (1) && id_3;
  xnor primCall (id_1, id_7, id_2, id_5, id_11, id_8, id_6, id_9, id_3);
  always @(posedge id_8 == id_11 or id_3) begin : LABEL_0
    if (id_2) begin : LABEL_0
      #1 id_1 <= 1 == 1;
    end
    if (1) begin : LABEL_0
      id_1 <= 1;
    end else id_0 <= id_2;
  end
endmodule
