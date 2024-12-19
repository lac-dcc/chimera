// Seed: 2404313275
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_8, id_9 = id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  tri0 id_6 = 1;
  always @(posedge 1) begin : LABEL_0
    id_6 = 1;
    forever begin : LABEL_0
      assume (1);
      if (id_1) id_2 <= id_5;
      else id_3 <= id_4;
    end
  end
  module_0 modCall_1 (
      id_6,
      id_1,
      id_1,
      id_6,
      id_1,
      id_1,
      id_6
  );
endmodule
