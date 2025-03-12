// Seed: 367633951
module module_0 (
    input uwire id_0,
    input tri0  id_1
);
endmodule
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    input  uwire id_2,
    output logic id_3,
    output logic id_4,
    input  wor   id_5,
    output tri0  id_6
);
  always @(1'h0) begin : LABEL_0
    `define pp_8 0
    if (1) begin : LABEL_1
      id_3 = 1'd0;
    end else begin : LABEL_2
      id_4 <= ~id_0;
    end
  end
  module_0 modCall_1 (
      id_0,
      id_5
  );
  assign modCall_1.id_0 = 0;
  wire id_9;
endmodule
