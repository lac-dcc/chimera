// Seed: 1310294889
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input wor id_2,
    input supply1 id_3,
    output wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    input wor id_7,
    input supply0 id_8,
    output tri1 id_9
);
  wire id_11;
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1,
    output wor   id_2
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_8 = id_6;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_11 :
  assert property (@(posedge 1'd0) 1)
  else $display(id_10);
  assign id_9 = id_11;
  initial begin : LABEL_0
    fork
      if (id_6) id_5 <= id_5;
      id_11 <= 1;
      if (1) id_4 <= 1'h0;
      else begin : LABEL_0
        fork
          assume #1  (id_5) $display;
          else;
          id_12;
        join
      end
    join
  end
  module_2 modCall_1 (
      id_8,
      id_10,
      id_1,
      id_10,
      id_10,
      id_10,
      id_7,
      id_7,
      id_10,
      id_1
  );
endmodule
