// Seed: 4279648853
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri module_0,
    input tri1 id_6,
    input supply0 id_7,
    input supply1 id_8
);
  reg id_10;
  always @(negedge id_1) begin
    id_10 <= 1;
    assume #1  (id_7);
  end
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1
    , id_3
);
  initial
  fork : id_4
    assert (id_3);
    id_5;
    #1
    if ($display)
      assert (id_5);
      else if (1'b0) id_0 <= "";
      else id_3 <= #id_4 id_4;
  join : id_6
  module_0(
      id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1
  );
endmodule
