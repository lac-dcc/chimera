// Seed: 3296486979
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  assign module_1.id_0 = 0;
  inout wire id_1;
  logic id_8;
endmodule
module module_1 (
    input tri0 id_0
);
  logic id_2;
  logic [-1 : 1] id_3;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3
  );
endmodule
module module_2 #(
    parameter id_0 = 32'd90
) (
    input  wire  _id_0,
    output logic id_1,
    output tri0  id_2
);
  always begin : LABEL_0
    id_1 = id_0;
    id_1 <= id_0;
    if ($realtime) @(posedge id_0);
  end
  logic [id_0 : 1 'b0] id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_4
  );
endmodule
