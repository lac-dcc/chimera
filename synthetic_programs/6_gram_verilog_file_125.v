module module_0 (
    id_1,
    input [id_1 : id_1] id_2
);
  assign id_1 = id_1;
  logic id_3;
  id_4 id_5 (
      .id_2(1),
      .id_4(1'b0)
  );
  assign id_3 = 1;
  assign id_1[1] = id_4;
  id_6 id_7 (
      .id_5(id_2),
      .id_1(1),
      ~id_3,
      .id_1(id_4),
      .id_6(1)
  );
  assign id_5 = id_5;
  id_8 id_9 (
      .id_1(id_1),
      .id_3(id_3[id_1]),
      .id_1(id_1)
  );
  id_10 id_11 (
      1,
      .id_1(1),
      .id_8(1),
      .id_1(id_1)
  );
  logic id_12;
  id_13 id_14 ();
  logic id_15;
  logic id_16 (
      .id_6 (1),
      .id_10(id_14 <= 1),
      .id_3 (id_9),
      .id_15(id_8)
  );
  logic [1  &  1 : 1]
      id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28;
  always @(1 or posedge id_5 or posedge 1'd0) begin
    if (id_26) begin
      id_27 = id_3;
      id_23 = id_21;
      id_8[id_11] = id_22;
      id_12[id_5] <= id_6;
      id_29(1);
      id_1[1] <= id_18;
      id_20   <= id_16;
      id_26   <= #id_30 id_27;
      id_31(id_11, id_31, id_22, id_30);
      if (1)
        if (id_1) id_10 <= ~id_7[id_27];
        else begin
          id_29[1] = 1;
          if (id_13) begin
            if (1) begin
              id_7[id_29] <= id_11[id_6];
            end
          end else if (id_32) id_32[1] <= {id_32 & 1, 1'b0};
        end
    end else begin
      id_33[id_33] <= id_33;
    end
  end
  function [id_34 : id_34] id_35;
    logic id_36;
    begin
      id_36 <= id_34[id_34] & id_36 & 1'b0 & 1'd0 & 1 & 1;
    end
  endfunction
  logic [id_37 : 1] id_38;
  id_39 id_40 (
      .id_38(id_37),
      id_41[id_38],
      .id_38(1)
  );
  logic id_42 (
      .id_39(~(id_37[id_40[id_41]])),
      .id_43(1),
      id_38
  );
  logic id_44;
  input [1 'b0 : id_44] id_45;
  logic id_46;
  logic id_47 (
      .id_38(id_43),
      .id_42(id_38),
      .id_42(id_38),
      id_39[id_44[id_39]]
  );
  logic id_48;
  logic id_49 = id_47;
  id_50 id_51 (
      (id_49),
      .id_45(1),
      .id_49(id_49),
      .id_39(~id_39),
      .id_44(id_40[id_50[id_46]] & id_40)
  );
  assign id_50 = 1;
  id_52 id_53 (
      .id_39(id_51),
      .id_43(1),
      .id_51(1),
      .id_46(id_44)
  );
  logic id_54;
  assign  id_45  =  id_41  ?  (  id_39  )  :  1  ?  id_43  :  id_51  [  1 'd0 ]  ?  id_43  :  id_45  [  1  +:  id_41  ]  ?  id_51  :  id_38  ?  1  :  1  ;
  logic id_55;
  logic id_56;
  logic id_57 (
      .id_52(1),
      .id_45(id_42),
      id_43
  );
  id_58 id_59 (
      .id_57(id_47[1'b0]),
      .id_38(id_57),
      .id_40(id_58)
  );
  logic id_60;
  id_61 id_62 (
      .id_59(id_45),
      .id_45(id_40)
  );
  id_63 id_64 (
      .id_40(1'b0),
      .id_40(id_61)
  );
  logic id_65;
  id_66 id_67 (
      .id_40(1),
      .id_45(1),
      .id_56(id_48),
      .id_47(1'b0),
      .id_59(id_53)
  );
  always @(posedge 1'b0 or posedge id_64) begin
    id_43 <= id_62[1];
  end
  id_68 id_69 (
      .id_68(id_70[1'b0 : (1)]),
      .id_68(id_68[id_71] ^ id_71[id_71]),
      .id_68(id_71)
  );
  id_72 id_73 (
      1,
      .id_70(id_70),
      .id_68(id_72[id_70])
  );
  id_74 id_75 (
      id_76,
      ~id_74[id_68[id_71]],
      .id_74(id_73)
  );
  id_77 id_78 (
      .id_70(id_69),
      .id_74(id_70),
      .id_70(1),
      .id_70(id_74),
      .id_72(id_74),
      .id_71(id_74)
  );
endmodule
