// Seed: 716118275
module module_0 (
    input tri0 id_0,
    input tri  id_1
);
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd71,
    parameter id_9 = 32'd76
) (
    input supply0 id_0,
    input wire id_1,
    output supply1 id_2
);
  wire id_4;
  logic [7:0] id_5;
  tri id_6;
  module_0 modCall_1 (
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
  wire id_7 = id_7;
  generate
    if (id_7) begin : LABEL_0
      assign id_7 = id_4;
      assign id_5[""] = id_4;
    end else begin : LABEL_0
      defparam id_8.id_9 = id_6;
      wire id_10;
    end
  endgenerate
endmodule
