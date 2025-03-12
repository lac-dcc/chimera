// Seed: 3006656413
module module_0 (
    input supply0 id_0
);
  task id_2;
    begin : LABEL_0
      fork
        id_2 <= 1;
      join
    end
  endtask
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    output supply0 id_2,
    output wand id_3,
    input wire id_4
);
  wire id_6;
  module_0 modCall_1 (id_1);
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  assign module_3.id_1 = 0;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
endmodule
module module_3 #(
    parameter id_1 = 32'd35
) (
    _id_1,
    id_2
);
  inout wire id_2;
  not primCall (id_2, id_4);
  input wire _id_1;
  parameter id_3 = 1 & 1;
  wire [1 'b0 : id_1] id_4;
  module_2 modCall_1 (
      id_4,
      id_3,
      id_3
  );
  logic id_5;
  ;
endmodule
