// Seed: 1261033146
module module_0 (
    id_1
);
  input wire id_1;
  always #1 begin
    wait (id_1);
  end
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
  module_0(
      id_3
  );
endmodule
module module_0 (
    id_1,
    module_2,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_6 = id_5;
  tri1 id_9;
  always @(1 or posedge id_2) begin
    id_4 <= id_8 - 1 ~^ id_9;
  end
  xnor (id_3, id_9, id_2, id_6, id_1, id_5);
  module_0(
      id_9
  );
  wire id_10;
endmodule
