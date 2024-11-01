// Seed: 1308846282
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  id_6(); module_2(
      id_4, id_5, id_4, id_4, id_4
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  module_0(
      id_5, id_3, id_5, id_5, id_4
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
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  supply0 id_6 = ({1, 1});
  id_7 :
  assert property (@(posedge id_3) id_5 | id_4)
  else $display(1);
  wire id_8;
endmodule
