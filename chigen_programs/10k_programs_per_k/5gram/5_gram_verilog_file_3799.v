// Seed: 1031412799
module module_0 (
    input supply1 id_0,
    output tri0 id_1
);
  wire id_3;
  wire id_4, id_5, id_6;
endmodule
module module_0 (
    input  tri   id_0,
    output logic module_1,
    output tri0  id_2,
    input  uwire id_3,
    output tri1  id_4,
    input  tri0  id_5
);
  assign id_4 = id_0;
  tri1 id_7 = 1, id_8;
  module_0 modCall_1 (
      id_0,
      id_7
  );
  assign modCall_1.type_0 = 0;
  reg id_9;
  always @*
    if (1) begin : LABEL_0
      id_1 <= id_9;
    end else begin : LABEL_0
      id_4 = id_3;
      id_4 = {~id_5, {id_7{1'd0}}};
    end
endmodule
