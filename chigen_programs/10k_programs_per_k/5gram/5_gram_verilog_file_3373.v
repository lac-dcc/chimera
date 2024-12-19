// Seed: 3248931092
module module_0 (
    input  supply1 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input  supply0 id_3
);
  initial begin : LABEL_0
    assume #1  (id_0) $display;
  end
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output wire id_1,
    input tri1 id_2,
    input tri id_3,
    input tri0 id_4,
    output wire id_5,
    input supply1 id_6
);
  wire id_8;
  assign id_0 = 1 - id_6 ? 1 : 1;
  assign id_0 = id_4 ? id_4 : 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_2
  );
  wire id_9;
endmodule
