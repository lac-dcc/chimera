// Seed: 3455972398
module module_0 #(
    parameter id_5 = 32'd83,
    parameter id_6 = 32'd7
) ();
  logic [7:0] id_1;
  `define pp_2 0
  initial begin : LABEL_0
    id_1[""] <= ~1 && 1'b0;
  end
  assign `pp_2 = id_1;
  id_3(
      1, `pp_2[1], 1, 1, 1, 1, 1
  );
  wire id_4;
  if (1) begin : LABEL_0
    defparam id_5.id_6 = id_4;
    assign id_1 = id_1;
  end else begin : LABEL_0
    id_7(
        .id_0(1), .id_1(id_1)
    );
  end
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
endmodule
