// Seed: 1986594744
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always_ff @(posedge 1 or id_2) begin
    id_2 <= 1;
    id_4 <= id_2 == id_2;
  end
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    input supply1 id_0
    , id_8,
    input tri1 id_1,
    input wor id_2
    , id_9,
    input wand id_3,
    output tri id_4,
    input tri0 id_5,
    output tri1 id_6
);
  wire id_10;
  wire id_11;
  for (id_12 = id_9; 1; id_9++) begin : id_13
    always @(posedge id_9 or posedge 1) id_8 <= {1{id_8 > (id_5)}};
  end
  wire id_14;
  wire id_15;
  module_0(
      id_15, id_12, id_11, id_9
  );
  wire id_16;
  wor  id_17 = id_0;
  assign {id_1, id_1} = 1 == 1'h0;
endmodule
