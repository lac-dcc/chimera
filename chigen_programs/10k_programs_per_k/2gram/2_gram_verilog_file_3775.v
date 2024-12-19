// Seed: 610118073
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = 1;
  assign id_3 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_2,
      id_4,
      id_5
  );
  initial begin : LABEL_0
    `define pp_9 0
    @(id_2 & id_3 | id_2 - 1) id_6[1] <= 1;
    id_4 = id_7;
    if (1'b0) `pp_9 = `pp_9;
    else @(posedge 1 + `pp_9) id_2 = 1;
  end
  assign id_5 = 1'd0;
endmodule
