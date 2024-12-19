// Seed: 3138350205
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = 1'b0;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_5 = 1;
  always @(posedge (1))
    if (id_5) begin : LABEL_0
      id_5 <= {id_4};
      if (1)
        if (1) begin : LABEL_0
          {1, id_4, id_3, !id_1, id_1, id_3, id_6, id_4} <= 1;
        end
    end
  module_0 modCall_1 (
      id_2,
      id_2
  );
  reg id_7 = id_4, id_8;
  always_ff @(posedge id_3) begin : LABEL_0
    id_7 = 1;
  end
  assign id_8 = 1;
endmodule
