module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5 = id_2,
    id_6
);
  input id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  logic id_7 (
      .id_5(id_6),
      .id_4(1),
      .id_5(id_2 || 1),
      .id_1(id_3),
      .id_1(id_4),
      .id_6(id_5),
      .id_5(1),
      .id_4(1),
      .id_2(id_5)
  );
  assign id_5[id_2] = id_2;
  always begin
    begin
      if (id_1)
        if (id_6) id_2 = id_2;
        else
          @(posedge id_7 or posedge id_4 or posedge id_2)
          case (id_4)
            id_5:  id_6 <= id_7;
            id_5: begin
              id_5 <= id_6;
            end
            id_8: begin
              begin
                id_8 <= id_8;
              end
              begin
                id_9 <= id_9;
                begin
                end
                begin
                  begin
                    @(posedge id_10 or posedge id_10) id_10 = id_10;
                  end
                  id_10 <= id_10;
                end
              end
              begin
              end
            end
            id_11: id_11 = id_11;
            id_11: begin
              if (id_11) id_11 = id_11;
              else begin
              end
            end
            id_12: begin
              id_12 <= id_12;
              @(posedge id_12[id_12]) begin
                begin
                end
              end
              id_13 <= 1;
            end
            id_14:
            if (id_14) begin
              @(posedge id_14) begin
              end
            end
            id_15: id_15 <= id_15;
          endcase
    end
  end
  id_16 id_17 (
      .id_18(id_18),
      .id_19(id_19)
  );
  id_20 id_21 (.id_17(id_18));
  id_22 id_23 (
      .id_17(id_19),
      .id_17(id_17),
      .id_18(id_19)
  );
  always
    if (id_18)
      #1
        @(id_21) begin
          #1 id_18 <= id_18;
        end
    else id_24 <= #1 id_24;
  id_25 id_26 (
      .id_24(1),
      .id_24(id_24),
      .id_27(id_24)
  );
  assign id_27 = 1;
  id_28 id_29 (
      .id_24(id_26),
      .id_26(id_26),
      .id_24(1)
  );
  id_30 id_31 (
      .id_32(id_29),
      .id_26(id_24)
  );
  id_33 id_34 (
      .id_26(id_24),
      .id_29(id_24),
      .id_32(id_27)
  );
  id_35 id_36 (
      .id_26(id_34),
      .id_34(id_34),
      .id_29(id_31)
  );
  logic id_37;
  id_38 id_39 (
      .id_24(id_37),
      .id_27(1 - id_27),
      .id_37(id_37)
  );
  logic id_40, id_41, id_42;
  id_43 id_44 (
      .id_37(id_42),
      .id_37(id_27),
      .id_29(id_37),
      .id_37(id_32),
      .id_34(id_32),
      .id_42(id_27),
      .id_26(id_40),
      .id_39(id_27)
  );
  id_45 id_46 (.id_41(id_24));
  id_47 id_48 (
      .id_26(id_36),
      .id_29(id_31[id_41] * id_40),
      .id_41(id_42),
      .id_32(1)
  );
  assign id_40 = id_26;
  id_49 id_50 (.id_24(1));
  id_51 id_52 (
      .id_31(id_34),
      .id_34(id_26),
      .id_39(id_29)
  );
  assign id_50 = id_29;
  id_53 id_54 (
      .id_31(id_36),
      .id_42(id_40),
      .id_39(id_31),
      .id_46(id_27),
      .id_40(id_24)
  );
  id_55 id_56 (
      .id_46(id_24),
      .id_29(id_36)
  );
  id_57 id_58 (
      .id_39(id_34),
      .id_36(1),
      .id_54(id_54),
      .id_37(id_56),
      .id_34(id_31),
      .id_34(id_50),
      .id_32(id_31),
      .id_29(id_48),
      .id_37(id_52)
  );
  id_59 id_60 (.id_52(1'h0));
  id_61 id_62 (
      .id_42(id_54),
      .id_56(id_58)
  );
  id_63 id_64 (
      .id_54(id_60),
      .id_39(1),
      .id_36(id_36[id_44]),
      .id_65(1),
      .id_32(id_36),
      .id_36(id_29),
      .id_24(id_34),
      .id_31(1),
      .id_50(id_39),
      .id_24(id_27),
      .id_65(id_32),
      .id_39(id_56)
  );
  logic [id_40 : 1] id_66;
  id_67 id_68 (.id_48(id_40));
  id_69 id_70 (
      .id_27(id_26),
      .id_39(1),
      .id_36(id_62),
      .id_42(1),
      .id_58(id_36),
      .id_64(1),
      .id_31(id_32)
  );
endmodule
