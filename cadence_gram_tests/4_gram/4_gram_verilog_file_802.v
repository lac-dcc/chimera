// Seed: 4077907512
module module_0 (
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
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_11;
  wire id_12;
  id_13(
      .id_0(-1), .id_1()
  );
  pulldown id_14 (id_6[-1'b0], $realtime);
  id_15(
      .id_0(-1'b0), .id_1(1), .id_2(1'h0)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wand id_5, id_6, id_7, id_8;
  wire  id_9;
  uwire id_10;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_9,
      id_5,
      id_3,
      id_7,
      id_10,
      id_2,
      id_10
  );
  always  @  ( $realtime or $realtime or  id_8  or  -1  or  -1  or $realtime or  negedge  id_3  [ $realtime ]  or  negedge  id_10  )  begin :LABEL_0
    id_5 = $realtime;
    id_2 = $realtime;
  end
endmodule
