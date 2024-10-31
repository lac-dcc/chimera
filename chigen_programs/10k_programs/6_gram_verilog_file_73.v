// Seed: 1494793176
module module_0 #(
    parameter id_4 = 32'd0,
    parameter id_5 = 32'd38
) (
    output uwire id_0,
    input tri1 id_1,
    output supply1 id_2
);
  assign id_2 = 1;
  defparam id_4.id_5 = 1;
endmodule
module module_1 (
    output tri   id_0,
    input  tri1  id_1,
    inout  tri0  id_2,
    output wor   id_3,
    input  tri1  id_4,
    input  tri0  id_5,
    output uwire id_6
);
  wire id_8;
  integer id_9;
  module_0(
      id_3, id_1, id_0
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge 1'h0 or posedge id_1) begin
    #1 #1;
    id_4 <= id_3;
    #1 id_3 = id_2;
    id_1 = ~id_3;
    id_2 <= 1'b0;
    id_2 <= id_2 - 1 ? id_2 : 1;
  end
  module_2(
      id_1, id_1, id_1, id_1, id_1
  );
endmodule
