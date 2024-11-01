// Seed: 1542558869
module module_2 (
    id_1,
    module_0,
    id_2,
    id_3,
    id_4
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0] id_6;
  assign id_6[1] = 1;
  logic [7:0] id_7;
  assign id_6 = id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  module_0(
      id_3, id_3, id_4, id_3, id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_3) begin
    if (id_4) begin
      disable id_6;
    end
  end
  module_0(
      id_4, id_4, id_5, id_4, id_4
  );
  assign id_1 = id_2;
endmodule
