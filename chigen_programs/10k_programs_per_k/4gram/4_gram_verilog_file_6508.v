// Seed: 3010865090
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  wire id_8 = id_3;
  wire id_9;
  assign id_2 = id_7;
  if (1'b0) begin : id_10
    wire id_11;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  assign id_4 = id_2;
  xnor (id_4, id_3, id_5);
  module_0(
      id_4, id_4, id_5, id_4, id_4, id_2
  );
endmodule
