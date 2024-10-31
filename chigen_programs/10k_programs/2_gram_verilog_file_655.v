// Seed: 2080674518
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  supply1 id_3;
  specify
    $setup(id_4, posedge id_5, 1);
    specparam id_6 = (id_3 + id_5) + "";
  endspecify
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always begin
    id_6 <= 1;
  end
  module_0(
      id_4, id_3
  );
  wire id_8;
  id_9 :
  assert property (@(posedge 1 or id_3) 1)
  else;
endmodule
