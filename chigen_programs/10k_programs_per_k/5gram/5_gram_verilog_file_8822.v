// Seed: 1140745138
module module_0 (
    input uwire id_0,
    output uwire id_1,
    input tri id_2,
    input supply0 id_3,
    input tri id_4,
    output supply1 id_5,
    input wire id_6,
    input uwire id_7,
    input wor id_8,
    input wor module_0
);
  wire id_11;
  assign module_1.id_1 = 0;
  assign id_1 = id_9 ? 1 : id_9;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input wand id_2
);
  assign id_4 = id_2;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_2
  );
  wire id_6;
  supply1 id_7 = 1'h0;
  assign id_7 = 1;
  initial begin : LABEL_0
    assert (1);
  end
  task id_8;
    id_4 = id_0;
  endtask
endmodule
