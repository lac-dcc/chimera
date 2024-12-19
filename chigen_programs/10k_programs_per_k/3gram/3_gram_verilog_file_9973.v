// Seed: 3573419725
module module_0 (
    input wire id_0,
    input tri1 id_1
);
  wor id_3;
  reg id_4;
  genvar id_5;
  wire id_6;
  always @(posedge 1) begin : LABEL_0
    wait (id_5);
  end
  assign id_3 = id_1;
  initial begin : LABEL_0
    id_4 <= id_4;
  end
  always @(id_0 or posedge id_0) begin : LABEL_0
    `define pp_7 0
  end
  wire id_8;
  integer id_9 = id_6;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri1  id_1,
    input  logic id_2,
    input  tri   id_3,
    output tri   id_4,
    input  uwire id_5,
    input  uwire id_6
);
  always @(negedge 1) begin : LABEL_0
    id_4 = ~id_3;
    if (1) begin : LABEL_0
      if (id_6)
        if (1'h0) disable id_8;
        else id_8 <= id_2;
      id_8 <= "";
    end else begin : LABEL_0
      if (id_2) $display(id_6);
    end
  end
  module_0 modCall_1 (
      id_1,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
