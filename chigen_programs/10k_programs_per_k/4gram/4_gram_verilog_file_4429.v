// Seed: 2506260755
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input tri1 id_2,
    output tri id_3,
    output uwire id_4
);
  wire id_6;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1
    , id_8,
    output uwire id_2,
    output supply0 id_3,
    input wor id_4,
    input tri id_5,
    input tri id_6
);
  wire id_9;
  localparam id_10 = 1;
  xnor primCall (id_3, id_0, id_8, id_10, id_6);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_2,
      id_3
  );
endmodule
module module_2 (
    input supply1 id_0,
    input supply1 id_1,
    output wire id_2,
    output logic id_3,
    inout tri1 id_4,
    output tri id_5
);
  always @(id_4 or negedge -1) id_3 = 1'd0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_5,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
