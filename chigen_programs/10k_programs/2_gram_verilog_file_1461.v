// Seed: 3721241320
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply1 id_8;
  assign id_7 = id_1 <-> {id_3, id_8} ? id_5 : 1'h0;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_9 :
  assert property (@(posedge 1'b0) id_3)
  else begin
    id_1 <= id_2;
  end
  module_0(
      id_9, id_9, id_9, id_9, id_6, id_6, id_7
  );
endmodule
