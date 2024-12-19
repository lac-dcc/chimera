// Seed: 3448604894
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  assign module_1.type_1 = 0;
  wire id_5;
endmodule
module module_1 (
    output wire id_0,
    output tri1 id_1,
    output wire id_2
);
  wand id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
  assign id_4 = 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_2 <= id_1;
    fork
      begin : LABEL_0
        disable id_5;
      end
    join
  end
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5
  );
endmodule
