// Seed: 3693104504
module module_0 (
    input supply1 id_0,
    input wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    output tri1 id_5,
    output supply0 id_6,
    input wand id_7
);
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    output tri0 id_2,
    output tri id_3,
    input wire id_4,
    input uwire id_5
);
  wire id_7;
  wire id_8;
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_3,
      id_0,
      id_4
  );
  assign modCall_1.type_4 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  assign module_3.id_3 = 0;
endmodule
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_4;
  always @(posedge 1) begin : LABEL_0
    if (1'b0) id_1 <= id_3;
    if (id_4) begin : LABEL_0
      id_1 <= id_3 * 1 - id_2;
    end
    id_1 <= ((id_4));
    force id_4 = module_3;
  end
  wire id_5;
  module_2 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
