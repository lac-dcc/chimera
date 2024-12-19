// Seed: 2842414392
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge 1) begin : LABEL_0
    assign id_3 = 1'b0;
    for (id_4 = id_7; id_6; id_3 += id_4) begin : LABEL_0
      if (1'd0) id_1 <= 1'b0;
    end
  end
  wire id_9;
  always @(id_8 or posedge id_8)
    if (id_2) assign id_8 = 1;
    else begin : LABEL_0
      id_1 <= id_5;
    end
endmodule
module module_1 (
    input  tri0 id_0,
    output tri  id_1
);
  id_3(
      .id_0(1), .id_1(1)
  );
  wire id_4;
  wire id_5;
  reg  id_6;
  always @* begin : LABEL_0
    id_6 <= 1;
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5
  );
  assign modCall_1.id_5 = 0;
  wire id_7, id_8;
  wire id_9;
endmodule
