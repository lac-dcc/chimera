// Seed: 4037396495
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  generate
    assign id_1 = 1'd0;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_1;
  assign id_1 = 1;
  wire id_4;
  wire id_5;
  tri1 id_6 = {id_3{1}};
  module_0(
      id_3, id_1
  );
endmodule
module module_2 (
    output uwire id_0,
    input  uwire id_1,
    input  wire  id_2,
    output tri0  id_3,
    input  wor   id_4,
    input  tri1  id_5,
    input  uwire id_6,
    input  uwire id_7
);
  generate
    assign id_3 = 1;
  endgenerate
endmodule
module module_3 (
    input  supply0 id_0,
    input  logic   id_1,
    output logic   id_2,
    output supply1 id_3,
    input  logic   id_4
);
  reg id_6;
  assign id_2 = id_1;
  module_2(
      id_3, id_0, id_0, id_3, id_0, id_0, id_0, id_0
  );
  initial begin
    if (1) begin
      id_6 <= id_4;
      id_3 = 1;
      id_2 <= id_1;
    end
    id_6 <= #id_0 1;
    id_2 <= 1;
    assign id_3 = 1'd0;
  end
  assign id_2 = id_1 + id_4;
endmodule
