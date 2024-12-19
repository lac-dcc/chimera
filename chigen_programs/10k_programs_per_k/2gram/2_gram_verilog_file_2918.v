// Seed: 2218212625
module module_0 (
    output supply1 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wor id_3
);
  assign id_1 = id_2;
  wire id_5;
endmodule
module module_1 (
    output wor id_0,
    input wire id_1,
    output tri1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    input supply0 id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
  wire id_4;
endmodule
module module_3 (
    id_1
);
  inout wire id_1;
  if (id_1) begin : LABEL_0
    wire id_2;
    `define pp_3 0
    final begin : LABEL_0
      id_1 <= 1;
    end
  end else begin : LABEL_0
    assign id_1 = 1'b0;
    integer id_4;
    reg id_5 = 1'b0;
    wire id_6;
    assign id_5 = id_1;
    initial id_5 <= 1;
  end
  nor primCall (id_1, id_6, id_2);
  module_2 modCall_1 (
      id_6,
      id_4
  );
endmodule
