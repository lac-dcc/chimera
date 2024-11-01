// Seed: 1436801588
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    output uwire id_2
);
endmodule
module module_1 (
    output tri0 id_0,
    inout uwire id_1,
    input tri0 id_2,
    output uwire id_3,
    output tri1 id_4,
    input tri0 id_5,
    output supply1 id_6,
    input wor id_7,
    input wor id_8,
    output tri1 id_9
);
  wire id_11;
  wire id_12;
  module_0(
      id_5, id_4, id_9
  );
  wire id_13;
  assign id_0 = id_8;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire  id_4;
  wire  id_5;
  uwire id_6 = 1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_4 or(1)) begin
    id_2 <= 'b0;
  end
  module_2(
      id_4, id_4, id_3
  );
endmodule
